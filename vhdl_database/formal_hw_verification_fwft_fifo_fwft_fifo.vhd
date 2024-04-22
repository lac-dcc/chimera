library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



entity fwft_fifo is
  generic (
    Formal : boolean := true;
    Depth  : positive := 16;
    Width  : positive := 16
  );
  port (
    Reset_n_i    : in  std_logic;
    Clk_i        : in  std_logic;
    -- write
    Wen_i        : in  std_logic;
    Din_i        : in  std_logic_vector(Width-1 downto 0);
    Full_o       : out std_logic;
    Werror_o     : out std_logic;
    -- read
    Ren_i        : in  std_logic;
    Dout_o       : out std_logic_vector(Width-1 downto 0);
    Empty_o      : out std_logic;
    Rerror_o     : out std_logic
  );
end entity fwft_fifo;


architecture rtl of fwft_fifo is


  signal s_empty : std_logic;
  signal s_ren   : std_logic;


begin


  i_fifo : entity work.fifo
  generic map (
    Formal => Formal,
    Depth  => Depth,
    Width  => Width
  )
  port map (
    Reset_n_i    => Reset_n_i,
    Clk_i        => Clk_i,
    -- write
    Wen_i        => Wen_i,
    Din_i        => Din_i,
    Full_o       => Full_o,
    Werror_o     => Werror_o,
    -- read
    Ren_i        => s_ren,
    Dout_o       => Dout_o,
    Empty_o      => s_empty,
    Rerror_o     => open
  );



  s_ren <= not s_empty and (Empty_o or Ren_i);


  ReadFlagsP : process (Reset_n_i, Clk_i) is
  begin
    if (Reset_n_i = '0') then
      Empty_o  <= '1';
      Rerror_o <= '0';
    elsif (rising_edge(Clk_i)) then
      Rerror_o <= Ren_i and Empty_o;
      if (s_ren = '1') then
        Empty_o <= '0';
      elsif (Ren_i = '1') then
        Empty_o <= '1';
      end if;
    end if;
  end process ReadFlagsP;


  FormalG : if Formal generate

    default clock is rising_edge(Clk_i);

    -- Initial reset
    RESTRICT_RESET : restrict
      {not Reset_n_i[*3]; Reset_n_i[+]}[*1];

    -- Inputs are low during reset for simplicity
    ASSUME_INPUTS_DURING_RESET : assume always
      not Reset_n_i ->
      not Wen_i and not Ren_i;

  end generate FormalG;


end architecture rtl;
