library IEEE;
use IEEE.std_logic_1164.all;  
use IEEE.numeric_std.all;     

use work.pBus_savestates.all;

entity savestates is
   port 
   (
      clk                     : in     std_logic;  
      ce                      : in     std_logic;  
      reset_in                : in     std_logic;
      reset_out               : out    std_logic := '0';
      RegBus_rst              : out    std_logic := '0';
      
      ramtype                 : in  std_logic_vector(7 downto 0);
            
      load_done               : out    std_logic := '0';
            
      increaseSSHeaderCount   : in     std_logic;  
      save                    : in     std_logic;  
      load                    : in     std_logic;
      savestate_address       : in     integer;
      savestate_busy          : out    std_logic;

      system_idle             : in     std_logic;
      savestate_slow          : out    std_logic := '0';
            
      BUS_Din                 : out    std_logic_vector(SSBUS_buswidth-1 downto 0) := (others => '0');
      BUS_Adr                 : buffer std_logic_vector(SSBUS_busadr-1 downto 0) := (others => '0');
      BUS_wren                : out    std_logic := '0';
      BUS_rst                 : out    std_logic := '0';
      BUS_Dout                : in     std_logic_vector(SSBUS_buswidth-1 downto 0) := (others => '0');
            
      loading_savestate       : out    std_logic := '0';
      saving_savestate        : out    std_logic := '0';
      sleep_savestate         : out    std_logic := '0';
            
      Save_busy               : in     std_logic;           
      Save_RAMAddr            : buffer std_logic_vector(18 downto 0) := (others => '0');
      Save_RAMRdEn            : out    std_logic_vector( 2 downto 0) := (others => '0');
      Save_RAMWrEn            : out    std_logic_vector( 2 downto 0) := (others => '0');
      Save_RAMWriteData       : out    std_logic_vector(15 downto 0) := (others => '0');
      Save_RAMReadData_REG    : in     std_logic_vector( 7 downto 0);
      Save_RAMReadData_RAM    : in     std_logic_vector(15 downto 0);
      Save_RAMReadData_SRAM   : in     std_logic_vector(15 downto 0);
      
      bus_out_Din             : out    std_logic_vector(63 downto 0) := (others => '0');
      bus_out_Dout            : in     std_logic_vector(63 downto 0);
      bus_out_Adr             : buffer std_logic_vector(25 downto 0) := (others => '0');
      bus_out_rnw             : out    std_logic := '0';
      bus_out_ena             : out    std_logic := '0';
      bus_out_be              : out    std_logic_vector(7 downto 0) := (others => '0');
      bus_out_done            : in     std_logic
   );
end entity;

architecture arch of savestates is

   constant STATESIZE      : integer := 150000; -- about 10k reserved
   
   constant SETTLECOUNT    : integer := 100;
   constant HEADERCOUNT    : integer := 2;
   constant INTERNALSCOUNT : integer := 63; -- not all used, room for some more
   
   constant SAVETYPESCOUNT : integer := 3;
   signal savetype_counter : integer range 0 to SAVETYPESCOUNT;
   type t_savetypes is array(0 to SAVETYPESCOUNT - 1) of integer;
   signal savetypes : t_savetypes := 
   (
      -- Offset by 2 for header, and 63 for internals
      256,   -- REGISTER         0x41 - 0x141
      65536, -- RAM              0x141 - 0x10_141
      0      -- SRAM 0 - 524288  0x10_141 - 0x90_141
   );

   type tstate is
   (
      IDLE,
      SAVE_WAITIDLE,
      SAVE_WAITSETTLE,
      SAVEINTERNALS_WAIT,
      SAVEINTERNALS_WRITE,
      SAVEMEMORY_NEXT,
      SAVEMEMORY_READY,
      SAVEMEMORY_WAITREAD,
      SAVEMEMORY_READ,
      SAVEMEMORY_WRITE,
      SAVESIZEAMOUNT,
      LOAD_WAITSETTLE,
      LOAD_HEADERAMOUNTCHECK,
      LOADINTERNALS_READ,
      LOADINTERNALS_WRITE,
      LOADMEMORY_NEXT,
      LOADMEMORY_READ,
      LOADMEMORY_READY,
      LOADMEMORY_WRITE,
      LOADMEMORY_WRITE_SLOW,
      LOADMEMORY_WRITE_NEXT
   );
   signal state : tstate := IDLE;
   
   signal count               : integer range 0 to 524288 := 0;
   signal maxcount            : integer range 0 to 524288;
               
   signal settle              : integer range 0 to SETTLECOUNT := 0;
   
   signal bytecounter         : integer range 0 to 7 := 0;
   signal Save_RAMReadData    : std_logic_vector(15 downto 0);
   signal RAMAddrNext         : std_logic_vector(18 downto 0) := (others => '0');
   signal slowcounter         : integer range 0 to 2 := 0;
   
   signal header_amount       : unsigned(31 downto 0) := to_unsigned(1, 32);

