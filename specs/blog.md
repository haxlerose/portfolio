# Blog Specifications

## Overview

A minimal, file-based blog with no database or admin interface. Posts are plain ERB view files committed to the repository.

## Architecture

- **Storage**: ERB view files in `app/views/blogs/posts/`
- **Database**: None - purely file-based
- **Authentication**: Not required for authoring (edit files directly)

## URL Structure

| Route | Description |
|-------|-------------|
| `/blogs` | Index page listing all posts (manually maintained) |
| `/blogs/:slug` | Individual post (e.g., `/blogs/my-first-post`) |

## File Structure

```
app/
├── controllers/
│   └── blogs_controller.rb
└── views/
    └── blogs/
        ├── index.html.erb      # Manual list of posts
        └── posts/
            ├── my-first-post.html.erb
            └── another-post.html.erb
```

## Routes

```ruby
get "blogs", to: "blogs#index"
get "blogs/:slug", to: "blogs#show", as: :blog_post
```

## Controller

```ruby
class BlogsController < ApplicationController
  def index
  end

  def show
    slug = params[:slug]
    # Only allow lowercase alphanumeric and hyphens (prevents directory traversal)
    if slug =~ /\A[a-z0-9\-]+\z/ && template_exists?("blogs/posts/#{slug}")
      render "blogs/posts/#{slug}"
    else
      raise ActionController::RoutingError, "Not Found"
    end
  end
end
```

- `index` - Renders the blog index page
- `show` - Dynamically renders posts by looking up the view file matching the slug
- Slug validation ensures only safe characters (lowercase letters, numbers, hyphens)
- Returns 404 if the template doesn't exist

## Workflow

1. Create a new ERB file in `app/views/blogs/posts/` (filename becomes the slug)
   - Example: `my-first-post.html.erb` → `/blogs/my-first-post`
2. Add a link to the post in `app/views/blogs/index.html.erb` (most recent first)
3. Commit, push, and deploy

No need to edit `routes.rb` - the controller dynamically finds the view file.

## Features

- No categories or tags
- No comments
- No draft/published status
- No RSS feed
- No metadata system

## Page Titles

- Index page: "Paul Chesterton Blogs"
- Individual posts: Derived from filename (e.g., `my-first-post` → "My First Post")

## Navigation

- Add "Blogs" link to the main navigation in `app/views/shared/_nav_links.html.erb`
- Position: Last item (after Contact)
- Links to `/blogs` (full page navigation, not an anchor link)

## Index Page Layout

- Rows of cards, most recent first
- Each card displays:
  - Post title (linked to the post)
  - Published date
- Card styling consistent with site theme (dark background, teal accents, rounded corners)

## Individual Post Layout

- "← Back to Blogs" link at top
- Post title (h1)
- Published date
- Post content
- Styling consistent with site theme

## Styling Guidelines

Based on existing site patterns:
- Background: `bg-gray-800` for cards, `bg-gray-900` for page
- Text: `text-white`, `font-extralight`
- Accents: `text-teal-400`, `hover:text-teal-600`
- Borders: `border border-gray-700 rounded-lg`
- Spacing: Consistent with existing sections (`px-2`, `py-4`, etc.)
