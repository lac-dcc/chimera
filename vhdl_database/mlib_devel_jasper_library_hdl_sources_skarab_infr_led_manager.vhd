----------------------------------------------------------------------------------

-- Create Date: 31.10.2017
-- Design Name: 
-- Module Name: led_manager - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Manages the LEDs on the front panel according to the following layout:
-- -    GREEN |  RED
-- - _________|_________
-- -    1: O  |  O :0       --> 40GbE Status
-- -    3: O  |  O :2       --> Image Indicator
-- -    5: O  |  O :4       --> Firmware/SPARTAN Up
-- -    7: O  |  O :6       --> Microblaze Up
--
-- ** REMEMBER! **
-- -> LED control logic is negated, i.e. Active LOW
-- -> Therefore, signals need to be not'd when assigning to PORTs
--
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

use ieee.numeric_std.ALL;
use ieee.std_logic_unsigned.all;

entity led_manager is
port(
    clk : in std_logic;
    rst : in std_logic;
            
    -- Use fgbe_link_status from frm...u1r1.vhd
    -- > Checks if ANY of the 40GbE links are up (OR)
    forty_gbe_link_status : in std_logic;
    -- > Need a signal to confirm it has resolved to an IP
    dhcp_resolved : in std_logic;

    -- Need the VERSION (Constant) to dictate image_indicator
    -- Only need top-most nibble of 32-bit version number
    -- Need to clarify which image is running on FPGA
    -- > At the moment, I think that needs to come from parameters.vhd
    firmware_version : in std_logic_vector(3 downto 0);

    -- But we actually need to accommodate for 40GbE AND 1GbE
    -- > Therefore, we need some kind of MUX/Indicator from uBlaze to tell us which link is up
    -- > Handle case when both are up accordingly
    
    -- To monitor the status of the Microblaze
    -- > Microblaze will toggle the 0th-bit at address 0x24: CONSULT FUM.pdf
    ublaze_toggle_value : in std_logic;

    -- Needs to be controlled via a Wishbone Register @ Addr = hex(13 * 4)
    dsp_override_i : in std_logic;
	-- DSP LEDs in need to be CDC'd
	dsp_leds_i : in std_logic_vector(7 downto 0);

    -- Pass in/Associate the relevant FPGA_GPIOs here
    -- > REMEMBER: Active LOW - Signals are inverted upon assignment
    leds_out : out std_logic_vector(7 downto 0)

    );
end led_manager;

architecture arch_led_manager of led_manager is

     -- In reality, using firmware_version does not mean the board is up
     -- > Therefore we need a foolproof mechanism to dictate if the FPGA configured succesfully    
     constant C_DHCP_RESOLVED      : std_logic_vector(2 downto 0)  := "100";
     constant C_FGBE_LINK_UP       : std_logic_vector(2 downto 0)  := "010";
     constant C_FGBE_LINK_DOWN     : std_logic_vector(2 downto 0)  := "001";    

     constant C_GOLDEN_IMAGE       : std_logic_vector(3 downto 0)  := "1000";
     constant C_MULTIBOOT_IMAGE    : std_logic_vector(3 downto 0)  := "0100";
     constant C_TOOLFLOW_IMAGE     : std_logic_vector(3 downto 0)  := "0000";

     constant C_MAX_COUNT_25BIT    : std_logic_vector(24 downto 0) := "1111111111111111111111111"; -- 16#1FFFFFF#;
     constant C_MAX_COUNT_31BIT    : std_logic_vector(30 downto 0) := "1111111111111111111111111111111"; -- 16#7FFFFFFF#;
     
     attribute ASYNC_REG : string;
 
     signal bsp_leds_out : std_logic_vector(7 downto 0);
     -- Need to cross clock domains for DSP LEDs (user_clk to sys_clk)
     signal sDspLeds : std_logic_vector(7 downto 0);
     signal sBusLedValidD1 : std_logic;
     signal sBusLedValid : std_logic;
     attribute ASYNC_REG of sBusLedValidD1: signal is "TRUE";
     attribute ASYNC_REG of sBusLedValid: signal is "TRUE";	
	
     -- One counter to handle flashing for all cases of LED-flashing
     signal flash_counter	  : std_logic_vector(26 downto 0);
     signal flash_toggle_value : std_logic;

     -- > According to THREE possible states of Ethernet connection
     --   -> 100: DHCP Success  |  010: Link UP, No DHCP  |  000: Link DOWN
     signal eth_led_indicators  : std_logic_vector(2 downto 0);
     signal flash_link_up	   : std_logic;
     -- signal flash_link_up_counter    : std_logic_vector(26 downto 0);

     --   -> 100: Toolflow Image  |  010: Multiboot Image  |  000: Golden Image
     signal image_led_indicators  : std_logic_vector(2 downto 0);
     signal flash_multiboot_image : std_logic;
     -- signal flash_multiboot_image_counter    : std_logic_vector(26 downto 0);

     -- The mere fact that this process is running
     -- is enough evidence that the fpga is running
     signal fpga_running_flag    : std_logic;

     -- > To be read from a register specified in the uBlaze
     signal ublaze_toggle        : std_logic;
     signal ublaze_toggle_z      : std_logic;
     signal ublaze_count_reset   : std_logic;
     signal ublaze_counter       : std_logic_vector(26 downto 0);    
     signal ublaze_running       : std_logic;
	
