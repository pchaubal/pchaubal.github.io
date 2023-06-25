FROM ruby:slim

RUN mkdir /copy
COPY ./ copy/
WORKDIR /copy
RUN apt update
RUN apt -q -y install build-essential
RUN apt -q -y install manpages-dev
RUN apt -q -y install git
RUN gem install html-proofer -v 3.19.4 
RUN gem install jekyll-sass-converter -v 2.2.0 
RUN gem install jekyll-paginate -v 1.1.0 
RUN gem install jekyll-redirect-from -v 0.16.0  
RUN gem install jekyll-seo-tag -v 2.8.0 
RUN gem install jekyll-archives -v 2.2.1 
RUN gem install jekyll-sitemap -v 1.4.0 
RUN gem install nokogiri 
RUN gem install parallel -v 1.23.0 
RUN gem install rainbow -v 3.1.1 
RUN gem install typhoeus -v 1.4.0 
RUN gem install yell -v 2.2.2 
RUN gem install sassc -v 2.4.0 
RUN gem install i18n -v 1.14.0 
RUN gem install rouge -v 4.1.1 
RUN gem install ethon -v 0.16.0
RUN gem install jekyll -v 4.3.2
RUN gem install bundler
RUN bundle exec jekyll build
WORKDIR /mysite
RUN echo 'alias serve="JEKYLL_ENV=production bundle exec jekyll serve --host 0.0.0.0"' >> ~/.bashrc
RUN echo 'alias build_site="JEKYLL_ENV=production bundle exec jekyll build"' >> ~/.bashrc
CMD chsh -s /bin/bash
CMD source ~/.bashrc
RUN echo 'Start jekyll server with - serve'
RUN echo 'Build jekyll site with - build_site'
