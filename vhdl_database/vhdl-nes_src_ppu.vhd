library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity ppu is
  port (
	clk : in std_logic;
	reset : in std_logic;
    vx : in std_logic_vector(9 downto 0);
    vy : in std_logic_vector(9 downto 0);
	r_out : out std_logic_vector(3 downto 0);
	g_out : out std_logic_vector(3 downto 0);
	b_out : out std_logic_vector(3 downto 0);
	clk2 : in std_logic;
	sw	:	in std_logic_vector(17 downto 0);
	ledr	:	out std_logic_vector(17 downto 0);
	ledg	:	out std_logic_vector(7 downto 0);
	key		:	in std_logic_vector(2 downto 0);
	addr_pass	:	out std_logic_vector(15 downto 0)
	);
end ppu;

architecture behav of ppu is

--define the type
type color_rom_type is array (0 to 63) of std_logic_vector(3 downto 0);
type palette_table_type is array(0 to 31) of std_logic_vector(5 downto 0);
type line_type is array(0 to 255) of std_logic_vector(3 downto 0);
type line_type2 is array(0 to 511) of std_logic_vector(3 downto 0);
type line_bg_type is array(0 to 255) of std_logic;
type name_mirror_type is array(0 to 3) of std_logic;

--nes color map
constant r_color : color_rom_type := (
	X"7",X"2",X"2",X"6",
	X"9",X"B",X"A",X"7",
	X"4",X"3",X"3",X"3",
	X"3",X"0",X"0",X"0",
	X"B",X"4",X"4",X"9",
	X"D",X"D",X"E",X"C",
	X"8",X"5",X"4",X"4",
	X"4",X"0",X"0",X"0",
	X"F",X"6",X"5",X"A",
	X"F",X"F",X"F",X"F",
	X"E",X"9",X"7",X"7",
	X"6",X"6",X"0",X"0",
	X"F",X"9",X"A",X"C",
	X"E",X"F",X"F",X"F",
	X"F",X"C",X"A",X"A",
	X"A",X"A",X"0",X"0"
	);
	
constant g_color : color_rom_type := (
	X"7",X"0",X"0",X"1",
	X"2",X"1",X"3",X"4",
	X"5",X"6",X"6",X"6",
	X"5",X"0",X"0",X"0",
	X"B",X"6",X"4",X"4",
	X"4",X"4",X"5",X"7",
	X"8",X"A",X"A",X"A",
	X"9",X"0",X"0",X"0",
	X"F",X"A",X"8",X"7",
	X"6",X"6",X"7",X"A",
	X"D",X"E",X"F",X"E",
	X"D",X"6",X"0",X"0",
	X"F",X"D",X"B",X"B",
	X"B",X"B",X"C",X"D",
	X"F",X"F",X"F",X"F",
	X"F",X"A",X"0",X"0"
	);
	
constant b_color : color_rom_type := (
	X"7",X"B",X"B",X"A",
	X"7",X"3",X"0",X"0",
	X"0",X"0",X"0",X"4",
	X"8",X"0",X"0",X"0",
	X"B",X"F",X"F",X"F",
	X"C",X"6",X"0",X"0",
	X"0",X"0",X"1",X"6",
	X"C",X"0",X"0",X"0",
	X"F",X"F",X"F",X"F",
	X"F",X"B",X"3",X"0",
	X"2",X"0",X"4",X"9",
	X"E",X"6",X"0",X"0",
	X"F",X"F",X"F",X"F",
	X"F",X"E",X"B",X"A",
	X"9",X"8",X"A",X"C",
	X"F",X"A",X"0",X"0"
	);
	
