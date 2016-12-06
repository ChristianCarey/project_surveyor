class NumericAnswer < ApplicationRecord
  belongs_to :selection, polymorphic: true
  belongs_to :response
end
