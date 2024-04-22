-- A2601 Top Level Entity (ROM stored in on-chip RAM)
-- Copyright 2006, 2010 Retromaster
--
--  This file is part of A2601.
--
--  A2601 is free software: you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation, either version 3 of the License,
--  or any later version.
--
--  A2601 is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with A2601.  If not, see <http://www.gnu.org/licenses/>.
--

-- This top level entity supports a single cartridge ROM stored in FPGA built-in
-- memory (such as Xilinx Spartan BlockRAM). To generate the required cart_rom
-- entity, use bin2vhdl.py found in the util directory.
--
-- For more information, see the A2601 Rev B Board Schematics and project
-- website at <http://retromaster.wordpress.org/a2601>.

library std;
use std.textio.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity A2601NoFlash is
   port (clk: in std_logic;
			O_AUDIO_R: out std_logic;
			O_AUDIO_L: out std_logic;
			
         O_VSYNC: out std_logic;
         O_HSYNC: out std_logic;
			O_VIDEO_R: out std_logic_vector(3 downto 0);
			O_VIDEO_G: out std_logic_vector(3 downto 0);
			O_VIDEO_B: out std_logic_vector(3 downto 0);			

         res: in std_logic;
         p_l: in std_logic;
         p_r: in std_logic;
         p_a: in std_logic;
         p_u: in std_logic;
         p_d: in std_logic;
         p2_l: in std_logic;
         p2_r: in std_logic;
         p2_a: in std_logic;
         p2_u: in std_logic;
         p2_d: in std_logic;
			
         p_s: in std_logic;

         			

			LED: out std_logic_vector(2 downto 0);
			
			I_SW :in std_logic_vector(2 downto 0);
			PS2CLK1   : inout	std_logic;
			PS2DAT1   : inout	std_logic;
			
         JOYSTICK_GND: out std_logic			;
			JOYSTICK2_GND: out std_logic	
			);
end A2601NoFlash;

architecture arch of A2601NoFlash is

	component dac is
		port(DACout: 	out std_logic;
			DACin:	in std_logic_vector(4 downto 0);
			Clk:		in std_logic;
			Reset:	in std_logic);
		end component;	
	--
	-- bank switch 
	subtype bss_type is std_logic_vector(2 downto 0);
	
	constant BANK00: bss_type := "000";
	constant BANKF8: bss_type := "001";
	constant BANKF6: bss_type := "010";
	constant BANKFE: bss_type := "011";
	constant BANKE0: bss_type := "100";
	constant BANK3F: bss_type := "101";
	
	-- bank switch and superchip enable options.
	
	signal bss: bss_type := BANKF6; 	--bank switching method
	signal sc: std_logic := '1';		--superchip enabled or not
	 
	 
    
	signal vid_clk, vid_clkx2: std_logic;
	signal d: std_logic_vector(7 downto 0);
	--signal cpu_d: std_logic_vector(7 downto 0);
	signal a: std_logic_vector(13 downto 0);
	signal pa: std_logic_vector(7 downto 0);
	signal pb: std_logic_vector(7 downto 0);
	signal inpt4: std_logic;
	signal inpt5: std_logic;
	signal colu: std_logic_vector(6 downto 0);
	signal csyn: std_logic;
	signal audio: std_logic;
	signal au0: std_logic;
	signal au1: std_logic;
	signal av0: std_logic_vector(3 downto 0);
	signal av1: std_logic_vector(3 downto 0);

	signal auv0: unsigned(4 downto 0);
	signal auv1: unsigned(4 downto 0);

	signal rst: std_logic := '1';
	signal sys_clk_dvdr: unsigned(4 downto 0) := "00000";

	signal ph0: std_logic;
	signal ph1: std_logic;
	 
	signal rgbx2: std_logic_vector(23 downto 0);
	signal hsyn: std_logic;
	signal vsyn: std_logic;
	signal ctrl_cntr: unsigned(3 downto 0);
	signal p_fn: std_logic;

	signal rst_cntr: unsigned(12 downto 0) := "0000000000000";
	signal sc_clk: std_logic;
	signal sc_r: std_logic;
	signal sc_d_in: std_logic_vector(7 downto 0);
	signal sc_d_out: std_logic_vector(7 downto 0);
	signal sc_a: std_logic_vector(6 downto 0);

	


    signal bank: std_logic_vector(3 downto 0) := "0000";
    signal tf_bank: std_logic_vector(1 downto 0);
    signal e0_bank: std_logic_vector(2 downto 0);
    signal e0_bank0: std_logic_vector(2 downto 0) := "000";
    signal e0_bank1: std_logic_vector(2 downto 0) := "000";
    signal e0_bank2: std_logic_vector(2 downto 0) := "000";

    signal cpu_a: std_logic_vector(12 downto 0);
    signal cpu_d: std_logic_vector(7 downto 0);
    signal cpu_r: std_logic;

    
	signal cv:  std_logic_vector(7 downto 0);
	signal au:  std_logic_vector(4 downto 0);