--define the component
	component vrom is
		PORT
		(
			address_a		: IN STD_LOGIC_VECTOR (12 DOWNTO 0);
			address_b		: IN STD_LOGIC_VECTOR (12 DOWNTO 0);
			clock		: IN STD_LOGIC ;
			q_a		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
			q_b		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
		);
	end component;
	
	component rom is
		PORT
		(
			address		: IN STD_LOGIC_VECTOR (14 DOWNTO 0);
			clock		: IN STD_LOGIC ;
			q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
		);
	end component;
	
	component ram is
		PORT
		(
			address_a		: IN STD_LOGIC_VECTOR (10 DOWNTO 0);
			address_b		: IN STD_LOGIC_VECTOR (10 DOWNTO 0);
			clock		: IN STD_LOGIC ;
			data_a		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			data_b		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			wren_a		: IN STD_LOGIC;
			wren_b		: IN STD_LOGIC;
			q_a		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
			q_b		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
		);
	end component;
	
	component sram is
		PORT
		(
			address_a		: IN STD_LOGIC_VECTOR (10 DOWNTO 0);
			address_b		: IN STD_LOGIC_VECTOR (10 DOWNTO 0);
			clock		: IN STD_LOGIC ;
			data_a		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			data_b		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			wren_a		: IN STD_LOGIC;
			wren_b		: IN STD_LOGIC;
			q_a		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
			q_b		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
		);
	end component;
	
component spram IS
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		clock		: IN STD_LOGIC ;
		data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
END component;	
	
	component CPU2A03 is
		port(
				clk	:	in std_logic;
				reset	:	in std_logic;
				irq_in	:	in std_logic;
				nmi_in	:	in std_logic;
				addr	:	out std_logic_vector(15 downto 0);
				data_in	:	in std_logic_vector(7 downto 0);
				data_out	:	out std_logic_vector(7 downto 0);
				we	:	out std_logic;
				rd	:	out std_logic;
				sync	:	out std_logic
				);
	end component;	
	
	
--define the signal	
signal rom_addr : std_logic_vector(14 downto 0);
signal rom_out : std_logic_vector(7 downto 0);

signal vrom_addra : std_logic_vector(12 downto 0);
signal vrom_addrb : std_logic_vector(12 downto 0);
signal vrom_outa : std_logic_vector(7 downto 0);
signal vrom_outb : std_logic_vector(7 downto 0);

signal ram_addra : std_logic_vector(10 downto 0);
signal ram_addrb : std_logic_vector(10 downto 0);
signal ram_ina : std_logic_vector(7 downto 0);
signal ram_inb : std_logic_vector(7 downto 0);
signal ram_wea : std_logic;
signal ram_web : std_logic;
signal ram_outa : std_logic_vector(7 downto 0);
signal ram_outb : std_logic_vector(7 downto 0);

signal sram_addra : std_logic_vector(11 downto 0);
signal sram_addrb : std_logic_vector(11 downto 0);
signal sram_ina : std_logic_vector(7 downto 0);
signal sram_inb : std_logic_vector(7 downto 0);
signal sram_wea : std_logic;
signal sram_web : std_logic :='0';
signal sram_outa : std_logic_vector(7 downto 0);
signal sram_outb : std_logic_vector(7 downto 0);

signal spram_addr : std_logic_vector(7 downto 0);
signal spram_in : std_logic_vector(7 downto 0);
signal spram_we : std_logic;
signal spram_out : std_logic_vector(7 downto 0);

signal state : std_logic_vector(3 downto 0);
signal state2 : std_logic_vector(3 downto 0);
signal name_index_y : std_logic_vector(4 downto 0);
signal name_reg : std_logic_vector(7 downto 0);
signal name_reg2 : std_logic_vector(7 downto 0);

signal palette_table : palette_table_type;

signal port2000 : std_logic_vector(7 downto 0);
signal port2001 : std_logic_vector(7 downto 0);
signal port2002 : std_logic_vector(7 downto 0);

--the spirit confirm port
signal port2003 : std_logic_vector(7 downto 0);
signal port2004 : std_logic_vector(7 downto 0);

--the scroll confirm port
signal port2005_d : std_logic;
signal port2005_y : std_logic_vector(7 downto 0);
signal port2005_x : std_logic_vector(7 downto 0);
signal port2005_x_reg : std_logic_vector(7 downto 0);

signal port2006_d : std_logic;
signal port2006_h : std_logic_vector(7 downto 0);
signal port2006_h_reg : std_logic_vector(7 downto 0);
signal port2006_l : std_logic_vector(7 downto 0);

signal port2007 : std_logic_vector(7 downto 0);
signal port2007_rd : std_logic;

signal cpu_clk : std_logic;
signal nmi_reg : std_logic;
signal irq_reg : std_logic;
signal addr_reg : std_logic_vector(15 downto 0);
signal data_in : std_logic_vector(7 downto 0);
signal data_out : std_logic_vector(7 downto 0);
signal rd : std_logic;
signal we : std_logic;
signal sync : std_logic;
signal rom_select : std_logic_vector(1 downto 0);

