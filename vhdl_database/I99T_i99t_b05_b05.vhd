entity b05 is
       port(
            CLOCK: in bit;
            RESET: in bit;
            START: in bit;
            SIGN: out bit;
            DISPMAX1,DISPMAX2,DISPMAX3: out bit_vector (6 downto 0);
            DISPNUM1,DISPNUM2: out bit_vector (6 downto 0)
           );
end b05;

architecture BEHAV of b05 is

constant st0:integer:=0;
constant st1:integer:=1;
constant st2:integer:=2;
constant st3:integer:=3;
constant st4:integer:=4;

subtype memdim is integer range 31 downto 0;
subtype num9bits is integer range 255 downto -256;
type rom is array (0 to 31) of num9bits;

signal NUM: memdim;
signal MAR: memdim;
signal TEMP: num9bits;
signal MAX: num9bits;
signal FLAG,MAG1,MAG2,MIN1: bit;
signal EN_DISP,RES_DISP: bit;
-- constant MEM: rom := 
--                      ( 50,40,0,                   
--                        229,10,75,
--                        229,181,186,
--                        229,186,181,
--                        0,40,50,
--                        229,186,229,
--                        229,151,229,
--                        100,125,10,
--                        75,50,0,
--                        229,0,40,
--                        50,50 );

 constant MEM: rom := 
                      ( 50,40,0,                   
                        229,-10,75,
                        229,181,186,
                        229,186,-11,
                        0,40,50,
                        -29,-18,229,
                        229,151,229,
                        100,125,10,
                        75,-50,0,
                        -22,0,40,
                        50,50 );

