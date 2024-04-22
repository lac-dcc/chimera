-- Register description for
-- ASPIC - SPI controller for GRETA

library ieee;
use ieee.std_logic_1164.all;

package aspic_regs is

  constant CAP_OFFSET           : std_logic_vector(31 downto 0) := x"00000000";
  constant STATUS_OFFSET        : std_logic_vector(31 downto 0) := x"00000002";
  constant CTRL_OFFSET          : std_logic_vector(31 downto 0) := x"00000004";
  constant SCALER_OFFSET        : std_logic_vector(31 downto 0) := x"00000006";
  constant TXDATA_OFFSET        : std_logic_vector(31 downto 0) := x"00000008";
  constant RXDATA_OFFSET        : std_logic_vector(31 downto 0) := x"0000000a";

  -- Capability register
  type cap_reg is record
    -- DMA available (R)
    dma     : std_logic;
  end record;

  -- Status register
  type status_reg is record
    -- Transfer in progress (R)
    tip     : std_logic;
    -- Transfer complete (R, write '1' to clear)
    tc      : std_logic;
  end record;

  -- Control register
  type ctrl_reg is record
    -- Slave select (RW)
    ss      : std_logic;
    -- Transfer complete interrupt mask (RW)
    tcim    : std_logic;
  end record;

  -- SPI clock scaler register
  type scaler_reg is record
    -- Scaler reload value (RW)
    reload  : std_logic_vector(15 downto 0);
  end record;

  -- SPI transmit data register
  type txdata_reg is record
    -- Transmit data (RW)
    txdata  : std_logic_vector(15 downto 0);
  end record;

  -- SPI receive data register
  type rxdata_reg is record
    -- Receive data (R)
    rxdata  : std_logic_vector(15 downto 0);
  end record;

  -- Encode record to std_logic_vector.
  function encode(rec : cap_reg) return std_logic_vector;
  function encode(rec : status_reg) return std_logic_vector;
  function encode(rec : ctrl_reg) return std_logic_vector;
  function encode(rec : scaler_reg) return std_logic_vector;
  function encode(rec : txdata_reg) return std_logic_vector;
  function encode(rec : rxdata_reg) return std_logic_vector;

  -- Decode std_logic_vector to record.
  function decode(vec : std_logic_vector) return cap_reg;
  function decode(vec : std_logic_vector) return status_reg;
  function decode(vec : std_logic_vector) return ctrl_reg;
  function decode(vec : std_logic_vector) return scaler_reg;
  function decode(vec : std_logic_vector) return txdata_reg;
  function decode(vec : std_logic_vector) return rxdata_reg;

end;

package body aspic_regs is

  function decode(vec : std_logic_vector) return cap_reg is
    variable rec : cap_reg;
  begin
    rec.dma     := vec( 0);
    return rec;
  end;

  function decode(vec : std_logic_vector) return status_reg is
    variable rec : status_reg;
  begin
    rec.tip     := vec( 0);
    rec.tc      := vec( 1);
    return rec;
  end;

  function decode(vec : std_logic_vector) return ctrl_reg is
    variable rec : ctrl_reg;
  begin
    rec.ss      := vec( 0);
    rec.tcim    := vec( 1);
    return rec;
  end;

  function decode(vec : std_logic_vector) return scaler_reg is
    variable rec : scaler_reg;
  begin
    rec.reload  := vec(15 downto  0);
    return rec;
  end;

  function decode(vec : std_logic_vector) return txdata_reg is
    variable rec : txdata_reg;
  begin
    rec.txdata  := vec(15 downto  0);
    return rec;
  end;

  function decode(vec : std_logic_vector) return rxdata_reg is
    variable rec : rxdata_reg;
  begin
    rec.rxdata  := vec(15 downto  0);
    return rec;
  end;

  function encode(rec : cap_reg) return std_logic_vector is
    variable vec : std_logic_vector(15 downto 0) := (others => '0');
  begin
    vec( 0)           := rec.dma;
    return vec;
  end;

  function encode(rec : status_reg) return std_logic_vector is
    variable vec : std_logic_vector(15 downto 0) := (others => '0');
  begin
    vec( 0)           := rec.tip;
    vec( 1)           := rec.tc;
    return vec;
  end;

  function encode(rec : ctrl_reg) return std_logic_vector is
    variable vec : std_logic_vector(15 downto 0) := (others => '0');
  begin
    vec( 0)           := rec.ss;
    vec( 1)           := rec.tcim;
    return vec;
  end;

  function encode(rec : scaler_reg) return std_logic_vector is
    variable vec : std_logic_vector(15 downto 0) := (others => '0');
  begin
    vec(15 downto  0) := rec.reload;
    return vec;
  end;

  function encode(rec : txdata_reg) return std_logic_vector is
    variable vec : std_logic_vector(15 downto 0) := (others => '0');
  begin
    vec(15 downto  0) := rec.txdata;
    return vec;
  end;

  function encode(rec : rxdata_reg) return std_logic_vector is
    variable vec : std_logic_vector(15 downto 0) := (others => '0');
  begin
    vec(15 downto  0) := rec.rxdata;
    return vec;
  end;

end;

