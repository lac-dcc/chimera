-- secd_ram_controller.vhd
--
-- Multiplex the external 16 bit SRAM to the 32 bit interface required
-- by the CPU and provide for an 8 bit backside port for the 6809 to
-- read and write SECD memory

library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity secd_ram_controller is
  port(
    clk                 : in std_logic;
    reset               : in std_logic;

    secd_stopped        : in std_logic;

    -- Internal interface to SECD (16k x 32)
    din32               : in std_logic_vector(31 downto 0);
    dout32              : out std_logic_vector(31 downto 0);
    addr32              : in std_logic_vector(13 downto 0);
    read32_enable       : in std_logic;
    write32_enable      : in std_logic;
    busy                : out std_logic;

    -- Internal interface to 6809 (64k x 8)
    din8                : in std_logic_vector(7 downto 0);
    dout8               : out std_logic_vector(7 downto 0);
    addr8               : in std_logic_vector(15 downto 0);
    rw8                 : in std_logic;
    cs8                 : in std_logic;
    hold                : out std_logic;

    -- External interface
    ram_oen          : out std_logic;
    ram_cen          : out std_logic;
    ram_wen          : out std_logic;
    ram_io           : inout std_logic_vector(15 downto 0);
    ram_a            : out std_logic_vector(20 downto 0);
    ram_bhen         : out std_logic;
    ram_blen         : out std_logic
  );
end;

architecture external_ram of secd_ram_controller is

  type ram_out_mux_type is (ram_out_tristate, ram_out_din8, ram_out_din32_low, ram_out_din32_high);
  signal ram_out_mux : ram_out_mux_type := ram_out_tristate;

  type state_type is (idle, read32_low, read32_high, write32_low, write32_low_deselect, write32_high, write32_high_deselect, deselect);
  signal state, next_state : state_type;

  signal read32_buf : std_logic_vector(31 downto 0);

  signal oe8  : std_logic := '0';
  signal oe32 : std_logic := '0';

  signal write_pulse            : std_logic := '0';
  signal clear_write_pulse      : std_logic := '0';

begin

  secd_ram_controller : process(reset, state, secd_stopped, cs8, rw8,
                                read32_enable, write32_enable)

  begin

    ram_out_mux <= ram_out_tristate;

    if secd_stopped = '1' then

      if cs8 = '1' and rw8 = '0' then
        ram_out_mux <= ram_out_din8;
      end if;

    else

      oe32 <= '0';

      case state is

        when idle =>
          if read32_enable = '1' then
            oe32 <= '1';
            next_state <= read32_low;
          elsif write32_enable = '1' then
            next_state <= write32_low;
          end if;

        when read32_low =>
          oe32 <= '1';
          next_state <= read32_high;

        when read32_high =>
          oe32 <= '1';
          next_state <= deselect;

        when write32_low =>
          ram_out_mux <= ram_out_din32_low;
          next_state <= write32_low_deselect;

        when write32_low_deselect =>
          ram_out_mux <= ram_out_din32_low;
          next_state <= write32_high;

        when write32_high =>
          ram_out_mux <= ram_out_din32_high;
          next_state <= write32_high_deselect;

        when write32_high_deselect =>
          ram_out_mux <= ram_out_din32_high;
          next_state <= deselect;

        when deselect =>
          next_state <= idle;

      end case;
    end if;
  end process;

  mux_address : process(secd_stopped, addr8, addr32, state)
  begin
    if secd_stopped = '1' then
      ram_a(14 downto 0) <= addr8(15 downto 1);
      ram_blen <= not addr8(0);
      ram_bhen <= addr8(0);
    else
      ram_a(14 downto 1) <= addr32;
      if state = read32_high or state = write32_high or state = write32_high_deselect then
        ram_a(0) <= '1';
      else
        ram_a(0) <= '0';
      end if;
      ram_blen <= '0';
      ram_bhen <= '0';
    end if;
  end process;

  mux_controls : process(secd_stopped, cs8, state)
  begin
    if secd_stopped = '1' then
      ram_cen <= not cs8;
    else
      ram_cen <= '0';
    end if;
  end process;

  hold <= write_pulse and secd_stopped;
  ram_wen <= not write_pulse;

  set_write_pulse : process(state, clk, cs8, rw8, clear_write_pulse)
  begin
    if clear_write_pulse = '1' then
      write_pulse <= '0';
    elsif falling_edge(clk) then
      write_pulse <= '0';
      if secd_stopped = '1' then
        if cs8 = '1' and rw8 = '0' then
          write_pulse <= '1';
        end if;
      else
        if state = write32_high or state = write32_low then
          write_pulse <= '1';
        end if;
      end if;
    end if;
  end process;

  clear_write_pulse_process : process(clk, write_pulse)
  begin
    if rising_edge(clk) then
      if write_pulse = '1' then
        clear_write_pulse <= '1';
      else
        clear_write_pulse <= '0';
      end if;
    end if;
  end process;

  make_next_state : process(reset, clk, secd_stopped, rw8, din8)
  begin
    if reset = '1' then

      state <= idle;

    elsif rising_edge(clk) then

      state <= next_state;

    end if;
  end process;

  setup_ram_out_mux : process(ram_out_mux, din8, din32)
  begin
    case ram_out_mux is
      when ram_out_din8 =>
        ram_io(7 downto 0)  <= din8;
        ram_io(15 downto 8) <= din8;
      when ram_out_din32_high =>
        ram_io <= din32(31 downto 16);
      when ram_out_din32_low =>
        ram_io <= din32(15 downto 0);
      when ram_out_tristate =>
        ram_io <= (others => 'Z');
    end case;
  end process;

  read_ram : process(clk, state, secd_stopped, cs8, rw8, addr8, ram_io)
  begin
    if secd_stopped = '1' then
      if rw8 = '1' and cs8 = '1' then
        if addr8(0) = '0' then
          dout8 <= ram_io(7 downto 0);
        else
          dout8 <= ram_io(15 downto 8);
        end if;
      else
        dout8 <= (others => 'X');
      end if;
    elsif falling_edge(clk) then
      dout8 <= (others => 'X');
      if state = read32_low then
        read32_buf(15 downto 0) <= ram_io;
      elsif state = read32_high then
        read32_buf(31 downto 16) <= ram_io;
      end if;
    end if;
  end process;

  dout32 <= read32_buf;

  ram_a(20 downto 15) <= (others => '0');

  busy <= '0' when state = idle or state = deselect else '1';

  oe8 <= rw8 and cs8 and secd_stopped;
  ram_oen <= not (oe8 or oe32);

end;

