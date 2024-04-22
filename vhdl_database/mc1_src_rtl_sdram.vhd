--   __   __     __  __     __         __
--  /\ "-.\ \   /\ \/\ \   /\ \       /\ \
--  \ \ \-.  \  \ \ \_\ \  \ \ \____  \ \ \____
--   \ \_\\"\_\  \ \_____\  \ \_____\  \ \_____\
--    \/_/ \/_/   \/_____/   \/_____/   \/_____/
--   ______     ______       __     ______     ______     ______
--  /\  __ \   /\  == \     /\ \   /\  ___\   /\  ___\   /\__  _\
--  \ \ \/\ \  \ \  __<    _\_\ \  \ \  __\   \ \ \____  \/_/\ \/
--   \ \_____\  \ \_____\ /\_____\  \ \_____\  \ \_____\    \ \_\
--    \/_____/   \/_____/ \/_____/   \/_____/   \/_____/     \/_/
--
-- https://joshbassett.info
-- https://twitter.com/nullobject
-- https://github.com/nullobject
--
-- Copyright (c) 2020 Josh Bassett
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

-- This SDRAM controller provides a symmetric 32-bit synchronous read/write
-- interface for a 16Mx16-bit SDRAM chip (e.g. AS4C16M16SA-6TCN, IS42S16400F,
-- etc.).
entity sdram is
  generic (
    -- clock frequency (in Hz)
    --
    -- This value must be provided, as it is used to calculate the number of
    -- clock cycles required for the other timing values.
    G_CLK_FREQ_HZ : integer;

    -- 32-bit controller interface
    G_ADDR_WIDTH : integer := 23;
    G_DATA_WIDTH : integer := 32;

    -- SDRAM interface
    G_SDRAM_DQ_WIDTH : integer := 16;
    G_SDRAM_A_WIDTH : integer := 13;
    G_SDRAM_BA_WIDTH : integer := 2;
    G_SDRAM_COL_WIDTH  : integer := 9;
    G_SDRAM_ROW_WIDTH  : integer := 13;

    -- timing values (in nanoseconds)
    --
    -- These values can be adjusted to match the exact timing of your SDRAM
    -- chip (refer to the datasheet).
    G_T_DESL : real :=     200000.0;  -- startup delay
    G_T_MRD  : real :=         12.0;  -- mode register cycle time
    G_T_RC   : real :=         60.0;  -- row cycle time
    G_T_RCD  : real :=         18.0;  -- RAS to CAS delay
    G_T_RP   : real :=         18.0;  -- precharge to activate delay
    G_T_DPL  : real :=         12.0;  -- write recovery time
    G_T_REF  : real := 64_000_000.0;  -- refresh cycle time

    -- The delay in clock cycles, between the start of a read command and the
    -- availability of the output data.
    G_CAS_LATENCY : integer := 2  -- 2=below 133MHz, 3=above 133MHz
  );
  port (
    -- reset
    i_rst : in std_logic := '0';

    -- clock
    i_clk : in std_logic;

    -- address bus
    i_adr : in std_logic_vector(G_ADDR_WIDTH-1 downto 0);

    -- input data bus
    i_dat_w : in std_logic_vector(G_DATA_WIDTH-1 downto 0);

    -- When the write enable signal is asserted, a write operation will be performed.
    i_we : in std_logic;

    -- Byte select for write operations ('1' = enable byte)
    i_sel : in std_logic_vector(G_DATA_WIDTH/8-1 downto 0);

    -- When the request signal is asserted, an operation will be performed.
    i_req : in std_logic;

    -- The o_busy signal is deasserted when the controller is ready to accept a
    -- new request.
    o_busy : out std_logic;

    -- The acknowledge signal is asserted by the SDRAM controller when
    -- a request has been completed.
    o_ack : out std_logic;

    -- output data bus
    o_dat : out std_logic_vector(G_DATA_WIDTH-1 downto 0);

    -- SDRAM interface (e.g. AS4C16M16SA-6TCN, IS42S16400F, etc.)
    o_sdram_a     : out std_logic_vector(G_SDRAM_A_WIDTH-1 downto 0);
    o_sdram_ba    : out std_logic_vector(G_SDRAM_BA_WIDTH-1 downto 0);
    io_sdram_dq   : inout std_logic_vector(G_SDRAM_DQ_WIDTH-1 downto 0);
    o_sdram_cke   : out std_logic;
    o_sdram_cs_n  : out std_logic;
    o_sdram_ras_n : out std_logic;
    o_sdram_cas_n : out std_logic;
    o_sdram_we_n  : out std_logic;
    o_sdram_dqm   : out std_logic_vector(G_SDRAM_DQ_WIDTH/8-1 downto 0)
  );

  -- Use fast I/O flip-flops for the SDRAM output signals.
  attribute useioff : boolean;
  attribute useioff of o_sdram_a : signal is true;
  attribute useioff of o_sdram_ba : signal is true;
  attribute useioff of o_sdram_cke : signal is true;
  attribute useioff of o_sdram_cs_n : signal is true;
  attribute useioff of o_sdram_ras_n : signal is true;
  attribute useioff of o_sdram_cas_n : signal is true;
  attribute useioff of o_sdram_we_n : signal is true;
  attribute useioff of o_sdram_dqm : signal is true;
