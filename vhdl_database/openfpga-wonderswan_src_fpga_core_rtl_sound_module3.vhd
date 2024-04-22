library IEEE;
use IEEE.std_logic_1164.all;  
use IEEE.numeric_std.all;     

use work.pRegisterBus.all;
use work.pReg_swan.all;
use work.pBus_savestates.all;
use work.pReg_savestates.all; 

entity sound_module3 is
   port 
   (
      clk            : in  std_logic;
      ce             : in  std_logic;
      reset          : in  std_logic;
      
      useSweep       : in  std_logic;
                     
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

architecture arch of sound_module3 is

   -- register
   signal SND_CH_PITCH    : std_logic_vector(10 downto 0);
   signal SND_CH_Vol      : std_logic_vector( 7 downto 0);
   signal SND_SWEEP_VALUE : std_logic_vector( 7 downto 0);
   signal SND_SWEEP_TIME  : std_logic_vector( 4 downto 0);
   
   signal pitchWriteL     : std_logic;
   signal pitchWriteH     : std_logic;

   type t_reg_wired_or is array(0 to 4) of std_logic_vector(7 downto 0);
   signal reg_wired_or : t_reg_wired_or;   

   -- internal         
   signal pitchCount   : unsigned(10 downto 0);
   signal nextData     : unsigned(3 downto 0);
   signal sweepslow    : integer range 0 to 8191;
   signal sweepCounter : unsigned(4 downto 0);
   
   -- savestates
   signal SS_SOUND3      : std_logic_vector(REG_SAVESTATE_SOUND3.upper downto REG_SAVESTATE_SOUND3.lower);
   signal SS_SOUND3_BACK : std_logic_vector(REG_SAVESTATE_SOUND3.upper downto REG_SAVESTATE_SOUND3.lower);

begin 

   iREG_SND_CH_PITCH_L  : entity work.eReg generic map ( REG_SND_CH3_PITCH_L  ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(0), SND_CH_PITCH( 7 downto 0), open                     , pitchWriteL);  
   iREG_SND_CH_PITCH_H  : entity work.eReg generic map ( REG_SND_CH3_PITCH_H  ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(1), SND_CH_PITCH(10 downto 8), open                     , pitchWriteH);  
   iREG_SND_CH_Vol      : entity work.eReg generic map ( REG_SND_CH3_Vol      ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(2), SND_CH_Vol               , SND_CH_Vol               );  
   iREG_SND_SWEEP_VALUE : entity work.eReg generic map ( REG_SND_SWEEP_VALUE  ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(3), SND_SWEEP_VALUE          , SND_SWEEP_VALUE          );  
   iREG_SND_SWEEP_TIME  : entity work.eReg generic map ( REG_SND_SWEEP_TIME   ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(4), SND_SWEEP_TIME           , SND_SWEEP_TIME           );  
   
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
   iSS_SOUND3   : entity work.eReg_SS generic map ( REG_SAVESTATE_SOUND3 ) port map (clk, SSBUS_Din, SSBUS_Adr, SSBUS_wren, SSBUS_rst, SSBUS_Dout, SS_SOUND3_BACK, SS_SOUND3  );
   
   SS_SOUND3_BACK <= SND_CH_PITCH;
   
   process (clk)
      variable newPitchCount : unsigned(10 downto 0);
   begin
      if rising_edge(clk) then
      
         if (reset = '1') then
         
            SND_CH_PITCH  <= SS_SOUND3; 
      
            sampleposReq  <= (others => '0');           
            soundoutL     <= (others => '0');
            soundoutR     <= (others => '0');
            sampleRequest <= '1';
            
            pitchCount    <= (others => '0');
            nextData      <= (others => '0');
            sweepslow     <= 0;
            sweepCounter  <= (others => '0');
            
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
            
            -- sweep
            if (sweepslow = 8191) then
               sweepslow <= 0;
               if (useSweep = '1' and sweepCounter = 0) then
                  sweepCounter <= unsigned(SND_SWEEP_TIME);
                  SND_CH_PITCH <= std_logic_vector(to_unsigned(to_integer(unsigned(SND_CH_PITCH)) + to_integer(signed(SND_SWEEP_VALUE)), 11));
               else
                  sweepCounter <= sweepCounter - 1;
               end if;
            else
               sweepslow <= sweepslow + 1;
            end if;

            -- writing pitch from reg interface
            if (pitchWriteL = '1') then SND_CH_PITCH( 7 downto 0) <= RegBus_Din;             end if;
            if (pitchWriteH = '1') then SND_CH_PITCH(10 downto 8) <= RegBus_Din(2 downto 0); end if;

         end if;
      
      end if;
   end process;
  

end architecture;





