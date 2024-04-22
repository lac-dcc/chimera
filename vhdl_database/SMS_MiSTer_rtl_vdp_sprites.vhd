library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

entity vdp_sprites is
	generic (
		MAX_SPPL : integer := 7
	);
port (
	clk_sys			: in  STD_LOGIC;
	ce_vdp			: in  STD_LOGIC;
	ce_pix			: in  STD_LOGIC;
	ce_sp				: in  STD_LOGIC;
	sp64				: in  std_logic;
	table_address	: in  STD_LOGIC_VECTOR (13 downto 7);
	char_high_bits	: in  std_logic_vector (2 downto 0);
	tall				: in  std_logic;
	wide 				: in  std_logic;
	shift				: in  std_logic;
	smode_M1			: in	std_logic ;
	smode_M3			: in	std_logic ;
	smode_M4			: in	std_logic ;
	vram_A			: out STD_LOGIC_VECTOR (13 downto 0);
	vram_D			: in  STD_LOGIC_VECTOR (7 downto 0);
	x					: in  STD_LOGIC_VECTOR (8 downto 0);
	y					: in  STD_LOGIC_VECTOR (8 downto 0);
	collide			: out std_logic;
	overflow			: out std_logic;
	color				: out STD_LOGIC_VECTOR (3 downto 0));
end vdp_sprites;

architecture Behavioral of vdp_sprites is

	constant WAITING:	std_logic_vector := "000";
	constant COMPARE:	std_logic_vector := "001";
	constant LOAD_N:	std_logic_vector := "010";
	constant LOAD_X:	std_logic_vector := "011";
	constant LOAD_0:	std_logic_vector := "100";
	constant LOAD_1:	std_logic_vector := "101";
	constant LOAD_2:	std_logic_vector := "110";
	constant LOAD_3:	std_logic_vector := "111";

	signal state:		std_logic_vector(2 downto 0) := WAITING;
	signal count:		integer range 0 to 64;
	signal index:		std_logic_vector(5 downto 0);
	signal data_address: std_logic_vector(13 downto 0);
	signal ce_spload:	std_logic;
	signal m2_flags:  std_logic_vector(7 downto 0);

	type tenable	is array (0 to MAX_SPPL) of boolean;
	type tx			is array (0 to MAX_SPPL) of std_logic_vector(7 downto 0);
	type tdata		is array (0 to MAX_SPPL) of std_logic_vector(7 downto 0);
	signal enable:	tenable;
	signal spr_x:	tx;
	signal spr_d0:	tdata;
	signal spr_d1:	tdata;
	signal spr_d2:	tdata;
	signal spr_d3:	tdata;

	type tcolor is array (0 to MAX_SPPL) of std_logic_vector(3 downto 0);
	signal spr_color:	tcolor;
	signal spr_active:	std_logic_vector(0 to MAX_SPPL);
	
