LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY work;
USE work.common.ALL;

ENTITY main IS
  PORT (
    clk : IN STD_LOGIC;

    --E_COL : IN STD_LOGIC; -- Collision Detect.
    --E_CRS : IN STD_LOGIC; -- Carrier Sense.
    --E_MDC : OUT STD_LOGIC;
    --E_MDIO : IN STD_LOGIC;
    E_RX_CLK : IN STD_LOGIC; -- Receiver Clock.
    E_RX_DV : IN STD_LOGIC; -- Received Data Valid.
    E_RXD : IN STD_LOGIC_VECTOR(3 DOWNTO 0); -- Received Nibble.
    E_RX_ER : IN STD_LOGIC; -- Received Data Error.
    E_TX_CLK : IN STD_LOGIC; -- Sender Clock.
    E_TX_EN : OUT STD_LOGIC; -- Sender Enable.
    E_TXD : OUT STD_LOGIC_VECTOR(3 DOWNTO 0); -- Sent Data.
    E_TX_ER : OUT STD_LOGIC; -- sent Data Error.

    LED : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) -- LEDs.
  );
END main;

ARCHITECTURE rtl OF main IS

  COMPONENT clock
    PORT (
      i_clk : in STD_LOGIC;
      o25_clk : out STD_LOGIC
    );
  END COMPONENT;

  COMPONENT mac_rcv IS
    PORT (
      E_RX_CLK : IN STD_LOGIC; -- Receiver Clock.
      E_RX_DV : IN STD_LOGIC; -- Received Data Valid.
      E_RXD : IN STD_LOGIC_VECTOR(3 DOWNTO 0); -- Received Nibble.
      el_data : OUT rcv_data_t; -- Channel metadata.
      el_dv : OUT STD_LOGIC -- Data valid.
      --LED : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
      --el_ack : IN STD_LOGIC -- Packet reception ACK.
    );
  END COMPONENT;

  COMPONENT mac_snd IS
    PORT (
      E_TX_CLK : IN STD_LOGIC; -- Sender Clock.
      E_TX_EN : OUT STD_LOGIC; -- Sender Enable.
      E_TXD : OUT STD_LOGIC_VECTOR(3 DOWNTO 0); -- Sent Data.
      E_TX_ER : OUT STD_LOGIC; -- Sent Data Error.
      el_data : IN snd_data_t; -- Actual Data
      el_snd_en : IN STD_LOGIC -- User Start Send.
    );
  END COMPONENT;

  COMPONENT io IS
    PORT (
      clk : IN STD_LOGIC;
      --clk90 : IN STD_LOGIC;
      -- data received.
      el_rcv_data : IN rcv_data_t;
      el_rcv_dv : IN STD_LOGIC;
      --el_rcv_ack : OUT STD_LOGIC;
      -- data to send.
      el_snd_data : OUT snd_data_t;
      el_snd_en : OUT STD_LOGIC;

      --E_CRS : IN STD_LOGIC;
      --E_COL : IN STD_LOGIC;

      -- LEDs.
      LED : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
  END COMPONENT;

  SIGNAL el_rcv_data : rcv_data_t; -- Actual data.
  SIGNAL el_rcv_dv : STD_LOGIC; -- Received data valid.
  --SIGNAL el_rcv_ack : STD_LOGIC; -- Packet reception ACK.

  SIGNAL el_snd_data : snd_data_t; -- Send data.
  SIGNAL el_snd_en : STD_LOGIC; -- Enable sending.

  SIGNAL clk25 : STD_LOGIC; -- Clock shift right 90 degree.
BEGIN

  --E_MDC <= '1';

  inst_clock : clock PORT MAP(
    i_clk => clk,
    o25_clk => clk25
  );

  mac_receive : mac_rcv PORT MAP(
    E_RX_CLK => E_RX_CLK,
    E_RX_DV => E_RX_DV,
    E_RXD => E_RXD,
    el_data => el_rcv_data,
    el_dv => el_rcv_dv
    --LED => LED
    --el_ack => el_rcv_ack
  );

  mac_send : mac_snd PORT MAP(
    E_TX_CLK => E_TX_CLK,
    E_TX_EN => E_TX_EN,
    E_TXD => E_TXD,
    E_TX_ER => E_TX_ER,
    el_snd_en => el_snd_en,
    el_data => el_snd_data
  );

  core : io PORT MAP(
    clk => clk25,
    --clk90 => clk90,
    -- Data received.
    el_rcv_data => el_rcv_data,
    el_rcv_dv => el_rcv_dv,
    --el_rcv_ack => el_rcv_ack,
    -- Data to send.
    el_snd_data => el_snd_data,
    el_snd_en => el_snd_en,

    --E_COL => E_COL,
    --E_CRS => E_CRS,

    -- LEDs.
    LED => LED
  );
END rtl;