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
library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.BaseComponents.all;

library aHiR_ieee_proposed;
use aHiR_ieee_proposed.float_pkg.all;
use aHiR_ieee_proposed.math_utility_pkg.all;


entity fpadd32 is -- 
    generic (name: string := "fpadd32"; tag_length : integer);
    port ( -- 
      L : in  std_logic_vector(31 downto 0);
      R : in  std_logic_vector(31 downto 0);
      ret_val_x_x : out  std_logic_vector(31 downto 0);
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic;
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) -- 
    );
end entity fpadd32;

architecture Struct of fpadd32 is
begin

   adder: GenericFloatingPointAdderSubtractor
		generic map(name => name & "-adder",
				tag_width => tag_length,
				exponent_width => 8,
				fraction_width => 23,
                   		round_style => round_nearest,
                   		addguard => 3,
                   		check_error => true,
                   		denormalize => true,
				use_as_subtractor => false)
		port map(INA => L, INB => R,
				OUTADD => ret_val_x_x,
				clk => clk, reset => reset,
				tag_in => tag_in , tag_out => tag_out,
				env_rdy => start_req, accept_rdy => fin_req,
				addi_rdy => start_ack, addo_rdy => fin_ack);
			
end Struct;

library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.BaseComponents.all;

library aHiR_ieee_proposed;
use aHiR_ieee_proposed.float_pkg.all;
use aHiR_ieee_proposed.math_utility_pkg.all;


entity fpadd64 is -- 
    generic (name: string:= "fpadd64"; tag_length : integer);
    port ( -- 
      L : in  std_logic_vector(63 downto 0);
      R : in  std_logic_vector(63 downto 0);
      ret_val_x_x : out  std_logic_vector(63 downto 0);
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic;
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) -- 
    );
end entity fpadd64;

architecture Struct of fpadd64 is
begin

   adder: GenericFloatingPointAdderSubtractor
		generic map(name => name & "-adder", tag_width => tag_length,
				exponent_width => 11,
				fraction_width => 52,
                   		round_style => round_nearest,
                   		addguard => 3,
                   		check_error => true,
                   		denormalize => true,
				use_as_subtractor => false)
		port map(INA => L, INB => R,
				OUTADD => ret_val_x_x,
				clk => clk, reset => reset,
				tag_in => tag_in , tag_out => tag_out,
				env_rdy => start_req, accept_rdy => fin_req,
				addi_rdy => start_ack, addo_rdy => fin_ack);
			
end Struct;

library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.BaseComponents.all;

library aHiR_ieee_proposed;
use aHiR_ieee_proposed.math_utility_pkg.all;
use aHiR_ieee_proposed.float_pkg.all;


entity fpmul32 is -- 
    generic (name: string:= "fpmul32"; tag_length : integer);
    port ( -- 
      L : in  std_logic_vector(31 downto 0);
      R : in  std_logic_vector(31 downto 0);
      ret_val_x_x : out  std_logic_vector(31 downto 0);
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic;
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) -- 
    );
end entity fpmul32;

architecture Struct of fpmul32 is
begin

   mul: GenericFloatingPointMultiplier
		generic map(name => name & "-mul", tag_width => tag_length,
				exponent_width => 8,
				fraction_width => 23,
                   		round_style => round_nearest,
                   		addguard => 3,
                   		check_error => true,
                   		denormalize => true)
		port map(INA => L, INB => R,
				OUTMUL => ret_val_x_x,
				clk => clk, reset => reset,
				tag_in => tag_in , tag_out => tag_out,
				env_rdy => start_req, accept_rdy => fin_req,
				muli_rdy => start_ack, mulo_rdy => fin_ack);
			
end Struct;

library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.BaseComponents.all;

library aHiR_ieee_proposed;
use aHiR_ieee_proposed.math_utility_pkg.all;
use aHiR_ieee_proposed.float_pkg.all;


entity fpmul64 is -- 
    generic (name: string:= "fpmul64"; tag_length : integer);
    port ( -- 
      L : in  std_logic_vector(63 downto 0);
      R : in  std_logic_vector(63 downto 0);
      ret_val_x_x : out  std_logic_vector(63 downto 0);
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic;
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) -- 
    );
