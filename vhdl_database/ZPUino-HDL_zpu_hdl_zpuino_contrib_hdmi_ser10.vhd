library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
Library UNISIM;
use UNISIM.vcomponents.all;

entity ser10 is
  port (
    clk:    in std_ulogic;
    rst:    in std_ulogic;
    locked: in std_ulogic;
    clkdiv: in std_ulogic;
    serdesstrobe: in std_ulogic;
    datain: in std_logic_vector(9 downto 0);
    dataout: out std_ulogic
  );
end entity ser10;

architecture behave of ser10 is

  signal cdi,cti,cdo,cto: std_ulogic;
  signal data: std_logic_vector(4 downto 0);
  signal sel: std_logic;

  signal nlock: std_logic;
begin

  process(clkdiv, rst)
  begin
    if rst='1' then
      sel <= '1';
    elsif rising_edge(clkdiv) then
      sel <= not sel;
      if sel='1' then
        data <= datain(4 downto 0);
      else
        data <= datain(9 downto 5);
      end if;
    end if;
  end process;

    

  os1: OSERDES2
    GENERIC MAP (
      SERDES_MODE => "MASTER",
      DATA_WIDTH => 5,
      DATA_RATE_OQ => "SDR",
	    DATA_RATE_OT => "SDR",
	    OUTPUT_MODE  => "DIFFERENTIAL"
    )
    PORT MAP (
      CLK0 => clk,
      CLK1 => '0',
      CLKDIV => clkdiv,
      D1  => data(4),
      D2  => '0',
      D3  => '0',
      D4  => '0',
      OCE => '1',
      IOCE => serdesstrobe,
      SHIFTIN1 => '1',
      SHIFTIN2 => '1',
      SHIFTIN3 => cdo,
      SHIFTIN4 => cto,
      SHIFTOUT1 => cdi,
      SHIFTOUT2 => cti,
      T1 => '0',
      T2 => '0',
      T3 => '0',
      T4 => '0',
      TCE => '1',
      RST => rst,
      TRAIN => '0',
      OQ  => dataout
    );

  os2: OSERDES2
    GENERIC MAP (
      SERDES_MODE => "SLAVE",
      DATA_WIDTH => 5,
      DATA_RATE_OQ => "SDR",
	    DATA_RATE_OT => "SDR",
	    OUTPUT_MODE  => "DIFFERENTIAL"
    )
    PORT MAP (
      CLK0 => clk,
      CLK1 => '0',
      CLKDIV => clkdiv,
      D1  => data(0),
      D2  => data(1),
      D3  => data(2),
      D4  => data(3),
      OCE => '1',
      IOCE => serdesstrobe,
      SHIFTIN1 => cdi,
      SHIFTIN2 => cti,
      SHIFTIN3 => '1',
      SHIFTIN4 => '1',
      SHIFTOUT1 => open,
      SHIFTOUT2 => open,
      SHIFTOUT3 => cdo,
      SHIFTOUT4 => cto,
      T1 => '0',
      T2 => '0',
      T3 => '0',
      T4 => '0',
      TCE => '1',
      RST => rst,
      TRAIN => '0'
    );

end behave;
