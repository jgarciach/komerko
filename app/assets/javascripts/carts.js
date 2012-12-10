

$(function () {
    //Hide all btns for convenience.
    $(".update-item-quantity").hide();
    //If a user changes the quantity, show the update btn for that item.
    $(".item-quantity").change(function () {
        $(this).parent().find(".update-item-quantity").show();
        $(document).trigger('sizeChange');
    });
});
