LIBRARY	IEEE,work;
	USE	IEEE.STD_LOGIC_1164.ALL;
	USE	IEEE.STD_LOGIC_UNSIGNED.ALL;
	use ieee.std_logic_arith.all;
	use work.envelope_pkg.all;

entity envtest is
port(
	KEY		:in std_logic;
	AR		:in std_logic_vector(4 downto 0);
	DR		:in std_logic_vector(4 downto 0);
	SL		:in std_logic_vector(3 downto 0);
	RR		:in std_logic_vector(3 downto 0);
	SR		:in std_logic_vector(4 downto 0);
	ENVSTATE	:out envstate_t;
	ENVLEVEL	:out std_logic_vector(15 downto 0);
	
	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);

end envtest;

architecture rtl of envtest is
signal	state	:std_logic;
signal	CURSTATE,NXTSTATE	:envstate_t;
signal	CURLEVEL,NXTLEVEL	:std_logic_vector(15 downto 0);

component envcont
port(
	KEY		:in std_logic;
	AR		:in std_logic_vector(4 downto 0);
	DR		:in std_logic_vector(4 downto 0);
	SL		:in std_logic_vector(3 downto 0);
	RR		:in std_logic_vector(3 downto 0);
	SR		:in std_logic_vector(4 downto 0);
	
	CURSTATE	:in envstate_t;
	NXTSTATE	:out envstate_t;
	
	CURLEVEL	:in std_logic_vector(15 downto 0);
	NXTLEVEL	:out std_logic_vector(15 downto 0)
);

end component;
begin
	process(clk,rstn)begin
		if falling_edge(clk) then
			if(rstn='0')then
				CURSTATE<=es_OFF;
				CURLEVEL<=(others=>'0');
				state<='0';
			elsif(ce = '1')then
				state<=not state;
				if(state='1')then
					CURSTATE<=NXTSTATE;
					CURLEVEL<=NXTLEVEL;
				end if;
			end if;
		end if;
	end process;
	
	ENVC	:envcont port map(
		KEY		=>KEY,
		AR		=>AR,
		DR		=>DR,
		SL		=>SL,
		RR		=>RR,
		SR		=>SR,
		
		CURSTATE	=>CURSTATE,
		NXTSTATE	=>NXTSTATE,
		
		CURLEVEL	=>CURLEVEL,
		NXTLEVEL	=>NXTLEVEL
	);
	ENVSTATE	<=CURSTATE;
	ENVLEVEL	<=CURLEVEL;

end rtl;
