require_relative 'json_db'
require 'date'
require 'securerandom'

# Move to .env file
DEFAULT_FILE_PATH = "database.json"
TASK_DB_KEY = "tasks"

class TodoService

    def initialize
        @db = JsonDB.new(DEFAULT_FILE_PATH)
        @tasks  = @db.find(TASK_DB_KEY)
        @date_time = Time.now.strftime("%Y-%m-%d %H:%M:%S")
        if(@tasks.nil?)
            @tasks = []
        end 
    end
    
    def view_tasks
        @tasks
    end   

    def create_task(description)
        newTask = {
            "id" => self.next_id,
            "description" => description,
            "status" => "TODO",
            "created_at" => @date_time,
            "updated_at" => nil
        }
        
        @tasks.push(newTask)
        persist_tasks
        return [newTask]
    end

    def start_task(id)
        set_task_status(id, "IN PROGRESS")
    end

    def mark_task_as_done(id)
        set_task_status(id, "DONE")
    end
    
    def remove_task(id)
        @tasks = @tasks.select  {|task| task["id"] != id.to_i}
        persist_tasks
    end
    
    private

    def next_id
        if(@tasks.length == 0)
            return 1
        end
        @tasks[@tasks.length - 1]["id"].to_i + 1
    end    

    def persist_tasks
        @db.save(TASK_DB_KEY, @tasks)
    end    

    def set_task_status(id, status)
        task_match = nil
        @tasks = @tasks.map do |task|
            if(task["id"] == id.to_i)
                task["status"] = status
                task["updated_at"] = @date_time
                task_match = task
            end
            task   
        end
        raise StandardError, "A task with id: '#{id}' does not exist!" unless !task_match.nil? 
        persist_tasks
        return [task_match]
    end    
end    