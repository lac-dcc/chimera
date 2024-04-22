-------------------------------------------------------------------------------
--      _____
--     /     \
--    /____   \____
--   / \===\   \==/
--  /___\===\___\/  AVNET
--       \======/
--        \====/    
-------------------------------------------------------------------------------
--
-- This design is the property of Avnet.  Publication of this
-- design is not authorized without written consent from Avnet.
-- 
-- Please direct any questions to community forums on MicroZed.org
--
-- Disclaimer:
--    Avnet, Inc. makes no warranty for the use of this code or design.
--    This code is provided  "As Is". Avnet, Inc assumes no responsibility for
--    any errors, which may appear in this code, nor does it make a commitment
--    to update the information contained herein. Avnet, Inc specifically
--    disclaims any implied warranties of fitness for a particular purpose.
--                     Copyright(c) 2019 Avnet, Inc.
--                             All rights reserved.
--
-------------------------------------------------------------------------------
--
-- Create Date:         Mar20, 2019
-- Project Name:        MiniZed SPI Example
--
-- Target Devices:      Zynq-7000
-- Avnet Boards:        MiniZed
--
--
-- Tool versions:       Vivado 2018.2
--
-- Description:         This is an example of an SPI device in the PL.
--
-- Dependencies:        
--
-- Revision:            Mar20, 2019: 1.00 First Version
--
-------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.all;


entity spi_slave is
    Port ( clk_in : in STD_LOGIC;
           resetn_in : in STD_LOGIC;
           SPI_CLK_in: in STD_LOGIC;
           SPI_SS_in: in STD_LOGIC;
           SPI_MOSI_in: in STD_LOGIC;
           SPI_MISO_out: out STD_LOGIC;

           CH1_LEX_out: out STD_LOGIC;
           CH1_CLKX_out: out STD_LOGIC;
           CH1_SIX_out: out STD_LOGIC;
           CH1_RX_DSA_D0X_out: out STD_LOGIC;
           CH1_RX_DSA_D1X_out: out STD_LOGIC;
           CH1_RX_DSA_D2X_out: out STD_LOGIC;
           CH1_RX_DSA_D3X_out: out STD_LOGIC;
           CH1_RX_DSA_D4X_out: out STD_LOGIC;
           CH1_RX_DSA_D5X_out: out STD_LOGIC;
           CH1_TX_PA_ENX_out: out STD_LOGIC;
           CH1_TX_LNA_DISX_out: out STD_LOGIC;
           CH1_RX_LNA0_BYPX_out: out STD_LOGIC;
           CH1_RX_LNA1_BYPX_out: out STD_LOGIC;
           CH1_RX_LNA0_DISX_out: out STD_LOGIC;
           CH1_RX_LNA0_ENX_out: out STD_LOGIC;
           CH1_RX_LNA1_DISX_out: out STD_LOGIC;

           CH2_LEX_out: out STD_LOGIC;
           CH2_CLKX_out: out STD_LOGIC;
           CH2_SIX_out: out STD_LOGIC;
           CH2_RX_DSA_D0X_out: out STD_LOGIC;
           CH2_RX_DSA_D1X_out: out STD_LOGIC;
           CH2_RX_DSA_D2X_out: out STD_LOGIC;
           CH2_RX_DSA_D3X_out: out STD_LOGIC;
           CH2_RX_DSA_D4X_out: out STD_LOGIC;
           CH2_RX_DSA_D5X_out: out STD_LOGIC;
           CH2_TX_PA_ENX_out: out STD_LOGIC;
           CH2_TX_LNA_DISX_out: out STD_LOGIC;
           CH2_RX_LNA0_BYPX_out: out STD_LOGIC;
           CH2_RX_LNA1_BYPX_out: out STD_LOGIC;
           CH2_RX_LNA0_DISX_out: out STD_LOGIC;
           CH2_RX_LNA0_ENX_out: out STD_LOGIC;
           CH2_RX_LNA1_DISX_out: out STD_LOGIC;

           COMMS_LEDX_out: out STD_LOGIC;
           
           CH1_RX_OV_in: in STD_LOGIC; --CH1 Overvoltage input
           CH2_RX_OV_in: in STD_LOGIC  --CH2 Overvoltage input

           );
end spi_slave;

