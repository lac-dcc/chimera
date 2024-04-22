library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb is
end entity tb;

architecture sim of tb is

  constant period: time := 31.25 ns;
  signal w_clk: std_logic := '0';

  component papilio_pro_top is
  port (
    CLK:        in std_logic;

    -- Connection to the main SPI flash
    SPI_SCK:    out std_logic;
    SPI_MISO:   in std_logic;
    SPI_MOSI:   out std_logic;
    SPI_CS:     out std_logic;

    -- WING connections
    WING_A:     inout std_logic_vector(15 downto 0);
    WING_B:     inout std_logic_vector(15 downto 0);
    WING_C:     inout std_logic_vector(15 downto 0);

    -- UART (FTDI) connection
    TXD:        out std_logic;
    RXD:        in std_logic;

    -- SDRAM signals
     DRAM_ADDR   : OUT   STD_LOGIC_VECTOR (12 downto 0);
     DRAM_BA      : OUT   STD_LOGIC_VECTOR (1 downto 0);
     DRAM_CAS_N   : OUT   STD_LOGIC;
     DRAM_CKE      : OUT   STD_LOGIC;
     DRAM_CLK      : OUT   STD_LOGIC;
     DRAM_CS_N   : OUT   STD_LOGIC;
     DRAM_DQ      : INOUT STD_LOGIC_VECTOR(15 downto 0);
     DRAM_DQM      : OUT   STD_LOGIC_VECTOR(1 downto 0);
     DRAM_RAS_N   : OUT   STD_LOGIC;
     DRAM_WE_N    : OUT   STD_LOGIC;

    -- The LED
    LED:        out std_logic
  );
  end component;

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

  signal sram_addr:  std_logic_vector(18 downto 0);
  signal sram_data:  std_logic_vector(15 downto 0);
  signal sram_ce:    std_logic;
  signal sram_we:    std_logic;
  signal sram_oe:    std_logic;
  signal sram_be:    std_logic;

  signal sram_addr_i:  std_logic_vector(18 downto 0);
--  signal sram_data:  std_logic_vector(15 downto 0);
  signal sram_ce_i:    std_logic;
  signal sram_we_i:    std_logic;
  signal sram_oe_i:    std_logic;
  signal sram_be_i:    std_logic;

  signal spi_miso_i:    std_logic;
  signal vcc: real := 0.0;

  signal spi_sck, spi_mosi, spi_miso, spi_cs: std_logic;



    -- SDRAM signals
     signal DRAM_ADDR   :    STD_LOGIC_VECTOR (12 downto 0);
     signal DRAM_BA      :   STD_LOGIC_VECTOR (1 downto 0);
     signal DRAM_CAS_N   :    STD_LOGIC;
     signal DRAM_CKE      :    STD_LOGIC;
     signal DRAM_CLK      :   STD_LOGIC;
     signal DRAM_CS_N   :    STD_LOGIC;
     signal DRAM_DQ      :  STD_LOGIC_VECTOR(15 downto 0);
     signal DRAM_DQM      :   STD_LOGIC_VECTOR(1 downto 0);
     signal DRAM_RAS_N   :   STD_LOGIC;
     signal DRAM_WE_N    :   STD_LOGIC;

  component mt48lc16m16a2 IS
    GENERIC (
        -- Timing Parameters for -7E (PC133) and CAS Latency = 3
        tAC       : TIME    :=  5.4 ns;
        tHZ       : TIME    :=  7.0 ns;
        tOH       : TIME    :=  2.7 ns;
        tMRD      : INTEGER :=  2;          -- 2 Clk Cycles
        tRAS      : TIME    := 44.0 ns;
        tRC       : TIME    := 66.0 ns;
        tRCD      : TIME    := 20.0 ns;
        tRP       : TIME    := 20.0 ns;
        tRRD      : TIME    := 15.0 ns;
        tWRa      : TIME    :=  7.5 ns;     -- A2 Version - Auto precharge mode only (1 Clk + 7.5 ns)
        tWRp      : TIME    := 15.0 ns;     -- A2 Version - Precharge mode only (15 ns)

        tAH       : TIME    :=  0.8 ns;
        tAS       : TIME    :=  1.5 ns;
        tCH       : TIME    :=  2.5 ns;
        tCL       : TIME    :=  2.5 ns;
        tCK       : TIME    :=  7.0 ns;
        tDH       : TIME    :=  0.8 ns;
        tDS       : TIME    :=  1.5 ns;
        tCKH      : TIME    :=  0.8 ns;
        tCKS      : TIME    :=  1.5 ns;
        tCMH      : TIME    :=  0.8 ns;
        tCMS      : TIME    :=  1.5 ns;

        addr_bits : INTEGER := 13;
        data_bits : INTEGER := 16;
        col_bits  : INTEGER :=  9;
        index     : INTEGER :=  0;
	fname     : string := "sdram.srec"	-- File to read from
    );
    PORT (
        Dq    : INOUT STD_LOGIC_VECTOR (data_bits - 1 DOWNTO 0) := (OTHERS => 'Z');
        Addr  : IN    STD_LOGIC_VECTOR (addr_bits - 1 DOWNTO 0) := (OTHERS => '0');
        Ba    : IN    STD_LOGIC_VECTOR := "00";
        Clk   : IN    STD_LOGIC := '0';
        Cke   : IN    STD_LOGIC := '1';
        Cs_n  : IN    STD_LOGIC := '1';
        Ras_n : IN    STD_LOGIC := '1';
        Cas_n : IN    STD_LOGIC := '1';
        We_n  : IN    STD_LOGIC := '1';
        Dqm   : IN    STD_LOGIC_VECTOR (1 DOWNTO 0) := "00"
    );
  END component;


