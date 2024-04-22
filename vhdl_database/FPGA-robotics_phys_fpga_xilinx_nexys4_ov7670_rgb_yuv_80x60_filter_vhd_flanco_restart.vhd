library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


library WORK;
use WORK.GRAL_PKG.ALL;
use WORK.VGA_PKG.ALL;
use WORK.OSC_PKG.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FLANCO is
  generic (
    g_signal_inactive   : std_logic := '0'
  );
  port (
    rst                 : in   std_logic;
    clk                 : in   std_logic;
    -- from the push buttom
    signal_level_i      : in   std_logic;
    -- edge detectetion
    signal_edge_o       : out  std_logic
  );
end FLANCO;

architecture BEHAVIORAL of FLANCO is

  signal signal_reg1, signal_reg2   : std_logic; 

  constant c_sig_off : std_logic := g_signal_inactive;
  constant c_sig_on  : std_logic := NOT(c_sig_off);

begin

  P_reg: process (rst, clk)
  begin
    if rst = c_on then
      signal_reg1 <= c_sig_off;
      signal_reg2 <= c_sig_off;
    elsif clk'event and clk='1' then
      signal_reg1 <= signal_level_i;
      signal_reg2 <= signal_reg1;
    end if;
  end process;

  signal_edge_o <= '1' when (signal_reg1 = c_sig_on AND signal_reg2 = c_sig_off)
                   else '0';

end Behavioral;

