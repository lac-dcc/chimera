library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.pRegisterBus.all;
use work.pReg_swan.all;  
use work.pBus_savestates.all;
use work.pReg_savestates.all; 

entity dma is
   generic 
   (
      is_simu : std_logic := '0'
   );
   port
   (
      clk              : in  std_logic;
      ce               : in  std_logic;
      reset            : in  std_logic;
      isColor          : in  std_logic;
                       
      dma_active       : out std_logic;
      sdma_active      : out std_logic := '0';
      sdma_request     : out std_logic;
      cpu_idle         : in  std_logic;
                       
      bus_read         : out std_logic := '0';
      bus_write        : out std_logic := '0';
      bus_be           : out std_logic_vector(1 downto 0);
      bus_addr         : out unsigned(19 downto 0) := (others => '0');
      bus_datawrite    : out std_logic_vector(15 downto 0) := (others => '0');
      bus_dataread     : in  std_logic_vector(15 downto 0);
      
      -- sound DMA
      soundDMAvalue    : out std_logic_vector(7 downto 0);
      soundDMACh2      : out std_logic := '0';
      soundDMACh5      : out std_logic := '0';
     
      -- register
      RegBus_Din       : in  std_logic_vector(BUS_buswidth-1 downto 0);
      RegBus_Adr       : in  std_logic_vector(BUS_busadr-1 downto 0);
      RegBus_wren      : in  std_logic := '0';
      RegBus_rst       : in  std_logic;
      RegBus_Dout      : out std_logic_vector(BUS_buswidth-1 downto 0);
      
      -- savestates    
      sleep_savestate  : in  std_logic;      
      
      SSBUS_Din        : in  std_logic_vector(SSBUS_buswidth-1 downto 0);
      SSBUS_Adr        : in  std_logic_vector(SSBUS_busadr-1 downto 0);
      SSBUS_wren       : in  std_logic;
      SSBUS_rst        : in  std_logic;
      SSBUS_Dout       : out std_logic_vector(SSBUS_buswidth-1 downto 0)
   );
end entity;

architecture arch of dma is
   
   -- register
   signal DMA_SRC      : std_logic_vector(19 downto 0) := (others => '0');
   signal DMA_DST      : std_logic_vector(15 downto 0) := (others => '0');
   signal DMA_LEN      : std_logic_vector(15 downto 0) := (others => '0');
   signal DMA_CTRL     : std_logic_vector( 7 downto 0) := (others => '0');
   
   signal DMA_SRC_L_written : std_logic;
   signal DMA_SRC_M_written : std_logic;
   signal DMA_SRC_H_written : std_logic;
   signal DMA_DST_L_written : std_logic;
   signal DMA_DST_H_written : std_logic;
   signal DMA_LEN_L_written : std_logic;
   signal DMA_LEN_H_written : std_logic;
   signal DMA_CTRL_written  : std_logic;

   signal SDMA_SRC     : std_logic_vector(19 downto 0) := (others => '0');
   signal SDMA_LEN     : std_logic_vector(19 downto 0) := (others => '0');
   signal SDMA_CTRL    : std_logic_vector( 7 downto 0) := (others => '0');
   
   signal SDMA_CTRL_written  : std_logic;
   
   type t_reg_wired_or is array(0 to 14) of std_logic_vector(7 downto 0);
   signal reg_wired_or : t_reg_wired_or;
   
   -- internal
   type tState is
   (
      IDLE,
      WAITING,
      READING,
      WRITING,
      DONE,
      SDMA_READ,
      SDMA_READDONE
   );
   signal state : tState;
   
   signal dmaOn   : std_logic := '0';
   signal waitcnt : integer range 0 to 4;
   
   -- sound DMA
   signal SDMA_SRC_work : std_logic_vector(19 downto 0) := (others => '0');
   signal SDMA_LEN_work : std_logic_vector(19 downto 0) := (others => '0');
   signal sdmaSlow      : unsigned(9 downto 0); 
   signal sdma_requestIntern : std_logic;
   
   -- savestates
   type t_ss_wired_or is array(0 to 1) of std_logic_vector(63 downto 0);
   signal ss_wired_or : t_ss_wired_or;
   
   signal SS_DMA           : std_logic_vector(REG_SAVESTATE_DMA     .upper downto REG_SAVESTATE_DMA     .lower);
   signal SS_DMA_BACK      : std_logic_vector(REG_SAVESTATE_DMA     .upper downto REG_SAVESTATE_DMA     .lower);
   
   signal SS_SOUNDDMA      : std_logic_vector(REG_SAVESTATE_SOUNDDMA.upper downto REG_SAVESTATE_SOUNDDMA.lower);
   signal SS_SOUNDDMA_BACK : std_logic_vector(REG_SAVESTATE_SOUNDDMA.upper downto REG_SAVESTATE_SOUNDDMA.lower);

