---------------------------------------------------------------------------------
--
--   Copyright 2017 - Rutherford Appleton Laboratory and University of Bristol
--
--   Licensed under the Apache License, Version 2.0 (the "License");
--   you may not use this file except in compliance with the License.
--   You may obtain a copy of the License at
--
--       http://www.apache.org/licenses/LICENSE-2.0
--
--   Unless required by applicable law or agreed to in writing, software
--   distributed under the License is distributed on an "AS IS" BASIS,
--   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--   See the License for the specific language governing permissions and
--   limitations under the License.
--
--                                     - - -
--
--   Additional information about ipbus-firmare and the list of ipbus-firmware
--   contacts are available at
--
--       https://ipbus.web.cern.ch/ipbus
--
---------------------------------------------------------------------------------



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.ipbus.all;

LIBRARY UNISIM;
USE UNISIM.VComponents.ALL;

entity uc_pipe_interface is
  port(
    clk: in std_logic;
    rst: in std_logic;
    ipbus_in: in ipb_wbus;
    ipbus_out: out ipb_rbus;
    sclk: in std_logic;
    uc_pipe_nrd: in std_logic;
    uc_pipe_nwe: in std_logic;
    uc_pipe: inout std_logic_vector(15 downto 0)
  );
  
end uc_pipe_interface;

architecture rtl of uc_pipe_interface is

	signal samp_nwe : std_logic_vector(1 DOWNTO 0) := (OTHERS => '1');
	signal samp_nrd : std_logic_vector(1 DOWNTO 0) := (OTHERS => '1');
  signal ack: std_logic;
