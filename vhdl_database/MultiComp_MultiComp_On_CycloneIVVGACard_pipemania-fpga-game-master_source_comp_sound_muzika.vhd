--------------------------------------------------------------------------------
-- PROJECT: PIPE MANIA - GAME FOR FPGA
--------------------------------------------------------------------------------
-- NAME:    MUZIKA
-- AUTHORS: Vojtěch Jeřábek <xjerab17@stud.feec.vutbr.cz>
-- LICENSE: The MIT License, please read LICENSE file
-- WEBSITE: https://github.com/jakubcabal/pipemania-fpga-game
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

--po privedeni enagle signalu na jednotlive vstupy je odehrana prislusna melodie

entity MUZIKA is
    Port ( PLACE_PIPE	: in  STD_LOGIC;
			CANT_PLACE	: in  STD_LOGIC;
			WIN_LEVEL		: in  STD_LOGIC;
			CLK 			: in  STD_LOGIC;
			RST 			: in  STD_LOGIC;
			GAME_OVER		: in  STD_LOGIC;
			MUSIC 			: out  STD_LOGIC);
end MUZIKA;

architecture Behavioral of MUZIKA is

   type state is (silent, A, H, G, C, step_down, step_down_tone_state, cant_place_tone_state, step_down_tone_state_prepare);
   type state0 is (no_sound, place_pipe_state, win_level_state, cant_place_state, game_over_state);
   signal present_st 			: state;
   signal next_st    			: state;
	signal present_st0 			: state0;
   signal next_st0    			: state0;
   signal G_TONE1 				: STD_LOGIC;
   signal A_TONE1 				: STD_LOGIC;
   signal H_TONE1 				: STD_LOGIC;
   signal C_TONE1 				: STD_LOGIC;
   signal G_TONE2 				: STD_LOGIC;
   signal A_TONE2 				: STD_LOGIC;
   signal H_TONE2 				: STD_LOGIC;
   signal C_TONE2 				: STD_LOGIC;
   signal G_TONE 					: STD_LOGIC;
   signal A_TONE 					: STD_LOGIC;
   signal H_TONE 					: STD_LOGIC;
   signal C_TONE 					: STD_LOGIC;
   signal cant_place_tone 		: STD_LOGIC;

	signal music_signal			: std_logic;
	signal music_out_enable		: std_logic;
	signal play_place_pipe		: std_logic;
	signal play_cant_place		: std_logic;
	signal playing					: std_logic;
	signal play_win_level		: std_logic;
	signal play_game_over		: std_logic;
	signal period_counter		: std_logic_vector(18 downto 0);
	signal lenght_signal			: std_logic_vector(18 downto 0);
	signal melody_counter		: std_logic_vector(27 downto 0);

