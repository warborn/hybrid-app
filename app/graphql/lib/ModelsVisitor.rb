module Lib
  class ModelsVisitor < GraphQL::Language::Visitor
    def initialize(query, public_models = {login: :mutation})
      super(GraphQL.parse(query))

      @public_models = public_models
      @public_model_count = 0
      @protected_model_count = 0
    end

    def on_field(node, parent)
      if is_public_model?(node, parent)
        @public_model_count = @public_model_count + 1
      elsif is_root_node?(parent)
        @protected_model_count = @protected_model_count + 1
      end
      super
    end

    attr_reader :public_model_count, :protected_model_count

    private

    def is_root_node?(node)
      node and node.respond_to?("operation_type")
    end

    def get_operation_type(node)
      if is_root_node?(node)
        node.operation_type.to_sym
      else
        nil
      end
    end

    def is_public_model?(node, parent)
      node_name = node.name.to_sym
      
      @public_models.key?(node_name) and @public_models[node_name] == get_operation_type(parent)
    end
  end
end
