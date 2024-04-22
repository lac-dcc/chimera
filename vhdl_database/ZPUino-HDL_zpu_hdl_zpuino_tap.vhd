library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity tap is
  port (
    TDI:  in std_logic;
    TDO:  out std_logic;
    TMS:  in std_logic;
    TCK:  in std_logic;

    out_TCK: out std_logic;
    out_TDI: out std_logic;
    out_CAPTUREIR: out std_logic;
    out_UPDATEIR:  out std_logic;
    out_SHIFTIR:  out std_logic;
    out_CAPTUREDR: out std_logic;
    out_UPDATEDR:  out std_logic;
    out_SHIFTDR:  out std_logic;
    out_TLR:      out std_logic;
    in_TDO_IR:   in std_logic;
    in_TDO_DR:   in std_logic
  );
end entity tap;


architecture behave of tap is

  type tapstate_type is (
    State_TestLogicReset,
    State_RunTestIdle,
    State_SelectDRScan,
    State_CaptureDR,
    State_ShiftDR,
    State_Exit1DR,
    State_PauseDR,
    State_Exit2DR,
    State_UpdateDR,
  	State_SelectIRScan,
    State_CaptureIR,
    State_ShiftIR,
    State_Exit1IR,
    State_PauseIR,
    State_Exit2IR,
    State_UpdateIR
  );

  type tapregs_type is record
    state: tapstate_type;
  end record;

  signal r: tapregs_type;

  signal i_CAPTUREIR:std_logic;
  signal i_UPDATEIR: std_logic;
  signal i_SHIFTIR:  std_logic;
  signal i_CAPTUREDR:std_logic;
  signal i_UPDATEDR: std_logic;
  signal i_SHIFTDR:  std_logic;
  signal i_TLR:      std_logic;


begin

process (TCK, r)
  variable w: tapregs_type;
begin

  case r.state is
    when State_TestLogicReset =>
      if TMS='0' then
        w.state := State_RunTestIdle;
      else
        w.state := State_TestLogicReset;
      end if;

    when State_RunTestIdle =>
      if TMS='1' then
        w.state := State_SelectDRScan;
      else
        w.state := State_RunTestIdle;
      end if;

    when State_SelectDRScan =>
      if TMS='1' then
        w.state := State_SelectIRScan;
      else
        w.state := State_CaptureDR;

      end if;
  
     when State_CaptureDR =>
      if TMS='1' then
        w.state := State_Exit1DR;
      else
        w.state := State_ShiftDR;
      end if;
  
    when State_ShiftDR =>
      if TMS='1' then
        w.state := State_Exit1DR;
      else
        w.state := State_ShiftDR;
    end if;
  
    when State_Exit1DR =>
      if TMS='1' then
        w.state := State_UpdateDR;
      else
        w.state := State_PauseDR;
      end if; 
 
    when State_PauseDR =>
      if TMS='1' then
        w.state := State_Exit2DR;
      else
        w.state := State_PauseDR;
      end if;  

    when State_Exit2DR =>
      if TMS='1' then
        w.state := State_UpdateDR;
      else
        w.state := State_ShiftDR;
      end if;  

    when State_UpdateDR =>
      if TMS='1' then
        w.state := State_SelectDRScan;
      else
        w.state := State_RunTestIdle;
      end if;

    when State_SelectIRScan =>
      if TMS='1' then
        w.state := State_TestLogicReset;
      else
        w.state := State_CaptureIR;
      end if;

    when State_CaptureIR =>
      if TMS='1' then
        w.state := State_Exit1IR;
      else
        w.state := State_ShiftIR;
      end if;

    when State_ShiftIR =>
      if TMS='1' then
        w.state := State_Exit1IR;
      else
        w.state := State_ShiftIR;
      end if;

    when State_Exit1IR =>
      if TMS='1' then
        w.state := State_UpdateIR;
      else
        w.state := State_PauseIR;
      end if;

    when State_PauseIR =>
      if TMS='1' then
        w.state := State_Exit2IR;
      else
        w.state := State_PauseIR;
      end if;

    when State_Exit2IR =>
      if TMS='1' then
        w.state := State_UpdateIR;
      else
        w.state := State_ShiftIR;
      end if;

    when State_UpdateIR =>
      if TMS='1' then
        w.state := State_SelectDRScan;
      else
        w.state := State_RunTestIdle;
      end if;   

    when others =>
      w.state := State_TestLogicReset;

  end case;

  if falling_edge(TCK) then
    case r.state is
      when State_CaptureDR | State_ShiftDR =>
        TDO <= in_TDO_DR;
      when State_CaptureIR | State_ShiftIR =>
        TDO <= in_TDO_IR;
      when others =>
        TDO <= 'X';
    end case;
  end if;

  if rising_edge(TCK) then
    r <= w;
  end if;

end process;

  out_TCK <= TCK;
  out_TDI <= TDI;

  i_UPDATEDR <= '1' when r.state=State_UpdateDR else '0';
  i_CAPTUREDR <= '1' when r.state=State_CaptureDR else '0';
  i_SHIFTDR <= '1' when r.state=State_ShiftDR else '0';
  i_UPDATEIR <= '1' when r.state=State_UpdateIR else '0';
  i_CAPTUREIR <= '1' when r.state=State_CaptureIR else '0';
  i_SHIFTIR <= '1' when r.state=State_ShiftIR else '0';
  i_TLR<='1' when r.state=State_TestLogicReset else '0';

  out_UPDATEDR  <= transport i_UPDATEDR after 1 ns;
  out_CAPTUREDR <= transport i_CAPTUREDR after 1 ns;
  out_SHIFTDR   <= transport i_SHIFTDR after 1 ns;
  out_UPDATEIR  <= transport i_UPDATEIR after 1 ns;
  out_CAPTUREIR <= transport i_CAPTUREIR after 1 ns;
  out_SHIFTIR   <= transport i_SHIFTIR after 1 ns;
  out_TLR       <= transport i_TLR after 1 ns;

end behave;
