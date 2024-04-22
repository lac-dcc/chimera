library IEEE;
use IEEE.std_logic_1164.all;  
use IEEE.numeric_std.all; 

entity memctrl is
   port 
   (
      clk1x                : in  std_logic;
      ce                   : in  std_logic;
      reset                : in  std_logic;

      bus_addr             : in  unsigned(5 downto 0); 
      bus_dataWrite        : in  std_logic_vector(31 downto 0);
      bus_read             : in  std_logic;
      bus_write            : in  std_logic;
      bus_dataRead         : out std_logic_vector(31 downto 0);
      
      bus2_addr            : in  unsigned(3 downto 0); 
      bus2_dataWrite       : in  std_logic_vector(31 downto 0);
      bus2_read            : in  std_logic;
      bus2_write           : in  std_logic;
      bus2_dataRead        : out std_logic_vector(31 downto 0);
      
      errorBuswidth        : out std_logic;
      
      spu_memctrl          : out unsigned(13 downto 0);
      cd_memctrl           : out unsigned(13 downto 0);
      bios_memctrl         : out unsigned(13 downto 0);
      ex1_memctrl          : out unsigned(13 downto 0);
      ex2_memctrl          : out unsigned(13 downto 0);
      ex3_memctrl          : out unsigned(13 downto 0);
      
      com0_delay           : out unsigned(3 downto 0);
      com1_delay           : out unsigned(3 downto 0);
      com2_delay           : out unsigned(3 downto 0);
      com3_delay           : out unsigned(3 downto 0);
      
      dma_spu_timing_on    : out std_logic;
      dma_spu_timing_value : out unsigned(3 downto 0);
      
      loading_savestate    : in  std_logic;
      SS_reset             : in  std_logic;
      SS_DataWrite         : in  std_logic_vector(31 downto 0);
      SS_Adr               : in  unsigned(4 downto 0);
      SS_wren              : in  std_logic;
      SS_rden              : in  std_logic;
      SS_DataRead          : out std_logic_vector(31 downto 0)
   );
end entity;

architecture arch of memctrl is

   signal MC_RAMSIZE      : std_logic_vector(31 downto 0);
   signal MC_EXP1_BASE    : std_logic_vector(23 downto 0);
   signal MC_EXP2_BASE    : std_logic_vector(23 downto 0);
   signal MC_EXP1_DELAY   : std_logic_vector(31 downto 0);
   signal MC_EXP3_DELAY   : std_logic_vector(31 downto 0);
   signal MC_BIOS_DELAY   : std_logic_vector(31 downto 0);
   signal MC_SPU_DELAY    : std_logic_vector(31 downto 0);
   signal MC_CDROM_DELAY  : std_logic_vector(31 downto 0);
   signal MC_EXP2_DELAY   : std_logic_vector(31 downto 0);
   signal MC_COMMON_DELAY : std_logic_vector(31 downto 0);

   -- savestates
   type t_ssarray is array(0 to 31) of std_logic_vector(31 downto 0); 
   signal ss_out : t_ssarray := (others => (others => '0')); 

