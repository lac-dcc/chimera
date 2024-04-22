--------------------------------------------------------------------------
-- ddr_input.vhd
--------------------------------------------------------------------------
--
-- $Id$
--
-- Adapted from Virtex-II Pro User Guide
-- [UG012 (v4.0) 23 March 2005, pp 250-1]

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ddr_input is
  port (
    clk   : in  std_logic;
    d     : in  std_logic;
    rst   : in  std_logic := '0';
    qrise : out std_logic;
    qfall : out std_logic
  );
end ddr_input;

-- Describe input DDR registers (structurally)
architecture structural of ddr_input is

    component IDDR
        generic (
            DDR_CLK_EDGE    : string    := "SAME_EDGE_PIPELINED";
            INIT_Q1         : std_logic := '0';
            INIT_Q2         : std_logic := '0';
            SRTYPE          : string    := "SYNC"
        );
        port (
            Q1              : out   std_logic;
            Q2              : out   std_logic;
            C               : in    std_logic;
            CE              : in    std_logic;
            D               : in    std_logic;
            R               : in    std_logic;
            S               : in    std_logic
        );
    end component;

begin

    -- IDDR: Double Data Rate Input Register with Set, Reset
    -- and Clock Enable.
    -- Virtex-4/5
    -- Xilinx HDL Libraries Guide, version 9.1i
    IDDR_inst : IDDR
        generic map (
            DDR_CLK_EDGE    => "SAME_EDGE_PIPELINED",
            INIT_Q1         => '0',
            INIT_Q2         => '0',
            SRTYPE          => "SYNC"
        )
        port map (
            Q1  => qrise,
            Q2  => qfall,
            C   => clk,
            CE  => '1',
            D   => d,
            R   => rst,
            S   => '0'
        );
    -- End of IDDR_inst instantiation

end structural;

