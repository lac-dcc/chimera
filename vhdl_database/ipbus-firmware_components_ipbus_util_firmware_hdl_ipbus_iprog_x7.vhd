--======================================================================
-- Details about the ICAPE2 primitive itself can be found in UG953 and
-- UG470.
--======================================================================

library ieee;
use ieee.std_logic_1164.all;

library unisim;
use unisim.vcomponents.all;

use work.ipbus.all;
use work.ipbus_reg_types.all;

entity ipbus_iprog_x7 is
  port (
    clk : in std_logic;
    rst : in std_logic;
    ipb_in : in ipb_wbus;
    ipb_out : out ipb_rbus
  );
end ipbus_iprog_x7;

architecture rtl of ipbus_iprog_x7 is

  signal ctrl : ipb_reg_v(1 downto 0);

  signal d17, d17_d : std_logic;
  signal base_address : std_logic_vector(31 downto 0);
  signal trigger : std_logic;
  signal trigger_reboot : std_logic;
  signal request_reboot : std_logic;
  signal request_reboot_d : std_logic;

  signal icap_cs : std_logic;
  signal icap_rw : std_logic;
  signal icap_data : std_logic_vector(31 downto 0);

begin

  csr : entity work.ipbus_ctrlreg_v
    generic map (
      N_CTRL => 2,
      N_STAT => 0
    )
    port map (
      clk       => clk,
      reset     => rst,
      ipbus_in  => ipb_in,
      ipbus_out => ipb_out,
      q         => ctrl,
      d         => open
    );

  trigger <= ctrl(0)(0);
  base_address <= ctrl(1);

  clk_div: entity work.ipbus_clock_div
    port map (
      clk => clk,
      d17 => d17
    );

  -- Catch and then delay the reconfiguration trigger a bit. Just
  -- enough to nicely handle the IPbus reply and not make it look like
  -- a crash.
  trigger_catch : process(clk) is
  begin
    if rising_edge(clk) then
      if rst = '1' then
        request_reboot <= '0';
      else
        request_reboot <= request_reboot or trigger;
      end if;
    end if;
  end process;

  trigger_delay : process(clk) is
  begin
    if rising_edge(clk) then
      d17_d <= d17;
      if d17='1' and d17_d='0' then
        trigger_reboot <= request_reboot_d;
        request_reboot_d <= request_reboot;
      end if;
    end if;
  end process;

  -- The 'reconfigure FPGA' ICAP driver.
  icap_actor_iprog : entity work.icap_actor_iprog
    port map (
      clk => clk,
      rst => rst,
      base_address => base_address,
      reconfigure => trigger_reboot,

      icap_ready => '1',
      icap_cs => icap_cs,
      icap_rw => icap_rw,
      icap_data => icap_data
    );

  -- The ICAP primitive itself.
  icape2_inst : ICAPE2
    generic map (
      ICAP_WIDTH => "X32"
    )
    port map (
      clk => clk,
      csib => icap_cs,
      rdwrb => icap_rw,
      i => icap_data
    );

end rtl;

--======================================================================
