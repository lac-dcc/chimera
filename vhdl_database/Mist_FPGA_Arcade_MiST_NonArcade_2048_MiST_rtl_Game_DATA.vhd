LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_MISC.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE WORK.GAME_TYPES.ALL;
USE WORK.GAME_UTILS.ALL;

ENTITY GAME_DATA IS
PORT
	(   
		-- INPUT
		clk					: IN STD_LOGIC;
		bootstrap			: IN STD_LOGIC;
		movepadDirection	: IN STD_LOGIC_VECTOR(3 downto 0);

		-- OUTPUT
		goingReady,
		isgameover,
		isvictory	: OUT STD_LOGIC;
		box_values	: OUT GAME_GRID;
		score		: OUT INTEGER RANGE 0 to 9999
	);
end  GAME_DATA;

ARCHITECTURE behavior of GAME_DATA IS

	-- Occorre tenere conto dello stato attuale, corrente e precedente
	signal	box_values_curr_status, 
			box_values_next_status,
			box_values_next_prev_status,
			box_values_prev_status : GAME_GRID := (others => (others => 0));
	
	signal curr_score	: INTEGER RANGE 0 to 9999 := 0;
	signal next_score	: INTEGER RANGE 0 to 9999 := 0;
	signal gameO		: STD_LOGIC := '0';
	signal youWin		: STD_LOGIC := '0';
	signal INrandNum	: STD_LOGIC_VECTOR(3 downto 0) 	:= "0000";
	signal randNum		: UNSIGNED(3 downto 0)			:= "0000";

	signal reg_state, reg_next_state : DATA_STATE := init;
	signal directionPosEdge,directionPosEdge_next : STD_LOGIC_VECTOR(3 downto 0);
	signal merge_reg, merge_next : STD_LOGIC_VECTOR(3 downto 0);
	signal btn_posedge0, btn_posedge1, btn_posedge2, btn_posedge3 : STD_LOGIC;
	signal btn_edgedet, btn_edgedet_next : STD_LOGIC_VECTOR(3 downto 0);

BEGIN

RANDGEN: entity work.GAME_RANDOMGEN
	port map
	(
		clk => clk,
		random_num => INrandNum
	);

btn_posedge0 <= (movepadDirection(0) xor btn_edgedet(0)) when (movepadDirection(0) = '0') else '0';
btn_posedge1 <= (movepadDirection(1) xor btn_edgedet(1)) when (movepadDirection(1) = '0') else '0';
btn_posedge2 <= (movepadDirection(2) xor btn_edgedet(2)) when (movepadDirection(2) = '0') else '0';
btn_posedge3 <= (movepadDirection(3) xor btn_edgedet(3)) when (movepadDirection(3) = '0') else '0';
btn_edgedet_next <= movepadDirection;	

