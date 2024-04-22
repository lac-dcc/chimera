------------------------------------------------------------------------------------------------
--
-- Copyright (C) 2010-: Madhav P. Desai
-- All Rights Reserved.
--  
-- Permission is hereby granted, free of charge, to any person obtaining a
-- copy of this software and associated documentation files (the
-- "Software"), to deal with the Software without restriction, including
-- without limitation the rights to use, copy, modify, merge, publish,
-- distribute, sublicense, and/or sell copies of the Software, and to
-- permit persons to whom the Software is furnished to do so, subject to
-- the following conditions:
-- 
--  * Redistributions of source code must retain the above copyright
--    notice, this list of conditions and the following disclaimers.
--  * Redistributions in binary form must reproduce the above
--    copyright notice, this list of conditions and the following
--    disclaimers in the documentation and/or other materials provided
--    with the distribution.
--  * Neither the names of the AHIR Team, the Indian Institute of
--    Technology Bombay, nor the names of its contributors may be used
--    to endorse or promote products derived from this Software
--    without specific prior written permission.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
-- OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
-- MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
-- IN NO EVENT SHALL THE CONTRIBUTORS OR COPYRIGHT HOLDERS BE LIABLE FOR
-- ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
-- TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
-- SOFTWARE OR THE USE OR OTHER DEALINGS WITH THE SOFTWARE.
------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Authors: Abhishek R. Kamath & Prashant Singhal
-- An IEEE-754 compliant Double-Precision pipelined multiplier
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity DoublePrecisionMultiplier is
  generic (name: string; tag_width : integer);
  port(
    INA, INB: in std_logic_vector(63 downto 0);   
    OUTM: out std_logic_vector(63 downto 0);
    clk,reset: in std_logic;
    tag_in: in std_logic_vector(tag_width-1 downto 0);
    tag_out: out std_logic_vector(tag_width-1 downto 0);
    NaN, oflow, uflow: out std_logic := '0';
    env_rdy, accept_rdy: in std_logic;
    muli_rdy, mulo_rdy: out std_logic);
end entity;

architecture rtl of DoublePrecisionMultiplier is

  type parpro is array (0 to 52) of std_logic_vector(52 downto 0);

  signal rdy1,rdy2,rdy3,rdy4,rdy5,rdy6,rdy7,rdy8,rdy9,rdy10,rdy11,rdy12: std_logic := '0';
  signal flag3,flag4,flag5,flag6,flag7,flag8,flag9,flag10,flag11: std_logic_vector(1 downto 0);
  signal fman11: std_logic_vector(51 downto 0);
  signal tag1,tag2,tag3,tag4,tag5,tag6,tag7,tag8,tag9,tag10,tag11: std_logic_vector(tag_width-1 downto 0);
  signal pipeline_stall: std_logic := '0';

  signal aman_1,aman_2,bman_1,bman_2: std_logic_vector(52 downto 0);
  signal anan1,bnan1,azero1,bzero1,ainf1,binf1,osgn1: std_logic := '0'; 
  signal aexp_s1,bexp_s1: std_logic_vector(10 downto 0);

  signal nocalc2,nocalc3,nocalc4,nocalc5,nocalc6,nocalc7,nocalc8,nocalc9,nocalc10,nocalc11: std_logic;-- := '0';
  signal output_s2,output_s23,output_s24,output_s25,output_s26,output_s27,output_s28,output_s29,output_s210,output_s211: std_logic_vector(2 downto 0);
  signal int_exp: std_logic_vector(11 downto 0);

  signal fexp3,fexp4,fexp5,fexp6,fexp7,fexp8,fexp9,fexp10,fexp11: std_logic_vector(10 downto 0);-- := X"00";

  signal pp: parpro;
  signal tr_400,tr_401,tr_402,tr_403,tr_404,tr_405,tr_406,tr_407,tr_408,tr_409,tr_410,tr_411,tr_412: std_logic_vector(105 downto 0);
  signal tr_413,tr_414,tr_415,tr_416,tr_417,tr_418,tr_419,tr_420,tr_421,tr_422,tr_423,tr_424,tr_425,tr_426: std_logic_vector(105 downto 0);

  signal tr501,tr502,tr503,tr504,tr505,tr506,tr507,tr508,tr509,tr510,tr511,tr512,tr513,tr514: std_logic_vector(105 downto 0);
  signal tr61,tr62,tr63,tr64,tr65,tr66,tr67: std_logic_vector(105 downto 0);
  signal tr71,tr72,tr73,tr74,tr71_int1,tr72_int1,tr71_int2: std_logic_vector(105 downto 0);


  signal tr401,tr402,tr403,tr404,tr405,tr406,tr407,tr408,tr409,tr410,tr411,tr412: std_logic_vector(105 downto 0);-- := X"000000000000";
  signal tr413,tr414,tr415,tr416,tr417,tr418,tr419,tr420,tr421,tr422,tr423,tr424: std_logic_vector(105 downto 0);-- := X"000000000000";
  signal tr425,tr426,tr427,tr428,tr429,tr430,tr431,tr432,tr433,tr434,tr435,tr436: std_logic_vector(105 downto 0);-- := X"000000000000";
  signal tr437,tr438,tr439,tr440,tr441,tr442,tr443,tr444,tr445,tr446,tr447,tr448: std_logic_vector(105 downto 0);-- := X"000000000000";
  signal tr449,tr450,tr451,tr452,tr453: std_logic_vector(105 downto 0);-- := X"000000000000";

