-- Vamos a monitorizar el clk y dato del raton.
-- Los mostramos en monitor de 640x480, por tanto, vamos a guardar 1024
-- datos para uno y para el otro. Que son 10 bits

library IEEE;
  use IEEE.STD_LOGIC_1164.ALL;
  use IEEE.NUMERIC_STD.ALL;

entity BRAM is
  generic (
    gBitsProfBRAM       : natural := 10; -- 1024 posiciones
    gBitsBRAM           : natural := 8  -- palabra de 8 bits
  );
  port(
    clk          : in std_logic;
    -- puerto A de escritura
    dina         : in std_logic_vector(gBitsBRAM-1 downto 0);
    addra        : in std_logic_vector(gBitsProfBRAM-1 downto 0);
    wea          : in std_logic;
    douta        : out std_logic_vector(gBitsBRAM-1 downto 0);
    -- puerto B de lectura
    addrb        : in std_logic_vector(gBitsProfBRAM-1 downto 0);
    doutb        : out std_logic_vector(gBitsBRAM-1 downto 0)
  );
end BRAM;

architecture BEHAVIOURAL of BRAM is

--type  memostruct is array (0 to 2**gBitsProfBRAM-1) of std_logic_vector(gBitsBRAM-1 downto 0);
--signal memo  :  memostruct;

  type  memostruct is array (natural range<>) of std_logic_vector(gBitsBRAM-1 downto 0);
  signal memo  :  memostruct(0 to 2**gBitsProfBRAM-1);
  signal addra_int   : natural range 0 to 2**gBitsProfBRAM-1;
  signal addrb_int   : natural range 0 to 2**gBitsProfBRAM-1;

begin

  addra_int <= TO_INTEGER(unsigned(addra));
  addrb_int <= TO_INTEGER(unsigned(addrb));

  P: process (clk)
  begin
    if clk'event and clk='1' then
      if wea = '1' then
        memo(addra_int) <= dina;
        douta <= dina; -- Es write first, lo que escribo lo saco
      else
        douta <= memo(addra_int);
      end if;
      doutb <= memo(addrb_int);
    end if;
  end process;

end BEHAVIOURAL;
