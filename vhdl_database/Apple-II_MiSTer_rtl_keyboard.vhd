-------------------------------------------------------------------------------
--
-- PS/2 Keyboard interface for the Apple //e
-- Szombathelyi György
--
-- Based on
-- PS/2 Keyboard interface for the Apple ][
--
-- Stephen A. Edwards, sedwards@cs.columbia.edu
-- After an original by Alex Freed
--
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity keyboard is

  port (
    CLK_14M  : in std_logic;
    PS2_Key  : in std_logic_vector(10 downto 0);  -- From PS/2 port
    reads    : in std_logic;            -- Read strobe
    reset    : in std_logic;
    akd      : buffer std_logic;        -- Any key down
    K        : out unsigned(7 downto 0); -- Latched, decoded keyboard data
    open_apple:out std_logic;
    closed_apple:out std_logic;
    soft_reset:out std_logic := '0'
    );
end keyboard;

architecture rtl of keyboard is

  signal rom_addr           : std_logic_vector(10 downto 0);
  signal rom_out            : unsigned(7 downto 0);
  signal junction_code      : std_logic_vector(7 downto 0);
  signal code, latched_code : unsigned(7 downto 0);
  signal ext, latched_ext   : std_logic;

  signal key_pressed        : std_logic;  -- Key pressed & not read
  signal ctrl,shift,caplock : std_logic;
  signal old_stb            : std_logic;
  signal rep_timer          : unsigned(22 downto 0);

  -- Special PS/2 keyboard codes
  constant LEFT_SHIFT       : unsigned(7 downto 0) := X"12";
  constant RIGHT_SHIFT      : unsigned(7 downto 0) := X"59";
  constant LEFT_CTRL        : unsigned(7 downto 0) := X"14";
  constant CAPS_LOCK        : unsigned(7 downto 0) := X"58";
  constant WINDOWS          : unsigned(7 downto 0) := X"1F";
  constant ALT              : unsigned(7 downto 0) := X"11";
  constant F2               : unsigned(7 downto 0) := X"06";

  type states is (IDLE,
                  HAVE_CODE,
                  DECODE,
                  GOT_KEY_UP_CODE,
                  GOT_KEY_UP2,
                  KEY_UP,
                  NORMAL_KEY,
                  KEY_READY1,
                  KEY_READY
                  );

  signal state, next_state : states;

begin


  keyboard_rom : work.spram
  generic map (11,8,"rtl/roms/keyboard.mif")
  port map (
   address => std_logic_vector(rom_addr),
   clock => CLK_14M,
   data => (others=>'0'),
   wren => '0',
   unsigned(q) => rom_out);

  K <= key_pressed & rom_out(6 downto 0);

  caplock_ctrl : process (CLK_14M, reset)
  begin
    if reset = '1' then
      caplock <= '0';
    elsif rising_edge(CLK_14M) then
      if state = KEY_UP and code = CAPS_LOCK then
        caplock <= not caplock;
      end if;
    end if;
  end process;

  shift_ctrl : process (CLK_14M, reset)
  begin
    if reset = '1' then
      shift <= '0';
      ctrl <= '0';
      --open_apple<='0';
      --closed_apple<='0';
		soft_reset<='0';
    elsif rising_edge(CLK_14M) then
     if state = HAVE_CODE then
        if code = LEFT_SHIFT or code = RIGHT_SHIFT then
          shift <= '1';
        elsif code = LEFT_CTRL then
          ctrl <= '1';
        elsif code = WINDOWS then
          open_apple <= '1';
        elsif code = ALT then
          closed_apple <= '1';
        elsif code = F2 then
		    soft_reset <= '1';
          --reset_key <= '1';
        end if;
      elsif state = KEY_UP then
        if code = LEFT_SHIFT or code = RIGHT_SHIFT then
          shift <= '0';
        elsif code = LEFT_CTRL then
          ctrl <= '0';
        elsif code = WINDOWS then
          open_apple <= '0';
        elsif code = ALT then
          closed_apple <= '0';
        elsif code = F2 then
          --reset_key <= '0';
			 soft_reset <= '0';
        end if;
      end if;
    end if;
  end process shift_ctrl;

  code <= unsigned(ps2_key(7 downto 0));
  ext <= ps2_key(8);

  fsm : process (CLK_14M, reset)
  begin
    if reset = '1' then
      state <= IDLE;
      latched_code <= (others => '0');
      latched_ext <= '0';
      key_pressed <= '0';
    elsif rising_edge(CLK_14M) then
      state <= next_state;
      if reads = '1' then key_pressed <= '0'; end if;
      if state = HAVE_CODE then
        old_stb <= ps2_key(10);
      end if;
      if state = GOT_KEY_UP_CODE then
        akd <= '0';
      end if;
      if state = NORMAL_KEY then
        -- set up keyboard ROM read address
        latched_code <= code ;
        latched_ext <= ext;
      end if;
      if state = KEY_READY and junction_code /= x"FF" then
        -- key code ready from ROM
         akd <= '1';
         key_pressed <= '1';
         rep_timer <= to_unsigned(7000000, 23); -- 0.5s
      end if;
      if akd = '1' then
         rep_timer <= rep_timer - 1;
         if rep_timer = 0 then
            rep_timer <= to_unsigned(933333, 23); -- 1/15s
            key_pressed <= '1';
         end if;
      end if;
    end if;
  end process fsm;

  fsm_next_state : process (code, old_stb, ps2_key, state)
  begin
    next_state <= state;
    case state is
      when IDLE =>
        if old_stb /= ps2_key(10) then next_state <= HAVE_CODE; end if;

      when HAVE_CODE =>
        next_state <= DECODE;

      when DECODE =>
        if ps2_key(9) = '0' then
          next_state <= GOT_KEY_UP_CODE;
        elsif code = LEFT_SHIFT or code = RIGHT_SHIFT or code = LEFT_CTRL or code = CAPS_LOCK then
          next_state <= IDLE;
        else
          next_state <= NORMAL_KEY;
        end if;

      when GOT_KEY_UP_CODE =>
        next_state <= GOT_KEY_UP2;

      when GOT_KEY_UP2 =>
        next_state <= KEY_UP;

      when KEY_UP =>
        next_state <= IDLE;

      when NORMAL_KEY =>
        next_state <= KEY_READY1;

      when KEY_READY1 =>
        next_state <= KEY_READY;

      when KEY_READY =>
        next_state <= IDLE;
    end case;
  end process fsm_next_state;

  -- PS/2 scancode to Keyboard ROM address translation
  rom_addr <= '0' & caplock & junction_code(6 downto 0) & not ctrl & not shift;

  with latched_ext & latched_code select
    junction_code <=
     X"00" when '0'&X"76", -- Escape ("esc" key)
     X"01" when '0'&X"16", -- 1
     X"02" when '0'&X"1e", -- 2
     X"03" when '0'&X"26", -- 3
     X"04" when '0'&X"25", -- 4
     X"05" when '0'&X"36", -- 6
     X"06" when '0'&X"2e", -- 5
     X"07" when '0'&X"3d", -- 7
     X"08" when '0'&X"3e", -- 8
     X"09" when '0'&X"46", -- 9

     X"0A" when '0'&X"0d", -- Horizontal Tab
     X"0B" when '0'&X"15", -- Q
     X"0C" when '0'&X"1d", -- W
     X"0D" when '0'&X"24", -- E
     X"0E" when '0'&X"2d", -- R
     X"0F" when '0'&X"35", -- Y
     X"10" when '0'&X"2c", -- T
     X"11" when '0'&X"3c", -- U
     X"12" when '0'&X"43", -- I
     X"13" when '0'&X"44", -- O

     X"14" when '0'&X"1c", -- A
     X"15" when '0'&X"23", -- D
     X"16" when '0'&X"1b", -- S
     X"17" when '0'&X"33", -- H
     X"18" when '0'&X"2b", -- F
     X"19" when '0'&X"34", -- G
     X"1A" when '0'&X"3b", -- J
     X"1B" when '0'&X"42", -- K
     X"1C" when '0'&X"4c", -- ;
     X"1D" when '0'&X"4b", -- L

     X"1E" when '0'&X"1a", -- Z
     X"1F" when '0'&X"22", -- X
     X"20" when '0'&X"21", -- C
     X"21" when '0'&X"2a", -- V
     X"22" when '0'&X"32", -- B
     X"23" when '0'&X"31", -- N
     X"24" when '0'&X"3a", -- M
     X"25" when '0'&X"41", -- ,
     X"26" when '0'&X"49", -- .
     X"27" when '0'&X"4a", -- /

     x"28" when '1'&x"4a", -- KP /
--     X"29" when '1'&x"6b", -- KP Left
     X"2A" when '0'&x"70", -- KP 0
     X"2B" when '0'&x"69", -- KP 1
     X"2C" when '0'&x"72", -- KP 2
     X"2D" when '0'&x"7a", -- KP 3
     X"2E" when '0'&X"5d", -- \
     X"2F" when '0'&X"55", -- =
     X"30" when '0'&X"45", -- 0
     X"31" when '0'&X"4e", -- -

--     x"32" when x"", -- KP )
--     X"33" when X"76", -- KP Escape ("esc" key)
     X"34" when '0'&x"6B", -- KP 4
     X"35" when '0'&x"73", -- KP 5
     X"36" when '0'&x"74", -- KP 6
     X"37" when '0'&x"6C", -- KP 7
     X"38" when '0'&X"0e", -- `
     X"39" when '0'&X"4d", -- P
     X"3A" when '0'&X"54", -- [
     X"3B" when '0'&X"5b", -- ]

     X"3C" when '0'&X"7c", -- KP *
--     X"3D" when '1'&X"74", -- KP Right
     X"3E" when '0'&X"75", -- KP 8
     X"3F" when '0'&X"7D", -- KP 9
     X"40" when '0'&X"71", -- KP .
     X"41" when '0'&X"79", -- KP +
     X"42" when '0'&X"5a", -- Carriage return ("enter" key)
     X"43" when '1'&X"75", -- (up arrow)
     X"44" when '0'&X"29", -- Space
     X"45" when '0'&X"52", -- '

--     X"46" when X"4a", -- ?
--     X"47" when X"29", -- KP Space
--     X"48" when x"", -- KP (
     X"49" when '0'&X"7b", -- KP -
     X"4A" when '1'&X"5a", -- KP return
--     X"4B" when X"", -- KP ,
     X"4E" when '0'&X"66", -- KP del (backspace - mapped to left)
     X"4D" when '1'&X"72", -- down arrow
     X"4E" when '1'&X"6b", -- left arrow
     X"4F" when '1'&X"74", -- right arrow

     X"FF" when others;

end rtl;
