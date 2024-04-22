library ieee;
use ieee.std_logic_1164.all;

entity joystick_decoder is
  port(
    clk         : in  std_ulogic;
    rst         : in  std_ulogic;
    rx          : in  std_ulogic;
    tx          : out std_ulogic;
    torque      : out std_ulogic_vector(7 downto 0);
    torque_sign : out std_ulogic;
    enable      : out std_ulogic);
end joystick_decoder;

architecture syn of joystick_decoder is
  component can_rx is
    port (
      clk   : in  std_ulogic;
      rst   : in  std_ulogic;
      rx    : in  std_ulogic;
      tx    : out std_ulogic;
      debug : out std_ulogic;
      msg   : out work.can.message;
      ready : out std_ulogic);
  end component can_rx;

  signal msg   : work.can.message;
  signal ready : std_ulogic;

begin
  rx_obj : can_rx port map (clk => clk, rst => rst, rx => rx, ready => ready, msg => msg, tx => tx);

  process(clk, rst)
  begin
    if rst = '1' then
      -- Reset stuff
      torque      <= (others => '0');
      torque_sign <= '0';
      enable      <= '0';
    elsif rising_edge(clk) then
      -- Recv message on ready
      -- enable <= ready;
      if ready = '1' and msg.id = b"00000000001" and msg.len = b"0011" then
        -- Decode msg from the joystick
        torque <= msg.dat(63 downto 56);

        if msg.dat(55 downto 48) = b"00000001" then
          torque_sign <= '1';
        else
          torque_sign <= '0';
        end if;
        if msg.dat(47 downto 40) = b"00000001" then
          enable <= '1';
        else
          enable <= '0';
        end if;
      end if;
    end if;
  end process;

end syn;
