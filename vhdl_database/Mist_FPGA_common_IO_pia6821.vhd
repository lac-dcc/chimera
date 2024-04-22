--===========================================================================--
--
-- S Y N T H E Z I A B L E I/O Port C O R E
--
-- www.OpenCores.Org - May 2004
-- This core adheres to the GNU public license 
--
-- File name : pia6821.vhd
--
-- Purpose : Implements 2 x 8 bit parallel I/O ports
-- with programmable data direction registers
-- 
-- Dependencies : ieee.Std_Logic_1164
-- ieee.std_logic_unsigned
--
-- Author : John E. Kent 
--
--===========================================================================----
--
-- Revision History:
--
-- Date: Revision Author
-- 1 May 2004 0.0 John Kent
-- Initial version developed from ioport.vhd
--
--
-- Unkown date 0.0.1 found at Pacedev repository
-- remove High Z output and and oe signal
--
-- 18 October 2017 0.0.2 DarFpga
-- Set output to low level when in data is in input mode
-- (to avoid infered latch warning)
--
-- 18 October 2022 0.0.3 Slingshot
-- Run through VHDLFormatter.
-- Port A always read the input data.
-- Feedback of output can be applied externally if required, as:
-- pa_i <= (pa_o and pa_oe) or (pa_input and not pa_oe);
-- In some applications, the input is stronger than the output,
-- and the feedback is suppressed.
--
--===========================================================================----
--
-- Memory Map
--
-- IO + $00 - Port A Data & Direction register
-- IO + $01 - Port A Control register
-- IO + $02 - Port B Data & Direction Direction Register
-- IO + $03 - Port B Control Register
--

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY pia6821 IS
	PORT (
		clk : IN std_logic;
		rst : IN std_logic;
		cs : IN std_logic;
		rw : IN std_logic;
		addr : IN std_logic_vector(1 DOWNTO 0);
		data_in : IN std_logic_vector(7 DOWNTO 0);
		data_out : OUT std_logic_vector(7 DOWNTO 0);
		irqa : OUT std_logic;
		irqb : OUT std_logic;
		pa_i : IN std_logic_vector(7 DOWNTO 0);
		pa_o : OUT std_logic_vector(7 DOWNTO 0);
		pa_oe : OUT std_logic_vector(7 DOWNTO 0);
		ca1 : IN std_logic;
		ca2_i : IN std_logic;
		ca2_o : OUT std_logic;
		ca2_oe : OUT std_logic;
		pb_i : IN std_logic_vector(7 DOWNTO 0);
		pb_o : OUT std_logic_vector(7 DOWNTO 0);
		pb_oe : OUT std_logic_vector(7 DOWNTO 0);
		cb1 : IN std_logic;
		cb2_i : IN std_logic;
		cb2_o : OUT std_logic;
		cb2_oe : OUT std_logic
	);
END;

ARCHITECTURE pia_arch OF pia6821 IS

	SIGNAL porta_ddr : std_logic_vector(7 DOWNTO 0);
	SIGNAL porta_data : std_logic_vector(7 DOWNTO 0);
	SIGNAL porta_ctrl : std_logic_vector(5 DOWNTO 0);
	SIGNAL porta_read : std_logic;

	SIGNAL portb_ddr : std_logic_vector(7 DOWNTO 0);
	SIGNAL portb_data : std_logic_vector(7 DOWNTO 0);
	SIGNAL portb_ctrl : std_logic_vector(5 DOWNTO 0);
	SIGNAL portb_read : std_logic;
	SIGNAL portb_write : std_logic;

	SIGNAL ca1_del : std_logic;
	SIGNAL ca1_rise : std_logic;
	SIGNAL ca1_fall : std_logic;
	SIGNAL ca1_edge : std_logic;
	SIGNAL irqa1 : std_logic;

	SIGNAL ca2_del : std_logic;
	SIGNAL ca2_rise : std_logic;
	SIGNAL ca2_fall : std_logic;
	SIGNAL ca2_edge : std_logic;
	SIGNAL irqa2 : std_logic;
	SIGNAL ca2_out : std_logic;

	SIGNAL cb1_del : std_logic;
	SIGNAL cb1_rise : std_logic;
	SIGNAL cb1_fall : std_logic;
	SIGNAL cb1_edge : std_logic;
	SIGNAL irqb1 : std_logic;

	SIGNAL cb2_del : std_logic;
	SIGNAL cb2_rise : std_logic;
	SIGNAL cb2_fall : std_logic;
	SIGNAL cb2_edge : std_logic;
	SIGNAL irqb2 : std_logic;
	SIGNAL cb2_out : std_logic;

