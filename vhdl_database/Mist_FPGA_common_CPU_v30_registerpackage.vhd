-----------------------------------------------------------------
--------------- Bus Package --------------------------------
-----------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  
use IEEE.numeric_std.all;     

package pRegisterBus is

   constant BUS_buswidth : integer := 8;
   constant BUS_busadr   : integer := 8;
   
   type regaccess_type is
   (
      readwrite,
      readonly,
      writeonly,
      writeDone -- writeonly, but does send back done, so it is not dead
   );
   
   type regmap_type is record
      Adr         : integer range 0 to (2**BUS_busadr)-1;
      upper       : integer range 0 to BUS_buswidth-1;
      lower       : integer range 0 to BUS_buswidth-1;
      size        : integer range 0 to (2**BUS_busadr)-1;
      defval      : integer;
      acccesstype : regaccess_type;
   end record;
  
end package;


-----------------------------------------------------------------
--------------- Reg Interface  ----------------------------------
-----------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  
use IEEE.numeric_std.all;  

library work;
use work.pRegisterBus.all;

entity eReg is
   generic
   (
      Reg       : regmap_type;
      index     : integer := 0
   );
   port 
   (
      clk       : in    std_logic;
      BUS_Din   : in    std_logic_vector(BUS_buswidth-1 downto 0);
      BUS_Adr   : in    std_logic_vector(BUS_busadr-1 downto 0);
      BUS_wren  : in    std_logic;
      BUS_rst   : in    std_logic;
      BUS_Dout  : out   std_logic_vector(BUS_buswidth-1 downto 0) := (others => '0');
      Din       : in    std_logic_vector(Reg.upper downto Reg.lower);
      Dout      : out   std_logic_vector(Reg.upper downto Reg.lower);
      written   : out   std_logic := '0'
   );
end entity;

architecture arch of eReg is

   signal Dout_buffer : std_logic_vector(Reg.upper downto Reg.lower) := std_logic_vector(to_unsigned(Reg.defval,Reg.upper-Reg.lower+1));
    
   signal AdrI : std_logic_vector(BUS_Adr'left downto 0);
    
begin

   AdrI <= std_logic_vector(to_unsigned(Reg.Adr + index, BUS_Adr'length));

   process (clk)
   begin
      if rising_edge(clk) then
      
         if (BUS_rst = '1') then
         
            Dout_buffer <= std_logic_vector(to_unsigned(Reg.defval,Reg.upper-Reg.lower+1));
         
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
   
   written <= '1' when (BUS_Adr = AdrI and BUS_wren = '1') else '0';
   
   goutputbit: for i in Reg.lower to Reg.upper generate
      BUS_Dout(i) <= Din(i) when BUS_Adr = AdrI else '0';
   end generate;
   
   glowzero_required: if Reg.lower > 0 generate
      glowzero: for i in 0 to Reg.lower - 1 generate
         BUS_Dout(i) <= '0';
      end generate;
   end generate;
   
   ghighzero_required: if Reg.upper < BUS_buswidth-1 generate
      ghighzero: for i in Reg.upper + 1 to BUS_buswidth-1 generate
         BUS_Dout(i) <= '0';
      end generate;
   end generate;
   
end architecture;



