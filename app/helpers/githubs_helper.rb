module GithubsHelper
  
  def commits_by_day_settings
    { 
      chart: { 
        backgroundColor: "#FAFAFB" }, 
      xAxis: { 
        title: { 
          text: "Last 30 Days" }},
      yAxis: { 
        title: { 
          text: "Number of commits" }}
    }
  end
  
end
