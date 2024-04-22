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
use work.fir_filter_shared_package.all;
use work.ssg_display_shared_package.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    port (clk     			: in  	std_logic;
    	  rst 				: in  	std_logic;
    	  out_seg_p			: out 	SEG_T;
    	  out_dp_p			: out 	std_logic;
    	  out_digits_en_p	: out 	DIGITS_EN_T
    	  );
end top;

architecture structural of top is
	--
	-------------------------------------------------------------------------------------------
	-- Components
	-------------------------------------------------------------------------------------------
	--

	component fir_generic_transposed_filter is
    port (
        -- Clock and asynchronous reset
        clk                         : in  std_logic;
        rst                         : in  std_logic;
        
        -- Handshaking interface as sink
        valid_x_in                  : in  std_logic;                        -- Valid input sample when acting as sink
        ready_x_out                 : out std_logic;                        -- Ready for input samples when acting as sink
        valid_h_in                  : in  std_logic;                        -- Valid coefficient input when acting as sink
        ready_h_out                 : out std_logic;                        -- Ready for coefficients when acting as sink

        -- Handshaking interface as source
        valid_y_out                 : out std_logic;                        -- Valid output when acting as source
        ready_y_in                  : in  std_logic;                        -- Ready input when acting as source

        --  Input samples & coefficients and Output samples
        x_data_in                   : in  signed(X_BIT_SIZE-1 downto 0);    -- Input samples
        h_data_in                   : in  signed(H_BIT_SIZE-1 downto 0);    -- Coefficients of filter
        y_data_out                  : out signed(Y_BIT_SIZE-1 downto 0)     -- Output samples
    );
	end component fir_generic_transposed_filter;

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
	component fir_filter_picoblaze_program is
	generic(             C_FAMILY : string := "S6"; 
	            C_RAM_SIZE_KWORDS : integer := 1;
	         C_JTAG_LOADER_ENABLE : integer := 0);
	Port (      address : in std_logic_vector(11 downto 0);
	        instruction : out std_logic_vector(17 downto 0);
	             enable : in std_logic;
	                rdl : out std_logic;                    
	                clk : in std_logic);
	end component fir_filter_picoblaze_program;

	--
	-- Signals for connecting FIR filter and KCPSM6
	--

	-- signals when pico(source) and fpga(sink)
	signal en_h_valid	: std_logic 								:= '0'; -- in port 00
	signal en_h_data	: std_logic 								:= '0'; -- in port 01
	signal en_x_valid	: std_logic 								:= '0'; -- in port 02
	signal en_x_data	: std_logic 								:= '0';	-- in port 03
	signal en_y_ready	: std_logic 								:= '0';	-- in port 04
	signal h_data_reg	: signed(H_BIT_SIZE-1 downto 0) 			:= (others => '0');
	signal x_data_reg	: signed(X_BIT_SIZE-1 downto 0) 			:= (others => '0');
	signal valid_h_reg	: std_logic 								:= '0';
	signal valid_x_reg	: std_logic 								:= '0';
	signal ready_y_reg	: std_logic 								:= '0';

	-- signals when pico(sink) and fpga(source)
	signal h_ready	: std_logic 									:= '0';
	signal x_ready	: std_logic 									:= '0';
	signal y_valid	: std_logic 									:= '0';	
	signal y_data	: signed(Y_BIT_SIZE-1 downto 0) 				:= (others => '0');

	signal hybrid_write_strobe: std_logic   := '0'; -- write strobe for hybrid ports

	--
	-- Signals for connection of ssg_display and KCPSM6.
	--
	signal bcds_sig			: std_logic_vector(15 downto 0);-- Four BCD numbers that can be displayed by the four 7-segment digits
	signal segs_sig			: SEG_T;						-- enable output signals for seven led segments(cathode) of  currently refreshed digit
	signal dp_sig			: std_logic;					-- enable ouput signal for the decimal point of currently refreshed digit
	signal digits_en_sig	: DIGITS_EN_T;					-- enable signals for K=4 digits. only one digit out of K=4 digits is enabled for refresh duration
	signal dps_sig			: DP_T;
	
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

	fir: fir_generic_transposed_filter
    port map(	clk => clk,
    			rst => rst,
    			ready_x_out => x_ready,
    			valid_h_in	=> valid_h_reg,
    			valid_x_in 	=> valid_x_reg,
    			ready_h_out	=> h_ready,
    			valid_y_out => y_valid,
    			ready_y_in 	=> ready_y_reg,
    			x_data_in	=> x_data_reg,
    			h_data_in	=> h_data_reg,
    			y_data_out	=> y_data	);

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

	program_rom: fir_filter_picoblaze_program      	 --Name to match your PSM file
	    generic map(             C_FAMILY => "S6",   --Family 'S6', 'V6' or '7S'
	                    C_RAM_SIZE_KWORDS => 1,      --Program size '1', '2' or '4'
	                 C_JTAG_LOADER_ENABLE => 1)      --Include JTAG Loader when set to '1' 
	    port map(      address => address,      
	               instruction => instruction,
	                    enable => bram_enable,
	                       rdl => rdl,
	                       clk => clk);

	dps_sig <= std_logic_vector(y_data(Y_BIT_SIZE-1 downto 16));

	ssd: ssg_display
	    port map (	clk 			=> clk,
	    			rst 			=> rst,
	    			in_bcds_p		=> bcds_sig,
					in_dps_p		=> dps_sig,
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

	-- enable signals for hybrid output ports
	hybrid_write_strobe <= write_strobe or k_write_strobe;
	en_h_valid <= port_id(0) and hybrid_write_strobe;
	en_x_valid <= port_id(2) and hybrid_write_strobe;
	en_y_ready <= port_id(4) and hybrid_write_strobe;

	-- enable signals for normal output ports
	en_x_data <= port_id(3) and write_strobe;
	en_h_data <= port_id(1) and write_strobe;

	mux_in_ports: process( clk )
	begin
		if( clk'event and clk='1') then
			if( rst = '1' ) then
				in_port(3 downto 0) <= (others => '0');
			else
				case port_id(2 downto 0) is
					when "000"	=> in_port(0) <= h_ready;
								   in_port(7 downto 1) <= (others => '0');

					when "001"	=> in_port(0) <= x_ready;
								   in_port(7 downto 1) <= (others => '0');

					when "010"	=> in_port(1) <= y_valid;
								   in_port(7 downto 2) <= (others => '0');
								   in_port(0) <= '0';

					-- Port 05 IN_Y_PORT_0
					when "011"	=> in_port <= std_logic_vector(y_data(7 downto 0));

					-- Port 04 IN_Y_PORT_1
					when "100"	=> in_port <= std_logic_vector(y_data(15 downto 8));

					-- Port 05 IN_Y_PORT_2
					when "101"	=> in_port(3 downto 0) <= std_logic_vector(y_data(Y_BIT_SIZE-1 downto 16));
								   in_port(7 downto 4) <= (others => '0');

					when others => in_port <= (others => '-');
				end case;
			end if;
		end if;
	end process mux_in_ports;

	decode_out_ports: process(clk)
	begin
		if( clk'event and clk='1') then
			if( rst = '1') then
				h_data_reg <= (others => '0');
				valid_h_reg <= '0';
				valid_x_reg <= '0';
				ready_y_reg <= '0';
				x_data_reg <= (others => '0');
			else
				case port_id(2 downto 0) is
					when "000"	=> 	if( en_h_valid ='1' ) then
										valid_h_reg <= out_port(1);
									end if;

					when "001"	=> 	if( en_h_data = '1' ) then
										h_data_reg <= signed(out_port);
									end if;

					when "010"	=> 	if( en_x_valid = '1' ) then
										valid_x_reg <= out_port(1);
									end if;

					when "011"	=> 	if( en_x_data = '1' ) then
										x_data_reg <= signed(out_port);
									end if;

					when "100"	=> 	if( en_y_ready = '1' ) then
										ready_y_reg <= out_port(0);
									end if;

					when others => 	valid_h_reg <= valid_h_reg;
									h_data_reg 	<= h_data_reg;
									valid_x_reg <= valid_x_reg;
									x_data_reg 	<= x_data_reg;
									ready_y_reg <= ready_y_reg;
				end case;
			end if;
		end if;
	end process decode_out_ports;

	bcds_sig <= std_logic_vector(y_data(15 downto 0));
	out_seg_p <= segs_sig;
	out_dp_p <= dp_sig;	  
	out_digits_en_p <= digits_en_sig;
end structural;