-- switches
	signal sw_toggle: std_logic_vector(2 downto 0) := "000";
	signal sw_pressed: std_logic_vector(2 downto 0) := "000";
	

	-- ps/2  
	signal ps2_codeready      : std_logic := '1';
	signal ps2_scancode       : std_logic_vector( 9 downto 0) := (others => '0');
	signal P1_CSJUDLR         : std_logic_vector( 6 downto 0) := (others => '0'); -- player 1 keyboard controls
	signal P2_CSJUDLR         : std_logic_vector( 6 downto 0) := (others => '0'); -- player 2 keyboard controls
begin
	
	
	 

	u_clocks : entity work.PACMAN_CLOCKS
		port map (
		I_CLK_REF  => clk,
		I_RESET_L  => '1',
		--
		O_CLK_REF  => open,
		--
		O_ENA_12   => open,
		O_ENA_6    => open,
		O_CLK      => vid_clk,
		O_RESET    => open
		);	  


	ms_A2601: entity work.A2601
		port map(vid_clk, rst, cpu_d, cpu_a, cpu_r,pa, pb, inpt4, inpt5, colu, csyn, vsyn, hsyn, rgbx2, cv, au0, au1, av0, av1, ph0, ph1);
  
	O_VIDEO_R(3 downto 1) <= rgbx2(23 downto 21) ;
	O_VIDEO_R(0) <= '0';
	O_VIDEO_G(3 downto 1) <= rgbx2(15 downto 13) ;
	O_VIDEO_G(0) <= '0';
	O_VIDEO_B(3 downto 2) <= rgbx2(7 downto 6) ;	
	O_VIDEO_B(1 downto 0) <= "00";
	O_HSYNC   <= hsyn;
	O_VSYNC   <= vsyn;	
	
	
	dac_inst: dac 
		port map(audio, au, vid_clk, '0');	

		auv0 <= ("0" & unsigned(av0)) when (au0 = '1') else "00000";
		auv1 <= ("0" & unsigned(av1)) when (au1 = '1') else "00000";
		au <= std_logic_vector(auv0 + auv1);
		
		O_AUDIO_R <= audio;
		O_AUDIO_L <= audio;




	Inst_cart_rom: entity work.cart_rom PORT MAP(
		clk => vid_clk,
		data => d,
		addr => a
	);		 
	
