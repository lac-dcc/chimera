library IEEE;
use IEEE.std_logic_1164.all;  
use IEEE.numeric_std.all; 

library mem;

entity dma is
   port 
   (
      clk1x                : in  std_logic;
      clk3x                : in  std_logic;
      clk3xIndex           : in  std_logic;
      ce                   : in  std_logic;
      reset                : in  std_logic;
      
      errorCHOP            : out std_logic;
      errorDMACPU          : out std_logic;
      errorDMAFIFO         : out std_logic;
      
      TURBO                : in  std_logic;
      TURBO_CACHE          : in  std_logic;
      ram8mb               : in  std_logic;
      ignoreCDTiming       : in  std_logic;
      
      canDMA               : in  std_logic;
      cpuPaused            : in  std_logic;
      dmaRequest           : out std_logic;
      dmaStallCPU          : out std_logic;
      dmaOn                : out std_logic;
      irqOut               : out std_logic := '0';
      
      ram_Adr              : out std_logic_vector(22 downto 0) := (others => '0');
      ram_cnt              : buffer std_logic_vector(1 downto 0) := (others => '0');
      ram_ena              : out std_logic := '0';
      
      dma_wr               : in  std_logic;
      dma_reqprocessed     : in  std_logic;
      dma_data             : in  std_logic_vector(31 downto 0);
      
      ram_dmafifo_adr      : out std_logic_vector(22 downto 0);
      ram_dmafifo_data     : out std_logic_vector(31 downto 0);
      ram_dmafifo_empty    : out std_logic;
      ram_dmafifo_read     : in  std_logic;
      
      dma_cache_Adr        : out std_logic_vector(20 downto 0);
      dma_cache_data       : out std_logic_vector(31 downto 0);
      dma_cache_write      : out std_logic;
      
      gpu_dmaRequest       : in  std_logic;
      DMA_GPU_waiting      : out std_logic := '0';
      DMA_GPU_writeEna     : out std_logic := '0';
      DMA_GPU_readEna      : out std_logic := '0';
      DMA_GPU_write        : out std_logic_vector(31 downto 0);
      DMA_GPU_read         : in  std_logic_vector(31 downto 0);
      
      mdec_dmaWriteRequest : in  std_logic;
      mdec_dmaReadRequest  : in  std_logic;
      DMA_MDEC_writeEna    : out std_logic := '0';
      DMA_MDEC_readEna     : out std_logic := '0';
      DMA_MDEC_write       : out std_logic_vector(31 downto 0);
      DMA_MDEC_read        : in  std_logic_vector(31 downto 0);      
      
      cd_memctrl           : in  unsigned(13 downto 0);
      com0_delay           : in  unsigned(3 downto 0);
      DMA_CD_readEna       : out std_logic := '0';
      DMA_CD_read          : in  std_logic_vector(7 downto 0);
      
      spu_timing_on        : in  std_logic;
      spu_timing_value     : in  unsigned(3 downto 0);
      
      spu_dmaRequest       : in  std_logic;
      DMA_SPU_writeEna     : out std_logic := '0';
      DMA_SPU_readEna      : out std_logic := '0';
      DMA_SPU_write        : out std_logic_vector(15 downto 0);
      DMA_SPU_read         : in  std_logic_vector(15 downto 0);
      
      bus_addr             : in  unsigned(6 downto 0); 
      bus_dataWrite        : in  std_logic_vector(31 downto 0);
      bus_read             : in  std_logic;
      bus_write            : in  std_logic;
      bus_dataRead         : out std_logic_vector(31 downto 0);
      
      loading_savestate    : in  std_logic;
      SS_reset             : in  std_logic;
      SS_DataWrite         : in  std_logic_vector(31 downto 0);
      SS_Adr               : in  unsigned(5 downto 0);
      SS_wren              : in  std_logic;
      SS_rden              : in  std_logic;
      SS_DataRead          : out std_logic_vector(31 downto 0);
      SS_idle              : out std_logic
   );
end entity;

