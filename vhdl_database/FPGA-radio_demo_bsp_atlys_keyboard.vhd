--  ****************************************************************************
--  Filename         :keyboard.vhd
--  Project          :Wishbone SOC 
--  Version          :0.1
--  Author           :Jonathan P Dawson
--  Created Date     :2006-04-14
--  ****************************************************************************
--  Description      :PS/2 keyboard decoder
--  ****************************************************************************
--  Dependencies     :Standard Libraries
--  ****************************************************************************
--  Revision History :
--  
--  Date :2006-04-14
--  Author :Jonathan P Dawson
--  Modification: Created File
--  
--  ****************************************************************************
--  Copyright (C) Jonathan P Dawson 2005
--  ****************************************************************************
library ieee;
use ieee.std_logic_1164.all;

entity KEYBOARD is
  port (
  CLK      : in  Std_logic;
  RST      : in  Std_logic;

  DATA_STB : out Std_logic;
  DATA_ACK : in  Std_logic;
  DATA     : out Std_logic_vector (31 downto 0);
  
  KD      : in  Std_logic;
  KC      : in  Std_logic
  );
end KEYBOARD;


architecture RTL of KEYBOARD is

  type STATETYPE is (
  INITIALISE,
  SEND_DATA,
  GET_DATA);

  signal STATE : STATETYPE;
  signal LAST_KC, INT_KC, INT_KD, KC_DEL, KD_DEL, S_DATA_STB : std_logic;
  signal INT_DATA : std_logic_vector(10 downto 0);
  signal BIT_COUNT : integer range 0 to 10;
  signal TIMEOUT : integer range 0 to 50000000;
  
begin
  
  process
  begin
    wait until rising_edge(CLK);
    KD_DEL <= KD;
    KC_DEL <= KC;
    INT_KD <= KD_DEL;
    INT_KC <= KC_DEL;
  end process;
  
  process
  begin
    wait until rising_edge(CLK);

    LAST_KC <= INT_KC;

    case STATE is

      when INITIALISE =>
        STATE <= GET_DATA;
        BIT_COUNT <= 0;

      when GET_DATA =>
        if TIMEOUT = 0 then
          STATE <= INITIALISE;
          TIMEOUT <= 50000000;
        else
          TIMEOUT <= TIMEOUT - 1;
        end if;
        if LAST_KC = '1' and INT_KC = '0' then
          INT_DATA(BIT_COUNT) <= INT_KD;
          if BIT_COUNT = 10 then
            BIT_COUNT <= 0;
            STATE <= SEND_DATA;
          else
            BIT_COUNT <= BIT_COUNT + 1;
          end if;
        end if;

      when SEND_DATA =>
        S_DATA_STB <= '1';
        DATA(7 downto 0) <= INT_DATA(8 downto 1);
        if S_DATA_STB = '1' and DATA_ACK = '1' then
          S_DATA_STB <= '0';
          STATE <= GET_DATA;
        end if;

    end case;

    if RST = '1' then
      STATE <= INITIALISE;
      S_DATA_STB <= '0';
    end if;

  end process;

  DATA_STB <= S_DATA_STB;
  
end RTL;
