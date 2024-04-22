-------------------------------------------------------------------------
----                                                                 ----
---- Engineer: A. Winnebeck                                          ----
---- Company:  ELB-Elektroniklaboratorien Bonn UG                    ----
----           (haftungsbeschränkt)
----                                                                 ----
-------------------------------------------------------------------------
----                                                                 ----
---- Copyright (C) 2015 ELB                                          ----
----                                                                 ----
---- This program is free software; you can redistribute it and/or   ----
---- modify it under the terms of the GNU General Public License as  ----
---- published by the Free Software Foundation; either version 3 of  ----
---- the License, or (at your option) any later version.             ----
----                                                                 ----
---- This program is distributed in the hope that it will be useful, ----
---- but WITHOUT ANY WARRANTY; without even the implied warranty of  ----
---- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the    ----
---- GNU General Public License for more details.                    ----
----                                                                 ----
---- You should have received a copy of the GNU General Public       ----
---- License along with this program; if not, see                    ----
---- <http://www.gnu.org/licenses>.                                  ----
----                                                                 ----
-------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library UNISIM;
use UNISIM.VComponents.all;


entity i2c_interface is
    Port ( databus : inout  STD_LOGIC_VECTOR (31 downto 0):=(others=>'Z');
           addressbus : in  STD_LOGIC_VECTOR (15 downto 0);
           writesignal : in  STD_LOGIC;
           readsignal : in  STD_LOGIC;
			  SCL_General, SDA_General : inout STD_LOGIC :='Z';
           CLK : in  STD_LOGIC);
end i2c_interface;


architecture Behavioral of i2c_interface is

	-----Signals for i2c-------
	--inputs
	Signal ClockDivide : STD_LOGIC_VECTOR (15 downto 0) :=X"0031"; --register
	Signal I2C_Start, I2C_Stop, I2C_Read, I2C_Write, I2C_Send_Ack : STD_LOGIC :='0'; --- kombinatorisches signal
	Signal I2C_data_to_send : STD_LOGIC_VECTOR (7 downto 0):=X"00";   -- register
	Signal I2C_Reset : STD_LOGIC :='0';
	--outputs
	signal I2C_Command_Ack : STD_LOGIC:='0'; -- for internal usage
	signal I2C_busy,I2C_arb_lost : STD_LOGIC:='0'; -- direkt weitergeben
	signal I2C_ack_received, Reg_I2C_ack_received : STD_LOGIC:='0'; --Register geladen bei I2C_Command_Ack
	signal I2C_received_data, Reg_I2C_received_data : STD_LOGIC_VECTOR(7 downto 0):=X"00";
	-- pins
	signal scl_i, scl_o, scl_oen, sda_i, sda_o, sda_oen : STD_LOGIC;
	Signal cmd_ack_count  : unsigned (31 downto 0):=to_unsigned(0,32);
	--- signals for I2C end------------



	---- Component declaration ----
	COMPONENT i2c_master_byte_ctrl
	PORT(
		clk : IN std_logic;
		rst : IN std_logic;
		nReset : IN std_logic;
		ena : IN std_logic;
		clk_cnt : IN std_logic_vector(15 downto 0);
		start : IN std_logic;
		stop : IN std_logic;
		read : IN std_logic;
		write : IN std_logic;
		ack_in : IN std_logic;
		din : IN std_logic_vector(7 downto 0);
		scl_i : IN std_logic;
		sda_i : IN std_logic;          
		cmd_ack : OUT std_logic;
		ack_out : OUT std_logic;
		i2c_busy : OUT std_logic;
		i2c_al : OUT std_logic;
		dout : OUT std_logic_vector(7 downto 0);
		scl_o : OUT std_logic;
		scl_oen : OUT std_logic;
		sda_o : OUT std_logic;
		sda_oen : OUT std_logic
		);
	END COMPONENT;

--------------------------------------

begin


	process (CLK) is 
	begin
		if rising_edge(CLK) then

			if (writesignal = '1') then

				case addressbus is
					when X"0030" => 
						I2C_data_to_send <= databus(7 downto 0);
						I2C_Send_Ack <= databus(8);
						I2C_Write <= databus(9);
						I2C_Read <= databus(10);
						I2C_Stop <= databus(11);
						I2C_Start <= databus(12);
					when X"0040" => I2C_Reset <= '1';
					when X"003C" => ClockDivide <= databus(15 downto 0);		
					when others => NULL;
				end case;
			
			else
			
				if (readsignal = '1') then
					case addressbus is
						when X"0034" =>
							databus(10) <= I2C_busy;
							databus(9) <= I2C_arb_lost;
							databus(8) <= Reg_I2C_ack_received;
							databus(7 downto 0) <= Reg_I2C_received_data;
							databus(31 downto 11) <= (others=>'0');
						when X"0038" => 
							databus <= STD_LOGIC_VECTOR(cmd_ack_count);
						when X"003C" =>
							databus(15 downto 0) <= ClockDivide;
							databus(31 downto 16) <=(others=>'0');
						when others => databus <= (others=>'Z');
					end case;
				else
					databus <= (others=>'Z');
				end if;
				
				I2C_Start<='0';
				I2C_Stop<='0';
				I2C_Read<='0';
				I2C_Write<='0';
				I2C_Reset<='0';

			end if;

		end if;
	end process;



	
	--- connection to i2c bus on pcb -----
	scl_General <= scl_o when (scl_oen = '0') else 'Z'; 
	sda_General <= sda_o when (sda_oen = '0') else 'Z'; 
	scl_i <= scl_General; 
	sda_i <= sda_General;
	
	Process (CLK) is 
	begin
		if rising_edge(CLK) then
			if (I2C_Reset='1') then
				Reg_I2C_received_data <= X"00";
				Reg_I2C_ack_received <= '0';
			elsif (I2C_Command_Ack='1') then
				cmd_ack_count <= cmd_ack_count+1;
				Reg_I2C_received_data <= I2C_received_data;
				Reg_I2C_ack_received <= I2C_ack_received;
			end if;
		end if;
	end process;
	
	Inst_i2c_master_byte_ctrl: i2c_master_byte_ctrl
	PORT MAP(
		clk => CLK,
		rst => I2C_Reset,
		nReset => '1',-- not I2C_Reset,
		ena => '1',
		clk_cnt => ClockDivide,-- 5x SCL = clk/(clk_cnt+1)
		
		-- start, stop, read, write: synchrone signale, mssen fr befehl einen takt high sein
		start => I2C_Start,
		stop => I2C_Stop,
		read => I2C_Read,
		write => I2C_Write,
		ack_in => I2C_Send_Ack,
		din => I2C_data_to_send,
		
		--outputs:
		cmd_ack => I2C_Command_Ack,
		ack_out => I2C_ack_received,
		i2c_busy => I2C_busy ,
		i2c_al => I2C_arb_lost, -- arb lost
		dout => I2C_received_data,
		
		-- connection to pin
		scl_i   => scl_i,
		scl_o   => scl_o,
		scl_oen => scl_oen,
		sda_i   => sda_i,
		sda_o   => sda_o,
		sda_oen => sda_oen 
	);
	--------------- i2c interface end ----

end Behavioral;
