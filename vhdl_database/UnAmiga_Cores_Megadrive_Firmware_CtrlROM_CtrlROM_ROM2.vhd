-- ZPU
--
-- Copyright 2004-2008 oharboe - �yvind Harboe - oyvind.harboe@zylin.com
-- Modified by Alastair M. Robinson for the ZPUFlex project.
--
-- The FreeBSD license
-- 
-- Redistribution and use in source and binary forms, with or without
-- modification, are permitted provided that the following conditions
-- are met:
-- 
-- 1. Redistributions of source code must retain the above copyright
--    notice, this list of conditions and the following disclaimer.
-- 2. Redistributions in binary form must reproduce the above
--    copyright notice, this list of conditions and the following
--    disclaimer in the documentation and/or other materials
--    provided with the distribution.
-- 
-- THIS SOFTWARE IS PROVIDED BY THE ZPU PROJECT ``AS IS'' AND ANY
-- EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
-- THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
-- PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
-- ZPU PROJECT OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
-- INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
-- (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
-- OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
-- HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
-- STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
-- ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
-- ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-- 
-- The views and conclusions contained in the software and documentation
-- are those of the authors and should not be interpreted as representing
-- official policies, either expressed or implied, of the ZPU Project.

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


library work;
use work.zpupkg.all;

entity CtrlROM_ROM2 is
generic
	(
		maxAddrBitBRAM : integer := maxAddrBitBRAMLimit -- Specify your actual ROM size to save LEs and unnecessary block RAM usage.
	);
port (
	clk : in std_logic;
	areset : in std_logic := '0';
	from_zpu : in ZPU_ToROM;
	to_zpu : out ZPU_FromROM
);
end CtrlROM_ROM2;

architecture arch of CtrlROM_ROM2 is

type ram_type is array(natural range 0 to ((2**(maxAddrBitBRAM+1))/4)-1) of std_logic_vector(wordSize-1 downto 0);

shared variable ram : ram_type :=
(
     0 => x"00000003",
     1 => x"00002058",
     2 => x"00000002",
     3 => x"00000003",
     4 => x"00002050",
     5 => x"00000002",
     6 => x"00000003",
     7 => x"00002048",
     8 => x"00000002",
     9 => x"00000002",
    10 => x"00001df4",
    11 => x"000007be",
    12 => x"00000002",
    13 => x"00001e00",
    14 => x"000017c7",
    15 => x"00000000",
    16 => x"00000000",
    17 => x"00000000",
    18 => x"00001e08",
    19 => x"00001e1c",
    20 => x"00001e30",
    21 => x"00001e3c",
    22 => x"00001e48",
    23 => x"00001e54",
    24 => x"00001e60",
    25 => x"00001e70",
    26 => x"00001e80",
    27 => x"00001e8c",
    28 => x"00000002",
    29 => x"000021d4",
    30 => x"0000057a",
    31 => x"00000002",
    32 => x"000021f2",
    33 => x"0000057a",
    34 => x"00000002",
    35 => x"00002210",
    36 => x"0000057a",
    37 => x"00000002",
    38 => x"0000222e",
    39 => x"0000057a",
    40 => x"00000002",
    41 => x"0000224c",
    42 => x"0000057a",
    43 => x"00000002",
    44 => x"0000226a",
    45 => x"0000057a",
    46 => x"00000002",
    47 => x"00002288",
    48 => x"0000057a",
    49 => x"00000002",
    50 => x"000022a6",
    51 => x"0000057a",
    52 => x"00000002",
    53 => x"000022c4",
    54 => x"0000057a",
    55 => x"00000002",
    56 => x"000022e2",
    57 => x"0000057a",
    58 => x"00000002",
    59 => x"00002300",
    60 => x"0000057a",
    61 => x"00000002",
    62 => x"0000231e",
    63 => x"0000057a",
    64 => x"00000002",
    65 => x"0000233c",
    66 => x"0000057a",
    67 => x"00000004",
    68 => x"00001e98",
    69 => x"00001fb8",
    70 => x"00000000",
    71 => x"00000000",
    72 => x"00000748",
    73 => x"00000000",
    74 => x"00000004",
    75 => x"00001ea0",
    76 => x"00001fb8",
    77 => x"00000004",
    78 => x"00001f40",
    79 => x"00001fb8",
    80 => x"00000004",
    81 => x"00001dbc",
    82 => x"00001fb8",
    83 => x"00000000",
    84 => x"00000000",
    85 => x"00000000",
    86 => x"00000000",
    87 => x"00000000",
    88 => x"00000000",
    89 => x"00000000",
    90 => x"00000000",
    91 => x"00000000",
    92 => x"00000000",
    93 => x"00000000",
    94 => x"00000000",
    95 => x"00000000",
    96 => x"00000000",
    97 => x"00000000",
    98 => x"00000000",
    99 => x"00000000",
   100 => x"00000000",
   101 => x"00000000",
   102 => x"00000000",
   103 => x"00000000",
   104 => x"00000000",
   105 => x"00000000",
	others => x"00000000"
);

begin

process (clk)
begin
	if (clk'event and clk = '1') then
		if (from_zpu.memAWriteEnable = '1') and (from_zpu.memBWriteEnable = '1') and (from_zpu.memAAddr=from_zpu.memBAddr) and (from_zpu.memAWrite/=from_zpu.memBWrite) then
			report "write collision" severity failure;
		end if;
	
		if (from_zpu.memAWriteEnable = '1') then
			ram(to_integer(unsigned(from_zpu.memAAddr(maxAddrBitBRAM downto 2)))) := from_zpu.memAWrite;
			to_zpu.memARead <= from_zpu.memAWrite;
		else
			to_zpu.memARead <= ram(to_integer(unsigned(from_zpu.memAAddr(maxAddrBitBRAM downto 2))));
		end if;
	end if;
end process;

process (clk)
begin
	if (clk'event and clk = '1') then
		if (from_zpu.memBWriteEnable = '1') then
			ram(to_integer(unsigned(from_zpu.memBAddr(maxAddrBitBRAM downto 2)))) := from_zpu.memBWrite;
			to_zpu.memBRead <= from_zpu.memBWrite;
		else
			to_zpu.memBRead <= ram(to_integer(unsigned(from_zpu.memBAddr(maxAddrBitBRAM downto 2))));
		end if;
	end if;
end process;


end arch;

