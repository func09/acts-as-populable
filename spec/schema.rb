ActiveRecord::Schema.define :version => 0 do
  
  create_table :comments, :force => true do |t|
    t.integer   "post_id"
    t.datetime  "created_at"
    t.datetime  "updated_at"
  end
  
  create_table :access_logs, :force => true do |t|
    t.integer   "post_id"
    t.datetime  "created_at"
    t.datetime  "updated_at"
  end
  
  create_table :simples, :force => true do |t|
    t.integer "point"
    t.datetime  "created_at"
    t.datetime  "updated_at"
  end
  
  create_table :posts, :force => true do |t|
    t.datetime  "created_at"
    t.datetime  "updated_at"
  end
  
  create_table :rankings, :force => true do |t|
    t.integer   "populable_id"
    t.string    "populable_type"
    t.integer   "score"
    t.string    "ranking_name"
    t.datetime  "created_at"
    t.datetime  "updated_at"
  end
  
end