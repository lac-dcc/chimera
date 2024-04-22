-------------------------------------------------------------------------------
-- Title      : Address Swapping Module
-- Project    : Virtex-6 Embedded Tri-Mode Ethernet MAC Wrapper
-- File       : address_swap_module_8.vhd
-- Version    : 1.6
-------------------------------------------------------------------------------
--
-- (c) Copyright 2009-2012 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
------------------------------------------------------------------------
-- Description: - Takes in frame from the client-side EMAC reciever.
--              - Swaps the source address with destination address.
--              - Outputs the modified frame.
--              - rx_data_valid, rx_good_frame, rx_bad_frame are delayed
--                by an equal number of clock cycles to rx_data.
--              - The module consists of a six-stage shift register and
--                multiplexer to select data either from the shift
--                register output or directly from the data input.  The
--                destination address is loaded into the shift register
--                and held whilst the source address is selected
--                directly from the input.  Once the source address has
--                been output, data is taken from the shift register.
------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;

entity address_swap_module_8 is
   port (
      rx_usr_clock	  : in  std_logic;
      rx_gtx_clock	  : in  std_logic;
      rx_ll_reset         : in  std_logic; -- Synchronous reset signal
      rx_ll_data_in       : in  std_logic_vector(7 downto 0); -- Input data
      rx_ll_sof_in_n      : in  std_logic; -- Input start of frame
      rx_ll_eof_in_n      : in  std_logic; -- Input end of frame
      rx_ll_src_rdy_in_n  : in  std_logic; -- Input source ready //rx connection
      rx_ll_dst_rdy_out_n : out std_logic;
      rx_ll_data_out      : out std_logic_vector(7 downto 0); -- Modified output data
      rx_ll_sof_out_n     : out std_logic; -- Output start of frame
      rx_ll_eof_out_n     : out std_logic; -- Output end of frame
      rx_ll_src_rdy_out_n : out std_logic; -- Output source ready  //TX connection
      rx_ll_dst_rdy_in_n  : in  std_logic  -- Input destination ready //TX connection
      );

end address_swap_module_8;

architecture arch1 of address_swap_module_8 is

   --Signal declarations
   signal sel_delay_path   : std_logic;   -- controls mux in Process data_out_mux
   signal enable_data_sr   : std_logic;   -- clock enable for data shift register
   signal data_sr5         : std_logic_vector(7 downto 0);  -- data after 6 cycle delay
   signal mux_out          : std_logic_vector(7 downto 0);  -- data to output register
   signal rx_enable        : std_logic;
   signal rx_ll_clock	   : std_logic;
   --FSM type and signals
   type state_type is (wait_sf,
                       bypass_sa1,
                       bypass_sa2,
                       bypass_sa3,
                       bypass_sa4,
                       bypass_sa5,
                       bypass_sa6,
                       pass_rof);

   signal control_fsm_state : state_type;  -- holds state of control fsm

   --6 stage shift register type and signals
   type   sr6by8 is array (0 to 5) of std_logic_vector(7 downto 0);
   signal data_sr_content : sr6by8;  -- holds contents of data sr

   --7 stage shift register type and signals
   type   sr7by1 is array (0 to 6) of std_logic;
   signal eof_sr_content   : sr7by1;  -- holds contents of end of frame sr
   signal sof_sr_content   : sr7by1;  -- holds contents of start of frame sr
   signal rdy_sr_content   : sr7by1;

    -- Small delay for simulation purposes.
   constant dly : time := 1 ps;


begin -- arch1

   ----------------------------------------------------------------------------
   --Process data_sr_p
   --A six stage shift register to hold six bytes of incoming data.
   --Clock enable signal enable_data_sr allows destination address to be stored
   --in shift register while the source address is being transmitted.
   ----------------------------------------------------------------------------