signal cpu_sp_index : std_logic_vector(7 downto 0);

signal data_reg : std_logic_vector(7 downto 0);
signal is_first : std_logic;
signal joy1_state : std_logic_vector(3 downto 0);
signal port2002_rd : std_logic;
signal spi_point : std_logic_vector(2 downto 0);
signal port2007_reg : std_logic_vector(7 downto 0);
signal port2007_tmp : std_logic_vector(7 downto 0);
signal yv : std_logic_vector(7 downto 0);
signal yv_n : integer range 0 to 511;
signal is_scan : std_logic_vector(1 downto 0);
signal sp_ram : std_logic_vector(2 downto 0);
signal sp_ram_reg : std_logic_vector(2 downto 0);
signal sprite0 : std_logic_vector(7 downto 0);
signal sram_addra_reg : std_logic_vector(11 downto 0);
signal myclk : std_logic;
signal dma_on : std_logic;

signal name_mirror : name_mirror_type;
signal spiline : line_type;
signal bakline : line_type;
signal spiline_bg : line_bg_type;

begin

sram_web<='0';
sram_inb<="00000000";
ram_web<='0';
ram_inb<="00000000";

rom1 : rom port map(rom_addr,clk2,rom_out);
vrom1 : vrom port map(vrom_addra,vrom_addrb,clk2,vrom_outa,vrom_outb);
spram1 : spram port map(spram_addr,clk2,spram_in,spram_we,spram_out);
ram1 : ram port map(ram_addra,ram_addrb,clk2,ram_ina,ram_inb,ram_wea,ram_web,ram_outa,ram_outb);
sram1 : sram port map(name_mirror(conv_integer(sram_addra(11 downto 10)))&sram_addra(9 downto 0),name_mirror(conv_integer(sram_addrb(11 downto 10)))&sram_addrb(9 downto 0),clk2,sram_ina,sram_inb,sram_wea,sram_web,sram_outa,sram_outb);
cpu1 : CPU2A03 port map(myclk,not reset,irq_reg,nmi_reg,addr_reg,data_in,data_out,we,rd,sync);

--divide the clk to 3Mhz
	process(clk,reset)
	variable temp : std_logic_vector(3 downto 0);
	variable temp2 : std_logic_vector(3 downto 0);
	begin
		if reset='0' then
			temp:="0000";
		elsif clk'event and clk='1' then
			temp2:=sw(3)&sw(2)&sw(1)&sw(0);
			temp:=temp+1;
			if temp=temp2 then
				if sw(13)='0' then
					cpu_clk<=not cpu_clk;
				end if;
				temp:="0000";
			end if;
		end if;
	end process;
	
	process(clk2)
	begin
	if clk2'event and clk2='1' then
		myclk<=cpu_clk and (not dma_on);
		name_mirror(0)<=sw(17);
		name_mirror(1)<=sw(16);
		name_mirror(2)<=sw(15);
		name_mirror(3)<=sw(14);
	end if;
	end process;

