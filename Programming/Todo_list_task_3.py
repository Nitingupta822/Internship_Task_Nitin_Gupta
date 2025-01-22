"""
Internship Task - Python #3
Task Title : Todo List App
Task Overview:
You will develop a simple todo list application that saves tasks, allowing users to view and manage their tasks. The app will include functionalities for adding new tasks, editing existing tasks, and deleting tasks.
Allow users to:
▪ Add new tasks.
▪ Edit existing tasks.
▪ Remove tasks.
▪ List all task
Store Task Title - ex. Meeting at 9pm
Store Task status - New, In Progress, Completed, Cancelled
When Added the task will be by default in New state
"""
li = []
l = len(li)
print("Welcome to Todo List App")

while True:
    print("1. Add new task")
    print("2. Edit existing task")
    print("3. Remove task")
    print("4. List all task")
    print("5. Exit")
    choice = input("Enter your choice: ")
    
    if choice == "1":
        task_title = input("Enter task title: ")
        task_status = "New"
        li.append({"title": task_title, "status": task_status})

    elif choice == "2":
        id = int(input("Enter task id to edit: "))
        task_title = input("Enter task title to edit: ")
        task_status = input("Enter task Status : ")
        li[id]['title'] = task_title
        li[id]['status'] = task_status

    elif choice == "3":
        id = id = int(input("Enter task id you Want to remove : "))
        li.remove(li[id])

    elif choice == "4":
        for task in li:
            print(f"Index : {li.index(task)}, Task Title: {task['title']}, Task Status: {task['status']}")
            print()
        
    else:
        break;
    
    
       
        
        