end entity fpmul64;

architecture Struct of fpmul64 is
begin

   mul: GenericFloatingPointMultiplier
		generic map(name => name & "-mul", tag_width => tag_length,
				exponent_width => 11,
				fraction_width => 52,
                   		round_style => round_nearest,
                   		addguard => 3,
                   		check_error => true,
                   		denormalize => true)
		port map(INA => L, INB => R,
				OUTMUL => ret_val_x_x,
				clk => clk, reset => reset,
				tag_in => tag_in , tag_out => tag_out,
				env_rdy => start_req, accept_rdy => fin_req,
				muli_rdy => start_ack, mulo_rdy => fin_ack);
			
end Struct;

library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.BaseComponents.all;

library aHiR_ieee_proposed;
use aHiR_ieee_proposed.float_pkg.all;
use aHiR_ieee_proposed.math_utility_pkg.all;


entity fpsub32 is -- 
    generic (name: string := "fpsub32"; tag_length : integer);
    port ( -- 
      L : in  std_logic_vector(31 downto 0);
      R : in  std_logic_vector(31 downto 0);
      ret_val_x_x : out  std_logic_vector(31 downto 0);
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic;
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) -- 
    );
end entity fpsub32;

architecture Struct of fpsub32 is
begin

   sub: GenericFloatingPointAdderSubtractor
		generic map(name => name & "-sub", tag_width => tag_length,
				exponent_width => 8,
				fraction_width => 23,
                   		round_style => round_nearest,
                   		addguard => 3,
                   		check_error => true,
                   		denormalize => true,
				use_as_subtractor => true)
		port map(INA => L, INB => R,
				OUTADD => ret_val_x_x,
				clk => clk, reset => reset,
				tag_in => tag_in , tag_out => tag_out,
				env_rdy => start_req, accept_rdy => fin_req,
				addi_rdy => start_ack, addo_rdy => fin_ack);
			
end Struct;

library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.BaseComponents.all;

library aHiR_ieee_proposed;
use aHiR_ieee_proposed.float_pkg.all;
use aHiR_ieee_proposed.math_utility_pkg.all;


entity fpsub64 is -- 
    generic (name: string := "fpsub64"; tag_length : integer);
    port ( -- 
      L : in  std_logic_vector(63 downto 0);
      R : in  std_logic_vector(63 downto 0);
      ret_val_x_x : out  std_logic_vector(63 downto 0);
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic;
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) -- 
    );
end entity fpsub64;

architecture Struct of fpsub64 is
begin

   sub: GenericFloatingPointAdderSubtractor
		generic map(name => name & "-sub", tag_width => tag_length,
				exponent_width => 11,
				fraction_width => 52,
                   		round_style => round_nearest,
                   		addguard => 3,
                   		check_error => true,
                   		denormalize => true,
				use_as_subtractor => true)
		port map(INA => L, INB => R,
				OUTADD => ret_val_x_x,
				clk => clk, reset => reset,
				tag_in => tag_in , tag_out => tag_out,
				env_rdy => start_req, accept_rdy => fin_req,
				addi_rdy => start_ack, addo_rdy => fin_ack);
			
end Struct;

library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.BaseComponents.all;

library aHiR_ieee_proposed;
use aHiR_ieee_proposed.float_pkg.all;
use aHiR_ieee_proposed.math_utility_pkg.all;


entity fpu32 is -- 
    generic (name: string := "fpu32"; tag_length : integer);
    port ( -- 
      L : in  std_logic_vector(31 downto 0);
      R : in  std_logic_vector(31 downto 0);
      OP_ID : in std_logic_vector(7 downto 0);
      ret_val_x_x : out  std_logic_vector(31 downto 0);
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic;
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) -- 
    );
end entity fpu32;

