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
-- An IEEE-754 compliant Single-Precision pipelined multiplier
--
--   rounding-scheme implemented is round-to-zero.
--   overflow/underflow exceptions are detected.
--
--   TODO: implement round-to-nearest since this
--         is preferred to reduce errors.
-- 
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity SinglePrecisionMultiplier is
  generic (name: string; tag_width : integer);
  port(
    INA, INB: in std_logic_vector(31 downto 0);
    OUTM: out std_logic_vector(31 downto 0);
    clk,reset: in std_logic;
    tag_in: in std_logic_vector(tag_width-1 downto 0);
    tag_out: out std_logic_vector(tag_width-1 downto 0);
    NaN, oflow, uflow: out std_logic := '0';
    env_rdy, accept_rdy: in std_logic;
    muli_rdy, mulo_rdy: out std_logic);
end entity;

architecture rtl of SinglePrecisionMultiplier is

  type parpro is array (0 to 23) of std_logic_vector(23 downto 0);


  signal rdy1,rdy2,rdy3,rdy4,rdy5,rdy6,rdy7,rdy8,rdy9,rdy10, rdy11: std_logic := '0';
  signal flag3,flag4,flag5,flag6,flag7,flag8,flag9,flag10: std_logic_vector(1 downto 0);
  signal fman10: std_logic_vector(22 downto 0);
  signal tag1,tag2,tag3,tag4,tag5,tag6,tag7,tag8,tag9,tag10: std_logic_vector(tag_width-1 downto 0);
  signal pipeline_stall: std_logic := '0';

  signal aman_1,aman_2,bman_1,bman_2: std_logic_vector(23 downto 0);
  signal anan1,bnan1,azero1,bzero1,ainf1,binf1,osgn1: std_logic := '0'; 
  signal aexp_s1,bexp_s1: std_logic_vector(7 downto 0);

  signal nocalc2,nocalc3,nocalc4,nocalc5,nocalc6,nocalc7,nocalc8,nocalc9,nocalc10: std_logic;-- := '0';
  signal output_s2,output_s23,output_s24,output_s25,output_s26,output_s27,output_s28,output_s29,output_s210: std_logic_vector(2 downto 0);
  signal int_exp: std_logic_vector(8 downto 0);

  signal fexp3,fexp4,fexp5,fexp6,fexp7,fexp8,fexp9,fexp10: std_logic_vector(7 downto 0);-- := X"00";

  signal pp: parpro;
  signal tr_400,tr_401,tr_402,tr_403,tr_404,tr_405,tr_406,tr_407,tr_408,tr_409,tr_410,tr_411: std_logic_vector(47 downto 0);

  signal tr51,tr52,tr53,tr54,tr55,tr56,tr61,tr62,tr63,tr7,tr_temp,tr9: std_logic_vector(47 downto 0);

  signal tr401,tr402,tr403,tr404,tr405,tr406,tr407,tr408,tr409,tr410,tr411,tr412: std_logic_vector(47 downto 0);-- := X"000000000000";
  signal tr413,tr414,tr415,tr416,tr417,tr418,tr419,tr420,tr421,tr422,tr423,tr424: std_logic_vector(47 downto 0);-- := X"000000000000";

