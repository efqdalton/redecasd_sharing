require 'bcrypt'

module RedecasdSharing
  class User
    attr_reader :name, :admin, :authenticated

    alias :admin?         :admin
    alias :authenticated? :authenticated

    def initialize(params)
      @name  = params[:name]
      @salt  = params[:salt]
      @admin = params[:admin]
      @pass  = BCrypt::Password.new(@salt + params[:pass])
    end

    def authenticate(password)
      @authenticated = (@pass == @salt + password)
    end

    def allowed_to_read_on?(path)
      allowed_to? :read, path
    end

    def allowed_to_write_on?(path)
      allowed_to? :write, path
    end

    def self.find(name)
      params = Config.users[name] or return nil
      self.new params
    end

    def self.create!(params)
      Config.save_user! params
    end

    private
    def allowed_to?(operation, path)
      return false unless authenticated?
      return true  if     admin?
      begin
        top_path = SharedFile.top_level(path) or return false
        acl[path][:operation]
      rescue
        false
      end
    end

    def acl
      @acl ||= ACL.for_user self
    end
  end
end