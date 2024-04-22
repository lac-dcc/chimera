----------------------------------------------------------------------------------
-- MiSTer2MEGA65 Framework
--
-- QNICE Memory Mapped IO Controller
-- based on QNICE-FPGA V1.61
--
-- Meant to be integrated upstream (for example in QNICE-FPGA V1.7) so that
-- this specific implemention will become redundant in future.
--
-- QNICE Co-Processor is based on QNICE-FPGA done by The QNICE Development Team
-- MEGA65 port done by sy2002 in 2021 and licensed under GPL v3
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

use work.env1_globals.all;
use work.qnice_tools.all;

entity mmio_mux is
generic (
   GD_TIL            : boolean := true;   -- support TIL leds (e.g. as available on the Nexys 4 DDR)
   GD_SWITCHES       : boolean := true;   -- support SWITCHES (e.g. as available on the Nexys 4 DDR)
   GD_HRAM           : boolean := false;  -- support HyperRAM (e.g. as available on the MEGA65)
   GD_PORE           : boolean := true    -- support PORE and execute PORE ROM on startup
);
port (
   -- input from hardware
   HW_RESET          : in std_logic;
   CLK               : in std_logic;

   -- input from CPU
   addr              : in std_logic_vector(15 downto 0);
   data_dir          : in std_logic;
   data_valid        : in std_logic;
   cpu_halt          : in std_logic;
   cpu_igrant_n      : in std_logic; -- if this goes to 0, then all devices need to leave the DATA bus alone,
                                     -- because the interrupt device will put the ISR address on the bus
   
   -- let the CPU wait for data from the bus
   cpu_wait_for_data : out std_logic;
   
   -- ROM is enabled when the address is < $8000 and the CPU is reading
   rom_enable        : out std_logic;
   rom_busy          : in std_logic;
   
   -- RAM is enabled when the address is in ($8000..$FEFF)
   ram_enable        : out std_logic;
   ram_busy          : in std_logic;
   
   -- PORE ROM (PowerOn & Reset Execution ROM)
   pore_rom_enable   : out std_logic;
   pore_rom_busy     : in std_logic;
   
   -- SWITCHES is $FF00
   switch_reg_enable : out std_logic;
   
   -- TIL register range: $FF01..$FF02
   til_reg0_enable   : out std_logic;
   til_reg1_enable   : out std_logic;
   
   -- Keyboard register range $FF04..$FF07
   kbd_en            : buffer std_logic;
   kbd_we            : out std_logic;
   kbd_reg           : out std_logic_vector(1 downto 0);
      
   -- Cycle counter register range $FF08..$FF0B
   cyc_en            : buffer std_logic;
   cyc_we            : out std_logic;
   cyc_reg           : out std_logic_vector(1 downto 0);

   -- Instruction counter register range $FF0C..$FF0F
   ins_en            : buffer std_logic;
   ins_we            : out std_logic;
   ins_reg           : out std_logic_vector(1 downto 0);

   -- UART register range $FF10..$FF13
   uart_en           : buffer std_logic;
   uart_we           : out std_logic;
   uart_reg          : out std_logic_vector(1 downto 0);
   uart_cpu_ws       : in std_logic;
   
   -- Extended Arithmetic Element register range $FF18..$FF1F
   eae_en            : buffer std_logic;
   eae_we            : out std_logic;
   eae_reg           : out std_logic_vector(2 downto 0);

   -- SD Card register range $FF20..FF27
   sd_en             : buffer std_logic;
   sd_we             : out std_logic;
   sd_reg            : out std_logic_vector(2 downto 0);

   -- Timer Interrupt Generator range $FF28 .. $FF2F
   tin_en            : buffer std_logic;
   tin_we            : out std_logic;
   tin_reg           : out std_logic_vector(2 downto 0);
   
   -- VGA register range $FF30..$FF3F
   vga_en            : buffer std_logic;
   vga_we            : out std_logic;
   vga_reg           : out std_logic_vector(3 downto 0);

   -- HyerRAM register range $FFF0 .. $FFF3
   hram_en           : buffer std_logic;
   hram_we           : out std_logic;
   hram_reg          : out std_logic_vector(3 downto 0); 
   hram_cpu_ws       : in std_logic; -- insert CPU wait states (aka WAIT_FOR_DATA)   
 
   -- global state and reset management
   reset_pre_pore    : out std_logic;
   reset_post_pore   : out std_logic
);
end mmio_mux;

architecture Behavioral of mmio_mux is

component debounce is
generic (
   counter_size  : integer
);
port (
   clk           : in std_logic;
   button        : in std_logic;
   result        : out std_logic
);
end component;

