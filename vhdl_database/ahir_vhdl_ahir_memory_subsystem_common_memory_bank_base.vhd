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
use ieee.numeric_std.all;

library ahir;
use ahir.memory_subsystem_package.all;
use ahir.mem_function_pack.all;
use ahir.mem_component_pack.all;

entity memory_bank_base is
   generic ( name: string;
	g_addr_width: natural; 
	g_data_width : natural;
        g_base_bank_addr_width: natural;
        g_base_bank_data_width: natural);
   port (data_in : in std_logic_vector(g_data_width-1 downto 0);
         data_out: out std_logic_vector(g_data_width-1 downto 0);
         addr_in: in std_logic_vector(g_addr_width-1 downto 0);
         enable: in std_logic;
         write_bar : in std_logic;
         clk: in std_logic;
         reset : in std_logic);
end entity memory_bank_base;


architecture structural of memory_bank_base is
  constant bank_array_width : natural := Ceiling(g_data_width,g_base_bank_data_width);
  constant bank_array_height : natural := 2**(Maximum(0,g_addr_width-g_base_bank_addr_width));

  type BankArrayDataArray is array (0 to bank_array_height-1, 0 to bank_array_width -1) of std_logic_vector(g_base_bank_data_width-1 downto 0);
  signal data_in_array, data_out_array : BankArrayDataArray;
  

  type BankArrayControlArray is array (0 to bank_array_height-1, 0 to bank_array_width -1) of std_logic;
  signal enable_array,enable_array_reg: BankArrayControlArray;
  
  signal padded_data_in,padded_data_out : std_logic_vector(bank_array_width*g_base_bank_data_width -1 downto 0);
  signal base_addr_in : std_logic_vector(g_base_bank_addr_width -1 downto 0);
  
  signal write_bar_reg: std_logic;
begin  -- structural

   -- register write_bar_reg because memory read will finish after one clock.
    process(clk,reset)
    begin
        if(clk'event and clk = '1') then
		if(reset = '1') then
			write_bar_reg <= '0';
		else
			write_bar_reg <= write_bar;
		end if;
	end if;
    end process;

process(addr_in)
        constant l_index: natural := Minimum(g_addr_width-1, g_base_bank_addr_width-1);
    begin
        base_addr_in <= (others => '0');
        base_addr_in(l_index downto 0) <= addr_in(l_index downto 0);
    end process;
    
process(data_in)
    begin
        padded_data_in <= (others => '0');
        padded_data_in(g_data_width-1 downto 0) <= data_in;
    end process;
    
  data_out <= padded_data_out(g_data_width-1 downto 0);

  -- pack/unpack
  ColGen: for COL in 0 to bank_array_width-1 generate
    
    RowGen: for ROW in 0 to bank_array_height-1 generate
      process(addr_in, enable)
      begin
        enable_array(ROW,COL) <= '0';
        if(bank_array_height > 1) then
          if(enable = '1') then
            if(ROW = To_Integer(addr_in(g_addr_width - 1 downto g_base_bank_addr_width))) then
              enable_array(ROW,COL) <= '1';
            end if;
          end if;
        else
          enable_array(ROW,COL) <= enable;
        end if;
      end process;

      process(clk,reset)
      begin
	if(clk'event and clk = '1') then
		if(reset = '1') then
			enable_array_reg(ROW,COL) <= '0';
		else
			enable_array_reg(ROW,COL) <= enable_array(ROW,COL);
		end if;
	end if;
      end process;

      process(padded_data_in)
      begin
        data_in_array(ROW,COL) <= padded_data_in((COL+1)*g_base_bank_data_width - 1 downto COL*g_base_bank_data_width);
      end process;

      baseMem : base_bank generic map (
        name => name & "-baseMem", 
        g_addr_width => g_base_bank_addr_width,
        g_data_width => g_base_bank_data_width)
        port map (
          datain => data_in_array(ROW, COL),
          addrin => base_addr_in,
          enable => enable_array(ROW,COL),
          writebar => write_bar,
          dataout => data_out_array(ROW,COL),
          clk => clk,
          reset => reset);
      
    end generate RowGen;
    
    process(data_out_array,enable_array_reg, write_bar_reg)
    begin
      padded_data_out((COL+1)*g_base_bank_data_width -1 downto (COL*g_base_bank_data_width)) <= (others => '0');
      for ROW in 0 to bank_array_height-1 loop
	-- use delayed version of enable and write_bar to pass read data
        if(enable_array_reg(ROW,COL) = '1' and write_bar_reg = '1') then
          padded_data_out((COL+1)*g_base_bank_data_width -1 downto (COL*g_base_bank_data_width)) <= data_out_array(ROW,COL);
        end if;
      end loop;  -- ROW
    end process;
    
  end generate ColGen;

end structural;
