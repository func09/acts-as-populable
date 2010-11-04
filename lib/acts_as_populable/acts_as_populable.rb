module ActsAsPopulable
  module Populable
    def populable?
      false
    end
    def acts_as_populable(ranking_name, calculator)
      if populable?
        ranking_calculators["#{self.to_s}_#{ranking_name}".downcase] = calculator.to_sym
      else
        ranking_calculators = {}
        class_inheritable_reader(:ranking_calculators)
        ranking_calculators["#{self.to_s}_#{ranking_name}".downcase] = calculator.to_sym
        class_eval do
          has_many :rankings, {:as => :populable, :dependent => :destroy}
          def populable?
            false
          end
          def order_by_rank(ranking_name)
            select(%{*, rankings.score, #{self.table_name}.id AS id}).
              joins(%{INNER JOIN rankings ON rankings.populable_id = #{self.table_name}.id AND rankings.populable_type = '#{self.to_s}' AND rankings.ranking_name = #{ranking_name}}).
              order('rankings.score DESC')
          end
        end
      end
    end # end acts_as_populable
  end # end Populable
end