begin 

   errorBuswidth <= '1' when (MC_SPU_DELAY(12) = '0') else 
                    '0';
   
   spu_memctrl  <= unsigned(MC_SPU_DELAY(13 downto 0));
   cd_memctrl   <= unsigned(MC_CDROM_DELAY(13 downto 0));
   bios_memctrl <= unsigned(MC_BIOS_DELAY(13 downto 0));
   ex1_memctrl  <= unsigned(MC_EXP1_DELAY(13 downto 0));
   ex2_memctrl  <= unsigned(MC_EXP2_DELAY(13 downto 0));
   ex3_memctrl  <= unsigned(MC_EXP3_DELAY(13 downto 0));

   com0_delay   <= unsigned(MC_COMMON_DELAY( 3 downto  0));
   com1_delay   <= unsigned(MC_COMMON_DELAY( 7 downto  4));
   com2_delay   <= unsigned(MC_COMMON_DELAY(11 downto  8));
   com3_delay   <= unsigned(MC_COMMON_DELAY(15 downto 12));

   dma_spu_timing_on    <= MC_SPU_DELAY(29);
   dma_spu_timing_value <= unsigned(MC_SPU_DELAY(27 downto 24));

   ss_out(1)(23 downto 0) <= MC_EXP1_BASE;   
   ss_out(2)(23 downto 0) <= MC_EXP2_BASE;   
   ss_out(3) <= MC_EXP1_DELAY;  
   ss_out(4) <= MC_EXP3_DELAY;  
   ss_out(5) <= MC_BIOS_DELAY;  
   ss_out(6) <= MC_SPU_DELAY;   
   ss_out(7) <= MC_CDROM_DELAY; 
   ss_out(8) <= MC_EXP2_DELAY;  
   ss_out(9) <= MC_COMMON_DELAY;
                            
   ss_out(0) <= MC_RAMSIZE;     
   
   process (clk1x)
   begin
      if rising_edge(clk1x) then
      
         if (reset = '1' and loading_savestate = '0') then
               
            MC_RAMSIZE      <= x"00000B88";
            MC_EXP1_BASE    <= x"000000";
            MC_EXP2_BASE    <= x"802000";
            MC_EXP1_DELAY   <= x"0013243F";
            MC_EXP3_DELAY   <= x"00003022";
            MC_BIOS_DELAY   <= x"0013243F";
            MC_SPU_DELAY    <= x"200931E1";
            MC_CDROM_DELAY  <= x"00020843";
            MC_EXP2_DELAY   <= x"00070777";
            MC_COMMON_DELAY <= x"00031125";
            
         elsif (SS_wren = '1') then

            if (to_integer(SS_Adr) = 0) then MC_RAMSIZE      <= SS_DataWrite;              end if;
            if (to_integer(SS_Adr) = 1) then MC_EXP1_BASE    <= SS_DataWrite(23 downto 0); end if;
            if (to_integer(SS_Adr) = 2) then MC_EXP2_BASE    <= SS_DataWrite(23 downto 0); end if;
            if (to_integer(SS_Adr) = 3) then MC_EXP1_DELAY   <= SS_DataWrite;              end if;
            if (to_integer(SS_Adr) = 4) then MC_EXP3_DELAY   <= SS_DataWrite;              end if;
            if (to_integer(SS_Adr) = 5) then MC_BIOS_DELAY   <= SS_DataWrite;              end if;
            if (to_integer(SS_Adr) = 6) then MC_SPU_DELAY    <= SS_DataWrite;              end if;
            if (to_integer(SS_Adr) = 7) then MC_CDROM_DELAY  <= SS_DataWrite;              end if;
            if (to_integer(SS_Adr) = 8) then MC_EXP2_DELAY   <= SS_DataWrite;              end if;
            if (to_integer(SS_Adr) = 9) then MC_COMMON_DELAY <= SS_DataWrite;              end if;

         elsif (ce = '1') then
         
            bus_dataRead  <= (others => '0');
            bus2_dataRead <= (others => '0');

            -- bus read
            if (bus_read = '1') then
               case (to_integer(bus_addr(5 downto 2) & "00")) is
                  when 16#00# => bus_dataRead <= x"1F" & MC_EXP1_BASE;   
                  when 16#04# => bus_dataRead <= x"1F" & MC_EXP2_BASE;   
                  when 16#08# => bus_dataRead <= MC_EXP1_DELAY;  
                  when 16#0C# => bus_dataRead <= MC_EXP3_DELAY;  
                  when 16#10# => bus_dataRead <= MC_BIOS_DELAY;  
                  when 16#14# => bus_dataRead <= MC_SPU_DELAY;   
                  when 16#18# => bus_dataRead <= MC_CDROM_DELAY; 
                  when 16#1C# => bus_dataRead <= MC_EXP2_DELAY;  
                  when 16#20# => bus_dataRead <= MC_COMMON_DELAY; 
                  when others => bus_dataRead <= (others => '0');
               end case;
            end if;

            -- bus write
            if (bus_write = '1') then
               case (to_integer(bus_addr(5 downto 0))) is
                  when 16#00# => MC_EXP1_BASE   <= bus_dataWrite(23 downto 0);   
                  when 16#04# => MC_EXP2_BASE   <= bus_dataWrite(23 downto 0);   
                  when 16#08# => MC_EXP1_DELAY  <= bus_dataWrite(31) & MC_EXP1_DELAY (30) & bus_dataWrite(29) & MC_EXP1_DELAY (28) & bus_dataWrite(27 downto 24) & MC_EXP1_DELAY (23 downto 21) & bus_dataWrite(20 downto 0);  
                  when 16#0C# => MC_EXP3_DELAY  <= bus_dataWrite(31) & MC_EXP3_DELAY (30) & bus_dataWrite(29) & MC_EXP3_DELAY (28) & bus_dataWrite(27 downto 24) & MC_EXP3_DELAY (23 downto 21) & bus_dataWrite(20 downto 0);  
                  when 16#10# => MC_BIOS_DELAY  <= bus_dataWrite(31) & MC_BIOS_DELAY (30) & bus_dataWrite(29) & MC_BIOS_DELAY (28) & bus_dataWrite(27 downto 24) & MC_BIOS_DELAY (23 downto 21) & bus_dataWrite(20 downto 0);  
                  when 16#14# => MC_SPU_DELAY   <= bus_dataWrite(31) & MC_SPU_DELAY  (30) & bus_dataWrite(29) & MC_SPU_DELAY  (28) & bus_dataWrite(27 downto 24) & MC_SPU_DELAY  (23 downto 21) & bus_dataWrite(20 downto 0);   
                  when 16#18# => MC_CDROM_DELAY <= bus_dataWrite(31) & MC_CDROM_DELAY(30) & bus_dataWrite(29) & MC_CDROM_DELAY(28) & bus_dataWrite(27 downto 24) & MC_CDROM_DELAY(23 downto 21) & bus_dataWrite(20 downto 0); 
                  when 16#1C# => MC_EXP2_DELAY  <= bus_dataWrite(31) & MC_EXP2_DELAY (30) & bus_dataWrite(29) & MC_EXP2_DELAY (28) & bus_dataWrite(27 downto 24) & MC_EXP2_DELAY (23 downto 21) & bus_dataWrite(20 downto 0);  
                  when 16#20# => MC_COMMON_DELAY(17 downto 0) <= bus_dataWrite(17 downto 0); 
                  when others => null;
               end case;
            end if;
            
            -- bus2 read
            if (bus2_read = '1') then
               case (to_integer(bus2_addr(3 downto 0))) is
                  when 16#00# => bus2_dataRead <= MC_RAMSIZE;   
                  when others => bus2_dataRead <= (others => '1');
               end case;
            end if;

            -- bus2 write
            if (bus2_write = '1') then
               case (to_integer(bus2_addr(3 downto 0))) is
                  when 16#00# => MC_RAMSIZE <= bus2_dataWrite;  
                  when others => null;
               end case;
            end if;
            
         end if;
      end if;
   end process;
   
--##############################################################
--############################### savestates
--##############################################################
   
   process (clk1x)
   begin
      if (rising_edge(clk1x)) then
         
         if (SS_rden = '1') then
            SS_DataRead <= ss_out(to_integer(SS_Adr));
         end if;
      
      end if;
   end process;

end architecture;





