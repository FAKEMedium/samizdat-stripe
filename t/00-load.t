use strict;
use warnings;
use Test::More;
use_ok('Samizdat::Model::Stripe');
use_ok('Samizdat::Controller::Stripe');
use_ok('Samizdat::Plugin::Stripe');
use YAML::XS qw(LoadFile);
use File::Spec;
my ($d) = grep { -d } map { File::Spec->catdir($_, 'Samizdat','resources') } @INC;
ok($d, 'resources dir is on @INC');
my $schema = eval { LoadFile(File::Spec->catfile($d,'settings','stripe','schema.yml')) };
ok(ref $schema eq 'HASH', 'stripe settings schema loads')
  and is($schema->{'x-samizdat-audience'}, 'operator', 'audience is operator');
ok(-d File::Spec->catdir($d,'templates','stripe'), 'stripe templates ship');
ok(scalar(glob(File::Spec->catfile($d,'migrations','pg','*-stripe.sql'))), 'stripe pg migration ships');
done_testing;
