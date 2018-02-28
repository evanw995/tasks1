# Tasks1

## Header bar
- Display whether or not user is logged in (and who they are logged in as, if they are)
- If not logged in, have tabs for Log in page, Users page, and See All Tasks Page
- If logged in, have option to log out, as well as tabs for Home page, See Your Tasks page, Add a new task page, Users page, and See All Tasks page

## Home/Log in page
- Display welcome message if logged in
- Display log in page if not logged in
- Users log in using their user name and ID. This is because two users can have the same name. I think this part of the design will change if/when we add passwords. Perhaps logging in via ID & password only, or signing in via email/password (This might be nice, as it could allow us to send password reset emails).
- Users can check the list of users if they forget their ID.
- Users can also click to register as a new user (takes them to New User page)
- Upon logging in, users are redirected to the page showing all the tasks that are assigned to them ("See your tasks" page) 

## New user page
- Users register using a name (cannot be blank)
- Upon submitting, users are taken to their profile page, showing their username, ID, and a link to log in with their new credentials
- Attempting to delete an account will prompt a popup message asking "Are you sure?"
- When a user is deleted, the tasks assigned to them will remain active but will now show "No User Assigned"

## See Your Tasks Page
- Users will see a list of Incomplete tasks assigned to them, followed by a list of complete tasks assigned to them.
- Each task listing will display the task's title, description, and time spent on the task. A link is then present to edit the task.

## Edit task page
- Task title and description are shown, but cannot be edited.
- If the task is assigned to the current user, the user can update the amount of time they have spent on the task, in 15 minute increments
- If the task is assigned to the current user, the user can update whether or not the task is completed
- Users can update which user the task is assigned to
- Confirm button submits changes and takes viewers to the View Task Page
- If the user is not logged in, this page will display a link to the Log in page, telling the user they need to log in to edit the task

## See All Tasks Page
- Shows a table of Incomplete tasks, followed by a table of complete tasks
- Table entries show task name, time spent on the task, and the assignee (if there is no assignee, task will display "No user assigned")
- Anyone can view tasks
- Only logged in users can edit/delete tasks
- Delete functionality may be restricted to admins in later versions, but since there is currently no user hierarchy, any user can delete and reassign tasks

## Add a new Task Page
- Users must be logged in to create new tasks
- Adding a new task consists of entering a title (required), description (required), and assigning the task to a user (optional)
- Submit takes them to the new task's view task page

## View Task page
- Displays task title in large font, followed by task description, who the task is assigned to, time spent on the task, and whether or not the task is completed
- There is a link at the bottom to edit the task
- Another link at bottom to go back to the See All Tasks Page

## Users page
- Lists all users registered to the site.
- Shows usernames and ID for each user. An option to view profile is also available (this contains the same information, name and ID, but could be useful later if users develop more complicated profiles)
- If the user is logged in, they will see the option to edit their username and also delete themselves as a user.

## Edit User Page
- Displays username at the top
- User must be logged in as that user to edit their name

## Managers
-When viewing the Users page (while logged in), users have the option to designate themselves as a manager of another user by clicking "Manage." To undo this, users simply click the "Unmanage" button.
-Only managers of a user's task can reassign tasks to other users
-If the task is not assigned to anyone, anyone can reassign the task

## Timeblocks
-When viewing a task, a list of timeblocks will be displayed on screen
-Each block includes a start time, end time, and the difference between the two (time spent on task, in minutes)
-When viewing tasks, the Total Time Spent field is an accumulation of all the timeblocks associated with that task
-Users can edit Timeblocks after creating them
