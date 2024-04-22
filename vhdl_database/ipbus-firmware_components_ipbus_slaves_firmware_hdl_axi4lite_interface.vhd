--======================================================================

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity axi4lite_interface is
  port (
    reset         : in std_logic;
    usr_clock     : in std_logic;
    usr_add       : in std_logic_vector(31 downto 0);
    usr_strb      : in std_logic_vector(3 downto 0);
    usr_dti       : in std_logic_vector(31 downto 0);
    usr_dto       : out std_logic_vector(31 downto 0);
    usr_rdreq     : in std_logic;
    usr_wrreq     : in std_logic;
    usr_axi_tick  : in std_logic;
    axi_status    : out std_logic_vector(31 downto 0);
    axi_done      : out std_logic;

    s_axi_clock   : in std_logic;
    s_axi_pm_tick : out std_logic;
    s_axi_awaddr  : out std_logic_vector(31 downto 0);
    s_axi_awvalid : out std_logic;
    s_axi_awready : in std_logic;
    s_axi_wdata   : out std_logic_vector(31 downto 0);
    s_axi_wstrb   : out std_logic_vector(3 downto 0);
    s_axi_size    : out std_logic_vector(2 downto 0);
    s_axi_wvalid  : out std_logic;
    s_axi_wready  : in std_logic;
    s_axi_bresp   : in std_logic_vector(1 downto 0);
    s_axi_bvalid  : in std_logic;
    s_axi_bready  : out std_logic;
    s_axi_araddr  : out std_logic_vector(31 downto 0);
    s_axi_arvalid : out std_logic;
    s_axi_arready : in std_logic;
    s_axi_rdata   : in std_logic_vector(31 downto 0);
    s_axi_rresp   : in std_logic_vector(1 downto 0);
    s_axi_rvalid  : in std_logic;
    s_axi_rready  : out std_logic
  );
end axi4lite_interface;

architecture behavioral of axi4lite_interface is

  type fsm_state_type is (state_axi_idle,
                          state_axi_write,
                          state_axi_read,
                          state_axi_ack);
  signal fsm_state : fsm_state_type;

  signal axi_add_reg          : std_logic_vector(31 downto 0);
  signal axi_dt_wr            : std_logic_vector(31 downto 0);
  signal axi_dt_rd            : std_logic_vector(31 downto 0);
  signal axi_be_rg            : std_logic_vector(3 downto 0);
  signal axi_size_rg          : std_logic_vector(2 downto 0);

  signal axi_error_wr         : std_logic_vector(1 downto 0);
  signal axi_error_rd         : std_logic_vector(1 downto 0);

  signal wr_addw_rg           : std_logic;
  signal wr_req_reg           : std_logic;
  signal wr_done_rg           : std_logic;
  signal wr_addR_rg           : std_logic;
  signal rd_req_reg           : std_logic;
  signal rd_done_rg           : std_logic;
  signal wr_dtw_rg            : std_logic;

  signal resync_req_axi_read  : std_logic;
  signal resync_req_axi_write : std_logic;
  signal reset_axi            : std_logic;

  signal access_done          : std_logic;
  signal async_access_done    : std_logic;
  signal sync_access_done     : std_logic;

