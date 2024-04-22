library IEEE;
use IEEE.std_logic_1164.all;  
use IEEE.numeric_std.all;     

use work.pRegisterBus.all;
use work.pReg_swan.all;

entity sound_module1 is
   port 
   (
      clk            : in  std_logic;
      ce             : in  std_logic;
      reset          : in  std_logic;
                     
      RegBus_Din     : in  std_logic_vector(BUS_buswidth-1 downto 0);
      RegBus_Adr     : in  std_logic_vector(BUS_busadr-1 downto 0);
      RegBus_wren    : in  std_logic;
      RegBus_rst     : in  std_logic;
      RegBus_Dout    : out std_logic_vector(BUS_buswidth-1 downto 0);   

      sampleRequest  : out std_logic := '0';
      sampleposReq   : out unsigned(4 downto 0) := (others => '0');
      channelData    : in  unsigned(3 downto 0);
      channelValid   : in  std_logic;
      
      soundoutL      : out signed(8 downto 0) := (others => '0');
      soundoutR      : out signed(8 downto 0) := (others => '0')
   );
end entity;

architecture arch of sound_module1 is

   -- register
   signal SND_CH_PITCH  : std_logic_vector(10 downto 0);
   signal SND_CH_Vol    : std_logic_vector( 7 downto 0);

   type t_reg_wired_or is array(0 to 2) of std_logic_vector(7 downto 0);
   signal reg_wired_or : t_reg_wired_or;   

   -- internal         
   signal pitchCount   : unsigned(10 downto 0);
   signal nextData     : unsigned(3 downto 0);

begin 

   iREG_SND_CH_PITCH_L : entity work.eReg generic map ( REG_SND_CH1_PITCH_L  ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(0), SND_CH_PITCH( 7 downto 0), SND_CH_PITCH( 7 downto 0));  
   iREG_SND_CH_PITCH_H : entity work.eReg generic map ( REG_SND_CH1_PITCH_H  ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(1), SND_CH_PITCH(10 downto 8), SND_CH_PITCH(10 downto 8));  
   iREG_SND_CH_Vol     : entity work.eReg generic map ( REG_SND_CH1_Vol      ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(2), SND_CH_Vol               , SND_CH_Vol               );  
   
   process (reg_wired_or)
      variable wired_or : std_logic_vector(7 downto 0);
   begin
      wired_or := reg_wired_or(0);
      for i in 1 to (reg_wired_or'length - 1) loop
         wired_or := wired_or or reg_wired_or(i);
      end loop;
      RegBus_Dout <= wired_or;
   end process;
   
   process (clk)
      variable newPitchCount : unsigned(10 downto 0);
   begin
      if rising_edge(clk) then
      
         if (reset = '1') then
      
            sampleposReq  <= (others => '0');           
            soundoutL     <= (others => '0');
            soundoutR     <= (others => '0');
            sampleRequest <= '1';
            
            pitchCount    <= (others => '0');
            nextData      <= (others => '0');
            
         elsif (ce = '1') then

            newPitchCount := pitchCount - 1;
            pitchCount <= newPitchCount;
            if (newPitchCount = unsigned(SND_CH_PITCH)) then
               sampleRequest <= '1';
               pitchCount    <= (others => '0');
               sampleposReq  <= sampleposReq + 1;
               soundoutL     <= signed('0' & (nextData * unsigned(SND_CH_Vol(7 downto 4))));
               soundoutR     <= signed('0' & (nextData * unsigned(SND_CH_Vol(3 downto 0))));
            end if;
            
            if (channelValid = '1') then
               sampleRequest <= '0';
               nextData      <= channelData;
            end if;

         end if;
      
      end if;
   end process;
  

end architecture;





