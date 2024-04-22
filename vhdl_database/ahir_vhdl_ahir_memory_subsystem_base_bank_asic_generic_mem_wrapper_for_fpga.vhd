------------------------------------------------------------------------------------------------
--
-- Copyright (C) 2010-: Madhav P. Desai, Ch. V. Kalyani
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
--------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity spram_generic_reverse_wrapper is
	generic(address_width: integer:=8; data_width: integer:=8);
	port (ADDR : in std_logic_vector(address_width-1 downto 0 );
		CLK : in std_logic;
		WRITE_BAR: in std_logic;
		ENABLE_BAR: in std_logic;
		DATAIN  : in std_logic_vector(data_width-1 downto 0);
		DATAOUT  : out std_logic_vector(data_width-1 downto 0));
end entity spram_generic_reverse_wrapper;

architecture XilinxBramInfer of spram_generic_reverse_wrapper is
  type MemArray is array (natural range <>) of std_logic_vector(data_width-1 downto 0);
  signal mem_array : MemArray((2**address_width)-1 downto 0) := (others => (others => '0'));
begin  -- XilinxBramInfer

  -- read/write process
  process(CLK, ADDR, ENABLE_BAR, WRITE_BAR)
  begin

    -- synch read-write memory
    if(CLK'event and CLK ='1') then
      if(ENABLE_BAR = '0' and WRITE_BAR = '0') then
        mem_array(To_Integer(unsigned(ADDR))) <= DATAIN;
      end if;
    end if;
  end process;

  -- read data.
  process(clk) 
  begin
	if(clk'event and clk = '1') then
		if(ENABLE_BAR = '0') then
		 	DATAOUT  <= mem_array(To_Integer(unsigned(ADDR)));
		end if;
	end if;
  end process;

end XilinxBramInfer;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library ahir;
use ahir.mem_ASIC_components.all;
use ahir.GlobalConstants.all;
use ahir.mem_component_pack.all;

-- Entity to instantiate different available memory cuts based on the 
-- address_width and data_width generics passed.
entity dpram_generic_reverse_wrapper is
	generic(address_width: integer:=8; data_width: integer:=8);
	port (ADDR_0 : in std_logic_vector(address_width-1 downto 0 );
		ADDR_1 : in std_logic_vector(address_width-1 downto 0 );
		ENABLE_0_BAR : in std_logic;
		ENABLE_1_BAR : in std_logic;
		WRITE_0_BAR : in std_logic;
		WRITE_1_BAR : in std_logic;
		DATAIN_0  : in std_logic_vector(data_width-1 downto 0);
		DATAIN_1  : in std_logic_vector(data_width-1 downto 0);
		DATAOUT_0  : out std_logic_vector(data_width-1 downto 0);
		DATAOUT_1  : out std_logic_vector(data_width-1 downto 0);
		CLK: in std_logic);
end entity dpram_generic_reverse_wrapper;


architecture XilinxBramInfer of dpram_generic_reverse_wrapper is

  type MemArray is array (natural range <>) of std_logic_vector(data_width-1 downto 0);

begin  -- XilinxBramInfer
  genVivado: if global_use_vivado_bbank_dual_port generate
    gVblock: block
	signal ena, enb, wea, web: std_logic;
    begin
	ena <= not ENABLE_0_bAR;
	enb <= not ENABLE_1_bAR;
	wea <= not WRITE_0_BAR;
	web <= not WRITE_1_BAR;

	bbVivado: base_bank_dual_port_for_vivado
		generic map (name => "bbVivado", g_addr_width => address_Width, g_data_width => data_width)
		port map (
			clka => clk, 
			clkb => clk, 
			ena => ena,
			enb => enb,
			wea => wea,
			web => web,
			addra => ADDR_0,
			addrb => ADDR_1,
			dia => DATAIN_0,
			dib => DATAIN_1,
			doa => DATAOUT_0,
			dob => DATAOUT_1
		);
      end block;
  end generate genVivado;

  noGenVivado: if not global_use_vivado_bbank_dual_port generate
  bbNoGen: block
  	signal mem_array : MemArray((2**address_width)-1 downto 0) := (others => (others => '0'));
  begin
  -- read/write process
  process(CLK, ADDR_0, ENABLE_0_BAR, WRITE_0_BAR, ADDR_1, ENABLE_1_BAR, WRITE_1_BAR)
  begin


    -- synch read-write memory
    if(CLK'event and CLK ='1') then

      -- both ports write.. second one wins if writes
      -- are to the same address.
      if(ENABLE_0_BAR = '0' and WRITE_0_BAR = '0') then
        mem_array(To_Integer(unsigned(ADDR_0))) <= DATAIN_0;
      end if;
      if(ENABLE_1_BAR = '0' and WRITE_1_BAR = '0') then
        mem_array(To_Integer(unsigned(ADDR_1))) <= DATAIN_1;
      end if;
    end if;
  end process;
      	
  process(clk) 
  begin
	if(clk'event and clk = '1') then
		if(ENABLE_0_BAR = '0') then
  			DATAOUT_0 <= mem_array(To_Integer(unsigned(ADDR_0)));
		end if;
		if(ENABLE_1_BAR = '0') then
  			DATAOUT_1 <= mem_array(To_Integer(unsigned(ADDR_1)));
		end if;
	end if;
  end process;
  end block;
  end generate noGenVivado;
  
end XilinxBramInfer;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity register_file_1w_1r_generic_reverse_wrapper is
	generic(address_width: integer:=8; data_width: integer:=8);
	port (ADDR_0 : in std_logic_vector(address_width-1 downto 0 );
		ADDR_1 : in std_logic_vector(address_width-1 downto 0 );
		ENABLE_0_BAR : in std_logic;
		ENABLE_1_BAR : in std_logic;
		DATAIN_0  : in std_logic_vector(data_width-1 downto 0);
		DATAOUT_1  : out std_logic_vector(data_width-1 downto 0);
		CLK: in std_logic);
end entity;

architecture XilinxBramInfer of register_file_1w_1r_generic_reverse_wrapper is

  type MemArray is array (natural range <>) of std_logic_vector(data_width-1 downto 0);
  signal mem_array : MemArray((2**address_width)-1 downto 0) := (others => (others => '0'));

begin  -- XilinxBramInfer

  -- read/write process
  process(CLK, ADDR_0, ENABLE_0_BAR, ADDR_1, ENABLE_1_BAR)
  begin

    -- synch read-write memory
    if(CLK'event and CLK ='1') then

      -- port 0 writes.
      if(ENABLE_0_BAR = '0') then
        mem_array(To_Integer(unsigned(ADDR_0))) <= DATAIN_0;
      end if;
    end if;
  end process;
      	
  process(clk) 
  begin
	if(clk'event and clk = '1') then
		if(ENABLE_1_BAR = '0') then
  			DATAOUT_1 <= mem_array(To_Integer(unsigned(ADDR_1)));
		end if;
	end if;
  end process;

end XilinxBramInfer;

