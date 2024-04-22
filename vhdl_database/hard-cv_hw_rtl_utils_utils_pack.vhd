--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.ALL;
use IEEE.MATH_REAL.log2;
use IEEE.MATH_REAL.ceil;

package utils_pack is


-- functions declaration
function nbit(max : integer) return integer;
function count_ones(slv : std_logic_vector) return natural;
function max(LEFT : integer ; RIGHT: integer) return integer ;


-- types declaration
type slv8_array is array (natural range <>) of std_logic_vector(7 downto 0);
type slv16_array is array (natural range <>) of std_logic_vector(15 downto 0);

component simple_counter is
	 generic(NBIT : positive := 4);
    Port ( clk : in  STD_LOGIC;
           resetn : in  STD_LOGIC;
           sraz : in  STD_LOGIC;
           en : in  STD_LOGIC;
			  load : in  STD_LOGIC;
			  E : in	STD_LOGIC_VECTOR(NBIT - 1 downto 0);
           Q : out  STD_LOGIC_VECTOR(NBIT - 1 downto 0)
			  );
end component;

component up_down_counter is
	 generic(NBIT : positive := 4);
    Port ( clk : in  STD_LOGIC;
           resetn : in  STD_LOGIC;
           sraz : in  STD_LOGIC;
           en, load : in  STD_LOGIC;
			  up_downn : in  STD_LOGIC;
			  E : in  STD_LOGIC_VECTOR(NBIT - 1 downto 0);
           Q : out  STD_LOGIC_VECTOR(NBIT - 1 downto 0)
			  );
end component;

component generic_mux is
	generic(NB_INPUTS : natural := 4 );
    Port ( s : in  STD_LOGIC_VECTOR(nbit(NB_INPUTS) - 1 downto 0);
           inputs : in  slv8_array(0 to (NB_INPUTS - 1));
           output : out  STD_LOGIC_VECTOR(7 downto 0));
end component;

component generic_latch is
	 generic(NBIT : positive := 8);
    Port ( clk : in  STD_LOGIC;
           resetn : in  STD_LOGIC;
           sraz : in  STD_LOGIC;
           en : in  STD_LOGIC;
           d : in  STD_LOGIC_VECTOR((NBIT - 1) downto 0);
           q : out  STD_LOGIC_VECTOR((NBIT - 1) downto 0));
end component;

component edge_triggered_latch is
	 generic(NBIT : positive := 8; POL : std_logic :='1');
    Port ( clk : in  STD_LOGIC;
           resetn : in  STD_LOGIC;
           sraz : in  STD_LOGIC;
           en : in  STD_LOGIC;
           d : in  STD_LOGIC_VECTOR((NBIT - 1) downto 0);
           q : out  STD_LOGIC_VECTOR((NBIT - 1) downto 0));
end component;


component fifo_Nx8 is
	generic(N : natural := 64);
	port(
 		clk, resetn, sraz : in std_logic; 
 		wr, rd : in std_logic; 
		empty, full, data_rdy : out std_logic ;
 		data_out : out std_logic_vector(7 downto 0 ); 
 		data_in : in std_logic_vector(7 downto 0 )
	); 
end component;

component hold is
	 generic(HOLD_TIME : positive := 4; HOLD_LEVEL : std_logic := '1');
    Port ( clk : in  STD_LOGIC;
           resetn : in  STD_LOGIC;
           sraz : in  STD_LOGIC;
           input: in  STD_LOGIC;
			  output: out  STD_LOGIC;
			  holding : out std_logic 
			  );
end component;


component generic_delay is
	generic( WIDTH : positive := 1; DELAY : positive := 1);
	port(
		clk, resetn : std_logic ;
		input	:	in std_logic_vector((WIDTH - 1) downto 0);
		output	:	out std_logic_vector((WIDTH - 1) downto 0)
);		
end component;

component dp_fifo is
	generic(N : natural := 128 ; 
	W : positive := 16;	
	SYNC_WR : boolean := false;
	SYNC_RD : boolean := false);
	port(
 		clk, resetn, sraz : in std_logic; 
 		wr, rd : in std_logic; 
		empty, full : out std_logic ;
 		data_out : out std_logic_vector((W - 1) downto 0 ); 
 		data_in : in std_logic_vector((W - 1) downto 0 );
		nb_available : out unsigned(nbit(N)  downto 0 )
	); 
end component;

component generic_rs_latch is
	port(clk, resetn : in std_logic ;
		  s, r : in std_logic ;
		  q : out std_logic );
end component;

component reset_generator is
generic(HOLD_0	:	natural	:= 100);
port(clk, resetn : in std_logic ;
     resetn_0: out std_logic
	  );
end component;



component HAMMING_DIST4 is
		port(
			clk : in std_logic; 
			resetn : in std_logic; 
			en : in std_logic ;
			vec1, vec2 :  in std_logic_vector(3 downto 0);
			distance : out std_logic_vector(3 downto 0));
end component;

component HAMMING_DIST is
generic(WIDTH: natural := 64; CYCLES : natural := 4);
		port(
			clk : in std_logic; 
			resetn : in std_logic; 
			en : in std_logic ;
			vec1, vec2 :  in std_logic_vector((WIDTH - 1) downto 0);
			
			dv : out std_logic ;
			distance : out std_logic_vector(nbit(WIDTH)-1 downto 0 ) );
end component;

component clock_bridge is
	generic(SIZE : positive := 1);
	port(
			clk_fast, clk_slow, resetn : in std_logic ;
			clk_slow_out : out std_logic ;
			data_in : in std_logic_vector(SIZE-1 downto 0);
			data_out : out std_logic_vector(SIZE-1 downto 0)
			);
end component;

component small_stack is
generic( WIDTH : positive := 8 ; DEPTH : positive := 8);
port(clk, resetn : in std_logic ;
	  push, pop : in std_logic ;
	  full, empty : out std_logic ;
	  data_in : in std_logic_vector( WIDTH-1 downto 0);
	  data_out : out std_logic_vector(WIDTH-1 downto 0)
	  );
end component;

component small_fifo is
generic( WIDTH : positive := 8 ; DEPTH : positive := 8; THRESHOLD : positive := 4);
port(clk, resetn : in std_logic ;
	  push, pop : in std_logic ;
	  full, empty, limit : out std_logic ;
	  data_in : in std_logic_vector( WIDTH-1 downto 0);
	  data_out : out std_logic_vector(WIDTH-1 downto 0)
	  );
end component;


--component pwm is
--generic(NB_CHANNEL : positive := 1);
--port(
--	clk, resetn : in std_logic ;
--	divider : in std_logic_vector(15 downto 0);
--	period : in std_logic_vector(15 downto 0);
--	pulse_width : in slv16_array(0 to NB_CHANNEL-1) ;
--	pwm : out std_logic_vector(0 to NB_CHANNEL-1) 
--);
--end component;

end utils_pack;

package body utils_pack is

 function nbit (max : integer) return integer is
 begin
   return (integer(ceil(log2(real(max)))));
 end nbit;
 
 function count_ones(slv : std_logic_vector) return natural is
  variable n_ones : natural := 0;
	begin
	  for i in slv'range loop
		 if slv(i) ='1' then
			n_ones := n_ones + 1;
		 end if;
	  end loop;
  return n_ones;
end function count_ones;

	function max(LEFT : integer; RIGHT: INTEGER) return INTEGER is
		begin
			 if LEFT > RIGHT then return LEFT;
			 else return RIGHT;
		end if;
	end max;
 
end utils_pack;
