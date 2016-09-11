$(document).ready(function() {
  var container_size = $('#etch-screen').outerHeight();
  var grid_size = 16; // Default grid size
  var square_grid = grid_size * grid_size;
  for(var i = 0; i < square_grid; i++){
    $('#etch-screen').append('<div class="tile"></div>');
  }
  $('div.tile').outerHeight(container_size/grid_size); // Set the tiles to container size divided by grid size
  $('div.tile').outerWidth(container_size/grid_size); 
  sketch();

  $('#clear').on('mouseenter', function() { // Clearing the grid by restoring default background color
    $('.tile').stop();
    $('.tile').css('opacity', '');
    $('.tile').css("background", "#999");
    sketch();
  });

  $('#gridSize').on('mouseenter', function() { // Custom grid size
    var grid_size = prompt("Enter the grid size: ");
    $('#etch-screen').empty();
    square_grid = grid_size * grid_size;
    for(var i = 0; i < square_grid; i++){
      $('#etch-screen').append('<div class="tile"></div>');
    }
    $('div.tile').outerHeight(container_size/grid_size);
    $('div.tile').outerWidth(container_size/grid_size);
    sketch();
  });

  $('#rainbow').on('mouseenter', function() {
    sketchRainbow();
  });

  function sketch() { // Sketching
    $('.tile').mouseover(function() {
      $(this).css('background', '#444');
    });
  };

  function sketchRainbow() {
    $('.tile').mouseover(function() {
      var randomColor = 'rgb('
        + (Math.floor(Math.random() * 256)) + ','
        + (Math.floor(Math.random() * 256)) + ','
        + (Math.floor(Math.random() * 256)) + ')';
      $(this).css('background', randomColor);
    });
  };
});