architecture Behavioral of spi_slave is

    constant FCLKS_PER_SAMCLK: integer range 0 to 255 := 10;
    constant HALF_FCLKS_PER_SAMCLK: integer range 0 to 255 := 5;
    constant VERSION_MAJOR : std_logic_vector(7 downto 0) := x"02";
    constant VERSION_MINOR : std_logic_vector(7 downto 0) := x"01";
    constant CHIP_ID : std_logic_vector(3 downto 0) := "0010";

    constant CMD_GET_VERSION : std_logic_vector(7 downto 0)         := x"01";
    constant CMD_GET_FEEDBACK : std_logic_vector(7 downto 0)        := x"02";
    constant CMD_SET_COMMS_LED : std_logic_vector(7 downto 0)       := x"03";
    constant CMD_SET_CH1_RFSA3713 : std_logic_vector(7 downto 0)    := x"04";
    constant CMD_SET_CH2_RFSA3713 : std_logic_vector(7 downto 0)    := x"05";
    constant CMD_SET_CH1_RX_DSA : std_logic_vector(7 downto 0)      := x"06";
    constant CMD_SET_CH2_RX_DSA : std_logic_vector(7 downto 0)      := x"07";
    constant CMD_SET_CH1_TX_PA_EN : std_logic_vector(7 downto 0)    := x"08";
    constant CMD_SET_CH2_TX_PA_EN : std_logic_vector(7 downto 0)    := x"09";
    constant CMD_SET_CH1_TX_LNA_DIS : std_logic_vector(7 downto 0)  := x"0A";
    constant CMD_SET_CH2_TX_LNA_DIS : std_logic_vector(7 downto 0)  := x"0B";
    constant CMD_SET_CH1_RX_LNA0_BYP : std_logic_vector(7 downto 0) := x"0C";
    constant CMD_SET_CH2_RX_LNA0_BYP : std_logic_vector(7 downto 0) := x"0D";
    constant CMD_SET_CH1_RX_LNA1_BYP : std_logic_vector(7 downto 0) := x"0E";
    constant CMD_SET_CH2_RX_LNA1_BYP : std_logic_vector(7 downto 0) := x"0F";
    constant CMD_SET_CH1_RX_LNA0_DIS : std_logic_vector(7 downto 0) := x"10";
    constant CMD_SET_CH2_RX_LNA0_DIS : std_logic_vector(7 downto 0) := x"11";
    constant CMD_SET_CH1_RX_LNA0_EN : std_logic_vector(7 downto 0)  := x"12";
    constant CMD_SET_CH2_RX_LNA0_EN : std_logic_vector(7 downto 0)  := x"13";
    constant CMD_SET_CH1_RX_LNA1_DIS : std_logic_vector(7 downto 0) := x"14";
    constant CMD_SET_CH2_RX_LNA1_DIS : std_logic_vector(7 downto 0) := x"15";

    
    constant DEST_ID : std_logic_vector(2 downto 0) := "101";
    type tSamA_State is (WAIT_FOR_PULSE, CLOCK_OUT_DATA, CLOCK_OUT_LE);
    signal sSamCh1_State : tSamA_State;         
    type tSamB_State is (WAIT_FOR_PULSE, CLOCK_OUT_DATA, CLOCK_OUT_LE);
    signal sSamCh2_State : tSamA_State;         
    signal ch1_pulse : std_logic;
    signal ch1_pulse_hist: std_logic;
    signal ch1_pulse_start: std_logic;
    signal ch2_pulse : std_logic;
    signal ch2_pulse_hist: std_logic;
    signal ch2_pulse_start: std_logic;
    signal registerSamCh1 : std_logic_vector(15 downto 0);
    signal registerSamCh2 : std_logic_vector(15 downto 0);
    signal samCh1_CLK : std_logic;
    signal samCh1_LE : std_logic; -- latch enable
    signal samCh1_SI : std_logic; -- serial in
    signal samCh2_CLK : std_logic;
    signal samCh2_LE : std_logic; -- latch enable
    signal samCh2_SI : std_logic; -- serial in

    signal ch1_rx_dsa_dat : std_logic_vector(5 downto 0);
    signal ch2_rx_dsa_dat : std_logic_vector(5 downto 0);

    signal ch1_tx_PA_en : std_logic;
    signal ch1_tx_LNA_dis : std_logic;
    signal ch1_rx_LNA0_byp : std_logic;
    signal ch1_rx_LNA1_byp : std_logic;
    signal ch1_rx_LNA0_dis : std_logic;
    signal ch1_rx_LNA0_en : std_logic;
    signal ch1_rx_LNA1_dis : std_logic;

    signal ch2_tx_PA_en : std_logic;
    signal ch2_tx_LNA_dis : std_logic;
    signal ch2_rx_LNA0_byp : std_logic;
    signal ch2_rx_LNA1_byp : std_logic;
    signal ch2_rx_LNA0_dis : std_logic;
    signal ch2_rx_LNA0_en : std_logic;
    signal ch2_rx_LNA1_dis : std_logic;

    signal comms_LED : std_logic;

    signal new_rx_byte : std_logic;
    signal id_match : std_logic;
    signal rx_reg : std_logic_vector(7 downto 0);
    signal tx_reg : std_logic_vector(7 downto 0);
    signal spi_rx_byte : std_logic_vector(7 downto 0);
    signal rx_bit_count : std_logic_vector(2 downto 0);
    signal rx_byte_count : std_logic_vector(7 downto 0);
    signal spi_addr_LSB : std_logic_vector(7 downto 0);
    signal message_counter : std_logic_vector(7 downto 0);
    signal spi_cmd : std_logic_vector(7 downto 0);
    signal spi_len : std_logic_vector(7 downto 0);
    signal spi_addr_MSB : std_logic_vector(7 downto 0);
    signal whole_command_byte : std_logic_vector(7 downto 0);
    signal new_command_received : std_logic;
    signal feedback_byte : std_logic_vector(7 downto 0);

    type version_array_t is array (1 downto 0) of std_logic_vector(7 downto 0);
    constant version_number : version_array_t := (VERSION_MAJOR, VERSION_MINOR); -- (byte1, byte0)

    signal transmit_rfsa3713_CH1 : std_logic;
    signal transmit_rfsa3713_CH2 : std_logic;
    signal rfsa3713_CH1_setting : std_logic_vector(15 downto 0);
    signal rfsa3713_CH2_setting : std_logic_vector(15 downto 0);
    
    
