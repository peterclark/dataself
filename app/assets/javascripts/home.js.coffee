jQuery ($) ->
   
  pusher = new Pusher('ec30baff267be45877e8')
  instagrams = pusher.subscribe('instagrams')

  instagrams.bind 'created', (data)->
    instagrams = $('.instagram-column')
    if instagrams.length == 6
      instagrams.first().fadeOut(250, -> @.remove())
    column = instagrams.last().clone()
    column.find('.instagram').attr('src', data.image_url)
    column.hide().appendTo("#instagrams").fadeIn(1000)
  
  githubData = [
    { label: 'Layer 1', values: [ {x: 0, y: 0}, {x: 1, y: 1}, {x: 2, y: 2} ] },
    { label: 'Layer 2', values: [ {x: 0, y: 0}, {x: 1, y: 1}, {x: 2, y: 4} ] }
  ]
  
  githubChart = $('#github-chart').epoch
    type: 'area'
    data: githubData
    axes: ['left', 'right', 'bottom']
  
  