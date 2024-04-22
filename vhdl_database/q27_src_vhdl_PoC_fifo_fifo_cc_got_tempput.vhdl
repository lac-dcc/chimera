-- EMACS settings: -*-  tab-width: 2; indent-tabs-mode: t -*-
-- vim: tabstop=2:shiftwidth=2:noexpandtab
-- kate: tab-width 2; replace-tabs off; indent-width 2;
--
-- ============================================================================================================================================================
-- Module:					FIFO, common clock (cc), pipelined interface,
--									writes only become effective after explicit commit
--
-- Authors:					Thomas B. Preusser
--									Steffen Koehler
--									Martin Zabel
--
-- Description:
-- ------------------------------------
--		The specified depth (MIN_DEPTH) is rounded up to the next suitable value.
--
--		As uncommitted writes populate FIFO space that is not yet available for
--		reading, an instance of this FIFO can, indeed, report 'full' and 'not vld'
--		at the same time. While a 'commit' would eventually make data available for
--		reading ('vld'), a 'rollback' would free the space for subsequent writing
--		('not ful').
--
--		'commit' and 'rollback' are inclusive and apply to all writes ('put') since
--		the previous 'commit' or 'rollback' up to and including a potentially
--		simultaneous write.
--
--		The FIFO state upon a simultaneous assertion of 'commit' and 'rollback' is
--		*undefined*!
--
--		*STATE_*_BITS defines the granularity of the fill state indicator
--		'*state_*'. 'fstate_rd' is associated with the read clock domain and outputs
--		the guaranteed number of words available in the FIFO. 'estate_wr' is
--		associated with the write clock domain and outputs the number of words that
--		is guaranteed to be accepted by the FIFO without a capacity overflow. Note
--		that both these indicators cannot replace the 'full' or 'valid' outputs as
--		they may be implemented as giving pessimistic bounds that are minimally off
--		the true fill state.
--
--		If a fill state is not of interest, set *STATE_*_BITS = 0.
--
--		'fstate_rd' and 'estate_wr' are combinatorial outputs and include an address
--		comparator (subtractor) in their path.
--
--		Examples:
--		- FSTATE_RD_BITS = 1: fstate_rd == 0 => 0/2 full
--		                      fstate_rd == 1 => 1/2 full (half full)
--
--		- FSTATE_RD_BITS = 2: fstate_rd == 0 => 0/4 full
--		                      fstate_rd == 1 => 1/4 full
--		                      fstate_rd == 2 => 2/4 full
--		                      fstate_rd == 3 => 3/4 full
--
-- License:
-- ============================================================================================================================================================
-- Copyright 2007-2014 Technische Universitaet Dresden - Germany, Chair for VLSI-Design, Diagnostics and Architecture
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--		http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
-- ============================================================================================================================================================

library	IEEE;
use			IEEE.std_logic_1164.all;
use			IEEE.numeric_std.all;

library	poc;
use			poc.config.all;
USE			poc.utils.all;
use			poc.ocram.ocram_sdp;


entity fifo_cc_got_tempput is
  generic (
    D_BITS         : positive;          -- Data Width
    MIN_DEPTH      : positive;          -- Minimum FIFO Depth
    DATA_REG       : boolean := false;  -- Store Data Content in Registers
    STATE_REG      : boolean := false;  -- Registered Full/Empty Indicators
    OUTPUT_REG     : boolean := false;  -- Registered FIFO Output
    ESTATE_WR_BITS : natural := 0;      -- Empty State Bits
    FSTATE_RD_BITS : natural := 0       -- Full State Bits
  );
  port (
    -- Global Reset and Clock
    rst, clk : in  std_logic;

    -- Writing Interface
    put       : in  std_logic;                            -- Write Request
    din       : in  std_logic_vector(D_BITS-1 downto 0);  -- Input Data
    full      : out std_logic;
    estate_wr : out std_logic_vector(imax(0, ESTATE_WR_BITS-1) downto 0);

    commit    : in  std_logic;
    rollback  : in  std_logic;

    -- Reading Interface
    got       : in  std_logic;                            -- Read Completed
    dout      : out std_logic_vector(D_BITS-1 downto 0);  -- Output Data
    valid     : out std_logic;
    fstate_rd : out std_logic_vector(imax(0, FSTATE_RD_BITS-1) downto 0)
  );
end fifo_cc_got_tempput;


