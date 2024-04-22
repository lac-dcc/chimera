library IEEE;
use IEEE.std_logic_1164.all;  
use IEEE.numeric_std.all;     

use work.pRegisterBus.all;
use work.pBus_savestates.all;
use work.pReg_swan.all;

entity sound is
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
      
      RAM_addr       : out std_logic_vector(15 downto 0) := (others => '0');
      RAM_dataread   : in  std_logic_vector(15 downto 0);       
      RAM_valid      : in  std_logic;
      
      soundDMAvalue  : in  std_logic_vector(7 downto 0);
      soundDMACh2    : in  std_logic := '0';
      soundDMACh5    : in  std_logic := '0';
                     
      audio_l 	      : out std_logic_vector(15 downto 0); -- 16 bit signed
      audio_r 	      : out std_logic_vector(15 downto 0); -- 16 bit signed
         
      -- savestates        
      SSBUS_Din      : in  std_logic_vector(SSBUS_buswidth-1 downto 0);
      SSBUS_Adr      : in  std_logic_vector(SSBUS_busadr-1 downto 0);
      SSBUS_wren     : in  std_logic;
      SSBUS_rst      : in  std_logic;
      SSBUS_Dout     : out std_logic_vector(SSBUS_buswidth-1 downto 0)
   );
end entity;

architecture arch of sound is
   
   -- register 
   type t_reg_wired_or is array(0 to 7) of std_logic_vector(7 downto 0);
   signal reg_wired_or : t_reg_wired_or;
   
   signal SND_WAVE_BASE : std_logic_vector(REG_SND_WAVE_BASE.upper downto REG_SND_WAVE_BASE.lower) := (others => '0');
   signal SND_CTRL      : std_logic_vector(REG_SND_CTRL     .upper downto REG_SND_CTRL     .lower) := (others => '0');
   signal SND_OUTPUT    : std_logic_vector(REG_SND_OUTPUT   .upper downto REG_SND_OUTPUT   .lower) := (others => '0');
   
   signal SND_OUTPUT_BACK : std_logic_vector(REG_SND_OUTPUT   .upper downto REG_SND_OUTPUT   .lower) := (others => '0');
   
   -- memory access
   type tsamplepos is array(0 to 3) of unsigned(4 downto 0);
   signal samplepos   : tsamplepos;
   
   type tchannelData is array(0 to 3) of unsigned(3 downto 0); 
   signal channelData  : tchannelData;

   signal channelRRB      : unsigned(1 downto 0) := (others => '0');
   signal channelRRB_last : unsigned(1 downto 0) := (others => '0');
   signal sampleRequest   : std_logic_vector(0 to 3) := (others => '0');
   signal sampleRead      : std_logic_vector(0 to 3) := (others => '0');
   signal channelValid    : std_logic_vector(0 to 3) := (others => '0');
   
   -- internal
   type tsoundout is array(0 to 3) of signed(8 downto 0);
   signal soundoutL : tsoundout;
   signal soundoutR : tsoundout;
   
   signal soundEnable5 : std_logic;
   signal soundoutL5 : signed(12 downto 0);
   signal soundoutR5 : signed(12 downto 0);
   
   -- savestates
   type t_ss_wired_or is array(0 to 1) of std_logic_vector(63 downto 0);
   signal ss_wired_or : t_ss_wired_or;   

