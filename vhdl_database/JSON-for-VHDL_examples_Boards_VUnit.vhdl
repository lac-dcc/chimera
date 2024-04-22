library vunit_lib;
context vunit_lib.vunit_context;

library JSON;
context JSON.json_ctx;

entity tb_boards is
  generic (
    runner_cfg  : string;
    tb_cfg      : string
  );
end entity;

architecture tb of tb_boards is

  procedure test_board0(JSONContent : T_JSON) is
    constant img_arr : integer_vector := jsonGetIntegerArray(JSONContent, "2");
    constant ref_arr : integer_vector := (9,8);
  begin
    assert jsonGetString(JSONContent, "0") = "test" severity failure;

    assert jsonGetBoolean(JSONContent, "1/0") severity failure;
    assert not jsonGetBoolean(JSONContent, "1/1") severity failure;
    assert positive'value(jsonGetString(JSONContent, "1/2")) = 18 severity failure;
    assert jsonIsNull(JSONContent, "1/3") severity failure;
    assert jsonGetString(JSONContent, "1/4") = "hello" severity failure;

    assert jsonGetString(JSONContent, "2/0") = "9" severity failure;
    assert jsonGetString(JSONContent, "2/1") = "8" severity failure;
    for i in 0 to img_arr'length-1 loop
      assert img_arr(i) = ref_arr(i) severity failure;
    end loop;

    assert real'value(jsonGetString(JSONContent, "3")) = 3324.34 severity failure;

    assert natural'value(jsonGetString(JSONContent, "4")) = 832432 severity failure;

    assert jsonGetString(JSONContent, "5") = "world" severity failure;
  end procedure;

  procedure test_board1(JSONContent : T_JSON) is
  begin
    report "JSONContent: " & lf & JSONContent.Content severity note;
    assert jsonGetString(JSONContent, "ML505/FPGA") = "XC5VLX50T-1FF1136" severity failure;
    assert jsonGetString(JSONContent, "ML505/Eth/0/PHY-Int") = "GMII" severity failure;
    assert jsonGetString(JSONContent, "KC705/FPGA") = "XC7K325T-2FFG900C" severity failure;
    assert jsonGetString(JSONContent, "KC705/IIC/0/Devices/0/Name") = "Si570" severity failure;
  end procedure;
begin
  main: process
  begin
    test_runner_setup(runner, runner_cfg);
    while test_suite loop
      info("RAW generic: " & tb_cfg);
      if run("stringified JSON generic") then
        test_board1(jsonLoad(tb_cfg));
      elsif run("b16encoded stringified JSON generic") then
        test_board1(jsonLoad(tb_cfg));
      elsif run("JSON file path generic") then
        test_board0(jsonLoad(tb_cfg));
      elsif run("b16encoded JSON file path generic") then
        test_board0(jsonLoad(tb_cfg));
      end if;
    end loop;
    test_runner_cleanup(runner);
    wait;
  end process;
end architecture;
