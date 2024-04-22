--------------------------------------------------------------------------------
-- Company: 		Trenz Electronic
-- Engineer: 		Oleksandr Kiyenko
--------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
--------------------------------------------------------------------------------
entity axis_concat_v1_0 is
generic (
	C_A_TDATA_WIDTH			: integer		:= 16;
	C_B_TDATA_WIDTH			: integer		:= 16;
	C_C_TDATA_WIDTH			: integer		:= 16;
	M_TDATA_WIDTH			: integer		:= 48;
	C_IN_CHANNELS			: integer range 1 to 3	:= 1;
	C_TVALID_TYPE			: integer range 0 to 3	:= 0
);
port (
	-- Input stream
	s_axis_aclk				: in  STD_LOGIC;
	s_axis_aresetn			: in  STD_LOGIC;
	
	sa_axis_tready			: out STD_LOGIC;
	sa_axis_tdata			: in  STD_LOGIC_VECTOR(C_A_TDATA_WIDTH-1 downto 0);
	sa_axis_tvalid			: in  STD_LOGIC;
	
	sb_axis_tready			: out STD_LOGIC;
	sb_axis_tdata			: in  STD_LOGIC_VECTOR(C_B_TDATA_WIDTH-1 downto 0);
	sb_axis_tvalid			: in  STD_LOGIC;
	
	sc_axis_tready			: out STD_LOGIC;
	sc_axis_tdata			: in  STD_LOGIC_VECTOR(C_C_TDATA_WIDTH-1 downto 0);
	sc_axis_tvalid			: in  STD_LOGIC;
	-- Output stream
	m_axis_tready			: in  STD_LOGIC;
	m_axis_tdata			: out STD_LOGIC_VECTOR(M_TDATA_WIDTH-1 downto 0);
	m_axis_tvalid			: out STD_LOGIC
);
end axis_concat_v1_0;
--------------------------------------------------------------------------------
architecture arch_imp of axis_concat_v1_0 is
--------------------------------------------------------------------------------
begin
--------------------------------------------------------------------------------
-- FIXME
sa_axis_tready			<= m_axis_tready;
sb_axis_tready			<= m_axis_tready;
sc_axis_tready			<= m_axis_tready;

single_gen: if C_IN_CHANNELS = 1 generate
	m_axis_tdata		<= sa_axis_tdata;
	single_or_gen: if C_TVALID_TYPE = 5 generate
		m_axis_tvalid	<= sa_axis_tvalid;
	end generate;
end generate;

double_gen: if C_IN_CHANNELS = 2 generate
	m_axis_tdata		<= sb_axis_tdata & sa_axis_tdata;
	double_or_gen: if C_TVALID_TYPE = 5 generate
		m_axis_tvalid	<= sa_axis_tvalid or sb_axis_tvalid;
	end generate;
end generate;

triple_gen: if C_IN_CHANNELS = 3 generate
	m_axis_tdata		<= sc_axis_tdata & sb_axis_tdata & sa_axis_tdata;
	triple_or_gen: if C_TVALID_TYPE = 5 generate
		m_axis_tvalid	<= sa_axis_tvalid or sb_axis_tvalid or sc_axis_tvalid;
	end generate;
end generate;

a_gen: if C_TVALID_TYPE = 0 generate
	m_axis_tvalid		<= sa_axis_tvalid;
end generate;

b_gen: if C_TVALID_TYPE = 1 generate
	m_axis_tvalid		<= sb_axis_tvalid;
end generate;

c_gen: if C_TVALID_TYPE = 3 generate
	m_axis_tvalid		<= sc_axis_tvalid;
end generate;

and_gen: if C_TVALID_TYPE = 4 generate
	m_axis_tvalid		<= sa_axis_tvalid and sb_axis_tvalid and sc_axis_tvalid;
end generate;
--------------------------------------------------------------------------------
end arch_imp;
