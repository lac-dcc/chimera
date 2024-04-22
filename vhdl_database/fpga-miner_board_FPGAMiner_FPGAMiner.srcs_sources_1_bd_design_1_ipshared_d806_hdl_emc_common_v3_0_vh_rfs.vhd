-- Loadable arithmetic register.
-------------------------------------------------------------------------------
--
-- *************************************************************************
-- **                                                                     **
-- ** DISCLAIMER OF LIABILITY                                             **
-- **                                                                     **
-- ** This text/file contains proprietary, confidential                   **
-- ** information of Xilinx, Inc., is distributed under                   **
-- ** license from Xilinx, Inc., and may be used, copied                  **
-- ** and/or disclosed only pursuant to the terms of a valid              **
-- ** license agreement with Xilinx, Inc. Xilinx hereby                   **
-- ** grants you a license to use this text/file solely for               **
-- ** design, simulation, implementation and creation of                  **
-- ** design files limited to Xilinx devices or technologies.             **
-- ** Use with non-Xilinx devices or technologies is expressly            **
-- ** prohibited and immediately terminates your license unless           **
-- ** covered by a separate agreement.                                    **
-- **                                                                     **
-- ** Xilinx is providing this design, code, or information               **
-- ** "as-is" solely for use in developing programs and                   **
-- ** solutions for Xilinx devices, with no obligation on the             **
-- ** part of Xilinx to provide support. By providing this design,        **
-- ** code, or information as one possible implementation of              **
-- ** this feature, application or standard, Xilinx is making no          **
-- ** representation that this implementation is free from any            **
-- ** claims of infringement. You are responsible for obtaining           **
-- ** any rights you may require for your implementation.                 **
-- ** Xilinx expressly disclaims any warranty whatsoever with             **
-- ** respect to the adequacy of the implementation, including            **
-- ** but not limited to any warranties or representations that this      **
-- ** implementation is free from claims of infringement, implied         **
-- ** warranties of merchantability or fitness for a particular           **
-- ** purpose.                                                            **
-- **                                                                     **
-- ** Xilinx products are not intended for use in life support            **
-- ** appliances, devices, or systems. Use in such applications is        **
-- ** expressly prohibited.                                               **
-- **                                                                     **
-- ** Any modifications that are made to the Source Code are              **
-- ** done at the user’s sole risk and will be unsupported.               **
-- ** The Xilinx Support Hotline does not have access to source           **
-- ** code and therefore cannot answer specific questions related         **
-- ** to source HDL. The Xilinx Hotline support of original source        **
-- ** code IP shall only address issues and questions related             **
-- ** to the standard Netlist version of the core (and thus               **
-- ** indirectly, the original core source).                              **
-- **                                                                     **
-- ** Copyright (c) 2001-2010 Xilinx, Inc. All rights reserved.           **
-- **                                                                     **
-- ** This copyright and support notice must be retained as part          **
-- ** of this text at all times.                                          **
-- **                                                                     **
-- *************************************************************************
--
-------------------------------------------------------------------------------
-- Filename:        ld_arith_reg.vhd
-- Version:         
--------------------------------------------------------------------------------
-- Description:   A register that can be loaded and added to or subtracted from
--                (but not both). The width of the register is specified
--                with a generic. The load value and the arith
--                value, i.e. the value to be added (subtracted), may be of
--                lesser width than the register and may be
--                offset from the LSB position. (Uncovered positions
--                load or add (subtract) zero.) The register can be
--                reset, via the RST signal, to a freely selectable value.
--                The register is defined in terms of big-endian bit ordering.
--
-------------------------------------------------------------------------------
-- Structure: 
--
--              ld_arith_reg.vhd
-------------------------------------------------------------------------------
-- Author:      FO
--
-- History:
--
--      FO      08/01        -- First version
--
--      FO      11/14/01     -- Cosmetic improvements
--
--      FO      02/22/02     -- Switched from MUXCY_L primitive to MUXCY.
--
--     DET     1/17/2008     v4_0
-- ~~~~~~
--     - Incorporated new disclaimer header
-- ^^^^^^
--
-------------------------------------------------------------------------------
-- Naming Conventions:
--      active low signals:                     "*_n"
--      clock signals:                          "clk", "clk_div#", "clk_#x" 
--      reset signals:                          "rst", "rst_n" 
--      generics:                               "C_*" 
--      user defined types:                     "*_TYPE" 
--      state machine next state:               "*_ns" 
--      state machine current state:            "*_cs" 
--      combinatorial signals:                  "*_com" 
--      pipelined or register delay signals:    "*_d#" 
--      counter signals:                        "*cnt*"
--      clock enable signals:                   "*_ce" 
--      internal version of output port         "*_i"
--      device pins:                            "*_pin" 
--      ports:                                  - Names begin with Uppercase 
--      processes:                              "*_PROCESS" 
--      component instantiations:               "<ENTITY_>I_<#|FUNC>
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity ld_arith_reg is
    generic (
        ------------------------------------------------------------------------
        -- True if the arithmetic operation is add, false if subtract.
        C_ADD_SUB_NOT : boolean := false;
        ------------------------------------------------------------------------
        -- Width of the register.
        C_REG_WIDTH   : natural := 8;
        ------------------------------------------------------------------------
        -- Reset value. (No default, must be specified in the instantiation.)
        C_RESET_VALUE : std_logic_vector;
        ------------------------------------------------------------------------
        -- Width of the load data.
        C_LD_WIDTH    : natural :=  8;
        ------------------------------------------------------------------------
        -- Offset from the LSB (toward more significant) of the load data.
        C_LD_OFFSET   : natural :=  0;
        ------------------------------------------------------------------------
        -- Width of the arithmetic data.
        C_AD_WIDTH    : natural :=  8;
        ------------------------------------------------------------------------
        -- Offset from the LSB of the arithmetic data.
        C_AD_OFFSET   : natural :=  0
        ------------------------------------------------------------------------
        -- Dependencies: (1) C_LD_WIDTH + C_LD_OFFSET <= C_REG_WIDTH
        --               (2) C_AD_WIDTH + C_AD_OFFSET <= C_REG_WIDTH
        ------------------------------------------------------------------------
    );
    port (
        CK       : in  std_logic;
        RST      : in  std_logic; -- Reset to C_RESET_VALUE. (Overrides OP,LOAD)
        Q        : out std_logic_vector(0 to C_REG_WIDTH-1);
        LD       : in  std_logic_vector(0 to C_LD_WIDTH-1); -- Load data.
        AD       : in  std_logic_vector(0 to C_AD_WIDTH-1); -- Arith data.
        LOAD     : in  std_logic;  -- Enable for the load op, Q <= LD.
        OP       : in  std_logic   -- Enable for the arith op, Q <= Q + AD.
                                   -- (Q <= Q - AD if C_ADD_SUB_NOT = false.)
                                   -- (Overrrides LOAD.)
    );
end ld_arith_reg;
  

library unisim;
use unisim.all;

library ieee;
use ieee.numeric_std.all;

architecture imp of ld_arith_reg is

    component MULT_AND
       port(
          LO :  out   std_ulogic;
          I1 :  in    std_ulogic;
          I0 :  in    std_ulogic);
    end component;

    component MUXCY is
      port (
        DI : in  std_logic;
        CI : in  std_logic;
        S  : in  std_logic;
        O  : out std_logic);
    end component MUXCY;

    component XORCY is
      port (
        LI : in  std_logic;
        CI : in  std_logic;
        O  : out std_logic);
    end component XORCY;

    component FDRE is
      port (
        Q  : out std_logic;
        C  : in  std_logic;
        CE : in  std_logic;
        D  : in  std_logic;
        R  : in  std_logic
      );
    end component FDRE;
  
    component FDSE is
      port (
        Q  : out std_logic;
        C  : in  std_logic;
        CE : in  std_logic;
        D  : in  std_logic;
        S  : in  std_logic
      );
    end component FDSE;
  
    signal q_i,
           q_i_ns,
           xorcy_out,
           gen_cry_kill_n : std_logic_vector(0 to C_REG_WIDTH-1);
    signal cry : std_logic_vector(0 to C_REG_WIDTH);

begin

    -- synthesis translate_off

    assert C_LD_WIDTH + C_LD_OFFSET <= C_REG_WIDTH 
        report "ld_arith_reg, constraint does not hold: " &
               "C_LD_WIDTH + C_LD_OFFSET <= C_REG_WIDTH"
        severity error;
    assert C_AD_WIDTH + C_AD_OFFSET <= C_REG_WIDTH 
        report "ld_arith_reg, constraint does not hold: " &
               "C_AD_WIDTH + C_AD_OFFSET <= C_REG_WIDTH"
        severity error;

    -- synthesis translate_on

    Q <= q_i;

    cry(C_REG_WIDTH) <= '0' when C_ADD_SUB_NOT else OP;

    PERBIT_GEN: for j in C_REG_WIDTH-1 downto 0 generate
        signal load_bit, arith_bit, CE : std_logic;
    begin

        ------------------------------------------------------------------------
        -- Assign to load_bit either zero or the bit from input port LD.
        ------------------------------------------------------------------------
        D_ZERO_GEN: if    j > C_REG_WIDTH - 1 - C_LD_OFFSET 
                       or j < C_REG_WIDTH - C_LD_WIDTH - C_LD_OFFSET generate
            load_bit <= '0';
        end generate;
        D_NON_ZERO_GEN: if    j <= C_REG_WIDTH - 1 - C_LD_OFFSET 
                          and j >= C_REG_WIDTH - C_LD_OFFSET - C_LD_WIDTH
        generate
            load_bit <= LD(j - (C_REG_WIDTH - C_LD_WIDTH - C_LD_OFFSET));
        end generate;

        ------------------------------------------------------------------------
        -- Assign to arith_bit either zero or the bit from input port AD.
        ------------------------------------------------------------------------
        AD_ZERO_GEN: if    j > C_REG_WIDTH - 1 - C_AD_OFFSET 
                        or j < C_REG_WIDTH - C_AD_WIDTH - C_AD_OFFSET
        generate
            arith_bit <= '0';
        end generate;
        AD_NON_ZERO_GEN: if    j <= C_REG_WIDTH - 1 - C_AD_OFFSET 
                           and j >= C_REG_WIDTH - C_AD_OFFSET - C_AD_WIDTH
        generate
            arith_bit <= AD(j - (C_REG_WIDTH - C_AD_WIDTH - C_AD_OFFSET));
        end generate;


        ------------------------------------------------------------------------
        -- LUT output generation.
        -- Adder case
        ------------------------------------------------------------------------
        Q_I_GEN_ADD: if C_ADD_SUB_NOT generate
            q_i_ns(j) <= q_i(j) xor  arith_bit when  OP = '1' else load_bit;
        end generate;
        ------------------------------------------------------------------------
        -- Subtractor case
        ------------------------------------------------------------------------
        Q_I_GEN_SUB: if not C_ADD_SUB_NOT generate
            q_i_ns(j) <= q_i(j) xnor arith_bit when  OP = '1' else load_bit;
        end generate;


        ------------------------------------------------------------------------
        -- Kill carries (borrows) for loads but
        -- generate or kill carries (borrows) for add (sub).
        ------------------------------------------------------------------------
        MULT_AND_i1: MULT_AND
           port map (
              LO => gen_cry_kill_n(j),
              I1 => OP,
              I0 => Q_i(j)
           );

        ------------------------------------------------------------------------
        -- Propagate the carry (borrow) out.
        ------------------------------------------------------------------------
        MUXCY_i1: MUXCY
          port map (
            DI => gen_cry_kill_n(j),
            CI => cry(j+1),
            S  => q_i_ns(j),
            O  => cry(j)
          );

        ------------------------------------------------------------------------
        -- Apply the effect of carry (borrow) in.
        ------------------------------------------------------------------------
        XORCY_i1: XORCY
          port map (
            LI => q_i_ns(j),
            CI => cry(j+1),
            O  =>  xorcy_out(j)
          );


        CE <= LOAD or OP;


        ------------------------------------------------------------------------
        -- Generate either a resettable or setable FF for bit j, depending
        -- on C_RESET_VALUE at bit j.
        ------------------------------------------------------------------------
        FF_RST0_GEN: if C_RESET_VALUE(j) = '0' generate
            FDRE_i1: FDRE
              port map (
                Q  => q_i(j),
                C  => CK,
                CE => CE,
                D  => xorcy_out(j),
                R  => RST
              );
        end generate;
        FF_RST1_GEN: if C_RESET_VALUE(j) = '1' generate
            FDSE_i1: FDSE
              port map (
                Q  => q_i(j),
                C  => CK,
                CE => CE,
                D  => xorcy_out(j),
                S  => RST
              );
        end generate;

      end generate;

end imp;


-------------------------------------------------------------------
-- (c) Copyright 1984 - 2013 Xilinx, Inc. All rights reserved.
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
-------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Filename:        ipic_if.vhd
-- Description:     IPIC Interface
--
-- VHDL-Standard:   VHDL'93
-------------------------------------------------------------------------------
-- Structure:
--                  emc.vhd
--                      -- ipic_if.vhd
--                      -- addr_counter_mux.vhd
--                      -- counters.vhd
--                      -- select_param.vhd
--                      -- mem_state_machine.vhd
--                      -- mem_steer.vhd
--                      -- io_registers.vhd
-------------------------------------------------------------------------------
-- Author:          NSK
-- History:
-- NSK             02/01/08    First Version
-- ^^^^^^^^^^
-- This file is same as in version v3_01_c - no change in the logic of this
-- module. Deleted the history from version v3_01_c.
-- ~~~~~~
-- NSK         05/08/08    version v3_00_a
-- ^^^^^^^^
-- 1. This file is same as in version v3_02_a.
-- 2. Upgraded to version v3.00.a to have proper versioning to fix CR #472164.
-- 3. No change in design.
-- ~~~~~~~~
-- ^^^^^^^^
-- KSB         08/08/08    version v4_00_a
-- 1. This file is same as in version v3_00_a.
-- 2. Upgraded to version v4.00.a
-- ~~~~~~~~
-- SK          10/07/10
-- ^^^^^^^^
-- 1. Added "clear_pend_rdreq <= '1' when ((burst_cnt_i = 0) and (Bus2IP_Burst = '0') and
                              --(Mem2Bus_RdAddrAck = '1')) or bus2Mem_CS_i = '0'
                              --  else
                              --'0' ;
-- 2.  condition for "clear_pend_wrreq". This is similar to "clear_pend_rdreq" .
-- ~~~~~~~~
-- SK          25/10/10
-- ^^^^^^^^
-- 1. Registered IP2bus_RdAck and IP2Bus_Data signals.
-- ~~~~~~~~
-- SK          24/11/10
-- ^^^^^^^^
-- 1. Added "Bus2IP_RdReq_emc = '0'" signal to reset the RDREQ_PROCESS.
-- ~~~~~~~~
-- SK          02/11/11    version v5_02_a
-- ^^^^^^^^
-- 1. Fixed CR#595758 and CR#606038
-- ~~~~~~~~
-- ~~~~~~
--  Sateesh 2011
-- ^^^^^^
--  -- Added Sync burst support for the Numonyx flash during read
-- ~~~~~~
-- ~~~~~~
--  SK 10/20/12
-- ^^^^^^
--  -- Fixed CR 672770 - BRESP signal is driven X during netlist simulation
--  -- Fixed CR 673491 - Flash transactions generates extra read cycle after the actual reads are over
-- ~~~~~~
-------------------------------------------------------------------------------
-- Naming Conventions:
--      active low signals:                     "*_n"
--      clock signals:                          "clk", "clk_div#", "clk_#x"
--      reset signals:                          "rst", "rst_n"
--      generics:                               "C_*"
--      user defined types:                     "*_TYPE"
--      state machine next state:               "*_ns"
--      state machine current state:            "*_cs"
--      combinatorial signals:                  "*_cmb"
--      pipelined or register delay signals:    "*_d#"
--      counter signals:                        "*cnt*"
--      clock enable signals:                   "*_ce"
--      internal version of output port         "*_i"
--      device pins:                            "*_pin"
--      ports:                                  - Names begin with Uppercase
--      processes:                              "*_PROCESS"
--      component instantiations:               "<ENTITY_>I_<#|FUNC>
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

use ieee.std_logic_misc.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
-------------------------------------------------------------------------------
library emc_common_v3_0_5;

-------------------------------------------------------------------------------
-- vcomponents package of the unisim library is used for the FDR component
-- declaration
-------------------------------------------------------------------------------
library unisim;
use unisim.vcomponents.all;
-------------------------------------------------------------------------------
-- Definition of Generics:
--  C_NUM_BANKS_MEM         -- Number of Memory Banks
--  C_IPIF_DWIDTH           -- Processor Data Bus Width
--
-- Definition of Ports:
--  Bus2IP_RNW              -- Processor read not write (1=Read, 0=Write)
--  Bus2IP_Mem_CS           -- Memory Channel Chip Select
--  Mem2Bus_RdAddrAck       -- Memory Read Cycle Address Acknowledge
--  Mem2Bus_WrAddrAck       -- Memory Write Cycle Address Acknowledge
--  Mem2Bus_RdAck           -- Memory Read Cycle Acknowledge
--  Mem2Bus_WrAck           -- Memory Write Cycle Acknowledge
--  Mem2Bus_Data            -- Memory Read Data
--  Bus2Mem_RdReq           -- Read request was seen by mem_state_machine
--  Bus2Mem_WrReq           -- Write request was seen by mem_state_machine
--  Bus2Mem_CS              -- Memory is being accessed
--  IP2Bus_Data             -- Read data from memory device or register
--  IP2Bus_errAck           -- Error acknowledge
--  IP2Bus_retry            -- Retry indicator
--  IP2Bus_toutSup          -- Suppress watch dog timer
--  IP2Bus_RdAck            -- Read acknowledge
--  IP2Bus_WrAck            -- Write acknowledge
--  IP2Bus_AddrAck          -- Address acknowledge
--  Burst_length            -- Count of current burst length
--  Transaction_done        -- Operation complete indication for current
--                          -- transaction
--  Bus2IP_Clk              -- System clock
--  Bus2IP_Reset            -- System Reset
-------------------------------------------------------------------------------
-- Port declarations
-------------------------------------------------------------------------------

entity ipic_if is
    generic (
        C_NUM_BANKS_MEM     : integer := 2;

        C_IPIF_DWIDTH       : integer := 64
    );
    port (
        Bus2IP_Clk          : in  std_logic;
        Bus2IP_Reset        : in  std_logic;

        Bus2IP_RNW          : in  std_logic;
        Bus2IP_Mem_CS       : in  std_logic_vector(0 to C_NUM_BANKS_MEM-1);

        Mem2Bus_RdAddrAck   : in  std_logic;
        Mem2Bus_WrAddrAck   : in  std_logic;
        Mem2Bus_RdAck       : in  std_logic;
        Mem2Bus_WrAck       : in  std_logic;
        Bus2IP_WrReq        : in  std_logic;
        Bus2IP_RdReq        : in  std_logic;
        Mem2Bus_Data        : in  std_logic_vector(0 to C_IPIF_DWIDTH - 1);
        Bus2IP_Burst        : in  std_logic;

        Bus2IP_RdReq_emc : in  std_logic;
        Bus2IP_WrReq_emc : in  std_logic;

        Bus2Mem_CS          : out std_logic;
        Bus2Mem_RdReq       : out std_logic;
        Bus2Mem_WrReq       : out std_logic;

        Parity_err          : in  std_logic;

        IP2Bus_Data         : out std_logic_vector(0 to C_IPIF_DWIDTH - 1);
        IP2Bus_errAck       : out std_logic;
        IP2Bus_retry        : out std_logic;
        IP2Bus_toutSup      : out std_logic;
        IP2Bus_RdAck        : out std_logic;
        IP2Bus_WrAck        : out std_logic;
        IP2Bus_AddrAck      : out std_logic;
        Type_of_xfer        : in  std_logic;

        Burst_length        : in  std_logic_vector(0 to 7);
        Transaction_done    : in  std_logic;

        single_transaction  : in std_logic ;
        last_burst_cnt      : out std_logic;
	    pr_state_wait_temp_cmb : in std_logic;
        synch_mem              : in std_logic;                     -- 10-12-2012
        mem_width_bytes        : in std_logic_vector(0 to 3);
        stop_oen               : out std_logic;
	    axi_trans_size_reg         : in std_logic_vector(1 downto 0); -- 1/3/2013
	    Linear_flash_brst_rd_flag  : in std_logic -- 1/28/2013
    );
end entity ipic_if;

-------------------------------------------------------------------------------
-- Architecture section
-------------------------------------------------------------------------------

architecture imp of ipic_if is

----------------------------------------------------------------------------------
-- below attributes are added to reduce the synth warnings in Vivado tool
attribute DowngradeIPIdentifiedWarnings: string;
attribute DowngradeIPIdentifiedWarnings of imp : architecture is "yes";
----------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Constant Declaration
-------------------------------------------------------------------------------
constant BURST_CNT_WIDTH      : integer := 8;
constant ZERO_CNT             : std_logic_vector(0 to BURST_CNT_WIDTH -1)
                                                             := (others=>'0');
-------------------------------------------------------------------------------
-- Signal Declaration
-------------------------------------------------------------------------------

signal bus2mem_cs_i           : std_logic;
signal burst_cnt_en           : std_logic;
signal burst_cnt_ld_cmb       : std_logic;
signal pend_wrreq             : std_logic;
signal set_pend_wrreq         : std_logic;
signal clear_pend_wrreq       : std_logic;

signal pend_rdreq             : std_logic;
signal set_pend_rdreq         : std_logic;
signal clear_pend_rdreq       : std_logic;

signal burst_cnt_i            : std_logic_vector(0 to BURST_CNT_WIDTH - 1);

signal int_wrreq              : std_logic;
signal int_rdreq              : std_logic;
        ---remove this signal once fix is made to ipif
signal burst_length_i         :std_logic_vector(0 to BURST_CNT_WIDTH - 1);
signal bus2ip_mem_cs_reg      :std_logic;--_vector(0 to C_NUM_BANKS_MEM-1);

signal IP2Bus_AddrAck_d1      :std_logic;
signal burst_rst              :std_logic;
signal stop_init_rd           :std_logic;
signal reload_address         :std_logic;
signal reload_req             :std_logic;

signal IP2Bus_WrAck_i         :std_logic;
signal IP2Bus_AddrAck_i       :std_logic;
signal IP2Bus_RdAck_i         :std_logic;
signal reset_fifo             :std_logic;

signal burst_cnt_i_rdack : std_logic_vector(0 to BURST_CNT_WIDTH - 1);
signal diff_addr_rd_ack  : std_logic;
signal burst_cnt_en_rdack: std_logic;
signal first_rd_ack      : std_logic;
signal rd_ack_d1         : std_logic;
signal Bus2Mem_RdReq_int : std_logic;

signal bus2Mem_CS_reduce_reg : std_logic;
signal pr_state_wait_temp_reg: std_logic;
signal rd_cnt : std_logic_vector(3 downto 0);
signal stop_oen_int : std_logic;
-- signal stop_oen : std_logic;
-------------------------------------------------------------------------------
-- Begin architecture
-------------------------------------------------------------------------------

begin -- architecture IMP

    ---------------------------------------------------------------------------
    -- IPIC
    ---------------------------------------------------------------------------
    burst_length_i      <= Burst_length(0 to BURST_CNT_WIDTH - 1);
    bus2Mem_CS_i        <= or_reduce(Bus2IP_Mem_CS); -- (bus2IP_Mem_CS_reg); -- 1/3/2013
    Bus2Mem_CS          <= bus2Mem_CS_i;
    IP2Bus_errAck       <= (Parity_err  or (not Type_of_xfer)) and
                                                        bus2Mem_CS_i;
    IP2Bus_retry        <= '0';
    IP2Bus_toutSup      <= bus2Mem_CS_i;
    --IP2Bus_Data         <= Mem2Bus_Data;
    int_wrreq           <= Bus2IP_WrReq and bus2Mem_CS_i;
    int_rdreq           <= Bus2IP_RdReq and bus2Mem_CS_i;

    ---------------------------------------------------------------------------
    -- Register the Bus2IP_Mem_CS
    ---------------------------------------------------------------------------

    CS_REG_PROCESS : process(Bus2IP_Clk)
    begin
        if(Bus2IP_Clk'EVENT and Bus2IP_Clk = '1') then
            if(Bus2IP_Reset = '1')then
                bus2IP_Mem_CS_reg  <= '0';--(others=>'0');
		pr_state_wait_temp_reg <= '0';
            else
                bus2IP_Mem_CS_reg  <= or_reduce(Bus2IP_Mem_CS);
		pr_state_wait_temp_reg <= pr_state_wait_temp_cmb;
        end if;
        end if;
    end process CS_REG_PROCESS;

    ONE_HOT_CS_PROCESS : process(Bus2IP_Clk)
    begin
        if(Bus2IP_Clk'EVENT and Bus2IP_Clk = '1') then
            if(Bus2IP_Reset = '1')then
                bus2Mem_CS_reduce_reg  <= '0';
            else
                bus2Mem_CS_reduce_reg  <= bus2Mem_CS_i;
            end if;
        end if;
    end process ONE_HOT_CS_PROCESS;
    ---------------------------------------------------------------------------
    -- Register the acks signals
    ---------------------------------------------------------------------------

    ACK_REG_PROCESS : process(Bus2IP_Clk)
    begin
        if(Bus2IP_Clk'EVENT and Bus2IP_Clk = '1') then
            if(Bus2IP_Reset = '1')then
		IP2Bus_Data       <= (others => '0');
                IP2Bus_RdAck      <= '0';
            else
		IP2Bus_Data       <= Mem2Bus_Data;
		IP2Bus_RdAck      <= Mem2Bus_RdAck and (Bus2Mem_RdReq_int or 
                                                single_transaction or 
							                    Linear_flash_brst_rd_flag);
            end if;
        end if;
    end process ACK_REG_PROCESS;

                IP2Bus_WrAck      <= Mem2Bus_WrAck;
                IP2Bus_AddrAck    <= (Mem2Bus_RdAddrAck or Mem2Bus_WrAddrAck) and
                                                (Bus2IP_WrReq or Bus2IP_RdReq);

    ---------------------------------------------------------------------------
    -- Burst length counter instantiation
    ---------------------------------------------------------------------------
        BURST_CNT: entity emc_common_v3_0_5.ld_arith_reg
            generic map (C_ADD_SUB_NOT  => false,
                         C_REG_WIDTH    => BURST_CNT_WIDTH,
                         C_RESET_VALUE  => ZERO_CNT,
                         C_LD_WIDTH     => BURST_CNT_WIDTH,
                         C_LD_OFFSET    => 0,
                         C_AD_WIDTH     => 1,
                         C_AD_OFFSET    => 0
                        )
            port map (   CK             => Bus2IP_Clk,
                         RST            => reset_fifo,
                         Q              => burst_cnt_i,
                         LD             => burst_length_i,
                         AD             => (others => '1'),
                         LOAD           => burst_cnt_ld_cmb,
                         OP             => burst_cnt_en
                         );


       ---------------------------------------------------------------------------
    -- Burst length counter instantiation -- For Read Ack
    ---------------------------------------------------------------------------
        BURST_CNT_RDACK: entity emc_common_v3_0_5.ld_arith_reg
            generic map (C_ADD_SUB_NOT  => false,
                         C_REG_WIDTH    => BURST_CNT_WIDTH,
                         C_RESET_VALUE  => ZERO_CNT,
                         C_LD_WIDTH     => BURST_CNT_WIDTH,
                         C_LD_OFFSET    => 0,
                         C_AD_WIDTH     => 1,
                         C_AD_OFFSET    => 0
                        )
            port map (   CK             => Bus2IP_Clk,
                         RST            => reset_fifo,
                         Q              => burst_cnt_i_rdack,
                         LD             => burst_length_i,
                         AD             => (others => '1'),
                         LOAD           => burst_cnt_ld_cmb,
                         OP             => burst_cnt_en_rdack
                         );
burst_cnt_en_rdack <= (diff_addr_rd_ack and Mem2Bus_RdAck);

diff_addr_rd_ack <= or_reduce(burst_cnt_i xor burst_cnt_i_rdack);

    ---------------------------------------------------------------------------
    -- Burst length counter control signals
    ---------------------------------------------------------------------------
    burst_cnt_en      <= (Mem2Bus_RdAddrAck or Mem2Bus_WrAddrAck) and
                                       (Bus2IP_WrReq or Bus2IP_RdReq);






    burst_cnt_ld_cmb    <= not(bus2Mem_CS_reduce_reg) and bus2Mem_CS_i;

    reset_fifo  <= Bus2IP_Reset or (not bus2Mem_CS_i);
    last_burst_cnt <= not (or_reduce(burst_cnt_i));
    ---------------------------------------------------------------------------
    -- Generation of pend_wrreq
    ---------------------------------------------------------------------------

    set_pend_wrreq   <= (not pend_wrreq) and Transaction_done and int_wrreq;
    clear_pend_wrreq <= '1' when ((burst_cnt_i = 0) and (Bus2IP_Burst = '0') and
                                        (Mem2Bus_WrAddrAck = '1'))or bus2Mem_CS_i = '0' else
                        '0' ;

    WRREQ_PROCESS : process(Bus2IP_Clk)
    begin
        if(Bus2IP_Clk'EVENT and Bus2IP_Clk = '1') then
            if(Bus2IP_Reset = '1')then
                pend_wrreq  <= '0';
            elsif set_pend_wrreq ='1' then
                pend_wrreq  <= '1';
            --elsif clear_pend_wrreq = '1' then
	    elsif(Bus2IP_Burst = '0' and (Mem2Bus_WrAddrAck = '1')) or
	         (bus2Mem_CS_i = '0') then
                pend_wrreq  <= '0';
        end if;
        end if;
    end process WRREQ_PROCESS;

    Bus2Mem_WrReq  <= (pend_wrreq and Bus2IP_WrReq);

    ---------------------------------------------------------------------------
    -- Generation of pend_rdreq
    ---------------------------------------------------------------------------

    set_pend_rdreq   <= (not pend_rdreq) and Transaction_done
                                         and int_rdreq;
    clear_pend_rdreq <= '1' when ((burst_cnt_i = 0) and (Bus2IP_Burst = '0') and
                                (Mem2Bus_RdAddrAck = '1')) or bus2Mem_CS_i = '0'
                                else
                        '0' ;

    RDREQ_PROCESS : process(Bus2IP_Clk)
    begin
        if(Bus2IP_Clk'EVENT and Bus2IP_Clk = '1') then
            if(Bus2IP_Reset = '1')then
                pend_rdreq  <= '0';
            elsif set_pend_rdreq = '1'then
                pend_rdreq  <= '1';
            elsif clear_pend_rdreq = '1' then -- 1/3/2013
	    -- elsif ((Bus2IP_Burst = '0')      and -- 1/3/2013
	    --        (Mem2Bus_RdAddrAck = '1') and -- 1/3/2013
	    --    (Bus2IP_RdReq_emc = '0')) or      -- 1/3/2013
	    --        (bus2Mem_CS_i = '0') then     -- 1/3/2013
                pend_rdreq  <= '0';
        end if;
        end if;
    end process RDREQ_PROCESS;


    Bus2Mem_RdReq_int  <= (pend_rdreq and (Bus2IP_RdReq or (diff_addr_rd_ack and Synch_mem)))
                          when (single_transaction = '0' or Synch_mem = '1')
                          else
                          Bus2IP_RdReq;

    Bus2Mem_RdReq <= Bus2Mem_RdReq_int;

    -- 10-12-2012
    RD_CNT_PROCESS : process(Bus2IP_Clk)
    begin
        if(Bus2IP_Clk'EVENT and Bus2IP_Clk = '1') then
            if(Transaction_done = '1')then
                rd_cnt  <= (others => '0');
            elsif diff_addr_rd_ack ='1' and Bus2IP_RdReq = '0' and stop_oen_int = '0' then
                rd_cnt  <= rd_cnt + 1;
            end if;
        end if;
    end process RD_CNT_PROCESS;

    -- stop_oen_int <= '1' when rd_cnt = "010" and mem_width_bytes = "0001" else -- 8 bit - reduced by 1 here
    --                 '1' when rd_cnt = "001" and mem_width_bytes = "0010" else -- 16 bit - reduced by 1 here
    --                 '1' when rd_cnt = "001" and mem_width_bytes = "0100" else -- 32 bit - reduced by 1 here
    --                 '0';
    
    STOP_OEN_GEN_PROCESS: process(axi_trans_size_reg,
                                  mem_width_bytes,
				  rd_cnt) is
    variable mem_width_and_size : std_logic_vector(5 downto 0);
    -----
    begin
    -----
    mem_width_and_size := mem_width_bytes & axi_trans_size_reg;

    case mem_width_and_size is
         when "000100" => -- axi byte access for 8 bit mem width
	                --if(rd_cnt = "0001")then
			--    stop_oen_int <= '1';
                        --else
			--    stop_oen_int <= '0';
			--end if;
                        stop_oen_int <= rd_cnt(0);
         when "000101" => -- axi HW access for 8 bit mem width
	                --if(rd_cnt = "0010")then
			--    stop_oen_int <= '1';
                        --else
			--    stop_oen_int <= '0';
			--end if;
			stop_oen_int <= rd_cnt(1);
         when "000110" => -- axi WORD access for 8 bit mem width
	                --if(rd_cnt = "0100")then
			--    stop_oen_int <= '1';
                        --else
			--    stop_oen_int <= '0';
			--end if;
			stop_oen_int <= rd_cnt(2);
         when "000111" => -- axi Double WORD access for 8 bit mem width
	                --if(rd_cnt = "1000")then
			--    stop_oen_int <= '1';
                        --else
			--    stop_oen_int <= '0';
			--end if;
			stop_oen_int <= rd_cnt(3);
         --------------- for 16 bit mem width
         when "001000" => -- axi byte access for 16 bit mem width
	                --if(rd_cnt = "0001")then
			--    stop_oen_int <= '1';
                        --else
			--    stop_oen_int <= '0';
			--end if;
			stop_oen_int <= rd_cnt(0);
         when "001001" => -- axi HW access for 16 bit mem width
	                --if(rd_cnt = "0001")then
			--    stop_oen_int <= '1';
                        --else
			--    stop_oen_int <= '0';
			--end if;
			stop_oen_int <= rd_cnt(0);
         when "001010" => -- axi WORD access for 16 bit mem width
	                --if(rd_cnt = "0010")then
			--    stop_oen_int <= '1';
                        --else
			--    stop_oen_int <= '0';
			--end if;
			stop_oen_int <= rd_cnt(1);
         when "001011" => -- axi DOUBLE WORD access for 16 bit mem width
	                --if(rd_cnt = "0100")then
			--    stop_oen_int <= '1';
                        --else
			--    stop_oen_int <= '0';
			--end if;
			stop_oen_int <= rd_cnt(2);
	 --------------- for 32 bit mem width
         when "010000" => -- axi byte access for 32 bit mem width
	                --if(rd_cnt = "0001")then
			--    stop_oen_int <= '1';
                        --else
			--    stop_oen_int <= '0';
			--end if;
			stop_oen_int <= rd_cnt(0);
         when "010001" => -- axi HW access for 32 bit mem width
	                --if(rd_cnt = "0001")then
			--    stop_oen_int <= '1';
                        --else
			--    stop_oen_int <= '0';
			--end if;
			stop_oen_int <= rd_cnt(0);
         when "010010" => -- axi WORD access for 32 bit mem width
	                --if(rd_cnt = "0001")then
			--    stop_oen_int <= '1';
                        --else
			--    stop_oen_int <= '0';
			--end if;
			stop_oen_int <= rd_cnt(0);
         when "010011" => -- axi DPOUBLE WORD access for 32 bit mem width
	                --if(rd_cnt = "0010")then
			--    stop_oen_int <= '1';
                        --else
			--    stop_oen_int <= '0';
			--end if;
			stop_oen_int <= rd_cnt(1);
         --------------- for 64 bit mem width
         when "100000" | -- axi byte access        for 64 bit mem width
	      "100001" | -- axi HW access          for 64 bit mem width
	      "100010" | -- axi WORD access        for 64 bit mem width
	      "100011" =>-- axi DOUBLE WORD access for 64 bit mem width 
	                --if(rd_cnt = "0001")then
			--    stop_oen_int <= '1';
                        --else
			--    stop_oen_int <= '0';
			--end if;
			stop_oen_int <= rd_cnt(0);
         ---------------
	 when others =>    stop_oen_int <= '0';
    end case;   
 
    end process STOP_OEN_GEN_PROCESS;

    stop_oen <= stop_oen_int;
end imp;
-------------------------------------------------------------------------------
-- End of File ipic_if.vhd
-------------------------------------------------------------------------------


-------------------------------------------------------------------
-- (c) Copyright 1984 - 2013 Xilinx, Inc. All rights reserved.
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
-------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Filename:        io_registers.vhd
-- Description:     This file contains the IO registers for the EMC
--                  design.
--
-- VHDL-Standard:   VHDL'93
-------------------------------------------------------------------------------
-- Structure:
--                  emc.vhd
--                      -- ipic_if.vhd
--                      -- addr_counter_mux.vhd
--                      -- counters.vhd
--                      -- select_param.vhd
--                      -- mem_state_machine.vhd
--                      -- mem_steer.vhd
--                      -- io_registers.vhd
-------------------------------------------------------------------------------
-- Author:          NSK
-- History:
-- NSK             02/01/08    First Version
-- ^^^^^^^^^^
-- This file is based on version v3_01_c updated to fixed CR #466745: -
-- Added generic C_MEM_DQ_CAPTURE_NEGEDGE. This is used to cpture the Mem_DQ_I
-- 1. If C_MEM_DQ_CAPTURE_NEGEDGE=0 Mem_DQ_I will be captured on +ve edge
--    (same as version v3_01_c)
-- 2. If C_MEM_DQ_CAPTURE_NEGEDGE=1 Mem_DQ_I will be captured on -ve edge (new)
-- ~~~~~~~~~
-- NSK         02/12/08    Updated
-- ^^^^^^^^
-- Added generic C_MEM_DQ_CAPTURE_NEGEDGE in comment "Definition of Generics"
-- section.
-- ~~~~~~~~
-- NSK         03/03/08    Updated
-- ^^^^^^^^
-- 1. Removed generic C_MEM_DQ_CAPTURE_NEGEDGE.
-- 2. Added the port RdClk used as clock to capture the data from memory.
-- ~~~~~~~~
-- NSK         05/08/08    version v3_00_a
-- ^^^^^^^^
-- 1. This file is same as in version v3_02_a.
-- 2. Upgraded to version v3.00.a to have proper versioning to fix CR #472164.
-- 3. No change in design.
-- ~~~~~~~~
-- ^^^^^^^^
-- KSB         08/08/08    version v4_00_a
-- 1. This file is same as in version v3_00_a.
-- 2. Upgraded to version v4.00.a
-- ~~~~~~~~
-- SK          02/11/10    version v5_01_a
-- ^^^^^^^^
-- 1. Registered the IP2Bus_RdAck and IP2Bus_Data signals.
-- 2. Reduced utilization
-- ~~~~~~~~
-- ~~~~~~
--  Sateesh 2011
-- ^^^^^^
--  -- Added Sync burst support for the Numonyx flash during read
-- ~~~~~~
-- ~~~~~~
--  SK 10/20/12
-- ^^^^^^
--  -- Fixed CR 672770 - BRESP signal is driven X during netlist simulation
--  -- Fixed CR 673491 - Flash transactions generates extra read cycle after the actual reads are over
-- ~~~~~~
-------------------------------------------------------------------------------
-- Naming Conventions:
--      active low signals:                     "*_n"
--      clock signals:                          "clk", "clk_div#", "clk_#x"
--      reset signals:                          "rst", "rst_n"
--      generics:                               "C_*"
--      user defined types:                     "*_TYPE"
--      state machine next state:               "*_ns"
--      state machine current state:            "*_cs"
--      combinatorial signals:                  "*_com"
--      pipelined or register delay signals:    "*_d#"
--      counter signals:                        "*cnt*"
--      clock enable signals:                   "*_ce"
--      internal version of output port         "*_i"
--      device pins:                            "*_pin"
--      ports:                                  - Names begin with Uppercase
--      processes:                              "*_PROCESS"
--      component instantiations:               "<ENTITY_>I_<#|FUNC>
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------------------------------------
-- Definition of Generics:
--     C_INCLUDE_NEGEDGE_IOREGS -- include negative edge IO registers
--     C_IPIF_AWIDTH            -- width of processor address bus
--     C_MAX_MEM_WIDTH          -- maximum data width of memory banks
--     C_NUM_BANKS_MEM          -- number of memory banks
--
-- Definition of Ports:
--  -- Internal memory signals
--     Mem_A_int                -- Internal Memory address inputs
--     Mem_DQ_I_int             -- Internal Memory input data bus
--     Mem_DQ_O_int             -- Internal Memory output data bus
--     Mem_DQ_T_int             -- Internal Memory data output enable
--     Mem_CEN_int              -- Internal Memory chip select
--     Mem_OEN_int              -- Internal Memory output enable
--     Mem_WEN_int              -- Internal Memory write enable
--     Mem_QWEN_int             -- Internal Memory qualified write enable
--     Mem_BEN_int              -- Internal Memory byte enables
--     Mem_RPN_int              -- Internal Memory reset/power down
--     Mem_CE_int               -- Internal Memory chip enable
--     Mem_ADV_LDN_int          -- Internal Memory counter
--                                 advance/load (=0)
--     Mem_LBON_int             -- Internal Memory linear/interleaved
--                                 burst order (=0)
--     Mem_CKEN_int             -- Internal Memory clock enable (=0)
--     Mem_RNW_int              -- Internal Memory read not write
--
--  -- Memory signals
--     Mem_A                    -- Memory address inputs
--     Mem_DQ_I                 -- Memory input data bus
--     Mem_DQ_O                 -- Memory output data bus
--     Mem_DQ_T                 -- Memory data output enable
--     Mem_CEN                  -- Memory chip select
--     Mem_OEN                  -- Memory output enable
--     Mem_WEN                  -- Memory write enable
--     Mem_QWEN                 -- Memory qualified write enable
--     Mem_BEN                  -- Memory byte enables
--     Mem_RPN                  -- Memory reset/power down
--     Mem_CE                   -- Memory chip enable
--     Mem_ADV_LDN              -- Memory counter advance/load (=0)
--     Mem_LBON                 -- Memory linear/interleaved burst
--                                 order (=0)
--     Mem_CKEN                 -- Memory clock enable (=0)
--     Mem_RNW                  -- Memory read not write
--
-- --- Clock & Reset
--     Clk                      -- System Clock
--     RdClk                    -- Read Clock
--     Rst                      -- System Reset
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Entity section
-------------------------------------------------------------------------------
entity io_registers is
    generic (
        C_INCLUDE_NEGEDGE_IOREGS : integer range 0 to 1;
        C_IPIF_AWIDTH            : integer;
        C_MAX_MEM_WIDTH          : integer;
        C_NUM_BANKS_MEM          : integer;
        C_FAMILY                 : string := "virtex6"
    );
  port (
      -- Internal memory signals
      Mem_A_int           : in  std_logic_vector(0 to C_IPIF_AWIDTH-1);

      Mem_DQ_I_int        : out std_logic_vector(0 to C_MAX_MEM_WIDTH-1);
      Mem_DQ_O_int        : in  std_logic_vector(0 to C_MAX_MEM_WIDTH-1);
      Mem_DQ_T_int        : in  std_logic_vector(0 to C_MAX_MEM_WIDTH-1);

      Mem_DQ_PARITY_I_int : out std_logic_vector(0 to C_MAX_MEM_WIDTH/8-1);
      Mem_DQ_PARITY_O_int : in  std_logic_vector(0 to C_MAX_MEM_WIDTH/8-1);
      Mem_DQ_PARITY_T_int : in  std_logic_vector(0 to C_MAX_MEM_WIDTH/8-1);

      Mem_CEN_int         : in  std_logic_vector(0 to C_NUM_BANKS_MEM-1);
      Mem_OEN_int         : in  std_logic_vector(0 to C_NUM_BANKS_MEM-1);
      Mem_WEN_int         : in  std_logic;
      Mem_QWEN_int        : in  std_logic_vector(0 to C_MAX_MEM_WIDTH/8-1);
      Mem_BEN_int         : in  std_logic_vector(0 to C_MAX_MEM_WIDTH/8-1);
      Mem_RPN_int         : in  std_logic;
      Mem_CE_int          : in  std_logic_vector(0 to C_NUM_BANKS_MEM-1);
      Mem_ADV_LDN_int     : in  std_logic;
      Mem_LBON_int        : in  std_logic;
      Mem_CKEN_int        : in  std_logic;
      Mem_RNW_int         : in  std_logic;

      Mem_Addr_rst        : in  std_logic;

      -- Memory signals
      Mem_A               : out std_logic_vector(0 to C_IPIF_AWIDTH-1);
      Mem_DQ_I            : in  std_logic_vector(0 to C_MAX_MEM_WIDTH-1);
      Mem_DQ_O            : out std_logic_vector(0 to C_MAX_MEM_WIDTH-1);
      Mem_DQ_T            : out std_logic_vector(0 to C_MAX_MEM_WIDTH-1);

      Mem_DQ_PRTY_I       : in  std_logic_vector(0 to C_MAX_MEM_WIDTH/8-1);
      Mem_DQ_PRTY_O       : out std_logic_vector(0 to C_MAX_MEM_WIDTH/8-1);
      Mem_DQ_PRTY_T       : out std_logic_vector(0 to C_MAX_MEM_WIDTH/8-1);

      Mem_CEN             : out std_logic_vector(0 to C_NUM_BANKS_MEM-1);
      Mem_OEN             : out std_logic_vector(0 to C_NUM_BANKS_MEM-1);
      Mem_WEN             : out std_logic;
      Mem_QWEN            : out std_logic_vector(0 to C_MAX_MEM_WIDTH/8-1);
      Mem_BEN             : out std_logic_vector(0 to C_MAX_MEM_WIDTH/8-1);
      Mem_RPN             : out std_logic;
      Mem_CE              : out std_logic_vector(0 to C_NUM_BANKS_MEM-1);
      Mem_ADV_LDN         : out std_logic;
      Mem_LBON            : out std_logic;
      Mem_CKEN            : out std_logic;
      Mem_RNW             : out std_logic;

      Linear_flash_brst_rd_flag : in  std_logic;
      -- Clock & Reset
      Clk                 : in  std_logic;
      RdClk               : in  std_logic;
      Rst                 : in  std_logic
    );
end entity io_registers;

-------------------------------------------------------------------------------
-- Architecture section
-------------------------------------------------------------------------------

architecture imp of io_registers is

----------------------------------------------------------------------------------
-- below attributes are added to reduce the synth warnings in Vivado tool
attribute DowngradeIPIdentifiedWarnings: string;
attribute DowngradeIPIdentifiedWarnings of imp : architecture is "yes";
----------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Constant declarations
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Signal declarations
-------------------------------------------------------------------------------
signal mem_a_reg            : std_logic_vector(0 to C_IPIF_AWIDTH-1);
--signal mem_a_reg1            : std_logic_vector(0 to C_IPIF_AWIDTH-1);
signal mem_dq_o_reg         : std_logic_vector(0 to C_MAX_MEM_WIDTH-1);
signal mem_dq_t_reg         : std_logic_vector(0 to C_MAX_MEM_WIDTH-1);
signal mem_dq_paity_o_reg   : std_logic_vector(0 to C_MAX_MEM_WIDTH/8-1);
signal mem_dq_paity_t_reg   : std_logic_vector(0 to C_MAX_MEM_WIDTH/8-1);
signal mem_cen_reg          : std_logic_vector(0 to C_NUM_BANKS_MEM-1);
signal mem_oen_reg          : std_logic_vector(0 to C_NUM_BANKS_MEM-1);
signal mem_wen_reg          : std_logic;
signal mem_qwen_reg         : std_logic_vector(0 to C_MAX_MEM_WIDTH/8-1);
signal mem_ben_reg          : std_logic_vector(0 to C_MAX_MEM_WIDTH/8-1);
signal mem_rpn_reg          : std_logic;
signal mem_ce_reg           : std_logic_vector(0 to C_NUM_BANKS_MEM-1);
signal mem_adv_ldn_reg      : std_logic;
signal mem_lbon_reg         : std_logic;
signal mem_cken_reg         : std_logic;
signal mem_rnw_reg          : std_logic;

signal rd_data_ack          : std_logic;
signal rd_data_ack_int      : std_logic;
signal one_hot_rd_data_d1   : std_logic;
signal one_hot_rd_data_d2   : std_logic;
signal Mem_DQ_I_v           : std_logic_vector(0 to C_MAX_MEM_WIDTH-1);
signal Mem_DQ_I_v1          : std_logic_vector(0 to C_MAX_MEM_WIDTH-1);
signal Mem_DQ_PARITY_I_io   :  std_logic_vector(0 to C_MAX_MEM_WIDTH/8-1);
-------------------------------------------------------------------------------
-- Component declarations
-------------------------------------------------------------------------------
attribute KEEP                         : string;
attribute KEEP of mem_wen_reg          : signal is "true";
attribute IOB                          : string;
--attribute IOB of Mem_DQ_I_v            : signal is "true";
attribute IOB of Mem_DQ_PARITY_I_io    : signal is "true";
--attribute IOB of mem_dq_o_reg          : signal is "true";
--attribute IOB of mem_dq_t_reg          : signal is "true";
attribute IOB of mem_dq_paity_o_reg    : signal is "true";
--attribute IOB of mem_dq_paity_t_reg    : signal is "true";
attribute IOB of mem_ce_reg            : signal is "true";
--attribute IOB of mem_cen_reg           : signal is "true";
attribute IOB of mem_oen_reg           : signal is "true";
attribute IOB of mem_ben_reg           : signal is "true";
attribute IOB of mem_qwen_reg          : signal is "true";
attribute IOB of mem_rpn_reg           : signal is "true";
attribute IOB of mem_rnw_reg           : signal is "true";
attribute IOB of mem_wen_reg           : signal is "true";
--Ports tied to zero
attribute IOB of mem_adv_ldn_reg       : signal is "true";
attribute IOB of mem_lbon_reg          : signal is "true";
attribute IOB of mem_cken_reg          : signal is "true";
-------------------------------------------------------------------------------
-- Begin architecture
-------------------------------------------------------------------------------

begin
-------------------------------------------------------------------------------
-- OUTPUTS
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Instantiate the positive clock edge output register.
-- This is always present due to combinational logic on the memory control
-- signals.
-------------------------------------------------------------------------------

POSEDGE_OUTPUTREGS_PROCESS: process(Clk)
begin
    if Clk'event and Clk = '1' then
        if Rst = '1' then
            mem_dq_o_reg         <= (others => '0');
            mem_dq_t_reg         <= (others => '1');
            mem_dq_paity_o_reg   <= (others => '0');
            mem_dq_paity_t_reg   <= (others => '1');
            mem_cen_reg          <= (others => '1');
            mem_oen_reg          <= (others => '1');
            mem_wen_reg          <= '1';
            mem_qwen_reg         <= (others => '1');
            mem_ben_reg          <= (others => '1');
            mem_rpn_reg          <= '0';
            mem_ce_reg           <= (others => '0');
            mem_adv_ldn_reg      <= '0';
            mem_lbon_reg         <= '0';
            mem_cken_reg         <= '0';
            mem_rnw_reg          <= '0';
        else
            mem_dq_o_reg         <= Mem_DQ_O_int;
            mem_dq_t_reg         <= Mem_DQ_T_int;
            mem_dq_paity_o_reg   <= Mem_DQ_PARITY_O_int;
            mem_dq_paity_t_reg   <= Mem_DQ_PARITY_T_int;
            mem_cen_reg          <= Mem_CEN_int;
            mem_oen_reg          <= Mem_OEN_int;
            mem_wen_reg          <= Mem_WEN_int;
            mem_qwen_reg         <= Mem_QWEN_int;
            mem_ben_reg          <= Mem_BEN_int;
            mem_rpn_reg          <= Mem_RPN_int;
            mem_ce_reg           <= Mem_CE_int;
            mem_adv_ldn_reg      <= Mem_ADV_LDN_int;
            mem_lbon_reg         <= Mem_LBON_int;
            mem_cken_reg         <= Mem_CKEN_int;
            mem_rnw_reg          <= Mem_RNW_int;
        end if;
    end if;
end process POSEDGE_OUTPUTREGS_PROCESS;

-------------------------------------------------------------------------------
-- MEM_ADDR_PROCESS: This process is added to fix CR: 214725
--
-------------------------------------------------------------------------------
--MEM_ADDR_PROCESS: process(clk)
--begin
--    if Clk'event and Clk = '1' then
--        if (Mem_Addr_rst = '1') then
--            mem_a_reg <= (others => '0');
--	    --mem_a_reg1	 <= (others => '0');
--        else
--            mem_a_reg <= Mem_A_int;
--	    --mem_a_reg <= mem_a_reg1 ;
--        end if;
--    end if;
--end process MEM_ADDR_PROCESS;
mem_a_reg <= (others => '0') when (Mem_Addr_rst = '1') else Mem_A_int;
-------------------------------------------------------------------------------
-- Instantiate the negative clock edge output register if design has been
-- configured to do so.
-------------------------------------------------------------------------------

NEGEDGE_OUTPUT_REGS_GEN: if C_INCLUDE_NEGEDGE_IOREGS = 1 generate
begin
    NEGEDGE_OUTPUTREGS_PROCESS: process(Clk)
    begin
        if Clk'event and Clk = '0' then
            if Rst = '1' then
                Mem_A            <= (others => '0');
                Mem_DQ_O         <= (others => '0');
                Mem_DQ_T         <= (others => '1');
                Mem_DQ_PRTY_O    <= (others => '0');
                Mem_DQ_PRTY_T    <= (others => '1');
                Mem_CEN          <= (others => '1');
                Mem_OEN          <= (others => '1');
                Mem_WEN          <= '1';
                Mem_QWEN         <= (others => '1');
                Mem_BEN          <= (others => '1');
                Mem_RPN          <= '0';
                Mem_CE           <= (others => '0');
                Mem_ADV_LDN      <= '0';
                Mem_LBON         <= '0';
                Mem_CKEN         <= '0';
                Mem_RNW          <= '0';
	     else
		Mem_A            <= mem_a_reg;
                Mem_DQ_O         <= mem_dq_o_reg;
                Mem_DQ_T         <= mem_dq_t_reg;
                Mem_DQ_PRTY_O    <= mem_dq_paity_o_reg;
                Mem_DQ_PRTY_T    <= mem_dq_paity_t_reg;

                Mem_CEN          <= mem_cen_reg;
                Mem_OEN          <= mem_oen_reg;
                Mem_WEN          <= mem_wen_reg;
                Mem_QWEN         <= mem_qwen_reg;
                Mem_BEN          <= mem_ben_reg;
                Mem_RPN          <= mem_rpn_reg;
                Mem_CE           <= mem_ce_reg;
                Mem_ADV_LDN      <= mem_adv_ldn_reg;
                Mem_LBON         <= mem_lbon_reg;
                Mem_CKEN         <= mem_cken_reg;
                Mem_RNW          <= mem_rnw_reg;
            end if;
        end if;
    end process NEGEDGE_OUTPUTREGS_PROCESS;
end generate NEGEDGE_OUTPUT_REGS_GEN;

-------------------------------------------------------------------------------
-- Pass the values through if there are no negative io registers
-------------------------------------------------------------------------------
NO_NEGEDGE_OUTPUT_REGS_GEN: if C_INCLUDE_NEGEDGE_IOREGS = 0 generate
begin
    Mem_A           <= mem_a_reg;
    Mem_DQ_O        <= mem_dq_o_reg;
    Mem_DQ_T        <= mem_dq_t_reg;
    Mem_DQ_PRTY_O   <= mem_dq_paity_o_reg;
    Mem_DQ_PRTY_T   <= mem_dq_paity_t_reg;
    Mem_CEN         <= mem_cen_reg;
    Mem_OEN         <= mem_oen_reg;
    Mem_WEN         <= mem_wen_reg;
    Mem_QWEN        <= mem_qwen_reg;
    Mem_BEN         <= mem_ben_reg;
    Mem_RPN         <= mem_rpn_reg;
    Mem_CE          <= mem_ce_reg;
    Mem_ADV_LDN     <= mem_adv_ldn_reg;
    Mem_LBON        <= mem_lbon_reg;
    Mem_CKEN        <= mem_cken_reg;
    Mem_RNW         <= mem_rnw_reg;
end generate NO_NEGEDGE_OUTPUT_REGS_GEN;

  -------------------------------------------------------------------------------
  -- Registers the input memory data port signals.
  -------------------------------------------------------------------------------
  INPUTREGS_PROCESS: process(RdClk)
  begin
      if RdClk'event and RdClk = '1' then
          if Rst = '1' then
              Mem_DQ_I_v          <= (others => '0');
              Mem_DQ_I_v1         <= (others => '0');
              Mem_DQ_PARITY_I_io  <= (others => '0');
          else
              Mem_DQ_I_v          <= Mem_DQ_I;
              Mem_DQ_I_v1         <= Mem_DQ_I_v;
              Mem_DQ_PARITY_I_io  <= Mem_DQ_PRTY_I;
          end if;
      end if;
  end process INPUTREGS_PROCESS;

  Mem_DQ_I_int <= Mem_DQ_I_v1 when (Linear_flash_brst_rd_flag = '1') else Mem_DQ_I_v;
  Mem_DQ_PARITY_I_int <= Mem_DQ_PARITY_I_io;
end architecture imp;
-------------------------------------------------------------------------------
-- End of File io_registers.vhd.
-------------------------------------------------------------------------------


-------------------------------------------------------------------
-- (c) Copyright 1984 - 2013 Xilinx, Inc. All rights reserved.
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
-------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Filename:        counters.vhd
-- Description:     This file contains the counters for timing read/write
--                  timing parameters.
--
-- VHDL-Standard:   VHDL'93
-------------------------------------------------------------------------------
-- Structure:
--                  emc.vhd
--                      -- ipic_if.vhd
--                      -- addr_counter_mux.vhd
--                      -- counters.vhd
--                      -- select_param.vhd
--                      -- mem_state_machine.vhd
--                      -- mem_steer.vhd
--                      -- io_registers.vhd
-------------------------------------------------------------------------------
-- Author:          NSK
-- History:
-- NSK             02/01/08    First Version
-- ^^^^^^^^^^
-- This file is same as in version v3_01_c - no change in the logic of this
-- module. Deleted the history from version v3_01_c.
-- ~~~~~~
-- NSK         05/08/08    version v3_00_a
-- ^^^^^^^^
-- 1. This file is same as in version v3_02_a.
-- 2. Upgraded to version v3.00.a to have proper versioning to fix CR #472164.
-- 3. No change in design.
-- ~~~~~~~~
-- ^^^^^^^^
-- KSB         08/08/08    version v4_00_a
-- 1. Added TPACC counter
-- ~~~~~~~~
-- SK          02/11/10    version v5_01_a
-- ^^^^^^^^
-- 1. Registered the IP2Bus_RdAck and IP2Bus_Data signals.
-- 2. Reduced utilization
-- ~~~~~~~~
-- SK          02/11/11    version v5_02_a
-- ^^^^^^^^
-- 1. Fixed CR#595758 and CR#606038
-- ~~~~~~~~
-- ~~~~~~
--  Sateesh 2011
-- ^^^^^^
--  -- Added Sync burst support for the Numonyx flash during read
-- ~~~~~~
-- ~~~~~~
--  SK 10/20/12
-- ^^^^^^
--  -- Fixed CR 672770 - BRESP signal is driven X during netlist simulation
--  -- Fixed CR 673491 - Flash transactions generates extra read cycle after the actual reads are over
-- ~~~~~~
-------------------------------------------------------------------------------
-- Naming Conventions:
--      active low signals:                     "*_n"
--      clock signals:                          "clk", "clk_div#", "clk_#x"
--      reset signals:                          "rst", "rst_n"
--      generics:                               "C_*"
--      user defined types:                     "*_TYPE"
--      state machine next state:               "*_ns"
--      state machine current state:            "*_cs"
--      combinatorial signals:                  "*_com"
--      pipelined or register delay signals:    "*_d#"
--      counter signals:                        "*cnt*"
--      clock enable signals:                   "*_ce"
--      internal version of output port         "*_i"
--      device pins:                            "*_pin"
--      ports:                                  - Names begin with Uppercase
--      processes:                              "*_PROCESS"
--      component instantiations:               "<ENTITY_>I_<#|FUNC>
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library emc_common_v3_0_5;
-------------------------------------------------------------------------------
-- Definition of Generics:
--
-- Definition of Ports:
-- Inputs
--      Synch_mem               -- Synchronous Memory Flag
--      Twr_data                -- Write cycle counter data
--      Twr_load                -- Write cycle counter load
--      Twr_cnt_en              -- Write cycle count enable
--      Tlz_data                -- Write End to Low-Z counter data
--      Tlz_load                -- Write End to Low-Z counter load
--      Trd_data                -- Read cycle counter data
--      Trd_load                -- Read cycle counter load
--      Trd_cnt_en              -- Read cycle count enable
--      Thz_data                -- Read End to High-Z counter data
--      Thz_load                -- Read End to High-Z counter load
--
-- Outputs
--      Twr_end                 -- Write cycle count complete
--      Tlz_end                 -- Write Recover count complete
--      Trd_end                 -- Read cycle count complete
--      Thz_end                 -- Read Recover count complete
--
-- Clock and reset
--      Clk                     -- System Clock
--      Rst                     -- System Reset
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Entity section
-------------------------------------------------------------------------------

entity counters is
    port (
        Synch_mem               : in  std_logic;

        Twr_data                : in  std_logic_vector(0 to 4);
        Twr_load                : in  std_logic;
        Twr_cnt_en              : in  std_logic;

        Twph_data               : in  std_logic_vector(0 to 4);
        Twph_load               : in  std_logic;
        Twph_cnt_en             : in  std_logic;

        Tlz_data                : in  std_logic_vector(0 to 4);
        Tlz_load                : in  std_logic;

        Trd_data                : in  std_logic_vector(0 to 4);
        Trd_load                : in  std_logic;
        Trd_cnt_en              : in  std_logic;

        Thz_data                : in  std_logic_vector(0 to 4);
        Thz_load                : in  std_logic;


        Tpacc_data              : in  std_logic_vector(0 to 4);
        Tpacc_load              : in  std_logic;
        Tpacc_cnt_en            : in  std_logic;


        Twr_end                 : out std_logic;
        Tlz_end                 : out std_logic;
        Twph_end                : out std_logic;
        Trd_end                 : out std_logic;
        Thz_end                 : out std_logic;

        Tpacc_end               : out std_logic;
	--
	Twr_rec_data  		: in std_logic_vector(0 to 15);
	Twr_rec_load  		: in std_logic;
	Twr_rec_cnt_en		: in std_logic;
	Twr_rec_end   		: out std_logic;
	--
        Clk                     : in  std_logic;
        Rst                     : in  std_logic
    );
end entity counters;

-------------------------------------------------------------------------------
-- Architecture section
-------------------------------------------------------------------------------

architecture imp of counters is
-------------------------------------------------------------------------------
----------------------------------------------------------------------------------
-- below attributes are added to reduce the synth warnings in Vivado tool
attribute DowngradeIPIdentifiedWarnings: string;
attribute DowngradeIPIdentifiedWarnings of imp : architecture is "yes";
----------------------------------------------------------------------------------

----------------------------------------------------------------------------------
-- Constant declarations
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Assigning zero values
-------------------------------------------------------------------------------
constant ZERO_TWRCNT    : std_logic_vector(0 to 4) := (others => '0');
constant ZERO_TWPHCNT   : std_logic_vector(0 to 4) := (others => '0');
constant ZERO_TLZCNT    : std_logic_vector(0 to 4) := (others => '0');
constant ZERO_TRDCNT    : std_logic_vector(0 to 4) := (others => '0');
constant ZERO_TPACCCNT  : std_logic_vector(0 to 4) := (others => '0');
constant ZERO_THZCNT    : std_logic_vector(0 to 4) := (others => '0');
constant ZERO_TWR_REC_CNT : std_logic_vector(0 to 9) := (others => '0');

-------------------------------------------------------------------------------
-- Signal declarations
-------------------------------------------------------------------------------
signal twr_cnt          : std_logic_vector(0 to 4);
signal twph_cnt         : std_logic_vector(0 to 4);
signal tlz_cnt          : std_logic_vector(0 to 4);
signal trd_cnt          : std_logic_vector(0 to 4);
signal thz_cnt          : std_logic_vector(0 to 4);
signal tpacc_cnt        : std_logic_vector(0 to 4);
signal twr_rec_cnt      : std_logic_vector(0 to 15);--9/6/2011

signal thz_cnt_en       : std_logic;
signal tlz_cnt_en       : std_logic;
-------------------------------------------------------------------------------
-- Begin architecture
-------------------------------------------------------------------------------

begin

-------------------------------------------------------------------------------
-- Write Cycle Delay Counter
-------------------------------------------------------------------------------

TWRCNT_I: entity emc_common_v3_0_5.ld_arith_reg
    generic map (C_ADD_SUB_NOT  => false,
                 C_REG_WIDTH    => 5,
                 C_RESET_VALUE  => "11111",
                 C_LD_WIDTH     => 5,
                 C_LD_OFFSET    => 0,
                 C_AD_WIDTH     => 1,
                 C_AD_OFFSET    => 0
                )
    port map (   CK             => Clk,
                 RST            => Rst,
                 Q              => twr_cnt,
                 LD             => Twr_data,
                 AD             => "1",
                 LOAD           => Twr_load,
                 OP             => Twr_cnt_en
                 );

-------------------------------------------------------------------------------
-- Write Cycle High Time Counter
-------------------------------------------------------------------------------

TWPHCNT_I: entity emc_common_v3_0_5.ld_arith_reg
    generic map (C_ADD_SUB_NOT  => false,
                 C_REG_WIDTH    => 5,
                 C_RESET_VALUE  => ZERO_TWPHCNT,
                 C_LD_WIDTH     => 5,
                 C_LD_OFFSET    => 0,
                 C_AD_WIDTH     => 1,
                 C_AD_OFFSET    => 0
                )
    port map (   CK             => Clk,
                 RST            => Rst,
                 Q              => twph_cnt,
                 LD             => Twph_data,
                 AD             => "1",
                 LOAD           => Twph_load,
                 OP             => Twph_cnt_en
                 );



-------------------------------------------------------------------------------
-- Write End to Data Low Impedance Counter
-------------------------------------------------------------------------------
tlz_cnt_en <= '0' when tlz_cnt = ZERO_TLZCNT
         else '1';

TLZCNT_I: entity emc_common_v3_0_5.ld_arith_reg
    generic map (C_ADD_SUB_NOT  => false,
                 C_REG_WIDTH    => 5,
                 C_RESET_VALUE  => ZERO_TLZCNT,
                 C_LD_WIDTH     => 5,
                 C_LD_OFFSET    => 0,
                 C_AD_WIDTH     => 1,
                 C_AD_OFFSET    => 0
                )
    port map (   CK             => Clk,
                 RST            => Rst,
                 Q              => tlz_cnt,
                 LD             => Tlz_data,
                 AD             => "1",
                 LOAD           => Tlz_load,
                 OP             => tlz_cnt_en
                 );

-------------------------------------------------------------------------------
-- Read Cycle Delay Counter
-------------------------------------------------------------------------------
TRDCNT_I: entity emc_common_v3_0_5.ld_arith_reg
    generic map (C_ADD_SUB_NOT  => false,
                 C_REG_WIDTH    => 5,
                 C_RESET_VALUE  => "11111",
                 C_LD_WIDTH     => 5,
                 C_LD_OFFSET    => 0,
                 C_AD_WIDTH     => 1,
                 C_AD_OFFSET    => 0
                )
    port map (   CK             => Clk,
                 RST            => Rst,
                 Q              => trd_cnt,
                 LD             => Trd_data,
                 AD             => "1",
                 LOAD           => Trd_load,
                 OP             => Trd_cnt_en
                 );

-------------------------------------------------------------------------------
-- Page Read Cycle Delay Counter
-------------------------------------------------------------------------------
TPACCCNT_I: entity emc_common_v3_0_5.ld_arith_reg
    generic map (C_ADD_SUB_NOT  => false,
                 C_REG_WIDTH    => 5,
                 C_RESET_VALUE  => "11111",
                 C_LD_WIDTH     => 5,
                 C_LD_OFFSET    => 0,
                 C_AD_WIDTH     => 1,
                 C_AD_OFFSET    => 0
                )
    port map (   CK             => Clk,
                 RST            => Rst,
                 Q              => tpacc_cnt,
                 LD             => Tpacc_data,
                 AD             => "1",
                 LOAD           => Tpacc_load,
                 OP             => Tpacc_cnt_en
                 );

-------------------------------------------------------------------------------
-- Page Read Cycle Delay Counter
-------------------------------------------------------------------------------
T_WRREC_CNT_I: entity emc_common_v3_0_5.ld_arith_reg
    generic map (C_ADD_SUB_NOT  => false,
                 C_REG_WIDTH    => 16,
                 C_RESET_VALUE  => "1111111111111111",
                 C_LD_WIDTH     => 16,
                 C_LD_OFFSET    => 0,
                 C_AD_WIDTH     => 1,
                 C_AD_OFFSET    => 0
                )
    port map (   CK             => Clk,
                 RST            => Rst,
                 Q              => twr_rec_cnt,
                 LD             => Twr_rec_data,
                 AD             => "1",
                 LOAD           => Twr_rec_load,
                 OP             => Twr_rec_cnt_en
                 );


-------------------------------------------------------------------------------
-- Read End to High Impedance Delay Counter
-------------------------------------------------------------------------------
thz_cnt_en <= '0' when thz_cnt = ZERO_THZCNT else
              '1';

THZCNT_I: entity emc_common_v3_0_5.ld_arith_reg
    generic map (C_ADD_SUB_NOT  => false,
                 C_REG_WIDTH    => 5,
                 C_RESET_VALUE  => ZERO_THZCNT,
                 C_LD_WIDTH     => 5,
                 C_LD_OFFSET    => 0,
                 C_AD_WIDTH     => 1,
                 C_AD_OFFSET    => 0
                )
    port map (   CK             => Clk,
                 RST            => Rst,
                 Q              => thz_cnt,
                 LD             => Thz_data,
                 AD             => "1",
                 LOAD           => Thz_load,
                 OP             => thz_cnt_en
                 );


-------------------------------------------------------------------------------
-- Generation of Counter End Signals
-------------------------------------------------------------------------------

Twr_end  <= '1' when twr_cnt = ZERO_TWRCNT or Synch_mem = '1' else
           '0' ;

Twph_end <= '1' when twph_cnt = ZERO_TWPHCNT or Synch_mem = '1' else
           '0' ;

Tlz_end  <= '1' when tlz_cnt = ZERO_TLZCNT or Synch_mem = '1' else
           '0' ;

Trd_end  <= '1' when trd_cnt = ZERO_TRDCNT or Synch_mem = '1' else
           '0' ;

thz_end  <= '1' when thz_cnt = ZERO_THZCNT or Synch_mem = '1' else
           '0' ;

Tpacc_end <= '1' when tpacc_cnt = ZERO_TPACCCNT or Synch_mem = '1' else
           '0' ;

Twr_rec_end <= '1' when twr_rec_cnt = ZERO_TWR_REC_CNT  or Synch_mem = '1' else
           '0' ; -- 9/6/2011
end imp;
-------------------------------------------------------------------------------
-- End of File counters.vhd
-------------------------------------------------------------------------------


-------------------------------------------------------------------
-- (c) Copyright 1984 - 2013 Xilinx, Inc. All rights reserved.
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
-------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Filename:        mem_state_machine.vhd
-- Description:     State machine controller for memory reads and writes
--
-- VHDL-Standard:   VHDL'93
-------------------------------------------------------------------------------
-- Structure:
--                  emc.vhd
--                      -- ipic_if.vhd
--                      -- addr_counter_mux.vhd
--                      -- counters.vhd
--                      -- select_param.vhd
--                      -- mem_state_machine.vhd
--                      -- mem_steer.vhd
--                      -- io_registers.vhd
-------------------------------------------------------------------------------
-- Author:          NSK
-- History:
-- NSK             02/01/08    First Version
-- ^^^^^^^^^^
-- This file is same as in version v3_01_c - no change in the logic of this
-- module. Deleted the history from version v3_01_c.
-- ~~~~~~
-- NSK         05/08/08    version v3_00_a
-- ^^^^^^^^
-- 1. This file is same as in version v3_02_a.
-- 2. Upgraded to version v3.00.a to have proper versioning to fix CR #472164.
-- 3. No change in design.
--
-- KSB         05/08/08    version v4_00_a
-- ^^^^^^^^
-- 1. Modified for Page mdoe read
-- 2. Modified for 64 Bit memory address align
-- ~~~~~~~~
-- KSB         22/05/10    version v5_00_a
-- 1. Modified for AXI EMC, PSRAM, Byte parity Memory Support
-- 2. Modified for AXI Slave burst interface
-- ~~~~~~~~
-- SK          02/11/10    version v5_01_a
-- ^^^^^^^^
-- 1. Removed "elsif Bus2IP_Mem_CS = '1' and ..." and "WAIT_TEMP" from WRITE state.
-- 2. Added write_req_ack_cmb  <= '1';
--    in WAIT_TEMP with (Synch_mem = '0' and single_trans = '0') condition
-- ~~~~~~~~
-- SK          24/11/10
-- ^^^^^^^^
-- 1. Added "ns_idle" signal to reset the address counter in mem_steer.vhd
-- ~~~~~~~~
-- ~~~~~~
--  Sateesh 2011
-- ^^^^^^
--  -- Added Sync burst support for the Numonyx flash during read
-- ~~~~~~
-- ~~~~~~
--  SK 10/20/12
-- ^^^^^^
--  -- Fixed CR 672770 - BRESP signal is driven X during netlist simulation
--  -- Fixed CR 673491 - Flash transactions generates extra read cycle after the actual reads are over
-- ~~~~~~
-------------------------------------------------------------------------------
-- Naming Conventions:
--      active low signals:                     "*_n"
--      clock signals:                          "clk", "clk_div#", "clk_#x"
--      reset signals:                          "rst", "rst_n"
--      generics:                               "C_*"
--      user defined types:                     "*_TYPE"
--      state machine next state:               "*_ns"
--      state machine current state:            "*_cs"
--      combinatorial signals:                  "*_cmb"
--      pipelined or register delay signals:    "*_d#"
--      counter signals:                        "*cnt*"
--      clock enable signals:                   "*_ce"
--      internal version of output port         "*_i"
--      device pins:                            "*_pin"
--      ports:                                  - Names begin with Uppercase
--      processes:                              "*_PROCESS"
--      component instantiations:               "<ENTITY_>I_<#|FUNC>
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-------------------------------------------------------------------------------
-- vcomponents package of the unisim library is used for the FDR component
-- declaration
-------------------------------------------------------------------------------

library unisim;
use unisim.vcomponents.all;

-------------------------------------------------------------------------------
-- Definition of Generics:
--
-- Definition of Ports:
-- The signal list is aligned as per the port list in entity
-------------------------------------------------------------------------------
--      Bus2IP_RNW                  -- Processor read/write transfer control
--      Bus2IP_RdReq                -- Processor Read Request
--      Bus2IP_WrReq                -- Processor Write Request
--      Synch_mem                   -- Current transaction is for synchronous
--                                     memory
--      Two_pipe_delay              -- Two pipe delay for synchronous memory
--      Cycle_End                   -- Current Cycle Complete

--      Read_data_en                -- Enable for read data registers
--      Read_ack                    -- Read cycle data acknowledge
--
--      Address_strobe              -- Address strobe signal
--      Data_strobe                 -- Data and BEs strobe signal

--      CS_Strobe                   -- Chip select strobe signal to store the
--                                  -- status of Bus2IP_CS

--      Addr_cnt_ce                 -- Address counter count enable
--      Addr_cnt_rst                -- Address counter reset
--      Cycle_cnt_ld                -- Cycle end counter count load
--      Cycle_cnt_en                -- Cycle end counter count enable
--
--      Trd_cnt_en                  -- Read Cycle Count Enable
--      Twr_cnt_en                  -- Write Cycle Count Enable
--      Trd_load                    -- Read Cycle Timer Load
--      Twr_load                    -- Write Cycle Timer Load
--      Thz_load                    -- Read Recovery to Write Timer Load
--      Tlz_load                    -- Write Recovery to Read Timer Load
--      Trd_end                     -- Read Cycle Complete
--      Twr_end                     -- Write Cycle Complete
--      Thz_end                     -- Read Recovery Complete
--      Tlz_end                     -- Write Recovery Complete
--      Tpacc_end                   -- page access read end
--
--      Mem_CEN_cmb                 -- Memory Chip Enable
--      Mem_OEN_cmb                 -- Memory Output Enable
--      Mem_WEN_cmb                 -- Memory Write Enable
--
--      Write_req_ack               -- Write address acknowledge
--      Read_req_ack                -- Read address acknowledge
--      Transaction_done            -- Operation complete indication for
--                                  -- current transaction
--      Mem_Addr_rst                -- Memory address bus reset
--
--      Clk                         -- System Clock
--      Rst                         -- System Read
-----------------------------------------------------------------------------

-----------------------------------------------------------------------------
-- Entity section
-----------------------------------------------------------------------------

entity mem_state_machine is
    port (
        Clk                 : in  std_logic;
        Rst                 : in  std_logic;

        Bus2IP_RNW          : in  std_logic;
        Bus2IP_RdReq        : in  std_logic;
        Bus2IP_WrReq        : in  std_logic;
        Synch_mem           : in  std_logic;
        Two_pipe_delay      : in  std_logic;
        Cycle_End           : in  std_logic;
        Bus2IP_Mem_CS       : in  std_logic;
        Bus2IP_Burst        : in  std_logic;
        Read_data_en        : out std_logic;
        Read_ack            : out std_logic;

        Address_strobe      : out std_logic;
        Data_strobe         : out std_logic;
        CS_Strobe           : out std_logic;

        Addr_cnt_ce         : out std_logic;
        Addr_cnt_rst        : out std_logic;
        Cycle_cnt_ld        : out std_logic;
        Cycle_cnt_en        : out std_logic;

        Trd_cnt_en          : out std_logic;
        Twr_cnt_en          : out std_logic;
        Twph_cnt_en         : out std_logic;
        Tpacc_cnt_en        : out std_logic;
        Trd_load            : out std_logic;
        Twr_load            : out std_logic;
        Twph_load           : out std_logic;
        Tpacc_load          : out std_logic;
        Thz_load            : out std_logic;
        Tlz_load            : out std_logic;
        Trd_end             : in  std_logic;
        Twr_end             : in  std_logic;
        Twph_end            : in  std_logic;
        Thz_end             : in  std_logic;
        Tlz_end             : in  std_logic;
        Tpacc_end           : in  std_logic;

        New_page_access     : in  std_logic;
        Linear_flash_brst_rd_flag : in std_logic;
        Linear_flash_rd_data_ack  : in std_logic;
        Bus2IP_RdReq_emc : in std_logic;

        MSM_Mem_CEN         : out std_logic;
        MSM_Mem_OEN         : out std_logic;
        MSM_Mem_WEN         : out std_logic;
        MSM_Mem_RNW         : out std_logic;
        CS_Strobe_par_addr  : out std_logic;

        Write_req_ack       : out std_logic;
        Read_req_ack        : out std_logic;
        Transaction_done    : out std_logic;
        single_trans        : in  std_logic;

        Mem_Addr_rst        : out std_logic;
        Addr_align          : in  std_logic;
        Addr_align_rd       : out std_logic;

        original_wrce       : in std_logic;
        last_burst_cnt      : in std_logic;

        Write_req_data_ack  : out std_logic;
        Write_req_addr_ack  : out std_logic;

        address_strobe_c    : out std_logic;
        be_strobe_c         : out std_logic;
        data_strobe_c       : out std_logic;
        ns_idle             : out std_logic;
        pr_idle             : out std_logic; -- 11-12-2012
        pr_state_wait_temp_cmb : out std_logic;

        Twr_rec_load        : out std_logic;
        Twr_rec_cnt_en      : out std_logic;
        Twr_rec_end         : in std_logic;
        Flash_mem_access    : in std_logic;
        Flash_mem_access_disable : out std_logic;
        Mem_WAIT: in std_logic;
        Adv_L_N : out std_logic := '1';
        last_addr1 : in std_logic;
        stop_oen : in std_logic;
        axi_wvalid : in std_logic;
        axi_wlast : in std_logic;
        bus2ip_ben_all_1 : in std_logic
    );
end entity mem_state_machine;

-------------------------------------------------------------------------------
-- Architecture section
-------------------------------------------------------------------------------

architecture imp of mem_state_machine is

----------------------------------------------------------------------------------
-- below attributes are added to reduce the synth warnings in Vivado tool
attribute DowngradeIPIdentifiedWarnings: string;
attribute DowngradeIPIdentifiedWarnings of imp : architecture is "yes";
----------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Signal Declarations
-------------------------------------------------------------------------------

type MEM_SM_TYPE is (IDLE,
                     WRITE,
                     ADDRESS_SET,
                     DEASSERT_CEN,
                     ADDRESS_RSET,
                     DEASSERT_RCEN,
                     DASSERT_WEN,
                     WAIT_WRITE_ACK,
                     WRITE_WAIT,
                     WAIT_TEMP,
                     WR_REC_PERIOD, -- 9/6/2011
                     ASSERT_CEN,
                     READ,
                     LINEAR_FLASH_SYNC_RD,
                     PAGE_READ,
                     DEASSERT_OEN,
                     WAIT_RDDATA_ACK 
                     );

signal crnt_state               : MEM_SM_TYPE := IDLE;
signal next_state               : MEM_SM_TYPE;

--signal write_req_ack_cmb        : std_logic;
signal read_req_ack_cmb         : std_logic;
signal read_data_en_cmb         : std_logic;
signal read_data_en_reg         : std_logic;

signal read_ack_cmb             : std_logic;
signal read_ack_reg             : std_logic;

signal addr_cnt_ce_cmb          : std_logic;
signal addr_cnt_rst_cmb         : std_logic;
signal addr_cnt_ce_reg          : std_logic;
signal addr_cnt_rst_reg         : std_logic;


signal addressData_strobe_cmb   : std_logic;
signal cs_strobe_cmb            : std_logic;
signal cs_strobe_reg            : std_logic;
signal cycle_cnt_ld_cmb         : std_logic;
signal cycle_cnt_en_cmb         : std_logic;

signal trd_cnt_en_cmb           : std_logic;
signal twr_cnt_en_cmb           : std_logic;
signal twph_cnt_en_cmb          : std_logic;
signal tpacc_cnt_en_cmb         : std_logic;

signal trd_load_cmb             : std_logic;
signal twr_load_cmb             : std_logic;
signal twph_load_cmb            : std_logic;
signal thz_load_cmb             : std_logic;
signal tlz_load_cmb             : std_logic;
signal tpacc_load_cmb           : std_logic;

signal new_page                 : std_logic;
signal new_page_d1              : std_logic;


signal mem_cen_cmb              : std_logic;
signal mem_oen_cmb              : std_logic;
signal mem_wen_cmb              : std_logic;
signal mem_rnw_cmb              : std_logic;
signal mem_cen_reg              : std_logic;
signal mem_oen_reg              : std_logic;
signal mem_wen_reg              : std_logic;

signal read_complete_cmb        : std_logic;
signal read_complete_d          : std_logic_vector(0 to 7);
signal read_complete            : std_logic;

signal mem_Addr_rst_cmb         : std_logic;

signal transaction_done_cmb     : std_logic;
signal transaction_done_reg     : std_logic;
signal transaction_complete_reg : std_logic;
signal read_break_reg_d1        : std_logic;

signal addr_align_reg           : std_logic;
signal addr_align_rd_d1         : std_logic;
signal Bus2IP_Mem_CS_d1         : std_logic;
signal Bus2IP_Mem_CS_d2         : std_logic;
signal Bus2IP_RdReq_d1          : std_logic;
signal Bus2IP_RdReq_d2          : std_logic;
signal read_break               : std_logic;
signal transaction_complete     : std_logic;
signal read_break_reg           : std_logic;
signal Load_address             : std_logic;

signal Write_req_data_ack_cmb : std_logic;
signal Write_req_addr_ack_cmb : std_logic;
signal address_strobe_cmb     : std_logic;
signal be_strobe_cmb          : std_logic;
signal data_strobe_cmb        : std_logic;

signal int_Flash_mem_access_en : std_logic;
signal int_Flash_mem_access_dis : std_logic;
signal wlast,wlast_reg : std_logic;
signal wvalid,wvalid_reg : std_logic;

attribute max_fanout                               : string;
attribute max_fanout   of read_req_ack_cmb         : signal is "30";
--attribute max_fanout   of write_req_ack_cmb        : signal is "30";
attribute max_fanout   of Write_req_data_ack_cmb   : signal is "30";
attribute max_fanout   of Write_req_addr_ack_cmb   : signal is "30";

signal twr_rec_cnt_en_cmb : std_logic;
signal twr_rec_load_cmb   : std_logic;
signal last_addr1_d1, last_addr1_d2, last_addr1_d3: std_logic; -- 09-12-2012
constant NEW_LOGIC: integer := 1;
-------------------------------------------------------------------------------
-- Begin architecture
-------------------------------------------------------------------------------

begin
ns_idle <= '1' when next_state=IDLE
           else
           '0';
pr_idle <= '1' when crnt_state=IDLE
           else
           '0';

--wlast <= '1' when axi_wlast = '1' else wlast;

pr_state_wait_temp_cmb <= '1' when (next_state = WAIT_TEMP)
                          else
                          '0';
Write_req_ack       <= '0';-- write_req_ack_cmb; --
Write_req_data_ack  <= Write_req_data_ack_cmb;
Write_req_addr_ack  <= Write_req_addr_ack_cmb;

Read_req_ack        <= read_req_ack_cmb;
Read_data_en        <= read_data_en_reg;
Read_ack            <= Read_ack_reg ;

Read_ack_cmb        <= (read_data_en_cmb and Cycle_End) or (Linear_flash_brst_rd_flag and Linear_flash_rd_data_ack);

Addr_cnt_ce         <= addr_cnt_ce_cmb;
Addr_cnt_rst        <= addr_cnt_rst_cmb;
Address_strobe      <= addressData_strobe_cmb;
CS_Strobe           <= cs_strobe_reg;
CS_Strobe_par_addr  <= Load_address and Bus2IP_RNW;

Cycle_cnt_ld        <= cycle_cnt_ld_cmb;
Cycle_cnt_en        <= cycle_cnt_en_cmb;

Trd_cnt_en          <= trd_cnt_en_cmb;
Tpacc_cnt_en        <= tpacc_cnt_en_cmb;
Twr_cnt_en          <= twr_cnt_en_cmb;
Twph_cnt_en         <= twph_cnt_en_cmb;
Twr_rec_cnt_en      <= Twr_rec_cnt_en_cmb;--9/6/2011

Trd_load            <= trd_load_cmb;
Tpacc_load          <= tpacc_load_cmb;
Twr_load            <= twr_load_cmb;
Twph_load           <= twph_load_cmb;
Thz_load            <= thz_load_cmb;
Tlz_load            <= tlz_load_cmb;
Twr_rec_load        <= Twr_rec_load_cmb;--9/6/2011

MSM_Mem_CEN         <= mem_cen_cmb;
MSM_Mem_OEN         <= mem_oen_cmb;
MSM_Mem_WEN         <= mem_wen_cmb;
MSM_Mem_RNW         <= mem_rnw_cmb;

Mem_Addr_rst        <= mem_Addr_rst_cmb;
Transaction_done    <= transaction_done_reg;


NEW_LOGIC_GEN: if NEW_LOGIC = 1 generate
-----
begin
-----
SM_COMB_PROCESS: process (
              crnt_state,
              Bus2IP_RdReq,
              Bus2IP_WrReq,
              Synch_mem,
              Cycle_End,
              Trd_end,
              Tpacc_end,
              Twr_end,
              Twph_end,
              Thz_end,
              Bus2IP_Mem_CS_d2,
              Bus2IP_Mem_CS_d1,
              read_break,
              transaction_complete,
              read_break_reg,
              Tlz_end,
              addr_align_rd_d1,
              new_page_d1,
              Addr_align,
              New_page_access,
              Bus2IP_Mem_CS,
              single_trans,
              new_page,
              read_complete,
              original_wrce,
              last_burst_cnt,
              transaction_complete_reg,
              read_break_reg_d1,
              Bus2IP_Burst,
              Twr_rec_end,
              Flash_mem_access,
              Linear_flash_brst_rd_flag,--8/18/2011
              Linear_flash_rd_data_ack,   --8/18/2011
              Mem_WAIT                ,   -- CR#662558
              Bus2IP_RdReq_emc        ,
              last_addr1              ,
              last_addr1_d1, -- 09-12-2012
              last_addr1_d2,  -- 09-12-2012
              last_addr1_d3, -- 09-12-2012
              stop_oen,
              bus2ip_ben_all_1,
              axi_wvalid,
              wlast_reg,
              wvalid_reg,
              wlast,
              wvalid,
              axi_wlast
              )

    begin

        next_state              <= crnt_state;
        mem_cen_cmb             <= '1';
        mem_oen_cmb             <= '1';
        mem_wen_cmb             <= '1';

        --write_req_ack_cmb       <= '0';09-12-2012
        Write_req_data_ack_cmb  <= '0';
        Write_req_addr_ack_cmb  <= '0';

        read_req_ack_cmb        <= '0';
        read_data_en_cmb        <= '0';
        addr_cnt_ce_cmb         <= '0';
        addr_cnt_rst_cmb        <= '0';

        --addressData_strobe_cmb  <= '0';09-12-2012   not used in the logic
        address_strobe_cmb      <= '0';
        be_strobe_cmb           <= '0';
        data_strobe_cmb         <= '0';

        cs_strobe_cmb           <= '0';
        cycle_cnt_ld_cmb        <= '0';
        cycle_cnt_en_cmb        <= '0';

        trd_cnt_en_cmb          <= '0';
        tpacc_cnt_en_cmb        <= '0';
        twr_cnt_en_cmb          <= '0';
        twph_cnt_en_cmb         <= '0';
        twr_rec_cnt_en_cmb      <= '0';-- 9/6/2011

        trd_load_cmb            <= '0';
        tpacc_load_cmb          <= '0'; -- '0'; -- 1/4/2013
        twr_load_cmb            <= '0';
        twph_load_cmb           <= '0';
        thz_load_cmb            <= '0';
        tlz_load_cmb            <= '0';
        twr_rec_load_cmb        <= '0'; -- 9/6/2011

        read_complete_cmb       <= '0';
        addr_align_reg          <= addr_align_rd_d1;
        new_page                <= new_page_d1;

        transaction_complete    <= transaction_complete_reg;
        read_break_reg          <= read_break_reg_d1;

        mem_Addr_rst_cmb        <= '0';
        transaction_done_cmb    <= '0';
        Flash_mem_access_disable <= '0';
        Adv_L_N                 <= '1';
        wlast                <= wlast_reg;
        wvalid               <= wvalid_reg;
        case crnt_state is

            -------------------------------------------------------------------
            -- IDLE STATE
            -- Waits in this state untill read and write transaction is
            -- initiated.
            -- Loads the counters.
            -- Generates appropriate gate signal (burst/single) which is used
            -- to let read transfer ack pass to the IPIF.
            -------------------------------------------------------------------

            when IDLE =>

                transaction_done_cmb    <= '1';

                --addressData_strobe_cmb  <= '1';
                address_strobe_cmb      <= '1';
                be_strobe_cmb           <= '1';
                data_strobe_cmb         <= '1';

                addr_cnt_rst_cmb        <= '1';
                cycle_cnt_ld_cmb        <= '1';
                cs_strobe_cmb           <= '1';
                mem_Addr_rst_cmb        <= '1';
                new_page                <= '0';
                addr_align_reg          <= '0';
                read_break_reg          <= '0';
                mem_rnw_cmb             <= '1';

               if (Bus2IP_WrReq = '1' and Thz_end = '1' and Bus2IP_Mem_CS = '1') then
                  if synch_mem = '1' then
                    if single_trans = '1' then
                      wlast                 <= '1';
                    else
                      wlast                 <= '0';
                    end if;
                      --next_state         <= WRITE;
                  else
                      --next_state         <= ADDRESS_SET;
                  end if;
                      next_state            <= ADDRESS_SET;
                      twr_load_cmb          <= '1';
                      twph_load_cmb         <= '1';
                      transaction_done_cmb  <= '0';
                      transaction_complete  <= '0';
                      addr_align_reg        <= '0';
                      wvalid                <= '1';

                elsif (Bus2IP_RdReq = '1' and Tlz_end = '1' and Bus2IP_Mem_CS = '1') then
                    -- read_req_ack_cmb   <= '1';
                    trd_load_cmb       <= '1';

                    --mem_cen_cmb    <= not single_trans; -- '0'; -- 1/3/2013
                    --mem_oen_cmb    <= not single_trans; -- '0'; -- 1/3/2013

                    next_state         <= ADDRESS_RSET;
                    if(Linear_flash_brst_rd_flag = '1')then
                        Adv_L_N            <= '0';
                        read_req_ack_cmb   <= '0';                        
                        --mem_cen_cmb    <= '0';-- 1/3/2013
                        --mem_oen_cmb    <= '0';-- 1/3/2013
                    else
                         read_req_ack_cmb   <= '1';                        
                    end if;
                    transaction_done_cmb    <= '0';
                    addr_align_reg  <= Addr_align;
                    transaction_complete    <= '0';
                end if;

            -------------------------------------------------------------------
            -- ADDRESS SET
            -- Puts the correct Address on address lines one cycle before cen
            -------------------------------------------------------------------    
            when ADDRESS_SET =>
                mem_rnw_cmb        <= '1';
                mem_Addr_rst_cmb   <= '0';
                next_state         <= DEASSERT_CEN;

            -------------------------------------------------------------------
            -- ADDRESS RSET
            -- Puts the correct Address on address lines one cycle before cen
            -------------------------------------------------------------------    
            when ADDRESS_RSET =>
               mem_rnw_cmb        <= '1';
               next_state         <= DEASSERT_RCEN;

            -------------------------------------------------------------------
            -- DEASSERT CEN
            -- CE pin of memory is set one cycle before Write Enable
            -------------------------------------------------------------------    
            when DEASSERT_CEN =>
                mem_rnw_cmb  <= '0';
                mem_cen_cmb  <= '0';
                next_state   <= WRITE;   
           
            -------------------------------------------------------------------
            -- DEASSERT CEN
            -- CE pin of memory is set one cycle before Write Enable
            -------------------------------------------------------------------    
            when DEASSERT_RCEN =>
                mem_cen_cmb  <= '0';
                mem_rnw_cmb  <= '1';
                if(Linear_flash_brst_rd_flag = '1')then
                  next_state         <= LINEAR_FLASH_SYNC_RD;
                else
                  next_state         <= READ;
                end if;
            -------------------------------------------------------------------
            -- WRITE STATE
            -- Controls write operation to the memory.
            -- Generates control signals for write, address, and cycle end
            -- counters.
            -------------------------------------------------------------------

            when WRITE =>
               mem_rnw_cmb  <= '0';
               mem_wen_cmb  <= '0';
               mem_cen_cmb  <= '0';

               if axi_wlast = '1' and axi_wvalid = '1' then
                   wlast <= '1';
               end if;

                if (Bus2IP_Mem_CS_d2 = '1' and Bus2IP_Mem_CS_d1 = '0') then
                    transaction_complete   <= '1';
                end if;

                if (Twr_end = '1') then
                    -- sync mem starts
                    if Synch_mem = '1' then
                        if (Cycle_End = '1') then
                            if (Bus2IP_WrReq = '1' and axi_wvalid = '0' and wlast = '0') then
                                Write_req_data_ack_cmb <= '1';
                                Write_req_addr_ack_cmb <= '1';

                                address_strobe_cmb     <= '1';
                                be_strobe_cmb          <= '1';
                                data_strobe_cmb        <= '1';

                                addr_cnt_rst_cmb       <= '1';
                                cycle_cnt_ld_cmb       <= '1';

                                next_state         <= WRITE_WAIT;
                                wvalid                 <= '0';                            
                            elsif (Bus2IP_WrReq = '1' and (wvalid = '1' or axi_wvalid = '1'))then
                                --write_req_ack_cmb      <= '1';09-12-2012
                                --if axi_wvalid = '1' then
                                Write_req_data_ack_cmb <= '1';
                                Write_req_addr_ack_cmb <= '1';
                                --end if;

                                --addressData_strobe_cmb <= '1';09-12-2012
                                address_strobe_cmb     <= '1';
                                be_strobe_cmb          <= '1';
                                data_strobe_cmb        <= '1';

                                addr_cnt_rst_cmb       <= '1';
                                cycle_cnt_ld_cmb       <= '1';
                                --twr_load_cmb           <= '1'; NOT required in Sync Write mode
                            elsif (Bus2IP_WrReq = '1' and wlast = '1') then
                                Write_req_data_ack_cmb <= '1';
                                Write_req_addr_ack_cmb <= '1';
                                next_state         <= ASSERT_CEN;

                            elsif (Bus2IP_WrReq = '0') then
                                twr_rec_load_cmb       <= flash_mem_access;-- this can be moved to idle state set to 1
                                next_state             <= ASSERT_CEN;
                            else
                                next_state         <= WRITE;
                            end if;
                        else
                            --twr_load_cmb      <= '1'; -- not needed in sync write mode
                            cycle_cnt_en_cmb  <= '1';
                            addr_cnt_ce_cmb   <= '1';
                        end if;
                    -- sync mem ends
                    -- async mem starts
                    else
                        twph_cnt_en_cmb         <= '1';
                        next_state              <= DASSERT_WEN;
                    end if;
                    -- async mem ends
                else
                    twr_cnt_en_cmb  <= '1';
                end if;
            -----------------

            when WRITE_WAIT =>
               mem_rnw_cmb  <= '0';
                if synch_mem = '1' then
                  mem_cen_cmb   <= '0';
                end if;
                if (Bus2IP_WrReq = '1' and axi_wvalid = '1' ) then
                    if synch_mem = '1' then
                        next_state              <= DEASSERT_CEN;
                    else
                        next_state              <= ADDRESS_SET;
                    end if;
                    wvalid                  <= '1';
                    if axi_wlast = '1' and axi_wvalid = '1' then
                        wlast <= '1';
                    end if;                    
                else
                    next_state              <= WRITE_WAIT;
                end if;

            when WAIT_TEMP =>
               mem_rnw_cmb  <= '1';
               if axi_wlast = '1' and axi_wvalid = '1' then
                   wlast <= '1';
               end if;                
                if (Bus2IP_WrReq = '1' and Thz_end = '1' ) then
                    --addressData_strobe_cmb  <= '1'; 09-12-2012
                    address_strobe_cmb      <= '1';
                    be_strobe_cmb           <= '1';
                    data_strobe_cmb         <= '1';

                    addr_cnt_rst_cmb        <= '1';
                    cycle_cnt_ld_cmb        <= '1';
                    cs_strobe_cmb           <= '1';
                    mem_Addr_rst_cmb        <= '1';
                    addr_align_reg          <= '0';
                    twr_load_cmb            <= '1';
                    if synch_mem = '1' then
                        next_state              <= DEASSERT_CEN;
                    else
                        next_state              <= ADDRESS_SET;
                    end if;
                    addr_align_reg          <= '0';
                     twph_load_cmb     <= '1';
                     if (last_burst_cnt = '0' and
                         Synch_mem      = '0' and
                         single_trans   = '0') then 
                         --single_trans   = '0' and 
                         --axi_wvalid     = '1')then
                       --write_req_ack_cmb      <= '1';09-12-2012
                       Write_req_data_ack_cmb <= '1';
                       Write_req_addr_ack_cmb <= '1';
                    end if;
                elsif (transaction_complete = '1') or
                      (Bus2IP_Mem_CS = '0' and Bus2IP_WrReq = '0') then
                    twr_rec_load_cmb <= flash_mem_access;
                    next_state       <= ASSERT_CEN;
                else
                        next_state              <= WAIT_TEMP;
                end if;
            -------------------------------------------------------------------
            -- DASSERT_WEN STATE
            -- Comes to this state only when write operation is performed on
            -- asynchronous memory.This state performs NOP cycle on memory side.
            -- Generates control signals for write, address and cycle end
            -- counters.
            -------------------------------------------------------------------

            when DASSERT_WEN =>
               mem_rnw_cmb  <= '0';
               mem_wen_cmb  <= '0';
               if axi_wlast = '1' and axi_wvalid = '1' then
                   wlast <= '1';
               end if;

                if (Cycle_End = '1') then
                    if (Bus2IP_WrReq = '1') then
                        if (twph_end = '1') then
                                -- write_req_ack_cmb      <= '1'; 09-12-2012
                                --if axi_wvalid = '1' then
                                Write_req_data_ack_cmb <= '1';
                                Write_req_addr_ack_cmb <= '1';
                                --end if;

                                --addressData_strobe_cmb <= '1';09-12-2012
                                address_strobe_cmb     <= '1';
                                be_strobe_cmb          <= '1';
                                data_strobe_cmb        <= '1';

                                addr_cnt_rst_cmb       <= '1';
                                cycle_cnt_ld_cmb       <= '1';
                                twr_load_cmb           <= '1';
                                twph_load_cmb           <= '1';
                                if (single_trans = '1') then
                                next_state             <= WAIT_WRITE_ACK;
                                twr_rec_load_cmb       <= flash_mem_access;
                                elsif (axi_wvalid = '1' or wlast = '1') then
                                next_state             <= ADDRESS_SET;
                                else
                                next_state             <= WRITE_WAIT;
                                end if;
                        else
                                next_state             <= DASSERT_WEN;
                                twph_cnt_en_cmb        <= '1';
                        end if;
                    elsif (Bus2IP_Mem_CS = '1' and
                           Bus2IP_WrReq  = '0' and
                           Bus2IP_RdReq  = '0')then
                                if(last_addr1 = '1' and bus2ip_ben_all_1 = '1') then
                                    next_state             <= ADDRESS_SET;
                                else
                                    next_state             <= WAIT_TEMP;
                                end if;
                                address_strobe_cmb     <= last_addr1;--
                                be_strobe_cmb          <= last_addr1;-- '1';
                                data_strobe_cmb        <= last_addr1;-- '1';
                                twr_rec_load_cmb       <= flash_mem_access;

                                -- write_req_ack_cmb      <= last_addr1;-- '0';09-12-2012
                                --if axi_wvalid = '1' then
                                Write_req_data_ack_cmb <= last_addr1;-- '0';
                                Write_req_addr_ack_cmb <= last_addr1;-- '0';
                                --end if;
                                addr_cnt_rst_cmb       <= '0';
                                cycle_cnt_ld_cmb       <= '0';
                                twr_load_cmb           <= '0';
                    else
                        twr_rec_load_cmb       <= flash_mem_access;
                        next_state             <= WAIT_WRITE_ACK;
                    end if;
                else
                  if (twph_end = '1') then
                    twr_load_cmb      <= '1';
                    cycle_cnt_en_cmb  <= '1';
                    addr_cnt_ce_cmb   <= '1';
                    twph_load_cmb     <= '1';
                    next_state        <= ADDRESS_SET;
                  else
                    twph_cnt_en_cmb   <= '1';
                  end if;
                end if;

            
            
            when ASSERT_CEN =>
                mem_wen_cmb   <= '0';
                mem_rnw_cmb   <= '1';
                next_state    <= WAIT_WRITE_ACK;
            -------------------------------------------------------------------
            -- WAIT_WRITE_ACK STATE
            -------------------------------------------------------------------
            when WAIT_WRITE_ACK =>
                    --if synch_mem = '1' then
                    --  Write_req_data_ack_cmb <= '1';
                    --  Write_req_addr_ack_cmb <= '1'; 
                    --end if;                        
                    mem_rnw_cmb  <= '1';
                    if(flash_mem_access = '1') then
                        twr_rec_cnt_en_cmb <= '1';
                        next_state       <= WR_REC_PERIOD;
                    else
                        next_state    <= IDLE;
                    end if;
                    tlz_load_cmb          <= '1';
                    addr_cnt_rst_cmb      <= '1';
                    transaction_done_cmb  <= '1';
                    wlast  <= '0';

            when WR_REC_PERIOD =>
                    mem_rnw_cmb  <= '1';
                    if(Twr_rec_end = '1')then
                        Flash_mem_access_disable <= '1';
                        --Write_req_data_ack_cmb <= '1';
                        next_state    <= IDLE;
                    else
                        twr_rec_cnt_en_cmb <= '1';
                                    next_state         <= WR_REC_PERIOD;
                    end if;



            -------------------------------------------------------------------
            -- READ STATE
            -- Controls read operation on memory.
            -- Generates control signals for read, address and cycle end
            -- counters
            -------------------------------------------------------------------
         when LINEAR_FLASH_SYNC_RD =>
                mem_rnw_cmb  <= '1';
                if (Bus2IP_Mem_CS_d2 = '1' and Bus2IP_Mem_CS_d1 = '0') then
                    transaction_complete   <= '1';
                end if;

                if (read_break= '1' and single_trans = '0') then
                        read_break_reg <= '1';
                end if;
                Adv_L_N                 <= '1';
                mem_cen_cmb    <= not Bus2IP_RdReq_emc; -- '0';
                mem_oen_cmb    <= not Bus2IP_RdReq_emc; -- '0';
                new_page       <= '0';
                -- added for abort condition
		        if (Mem_WAIT = '1') then                    
                    read_data_en_cmb  <= Linear_flash_rd_data_ack;
                    addr_align_reg  <= Addr_align;
                    if (Cycle_End = '1') then
                        if (Bus2IP_RdReq='1') then -- or single_trans = '1')and
                                                    -- read_break_reg = '0'                   and
                                                    -- transaction_complete = '0') then
                            read_req_ack_cmb       <= '1';

                            --addressData_strobe_cmb <= '1';09-12-2012
                            address_strobe_cmb     <= '1';
                            be_strobe_cmb          <= '1'; 
                            data_strobe_cmb        <= '1';
                            if (single_trans = '0') then
                              addr_cnt_rst_cmb       <= '1';
                            end if;
                            cycle_cnt_ld_cmb       <= '1';

                            trd_load_cmb       <= '1';
                            next_state         <= LINEAR_FLASH_SYNC_RD;
                        else
                            next_state             <= DEASSERT_OEN;
                            read_complete_cmb      <= '1';
                            read_data_en_cmb       <= '0';
                        end if;
                    else
                            trd_load_cmb           <= '1';
                            cycle_cnt_en_cmb       <= '1';
                            if (Bus2IP_RdReq='1') then
                              addr_cnt_ce_cmb        <= '1';
                            end if;
                            next_state         <= LINEAR_FLASH_SYNC_RD;
		    end if;
                else
                    if(Bus2IP_RdReq = '0') then
		        next_state             <= DEASSERT_OEN;
                        read_complete_cmb      <= '1';
	            else
		        next_state         <= LINEAR_FLASH_SYNC_RD;
		        trd_cnt_en_cmb  <= '1';
                    end if;
                end if;


            -------------------------------------------------------------------
            -- READ STATE
            -- Controls read operation on memory.
            -- Generates control signals for read, address and cycle end
            -- counters
            -------------------------------------------------------------------

            when READ =>

                mem_rnw_cmb  <= '1';
                if (read_break= '1' and single_trans = '0') then
                        read_break_reg <= '1';
                end if;

               -- mem_cen_cmb    <= not (single_trans or Bus2IP_Burst); --'0';
               -- mem_oen_cmb    <= not(single_trans or Bus2IP_Burst); --'0';
                mem_cen_cmb    <= (synch_mem and stop_oen) or ((not synch_mem) and read_break_reg); --'0';
                mem_oen_cmb    <= (synch_mem and stop_oen) or ((not synch_mem) and read_break_reg); --'0';
                new_page       <= '0';

                -- added for abort condition
                if (Trd_end = '1') then
                    read_data_en_cmb  <= '1'; -- generates are read data ack
                    addr_align_reg  <= Addr_align;
                    if (Cycle_End = '1') then
                        if (Bus2IP_RdReq='1') then -- or single_trans = '1')and
                                                   -- read_break_reg = '0'                   and
                                                   -- transaction_complete = '0') then -- or (stop_oen = '0' and synch_mem = '1') then

                            read_req_ack_cmb       <= '1';--not last_addr1_d2; -- '1';

                            --addressData_strobe_cmb <= '1';09-12-2012
                            address_strobe_cmb     <= '1';--not last_addr1_d2; -- '1';
                            be_strobe_cmb          <= '1';
                            data_strobe_cmb        <= '1';
                            if (single_trans='0' or synch_mem = '1') then
                              addr_cnt_rst_cmb       <= '1'; -- Bus2IP_RdReq_emc;-- '1';-- Bus2IP_RdReq_emc; -- '1';
                            end if;
                            cycle_cnt_ld_cmb       <= '1';
                            tpacc_load_cmb <= '1';
                            if New_page_access = '0' then
                                next_state         <= PAGE_READ;
                                -- tpacc_cnt_en_cmb   <= '1';
				-- tpacc_load_cmb     <= '1'; -- 1/4/2013
                                cycle_cnt_en_cmb   <= '1';-- 1/12/2013
				                    addr_cnt_ce_cmb    <= '1';-- 1/12/2013
                            else
                                trd_load_cmb       <= '1';
                                next_state         <= READ;
                            end if;
                        else
                            next_state             <= DEASSERT_OEN;
                            read_complete_cmb      <= '1'; -- stop_oen; -- '1';
                            read_data_en_cmb       <= '1';
                        end if;
                    else
                               --if(read_break_reg = '1' and synch_mem = '0')then
                               -- next_state             <= WAIT_RDDATA_ACK;
                               -- read_complete_cmb      <= stop_oen;
                               --else
                               -- next_state             <= READ;
                               --end if;
                            if (Bus2IP_RdReq='1' or synch_mem = '1') then
                                addr_cnt_ce_cmb    <= '1';
                            end if;
                            if(New_page_access = '0') then
                                next_state         <= PAGE_READ;
                                tpacc_load_cmb     <= '1';
				                    --tpacc_cnt_en_cmb   <= '1';
				                    cycle_cnt_en_cmb   <= '1';-- 1/11/2013
				                    --addr_cnt_ce_cmb    <= '1';-- 1/11/2013
                            else
                                next_state         <= READ;
				                    trd_load_cmb       <= '1';
                                cycle_cnt_en_cmb   <= '1';
                                --addr_cnt_ce_cmb    <= '1';-- not last_addr1_d3; -- '1'; -- Bus2IP_RdReq; -- '1';
                    --        addr_cnt_rst_cmb       <= not Bus2IP_Burst; -- newly added
                            end if;
                    end if;
                else
                            if(read_break_reg = '1' and synch_mem = '0')then
                                next_state             <= DEASSERT_OEN;
				                    read_complete_cmb      <= '1';
                               -- read_complete_cmb      <= stop_oen;
                            else
                                next_state             <= READ;
                            end if;
                    --if(read_break = '1')then
                    --else
                    trd_cnt_en_cmb  <= '1';
                    -- end if;
                end if;

            -------------------------------------------------------------------
            -- PAGE_READ State =>
            -- Will do a page read when ever there is a page aligned boundry
            -------------------------------------------------------------------
            when PAGE_READ =>
                mem_rnw_cmb  <= '1';

                if (Bus2IP_Mem_CS_d2 = '1' and Bus2IP_Mem_CS_d1 = '0') then
                    transaction_complete   <= '1';
                end if;

                mem_cen_cmb    <= read_break_reg; -- not Bus2IP_Burst;-- read_break_reg; -- '0'; -- 1/4/2013
                mem_oen_cmb    <= read_break_reg; -- not Bus2IP_Burst;-- read_break_reg; -- '0'; -- 1/4/2013

                if (read_break= '1' and single_trans = '0') then
                        read_break_reg <= '1';
                end if;
                -- added for abort condition
                if (Tpacc_end = '1') then
                    addr_align_reg    <= Addr_align;
                    read_data_en_cmb  <= '1'; -- generates are read data ack
                    if (Cycle_End = '1') then
                        if (Bus2IP_RdReq = '1' --and
                            --read_break   = '0' and
                            --transaction_complete = '0'
			    ) then

                            read_req_ack_cmb       <= '1';
                           -- addressData_strobe_cmb <= '1';09-12-2012
                            address_strobe_cmb     <= '1';
                            be_strobe_cmb          <= '1';
                            data_strobe_cmb        <= '1';
                           if (single_trans = '0') then
                            addr_cnt_rst_cmb       <= '1';-- Bus2IP_RdReq_emc;-- '1';
                           end if;
                            cycle_cnt_ld_cmb       <= '1';

                            If new_page = '0' then
                                tpacc_load_cmb     <= '1';
                                next_state         <= PAGE_READ;
                            else
                                trd_load_cmb       <= '1';
                                next_state         <= READ;
                            end if;
                        else
                            next_state             <= DEASSERT_OEN;
                            read_complete_cmb      <= '1';
                            read_data_en_cmb       <= '0';-- '1'; 09-12-2012
                        end if;
                    else
                            tpacc_load_cmb         <= '1';
                            cycle_cnt_en_cmb       <= '1';
                        if (Bus2IP_RdReq = '1') then
                            addr_cnt_ce_cmb        <= '1';
                        end if;
                    end if;
                else
                    tpacc_cnt_en_cmb  <= '1';
                    if New_page_access = '1' then
                        new_page <= '1';
                    end if;
                end if;


            when DEASSERT_OEN =>
                next_state    <= WAIT_RDDATA_ACK;
                mem_oen_cmb   <= '0'; 
                mem_rnw_cmb   <= '1';
            -------------------------------------------------------------------
            -- WAIT_RDDATA_ACK STATE
            -- Waits in this state till read data is received from memory.
            -------------------------------------------------------------------

            when WAIT_RDDATA_ACK =>
                mem_rnw_cmb   <= '1';

                if read_complete = '1' then
                    next_state    <= IDLE;
                    thz_load_cmb  <= '1';
                    transaction_done_cmb    <= '1';
                end if;
                    addr_align_reg    <= Addr_align;
                    new_page          <= '0';
                    addr_cnt_rst_cmb  <= '1';
                    read_data_en_cmb  <= '0';
                    read_break_reg    <= '0';

                    if (Bus2IP_Mem_CS_d2 = '1' and
                        Bus2IP_Mem_CS_d1 = '0') then
                       transaction_complete   <= '1';
                    end if;

        end case;
    end process SM_COMB_PROCESS;
end generate NEW_LOGIC_GEN;

    ---------------------------------------------------------------------------
    -- Read complete generation logic.
    -- 2 pipe stages = read command delay from State machine to IO reg.
    -- Delay require to get the data from memory.
    -- 1 pipe stage = Data coming from memory is registered first in IO reg and
    -- then goes to data steering logic.
    -- 2 pipe stage = Async memory, 3 pipe stage = sync memory (PipeDelay=1),
    -- 4 pipe stage = sync memory (PipeDelay=2).
    ---------------------------------------------------------------------------

    read_complete       <= read_complete_d(3) when Synch_mem = '0'
                           else
                           --read_complete_d(6) when (Synch_mem = '1' and  --10-12-2012
                           --                         Two_pipe_delay = '0')--10-12-2012
                           read_complete_d(4) when (Synch_mem = '1' and  --10-12-2012
                                                    Two_pipe_delay = '0')--10-12-2012
                           else
                           read_complete_d(6); -- read_complete_d(7);
    read_complete_d(0)  <= read_complete_cmb or (stop_oen and synch_mem);


    READ_COMPLETE_PIPE_GEN : for i in 0 to 6 generate

        READ_COMPLETE_PIPE: FDR
            port map (
                Q   => read_complete_d(i+1), --[out]
                C   => Clk,                  --[in]
                D   => read_complete_d(i),   --[in]
                R   => Rst                   --[in]
              );
    end generate READ_COMPLETE_PIPE_GEN;

    ---------------------------------------------------------------------------
    -- Register state_machine states.
    ---------------------------------------------------------------------------

    REG_STATES_PROCESS : process (Clk)
        begin
            if(Clk'EVENT and Clk = '1')then
                if(Rst = '1')then
                    crnt_state <= IDLE;
                else
                    crnt_state <= next_state;
                end if;
            end if;
        end process REG_STATES_PROCESS;

    REG_SIG_PROCESS : process (Clk)
        begin
            if(Clk'EVENT and Clk = '1')then
                if(Rst = '1')then
                    wlast_reg <= '0';
                    wvalid_reg <= '0';
                else
                    wlast_reg <= wlast;
                    wvalid_reg <= wvalid;
                end if;
            end if;
        end process REG_SIG_PROCESS;

    ADDR_ALLIGN_PROCESS : process (Clk)
        begin
            if(Clk'EVENT and Clk = '1')then
                if(Rst = '1')then
                    Addr_align_rd    <= '0';
                    addr_align_rd_d1 <= '0';
                    new_page_d1      <= '0';
                    transaction_complete_reg <= '0';
                    read_break_reg_d1    <= '0';

                else
                    new_page_d1      <= new_page;
                    addr_align_rd_d1 <= addr_align_reg;
                    Addr_align_rd    <= addr_align_rd_d1;
                    transaction_complete_reg <= transaction_complete;
                    read_break_reg_d1    <= read_break_reg;
                end if;
            end if;
        end process ADDR_ALLIGN_PROCESS ;

    ---------------------------------------------------------------------------
    -- Register memory control signals.
    ---------------------------------------------------------------------------

    MEM_SIGNALS_REG_PROCESS :process(Clk)
        begin
            if(Clk'EVENT and Clk = '1')then
                if (Rst = '1') then
                    mem_cen_reg  <='1';
                    mem_oen_reg  <='1';
                    mem_wen_reg  <='1';
                else
                    mem_cen_reg  <=mem_cen_cmb;
                    mem_oen_reg  <=mem_oen_cmb;
                    mem_wen_reg  <=mem_wen_cmb;
                end if;
            end if;
        end process MEM_SIGNALS_REG_PROCESS;

    ---------------------------------------------------------------------------
    -- Data strobe creation process. Used as strobe signal for Bus2Ip_Data and
    -- Bus2IP_BE.
    ---------------------------------------------------------------------------
    --Data_strobe  <= addressData_strobe_cmb;09-12-2012
    Data_strobe <= '0';
    address_strobe_c    <= address_strobe_cmb;
    be_strobe_c         <= be_strobe_cmb     ;
    data_strobe_c       <= data_strobe_cmb   ;

    ---------------------------------------------------------------------------
    -- Register Addr_cnt control signals.
    ---------------------------------------------------------------------------

    ADDR_CNT_REG_PROCESS : process (Clk)
        begin
            if(Clk'EVENT and Clk = '1')then
                if(Rst = '1')then
                    addr_cnt_ce_reg <= '0';
                    addr_cnt_rst_reg<= '0';
                else
                    addr_cnt_ce_reg <= addr_cnt_ce_cmb;
                    addr_cnt_rst_reg<= addr_cnt_rst_cmb;
                end if;
            end if;
        end process ADDR_CNT_REG_PROCESS;

    ---------------------------------------------------------------------------
    -- Register cs_strobe_cmb signal.
    ---------------------------------------------------------------------------

    CS_STROBE_REG_PROCESS : process (Clk)
        begin
            if(Clk'EVENT and Clk = '1')then
                if(Rst = '1')then
                    cs_strobe_reg <= '0';
                else
                    cs_strobe_reg <= cs_strobe_cmb;
                end if;
            end if;
        end process CS_STROBE_REG_PROCESS;

    ---------------------------------------------------------------------------
    -- Register read_data_en_cmb signal.
    ---------------------------------------------------------------------------

    READ_DATA_EN_REG_PROCESS : process (Clk)
        begin
            if(Clk'EVENT and Clk = '1')then
                if(Rst = '1')then
                    read_data_en_reg <= '0';
                else
                    read_data_en_reg <= read_data_en_cmb;
                end if;
            end if;
        end process READ_DATA_EN_REG_PROCESS;

    ---------------------------------------------------------------------------
    -- Register Bus2IP_Mem_CS signal.
    ---------------------------------------------------------------------------

    CS_REG_PROCESS : process (Clk)
        begin
            if(Clk'EVENT and Clk = '1')then
                if(Rst = '1')then
                    Bus2IP_Mem_CS_d1 <= '0';
                    Bus2IP_Mem_CS_d2 <= '0';
                    Bus2IP_RdReq_d1 <= '0';
                    Bus2IP_RdReq_d2 <= '0';
                else
                    Bus2IP_Mem_CS_d1 <= Bus2IP_Mem_CS;
                    Bus2IP_Mem_CS_d2 <= Bus2IP_Mem_CS_d1;
                    Bus2IP_RdReq_d1 <= Bus2IP_RdReq;
                    Bus2IP_RdReq_d2 <= Bus2IP_RdReq_d1;
                end if;
            end if;
        end process CS_REG_PROCESS;

        read_break   <= (Bus2IP_RdReq_d1 and (not Bus2IP_RdReq));--(Bus2IP_RdReq_d2 and (not Bus2IP_RdReq_d1));
        Load_address <= (Bus2IP_Mem_CS_d1 and (not Bus2IP_Mem_CS_d2));

    ---------------------------------------------------------------------------
    -- Register transaction_done_cmb signal.
    ---------------------------------------------------------------------------

    TRAN_DONE_REG_PROCESS : process (Clk)
        begin
            if(Clk'EVENT and Clk = '1')then
                if(Rst = '1')then
                    transaction_done_reg <= '0';
                else
                    transaction_done_reg <= transaction_done_cmb;
                end if;
            end if;
        end process TRAN_DONE_REG_PROCESS;

    ---------------------------------------------------------------------------
    -- Register read_ack_cmb signal.
    ---------------------------------------------------------------------------

    READ_ACK_REG_PROCESS : process (Clk)
        begin
            if(Clk'EVENT and Clk = '1')then
                if(Rst = '1')then
                    read_ack_reg <= '0';
                else
                    read_ack_reg <= read_ack_cmb;
                end if;
            end if;
        end process READ_ACK_REG_PROCESS;
    LAST_ADDR_PROCESS : process (Clk)  -- 09-12-2012 added to make sure that sync read doesnt generate extra read address ack
        begin
            if(Clk'EVENT and Clk = '1')then
                if(Rst = '1')then
                    last_addr1_d1 <= '0';
                    last_addr1_d2 <= '0';
                    last_addr1_d3 <= '0';
                else
                    last_addr1_d1 <= last_addr1;
                    last_addr1_d2 <= last_addr1_d1;
                    last_addr1_d3 <= last_addr1_d2;
                end if;
            end if;
        end process LAST_ADDR_PROCESS;

    end architecture imp;

-------------------------------------------------------------------------------
-- End of File mem_state_machine.vhd
-------------------------------------------------------------------------------


-------------------------------------------------------------------
-- (c) Copyright 1984 - 2013 Xilinx, Inc. All rights reserved.
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
-------------------------------------------------------------------
------------------------------------------------------------------------------
-- Filename:        select_param.vhd
-- Description:     Selects correct parameter for addressed memory bank
--
-- VHDL-Standard:   VHDL'93
-------------------------------------------------------------------------------
-- Structure:
--                  emc.vhd
--                      -- ipic_if.vhd
--                      -- addr_counter_mux.vhd
--                      -- counters.vhd
--                      -- select_param.vhd
--                      -- mem_state_machine.vhd
--                      -- mem_steer.vhd
--                      -- io_registers.vhd
-------------------------------------------------------------------------------
-- Author:          NSK
-- History:
-- NSK             02/01/08    First Version
-- ^^^^^^^^^^
-- This file is same as in version v3_01_c - no change in the logic of this
-- module. Deleted the history from version v3_01_c.
-- ~~~~~~
-- NSK         05/08/08    version v3_00_a
-- ^^^^^^^^
-- 1. This file is same as in version v3_02_a.
-- 2. Upgraded to version v3.00.a to have proper versioning to fix CR #472164.
-- 3. No change in design.
-- ~~~~~~~~
-- KSB         07/14/08    version v4_00_a
-- ^^^^^^^^
-- 1. Added TPACC_* and timing parameter and new page access for reading page
--    mode flash
-- ~~~~~~~~
-- KSB         22/05/10    version v5_00_a
-- 1. Modified for AXI EMC, PSRAM, Byte parity Memory Support
-- 2. Modified for AXI Slave burst interface
-- ~~~~~~~~
-- SK          02/11/10    version v5_01_a
-- ^^^^^^^^
-- 1. Registered the IP2Bus_RdAck and IP2Bus_Data signals.
-- 2. Reduced utilization
-- ~~~~~~~~
-- SK          02/11/11    version v5_02_a
-- ^^^^^^^^
-- 1. Fixed CR#595758 and CR#606038
-- ~~~~~~~~
-- ~~~~~~
--  Sateesh 2011
-- ^^^^^^
--  -- Added Sync burst support for the Numonyx flash during read
-- ~~~~~~
-- ~~~~~~
--  SK 10/20/12
-- ^^^^^^
--  -- Fixed CR 672770 - BRESP signal is driven X during netlist simulation
--  -- Fixed CR 673491 - Flash transactions generates extra read cycle after the actual reads are over
-- ~~~~~~
-------------------------------------------------------------------------------
-- Naming Conventions:
--      active low signals:                     "*_n"
--      clock signals:                          "clk", "clk_div#", "clk_#x"
--      reset signals:                          "rst", "rst_n"
--      generics:                               "C_*"
--      user defined types:                     "*_TYPE"
--      state machine next state:               "*_ns"
--      state machine current state:            "*_cs"
--      combinatorial signals:                  "*_cmb"
--      pipelined or register delay signals:    "*_d#"
--      counter signals:                        "*cnt*"
--      clock enable signals:                   "*_ce"
--      internal version of output port         "*_i"
--      device pins:                            "*_pin"
--      ports:                                  - Names begin with Uppercase
--      processes:                              "*_PROCESS"
--      component instantiations:               "<ENTITY_>I_<#|FUNC>
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;
use ieee.std_logic_misc.all;
--use ieee.std_logic_unsigned.all;

-------------------------------------------------------------------------------
-- Definition of Generics:
--      C_NUM_BANKS_MEM            -- Number of memory banks
--      C_GLOBAL_SYNC_MEM          -- At least one memory bank is synchronous
--      C_SYNCH_MEM_(0:3)          -- Memory bank (0:3) type
--      C_MEM(0:3)_WIDTH           -- Data width of memory banks (0:3)
--      C_SYNCH_PIPEDELAY_(0:3)    -- Synchronous pipe delay of memory
--                                 -- banks (0:3)
--      C_GLOBAL_DATAWIDTH_MATCH   -- Datawidth matching is supported for
--                                    at least one memory bank
--      C_INCLUDE_DATAWIDTH_MATCHING_(0:3)
--                                 -- Include datawidth matching for memory
--      C_PAGEMODE_FLASH           -- Page Mode Flash is supported for
--                                    at least one memory bank
--                                 -- banks (0:3)
--      PARITY_TYPE_MEMORY         -- Partity Type support any memory bank
--      C_PARITY_TYPE_(0:3)        -- Parity type for each bank
--
--      TRDCNT_0                   -- Read Cycle Count for Memory 0
--      TRDCNT_1                   -- Read Cycle Count for Memory 1
--      TRDCNT_2                   -- Read Cycle Count for Memory 2
--      TRDCNT_3                   -- Read Cycle Count for Memory 3
--
--      THZCNT_0                   -- Read End to Data High Impedance, Memory 0
--      THZCNT_1                   -- Read End to Data High Impedance, Memory 1
--      THZCNT_2                   -- Read End to Data High Impedance, Memory 2
--      THZCNT_3                   -- Read End to Data High Impedance, Memory 3
--
--      TWRCNT_0                   -- Write Cycle Count for Memory 0
--      TWRCNT_1                   -- Write Cycle Count for Memory 1
--      TWRCNT_2                   -- Write Cycle Count for Memory 2
--      TWRCNT_3                   -- Write Cycle Count for Memory 3
--
--      TWPHCNT_0                  -- Write Cycle High Count for Memory 0
--      TWPHCNT_1                  -- Write Cycle High Count for Memory 1
--      TWPHCNT_2                  -- Write Cycle High Count for Memory 2
--      TWPHCNT_3                  -- Write Cycle High Count for Memory 3
--
--
--      TLZCNT_0                   -- Write End to Data Low Impedance, Memory 0
--      TLZCNT_1                   -- Write End to Data Low Impedance, Memory 1
--      TLZCNT_2                   -- Write End to Data Low Impedance, Memory 2
--      TLZCNT_3                   -- Write End to Data Low Impedance, Memory 3
--
--      TPACC_0                    -- Page Access time , Memory 0
--      TPACC_1                    -- Page Access time , Memory 1
--      TPACC_2                    -- Page Access time , Memory 2
--      TPACC_3                    -- Page Access time , Memory 3
--
--      TP_WR_REC_CNT_x            -- Write recovery time for memory x, when Flash
--                                    memory is selected
-- Definition of Ports:
--      Bus2IP_Mem_CS              -- Memory Channel Chip Select
--      Twr_data                   -- Write Cycle Time
--      Tlz_data                   -- Write Cycle Recovery Time
--      Trd_data                   -- Read Cycle Start Time
--      Thz_data                   -- Read Recovery Time
--      Parity_enable              -- Parity is enabled or not
--      Parity_type                -- Parity is either odd/Even
--      Synch_mem                  -- Synchronous Memory Control
--      Mem_width_bytes            -- Memory Width in Bytes
--      Two_pipe_delay             -- Synchronous Memory Pipeline Control
--      Datawidth_match            -- Datawidth Matching Control
--
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Entity section
-------------------------------------------------------------------------------

entity select_param is
    generic (
        C_NUM_BANKS_MEM                 : integer range 1 to 4 := 4;

        C_PAGE_SIZE                     : integer := 16;

        C_GLOBAL_SYNC_MEM               : integer range 0 to 1 := 0;
        C_SYNCH_MEM_0                   : integer range 0 to 1 := 0;
        C_SYNCH_MEM_1                   : integer range 0 to 1 := 0;
        C_SYNCH_MEM_2                   : integer range 0 to 1 := 0;
        C_SYNCH_MEM_3                   : integer range 0 to 1 := 0;

        C_MEM0_WIDTH                    : integer := 64;
        C_MEM1_WIDTH                    : integer := 64;
        C_MEM2_WIDTH                    : integer := 64;
        C_MEM3_WIDTH                    : integer := 64;

        C_PAGEMODE_FLASH                : integer range 0 to 1   := 1;
        C_PAGEMODE_FLASH_0              : integer := 0;
        C_PAGEMODE_FLASH_1              : integer := 0;
        C_PAGEMODE_FLASH_2              : integer := 0;
        C_PAGEMODE_FLASH_3              : integer := 0;

        PARITY_TYPE_MEMORY              : integer range 0 to 1  := 1;
        C_PARITY_TYPE_0                 : integer range 0 to 2  := 0;
        C_PARITY_TYPE_1                 : integer range 0 to 2  := 0;
        C_PARITY_TYPE_2                 : integer range 0 to 2  := 0;
        C_PARITY_TYPE_3                 : integer range 0 to 2  := 0;

        C_IPIF_AWIDTH                   : integer := 32;
        C_IPIF_DWIDTH                   : integer := 32;

        C_SYNCH_PIPEDELAY_0             : integer range 1 to 2 := 2;
        C_SYNCH_PIPEDELAY_1             : integer range 1 to 2 := 2;
        C_SYNCH_PIPEDELAY_2             : integer range 1 to 2 := 2;
        C_SYNCH_PIPEDELAY_3             : integer range 1 to 2 := 2;

        C_GLOBAL_DATAWIDTH_MATCH        : integer range 0 to 1 := 1;
        C_INCLUDE_DATAWIDTH_MATCHING_0  : integer := 1;
        C_INCLUDE_DATAWIDTH_MATCHING_1  : integer := 1;
        C_INCLUDE_DATAWIDTH_MATCHING_2  : integer := 1;
        C_INCLUDE_DATAWIDTH_MATCHING_3  : integer := 1;

        TRDCNT_0                        : std_logic_vector(0 to 4);
        TRDCNT_1                        : std_logic_vector(0 to 4);
        TRDCNT_2                        : std_logic_vector(0 to 4);
        TRDCNT_3                        : std_logic_vector(0 to 4);

        THZCNT_0                        : std_logic_vector(0 to 4);
        THZCNT_1                        : std_logic_vector(0 to 4);
        THZCNT_2                        : std_logic_vector(0 to 4);
        THZCNT_3                        : std_logic_vector(0 to 4);

        TWRCNT_0                        : std_logic_vector(0 to 4);
        TWRCNT_1                        : std_logic_vector(0 to 4);
        TWRCNT_2                        : std_logic_vector(0 to 4);
        TWRCNT_3                        : std_logic_vector(0 to 4);

        TWPHCNT_0                       : std_logic_vector(0 to 4);
        TWPHCNT_1                       : std_logic_vector(0 to 4);
        TWPHCNT_2                       : std_logic_vector(0 to 4);
        TWPHCNT_3                       : std_logic_vector(0 to 4);

        TPACC_0                         : std_logic_vector(0 to 4);
        TPACC_1                         : std_logic_vector(0 to 4);
        TPACC_2                         : std_logic_vector(0 to 4);
        TPACC_3                         : std_logic_vector(0 to 4);

        TLZCNT_0                        : std_logic_vector(0 to 4);
        TLZCNT_1                        : std_logic_vector(0 to 4);
        TLZCNT_2                        : std_logic_vector(0 to 4);
        TLZCNT_3                        : std_logic_vector(0 to 4);
	-- --
	TP_WR_REC_CNT_0			: std_logic_vector(0 to 15);
	TP_WR_REC_CNT_1			: std_logic_vector(0 to 15);
	TP_WR_REC_CNT_2			: std_logic_vector(0 to 15);
	TP_WR_REC_CNT_3			: std_logic_vector(0 to 15)
	-- --
    );
    port (
        Bus2IP_Mem_CS           : in  std_logic_vector(0 to C_NUM_BANKS_MEM-1);
        Bus2IP_Addr             : in  std_logic_vector(0 to C_IPIF_AWIDTH-1);
        Bus2IP_Clk              : in  std_logic;
        Bus2IP_Reset            : in  std_logic;
        Bus2IP_RNW              : in  std_logic;

        New_page_access         : out std_logic;
        Parity_enable           : out std_logic;
        Parity_type             : out std_logic;
        psram_page_mode         : in  std_logic;


        Twr_data                : out std_logic_vector(0 to 4);
        Twph_data               : out std_logic_vector(0 to 4);
        Tlz_data                : out std_logic_vector(0 to 4);
        Trd_data                : out std_logic_vector(0 to 4);
        Thz_data                : out std_logic_vector(0 to 4);
        Tpacc_data              : out std_logic_vector(0 to 4);
	Twr_rec_data            : out std_logic_vector(0 to 15);--9/6/2011

        Synch_mem               : out std_logic;
        Mem_width_bytes         : out std_logic_vector(0 to 3);
        Two_pipe_delay          : out std_logic;
        Datawidth_match         : out std_logic
    );
end entity select_param;

-------------------------------------------------------------------------------
-- Architecture section
-------------------------------------------------------------------------------

architecture imp of select_param is
-------------------------------------------------------------------------------
-- Function log2 -- returns number of bits needed to encode x choices
--   x = 0  returns 0
--   x = 1  returns 0
--   x = 2  returns 1
--   x = 4  returns 2, etc.
-------------------------------------------------------------------------------
--
function log2(x : natural) return integer is
  variable i  : integer := 0; 
  variable val: integer := 1;
begin 
  if x = 0 then return 0;
  else
    for j in 0 to 29 loop -- for loop for XST 
      if val >= x then null; 
      else
        i := i+1;
        val := val*2;
      end if;
    end loop;
  -- Fix per CR520627  XST was ignoring this anyway and printing a  
  -- Warning in SRP file. This will get rid of the warning and not
  -- impact simulation.  
  -- synthesis translate_off
    assert val >= x
      report "Function log2 received argument larger" &
             " than its capability of 2^30. "
      severity failure;
  -- synthesis translate_on
    return i;
  end if;  
end function log2;
----------------------------------------------------------------------------------
-- below attributes are added to reduce the synth warnings in Vivado tool
attribute DowngradeIPIdentifiedWarnings: string;
attribute DowngradeIPIdentifiedWarnings of imp : architecture is "yes";
----------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Constant Declaration
-------------------------------------------------------------------------------
    type SYNCH_ARRAY_TYPE is array (0 to 3) of integer;
        constant SYNCH_MEM_ARRAY : SYNCH_ARRAY_TYPE :=
            (
                C_SYNCH_MEM_0,
                C_SYNCH_MEM_1,
                C_SYNCH_MEM_2,
                C_SYNCH_MEM_3
            );

    type MEM_WIDTH_ARRAY_TYPE is array (0 to 3) of integer range 0 to 64;

    constant MEM_WIDTH_ARRAY : MEM_WIDTH_ARRAY_TYPE :=
            (
                C_MEM0_WIDTH,
                C_MEM1_WIDTH,
                C_MEM2_WIDTH,
                C_MEM3_WIDTH
            );

    type PIPE_DELAY_ARRAY_TYPE is array (0 to 3) of integer range 1 to 2;

    constant PIPE_DELAY_ARRAY : PIPE_DELAY_ARRAY_TYPE :=
            (
                C_SYNCH_PIPEDELAY_0,
                C_SYNCH_PIPEDELAY_1,
                C_SYNCH_PIPEDELAY_2,
                C_SYNCH_PIPEDELAY_3
            );

    type DATAWIDTH_MATCH_ARRAY_TYPE is array (0 to 3) of integer range 0 to 1;

    constant DATAWIDTH_MATCH_ARRAY : DATAWIDTH_MATCH_ARRAY_TYPE :=
            (
                C_INCLUDE_DATAWIDTH_MATCHING_0,
                C_INCLUDE_DATAWIDTH_MATCHING_1,
                C_INCLUDE_DATAWIDTH_MATCHING_2,
                C_INCLUDE_DATAWIDTH_MATCHING_3
            );

    type TIME_ARRAY_TYPE is array (0 to 3) of std_logic_vector(0 to 4);

    constant TWR_CNTR_ARRAY : TIME_ARRAY_TYPE :=
            (
                TWRCNT_0,
                TWRCNT_1,
                TWRCNT_2,
                TWRCNT_3
            );

    constant TWPH_CNTR_ARRAY : TIME_ARRAY_TYPE :=
            (
                TWPHCNT_0,
                TWPHCNT_1,
                TWPHCNT_2,
                TWPHCNT_3
            );



    constant TRD_CNTR_ARRAY : TIME_ARRAY_TYPE :=
            (
                TRDCNT_0,
                TRDCNT_1,
                TRDCNT_2,
                TRDCNT_3
            );

    constant THZ_CNTR_ARRAY : TIME_ARRAY_TYPE :=
            (
                THZCNT_0,
                THZCNT_1,
                THZCNT_2,
                THZCNT_3
            );

    constant TLZ_CNTR_ARRAY : TIME_ARRAY_TYPE :=
            (
                TLZCNT_0,
                TLZCNT_1,
                TLZCNT_2,
                TLZCNT_3
            );


    constant TPACC_CNTR_ARRAY : TIME_ARRAY_TYPE :=
            (
                TPACC_0,
                TPACC_1,
                TPACC_2,
                TPACC_3
            );

    type TIME_ARRAY_TYPE_1 is array (0 to 3) of std_logic_vector(0 to 15);

    constant TWR_REC_ARRAY : TIME_ARRAY_TYPE_1 :=
            (
                TP_WR_REC_CNT_0,
                TP_WR_REC_CNT_1,
                TP_WR_REC_CNT_2,
                TP_WR_REC_CNT_3
            );

    type TYPE_PAGE_MODE_TYPE is array (0 to 3) of integer range 0 to 1;

    constant PAGE_MODE_ARRAY : TYPE_PAGE_MODE_TYPE :=
            (
                C_PAGEMODE_FLASH_0,
                C_PAGEMODE_FLASH_1,
                C_PAGEMODE_FLASH_2,
                C_PAGEMODE_FLASH_3
            );

    type MEMORY_PARITY_TYPE_ARRAY is array (0 to 3) of integer range 0 to 2;

    constant MEM_PARITY_TYPE_ARRAY : MEMORY_PARITY_TYPE_ARRAY :=
            (
                C_PARITY_TYPE_0,
                C_PARITY_TYPE_1,
                C_PARITY_TYPE_2,
                C_PARITY_TYPE_3
            );

-------------------------------------------------------------------------------
-- Signal Declaration
-------------------------------------------------------------------------------
    function calc_page_boundary (C_IPIF_DWIDTH : integer) return integer is
    begin
        if(C_IPIF_DWIDTH = 32)then
           return log2(C_IPIF_DWIDTH/2);
        else
           return log2(C_IPIF_DWIDTH/4);
        end if;
    end function calc_page_boundary;
    
    signal mem_width        : integer range 0 to 64;
    signal ADDR_REG_0       : std_logic_vector(0 to 31);
    signal page_mode_enable : std_logic;
    -- address offset
    constant ADDR_PAGE_OFFSET   : integer range 0 to 5
                    --:=calc_page_boundary(C_IPIF_DWIDTH); -- log2(C_IPIF_DWIDTH/2);
                    :=log2(C_PAGE_SIZE);

    type ADDR_TYPE is array (0 to 3) of std_logic_vector(0 to C_IPIF_AWIDTH-1);


-------------------------------------------------------------------------------
-- Begin architecture
-------------------------------------------------------------------------------
begin

    ---------------------------------------------------------------------------
    -- SINGLE_BANK_GEN is used when the number of banks is 1
    ---------------------------------------------------------------------------

    SINGLE_BANK_GEN: if C_NUM_BANKS_MEM = 1 generate
    begin

        -----------------------------------------------------------------------
        -- Synch_mem indicates that current memory bank is synchronous
        -----------------------------------------------------------------------

        SYNC_MEM_GEN_SING: if SYNCH_MEM_ARRAY(0)  = 1 generate
        begin
            Synch_mem        <= '1';
        end generate SYNC_MEM_GEN_SING;

        -----------------------------------------------------------------------
        -- Register the address coming from IPIF in case C_NUM_BANKS_MEM = 1
        -----------------------------------------------------------------------

        NEW_BANK_GEN_SING: if (PAGE_MODE_ARRAY(0) = 1) generate
        begin
            ADR_STORE_PROCESS_SING:process(Bus2IP_Clk)
            begin
                if (Bus2IP_Clk'event and Bus2IP_Clk = '1') then
                    if Bus2IP_Reset = '1' then
                        ADDR_REG_0  <= (others=>'0');
                    elsif (Bus2IP_RNW = '1' and Bus2IP_Mem_CS(0)='1' and
                                        psram_page_mode = '1') then
                        ADDR_REG_0  <= Bus2IP_Addr;
                    elsif Bus2IP_Mem_CS(0)='0'then
                        ADDR_REG_0  <= (others=>'0');
                    end if;
                end if;
            end process ADR_STORE_PROCESS_SING;

        -----------------------------------------------------------------------
        -- NEW BANK Access Detector generation in case C_PAGEMODE_FLASH = 1
        -----------------------------------------------------------------------
            new_page_access  <= '1'when ((ADDR_REG_0(0 to
                                        C_IPIF_AWIDTH-ADDR_PAGE_OFFSET-1))
                        /= (Bus2IP_Addr(0 to C_IPIF_AWIDTH-ADDR_PAGE_OFFSET-1))
                          and (Bus2IP_RNW = '1' and Bus2IP_Mem_CS(0)='1')) else
                            '0';
        end generate NEW_BANK_GEN_SING;

        -----------------------------------------------------------------------
        -- Check The parity logic for  C_NUM_BANKS_MEM = 1
        -----------------------------------------------------------------------
        BANK0_NO_PARITY_GEN: if (MEM_PARITY_TYPE_ARRAY(0) = 0) generate
        begin

           Parity_enable <= '0';
           Parity_type   <= '0';

        end generate BANK0_NO_PARITY_GEN;

        BANK0_PARITY_GEN: if (MEM_PARITY_TYPE_ARRAY(0) /= 0) generate
        begin

           Parity_enable <= '1';
           Parity_type   <= '1' when MEM_PARITY_TYPE_ARRAY(0) = 1 else '0';

        end generate BANK0_PARITY_GEN;


        -----------------------------------------------------------------------
        -- new_page_access is always zero in case C_NUM_BANKS_MEM = 1
        -----------------------------------------------------------------------
        NO_NEW_BANK_GEN_SING: if (PAGE_MODE_ARRAY(0) = 0) generate
        begin
            ADDR_REG_0  <= (others=>'0');
            new_page_access  <= '1';
        end generate NO_NEW_BANK_GEN_SING;

        -----------------------------------------------------------------------
        -- If current memory bank is asynchronous, Synch_mem is 0
        -----------------------------------------------------------------------

        ASYNC_MEM_GEN: if SYNCH_MEM_ARRAY(0)  = 0 generate
        begin
            Synch_mem        <= '0';
        end generate ASYNC_MEM_GEN;

        -----------------------------------------------------------------------
        -- The pipe delay for the synchronous memory used is 1
        -----------------------------------------------------------------------

        ONE_PIPEDELAY_GEN: if PIPE_DELAY_ARRAY(0) = 1 generate
        begin
            Two_pipe_delay   <= '0';
        end generate ONE_PIPEDELAY_GEN;

        -----------------------------------------------------------------------
        -- The pipe delay for the synchronous memory used is 2
        -----------------------------------------------------------------------

            TWO_PIPEDELAY_GEN: if PIPE_DELAY_ARRAY(0) = 2 generate
            begin
                Two_pipe_delay   <= '1';
            end generate TWO_PIPEDELAY_GEN;

        -----------------------------------------------------------------------
        -- The datawidth_match signal=1 indicates that the memory width is not
        -- equal to the opb/mch data width
        -----------------------------------------------------------------------

            DWIDTH_MATCH_GEN: if DATAWIDTH_MATCH_ARRAY(0) = 1 generate
            begin
                Datawidth_match  <= '1';
            end generate DWIDTH_MATCH_GEN;

        -----------------------------------------------------------------------
        -- The datawidth_match signal=0 indicates that the memory width is
        -- equal to the opb/mch data width
        -----------------------------------------------------------------------

            DWIDTH_NOMATCH_GEN: if DATAWIDTH_MATCH_ARRAY(0) = 0 generate
            begin
                Datawidth_match  <= '0';
            end generate DWIDTH_NOMATCH_GEN;

            Mem_width_bytes <= std_logic_vector
                                       (conv_unsigned(MEM_WIDTH_ARRAY(0)/8,4));

        -----------------------------------------------------------------------
        -- Timing signals generation
        -----------------------------------------------------------------------

            Twr_data        <= TWR_CNTR_ARRAY(0);
            Twph_data       <= TWPH_CNTR_ARRAY(0);
            Tlz_data        <= TLZ_CNTR_ARRAY(0);
            Trd_data        <= TRD_CNTR_ARRAY(0);
            Thz_data        <= THZ_CNTR_ARRAY(0);
            Tpacc_data      <= TPACC_CNTR_ARRAY(0);
	    Twr_rec_data    <= TWR_REC_ARRAY(0);--9/6/2011
    end generate SINGLE_BANK_GEN;

    ---------------------------------------------------------------------------
    -- end of generate SINGLE_BANK_GEN
    ---------------------------------------------------------------------------

    MULTI_BANK_GEN: if C_NUM_BANKS_MEM > 1 generate
    begin

    ---------------------------------------------------------------------------
    -- MULTI_BANK_GEN is used when the number of banks is greater than 1
    ---------------------------------------------------------------------------

    ---------------------------------------------------------------------------
    --              C_GLOBAL_SYNC_MEM = 1
    ---------------------------------------------------------------------------

    SYNC_MEM_GEN_MULTI: if C_GLOBAL_SYNC_MEM = 1 generate
    begin

        -----------------------------------------------------------------------
        -- This process is used to generate Synch_mem signal.
        -----------------------------------------------------------------------

        SYNCH_PROCESS: process (Bus2IP_Mem_CS) is
        begin
            Synch_mem   <= '0';-- '0'; -- 1/3/2013
            for i in 0 to C_NUM_BANKS_MEM-1 loop
                if Bus2IP_Mem_CS(i) = '1' then
                --  if (or_reduce(Bus2IP_Mem_CS) = '1') then 
                    if SYNCH_MEM_ARRAY(i)  = 1 then
                        Synch_mem   <= '1';
                    elsif SYNCH_MEM_ARRAY(i)  = 0 then
                        Synch_mem   <= '0';
                    end if;
                end if;
            end loop;
        end process SYNCH_PROCESS;

        -----------------------------------------------------------------------
        -- This process is used to generate Two_pipe_dalay signal.
        -----------------------------------------------------------------------


        SELECT_PIPEDELAY_PROCESS: process(Bus2IP_Mem_CS) is
        begin
            Two_pipe_delay <= '1';
            for i in 0 to C_NUM_BANKS_MEM-1 loop
                if Bus2IP_Mem_CS(i) = '1' then
                --  if (or_reduce(Bus2IP_Mem_CS) = '1') then 
                    if PIPE_DELAY_ARRAY(i) = 1 then
                        Two_pipe_delay <= '0';
                    else
                        Two_pipe_delay <= '1';
                    end if;
                end if;
            end loop;
        end process SELECT_PIPEDELAY_PROCESS;

    end generate SYNC_MEM_GEN_MULTI;


        -----------------------------------------------------------------------
        -- Register the address coming from IPIF in case C_NUM_BANKS_MEM > 1
        -----------------------------------------------------------------------

    NEW_BANK_GEN_MULI: if (C_PAGEMODE_FLASH = 1) generate
    begin

            PAGE_MODE: process (Bus2IP_Mem_CS,Bus2IP_RNW,psram_page_mode) is
            begin
                page_mode_enable   <= '0';
                for i in 0 to C_NUM_BANKS_MEM-1 loop
                    if (Bus2IP_RNW = '1' and or_reduce(Bus2IP_Mem_CS) = '1' and
                                                psram_page_mode = '1') then
                        if PAGE_MODE_ARRAY(i)  = 1 then
                            page_mode_enable   <= '1';
                        end if;
                    else
                        page_mode_enable   <= '0';
                    end if;
                end loop;
            end process PAGE_MODE;

            ADR_STORE_PROCESS_MULT:process(Bus2IP_Clk)
            begin
                if (Bus2IP_Clk'event and Bus2IP_Clk = '1') then
                    if Bus2IP_Reset = '1' then
                        ADDR_REG_0  <= (others=>'0');
                    elsif (page_mode_enable = '1') then
                        ADDR_REG_0  <= Bus2IP_Addr;
                    else
                        ADDR_REG_0  <= (others=>'0');
                    end if;
                end if;
            end process ADR_STORE_PROCESS_MULT;


            new_page_access  <= '1'when ((ADDR_REG_0(0 to
                                        C_IPIF_AWIDTH-ADDR_PAGE_OFFSET-1))
                        /= (Bus2IP_Addr(0 to C_IPIF_AWIDTH-ADDR_PAGE_OFFSET-1))
                          and (page_mode_enable='1' or psram_page_mode = '0'))
                          else '0';
        end generate NEW_BANK_GEN_MULI;


        -----------------------------------------------------------------------
        -- new_page_access is always zero in case C_NUM_BANKS_MEM = 1
        -----------------------------------------------------------------------
        NO_NEW_BANK_GEN_MULT: if (C_PAGEMODE_FLASH = 0) generate
        begin
            new_page_access  <= '1';
        end generate NO_NEW_BANK_GEN_MULT;


        -----------------------------------------------------------------------
        -- Check The parity logic for  C_NUM_BANKS_MEM > 1
        -----------------------------------------------------------------------
        MEM_NO_PARITY_GEN: if (PARITY_TYPE_MEMORY = 0) generate
        begin

           Parity_enable <= '0';
           Parity_type   <= '0';

        end generate MEM_NO_PARITY_GEN;

        MEM_PARITY_GEN: if (PARITY_TYPE_MEMORY /= 0) generate
        begin

          PARITY_GEN_PROCESS: process(Bus2IP_Mem_CS) is
          begin
            Parity_type <= '0';
            Parity_enable <= '0';
            for i in 0 to C_NUM_BANKS_MEM-1 loop
                if Bus2IP_Mem_CS(i) = '1' then
                   if MEM_PARITY_TYPE_ARRAY(i)/=0 then
                        Parity_enable <= '1';
                   end if;
                   if MEM_PARITY_TYPE_ARRAY(i)=1 then
                        Parity_type <= '1';
                   end if;
                end if;
            end loop;
          end process PARITY_GEN_PROCESS;
        end generate MEM_PARITY_GEN;


    ---------------------------------------------------------------------------
    ---------------------------- Asynchronous memories ------------------------
    ---------------------------------------------------------------------------

    ---------------------------------------------------------------------------
    --------------------- C_GLOBAL_SYNC_MEM = 0 -------------------------------
    ---------------------------------------------------------------------------

    NO_SYNC_MEM_GEN: if C_GLOBAL_SYNC_MEM=0 generate
    begin
        Synch_mem       <= '0';
        Two_pipe_delay  <= '0';
    end generate NO_SYNC_MEM_GEN;

    ---------------------------------------------------------------------------
    ------------------- C_GLOBAL_DATAWIDTH_MATCH = 1 --------------------------
    ---------------------------------------------------------------------------

    DATAWIDTH_MATCH_GEN: if C_GLOBAL_DATAWIDTH_MATCH = 1 generate
    begin

    ---------------------------------------------------------------------------
    -- This process is used to generate mem_width signal.
    ---------------------------------------------------------------------------

        SELECT_MEM_WIDTH_PROCESS: process(Bus2IP_Mem_CS) is
        begin
            mem_width <= 0;
            for i in 0 to C_NUM_BANKS_MEM-1 loop
                if Bus2IP_Mem_CS(i) = '1' then
                    mem_width <= MEM_WIDTH_ARRAY(i);
                end if;
            end loop;
        end process SELECT_MEM_WIDTH_PROCESS;

    ---------------------------------------------------------------------------
    -- This process is used to generate mem_width signal.
    -- This process is done in real time and is included to prevent
    -- implementation of the /8 function
    ---------------------------------------------------------------------------

        SELECT_MEM_WIDTH_BYTES_PROCESS: process(mem_width) is
        begin
            Mem_width_bytes <= (others => '0');
            case mem_width is
                when 8  =>
                    Mem_width_bytes <= "0001"; -- 1 Byte data width
                when 16 =>
                    Mem_width_bytes <= "0010"; -- 2 Byte data width
                when 32 =>
                    Mem_width_bytes <= "0100"; -- 4 Byte data width
                when 64 =>
                    Mem_width_bytes <= "1000"; -- 8 Byte data width
                when others =>
                    Mem_width_bytes <= (others => '0');
            end case;
        end process SELECT_MEM_WIDTH_BYTES_PROCESS;

    ---------------------------------------------------------------------------
    -- This process is used to generate Datawidth_match signal.
    ---------------------------------------------------------------------------

        SELECT_DATAWIDTH_MATCH_PROCESS: process(Bus2IP_Mem_CS) is
        begin
            Datawidth_match <= '0';
            for i in 0 to C_NUM_BANKS_MEM-1 loop
                if Bus2IP_Mem_CS(i) = '1' then
                    if DATAWIDTH_MATCH_ARRAY(i) = 1 then
                        Datawidth_match <= '1';
                    end if;
                end if;
            end loop;
        end process SELECT_DATAWIDTH_MATCH_PROCESS;

    end generate DATAWIDTH_MATCH_GEN;

    ---------------------------------------------------------------------------
    ---------------------- C_GLOBAL_DATAWIDTH_MATCH = 0 -----------------------
    ---------------------------------------------------------------------------

    NO_DATAWIDTH_MATCH_GEN: if C_GLOBAL_DATAWIDTH_MATCH = 0 generate
    begin
        Mem_width_bytes <= std_logic_vector
                                       (conv_unsigned(MEM_WIDTH_ARRAY(0)/8,4));
        Datawidth_match <= '0';
    end generate NO_DATAWIDTH_MATCH_GEN;

    ---------------------------------------------------------------------------
    -- This process is used to generate timing signals.
    ---------------------------------------------------------------------------

    SELECT_CNTR_PROCESS: process(Bus2IP_Mem_CS) is
    begin
        Twr_data        <= (others => '0');
        Twph_data       <= (others => '0');
        Tlz_data        <= (others => '0');
        Trd_data        <= (others => '0');
        Thz_data        <= (others => '0');
        Tpacc_data      <= (others => '0');
        Twr_rec_data    <= (others => '0');--

        for i in 0 to C_NUM_BANKS_MEM-1 loop
            if Bus2IP_Mem_CS(i) = '1' then
                Twr_data        <= TWR_CNTR_ARRAY(i);
                Twph_data       <= TWPH_CNTR_ARRAY(i);
                Tlz_data        <= TLZ_CNTR_ARRAY(i);
                Trd_data        <= TRD_CNTR_ARRAY(i);
                Thz_data        <= THZ_CNTR_ARRAY(i);
                Tpacc_data      <= TPACC_CNTR_ARRAY(i);
		Twr_rec_data    <= TWR_REC_ARRAY(i);-- 9/6/2011
            end if;
        end loop;
    end process SELECT_CNTR_PROCESS;

end generate MULTI_BANK_GEN;

end architecture imp;

-------------------------------------------------------------------------------
-- End of File select_param.vhd
-------------------------------------------------------------------------------


-------------------------------------------------------------------
-- (c) Copyright 1984 - 2013 Xilinx, Inc. All rights reserved.
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
-------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Filename:        addr_counter_mux.vhd-- Description:
--                  This file contains the addr_counter and mux for the EMC
--                  design.
--
-- VHDL-Standard:   VHDL'93
-------------------------------------------------------------------------------
-- Structure:
--                  emc.vhd
--                      -- ipic_if.vhd
--                      -- addr_counter_mux.vhd
--                      -- counters.vhd
--                      -- select_param.vhd
--                      -- mem_state_machine.vhd
--                      -- mem_steer.vhd
--                      -- io_registers.vhd
-------------------------------------------------------------------------------
-- Author:          NSK
-- History:
-- NSK             02/01/08    First Version
-- ^^^^^^^^^^
-- This file is same as in version v3_01_c - no change in the logic of this
-- module. Deleted the history from version v3_01_c.
-- ~~~~~~
-- NSK         02/12/08    Updated
-- ^^^^^^^^
-- Removed the unused part of code (not supporting C_IPIF_DWIDTH = 64): -
-- 1. Deleted the generate block lebelled "CYCLE_END_CNT_64_GEN".
-- 2. In the process "ADDR_SUFFIX_PROCESS" deleted the part of code as
--    C_ADDR_OFFSET = 3 is valid only when C_IPIF_DWIDTH = 64 is supported.
-- ~~~~~~~~
-- NSK         05/08/08    version v3_00_a
-- ^^^^^^^^
-- 1. This file is same as in version v3_02_a.
-- 2. Upgraded to version v3.00.a to have proper versioning to fix CR #472164.
-- 3. No change in design.
--
-- KSB         05/08/08    version v4_00_a
-- 1. Modified for Page mdoe read
-- 2. Modified for 64 Bit memory address align
-- ~~~~~~~~
-- KSB         22/05/10    version v5_00_a
-- 1. Modified for AXI EMC, PSRAM, Byte parity Memory Support
-- 2. Modified for AXI Slave burst interface
-- ~~~~~~~~
-- SK          02/11/11    version v5_02_a
-- ^^^^^^^^
-- 1. Fixed CR#595758 and CR#606038
-- ~~~~~~~~
-- ~~~~~~
--  Sateesh 2011
-- ^^^^^^
--  -- Added Sync burst support for the Numonyx flash during read
-- ~~~~~~
-- ~~~~~~
--  SK 10/20/12
-- ^^^^^^
--  -- Fixed CR 672770 - BRESP signal is driven X during netlist simulation
--  -- Fixed CR 673491 - Flash transactions generates extra read cycle after the actual reads are over
-- ~~~~~~
-------------------------------------------------------------------------------
-- Naming Conventions:
--      active low signals:                     "*_n"
--      clock signals:                          "clk", "clk_div#", "clk_#x"
--      reset signals:                          "rst", "rst_n"
--      generics:                               "C_*"
--      user defined types:                     "*_TYPE"
--      state machine next state:               "*_ns"
--      state machine current state:            "*_cs"
--      combinatorial signals:                  "*_com"
--      pipelined or register delay signals:    "*_d#"
--      counter signals:                        "*cnt*"
--      clock enable signals:                   "*_ce"
--      internal version of output port         "*_i"
--      device pins:                            "*_pin"
--      ports:                                  - Names begin with Uppercase
--      processes:                              "*_PROCESS"
--      component instantiations:               "<ENTITY_>I_<#|FUNC>
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_misc.all;

use ieee.numeric_std.all;

-------------------------------------------------------------------------------
-- vcomponents package of the unisim library is used for the FDR and FDCE
-- component declaration
-------------------------------------------------------------------------------

library unisim;
use unisim.vcomponents.all;

library emc_common_v3_0_5;
-------------------------------------------------------------------------------
-- Definition of Generics:
--      C_ADDR_CNTR_WIDTH       -- Width of address counter
--      C_IPIF_AWIDTH           -- Width of IPIF address bus
--      C_IPIF_DWIDTH           -- Width of IPIF data bus
--      C_ADDR_OFFSET           -- Unused lower address bits based on data
--                                 width
--      C_GLOBAL_DATAWIDTH_MATCH-- Indicates whether any memory bank is
--                                 supporting data width matching
--
-- Definition of Ports:
--      Bus2IP_Addr             -- Processor address bus
--      Bus2IP_BE               -- Processor bus byte enables
--      Address_strobe          -- Address strobe signal
--      Data_strobe             -- Data and BEs strobe signal
--      Mem_width_bytes         -- Width in bytes of currently addressed
--                                 memory bank
--      Datawidth_match         -- Data width matching for currently addressed
--                                 memory bank
--      Addr_cnt_ce             -- Address counter count enable
--      Addr_cnt_rst            -- Address counter reset
--      Addr_cnt                -- Address count
--      Cycle_cnt_ld            -- Cycle end counter count load
--      Cycle_cnt_en            -- Cycle end counter count enable
--      Cycle_end               -- Current cycle end flag
--      Mem_addr                -- Address out to memory
--      Mem_Ben                 -- Memory byte enables
--      Clk                     -- System Clock
--      Rst                     -- System Reset
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Entity section
-------------------------------------------------------------------------------

entity addr_counter_mux is
    generic(
        C_ADDR_CNTR_WIDTH           : integer range 1 to 5;
        C_IPIF_AWIDTH               : integer;
        C_IPIF_DWIDTH               : integer;
        C_ADDR_OFFSET               : integer range 0 to 4;
        PARITY_TYPE_MEMORY          : integer range 0 to 1  := 1;
        C_GLOBAL_DATAWIDTH_MATCH    : integer range 0 to 1
    );
    port(
        Clk                   : in  std_logic;
        Rst                   : in  std_logic;

        Bus2IP_Addr           : in  std_logic_vector(0 to C_IPIF_AWIDTH-1);
        Bus2IP_BE             : in  std_logic_vector(0 to C_IPIF_DWIDTH/8-1);
         Address_strobe        : in  std_logic; -- 07-12-2012
        --Data_strobe           : in  std_logic;09-12-2012
        Bus2Mem_CS            : in  std_logic;

        Mem_width_bytes       : in  std_logic_vector(0 to 3);
        Datawidth_match       : in  std_logic;

        Addr_cnt_ce           : in  std_logic;
        Addr_cnt_rst          : in  std_logic;
        Addr_cnt              : out std_logic_vector(0 to C_ADDR_CNTR_WIDTH-1);
        Addr_align            : out std_logic;

        Cycle_cnt_ld          : in  std_logic;
        Cycle_cnt_en          : in  std_logic;
        Cycle_End             : out std_logic;
        CS_par_addr           : in std_logic;

        Mem_addr              : out std_logic_vector(0 to C_IPIF_AWIDTH-1);
        par_error_addr        : out std_logic_vector(0 to C_IPIF_AWIDTH-1);
        Mem_Ben               : out std_logic_vector(0 to C_IPIF_DWIDTH/8-1);

        Bus2IP_RdReq          : in std_logic;
	address_strobe_c      : in  std_logic;
        be_strobe_c           : in  std_logic;
          data_strobe_c         : in  std_logic;
        Cre_reg_en	      : in  std_logic; -- 1/16/2013
	psram_page_mode       : in std_logic;
	axi_trans_size_reg : in std_logic_vector(1 downto 0)
    );
end entity addr_counter_mux;

-------------------------------------------------------------------------------
-- Architecture section
-------------------------------------------------------------------------------

architecture imp of addr_counter_mux is
-------------------------------------------------------------------------------
-- Function log2 -- returns number of bits needed to encode x choices
--   x = 0  returns 0
--   x = 1  returns 0
--   x = 2  returns 1
--   x = 4  returns 2, etc.
-------------------------------------------------------------------------------
--
function log2(x : natural) return integer is
  variable i  : integer := 0; 
  variable val: integer := 1;
begin 
  if x = 0 then return 0;
  else
    for j in 0 to 29 loop -- for loop for XST 
      if val >= x then null; 
      else
        i := i+1;
        val := val*2;
      end if;
    end loop;
  -- Fix per CR520627  XST was ignoring this anyway and printing a  
  -- Warning in SRP file. This will get rid of the warning and not
  -- impact simulation.  
  -- synthesis translate_off
    assert val >= x
      report "Function log2 received argument larger" &
             " than its capability of 2^30. "
      severity failure;
  -- synthesis translate_on
    return i;
  end if;  
end function log2;
----------------------------------------------------------------------------------
-- below attributes are added to reduce the synth warnings in Vivado tool
attribute DowngradeIPIdentifiedWarnings: string;
attribute DowngradeIPIdentifiedWarnings of imp : architecture is "yes";
----------------------------------------------------------------------------------


-------------------------------------------------------------------------------
-- Constant declarations
-------------------------------------------------------------------------------
-- reset values

constant ZERO_CYCLE_CNT : std_logic_vector(0 to (log2(C_IPIF_DWIDTH/8)-1))
                            := (others => '0');

-------------------------------------------------------------------------------
-- Signal declarations
-------------------------------------------------------------------------------
signal addr_cnt_i       : std_logic_vector(0 to C_ADDR_CNTR_WIDTH-1);
signal addr_suffix      : std_logic_vector(0 to C_ADDR_OFFSET-1)
                        := (others => '0');

signal addr_cnt_val     : std_logic_vector(0 to C_ADDR_CNTR_WIDTH-1);
signal cycle_cnt        : std_logic_vector(0 to (log2(C_IPIF_DWIDTH/8)-1));
signal cycle_end_cnt    : std_logic_vector(0 to (log2(C_IPIF_DWIDTH/8)-1));
signal int_addr         : std_logic_vector(0 to C_IPIF_AWIDTH-1);
signal Mem_Ben_i        : std_logic_vector(0 to C_IPIF_DWIDTH/8-1);

signal mem_addr_cmb     : std_logic_vector(0 to C_IPIF_AWIDTH-1);
signal addr_cnt_cmb     : std_logic_vector(0 to C_ADDR_CNTR_WIDTH-1);

signal addr_align_32_64 : std_logic;

signal reduced_low_be   : std_logic;
signal reduced_high_be  : std_logic;

signal reduced_16_0_be   : std_logic;
signal reduced_16_1_be   : std_logic;
signal reduced_16_2_be   : std_logic;
signal reduced_16_3_be   : std_logic;

signal par_error_addr_reg: std_logic_vector(0 to C_IPIF_AWIDTH-1);

signal Cycle_End_reg     : std_logic;
signal Cycle_cnt_en_int  : std_logic;

-------------------------------------------------------------------------------
-- Begin architecture
-------------------------------------------------------------------------------

begin

    ---------------------------------------------------------------------------
    -- Store the address coming from bus as address ack and data ack are issued
    -- early to make burst appear as continuous on memory side.
    ---------------------------------------------------------------------------

    Mem_Ben  <= Mem_Ben_i;

    ADDRESS_STORE_GEN: for i in 0 to C_IPIF_AWIDTH - 1 generate
    begin
        ADDRESS_REG: FDRE
        port map (
            Q   => int_addr(i),       --[out]
            C   => Clk,               --[in]
            CE  => address_strobe_c,--Data_strobe,       --[in]
            D   => Bus2IP_Addr(i),    --[in]
            R   => Rst                --[in]
            );
    end generate ADDRESS_STORE_GEN;

    ---------------------------------------------------------------------------
    -- Store the Byte Enables coming from bus as address ack and data ack are
    -- issued early to make burst appear as continuous one on memory side.
    ---------------------------------------------------------------------------

    BEN_STORE_GEN: for i in 0 to C_IPIF_DWIDTH/8-1 generate
    begin
      BEN_REG: FDRE
        port map (
            Q   => Mem_Ben_i(i),      --[out]
            C   => Clk,               --[in]
            CE  => be_strobe_c,--Data_strobe,       --[in]
            D   => Bus2IP_BE(i),      --[in]
            R   => Rst                --[in]
            );
    end generate BEN_STORE_GEN;

    ---------------------------------------------------------------------------
    -- Address and address count generation logic.
    ---------------------------------------------------------------------------

    Mem_addr            <= mem_addr_cmb  ;
    Addr_cnt            <= addr_cnt_cmb;

    PARITY_ERROR_GEN: if PARITY_TYPE_MEMORY = 1 generate

        par_error_addr     <= Bus2IP_Addr when CS_par_addr='1'
	                      else
                              par_error_addr_reg;
        PARITY_ERROR_PROCESS : process(Clk)
        begin
            if(Clk'EVENT and Clk = '1') then
                if(Rst = '1')then
                    par_error_addr_reg  <= (others=>'0');
                elsif CS_par_addr = '1' then
                    par_error_addr_reg <= Bus2IP_Addr;
                end if;
            end if;
        end process PARITY_ERROR_PROCESS;
    end generate PARITY_ERROR_GEN;
    ---------------------------------------------------------------------------
    ---------------------------- NO DATAWIDTH MATCHING ------------------------
    -- If datawidth matching has not been turned on for any memory banks,
    -- simplify the logic.
    ---------------------------------------------------------------------------

    NO_DATAWIDTH_MATCH_GEN: if C_GLOBAL_DATAWIDTH_MATCH = 0 generate
    begin
        addr_cnt_cmb <= (others => '0');
        mem_addr_cmb <= int_addr;
        Cycle_End    <= '1';
    end generate NO_DATAWIDTH_MATCH_GEN;

    ---------------------------------------------------------------------------
    ---------------------------- DATAWIDTH MATCHING ---------------------------
    -- If datawidth matching has been turned on at least 1 memory bank,
    -- implement the data width matching logic. Note that an individual bank
    -- with datawidth matching turned off will still use this logic.
    ---------------------------------------------------------------------------

    DATAWIDTH_MATCH_GEN: if C_GLOBAL_DATAWIDTH_MATCH = 1 generate
    begin

        -----------------------------------------------------------------------
        -- Assign output signals
        -----------------------------------------------------------------------
        addr_cnt_cmb <= (others => '0') when Datawidth_match = '0' else
                        addr_cnt_i;

        ADDR_CNT_PROCESS : process(Clk)
        begin
            if(Clk'EVENT and Clk = '1') then
                if(Rst = '1')then
                    addr_cnt_i  <= (others=>'0');
                elsif Addr_cnt_rst = '1' then
                    if(Cre_reg_en = '0') then
			addr_cnt_i  <= addr_cnt_val;
		    else
			addr_cnt_i  <= (others => '0');
		    end if;
                elsif Addr_cnt_ce = '1' then
                    addr_cnt_i  <= addr_cnt_i + 1;
                end if;
            end if;
        end process ADDR_CNT_PROCESS;

        -----------------------------------------------------------------------
        -- Create cycle termination logic for C_IPIF_DWIDTH  = 64.
        -----------------------------------------------------------------------

        CYCLE_END_CNT_64_GEN : if C_IPIF_DWIDTH  = 64 generate
        begin
            mem_addr_cmb <= int_addr when Datawidth_match = '0' or Cre_reg_en = '1' else
                            int_addr(0 to C_IPIF_AWIDTH-C_ADDR_OFFSET-1)
                            & addr_suffix;
            Addr_align   <= '0';

            reduced_high_be <= or_reduce (Bus2IP_BE(0 to 3));
            reduced_low_be  <= or_reduce (Bus2IP_BE(4 to 7));

            reduced_16_0_be <= or_reduce (Bus2IP_BE(6 to 7));
            reduced_16_1_be <= or_reduce (Bus2IP_BE(4 to 5));
            reduced_16_2_be <= or_reduce (Bus2IP_BE(2 to 3));
            reduced_16_3_be <= or_reduce (Bus2IP_BE(0 to 1));

            ---------------------------------------------------------------------
            -- Create the address suffix.
            ---------------------------------------------------------------------

            ADDR_SUFFIX_PROCESS_64: process(Mem_width_bytes,
                                            Bus2IP_Addr,
                                            addr_cnt_i)
            begin
                addr_suffix <= (others => '0');
                addr_cnt_val<= (others => '0');
                case Mem_width_bytes is
                  when "0001" =>
                      addr_suffix    <= addr_cnt_i;
                      addr_cnt_val   <= Bus2IP_Addr(C_IPIF_AWIDTH-C_ADDR_OFFSET
                                                    to C_IPIF_AWIDTH - 1);
                  when "0010" =>
                      addr_suffix    <= addr_cnt_i(1 to C_ADDR_CNTR_WIDTH-1)
                                                                       & '0';
                      addr_cnt_val   <= '0' & Bus2IP_Addr(C_IPIF_AWIDTH-
                                        C_ADDR_OFFSET to C_IPIF_AWIDTH - 2);
                  when "0100" =>
                      addr_suffix <= addr_cnt_i(2 to C_ADDR_CNTR_WIDTH-1)
                                                                       & "00";
                      addr_cnt_val<= "00" & Bus2IP_Addr(C_IPIF_AWIDTH-
                                                        C_ADDR_OFFSET
                                                        to C_IPIF_AWIDTH - 3);
                  when "1000" =>
                      addr_suffix <= (others => '0');
                      addr_cnt_val<= (others => '0');
                  -- coverage off
		  when others=>
                      addr_suffix <= (others => '0');
                      addr_cnt_val<= (others => '0');
		  -- coverage on
                end case;
            end process ADDR_SUFFIX_PROCESS_64;
            ---------------------------------------------------------------------
            -- Create the  cycle_end_cnt
            ---------------------------------------------------------------------
            CYCLE_END_CNT_PROCESS_64 : process(Mem_width_bytes,
                                                reduced_low_be,
                                                reduced_high_be,
                                                reduced_16_0_be,
                                                reduced_16_1_be,
                                                reduced_16_2_be,
                                                reduced_16_3_be,
                                                Bus2IP_BE,
						Bus2IP_RdReq,
						Cycle_cnt_en,
						axi_trans_size_reg)
            variable Mem_width_bytes_rd_req : std_logic_vector(4 downto 0);
	    begin
                Mem_width_bytes_rd_req := Mem_width_bytes & Bus2IP_RdReq ;
		case Mem_width_bytes_rd_req is
                  when "00010" => -- 8 bit memory write access
		    Cycle_cnt_en_int <= Cycle_cnt_en;
                    if (Bus2IP_BE(0) = '1' and Bus2IP_BE(7)='1')then                    
                        cycle_end_cnt <= "111";
                    elsif (
                          (Bus2IP_BE(0) = '1' and Bus2IP_BE(6)='1') or
                          (Bus2IP_BE(1) = '1' and Bus2IP_BE(7)='1'))
                            then
                        cycle_end_cnt <= "110";
                    elsif (

                          (Bus2IP_BE(2) = '1' and Bus2IP_BE(7)='1') or
                          (Bus2IP_BE(1) = '1' and Bus2IP_BE(6)='1') or
                          (Bus2IP_BE(0) = '1' and Bus2IP_BE(5)='1')) then
                        cycle_end_cnt <= "101";
                    elsif (

                          (Bus2IP_BE(3) = '1' and Bus2IP_BE(7)='1') or
                          (Bus2IP_BE(2) = '1' and Bus2IP_BE(6)='1') or
                          (Bus2IP_BE(1) = '1' and Bus2IP_BE(5)='1') or
                          (Bus2IP_BE(0) = '1' and Bus2IP_BE(4)='1'))
                            then
                        cycle_end_cnt <= "100";
                    elsif (
                          (Bus2IP_BE(4) = '1' and Bus2IP_BE(7)='1') or
                          (Bus2IP_BE(3) = '1' and Bus2IP_BE(6)='1') or
                          (Bus2IP_BE(2) = '1' and Bus2IP_BE(5)='1') or
                          (Bus2IP_BE(1) = '1' and Bus2IP_BE(4)='1') or
                          (Bus2IP_BE(0) = '1' and Bus2IP_BE(3)='1'))
                           then
                        cycle_end_cnt <= "011";
                    elsif (
                          (Bus2IP_BE(5) = '1' and Bus2IP_BE(7)='1') or
                          (Bus2IP_BE(4) = '1' and Bus2IP_BE(6)='1') or
                          (Bus2IP_BE(3) = '1' and Bus2IP_BE(5)='1') or
                          (Bus2IP_BE(2) = '1' and Bus2IP_BE(4)='1') or
                          (Bus2IP_BE(1) = '1' and Bus2IP_BE(3)='1') or
                          (Bus2IP_BE(0) = '1' and Bus2IP_BE(2)='1'))
                          then
                        cycle_end_cnt <= "010";
                    elsif (Bus2IP_BE = "00000011" or Bus2IP_BE = "00001100" or
                           Bus2IP_BE = "00110000" or Bus2IP_BE = "11000000" or
                           Bus2IP_BE = "01100000" or Bus2IP_BE = "00011000" or
                           Bus2IP_BE = "00000110") then
                        cycle_end_cnt <= "001";
                    else
                        cycle_end_cnt <= "000";
                    end if;
                  when "00100" => -- 16 bit memory write access
                    Cycle_cnt_en_int <= Cycle_cnt_en;
		    if (
                        (reduced_16_0_be = '1' and reduced_16_3_be = '1')) then
                        cycle_end_cnt <= "011";
                    elsif (
                           (reduced_16_0_be = '1' and reduced_16_2_be = '1') or
                           (reduced_16_1_be = '1' and reduced_16_3_be = '1'))
                           then
                        cycle_end_cnt <= "010";
                    elsif (
                           (reduced_16_0_be = '1' and reduced_16_1_be = '1') or
                           (reduced_16_1_be = '1' and reduced_16_2_be = '1') or
                           (reduced_16_2_be = '1' and reduced_16_3_be = '1'))
                            then
                        cycle_end_cnt <= "001";
                    else
                        cycle_end_cnt <= "000";
                    end if;
                  when "01000" => -- 32 bit memory write access
                    Cycle_cnt_en_int <= Cycle_cnt_en;
		    if (
                        (reduced_low_be = '1' and reduced_high_be = '1')) then
                        cycle_end_cnt <= "001";
                    else
                        cycle_end_cnt <= "000";
                    end if;

                  when "00011" => -- 8 bit memory read access
            		  Cycle_cnt_en_int <= Cycle_cnt_en and or_reduce(axi_trans_size_reg);
			  if (axi_trans_size_reg = "01") then   -- size Half word
			      cycle_end_cnt <= "001";
                          elsif(axi_trans_size_reg = "10")then	-- size word
			      cycle_end_cnt <= "011";
			  elsif(axi_trans_size_reg = "11")then	-- size double word	
			      cycle_end_cnt <= "111"; 
			  else				        -- size byte - Default	
 			      cycle_end_cnt <= "000";
			  end if;
                  when "00101" => -- 16 bit memory read access - can be 16 bit, 32 bit or 64 bit
		          Cycle_cnt_en_int <= Cycle_cnt_en and axi_trans_size_reg(1);
			      
                  if (axi_trans_size_reg = "00" or 
			          axi_trans_size_reg = "01") then    -- Byte or HW word
            		      cycle_end_cnt <= "000";
		          elsif (axi_trans_size_reg = "10") then -- Word
            		      cycle_end_cnt <= "001";
		          else --if (axi_trans_size_reg = "11") then -- DWord
            		      cycle_end_cnt <= "011";
                  end if;
                  when "01001" => -- 32 bit memory read access - can be 16 bit, 32 bit or 64 bit
		          Cycle_cnt_en_int <= Cycle_cnt_en and axi_trans_size_reg(1);
			  if (axi_trans_size_reg = "00") then    -- Byte word
            		      cycle_end_cnt <= "000";
			  elsif (axi_trans_size_reg = "01") then -- HW word
            		      cycle_end_cnt <= "000";
		          elsif (axi_trans_size_reg = "10") then -- Word
            		      cycle_end_cnt <= "000";
		          else -- if (axi_trans_size_reg = "11") then -- DWord
            		      cycle_end_cnt <= "001";
                          end if;
                  -- coverage off
                  when others =>
                          Cycle_cnt_en_int <= '0'; -- 1/21/2013
              cycle_end_cnt <= "000" ;
                  -- coverage on
                end case;
            end process CYCLE_END_CNT_PROCESS_64;
        end generate CYCLE_END_CNT_64_GEN;

        -----------------------------------------------------------------------
        -- Create cycle termination logic for C_IPIF_DWIDTH  = 32.
        -----------------------------------------------------------------------

        CYCLE_END_CNT_32_GEN : if C_IPIF_DWIDTH  = 32 generate
        begin
            reduced_16_1_be <= or_reduce (Bus2IP_BE(2 to 3));
            reduced_16_0_be <= or_reduce (Bus2IP_BE(0 to 1));
            -------------------------------------------------------------------
            -- Create the address suffix.
            -------------------------------------------------------------------
            ADDR_SUFFIX_PROCESS_32: process(Mem_width_bytes,
                                            Bus2IP_Addr,
                                            addr_cnt_i)
            begin
                  --addr_suffix      <= (others => '0');
                  --addr_cnt_val     <= (others => '0');
                  case Mem_width_bytes is
                    when "0001" =>
                        addr_suffix  <= addr_cnt_i;
                        addr_cnt_val <= Bus2IP_Addr(C_IPIF_AWIDTH-C_ADDR_OFFSET
                                                      to C_IPIF_AWIDTH - 1);
                    when "0010" =>
                        addr_suffix  <= addr_cnt_i(1 to C_ADDR_CNTR_WIDTH-1) & '0';
                        addr_cnt_val <= '0' & Bus2IP_Addr(C_IPIF_AWIDTH-
                                          C_ADDR_OFFSET to C_IPIF_AWIDTH - 2);
                    -- coverage off
                    when others=>
                        addr_suffix  <= (others => '0');
                        addr_cnt_val <= (others => '0');
                    -- coverage on
                  end case;
            end process ADDR_SUFFIX_PROCESS_32;
            ---------------------------------------------------------------------
            -- Create the  cycle_end_cnt
            ---------------------------------------------------------------------
            MEM_ADDR_PROCESS: process(int_addr, Datawidth_match, addr_suffix, Cre_reg_en)
            begin

                  if (Datawidth_match = '0') or (Cre_reg_en = '1')then
                    mem_addr_cmb <= int_addr;
                  else
                    mem_addr_cmb <= int_addr(0 to C_IPIF_AWIDTH-
                                            C_ADDR_OFFSET-1) & addr_suffix ;
                 end if;
            end process MEM_ADDR_PROCESS;
          ---------------------------------------------------------------------
          -- Create the  cycle_end_cnt
          ---------------------------------------------------------------------
            CYCLE_END_CNT_PROCESS_32 : process(Mem_width_bytes,
                                               reduced_16_1_be,
                                               reduced_16_0_be,
                                               Bus2IP_BE,
					       Cycle_cnt_en,
					       Bus2IP_RdReq,
					       axi_trans_size_reg)
            variable Mem_width_bytes_rd_req : std_logic_vector(4 downto 0);
            begin
		Mem_width_bytes_rd_req := Mem_width_bytes & Bus2IP_RdReq ;
		case Mem_width_bytes_rd_req is
                    when "00010" => -- 8 bit memory width write
               		Cycle_cnt_en_int <= Cycle_cnt_en; -- 1/18/2013
                        if
                           (Bus2IP_BE(0) = '1' and Bus2IP_BE(3)='1')then
                            cycle_end_cnt <= "11";
                        elsif (
                               (Bus2IP_BE(0) = '1' and Bus2IP_BE(2)='1')  or
                               (Bus2IP_BE(1) = '1' and Bus2IP_BE(3)='1')) then
                            cycle_end_cnt <= "10";
                        elsif (Bus2IP_BE = "0011" or Bus2IP_BE = "1100" or
                               Bus2IP_BE = "0110") then
                            cycle_end_cnt <= "01";
                        else
                            cycle_end_cnt <= "00";
                        end if;
                    when "00100" => -- 16 bit memory width write
               		Cycle_cnt_en_int <= Cycle_cnt_en; -- 1/18/2013
			if (
                            (reduced_16_0_be = '1' and reduced_16_1_be= '1'))
                            then
                            cycle_end_cnt <= "01";
                        else
                            cycle_end_cnt <= "00";
                        end if;

                  when "00011" => -- 8 bit memory read access
            		  Cycle_cnt_en_int <= Cycle_cnt_en and or_reduce(axi_trans_size_reg);
			  if (axi_trans_size_reg = "01") then   -- size Half word
			      cycle_end_cnt <= "01";
                          elsif(axi_trans_size_reg = "10")then	-- size word
			      cycle_end_cnt <= "11";
			  else				        -- size byte - Default	
 			      cycle_end_cnt <= "00";
			  end if;
                  when "00101" => -- 16 bit memory read access - can be 8 bit, 16 bit, 32 bit
		          Cycle_cnt_en_int <= Cycle_cnt_en and axi_trans_size_reg(1);

			  --if (axi_trans_size_reg = "00" or 
			  --    axi_trans_size_reg = "01") then    -- Byte or HW word
            		  --    cycle_end_cnt <= "00";
		          --elsif (axi_trans_size_reg = "10") then -- Word
            		  --    cycle_end_cnt <= "01";
                          --end if;
			  if(axi_trans_size_reg = "10") then -- Word
			      cycle_end_cnt <= "01";
			  else
			      cycle_end_cnt <= "00";
			  end if;
                  when "01001" => -- 32 bit memory read access - can be 8 bit, 16 bit, 32 bit
		          Cycle_cnt_en_int <= Cycle_cnt_en and axi_trans_size_reg(1);
			  if (axi_trans_size_reg = "00") then    -- Byte word
            		      cycle_end_cnt <= "00";
			  elsif (axi_trans_size_reg = "01") then -- HW word
            		      cycle_end_cnt <= "00";
		          elsif (axi_trans_size_reg = "10") then -- Word
            		      cycle_end_cnt <= "00";
		          else -- if (axi_trans_size_reg = "11") then -- DWord
            		      cycle_end_cnt <= "01";
                          end if;

                    -- coverage off
                    when others =>
                            Cycle_cnt_en_int <= '0'; -- 1/21/2013
			    cycle_end_cnt <= "00" ;
                    -- coverage on
                end case;
            end process CYCLE_END_CNT_PROCESS_32;
        end generate CYCLE_END_CNT_32_GEN;

        -----------------------------------------------------------------------
        -- Instantiate the cycle_end_counter.
        -----------------------------------------------------------------------

        CYCLE_END_CNTR_I:entity emc_common_v3_0_5.ld_arith_reg
        generic map (
             C_ADD_SUB_NOT  => false,
             C_REG_WIDTH    => C_ADDR_CNTR_WIDTH,
             C_RESET_VALUE  => ZERO_CYCLE_CNT,
             C_LD_WIDTH     => C_ADDR_CNTR_WIDTH,
             C_LD_OFFSET    => 0,
             C_AD_WIDTH     => 1,
             C_AD_OFFSET    => 0
            )
        port map (
             CK             => Clk,
             RST            => Rst,
             Q              => cycle_cnt,
             LD             => cycle_end_cnt,
             AD             => "1",
             LOAD           => Cycle_cnt_ld, -- Cycle_cnt_ld,
             OP             => Cycle_cnt_en_int
             );

        Cycle_End <=  '1'  when (conv_integer(cycle_cnt) = 0) 
	              -- else
	              -- '1'  when psram_page_mode = '1'
		      else
                      '0';


    end generate DATAWIDTH_MATCH_GEN;
end imp;
-------------------------------------------------------------------------------
-- End of File addr_counter_mux.vhd.
-------------------------------------------------------------------------------


-------------------------------------------------------------------
-- (c) Copyright 1984 - 2013 Xilinx, Inc. All rights reserved.
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
-------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Filename:        mem_steer.vhd
-- Description:     This file contains the logic for steering the read data,
--                  write data and memory controls to the appropriate memory
--                  and data byte lane.
--
-- VHDL-Standard:   VHDL'93
-------------------------------------------------------------------------------
-- Structure:
--                  emc.vhd
--                      -- ipic_if.vhd
--                      -- addr_counter_mux.vhd
--                      -- counters.vhd
--                      -- select_param.vhd
--                      -- mem_state_machine.vhd
--                      -- mem_steer.vhd
--                      -- io_registers.vhd
-------------------------------------------------------------------------------
-- Author:          NSK
-- History:
-- NSK             02/01/08    First Version
-- ^^^^^^^^^^
-- This file is same as in version v3_01_c - no change in the logic of this
-- module. Deleted the history from version v3_01_c.
-- ~~~~~~
-- NSK         02/12/08    Updated
-- ^^^^^^^^
-- Removed the unused part of code (not supporting C_MAX_MEM_WIDTH = 64): -
-- 1. Deleted the generate block lebelled "WRITE_DATABE_MUX_64_GEN".
-- 2. Deleted the generate block lebelled "READ_DATA_64_GEN".
-- Removed the unused part of code (not supporting C_IPIF_DWIDTH = 64): -
-- 1. Deleted the generate block lebelled "READ_DATA_CE_64_GEN".
-- ~~~~~~~~
-- NSK         05/08/08    version v3_00_a
-- ^^^^^^^^
-- 1. This file is same as in version v3_02_a.
-- 2. Upgraded to version v3.00.a to have proper versioning to fix CR #472164.
-- 3. No change in design.

-- KSB         05/08/08    version v4_00_a
-- 1. Modified for Page mdoe read
-- 2. Modified for 64 Bit memory address align
-- ~~~~~~~~
-- KSB         22/05/10    version v5_00_a
-- 1. Modified for AXI EMC, PSRAM, Byte parity Memory Support
-- 2. Modified for AXI Slave burst interface
-- ~~~~~~~~
-- ~~~~~~
-- SK          25/10/10
-- ^^^^^^^^
-- 1. Added "parity_error_mem" in default condition in "MEM_CEN_STEER_PROCESS".
-- 2. In "PARITY_ACK_SYNC",
--    a.added "MEM2BUS_PARITY_ERR_P" by replacing priority logic
--    b.added "MEM2BUS_RD_ACK_P" by replacing priority logic
--    c.added "ADDR_ALIGN_READ_P" by replacing priority logic for addr_align_read
-- ~~~~~~
-- SK          24/11/10
-- ^^^^^^^^
-- 1. Added "ns_idle" signal to reset the address counter in mem_steer.vhd
-- ~~~~~~~~
-- SK          02/11/11    version v5_02_a
-- ^^^^^^^^
-- 1. Fixed CR#595758 and CR#606038
-- ~~~~~~~~
-- ~~~~~~
--  Sateesh 2011
-- ^^^^^^
--  -- Added Sync burst support for the Numonyx flash during read
-- ~~~~~~
-- ~~~~~~
--  SK 10/20/12
-- ^^^^^^
--  -- Fixed CR 672770 - BRESP signal is driven X during netlist simulation
--  -- Fixed CR 673491 - Flash transactions generates extra read cycle after the actual reads are over
-- ~~~~~~
-------------------------------------------------------------------------------
-- Naming Conventions:
--      active low signals:                     "*_n"
--      clock signals:                          "clk", "clk_div#", "clk_#x"
--      reset signals:                          "rst", "rst_n"
--      generics:                               "C_*"
--      user defined types:                     "*_TYPE"
--      state machine next state:               "*_ns"
--      state machine current state:            "*_cs"
--      combinatorial signals:                  "*_com"
--      pipelined or register delay signals:    "*_d#"
--      counter signals:                        "*cnt*"
--      clock enable signals:                   "*_ce"
--      internal version of output port         "*_i"
--      device pins:                            "*_pin"
--      ports:                                  - Names begin with Uppercase
--      processes:                              "*_PROCESS"
--      component instantiations:               "<ENTITY_>I_<#|FUNC>
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

use ieee.std_logic_misc.all;

-------------------------------------------------------------------------------
-- vcomponents package of the unisim library is used for the FDS, FDR and FDCE
-- component declarations
-------------------------------------------------------------------------------

library unisim;
use unisim.vcomponents.all;

-------------------------------------------------------------------------------
-- Definition of Generics:

--      C_NUM_BANKS_MEM             -- Number of Memory Banks
--      C_MAX_MEM_WIDTH             -- Maximum memory width of all memory banks
--      C_MIN_MEM_WIDTH             -- Minimum memory width (set to 8 bits)
--      C_IPIF_DWIDTH               -- Width of IPIF data bus
--      C_ADDR_CNTR_WIDTH           -- Width of address counter
--      C_GLOBAL_DATAWIDTH_MATCH    -- Indicates if datawidth matching is
--                                     implemented in any memory bank
--      C_GLOBAL_SYNC_MEM           -- Indicates if any memory bank is
--                                     synchronous
--
-- Definition of Ports:

-- EMC signals
--      Bus2IP_Data                 -- Processor Data Bus
--      Bus2IP_BE                   -- Processor Byte Enable
--      Bus2IP_Mem_CS               -- Memory Channel Chip Select
--
-- Memory state machine signals
--      Write_req_ack               -- Memory Write Acknowledge
--      Read_req_ack                -- Memory Read Address Acknowledge
--      Read_ack                    -- Memory Read Acknowledge
--      Read_data_en                -- Read Data Enable for read registers
--      Data_strobe                 -- Data Strobe signal
--      MSM_Mem_CEN                 -- Memory Chip Enable
--      MSM_Mem_OEN                 -- Memory Output Enable
--      MSM_Mem_WEN                 -- Memory Write Enable
--      Mem2Bus_WrAddrAck           -- Memory Write Address Acknowledge
--      Mem2Bus_WrAck               -- Memory Write Data Acknowledge
--      Mem2Bus_RdAddrAck           -- Memory Read Address Acknowledge
--      Mem2Bus_RdAck               -- Memory Read Data Acknowledge
--      Mem2Bus_Data                -- Memory Read Data

-- Select Param signals
--      Mem_width_bytes             -- Memory Device Width in Bytes
--      Synch_mem                   -- Synchronous Memory Control
--      Two_pipe_delay              -- Synchronous pipeline stages

-- Addr counter mux signals
--      Addr_cnt                    -- Address Count

-- IO Register signals
--      MemSteer_Mem_DQ_I           -- Memory Device Data In
--      MemSteer_Mem_DQ_O           -- Memory Device Data Out
--      MemSteer_Mem_DQ_T           -- Memory Device FPGA Impedance Control
--      MemSteer_Mem_DQ_prty_I      -- Memory Device Parity Input
--      MemSteer_Mem_DQ_prty_O      -- Memory Device Parity Output
--      MemSteer_Mem_DQ_prty_T      -- Memory Device Parity Impedance Control
--      MemSteer_Mem_CEN            -- Memory Device Chip Enable (Active Low)
--      MemSteer_Mem_OEN            -- Memory Device Output Enable
--      MemSteer_Mem_WEN            -- Memory Device Write Enable
--      MemSteer_Mem_QWEN           -- Memory Device Qualified Write Enabled
--      MemSteer_Mem_BEN            -- Memory Device Byte Enable
--      MemSteer_Mem_CE             -- Memory Device Chip Enable (Active High)
--      MemSteer_Mem_RNW            -- Memory Device Read/Write
--
--  Clock and reset
--      Clk                         -- System Clock
--      Rst                         -- System Reset
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Entity section
-------------------------------------------------------------------------------

entity mem_steer is
    generic (
        C_NUM_BANKS_MEM          : integer;
        C_MAX_MEM_WIDTH          : integer;
        C_MIN_MEM_WIDTH          : integer;
        C_IPIF_DWIDTH            : integer;
        C_IPIF_AWIDTH            : integer;
        C_PARITY_TYPE_MEMORY     : integer range 0 to 1;
        C_ADDR_CNTR_WIDTH        : integer range 1 to 5;
        C_GLOBAL_DATAWIDTH_MATCH : integer range 0 to 1;
        C_GLOBAL_SYNC_MEM        : integer range 0 to 1
    );
    port (
        -- Clock and reset
        Clk                      : in  std_logic;
        Rst                      : in  std_logic;

  -- EMC signals
        Bus2IP_Data              : in std_logic_vector(0 to C_IPIF_DWIDTH-1);
        Bus2IP_BE                : in std_logic_vector(0 to C_IPIF_DWIDTH/8-1);
        Bus2IP_Mem_CS            : in std_logic_vector(0 to C_NUM_BANKS_MEM-1);
        Bus2IP_RdReq             : in  std_logic;
        Bus2IP_Burst             : in  std_logic;


        -- Memory state machine signals
        Write_req_ack            : in  std_logic;
        Read_req_ack             : in  std_logic;
        Read_ack                 : in  std_logic;
        Read_data_en             : in  std_logic;
       -- Data_strobe              : in  std_logic;09-12-2012
        MSM_Mem_CEN              : in  std_logic;
        MSM_Mem_OEN              : in  std_logic;
        MSM_Mem_WEN              : in  std_logic;
        MSM_Mem_RNW              : in  std_logic;
        Mem2Bus_WrAddrAck        : out std_logic;
        Mem2Bus_WrAck            : out std_logic;
        Mem2Bus_RdAddrAck        : out std_logic;
        Mem2Bus_RdAck            : out std_logic;
        Mem2Bus_Data             : out std_logic_vector(0 to C_IPIF_DWIDTH -1);

        -- Select param signals
        Mem_width_bytes          : in  std_logic_vector(0 to 3);
        Synch_mem                : in  std_logic;
        Two_pipe_delay           : in  std_logic;
        single_transaction       : in  std_logic;

        -- Parity logic
        parity_error_mem         : out std_logic_vector(0 to 1);
        Parity_enable            : in  std_logic;
        Parity_type              : in  std_logic;
        Parity_err               : out std_logic;

        -- Addr counter mux signal
        Addr_cnt                 : in  std_logic_vector(0 to
                                                          C_ADDR_CNTR_WIDTH-1);
        Addr_align               : in  std_logic;
        Addr_align_rd            : in  std_logic;

        -- IO register signals
        MemSteer_Mem_DQ_I        : in  std_logic_vector
                                                (0 to C_MAX_MEM_WIDTH-1);
        MemSteer_Mem_DQ_O        : out std_logic_vector
                                                (0 to C_MAX_MEM_WIDTH-1);
        MemSteer_Mem_DQ_T        : out std_logic_vector
                                                (0 to C_MAX_MEM_WIDTH-1);

        MemSteer_Mem_DQ_prty_I   : in  std_logic_vector
                                                (0 to C_MAX_MEM_WIDTH/8-1);
        MemSteer_Mem_DQ_prty_O   : out std_logic_vector
                                                (0 to C_MAX_MEM_WIDTH/8-1);
        MemSteer_Mem_DQ_prty_T   : out std_logic_vector
                                                (0 to C_MAX_MEM_WIDTH/8-1);

        MemSteer_Mem_CEN         : out std_logic_vector
                                                (0 to C_NUM_BANKS_MEM-1);
        MemSteer_Mem_OEN         : out std_logic_vector
                                                (0 to C_NUM_BANKS_MEM-1);
        MemSteer_Mem_WEN         : out std_logic;
        MemSteer_Mem_QWEN        : out std_logic_vector
                                                (0 to C_MAX_MEM_WIDTH/8-1);
        MemSteer_Mem_BEN         : out std_logic_vector
                                                (0 to C_MAX_MEM_WIDTH/8-1);
        MemSteer_Mem_CE          : out std_logic_vector
                                                (0 to C_NUM_BANKS_MEM-1);
        MemSteer_Mem_RNW         : out std_logic;


        Bus2IP_RdReq_emc         : in std_logic;
        Bus2IP_WrReq_emc         : in std_logic;

  Write_req_data_ack       : in std_logic;
  Write_req_addr_ack       : in std_logic;
  address_strobe_c         : in std_logic;
        be_strobe_c     	 : in std_logic;
        data_strobe_c   	 : in std_logic;
        ns_idle                  : in std_logic;
        Linear_flash_rd_data_ack : in std_logic;
        Linear_flash_brst_rd_flag : in std_logic;
        last_addr : in std_logic; -- stop_oen
        stop_oen : in std_logic;
        cycle_end: in std_logic;
        axi_arsize: in std_logic_vector(2 downto 0);
        axi_trans_size_reg : in std_logic_vector(1 downto 0)
    );
end entity mem_steer;

-------------------------------------------------------------------------------
-- Architecture section
-------------------------------------------------------------------------------

architecture imp of mem_steer is

----------------------------------------------------------------------------------
-- below attributes are added to reduce the synth warnings in Vivado tool
attribute DowngradeIPIdentifiedWarnings: string;
attribute DowngradeIPIdentifiedWarnings of imp : architecture is "yes";
----------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Constant declarations
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Signal declarations
-------------------------------------------------------------------------------
signal mem_cen_cmb            : std_logic;
signal mem_oen_cmb            : std_logic;
signal read_ack_d             : std_logic_vector(0 to 5);
signal read_parity_d          : std_logic_vector(0 to 5);
signal addr_align_d           : std_logic_vector(0 to 5);
signal addr_align_read        : std_logic;
signal write_data             : std_logic_vector(0 to C_IPIF_DWIDTH-1);
signal write_data_cmb         : std_logic_vector(0 to C_MAX_MEM_WIDTH-1);
signal write_data_parity      : std_logic_vector(0 to C_MAX_MEM_WIDTH/8-1);
signal write_data_parity_cmb  : std_logic_vector(0 to C_MAX_MEM_WIDTH/8-1);
signal read_data              : std_logic_vector(0 to C_IPIF_DWIDTH-1);
signal read_parity            : std_logic_vector(0 to C_IPIF_DWIDTH/8-1);
signal write_data_d1          : std_logic_vector(0 to C_MAX_MEM_WIDTH-1);
signal write_data_d2          : std_logic_vector(0 to C_MAX_MEM_WIDTH-1);
signal write_data_parity_d1   : std_logic_vector(0 to C_MAX_MEM_WIDTH/8-1);
signal write_data_parity_d2   : std_logic_vector(0 to C_MAX_MEM_WIDTH/8-1);
signal mem_be_i               : std_logic_vector(0 to C_MAX_MEM_WIDTH/8-1);
signal mem_dq_t_cmb           : std_logic_vector(0 to 3);
signal mem_dq_parity_t_cmb    : std_logic_vector(0 to 3);
signal addr_cnt_d1            : std_logic_vector(0 to C_ADDR_CNTR_WIDTH-1);
signal addr_cnt_d2            : std_logic_vector(0 to C_ADDR_CNTR_WIDTH-1);
signal addr_cnt_d3            : std_logic_vector(0 to C_ADDR_CNTR_WIDTH-1);
signal addr_cnt_d4            : std_logic_vector(0 to C_ADDR_CNTR_WIDTH-1);
signal addr_cnt_sel           : std_logic_vector(0 to C_ADDR_CNTR_WIDTH-1);
signal mem_dqt_t_d            : std_logic;
signal mem_dqt_t_async        : std_logic;
signal mem_dqt_parity_t_d     : std_logic;
signal mem_dqt_parity_t_async : std_logic;
signal Read_req_ack_reg       : std_logic;
signal readreq_th_reset       : std_logic;
signal read_data_ce           : std_logic_vector(0 to 7);
signal read_data_en_d         : std_logic_vector(0 to 4);
signal read_data_en_sel       : std_logic;
signal read_data_cmb          : std_logic_vector(0 to C_MAX_MEM_WIDTH-1);
signal read_data_parity       : std_logic_vector(0 to C_MAX_MEM_WIDTH/8-1);
signal read_data_parity_cmb   : std_logic_vector(0 to C_IPIF_DWIDTH/8-1) := (OTHERS => '0');
signal read_data_parity_int   : std_logic_vector(0 to C_IPIF_DWIDTH/8-1) := (OTHERS => '0');
signal Bus2IP_Mem_CS_del      : std_logic_vector(0 to C_NUM_BANKS_MEM-1);
signal single_par_err : std_logic;
signal single_par_err_int : std_logic;
signal Mem2Bus_RdAck_int : std_logic;
signal Parity_err_int : std_logic;
signal cmb_ored,comp_int : std_logic;
signal arsize_int,arsize_int_e,mem_bytes_int: integer range 0 to 64;
-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------
function "and"  ( l : std_logic_vector; r : std_logic )
return std_logic_vector is
    variable rex : std_logic_vector(l'range);
begin
    rex := (others => r);
    return( l and rex );
end function "and";

function calc_parity  ( data_in : std_logic_vector (0 to 7);
                           Parity_type : std_logic
                        )
        return std_logic is
        variable parity_out_temp: std_logic;
begin
     if Parity_type = '0' then
        parity_out_temp := '0';
        for j in 0 to 7 loop
          parity_out_temp := parity_out_temp XOR data_in(j);
        end loop;
     elsif Parity_type = '1' then
        parity_out_temp := '1';
        for j in 0 to 7 loop
          parity_out_temp := NOT(parity_out_temp XOR data_in(j));
        end loop;
     else
        parity_out_temp := '0';
     end if;
     return parity_out_temp;
end function calc_parity;

function check_parity  ( data_in      : std_logic_vector (0 to 7);
                         parity_bit   : std_logic;
                         Parity_type  : std_logic
                        )
        return std_logic is
        variable parity_result   : std_logic;
        variable parity_out_temp : std_logic;
begin
     if Parity_type = '0' then
        parity_out_temp := '0';
        for j in 0 to 7 loop
          parity_out_temp := parity_out_temp XOR data_in(j);
        end loop;
     elsif Parity_type = '1' then
        parity_out_temp := '1';
        for j in 0 to 7 loop
          parity_out_temp := NOT(parity_out_temp XOR data_in(j));
        end loop;
     else
        parity_out_temp := '0';
     end if;

     if parity_bit= parity_out_temp then
          return '0';
     else
          return '1';
     end if;
end function check_parity;


-------------------------------------------------------------------------------
-- Begin Architecture
-------------------------------------------------------------------------------
signal addr_cnt_numonyx : std_logic;
--attribute IOB                          : string;
--attribute IOB of mem_dqt_t_d           : signal is "true";

begin  -- architecture imp

read_ack_d (5) <= '0';
addr_align_d (5) <= '0';
MemSteer_Mem_BEN   <= not mem_be_i;
MemSteer_Mem_RNW   <= MSM_Mem_RNW;
MemSteer_Mem_QWEN  <= not(mem_be_i and (not MSM_Mem_WEN));
MemSteer_Mem_WEN   <= MSM_Mem_WEN;
Mem2Bus_RdAck <= Mem2Bus_RdAck_int;

 ADDR_CNT_SYNCH_MODE : process(Clk)
    begin
       if(Clk'EVENT and Clk = '1')then
          if(Rst = '1')then
              addr_cnt_numonyx     <=  '0';
          elsif(Linear_flash_brst_rd_flag = '1') then
		if(Read_ack = '1') then
			addr_cnt_numonyx <= not(addr_cnt_numonyx);
                end if;
           end if;
     end if;
    end process ADDR_CNT_SYNCH_MODE;



-------------------------------------------------------------------------------
-- Memory chip enable control generation.
-------------------------------------------------------------------------------

mem_cen_cmb  <= MSM_Mem_CEN;

MEM_CEN_SINGLE_BANK_GEN: if C_NUM_BANKS_MEM = 1 generate
begin
     MemSteer_Mem_CEN(0)  <= mem_cen_cmb; -- 10-12-2012
       --CEN_P: process (stop_oen, synch_mem,mem_cen_cmb) is   -- 10-12-2012
       --begin
       --    if(synch_mem = '1') then
       --          MemSteer_Mem_CEN(0)  <= mem_cen_cmb or stop_oen;
       --    else
       --         MemSteer_Mem_CEN(0)  <= mem_cen_cmb;
       --    end if;
       --end process CEN_P;

    MemSteer_Mem_CE(0)   <= not mem_cen_cmb;
    parity_error_mem     <= "00";
end generate MEM_CEN_SINGLE_BANK_GEN;

-------------------------------------------------------------------------------
-- Generate chip enable signals for multiple memory banks.
-------------------------------------------------------------------------------

MEM_CEN_MULTI_BANK_GEN: if C_NUM_BANKS_MEM > 1 generate
begin

-------------------------------------------------------------------------------
-- Chip enable steer process steers the chip enable to the corresponding memory
-- bank.
-------------------------------------------------------------------------------

MEM_CEN_STEER_PROCESS: process(mem_cen_cmb, Bus2IP_Mem_CS)
    begin
        MemSteer_Mem_CEN  <= (others => '1');
        MemSteer_Mem_CE   <= (others => '0');
  parity_error_mem  <= (others => '0');
        for i in 0 to C_NUM_BANKS_MEM -1 loop
            if(Bus2IP_Mem_CS(i) = '1')then
                MemSteer_Mem_CEN(i)  <= mem_cen_cmb;
                MemSteer_Mem_CE(i)   <= not mem_cen_cmb;
                parity_error_mem     <= conv_std_logic_vector
                                                        (i,2);
            end if;
        end loop;
    end process MEM_CEN_STEER_PROCESS;
end generate MEM_CEN_MULTI_BANK_GEN;


-------------------------------------------------------------------------------
-- Memory output enable control generation.
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
------------------------- C_GLOBAL_SYNC_MEM = 1 -------------------------------
-------------------------------------------------------------------------------

SYNC_MEM_OEN : if C_GLOBAL_SYNC_MEM = 1 generate
    signal mem_oen_d            : std_logic_vector(0 to 2);
    signal mem_oen_sync         : std_logic;
begin
    mem_oen_d(0)  <= MSM_Mem_OEN;

-------------------------------------------------------------------------------
-- FDS primitive is used for output enable pipe generation.
-------------------------------------------------------------------------------

    OEN_PIPE_GEN : for i in 0 to 1 generate
    begin
        OEN_PIPE: FDS
            port map (
                Q   => mem_oen_d(i+1), --[out]
                C   => Clk,            --[in]
                D   => mem_oen_d(i),   --[in]
                S   => Rst             --[in]
                );
    end generate OEN_PIPE_GEN;
    mem_oen_sync  <= mem_oen_d(2) and mem_oen_d(1) when (Two_pipe_delay = '1') -- 1/3/2013
                     --mem_oen_d(2) when (Two_pipe_delay = '1') -- 1/3/2013
                     else
                     mem_oen_d(1) and mem_oen_d(0);
    mem_oen_cmb   <= mem_oen_d(0) when (Synch_mem = '0')
                     else
         mem_oen_sync;
end generate SYNC_MEM_OEN;

-------------------------------------------------------------------------------
-- Generate output enable signals when C_GLOBAL_STNC_MEM = 0.
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
------------------------- C_GLOBAL_SYNC_MEM = 0 -------------------------------
-------------------------------------------------------------------------------

ASYNC_MEM_OEN : if C_GLOBAL_SYNC_MEM = 0 generate
begin
    mem_oen_cmb  <= MSM_Mem_OEN;
end generate ASYNC_MEM_OEN;

-------------------------------------------------------------------------------
-- Generate output enable signals for multiple memory banks.
-------------------------------------------------------------------------------
MEM_OEN_SINGLE_BANK_GEN: if C_NUM_BANKS_MEM = 1 generate
begin
       --OEN_P: process (stop_oen, synch_mem,mem_oen_cmb) is   -- 10-12-2012
       --begin
       --    if(synch_mem = '1') then
       --          MemSteer_Mem_OEN(0)  <= mem_oen_cmb or stop_oen;
       --    else
       --         MemSteer_Mem_OEN(0)  <= mem_oen_cmb;
       --    end if;
       --end process OEN_P;
    MemSteer_Mem_OEN(0)  <= mem_oen_cmb; -- 10-12-2012
end generate MEM_OEN_SINGLE_BANK_GEN;

-------------------------------------------------------------------------------
-- Generate output enable signals for multiple memory banks.
-------------------------------------------------------------------------------

MEM_OEN_MULTI_BANK_GEN: if C_NUM_BANKS_MEM > 1 generate
begin

-------------------------------------------------------------------------------
-- Output enable steer process is used to steer the output enable to the
-- corresponding memory bank.
-------------------------------------------------------------------------------

    MEM_OEN_STEER_PROCESS: process(mem_oen_cmb, Bus2IP_Mem_CS)
    begin
        MemSteer_Mem_OEN  <= (others => '1');
        for i in 0 to C_NUM_BANKS_MEM -1 loop
            if(Bus2IP_Mem_CS(i) = '1')then
                MemSteer_Mem_OEN(i)  <= mem_oen_cmb;
            end if;
        end loop;
    end process MEM_OEN_STEER_PROCESS;

end generate MEM_OEN_MULTI_BANK_GEN;

-------------------------------------------------------------------------------
-- Address and Data ack generation.
-------------------------------------------------------------------------------

--Mem2Bus_WrAddrAck  <= Write_req_ack and (Bus2IP_WrReq_emc or single_transaction);
--Mem2Bus_WrAck      <= Write_req_ack ;
Mem2Bus_WrAddrAck  <= Write_req_addr_ack and
                      (Bus2IP_WrReq_emc or single_transaction or last_addr);
Mem2Bus_WrAck      <= Write_req_data_ack;

Mem2Bus_RdAddrAck  <= Read_req_ack;-- and Bus2IP_RdReq_emc;
read_ack_d(0)      <= Read_ack;
addr_align_d(0)    <= Addr_align_rd;

-------------------------------------------------------------------------------
-- Geneartion of Mem2Bus_RdAck signal when external memory bank has at least
-- one synchronous memory
-------------------------------------------------------------------------------

GSYNC_MEM_RDACK_GEN : if C_GLOBAL_SYNC_MEM = 1 generate
begin

    ---------------------------------------------------------------------------
    -- Read ack pipe generation.
    ---------------------------------------------------------------------------

    RDACK_PIPE_GEN_SYNC : for i in 0 to 3 generate
    begin
        readreq_th_reset <= ((not Bus2IP_RdReq) and ( not single_transaction))
                                                                or Rst;

    ---------------------------------------------------------------------------
    -- FDR primitive is used for read data ack pipe generation.
    ---------------------------------------------------------------------------
        RDACK_PIPE_SYNC: FDR
            port map (
                Q   => read_ack_d(i+1), --[out]
                C   => Clk,             --[in]
                D   => read_ack_d(i),   --[in]
                R   => readreq_th_reset       --[in]
                );
    end generate RDACK_PIPE_GEN_SYNC;

    NO_PARITY_ACK_SYNC : if (C_PARITY_TYPE_MEMORY=0) generate
        Parity_err <= '0';
    end generate NO_PARITY_ACK_SYNC;

   PARITY_ACK_SYNC : if (C_PARITY_TYPE_MEMORY/=0) generate

    ---------------------------------------------------------------------------
    -- ERR ack pipe generation.
    ---------------------------------------------------------------------------

    ERRACK_PIPE_GEN_SYNC : for i in 0 to 3 generate
    begin
    ---------------------------------------------------------------------------
    -- FDR primitive is used for read data ack pipe generation.
    ---------------------------------------------------------------------------
        ERRACK_PIPE_SYNC: FDR
            port map (
                Q   => read_parity_d(i+1), --[out]
                C   => Clk,             --[in]
                D   => read_parity_d(i),   --[in]
                R   => Rst              --[in]
                );
    end generate ERRACK_PIPE_GEN_SYNC;

    --Parity_err_int         <= read_parity_d(2) when (Synch_mem = '0') else
    --                      read_parity_d(3) when (Synch_mem = '1' and
    --                                            Two_pipe_delay = '0') else
    --                      read_parity_d(4) when (Two_pipe_delay = '1')
    --
    --                      else '0';	--10/25/2010

    COMP_INT_S:process (clk)
    begin
      if clk'event and clk = '1' then
        if arsize_int >= mem_bytes_int then
          comp_int <= '0';
        else
          comp_int <= '1';
        end if;
      end if;
    end process COMP_INT_S;

    MEM2BUS_PARITY_ERR_P: process(read_parity_d(1),
                                  read_parity_d(2),--10/25/2010
                                  read_parity_d(3),
                                  read_parity_d(4),
                                  Synch_mem,
                                  comp_int,
                                  Two_pipe_delay) is
    variable parity_sync_mem_pipe_delay: std_logic_vector(2 downto 0);
    begin
    parity_sync_mem_pipe_delay := comp_int & Synch_mem & Two_pipe_delay;
  case parity_sync_mem_pipe_delay is
    when "000" => Parity_err_int <= read_parity_d(2); -- async mem
    when "001" => Parity_err_int <= read_parity_d(2); -- async mem
    when "010" => Parity_err_int <= read_parity_d(2); --  and read_ack_d(3);--(3); -- sync mem + pipe delay
    when "011" => Parity_err_int <= read_parity_d(4); -- sync mem + pipe delay 2
    when "100" => Parity_err_int <= read_parity_d(1); -- async mem
    when "101" => Parity_err_int <= read_parity_d(1); -- async mem
    when "110" => Parity_err_int <= read_parity_d(1); --  and read_ack_d(3);--(3); -- sync mem + pipe delay
    when "111" => Parity_err_int <= read_parity_d(3); -- sync mem + pipe delay 2
    -- coverage off
    when others => Parity_err_int <= '0';
    -- coverage on
      end case;
    end process MEM2BUS_PARITY_ERR_P;

    arsize_int_e <= conv_integer(axi_arsize);
 PARITY_CALC_32 : if (C_IPIF_DWIDTH = 32) generate
    SIZE_SYN_32: process(CLK)
    begin
     if (clk'event and clk = '1') then
       case axi_arsize is
          when "000"  => 
               cmb_ored <= read_data_parity_cmb(0);
          when "001"  => 
               cmb_ored <= or_reduce(read_data_parity_cmb(0 to 1));
          when "010"  => 
               cmb_ored <= or_reduce(read_data_parity_cmb(0 to 3));
          when OTHERS  => 
               cmb_ored <= read_data_parity_cmb(0);
       end case;
     end if;
    end process SIZE_SYN_32;
 end generate PARITY_CALC_32;

 PARITY_CALC_64 : if (C_IPIF_DWIDTH = 64) generate
    SIZE_SYN_64: process(CLK)
    begin
     if (clk'event and clk = '1') then
       case axi_arsize is
          when "000"  => 
               cmb_ored <= read_data_parity_cmb(0);
          when "001"  => 
               cmb_ored <= or_reduce(read_data_parity_cmb(0 to 1));
          when "010"  => 
               cmb_ored <= or_reduce(read_data_parity_cmb(0 to 3));
          when "011"  => 
               cmb_ored <= or_reduce(read_data_parity_cmb(0 to 7));
          when OTHERS  => 
               cmb_ored <= read_data_parity_cmb(0);
       end case;
     end if;
    end process SIZE_SYN_64;
 end generate PARITY_CALC_64;

    --SIZE_CONV: process(arsize_int)
    --begin
    --   case arsize_int is
    --      when 0  => 
    --           arsize_bytes <= 1;
    --      when 1  => 
    --           arsize_bytes <= 2;
    --      when 2  => 
    --           arsize_bytes <= 4;
    --      when 3  => 
    --           arsize_bytes <= 8;
    --      when 4  => 
    --           arsize_bytes <= 16;
    --      when 5  => 
    --           arsize_bytes <= 32;
    --      when 6  => 
    --           arsize_bytes <= 64;
    --      when OTHERS  => 
    --           arsize_bytes <= 1;
    --   end case;
    --end process SIZE_CONV;

    INT_CONV_SIZE: process(arsize_int_e)
    begin
       case arsize_int_e is
          when 0  => 
               arsize_int <= 1;
          when 1  => 
               arsize_int <= 2;
          when 2  => 
               arsize_int <= 4;
          when 3  => 
               arsize_int <= 8;
          when OTHERS  => 
               arsize_int <= 1;
       end case;
    end process INT_CONV_SIZE;

    INT_CONV: process(Mem_width_bytes)
    begin
       case Mem_width_bytes is
          when "0001"  => 
               mem_bytes_int <= 1;
          when "0010"  => 
               mem_bytes_int <= 2;
          when "0100"  => 
               mem_bytes_int <= 4;
          when "1000"  => 
               mem_bytes_int <= 8;
          when OTHERS  => 
               mem_bytes_int <= 1;
       end case;
    end process INT_CONV;

-------------------------
   --process (read_data_parity_cmb)
   --begin
   --   for i in 0 to arsize_int loop       
   --      read_data_parity_int(i) <= read_data_parity_cmb(i);
   --   end loop;
   --end process;

   process (Clk)
   begin
         if (clk'event and clk = '1') then
            if (Rst = '1') then
               single_par_err <= '0';
            else 
              if (arsize_int >= mem_bytes_int) then
               single_par_err <= or_reduce(read_data_parity_cmb) and single_transaction;
              else
               --single_par_err <= or_reduce(read_data_parity_cmb(0 to arsize_int)) and single_transaction;
               single_par_err <= cmb_ored;
              end if; 
            end if; 
         end if; 
    end process;

   process (Clk)
   begin
         if (clk'event and clk = '1') then
            if (Rst = '1') then
               single_par_err_int <= '0';
            else 
               single_par_err_int <= Mem2Bus_RdAck_int and single_par_err;  
            end if; 
         end if; 
    end process;
   Parity_err <= Parity_err_int or single_par_err_int;
---------------------------

   --read_parity_d(0)   <= -- or_reduce(read_data_parity_cmb) and Read_ack;
   --                     (or_reduce(read_data_parity_cmb)) and (or_reduce(read_data_ce)) and (Bus2IP_RdReq) -- read_ack_d(3))
   --                     when Two_pipe_delay = '0'
   --                     else
   --                     (or_reduce(read_data_parity_cmb) and read_ack_d(4));

   --read_parity_d(0) <= 
   --     (or_reduce(read_data_parity_cmb)) and (or_reduce(read_data_ce)) and (Bus2IP_RdReq) when Two_pipe_delay = '0' else (or_reduce(read_data_parity_cmb) and read_ack_d(4)) 
   --       when arsize_int >= mem_bytes_int else 
   --     ((cmb_ored) and (or_reduce(read_data_ce)) and (Bus2IP_RdReq)) when Two_pipe_delay = '0' else ((cmb_ored) and read_ack_d(4));

   read_parity_d(0) <= 
        (or_reduce(read_data_parity_cmb)) and (or_reduce(read_data_ce)) and (Bus2IP_RdReq) when arsize_int >= mem_bytes_int else ((cmb_ored) and (or_reduce(read_data_ce)) and (Read_ack)) 
          when Two_pipe_delay = '0' else 
        (or_reduce(read_data_parity_cmb) and read_ack_d(4)) when arsize_int >= mem_bytes_int else ((cmb_ored) and read_ack_d(4));
   --process (read_data_ce,
   --         read_data_parity_cmb,
   --         Bus2IP_RdReq,
   --         read_ack_d,
   --         Two_pipe_delay,
   --         read_data_parity_int
   --    )
   --begin
   --    if (arsize_int >= mem_bytes_int) then
   --      if (Two_pipe_delay = '0') then 
   --        read_parity_d(0) <= (or_reduce(read_data_parity_cmb)) and (or_reduce(read_data_ce)) and (Bus2IP_RdReq); -- read_ack_d(3))
   --      else
   --        read_parity_d(0) <= (or_reduce(read_data_parity_cmb) and read_ack_d(4));
   --      end if;
   --    else
   --      if (Two_pipe_delay = '0') then 
   --        read_parity_d(0) <= (cmb_ored) and (or_reduce(read_data_ce)) and (Bus2IP_RdReq); -- read_ack_d(3))
   --      else
   --        read_parity_d(0) <= (cmb_ored) and read_ack_d(4);
   --      end if;
   --    end if;
   --end process;

end generate PARITY_ACK_SYNC;

    --Mem2Bus_RdAck  <= -- read_ack_d(2) when (Synch_mem = '0') else
                      -- read_ack_d(3) when (Synch_mem = '1' and
                      --                   Two_pipe_delay = '0') else
                      -- read_ack_d(4) when (Two_pipe_delay = '1')
                      -- else '0';		      -- 10/25/2010
    MEM2BUS_RD_ACK_P: process(read_ack_d(2),	  -- 10/25/2010
                              read_ack_d(3),
                              read_ack_d(4),
                              Synch_mem, 
			      addr_cnt_numonyx, 
			      Read_ack, 
			      Linear_flash_brst_rd_flag,
                              Two_pipe_delay) is
    variable sync_mem_pipe_delay: std_logic_vector(1 downto 0);
    begin
    sync_mem_pipe_delay := Synch_mem & Two_pipe_delay;
    case sync_mem_pipe_delay is
    when "00" => if (Linear_flash_brst_rd_flag = '0') then
			Mem2Bus_RdAck_int <= read_ack_d(2);
		 else
			Mem2Bus_RdAck_int <= addr_cnt_numonyx and Read_ack;
 		 end if;
    when "01" => if (Linear_flash_brst_rd_flag = '0') then
			Mem2Bus_RdAck_int <= read_ack_d(2);
		 else
			Mem2Bus_RdAck_int <= addr_cnt_numonyx and Read_ack;
		 end if;
    when "10" => if (Linear_flash_brst_rd_flag = '0') then
			Mem2Bus_RdAck_int <= read_ack_d(3);
		 else
			Mem2Bus_RdAck_int <= addr_cnt_numonyx and Read_ack;
		 end if;
    when "11" => if (Linear_flash_brst_rd_flag = '0') then
			Mem2Bus_RdAck_int <= read_ack_d(4);
		 else
			Mem2Bus_RdAck_int <= addr_cnt_numonyx and Read_ack;
		 end if;
    -- coverage off
    when others => Mem2Bus_RdAck_int <= '0';
    -- coverage on
      end case;
    end process MEM2BUS_RD_ACK_P;


    ADDR_ALIGN_PIPE_GEN : for i in 0 to 3 generate
    begin
    ---------------------------------------------------------------------------
    -- FDR primitive is used for Address align pipe generation.
    ---------------------------------------------------------------------------
        ALIGN_PIPE: FDR
        port map (
                Q   => addr_align_d(i+1), --[out]
                C   => Clk,               --[in]
                D   => addr_align_d(i),   --[in]
                R   => Rst                --[in]
               );
        end generate ADDR_ALIGN_PIPE_GEN;


    --addr_align_read      <= addr_align_d(0)when Synch_mem = '0'
    --                        else
    --                        addr_align_d(1) when Synch_mem = '1' and Two_pipe_delay = '0'
    --		              else
    --                        addr_align_d(2);--10/25/2010

    ADDR_ALIGN_READ_P: process(addr_align_d(0),	  -- 10/25/2010
                               addr_align_d(1),
             addr_align_d(2),
                               Synch_mem,
             Two_pipe_delay) is
    variable addr_align_syn_pipe_dly: std_logic_vector(1 downto 0);
    begin
    addr_align_syn_pipe_dly := Synch_mem & Two_pipe_delay;
  case addr_align_syn_pipe_dly is
    when "00" => addr_align_read <= addr_align_d(0);
    when "01" => addr_align_read <= addr_align_d(0);
    when "10" => addr_align_read <= addr_align_d(1);
    when "11" => addr_align_read <= addr_align_d(2);
    -- coverage off
    when others => addr_align_read <=addr_align_d(2);
    -- coverage on
  end case;
    end process ADDR_ALIGN_READ_P;
    ------------------------------

end generate GSYNC_MEM_RDACK_GEN;

-------------------------------------------------------------------------------
-- Geneartion of Mem2Bus_RdAck signal when external memory bank has only
-- asynchronous memory
-------------------------------------------------------------------------------

ASYNC_MEM_RDACK_GEN : if (C_GLOBAL_SYNC_MEM = 0) generate
begin
    ---------------------------------------------------------------------------
    -- Read ack pipe generation.
    ---------------------------------------------------------------------------
    RDACK_PIPE_GEN_ASYNC : for i in 0 to 1 generate

    begin
    ---------------------------------------------------------------------------
    -- FDR primitive is used for read data ack pipe generation.
    ---------------------------------------------------------------------------
        readreq_th_reset <= ((not Bus2IP_RdReq) and ( not single_transaction))
                                                                or Rst;
        RDACK_PIPE_ASYNC: FDR
            port map (
                Q   => read_ack_d(i+1), --[out]
                C   => Clk,             --[in]
                D   => read_ack_d(i),   --[in]
                R   => readreq_th_reset --[in]
                );
    end generate RDACK_PIPE_GEN_ASYNC;

    NO_ASYN_PARITY_ACK_SYNC : if (C_PARITY_TYPE_MEMORY=0) generate
        Parity_err <= '0';
    end generate NO_ASYN_PARITY_ACK_SYNC;

   PARITY_ACK : if (C_PARITY_TYPE_MEMORY/=0) generate

    ---------------------------------------------------------------------------
    -- ERR ack pipe generation.
    ---------------------------------------------------------------------------
    ERRACK_PIPE_GEN_ASYNC : for i in 0 to 1 generate
    begin
    ---------------------------------------------------------------------------
    -- FDR primitive is used for read data ack pipe generation.
    ---------------------------------------------------------------------------
        ERRACK_PIPE_ASYNC: FDR
            port map (
                Q   => read_parity_d(i+1), --[out]
                C   => Clk,             --[in]
                D   => read_parity_d(i),   --[in]
                R   => Rst              --[in]
                );
    end generate ERRACK_PIPE_GEN_ASYNC;

    Parity_err         <= read_parity_d(2);
   end generate PARITY_ACK;

--    Mem2Bus_RdAck      <= read_ack_d(2) when (Linear_flash_brst_rd_flag = '0') else (addr_cnt_numonyx and Read_ack) ;
    ASYNC_MEM_MEM2BUS_RDACK_P: process(read_ack_d(2), 
                                       Linear_flash_brst_rd_flag,
                                       cycle_end,
                                       Read_ack,
                                       axi_trans_size_reg,
                                       addr_cnt_numonyx )is 
    begin
     if(Linear_flash_brst_rd_flag = '0')then  
         Mem2Bus_RdAck_int      <= read_ack_d(2);
     else
         if(axi_trans_size_reg(1) = '0')then -- half word access
             Mem2Bus_RdAck_int      <= cycle_end and Read_ack;
         else
             Mem2Bus_RdAck_int      <= addr_cnt_numonyx and Read_ack;
         end if;
   end if; 
  end process ASYNC_MEM_MEM2BUS_RDACK_P;                          


    ---------------------------------------------------------------------------
    -- ADDR ALLIGN pipe generation.
    ---------------------------------------------------------------------------
    AALIGN_PIPE_GEN : for i in 0 to 1 generate
    begin
    ---------------------------------------------------------------------------
    -- FDR primitive is used for Address align pipe generation.
    ---------------------------------------------------------------------------
        AALIGN_PIPE: FDR
            port map (
                Q   => addr_align_d(i+1), --[out]
                C   => Clk,             --[in]
                D   => addr_align_d(i),   --[in]
                R   => Rst              --[in]
                );
    end generate AALIGN_PIPE_GEN;

    addr_align_read      <= addr_align_d(0);
end generate ASYNC_MEM_RDACK_GEN;

-------------------------------------------------------------------------------
-- Store the data coming from bus, as address ack and data ack is issued early,
-- and to make burst appear as continuous on memory side.
-------------------------------------------------------------------------------

DATA_STORE_GEN: for i in 0 to C_IPIF_DWIDTH - 1 generate
begin

-------------------------------------------------------------------------------
-- FDCE primitive is used for latching Bus2IP_Data when Data_strobe = 1.
-------------------------------------------------------------------------------

    WRDATA_REG: FDRE
        port map (
            Q   => write_data(i),     --[out]
            C   => Clk,               --[in]
            CE  => data_strobe_c,--Data_strobe,       --[in]
            D   => Bus2IP_Data(i),    --[in]
            R   => Rst                --[in]
            );

end generate DATA_STORE_GEN;

-------------------------------------------------------------------------------
-- When one of the memory bank has different data width than OPB/MCH data
-- width, data steering logic is required.
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
------------------------- C_GLOBAL_DATAWIDTH_MATCH = 1 ------------------------
-------------------------------------------------------------------------------

WRITE_DATABE_MUX_GEN: if C_GLOBAL_DATAWIDTH_MATCH = 1 generate
begin

-------------------------------------------------------------------------------
-- Write data path
-------------------------------------------------------------------------------
-- Write data mux is used to multiplex write_data out to memories. This will
-- vary on whether the max memory data width is 8, 16, 32 or 64. Separate
-- generate statements are used for each of them. If the memory is synchronous,
-- the BEs assert at the same time. However, the write data  goes out one or
-- two clocks later (depending on Two_pipe_delay). Therefore, separate
-- processes are used for the write data and byte enables.
-------------------------------------------------------------------------------
WRITE_DATABE_MUX_64_GEN: if (C_MAX_MEM_WIDTH=64 and C_IPIF_DWIDTH=64) generate
begin

-------------------------------------------------------------------------------
-- Write data path for 64 bit maximum memory width. Write data mux process is
-- used to multiplex the write_data depending on the addr_cnt.
-------------------------------------------------------------------------------

    WRITE_DATA_MUX_PROCESS_64: process(Mem_width_bytes, Addr_cnt, write_data)
    begin
                    write_data_cmb   <= (others => '0');
                    write_data_parity_cmb <= (others => '0');
       case Mem_width_bytes is
          when "0001"  =>
             for i in 0 to C_IPIF_DWIDTH/C_MIN_MEM_WIDTH -1 loop
                if Addr_cnt = conv_std_logic_vector(i, C_ADDR_CNTR_WIDTH) then

                    write_data_cmb(0 to C_MIN_MEM_WIDTH-1) <=
                       write_data(i*C_MIN_MEM_WIDTH to
                                  i*C_MIN_MEM_WIDTH + C_MIN_MEM_WIDTH-1);
                end if;
             end loop;
          when "0010" =>
              for i in 0 to C_IPIF_DWIDTH/(C_MIN_MEM_WIDTH*2) -1 loop
                if Addr_cnt = conv_std_logic_vector(i, C_ADDR_CNTR_WIDTH) then

                    write_data_cmb(0 to 2*C_MIN_MEM_WIDTH-1) <=
                       write_data(i*2*C_MIN_MEM_WIDTH to
                                  i*2*C_MIN_MEM_WIDTH + 2*C_MIN_MEM_WIDTH-1);
                end if;
              end loop;
          when "0100" =>
              for i in 0 to C_IPIF_DWIDTH/(C_MIN_MEM_WIDTH*4) -1 loop
                if Addr_cnt = conv_std_logic_vector(i, C_ADDR_CNTR_WIDTH) then

                    write_data_cmb(0 to 4*C_MIN_MEM_WIDTH-1) <=
                        write_data(i*4*C_MIN_MEM_WIDTH to
                                   i*4*C_MIN_MEM_WIDTH + 4*C_MIN_MEM_WIDTH-1);
                end if;
              end loop;
          when "1000" =>

                if Addr_cnt = conv_std_logic_vector(0, C_ADDR_CNTR_WIDTH) then

                    write_data_cmb(0 to C_MAX_MEM_WIDTH-1) <=
                                        write_data(0 to C_MAX_MEM_WIDTH-1);
                end if;

          when others =>
                    write_data_cmb <= (others => '0');
       end case;
    end process WRITE_DATA_MUX_PROCESS_64;

-------------------------------------------------------------------------------
-- Write data path for 64 bit maximum memory width. Write byte enable mux
-- process is used to multiplex the byte enable depending on the addr_cnt.
-------------------------------------------------------------------------------

    WRITE_BE_MUX_PROCESS_64: process(Mem_width_bytes, Addr_cnt, Bus2IP_BE)
    begin
                   mem_be_i      <= (others => '0');
       case Mem_width_bytes is
          when "0001"  =>
             for i in 0 to C_IPIF_DWIDTH/C_MIN_MEM_WIDTH -1 loop
               if Addr_cnt = conv_std_logic_vector(i, C_ADDR_CNTR_WIDTH) then
                   mem_be_i(0 to C_MIN_MEM_WIDTH/8-1) <=
                      Bus2IP_BE(i*C_MIN_MEM_WIDTH/8 to
                                i*C_MIN_MEM_WIDTH/8 + C_MIN_MEM_WIDTH/8-1);
               end if;
             end loop;
          when "0010" =>
             for i in 0 to C_IPIF_DWIDTH/(C_MIN_MEM_WIDTH*2) -1 loop
               if Addr_cnt = conv_std_logic_vector(i, C_ADDR_CNTR_WIDTH) then
                   mem_be_i(0 to 2*C_MIN_MEM_WIDTH/8-1) <=
                      Bus2IP_BE(i*2*C_MIN_MEM_WIDTH/8 to
                                i*2*C_MIN_MEM_WIDTH/8 + 2*C_MIN_MEM_WIDTH/8-1);
               end if;
             end loop;
          when "0100" =>
             for i in 0 to C_IPIF_DWIDTH/(C_MIN_MEM_WIDTH*4) -1 loop
               if Addr_cnt = conv_std_logic_vector(i, C_ADDR_CNTR_WIDTH) then
                   mem_be_i(0 to 4*C_MIN_MEM_WIDTH/8-1) <=
                      Bus2IP_BE(i*4*C_MIN_MEM_WIDTH/8 to
                                i*4*C_MIN_MEM_WIDTH/8 + 4*C_MIN_MEM_WIDTH/8-1);
               end if;
             end loop;
          when "1000" =>
               if Addr_cnt = conv_std_logic_vector(0, C_ADDR_CNTR_WIDTH) then
                   mem_be_i(0 to C_MIN_MEM_WIDTH-1) <=
                      Bus2IP_BE(0 to C_MIN_MEM_WIDTH-1);
               end if;
          when others =>
                   mem_be_i   <= (others => '0');
       end case;
    end process WRITE_BE_MUX_PROCESS_64;

    WRITE_PARITY_EN_64_MAX : if (C_PARITY_TYPE_MEMORY/=0) generate
    -- 
    -- WRITE_PARITY_MUX_PROCESS_64: process(Parity_type,
    --                                      Addr_cnt,
    --                                      write_data)
    -- begin
    -- 
    --     write_data_parity_cmb   <= (others => '0');
    -- 
    --     for i in 0 to 7 loop
    --        if Addr_cnt = conv_std_logic_vector(i, C_ADDR_CNTR_WIDTH) then
    --            write_data_parity_cmb (i)<=
    --                     calc_parity(write_data(i*C_MIN_MEM_WIDTH to
    --                          i*C_MIN_MEM_WIDTH + C_MIN_MEM_WIDTH-1),
    --                          Parity_type);
    --        end if;
    --     end loop;
    -- 
    -- 
    --     end process WRITE_PARITY_MUX_PROCESS_64;
              WRITE_DATA_PARITY_PROCESS_64: process(Mem_width_bytes, 
                                                    Addr_cnt, 
                                                    write_data_parity_cmb,
                                                    Parity_type,
                                                    write_data,
						    write_data_cmb
                                                    ) is
              begin
                    write_data_parity_cmb   <= (others => '0');
                    --------------
              case Mem_width_bytes is
                    when "0001"  => -- 8 bit memory (need only one Parity Enable bit to active)
                       --for i in 0 to C_IPIF_DWIDTH/(C_MIN_MEM_WIDTH*4) -1 loop
                       --  if Addr_cnt = conv_std_logic_vector(i, C_ADDR_CNTR_WIDTH) then
                       --      write_data_parity_cmb(0) <=
                       --                 calc_parity(write_data_cmb(i*C_MIN_MEM_WIDTH to
                       --                                            i*C_MIN_MEM_WIDTH + C_MIN_MEM_WIDTH-1),
                       --                                            Parity_type);                
                       --      end if;
                       --end loop;
                       write_data_parity_cmb(0) <= calc_parity(write_data_cmb(0 to C_MIN_MEM_WIDTH-1),Parity_type);
                    when "0010" => -- 16 bit memory (need only two Parity Enable bits to active)
                       --for i in 0 to C_IPIF_DWIDTH/(C_MIN_MEM_WIDTH*2) -1 loop
                       --  if Addr_cnt = conv_std_logic_vector(i, C_ADDR_CNTR_WIDTH) then
                       --      write_data_parity_cmb(i) <=
                       --                 calc_parity(write_data_cmb(i*C_MIN_MEM_WIDTH to
                       --                                            i*C_MIN_MEM_WIDTH + C_MIN_MEM_WIDTH-1),
                       --                                            Parity_type);
                       --  end if;
                       --end loop;
		      for i in 0 to 1 loop
				write_data_parity_cmb (i)<=                           
  					 calc_parity(write_data_cmb(i*C_MIN_MEM_WIDTH to  
						                    i*C_MIN_MEM_WIDTH + C_MIN_MEM_WIDTH-1), 
							            Parity_type);
	  	      end loop;
                    when "0100" => -- 32 bit memory (need four Parity Enable bits to active)
                       --for i in 0 to C_IPIF_DWIDTH/(C_MIN_MEM_WIDTH*4) -1 loop
                       --  if Addr_cnt = conv_std_logic_vector(i, C_ADDR_CNTR_WIDTH) then
                       --     write_data_parity_cmb(i) <=
                       --                 calc_parity(write_data_cmb(i*C_MIN_MEM_WIDTH to
                       --                                            i*C_MIN_MEM_WIDTH + C_MIN_MEM_WIDTH-1),
                       --                                            Parity_type);
                       --  end if;
                       --end loop;
			for i in 0 to 3 loop
				write_data_parity_cmb (i)<=                           
                                 calc_parity(write_data_cmb(i*C_MIN_MEM_WIDTH to  
                                                            i*C_MIN_MEM_WIDTH + C_MIN_MEM_WIDTH-1), 
                                                            Parity_type);
			end loop;
                    
                    when "1000" => -- 64 bit memory (need eight Parity Enable bits to active)
                       --for i in 0 to C_IPIF_DWIDTH/C_MIN_MEM_WIDTH -1 loop
                       --  if Addr_cnt = conv_std_logic_vector(i, C_ADDR_CNTR_WIDTH) then
                       --     write_data_parity_cmb(i) <=
                       --                 calc_parity(write_data_cmb(i*C_MIN_MEM_WIDTH to
                       --                                            i*C_MIN_MEM_WIDTH + C_MIN_MEM_WIDTH-1),
                       --                                            Parity_type);
                       --  end if;
                       --end loop;
			for i in 0 to 7 loop
				write_data_parity_cmb (i)<=                           
                                 calc_parity(write_data_cmb(i*C_MIN_MEM_WIDTH to  
                                                            i*C_MIN_MEM_WIDTH + C_MIN_MEM_WIDTH-1), 
                                                            Parity_type);
			end loop;
                    
                    
                    
                    -- coverage off
              when others =>
                             write_data_parity_cmb <= (others => '0');
                    -- coverage on
                    end case;
              --------------
          end process WRITE_DATA_PARITY_PROCESS_64;

    end generate WRITE_PARITY_EN_64_MAX;

 end generate WRITE_DATABE_MUX_64_GEN;

-------------------------------------------------------------------------------
-- Write data path
-------------------------------------------------------------------------------
-- Write data mux is used to multiplex write_data out to memories. This will
-- vary on whether the max memory data width is 8, 16, 32 or 64. Separate
-- generate statements are used for each of them. If the memory is synchronous,
-- the BEs assert at the same time. However, the write data  goes out one or
-- two clocks later (depending on Two_pipe_delay). Therefore, separate
-- processes are used for the write data and byte enables.
-------------------------------------------------------------------------------


-------------------------------------------------------------------------------
-- Write data byte enable generation for 32 bit.
-------------------------------------------------------------------------------

WRITE_DATABE_MUX_32_GEN: if (C_MAX_MEM_WIDTH=32) generate
begin

-------------------------------------------------------------------------------
-- Write data path for 32 bit maximum memory width. Write data mux process is
-- used to multiplex the write_data depending on the addr_cnt.
-------------------------------------------------------------------------------

    WRITE_DATA_MUX_PROCESS_32: process(Mem_width_bytes, Addr_cnt, write_data)
    begin
                   write_data_cmb   <= (others => '0');
          case Mem_width_bytes(1 to 3) is
          when "001"  =>
             for i in 0 to C_IPIF_DWIDTH/C_MIN_MEM_WIDTH -1 loop
               if Addr_cnt = conv_std_logic_vector(i, C_ADDR_CNTR_WIDTH) then
                   write_data_cmb(0 to C_MIN_MEM_WIDTH-1) <=
                      write_data(i*C_MIN_MEM_WIDTH to
                                 i*C_MIN_MEM_WIDTH + C_MIN_MEM_WIDTH-1);
               end if;
             end loop;
          when "010" =>
             for i in 0 to C_IPIF_DWIDTH/(C_MIN_MEM_WIDTH*2) -1 loop
               if Addr_cnt = conv_std_logic_vector(i, C_ADDR_CNTR_WIDTH) then
                   write_data_cmb(0 to 2*C_MIN_MEM_WIDTH-1) <=
                      write_data(i*2*C_MIN_MEM_WIDTH to
                                 i*2*C_MIN_MEM_WIDTH + 2*C_MIN_MEM_WIDTH-1);
               end if;
             end loop;
          when "100" =>
             for i in 0 to C_IPIF_DWIDTH/(C_MIN_MEM_WIDTH*4) -1 loop
               if Addr_cnt = conv_std_logic_vector(i, C_ADDR_CNTR_WIDTH) then
                   write_data_cmb(0 to 4*C_MIN_MEM_WIDTH-1) <=
                      write_data(i*4*C_MIN_MEM_WIDTH to
                                 i*4*C_MIN_MEM_WIDTH + 4*C_MIN_MEM_WIDTH-1);

               end if;
             end loop;
          when others =>
                   write_data_cmb <= (others => '0');
       end case;
    end process WRITE_DATA_MUX_PROCESS_32;

-------------------------------------------------------------------------------
-- Write data path for 32 Bit maximum memory width. Write byte enable mux
-- process is used to multiplex the byte enable depending on the addr_cnt.
-------------------------------------------------------------------------------

    WRITE_BE_MUX_PROCESS_32: process(Mem_width_bytes, Addr_cnt, Bus2IP_BE)
    begin
                   mem_be_i      <= (others => '0');
          case Mem_width_bytes(1 to 3) is
          when "001"  =>
             for i in 0 to C_IPIF_DWIDTH/C_MIN_MEM_WIDTH -1 loop
               if Addr_cnt = conv_std_logic_vector(i, C_ADDR_CNTR_WIDTH) then
                   mem_be_i(0 to C_MIN_MEM_WIDTH/8-1) <=
                      Bus2IP_BE(i*C_MIN_MEM_WIDTH/8 to
                                i*C_MIN_MEM_WIDTH/8 + C_MIN_MEM_WIDTH/8-1);
               end if;
             end loop;
          when "010" =>
             for i in 0 to C_IPIF_DWIDTH/(C_MIN_MEM_WIDTH*2) -1 loop
               if Addr_cnt = conv_std_logic_vector(i, C_ADDR_CNTR_WIDTH) then
                   mem_be_i(0 to 2*C_MIN_MEM_WIDTH/8-1) <=
                      Bus2IP_BE(i*2*C_MIN_MEM_WIDTH/8 to
                                i*2*C_MIN_MEM_WIDTH/8 + 2*C_MIN_MEM_WIDTH/8-1);
               end if;
             end loop;
          when "100" =>
             for i in 0 to C_IPIF_DWIDTH/(C_MIN_MEM_WIDTH*4) -1 loop
               if Addr_cnt = conv_std_logic_vector(i, C_ADDR_CNTR_WIDTH) then
                   mem_be_i(0 to 4*C_MIN_MEM_WIDTH/8-1) <=
                      Bus2IP_BE(i*4*C_MIN_MEM_WIDTH/8 to
                                i*4*C_MIN_MEM_WIDTH/8 + 4*C_MIN_MEM_WIDTH/8-1);
               end if;
             end loop;
          when others =>
                  mem_be_i   <= (others => '0');
       end case;
    end process WRITE_BE_MUX_PROCESS_32;

-----------------------------------**--
 WRITE_PARITY_EN_32_MAX : if (C_PARITY_TYPE_MEMORY/=0) generate
 -- 
 --    WRITE_PARITY_MUX_PROCESS_32: process(Parity_type, Addr_cnt, write_data)
 --    begin
 -- 
 --        write_data_parity_cmb   <= (others => '0');
 --  ----------
 --        for i in 0 to 3 loop
 --           if Addr_cnt = conv_std_logic_vector(i, C_ADDR_CNTR_WIDTH) then
 --               write_data_parity_cmb (i)<=
 --                        calc_parity(write_data(i*C_MIN_MEM_WIDTH to
 --                             i*C_MIN_MEM_WIDTH + C_MIN_MEM_WIDTH-1),
 --                             Parity_type);
 --           end if;
 --        end loop;
 --  ----------
 --        end process WRITE_PARITY_MUX_PROCESS_32;
   
          -- WRITE_DATA_PARITY_PROCESS_32: process(Mem_width_bytes, 
          --                                       Addr_cnt, 
          --                                       write_data_parity_cmb,
          --                                       Parity_type
          --                                       ) is
          -- begin
          --       write_data_parity_cmb   <= (others => '0');
          --       --------------
          -- case Mem_width_bytes(1 to 3) is
          --       when "001"  => -- 8 bit memory (need only one Parity Enable bit to active)
          --          for i in 0 to C_IPIF_DWIDTH/(C_MIN_MEM_WIDTH*4) -1 loop
          --            if Addr_cnt = conv_std_logic_vector(i, C_ADDR_CNTR_WIDTH) then
          --                write_data_parity_cmb(0) <=
          --                       calc_parity(write_data_cmb(i*C_MIN_MEM_WIDTH to
          --                                                  i*C_MIN_MEM_WIDTH + C_MIN_MEM_WIDTH-1),
          --                                                  Parity_type);                
          --            end if;
          --          end loop;
          --       
          --       when "010" => -- 16 bit memory (need only two Parity Enable bits to active)
          --          for i in 0 to C_IPIF_DWIDTH/(C_MIN_MEM_WIDTH*2) -1 loop
          --            if Addr_cnt = conv_std_logic_vector(i, C_ADDR_CNTR_WIDTH) then
          --                write_data_parity_cmb(i) <=
          --                       calc_parity(write_data_cmb(i*C_MIN_MEM_WIDTH to
          --                                                  i*C_MIN_MEM_WIDTH + C_MIN_MEM_WIDTH-1),
          --                                                  Parity_type);
          --            end if;
          --          end loop;
          --       when "100" => -- 32 bit memory (need four Parity Enable bits to active)
          --          for i in 0 to C_IPIF_DWIDTH/C_MIN_MEM_WIDTH -1 loop
          --            if Addr_cnt = conv_std_logic_vector(i, C_ADDR_CNTR_WIDTH) then
          --               write_data_parity_cmb(i) <=
          --                       calc_parity(write_data_cmb(i*C_MIN_MEM_WIDTH to
          --                                                  i*C_MIN_MEM_WIDTH + C_MIN_MEM_WIDTH-1),
          --                                                  Parity_type);
          --            end if;
          --          end loop;
          --       -- coverage off
          -- when others =>
          --                write_data_parity_cmb <= (others => '0');
          --       -- coverage on
          --       end case;
          -- --------------
          -- end process WRITE_DATA_PARITY_PROCESS_32;


    WRITE_DATA_PARITY_PROCESS_32: process(Mem_width_bytes, 
                                          Addr_cnt, 
                                          write_data_cmb,
                                          Parity_type,
                                          write_data
                                          ) is
    -----
    begin
    -----
    write_data_parity_cmb   <= (others => '0');
    --------------
    case Mem_width_bytes(1 to 3) is
          ------------
          when "001" => -- 8 bit memory (need only one Parity Enable bit to active)
             --for i in 0 to C_IPIF_DWIDTH/(C_MIN_MEM_WIDTH*4) -1 loop
             --  if Addr_cnt = conv_std_logic_vector(i, C_ADDR_CNTR_WIDTH) then
             --      for j in 0  to 1 loop
             --      write_data_parity_cmb(0) <=
             --                 calc_parity(write_data((i*C_MIN_MEM_WIDTH*2 + j*C_MIN_MEM_WIDTH) to
             --                                          (i*C_MIN_MEM_WIDTH*2 + j*C_MIN_MEM_WIDTH + C_MIN_MEM_WIDTH-1)),
             --                                        Parity_type);                    
             --      end loop;
             --end if;
             --end loop;
             write_data_parity_cmb(0) <= calc_parity(write_data_cmb(0 to C_MIN_MEM_WIDTH-1),Parity_type);
          ------------   
          when "010" => -- 16 bit memory (need only two Parity Enable bits to active)
             --for i in 0 to C_IPIF_DWIDTH/(C_MIN_MEM_WIDTH*2) -1 loop
             --  if Addr_cnt = conv_std_logic_vector(i, C_ADDR_CNTR_WIDTH) then
             --     for j in 0  to 1 loop
             --      write_data_parity_cmb(j) <=
             --                   calc_parity(write_data((i*C_MIN_MEM_WIDTH*2 + j*C_MIN_MEM_WIDTH) to
             --                                          (i*C_MIN_MEM_WIDTH*2 + j*C_MIN_MEM_WIDTH + C_MIN_MEM_WIDTH-1)),
             --                                          Parity_type);
             --  
             --     end loop; 
             --  end if;
             --end loop;
             for i in 0 to 1 loop
			write_data_parity_cmb (i)<=                           
                                 calc_parity(write_data_cmb(i*C_MIN_MEM_WIDTH to  
                                                            i*C_MIN_MEM_WIDTH + C_MIN_MEM_WIDTH-1), 
                                                            Parity_type);
	     end loop;
          ------------
          when "100" => -- 32 bit memory (need four Parity Enable bits to active)
             --for i in 0 to C_IPIF_DWIDTH/(C_MIN_MEM_WIDTH) -1 loop
             --  if Addr_cnt = conv_std_logic_vector(i, C_ADDR_CNTR_WIDTH) then
             --     --for j in 0  to 3 loop
             --      write_data_parity_cmb(i) <=
             --                   calc_parity(write_data((i*C_MIN_MEM_WIDTH) to
             --                                          (i*C_MIN_MEM_WIDTH + C_MIN_MEM_WIDTH-1)),
             --                                          Parity_type);
             --  
             --     --end loop; 
             --  end if;
             --end loop;
             for i in 0 to 3 loop
			write_data_parity_cmb (i)<=                           
                                 calc_parity(write_data_cmb(i*C_MIN_MEM_WIDTH to  
                                                            i*C_MIN_MEM_WIDTH + C_MIN_MEM_WIDTH-1), 
                                                            Parity_type);
	     end loop;
          ------------
          -- coverage off
          when others =>
                   write_data_parity_cmb <= (others => '0');
          -- coverage on
          ------------
          end case;
    --------------
    end process WRITE_DATA_PARITY_PROCESS_32;
    --------------------------------------

 end generate WRITE_PARITY_EN_32_MAX;
 -----------------------------------**--
end generate WRITE_DATABE_MUX_32_GEN;

-------------------------------------------------------------------------------
-- Write data byte enable generation for 16 bit.
-------------------------------------------------------------------------------

WRITE_DATABE_MUX_16_GEN: if C_MAX_MEM_WIDTH=16 generate
begin

-------------------------------------------------------------------------------
-- Write data path for 16 bit maximum memory width. Write data mux process is
-- used to multiplex the write_data depending on the addr_cnt.
-------------------------------------------------------------------------------

    WRITE_DATA_MUX_PROCESS_16: process(Mem_width_bytes, Addr_cnt, write_data)
    begin
          write_data_cmb   <= (others => '0');
          --------------
    case Mem_width_bytes(2 to 3) is
          when "01"  =>
             for i in 0 to C_IPIF_DWIDTH/C_MIN_MEM_WIDTH -1 loop
               if Addr_cnt = conv_std_logic_vector(i, C_ADDR_CNTR_WIDTH) then
                   write_data_cmb(0 to C_MIN_MEM_WIDTH-1) <=
                      write_data(i*C_MIN_MEM_WIDTH to
                                 i*C_MIN_MEM_WIDTH + C_MIN_MEM_WIDTH-1);
               end if;
             end loop;
          when "10" =>
             for i in 0 to C_IPIF_DWIDTH/(C_MIN_MEM_WIDTH*2) -1 loop
               if Addr_cnt = conv_std_logic_vector(i, C_ADDR_CNTR_WIDTH) then
                   write_data_cmb(0 to 2*C_MIN_MEM_WIDTH-1) <=
                      write_data(i*2*C_MIN_MEM_WIDTH to
                                 i*2*C_MIN_MEM_WIDTH + 2*C_MIN_MEM_WIDTH-1);
               end if;
             end loop;
          -- coverage off
    when others =>
                   write_data_cmb <= (others => '0');
          -- coverage on
          end case;
    --------------
    end process WRITE_DATA_MUX_PROCESS_16;

-------------------------------------------------------------------------------
-- Write data path for 16 bit maximum memory width. Write byte enable mux
-- process is  used to multiplex the byte enable depending on the addr_cnt.
-------------------------------------------------------------------------------

    WRITE_BE_MUX_PROCESS_16: process(Mem_width_bytes, Addr_cnt, Bus2IP_BE)
    begin
                   mem_be_i      <= (others => '0');
          case Mem_width_bytes(2 to 3) is
          when "01"  =>
             for i in 0 to C_IPIF_DWIDTH/C_MIN_MEM_WIDTH -1 loop
               if Addr_cnt = conv_std_logic_vector(i, C_ADDR_CNTR_WIDTH) then
                   mem_be_i(0 to C_MIN_MEM_WIDTH/8-1) <=
                      Bus2IP_BE(i*C_MIN_MEM_WIDTH/8 to
                                i*C_MIN_MEM_WIDTH/8 + C_MIN_MEM_WIDTH/8-1);
               end if;
             end loop;
          when "10" =>
             for i in 0 to C_IPIF_DWIDTH/(C_MIN_MEM_WIDTH*2) -1 loop
               if Addr_cnt = conv_std_logic_vector(i, C_ADDR_CNTR_WIDTH) then
                   mem_be_i(0 to 2*C_MIN_MEM_WIDTH/8-1) <=
                      Bus2IP_BE(i*2*C_MIN_MEM_WIDTH/8 to
                                i*2*C_MIN_MEM_WIDTH/8 + 2*C_MIN_MEM_WIDTH/8-1);
               end if;
             end loop;
          -- coverage off
    when others =>
                   mem_be_i   <= (others => '0');
          -- coverage on
          end case;
    end process WRITE_BE_MUX_PROCESS_16;

    WRITE_PARITY_EN_16_MAX : if (C_PARITY_TYPE_MEMORY/=0) generate
    -- WRITE_PARITY_MUX_PROCESS_16: process(Parity_type, Addr_cnt, write_data)
    -- begin
    -- 
    --     write_data_parity_cmb   <= (others => '0');
    --     --------------------
    -- for i in 0 to 1 loop
    --        if Addr_cnt = conv_std_logic_vector(i, C_ADDR_CNTR_WIDTH) then
    --            write_data_parity_cmb (i)<=
    --                     calc_parity(write_data(i*C_MIN_MEM_WIDTH to
    --                          i*C_MIN_MEM_WIDTH + C_MIN_MEM_WIDTH-1),
    --                          Parity_type);
    --        end if;
    --     end loop;
  ---- ------------------
    --     end process WRITE_PARITY_MUX_PROCESS_16;
    
    WRITE_DATA_PARITY_PROCESS_16: process(Mem_width_bytes, 
                                          Addr_cnt, 
                                          write_data_cmb,
                                          Parity_type,
                                          write_data
                                          ) is
    begin
          write_data_parity_cmb   <= (others => '0');
          --------------
    case Mem_width_bytes(2 to 3) is
          ------------
          when "01" => -- 8 bit memory (need only one Parity Enable bit to active)
             --for i in 0 to C_IPIF_DWIDTH/(C_MIN_MEM_WIDTH*4) -1 loop
               --if Addr_cnt = conv_std_logic_vector(i, C_ADDR_CNTR_WIDTH) then
                   --for j in 0  to 1 loop
                   write_data_parity_cmb(0) <=
                                --calc_parity(write_data_cmb((i*C_MIN_MEM_WIDTH*2 + j*C_MIN_MEM_WIDTH) to
                                --                       (i*C_MIN_MEM_WIDTH*2 + j*C_MIN_MEM_WIDTH + C_MIN_MEM_WIDTH-1)),
                                --                       Parity_type);                    
                                calc_parity(write_data_cmb(0 to C_MIN_MEM_WIDTH-1),Parity_type); 
                   --end loop;
               --end if;
             --end loop;
          ------------   
          when "10" => -- 16 bit memory (need only two Parity Enable bits to active)
             for i in 0 to 1 loop
               --if Addr_cnt = conv_std_logic_vector(i, C_ADDR_CNTR_WIDTH) then
                  --for j in 0  to 1 loop
                   --write_data_parity_cmb(j) <=
                                --calc_parity(write_data_cmb((i*C_MIN_MEM_WIDTH*2 + j*C_MIN_MEM_WIDTH) to
                                --                       (i*C_MIN_MEM_WIDTH*2 + j*C_MIN_MEM_WIDTH + C_MIN_MEM_WIDTH-1)),
                                --                       Parity_type);
               
                  --end loop; 
                        write_data_parity_cmb (i)<=                           
                                 calc_parity(write_data_cmb(i*C_MIN_MEM_WIDTH to  
                                                            i*C_MIN_MEM_WIDTH + C_MIN_MEM_WIDTH-1), 
                                                            Parity_type);                           


               --end if;
             end loop;
          ------------
          -- coverage off
          when others =>
                   write_data_parity_cmb <= (others => '0');
          -- coverage on
          ------------
          end case;
    --------------
    end process WRITE_DATA_PARITY_PROCESS_16;
    
            --      for j in 0 to 1 loop
            --        write_data_parity_cmb(j)<=
            --                  calc_parity(write_data(i*C_MIN_MEM_WIDTH*2 + j*C_MIN_MEM_WIDTH to
            --                  i*C_MIN_MEM_WIDTH*2 + j*C_MIN_MEM_WIDTH + C_MIN_MEM_WIDTH-1),
            --                  Parity_type);
            --     end loop;
  end generate WRITE_PARITY_EN_16_MAX; 

end generate WRITE_DATABE_MUX_16_GEN;

-------------------------------------------------------------------------------
-- Write data byte enable generation for 8 bit.
-------------------------------------------------------------------------------

WRITE_DATABE_MUX_8_GEN: if C_MAX_MEM_WIDTH=8 generate
begin

-------------------------------------------------------------------------------
-- Write data path for 8 bit maximum memory width. Write data mux process is
-- used to multiplex the write_data depending on the addr_cnt.
-------------------------------------------------------------------------------

    WRITE_DATA_MUX_PROCESS_8: process(Mem_width_bytes, Addr_cnt, write_data)
    begin
                   write_data_cmb   <= (others => '0');
          --------------
    case Mem_width_bytes(3) is
          when '1'  =>
             for i in 0 to C_IPIF_DWIDTH/C_MIN_MEM_WIDTH -1 loop
               if Addr_cnt = conv_std_logic_vector(i, C_ADDR_CNTR_WIDTH) then
                   write_data_cmb(0 to C_MIN_MEM_WIDTH-1) <=
                      write_data(i*C_MIN_MEM_WIDTH to
                                 i*C_MIN_MEM_WIDTH + C_MIN_MEM_WIDTH-1);
               end if;
             end loop;
          -- coverage off
    when others =>
                   write_data_cmb <= (others => '0');
          -- coverage on
          end case;
    ---------------
    end process WRITE_DATA_MUX_PROCESS_8;

-------------------------------------------------------------------------------
-- Write data path for 8 bit maximum memory width. Write byte enable mux
-- process is  used to multiplex the byte enable depending on the addr_cnt.
-------------------------------------------------------------------------------

    WRITE_BE_MUX_PROCESS_8: process(Mem_width_bytes, Addr_cnt, Bus2IP_BE)
    begin
          mem_be_i      <= (others => '0');
          --------------------------
    case Mem_width_bytes(3) is
          when '1'  =>
             for i in 0 to C_IPIF_DWIDTH/C_MIN_MEM_WIDTH -1 loop
               if Addr_cnt = conv_std_logic_vector(i, C_ADDR_CNTR_WIDTH) then
                   mem_be_i(0 to C_MIN_MEM_WIDTH/8-1) <=
                      Bus2IP_BE(i*C_MIN_MEM_WIDTH/8 to
                                i*C_MIN_MEM_WIDTH/8 + C_MIN_MEM_WIDTH/8-1);
               end if;
             end loop;
          -- coverage off
          when others =>
                   mem_be_i   <= (others => '0');
          -- coverage on
          end case;
    --------------------------
    end process WRITE_BE_MUX_PROCESS_8;

    WRITE_PARITY_EN_8_MAX : if (C_PARITY_TYPE_MEMORY/=0) generate

    WRITE_PARITY_MUX_PROCESS_8: process(Parity_type, 
                                        Addr_cnt, 
                                        write_data_parity_cmb,
					write_data_cmb
                                        ) is
    begin

        write_data_parity_cmb   <= (others => '0');

           --for i in 0 to C_IPIF_DWIDTH/(C_MIN_MEM_WIDTH*4) -1 loop
           --if Addr_cnt = conv_std_logic_vector(i, C_ADDR_CNTR_WIDTH) then
               write_data_parity_cmb (0) <=
                        calc_parity(write_data_cmb(0 to C_MIN_MEM_WIDTH-1),Parity_type);--(i*C_MIN_MEM_WIDTH to
                                                                                        -- i*C_MIN_MEM_WIDTH + C_MIN_MEM_WIDTH-1),
                                                                                        -- Parity_type);

           --end if;
           --end loop;
        end process WRITE_PARITY_MUX_PROCESS_8;
    end generate WRITE_PARITY_EN_8_MAX;

end generate WRITE_DATABE_MUX_8_GEN;
end generate WRITE_DATABE_MUX_GEN;

-------------------------------------------------------------------------------
-- When all the memory banks has same data width as OPB/MCH data width,
-- data steering logic is not required.
-------------------------------------------------------------------------------
------------------------- C_GLOBAL_DATAWIDTH_MATCH = 0 ------------------------
-------------------------------------------------------------------------------

WRITE_DATABE_GEN: if C_GLOBAL_DATAWIDTH_MATCH = 0 generate
begin

    write_data_cmb              <= write_data(0 to C_MAX_MEM_WIDTH-1);
    mem_be_i                    <= Bus2IP_BE(0 to C_MAX_MEM_WIDTH/8-1);

    ---------**--
    WRITE_PARITY_EN : if (C_PARITY_TYPE_MEMORY/=0) generate
    begin
      WRITE_PARITY: process(Parity_type, 
                            write_data_cmb
                            ) is
      begin
        for i in 0 to C_MAX_MEM_WIDTH/8 -1 loop
          write_data_parity_cmb (i)<= calc_parity(write_data_cmb(i*C_MIN_MEM_WIDTH to
                                                                 i*C_MIN_MEM_WIDTH + C_MIN_MEM_WIDTH-1),
                                                                 Parity_type);
        end loop;
      end process WRITE_PARITY;
    end generate WRITE_PARITY_EN;
    ---------**--
end generate WRITE_DATABE_GEN;

-------------------------------------------------------------------------------
-- Write data generation for synchronous memory.
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
------------------------- C_GLOBAL_SYNC_MEM = 1 -------------------------------
-------------------------------------------------------------------------------

SYNC_MEM_WRITE_DATA : if C_GLOBAL_SYNC_MEM = 1 generate
begin

-------------------------------------------------------------------------------
-- Write data pipeline process is used to pipeline write_data_cmb.
-------------------------------------------------------------------------------

    WRITE_DATA_PIPE_PROCESS : process(Clk)
    begin
       if(Clk'EVENT and Clk = '1')then
          if(Rst = '1')then
              write_data_d1        <= (others => '0');
              write_data_d2        <= (others => '0');
              Read_req_ack_reg     <= '0';
          else
              write_data_d1 <= write_data_cmb;
              write_data_d2 <= write_data_d1;
              Read_req_ack_reg  <= Read_req_ack;
          end if;
     end if;
    end process WRITE_DATA_PIPE_PROCESS;


--    PARITY_GEN: if C_GLOBAL_DATAWIDTH_MATCH = 0 generate
--    begin
    ---------------------------------------------------------------------------
    -- Write Parity pipeline process is used to pipeline write_data_cmb
    ---------------------------------------------------------------------------

    WRITE_PARITY_PIPE_PROCESS : process(Clk)
    begin
       if(Clk'EVENT and Clk = '1')then
          if(Rst = '1')then
              write_data_parity_d1 <= (others => '0');
              write_data_parity_d2 <= (others => '0');
          else
              write_data_parity_d1 <= write_data_parity_cmb;
              write_data_parity_d2 <= write_data_parity_d1;
          end if;
     end if;
    end process WRITE_PARITY_PIPE_PROCESS;
--    end generate PARITY_GEN;

-------------------------------------------------------------------------------
-- Write data process is used to multiplex the write data on the memory
-- depending on the type of memory.
-------------------------------------------------------------------------------

    WRITE_DATA_PROCESS: process(write_data_cmb, Synch_mem, Two_pipe_delay,
                                write_data_parity_cmb, write_data_parity_d2,
                                write_data_parity_d1, write_data_d1,
                                write_data_d2)
    begin
       if Synch_mem = '1' then
          if Two_pipe_delay = '1' then
              MemSteer_Mem_DQ_O       <= write_data_d2;
              MemSteer_Mem_DQ_prty_O  <= write_data_parity_d2;
          else
              MemSteer_Mem_DQ_O       <= write_data_d1;
              MemSteer_Mem_DQ_prty_O  <= write_data_parity_d1;
          end if;
       else
          MemSteer_Mem_DQ_O       <= write_data_cmb;
          MemSteer_Mem_DQ_prty_O  <= write_data_parity_cmb;
       end if;
    end process WRITE_DATA_PROCESS;

end generate SYNC_MEM_WRITE_DATA;

-------------------------------------------------------------------------------
-- Memory write data generation for asynchronous memory.
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
------------------------- C_GLOBAL_SYNC_MEM = 0 -------------------------------
-------------------------------------------------------------------------------

ASYNC_MEM_WRITE_DATA : if C_GLOBAL_SYNC_MEM = 0 generate
begin
    MemSteer_Mem_DQ_O       <= write_data_cmb;
    MemSteer_Mem_DQ_prty_O  <= write_data_parity_cmb;
end generate ASYNC_MEM_WRITE_DATA;

-------------------------------------------------------------------------------
-- Memory data bus high impedance buffer control.
-------------------------------------------------------------------------------

mem_dq_t_cmb(0) <= MSM_Mem_WEN;
mem_dqt_t_async <= MSM_Mem_WEN and mem_dqt_t_d;


ASYNC_PARITY_MEM_WRITE: if C_PARITY_TYPE_MEMORY /= 0 generate
begin
        mem_dq_parity_t_cmb(0)  <= MSM_Mem_WEN;
        mem_dqt_parity_t_async  <= MSM_Mem_WEN and mem_dqt_parity_t_d;
end generate ASYNC_PARITY_MEM_WRITE;


-------------------------------------------------------------------------------
-- Asynchronous memory DQT process is used to generate impedance control
-- signal.
-------------------------------------------------------------------------------

MEM_DQT_D_ASYNC_PROCESS: process(Clk)
begin
    if Clk'event and Clk = '1' then
       if Rst = '1' then
          mem_dqt_t_d           <= '1';
          mem_dqt_parity_t_d    <= '1';
       else
          mem_dqt_t_d           <= MSM_Mem_WEN;
          mem_dqt_parity_t_d    <= MSM_Mem_WEN;
       end if;
    end if;
end process MEM_DQT_D_ASYNC_PROCESS;

-------------------------------------------------------------------------------
-- Impedance generation for synchronous memory.
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
------------------------- C_GLOBAL_SYNC_MEM = 1 -------------------------------
-------------------------------------------------------------------------------

SYNC_MEM_DQT : if C_GLOBAL_SYNC_MEM = 1 generate
begin

    REG_DQT_GEN : for i in 0 to 2 generate
    begin

-------------------------------------------------------------------------------
-- FDS primitive is used for mem_dq_t_cmb pipe generation.
-------------------------------------------------------------------------------

        DQT_REG: FDS
        port map (
            Q   => mem_dq_t_cmb(i+1), --[out]
            C   => Clk,               --[in]
            D   => mem_dq_t_cmb(i),   --[in]
            S   => Rst                --[in]
            );
    end generate REG_DQT_GEN;

-------------------------------------------------------------------------------
-- Memory dqt process is used to multiplex the impeadance control signal on to
-- the memory depending on the type of memory.
-------------------------------------------------------------------------------

    MEM_DQT_PROCESS_SYNC: process(Synch_mem, Two_pipe_delay, mem_dq_t_cmb,
                             mem_dqt_t_async)
    begin
        MemSteer_Mem_DQ_T <= (others => '1');
        for i in 0 to C_MAX_MEM_WIDTH-1 loop
          if(Synch_mem = '1')then
              if(Two_pipe_delay = '1')then
                  MemSteer_Mem_DQ_T(i) <= mem_dq_t_cmb(2);
              else
                  MemSteer_Mem_DQ_T(i) <= mem_dq_t_cmb(1);
              end if;
          else
              MemSteer_Mem_DQ_T(i) <= mem_dqt_t_async;
          end if;
        end loop;
    end process MEM_DQT_PROCESS_SYNC;


  SYNC_PARITY_MEM_WRITE_DQT: if C_PARITY_TYPE_MEMORY /= 0 generate
  begin
    REG_DQT_PARITY_GEN : for i in 0 to 2 generate
    begin

-------------------------------------------------------------------------------
-- FDS primitive is used for mem_dq_t_cmb pipe generation.
-------------------------------------------------------------------------------

        DQT_REG: FDS
        port map (
            Q   => mem_dq_parity_t_cmb(i+1), --[out]
            C   => Clk,               --[in]
            D   => mem_dq_parity_t_cmb(i),   --[in]
            S   => Rst                --[in]
            );
    end generate REG_DQT_PARITY_GEN;

-------------------------------------------------------------------------------
-- Memory dqt process is used to multiplex the impeadance control signal on to
-- the memory depending on the type of memory.
-------------------------------------------------------------------------------

    MEM_DQT_PARITY_PROCESS_SYNC: process(Synch_mem, 
                                         Two_pipe_delay,
                                         mem_dq_parity_t_cmb,
					 mem_dqt_parity_t_async
					 ) is
    begin
        MemSteer_Mem_DQ_prty_T <= (others => '1');
        for i in 0 to C_MAX_MEM_WIDTH/8-1 loop
          if(Synch_mem = '1')then
              if(Two_pipe_delay = '1')then
                  MemSteer_Mem_DQ_prty_T(i) <= mem_dq_parity_t_cmb(2);
              else
                  MemSteer_Mem_DQ_prty_T(i) <= mem_dq_parity_t_cmb(1);
              end if;
          else
              MemSteer_Mem_DQ_prty_T(i) <= mem_dqt_parity_t_async;
          end if;
        end loop;
    end process MEM_DQT_PARITY_PROCESS_SYNC;
  end generate SYNC_PARITY_MEM_WRITE_DQT;

end generate SYNC_MEM_DQT;

-------------------------------------------------------------------------------
-- Impedance generation for asynchronous memory.
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
------------------------- C_GLOBAL_SYNC_MEM = 0 -------------------------------
-------------------------------------------------------------------------------

ASYNC_MEM_DQT : if C_GLOBAL_SYNC_MEM = 0 generate
begin

-------------------------------------------------------------------------------
-- Memory dqt process is used to generate impeadance control signal on to
-- the memory.
-------------------------------------------------------------------------------

    MEM_DQT_PROCESS_ASYNC: process(mem_dqt_t_async)
    begin
        for i in 0 to C_MAX_MEM_WIDTH-1 loop
          MemSteer_Mem_DQ_T(i) <= mem_dqt_t_async;
        end loop;
    end process MEM_DQT_PROCESS_ASYNC;

-------------------------------------------------------------------------------
-- Memory PARITY dqt process is used to generate impeadance control signal on
-- to the memory.
-------------------------------------------------------------------------------

   ASYNC_PARITY_MEM_WRITE_DQT: if C_PARITY_TYPE_MEMORY /= 0 generate
   begin
      MEM_PARITY_DQT_PROCESS_ASYNC: process(mem_dqt_parity_t_async)
      begin
        for i in 0 to C_MAX_MEM_WIDTH/8-1 loop
          MemSteer_Mem_DQ_prty_T(i) <= mem_dqt_parity_t_async;
        end loop;
      end process MEM_PARITY_DQT_PROCESS_ASYNC;
   end generate ASYNC_PARITY_MEM_WRITE_DQT;

end generate ASYNC_MEM_DQT;



-------------------------------------------------------------------------------
-- Read data path.
-- Read data and byte enable generation.
-------------------------------------------------------------------------------

RDDATA_GEN: for j in 0 to C_IPIF_DWIDTH/C_MIN_MEM_WIDTH - 1 generate
begin

    RDDATA_BYTE_GEN:for i in 0 to C_MIN_MEM_WIDTH - 1 generate
    begin

-------------------------------------------------------------------------------
-- FDCE primitive is used for latching read_data when read_data_ce = 1.
-------------------------------------------------------------------------------

        RDDATA_REG: FDRE
        port map (
            Q   => Mem2Bus_Data(C_MIN_MEM_WIDTH*j+i), --[out]
            C   => Clk,                               --[in]
            CE  => read_data_ce(j),                   --[in]
            D   => read_data(C_MIN_MEM_WIDTH*j+i),    --[in]
            R   => RST                            --[in]
            );
    end generate RDDATA_BYTE_GEN;
end generate RDDATA_GEN;


-------------------------------------------------------------------------------
------------------------- C_GLOBAL_DATAWIDTH_MATCH = 0 ------------------------
-------------------------------------------------------------------------------

RDDATA_PATH_GEN : if C_GLOBAL_DATAWIDTH_MATCH = 0 generate
begin
    read_data    <= MemSteer_Mem_DQ_I;
    read_data_ce <= (others=>'1');

    READ_PARITY_EN : if (C_PARITY_TYPE_MEMORY/=0) generate
    begin
      READ_PARITY: process(MemSteer_Mem_DQ_I,
                           Parity_type,
                           read_ack_d,
                           MemSteer_Mem_DQ_prty_I
                           ) is
      begin
        -- default assignment
        --read_parity <= (others => '0');
    if (read_ack_d(2) = '1') then
        for i in 0 to C_MAX_MEM_WIDTH/8 -1 loop

          read_data_parity_cmb (i)<= check_parity(MemSteer_Mem_DQ_I(i*C_MIN_MEM_WIDTH to 
                                                                    i*C_MIN_MEM_WIDTH + C_MIN_MEM_WIDTH-1),
                                                                    MemSteer_Mem_DQ_prty_I(i),
                                                                    Parity_type);
        end loop;
    else
        read_data_parity_cmb <= (OTHERS => '0');
    end if;
      end process READ_PARITY;
    end generate READ_PARITY_EN;


end generate RDDATA_PATH_GEN;

-------------------------------------------------------------------------------
------------------------- C_GLOBAL_DATAWIDTH_MATCH = 1 ------------------------
-------------------------------------------------------------------------------

RDDATA_PATH_MUX_GEN : if C_GLOBAL_DATAWIDTH_MATCH = 1 generate
begin

-------------------------------------------------------------------------------
------------------------- C_GLOBAL_SYNC_MEM = 1 -------------------------------
-------------------------------------------------------------------------------

    SYNC_ADDR_CNT_GEN: if C_GLOBAL_SYNC_MEM = 1 generate
    begin

-------------------------------------------------------------------------------
-- Address count pipeline process is used to pipeline address count.
-------------------------------------------------------------------------------

        ADDR_CNT_PIPE_PROCESS_SYN: process(Clk)
        begin
          if Clk'event and Clk = '1' then
              if Rst = '1' then
                  addr_cnt_d1 <= (others => '0');
                  addr_cnt_d2 <= (others => '0');
                  addr_cnt_d3 <= (others => '0');
                  addr_cnt_d4 <= (others => '0');
              else
                if Bus2IP_RdReq = '1' or single_transaction = '1' then
                  addr_cnt_d1 <= Addr_cnt;
                  addr_cnt_d2 <= addr_cnt_d1;
                  addr_cnt_d3 <= addr_cnt_d2;
                  addr_cnt_d4 <= addr_cnt_d3;
                else
                  addr_cnt_d1 <= (others => '0');
                  addr_cnt_d2 <= (others => '0');
                  addr_cnt_d3 <= (others => '0');
                  addr_cnt_d4 <= (others => '0');
                end if;
             end if;
          end if;
        end process ADDR_CNT_PIPE_PROCESS_SYN;

-------------------------------------------------------------------------------
-- Synchonous address counter process is used to multiplex the address counter
-- select signal depending on the type of memory.
-------------------------------------------------------------------------------

        SYNC_ADDR_CNT_PROCESS: process(ns_idle,
                                       Synch_mem,
                                       Two_pipe_delay,
                                       addr_cnt_d2,
                                       addr_cnt_d3,
                                       addr_cnt_d4)
        begin
          if (ns_idle='0') then
             if Synch_mem = '1' then
                if Two_pipe_delay = '1' then
                    addr_cnt_sel <= addr_cnt_d4;
                else
                    addr_cnt_sel <= addr_cnt_d3;
                end if;
             else
                 addr_cnt_sel <= addr_cnt_d2;
             end if;
          else
              addr_cnt_sel <= (others => '0');
          end if;
        end process SYNC_ADDR_CNT_PROCESS;

---------------------------- Read Data Enable Logic ---------------------------

    read_data_en_d(0)  <= Read_data_en;

    RDDATA_EN_GEN_SYNC: for i in 0 to 3 generate
    begin

-------------------------------------------------------------------------------
-- FDR primitive is used for read_data_en_d pipe generation.
-------------------------------------------------------------------------------

        RDDATA_EN_REG_SYNC: FDR
            port map (
                Q   => read_data_en_d(i+1),          --[out]
                C   => Clk,                          --[in]
                D   => read_data_en_d(i),            --[in]
                R   => Rst                           --[in]
                );
    end generate RDDATA_EN_GEN_SYNC;

-------------------------------------------------------------------------------
-- Read data enable select process is used to multiplex the read data enable
-- depending on the type of memory.
-------------------------------------------------------------------------------

        READ_DATA_EN_SEL_PROCESS: process(read_data_en_d, Synch_mem,
                                          Two_pipe_delay)
        begin
          if Synch_mem = '1' then
              if Two_pipe_delay = '1' then
                  read_data_en_sel <= read_data_en_d(3);
              else
                  read_data_en_sel <= read_data_en_d(2);
              end if;
          else
              read_data_en_sel     <= read_data_en_d(1);
          end if;
        end process READ_DATA_EN_SEL_PROCESS;

    end generate SYNC_ADDR_CNT_GEN;

-------------------------------------------------------------------------------
-- Address count select generation for asynchronous memory.
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
------------------------- C_GLOBAL_SYNC_MEM = 0 -------------------------------
-------------------------------------------------------------------------------

    ASYNC_ADDR_CNT_GEN: if C_GLOBAL_SYNC_MEM = 0 generate
    begin

-------------------------------------------------------------------------------
-- Address count pipeline process is used to pipeline address count.
-------------------------------------------------------------------------------

        ADDR_CNT_PIPE_PROCESS_ASYNC: process(Clk)
        begin
          if Clk'event and Clk = '1' then
              if ((Rst = '1') or (ns_idle='1')) then
                  addr_cnt_d1 <= (others => '0');
                  addr_cnt_d2 <= (others => '0');
              else
                  addr_cnt_d1 <= Addr_cnt;
                  addr_cnt_d2 <= addr_cnt_d1;
             end if;
          end if;
        end process ADDR_CNT_PIPE_PROCESS_ASYNC;

        addr_cnt_sel      <= addr_cnt_d2;

---------------------------- Read Data Enable Logic ---------------------------

        read_data_en_d(0)  <= Read_data_en;
        read_data_en_sel   <= read_data_en_d(1);

    RDDATA_EN_GEN_ASYNC: for i in 0 to 3 generate
    begin

-------------------------------------------------------------------------------
-- FDR primitive is used for read_data_en_d pipe generation.
-------------------------------------------------------------------------------

            RDDATA_EN_REG_ASYNC: FDR
            port map (
                    Q   => read_data_en_d(i+1),      --[out]
                    C   => Clk,                      --[in]
                    D   => read_data_en_d(i),        --[in]
                    R   => Rst                       --[in]
                    );
    end generate RDDATA_EN_GEN_ASYNC;
    end generate ASYNC_ADDR_CNT_GEN;


-------------------------------------------------------------------------------
-- Read Data CE generation For 64 Bit DWidth.
-------------------------------------------------------------------------------

    READ_DATA_CE_64_GEN: if C_IPIF_DWIDTH = 64 generate
    begin
--signal test :std_logic_vector(0 downto 7);
--test <= read_data_ce(conv_integer(addr_cnt_sel)*4+i);
-------------------------------------------------------------------------------
-- Read data CE process is used to generate read data chip enable for 64 Bit
-- DWidth.
-------------------------------------------------------------------------------

        READ_DATA_CE_PROCESS_64: process(read_data_en_sel,
                                         addr_cnt_sel,
                                         single_transaction,
                                         Bus2IP_RdReq,
                                         Mem_width_bytes,
                                         Linear_flash_brst_rd_flag,
                                         Linear_flash_rd_data_ack,
					                          addr_cnt_numonyx
                                        ) is
        begin
                read_data_ce  <= (others => '0');
         if Bus2IP_RdReq = '1' or single_transaction = '1' then
          case Mem_width_bytes is
             when "0001"  =>
                read_data_ce(conv_integer(addr_cnt_sel))
                   <= read_data_en_sel;
             when "0010" =>
               for i in 0 to 1 loop
                --read_data_ce(conv_integer(addr_cnt_sel)*2+i)
                --   <= read_data_en_sel;
                        if(Linear_flash_brst_rd_flag = '0') then
			            read_data_ce(conv_integer(addr_cnt_sel)*2+i)
                   		           <= read_data_en_sel;
		        else
			            read_data_ce(conv_integer(addr_cnt_numonyx)*2+i)
                   		           <=  Linear_flash_rd_data_ack;--read_data_en_sel;
		        end if;
               end loop;
             when "0100" =>
               for i in 0 to 3 loop
                read_data_ce(conv_integer(addr_cnt_sel)*4+i)
                   <= read_data_en_sel;
               end loop;
             when "1000" =>
               for i in 0 to 7 loop
                read_data_ce(i)  <= read_data_en_sel;
               end loop;
            -- coverage off
            when others =>
                read_data_ce <= (others => '0');
            -- coverage on
          end case;
         end if;
        end process READ_DATA_CE_PROCESS_64;

    end generate READ_DATA_CE_64_GEN;


-------------------------------------------------------------------------------
-- Read data CE generation For 32 Bit DWidth.
-------------------------------------------------------------------------------

    READ_DATA_CE_32_GEN: if C_IPIF_DWIDTH = 32 generate
    begin

-------------------------------------------------------------------------------
-- Read data CE process is used to generate read data chip enable for 32 Bit
-- DWidth.
-------------------------------------------------------------------------------

        READ_DATA_CE_PROCESS_32: process(Mem_width_bytes, 
	                                      addr_cnt_sel, 
					                          addr_cnt_numonyx,
                                         read_data_en_sel, 
					                          Linear_flash_brst_rd_flag, 
					                          Linear_flash_rd_data_ack
					                          ) is
        begin
                read_data_ce  <= (others => '0');
          case Mem_width_bytes is
             when "0001"  =>
                read_data_ce(conv_integer(addr_cnt_sel))
                   <= read_data_en_sel ;  -- and not(Linear_flash_brst_rd_flag)) or (Linear_flash_brst_rd_flag and Linear_flash_rd_data_ack);
             when "0010" =>
               for i in 0 to 1 loop
                if(Linear_flash_brst_rd_flag = '0') then
			            read_data_ce(conv_integer(addr_cnt_sel)*2+i)
                   		           <= read_data_en_sel;
		        else
			            read_data_ce(conv_integer(addr_cnt_numonyx)*2+i)
                   		           <=  Linear_flash_rd_data_ack;--read_data_en_sel;
		        end if;
               end loop;
             when "0100" =>
               for i in 0 to 3 loop
                read_data_ce(i)  <= read_data_en_sel ;--and not(Linear_flash_brst_rd_flag)) or (Linear_flash_brst_rd_flag and Linear_flash_rd_data_ack);--read_data_en_sel;
               end loop;
          -- coverage off
       when others =>
                read_data_ce <= (others => '0');
          -- coverage on
          end case;
        end process READ_DATA_CE_PROCESS_32;

    end generate READ_DATA_CE_32_GEN;


-------------------------------------------------------------------------------
-- Read Data Path For 64 Bit Maximum Memory Width.
-------------------------------------------------------------------------------

    READ_DATA_64_GEN: if (C_MAX_MEM_WIDTH=64 and C_IPIF_DWIDTH=64) generate
    begin

-------------------------------------------------------------------------------
-- Read data process is used to generate read data for 64 Bit DWidth.
-------------------------------------------------------------------------------

       READ_DATA_PROCESS_64_64: process(Mem_width_bytes, MemSteer_Mem_DQ_I )
       begin
                   read_data     <= (others => '0');
          case Mem_width_bytes is
             when "0001"  =>
               -- create the input data
               for i in 0 to C_IPIF_DWIDTH/C_MIN_MEM_WIDTH -1 loop
                   read_data(i*C_MIN_MEM_WIDTH to
                             i*C_MIN_MEM_WIDTH+C_MIN_MEM_WIDTH-1)
                      <= MemSteer_Mem_DQ_I(0 to C_MIN_MEM_WIDTH-1);
               end loop;
             when "0010" =>
               -- create the input data
               for i in 0 to C_IPIF_DWIDTH/(C_MIN_MEM_WIDTH*2) -1 loop
                   read_data(i*C_MIN_MEM_WIDTH*2 to
                             i*C_MIN_MEM_WIDTH*2+C_MIN_MEM_WIDTH*2-1)
                      <= MemSteer_Mem_DQ_I(0 to C_MIN_MEM_WIDTH*2-1);
               end loop;
             when "0100" =>
               -- create the input data
               for i in 0 to C_IPIF_DWIDTH/(C_MIN_MEM_WIDTH*4) -1 loop
                   read_data(i*C_MIN_MEM_WIDTH*4 to
                             i*C_MIN_MEM_WIDTH*4+C_MIN_MEM_WIDTH*4-1)
                      <= MemSteer_Mem_DQ_I(0 to C_MIN_MEM_WIDTH*4-1);
               end loop;
             when "1000" =>
                   read_data <= MemSteer_Mem_DQ_I;
          -- coverage off
             when others =>
                   read_data <= (others => '0');
          -- coverage on
          end case;
        end process READ_DATA_PROCESS_64_64;

      READ_PARITY_EN_64_MAX : if (C_PARITY_TYPE_MEMORY/=0) generate

        READ_PRTY_PROCESS_64: process(Mem_width_bytes, MemSteer_Mem_DQ_prty_I)
        begin
                   read_parity <= (others => '0');
          case Mem_width_bytes is
             when "0001"  =>
               -- create the input data
               for i in 0 to C_IPIF_DWIDTH/C_MIN_MEM_WIDTH -1 loop
                   read_parity(i*C_MIN_MEM_WIDTH/8 to
                             i*C_MIN_MEM_WIDTH/8+C_MIN_MEM_WIDTH/8-1)
                      <= MemSteer_Mem_DQ_prty_I(0 to C_MIN_MEM_WIDTH/8-1);
               end loop;
             when "0010" =>
               -- create the input data
               for i in 0 to C_IPIF_DWIDTH/(C_MIN_MEM_WIDTH*2) -1 loop
                   read_parity(i*C_MIN_MEM_WIDTH*2/8 to
                             i*C_MIN_MEM_WIDTH*2/8+C_MIN_MEM_WIDTH*2/8-1)
                      <= MemSteer_Mem_DQ_prty_I(0 to C_MIN_MEM_WIDTH*2/8-1);
               end loop;
             when "0100" =>
               -- create the input data
               for i in 0 to C_IPIF_DWIDTH/(C_MIN_MEM_WIDTH*4) -1 loop
                   read_parity(i*C_MIN_MEM_WIDTH*4/8 to
                             i*C_MIN_MEM_WIDTH*4/8+C_MIN_MEM_WIDTH*4/8-1)
                      <= MemSteer_Mem_DQ_prty_I(0 to C_MIN_MEM_WIDTH*4/8-1);
               end loop;
             when "1000" =>
                   read_parity <= MemSteer_Mem_DQ_prty_I;
             when others =>
                   read_parity <= (others => '0');
          end case;

        end process READ_PRTY_PROCESS_64;

        READ_PARITY_MUX_PROCESS_64: process(MemSteer_Mem_DQ_I,
                                            Parity_type,
                                            Bus2IP_BE,
                                            read_ack_d,
                                            MemSteer_Mem_DQ_prty_I)
        begin
            read_data_parity_cmb   <= (others => '0');
    if (read_ack_d(2) = '1') then
                for i in 0 to 7 loop
                  --if Bus2IP_BE(i) = '1' then
                   read_data_parity_cmb (i)<= check_parity(MemSteer_Mem_DQ_I
                                        (i*C_MIN_MEM_WIDTH to i*C_MIN_MEM_WIDTH
                                        + C_MIN_MEM_WIDTH-1),
                                        MemSteer_Mem_DQ_prty_I(i),
                                        Parity_type);
                  --end if;
                end loop;
    else
        read_data_parity_cmb <= (OTHERS => '0');                
    end if;
        end process READ_PARITY_MUX_PROCESS_64;
      end generate READ_PARITY_EN_64_MAX;

    end generate READ_DATA_64_GEN;


-------------------------------------------------------------------------------
-- Read data path For 32 bit maximum memory width.
-------------------------------------------------------------------------------

    READ_DATA_32_GEN: if (C_MAX_MEM_WIDTH=32) generate
    begin

-------------------------------------------------------------------------------
-- Read data process is used to generate read data for 32 bit DWidth.
-------------------------------------------------------------------------------

        READ_DATA_PROCESS_32: process(Mem_width_bytes, MemSteer_Mem_DQ_I)
        begin
                   read_data <= (others => '0');
          case Mem_width_bytes(1 to 3) is
             when "001"  =>
               -- create the input data
               for i in 0 to C_IPIF_DWIDTH/C_MIN_MEM_WIDTH -1 loop
                   read_data(i*C_MIN_MEM_WIDTH to
                             i*C_MIN_MEM_WIDTH+C_MIN_MEM_WIDTH-1)
                      <= MemSteer_Mem_DQ_I(0 to C_MIN_MEM_WIDTH-1);
               end loop;
             when "010" =>
               -- create the input data
               for i in 0 to C_IPIF_DWIDTH/(C_MIN_MEM_WIDTH*2)-1 loop
                   read_data(i*C_MIN_MEM_WIDTH*2 to
                             i*C_MIN_MEM_WIDTH*2+C_MIN_MEM_WIDTH*2-1)
                      <= MemSteer_Mem_DQ_I(0 to C_MIN_MEM_WIDTH*2-1);
               end loop;
             when "100" =>
               -- create the input data
               for i in 0 to C_IPIF_DWIDTH/(C_MIN_MEM_WIDTH*4)-1 loop
                   read_data(i*C_MIN_MEM_WIDTH*4 to
                             i*C_MIN_MEM_WIDTH*4+C_MIN_MEM_WIDTH*4-1)
                      <= MemSteer_Mem_DQ_I(0 to C_MIN_MEM_WIDTH*4-1);
               end loop;
          -- coverage off
             when others =>
                   read_data <= (others => '0');
          -- coverage on
          end case;
        end process READ_DATA_PROCESS_32;

      READ_PARITY_EN_32_MAX : if (C_PARITY_TYPE_MEMORY/=0) generate

        READ_PRTY_PROCESS_32: process(Mem_width_bytes, MemSteer_Mem_DQ_prty_I)
        begin
                   read_parity <= (others => '0');
          case Mem_width_bytes(1 to 3) is
             when "001"  =>
               -- create the input data
               for i in 0 to C_IPIF_DWIDTH/C_MIN_MEM_WIDTH -1 loop
                   read_parity(i*C_MIN_MEM_WIDTH/8 to
                             i*C_MIN_MEM_WIDTH/8+C_MIN_MEM_WIDTH/8-1)
                      <= MemSteer_Mem_DQ_prty_I(0 to C_MIN_MEM_WIDTH/8-1);
               end loop;
             when "010" =>
               -- create the input data
               for i in 0 to C_IPIF_DWIDTH/(C_MIN_MEM_WIDTH*2)-1 loop
                   read_parity(i*C_MIN_MEM_WIDTH*2/8 to
                             i*C_MIN_MEM_WIDTH*2/8+C_MIN_MEM_WIDTH*2/8-1)
                      <= MemSteer_Mem_DQ_prty_I(0 to C_MIN_MEM_WIDTH*2/8-1);
               end loop;
             when "100" =>
               -- create the input data
               for i in 0 to C_IPIF_DWIDTH/(C_MIN_MEM_WIDTH*4)-1 loop
                   read_parity(i*C_MIN_MEM_WIDTH*4/8 to
                             i*C_MIN_MEM_WIDTH*4/8+C_MIN_MEM_WIDTH*4/8-1)
                      <= MemSteer_Mem_DQ_prty_I(0 to C_MIN_MEM_WIDTH*4/8-1);
               end loop;
          -- coverage off
             when others =>
                   read_parity <= (others => '0');
          -- coverage on
          end case;
        end process READ_PRTY_PROCESS_32;

        READ_PARITY_MUX_PROCESS_32: process(MemSteer_Mem_DQ_I,
                                            Parity_type,
                                            MemSteer_Mem_DQ_prty_I,
                                            read_ack_d,
                                            Bus2IP_BE)
        begin

            read_data_parity_cmb   <= (others => '0');
    if (read_ack_d(2) = '1') then
                for i in 0 to 3 loop
                  --if Bus2IP_BE(i) = '1' then
                   read_data_parity_cmb (i)<= check_parity(MemSteer_Mem_DQ_I
                                        (i*C_MIN_MEM_WIDTH to i*C_MIN_MEM_WIDTH
                                        + C_MIN_MEM_WIDTH-1),
                                        MemSteer_Mem_DQ_prty_I(i),
                                        Parity_type);
                  --end if;
                end loop;
    else
        read_data_parity_cmb <= (OTHERS => '0');                
     end if;
        end process READ_PARITY_MUX_PROCESS_32;
      end generate READ_PARITY_EN_32_MAX;

    end generate READ_DATA_32_GEN;

-------------------------------------------------------------------------------
-- Read data path for 16 bit maximum memory width.
-------------------------------------------------------------------------------

    READ_DATA_16_GEN: if C_MAX_MEM_WIDTH=16 generate
    begin

-------------------------------------------------------------------------------
-- Read data process is used to generate read data for 16 bit DWidth.
-------------------------------------------------------------------------------

        READ_DATA_PROCESS_16: process(Mem_width_bytes, MemSteer_Mem_DQ_I)
        begin
                   read_data <= (others => '0');
          case Mem_width_bytes(2 to 3) is
             when "01"  =>
               -- create the input data
               for i in 0 to C_IPIF_DWIDTH/C_MIN_MEM_WIDTH -1 loop
                   read_data(i*C_MIN_MEM_WIDTH to
                             i*C_MIN_MEM_WIDTH+C_MIN_MEM_WIDTH-1)
                      <= MemSteer_Mem_DQ_I(0 to C_MIN_MEM_WIDTH-1);
               end loop;
             when "10" =>
               -- create the input data
               for i in 0 to C_IPIF_DWIDTH/(C_MIN_MEM_WIDTH*2)-1 loop
                   read_data(i*C_MIN_MEM_WIDTH*2 to
                             i*C_MIN_MEM_WIDTH*2+C_MIN_MEM_WIDTH*2-1)
                      <= MemSteer_Mem_DQ_I(0 to C_MIN_MEM_WIDTH*2-1);
               end loop;
          -- coverage off
       when others =>
                   read_data <= (others => '0');
          -- coverage on
          end case;
        end process READ_DATA_PROCESS_16;

      READ_PARITY_EN_16_MAX : if (C_PARITY_TYPE_MEMORY/=0) generate

        READ_DATA_PROCESS_16: process(Mem_width_bytes, MemSteer_Mem_DQ_prty_I)
        begin
                   read_parity <= (others => '0');
          case Mem_width_bytes(2 to 3) is
             when "01"  =>
               -- create the input data
               for i in 0 to C_IPIF_DWIDTH/C_MIN_MEM_WIDTH -1 loop
                   read_parity(i*C_MIN_MEM_WIDTH/8 to
                             i*C_MIN_MEM_WIDTH/8+C_MIN_MEM_WIDTH/8-1)
                      <= MemSteer_Mem_DQ_prty_I(0 to C_MIN_MEM_WIDTH/8-1);
               end loop;
             when "10" =>
               -- create the input data
               for i in 0 to C_IPIF_DWIDTH/(C_MIN_MEM_WIDTH*2)-1 loop
                   read_parity(i*C_MIN_MEM_WIDTH*2/8 to
                             i*C_MIN_MEM_WIDTH*2/8+C_MIN_MEM_WIDTH*2/8-1)
                      <= MemSteer_Mem_DQ_prty_I(0 to C_MIN_MEM_WIDTH*2/8-1);
               end loop;
          -- coverage off
             when others =>
                   read_parity <= (others => '0');
          -- coverage on
          end case;
        end process READ_DATA_PROCESS_16;

        READ_PARITY_MUX_PROCESS_16: process(MemSteer_Mem_DQ_I,
                                            Parity_type,
                                            MemSteer_Mem_DQ_prty_I,
                                            read_ack_d,
                                            Bus2IP_BE)
        begin

            read_data_parity_cmb   <= (others => '0');
    if (read_ack_d(2) = '1') then

                for i in 0 to 1 loop
                  --if Bus2IP_BE(i) = '1' then
                   read_data_parity_cmb (i)<= check_parity(MemSteer_Mem_DQ_I(i*C_MIN_MEM_WIDTH to i*C_MIN_MEM_WIDTH + C_MIN_MEM_WIDTH-1),
                                                           MemSteer_Mem_DQ_prty_I(i),
                                                           Parity_type);
                  --end if;
                end loop;
    else
        read_data_parity_cmb <= (OTHERS => '0');                
    end if;
        end process READ_PARITY_MUX_PROCESS_16;
      end generate READ_PARITY_EN_16_MAX;


    end generate READ_DATA_16_GEN;
-------------------------------------------------------------------------------
-- Read data path for 8 bit maximum memory width.
-------------------------------------------------------------------------------

    READ_DATA_8_GEN: if C_MAX_MEM_WIDTH=8 generate
    begin
-------------------------------------------------------------------------------
-- Read data process is used to generate read data for 8 bit DWidth.
-------------------------------------------------------------------------------

        READ_DATA_PROCESS_8: process(Mem_width_bytes,
                               MemSteer_Mem_DQ_I)
        begin
                   read_data <= (others => '0');
          case Mem_width_bytes(3) is
             when '1'  =>
               -- create the input data
               for i in 0 to C_IPIF_DWIDTH/C_MIN_MEM_WIDTH -1 loop
                   read_data(i*C_MIN_MEM_WIDTH to
                             i*C_MIN_MEM_WIDTH+C_MIN_MEM_WIDTH-1)
                      <= MemSteer_Mem_DQ_I(0 to C_MIN_MEM_WIDTH-1);
               end loop;
          -- coverage off
             when others =>
                   read_data <= (others => '0');
          -- coverage on
          end case;
        end process READ_DATA_PROCESS_8;

      READ_PARITY_EN_8_MAX : if (C_PARITY_TYPE_MEMORY/=0) generate

        READ_DATA_PROCESS_8: process(Mem_width_bytes, MemSteer_Mem_DQ_prty_I)
        begin
                   read_parity <= (others => '0');
          case Mem_width_bytes(3) is
             when '1'  =>
               -- create the input data
               for i in 0 to C_IPIF_DWIDTH/C_MIN_MEM_WIDTH -1 loop
                   read_parity(i*C_MIN_MEM_WIDTH/8 to
                             i*C_MIN_MEM_WIDTH/8+C_MIN_MEM_WIDTH/8-1)
                      <= MemSteer_Mem_DQ_prty_I(0 to C_MIN_MEM_WIDTH/8-1);
               end loop;
             when others =>
                   read_parity <= (others => '0');
          end case;
        end process READ_DATA_PROCESS_8;

        READ_PARITY_MUX_PROCESS_8: process(MemSteer_Mem_DQ_I,
                                           Parity_type,
                                           Bus2IP_BE,
                                           read_ack_d,
                                           MemSteer_Mem_DQ_prty_I)
        begin

            read_data_parity_cmb   <= (others => '0');
    if (read_ack_d(2) = '1') then

                for i in 0 to 0 loop
                  --if Bus2IP_BE(i) = '1' then
                   read_data_parity_cmb (i)<= check_parity(MemSteer_Mem_DQ_I(i*C_MIN_MEM_WIDTH to i*C_MIN_MEM_WIDTH + C_MIN_MEM_WIDTH-1),
                                                           MemSteer_Mem_DQ_prty_I(i),
                                                           Parity_type);
                  --end if;
                end loop;
    else
        read_data_parity_cmb <= (OTHERS => '0');                
    end if;
        end process READ_PARITY_MUX_PROCESS_8;
      end generate READ_PARITY_EN_8_MAX;

    end generate READ_DATA_8_GEN;
end generate RDDATA_PATH_MUX_GEN;
end imp;
-------------------------------------------------------------------------------
-- End of file mem_steer.vhd.
-------------------------------------------------------------------------------


-------------------------------------------------------------------
-- (c) Copyright 1984 - 2013 Xilinx, Inc. All rights reserved.
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
-------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Filename:        emc.vhd
-- Version:         v2.1
-- Description:     Common interface for External Memory Controller
--
-- VHDL-Standard:   VHDL'93
-------------------------------------------------------------------------------
-- Structure:
--                  emc.vhd
--                      -- ipic_if.vhd
--                      -- addr_counter_mux.vhd
--                      -- counters.vhd
--                      -- select_param.vhd
--                      -- mem_state_machine.vhd
--                      -- mem_steer.vhd
--                      -- io_registers.vhd
-------------------------------------------------------------------------------
-- Author:          NSK
-- History:
-- NSK             03/01/08    First Version
-- ^^^^^^^^^^
-- This file is based on version v3_01_c updated to fixed CR #466745: -
--     Added generic C_MEM_DQ_CAPTURE_NEGEDGE. The same generic is mapped to
--     component io_registers from emc_common_v3_0_53_a.
-- ~~~~~~~~~
-- NSK         03/12/08    Updated
-- ^^^^^^^^
-- Added generic C_MEM_DQ_CAPTURE_NEGEDGE in comment "Definition of Generics"
-- section.
-- ~~~~~~~~
-- NSK         03/03/08    Updated
-- ^^^^^^^^
-- 1. Removed generic C_MEM_DQ_CAPTURE_NEGEDGE.
-- 2. Added the port RdClk used as clock to capture the data from memory.
-- ~~~~~~~~
-- NSK         05/08/08    version v3_00_a
-- ^^^^^^^^
-- 1. This file is same as in version v3_03_a.
-- 2. Upgraded to version v3.00.a to have proper versioning to fix CR #472164.
-- 3. No change in design.
--
-- KSB         05/08/08    version v4_00_a
-- 1. Modified for Page mdoe read
-- 2. Modified for 64 Bit memory address align
-- ~~~~~~~~
--
-- KSB         22/05/10    version v5_00_a
-- 1. Modified for AXI EMC, PSRAM, Byte parity Memory Support
-- 2. Modified for AXI Slave burst interface
-- ~~~~~~~~
-- SK          03/11/10    version v5_01_a
-- ^^^^^^^^
-- 1. Registered the IP2Bus_RdAck and IP2Bus_Data signals.
-- 2. Reduced utilization
-- ~~~~~~~~
-- SK          03/11/11    version v5_03_a
-- ^^^^^^^^
-- 1. Fixed CR#595758 and CR#606038
-- ~~~~~~~~
-- ~~~~~~
--  Sateesh 2011
-- ^^^^^^
--  -- Added Sync burst support for the Numonyx flash during read
-- ~~~~~~
-- ~~~~~~
--  SK 10/20/12
-- ^^^^^^
--  -- Fixed CR 672770 - BRESP signal is driven X during netlist simulation
--  -- Fixed CR 673491 - Flash transactions generates extra read cycle after the actual reads are over
-- ~~~~~~
-------------------------------------------------------------------------------
-- Naming Conventions:
--      active low signals:                     "*_n"
--      clock signals:                          "clk", "clk_div#", "clk_#x"
--      reset signals:                          "rst", "rst_n"
--      generics:                               "C_*"
--      user defined types:                     "*_TYPE"
--      state machine next state:               "*_ns"
--      state machine current state:            "*_cs"
--      combinatorial signals:                  "*_cmb"
--      pipelined or register delay signals:    "*_d#"
--      counter signals:                        "*cnt*"
--      clock enable signals:                   "*_ce"
--      internal version of output port         "*_i"
--      device pins:                            "*_pin"
--      ports:                                  - Names begin with Uppercase
--      processes:                              "*_PROCESS"
--      component instantiations:               "<ENTITY_>I_<#|FUNC>
-------------------------------------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.all;
    use ieee.std_logic_signed.all;
    use ieee.std_logic_misc.all;
    use ieee.numeric_std.all;
    use ieee.std_logic_unsigned.all;

-------------------------------------------------------------------------------
-- emc_common_v3_0_5 library is used for emc_common component declarations
-------------------------------------------------------------------------------

library emc_common_v3_0_5;
    use emc_common_v3_0_5.all;

-------------------------------------------------------------------------------
-- Definition of Generics:
--
--  C_NUM_BANKS_MEM                 -- Number of memory banks
--  C_IPIF_DWIDTH                   -- Width of processor data bus
--  C_IPIF_AWIDTH                   -- Width of processor address bus
--  C_MEM(0:3)_BASEADDR             -- Memory bank (0:3) base address
--  C_MEM(0:3)_HIGHADDR             -- Memory bank (0:3) high address
--  C_INCLUDE_NEGEDGE_IOREGS        -- Include negative edge IO registers
--  C_PAGEMODE_FLASH_(0:3)          -- Whether a PAGE MODE Flash device is used
--  C_MEM(0:3)_WIDTH                -- Width of memory bank's data bus
--  C_MAX_MEM_WIDTH                 -- Maximum width of memory data bus
--  C_INCLUDE_DATAWIDTH_MATCHING_(0:3)  -- Include datawidth matching logic for
--                                  -- memory bank
--  C_BUS_CLOCK_PERIOD_PS           -- Bus clock period to calculate wait
--                                         state pulse widths.
--  C_SYNCH_MEM_(0:3)               -- Memory bank is synchronous
--  C_TCEDV_PS_MEM_(0:3)            -- Chip Enable to Data Valid Time
--                                  -- (Maximum of TCEDV and TAVDV applied
--                                     as read cycle start to first data valid)
--  C_TAVDV_PS_MEM_(0:3)            -- Address Valid to Data Valid Time
--                                  -- (Maximum of TCEDV and TAVDV applied
--                                     as read cycle start to first data valid)
--  C_TPACC_PS_FLASH_(0:3)          -- Address Valid to Data Valid Time
--                                  -- for a PAGE Read for a PAGE MODE Flash
--  C_THZCE_PS_MEM_(0:3)            -- Chip Enable High to Data Bus High
--                                     Impedance (Maximum of THZCE and THZOE
--                                     applied as Read Recovery before Write)
--  C_THZOE_PS_MEM_(0:3)            -- Output Enable High to Data Bus High
--                                     Impedance (Maximum of THZCE and THZOE
--                                     applied as Read Recovery before Write)
--  C_TWC_PS_MEM_(0:3)              -- Write Cycle Time
--                                     (Maximum of TWC and TWP applied as write
--                                     enable pulse width)
--  C_TWP_PS_MEM_(0:3)              -- Write Enable Minimum Pulse Width
--                                     (Maximum of TWC and TWP applied as write
--                                     enable pulse width)
--  C_TLZWE_PS_MEM_(0:3)            -- Write Enable High to Data Bus Low
--                                     Impedance (Applied as Write Recovery
--                                     before Read)
-- C_WR_REC_TIME_MEM_(0:3)          -- Write recovery time between the write
--                                  -- and next consecutive read transaction
-- Definition of Ports:
--
--  Bus2IP_Clk             -- System clock
--  RdClk                  -- Read Clock
--  Bus2IP_Reset           -- System Reset
--
-- Bus and IPIC Interface signals
--  Bus2IP_Addr             -- Processor bus address
--  Bus2IP_BE               -- Processor bus byte enables
--  Bus2IP_Data             -- Processor data
--  Bus2IP_RNW              -- Processor read not write
--  Bus2IP_Burst            -- Processor burst
--  Bus2IP_WrReq            -- Processor write request
--  Bus2IP_RdReq            -- Processor read request
--  Bus2IP_Mem_CS           -- Memory address range is being accessed
--
-- EMC to bus signals
--  IP2Bus_Data             -- Data to processor bus
--  IP2Bus_errAck           -- Error acknowledge
--  IP2Bus_retry            -- Retry indicator
--  IP2Bus_toutSup          -- Suppress watch dog timer
--  IP2Bus_RdAck            -- Read acknowledge
--  IP2Bus_WrAck            -- Write acknowledge
--  IP2Bus_AddrAck          -- Read/Write Address acknowledge
--
-- Memory signals
--  Mem_A                   -- Memory address inputs
--  Mem_DQ_I                -- Memory input data bus
--  Mem_DQ_O                -- Memory output data bus
--  Mem_DQ_T                -- Memory data output enable
--  Mem_CEN                 -- Memory chip select
--  Mem_OEN                 -- Memory output enable
--  Mem_WEN                 -- Memory write enable
--  Mem_QWEN                -- Memory qualified write enable
--  Mem_BEN                 -- Memory byte enables
--  Mem_RPN                 -- Memory reset/power down
--  Mem_CE                  -- Memory chip enable
--  Mem_ADV_LDN             -- Memory counter advance/load (=0)
--  Mem_LBON                -- Memory linear/interleaved burst order (=0)
--  Mem_CKEN                -- Memory clock enable (=0)
--  Mem_RNW                 -- Memory read not write
-------------------------------------------------------------------------------
-- Port declarations
-------------------------------------------------------------------------------

entity EMC is
    generic (
        C_NUM_BANKS_MEM                 : integer range 1 to 4 := 1;

        C_IPIF_DWIDTH                   : integer := 32;
        C_IPIF_AWIDTH                   : integer := 32;

        C_PAGE_SIZE                     : integer := 16;

        C_MEM0_BASEADDR                 : std_logic_vector := x"30000000";
        C_MEM0_HIGHADDR                 : std_logic_vector := x"3000ffff";
        C_MEM1_BASEADDR                 : std_logic_vector := x"40000000";
        C_MEM1_HIGHADDR                 : std_logic_vector := x"4000ffff";
        C_MEM2_BASEADDR                 : std_logic_vector := x"50000000";
        C_MEM2_HIGHADDR                 : std_logic_vector := x"5000ffff";
        C_MEM3_BASEADDR                 : std_logic_vector := x"60000000";
        C_MEM3_HIGHADDR                 : std_logic_vector := x"6000ffff";

        C_INCLUDE_NEGEDGE_IOREGS        : integer := 0;
        C_PAGEMODE_FLASH_0              : integer := 0;
        C_PAGEMODE_FLASH_1              : integer := 0;
        C_PAGEMODE_FLASH_2              : integer := 0;
        C_PAGEMODE_FLASH_3              : integer := 0;

        C_MEM0_WIDTH                    : integer range 8 to 64 := 32;
        C_MEM1_WIDTH                    : integer range 8 to 64 := 32;
        C_MEM2_WIDTH                    : integer range 8 to 64 := 32;
        C_MEM3_WIDTH                    : integer range 8 to 64 := 32;
        C_MAX_MEM_WIDTH                 : integer range 8 to 64 := 32;

        C_MEM0_TYPE                    : integer range 0 to 5  := 0;
        C_MEM1_TYPE                    : integer range 0 to 5  := 0;
        C_MEM2_TYPE                    : integer range 0 to 5  := 0;
        C_MEM3_TYPE                    : integer range 0 to 5  := 0;

        C_PARITY_TYPE_0                : integer range 0 to 2  := 0;
        C_PARITY_TYPE_1                : integer range 0 to 2  := 0;
        C_PARITY_TYPE_2                : integer range 0 to 2  := 0;
        C_PARITY_TYPE_3                : integer range 0 to 2  := 0;

        C_INCLUDE_DATAWIDTH_MATCHING_0  : integer := 0;
        C_INCLUDE_DATAWIDTH_MATCHING_1  : integer := 0;
        C_INCLUDE_DATAWIDTH_MATCHING_2  : integer := 0;
        C_INCLUDE_DATAWIDTH_MATCHING_3  : integer := 0;

        C_BUS_CLOCK_PERIOD_PS           : integer := 10000;

        -- Memory Channel 0 Timing Parameters
        C_SYNCH_MEM_0                   : integer := 0;
        --C_SUPPORT_SYNC_RD_0             : integer := 0;
        C_SYNCH_PIPEDELAY_0             : integer := 2;
        C_TCEDV_PS_MEM_0                : integer := 15000;
        C_TAVDV_PS_MEM_0                : integer := 15000;
        C_TPACC_PS_FLASH_0              : integer := 25;
        C_THZCE_PS_MEM_0                : integer := 7000;
        C_THZOE_PS_MEM_0                : integer := 7000;
        C_TWC_PS_MEM_0                  : integer := 15000;
        C_TWP_PS_MEM_0                  : integer := 12000;
        C_TWPH_PS_MEM_0                 : integer := 12000;
        C_TLZWE_PS_MEM_0                : integer := 0;
        C_WR_REC_TIME_MEM_0             : integer := 100000;


        -- Memory Channel 1 Timing Parameters
        C_SYNCH_MEM_1                   : integer := 0;
        --C_SUPPORT_SYNC_RD_1             : integer := 0;
        C_SYNCH_PIPEDELAY_1             : integer := 2;
        C_TCEDV_PS_MEM_1                : integer := 15000;
        C_TAVDV_PS_MEM_1                : integer := 15000;
        C_TPACC_PS_FLASH_1              : integer := 25000;
        C_THZCE_PS_MEM_1                : integer := 7000;
        C_THZOE_PS_MEM_1                : integer := 7000;
        C_TWC_PS_MEM_1                  : integer := 15000;
        C_TWP_PS_MEM_1                  : integer := 12000;
        C_TWPH_PS_MEM_1                 : integer := 12000;
        C_TLZWE_PS_MEM_1                : integer := 0;
        C_WR_REC_TIME_MEM_1             : integer := 100000;

        -- Memory Channel 2 Timing Parameters
        C_SYNCH_MEM_2                   : integer := 0;
        --C_SUPPORT_SYNC_RD_2             : integer := 0;
        C_SYNCH_PIPEDELAY_2             : integer := 2;
        C_TCEDV_PS_MEM_2                : integer := 15000;
        C_TAVDV_PS_MEM_2                : integer := 15000;
        C_TPACC_PS_FLASH_2              : integer := 25000;
        C_THZCE_PS_MEM_2                : integer := 7000;
        C_THZOE_PS_MEM_2                : integer := 7000;
        C_TWC_PS_MEM_2                  : integer := 15000;
        C_TWP_PS_MEM_2                  : integer := 12000;
        C_TWPH_PS_MEM_2                 : integer := 12000;
        C_TLZWE_PS_MEM_2                : integer := 0;
        C_WR_REC_TIME_MEM_2             : integer := 100000;

        -- Memory Channel 3 Timing Parameters
        C_SYNCH_MEM_3                   : integer := 0;
        --C_SUPPORT_SYNC_RD_3             : integer := 0;
        C_SYNCH_PIPEDELAY_3             : integer := 2;
        C_TCEDV_PS_MEM_3                : integer := 15000;
        C_TAVDV_PS_MEM_3                : integer := 15000;
        C_TPACC_PS_FLASH_3              : integer := 25000;
        C_THZCE_PS_MEM_3                : integer := 7000;
        C_THZOE_PS_MEM_3                : integer := 7000;
        C_TWC_PS_MEM_3                  : integer := 15000;
        C_TWP_PS_MEM_3                  : integer := 12000;
        C_TWPH_PS_MEM_3                 : integer := 12000;
        C_TLZWE_PS_MEM_3                : integer := 0    ;
        C_WR_REC_TIME_MEM_3             : integer := 100000
    );
    port (
        Bus2IP_Clk          : in  std_logic;
        RdClk               : in  std_logic;
        Bus2IP_Reset        : in  std_logic;

        -- Bus and IPIC Interface signals
        Bus2IP_Addr         : in  std_logic_vector(0 to C_IPIF_AWIDTH-1);
        Bus2IP_BE           : in  std_logic_vector(0 to C_IPIF_DWIDTH/8-1);
        Bus2IP_Data         : in  std_logic_vector(0 to C_IPIF_DWIDTH-1);
        Bus2IP_RNW          : in  std_logic;
        Bus2IP_Burst        : in  std_logic;
        Bus2IP_WrReq        : in  std_logic;
        Bus2IP_RdReq        : in  std_logic;
        Bus2IP_Mem_CS       : in  std_logic_vector(0 to C_NUM_BANKS_MEM-1);
        Bus2IP_BurstLength  : in  std_logic_vector (0 to 7);
        Linear_flash_brst_rd_flag : in std_logic;
        Linear_flash_rd_data_ack  : in std_logic;
        Bus2IP_RdReq_emc : in  std_logic;
        Bus2IP_WrReq_emc : in  std_logic;

        IP2Bus_Data         : out std_logic_vector(0 to C_IPIF_DWIDTH-1);
        IP2Bus_errAck       : out std_logic;
        IP2Bus_retry        : out std_logic;
        IP2Bus_toutSup      : out std_logic;
        IP2Bus_RdAck        : out std_logic;
        IP2Bus_WrAck        : out std_logic;
        IP2Bus_AddrAck      : out std_logic;

        parity_error_adrss  : out  std_logic_vector(0 to C_IPIF_AWIDTH-1);
        parity_error_mem    : out  std_logic_vector(0 to 1);
        Type_of_xfer        : in  std_logic;
        psram_page_mode     : in  std_logic;
        original_wrce       : in std_logic;

        Mem_DQ_I            : in  std_logic_vector(0 to C_MAX_MEM_WIDTH-1);
        Mem_DQ_O            : out std_logic_vector(0 to C_MAX_MEM_WIDTH-1);
        Mem_DQ_T            : out std_logic_vector(0 to C_MAX_MEM_WIDTH-1);

        Mem_DQ_PRTY_I       : in  std_logic_vector(0 to C_MAX_MEM_WIDTH/8-1);
        Mem_DQ_PRTY_O       : out std_logic_vector(0 to C_MAX_MEM_WIDTH/8-1);
        Mem_DQ_PRTY_T       : out std_logic_vector(0 to C_MAX_MEM_WIDTH/8-1);

        Mem_A               : out std_logic_vector(0 to C_IPIF_AWIDTH-1);
        Mem_RPN             : out std_logic;
        Mem_CEN             : out std_logic_vector(0 to C_NUM_BANKS_MEM-1);
        Mem_OEN             : out std_logic_vector(0 to C_NUM_BANKS_MEM-1);
        Mem_WEN             : out std_logic;
        Mem_QWEN            : out std_logic_vector(0 to C_MAX_MEM_WIDTH/8-1);
        Mem_BEN             : out std_logic_vector(0 to C_MAX_MEM_WIDTH/8-1);
        Mem_CE              : out std_logic_vector(0 to C_NUM_BANKS_MEM-1);
        Mem_ADV_LDN         : out std_logic;
        Mem_LBON            : out std_logic;
        Mem_CKEN            : out std_logic;
        Mem_RNW             : out std_logic;
        Cre_reg_en	    : in  std_logic;
        Mem_WAIT	    : in  std_logic;
        Synch_mem12 : out std_logic;
        last_addr1 : in std_logic;
        pr_idle : out std_logic; -- 11-12-2012
	axi_trans_size_reg : in std_logic_vector(1 downto 0); -- 1/3/2013
   axi_wvalid : in std_logic;
   axi_wlast : in std_logic;
        axi_arsize    : in  std_logic_vector(2 downto 0);
  Parity_err : out std_logic

    );
end entity EMC;

-------------------------------------------------------------------------------
-- Architecture section
-------------------------------------------------------------------------------

architecture imp of EMC is
-------------------------------------------------------------------------------
-- Function log2 -- returns number of bits needed to encode x choices
--   x = 0  returns 0
--   x = 1  returns 0
--   x = 2  returns 1
--   x = 4  returns 2, etc.
-------------------------------------------------------------------------------
--
function log2(x : natural) return integer is
  variable i  : integer := 0; 
  variable val: integer := 1;
begin 
  if x = 0 then return 0;
  else
    for j in 0 to 29 loop -- for loop for XST 
      if val >= x then null; 
      else
        i := i+1;
        val := val*2;
      end if;
    end loop;
  -- Fix per CR520627  XST was ignoring this anyway and printing a  
  -- Warning in SRP file. This will get rid of the warning and not
  -- impact simulation.  
  -- synthesis translate_off
    assert val >= x
      report "Function log2 received argument larger" &
             " than its capability of 2^30. "
      severity failure;
  -- synthesis translate_on
    return i;
  end if;  
end function log2;    
-------------------------------------------------------------------------------
-- Function max2
--
-- This function returns the greater of two numbers.
-------------------------------------------------------------------------------
function max2 (num1, num2 : integer) return integer is
begin
    if num1 >= num2 then
        return num1;
    else
        return num2;
    end if;
end function max2;
----------------------------------------------------------------------------------
-- below attributes are added to reduce the synth warnings in Vivado tool
attribute DowngradeIPIdentifiedWarnings: string;
attribute DowngradeIPIdentifiedWarnings of imp : architecture is "yes";
----------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Data Types
-------------------------------------------------------------------------------

type EMC_ARRAY_TYPE is array (0 to 3) of integer;
-- type EMC_ARRAY_TYPE is array (0 to C_NUM_BANKS_MEM-1) of integer;

type INTEGER_ARRAY is array (natural range <>) of integer;

type MEM_ADDR_ARRAY is array (0 to C_NUM_BANKS_MEM-1) of
                                        std_logic_vector(0 to C_IPIF_AWIDTH-1);
-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- not_all_zeros()
-------------------------------------------------------------------------------
function not_all_zeros(input_array          : EMC_ARRAY_TYPE;
                       num_real_elements    : integer)
                       return integer is
    variable sum : integer range 0 to 16 := 0;
    begin
        for i in 0 to num_real_elements -1 loop
            sum := sum + input_array(i);
        end loop;

        if sum = 0 then
            return 0;
        else
            return 1;
        end if;
    end function not_all_zeros;
--------------------------------------------------------------------------------
function check_flash_mem(input_array          : EMC_ARRAY_TYPE; -- 9/7/2011
                         num_real_elements    : integer)
                         return integer is
    variable sum : integer range 0 to 10 := 0;
    begin
	for i in 0 to num_real_elements -1 loop
            if(input_array(i) = 2)or
	      (input_array(i) = 3)or
	      (input_array(i) = 5)or
	      (input_array(i) = 4)then
	    sum := sum + 1;
	    end if;
        end loop;
	if sum = 0 then
	   return 0;
	else
	   return 1;
	end if;
end function check_flash_mem;
-- --------------------------------------------------------------------------------
-- -- flash_supports_sync_rd: below function is used to check if any of the memories in the assigned
-- --                         memory location is of Linear Flash which supports Sync Burst Read mode
-- --------------------------------------------------------------------------------
-- function flash_supports_sync_rd (input_flash_array    : EMC_ARRAY_TYPE;
--                                  num_of_mem_banks     : integer)
--                                  return integer is
--     variable flash_sync_rd : integer range 0 to 1 := 0;
--     begin
--         for i in 0 to num_of_mem_banks -1 loop
--             flash_sync_rd := flash_sync_rd + input_flash_array(i);
--         end loop;
--
--         if flash_sync_rd = 0 then
--             return 0;
--         else
--             return 1;
--         end if;
-- end function flash_supports_sync_rd;
-- -------------------------------------------------------------------------------
-- Constant Declarations
-------------------------------------------------------------------------------
-- minimum memory data width supported is 8 bits
constant MIN_MEM_WIDTH      : integer := 8;

-- address offset
constant ADDR_OFFSET        : integer range 0 to 4
                            := log2(C_IPIF_DWIDTH/8);

constant ADDR_CNTR_WIDTH    : integer range 1 to 5
                            := max2(1,log2(C_IPIF_DWIDTH/8));

-- create arrays of generics for use in functions
constant SYNCH_MEM_ARRAY : EMC_ARRAY_TYPE :=
       (C_SYNCH_MEM_0,
        C_SYNCH_MEM_1,
        C_SYNCH_MEM_2,
        C_SYNCH_MEM_3);

constant DATAWIDTH_MATCH_ARRAY : EMC_ARRAY_TYPE :=
       (C_INCLUDE_DATAWIDTH_MATCHING_0,
        C_INCLUDE_DATAWIDTH_MATCHING_1,
        C_INCLUDE_DATAWIDTH_MATCHING_2,
        C_INCLUDE_DATAWIDTH_MATCHING_3);

constant C_PAGEMODE_FLASH : EMC_ARRAY_TYPE :=
       (C_PAGEMODE_FLASH_0,
        C_PAGEMODE_FLASH_1,
        C_PAGEMODE_FLASH_2,
        C_PAGEMODE_FLASH_3);

-- constant C_FLASH_SUPPORTS_SYNC_RD : EMC_ARRAY_TYPE :=
--        (
--         C_SUPPORT_SYNC_RD_0,
--         C_SUPPORT_SYNC_RD_1,
--         C_SUPPORT_SYNC_RD_2,
--         C_SUPPORT_SYNC_RD_3
--        );

type MEM_PARITY_ARRAY_TYPE is array (0 to 3) of integer range 0 to 2;

 constant MEM_PARITY_TYPE_ARRAY : EMC_ARRAY_TYPE :=
            (
                C_PARITY_TYPE_0,
                C_PARITY_TYPE_1,
                C_PARITY_TYPE_2,
                C_PARITY_TYPE_3
            );

-- constant C_WRITE_RECOVERY_TIME : EMC_ARRAY_TYPE :=
--             (
--                 C_WR_REC_TIME_MEM_0,
--                 C_WR_REC_TIME_MEM_1,
--                 C_WR_REC_TIME_MEM_2,
--                 C_WR_REC_TIME_MEM_3
--             );
constant C_FLASH_TYPE_MEM : EMC_ARRAY_TYPE :=
       (C_MEM0_TYPE,
        C_MEM1_TYPE,
        C_MEM2_TYPE,
        C_MEM3_TYPE);

-------------------------------------------------------------------------------
-- Create global constants that indicate if any data matching is needed or if
-- any memories are synchronous. These can be used to eliminate un-necessary
-- logic.
-------------------------------------------------------------------------------
-- check for any memory in configuration is SYNC type or not.
constant GLOBAL_SYNC_MEM    : integer range 0 to 1
                            := not_all_zeros(SYNCH_MEM_ARRAY,
                                             C_NUM_BANKS_MEM);

-- check for any memory in configuration needs Data Width Matching or not.
constant GLOBAL_DATAWIDTH_MATCH : integer range 0 to 1
                                := not_all_zeros(DATAWIDTH_MATCH_ARRAY,
                                                 C_NUM_BANKS_MEM);

-- check for any memory in configuration is Page Mode Flash type or not.
constant PAGEMODE_FLASH : integer range 0 to 1
                        := not_all_zeros(C_PAGEMODE_FLASH,
                                         C_NUM_BANKS_MEM);
--constant C_FLASH_SYNC_RD : integer range 0 to 1
--                       := flash_supports_sync_rd(C_FLASH_SUPPORTS_SYNC_RD,
--                                                 C_NUM_BANKS_MEM);
-- check for any memory in configuration is parity enabled or not.
-- 0 - no parity
-- 1 - odd parity
-- 2 - even parity
constant PARITY_TYPE_MEMORY : integer range 0 to 2
                            := not_all_zeros(MEM_PARITY_TYPE_ARRAY,
                                             C_NUM_BANKS_MEM);

constant FLASH_TYP_MEM : integer range 0 to 1
		       := check_flash_mem(C_FLASH_TYPE_MEM,
                                          C_NUM_BANKS_MEM);
-------------------------------------------------------------------------------
-- Memory Cycle Time Calculations
-------------------------------------------------------------------------------
-- Read Cycle (maximum of CE or Address Change to Valid Data)
-- Note: Minimum 1 extra clock is required to interface from the asynchronous
-- environment to a synchronous environment.
-------------------------------------------------------------------------------
-- C_TCEDV_PS_MEM_x:
--          Read cycle chip enable low to data valid duration of memory bank x
-- C_TAVDV_PS_MEM_x:
--          Read cycle address valid to data valid duration of memory bank x
-- CE ----\
--         \-------------
--         _ _ _ _ _ _
-- Addr __/
--        \_ _ _ _ _ _
--
--        TRD_CLKS_x
--        |<------>|
--                   _ _ _ _ _
-- Data _ _ _ _ _ __/
--                  \_ _ _ _ _

constant TRD_CLKS_0 : integer range 0 to 31
                 := ((max2(1,max2(C_TCEDV_PS_MEM_0,
                                  C_TAVDV_PS_MEM_0))-1)/C_BUS_CLOCK_PERIOD_PS);

constant TRD_CLKS_1 : integer range 0 to 31
                 := ((max2(1,max2(C_TCEDV_PS_MEM_1,
                                  C_TAVDV_PS_MEM_1))-1)/C_BUS_CLOCK_PERIOD_PS);

constant TRD_CLKS_2 : integer range 0 to 31
                 := ((max2(1,max2(C_TCEDV_PS_MEM_2,
                                  C_TAVDV_PS_MEM_2))-1)/C_BUS_CLOCK_PERIOD_PS);

constant TRD_CLKS_3 : integer range 0 to 31
                 := ((max2(1,max2(C_TCEDV_PS_MEM_3,
                                  C_TAVDV_PS_MEM_3))-1)/C_BUS_CLOCK_PERIOD_PS);

-- std logic vector counter for rd_clks_x
constant TRDCNT_0 : std_logic_vector(0 to 4)
                  := conv_std_logic_vector(TRD_CLKS_0+1, 5);

constant TRDCNT_1 : std_logic_vector(0 to 4)
                  := conv_std_logic_vector(TRD_CLKS_1+1, 5);

constant TRDCNT_2 : std_logic_vector(0 to 4)
                  := conv_std_logic_vector(TRD_CLKS_2+1, 5);

constant TRDCNT_3 : std_logic_vector(0 to 4)
                  := conv_std_logic_vector(TRD_CLKS_3+1, 5);

-----------------------------------------------------------------------------

-- TRD_TPACC_x: Page access time of memory bank x in page mode flash mode
constant TRD_TPACC_0 :integer range 0 to 31 --:= (0);
                     := (C_TPACC_PS_FLASH_0/C_BUS_CLOCK_PERIOD_PS);

constant TRD_TPACC_1 :integer range 0 to 31       --:= (0);
                     := (C_TPACC_PS_FLASH_1/C_BUS_CLOCK_PERIOD_PS);

constant TRD_TPACC_2 :integer range 0 to 31    --:= (0);
                     := (C_TPACC_PS_FLASH_2/C_BUS_CLOCK_PERIOD_PS);

constant TRD_TPACC_3 :integer range 0 to 31    -- := (0);
                     := (C_TPACC_PS_FLASH_3/C_BUS_CLOCK_PERIOD_PS);

-- TRD_TPACC_x: std logic vector counter for Page Access Time
constant TPACC_0    : std_logic_vector(0 to 4)
                    := conv_std_logic_vector(TRD_TPACC_0+1, 5);

constant TPACC_1    : std_logic_vector(0 to 4)
                    := conv_std_logic_vector(TRD_TPACC_1+1, 5);

constant TPACC_2    : std_logic_vector(0 to 4)
                    := conv_std_logic_vector(TRD_TPACC_2+1, 5);

constant TPACC_3    : std_logic_vector(0 to 4)
                    := conv_std_logic_vector(TRD_TPACC_3+1, 5);


-------------------------------------------------------------------------------
-- Read Cycle End to Data Bus High Impedance
-------------------------------------------------------------------------------
-- C_THZCE_PS_MEM_x:
--          Read cycle chip enable low to data valid duration of memory bank x
-- C_THZOE_PS_MEM_x:
--          Enable high to data bus high impedance duration of memory bank x
-- CE ----\                      /--------
--         \-----------xx-------/
-- OE ----\                      /--------
--         \-----------xx-------/
--                              THZ_CLKS_x
--                              |<------->|
--                   _ _ _ _ _ _ _ _ _ _ _
-- Data _ _ _ _ _ __/                     \_ _ _ _
--                  \_ _ _ _ _ _ _ _ _ _ _/
constant THZ_CLKS_0 : integer range 0 to 31
                  := ((max2(1,max2(C_THZCE_PS_MEM_0,
                                   C_THZOE_PS_MEM_0))-1)/C_BUS_CLOCK_PERIOD_PS);

constant THZ_CLKS_1 : integer range 0 to 31
                  := ((max2(1,max2(C_THZCE_PS_MEM_1,
                                   C_THZOE_PS_MEM_1))-1)/C_BUS_CLOCK_PERIOD_PS);

constant THZ_CLKS_2 : integer range 0 to 31
                  := ((max2(1,max2(C_THZCE_PS_MEM_2,
                                   C_THZOE_PS_MEM_2))-1)/C_BUS_CLOCK_PERIOD_PS);

constant THZ_CLKS_3 : integer range 0 to 31
                  := ((max2(1,max2(C_THZCE_PS_MEM_3,
                                   C_THZOE_PS_MEM_3))-1)/C_BUS_CLOCK_PERIOD_PS);

-- HZ counter in std logic vector
constant THZCNT_0   : std_logic_vector(0 to 4)
                    := conv_std_logic_vector(THZ_CLKS_0+1, 5);

constant THZCNT_1   : std_logic_vector(0 to 4)
                    := conv_std_logic_vector(THZ_CLKS_1+1, 5);

constant THZCNT_2   : std_logic_vector(0 to 4)
                    := conv_std_logic_vector(THZ_CLKS_2+1, 5);

constant THZCNT_3   : std_logic_vector(0 to 4)
                    := conv_std_logic_vector(THZ_CLKS_3+1, 5);

-------------------------------------------------------------------------------
-- Write Cycle to Data Store
-------------------------------------------------------------------------------
-- C_TWC_PS_MEM_x:
--                Write cycle time of memory bank x
-- C_TWP_PS_MEM_x:
--                Write enable minimum pulse width duration of memory bank x

constant TWR_CLKS_0 : integer range 0 to 31
                    := ((max2(1,max2(C_TWC_PS_MEM_0,
                                     C_TWP_PS_MEM_0))-1)/C_BUS_CLOCK_PERIOD_PS);

constant TWR_CLKS_1 : integer range 0 to 31
                    := ((max2(1,max2(C_TWC_PS_MEM_1,
                                     C_TWP_PS_MEM_1))-1)/C_BUS_CLOCK_PERIOD_PS);

constant TWR_CLKS_2 : integer range 0 to 31
                    := ((max2(1,max2(C_TWC_PS_MEM_2,
                                     C_TWP_PS_MEM_2))-1)/C_BUS_CLOCK_PERIOD_PS);

constant TWR_CLKS_3 : integer range 0 to 31
                    := ((max2(1,max2(C_TWC_PS_MEM_3,
                                     C_TWP_PS_MEM_3))-1)/C_BUS_CLOCK_PERIOD_PS);

-- TWRCNT_x: std logic vector counter for Write cycle Time
constant TWRCNT_0   : std_logic_vector(0 to 4)
                    := conv_std_logic_vector(TWR_CLKS_0, 5);

constant TWRCNT_1   : std_logic_vector(0 to 4)
                    := conv_std_logic_vector(TWR_CLKS_1, 5);

constant TWRCNT_2   : std_logic_vector(0 to 4)
                    := conv_std_logic_vector(TWR_CLKS_2, 5);

constant TWRCNT_3   : std_logic_vector(0 to 4)
                    := conv_std_logic_vector(TWR_CLKS_3, 5);


-------------------------------------------------------------------------------
-- Write Cycle High Period
-------------------------------------------------------------------------------

constant TWPH_CLKS_0 : integer range 0 to 31
                     := (C_TWPH_PS_MEM_0/C_BUS_CLOCK_PERIOD_PS);

constant TWPH_CLKS_1 : integer range 0 to 31
                     := (C_TWPH_PS_MEM_1/C_BUS_CLOCK_PERIOD_PS);

constant TWPH_CLKS_2 : integer range 0 to 31
                     := (C_TWPH_PS_MEM_2/C_BUS_CLOCK_PERIOD_PS);

constant TWPH_CLKS_3 : integer range 0 to 31
                     := (C_TWPH_PS_MEM_3/C_BUS_CLOCK_PERIOD_PS);

-- TWPHCNT_x: std logic vector counter for Write Cycle High Time
constant TWPHCNT_0   : std_logic_vector(0 to 4)
                     := conv_std_logic_vector(TWPH_CLKS_0+1, 5);

constant TWPHCNT_1   : std_logic_vector(0 to 4)
                     := conv_std_logic_vector(TWPH_CLKS_1+1, 5);

constant TWPHCNT_2   : std_logic_vector(0 to 4)
                      := conv_std_logic_vector(TWPH_CLKS_2+1, 5);

constant TWPHCNT_3   : std_logic_vector(0 to 4)
                     := conv_std_logic_vector(TWPH_CLKS_3+1, 5);



------------------------------------------------------------------------------
-- Write Cycle End Data Hold Time
-------------------------------------------------------------------------------
-- C_TLZWE_PS_MEM_x:
--                  Write cycle write enable high to data bus low impedance
--                  duration of memory bank x
-- WE ----\              /--------
--         \------------/
--                      TLZ_CLKS_x
--                      |<----->|
--         _ _ _ _ _ _ _ _ _ _ _
-- Data __/                     \_ _ _ _
--        \_ _ _ _ _ _ _ _ _ _ _/

constant TLZ_CLKS_0 : integer range 0 to 31
                    := ((max2(1,C_TLZWE_PS_MEM_0)-1)/C_BUS_CLOCK_PERIOD_PS);

constant TLZ_CLKS_1 : integer range 0 to 31
                    := ((max2(1,C_TLZWE_PS_MEM_1)-1)/C_BUS_CLOCK_PERIOD_PS);

constant TLZ_CLKS_2 : integer range 0 to 31
                    := ((max2(1,C_TLZWE_PS_MEM_2)-1)/C_BUS_CLOCK_PERIOD_PS);

constant TLZ_CLKS_3 : integer range 0 to 31
                    := ((max2(1,C_TLZWE_PS_MEM_3)-1)/C_BUS_CLOCK_PERIOD_PS);

-- TLZCNT_x: std logic vector counter for Write Cycle End Data Hold Time
constant TLZCNT_0   : std_logic_vector(0 to 4)
                    := conv_std_logic_vector(TLZ_CLKS_0+1, 5);

constant TLZCNT_1   : std_logic_vector(0 to 4)
                    := conv_std_logic_vector(TLZ_CLKS_1+1, 5);

constant TLZCNT_2   : std_logic_vector(0 to 4)
                    := conv_std_logic_vector(TLZ_CLKS_2+1, 5);

constant TLZCNT_3   : std_logic_vector(0 to 4)
                    := conv_std_logic_vector(TLZ_CLKS_3+1, 5);

--------------------------------------------------------------
-- Write recovery time for Flash. some idle time is needed for Flash memories
-- after write and begin of next consecutive read cycle.
-- TWR_REC_TIME_x: Write recovery time of memory bank x in flash mode

constant TWR_REC_TIME_0 :integer range 0 to 65535                      -- 7/4/2011
                     := (C_WR_REC_TIME_MEM_0/C_BUS_CLOCK_PERIOD_PS);

constant TWR_REC_TIME_1 :integer range 0 to 65535
                     := (C_WR_REC_TIME_MEM_1/C_BUS_CLOCK_PERIOD_PS);

constant TWR_REC_TIME_2 :integer range 0 to 65535
                     := (C_WR_REC_TIME_MEM_2/C_BUS_CLOCK_PERIOD_PS);

constant TWR_REC_TIME_3 :integer range 0 to 65535
                     := (C_WR_REC_TIME_MEM_3/C_BUS_CLOCK_PERIOD_PS);

constant TP_WR_REC_CNT_0    : std_logic_vector(0 to 15)
                    := conv_std_logic_vector(TWR_REC_TIME_0+1, 16);

constant TP_WR_REC_CNT_1    : std_logic_vector(0 to 15)
                    := conv_std_logic_vector(TWR_REC_TIME_1+1, 16);

constant TP_WR_REC_CNT_2    : std_logic_vector(0 to 15)
                    := conv_std_logic_vector(TWR_REC_TIME_2+1, 16);

constant TP_WR_REC_CNT_3    : std_logic_vector(0 to 15)
                    := conv_std_logic_vector(TWR_REC_TIME_3+1, 16);

-------------------------------------------------------------------------------
-- Signal Declarations
-------------------------------------------------------------------------------
-- Write Cycle Time
signal twr_data           : std_logic_vector(0 to 4);
signal twr_load           : std_logic;
signal twr_cnt_en         : std_logic;
signal twr_end            : std_logic;

-- Write Cycle High Time
signal twph_data           : std_logic_vector(0 to 4);
signal twph_load           : std_logic;
signal twph_cnt_en         : std_logic;
signal twph_end            : std_logic;

-- Write Cycle End To Data Bus Low-Z
signal tlz_data           : std_logic_vector(0 to 4);
signal tlz_load           : std_logic;
signal Tlz_cnt_en         : std_logic;
signal tlz_end            : std_logic;

-- Read Cycle End To Data Bus High-Z
signal thz_data           : std_logic_vector(0 to 4);
signal thz_load           : std_logic;
signal Thz_cnt_en         : std_logic;
signal thz_end            : std_logic;

-- Read Cycle Address Change to Valid Data
signal trd_data           : std_logic_vector(0 to 4);
signal trd_load           : std_logic;
signal trd_cnt_en         : std_logic;
signal trd_end            : std_logic;

-- Read Cycle Address Change to Valid Data
signal tpacc_data         : std_logic_vector(0 to 4);
signal tpacc_load         : std_logic;
signal tpacc_cnt_en       : std_logic;
signal tpacc_end          : std_logic;

-- Write recovery time for flash

-- signal twr_rec_data       : std_logic_vector(0 to 4);--7/4/2011
-- signal twr_rec_load       : std_logic;
-- signal twr_rec_cnt_en     : std_logic;
-- signal twr_rec_end        : std_logic;
signal twr_rec_data_int   : std_logic_vector(0 to 15);--7/4/2011
signal twr_rec_load_int   : std_logic;
signal twr_rec_cnt_en_int : std_logic;
signal twr_rec_end_int    : std_logic;

-- Memory Access IPIC Signals
signal bus2ip_cs_reg      : std_logic_vector(0 to C_NUM_BANKS_MEM-1);
signal bus2ip_cs_reg_d1   : std_logic_vector(0 to C_NUM_BANKS_MEM-1);
signal cs_Strobe          : std_logic;
signal new_page_access    : std_logic;
signal Parity_enable      : std_logic;
signal Parity_type        : std_logic;
signal Parity_err_i       : std_logic;
signal bus2Mem_CS         : std_logic;
signal bus2Mem_RdReq      : std_logic;
signal bus2Mem_WrReq      : std_logic;
signal mem2Bus_RdAck      : std_logic;
signal mem2Bus_WrAck      : std_logic;

signal mem2Bus_RdAddrAck  : std_logic;
signal mem2Bus_WrAddrAck  : std_logic;
signal mem2Bus_Data       : std_logic_vector(0 to C_IPIF_DWIDTH - 1);

signal write_req_ack      : std_logic;
signal read_req_ack       : std_logic;
signal read_data_en       : std_logic;
signal read_ack           : std_logic;

-- Memory Control Internal Signals
signal mem_CEN_cmb        : std_logic;
signal mem_OEN_cmb        : std_logic;
signal mem_WEN_cmb        : std_logic;
signal mem_RNW_cmb        : std_logic;

signal bus2ip_ben_int     : std_logic_vector(0 to C_IPIF_DWIDTH/8-1);
signal bus2ip_ben_fixed   : std_logic_vector(0 to C_IPIF_DWIDTH/8-1);
signal mem_a_int          : std_logic_vector(0 to C_IPIF_AWIDTH-1);
signal par_error_addr     : std_logic_vector(0 to C_IPIF_AWIDTH-1);

signal mem_dq_i_int       : std_logic_vector(0 to C_MAX_MEM_WIDTH-1);
signal mem_dq_o_int       : std_logic_vector(0 to C_MAX_MEM_WIDTH-1);
signal mem_dq_t_int       : std_logic_vector(0 to C_MAX_MEM_WIDTH-1);

signal mem_dq_parity_i_int : std_logic_vector(0 to C_MAX_MEM_WIDTH/8-1);
signal mem_dq_parity_o_int : std_logic_vector(0 to C_MAX_MEM_WIDTH/8-1);
signal mem_dq_parity_t_int : std_logic_vector(0 to C_MAX_MEM_WIDTH/8-1);

signal mem_cen_int        : std_logic_vector(0 to C_NUM_BANKS_MEM-1);
signal mem_oen_int        : std_logic_vector(0 to C_NUM_BANKS_MEM-1);
signal mem_wen_int        : std_logic;
signal mem_qwen_int       : std_logic_vector(0 to C_MAX_MEM_WIDTH/8-1);
signal mem_ben_int        : std_logic_vector(0 to C_MAX_MEM_WIDTH/8-1);
signal mem_rpn_int        : std_logic;
signal mem_ce_int         : std_logic_vector(0 to C_NUM_BANKS_MEM-1);
signal mem_adv_ldn_int    : std_logic;
signal mem_lbon_int       : std_logic;
signal mem_cken_int       : std_logic;
signal mem_rnw_int        : std_logic;
signal mem_be_int         : std_logic_vector(0 to C_MAX_MEM_WIDTH/8-1);

-- Data Width Matching Address Management
signal addr_cnt_ce        : std_logic;
signal addr_cnt_rst       : std_logic;
signal addr_cnt           : std_logic_vector(0 to ADDR_CNTR_WIDTH-1);
signal addr_align         : std_logic;
signal addr_align_rd      : std_logic;
signal addr_align_write   : std_logic;

signal CS_par_addr        : std_logic;


signal cycle_cnt_en       : std_logic;
signal cycle_cnt_ld       : std_logic;
signal cycle_End          : std_logic;
signal address_strobe     : std_logic;
signal data_strobe        : std_logic;

-- Access Parameters
signal mem_width_bytes    : std_logic_vector(0 to 3);
signal datawidth_match    : std_logic;
signal synch_mem1          : std_logic;
signal two_pipe_delay     : std_logic;
signal ip2Bus_RdAck_i     : std_logic;
signal IP2Bus_errAck_i : std_logic;

signal Mem_Addr_rst       : std_logic;
signal transaction_done_i : std_logic;
signal Bus2IP_Mem_CS_i    : std_logic;
signal single_transaction : std_logic;

signal  temp_parity_error_adrss: std_logic_vector(0 to C_IPIF_AWIDTH-1);
signal last_burst_cnt          : std_logic;

signal Write_req_data_ack : std_logic;
signal Write_req_addr_ack : std_logic;
signal address_strobe_c   : std_logic;
signal be_strobe_c        : std_logic;
signal data_strobe_c      : std_logic;
signal pr_state_wait_temp_cmb : std_logic;
signal ns_idle            : std_logic;

signal flash_mem_access_int : std_logic;
signal flash_mem_access_int_1 : std_logic;
signal int_Flash_mem_access_dis : std_logic;
signal Adv_L_N : std_logic;
signal stop_oen : std_logic;
signal bus2ip_ben_all_1 : std_logic;-- 12-12-2012

--signal Linear_flash_brst_rd_flag : std_logic;
--signal Linear_flash_rd_data_ack  : std_logic;
-------------------------------------------------------------------------------
-- Begin architecture
-------------------------------------------------------------------------------

begin

mem_rpn_int     <= not Bus2IP_Reset;
mem_adv_ldn_int <= '0';
mem_lbon_int    <= '0';
mem_cken_int    <= '0';
IP2Bus_RdAck    <= ip2Bus_RdAck_i;
IP2Bus_errAck <= IP2Bus_errAck_i;
Parity_err <= Parity_err_i;
Bus2IP_Mem_CS_i <= or_reduce(Bus2IP_Mem_CS);

    ---------------------------------------------------------------------------
    -- Store the Chip Select Coming from IPIF in case C_NUM_BANKS_MEM > 1
    ---------------------------------------------------------------------------

    CS_STORE_GEN: if (C_NUM_BANKS_MEM > 1) generate
    begin
        CS_STORE_PROCESS:process(Bus2IP_Clk)
        begin

            if (Bus2IP_Clk'event and Bus2IP_Clk = '1') then
                if Bus2IP_Reset = '1' then
                    bus2ip_cs_reg_d1  <= (others=>'0');
                else
                    bus2ip_cs_reg_d1  <= bus2ip_cs_reg;
                end if;
           end if;
        end process CS_STORE_PROCESS;


       bus2ip_cs_reg  <= Bus2IP_Mem_CS when (cs_Strobe = '1')
                         else
                         bus2ip_cs_reg_d1;

    end generate CS_STORE_GEN;

    ---------------------------------------------------------------------------
    -- Pass on the Chip Select Coming from IPIF in case C_NUM_BANKS_MEM = 1
    ---------------------------------------------------------------------------

    CS_PASS_GEN: if (C_NUM_BANKS_MEM = 1) generate
    -----
    function int_to_std (flash_type: integer) return std_logic is
    begin
    if (flash_type = 1) then
    	return '1';
    else
    	return '0';
    end if;

    end function;
 ------------------------------------------------------------------------------

    begin
    -----
        bus2ip_cs_reg  <= Bus2IP_Mem_CS;

        flash_mem_access_int_1 <= int_to_std(FLASH_TYP_MEM);

     end generate CS_PASS_GEN;
 ------------------------------------------------------------------------------
  -- Generate single transaction signals for multiple memory banks.
  ------------------------------------------------------------------------------
        SINGLE_BURST_GEN_PROCESS: process(Bus2IP_Mem_CS,
                                          bus2ip_burst,
                                          Bus2IP_BurstLength)is
        -----
        begin
        -----
             single_transaction  <= '0';
             for i in 0 to C_NUM_BANKS_MEM -1 loop
                 if(Bus2IP_Mem_CS(i) = '1' and
                    --bus2ip_burst= '0'      and
                    or_reduce(Bus2IP_BurstLength) = '0') then -- = "00000000") then
                        single_transaction  <= '1';
                 end if;
             end loop;
        end process SINGLE_BURST_GEN_PROCESS;

    ----------------------------------------------------------------
    MULTIPLE_MEM_FLASH_ACCESS_GEN: if (C_NUM_BANKS_MEM > 1) generate
    -----
    begin
    -----
	REG_FLASH_ACCESS: process(Bus2IP_Clk)is
	begin
	if (Bus2IP_Clk'event and Bus2IP_Clk = '1') then
	   if(flash_mem_access_int = '1') then
	      flash_mem_access_int_1 <= '1';
	   elsif(Bus2IP_Reset = '1' or int_Flash_mem_access_dis = '1')then
	      flash_mem_access_int_1 <= '0';
	   end if;

	end if;

	end process REG_FLASH_ACCESS;

	FLASH_ACCESS_PROCESS: process (Bus2IP_Mem_CS) is
	-----
	begin
	-----
	     flash_mem_access_int <= '0';
	     for i in 0 to C_NUM_BANKS_MEM -1 loop
	         if((Bus2IP_Mem_CS(i) = '1') and
	            ((C_FLASH_TYPE_MEM(i) = 2)or -- check if the memory is flash,page mode flash
		     (C_FLASH_TYPE_MEM(i) = 3)or
		     (C_FLASH_TYPE_MEM(i) = 4)or
                     (C_FLASH_TYPE_MEM(i) = 5)
		    )) then
	                flash_mem_access_int <= '1';
	         --else
	         --     flash_mem_access_int <= '0';
	         end if;
	     end loop;
	end process FLASH_ACCESS_PROCESS;
    	---------------------------------

    end generate MULTIPLE_MEM_FLASH_ACCESS_GEN;
    -------------------------------------------
-------------------------------------------------------------------------------
-- IPIC Interface
-------------------------------------------------------------------------------

IPIC_IF_I : entity emc_common_v3_0_5.ipic_if
    generic map (
        C_NUM_BANKS_MEM   => C_NUM_BANKS_MEM,

        C_IPIF_DWIDTH     => C_IPIF_DWIDTH
    )
    port map (
        Bus2IP_Clk        => Bus2IP_Clk              ,
        Bus2IP_Reset      => Bus2IP_Reset            ,

        Bus2IP_RNW        => Bus2IP_RNW              ,--  in  std_logic;
        Bus2IP_Mem_CS     => Bus2IP_Mem_CS           ,--  in  std_logic_vector

        Mem2Bus_RdAddrAck => mem2Bus_RdAddrAck       ,--  in  std_logic;
        Mem2Bus_WrAddrAck => mem2Bus_WrAddrAck       ,--  in  std_logic;
        Mem2Bus_RdAck     => mem2Bus_RdAck           ,--  in  std_logic;
        Mem2Bus_WrAck     => mem2Bus_WrAck           ,--  in  std_logic;
        Mem2Bus_Data      => mem2Bus_Data            ,--  in  std_logic;
        Bus2IP_WrReq      => Bus2IP_WrReq            ,--  in  std_logic;
        Bus2IP_RdReq      => Bus2IP_RdReq            ,--  in  std_logic_vector
        Bus2IP_Burst      => bus2ip_burst            ,--  in  std_logic;
        
        Bus2IP_RdReq_emc  => Bus2IP_RdReq_emc        ,--  in  std_logic;
        Bus2IP_WrReq_emc  => Bus2IP_WrReq_emc        ,--  in  std_logic;

        Bus2Mem_CS        => bus2Mem_CS              ,--  out std_logic;
        Bus2Mem_RdReq     => bus2Mem_RdReq           ,--  out std_logic;
        Bus2Mem_WrReq     => bus2Mem_WrReq           ,--  out std_logic;

        Parity_err        => Parity_err_i            ,--  in  std_logic;

        IP2Bus_Data       => IP2Bus_Data             ,--  out std_logic_vector
        IP2Bus_errAck     => IP2Bus_errAck_i         ,--  out std_logic;
        IP2Bus_retry      => IP2Bus_retry            ,--  out std_logic;
        IP2Bus_toutSup    => IP2Bus_toutSup          ,--  out std_logic;
        IP2Bus_RdAck      => ip2Bus_RdAck_i          ,--  out std_logic;
        IP2Bus_WrAck      => IP2Bus_WrAck            ,--  out std_logic;
        IP2Bus_AddrAck    => IP2Bus_AddrAck          ,--  out std_logic;
        Type_of_xfer      => Type_of_xfer            ,--  in  std_logic;

        Burst_length      => Bus2IP_BurstLength      ,--  in  std_logic_vector(
        Transaction_done  => transaction_done_i      ,--  in  std_logic;


        single_transaction=> single_transaction      ,--  in  std_logic;
        last_burst_cnt    => last_burst_cnt          ,--  out std_logic;


        pr_state_wait_temp_cmb   => pr_state_wait_temp_cmb   ,
        Synch_mem                => synch_mem1               ,
        
        Mem_width_bytes          => mem_width_bytes          , -- 10-12-2012
        stop_oen                 => stop_oen                 , -- 10-12-2012
	    
        axi_trans_size_reg       => axi_trans_size_reg       ,-- 1/3/2013
	    Linear_flash_brst_rd_flag=> Linear_flash_brst_rd_flag -- 1/28/2013
    );

-------------------------------------------------------------------------------
-- Memory State Machine
-------------------------------------------------------------------------------

MEM_STATE_MACHINE_I : entity emc_common_v3_0_5.mem_state_machine
    port map (
        Clk              => Bus2IP_Clk,
        Rst              => Bus2IP_Reset,

        Bus2IP_RNW       => Bus2IP_RNW,
        Bus2IP_RdReq     => bus2Mem_RdReq,
        Bus2IP_WrReq     => Bus2Mem_WrReq,
        original_wrce    => original_wrce,
--flash_mem_access => flash_mem_access_int,

        Synch_mem        => synch_mem1,
        Two_pipe_delay   => two_pipe_delay,
        Cycle_End        => cycle_End,
        Bus2IP_Mem_CS    => Bus2IP_Mem_CS_i,

        Bus2IP_Burst     => bus2ip_burst,

        Read_data_en     => read_data_en,
        Read_ack         => read_ack,

        Address_strobe   => address_strobe,
       -- Data_strobe      => data_strobe,09-12-2012
        CS_Strobe        => cs_Strobe,
        axi_wvalid       => axi_wvalid,
        axi_wlast        => axi_wlast,

        Addr_cnt_ce      => addr_cnt_ce,
        Addr_cnt_rst     => addr_cnt_rst,
        Cycle_cnt_ld     => cycle_cnt_ld,
        Cycle_cnt_en     => cycle_cnt_en,

        single_trans     => single_transaction,

        Trd_cnt_en       => trd_cnt_en,
        Twr_cnt_en       => twr_cnt_en,
        Twph_cnt_en      => twph_cnt_en,
        Tpacc_cnt_en     => tpacc_cnt_en,
        Trd_load         => trd_load,
        Twr_load         => twr_load,
        Twph_load        => twph_load,
        Tpacc_load       => tpacc_load,

        Thz_load         => thz_load,
        Tlz_load         => tlz_load,
        Trd_end          => trd_end,
        Twr_end          => twr_end,
        Twph_end         => twph_end,
        Thz_end          => thz_end,
        Tlz_end          => tlz_end,
        Tpacc_end        => Tpacc_end,

        New_page_access  => new_page_access,
        Linear_flash_brst_rd_flag => Linear_flash_brst_rd_flag,
        Linear_flash_rd_data_ack => Linear_flash_rd_data_ack,

        MSM_Mem_CEN      => mem_CEN_cmb,
        MSM_Mem_OEN      => mem_OEN_cmb,
        MSM_Mem_WEN      => mem_WEN_cmb,
        MSM_Mem_RNW      => mem_RNW_cmb,
        CS_Strobe_par_addr => CS_par_addr,

        Addr_align       => addr_align_write,
        Addr_align_rd    => addr_align_rd,

        Write_req_ack    => write_req_ack,
        Read_req_ack     => read_req_ack,
        Transaction_done => transaction_done_i,
        Mem_Addr_rst     => Mem_Addr_rst,

        last_burst_cnt     => last_burst_cnt,

        Write_req_data_ack => Write_req_data_ack,
        Write_req_addr_ack => Write_req_addr_ack,

        address_strobe_c   => address_strobe_c,
        be_strobe_c        => be_strobe_c,
        data_strobe_c      => data_strobe_c,
        ns_idle            => ns_idle      ,
        pr_state_wait_temp_cmb => pr_state_wait_temp_cmb,

        Twr_rec_load       => twr_rec_load_int  ,
        Twr_rec_cnt_en     => twr_rec_cnt_en_int,
        Twr_rec_end        => twr_rec_end_int,

	Flash_mem_access_disable => int_Flash_mem_access_dis, --
	Flash_mem_access   => flash_mem_access_int_1, --Flash_mem_access_int
	Mem_WAIT	       => Mem_WAIT,
  	Adv_L_N			=> Adv_L_N,
         Bus2IP_RdReq_emc  => Bus2IP_RdReq_emc, -- 17-10-2012
         last_addr1 => last_addr1,
         stop_oen => stop_oen,
         pr_idle => pr_idle, -- 11-12-2012
         bus2ip_ben_all_1 => bus2ip_ben_all_1
        --Linear_flash_brst_rd_flag  => Linear_flash_brst_rd_flag,
        --Linear_flash_rd_data_ack   => Linear_flash_rd_data_ack
    );


bus2ip_ben_fixed <= (others=>'0') when Type_of_xfer = '0'
                    else
                    Bus2IP_BE;
                    
bus2ip_ben_all_1 <= and_reduce(Bus2IP_BE);-- 13-12-2012 

parity_error_adrss <= temp_parity_error_adrss when (ip2Bus_RdAck_i = '1' and IP2Bus_errAck_i = '1') else (others => '0');


-------------------------------------------------------------------------------
-- Datawidth Matching Address Counter
-------------------------------------------------------------------------------

ADDR_COUNTER_MUX_I : entity emc_common_v3_0_5.addr_counter_mux
    generic map (
        C_ADDR_CNTR_WIDTH        => ADDR_CNTR_WIDTH,
        C_IPIF_DWIDTH            => C_IPIF_DWIDTH,
        C_IPIF_AWIDTH            => C_IPIF_AWIDTH,
        C_ADDR_OFFSET            => ADDR_OFFSET,
        PARITY_TYPE_MEMORY       => PARITY_TYPE_MEMORY,
        C_GLOBAL_DATAWIDTH_MATCH => GLOBAL_DATAWIDTH_MATCH
    )
    port map (
        Clk                      => Bus2IP_Clk,
        Rst                      => Bus2IP_Reset,

        Bus2IP_Addr              => Bus2IP_Addr,
        Bus2IP_BE                => bus2ip_ben_fixed,
        Address_strobe           => address_strobe,
        --Data_strobe              => data_strobe,09-12-2012

        Mem_width_bytes          => mem_width_bytes,
        Datawidth_match          => datawidth_match,
        Bus2Mem_CS               => bus2Mem_CS,

        Addr_cnt_ce              => addr_cnt_ce,
        Addr_cnt_rst             => addr_cnt_rst,
        Addr_cnt                 => addr_cnt,
        Addr_align               => addr_align_write,
        CS_par_addr              => CS_par_addr,
        par_error_addr           => temp_parity_error_adrss,

        Cycle_cnt_ld             => cycle_cnt_ld,
        Cycle_cnt_en             => cycle_cnt_en,
        Cycle_End                => cycle_End,
        Mem_addr                 => Mem_A_int,
        Mem_Ben                  => bus2ip_ben_int,

        address_strobe_c         => address_strobe_c,
        be_strobe_c              => be_strobe_c     ,
        data_strobe_c            => data_strobe_c,
        Cre_reg_en		 => Cre_reg_en,
         Bus2IP_RdReq  => bus2Mem_RdReq, -- 17-10-2012
psram_page_mode                 => psram_page_mode,
axi_trans_size_reg       => axi_trans_size_reg -- 1/17/2013
    );

-------------------------------------------------------------------------------
-- Asynchronous Memory Cycle Timers
-------------------------------------------------------------------------------

COUNTERS_I: entity emc_common_v3_0_5.counters
    port map (
        Synch_mem    => synch_mem1,

        Twr_data     => twr_data,
        Twr_load     => twr_load,
        Twr_cnt_en   => twr_cnt_en,
        twph_data    => twph_data,
        twph_load    => twph_load,
        twph_cnt_en  => twph_cnt_en,
        Tlz_data     => tlz_data,
        Tlz_load     => tlz_load,
        Trd_data     => trd_data,
        Trd_load     => trd_load,
        Trd_cnt_en   => trd_cnt_en,
        Tpacc_data   => tpacc_data,
        Tpacc_load   => tpacc_load,
        Tpacc_cnt_en => tpacc_cnt_en,


        Thz_data     => thz_data,
        Thz_load     => thz_load,
        Twr_end      => twr_end,
        Twph_end     => twph_end,
        Tlz_end      => tlz_end,
        Trd_end      => trd_end,
        Thz_end      => thz_end,
        Tpacc_end    => Tpacc_end,
        --------------------------
        Twr_rec_data   => twr_rec_data_int  ,
        Twr_rec_load   => twr_rec_load_int  ,
        Twr_rec_cnt_en => twr_rec_cnt_en_int,
        Twr_rec_end    => twr_rec_end_int   ,
	--------------------------
        Clk          => Bus2IP_Clk,
        Rst          => Bus2IP_Reset
    );

-------------------------------------------------------------------------------
-- Memory Paramter Selector
-------------------------------------------------------------------------------

SELECT_PARAM_I: entity emc_common_v3_0_5.select_param
    generic map (
        C_NUM_BANKS_MEM                 => C_NUM_BANKS_MEM,
        C_GLOBAL_SYNC_MEM               => GLOBAL_SYNC_MEM,
        C_PAGE_SIZE                     => C_PAGE_SIZE,
        C_SYNCH_MEM_0                   => C_SYNCH_MEM_0,
        C_SYNCH_MEM_1                   => C_SYNCH_MEM_1,
        C_SYNCH_MEM_2                   => C_SYNCH_MEM_2,
        C_SYNCH_MEM_3                   => C_SYNCH_MEM_3,

        C_MEM0_WIDTH                    => C_MEM0_WIDTH,
        C_MEM1_WIDTH                    => C_MEM1_WIDTH,
        C_MEM2_WIDTH                    => C_MEM2_WIDTH,
        C_MEM3_WIDTH                    => C_MEM3_WIDTH,

        C_PAGEMODE_FLASH                => PAGEMODE_FLASH,
        C_PAGEMODE_FLASH_0              => C_PAGEMODE_FLASH_0,
        C_PAGEMODE_FLASH_1              => C_PAGEMODE_FLASH_1,
        C_PAGEMODE_FLASH_2              => C_PAGEMODE_FLASH_2,
        C_PAGEMODE_FLASH_3              => C_PAGEMODE_FLASH_3,

        PARITY_TYPE_MEMORY              => PARITY_TYPE_MEMORY,
        C_PARITY_TYPE_0                 => C_PARITY_TYPE_0,
        C_PARITY_TYPE_1                 => C_PARITY_TYPE_1,
        C_PARITY_TYPE_2                 => C_PARITY_TYPE_2,
        C_PARITY_TYPE_3                 => C_PARITY_TYPE_3,

        C_SYNCH_PIPEDELAY_0             => C_SYNCH_PIPEDELAY_0,
        C_SYNCH_PIPEDELAY_1             => C_SYNCH_PIPEDELAY_1,
        C_SYNCH_PIPEDELAY_2             => C_SYNCH_PIPEDELAY_2,
        C_SYNCH_PIPEDELAY_3             => C_SYNCH_PIPEDELAY_3,

        C_GLOBAL_DATAWIDTH_MATCH        => GLOBAL_DATAWIDTH_MATCH,
        C_INCLUDE_DATAWIDTH_MATCHING_0  => C_INCLUDE_DATAWIDTH_MATCHING_0,
        C_INCLUDE_DATAWIDTH_MATCHING_1  => C_INCLUDE_DATAWIDTH_MATCHING_1,
        C_INCLUDE_DATAWIDTH_MATCHING_2  => C_INCLUDE_DATAWIDTH_MATCHING_2,
        C_INCLUDE_DATAWIDTH_MATCHING_3  => C_INCLUDE_DATAWIDTH_MATCHING_3,

        TRDCNT_0                        => TRDCNT_0,
        TRDCNT_1                        => TRDCNT_1,
        TRDCNT_2                        => TRDCNT_2,
        TRDCNT_3                        => TRDCNT_3,

        THZCNT_0                        => THZCNT_0,
        THZCNT_1                        => THZCNT_1,
        THZCNT_2                        => THZCNT_2,
        THZCNT_3                        => THZCNT_3,

        TWRCNT_0                        => TWRCNT_0,
        TWRCNT_1                        => TWRCNT_1,
        TWRCNT_2                        => TWRCNT_2,
        TWRCNT_3                        => TWRCNT_3,

        TWPHCNT_0                       => TWPHCNT_0,
        TWPHCNT_1                       => TWPHCNT_1,
        TWPHCNT_2                       => TWPHCNT_2,
        TWPHCNT_3                       => TWPHCNT_3,


        C_IPIF_AWIDTH                   => C_IPIF_AWIDTH,
        C_IPIF_DWIDTH                   => C_IPIF_DWIDTH,


        TPACC_0                         => TPACC_0,
        TPACC_1                         => TPACC_1,
        TPACC_2                         => TPACC_2,
        TPACC_3                         => TPACC_3,

        TLZCNT_0                        => TLZCNT_0,
        TLZCNT_1                        => TLZCNT_1,
        TLZCNT_2                        => TLZCNT_2,
        TLZCNT_3                        => TLZCNT_3,

        TP_WR_REC_CNT_0                 => TP_WR_REC_CNT_0,--7/4/2011
        TP_WR_REC_CNT_1                 => TP_WR_REC_CNT_1,
        TP_WR_REC_CNT_2                 => TP_WR_REC_CNT_2,
        TP_WR_REC_CNT_3                 => TP_WR_REC_CNT_3
    )
    port map (
        Bus2IP_Mem_CS                   => bus2ip_cs_reg,
        Bus2IP_Addr                     => Bus2IP_Addr,
        Bus2IP_Clk                      => Bus2IP_Clk,
        Bus2IP_Reset                    => Bus2IP_Reset,
        Bus2IP_RNW                      => Bus2IP_RNW,
        psram_page_mode                 => psram_page_mode,

        New_page_access                 => new_page_access,
        Parity_enable                   => Parity_enable,
        Parity_type                     => Parity_type,


        Twr_data                        => twr_data,
        Twph_data                       => twph_data,
        Tlz_data                        => tlz_data,
        Trd_data                        => trd_data,
        Thz_data                        => thz_data,
        Tpacc_data                      => tpacc_data,
        Twr_rec_data                    => twr_rec_data_int,-- 9/6/2011

	Synch_mem                       => synch_mem1,
        Mem_width_bytes                 => mem_width_bytes,
        Two_pipe_delay                  => two_pipe_delay,
        Datawidth_match                 => datawidth_match
    );

-------------------------------------------------------------------------------
-- Memory Data/Control Steering Logic
-------------------------------------------------------------------------------

MEM_STEER_I : entity emc_common_v3_0_5.mem_steer
    generic map(
        C_NUM_BANKS_MEM          => C_NUM_BANKS_MEM,
        C_MAX_MEM_WIDTH          => C_MAX_MEM_WIDTH,
        C_MIN_MEM_WIDTH          => MIN_MEM_WIDTH,
        C_IPIF_DWIDTH            => C_IPIF_DWIDTH,
        C_IPIF_AWIDTH            => C_IPIF_AWIDTH,
        C_ADDR_CNTR_WIDTH        => ADDR_CNTR_WIDTH,
        C_PARITY_TYPE_MEMORY     => PARITY_TYPE_MEMORY,
        C_GLOBAL_SYNC_MEM        => GLOBAL_SYNC_MEM,
        C_GLOBAL_DATAWIDTH_MATCH => GLOBAL_DATAWIDTH_MATCH
    )
    port map(
        --
        --Clk                      => Bus2IP_Clk,
        --Rst                      => Bus2IP_Reset
        Clk                      => Bus2IP_Clk,
        Rst                      => Bus2IP_Reset,

        Bus2IP_Data              => Bus2IP_Data,     -- in std_logic_vector
        Bus2IP_BE                => bus2ip_ben_int,  -- in std_logic_vector
        Bus2IP_Mem_CS            => bus2ip_cs_reg,   -- in std_logic_vector
        Bus2IP_RdReq             => bus2Mem_RdReq,   -- in  std_logic;
        Bus2IP_Burst             => bus2ip_burst,    -- in  std_logic;

        Write_req_ack            => write_req_ack,    -- in  std_logic;
        Read_req_ack             => read_req_ack,     -- in  std_logic;
        Read_ack                 => read_ack,         -- in  std_logic;
        Read_data_en             => read_data_en,     -- in  std_logic;
        --Data_strobe              => data_strobe,      -- in  std_logic;09-12-2012
        MSM_Mem_CEN              => mem_CEN_cmb,      -- in  std_logic;
        MSM_Mem_OEN              => mem_OEN_cmb,      -- in  std_logic;
        MSM_Mem_WEN              => mem_WEN_cmb,      -- in  std_logic;
        MSM_Mem_RNW              => mem_RNW_cmb,      -- in  std_logic;
        Mem2Bus_WrAddrAck        => mem2Bus_WrAddrAck,-- out std_logic;
        Mem2Bus_WrAck            => mem2Bus_WrAck,    -- out std_logic;
        Mem2Bus_RdAddrAck        => mem2Bus_RdAddrAck,-- out std_logic;
        Mem2Bus_RdAck            => mem2Bus_RdAck,    -- out std_logic;
        Mem2Bus_Data             => mem2Bus_Data,     -- out std_logic_vector

        Mem_width_bytes          => mem_width_bytes,   -- in  std_logic_vector
        Synch_mem                => synch_mem1,         -- in  std_logic;
        Two_pipe_delay           => two_pipe_delay,    -- in  std_logic;
        single_transaction       => single_transaction,-- in  std_logic;

        Parity_enable            => Parity_enable,     -- out std_logic_vector
        Parity_type              => Parity_type,       -- in  std_logic;
        parity_error_mem         => parity_error_mem,  -- in  std_logic;
        Parity_err               => Parity_err_i,      -- out std_logic;

        Addr_cnt                 => addr_cnt,          -- in  std_logic_vector
        Addr_align               => addr_align_write,  -- in  std_logic
        Addr_align_rd            => addr_align_rd,     -- in  std_logic

        MemSteer_Mem_DQ_I        => mem_dq_i_int,      -- in  std_logic_vector
        MemSteer_Mem_DQ_O        => mem_dq_o_int,      -- out  std_logic_vector
        MemSteer_Mem_DQ_T        => mem_dq_t_int,      -- out  std_logic_vector

        MemSteer_Mem_DQ_prty_I   => mem_dq_parity_i_int,-- in  std_logic_vector
        MemSteer_Mem_DQ_prty_O   => mem_dq_parity_o_int,-- out  std_logic_vector
        MemSteer_Mem_DQ_prty_T   => mem_dq_parity_t_int,-- out  std_logic_vector

        MemSteer_Mem_CEN         => mem_cen_int,     -- out  std_logic_vector
        MemSteer_Mem_OEN         => mem_oen_int,     -- out  std_logic_vector
        MemSteer_Mem_WEN         => mem_wen_int,     -- out  std_logic
        MemSteer_Mem_QWEN        => mem_qwen_int,    -- out  std_logic_vector
        MemSteer_Mem_BEN         => mem_ben_int,     -- out  std_logic_vector
        MemSteer_Mem_CE          => mem_ce_int,      -- out  std_logic_vector
        MemSteer_Mem_RNW         => mem_rnw_int,     -- out  std_logic

        Bus2IP_RdReq_emc         => Bus2IP_RdReq_emc, -- in  std_logic;
        Bus2IP_WrReq_emc         => Bus2IP_WrReq_emc,  -- in  std_logic;

        Write_req_data_ack       => Write_req_data_ack,
        Write_req_addr_ack       => Write_req_addr_ack,

        address_strobe_c         => address_strobe_c, --- in
        be_strobe_c              => be_strobe_c     ,  -- in
        data_strobe_c            => data_strobe_c,     -- in
        ns_idle                  => ns_idle   ,         -- in
        Linear_flash_brst_rd_flag  => Linear_flash_brst_rd_flag,
        Linear_flash_rd_data_ack   => Linear_flash_rd_data_ack,
        last_addr => last_addr1, -- 10-12-2012
        stop_oen => stop_oen ,-- 10-12-2012
        cycle_end        => cycle_End ,
        axi_arsize       => axi_arsize,
        axi_trans_size_reg       => axi_trans_size_reg

    );

-------------------------------------------------------------------------------
-- Instantiate the IO register block to memory
-- IO registers will be instantiated based on the parameter settings
-------------------------------------------------------------------------------

IO_REGISTERS_I: entity emc_common_v3_0_5.io_registers
    generic map (
        --C_FLASH_SYNC_RD          => C_FLASH_SYNC_RD,
        C_INCLUDE_NEGEDGE_IOREGS => C_INCLUDE_NEGEDGE_IOREGS,
        C_IPIF_AWIDTH            => C_IPIF_AWIDTH,
        C_MAX_MEM_WIDTH          => C_MAX_MEM_WIDTH,
        C_NUM_BANKS_MEM          => C_NUM_BANKS_MEM
    )
    port map (
	     Linear_flash_brst_rd_flag=> Linear_flash_brst_rd_flag, -- 1/28/2013
        Clk                      => Bus2IP_Clk,     --in  std_logic
        RdClk                    => RdClk,          --in  std_logic
        Rst                      => Bus2IP_Reset,   --in  std_logic

        Mem_A_int                => mem_a_int,      --in  std_logic_vector

        Mem_DQ_I_int             => mem_dq_i_int,   --out std_logic_vector
        Mem_DQ_O_int             => mem_dq_o_int,   --in  std_logic_vector
        Mem_DQ_T_int             => mem_dq_t_int,   --in  std_logic_vector

        Mem_DQ_PARITY_I_int      => mem_dq_parity_i_int, --out std_logic_vector
        Mem_DQ_PARITY_O_int      => mem_dq_parity_o_int, --in  std_logic_vector
        Mem_DQ_PARITY_T_int      => mem_dq_parity_t_int, --in  std_logic_vector

        Mem_CEN_int              => mem_cen_int,     --in  std_logic_vector
        Mem_OEN_int              => mem_oen_int,     --in  std_logic_vector
        Mem_WEN_int              => mem_wen_int,     --in  std_logic;
        Mem_QWEN_int             => mem_qwen_int,    --in  std_logic_vector
        Mem_BEN_int              => mem_ben_int,     --in  std_logic_vector
        Mem_RPN_int              => mem_rpn_int,     --in  std_logic;
        Mem_CE_int               => mem_ce_int,      --in  std_logic_vector
        Mem_ADV_LDN_int          => mem_adv_ldn_int, --in  std_logic;
        Mem_LBON_int             => mem_lbon_int,    --in  std_logic;
        Mem_CKEN_int             => mem_cken_int,    --in  std_logic;
        Mem_RNW_int              => mem_rnw_int,     --in  std_logic;

        Mem_Addr_rst             => Mem_Addr_rst,    --in  std_logic
        --Linear_flash_rd_data_ack => Linear_flash_rd_data_ack, -- out std_logic;
        Mem_A                    => Mem_A,           --out std_logic_vector
        Mem_DQ_I                 => Mem_DQ_I,        --in  std_logic_vector
        Mem_DQ_O                 => Mem_DQ_O,        --out std_logic_vector
        Mem_DQ_T                 => Mem_DQ_T,        --out std_logic_vector

        Mem_DQ_PRTY_I            => Mem_DQ_PRTY_I,   --in  std_logic_vector
        Mem_DQ_PRTY_O            => Mem_DQ_PRTY_O,   --out std_logic_vector
        Mem_DQ_PRTY_T            => Mem_DQ_PRTY_T,   --out std_logic_vector

        Mem_CEN                  => Mem_CEN,         --out std_logic_vector
        Mem_OEN                  => Mem_OEN,         --out std_logic_vector
        Mem_WEN                  => Mem_WEN,         --out std_logic;
        Mem_QWEN                 => Mem_QWEN,        --out std_logic_vector
        Mem_BEN                  => Mem_BEN,         --out std_logic_vector
        Mem_RPN                  => Mem_RPN,         --out std_logic;
        Mem_CE                   => Mem_CE,          --out std_logic_vector
        Mem_ADV_LDN              => Mem_ADV_LDN,     --out std_logic;
        Mem_LBON                 => Mem_LBON,        --out std_logic;
        Mem_CKEN                 => Mem_CKEN,        --out std_logic;
        Mem_RNW                  => Mem_RNW          --out std_logic
        --Mem_WAIT                 => Mem_WAIT,        --in std_logic
        --Mem_Flash_clk            => Mem_Flash_clk    --in std_logic
    );
synch_mem12 <= synch_mem1;
end architecture imp;
-------------------------------------------------------------------------------
-- End of File emc.vhd
-------------------------------------------------------------------------------


