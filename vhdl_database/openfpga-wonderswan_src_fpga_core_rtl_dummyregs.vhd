library IEEE;
use IEEE.std_logic_1164.all;  
use IEEE.numeric_std.all;     

use work.pRegisterBus.all;
use work.pReg_swan.all;

entity dummyregs is
   port 
   (
      clk            : in  std_logic;
      ce             : in  std_logic;
      reset          : in  std_logic;
      
      RegBus_Din     : in  std_logic_vector(BUS_buswidth-1 downto 0);
      RegBus_Adr     : in  std_logic_vector(BUS_busadr-1 downto 0);
      RegBus_wren    : in  std_logic;
      RegBus_rst     : in  std_logic;
      RegBus_Dout    : out std_logic_vector(BUS_buswidth-1 downto 0)
   );
end entity;

architecture arch of dummyregs is

   signal SER_DATA         : std_logic_vector(REG_SER_DATA  .upper downto REG_SER_DATA  .lower);
          
   signal SER_STATUS       : std_logic_vector(REG_SER_STATUS.upper downto REG_SER_STATUS.lower);
   signal SER_STATUS_read  : std_logic_vector(REG_SER_STATUS.upper downto REG_SER_STATUS.lower);
   
   type t_reg_wired_or is array(0 to 1) of std_logic_vector(7 downto 0);
   signal reg_wired_or : t_reg_wired_or;

begin 

   iREG_SER_DATA    : entity work.eReg generic map ( REG_SER_DATA   ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(0), SER_DATA,        SER_DATA  ); 
   iREG_SER_STATUS  : entity work.eReg generic map ( REG_SER_STATUS ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(1), SER_STATUS_read, SER_STATUS); 

   SER_STATUS_read <= SER_STATUS(7 downto 6) & "000100";

   process (reg_wired_or)
      variable wired_or : std_logic_vector(7 downto 0);
   begin
      wired_or := reg_wired_or(0);
      for i in 1 to (reg_wired_or'length - 1) loop
         wired_or := wired_or or reg_wired_or(i);
      end loop;
      RegBus_Dout <= wired_or;
   end process;

end architecture;





