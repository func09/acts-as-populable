module ActsAsPopulable
  class Ranking < ::ActiveRecord::Base
    
    attr_accessible :score, :ranking_name
    
    ### ASSOCIATIONS:
    
    belongs_to :populable, :polymorphic => true
    
    ### VALIDATIONS:
    
    validates_presence_of :populable
    validates_numericality_of :score, :ranking_name
    
    #
    # @params target
    # @params ranking_name
    def self.update(target, ranking_name)
      logger.info "target:#{target} range:#{range}"
      start_time = Time.now
      begin
        klass = target.constantize
        if klass.populable?
          Ranking.transaction do
            Ranking.where(:populable_type => target, :ranking_name => ranking_name).delete_all
            params = {:populable_type => target, :ranking_name => ranking_name}
            klass.find_each do |instance|
              ranking = Ranking.create(params.merge({
                :populable_id => instance.id,
                :score => instance.send(klass.ranking_calculators["#{target}_#{ranking_name}".downcase], {:start_time => start_time})
              }))
              p ranking
            end
          end
        end
      rescue => e
        logger.error e
      end
    end
  end
end