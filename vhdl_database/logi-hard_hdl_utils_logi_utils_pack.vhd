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

package logi_utils_pack is

function nbit(max : integer) return integer;
function count_ones(slv : std_logic_vector) return natural;
function max(LEFT : integer ; RIGHT: integer) return integer ;


type fifo16_bus is
record
	fifo_data_in : std_logic_vector(15 downto 0);
	fifo_data_out : std_logic_vector(15 downto 0);
	fifo_wr : std_logic ;
	fifo_rd  : std_logic ;
	fifo_full : std_logic ;
	fifo_empty : std_logic ;
	fifo_nb_free : std_logic_vector(15 downto 0);
	fifo_nb_available : std_logic_vector(15 downto 0);
end record;

type slv8_array is array (natural range <>) of std_logic_vector(7 downto 0);
type slv16_array is array (natural range <>) of std_logic_vector(15 downto 0);
type slv32_array is array (natural range <>) of std_logic_vector(31 downto 0);


component simple_counter is
	 generic(NBIT : positive := 4);
    Port ( clk : in  STD_LOGIC;
           resetn : in  STD_LOGIC;
           sreset : in  STD_LOGIC;
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

component generic_rs_latch is
	port(clk, resetn : in std_logic ;
		  s, r : in std_logic ;
		  q : out std_logic );
end component;

component detect_value is
generic(to_be_detected : integer := 16; 
		  nbit : positive := 32);
port(
	value : in std_logic_vector(nbit-1 downto 0);
	detected : out std_logic 
);
end component;

component ff_sync is
	generic(
		STAGES : integer := 1;
		WIDTH : integer := 1;
		RESET_VAL : std_logic := '0'
	);
	port(
		clk   : in std_logic;
		reset : in std_logic;
		din   : in std_logic_vector(WIDTH-1 downto 0);
		dout  : out std_logic_vector(WIDTH-1 downto 0)
	);
end component;

component bin2gray4 is
	port(
		bin  : in std_logic_vector(3 downto 0);
		gray : out std_logic_vector(3 downto 0)
	);
end component;

component gray2bin4 is
	port(
		gray : in std_logic_vector(3 downto 0);
		bin : out std_logic_vector(3 downto 0)
	);
end component;

end logi_utils_pack;

package body logi_utils_pack is

	function nbit (max : integer) return integer is
		begin
		if max = 0 then
			return 1 ;
		end if;
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

	
 
end logi_utils_pack;