--  signal clk200buf: std_logic;
	signal we_pipe : std_logic_vector(0 downto 0);
	signal w_addr_pipe : unsigned(9 downto 0) := (others=>'1');
	signal w_data_pipe : std_logic_vector(15 downto 0);
	signal r_addr_ipbus : unsigned(8 downto 0) := (others=>'0');
	signal r_data_ipbus : std_logic_vector(31 downto 0);
	signal we_ipbus : std_logic_vector(0 downto 0);
	signal w_addr_ipbus : unsigned(8 downto 0) := (others=>'1');
	signal w_data_ipbus : std_logic_vector(31 downto 0);
	signal r_addr_pipe : unsigned(9 downto 0) := (others=>'0');
	signal r_data_pipe : std_logic_vector(15 downto 0);
	signal pipe_to_ipbus_reset , ipbus_to_pipe_reset : std_logic;
	signal we_pipe_clked : std_logic_vector(0 downto 0);
	signal uc_pipe_clked : std_logic_vector(15 downto 0);

	signal r_addr_pipe_ipb_domain, r_addr_pipe_sclk_domain : unsigned(9 downto 0) := (others=>'1');
	signal w_addr_pipe_ipb_domain, w_addr_pipe_sclk_domain : unsigned(9 downto 0) := (others=>'1');

  COMPONENT sdpram_16x10_32x9
    PORT (
      clka : IN STD_LOGIC;
      wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
      dina : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      clkb : IN STD_LOGIC;
      addrb : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
      doutb : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
  END COMPONENT;
  
  COMPONENT sdpram_32x9_16x10
    PORT (
      clka : IN STD_LOGIC;
      wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      addra : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
      dina : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      clkb : IN STD_LOGIC;
      addrb : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
      doutb : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
  END COMPONENT;

begin

--  buf200: BUFG port map(
--    i => clk200,
--    o => clk200buf
--  );

--   w_data_pipe <= uc_pipe;
--   uc_pipe <= r_data_pipe when uc_pipe_nwe = '1' else (OTHERS => 'Z');


  process(sclk) --, ipbus_to_pipe_reset , pipe_to_ipbus_reset )
  begin
--     if( ipbus_to_pipe_reset = '1' ) then
--       r_addr_pipe <= (others=>'0');
--     elsif( pipe_to_ipbus_reset = '1' ) then
--       w_addr_pipe <= (others=>'1');
--     els
    if rising_edge(sclk) then

      samp_nwe( 1 downto 0 ) <= samp_nwe(0) & uc_pipe_nwe;
      samp_nrd( 1 downto 0 ) <= samp_nrd(0) & uc_pipe_nrd;

      we_pipe <= "0";

			if( ipbus_to_pipe_reset = '1') then
				r_addr_pipe <= (others => '0');
			elsif( samp_nrd = "10" ) then
				r_addr_pipe <= r_addr_pipe + 1;
			end if;
	 
			if( pipe_to_ipbus_reset = '1') then
				w_addr_pipe <= (others => '1');
			elsif( samp_nwe = "10" ) then
				w_addr_pipe <= w_addr_pipe + 1;
				we_pipe <= "1";
			end if;

      if( uc_pipe_nwe = '1' ) then
        uc_pipe <= r_data_pipe;
      else
        uc_pipe <= (OTHERS => 'Z');
      end if;
--
--      if( samp_nrd = "10" ) then
--        r_addr_pipe <= r_addr_pipe + 1;
--      end if;
--
--      if( samp_nwe = "10" ) then
--        w_addr_pipe <= w_addr_pipe + 1;
--        we_pipe <= "1";
--      end if;

			we_pipe_clked <= we_pipe;
			uc_pipe_clked <= uc_pipe;

    end if;
  end process;


  ipbus_out.ipb_err <= '0'; 
  ipbus_out.ipb_ack <= ack;


  process(sclk)
  begin
    if falling_edge(sclk) then 

        -- Jumping direct to reg in ipb domain due to large skew between 
        -- ipb clk (31.25MHz) and sclk (125MHz).  Sclk drives the DCM
        -- for IPB, but no BUFG in feedback path (resource saving?) leads to 
        -- large skew.
          
        r_addr_pipe_sclk_domain <= r_addr_pipe;
        w_addr_pipe_sclk_domain <= w_addr_pipe; 

    end if;
  end process;



  process(clk)
  begin
    if rising_edge(clk) then 

        -- Jumping direct to reg in ipb domain due to large skew between 
        -- ipb clk (31.25MHz) and sclk (125MHz).  Sclk drives the DCM
        -- for IPB, but no BUFG in feedback path (resource saving?) leads to 
        -- large skew.
          
        r_addr_pipe_ipb_domain <= r_addr_pipe_sclk_domain;
        w_addr_pipe_ipb_domain <= w_addr_pipe_sclk_domain; 

    end if;
  end process;


  process(clk)
  begin
    if rising_edge(clk) then 
        

--       if( ipbus_to_pipe_reset = '1' ) then
--         ipbus_to_pipe_reset <= '0';  
--         w_addr_ipbus <= (others=>'1');
--       elsif( pipe_to_ipbus_reset = '1' ) then
--         pipe_to_ipbus_reset <= '0';
--         r_addr_ipbus <= (others=>'0');
--       else
  
			ack <= ipbus_in.ipb_strobe and not ack;

--STATUS/CONFIGURATION REGISTER
			if ipbus_in.ipb_strobe='1' and ack='0' then
				if ipbus_in.ipb_write='0' then 
					if ipbus_in.ipb_addr(1 downto 0)="00" then
						ipbus_out.ipb_rdata <= "0000000" & std_logic_vector( w_addr_ipbus ) & "000000" & std_logic_vector( r_addr_pipe_ipb_domain );
					elsif ipbus_in.ipb_addr(1 downto 0)="01" then
						ipbus_out.ipb_rdata <= "0000000" & std_logic_vector( r_addr_ipbus ) & "000000" & std_logic_vector( w_addr_pipe_ipb_domain );
					end if;
				else
-- reset fifo pointers
					if ipbus_in.ipb_addr(1 downto 0)="00" then
						ipbus_to_pipe_reset <= ipbus_in.ipb_wdata(0);
						w_addr_ipbus <= (others => '1');
					elsif ipbus_in.ipb_addr(1 downto 0)="01" then
						pipe_to_ipbus_reset <= ipbus_in.ipb_wdata(0);
						r_addr_ipbus <= (others => '0');
					end if;   
--           else
--             if ipbus_in.ipb_addr(1 downto 0)="00" then
--               ipbus_to_pipe_reset <= '1';          
--             elsif ipbus_in.ipb_addr(1 downto 0)="01" then
--               pipe_to_ipbus_reset <= '1';          
--             end if;
				end if;
			end if;

			we_ipbus <= "0";

--FIFO
			if ipbus_in.ipb_strobe='1' and ack='0' and ipbus_in.ipb_addr(1 downto 0)="10" then
				if ipbus_in.ipb_write='1' then
					w_data_ipbus <= ipbus_in.ipb_wdata( 15 downto 0 ) & ipbus_in.ipb_wdata( 31 downto 16 );
					w_addr_ipbus <= w_addr_ipbus + 1;
					we_ipbus <= "1";
				else
					ipbus_out.ipb_rdata <= r_data_ipbus( 15 downto 0 ) & r_data_ipbus( 31 downto 16 ) ;
					r_addr_ipbus <= r_addr_ipbus + 1;
				end if;
			end if;

    end if; --if rising_edge( clk )
  end process;

  ram_pipe_to_ipbus: sdpram_16x10_32x9
    port map(
      clka => sclk,
      wea => we_pipe_clked,
      addra => std_logic_vector( w_addr_pipe ),
      dina => uc_pipe_clked, --w_data_pipe,
      clkb => clk,
      addrb => std_logic_vector( r_addr_ipbus ),
      doutb => r_data_ipbus
    );

   ram_ipbus_to_pipe: sdpram_32x9_16x10
    port map(
      clka => clk,
      wea => we_ipbus,
      addra => std_logic_vector( w_addr_ipbus ),
      dina => w_data_ipbus,
      clkb => sclk,
      addrb => std_logic_vector( r_addr_pipe ),
      doutb => r_data_pipe
    );

end rtl;
