library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity flexray_interceptor is
  port (
    clk : in std_ulogic;                -- Clock 8x higher than can bitrate
    rst : in std_ulogic;

    rx_0    : in  std_ulogic;
    tx_0    : out std_ulogic;
    tx_en_0 : out std_ulogic;

    rx_1    : in  std_ulogic;
    tx_1    : out std_ulogic;
    tx_en_1 : out std_ulogic;

    rx       : out std_ulogic;
    tx       : in  std_ulogic;
    override : in  std_ulogic);
end entity flexray_interceptor;


architecture syn of flexray_interceptor is
  signal s_tx_0 : std_ulogic;
  signal s_tx_1 : std_ulogic;

  signal tx_0_delayed : std_ulogic_vector(7 downto 0);
  signal tx_1_delayed : std_ulogic_vector(7 downto 0);

begin
  tx_0 <= s_tx_0;
  tx_1 <= s_tx_1;


  manage_enables : process(clk, rst)
    variable bus_0_idle_counter : integer range 0 to 80;
    variable bus_1_idle_counter : integer range 0 to 80;
  begin
    if rst = '1' then
      tx_en_0 <= '0';
      tx_en_1 <= '0';

      bus_0_idle_counter := 80;
      bus_1_idle_counter := 80;
    elsif rising_edge(clk) then
      if s_tx_0 = '0' then
        bus_0_idle_counter := 0;
        tx_en_0            <= '0';
      else
        if bus_0_idle_counter < 80 then
          bus_0_idle_counter := bus_0_idle_counter + 1;
          tx_en_0            <= '0';
        else
          tx_en_0 <= '1';
        end if;
      end if;

      if s_tx_1 = '0' then
        bus_1_idle_counter := 0;
        tx_en_1            <= '0';
      else
        if bus_1_idle_counter < 80 then
          bus_1_idle_counter := bus_1_idle_counter + 1;
          tx_en_1            <= '0';
        else
          tx_en_1 <= '1';
        end if;
      end if;
    end if;

  end process;

  intercept : process (clk, rst)
  begin
    if rst = '1' then
      rx   <= '1';

      tx_0_delayed <= (others => '0');
      tx_1_delayed <= (others => '0');


    elsif rising_edge(clk) then
      tx_0_delayed <= tx_0_delayed(6 downto 0) & s_tx_0;
      tx_1_delayed <= tx_1_delayed(6 downto 0) & s_tx_1;

			rx <= rx_1;

      if override = '1' then
        s_tx_0 <= tx;
      else
        if rx_1 = '0' and tx_1_delayed = b"11111111" then
          s_tx_0 <= '0';
        else
          s_tx_0 <= '1';
        end if;
      end if;

      if rx_0 = '0' and tx_0_delayed = b"11111111" then
        s_tx_1 <= '0';
      else
        s_tx_1 <= '1';
      end if;

    end if;
  end process;
end architecture syn;
