----------------------------------------------------------------------------------
-- Company: Peralex Electronics
-- Engineer: Gavin Teague
-- 
-- Create Date: 05.09.2014 10:19:29
-- Design Name: 
-- Module Name: mezzanine_enable_delay - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Creates a delayed version of mezzanine enable before start checking for faults.
-- This is to handle the delay through the buffers. When disabled, disabled 
-- immediately.
--
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity mezzanine_enable_delay is
	port(
		clk : in std_logic;
		rst : in std_logic;
		
		second_toggle                    : in std_logic;
		mezzanine_enable                 : in std_logic;
        mezzanine_fault_checking_enable  : out std_logic);
end mezzanine_enable_delay;

--}} End of automatically maintained section

architecture arch_mezzanine_enable_delay of mezzanine_enable_delay is

    type T_MEZZANINE_ENABLE_STATE is (
    DISABLED,
    WAIT_FOR_SECOND_TOGGLE_1,
    WAIT_FOR_SECOND_TOGGLE_2,
    ENABLED);

    signal current_mezzanine_enable_state : T_MEZZANINE_ENABLE_STATE;

    signal second_toggle_z1 : std_logic;    
    
begin

------------------------------------------------------------------------------------
-- DETECT TOGGLING OF SECOND 
------------------------------------------------------------------------------------

    gen_second_toggle_z1 : process(rst, clk)
    begin
        if (rst = '1')then
            second_toggle_z1 <= '0';
        elsif (rising_edge(clk))then
            second_toggle_z1 <= second_toggle;
        end if;
    end process;

------------------------------------------------------------------------------------
-- STATE MACHINE TO HANDLE TIMING 
------------------------------------------------------------------------------------

    gen_current_mezzanine_enable_state : process(rst, clk)
    begin
        if (rst = '1')then
            current_mezzanine_enable_state <= DISABLED;
        elsif (rising_edge(clk))then
            case current_mezzanine_enable_state is
                when DISABLED =>
                current_mezzanine_enable_state <= DISABLED;
                
                if (mezzanine_enable = '1')then
                    current_mezzanine_enable_state <= WAIT_FOR_SECOND_TOGGLE_1;
                end if;
                
                when WAIT_FOR_SECOND_TOGGLE_1 =>
                current_mezzanine_enable_state <= WAIT_FOR_SECOND_TOGGLE_1;
                
                if (second_toggle /= second_toggle_z1)then
                    current_mezzanine_enable_state <= WAIT_FOR_SECOND_TOGGLE_2;
                end if;
                
                when WAIT_FOR_SECOND_TOGGLE_2 =>
                current_mezzanine_enable_state <= WAIT_FOR_SECOND_TOGGLE_2;
                
                if (second_toggle /= second_toggle_z1)then
                    current_mezzanine_enable_state <= ENABLED;
                end if;
                
                when ENABLED =>
                current_mezzanine_enable_state <= ENABLED;
                
                if (mezzanine_enable = '0')then
                    current_mezzanine_enable_state <= DISABLED;
                end if;
                
            end case;
        end if;
    end process;
    
    mezzanine_fault_checking_enable <= '1' when (current_mezzanine_enable_state = ENABLED) else '0';
    
end arch_mezzanine_enable_delay;
