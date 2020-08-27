class FileFormatService
    def initialize(fileToFormat)
        @archive = fileToFormat
    end

    def format
        format_file
    end

    private
    # removes the unclean parts of the file
    def format_file
        archiveFormat = @archive.to_s.split('\n')
        archiveFormat.shift()
        archiveFormat.shift()
        archiveFormat.shift()
        archiveFormat.shift()
        archiveFormat.pop()
        archiveFormat.pop()
        archiveFormat
    end
end
