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
-- This reference design is to illustrate a way in which a KCPSM6 processor can implement 
-- a PMBus protocol and communicate with the UCD9248 power supply controller
-- (Texas Instruments) on the KC705 board. The design also implements a bridge between a 
-- UART and a Block Memory (BRAM) within a device so that information associated with the 
-- power supply controller can be observed both outside of the device and by another 
-- circuit connected to the second port of the BRAM at some point in the future.
--
-- It implements a  115200 baud, 1 stop bit, no parity, no handshake UART connection 
-- providing simple text based commands which enable the BRAM treated as 1K words of 
-- 32-bits to be read from and written to. 
--
-- All data values are represented as 8-digit hexadecimal values.
--
-- Whilst this bridge design could be more efficiently implemented by exploiting the 
-- ability for the port of the BRAM to be configured as 9-bits (8-bits plus parity) a 
-- full 32-bit data path has been created. The reason for this is that it has been
-- designed initially for an application in which the second port of the BRAM will be 
-- used in a 32-bit application. It may be important that all bytes within a 32-bit 
-- location are read or written in one transaction (i.e. If four byte transactions 
-- were used by this bridge to write a new 32-bit value then the 32-bit application 
-- may observe a the intermediate values which would be undesirable).    
-- 
-- If a frequency applied to the bridge module is not 50MHz then the KCPSM6 program will 
-- require some adjustments to maintain the same communication settings.
-- 
-- IMPORTANT: The BRAM must be connected to this module using the same 50MHz clock
--            (Synchronous interface).
--
--
--
-------------------------------------------------------------------------------------------
--
-- Library declarations
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
--
-------------------------------------------------------------------------------------------
--
--
entity power_test_control is
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
  end power_test_control;

--
-------------------------------------------------------------------------------------------
--
-- Start of test architecture
--
architecture Behavioral of power_test_control is
--
-------------------------------------------------------------------------------------------
--
-- Components
--
-------------------------------------------------------------------------------------------
--

--
-- declaration of KCPSM6
--

  component kcpsm6 
    generic(                 hwbuild : std_logic_vector(7 downto 0) := X"00";  
                    interrupt_vector : std_logic_vector(11 downto 0) := X"3FF";
             scratch_pad_memory_size : integer := 64);
    port (                   address : out std_logic_vector(11 downto 0);
                         instruction : in std_logic_vector(17 downto 0);
                         bram_enable : out std_logic;
                             in_port : in std_logic_vector(7 downto 0);
                            out_port : out std_logic_vector(7 downto 0);
                             port_id : out std_logic_vector(7 downto 0);
                        write_strobe : out std_logic;
                      k_write_strobe : out std_logic;
                         read_strobe : out std_logic;
                           interrupt : in std_logic;
                       interrupt_ack : out std_logic;
                               sleep : in std_logic;
                               reset : in std_logic;
                                 clk : in std_logic);
  end component;

--
-- KCPSM6 Program Memory with option for JTAG Loader
--

  component power_test_control_program
    generic(             C_FAMILY : string := "S6"; 
                C_RAM_SIZE_KWORDS : integer := 1;
             C_JTAG_LOADER_ENABLE : integer := 0);
    Port (      address : in std_logic_vector(11 downto 0);
            instruction : out std_logic_vector(17 downto 0);
                 enable : in std_logic;
                    rdl : out std_logic;                    
                    clk : in std_logic);
  end component;
  