architecture rtl of fifo_cc_got_tempput is

  -- Address Width
  constant A_BITS : natural := log2ceil(MIN_DEPTH);

  -- Force Carry-Chain Use for Pointer Increments on Xilinx Architectures
  constant FORCE_XILCY : boolean := (not SIMULATION) and (VENDOR = VENDOR_XILINX) and STATE_REG and (A_BITS > 4);

  -----------------------------------------------------------------------------
  -- Memory Pointers

  -- Actual Input and Output Pointers
  signal IP0 : unsigned(A_BITS-1 downto 0) := (others => '0');
  signal OP0 : unsigned(A_BITS-1 downto 0) := (others => '0');

  -- Incremented Input and Output Pointers
  signal IP1 : unsigned(A_BITS-1 downto 0);
  signal OP1 : unsigned(A_BITS-1 downto 0);

  -- Committed Write Pointer (Commit Marker)
  signal IPm : unsigned(A_BITS-1 downto 0) := (others => '0');

  -----------------------------------------------------------------------------
  -- Backing Memory Connectivity

  -- Write Port
  signal wa : unsigned(A_BITS-1 downto 0);
  signal we : std_logic;

  -- Read Port
  signal ra : unsigned(A_BITS-1 downto 0);
  signal re : std_logic;

  -- Internal full and empty indicators
  signal fulli : std_logic;
  signal empti : std_logic;

