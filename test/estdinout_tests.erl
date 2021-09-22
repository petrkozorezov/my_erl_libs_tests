-module(estdinout_tests).
-include_lib("eunit/include/eunit.hrl").

base_test() ->
  ?assertMatch({ok, <<"hello">>}, estdinout:run("echo -n hello", <<>>)).