--the cpu memory map
	process(addr_reg,rd,we,sync)
		variable temp : std_logic_vector(8 downto 0);
	begin
		if myclk'event and myclk='0' then
			rom_select<="10";
			ram_wea<='0';
			sram_wea<='0';
			port2002_rd<='0';
			sram_addra<=sram_addra_reg;

			case addr_reg(15 downto 13) is
			when "000" =>
				--address is from 0x0000 to 0x1fff
				ram_addra<=addr_reg(10 downto 0);
				ram_ina<=data_out;
				ram_wea<=we;
				rom_select<="00";
			when "001" =>
				--address is from 0x2000 to 0x2007
				case addr_reg(2 downto 0) is
				when "000" =>
					if we='1' then
						port2000<=data_out;
					elsif rd='1' then
						data_reg<=port2000;
						rom_select<="10";
					end if;
				when "001" =>
					if we='1' then
						port2001<=data_out;
					elsif rd='1' then
						data_reg<=port2001;
						rom_select<="10";
					end if;
				when "010" =>
					if rd='1' then
						data_reg<=port2002;
						port2005_d<='0';
						port2006_d<='0';
						port2002_rd<='1';
						rom_select<="10";
					end if;
				when "011" =>
					if we='1' then
						cpu_sp_index<=data_out;
					end if;
				when "100" =>
						ram_addra<=sp_ram&cpu_sp_index;
						ram_ina<=data_out;
						ram_wea<=we;
						cpu_sp_index<=cpu_sp_index+1;
						rom_select<="00";
				when "101" =>
					if we='1' then
						if port2005_d='0' then
							port2005_d<='1';
							port2005_x<=data_out;
						else
							port2005_d<='0';
							port2005_y<=data_out;
						end if;
					end if;
				when "110" =>
					if we='1' then
						if port2005_d='0' then
							port2006_h_reg<=data_out;
							port2005_d<='1';
							port2000(1 downto 0)<=port2006_h_reg(3 downto 2);
						else
							port2005_d<='0';
							port2006_l<=data_out;
							port2006_h<=port2006_h_reg;
							port2005_x(7 downto 3)<=data_out(4 downto 0);
							port2005_y(7 downto 3)<=port2006_h_reg(1 downto 0)&data_out(7 downto 5);
							port2000(1 downto 0)<=port2006_h_reg(3 downto 2);
						end if;
					end if;
				when "111" =>
					if we='1' then
						if port2006_h(5 downto 4) = "10" then
							sram_addra<=port2006_h(3 downto 0)&port2006_l;
							sram_wea<=we;
							sram_ina<=data_out;
						elsif port2006_h(5 downto 4) = "11" then
							if port2006_h(3 downto 0)="1111" then
								if (port2006_l(2 downto 0)=0) then
									palette_table(0)<=data_out(5 downto 0);
								else
									palette_table(conv_integer(port2006_l(4 downto 0)))<=data_out(5 downto 0);
								end if;
							else
								sram_addra<=port2006_h(3 downto 0)&port2006_l;
								sram_wea<=we;
								sram_ina<=data_out;
							end if;
						end if;
					elsif rd='1' then
						if port2006_h(5 downto 4) = "10" then
							port2007_reg<=sram_outa;
							sram_addra<=port2006_h(3 downto 0)&port2006_l;
							sram_addra_reg<=port2006_h(3 downto 0)&port2006_l;
							rom_select<="11";
						elsif port2006_h(5 downto 4) = "11" then
							if port2006_h(3 downto 0)="1111" then
								data_reg<="00"&palette_table(conv_integer(port2006_l(4 downto 0)));
								rom_select<="10";
							else
								port2007_reg<=sram_outa;
								sram_addra<=port2006_h(3 downto 0)&port2006_l;
								sram_addra_reg<=port2006_h(3 downto 0)&port2006_l;
								rom_select<="11";
							end if;
						end if;
					end if;
					if port2000(2)='0' then
						temp:='0'&port2006_l+1;
						port2006_l<=temp(7 downto 0);
						port2006_h<=temp(8)+port2006_h;
					else
						temp:='0'&port2006_l+32;
						port2006_l<=temp(7 downto 0);
						port2006_h<=temp(8)+port2006_h;
					end if;
				end case;
								
			when "010" =>
				--address is from 0x4000 to 0x4017
				if addr_reg(12 downto 0)="0000000010100" then
					if we='1' then
						sp_ram<=data_out(2 downto 0);
					end if;
				elsif addr_reg(12 downto 0)="0000000010110" then
					if rd='1' then
						rom_select<="10";
						data_reg(1)<='0';
						data_reg(7 downto 6)<="01";
						case joy1_state is
						when "0000" =>
							data_reg(0)<=sw(5);
							joy1_state<="0001";
						when "0001" =>
							data_reg(0)<=sw(6);
							joy1_state<="0010";
						when "0010" =>
							data_reg(0)<=sw(7);
							joy1_state<="0011";
						when "0011" =>
							data_reg(0)<=sw(8);
							joy1_state<="0100";
						when "0100" =>
							data_reg(0)<=sw(9);
							joy1_state<="0101";
						when "0101" =>
							data_reg(0)<=sw(10);
							joy1_state<="0110";
						when "0110" =>
							data_reg(0)<=sw(11);
							joy1_state<="0111";
						when "0111" =>
							data_reg(0)<=sw(12);
							joy1_state<="0000";
						when others=>
						end case;
					elsif we='1' then
						joy1_state<="0000";
					end if;
				end if;
						
				
			when "011" =>
				--not used
			when others =>
				--address is from 0x8000 to 0xffff
				if rd='1' then
					rom_addr<=addr_reg(14 downto 0);
					rom_select<="01";
				end if;
			end case;
			palette_table(4)<=palette_table(0);
			palette_table(8)<=palette_table(0);
			palette_table(12)<=palette_table(0);
			palette_table(16)<=palette_table(0);
			palette_table(20)<=palette_table(0);
			palette_table(24)<=palette_table(0);
			palette_table(28)<=palette_table(0);
		end if;
	end process;

	process(clk2,rom_select)
	begin
		if clk2'event and clk2='1' then
			case rom_select is
			when "00" =>
				data_in<=ram_outa;
			when "01" =>
				data_in<=rom_out;
			when "10" =>
				data_in<=data_reg;
			when "11" =>
				data_in<=port2007_reg;
			end case;
		end if;
	end process;

