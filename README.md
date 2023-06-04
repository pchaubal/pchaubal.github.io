This is a repository to host my personal website.
Checkout my website : https://pchaubal.github.io

The rest of information is for my reference in future.

Build the image with:
sudo docker build -t jekyll_pc_2 .

To run it with Docker:

sudo docker run -it --entrypoint=/bin/bash  --rm  --volume="$PWD:/mysite" -p 4000:4000 jekyll_pc_2
