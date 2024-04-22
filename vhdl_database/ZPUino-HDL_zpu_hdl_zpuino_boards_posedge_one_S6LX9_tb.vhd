library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb is
end entity tb;

architecture sim of tb is

  constant period: time := 31.25 ns;
  signal w_clk: std_logic := '0';

  component papilio_duo_top is
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

    AVR_nCS:  in std_logic;
    AVR_SCK:  in std_logic;
    AVR_MOSI: in std_logic;
    AVR_MISO: out std_logic;

    -- UART (FTDI) connection
    TXD:        out std_logic;
    RXD:        in std_logic;

    -- SRAM connections
    sram_addr:  out std_logic_vector(18 downto 0);
    sram_data:  inout std_logic_vector(7 downto 0);
    sram_ce:    out std_logic;
    sram_we:    out std_logic;
    sram_oe:    out std_logic

  );
  end component;

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
  signal sram_data:  std_logic_vector(7 downto 0);
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

begin
  w_clk <= not w_clk after period/2;

  uut: papilio_duo_top
  port map (
    CLK => w_clk,
    RXD => '0',
    SPI_MISO => spi_miso,
    SPI_MOSI => spi_mosi,
    SPI_SCK => spi_sck,
    SPI_CS   => spi_cs,
    AVR_nCS => '1',
    AVR_SCK => '0',
    AVR_MOSI => '0',
    sram_ce     => sram_ce_i,
    sram_oe     => sram_oe_i,
    sram_we     => sram_we_i,

    sram_addr       => sram_addr_i,
    sram_data       => sram_data

  );

  sram_addr <= transport sram_addr_i after 1.7 ns;
  sram_we <= transport sram_we_i after 1.9 ns;
  sram_oe <= transport sram_oe_i after 1.7 ns;
  sram_ce <= transport sram_ce_i after 1.7 ns;

  mysram: sram
    GENERIC MAP (
      size      => 524288,  -- number of memory words
      adr_width => 19,  -- number of address bits
      width     => 8,  -- number of bits per memory word


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
