<!DOCTYPE html>
<html>
<head>
  <title>Product Category Selection</title>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script>
  function loadCategories() {
    // Function to handle AJAX call and populate the select options
    $.ajax({
      url: "CategoriesServlet",
      method: 'GET',
      success: function(response) {
        $('#catg').html(response); // Set the response HTML as the inner HTML of the select element
      },
      error: function(xhr, status, error) {
        console.log('AJAX Error: ' + error);
      }
    });
  }

  function loadProductsByCategory() {
    var category = document.getElementById("catg").value;
    console.log(category);
    $.ajax({
      url: "products",
      method: 'GET',
      data: { category: category },
      success: function(response) {
        $('#display').html(response); // Set the response HTML as the inner HTML of the select element
      },
      error: function(xhr, status, error) {
        console.log('AJAX Error: ' + error);
      }
    });
  }

  function addToCart(productId) {
	  console.log("Add to cart called");
	  $.ajax({
	    url: "addToCart",
	    method: 'GET',
	    data: { productId: productId },
	    success: function(response) {
	      $('#resp').html(response); // Set the response HTML as the inner HTML of the cart items element
	    },
	    error: function(xhr, status, error) {
	      console.log('AJAX Error: ' + error);
	    }
	  });
	}

  function addToWishlist(productId) {
	  console.log(productId+"Add to wishlist called");
	  $.ajax({
	    url: "addToWishlist",
	    method: 'GET',
	    data: { productId: productId },
	    success: function(response) {
	      $('#resp').html(response); // Set the response HTML as the inner HTML of the cart items element
	    },
	    error: function(xhr, status, error) {
	      console.log('AJAX Error: ' + error);
	    }
	  });
	}
  
  function removeFromCart(productId) {
	  console.log("Remove from cart called");
	  $.ajax({
	    url: "removeFromCart",
	    method: 'GET',
	    data: { productId: productId },
	    success: function(response) {
	      showCart(); // Set the response HTML as the inner HTML of the cart items element
	    },
	    error: function(xhr, status, error) {
	      console.log('AJAX Error: ' + error);
	    }
	  });
	}
  
  function removeFromWishlist(productId) {
	  console.log("Remove from wishlist called");
	  $.ajax({
	    url: "removeFromWishlist",
	    method: 'GET',
	    data: { productId: productId },
	    success: function(response) {
	      showWishlist(); // Set the response HTML as the inner HTML of the cart items element
	    },
	    error: function(xhr, status, error) {
	      console.log('AJAX Error: ' + error);
	    }
	  });
	}
  
  
  function showCart() {
	  $.ajax({
	    url: "cartItems",
	    method: 'GET',
	    data:{userId: 1},
	    success: function(response) {
	      $('#display').html(response); // Set the response HTML as the inner HTML of the cart items element
	    },
	    error: function(xhr, status, error) {
	      console.log('AJAX Error: ' + error);
	    }
	  });
	}
  
  function showWishlist() {
	  $.ajax({
	    url: "wishlistItems",
	    method: 'GET',
	    data:{userId: 1},
	    success: function(response) {
	      $('#display').html(response); // Set the response HTML as the inner HTML of the cart items element
	    },
	    error: function(xhr, status, error) {
	      console.log('AJAX Error: ' + error);
	    }
	  });
	}
  
  
  loadCategories();
 
  // Add event listener for the "Add to Cart" button
  $(document).ready(function() {
	  
	  $(document).on('click', '.addToCartButton', function(event) {
		  
	    event.preventDefault();
	    var productId = $(this).data('product-id');
	    console.log(productId);
	    addToCart(productId);
	  });
	  $(document).on('click', '.addToCart', function(event) {
		  
		    event.preventDefault();
		    var productId = $(this).data('product-id');
		    console.log(productId+"add to cart from wishlist");
		    addToCart(productId);
		  });
	 /*  $(document).on('click', '.addToWishListFromCart', function(event) {
		  
		    event.preventDefault();
		   
		    var productId = $(this).data('product-id');
		    console.log(productId+"addToWishListFromCart");
		    addToWishlist(productId);
		  }); */
	  $(document).on('click', '.addToWishListFromCart', function(event) {
		    event.preventDefault();
		    var productId = $(this).data('product-id');
		   console.log(productId+"in addToWishListFromCart");
		    addToWishlist(productId);		  });
	  $(document).on('click', '.removeFromCart', function(event) {
	    event.preventDefault();
	    var productId = $(this).data('product-id');
	    console.log(productId);
	    removeFromCart(productId);
	  });
	  
	  $(document).on('click', '.addToWishlistButton', function(event) {
	    event.preventDefault();
	    var productId = $(this).data('product-id');
	    console.log(productId);
	    addToWishlist(productId);
	  });
	  
	  $(document).on('click', '.removeFromWishlist', function(event) {
	    event.preventDefault();
	    var productId = $(this).data('product-id');
	    console.log(productId);
	    removeFromWishlist(productId);
	  });
	  
	  $('#catg').change(function() {
	      loadProductsByCategory();
	  });

	  $('#cart-button').click(function() {
	      showCart();
	  });
	  $('#Wishlist-button').click(function() {
	      showWishlist();
	  });
  });
</script>
</head>
<body>
  <h1>
  Product Category</h1>
  <form method="get">
    <select name="catg" id="catg">
      <!-- The options will be populated here -->
    </select>
    <button type="button" id="cart-button" class="btn btn-primary">Cart</button>
    <button type="button" id="Wishlist-button" class="btn btn-primary">Wishlist</button>
    <div id="display"></div>
   <div id="resp"></div>
  </form>
</body>
</html>
