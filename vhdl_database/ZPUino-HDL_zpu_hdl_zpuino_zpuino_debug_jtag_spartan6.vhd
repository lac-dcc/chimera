library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

library work;
use work.zpu_config.all;
use work.zpupkg.all;
use work.zpuinopkg.all;
use work.zpuino_config.all;

entity zpuino_debug_jtag_spartan6 is
  port (
    jtag_data_chain_in: in std_logic_vector(98 downto 0);
    jtag_ctrl_chain_out: out std_logic_vector(11 downto 0)
  );
end entity;

architecture behave of zpuino_debug_jtag_spartan6 is

  component zpuino_debug_jtag is
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
  end component;

  component zpuino_debug_spartan6 is
  port (
    TCKIR: out std_logic;
    TCKDR: out std_logic;
    TDI: out std_logic;
    CAPTUREIR: out std_logic;
    UPDATEIR:  out std_logic;
    SHIFTIR:  out std_logic;
    CAPTUREDR: out std_logic;
    UPDATEDR:  out std_logic;
    SHIFTDR:  out std_logic;
    TLR:  out std_logic;

    TDO_IR:   in std_logic;
    TDO_DR:   in std_logic
  );
  end component;

  signal TCKIR,
    TCKDR,
    TDI,
    CAPTUREIR,
    UPDATEIR,
    SHIFTIR,
    CAPTUREDR,
    UPDATEDR,
    SHIFTDR,
    TLR,
    TDO_IR,
    TDO_DR:   std_logic;

begin

  jtag: zpuino_debug_jtag
  port map (
    TCKIR       => TCKIR,
    TCKDR       => TCKDR,
    TDI         => TDI,
    CAPTUREIR   => CAPTUREIR,
    UPDATEIR    => UPDATEIR,
    SHIFTIR     => SHIFTIR,
    CAPTUREDR   => CAPTUREDR,
    UPDATEDR    => UPDATEDR,
    SHIFTDR     => SHIFTDR,
    TLR         => TLR,
    TDO_IR      => TDO_IR,
    TDO_DR      => TDO_DR,

    jtag_data_chain_in  => jtag_data_chain_in,
    jtag_ctrl_chain_out => jtag_ctrl_chain_out
  );

  dbg: zpuino_debug_spartan6
  port map (
    TCKIR       => TCKIR,
    TCKDR       => TCKDR,
    TDI         => TDI,
    CAPTUREIR   => CAPTUREIR,
    UPDATEIR    => UPDATEIR,
    SHIFTIR     => SHIFTIR,
    CAPTUREDR   => CAPTUREDR,
    UPDATEDR    => UPDATEDR,
    SHIFTDR     => SHIFTDR,
    TLR         => TLR,
    TDO_IR      => TDO_IR,
    TDO_DR      => TDO_DR
  );


end behave;
