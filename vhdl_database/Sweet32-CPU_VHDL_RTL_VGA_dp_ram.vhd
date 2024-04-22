-- from http://help.latticesemi.com/docs/webhelp/eng/wwhelp/wwhimpl/common/html/wwhelp.htm#href=Design%20Entry/inferring_ram_dual_port.htm
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
 
entity dp_ram is
generic (
	addr_width : natural;
	data_width : natural);
port (
	addra_i	: in std_logic_vector (addr_width - 1 downto 0);
	wea_i	: in std_logic;
	clka_i	: in std_logic;
	dina_i	: in std_logic_vector (data_width - 1 downto 0);
	douta_o	: out std_logic_vector (data_width - 1 downto 0);
	addrb_i	: in std_logic_vector (addr_width - 1 downto 0);
	web_i	: in std_logic;
	clkb_i	: in std_logic;
	dinb_i	: in std_logic_vector (data_width - 1 downto 0);
	doutb_o	: out std_logic_vector (data_width - 1 downto 0));
end dp_ram;
 
architecture rtl of dp_ram is
	type mem_type is array ((2** addr_width) - 1 downto 0) of 
	std_logic_vector(data_width - 1 downto 0);
	signal mem : mem_type := (others => X"02");
	attribute syn_ramstyle: string;
	attribute syn_ramstyle of mem: signal is "no_rw_check";
begin
	process (clka_i) -- Using port a.
	begin
	if (rising_edge(clka_i)) then
		if (wea_i = '1') then
		mem(conv_integer(addra_i)) <= dina_i;
			-- Using address bus a.
		end if;
		douta_o <= mem(conv_integer(addra_i));
	end if;
	end process;
	process (clkb_i) -- Using port b.
	begin
	if (rising_edge(clkb_i)) then
		if (web_i = '1') then
		mem(conv_integer(addrb_i)) <= dinb_i;
			-- Using address bus b.
		end if;
		doutb_o <= mem(conv_integer(addrb_i));
	end if;
	end process;
end rtl;
