# The real DevOps challenge 
Solution developed by Lydia Ramos :D 

### Challenge 1. The API returns a list instead of an object

Firstly, I've corrected the `find_restaurants` method located in mongoflask.py so it uses the correct ID:
    `query["_id"] = ObjectId(id)` to `query["_id"] = ObjectId(_id)`

Secondly, I have modified this method so it returns a json object if it finds just one result, a 204 if it doesn't find any restaurant 
that matches the ID or a list of restaurants if we don't receive any ID:

    def find_restaurants(mongo, _id=None):
     query = {}
     if _id:
         query["_id"] = ObjectId(_id)
         result = mongo.db.restaurant.find_one(query)
         if (result is None):
             return 'No content', 204
         else:
             return result
     else:
         return list(mongo.db.restaurant.find(query))

### Challenge 2. Test the application in any cicd system

In this case, I've decided to use (and learn, because I've never ever used it) CircleCI!

CircleCI is simpler than I thought it'd be. You just need to create (or link) an account in their website, 
link your GitHub project and init a config.yml file with an empty or default circleCI template. 
Soooo... Let's analyze our prerequisites! For this challenge we'll need:
- A running MongoDB (I've used mongo:4.4.6)
- A primary container for the build job (I've used circleci/python:3.6.4, the one circleCI gives you in their default python config template). 
- Well defined steps! 

You could check the config file in .circleci/config.yml

NOTES: I've removed python versions 2.7,3.4 and 3.5 from tox.ini so it didn't took me such a long time to do the challenges.

### Challenge 3. Dockerize the APP

It's been a while since I last developed a Dockerfile but it's never too late to remember and refresh some key concepts!

I've used a python:3.6.4 as base image to solve this challenge and I've followed [Docker Docs](https://docs.docker.com/language/python/build-images/)
 steps for a Python app :D 
 
To build the image you just need to type the following on your terminal :
`docker build --tag <image-name> <dockerfile-location>`

### Challenge 4. Dockerize the database

I've added a new folder `/mongo`, where I've created a Dockerfile and a init.sh file. I've also moved `/data` folder inside it so I could copy `restaurant.json` file into our dockerized MongoDB.

Inside `init.sh`, I've imported `restaurant.json` inside `/docker-entrypoint-initdb.d/` because [this ensures that the initialization scripts will only run once](https://github.com/docker-library/mongo/pull/145)

### Challenge 5. Docker Compose it

### Final Challenge. Deploy it on kubernetes
