library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use work.HostIoPckg.all;  -- Package for PC <=> FPGA communications.

entity pc_blinker is
  port (clk_i     : in  std_logic;
        blinker_o : out std_logic);
end entity;

architecture Behavioral of pc_blinker is
  signal cnt_r         : std_logic_vector(22 downto 0) := (others => '0');
  -- Connections between the shift-register module and the blinker.
  signal toBlinker_s   : std_logic_vector(0 downto 0);  -- From PC to blnkr.
  signal fromBlinker_s : std_logic_vector(0 downto 0);  -- From blnkr to PC.
  -- Connections between JTAG entry point and the shift-register module.
  signal inShiftDr_s   : std_logic;     -- True when bits shift btwn PC & FPGA.
  signal drck_s        : std_logic;     -- Bit shift clock.
  signal tdi_s         : std_logic;     -- Bits from host PC to the blinker.
  signal tdo_s         : std_logic;     -- Bits from blinker to the host PC.
begin

  -------------------------------------------------------------------------
  -- Application circuitry: the LED blinker.
  -------------------------------------------------------------------------

  -- This counter divides the input clock.
  process(clk_i) is
  begin
    if rising_edge(clk_i) then
      cnt_r <= cnt_r + 1;
    end if;
  end process;

  blinker_o <= cnt_r(22);               -- This counter bit blinks the LED.

  -------------------------------------------------------------------------
  -- JTAG entry point.
  -------------------------------------------------------------------------

  -- Main entry point for the JTAG signals between the PC and the FPGA.
  UBscanToHostIo : BscanToHostIo
    port map (
      inShiftDr_o => inShiftDr_s,
      drck_o      => drck_s,
      tdi_o       => tdi_s,
      tdo_i       => tdo_s
      );

  -------------------------------------------------------------------------
  -- Shift-register.
  -------------------------------------------------------------------------

  -- This is the shift-register module between blinker and JTAG entry point.
  UHostIoToBlinker : HostIoToDut
    generic map (ID_G => "00000001")    -- The identifier used by the PC.
    port map (
      -- Connections to the BscanToHostIo JTAG entry-point module.
      inShiftDr_i     => inShiftDr_s,
      drck_i          => drck_s,
      tdi_i           => tdi_s,
      tdo_o           => tdo_s,
      -- Connections to the blinker.
      vectorToDut_o   => toBlinker_s,   -- From PC to blinker (dummy sig).
      vectorFromDut_i => fromBlinker_s  -- From blinker to PC.
      );

  fromBlinker_s <= cnt_r(22 downto 22);  -- Blinker output to shift reg.
  
end architecture;
