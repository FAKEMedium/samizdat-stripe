# Samizdat-Plugin-Stripe

Stripe payments — an **operator** payment module for [Samizdat](https://fakenews.com).
Used by Samizdat-Plugin-Invoice (helper-guarded) to take payment on invoices.
Extracted from the monorepo with history.

## Layout

    lib/Samizdat/Plugin/Stripe.pm        routes + the `stripe` helper
    lib/Samizdat/Controller/Stripe.pm    request handlers (incl. webhook/callback)
    lib/Samizdat/Model/Stripe.pm         payment API client
    lib/Samizdat/resources/templates/stripe/    views
    lib/Samizdat/resources/settings/stripe/     JSON-Schema config (operator; writeOnly secrets)
    lib/Samizdat/resources/locale/stripe/       translations
    lib/Samizdat/resources/migrations/pg/   the `stripe` schema (fresh-snapshot migration)

## Dependencies

- **Samizdat** (core) — Cache, settings resolver, the migration loader. Not on CPAN; PERL5LIB or install.
- Mojolicious, Hash::Merge.

## Install

    perl Makefile.PL && make && make test    # core on PERL5LIB
    make install

Enable via `extraplugins: [Stripe]` and configure `manager.stripe` (API keys/secrets;
certs are deployment secrets, never shipped here).
