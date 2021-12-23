class Response <ApplicationRecord

    belongs_to :respondant,
        primary_key: :id,
        foreign_key: :respondant_id,
        class_name: 'User'

    belongs_to :answer_choice,
        primary_key: :id,
        foreign_key: :answer_choice_id,
        class_name:'AnswerChoice'

    has_one :question,
        through: :answer_choice,
        source: 'Question'

end