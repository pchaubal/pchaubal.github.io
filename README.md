This is a repository to host my personal website.
Checkout my website : https://pchaubal.github.io


The rest of information is for my reference in future.

To build the image with docker, use
```
sudo docker build -t jekyll_pc .
```
To run the container, use
```
sudo docker run -it --rm \
    -v "$PWD:/mysite" \
    -p 4000:4000 \ 
    jekyll_pc
```
The website should be visible on localhost:4000
