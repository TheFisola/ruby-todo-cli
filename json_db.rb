require 'json'

class JsonDB

    def initialize(file_path)
        @file_path = file_path
        setup_storage
    end
    
    def find(key)
        @storage[key] 
    end 

    def find_all()
        @storage
    end 

    def save(key, value)
        @storage[key] = value
        sync_to_file
    end
    
    def delete(key)
        @storage.delete(key)
        sync_to_file
    end

    private

    def setup_storage
        if(!File.file?(@file_path))
            File.write(@file_path, JSON.dump({}))    
        end    

        file = File.read(@file_path)
        @storage = JSON.parse(file)
    end
    
    def sync_to_file
        File.write(@file_path, JSON.dump(@storage))
    end    
     
end    