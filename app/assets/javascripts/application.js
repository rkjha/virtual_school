// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

//var vid_data;


/* Method which will get called on youtube video search form submit
function ytSearch(q) {
  document.getElementById("video-results").innerHTML = 
                                    'Loading YouTube videos ...';
  //alert("Searching YouTube ?"+"You queried for "+q);
  // Now search for videos using the query
  var keyword= encodeURIComponent(q);
  //alert("keyword = "+keyword);
  var yt_url = 'http://gdata.youtube.com/feeds/api/videos?q='+keyword+'&format=5&max-results=5&v=2&alt=jsonc';
  //alert("yt_url = "+yt_url);
  // 
  var script = document.createElement('script');
            script.setAttribute('id', 'jsonScript');
            script.setAttribute('type', 'text/javascript');
            script.setAttribute('src', 'http://gdata.youtube.com/feeds/videos?q='+keyword+'&max-results=8&' + 
                   'alt=json-in-script&callback=showMyVideos&' + 
                   'orderby=relevance&sortorder=descending&format=5');
//alert("script = "+script.src);
            //attach script to current page -  this will submit asynchronous
            //search request, and when the results come back callback 
            //function showMyVideos(data) is called and the results passed to it
            document.documentElement.firstChild.appendChild(script);
}

//showMyVideos(fun);
// for displaying Videos

function showMyVideos(data)
        {
            alert("It's Working");
            var feed = data.feed;
            var entries = feed.entry || [];
            var html = ['<ul>'];
            for (var i = 0; i < entries.length; i++)
            {
                var entry = entries[i];
                var playCount = entry.yt$statistics.viewCount.valueOf() + ' views';
                var title = entry.title.$t;
                var lnk = '<a href = \"' + entry.link[0].href + '\">link</a>';
                html.push('<li>', title, ', ', playCount, ', ', lnk, '</li>');
            }
            html.push('</ul>');
            document.getElementById('video-results').innerHTML = html.join('');
        }
        */

// Ajax Way 

function ytSearchInstant(q) {
  document.getElementById("video-results").innerHTML = 
                                    'Loading YouTube stuffs ...';
  //alert("Searching YouTube ?"+"You queried for "+q);
  // Now search for videos using the query
  var keyword= encodeURIComponent(q);
  //alert("keyword = "+keyword);
  var yt_url = 'http://gdata.youtube.com/feeds/api/videos?q='+keyword+'&format=5&max-results=5&v=2&alt=jsonc';
  alert("yt_url = "+yt_url);
$.ajax
({
type: "GET",
url: yt_url,
dataType:"jsonp",
success: function(response)
{

if(response.data.items)
{
$.each(response.data.items, function(i,data)
{
var video_id=data.id;
var video_title=data.title;
var video_viewCount=data.viewCount;
// IFRAME Embed for YouTube
var video_frame="<iframe width='640' height='385' src='http://www.youtube.com/embed/"+video_id+"' frameborder='0' type='text/html'></iframe>";

var final="<div id='title'>"+video_title+"</div><div>"+video_frame+"</div><div id='count'>"+video_viewCount+" Views</div>";

$("#video-results").html(final); // Result

});
}
else
{
$("#video-results").html("<div id='no'>No Video</div>");
}
}
});
});
} //end of function