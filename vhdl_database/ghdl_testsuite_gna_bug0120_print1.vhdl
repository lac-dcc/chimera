entity print1 is
end;

architecture behav of print1 is
  --  Check comment 1
    --  Check comment 2

  --  Check long declaration indentation
  constant bv1 : bit_vector :=
       "0010001";
constant bv2 : bit_vector := x"af";
    -- Trailing comment
begin
  /* A long comment
     for vhdl 08
  */

  process
  begin
    if(true/=false)
      then
       report "OK";
     end if;
 end process;
end behav;
