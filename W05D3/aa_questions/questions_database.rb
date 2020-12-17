require 'singleton'
require 'sqlite3'

class QuestionsDBConnection < SQLite3::Database
    include 'singleton'
    
    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end
end

class Questions
    
end