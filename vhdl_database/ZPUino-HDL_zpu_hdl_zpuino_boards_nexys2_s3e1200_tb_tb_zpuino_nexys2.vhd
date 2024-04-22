--
--  Testbench for ZPUINO
-- 
--  Copyright 2010 Alvaro Lopes <alvieboy@alvie.com>
-- 
--  Version: 1.0
-- 
--  The FreeBSD license
--  
--  Redistribution and use in source and binary forms, with or without
--  modification, are permitted provided that the following conditions
--  are met:
--  
--  1. Redistributions of source code must retain the above copyright
--     notice, this list of conditions and the following disclaimer.
--  2. Redistributions in binary form must reproduce the above
--     copyright notice, this list of conditions and the following
--     disclaimer in the documentation and/or other materials
--     provided with the distribution.
--  
--  THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY
--  EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
--  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
--  PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
--  ZPU PROJECT OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
--  INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
--  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
--  OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
--  HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
--  STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
--  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
--  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--  
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.zpuino_config.all;

entity tb_zpuino is
end entity;

architecture behave of tb_zpuino is

  constant period : time := 20 ns;
  signal clk_in : std_logic := '0';
  signal rst_in : std_logic := '0';
  --signal gpio:  std_logic_vector(31 downto 0);

  signal spi_pf_miso:  std_logic;
  signal spi_pf_miso_dly:  std_logic;
  signal spi_pf_mosi:  std_logic;
  signal spi_pf_mosi_dly:  std_logic;
  signal spi_pf_sck_dly:  std_logic;
  signal spi_pf_sck:   std_logic;
  signal spi_pf_nsel:  std_logic;

  constant CLK_FREQUENCY : integer := 78000000;
  constant BAUD_DIV_115200   : integer := CLK_FREQUENCY/115200;


  component nexys2_zpuino is
  port (
    CLK         : in    std_logic;
    RST         : in    std_logic;
    UART_RX     : in    std_logic;
    UART_TX     : out   std_logic;
    GPIO        : inout std_logic_vector(zpuino_gpio_count-1 downto 0);
    FPGA_INIT_B : out   std_logic;
    -- VGA interface
    VGA_RED     : out   std_logic_vector(2 downto 0);
    VGA_GRN     : out   std_logic_vector(2 downto 0);
    VGA_BLU     : out   std_logic_vector(2 downto 1);
    VGA_HS      : out   std_logic;
    VGA_VS      : out   std_logic
  );
  end component nexys2_zpuino;