-- ll_clk_i will be used for clocking local link interface. 
-- frequency can be changed by changing the parameter 'eth_usr_clk_div' in v6_emac_v1_6_example_design.vhd.
-- eth_usr_clk_div must be integer
-- frequency = (1000/eth_usr_clk_div) MHz 
-- rx_ll_clock should be same as ll_clk_i. 
   rx_ll_clock <= rx_usr_clock;
   rx_ll_dst_rdy_out_n <= rx_ll_dst_rdy_in_n;    
   data_sr_p : process(rx_ll_clock)
   begin
      if rising_edge(rx_ll_clock) then
         if enable_data_sr = '1' and rx_enable = '1' then
             data_sr_content <= rx_ll_data_in & data_sr_content (0 to 4);
         end if;
      end if;
   end process;  -- data_sr_p
   data_sr5 <= data_sr_content(5);

   ----------------------------------------------------------------------------
   --Process data_out_mux_p
   --Selects data_out from the data shift register or from data_in, allowing
   --destination address to be bypassed
   ----------------------------------------------------------------------------
   data_out_mux_p : process(rx_ll_data_in, data_sr5, sel_delay_path)
   begin
      if sel_delay_path = '1' then
         mux_out <= rx_ll_data_in;
      else
         mux_out <= data_sr5;
      end if;
   end process;  -- data_out_mux_p

   ----------------------------------------------------------------------------
   --Process data_out_reg_p
   --Registers data output from output mux
   ----------------------------------------------------------------------------
   data_out_reg_p : process(rx_ll_clock)
   begin
      if rising_edge(rx_ll_clock) then
        if rx_enable = '1' then
          rx_ll_data_out <= mux_out after dly;
        end if;
      end if;
   end process;  -- data_out_reg_p

   rx_enable <= not(rx_ll_dst_rdy_in_n);

   ----------------------------------------------------------------------------
   --Process data_sof_sr_p
   --Delays start of frame by 7 clock cycles
   ----------------------------------------------------------------------------
   data_sof_sr_p : process(rx_ll_clock)
   begin
      if rising_edge(rx_ll_clock) then
        if rx_enable = '1' then
          sof_sr_content <= not rx_ll_sof_in_n & sof_sr_content(0 to 5);
        end if;
      end if;
   end process;  -- data_sof_sr_p
   rx_ll_sof_out_n <= not sof_sr_content(6) after dly;

   ----------------------------------------------------------------------------
   --Process data_eof_sr_p
   --Delays end of frame by 7 clock cycles
   ----------------------------------------------------------------------------
   data_eof_sr_p : process(rx_ll_clock)
   begin
      if rising_edge(rx_ll_clock) then
        if rx_enable = '1' then
          eof_sr_content <= not rx_ll_eof_in_n & eof_sr_content(0 to 5);
        end if;
      end if;
   end process;  -- data_eof_sr_p
   rx_ll_eof_out_n <= not eof_sr_content(6) after dly;

   ----------------------------------------------------------------------------
   --Process src_rdy_sr_p
   --Delays source ready by 7 clock cycles
   ----------------------------------------------------------------------------
   src_rdy_sr_p : process(rx_ll_clock)
   begin
      if rising_edge(rx_ll_clock) then
        if rx_enable = '1' then
           rdy_sr_content <= not rx_ll_src_rdy_in_n & rdy_sr_content(0 to 5);
        end if;
      end if;
   end process;  -- src_rdy_sr_p
   rx_ll_src_rdy_out_n <= not rdy_sr_content(6) after dly;

   ----------------------------------------------------------------------------
   --Process control_fsm_sync_p
   --Synchronous update of next state of control_fsm
   ----------------------------------------------------------------------------
   control_fsm_sync_p : process(rx_ll_clock)
   begin
      if rising_edge(rx_ll_clock) then
         if rx_ll_reset = '1' then
            control_fsm_state <= wait_sf;
         else
           if rx_enable = '1' then
             case control_fsm_state is
                when wait_sf =>
                   if sof_sr_content(4) = '1' then
                      control_fsm_state <= bypass_sa1;
                   else
                      control_fsm_state <= wait_sf;
                   end if;

                when bypass_sa1 =>
                   if not(sof_sr_content(4) = '0' and eof_sr_content(4) = '1') then
                      control_fsm_state <= bypass_sa2;
                   else
                      control_fsm_state <= wait_sf;
                   end if;

                when bypass_sa2 =>
                   if not(sof_sr_content(4) = '0' and eof_sr_content(4) = '1') then
                      control_fsm_state <= bypass_sa3;
                   else
                      control_fsm_state <= wait_sf;
                   end if;

                when bypass_sa3 =>
                   if not(sof_sr_content(4) = '0' and eof_sr_content(4) = '1') then
                      control_fsm_state <= bypass_sa4;
                   else
                      control_fsm_state <= wait_sf;
                   end if;

                when bypass_sa4 =>
                   if not(sof_sr_content(4) = '0' and eof_sr_content(4) = '1') then
                      control_fsm_state <= bypass_sa5;
                   else
                      control_fsm_state <= wait_sf;
                   end if;

                when bypass_sa5 =>
                   if not(sof_sr_content(4) = '0' and eof_sr_content(4) = '1') then
                      control_fsm_state <= bypass_sa6;
                   else
                      control_fsm_state <= wait_sf;
                   end if;

                when bypass_sa6 =>
                   if not(sof_sr_content(4) = '0' and eof_sr_content(4) = '1') then
                      control_fsm_state <= pass_rof;
                   else
                      control_fsm_state <= wait_sf;
                   end if;

                when pass_rof =>
                   if not(sof_sr_content(4) = '0' and eof_sr_content(4) = '1') then
                      control_fsm_state <= pass_rof;
                   else
                      control_fsm_state <= wait_sf;
                   end if;

                when others =>
                   control_fsm_state <= wait_sf;

                end case;
             end if;
           end if;
      end if;
   end process;  -- control_fsm_sync_p

   ----------------------------------------------------------------------------
   --Process control_fsm_comb_p
   --Determines control signals from control_fsm state
   ----------------------------------------------------------------------------
   control_fsm_comb_p : process(control_fsm_state)
   begin
      case control_fsm_state is
         when wait_sf    =>
            sel_delay_path <= '0';  -- output data from data shift register
            enable_data_sr <= '1';  -- enable data to be loaded into shift register

         when bypass_sa1 =>
            sel_delay_path <= '1';  -- output data directly from input
            enable_data_sr <= '0';  -- hold current data in shift register

         when bypass_sa2 =>
            sel_delay_path <= '1';  -- output data directly from input
            enable_data_sr <= '0';  -- hold current data in shift register

         when bypass_sa3 =>
            sel_delay_path <= '1';  -- output data directly from input
            enable_data_sr <= '0';  -- hold current data in shift register

         when bypass_sa4 =>
            sel_delay_path <= '1';  -- output data directly from input
            enable_data_sr <= '0';  -- hold current data in shift register

         when bypass_sa5 =>
            sel_delay_path <= '1';  -- output data directly from input
            enable_data_sr <= '0';  -- hold current data in shift register

         when bypass_sa6 =>
            sel_delay_path <= '1';  -- output data directly from input
            enable_data_sr <= '0';  -- hold current data in shift register

         when pass_rof   =>
            sel_delay_path <= '0';  -- output data from data shift register
            enable_data_sr <= '1';  -- enable data to be loaded into shift register

         when others     =>
            sel_delay_path <= '0';
            enable_data_sr <= '1';

      end case;
   end process;  -- control_fsm_comb_p

end arch1;  --arch1
