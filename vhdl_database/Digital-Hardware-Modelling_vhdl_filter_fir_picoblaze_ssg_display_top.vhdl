----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:04:07 12/09/2018 
-- Design Name: 
-- Module Name:    top - structural 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use ieee.std_logic_unsigned.all;
use work.ssg_display_shared_package.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ssg_display_top is
    port (clk     			: in  	std_logic;
    	  rst 				: in  	std_logic;
    	  in_switches_p		: in 	std_logic_vector(7 downto 0);
    	  in_buttons_p		: in 	std_logic_vector(3 downto 0);
    	  out_seg_p			: out 	SEG_T;
    	  out_dp_p			: out 	std_logic;
    	  out_digits_en_p	: out 	DIGITS_EN_T;
    	  out_leds_p		: out 	std_logic_vector(7 downto 0)
    	  );
end ssg_display_top;

architecture structural of ssg_display_top is
	--
	-------------------------------------------------------------------------------------------
	-- Components
	-------------------------------------------------------------------------------------------
	--

	--
	-- Seven Segment Display Component
	--
	component ssg_display is
    port (clk     					: in  std_logic;
    	  rst 						: in  std_logic;
		  in_bcds_p					: in  std_logic_vector(15 downto 0);-- Four BCD numbers that can be displayed by the four 7-segment digits
		  in_dps_p					: in  DP_T;							-- enable/disable input signals for the decimal point of a digit
		  out_seg_p					: out SEG_T;						-- enable output signals for seven led segments(cathode) of  currently refreshed digit
		  out_dp_p					: out std_logic;					-- enable ouput signal for the decimal point of currently refreshed digit
		  out_digits_en_p			: out DIGITS_EN_T					-- enable signals for K=4 digits. only one digit out of K=4 digits is enabled for refresh duration
    );
	end component ssg_display;

	--
	-- Declaration of the KCPSM6 component including default values for generics.
	--
	component kcpsm6 
	generic(                 hwbuild : std_logic_vector(7 downto 0) := X"00";
	                interrupt_vector : std_logic_vector(11 downto 0) := X"3FF";
	         scratch_pad_memory_size : integer := 64);
	port (                   address : out std_logic_vector(11 downto 0);
	                     instruction : in std_logic_vector(17 downto 0);
	                     bram_enable : out std_logic;
	                         in_port : in std_logic_vector(7 downto 0);
	                        out_port : out std_logic_vector(7 downto 0);
	                         port_id : out std_logic_vector(7 downto 0);
	                    write_strobe : out std_logic;
	                  k_write_strobe : out std_logic;
	                     read_strobe : out std_logic;
	                       interrupt : in std_logic;
	                   interrupt_ack : out std_logic;
	                           sleep : in std_logic;
	                           reset : in std_logic;
	                             clk : in std_logic);
	end component kcpsm6;

	--
	-- Program ROM
	--
	component ssg_program is
	generic(             C_FAMILY : string := "S6"; 
	            C_RAM_SIZE_KWORDS : integer := 1;
	         C_JTAG_LOADER_ENABLE : integer := 0);
	Port (      address : in std_logic_vector(11 downto 0);
	        instruction : out std_logic_vector(17 downto 0);
	             enable : in std_logic;
	                rdl : out std_logic;                    
	                clk : in std_logic);
	end component ssg_program;


	--
	-- Signals for connection of ssg_display and KCPSM6.
	--
	signal bcds_reg			: std_logic_vector(15 downto 0);-- Four BCD numbers that can be displayed by the four 7-segment digits
	signal dps_reg			: DP_T;							-- enable/disable input signals for the decimal point of a digit
	signal segs_sig			: SEG_T;						-- enable output signals for seven led segments(cathode) of  currently refreshed digit
	signal dp_sig			: std_logic;					-- enable ouput signal for the decimal point of currently refreshed digit
	signal digits_en_sig	: DIGITS_EN_T;					-- enable signals for K=4 digits. only one digit out of K=4 digits is enabled for refresh duration
	
	--
	-- Signals for connection of KCPSM6 and Program Memory.
	--
	signal         address : std_logic_vector(11 downto 0);
	signal     instruction : std_logic_vector(17 downto 0);
	signal     bram_enable : std_logic;
	signal         in_port : std_logic_vector(7 downto 0);
	signal        out_port : std_logic_vector(7 downto 0);
	signal         port_id : std_logic_vector(7 downto 0);
	signal    write_strobe : std_logic;
	signal  k_write_strobe : std_logic;
	signal     read_strobe : std_logic;
	signal       interrupt : std_logic;
	signal   interrupt_ack : std_logic;
	signal    kcpsm6_sleep : std_logic;
	signal    kcpsm6_reset : std_logic;

	--
	-- Some additional signals are required if your system also needs to reset KCPSM6. 
	--
	signal             rdl : std_logic;

	--
	-- When interrupt is to be used then the recommended circuit included below requires 
	-- the following signal to represent the request made from your system.
	--
	signal     int_request : std_logic;

