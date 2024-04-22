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
    E_REF_CLK : OUT STD_LOGIC; -- Ethernet reference clock
    E_RX_CLK : IN STD_LOGIC; -- Receiver Clock.
    E_RX_DV : IN STD_LOGIC; -- Received Data Valid.
    E_RXD : IN STD_LOGIC_VECTOR(3 DOWNTO 0); -- Received Nibble.
    E_RX_ER : IN STD_LOGIC; -- Received Data Error.
    E_TX_CLK : IN STD_LOGIC; -- Sender Clock.
    E_TX_EN : OUT STD_LOGIC; -- Sender Enable.
    E_TXD : OUT STD_LOGIC_VECTOR(3 DOWNTO 0); -- Sent Data.
    --E_TX_ER : OUT STD_LOGIC; -- sent Data Error.

    LED : OUT STD_LOGIC_VECTOR(3 DOWNTO 0) -- LEDs.
  );
END main;

ARCHITECTURE rtl OF main IS

  COMPONENT clock
    PORT (
      i_clk : IN STD_LOGIC;
      o50_clk : OUT STD_LOGIC;
      o25_clk : OUT STD_LOGIC
    );
  END COMPONENT;

  COMPONENT mac_rcv IS
    PORT (
      E_RX_CLK : IN STD_LOGIC; -- Receiver Clock.
      E_RX_DV : IN STD_LOGIC; -- Received Data Valid.
      E_RXD : IN STD_LOGIC_VECTOR(3 DOWNTO 0); -- Received Nibble.
      el_data : OUT rcv_data_t; -- Channel metadata.
      el_dv : OUT STD_LOGIC -- Data valid.
      --led : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
  END COMPONENT;

  COMPONENT fifo_rcv IS
    PORT (
      wclk : IN STD_LOGIC; -- Write Clock
      rclk : IN STD_LOGIC; -- Read Clock
      w_en : IN STD_LOGIC; -- Write Enable
      w_data : IN rcv_data_t; -- Ethernet Receving Data in
      r_en : IN STD_LOGIC; -- Read Enable
      r_data : OUT rcv_data_t; -- Ethernet Receving Data out
      buf_not_empty : OUT STD_LOGIC -- Buffer NOT Empty
    );
  END COMPONENT;

  COMPONENT mac_snd IS
    PORT (
      E_TX_CLK : IN STD_LOGIC; -- Sender Clock.
      E_TX_EN : OUT STD_LOGIC; -- Sender Enable.
      E_TXD : OUT STD_LOGIC_VECTOR(3 DOWNTO 0); -- Sent Data.
      el_data : IN snd_data_t; -- Actual Data
      el_snd_en : IN STD_LOGIC; -- User Start Send.
      el_snd_ack : OUT STD_LOGIC -- Send Ack to FIFO buffer
    );
  END COMPONENT;

  COMPONENT fifo_snd IS
    PORT (
      wclk : IN STD_LOGIC; -- Write Clock
      rclk : IN STD_LOGIC; -- Read Clock
      w_en : IN STD_LOGIC; -- Write Enable
      w_data : IN snd_data_t; -- Ethernet Send Data in
      r_en : IN STD_LOGIC; -- Read Enable
      r_data : OUT snd_data_t; -- Ethernet Send Data out
      buf_not_empty : OUT STD_LOGIC -- Buffer NOT Empty
    );
  END COMPONENT;

  COMPONENT corein IS
    PORT (
      clk : IN STD_LOGIC;
      -- data received.
      el_rcv_data : IN rcv_data_t;
      el_rcv_dv : IN STD_LOGIC;
      el_rcv_ack : OUT STD_LOGIC;
      -- data to send.
      snd_rcv_data : OUT rcv_data_t;
      snd_en : OUT STD_LOGIC;

      -- LEDs.
      LED : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
  END COMPONENT;

  COMPONENT coreout IS
    PORT (
      clk : IN STD_LOGIC;
      -- data received.
      rcv_data : IN rcv_data_t;
      rcv_data_dv : IN STD_LOGIC;

      -- data to send.
      el_snd_data : OUT snd_data_t;
      el_snd_en : OUT STD_LOGIC
    );
  END COMPONENT;

  SIGNAL el_rcv_data_phy : rcv_data_t; -- Receive data RCV -> FIFO_RCV
  SIGNAL el_rcv_dv_phy : STD_LOGIC; -- Received data valid RCV -> FIFO_RCV

  SIGNAL el_rcv_dv_buf : STD_LOGIC; -- Received data valid FIFO_RCV -> Core
  SIGNAL el_rcv_data_buf : rcv_data_t; -- Recevie data FIFO_RCV -> Core
  SIGNAL el_rcv_ack_buf : STD_LOGIC; -- Recevied data Ready FIFO_RCV -> Core

  SIGNAL core_io_data : rcv_data_t;
  SIGNAL core_io_dv : STD_LOGIC;

  SIGNAL el_snd_data_buf : snd_data_t; -- Send data Core
  SIGNAL el_snd_en_buf : STD_LOGIC; -- Enable sending.

  SIGNAL el_snd_en_phy : STD_LOGIC;
  SIGNAL el_snd_data_phy : snd_data_t;
  SIGNAL el_snd_ack_phy : STD_LOGIC;

  SIGNAL clk50 : STD_LOGIC; -- half speed clock
  SIGNAL clk25 : STD_LOGIC; -- 25 Mhz clock
BEGIN

  inst_clock : clock PORT MAP(
    i_clk => clk,
    o50_clk => clk50,
    o25_clk => clk25
  );

  E_REF_CLK <= clk25;

  mac_receive : mac_rcv PORT MAP(
    E_RX_CLK => E_RX_CLK,
    E_RX_DV => E_RX_DV,
    E_RXD => E_RXD,
    el_data => el_rcv_data_phy,
    el_dv => el_rcv_dv_phy
    --led => LED
  );

  fifo_receive : fifo_rcv PORT MAP(
    wclk => E_RX_CLK,
    rclk => clk50,
    --rclk => clk,
    w_en => el_rcv_dv_phy,
    w_data => el_rcv_data_phy,
    r_en => el_rcv_ack_buf,
    r_data => el_rcv_data_buf,
    buf_not_empty => el_rcv_dv_buf
  );

  mac_send : mac_snd PORT MAP(
    E_TX_CLK => E_TX_CLK,
    E_TX_EN => E_TX_EN,
    E_TXD => E_TXD,
    el_snd_en => el_snd_en_phy,
    el_data => el_snd_data_phy,
    el_snd_ack => el_snd_ack_phy
  );

  fifo_send : fifo_snd PORT MAP(
    wclk => clk50,
    --wclk => clk,
    rclk => E_TX_CLK,
    w_en => el_snd_en_buf,
    w_data => el_snd_data_buf,
    r_en => el_snd_ack_phy,
    r_data => el_snd_data_phy,
    buf_not_empty => el_snd_en_phy
  );

  ci : corein PORT MAP(
    clk => clk50,
    --clk => clk,
    -- Data received.
    el_rcv_data => el_rcv_data_buf,
    el_rcv_dv => el_rcv_dv_buf,
    el_rcv_ack => el_rcv_ack_buf,
    -- Data to send.
    snd_rcv_data => core_io_data,
    snd_en => core_io_dv,

    -- LEDs.
    LED => LED
  );

  co : coreout PORT MAP(
    clk => clk50,

    -- data received.
    rcv_data => core_io_data,
    rcv_data_dv => core_io_dv,

    -- data to send.
    el_snd_data => el_snd_data_buf,
    el_snd_en => el_snd_en_buf
  );

END rtl;
