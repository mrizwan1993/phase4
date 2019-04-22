module Contexts
  module UserContexts
    # Context for users 
    def create_users
      @edUser = FactoryBot.create(:user)
      @cindyUser = FactoryBot.create(:user, email: "cindy@a&m.com", password_digest:"cindypassword", employee: @cindy)
      @ralphUser = FactoryBot.create(:user, email: "ralph@a&m.com", password_digest:"ralphpassword", employee: @ralph)
      @benUser = FactoryBot.create(:user, email: "ben@a&m.com", password_digest:"benpassword", employee: @ben)
      @kathrynUser = FactoryBot.create(:user, email: "kathryn@a&m.com", password_digest:"kathrynpassword", employee: @kathryn)
      @alexUser = FactoryBot.create(:user, email: "alex@a&m.com", password_digest:"alexpassword", employee: @alex)
    end
    
    def remove_users
      @edUser.destroy
      @cindyUser.destroy
      @ralphUser.destroy
      @benUser.destroy
      @kathrynUser.destroy
      @alexUser.destroy
    end

    def create_additional_users
    end

    def remove_additional_users
    end

  end
end