begin
    process(resetn_in,clk_in)
    begin
        if rising_edge(clk_in) then
            ch1_pulse <= transmit_rfsa3713_CH1;
            ch1_pulse_hist <= ch1_pulse;
            ch1_pulse_start <= ch1_pulse and (not ch1_pulse_hist); -- Rising edge  
        end if;
    end process;

    process(resetn_in,clk_in)
    begin
        if rising_edge(clk_in) then
            ch2_pulse <= transmit_rfsa3713_CH2;
            ch2_pulse_hist <= ch2_pulse;
            ch2_pulse_start <= ch2_pulse and (not ch2_pulse_hist); -- Rising edge  
        end if;
    end process;

    -- For SAM Ch1:
    process(resetn_in,clk_in)
    variable vSerialClocks : unsigned(5 downto 0);
    variable vClockDurationCount : unsigned(7 downto 0);
    begin
        if resetn_in = '0' then	
                sSamCh1_State <= WAIT_FOR_PULSE;
                samCh1_CLK <= '0';
                samCh1_LE <= '0';
                samCh1_SI <= '0';
                vSerialClocks := (others => '0');
                vClockDurationCount := (others => '0');
        elsif clk_in'event and clk_in = '1' then
            case sSamCh1_State is
            when WAIT_FOR_PULSE =>
                samCh1_LE <= '0';
                samCh1_SI <= '0';
                 if (ch1_pulse_start = '1') then
                    registerSamCh1 <= rfsa3713_CH1_setting;
                    vSerialClocks := (others => '0');
                    vClockDurationCount := (others => '0');
                    sSamCh1_State <= CLOCK_OUT_DATA;
                end if;
            when CLOCK_OUT_DATA =>
                samCh1_SI <= registerSamCh1(0); --LSB
                vClockDurationCount := vClockDurationCount + 1;
                if (vClockDurationCount = FCLKS_PER_SAMCLK) then
                    vClockDurationCount := (others => '0');
                    vSerialClocks := vSerialClocks + 1;
                    if (vSerialClocks = 16) then
                        vSerialClocks := (others => '0');
                        sSamCh1_State <= CLOCK_OUT_LE;
                    end if;
                    samCh1_CLK <= '0';
                    registerSamCh1(14 downto 0) <= registerSamCh1(15 downto 1); --rotate to LSB's
                    registerSamCh1(15) <= '0'; --just to be clean
                 elsif (vClockDurationCount = HALF_FCLKS_PER_SAMCLK) then
                     samCh1_CLK <= '1';
                 end if;
            when CLOCK_OUT_LE =>
                vClockDurationCount := vClockDurationCount + 1;
                 if (vClockDurationCount = FCLKS_PER_SAMCLK) then
                    vClockDurationCount := (others => '0');
                    samCh1_LE <= '0';
                    sSamCh1_State <= WAIT_FOR_PULSE;
                  elsif (vClockDurationCount = HALF_FCLKS_PER_SAMCLK) then
                      samCh1_LE <= '1';
                  end if;
        end case;
        end if;
    end process;  

    -- For SAM Ch2:
    process(resetn_in,clk_in)
    variable vSerialClocks : unsigned(5 downto 0);
    variable vClockDurationCount : unsigned(7 downto 0);
    begin
        if resetn_in = '0' then	
                sSamCh2_State <= WAIT_FOR_PULSE;
                samCh2_CLK <= '0';
                samCh2_LE <= '0';
                samCh2_SI <= '0';
                vSerialClocks := (others => '0');
                vClockDurationCount := (others => '0');
        elsif clk_in'event and clk_in = '1' then
            case sSamCh2_State is
            when WAIT_FOR_PULSE =>
                samCh2_LE <= '0';
                samCh2_SI <= '0';
                 if (ch2_pulse_start = '1') then
                    registerSamCh2 <= rfsa3713_CH2_setting;
                    vSerialClocks := (others => '0');
                    vClockDurationCount := (others => '0');
                    sSamCh2_State <= CLOCK_OUT_DATA;
                end if;
            when CLOCK_OUT_DATA =>
                samCh2_SI <= registerSamCh2(0); --LSB
                vClockDurationCount := vClockDurationCount + 1;
                if (vClockDurationCount = FCLKS_PER_SAMCLK) then
                    vClockDurationCount := (others => '0');
                    vSerialClocks := vSerialClocks + 1;
                    if (vSerialClocks = 16) then
                        vSerialClocks := (others => '0');
                        sSamCh2_State <= CLOCK_OUT_LE;
                    end if;
                    samCh2_CLK <= '0';
                    registerSamCh2(14 downto 0) <= registerSamCh2(15 downto 1); --rotate to LSB's
                    registerSamCh2(15) <= '0'; --just to be clean
                 elsif (vClockDurationCount = HALF_FCLKS_PER_SAMCLK) then
                     samCh2_CLK <= '1';
                 end if;
            when CLOCK_OUT_LE =>
                vClockDurationCount := vClockDurationCount + 1;
                 if (vClockDurationCount = FCLKS_PER_SAMCLK) then
                    vClockDurationCount := (others => '0');
                    samCh2_LE <= '0';
                    sSamCh2_State <= WAIT_FOR_PULSE;
                  elsif (vClockDurationCount = HALF_FCLKS_PER_SAMCLK) then
                      samCh2_LE <= '1';
                  end if;
        end case;
        end if;
    end process;  

  -- SPI Decoder:
  process(SPI_SS_in, SPI_CLK_in)
  variable vrx_bit_count : unsigned(2 downto 0);
  variable vrx_byte_count : unsigned(7 downto 0);
  begin
    if SPI_SS_in = '1' then  
      vrx_bit_count := (others => '0');
      vrx_byte_count := (others => '0');
      rx_reg <= (others => '0');
      new_rx_byte <= '0';
    elsif SPI_CLK_in'event and SPI_CLK_in = '1' then --clock positive edge
      if (vrx_bit_count = 7) then
        vrx_bit_count := (others => '0');
        rx_reg <= rx_reg(6 downto 0) & SPI_MOSI_in; --shift from LSB, since MSB is first
        spi_rx_byte <= rx_reg(6 downto 0) & SPI_MOSI_in; --shift from LSB, since MSB is first
        if id_match = '1' then
          new_rx_byte <= '1';
        else -- no ID match
          new_rx_byte <= '0';
        end if;
        if (vrx_byte_count /= 255)  then --prevent this index from wrapping back to 0
          vrx_byte_count := vrx_byte_count + 1;
        end if;  
      else --vrx_bit_count != 7
        vrx_bit_count := vrx_bit_count + 1;
        rx_reg <= rx_reg(6 downto 0) & SPI_MOSI_in; --shift from LSB, since MSB is first
        new_rx_byte <= '0';
      end if;
    end if; --SPI_CLK_in'event
    rx_bit_count <= std_logic_vector(vrx_bit_count);
    rx_byte_count <= std_logic_vector(vrx_byte_count);
  end process;  

  --Check whether we have an ID match on the upper nibble of the first received byte
  process(SPI_SS_in, SPI_CLK_in)
  begin
    if SPI_SS_in = '1' then  
      id_match <= '0';
    elsif SPI_CLK_in'event and SPI_CLK_in = '1' then
      if ((rx_byte_count = 0) and (rx_bit_count = 4)) then
        if (rx_reg(3 downto 0) = CHIP_ID) then
          id_match <= '1';
        end if; --rx_equal CHIP_ID
      end if; --rx_byte_count
    end if; --SPI_CLK_in'event
  end process;  

  --Count the number of messages received
  process(resetn_in, SPI_CLK_in)
  variable vmessage_counter : unsigned(7 downto 0);
  begin
    if resetn_in = '0' then  
      vmessage_counter := (others => '0');
    elsif SPI_CLK_in'event and SPI_CLK_in = '1' then
      if ((id_match = '1') and (new_command_received = '1')) then
        vmessage_counter := vmessage_counter + 1;
      end if;
    end if; --SPI_CLK_in'event
    message_counter <= std_logic_vector(vmessage_counter);
  end process;  

  --Latch the feedback from the board
  process(resetn_in, SPI_CLK_in)
  variable vmessage_counter : unsigned(7 downto 0);
  begin
    if resetn_in = '0' then  
      feedback_byte <= (others => '0');
    elsif SPI_CLK_in'event and SPI_CLK_in = '1' then
      feedback_byte(0) <= CH1_RX_OV_in;
      feedback_byte(1) <= CH2_RX_OV_in;
    end if; --SPI_CLK_in'event
  end process;  

  --Decode the received byte-level message:
  process(SPI_SS_in, SPI_CLK_in)
  begin
    if resetn_in = '0' then  
      transmit_rfsa3713_CH1 <= '0';
      transmit_rfsa3713_CH2 <= '0';
      new_command_received <= '0';
      comms_LED <= '0'; -- off
      ch1_rx_dsa_dat <= (others => '0'); -- maximum attenuation
      ch1_tx_PA_en <= '1'; -- enabled
      ch1_tx_LNA_dis <= '0'; -- enabled
      ch1_rx_LNA0_byp <= '0'; -- do not bypass
      ch1_rx_LNA1_byp <= '0'; -- do not bypass
      ch1_rx_LNA0_dis <= '1'; -- enabled
      ch1_rx_LNA0_en <= '0'; -- not reset
      ch1_rx_LNA1_dis <= '0'; -- not disabled
      ch2_rx_dsa_dat <= (others => '0'); -- maximum attenuation
      ch2_tx_PA_en <= '1'; -- enabled
      ch2_tx_LNA_dis <= '0'; -- enabled
      ch2_rx_LNA0_byp <= '0'; -- do not bypass
      ch2_rx_LNA1_byp <= '0'; -- do not bypass
      ch2_rx_LNA0_dis <= '1'; -- enabled
      ch2_rx_LNA0_en <= '0'; -- not reset
      ch2_rx_LNA1_dis <= '0'; -- not disabled
    elsif SPI_SS_in = '1' then  
      transmit_rfsa3713_CH1 <= '0';
      transmit_rfsa3713_CH2 <= '0';
      new_command_received <= '0';
    elsif SPI_CLK_in'event and SPI_CLK_in = '1' then --clock positive edge
      new_command_received <= '0'; --default 
      if (new_rx_byte = '1') then
        case rx_byte_count is
          when x"01" => --1st byte = Destination ID
          when x"02" => --2nd byte = CMD
            new_command_received <= '1'; 
            whole_command_byte <= spi_rx_byte; 
            spi_cmd <= spi_rx_byte;
          when x"03" => --3rd byte = ADDR
            spi_addr_LSB <= spi_rx_byte;
          when x"04" => --4th byte = LEN (number of data bytes)
            spi_len <= spi_rx_byte; 
          when x"05" => --1st data byte
            case spi_cmd is
              when CMD_SET_COMMS_LED =>
                comms_LED <= spi_rx_byte(0);
              when CMD_SET_CH1_RFSA3713 =>
                rfsa3713_CH1_setting(7 downto 0) <= spi_rx_byte;
              when CMD_SET_CH2_RFSA3713 =>
                rfsa3713_CH2_setting(7 downto 0) <= spi_rx_byte;
              when CMD_SET_CH1_RX_DSA =>
                ch1_rx_dsa_dat <= spi_rx_byte(5 downto 0);
              when CMD_SET_CH2_RX_DSA =>
                ch2_rx_dsa_dat <= spi_rx_byte(5 downto 0);
              when CMD_SET_CH1_TX_PA_EN =>
                ch1_tx_PA_en <= spi_rx_byte(0);
              when CMD_SET_CH2_TX_PA_EN =>
                ch2_tx_PA_en <= spi_rx_byte(0);
              when CMD_SET_CH1_TX_LNA_DIS =>
                ch1_tx_LNA_dis <= spi_rx_byte(0);
              when CMD_SET_CH2_TX_LNA_DIS =>
                ch2_tx_LNA_dis <= spi_rx_byte(0);
              when CMD_SET_CH1_RX_LNA0_BYP =>
                ch1_rx_LNA0_byp <= spi_rx_byte(0);
              when CMD_SET_CH2_RX_LNA0_BYP =>
                ch2_rx_LNA0_byp <= spi_rx_byte(0);
              when CMD_SET_CH1_RX_LNA1_BYP =>
                ch1_rx_LNA1_byp <= spi_rx_byte(0);
              when CMD_SET_CH2_RX_LNA1_BYP =>
                ch2_rx_LNA1_byp <= spi_rx_byte(0);
              when CMD_SET_CH1_RX_LNA0_DIS =>
                ch1_rx_LNA0_dis <= spi_rx_byte(0);
              when CMD_SET_CH2_RX_LNA0_DIS =>
                ch2_rx_LNA0_dis <= spi_rx_byte(0);
              when CMD_SET_CH1_RX_LNA0_EN =>
                ch1_rx_LNA0_en <= spi_rx_byte(0);
              when CMD_SET_CH2_RX_LNA0_EN =>
                ch2_rx_LNA0_en <= spi_rx_byte(0);
              when CMD_SET_CH1_RX_LNA1_DIS =>
                ch1_rx_LNA1_dis <= spi_rx_byte(0);
              when CMD_SET_CH2_RX_LNA1_DIS =>
                ch2_rx_LNA1_dis <= spi_rx_byte(0);
              when others =>
                  --Do nothing.
            end case;
          when x"06" => --2nd data byte
            if (spi_cmd = CMD_SET_CH1_RFSA3713) then
              rfsa3713_CH1_setting(15 downto 8) <= spi_rx_byte;
            elsif (spi_cmd = CMD_SET_CH2_RFSA3713) then
              rfsa3713_CH2_setting(15 downto 8) <= spi_rx_byte;
            end if;
          when x"07" => --3rd data byte
            if (spi_cmd = CMD_SET_CH1_RFSA3713) then
              transmit_rfsa3713_CH1 <= '1';
            elsif (spi_cmd = CMD_SET_CH2_RFSA3713) then
              transmit_rfsa3713_CH2 <= '1';
            end if;
          when others =>
            --Do nothing.  Usually you would assign further data bytes here
        end case;
      end if; --new_rx_byte
    end if; --SPI_CLK_in'event
  end process;  

  --Encode the SPI transmit signal:
  process(SPI_SS_in, SPI_CLK_in)
  variable vtx_bit_count : unsigned(2 downto 0);
  variable vtx_byte_count : unsigned(7 downto 0);
  variable vversion_index : unsigned(1 downto 0);
  begin
    if SPI_SS_in = '1' then  
      vtx_bit_count := "111"; --7
      vtx_byte_count := (others => '0');
      vversion_index := (others => '0');
      tx_reg <= (others => '1'); --Default high
    elsif SPI_CLK_in'event and SPI_CLK_in = '0' then --clock negative edge
      if (vtx_bit_count = 7) then
        case rx_byte_count is
          when x"00" => --1st byte = Destination ID
            tx_reg <= "00000" & DEST_ID(2 downto 0);  --Destination = Host
          when x"01" => --2nd byte = SRC ID and feedback
            tx_reg <= "0000" & CHIP_ID; 
          when x"02" => --3rd byte = MSG_NUM //and status, maybe
            tx_reg <= message_counter(7 downto 0); -- message counter 
          when x"03" => --4th byte = RSP_CMD = Response command 
            tx_reg <= whole_command_byte; -- For now, just respond with the same command that was sent  
          when x"04" => --5th byte = ADDR = Start Address LSB 
            tx_reg <= spi_addr_LSB; 
          when x"05" => --6th byte = LEN = Number of data bytes
            tx_reg <= spi_len; 
          when others =>
            if (spi_cmd = CMD_GET_VERSION) then --Read back the firmware version bytes
              tx_reg <= version_number(to_integer(vversion_index));
              vversion_index := vversion_index + 1;
            elsif (spi_cmd = CMD_GET_FEEDBACK) then --Read back the feedback byte
              tx_reg <= feedback_byte;
            end if;  
        end case;
        vtx_bit_count := (others => '0');
        vtx_byte_count := vtx_byte_count + 1;
      else --vtx_bit_count != 7
        vtx_bit_count := vtx_bit_count + 1;
        tx_reg <= tx_reg(6 downto 0) & '0'; --shift out the MSB first 
      end if;
    end if; --SPI_CLK_in'event
  end process;  

  --SPI_MISO_out <= SPI_MOSI_in; --for now, no response (just echo what came in)
  SPI_MISO_out <= tx_reg(7);
  
