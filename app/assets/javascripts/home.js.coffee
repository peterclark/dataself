jQuery ($) ->
  
  $('.instagram a').fluidbox()
  $('.automatic a').fluidbox() 
  
  pusher    = new Pusher('ec30baff267be45877e8')
  instagram = pusher.subscribe('instagram')
  github    = pusher.subscribe('github')
  automatic = pusher.subscribe('automatic')

  instagram.bind 'created', (data) ->
    $('.instagram').last().fadeOut 250, ->
      @.remove()
      clone = $('.instagram').first().clone() 
      clone.find('img').attr('src', data.image_url)
      clone.find('a').attr('href', data.image_url)
      clone.hide().prependTo('#instagrams').fadeIn 1000
  
  github.bind 'created', (data) ->
    date = new Date(data.commit_time)
    day = date.getDate()
    chart = $('#github-chart').highcharts()
    previous = chart.series[0].data[ day ].y
    chart.series[0].data[ day ].update( previous + 1 );
    
  automatic.bind 'created', (data) ->
    $('.automatic').last().fadeOut 250, ->
      @.remove()
      clone = $('.automatic').first().clone()
      clone.find('img').attr('src', data.trip_map)
      clone.find('a').attr('href', data.trip_map)
      clone.hide().prependTo('#automatics').fadeIn 1000
