--
-------------------------------------------------------------------------------------------
-- Copyright  2014, Xilinx, Inc.
-- This file contains confidential and proprietary information of Xilinx, Inc. and is
-- protected under U.S. and international copyright and other intellectual property laws.
-------------------------------------------------------------------------------------------
--
-- Disclaimer:
-- This disclaimer is not a license and does not grant any rights to the materials
-- distributed herewith. Except as otherwise provided in a valid license issued to
-- you by Xilinx, and to the maximum extent permitted by applicable law: (1) THESE
-- MATERIALS ARE MADE AVAILABLE "AS IS" AND WITH ALL FAULTS, AND XILINX HEREBY
-- DISCLAIMS ALL WARRANTIES AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY,
-- INCLUDING BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-INFRINGEMENT,
-- OR FITNESS FOR ANY PARTICULAR PURPOSE; and (2) Xilinx shall not be liable
-- (whether in contract or tort, including negligence, or under any other theory
-- of liability) for any loss or damage of any kind or nature related to, arising
-- under or in connection with these materials, including for any direct, or any
-- indirect, special, incidental, or consequential loss or damage (including loss
-- of data, profits, goodwill, or any type of loss or damage suffered as a result
-- of any action brought by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-safe, or for use in any
-- application requiring fail-safe performance, such as life-support or safety
-- devices or systems, Class III medical devices, nuclear facilities, applications
-- related to the deployment of airbags, or any other applications that could lead
-- to death, personal injury, or severe property or environmental damage
-- (individually and collectively, "Critical Applications"). Customer assumes the
-- sole risk and liability of any use of Xilinx products in Critical Applications,
-- subject only to applicable laws and regulations governing limitations on product
-- liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS FILE AT ALL TIMES.
--
-------------------------------------------------------------------------------------------
--
--
--
--             _ ______ ____ ____ __ __ __
--             | |/ / ___| _ \/ ___|| \/ |/ /_
--             | ' / | | |_) \___ \| |\/| | '_ \
--             | . \ |___| __/ ___) | | | | (_) |
--             |_|\_\____|_| |____/|_| |_|\___/
-- 
-- 
-- 
-- 
--
--
--
-- This reference design is to illustrate a way in which a KCPSM6 processor can implement 
-- a bridge between a UART and a Block Memory (BRAM) within a device. With the UART 
-- should be connected back to a PC (via the USB/UART device on the KC705 board) and 
-- HyperTerminal or similar configured to 115200 baud, 1 stop bit, no parity, no handshake.
-- Then simple text commands will enable memory locations within a BRAM to be read and 
-- written. The memory is treated as 1K words of 32-bits so all data values are 8-digit
-- hexadecimal.
--
-- This design is set up to use the 200MHz differential clock source on the KC705 board. 
-- The clock is then divided by 4 before being used by the bridge module containing KCPMS6.
-- If a frequency applied to the bridge module is not 50MHz then the KCPSM6 program will 
-- require some adjustments to maintain the same communication settings.
-- 
-- 
-------------------------------------------------------------------------------------------
--

--
-- Standard IEEE libraries
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

--
-- The Unisim Library is used to define Xilinx primitives. It is also used during
-- simulation. The source can be viewed at %XILINX%\vhdl\src\unisims\unisim_VCOMP.vhd
-- 

library unisim;
use unisim.vcomponents.all;

--
-- Entity declaration
--

entity vc709_power_test is
  Port (           
             pmbus_clk : inout std_logic;
            pmbus_data : inout std_logic;
         pmbus_control : out std_logic;
           pmbus_alert : in std_logic;
                rd_en  : in std_logic;
            rd_address : in std_logic_vector(9 downto 0);
               rd_data : out std_logic_vector(31 downto 0);
               cpu_rst : in std_logic;
              clk50    : in std_logic);
  end vc709_power_test;

--
-- Start of architecture
--

architecture Behavioral of vc709_power_test is

  --
  -- CTRL to BRAM bridge containing a KCPSM6 processor.
  -- This module should be clocked at 50MHz or the program adjusted accordingly.
  --

  component power_test_control
    Port (        bram_we : out std_logic;
                  bram_en : out std_logic;
             bram_address : out std_logic_vector(9 downto 0);
             bram_data_in : out std_logic_vector(31 downto 0);
            bram_data_out : in std_logic_vector(31 downto 0);
             pmbus_clk_in : in std_logic;
            pmbus_clk_out : out std_logic;
            pmbus_data_in : in std_logic;
           pmbus_data_out : out std_logic;
            pmbus_control : out std_logic;
              pmbus_alert : in std_logic;
                      rst : in std_logic;
                      clk : in std_logic);
  end component;

  --
  -- Signals used to create 50MHz clock from 200MHz differential clock
  --
  
  --
  -- Signals used to connect UART to BRAM
  --
  
  signal        bram_we_a : std_logic;
  signal        bram_en_a : std_logic;
  signal   bram_address_a : std_logic_vector(9 downto 0);
  signal   bram_data_in_a : std_logic_vector(31 downto 0);
  signal  bram_data_out_a : std_logic_vector(31 downto 0);
  
  --
  -- Signals used to connect CTRL to BRAM
  --
  
  signal        bram_we_b : std_logic;
  signal   bram_data_in_b : std_logic_vector(31 downto 0);
  
  --
  -- Signals used to insert a BRAM
  --
  
  signal            we_a : std_logic_vector(3 downto 0);
  signal            en_a : std_logic;
  signal       address_a : std_logic_vector(15 downto 0);
  signal        parity_a : std_logic_vector(3 downto 0);
  --
  signal            we_b : std_logic_vector(7 downto 0);
  signal            en_b : std_logic;
  signal       address_b : std_logic_vector(15 downto 0);
  signal        parity_b : std_logic_vector(3 downto 0);
  
  --
  -- Signals for PMBus
  --
  
  signal  drive_pmbus_clk : std_logic;
  signal drive_pmbus_data : std_logic;
  
 attribute CORE_GENERATION_INFO : string;
 attribute CORE_GENERATION_INFO of Behavioral : architecture is "vc709_power_monitor,vc709_power_monitor_v1_3,{v7_xt_conn_trd=2014.3}";
  
