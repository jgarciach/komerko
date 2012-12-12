function fixThumbnailMargins() {
    $('.row-fluid .thumbnails').each(function () {
        var $thumbnails = $(this).children(),
            previousOffsetLeft = $thumbnails.first().offset().left;
        $thumbnails.each(function () {
            var $thumbnail = $(this),
                offsetLeft = $thumbnail.offset().left;
            if (offsetLeft < previousOffsetLeft) {
                $thumbnail.css('margin-left', 0);
            }
            previousOffsetLeft = offsetLeft;
        });
    });
}

function moveDivIntoAnchor() {
  var items = new Array();
  var a = new Array();
  items = $("div.item-info");
  a = $("a.thumbnail");
  for (var i = 0; i < items.length; i++) {
   $(a[i]).append( $(items[i]));
  }
}

function showItemInfoOnHover() {
  $(".small-thumbnails img").hover(
    function() {
      $(this).next(".item-info").show();
    },
    function() {
    }
  );
  $(".small-thumbnails .item-foggy-bg").hover(
    function() {
    },
    function() {
      $(this).parent().hide();
    }
  );
}

$(function () {
  fixThumbnailMargins();
  moveDivIntoAnchor();
  showItemInfoOnHover();
});
