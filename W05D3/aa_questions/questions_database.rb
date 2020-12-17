require 'singleton'
require 'sqlite3'

class QuestionsDatabase < SQLite3::Database
    include Singleton
    
    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end
end

class Users 
    attr_reader :id, :fname, :lname
    def initialize(options = {})
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end
    def find_by_id(id)
        
    end
    def find_by_name(fname, lname)
    end

end

class Questions

    def initialize
    end

    def find_by_id
    end

    def find_by_title
    end

    def find_by_author_id
    end

end

class QuestionsFollows

    def initialize
    end

end

class Replies

    def initialize
    end

    def find_by_id
    end

    def find_by_user_id
    end

    def find_by_question_id
    end

end

class QuestionLikes

    def initialize
    end

    def find_by_id
    end

end