begin

  stage_1: process(clk,reset)

    variable asgn,bsgn,osgn: std_logic := '0';
    variable aexp,bexp: std_logic_vector(7 downto 0);-- := X"00";
    variable aman,bman: std_logic_vector(23 downto 0);-- := "000000000000000000000000";
    variable anan,bnan,azero,bzero,ainf,binf: std_logic;-- := '0';

  begin
    if reset = '1' then
      rdy1 <= '0';
    else
      if clk'event and clk='1'then
	if env_rdy = '1' and pipeline_stall = '0' then

          aexp := INA(30 downto 23);
          bexp := INB(30 downto 23);
          aman := '1' & INA(22 downto 0);
          bman := '1' & INB(22 downto 0);

          if(aexp=X"FF") then
            if(unsigned(aman)=0) then
              ainf := '1';
              anan := '0';
              azero := '0';
            else
              anan := '1';
              azero := '0';
              ainf := '0';
            end if;
          elsif(aexp=X"00") then
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

          if(bexp=X"FF") then
            if(unsigned(bman)=0) then
              binf := '1';
              bnan := '0';
              bzero := '0';
            else
              bnan := '1';
              bzero := '0';
              binf := '0';
            end if;
          elsif(bexp=X"00") then
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

          osgn1 <= INA(31) xor INB(31);

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

    variable exp3: unsigned(8 downto 0);

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
            if(exp3 > 381) then
              output_s23 <= output_s2(2) & "11";
              nocalc3 <= '1';
              flag3 <= "10";
            elsif(exp3 < 127) then
              output_s23 <= output_s2(2) & "00";
              nocalc3 <= '1';
              flag3 <= "01";
            else
              exp3 := exp3 - 127;
              output_s23 <= output_s2(2) & "01";
              nocalc3 <= '0';
              flag3 <= "00";
            end if;	
          end if;
          fexp3 <= std_logic_vector(exp3(7 downto 0));
          rdy3 <= '1';
          tag3 <= tag2;

          for i in 0 to 23 loop
            for j in 0 to 23 loop
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

            tr401 <= X"000000" & pp(0);
            tr402 <= X"00000" & "000" & pp(1) & '0';
            tr403 <= X"00000" & "00" & pp(2) & "00";
            tr404 <= X"00000" & '0' & pp(3) & "000";	

            tr405 <= X"00000" & pp(4) & X"0";
            tr406 <= X"0000" & "000" & pp(5) & X"0" & '0';
            tr407 <= X"0000" & "00" & pp(6) & X"0" & "00";
            tr408 <= X"0000" & '0' & pp(7) & X"0" & "000";

            tr409 <= X"0000" & pp(8) & X"00";
            tr410 <= X"000" & "000" & pp(9) & X"00" & '0';
            tr411 <= X"000" & "00" & pp(10) & X"00" & "00";
            tr412 <= X"000" & '0' & pp(11) & X"00" & "000";

            tr413 <= X"000" & pp(12) & X"000";
            tr414 <= X"00" & "000" & pp(13) & X"000" & '0';
            tr415 <= X"00" & "00" & pp(14) & X"000" & "00";
            tr416 <= X"00" & '0' & pp(15) & X"000" & "000";

            tr417 <= X"00" & pp(16) & X"0000";
            tr418 <= X"0" & "000" & pp(17) & X"0000" & '0';
            tr419 <= X"0" & "00" & pp(18) & X"0000" & "00";
            tr420 <= X"0" & '0' & pp(19) & X"0000" & "000";

            tr421 <= X"0" & pp(20) & X"00000";
            tr422 <= "000" & pp(21) & X"00000" & '0';
            tr423 <= "00" & pp(22) & X"00000" & "00";
            tr424 <= '0' & pp(23) & X"00000" & "000";

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
            tr51 <= std_logic_vector(unsigned(tr_400) + unsigned(tr_401));
            tr52 <= std_logic_vector(unsigned(tr_402) + unsigned(tr_403));
            tr53 <= std_logic_vector(unsigned(tr_404) + unsigned(tr_405));
            tr54 <= std_logic_vector(unsigned(tr_406) + unsigned(tr_407));
            tr55 <= std_logic_vector(unsigned(tr_408) + unsigned(tr_409));
            tr56 <= std_logic_vector(unsigned(tr_410) + unsigned(tr_411));
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
            tr61 <= std_logic_vector(unsigned(tr51) + unsigned(tr52));
            tr62 <= std_logic_vector(unsigned(tr53) + unsigned(tr54));
            tr63 <= std_logic_vector(unsigned(tr55) + unsigned(tr56));
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
            tr7 <= std_logic_vector(unsigned(tr61) + unsigned(tr62));
            nocalc8 <= '0';
          end if;

          output_s28<= output_s27;
          fexp8 <= fexp7;
          flag8 <= flag7;
          rdy8 <= '1';
          tag8 <= tag7;
          tr_temp <= tr63;

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
            tr9 <= std_logic_vector(unsigned(tr7) + unsigned(tr_temp));
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
    variable man8: std_logic_vector(24 downto 0);
    variable exp8: unsigned(7 downto 0);
  begin
    if reset = '1' then
      rdy10 <= '0';
    else
      if clk'event and clk='1'then
	if rdy9 = '1' and pipeline_stall = '0' then
          if nocalc9 = '1' then
            nocalc10 <= '1';
            output_s210 <= output_s29;
            flag10 <= flag9;
          elsif nocalc9 = '0' then
            man8 := tr9(47 downto 23);
            exp8 := unsigned(fexp9);
            if man8(24) = '1' then
              if	exp8 = 254 then
                output_s210 <= output_s29(2) & "11";
                nocalc10 <= '1';
                flag10 <= "10";
              else
                exp8 := exp8 + 1;
                nocalc10 <= '0';
                fman10 <= man8(23 downto 1);
                output_s210 <= output_s29;
                flag10 <= flag9;
              end if;
            elsif exp8 = 0 then
              output_s210 <= output_s29(2) & "00";
              nocalc10 <= '1';
              flag10 <= "01";
            else
              fman10 <= man8(22 downto 0);
              output_s210 <= output_s29;
              nocalc10 <= '0';
              flag10 <= flag9;
            end if;
          end if;		
          rdy10 <= '1';
          tag10 <= tag9;
          fexp10 <= std_logic_vector(exp8);
        elsif pipeline_stall = '1' then
        elsif rdy9 = '0' then
          rdy10 <= '0';
        end if;
      end if;
    end if;
  end process stage_10;


  stage_11: process(clk,reset)
    variable temp: std_logic_vector(2 downto 0);
  begin
    if reset = '1' then
      rdy11 <= '0';
    else
      if clk'event and clk='1'then
	if rdy10 = '1' and pipeline_stall = '0' then
          rdy11 <= '1';
          temp := output_s210;
          if nocalc10 = '1' then
            case(temp(1 downto 0)) is
              when("00") => OUTM <= temp(2) & "000" & X"0000000"; NaN <= '0'; oflow <= '0'; uflow <= flag10(0);
            when("10") => OUTM <= temp(2) & X"FF" & "10000000000000000000000"; NaN <= '1'; oflow <= '0'; uflow <= '0';
            when("11") => OUTM <= temp(2) & X"FF" & "000" & X"00000"; NaN <= '0'; oflow <= flag10(1); uflow <= '0';
            when others => null; 
          end case;
          else
            OUTM <= temp(2) & fexp10 & fman10; NaN <= '0'; oflow <='0'; uflow <= '0';
          end if;
          tag_out <= tag10;
        else
          rdy11 <= '0';
        end if;
      end if;
    end if;
  end process stage_11;

  pipeline_stall <= (rdy11 and (not accept_rdy));
  muli_rdy <= not (rdy11 and (not accept_rdy));
  mulo_rdy <= rdy11;

end rtl;
