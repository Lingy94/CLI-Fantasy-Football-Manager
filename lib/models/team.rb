class Team < ActiveRecord::Base
  belongs_to :user
  has_many :selections
  has_many :players, through: :selections

  def pick_goal_keeper
        puts "\nPick your goalkeeper by typing their number.\n"
        list_of_names = []
        selected_data_gk_array.each_with_index do |element, index|
        list_of_names << "#{index +1}. #{element["first_name"]} #{element["second_name"]}"
        end
        puts list_of_names
        chosen_player_number = gets.chomp.to_i
        if chosen_player_number <= list_of_names.length
          chosen_player_name = selected_data_gk_array[chosen_player_number - 1]["second_name"]
          Player.all.each do |player_obj|
            if player_obj.second_name == chosen_player_name && player_obj.element_type == 1
              Selection.create(team_id: self.id, player_id: player_obj.id)
              puts "\n#{chosen_player_number}. #{chosen_player_name} has been added to your team!\n"
            end
          end
        else
          puts "\nInvalid number. Please select again from list.\n"
          self.pick_goal_keeper
        end
      end


    def pick_defender
      puts "\nPick your defender by typing their number.\n"
      list_of_names = []
      selected_data_def_array.each_with_index do |element, index|
      list_of_names << "#{index + 1}. #{element["first_name"]} #{element["second_name"]}"
      end
      puts list_of_names
      chosen_player_number = gets.chomp.to_i
      if chosen_player_number <= list_of_names.length
    chosen_player_name = selected_data_def_array[chosen_player_number - 1]["second_name"]
        Player.all.each do |player_obj|
          if player_obj.second_name == chosen_player_name && player_obj.element_type == 2
          Selection.create(team_id: self.id, player_id: player_obj.id)
          puts "\n#{chosen_player_number}. #{chosen_player_name} has been added to your team!\n"
        end
      end
      else
        puts "\nInvalid number. Please select again from list.\n"
        self.pick_defender
      end
    end

    def pick_midfielder(turn)
      puts "\nPick your #{turn} midfielder by typing their number.\n"
      list_of_names = []
      selected_data_mid_array.each_with_index do |element, index|
      list_of_names << "#{index +1}. #{element["first_name"]} #{element["second_name"]}"
      end
      puts list_of_names
      chosen_player_number = gets.chomp.to_i
      if chosen_player_number <= list_of_names.length
    chosen_player_name = selected_data_mid_array[chosen_player_number - 1]["second_name"]
        Player.all.each do |player_obj|
          if player_obj.second_name == chosen_player_name && player_obj.element_type == 3
          Selection.create(team_id: self.id, player_id: player_obj.id)
          puts "\n#{chosen_player_number}. #{chosen_player_name} has been added to your team!\n"
        end
      end
      else
        puts "\nInvalid number. Please select again from list.\n"
        self.pick_midfielder(turn)
      end
    end

    def pick_striker
      puts "\nPick your striker by typing their number.\n"
      list_of_names = []
      selected_data_strike_array.each_with_index do
        |element, index| list_of_names << "#{index +1}. #{element["first_name"]} #{element["second_name"]}"
      end

      puts list_of_names
      chosen_player_number = gets.chomp.to_i
      if chosen_player_number <= list_of_names.length
    chosen_player_name = selected_data_strike_array[chosen_player_number - 1]["second_name"]
        Player.all.each do |player_obj|
          if player_obj.second_name == chosen_player_name && player_obj.element_type == 4
          Selection.create(team_id: self.id, player_id: player_obj.id)
          puts "\n#{chosen_player_number}. #{chosen_player_name} has been added to your team!\n"
        end
      end
      else
        puts "\nInvalid number. Please select again from list.\n"
        self.pick_striker
      end
    end

    # def compare_teams(team_2)
    #   team_1_total = 0
    #   self.players.each {|player| team_1_total += player.avg_points}
    #   team_2_total = 0
    #   team_2.players.each {|player| team_2_total += player.avg_points}
    #
    #   if team_1_total > team_2_total
    #     self.user.wins += 1
    #     team_2.user.losses += 1
    #     return team_1
    #   elsif team_2_total > team_1_total
    #     team_2.user.wins += 1
    #     self.user.losses +=1
    #     return team_2
    #   else
    #     self.user.draws += 1
    #     team_2.user.draws += 1
    #     return "Draw"
    #   end
    # end

end
