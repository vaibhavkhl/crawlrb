## crawlrb
simple web crawler to fetch links from a url

#### Dependencies
Ruby 2+

#### Setup
```
git clone https://github.com/vaibhavkhl/crawlrb.git
cd crawlrb
bundle
```

#### How to use
Run ```bin/crawl https://github.com 5``` cmd from crawldb dir.

- last argument is optional which specifies the max no. of urls to visit to fetch links.
- once execution finishes or user stops it using ```ctrl + c```, script exports all the links fetched to links.txt file.

#### Testing using rspec
run ```rspec spec/link_crawler_spec.rb``` cmd to run specs.