architecture arch of dma is

   type tdmaState is
   (
      OFF,
      STARTING,
      READHEADER,
      SLOWDOWN,
      WORKING,
      STOPPING,
      PAUSING
   );
   signal dmaState : tdmaState := OFF;

   type dmaRecord is record
      D_MADR            : unsigned(23 downto 0);
      D_BCR             : unsigned(31 downto 0);
      D_CHCR            : unsigned(31 downto 0);
      request           : std_logic;
      timeupPending     : std_logic;
      requestsPending   : std_logic;
      channelOn         : std_logic;
      chopwaiting       : std_logic;
      chopwaitcount     : unsigned(7 downto 0);
   end record;
  
   type tdmaArray is array (0 to 6) of dmaRecord;
   signal dmaArray    : tdmaArray;
   signal dmaSettings : dmaRecord;
  
   signal DPCR                : unsigned(31 downto 0);
   signal DICR                : unsigned(23 downto 0);
   signal DICR_readback       : unsigned(31 downto 0);
   signal DICR_IRQs           : unsigned(6 downto 0);
         
   signal triggerDMA          : std_logic_vector(6 downto 0);
   signal triggerchannel      : integer range 0 to 6;
      
   signal readStall           : std_logic;
      
   signal wordAccu            : integer range 0 to 3 := 0;
   signal DMA_CD_read_accu    : std_logic_vector(23 downto 0);
   signal DMA_SPU_read_accu   : std_logic_vector(15 downto 0);
   signal slowcnt             : integer range 0 to 24;
      
   signal isOn                : std_logic;
   signal activeChannel       : integer range 0 to 6;
   signal paused              : std_logic;
   signal gpupaused           : std_logic;
   signal wordcount           : unsigned(16 downto 0);
   signal toDevice            : std_logic;
   signal directionNeg        : std_logic;
   signal nextAddr            : std_logic_vector(23 downto 0);
   signal blocksleft          : unsigned(15 downto 0);
         
   signal chopsize            : unsigned(7 downto 0);
   signal chopwaittime        : unsigned(7 downto 0);
        
   signal autoread            : std_logic := '0';
   signal useDataDirect       : std_logic := '0';
   
   signal requestedDwords     : integer range 0 to 65536;
   signal requiredDwords      : integer range 0 to 65536;
      
   signal fifoIn_reset        : std_logic := '0';
   signal fifoIn_Din          : std_logic_vector(31 downto 0);
   signal fifoIn_Wr           : std_logic; 
   signal fifoIn_Full         : std_logic;
   signal fifoIn_Dout         : std_logic_vector(31 downto 0);
   signal fifoIn_Rd           : std_logic;
   signal fifoIn_Empty        : std_logic;
   signal fifoIn_Valid        : std_logic;   
   signal fifoIn_Valid_1      : std_logic;   
      
   signal fifoOut_reset       : std_logic := '0';
   signal fifoOut_Din         : std_logic_vector(52 downto 0);
   signal fifoOut_Wr          : std_logic; 
   signal fifoOut_Wr_3x       : std_logic; 
   signal fifoOut_Full        : std_logic;
   signal fifoOut_NearFull_3x : std_logic;
   signal fifoOut_NearFull    : std_logic;
   signal fifoOut_Dout        : std_logic_vector(52 downto 0);
   signal fifoOut_Empty       : std_logic;
   signal fifoOut_NearEmpty_3x: std_logic;
   signal fifoOut_NearEmpty   : std_logic;
      
   -- REPRODUCIBLEDMATIMING   
   signal REP_counter         : integer range 0 to 1048575;
   signal REP_target          : integer range 0 to 1048575;
   signal REP_refresh         : integer range 0 to 127;
   signal REP_required        : std_logic;
   
   -- savestates
   type t_ssarray is array(0 to 63) of std_logic_vector(31 downto 0);
   signal ss_out  : t_ssarray := (others => (others => '0'));  
  
