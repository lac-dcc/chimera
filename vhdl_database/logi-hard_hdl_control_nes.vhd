----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Michael Jones
-- 
-- Create Date:    09:47:04 05/23/2013 
-- Design Name: 
-- Module Name:    nes_ctl_3 - Behavioral 
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
-- for info in NES protocol:
--//http://www.mit.edu/~tarvizo/nes-controller.html
--Note:  - all nes_dat logic is active low.  Inverting nes_dat for active high logic.
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

use work.all;

entity nes_ctl is
	generic(
			--N: integer :=  4		--SIMULATION
			--N: integer :=  17		--17 bit overflow 131k
			N: integer :=  18		--18 bit overflow 131k for 100mhz clock
	 );
	port(
			clk : in std_logic;
			reset : in std_logic;
			nes_dat : in std_logic;
			nes_lat : out std_logic;
			nes_clk : out std_logic;	
			nes_data_out: out std_logic_vector(7 downto 0)
	);
end nes_ctl;

architecture arch of nes_ctl is

	signal count_reg, count_next: unsigned(N-1 downto 0);	--counter to produce tick
	signal nes_tick: std_logic := '0';	--tick to run state machine
	--state variable
	type state_type is (s0,s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13,s14,s15,s16,s17,s18);
	signal state_reg, state_next: state_type;
	signal nes_datn: std_logic;
	signal nes_data_reg, nes_data_next: std_logic_vector(7 downto 0);
	signal nes_a, nes_b, nes_sel, nes_start,nes_up, nes_down, nes_left, nes_right: std_logic;
	