--   component zpuino_top is
--   generic (
--     spp_cap_in: std_logic_vector(zpuino_gpio_count-1 downto 0);
--     spp_cap_out: std_logic_vector(zpuino_gpio_count-1 downto 0)
--   );
--   port (
--     clk:      in std_logic;
-- 	 	rst:      in std_logic;
-- 
--     gpio_o:   out std_logic_vector(zpuino_gpio_count-1 downto 0);
--     gpio_t:   out std_logic_vector(zpuino_gpio_count-1 downto 0);
--     gpio_i:   in std_logic_vector(zpuino_gpio_count-1 downto 0);
--     rx:       in std_logic;
--     tx:       out std_logic
--   );
--   end component zpuino_top;

  component M25P16 IS
  GENERIC (	init_file: string := string'("initM25P16.txt");         -- Init file name
		SIZE : positive := 1048576*16;                          -- 16Mbit
		Plength : positive := 256;                              -- Page length (in Byte)
		SSIZE : positive := 524288;                             -- Sector size (in # of bits)
		NB_BPi: positive := 3;                                  -- Number of BPi bits
		signature : STD_LOGIC_VECTOR (7 downto 0):="00010100";  -- Electronic signature
		manufacturerID : STD_LOGIC_VECTOR (7 downto 0):="00100000"; -- Manufacturer ID
		memtype : STD_LOGIC_VECTOR (7 downto 0):="00100000"; -- Memory Type
		density : STD_LOGIC_VECTOR (7 downto 0):="00010101"; -- Density 
		Tc: TIME := 20 ns;                                      -- Minimum Clock period
		Tr: TIME := 50 ns;                                      -- Minimum Clock period for read instruction
		tSLCH: TIME:= 5 ns;                                    -- notS active setup time (relative to C)
		tCHSL: TIME:= 5 ns;                                    -- notS not active hold time
		tCH : TIME := 9 ns;                                    -- Clock high time
		tCL : TIME := 9 ns;                                    -- Clock low time
		tDVCH: TIME:= 2 ns;                                     -- Data in Setup Time
		tCHDX: TIME:= 5 ns;                                     -- Data in Hold Time
		tCHSH : TIME := 5 ns;                                  -- notS active hold time (relative to C)
	 	tSHCH: TIME := 5 ns;                                   -- notS not active setup  time (relative to C)
		tSHSL: TIME := 100 ns;                                  -- /S deselect time
		tSHQZ: TIME := 8 ns;                                   -- Output disable Time
		tCLQV: TIME := 8 ns;                                   -- clock low to output valid
		tHLCH: TIME := 5 ns;                                   -- NotHold active setup time
		tCHHH: TIME := 5 ns;                                   -- NotHold not active hold time
		tHHCH: TIME := 5 ns;                                   -- NotHold not active setup time
		tCHHL: TIME := 5 ns;                                   -- NotHold active hold time
		tHHQX: TIME := 8 ns;                                   -- NotHold high to Output Low-Z
		tHLQZ: TIME := 8 ns;                                   -- NotHold low to Output High-Z
	        tWHSL: TIME := 20 ns;                                   -- Write protect setup time (SRWD=1)
	        tSHWL: TIME := 100 ns;                                 -- Write protect hold time (SRWD=1)
		tDP: TIME := 3 us;                                      -- notS high to deep power down mode
		tRES1: TIME := 30 us;                                    -- notS high to stand-by power mode
		tRES2: TIME := 30 us;                                  --
		tW: TIME := 15 ms;                                      -- write status register cycle time
		tPP: TIME := 5 ms;                                      -- page program cycle time
		tSE: TIME := 3 sec;                                     -- sector erase cycle time
		tBE: TIME := 40 sec;                                    -- bulk erase cycle time
		tVSL: TIME := 10 us;                                    -- Vcc(min) to /S low
		tPUW: TIME := 10 ms;                                    -- Time delay to write instruction
		Vwi: REAL := 2.5 ;                                      -- Write inhibit voltage (unit: V)
		Vccmin: REAL := 2.7 ;                                   -- Minimum supply voltage
		Vccmax: REAL := 3.6                                     -- Maximum supply voltage
		);

    PORT(		VCC: IN REAL;
		  C, D, S, W, HOLD : IN std_logic ;
		  Q : OUT std_logic
    );
  end component;


  component serial_sim is
  generic(
    CLK_FREQUENCY_G : integer := 78000000;
    BAUD_RATE_G     : integer := 115200
  );
  port(
    CLK         : in    std_logic;
    RST         : in    std_logic;
    UART_RX     : in    std_logic;
    UART_TX     : out   std_logic
  );
  end component;


  signal vcc: real := 0.0;
  signal uart_tx  : std_logic;
  signal uart_rx  : std_logic := '0';
  signal gpio     : std_logic_vector(zpuino_gpio_count-1 downto 0);
  signal gpio_i   : std_logic_vector(zpuino_gpio_count-1 downto 0);
  signal gpio_t   : std_logic_vector(zpuino_gpio_count-1 downto 0);
  signal gpio_o   : std_logic_vector(zpuino_gpio_count-1 downto 0);
  signal rxsim    : std_logic;

--   component uart_pty_tx is
--    port(
--       clk:    in  std_logic;
--       rst:    in  std_logic;
--       tx:     out std_logic
--    );
--   end component uart_pty_tx;

begin

--  uart_rx <= rxsim;--uart_tx after 7 us;

--  uart_tx <= gpio_o(1);
--  gpio_i(48) <= uart_rx;

  top: nexys2_zpuino
    port map (
      clk     => clk_in,
	 	  rst     => rst_in,
      gpio    => gpio,
      uart_rx => uart_rx,
      uart_tx => uart_tx
  );



  serial_sim_i1 : serial_sim
  generic map(
    CLK_FREQUENCY_G => 50000000,
    BAUD_RATE_G     => 115200
  )
  port map(
    clk         => clk_in,
    rst         => rst_in,
    uart_rx     => uart_tx,
    uart_tx     => uart_rx
  );

  --rxs: uart_pty_tx
  -- -port map(
  --    clk => clk_in,
  --   rst => rst_in,
--    tx  => rxsim
   --);

  -- These values were taken from post-P&R timing analysis

--  spi_pf_mosi_dly <= spi_pf_mosi after 3.850 ns;
--- spi_pf_sck_dly <= spi_pf_sck after 3.825 ns;
    gpio_i(2) <= spi_pf_miso_dly after  2.540 ns;
--  spi_pf_nsel <= gpio_i(0) after  3.850 ns;

  spiflash: M25P16
    port map (
      VCC => vcc,
		  C   => gpio_o(3),
      D   => gpio_o(0),
      S   => gpio_o(1),
      W   => '0',
      HOLD => '1',
		  Q   => spi_pf_miso_dly
    );

  clk_in <= not clk_in after period/2;

  stimuli : process
   begin
      rst_in   <= '0';
      wait for 1 ns;
      vcc     <= 3.3;
      rst_in   <= '1';
      wait for 120 ns;
      rst_in   <= '0';
      wait for 1000 ms;
      report "End" severity failure;
      wait;
   end process;

end behave;
