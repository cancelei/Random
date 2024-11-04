class JsonRepository
    def self.read(file)
        begin
            json_data = File.read(file)
            JSON.parse(json_data)
        rescue JSON::ParserError => e
            puts "Error parsing JSON: #{e.message}"
            []
        rescue Errno::ENOENT => e
            puts "File not found: #{e.message}"
            []
        end
    end

    def self.write(file, data)
        begin
            File.write(file, JSON.pretty_generate(data))
        rescue JSON::GeneratorError => e
            puts "Error generating JSON: #{e.message}"
            false
        rescue Errno::EACCES => e
            puts "Permission denied: #{e.message}"
            false
        end
    end

    def self.add_file(file, object)
        data = self.read(file) || []

        data << object
        
        self.write(file, data)
    end


end