--draw the scanline
process(clk)
	variable temp1 : std_logic_vector(3 downto 0);
	variable temp2 : std_logic_vector(5 downto 0);
	variable temp4 : std_logic_vector(3 downto 0);
	variable temp3 : std_logic_vector(7 downto 0);
begin
	if clk'event and clk='1' then
	if vy<yv_n and vx<256 then
		if vy=0 and vx=0 then
			port2002(6)<='0';
		end if;
		if port2001(3)='1' then
			temp1:=bakline(conv_integer(vx(7 downto 0)));
			if temp1(1 downto 0)>0 then
				temp2:=palette_table(conv_integer('0'&temp1));
			else
				temp2:=palette_table(0);
			end if;
			temp4:=spiline(conv_integer(vx(7 downto 0)));	
			if port2001(4)='1' then
				if spiline_bg(conv_integer(vx(7 downto 0)))='0' then
					if temp4(1 downto 0)>0 then
						temp2:=palette_table(conv_integer('1'&temp4));
					else
						temp2:=palette_table(conv_integer('0'&temp1));
					end if;
				else
					if temp1(1 downto 0)=0 then
						temp2:=palette_table(conv_integer('1'&temp4));
					else
						temp2:=palette_table(conv_integer('0'&temp1));
					end if;
				end if;
				temp3:=vx(7 downto 0)-sprite0;
				if temp3<8 then
					if temp1(1 downto 0)>0 and temp4(1 downto 0)>0 then
						port2002(6)<='1';
					end if;
				end if;
			end if;
			
			r_out<=r_color(conv_integer(temp2));
			g_out<=g_color(conv_integer(temp2));
			b_out<=b_color(conv_integer(temp2));
		else
			r_out<=(others=>'0');
			g_out<=(others=>'0');
			b_out<=(others=>'0');
		end if;
	else
		r_out<=(others=>'0');
		g_out<=(others=>'0');
		b_out<=(others=>'0');
	end if;
	end if;
end process;

