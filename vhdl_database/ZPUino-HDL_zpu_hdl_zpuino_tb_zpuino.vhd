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
use work.zpu_config.all;
use work.zpupkg.all;
use work.zpuinopkg.all;
use work.wishbonepkg.all;

entity tb_zpuino is
end entity;

architecture behave of tb_zpuino is

  constant period : time := 10 ns;
  constant vgaperiod : time := 40 ns;
  signal w_clk : std_logic := '0';
  signal w_rst : std_logic := '0';
  signal w_vgaclk : std_logic := '0';
  --signal gpio:  std_logic_vector(31 downto 0);

  signal spi_pf_miso:  std_logic;
  signal spi_pf_miso_dly:  std_logic;
  signal spi_pf_mosi:  std_logic;
  signal spi_pf_mosi_dly:  std_logic;
  signal spi_pf_sck_dly:  std_logic;
  signal spi_pf_sck:   std_logic;
  signal spi_pf_nsel:  std_logic;


  signal sigmadelta_spp_en:  std_logic_vector(1 downto 0);
  signal sigmadelta_spp_data:  std_logic_vector(1 downto 0);
  signal timers_spp_data: std_logic_vector(1 downto 0);

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

  signal vcc: real := 0.0;
  signal uart_tx: std_logic;
  signal uart_rx: std_logic := '0';
  signal gpio_i: std_logic_vector(zpuino_gpio_count-1 downto 0);
  signal gpio_t: std_logic_vector(zpuino_gpio_count-1 downto 0);
  signal gpio_o: std_logic_vector(zpuino_gpio_count-1 downto 0);
  signal rxsim: std_logic;

  signal sram_addr:  std_logic_vector(18 downto 0);
  signal sram_data:  std_logic_vector(15 downto 0);
  signal sram_ce:    std_logic;
  signal sram_we:    std_logic;
  signal sram_oe:    std_logic;
  signal sram_be:    std_logic;

  signal sram_addr_dly:  std_logic_vector(18 downto 0);
  signal sram_data_dly:  std_logic_vector(15 downto 0);
  signal sram_ce_dly:    std_logic;
  signal sram_we_dly:    std_logic;
  signal sram_oe_dly:    std_logic;
  signal sram_be_dly:    std_logic;

  component uart_pty_tx is
   port(
      clk:    in  std_logic;
      rst:    in  std_logic;
      tx:     out std_logic
   );
  end component uart_pty_tx;

  component sram IS

  GENERIC (

    clear_on_power_up: boolean := FALSE;    -- if TRUE, RAM is initialized with zeroes at start of simulation
                                            -- Clearing of RAM is carried out before download takes place

    download_on_power_up: boolean := TRUE;  -- if TRUE, RAM is downloaded at start of simulation 
      
    trace_ram_load: boolean := TRUE;        -- Echoes the data downloaded to the RAM on the screen
                                            -- (included for debugging purposes)


    enable_nWE_only_control: boolean := TRUE;  -- Read-/write access controlled by nWE only
                                               -- nOE may be kept active all the time



    -- Configuring RAM size

    size:      INTEGER :=  8;  -- number of memory words
    adr_width: INTEGER :=  3;  -- number of address bits
    width:     INTEGER :=  8;  -- number of bits per memory word


    -- READ-cycle timing parameters

    tAA_max:    TIME := 20 NS; -- Address Access Time
    tOHA_min:   TIME :=  3 NS; -- Output Hold Time
    tACE_max:   TIME := 20 NS; -- nCE/CE2 Access Time
    tDOE_max:   TIME :=  8 NS; -- nOE Access Time
    tLZOE_min:  TIME :=  0 NS; -- nOE to Low-Z Output
    tHZOE_max:  TIME :=  8 NS; --  OE to High-Z Output
    tLZCE_min:  TIME :=  3 NS; -- nCE/CE2 to Low-Z Output
    tHZCE_max:  TIME := 10 NS; --  CE/nCE2 to High Z Output
 

    -- WRITE-cycle timing parameters

    tWC_min:    TIME := 20 NS; -- Write Cycle Time
    tSCE_min:   TIME := 18 NS; -- nCE/CE2 to Write End
    tAW_min:    TIME := 15 NS; -- tAW Address Set-up Time to Write End
    tHA_min:    TIME :=  0 NS; -- tHA Address Hold from Write End
    tSA_min:    TIME :=  0 NS; -- Address Set-up Time
    tPWE_min:   TIME := 13 NS; -- nWE Pulse Width
    tSD_min:    TIME := 10 NS; -- Data Set-up to Write End
    tHD_min:    TIME :=  0 NS; -- Data Hold from Write End
    tHZWE_max:  TIME := 10 NS; -- nWE Low to High-Z Output
    tLZWE_min:  TIME :=  0 NS  -- nWE High to Low-Z Output

  );

  PORT (
      
    nCE: IN std_logic := '1';  -- low-active Chip-Enable of the SRAM device; defaults to '1' (inactive)
    nOE: IN std_logic := '1';  -- low-active Output-Enable of the SRAM device; defaults to '1' (inactive)
    nWE: IN std_logic := '1';  -- low-active Write-Enable of the SRAM device; defaults to '1' (inactive)

    A:   IN std_logic_vector(adr_width-1 downto 0); -- address bus of the SRAM device
    D:   INOUT std_logic_vector(width-1 downto 0);  -- bidirectional data bus to/from the SRAM device

    CE2: IN std_logic := '1';  -- high-active Chip-Enable of the SRAM device; defaults to '1'  (active) 


    download: IN boolean := FALSE;    -- A FALSE-to-TRUE transition on this signal downloads the data
                                      -- in file specified by download_filename to the RAM

    download_filename: IN string := "sram_load.dat";  -- name of the download source file
                                                      --            Passing the filename via a port of type
                                                      -- ********** string may cause a problem with some
                                                      -- WATCH OUT! simulators. The string signal assigned
                                                      -- ********** to the port at least should have the
                                                      --            same length as the default value.
 
    dump: IN boolean := FALSE;       -- A FALSE-to-TRUE transition on this signal dumps
                                     -- the current content of the memory to the file
                                     -- specified by dump_filename.
    dump_start: IN natural := 0;     -- Written to the dump-file are the memory words from memory address 
    dump_end: IN natural := size-1;  -- dump_start to address dump_end (default: all addresses)

    dump_filename: IN string := "sram_dump.dat"  -- name of the dump destination file
                                                 -- (See note at port  download_filename)

  );
  END component sram;