architecture Struct of fpu32 is
      signal OUTADD, OUTMUL, addsub_L, addsub_R : std_logic_vector(31 downto 0);
      signal req_to_omux, ack_from_omux: std_logic_vector(1 downto 0);

      signal data_to_omux: std_logic_vector((2*(32+tag_length))-1 downto 0);
      signal data_from_omux: std_logic_vector((32+tag_length)-1 downto 0);
      signal reqi_omux: std_logic_vector(1 downto 0);
      signal acki_omux: std_logic_vector(1 downto 0);
       
      signal mul_tag_out, addsub_tag_out: std_logic_vector(tag_length-1 downto 0);

      signal muli_req, addsubi_req: std_logic;
      signal muli_ack, addsubi_ack: std_logic;
      signal mulo_req, addsubo_req: std_logic;
      signal mulo_ack, addsubo_ack: std_logic;


      
begin

   muli_req <= start_req when (OP_ID = "00000010") else '0';
   addsubi_req <= start_req when ((OP_ID="00000001") or (OP_ID = "00000000")) else '0';
   start_ack <= muli_ack when (OP_ID = "00000010") else addsubi_ack when 
			((OP_ID="00000001") or (OP_ID = "00000000")) else '0';

   addsub_L <= L;
   process(R, OP_ID)
	variable X: std_logic_vector(31 downto 0);
   begin
	X(30 downto 0) := R(30 downto 0);
	if(OP_ID = "00000001") then
		X(31) := not R(31);
	else
		X(31) := R(31);
	end if;
	addsub_R <= X;
   end process;

   addsub: GenericFloatingPointAdderSubtractor
		generic map(name => name & "-addsub", tag_width => tag_length,
				exponent_width => 8,
				fraction_width => 23,
                   		round_style => round_nearest,
                   		addguard => 3,
                   		check_error => true,
                   		denormalize => true,
				use_as_subtractor => false)
		port map(INA => addsub_L, INB => addsub_R,
				OUTADD => OUTADD,
				clk => clk, reset => reset,
				tag_in => tag_in , tag_out => addsub_tag_out,
				env_rdy => addsubi_req, accept_rdy => addsubo_req,
				addi_rdy => addsubi_ack, addo_rdy => addsubo_ack);

   mul: GenericFloatingPointMultiplier
		generic map(name => name & "-mul", tag_width => tag_length,
				exponent_width => 8,
				fraction_width => 23,
                   		round_style => round_nearest,
                   		addguard => 3,
                   		check_error => true,
                   		denormalize => true)
		port map(INA => L, INB => R,
				OUTMUL => OUTMUL,
				clk => clk, reset => reset,
				tag_in => tag_in , tag_out => mul_tag_out,
				env_rdy => muli_req, accept_rdy => mulo_req,
				muli_rdy => muli_ack, mulo_rdy => mulo_ack);

   data_to_omux <= OUTADD & addsub_tag_out & OUTMUL & mul_tag_out;
   reqi_omux(1) <= addsubo_ack;
   reqi_omux(0) <= mulo_ack;
   addsubo_req <= acki_omux(1);
   mulo_req <= acki_omux(0);


   omux:  OutputPortLevel generic map(name => name & "-omux", num_reqs => 2,
					data_width => data_from_omux'length,
					no_arbitration => false)
			port map(req => reqi_omux,
				ack => acki_omux,
				data => data_to_omux,
				oreq => fin_ack,
				oack => fin_req,
				odata => data_from_omux,
				clk => clk,
				reset => reset);

   ret_val_x_x <= data_from_omux(31+tag_length downto tag_length);
   tag_out <= data_from_omux(tag_length-1 downto 0);
			
end Struct;

library ieee;
use ieee.std_logic_1164.all;

library ahir;
use ahir.BaseComponents.all;

library aHiR_ieee_proposed;
use aHiR_ieee_proposed.float_pkg.all;
use aHiR_ieee_proposed.math_utility_pkg.all;


