--------------------------------------------------------------------------------
--   Felipe Machado Sanchez
--   Area de Tecnologia Electronica
--   Universidad Rey Juan Carlos
--   https://github.com/felipe-m
--
--   ov7670_top_ctrl.vhd
--   structural model, that controls the OV7670 camera, send the registers
--   and controls the camera
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_fun.all;  -- definition of the clk frequency

entity ov7670_top_ctrl is
  port(
    rst          : in  std_logic;                  --reset, active high
    clk          : in  std_logic;                  --FPGA clock
    test_mode    : in  std_logic;             --if '1': in test mode
    test_send    : in  std_logic;             --in testmode, send 1 instruction
    sw_regs    : in  std_logic_vector(1 downto 0); -- test to choose diferent rg
    resend       : in  std_logic;                  --resend the sequence
    done         : out std_logic;                  --all transmission done
    sclk         : out std_logic;                  --sccb clock
    sdat_on      : out std_logic;                  --transmitting serial ('1')
    --sdat_in    : in  std_logic;                  --sccb serial data in
    sdat_out     : out std_logic;                  --sccb serial data ou
    ov7670_rst_n : out std_logic;                  --camera reset
    ov7670_clk   : out std_logic;                  --camera system clock
    ov7670_pwdn  : out std_logic                   --camera power down
  );
end ov7670_top_ctrl;

architecture struct of ov7670_top_ctrl is

  component sccb_master is
    port(
      rst        : in  std_logic;                    --reset, active high
      clk        : in  std_logic;                    --fpga clock
      start_tx   : in  std_logic;                    --start transmission
      id         : in  std_logic_vector(6 downto 0); --id of the slave
      addr       : in  std_logic_vector(7 downto 0); --address to be written
      data_wr    : in  std_logic_vector(7 downto 0); --data to write to slave
      ready      : out std_logic;                    --ready to send
      finish_tx  : out std_logic;                    --transmission finished
      sclk       : out std_logic;                    --sccb clock
      sdat_on    : out std_logic;                    --transmitting serial ('1')
      --sdat_in    : in  std_logic;                  --sccb serial data in
      sdat_out   : out std_logic);                   --sccb serial data out
  end component;

  component ov7670_ctrl_reg is
    port(
      rst        : in  std_logic;                    --reset, active high
      clk        : in  std_logic;                    --FPGA clock
      test_mode  : in  std_logic;              --if '1': in test mode
      test_send  : in  std_logic;              --in testmode, send 1 instruction
      sw_regs    : in  std_logic_vector(1 downto 0);--test to choose diferent rg
      resend     : in  std_logic;                    --resend the sequence
      sccb_ready : in  std_logic;                    --SCCB ready to transmit
      start_tx   : out std_logic;                    --start transmission
      done       : out std_logic;                    --all the registers written
      id         : out std_logic_vector(6 downto 0); --id of the slave
      addr       : out std_logic_vector(7 downto 0); --address to be written
      data_wr    : out std_logic_vector(7 downto 0); --data to write to slave
      ov7670_rst_n : out std_logic;                  --camera reset
      ov7670_clk   : out std_logic;                  --camera system clock
      ov7670_pwdn  : out std_logic                   --camera power down
    );
  end component;

  signal start_tx    : std_logic;
  signal sccb_ready  : std_logic;
  signal id        : std_logic_vector(6 downto 0);
  signal addr      : std_logic_vector(7 downto 0);
  signal data_wr   : std_logic_vector(7 downto 0);

begin

  I_SCCB: sccb_master
    port map (
      rst       => rst,
      clk       => clk,
      start_tx  => start_tx,
      id        => id,
      addr      => addr,
      data_wr   => data_wr,
      ready     => sccb_ready,
      --finish_tx    : out std_logic;
      sclk      => sclk,
      sdat_on   => sdat_on,
      --sdat_in    : in  std_logic;
      sdat_out  => sdat_out
    );


  I_REGS: ov7670_ctrl_reg
    port map (
      rst          => rst,
      clk          => clk,
      test_mode    => test_mode,
      test_send    => test_send,
      sw_regs      => sw_regs,
      resend       => resend,
      sccb_ready   => sccb_ready,
      start_tx     => start_tx,
      done         => done,
      id           => id,
      addr         => addr,
      data_wr      => data_wr,
      ov7670_rst_n => ov7670_rst_n,
      ov7670_clk   => ov7670_clk,
      ov7670_pwdn  => ov7670_pwdn
    );

end struct;