--  component zpuino_debug_sim is
--  port (
--    jtag_data_chain_in: in std_logic_vector(97 downto 0);
--    jtag_ctrl_chain_out: out std_logic_vector(10 downto 0)
--  );
--  end component;

  component zpuino_debug_jtag is
  port (
    -- Connections to JTAG stuff

    TCKIR: in std_logic;
    TCKDR: in std_logic;
    TDI: in std_logic;
    CAPTUREIR: in std_logic;
    UPDATEIR:  in std_logic;
    SHIFTIR:  in std_logic;
    CAPTUREDR: in std_logic;
    UPDATEDR:  in std_logic;
    SHIFTDR:  in std_logic;
    TLR:  in std_logic;

    TDO_IR:   out std_logic;
    TDO_DR:   out std_logic;


    jtag_data_chain_in: in std_logic_vector(98 downto 0);
    jtag_ctrl_chain_out: out std_logic_vector(11 downto 0)
  );
  end component;

  component jtag_openocd_rbb is
  port (
    TDI:  out std_logic;
    TMS:  out std_logic;
    TCK:  out std_logic;
    TDO:  in std_logic
  );
  end component jtag_openocd_rbb;


  component tap is
  port (
    TDI:  in std_logic;
    TDO:  out std_logic;
    TMS:  in std_logic;
    TCK:  in std_logic;

    out_TCK: out std_logic;
    out_TDI: out std_logic;
    out_CAPTUREIR: out std_logic;
    out_UPDATEIR:  out std_logic;
    out_SHIFTIR:  out std_logic;
    out_CAPTUREDR: out std_logic;
    out_UPDATEDR:  out std_logic;
    out_SHIFTDR:  out std_logic;
    out_TLR:  out std_logic;
    in_TDO_IR:   in std_logic;
    in_TDO_DR:   in std_logic
  );
  end component tap;

  component wb_rom_ram is
  port (
    ram_wb_clk_i:       in std_logic;
    ram_wb_rst_i:       in std_logic;
    ram_wb_ack_o:       out std_logic;
    ram_wb_stall_o:     out std_logic;
    ram_wb_dat_i:       in std_logic_vector(wordSize-1 downto 0);
    ram_wb_dat_o:       out std_logic_vector(wordSize-1 downto 0);
    ram_wb_adr_i:       in std_logic_vector(maxAddrBitIncIO downto 0);
    ram_wb_cyc_i:       in std_logic;
    ram_wb_stb_i:       in std_logic;
    ram_wb_we_i:        in std_logic;

    rom_wb_clk_i:       in std_logic;
    rom_wb_rst_i:       in std_logic;
    rom_wb_ack_o:       out std_logic;
    rom_wb_dat_o:       out std_logic_vector(wordSize-1 downto 0);
    rom_wb_adr_i:       in std_logic_vector(maxAddrBitIncIO downto 0);
    rom_wb_cyc_i:       in std_logic;
    rom_wb_stb_i:       in std_logic;
    rom_wb_stall_o:     out std_logic;
    rom_wb_cti_i:       in std_logic_vector(2 downto 0)
  );
  end component wb_rom_ram;


  -- I/O Signals
  signal slot_cyc:   slot_std_logic_type;
  signal slot_we:    slot_std_logic_type;
  signal slot_stb:   slot_std_logic_type;
  signal slot_read:  slot_cpuword_type;
  signal slot_write: slot_cpuword_type;
  signal slot_address:  slot_address_type;
  signal slot_ack:   slot_std_logic_type;
  signal slot_interrupt: slot_std_logic_type;
  signal slot_id:   slot_id_type;

  signal jtag_data_chain_out: std_logic_vector(98 downto 0);
  signal jtag_ctrl_chain_in: std_logic_vector(11 downto 0);

  signal TCKDR,TCKIR,TCK,TDI,CAPTUREIR,UPDATEIR,SHIFTIR,CAPTUREDR,UPDATEDR,SHIFTDR,TLR,TDO_IR,TDO_DR: std_logic;
  signal jTCK,jTDI,jTDO,jTMS: std_logic;
  
  signal wb_clk_i: std_logic;
  signal wb_rst_i: std_logic;

  signal dbg_reset: std_logic := '0';

  signal spi2_miso,spi2_mosi,spi2_sck: std_logic;

  signal gpio_spp_data: std_logic_vector(zpuino_gpio_count-1 downto 0);
  signal gpio_spp_read: std_logic_vector(zpuino_gpio_count-1 downto 0);

  signal ram_wb_ack_o:       std_logic;
  signal ram_wb_dat_i:       std_logic_vector(wordSize-1 downto 0);
  signal ram_wb_dat_o:       std_logic_vector(wordSize-1 downto 0);
  signal ram_wb_adr_i:       std_logic_vector(maxAddrBitIncIO downto 0);
  signal ram_wb_cyc_i:       std_logic;
  signal ram_wb_stb_i:       std_logic;
  signal ram_wb_we_i:        std_logic;
  signal ram_wb_stall_o:     std_logic;

  signal sram_wb_ack_o:       std_logic;
  signal sram_wb_dat_i:       std_logic_vector(wordSize-1 downto 0);
  signal sram_wb_dat_o:       std_logic_vector(wordSize-1 downto 0);
  signal sram_wb_adr_i:       std_logic_vector(maxAddrBitIncIO downto 0);
  signal sram_wb_cyc_i:       std_logic;
  signal sram_wb_stb_i:       std_logic;
  signal sram_wb_we_i:        std_logic;
  signal sram_wb_stall_o:     std_logic;

  signal rom_wb_ack_o:       std_logic;
  signal rom_wb_dat_o:       std_logic_vector(wordSize-1 downto 0);
  signal rom_wb_adr_i:       std_logic_vector(maxAddrBitIncIO downto 0);
  signal rom_wb_cyc_i:       std_logic;
  signal rom_wb_stb_i:       std_logic;
  signal rom_wb_cti_i:       std_logic_vector(2 downto 0);
  signal rom_wb_stall_o:     std_logic;

