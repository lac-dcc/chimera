--------------------------------------------------------------------------------
--   Felipe Machado Sanchez
--   Area de Tecnologia Electronica
--   Universidad Rey Juan Carlos
--   https://github.com/felipe-m
--
--   tb_ov7670_ctrl.vhd
--   test bench for ov7670_ctrl.vhd
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.ov7670_pkg.all;  -- definition of the clk frequency
 
entity tb_ov7670_ctrl is
end tb_ov7670_ctrl;
 
architecture tb of tb_ov7670_ctrl is 
 
  component ov7670_top_ctrl
    port(
      rst          : in  std_logic;
      clk          : in  std_logic;
      resend       : in  std_logic;
      done         : out  std_logic;
      sclk         : out  std_logic;
      sdat_on      : out  std_logic;
      sdat_out     : out  std_logic;
      ov7670_rst_n : out std_logic;
      ov7670_clk   : out std_logic;
      ov7670_pwdn  : out std_logic
    );
  end component;
    

   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';
   signal resend : std_logic := '0';

   --Outputs
   signal done : std_logic;
   signal sclk : std_logic;
   signal sdat_on : std_logic;
   signal sdat_out : std_logic;
   signal ov7670_rst_n : std_logic;
   signal ov7670_clk   : std_logic;
   signal ov7670_pwdn  : std_logic;

   -- c_clk_freq declared in ov7670_pkg.vhd
   constant tc_clk_period : time := c_clk_period * 1 ns;
 
begin
 
  -- Instantiate the Unit Under Test (UUT)
  uut: ov7670_top_ctrl
    port map (
      rst          => rst,
      clk          => clk,
      resend       => resend,
      done         => done,
      sclk         => sclk,
      sdat_on      => sdat_on,
      sdat_out     => sdat_out,
      ov7670_rst_n => ov7670_rst_n,
      ov7670_clk   => ov7670_clk,
      ov7670_pwdn  => ov7670_pwdn
  );

  -- Clock process definitions
  clk_process :process
  begin
    clk <= '0';
    wait for tc_clk_period/2;
    clk <= '1';
    wait for tc_clk_period/2;
  end process;
 
  -- Stimulus process
  P_rst: process
  begin		
    rst  <= c_on;
    resend <= '0';
    wait for 100 ns;	
    rst  <= c_off;
    wait for 5 ms; -- sending everything again
    resend <= '1';
    wait for 10 * tc_clk_period; -- making the pulse longer to see what happens
    resend <= '0';
    wait;
  end process;

end tb;
