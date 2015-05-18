require 'nutcase/version'
require 'rerun'

class Nutcase
  module BIN
    extend self

    def server
      args = []
      args.concat(argv)

      options = {
        cmd: args.join(' '),
        signal: 'TERM',
        background: true,
        growl: false,
        name: 'Nutcase Server',
        ignore: [],
        dir: ['.'],
        pattern: "{Gemfile,Gemfile.lock,.gems,.bundle,.env*,config.ru,Rakefile,**/*.{rb,js,coffee,css,scss,sass,styl,erb,html,haml,ru,yml,slim,md,mab,rake}}"
      }

      Rerun::Runner.keep_running(options[:cmd], options)
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