begin

  -----------------------------------------------------------------------------
  -- Pointer Logic
  genCCN: if not FORCE_XILCY generate
    IP1 <= IP0 + 1;
    OP1 <= OP0 + 1;
  end generate;
  genCCY: if FORCE_XILCY generate
    component MUXCY
      port (
        O  : out std_ulogic;
        CI : in  std_ulogic;
        DI : in  std_ulogic;
        S  : in  std_ulogic
      );
    end component;
    component XORCY
      port (
        O  : out std_ulogic;
        CI : in  std_ulogic;
        LI : in  std_ulogic
      );
    end component;

    signal ci, co : std_logic_vector(A_BITS downto 0);
  begin
    ci(0) <= '1';
    genCCI : for i in 0 to A_BITS-1 generate
      MUXCY_inst : MUXCY
        port map (
          O  => ci(i+1),
          CI => ci(i),
          DI => '0',
          S  => IP0(i)
        );
      XORCY_inst : XORCY
        port map (
          O  => IP1(i),
          CI => ci(i),
          LI => IP0(i)
        );
    end generate genCCI;

    co(0) <= '1';
    genCCO: for i in 0 to A_BITS-1 generate
      MUXCY_inst : MUXCY
        port map (
          O  => co(i+1),
          CI => co(i),
          DI => '0',
          S  => OP0(i)
        );
      XORCY_inst : XORCY
        port map (
          O  => OP1(i),
          CI => co(i),
          LI => OP0(i)
        );
    end generate genCCO;
  end generate;

  process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        IP0 <= (others => '0');
        IPm <= (others => '0');
        OP0 <= (others => '0');
      else
        -- Update Input Pointer upon Write
        if rollback = '1' then
          IP0 <= IPm;
        elsif we = '1' then
          IP0 <= IP1;
        end if;

        -- Update Commit Marker
        if commit = '1' then
          if we = '1' then
            IPm <= IP1;
          else
            IPm <= IP0;
          end if;
        end if;

        -- Update Output Pointer upon Read
        if re = '1' then
          OP0 <= OP1;
        end if;

      end if;
    end if;
  end process;
  wa <= IP0;
  ra <= OP0;

  -- Fill State Computation (soft indicators)
  process(fulli, IP0, IPm, OP0)
    variable  d : std_logic_vector(A_BITS-1 downto 0);
  begin

    -- Available Space
    if ESTATE_WR_BITS > 0 then
      -- Compute Pointer Difference
      if fulli = '1' then
        d := (others => '1');              -- true number minus one when full
      else
        d := std_logic_vector(IP0 - OP0);  -- true number of valid entries
      end if;
      estate_wr <= not d(d'left downto d'left-ESTATE_WR_BITS+1);
    else
      estate_wr <= (others => 'X');
    end if;

    -- Available Content
    if FSTATE_RD_BITS > 0 then
      -- Compute Pointer Difference
      if fulli = '1' then
        d := (others => '1');              -- true number minus one when full
      else
        d := std_logic_vector(IPm - OP0);  -- true number of valid entries
      end if;
      fstate_rd <= d(d'left downto d'left-FSTATE_RD_BITS+1);
    else
      fstate_rd <= (others => 'X');
    end if;

  end process;

  -----------------------------------------------------------------------------
  -- Computation of full and empty indications.
  --
  -- The STATE_REG generic is ignored as two different comparators are
  -- needed to compare OP with IPm (empty) and IP with OP (full) anyways.
  -- So the register implementation is always used.
  blkState: block
    signal Ful : std_logic := '0';
    signal Pnd : std_logic := '0';
    signal Avl : std_logic := '0';
  begin
    process(clk)
    begin
      if rising_edge(clk) then
        if rst = '1' then
          Ful <= '0';
          Pnd <= '0';
          Avl <= '0';
        else

          -- Pending Indicator for uncommitted Data
          if commit = '1' or rollback = '1' then
            Pnd <= '0';
          elsif we = '1' then
            Pnd <= '1';
          end if;

          -- Update Full Indicator
          if re = '1' or (rollback = '1' and Pnd = '1') then
            Ful <= '0';
          elsif we = '1' and re = '0' and IP1 = OP0 then
            Ful <= '1';
          end if;

          -- Update Empty Indicator
          if commit = '1' and (we = '1' or Pnd = '1') then
            Avl <= '1';
          elsif re = '1' and OP1 = IPm then
            Avl <= '0';
          end if;

        end if;
      end if;
    end process;
    fulli <= Ful;
    empti <= not Avl;
  end block;

  -----------------------------------------------------------------------------
  -- Memory Access

  -- Write Interface => Input
  full <= fulli;
  we   <= put and not fulli;

  -- Backing Memory and Read Interface => Output
  genLarge: if not DATA_REG generate
    signal do : std_logic_vector(D_BITS-1 downto 0);
  begin

    -- Backing Memory
    ram : ocram_sdp
      generic map (
        A_BITS => A_BITS,
        D_BITS => D_BITS
      )
      port map (
        wclk   => clk,
        rclk   => clk,
        wce    => '1',

        wa     => wa,
        we     => we,
        d      => din,

        ra     => ra,
        rce    => re,
        q      => do
      );

    -- Read Interface => Output
    genOutputCmb : if not OUTPUT_REG generate
      signal Vld : std_logic := '0';      -- valid output of RAM module
    begin
      process(clk)
      begin
        if rising_edge(clk) then
          if rst = '1' then
            Vld <= '0';
          else
            Vld <= (Vld and not got) or not empti;
          end if;
        end if;
      end process;
      re    <= (not Vld or got) and not empti;
      dout  <= do;
      valid <= Vld;
    end generate genOutputCmb;

    genOutputReg: if OUTPUT_REG generate
      -- Extra Buffer Register for Output Data
      signal Buf : std_logic_vector(D_BITS-1 downto 0) := (others => '-');
      signal Vld : std_logic_vector(0 to 1)            := (others => '0');
      -- Vld(0)   -- valid output of RAM module
      -- Vld(1)   -- valid word in Buf
    begin
      process(clk)
      begin
        if rising_edge(clk) then
          if rst = '1' then
            Buf <= (others => '-');
            Vld <= (others => '0');
          else
            Vld(0) <= (Vld(0) and Vld(1) and not got) or not empti;
            Vld(1) <= (Vld(1) and not got) or Vld(0);
            if Vld(1) = '0' or got = '1' then
              Buf <= do;
            end if;
          end if;
        end if;
      end process;
      re    <= (not Vld(0) or not Vld(1) or got) and not empti;
      dout  <= Buf;
      valid <= Vld(1);
    end generate genOutputReg;

  end generate genLarge;

  genSmall: if DATA_REG generate

    -- Memory modelled as Array
    type regfile_t is array(0 to 2**A_BITS-1) of std_logic_vector(D_BITS-1 downto 0);
    signal regfile : regfile_t;
    attribute ram_style            : string;  -- XST specific
    attribute ram_style of regfile : signal is "distributed";

    -- Altera Quartus II: Allow automatic RAM type selection.
    -- For small RAMs, registers are used on Cyclone devices and the M512 type
    -- is used on Stratix devices. Pass-through logic is automatically added
    -- if required. (Warning can be ignored.)

  begin

    -- Memory State
    process(clk)
    begin
      if rising_edge(clk) then
        --synthesis translate_off
        if SIMULATION AND (rst = '1') then
          regfile <= (others => (others => '-'));
        else
        --synthesis translate_on
          if we = '1' then
            regfile(to_integer(wa)) <= din;
          end if;
        --synthesis translate_off
        end if;
        --synthesis translate_on
      end if;
    end process;

    -- Memory Output
    re    <= got and not empti;
    dout  <= (others => 'X') when Is_X(std_logic_vector(ra)) else
             regfile(to_integer(ra));
    valid <= not empti;

  end generate genSmall;

end rtl;
