require_relative 'todo_service'
require 'colorize'

# Move to .env file
BASE_CLI_NAME = "ruby-todo-cli"

def help_view
    puts "\nThis is the help menu. All commands available: \n".light_yellow
    puts "--view, -v                                Gets all tasks".light_blue
    puts "--create -c    <DESCRIPTION>              Create a task".light_blue
    puts "--start, -s    <TASK_ID>                  Start a particular task".light_blue
    puts "--done, -d     <TASK_ID>                  Mark a particular task as done".light_blue
    puts "--remove, -r   <TASK_ID>                  Remove a particular task".light_blue

    puts "\nExample Usages:".light_yellow

    puts "\n- View all tasks".light_blue
    puts "#{BASE_CLI_NAME} -v".magenta
    puts "or"
    puts "#{BASE_CLI_NAME} --view".magenta

    puts "\n- Creating a task for doing your laundry".light_blue
    puts "#{BASE_CLI_NAME} -c 'Do my laundry'".magenta
    puts "or"
    puts "#{BASE_CLI_NAME} --create 'Do my laundry'".magenta

    puts "\n- Starting a task".light_blue
    puts "#{BASE_CLI_NAME} -s 'the-randomly-generated-task-id'".magenta
    puts "or"
    puts "#{BASE_CLI_NAME} --start 'the-randomly-generated-task-id'".magenta

    puts "\n- Marking a task as done".light_blue
    puts "#{BASE_CLI_NAME} -d 'the-randomly-generated-task-id'".magenta
    puts "or"
    puts "#{BASE_CLI_NAME} --done 'the-randomly-generated-task-id'".magenta

    puts "\n- Deleting a task".light_blue
    puts "#{BASE_CLI_NAME} -d 'the-randomly-generated-task-id'".magenta
    puts "or"
    puts "#{BASE_CLI_NAME} --done 'the-randomly-generated-task-id'".magenta

    puts("\n")
    
end

def print_tasks(tasks)
    if(tasks.length == 0)
        puts "You currently have no tasks!".magenta
        return
    end

    format = '%-4s %-40s %-12s %-20s %-20s'
    puts (format % ['Id', 'Description', 'Status', 'Created At', 'Updated At']).magenta
    tasks.each do |task|
        puts (format % [ task["id"], task["description"], task["status"], task["created_at"], task["updated_at"]]).magenta
    end
end

def view_tasks
    
end    

def validate_arg_lenght(minimum_arg_len)
    raise StandardError, "This command expects at least #{minimum_arg_len} argument#{minimum_arg_len > 1 ? 's': ''}!" unless ARGV.length >= minimum_arg_len
end

def process_args(args)
    todo_service = TodoService.new
    validate_arg_lenght(1)
    main_command = args[0]
    case main_command
        when "--help", "-h"
            help_view

        when "--view", "-v"
            puts "\nView Of All Tasks...\n".light_blue
            tasks = todo_service.view_tasks
            print_tasks(tasks)

        when "--create", "-c"
            validate_arg_lenght(2)
            puts "\nCreating new task with description '#{args[1]}'....\n".light_blue
            tasks = todo_service.create_task(args[1])
            print_tasks(tasks)

        when "--start", "-s"
            validate_arg_lenght(2)
            puts "\nMarking task with id '#{args[1]}' as in progress....\n".light_blue
            tasks = todo_service.start_task(args[1])
            print_tasks(tasks)      
            
        when "--done", "-d"
            validate_arg_lenght(2)
            puts "\nMarking task with id '#{args[1]}' as done....\n".light_blue
            tasks = todo_service.mark_task_as_done(args[1])
            print_tasks(tasks)    
            
        when "--remove", "-r"
            validate_arg_lenght(2)
            puts "\nRemoving task with id '#{args[1]}'....\n".light_blue
            todo_service.remove_task(args[1])      

        else 
            puts "\nInvalid Command, Please use '-h' or '--help' to view all available commands\n".red
    end
    
    puts "\nAll Done!\n".green

    rescue StandardError => e
        puts e.message.red
        puts   
end


process_args(ARGV)