library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

-- EVLA IF DATA TRANSMISSION DEFORMATTER BLOCK
-- Common to all 3 fpgas on the fiber receiver board.
--
-- Added readback of scramble code scan chain 11/04/03.
-- 12/08/03  scramble code hard wired. Read back control register
--            in descramble module.
-- 01/21/04  Add error count long term accumulators.
-- 08/06/07  Change msb of frame count to data valid flag.
--            Add metadata decoder on metaframe index bit.
-- 20080402  Metadata capture and timing recovery changes.
--
-- Primary Inputs:
--    Clock and demultiplexed data from the AMCC demux chip.
--    rx_in and rx_inclock are the LVDS input pins.
-- Primary Outputs:
--    Parallel data frame (128 bits) and status information.
--    Output is after FIFO.
--
-- SIGNALS BY PORT:
--    Primary input:
--      rx_in       : 16 bits LVDS input from demux chip.
--      rx_inclock  : clock for rx_in from demux chip.
--    Primary output:
--      def_out     : demultiplexed data frame (128 bits).
--      frame_count : frame counter of current frame at def_out.
--      index       : metaframe index of frame at def_out.
--      one_sec     : one pps derived from received frames.
--      ten_sec     : one per 10 sec derived from received frames.
--      out_clock   : fifo read side clock( input to deformatter_seti ).
--      f_clock     : frame clock derived from input (fifo write side clock).
--    Control:
--      advance     : causes fifo read pointer to move earlier in data stream.
--      retard      : causes fifo read pointer to move later in data stream.
--    Monitor/control:
--      data        : 8 bit data bus.
--      sel         : 8 bit address.
--      cs          : chip select line (active low)
--      wrstb       : write strobe (rising edge active)
--      rdstb       : read strobe (low level drives data bus).
--
-- --------------------------------------------------------------------
--
-- General operation:
--  Blocks in main data path:
--  inputblock   Uses the pin serdes of the Stratix to demultiplex the
--               input by a factor of 10 to get a 160 bit wide raw
--               data frame.  -- bit_reorder Is a signal renaming
--               block that causes no logic to be synthesized.  It
--               creates a bit vector with indexing convenient for the
--               barrel shifter.  -- barrel_roll Reorders the raw data
--               frame to put the frame sync word in the correct place
--               for later processing.
--  fieldsplit   Is another renaming block that produces no synthesized logic.
--               It puts the fields of the frame into contiguous
--               blocks of its ouput.
--  descramble   Applies the oc 192 scramble code, checks the frame
--               for the frame sync word, and does the parity
--               computation.  -- evla_fifo Provides a means to align
--               frames from the three channels.
--  Auxilliary blocks:
--  parity_counter Counts parity errors.
--  counters     Synthesize the 1pps and .1pps signals from the metaframe
--               index of received frames.
--  roll_state   Controls the inputblock and barrel_roll blocks to account
--               for the fact that there is no way to control the
--               initial phase of transmitter and receiver
--               blocks. Also has a counter to suppress synchronizer
--               operation during latencies. This block knows only how
--               to adjust the two mentioned blocks. It works in
--               combination with the next block.
--  synchronizer Works with roll_state to place the frame sync word in
--               the correct location at the descramble block input.
--
-- ----------------------------------------------------------------------
-- </doc deformatter_seti.vhd
-- MONITOR AND CONTROL
--
--  Control ports:
--    advance and retard provide a means to time align the three data
--    streams handled by a fiber receiver card. Chromatic dispersion
--    in the if fiber can cause data frames to be misaligned between
--    channels.
--
--    At initialization the monitor/control computer forces the fifo
--    read pointer to a specific offset relative to the write
--    pointer. External logic examines the frame counter values at the
--    fifo output for the 3 channels and advances or retards some of
--    the channels to cause all 3 counters to be the same.
--
-- Monitor/control:
--
--    The data bus is an 8 bit wide read/write bus.
--
--    Write to the scramble code address shifts the scramble code from
--    the 8 bit data bus to the scramble code register. The scramble
--    code register is 152 bits wide (19 bytes). The 150 bit scramble
--    code applied to the data frame is right justified in this
--    register. Shift the scramble code into the register low order
--    byte first. Bits within the bytes are in natural order.
--
--    Reads from the parity counter address read the parity counter
--    latch.  Latch the parity counter data into the parity counter
--    latch by writeing a 1 into bit 4 of the control register.  The
--    first read of the parity counter latch will read the high order
--    byte of the latch the second will read the low order byte.
--
--    Writes to the control register address write the data bus into
--    the control register.  The control register has the following
--    layout
--  
--    bit
--    7 6 5 4 3 2 1 0
--    | | | | | | | |_ initialize fifo read pointer.
--    | | | | | | |___ initialize timing counters.
--    | | | | | |_____ force synchronizer to search mode.
--    | | | | |_______ reset parity counter.
--    | | | |_________ copy parity counter contents to parity counter latch.
--    | | |___________ advance or unused depending on mode
--    | |_____________ retard or unused depending on mode
--    |_______________ unassigned
--
--    All control register bits are "one shot". When written they
--    perform the indicated function one time and reset until the next
--    time they are commanded. The control register is write only.
--
-- Assigned address: X"01" - control register
--                   X"02" - parity error counter(s)
--                   X"03" - scramble code scan chain
-- Note: the difinitive source for the data concerning register address is
--  the top level design files.
--
-- doc/>
-- March 2008 Notes on new line protocol.
-- The meta frame bit has been extended to carry coarse timing data from
--  the formatter along with added meta data supplied by formatter hardware
--  bits and the DTS module mib.
-- A meta frame is indicated by the metaframe bit being high when the frame
--  count is 0. The two frames previous carry the coarser timing data.
--  The previous frame indicates a 1pps time event and the second previous
--  one 10 seconds.
-- The bit in the frame following is a version flag. If reset it indicates
--  data being received from a module with the beta fpga code and indicates
--  that none of this applies. If reset no coarser timing recovery is
--  attempted.
-- The next 71 bits are 7 bits of hardware status followed by 64 bits of mib
--  data. These are made available to the local cmib.

