# VideoChat2Gether

It's a simple room creator where you can chat and watch videos among your friend who join you.

## How to install

### Linux
1. Download the files.
2. On the root folder, open a terminal.
```
$ sudo docker-compose build
```
3.
```
$ sudo docker-compose up
```
4.
```
$ sudo docker-compose run web rake db:create
```
5. Access the home page from http://localhost:3000/

## How to use
1. It's pretty intuitive. Just follow the forms and buttons.
2. Everyone who has the link can enter on the room.
3. All chats has a modders room. There someone must approve or refuse the messagens. To access the respective pages, just add /mod after the room's link.

### Notes
1. The nicknames are temporarily.
2. There's no authentication to enters on the moderater's room.