begin

  mysram: sram
    GENERIC MAP (
      size      => 8192,  -- number of memory words
      adr_width => 19,  -- number of address bits
      width     => 16,  -- number of bits per memory word


    -- READ-cycle timing parameters

    tAA_max     => 10 NS, -- Address Access Time
    tOHA_min    => 2 NS, -- Output Hold Time
    tACE_max    => 10 NS, -- nCE/CE2 Access Time
    tDOE_max    => 4.5 NS, -- nOE Access Time
    tLZOE_min   => 0.1 NS, -- nOE to Low-Z Output
    tHZOE_max   => 4 NS, --  OE to High-Z Output
    tLZCE_min   => 3 NS, -- nCE/CE2 to Low-Z Output
    tHZCE_max   => 4 NS, --  CE/nCE2 to High Z Output
 

    -- WRITE-cycle timing parameters

    tWC_min     => 10 NS, -- Write Cycle Time
    tSCE_min    =>  8 NS, -- nCE/CE2 to Write End
    tAW_min     =>  8 NS, -- tAW Address Set-up Time to Write End
    tHA_min     =>  0.1 NS, -- tHA Address Hold from Write End
    tSA_min     =>  0.1 NS, -- Address Set-up Time
    tPWE_min    =>  8 NS, -- nWE Pulse Width
    tSD_min     =>  6 NS, -- Data Set-up to Write End
    tHD_min     =>  0.1 NS, -- Data Hold from Write End
    tHZWE_max   =>  5 NS, -- nWE Low to High-Z Output
    tLZWE_min   =>  2 NS  -- nWE High to Low-Z Output
  )

  PORT MAP (
    nCE     => sram_ce,
    nOE     => sram_oe,
    nWE     => sram_we,

    A       => sram_addr,
    D       => sram_data
  );


  wb_clk_i <= w_clk;
  wb_rst_i <= w_rst or dbg_reset;

  zpuino:zpuino_top
    port map (
      clk           => wb_clk_i,
	 	  rst           => wb_rst_i,
      slot_cyc      => slot_cyc,
      slot_we       => slot_we,
      slot_stb      => slot_stb,
      slot_read     => slot_read,
      slot_write    => slot_write,
      slot_address  => slot_address,
      slot_ack      => slot_ack,
      slot_interrupt=> slot_interrupt,
      slot_id       => slot_id,
      dbg_reset     => dbg_reset,

      m_wb_dat_o    => open,
      m_wb_dat_i    => (others => 'X'),
      m_wb_adr_i    => (others => 'X'),
      m_wb_we_i     => '0',
      m_wb_cyc_i    => '0',
      m_wb_stb_i    => '0',
      m_wb_ack_o    => open,

      ram_wb_ack_i      => ram_wb_ack_o,
      ram_wb_stall_i    => ram_wb_stall_o,
      ram_wb_dat_o      => ram_wb_dat_i,
      ram_wb_dat_i      => ram_wb_dat_o,
      ram_wb_adr_o      => ram_wb_adr_i(maxAddrBit downto 0),
      ram_wb_cyc_o      => ram_wb_cyc_i,
      ram_wb_stb_o      => ram_wb_stb_i,
      ram_wb_we_o       => ram_wb_we_i,

      rom_wb_ack_i      => rom_wb_ack_o,
      rom_wb_stall_i      => rom_wb_stall_o,
      rom_wb_dat_i      => rom_wb_dat_o,
      rom_wb_adr_o      => rom_wb_adr_i(maxAddrBit downto 0),
      rom_wb_cyc_o      => rom_wb_cyc_i,
      rom_wb_stb_o      => rom_wb_stb_i,

      jtag_ctrl_chain_in => (others => '0'),--jtag_ctrl_chain_in,
      jtag_data_chain_out => jtag_data_chain_out
    );

  memarb: wbarb2_1
  generic map (
    ADDRESS_HIGH => maxAddrBit,
    ADDRESS_LOW => 0
  )
  port map (
    wb_clk_i      => wb_clk_i,
	 	wb_rst_i      => wb_rst_i,

    m0_wb_dat_o   => ram_wb_dat_o,
    m0_wb_dat_i   => ram_wb_dat_i,
    m0_wb_adr_i   => ram_wb_adr_i(maxAddrBit downto 0),
    m0_wb_sel_i   => (others => '1'),
    m0_wb_cti_i   => CTI_CYCLE_CLASSIC,
    m0_wb_we_i    => ram_wb_we_i,
    m0_wb_cyc_i   => ram_wb_cyc_i,
    m0_wb_stb_i   => ram_wb_stb_i,
    m0_wb_ack_o   => ram_wb_ack_o,
    m0_wb_stall_o => ram_wb_stall_o,

    m1_wb_dat_o   => rom_wb_dat_o,
    m1_wb_dat_i   => (others => DontCareValue),
    m1_wb_adr_i   => rom_wb_adr_i(maxAddrBit downto 0),
    m1_wb_sel_i   => (others => '1'),
    m1_wb_cti_i   => CTI_CYCLE_CLASSIC,
    m1_wb_we_i    => '0',--rom_wb_we_i,
    m1_wb_cyc_i   => rom_wb_cyc_i,
    m1_wb_stb_i   => rom_wb_stb_i,
    m1_wb_ack_o   => rom_wb_ack_o,
    m1_wb_stall_o => rom_wb_stall_o,

    s0_wb_dat_i   => sram_wb_dat_o,
    s0_wb_dat_o   => sram_wb_dat_i,
    s0_wb_adr_o   => sram_wb_adr_i(maxAddrBit downto 0),
    s0_wb_sel_o   => open,
    s0_wb_cti_o   => open,
    s0_wb_we_o    => sram_wb_we_i,
    s0_wb_cyc_o   => sram_wb_cyc_i,
    s0_wb_stb_o   => sram_wb_stb_i,
    s0_wb_ack_i   => sram_wb_ack_o,
    s0_wb_stall_i => sram_wb_stall_o
  );


