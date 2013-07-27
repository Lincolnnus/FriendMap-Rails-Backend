===========================
2013 Baidu Open Cloud Hackathon FriendMap API Documentation
---------------------------

This API is developed for both the iOS/Android platform and the web client.
To return json data from the apis, please add .json to each request
For instance, to get the json response from photos of uid in a particular city
<code>get '/api/photos/:uid/city/:city.json'</code>

```
Check uid from renren creteria
<code>get '/api/rrlogin'</code>
Required fields: rrid(renren id),name,thumbnail,token(renren authentication token)
Return user object with id
```

```
Upload photos from clients
<code>post '/api/photos'</code>
Required fields: uid,img(file field),lat(latitude),lng(longitude),city,province
Return photo object with id
```

```
Get photos of uid
<code>get '/api/photos/:uid'</code>
Required fields: uid
Return array of photo objects of user with uid = :uid
```

```
Get photos of uid in a particular city
<code>get '/api/photos/:uid/city/:city'</code>
Required fields: uid
Return array of photo objects of user with uid = :uid and city = :city
```

```
Get the city history of a particular user
<code>get '/api/photos/:uid/cities'</code>
Required fields: uid
Return array of photo objects of user with uid = :uid
```

```
Get photos of uid in a particular province
<code>get '/api/photos/:uid/province/:province'</code>
Required fields: uid
Return array of photo objects of user with uid = :uid and province = :province
```

```
Get the province history of a particular user
<code>get '/api/photos/:uid/provinces'</code>
Required fields: uid
Return array of photo objects of user with uid = :uid
```

```
Get the friends' photos of a particular user 
<code>get '/api/photos/:uid/friends', to:"photos#friends"</code>
Required fields: uid
Return array of photo objects of friends' photo of a particular user
```

```
Get the friends' ids of a particular user
<code>get '/api/friendIds/:uid'</code>
Required fields:uid
Return array of uids of a parcicular user's friends
```

```
Get the friends' details of a particular user
<code>get '/api/friendDetails/:uid'</code>
Required fields: uid
Return array of friends' details of a parcitular user
```

```
Get all the requests from a particular user
<code>get '/api/invitors/:uid'</code>
Required fields: uid
Return array of requests from a particular user
```
```
Get all the requests to a particular user
<code>get '/api/invitees/:uid'</code>
Required fields: uid
Return array of requests to a parciular user
```

```
Accept the request
<code>get '/api/accept/:uid/with/:fid'</code>
Required fields: uid, fid(rrid,wbid,etc)
Add the relationship to the friend table and delete the request
```
```
Get rrfriends ids
<code>get '/api/renrenfriends/:uid/:pageSize/:pageNumber', to:"friends#renren"</code>
Required fields: uid, pageSize, pageNumber
Return list of friends
```

