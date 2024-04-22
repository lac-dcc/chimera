-------------------------------------------------------------------------------
-- I2C Controller
--
-- 2019-07-04 DGG - Created from another project

-------------------------------------------------------------------------------

-- The I2C core provides register addresses that the CPU can read or written to:

-- Address 0 -> DATA (write/read) or SLAVE ADDRESS (write)  
-- Address 1 -> Command/Status Register (write/read)

-- Data Buffer (write/read):
--	bit 7-0	= Stores I2C read/write data
-- or
-- 	bit 7-1	= Holds the first seven address bits of the I2C slave device
-- 	bit 0	= I2C 1:read/0:write bit

-- Command Register (write):
--	bit 7-2	= Reserved
--	bit 1-0	= 
--		00: IDLE
--		01: START
--		10: nSTART
--		11: STOP
-- Status Register (read):
--	bit 7-2	= Reserved
--	bit 1 	= ERROR 	(I2C transaction error)
--	bit 0 	= BUSY 	(I2C bus busy)
--
-- Example (R32V2020)
--	; Write 0x22 to IOCON register (not sequential operations)
--	; START
--	lix		r8,0x01
--	bsr		write_I2C_Ctrl_Reg
--	; I2C Slave address
--	lix		r8,0x40
--	bsr		write_I2C_Data_Address_Reg
--	 IDLE
--	lix		r8,0x00
--	bsr		write_I2C_Ctrl_Reg
--	; IO control register
--	lix		r8,0x05
--	bsr		write_I2C_Data_Address_Reg
--	; STOP
--	lix		r8,0x03
--	bsr		write_I2C_Ctrl_Reg	
--	; Disable sequential operation
--	lix		r8,0x22
--	bsr		write_I2C_Data_Address_Reg


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity i2c is
port (
	-- CPU Interface Signals
	i_RESET			: in std_logic := '0';
	i_CLK				: in std_logic;
	i_ENA				: in std_logic := '0';
	i_ADRSEL			: in std_logic := '0';
	i_WR				: in std_logic := '0';
	i_DATA_IN		: in std_logic_vector(7 downto 0);
	o_DATA_OUT		: out std_logic_vector(7 downto 0);
	io_I2C_SCL		: inout std_logic;
	io_I2C_SDA		: inout std_logic);
end i2c;

architecture rtc_arch of i2c is

	type state_t is (s_idle, s_start, s_data, s_ack, s_stop, s_done);
	signal state 			: state_t;

	signal w_data_buf		: std_logic_vector(7 downto 0);
	signal w_go				: std_logic := '0';
	signal w_mode			: std_logic_vector(1 downto 0);
	signal w_shift_reg	: std_logic_vector(7 downto 0);
	signal w_ack			: std_logic := '0';
	signal w_nbit 			: std_logic_vector(2 downto 0);
	signal w_phase 		: std_logic_vector(1 downto 0);
	signal w_scl 			: std_logic := '1';
	signal w_sda 			: std_logic := '1';
	signal w_rw_bit 		: std_logic;
	signal w_rw_flag		: std_logic;

-- attribute syn_keep: boolean;
-- attribute syn_keep of state: signal is true;

begin

-- Load CPU bus into internal registers
cpu_write : process (i_CLK, i_WR, i_ADRSEL)
begin
	if rising_edge(i_CLK) then
		if i_WR = '1' then
			if i_ADRSEL = '0' then
				w_data_buf <= i_DATA_IN;
			else
				w_mode <= i_DATA_IN(1 downto 0);
			end if;
		end if;
	end if;
end process;

-- Kicks off the write transfer
process (i_RESET, i_CLK, i_WR, i_ADRSEL, state)
begin
	if i_RESET = '1' or state = s_data then
		w_go <= '0';
	elsif rising_edge(i_CLK) then
		if i_WR = '1' and i_ADRSEL = '0' then
			w_go <= '1';
		end if;
	end if;
end process;

-- Provide data for the CPU to read
cpu_read : process (i_ADRSEL, state, w_shift_reg, w_ack, w_go)
begin
	o_DATA_OUT(7 downto 2) <= "111111";
	if i_ADRSEL = '0' then
		o_DATA_OUT <= w_shift_reg;
	else
		if (state = s_idle and w_go = '0') then
			o_DATA_OUT(0) <= '0';
		else
			o_DATA_OUT(0) <= '1';
		end if;
		o_DATA_OUT(1) <= w_ack;
	end if;
