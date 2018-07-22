# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "blog-jekyll"
  spec.version       = "1.0.0"
  spec.authors       = ["Pho Huynh"]
  spec.email         = ["shortgiraffe4@gmail.com"]

  spec.summary       =  "My personal blog"
  spec.description   = %q{Pho Huynh - Personal blog}
  spec.homepage      = "https://github.com/shortgiraffe4/blog-jekyll"
  spec.license       = "MIT"

  spec.files         = Dir.glob("**/{*,.*}").select do |f|
    f.match(%r{^(assets/(js|css|fonts|data)|_(includes|layouts|sass)/|(LICENSE|README.md|data.json))}i)
  end

  spec.required_ruby_version = '~> 2.1'
    
  spec.add_runtime_dependency "jekyll", "~> 3.8.3"
  spec.add_runtime_dependency "jekyll-paginate", "~> 1.1.0"
  spec.add_runtime_dependency "jekyll-seo-tag", "~> 2.5.0"
  spec.add_runtime_dependency "jekyll-sitemap", "~> 1.2.0"
  spec.add_runtime_dependency "wdm", "~> 0.1.0"

  spec.add_development_dependency "bundler", "~> 1.16.3"
  spec.add_development_dependency "rake", "~> 10.5.0"

end