signal ram_enable_i : std_logic;
signal rom_enable_i : std_logic;
signal pore_rom_enable_i : std_logic;
signal use_pore_rom_i : std_logic;

-- Reset and Power-On-Reset state machine
type global_state_type is
(
   gsPowerOn,
   gsReset,
   gsReset_execute,
   gsPORE,
   gsPostPoreReset,
   gsPostPoreReset_execute,
   gsRun
);

-- as we check for "= RESET_DURATION", we need one bit more,
-- so RESET_COUNTER_BTS is not decremented by 1
constant RESET_COUNTER_BTS    : natural := f_log2(RESET_DURATION);

signal global_state           : global_state_type := gsPowerOn;

signal debounced_hw_reset     : std_logic;
signal reset_ctl              : std_logic;
signal boot_msg_char          : std_logic_vector(7 downto 0);
signal reset_counter          : unsigned(RESET_COUNTER_BTS downto 0);

signal fsm_next_global_state  : global_state_type;
signal fsm_reset_counter      : unsigned(RESET_COUNTER_BTS downto 0);

signal no_igrant_active : boolean;

begin

   -- we need to decouple all devices from the data bus during an IGRANT_N, because
   -- the requesting device is putting the address of the ISR on the data bus durnig that time
   -- (see also doc/intro/qnice_intro.pdf, section 5 "Interrupts")
   no_igrant_active <= true when cpu_igrant_n = '1' else false;
   
   -- Block FF00: FUNDAMENTAL IO
   switch_reg_enable <= not data_dir            when GD_SWITCHES and addr = x"FF00" and no_igrant_active else '0'; -- Read only
   til_reg0_enable   <= data_dir and data_valid when GD_TIL and addr = x"FF01" and no_igrant_active else '0';    -- Write only
   til_reg1_enable   <= data_dir and data_valid when GD_TIL and addr = x"FF02" and no_igrant_active else '0';    -- Write only

   kbd_en            <= '1' when addr(15 downto 2) = x"FF0" & "01" and no_igrant_active else '0';     -- FF04
   kbd_we            <= kbd_en and data_dir and data_valid;
   kbd_reg           <= addr(1 downto 0);

   -- Block FF08: SYSTEM COUNTERS
   cyc_en            <= '1' when addr(15 downto 2) = x"FF0" & "10" and no_igrant_active else '0';     -- FF08
   cyc_we            <= cyc_en and data_dir and data_valid;
   cyc_reg           <= addr(1 downto 0);

   ins_en            <= '1' when addr(15 downto 2) = x"FF0" & "11" and no_igrant_active else '0';     -- FF0C
   ins_we            <= ins_en and data_dir and data_valid;
   ins_reg           <= addr(1 downto 0);

   -- Block FF10: UART
   uart_en           <= '1' when addr(15 downto 3) = x"FF1" & "0" and no_igrant_active else '0';      -- FF10
   uart_we           <= uart_en and data_dir and data_valid;
   uart_reg          <= addr(1 downto 0);

   -- Block FF18: EAE
   eae_en            <= '1' when addr(15 downto 3) = x"FF1" & "1" and no_igrant_active else '0';      -- FF18
   eae_we            <= eae_en and data_dir and data_valid;
   eae_reg           <= addr(2 downto 0);

   -- Block FF20: SD CARD
   sd_en             <= '1' when addr(15 downto 3) = x"FF2" & "0" and no_igrant_active else '0';      -- FF20
   sd_we             <= sd_en and data_dir and data_valid;
   sd_reg            <= addr(2 downto 0);
   
   -- Block FF28: Timer Interrupt Generator
   tin_en            <= '1' when addr(15 downto 3) = x"FF2" & "1" and no_igrant_active else '0';      -- FF28   
   tin_we            <= tin_en and data_dir and data_valid;
   tin_reg           <= addr(2 downto 0);   

   -- Block FF30: VGA (double block, 16 registers)
   vga_en            <= '1' when addr(15 downto 4) = x"FF3" and no_igrant_active else '0';            -- FF30
   vga_we            <= vga_en and data_dir and data_valid;
   vga_reg           <= addr(3 downto 0);
   
   -- Block FFF0: MEGA65 block, currently only HyperRAM
   hram_en           <= '1' when GD_HRAM and addr(15 downto 4) = x"FFF" and no_igrant_active else '0';   -- FFF0
   hram_we           <= hram_en and data_dir and data_valid;
   hram_reg          <= addr(3 downto 0); -- needs to be modified, as soon as there is more than just HRAM 
            
   -- generate CPU wait signal   
   -- as long as the RAM is the only device on the bus that can make the
   -- CPU wait, this simple implementation is good enough
   -- otherwise, a "req_busy" bus could be built (replacing the ram_busy input)
   -- the block_ram's busy line is already a tri state, so it is ready for such a bus
   cpu_wait_control : process (ram_enable_i, rom_enable_i, pore_rom_enable_i, ram_busy, rom_busy,
                               pore_rom_busy, uart_cpu_ws, hram_cpu_ws, no_igrant_active)
   begin
      cpu_wait_for_data <= '0';
      
      if no_igrant_active then
         if ram_enable_i = '1' and ram_busy = '1' then
            cpu_wait_for_data <= '1';
         elsif rom_enable_i = '1' and rom_busy = '1' then
            cpu_wait_for_data <= '1';
         elsif pore_rom_enable_i = '1' and pore_rom_busy = '1' then
            cpu_wait_for_data <= '1';
         elsif GD_HRAM and hram_cpu_ws = '1' then
            cpu_wait_for_data <= '1';
         elsif uart_cpu_ws = '1' then
            cpu_wait_for_data <= '1';
         end if;
      end if;
   end process;

