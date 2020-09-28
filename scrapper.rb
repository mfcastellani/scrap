require "nokogiri"
require "open-uri"
require "json"

class Scrapper
    MAIN_URL = "https://www.flamengo.com.br/elencos/elenco-profissional"
    attr_accessor :html, :data

    def self.read_data
        @html = URI.open(MAIN_URL)
        @data = Nokogiri::HTML(@html)
    end

    def self.process_data
        has_data = true
        node_id = 1
        cast = []

        while has_data
            ret = @data.at("/html/body/section/section[2]/div/div[#{node_id}]/div/h2")
            break if ret.nil?

            position = ret.children.to_s
            cast_data = @data.at("/html/body/section/section[2]/div/div[#{node_id}]/div/div")
            sub_node_id = 1
            has_sub_data = true
            loop do 
                ret = cast_data.at("div[#{sub_node_id}]/a")
                break if ret.nil?

                url = ret.at("@href").to_s
                name = ret.at("div").at("div").at("figure").at("figcaption").at("p").children.to_s
                img = ret.at("div").at("div").at("figure").at("div").at("div").at("img").at("@src").to_s
                number = ret.at("div").at("div").at("figure").at("figcaption").at("span").children.to_s

                cast << {
                    name: name,
                    img: img,
                    url: url,
                    position: position,
                    number: number
                }
                sub_node_id += 1
            end
            node_id += 1
        end

        cast.to_json
    end
end

Scrapper.read_data
puts Scrapper.process_data
