
require 'rake/testtask'

task :default => [:test]

desc "Se ejecutan todas las pruebas que se han programado."
Rake::TestTask.new do |t|
    t.libs << "test"
    t.test_files = FileList['test/tc_*.rb']
    t.verbose = true 
    t.warning = true
end

desc "Run a specific test, provide a test name or a /regexp/"
task :t, :test_name do |t, args|
    # En caso del argumento vacío se ejecuta el test_typecheck
  test_name = args[:test_name] || 'test_typecheck' 
    # -w añado el detalle, --name selecciono el bloque 
  sh "ruby -w -Ilib test/tc_*.rb --name #{test_name}" 
end
