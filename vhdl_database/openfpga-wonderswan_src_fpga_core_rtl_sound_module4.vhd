library IEEE;
use IEEE.std_logic_1164.all;  
use IEEE.numeric_std.all;     

use work.pRegisterBus.all;
use work.pReg_swan.all;
use work.pBus_savestates.all;
use work.pReg_savestates.all; 

entity sound_module4 is
   port 
   (
      clk            : in  std_logic;
      ce             : in  std_logic;
      reset          : in  std_logic;
      
      useNoise       : in  std_logic;
                     
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
      soundoutR      : out signed(8 downto 0) := (others => '0');
      
      -- savestates        
      SSBUS_Din      : in  std_logic_vector(SSBUS_buswidth-1 downto 0);
      SSBUS_Adr      : in  std_logic_vector(SSBUS_busadr-1 downto 0);
      SSBUS_wren     : in  std_logic;
      SSBUS_rst      : in  std_logic;
      SSBUS_Dout     : out std_logic_vector(SSBUS_buswidth-1 downto 0)
   );
end entity;

architecture arch of sound_module4 is

   -- register
   signal SND_CH_PITCH  : std_logic_vector(10 downto 0);
   signal SND_CH_Vol    : std_logic_vector( 7 downto 0);
   signal SND_NOISE     : std_logic_vector( 4 downto 0);
   signal SND_RANDOM    : std_logic_vector(14 downto 0);
   
   signal noiseWrite       : std_logic;
   signal randomWriteL     : std_logic;
   signal randomWriteH     : std_logic;

   type t_reg_wired_or is array(0 to 5) of std_logic_vector(7 downto 0);
   signal reg_wired_or : t_reg_wired_or;   

   -- internal         
   signal pitchCount   : unsigned(10 downto 0);
   signal nextData     : unsigned(3 downto 0);
   signal lfsrOut      : std_logic;
   
   -- savestates
   signal SS_SOUND4      : std_logic_vector(REG_SAVESTATE_SOUND4.upper downto REG_SAVESTATE_SOUND4.lower);
   signal SS_SOUND4_BACK : std_logic_vector(REG_SAVESTATE_SOUND4.upper downto REG_SAVESTATE_SOUND4.lower);

begin 

   iREG_SND_CH_PITCH_L : entity work.eReg generic map ( REG_SND_CH4_PITCH_L  ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(0), SND_CH_PITCH( 7 downto 0), SND_CH_PITCH( 7 downto 0));  
   iREG_SND_CH_PITCH_H : entity work.eReg generic map ( REG_SND_CH4_PITCH_H  ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(1), SND_CH_PITCH(10 downto 8), SND_CH_PITCH(10 downto 8));  
   iREG_SND_CH_Vol     : entity work.eReg generic map ( REG_SND_CH4_Vol      ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(2), SND_CH_Vol               , SND_CH_Vol               );  
   iREG_SND_NOISE      : entity work.eReg generic map ( REG_SND_NOISE        ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(3), SND_NOISE                , open                     , noiseWrite  );  
   iREG_SND_RANDOM_H   : entity work.eReg generic map ( REG_SND_RANDOM_H     ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(4), SND_RANDOM( 7 downto 0)  , open                     , randomWriteL);  
   iREG_SND_RANDOM_L   : entity work.eReg generic map ( REG_SND_RANDOM_L     ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(5), SND_RANDOM(14 downto 8)  , open                     , randomWriteH);  
   
   process (reg_wired_or)
      variable wired_or : std_logic_vector(7 downto 0);
   begin
      wired_or := reg_wired_or(0);
      for i in 1 to (reg_wired_or'length - 1) loop
         wired_or := wired_or or reg_wired_or(i);
      end loop;
      RegBus_Dout <= wired_or;
   end process;
   
   -- savestates
   iSS_SOUND4   : entity work.eReg_SS generic map ( REG_SAVESTATE_SOUND4 ) port map (clk, SSBUS_Din, SSBUS_Adr, SSBUS_wren, SSBUS_rst, SSBUS_Dout, SS_SOUND4_BACK, SS_SOUND4  );
   
   SS_SOUND4_BACK(19 downto 15) <= SND_NOISE;
   SS_SOUND4_BACK(14 downto  0) <= SND_RANDOM;
   
   process (clk)
      variable newPitchCount : unsigned(10 downto 0);
      variable lfsrBit       : std_logic;
      variable lfsrResult    : std_logic;
   begin
      if rising_edge(clk) then
      
         if (reset = '1') then
         
            SND_NOISE     <= SS_SOUND4(19 downto 15);  
            SND_RANDOM    <= SS_SOUND4(14 downto  0);  
      
            sampleposReq  <= (others => '0');           
            soundoutL     <= (others => '0');
            soundoutR     <= (others => '0');
            sampleRequest <= '1';
            
            pitchCount    <= (others => '0');
            nextData      <= (others => '0');
            lfsrOut       <= '0';
            
         elsif (ce = '1') then

            newPitchCount := pitchCount - 1;
            pitchCount <= newPitchCount;
            if (newPitchCount = unsigned(SND_CH_PITCH)) then
               pitchCount    <= (others => '0');
               
               if (useNoise = '1') then
                  
                  if (lfsrOut = '1') then
                     soundoutL     <= signed('0' & (15 * unsigned(SND_CH_Vol(7 downto 4))));
                     soundoutR     <= signed('0' & (15 * unsigned(SND_CH_Vol(3 downto 0))));
                  else
                     soundoutL     <= (others => '0');
                     soundoutR     <= (others => '0');
                  end if;
                  
               else
                  sampleRequest <= '1';
                  sampleposReq  <= sampleposReq + 1;
                  soundoutL     <= signed('0' & (nextData * unsigned(SND_CH_Vol(7 downto 4))));
                  soundoutR     <= signed('0' & (nextData * unsigned(SND_CH_Vol(3 downto 0))));
               end if;
                  
               if (SND_NOISE(4) = '1') then
               
                  lfsrBit := '0';
                  case (to_integer(unsigned(SND_NOISE(2 downto 0)))) is 
                     when 0 => lfsrBit := SND_RANDOM(14);
                     when 1 => lfsrBit := SND_RANDOM(10);
                     when 2 => lfsrBit := SND_RANDOM(13);
                     when 3 => lfsrBit := SND_RANDOM( 4);
                     when 4 => lfsrBit := SND_RANDOM( 8);
                     when 5 => lfsrBit := SND_RANDOM( 6);
                     when 6 => lfsrBit := SND_RANDOM( 9);
                     when 7 => lfsrBit := SND_RANDOM(11);
                     when others => null;
                  end case;
                  
                  lfsrResult := '1' xor SND_RANDOM(7) xor lfsrBit;
                  SND_RANDOM <= SND_RANDOM(13 downto 0) & lfsrResult;
                  lfsrOut    <= lfsrResult;
               
               end if;

            end if;
            
            if (channelValid = '1') then
               sampleRequest <= '0';
               nextData      <= channelData;
            end if;
            
            -- register write
            if (noiseWrite = '1') then
               SND_NOISE <= RegBus_Din(4) & '0' & RegBus_Din(2 downto 0);
               if (RegBus_Din(3) = '1') then
                  SND_RANDOM <= (others => '0');
                  lfsrOut    <= '0';
               end if;
            end if;
            
            if (randomWriteL = '1') then SND_RANDOM( 7 downto 0) <= RegBus_Din; end if;
            if (randomWriteH = '1') then SND_RANDOM(14 downto 8) <= RegBus_Din(6 downto 0); end if;

         end if;
      
      end if;
   end process;
  

end architecture;





