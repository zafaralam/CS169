require 'debugger'              # optional, may be helpful
require 'open-uri'              # allows open('http://...') to return body
require 'cgi'                   # for escaping URIs
require 'nokogiri'              # XML parser
require 'active_model'          # for validations

class OracleOfBacon

  class InvalidError < RuntimeError ; end
  class NetworkError < RuntimeError ; end
  class InvalidKeyError < RuntimeError ; end

  attr_accessor :from, :to
  attr_reader :api_key, :response, :uri
  
  include ActiveModel::Validations
  validates_presence_of :from
  validates_presence_of :to
  validates_presence_of :api_key
  validate :from_does_not_equal_to
  
  def from=(from)
     @from = from
     @to = 'Kevin Bacon' if @to.nil?
  end
  
  def to=(to)
     @to = to
     @from = 'Kevin Bacon' if @from.nil?
  end

  def from_does_not_equal_to
    # YOUR CODE HERE
    return false if @from.eql?@to && @from != 'Kevin Bacon'
  end

  def initialize(api_key='')
    # your code here
    @api_key = api_key
  end

  def find_connections
    make_uri_from_arguments
    begin
      xml = URI.parse(uri).read
    rescue Timeout::Error, Errno::EINVAL, Errno::ECONNRESET, EOFError,
      Net::HTTPBadResponse, Net::HTTPHeaderSyntaxError,
      Net::ProtocolError => e
      # convert all of these into a generic OracleOfBacon::NetworkError,
      #  but keep the original error message
      # your code here
    end
    # your code here: create the OracleOfBacon::Response object
  end

  def make_uri_from_arguments
    # your code here: set the @uri attribute to properly-escaped URI
    #   constructed from the @from, @to, @api_key arguments
    params = "p=#{URI.escape(@api_key.to_s)}&a=#{URI.escape(@from.to_s)}&b=#{URI.escape(@to.to_s)}"
    host = "oracleofbacon.org"
    path = "/cgi-bin/xml"
    @uri = URI::HTTP.build({:host => host, :path => path,:query => params})
    puts "#{@uri}"
  end
      
  class Response
    attr_reader :type, :data
    # create a Response object from a string of XML markup.
    def initialize(xml)
      @doc = Nokogiri::XML(xml)
      parse_response
    end

    private

    def parse_response
      if ! @doc.xpath('/error').empty?
        parse_error_response
        elsif ! @doc.xpath('/link').empty?
          parse_link_response
        elsif ! @doc.xpath('/spellcheck').empty?
          parse_spellcheck_response
      else
        parse_unknown_response         
      end
    end
    
    def parse_spellcheck_response
        @type = :spellcheck
        matched_array = Array.new(0)
        @doc.xpath('/spellcheck/match').each do |child|
           matched_array.push(child.text)
        end
        @data = matched_array
    end
    
    def parse_link_response
        @type = :graph
        
        graph_array = Array.new(0)
        actors = @doc.xpath('/link/actor')
        movies = @doc.xpath('/link/movie')
        
        i=0
        actors.each do |actor|
          graph_array.push(actor.text)
          if ! movies[i].nil?
             graph_array.push(movies[i].text)
             i += 1
          end
        end
        
        @data = graph_array
    end
    
    def parse_unknown_response
        @type = :unknown
        @data = 'unknown response type'
    end
    
    def parse_error_response
      @type = :error
      @data = 'Unauthorized access'
    end
  end
end

#oob = OracleOfBacon.new('38b99ce9ec87')

# connect Laurence Olivier to Kevin Bacon
#oob.from = 'Laurence Olivier'
#puts oob.from_does_not_equal_to