--draw the background
	process(clk,reset,vx,vy)
		variable name_index_y_l,name_index_x_l : std_logic_vector(5 downto 0);
		variable vvy : std_logic_vector(7 downto 0);
		variable bakline_reg : line_type2;
		variable trans : integer range 0 to 255;
		variable temp : std_logic_vector(1 downto 0);
	begin
		if clk'event and clk='1' then
		if vy<yv_n then
			vvy:=yv+port2005_y(2 downto 0);
			name_index_y<=vvy(7 downto 3);
			case state is
			when "0000" =>
				if vx=0 then
					state<="0001";
					name_index_x_l:=(others=>'0');
				end if;
			when "0001" =>
				trans:=0;
				name_index_y_l:=port2000(1)&name_index_y+port2005_y(7 downto 3);
				if name_index_y_l>29 then
					name_index_y_l:=name_index_y_l+2;
				end if;
				sram_addrb<=name_index_y_l(5)&name_index_x_l(5)&name_index_y_l(4 downto 0)&name_index_x_l(4 downto 0);
				state<="0010";
			when "0010" =>
				vrom_addrb<=port2000(4)&sram_outb&'0'&vvy(2 downto 0);
				state<="0011";
			when "0011" =>
				vrom_addrb<=port2000(4)&sram_outb&'1'&vvy(2 downto 0);
				sram_addrb<=name_index_y_l(5)&name_index_x_l(5)&"1111"&name_index_y_l(4 downto 2)&name_index_x_l(4 downto 2);
				name_reg<=vrom_outb;
				state<="0100";
			when "0100" =>
				temp:=sram_outb(conv_integer(name_index_y_l(1)&name_index_x_l(1)&'1'))&sram_outb(conv_integer(name_index_y_l(1)&name_index_x_l(1)&'0'));
				bakline_reg(conv_integer(name_index_x_l&"000")):=temp&vrom_outb(7)&name_reg(7);
				bakline_reg(conv_integer(name_index_x_l&"001")):=temp&vrom_outb(6)&name_reg(6);
				bakline_reg(conv_integer(name_index_x_l&"010")):=temp&vrom_outb(5)&name_reg(5);
				bakline_reg(conv_integer(name_index_x_l&"011")):=temp&vrom_outb(4)&name_reg(4);
				bakline_reg(conv_integer(name_index_x_l&"100")):=temp&vrom_outb(3)&name_reg(3);
				bakline_reg(conv_integer(name_index_x_l&"101")):=temp&vrom_outb(2)&name_reg(2);
				bakline_reg(conv_integer(name_index_x_l&"110")):=temp&vrom_outb(1)&name_reg(1);
				bakline_reg(conv_integer(name_index_x_l&"111")):=temp&vrom_outb(0)&name_reg(0);
				if name_index_x_l="111111" then 
					state<="0101";
					name_index_x_l:="000000";
				else
					name_index_x_l:=name_index_x_l+1;
					state<="0001";
				end if;
			when "0101" =>
				if vx>240 then 
					if trans<255 then
						bakline(trans)<=bakline_reg(trans+conv_integer(port2000(0)&port2005_x));
						trans:=trans+1;
					else
						state<="0000";
					end if;
				end if;
			when others=>
			end case;
		end if;		
		end if;
	end process;

	
process(clk,vy)
begin
	if clk'event and clk='1' then
		if vy<yv_n then
			nmi_reg<='0';
			is_scan(0)<='1';
			is_scan(1)<=is_scan(0);
		else
			is_scan(0)<='0';
			is_scan(1)<=is_scan(0);
			if port2000(7)='1' then
				nmi_reg<='1';
			else
				nmi_reg<='0';
			end if;
		end if;
	end if;
end process;

process(clk2)
begin
	if clk2'event and clk2='1' then
		if sw(4)='1' then
			yv<=vy(7 downto 0);
			yv_n<=240;
		else
			yv<=vy(8 downto 1);
			yv_n<=480;
		end if;
	end if;
end process;

--draw the sprite
process(clk)
	variable spi_num : std_logic_vector(3 downto 0);
	variable sp_index : std_logic_vector(5 downto 0);
	variable temp : std_logic_vector(7 downto 0);
	variable temp2 : std_logic_vector(7 downto 0);
	variable temp3 : std_logic_vector(3 downto 0);
	variable temp4 : std_logic_vector(3 downto 0);
	variable attrib : std_logic_vector(7 downto 0);
	variable spiline_reg : line_type;
	variable spiline_bg_reg : line_bg_type;
	variable sprnum : integer range 0 to 7;
	variable sprite0_reg : std_logic_vector(7 downto 0);
	variable trans : integer range 0 to 255;
	variable dma : std_logic;
	variable dma_num : std_logic_vector(7 downto 0);