begin
	shifters:
	for i in 0 to MAX_SPPL generate
	begin
		shifter: entity work.vpd_sprite_shifter
		port map(
			clk_sys=> clk_sys,
			ce_pix=> ce_pix,
			x		=> x(7 downto 0),
			spr_x	=> spr_x(i),
			-- as we pass only 8 bits for the x address, we need to make the difference
			-- between x=255 and x=511 in some way inside the shifters, or we'll have spurious
			-- signals difficult to filter outside them. The compare operators are kept
			-- outside the module to avoid to have them duplicated 64 times.
			load  => shift='0' and x<256, --load range
			x248  => shift='1' and (x<248 or x>=504) and smode_M4='1', --load range for shifted sprites
			x224  => smode_M4='0' and (x<223 or x>=480), -- load range for shifted mode2 spr
			m4 => smode_M4='1',
			wide_n	=> wide='0',
			spr_d0=> spr_d0(i),
			spr_d1=> spr_d1(i),
			spr_d2=> spr_d2(i),
			spr_d3=> spr_d3(i),
			color => spr_color(i),
			active=> spr_active(i)
		);

	end generate;

	with smode_M4 & state select
	vram_a <=	table_address&index(4 downto 0)&"00"	when '0' & COMPARE,
					table_address&index(4 downto 0)&"10"	when '0' & LOAD_N,
					table_address&index(4 downto 0)&"01"	when '0' & LOAD_X,
					table_address&index(4 downto 0)&"11"	when '0' & LOAD_0,
					data_address									when '0' & LOAD_1,
					data_address									when '0' & LOAD_2,
					
					table_address(13 downto 8)&"00"&index		when '1' & COMPARE,
					table_address(13 downto 8)&"1"&index&"1"	when '1' & LOAD_N,
					table_address(13 downto 8)&"1"&index&"0"	when '1' & LOAD_X,
					data_address(13 downto 2)&"00"				when '1' & LOAD_0,
					data_address(13 downto 2)&"01"				when '1' & LOAD_1,
					data_address(13 downto 2)&"10"				when '1' & LOAD_2,
					data_address(13 downto 2)&"11"				when '1' & LOAD_3,
					
					(others=>'0') when others;

	ce_spload <= ce_vdp when (MAX_SPPL<8 or sp64='0') else ce_sp;
	
	process (clk_sys)
		variable y9 	: std_logic_vector(8 downto 0);
		variable d9		: std_logic_vector(8 downto 0);
		variable delta : std_logic_vector(8 downto 0);
	begin
		if rising_edge(clk_sys) then
			if ce_spload='1' then
			
				if x=257 then  -- we need step 256 to display the very last sprite pixel
									-- and one more pixel because the test here is made sync'ed
									-- by ce_spload which could be very early regarding ce_vdp
					count <= 0;
					enable <= (others=>false);
					state <= COMPARE;
					index <= (others=>'0');
					overflow <= '0';
				
				elsif x=496 then  --match vdp_main.vhd (384)
					state <= WAITING;
					
				else
					y9 := y;
					d9 := "0"&vram_D;
					if d9>=240 then
						d9 := d9-256;
					end if;
					delta := y9-d9;
					--overflow <= '0';
					
					case smode_M4 & state is
					when '1' & COMPARE =>
						if d9=208 and smode_M1='0' and smode_M3='0' then  -- hD0 stops only in 192 mode
							state <= WAITING; -- stop
					--	elsif delta(8 downto 4)="00000" and (delta(3)='0' or tall='1' or wide='1') then
						elsif delta(8 downto 5)="0000" and 
								(delta(4)='0' or (tall='1' and wide='1')) and
								(delta(3)='0' or tall='1' or wide='1') then
							if (wide='1') then
								data_address(5 downto 2) <= delta(4 downto 1);
							else
								data_address(5 downto 2) <= delta(3 downto 0);
							end if;
							if (count>=8 and ( y<192 or (y<224 and smode_M1='1') or (y<240 and smode_M3='1') ) ) then
								overflow <= '1';
							end if;
							if ((count<MAX_SPPL+1) and (count<8 or sp64='1')) then
								state <= LOAD_N;
							else
								state <= WAITING;
							end if;
						else
							if index<63 then
								index <= index+1;
							else
								state <= WAITING;
							end if;
						end if;
						
					when '1' & LOAD_N =>
						data_address(13) <= char_high_bits(2);
						data_address(12 downto 6) <= vram_d(7 downto 1);
						if tall='0' -- or wide='1' 
						then
							data_address(5) <= vram_d(0);
						end if;
						state <= LOAD_X;
						
					when '1' & LOAD_X =>
						spr_x(count)	<= vram_d-1;
						state <= LOAD_0;
						
					when '1' & LOAD_0 =>
						spr_d0(count)	<= vram_d;
						state	<= LOAD_1;
						
					when '1' & LOAD_1 =>
						spr_d1(count)	<= vram_d;
						state	<= LOAD_2;
						
					when '1' & LOAD_2 =>
						spr_d2(count)	<= vram_d;
						state	<= LOAD_3;
						
					when '1' & LOAD_3 =>
						spr_d3(count)	<= vram_d;
						enable(count)	<= true;
						state	<= COMPARE;
						index	<= index+1;
						count	<= count+1;
						
					-- mode 2  -----------
	
					when '0' & COMPARE =>
						if d9=208 then
							state <= WAITING ;
						elsif delta(8 downto 5)="0000" and 
								(delta(4)='0' or (tall='1' and wide='1')) and
								(delta(3)='0' or tall='1' or wide='1') then
							data_address(13 downto 11) <= char_high_bits;
							if (wide='1') then
								data_address(3 downto 0) <= delta(4 downto 1);
							else
								data_address(3 downto 0) <= delta(3 downto 0);
							end if;	
							if ((count<32) and (count<4 or sp64='1')) then
								state <= LOAD_N;
							else
								state <= WAITING;
							end if;
						else
							if index<31 then
								index <= index+1;
							else
								state <= WAITING;
							end if;
						end if;
						
					when '0' & LOAD_N =>
						if tall='1' then
							data_address(10 downto 4) <= vram_d(7 downto 1); -- quadrant C
						else
							data_address(10 downto 3) <= vram_d; -- quadrant A
						end if;
						state <= LOAD_0;

					when '0' & LOAD_0 =>
						--if (delta(3)='1') then
						--	data_address <= data_address+8 ;
						--end if;
						m2_flags	<= vram_d;
						state <= LOAD_X;

					when '0' & LOAD_X =>
						if m2_flags(7)='0' then
							spr_x(count)	<= vram_d-1;
						else
							spr_x(count)	<= vram_d-33;
						end if;
						state <= LOAD_1;
						
					when '0' & LOAD_1 =>
						-- in m2 mode, spr_d0 & 1 contains 16-bit shift data
						-- and color goes to spr_d3
						spr_d0(count) <= vram_d;
						spr_d1(count) <= (others => '0');
						spr_d2(count) <= (others => '0');
						spr_d3(count) <= m2_flags;
						data_address(10 downto 4) <= data_address(10 downto 4)+1 ; -- quadrants B & D
						state	<= LOAD_2 ;
						
					when '0' & LOAD_2 =>
						if tall='1' then
							spr_d1(count) <= vram_d ;
						end if;
						enable(count)	<= true;
						state	<= COMPARE;
						index	<= index+1;
						count	<= count+1;
							
					when others =>
					end case;
				end if;
			end if;
		end if;
	end process;

	process (clk_sys)
		variable collision 	: std_logic_vector(7 downto 0);
	begin
		if rising_edge(clk_sys) then
			if ce_pix='1' then  -- ce_vdp?? 
				color <= (others=>'0');
				collision := (others=>'0');
				for i in MAX_SPPL downto 8 loop
					if enable(i) and spr_active(i)='1' then -- and not (spr_color(i)="0000") then
						color <= spr_color(i);
					end if;
				end loop;
				for i in 7 downto 0 loop
					if enable(i) and spr_active(i)='1' then -- and not (spr_color(i)="0000") then
						collision(i) := '1';
						color <= spr_color(i);
					end if;
				end loop;
				case collision is
				when x"00" | x"01" | x"02" | x"04" | x"08" | x"10" | x"20" | x"40" | x"80" =>
					collide <= '0';	
				when others =>
					if ( y<192 or (y<224 and smode_M1='1') or (y<240 and smode_M3='1') or y(8) = '1' ) then
						collide <= '1';
					else
						collide <= '0';
					end if;
				end case;
			end if;
		end if;
	end process;

end Behavioral;

