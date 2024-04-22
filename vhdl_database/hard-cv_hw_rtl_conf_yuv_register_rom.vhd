library IEEE;
        use IEEE.std_logic_1164.all;
        use IEEE.std_logic_unsigned.all;
library work;
        use work.conf_pack.all ;

entity yuv_register_rom is
	port(
	   clk, en	:	in std_logic ;
 		data : out std_logic_vector(15 downto 0 ); 
 		addr : in std_logic_vector(7 downto 0 )
	); 
end yuv_register_rom;

architecture ov7670_qvga of yuv_register_rom is
 
	type array_160 is array (0 to 159) of std_logic_vector(15 downto 0 ); 
	
	
	
	-- CONFIGURATION TAKEN FROM OV7670.c IN LINUX KERNEL DRIVERS
	signal rom : array_160 :=( 
	(X"12" & X"80"),
	(X"11" & X"01"), -- OV: clock scale (30 fps) -- 15fps with 0x03
	(X"3a" & X"04"), -- OV
	(X"12" & X"10"), -- QVGA
	(X"8C" & X"00"), -- 
--	(X"17" & X"15"), -- HSTART -- these lines gives 322*240
--	(X"18" & X"03"), -- HSTOP
--	(X"32" & X"A0"), -- HREF
	(X"17" & X"14"), -- HSTART
	(X"18" & X"02"), -- HSTOP
	(X"32" & X"A4"), -- HREF
	(X"19" & X"03"), -- VSTART
	(X"1A" & X"7b"), -- VSTOP
	(X"03" & X"0a"), -- VREF
	(X"0C" & X"00"), -- COM13
	(X"3E" & X"00"), -- COM14
	(X"70" & X"3a"), -- MISTERY SCALLING NUMBER
	(X"71" & X"35"), 
	(X"72" & X"11"), 
	(X"73" & X"f0"), 
	(X"a2" & X"02"),
	(X"15" & X"00"), -- END OF MISTERY SCALLING NUMBER
	(X"7a" & X"20"), --GAMMA CURVES VALUES
	(X"7b" & X"10"), 
	(X"7c" & X"1e"), 
	(X"7d" & X"35"), 
	(X"7e" & X"5a"), 
	(X"7f" & X"69"), 
	(X"80" & X"76"), 
	(X"81" & X"80"), 
	(X"82" & X"88"), 
	(X"83" & X"8f"), 
	(X"84" & X"96"), 
	(X"85" & X"a3"), 
	(X"86" & X"af"), 
	(X"87" & X"c4"), 
	(X"88" & X"d7"), 
	(X"89" & X"e8"), -- END OF GAMMA CURVES VALUES
	(X"13" & (X"80" OR X"40" OR X"20")), --COM8
	(X"00" & X"00"), -- GAIN
	(X"10" & X"00"), -- AECH
	(X"0D" & X"40"), -- COM4
	(X"14" & X"18"), -- COM9
	(X"a5" & X"05"), --BD50MAX
	(X"ab" & X"07"), --BD60MAX
	(X"24" & X"95"), -- AEW
	(X"25" & X"33"), -- AEB
	(X"26" & X"e3"), -- VPT
	(X"9f" & X"78"), -- HAECC1
	(X"A0" & X"68"), -- HAECC2
	(X"a1" & X"03"), -- MAGIC NUMBER
	(X"A6" & X"d8"), -- HAECC3
	(X"A7" & X"d8"), -- HAECC4
	(X"A8" & X"f0"), -- HAECC5
	(X"A9" & X"90"), -- HAECC6
	(X"AA" & X"94"), -- HAECC7
	(X"13" & (X"80" OR X"40" OR X"20" OR X"04"OR X"01")), --COM8
	(X"0E" & X"61"), -- COM5
	(X"0F" & X"4b"), -- COM6
	(X"16" & X"02"),
	(X"1E" & X"07"), -- MVFP
	(X"21" & X"02"), 
	(X"22" & X"91"), 
	(X"29" & X"07"), 
	(X"33" & X"0b"), 
	(X"35" & X"0b"), 
	(X"37" & X"1d"), 
	(X"38" & X"71"), 
	(X"39" & X"2a"), 
	(X"3C" & X"78"), -- COM12
	(X"4d" & X"40"),
	(X"4e" & X"20"), 
	(X"69" & X"00"), -- GFIX
	(X"6b" & X"4a"), 
	(X"74" & X"10"), 
	(X"8d" & X"4f"), 
	(X"8e" & X"00"), 
	(X"8f" & X"00"), 
	(X"90" & X"00"), 
	(X"91" & X"00"), 
	(X"96" & X"00"), 
	(X"9a" & X"00"), 
	(X"b0" & X"84"), 
	(X"b1" & X"0c"), 
	(X"b2" & X"0e"), 
	(X"b3" & X"82"), 
	(X"b8" & X"0a"),
	(X"43" & X"0a"), -- MAGIC NUMBERS
	(X"44" & X"f0"), 
	(X"45" & X"34"), 
	(X"46" & X"58"), 
	(X"47" & X"28"), 
	(X"48" & X"3a"), 
	(X"59" & X"88"), 
	(X"5a" & X"88"), 
	(X"5b" & X"44"), 
	(X"5c" & X"67"), 
	(X"5d" & X"49"), 
	(X"5e" & X"0e"), 
	(X"6c" & X"0a"), 
	(X"6d" & X"55"), 
	(X"6e" & X"11"), 
	(X"6f" & X"9E"), -- 9E FOR ADVANCE AWB
	(X"6a" & X"40"), 
	(X"01" & X"40"), -- REG BLUE
	(X"02" & X"60"), -- REG_RED
	(X"13" & (X"80" OR X"40" OR X"20" OR X"04" OR X"01" OR X"02")), -- COM8 AWB AGC AEC
	--(X"13" & (X"80" OR X"40" OR X"20" OR X"04" OR X"01")), -- COM8 AGC AEC
	--(X"13" & (X"80" OR X"40" OR X"20" OR X"04")), -- COM8 AGC
	--(X"13" & (X"80" OR X"40" OR X"20" )), -- COM8
	--(X"13" & (X"80" OR X"40" OR X"20" OR X"01" )), -- COM8 AEC (BEST CONFIG FOR LINE DETECTION)
	(X"4f" & X"80"), --"matrix coefficient 1" 
	(X"50" & X"80"), -- "matrix coefficient 2" 
	(X"51" & X"00"), -- vb 
	(X"52" & X"22"), -- "matrix coefficient 4" 
	(X"53" & X"5e"), -- "matrix coefficient 5" 
	(X"54" & X"80"), -- "matrix coefficient 6" 
	(X"58" & X"9e"),
	(X"41" & X"08"), -- COM16
	(X"3F" & X"00"), -- EDGE
	(X"75" & X"05"), 
	(X"76" & X"e1"), 
	(X"4c" & X"00"), 
	(X"77" & X"01"), 
--	(X"3D" & (X"80"OR X"40" OR X"03")), --COM13 
	(X"3D" & (X"80"OR X"40")),
	(X"c9" & X"60"), 
	(X"41" & X"38"), -- COM16
	(X"56" & X"40"),
	(X"34" & X"11"), 
	(X"3B" & (X"02"OR X"10")), -- COM11
	(X"a4" & X"88"),
	(X"96" & X"00"), 
	(X"97" & X"30"), 
	(X"98" & X"20"), 
	(X"99" & X"30"), 
	(X"9a" & X"84"), 
	(X"9b" & X"29"), 
	(X"9c" & X"03"), 
	(X"9d" & X"4c"), 
	(X"9e" & X"3f"), 
	(X"78" & X"04"),
	--Extra-weird stuff.  Some sort of multiplexor register 
	(X"79" & X"01"), 
	(X"c8" & X"f0"), 
	(X"79" & X"0f"), 
	(X"c8" & X"00"), 
	(X"79" & X"10"), 
	(X"c8" & X"7e"), 
	(X"79" & X"0a"), 
	(X"c8" & X"80"), 
	(X"79" & X"0b"), 
	(X"c8" & X"01"), 
	(X"79" & X"0c"), 
	(X"c8" & X"0f"), 
	(X"79" & X"0d"), 
	(X"c8" & X"20"), 
	(X"79" & X"09"), 
	(X"c8" & X"80"), 
	(X"79" & X"02"), 
	(X"c8" & X"c0"), 
	(X"79" & X"03"), 
	(X"c8" & X"40"), 
	(X"79" & X"05"), 
	(X"c8" & X"30"), 
	(X"79" & X"26"),
	(X"04" & X"00"), -- COM1
	(X"40" & X"C0"), -- COM15	
	(X"ff" & X"ff")
);

	begin
	
	
	-- rom_process
	process(clk)
		 begin
		 if clk'event and clk = '1' then
			if en = '1' then
				data <= rom(conv_integer(addr)) ;
			end if;
		 end if;
		 end process;  
	
