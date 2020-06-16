module UsersHelper
    def user_choose_new_or_edit
        p "アクション"
        p action_name
        if action_name == 'new' || action_name == 'create'
            dday_users_path
            # new_dday_user_path
        elsif action_name == 'update' || action_name == 'edit'
            user_path
        end
    end
end
