-- Copyright (c) 2015, $ME
-- All rights reserved.
--
-- Redistribution and use in source and synthezised forms, with or without modification, are permitted 
-- provided that the following conditions are met:
--
-- 1. Redistributions of source code must retain the above copyright notice, this list of conditions 
--    and the following disclaimer.
--
-- 2. Redistributions in synthezised form must reproduce the above copyright notice, this list of conditions
--    and the following disclaimer in the documentation and/or other materials provided with the distribution.
--
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED 
-- WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A 
-- PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR 
-- ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED 
-- TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) 
-- HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING 
-- NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
-- POSSIBILITY OF SUCH DAMAGE.
--
--
-- PS/2 -> KC87 Keymatrix
--

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ps2kc is
    generic (
        sysclk : integer := 50000000 -- 50MHz
    );
    port (
        clk      : in std_logic;
        res      : in std_logic;
        ps2clk   : inout std_logic;
        ps2data  : inout std_logic;
        data     : out std_logic_vector(7 downto 0);
        ps2code  : out std_logic_vector(7 downto 0);
        ps2rcvd  : out std_logic;
--        test2    : out std_logic_vector(9 downto 0);
        matrixXin  : in  std_logic_vector(7 downto 0);
        matrixXout : out std_logic_vector(7 downto 0);
        matrixYin  : in  std_logic_vector(7 downto 0);
        matrixYout : out std_logic_vector(7 downto 0)
    );
end;

architecture rtl of ps2kc is
--    type keybordState is (idle, break, pause1, pause2);
    
    signal scancode : std_logic_vector(7 downto 0);
    signal rcvd     : std_logic;

    signal extE0    : boolean := false;
    signal noBreak    : std_logic := '1';
    signal altGr    : boolean := false;
    signal lshift   : boolean := false;
    signal rshift   : boolean := false;
    signal shift    : std_logic;
    
    type keyMatrixType is array(8 downto 1) of std_logic_vector(8 downto 1);
	 -- init mit 1 funktioniert in ise nicht
    signal keyMatrix : keyMatrixType := (others => (others => '0'));
    
begin
--    test2(0) <= shift;
--    test2(1) <= altGr;
--    test2(2) <= noBreak;

--    test2 <= keyMatrix(9 downto 0);
    
    shift <=  '1' when lshift or rshift else '0';

    ps2code <= scancode;
    ps2rcvd <= rcvd;
    
