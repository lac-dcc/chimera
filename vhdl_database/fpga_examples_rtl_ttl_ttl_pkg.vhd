-- -----------------------------------------------------------------------
--
-- Syntiac VHDL support files.
--
-- -----------------------------------------------------------------------
-- Copyright 2005-2018 by Peter Wendrich (pwsoft@syntiac.com)
-- http://www.syntiac.com
--
-- This source file is free software: you can redistribute it and/or modify
-- it under the terms of the GNU Lesser General Public License as published
-- by the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This source file is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program. If not, see <http://www.gnu.org/licenses/>.
--
-- -----------------------------------------------------------------------
--
-- Support package to simulate various standard TTL and CMOS chips
-- from the 74xx and CD40xx series and be synthesized on a FPGA to
-- offer realtime emulation of circuits based on these chips.
-- The package offers a ttl_t type that has more states as just 0 and 1.
-- Most FPGAs are not capable of onchip tri-state busses (though could
-- possibly still be translated by the synthesis tool).
-- However real designs also use pullups and pulldowns, series
-- resistors and diode logic. This is more tricky to directly
-- translate to a std_logic based design.
--
-- So ttl_t supports next to logic ZERO and ONE also PULLDOWN, FLOAT and PULLUP
-- states. And as the handling of these states is abstracted in this package,
-- the ttl_t type can be extended with more voltage/current levels without
-- much change (often none) in the entities that implement the actual logic
-- of the chip emulation.
--
-- Operator overloading allows operators like "or", "nand" or "xor" to work
-- on ttl_t types. ttl2std and std2ttl allows interfacing with std_logic based
-- logic.
--
-- Busses can be build using the + operator. The signal with highest strength
-- will determine the result on the bus. If both ZERO and ONE are present
-- the result with be a SHORT that can be asserted or flagged.
--
-- The buffered routine converts weak signals (like a PULLUP) into a strong
-- ZERO or ONE.
--
-- is_low returns true if the ttl_t type represents a logic low.
-- is_high returns true if the ttl_t type represents a logic high.
-- -----------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package ttl_pkg is
	type ttl_t is (
		ZERO,     -- Logic 0
		PULLDOWN, -- Pulldown
		FLOAT,    -- Floating / Tristated
		PULLUP,   -- Pullup
		ONE,      -- Logic 1
		SHORT     -- Short
	);
	type ttl_list_t is array(integer range <>) of ttl_t;

	constant GND : ttl_t := ZERO;
	constant VCC : ttl_t := ONE;

	function ttl2std(r : ttl_t) return std_logic;
	function std2ttl(r : std_logic) return ttl_t;
	function buffered(r : ttl_t) return ttl_t;
	function is_low(r : ttl_t) return boolean;
	function is_high(r : ttl_t) return boolean;

	function "not"(r : ttl_t) return ttl_t;
	function "and"(l,r : ttl_t) return ttl_t;
	function "nand"(l,r : ttl_t) return ttl_t;
	function "or"(l,r : ttl_t) return ttl_t;
	function "xor"(l,r : ttl_t) return ttl_t;
	function "+"(l,r : ttl_t) return ttl_t;
end package;

package body ttl_pkg is
	function ttl2std(r : ttl_t) return std_logic is
		variable result : std_logic := '1';
	begin
		result := '1';
		if is_low(r) then
			result := '0';
		end if;

		return result;
	end function;

	function std2ttl(r : std_logic) return ttl_t is
		variable result : ttl_t := ONE;
	begin
		result := ONE;
		if r = '0' then
			result := ZERO;
		end if;

		return result;
	end function;

	function buffered(r : ttl_t) return ttl_t is
		variable result : ttl_t := ONE;
	begin
		result := ONE;
		if (is_low(r)) then
			result := ZERO;
		end if;

		return result;
	end function;

	function is_low(r : ttl_t) return boolean is
	begin
		return (r = ZERO) or (r = PULLDOWN);
	end function;

	function is_high(r : ttl_t) return boolean is
	begin
		return (r = PULLUP) or (r = ONE);
	end function;

	function "not"(r : ttl_t) return ttl_t is
		variable result : ttl_t := ONE;
	begin
		case r is
		when ZERO | PULLDOWN | FLOAT => result := ONE;
		when PULLUP | ONE => result := ZERO;
		when SHORT => result := FLOAT;
		end case;

		return result;
	end function;

	function "and"(l,r : ttl_t) return ttl_t is
		variable result : ttl_t := ONE;
	begin
		result := ONE;
		if (l = ZERO) or (l = PULLDOWN) or (r = ZERO) or (r = PULLDOWN) then
			result := ZERO;
		end if;

		return result;
	end function;

	function "nand"(l,r : ttl_t) return ttl_t is
		variable result : ttl_t := ZERO;
	begin
		result := ZERO;
		if (l = ZERO) or (l = PULLDOWN) or (r = ZERO) or (r = PULLDOWN) then
			result := ONE;
		end if;

		return result;
	end function;

	function "or"(l,r : ttl_t) return ttl_t is
		variable result : ttl_t := ZERO;
	begin
		result := ZERO;
		if is_high(l) or is_high(r) then
			result := ONE;
		end if;

		return result;
	end function;

	function "nor"(l,r : ttl_t) return ttl_t is
		variable result : ttl_t := ONE;
	begin
		result := ONE;
		if is_high(l) or is_high(r) then
			result := ZERO;
		end if;

		return result;
	end function;

	function "xor"(l,r : ttl_t) return ttl_t is
		variable result : ttl_t := ZERO;
	begin
		if (is_high(l) and is_low(r)) or (is_low(l) and is_high(r)) then
			result := ONE;
		end if;

		return result;
	end function;

	function "+"(l,r : ttl_t) return ttl_t is
		variable result : ttl_t := FLOAT;
	begin
		case l is
		when ZERO =>
			case r is
			when ZERO | PULLDOWN | FLOAT | PULLUP => result := ZERO;
			when ONE => result := SHORT;
			when SHORT => result := SHORT;
			end case;
		when PULLDOWN =>
			case r is
			when ZERO => result := ZERO;
			when PULLDOWN | FLOAT => result := PULLDOWN;
			when PULLUP => result := FLOAT;
			when ONE => result := ONE;
			when SHORT => result := SHORT;
			end case;
		when FLOAT =>
			result := r;
		when PULLUP =>
			case r is
			when ZERO => result := ZERO;
			when PULLDOWN => result := FLOAT;
			when FLOAT | PULLUP => result := PULLUP;
			when ONE => result := ONE;
			when SHORT => result := SHORT;
			end case;
		when ONE =>
			case r is
			when ZERO => result := SHORT;
			when PULLDOWN | FLOAT | PULLUP | ONE => result := ONE;
			when SHORT => result := SHORT;
			end case;
		when SHORT =>
			result := SHORT;
		end case;
		return result;
	end function;
end package body;