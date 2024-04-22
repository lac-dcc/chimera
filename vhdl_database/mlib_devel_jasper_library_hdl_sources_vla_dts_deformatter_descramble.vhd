library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
-- Simulated and working  04/29/03
-- Added readback of scramble code scan chain 11/04/03.
-- 12/08/03 - scramble code hard wired. set bit 0 in register to disable.
--
-- Pipelined oc-192 descrambler and parity checker.  Undoes the
-- scrambling applied to the oc-192 frame and does a 16 bit
-- longitudinal parity check.  The parity check computation is
-- pipelined.  Total pipeline latency is 3 clocks. see comments below
-- near line 70.  It may be possible to decrease this by unpipelining
-- some of the computations.

-- INPUT:
--  data( 7 downto 0 )      monitor/control data bus.
--  strobe                  strobes from data(7downto0)
--  sel                     register select.
--  input( 159 downto 0 )   data frame after barrel roll.
--  clock                   clocks pipeline stages.
-- OUTPUT
--  output( 127 downto 0 )  payload data
--  valid                   high when the frame header is
--                          detected in the correct place
--                          in the input frame.
--  frame_cnt( 4 downto 0 ) frame index count.
--  frame_cnte(4 downto 0)  frame index count 1 frame early.
--  index                   meta-frame index.
--  indexe                  1 frame early metaframe index.
--  parity                  1 when parity error.
--
-- NOTE: indexe is needed for 1pps and .1pps generation.

entity descramble is
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
end descramble;

architecture behavioral of descramble is

  component metadata
    port (
      clock       : in  std_logic;
      input       : in  std_logic;
      frame_count : in  std_logic_vector(4 downto 0);
      index       : out std_logic;
      onesec      : out std_logic;
      tensec      : out std_logic;
      sr_ena      : out std_logic);
  end component;

  signal scramble_code : std_logic_vector(151 downto 0);  -- scramble source.
  signal control_reg   : std_logic_vector(0 downto 0);
  signal scramble      : std_logic_vector(159 downto 0);  -- scramble code
  signal stage0        : std_logic_vector(159 downto 0);  -- unscrambled data
  signal stage1        : std_logic_vector(133 downto 0);  -- data path pipeline
  signal stage2        : std_logic_vector(133 downto 0);
  signal frame0        : std_logic;     -- frame detect pipeline
  signal frame1        : std_logic;
  signal frame2        : std_logic;
  signal parity1       : std_logic_vector(63 downto 0);  -- parity checker pipeline
  signal parity2       : std_logic_vector(15 downto 0);

  attribute keep            : boolean;
  attribute keep of parity1 : signal is true;
begin

-- received from zach barnes by email.
--  The OC-192 scramble code.
-- 
--  From zbarnes@aoc.nrao.edu Thu Oct 30 09:51:38 2003
--  Date: Thu, 30 Oct 2003 09:42:08 -0700
--  From: Zach Barnes <zbarnes@aoc.nrao.edu>
--  To: mrevnell <mrevnell@nrao.edu>
--  Subject: scramble code

-- X"0AE689E286081FD533BA58DED6C91C2F95CD13"

  scramble_code <= X"0AE689E286081FD533BA58DED6C91C2F95CD13";

-- first pipeline stage.
-- undoes oc-192 frame scramble.
-- sync pattern detector
  process(clock)
  begin
    if clock'event and clock = '1' then
      stage0 <= input xor scramble;
      if input(9 downto 0) = "0110101001" then
        frame0 <= '1';
      else
        frame0 <= '0';
      end if;
    end if;
  end process;

-- second pipeline stage
-- first part of parity computation.
-- compensating delays in data and frame detector channels.

-- commenting out the following register inferences saves a pipeline stage and
--   its latency.

  stage1                <= stage0(143 downto 10);  -- data channel delay.
  frame1                <= frame0;                 -- sync detect channel.
  parity1(63 downto 48) <= stage0(159 downto 144)
                           xor stage0(143 downto 128)
                           xor stage0(127 downto 112)
                           xor stage0(111 downto 96);
  parity1(47 downto 16) <= stage0(95 downto 64);   -- save some till later.
  parity1(15 downto 0)  <= stage0(63 downto 48)
                           xor stage0(47 downto 32)
                           xor stage0(31 downto 16)
                           xor stage0(15 downto 0);


-- third pipeline stage
-- some more parity computation
-- some more compensating delays.
  process(clock)
  begin
    if clock'event and clock = '1' then
      stage2  <= stage1;                -- data channel delay
      frame2  <= frame1;                -- sync detect channel
      parity2 <= parity1(47 downto 32) xor parity1(63 downto 48)
                 xor parity1(31 downto 16) xor parity1(15 downto 0);
    end if;
  end process;

-- last pipeline stage.
-- split output fields.
-- final part of parity check.
-- last stage of sync word detect pipeline.
  process(clock)
  begin
    if clock'event and clock = '1' then
      frame_cnt  <= stage2(5 downto 1);    -- split fields from data pipe.
      frame_cnte <= stage1(5 downto 1);
      index      <= stage2(0);             -- meta-frame index.
      indexe     <= stage1(0);             -- 1 frame early metaframe index.
      output     <= stage2(133 downto 6);  -- payload data.
      valid      <= frame2;                -- word detect pipe.
      if parity2 = X"0000" then
        parity <= '0';
      else
        parity <= '1';
      end if;
    end if;
  end process;

  process(strobe, sel)
  begin
    if strobe'event and strobe = '1' then
      if sel = '1' then
        control_reg(0) <= data(0);
      end if;
    end if;
  end process;

  scan_chain <= "0000000" & control_reg;

  scramble <= scramble_code(149 downto 0) & "0000000000" when control_reg(0) = '0'
              else (others => '0');

end behavioral;