-- 200803      Changes for new line protocol.
-- 200811      Changes and simplifications.

entity deformatter_seti is
  generic(
    cr_address : unsigned(7 downto 0) := X"00"; --control register
    pc_address : unsigned(7 downto 0) := X"01"; --parity register
    sc_address : unsigned(7 downto 0) := X"02"; --scramble code register
    md_address : unsigned(7 downto 0) := X"03"; --meta-data register
    tm_address : unsigned(7 downto 0) := X"04"  --timing register
    );
  port(
    rx_in      : in  std_logic_vector(159 downto 0);   -- demuxed data
    rx_inclock : in  std_logic;                        -- clock at 10GHz/160 (62.5 MHz)
    rx_locked  : in  std_logic;
    lockdet    : in  std_logic;         -- demux locked.
    def_out    : out std_logic_vector(127 downto 0);  -- one frame
                                                      -- of bits
    index      : out std_logic;         -- 50 ms metaframe index
    one_sec    : out std_logic;         -- 1 pps
    ten_sec    : out std_logic;         -- .1 pps
    f_clock    : out std_logic;         -- frame clock derived from input.
    locked     : out std_logic;         -- synchronized to input data frames.

    -- monitor and control related ports
    din    : in    std_logic_vector(7 downto 0);
    dout   : out   std_logic_vector(7 downto 0);
    sel    : in    std_logic_vector(7 downto 0);
    cs     : in    std_logic;           -- chip select, active low.
    wrstb  : in    std_logic;           -- data write strobe.
    rdstb  : in    std_logic;           -- data read strobe.
    unmute : in    std_logic;
    resync : out   std_logic;

    time_mode   : out std_logic;
    sync        : out std_logic;        -- frame count = zero
    data_source : out std_logic
    );
end deformatter_seti;

