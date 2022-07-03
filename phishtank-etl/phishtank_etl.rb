require "./extract"
require "./transform"
require "./load"

class PhishtankETL
    def initialize
        @extractor = Extractor.new
        @transformer = Transformer.new
        @loader = Loader.new
    end

    def run
        extracted_data = @extractor.extract
        transformed_data = @transformer.transform extracted_data
        loader_result = @loader.load transformed_data
    end
end

petl = PhishtankETL.new
petl.run unless ENV['TEST'] == "true"
