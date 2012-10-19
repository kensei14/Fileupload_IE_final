class IeController < ApplicationController
  require "tempfile"
  
  def index
    puts "test"
  end

  def upload
    p "test222222222222222222"
    p params
    p params.class

    p "current directory issssssss ...."
    p Dir.pwd
    myfile = params["files"]
    p myfile
    p myfile.class
    p myfile.length
    
    p myfile[0].content_type
    p myfile[0].tempfile
    p myfile[0].class
    p myfile[0].tempfile.class
    mycontent = myfile[0].tempfile.read
    p "my content"
    p mycontent
    p "my encoding"
    p mycontent.class
    p mycontent.encoding
    p mycontent.force_encoding('UTF-8')
    
    p "I will make tempfile"
    temp = Tempfile.new("mytemp.txt", Dir.pwd)
    temp.puts "test test test"
    temp.close
    p temp.class
    
    File.open("foo.txt", "a") do |file|
      file.puts(mycontent)
    end
    
    p "finish"
  end
end
