library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

use work.pexport.all;
use work.pRegisterBus.all;
use work.pBus_savestates.all;

entity SwanTop is
   generic 
   (
      is_simu : std_logic := '0'
   );
   port
   (
      clk                        : in  std_logic; -- 32Mhz
      clk_ram                    : in  std_logic; -- 96Mhz
      reset_in                   : in  std_logic;
      pause_in                   : in  std_logic;
      
      -- rom/sdram
      EXTRAM_doRefresh           : out std_logic := '0';
      EXTRAM_read                : out std_logic;
      EXTRAM_write               : out std_logic;
      EXTRAM_be                  : out std_logic_vector(1 downto 0);
      EXTRAM_addr                : out std_logic_vector(24 downto 0);
      EXTRAM_datawrite           : out std_logic_vector(15 downto 0);
      EXTRAM_dataread            : in  std_logic_vector(15 downto 0);
      
      eepromWrite                : out std_logic;
      eeprom_addr                : in  std_logic_vector(9 downto 0);
      eeprom_din                 : in  std_logic_vector(15 downto 0);
      eeprom_dout                : out std_logic_vector(15 downto 0);
      eeprom_req                 : in  std_logic;
      eeprom_rnw                 : in  std_logic;

      maskAddr                   : in  std_logic_vector(23 downto 0);
      romtype                    : in  std_logic_vector(7 downto 0);
      ramtype                    : in  std_logic_vector(7 downto 0);
      hasRTC                     : in  std_logic;
      
      -- bios
      bios_wraddr                : in  std_logic_vector(12 downto 0);
      bios_wrdata                : in  std_logic_vector(15 downto 0);
      bios_wr                    : in  std_logic;
      bios_wrcolor               : in  std_logic;
      
      -- video
      vertical                   : out std_logic;
      pixel_out_addr             : out integer range 0 to 32255;       -- address for framebuffer 
      pixel_out_data             : out std_logic_vector(11 downto 0);  -- RGB data for framebuffer 
      pixel_out_we               : out std_logic;                      -- new pixel for framebuffer 
      
      -- audio
      audio_l                    : out std_logic_vector(15 downto 0); -- 16 bit signed
      audio_r                    : out std_logic_vector(15 downto 0); -- 16 bit signed

      --settings
      isColor                    : in  std_logic;
      fastforward                : in  std_logic;
      turbo                      : in  std_logic;
   
      -- JOYSTICK
      KeyY1                      : in  std_logic;
      KeyY2                      : in  std_logic;
      KeyY3                      : in  std_logic;
      KeyY4                      : in  std_logic;
      KeyX1                      : in  std_logic;
      KeyX2                      : in  std_logic;
      KeyX3                      : in  std_logic;
      KeyX4                      : in  std_logic;
      KeyStart                   : in  std_logic;
      KeyA                       : in  std_logic;
      KeyB                       : in  std_logic;
      
      -- RTC
      RTC_timestampNew           : in  std_logic;                     -- new current timestamp from system
      RTC_timestampIn            : in  std_logic_vector(31 downto 0); -- timestamp in seconds, current time
      RTC_timestampSaved         : in  std_logic_vector(31 downto 0); -- timestamp in seconds, saved time
      RTC_savedtimeIn            : in  std_logic_vector(41 downto 0); -- time structure, loaded
      RTC_saveLoaded             : in  std_logic;                     -- must be 0 when loading new game, should go and stay 1 when RTC was loaded and values are valid
      RTC_timestampOut           : out std_logic_vector(31 downto 0); -- timestamp to be saved
      RTC_savedtimeOut           : out std_logic_vector(41 downto 0); -- time structure to be saved
   
      -- savestates
      increaseSSHeaderCount      : in  std_logic;
      save_state                 : in  std_logic;
      load_state                 : in  std_logic;
      savestate_number           : integer range 0 to 3;
      state_loaded               : out std_logic;
      
      SAVE_out_Din               : out std_logic_vector(63 downto 0);                                                   
      SAVE_out_Dout              : in  std_logic_vector(63 downto 0);                                           
      SAVE_out_Adr               : out std_logic_vector(25 downto 0);             
      SAVE_out_rnw               : out std_logic;          
      SAVE_out_ena               : out std_logic;          
      SAVE_out_be                : out std_logic_vector(7 downto 0);
      SAVE_out_done              : in  std_logic;          
      SAVE_out_busy             : out std_logic; 
      
      rewind_on                  : in  std_logic;
      rewind_active              : in  std_logic
   );
