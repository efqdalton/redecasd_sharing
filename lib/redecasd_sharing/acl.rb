module RedecasdSharing
  class ACL
    def initialize(name)
      @acl        = {}
      acl_data    = Config.acl
      user_acl    = acl_data[name]
      default_acl = acl_data[:default]

      user_acl.each do |directory, permissions|
        @acl[directory] = {}
        permissions.each do |operation, permission|
          @acl[directory][operation] = permission || default_acl[directory][operation]
        end
      end
    end

    def [](top_directory)
      @acl[top_directory]
    end

    def self.for_user(user)
      self.new user.name
    end
  end
end