$(document).ready(function() {
		 
		    $('.faq_question').click(function() {
		 
		        if ($(this).parent().is('.open')){
		            $(this).closest('.faq').find('.faq_answer_container').animate({'height':'0px'},200);
		            $(this).closest('.faq').removeClass('open');
		 
		            }else{
		                var newHeight =$(this).closest('.faq').find('.faq_answer').height();
		                newHeight = newHeight + 20;
		                newHeight = newHeight +'px';
		                $(this).closest('.faq').find('.faq_answer_container').animate({'height':newHeight},200);
		                $(this).closest('.faq').addClass('open');
		            }
		 
		    });
		 
		});