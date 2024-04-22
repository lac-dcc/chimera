library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity poolV is

  generic(
    BITWIDTH  : integer;
    IMAGE_WIDTH : integer;
    KERNEL_SIZE : integer
    );

  port(
    clk      : in  std_logic;
    reset_n  : in  std_logic;
    enable   : in  std_logic;
    in_data  : in  std_logic_vector (BITWIDTH - 1 downto 0);
    in_dv    : in  std_logic;
    in_fv    : in  std_logic;
    out_data : out std_logic_vector (BITWIDTH - 1 downto 0);
    out_dv   : out std_logic;
    out_fv   : out std_logic
    );
end entity;

architecture rtl of poolV is
  --------------------------------------------------------------------------
  -- Signals
  --------------------------------------------------------------------------
  type buffer_data_type is array (integer range <>) of signed (BITWIDTH-1 downto 0);

  signal buffer_line      : buffer_data_type (IMAGE_WIDTH - 1 downto 0);
  signal buffer_data      : buffer_data_type (KERNEL_SIZE - 1 downto 0);
  signal max_value_signal : signed (BITWIDTH - 1 downto 0);
  signal buffer_fv        : std_logic_vector(KERNEL_SIZE downto 0);
  signal delay_fv         : std_logic := '0';
  signal tmp_dv           : std_logic := '0';


begin

  process (clk)
    variable x_cmp : unsigned (15 downto 0);

  begin
    if (reset_n = '0') then
      tmp_dv           <= '0';
      buffer_data      <= (others => (others => '0'));
      buffer_line      <= (others => (others => '0'));
      max_value_signal <= (others => '0');
      x_cmp            := (others => '0');

    elsif (rising_edge(clk)) then
      if (enable = '1') then
        if (in_fv = '1') then
          if (in_dv = '1') then

            -- Bufferize line --------------------------------------------------------
            buffer_line(IMAGE_WIDTH - 1) <= signed(in_data);
            BUFFER_LOOP : for i in (IMAGE_WIDTH - 1) downto 1 loop
              buffer_line(i-1) <= buffer_line(i);
            end loop;

            buffer_data(0) <= signed(in_data);
            buffer_data(1) <= buffer_line(0);

            -- Compute max : Case2 , just a comparator --------------------------------
            if (buffer_data(0) > buffer_data(1)) then
              max_value_signal <= buffer_data(0);
            else
              max_value_signal <= buffer_data(1);
            end if;

            -- V Subsample -------------------------------------------------------------
            if (x_cmp < to_unsigned(IMAGE_WIDTH+1, 16)) then
              tmp_dv <= '0';
              x_cmp  := x_cmp + to_unsigned(1, 16);
            elsif (x_cmp > to_unsigned(IMAGE_WIDTH + IMAGE_WIDTH, 16)) then
              tmp_dv <= '0';
              x_cmp  := to_unsigned(2, 16);
            else
              tmp_dv <= '1';
              x_cmp  := x_cmp + to_unsigned(1, 16);
            end if;
          --------------------------------------------------------------------------
          else
            -- Data is not valid
            tmp_dv <= '0';
          end if;
        else
          buffer_data      <= (others => (others => '0'));
          buffer_line      <= (others => (others => '0'));
          max_value_signal <= (others => '0');
          x_cmp            := (others => '0');
        end if;
      end if;
    end if;
  end process;
  --------------------------------------------------------------------------
  delay : process(clk)
  begin
    if (reset_n = '0') then
      delay_fv  <= '0';
      buffer_fv <= (others => '0');
    elsif (rising_edge(clk)) then
      if (enable = '1') then
        buffer_fv <= buffer_fv(buffer_fv'high -1 downto 0) & in_fv;
        delay_fv  <= buffer_fv(buffer_fv'high);
      end if;
    end if;
  end process;


  out_data <= std_logic_vector(max_value_signal);
  out_fv   <= delay_fv;
  out_dv   <= tmp_dv;

end architecture;