end ov7670_qvga ;

architecture ov7670_vga of yuv_register_rom is
 
	type array_160 is array (0 to 159) of std_logic_vector(15 downto 0 ); 
	
	
	
	-- CONFIGURATION TAKEN FROM OV7670.c IN LINUX KERNEL DRIVERS
	signal rom : array_160 :=( 
	(X"12" & X"80"),
	(X"11" & X"03"), -- OV: clock scale (30 fps)
	(X"3a" & X"04"), -- OV
	(X"12" & X"00"), -- VGA
	(X"8C" & X"00"), -- 
	(X"17" & X"13"), -- HSTART
	(X"18" & X"01"), -- HSTOP
	(X"32" & X"b6"), -- HREF
	(X"19" & X"02"), -- VSTART
	(X"1A" & X"7a"), -- VSTOP
	(X"03" & X"0a"), -- VREF
	(X"0C" & X"00"), -- COM13
	(X"3E" & X"00"), -- COM14
	(X"70" & X"3a"), -- MISTERY SCALLING NUMBER
	(X"71" & X"35"), 
	(X"72" & X"11"), 
	(X"73" & X"f0"), 
	(X"a2" & X"02"),
	(X"15" & X"00"), -- END OF MISTERY SCALLING NUMBER
	(X"7a" & X"20"), --GAMMA CURVES VALUES
	(X"7b" & X"10"), 
	(X"7c" & X"1e"), 
	(X"7d" & X"35"), 
	(X"7e" & X"5a"), 
	(X"7f" & X"69"), 
	(X"80" & X"76"), 
	(X"81" & X"80"), 
	(X"82" & X"88"), 
	(X"83" & X"8f"), 
	(X"84" & X"96"), 
	(X"85" & X"a3"), 
	(X"86" & X"af"), 
	(X"87" & X"c4"), 
	(X"88" & X"d7"), 
	(X"89" & X"e8"), -- END OF GAMMA CURVES VALUES
	(X"13" & (X"80" OR X"40" OR X"20")), --COM8
	(X"00" & X"00"), -- GAIN
	(X"10" & X"00"), -- AECH
	(X"0D" & X"40"), -- COM4
	(X"14" & X"18"), -- COM9
	(X"a5" & X"05"), --BD50MAX
	(X"ab" & X"07"), --BD60MAX
	(X"24" & X"95"), -- AEW
	(X"25" & X"33"), -- AEB
	(X"26" & X"e3"), -- VPT
	(X"9f" & X"78"), -- HAECC1
	(X"A0" & X"68"), -- HAECC2
	(X"a1" & X"03"), -- MAGIC NUMBER
	(X"A6" & X"d8"), -- HAECC3
	(X"A7" & X"d8"), -- HAECC4
	(X"A8" & X"f0"), -- HAECC5
	(X"A9" & X"90"), -- HAECC6
	(X"AA" & X"94"), -- HAECC7
	(X"13" & (X"80" OR X"40" OR X"20" OR X"04"OR X"01")), --COM8
	(X"0E" & X"61"), -- COM5
	(X"0F" & X"4b"), -- COM6
	(X"16" & X"02"),
	(X"1E" & X"07"), -- MVFP
	(X"21" & X"02"), 
	(X"22" & X"91"), 
	(X"29" & X"07"), 
	(X"33" & X"0b"), 
	(X"35" & X"0b"), 
	(X"37" & X"1d"), 
	(X"38" & X"71"), 
	(X"39" & X"2a"), 
	(X"3C" & X"78"), -- COM12
	(X"4d" & X"40"),
	(X"4e" & X"20"), 
	(X"69" & X"00"), -- GFIX
	(X"6b" & X"4a"), 
	(X"74" & X"10"), 
	(X"8d" & X"4f"), 
	(X"8e" & X"00"), 
	(X"8f" & X"00"), 
	(X"90" & X"00"), 
	(X"91" & X"00"), 
	(X"96" & X"00"), 
	(X"9a" & X"00"), 
	(X"b0" & X"84"), 
	(X"b1" & X"0c"), 
	(X"b2" & X"0e"), 
	(X"b3" & X"82"), 
	(X"b8" & X"0a"),
	(X"43" & X"0a"), -- MAGIC NUMBERS
	(X"44" & X"f0"), 
	(X"45" & X"34"), 
	(X"46" & X"58"), 
	(X"47" & X"28"), 
	(X"48" & X"3a"), 
	(X"59" & X"88"), 
	(X"5a" & X"88"), 
	(X"5b" & X"44"), 
	(X"5c" & X"67"), 
	(X"5d" & X"49"), 
	(X"5e" & X"0e"), 
	(X"6c" & X"0a"), 
	(X"6d" & X"55"), 
	(X"6e" & X"11"), 
	(X"6f" & X"9E"), -- 9E FOR ADVANCE AWB
	(X"6a" & X"40"), 
	(X"01" & X"40"), -- REG BLUE
	(X"02" & X"60"), -- REG_RED
	--(X"13" & (X"80" OR X"40" OR X"20" OR X"04" OR X"01" OR X"02")), -- COM8 AWB AGC AEC
	(X"13" & (X"80" OR X"40" OR X"20" OR X"04" OR X"01")), -- COM8 AGC AEC
	--(X"13" & (X"80" OR X"40" OR X"20" OR X"04")), -- COM8 AGC
	--(X"13" & (X"80" OR X"40" OR X"20" )), -- COM8
	--(X"13" & (X"80" OR X"40" OR X"20" OR X"01" )), -- COM8 AEC (BEST CONFIG FOR LINE DETECTION)
	(X"4f" & X"80"), --"matrix coefficient 1" 
	(X"50" & X"80"), -- "matrix coefficient 2" 
	(X"51" & X"00"), -- vb 
	(X"52" & X"22"), -- "matrix coefficient 4" 
	(X"53" & X"5e"), -- "matrix coefficient 5" 
	(X"54" & X"80"), -- "matrix coefficient 6" 
	(X"58" & X"9e"),
	(X"41" & X"08"), -- COM16
	(X"3F" & X"00"), -- EDGE
	(X"75" & X"05"), 
	(X"76" & X"e1"), 
	(X"4c" & X"00"), 
	(X"77" & X"01"), 
--	(X"3D" & (X"80"OR X"40" OR X"03")), --COM13 
	(X"3D" & (X"80"OR X"40")),
	(X"c9" & X"60"), 
	(X"41" & X"38"), -- COM16
	(X"56" & X"40"),
	(X"34" & X"11"), 
	(X"3B" & (X"02"OR X"10")), -- COM11
	(X"a4" & X"88"),
	(X"96" & X"00"), 
	(X"97" & X"30"), 
	(X"98" & X"20"), 
	(X"99" & X"30"), 
	(X"9a" & X"84"), 
	(X"9b" & X"29"), 
	(X"9c" & X"03"), 
	(X"9d" & X"4c"), 
	(X"9e" & X"3f"), 
	(X"78" & X"04"),
	--Extra-weird stuff.  Some sort of multiplexor register 
	(X"79" & X"01"), 
	(X"c8" & X"f0"), 
	(X"79" & X"0f"), 
	(X"c8" & X"00"), 
	(X"79" & X"10"), 
	(X"c8" & X"7e"), 
	(X"79" & X"0a"), 
	(X"c8" & X"80"), 
	(X"79" & X"0b"), 
	(X"c8" & X"01"), 
	(X"79" & X"0c"), 
	(X"c8" & X"0f"), 
	(X"79" & X"0d"), 
	(X"c8" & X"20"), 
	(X"79" & X"09"), 
	(X"c8" & X"80"), 
	(X"79" & X"02"), 
	(X"c8" & X"c0"), 
	(X"79" & X"03"), 
	(X"c8" & X"40"), 
	(X"79" & X"05"), 
	(X"c8" & X"30"), 
	(X"79" & X"26"),
	(X"04" & X"00"), -- COM1
	(X"40" & X"C0"), -- COM15	
	(X"ff" & X"ff")
);

	begin
	
	
	-- rom_process
	process(clk)
		 begin
		 if clk'event and clk = '1' then
			if en = '1' then
				data <= rom(conv_integer(addr)) ;
			end if;
		 end if;
		 end process;  
	
