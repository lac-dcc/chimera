library ieee;
context ieee.ieee_std_context;

entity Design_Top is
  generic (
    G_SCREEN: natural
  );
  port (
    CLK   : in  std_logic;
    EN    : in  std_logic;
    RST   : in  std_logic;
    HSYNC : out std_logic;
    VSYNC : out std_logic;
    RGB   : out std_logic_vector(2 downto 0)
  );
end entity;