--    data(0) <= '1' when lshift else '0';
--    data(1) <= '1' when rshift else '0';
--    data(2) <= shift;
--    data(3) <= '1' when altGr else '0';
--    data(4) <= '1' when extE0 else '0';
--    data(5) <= noBreak;
--    data(6) <= keyMatrix(8)(1);
--    data(7) <= '1' when invertShift else '0';
    
	 data <= keyMatrix(1)(8 downto 1);
	 
    ps2if : entity work.ps2if
    generic map (
        sysclk => sysclk
    )
    port map (
        clk     => clk,
        res     => '1',
        ps2clk  => ps2clk,
        ps2data => ps2data,
        data    => scancode,
        error   => open,
        rcvd    => rcvd
    );
    
    -- ps/2-codes in eine 8x8 matrix umkopieren die weitgehend der des kc entspricht 
    process
    begin
        wait until rising_edge(clk);
		  
        if (rcvd='1') then
            if scancode=x"F0" then -- keyup => break
                noBreak <= '0';
            elsif scancode=x"E0" then -- e0-code
                extE0 <= true;
            else -- keyevent
                noBreak <= '1';
                extE0 <= false;

                case scancode is
                    when x"E1" => null;
                    when x"59" => rshift <= noBreak = '1';
                    when x"12" => lshift <= noBreak = '1';
                    when x"11" => if (extE0) then altGr <= noBreak = '1'; end if;
                    
                    --- Zeile 1
                    when x"45" => keyMatrix(1)(1) <= noBreak; -- 0 (_)  => (0 =)
                    when x"16" => keyMatrix(1)(2) <= noBreak; -- 1 !
                    when x"1e" => keyMatrix(1)(3) <= noBreak; -- 2 "
                    when x"26" => keyMatrix(1)(4) <= noBreak; -- 3 (#)  => (3 §)
                    when x"25" => keyMatrix(1)(5) <= noBreak; -- 4 $
                    when x"2e" => keyMatrix(1)(6) <= noBreak; -- 5 %
                    when x"36" => keyMatrix(1)(7) <= noBreak; -- 6 &
                    when x"3d" => keyMatrix(1)(8) <= noBreak; -- 7 (')  => (7 /)
                    
                    --- Zeile 2
                    when x"3e" => keyMatrix(2)(1) <= noBreak; -- 8 (
                    when x"46" => keyMatrix(2)(2) <= noBreak; -- 9 )
                    when x"61" => keyMatrix(2)(3) <= noBreak; -- : *  => (< >)
                    when x"5b" => keyMatrix(2)(4) <= noBreak; -- ; +  => (+ *)
                    when x"41" => keyMatrix(2)(5) <= noBreak; -- , <  => (, ;)
                    when x"4a" => keyMatrix(2)(6) <= noBreak; -- = -  => (- _)
                    when x"49" => keyMatrix(2)(7) <= noBreak; -- . >  => (. :)
                    when x"4e" => keyMatrix(2)(8) <= noBreak; -- ? /  => (ß ?)
                    
                    --- Zeile 3
                    -- @
                    when x"1c" => keyMatrix(3)(2) <= noBreak; -- A
                    when x"32" => keyMatrix(3)(3) <= noBreak; -- B
                    when x"21" => keyMatrix(3)(4) <= noBreak; -- C
                    when x"23" => keyMatrix(3)(5) <= noBreak; -- D
                    when x"24" => keyMatrix(3)(6) <= noBreak; -- E
                    when x"2b" => keyMatrix(3)(7) <= noBreak; -- F
                    when x"34" => keyMatrix(3)(8) <= noBreak; -- G
                    
                    --- Zeile 4
                    when x"33" => keyMatrix(4)(1) <= noBreak; -- H
                    when x"43" => keyMatrix(4)(2) <= noBreak; -- I
                    when x"3b" => keyMatrix(4)(3) <= noBreak; -- J
                    when x"42" => keyMatrix(4)(4) <= noBreak; -- K
                    when x"4b" => keyMatrix(4)(5) <= noBreak; -- L
                    when x"3a" => keyMatrix(4)(6) <= noBreak; -- M
                    when x"31" => keyMatrix(4)(7) <= noBreak; -- N
                    when x"44" => keyMatrix(4)(8) <= noBreak; -- O
                    
                    --- Zeile 5
                    when x"4d" => keyMatrix(5)(1) <= noBreak; -- P
                    when x"15" => keyMatrix(5)(2) <= noBreak; -- Q
                    when x"2d" => keyMatrix(5)(3) <= noBreak; -- R
                    when x"1b" => keyMatrix(5)(4) <= noBreak; -- S
                    when x"2c" => keyMatrix(5)(5) <= noBreak; -- T
                    when x"3c" => keyMatrix(5)(6) <= noBreak; -- U
                    when x"2a" => keyMatrix(5)(7) <= noBreak; -- V
                    when x"1d" => keyMatrix(5)(8) <= noBreak; -- W
                    
                    --- Zeile 6
                    when x"22" => keyMatrix(6)(1) <= noBreak; -- X
                    when x"1a" => keyMatrix(6)(2) <= noBreak; -- Y
                    when x"35" => keyMatrix(6)(3) <= noBreak; -- Z
                    when x"0d" => keyMatrix(6)(4) <= noBreak; -- Tab
                    when x"05" => keyMatrix(6)(5) <= noBreak; -- Pause Cont => (F1)
                    when x"70" => keyMatrix(6)(6) <= noBreak; -- INS DEL    => (Einfg)
                    when x"0e" => keyMatrix(6)(7) <= noBreak; -- ^
                    when x"71" => keyMatrix(6)(8) <= noBreak; -- (Entf)       => DEL
                    when x"66" => keyMatrix(6)(8) <= noBreak; -- (Backspace)  => DEL
                    
                    --- Zeile 7
                    when x"6b" => keyMatrix(7)(1) <= noBreak; -- Cursor <-
                    when x"74" => keyMatrix(7)(2) <= noBreak; -- Cursor ->
                    when x"72" => keyMatrix(7)(3) <= noBreak; -- Cursor down
                    when x"75" => keyMatrix(7)(4) <= noBreak; -- Cursor up
                    when x"76" => keyMatrix(7)(5) <= noBreak; -- ESC
                    when x"5a" => keyMatrix(7)(6) <= noBreak; -- Enter
                    when x"0c" => keyMatrix(7)(7) <= noBreak; -- Stop => F4
                    when x"29" => keyMatrix(7)(8) <= noBreak; -- Space
                    
                    --- Zeile 8
                    -- (8)(1) Shift 
                    when x"03" => keyMatrix(8)(2) <= noBreak; -- Color   => (F5)
                    when x"14" => keyMatrix(8)(3) <= noBreak; -- Contr
                    when x"0b" => keyMatrix(8)(4) <= noBreak; -- Graphic => (F6)
                    when x"06" => keyMatrix(8)(5) <= noBreak; -- List    => (F2)
                    when x"04" => keyMatrix(8)(6) <= noBreak; -- Run     => (F3)
                    when x"58" => keyMatrix(8)(7) <= noBreak; -- Shift Lock
                    when x"5d" => keyMatrix(8)(8) <= noBreak; --  => (# ')
                    when others =>null;
                end case;

            end if;
        end if;
    end process;
    
    -- tasten in eine temp. umkopieren und an die endgültige position verschieben
    process(keyMatrix,matrixYin,matrixXin,shift,altGr)
        variable tmpKeyMatrix : keyMatrixType;
    begin
        -- Mapping von vom Standard abweichenden Tasten
		  -- werte in tmp. matrix umkopieren und invertieren
		  for i in 1 to 8 loop
				tmpKeyMatrix(i) := not(keyMatrix(i));
		  end loop;
		
        -- tasten verschieben
        -- shift
        tmpKeyMatrix(8)(1) := not(shift);
        
        if (keyMatrix(5)(2)='1' and altGr) then -- altGr+Q => @
            tmpKeyMatrix(5)(2):='1';
            tmpKeyMatrix(3)(1):='0';
        end if;
        
        if (keyMatrix(6)(8)='1') then -- entf+backspace => shift+INS DEL
            tmpKeyMatrix(6)(8):='1';
            tmpKeyMatrix(6)(6):='0';
            tmpKeyMatrix(8)(1):='0';
        end if;
        
        if (keyMatrix(1)(1)='1' and shift='1') then -- (0 =) => (= -)
            tmpKeyMatrix(8)(1):='1';
            tmpKeyMatrix(1)(1):='1';
            tmpKeyMatrix(2)(6):='0';
        end if;
        
        if (keyMatrix(1)(4)='1' and shift='1') then  -- (3 §)
            tmpKeyMatrix(1)(4):='1';
        end if;
        
        if (keyMatrix(1)(8)='1' and shift='1') then  -- (7 /) => (? /)
            tmpKeyMatrix(1)(8):='1';
            tmpKeyMatrix(2)(8):='0';
        end if;
        
        if (keyMatrix(2)(3)='1') then -- (< >) => (, <) / (. >)
            tmpKeyMatrix(2)(3):='1';
            if (shift='1') then
                tmpKeyMatrix(2)(7):='0';
            else
                tmpKeyMatrix(8)(1):='0';
                tmpKeyMatrix(2)(5):='0';
            end if;
        end if;
        
        if (keyMatrix(2)(4)='1') then -- (+ *) => (; +) / (: *)
            if (shift='1') then
                tmpKeyMatrix(2)(4):='1';
                tmpKeyMatrix(2)(3):='0';
            else
                tmpKeyMatrix(8)(1):='0';
            end if;
        end if;
        
        if (keyMatrix(2)(5)='1' and shift='1') then -- (, ;) => (, <) / (; +)
            tmpKeyMatrix(8)(1):='1';
            tmpKeyMatrix(2)(5):='1';
            tmpKeyMatrix(2)(4):='0';
        end if;
        
        if (keyMatrix(2)(6)='1') then -- (- _) => (0 _) / (= -)
            if (shift='1') then
                tmpKeyMatrix(2)(6):='1';
                tmpKeyMatrix(1)(1):='0';
            else
                tmpKeyMatrix(8)(1):='0';
            end if;
        end if;
        
        if (keyMatrix(2)(7)='1' and shift='1') then -- (. :) => (. >) / (: *)
            tmpKeyMatrix(8)(1):='1';
            tmpKeyMatrix(2)(7):='1';
            tmpKeyMatrix(2)(3):='0';
        end if;
        
        if (keyMatrix(2)(8)='1' and shift='1') then -- (ß ?) => (? /)
            tmpKeyMatrix(8)(1):='1';
        end if;
   
        if (keyMatrix(8)(8)='1') then -- (# ') => (3 #) / (7 ')
            tmpKeyMatrix(8)(8):='1';
            tmpKeyMatrix(8)(1):='0';
            if (shift='1') then
                tmpKeyMatrix(1)(8):='0';
            else
                tmpKeyMatrix(1)(4):='0';
            end if;
        end if;
        
        -- matrix zeilen und spalten fuer pio kombinieren
        for i in 0 to 7 loop
            matrixXout(i) <= (tmpKeyMatrix(1)(i+1) or matrixYin(0)) 
                and (tmpKeyMatrix(2)(i+1) or matrixYin(1)) 
                and (tmpKeyMatrix(3)(i+1) or matrixYin(2)) 
                and (tmpKeyMatrix(4)(i+1) or matrixYin(3)) 
                and (tmpKeyMatrix(5)(i+1) or matrixYin(4)) 
                and (tmpKeyMatrix(6)(i+1) or matrixYin(5)) 
                and (tmpKeyMatrix(7)(i+1) or matrixYin(6)) 
                and (tmpKeyMatrix(8)(i+1) or matrixYin(7));
                
            if ((tmpKeyMatrix(i+1) or matrixXin)="11111111") then
                matrixYout(i) <= '1';
            else
                matrixYout(i) <= '0';
            end if;
       end loop;
    end process;
end;
