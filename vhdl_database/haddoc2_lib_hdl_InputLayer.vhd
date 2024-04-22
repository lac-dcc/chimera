-- Converts the camera output to signals usable by Haddoc layers
-- TODO : Support a variable PIXEL_BIT_WIDTH

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

library work;
use work.cnn_types.all;

entity InputLayer is
  generic(
    BITWIDTH      : integer;          -- Bit-width of the activations and FMs
    INPUT_BIT_WIDTH : integer;          -- Bit-width of the input pixel
    NB_OUT_FLOWS    : integer           -- Number of channels in input
    );

  port(
    clk      : in  std_logic;
    reset_n  : in  std_logic;
    enable   : in  std_logic;
    in_data  : in  std_logic_vector(INPUT_BIT_WIDTH-1 downto 0);
    in_dv    : in  std_logic;
    in_fv    : in  std_logic;
    out_data : out pixel_array(0 to NB_OUT_FLOWS-1);
    out_dv   : out std_logic;
    out_fv   : out std_logic

    );
end entity;

architecture bhv of InputLayer is
begin
  MONOCHROME_INPUT : if NB_OUT_FLOWS = 1 generate
    -- Grayscale input
    process(clk)
    begin
      if (reset_n = '0') then
        out_data <= (others => (others => '0'));
      else
        if (enable = '1') then
          out_data(0) <= '0' & in_data(INPUT_BIT_WIDTH-1 downto INPUT_BIT_WIDTH-BITWIDTH+1);
        end if;
        out_dv <= in_dv;
        out_fv <= in_fv;
      end if;
    end process;
  end generate MONOCHROME_INPUT;

  COLOR_INPUT : if NB_OUT_FLOWS = 3 generate
    -- RGB 8 bits color depth
    process(clk)
    begin
      if (reset_n = '0') then
        out_data <= (others => (others => '0'));
      else
        if (enable = '1') then
          -- MSBs of each channel
          out_data(0) <= '0' & in_data(INPUT_BIT_WIDTH/1-1 downto INPUT_BIT_WIDTH/1-BITWIDTH+1);
          out_data(1) <= '0' & in_data(INPUT_BIT_WIDTH/2-1 downto INPUT_BIT_WIDTH/2-BITWIDTH+1);
          out_data(2) <= '0' & in_data(INPUT_BIT_WIDTH/3-1 downto INPUT_BIT_WIDTH/3-BITWIDTH+1);
        end if;
        out_dv <= in_dv;
        out_fv <= in_fv;
      end if;
    end process;
  end generate COLOR_INPUT;
end bhv;
