-- (C) 2001-2013 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions and other 
-- software and tools, and its AMPP partner logic functions, and any output 
-- files any of the foregoing (including device programming or simulation 
-- files), and any associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License Subscription 
-- Agreement, Altera MegaCore Function License Agreement, or other applicable 
-- license agreement, including, without limitation, that your use is for the 
-- sole purpose of programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the applicable 
-- agreement for further details.


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Alex, 02-10-07, this package declaration results in error at built time on a new machine
--   
use work.auk_dspip_math_pkg_hpfir.all;

package auk_dspip_lib_pkg_hpfir is 
--Component names: 
--auk_dspip_atlantic_sink
--auk_dspip_atlantic_source
--auk_dspip_interface_controller
--auk_dspip_avalon_streaming_controller_hpfir
--auk_dspip_avalon_streaming_controller_pe_fir_91
--auk_dspip_avalon_streaming_sink_hpfir
--auk_dspip_avalon_streaming_source_hpfir
--auk_dspip_delay_fir_91
--auk_dspip_fastadd_fir_91
--auk_dspip_fastaddsub_fir_91
--auk_dspip_pipelined_adder_fir_91
--auk_dspip_fast_accumulator_fir_91
--auk_dspip_fifo_pfc_fir_91
--auk_dspip_fpcompiler_alufp
--auk_dspip_fpcompiler_aslf
--auk_dspip_fpcompiler_asrf
--auk_dspip_fpcompiler_castftox
--auk_dspip_fpcompiler_castxtof
--auk_dspip_fpcompiler_clzf
--auk_dspip_fpcompiler_mulfp
--auk_dspip_pfc_fir_91
--auk_dspip_roundsat_fir_91
component auk_dspip_atlantic_sink is

  generic(
    WIDTH           : integer := 16;
    PACKET_SIZE     : natural := 4;
    log2packet_size : integer := 2
    );
  port(
    clk             : in  std_logic;
    reset_n         : in  std_logic;
    ----------------- DESIGN SIDE SIGNALS
    data_available  : out std_logic;    --goes high when new data is available
    data            : out std_logic_vector(WIDTH-1 downto 0);
    sink_ready_ctrl : in  std_logic;    --the controller will tell
                                        --the interface whether
                                        --new input can be accepted.
    sink_stall      : out std_logic;    --needs to stall the design
                                        --if no new data is coming
    packet_error    : out std_logic_vector (1 downto 0);  --this is for SOP and EOP check only.
                                        --when any of these doesn't behave as
                                        --expected, the error is flagged.
    send_sop        : out std_logic;    -- transmit SOP signal to the design.
                                        -- It only transmits the legal SOP.
    send_eop        : out std_logic;    -- transmit EOP signal to the design.
                                        -- It only transmits the legal EOP.    
    ----------------- ATLANTIC SIDE SIGNALS
    at_sink_ready   : out std_logic;    --it will be '1' whenever the
                                        --sink_ready_ctrl signal is high.
    at_sink_valid   : in  std_logic;
    at_sink_data    : in  std_logic_vector(WIDTH-1 downto 0);
    at_sink_sop     : in  std_logic := '0';
    at_sink_eop     : in  std_logic := '0';
    at_sink_error   : in  std_logic_vector(1 downto 0)  --it indicates to the data source
                                        --that the SOP and EOP signals
                                        --are not received as expected.

    );

end component auk_dspip_atlantic_sink;

component auk_dspip_atlantic_source is
  generic(
    WIDTH             :     integer  := 16;
    packet_size       :     natural  := 4;
    LOG2packet_size   :     integer  := 2;
    multi_channel     :     BOOLEAN  := TRUE
    );
  port(
    clk               : in  std_logic;
    reset_n           : in  std_logic;
    ----------------- DESIGN SIDE SIGNALS
    data              : in  std_logic_vector (WIDTH-1 downto 0);
    data_count        : in  std_logic_vector (LOG2packet_size-1 downto 0) := (others => '0');
    source_valid_ctrl : in  std_logic;  --the controller will tell
                                        --the interface whether
                                        --new input can be accepted.
    source_stall      : out std_logic;  --needs to stall the design
                                        --if no new data is coming
    packet_error      : in  std_logic_vector (1 downto 0);
    ----------------- ATLANTIC SIDE SIGNALS
    at_source_ready   : in  std_logic;
    at_source_valid   : out std_logic;
    at_source_data    : out std_logic_vector (WIDTH-1 downto 0);
    at_source_channel : out std_logic_vector (log2packet_size-1 downto 0);
    at_source_error   : out std_logic_vector (1 downto 0);
    at_source_sop     : out std_logic;
    at_source_eop     : out std_logic
    );