begin

	--
	--  Components Instances
	--
	processor: kcpsm6
		generic map (                 hwbuild => X"00", 
	                         interrupt_vector => X"3FF",
	                  scratch_pad_memory_size => 64)
	    port map(      address => address,
	               instruction => instruction,
	               bram_enable => bram_enable,
	                   port_id => port_id,
	              write_strobe => write_strobe,
	            k_write_strobe => k_write_strobe,
	                  out_port => out_port,
	               read_strobe => read_strobe,
	                   in_port => in_port,
	                 interrupt => interrupt,
	             interrupt_ack => interrupt_ack,
	                     sleep => kcpsm6_sleep,
	                     reset => kcpsm6_reset,
	                       clk => clk);

	program_rom: ssg_program                    	 --Name to match your PSM file
	    generic map(             C_FAMILY => "S6",   --Family 'S6', 'V6' or '7S'
	                    C_RAM_SIZE_KWORDS => 1,      --Program size '1', '2' or '4'
	                 C_JTAG_LOADER_ENABLE => 1)      --Include JTAG Loader when set to '1' 
	    port map(      address => address,      
	               instruction => instruction,
	                    enable => bram_enable,
	                       rdl => rdl,
	                       clk => clk);

	ssd: ssg_display
	    port map (	clk 			=> clk,
	    			rst 			=> rst,
	    			in_bcds_p		=> bcds_reg,
					in_dps_p		=> dps_reg,
					out_seg_p		=> segs_sig,
					out_dp_p 		=> dp_sig,
					out_digits_en_p => digits_en_sig
	    		);

	--
	-- In many designs (especially your first) interrupt and sleep are not used.
	-- Tie these inputs Low until you need them. Tying 'interrupt' to 'interrupt_ack' 
	-- preserves both signals for future use and avoids a warning message.
	-- 

	kcpsm6_sleep 	<= '0';
	interrupt 		<= interrupt_ack;
	kcpsm6_reset	<= rst or rdl;


	in_port(7 downto 4) <= (others => '0');

	mux_in_ports: process( clk )
	begin
		if( clk'event and clk='1') then
			if( rst = '1' ) then
				in_port(3 downto 0) <= (others => '0');
			else
				case port_id(1 downto 0) is

					-- IN_SWITCH_HLFWRD_X_PORT
					when "00" => in_port(3 downto 0) <= in_switches_p(3 downto 0);
					
					-- IN_SWITCH_HLFWRD_Y_PORT
					when "01" => in_port(3 downto 0) <= in_switches_p(7 downto 4); 
					
					-- IN_BUTTON_PORT
					when "10" => in_port(3 downto 0) <= in_buttons_p;
					
					-- Others
					when others => in_port(3 downto 0) <= (others => '0');
				end case;
			end if;
		end if;
	end process mux_in_ports;

	decode_out_ports: process(clk)
	begin
		if( clk'event and clk='1') then
			if( rst = '1') then
				bcds_reg <= (others => '0');
				dps_reg <= (others => DISABLE_DP);
			else
				if( write_strobe = '1') then
					case port_id(1 downto 0) is
						
						-- OUT_NUM_X_PORT
						when "00" => bcds_reg(3 downto 0) <= out_port(3 downto 0);

						-- OUT_NUM_Y_PORT
						when "01" => bcds_reg(7 downto 4) <= out_port(3 downto 0);

						-- OUT_SUM_PORT
						when "10" => bcds_reg(15 downto 8) <= out_port;

						-- OUT_DP_PORT
						when "11" => dps_reg <= out_port(3 downto 0);
						
						when others =>  bcds_reg <= bcds_reg;
										dps_reg  <= dps_reg;
					end case;
				end if;
			end if;
		end if;
	end process decode_out_ports;

	out_seg_p <= segs_sig;
	out_dp_p <= dp_sig;	  
	out_digits_en_p <= digits_en_sig;
	out_leds_p <= in_switches_p;
end structural;