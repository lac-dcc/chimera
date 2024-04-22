------------------------------------------------------------------------
-- quadrature_fsm.vhd
------------------------------------------------------------------------
-- Author : David Banks
--              Copyright 2016

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity quadrature_fsm is
port (
    clk  : in std_logic;
    rst  : in std_logic;
    load : in std_logic;
    inc  : in std_logic_vector(7 downto 0);
    sign : in std_logic;
    ao   : out std_logic;
    bo   : out std_logic
);
end quadrature_fsm;

architecture Behavioral of quadrature_fsm is
type quad_state is
(
   idle, count1, count2
);
signal state   : quad_state := idle;
signal dir     : std_logic;
signal count   : std_logic_vector(7 downto 0);
signal delay   : std_logic_vector(13 downto 0);
signal a       : std_logic;
signal b       : std_logic;
begin
    process(clk, rst) begin
        if (rst = '1') then
            state <= idle;
            a     <= '0';
            b     <= '0';
            dir   <= '0';
        elsif (rising_edge(clk)) then
            case state is
                when idle =>
                    if load = '1' and inc /= x"00" then
                        state <= count1;
                        count <= inc;
                        dir   <= sign;
                        delay <= (others => '1');
                    end if;
                when count1 =>
                    delay <= delay - 1;
                    if delay = 0 then
                        if dir = '1' then
                            b <= not b;
                            -- inc is negative, so increase
                            count <= count + 1;
                        else
                            a <= not a;
                            -- inc is positive, so decrease
                            count <= count - 1;
                        end if;                        
                        state <= count2;
                    end if;
                when count2 =>
                    delay <= delay - 1;
                    if delay = 0 then
                        if dir = '1' then
                            a <= not a;
                        else
                            b <= not b;
                        end if;                        
                        if count = x"00" then
                            state <= idle;
                        else
                            state <= count1;
                        end if;
                    end if;
            end case;
        end if;
    end process;
    ao <= a;
    bo <= b;
end;
