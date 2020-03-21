require 'json'

lambda_folder = File.join(File.dirname(__FILE__ ), 'lambdas')
$LOAD_PATH.push(lambda_folder)

def execute(event:, context:)
  lambda_name = 'images'.downcase
  lambda_instance = "HuntersLodge::#{lambda_name.capitalize}".constantize
  load("#{lambda_name}.rb") unless defined?(lambda_instance)

  data = JSON.parse(event['body'])
  result = lambda_instance.execute(
    data['query'],
    variables: data['variables'],
    operation_name: payload['operationName'],
    context: { current_user: nil }
  )

  {
    statusCode: 200,
    body: JSON.generate(result)
  }
end