library ieee;
use ieee.std_logic_1164.all;
-- use  IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.NUMERIC_STD.all;

entity vga_textmode is
  port(
    n_reset  : in std_logic;
    pixelClk : in std_logic;            -- pixel clock (50MHz)

    disp_enable : in std_logic;
    column      : in std_logic_vector(9 downto 0);
    row         : in std_logic_vector(9 downto 0);

    frame_start : in std_logic;
    row_start   : in std_logic;

    display_mem_addr : out std_logic_vector(11 downto 0);
    display_mem_data : in  std_logic_vector(7 downto 0);

    videoR : out std_logic_vector(3 downto 0);
    videoG : out std_logic_vector(3 downto 0);
    videoB : out std_logic_vector(3 downto 0)
    );
end vga_textmode;

architecture vga_textmode_arch of vga_textmode is
  signal ch_row : std_logic_vector(7 downto 0) := "00000000";
  signal ch_col : std_logic_vector(6 downto 0) := "0000000";

  signal glyph_row : std_logic_vector(3 downto 0) := "0000";

  signal ch_clock     : std_logic                     := '0';
  signal char_address : std_logic_vector(11 downto 0) := "000000000000";
  signal chardata_row : std_logic_vector(7 downto 0)  := "00110011";

  -- signal shifter : std_logic_vector(8 downto 0) := "001010101";
  signal shift_load : std_logic := '0';

  signal flash_flag        : std_logic := '0';
  signal cursor_flash_flag : std_logic := '0';
  signal jiffy_counter     : integer   := 0;

  signal chr : std_logic_vector(7 downto 0) := X"00";

  signal pix_counter : std_logic_vector(3 downto 0) := "0000";
  signal pix_clear   : std_logic                    := '0';
  signal pix_wrap    : std_logic                    := '0';

  signal line_wrap : std_logic := '0';

  signal displayClock : std_logic;

  -- signal v_row : std_logic_vector(9 downto 0);
  -- signal v_col : std_logic_vector(9 downto 0);

  signal pixel : std_logic := '0';

  signal attr_fg    : std_logic_vector(3 downto 0) := "1111";
  signal attr_bg    : std_logic_vector(3 downto 0) := "0000";  -- high bit will always be 0 (only 3 stored in display attr byte)
  signal attr_flash : std_logic                    := '0';

  signal next_attr_fg    : std_logic_vector(3 downto 0) := "1111";
  signal next_attr_bg    : std_logic_vector(3 downto 0) := "0000";  -- high bit will always be 0 (only 3 stored in display attr byte)
  signal next_attr_flash : std_logic                    := '0';

  signal selector_bg_in : std_logic_vector(5 downto 0);
  signal selector_fg_in : std_logic_vector(5 downto 0);

  signal display_mem_addr_tmp : std_logic_vector(15 downto 0);

  signal dispram_attrbyte  : std_logic_vector(7 downto 0);
  signal dispram_codepoint : std_logic_vector(7 downto 0);

  signal character_extend : std_logic;

begin

  font_rom_inst : entity work.font_rom
    port map(
      clock   => pixelClk,
      address => char_address,
      q       => chardata_row
      );

  pixcounter_inst : entity work.mod_m_counter
    generic map(N => 4, M => 8)
    port map(
      clock => pixelClk,
      clear => pix_clear,
      wrap  => pix_wrap,
      q     => pix_counter
      );

  chcounter_inst : entity work.mod_m_counter
    generic map(N => 7, M => 80)
    port map(
      clock => pix_wrap or row_start,
      clear => pix_clear,
      q     => ch_col,
      wrap  => line_wrap
      );

  shifter_inst : entity work.shiftreg
    port map(
      clock => pixelClk,
      load  => shift_load,
      input => chardata_row & (character_extend and chardata_row(0)),
      q     => pixel
      );

  palette_selector_inst : entity work.attr_selector
    port map(
      fg          => selector_fg_in,
      bg          => selector_bg_in,
      flashing    => next_attr_flash,
      clock       => pixelClk,
      flashclk    => flash_flag,
      load        => shift_load,
      disp_enable => disp_enable,
      outR        => videoR,
      outG        => videoG,
      outB        => videoB,
      input       => pixel
      );

  fg_palette_inst : entity work.COLOUR_ROM
    port map(
      A => next_attr_fg,
      D => selector_fg_in
      );


  bg_palette_inst : entity work.COLOUR_ROM
    port map(
      A => next_attr_bg,
      D => selector_bg_in
      );

  displayClock <= pixelClk and disp_enable;

  chr <= dispram_codepoint(7 downto 0);

  -- decide whether column 9 is blank, or extended from column 8
  character_extend <= '1' when chr(7 downto 4) = "1011" else
                      '1' when chr(7 downto 4) = "1101" else
                      '1' when chr(7 downto 4) = "1100" else
                      '0';

  next_attr_fg    <= dispram_attrbyte(3 downto 0);
  next_attr_bg    <= '0' & dispram_attrbyte(6 downto 4);
  next_attr_flash <= dispram_attrbyte(7);

  -- fetch the relevant row of font data
  char_address <= chr & glyph_row;
  -- ch_clock <= pix_counter(2); -- clocks every 4 pixels, sort of...
  pix_clear    <= frame_start or row_start;

  -- display_mem_addr <= ch_row(4 downto 0) & ch_col(5 downto 0);       
  display_mem_addr_tmp <= std_logic_vector(unsigned(ch_row) * 80 + unsigned(ch_col));

  -- set up the row signals at the start of each row
  process (row_start)
  begin
    if (rising_edge(row_start)) then
      ch_row(5 downto 0)    <= row(9 downto 4);
      glyph_row(3 downto 0) <= row(3 downto 0);
    end if;
  end process;

  -- load the shifter at the start of the new character
  process (pix_counter, pixelClk)
  begin
    if (pix_counter = "0000") then
      shift_load <= '1';
    else
      shift_load <= '0';
    end if;

    -- fetch the character
    if (pix_counter = "0001") then
      display_mem_addr <= display_mem_addr_tmp(10 downto 0) & '0';
    end if;

    if (pix_counter = "0010") then
      dispram_codepoint <= display_mem_data;
    end if;

    -- fetch the attributes     
    if (pix_counter = "0011") then
      display_mem_addr <= display_mem_addr_tmp(10 downto 0) & '1';
    end if;

    if (pix_counter = "0100") then
      dispram_attrbyte <= display_mem_data;
    end if;

  end process;

  process(frame_start)
  begin
    if(rising_edge(frame_start)) then

      jiffy_counter <= jiffy_counter + 1;

      if (jiffy_counter mod 32 = 0) then
        flash_flag <= not flash_flag;
      end if;

      if (jiffy_counter mod 24 = 0) then
        cursor_flash_flag <= not cursor_flash_flag;
      end if;

    end if;
  end process;

end vga_textmode_arch;
