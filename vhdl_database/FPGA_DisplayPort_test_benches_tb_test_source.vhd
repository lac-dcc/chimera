----------------------------------------------------------------------------------
-- Module Name: tb_test_source - Behavioral
--
-- Description: A testbench for tb_test_source
-- 
----------------------------------------------------------------------------------
-- FPGA_DisplayPort from https://github.com/hamsternz/FPGA_DisplayPort
------------------------------------------------------------------------------------
-- The MIT License (MIT)
-- 
-- Copyright (c) 2015 Michael Alan Field <hamster@snap.net.nz>
-- 
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
-- 
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
-- 
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
------------------------------------------------------------------------------------
----- Want to say thanks? ----------------------------------------------------------
------------------------------------------------------------------------------------
--
-- This design has taken many hours - 3 months of work. I'm more than happy
-- to share it if you can make use of it. It is released under the MIT license,
-- so you are not under any onus to say thanks, but....
-- 
-- If you what to say thanks for this design either drop me an email, or how about 
-- trying PayPal to my email (hamster@snap.net.nz)?
--
--  Educational use - Enough for a beer
--  Hobbyist use    - Enough for a pizza
--  Research use    - Enough to take the family out to dinner
--  Commercial use  - A weeks pay for an engineer (I wish!)
--------------------------------------------------------------------------------------
--  Ver | Date       | Change
--------+------------+---------------------------------------------------------------
--  0.1 | 2015-09-17 | Initial Version
------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_test_source is
end entity;

architecture arch of tb_test_source is
    component test_source is
        port ( 
            clk    : in  std_logic;
            ready  : out std_logic;
            data   : out std_logic_vector(72 downto 0) := (others => '0')
        );
    end component;

    COMPONENT main_stream_processing
        generic( use_hw_8b10b_support : std_logic);
        PORT(
           symbol_clk          : IN  std_logic;
           tx_link_established : IN  std_logic;
           source_ready        : IN  std_logic;
           tx_clock_train      : IN  std_logic;
           tx_align_train      : IN  std_logic;
           in_data             : IN  std_logic_vector(72 downto 0);          
           tx_symbols          : OUT std_logic_vector(79 downto 0)
        );
    END COMPONENT;
 	
	signal clk                       : std_logic;

	signal test_signal_data          : std_logic_vector(72 downto 0);
    signal test_signal_ready         : std_logic;

    signal tx_symbols                : std_logic_vector(79 downto 0);

	signal tx_link_established       : std_logic;
	signal  tx_clock_train           : std_logic;
	signal tx_align_train            : std_logic;
    constant use_hw_8b10b_support : std_logic := '1'; 
begin
i_test_source: test_source port map ( 
            clk   => clk,
            ready => test_signal_ready,
            data  => test_signal_data
        );

Inst_main_stream_processing: main_stream_processing generic map (
      use_hw_8b10b_support => use_hw_8b10b_support
   ) PORT MAP(
		symbol_clk          => clk,
		tx_link_established => tx_link_established,
		source_ready        => test_signal_ready,
		tx_clock_train      => tx_clock_train,
		tx_align_train      => tx_align_train,
		in_data             => test_signal_data,
		tx_symbols          => tx_symbols
	);

process 
    begin
        clk <= '1';
        wait for 5 ns;
        clk <= '0';
        wait for 5 ns;
    end process;
end architecture;