begin

  done : process(reset, usr_clock)
  begin
    if reset = '1' then
      access_done <= '1';
    elsif rising_edge(usr_clock) then
      if usr_rdreq = '1' or usr_wrreq = '1' then
        access_done <= '0';
      elsif sync_access_done = '1' then
        access_done <= '1';
      end if;
    end if;
  end process;

  cdc_done : entity work.ipbus_cdc_reg
    port map (
      clk => s_axi_clock,
      d(0) => async_access_done,
      clks => usr_clock,
      q(0) => sync_access_done
    );

  cdc_reset : entity work.cdc_reset
    port map (
      reset_in => reset,
      clk_dst => s_axi_clock,
      reset_out => reset_axi
    );

  cdc_read_req : entity work.ipbus_cdc_reg
    port map (
      clk => usr_clock,
      d(0) => usr_rdreq,
      clks => s_axi_clock,
      q(0) => resync_req_axi_read
    );

  cdc_write_req : entity work.ipbus_cdc_reg
    port map (
      clk => usr_clock,
      d(0) => usr_wrreq,
      clks => s_axi_clock,
      q(0) => resync_req_axi_write
    );

  -- Static values for the size. Always four bytes to make up a 32-bit
  -- word.
  axi_size : process(s_axi_clock)
  begin
    if rising_edge(s_axi_clock) then
      if resync_req_axi_read = '1' or resync_req_axi_write = '1' then
        axi_add_reg <= usr_add;
        axi_dt_wr <= usr_dti;
        axi_be_rg <= usr_strb;
        case usr_strb is
          when "1111" =>
            axi_size_rg <= "010";
          when "1100" | "0011" | "0110" | "1001" =>
            axi_size_rg <= "001";
          when others =>
            axi_size_rg <= "000";
        end case;
        -- if usr_strb = "1111" then
        --   axi_size_rg <= "010";
        -- else
        --   axi_size_rg <= "000";
        -- end if;
      end if;
    end if;
  end process;

  s_axi_awaddr <= axi_add_reg;
  s_axi_araddr <= axi_add_reg;
  s_axi_wdata <= axi_dt_wr;
  s_axi_wstrb <= axi_be_rg;
  s_axi_size <= axi_size_rg;

  -- Write request.
  write_request : process(reset_axi, s_axi_clock)
  begin
    if reset_axi = '1' then
      wr_addw_rg <= '0';
      wr_dtw_rg <= '0';
      wr_req_reg <= '0';
      wr_done_rg <= '0';
    elsif rising_edge(s_axi_clock) then
      if resync_req_axi_write = '1' then
        wr_addw_rg <= '1';
      elsif s_axi_awready = '1' then
        wr_addw_rg <= '0';
      end if;

      if resync_req_axi_write = '1' then
        wr_dtw_rg <= '1';
      elsif s_axi_wready = '1' then
        wr_dtw_rg <= '0';
      end if;

      wr_done_rg <= '0';
      if resync_req_axi_write = '1' then
        wr_req_reg <= '1';
      elsif fsm_state = state_axi_ack and s_axi_bvalid = '1' then
        axi_error_wr <= s_axi_bresp;
        wr_req_reg <= '0';
        wr_done_rg <= '1';
      end if;
    end if;
  end process;

  s_axi_awvalid <= wr_addw_rg;
  s_axi_wvalid <= wr_dtw_rg;
  s_axi_bready <= wr_done_rg;

  -- Read request.
  read_request : process(reset_axi, s_axi_clock)
  begin
    if reset_axi = '1' then
      wr_addr_rg <= '0';
      rd_req_reg <= '0';
      rd_done_rg <= '0';
      axi_dt_rd <= (others => '0');
    elsif rising_edge(s_axi_clock) then
      if resync_req_axi_read = '1' then
        wr_addr_rg <= '1';
      elsif s_axi_arready = '1' then
        wr_addr_rg <= '0';
      end if;

      rd_done_rg <= '0';
      if resync_req_axi_read = '1' then
        rd_req_reg <= '1';
        axi_dt_rd <= (others => '0');
      elsif fsm_state = state_axi_ack and s_axi_rvalid = '1' then
        axi_error_rd <= s_axi_rresp;
        rd_req_reg <= '0';
        axi_dt_rd <= s_axi_rdata;
        rd_done_rg <= '1';
      end if;
    end if;
  end process;

  s_axi_arvalid <= wr_addr_rg;
  s_axi_rready <= rd_done_rg;
  usr_dto <= axi_dt_rd;
  s_axi_pm_tick <= usr_axi_tick;

  -- Status read-back.
  axi_done               <= '1' when access_done = '1' else '0';
  axi_status(0)          <= '1' when access_done = '1' else '0';
  axi_status(2 downto 1) <= axi_error_wr;
  axi_status(6 downto 5) <= axi_error_rd;
  axi_status(8)          <= '1' when fsm_state = state_axi_idle else '0';
  axi_status(9)          <= '1' when fsm_state = state_axi_write else '0';
  axi_status(10)         <= '1' when fsm_state = state_axi_read else '0';
  axi_status(11)         <= '1' when fsm_state = state_axi_ack else '0';

  axi_bus_fsm : process(s_axi_clock, reset_axi)
  begin
    if reset_axi = '1' then
      fsm_state <= state_axi_idle;
      async_access_done <= '0';
    elsif rising_edge(s_axi_clock) then
      async_access_done <= '0';
      case fsm_state is
        when state_axi_idle =>
          if resync_req_axi_read = '1' then
            fsm_state <= state_axi_read;
          elsif resync_req_axi_write = '1' then
            fsm_state <= state_axi_write;
          end if;

        when state_axi_write =>
          if wr_dtw_rg = '0' and wr_addw_rg = '0' then
            fsm_state <= state_axi_ack;
          end if;

        when state_axi_read =>
          if wr_addr_rg = '0' then
            fsm_state <= state_axi_ack;
          end if;

        when state_axi_ack =>
          if s_axi_bvalid = '1' and wr_req_reg = '1' then
            fsm_state <= state_axi_idle;
            async_access_done <= '1';
          elsif s_axi_rvalid = '1' and rd_req_reg = '1' then
            fsm_state <= state_axi_idle;
            async_access_done <= '1';
          end if;

        when others =>
          fsm_state <= state_axi_idle;
      end case;
    end if;
  end process;

end behavioral;

--======================================================================
