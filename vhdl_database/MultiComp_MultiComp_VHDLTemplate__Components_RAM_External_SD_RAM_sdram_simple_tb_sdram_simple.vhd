-- Released under the 3-Clause BSD License:
--
-- Copyright 2010-2019 Matthew Hagerty (matthew <at> dnotq <dot> io)
--
-- Redistribution and use in source and binary forms, with or without
-- modification, are permitted provided that the following conditions are met:
--
-- 1. Redistributions of source code must retain the above copyright notice,
-- this list of conditions and the following disclaimer.
--
-- 2. Redistributions in binary form must reproduce the above copyright
-- notice, this list of conditions and the following disclaimer in the
-- documentation and/or other materials provided with the distribution.
--
-- 3. Neither the name of the copyright holder nor the names of its
-- contributors may be used to endorse or promote products derived from this
-- software without specific prior written permission.
--
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
-- AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
-- IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
-- ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
-- LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
-- CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
-- SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
-- INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
-- CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
-- ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
-- POSSIBILITY OF SUCH DAMAGE.

-- Matthew Hagerty
-- March 18, 2014
--
-- Testbench for Simple SDRAM Controller for Winbond W9812G6JH-75
 
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_sdram_simple IS
END tb_sdram_simple;
 
ARCHITECTURE behavior OF tb_sdram_simple IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sdram_simple
    PORT(
         clk_100m0_i : IN  std_logic;
         reset_i : IN  std_logic;
         refresh_i : IN  std_logic;
         rw_i : IN  std_logic;
         we_i : IN  std_logic;
         addr_i : IN  std_logic_vector(23 downto 0);
         data_i : IN  std_logic_vector(15 downto 0);
         ub_i : IN  std_logic;
         lb_i : IN  std_logic;
         ready_o : OUT  std_logic;
         done_o : OUT  std_logic;
         data_o : OUT  std_logic_vector(15 downto 0);
         sdCke_o : OUT  std_logic;
         sdCe_bo : OUT  std_logic;
         sdRas_bo : OUT  std_logic;
         sdCas_bo : OUT  std_logic;
         sdWe_bo : OUT  std_logic;
         sdBs_o : OUT  std_logic_vector(1 downto 0);
         sdAddr_o : OUT  std_logic_vector(12 downto 0);
         sdData_io : INOUT  std_logic_vector(15 downto 0);
         sdDqmh_o : OUT  std_logic;
         sdDqml_o : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk_100m0_i : std_logic := '0';
   signal reset_i : std_logic := '0';
   signal refresh_i : std_logic := '0';
   signal rw_i : std_logic := '0';
   signal we_i : std_logic := '0';
   signal addr_i : std_logic_vector(23 downto 0) := (others => '0');
   signal data_i : std_logic_vector(15 downto 0) := (others => '0');
   signal ub_i : std_logic := '0';
   signal lb_i : std_logic := '0';

	--BiDirs
   signal sdData_io : std_logic_vector(15 downto 0);

 	--Outputs
   signal ready_o : std_logic;
   signal done_o : std_logic;
   signal data_o : std_logic_vector(15 downto 0);
   signal sdCke_o : std_logic;
   signal sdCe_bo : std_logic;
   signal sdRas_bo : std_logic;
   signal sdCas_bo : std_logic;
   signal sdWe_bo : std_logic;
   signal sdBs_o : std_logic_vector(1 downto 0);
   signal sdAddr_o : std_logic_vector(12 downto 0);
   signal sdDqmh_o : std_logic;
   signal sdDqml_o : std_logic;

   -- Clock period definitions
   constant clk_100m0_i_period : time := 10 ns;

	type state_type is (ST_WAIT, ST_IDLE, ST_READ, ST_WRITE, ST_REFRESH);
	signal state_r, state_x : state_type := ST_WAIT;
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sdram_simple PORT MAP (
          clk_100m0_i => clk_100m0_i,
          reset_i => reset_i,
          refresh_i => refresh_i,
          rw_i => rw_i,
          we_i => we_i,
          addr_i => addr_i,
          data_i => data_i,
          ub_i => ub_i,
          lb_i => lb_i,
          ready_o => ready_o,
          done_o => done_o,
          data_o => data_o,
          sdCke_o => sdCke_o,
          sdCe_bo => sdCe_bo,
          sdRas_bo => sdRas_bo,
          sdCas_bo => sdCas_bo,
          sdWe_bo => sdWe_bo,
          sdBs_o => sdBs_o,
          sdAddr_o => sdAddr_o,
          sdData_io => sdData_io,
          sdDqmh_o => sdDqmh_o,
          sdDqml_o => sdDqml_o
        );

   -- Clock process definitions
   clk_100m0_i_process :process
   begin
		clk_100m0_i <= '0';
		wait for clk_100m0_i_period/2;
		clk_100m0_i <= '1';
		wait for clk_100m0_i_period/2;
   end process;
 
	process (clk_100m0_i)
	begin
		if rising_edge(clk_100m0_i) then
			state_r <= state_x;
		end if;
	end process;

	process ( state_r, ready_o, done_o )
	begin

		state_x <= state_r;
		rw_i <= '0';
		we_i <= '1';
		ub_i <= '0';
		lb_i <= '0';

		
		case ( state_r ) is
		
		when ST_WAIT =>
			if  ready_o = '1' then
				state_x <= ST_READ;
			end if;

		when ST_IDLE =>
			state_x <= ST_IDLE;

		when ST_READ =>
			if done_o = '0' then
				rw_i <= '1';
				addr_i <= "000000000000011000000001";
			else
				state_x <= ST_WRITE;
			end if;

		when ST_WRITE =>
			if done_o = '0' then
				rw_i <= '1';
				we_i <= '0';
				addr_i <= "000000000000011000000001";
				data_i <= X"ADCD";
				ub_i <= '1';
				lb_i <= '0';
			else
				state_x <= ST_REFRESH;
			end if;

		when ST_REFRESH =>
			if done_o = '0' then
				refresh_i <= '1';
			else
				state_x <= ST_IDLE;
			end if;
		end case;

   end process;
 
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		reset_i <= '1';
      wait for 20 ns;	
		reset_i <= '0';
		wait;
	end process;


END;