begin 

   savestate_busy <= '0' when state = IDLE else '1';
   
   Save_RAMReadData <= x"00" & Save_RAMReadData_REG when savetype_counter = 0 else
                       Save_RAMReadData_RAM         when savetype_counter = 1 else
                       Save_RAMReadData_SRAM;

   process (clk)
   begin
      if rising_edge(clk) then
   
         Save_RAMRdEn <= (others => '0');
         Save_RAMWrEn <= (others => '0');
         bus_out_ena   <= '0';
         BUS_wren      <= '0';
         BUS_rst       <= '0';
         reset_out     <= '0';
         RegBus_rst    <= '0';
         load_done     <= '0';

         bus_out_be    <= x"FF";
         
         case (ramtype) is
            when x"01"  => savetypes(2) <=   8192; 
            when x"02"  => savetypes(2) <=  32768;
            when x"03"  => savetypes(2) <= 131072; 
            when x"04"  => savetypes(2) <= 262144; 
            when x"05"  => savetypes(2) <= 524288; 
            when others => savetypes(2) <= 0;
         end case;
         
         case state is
         
            when IDLE =>
               savetype_counter <= 0;
               savestate_slow   <= '0';
               if (reset_in = '1') then
                  reset_out      <= '1';
                  RegBus_rst     <= '1';
                  BUS_rst        <= '1';
               elsif (save = '1') then
                  savestate_slow       <= '1';
                  state                <= SAVE_WAITIDLE;
                  header_amount        <= header_amount + 1;
               elsif (load = '1') then
                  state                <= LOAD_WAITSETTLE;
                  settle               <= 0;
                  sleep_savestate      <= '1';
               end if;
               
            -- #################
            -- SAVE
            -- #################
            
            when SAVE_WAITIDLE =>
               if (system_idle = '1' and ce = '0') then
                  state                <= SAVE_WAITSETTLE;
                  settle               <= 0;
                  sleep_savestate      <= '1';
               end if;
            
            when SAVE_WAITSETTLE =>
               if (settle < SETTLECOUNT) then
                  settle <= settle + 1;
               else
                  saving_savestate <= '1';

                  state          <= SAVESIZEAMOUNT;
                  bus_out_Adr    <= std_logic_vector(to_unsigned(savestate_address, 26));
                  bus_out_Din    <= std_logic_vector(to_unsigned(STATESIZE, 32)) & std_logic_vector(header_amount);
                  bus_out_ena    <= '1';
                  if (increaseSSHeaderCount = '0') then
                     bus_out_be  <= x"F0";
                  end if;
               end if; 
               
            when SAVESIZEAMOUNT =>
               if (bus_out_done = '1') then
                  state            <= SAVEINTERNALS_WAIT;
                  bus_out_Adr      <= std_logic_vector(to_unsigned(savestate_address + HEADERCOUNT, 26));
                  bus_out_rnw      <= '0';
                  BUS_adr          <= (others => '0');
                  count            <= 1;
               end if;
            
            when SAVEINTERNALS_WAIT =>
               bus_out_Din    <= BUS_Dout;
               bus_out_ena    <= '1';
               state          <= SAVEINTERNALS_WRITE;
            
            when SAVEINTERNALS_WRITE => 
               if (bus_out_done = '1') then
                  bus_out_Adr <= std_logic_vector(unsigned(bus_out_Adr) + 2);
                  if (count < INTERNALSCOUNT) then
                     state       <= SAVEINTERNALS_WAIT;
                     count       <= count + 1;
                     BUS_adr     <= std_logic_vector(unsigned(BUS_adr) + 1);
                  else 
                     state       <= SAVEMEMORY_NEXT;
                     count       <= 8;
                  end if;
               end if;
            
            when SAVEMEMORY_NEXT =>
               if (savetype_counter < SAVETYPESCOUNT) then
                  state        <= SAVEMEMORY_READY;
                  bytecounter  <= 0;
                  count        <= 8;
                  maxcount     <= savetypes(savetype_counter);
                  Save_RAMAddr <= (others => '0');
               else
                  state            <= IDLE;
                  saving_savestate <= '0';
                  sleep_savestate  <= '0';
               end if;
               
            when SAVEMEMORY_READY =>
               if (Save_busy = '0') then
                  state        <= SAVEMEMORY_WAITREAD;
                  Save_RAMRdEn(savetype_counter) <= '1';
                  slowcounter  <= 0;
               end if;
               
            when SAVEMEMORY_WAITREAD =>
               if (savetype_counter = 2 and slowcounter < 2) then
                  slowcounter <= slowcounter + 1;
               else
                  state <= SAVEMEMORY_READ;
               end if;
            
            when SAVEMEMORY_READ =>
               if (savetype_counter = 0) then
                  bus_out_Din(bytecounter * 8 +  7 downto bytecounter * 8)  <= Save_RAMReadData(7 downto 0);
               else
                  bus_out_Din(bytecounter * 8 + 15 downto bytecounter * 8)  <= Save_RAMReadData;
               end if;
               if (savetype_counter = 0) then
                  Save_RAMAddr   <= std_logic_vector(unsigned(Save_RAMAddr) + 1);
               else
                  Save_RAMAddr   <= std_logic_vector(unsigned(Save_RAMAddr) + 2);
               end if;
               if ((savetype_counter = 0 and bytecounter < 7) or (savetype_counter > 0 and bytecounter < 6)) then
                  state       <= SAVEMEMORY_WAITREAD;
                  slowcounter <= 0;
                  Save_RAMRdEn(savetype_counter) <= '1';
                  if (savetype_counter = 0) then
                     bytecounter    <= bytecounter + 1;
                  else
                     bytecounter    <= bytecounter + 2;
                  end if;
               else
                  state          <= SAVEMEMORY_WRITE;
                  bus_out_ena    <= '1';
               end if;
               
            when SAVEMEMORY_WRITE =>
               if (bus_out_done = '1') then
                  bus_out_Adr <= std_logic_vector(unsigned(bus_out_Adr) + 2);
                  if (count < maxcount) then
                     state        <= SAVEMEMORY_READY;
                     bytecounter  <= 0;
                     count        <= count + 8;
                  else 
                     savetype_counter <= savetype_counter + 1;
                     state            <= SAVEMEMORY_NEXT;
                  end if;
               end if;            
            
            -- #################
            -- LOAD
            -- #################
            
            when LOAD_WAITSETTLE =>
               if (settle < SETTLECOUNT) then
                  settle <= settle + 1;
               else
                  state                <= LOAD_HEADERAMOUNTCHECK;
                  bus_out_Adr          <= std_logic_vector(to_unsigned(savestate_address, 26));
                  bus_out_rnw          <= '1';
                  bus_out_ena          <= '1';
               end if;
               
            when LOAD_HEADERAMOUNTCHECK =>
               if (bus_out_done = '1') then
                  if (bus_out_Dout(63 downto 32) = std_logic_vector(to_unsigned(STATESIZE, 32))) then
                     header_amount        <= unsigned(bus_out_Dout(31 downto 0));
                     state                <= LOADINTERNALS_READ;
                     bus_out_Adr          <= std_logic_vector(to_unsigned(savestate_address + HEADERCOUNT, 26));
                     bus_out_ena          <= '1';
                     BUS_adr              <= (others => '0');
                     count                <= 1;
                     loading_savestate    <= '1';
                     reset_out            <= '1';
                     RegBus_rst           <= '1';
                  else
                     state                <= IDLE;
                     sleep_savestate      <= '0';
                  end if;
               end if;
            
            when LOADINTERNALS_READ =>
               if (bus_out_done = '1') then
                  state           <= LOADINTERNALS_WRITE;
                  BUS_Din         <= bus_out_Dout;
                  BUS_wren        <= '1';
               end if;
            
            when LOADINTERNALS_WRITE => 
               bus_out_Adr <= std_logic_vector(unsigned(bus_out_Adr) + 2);
               if (count < INTERNALSCOUNT) then
                  state          <= LOADINTERNALS_READ;
                  count          <= count + 1;
                  bus_out_ena    <= '1';
                  BUS_adr        <= std_logic_vector(unsigned(BUS_adr) + 1);
               else 
                  state              <= LOADMEMORY_NEXT;
                  count              <= 8;
               end if;
            
            when LOADMEMORY_NEXT =>
               if (savetype_counter < SAVETYPESCOUNT) then
                  state          <= LOADMEMORY_READ;
                  count          <= 8;
                  maxcount       <= savetypes(savetype_counter);
                  Save_RAMAddr   <= (others => '0');
                  RAMAddrNext    <= (others => '0');
                  bytecounter    <= 0;
                  bus_out_ena    <= '1';
               else
                  state             <= IDLE;
                  reset_out         <= '1';
                  loading_savestate <= '0';
                  sleep_savestate   <= '0';
                  load_done         <= '1';
               end if;
            
            when LOADMEMORY_READ =>
               if (bus_out_done = '1') then
                  state             <= LOADMEMORY_READY;
               end if;
               
            when LOADMEMORY_READY =>
               if (Save_busy = '0') then
                  state             <= LOADMEMORY_WRITE;
               end if;
               
            when LOADMEMORY_WRITE =>
               if (savetype_counter = 0) then
                  RAMAddrNext       <= std_logic_vector(unsigned(RAMAddrNext) + 1);
                  Save_RAMWriteData <= x"00" & bus_out_Dout(bytecounter * 8 + 7 downto bytecounter * 8);
               else
                  RAMAddrNext       <= std_logic_vector(unsigned(RAMAddrNext) + 2);
                  Save_RAMWriteData <= bus_out_Dout(bytecounter * 8 + 15 downto bytecounter * 8);
               end if;
               Save_RAMAddr                   <= RAMAddrNext;
               Save_RAMWrEn(savetype_counter) <= '1';
               if (savetype_counter = 2) then
                  state       <= LOADMEMORY_WRITE_SLOW;
               else
                  state <= LOADMEMORY_WRITE_NEXT;
               end if;
         
            when LOADMEMORY_WRITE_SLOW =>
               state <= LOADMEMORY_WRITE_NEXT;
               
            when LOADMEMORY_WRITE_NEXT =>
               state <= LOADMEMORY_WRITE;
               if (bytecounter < 7 and savetype_counter = 0) then
                  bytecounter <= bytecounter + 1;
               elsif (bytecounter < 6 and savetype_counter > 0) then
                  bytecounter <= bytecounter + 2;
               else
                  bus_out_Adr  <= std_logic_vector(unsigned(bus_out_Adr) + 2);
                  if (count < maxcount) then
                     state          <= LOADMEMORY_READ;
                     count          <= count + 8;
                     bytecounter    <= 0;
                     bus_out_ena    <= '1';
                  else 
                     savetype_counter <= savetype_counter + 1;
                     state            <= LOADMEMORY_NEXT;
                  end if;
               end if;
            
         
         end case;
         
         if (reset_in = '1') then
            state <= IDLE;
         end if;
         
      end if;
   end process;
   

end architecture;





