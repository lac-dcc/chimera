library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity TestPattern is	
	port (
		-- external oscillator
		CLKREF	: in std_logic;
				
		-- digital YPbPr output
		Y: out std_logic_vector(5 downto 0);
		Pb: out std_logic_vector(4 downto 0);
		Pr: out std_logic_vector(4 downto 0);
		
		-- mode switch input
		GPIO2_4 : in std_logic
	);	
end entity;


architecture immediate of TestPattern is
	
   component PLL_14_387 is
	PORT
	(
		inclk0		: IN STD_LOGIC  := '0';
		c0		: OUT STD_LOGIC 
	);
	end component;

	signal CLKPIXEL : std_logic;
	

begin		
	-- create actual clock frequency 
	clkpll: PLL_14_387 port map ( CLKREF, CLKPIXEL );
	

	-- generate a test image
	process (CLKPIXEL) 
	
  	type T_ataripalette is array (0 to 255) of integer range 0 to 65535;
   constant ataripalette : T_ataripalette := (
        16#8210#,16#8a10#,16#9210#,16#9a10#,16#a210#,16#aa10#,16#b210#,16#ba10#,16#c610#,16#ce10#,16#d610#,16#de10#,16#e610#,16#ee10#,16#f610#,16#fe10#,
        16#8dd2#,16#95b3#,16#9994#,16#9d95#,16#a575#,16#a956#,16#ad37#,16#b538#,16#b919#,16#c0fa#,16#c4da#,16#ccf9#,16#d138#,16#d957#,16#e175#,16#e594#,
        16#89f3#,16#8df4#,16#8dd6#,16#91d7#,16#95b8#,16#99ba#,16#99bb#,16#9d9c#,16#a19d#,16#a57f#,16#a57f#,16#b17e#,16#bd9c#,16#c5ba#,16#d1b8#,16#d9d6#,
        16#8a13#,16#8e14#,16#9235#,16#9637#,16#9a38#,16#9a39#,16#9e3a#,16#a23b#,16#a63c#,16#aa3e#,16#ae5f#,16#b63d#,16#c23b#,16#ca3a#,16#d238#,16#de36#,
        16#8a53#,16#8e54#,16#9275#,16#9696#,16#9a97#,16#9eb8#,16#a2d9#,16#a6da#,16#aafc#,16#af1d#,16#b31e#,16#befc#,16#c6da#,16#ceb9#,16#d697#,16#e275#,
        16#8a52#,16#8e72#,16#9293#,16#92b4#,16#96d4#,16#9af5#,16#9f16#,16#a337#,16#a357#,16#a778#,16#ab99#,16#b778#,16#bf37#,16#cb16#,16#d2d4#,16#deb3#,
        16#8670#,16#8a91#,16#8ab1#,16#8ed1#,16#8f11#,16#9331#,16#9351#,16#9771#,16#9792#,16#9bb2#,16#9bd2#,16#a7b2#,16#b371#,16#bf31#,16#cb11#,16#d6d1#,
        16#866f#,16#8a8f#,16#8aae#,16#8ece#,16#8eee#,16#932d#,16#934d#,16#976c#,16#978c#,16#9bac#,16#9bcb#,16#a7ac#,16#b36c#,16#bf2d#,16#caee#,16#d6ce#,
        16#8e4e#,16#926d#,16#968c#,16#9a8b#,16#9eab#,16#a2ca#,16#aae9#,16#aee8#,16#b307#,16#b726#,16#bb46#,16#c327#,16#cae8#,16#d2c9#,16#daab#,16#e28c#,
        16#922d#,16#9a2c#,16#a24a#,16#aa49#,16#ae68#,16#b666#,16#be65#,16#c284#,16#ca83#,16#d2a1#,16#daa0#,16#dea2#,16#e284#,16#e666#,16#ea68#,16#ee4a#,
        16#920d#,16#9a0c#,16#9deb#,16#a5e9#,16#ade8#,16#b1e7#,16#b9e6#,16#bde5#,16#c5e4#,16#cde2#,16#d1c1#,16#d5e3#,16#dde5#,16#e1e6#,16#e5e8#,16#edea#,
        16#91cd#,16#95cc#,16#9dab#,16#a18a#,16#a989#,16#ad68#,16#b547#,16#b946#,16#c124#,16#c503#,16#cd02#,16#d124#,16#d946#,16#dd67#,16#e589#,16#e9ab#,
        16#91ce#,16#99ae#,16#a18d#,16#a56c#,16#ad4c#,16#b52b#,16#b90a#,16#c0e9#,16#c8c9#,16#cca8#,16#d487#,16#d8a8#,16#dce9#,16#e50a#,16#e94c#,16#ed6d#,
        16#95b0#,16#9d8f#,16#a56f#,16#ad4f#,16#b50f#,16#bcef#,16#c4cf#,16#ccaf#,16#d48e#,16#dc6e#,16#e44e#,16#e86e#,16#e8af#,16#ecef#,16#f10f#,16#f54f#,
        16#95b1#,16#9d91#,16#a572#,16#ad52#,16#b532#,16#bcf3#,16#c4d3#,16#ccb4#,16#d494#,16#dc74#,16#e455#,16#e474#,16#e8b4#,16#ecf3#,16#f132#,16#f152#,
        16#8dd2#,16#95b3#,16#9994#,16#9d95#,16#a575#,16#a956#,16#ad37#,16#b538#,16#b919#,16#c0fa#,16#c4da#,16#ccf9#,16#d138#,16#d957#,16#e175#,16#e594#	
	 );	
	type T_c64palette is array (0 to 15) of integer range 0 to 65535;
	constant c64palette : T_c64palette :=
	(	32768 +  0*1024 + 16*32 + 16,  -- black
		32768 + 31*1024 + 16*32 + 16,  -- white
		32768 +  5*1024 + 13*32 + 24,  -- red
		32768 + 28*1024 + 16*32 + 11,  -- cyan
		32768 + 14*1024 + 21*32 + 22,  -- purple
		32768 + 16*1024 + 12*32 + 4,   -- green
		32768 +  2*1024 + 26*32 + 4,   -- blue
		32768 + 27*1024 +  8*32 + 17,  -- yellow
		32768 + 19*1024 + 11*32 + 21,  -- orange
		32768 +  9*1024 + 11*32 + 18,  -- brown
		32768 + 19*1024 + 13*32 + 24,  -- light red
		32768 +  6*1024 + 16*32 + 16,  -- dark gray
		32768 + 14*1024 + 16*32 + 16,  -- medium gray
		32768 + 26*1024 +  8*32 + 12,  -- light green
		32768 + 13*1024 + 26*32 +  6,  -- light blue
		32768 + 23*1024 + 16*32 + 16   -- light gray		
	);
	 
	constant sync : integer := 0 + 16*32 + 16;
	
	constant w: integer := 460;  
	constant h: integer := 624;   	
	constant vstart:  integer := 2*32-1;
	constant hstart: integer := 82;	
	
	variable cx: integer range 0 to w-1 := 0;
	variable cy: integer range 0 to h-1 := 0;
	variable framecounter : integer range 0 to 255 := 0;
	variable clocktoggle : boolean := false;
	
	variable out_ypbpr: integer range 0 to 65535 := 0;
	
	constant pwidth: integer := 360;
	constant pheight: integer := 270;
	variable px: integer range 0 to 511;
	variable py: integer range 0 to 511;
	variable vis: std_logic_vector(7 downto 0);
	variable tmp_ypbpr: std_logic_vector(15 downto 0);
	variable useedtv : boolean;
	
	begin
		if rising_edge(CLKPIXEL) then
			-- query mode switch
			useedtv := GPIO2_4 = '0';
		
			-- idle black
			out_ypbpr := ataripalette(0);

			-- compute sync pulses
			if (cy<6) and (cx<w-32)	then			-- field syncs
				out_ypbpr := sync;
			end if;
			if (cy>=6) and (cx<32) then      -- normal line syncs
				out_ypbpr := sync;
			end if;
			

			-- compute image
			if cx>=hstart and cx<hstart+pwidth and cy>=vstart and cy<vstart+2*pheight then
				vis := std_logic_vector(to_unsigned(framecounter,8));
				px := cx-hstart;
				py := (cy-vstart)/2;
				
				-- background color
				out_ypbpr := ataripalette(2);
				
				-- outline frame
				if px=0 or py=0 or px=pwidth-1 or py=pheight-1 then
					out_ypbpr := ataripalette(6);
				-- height markers
				elsif px>=0 and px<3 and (py=15 or py=30 or py=238 or py=253) then
					out_ypbpr := ataripalette(6);
				else				
					-- atari palette matrix				
					if px>=16 and py>=32 and px<16+16*8 and py<32+16*8 then
						out_ypbpr := ataripalette( ((px-16)/8) + ((py-32)/8) * 16 );

					-- c64 palette stripe
					elsif px>=160 and px<=180 and py>=32 and py<32+16*8 then
						out_ypbpr := c64palette( (py-32)/8 );					
						
					-- grey gradient	
					elsif px>=16 and px<16+32*8 and py>=180 and py<200 then					
						out_ypbpr := (32 + (px-16)/8)*1024 + 16*32 + 16;
						
					-- Pb gradient
					elsif px>=16 and px<16+32*8 and py>=210 and py<230 then					
						out_ypbpr := (32 + 16)*1024 + ((px-16)/8)*32 + 16;
						
					-- Pr gradient
					elsif px>=16 and px<16+32*8 and py>=240 and py<260 then					
						out_ypbpr := (32 + 16)*1024 + 16*32 + ((px-16)/8);
						
			      -- blinking areas
					elsif ((py>=10 and py<40) or (py>=pheight-40 and py<pheight-10)) and px>=290 and px<310 
					then
						if vis(7)='0' then
							out_ypbpr:=ataripalette(0); 
						else        
							out_ypbpr:=ataripalette(15); 
						end if;	
					
					-- horizontal scrolling test
					elsif py>=50 and py<160 and px>=200 and px<350 then
						if px mod 16 = framecounter mod 16 then
	                   out_ypbpr:=ataripalette(15);
						end if;
					end if;
				
				end if;
			end if; 
			
			-- progress horizontal and vertical counters
			if useedtv or clocktoggle then -- when SDTV only clock at half speed
				if cx<w-1 then
					cx:=cx+1;
				else
					cx:=0;
					if (not useedtv) and (cy<h-1) then   -- in SDTV mode, skip every other line
						cy := cy+1;
					end if;
					if cy<h-1 then
						cy:=cy+1;
					else
						cy:=0;
						framecounter := framecounter+1;
					end if;
				end if;
			end if;
			-- create a toggle bit to be able to run at half speed
			clocktoggle := not clocktoggle;
			
		end if;

		tmp_ypbpr := std_logic_vector(to_unsigned(out_ypbpr,16));
		Y  <= tmp_ypbpr(15 downto 10);
		PB <= tmp_ypbpr(9 downto 5);
		PR <= tmp_ypbpr(4 downto 0);
	end process;


end immediate;

