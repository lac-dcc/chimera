-- ----------------------------------------------------------------------
--LOGI-hard
--Copyright (c) 2013, Jonathan Piat, Michael Jones, All rights reserved.
--
--This library is free software; you can redistribute it and/or
--modify it under the terms of the GNU Lesser General Public
--License as published by the Free Software Foundation; either
--version 3.0 of the License, or (at your option) any later version.
--
--This library is distributed in the hope that it will be useful,
--but WITHOUT ANY WARRANTY; without even the implied warranty of
--MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
--Lesser General Public License for more details.
--
--You should have received a copy of the GNU Lesser General Public
--License along with this library.
-- ----------------------------------------------------------------------

-------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:25:53 12/17/2013 
-- Design Name: 
-- Module Name:    
-- Project Name: 
-- Target Devices: Spartan 6 
-- Tool versions: ISE 14.1 
-- Description: 4 sseg slave module.  Recieve 4x sseg values that will be used on LOGi-EDU board
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
---------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;


library work ;
use work.logi_utils_pack.all ;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sseg4x_basic is

generic(
		  clock_freq_hz : natural := 100_000_000;
		  refresh_rate_hz : natural := 100
	 );
	 port 
	 (	  reset    : in std_logic ;
		  clk      : in std_logic ;  
		  -- SSEG to EDU from Host
		  sseg_edu_cathode_out : out std_logic_vector(3 downto 0); -- common cathode
		  sseg_edu_anode_out : out std_logic_vector(7 downto 0) -- sseg anode	  
	 );
end sseg4x_basic;

architecture Behavioral of sseg4x_basic is


	component disp_hex_mux is
   port(
      clk, reset: in std_logic;
      hex3 : in std_logic_vector(3 downto 0);
		hex2 : in std_logic_vector(3 downto 0);
		hex1: in std_logic_vector(3 downto 0);
		hex0: in std_logic_vector(3 downto 0);
      dp_in: in std_logic_vector(3 downto 0);
      ca: out std_logic_vector(3 downto 0);
      sseg: out std_logic_vector(7 downto 0)
   );
	end component; 


	
	--constant DVSR: integer:=5000000; --50Mhz clk
	constant DVSR: integer:=5000000; --100Mhz clk
   signal ms_reg, ms_next: unsigned(22 downto 0);
   signal d3_reg, d2_reg, d1_reg, d0_reg: unsigned(3 downto 0);
   signal d3_next, d2_next, d1_next, d0_next: unsigned(3 downto 0);
   signal ms_tick,go: std_logic;
	
begin
 
	hex_mux: disp_hex_mux
	port map(
		clk => clk, reset => reset,
		hex0 => std_logic_vector(d3_reg),	
		hex1 => std_logic_vector(d2_reg), 
		hex2 => std_logic_vector(d1_reg), 
		hex3 => std_logic_vector(d0_reg),
		dp_in => "0000",
		ca => sseg_edu_cathode_out,
		sseg => sseg_edu_anode_out
	);
	
	-- registers
   process(clk, reset)
   begin
		if reset = '1' then
			ms_reg <= (others=>'0');
			d3_reg <= (others=>'0');
         d2_reg <= (others=>'0');
         d1_reg <= (others=>'0');
         d0_reg <= (others=>'0');
      elsif (clk'event and clk='1') then
         ms_reg <= ms_next;
			d3_reg <= d3_next;
         d2_reg <= d2_next;
         d1_reg <= d1_next;
         d0_reg <= d0_next;
      end if;
   end process;
	
	go <= not(reset);

   -- next-state logic
   -- 0.1 sec tick generator: mod-5000000
   ms_next <=
      (others=>'0') when reset='1' or (ms_reg=DVSR and go='1') else
      ms_reg + 1 when go='1' else
      ms_reg;
   ms_tick <= '1' when ms_reg=DVSR else '0';
   -- 0.1 sec counter
   process(d0_reg,d1_reg,d2_reg,ms_tick,reset)
   begin
      -- defult
      d0_next <= d0_reg;
      d1_next <= d1_reg;
      d2_next <= d2_reg;
		d3_next <= d3_reg;
      if reset = '1' then
         d0_next <= "0000";
         d1_next <= "0000";
         d2_next <= "0000";
			d3_next <= "0000";
      elsif ms_tick='1' then
         if (d0_reg/=9) then
            d0_next <= d0_reg + 1;
         else       -- reach XX9
            d0_next <= "0000";
            if (d1_reg/=9) then
               d1_next <= d1_reg + 1;
            else    -- reach X99
               d1_next <= "0000";
               if (d2_reg/=9) then
                  d2_next <= d2_reg + 1;
               else -- reach 999
                  d2_next <= "0000";
						if (d3_reg/=9) then
							d3_next <= d3_reg+1;
						else
							d3_next <= (others=>'0');
						end if;	
               end if;	
            end if;
         end if;
      end if;
   end process;
   -- output logic

	
end Behavioral;



--		--increment the hex values
--	process(clk, reset)
--	begin
--		if(reset = '1') then
--			counter <= (others=>'0');
--		elsif clk'event and clk= '1' then
--			counter <= counter +1;
--		end if;
--	end process;
--	tick <= '1' when counter(26) = '1' else '0';
--	process(tick,hex0,hex1,hex2, hex3,reset) 
--	begin
--		if(reset = '1') then
--			hex0 <= (others=>'0');
--			hex1 <= (others=>'0');
--			hex2 <= (others=>'0');
--			hex3 <= (others=>'0');	
--		elsif(tick = '1') then
--			hex0 <= hex0+1;
--			hex1 <= hex1+1;
--			hex2 <= hex2+1;
--			hex3 <= hex3+1;
--		else 
--			hex0 <= hex0;
--			hex1 <= hex1;
--			hex2 <= hex2;
--			hex3 <= hex3;
--		end if;
--	end process;

