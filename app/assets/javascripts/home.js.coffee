jQuery ($) ->
   
  pusher = new Pusher('ec30baff267be45877e8')
  instagrams = pusher.subscribe('instagrams')

  instagrams.bind 'created', (data)->
    column = $('.instagram-column').last().clone()
    column.find('.instagram').attr('src', data.image_url)
    column.hide().appendTo("#instagrams").fadeIn(1000)
    
  # data = [
  #   { label: 'Layer 1', values: [ {x: 0, y: 0}, {x: 1, y: 1}, {x: 2, y: 2} ] },
  #   { label: 'Layer 2', values: [ {x: 0, y: 0}, {x: 1, y: 1}, {x: 2, y: 4} ] }
  # ]
  # 
  # areaChartInstance = $('#area').epoch({
  #   type: 'area',
  #   data: data,
  #   axes: ['left', 'right', 'bottom']
  # });