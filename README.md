# mattkelly.io

A personal working laboratory for Matt Kelly, Esq.

## Requirements

- PostgreSQL 16
- Redis
- Ruby 3.2.2
- [docco-next](https://github.com/mobily-enterprises/docco-next)

## Deploy

`git push dokku trunk`

# Architecture

- Thin is the little web server that could.
- Sinatra handles the routing.
- Redis & Sidekiq are used for [scheduled] background processing.
- All views are written in [Markaby](https://github.com/markaby/markaby)
- Additionally, a literate view of each source page is generated in the `/docs` folder. Thanks [Jeremy Ashkenas](https://ashkenas.com/docco/)!

## Contributing

No.
