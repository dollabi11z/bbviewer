//Format a date easily
//https://gist.github.com/atesgoral/1005948
var formatDate = function(d,f){return f.replace(/{(.+?)(?::(.*?))?}/g,function(v,c,p){for(v=d["get"+c]()+/h/.test(c)+"";v.length<p;v=0+v);return v})};

//toggle any div display
function toggleDiv(id) {
    if ($('#'+id).is(':visible')) {
        $('#'+id).fadeOut();
    } else {
        $('#'+id).fadeIn();
    }
}