class DevelopItemsCurriculum < DevelopCurriculum
  has_many :develop_items, inverse_of: :develop_curriculum, foreign_key: 'develop_curriculum_id'
  has_many :editions
end