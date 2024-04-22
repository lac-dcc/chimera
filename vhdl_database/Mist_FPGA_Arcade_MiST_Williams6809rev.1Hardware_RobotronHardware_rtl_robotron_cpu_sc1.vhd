-----------------------------------------------------------------------
--
-- Copyright 2012 ShareBrained Technology, Inc.
--
-- This file is part of robotron-fpga.
--
-- robotron-fpga is free software: you can redistribute
-- it and/or modify it under the terms of the GNU General
-- Public License as published by the Free Software
-- Foundation, either version 3 of the License, or (at your
-- option) any later version.
--
-- robotron-fpga is distributed in the hope that it will
-- be useful, but WITHOUT ANY WARRANTY; without even the
-- implied warranty of MERCHANTABILITY or FITNESS FOR A
-- PARTICULAR PURPOSE. See the GNU General Public License
-- for more details.
--
-- You should have received a copy of the GNU General
-- Public License along with robotron-fpga. If not, see
-- <http://www.gnu.org/licenses/>.
--
-----------------------------------------------------------------------

-- This entity models a pair of Williams SC1 pixel BLTter ICs.
-- The interface is modified to be more conducive to synchronous
-- FPGA implementation.
-- Dec 2018 changes for SC1 or SC2 and 0 address error (DW oldgit)

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_unsigned.all;

entity sc1 is
port(
	clk             : in    std_logic;
	sc2             : in    std_logic;
	E_en            : in    std_logic;

	reg_cs          : in    std_logic;
	reg_data_in     : in    std_logic_vector( 7 downto 0);
	rs              : in    std_logic_vector( 2 downto 0);

	halt            : out   boolean;
	halt_ack        : in    boolean;

	blt_ack         : in    std_logic;

	blt_rd          : out   boolean;
	blt_wr          : out   boolean;

	blt_address_out : out   std_logic_vector(15 downto 0);
	blt_data_in     : in    std_logic_vector( 7 downto 0);
	blt_data_out    : out   std_logic_vector( 7 downto 0);

	en_upper        : out   boolean;
	en_lower        : out   boolean
);
end sc1;

architecture RTL of sc1 is

	type state_t is (state_idle, state_wait_for_halt, state_src, state_dst);

	-- control attributes
	signal ctrl_span_src            : std_logic := '0';
	signal ctrl_span_dst            : std_logic := '0';
	signal ctrl_slow                : std_logic := '0';
	signal ctrl_foreground          : std_logic := '0';
	signal ctrl_solid               : std_logic := '0';
	signal ctrl_shift               : std_logic := '0';
	signal ctrl_no_lower            : std_logic := '0';
	signal ctrl_no_upper            : std_logic := '0';

	-- 0: Run register
	signal reg_ctrl         : std_logic_vector( 7 downto 0) := (others => '0');
	-- 1: solid value
	signal reg_solid        : std_logic_vector( 7 downto 0) := (others => '0');
	-- 2, 3: source address
	signal reg_src_base     : std_logic_vector(15 downto 0) := (others => '0');
	-- 4, 5: destination address
	signal reg_dst_base     : std_logic_vector(15 downto 0) := (others => '0');
	-- 6: width
	signal reg_width        : std_logic_vector( 7 downto 0) := (others => '0');
	-- 7: height
	signal reg_height       : std_logic_vector( 7 downto 0) := (others => '0');

	-- Internal
	signal state            : state_t := state_idle;

	signal blt_src_data     : std_logic_vector( 7 downto 0) := (others => '0');
	signal blt_shift        : std_logic_vector( 3 downto 0) := (others => '0');

	signal src_address      : std_logic_vector(15 downto 0) := (others => '0');
	signal dst_address      : std_logic_vector(15 downto 0) := (others => '0');

	signal x_count          : std_logic_vector( 7 downto 0) := (others => '0');
	signal x_count_next     : std_logic_vector( 7 downto 0) := (others => '0');
	signal y_count          : std_logic_vector( 7 downto 0) := (others => '0');
	signal y_count_next     : std_logic_vector( 7 downto 0) := (others => '0');

	signal xorval           : std_logic_vector( 7 downto 0) := (others => '0');
	signal wait_slow        : std_logic;

