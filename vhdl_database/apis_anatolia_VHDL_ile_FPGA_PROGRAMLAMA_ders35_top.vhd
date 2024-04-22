library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity top is
port (
clk			: in std_logic;
sel_i		: in std_logic_vector (2 downto 0);
data_in_i	: in std_logic_vector (7 downto 0);
write_i		: in std_logic;
data_out_o	: out std_logic_vector (10 downto 0)
);
end top;

architecture Behavioral of top is

-- component decleration
component adder_seq is
port (
clk	: in std_logic;
A	: in std_logic_vector (7 downto 0);
B	: in std_logic_vector (7 downto 0);
C	: in std_logic_vector (7 downto 0);
D	: in std_logic_vector (7 downto 0);
E	: in std_logic_vector (7 downto 0);
F	: in std_logic_vector (7 downto 0);
G	: in std_logic_vector (7 downto 0);
H	: in std_logic_vector (7 downto 0);
sum	: out std_logic_vector (10 downto 0)
);
end component;

component adder_pip is
port (
clk	: in std_logic;
A	: in std_logic_vector (7 downto 0);
B	: in std_logic_vector (7 downto 0);
C	: in std_logic_vector (7 downto 0);
D	: in std_logic_vector (7 downto 0);
E	: in std_logic_vector (7 downto 0);
F	: in std_logic_vector (7 downto 0);
G	: in std_logic_vector (7 downto 0);
H	: in std_logic_vector (7 downto 0);
sum	: out std_logic_vector (10 downto 0)
);
end component;

signal A	: std_logic_vector (7 downto 0) := (others => '0');
signal B	: std_logic_vector (7 downto 0) := (others => '0');
signal C	: std_logic_vector (7 downto 0) := (others => '0');
signal D	: std_logic_vector (7 downto 0) := (others => '0');
signal E	: std_logic_vector (7 downto 0) := (others => '0');
signal F	: std_logic_vector (7 downto 0) := (others => '0');
signal G	: std_logic_vector (7 downto 0) := (others => '0');
signal H	: std_logic_vector (7 downto 0) := (others => '0');

begin

-- component instantiation
I_adder_seq : adder_seq
port map(
clk	=> clk            ,
A	=> A	          ,
B	=> B	          ,
C	=> C	          ,
D	=> D	          ,
E	=> E	          ,
F	=> F	          ,
G	=> G	          ,
H	=> H	          ,
sum	=> data_out_o
);

-- I_adder_seq : adder_pip
-- port map(
-- clk	=> clk            ,
-- A	=> A	          ,
-- B	=> B	          ,
-- C	=> C	          ,
-- D	=> D	          ,
-- E	=> E	          ,
-- F	=> F	          ,
-- G	=> G	          ,
-- H	=> H	          ,
-- sum	=> data_out_o
-- );


process (clk) begin
if (rising_edge(clk)) then

	if (write_i = '1') then
		case sel_i is
			when "000" => A	<= data_in_i;
			when "001" => B	<= data_in_i;
			when "010" => C	<= data_in_i;
			when "011" => D	<= data_in_i;
			when "100" => E	<= data_in_i;
			when "101" => F	<= data_in_i;
			when "110" => G	<= data_in_i;
			when "111" => H	<= data_in_i;
			when others =>
		end case;
	end if;

end if;
end process;


end Behavioral;