--
-------------------------------------------------------------------------------------------
--
-- Signals
--
-------------------------------------------------------------------------------------------
--
--
-- Signals used to connect KCPSM6
--
signal          address : std_logic_vector(11 downto 0);
signal      instruction : std_logic_vector(17 downto 0);
signal      bram_enable : std_logic;
signal          in_port : std_logic_vector(7 downto 0);
signal         out_port : std_logic_vector(7 downto 0);
signal          port_id : std_logic_vector(7 downto 0);
signal     write_strobe : std_logic;
signal   k_write_strobe : std_logic;
signal      read_strobe : std_logic;
signal        interrupt : std_logic;
signal    interrupt_ack : std_logic;
signal     kcpsm6_sleep : std_logic;
signal     kcpsm6_reset : std_logic;
signal              rdl : std_logic;
--
--
-- Signals used to connect XADC
--
signal          xadc_addr : std_logic_vector(6 downto 0) := "0000000";
signal            xadc_di : std_logic_vector(15 downto 0) := "0000000000000000";
signal           xadc_den : std_logic;
signal           xadc_dwe : std_logic;
signal          xadc_drdy : std_logic;
signal           xadc_tip : std_logic := '0';
signal            xadc_do : std_logic_vector(15 downto 0);
signal     xadc_read_data : std_logic_vector(15 downto 0) := "0000000000000000";
signal      xadc_jtagbusy : std_logic;
signal    xadc_jtaglocked : std_logic;
signal  xadc_jtagmodified : std_logic;
--
signal               vp : std_logic;
signal               vn : std_logic;
signal            vauxp : std_logic_vector(15 downto 0);
signal            vauxn : std_logic_vector(15 downto 0);
--
-------------------------------------------------------------------------------------------
--
-- Start of circuit description
--
-------------------------------------------------------------------------------------------
--
begin

  --
  -----------------------------------------------------------------------------------------
  -- Instantiate KCPSM6 and connect to program ROM
  -----------------------------------------------------------------------------------------
  --
  -- The generics can be defined as required. In this case the 'hwbuild' value is used to 
  -- define a version using the ASCII code for the desired letter. The interrupt vector 
  -- has been set to address 7F0 which would provide 16 instructions to implement an 
  -- interrupt service route (ISR) before the end of a 2K program space. Interrupt is not 
  -- used in this design at this time but could be exploited in the future.
  --

  processor: kcpsm6
    generic map (                 hwbuild => X"41",    -- ASCII Character "A"
                         interrupt_vector => X"7F0",   
                  scratch_pad_memory_size => 64)
    port map(      address => address,
               instruction => instruction,
               bram_enable => bram_enable,
                   port_id => port_id,
              write_strobe => write_strobe,
            k_write_strobe => k_write_strobe,
                  out_port => out_port,
               read_strobe => read_strobe,
                   in_port => in_port,
                 interrupt => interrupt,
             interrupt_ack => interrupt_ack,
                     sleep => kcpsm6_sleep,
                     reset => kcpsm6_reset,
                       clk => clk);
 
  kcpsm6_reset <= rdl or rst;
  kcpsm6_sleep <= '0';
  interrupt <= interrupt_ack;

  --
  -- Program memory up to 4k with JTAG Loader option
  -- 

  program_rom: power_test_control_program
    generic map(             C_FAMILY => "7S", 
                    C_RAM_SIZE_KWORDS => 2,
                 C_JTAG_LOADER_ENABLE => 0)
    port map(      address => address,      
               instruction => instruction,
                    enable => bram_enable,
                       rdl => rdl,
                       clk => clk);

  --
  -----------------------------------------------------------------------------------------
  -- KCPSM6 general purpose input ports 
  -----------------------------------------------------------------------------------------
  --

  input_ports: process(clk)
  begin
    if clk'event and clk = '1' then

      case port_id(3 downto 0) is

        -- Read 32-bit data from BRAM using four 8-bit ports 00, 01, 02 and 03 hex
        when "0000" =>    in_port <= bram_data_out(7 downto 0);
        when "0001" =>    in_port <= bram_data_out(15 downto 8);
        when "0010" =>    in_port <= bram_data_out(23 downto 16);
        when "0011" =>    in_port <= bram_data_out(31 downto 24);

        -- Read PMBus at port address 04 hex
        when "0100" =>    in_port(0) <= pmbus_clk_in;
                          in_port(1) <= pmbus_data_in;
                          in_port(2) <= pmbus_alert;

        -- Read 16-bit XADC DRP data at port addresses 0C and 0D hex
        when "1100" =>    in_port <= xadc_read_data(7 downto 0);
        when "1101" =>    in_port <= xadc_read_data(15 downto 8);
                          
        -- Read XADC DRP status signals at port address 0E hex
        when "1110" =>    in_port(0) <= xadc_tip;
                          in_port(1) <= xadc_jtagbusy;
                          in_port(2) <= xadc_jtaglocked;
                          in_port(3) <= xadc_jtagmodified;          
                        
        -- To ensure minimum logic implementation when defining a multiplexer always
        -- use don't care for any of the unused cases
        when others =>    in_port <= "XXXXXXXX";  

      end case;

    end if;

  end process input_ports;

  --
  -----------------------------------------------------------------------------------------
  -- KCPSM6 general purpose output ports 
  -----------------------------------------------------------------------------------------
  --
  -- A combination of one-hot and encoded addressing schemes are employed.
  --

  output_ports: process(clk)
  begin

    if clk'event and clk = '1' then

      -- 'write_strobe' is used to qualify all writes to general output ports.
      if write_strobe = '1' then

        -- Write 32-bit data to BRAM using four 8-bit ports 04, 05, 06 and 07 hex
        --    (port_id(2) = '1' and port_id(1:0) selects the data byte) 

        if (port_id(2) = '1') and (port_id(1 downto 0) = "00") then
          bram_data_in(7 downto 0) <= out_port;
        end if;

        if (port_id(2) = '1') and (port_id(1 downto 0) = "01") then
          bram_data_in(15 downto 8) <= out_port;
        end if;

        if (port_id(2) = '1') and (port_id(1 downto 0) = "10") then
          bram_data_in(23 downto 16) <= out_port;
        end if;

        if (port_id(2) = '1') and (port_id(1 downto 0) = "11") then
          bram_data_in(31 downto 24) <= out_port;
        end if;

        -- Write 10-bit address to BRAM using ports 08 and 09 hex
        --    (port_id(3) = '1' and port_id(0) selects the address byte) 

        if (port_id(3) = '1') and (port_id(0) = '0') then
          bram_address(7 downto 0) <= out_port;
        end if;

        if (port_id(3) = '1') and (port_id(0) = '1') then
          bram_address(9 downto 8) <= out_port(1 downto 0);
        end if;
        
        -- Drive PMBus at port address 20 hex
        
        if port_id(5) = '1' then
          pmbus_clk_out <= out_port(0);
          pmbus_data_out <= out_port(1);
          pmbus_control <= out_port(2);
        end if;

        -- Write 16-bit XADC DRP address at port addresses 80 hex
        if (port_id(7) = '1') and (port_id(1 downto 0) = "00") then
          xadc_addr <= out_port(6 downto 0);
        end if;

        -- Write 16-bit XADC DRP data at port addresses 81 and 82 hex
        if (port_id(7) = '1') and (port_id(1 downto 0) = "01") then
          xadc_di(7 downto 0) <= out_port;
        end if;

        if (port_id(7) = '1') and (port_id(1 downto 0) = "10") then
          xadc_di(15 downto 8) <= out_port;
        end if;

      end if;
    end if; 
  end process output_ports;

  --
  -----------------------------------------------------------------------------------------
  -- KCPSM6 constant optimised output ports 
  -----------------------------------------------------------------------------------------
  --

  k_output_ports: process(clk)
  begin

    if clk'event and clk = '1' then

      -- 'k_write_strobe' is used to qualify all writes to constant optimised output ports.
      if k_write_strobe = '1' then

        -- Control BRAM using port 01 hex

        if port_id(0) = '1' then
          bram_we <= out_port(0);
          bram_en <= out_port(1);
        end if;

      end if;
    end if; 
  end process k_output_ports;

  --
  -- A transaction with the XADC is initiated by a write to 
  -- constant optimised port addresses 04 hex. The write is used to form
  -- a single clock cycle strobe on the DEN input to XADC and 
  -- define the level of DWE to define a read (0) or write (1) operation.
  -- This is a purely combinatorial process in order that the k_write_strobe 
  -- is used to define only a single clock cycle pulse.
  --
  
  xadc_den <= k_write_strobe and port_id(2);
  xadc_dwe <= out_port(0);  

  --
  -----------------------------------------------------------------------------------------
  -- XADC
  -----------------------------------------------------------------------------------------
  --
  -- The XADC contains a number of internal registers that are accessed by KCPSM6
  -- via the DRP port. The first 64 address locations (00 to 3F) are read only and provide 
  -- status and measurement data etc. The remaining addresses (40 to 7F) are read/write 
  -- registers that can be used to control and configure the system monitor. Note that not
  -- all addresses correspond with actual registers and multiple addresses should not be 
  -- modified. Please check UG370 for details and refer to the KCPSM6 code to see which 
  -- registers are actually accessed.
  --
  -- The initial values for the writable registers are also defined during configuration 
  -- using the INIT_40 to INIT_57 values. All registers are 16-bits.
  --
  -- INIT_42 corresponds with 'Configuration Register 2' of which the most significant 
  -- byte defines a clock division factor CD[7:0]. DCLK is the system clock provided to 
  -- the XADC and must be in the range 8 to 80MHz. In this design a 66MHz clock 
  -- is used. Internally to XADC an ADCCLK is formed through the division of 
  -- DCLK by the factor CD[7:0]. This clock is used to drive the A/D converter and must 
  -- be in the range 1 to 5.2MHz. In this design 50MHz/10 = 5MHz is defined as the 
  -- initial ADC clock frequency. Hence CD[7:0] = 10 decimal = 0A hex. So INIT_42=0A00.
  --
  -- VP/VN is used to measure VCCint current.
  -- VAUXP(12)/VAUXN(12)is used to measure +12v board supply voltage. 
  -- VAUXP(13)/VAUXN(13)is used to measure +12v board supply current. 
  --

  --vauxp <= "00" & board_amp_vp & board_volt_vp & "000000000000";
  --vauxn <= "00" & board_amp_vn & board_volt_vn & "000000000000";
  
  vp <= '0'; -- vccint_amp_vp;
  vn <= '0'; -- vccint_amp_vn; 
  vauxp <= "0000000000000000";
  vauxn <= "0000000000000000";

  XADC_inst : XADC
    generic map (
       -- INIT_40 - INIT_42: XADC configuration registers
       INIT_40 => X"0000",
       INIT_41 => X"20C7",
       INIT_42 => X"0A00",
       -- INIT_43 - INIT_47: XADC Test registers (do not edit)
       INIT_43 => X"0000",
       INIT_44 => X"0000",
       INIT_45 => X"0000",
       INIT_46 => X"0000",
       INIT_47 => X"0000",
       -- INIT_48 - INIT_4F: Sequence registers for the Channel Sequencer
       INIT_48 => X"0401",
       INIT_49 => X"0000",
       INIT_4A => X"0000",
       INIT_4B => X"0000",
       INIT_4C => X"0000",
       INIT_4D => X"0000",
       INIT_4F => X"0000",
                          INIT_4E => X"0000", -- Sequence register 6
       -- INIT_50 - INIT_58, INIT5C: Alarm threshold registers
       INIT_50 => X"0000",
       INIT_51 => X"0000",
       INIT_52 => X"E000",
       INIT_53 => X"0000",
       INIT_54 => X"0000",
       INIT_55 => X"0000",
       INIT_56 => X"CAAA",
       INIT_57 => X"0000",
       INIT_58 => X"0000",
       INIT_5C => X"0000",
       -- Reserved: Reserved for future use
       INIT_59 => X"0000",
       INIT_5A => X"0000",
       INIT_5B => X"0000",
       INIT_5D => X"0000",
       INIT_5E => X"0000",
       INIT_5F => X"0000",
       -- Simulation attributes: Set for proepr simulation behavior
       SIM_MONITOR_FILE => "design.txt"  -- Analog simulation data file name
    )
    port map (
       -- Alarm Ports: 8-bit (each) output: ALM, OT
       ALM => open,                       -- 8-bit output: Output alarm for temp, Vccint and Vccaux
       OT => open,                        -- 1-bit output: Over-Temperature alarm output
       -- DRP Ports: 16-bit (each) output: Dynamic Reconfiguration Ports
       DO => xadc_do,                     -- 16-bit output: DRP output data bus
       DRDY => xadc_drdy,                 -- 1-bit output: DRP data ready output signal
       -- Status Ports: 1-bit (each) output: XADC status ports
       BUSY => open,                      -- 1-bit output: ADC busy output
       CHANNEL => open,                   -- 5-bit output: Channel selection outputs
       EOC => open,                       -- 1-bit output: End of Conversion output
       EOS => open,                       -- 1-bit output: End of Sequence output
       JTAGBUSY => xadc_jtagbusy,         -- 1-bit output: JTAG DRP transaction in progress output
       JTAGLOCKED => xadc_jtaglocked,     -- 1-bit output: JTAG requested DRP port lock output
       JTAGMODIFIED => xadc_jtagmodified, -- 1-bit output: JTAG Write to the DRP has occurred output
       MUXADDR => open,                   -- 5-bit output: External MUX channel decode output
       -- Auxiliary Analog-Input Pairs: 16-bit (each) input: VAUXP[15:0], VAUXN[15:0]
       VAUXN => vauxn,                    -- 16-bit input: N-side auxiliary analog input
       VAUXP => vauxp,                    -- 16-bit input: P-side auxiliary analog input
       -- Control and Clock Ports: 1-bit (each) input: Reset, conversion start and clock inputs
       CONVST => '0',                     -- 1-bit input: Convert start input
       CONVSTCLK => '0',                  -- 1-bit input: Convert start input
       RESET => '0',                      -- 1-bit input: Active-high reset input
       -- DRP Ports: 7-bit (each) input: Dynamic Reconfiguration Ports
       DADDR => xadc_addr,                -- 7-bit input: DRP input address bus
       DCLK => clk,                       -- 1-bit input: DRP clock input
       DEN => xadc_den,                   -- 1-bit input: DRP input enable signal
       DI => xadc_di,                     -- 16-bit input: DRP input data bus
       DWE => xadc_dwe,                   -- 1-bit input: DRP write enable input
       -- Dedicated Analog Input Pair: 1-bit (each) input: VP/VN
       VN => vn,                          -- 1-bit input: N-side analog input
       VP => vp                           -- 1-bit input: P-side analog input
    );

  -----------------------------------------------------------------------------------------

  --
  -- When information read from the XADC registers it is provided on the D0 
  -- output. However, it is only valid when the DRDY strobe is High so the information must 
  -- be catured on the clock edge that DRDY is High so that it can be read by KCPSM6. 
  --
  -- Any read or write operation is initiated by a single cycle High strobe being applied 
  -- to the DEN input. The 7-bit address of the register to be accessed must be provided on 
  -- the DADDR input along with the 16-bit data to be written on the DI input if appropreate. 
  -- The DWE input defines if the operation is a read when (0) or write (1).
  --
  -- In this design KCPSM6 will present values for DADDR and DI in advance and then initiate 
  -- the operation with a write to a constant optimised port. This will be used to generate 
  -- a single cycle DEN strobe directly from the k_write_strobe as well as define the state 
  -- of DWE for a read or write operation. At the same time a 'transaction in progress'
  -- flag (xadc_tip) will be set which will remain High until the subsequent DRDY strobe is 
  -- observed. This flag can then be monitored by KCPSM6 to determine when the operation 
  -- is complete before reading the newly captured data following a read operation or 
  -- performing another transaction. 
  --

  xadc_drp: process(clk)
  begin
    if clk'event and clk='1' then

      if xadc_drdy = '1' then
        -- Capture output data when DRDY is High 
        xadc_read_data <= xadc_do;
        -- Clear 'transaction in progress' flag 
        xadc_tip <= '0';
       else
        -- Hold last captured value 
        xadc_read_data <= xadc_read_data;
        if xadc_den = '1' then
          -- Set 'transaction in progress' flag if DEN is High
          xadc_tip <= '1';
         else
          -- Keep current state of flag
          xadc_tip <= xadc_tip;
        end if;
      end if;

    end if; 
  end process xadc_drp;
  
  
end Behavioral;

-------------------------------------------------------------------------------------------
--
-- END OF FILE power_test_control.vhd
--
-------------------------------------------------------------------------------------------