BEGIN
	--------------------------------
	--
	-- read I/O port
	--
	--------------------------------

	pia_read : PROCESS (addr, cs, 
			irqa1, irqa2, irqb1, irqb2, 
			porta_ddr, portb_ddr, 
			porta_data, portb_data, 
			porta_ctrl, portb_ctrl, 
			pa_i, pb_i)
		VARIABLE count : INTEGER;
	BEGIN
		CASE addr IS
			WHEN "00" => 
				FOR count IN 0 TO 7 LOOP
					IF porta_ctrl(2) = '0' THEN
						data_out(count) <= porta_ddr(count);
						porta_read <= '0';
					ELSE
						data_out(count) <= pa_i(count);
						porta_read <= cs;
					END IF;
				END LOOP;
				portb_read <= '0';

			WHEN "01" => 
				data_out <= irqa1 & irqa2 & porta_ctrl;
				porta_read <= '0';
				portb_read <= '0';

			WHEN "10" => 
				FOR count IN 0 TO 7 LOOP
					IF portb_ctrl(2) = '0' THEN
						data_out(count) <= portb_ddr(count);
						portb_read <= '0';
					ELSE
						IF portb_ddr(count) = '1' THEN
							data_out(count) <= portb_data(count);
						ELSE
							data_out(count) <= pb_i(count);
						END IF;
						portb_read <= cs;
					END IF;
				END LOOP;
				porta_read <= '0';

			WHEN "11" => 
				data_out <= irqb1 & irqb2 & portb_ctrl;
				porta_read <= '0';
				portb_read <= '0';

			WHEN OTHERS => 
				data_out <= "00000000";
				porta_read <= '0';
				portb_read <= '0';

		END CASE;
	END PROCESS;

	---------------------------------
	--
	-- Write I/O ports
	--
	---------------------------------

	pia_write : PROCESS (clk, rst, addr, cs, rw, data_in, 
			porta_ctrl, portb_ctrl, 
			porta_data, portb_data, 
			porta_ddr, portb_ddr)
	BEGIN
		IF rst = '1' THEN
			porta_ddr <= "00000000";
			porta_data <= "00000000";
			porta_ctrl <= "000000";
			portb_ddr <= "00000000";
			portb_data <= "00000000";
			portb_ctrl <= "000000";
			portb_write <= '0';
		ELSIF clk'EVENT AND clk = '1' THEN
			IF cs = '1' AND rw = '0' THEN
				CASE addr IS
					WHEN "00" => 
						IF porta_ctrl(2) = '0' THEN
							porta_ddr <= data_in;
							porta_data <= porta_data;
						ELSE
							porta_ddr <= porta_ddr;
							porta_data <= data_in;
						END IF;
						porta_ctrl <= porta_ctrl;
						portb_ddr <= portb_ddr;
						portb_data <= portb_data;
						portb_ctrl <= portb_ctrl;
						portb_write <= '0';
					WHEN "01" => 
						porta_ddr <= porta_ddr;
						porta_data <= porta_data;
						porta_ctrl <= data_in(5 DOWNTO 0);
						portb_ddr <= portb_ddr;
						portb_data <= portb_data;
						portb_ctrl <= portb_ctrl;
						portb_write <= '0';
					WHEN "10" => 
						porta_ddr <= porta_ddr;
						porta_data <= porta_data;
						porta_ctrl <= porta_ctrl;
						IF portb_ctrl(2) = '0' THEN
							portb_ddr <= data_in;
							portb_data <= portb_data;
							portb_write <= '0';
						ELSE
							portb_ddr <= portb_ddr;
							portb_data <= data_in;
							portb_write <= '1';
						END IF;
						portb_ctrl <= portb_ctrl;
					WHEN "11" => 
						porta_ddr <= porta_ddr;
						porta_data <= porta_data;
						porta_ctrl <= porta_ctrl;
						portb_ddr <= portb_ddr;
						portb_data <= portb_data;
						portb_ctrl <= data_in(5 DOWNTO 0);
						portb_write <= '0';
					WHEN OTHERS => 
						porta_ddr <= porta_ddr;
						porta_data <= porta_data;
						porta_ctrl <= porta_ctrl;
						portb_ddr <= portb_ddr;
						portb_data <= portb_data;
						portb_ctrl <= portb_ctrl;
						portb_write <= '0';
				END CASE;
			ELSE
				porta_ddr <= porta_ddr;
				porta_data <= porta_data;
				porta_ctrl <= porta_ctrl;
				portb_data <= portb_data;
				portb_ddr <= portb_ddr;
				portb_ctrl <= portb_ctrl;
				portb_write <= '0';
			END IF;
		END IF;
	END PROCESS;

	---------------------------------
	--
	-- direction control port a
	--
	---------------------------------
	porta_direction : PROCESS (porta_data, porta_ddr)
		VARIABLE count : INTEGER;
	BEGIN
		FOR count IN 0 TO 7 LOOP
			IF porta_ddr(count) = '1' THEN
				pa_o(count) <= porta_data(count);
				pa_oe(count) <= '1';
			ELSE
				pa_o(count) <= '0';
				pa_oe(count) <= '0';
			END IF;
		END LOOP;
	END PROCESS;

	---------------------------------
	--
	-- CA1 Edge detect
	--
	---------------------------------
	ca1_input : PROCESS (clk, rst, ca1, ca1_del, 
		ca1_rise, ca1_fall, ca1_edge, 
		irqa1, porta_ctrl, porta_read)
	BEGIN
		IF rst = '1' THEN
			ca1_del <= '0';
			ca1_rise <= '0';
			ca1_fall <= '0';
			ca1_edge <= '0';
			irqa1 <= '0';
		ELSIF clk'EVENT AND clk = '0' THEN
			ca1_del <= ca1;
			ca1_rise <= (NOT ca1_del) AND ca1;
			ca1_fall <= ca1_del AND (NOT ca1);
			IF ca1_edge = '1' THEN
				irqa1 <= '1';
			ELSIF porta_read = '1' THEN
				irqa1 <= '0';
			ELSE
				irqa1 <= irqa1;
			END IF;
		END IF; 

		IF porta_ctrl(1) = '0' THEN
			ca1_edge <= ca1_fall;
		ELSE
			ca1_edge <= ca1_rise;
		END IF;
	END PROCESS;

	---------------------------------
	--
	-- CA2 Edge detect
	--
	---------------------------------
	ca2_input : PROCESS (clk, rst, ca2_i, ca2_del, 
		ca2_rise, ca2_fall, ca2_edge, 
		irqa2, porta_ctrl, porta_read)
	BEGIN
		IF rst = '1' THEN
			ca2_del <= '0';
			ca2_rise <= '0';
			ca2_fall <= '0';
			ca2_edge <= '0';
			irqa2 <= '0';
		ELSIF clk'EVENT AND clk = '0' THEN
			ca2_del <= ca2_i;
			ca2_rise <= (NOT ca2_del) AND ca2_i;
			ca2_fall <= ca2_del AND (NOT ca2_i);
			IF porta_ctrl(5) = '0' AND ca2_edge = '1' THEN
				irqa2 <= '1';
			ELSIF porta_read = '1' THEN
				irqa2 <= '0';
			ELSE
				irqa2 <= irqa2;
			END IF;
		END IF; 

		IF porta_ctrl(4) = '0' THEN
			ca2_edge <= ca2_fall;
		ELSE
			ca2_edge <= ca2_rise;
		END IF;
	END PROCESS;

	---------------------------------
	--
	-- CA2 output control
	--
	---------------------------------
	ca2_output : PROCESS (clk, rst, porta_ctrl, porta_read, ca1_edge, ca2_out)
	BEGIN
		IF rst = '1' THEN
			ca2_out <= '0';
		ELSIF clk'EVENT AND clk = '0' THEN
			CASE porta_ctrl(5 DOWNTO 3) IS
				WHEN "100" => -- read PA clears, CA1 edge sets
					IF porta_read = '1' THEN
						ca2_out <= '0';
					ELSIF ca1_edge = '1' THEN
						ca2_out <= '1';
					ELSE
						ca2_out <= ca2_out;
					END IF;
				WHEN "101" => -- read PA clears, E sets
					ca2_out <= NOT porta_read;
				WHEN "110" => -- set low
					ca2_out <= '0';
				WHEN "111" => -- set high
					ca2_out <= '1';
				WHEN OTHERS => -- no change
					ca2_out <= ca2_out;
			END CASE;
		END IF;
	END PROCESS;

	---------------------------------
	--
	-- CA2 direction control
	--
	---------------------------------
	ca2_direction : PROCESS (porta_ctrl, ca2_out)
	BEGIN
		IF porta_ctrl(5) = '0' THEN
			ca2_oe <= '0';
			ca2_o <= '0';
		ELSE
			ca2_o <= ca2_out;
			ca2_oe <= '1';
		END IF;
	END PROCESS;

	---------------------------------
	--
	-- direction control port b
	--
	---------------------------------
	portb_direction : PROCESS (portb_data, portb_ddr)
		VARIABLE count : INTEGER;
	BEGIN
		FOR count IN 0 TO 7 LOOP
			IF portb_ddr(count) = '1' THEN
				pb_o(count) <= portb_data(count);
				pb_oe(count) <= '1';
			ELSE
				pb_o(count) <= '0';
				pb_oe(count) <= '0';
			END IF;
		END LOOP;
	END PROCESS;

	---------------------------------
	--
	-- CB1 Edge detect
	--
	---------------------------------
	cb1_input : PROCESS (clk, rst, cb1, cb1_del, 
		cb1_rise, cb1_fall, cb1_edge, 
		irqb1, portb_ctrl, portb_read)
	BEGIN
		IF rst = '1' THEN
			cb1_del <= '0';
			cb1_rise <= '0';
			cb1_fall <= '0';
			cb1_edge <= '0';
			irqb1 <= '0';
		ELSIF clk'EVENT AND clk = '0' THEN
			cb1_del <= cb1;
			cb1_rise <= (NOT cb1_del) AND cb1;
			cb1_fall <= cb1_del AND (NOT cb1);
			IF cb1_edge = '1' THEN
				irqb1 <= '1';
			ELSIF portb_read = '1' THEN
				irqb1 <= '0';
			ELSE
				irqb1 <= irqb1;
			END IF;
		END IF;
 
		IF portb_ctrl(1) = '0' THEN
			cb1_edge <= cb1_fall;
		ELSE
			cb1_edge <= cb1_rise;
		END IF;
	END PROCESS;

	---------------------------------
	--
	-- CB2 Edge detect
	--
	---------------------------------
	cb2_input : PROCESS (clk, rst, cb2_i, cb2_del, 
		cb2_rise, cb2_fall, cb2_edge, 
		irqb2, portb_ctrl, portb_read)
	BEGIN
		IF rst = '1' THEN
			cb2_del <= '0';
			cb2_rise <= '0';
			cb2_fall <= '0';
			cb2_edge <= '0';
			irqb2 <= '0';
		ELSIF clk'EVENT AND clk = '0' THEN
			cb2_del <= cb2_i;
			cb2_rise <= (NOT cb2_del) AND cb2_i;
			cb2_fall <= cb2_del AND (NOT cb2_i);
			IF portb_ctrl(5) = '0' AND cb2_edge = '1' THEN
				irqb2 <= '1';
			ELSIF portb_read = '1' THEN
				irqb2 <= '0';
			ELSE
				irqb2 <= irqb2;
			END IF;
		END IF;
 
		IF portb_ctrl(4) = '0' THEN
			cb2_edge <= cb2_fall;
		ELSE
			cb2_edge <= cb2_rise;
		END IF;

	END PROCESS;

	---------------------------------
	--
	-- CB2 output control
	--
	---------------------------------
	cb2_output : PROCESS (clk, rst, portb_ctrl, portb_write, cb1_edge, cb2_out)
	BEGIN
		IF rst = '1' THEN
			cb2_out <= '0';
		ELSIF clk'EVENT AND clk = '0' THEN
			CASE portb_ctrl(5 DOWNTO 3) IS
				WHEN "100" => -- write PB clears, CA1 edge sets
					IF portb_write = '1' THEN
						cb2_out <= '0';
					ELSIF cb1_edge = '1' THEN
						cb2_out <= '1';
					ELSE
						cb2_out <= cb2_out;
					END IF;
				WHEN "101" => -- write PB clears, E sets
					cb2_out <= NOT portb_write;
				WHEN "110" => -- set low
					cb2_out <= '0';
				WHEN "111" => -- set high
					cb2_out <= '1';
				WHEN OTHERS => -- no change
					cb2_out <= cb2_out;
			END CASE;
		END IF;
	END PROCESS;

	---------------------------------
	--
	-- CB2 direction control
	--
	---------------------------------
	cb2_direction : PROCESS (portb_ctrl, cb2_out)
	BEGIN
		IF portb_ctrl(5) = '0' THEN
			cb2_oe <= '0';
			cb2_o <= '0';
		ELSE
			cb2_o <= cb2_out;
			cb2_oe <= '1';
		END IF;
	END PROCESS;

	---------------------------------
	--
	-- IRQ control
	--
	---------------------------------
	pia_irq : PROCESS (irqa1, irqa2, irqb1, irqb2, porta_ctrl, portb_ctrl)
	BEGIN
		irqa <= (irqa1 AND porta_ctrl(0)) OR (irqa2 AND porta_ctrl(3));
		irqb <= (irqb1 AND portb_ctrl(0)) OR (irqb2 AND portb_ctrl(3));
	END PROCESS;

END pia_arch;