-- Declarations

end component auk_dspip_atlantic_source;


component auk_dspip_interface_controller IS
   PORT( 
    clk 	            : in  std_logic;
      reset               : IN     std_logic;
    ready               : in  std_logic;
      sink_packet_error   : IN     std_logic_vector (1 DOWNTO 0);
      sink_stall          : IN     std_logic;
      source_stall        : IN     std_logic;
      valid               : IN     std_logic;
      reset_design        : OUT    std_logic;
      reset_n             : OUT    std_logic;
      sink_ready_ctrl     : OUT    std_logic;
      source_packet_error : OUT    std_logic_vector (1 DOWNTO 0);
      source_valid_ctrl   : OUT    std_logic;
      stall               : OUT    std_logic
   );

-- Declarations

end component auk_dspip_interface_controller ;


component auk_dspip_avalon_streaming_controller_hpfir is
  port(
    clk 	        : in  std_logic;
    --clk_en              : in  std_logic := '1';
    reset_n             : in  std_logic;
    --ready               : in  std_logic;
    sink_packet_error   : in  std_logic_vector (1 downto 0);
    --sink_stall          : in  std_logic;
    source_stall        : in  std_logic;
    valid               : in  std_logic;
    reset_design        : out std_logic;
    sink_ready_ctrl     : out std_logic;
    source_packet_error : out std_logic_vector (1 downto 0);
    source_valid_ctrl   : out std_logic;
    stall               : out std_logic
    );

-- Declarations

end component auk_dspip_avalon_streaming_controller_hpfir;

component auk_dspip_avalon_streaming_controller_pe_fir_91 is
  generic (
    FIFO_WIDTH_g            : natural := 8;
    ENABLE_PIPELINE_DEPTH_g : natural := 0;  -- this value should match the depth of the enable pipeline in the core
    FAMILY_g                : string  := "Stratix II";
    MEM_TYPE_g              : string  := "Auto"
    );  
  port(
    clk                 : in  std_logic;
    clk_en              : in  std_logic := '1';
    reset_n             : in  std_logic;
    ready               : in  std_logic;
    sink_packet_error   : in  std_logic_vector (1 downto 0);
    sink_stall          : in  std_logic;
    source_stall        : in  std_logic;
    valid               : in  std_logic;
    reset_design        : out std_logic;
    sink_ready_ctrl     : out std_logic;
    source_packet_error : out std_logic_vector (1 downto 0);
    source_valid_ctrl   : out std_logic;
    stall               : out std_logic;
    data_in             : in  std_logic_vector(FIFO_WIDTH_g-1 downto 0);
    data_out            : out std_logic_vector(FIFO_WIDTH_g-1 downto 0);
    design_stall        : out std_logic
    );

-- Declarations

end component auk_dspip_avalon_streaming_controller_pe_fir_91;

