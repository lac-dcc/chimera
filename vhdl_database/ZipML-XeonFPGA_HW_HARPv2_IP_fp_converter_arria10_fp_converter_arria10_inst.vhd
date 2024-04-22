	component fp_converter_arria10 is
		port (
			a      : in  std_logic_vector(31 downto 0) := (others => 'X'); -- a
			areset : in  std_logic                     := 'X';             -- reset
			clk    : in  std_logic                     := 'X';             -- clk
			q      : out std_logic_vector(31 downto 0)                     -- q
		);
	end component fp_converter_arria10;

	u0 : component fp_converter_arria10
		port map (
			a      => CONNECTED_TO_a,      --      a.a
			areset => CONNECTED_TO_areset, -- areset.reset
			clk    => CONNECTED_TO_clk,    --    clk.clk
			q      => CONNECTED_TO_q       --      q.q
		);