end process;

--       0123  0123  01230123012301230123012301230123  0123  0123  0123
-- w_scl ----  ----  __--__--__--__--__--__--__--__--  __--  ----  ----
-- w_sda ----  --__  _< 7 X 6 X 5 X 4 X 3 X 2 X 1 X 0   >x   x     ----
--     i_RESET Start  Data/Slave address/Word address  w_ack Stop  Done

-- I2C transfer state machine
i2c_proc : process (i_RESET, i_CLK, i_ENA, w_go, w_mode, state, w_phase, w_rw_bit)
	begin
		if i_RESET = '1' then
			w_scl <= '1';
			w_sda <= '1';
			state <= s_idle;
			w_ack <= '0'; -- No error
			w_phase <= "00";
	
		elsif rising_edge(i_CLK) then
			if i_ENA = '1' then
				w_phase <= w_phase + "01"; -- Next w_phase by default
	
				-- STATE: IDLE
				if state = s_idle then
					w_phase <= "00";
					if w_go = '1' then
						w_shift_reg <= w_data_buf;
						w_nbit <= "000";
						if w_mode = "01" then
							w_rw_flag	<= w_data_buf(0);	-- 1= Read; 0= Write
							w_rw_bit <= '0';
							state <= s_start;
						else
							w_rw_bit <= w_rw_flag;
							state <= s_data;
						end if;
					end if;
					
				-- STATE: START
				elsif state = s_start then -- Generate START condition
					case w_phase is
						when "00" =>
							w_scl <= '1';
							w_sda <= '1';
						when "10" =>
							w_sda <= '0';
						when "11" =>
							state <= s_data; -- Advance to next state
						when others => null;
					end case;
					
				-- STATE: DATA
				elsif state = s_data then -- Generate data
					case w_phase is
						when "00" =>
							w_scl <= '0'; -- Drop w_scl
						when "01" =>
							if w_rw_bit = '0' then -- Write Data
								w_sda <= w_shift_reg(7); -- Output data and shift (MSb first)
							else
								w_sda <= '1';
							end if;
						when "10" =>
							w_scl <= '1'; -- Raise w_scl
							w_shift_reg <= w_shift_reg(6 downto 0) & io_I2C_SDA; -- Input data and shift (MSb first)
						when "11" =>
							if w_nbit = "111" then -- Next bit or advance to next state when done
								state <= s_ack;
							else
								w_nbit <= w_nbit + "001";
							end if;
						when others => null;
					end case;
								
				-- STATE: w_ack
				elsif state = s_ack then -- Generate w_ack clock and check for error condition
					case w_phase is
					when "00" =>
						w_scl <= '0'; -- Drop w_scl
					when "01" =>
						if (w_rw_bit = '0' or w_mode = "11") then
							w_sda <= '1';
						else
							w_sda <= '0';
						end if;
					when "10" =>
						w_scl <= '1';	-- Raise w_scl
						w_ack <= io_I2C_SDA; -- Sample w_ack bit
					when "11" =>
						if w_mode(1) = '0' then
							state <= s_idle;
						else
							state <= s_stop;
						end if;
					when others => null;
					end case;
	
				-- STATE: STOP
				elsif state = s_stop then -- Generate STOP condition
					case w_phase is
					when "00" =>
						w_scl <= '0';
					when "01" =>
						if w_mode = "11" then
							w_sda <= '0';
						else
							w_sda <= '1';
						end if;
					when "10" =>
						w_scl <= '1';
					when "11" =>
						state <= s_done;
					when others => null;
					end case; 
				
				-- STATE: DONE	
				else	
					w_scl <= '1';
					w_sda <= '1';
					if w_phase = "11" then
						state <= s_idle;
					end if;
				end if;
			end if;
		end if;
	end process;

	-- Create open-drain outputs for I2C bus
	io_I2C_SCL <= '0' when w_scl = '0' else 'Z';
	io_I2C_SDA <= '0' when w_sda = '0' else 'Z';

end rtc_arch;
