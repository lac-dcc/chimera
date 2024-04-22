-----------------------------------------------------------------
--------------- Bus Package --------------------------------
-----------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  
use IEEE.numeric_std.all;     

package pBus_savestates is

   constant SSBUS_buswidth : integer := 64;
   constant SSBUS_busadr   : integer := 7;
   
   type savestate_type is record
      Adr         : integer range 0 to (2**SSBUS_busadr)-1;
      upper       : integer range 0 to SSBUS_buswidth-1;
      lower       : integer range 0 to SSBUS_buswidth-1;
      size        : integer range 0 to (2**SSBUS_busadr)-1;
      defval      : std_logic_vector(SSBUS_buswidth-1 downto 0);
   end record;
  
end package;

-----------------------------------------------------------------
--------------- Reg Interface -----------------------------------
-----------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  
use IEEE.numeric_std.all;  

library work;
use work.pBus_savestates.all;

entity eReg_SS is
   generic
   (
      Reg       : savestate_type;
      index     : integer := 0
   );
   port 
   (
      clk       : in    std_logic;
      BUS_Din   : in    std_logic_vector(SSBUS_buswidth-1 downto 0);
      BUS_Adr   : in    std_logic_vector(SSBUS_busadr-1 downto 0);
      BUS_wren  : in    std_logic;
      BUS_rst   : in    std_logic;
      BUS_Dout  : out   std_logic_vector(SSBUS_buswidth-1 downto 0) := (others => '0');
      Din       : in    std_logic_vector(Reg.upper downto Reg.lower);
      Dout      : out   std_logic_vector(Reg.upper downto Reg.lower)
   );
end entity;

architecture arch of eReg_SS is

   signal Dout_buffer : std_logic_vector(Reg.upper downto Reg.lower) := Reg.defval(Reg.upper downto Reg.lower);
    
   signal AdrI : std_logic_vector(BUS_Adr'left downto 0);
    
begin

   AdrI <= std_logic_vector(to_unsigned(Reg.Adr + index, BUS_Adr'length));

   process (clk)
   begin
      if rising_edge(clk) then
      
         if (BUS_rst = '1') then
         
            Dout_buffer <= Reg.defval(Reg.upper downto Reg.lower);
         
         else
      
            if (BUS_Adr = AdrI and BUS_wren = '1') then
               for i in Reg.lower to Reg.upper loop
                  Dout_buffer(i) <= BUS_Din(i);  
               end loop;
            end if;
          
         end if;
         
      end if;
   end process;
   
   Dout <= Dout_buffer;
   
   goutputbit: for i in Reg.lower to Reg.upper generate
      BUS_Dout(i) <= Din(i) when BUS_Adr = AdrI else '0';
   end generate;
   
   glowzero_required: if Reg.lower > 0 generate
      glowzero: for i in 0 to Reg.lower - 1 generate
         BUS_Dout(i) <= '0';
      end generate;
   end generate;
   
   ghighzero_required: if Reg.upper < SSBUS_buswidth-1 generate
      ghighzero: for i in Reg.upper + 1 to SSBUS_buswidth-1 generate
         BUS_Dout(i) <= '0';
      end generate;
   end generate;

end architecture;


