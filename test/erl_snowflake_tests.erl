-module(erl_snowflake_tests).
-include_lib("eunit/include/eunit.hrl").

base_test() ->
  ?assertMatch({_, _, _}, erl_snowflake:generate()).

config_overrides_test() ->
  ?assertMatch(ok, erl_snowflake:set_machine_id(8000)).