begin

	--synchronous logic
	process(clk)
	begin
		if(reset= '1') then
			count_reg <= (others=>'0');
			state_reg <= s0;
			nes_data_reg <= (others=>'0');
		elsif (clk'event and clk = '1') then
			count_reg <= count_next;
			state_reg <= state_next;
			nes_data_reg(0) <= nes_a;
			nes_data_reg(1) <= nes_b;
			nes_data_reg(2) <= nes_up;
			nes_data_reg(3) <= nes_down;
			nes_data_reg(4) <= nes_left;
			nes_data_reg(5) <= nes_right;
			nes_data_reg(6) <= nes_sel;
			nes_data_reg(7) <= nes_start;
		end if;
	end process;
	nes_data_out <= nes_data_reg;
	

	count_next <= count_reg +1;		--increment counter, will overflow
	nes_tick <= '1' when count_reg = 0 else '0';		-- tick on every overflow
	nes_datn <= not(nes_dat);

	--STATE MACHINE
	process(clk)
	begin
		
		if(clk'event and clk = '1') then				
			if(nes_tick = '1') then
					nes_data_next <= nes_data_next;	
					nes_lat <= '0';	--default outputs
					nes_clk <= '0';
					
--					nes_a <= '0';
--					nes_b <= '0';
--					nes_left <= '0';
--					nes_right <= '0';
--					nes_up <= '0';
--					nes_down <= '0';
--					nes_sel <= '0';
--					nes_start <= '0';

				case state_reg is
					when s0 =>
						state_next <= s1;
						nes_lat <= '1';
					when s1 =>
						state_next <= s2;
						nes_lat <= '0';
						nes_a <= nes_datn;
					when s2 =>
						state_next <= s3;
						nes_clk <= '1';
					when s3 =>
						state_next <= s4;
						nes_clk <= '0';
						nes_b <= nes_datn;
					when s4 =>
						state_next <= s5;
						nes_clk <= '1';
					when s5 =>
						state_next <= s6;
						nes_clk <= '0';
						nes_sel <= nes_datn;						
					when s6 =>
						state_next <= s7;
						nes_clk <= '1';
					when s7 =>
						state_next <= s8;
						nes_clk <= '0';
						nes_start <= nes_datn;
					when s8 =>
						state_next <= s9;
						nes_clk <= '1';
					when s9 =>
						state_next <= s10;
						nes_clk <= '0';
						nes_up <= nes_datn;
					when s10 =>
						state_next <= s11;
						nes_clk <= '1';
					when s11=>
						state_next <= s12;
						nes_clk <= '0';
						nes_down <= nes_datn;
					when s12 =>
						state_next <= s13;
						nes_clk <= '1';
					when s13 =>
						state_next <= s14;
						nes_clk <= '0';
						nes_left <= nes_datn;
					when s14 =>
						state_next <= s15;
						nes_clk <= '1';
					when s15 =>
						state_next <= s16;
						nes_clk <= '0';
						nes_right <= nes_datn;
					when s16 =>
						state_next <= s17;
						nes_clk <= '1';
					when s17 =>
						state_next <= s18;
						nes_clk <= '0';
					when s18 =>
						state_next <= s0;
						--nes_data_next <=  nes_sel & nes_start & nes_right & nes_left & nes_down & nes_up & nes_b & nes_a;-- & nes_a ; --syncronize the update of all the nes signals for the output register.
				end case;
			end if;
		end if;
	end process;
	
end arch;


-- VERILOG VERSION
--/************************************************************************************
--* NES controller state machine module
--* DESCRIPTION: simple state machine that runs continuously.
--* 	The latch, latches the current values on the controller and then pulses (clks) 
--* 	are sent while the button values are read and stored in the relevent registers.
--*************************************************************************************/
--
--module NES(
--    input wire Clk,
--	 input  wire DataIn,			//data line from the nes controller
--    output reg Latch = 0,	// latch line from nes controller
--    output reg Pulse = 0,	// pulse line (clk) of the nes controller
--    output reg A = 0,		//button A
--    output reg B = 0,		//button B
--    output reg Select = 0,	//button select
--    output reg Start = 0,	//button start
--    output reg Up = 0,		//button up
--    output reg Down = 0,	//button down
--    output reg Left = 0,	//button left
--    output reg Right = 0	//button right
--    );
--
--	//Implement Pulse Train described Here:
--	//http://www.mit.edu/~tarvizo/nes-controller.html
--
--	//Will use a simple statement machine 
--	parameter NES_CTRL_RATE = 100000;	//50Mhz/100E3 = 500Hz tick rate for control rate counter
--
--	reg [31:0] ControlRateCounter = 0;
--	reg [4:0] CurrentState = 0;
--
--	always @(posedge Clk)
--	begin
--		if( ControlRateCounter < NES_CTRL_RATE )	//check the tick counter = (sysclk)50Mhz/(NES_CTRL_RATE)100E3 = 500Hz tick rate for control rate counter
--			ControlRateCounter <= ControlRateCounter + 1;
--		else
--			ControlRateCounter <= 0;
--	end
--
--
--	always @(posedge Clk)
--	begin
--		
--		if(ControlRateCounter == 0)	//update the state every time ControlRateCounter is reset to 0.
--		begin
--			CurrentState <= CurrentState + 1; //Use a simple counter to derive state.  We will have extra "states" at the end for dead time!
--		end
--
--	end
--
--
--
--	// Runing discrete states for each pulse( nes clk) event that would occurr.  The clks are pulsed in each state and then the 
--	//	current button values are read and made available on register outputs
--	always @(posedge Clk)
--	begin
--		case(CurrentState)
--		0:
--			begin
--				Latch <= 1; 
--				Pulse <= 0;
--			end
--		1:
--			begin
--				Latch <= 0; 
--				Pulse <= 0;
--			end
--		2:
--			begin
--				Latch <= 0; 	-- not sure that this one is needed.
--				Pulse <= 0;
--				A <= DataIn;
--			end
--		3:
--			begin
--				Latch <= 0; 
--				Pulse <= 1;
--			end	
--		4:
--			begin
--				Latch <= 0; 
--				Pulse <= 0;
--				B <= DataIn;
--			end
--		5:
--			begin
--				Latch <= 0; 
--				Pulse <= 1;
--			end	
--		6:
--			begin
--				Latch <= 0; 
--				Pulse <= 0;
--				Select <= DataIn;
--			end
--		7:
--			begin
--				Latch <= 0; 
--				Pulse <= 1;
--			end
--		8:
--			begin
--				Latch <= 0; 
--				Pulse <= 0;
--				Start <= DataIn;
--			end
--		9:
--			begin
--				Latch <= 0; 
--				Pulse <= 1;	
--			end	
--		
--		10:
--			begin
--				Latch <= 0; 
--				Pulse <= 0;
--				Up <= DataIn;
--			end
--		
--		11:
--			begin
--				Latch <= 0; 
--				Pulse <= 1;
--			end	
--		
--		12:
--			begin
--				Latch <= 0; 
--				Pulse <= 0;
--				Down <= DataIn;
--			end
--		13:
--			begin
--				Latch <= 0; 
--				Pulse <= 1;
--			end	
--		14:
--			begin
--				Latch <= 0; 
--				Pulse <= 0;
--				Left <= DataIn;
--			end
--		15:
--			begin
--				Latch <= 0; 
--				Pulse <= 1;
--			end
--		16:
--			begin
--				Latch <= 0; 
--				Pulse <= 0;
--				Right <= DataIn;
--			end
--		17:
--			begin
--				Latch <= 0; 
--				Pulse <= 1;
--			end		
--		18:
--			begin
--				Latch <= 0; 
--				Pulse <= 0;
--			end		
--		default:
--			begin
--				Latch <= 0; //hold control lines low in the extra "idle" states
--				Pulse <= 0;
--			end
--		endcase
--	end
--
--
--endmodule
