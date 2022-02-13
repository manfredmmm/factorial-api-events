# factorial-api-events

REST API project done with Ruby on Rails and PG database.

You will need postgresql, ruby and rails installed on your machine.

Go to the directory and run the following commands in order to setup the API:

```bash
bundle install
rake db:create
```

And start the development server:
```bash
rails s
```

---

Now, you can create, update, delete, list and show the events. Title, start_date and end_date for each event are always mandatory:

CREATE:
```bash
curl --header "Content-Type: application/json" POST --data '{"title": "T2 event", "start_date": "1644609488", "end_date": "1644613890" }' http://localhost:3000/api/v1/events -v
```
UPDATE:
```bash
curl --header "Content-Type: application/json" -X PUT --data '{"title": "T2_updated", "start_date": "1644659510", "end_date": "1644673910"}' http://localhost:3000/api/v1/events/
9 -v
```
DELETE:
```bash
curl --header "Content-Type: application/json" -X DELETE  http://localhost:3000/api/v1/events/3 -v
```
LIST:
```bash
curl --header "Content-Type: application/json" GET http://localhost:3000/api/v1/events -v
```
SHOW:
```bash
curl --header "Content-Type: application/json" GET http://localhost:3000/api/v1/events/1 -v
```