component auk_dspip_avalon_streaming_sink_hpfir is

  generic(
    WIDTH_g          : integer := 16;
    DATA_WIDTH       : integer := 8;
    DATA_PORT_COUNT  : integer := 3;
    PACKET_SIZE_g    : natural := 4
    --FIFO_DEPTH_g     : natural := 5    --if PFC mode is selected, this generic
                                        --is used for passing the poly_factor.
    --MIN_DATA_COUNT_g : natural := 2;
    --PFC_MODE_g       : boolean := false;
    --SOP_EOP_CALC_g : boolean := false;  -- calculate sop and eop rather than
                                        -- reading value from fifo
    --FAMILY_g         : string  := "Stratix II";
    --MEM_TYPE_g       : string  := "Auto"
    );
  port(
    clk             : in  std_logic;
    reset_n         : in  std_logic;
    ----------------- DESIGN SIDE SIGNALS
    data            : out std_logic_vector(WIDTH_g-1 downto 0);
    data_valid      : out std_logic_vector(0 downto 0);
    sink_ready_ctrl : in  std_logic;    --the controller will tell
                                        --the interface whether
                                        --new input can be accepted.
    --sink_stall      : out std_logic;    --needs to stall the design
                                        --if no new data is coming
    packet_error    : out std_logic_vector (1 downto 0);  --this is for SOP and EOP check only.
                                        --when any of these doesn't behave as
                                        --expected, the error is flagged.
    --send_sop        : out std_logic;    -- transmit SOP signal to the design.
                                        -- It only transmits the legal SOP.
    --send_eop        : out std_logic;    -- transmit EOP signal to the design.
                                        -- It only transmits the legal EOP.    
    ----------------- ATLANTIC SIDE SIGNALS
    at_sink_ready   : out std_logic;    --it will be '1' whenever the
                                        --sink_ready_ctrl signal is high.
    at_sink_valid   : in  std_logic;
    at_sink_data    : in  std_logic_vector(WIDTH_g-1 downto 0);
    at_sink_sop     : in  std_logic := '0';
    at_sink_eop     : in  std_logic := '0';
    at_sink_error   : in  std_logic_vector(1 downto 0)  := "00" --it indicates
                                        --that there is an error in the packet.

    );

end component auk_dspip_avalon_streaming_sink_hpfir;

component auk_dspip_avalon_streaming_source_hpfir is
  generic(
    WIDTH_g                 : integer := 8;   
    DATA_WIDTH              : integer := 8;
    DATA_PORT_COUNT         : integer := 1;
    PACKET_SIZE_g           : natural := 2;
    FIFO_DEPTH_g            : natural := 0; 
    HAVE_COUNTER_g          : boolean := false;
    COUNTER_LIMIT_g         : natural := 4;
    --MULTI_CHANNEL_g         : boolean := true;
    USE_PACKETS             : integer := 1;
    --FAMILY_g                : string  := "Stratix II";
    --MEM_TYPE_g              : string  := "Auto";
    ENABLE_BACKPRESSURE_g   : boolean := true
    );
  port(
    clk               : in  std_logic;
    reset_n           : in  std_logic;
    ----------------- DESIGN SIDE SIGNALS
    data_in           : in  std_logic_vector (WIDTH_g-1 downto 0);
    data_count        : in  std_logic_vector (log2_ceil_one(PACKET_SIZE_g)-1 downto 0) := (others => '0');
    source_valid_ctrl : in  std_logic;
    source_stall      : out std_logic;
    packet_error      : in  std_logic_vector (1 downto 0);
    ----------------- AVALON_STREAMING SIDE SIGNALS
    at_source_ready   : in  std_logic;
    at_source_valid   : out std_logic;
    at_source_data    : out std_logic_vector (WIDTH_g-1 downto 0);
    at_source_channel : out std_logic_vector (log2_ceil_one(PACKET_SIZE_g)-1 downto 0);
    at_source_error   : out std_logic_vector (1 downto 0);
    at_source_sop     : out std_logic;
    at_source_eop     : out std_logic
    );

-- Declarations

end component auk_dspip_avalon_streaming_source_hpfir;

component auk_dspip_roundsat_hpfir is
  generic (
    IN_WIDTH_g      : natural := 8;               -- i/p data width
    REM_LSB_BIT_g   : natural := 2;               -- no. of lsb to be removed
    REM_LSB_TYPE_g  : string  := "Truncation";    -- TRUNCATE/ROUND_UP
    REM_MSB_BIT_g   : natural := 2;               -- no. of msb to be removed
    REM_MSB_TYPE_g  : string  := "Truncation"     -- TRUNCATE/SATURATE
    );
  port (
    clk             : in  std_logic;
    reset_n         : in  std_logic;
    enable          : in  std_logic;
    datain          : in  std_logic_vector(IN_WIDTH_g-1 downto 0);
    valid           : out std_logic;
    dataout         : out std_logic_vector(IN_WIDTH_g-REM_LSB_BIT_g-REM_MSB_BIT_g-1 downto 0)
  );
