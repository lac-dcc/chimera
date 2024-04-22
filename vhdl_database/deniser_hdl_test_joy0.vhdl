architecture joy0 of test is
begin
  process
    variable data0 : word_t;
  begin
    rga_loglevel(rgacmd, LOG_DEBUG);
    wait for 1 us;
    rga_write(rgacmd, RGA_STRHOR,  x"cafe");
    rga_write(rgacmd, RGA_DIWSTRT, x"2c81");
    rga_write(rgacmd, RGA_DIWSTOP, x"f4c1");
    rga_write(rgacmd, RGA_BPLCON0, x"2000");
    rga_write(rgacmd, RGA_BPLCON1, x"0022");
    wait for 8 us;

    rga_read (rgacmd, RGA_JOY0DAT, data0);
    rga_write(rgacmd, RGA_JOYTEST, x"55aa");
    rga_read (rgacmd, RGA_JOY0DAT, data0);
    assert data0(15 downto 10) = "010101";
    assert data0( 7 downto  2) = "101010";

    wait for 3 us;
    end_of_simulation <= true;
    wait;
  end process;
end;

configuration joy0 of tb is
  for beh for tc: testcode
      use entity work.test(joy0);
  end for; end for;
end;

