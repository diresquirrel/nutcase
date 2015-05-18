require 'nutcase/version'
require 'rerun'

class Nutcase
  module BIN
    extend self

    attr_accessor :config_file, :args

    def run
      self.args = []
      self.config_file ||= './config/nutcase.rb'

      if argv.count > 0
        args.concat(argv)
      elsif File.file? config_file
        instance_eval(File.read(config_file), config_file)
      end

      options = {
        cmd: args.join(' '),
        signal: 'TERM',
        background: true,
        growl: false,
        name: 'Nutcase',
        ignore: [],
        dir: ['.'],
        pattern: '{Gemfile,Gemfile.lock,.gems,.bundle,.env*,config.ru,Rakefile,**/*.{rb,js,coffee,css,scss,sass,styl,erb,html,haml,ru,yml,slim,md,mab,rake}}'
      }

      Rerun::Runner.keep_running(options[:cmd], options)
    end

    def server(opts)
      args.concat(opts)
    end

    def envs
      @envs ||= {}
    end

    private

    def argv
      @argv ||= begin
        ARGV
      end
    end
  end
end
