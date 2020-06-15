module DdaysHelper
    def choose_new_or_edit
        p "アクション"
        p action_name
        if action_name == 'new' || action_name == 'create'
            event_ddays_path
            # new_event_dday_path
        elsif action_name == 'update' || action_name == 'edit'
            dday_path
        end
    end
end
