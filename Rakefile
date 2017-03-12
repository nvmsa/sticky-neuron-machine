desc "Removes existing builds and caches"
task :cleanup do
  sh "rm -rf _site/*"
  sh "rm -rf .asset-cache/"
end

desc "Builds the site into the _site directory"
task :build => [:cleanup] do
  jekyll("build")
  sh("touch _site/.nojekyll")
end

desc "Builds the site into the _site directory and serves it"
task :serve => [:cleanup] do
  jekyll("serve --watch")
end

desc "Builds the site and commits the current state"
task :commit => [:build] do
  Dir.chdir("_site") do
    git("add --all")
    git("commit -m 'Automated build: #{Time.now.utc.to_s}'")
  end
end

desc "Builds the site and deploys the current state to prudction"
task :deploy => [:commit] do
  Dir.chdir("_site") do
    git("push")
  end
end

def jekyll(directives = "")
  sh "JEKYLL_ENV=production bundle exec jekyll #{directives}"
end

def git(directives = "")
  sh "git #{directives}"
end