begin

   iREG_DMA_SRC_L  : entity work.eReg generic map ( REG_DMA_SRC_L  ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or( 0), DMA_SRC( 7 downto  0) , open, DMA_SRC_L_written  ); 
   iREG_DMA_SRC_M  : entity work.eReg generic map ( REG_DMA_SRC_M  ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or( 1), DMA_SRC(15 downto  8) , open, DMA_SRC_M_written  ); 
   iREG_DMA_SRC_H  : entity work.eReg generic map ( REG_DMA_SRC_H  ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or( 2), DMA_SRC(19 downto 16) , open, DMA_SRC_H_written  ); 
   iREG_DMA_DST_L  : entity work.eReg generic map ( REG_DMA_DST_L  ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or( 3), DMA_DST( 7 downto  0) , open, DMA_DST_L_written  ); 
   iREG_DMA_DST_H  : entity work.eReg generic map ( REG_DMA_DST_H  ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or( 4), DMA_DST(15 downto  8) , open, DMA_DST_H_written  ); 
   iREG_DMA_LEN_L  : entity work.eReg generic map ( REG_DMA_LEN_L  ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or( 5), DMA_LEN( 7 downto  0) , open, DMA_LEN_L_written  ); 
   iREG_DMA_LEN_H  : entity work.eReg generic map ( REG_DMA_LEN_H  ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or( 6), DMA_LEN(15 downto  8) , open, DMA_LEN_H_written  ); 
   iREG_DMA_CTRL   : entity work.eReg generic map ( REG_DMA_CTRL   ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or( 7), DMA_CTRL              , open, DMA_CTRL_written   );
   
   iREG_SDMA_SRC_L : entity work.eReg generic map ( REG_SDMA_SRC_L ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or( 8), SDMA_SRC_work( 7 downto  0), SDMA_SRC( 7 downto  0)); 
   iREG_SDMA_SRC_M : entity work.eReg generic map ( REG_SDMA_SRC_M ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or( 9), SDMA_SRC_work(15 downto  8), SDMA_SRC(15 downto  8)); 
   iREG_SDMA_SRC_H : entity work.eReg generic map ( REG_SDMA_SRC_H ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(10), SDMA_SRC_work(19 downto 16), SDMA_SRC(19 downto 16)); 
   iREG_SDMA_LEN_L : entity work.eReg generic map ( REG_SDMA_LEN_L ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(11), SDMA_LEN_work( 7 downto  0), SDMA_LEN( 7 downto  0)); 
   iREG_SDMA_LEN_M : entity work.eReg generic map ( REG_SDMA_LEN_M ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(12), SDMA_LEN_work(15 downto  8), SDMA_LEN(15 downto  8)); 
   iREG_SDMA_LEN_H : entity work.eReg generic map ( REG_SDMA_LEN_H ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(13), SDMA_LEN_work(19 downto 16), SDMA_LEN(19 downto 16)); 
   iREG_SDMA_CTRL  : entity work.eReg generic map ( REG_SDMA_CTRL  ) port map (clk, RegBus_Din, RegBus_Adr, RegBus_wren, RegBus_rst, reg_wired_or(14), SDMA_CTRL             , open, SDMA_CTRL_written  ); 

   process (reg_wired_or)
      variable wired_or : std_logic_vector(7 downto 0);
   begin
      wired_or := reg_wired_or(0);
      for i in 1 to (reg_wired_or'length - 1) loop
         wired_or := wired_or or reg_wired_or(i);
      end loop;
      RegBus_Dout <= wired_or;
   end process;
   
   dma_active   <= dmaOn;
   sdma_request <= sdma_requestIntern when is_simu = '0' else '0';
   
   bus_be <= "11";
   
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
   
   iSS_DMA        : entity work.eReg_SS generic map ( REG_SAVESTATE_DMA      ) port map (clk, SSBUS_Din, SSBUS_Adr, SSBUS_wren, SSBUS_rst, ss_wired_or(0), SS_DMA_BACK     , SS_DMA       );
   iSS_SOUNDDMA   : entity work.eReg_SS generic map ( REG_SAVESTATE_SOUNDDMA ) port map (clk, SSBUS_Din, SSBUS_Adr, SSBUS_wren, SSBUS_rst, ss_wired_or(1), SS_SOUNDDMA_BACK, SS_SOUNDDMA  );
   
   SS_DMA_BACK(15 downto  0) <= DMA_LEN; 
   SS_DMA_BACK(31 downto 16) <= DMA_DST; 
   SS_DMA_BACK(51 downto 32) <= DMA_SRC; 
   SS_DMA_BACK(59 downto 52) <= DMA_CTRL;
   
   
   SS_SOUNDDMA_BACK(19 downto  0) <= SDMA_LEN_work;
   SS_SOUNDDMA_BACK(31 downto 20) <= (31 downto 20 => '0');  --unused
   SS_SOUNDDMA_BACK(51 downto 32) <= SDMA_SRC_work;
   SS_SOUNDDMA_BACK(59 downto 52) <= SDMA_CTRL;
   
   
   process (clk)
      variable sdma_timerhit : std_logic;
   begin
      if rising_edge(clk) then
      
         bus_read  <= '0';
         bus_write <= '0';
                
         soundDMACh2 <= '0';
         soundDMACh5 <= '0';
         
         -- DMA
         if (sleep_savestate = '0') then
            if (DMA_SRC_L_written = '1') then DMA_SRC( 7 downto  1) <= RegBus_Din(7 downto 1); end if;
            if (DMA_SRC_M_written = '1') then DMA_SRC(15 downto  8) <= RegBus_Din; end if;
            if (DMA_SRC_H_written = '1') then DMA_SRC(19 downto 16) <= RegBus_Din(3 downto 0); end if;
            if (DMA_DST_L_written = '1') then DMA_DST( 7 downto  1) <= RegBus_Din(7 downto 1); end if;
            if (DMA_DST_H_written = '1') then DMA_DST(15 downto  8) <= RegBus_Din; end if;
            if (DMA_LEN_L_written = '1') then DMA_LEN( 7 downto  1) <= RegBus_Din(7 downto 1); end if;
            if (DMA_LEN_H_written = '1') then DMA_LEN(15 downto  8) <= RegBus_Din; end if;
         end if;
      
         if (DMA_CTRL_written = '1' and dmaOn = '0' and sleep_savestate = '0' and isColor = '1') then
            DMA_CTRL(7) <= RegBus_Din(7);
            DMA_CTRL(0) <= RegBus_Din(6);
            if (RegBus_Din(7) = '1') then
               if (unsigned(DMA_LEN) > 0 and DMA_SRC(19 downto 16) /= x"1") then
                  dmaOn   <= '1';
                  state   <= WAITING;
                  waitcnt <= 0;
               else
                  DMA_CTRL(7) <= '0';
               end if;
            end if;
         end if;
         
         -- SOUND DMA
         if (SDMA_CTRL_written = '1' and sleep_savestate = '0' and isColor = '1') then
            SDMA_CTRL <= RegBus_Din(7 downto 6) & '0' & RegBus_Din(4 downto 0);
            if (SDMA_CTRL(7) = '0' and RegBus_Din(7) = '1') then -- new start
               SDMA_SRC_work <= SDMA_SRC;
               SDMA_LEN_work <= SDMA_LEN;
               sdmaSlow      <= (others => '0');
               if (unsigned(SDMA_LEN) = 0) then
                  SDMA_CTRL(7) <= '0';
               end if;
            end if;
         end if;
      
         if (reset = '1') then
         
            DMA_LEN  <= SS_DMA(15 downto  0);
            DMA_DST  <= SS_DMA(31 downto 16);
            DMA_SRC  <= SS_DMA(51 downto 32);
            DMA_CTRL <= SS_DMA(59 downto 52);
              
            dmaOn <= '0';
            state <= IDLE;
         
            SDMA_LEN_work <= SS_SOUNDDMA(19 downto  0);
            SDMA_SRC_work <= SS_SOUNDDMA(51 downto 32);
            SDMA_CTRL     <= SS_SOUNDDMA(59 downto 52);

            sdma_active        <= '0';
            sdma_requestIntern <= '0';
            
            sdmaSlow <= (others => '0');
            
         elsif (ce = '1') then
            
            if (SDMA_CTRL(7) = '1') then
               sdmaSlow      <= sdmaSlow + 1;
               sdma_timerhit := '0';
               case (SDMA_CTRL(1 downto 0)) is
                  when "00" => if (sdmaSlow >= 767) then sdma_timerhit := '1'; end if;
                  when "01" => if (sdmaSlow >= 511) then sdma_timerhit := '1'; end if;
                  when "10" => if (sdmaSlow >= 255) then sdma_timerhit := '1'; end if;
                  when "11" => if (sdmaSlow >= 127) then sdma_timerhit := '1'; end if;
                  when others => null;
               end case;
               if (sdma_timerhit = '1') then
                  sdmaSlow           <= (others => '0');
                  sdma_requestIntern <= '1';
               end if;
            end if;
         
            case (state) is
         
               when IDLE =>
                  if (sdma_requestIntern = '1') then
                     if (cpu_idle = '1' or is_simu = '1') then
                        state         <= SDMA_READ;
                     end if;
                  end if;
                  
               when WAITING =>
                  if (waitcnt < 4) then
                     waitcnt <= waitcnt + 1;
                  else
                     state <= READING;
                  end if;
         
               when READING =>
                  state <= WRITING;
                  if (DMA_SRC(19 downto 16) /= x"1") then
                     bus_read <= '1';
                     bus_addr <= unsigned(DMA_SRC);
                  end if;
                  
               when WRITING =>
                  if (DMA_SRC(19 downto 16) /= x"1") then
                     bus_write     <= '1';
                     bus_addr      <= x"0" & unsigned(DMA_DST);
                     bus_datawrite <= bus_dataread;
                  end if;
                  DMA_LEN <= std_logic_vector(unsigned(DMA_LEN) - 2);
                  if (DMA_CTRL(0) = '1') then
                     DMA_SRC <= std_logic_vector(unsigned(DMA_SRC) - 2);
                     DMA_DST <= std_logic_vector(unsigned(DMA_DST) - 2);
                  else
                     DMA_SRC <= std_logic_vector(unsigned(DMA_SRC) + 2);
                     DMA_DST <= std_logic_vector(unsigned(DMA_DST) + 2);
                  end if;
                  if (unsigned(DMA_LEN) = 2) then
                     state       <= DONE;
                  else
                     state <= READING;
                  end if;
                  
               when DONE =>
                  state       <= IDLE;
                  dmaOn       <= '0';
                  DMA_CTRL(7) <= '0';
                  
               when SDMA_READ =>
                  state        <= SDMA_READDONE;
                  if (is_simu = '0') then
                     sdma_active   <= '1';
                     bus_read      <= '1';
                     bus_addr      <= unsigned(SDMA_SRC_work);
                  end if;
                  SDMA_LEN_work <= std_logic_vector(unsigned(SDMA_LEN_work) - 1);
                  if (SDMA_CTRL(6) = '1') then
                     SDMA_SRC_work <= std_logic_vector(unsigned(SDMA_SRC_work) - 1);
                  else
                     SDMA_SRC_work <= std_logic_vector(unsigned(SDMA_SRC_work) + 1);
                  end if;
               
               when SDMA_READDONE =>
                  state        <= IDLE;
                  sdma_requestIntern <= '0';
                  sdma_active  <= '0';
                  
                  soundDMAvalue <= bus_dataread(7 downto 0);
                  soundDMACh2   <= not SDMA_CTRL(4);
                  soundDMACh5   <= SDMA_CTRL(4);
                  
                  if (unsigned(SDMA_LEN_work) = 0) then
                     if (SDMA_CTRL(3) = '1') then
                        SDMA_SRC_work <= SDMA_SRC;
                        SDMA_LEN_work <= SDMA_LEN;
                     else
                        SDMA_CTRL(7) <= '0';
                     end if;
                  end if;

            end case;
            
         end if;
      end if;
   end process;
     

end architecture;












