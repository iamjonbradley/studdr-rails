jQuery.fn.limitMaxlength = function(options) {
 
  var settings = jQuery.extend({
    attribute: "maxlength",
    onLimit: function(){},
    onEdit: function(){}
  }, options);
  
  // Event handler to limit the textarea
  var onEdit = function(){
    var textarea = jQuery(this);
    var maxlength = parseInt(textarea.attr(settings.attribute));
    if(textarea.val().length > maxlength){
      textarea.val(textarea.val().substr(0, maxlength));
      jQuery.proxy(settings.onLimit, this)();
    }
    jQuery.proxy(settings.onEdit, this)(maxlength - textarea.val().length);
  }
 
  this.each(onEdit);
  return this.keyup(onEdit).keydown(onEdit).focus(onEdit);
}

$(document).ready(function() {
  
  $('.vote').click(function() {
    var id = this.id;
    $(".votes-" + id).load('/controls/vote/' + id);
    $('.vote-' + id).html('<div class="btn-voted">&nbsp;</div>');
  });
	
	
  $('#select-category').click (
    function () {
      $('.categories').show();
    }
  );
	
  $('.categories').hover (
    function () {
      $('.categories').show();
    },
    function () {
      $('.categories').hide();
    }
  );
  
  $('li.category').click(function () {
    
    switch(this.id) {
      case 'Love':  var category_id = 1; break;
      case 'Sex':   var category_id = 2; break;
      case 'Money': var category_id = 3; break;
      case 'Work':  var category_id = 4; break;
      case 'Misc':  var category_id = 5; break;
    }
    
    $('input.category_id').val(category_id);
    
    $('#select-category').addClass(this.id);
      
    $('.categories').hide();
  });
  
  var onEditCallback = function(remaining){
    // $(this).siblings('.charsRemaining').text("Characters remaining: " + remaining);
    
    $('.remaining').html(remaining);
    
    if(remaining > 0){
      $(this).css('background-color', 'white');
    	$(this).css('color', '#333');
    	$('#add-comment').attr('action', '/comments/add');
    }
    else {
    	$('#add-comment').attr('action', '#');
    }
  }
  
  var onLimitCallback = function(){
    $(this).css('background-color', '#961D08');
    $(this).css('color', '#FFF');
  }
  
  $('textarea[maxlength]').limitMaxlength({
    onEdit: onEditCallback,
    onLimit: onLimitCallback,
  });
  
  
		$('#submitform').ajaxForm({
			target: '#error',
			success: function() {
				$('#error').fadeIn('slow');
				$('#error').html('Successfully updated');
			}
		});
});

jQuery(document).ready(function($) {
  $('a[rel*=facebox]').facebox({
    loadingImage : '/img/loading.gif',
    closeImage   : '/img/closelabel.png'
  })
})
twttr.anywhere(function (T) {
    T.hovercards();
    T("#follow-placeholder").followButton('studdrs');
  });