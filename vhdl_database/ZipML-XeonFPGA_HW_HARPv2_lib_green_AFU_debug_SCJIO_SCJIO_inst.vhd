	component SCJIO is
		port (
			tms : in  std_logic := 'X'; -- tms
			tdi : in  std_logic := 'X'; -- tdi
			tdo : out std_logic;        -- tdo
			tck : in  std_logic := 'X'  -- clk
		);
	end component SCJIO;

	u0 : component SCJIO
		port map (
			tms => CONNECTED_TO_tms, -- jtag.tms
			tdi => CONNECTED_TO_tdi, --     .tdi
			tdo => CONNECTED_TO_tdo, --     .tdo
			tck => CONNECTED_TO_tck  --  tck.clk
		);