end component auk_dspip_roundsat_hpfir;

component auk_dspip_delay_fir_91 is
  generic (
    WIDTH_g          :     natural := 8;  -- data width
    DELAY_g          :     natural := 8;
                                        -- number of clock cycles the input
                                        -- will be delayed by
    MEMORY_TYPE_g    :     string  := "AUTO";
                                        -- possible values are  "m4k", "m512",
                                        -- "register", "mram", "auto", 
                                        -- "lutram", "M9K", "M144K".
                                        -- Any other string will be interpreted
                                        -- as "auto"
    REGISTER_FIRST_g :     natural := 1;
                                        -- if "1", the first delay is guaranteed
                                        -- to be in registers
    REGISTER_LAST_g  :     natural := 1);  -- if "1", the last delay is guaranteed
                                        -- to be in registers
  port (
    clk              : in  std_logic;
    reset            : in  std_logic;
    enable           : in  std_logic;   -- global clock enable
    datain           : in  std_logic_vector(WIDTH_g-1 downto 0);
    dataout          : out std_logic_vector(WIDTH_g-1 downto 0)
    );
end component auk_dspip_delay_fir_91;


component auk_dspip_fastadd_fir_91 is
  generic (
    INWIDTH_g  :     natural := 18;
    LABWIDTH_g :     natural := 16);
    -- width of lab in selected device ( 10 or 16 in Cyclone,
    -- Cylone II, Stratix and Stratix II.  Don't know
    -- Stratix III yet.
  port (
    datain1    : in  std_logic_vector(INWIDTH_g-1 downto 0);
    datain2    : in  std_logic_vector(INWIDTH_g-1 downto 0);
    clk        : in  std_logic;
    enable     : in  std_logic;
    reset      : in  std_logic;
    dataout    : out std_logic_vector(INWIDTH_g downto 0));
end component auk_dspip_fastadd_fir_91;


component auk_dspip_fastaddsub_fir_91 is
  generic (
    INWIDTH_g  :     natural := 18;
    LABWIDTH_g :     natural := 16);
    -- width of lab in selected device ( 10 or 16 in Cyclone,
    -- Cylone II, Stratix and Stratix II.  Don't know
    -- Stratix III yet.
  port (
    datain1    : in  std_logic_vector(INWIDTH_g-1 downto 0);
    datain2    : in  std_logic_vector(INWIDTH_g-1 downto 0);
    add_nsub   : in std_logic;
    clk        : in  std_logic;
    enable     : in  std_logic;
    reset      : in  std_logic;
    dataout    : out std_logic_vector(INWIDTH_g downto 0));
end component auk_dspip_fastaddsub_fir_91;


component auk_dspip_pipelined_adder_fir_91 is
  generic (
    INWIDTH_g      : natural := 42;
		-- width of lab in selected device ( 10 or 16 in Cyclone,
    -- Cylone II, Stratix and Stratix II.  
		--  Alex :  should I use 19 bits for Stratix III? 
    -- The rational being 10 ALM (2 bits x ALM  + the carry chain inside the same LAB for efficiency.
		LABWIDTH_g :     natural := 38);
  port (
		datain1    : in  std_logic_vector(INWIDTH_g-1 downto 0);
    datain2    : in  std_logic_vector(INWIDTH_g-1 downto 0);
    clk        : in  std_logic;
    enable     : in  std_logic;
    reset      : in  std_logic;
    dataout    : out std_logic_vector(INWIDTH_g downto 0));
end component  auk_dspip_pipelined_adder_fir_91;


component auk_dspip_fast_accumulator_fir_91 is
  generic (
    DATA_WIDTH_g      : natural := 42;
		-- width of lab in selected device ( 10 or 16 in Cyclone,
    -- Cylone II, Stratix and Stratix II.  
		--  for Stratix III is 20 so labwidth should be set to 18. 
    -- The rational being 10 ALM (2 bits x ALM  + the carry chain inside the same LAB for efficiency.
		LABWIDTH_g :     natural := 38;
    NUM_OF_CHANNELS_g : natural := 1;
    ACCUM_OUT_WIDTH_g : natural := 48;
    ACCUM_MEM_TYPE_g : string := "auto");
  port (
    reset : in  std_logic;
    clk   : in  std_logic;
    enb   : in  std_logic;
    add_to_zero : in std_logic;
    datai : in  std_logic_vector(DATA_WIDTH_g-1 downto 0);
    datao : out std_logic_vector(ACCUM_OUT_WIDTH_g-1 downto 0));
end component auk_dspip_fast_accumulator_fir_91;


component auk_dspip_fifo_pfc_fir_91 is
  generic (
    NUM_CHANNELS_g            : integer := 5;
    POLY_FACTOR_g             : integer := 3;
    DATA_WIDTH_g              : integer := 16;
    ALMOST_FULL_VALUE_g       : integer := 2;
    RAM_TYPE_g                : string  := "AUTO";
    CALCULATE_USED_WORDS_ONCE : boolean := true
    );
  port (

    datai       : in  std_logic_vector(DATA_WIDTH_g-1 downto 0);
    datao       : out std_logic_vector(DATA_WIDTH_g-1 downto 0);
    channel_out : out std_logic_vector(log2_ceil(NUM_CHANNELS_g)-1 downto 0);
    used_w      : out std_logic_vector(log2_ceil(POLY_FACTOR_g * NUM_CHANNELS_g)+1 downto 0);

    wrreq       : in  std_logic;
    rdreq       : in  std_logic;
    almost_full : out std_logic;
    empty       : out std_logic;
    sclr        : in  std_logic;
    clk         : in  std_logic;
    reset       : in  std_logic;
    enable      : in  std_logic
    );
end component auk_dspip_fifo_pfc_fir_91;
component auk_dspip_fpcompiler_alufp is
  port (
    sysclk       : in std_logic;
    reset        : in std_logic;
    enable       : in  std_logic;
    addsub       : in std_logic;
    aa           : in std_logic_vector (42 downto 1);
    aasat, aazip : in std_logic;
    bb           : in std_logic_vector (42 downto 1);
    bbsat, bbzip : in std_logic;
    cc           : out std_logic_vector (42 downto 1);
    ccsat, cczip : out std_logic
    );
end component auk_dspip_fpcompiler_alufp;
component auk_dspip_fpcompiler_aslf is
  port (
    inbus : in std_logic_vector (32 downto 1);
    shift : in std_logic_vector (5 downto 1);

    outbus : out std_logic_vector (32 downto 1)
    );
end component auk_dspip_fpcompiler_aslf;
component auk_dspip_fpcompiler_asrf is
  port (
    inbus : in std_logic_vector (32 downto 1);
    shift : in std_logic_vector (5 downto 1);

    outbus : out std_logic_vector (32 downto 1)
    );
end component auk_dspip_fpcompiler_asrf;

component auk_dspip_fpcompiler_castftox is
  port (
    aa : in std_logic_vector (32 downto 1);
    cc           : out std_logic_vector (42 downto 1);
    ccsat, cczip : out std_logic
    );
end component auk_dspip_fpcompiler_castftox;

component auk_dspip_fpcompiler_castxtof is
  port (
    sysclk       : in  std_logic;
    reset        : in  std_logic;
    enable       : in  std_logic;
    aa           : in  std_logic_vector (42 downto 1);
    aasat, aazip : in  std_logic;
    cc           : out std_logic_vector (32 downto 1)
    );
end component auk_dspip_fpcompiler_castxtof;

component auk_dspip_fpcompiler_clzf is
  port (
    frac : in std_logic_vector (32 downto 1);
    count : out std_logic_vector (5 downto 1)
    );
end component auk_dspip_fpcompiler_clzf;
component auk_dspip_fpcompiler_mulfp is
  port (
    sysclk       : in std_logic;
    reset        : in std_logic;
    enable       : in  std_logic;
    aa           : in std_logic_vector (42 downto 1);
    aasat, aazip : in std_logic;
    bb           : in std_logic_vector (42 downto 1);
    bbsat, bbzip : in std_logic;
    cc           : out std_logic_vector (42 downto 1);
    ccsat, cczip : out std_logic
    );
end component auk_dspip_fpcompiler_mulfp;

component auk_dspip_pfc_fir_91 is
  generic (
    NUM_CHANNELS_g : integer := 5;
    POLY_FACTOR_g  : integer := 3;
    DATA_WIDTH_g   : integer := 16;
    RAM_TYPE_g     : string  := "AUTO"
    );
  port (

    datai       : in  std_logic_vector(DATA_WIDTH_g-1 downto 0);
    datao       : out std_logic_vector(DATA_WIDTH_g-1 downto 0);
    channel_out : out std_logic_vector(log2_ceil(NUM_CHANNELS_g)-1 downto 0);

    in_valid  : in  std_logic;
    out_valid : out std_logic;
    clk       : in  std_logic;
    reset     : in  std_logic;
    enable    : in  std_logic
    );
end component auk_dspip_pfc_fir_91;


component auk_dspip_roundsat_fir_91 is
  generic (
    IN_WIDTH_g      : natural := 8;     -- data width
    OUT_WIDTH_g     : natural := 8;     -- data width
    ROUNDING_TYPE_g : string  := "TRUNCATE_LOW"
    );

  port (
    clk     : in  std_logic;
    reset   : in  std_logic;
    enable  : in  std_logic;            -- global clock enable
    datain  : in  std_logic_vector(IN_WIDTH_g-1 downto 0);
    dataout : out std_logic_vector(OUT_WIDTH_g-1 downto 0));
end component auk_dspip_roundsat_fir_91;

component auk_dspip_avalon_streaming_block_source_fir_91 is
  generic (
    MAX_BLK_g   : natural;
    DATAWIDTH_g : natural);
  port (
    clk          : in  std_logic;
    reset        : in  std_logic;
    in_blk       : in  std_logic_vector(log2_ceil(MAX_BLK_g) downto 0);
    in_valid     : in  std_logic;
    source_stall : out std_logic;
    in_data      : in  std_logic_vector(DATAWIDTH_g - 1 downto 0);
    source_valid : out std_logic;
    source_ready : in  std_logic;
    source_sop   : out std_logic;
    source_eop   : out std_logic;
    source_data  : out std_logic_vector(DATAWIDTH_g - 1 downto 0));
end component auk_dspip_avalon_streaming_block_source_fir_91;

component auk_dspip_avalon_streaming_block_sink_fir_91 is
  generic (
    MAX_BLK_g    : natural;
    STALL_g      : natural;
    DATAWIDTH_g  : natural;
    -- this generic is specific for the FFT.
    NUM_STAGES_g : natural);
  port (
    clk            : in  std_logic;
    reset          : in  std_logic;
    in_blk         : in  std_logic_vector(log2_ceil(MAX_BLK_g) downto 0);
    in_sop         : in  std_logic;
    in_eop         : in  std_logic;
    in_inverse     : in  std_logic;
    sink_valid     : in  std_logic;
    sink_ready     : out std_logic;
    source_stall   : in  std_logic;
    in_data        : in  std_logic_vector(DATAWIDTH_g - 1 downto 0);
    processing     : in  std_logic;
    in_error       : in  std_logic_vector(1 downto 0);
    out_error      : out std_logic_vector(1 downto 0);
    out_valid      : out std_logic;
    out_sop        : out std_logic;
    out_eop        : out std_logic;
    out_data       : out std_logic_vector(DATAWIDTH_g - 1 downto 0);
    curr_blk       : out std_logic_vector(log2_ceil(MAX_BLK_g) downto 0);
    -- these are specific to the FFT, no effort has been made to optimize! 
    curr_pwr_2     : out std_logic;
    curr_inverse   : out std_logic;
    curr_input_sel : out std_logic_vector(NUM_STAGES_g - 1 downto 0));
end component auk_dspip_avalon_streaming_block_sink_fir_91;



end package auk_dspip_lib_pkg_hpfir;
