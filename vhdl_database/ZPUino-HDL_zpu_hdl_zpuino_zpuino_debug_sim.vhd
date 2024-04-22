library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

library work;
use work.zpu_config.all;
use work.zpupkg.all;
use work.zpuinopkg.all;
use work.zpuino_config.all;
use work.txt_util.all;

entity zpuino_debug_sim is
  port (
    jtag_data_chain_in: in std_logic_vector(97 downto 0);
    jtag_ctrl_chain_out: out std_logic_vector(10 downto 0)
  );
end entity;

architecture behave of zpuino_debug_sim is

  alias jtag_emureq: std_logic is jtag_ctrl_chain_out(0);
  alias jtag_inject: std_logic is jtag_ctrl_chain_out(1);
  alias jtag_step:   std_logic is jtag_ctrl_chain_out(2);
  alias jtag_opcode: std_logic_vector(7 downto 0) is jtag_ctrl_chain_out(10 downto 3);

  component tap is
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
    out_TLR:  out std_logic;
    in_TDO_IR:   in std_logic;
    in_TDO_DR:   in std_logic
  );
  end component tap;

  component jtagbb is
  port (
    TDI:  out std_logic;
    TMS:  out std_logic;
    TCK:  out std_logic;
    TDO:  in std_logic
  );
  end component jtagbb;


  subtype irtype is std_logic_vector(3 downto 0);
  signal ir, irs: irtype;

  constant BYPASS: irtype := "1111";
  constant IDCODE: irtype := "0001";
  constant DATACHAIN: irtype := "0100";
  constant CONTROLCHAIN: irtype := "0101";

  signal TDI,TDO,TMS,TCK,
  i_TCK,i_TDI,
  i_CAPTUREDR, i_SHIFTDR, i_UPDATEDR,
  i_CAPTUREIR, i_SHIFTIR, i_UPDATEIR,
  i_TLR,
  o_TDO_DR, o_TDO_IR: std_logic;

  constant our_idcode: std_logic_vector(31 downto 0) := x"deadbeef";

  -- Chains we support. Shift registers


  signal datachain_s: std_logic_vector(jtag_data_chain_in'high downto 0);
  signal controlchain_s: std_logic_vector(jtag_ctrl_chain_out'high downto 0);
  signal idcode_s: std_logic_vector(31 downto 0);

begin

  jtag: jtagbb
  port map (
    TDI => TDI,
    TDO => TDO,
    TMS => TMS,
    TCK => TCK
  );


  tap_inst: tap
  port map (
    TDI => TDI,
    TDO => TDO,
    TMS => TMS,
    TCK => TCK,

    out_TCK       => i_TCK,
    out_TDI       => i_TDI,
    out_CAPTUREIR => i_CAPTUREIR,
    out_UPDATEIR  => i_UPDATEIR,
    out_SHIFTIR   => i_SHIFTIR,
    out_CAPTUREDR => i_CAPTUREDR,
    out_UPDATEDR  => i_UPDATEDR,
    out_SHIFTDR   => i_SHIFTDR,
    out_TLR       => i_TLR,
    in_TDO_IR     => o_TDO_IR,
    in_TDO_DR     => o_TDO_DR
  );







  process(i_TCK, i_TLR)
  begin
    if i_TLR='1' then
      ir <= IDCODE;
    else
      if rising_edge(i_TCK) then
        if i_CAPTUREIR='1' then
          irs <= IDCODE;
       elsif i_UPDATEIR='1' then
        report "Update IR: " &str(irs) severity note;
        ir <= irs;
      elsif i_SHIFTIR='1' then
        irs(irs'high-1 downto 0)<= irs(irs'high downto 1);
        irs(irs'high) <= i_TDI;
      end if;
    end if;
    end if;
  end process;


  process(i_TCK)
  begin
    if rising_edge(i_TCK) then
      if ir=IDCODE then
        if i_CAPTUREDR='1' then
          report "Capture DR: chain " & str(ir) severity note;
          idcode_s <= our_idcode;
        elsif i_UPDATEDR='1' then
          report "Update DR: " &str(idcode_s) severity note;
        elsif i_SHIFTDR='1' then
          idcode_s(idcode_s'high-1 downto 0) <= idcode_s(idcode_s'high downto 1);
          idcode_s(idcode_s'high) <= i_TDI;
        end if;
      end if;
    end if;
  end process;


  process(i_TCK)
  begin
    if rising_edge(i_TCK) then
      if ir=DATACHAIN then
        if i_CAPTUREDR='1' then
          report "Capture DR: chain " & str(ir) & " gives " & str(jtag_data_chain_in) severity note;
          datachain_s <= jtag_data_chain_in;
        elsif i_UPDATEDR='1' then
          --report "Update DR: " &str(idcode_s) severity note;
          --dr <= idcode_s;
        elsif i_SHIFTDR='1' then
          datachain_s(datachain_s'high-1 downto 0) <= datachain_s(datachain_s'high downto 1);
          datachain_s(datachain_s'high) <= i_TDI;
        end if;
      end if;
    end if;
  end process;

  process(i_TCK)
  begin
    if rising_edge(i_TCK) then
      if ir=CONTROLCHAIN then
        if i_CAPTUREDR='1' then
          --controlchain_s <= (others =>'0'); --
          jtag_ctrl_chain_out(1) <= '0'; -- Reset INJECT on capture.
        elsif i_UPDATEDR='1' then
          jtag_ctrl_chain_out<=controlchain_s;
        elsif i_SHIFTDR='1' then
          controlchain_s(controlchain_s'high-1 downto 0) <= controlchain_s(controlchain_s'high downto 1);
          controlchain_s(controlchain_s'high) <= i_TDI;
        end if;
      end if;
    end if;
  end process;

  process(ir,idcode_s,datachain_s,controlchain_s)
  begin
    case ir is
      when IDCODE =>
        o_TDO_DR <= idcode_s(0);
      when DATACHAIN =>
        o_TDO_DR <= datachain_s(0);
      when CONTROLCHAIN =>
        o_TDO_DR <= controlchain_s(0);
      when others =>
    end case;
  end process;


end behave;
