library IEEE;
use IEEE.std_logic_1164.all;

library PoC;
use PoC.physical.all;

entity dnk7_queens1 is
  generic (
    -- Design Parameters
    N : positive := 27;
    L : positive :=  2;

    SOLVERS      : positive := 240;
    COUNT_CYCLES : boolean  := false;

    -- Local Clock Parameters
    CLK_FREQ : FREQ     := 50 MHz;
    CLK_DIV  : positive :=  1;  -- CLK_FREQ / CLK_DIV * CLK_MUL:
    CLK_MUL  : positive := 22;  --   as fast as possible but not above 1200 MHz

    -- Output Clocks
    CLK_DIV_COMP : positive :=  5;      -- fast computation clock
    CLK_DIV_SLOW : positive := 15       -- slower communication clock
  );
  port (
    ---------------------------------------------------------------------------
    -- 50-MHz Input Clock
    CLK_MBCLK : in std_logic;

    ---------------------------------------------------------------------------
    -- Ring Bus

    -- Input
    BUS_IN_CLKP  : in  std_logic;
    BUS_IN_CLKN  : in  std_logic;

    BUS_IN_PRE_DAT   : in  std_logic_vector(8 downto 0);
    BUS_IN_PRE_PUT   : in  std_logic;
    BUS_IN_PRE_STALL : out std_logic;

    BUS_IN_SOL_DAT   : in  std_logic_vector(8 downto 0);
    BUS_IN_SOL_PUT   : in  std_logic;
    BUS_IN_SOL_STALL : out std_logic;

    -- Output
    BUS_OUT_CLKP  : out std_logic;
    BUS_OUT_CLKN  : out std_logic;

    BUS_OUT_PRE_DAT   : out std_logic_vector(8 downto 0);
    BUS_OUT_PRE_PUT   : out std_logic;
    BUS_OUT_PRE_STALL : in  std_logic;

    BUS_OUT_SOL_DAT   : out std_logic_vector(8 downto 0);
    BUS_OUT_SOL_PUT   : out std_logic;
    BUS_OUT_SOL_STALL : in  std_logic
  );
end entity dnk7_queens1;


library IEEE;
use IEEE.numeric_std.all;

library PoC;
use PoC.utils.all;
use PoC.fifo.all;

library UNISIM;
use UNISIM.vcomponents.all;

architecture rtl of dnk7_queens1 is

  -- Bit Length of Pre-Placement
  constant PRE_BITS  : positive := 4*L*log2ceil(N)-1;
  constant PRE_BYTES : positive := (PRE_BITS+7)/8;

  -- FIFO Dimensioning
  constant FIFO_DEPTH : positive := 5*(SOLVERS+5);

  ----------------------------------------------------------------------------
  -- Global Control: Clocks and Resets
  signal clk_comp : std_logic; -- FRESHLY generated:
  signal rst_comp : std_logic; --   Fast Computation Clock

  signal clk_out : std_logic;  -- FRESHLY generated:
  signal rst_out : std_logic;  --   Slow Communication Clock (Output Side)

  -----------------------------------------------------------------------------
  -- Solver Chain Connectivity
  signal piful : std_logic;
  signal pidat : byte;
  signal pieof : std_logic;
  signal piput : std_logic;

  signal sivld : std_logic;
  signal sidat : byte;
  signal sieof : std_logic;
  signal sigot : std_logic;

  signal poful : std_logic;
  signal podat : byte;
  signal poeof : std_logic;
  signal poput : std_logic;

  signal sovld : std_logic;
  signal sodat : byte;
  signal soeof : std_logic;
  signal sogot : std_logic;

