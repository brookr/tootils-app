var theirFollowers  = []
var theirFollowings = []
var theirMutuals    = []
var myFollowers     = []
var myFollowings    = []
var myMutuals       = []
var sharedMutuals   = []
var them            = ''
var me              = $('#me_name').html()


Api = {
  get_their_followers: function() {
    theirFollowers = []
    Api.load_followers('them', -1)
  },
  get_my_followers: function() {
    myFollowers = []
    Api.load_followers('me', -1)
  },
  get_their_followings: function() {
    theirFollowings = []
    Api.load_followings('them', -1)
  },
  get_my_followings: function() {
    myFollowings = []
    Api.load_followings('me', -1)
  },
  load_followers: function(who, curs) {
    $.get('http://twitter.com/followers/ids.json',
      { screen_name: eval(who), cursor: curs },
      function(data, status) {
        resp = data
        if (who == 'me')
          myFollowers = myFollowers.concat(data.ids)
        else
          theirFollowers = theirFollowers.concat(data.ids)
        
        if (data.next_cursor == 0) {
          if (who == 'them') {
            theirMutuals  = intersect(theirFollowings, theirFollowers)
            sharedMutuals = intersect(myMutuals, theirMutuals)
            $('#hovermesh .fers').html(
              '<span class="stat" title="The number who follow both ' + me + ' and ' + them + '">' + 
              intersect(myFollowers, theirFollowers).length + 
              '</span> <span class="type">shared<br />followers</span>')
            $('#hovermesh .mutuals').html(
              '<span class="stat">' + 
              theirMutuals.length + 
              '</span> <span class="type" title="How many both follow and are followed by ' + them + '">recip-<br />rocal</span>')
            $('#hovermesh .shared').html(
              '<span class="stat">' + 
              sharedMutuals.length + 
              '</span> <span class="type" title="Reciprocal overlap: how many follow and are followed by both ' + 
              me + ' and ' + them + '">shared<br />recips</span>')
          }
          else {
            myMutuals = intersect(myFollowers, myFollowings)
          }
        }
        else {
          Api.load_followers(who, data.next_cursor)
        }
      },
      'json'
    )
  },
  load_followings: function(who, curs) {
    $.get('http://twitter.com/friends/ids.json',
      { screen_name: eval(who), cursor: curs },
      function(data, status) {
        resp = data
        if (who == 'me')
          myFollowings = myFollowings.concat(data.ids)
        else
          theirFollowings = theirFollowings.concat(data.ids)
        
        if (data.next_cursor == 0) {
          if (who == 'them') {
            theirMutuals  = intersect(theirFollowings, theirFollowers)
            sharedMutuals = intersect(myMutuals, theirMutuals)
            $('#hovermesh .fings').html(
              '<span class="stat">' + 
              intersect(theirFollowings, myFollowings).length + 
              '</span> <span class="type" title="This is the number of people you both follow">shared<br />following</span>')
            $('#hovermesh .mutuals').html(
              '<span class="stat">' + 
              theirMutuals.length + 
              '</span> <span class="type" title="How many both follow and are followed by ' + them + '">recip-<br />rocal</span>')
            $('#hovermesh .shared').html(
              '<span class="stat">' + 
              sharedMutuals.length + 
              '</span> <span class="type" title="Reciprocal overlap: how many follow and are followed by both ' + 
              me + ' and ' + them + '">shared<br />recips</span>')
          }
          else {
            myMutuals = intersect(myFollowers, myFollowings)
          }
        }
        else {
          Api.load_followings(who, data.next_cursor)
        }
      },
      'json'
    )
  }
}

function intersect(array1, array2) {
  var result = []
  for (var i = 0, len = array1.length; i < len; ++i) {
    if (jQuery.inArray(array1[i], array2) > -1)
      result.push(array1[i])
  }  
  return result
}

Api.get_my_followers()
Api.get_my_followings()

$('.hovercard').bind('HIT_it', function(e, screen_name) {
  them = screen_name
  $('#HIT').html(
    '<div id="hovermesh"> \
      <p><strong>Data Mesh:</strong></p> \
      <ul class="user_stats"> \
        <li class="fings first"><img src="/images/spinner.gif" /> Loading Mesh Data... </li> \
        <li class="fers"></li> \
        <li class="mutuals"></li> \
        <li class="shared last"></li> \
      </ul> \
     </div>'
  )
  Api.get_their_followers()
  Api.get_their_followings()
})