end entity;

architecture arch of SwanTop is

   signal pixel_addr             : integer range 0 to 16319 := 0;       
   signal pixel_we               : std_logic := '0';  

   -- clock
   type tclockState is
   (
      NORMAL,
      FASTFORWARDMODE,
      REFRESH
   );
   signal clockState : tclockState;
   
   signal ce_counter             : unsigned (3 downto 0) := (others => '0');
   signal ce                     : std_logic := '0';
   signal ce_cpu                 : std_logic := '0';
   signal ce_4x                  : std_logic := '0';
   signal refreshCnt             : integer range 0 to 127 := 0;
   signal refreshwait            : integer range 0 to 4 := 0;
   signal normalRefresh          : std_logic := '0';
   signal startwait              : integer range 0 to 3 := 0;
   
   signal EXTRAM_acc_1           : std_logic := '0';
   signal EXTRAM_acc_2           : std_logic := '0';
   
   -- register
   signal RegBus_Din             : std_logic_vector(BUS_buswidth-1 downto 0);
   signal RegBus_Adr             : std_logic_vector(BUS_busadr-1 downto 0) := (others => '0');
   signal RegBus_wren            : std_logic;
   signal RegBus_rden            : std_logic;
   signal RegBus_rst             : std_logic;
   signal RegBus_Dout            : std_logic_vector(BUS_buswidth-1 downto 0);
   signal RegBus_Dout_mapped     : std_logic_vector(BUS_buswidth-1 downto 0);
   signal regIsMapped            : std_logic;
   
   signal CPU_RegBus_Din         : std_logic_vector(BUS_buswidth-1 downto 0);
   signal CPU_RegBus_Adr         : std_logic_vector(BUS_busadr-1 downto 0);
   signal CPU_RegBus_wren        : std_logic;
   signal CPU_RegBus_rden        : std_logic;
   
   type t_reg_wired_or is array(0 to 7) of std_logic_vector(7 downto 0);
   signal reg_wired_or : t_reg_wired_or;
   
   -- memorymux
   signal bus_read               : std_logic;
   signal bus_write              : std_logic;
   signal bus_be                 : std_logic_vector(1 downto 0);
   signal bus_addr               : unsigned(19 downto 0);
   signal bus_datawrite          : std_logic_vector(15 downto 0);
   signal bus_dataread           : std_logic_vector(15 downto 0);
   
   -- CPU
   signal cpu_idle               : std_logic;
   signal cpu_halt               : std_logic;
   signal cpu_irqrequest         : std_logic;
   signal cpu_prefix             : std_logic;
   signal cpuCanSpeedup          : std_logic;

   signal cpu_bus_read           : std_logic;
   signal cpu_bus_write          : std_logic;
   signal cpu_bus_be             : std_logic_vector(1 downto 0);
   signal cpu_bus_addr           : unsigned(19 downto 0);
   signal cpu_bus_datawrite      : std_logic_vector(15 downto 0);
   signal cpu_bus_dataread       : std_logic_vector(15 downto 0);

   -- dma
   signal dma_active             : std_logic;
   signal sdma_active            : std_logic;
   signal sdma_request           : std_logic;
   
   signal dma_bus_read           : std_logic;
   signal dma_bus_write          : std_logic;
   signal dma_bus_be             : std_logic_vector(1 downto 0);
   signal dma_bus_addr           : unsigned(19 downto 0);
   signal dma_bus_datawrite      : std_logic_vector(15 downto 0);
   signal dma_bus_dataread       : std_logic_vector(15 downto 0);
   
   -- IRQ
   signal irqrequest             : std_logic;
   signal irqvector              : unsigned(9 downto 0) := (others => '0');
   
   signal IRQ_LineComp           : std_logic;
   signal IRQ_VBlankTmr          : std_logic;
   signal IRQ_VBlank             : std_logic;
   signal IRQ_HBlankTmr          : std_logic;
   
   -- GPU
   signal GPU_addr               : std_logic_vector(15 downto 0);
   signal GPU_dataread           : std_logic_vector(15 downto 0); 

   signal Color_addr             : std_logic_vector(7 downto 0);
   signal Color_dataread         : std_logic_vector(15 downto 0);    

   signal LCD_vertical           : std_logic;
   
   -- sound
   signal SOUND_addr             : std_logic_vector(15 downto 0) := (others => '0');
   signal SOUND_dataread         : std_logic_vector(15 downto 0);       
   signal SOUND_valid            : std_logic;      
   
   signal soundDMAvalue          : std_logic_vector(7 downto 0);
   signal soundDMACh2            : std_logic;
   signal soundDMACh5            : std_logic;

   -- savestates
   signal reset                  : std_logic;
   signal sleep_savestate        : std_logic;
   signal sleep_rewind           : std_logic;
   signal system_idle            : std_logic;
   signal savestate_slow         : std_logic;
   
   type t_ss_wired_or is array(0 to 5) of std_logic_vector(63 downto 0);
   signal ss_wired_or : t_ss_wired_or;
   
   signal savestate_savestate    : std_logic; 
   signal savestate_loadstate    : std_logic; 
   signal savestate_address      : integer; 
   signal savestate_busy         : std_logic; 
   
   signal SSBUS_Din              : std_logic_vector(SSBUS_buswidth-1 downto 0);
   signal SSBUS_Adr              : std_logic_vector(SSBUS_busadr-1 downto 0);
   signal SSBUS_wren             : std_logic := '0';
   signal SSBUS_rst              : std_logic := '0';
   signal SSBUS_Dout             : std_logic_vector(SSBUS_buswidth-1 downto 0);
          
   signal SSMEM_busy             : std_logic;
   signal SSMEM_Addr             : std_logic_vector(18 downto 0);
   signal SSMEM_RdEn             : std_logic_vector( 2 downto 0);
   signal SSMEM_WrEn             : std_logic_vector( 2 downto 0);
   signal SSMEM_WriteData        : std_logic_vector(15 downto 0);
   signal SSMEM_ReadData_REG     : std_logic_vector( 7 downto 0);
   signal SSMEM_ReadData_RAM     : std_logic_vector(15 downto 0);
   signal SSMEM_ReadData_SRAM    : std_logic_vector(15 downto 0);

   -- export