begin

  ----------------------------------------------------------------------------
  -- Clock Generation
  blkClock: block

    -- Intermediate Clock Signals
    signal clk50     : std_logic;
    signal clkfb     : std_logic;
    signal clk_compu : std_logic;
    signal clk_outu  : std_logic;

  begin

    ---------------------------------------------------------------------------
    -- Freshly Generated
    clk_i : BUFG
      port map (
        I => CLK_MBCLK,
        O => clk50
      );

    pll : PLLE2_BASE
      generic map (
        CLKIN1_PERIOD  => to_real(to_time(CLK_FREQ), 1 ns),
        DIVCLK_DIVIDE  => CLK_DIV,
        CLKFBOUT_MULT  => CLK_MUL,
        CLKOUT0_DIVIDE => CLK_DIV_COMP,
        CLKOUT1_DIVIDE => CLK_DIV_SLOW,
        STARTUP_WAIT   => "true"
      )
      port map (
        RST      => '0',
        CLKIN1   => clk50,
        CLKFBOUT => clkfb,
        CLKFBIN  => clkfb,
        CLKOUT0  => clk_compu,
        CLKOUT1  => clk_outu,
        CLKOUT2  => open,
        CLKOUT3  => open,
        CLKOUT4  => open,
        CLKOUT5  => open,
        LOCKED   => open,
        PWRDWN   => '0'
      );

    clk_compo : BUFG
      port map (
        I => clk_compu,
        O => clk_comp
      );
    rst_comp <= '0';

    clk_outo : BUFG
       port map (
        I => clk_outu,
        O => clk_out
      );
    rst_out <= '0';

  end block blkClock;

  ---------------------------------------------------------------------------
  -- Solver Chain
  blChain: block is
    signal pful : std_logic;
    signal pdat : byte;
    signal peof : std_logic;
    signal pput : std_logic;
  begin
    chain: entity work.queens_chain
      generic map (
        N            => N,
        L            => L,
        SOLVERS      => SOLVERS,
        COUNT_CYCLES => COUNT_CYCLES
      )
      port map (
        clk   => clk_comp,
        rst   => rst_comp,

        piful => piful,
        pidat => pidat,
        pieof => pieof,
        piput => piput,

        sivld => '0',
        sidat => (others => '-'),
        sieof => '-',
        sigot => open,

        poful => pful,
        podat => pdat,
        poeof => peof,
        poput => pput,

        sovld => sovld,
        sodat => sodat,
        soeof => soeof,
        sogot => sogot
      );

    -- Resync stream so that frames are taken out in one piece
    sync: entity work.msg_tap
      generic map (
        D => PRE_BYTES
      )
      port map (
        clk  => clk_comp,
        rst  => rst_comp,
        iful => pful,
        idat => pdat,
        ieof => peof,
        iput => pput,
        oful => poful,
        odat => podat,
        oeof => poeof,
        oput => poput,
        tful => '1',
        tdat => open,
        tput => open
      );
  end block blChain;

  -----------------------------------------------------------------------------
  -- Input Stream -> feeds pi(ful|dat|eof|put) and si(vld|dat|eof|got)
  blkInput: block

    -- Source synchronous clock domain
    signal clk_in : std_logic;
    signal rst_in : std_logic;

    -- Incoming Bus Data Capture Registers
    signal InPreDat : std_logic_vector(8 downto 0) := (others => '-');
    signal InPrePut : std_logic                    := '0';
    signal InPreCap : std_logic_vector(1 downto 0);

    signal InSolDat : std_logic_vector(8 downto 0) := (others => '-');
    signal InSolPut : std_logic                    := '0';
    signal InSolCap : std_logic_vector(1 downto 0);

    signal pivld : std_logic;

  begin

    ---------------------------------------------------------------------------
    -- Reading the Bus

    -- Clock reconstruction
    blkClock: block
      signal clk_in0 : std_logic;
    begin
      IBUFGDS_inst : IBUFGDS
        port map (
          O  => clk_in0,
          I  => BUS_IN_CLKP,
          IB => BUS_IN_CLKN
        );
      BUFG_inst : BUFG
        port map (
          O => clk_in,
          I => clk_in0
        );
      rst_in <= '0';
    end block blkClock;

    -- Bus Input Capture
    process(clk_in)
    begin
      if rising_edge(clk_in) then
        if rst_in = '1' then
          InPreDat <= (others => '-');
          InPrePut <= '0';
          InSolDat <= (others => '-');
          InSolPut <= '0';
        else
          InPreDat <= BUS_IN_PRE_DAT;
          InPrePut <= BUS_IN_PRE_PUT;
          InSolDat <= BUS_IN_SOL_DAT;
          InSolPut <= BUS_IN_SOL_PUT;
        end if;
      end if;
    end process;

    -- Input FIFO (ic): Pre-Placements
    buf_pre : fifo_ic_got
      generic map (
        D_BITS         => 9,
        MIN_DEPTH      => 64,
        ESTATE_WR_BITS => InPreCap'length
      )
      port map (
        clk_wr    => clk_in,
        rst_wr    => rst_in,
        put       => InPrePut,
        din       => InPreDat,
        full      => open,
        estate_wr => InPreCap,

        clk_rd           => clk_comp,
        rst_rd           => rst_comp,
        got              => piput,
        dout(8)          => pieof,
        dout(7 downto 0) => pidat,
        valid            => pivld
      );
    piput <= pivld and not piful;
    BUS_IN_PRE_STALL <= '1' when InPreCap = (InPreCap'range => '0') else '0';

    -- Input FIFO (ic): Solutions
    buf_sol : fifo_ic_got
      generic map (
        D_BITS         => 9,
        MIN_DEPTH      => 64,
        ESTATE_WR_BITS => InSolCap'length
      )
      port map (
        clk_wr    => clk_in,
        rst_wr    => rst_in,
        put       => InSolPut,
        din       => InSolDat,
        full      => open,
        estate_wr => InSolCap,

        clk_rd           => clk_out,
        rst_rd           => rst_out,
        got              => sigot,
        dout(8)          => sieof,
        dout(7 downto 0) => sidat,
        valid            => sivld
      );
    BUS_IN_SOL_STALL <= '1' when InSolCap = (InSolCap'range => '0') else '0';

  end block blkInput;

  blkOutput : block
  begin
    -------------------------------------------------------------------------
    -- Output Inverted Clock
    blkClock : block
      signal clk_inv : std_logic;
    begin
      invert : ODDR
        generic map(
          DDR_CLK_EDGE => "OPPOSITE_EDGE",
          INIT         => '1',
          SRTYPE       => "SYNC"
        )
        port map (
          Q  => clk_inv,                -- 1-bit DDR output
          C  => clk_out,                -- 1-bit clock input
          CE => '1',                    -- 1-bit clock enable input
          D1 => '0',                    -- 1-bit data input (positive edge)
          D2 => '1',                    -- 1-bit data input (negative edge)
          R  => rst_out,                -- 1-bit reset input
          S  => '0'                     -- 1-bit set input
        );

      OBUFDS_inst : OBUFDS
        generic map (
          IOSTANDARD => "DEFAULT",
          SLEW       => "FAST"
        )
        port map (
          O  => BUS_OUT_CLKP,
          OB => BUS_OUT_CLKN,
          I  => clk_inv
        );
    end block blkClock;

    blkPre: block

      -- Syncing the stall input
      signal stall_s : std_logic_vector(1 downto 0) := (others => '1');

      -- Output FIFO
      signal pgot : std_logic;
      signal pdat : std_logic_vector(8 downto 0);
      signal pvld : std_logic;

      -- Outgoing Output Registers
      signal PreOutDat : std_logic_vector(8 downto 0) := (others => '0');
      signal PreOutPut : std_logic := '0';

    begin

      -- Syncing stall input
      process(clk_out)
      begin
        if rising_edge(clk_out) then
          if rst_out = '1' then
            stall_s <= (others => '1');
          else
            stall_s <= BUS_OUT_PRE_STALL & stall_s(stall_s'left downto 1);
          end if;
        end if;
      end process;

      -- Output FIFO (ic): Pre-Placements
      fifob : fifo_ic_got
        generic map (
          D_BITS    => 9,
          MIN_DEPTH => 64
        )
        port map (
          clk_wr          => clk_comp,
          rst_wr          => rst_comp,
          put             => poput,
          din(8)          => poeof,
          din(7 downto 0) => podat,
          full            => poful,

          clk_rd => clk_out,
          rst_rd => rst_out,
          got    => pgot,
          dout   => pdat,
          valid  => pvld
        );
      pgot  <= pvld and not stall_s(0);

      -- Output Registers
      process(clk_out)
      begin
        if rising_edge(clk_out) then
          if rst_out = '1' then
            PreOutDat <= (others => '0');
            PreOutPut <= '0';
          else
            PreOutDat <= pdat;
            PreOutPut <= pgot;
          end if;
        end if;
      end process;
      BUS_OUT_PRE_DAT <= PreOutDat;
      BUS_OUT_PRE_PUT <= PreOutPut;

    end block blkPre;

    blkSol: block

      -- Syncing the stall input
      signal stall_s : std_logic_vector(1 downto 0) := (others => '1');

      -- Chain -> fifo_ic [clk_comp->clk_out]
      signal soful : std_logic;

      -- fifo_ic -> funnel
      signal scvld : std_logic;
      signal scdat : std_logic_vector(8 downto 0);
      signal scgot : std_logic;

      -- funnel -> fifo_glue
      signal sjful : std_logic;
      signal sjdat : std_logic_vector(8 downto 0);
      signal sjput : std_logic;

      -- fifo_glue -> output
      signal sfvld : std_logic;
      signal sfdat : std_logic_vector(8 downto 0);
      signal sfgot : std_logic;

      -- Outgoing Output Registers
      signal SolOutDat : std_logic_vector(8 downto 0) := (others => '0');
      signal SolOutPut : std_logic := '0';

    begin

      -- Syncing stall input
      process(clk_out)
      begin
        if rising_edge(clk_out) then
          if rst_out = '1' then
            stall_s <= (others => '1');
          else
            stall_s <= BUS_OUT_SOL_STALL & stall_s(stall_s'left downto 1);
          end if;
        end if;
      end process;

      -- fifo_ic: clk_comp -> clk_out
      fifob : fifo_ic_got
        generic map (
          D_BITS    => 9,
          MIN_DEPTH => 64
        )
        port map (
          clk_wr          => clk_comp,
          rst_wr          => rst_comp,
          put             => sogot,
          din(8)          => soeof,
          din(7 downto 0) => sodat,
          full            => soful,

          clk_rd => clk_out,
          rst_rd => rst_out,
          got    => scgot,
          dout   => scdat,
          valid  => scvld
        );
      sogot <= sovld and not soful;

      -- funnel: si* + sc* -> sj*
      join: entity work.msg_funnel
        generic map (
          N => 2
        )
        port map (
          clk  => clk_out,
          rst  => rst_out,

          ivld(0) => scvld,
          ivld(1) => sivld,
          idat(0) => scdat(7 downto 0),
          idat(1) => sidat,
          ieof(0) => scdat(8),
          ieof(1) => sieof,
          igot(0) => scgot,
          igot(1) => sigot,

          oful => sjful,
          odat => sjdat(7 downto 0),
          oeof => sjdat(8),
          oput => sjput
        );

      -- fifo_glue
      glue: fifo_glue
        generic map (
          D_BITS => 9
        )
        port map (
          clk => clk_out,
          rst => rst_out,

          put => sjput,
          di  => sjdat,
          ful => sjful,

          vld => sfvld,
          do  => sfdat,
          got => sfgot
        );
      sfgot  <= sfvld and not stall_s(0);

      -- Output Registers
      process(clk_out)
      begin
        if rising_edge(clk_out) then
          if rst_out = '1' then
            SolOutDat <= (others => '0');
            SolOutPut <= '0';
          else
            SolOutDat <= sfdat;
            SolOutPut <= sfgot;
          end if;
        end if;
      end process;
      BUS_OUT_SOL_DAT <= SolOutDat;
      BUS_OUT_SOL_PUT <= SolOutPut;

    end block blkSol;

  end block blkOutput;

end rtl;