architecture structural of deformatter_seti is

  component metadata_readout
    generic (
      address : std_logic_vector(7 downto 0) := X"00");
    port (
      input : in    std_logic_vector(31 downto 0);
      clock : in    std_logic;
      cs    : in    std_logic;
      rdstb : in    std_logic;
      sel   : in    std_logic_vector(7 downto 0);
      dout  : out   std_logic_vector(7 downto 0));
  end component;

  component metadata_capture
    port (
      index_in    : in  std_logic;
      clock       : in  std_logic;
      index       : out std_logic;
      metadata    : out std_logic_vector(31 downto 0);
      data_source : out std_logic);
  end component;

  component timing_gen
    port (
      clock  : in  std_logic;
      index  : in  std_logic;
      d      : in  std_logic_vector(7 downto 0);
      wrs    : in  std_logic;
      cs     : in  std_logic;
      tenms  : out std_logic;
      onesec : out std_logic;
      tensec : out std_logic);
  end component;

  component bit_reorder
    port(
      input  : in  std_logic_vector(159 downto 0);
      output : out std_logic_vector(159 downto 0)
      );
  end component;

  component fieldsplit
    port(
      input  : in  std_logic_vector(159 downto 0);
      output : out std_logic_vector(159 downto 0)
      );
  end component;

  component descramble
    port(
      data       : in  std_logic_vector(7 downto 0);
      scan_chain : out std_logic_vector(7 downto 0);
      strobe     : in  std_logic;
      sel        : in  std_logic;
      input      : in  std_logic_vector(159 downto 0);
      clock      : in  std_logic;
      output     : out std_logic_vector(127 downto 0);
      valid      : out std_logic;
      frame_cnt  : out std_logic_vector(4 downto 0);
      frame_cnte : out std_logic_vector(4 downto 0);
      index      : out std_logic;
      indexe     : out std_logic;
      parity     : out std_logic
      );
  end component;

  component synchronizer
    port(
      input     : in  std_logic_vector(9 downto 0);
      clock     : in  std_logic;
      lockdet   : in  std_logic;
      rx_locked : in  std_logic;
      init      : in  std_logic;
      wrstb     : in  std_logic;
      sel       : in  std_logic;
      synced    : out std_logic;
      shift     : out std_logic
      );
  end component;

  component parity_counter
    port(
      wstb   : in    std_logic;         -- write strobe
      din    : in    std_logic_vector(7 downto 0);
      dout   : out   std_logic_vector(7 downto 0);
      rstb   : in    std_logic;         -- read strobe
      sel    : in    std_logic;         -- address select
      cs     : in    std_logic;         -- chip select
      clock  : in    std_logic;         -- frame clock
      parity : in    std_logic;         -- parity error
      onesec : in    std_logic;         -- 1pps 
      nsync  : in    std_logic          -- synchronized
      );
  end component;

  signal dvmode        : std_logic;
  signal dout_md       : std_logic_vector(7 downto 0);
  signal dout_parity   : std_logic_vector(7 downto 0);
  signal raw_frame     : std_logic_vector(159 downto 0);
  signal inorder_frame : std_logic_vector(159 downto 0);
  signal sorted_frame  : std_logic_vector(159 downto 0);
  signal frame_data    : std_logic_vector(127 downto 0);
  signal metadata      : std_logic_vector(31 downto 0);
  signal scan_chain    : std_logic_vector(7 downto 0);
  signal frame_counti  : std_logic_vector(4 downto 0);
  signal frame_counte  : std_logic_vector(4 downto 0);
  signal shift         : std_logic_vector(3 downto 0);
  signal frame_index   : std_logic;
  signal frame_indexn  : std_logic;
  signal frame_indexe  : std_logic;
  signal frame_clock   : std_logic;
  signal input_shift   : std_logic;
  signal one_seci      : std_logic;
  signal ten_seci      : std_logic;
  signal parity        : std_logic;
  signal nsync         : std_logic;
  signal sc_sel        : std_logic;
  signal md_sel        : std_logic;
  signal init_sel      : std_logic;
  signal parity_sel    : std_logic;
  signal tm_sel        : std_logic;
  signal adv           : std_logic;
  signal ret           : std_logic;
  signal framez        : std_logic;
  signal data_source_i : std_logic;

  subtype  temp_t is std_logic_vector(127 downto 0);
  constant t_zeros : temp_t := (others => '0');
  signal   temp    : temp_t;
  