begin 

   iSND_WAVE_BASE : entity work.eReg generic map ( REG_SND_WAVE_BASE ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(0), SND_WAVE_BASE  , SND_WAVE_BASE);  
   iSND_CTRL      : entity work.eReg generic map ( REG_SND_CTRL      ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(1), SND_CTRL       , SND_CTRL     );  
   iSND_OUTPUT    : entity work.eReg generic map ( REG_SND_OUTPUT    ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(2), SND_OUTPUT_BACK, SND_OUTPUT   );  

   SND_OUTPUT_BACK <= '1' & "000" & SND_OUTPUT(3 downto 0);

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
   process (ss_wired_or)
      variable wired_or : std_logic_vector(63 downto 0);
   begin
      wired_or := ss_wired_or(0);
      for i in 1 to (ss_wired_or'length - 1) loop
         wired_or := wired_or or ss_wired_or(i);
      end loop;
      SSBUS_Dout <= wired_or;
   end process;
   
   -- memory access
   process (clk)
   begin
      if rising_edge(clk) then
      
         for i in 0 to 3 loop
            if (sampleRequest(i) = '0') then
               sampleRead(i)   <= '0';
               channelValid(i) <= '0';
            end if;
         end loop;
      
         if (RAM_valid = '1') then
            channelRRB_last <= channelRRB;
            channelRRB      <= channelRRB + 1;
            
            case (samplepos(to_integer(channelRRB_last))(1 downto 0)) is
               when "00" => channelData(to_integer(channelRRB_last)) <= unsigned(RAM_dataread( 3 downto  0));
               when "01" => channelData(to_integer(channelRRB_last)) <= unsigned(RAM_dataread( 7 downto  4));
               when "10" => channelData(to_integer(channelRRB_last)) <= unsigned(RAM_dataread(11 downto  8));
               when "11" => channelData(to_integer(channelRRB_last)) <= unsigned(RAM_dataread(15 downto 12));
               when others => null;
            end case;
               
            if (sampleRead(to_integer(channelRRB_last)) = '1') then
               channelValid(to_integer(channelRRB_last)) <= '1';
            end if;
            
            RAM_addr <= "00" & SND_WAVE_BASE & std_logic_vector(channelRRB) & std_logic_vector(samplepos(to_integer(channelRRB))(4 downto 2) & '0');
            sampleRead(to_integer(channelRRB)) <= sampleRequest(to_integer(channelRRB));
         end if;
      end if;
   end process;
   
   isound_module1 : entity work.sound_module1
   port map
   (
      clk            => clk,  
      ce             => ce,   
      reset          => reset,
                     
      RegBus_Din     => RegBus_Din, 
      RegBus_Adr     => RegBus_Adr, 
      RegBus_wren    => RegBus_wren,
      RegBus_rst     => RegBus_rst, 
      RegBus_Dout    => reg_wired_or(3),
      
      sampleRequest  => sampleRequest(0),
      sampleposReq   => samplepos(0),
      channelData    => channelData(0),  
      channelValid   => channelValid(0), 
                    
      soundoutL      => soundoutL(0),
      soundoutR      => soundoutR(0)
   );
   
   isound_module2 : entity work.sound_module2
   port map
   (
      clk            => clk,  
      ce             => ce,   
      reset          => reset,
      
      useVoice       => SND_CTRL(5),
      
      soundDMAvalue  => soundDMAvalue,
      soundDMAvalid  => soundDMACh2,  
      
      SSBUS_rst      => SSBUS_rst,  
                     
      RegBus_Din     => RegBus_Din, 
      RegBus_Adr     => RegBus_Adr, 
      RegBus_wren    => RegBus_wren,
      RegBus_rst     => RegBus_rst, 
      RegBus_Dout    => reg_wired_or(4),
      
      sampleRequest  => sampleRequest(1),
      sampleposReq   => samplepos(1),
      channelData    => channelData(1),  
      channelValid   => channelValid(1), 
                    
      soundoutL      => soundoutL(1),
      soundoutR      => soundoutR(1)
   );
   
   isound_module3 : entity work.sound_module3
   port map
   (
      clk            => clk,  
      ce             => ce,   
      reset          => reset,
      
      useSweep       => SND_CTRL(6),
                     
      RegBus_Din     => RegBus_Din, 
      RegBus_Adr     => RegBus_Adr, 
      RegBus_wren    => RegBus_wren,
      RegBus_rst     => RegBus_rst, 
      RegBus_Dout    => reg_wired_or(5),
      
      sampleRequest  => sampleRequest(2),
      sampleposReq   => samplepos(2),
      channelData    => channelData(2),  
      channelValid   => channelValid(2), 
                    
      soundoutL      => soundoutL(2),
      soundoutR      => soundoutR(2),
      
      -- savestates        
      SSBUS_Din      => SSBUS_Din,  
      SSBUS_Adr      => SSBUS_Adr,  
      SSBUS_wren     => SSBUS_wren, 
      SSBUS_rst      => SSBUS_rst,  
      SSBUS_Dout     => ss_wired_or(0)
   );
   
   isound_module4 : entity work.sound_module4
   port map
   (
      clk            => clk,  
      ce             => ce,   
      reset          => reset,
      
      useNoise       => SND_CTRL(7),
                     
      RegBus_Din     => RegBus_Din, 
      RegBus_Adr     => RegBus_Adr, 
      RegBus_wren    => RegBus_wren,
      RegBus_rst     => RegBus_rst, 
      RegBus_Dout    => reg_wired_or(6),
      
      sampleRequest  => sampleRequest(3),
      sampleposReq   => samplepos(3),
      channelData    => channelData(3),  
      channelValid   => channelValid(3), 
                    
      soundoutL      => soundoutL(3),
      soundoutR      => soundoutR(3),
      
      -- savestates        
      SSBUS_Din      => SSBUS_Din,  
      SSBUS_Adr      => SSBUS_Adr,  
      SSBUS_wren     => SSBUS_wren, 
      SSBUS_rst      => SSBUS_rst,  
      SSBUS_Dout     => ss_wired_or(1)
   );
   
   isound_module5 : entity work.sound_module5
   port map
   (
      clk            => clk,  
      ce             => ce,   
      reset          => reset,
      
      soundDMAvalue  => soundDMAvalue,
      soundDMAvalid  => soundDMACh5,  

      RegBus_Din     => RegBus_Din, 
      RegBus_Adr     => RegBus_Adr, 
      RegBus_wren    => RegBus_wren,
      RegBus_rst     => RegBus_rst, 
      RegBus_Dout    => reg_wired_or(7),

      soundEnable    => soundEnable5,
      soundoutL      => soundoutL5,
      soundoutR      => soundoutR5
   );
   
   process (clk)
      variable sampleLeft  : integer range -32768 to 32767;
      variable sampleRight : integer range -32768 to 32767;
   begin
      if rising_edge(clk) then
         if (reset = '1') then
         
            audio_l <= (others => '0');
            audio_r <= (others => '0');
            
         elsif (ce = '1') then
         
            sampleLeft  := 0;
            sampleRight := 0;
            
            if (SND_CTRL(0) = '1') then
               sampleLeft  := sampleLeft  + to_integer(soundoutL(0));
               sampleRight := sampleRight + to_integer(soundoutR(0));
            end if;
            
            if (SND_CTRL(1) = '1') then
               sampleLeft  := sampleLeft  + to_integer(soundoutL(1));
               sampleRight := sampleRight + to_integer(soundoutR(1));
            end if;
            
            if (SND_CTRL(2) = '1') then
               sampleLeft  := sampleLeft  + to_integer(soundoutL(2));
               sampleRight := sampleRight + to_integer(soundoutR(2));
            end if;
            
            if (SND_CTRL(3) = '1') then
               sampleLeft  := sampleLeft  + to_integer(soundoutL(3));
               sampleRight := sampleRight + to_integer(soundoutR(3));
            end if;
            
            if (soundEnable5 = '1') then
               sampleLeft  := sampleLeft  + to_integer(soundoutL5);
               sampleRight := sampleRight + to_integer(soundoutR5);
            end if;
            
            if (SND_OUTPUT(3) = '1') then -- headphonesEnable   
               audio_l <= std_logic_vector(to_signed(sampleLeft  * 16, 16));
               audio_r <= std_logic_vector(to_signed(sampleRight * 16, 16));
            elsif (SND_OUTPUT(0) = '1') then -- main speaker -> only used if game doesn't switch to headphones properly -> mono
               sampleLeft := sampleLeft + sampleRight;
               case (SND_OUTPUT(2 downto 1)) is
                  when "00" =>
                     audio_l <= std_logic_vector(to_signed(sampleLeft * 1, 16));
                     audio_r <= std_logic_vector(to_signed(sampleLeft * 1, 16));
                  when "01" =>
                     audio_l <= std_logic_vector(to_signed(sampleLeft * 2, 16));
                     audio_r <= std_logic_vector(to_signed(sampleLeft * 2, 16));
                  when "10" =>
                     audio_l <= std_logic_vector(to_signed(sampleLeft * 4, 16));
                     audio_r <= std_logic_vector(to_signed(sampleLeft * 4, 16));
                  when "11" =>
                     audio_l <= std_logic_vector(to_signed(sampleLeft * 8, 16));
                     audio_r <= std_logic_vector(to_signed(sampleLeft * 8, 16));
                  when others => null;
               end case;
            end if;
            
         end if;
      end if;
   end process;
   

end architecture;





