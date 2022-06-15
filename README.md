# View Component Styles

Stylesheet aggregation for view components. Automatically combines component-specific stylesheets into a single sheet
that can be included in a single location. Great for using components in mailers, aggregating styles, then loading them
all at once so they can be pulled into premailer.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'view_component-styles'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install view_component-styles

## Usage

```ruby
class ApplicationComponent < ViewComponent::Base
  extend ViewComponent::Styles::Component
end
```
```ruby
class ApplicationMailer < ActionMailer::Base
  include ViewComponent::Styles::Controller
  helper ViewComponent::Styles::Helper
end
```
Then just create a component and a matching CSS/SCSS file like so:

`components/user_component.rb`
```ruby
class UserComponent < ApplicationComponent
  def initialize(user)
    @user = user
  end
end
```
`components/user_component.scss`
```scss
.name {
  font-style: italic;
}
```
`components/user_component.html.erb`
```html
<div class="name">
  <%= @user.name %>
</div>
```
In your layout, all you have to do is include the single stylesheet tag:

`views/layouts/layout.html.erb`
```html
<html>
<head>
  <%= singleton_stylesheet_link_tags %>
</head>
<body>
  <%= yield %>
</body>
</html>
```
At this point you're all set up! Whenever a component is included in a view that renders inside the configured layout,
styles will be aggregated into a single stylesheet and then loaded right into the layout. From here, they can be
rendered regularly or picked up by premailer for inlining.

Note that in order to properly configure the asset pipeline in Rails to compile component stylesheets, you may
need to add the following configuration:

`assets/config/manifest.js`
```
//= link_tree ../../components .css
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/thriver/view_component-styles.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
