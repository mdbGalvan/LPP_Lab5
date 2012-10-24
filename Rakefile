
require 'rake/testtask'

task :default => [:test]

desc "Se ejecutan todas las pruebas que se han programado."
Rake::TestTask.new do |t|
    t.libs << "test"
    t.test_files = FileList['test/tc_*.rb']
    #t.verbose = true 
    #t.warning = true
end
