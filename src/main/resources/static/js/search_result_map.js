$(document).ready(function() {
    var hid = $('input[name="hid"]').val();
    initGlocMap(hid);
    
    function initGlocMap(hid) {
        $.ajax({
            url: "http://localhost:9000/search_result_map/" + hid,
            success: function(result) {
                var position = new naver.maps.LatLng(result.list.x, result.list.y);
                
                var map = new naver.maps.Map('map', {
                    center: position,
                    zoom: 18
                });
                
                var marker = new naver.maps.Marker({
                    map: map,
                    title: result.hname,
                    position: position
                });
            }
        });
    }
});
