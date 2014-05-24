var bb = {
    data_dir: 'data/',
    img_dir: 'images/',
    info: {
        bbus15: {
            name: 'Big Brother 15',
            start: 1372251600, // 6/26/2013 9:00:00 PM
            end: 1379552400
        },
        bbus16: {
            name: 'Big Brother 16',
            start: 1403744400, // 6/25/2014 9:00:00 PM
            end: 1411088400
        }
    },
    load: function(season) {
        //do load stuff here
        bb.season = season;
        bb.getHouseguests();
        bb.getBookmarks();
        setInterval(function() { bb.getInfo(); }, 1000);
    },
};

bb.getInfo = function() {
    //Day in House
    var oneDay = 24*60*60; // hours*minutes*seconds*milliseconds
    var days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thur', 'Fri', 'Sat'];
    var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    var d = new Date();
    var dsec = d.getTime() / 1000;
    bb.currentTime = days[d.getDay()] + ", " + months[d.getMonth()] + formatDate(d, ' {Date:2}: {Hours:2}:{Minutes:2}:{Seconds:2}');
    bb.currentDayInHouse = "Day " + Math.round((dsec - bb.info[bb.season].start)/oneDay);
    var end = new Date(bb.info[bb.season].end);
    if (end.getTime() / 1000 < dsec) bb.currentDayInHouse = "Ended"; 
    var html = '<ul class="list">';
    html += '<li>' + bb.info[bb.season].name + '</li>';
    html += '<li>' + bb.currentTime + '</li>';
    html += '<li>' + bb.currentDayInHouse + '</li>';
    html += '</ul>';
    $('#bb_info').html(html);
}

bb.getHouseguests = function () {
    $.ajax({
        url: bb.data_dir + bb.season + '/hg.json',
        success: function(data) {
            houseguests_data = $.parseJSON(data);
            var html = '';
            //alert('loaded');
            $.each(houseguests_data, function(i, item) {
                html += '<div class="houseguest">'
                html += '<a class="tooltip" href="' + item['yt'] + '"><img class="houseguest" width="64" height="64" src="' + bb.img_dir + bb.season + '/' + i + '.jpg" />';
                html += '<span>';
                html += '<b>' + item['name'] + '<b><br>';
                if (item['evicted']) html += '<font color="red">EVICTED: ' + item['evicted'] + '</font>' + '<br>';
                if (item['winner']) html += '<font color="green">WINNER</font>' + '<br>';
                html += '<i>Age</i>: ' + item['age'] + '</i><br>';
                html += '<i>Hometown</i>: ' + item['home'] + '</i><br>';
                html += '<i>Job</i>: ' + item['job'] + '</i><br>';
                html += '<i>HOH</i>: ' + item['hoh'] + '</i><br>';
                html += '<i>POV</i>: ' + item['pov'] + '</i><br>';
                html += '<i>NOM</i>: ' + item['nom'] + '</i><br>';
                html +='</span>';
                html += '</a>';
                html += '</div>';
            });
            $('#bb_houseguests').html(html);
        },
        error: function(xhr, status, error) {
            alert('error loading houseguests');
        }
    });
}

bb.getBookmarks = function () {
    $.ajax({
        url: bb.data_dir + bb.season + '/bookmarks.json',
        success: function(data) {
            bookmark_data = $.parseJSON(data);
            var html = '<ul class="list">';
            $.each(bookmark_data.flashbacks.results, function(i, item) {
                html += '<li>' + item['event_day'] + ' ' + item['event_time'] + ': ' + item['event_title'] + '</li>';
            });
            html += '</ul>';
            $('#bb_bookmarks').html(html);
        },
        error: function(xhr, status, error) {
            alert('error loading bookmarks');
        }
    });
}