begin
	-- SC1 had a bug so values had to be xored with 0X04, SC2 fixed the bug so no xor required
	xorval <= x"04" when sc2='0' else x"00";

	halt            <= not (state = state_idle);
	blt_rd          <= (state = state_src);
	blt_wr          <= (state = state_dst);

	blt_address_out <= dst_address when (state = state_dst) else src_address;

	en_upper        <= (state = state_src) or (not (ctrl_no_upper = '1' or (ctrl_foreground = '1' and blt_src_data(7 downto 4) = x"0") ));
	en_lower        <= (state = state_src) or (not (ctrl_no_lower = '1' or (ctrl_foreground = '1' and blt_src_data(3 downto 0) = x"0") ));

	blt_data_out    <= reg_solid when ctrl_solid = '1' else blt_src_data;

	x_count_next    <= x_count + 1;
	y_count_next    <= y_count + 1;

	-- break out control reg into individual signals
	ctrl_no_upper   <= reg_ctrl(7);
	ctrl_no_lower   <= reg_ctrl(6);
	ctrl_shift      <= reg_ctrl(5);
	ctrl_solid      <= reg_ctrl(4);
	ctrl_foreground <= reg_ctrl(3);
	ctrl_slow       <= reg_ctrl(2);
	ctrl_span_dst   <= reg_ctrl(1);
	ctrl_span_src   <= reg_ctrl(0);

	-- register access
	process(clk)
	begin
		if rising_edge(clk) then
			if reg_cs = '1' then
				case rs is
					-- 0: Start BLT with control attributes
					when "000" => reg_ctrl   <= reg_data_in;
					-- 1: mask
					when "001" => reg_solid  <= reg_data_in;
					-- 2: source address high
					when "010" => reg_src_base(15 downto 8) <= reg_data_in;
					-- 3: source address low
					when "011" => reg_src_base( 7 downto 0) <= reg_data_in;
					-- 4: destination address high
					when "100" => reg_dst_base(15 downto 8) <= reg_data_in;
					-- 5: destination address low
					when "101" => reg_dst_base( 7 downto 0) <= reg_data_in;
					-- 6: width
					when "110" => reg_width  <= reg_data_in xor xorval;
					-- 7: height
					when "111" => reg_height <= reg_data_in xor xorval;
					-- Do nothing.
					when others => null;
				end case;
			end if;
		end if;
	end process;

	-- state machine
	process(clk)
	begin
		if rising_edge(clk) then
			if E_en = '1' or ctrl_slow = '0' then
				wait_slow <= '0';
			end if;

			case state is
				when state_idle =>
					if reg_cs = '1' and  rs = "000" then
						state <= state_wait_for_halt;
					end if;

				when state_wait_for_halt =>
					if halt_ack then
						src_address <= reg_src_base;
						dst_address <= reg_dst_base;

						x_count   <= (others => '0');
						y_count   <= (others => '0');
						blt_shift <= (others => '0');

						state <= state_src;
					end if;

				when state_src =>
					if blt_ack = '1' and wait_slow = '0' then
						wait_slow <= '1';
						if ctrl_shift = '0' then
							-- unshifted
							blt_src_data <= blt_data_in;
						else
							-- shifted right one pixel
							blt_shift    <= blt_data_in( 3 downto 0);
							blt_src_data <= blt_shift & blt_data_in( 7 downto 4);
						end if;
						state <= state_dst;
					end if;

				when state_dst =>
					if blt_ack = '1' and wait_slow = '0' then
						wait_slow <= '1';
						state <= state_src;

						if x_count_next < reg_width then
							x_count <= x_count_next;

							if ctrl_span_src = '1' then
								src_address <= src_address + 256;
							else
								src_address <= src_address + 1;
							end if;

							if ctrl_span_dst = '1' then
								dst_address <= dst_address + 256;
							else
								dst_address <= dst_address + 1;
							end if;
						else
							x_count <= (others => '0');
							y_count <= y_count_next;

							if y_count_next >= reg_height then
								state <= state_idle;
							end if;

							if ctrl_span_src = '1' then
								src_address <= reg_src_base(15 downto 8) & (reg_src_base(7 downto 0) + y_count_next(7 downto 0));
							else
								src_address <= src_address + 1;
							end if;

							if ctrl_span_dst = '1' then
								dst_address <= reg_dst_base(15 downto 8) & (reg_dst_base(7 downto 0) + y_count_next(7 downto 0));
							else
								dst_address <= dst_address + 1;
							end if;

						end if;
					end if;
					-- Do nothing.
				when others => null;
			end case;
		end if;
	end process;
end RTL;
