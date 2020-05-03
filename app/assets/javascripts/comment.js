$(function(){
  function buildHTML(comment){
    var html = `<p>
                  <a href="/users/${comment.user_id}">${comment.user_name}</a>
                  ：
                  ${comment.text}
                  <a rel="nofollow" data-method="delete" href="/comments/${comment.id}">削除</a>
                </p>`
    return html;
  }
  $('#new_comment').on('submit',function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.comments').append(html);
      $('#comment_text').val('');
      $('.comments').animate({ scrollTop: $('.comments')[0].scrollHeight});
      $('.submit').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  });
});