end ov7670_vga ;



architecture ov7725_qvga of yuv_register_rom is
 
	type reg_array is array (0 to 74) of std_logic_vector(15 downto 0 ); 
	
	
	-- CONFIGURATION TAKEN FROM ov534.c IN LINUX KERNEL DRIVERS
	signal rom : reg_array :=( 
	( X"12" & X"80"), -- reset all registers
	( X"12" & X"40"),
	( X"11" & X"01"),
	( X"17" & X"3f"),
	( X"18" & X"50"),
	( X"19" & X"03"),
	( X"1a" & X"78"),
	( X"29" & X"50"),
	( X"2c" & X"78"),
	( X"65" & X"2f"),
	( X"11" & X"01"),
	( X"42" & X"7f"),
	( X"63" & X"aa"),		-- AWB - was e0 
	( X"64" & X"ff"),
	( X"66" & X"00"),
	( X"13" & X"f0"),		-- com8 
	( X"0d" & X"41"),
	( X"0f" & X"c5"),
	( X"14" & X"11"),
	( X"22" & X"7f"),
	( X"23" & X"03"),
	( X"24" & X"40"),
	( X"25" & X"30"),
	( X"26" & X"a1"),
	( X"2a" & X"00"),
	( X"2b" & X"00"),
	( X"6b" & X"aa"),
	( X"13" & X"ff"),		-- AWB 
	--( X"13" & X"fD"),		-- no AWB 
	( X"90" & X"05"),
	( X"91" & X"01"),
	( X"92" & X"03"),
	( X"93" & X"00"),
	( X"94" & X"60"),
	( X"95" & X"3c"),
	( X"96" & X"24"),
	( X"97" & X"1e"),
	( X"98" & X"62"),
	( X"99" & X"80"),
	( X"9a" & X"1e"),
	( X"9b" & X"08"),
	( X"9c" & X"20"),
	( X"9e" & X"81"),
	( X"a6" & X"04"),
	( X"7e" & X"0c"),
	( X"7f" & X"16"),
	( X"80" & X"2a"),
	( X"81" & X"4e"),
	( X"82" & X"61"),
	( X"83" & X"6f"),
	( X"84" & X"7b"),
	( X"85" & X"86"),
	( X"86" & X"8e"),
	( X"87" & X"97"),
	( X"88" & X"a4"),
	( X"89" & X"af"),
	( X"8a" & X"c5"),
	( X"8b" & X"d7"),
	( X"8c" & X"e8"),
	( X"8d" & X"20"),
	( X"0c" & X"90"),
	( X"2b" & X"00"),
	( X"22" & X"7f"),
	( X"23" & X"03"),
	( X"11" & X"09"), -- should work for 15fps fint = 24 * (4/(10*2)) = 4.8mhz
	--( X"11" & X"04"), -- should work for 30fps fint = 24 * (4/(5*2)) = 9.6mhz
	--( X"11" & X"01"), -- should work for 75fps fint = 24 * (4/(2*2)) = 24mhz
	--( X"11" & X"02"), -- should work for 50fps fint = 24 * (4/(3*2)) = 16mhz
	( X"0c" & X"d0"),
	( X"64" & X"ff"),
	( X"69" & X"5c"),
	( X"0d" & X"41"),
	( X"14" & X"41"),
	( X"0e" & X"cd"),
	( X"ac" & X"bf"),
	( X"8e" & X"00"),		-- De-noise threshold 
	( X"0c" & X"d0"),
	--( X"0c" & X"10"),
	( X"3e" & X"88"),
	--( X"01" & X"10"), -- B gain
	--( X"02" & X"35"), -- R gain
	--( X"03" & X"45"), -- G gain
	--(X"a6" & X"02" ), --enabling dsp
	--(X"a7" & X"20" ), -- experiencing with sat values
	--(X"a8" & X"20" ), -- experiencing with sat values 
	( X"FF" & X"FF" )
);

	begin
	
	
	-- rom_process
	process(clk)
		 begin
		 if clk'event and clk = '1' then
			if en = '1' then
				data <= rom(conv_integer(addr)) ;
			end if;
		 end if;
		 end process;  
	