begin

  stage_1: process(clk,reset)

    variable asgn,bsgn,osgn: std_logic := '0';
    variable aexp,bexp: std_logic_vector(10 downto 0);-- := "000" & X"00";
    variable aman,bman: std_logic_vector(52 downto 0);-- := "000000000000000000000000";
    variable anan,bnan,azero,bzero,ainf,binf: std_logic;-- := '0';

  begin
    if reset = '1' then
      rdy1 <= '0';
    else
      if clk'event and clk='1'then
        if env_rdy = '1' and pipeline_stall = '0' then
          --asgn1 <= INA(63);
          --bsgn1 <= INB(63);
          --aexp1 <= INA(62 downto 52);
          --bexp1 <= INB(62 downto 52);
          --aman1 <= '1' & INA(51 downto 0);
          --bman1 <= '1' & INB(51 downto 0);
          --rdy1 <= '1';
          

          --asgn := INA(63);
          --bsgn := INB(63);
          --osgn := INA(63) xor INB(63);

          
          aexp := INA(62 downto 52);
          bexp := INB(62 downto 52);
          aman := '1' & INA(51 downto 0);
          bman := '1' & INB(51 downto 0);
          
          
          
          if(aexp="111" & X"FF") then
            if(unsigned(aman)=0) then
              ainf := '1';
              anan := '0';
              azero := '0';
            else
              anan := '1';
              azero := '0';
              ainf := '0';
            end if;
          elsif(aexp="000"&X"00") then
            if unsigned(aman)=0 then
              azero := '1';
              ainf := '0';
              anan := '0';
            end if;
          else
            ainf := '0';
            anan := '0';
            azero := '0';
          end if;
          
          if(bexp="111"& X"FF") then
            if(unsigned(bman)=0) then
              binf := '1';
              bnan := '0';
              bzero := '0';
            else
              bnan := '1';
              bzero := '0';
              binf := '0';
            end if;
          elsif(bexp="000" & X"00") then
            if unsigned(bman)=0 then
              bzero := '1';
              binf := '0';
              bnan := '0';
            end if;
          else
            binf := '0';
            bnan := '0';
            bzero := '0';
          end if;

          osgn1 <= INA(63) xor INB(63);
          
          ainf1 <= ainf;
          binf1 <= binf;
          anan1 <= anan;
          bnan1 <= bnan;
          azero1 <= azero;
          bzero1 <= bzero;
          
          aexp_s1 <= aexp;
          bexp_s1 <= bexp;
          aman_1 <= aman;
          bman_1 <= bman;


          rdy1 <= '1';
          tag1 <= tag_in;
          
        elsif pipeline_stall = '1' then
        elsif env_rdy = '0' then
          rdy1 <= '0';
        end if;
      end if;
    end if;
  end process stage_1;





  stage_2: process(clk,reset)
  begin
    if reset = '1' then
      rdy2 <= '0';
    else
      if clk'event and clk='1'then
        if rdy1 = '1' and pipeline_stall = '0' then
          if (anan1 = '1' or bnan1 = '1') then
            output_s2 <= osgn1 & "10";
            nocalc2 <= '1';
          elsif (azero1 = '1' and binf1 = '1') or (ainf1 = '1' and bzero1 = '1') then
            output_s2 <= osgn1 & "10";
            nocalc2 <= '1';
          elsif azero1 = '1' or bzero1 = '1' then
            output_s2 <= osgn1 & "00";
            nocalc2 <= '1';
          elsif ainf1 = '1' or binf1 = '1' then
            output_s2 <= osgn1 & "11";
            nocalc2 <= '1';
          else
            int_exp <= std_logic_vector(unsigned('0' & aexp_s1) + unsigned('0' & bexp_s1));
            output_s2 <= osgn1 & "01";
            nocalc2 <= '0';
          end if;
          --aexp_s3 <= aexp_s2;
          --bexp_s3 <= bexp_s2;
          aman_2 <= aman_1;
          bman_2 <= bman_1;
          rdy2 <= '1';
          tag2 <= tag1;
          
          
        elsif pipeline_stall = '1' then
        elsif rdy1 = '0' then
          rdy2 <= '0';
        end if;
      end if;
    end if;
  end process stage_2;




  stage_3: process(clk,reset)

    variable exp3: unsigned(11 downto 0);

  begin
    if reset = '1' then
      rdy3 <= '0';
    else
      if clk'event and clk='1'then
        if rdy2 = '1' and pipeline_stall = '0' then
          if nocalc2 = '1' then
            nocalc3 <= '1';
            output_s23 <= output_s2;
            flag3 <= "00";
          elsif nocalc2 = '0' then
            exp3 := unsigned(int_exp);
            if(exp3 > 3069) then
              output_s23 <= output_s2(2) & "11";
              nocalc3 <= '1';
              flag3 <= "10";
            elsif(exp3 < 1023) then
              output_s23 <= output_s2(2) & "00";
              nocalc3 <= '1';
              flag3 <= "01";
            else
              exp3 := exp3 - 1023;
              output_s23 <= output_s2(2) & "01";
              nocalc3 <= '0';
              flag3 <= "00";
            end if;	
          end if;
          --aman_3 <= aman_2;
          --bman_3 <= bman_2;
          fexp3 <= std_logic_vector(exp3(10 downto 0));
          rdy3 <= '1';
          tag3 <= tag2;

          for i in 0 to 52 loop
            for j in 0 to 52 loop
              pp(i)(j) <= aman_2(j) and bman_2(i);
            end loop;
          end loop;

        elsif pipeline_stall = '1' then
        elsif rdy2 = '0' then
          rdy3 <= '0';
        end if;
      end if;
    end if;
  end process stage_3;





  stage_4: process(clk,reset)
  begin
    if reset = '1' then
      rdy4 <= '0';
    else
      if clk'event and clk='1'then
        if rdy3 = '1' and pipeline_stall = '0' then
          if nocalc3 = '1' then
            nocalc4 <= '1';
          elsif nocalc3 = '0' then
            
            tr401 <= X"0000000000000" & '0' & pp(0);
            tr402 <= X"0000000000000" & pp(1) & '0';
            tr403 <= X"000000000000" & "000" & pp(2) & "00";
            tr404 <= X"000000000000" & "00" & pp(3) & "000";	

            tr405 <= X"000000000000" & '0' & pp(4) & X"0";
            tr406 <= X"000000000000" & pp(5) & X"0" & '0';
            tr407 <= X"00000000000" & "000" & pp(6) & X"0" & "00";
            tr408 <= X"00000000000" & "00" & pp(7) & X"0" & "000";

            tr409 <= X"00000000000" & '0' & pp(8) & X"00";
            tr410 <= X"00000000000" & pp(9) & X"00" & '0';
            tr411 <= X"0000000000" & "000" & pp(10) & X"00" & "00";
            tr412 <= X"0000000000" & "00" & pp(11) & X"00" & "000";

            tr413 <= X"0000000000" & '0' & pp(12) & X"000";
            tr414 <= X"0000000000" & pp(13) & X"000" & '0';
            tr415 <= X"000000000" & "000" & pp(14) & X"000" & "00";
            tr416 <= X"000000000" & "00" & pp(15) & X"000" & "000";

            tr417 <= X"000000000" & '0' & pp(16) & X"0000";
            tr418 <= X"000000000" & pp(17) & X"0000" & '0';
            tr419 <= X"00000000" & "000" & pp(18) & X"0000" & "00";
            tr420 <= X"00000000" & "00" & pp(19) & X"0000" & "000";

            tr421 <= X"00000000" & '0' & pp(20) & X"00000";
            tr422 <= X"00000000" & pp(21) & X"00000" & '0';
            tr423 <= X"0000000" & "000" & pp(22) & X"00000" & "00";
            tr424 <= X"0000000" & "00" & pp(23) & X"00000" & "000";

            tr425 <= X"0000000" & '0' & pp(24) & X"000000";
            tr426 <= X"0000000" & pp(25) & X"000000" & '0';
            tr427 <= X"000000" & "000" & pp(26) & X"000000" & "00";
            tr428 <= X"000000" & "00" & pp(27) & X"000000" & "000";

            tr429 <= X"000000" & '0' & pp(28) & X"0000000";
            tr430 <= X"000000" & pp(29) & X"0000000" & '0';
            tr431 <= X"00000" & "000" & pp(30) & X"0000000" & "00";
            tr432 <= X"00000" & "00" & pp(31) & X"0000000" & "000";

            tr433 <= X"00000" & '0' & pp(32) & X"00000000";
            tr434 <= X"00000" & pp(33) & X"00000000" & '0';
            tr435 <= X"0000" & "000" & pp(34) & X"00000000" & "00";
            tr436 <= X"0000" & "00" & pp(35) & X"00000000" & "000";

            tr437 <= X"0000" & '0' & pp(36) & X"000000000";
            tr438 <= X"0000" & pp(37) & X"000000000" & '0';
            tr439 <= X"000" & "000" & pp(38) & X"000000000" & "00";
            tr440 <= X"000" & "00" & pp(39) & X"000000000" & "000";

            tr441 <= X"000" & '0' & pp(40) & X"0000000000";
            tr442 <= X"000" & pp(41) & X"0000000000" & '0';
            tr443 <= X"00" & "000" & pp(42) & X"0000000000" & "00";
            tr444 <= X"00" & "00" & pp(43) & X"0000000000" & "000";

            tr445 <= X"00" & '0' & pp(44) & X"00000000000";
            tr446 <= X"00" & pp(45) & X"00000000000" & '0';
            tr447 <= X"0" & "000" & pp(46) & X"00000000000" & "00";
            tr448 <= X"0" & "00" & pp(47) & X"00000000000" & "000";

            tr449 <= X"0" & '0' & pp(48) & X"000000000000";
            tr450 <= X"0" & pp(49) & X"000000000000" & '0';
            tr451 <= "000" & pp(50) & X"000000000000" & "00";
            tr452 <= "00" & pp(51) & X"000000000000" & "000";

            tr453 <= '0' & pp(52) & X"0000000000000";

            nocalc4 <= '0';
            
          end if;

          
          output_s24 <= output_s23;
          fexp4 <= fexp3;
          flag4 <= flag3;
          rdy4 <= '1';
          tag4 <= tag3;
          
        elsif pipeline_stall = '1' then
        elsif rdy3 = '0' then
          rdy4 <= '0';
        end if;
      end if;
    end if;
  end process stage_4;


  stage_5: process(clk,reset)
  begin
    if reset = '1' then
      rdy5 <= '0';
    else
      if clk'event and clk='1'then
        if rdy4 = '1' and pipeline_stall = '0' then
          if nocalc4 = '1' then
            nocalc5 <= '1';
          elsif nocalc4 = '0' then
            
            tr_400 <= std_logic_vector(unsigned(tr401) + unsigned(tr402));
            tr_401 <= std_logic_vector(unsigned(tr403) + unsigned(tr404));
            tr_402 <= std_logic_vector(unsigned(tr405) + unsigned(tr406));
            tr_403 <= std_logic_vector(unsigned(tr407) + unsigned(tr408));
            tr_404 <= std_logic_vector(unsigned(tr409) + unsigned(tr410));
            tr_405 <= std_logic_vector(unsigned(tr411) + unsigned(tr412));
            tr_406 <= std_logic_vector(unsigned(tr413) + unsigned(tr414));
            tr_407 <= std_logic_vector(unsigned(tr415) + unsigned(tr416));
            tr_408 <= std_logic_vector(unsigned(tr417) + unsigned(tr418));
            tr_409 <= std_logic_vector(unsigned(tr419) + unsigned(tr420));
            tr_410 <= std_logic_vector(unsigned(tr421) + unsigned(tr422));
            tr_411 <= std_logic_vector(unsigned(tr423) + unsigned(tr424));

            tr_412 <= std_logic_vector(unsigned(tr425) + unsigned(tr426));
            tr_413 <= std_logic_vector(unsigned(tr427) + unsigned(tr428));
            tr_414 <= std_logic_vector(unsigned(tr429) + unsigned(tr430));
            tr_415 <= std_logic_vector(unsigned(tr431) + unsigned(tr432));
            tr_416 <= std_logic_vector(unsigned(tr433) + unsigned(tr434));
            tr_417 <= std_logic_vector(unsigned(tr435) + unsigned(tr436));
            tr_418 <= std_logic_vector(unsigned(tr437) + unsigned(tr438));
            tr_419 <= std_logic_vector(unsigned(tr439) + unsigned(tr440));
            tr_420 <= std_logic_vector(unsigned(tr441) + unsigned(tr442));
            tr_421 <= std_logic_vector(unsigned(tr443) + unsigned(tr444));
            tr_422 <= std_logic_vector(unsigned(tr445) + unsigned(tr446));
            tr_423 <= std_logic_vector(unsigned(tr447) + unsigned(tr448));

            tr_424 <= std_logic_vector(unsigned(tr449) + unsigned(tr450));
            tr_425 <= std_logic_vector(unsigned(tr451) + unsigned(tr452));
            tr_426 <= tr453;

            nocalc5 <= '0';
            
          end if;

          
          output_s25 <= output_s24;
          fexp5 <= fexp4;
          flag5 <= flag4;
          rdy5 <= '1';
          tag5 <= tag4;
          
        elsif pipeline_stall = '1' then
        elsif rdy4 = '0' then
          rdy5 <= '0';
        end if;
      end if;
    end if;
  end process stage_5;



  stage_6: process(clk,reset)
  begin
    if reset = '1' then
      rdy6 <= '0';
    else
      if clk'event and clk='1'then
        if rdy5 = '1' and pipeline_stall = '0' then
          if nocalc5 = '1' then
            nocalc6 <= '1';
          else
            tr501 <= std_logic_vector(unsigned(tr_400) + unsigned(tr_401));
            tr502 <= std_logic_vector(unsigned(tr_402) + unsigned(tr_403));
            tr503 <= std_logic_vector(unsigned(tr_404) + unsigned(tr_405));
            tr504 <= std_logic_vector(unsigned(tr_406) + unsigned(tr_407));
            tr505 <= std_logic_vector(unsigned(tr_408) + unsigned(tr_409));
            tr506 <= std_logic_vector(unsigned(tr_410) + unsigned(tr_411));

            tr507 <= std_logic_vector(unsigned(tr_412) + unsigned(tr_413));
            tr508 <= std_logic_vector(unsigned(tr_414) + unsigned(tr_415));
            tr509 <= std_logic_vector(unsigned(tr_416) + unsigned(tr_417));
            tr510 <= std_logic_vector(unsigned(tr_418) + unsigned(tr_419));
            tr511 <= std_logic_vector(unsigned(tr_420) + unsigned(tr_421));
            tr512 <= std_logic_vector(unsigned(tr_422) + unsigned(tr_423));

            tr513 <= std_logic_vector(unsigned(tr_424) + unsigned(tr_425));
            tr514 <= tr_426;
            
            nocalc6 <= '0';
          end if;

          output_s26 <= output_s25;
          fexp6 <= fexp5;
          flag6 <= flag5;
          rdy6 <= '1';
          tag6 <= tag5;
          
        elsif pipeline_stall = '1' then
        elsif rdy5 = '0' then
          rdy6 <= '0';
        end if;
      end if;
    end if;
  end process stage_6;



  stage_7: process(clk,reset)
  begin
    if reset = '1' then
      rdy7 <= '0';
    else
      if clk'event and clk='1'then
        if rdy6 = '1' and pipeline_stall = '0' then
          if nocalc6 = '1' then
            nocalc7 <= '1';
          else
            tr61 <= std_logic_vector(unsigned(tr501) + unsigned(tr502));
            tr62 <= std_logic_vector(unsigned(tr503) + unsigned(tr504));
            tr63 <= std_logic_vector(unsigned(tr505) + unsigned(tr506));

            tr64 <= std_logic_vector(unsigned(tr507) + unsigned(tr508));
            tr65 <= std_logic_vector(unsigned(tr509) + unsigned(tr510));
            tr66 <= std_logic_vector(unsigned(tr511) + unsigned(tr512));

            tr67 <= std_logic_vector(unsigned(tr513) + unsigned(tr514));
            
            
            nocalc7 <= '0';
          end if;

          output_s27 <= output_s26;
          fexp7 <= fexp6;
          flag7 <= flag6;
          rdy7 <= '1';
          tag7 <= tag6;
          
        elsif pipeline_stall = '1' then
        elsif rdy6 = '0' then
          rdy7 <= '0';
        end if;
      end if;
    end if;
  end process stage_7;

  stage_8: process(clk,reset)
  begin
    if reset = '1' then
      rdy8 <= '0';
    else
      if clk'event and clk='1'then
        if rdy7 = '1' and pipeline_stall = '0' then
          if nocalc7 = '1' then
            nocalc8 <= '1';
          else
            tr71 <= std_logic_vector(unsigned(tr61) + unsigned(tr62));
            tr72 <= std_logic_vector(unsigned(tr63) + unsigned(tr64));
            tr73 <= std_logic_vector(unsigned(tr65) + unsigned(tr66));
            tr74 <= tr67;
            
            nocalc8 <= '0';
          end if;
          
          output_s28 <= output_s27;
          fexp8 <= fexp7;
          flag8 <= flag7;
          rdy8 <= '1';
          tag8 <= tag7;
          
        elsif pipeline_stall = '1' then
        elsif rdy7 = '0' then
          rdy8 <= '0';
        end if;
      end if;
    end if;
  end process stage_8;

  stage_9: process(clk,reset)
  begin
    if reset = '1' then
      rdy9 <= '0';
    else
      if clk'event and clk='1'then
        if rdy8 = '1' and pipeline_stall = '0' then
          if nocalc8 = '1' then
            nocalc9 <= '1';
          else
            tr71_int1 <= std_logic_vector(unsigned(tr71) + unsigned(tr72));
            tr72_int1 <= std_logic_vector(unsigned(tr73) + unsigned(tr74));
            nocalc9 <= '0';
          end if;
          
          output_s29 <= output_s28;
          fexp9 <= fexp8;
          flag9 <= flag8;
          rdy9 <= '1';
          tag9 <= tag8;
          
        elsif pipeline_stall = '1' then
        elsif rdy8 = '0' then
          rdy9 <= '0';
        end if;
      end if;
    end if;
  end process stage_9;


  stage_10: process(clk,reset)
  begin
    if reset = '1' then
      rdy10 <= '0';
    else
      if clk'event and clk='1'then
        if rdy9 = '1' and pipeline_stall = '0' then
          if nocalc9 = '1' then
            nocalc10 <= '1';
          else
            tr71_int2 <= std_logic_vector(unsigned(tr71_int1) + unsigned(tr72_int1));
            nocalc10 <= '0';
          end if;
          
          output_s210 <= output_s29;
          fexp10 <= fexp9;
          flag10 <= flag9;
          rdy10 <= '1';
          tag10 <= tag9;
          
        elsif pipeline_stall = '1' then
        elsif rdy9 = '0' then
          rdy10 <= '0';
        end if;
      end if;
    end if;
  end process stage_10;



  stage_11: process(clk,reset)
    variable man8: std_logic_vector(53 downto 0);
    variable exp8: unsigned(10 downto 0);
  begin
    if reset = '1' then
      rdy11 <= '0';
    else
      if clk'event and clk='1'then
        if rdy10 = '1' and pipeline_stall = '0' then
          if nocalc10 = '1' then
            nocalc11 <= '1';
            output_s211 <= output_s210;
            flag11 <= flag10;
          elsif nocalc10 = '0' then
            man8 := tr71_int2(105 downto 52);
            exp8 := unsigned(fexp10);
            if man8(53) = '1' then
              if	exp8 = 2046 then
                output_s211 <= output_s210(2) & "11";
                nocalc11 <= '1';
                flag11 <= "10";
              else
                exp8 := exp8 + 1;
                nocalc11 <= '0';
                fman11 <= man8(52 downto 1);
                output_s211 <= output_s210;
                flag11 <= flag10;
              end if;
            elsif exp8 = 0 then
              output_s211 <= output_s210(2) & "00";
              nocalc11 <= '1';
              flag11 <= "01";
            else
              fman11 <= man8(51 downto 0);
              output_s211 <= output_s210;
              nocalc11 <= '0';
              flag11 <= flag10;
            end if;
          end if;		
          rdy11 <= '1';
          tag11 <= tag10;
          fexp11 <= std_logic_vector(exp8);
        elsif pipeline_stall = '1' then
        elsif rdy10 = '0' then
          rdy11 <= '0';
        end if;
      end if;
    end if;
  end process stage_11;


  stage_12: process(clk,reset)
    variable temp: std_logic_vector(2 downto 0);
  begin
    if reset = '1' then
      rdy12 <= '0';
    else
      if clk'event and clk='1'then
        if rdy11 = '1' and pipeline_stall = '0' then
          rdy12 <= '1';
          temp := output_s211;
          if nocalc11 = '1' then
            case(temp(1 downto 0)) is
              when("00") => OUTM <= temp(2) & "000" & X"000000000000000"; NaN <= '0'; oflow <= '0'; uflow <= flag10(0);
            when("10") => OUTM <= temp(2) & "111" & X"FF" & "1000" & X"000000000000"; NaN <= '1'; oflow <= '0'; uflow <= '0';
            when("11") => OUTM <= temp(2) & "111" & X"FF" & X"0000000000000"; NaN <= '0'; oflow <= flag10(1); uflow <= '0';
            when others => null; 
          end case;
          else
            OUTM <= temp(2) & fexp11 & fman11; NaN <= '0'; oflow <='0'; uflow <= '0';
          end if;
          tag_out <= tag11;
        else
          rdy12 <= '0';
        end if;
      end if;
    end if;
  end process stage_12;

  pipeline_stall <= (rdy12 and (not accept_rdy));
  muli_rdy <= not (rdy12 and (not accept_rdy));  
  mulo_rdy <= rdy12;


end rtl;