begin
----melodie
----Pametova cast stavoveho automatu
   process (CLK)
   begin
      if (rising_edge(CLK)) then
         if (RST = '1') then
            present_st0 <= no_sound;
         else
            present_st0 <= next_st0;
         end if;
      end if;
   end process;

	process (CANT_PLACE, PLACE_PIPE, WIN_LEVEL, playing, present_st0, GAME_OVER)
   begin
      case present_st0 is
			when no_sound =>
				if (PLACE_PIPE = '1') then
					next_st0 <= place_pipe_state;
				elsif (WIN_LEVEL = '1') then
					next_st0 <= win_level_state;
				elsif (CANT_PLACE = '1') then
					next_st0 <= cant_place_state;
				elsif (GAME_OVER = '1') then
					next_st0 <= game_over_state;
				else
					next_st0 <= no_sound;
				end if;

				play_place_pipe <= '0';
				play_win_level <= '0';
				play_cant_place <= '0';
				play_game_over <= '0';

			when place_pipe_state =>
				if (playing = '1' AND WIN_LEVEL = '0' AND CANT_PLACE = '0' AND GAME_OVER = '0') then
					next_st0 <= place_pipe_state;
				else
					next_st0 <= no_sound;
				end if;

				play_win_level <= '0';
				play_place_pipe <= '1';
				play_cant_place <= '0';
				play_game_over <= '0';

			when win_level_state =>
				if (playing = '1' AND CANT_PLACE = '0' AND PLACE_PIPE = '0' AND GAME_OVER = '0') then
					next_st0 <= win_level_state;
				else
					next_st0 <= no_sound;
				end if;

				play_place_pipe <= '0';
				play_win_level <= '1';
				play_cant_place <= '0';
				play_game_over <= '0';

			when cant_place_state =>
				if (playing = '1' AND WIN_LEVEL = '0' AND PLACE_PIPE = '0' AND GAME_OVER = '0') then
					next_st0 <= cant_place_state;
				else
					next_st0 <= no_sound;
				end if;

				play_place_pipe <= '0';
				play_win_level <= '0';
				play_cant_place <= '1';
				play_game_over <= '0';

			when game_over_state =>
				if (playing = '1' AND WIN_LEVEL = '0' AND PLACE_PIPE = '0' AND CANT_PLACE = '0') then
					next_st0 <= game_over_state;
				else
					next_st0 <= no_sound;
				end if;

				play_game_over <= '1';
				play_place_pipe <= '0';
				play_win_level <= '0';
				play_cant_place <= '0';

			when others =>
				next_st0 <= no_sound;
				play_win_level <= '0';
				play_place_pipe <= '0';
				play_cant_place <= '0';
				play_game_over <= '0';

      end case;
   end process;
	--Melodie p�i polo�en� trubky
	process(clk) begin
		if (rising_edge(CLK)) then
			if (play_place_pipe = '1') then
				if (melody_counter > 0 AND melody_counter<1562501)	then
					G_TONE1 <= '1';
					A_TONE1 <= '0';
					H_TONE1 <= '0';
					C_TONE1 <= '0';
					melody_counter <= melody_counter + 1;
					playing <= '1';

				elsif (melody_counter>1562500 AND melody_counter<3125000) then
					G_TONE1 <= '0';
					A_TONE1 <= '1';
					H_TONE1 <= '0';
					C_TONE1 <= '0';
					melody_counter <= melody_counter + 1;
					playing <= '1';

				elsif (melody_counter=3125000) then
					melody_counter <= (others=>'0');
					playing <= '0';

				elsif (melody_counter=0) then
					G_TONE1 <= '0';
					A_TONE1 <= '0';
					H_TONE1 <= '0';
					C_TONE1 <= '0';
					playing <= '1';
					melody_counter <= melody_counter + 1;
				end if;

	--vyherni melodie
			elsif (play_win_level = '1') then
				if (melody_counter>0 AND melody_counter<18000000) then
					G_TONE2 <= '0';
					A_TONE2 <= '1';
					H_TONE2 <= '0';
					C_TONE2 <= '0';
					playing <= '1';
					melody_counter <= melody_counter + 1;

				elsif (melody_counter>18750000 AND melody_counter<24250001) then
					G_TONE2 <= '0';
					A_TONE2 <= '1';
					H_TONE2 <= '0';
					C_TONE2 <= '0';
					playing <= '1';
					melody_counter <= melody_counter + 1;

				elsif (melody_counter>25000000 AND melody_counter<37500001) then
					melody_counter <= (others=>'0');
					G_TONE2 <= '0';
					A_TONE2 <= '1';
					H_TONE2 <= '0';
					C_TONE2 <= '0';
					playing <= '1';
					melody_counter <= melody_counter + 1;

				elsif (melody_counter>37500000 AND melody_counter<50000001) then
					G_TONE2 <= '1';
					A_TONE2 <= '0';
					H_TONE2 <= '0';
					C_TONE2 <= '0';
					playing <= '1';
					melody_counter <= melody_counter + 1;

				elsif (melody_counter>50000000 AND melody_counter<62500001) then
					G_TONE2 <= '0';
					A_TONE2 <= '1';
					H_TONE2 <= '0';
					C_TONE2 <= '0';
					playing <= '1';
					melody_counter <= melody_counter + 1;

				elsif (melody_counter>62500000 AND melody_counter<68750001) then
					G_TONE2 <= '0';
					A_TONE2 <= '0';
					H_TONE2 <= '1';
					C_TONE2 <= '0';
					playing <= '1';
					melody_counter <= melody_counter + 1;

				elsif (melody_counter>68750000 AND melody_counter<75000001) then
					G_TONE2 <= '0';
					A_TONE2 <= '0';
					H_TONE2 <= '0';
					C_TONE2 <= '1';
					playing <= '1';
					melody_counter <= melody_counter + 1;

				elsif (melody_counter>75000000 AND melody_counter<100000000) then
					G_TONE2 <= '0';
					A_TONE2 <= '0';
					H_TONE2 <= '1';
					C_TONE2 <= '0';
					playing <= '1';
					melody_counter <= melody_counter + 1;

				elsif (melody_counter=100000000) then
					playing <= '0';
					melody_counter <= (others=>'0');

				elsif (melody_counter=0) then
					G_TONE2 <= '0';
					A_TONE2 <= '0';
					H_TONE2 <= '0';
					C_TONE2 <= '0';
					playing <= '1';
					melody_counter <= melody_counter + 1;

				else
					G_TONE2 <= '0';
					A_TONE2 <= '0';
					H_TONE2 <= '0';
					C_TONE2 <= '0';
					playing <= '1';
					melody_counter <= melody_counter + 1;
				end if;

