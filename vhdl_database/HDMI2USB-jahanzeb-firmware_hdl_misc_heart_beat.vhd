library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

entity heart_beater is
  generic(HB_length     : integer := 5;  --length of the heart beat in pixels       
          HB_width      : integer := 5;  --width of the heart beat in pixels
          alt_aft_frame : integer := 3  --alternate color after this many frames (max value 31)
          );
  port
    (
      clk    : in  std_logic;
      rst    : in  std_logic;
      HB_on  : in  std_logic;
      HB_sw  : in  std_logic;
      din    : in  std_logic_vector(23 downto 0);
      wr_en  : in  std_logic;
      vsync  : in  std_logic;
      pclk_i : in  std_logic;
      resX   : in  std_logic_vector(15 downto 0);
      resY   : in  std_logic_vector(15 downto 0);
      dout   : out std_logic_vector(23 downto 0)

      );
end heart_beater;

architecture Behavioral of heart_beater is
  signal pixel_cnt         : unsigned(15 downto 0) := (others => '0');
  signal line_cnt          : unsigned(15 downto 0) := (others => '0');
  signal frame_cnt         : unsigned(4 downto 0)  := (others => '0');
  signal HB_color          : std_logic_vector(23 downto 0);  --Heart beat color
  signal color             : std_logic;  -- selects the color
  signal mux1_select       : std_logic;
  signal vsync_q           : std_logic;
  signal vsync_rising_edge : std_logic;

begin
  pix_counter : process(rst, pclk_i)    --counts the number of pixel processed
  begin
    if rst = '1' then

      pixel_cnt <= (others => '0');
      line_cnt  <= (others => '0');
      color     <= '0';
    elsif rising_edge(pclk_i) then

      vsync_rising_edge <= ((vsync xor vsync_q) and vsync);
      vsync_q           <= vsync;
      if vsync_rising_edge = '1' then
        line_cnt  <= (others => '0');
        pixel_cnt <= (others => '0');
        frame_cnt <= frame_cnt+1;
        if frame_cnt = to_unsigned(alt_aft_frame, 5)-1 then
          frame_cnt <= (others => '0');
          color     <= not (color);
        end if;
      elsif wr_en = '1' then
        if pixel_cnt = unsigned(resX)-1 then  --end of a line
          line_cnt  <= line_cnt+1;            --increment lines
          pixel_cnt <= to_unsigned(0, 16);
        else
          pixel_cnt <= pixel_cnt+1;
        end if;

      end if;
    end if;
  end process;

  --generates control signal for mux1
  selector : process(rst, pixel_cnt, line_cnt)
  begin

    if rst = '1' then
      mux1_select <= '0';
    elsif pixel_cnt > unsigned(resX)-(to_unsigned(HB_length, 16))
      and line_cnt > unsigned(resY)-(to_unsigned(HB_width, 16)) then
      mux1_select <= '0';
    else
      mux1_select <= '1';
    end if;
  end process;

  --Port control only works when switch is on
  --This process toggles output between image data and heart beat
  mux1 : process(rst, mux1_select, din, HB_color, HB_sw, HB_on)
  begin
    if HB_sw = '0'then
      dout <= din;
    else
      if HB_on = '0' then
        dout <= din;
      else
        case mux1_select is
          when '0'    => dout <= HB_color;
          when '1'    => dout <= din;
          when others => dout <= din;
        end case;
      end if;
    end if;
  end process;

  -- Toggles color
  mux2 : process(rst, color)
  begin
    case color is
      when '0'    => HB_color <= X"FFFFFF";  --red
      when '1'    => HB_color <= X"000000";  --blue
      when others => HB_color <= X"00FF00";
    end case;
  end process;


end Behavioral;
