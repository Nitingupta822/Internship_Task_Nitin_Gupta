"""
Build a News Feed with Pagination
1. Add news details
2. List news
3. Exit app
After option 1 section app should ask
Enter News Title
Enter News details
Enter Photo path or url
"""

li = []

while True:
    print("")
    print("1. Add news details")
    print("2. List news")
    print("3. Exit app")

    option = int(input("Enter your option: "))
    
    if option == 1:
        print("Enter News Title")
        title = input()
        print("Enter News details")
        details = input()
        print("Enter Photo path or url")
        photo = input()
        print("News added successfully")
        li.append({"title": title, "details": details, "photo": photo})
        
    elif option == 2:
        if not li:
            print("No news available !")
        else:
            for i in li:
                print("*"*50)
                print(i)
            
    else:
        break
    
    


