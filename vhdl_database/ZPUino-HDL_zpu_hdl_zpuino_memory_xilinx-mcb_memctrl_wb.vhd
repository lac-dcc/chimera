library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

library work;
use work.wishbonepkg.all;

entity memctrl_wb is
  generic (
    C3_MEMCLK_PERIOD          : integer := 5000; 
    C3_RST_ACT_LOW            : integer := 0; 
    C3_INPUT_CLK_TYPE         : string := "SINGLE_ENDED"; 
    C3_CALIB_SOFT_IP          : string := "FALSE";
    C3_SIMULATION             : string := "FALSE";
    C3_MEM_ADDR_ORDER         : string := "ROW_BANK_COLUMN"; 
    C3_NUM_DQ_PINS            : integer := 16; 
    C3_MEM_ADDR_WIDTH         : integer := 13; 
    C3_MEM_BANKADDR_WIDTH     : integer := 2;
    C3_CLKOUT0_DIVIDE       : integer := 2;
    C3_CLKOUT1_DIVIDE       : integer := 2;
    C3_CLKOUT2_DIVIDE       : integer := 8;
    C3_CLKOUT3_DIVIDE       : integer := 8;
    C3_CLKOUT4_DIVIDE       : integer := 8;
    C3_CLKOUT5_DIVIDE       : integer := 8;
    C3_CLKFBOUT_MULT        : integer := 16;
    C3_COMPENSATION         : string := "INTERNAL";
    C3_CLK_BUFFER_INPUT     : boolean := true
  );
  port (
    syscon:   in wb_syscon_type;
    wbi:      in wb_mosi_type;
    wbo:      out wb_p_miso_type;

    mcb3_dram_dq                            : inout  std_logic_vector(C3_NUM_DQ_PINS-1 downto 0);
    mcb3_dram_a                             : out std_logic_vector(C3_MEM_ADDR_WIDTH-1 downto 0);
    mcb3_dram_ba                            : out std_logic_vector(C3_MEM_BANKADDR_WIDTH-1 downto 0);
    mcb3_dram_cke                           : out std_logic;
    mcb3_dram_ras_n                         : out std_logic;
    mcb3_dram_cas_n                         : out std_logic;
    mcb3_dram_we_n                          : out std_logic;
    mcb3_dram_dm                            : out std_logic;
    mcb3_dram_udqs                          : inout  std_logic;
    mcb3_rzq                                : inout  std_logic;
    mcb3_dram_udm                           : out std_logic;
    mcb3_dram_dqs                           : inout  std_logic;
    mcb3_dram_ck                            : out std_logic;
    mcb3_dram_ck_n                          : out std_logic;

    clkin:  in std_logic;
    rstin:  in std_logic;
    clkout: out std_logic;
    clk4:   out std_logic;
    clk5:   out std_logic;
    rstout: out std_logic
  );
end entity memctrl_wb;

architecture rtl of memctrl_wb is

  constant INSTR_NOP:     std_logic_vector(2 downto 0) := "000";
  constant INSTR_READ:    std_logic_vector(2 downto 0) := "001";
  constant INSTR_WRITE:   std_logic_vector(2 downto 0) := "010";
  constant INSTR_NONE:    std_logic_vector(2 downto 0) := "XXX";

  signal cmd_en:    std_logic;
  signal cmd_full:  std_logic;
  signal cmd_instr: std_logic_vector(2 downto 0);
  signal cmd_bl:    std_logic_vector(5 downto 0);
  signal cmd_addr:  std_logic_vector(31 downto 0);

  signal wr_en:     std_logic;
  signal wr_full:   std_logic;
  signal wr_mask:   std_logic_vector(3 downto 0);
  signal wr_data:   std_logic_vector(31 downto 0);

  signal rd_en: std_logic;
  signal rd_empty: std_logic;
  signal rd_data: std_logic_vector(31 downto 0);

  signal fifo_data_in:  std_logic_vector(31 downto 0);
  signal fifo_data_out: std_logic_vector(31 downto 0);
  signal fifo_rd:       std_logic;
  signal fifo_wr:       std_logic;

  type state_type is (
    IDLE,
    WRITE,
    ACKWRITE,
    WRITEPIPE,
    READ,
    READPIPE
  );

  constant READBURSTSIZE: std_logic_vector(5 downto 0) := "001111";


  type regs_type is record
    state:  state_type;
    bl:     std_logic_vector(5 downto 0);
    wcount: unsigned(5 downto 0);
    addr:   std_logic_vector(31 downto 0);
  end record;

  signal r: regs_type;
  signal rstout_i, pll_lock: std_ulogic;