--  memory: wb_rom_ram
--  port map (
--    ram_wb_clk_i      => wb_clk_i,
--    ram_wb_rst_i      => wb_rst_i,
--    ram_wb_ack_o      => ram_wb_ack_o,
--    ram_wb_dat_i      => ram_wb_dat_i,
--    ram_wb_dat_o      => ram_wb_dat_o,
--    ram_wb_adr_i      => ram_wb_adr_i,
--    ram_wb_cyc_i      => ram_wb_cyc_i,
--    ram_wb_stb_i      => ram_wb_stb_i,
--    ram_wb_we_i       => ram_wb_we_i,
--    ram_wb_stall_o    => ram_wb_stall_o,

--    rom_wb_clk_i      => wb_clk_i,
--    rom_wb_rst_i      => wb_rst_i,
--    rom_wb_ack_o      => rom_wb_ack_o,
--    rom_wb_dat_o      => rom_wb_dat_o,
--    rom_wb_adr_i      => rom_wb_adr_i,
--    rom_wb_cyc_i      => rom_wb_cyc_i,
--   rom_wb_stb_i      => rom_wb_stb_i,
--    rom_wb_cti_i      => rom_wb_cti_i,
--    rom_wb_stall_o    => rom_wb_stall_o
--  );

  dbgport: zpuino_debug_jtag
    port map (
      jtag_data_chain_in => jtag_data_chain_out,
      jtag_ctrl_chain_out => jtag_ctrl_chain_in,

      TCKIR       => TCKIR,
      TCKDR       => TCKDR,
      TDI         => TDI,
      CAPTUREIR   => CAPTUREIR,
      UPDATEIR    => UPDATEIR,
      SHIFTIR     => SHIFTIR,
      CAPTUREDR   => CAPTUREDR,
      UPDATEDR    => UPDATEDR,
      SHIFTDR     => SHIFTDR,
      TLR         => TLR,

      TDO_IR      => TDO_IR,
      TDO_DR      => TDO_DR
    );

  TCKDR <= TCK;
  TCKIR <= TCK;

  jtag: jtag_openocd_rbb
  port map (
    TDI => jTDI,
    TDO => jTDO,
    TMS => jTMS,
    TCK => jTCK
  );


  tap_inst: tap
  port map (
    TDI => jTDI,
    TDO => jTDO,
    TMS => jTMS,
    TCK => jTCK,

    out_TCK       => TCK,
    out_TDI       => TDI,
    out_CAPTUREIR => CAPTUREIR,
    out_UPDATEIR  => UPDATEIR,
    out_SHIFTIR   => SHIFTIR,
    out_CAPTUREDR => CAPTUREDR,
    out_UPDATEDR  => UPDATEDR,
    out_SHIFTDR   => SHIFTDR,
    out_TLR       => TLR,
    in_TDO_IR     => TDO_IR,
    in_TDO_DR     => TDO_DR
  );



  uart_rx <= rxsim;--uart_tx after 7 us;

  uart_tx <= gpio_o(1);
  gpio_i(48) <= uart_rx;

  gp: for i in 0 to 47 generate
    gpio_i(i) <= gpio_o(i) when gpio_t(i)='0' else 'Z';
  end generate;

  rxs: uart_pty_tx
   port map(
      clk => w_clk,
      rst => w_rst,
      tx  => rxsim
   );

  -- These values were taken from post-P&R timing analysis

