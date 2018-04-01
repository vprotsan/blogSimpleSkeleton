$(document).ready(function(){

  $('.delete-btn').on('click', function(e){
    e.preventDefault();
    console.log('preventDefault');

    //delete link
    var delete_link = $(this).attr('href');
    console.log('original delete link:' + delete_link);
    $(this).attr('href', '#delete-confirm');
    console.log('now href is #delete-confirm');

    //grabbing content
    var content1, content2;
    content1 = $(this).parents('p').siblings('.comment_author').html();
    console.log('content from .comment_author:'+content1);

    content2 = $(this).parents('p').siblings('.comment_body').html();
    console.log('content from .comment_body:'+content2);

    // console.log('content to be put in the modal:' + content);

    //putting content in modal
    $('.modal-body').append(content1, content2);
    $('.modal_delete_link').attr('href', delete_link);
    console.log('modal delete link is:' + $('.modal_delete_link').attr('href'));
  })

})
