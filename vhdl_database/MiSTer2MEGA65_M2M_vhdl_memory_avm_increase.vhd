library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
  use ieee.numeric_std_unsigned.all;

-- This increases the data width of an Avalon Memory Map interface.

entity avm_increase is
  generic (
    G_SLAVE_ADDRESS_SIZE  : integer;
    G_SLAVE_DATA_SIZE     : integer;
    G_MASTER_ADDRESS_SIZE : integer;
    G_MASTER_DATA_SIZE    : integer -- Must be an integer multiple of G_SLAVE_DATA_SIZE
  );
  port (
    clk_i                 : in    std_logic;
    rst_i                 : in    std_logic;

    -- Slave interface (input)
    s_avm_write_i         : in    std_logic;
    s_avm_read_i          : in    std_logic;
    s_avm_address_i       : in    std_logic_vector(G_SLAVE_ADDRESS_SIZE - 1 downto 0);
    s_avm_writedata_i     : in    std_logic_vector(G_SLAVE_DATA_SIZE - 1 downto 0);
    s_avm_byteenable_i    : in    std_logic_vector(G_SLAVE_DATA_SIZE / 8 - 1 downto 0);
    s_avm_burstcount_i    : in    std_logic_vector(7 downto 0);
    s_avm_readdata_o      : out   std_logic_vector(G_SLAVE_DATA_SIZE - 1 downto 0);
    s_avm_readdatavalid_o : out   std_logic;
    s_avm_waitrequest_o   : out   std_logic;

    -- Master interface (output)
    m_avm_write_o         : out   std_logic;
    m_avm_read_o          : out   std_logic;
    m_avm_address_o       : out   std_logic_vector(G_MASTER_ADDRESS_SIZE - 1 downto 0);
    m_avm_writedata_o     : out   std_logic_vector(G_MASTER_DATA_SIZE - 1 downto 0);
    m_avm_byteenable_o    : out   std_logic_vector(G_MASTER_DATA_SIZE / 8 - 1 downto 0);
    m_avm_burstcount_o    : out   std_logic_vector(7 downto 0);
    m_avm_readdata_i      : in    std_logic_vector(G_MASTER_DATA_SIZE - 1 downto 0);
    m_avm_readdatavalid_i : in    std_logic;
    m_avm_waitrequest_i   : in    std_logic
  );
end entity avm_increase;

architecture synthesis of avm_increase is

  constant C_RATIO         : integer := G_MASTER_DATA_SIZE / G_SLAVE_DATA_SIZE;
  constant C_ADDRESS_SHIFT : integer := G_SLAVE_ADDRESS_SIZE - G_MASTER_ADDRESS_SIZE;

  type     t_state is (IDLE_ST, WRITING_ST, READING_ST, RESPONSE_ST);
  signal   state : t_state           := IDLE_ST;

  signal   offset              : std_logic_vector(C_ADDRESS_SHIFT - 1 downto 0);
  signal   s_burstcount        : std_logic_vector(7 downto 0);
  signal   m_avm_readdata      : std_logic_vector(G_MASTER_DATA_SIZE - 1 downto 0);
  signal   m_avm_readdatavalid : std_logic;
  signal   m_avm_ready         : std_logic;

