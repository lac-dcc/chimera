library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity spritec is
port(
	hres	:in std_logic;
	bgen	:in std_logic_vector(1 downto 0);
	bg0asel	:in std_logic;
	bg1asel	:in std_logic;
	spren	:in std_logic;

	hcomp	:in std_logic;
	linenum	:in std_logic_vector(8 downto 0);
	bg0hoff	:in std_logic_vector(9 downto 0);
	bg0voff	:in std_logic_vector(9 downto 0);
	bg1hoff	:in std_logic_vector(9 downto 0);
	bg1voff	:in std_logic_vector(9 downto 0);

	sprno	:out std_logic_vector(6 downto 0);
	sprxpos	:in std_logic_vector(9 downto 0);
	sprypos	:in std_logic_vector(9 downto 0);
	sprVR	:in std_logic;
	sprHR	:in std_logic;
	sprCOLOR:in std_logic_vector(3 downto 0);
	sprPAT	:in std_logic_vector(7 downto 0);
	sprPRI	:in std_logic_vector(1 downto 0);

	bgaddr	:out std_logic_vector(12 downto 0);
	bgVR	:in std_logic;
	bgHR	:in std_logic;
	bgCOLOR	:in std_logic_vector(3 downto 0);
	bgPAT	:in std_logic_vector(7 downto 0);

	patno	:out std_logic_vector(9 downto 0);
	dotx	:out std_logic_vector(2 downto 0);
	doty	:out std_logic_vector(2 downto 0);
	dotin	:in std_logic_vector(3 downto 0);

	rdaddr	:in std_logic_vector(8 downto 0);
	dotout	:out std_logic_vector(7 downto 0);

	debugsel	:in std_logic_vector(1 downto 0)	:="11";

	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end spritec;

architecture rtl of spritec is
signal	change		:std_logic;
signal	proc_begin	:std_logic;

signal	bg_x	:std_logic_vector(8 downto 0);
signal	bg_xd	:std_logic_vector(8 downto 0);
signal	bg_asel	:std_logic;
signal	bgaddrr0:std_logic_vector(12 downto 0);
signal	bgaddrr1:std_logic_vector(12 downto 0);
signal	bg_xmod	:std_logic_vector(9 downto 0);
signal	bg_xmodd:std_logic_vector(9 downto 0);
signal	bg_xmodd1:std_logic_vector(9 downto 0);
signal	bg_ymod	:std_logic_vector(9 downto 0);
signal	bg_pat	:std_logic_vector(7 downto 0);
signal	bg_patx	:std_logic_vector(3 downto 0);
signal	bg_paty	:std_logic_vector(3 downto 0);
signal	bg_patno	:std_logic_vector(9 downto 0);
signal	bg_patnolsb	:std_logic_vector(1 downto 0);
signal	bg_patsub	:std_logic_vector(1 downto 0);
signal	bg_dotx		:std_logic_vector(2 downto 0);
signal	bg_doty		:std_logic_vector(2 downto 0);
signal	bg_waddr	:std_logic_vector(8 downto 0);
signal	bgCOLORd	:std_logic_vector(3 downto 0);
signal	bg0wr	:std_logic;
signal	bg1wr	:std_logic;
signal	bg0rdat	:std_logic_vector(7 downto 0);
signal	bg1rdat	:std_logic_vector(7 downto 0);
signal	sp1rdat	:std_logic_vector(7 downto 0);
signal	sp2rdat	:std_logic_vector(7 downto 0);
signal	sp3rdat	:std_logic_vector(7 downto 0);

signal	sp_clr	:std_logic;
signal	sp_no	:std_logic_vector(6 downto 0);
signal	sp_linenum	:std_logic_vector(9 downto 0);
signal	sp_xpos	:std_logic_vector(3 downto 0);
signal	sp_ypos	:std_logic_vector(3 downto 0);
signal	sp_xposd:std_logic_vector(3 downto 0);
signal	sp_dotx	:std_logic_vector(2 downto 0);
signal	sp_doty	:std_logic_vector(2 downto 0);
signal	sp_patno	:std_logic_vector(9 downto 0);
signal	sp_patnolsb	:std_logic_vector(1 downto 0);
signal	sp_patsub	:std_logic_vector(1 downto 0);
signal	sprCOLORd	:std_logic_vector(3 downto 0);
signal	sp1_wr,sp2_wr,sp3_wr	:std_logic;
signal	sp_wr	:std_logic;
signal	sp_waddrsub	:std_logic_vector(9 downto 0);
signal	sp_waddr	:std_logic_vector(9 downto 0);
signal	sp_waddrd	:std_logic_vector(8 downto 0);
signal	sp_maddr	:std_logic_vector(8 downto 0);
signal	sp_wren	:std_logic;

constant lastx	:std_logic_vector(8 downto 0)	:=(others=>'1');
constant lastspno:std_logic_vector(6 downto 0)	:=(others=>'0');
type state_t is(
	st_IDLE,
	st_BG0,
	st_BG1,
	st_SPRITE
);
signal	state	:state_t;
type sprite_state_t is(
	sp_IDLE,
	sp_setno,
	sp_check,
	sp_copy,
	sp_END
);
signal	sp_state	:sprite_state_t;
type bg_state_t is(
	bg_IDLE,
	bg_BUSY,
	bg_END
);
signal	bg_state	:bg_state_t;

component sline
port(
	wraddr	:in std_logic_vector(8 downto 0);
	wrdat	:in std_logic_vector(7 downto 0);
	wr		:in std_logic;
	clr		:in std_logic;
	change	:in std_logic;
	rdaddr	:in std_logic_vector(8 downto 0);
	rddat	:out std_logic_vector(7 downto 0);

	clk		:in std_logic;
	ce      :in std_logic := '1';
	rstn	:in std_logic
);
end component;

begin
	--change<=hcomp;
	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				state<=st_IDLE;
				proc_begin<='0';
			elsif(ce = '1')then
				proc_begin<='0';
				if(hcomp='1')then
					state<=st_BG0;
					proc_begin<='1';
				elsif(state=st_BG0)then
					if(bg_state=bg_END)then
						state<=st_BG1;
						proc_begin<='1';
					end if;
				elsif(state=st_BG1)then
					if(bg_state=bg_END)then
						state<=st_SPRITE;
						proc_begin<='1';
					end if;
				elsif(state=st_SPRITE)then
					if(sp_state=sp_END)then
						state<=st_IDLE;
					end if;
				else
					state<=st_IDLE;
				end if;
			end if;
		end if;
	end process;

	bg_asel<=	bg0asel	when state=st_BG0 else
				bg1asel	when state=st_BG1 else
				'1';
	bg_xmod<=	bg0hoff+('0' & bg_x) when state=st_BG0 else
				bg1hoff+('0' & bg_x) when state=st_BG1 else
				(others=>'0');
	bg_ymod<=	bg0voff+('0' & linenum) when state=st_BG0 else
				bg1voff+('0' & linenum) when state=st_BG1 else
				(others=>'0');
	bgaddrr0<=	bg_asel & bg_ymod(8 downto 3) & bg_xmod(8 downto 3);
	bgaddrr1<=	bg_asel & bg_ymod(9 downto 4) & bg_xmod(9 downto 4);
	bgaddr<=	bgaddrr0 when hres='0' else bgaddrr1;
	bg_patsub<=bg_xmodd(3) & bg_ymod(3);
	bg_patnolsb(0)<=bg_patsub(0) xor bgVR;
	bg_patnolsb(1)<=bg_patsub(1) xor bgHR;
	bg_patno<=	"00" & bgPAT when hres='0' else
				bgPAT & bg_patnolsb when hres='1' else
				(others=>'0');
	bg_dotx<=	bg_xmodd(2 downto 0) when bgHR='0' else
				not bg_xmodd(2 downto 0);
	bg_doty<=	bg_ymod(2 downto 0) when bgVR='0' else
				not bg_ymod(2 downto 0);

	BG0buf	:sline port map(
		wraddr	=>bg_xd,
		wrdat	=>bgCOLORd & dotin,
		wr		=>bg0wr,
		clr		=>'0',
		change	=>hcomp,
		rdaddr	=>rdaddr,
		rddat	=>bg0rdat,

		clk		=>clk,
		ce      =>ce,
		rstn	=>rstn
	);
	BG1buf	:sline port map(
		wraddr	=>bg_xd,
		wrdat	=>bgCOLORd & dotin,
		wr		=>bg1wr,
		clr		=>'0',
		change	=>hcomp,
		rdaddr	=>rdaddr,
		rddat	=>bg1rdat,

		clk		=>clk,
		ce      =>ce,
		rstn	=>rstn
	);


	process(clk)
	variable	bg0wrdly,bg1wrdly	:std_logic;
	variable	spwrdly		:std_logic;
	variable	bg_waddrd1	:std_logic_vector(8 downto 0);
	variable	sp_waddrd1	:std_logic_vector(8 downto 0);
	variable	sp_xposd1	:std_logic_vector(3 downto 0);
	variable	sp_xposd2	:std_logic_vector(3 downto 0);
	variable	bg_xd1		:std_logic_vector(8 downto 0);

	begin
		if rising_edge(clk) then
			if(ce = '1')then
				bg0wr<=bg0wrdly;
				bg1wr<=bg1wrdly;
				bg_xmodd<=bg_xmod;
				--bg_waddr<=bg_waddrd1;
				sp_waddrd<=sp_waddr(8 downto 0);
				--sp_xposd<=sp_xposd1;
				bg_xd<=bg_xd1;
				bgCOLORd<=bgCOLOR;
				sprCOLORd<=	sprCOLOR;
				if(state=st_BG0)then
					bg0wrdly:='1';
				else
					bg0wrdly:='0';
				end if;
				if(state=st_BG1)then
					bg1wrdly:='1';
				else
					bg1wrdly:='0';
				end if;
				--bg_waddrd1:=bg_x;
				if(sp_state=sp_copy)then
					--spwrdly:=sp_wren;
					sp_wr<=sp_wren;
				else
					--spwrdly:='0';
					sp_wr<='0';
				end if;
				--sp_waddrd1:=sp_waddr(8 downto 0);
				--sp_xposd1:=sp_xpos;
				bg_xd1:=bg_x;
			end if;
		end if;
	end process;

	process(clk,rstn)begin
		if rising_edge(clk) then
			if(rstn='0')then
				bg_state<=bg_IDLE;
				bg_x<=(others=>'0');
			elsif(ce = '1')then
				case bg_state is
				when bg_IDLE =>
					if((state=st_BG0 or state=st_BG1) and proc_begin='1')then
						bg_x<=(others=>'0');
						bg_state<=bg_BUSY;
					end if;
				when bg_BUSY =>
					if(bg_x<lastx)then
						bg_x<=bg_x+1;
					else
						bg_state<=bg_END;
					end if;
				when others =>
					bg_state<=bg_IDLE;
				end case;
			end if;
		end if;
	end process;

	sp_clr<=bg0wr;
	sp_linenum<=linenum+"0000010000";

	process(clk,rstn)
	variable	sp_yposl	:std_logic_vector(9 downto 0);
	begin
		if rising_edge(clk) then
			if(rstn='0')then
				sp_no<=(others=>'0');
				sp_state<=sp_IDLE;
				sp_xpos<=(others=>'0');
			elsif(ce = '1')then
				if(hcomp='1')then
					sp_state<=sp_IDLE;
				else
					case sp_state is
					when sp_IDLE =>
						if(state=st_SPRITE and proc_begin='1')then
							sp_no<=(others=>'1');
							sp_state<=sp_setno;
						end if;
					when sp_setno =>
						sp_state<=sp_check;
					when sp_check =>
						if(sprPRI="00" or sprypos<=linenum or sprypos>sp_linenum)then
							if(sp_no>lastspno)then
								sp_no<=sp_no-1;
								sp_state<=sp_setno;
							else
								sp_state<=sp_END;
							end if;
						else
							sp_yposl:=('0' & linenum)-sprypos;
							sp_ypos<=sp_yposl(3 downto 0);
							sp_xpos<=(others=>'0');
							sp_state<=sp_copy;
						end if;
					when sp_copy =>
						if(sp_xpos<x"f")then
							sp_xpos<=sp_xpos+x"1";
						else
							if(sp_no>lastspno)then
								sp_no<=sp_no-1;
								sp_state<=sp_setno;
							else
								sp_state<=sp_END;
							end if;
							sp_xpos<=(others=>'0');
						end if;
					when others =>
						sp_state<=sp_IDLE;
					end case;
				end if;
			end if;
		end if;
	end process;

	sprno<=sp_no;

	sp_patsub<=sp_xpos(3) & sp_ypos(3);
	sp_patnolsb(0)<=sp_patsub(0) xor sprVR;
	sp_patnolsb(1)<=sp_patsub(1) xor sprHR;
	sp_patno<=	sprPAT & sp_patnolsb;

	sp_dotx<=	sp_xpos(2 downto 0) when sprHR='0' else
				not sp_xpos(2 downto 0);
	sp_doty<=	sp_ypos(2 downto 0) when sprVR='0' else
				not sp_ypos(2 downto 0);
	sp1_wr<=	'0' when dotin="0000" else
				'0' when sp_wr='0' else
				'1' when sprPRI="01" else
				'0';
	sp2_wr<=	'0' when dotin="0000" else
				'0' when sp_wr='0' else
				'1' when sprPRI="10" else
				'0';
	sp3_wr<=	'0' when dotin="0000" else
				'0' when sp_wr='0' else
				'1' when sprPRI="11" else
				'0';

	sp_waddrsub<=sprxpos+("000000" & sp_xpos);
	sp_waddr<=sp_waddrsub+"1111110000";
	sp_wren<=not sp_waddr(9);
	sp_maddr<=	bg_x when sp_clr='1' else sp_waddrd;

	SP1buf	:sline port map(
		wraddr	=>sp_maddr,
		wrdat	=>sprCOLORd & dotin,
		wr		=>sp1_wr,
		clr		=>sp_clr,
		change	=>hcomp,
		rdaddr	=>rdaddr,
		rddat	=>sp1rdat,

		clk		=>clk,
		ce      =>ce,
		rstn	=>rstn
	);
	SP2buf	:sline port map(
		wraddr	=>sp_maddr,
		wrdat	=>sprCOLORd & dotin,
		wr		=>sp2_wr,
		clr		=>sp_clr,
		change	=>hcomp,
		rdaddr	=>rdaddr,
		rddat	=>sp2rdat,

		clk		=>clk,
		ce      =>ce,
		rstn	=>rstn
	);
	SP3buf	:sline port map(
		wraddr	=>sp_maddr,
		wrdat	=>sprCOLORd & dotin,
		wr		=>sp3_wr,
		clr		=>sp_clr,
		change	=>hcomp,
		rdaddr	=>rdaddr,
		rddat	=>sp3rdat,

		clk		=>clk,
		ce      =>ce,
		rstn	=>rstn
	);
	patno<=	bg_patno	when state=st_BG0 else
			bg_patno	when state=st_BG1 else
			sp_patno	when state=st_SPRITE else
			(others=>'0');
	dotx<=	bg_dotx		when state=st_BG0 else
			bg_dotx		when state=st_BG1 else
			sp_dotx		when state=st_SPRITE else
			(others=>'0');
	doty<=	bg_doty		when state=st_BG0 else
			bg_doty		when state=st_BG1 else
			sp_doty		when state=st_SPRITE else

			(others=>'0');

	dotout<=
		(others=>'0') when spren='0' else
		sp3rdat	when sp3rdat(3 downto 0)/="0000" and debugsel(0)='1' else
		bg0rdat	when bg0rdat(3 downto 0)/="0000" and bgen(0)='1' and debugsel(1)='1' else
		sp2rdat when sp2rdat(3 downto 0)/="0000" and debugsel(0)='1' else
		bg1rdat	when bg1rdat(3 downto 0)/="0000" and bgen(1)='1' and debugsel(1)='1' else
		sp1rdat when sp1rdat(3 downto 0)/="0000" and debugsel(0)='1' else
		(others=>'0');

end rtl;


