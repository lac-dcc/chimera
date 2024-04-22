library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity ethernet_tb is
end entity ethernet_tb;

architecture RTL of ethernet_tb is
  component ethernet is
    port(
      OBSERVE     : out std_logic_vector(31 downto 0);

      CLK         : in  std_logic;
      RST         : in  std_logic;
      ETH_CLK     : in  std_logic;

      --GMII IF
      TXER        : out std_logic;
      TXEN        : out std_logic;
      TXD         : out std_logic_vector(1 downto 0);

      PHY_RESET   : out std_logic;
      RXER        : in  std_logic;
      RXDV        : in  std_logic;
      RXD         : in  std_logic_vector(1 downto 0);

      --RX STREAM
      TX          : in  std_logic_vector(15 downto 0);
      TX_STB      : in  std_logic;
      TX_ACK      : out std_logic;

      --RX STREAM
      RX          : out std_logic_vector(15 downto 0);
      RX_STB      : out std_logic;
      RX_ACK      : in  std_logic
    );
  end component ethernet;


  type PACKET_TYPE is array(0 to 1024) of std_logic_vector(15 downto 0);
  signal PACKET : PACKET_TYPE := (
  0=>X"0100", --length
  others => X"AAAA"
  );
  signal I : integer := 0;
  signal J : integer := 0;
  signal GO : boolean := True;

  signal OBSERVE     : std_logic_vector(31 downto 0);

  signal CLK         : std_logic;
  signal RST         : std_logic;
  signal ETH_CLK     : std_logic;

  --GMII IF
  signal TXER        : std_logic;
  signal TXEN        : std_logic;
  signal TXD         : std_logic_vector(1 downto 0);

  signal PHY_RESET   : std_logic;
  signal RXER        : std_logic;
  signal RXDV        : std_logic;
  signal RXD         : std_logic_vector(1 downto 0);

  --RX STREAM
  signal TX          : std_logic_vector(15 downto 0);
  signal TX_STB      : std_logic;
  signal TX_ACK      : std_logic;

  --RX STREAM
  signal RX          : std_logic_vector(15 downto 0);
  signal RX_STB      : std_logic;
  signal RX_ACK      : std_logic;

begin

  process
  begin
    while True loop
      CLK <= '1';
      wait for 5 ns;
      CLK <= '0';
      wait for 5 ns;
    end loop;
    wait;
  end process;

  process
  begin
    while True loop
      ETH_CLK <= '1';
      wait for 10 ns;
      ETH_CLK <= '0';
      wait for 10 ns;
    end loop;
    wait;
  end process;

  process
  begin
    RST <= '1';
    wait for 100 ns;
    RST <= '0';
    wait;
  end process;
  
  ethernet_inst1 : ethernet port map(
      OBSERVE => OBSERVE,

      CLK => CLK,
      RST => RST,
      ETH_CLK => ETH_CLK,

      PHY_RESET => PHY_RESET,

      --GMII IF
      TXER => TXER,
      TXEN => TXEN,
      TXD => TXD,

      RXER => TXER,
      RXDV => TXEN,
      RXD => TXD,

      --RX STREAM
      TX => TX,
      TX_STB => TX_STB,
      TX_ACK => TX_ACK,

      --RX STREAM
      RX => RX,
      RX_STB => RX_STB,
      RX_ACK => RX_ACK
  );

  process
  begin
    wait until rising_edge(CLK);
    if GO then
      TX <= PACKET(I);
      TX_STB <= '1';
      if TX_STB = '1' and TX_ACK = '1' then
        if I = 129 then
          TX_STB <= '0';
          GO <= FALSE;
        else
          I <= I+1;
        end if;
      end if;
    end if;
  end process;

  process
  begin
    wait until rising_edge(CLK);
    RX_ACK <= '1';
    if RX_STB = '1' and RX_ACK = '1' then
      if J = 128 then
        report "TEST HAS PASSED" severity failure;
      end if;
      if RX /= PACKET(J) then
        report "INCORRECT DATA RECEIVED" severity failure;
      end if;
      J <= J+1;
    end if;
  end process;

  
end architecture RTL;
