----------------------------------------------------------------------------------
-- MiSTer2MEGA65 Framework
--
-- Smart MEGA65 SD Card multiplexer
--
-- Activate the bottom tray's SD card, if there is no SD card in the slot on the
-- machine's back side. Otherwise the back side slot has precedence. It is
-- possible to overwrite the automatic behavior.
--
-- The smart multiplexer also makes sure that the QNICE SD card controller is
-- being reset as soon as the SD card is switched. 
--
-- CAVEAT: RIGHT NOW WE CANNOT DETECT THE TRAY SD CARD on R3 machines. This
-- is a PCB bug and it has been fixed on R3A machines.
--
-- MiSTer2MEGA65 done by sy2002 and MJoergen in 2022 and licensed under GPL v3
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sdmux is
   port (
      -- QNICE system interface
      sysclk50Mhz_i     : in std_logic;   -- QNIEC system clock
      sysreset_i        : in std_logic;   -- QNICE system reset
      
      -- Configuration lines to control the behavior of the multiplexer
      mode_i            : in std_logic;   -- SD Card mode: 0=Auto: SD card switches between the internal card (bottom tray)
                                          -- and the external card (back slot) automatically: External has higher precedence
      active_o          : out std_logic;  -- Currently active SD card: 0=internal / 1=external
      force_i           : in std_logic;   -- if mode_i=1 then use this to force internal (0) or external (1)
      detected_int_o    : out std_logic;  -- 1=internal SD card detected
      detected_ext_o    : out std_logic;  -- 1=external SD card detected
      
      -- interface to bottom tray's SD card
      sd_tray_detect_i  : in std_logic;   -- low active
      sd_tray_reset_o   : out std_logic;
      sd_tray_clk_o     : out std_logic;
      sd_tray_mosi_o    : out std_logic;
      sd_tray_miso_i    : in std_logic;
      
      -- interface to the SD card in the back slot
      sd_back_detect_i  : in std_logic;   -- low active
      sd_back_reset_o   : out std_logic;
      sd_back_clk_o     : out std_logic;
      sd_back_mosi_o    : out std_logic;
      sd_back_miso_i    : in std_logic;
      
      -- interface to the QNICE SD card controller
      ctrl_reset_o      : out std_logic;  -- high active; it is important that sdmux controls the QNICE controller's reset
      ctrl_sd_reset_i   : in std_logic;
      ctrl_sd_clk_i     : in std_logic;
      ctrl_sd_mosi_i    : in std_logic;
      ctrl_sd_miso_o    : out std_logic
   );
end sdmux;

architecture beh of sdmux is

constant CPU_CLOCK_HZ       : integer := 50_000_000;
constant TIME_CTRL_RESET_MS : integer := 100;   -- SD card controller reset time in milliseconds

constant RESET_MAX_CNT      : integer := (CPU_CLOCK_HZ / (1000 / TIME_CTRL_RESET_MS)) - 1; 

type tSDMux_States is ( s_reset,
                        s_select_card,
                        s_reset_controller,
                        s_idle
                      );
                      
signal mux_state        : tSDMux_States;

signal active           : std_logic;         -- active SD card: 0=internal / 1=external
signal counter          : integer range 0 to RESET_MAX_CNT; 
signal current_mode     : std_logic;

signal fsm_nextstate    : tSDMux_States;
signal fsm_active       : std_logic;
signal fsm_counter      : integer range 0 to RESET_MAX_CNT;
signal fsm_current_mode : std_logic;

begin
   ctrl_reset_o      <= '1' when sysreset_i = '1' or mux_state /= s_idle else '0';
   active_o          <= active;      
   detected_int_o    <= not sd_tray_detect_i;
   detected_ext_o    <= not sd_back_detect_i;
   
   -- re-wire QNICE's controller inputs/outputs according to the currently active SD card
   connect_sd_cards : process(all)
   begin
      if active = '0' then
         sd_tray_reset_o   <= ctrl_sd_reset_i;
         sd_tray_clk_o     <= ctrl_sd_clk_i;
         sd_tray_mosi_o    <= ctrl_sd_mosi_i;
         ctrl_sd_miso_o    <= sd_tray_miso_i;
         
         sd_back_reset_o   <= '1';
         sd_back_clk_o     <= '0';
         sd_back_mosi_o    <= '0';
      else
         sd_back_reset_o   <= ctrl_sd_reset_i;
         sd_back_clk_o     <= ctrl_sd_clk_i;
         sd_back_mosi_o    <= ctrl_sd_mosi_i;
         ctrl_sd_miso_o    <= sd_back_miso_i;
         
         sd_tray_reset_o   <= '1';
         sd_tray_clk_o     <= '0';
         sd_tray_mosi_o    <= '0';
      end if;
   end process;
   
   -- set the state machine's registers 
   fsm_advance_state : process (sysclk50Mhz_i)
   begin
      if rising_edge(sysclk50Mhz_i) then
         if sysreset_i = '1' then
            mux_state      <= s_reset;
            active         <= '0';           -- default: internal card (bottom tray)
            counter        <= RESET_MAX_CNT;
            current_mode   <= '0';
         else
            mux_state      <= fsm_nextstate;
            active         <= fsm_active;
            counter        <= fsm_counter;
            current_mode   <= fsm_current_mode;
         end if;
      end if;
   end process;
   
   -- the actual state machine
   fsm_output_decode : process(all)
   begin
      fsm_nextstate     <= mux_state;
      fsm_active        <= active;
      fsm_counter       <= counter;
      fsm_current_mode  <= current_mode;
      
      case mux_state is
         when s_reset =>
            fsm_nextstate     <= s_select_card;     

            fsm_active        <= '0';
            fsm_counter       <= RESET_MAX_CNT;
            fsm_current_mode  <= mode_i;
            
         when s_select_card =>
            fsm_nextstate  <= s_reset_controller;
         
            -- automatic mode
            if current_mode = '0' then
               -- if external card detected: take it
               -- CAVEAT / TODO: Due to a non working detection pin for the internal card, we cannot be smarter here
               fsm_active <= detected_ext_o;
            -- manual mode
            else
               fsm_active <= force_i; -- use the card specified by QNICE
            end if;
            
         when s_reset_controller =>
            fsm_nextstate  <= s_idle;
            if counter = 0 then
               fsm_nextstate <= s_idle;
            else
               fsm_counter <= counter - 1;
            end if;
            
         when s_idle =>
            -- if something has changed
            if (mode_i = '0' and active /= detected_ext_o) or
               (mode_i = '1' and active /= force_i) then
                  fsm_nextstate <= s_reset;
            end if;
                        
         when others => null;         
      end case;
   end process;
   
end beh;