begin

  -- when unmute is 0, any of the three channels unlocked, force data to
  -- all zeros and force indicated source to 3-bit.
  
  def_out <= temp when unmute = '1' else t_zeros;
  data_source <= '1' when unmute = '0' else data_source_i;
  
  index   <= frame_index; --frame_indexn; --Use raw 50ms from DTS, not generated 10ms
  one_sec <= one_seci;
  ten_sec <= ten_seci;
  locked  <= nsync;
  sync    <= framez;

  framez <= '1' when frame_counte = "00000" else '0';

-- Address decoding of m&c

  sc_sel <= '1' when sel = std_logic_vector(sc_address)
            and cs = '0' else '0';
  init_sel <= '1' when sel = std_logic_vector(cr_address)
            and cs = '0' else '0';
  parity_sel <= '1' when sel = std_logic_vector(pc_address)
            and cs = '0' else '0';
  tm_sel <= '1' when sel = std_logic_vector(tm_address)
            and cs = '0' else '0';
  md_sel <= '1' when sel = std_logic_vector(md_address)
            and cs = '0' else '0';
  
  f_clock <= frame_clock;

  dout <= "0000000" & nsync when init_sel = '1' and rdstb = '0' else
          scan_chain when sc_sel = '1' and rdstb = '0' else
          dout_parity when parity_sel = '1' and rdstb = '0' else
          dout_md when md_sel = '1' and rdstb = '0' else
          "00000000";
  
  u0a : metadata_capture
    port map (
      index_in    => frame_indexe,
      clock       => frame_clock,
      index       => frame_index,
      metadata    => metadata,
      data_source => data_source_i);

  u0b : metadata_readout
    generic map(
      address => std_logic_vector(md_address))
    port map(
      input => metadata,
      clock => frame_clock,
      cs    => cs,
      rdstb => rdstb,
      sel   => sel,
      dout  => dout_md);

  u0c : timing_gen
    port map (
      clock  => frame_clock,
      index  => frame_index,
      d      => din,
      wrs    => wrstb,
      cs     => tm_sel,
      tenms  => frame_indexn,
      onesec => one_seci,
      tensec => ten_seci); 

  --u1 : inputblock
  --  port map(
  --    rx_in       => rx_in, rx_inclock => rx_inclock,
  --    rx_out      => raw_frame, rx_locked => rx_locked,
  --    rx_outclock => frame_clock);
  
  frame_clock <= rx_inclock;    
  raw_frame <= rx_in;

  --u2 : bit_reorder
  --  port map(
  --    input  => raw_frame,
  --    output => inorder_frame);
      
  inorder_frame <= raw_frame;

  u3 : synchronizer
    port map(
      input     => sorted_frame(9 downto 0),
      clock     => frame_clock,
      lockdet   => lockdet,
      rx_locked => rx_locked,
      init      => din(2),
      wrstb     => wrstb,
      sel       => init_sel,
      synced    => nsync,
      shift     => input_shift);

  resync <= not input_shift;

  u4 : fieldsplit
    port map(input => inorder_frame, output => sorted_frame);

  u5 : descramble
    port map(
      input      => sorted_frame,
      clock      => frame_clock,
      output     => temp,
      frame_cnt  => frame_counti,
      frame_cnte => frame_counte,
      index      => open,
      indexe     => frame_indexe,
      parity     => parity,
      valid      => open,
      data       => din,
      strobe     => wrstb,
      sel        => sc_sel,
      scan_chain => scan_chain);

  u10 : parity_counter
    port map(
      wstb   => wrstb,
      din    => din,
      dout   => dout_parity,
      rstb   => rdstb,
      clock  => frame_clock,
      parity => parity,
      nsync  => nsync,
      sel    => parity_sel,
      onesec => one_seci,
      cs     => cs);

end structural;
