module RedecasdSharing
  class SharedFile
    def self.top_level(path)
      path.match(/\A(\/[^\/]*)\/?/)[1] rescue nil
    end

    def self.absolute(path)
      top_path      = top_level path
      absolute_path = Config.absolute_paths[top_path]
    end
  end
end