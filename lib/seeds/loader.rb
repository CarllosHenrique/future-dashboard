module Seeds
  class Loader
    def self.all
      return if Rails.env.test?

      load_seed_files!
      create(seeds_files)
    end

    def self.fakers
      return if Rails.env.test?

      load_seed_files!
      create(faker_files)
    end

    def self.load_seed_files!
      # Itera por cada arquivo no diretório de seeds e os carrega
      Dir[seeds_files].sort.each do |file|
        # puts "Carregando arquivo de seed: \n #{file}"
        load file
      end
    end

    def self.create(seed_name)
      Dir.glob(seed_name).each do |file|
        # Transforma o nome do arquivo em um nome de classe, removendo prefixo numerico.
        class_name = File.basename(file, '.rb').split('_').drop(1).join('_').camelize
        next unless Object.const_defined?(class_name)

        # Obtem a classe e chama o metodo call
        klass = Object.const_get(class_name)
        klass.call if klass.is_a?(Class)
      end
    end

    def self.seeds_files
      Rails.root.join('db', 'seeds', '*_seeds.rb')
    end

    def self.faker_files
      Rails.root.join('db', 'seeds', 'faker', '*_seeds.rb')
    end

    def self.from_yml_file(file_name)
      file = "#{Rails.root}/db/seeds/files/#{file_name}.yml"

      yml_data = YAML.load_file(file)

      env = Rails.env.to_s === 'production' ? 'production' : 'dev'

      # puts "Rails.env.to_s #{Rails.env.to_s}"
      # puts "env #{env}"
      return yml_data[env] if yml_data.is_a?(Hash) && yml_data.has_key?(env)

      yml_data
    end

    def self.struct_from_yml_file(file_name)
      from_yml_file(file_name).map { |s| OpenStruct.new(s) }
    end
  end
end
