library vunit_lib;
context vunit_lib.vunit_context;

library JSON;
use JSON.Encodings.all;

entity tb_encodings is
  generic (runner_cfg : string);
end entity;

architecture tb of tb_encodings is
  constant str: string := "[""test"",[true,false,18,null,""hello""],[9,8],3324.34,832432,""world""]";
  constant enc: string := "5b2274657374222c5b747275652c66616c73652c31382c6e756c6c2c2268656c6c6f225d2c5b392c385d2c333332342e33342c3833323433322c22776f726c64225d";
begin
  main : process
    variable v_str: string(str'left+10 to str'right+10) := str;
    variable v_enc: string(enc'left+15 to enc'right+15) := enc;
  begin
    test_runner_setup(runner, runner_cfg);

    check_equal(base16_encode(str), enc);
    check_equal(base16_encode(v_str), enc);

    check_equal(base16_decode(enc), str);
    check_equal(base16_decode(v_enc), str);

    test_runner_cleanup(runner);
  end process;
end architecture;
