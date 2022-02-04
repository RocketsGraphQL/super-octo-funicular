---
title: Permissions
description: ''
position: 5
category: Guide
---

## Todos table with Auth
A todo should belong to a user and only be visible to that user. Before we do that all existing todos must be deleted. To delete all existing todos, click `Browse Rows` for the `todos` table, select all todos and click on the trash can icon.

That deleted all todos. Now let's add the new `user_id` column.

Click on Modify and then click the button Add a new column. Name the new column `user_id` with the type `UUID`. Make sure to uncheck Nullable. Click Save.

> user_id refers to the id of the user the todo belongs to.

![image info](/assets/create_fkey.png)

For our GraphQL API and database to understand that the user_id refers to the user's id we need to create a Foreign Key.

> A Foreign key is a link between two tables

Scroll to Foreign Keys and click Add. Check the image below.

![image info](/assets/add_fkey.png)

For Hasura to use the foreign key relation in the GraphQL API, we need to track the foreign key relationship. Go to the DATA tab and click Track all.

Add image to track here

## Permissions for users

### Remove permissions for the public role
We won't use the public role anymore, so let's remove all permission for that role. See the image below.

![image info](/assets/permissions_remove_public.png)

Now we'll add permissions for the `user` role.

> All logged-in users have the user role.


### insert
A user can only insert name because all other columns will be set automatically. More specifically, user_id will be set to the id of the user making the request (x-hasura-user-id) and is configured in the Column presets section. See the image below.

![image info](/assets/user_insert_permissions.png)


### select
For Select permission, set a custom check so users can only select todos where user_id is the same as their user id. In other words: users are only allowed to select their own todos. See the image below.

![image info](/assets/select_permissions.png)