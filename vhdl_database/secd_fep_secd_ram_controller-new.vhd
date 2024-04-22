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

    -- Internal interface to SECD (16k x 32)
    din32               : in std_logic_vector(31 downto 0);
    dout32              : out std_logic_vector(31 downto 0);
    addr32              : in std_logic_vector(13 downto 0);
    read32_enable       : in std_logic;
    write32_enable      : in std_logic;
    busy8               : out std_logic;

    -- Internal interface to 6809

    -- Access to SECD ram is through a set of registers that contain the
    -- decoded SECD memory word.  Upon write, the fields are packed according
    -- to the type field.  Upon read, the memory word is decoded into the
    -- registers for the 6809 to read byte wise.

    -- The SECD should be stopped when the 6809 accesses the memory.
    -- Otherwise, the behavior is undefined. 

    --  0: command - 0 to read, 1 to write
    --  1: address low
    --  2: address low
    --  3: type
    --  4: literal byte 0 (lsb)
    --  5: literal byte 1
    --  6: literal byte 2
    --  7: literal byte 3 (msb)
    --  8: cdr lsb
    --  9: cdr msb
    -- 10: car lsb
    -- 11: cdr lsb

    din8                : in std_logic_vector(7 downto 0);
    dout8               : out std_logic_vector(7 downto 0);
    addr8               : in std_logic_vector(3 downto 0);
    cs8			: in std_logic;
    wen8		: in std_logic;

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

  type state is (idle,
                 read32_high, read32_low, write32_high, write32_low,
                 wait_deselect);
  signal current_state, next_state: state;

  signal selected: std_logic;

begin

  ram_access : process(reset, clk,
                       read32_enable, write32_enable, din32,
                       din8,
                       ram_io,
                       selected)
  begin
    if reset = '1' then
      ram_cen <= '1';
      ram_oen <= '1';
      ram_wen <= '1';
      ram_a <= (others => '0');
      ram_io <= (others => 'Z');
      busy8 <= '0';
      busy32 <= '0';
      next_state <= idle;

    elsif rising_edge(clk) then

      case current_state is

      when idle =>

        busy8 <= '0';
        busy32 <= '0';
        ram_cen <= '1';
        ram_oen <= '1';
        ram_wen <= '1';
        ram_blen <= '1';
        ram_bhen <= '1';
        ram_io <= (others => 'Z');
        ram_a(1 downto 0) <= "00";

        elsif read32_enable = '1' then
          ram_a(14 downto 1) <= addr32;
          ram_blen <= '0';
          ram_bhen <= '0';
          ram_cen <= '0';
          ram_oen <= '0';
          busy32 <= '1';
          next_state <= read32_high;

        elsif write32_enable = '1' then
          ram_a(14 downto 1) <= addr32;
          ram_blen <= '0';
          ram_bhen <= '0';
          ram_cen <= '0';
          ram_wen <= '0';
          ram_io(15 downto 0) <= din32(31 downto 16);
          busy32 <= '1';
          next_state <= write32_high;
        end if;

      when read8 =>
        if addr8(0) = '0' then
          dout8 <= ram_io(7 downto 0);
        else
          dout8 <= ram_io(15 downto 8);
        end if;
        if selected = '1' then
          next_state <= wait_deselect;
        else
          next_state <= idle;
        end if;

      when write8 =>
        ram_wen <= '0';
        if selected = '1' then
          next_state <= wait_deselect;
        else
          next_state <= idle;
        end if;

      when read32_high =>
        dout32(31 downto 16) <= ram_io;
        ram_a(0) <= '1';
        next_state <= read32_low;

      when read32_low =>
        dout32(15 downto 0) <= ram_io;
        if selected = '1' then
          next_state <= wait_deselect;
        else
          next_state <= idle;
        end if;

      when write32_high =>
        ram_wen <= '1';
        ram_a(0) <= '1';
        ram_io(15 downto 0) <= din32(31 downto 16);
        next_state <= write32_low;

      when write32_low =>
        ram_wen <= '0';
        ram_io(15 downto 0) <= din32(15 downto 0);
        if selected = '1' then
          next_state <= wait_deselect;
        else
          next_state <= idle;
        end if;

      when wait_deselect =>
        if selected = '0' then
          next_state <= idle;
        end if;
      end case;
    end if;
  end process;

  generate_selected : process(read8_enable, write8_enable, read32_enable, write32_enable)
  begin
    if read8_enable = '1' or write8_enable = '1' or read32_enable = '1' or write32_enable = '1' then
      selected <= '1';
    else
      selected <= '0';
    end if;
  end process;

  process_next_state : process(clk, reset, next_state)
  begin
    if reset = '1' then
      current_state <= idle;
    else
      current_state <= next_state;
    end if;
  end process;
end;

