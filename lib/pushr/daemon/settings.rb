module Pushr
  module Daemon
    class Settings
      attr_reader :pid_file, :configuration_file
      attr_accessor :foreground, :error_notification, :feedback_processor, :stats_processor

      def initialize
        @foreground = false
        @error_notification = false
        @feedback_processor = nil
        @stats_processor = nil
        @pid_file = nil
        @configuration_file = nil
      end

      def pid_file=(arg)
        @pid_file = File.join(Dir.pwd, arg) if arg && !Pathname.new(arg).absolute?
      end

      def configuration_file=(filename)
        if filename
          filename = File.join(Dir.pwd,filename) if ! Pathname.new(filename).absolute?
          if File.file?(filename)
            @configuration_file = filename
          else
            Pushr::Daemon.logger.error("can not find config file: #{filename}")
          end
        end
      end

    end
  end
end
