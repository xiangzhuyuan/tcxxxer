# Tcxxxer

[![Gem Version](https://badge.fury.io/rb/tcxxxer.svg)](https://badge.fury.io/rb/tcxxxer)

I search a lot but I couldn't find out a valid gem which I can use to parse/conert a `tcx` file easily.
so I wrote this, essentially I check the gem `guppy` but I found it outdated a long age, the logic to parse
`tcx` file had been outdated. please check this gem if you want to work with `tcx` file.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tcxxxer'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tcxxxer

## Usage

```
get '/map' do
  # input parameter
  # name
  day = params['day']
  file_name = "TourDeHokkaido_day#{day}"
  db           = Tcxxxer::DB.open("./tcx/#{file_name}.tcx")
  @points_list = []
  db.courses.each do |course|
    max_distance = (course.track.last.distance/1000).round(2).to_s + "km"
    course_range = course.track.each_slice(400).to_a

    course_range.each_with_index do |range, _i|
      @points    = []
      @altitudes = []
      range.each do |point|
        @points << (point.distance/1000).round(2).to_s + "km"
        @altitudes << point.altitude.round(2)
        # @points_list << {:points => @points, :altitudes => @altitudes}
      end

      begin
          # read all, get each id
          html_file = "./tcx_result/#{file_name}_#{_i}.html"
          puts "start read erb, and create html file ...."
          renderer = ERB.new(File.read("./views/line.erb"))
          result   = renderer.result(binding)

          File.open(html_file, 'w') do |f|
            puts "write #{html_file} start"
            f.write(result)
          end

        rescue => e
          puts e.message
        end

    end
  end
  # get file list
  @result_list = Dir["./tcx_result/#{file_name}*.html"]
  erb :line_result
end

```

more please check [my strava 次世代の名刺](https://mystrava.herokuapp.com)