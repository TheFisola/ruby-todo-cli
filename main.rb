require 'colorize'

BASE_CLI_NAME = "ruby-todo-cli"

def help_view
    puts "\nThis is the help menu. All commands available: \n".light_yellow
    puts "--view, -v                                Gets all tasks".light_blue
    puts "--create -c    <DESCRIPTION>              Create a task".light_blue
    puts "--start, -s    <TASK_ID>                  Start a particular task".light_blue
    puts "--done, -d     <TASK_ID>                  Mark a particular task as done".light_blue
    puts "--delete, -d   <TASK_ID>                  Delete a particular task".light_blue

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

def validate_arg_lenght(minimum_arg_len)
    raise StandardError, "This command expects at least #{minimum_arg_len} argument#{minimum_arg_len > 1 ? 's': ''}!".red unless ARGV.length >= minimum_arg_len
end

def process_args(args)
    validate_arg_lenght(1)
    main_command = args[0]
    case main_command
        when "--help", "-h"
            help_view

        when "--view", "-v"
            puts "View Of All Tasks".light_blue  

        when "--create", "-c"
            validate_arg_lenght(2)
            puts "Creating new task With description '#{args[1]}'....".light_blue

        when "--start", "-s"
            validate_arg_lenght(2)
            puts "Marking task as in progress....".light_blue      
            
        when "--done", "-d"
            validate_arg_lenght(2)
            puts "Marking task as done....".light_blue  
            
        when "--delete", "-d"
            validate_arg_lenght(2)
            puts "Deleting task....".light_blue      

        else 
            puts "Invalid Command, Please use '-h' or '--help' to view all available commands".red
    end
    
    rescue StandardError => e
        puts e.message    
end


process_args(ARGV)