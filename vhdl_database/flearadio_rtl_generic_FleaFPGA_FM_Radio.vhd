-- ################# FleaFPGA FM Radio receiver Example ##################
-- #######################################################################
-- Module Name:         FleaFPGA_FM_Radio.vhd
-- Module Version:      0.1 
-- Module author:       Valentin Angelovski
-- Module date:         30/10/2014
-- Project IDE:         Lattice Diamond ver. 3.1.0.96
--
-- Copyright (C) 2014 Valentin Angelovski
-- 
-- This source file may be used and distributed without 
-- restriction provided that this copyright statement is not 
-- removed from the file and that any derivative work contains 
-- the original copyright notice and the associated disclaimer.
-- 
-- This source file is free software; you can redistribute it 
-- and/or modify it under the terms of the GNU Lesser General 
-- Public License as published by the Free Software Foundation;
-- either version 2.1 of the License, or (at your option) any 
-- later version. 
-- 
-- This source is distributed in the hope that it will be 
-- useful, but WITHOUT ANY WARRANTY; without even the implied 
-- warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR 
-- PURPOSE. See the GNU Lesser General Public License for more 
-- details. 
-- 
-- You should have received a copy of the GNU Lesser General 
-- Public License along with this source; if not, download it 
-- from http://www.opencores.org/lgpl.shtml 
-- 
----------------------------------------------------------------------------------/
--
-- Version release history
-- 30/10/2014 v0.1 (Initial beta pre-release)
 
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
 

entity FleaFPGA_FM_Radio is
  
port (
    clk: in  STD_LOGIC;    -- FleaFPGA 50MHz master clock
    rst: in  STD_LOGIC;    -- FleaFPGA system reset

    PWM_Q:  BUFFER  STD_LOGIC;      -- Sigma Delta ADC - Comparator result
    Sampler_D: in   STD_LOGIC;      -- Result from integrated comparator for GPIO1/10

    push_button1: in   STD_LOGIC;      -- RF Local oscillator frequency increase 
    push_button2: in   STD_LOGIC;      -- RF Local oscillator frequency decrease

--	GPIO5: BUFFER  STD_LOGIC;

    LED: BUFFER  STD_LOGIC_VECTOR(7 downto 0) -- to user LEDs on FleaFPGA
);

END FleaFPGA_FM_Radio;  
ARCHITECTURE behavior OF FleaFPGA_FM_Radio IS

  -- Internal signals are declared here: 

  signal K_mod_control: unsigned (31 downto 0) := x"000FFFFF";
  signal lpf_output : std_logic_vector(11 downto 0);
  signal lpf_output2 : unsigned(11 downto 0);
  signal lpf_output3 : unsigned(11 downto 0);
  signal input_sample: std_logic_vector(7 downto 0);
  signal input_sample2: std_logic_vector (11 downto 0);
  signal input_sample3: signed (7 downto 0);
  signal input_sample4: std_logic_vector (7 downto 0);
  signal input_sample40: std_logic_vector (7 downto 0);
  signal input_sample41: std_logic_vector (7 downto 0);

  signal PLL_RESET : std_logic:= '1';

  signal clk_8MHz : std_logic;
  signal clk_10MHz : std_logic;
  signal clk_20MHz : std_logic;
  signal clk_360MHz : std_logic;

  signal sample_cntr: unsigned(11 downto 0);
  signal long_timer : unsigned(19 downto 0);
  signal phase_accumulator : unsigned (31 downto 0);

BEGIN 

-- Need to generate separate clocks for the ADC (200MHz) and VGA (25MHz)
-- So a PLL module is empolyed for this purpose
-- U1 : entity work.ADC_PLL
-- port map (CLKI=>clk, CLKOP=>clk_20, CLKOS=>clk_400kHz, CLKOS2=>clk_10);  

U2 : entity work.RF_PLL
    port map (
        CLKI=>clk,
        CLKOP=>clk_20MHz,
        CLKOS=>clk_8MHz,
        CLKOS2=>clk_360MHz,
        CLKOS3=>clk_10MHz
    );


