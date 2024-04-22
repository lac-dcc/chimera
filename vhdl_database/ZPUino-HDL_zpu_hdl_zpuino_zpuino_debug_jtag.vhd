library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

library work;
use work.zpu_config.all;
use work.zpupkg.all;
use work.zpuinopkg.all;
use work.zpuino_config.all;

entity zpuino_debug_jtag is
  port (
    -- Connections to JTAG stuff

    TCKIR: in std_logic;
    TCKDR: in std_logic;
    TDI: in std_logic;
    CAPTUREIR: in std_logic;
    UPDATEIR:  in std_logic;
    SHIFTIR:  in std_logic;
    CAPTUREDR: in std_logic;
    UPDATEDR:  in std_logic;
    SHIFTDR:  in std_logic;
    TLR:  in std_logic;

    TDO_IR:   out std_logic;
    TDO_DR:   out std_logic;


    jtag_data_chain_in: in std_logic_vector(98 downto 0);
    jtag_ctrl_chain_out: out std_logic_vector(11 downto 0)
  );
end entity;

architecture behave of zpuino_debug_jtag is

  subtype irtype is std_logic_vector(3 downto 0);
  signal ir, irs: irtype;

  constant BYPASS:        irtype := "1111";
  constant IDCODE:        irtype := "0001";
  constant DATACHAIN:     irtype := "0100";
  constant CONTROLCHAIN:  irtype := "0101";

  constant our_idcode: std_logic_vector(31 downto 0) := x"deadbeef";

  -- Chains we support. Shift registers

  signal datachain_s: std_logic_vector(jtag_data_chain_in'high downto 0);
  signal controlchain_s: std_logic_vector(jtag_ctrl_chain_out'high downto 0);
  signal idcode_s: std_logic_vector(31 downto 0);

  -- TODO: add bypass chain

begin

  process(TCKIR, TLR)
  begin
    if TLR='1' then
      ir <= IDCODE;
    else
      if rising_edge(TCKIR) then
        if CAPTUREIR='1' then
          irs <= IDCODE;
       elsif UPDATEIR='1' then
        --report "Update IR: " &str(irs) severity note;
        ir <= irs;
      elsif SHIFTIR='1' then
        irs(irs'high-1 downto 0)<= irs(irs'high downto 1);
        irs(irs'high) <= TDI;
      end if;
    end if;
    end if;
  end process;

  TDO_IR <= irs(0);

  process(TCKDR)
  begin
    if rising_edge(TCKDR) then
      if ir=IDCODE then
        if CAPTUREDR='1' then
          --report "Capture DR: chain " & str(ir) severity note;
          idcode_s <= our_idcode;
        elsif UPDATEDR='1' then
          --report "Update DR: " &str(idcode_s) severity note;
        elsif SHIFTDR='1' then
          idcode_s(idcode_s'high-1 downto 0) <= idcode_s(idcode_s'high downto 1);
          idcode_s(idcode_s'high) <= TDI;
        end if;
      end if;
    end if;
  end process;


  process(TCKDR)
  begin
    if rising_edge(TCKDR) then
      if ir=DATACHAIN then
        if CAPTUREDR='1' then
          --report "Capture DR: chain " & str(ir) & " gives " & str(jtag_data_chain_in) severity note;
          datachain_s <= jtag_data_chain_in;
        --elsif UPDATEDR='1' then
        elsif SHIFTDR='1' then
          datachain_s(datachain_s'high-1 downto 0) <= datachain_s(datachain_s'high downto 1);
          datachain_s(datachain_s'high) <= TDI;
        end if;
      end if;
    end if;
  end process;

  process(TCKDR)
  begin
    if rising_edge(TCKDR) then
      if ir=CONTROLCHAIN then
        if CAPTUREDR='1' then
          --controlchain_s <= (others =>'0'); --
          jtag_ctrl_chain_out(1) <= '0'; -- Reset INJECT on capture.
        elsif UPDATEDR='1' then
          jtag_ctrl_chain_out<=controlchain_s;
        elsif SHIFTDR='1' then
          controlchain_s(controlchain_s'high-1 downto 0) <= controlchain_s(controlchain_s'high downto 1);
          controlchain_s(controlchain_s'high) <= TDI;
        end if;
      end if;
    end if;
  end process;

  process(ir,idcode_s,datachain_s,controlchain_s)
  begin
    case ir is
      when IDCODE =>
        TDO_DR <= idcode_s(0);
      when DATACHAIN =>
        TDO_DR <= datachain_s(0);
      when CONTROLCHAIN =>
        TDO_DR <= controlchain_s(0);
      when others =>
        TDO_DR <= DontCareValue;
    end case;
  end process;


end behave;
