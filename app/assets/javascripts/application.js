//= require jquery
//= require jquery_ujs
//= require popper
//= require bootstrap

$(function () {
  $('[data-toggle="popover"]').popover();

  $('body').on('click', '.popover-body a', function(e){
    e.preventDefault();
    $('[data-toggle="popover"]').popover('hide');
    $.post($(this).attr('href'));
  });

  $('body').on('mouseenter', '.popover-body a', function(e) {
    $(this).prevAll('a').addBack().find('i').removeClass('far').addClass('fas');
  });

  $('body').on('mouseleave', '.popover-body a', function(e) {
    $(this).prevAll('a').addBack().find('i').removeClass('fas').addClass('far');
  });
});