-- kdyz nelze polozit trubku

			elsif	(play_cant_place='1') then
				if (melody_counter>0 AND melody_counter<12500000) then
					playing <= '1';
					cant_place_tone <= '1';
					melody_counter <= melody_counter + 1;

				elsif (melody_counter=12500000) then
					playing <= '0';
					melody_counter <= (others=>'0');

				elsif (melody_counter=0) then
					cant_place_tone <= '0';
					playing <= '1';
					melody_counter <= melody_counter + 1;

				else
					playing <= '1';
					melody_counter <= melody_counter + 1;
				end if;

--pri prohrani hry

			elsif	(play_game_over='1') then
				if (melody_counter>0 AND melody_counter<70000000) then
					playing <= '1';
					cant_place_tone <= '1';
					melody_counter <= melody_counter + 1;

				elsif (melody_counter=70000000) then
					playing <= '0';
					melody_counter <= (others=>'0');

				elsif (melody_counter=0) then
					cant_place_tone <= '0';
					playing <= '1';
					melody_counter <= melody_counter + 1;

				else
					playing <= '1';
					melody_counter <= melody_counter + 1;
				end if;



			else
				G_TONE2 <= '0';
				A_TONE2 <= '0';
				H_TONE2 <= '0';
				C_TONE2 <= '0';
				cant_place_tone <= '0';
				melody_counter <= (others=>'0');

			end if;
		end if;
	end process;

   ----------------------------------------------------------------
   -- STAVOVY AUTOMAT pro generovani tonu
   ----------------------------------------------------------------

   -- Pametova cast stavoveho automatu
   process (CLK)
   begin
      if (rising_edge(CLK)) then
         if (RST = '1') then
            present_st <= silent;
         else
            present_st <= next_st;
         end if;
      end if;
   end process;

-- Rozhodovaci cast stavoveho automatu
   process (C_TONE, A_TONE, H_TONE, G_TONE, present_st, cant_place_tone)
   begin
      case present_st is

         when silent =>
            if (C_TONE = '1') then
               next_st <= C;
				elsif (cant_place_tone = '1') then
               next_st <= cant_place_tone_state;
				elsif (G_TONE = '1') then
               next_st <= G;
				elsif (A_TONE = '1') then
               next_st <= A;
				elsif (H_TONE = '1') then
               next_st <= H;
            else
               next_st <= silent;
            end if;
				music_out_enable 	<= '0';
				lenght_signal <= (others=>'0');

         when cant_place_tone_state =>
            if (cant_place_tone = '1') then
               next_st <= cant_place_tone_state;
            else
               next_st <= silent;
            end if;
				lenght_signal 	<= std_logic_vector(to_unsigned(262113,19));
				music_out_enable <= '1';

         when G =>
            if (G_TONE = '1') then
               next_st <= G;
            else
               next_st <= silent;
            end if;

				lenght_signal 	<= std_logic_vector(to_unsigned(63777,19));
				music_out_enable <= '1';

         when A =>
            if (A_TONE = '1') then
               next_st <= A;
            else
               next_st <= silent;
            end if;

				lenght_signal 	<= std_logic_vector(to_unsigned(56819,19));
				music_out_enable <= '1';

         when H =>
            if (H_TONE = '1') then
               next_st <= H;
            else
               next_st <= silent;
            end if;

				lenght_signal 	<= std_logic_vector(to_unsigned(50620,19));
				music_out_enable <= '1';

         when C =>
            if (C_TONE = '1') then
               next_st <= C;
            else
               next_st <= silent;
            end if;

				lenght_signal 	<= std_logic_vector(to_unsigned(47779,19));
				music_out_enable <= '1';

         when others =>
				next_st <= silent;
				music_out_enable <= '0';
				lenght_signal 	<= std_logic_vector(to_unsigned(0,19));
      end case;
   end process;

--citac pro generovani jednotlivych tonu

	process(clk) begin
		if (rising_edge(CLK)) then
			if (music_out_enable = '1') then
				if (period_counter = lenght_signal) then
					period_counter <= (others=>'0');
					music_signal <= music_signal xor '1';
				else
					period_counter <= period_counter + 1;
				end if;
			else
				music_signal <= '0';
			end if;
		end if;
	end process;

	MUSIC	<= music_signal AND music_out_enable;
	G_TONE <=	G_TONE1 OR G_TONE2;
	A_TONE <=	A_TONE1 OR A_TONE2;
	H_TONE <=	H_TONE1 OR H_TONE2;
	C_TONE <=	C_TONE1 OR C_TONE2;



end Behavioral;