--Assign the outputs:
      CH1_LEX_out  <= samCh1_LE;
      CH1_CLKX_out <= samCh1_CLK;
      CH1_SIX_out  <= samCh1_SI;

      CH1_RX_DSA_D0X_out  <= ch1_rx_dsa_dat(0);
      CH1_RX_DSA_D1X_out  <= ch1_rx_dsa_dat(1);
      CH1_RX_DSA_D2X_out  <= ch1_rx_dsa_dat(2);
      CH1_RX_DSA_D3X_out  <= ch1_rx_dsa_dat(3);
      CH1_RX_DSA_D4X_out  <= ch1_rx_dsa_dat(4);
      CH1_RX_DSA_D5X_out  <= ch1_rx_dsa_dat(5);

      CH1_TX_PA_ENX_out    <= ch1_tx_PA_en;
      CH1_TX_LNA_DISX_out  <= ch1_tx_LNA_dis;
      CH1_RX_LNA0_BYPX_out <= ch1_rx_LNA0_byp;
      CH1_RX_LNA1_BYPX_out <= ch1_rx_LNA1_byp;
      CH1_RX_LNA0_DISX_out <= ch1_rx_LNA0_dis;
      CH1_RX_LNA0_ENX_out <= ch1_rx_LNA0_en;
      CH1_RX_LNA1_DISX_out <= ch1_rx_LNA1_dis;

      CH2_LEX_out  <= samCh2_LE;
      CH2_CLKX_out <= samCh2_CLK;
      CH2_SIX_out  <= samCh2_SI;

      CH2_RX_DSA_D0X_out  <= ch2_rx_dsa_dat(0);
      CH2_RX_DSA_D1X_out  <= ch2_rx_dsa_dat(1);
      CH2_RX_DSA_D2X_out  <= ch2_rx_dsa_dat(2);
      CH2_RX_DSA_D3X_out  <= ch2_rx_dsa_dat(3);
      CH2_RX_DSA_D4X_out  <= ch2_rx_dsa_dat(4);
      CH2_RX_DSA_D5X_out  <= ch2_rx_dsa_dat(5);

      CH2_TX_PA_ENX_out    <= ch2_tx_PA_en;
      CH2_TX_LNA_DISX_out  <= ch2_tx_LNA_dis;
      CH2_RX_LNA0_BYPX_out <= ch2_rx_LNA0_byp;
      CH2_RX_LNA1_BYPX_out <= ch2_rx_LNA1_byp;
      CH2_RX_LNA0_DISX_out <= ch2_rx_LNA0_dis;
      CH2_RX_LNA0_ENX_out  <= ch2_rx_LNA0_en;
      CH2_RX_LNA1_DISX_out <= ch2_rx_LNA1_dis;

      COMMS_LEDX_out  <= comms_LED;

end Behavioral; 