begin 

   toDevice <= dmaSettings.D_CHCR(0);

   ram_cnt <= "00" when (directionNeg = '1' and ram_adr(9 downto 2) = x"01") else
              "01" when (directionNeg = '1' and ram_adr(9 downto 2) = x"02") else
              "10" when (directionNeg = '1' and ram_adr(9 downto 2) = x"03") else
              "00" when (directionNeg = '0' and ram_adr(9 downto 2) = x"FF") else
              "01" when (directionNeg = '0' and ram_adr(9 downto 2) = x"FE") else
              "10" when (directionNeg = '0' and ram_adr(9 downto 2) = x"FD") else
              "11";

   dmaOn <= '0' when ((dmaState = STOPPING or dmaState = PAUSING) and fifoOut_NearEmpty = '1' and (TURBO = '1' or REP_counter >= REP_target)) else
            '1' when (dmaState /= OFF) else 
            '0';
            
   DICR_readback( 5 downto  0) <= DICR( 5 downto 0);
   DICR_readback(14 downto  6) <= "000000000";
   DICR_readback(23 downto 15) <= DICR(23 downto 15);
   DICR_readback(30 downto 24) <= DICR_IRQs;
   DICR_readback(31)           <= '1' when (DICR(15) = '1') else
                                  '1' when (DICR(23) = '1' and (DICR(22 downto 16) and DICR_IRQs) /= "0000000") else 
                                  '0';
   
   DMA_MDEC_readEna  <= '1' when (dmaState = WORKING and fifoOut_NearFull = '0' and activeChannel = 1 and toDevice = '0') else '0';
   
   DMA_GPU_waiting   <= '1' when (dmaOn = '1' and activeChannel = 2) else
                        '1' when (DPCR((2 * 4) + 3) = '1' and dmaArray(2).D_CHCR(24) = '1') else 
                        '0';
                        
   DMA_GPU_readEna   <= '1' when (dmaState = WORKING and fifoOut_NearFull = '0' and activeChannel = 2 and toDevice = '0') else '0';

   DMA_CD_readEna    <= '1' when (dmaState = WORKING and fifoOut_NearFull = '0' and activeChannel = 3 and toDevice = '0') else '0';
   
   DMA_SPU_readEna   <= '1' when (dmaState = WORKING and fifoOut_NearFull = '0' and activeChannel = 4 and toDevice = '0') else '0';

   readStall <= '1' when (activeChannel = 2 and toDevice = '0' and gpu_dmaRequest = '0') else '0';

   chopsize     <= to_unsigned(1, 8) sll to_integer(dmaSettings.D_CHCR(18 downto 16));
   chopwaittime <= to_unsigned(1, 8) sll to_integer(dmaSettings.D_CHCR(22 downto 20));

   gSSout: for i in 0 to 6 generate
   begin
      ss_out(28 + i)(23 downto 0) <= std_logic_vector(dmaArray(i).D_MADR);        
      ss_out(35 + i)              <= std_logic_vector(dmaArray(i).D_BCR);          
      ss_out(42 + i)              <= std_logic_vector(dmaArray(i).D_CHCR);         
      ss_out(19 + i)(8)           <= dmaArray(i).request;        
      ss_out(19 + i)(9)           <= dmaArray(i).requestsPending;
      ss_out(19 + i)(10)          <= dmaArray(i).timeupPending;  
      ss_out(19 + i)(11)          <= dmaArray(i).channelOn;  
   end generate;

   ss_out(26)               <= std_logic_vector(DPCR);     
   ss_out(27)(23 downto 0)  <= std_logic_vector(DICR);    
   ss_out(27)(30 downto 24) <= std_logic_vector(DICR_IRQs);
   ss_out(27)(31)           <= DICR_readback(31);

   ss_out(4)(7 downto 0)    <= x"07" when (DMA_GPU_waiting = '1') else x"00";
   ss_out(4)(8)             <= isOn;         
   ss_out(2)(18 downto 16)  <= std_logic_vector(to_unsigned(activeChannel, 3));       
   ss_out(4)(9)             <= paused;       
   ss_out(4)(10)            <= gpupaused;    

   process (clk1x)
      variable channel         : integer range 0 to 7;
      variable triggerNew      : std_logic;
      variable triggerPrio     : unsigned(2 downto 0);
      variable checkIRQ        : std_logic;
      variable addtime         : integer range 0 to 511;
   begin
      if rising_edge(clk1x) then
      
         fifoIn_reset  <= '0';
         fifoOut_reset <= '0';
         
         fifoOut_Wr    <= '0';
         
         fifoIn_Valid   <= fifoIn_Rd;
         fifoIn_Valid_1 <= fifoIn_Valid;
      
         if (cpuPaused = '1') then
            REP_counter <= REP_counter + 1;
         else
            REP_counter <= 0;
         end if;
         
         errorCHOP      <= '0';
         errorDMACPU    <= '0';
         errorDMAFIFO   <= '0';
      
         fifoOut_NearFull  <= fifoOut_NearFull_3x;
         fifoOut_NearEmpty <= fifoOut_NearEmpty_3x;
      
         if (reset = '1') then
         
            if (loading_savestate = '0') then

               for i in 0 to 6 loop
                  dmaArray(i).D_MADR            <= (others => '0');
                  dmaArray(i).D_BCR             <= (others => '0');
                  dmaArray(i).D_CHCR            <= (others => '0');
                  dmaArray(i).request           <= '0';
                  dmaArray(i).requestsPending   <= '0';
                  dmaArray(i).timeupPending     <= '0';
                  dmaArray(i).channelOn         <= '0';
               end loop;
               
               DPCR           <= x"07654321";
               DICR           <= (others => '0');
               DICR_IRQs      <= (others => '0');
                  
               isOn           <= '0';
               activeChannel  <= 0;
               paused         <= '0';
               gpupaused      <= '0';
            
            end if;
            
            dmaState       <= OFF;
            autoread       <= '0';
            fifoIn_reset   <= '1';
            fifoOut_reset  <= '1';
            irqOut         <= '0';
            triggerDMA     <= (others => '0');
            
            for i in 0 to 6 loop
               dmaArray(i).chopwaiting       <= '0';
               dmaArray(i).chopwaitcount     <= (others => '0');
            end loop;
            
         elsif (SS_wren = '1') then
         
               for i in 0 to 6 loop
                  if (to_integer(SS_Adr) = (28 + i)) then dmaArray(i).D_MADR            <= unsigned(SS_DataWrite(23 downto 0)); end if;
                  if (to_integer(SS_Adr) = (35 + i)) then dmaArray(i).D_BCR             <= unsigned(SS_DataWrite);              end if;
                  if (to_integer(SS_Adr) = (42 + i)) then dmaArray(i).D_CHCR            <= unsigned(SS_DataWrite);              end if;
                  if (to_integer(SS_Adr) = (19 + i)) then dmaArray(i).request           <= SS_DataWrite(8);                     end if;
                  if (to_integer(SS_Adr) = (19 + i)) then dmaArray(i).requestsPending   <= SS_DataWrite(9);                     end if;
                  if (to_integer(SS_Adr) = (19 + i)) then dmaArray(i).timeupPending     <= SS_DataWrite(10);                    end if;
                  if (to_integer(SS_Adr) = (19 + i)) then dmaArray(i).channelOn         <= SS_DataWrite(11);                    end if;
               end loop;
               
               if (to_integer(SS_Adr) = 26) then DPCR           <= unsigned(SS_DataWrite);                           end if;
               if (to_integer(SS_Adr) = 27) then DICR           <= unsigned(SS_DataWrite(23 downto 0));              end if;
               if (to_integer(SS_Adr) = 27) then DICR_IRQs      <= unsigned(SS_DataWrite(30 downto 24));             end if;
                                                                                                                    
               if (to_integer(SS_Adr) =  4) then isOn           <= SS_DataWrite(8);                                  end if;
               if (to_integer(SS_Adr) =  2) then activeChannel  <= to_integer(unsigned(SS_DataWrite(18 downto 16))); end if;
               if (to_integer(SS_Adr) =  4) then paused         <= SS_DataWrite(9);                                  end if;
               if (to_integer(SS_Adr) =  4) then gpupaused      <= SS_DataWrite(10);                                 end if;

         elsif (ce = '1') then
         
            irqOut               <= '0';
            ram_ena              <= '0';
            
            DMA_MDEC_writeEna    <= '0';
            DMA_GPU_writeEna     <= '0';
            DMA_SPU_writeEna     <= '0';           
            if (fifoIn_Valid_1 = '1' and DMA_SPU_writeEna = '1') then
               DMA_SPU_writeEna <= '1';
               DMA_SPU_write    <= fifoIn_Dout(31 downto 16);
            end if;
         
            bus_dataRead         <= (others => '0');

            channel := to_integer(unsigned(bus_addr(6 downto 4)));
            
            dmaArray(0).request <= mdec_dmaWriteRequest;
            dmaArray(1).request <= mdec_dmaReadRequest;
            dmaArray(2).request <= gpu_dmaRequest;
            dmaArray(3).request <= '1';
            dmaArray(4).request <= spu_dmaRequest;
            dmaArray(5).request <= '0';
            dmaArray(6).request <= '1';
            
            -- triggers from modules
            triggerDMA <= (others => '0');
            if (dmaArray(0).D_CHCR(28) = '1' or mdec_dmaWriteRequest = '1')  then triggerDMA(0) <= '1'; end if;
            if (dmaArray(1).D_CHCR(28) = '1' or mdec_dmaReadRequest = '1')   then triggerDMA(1) <= '1'; end if;
            if (dmaArray(2).D_CHCR(28) = '1' or gpu_dmaRequest = '1')        then triggerDMA(2) <= '1'; end if;
            if (dmaArray(3).D_CHCR(28) = '1')                                then triggerDMA(3) <= '1'; end if;
            if (dmaArray(4).D_CHCR(28) = '1' or spu_dmaRequest = '1')        then triggerDMA(4) <= '1'; end if;
            if (dmaArray(6).D_CHCR(28) = '1')                                then triggerDMA(6) <= '1'; end if;
            
            -- bus read
            if (bus_read = '1') then
               if (channel < 7) then
                  case (bus_addr(3 downto 2)) is
                     when "00" => bus_dataRead <= x"00" & std_logic_vector(dmaArray(channel).D_MADR);
                     when "01" => bus_dataRead <= std_logic_vector(dmaArray(channel).D_BCR); 
                     when "10" => bus_dataRead <= std_logic_vector(dmaArray(channel).D_CHCR);
                     when others => bus_dataRead <= (others => '1');
                  end case;
               else
                  case (bus_addr(3 downto 2)) is
                     when "00" => bus_dataRead <= std_logic_vector(DPCR);
                     when "01" => bus_dataRead <= std_logic_vector(DICR_readback); 
                     when others => bus_dataRead <= (others => '1');
                  end case;
               end if;
            end if;

            -- bus write
            if (bus_write = '1') then
               if (channel < 7) then
                  case (bus_addr(3 downto 2)) is
                     when "00" => dmaArray(channel).D_MADR <= unsigned(bus_dataWrite(23 downto 0));
                     when "01" => dmaArray(channel).D_BCR  <= unsigned(bus_dataWrite);
                     when "10" =>  -- todo: channel 6 has only 3 r/w bits
                        dmaArray(channel).D_CHCR( 1 downto  0) <= unsigned(bus_dataWrite( 1 downto  0));
                        dmaArray(channel).D_CHCR(10 downto  8) <= unsigned(bus_dataWrite(10 downto  8));
                        dmaArray(channel).D_CHCR(18 downto 16) <= unsigned(bus_dataWrite(18 downto 16));
                        dmaArray(channel).D_CHCR(22 downto 20) <= unsigned(bus_dataWrite(22 downto 20));
                        dmaArray(channel).D_CHCR(          24) <= bus_dataWrite(24);
                        dmaArray(channel).D_CHCR(30 downto 28) <= unsigned(bus_dataWrite(30 downto 28));
                        if (bus_dataWrite(24) = '0') then
                           dmaArray(channel).channelOn <= '0';
                        end if;
                        triggerDMA(channel) <= '0';
                        
                        if (channel = 2 and bus_dataWrite(10 downto 9) = "10") then
                           dmaArray(2).chopwaiting   <= '1';
                           dmaArray(2).chopwaitcount <= x"0A";
                        end if;
                        
                     when others => null;
                  end case;
               else
                  case (bus_addr(3 downto 2)) is
                     when "00" => 
                        DPCR       <= unsigned(bus_dataWrite);
                     when "01" => 
                        DICR( 5 downto  0) <= unsigned(bus_dataWrite(5 downto 0));
                        DICR(14 downto  6) <= (14 downto 6 => '0');
                        DICR(          15) <= bus_dataWrite(15);
                        DICR(23 downto 16) <= unsigned(bus_dataWrite(23 downto 16));
                        DICR_IRQs          <= DICR_IRQs and (not unsigned(bus_dataWrite(30 downto 24)));
                        if (bus_dataWrite(15) = '1') then  -- force bit not used in duckstation, why?
                           irqOut <= '1';
                        end if;
                     when others => null;
                  end case;
               end if;
            end if;
             
            -- trigger
            triggerNew     := '0';
            triggerPrio    := "111";
            if (dmaState = OFF and bus_write = '0' and bus_read = '0') then
               for i in 0 to 6 loop
                  if (triggerDMA(i) = '1' and dmaArray(i).chopwaiting = '0') then
                     if ((DPCR((i * 4) + 3) = '1' and dmaArray(i).D_CHCR(24) = '1') or dmaArray(i).channelOn = '1') then -- enable + start or already on(retrigger after busy)
                        
                        if (triggerNew = '0' or (unsigned(DPCR((i * 4) + 2 downto (i*4))) <= triggerPrio)) then
                           triggerNew     := '1';
                           triggerchannel <= i;
                           triggerPrio    := unsigned(DPCR((i * 4) + 2 downto (i*4)));
                        end if;
                           
                     end if;
                  end if;
               end loop;
            end if;
            dmaRequest <= triggerNew;
            
            -- accu
            if (DMA_CD_readEna = '1') then
               case (wordAccu) is
                  when 0 => wordAccu <= 3; 
                  when 1 => wordAccu <= 0; DMA_CD_read_accu(23 downto 16) <= DMA_CD_read;
                  when 2 => wordAccu <= 1; DMA_CD_read_accu(15 downto  8) <= DMA_CD_read;
                  when 3 => wordAccu <= 2; DMA_CD_read_accu( 7 downto  0) <= DMA_CD_read;
                  when others => null;
               end case;
            end if;
            
            if (DMA_SPU_readEna = '1') then
               case (wordAccu) is
                  when 0 => wordAccu <= 1; 
                  when 1 => wordAccu <= 0; DMA_SPU_read_accu <= DMA_SPU_read;
                  when others => null;
               end case;
            end if;
            
            -- chopping wait
            for i in 0 to 6 loop
               if (dmaArray(i).chopwaiting = '1' and cpuPaused = '0') then
                  if (dmaArray(i).chopwaitcount > 1) then
                     dmaArray(i).chopwaitcount <= dmaArray(i).chopwaitcount - 1;
                  else
                     dmaArray(i).chopwaiting   <= '0';
                     dmaArray(i).chopwaitcount <= (others => '0');
                  end if;
               end if;
            end loop;
            
            if (dmaState /= OFF and (bus_write = '1' or bus_read = '1')) then
               errorDMACPU <= '1';
            end if;
            
            if (fifoIn_Full = '1' or fifoOut_Full = '1') then
               errorDMAFIFO <= '1';
            end if;
            
            
            if (dmaState = WORKING and TURBO_CACHE = '1' and toDevice = '0') then
               dmaStallCPU <= '1';
            elsif (fifoOut_Empty = '1') then
               dmaStallCPU <= '0';
            end if;
            
            case (dmaState) is
            
               when OFF => 
                  fifoIn_reset    <= '1';
                  requestedDwords <= 0;
                  
                  if (dmaRequest = '1' and canDMA = '1') then
                     dmaArray(triggerchannel).requestsPending <= '0';
                     dmaArray(triggerchannel).timeupPending   <= '0';
                     dmaArray(triggerchannel).D_CHCR(28)      <= '0';
                     dmaArray(triggerchannel).channelOn       <= '1';
                     
                     dmaState      <= STARTING;
                     isOn          <= '1';
                     activeChannel <= triggerchannel;
                     
                     REP_refresh   <= 0;
                     
                     dmaSettings.D_CHCR <= dmaArray(triggerchannel).D_CHCR;
                     dmaSettings.D_MADR <= dmaArray(triggerchannel).D_MADR;
                     dmaSettings.D_BCR  <= dmaArray(triggerchannel).D_BCR;
                     
                     if (dmaArray(triggerchannel).D_CHCR(0) = '1') then
                        ram_ena  <= '1';
                        ram_Adr  <= std_logic_vector(dmaArray(triggerchannel).D_MADR(22 downto 2)) & "00";
                     end if;
                     
                     directionNeg <= '0';
                     if (dmaArray(triggerchannel).D_CHCR(10) = '0' and dmaArray(triggerchannel).D_CHCR(1) = '1') then
                        directionNeg <= '1';
                     end if;    

                  end if;
               
               when STARTING =>

                  wordAccu     <= 0;
                  if (activeChannel = 3) then
                     wordAccu <= 3;
                  end if;
                  if (activeChannel = 4) then
                     wordAccu <= 1;
                  end if;
                  
                  useDataDirect <= '0';
                  if (activeChannel = 0 or activeChannel = 2) then
                     useDataDirect <= '1';
                  end if;
                  
                  REP_required <= '1';
                  if (toDevice = '0') then
                     REP_target    <= 3;
                     if (activeChannel = 3) then
                        REP_target <= 2;
                     end if;
                     if (activeChannel = 4) then
                        REP_target <= 2;
                     end if;
                  else
                     REP_target    <= 3;
                     if (activeChannel = 4) then
                        REP_target <= 5;
                     end if;
                  end if;
                  
                  if (dmaSettings.D_CHCR(8) = '1' and activeChannel /= 3 and activeChannel /= 6) then
                     errorCHOP <= '1';
                  end if;
                  
                  case (dmaSettings.D_CHCR(10 downto 9)) is
                     when "00" => -- manual
                        if (dmaSettings.D_CHCR(8) = '1') then -- chopping
                           wordcount      <= resize(chopsize, 17);
                           requiredDwords <= to_integer(chopsize);
                           if (dmaSettings.D_BCR(15 downto 0) = 0) then
                              dmaSettings.D_BCR(16 downto 0) <= to_unsigned(16#10000#, 17) - chopsize;
                           elsif (dmaSettings.D_BCR(15 downto 0) > chopsize) then
                              dmaSettings.D_BCR(15 downto 0) <= dmaSettings.D_BCR(15 downto 0) - chopsize;
                           else
                              wordcount                                  <= '0' & dmaSettings.D_BCR(15 downto 0);
                              requiredDwords                             <= to_integer(dmaSettings.D_BCR(15 downto 0));
                              dmaSettings.D_BCR(15 downto 0)             <= (others => '0');
                           end if;
                        else
                           if (dmaSettings.D_BCR(15 downto 0) = 0) then
                              wordcount <= '1' & x"0000";
                              requiredDwords <= 16#10000#;
                           else
                              wordcount      <= '0' & dmaSettings.D_BCR(15 downto 0);
                              requiredDwords <= to_integer(dmaSettings.D_BCR(15 downto 0));
                           end if;
                        end if;
                     
                     when "01" => -- request
                        blocksleft     <= dmaSettings.D_BCR(31 downto 16) - 1;
                        wordcount      <= '0' & dmaSettings.D_BCR(15 downto 0);
                        requiredDwords <= to_integer(dmaSettings.D_BCR(15 downto 0));
                     
                     when others => null;
                  end case;
                  
                  if (toDevice = '0') then -- from device -> can start immidiatly
                     case (dmaSettings.D_CHCR(10 downto 9)) is
                        when "00" => -- manual
                           dmaState    <= WORKING;
                        
                        when "01" => -- request
                           dmaState    <= WORKING;
                           
                        when "10" => -- linked list -> forbidden
                           dmaState <= OFF;
                           isOn     <= '0';
                        
                        when others => 
                           dmaState <= OFF;
                           isOn     <= '0';
                     end case;
                  else
                     case (dmaSettings.D_CHCR(10 downto 9)) is
                        when "00" => -- manual
                           dmaState    <= WORKING;
                           autoread    <= '1';
                        
                        when "01" => -- request
                           dmaState    <= WORKING;
                           autoread    <= '1';
                        
                        when "10" => -- linked list
                           dmaState    <= READHEADER;
                        
                        when others => 
                           dmaState <= OFF;
                           isOn     <= '0';
                     end case;
                  end if;
               
               when READHEADER =>
                  if (dma_wr = '1') then
                     nextAddr  <= dma_data(23 downto 0);
                     if (unsigned(dma_data(31 downto 24)) > 0) then
                        dmaSettings.D_MADR <= dmaSettings.D_MADR + 4;
                        dmaState           <= WORKING; 
                        REP_target         <= 8;
                        wordcount          <= "0" & x"00" & unsigned(dma_data(31 downto 24)); 
                        requiredDwords     <= to_integer(unsigned(dma_data(31 downto 24))) + 1;
                        if (requestedDwords < (to_integer(unsigned(dma_data(31 downto 24))) + 1)) then
                           autoread        <= '1';
                           ram_ena         <= '1';
                        end if;
                     elsif (dma_data(23) = '1' or toDevice = '0') then
                        dmaState <= STOPPING;
                        if (DICR(16 + activeChannel) = '1') then
                           DICR_IRQs(activeChannel) <= '1';
                           if (DICR(23) = '1') then
                              irqOut <= '1';
                           end if;
                        end if;
                     else
                        dmaSettings.D_MADR <= unsigned(dma_data(23 downto 0));
                        dmaState    <= PAUSING;
                        paused      <= '1';
                        dmaArray(activeChannel).chopwaiting   <= '1';
                        dmaArray(activeChannel).chopwaitcount <= x"03";
                     end if;
                  end if;
               
               when SLOWDOWN =>
                  if (slowcnt > 0) then
                     slowcnt <= slowcnt - 1;
                  else
                     dmaState <= WORKING;
                  end if;
               
               when WORKING =>
                  if (fifoIn_Valid = '1' or (useDataDirect = '1' and dma_wr = '1') or (toDevice = '0' and fifoOut_NearFull = '0' and wordAccu = 0 and readStall = '0')) then
                     REP_target  <= REP_target + 1;
                     case (activeChannel) is
                     
                        when 0 =>
                           if (toDevice = '1') then
                              DMA_MDEC_writeEna <= '1'; 
                              DMA_MDEC_write    <= dma_data;  
                           else
                              report "read from MDEC in not possible" severity failure;
                           end if;
                        
                        when 1 =>
                           if (toDevice = '0') then
                              fifoOut_Wr                <= not dmaSettings.D_MADR(23);
                              fifoOut_Din(52 downto 32) <= std_logic_vector(dmaSettings.D_MADR(22 downto 2));
                              fifoOut_Din(31 downto 0)  <= DMA_MDEC_read;
                           else
                              report "write to MDEC out not possible" severity failure;
                           end if;
                     
                        when 2 =>
                           if (toDevice = '1') then
                              DMA_GPU_writeEna  <= '1'; 
                              DMA_GPU_write     <= dma_data;
                           else
                              fifoOut_Wr                <= not dmaSettings.D_MADR(23);
                              fifoOut_Din(52 downto 32) <= std_logic_vector(dmaSettings.D_MADR(22 downto 2));
                              fifoOut_Din(31 downto 0)  <= DMA_GPU_read;
                           end if;
                           
                        when 3 =>
                           if (toDevice = '0') then
                              fifoOut_Wr                <= not dmaSettings.D_MADR(23);
                              fifoOut_Din(52 downto 32) <= std_logic_vector(dmaSettings.D_MADR(22 downto 2));
                              fifoOut_Din(31 downto 0)  <= DMA_CD_read & DMA_CD_read_accu;
                           end if;
                           
                        when 4 =>
                           REP_required <= '1';
                           REP_target   <= REP_target + 4;
                           if (toDevice = '1') then
                              DMA_SPU_writeEna  <= '1';
                              DMA_SPU_write     <= fifoIn_Dout(15 downto 0);
                           else
                              fifoOut_Wr                <= not dmaSettings.D_MADR(23);
                              fifoOut_Din(52 downto 32) <= std_logic_vector(dmaSettings.D_MADR(22 downto 2));
                              fifoOut_Din(31 downto 0)  <= DMA_SPU_read & DMA_SPU_read_accu;
                           end if;
                           
                        when 6 =>
                           if (toDevice = '0') then
                              fifoOut_Wr                <= not dmaSettings.D_MADR(23);
                              fifoOut_Din(52 downto 32) <= std_logic_vector(dmaSettings.D_MADR(22 downto 2));
                              if (wordcount = 1) then
                                 fifoOut_Din(31 downto 0) <= x"00FFFFFF";
                              else
                                 fifoOut_Din(31 downto 0) <= x"00" & std_logic_vector(dmaSettings.D_MADR(23 downto 2) - 1) & "00";
                              end if;
                           end if;
                     
                        when others => report "DMA channel not implemented" severity failure; 
                     end case;
                     
                     if (ram8mb = '0') then
                        fifoOut_Din(52 downto 51) <= "00";
                     end if;
                     
                     if (directionNeg = '1')  then 
                        dmaSettings.D_MADR <= dmaSettings.D_MADR - 4;
                     else
                        dmaSettings.D_MADR <= dmaSettings.D_MADR + 4;
                     end if;
                     
                     -- timing when hitting new bank
                     if (wordcount > 1) then
                        if (directionNeg = '1')  then 
                           if (dmaSettings.D_MADR(9 downto 2) = x"00") then
                              if (toDevice = '1') then
                                 REP_target   <= REP_target + 5;
                              else
                                 REP_target   <= REP_target + 6;
                              end if;
                              REP_required <= '1';
                           end if;
                        else
                           if (dmaSettings.D_MADR(9 downto 2) = x"FF") then
                              if (toDevice = '1') then
                                 REP_target   <= REP_target + 5;
                              else
                                 REP_target   <= REP_target + 6;
                              end if;
                              REP_required <= '1';
                           end if;
                        end if;
                     end if;
                     
                     -- timing for sdram refresh
                     REP_refresh <= REP_refresh + 1;
                     if (REP_refresh >= 100) then
                        REP_refresh  <= 0;
                        REP_target   <= REP_target + 6;
                        REP_required <= '1';
                     end if;
                  
                     -- special timings
                     if (activeChannel = 4 and spu_timing_on = '1' and spu_timing_value > 0) then
                        REP_target   <= REP_target + 4 + (to_integer(spu_timing_value) * 2);
                        REP_required <= '1';
                     end if;
                     
                     if (ignoreCDTiming = '0' and activeChannel = 3) then
                        REP_required <= '1';
                        addtime := 24;
                        if (cd_memctrl(8) = '1') then
                           if (wordcount > 1 and com0_delay > 0) then
                              addtime := addtime + to_integer(com0_delay) - 1;
                           end if;
                        end if;
                        if (REP_refresh >= 100) then
                           addtime := addtime + 6;
                        end if;
                        REP_target <= REP_target + addtime;
                     end if; 
                  
                     checkIRQ := '0';
                     wordcount <= wordcount - 1;
                     if (wordcount <= 1) then
                        case (dmaSettings.D_CHCR(10 downto 9)) is
                           when "00" => -- manual
                              if (dmaSettings.D_CHCR(8) = '1' and dmaSettings.D_BCR(15 downto 0) > 0) then
                                 dmaState <= PAUSING;
                                 dmaArray(activeChannel).chopwaiting   <= '1';
                                 dmaArray(activeChannel).chopwaitcount <= chopwaittime;
                                 dmaArray(activeChannel).D_CHCR(28)    <= '1';
                              else
                                 checkIRQ := '1';
                                 dmaState <= STOPPING;
                              end if;
                                 
                           when "01" => -- request
                              dmaSettings.D_BCR(31 downto 16) <= blocksleft;
                              blocksleft <= blocksleft - 1;
                              if (blocksleft = 0) then
                                 dmaState <= STOPPING;
                                 checkIRQ := '1';
                              else
                                 dmaState <= PAUSING;
                                 dmaArray(activeChannel).chopwaiting   <= '1';
                                 dmaArray(activeChannel).chopwaitcount <= x"02";
                              end if;
                           
                           when "10" => -- linked list
                              dmaSettings.D_MADR <= unsigned(nextAddr);
                              if (nextAddr(23) = '1') then
                                 checkIRQ := '1';
                                 dmaState <= STOPPING;
                              else
                                 dmaState <= PAUSING;
                                 paused   <= '1';
                                 dmaArray(activeChannel).chopwaiting   <= '1';
                                 dmaArray(activeChannel).chopwaitcount <= x"02";
                              end if;
                           
                           when others => null;
                        end case;
                     else
                        -- todo: slowdown for SPU read
                        if (activeChannel = 4 and toDevice = '1') then -- SPU access is 4 cycles per 32bit
                           slowcnt  <= 1;
                           dmaState <= SLOWDOWN;
                        end if;
                        if (activeChannel = 3 and toDevice = '0') then -- CD access
                           slowcnt  <= 24;
                           dmaState <= SLOWDOWN;
                        end if;
                     end if;
                     
                     if (checkIRQ = '1') then
                        if (DICR(16 + activeChannel) = '1') then
                           DICR_IRQs(activeChannel) <= '1';
                           if (DICR(23) = '1') then
                              irqOut <= '1';
                           end if;
                        end if;
                     end if;
                     
                  else
                     REP_refresh <= REP_refresh + 1;
                  
                     if (REP_counter >= REP_target) then
                        REP_required <= '0';
                     end if;
                     
                     if (ignoreCDTiming = '0' and activeChannel = 3 and cd_memctrl(8) = '1' and com0_delay > 0) then
                        REP_target <= REP_target + to_integer(com0_delay) - 1;
                     end if;
                     
                  end if;
               
               when STOPPING =>
                  autoread <= '0';
                  if (fifoOut_NearEmpty = '1') then
                     if (TURBO = '1' or REP_required = '0' or REP_counter >= REP_target) then
                        dmaState   <= OFF;
                        isOn       <= '0';
                        dmaArray(activeChannel).D_MADR <= dmaSettings.D_MADR;
                        dmaArray(activeChannel).D_BCR  <= dmaSettings.D_BCR;
                        dmaArray(activeChannel).D_CHCR(24) <= '0';
                        dmaArray(activeChannel).channelOn  <= '0';
                     end if;
                  end if;
               
               when PAUSING =>
                  autoread <= '0';
                  if (fifoOut_NearEmpty = '1') then
                     if (TURBO = '1' or REP_required = '0' or REP_counter >= REP_target) then
                        dmaState   <= OFF;
                        isOn       <= '0';
                        dmaArray(activeChannel).D_MADR <= dmaSettings.D_MADR;
                        dmaArray(activeChannel).D_BCR  <= dmaSettings.D_BCR;
                     end if;
                  end if;
            
            end case;

--##############################################################
--############################### ram read handling
--##############################################################
            
            if (dma_reqprocessed = '1') then
               if (autoread = '1') then
                  ram_ena         <= '1';
               end if;
               if (directionNeg = '1') then
                  ram_Adr <= std_logic_vector(unsigned(ram_Adr) - ((1 + to_integer(unsigned(ram_cnt))) * 4));
               else
                  ram_Adr <= std_logic_vector(unsigned(ram_Adr) + ((1 + to_integer(unsigned(ram_cnt))) * 4));
               end if;
            end if;
            
            if ((dmaState = WORKING or dmaState = SLOWDOWN) and requestedDwords >= requiredDwords) then
               autoread <= '0';
               ram_ena  <= '0';
            end if;
            
            if (ram_ena = '1') then
               requestedDwords <= requestedDwords + (1 + to_integer(unsigned(ram_cnt)));
            end if;
            
         end if; -- ce
         
      end if;
   end process;
   
   fifoIn_Wr  <= ce when (toDevice = '1' and dma_wr = '1' and useDataDirect = '0') else '0'; 
   fifoIn_Din <= dma_data(31 downto 0);
   
   
   fifoIn_Rd <= '1' when (fifoIn_Empty = '0' and toDevice = '1' and dmaState = working and (activeChannel /= 4 or fifoIn_Valid = '0')) else '0';

   iDMAfifoIn: entity mem.Syncfifo
   generic map
   (
      SIZE             => 64,
      DATAWIDTH        => 32,
      NEARFULLDISTANCE => 32
   )
   port map
   ( 
      clk      => clk1x,
      reset    => fifoIn_reset,  
      Din      => fifoIn_Din,     
      Wr       => fifoIn_Wr,      
      Full     => fifoIn_Full,    
      NearFull => open, -- todo: is there any situation where data is coming faster? SPU? -> full error should trigger
      Dout     => fifoIn_Dout,    
      Rd       => fifoIn_Rd,      
      Empty    => fifoIn_Empty   
   );
   
   DMAfifoOut: entity mem.SyncFifoFallThrough
   generic map
   (
      SIZE              => 64,
      DATAWIDTH         => 53,
      NEARFULLDISTANCE  => 56,
      NEAREMPTYDISTANCE => 2
   )
   port map
   ( 
      clk       => clk3x,
      reset     => fifoOut_reset,  
      Din       => fifoOut_Din,     
      Wr        => fifoOut_Wr_3x,      
      Full      => fifoOut_Full,    
      NearFull  => fifoOut_NearFull_3x,
      Dout      => fifoOut_Dout,    
      Rd        => ram_dmafifo_read,      
      Empty     => fifoOut_Empty,   
      NearEmpty => fifoOut_NearEmpty_3x   
   );
   
   fifoOut_Wr_3x <= clk3xIndex and fifoOut_Wr;
   
   ram_dmafifo_adr   <= fifoOut_Dout(52 downto 32) & "00";
   ram_dmafifo_data  <= fifoOut_Dout(31 downto 0);
   ram_dmafifo_empty <= fifoOut_Empty;
   
   dma_cache_Adr   <= fifoOut_Din(50 downto 32) & "00";
   dma_cache_data  <= fifoOut_Din(31 downto 0);
   dma_cache_write <= fifoOut_Wr;
   
--##############################################################
--############################### savestates
--##############################################################

   process (clk1x)
   begin
      if (rising_edge(clk1x)) then
         
         if (SS_rden = '1') then
            SS_DataRead <= ss_out(to_integer(SS_Adr));
         end if;
      
         SS_idle <= '0';
         if (dmaOn = '0' and dmaRequest = '0') then
            SS_idle <= '1';
         end if;
      
      end if;
   end process;

end architecture;





