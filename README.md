# Marley Spoon Test

A small application to consume the data from [Contentful](https://www.contentful.com/) (Content Delivery API) and display it.


### Preview of all recipes

![2021-10-18_20-38-20](https://user-images.githubusercontent.com/4205473/137780432-adf82975-2a05-4904-837e-068ed78ee499.png)


### The data for a recipe

![2021-10-18_20-38-34](https://user-images.githubusercontent.com/4205473/137780454-fd2efbc3-73c1-41fc-b1ba-3bffa253f495.png)


## Configuration


- Clone the repo
```
git clone git@github.com:DaryaAndreevna/marley_spoon_test.git
```

- Bundle
```
bundle install
```

- Set credentials

```
EDITOR="vi" rails credentials:edit
```

```
contentful:
  space: SPACE_ID
  access_token: ACCESS_TOKEN
```

- Start the application
```
rails server
```

- In case it's needed run:
```
bin/rails webpacker:install
```

### Tests
      
![2021-10-18_20-54-22](https://user-images.githubusercontent.com/4205473/137782421-532aeadf-ac84-4d05-a1ad-a70f77c36324.png)