end sdram;

architecture arch of sdram is
  function ilog2(n : natural) return natural is
  begin
    return natural(ceil(log2(real(n))));
  end ilog2;

  -- Convert a ROW address to a signal suitable for o_sdram_a.
  function row2addr(x : unsigned) return std_logic_vector is
  begin
    return std_logic_vector(resize(x, G_SDRAM_A_WIDTH));
  end row2addr;

  -- Convert a COL address to a signal suitable for o_sdram_a.
  function col2addr(x : unsigned) return std_logic_vector is
    variable a : std_logic_vector(G_SDRAM_A_WIDTH-2 downto 0);
  begin
    a := std_logic_vector(resize(x, G_SDRAM_A_WIDTH-1));
    -- A10 = '1' -> auto precharge
    return a(G_SDRAM_A_WIDTH-2 downto 10) & "1" & a(9 downto 0);
  end col2addr;

  -- Adjust the incoming address to the SDRAM address space (e.g.
  -- from 32-bit word addressing to 16-bit word addressing).
  function adjust_addr(x : std_logic_vector) return unsigned is
    constant C_SHIFT : natural := ilog2(G_DATA_WIDTH / G_SDRAM_DQ_WIDTH);
  begin
    return unsigned(x) & to_unsigned(0, C_SHIFT);
  end adjust_addr;

  subtype command_t is std_logic_vector(3 downto 0);

  -- commands
  constant CMD_DESELECT     : command_t := "1---";
  constant CMD_LOAD_MODE    : command_t := "0000";
  constant CMD_AUTO_REFRESH : command_t := "0001";
  constant CMD_PRECHARGE    : command_t := "0010";
  constant CMD_ACTIVE       : command_t := "0011";
  constant CMD_WRITE        : command_t := "0100";
  constant CMD_READ         : command_t := "0101";
  constant CMD_STOP         : command_t := "0110";
  constant CMD_NOP          : command_t := "0111";

  -- The number of 16-bit words to be bursted during a read/write.
  constant BURST_LENGTH : natural := G_DATA_WIDTH / G_SDRAM_DQ_WIDTH;

  -- the ordering of the accesses within a burst
  constant BURST_TYPE : std_logic := '0'; -- 0=sequential, 1=interleaved

  -- the write burst mode enables bursting for write operations
  constant WRITE_BURST_MODE : std_logic := '0'; -- 0=burst, 1=single

  -- the value written to the address bus during initialization
  constant INIT_CMD : std_logic_vector(G_SDRAM_A_WIDTH-1 downto 0) := (
    std_logic_vector(to_unsigned(0, G_SDRAM_A_WIDTH-11)) &
    "10000000000"
  );

  -- the value written to the mode register to configure the memory
  constant MODE_REG : std_logic_vector(G_SDRAM_A_WIDTH-1 downto 0) := (
    std_logic_vector(to_unsigned(0, G_SDRAM_A_WIDTH-10)) &
    WRITE_BURST_MODE &
    "00" &
    std_logic_vector(to_unsigned(G_CAS_LATENCY, 3)) &
    BURST_TYPE &
    std_logic_vector(to_unsigned(ilog2(BURST_LENGTH), 3))
  );

  -- calculate the clock period (in nanoseconds)
  constant CLK_FREQ : real := real(G_CLK_FREQ_HZ) / 1_000_000.0;
  constant CLK_PERIOD : real := 1.0/CLK_FREQ*1000.0;

  -- the number of clock cycles to wait before initialising the device
  constant INIT_WAIT : natural := natural(ceil(G_T_DESL/CLK_PERIOD));

  -- the number of clock cycles to wait while a LOAD MODE command is being
  -- executed
  constant LOAD_MODE_WAIT : natural := natural(ceil(G_T_MRD/CLK_PERIOD));

  -- the number of clock cycles to wait while an ACTIVE command is being
  -- executed
  constant ACTIVE_WAIT : natural := natural(ceil(G_T_RCD/CLK_PERIOD));

  -- the number of clock cycles to wait while a REFRESH command is being
  -- executed
  constant REFRESH_WAIT : natural := natural(ceil(G_T_RC/CLK_PERIOD));

  -- the number of clock cycles to wait while a PRECHARGE command is being
  -- executed
  constant PRECHARGE_WAIT : natural := natural(ceil(G_T_RP/CLK_PERIOD));

  -- the number of clock cycles to wait while a READ command is being executed
  constant READ_WAIT : natural := G_CAS_LATENCY+BURST_LENGTH;

  -- the number of clock cycles to wait while a WRITE command is being executed
  constant WRITE_WAIT : natural := BURST_LENGTH+natural(ceil((G_T_DPL+G_T_RP)/CLK_PERIOD));

  -- the number of clock cycles before the memory controller needs to refresh
  -- the SDRAM
  constant T_REFI : real := G_T_REF / real(2 ** G_SDRAM_ROW_WIDTH);
  constant REFRESH_INTERVAL : natural := natural(floor(T_REFI/CLK_PERIOD))-10;

  type state_t is (INIT, MODE, IDLE, ACTIVE, READ, WRITE, REFRESH);

  -- state signals
  signal state, next_state : state_t;

  -- command signals
  signal cmd, next_cmd : command_t := CMD_NOP;

  -- control signals
  signal start          : std_logic;
  signal load_mode_done : std_logic;
  signal active_done    : std_logic;
  signal refresh_done   : std_logic;
  signal read_done      : std_logic;
  signal write_done     : std_logic;
  signal should_refresh : std_logic;

  -- signals for the ack logic
  signal ack : std_logic;
  signal valid : std_logic;
  signal waiting_for_read_response : std_logic;
  signal waiting_for_write_response : std_logic;

  -- counters
  constant MAX_WAIT_COUNT    : natural := INIT_WAIT+PRECHARGE_WAIT+REFRESH_WAIT+REFRESH_WAIT+1;
  constant MAX_REFRESH_COUNT : natural := REFRESH_INTERVAL;
  signal wait_counter    : natural range 0 to MAX_WAIT_COUNT;
  signal refresh_counter : natural range 0 to MAX_REFRESH_COUNT;

  -- registers
  signal addr_reg  : std_logic_vector(G_ADDR_WIDTH-1 downto 0);
  signal data_reg  : std_logic_vector(G_DATA_WIDTH-1 downto 0);
  signal we_reg    : std_logic;
  signal sel_n_reg : std_logic_vector(G_DATA_WIDTH/8-1 downto 0);
  signal q_reg     : std_logic_vector(G_DATA_WIDTH-1 downto 0);

  -- DQ in/out signals
  signal dq_in : std_logic_vector(G_SDRAM_DQ_WIDTH-1 downto 0);
  signal dq_out : std_logic_vector(G_SDRAM_DQ_WIDTH-1 downto 0);
  signal dq_out_en : std_logic;

  -- aliases to decode the address
  signal addr_current : unsigned(G_SDRAM_COL_WIDTH+G_SDRAM_ROW_WIDTH+G_SDRAM_BA_WIDTH-1 downto 0);
  alias col  : unsigned(G_SDRAM_COL_WIDTH-1 downto 0) is addr_current(G_SDRAM_COL_WIDTH-1 downto 0);
  alias row  : unsigned(G_SDRAM_ROW_WIDTH-1 downto 0) is addr_current(G_SDRAM_COL_WIDTH+G_SDRAM_ROW_WIDTH-1 downto G_SDRAM_COL_WIDTH);
  alias bank : unsigned(G_SDRAM_BA_WIDTH-1 downto 0) is addr_current(G_SDRAM_COL_WIDTH+G_SDRAM_ROW_WIDTH+G_SDRAM_BA_WIDTH-1 downto G_SDRAM_COL_WIDTH+G_SDRAM_ROW_WIDTH);

  -- Use fast I/O flip-flops for the SDRAM data in/out signals.
  attribute useioff of dq_in : signal is true;
  attribute useioff of dq_out : signal is true;
