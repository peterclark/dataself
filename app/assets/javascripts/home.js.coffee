jQuery ($) ->
  
  Messenger.options = 
    extraClasses: 'messenger-fixed messenger-on-top messenger-on-right'
    theme: 'flat'
    
  $('.instagram a').fluidbox()
  $('.automatic a').fluidbox() 
  
  pusher    = new Pusher('ec30baff267be45877e8')
  instagram = pusher.subscribe('instagram')
  github    = pusher.subscribe('github')
  automatic = pusher.subscribe('automatic')

  instagram.bind 'created', (data) ->
    Messenger().post "<a style='color:#fff' href='#instagram-section'><i class='fa fa-instagram'></i> new instagram loading...</a>"
    $('.instagram').last().fadeOut 250, ->
      @.remove()
      clone = $('.instagram').first().clone() 
      clone.find('img').attr('src', data.image_url)
      clone.find('a').attr('href', data.image_url)
      clone.hide().prependTo('#instagrams').fadeIn 1000
  
  github.bind 'created', (data) ->
    Messenger().post "<a style='color:#fff' href='#github-section'><i class='fa fa-github'></i> new commit loading...</a>"
    date = new Date(data.commit_time)
    day = date.getDate()
    chart = $('#github-chart').highcharts()
    previous = chart.series[0].data[ day ].y
    chart.series[0].data[ day ].update( previous + 1 );
    
  automatic.bind 'created', (data) ->
    Messenger().post "<a style='color:#fff' href='#automatic-section'><i class='fa fa-car'></i> new trip loading...</a>"
    $('.automatic').last().fadeOut 250, ->
      @.remove()
      clone = $('.automatic').first().clone()
      clone.find('img').attr('src', data.trip_map)
      clone.find('a').attr('href', data.trip_map)
      clone.hide().prependTo('#automatics').fadeIn 1000
