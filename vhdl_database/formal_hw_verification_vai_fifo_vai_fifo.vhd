library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



entity vai_fifo is
  generic (
    Formal : boolean := true;
    Depth  : positive := 16;
    Width  : positive := 16
  );
  port (
    Reset_n_i    : in  std_logic;
    Clk_i        : in  std_logic;
    -- write
    Valid_i      : in  std_logic;
    Accept_o     : out std_logic;
    Din_i        : in  std_logic_vector(Width-1 downto 0);
    -- read
    Valid_o      : out std_logic;
    Accept_i     : in  std_logic;
    Dout_o       : out std_logic_vector(Width-1 downto 0)
  );
end entity vai_fifo;


architecture rtl of vai_fifo is


  signal s_wen : std_logic;
  signal s_ren : std_logic;

  signal s_full  : std_logic;
  signal s_empty : std_logic;


begin


  i_fwft_fifo : entity work.fwft_fifo
  generic map (
    Formal => Formal,
    Depth  => Depth,
    Width  => Width
  )
  port map (
    Reset_n_i    => Reset_n_i,
    Clk_i        => Clk_i,
    -- write
    Wen_i        => s_wen,
    Din_i        => Din_i,
    Full_o       => s_full,
    Werror_o     => open,
    -- read
    Ren_i        => s_ren,
    Dout_o       => Dout_o,
    Empty_o      => s_empty,
    Rerror_o     => open
  );


  s_wen <= Valid_i and not s_full;
  s_ren <= Accept_i and not s_empty;

  Accept_o <= not s_full;
  Valid_o  <= not s_empty;



  FormalG : if Formal generate

    default clock is rising_edge(Clk_i);

    -- Initial reset
    RESTRICT_RESET : restrict
      {not Reset_n_i[*3]; Reset_n_i[+]}[*1];

    -- Inputs are low during reset for simplicity
    ASSUME_INPUTS_DURING_RESET : assume always
      not Reset_n_i ->
      not Valid_i and not Accept_i;

  end generate FormalG;


end architecture rtl;
