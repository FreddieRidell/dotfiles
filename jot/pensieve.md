## 2018-12-20

- A tool for rendering markdown to 16 color ansi terminal output, better than `bat`ing a raw markdown file, as it would remove all the meta junk

## 2018-12-21

- Find out how good of a website can be made, using react components, no client side javascript, aiming for maximum parity with modern frontend web apps
  - See how much functionality you can get out of forms for flow control
  - Extend `reach-router` to inject a more functionality into core components
  - Implement system for responding to request with logic, then returning react UI.

## 2018-12-26

- Look through all the top NPM packages, see if
- I should amend babel-preset-freddie-ridell to use the minify plugin when `NODE_ENV === production`

## 2019-01-07

- I should find out about what happens when you access a rust enum without passing it any parameters, it seems to resolve to a function?

## 2019-01-14

- a set of hooks and components that handles form input the way I like
  - `const form = useForm(); const paginationProps = usePagination(form); const usernameProps = useTextInput(form);`
  - `<Form form = { form }><Pagination {...paginationProps} ><Fragment><Username { ...usernameProps }/></Fragment></Pagination></Form>`
  - an object that stores all data about the form, additional hooks create props to pass to individual form elements, but they each point back to the core object
  - possibly configure the whole form in one object, with an array of fields for each page
  - anything's got to be be better than the current librarys -\_-

## 2019-01-16

- it would be pretty easy and nice to build a Dat podcasting client, even though there's currently really only one show on the datverse
