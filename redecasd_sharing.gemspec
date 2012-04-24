# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'redecasd_sharing/version'

Gem::Specification.new do |s|
  s.name        = 'redecasd_sharing'
  s.version     = RedecasdSharing::VERSION
  s.authors     = ['Dalton']
  s.email       = ['dalthon@aluno.ita.br']
  s.homepage    = ''
  s.summary     = %q{Custom FTP Server for sharing files on LANs}
  s.description = %q{Custom FTP Server for sharing files on LANs, it supports full text search queries via UDP broadcasts, and index content data of files}

  s.rubyforge_project = 'redecasd_sharing'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_dependency 'fssm'          # Monitor file and dir changes
  s.add_dependency 'em-ftpd'       # FTP server, based on EventMachine
  s.add_dependency 'sunspot'       # Search Engine, solr/lucene powered
  s.add_dependency 'sinatra'       # Simple web framework used to admin and query interface
  s.add_dependency 'pdf-reader'    # PDF parser, used to make possible indexing pdf content data
  s.add_dependency 'bcrypt-ruby'   # Used to authentication

  s.add_development_dependency 'rake'
end