process(clk, bootstrap, curr_score, box_values_curr_status, gameO, youWin)
	constant score_initial_status		: INTEGER RANGE 0 to 9999	:= 0;
	constant box_values_initial_status 	: GAME_GRID := (others => (others => 0));
	begin
			if(bootstrap = '1')
			then
				box_values_curr_status <= box_values_initial_status;
				curr_score <= score_initial_status;
				directionPosEdge <= (others => '0');
				merge_reg <= (others => '0');
				reg_state <= init;
				goingReady <= '1';
				gameO <= '0';
				youWin <= '0';
			elsif(clk'event and clk = '1')
			then
				randNum <= unsigned(INrandNum);
				directionPosEdge <= directionPosEdge_next;
				box_values_curr_status <= box_values_next_status;
				box_values_prev_status <= box_values_next_prev_status;
				curr_score <= next_score;
				reg_state <= reg_next_state;
				merge_reg <= merge_next;
				goingReady <= '0';
				btn_edgedet <= btn_edgedet_next;
				gameO <= checkGameOver(box_values_curr_status);
				youWin <= checkVictory(box_values_curr_status);
			end if;
			score <= curr_score;
			isgameover <= gameO;
			box_values <= box_values_curr_status;
			isvictory <= youWin;
	end process;
	
PROCESS (box_values_curr_status, curr_score, movepadDirection, box_values_next_status, box_values_prev_status,
		randNum, reg_next_state, reg_state, gameO, youWin, directionPosEdge, merge_reg,
		merge_next, next_score, btn_posedge3, btn_posedge2, btn_posedge1, btn_posedge0)

constant dirUP 		: std_logic_vector(3 downto 0):="1000";
constant dirDOWN 	: std_logic_vector(3 downto 0):="0001";
constant dirLEFT 	: std_logic_vector(3 downto 0):="0100";
constant dirRIGHT 	: std_logic_vector(3 downto 0):="0010";

variable x	: INTEGER RANGE 0 to 8;
variable y	: INTEGER RANGE 0 to 8;

BEGIN
	
	-- Aggiornamento segnali
	box_values_next_status <= box_values_curr_status;
	next_score <= curr_score;
	merge_next <= merge_reg;
	reg_next_state <= reg_state;
	directionPosEdge_next <= directionPosEdge;
	box_values_next_prev_status <= box_values_prev_status;
	
	-- Stato: bootstrap
	if(reg_state = init) 
	then
		reg_next_state <= randupdate;
		convertCoord(to_integer(randNum), x, y);
		box_values_next_status(x,y) <= 2;
	
	
	-- Stato: idle fintanto che non arriva una direzione
	elsif(reg_state = idle) 
	then
		box_values_next_prev_status <= box_values_curr_status;
		merge_next <= (others => '0');
		if(unsigned(directionPosEdge) > 0) then
			reg_next_state <= merge1;
			next_score <= curr_score + 1;
		else
			directionPosEdge_next <= btn_posedge3 & btn_posedge2 & btn_posedge1 & btn_posedge0;
		end if;
	
	-- Stato: merging
	elsif(reg_state = merge1 or reg_state = merge2 or reg_state = merge3) 
	then
		if(reg_state = merge1) 
		then
			reg_next_state <= move1;
		elsif(reg_state = merge2) 
		then
			reg_next_state <= move2;
		else
			reg_next_state <= move3;
		end if;
		
		case directionPosEdge is
			when dirRIGHT =>
				-- prima riga
				if(merge_reg(0) = '0')
				then
					if(box_values_curr_status(0,0) = box_values_curr_status(0,1) and  
						box_values_curr_status(0,2) = box_values_curr_status(0,3))
					then
						box_values_next_status(0,0) <= 0;
						box_values_next_status(0,1) <= 0;
						box_values_next_status(0,2) <= box_values_curr_status(0,0) + box_values_curr_status(0,1);
						box_values_next_status(0,3) <= box_values_curr_status(0,2) + box_values_curr_status(0,3);
						merge_next(0) <= '1';
--							next_score <= curr_score + box_values_next_status(0,2) + box_values_next_status(0,3);
					elsif(box_values_curr_status(0,2) = box_values_curr_status(0,3))
					then
						box_values_next_status(0,0) <= 0;
						box_values_next_status(0,1) <= box_values_curr_status(0,0);
						box_values_next_status(0,2) <= box_values_curr_status(0,1);
						box_values_next_status(0,3) <= box_values_curr_status(0,2) + box_values_curr_status(0,3);
						merge_next(0) <= '1';
--							next_score <= next_score + box_values_curr_status(0,2);
					elsif(box_values_curr_status(0,1) = box_values_curr_status(0,2))
					then
						box_values_next_status(0,0) <= 0;
						box_values_next_status(0,1) <= box_values_curr_status(0,0);
						box_values_next_status(0,2) <= box_values_curr_status(0,1) + box_values_curr_status(0,2);
						box_values_next_status(0,3) <= box_values_curr_status(0,3);
						merge_next(0) <= '1';
--							next_score <= next_score + box_values_next_status(0,2);
					elsif(box_values_curr_status(0,0) = box_values_curr_status(0,1)) 
					then
						box_values_next_status(0,0) <= 0;
						box_values_next_status(0,1) <= box_values_curr_status(0,0) + box_values_curr_status(0,1);
						box_values_next_status(0,2) <= box_values_curr_status(0,2);
						box_values_next_status(0,3) <= box_values_curr_status(0,3);
						merge_next(0) <= '1';
--							next_score <= next_score + box_values_next_status(0,1);
					end if;
				end if;
				
				-- seconda riga
				if(merge_reg(1) = '0')
				then
					if(box_values_curr_status(1,0) = box_values_curr_status(1,1) and  
						box_values_curr_status(1,2) = box_values_curr_status(1,3))
					then
						box_values_next_status(1,0) <= 0;
						box_values_next_status(1,1) <= 0;
						box_values_next_status(1,2) <= box_values_curr_status(1,0) + box_values_curr_status(1,1);
						box_values_next_status(1,3) <= box_values_curr_status(1,2) + box_values_curr_status(1,3);
						merge_next(1) <= '1';
--							next_score <= next_score + box_values_next_status(1,2) + box_values_next_status(1,3);
					elsif(box_values_curr_status(1,2) = box_values_curr_status(1,3))
					then
						box_values_next_status(1,0) <= 0;
						box_values_next_status(1,1) <= box_values_curr_status(1,0);
						box_values_next_status(1,2) <= box_values_curr_status(1,1);
						box_values_next_status(1,3) <= box_values_curr_status(1,2)+box_values_curr_status(1,3);
						merge_next(1) <= '1';
--							next_score <= next_score + box_values_next_status(1,3);
					elsif(box_values_curr_status(1,1) = box_values_curr_status(1,2))
					then
						box_values_next_status(1,0) <= 0;
						box_values_next_status(1,1) <= box_values_curr_status(1,0);
						box_values_next_status(1,2) <= box_values_curr_status(1,1)+box_values_curr_status(1,2);
						box_values_next_status(1,3) <= box_values_curr_status(1,3);
						merge_next(1) <= '1';
--							next_score <= next_score + box_values_next_status(1,2);
					elsif(box_values_curr_status(1,0) = box_values_curr_status(1,1)) 
					then
						box_values_next_status(1,0) <= 0;
						box_values_next_status(1,1) <= box_values_curr_status(1,0) + box_values_curr_status(1,1);
						box_values_next_status(1,2) <= box_values_curr_status(1,2);
						box_values_next_status(1,3) <= box_values_curr_status(1,3);
						merge_next(1) <= '1';
--							next_score <= box_values_curr_status(1,0)+box_values_curr_status(1,1);
					end if;
				end if;
--					
				-- terza riga
				if(merge_reg(2) = '0') 
				then
					if(box_values_curr_status(2,0) = box_values_curr_status(2,1) and  
						box_values_curr_status(2,2) = box_values_curr_status(2,3))
					then
						box_values_next_status(2,0) <= 0;
						box_values_next_status(2,1) <= 0;
						box_values_next_status(2,2) <= box_values_curr_status(2,0) + box_values_curr_status(2,1);
						box_values_next_status(2,3) <= box_values_curr_status(2,2) + box_values_curr_status(2,3);
						merge_next(2) <= '1';
--							next_score <= next_score + box_values_next_status(2,2) + box_values_next_status(2,3);
					elsif(box_values_curr_status(2,2) = box_values_curr_status(2,3))
					then
						box_values_next_status(2,0) <= 0;
						box_values_next_status(2,1) <= box_values_curr_status(2,0);
						box_values_next_status(2,2) <= box_values_curr_status(2,1);
						box_values_next_status(2,3) <= box_values_curr_status(2,2) + box_values_curr_status(2,3);
						merge_next(2) <= '1';
--							next_score <= next_score + box_values_next_status(2,3);
					elsif(box_values_curr_status(2,1) = box_values_curr_status(2,2))
					then
						box_values_next_status(2,0) <= 0;
						box_values_next_status(2,1) <= box_values_curr_status(2,0);
						box_values_next_status(2,2) <= box_values_curr_status(2,1) + box_values_curr_status(2,2);
						box_values_next_status(2,3) <= box_values_curr_status(2,3);
						merge_next(2) <= '1';
--							next_score <= next_score + box_values_next_status(2,2);
					elsif(box_values_curr_status(2,0) = box_values_curr_status(2,1)) 
					then
						box_values_next_status(2,0) <= 0;
						box_values_next_status(2,1) <= box_values_curr_status(2,0) + box_values_curr_status(2,1);
						box_values_next_status(2,2) <= box_values_curr_status(2,2);
						box_values_next_status(2,3) <= box_values_curr_status(2,3);
						merge_next(2) <= '1';
--							next_score <= next_score + box_values_next_status(2,1);
					end if;
				end if;
				
				-- quarta riga
				if(merge_reg(3) = '0') 
				then
					if(box_values_curr_status(3,0) = box_values_curr_status(3,1) and  
						box_values_curr_status(3,2) = box_values_curr_status(3,3))
					then
						box_values_next_status(3,0) <= 0;
						box_values_next_status(3,1) <= 0;
						box_values_next_status(3,2) <= box_values_curr_status(3,0) + box_values_curr_status(3,1);
						box_values_next_status(3,3) <= box_values_curr_status(3,2) + box_values_curr_status(3,3);
						merge_next(3) <= '1';
--							next_score <= next_score + box_values_next_status(3,2) + box_values_next_status(3,3);
					elsif(box_values_curr_status(3,2) = box_values_curr_status(3,3))
					then
						box_values_next_status(3,0) <= 0;
						box_values_next_status(3,1) <= box_values_curr_status(3,0);
						box_values_next_status(3,2) <= box_values_curr_status(3,1);
						box_values_next_status(3,3) <= box_values_curr_status(3,2) + box_values_curr_status(3,3);
						merge_next(3) <= '1';
--							next_score <= next_score + box_values_next_status(3,3);
					elsif(box_values_curr_status(3,1) = box_values_curr_status(3,2))
					then
						box_values_next_status(3,0) <= 0;
						box_values_next_status(3,1) <= box_values_curr_status(3,0);
						box_values_next_status(3,2) <= box_values_curr_status(3,1) + box_values_curr_status(3,2);
						box_values_next_status(3,3) <= box_values_curr_status(3,3);
						merge_next(3) <= '1';
--							next_score <= next_score + box_values_next_status(3,2);
					elsif(box_values_curr_status(3,0) = box_values_curr_status(3,1)) 
					then
						box_values_next_status(3,0) <= 0;
						box_values_next_status(3,1) <= box_values_curr_status(3,0) + box_values_curr_status(3,1);
						box_values_next_status(3,2) <= box_values_curr_status(3,2);
						box_values_next_status(3,3) <= box_values_curr_status(3,3);
						merge_next(3) <= '1';
--							next_score <= next_score + box_values_next_status(3,1);
					end if;
				end if;
			when dirLEFT =>
				-- prima riga
				if(merge_reg(0)='0')
				then
					if(box_values_curr_status(0,0) = box_values_curr_status(0,1) and  
						box_values_curr_status(0,2) = box_values_curr_status(0,3))
					then
						box_values_next_status(0,0) <= box_values_curr_status(0,0) + box_values_curr_status(0,1);
						box_values_next_status(0,1) <= box_values_curr_status(0,2) + box_values_curr_status(0,3);
						box_values_next_status(0,2) <= 0;
						box_values_next_status(0,3) <= 0;
						merge_next(0) <= '1';
--							next_score <= next_score + box_values_next_status(0,1) + box_values_next_status(0,0);
					elsif(box_values_curr_status(0,0) = box_values_curr_status(0,1))
					then
						box_values_next_status(0,0) <= box_values_curr_status(0,0) + box_values_curr_status(0,1);
						box_values_next_status(0,1) <= box_values_curr_status(0,2);
						box_values_next_status(0,2) <= box_values_curr_status(0,3);
						box_values_next_status(0,3) <= 0;
						merge_next(0) <= '1';
--							next_score <= next_score + box_values_next_status(0,0);
					elsif(box_values_curr_status(0,1) = box_values_curr_status(0,2))
					then
						box_values_next_status(0,0) <= box_values_curr_status(0,0);
						box_values_next_status(0,1) <= box_values_curr_status(0,1) + box_values_curr_status(0,2);
						box_values_next_status(0,2) <= box_values_curr_status(0,3);
						box_values_next_status(0,3) <= 0;
						merge_next(0) <= '1';
--							next_score <= next_score + box_values_next_status(0,1);
					elsif(box_values_curr_status(0,2) = box_values_curr_status(0,3)) 
					then
						box_values_next_status(0,0) <= box_values_curr_status(0,0);
						box_values_next_status(0,1) <= box_values_curr_status(0,1);
						box_values_next_status(0,2) <= box_values_curr_status(0,2) + box_values_curr_status(0,3);
						box_values_next_status(0,3) <= 0;
						merge_next(0) <= '1';
--							next_score <= next_score + box_values_next_status(0,2);
					end if;
				end if;
				-- seconda riga
				if(merge_reg(1) = '0')
				then
					if(box_values_curr_status(1,0) = box_values_curr_status(1,1) and  
						box_values_curr_status(1,2) = box_values_curr_status(1,3))
					then
						box_values_next_status(1,0) <= box_values_curr_status(1,0) + box_values_curr_status(1,1);
						box_values_next_status(1,1) <= box_values_curr_status(1,2) + box_values_curr_status(1,3);
						box_values_next_status(1,2) <= 0;
						box_values_next_status(1,3) <= 0;
						merge_next(1) <= '1';
--							next_score <= next_score + box_values_next_status(1,0) + box_values_next_status(1,1);
					elsif(box_values_curr_status(1,0) = box_values_curr_status(1,1))
					then
						box_values_next_status(1,0) <= box_values_curr_status(1,0) + box_values_curr_status(1,1);
						box_values_next_status(1,1) <= box_values_curr_status(1,2);
						box_values_next_status(1,2) <= box_values_curr_status(1,3);
						box_values_next_status(1,3) <= 0;
						merge_next(1) <= '1';
--							next_score <= next_score + box_values_next_status(1,0);
					elsif(box_values_curr_status(1,1) = box_values_curr_status(1,2))
					then
						box_values_next_status(1,0) <= box_values_curr_status(1,0);
						box_values_next_status(1,1) <= box_values_curr_status(1,1) + box_values_curr_status(1,2);
						box_values_next_status(1,2) <= box_values_curr_status(1,3);
						box_values_next_status(1,3) <= 0;
						merge_next(1) <= '1';
--							next_score <= next_score + box_values_next_status(1,1);
					elsif(box_values_curr_status(1,2) = box_values_curr_status(1,3)) 
					then
						box_values_next_status(1,0) <= box_values_curr_status(1,0);
						box_values_next_status(1,1) <= box_values_curr_status(1,1);
						box_values_next_status(1,2) <= box_values_curr_status(1,2) + box_values_curr_status(1,3);
						box_values_next_status(1,3) <= 0;
						merge_next(1) <= '1';
--							next_score <= next_score + box_values_next_status(1,2);
					end if;
				end if;
				-- terza riga
				if(merge_reg(2) = '0')
				then
					if(box_values_curr_status(2,0) = box_values_curr_status(2,1) and  
						box_values_curr_status(2,2) = box_values_curr_status(2,3))
					then
						box_values_next_status(2,0) <= box_values_curr_status(2,0) + box_values_curr_status(2,1);
						box_values_next_status(2,1) <= box_values_curr_status(2,2) + box_values_curr_status(2,3);
						box_values_next_status(2,2) <= 0;
						box_values_next_status(2,3) <= 0;
						merge_next(2) <= '1';
--							next_score <= next_score + box_values_next_status(2,1) + box_values_next_status(2,0);
					elsif(box_values_curr_status(2,0) = box_values_curr_status(2,1))
					then
						box_values_next_status(2,0) <= box_values_curr_status(2,0) + box_values_curr_status(2,1);
						box_values_next_status(2,1) <= box_values_curr_status(2,2);
						box_values_next_status(2,2) <= box_values_curr_status(2,3);
						box_values_next_status(2,3) <= 0;
						merge_next(2) <= '1';
--							next_score <= next_score + box_values_next_status(2,0);
					elsif(box_values_curr_status(2,1) = box_values_curr_status(2,2))
					then
						box_values_next_status(2,0) <= box_values_curr_status(2,0);
						box_values_next_status(2,1) <= box_values_curr_status(2,1) + box_values_curr_status(2,2);
						box_values_next_status(2,2) <= box_values_curr_status(2,3);
						box_values_next_status(2,3) <= 0;
						merge_next(2) <= '1';
--							next_score <= next_score + box_values_next_status(2,1);
					elsif(box_values_curr_status(2,2) = box_values_curr_status(2,3)) 
					then
						box_values_next_status(2,0) <= box_values_curr_status(2,0);
						box_values_next_status(2,1) <= box_values_curr_status(2,1);
						box_values_next_status(2,2) <= box_values_curr_status(2,2) + box_values_curr_status(2,3);
						box_values_next_status(2,3) <= 0;
						merge_next(2) <= '1';
--							next_score <= next_score + box_values_next_status(2,2);
					end if;
				end if;
				-- quarta riga
				if(merge_reg(3) = '0')
				then
					if(box_values_curr_status(3,0) = box_values_curr_status(3,1) and  
						box_values_curr_status(3,2) = box_values_curr_status(3,3))
					then
						box_values_next_status(3,0) <= box_values_curr_status(3,0) + box_values_curr_status(3,1);
						box_values_next_status(3,1) <= box_values_curr_status(3,2) + box_values_curr_status(3,3);
						box_values_next_status(3,2) <= 0;
						box_values_next_status(3,3) <= 0;
						merge_next(3) <= '1';
--							next_score <= next_score + box_values_next_status(3,0) + box_values_next_status(3,1);
					elsif(box_values_curr_status(3,0) = box_values_curr_status(3,1))
					then
						box_values_next_status(3,0) <= box_values_curr_status(3,0) + box_values_curr_status(3,1);
						box_values_next_status(3,1) <= box_values_curr_status(3,2);
						box_values_next_status(3,2) <= box_values_curr_status(3,3);
						box_values_next_status(3,3) <= 0;
						merge_next(3) <= '1';
--							next_score <= next_score + box_values_next_status(3,0);
					elsif(box_values_curr_status(3,1) = box_values_curr_status(3,2))
					then
						box_values_next_status(3,0) <= box_values_curr_status(3,0);
						box_values_next_status(3,1) <= box_values_curr_status(3,1) + box_values_curr_status(3,2);
						box_values_next_status(3,2) <= box_values_curr_status(3,3);
						box_values_next_status(3,3) <= 0;
						merge_next(3) <= '1';
--							next_score <= next_score + box_values_next_status(3,1);
					elsif(box_values_curr_status(3,2) = box_values_curr_status(3,3)) 
					then
						box_values_next_status(3,0) <= box_values_curr_status(3,0);
						box_values_next_status(3,1) <= box_values_curr_status(3,1);
						box_values_next_status(3,2) <= box_values_curr_status(3,2) + box_values_curr_status(3,3);
						box_values_next_status(3,3) <= 0;
						merge_next(3) <= '1';
--							next_score <= next_score + box_values_next_status(3,2);
					end if;
				end if;
			when dirUP =>
				-- prima colonna
				if(merge_reg(0) = '0')
				then
					if(box_values_curr_status(0,0) = box_values_curr_status(1,0) 
						and box_values_curr_status(2,0) = box_values_curr_status(3,0))
					then
						box_values_next_status(0,0) <= box_values_curr_status(0,0) + box_values_curr_status(1,0);
						box_values_next_status(1,0) <= box_values_curr_status(2,0) + box_values_curr_status(3,0);
						box_values_next_status(2,0) <= 0;
						box_values_next_status(3,0) <= 0;
						merge_next(0) <= '1';
--							next_score <= next_score + box_values_next_status(1,0) + box_values_next_status(0,0);
					elsif(box_values_curr_status(0,0) = box_values_curr_status(1,0))
					then
						box_values_next_status(0,0) <= box_values_curr_status(0,0) + box_values_curr_status(1,0);
						box_values_next_status(1,0) <= box_values_curr_status(2,0);
						box_values_next_status(2,0) <= box_values_curr_status(3,0);
						box_values_next_status(3,0) <= 0;
						merge_next(0) <= '1';
--							next_score <= next_score + box_values_next_status(0,0);
					elsif(box_values_curr_status(1,0) = box_values_curr_status(2,0))
					then
						box_values_next_status(0,0) <= box_values_curr_status(0,0);
						box_values_next_status(1,0) <= box_values_curr_status(1,0) + box_values_curr_status(2,0);
						box_values_next_status(2,0) <= box_values_curr_status(3,0);
						box_values_next_status(3,0) <= 0;
						merge_next(0) <= '1';
--							next_score <= next_score + box_values_next_status(1,0);
					elsif(box_values_curr_status(2,0) = box_values_curr_status(3,0))
					then
						box_values_next_status(0,0) <= box_values_curr_status(0,0);
						box_values_next_status(1,0) <= box_values_curr_status(1,0);
						box_values_next_status(2,0) <= box_values_curr_status(2,0) + box_values_curr_status(3,0);
						box_values_next_status(3,0) <= 0;
						merge_next(0) <= '1';
--							next_score <= next_score + box_values_next_status(2,0);
					end if;
				end if;
				-- seconda colonna
				if(merge_reg(1) = '0')
				then
					if(box_values_curr_status(0,1) = box_values_curr_status(1,1) 
						and box_values_curr_status(2,1) = box_values_curr_status(3,1))
					then
						box_values_next_status(0,1) <= box_values_curr_status(0,1) + box_values_curr_status(1,1);
						box_values_next_status(1,1) <= box_values_curr_status(2,1) + box_values_curr_status(3,1);
						box_values_next_status(2,1) <= 0;
						box_values_next_status(3,1) <= 0;
						merge_next(1) <= '1';
--							next_score <= next_score + box_values_next_status(0,1) + box_values_next_status(1,1);
					elsif(box_values_curr_status(0,1) = box_values_curr_status(1,1))
					then
						box_values_next_status(0,1) <= box_values_curr_status(0,1) + box_values_curr_status(1,1);
						box_values_next_status(1,1) <= box_values_curr_status(2,1);
						box_values_next_status(2,1) <= box_values_curr_status(3,1);
						box_values_next_status(3,1) <= 0;
						merge_next(1) <= '1';
--							next_score <= next_score + box_values_next_status(0,1);
					elsif(box_values_curr_status(1,1) = box_values_curr_status(2,1))
					then
						box_values_next_status(0,1) <= box_values_curr_status(0,1);
						box_values_next_status(1,1) <= box_values_curr_status(1,1) + box_values_curr_status(2,1);
						box_values_next_status(2,1) <= box_values_curr_status(3,1);
						box_values_next_status(3,1) <= 0;
						merge_next(1) <= '1';
--							next_score <= next_score + box_values_next_status(1,1);
					elsif(box_values_curr_status(2,1) = box_values_curr_status(3,1))
					then
						box_values_next_status(0,1) <= box_values_curr_status(0,1);
						box_values_next_status(1,1) <= box_values_curr_status(1,1);
						box_values_next_status(2,1) <= box_values_curr_status(2,1) + box_values_curr_status(3,1);
						box_values_next_status(3,1) <= 0;
						merge_next(1) <= '1';
--							next_score <= next_score + box_values_next_status(2,1);
					end if;
				end if;
				-- terza colonna
				if(merge_reg(2) = '0')
				then
					if(box_values_curr_status(0,2) = box_values_curr_status(1,2) 
						and box_values_curr_status(2,2) = box_values_curr_status(3,2))
					then
						box_values_next_status(0,2) <= box_values_curr_status(0,2) + box_values_curr_status(1,2);
						box_values_next_status(1,2) <= box_values_curr_status(2,2) + box_values_curr_status(3,2);
						box_values_next_status(2,2) <= 0;
						box_values_next_status(3,2) <= 0;
						merge_next(2) <= '1';
--							next_score <= next_score + box_values_next_status(0,2) + box_values_next_status(1,2);
					elsif(box_values_curr_status(0,2) = box_values_curr_status(1,2))
					then
						box_values_next_status(0,2) <= box_values_curr_status(0,2) + box_values_curr_status(1,2);
						box_values_next_status(1,2) <= box_values_curr_status(2,2);
						box_values_next_status(2,2) <= box_values_curr_status(3,2);
						box_values_next_status(3,2) <= 0;
						merge_next(2) <= '1';
--							next_score <= next_score + box_values_next_status(0,2);
					elsif(box_values_curr_status(1,2) = box_values_curr_status(2,2))
					then
						box_values_next_status(0,2) <= box_values_curr_status(0,2);
						box_values_next_status(1,2) <= box_values_curr_status(1,2) + box_values_curr_status(2,2);
						box_values_next_status(2,2) <= box_values_curr_status(3,2);
						box_values_next_status(3,2) <= 0;
						merge_next(2) <= '1';
--							next_score <= next_score + box_values_next_status(1,2);
					elsif(box_values_curr_status(2,2) = box_values_curr_status(3,2))
					then
						box_values_next_status(0,2) <= box_values_curr_status(0,2);
						box_values_next_status(1,2) <= box_values_curr_status(1,2);
						box_values_next_status(2,2) <= box_values_curr_status(2,2) + box_values_curr_status(3,2);
						box_values_next_status(3,2) <= 0;
--							next_score <= next_score + box_values_next_status(2,2);
						merge_next(2) <= '1';
					end if;
				end if;
				-- quarta colonna
				if(merge_reg(3) = '0')
				then
					if(box_values_curr_status(0,3) = box_values_curr_status(1,3) 
						and box_values_curr_status(2,3) = box_values_curr_status(3,3))
					then
						box_values_next_status(0,3) <= box_values_curr_status(0,3) + box_values_curr_status(1,3);
						box_values_next_status(1,3) <= box_values_curr_status(2,3) + box_values_curr_status(3,3);
						box_values_next_status(2,3) <= 0;
						box_values_next_status(3,3) <= 0;
						merge_next(3) <= '1';
--							next_score <= next_score + box_values_next_status(0,3) + box_values_next_status(1,3);
					elsif(box_values_curr_status(0,3) = box_values_curr_status(1,3))
					then
						box_values_next_status(0,3) <= box_values_curr_status(0,3) + box_values_curr_status(1,3);
						box_values_next_status(1,3) <= box_values_curr_status(2,3);
						box_values_next_status(2,3) <= box_values_curr_status(3,3);
						box_values_next_status(3,3) <= 0;
						merge_next(3) <= '1';
--							next_score <= next_score + box_values_next_status(0,3);
					elsif(box_values_curr_status(1,3) = box_values_curr_status(2,3))
					then
						box_values_next_status(0,3) <= box_values_curr_status(0,3);
						box_values_next_status(1,3) <= box_values_curr_status(1,3) + box_values_curr_status(2,3);
						box_values_next_status(2,3) <= box_values_curr_status(3,3);
						box_values_next_status(3,3) <= 0;
						merge_next(3) <= '1';
--							next_score <= next_score + box_values_next_status(1,3);
					elsif(box_values_curr_status(2,3) = box_values_curr_status(3,3))
					then
						box_values_next_status(0,3) <= box_values_curr_status(0,3);
						box_values_next_status(1,3) <= box_values_curr_status(1,3);
						box_values_next_status(2,3) <= box_values_curr_status(2,3) + box_values_curr_status(3,3);
						box_values_next_status(3,3) <= 0;
						merge_next(3) <= '1';
--							next_score <= next_score + box_values_next_status(2,3);
					end if;
				end if;
			when dirDOWN =>
				-- prima colonna
				if(merge_reg(0) = '0')
				then
					if(box_values_curr_status(0,0) = box_values_curr_status(1,0) 
						and box_values_curr_status(2,0) = box_values_curr_status(3,0))
					then
						box_values_next_status(0,0) <= 0;
						box_values_next_status(1,0) <= 0;
						box_values_next_status(2,0) <= box_values_curr_status(0,0) + box_values_curr_status(1,0);
						box_values_next_status(3,0) <= box_values_curr_status(2,0) + box_values_curr_status(3,0);
						merge_next(0) <= '1';
--							next_score <= next_score + box_values_next_status(2,0) + box_values_next_status(3,0);
					elsif(box_values_curr_status(2,0) = box_values_curr_status(3,0))
					then
						box_values_next_status(0,0) <= 0;
						box_values_next_status(1,0) <= box_values_curr_status(0,0);
						box_values_next_status(2,0) <= box_values_curr_status(1,0);
						box_values_next_status(3,0) <= box_values_curr_status(2,0) + box_values_curr_status(3,0);
						merge_next(0) <= '1';
--							next_score <= next_score + box_values_next_status(3,0);
					elsif(box_values_curr_status(1,0) = box_values_curr_status(2,0))
					then
						box_values_next_status(0,0) <= 0;
						box_values_next_status(1,0) <= box_values_curr_status(0,0);
						box_values_next_status(2,0) <= box_values_curr_status(1,0) + box_values_curr_status(2,0);
						box_values_next_status(3,0) <= box_values_curr_status(3,0);
						merge_next(0) <= '1';
--							next_score <= next_score + box_values_next_status(2,0);
					elsif(box_values_curr_status(0,0) = box_values_curr_status(1,0))
					then
						box_values_next_status(0,0) <= 0;
						box_values_next_status(1,0) <= box_values_curr_status(0,0) + box_values_curr_status(1,0);
						box_values_next_status(2,0) <= box_values_curr_status(2,0);
						box_values_next_status(3,0) <= box_values_curr_status(3,0);
						merge_next(0) <= '1';
--							next_score <= next_score + box_values_next_status(1,0);
					end if;
				end if;
				-- seconda colonna
				if(merge_reg(1) = '0')
				then
					if(box_values_curr_status(0,1) = box_values_curr_status(1,1) 
						and box_values_curr_status(2,1) = box_values_curr_status(3,1))
					then
						box_values_next_status(0,1) <= 0;
						box_values_next_status(1,1) <= 0;
						box_values_next_status(2,1) <= box_values_curr_status(0,1) + box_values_curr_status(1,1);
						box_values_next_status(3,1) <= box_values_curr_status(2,1) + box_values_curr_status(3,1);
						merge_next(1) <= '1';
--							next_score <= next_score + box_values_next_status(3,1) + box_values_next_status(2,1);
					elsif(box_values_curr_status(2,1) = box_values_curr_status(3,1))
					then
						box_values_next_status(0,1) <= 0;
						box_values_next_status(1,1) <= box_values_curr_status(0,1);
						box_values_next_status(2,1) <= box_values_curr_status(1,1);
						box_values_next_status(3,1) <= box_values_curr_status(2,1) + box_values_curr_status(3,1);
						merge_next(1) <= '1';
--							next_score <= next_score + box_values_next_status(3,1);
					elsif(box_values_curr_status(1,1) = box_values_curr_status(2,1))
					then
						box_values_next_status(0,1) <= 0;
						box_values_next_status(1,1) <= box_values_curr_status(0,1);
						box_values_next_status(2,1) <= box_values_curr_status(1,1) + box_values_curr_status(2,1);
						box_values_next_status(3,1) <= box_values_curr_status(3,1);
						merge_next(1) <= '1';
--							next_score <= next_score + box_values_next_status(2,1);
					elsif(box_values_curr_status(0,1) = box_values_curr_status(1,1))
					then
						box_values_next_status(0,1) <= 0;
						box_values_next_status(1,1) <= box_values_curr_status(0,1) + box_values_curr_status(1,1);
						box_values_next_status(2,1) <= box_values_curr_status(2,1);
						box_values_next_status(3,1) <= box_values_curr_status(3,1);
						merge_next(1) <= '1';
--							next_score <= next_score + box_values_next_status(1,1);
					end if;
				end if;
				-- terza colonna
				if(merge_reg(2) = '0')
				then
					if(box_values_curr_status(0,2) = box_values_curr_status(1,2) 
						and box_values_curr_status(2,2) = box_values_curr_status(3,2))
					then
						box_values_next_status(0,2) <= 0;
						box_values_next_status(1,2) <= 0;
						box_values_next_status(2,2) <= box_values_curr_status(0,2) + box_values_curr_status(1,2);
						box_values_next_status(3,2) <= box_values_curr_status(2,2) + box_values_curr_status(3,2);
						merge_next(2) <= '1';
--							next_score <= next_score + box_values_next_status(2,2) + box_values_next_status(3,2);
					elsif(box_values_curr_status(2,2) = box_values_curr_status(3,2))
					then
						box_values_next_status(0,2) <= 0;
						box_values_next_status(1,2) <= box_values_curr_status(0,2);
						box_values_next_status(2,2) <= box_values_curr_status(1,2);
						box_values_next_status(3,2) <= box_values_curr_status(2,2) + box_values_curr_status(3,2);
						merge_next(2) <= '1';
--							next_score <= next_score + box_values_next_status(3,2);
					elsif(box_values_curr_status(1,2) = box_values_curr_status(2,2))
					then
						box_values_next_status(0,2) <= 0;
						box_values_next_status(1,2) <= box_values_curr_status(0,2);
						box_values_next_status(2,2) <= box_values_curr_status(1,2) + box_values_curr_status(2,2);
						box_values_next_status(3,2) <= box_values_curr_status(3,2);
						merge_next(2) <= '1';
--							next_score <= next_score + box_values_next_status(2,2);
					elsif(box_values_curr_status(0,2) = box_values_curr_status(1,2))
					then
						box_values_next_status(0,2) <= 0;
						box_values_next_status(1,2) <= box_values_curr_status(0,2) + box_values_curr_status(1,2);
						box_values_next_status(2,2) <= box_values_curr_status(2,2);
						box_values_next_status(3,2) <= box_values_curr_status(3,2);
						merge_next(2) <= '1';
--							next_score <= next_score + box_values_next_status(1,2);
					end if;
				end if;
				-- quarta colonna
				if(merge_reg(3) = '0')
				then
					if(box_values_curr_status(0,3) = box_values_curr_status(1,3) 
						and box_values_curr_status(2,3) = box_values_curr_status(3,3))
					then
						box_values_next_status(0,3) <= 0;
						box_values_next_status(1,3) <= 0;
						box_values_next_status(2,3) <= box_values_curr_status(0,3) + box_values_curr_status(1,3);
						box_values_next_status(3,3) <= box_values_curr_status(2,3) + box_values_curr_status(3,3);
						merge_next(3) <= '1';
--							next_score <= next_score + box_values_next_status(2,3) + box_values_next_status(3,3);
					elsif(box_values_curr_status(2,3) = box_values_curr_status(3,3))
					then
						box_values_next_status(0,3) <= 0;
						box_values_next_status(1,3) <= box_values_curr_status(0,3);
						box_values_next_status(2,3) <= box_values_curr_status(1,3);
						box_values_next_status(3,3) <= box_values_curr_status(2,3) + box_values_curr_status(3,3);
						merge_next(3) <= '1';
--							next_score <= next_score + box_values_next_status(3,3);
					elsif(box_values_curr_status(1,3) = box_values_curr_status(2,3))
					then
						box_values_next_status(0,3) <= 0;
						box_values_next_status(1,3) <= box_values_curr_status(0,3);
						box_values_next_status(2,3) <= box_values_curr_status(1,3) + box_values_curr_status(2,3);
						box_values_next_status(3,3) <= box_values_curr_status(3,3);
						merge_next(3) <= '1';
--							next_score <= next_score + box_values_next_status(2,3);
					elsif(box_values_curr_status(0,3) = box_values_curr_status(1,3))
					then
						box_values_next_status(0,3) <= 0;
						box_values_next_status(1,3) <= box_values_curr_status(0,3) + box_values_curr_status(1,3);
						box_values_next_status(2,3) <= box_values_curr_status(2,3);
						box_values_next_status(3,3) <= box_values_curr_status(3,3);
						merge_next(3) <= '1';
--							next_score <= next_score + box_values_next_status(1,3);
					end if;
				end if;
			when others =>
				reg_next_state <= idle;
		end case;
		
	-- Stato: movimenti
	elsif(reg_state = move1 or reg_state = move2 or reg_state = move3)
	then
		if(reg_state = move1) then
			reg_next_state <= merge2;
		elsif(reg_state = move2) then
			reg_next_state <= merge3;
		else
			reg_next_state <= checkupdate;
		end if;
		
		case directionPosEdge is
		
			-- DESTRA
			when dirRIGHT =>	
				-- prima riga
				if(box_values_curr_status(0,2) > 0 and box_values_curr_status(0,3) = 0)
				then
					box_values_next_status(0,0) <= 0;
					box_values_next_status(0,1) <= box_values_curr_status(0,0);
					box_values_next_status(0,2) <= box_values_curr_status(0,1);
					box_values_next_status(0,3) <= box_values_curr_status(0,2);
				elsif(box_values_curr_status(0,1) > 0 and box_values_curr_status(0,2) = 0)
				then
					box_values_next_status(0,0) <= 0;
					box_values_next_status(0,1) <= box_values_curr_status(0,0);
					box_values_next_status(0,2) <= box_values_curr_status(0,1);
				elsif(box_values_curr_status(0,0) > 0 and box_values_curr_status(0,1) = 0)
				then
					box_values_next_status(0,0) <= 0;
					box_values_next_status(0,1) <= box_values_curr_status(0,0);
				end if;
				
				--seconda riga
				if(box_values_curr_status(1,2) > 0 and box_values_curr_status(1,3) = 0)
				then
					box_values_next_status(1,0) <= 0;
					box_values_next_status(1,1) <= box_values_curr_status(1,0);
					box_values_next_status(1,2) <= box_values_curr_status(1,1);
					box_values_next_status(1,3) <= box_values_curr_status(1,2);
				elsif(box_values_curr_status(1,1) > 0 and box_values_curr_status(1,2) = 0)
				then
					box_values_next_status(1,0) <= 0;
					box_values_next_status(1,1) <= box_values_curr_status(1,0);
					box_values_next_status(1,2) <= box_values_curr_status(1,1);
				elsif(box_values_curr_status(1,0) > 0 and box_values_curr_status(1,1) = 0)
				then
					box_values_next_status(1,0) <= 0;
					box_values_next_status(1,1) <= box_values_curr_status(1,0);
				end if;
				
				--terza riga
				if(box_values_curr_status(2,2) > 0 and box_values_curr_status(2,3) = 0)
				then
					box_values_next_status(2,0) <= 0;
					box_values_next_status(2,1) <= box_values_curr_status(2,0);
					box_values_next_status(2,2) <= box_values_curr_status(2,1);
					box_values_next_status(2,3) <= box_values_curr_status(2,2);
				elsif(box_values_curr_status(2,1) > 0 and box_values_curr_status(2,2) = 0)
				then
					box_values_next_status(2,0) <= 0;
					box_values_next_status(2,1) <= box_values_curr_status(2,0);
					box_values_next_status(2,2) <= box_values_curr_status(2,1);
				elsif(box_values_curr_status(2,0) > 0 and box_values_curr_status(2,1) = 0)
				then
					box_values_next_status(2,0) <= 0;
					box_values_next_status(2,1) <= box_values_curr_status(2,0);
				end if;
				
				--quarta riga
				if(box_values_curr_status(3,2) > 0 and box_values_curr_status(3,3) = 0)
				then
					box_values_next_status(3,0) <= 0;
					box_values_next_status(3,1) <= box_values_curr_status(3,0);
					box_values_next_status(3,2) <= box_values_curr_status(3,1);
					box_values_next_status(3,3) <= box_values_curr_status(3,2);
				elsif(box_values_curr_status(3,1) > 0 and box_values_curr_status(3,2) = 0)
				then
					box_values_next_status(3,0) <= 0;
					box_values_next_status(3,1) <= box_values_curr_status(3,0);
					box_values_next_status(3,2) <= box_values_curr_status(3,1);
				elsif(box_values_curr_status(3,0) > 0 and box_values_curr_status(3,1) = 0)
				then
					box_values_next_status(3,0) <= 0;
					box_values_next_status(3,1) <= box_values_curr_status(3,0);
				end if;
			
			-- SINISTRA
			when dirLEFT =>
				-- prima riga
				if(box_values_curr_status(0,1) > 0 and box_values_curr_status(0,0) = 0)
				then
					box_values_next_status(0,3) <= 0;
					box_values_next_status(0,2) <= box_values_curr_status(0,3);
					box_values_next_status(0,1) <= box_values_curr_status(0,2);
					box_values_next_status(0,0) <= box_values_curr_status(0,1);
				elsif(box_values_curr_status(0,2) > 0 and box_values_curr_status(0,1) = 0)
				then
					box_values_next_status(0,3) <= 0;
					box_values_next_status(0,2) <= box_values_curr_status(0,3);
					box_values_next_status(0,1) <= box_values_curr_status(0,2);
				elsif(box_values_curr_status(0,3) > 0 and box_values_curr_status(0,2) = 0)
				then
					box_values_next_status(0,3) <= 0;
					box_values_next_status(0,2) <= box_values_curr_status(0,3);
				end if;
				
				-- seconda riga
				if(box_values_curr_status(1,1) > 0 and box_values_curr_status(1,0) = 0)
				then
					box_values_next_status(1,3) <= 0;
					box_values_next_status(1,2) <= box_values_curr_status(1,3);
					box_values_next_status(1,1) <= box_values_curr_status(1,2);
					box_values_next_status(1,0) <= box_values_curr_status(1,1);
				elsif(box_values_curr_status(1,2) > 0 and box_values_curr_status(1,1) = 0)
				then
					box_values_next_status(1,3) <= 0;
					box_values_next_status(1,2) <= box_values_curr_status(1,3);
					box_values_next_status(1,1) <= box_values_curr_status(1,2);
				elsif(box_values_curr_status(1,3) > 0 and box_values_curr_status(1,2) = 0)
				then
					box_values_next_status(1,3) <= 0;
					box_values_next_status(1,2) <= box_values_curr_status(1,3);
				end if;
				
				-- terza riga
				if(box_values_curr_status(2,1) > 0 and box_values_curr_status(2,0) = 0)
				then
					box_values_next_status(2,3) <= 0;
					box_values_next_status(2,2) <= box_values_curr_status(2,3);
					box_values_next_status(2,1) <= box_values_curr_status(2,2);
					box_values_next_status(2,0) <= box_values_curr_status(2,1);
				elsif(box_values_curr_status(2,2) > 0 and box_values_curr_status(2,1) = 0)
				then
					box_values_next_status(2,3) <= 0;
					box_values_next_status(2,2) <= box_values_curr_status(2,3);
					box_values_next_status(2,1) <= box_values_curr_status(2,2);
				elsif(box_values_curr_status(2,3) > 0 and box_values_curr_status(2,2) = 0)
				then
					box_values_next_status(2,3) <= 0;
					box_values_next_status(2,2) <= box_values_curr_status(2,3);
				end if;
				
				-- quarta riga
				if(box_values_curr_status(3,1) > 0 and box_values_curr_status(3,0) = 0)
				then
					box_values_next_status(3,3) <= 0;
					box_values_next_status(3,2) <= box_values_curr_status(3,3);
					box_values_next_status(3,1) <= box_values_curr_status(3,2);
					box_values_next_status(3,0) <= box_values_curr_status(3,1);
				elsif(box_values_curr_status(3,2) > 0 and box_values_curr_status(3,1) = 0)
				then
					box_values_next_status(3,3) <= 0;
					box_values_next_status(3,2) <= box_values_curr_status(3,3);
					box_values_next_status(3,1) <= box_values_curr_status(3,2);
				elsif(box_values_curr_status(3,3) > 0 and box_values_curr_status(3,2) = 0)
				then
					box_values_next_status(3,3) <= 0;
					box_values_next_status(3,2) <= box_values_curr_status(3,3);
				end if;

			-- SU
			when dirUP =>
				--prima colonna
				if(box_values_curr_status(1,0) > 0 and box_values_curr_status(0,0) = 0)
				then
					box_values_next_status(3,0) <= 0;
					box_values_next_status(2,0)	<= box_values_curr_status(3,0);
					box_values_next_status(1,0) <= box_values_curr_status(2,0);
					box_values_next_status(0,0) <= box_values_curr_status(1,0);
				elsif(box_values_curr_status(2,0) > 0 and box_values_curr_status(1,0) = 0)
				then
					box_values_next_status(3,0) <= 0;
					box_values_next_status(2,0)	<= box_values_curr_status(3,0);
					box_values_next_status(1,0) <= box_values_curr_status(2,0);
				elsif(box_values_curr_status(3,0) > 0 and box_values_curr_status(2,0) = 0)
				then
					box_values_next_status(3,0) <= 0;
					box_values_next_status(2,0)	<= box_values_curr_status(3,0);
				end if;
				
				--seconda colonna
				if(box_values_curr_status(1,1) > 0 and box_values_curr_status(0,1) = 0)
				then
					box_values_next_status(3,1) <= 0;
					box_values_next_status(2,1)	<= box_values_curr_status(3,1);
					box_values_next_status(1,1) <= box_values_curr_status(2,1);
					box_values_next_status(0,1) <= box_values_curr_status(1,1);
				elsif(box_values_curr_status(2,1) > 0 and box_values_curr_status(1,1) = 0)
				then
					box_values_next_status(3,1) <= 0;
					box_values_next_status(2,1)	<= box_values_curr_status(3,1);
					box_values_next_status(1,1) <= box_values_curr_status(2,1);
				elsif(box_values_curr_status(3,1) > 0 and box_values_curr_status(2,1) = 0)
				then
					box_values_next_status(3,1) <= 0;
					box_values_next_status(2,1)	<= box_values_curr_status(3,1);
				end if;
				
				--terza colonna
				if(box_values_curr_status(1,2) > 0 and box_values_curr_status(0,2) = 0)
				then
					box_values_next_status(3,2) <= 0;
					box_values_next_status(2,2)	<= box_values_curr_status(3,2);
					box_values_next_status(1,2) <= box_values_curr_status(2,2);
					box_values_next_status(0,2) <= box_values_curr_status(1,2);
				elsif(box_values_curr_status(2,2) > 0 and box_values_curr_status(1,2) = 0)
				then
					box_values_next_status(3,2) <= 0;
					box_values_next_status(2,2)	<= box_values_curr_status(3,2);
					box_values_next_status(1,2) <= box_values_curr_status(2,2);
				elsif(box_values_curr_status(3,2) > 0 and box_values_curr_status(2,2) = 0)
				then
					box_values_next_status(3,2) <= 0;
					box_values_next_status(2,2)	<= box_values_curr_status(3,2);
				end if;
				
				--quarta colonna
				if(box_values_curr_status(1,3) > 0 and box_values_curr_status(0,3) = 0)
				then
					box_values_next_status(3,3) <= 0;
					box_values_next_status(2,3)	<= box_values_curr_status(3,3);
					box_values_next_status(1,3) <= box_values_curr_status(2,3);
					box_values_next_status(0,3) <= box_values_curr_status(1,3);
				elsif(box_values_curr_status(2,3) > 0 and box_values_curr_status(1,3) = 0)
				then
					box_values_next_status(3,3) <= 0;
					box_values_next_status(2,3)	<= box_values_curr_status(3,3);
					box_values_next_status(1,3) <= box_values_curr_status(2,3);
				elsif(box_values_curr_status(3,3) > 0 and box_values_curr_status(2,3) = 0)
				then
					box_values_next_status(3,3) <= 0;
					box_values_next_status(2,3)	<= box_values_curr_status(3,3);
				end if;
				
			-- GIU'
			when dirDOWN =>
				-- prima colonna
				if(box_values_curr_status(2,0) > 0 and box_values_curr_status(3,0) = 0)
				then
					box_values_next_status(0,0) <= 0;
					box_values_next_status(1,0) <= box_values_curr_status(0,0);
					box_values_next_status(2,0) <= box_values_curr_status(1,0);
					box_values_next_status(3,0) <= box_values_curr_status(2,0);
				elsif(box_values_curr_status(1,0) > 0 and box_values_curr_status(2,0) = 0)
				then
					box_values_next_status(0,0) <= 0;
					box_values_next_status(1,0) <= box_values_curr_status(0,0);
					box_values_next_status(2,0) <= box_values_curr_status(1,0);
				elsif(box_values_curr_status(0,0) > 0 and box_values_curr_status(1,0) = 0)
				then
					box_values_next_status(0,0) <= 0;
					box_values_next_status(1,0) <= box_values_curr_status(0,0);
				end if;
				
				-- seconda colonna
				if(box_values_curr_status(2,1) > 0 and box_values_curr_status(3,1) = 0)
				then
					box_values_next_status(0,1) <= 0;
					box_values_next_status(1,1) <= box_values_curr_status(0,1);
					box_values_next_status(2,1) <= box_values_curr_status(1,1);
					box_values_next_status(3,1) <= box_values_curr_status(2,1);
				elsif(box_values_curr_status(1,1) > 0 and box_values_curr_status(2,1) = 0)
				then
					box_values_next_status(0,1) <= 0;
					box_values_next_status(1,1) <= box_values_curr_status(0,1);
					box_values_next_status(2,1) <= box_values_curr_status(1,1);
				elsif(box_values_curr_status(0,1) > 0 and box_values_curr_status(1,1) = 0)
				then
					box_values_next_status(0,1) <= 0;
					box_values_next_status(1,1) <= box_values_curr_status(0,1);
				end if;
				
				-- terza colonna
				if(box_values_curr_status(2,2) > 0 and box_values_curr_status(3,2) = 0)
				then
					box_values_next_status(0,2) <= 0;
					box_values_next_status(1,2) <= box_values_curr_status(0,2);
					box_values_next_status(2,2) <= box_values_curr_status(1,2);
					box_values_next_status(3,2) <= box_values_curr_status(2,2);
				elsif(box_values_curr_status(1,2) > 0 and box_values_curr_status(2,2) = 0)
				then
					box_values_next_status(0,2) <= 0;
					box_values_next_status(1,2) <= box_values_curr_status(0,2);
					box_values_next_status(2,2) <= box_values_curr_status(1,2);
				elsif(box_values_curr_status(0,2) > 0 and box_values_curr_status(1,2) = 0)
				then
					box_values_next_status(0,2) <= 0;
					box_values_next_status(1,2) <= box_values_curr_status(0,2);
				end if;

				-- quarta colonna
				if(box_values_curr_status(2,3) > 0 and box_values_curr_status(3,3) = 0)
				then
					box_values_next_status(0,3) <= 0;
					box_values_next_status(1,3) <= box_values_curr_status(0,3);
					box_values_next_status(2,3) <= box_values_curr_status(1,3);
					box_values_next_status(3,3) <= box_values_curr_status(2,3);
				elsif(box_values_curr_status(1,3) > 0 and box_values_curr_status(2,3) = 0)
				then
					box_values_next_status(0,3) <= 0;
					box_values_next_status(1,3) <= box_values_curr_status(0,3);
					box_values_next_status(2,3) <= box_values_curr_status(1,3);
				elsif(box_values_curr_status(0,3) > 0 and box_values_curr_status(1,3) = 0)
				then
					box_values_next_status(0,3) <= 0;
					box_values_next_status(1,3) <= box_values_curr_status(0,3);
				end if;
			-- niente
			when others =>
				reg_next_state <= idle;
		end case;
	
	-- Stato: controllo mossa valida 
	elsif(reg_state = checkupdate)
	then
		directionPosEdge_next <= btn_posedge3 & btn_posedge2 & btn_posedge1 & btn_posedge0;
		-- Se la mossa non cambia lo stato della board, la mossa non è valida
		if(compare(box_values_prev_status, box_values_curr_status) = '1')
		then 
			-- Quindi non fare nulla
			reg_next_state <= idle;
		else
			-- Altrimenti la mossa era valida e puoi aggiungere una nuova casella 2
			reg_next_state <= randupdate;
		end if;
		
	-- Inserimento casuale di una nuova casella 2 
	elsif(reg_state = randupdate)
	then
		reg_next_state <= idle;
		convertCoord(to_integer(randNum), x, y);
		-- Cascata di else-if necessaria perchè il num random generato potrebbe essere già occpato
		if(box_values_curr_status(x,y) = 0)
		then
			box_values_next_status(x,y) <= 2;
		elsif(box_values_curr_status(x,y+1) = 0)
		then
			box_values_next_status(x,y+1) <= 2;
		elsif(box_values_curr_status(x,y+2) = 0)
		then
			box_values_next_status(x,y+2) <= 2;
		elsif(box_values_curr_status(x,y+3) = 0)
		then
			box_values_next_status(x,y+3) <= 2;
		elsif(box_values_curr_status(x+1,y) = 0)
		then
			box_values_next_status(x+1,y) <= 2;
		elsif(box_values_curr_status(x+1,y+1) = 0)
		then
			box_values_next_status(x+1,y+1) <= 2;
		elsif(box_values_curr_status(x+1,y+2) = 0)
		then
			box_values_next_status(x+1,y+2) <= 2;
		elsif(box_values_curr_status(x+1,y+3) = 0)
		then
			box_values_next_status(x+1,y+3) <= 2;
		elsif(box_values_curr_status(x+2,y) = 0)
		then
			box_values_next_status(x+2,y) <= 2;
		elsif(box_values_curr_status(x+2,y+1) = 0)
		then
			box_values_next_status(x+2,y+1) <= 2;
		elsif(box_values_curr_status(x+2,y+2) = 0)
		then
			box_values_next_status(x+2,y+2) <= 2;
		elsif(box_values_curr_status(x+2,y+3) = 0)
		then
			box_values_next_status(x+2,y+3) <= 2;
		elsif(box_values_curr_status(x+3,y) = 0)
		then
			box_values_next_status(x+3,y) <= 2;
		elsif(box_values_curr_status(x+3,y+1) = 0)
		then
			box_values_next_status(x+3,y+1) <= 2;
		elsif(box_values_curr_status(x+3,y+2) = 0)
		then
			box_values_next_status(x+3,y+2) <= 2;
		elsif(box_values_curr_status(x+3,y+3) = 0)
		then
			box_values_next_status(x+3,y+3) <= 2;
		else 
			-- non dovrebbe mai entrare qui
			reg_next_state <= idle;
		end if;
	end if;

END PROCESS;
END behavior;