begin
  -- state machine
  fsm : process (state, wait_counter, i_req, we_reg, sel_n_reg, load_mode_done, active_done, refresh_done, read_done, write_done, should_refresh)
  begin
    next_state <= state;

    -- default to a NOP command
    next_cmd <= CMD_NOP;

    case state is
      -- execute the initialisation sequence
      when INIT =>
        if wait_counter = 0 then
          next_cmd <= CMD_DESELECT;
        elsif wait_counter = INIT_WAIT-1 then
          next_cmd <= CMD_PRECHARGE;
        elsif wait_counter = INIT_WAIT+PRECHARGE_WAIT-1 then
          next_cmd <= CMD_AUTO_REFRESH;
        elsif wait_counter = INIT_WAIT+PRECHARGE_WAIT+REFRESH_WAIT-1 then
          next_cmd <= CMD_AUTO_REFRESH;
        elsif wait_counter = INIT_WAIT+PRECHARGE_WAIT+REFRESH_WAIT+REFRESH_WAIT-1 then
          next_state <= MODE;
          next_cmd   <= CMD_LOAD_MODE;
        end if;

      -- load the mode register
      when MODE =>
        if load_mode_done = '1' then
          next_state <= IDLE;
        end if;

      -- wait for a read/write request
      when IDLE =>
        if should_refresh = '1' then
          next_state <= REFRESH;
          next_cmd   <= CMD_AUTO_REFRESH;
        elsif i_req = '1' then
          next_state <= ACTIVE;
          next_cmd   <= CMD_ACTIVE;
        end if;

      -- activate the row
      when ACTIVE =>
        if active_done = '1' then
          if we_reg = '1' then
            next_state <= WRITE;
            next_cmd   <= CMD_WRITE;
          else
            next_state <= READ;
            next_cmd   <= CMD_READ;
          end if;
        end if;

      -- execute a read command
      when READ =>
        if read_done = '1' then
          if should_refresh = '1' then
            next_state <= REFRESH;
            next_cmd   <= CMD_AUTO_REFRESH;
          elsif i_req = '1' then
            next_state <= ACTIVE;
            next_cmd   <= CMD_ACTIVE;
          else
            next_state <= IDLE;
          end if;
        end if;

      -- execute a write command
      when WRITE =>
        if write_done = '1' then
          if should_refresh = '1' then
            next_state <= REFRESH;
            next_cmd   <= CMD_AUTO_REFRESH;
          elsif i_req = '1' then
            next_state <= ACTIVE;
            next_cmd   <= CMD_ACTIVE;
          else
            next_state <= IDLE;
          end if;
        end if;

      -- execute an auto refresh
      when REFRESH =>
        if refresh_done = '1' then
          if i_req = '1' then
            next_state <= ACTIVE;
            next_cmd   <= CMD_ACTIVE;
          else
            next_state <= IDLE;
          end if;
        end if;
    end case;
  end process;

  -- latch the next state
  latch_next_state : process (i_clk, i_rst)
  begin
    if i_rst = '1' then
      state <= INIT;
      cmd   <= CMD_NOP;
    elsif rising_edge(i_clk) then
      state <= next_state;
      cmd   <= next_cmd;
    end if;
  end process;

  -- the wait counter is used to hold the current state for a number of clock
  -- cycles
  update_wait_counter : process (i_clk, i_rst)
  begin
    if i_rst = '1' then
      wait_counter <= 0;
    elsif rising_edge(i_clk) then
      if state /= next_state then -- state changing
        wait_counter <= 0;
      elsif state = IDLE then    -- counter would overflow when IDLE
        wait_counter <= 0;
      else
        wait_counter <= wait_counter + 1;
      end if;
    end if;
  end process;

  -- the refresh counter is used to periodically trigger a refresh operation
  update_refresh_counter : process (i_clk, i_rst)
  begin
    if i_rst = '1' then
      refresh_counter <= 0;
      should_refresh <= '0';
    elsif rising_edge(i_clk) then
      -- Update the refresh counter.
      if state = REFRESH and wait_counter = 0 then
        refresh_counter <= 0;
      elsif refresh_counter /= MAX_REFRESH_COUNT then
        refresh_counter <= refresh_counter + 1;
      end if;

      -- Time for a refresh?
      if refresh_counter = REFRESH_INTERVAL-2 then
        should_refresh <= '1';
      elsif state /= REFRESH and next_state = REFRESH then
        should_refresh <= '0';
      end if;
    end if;
  end process;

  -- latch the request
  latch_request : process (i_rst, i_clk)
  begin
    if i_rst = '1' then
      addr_reg <= (others => '0');
      data_reg <= (others => '0');
      we_reg <= '0';
      sel_n_reg <= (others => '0');
    elsif rising_edge(i_clk) then
      if start = '1' then
        addr_reg  <= i_adr;
        data_reg  <= i_dat_w;
        we_reg    <= i_we;
        sel_n_reg <= not i_sel;
      end if;
    end if;
  end process;

  -- set wait signals
  load_mode_done <= '1' when wait_counter = LOAD_MODE_WAIT-1 else '0';
  active_done    <= '1' when wait_counter = ACTIVE_WAIT-1    else '0';
  refresh_done   <= '1' when wait_counter = REFRESH_WAIT-1   else '0';
  read_done      <= '1' when wait_counter = READ_WAIT-1      else '0';
  write_done     <= '1' when wait_counter = WRITE_WAIT-1     else '0';

  -- a new request is only allowed at the end of the IDLE, READ, WRITE, and
  -- REFRESH states, as long as a refresh is not pending.
  start <= (not should_refresh) when
               (state = IDLE) or
               (state = READ and read_done = '1') or
               (state = WRITE and write_done = '1') or
               (state = REFRESH and refresh_done = '1') else '0';

  -- deassert the o_busy signal when we're ready to accept a new request
  o_busy <= not start;

  -- keep track of ongoing requests and generate an ack signal
  process (i_rst, i_clk)
  begin
    if i_rst = '1' then
      ack <= '0';
      waiting_for_read_response <= '0';
      waiting_for_write_response <= '0';
    elsif rising_edge(i_clk) then
      if start = '1' and i_req = '1' then
        waiting_for_read_response <= not i_we;
        waiting_for_write_response <= i_we;
      else
        if ack = '1' then
          waiting_for_write_response <= '0';
        end if;
        if valid = '1' then
          waiting_for_read_response <= '0';
        end if;
      end if;

      -- TODO(m): We could assert o_ack directly for write requests.
      if next_state = ACTIVE and next_state /= state then
        ack <= '1';
      else
        ack <= '0';
      end if;
    end if;
  end process;

  o_ack <= (waiting_for_read_response and valid) or
           (waiting_for_write_response and ack);

  -- set output data
  o_dat <= q_reg;

  -- assert the clock enable signal once we have entered the INIT state
  process (i_rst, i_clk)
  begin
    if i_rst = '1' then
      o_sdram_cke <= '0';
    elsif rising_edge(i_clk) then
      if state = INIT then
        o_sdram_cke <= '1';
      end if;
    end if;
  end process;

  -- set SDRAM control signals
  (o_sdram_cs_n, o_sdram_ras_n, o_sdram_cas_n, o_sdram_we_n) <= cmd;

  -- set SDRAM bank and address
  addr_current <= adjust_addr(i_adr) when start = '1' else adjust_addr(addr_reg);
  process (i_rst, i_clk)
  begin
    if i_rst = '1' then
      o_sdram_ba <= (others => '0');
      o_sdram_a <= (others => '0');
    elsif rising_edge(i_clk) then
      case next_state is
        when ACTIVE | READ | WRITE =>
          o_sdram_ba <= std_logic_vector(bank);
        when others =>
          o_sdram_ba <= (others => '0');
      end case;

      case next_state is
        when INIT =>
          o_sdram_a <= INIT_CMD;
        when MODE =>
          o_sdram_a <= MODE_REG;
        when ACTIVE =>
          o_sdram_a <= row2addr(row);
        when READ | WRITE =>
          o_sdram_a <= col2addr(col);
        when others =>
          o_sdram_a <= (others => '0');
      end case;
    end if;
  end process;

  -- read the next sub-word as it's bursted from the SDRAM
  process (i_rst, i_clk)
    -- Add one extra cycle delay due to SDRAM clock phase diff.
    constant C_START_CNT : integer := -1;
    variable v_burst_cnt : integer range C_START_CNT to BURST_LENGTH := BURST_LENGTH;
  begin
    if i_rst = '1' then
      q_reg <= (others => '0');
      valid <= '0';
    elsif rising_edge(i_clk) then
      if state = READ and wait_counter = G_CAS_LATENCY then
        v_burst_cnt := C_START_CNT;
      elsif v_burst_cnt < BURST_LENGTH then
        v_burst_cnt := v_burst_cnt + 1;
      end if;

      if v_burst_cnt >= 0 and v_burst_cnt < BURST_LENGTH then
        q_reg(G_SDRAM_DQ_WIDTH*(v_burst_cnt+1)-1 downto G_SDRAM_DQ_WIDTH*v_burst_cnt) <= dq_in;
      end if;

      -- Was this the final sub-word?
      if v_burst_cnt = (BURST_LENGTH - 1) then
        valid <= '1';
      else
        valid <= '0';
      end if;
    end if;
  end process;

  -- write the next sub-word from the write buffer
  process (i_rst, i_clk)
    variable v_burst_cnt : natural range 0 to BURST_LENGTH := BURST_LENGTH;
  begin
    if i_rst = '1' then
      dq_out_en <= '0';
      dq_out <= (others => '0');
      o_sdram_dqm <= (others => '0');
    elsif rising_edge(i_clk) then
      if next_state = WRITE and next_state /= state then
        -- Start a new write burst.
        v_burst_cnt := 0;
      elsif v_burst_cnt < BURST_LENGTH then
        v_burst_cnt := v_burst_cnt + 1;
      end if;

      if v_burst_cnt < BURST_LENGTH then
        dq_out_en <= '1';
        dq_out <= data_reg(G_SDRAM_DQ_WIDTH*(v_burst_cnt+1)-1 downto G_SDRAM_DQ_WIDTH*v_burst_cnt);
        o_sdram_dqm <= sel_n_reg((G_SDRAM_DQ_WIDTH/8)*(v_burst_cnt+1)-1 downto (G_SDRAM_DQ_WIDTH/8)*v_burst_cnt);
      else
        dq_out_en <= '0';
        dq_out <= (others => '0');
        o_sdram_dqm <= (others => '0');
      end if;
    end if;
  end process;

  ---------------------------------------------------------------------------
  -- SDRAM data interface - Since the SDRAM_DQ signal is an inout signal, we
  -- need to use constructs that map well to FPGA I/O buffers.
  ---------------------------------------------------------------------------

  -- Sample the input DQ signal.
  process (i_rst, i_clk)
  begin
    if i_rst = '1' then
      dq_in <= (others => '0');
    elsif rising_edge(i_clk) then
      dq_in <= io_sdram_dq;
    end if;
  end process;

  -- This should infer an IOBUF.
  io_sdram_dq <= dq_out when dq_out_en = '1' else (others => 'Z');

end architecture arch;
