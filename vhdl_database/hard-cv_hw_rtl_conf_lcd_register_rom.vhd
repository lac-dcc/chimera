library IEEE;
        use IEEE.std_logic_1164.all;
        use IEEE.std_logic_unsigned.all;
library work;
use work.conf_pack.all ;

entity lcd_register_rom is
	port(
	   clk, en	:	in std_logic ;
 		data : out std_logic_vector(23 downto 0 ); 
 		addr : in std_logic_vector(7 downto 0 )
	); 
end lcd_register_rom;

architecture lcd2_4 of lcd_register_rom is
 
	type array_61 is array (0 to 60) of std_logic_vector(23 downto 0 ); 
	
	-- CONFIGURATION TAKEN FROM ARDUINO LIBRARY
	signal rom : array_61 :=( 
	(X"E3" & X"3008"),    --set the internal timing
	(X"E7" & X"0012"),    --set the internal timing
	(X"EF" & X"1231"),    --set the internal timing
	(X"00" & X"0001"),    -- start oscillator
	(X"FF" & X"0000"),    --delay
	(X"01" & X"0100"),    --LCD_DRIV_OUT_CTRL
	(X"02" & X"0700"),    --LCD_DRIV_WAV_CTRL
	--(X"03" & X"1030"),    --LCD_ENTRY_MOD -- depend on LCD orientatoin
	(X"03" & X"1038"),    --LCD_ENTRY_MOD
	(X"04" & X"0000"),    --LCD_RESIZE_CTRL
	(X"08" & X"0202"),    --LCD_DISP_CTRL2
	(X"09" & X"0000"),    --LCD_DISP_CTRL3
	(X"0A" & X"0000"),    --LCD_DISP_CTRL4
	(X"0C" & X"0000"),    --LCD_RGB_DISP_IF_CTRL1
	(X"0D" & X"0000"),    --LCD_FRM_MARKER_POS
	(X"0F" & X"0000"),    --LCD_RGB_DISP_IF_CTRL2
	(X"10" & X"0000"),    --LCD_POW_CTRL1
	(X"11" & X"0007"),    --LCD_POW_CTRL2
	(X"12" & X"0000"),    --LCD_POW_CTRL3
	(X"13" & X"0000"),    --LCD_POW_CTRL4
	(X"FF" & X"0000"),   --delay
	(X"10" & X"1690"),   --LCD_POW_CTRL1
	(X"11" & X"0227"),   --LCD_POW_CTRL2
	(X"FF" & X"0000"),   --delay
	(X"12" & X"001A"),   --LCD_POW_CTRL3
	(X"FF" & X"0000"),   --delay
	(X"13" & X"1800"),   --LCD_POW_CTRL4
	(X"29" & X"002A"),   --LCD_POW_CTRL7
	(X"FF" & X"0000"),   --delay 
	(X"30" & X"0000"),   --LCD_GAMMA_CTRL1 
	(X"31" & X"0000"),   --LCD_GAMMA_CTRL2 
	(X"32" & X"0000"),   --LCD_GAMMA_CTRL3 
	(X"35" & X"0206"),   --LCD_GAMMA_CTRL4 
	(X"36" & X"0808"),   --LCD_GAMMA_CTRL5
	(X"37" & X"0007"),   --LCD_GAMMA_CTRL6 
	(X"38" & X"0201"),   --LCD_GAMMA_CTRL7 
	(X"39" & X"0000"),   --LCD_GAMMA_CTRL8
	(X"3C" & X"0000"),   --LCD_GAMMA_CTRL9
	(X"3D" & X"0000"),   --LCD_GAMMA_CTRL10
	(X"20" & X"0000"),   --LCD_GRAM_HOR_AD
	(X"21" & X"0000"),   --LCD_GRAM_VER_AD 
	(X"50" & X"0000"),   --LCD_HOR_START_AD 
	(X"51" & X"00EF"),   --LCD_HOR_END_AD
	(X"52" & X"0000"),   --LCD_VER_START_AD 
	(X"53" & X"013F"),   --LCD_VER_END_AD
	(X"60" & X"A700"),   --LCD_GATE_SCAN_CTRL1     
	(X"61" & X"0003"),   --LCD_GATE_SCAN_CTRL2
	(X"6A" & X"0000"),   --LCD_GATE_SCAN_CTRL3
	(X"80" & X"0000"),   --LCD_PART_IMG1_DISP_POS
	(X"81" & X"0000"),   --LCD_PART_IMG1_START_AD 
	(X"82" & X"0000"),   --LCD_PART_IMG1_END_AD
	(X"83" & X"0000"),   --LCD_PART_IMG2_DISP_POS
	(X"84" & X"0000"),   --LCD_PART_IMG2_START_AD
	(X"85" & X"0000"),   --LCD_PART_IMG2_END_AD
	(X"90" & X"0010"),   --LCD_PANEL_IF_CTRL1  
	(X"92" & X"0000"),   --LCD_PANEL_IF_CTRL2
	(X"93" & X"0003"),   --LCD_PANEL_IF_CTRL3 
	(X"95" & X"0110"),   --LCD_PANEL_IF_CTRL4
	(X"97" & X"0000"),   --LCD_PANEL_IF_CTRL5 
	(X"98" & X"0000"),   --LCD_PANEL_IF_CTRL6
	(X"07" & X"0133"),   --LCD_DISP_CTRL1  
	(X"ff" & X"ffff")		-- END OF CONFIG
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
	
end lcd2_4 ;



architecture lcd3_2 of lcd_register_rom is
 
        type array_61 is array (0 to 60) of std_logic_vector(23 downto 0 ); 
        
        -- CONFIGURATION TAKEN FROM ARDUINO LIBRARY
        signal rom : array_61 :=( 
        (x"00" & x"0001"),
        (x"03" & x"A8A4"),
        (x"0C" & x"0000"),
        (x"0D" & x"8007"),
        (x"0E" & x"2B00"),
        (x"1E" & x"00B7"),
        (x"01" & x"2B3F"),
        (x"02" & x"0600"),
        (x"10" & x"0000"),
        (x"11" & x"6058"),
        (x"05" & x"0000"),
        (x"06" & x"0000"),
        (x"16" & x"EF1C"),
        (x"17" & x"0003"),
        (x"07" & x"0233"),
        (x"0B" & x"0000"),
        (x"0F" & x"0000"),
        (x"41" & x"0000"),
        (x"42" & x"0000"),
        (x"48" & x"0000"),
        (x"49" & x"013F"),
        (x"4A" & x"0000"),
        (x"4B" & x"0000"),
        (x"44" & x"EF00"),
        (x"45" & x"0000"),
        (x"46" & x"013F"),
        (x"30" & x"0707"),
        (x"31" & x"0204"),
        (x"32" & x"0204"),
        (x"33" & x"0502"),
        (x"34" & x"0507"),
        (x"35" & x"0204"),
        (x"36" & x"0204"),
        (x"37" & x"0502"),
        (x"3A" & x"0302"),
        (x"3B" & x"0302"),
        (x"23" & x"0000"),
        (x"24" & x"0000"),
        (x"25" & x"8000"),
        (x"28" & x"0006"),
        (x"2f" & x"12BE"),
        (x"12" & x"6CEB"),
        (x"4f" & x"0000"),
        (x"4e" & x"0000"),
        (x"ffffff"),
        (x"ffffff"),
                  (x"ffffff"),
                  (x"ffffff"),
                  (x"ffffff"),
                  (x"ffffff"),
                  (x"ffffff"),
                  (x"ffffff"),
                  (x"ffffff"),
                  (x"ffffff"),
                  (x"ffffff"),
                  (x"ffffff"),
                  (x"ffffff"),
                  (x"ffffff"),
                  (x"ffffff"),
                  (x"ffffff"),
                  (x"ffffff")
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
        
end lcd3_2 ;