begin

  s_avm_waitrequest_o   <= '0' when (state = IDLE_ST or state = WRITING_ST) and
                           (m_avm_write_o = '0' or m_avm_waitrequest_i = '0') else
                           '1';

  assert C_RATIO > 1
    severity failure;
  assert C_ADDRESS_SHIFT > 0
    severity failure;
  assert G_MASTER_DATA_SIZE = C_RATIO * G_SLAVE_DATA_SIZE
    severity failure;
  assert G_MASTER_DATA_SIZE * (2 ** G_MASTER_ADDRESS_SIZE) =
         G_SLAVE_DATA_SIZE * (2 ** G_SLAVE_ADDRESS_SIZE)
    severity failure;

  fsm_proc : process (clk_i)
    pure function calc_m_burstcount (address : std_logic_vector; burstcount : std_logic_vector) return std_logic_vector is
      variable res : std_logic_vector(G_SLAVE_ADDRESS_SIZE + 1 downto 0);
    begin
      res := (("00" & address) + burstcount - 1) / C_RATIO - ("00" & address) / C_RATIO + 1;
      return res(7 downto 0);
    end function calc_m_burstcount;

  begin
    if rising_edge(clk_i) then
      if m_avm_waitrequest_i = '0' then
        m_avm_read_o       <= '0';
        m_avm_write_o      <= '0';
        if m_avm_write_o = '1' then
          m_avm_byteenable_o <= (others => '0');
        end if;
      end if;

      case state is

        when IDLE_ST =>
          if s_avm_write_i = '1' and s_avm_waitrequest_o = '0' then
            m_avm_write_o      <= '1';
            m_avm_read_o       <= '0';
            m_avm_address_o    <= s_avm_address_i(G_SLAVE_ADDRESS_SIZE - 1 downto C_ADDRESS_SHIFT);
            m_avm_byteenable_o <= (others => '0');
            m_avm_burstcount_o <= calc_m_burstcount(s_avm_address_i, s_avm_burstcount_i);

            for i in 0 to C_RATIO - 1 loop
              if i = to_integer(s_avm_address_i(C_ADDRESS_SHIFT - 1 downto 0)) then
                m_avm_writedata_o(G_SLAVE_DATA_SIZE * (i + 1) - 1 downto G_SLAVE_DATA_SIZE * i)          <= s_avm_writedata_i;
                m_avm_byteenable_o(G_SLAVE_DATA_SIZE / 8 * (i + 1) - 1 downto G_SLAVE_DATA_SIZE / 8 * i) <= s_avm_byteenable_i;
              end if;
            end loop;

            if s_avm_burstcount_i /= X"01" then
              m_avm_write_o <= '0';
              s_burstcount  <= s_avm_burstcount_i - 1;
              offset        <= s_avm_address_i(C_ADDRESS_SHIFT - 1 downto 0) + 1;
              state         <= WRITING_ST;
            end if;

            if and(s_avm_address_i(C_ADDRESS_SHIFT - 1 downto 0)) then
              m_avm_write_o <= '1';
            end if;
          end if;

          if s_avm_read_i = '1' and s_avm_waitrequest_o = '0' then
            m_avm_write_o      <= '0';
            m_avm_read_o       <= '1';
            m_avm_address_o    <= s_avm_address_i(G_SLAVE_ADDRESS_SIZE - 1 downto C_ADDRESS_SHIFT);
            m_avm_burstcount_o <= calc_m_burstcount(s_avm_address_i, s_avm_burstcount_i);
            s_burstcount       <= s_avm_burstcount_i;
            offset             <= s_avm_address_i(C_ADDRESS_SHIFT - 1 downto 0);
            state              <= READING_ST;
          end if;

        when WRITING_ST =>
          if s_avm_write_i = '1' and s_avm_waitrequest_o = '0' and s_burstcount > 0 then
            s_burstcount <= s_burstcount - 1;
            offset       <= offset + 1;

            if offset = C_RATIO - 1 then
              m_avm_write_o <= '1';
            end if;

            for i in 0 to C_RATIO - 1 loop
              if i = to_integer(offset) then
                m_avm_writedata_o(G_SLAVE_DATA_SIZE * (i + 1) - 1 downto G_SLAVE_DATA_SIZE * i)          <= s_avm_writedata_i;
                m_avm_byteenable_o(G_SLAVE_DATA_SIZE / 8 * (i + 1) - 1 downto G_SLAVE_DATA_SIZE / 8 * i) <= s_avm_byteenable_i;
              end if;
            end loop;

            if s_burstcount = 1 then
              m_avm_write_o <= '1';
              state         <= IDLE_ST;
            end if;
          end if;

        when READING_ST =>
          if m_avm_readdatavalid = '1' then
            s_burstcount <= s_burstcount - 1;
            offset       <= offset + 1;
            if s_burstcount > 1 then
              state <= RESPONSE_ST;
            else
              state <= IDLE_ST;
            end if;
          end if;

        when RESPONSE_ST =>
          if s_burstcount > 1 then
            s_burstcount <= s_burstcount - 1;
            offset       <= offset + 1;
          else
            state <= IDLE_ST;
          end if;

        when others =>
          null;

      end case;

      if rst_i = '1' then
        m_avm_read_o  <= '0';
        m_avm_write_o <= '0';
        state         <= IDLE_ST;
      end if;
    end if;
  end process fsm_proc;

  s_avm_readdata_o      <= m_avm_readdata(G_SLAVE_DATA_SIZE * (to_integer(offset) + 1) - 1 downto G_SLAVE_DATA_SIZE * to_integer(offset));
  s_avm_readdatavalid_o <= m_avm_readdatavalid when state = READING_ST else
                           '1' when state = RESPONSE_ST else
                           '0';

  m_avm_ready           <= '1' when offset = C_RATIO - 1 or state = IDLE_ST else
                           '0';

  axi_fifo_small_inst : entity work.axi_fifo_small
    generic map (
      G_RAM_WIDTH => G_MASTER_DATA_SIZE,
      G_RAM_DEPTH => 256
    )
    port map (
      clk_i     => clk_i,
      rst_i     => rst_i,
      s_ready_o => open,
      s_valid_i => m_avm_readdatavalid_i,
      s_data_i  => m_avm_readdata_i,
      m_ready_i => m_avm_ready,
      m_valid_o => m_avm_readdatavalid,
      m_data_o  => m_avm_readdata
    ); -- axi_fifo_small_inst

end architecture synthesis;

