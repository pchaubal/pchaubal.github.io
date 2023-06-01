FROM ubuntu:focal

RUN apt-get update
RUN apt-get -q -y install ruby-full build-essential zlib1g-dev
RUN echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
RUN echo 'export GEM_HOME=\"$HOME/gems\"' >> ~/.bashrc
RUN echo 'export PATH=\"$HOME/gems/bin:$PATH\"' >> ~/.bashrc
RUN echo 'export JEKYLL_ENV=production' >> ~/.bashrc

RUN mkdir /mysite
COPY . /mysite
WORKDIR /mysite
RUN gem install jekyll --version="~> 4.2.0"
Run gem install bundler
RUN bundle install 
RUN echo 'alias build_site="JEKYLL_ENV=production bundle exec jekyll build"' >> ~/.bashrc
RUN echo 'alias serve="JEKYLL_ENV=production bundle exec jekyll serve --host 0.0.0.0"' >> ~/.bashrc
CMD chsh -s /bin/bash
CMD source ~/.bashrc
CMD echo 'Start jekyll server with - serve'
CMD echo 'Build jekyll site with - build_site'
