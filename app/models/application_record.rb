class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  # checkboxで送られてくる0 or 1をTrue or Falseに変換
  def checked?(data)
    ActiveRecord::Type::Boolean.new.cast(data)
  end
end
