===========================
FriendMap API Documentation
---------------------------

<code>post '/api/rrlogin.json',to:"users#rrlogin"</code>

<code>post '/api/photos.json', to:"photos#create"</code>

<code>get '/api/photos/:uid.json', to:"photos#my"</code>
<code>get '/api/photos/:uid/city/:city.json', to:"photos#city"</code>
<code>get '/api/photos/:uid/friends.json', to:"photos#friends"</code>
<code>get '/api/friendIds/:uid.json', to:"friends#ids"</code>
<code>get '/api/friendDetails/:uid.json', to:"friends#details"</code>
<code>get '/api/invitors/:uid.json', to:"requests#invitor"</code>
<code>get '/api/invitees/:uid.json', to:"requests#invitee"</code>
<code>get '/api/accept/:uid/with/:fid.json', to:"requests#accept"</code>
<code>get '/api/renrenfriends/:uid/:pageSize/:pageNumber.json', to:"friends#renren"</code>

