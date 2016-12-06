class NumericAnswer < ApplicationRecord
  belongs_to :selection, polymorphic: true, optional: true
  belongs_to :response
end
