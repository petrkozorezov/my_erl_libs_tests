-module(erl_eval_records_tests).
-include_lib("eunit/include/eunit.hrl").
-export_type([foo/0]).
-record(foo, {a}).
-type foo() :: #foo{}.

simple_test() ->
  {ok, Tokens  , _} = erl_scan:string("#foo{a=A} = {foo, 42}, A."),
  {ok, Exprs      } = erl_parse:parse_exprs(Tokens),
  NewExprs          = erl_eval_records:expand(erl_eval_records:load(?MODULE), Exprs),
  {value, Value, _} = erl_eval:exprs(NewExprs, []),
  ?assertEqual(Value, 42).