--  spi_pf_mosi_dly <= spi_pf_mosi after 3.850 ns;
--- spi_pf_sck_dly <= spi_pf_sck after 3.825 ns;
    gpio_i(2) <= spi_pf_miso_dly after  2.540 ns;
--  spi_pf_nsel <= gpio_i(0) after  3.850 ns;

  spiflash: M25P16
    port map (
      VCC => vcc,
		  C   => gpio_o(4),
      D   => gpio_o(3),
      S   => gpio_o(40),
      W   => '0',
      HOLD => '1',
		  Q   => spi_pf_miso_dly
    );

  w_clk <= not w_clk after period/2;
  w_vgaclk <= not w_vgaclk after vgaperiod/2;

  stimuli : process
   begin
      w_rst   <= '0';
      wait for 1 ns;
      vcc     <= 3.3;
      w_rst   <= '1';
      wait for 120 ns;
      w_rst   <= '0';
      wait for 1000 ms;
      report "End" severity failure;
      wait;
   end process;

  --
  --
  -- ----------------  I/O connection to devices --------------------
  --
  --

  --
  -- IO SLOT 0
  --

  slot4: zpuino_spi
  port map (
    wb_clk_i       => wb_clk_i,
	 	wb_rst_i    => wb_rst_i,
    wb_dat_o      => slot_read(4),
    wb_dat_i     => slot_write(4),
    wb_adr_i   => slot_address(4),
    wb_we_i        => slot_we(4),
    wb_cyc_i      => slot_cyc(4),
    wb_stb_i      => slot_stb(4),
    wb_ack_o      => slot_ack(4),
    wb_inta_o => slot_interrupt(4),
    id        => slot_id(4),
    mosi      => spi_pf_mosi,
    miso      => spi_pf_miso,
    sck       => spi_pf_sck,
    enabled   => open
  );

  --
  -- IO SLOT 1
  --

  uart_inst: zpuino_uart
  port map (
    wb_clk_i       => wb_clk_i,
	 	wb_rst_i    => wb_rst_i,
    wb_dat_o      => slot_read(1),
    wb_dat_i     => slot_write(1),
    wb_adr_i   => slot_address(1),
    wb_we_i      => slot_we(1),
    wb_cyc_i       => slot_cyc(1),
    wb_stb_i       => slot_stb(1),
    wb_ack_o      => slot_ack(1),
    wb_inta_o => slot_interrupt(1),
    id        => slot_id(1),

    enabled   => open,
    tx        => open,
    rx        => '0'
  );

  --
  -- IO SLOT 2
  --

  gpio_inst: zpuino_gpio
  generic map (
    gpio_count => zpuino_gpio_count
  )
  port map (
    wb_clk_i       => wb_clk_i,
	 	wb_rst_i    => wb_rst_i,
    wb_dat_o      => slot_read(2),
    wb_dat_i     => slot_write(2),
    wb_adr_i   => slot_address(2),
    wb_we_i        => slot_we(2),
    wb_cyc_i       => slot_cyc(2),
    wb_stb_i       => slot_stb(2),
    wb_ack_o      => slot_ack(2),
    wb_inta_o => slot_interrupt(2),
    id        => slot_id(2),
    spp_data  => gpio_spp_data,
    spp_read  => gpio_spp_read,

    gpio_i      => gpio_i,
    gpio_t      => gpio_t,
    gpio_o      => gpio_o,
    spp_cap_in   => (others =>'1'),
    spp_cap_out  => (others =>'1')
  );

  --
  -- IO SLOT 3
  --

  timers_inst: zpuino_timers
  port map (
    wb_clk_i       => wb_clk_i,
	 	wb_rst_i    => wb_rst_i,
    wb_dat_o      => slot_read(3),
    wb_dat_i     => slot_write(3),
    wb_adr_i   => slot_address(3),
    wb_we_i        => slot_we(3),
    wb_cyc_i        => slot_cyc(3),
    wb_stb_i        => slot_stb(3),
    wb_ack_o      => slot_ack(3),

    wb_inta_o => slot_interrupt(3), -- We use two interrupt lines
    wb_intb_o => slot_interrupt(4) -- so we borrow intr line from slot 4

    --spp_data  => timers_spp_data,
    --spp_en    => open,
    --comp      => open
    );

  --
  -- IO SLOT 5
  --

  sigmadelta_inst: zpuino_sigmadelta
  port map (
    wb_clk_i       => wb_clk_i,
	 	wb_rst_i    => wb_rst_i,
    wb_dat_o      => slot_read(5),
    wb_dat_i     => slot_write(5),
    wb_adr_i   => slot_address(5),
    wb_we_i        => slot_we(5),
    wb_cyc_i        => slot_cyc(5),
    wb_stb_i        => slot_stb(5),
    wb_ack_o      => slot_ack(5),
    wb_inta_o => slot_interrupt(5),
    id        => slot_id(5),
    spp_data  => open,
    spp_en    => open,
    sync_in   => '1'
  );

  --
  -- IO SLOT 6
  --

  slot1: zpuino_spi
  port map (
    wb_clk_i       => wb_clk_i,
	 	wb_rst_i    => wb_rst_i,
    wb_dat_o      => slot_read(6),
    wb_dat_i     => slot_write(6),
    wb_adr_i   => slot_address(6),
    wb_we_i        => slot_we(6),
    wb_cyc_i        => slot_cyc(6),
    wb_stb_i        => slot_stb(6),
    wb_ack_o      => slot_ack(6),
    wb_inta_o => slot_interrupt(6),
    id        => slot_id(6),
    mosi      => spi2_mosi,
    miso      => spi2_miso,
    sck       => spi2_sck,
    enabled   => open
  );



  --
  -- IO SLOT 7
  --

  crc16_inst: zpuino_crc16
  port map (
    wb_clk_i       => wb_clk_i,
	 	wb_rst_i    => wb_rst_i,
    wb_dat_o     => slot_read(7),
    wb_dat_i     => slot_write(7),
    wb_adr_i   => slot_address(7),
    wb_we_i     => slot_we(7),
    wb_cyc_i        => slot_cyc(7),
    wb_stb_i        => slot_stb(7),
    wb_ack_o      => slot_ack(7),
    wb_inta_o => slot_interrupt(7),
    id        => slot_id(7)
  );

  --
  -- IO SLOT 8 (optional)
  --

  adc_inst: zpuino_empty_device
  port map (
    wb_clk_i       => wb_clk_i,
	 	wb_rst_i    => wb_rst_i,
    wb_dat_o      => slot_read(8),
    wb_dat_i     => slot_write(8),
    wb_adr_i   => slot_address(8),
    wb_we_i    => slot_we(8),
    wb_cyc_i      => slot_cyc(8),
    wb_stb_i      => slot_stb(8),
    wb_ack_o      => slot_ack(8),
    wb_inta_o =>  slot_interrupt(8),
    id        => slot_id(8)
  );

  --
  -- IO SLOT 9
  --

  slot9: zpuino_empty_device
  port map (
    wb_clk_i       => wb_clk_i,
	 	wb_rst_i       => wb_rst_i,
    wb_dat_o      => slot_read(9),
    wb_dat_i     => slot_write(9),
    wb_adr_i   => slot_address(9),
    wb_we_i        => slot_we(9),
    wb_cyc_i        => slot_cyc(9),
    wb_stb_i        => slot_stb(9),
    wb_ack_o      => slot_ack(9),
    wb_inta_o => slot_interrupt(9),
    id        => slot_id(9)
  );

  --
  -- IO SLOT 10
  --

  slot10: zpuino_empty_device
  port map (
    wb_clk_i       => wb_clk_i,
	 	wb_rst_i       => wb_rst_i,
    wb_dat_o      => slot_read(10),
    wb_dat_i     => slot_write(10),
    wb_adr_i   => slot_address(10),
    wb_we_i        => slot_we(10),
    wb_cyc_i        => slot_cyc(10),
    wb_stb_i        => slot_stb(10),
    wb_ack_o      => slot_ack(10),
    wb_inta_o => slot_interrupt(10),
    id        => slot_id(10)
  );

  --
  -- IO SLOT 11
  --

  slot11: zpuino_empty_device
  port map (
    wb_clk_i       => wb_clk_i,
	 	wb_rst_i       => wb_rst_i,
    wb_dat_o      => slot_read(11),
    wb_dat_i     => slot_write(11),
    wb_adr_i   => slot_address(11),
    wb_we_i        => slot_we(11),
    wb_cyc_i        => slot_cyc(11),
    wb_stb_i        => slot_stb(11),
    wb_ack_o      => slot_ack(11),
    wb_inta_o => slot_interrupt(11),
    id        => slot_id(11)
  );

  --
  -- IO SLOT 12
  --

  slot12: zpuino_empty_device
  port map (
    wb_clk_i       => wb_clk_i,
	 	wb_rst_i       => wb_rst_i,
    wb_dat_o      => slot_read(12),
    wb_dat_i     => slot_write(12),
    wb_adr_i   => slot_address(12),
    wb_we_i        => slot_we(12),
    wb_cyc_i        => slot_cyc(12),
    wb_stb_i        => slot_stb(12),
    wb_ack_o      => slot_ack(12),
    wb_inta_o => slot_interrupt(12),
    id        => slot_id(12)
  );

  --
  -- IO SLOT 13
  --

  slot13: zpuino_empty_device
  port map (
    wb_clk_i       => wb_clk_i,
	 	wb_rst_i       => wb_rst_i,
    wb_dat_o      => slot_read(13),
    wb_dat_i     => slot_write(13),
    wb_adr_i   => slot_address(13),
    wb_we_i        => slot_we(13),
    wb_cyc_i        => slot_cyc(13),
    wb_stb_i        => slot_stb(13),
    wb_ack_o      => slot_ack(13),
    wb_inta_o => slot_interrupt(13),
    id        => slot_id(13)
  );

  --
  -- IO SLOT 14
  --

  slot14: zpuino_empty_device
  port map (
    wb_clk_i       => wb_clk_i,
	 	wb_rst_i       => wb_rst_i,
    wb_dat_o      => slot_read(14),
    wb_dat_i     => slot_write(14),
    wb_adr_i   => slot_address(14),
    wb_we_i        => slot_we(14),
    wb_cyc_i        => slot_cyc(14),
    wb_stb_i        => slot_stb(14),
    wb_ack_o      => slot_ack(14),
    wb_inta_o => slot_interrupt(14),
    id        => slot_id(14)
  );

  --
  -- IO SLOT 15
  --

  slot15: zpuino_empty_device
  port map (
    wb_clk_i       => wb_clk_i,
	 	wb_rst_i       => wb_rst_i,
    wb_dat_o      => slot_read(15),
    wb_dat_i     => slot_write(15),
    wb_adr_i   => slot_address(15),
    wb_we_i        => slot_we(15),
    wb_cyc_i        => slot_cyc(15),
    wb_stb_i        => slot_stb(15),
    wb_ack_o      => slot_ack(15),
    wb_inta_o => slot_interrupt(15),
    id        => slot_id(15)
  );

    gpio_spp_data(3) <= sigmadelta_spp_data(0); -- PPS4 : SIGMADELTA DATA
    gpio_spp_data(4) <= timers_spp_data(0);     -- PPS5 : TIMER0
    gpio_spp_data(5) <= timers_spp_data(1);     -- PPS6 : TIMER1

    spi2_miso <= gpio_spp_read(6);              -- PPS7 : USPI MISO
    gpio_spp_data(7) <= spi2_mosi;              -- PPS8 : USPI MOSI
    gpio_spp_data(8) <= spi2_sck;               -- PPS9: USPI SCK
  --  gpio_spp_data(13) <= sigmadelta_spp_data(1); -- PPS14 : SIGMADELTA1 DATA


end behave;