end ov7725_qvga ;

architecture ov7725_vga of yuv_register_rom is
 
	type array_73 is array (0 to 72) of std_logic_vector(15 downto 0 ); 
	
	
	
	-- CONFIGURATION TAKEN FROM OV534.c IN LINUX KERNEL DRIVERS
	signal rom : array_73 :=( 
	( X"12" & X"00"),
	( X"11" & X"01"),
	( X"15" & X"40"), -- COM10, enable HREF change on HSYNC
	( X"17" & X"26"),
	( X"18" & X"a0"),
	( X"19" & X"07"),
	( X"1a" & X"f0"),
	( X"29" & X"a0"),
	( X"2c" & X"f0"),
	( X"65" & X"20"),
	( X"11" & X"01"),
	( X"42" & X"7f"),
	( X"63" & X"aa"),		-- AWB - was e0 
	( X"64" & X"ff"),
	( X"66" & X"00"),
	( X"13" & X"f0"),		-- com8 
	( X"0d" & X"41"),
	( X"0f" & X"c5"),
	( X"14" & X"11"),
	( X"22" & X"7f"),
	( X"23" & X"03"),
	( X"24" & X"40"),
	( X"25" & X"30"),
	( X"26" & X"a1"),
	( X"2a" & X"00"),
	( X"2b" & X"00"),
	( X"6b" & X"aa"),
	( X"13" & X"ff"),		-- AWB 
	( X"90" & X"05"),
	( X"91" & X"01"),
	( X"92" & X"03"),
	( X"93" & X"00"),
	( X"94" & X"60"),
	( X"95" & X"3c"),
	( X"96" & X"24"),
	( X"97" & X"1e"),
	( X"98" & X"62"),
	( X"99" & X"80"),
	( X"9a" & X"1e"),
	( X"9b" & X"08"),
	( X"9c" & X"20"),
	( X"9e" & X"81"),
	( X"a6" & X"04"),
	( X"7e" & X"0c"),
	( X"7f" & X"16"),
	( X"80" & X"2a"),
	( X"81" & X"4e"),
	( X"82" & X"61"),
	( X"83" & X"6f"),
	( X"84" & X"7b"),
	( X"85" & X"86"),
	( X"86" & X"8e"),
	( X"87" & X"97"),
	( X"88" & X"a4"),
	( X"89" & X"af"),
	( X"8a" & X"c5"),
	( X"8b" & X"d7"),
	( X"8c" & X"e8"),
	( X"8d" & X"20"),
	( X"0c" & X"90"),
	( X"2b" & X"00"),
	( X"22" & X"7f"),
	( X"23" & X"03"),
	( X"11" & X"01"), -- double check value fint = fxclk * (PLL/((val + 1)*2) linux driver uses 12mhz fint = 12 * (4/(2*2)) = 12
	--( X"11" & X"03"), -- should work for 30fps fint = 24 * (4/(4*2)) = 12mhz
	( X"0c" & X"d0"),
	( X"64" & X"ff"),
	( X"0d" & X"41"),
	( X"14" & X"41"),
	( X"0e" & X"cd"),
	( X"ac" & X"bf"),
	( X"8e" & X"00"),		-- De-noise threshold 
	( X"0c" & X"d0"),
	( X"FF" & X"FF" )
);

	begin
	
	
	-- rom_process
	process(clk)
		 begin
		 if clk'event and clk = '1' then
			if en = '1' then
				data <= rom(conv_integer(addr)) ;
			end if;
		 end if;
		 end process;  
	
end ov7725_vga ;


architecture ov7725_qvga_patched of yuv_register_rom is
 
	type reg_array is array (0 to 78) of std_logic_vector(15 downto 0 ); 
	
	
	-- CONFIGURATION TAKEN FROM ov534.c IN LINUX KERNEL DRIVERS
	signal rom : reg_array :=( 
	( X"12" & X"80"), -- reset all registers
	( X"12" & X"40"), -- set qvga
	(X"11" & X"01"),
	(X"3d" & X"03"),
	(X"17" & X"3f"),
	(X"18" & X"50"),
	(X"19" & X"03"),
	(X"1a" & X"78"),
	(X"32" & X"00"),
	(X"29" & X"50"),
	(X"2c" & X"78"),
	(X"65" & X"2f"),
	(X"11" & X"01"),
	(X"42" & X"7f"),
	(X"63" & X"AA"), 	-- AWB
	--(X"63" & X"00"), 	-- AWB
	(X"64" & X"ff"),
	(X"66" & X"00"),
	(X"13" & X"f0"),	-- COM8  - jfrancois X"f0	orig x0f7
	(X"0d" & X"41"),
	(X"0f" & X"c5"),
	(X"14" & X"11"),
	(X"22" & X"7f"),
	(X"23" & X"03"),
	(X"24" & X"40"),
	(X"25" & X"30"),
	(X"26" & X"a1"),
	(X"2a" & X"00"),
	(X"2b" & X"00"), 
	(X"6b" & X"aa"),
	(X"13" & X"ff"),	-- COM8 - jfrancois X"ff orig X"f7
	(X"90" & X"05"),
	(X"91" & X"01"),
	(X"92" & X"03"),
	(X"93" & X"00"),
	(X"94" & X"60"),
	(X"95" & X"3c"),
	(X"96" & X"24"),
	(X"97" & X"1e"),
	(X"98" & X"62"),
	(X"99" & X"80"),
	(X"9a" & X"1e"),
	(X"9b" & X"48"),-- brightness control
	(X"9c" & X"25"),-- contrast control
	(X"9e" & X"81"),
	(X"a6" & X"04"),
	(X"7e" & X"0c"),
	(X"7f" & X"16"),
	(X"80" & X"2a"),
	(X"81" & X"4e"),
   (X"82" & X"61"),
	(X"83" & X"6f"),
	(X"84" & X"7b"),
	(X"85" & X"86"),
	(X"86" & X"8e"),
	(X"87" & X"97"),
	(X"88" & X"a4"),
	(X"89" & X"af"),
	(X"8a" & X"c5"),
	(X"8b" & X"d7"),
	(X"8c" & X"e8"),
	(X"8d" & X"20"),
	(X"0c" & X"90"),
	(X"2b" & X"00"), 
	(X"22" & X"7f"),
	(X"23" & X"03"),
	--( X"11" & X"09"), -- should work for 15fps fint = 24 * (4/(10*2)) = 4.8mhz
	(X"11" & X"04"), -- should work for 30fps fint = 24 * (4/(5*2)) = 9.6mhz
	(X"0c" & X"d0"),
	(X"64" & X"ff"),
	(X"0d" & X"41"),
	(X"14" & X"41"),
	(X"0e" & X"cd"),
	(X"ac" & X"bf"),
	(X"8e" & X"00"),	-- De-noise threshold - jfrancois X"00 - orig X"04
	(X"0c" & X"d0" ),
	(X"a6" & X"07" ), --enabling dsp
	(X"ab" & X"0b" ), --disabling brightness control
	(X"a7" & X"30" ), -- experiencing with sat values
	(X"a8" & X"30" ), -- experiencing with sat values 
	(X"FF" & X"FF" )
);

	begin
	
	
	-- rom_process
	process(clk)
		 begin
		 if clk'event and clk = '1' then
			if en = '1' then
				data <= rom(conv_integer(addr)) ;
			end if;
		 end if;
		 end process;  
	
end ov7725_qvga_patched ;