--    cpu_d <= d when a(12) = '1' else "ZZZZZZZZ";
 process(ph0)
    begin
        if (ph0'event and ph0 = '1') then
			if res = '1' then
			rst <= '1';
			else
			rst <= '0';
			end if;
		end if;
            
    end process;

    -- Controller inputs sampling
    

    
    process(ph0)
    begin
        if (ph0'event and ph0 = '1') then
            ctrl_cntr <= ctrl_cntr + 1;
            if (ctrl_cntr = "1111") then    -- p_bs
                p_fn <=  p_a;
                pb(0) <= not p_s; 
            elsif (ctrl_cntr = "0111") then
                pa(7 downto 4) <=  (p_r and P1_CSJUDLR(0)) & (p_l and P1_CSJUDLR(1)) & (p_d and P1_CSJUDLR(2)) &  ( p_u and P1_CSJUDLR(3));
					 pa(3 downto 0) <= p2_r & p2_l & p2_d & p2_u;
                inpt4 <=  (p_a and P1_CSJUDLR(4));
					 inpt5 <= p2_a;
                
					 
					 --switches
					 for i in 0 to 1
					 loop
						if I_SW(i) = '1' then
							if sw_pressed(i) = '0' then
								sw_pressed(i) <= '1';
								sw_toggle(i)  <= NOT(sw_toggle(i));
							end if;
						else
							sw_pressed(i) <= '0';
						end if;
					end loop;
					 sw_toggle(2) <= NOT(I_SW(2)); --momentary, not slide toggle -- should this be active low ?
            end if;

           -- pb(7) <= pa(7) or p_fn; --sw1
           -- pb(6) <= pa(6) or p_fn; --sw2
           -- pb(1) <= pa(4) or p_fn; --select
           -- pb(3) <= pa(5) or p_fn; --b/w / colour
        end if;
    end process;
	 pb(7) <= sw_toggle(0);
	 pb(6) <= sw_toggle(1);
	 pb(1) <= sw_toggle(2);
	 pb(3) <= '1'; --1 colour / 0 bw
    pb(5) <= '1'; --nc ?
    pb(4) <= '1'; --nc
    pb(2) <= '1'; --nc
	 
    
	 -- leds to show state of switches
	 -- led1 difficulty switch 1 on/off
	 -- led2 difficulty switch 2 on/off
	 -- led3 select switch on/off
	 LED(1 downto 0) <=sw_toggle(1 downto 0);
	 LED(2) <= not sw_toggle(2); --active low;
	 
	 JOYSTICK_GND <= '0';
	 JOYSTICK2_GND <= '0';
	 

   

    sc_ram128x8: entity work.ram128x8
        port map(sc_clk, sc_r, sc_d_in, sc_d_out, sc_a);

    -- This clock is phase shifted so that we can use Xilinx synchronous block RAM.
    sc_clk <= not ph1;
    sc_r <= '0' when cpu_a(12 downto 7) = "100000" else '1';
    sc_d_in <= cpu_d;
    sc_a <= cpu_a(6 downto 0);

    -- ROM and SC output
    process(cpu_a, d, sc_d_out, sc)
    begin
        if (cpu_a(12 downto 7) = "100001" and sc = '1') then
            cpu_d <= sc_d_out;
        elsif (cpu_a(12 downto 7) = "100000" and sc = '1') then
            cpu_d <= "ZZZZZZZZ";
        elsif (cpu_a(12) = '1') then
            cpu_d <= d;
        else
            cpu_d <= "ZZZZZZZZ";
        end if;
    end process;

    with cpu_a(11 downto 10) select e0_bank <=
        e0_bank0 when "00",
        e0_bank1 when "01",
        e0_bank2 when "10",
        "111" when "11",
        "---" when others;

    tf_bank <= bank(1 downto 0) when (cpu_a(11) = '0') else "11";

    with bss select a <=
		"00" & cpu_a(11 downto 0) 					when BANK00,
		'0' & bank(0) & cpu_a(11 downto 0) 		when BANKF8,
		bank(1 downto 0) & cpu_a(11 downto 0) 	when BANKF6,
		'0' & bank(0) & cpu_a(11 downto 0) 		when BANKFE,
      "0" & e0_bank & cpu_a(9 downto 0) 		when BANKE0,
		'0' & tf_bank & cpu_a(10 downto 0) 		when BANK3F,
		"--------------" when others;

    bankswch: process(ph0)
    begin
        if (ph0'event and ph0 = '1') then
            if (rst = '1') then
                bank <= "0000";
                e0_bank0 <= "000";
                e0_bank1 <= "000";
                e0_bank2 <= "000";
            else
                case bss is
                    when BANKF8 =>
                        if (cpu_a = "1" & X"FF8") then
                            bank <= "0000";
                        elsif (cpu_a = "1" & X"FF9") then
                            bank <= "0001";
                        end if;
                    when BANKF6 =>
                        if (cpu_a = "1" & X"FF6") then
                            bank <= "0000";
                        elsif (cpu_a = "1" & X"FF7") then
                            bank <= "0001";
                        elsif (cpu_a = "1" & X"FF8") then
                            bank <= "0010";
                        elsif (cpu_a = "1" & X"FF9") then
                            bank <= "0011";
                        end if;
                    when BANKFE =>
                        if (cpu_a = "0" & X"1FE") then
                            bank <= "0000";
                        elsif (cpu_a = "1" & X"1FE") then
                            bank <= "0001";
                        end if;
                    when BANKE0 =>
                        if (cpu_a(12 downto 4) = "1" & X"FE" and cpu_a(3) = '0') then
                            e0_bank0 <= cpu_a(2 downto 0);
                        elsif (cpu_a(12 downto 4) = "1" & X"FE" and cpu_a(3) = '1') then
                            e0_bank1 <= cpu_a(2 downto 0);
                        elsif (cpu_a(12 downto 4) = "1" & X"FF" and cpu_a(3) = '0') then
                            e0_bank2 <= cpu_a(2 downto 0);
                        end if;
                    when BANK3F =>
                        --if (cpu_a(12 downto 6) = "0000000") then
                        if (cpu_a = "0" & X"03F") then
                            bank(1 downto 0) <= cpu_d(1 downto 0);
                        end if;
                    when others =>
                        null;
                end case;
            end if;
        end if;
    end process;

   
	inst_kbd : entity work.Keyboard
		generic map (clk_freq => 25) 
		port map (
			Reset     => '0',
			Clock     => vid_clk,
			PS2Clock  => PS2CLK1,
			PS2Data   => PS2DAT1,
			CodeReady => ps2_codeready,  --: out STD_LOGIC;
			ScanCode  => ps2_scancode    --: out STD_LOGIC_VECTOR(9 downto 0)
		);


	--	http://www.computer-engineering.org/ps2keyboard/scancodes2.html
	-- ScanCode(9)          : 1 = Extended  0 = Regular
	-- ScanCode(8)          : 1 = Break     0 = Make
	-- ScanCode(7 downto 0) : Key Code
	process(vid_clk)
	begin
		if rising_edge(vid_clk) then
			if rst = '1' then
				P1_CSJUDLR <= (others=>'1'); --active low inputs
				P2_CSJUDLR <= (others=>'1');
			elsif (ps2_codeready = '1') then
				case (ps2_scancode(7 downto 0)) is
					--when x"05" =>	P1_CSJUDLR(6) <=  ps2_scancode(8);     -- P1 coin "F1"
					--when x"04" =>	P2_CSJUDLR(6) <=  ps2_scancode(8);     -- P2 coin "F3"

					--when x"06" =>	P1_CSJUDLR(5) <=  ps2_scancode(8);     -- P1 start "F2"
					--when x"0c" =>	P2_CSJUDLR(5) <=  ps2_scancode(8);     -- P2 start "F4"

					when x"14" =>	P1_CSJUDLR(4) <=  ps2_scancode(8);     -- P1 jump "LCTRL"
										--P2_CSJUDLR(4) <=  ps2_scancode(8);     -- P2 jump "I"

					when x"75" =>	P1_CSJUDLR(3) <=  ps2_scancode(8);     -- P1 up arrow
										--P2_CSJUDLR(3) <=  ps2_scancode(8);     -- P2 up arrow

					when x"72" =>	P1_CSJUDLR(2) <=  ps2_scancode(8);     -- P1 down arrow
										--P2_CSJUDLR(2) <=  ps2_scancode(8);     -- P2 down arrow

					when x"6b" =>	P1_CSJUDLR(1) <=  ps2_scancode(8);     -- P1 left arrow
										--P2_CSJUDLR(1) <=  ps2_scancode(8);     -- P2 left arrow

					when x"74" =>	P1_CSJUDLR(0) <=  ps2_scancode(8);     -- P1 right arrow
										--P2_CSJUDLR(0) <=  ps2_scancode(8);     -- P2 right arrow

					when others => null;
				end case;
			end if;
		end if;
	end process;
	 
end arch;