-- IF High-Pass Filter (HPF) stage
FIR0 : entity work.FIR8
    port map(
        clock=>clk_10MHz,
        reset=>rst,
        data_in=>input_sample3,
        data_out=>input_sample40
    );

-- IF Low-Pass Filter (LPF) stage
FIR1 : entity work.FIR8
    port map(
        clock=>clk_20MHz,
        reset=>rst,
        data_in=>input_sample3,
        data_out=>input_sample41
    );

-- FM Demodulator Phase-Locked-Loop (PLL) Stage
U3 : entity work.circuit
    port map (clk=>clk_8MHz,
	reset=>PLL_RESET,
	fmin=>input_sample4(7 downto 0),
	--fmin=>input_sample,
	dmout=>input_sample2
    );

-- AF (Audio Frequency) Low-pass filter stage
FIR2 : entity work.FIR
    port map(
        clock=>sample_cntr(3),
        reset=>rst,
        data_in=>signed(input_sample2),
        data_out=>lpf_output
    );

-- Audio PWM-DAC stage
PWM0 : entity work.simple_PWM
    port map(
        clk => clk_20MHz,
        rst => rst,
        pwm_value => unsigned(lpf_output3),
        PWM_Q => PWM_Q
    );

-- **** Our combinatorial Logic goes here: ****

LED <= K_mod_control(20 downto 13); -- When user changes frequency, LEDs will blink

-- Convert audio filtered output (signed value) to unsigned as required by the PWM module
lpf_output3 <= unsigned(signed(lpf_output(11 downto 0)) + 2047);

-- Combine HPF and LPF stages to form a Band-pass filter for processing of the IF waveform
input_sample4 <= std_logic_vector(signed(input_sample41) - signed(input_sample40));



-- **** Our synchronous Logic goes here: ****

-- Digital Mixer: Converts 100MHz down to 1MHz (After filtering, of course!)
PROCESS (phase_accumulator(31))
    BEGIN
    if rst = '1' then -- reset
        input_sample3 <= x"00";
    else
        if rising_edge(phase_accumulator(31)) then
            if Sampler_D = '1' then
                input_sample3 <= x"70";
            else
                input_sample3 <= x"8F";
            end if;
        end if;
    END IF;
END PROCESS;


-- User adjustable frequency source (local RF oscillator) for the mixer
PROCESS (clk_360MHz)
    BEGIN
    if rst = '1' then -- reset
        phase_accumulator <= x"00000000";
    else
        if rising_edge(clk_360MHz) then
            phase_accumulator <= phase_accumulator + K_mod_control;
        end if;
    END IF;
END PROCESS;

-- station scan buttons
-- Note: User can increase the "+/-7000" constants to a higher value for faster manual tuning
PROCESS (long_timer(19))
    BEGIN
    if rst = '1' then -- reset
        K_mod_control <= x"40A3D70A"; -- Reset to 91MHz L.O. Frequency output
    else
        if rising_edge(long_timer(19)) then
            if(push_button1 = '0') then
                K_mod_control <= K_mod_control + 7000;
            end if;
            if(push_button2 = '0') then
                K_mod_control <= K_mod_control - 7000;
            end if;
            if(push_button1 = '0') and (push_button2 = '0') then
                K_mod_control <= x"40A3D70A"; -- User reset to 91MHz L.O. Frequency
            end if;
        end if;
    END IF;
END PROCESS;

-- Sub-1MHz clock out rates and long time delays
PROCESS (clk_8MHz)
    BEGIN
    if rst = '1' then -- reset
        sample_cntr <= x"000";
        long_timer <= x"00000";
    else
        if rising_edge(clk_8MHz) then
            long_timer <= long_timer + 1;
            sample_cntr <= sample_cntr + 1;
        end if;
    END IF;
END PROCESS;

-- Reset circuit as needed in order for the PLL to function properly
RESET_GEN: process
begin
    LOOP1: for N in 0 to 255 loop
        wait until falling_edge(clk_8MHz);
    end loop LOOP1;
    PLL_RESET <= '0';
end process RESET_GEN;

end architecture;
