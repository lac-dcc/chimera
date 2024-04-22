library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use work.HostIoPckg.all;  -- Package for PC <=> FPGA communications.

entity pc_subtractor is
end entity;

architecture Behavioral of pc_subtractor is
  -- Connections between the shift-register module and the subtractor.
  signal toSub_s     : std_logic_vector(15 downto 0);  -- From PC to subtrctr.
  signal fromSub_s   : std_logic_vector(7 downto 0);   -- From subtrctr to PC.
  alias minuend_s is toSub_s(7 downto 0);  -- Subtrctr's 1st operand.
  alias subtrahend_s is toSub_s(15 downto 8);          -- Subtrctr's 2nd oprnd.
  alias difference_s is fromSub_s;      -- Subtractor's output.
  -- Connections between JTAG entry point and the shift-register module.
  signal inShiftDr_s : std_logic;       -- True when bits shift btwn PC & FPGA.
  signal drck_s      : std_logic;       -- Bit shift clock.
  signal tdi_s       : std_logic;       -- Bits from host PC to the subtractor.
  signal tdo_s       : std_logic;       -- Bits from subtractor to the host PC.
begin

  ---------------------------------------------------------------------------
  -- Application circuitry: the subtractor.
  ---------------------------------------------------------------------------
  
  difference_s <= minuend_s - subtrahend_s;

  ---------------------------------------------------------------------------
  -- JTAG entry point.
  ---------------------------------------------------------------------------

  -- Main entry point for the JTAG signals between the PC and the FPGA.
  UBscanToHostIo : BscanToHostIo
    port map (
      inShiftDr_o => inShiftDr_s,
      drck_o      => drck_s,
      tdi_o       => tdi_s,
      tdo_i       => tdo_s
      );

  ---------------------------------------------------------------------------
  -- Shift-register.
  ---------------------------------------------------------------------------

  -- Shift-register module between subtractor and JTAG entry point.
  UHostIoToSubtractor : HostIoToDut
    generic map (ID_G => "00000100")    -- The identifier used by the PC.
    port map (
      -- Connections to the BscanToHostIo JTAG entry-point module.
      inShiftDr_i     => inShiftDr_s,
      drck_i          => drck_s,
      tdi_i           => tdi_s,
      tdo_o           => tdo_s,
      -- Connections to the subtractor.
      vectorToDut_o   => toSub_s,  -- From PC to sbtrctr subtrahend & minuend.
      vectorFromDut_i => fromSub_s      -- From subtractor difference to PC.
      );

end architecture;