begin
  w_clk <= not w_clk after period/2;

  uut: papilio_pro_top
  port map (
    CLK => w_clk,
    RXD => '0',
    SPI_MISO => spi_miso,
    SPI_MOSI => spi_mosi,
    SPI_SCK => spi_sck,
    SPI_CS   => spi_cs,

    DRAM_ADDR   => DRAM_ADDR,
    DRAM_BA     => DRAM_BA,
    DRAM_CAS_N  => DRAM_CAS_N,
    DRAM_CKE    => DRAM_CKE,
    DRAM_CLK    => DRAM_CLK,
    DRAM_CS_N   => DRAM_CS_N,
    DRAM_DQ     => DRAM_DQ,
    DRAM_DQM    => DRAM_DQM,
    DRAM_RAS_N  => DRAM_RAS_N,
    DRAM_WE_N   => DRAM_WE_N

  );

  sdram: mt48lc16m16a2
    GENERIC MAP  (
        addr_bits  => 12,
        data_bits  => 16,
        col_bits   => 8,
        index      => 0,
      	fname      => "sdram.srec"
    )
    PORT MAP (
        Dq    => DRAM_DQ,
        Addr  => DRAM_ADDR(11 downto 0),
        Ba    => DRAM_BA,
        Clk   => DRAM_CLK,
        Cke   => DRAM_CKE,
        Cs_n  => DRAM_CS_N,
        Ras_n => DRAM_RAS_N,
        Cas_n => DRAM_CAS_N,
        We_n  => DRAM_WE_N,
        Dqm   => DRAM_DQM
    );



  sram_addr <= transport sram_addr_i after 1.7 ns;
  sram_we <= transport sram_we_i after 1.9 ns;
  sram_oe <= transport sram_oe_i after 1.7 ns;
  sram_ce <= transport sram_ce_i after 1.7 ns;

  spiflash: M25P16
    port map (
      VCC => vcc,
		  C   => SPI_SCK,
      D   => SPI_MOSI,
      S   => SPI_CS,
      W   => '0',
      HOLD => '1',
		  Q   => spi_miso_i
    );

  SPI_MISO <= transport spi_miso_i after 7.5 ns;

  process
  begin
    wait for 1 ns;
    vcc <= 3.3;
    wait;
  end process;

end sim;
