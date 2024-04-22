library IEEE;
use IEEE.std_logic_1164.all;
Use IEEE.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity pia8255 is
	port
  (
  	-- uC interface
    clk     : in std_logic;
    clken   : in std_logic;
  	reset   : in std_logic;
    a       : in std_logic_vector(1 downto 0);
  	d_i     : in std_logic_vector(7 downto 0);
  	d_o     : out std_logic_vector(7 downto 0);
  	cs    	: in std_logic;
    rd  	  : in std_logic;
    wr	    : in std_logic;

    -- I/O interface
    pa_i    : in std_logic_vector(7 downto 0);
    pb_i    : in std_logic_vector(7 downto 0);
    pc_i    : in std_logic_vector(7 downto 0);
    pa_o    : out std_logic_vector(7 downto 0);
    pb_o    : out std_logic_vector(7 downto 0);
    pc_o    : out std_logic_vector(7 downto 0)
	);
end pia8255;

architecture SYN of pia8255 is

  type byte_vector is array (natural range <>) of std_logic_vector(7 downto 0);

	signal ctrl			: std_logic_vector(7 downto 0);
	signal pa_oen		: std_logic;
	signal pb_oen		: std_logic;
	signal pcl_oen	: std_logic;
	signal pch_oen	: std_logic;

  signal pa_d     : std_logic_vector(7 downto 0);
  signal pb_d     : std_logic_vector(7 downto 0);
  signal pc_d     : std_logic_vector(7 downto 0);

begin

	pa_o <= pa_d when (reset = '0' and pa_oen = '1') else X"FF";
	pb_o <= pb_d when (reset = '0' and pb_oen = '1') else X"FF";
	pc_o(7 downto 4) <= pc_d(7 downto 4) when (reset = '0' and pch_oen = '1') else X"F";
	pc_o(3 downto 0) <= pc_d(3 downto 0) when (reset = '0' and pcl_oen = '1') else X"F";

	-- Synchronous logic
	process(clk, reset)
		variable ctrl_r : std_logic_vector(7 downto 0);
		variable csel		: integer;
	begin
		pa_oen <= not ctrl_r(4);
		pb_oen <= not ctrl_r(1);
		pcl_oen <= not ctrl_r(0);
		pch_oen <= not ctrl_r(3);

		ctrl <= ctrl_r;

		-- Reset values
		if reset = '1' then
			ctrl_r  := X"9B";
			pa_d		<= X"00";
			pb_d		<= X"00";
			pc_d		<= X"00";

		-- Handle register writes
		elsif rising_edge(clk) and clken = '1' and cs = '1' and wr = '1' then
			if a = "00" then
				pa_d <= d_i;
			end if;

			if a = "01" then
				pb_d <= d_i;
			end if;

			if a = "10" then
				pc_d <= d_i;
			end if;

			if a = "11" then
				-- D7=1, write control
				if d_i(7) = '1' then
					ctrl_r := d_i;
    			pa_d		<= X"00";
    			pb_d		<= X"00";
    			pc_d		<= X"00";

				-- D7=0, write C bit
				else
					csel := conv_integer(d_i(3 downto 1));
					pc_d(csel) <= d_i(0);
				end if;
			end if;
		end if;
	end process;

	-- Data out mux
	process(a, cs, rd)
		variable data_out : std_logic_vector(7 downto 0);
	begin
		if cs = '1' and rd = '1' then
			case a is
			when "00" =>		data_out := pa_i;
			when "01" =>		data_out := pb_i;
			when "10" =>		data_out := pc_i;
			when "11" =>		data_out := ctrl;
			when others =>	data_out := (others => 'X');
			end case;
		else
			data_out := (others => 'X');
		end if;

		d_o <= data_out;
	end process;
end SYN;

library IEEE;
use IEEE.std_logic_1164.all;
Use IEEE.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity pia8255_n is
	port
  (
  	-- uC interface
    clk     : in std_logic;
    clken   : in std_logic;
  	reset   : in std_logic;
    a       : in std_logic_vector(1 downto 0);
  	d_i     : in std_logic_vector(7 downto 0);
  	d_o     : out std_logic_vector(7 downto 0);
  	cs_n   	: in std_logic;
    rd_n   	: in std_logic;
    wr_n   	: in std_logic;

    -- I/O interface
    pa_i    : in std_logic_vector(7 downto 0);
    pb_i    : in std_logic_vector(7 downto 0);
    pc_i    : in std_logic_vector(7 downto 0);
    pa_o    : out std_logic_vector(7 downto 0);
    pb_o    : out std_logic_vector(7 downto 0);
    pc_o    : out std_logic_vector(7 downto 0)
	);
end pia8255_n;

architecture SYN of pia8255_n is

	signal cs		: std_logic;
	signal rd		: std_logic;
	signal wr		: std_logic;
	
begin

	cs <= not cs_n;
	rd <= not rd_n;
	wr <= not wr_n;
	
	pia_inst : entity work.pia8255
		port map
	  (
	  	-- uC interface
	    clk     => clk,
			clken		=> clken,
	  	reset   => reset,
	    a       => a,
	  	d_i     => d_i,
	  	d_o     => d_o,
	  	cs    	=> cs,
	    rd    	=> rd,
	    wr    	=> wr,

	    -- I/O interface
	    pa_i    => pa_i,
	    pb_i    => pb_i,
	    pc_i    => pc_i,
	    pa_o    => pa_o,
	    pb_o    => pb_o,
	    pc_o    => pc_o
		);

end SYN;
