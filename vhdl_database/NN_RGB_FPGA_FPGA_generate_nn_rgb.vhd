-- nn_rgb_generate.vhd
--
-- top level
-- parameters provided in config package
--
-- FPGA Vision Remote Lab http://h-brs.de/fpga-vision-lab
-- (c) Thomas Florkowski, Hochschule Bonn-Rhein-Sieg, 16.05.2020
--     Release: Marco Winzker, Hochschule Bonn-Rhein-Sieg, 08.09.2020

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.CONFIG.ALL;


entity nn_rgb is
  port (clk       : in  std_logic;                      -- input clock 74.25 MHz, video 720p
        reset_n   : in  std_logic;                      -- reset (invoked during configuration)
        enable_in : in  std_logic_vector(2 downto 0);   -- three slide switches
        -- video in
        vs_in     : in  std_logic;                      -- vertical sync
        hs_in     : in  std_logic;                      -- horizontal sync
        de_in     : in  std_logic;                      -- data enable is '1' for valid pixel
        r_in      : in  std_logic_vector(7 downto 0);   -- red component of pixel
        g_in      : in  std_logic_vector(7 downto 0);   -- green component of pixel
        b_in      : in  std_logic_vector(7 downto 0);   -- blue component of pixel
        -- video out
        vs_out    : out std_logic;                      -- corresponding to video-in
        hs_out    : out std_logic;
        de_out    : out std_logic;
        r_out     : out std_logic_vector(7 downto 0);
        g_out     : out std_logic_vector(7 downto 0);
        b_out     : out std_logic_vector(7 downto 0);
        --
        clk_o     : out std_logic;                      -- output clock (do not modify)
        led       : out std_logic_vector(2 downto 0));  -- not supported by remote lab
end nn_rgb;

architecture behave of nn_rgb is

    -- input FFs
    signal reset                    : std_logic;
    signal enable                  : std_logic_vector(2 downto 0);
    signal vs_0, hs_0, de_0     : std_logic;


    -- output of signal processing
    signal vs_1, hs_1, de_1         : std_logic;
    signal result_r, result_g, result_b : std_logic_vector(7 downto 0);

    type   y_array is array (0 to 10) of std_logic_vector(7 downto 0);
    signal y : y_array;
    
    
begin


--generate the neural network with the parameters from config.vhd
--the outer loops creates the layers and the inner loop the neurons within the layer
--input Layer is assgined later
gen : FOR i IN 1 TO networkStructure'length - 1 GENERATE --layers
    gen2: FOR j IN 0 TO networkStructure(i) - 1 GENERATE --neurons within the Layers
     begin
        knot: entity work.neuron
             generic map ( weightsIn => weights(positions(j+1,i)-1 downto positions(j,i)))
             port map (  clk      => clk,
                         inputsIn => (connection(connnectionRange(i)-1 downto connnectionRange(i-1))),
                         output   => connection(connnectionRange(i)+j));
    END GENERATE;
END GENERATE;

--delay the control signals for the time of the processing
control: entity work.control
    generic map (delay => 9)
    port map (  clk      => clk,
                reset    => reset,
                vs_in    => vs_0,
                hs_in    => hs_0,
                de_in    => de_0,
                vs_out   => vs_1,
                hs_out   => hs_1,
                de_out   => de_1);

process
begin
   wait until rising_edge(clk);

   -- input FFs for control
   reset <= not reset_n;
   enable <= enable_in;
    -- input FFs for video signal
   vs_0  <= vs_in;
   hs_0  <= hs_in;
   de_0  <= de_in;

   --assign values of the input layer
   connection(0) <= to_integer(unsigned(r_in));
   connection(1) <= to_integer(unsigned(g_in));
   connection(2) <= to_integer(unsigned(b_in));

   -- convert RGB to luminance: Y (5*R + 9*G + 2*B)
   y(0) <= std_logic_vector(to_unsigned(
          (5*connection(0) + 9*connection(1) + 2*connection(2))/16,8));
   for i in 1 to 10 loop
      y(i) <= y(i-1);
   end loop;
   

end process;

process
variable luminance : std_logic_vector(7 downto 0);
variable r_yellow, r_blue, r_gray : std_logic_vector(7 downto 0);
variable g_yellow, g_blue, g_gray : std_logic_vector(7 downto 0);
variable b_yellow, b_blue, b_gray : std_logic_vector(7 downto 0);

begin

  wait until rising_edge(clk);
-- output processing
-- assign the pixel a value depending on the output of the neural network

luminance := y(8);

-- yellow: amplify red and green
r_yellow := '1' & luminance(7 downto 1);
g_yellow := '1' & luminance(7 downto 1);
b_yellow := '0' & luminance(7 downto 1);

-- blue: amplify blue
r_blue   := '0' & luminance(7 downto 1);
g_blue   := '0' & luminance(7 downto 1);
b_blue   := '1' & luminance(7 downto 1);

-- gray: use luminance
r_gray   := luminance;
g_gray   := luminance;
b_gray   := luminance;

      if(connection(11) > 127) then
      
            if(connection(11) > connection(10)) then
                -- yellow
                result_r <= r_yellow;
                result_g <= g_yellow;
                result_b <= b_yellow;
            else
                -- blue
                result_r <= r_blue;
                result_g <= g_blue;
                result_b <= b_blue;
            end if;
      elsif (connection(10)>127) then
            -- blue
            result_r <= r_blue;
            result_g <= g_blue;
            result_b <= b_blue;

      else
            -- gray
            result_r <= r_gray;
            result_g <= g_gray;
            result_b <= b_gray;
      end if;

    -- output FFs 
    vs_out  <= vs_1;
    hs_out  <= hs_1;
    de_out  <= de_1;
    r_out   <= result_r;
    g_out   <= result_g;
    b_out   <= result_b;

end process;

clk_o <= clk;
led   <= "000";

end behave;
