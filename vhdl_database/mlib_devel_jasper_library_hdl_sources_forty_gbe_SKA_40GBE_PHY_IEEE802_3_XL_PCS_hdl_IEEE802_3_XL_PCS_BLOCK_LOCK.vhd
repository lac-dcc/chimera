----------------------------------------------------------------------------------
-- Company:		Peralex Electronics (Pty) Ltd
-- Engineer:	Matthew Bridges
-- 
-- Create Date: 24.10.2014 09:49:22
-- Design Name: 
-- Module Name: IEEE802_3_XL_PCS_BLOCK_LOCK - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity IEEE802_3_XL_PCS_BLOCK_LOCK is
	Port(
		CLK_I          : in  std_logic;
		RST_I          : in  std_logic;

		HEADER_VALID_I : in  std_logic;
		HEADER_I       : in  std_logic_vector(1 downto 0);

		SLIP_O         : out std_logic;
		BLOCK_LOCK_O   : out std_logic
	);
end IEEE802_3_XL_PCS_BLOCK_LOCK;

architecture Behavioral of IEEE802_3_XL_PCS_BLOCK_LOCK is
	type state_type is (LOCK_INIT, RESET_CNT, TEST_SH, VALID_SH, SIXTY_FOUR_GOOD, TEST_SH2, INVALID_SH, VALID_SH2, SLIP, SLIP_DELAY);
	signal state, next_state : state_type;

	signal block_lock : std_logic := '0';
	signal sh_valid   : std_logic;

	--AM to AM Block Counter
	signal sh_cnt      : unsigned(10 downto 0) := (others => '0');
	signal sh_cnt_64   : boolean;
	signal sh_cnt_1024 : boolean;

	--AM to AM Block Counter
	signal sh_invld_cnt    : unsigned(6 downto 0) := (others => '0');
	signal sh_invld_cnt_65 : boolean;

	--AM to AM Block Counter
	signal slip_delay_cycle_cnt : unsigned(2 downto 0) := (others => '0');
	signal slip_delay_done      : boolean;
begin
	--Insert the following in the architecture after the begin keyword
	SYNC_PROC : process(CLK_I)
	begin
		if rising_edge(CLK_I) then
			if (RST_I = '1') then
				state <= LOCK_INIT;
			else
				state <= next_state;
			end if;
		end if;
	end process;

	NEXT_STATE_DECODE : process(state, block_lock, HEADER_VALID_I, sh_valid, sh_cnt_64, sh_invld_cnt_65, sh_cnt_1024, slip_delay_done) is
	begin
		case state is
			when LOCK_INIT =>
				next_state <= RESET_CNT;
			when RESET_CNT =>
				if (block_lock = '1') then
					next_state <= TEST_SH2;
				else
					next_state <= TEST_SH;
				end if;
			when TEST_SH =>
				if (HEADER_VALID_I = '1') then
					if (sh_valid = '1') then
						next_state <= VALID_SH;
					else
						next_state <= SLIP;
					end if;
				else
					next_state <= TEST_SH;
				end if;
			when VALID_SH =>
				if (sh_cnt_64) then
					next_state <= SIXTY_FOUR_GOOD;
				else
					if ((HEADER_VALID_I and (not sh_valid)) = '1') then
						next_state <= SLIP;
					else
						next_state <= VALID_SH;
					end if;
				end if;
			when SIXTY_FOUR_GOOD =>
				next_state <= RESET_CNT;
			when TEST_SH2 =>
				if (HEADER_VALID_I = '1') then
					if (sh_valid = '1') then
						next_state <= VALID_SH2;
					else
						next_state <= INVALID_SH;
					end if;
				else
					next_state <= TEST_SH2;
				end if;
			when INVALID_SH =>
				if (sh_invld_cnt_65) then
					next_state <= SLIP;
				elsif (sh_cnt_1024) then
					next_state <= RESET_CNT;
				else
					if ((HEADER_VALID_I and sh_valid) = '1') then
						next_state <= VALID_SH2;
					else
						next_state <= INVALID_SH;
					end if;
				end if;
			when VALID_SH2 =>
				if (sh_cnt_1024) then
					next_state <= RESET_CNT;
				else
					if ((HEADER_VALID_I and (not sh_valid)) = '1') then
						next_state <= INVALID_SH;
					else
						next_state <= VALID_SH2;
					end if;
				end if;
			when SLIP =>
				next_state <= SLIP_DELAY;
			when SLIP_DELAY =>
				if slip_delay_done then
					next_state <= RESET_CNT;
				else
					next_state <= SLIP_DELAY;
				end if;
		end case;
	end process NEXT_STATE_DECODE;

	sh_valid <= (HEADER_I(0) XOR HEADER_I(1));

	SH_COUNT_PROC : process(CLK_I) is
	begin
		if rising_edge(CLK_I) then
			case state is
				when RESET_CNT =>
					sh_cnt <= (others => '0');
				when VALID_SH | INVALID_SH | VALID_SH2 =>
					if (HEADER_VALID_I = '1') then
						sh_cnt <= sh_cnt + 1;
					end if;
				when others =>
					sh_cnt <= sh_cnt;
			end case;
		end if;
	end process SH_COUNT_PROC;

	sh_cnt_64   <= (sh_cnt = 63);
	sh_cnt_1024 <= (sh_cnt = 1023);

	SH_INVALID_COUNT_PROC : process(CLK_I) is
	begin
		if rising_edge(CLK_I) then
			case state is
				when RESET_CNT =>
					sh_invld_cnt <= (others => '0');
				when INVALID_SH =>
					if (HEADER_VALID_I = '1') then
						sh_invld_cnt <= sh_invld_cnt + 1;
					end if;
				when others =>
					sh_invld_cnt <= sh_invld_cnt;
			end case;
		end if;
	end process SH_INVALID_COUNT_PROC;

	sh_invld_cnt_65 <= (sh_invld_cnt = 64);

	SLIP_proc : process(RST_I, CLK_I) is
	begin
		if (RST_I = '1') then
			SLIP_O <= '0';
		else
			if rising_edge(CLK_I) then
				if state = SLIP then
					SLIP_O <= '1';
				else
					SLIP_O <= '0';
				end if;
			end if;
		end if;
	end process SLIP_proc;

	SLIP_DELAY_PROC : process(CLK_I) is
	begin
		if rising_edge(CLK_I) then
			case state is
				when RESET_CNT =>
					slip_delay_cycle_cnt <= (others => '0');
				when SLIP_DELAY =>
					slip_delay_cycle_cnt <= slip_delay_cycle_cnt + 1;
				when others =>
					slip_delay_cycle_cnt <= slip_delay_cycle_cnt;
			end case;
		end if;
	end process SLIP_DELAY_PROC;

	slip_delay_done <= slip_delay_cycle_cnt = 7;

	BLOCK_LOCK_proc : process(CLK_I) is
	begin
		if rising_edge(CLK_I) then
			case state is
				when LOCK_INIT =>
					block_lock <= '0';
				when SIXTY_FOUR_GOOD =>
					block_lock <= '1';
				when SLIP =>
					block_lock <= '0';
				when others =>
					block_lock <= block_lock;
			end case;
		end if;
	end process BLOCK_LOCK_proc;

	OUTPUT_REGISTER_proc : process(RST_I, CLK_I) is
	begin
		if (RST_I = '1') then
			BLOCK_LOCK_O <= '0';
		else
			if rising_edge(CLK_I) then
				BLOCK_LOCK_O <= block_lock;
			end if;
		end if;
	end process OUTPUT_REGISTER_proc;

end Behavioral;
