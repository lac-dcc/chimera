architecture wb0 of test is
begin
  process
  begin
    rga_loglevel(rgacmd, LOG_DEBUG);
    wait for 1 us;
    rga_write(rgacmd, RGA_STRHOR,  x"cafe");
    rga_write(rgacmd, RGA_DIWSTRT, x"2c81");
    rga_write(rgacmd, RGA_DIWSTOP, x"f4c1");
    rga_write(rgacmd, RGA_BPLCON0, x"2000");
    rga_write(rgacmd, RGA_BPLCON1, x"0022");
    wait for 8 us;

    rga_write(rgacmd, RGA_COLOR00, x"0000");
    rga_write(rgacmd, RGA_COLOR01, x"0111");
    rga_write(rgacmd, RGA_COLOR02, x"0222");
    rga_write(rgacmd, RGA_COLOR03, x"0333");
    rga_write(rgacmd, RGA_COLOR04, x"0444");
    rga_write(rgacmd, RGA_COLOR05, x"0555");
    rga_write(rgacmd, RGA_COLOR06, x"0666");
    rga_write(rgacmd, RGA_COLOR07, x"0777");

    rga_write(rgacmd, RGA_BPL2DAT, x"3c33");
    rga_write(rgacmd, RGA_COLOR07, x"0777");
    rga_write(rgacmd, RGA_BPL1DAT, x"5555");
    rga_write(rgacmd, RGA_COLOR07, x"0777");

    rga_write(rgacmd, RGA_BPL2DAT, x"0f30");
    rga_write(rgacmd, RGA_COLOR07, x"0777");
    rga_write(rgacmd, RGA_BPL1DAT, x"0f50");
    rga_write(rgacmd, RGA_COLOR07, x"0777");

    wait for 1 us;
    rga_write(rgacmd, RGA_COLOR07, x"0777");

    rga_write(rgacmd, RGA_BPL2DAT, x"aaaa");
    rga_write(rgacmd, RGA_COLOR07, x"0777");
    rga_write(rgacmd, RGA_BPL1DAT, x"aaaa");
    rga_write(rgacmd, RGA_COLOR07, x"0777");

    rga_write(rgacmd, RGA_BPL2DAT, x"aaaa");
    rga_write(rgacmd, RGA_COLOR07, x"0777");
    rga_write(rgacmd, RGA_BPL1DAT, x"aaaa");
    rga_write(rgacmd, RGA_COLOR07, x"0777");

    rga_write(rgacmd, RGA_BPL2DAT, x"aaaa");
    rga_write(rgacmd, RGA_COLOR07, x"0777");
    rga_write(rgacmd, RGA_BPL1DAT, x"aaaa");
    rga_write(rgacmd, RGA_COLOR07, x"0777");

    rga_write(rgacmd, RGA_BPL2DAT, x"aaaa");
    rga_write(rgacmd, RGA_COLOR07, x"0777");
    rga_write(rgacmd, RGA_BPL1DAT, x"aaaa");
    rga_write(rgacmd, RGA_COLOR07, x"0777");

    wait for 8*10 us;

    wait for 3 us;
    end_of_simulation <= true;
    wait;
  end process;
end;

configuration wb0 of tb is
  for beh for tc: testcode
      use entity work.test(wb0);
  end for; end for;
end;

