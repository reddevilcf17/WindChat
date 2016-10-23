function windChat_update_message(id){
	$.ajax({
      type: "PUT",
      url: "/messages/" + id
    });

	$('#message-status-' + id).css({'color':'#818a91'});
	$('#message-status-' + id).removeClass( "fa-circle" ).addClass( "fa-circle-o" );
}

function windChat_add_recipient(email){

	var oldContent = $('#recipients-list').html();
	$('#recipients-list').html(oldContent + ''
		+ '<div class="alert alert-info alert-dismissible fade in recipients-email" role="alert">'
        + '       <button type="button" class="close" data-dismiss="alert" aria-label="Close">'
        + '         <span aria-hidden="true">&times;</span>'
        + '       </button>'
		+ '       <input name="recipients[]" class="recipients-email-input disabled" type="text" value="' + email + '"></input>'
        + '     </div>'
        )
        ;

    return false;
}


