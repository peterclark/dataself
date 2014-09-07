jQuery ($) ->
   
  pusher = new Pusher('ec30baff267be45877e8')
  $('.instagram a').fluidbox()
  
  instagram = pusher.subscribe('instagram')
  github = pusher.subscribe('github')

  instagram.bind 'created', (data) ->
    $('.instagram').last().fadeOut 250, ->
      @.remove()
      clone = $('.instagram').first().clone() 
      clone.find('img').attr('src', data.image_url)
      clone.find('a').attr('href', data.image_url)
      clone.hide().prependTo('#instagrams').fadeIn 1000
  
  github.bind 'created', (data)->
    date = new Date(data.commit_time)
    day = date.getDate()
    chart = $('#github-chart').highcharts()
    previous = chart.series[0].data[ day ].y
    chart.series[0].data[ day ].update( previous + 1 );