-- synthesis translate_off
   signal cpu_done               : std_logic; 
   signal new_export             : std_logic; 
   signal cpu_export             : cpu_export_type;
   signal dma_done               : std_logic;
   signal export_irq             : std_logic_vector(7 downto 0);
   signal export_8               : std_logic_vector(7 downto 0);
   signal export_16              : std_logic_vector(15 downto 0);
   signal export_32              : std_logic_vector(31 downto 0);
-- synthesis translate_on

begin

   SAVE_out_busy <= savestate_busy;
   
   -- CE Generation
   --
   -- wonderswan is running at 3.072 MHz for CPU/PPU/... and 4*3.072 = 12.288 MHz for Memory
   -- Our common clock would be 12.288 MHz with Clock Enable every 4th clock cycle
   -- To add fastforward mode, we run at 3*12.288 MHz = 36.864 MHz, so we have clock enable every 12th clock cycle
   -- furthermore, CPU will subdivide V30MZ cycles into 4 subcycles to take advantage of the higher base clock
   -- by splitting up complex instructions that take only 1 clock cycle in V30MZ to up to 4 clock cycles
   -- For this reason it also receives a ce_4x, which is high every 3rd clock cycle in normal mode
   
   -- 36.864 MHz     xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
   -- CE             x           x           x
   -- ce_4x          x  x  x  x  x  x  x  x  x  x  x
   
   -- In fastforward mode ce_4x is '1' every clock cycle. 
   -- If SDRAM is accessed, this doesn't work, as SDRAM, which is running at 9*12.288 = 110.592 MHz needs 9 cycles to supply values
   -- This translates down to 3 cycles at 36.864 MHz, which is exactly the speed of the normal operation mode
   -- Therefore, the core switches to non-fastforward for this one action and switches back when the read/write is finished
   -- Because of that behavior, the overall fastforward speed is not 3X, but something like 2.5X, depending on SDRAM access count
   
   -- 36.864 MHz     xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
   -- CE             x   x   x     x   x     x   x
   -- ce_4x          xxxxxxxxxx  xxxxxxxxx  xxxxxxxx
   -- SDRAM Access            x          x  x
   
   -- SDRAM Refresh is issued together with every ce_4x in Normal speed mode
   -- IF SDRAM is accessed in the same cycle, the Refresh must be ignored by SDRAM controller and read/write done instead
   -- As the CPU cannot access SDRAM in every subcycle, the refresh will always happen in time
   -- in Fastforward mode, this doesn't happen at all, so we need to do some extra refresh pause when refreshCnt has reached it's limit
   
   process (clk)
   begin
      if rising_edge(clk) then
      
         if (refreshCnt < 127) then
            refreshCnt <= refreshCnt + 1;
         end if;
         
         EXTRAM_acc_1 <= EXTRAM_read or EXTRAM_write;
         EXTRAM_acc_2 <= EXTRAM_acc_1;
         
         ce            <= '0'; 
         ce_cpu        <= '0'; 
         ce_4x         <= '0';
         normalRefresh <= '0';
         
         if (startwait > 0) then
            startwait <= startwait - 1;
         end if;
         
         if (reset = '1' or sleep_savestate = '1' or sleep_rewind = '1' or pause_in = '1') then
            if (reset = '1') then
               ce_counter    <= (others => '0');
            end if;
            clockState    <= NORMAL;
            if (refreshCnt = 127) then
               normalRefresh <= '1';
               refreshCnt    <= 0;
            end if;
            startwait <= 3;
         elsif (startwait = 0) then
         
            case (clockState) is
            
               when NORMAL => 
                  ce_counter <= ce_counter + 1;
                  if (ce_counter = 11) then 
                     ce         <= '1';
                     ce_cpu     <= not dma_active;
                     ce_counter <= (others => '0');
                  end if;
                  if (ce_counter = 1 or ce_counter = 4 or ce_counter = 7 or ce_counter = 10) then
                     if (fastforward = '1' and savestate_slow = '0' and rewind_active = '0' and cpuCanSpeedup = '1') then
                        clockState <= FASTFORWARDMODE;
                     end if;
                  end if;
                  if (ce_counter = 2 or ce_counter = 5 or ce_counter = 8 or ce_counter = 11) then
                     ce_4x <= '1';
                  end if;
                  if (EXTRAM_doRefresh = '1' and EXTRAM_read = '0' and EXTRAM_write = '0' and EXTRAM_acc_1 = '0' and EXTRAM_acc_2 = '0') then
                     refreshCnt <= 0;
                  end if;
                  if (ce_4x = '1') then
                     normalRefresh <= '1';
                  end if;

               when FASTFORWARDMODE =>
                  if (fastforward = '0' or savestate_slow = '1' or rewind_active = '1' or cpuCanSpeedup = '0' or EXTRAM_read = '1' or EXTRAM_write = '1') then
                     clockState <= NORMAL;
                     if (ce_counter >= 2) then
                        ce_counter <= ce_counter - 1;
                     else
                        ce_counter <= x"A";
                     end if;
                  elsif (refreshCnt = 127) then
                     clockState  <= REFRESH;
                     refreshwait <= 0;
                  else
                     ce_counter <= ce_counter + 3;
                     ce_4x      <= '1';
                     if (ce_counter = 11) then 
                        ce         <= '1';
                        ce_cpu     <= not dma_active;
                        ce_counter <= x"2";
                     end if;
                  end if;
                  
               when REFRESH =>
                  if (EXTRAM_read = '0' and EXTRAM_write = '0' and EXTRAM_acc_1 = '0' and EXTRAM_acc_2 = '0') then
                     refreshCnt <= 0;
                     refreshwait <= refreshwait + 1;
                     if (refreshwait = 3) then
                        clockState <= FASTFORWARDMODE;   
                     end if;
                  end if;
                  
            end case;

         end if;
         
      end if;
   end process;
   
   EXTRAM_doRefresh <= '1' when (normalRefresh = '1' or (clockState = REFRESH and refreshwait = 0)) else '0';
   
   -- register
   process (reg_wired_or)
      variable wired_or : std_logic_vector(7 downto 0);
   begin
      wired_or := reg_wired_or(0);
      for i in 1 to (reg_wired_or'length - 1) loop
         wired_or := wired_or or reg_wired_or(i);
      end loop;
      RegBus_Dout <= wired_or;
   end process;
   
   regIsMapped <= '0' when unsigned(RegBus_Adr) >= 16#18# and unsigned(RegBus_Adr) <= 16#19# else
                  '0' when unsigned(RegBus_Adr) >= 16#40# and unsigned(RegBus_Adr) <= 16#5F# else
                  '0' when RegBus_Adr = x"61" else
                  '0' when unsigned(RegBus_Adr) >= 16#63# and unsigned(RegBus_Adr) <= 16#69# else
                  '0' when unsigned(RegBus_Adr) >= 16#6C# and unsigned(RegBus_Adr) <= 16#7F# else
                  '0' when RegBus_Adr = x"9F" else
                  '0' when RegBus_Adr = x"A1" else
                  '0' when unsigned(RegBus_Adr) >= 16#AD# and unsigned(RegBus_Adr) <= 16#AF# else
                  '0' when unsigned(RegBus_Adr) >= 16#B8# and unsigned(RegBus_Adr) <= 16#B9# else
                  '1';
   
   
   RegBus_Dout_mapped <= RegBus_Dout when (isColor or regIsMapped) else x"90"; 
   
   RegBus_Din  <= SSMEM_WriteData(7 downto 0) when sleep_savestate = '1' else CPU_RegBus_Din;
   RegBus_Adr  <= SSMEM_Addr(7 downto 0)      when sleep_savestate = '1' else CPU_RegBus_Adr;
   RegBus_wren <= SSMEM_WrEn(0)               when sleep_savestate = '1' else CPU_RegBus_wren;
   RegBus_rden <= '0'                         when sleep_savestate = '1' else CPU_RegBus_rden;
   
   SSMEM_ReadData_REG <= RegBus_Dout;
   
   idummyregs : entity work.dummyregs
   port map
   (
      clk          => clk,
      ce           => ce,
      reset        => reset,
                                 
      RegBus_Din   => RegBus_Din,
      RegBus_Adr   => RegBus_Adr,
      RegBus_wren  => RegBus_wren,
      RegBus_rst   => RegBus_rst,
      RegBus_Dout  => reg_wired_or(0)
   );
   
   -- Memory Mux
   bus_read      <= dma_bus_read      when (dma_active = '1' or sdma_active = '1') else cpu_bus_read;    
   bus_write     <= dma_bus_write     when (dma_active = '1' or sdma_active = '1') else cpu_bus_write;    
   bus_be        <= dma_bus_be        when (dma_active = '1' or sdma_active = '1') else cpu_bus_be;       
   bus_addr      <= dma_bus_addr      when (dma_active = '1' or sdma_active = '1') else cpu_bus_addr;     
   bus_datawrite <= dma_bus_datawrite when (dma_active = '1' or sdma_active = '1') else cpu_bus_datawrite;
   
   cpu_bus_dataread  <= bus_dataread;
   dma_bus_dataread  <= bus_dataread;
   
   imemorymux : entity work.memorymux
   port map
   (
      clk                  => clk,          
      clk_ram              => clk_ram,          
      ce                   => ce,           
      reset                => reset,   
      isColor              => isColor,   

      maskAddr             => maskAddr,
      romtype              => romtype,
      ramtype              => ramtype, 
      
      eepromWrite          => eepromWrite,
      eeprom_addr          => eeprom_addr,
      eeprom_din           => eeprom_din, 
      eeprom_dout          => eeprom_dout,
      eeprom_req           => eeprom_req, 
      eeprom_rnw           => eeprom_rnw, 
                     
      cpu_read             => bus_read,          
      cpu_write            => bus_write,          
      cpu_be               => bus_be,          
      cpu_addr             => bus_addr,     
      cpu_datawrite        => bus_datawrite,
      cpu_dataread         => bus_dataread, 

      GPU_addr             => GPU_addr,    
      GPU_dataread         => GPU_dataread,   

      Color_addr           => Color_addr,    
      Color_dataread       => Color_dataread,     
         
      bios_wraddr          => bios_wraddr,
      bios_wrdata          => bios_wrdata,
      bios_wr              => bios_wr, 
      bios_wrcolor         => bios_wrcolor, 
      
      RegBus_Din           => RegBus_Din, 
      RegBus_Adr           => RegBus_Adr, 
      RegBus_wren          => RegBus_wren,
      RegBus_rst           => RegBus_rst, 
      RegBus_Dout          => reg_wired_or(2),
      
      EXTRAM_read          => EXTRAM_read,     
      EXTRAM_write         => EXTRAM_write,    
      EXTRAM_be            => EXTRAM_be,    
      EXTRAM_addr          => EXTRAM_addr,     
      EXTRAM_datawrite     => EXTRAM_datawrite,
      EXTRAM_dataread      => EXTRAM_dataread, 
      
      sleep_savestate      => sleep_savestate,

      SSBUS_Din            => SSBUS_Din, 
      SSBUS_Adr            => SSBUS_Adr, 
      SSBUS_wren           => SSBUS_wren,
      SSBUS_rst            => SSBUS_rst, 
      SSBUS_Dout           => ss_wired_or(0),
      
      SSMEM_Addr           => SSMEM_Addr,  
      SSMEM_RdEn           => SSMEM_RdEn,        
      SSMEM_WrEn           => SSMEM_WrEn,        
      SSMEM_WriteData      => SSMEM_WriteData,   
      SSMEM_ReadData_RAM   => SSMEM_ReadData_RAM,
      SSMEM_ReadData_SRAM  => SSMEM_ReadData_SRAM
   );
   
   -- cpu
   icpu : entity work.cpu
   port map
   (
      clk               => clk,  
      ce                => ce_cpu,   
      ce_4x             => ce_4x,
      reset             => reset,
      turbo             => turbo,
      --SLOWTIMING        => is_simu,
      SLOWTIMING        => '0',
   
      cpu_idle          => cpu_idle,
      cpu_halt          => cpu_halt,
      cpu_irqrequest    => cpu_irqrequest,
      cpu_prefix        => cpu_prefix,
      dma_active        => dma_active,      
      sdma_request      => sdma_request,      
      canSpeedup        => cpuCanSpeedup,
    
      bus_read          => cpu_bus_read,    
      bus_write         => cpu_bus_write,    
      bus_be            => cpu_bus_be,    
      bus_addr          => cpu_bus_addr,     
      bus_datawrite     => cpu_bus_datawrite,
      bus_dataread      => cpu_bus_dataread,     
   
      irqrequest_in     => irqrequest,
      irqvector_in      => irqvector, 

      load_savestate    => sleep_savestate,       
            
-- synthesis translate_off
      cpu_done          => cpu_done,         
      cpu_export        => cpu_export,
-- synthesis translate_on

      RegBus_Din        => CPU_RegBus_Din, 
      RegBus_Adr        => CPU_RegBus_Adr, 
      RegBus_wren       => CPU_RegBus_wren,
      RegBus_rden       => CPU_RegBus_rden,
      RegBus_Dout       => RegBus_Dout_mapped,

      sleep_savestate   => sleep_savestate,

      SSBUS_Din         => SSBUS_Din, 
      SSBUS_Adr         => SSBUS_Adr, 
      SSBUS_wren        => SSBUS_wren,
      SSBUS_rst         => SSBUS_rst, 
      SSBUS_Dout        => ss_wired_or(1)
   );
   
   -- dma
   idma : entity work.dma
   generic map
   (
      is_simu => '0' --is_simu
   )
   port map
   (
      clk               => clk,  
      ce                => ce,   
      reset             => reset,
      isColor           => isColor,  
                        
      dma_active        => dma_active,
      sdma_active       => sdma_active,
      sdma_request      => sdma_request,
      cpu_idle          => cpu_idle,
                        
      bus_read          => dma_bus_read,    
      bus_write         => dma_bus_write,    
      bus_be            => dma_bus_be,    
      bus_addr          => dma_bus_addr,     
      bus_datawrite     => dma_bus_datawrite,
      bus_dataread      => dma_bus_dataread,  
      
      soundDMAvalue     => soundDMAvalue,
      soundDMACh2       => soundDMACh2,  
      soundDMACh5       => soundDMACh5,  

      RegBus_Din        => RegBus_Din, 
      RegBus_Adr        => RegBus_Adr, 
      RegBus_wren       => RegBus_wren,
      RegBus_rst        => RegBus_rst, 
      RegBus_Dout       => reg_wired_or(5),
       
      sleep_savestate   => sleep_savestate,
      
      SSBUS_Din         => SSBUS_Din, 
      SSBUS_Adr         => SSBUS_Adr, 
      SSBUS_wren        => SSBUS_wren,
      SSBUS_rst         => SSBUS_rst, 
      SSBUS_Dout        => ss_wired_or(2)
   );
   
   
   -- IRQ
   iIRQ : entity work.IRQ
   port map
   (
      clk                  => clk,          
      ce                   => ce,           
      reset                => reset,   
      isColor              => isColor,   
      
      irqrequest           => irqrequest,
      irqvector            => irqvector, 
                                        
      IRQ_LineComp         => IRQ_LineComp ,
      IRQ_VBlankTmr        => IRQ_VBlankTmr,
      IRQ_VBlank           => IRQ_VBlank   ,
      IRQ_HBlankTmr        => IRQ_HBlankTmr,
      
-- synthesis translate_off
      export_irq           => export_irq,         
-- synthesis translate_on
      
      RegBus_Din           => RegBus_Din, 
      RegBus_Adr           => RegBus_Adr, 
      RegBus_wren          => RegBus_wren,
      RegBus_rst           => RegBus_rst, 
      RegBus_Dout          => reg_wired_or(4),
      
      SSBUS_Din            => SSBUS_Din, 
      SSBUS_Adr            => SSBUS_Adr, 
      SSBUS_wren           => SSBUS_wren,
      SSBUS_rst            => SSBUS_rst, 
      SSBUS_Dout           => ss_wired_or(3)
   );
   
   -- joypad
   ijoypad: entity work.joypad
   port map
   (     
      clk            => clk,     
                                
      vertical       => LCD_vertical,

      KeyY1          => KeyY1   ,
      KeyY2          => KeyY2   ,
      KeyY3          => KeyY3   ,
      KeyY4          => KeyY4   ,
      KeyX1          => KeyX1   ,
      KeyX2          => KeyX2   ,
      KeyX3          => KeyX3   ,
      KeyX4          => KeyX4   ,
      KeyStart       => KeyStart,
      KeyA           => KeyA    ,
      KeyB           => KeyB    ,
   
      RegBus_Din     => RegBus_Din, 
      RegBus_Adr     => RegBus_Adr, 
      RegBus_wren    => RegBus_wren,
      RegBus_rst     => RegBus_rst, 
      RegBus_Dout    => reg_wired_or(1)
   );
   
   -- gpu
   igpu : entity work.gpu
   generic map
   (
      is_simu => is_simu
   )
   port map
   (
      clk            => clk,  
      ce             => ce,   
      reset          => reset,
      isColor        => isColor,
      
      IRQ_LineComp   => IRQ_LineComp ,
      IRQ_VBlankTmr  => IRQ_VBlankTmr,
      IRQ_VBlank     => IRQ_VBlank   ,
      IRQ_HBlankTmr  => IRQ_HBlankTmr,
      
      vertical       => LCD_vertical,
                     
      RegBus_Din     => RegBus_Din, 
      RegBus_Adr     => RegBus_Adr, 
      RegBus_wren    => RegBus_wren,
      RegBus_rst     => RegBus_rst, 
      RegBus_Dout    => reg_wired_or(3), 
   
      RAM_addr       => GPU_addr,    
      RAM_dataread   => GPU_dataread, 
      
      Color_addr     => Color_addr,    
      Color_dataread => Color_dataread,  
      
      pixel_out_addr => pixel_out_addr,
      pixel_out_data => pixel_out_data,
      pixel_out_we   => pixel_out_we,  
               
      SOUND_addr     => SOUND_addr,    
      SOUND_dataread => SOUND_dataread,
      SOUND_valid    => SOUND_valid,     
               
-- synthesis translate_off
      export_vtime   => export_8,
-- synthesis translate_on
               
      -- savestates        
      SSBUS_Din      => SSBUS_Din,  
      SSBUS_Adr      => SSBUS_Adr,  
      SSBUS_wren     => SSBUS_wren, 
      SSBUS_rst      => SSBUS_rst,  
      SSBUS_Dout     => ss_wired_or(4)
   );
   
   vertical <= LCD_vertical;
   
   --sound
   isound : entity work.sound
   port map
   (
      clk            => clk,        
      ce             => ce,         
      reset          => reset,      
                     
      RegBus_Din     => RegBus_Din, 
      RegBus_Adr     => RegBus_Adr, 
      RegBus_wren    => RegBus_wren,
      RegBus_rst     => RegBus_rst, 
      RegBus_Dout    => reg_wired_or(6), 
                     
      RAM_addr       => SOUND_addr,    
      RAM_dataread   => SOUND_dataread,
      RAM_valid      => SOUND_valid,
      
      soundDMAvalue  => soundDMAvalue,
      soundDMACh2    => soundDMACh2,  
      soundDMACh5    => soundDMACh5, 
      
      audio_l        => audio_l,
      audio_r        => audio_r,
         
      -- savestates        
      SSBUS_Din      => SSBUS_Din,  
      SSBUS_Adr      => SSBUS_Adr,  
      SSBUS_wren     => SSBUS_wren, 
      SSBUS_rst      => SSBUS_rst,  
      SSBUS_Dout     => ss_wired_or(5)
   );   
   
   irtc : entity work.rtc
   port map
   (
      clk                  => clk,   
      ce                   => ce,    
      reset                => reset, 
      hasRTC               => hasRTC,
                           
      RTC_timestampNew     => RTC_timestampNew,  
      RTC_timestampIn      => RTC_timestampIn,   
      RTC_timestampSaved   => RTC_timestampSaved,
      RTC_savedtimeIn      => RTC_savedtimeIn,   
      RTC_saveLoaded       => RTC_saveLoaded,    
      RTC_timestampOut     => RTC_timestampOut,  
      RTC_savedtimeOut     => RTC_savedtimeOut,  
                           
      sleep_savestate      => sleep_savestate,
                           
      RegBus_Din           => RegBus_Din,
      RegBus_Adr           => RegBus_Adr, 
      RegBus_wren          => RegBus_wren,
      RegBus_rden          => RegBus_rden,
      RegBus_rst           => RegBus_rst, 
      RegBus_Dout          => reg_wired_or(7)
   );
   
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
   
   system_idle <= '1' when (cpu_idle = '1' and cpu_halt = '0' and dma_active = '0' and sdma_active = '0' and cpu_irqrequest = '0' and cpu_prefix = '0') else '0';

   isavestates : entity work.savestates
   port map
   (
      clk                     => clk,
      ce                      => ce,
      reset_in                => reset_in,
      reset_out               => reset,
      RegBus_rst              => RegBus_rst,
      
      ramtype                 => ramtype,
            
      load_done               => state_loaded,
            
      increaseSSHeaderCount   => increaseSSHeaderCount,
      save                    => savestate_savestate,
      load                    => savestate_loadstate,
      savestate_address       => savestate_address,  
      savestate_busy          => savestate_busy,    

      system_idle             => system_idle,
      savestate_slow          => savestate_slow,
            
      BUS_Din                 => SSBUS_Din, 
      BUS_Adr                 => SSBUS_Adr, 
      BUS_wren                => SSBUS_wren,
      BUS_rst                 => SSBUS_rst, 
      BUS_Dout                => SSBUS_Dout,
            
      loading_savestate       => open,
      saving_savestate        => open,
      sleep_savestate         => sleep_savestate,
            
      Save_busy               => SSMEM_busy,
      Save_RAMAddr            => SSMEM_Addr,        
      Save_RAMRdEn            => SSMEM_RdEn,        
      Save_RAMWrEn            => SSMEM_WrEn,        
      Save_RAMWriteData       => SSMEM_WriteData,   
      Save_RAMReadData_REG    => SSMEM_ReadData_REG,
      Save_RAMReadData_RAM    => SSMEM_ReadData_RAM,
      Save_RAMReadData_SRAM   => SSMEM_ReadData_SRAM,
      
      bus_out_Din             => SAVE_out_Din,
      bus_out_Dout            => SAVE_out_Dout,
      bus_out_Adr             => SAVE_out_Adr,
      bus_out_rnw             => SAVE_out_rnw,
      bus_out_ena             => SAVE_out_ena,
      bus_out_be              => SAVE_out_be,
      bus_out_done            => SAVE_out_done
   );  

   SSMEM_busy <= '1' when refreshCnt > 105 or refreshCnt < 2 else '0';   
   
   istatemanager : entity work.statemanager
   generic map
   (
      Softmap_SaveState_ADDR   => 58720256,
      Softmap_Rewind_ADDR      => 33554432
   )
   port map
   (
      clk                 => clk,  
      ce                  => ce,  
      reset               => reset_in,
                         
      rewind_on           => rewind_on,    
      rewind_active       => rewind_active,
                        
      savestate_number    => savestate_number,
      save                => save_state,
      load                => load_state,
                       
      sleep_rewind        => sleep_rewind,
      vsync               => IRQ_VBlank,
      system_idle         => system_idle,
                 
      request_savestate   => savestate_savestate,
      request_loadstate   => savestate_loadstate,
      request_address     => savestate_address,  
      request_busy        => savestate_busy    
   );
   
   -- export
-- synthesis translate_off
   gexport : if is_simu = '1' generate
   begin
   
      --new_export <= cpu_done and (not dma_active); 
      new_export <= cpu_done; 
      
      export_32 <= audio_l & audio_r;
   
      iexport : entity work.export
      port map
      (
         clk            => clk,
         ce             => ce,
         reset          => reset,
         
         new_export     => new_export,
         export_cpu     => cpu_export,
         
         export_irq     => export_irq,
         
         export_8       => export_8,
         export_16      => x"0000", --export_16,
         export_32      => x"00000000" --export_32
      );
   
   
   end generate;
-- synthesis translate_on
   

end architecture;
