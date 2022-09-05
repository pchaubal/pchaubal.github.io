FROM ubuntu:focal

RUN apt-get update
RUN apt-get -q -y install ruby-full build-essential zlib1g-dev
RUN echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc \
    echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc \
    echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc \
    source ~/.bashrc
RUN mkdir /mysite
COPY . /mysite
WORKDIR /mysite
RUN gem install jekyll bundler
RUN bundle install 
CMD bundle exec jekyll serve