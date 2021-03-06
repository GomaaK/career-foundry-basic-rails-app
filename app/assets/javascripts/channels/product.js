App.product = App.cable.subscriptions.create("ProductChannel", {
  connected: function() {
    console.log("connected")
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    console.log("connected")
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
  	$(".alert.alert-info").show();
  	$('.product-reviews').prepend(data.comment);
  	refreshRating();
  },

  listen_to_comments: function() {
  	return this.perform('listen', {
  		product_id: $("[data-product-id]").data("product-id")
  	});
	}
});

$(document).ready(function() {
  App.product.listen_to_comments();
});