entity fpu64 is -- 
    generic (name: string := "fpu64"; tag_length : integer);
    port ( -- 
      L : in  std_logic_vector(63 downto 0);
      R : in  std_logic_vector(63 downto 0);
      OP_ID : in std_logic_vector(7 downto 0);
      ret_val_x_x : out  std_logic_vector(63 downto 0);
      clk : in std_logic;
      reset : in std_logic;
      start_req : in std_logic;
      start_ack : out std_logic;
      fin_req : in std_logic;
      fin_ack   : out std_logic;
      tag_in: in std_logic_vector(tag_length-1 downto 0);
      tag_out: out std_logic_vector(tag_length-1 downto 0) -- 
    );
end entity fpu64;

architecture Struct of fpu64 is
      signal OUTADD, OUTMUL, addsub_L, addsub_R : std_logic_vector(63 downto 0);
      signal req_to_omux, ack_from_omux: std_logic_vector(1 downto 0);

      signal data_to_omux: std_logic_vector((2*(64+tag_length))-1 downto 0);
      signal data_from_omux: std_logic_vector((64+tag_length)-1 downto 0);
      signal reqi_omux: std_logic_vector(1 downto 0);
      signal acki_omux: std_logic_vector(1 downto 0);
       
      signal mul_tag_out, addsub_tag_out: std_logic_vector(tag_length-1 downto 0);

      signal muli_req, addsubi_req: std_logic;
      signal muli_ack, addsubi_ack: std_logic;
      signal mulo_req, addsubo_req: std_logic;
      signal mulo_ack, addsubo_ack: std_logic;


      
begin

   muli_req <= start_req when (OP_ID = "00000010") else '0';
   addsubi_req <= start_req when ((OP_ID="00000001") or (OP_ID = "00000000")) else '0';
   start_ack <= muli_ack when (OP_ID = "00000010") else addsubi_ack when 
			((OP_ID="00000001") or (OP_ID = "00000000")) else '0';

   addsub_L <= L;
   process(R, OP_ID)
	variable X: std_logic_vector(63 downto 0);
   begin
	X := R;
	if(OP_ID = "00000001") then
		X(63) := not R(63);
	end if;
	addsub_R <= X;
   end process;

   addsub: GenericFloatingPointAdderSubtractor
		generic map(name => name & "-addsub", tag_width => tag_length,
				exponent_width => 11,
				fraction_width => 52,
                   		round_style => round_nearest,
                   		addguard => 3,
                   		check_error => true,
                   		denormalize => true,
				use_as_subtractor => false)
		port map(INA => addsub_L, INB => addsub_R,
				OUTADD => OUTADD,
				clk => clk, reset => reset,
				tag_in => tag_in , tag_out => addsub_tag_out,
				env_rdy => addsubi_req, accept_rdy => addsubo_req,
				addi_rdy => addsubi_ack, addo_rdy => addsubo_ack);

   mul: GenericFloatingPointMultiplier
		generic map(name => name & "-mul", tag_width => tag_length,
				exponent_width => 11,
				fraction_width => 52,
                   		round_style => round_nearest,
                   		addguard => 3,
                   		check_error => true,
                   		denormalize => true)
		port map(INA => L, INB => R,
				OUTMUL => OUTMUL,
				clk => clk, reset => reset,
				tag_in => tag_in , tag_out => mul_tag_out,
				env_rdy => muli_req, accept_rdy => mulo_req,
				muli_rdy => muli_ack, mulo_rdy => mulo_ack);

   data_to_omux <= OUTADD & addsub_tag_out & OUTMUL & mul_tag_out;
   reqi_omux(1) <= addsubo_ack;
   reqi_omux(0) <= mulo_ack;
   addsubo_req <= acki_omux(1);
   mulo_req <= acki_omux(0);


   omux:  OutputPortLevel generic map(name => name & "-omux", num_reqs => 2,
					data_width => data_from_omux'length,
					no_arbitration => false)
			port map(req => reqi_omux,
				ack => acki_omux,
				data => data_to_omux,
				oreq => fin_ack,
				oack => fin_req,
				odata => data_from_omux,
				clk => clk,
				reset => reset);

   ret_val_x_x <= data_from_omux(63+tag_length downto tag_length);
   tag_out <= data_from_omux(tag_length-1 downto 0);
			
end Struct;