begin
	if clk'event and clk='1' then
	if vy<yv_n then
		case state2 is
		when "0000" =>
			if vx=0 then
				state2<="0001";
				sp_index:=(others=>'1');
				spram_addr<=sp_index&"00";
				spi_num:="0000";
				spiline_reg:=(OTHERS => (OTHERS => '0'));
				port2002(5)<='0';
				sprite0_reg:=(others=>'1');
			end if;
		when "0001" =>
			trans:=0;
			sprite0_reg:="00000000";
			temp:=yv-spram_out;
			if port2000(5)='0' then
				if temp<8 then
					spram_addr<=sp_index&"01";
					state2<="0010";
				else
					if sp_index="000000" then
						state2<="1000";
					else
						sp_index:=sp_index-1;
						spram_addr<=sp_index&"00";
						state2<="0001";
					end if;
				end if;
			else
				if temp<16 then
					spram_addr<=sp_index&"01";
					state2<="0011";
				else
					if sp_index="000000" then
						state2<="1000";
					else
						sp_index:=sp_index-1;
						spram_addr<=sp_index&"00";
						state2<="0001";
					end if;
				end if;
			end if;
		when "0010" =>
			temp2:=spram_out;
			spram_addr<=sp_index&"10";
			state2<="0100";
		when "0011" =>
			temp2:=spram_out;
			spram_addr<=sp_index&"10";
			state2<="0101";
		when "0100" =>
			attrib:=spram_out;
			if attrib(7)='0' then
				vrom_addra<=port2000(3)&temp2&'0'&temp(2 downto 0);
			else
				temp(2 downto 0):=not temp(2 downto 0);
				vrom_addra<=port2000(3)&temp2&'0'&temp(2 downto 0);
			end if;
			if spi_num(3)='0' then
				state2<="0110";
				spi_num:=spi_num+1;
			else
				state2<="1000";
				port2002(5)<='1';
			end if;
		when "0101" =>
			attrib:=spram_out;
			if attrib(7)='0' then
				vrom_addra<=temp2(0)&temp2(7 downto 1)&temp(3)&'0'&temp(2 downto 0);
			else
				temp(2 downto 0):=not temp(2 downto 0);
				vrom_addra<=temp2(0)&temp2(7 downto 1)&temp(3)&'0'&temp(2 downto 0);
			end if;
			if spi_num(3)='0' then
				state2<="0110";
				spi_num:=spi_num+1;
			else
				state2<="1000";
				port2002(5)<='1';
			end if;
		when "0110" =>
			name_reg2<=vrom_outa;
			if port2000(5)='0' then
				vrom_addra<=port2000(3)&temp2&'1'&temp(2 downto 0);
			else
				vrom_addra<=temp2(0)&temp2(7 downto 1)&temp(3)&'1'&temp(2 downto 0);
			end if;
			state2<="0111";
			spram_addr<=sp_index&"11";
			sprnum:=0;
		when "0111" =>
			temp:=spram_out+sprnum;
			temp3:=attrib(1 downto 0)&vrom_outa(sprnum)&name_reg2(sprnum);
			temp4:=attrib(1 downto 0)&vrom_outa(7-sprnum)&name_reg2(7-sprnum);
			if attrib(6)='1' then
				if temp3(1 downto 0)>0 then
					spiline_reg(conv_integer(temp)):=temp3;
				end if;
			else
				if temp4(1 downto 0)>0 then
					spiline_reg(conv_integer(temp)):=temp4;
				end if;
			end if;
			spiline_bg_reg(conv_integer(temp)):=attrib(5);
			if sprnum=7 then
				if sp_index="000000" then
					state2<="1000";
					sprite0_reg:=spram_out;
				else
					sp_index:=sp_index-1;
					spram_addr<=sp_index&"00";
					state2<="0001";
				end if;
			else
				sprnum:=sprnum+1;
				state2<="0111";
			end if;
		when "1000" =>
			if vx>256 then
				if trans<255 then
					spiline(trans)<=spiline_reg(trans);
					spiline_bg(trans)<=spiline_bg_reg(trans);
					trans:=trans+1;
				else
					state2<="0000";
					sprite0<=sprite0_reg;
				end if;
			end if;
		when others=>
		end case;
		dma:='1';
	else
		if dma='1' then
			dma_on<='1';
			dma:='0';
			dma_num:="00000000";
			ram_addrb<=sp_ram&dma_num;
		end if;
		if dma_on='1' then
			spram_addr<=dma_num;
			spram_we<='1';
			spram_in<=ram_outb;
			if dma_num<255 then
				dma_num:=dma_num+1;
			else
				dma_on<='0';
				spram_we<='0';
			end if;
			ram_addrb<=sp_ram&dma_num;
		end if;
	
	end if;
	end if;
end process;

process(clk)
begin
	if clk'event and clk='1' then
		if is_scan="10" then
			port2002(7)<='1';
		elsif is_scan="01" then
			port2002(7)<='0';
		elsif port2002_rd='1' then
			port2002(7)<='0';
		end if;
	end if;
end process;

end;