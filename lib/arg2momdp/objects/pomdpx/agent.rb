module Arg2MOMDP
  module POMDPX
    class Agent
      attr_reader :arguments, :actions, :initial_state, :action_names

      # Constructs the agent to optimize.
      #
      # @param arguments [Array<String>] The list of arguments
      # @param rules [Array<Rule>] The list of rules
      # @param initial_state [Array<Predicate>] The initial state of the problem
      # @param action_names [Array<String>] A list of names to replace rule number (default "a0".."a#{num_of_actions}")
      #
      # @raise [Error] If the length of the list of names is different from the numbre of actions
      def initialize(arguments, rules, initial_state, action_names=nil)
        @arguments     = arguments
        @actions       = []
        @initial_state = Hash.new(false)
        extract_actions!(rules)
        @action_names  = action_names || (0..@actions.size-1).map {|i| "a#{i}"}
        raise "Number of actions and names are different." unless @actions.size == @action_names.size
        filter_initial_state!(initial_state)
      end

      private

      # Extracts actions from rules as there cannot be more than one alternative for the agent to optimize.
      #
      # @param rules [Array<Rule>] The rules to extract the actions from
      def extract_actions!(rules)
        rules.each do |r|
          r.alternatives.each do |a|
            a.probability = 1.0
            @actions << Rule.new(r.premisses, [a])
          end
        end
      end

      # Filters initial state predicates as only private ones are relevant for the agent to optimize.
      #
      # @param initial_state [Array<Predicate>] The initial state of the problem
      def filter_initial_state!(initial_state)
        initial_state.lazy.select {|p| p.type == :priv}.each do |p|
          raise "Predicate on unknown argument: #{p}" unless @arguments.include?(p.argument1)
          @initial_state[p.argument1] = true
        end
      end
    end
  end
end