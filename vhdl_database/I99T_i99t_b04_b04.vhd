LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.std_logic_arith.all;

entity b04 is
  port( RESTART  : in bit;
        AVERAGE  : in bit;
        ENABLE   : in bit;
        DATA_IN  : in integer range 127 downto -128;
        DATA_OUT : out integer range 127 downto -128;
        RESET    : in bit;
        CLOCK    : in bit
                           );
end b04;

architecture BEHAV of b04 is

  constant sA : integer := 0;
  constant sB : integer := 1;
  constant sC : integer := 2;
begin
  process(CLOCK,RESET)

  variable stato : integer range 2 downto 0;
  variable RMAX, RMIN, RLAST, REG1, REG2, REG3, REG4, REGD : integer range 127 downto -128;
  variable temp : integer;
  variable RES, AVE, ENA : bit;

  begin
	
	if RESET = '1' then
      		stato := sA;
      		RMAX := 0;
      		RMIN := 0;
      		RLAST := 0;
      		REG1 := 0;
      		REG2 := 0;
      		REG3 := 0;
      		REG4 := 0;
      		DATA_OUT <= 0;
    	elsif CLOCK'event and CLOCK='1' then
      		RES := RESTART;
      		ENA := ENABLE;
      		AVE := AVERAGE;
      		
		case stato is
		        when sA =>
			          stato := SB;
		        when sB =>
			          RMAX := DATA_IN;
			          RMIN := DATA_IN;
			          REG1 := 0;
			          REG2 := 0;
			          REG3 := 0;
			          REG4 := 0;
			          RLAST := 0;
			          DATA_OUT <= 0;
				  stato := sC;
		        when sC =>
			          if (ENA = '1') then
				            RLAST := DATA_IN;
			          end if; 
			          if (RES = '1') then		
					    REGD := (RMAX+RMIN)mod 128;
					    temp := RMAX+RMIN;

					    if (temp >= 0) then			
					            DATA_OUT <= REGD/2;
					    else
					            DATA_OUT <= -((-REGD)/2);
					    end if;
			          elsif (ENA = '1') then
				            if (AVE = '1') then
			        		DATA_OUT <= REG4;
				            else				                 
						    REGD := (DATA_IN+REG4) mod 128;
						    temp := DATA_IN+REG4;

						    if (temp >= 0) then			
						            DATA_OUT <= REGD/2;
						    else
						            DATA_OUT <= -((-REGD)/2);
						    end if;
					    end if;
			          else
			 	            DATA_OUT <= RLAST;
			          end if;
			          if DATA_IN > RMAX then
				            RMAX := DATA_IN;
			          elsif DATA_IN < RMIN then
				            RMIN := DATA_IN;
			          end if;
			          REG4 := REG3;
			          REG3 := REG2;
			          REG2 := REG1;
			          REG1 := DATA_IN;
				  stato := sC;
		end case;
	end if;
  end process;
End BEHAV;

