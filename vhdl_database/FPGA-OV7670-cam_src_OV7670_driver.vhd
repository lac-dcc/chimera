----------------------------------------------------------------------------------
-- Purpose:
-- Receive ready(from driver) -> readying state( in i2c) -> gostate(in registers) -> nextReg increment (in registers)
-- -> send finished signal to top -> start capturing
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ov7670_driver is
  Port ( iclk50   : in    STD_LOGIC;
	 config_finished : out std_logic;
	 sioc  : out   STD_LOGIC;
	 siod  : inout STD_LOGIC;
	 sw : in std_logic_vector( 9 downto 0);
	 key : in std_logic_vector( 2 downto 0)
	 --readcheck : out STD_LOGIC_VECTOR (7 downto 0)
       );
end ov7670_driver;

architecture Behavioral of ov7670_driver is
  COMPONENT ov7670_registers
    PORT(
	  iclk      : IN std_logic;
	  sw : in std_logic_vector(9 downto 0);
	  key : in std_logic_vector( 2 downto 0);
	  gostate  : IN std_logic;          
	  reg_loaded : OUT std_logic;
	  regs : OUT std_logic_vector(15 downto 0)
	);
  END COMPONENT;

  COMPONENT sccb
    PORT(
	  iclk   : in  STD_LOGIC;    
	  siod  : inout  STD_LOGIC;
	  sioc  : out  STD_LOGIC;
	  busystate : out  STD_LOGIC;
	  ready  : in  STD_LOGIC;
	  cam_address : in  STD_LOGIC_VECTOR (7 downto 0);
	  regid    : in  STD_LOGIC_VECTOR (7 downto 0);
	  regdata   : in  STD_LOGIC_VECTOR (7 downto 0)
	  --output : out STD_LOGIC_VECTOR (7 downto 0)
	);
  END COMPONENT;

  signal regs  : std_logic_vector(15 downto 0);
  signal finished : std_logic := '0';
  signal busystate    : std_logic := '0';
  signal cam_address : std_logic_vector( 7 downto 0) := x"42";
  signal ready     : std_logic;
 
begin


  rw : sccb PORT MAP
  (
    iclk   => iclk50,
    siod  => siod,
    sioc  => sioc,
    busystate => busystate,
    ready  => ready, --Stop sending when ready = 0
    cam_address => cam_address,
    regid    => regs(15 downto 8),
    regdata   => regs(7 downto 0)
    --output => readcheck
  );


  ovreg : OV7670_registers PORT MAP
  (
    iclk      => iclk50,
    sw => sw,
    key => key,
    gostate  => busystate,
    regs => regs,
    reg_loaded => finished
  );

  --readcheck <= x"00";
  config_finished <= finished;
  ready <= not finished;


end Behavioral;
