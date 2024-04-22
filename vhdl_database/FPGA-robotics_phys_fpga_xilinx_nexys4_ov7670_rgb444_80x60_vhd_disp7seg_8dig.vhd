--------------------------------------------------------------------------------
--   Felipe Machado Sanchez
--   Area de Tecnologia Electronica
--   Universidad Rey Juan Carlos
--   https://github.com/felipe-m
--
--   7 segment display module four 8 numbers for a 100MHz clock
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.pkg_fun.ALL;
use work.ov7670_pkg.ALL;

entity disp7seg_8dig is
    port ( rst     : in  std_logic;
           clk     : in  std_logic;
           -- enables displays 
           en_disp : in  std_logic_vector(7 downto 0);
           num0    : in  std_logic_vector(3 downto 0);
           num1    : in  std_logic_vector(3 downto 0);
           num2    : in  std_logic_vector(3 downto 0);
           num3    : in  std_logic_vector(3 downto 0);
           num4    : in  std_logic_vector(3 downto 0);
           num5    : in  std_logic_vector(3 downto 0);
           num6    : in  std_logic_vector(3 downto 0);
           num7    : in  std_logic_vector(3 downto 0);
           seg     : out std_logic_vector(6 downto 0);
           anode   : out std_logic_vector(7 downto 0)
          );
end disp7seg_8dig;

architecture behav of disp7seg_8dig is

  constant c_decod_freq : natural := 1000; -- 1ms period of time mux
  -- c_clk_freq in ov7670.pkg
  constant c_cnt_decod_end : natural := div_round(c_clk_freq,c_decod_freq);
  constant c_nb_cnt_freq : natural := log2i(c_cnt_decod_end) + 1;
  signal   cnt_decod : unsigned (c_nb_cnt_freq-1 downto 0);
  signal   cnt_decod_end : std_logic;
  signal   num_disp : std_logic_vector(3 downto 0);

  constant c_n_disp   : natural := 8;
  signal   cnt_disp : unsigned (3-1 downto 0);

  signal   segment  : std_logic_vector(6 downto 0);

begin

  p_decod_cnt: process(rst, clk)
  begin
    if rst = c_on then
      cnt_decod <= (others =>'0');
    elsif clk'event and clk='1' then
      if cnt_decod_end = '1' then
        cnt_decod <= (others =>'0');
      else
        cnt_decod <= cnt_decod + 1;
      end if;
    end if;
  end process;

  cnt_decod_end <= '1' when (cnt_decod = c_cnt_decod_end - 1) else '0';

  p_4disp_cnt: process(rst, clk)
  begin
    if rst = c_on then
      cnt_disp <= (others => '0');
    elsif clk'event and clk='1' then
      if cnt_decod_end = '1' then
        if cnt_disp = c_n_disp-1 then
          cnt_disp <= (others => '0');
        else
          cnt_disp <= cnt_disp + 1;
        end if;
      end if;
    end if;
  end process;

  p_timemux: process(cnt_disp, en_disp,num0,num1,num2,num3,num4,num5,num6,num7)
  begin
    anode <= (others => c_anode_off);
    if en_disp(to_integer(cnt_disp)) = '1' then
      anode(to_integer(cnt_disp)) <= c_anode_on; 
    end if;
    case cnt_disp is
      when "000" =>
        num_disp <= num0;
      when "001" =>
        num_disp <= num1;
      when "010" =>
        num_disp <= num2;
      when "011" =>
        num_disp <= num3;
      when "100" =>
        num_disp <= num4;
      when "101" =>
        num_disp <= num5;
      when "110" =>
        num_disp <= num6;
      when others =>
        num_disp <= num7;
    end case;
  end process;

  -- seven segment decoder
             --ABCDEFG
  segment  <= "1111110" when num_disp="0000" else  -- 0
              "0110000" when num_disp="0001" else  -- 1
              "1101101" when num_disp="0010" else  -- 2
              "1111001" when num_disp="0011" else  -- 3
              "0110011" when num_disp="0100" else  -- 4
              "1011011" when num_disp="0101" else  -- 5
              "1011111" when num_disp="0110" else  -- 6
              "1110000" when num_disp="0111" else  -- 7
              "1111111" when num_disp="1000" else  -- 8
              "1111011" when num_disp="1001" else  -- 9
              "1110111" when num_disp="1010" else  -- A
              "0011111" when num_disp="1011" else  -- B
              "1001110" when num_disp="1100" else  -- C
              "0111101" when num_disp="1101" else  -- D
              "1001111" when num_disp="1110" else  -- E
              "1000111"; --  num_disp="1111"       -- F

  seg <= segment when c_seg_on = '1' else not segment;
  
end behav;