--	attribute mark_debug   : string;
--	attribute mark_debug of forty_gbe_link_status  : signal is "true";
--	attribute mark_debug of dhcp_resolved          : signal is "true";

begin
	-- ---------------------------------------------------------------------------------------    
	-- -> Mapped to LEDs 0 and 1
	-- -> Solid RED:       Link is DOWN (Not UP)
	-- -> Flashing GREEN:  Link is UP (No DHCP)
	-- -> Solid GREEN:     DHCP succesful

	eth_link_indicator : process(rst, clk, dhcp_resolved, forty_gbe_link_status)
	begin
		if (rst = '1')then
		    eth_led_indicators <= (others => '0');
		elsif (rising_edge(clk))then
		    if (forty_gbe_link_status = '1') then
		        if (dhcp_resolved = '1')then
		            -- Green LED needs to be ON
		            eth_led_indicators <= C_DHCP_RESOLVED;
		        else
		            -- Green LED needs to FLASH
		            eth_led_indicators <= C_FGBE_LINK_UP;
		        end if;
		    else
		        -- FGBE link is DOWN
		        eth_led_indicators <= C_FGBE_LINK_DOWN;
		    end if;
		end if;
		
		-- 1) Ethernet (40GbE) status:
		--    > LED0: RED LED   - Indicates Link is DOWN
		bsp_leds_out(0) <= not eth_led_indicators(0);
		
	end process;
	--    > LED1: GREEN LED - Flashes when Link is UP | Solid when DHCP Successful
	bsp_leds_out(1) <= flash_toggle_value when (eth_led_indicators(1) = '1') else (not eth_led_indicators(2));

	-- ---------------------------------------------------------------------------------------    
	-- -> Mapped to LEDs 2 and 3
	-- -> Solid RED:       Golden Image
	-- -> Flashing GREEN:  Multiboot Image
	-- -> Solid GREEN:     Toolflow Image

	image_indicator : process(rst, clk)--, firmware_version)
	begin
		if (rst = '1')then
		    image_led_indicators <= (others => '0');
		elsif (rising_edge(clk))then
		    -- Need to check the C_VERSION top nibble
		    if (firmware_version = C_GOLDEN_IMAGE)then
		        -- Red LED needs to be ON
		        image_led_indicators <= "001";
		    elsif (firmware_version = C_MULTIBOOT_IMAGE)then
		        image_led_indicators <= "010";
		    elsif (firmware_version = C_TOOLFLOW_IMAGE) then
		        image_led_indicators <= "100";
		    else
		        -- Realistically it should only be one of the above three options
		        image_led_indicators <= "001";
		    end if;
		end if;
		
		-- 2) Image Indicator: (Golden, Multiboot, Toolflow)
		--    > LED2: RED LED   - Indicates GOLDEN Image
		bsp_leds_out(2) <= not image_led_indicators(0);
	
	end process;
	--    > LED3: GREEN LED - Flashes when MULTIBOOT Image | Solid when TOOLFLOW Image
	bsp_leds_out(3) <= flash_toggle_value when (image_led_indicators(1) = '1') else (not image_led_indicators(2));

    -- ---------------------------------------------------------------------------------------

    flash_leds_counter : process(rst, clk, flash_counter)
    begin
	    if (rst = '1')then
	        flash_counter           <= (others => '0');
	        flash_toggle_value      <= '0';
	    elsif (rising_edge(clk))then
	        -- Count indefinitely, don't wait for any ENABLE
	        -- Now adjusting count value for reduced sys_clk = 39.0625MHz
	        if (flash_counter = C_MAX_COUNT_25BIT) then
	            -- Overflow
	            flash_counter       <= (others => '0');
	            flash_toggle_value  <= not flash_toggle_value;
	        else
	            flash_counter <= flash_counter + '1';
	        end if;
	    end if;
	end process;

	-- ---------------------------------------------------------------------------------------
	-- ---------------------------------------------------------------------------------------
	-- -> Mapped to LEDs 4 and 5
	-- -> Seeing as this process depends entirely on whether the firmware has loaded,
	--    a RED LED/Failed state is pretty much pointless
	--    ==> i.e. If the firmware hasn't loaded then this process will not run
	-- -> SOLID GREEN LED indicates firmware has loaded and running
	-- No need for fancy counters here (just yet)
	fpga_running : process(rst, clk)
	begin
		if (rst = '1')then
		    fpga_running_flag   <= '0';
		elsif (rising_edge(clk))then
			-- Assigning on Rising-edge of clock, just for completeness
			fpga_running_flag   <= '1';
		
			-- 3) Firmware/SPARTAN:
			--    > LED4: RED LED   - Won't ever be ON b/c explained earlier
			bsp_leds_out(4) <= fpga_running_flag;
			--    > LED5: GREEN LED - Indicates firmware has loaded and is running
			bsp_leds_out(5) <= (not fpga_running_flag);
		end if;
	end process;

	-- ---------------------------------------------------------------------------------------
	-- ---------------------------------------------------------------------------------------
	-- -> Mapped to LEDs 6 and 7
	-- -> Solid RED:       ublaze Running
	-- -> Flashing GREEN:  ublaze has 'stalled'
	-- -> Solid GREEN:     ublaze has stopped responding

	-- > ublaze will write to a single bit in (some) register
	-- -> This will be used as a reset for some free-running counter
	-- -> If the counter reaches some value after not being reset? RED LED ON    

	ublaze_up : process(rst, clk, ublaze_toggle, ublaze_toggle_z)
	begin
		if (rst = '1')then
		    ublaze_toggle    <= '0';
		    ublaze_toggle_z  <= '0';
		elsif (rising_edge(clk)) then
		    -- Need to clock in current ublaze_toggle_value
		    ublaze_toggle   <= ublaze_toggle_value;
		    ublaze_toggle_z <= ublaze_toggle;
		    if (ublaze_toggle ='1' and ublaze_toggle_z = '0')then
		        -- We have (effectively) detected a RISING-edge
		        ublaze_count_reset <= '1';
		    else                
		        ublaze_count_reset <= '0';
		    end if ;
		end if;
	end process;

	-- ---------------------------------------------------------------------------------------

	ublaze_count : process(rst, clk, ublaze_count_reset, ublaze_counter)
	begin
		if (rst = '1')then
		    ublaze_counter <= (others => '0');
		    ublaze_running <= '0';
		elsif (rising_edge(clk))then
		    if (ublaze_count_reset = '1')then
		        ublaze_counter <= (others => '0');
		        ublaze_running <= '1';
		    else
		        ublaze_counter <= ublaze_counter + '1';

		        -- Now adjusting count value for reduced sys_clk = 39.0625MHz
		        if (ublaze_counter = C_MAX_COUNT_31BIT)then
		            -- uBlaze has not reset the counter yet
		            -- and can be assumed to be dead
		            ublaze_running <= '0';
		        end if;
		    end if;
		end if;

		-- 4) Microblaze:
		--    > LED6: RED LED   - Microblaze is DOWN/Not responding
		bsp_leds_out(6) <= ublaze_running;
		--    > LED7: GREEN LED - Microblaze is ALIVE
		bsp_leds_out(7) <= (not ublaze_running);
	end process;

    -- ---------------------------------------------------------------------------------------
    
    -- Crossing from user_clk to sys_clk
    pCDCDspLedSynchroniser : process(rst, clk)
    begin
       if (rst = '1')then
           sBusLedValidD1 <= '0';
           sBusLedValid <= '0'; 
           sDspLeds <= (others => '0');         
       elsif (rising_edge(clk))then
           sBusLedValidD1 <= sBusLedValid;
           sBusLedValid <= '1';
	     if (sBusLedValidD1 = '1') then
		sDspLeds <= not dsp_leds_i; 		
             end if;  
       end if;
    end process pCDCDspLedSynchroniser;    
	
    -- Make final assignment here
    leds_out <= sDspLeds when (dsp_override_i = '1') else (bsp_leds_out);
	
end arch_led_manager;
