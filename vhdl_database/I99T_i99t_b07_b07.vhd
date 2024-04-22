entity b07 is
port (
      punti_retta : out integer range 255 downto 0;
      start,reset,clock : in bit
     );
end b07;

architecture BEHAV of b07 is

constant lung_mem : integer := 15 ;
subtype num8bit is integer range 255 downto 0;
type rom is array (0 to lung_mem ) of num8bit;

constant S_RESET:integer:=0;
constant S_START:integer:=1;
constant S_LOAD_X:integer:=2;
constant S_UPDATE_MAR:integer:=3;
constant S_LOAD_Y:integer:=4;
constant S_CALC_RETTA:integer:=5;
constant S_INCREMENTA:integer:=6;

constant mem:rom:= (1,255,0,0,
                    0,2,0,0,
                    0,2,255,5,
                    0,2,0,2);
begin
    process(reset,clock)
      variable stato : integer range 6 downto 0;
      variable cont,mar,x,y,t :num8bit;
    begin 
    if reset = '1' then
	stato := S_RESET;
	punti_retta <= 0;
	cont := 0;
	mar := 0;
	x := 0;
	y := 0;
	t := 0;
    elsif clock'event and clock = '1' then 
    case stato is 
      when S_RESET =>
        stato :=S_START;
      when S_START =>
        if start='1' then
          cont := 0;
          mar := 0;
          stato:=S_LOAD_X;
        else 
          stato := S_START;
          punti_retta <= 0;
        end if;
      when S_LOAD_X =>
        x := mem(mar);
        stato :=S_UPDATE_MAR;
      when S_UPDATE_MAR =>
        mar := (mar +1) mod 16;
        t := (x mod 128)+ (x mod 128);
        stato := S_LOAD_Y;
      when S_LOAD_Y =>
        y := mem(mar);
        x := (x mod 128)+(t mod 128);
        stato := S_CALC_RETTA;
      when S_CALC_RETTA =>
        x := (x mod 128)+(y mod 128);
        stato := S_INCREMENTA;
      when S_INCREMENTA =>
        if mar/=lung_mem then
          if (x=2) then
	    cont := (cont +1) mod 256;
            mar := (mar +1) mod 16;
            stato := S_LOAD_X;
          else
            mar := (mar +1) mod 16;
            stato := S_LOAD_X;
          end if;
        else
          if start='0' then
            if (x=2) then
              punti_retta <= (cont mod 2**8)+1;
              stato:=S_START;
            else
              punti_retta<=cont; 
              stato:=S_START;
            end if;
          else
            stato:=S_INCREMENTA;
          end if;
        end if;
      end case;
    end if;
    end process;
end BEHAV;