--   -- debounce the reset button
--   reset_btn_debouncer : debounce
--      generic map (
--         counter_size => 18            -- @TODO change to 19 when running with 100 MHz
--      )
--      port map (
--         clk => CLK,
--         button => HW_RESET,
--         result => debounced_hw_reset
--      );
   debounced_hw_reset <= HW_RESET;


   -- PORE state machine: advance state
   fsm_advance_state : process (clk, debounced_hw_reset)
   begin
      if debounced_hw_reset = '1' then
         global_state <= gsReset;
         reset_counter <= (others => '0');
      else
         if rising_edge(clk) then
            global_state      <= fsm_next_global_state;
            reset_counter     <= fsm_reset_counter;
         end if;
      end if;
   end process;
   
   -- PORE state machine: calculate next state
   fsm_calc_state : process(global_state, reset_counter, cpu_halt)
   begin
      fsm_next_global_state   <= global_state;
      fsm_reset_counter       <= reset_counter;
            
      case global_state is
      
         when gsPowerOn =>
            fsm_next_global_state <= gsReset;
            
         when gsReset =>
            fsm_reset_counter <= (others => '0');
            fsm_next_global_state <= gsReset_execute;
            
         when gsReset_execute =>
            if reset_counter = RESET_DURATION then
               if GD_PORE then
                  fsm_next_global_state <= gsPORE;
               else                              
                  fsm_next_global_state <= gsRun;
               end if;
            else
               fsm_reset_counter <= reset_counter + 1;
               fsm_next_global_state <= gsReset_execute;               
            end if;
            
         when gsPORE =>
            if cpu_halt = '1' then
               fsm_next_global_state <= gsPostPoreReset;
            end if;
         
         when gsPostPoreReset =>
            fsm_reset_counter <= (others => '0');
            fsm_next_global_state <= gsPostPoreReset_execute;
            
         when gsPostPoreReset_execute =>            
            if reset_counter = RESET_DURATION then
               fsm_next_global_state <= gsRun;
            else
               fsm_reset_counter <= reset_counter + 1;
               fsm_next_global_state <= gsPostPoreReset_execute;               
            end if;            

         when gsRun => null;
      end case;
   end process;

   -- PORE ROM is used in all global states other than gsRun
   use_pore_rom_i <= '0' when cpu_igrant_n = '0' or (GD_PORE = false) or
                              (global_state = gsPostPoreReset or
                               global_state = gsPostPoreReset_execute or
                               global_state = gsRun)
                         else '1';
   pore_rom_enable_i <= not addr(15) and not data_dir and use_pore_rom_i and cpu_igrant_n;

   -- ROM is enabled when the address is < $8000 and the CPU is reading
   rom_enable_i <= not addr(15) and not data_dir and not use_pore_rom_i and cpu_igrant_n;
   
   -- RAM is enabled when the address is in ($8000..$FEFF)
   ram_enable_i <= addr(15)
                   and not (addr(14) and addr(13) and addr(12) and addr(11) and addr(10) and addr(9) and addr(8))
                   and cpu_igrant_n;
               
   -- generate external RAM/ROM/PORE enable signals
   ram_enable <= ram_enable_i;
   rom_enable <= rom_enable_i;
   pore_rom_enable <= pore_rom_enable_i;
   
   -- generate external reset signals
   reset_pre_pore <= '1' when (global_state = gsPowerOn or global_state = gsReset or global_state = gsReset_execute) else '0';
   reset_post_pore <= '1' when (global_state = gsPostPoreReset or global_state = gsPostPoreReset_execute) else '0';
   
end Behavioral;