begin                   
     process(MAR,TEMP,MAX) 
     variable AC1,AC2: num9bits;
     begin
          AC1:= MEM(MAR)-TEMP;  
          if AC1<0 then
             MIN1 <= '1';
             MAG1 <= '0';
          else
             if AC1 = 0 then
                MIN1 <= '0';
                MAG1 <= '0';
             else
                MIN1 <= '0';
                MAG1 <= '1';
             end if;
          end if;
          AC2 := MEM(MAR)-MAX;
          if (AC2<0) then 
             MAG2 <= '1';
          else
             MAG2 <= '0';
          end if;
     end process;

     process (EN_DISP,RES_DISP,NUM,MAX)                     
     variable TM,TN: num9bits;
     begin
          if EN_DISP = '1' then
           DISPMAX1 <= "0000000";
           DISPMAX2 <= "0000000";
           DISPMAX3 <= "0000000";
           DISPNUM1 <= "0000000";
           DISPNUM2 <= "0000000";
           SIGN <= '0';
          else
           if RES_DISP ='0' then
             DISPMAX1 <= "1000000";
             DISPMAX2 <= "1000000";
             DISPMAX3 <= "1000000";
             DISPNUM1 <= "1000000";
             DISPNUM2 <= "1000000";
             SIGN <= '1';
           else
             TN := NUM;
             if MAX<0 then
                SIGN <= '1';
                TM := -MAX mod 2**5;
             else
                SIGN <= '0';
                TM := MAX mod 2**5;
             end if;
             if TM> 99 then
                DISPMAX1 <= "0011000";
                TM := TM - 100;
             else
                DISPMAX1 <= "0111111";
             end if;
             if TM > 89 then
                DISPMAX2 <= "1111110";
                TM := TM - 90;
             else
                if TM > 79 then
                   DISPMAX2 <= "1111111";
                   TM := TM - 80;
                else
                   if TM > 69 then
                      DISPMAX2 <= "0011100";
                      TM := TM - 70;
                   else
                      if TM > 59 then
                         DISPMAX2 <= "1110111";
                         TM := TM - 60;
                      else
                         if TM > 49 then
                            DISPMAX2 <= "1110110";
                            TM := TM - 50;
                         else
                            if TM > 39 then
                               DISPMAX2 <= "1011010";
                               TM := TM - 40;
                            else
                               if TM > 29 then
                                  DISPMAX2 <= "1111001";
                                  TM := TM - 30;
                               else
                                  if TM > 19 then
                                     DISPMAX2 <= "1101100";
                                     TM := TM - 20;
                                  else
                                     if TM > 9 then
                                        DISPMAX2 <= "0011000";
                                        TM := TM - 10;
                                     else
                                        DISPMAX2 <= "0111111";
                                     end if;
                                  end if;
                               end if;
                            end if;
                         end if;
                      end if;
                   end if;
                end if;
             end if;
             if TM > 8 then
                DISPMAX3 <= "1111110";
             else
                if TM > 7 then
                   DISPMAX3 <= "1111111";
                else
                   if TM > 6 then
                      DISPMAX3 <= "0011100";
                   else
                      if TM > 5 then
                         DISPMAX3 <= "1110111";
                      else
                         if TM > 4 then
                            DISPMAX3 <= "1110110";
                         else
                            if TM > 3 then
                               DISPMAX3 <= "1011010";
                            else
                               if TM > 2 then
                                  DISPMAX3 <= "1111001";
                               else
                                  if TM > 1 then
                                     DISPMAX3 <= "1101100";
                                  else
                                     if TM > 0 then
                                        DISPMAX3 <= "0011000";
                                     else
                                        DISPMAX3 <= "0111111";
                                     end if;
                                  end if;
                               end if;
                            end if;
                         end if;
                      end if;
                   end if;
                end if;
             end if;
             if TN > 9 then
                DISPNUM1 <= "0011000";
                TN := TN - 10;
             else
                DISPNUM1 <= "0111111";
             end if;
             if TN > 8 then
                DISPNUM2 <= "1111110";
             else
                if TN > 7 then
                   DISPNUM2 <= "1111111";
                else
                   if TN > 6 then
                      DISPNUM2 <= "0011100";
                   else
                      if TN > 5 then
                         DISPNUM2 <= "1110111";
                      else
                         if TN > 4 then
                            DISPNUM2 <= "1110110";
                         else
                            if TN > 3 then
                               DISPNUM2 <= "1011010";
                            else
                               if TN > 2 then
                                  DISPNUM2 <= "1111001";
                               else
                                  if TN > 1 then
                                     DISPNUM2 <= "1101100";
                                  else
                                     if TN > 0 then
                                        DISPNUM2 <= "0011000";
                                     else
                                        DISPNUM2 <= "0111111";
                                     end if;
                                  end if;
                               end if;
                            end if;
                         end if;
                      end if;
                   end if;
                end if;
             end if;
           end if;
          end if;
     end process;

     process (CLOCK,RESET)
     variable STATO: integer range 0 to 4;
     variable TMN : bit_vector (5 downto 0);
     begin
          if RESET = '1' then
		STATO := st0;
		RES_DISP <= '0';
		EN_DISP <= '0';
		NUM <= 0;
		MAR <= 0;
		TEMP <= 0;
		MAX <= 0;
		FLAG <= '0';

          elsif CLOCK'event and CLOCK='1' then
                case STATO is
                    when st0 =>
                     RES_DISP <= '0';
                     EN_DISP <= '0';
                     STATO := st1;
                    when st1 =>
                     if START = '1' then
                        NUM <= 0;
                        MAR <= 0;
                        FLAG <= '0';
                        EN_DISP <= '1';
                        RES_DISP <= '1';
                        STATO := st2;
                     else
                        STATO := st1;
                     end if;
                    when st2 =>
                     MAX <= MEM(MAR);
                     TEMP <= MEM(MAR);
                     STATO := st3;
                    when st3 =>
                     if MIN1 = '1' then
                        if FLAG ='1' then
                           FLAG <= '0';
                           NUM <= NUM+1;
                        end if;
                     else
                        if MAG1 = '1' then
                           if MAG2 = '1' then
                              MAX <= MEM(MAR);
                           end if;
                           FLAG <= '1';
                        end if;
                     end if;
                     TEMP <= MEM(MAR);
                     STATO := st4;
                    when st4 => 
                     if MAR = 31 then
                        if START = '1' then
                           STATO := st4;
                        else
                           STATO := st1;
                        end if;
                        EN_DISP <= '0';
                     else
                        MAR <= MAR+1;
                        STATO := st3;
                     end if;
		end case;
		end if;
	end process;
end BEHAV;







                                         
                                        
                         
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        

