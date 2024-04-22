library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use work.HostIoPckg.all;  -- Package for PC <=> FPGA communications.

entity pc_blink_sub is
  port (clk_i     : in  std_logic;
        blinker_o : out std_logic);
end entity;

architecture Behavioral of pc_blink_sub is
  signal cnt_r         : std_logic_vector(22 downto 0) := (others => '0');
  -- Connections between first shift-register module and the blinker.
  signal toBlinker_s   : std_logic_vector(0 downto 0);  -- From PC to blnkr.
  signal fromBlinker_s : std_logic_vector(0 downto 0);  -- From blnkr to PC.
  -- Connections between second shift-register module and the subtractor.
  signal toSub_s     : std_logic_vector(15 downto 0);  -- From PC to subtrctr.
  signal fromSub_s   : std_logic_vector(7 downto 0);   -- From subtrctr to PC.
  alias minuend_s is toSub_s(7 downto 0);  -- Subtrctr's 1st operand.
  alias subtrahend_s is toSub_s(15 downto 8);          -- Subtrctr's 2nd oprnd.
  alias difference_s is fromSub_s;      -- Subtractor's output.
  -- Connections between JTAG entry point and the shift-register modules.
  signal inShiftDr_s   : std_logic;     -- True when bits shift btwn PC & FPGA.
  signal drck_s        : std_logic;     -- Bit shift clock.
  signal tdi_s         : std_logic;     -- Bits from host PC to blnkr/subtrctr.
  signal tdo_s         : std_logic;     -- Bits from blnkr/subtrctr to host PC.
  signal tdoBlinker_s  : std_logic;  -- Bits from the blinker to the host PC.
  signal tdoSub_s      : std_logic;  -- Bits from the sbtrctr to the host PC.
begin

  -------------------------------------------------------------------------------
  -- Application circuitry
  -------------------------------------------------------------------------------

  -- This counter divides the input clock.
  process(clk_i) is
  begin
    if rising_edge(clk_i) then
      cnt_r <= cnt_r + 1;
    end if;
  end process;

  blinker_o <= cnt_r(22);               -- This counter bit blinks the LED.

  -- This is the subtractor.
  difference_s <= minuend_s - subtrahend_s;

  -------------------------------------------------------------------------------
  -- JTAG entry point.
  -------------------------------------------------------------------------------

  -- Main entry point for the JTAG signals between the PC and the FPGA.
  UBscanToHostIo : BscanToHostIo
    port map (
      inShiftDr_o => inShiftDr_s,
      drck_o      => drck_s,
      tdi_o       => tdi_s,
      tdo_i       => tdo_s
      );

  -- OR the bits from both shift-registers and send them back to the PC.
  -- (Non-selected modules pull their TDO outputs low, so only bits from 
  -- the active module are transferred.)
  tdo_s <= tdoBlinker_s or tdoSub_s;

  -------------------------------------------------------------------------------
  -- Shift-registers.
  -------------------------------------------------------------------------------

  -- Shift-register module between blinker and JTAG entry point.
  UHostIoToBlinker : HostIoToDut
    generic map (ID_G => "00000001")    -- The identifier used by the PC.
    port map (
      -- Connections to the BscanToHostIo JTAG entry-point module.
      inShiftDr_i     => inShiftDr_s,
      drck_i          => drck_s,
      tdi_i           => tdi_s,
      tdo_o           => tdoBlinker_s, -- Serial bits from blinker output.
      -- Connections to the blinker.
      vectorToDut_o   => toBlinker_s,   -- From PC to blinker (dummy sig).
      vectorFromDut_i => fromBlinker_s  -- From blinker to PC.
      );

  fromBlinker_s <= cnt_r(22 downto 22);  -- Blinker output to shift reg.

  -- Shift-register module between subtractor and JTAG entry point.
  UHostIoToSubtractor : HostIoToDut
    generic map (ID_G => "00000100")    -- The identifier used by the PC.
    port map (
      -- Connections to the BscanToHostIo JTAG entry-point module.
      inShiftDr_i     => inShiftDr_s,
      drck_i          => drck_s,
      tdi_i           => tdi_s,
      tdo_o           => tdoSub_s, -- Serial bits from subtractor result.
      -- Connections to the subtractor.
      vectorToDut_o   => toSub_s,  -- From PC to sbtrctr subtrahend & minuend.
      vectorFromDut_i => fromSub_s      -- From subtractor difference to PC.
      );

end architecture;

