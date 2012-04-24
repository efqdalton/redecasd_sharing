module RedecasdSharing
  module Config
    def self.load_config_data(config_file)
      @config = YAML.load config_file
    end

    def self.users
      YAML.load_file @config[:users_file]
    end

    def self.save_user!(params)
      data                       = self.users
      data[params.delete(:name)] = params
      File.open(@config[:users_file], 'w'){ |f| f.puts data.to_yaml }
    end

    def self.acl
      YAML.load_file @config[:acl_file]
    end
  end
end