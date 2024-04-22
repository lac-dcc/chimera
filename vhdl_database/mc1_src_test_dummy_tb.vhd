library vunit_lib;
context vunit_lib.vunit_context;

entity dummy_tb is
  generic (runner_cfg : string);
end entity;

architecture tb of dummy_tb is
begin
  main : process
  begin
    test_runner_setup(runner, runner_cfg);

    report "Hello world!";

    test_runner_cleanup(runner);
  end process;
end architecture;