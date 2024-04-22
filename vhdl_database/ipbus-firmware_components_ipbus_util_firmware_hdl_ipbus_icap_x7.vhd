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

entity ipbus_icap_x7 is
  port (
    clk : in std_logic;
    rst : in std_logic;
    ipb_in : in ipb_wbus;
    ipb_out : out ipb_rbus
  );
end ipbus_icap_x7;

architecture rtl of ipbus_icap_x7 is

  constant C_ACCESS_MODE_READ : std_logic_vector(1 downto 0) := "00";
  constant C_ACCESS_MODE_WRITE : std_logic_vector(1 downto 0) := "01";
  constant C_ACCESS_MODE_REBOOT : std_logic_vector(1 downto 0) := "10";

  signal ctrl : ipb_reg_v(2 downto 0);
  signal stat : ipb_reg_v(1 downto 0);

  signal d17, d17_d : std_logic;
  signal access_mode : std_logic_vector(1 downto 0);
  signal register_address : std_logic_vector(31 downto 0);
  signal trigger : std_logic;
  signal trigger_reboot : std_logic;
  signal request_reboot : std_logic;
  signal request_reboot_d : std_logic;
  signal access_strobe : std_logic;
  signal icap_user_data_in : std_logic_vector(31 downto 0);
  signal icap_user_data_out : std_logic_vector(31 downto 0);
  signal icap_user_data_out_valid : std_logic;

  signal icap_cs : std_logic;
  signal icap_cs_icap : std_logic;
  signal icap_cs_iprog : std_logic;
  signal icap_rw : std_logic;
  signal icap_rw_icap : std_logic;
  signal icap_rw_iprog : std_logic;
  signal icap_data_i : std_logic_vector(31 downto 0);
  signal icap_data_i_icap : std_logic_vector(31 downto 0);
  signal icap_data_i_iprog : std_logic_vector(31 downto 0);
  signal icap_data_o : std_logic_vector(31 downto 0);
  signal icap_data_o_icap : std_logic_vector(31 downto 0);

begin

  csr : entity work.ipbus_ctrlreg_v
    generic map (
      N_CTRL => 3,
      N_STAT => 2
    )
    port map (
      clk       => clk,
      reset     => rst,
      ipbus_in  => ipb_in,
      ipbus_out => ipb_out,
      q         => ctrl,
      d         => stat
    );

  access_mode <= ctrl(0)(1 downto 0);
  trigger <= ctrl(0)(2);
  register_address <= ctrl(1);
  icap_user_data_in <= ctrl(2);
  stat(0) <= icap_user_data_out;
  stat(1)(0) <= icap_user_data_out_valid;

  -- Make sure the trigger is a proper strobe.
  pulser : entity work.edge_detector
    port map (
      clk => clk,
      rst => rst,
      signal_in => trigger,
      pulse_out => access_strobe
    );

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
        if access_mode = C_ACCESS_MODE_REBOOT then
          request_reboot <= request_reboot or access_strobe;
        else
          request_reboot <= request_reboot;
        end if;
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
      base_address => register_address,
      reconfigure => trigger_reboot,

      icap_ready => '1',
      icap_cs => icap_cs_iprog,
      icap_rw => icap_rw_iprog,
      icap_data => icap_data_i_iprog
    );

  -- The 'access register' ICAP driver.
  icap_actor_access_register : entity work.icap_actor_access_register
    port map (
      clk => clk,
      rst => rst,
      register_address => register_address,
      access_mode => access_mode(0),
      strobe => access_strobe,
      data_in => icap_user_data_in,
      data_out => icap_user_data_out,
      data_out_valid => icap_user_data_out_valid,

      icap_ready => '1',
      icap_cs => icap_cs_icap,
      icap_rw => icap_rw_icap,
      icap_data_w => icap_data_i_icap,
      icap_data_r => icap_data_o_icap
    );

  -- The ICAP primitive itself.
  icape_inst : ICAPE2
    generic map (
      ICAP_WIDTH => "X32"
    )
    port map (
      clk => clk,
      csib => icap_cs,
      rdwrb => icap_rw,
      i => icap_data_i,
      o => icap_data_o
    );

  -- The 'ICAP MUX'.
  icap_cs <= icap_cs_iprog when access_mode = C_ACCESS_MODE_REBOOT
             else icap_cs_icap;
  icap_rw <= icap_rw_iprog when access_mode = C_ACCESS_MODE_REBOOT
             else icap_rw_icap;
  icap_data_i <= icap_data_i_iprog when access_mode = C_ACCESS_MODE_REBOOT
                 else icap_data_i_icap;
  icap_data_o_icap <= icap_data_o when access_mode /= C_ACCESS_MODE_REBOOT
                      else (others => '0');

end rtl;

--======================================================================
