library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity keyboard is
  port (
    cpuclock    : in  std_logic;
    flopled     : in  std_logic;
    powerled    : in  std_logic;
    kio8        : out std_logic; -- clock to keyboard
    kio9        : out std_logic; -- data output to keyboard
    kio10       : in  std_logic; -- data input from keyboard
    up_out      : out std_logic := '1';
    left_out    : out std_logic := '1';
    delete_out  : out std_logic := '1';
    return_out  : out std_logic := '1';   -- Initial register value
    fastkey_out : out std_logic := '1'
  );
end entity keyboard;

architecture synthesis of keyboard is

  signal clock_divider : integer range 0 to 255 := 0;
  signal kbd_clock     : std_logic := '0';
  signal phase         : integer range 0 to 255 := 0;
  signal sync_pulse    : std_logic := '0';

  signal output_vector : std_logic_vector(127 downto 0);

  signal upkey         : std_logic := '1';
  signal leftkey       : std_logic := '1';
  signal deletekey     : std_logic := '1';
  signal returnkey     : std_logic := '1';
  signal fastkey       : std_logic := '1';

begin  -- behavioural

  process (cpuclock)
  begin
    if rising_edge(cpuclock) then
      ------------------------------------------------------------------------
      -- Read from MEGA65R2 keyboard
      ------------------------------------------------------------------------
      -- Process is to run a clock at a modest rate, and periodically send
      -- a sync pulse, and clock in the key states, while clocking out the
      -- LED states.

      up_out      <= upkey;
      left_out    <= leftkey;
      delete_out  <= deletekey;
      return_out  <= returnkey;
      fastkey_out <= fastkey;

      if clock_divider /= 64 then
        clock_divider <= clock_divider + 1;
      else
        clock_divider <= 0;

        kbd_clock <= not kbd_clock;
        kio8 <= kbd_clock or sync_pulse;

        if kbd_clock='1' and phase < 128 then
          -- Receive keys with dedicated lines
          if phase = 73 then
            upkey <= kio10;
          end if;
          if phase = 74 then
            leftkey <= kio10;
          end if;
          if phase = 76 then
            deletekey <= kio10;
          end if;
          if phase = 77 then
            returnkey <= kio10;
          end if;
          if phase = 78 then
            fastkey <= kio10;
          end if;
        end if;

        if kbd_clock='0' then
          report "phase = " & integer'image(phase) & ", sync=" & std_logic'image(sync_pulse);
          if phase /= 140 then
            phase <= phase + 1;
          else
            phase <= 0;
          end if;

          if phase = 127 then
            -- Reset to start
            sync_pulse <= '1';
            output_vector <= (others => '0');
            if flopled='1' then
              output_vector(23 downto 0) <= x"0000FF";
              output_vector(47 downto 24) <= x"0000FF";
            end if;
            if powerled='1' then
              output_vector(71 downto 48) <= x"00FF00";
              output_vector(95 downto 72) <= x"00FF00";
            end if;
          elsif phase = 140 then
            sync_pulse <= '0';
          elsif phase < 127 then
            -- Output next bit
            kio9 <= output_vector(127);
            output_vector(127 downto 1) <= output_vector(126 downto 0);
            output_vector(0) <= '0';
          end if;
        end if;
      end if;
    end if;
  end process;

end architecture synthesis;

