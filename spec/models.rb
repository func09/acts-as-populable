class Simple < ActiveRecord::Base
  acts_as_populable :simple, :calcurate_score
  protected
    def calcurate_score
      return self.point
    end
end

class Post < ActiveRecord::Base
  acts_as_populable :all, :calcurate_score_all
  acts_as_populable :weekly, :calcurate_score_weekley
  protected
    def calcurate_score_all
      return self.point
    end
    def calcurate_score_weekley
      return self.point
    end
end

class Comment < ActiveRecord::Base
  belongs_to :post
end

class AccessLog < ActiveRecord::Base
  belongs_to :post
end