begin

  rstout <= rstout_i or not pll_lock;

  ctrl: entity work.memctrl
  generic map (
    C3_MEMCLK_PERIOD        => C3_MEMCLK_PERIOD,
    C3_RST_ACT_LOW          => C3_RST_ACT_LOW,
    C3_INPUT_CLK_TYPE       => C3_INPUT_CLK_TYPE,
    C3_CALIB_SOFT_IP        => C3_CALIB_SOFT_IP,
    C3_SIMULATION           => C3_SIMULATION,
    C3_MEM_ADDR_ORDER       => C3_MEM_ADDR_ORDER,
    C3_NUM_DQ_PINS          => C3_NUM_DQ_PINS,
    C3_MEM_ADDR_WIDTH       => C3_MEM_ADDR_WIDTH,
    C3_MEM_BANKADDR_WIDTH   => C3_MEM_BANKADDR_WIDTH,
    C3_CLKOUT0_DIVIDE       => C3_CLKOUT0_DIVIDE,
    C3_CLKOUT1_DIVIDE       => C3_CLKOUT1_DIVIDE,
    C3_CLKOUT2_DIVIDE       => C3_CLKOUT2_DIVIDE,
    C3_CLKOUT3_DIVIDE       => C3_CLKOUT3_DIVIDE,
    C3_CLKOUT4_DIVIDE       => C3_CLKOUT4_DIVIDE,
    C3_CLKOUT5_DIVIDE       => C3_CLKOUT5_DIVIDE,
    C3_CLKFBOUT_MULT        => C3_CLKFBOUT_MULT,
    C3_COMPENSATION         => C3_COMPENSATION,
    C3_CLK_BUFFER_INPUT     => C3_CLK_BUFFER_INPUT
  )
  port map (
      c3_sys_clk      => clkin,
      c3_sys_rst_i    => '0',--rstin,
      async_rst       => rstin,
      c3_clk0         => clkout,
      c3_clk4         => clk4,
      c3_clk5         => clk5,
      c3_rst0         => rstout_i,
      c3_pll_lock_out => pll_lock,

      c3_p0_rd_clk    => syscon.clk,
      c3_p0_wr_clk    => syscon.clk,
      c3_p0_cmd_clk   => syscon.clk,

      c3_p0_cmd_en    => cmd_en,
      c3_p0_cmd_instr => cmd_instr,
      c3_p0_cmd_bl    => cmd_bl,
      c3_p0_cmd_byte_addr => cmd_addr(29 downto 0),
      c3_p0_cmd_full  => cmd_full,

      c3_p0_wr_en     => wr_en,
      c3_p0_wr_mask   => wr_mask,
      c3_p0_wr_data   => wr_data,
      c3_p0_wr_full   => wr_full,

      c3_p0_rd_en     => rd_en,
      c3_p0_rd_data   => rd_data,
      c3_p0_rd_empty  => rd_empty,

      mcb3_dram_dq    =>      mcb3_dram_dq,
      mcb3_dram_a     =>      mcb3_dram_a,
      mcb3_dram_ba    =>      mcb3_dram_ba,
      mcb3_dram_cke   =>      mcb3_dram_cke,
      mcb3_dram_ras_n =>      mcb3_dram_ras_n,
      mcb3_dram_cas_n =>      mcb3_dram_cas_n,
      mcb3_dram_we_n  =>      mcb3_dram_we_n,
      mcb3_dram_dm    =>      mcb3_dram_dm,
      mcb3_dram_udqs  =>      mcb3_dram_udqs,
      mcb3_rzq        =>      mcb3_rzq,
      mcb3_dram_udm   =>      mcb3_dram_udm,
      mcb3_dram_dqs   =>      mcb3_dram_dqs,
      mcb3_dram_ck    =>      mcb3_dram_ck,
      mcb3_dram_ck_n  =>      mcb3_dram_ck_n

   );

  wr_data <= wbi.dat;
  wbo.dat <=  rd_data;
  wr_mask <= not wbi.sel;
  wbo.err <= '0';
  wbo.rty <= '0';

  process(syscon,
    wbi.cyc, wbi.adr, wbi.stb, wbi.adr, wbi.cti,
    wr_full, rd_empty, r
  )
    variable canprocess: boolean;
    variable w: regs_type;
  begin
    w := r;

    wr_en     <= '0';
    rd_en     <= '0';
    cmd_en    <= '0';
    cmd_addr  <= (others => 'X');
    cmd_bl    <= (others => 'X');
    cmd_instr <= INSTR_NONE;
    fifo_wr    <= '0';
    fifo_rd    <= '0';
    wbo.stall  <= '0';
    wbo.ack    <= '0';

    case r.state is
      when IDLE =>
        if cmd_full='1' then
          wbo.stall<='1';
        end if;

        if wbi.cyc='1' and wbi.stb='1' then
          if wbi.we='1' then
              --w.tag := wbi.tag;
              w.addr := (others => '0');
              w.addr(wbi.adr'HIGH downto 2) := wbi.adr(wbi.adr'HIGH downto 2);
              if cmd_full='0' then
                wr_en <= '1';
                w.wcount := r.wcount + 1;
                w.state := WRITE;
                --fifo_wr <= '1';
              end if;
            --end if;
          else
            -- Read process
              cmd_en <= '1';
              cmd_instr <= INSTR_READ;
              cmd_addr <= (others => '0');
              cmd_addr(wbi.adr'HIGH downto 2) <= wbi.adr(wbi.adr'HIGH downto 2);
              if cmd_full='0' then
                fifo_wr<='1';
              end if;

              --w.tag := wbi.tag;
              w.addr := (others => '0');
              w.addr(wbi.adr'HIGH downto 2) := wbi.adr(wbi.adr'HIGH downto 2);

              case wbi.cti is
                when CTI_CYCLE_INCRADDR =>
                  if cmd_full='0' then
                    w.state := READPIPE;
                  end if;
                  cmd_bl <= READBURSTSIZE;
                  w.bl := READBURSTSIZE;
                when others =>
                  if cmd_full='0' then
                    w.state := READ;
                  end if;
                  cmd_bl <= "000000";
                  w.bl := (others => 'X');
              end case;

            --end if;
          end if;
        end if;

      when READ =>
        -- Let requests come in ?!?!.
        wbo.stall<='1';
        wbo.ack <= not rd_empty;
        rd_en<='1';

        if rd_empty='0' then
          -- Only one request...
          fifo_rd <='1';
          w.state := IDLE;
        end if;

      when READPIPE =>
        -- Let requests come in ?!?!.
        wbo.stall<='0';
        wbo.ack <= not rd_empty;
        fifo_wr <= wbi.cyc and wbi.stb;
        rd_en<='1';
        if rd_empty='0' then
          fifo_rd<='1';
          w.bl := std_logic_vector(unsigned(r.bl) - 1);
          --w.tag := wbi.tag;
          if r.bl="000000" then
            --wbo.ack<='0';
            w.state := IDLE;
          end if;
        end if;


      when WRITE =>
        wbo.stall<='1';

        cmd_en  <='1';
        cmd_bl  <= "000000";
        cmd_instr <= INSTR_WRITE;
        cmd_addr <= r.addr;

        if cmd_full='0' then
          --wbo.ack<='1';
          --fifo_rd <= '1';
          --w.ack := '1';
          w.state := ACKWRITE;
        end if;

        w.wcount := (others => '0');

      when ACKWRITE =>
        wbo.ack <= '1';
        wbo.stall<= '1';
        w.state := IDLE;

      when WRITEPIPE =>

        wbo.stall <= '0'; -- FIFO can never be empty...

        -- This should use CTI end of burst
        wr_en <= wbi.stb;

        if wbi.cti = CTI_CYCLE_ENDOFBURST then
          -- Finished. Set up write command.
          cmd_en<='1';
          cmd_bl<=r.bl;
          cmd_instr<=INSTR_WRITE;
          w.state := IDLE;

        end if;
      

    end case;

    if syscon.rst='1' then
      w.wcount := (others => '0');
      w.state := IDLE;
      --w.ack := '0';
    end if;

    if rising_edge(syscon.clk) then
      r<=w;
    end if;

  end process;

  tagfifo: entity work.fifo_fwft
  generic map (
    bits  => 5,
    datawidth => 32
  )
  port map (
    clk       => syscon.clk,
    rst       => syscon.rst,
    wr        => fifo_wr,
    rd        => fifo_rd,
    write     => wbi.tag,
    read      => wbo.tag,
    full      => open,
    empty     => open
  );


end rtl;