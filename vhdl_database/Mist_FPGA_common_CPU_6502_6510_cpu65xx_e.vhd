-- -----------------------------------------------------------------------
--
--                                 FPGA 64
--
--     A fully functional commodore 64 implementation in a single FPGA
--
-- -----------------------------------------------------------------------
-- Copyright 2005-2008 by Peter Wendrich (pwsoft@syntiac.com)
-- http://www.syntiac.com/fpga64.html
-- -----------------------------------------------------------------------
--
-- Interface to 6502/6510 core
--
-- -----------------------------------------------------------------------

library IEEE;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;

-- -----------------------------------------------------------------------

entity cpu65xx is
	generic (
		pipelineOpcode : boolean;
		pipelineAluMux : boolean;
		pipelineAluOut : boolean
	);
	port (
		clk : in std_logic;
		enable : in std_logic;
		reset : in std_logic;
		nmi_n : in std_logic;
		irq_n : in std_logic;
		so_n : in std_logic := '1';

		di : in unsigned(7 downto 0);
		do : out unsigned(7 downto 0);
		addr : out unsigned(15 downto 0);
		we : out std_logic;
		
		debugOpcode : out unsigned(7 downto 0);
		debugPc : out unsigned(15 downto 0);
		debugA : out unsigned(7 downto 0);
		debugX : out unsigned(7 downto 0);
		debugY : out unsigned(7 downto 0);
		debugS : out unsigned(7 downto 0)
	);
end cpu65xx;

library IEEE;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;

entity cpu6502 is
	port(
		clk    : in std_logic;
		ce     : in std_logic;
		reset  : in std_logic;
		nmi    : in std_logic;
		irq    : in std_logic;
		din    : in  unsigned(7 downto 0);
		dout   : out unsigned(7 downto 0);
		addr   : out unsigned(15 downto 0);
		we     : out std_logic
	);
end cpu6502;

architecture cpu6502 of cpu6502 is
begin
	cpuInstance: entity work.cpu65xx(fast)
	generic map (
		pipelineOpcode => false,
		pipelineAluMux => false,
		pipelineAluOut => false
	)
	port map (
		clk   => clk,
		enable=> ce,
		reset => reset,
		nmi_n => not nmi,
		irq_n => not irq,
		di    => din,
		do    => dout,
		addr  => addr,
		we    => we
	);
end architecture;
