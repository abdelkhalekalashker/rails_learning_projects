class Question <ApplicationRecord

    has_many :choices,
        primary_key: :id,
        foreign_key: :question_id,
        class_name: 'AnswerChoice'

    belongs_to :poll,
        primary_key: :id,
        foreign_key: :poll_id,
        class_name: 'Poll'

    has_many :response,
        through: :answer_choice
        source: 'Response'

end