--
-- Start of circuit description
--

begin

  --
  -----------------------------------------------------------------------------------------
  -- Instantiate CTRL to BRAM bridge module containing KCPSM6
  -----------------------------------------------------------------------------------------
  --
  -- This module should be clocked at 50MHz or the program adjusted accordingly.
  --

  test_controller: power_test_control
    port map(        bram_we => bram_we_a,
                     bram_en => bram_en_a, 
                bram_address => bram_address_a,
                bram_data_in => bram_data_in_a,
               bram_data_out => bram_data_out_a,
                pmbus_clk_in => pmbus_clk,
               pmbus_clk_out => drive_pmbus_clk,
               pmbus_data_in => pmbus_data,
              pmbus_data_out => drive_pmbus_data,
               pmbus_control => pmbus_control,
                 pmbus_alert => pmbus_alert,
                         rst => cpu_rst,
                         clk => clk50);


  --
  -----------------------------------------------------------------------------------------
  -- Connections to PMBus
  -----------------------------------------------------------------------------------------
  --
  -- The data and clock should be treated as open collector bidirectional signals which 
  -- use a pull-up on the board to generate a High level.
  --

  pmbus_clk  <= '0' when drive_pmbus_clk = '0' else 'Z';
  pmbus_data <= '0' when drive_pmbus_data = '0' else 'Z';              

  --
  -- Instantiate a BRAM configured to be 1K words of 32-bits
  --
  -- In this test case only one port (A) is connected but obviously the other port is 
  -- available for communication providing a further bridging opportunity. Currently 
  -- unused ports are tied off or looped back.
  --
  -- The port connected to the UART to BRAM bridge must used the same clock (50MHz).
  --
  -- For test purposes the BRAM has been initialised with the following values..
  --     Address   Data
  --     000       AACC5577 
  --     001       12345678 
  --     002       00000000
  --     to... 
  --     3FE       00000000 
  --     3FF       FEDCBA09 
  --

  address_a <= '0' & bram_address_a(9 downto 0) & "00000";
  en_a <= bram_en_a;
  we_a <= bram_we_a & bram_we_a & bram_we_a & bram_we_a;

  address_b <= '0' & rd_address(9 downto 0) & "00000";
  en_b <= rd_en;
  we_b <= bram_we_b & bram_we_b & bram_we_b & bram_we_b & bram_we_b & bram_we_b & bram_we_b & bram_we_b;


  target_bram_1K_x_32: RAMB36E1
    generic map ( READ_WIDTH_A => 36,
                  WRITE_WIDTH_A => 36,
                  DOA_REG => 0,
                  INIT_A => X"000000000000000000",
                  RSTREG_PRIORITY_A => "REGCE",
                  SRVAL_A => X"000000000000000000",
                  WRITE_MODE_A => "WRITE_FIRST",
                  READ_WIDTH_B => 36,
                  WRITE_WIDTH_B => 36,
                  DOB_REG => 0,
                  INIT_B => X"000000000000000000",
                  RSTREG_PRIORITY_B => "REGCE",
                  SRVAL_B => X"000000000000000000",
                  WRITE_MODE_B => "WRITE_FIRST",
                  INIT_FILE => "NONE",
                  SIM_COLLISION_CHECK => "ALL",
                  SIM_DEVICE => "7SERIES",
                  RAM_MODE => "TDP",
                  RDADDR_COLLISION_HWCONFIG => "DELAYED_WRITE",
                  EN_ECC_READ => FALSE,
                  EN_ECC_WRITE => FALSE,
                  RAM_EXTENSION_A => "NONE",
                  RAM_EXTENSION_B => "NONE",
                  INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000011",
                  INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
                  INIT_7F => X"FEDCBA0900000000000000000000000000000000000000000000000000000000",
                 INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
                 INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
                 INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
                 INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
                 INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
                 INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
                 INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
                 INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
                 INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
                 INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
                 INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
                 INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
                 INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
                 INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
                 INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
                 INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000")
    port map(   ADDRARDADDR => address_a,
                    ENARDEN => en_a,
                  CLKARDCLK => clk50,
                      DOADO => bram_data_out_a,
                    DOPADOP => parity_a, 
                      DIADI => bram_data_in_a,
                    DIPADIP => parity_a, 
                        WEA => we_a,
                REGCEAREGCE => '0',
              RSTRAMARSTRAM => '0',
              RSTREGARSTREG => '0',
                ADDRBWRADDR => address_b,
                    ENBWREN => en_b,
                  CLKBWRCLK => clk50,
                      DOBDO => rd_data,
                    DOPBDOP => parity_b, 
                      DIBDI => bram_data_in_b,
                    DIPBDIP => parity_b, 
                      WEBWE => "00000000",  --we_b,
                     REGCEB => '0',
                    RSTRAMB => '0',
                    RSTREGB => '0',
                 CASCADEINA => '0',
                 CASCADEINB => '0',
              INJECTDBITERR => '0',
              INJECTSBITERR => '0');

end Behavioral;
