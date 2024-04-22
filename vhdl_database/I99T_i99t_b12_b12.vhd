entity b12 is
  port(clock     : in  bit;
       reset     : in  bit;
       start     : in  bit;
       k         : in  bit_vector ( 3 downto 0);
       nloss     : out bit;
       nl        : out bit_vector ( 3 downto 0);
       speaker   : out bit);

end b12;

architecture BEHAV of b12 is

  constant RED : integer := 0;
  constant GREEN : integer := 1;
  constant YELLOW : integer := 2;
  constant BLUE : integer := 3;

  constant LED_ON   : bit := '1';
  constant LED_OFF  : bit := '0';

  constant PLAY_ON  : bit := '1';
  constant PLAY_OFF : bit := '0';

  constant KEY_ON   : bit := '1';

  constant NUM_KEY   : natural := 4;
  constant COD_COLOR : natural := 2;
  constant COD_SOUND : natural := 3;

  constant S_WIN  : natural := 2**COD_COLOR;
  constant S_LOSS : natural := S_WIN + 1;

  constant SIZE_ADDRESS : natural := 5;
  constant SIZE_MEM     : natural := 2**SIZE_ADDRESS;

  constant COUNT_KEY : natural := 33;
  constant COUNT_SEQ : natural := 33;
  constant DEC_SEQ   : natural := 1;
  constant COUNT_FIN : natural := 8;  
 
  constant ERROR_TONE  : natural := 1;
  constant RED_TONE    : natural := 2;
  constant GREEN_TONE  : natural := 3; 
  constant YELLOW_TONE : natural := 4;
  constant BLUE_TONE   : natural := 5;
  constant WIN_TONE    : natural := 6;

  signal wr         : bit;
  signal address    : natural range SIZE_MEM - 1 downto 0;
  signal data_in    : natural range 2**COD_COLOR - 1 downto 0;
  signal data_out   : natural range 2**COD_COLOR - 1 downto 0;

  signal num        : natural range 2**COD_COLOR - 1 downto 0;

  signal sound      : natural range 2**COD_SOUND - 1 downto 0;
  signal play       : bit;

begin

  process (clock,reset)
    variable s: bit ;

    variable counter : natural range 7 downto 0;

  begin

    if (reset='1') then
      s := '0';
      speaker <= '0';
      counter :=0;

    elsif clock'event and clock = '1' then

    if play = '1' then

         case sound is

            when 0 =>
                if counter > RED_TONE then
                   s := not s;
                   speaker <= s;
                   counter:=0;
                else
                   counter:= counter + 1;
                end if;
            when 1 =>
                if counter > GREEN_TONE then
                   s := not s;
                   speaker <= s;
                   counter:=0;
                else
                   counter:= counter + 1;

                end if;

            when  2 =>
                if counter > YELLOW_TONE then
                   s := not s;
                   speaker <= s;
                   counter:=0;
                else
                   counter:= counter + 1;
                end if;

            when 3 =>
                if counter > BLUE_TONE then
                   s := not s;
                   speaker <= s;
                   counter:=0;
                else
                   counter:= counter + 1;
                end if;

            when S_WIN =>
                if counter > WIN_TONE then
                   s := not s;
                   speaker <= s;
                   counter:=0;
                else
                   counter:= counter + 1;
                end if;

            when S_LOSS =>
                if counter > ERROR_TONE then
                   s := not s;
                   speaker <= s;
                   counter:=0;
                else
                   counter:= counter + 1;
                end if;

            when others =>
                   counter := 0;
         end case;

      else

         counter :=0;
         speaker <= '0';

      end if;

    end if;

  end process;

  process (clock,reset)
    variable count : natural range 2**COD_COLOR - 1 downto 0;
  begin

    if (reset='1') then

      count := 0;
      num <= 0;

    elsif clock'event and clock = '1' then

      count := (count + 1) mod (2**COD_COLOR);
      -- count := count + 1;
      -- removed(!)fs030699
      num <= count;

    end if;

  end process;

  process(clock,reset)
    type RAM is array (natural range SIZE_MEM - 1 downto 0) of natural range 2**COD_COLOR - 1 downto 0;
    variable memory : RAM ;
    variable mar : natural range SIZE_MEM - 1 downto 0;
  begin

    if reset = '1' then
	data_out <= 0;
	for mar in 0 to SIZE_MEM - 1 loop
	  memory(mar) := 0;
	end loop;
    elsif clock'event and clock='1' then
      data_out <= memory(address);
      if wr='1' then
        memory(address) := data_in;
      end if;
    end if;

  end process;

  process (clock,reset)

    constant G0: integer :=0;
    constant G1: integer :=1;
    constant G2: integer :=2;
    constant G3: integer :=3;
    constant G4: integer :=4;
    constant G5: integer :=5;
    constant G6: integer :=6;
    constant G7: integer :=7;
    constant G8: integer :=8;
    constant G9: integer :=9;
    constant G10: integer :=10;
    constant G10a: integer :=11;
    constant G11: integer :=12;
    constant G12: integer :=13;
    constant Ea: integer :=14;
    constant E0: integer :=15;
    constant E1: integer :=16;
    constant K0: integer :=17;
    constant K1: integer :=18;
    constant K2: integer :=19;
    constant K3: integer :=20;
    constant K4: integer :=21;
    constant K5: integer :=22;
    constant K6: integer :=23;
    constant W0: integer :=24;
    constant W1: integer :=25;

    variable gamma    : integer range 25 downto 0;
    variable ind      : natural range 2**COD_COLOR - 1 downto 0;
    variable scan     : natural range SIZE_MEM - 1 downto 0;
    variable max      : natural range SIZE_MEM - 1 downto 0;
    variable timebase : natural range 63 downto 0;
    variable count    : natural range 63 downto 0;
  begin

    if (reset='1') then

      nloss <= LED_OFF;
      nl <= (others => LED_OFF);
      play <= PLAY_OFF;
      wr <= '0';
      scan := 0 ;
      max := 0 ;
      ind := 0 ;
      timebase := 0 ;
      count := 0 ;
      sound <=0 ;
      address <=0 ;
      data_in <=0 ;

      gamma := G0;


    elsif clock'event and clock = '1' then

      if start = '1' then
        gamma := G1;
      end if;

      case gamma is

        when G0 => gamma := G0;

        when G1 =>

          nloss <= LED_OFF;
          nl <= (others => LED_OFF);
          play <= PLAY_OFF;
          wr <= '0';

          max := 0;
          timebase := COUNT_SEQ;
          gamma := G2;

        when G2 =>

          scan := 0;
          wr <= '1';
          address <= max;
          data_in <= num;
          gamma := G3;

        when G3 =>

          wr <= '0';
          address <= scan;
          gamma := G4;

        when G4 => 

          gamma := G5;

        when G5 =>

          nl(data_out) <= LED_ON;
          count := timebase;
          play <= PLAY_ON;
          sound <= data_out;
          gamma := G6;

        when G6 =>

          if count = 0 then
            nl <= (others => LED_OFF);
            play <= PLAY_OFF;
            count := timebase;
            gamma := G7;
          else
            count := count - 1;
            gamma := G6;
          end if;

        when G7 =>

          if count = 0 then
            if scan /= max then
              scan := scan + 1;
              gamma := G3;
            else
              scan := 0;
              gamma := G8;
            end if;
          else
            count := count - 1;
            gamma := G7;
          end if;

        when G8 =>

          count := COUNT_KEY;
          address <= scan;
          gamma := G9;

        when G9 =>

          gamma := G10;

        when G10 =>

          if count = 0 then
            nloss <= LED_ON;
            max := 0;
            gamma := K0;
          else

            count := count - 1;

            if k(0)=KEY_ON then

              ind := 0;	
              sound <= 0;
              play <= PLAY_ON;
              count := timebase;

              if (data_out = 0) then
                gamma := G10a;
              else
                nloss <= LED_ON;
                gamma := Ea;
              end if;

            elsif k(1)=KEY_ON then

              ind := 1;	
              sound <= 1;
              play <= PLAY_ON;
              count := timebase;

              if (data_out = 1) then
                gamma := G10a;
              else
                nloss <= LED_ON;
                gamma := Ea;
              end if;

            elsif k(2)=KEY_ON then

              ind := 2;	
              sound <= 2;
              play <= PLAY_ON;
              count := timebase;

              if (data_out = 2) then
                gamma := G10a;
              else
                nloss <= LED_ON;
                gamma := Ea;
              end if;

            elsif k(3)=KEY_ON then

              ind := 3;	
              sound <= 3;
              play <= PLAY_ON;
              count := timebase;

              if (data_out = 3) then
                gamma := G10a;
              else
                nloss <= LED_ON;
                gamma := Ea;
              end if;
            else
               gamma := G10;
            end if;

          end if;

        when G10a =>

           nl(ind) <= LED_ON;
           gamma := G11;

        when G11 =>

          if count = 0 then
            nl <= (others => LED_OFF);
            play <= PLAY_OFF;
            count := timebase;          -- attiva contatore LED spento
            gamma := G12;               -- stato FSM
          else
            count := count - 1;         -- decrementa contatore
            gamma := G11;               -- stato FSM
          end if;

        when G12 =>

          if count = 0 then            -- controlla se fine conteggio

            if scan /= max then        -- controlla se sequenza non finita
              scan := scan + 1;        -- incrementa indirizzo
              gamma := G8;             -- stato FSM
            elsif max /= (SIZE_MEM - 1) then  -- controlla se memoria non e' esaurita
              max := max + 1;                 -- incrementa registro massima sequenza
              timebase := timebase - DEC_SEQ; -- decremento prossima sequenza
              gamma := G2;                    -- stato FSM
            else
              play <= PLAY_ON;         -- attiva il suono
              sound <= S_WIN;      -- comunica il codice del suono
              count := COUNT_FIN;      -- attiva contatore fine suono
              gamma := W0;             -- stato FSM
            end if;

          else
            count := count - 1;        -- decrementa contatore
            gamma := G12;              -- stato FSM
          end if;

        when Ea =>

           nl(ind) <= LED_ON;           -- attiva LED tasto
           gamma := E0;                 -- stato FSM

        when E0 =>

          if count = 0 then              -- controlla se fine conteggio
            nl <= (others => LED_OFF);   -- spegne LED tasti
            play <= PLAY_OFF;            -- disattiva il suono
            count := timebase;           -- attiva contatore LED spento
            gamma := E1;                 -- stato FSM
          else
            count := count - 1;          -- decrementa contatore
            gamma := E0;                 -- stato FSM
          end if;

        when E1 =>

          if count = 0 then        -- controlla se fine conteggio
            max := 0;              -- azzera registro massima sequenza
            gamma := K0;           -- stato FSM
          else
            count := count - 1;    -- decrementa contatore
            gamma := E1;           -- stato FSM
          end if;

        when K0 =>

          address <= max;     -- indirizza ultimo integer range 3 downto 0e
          gamma := K1;        -- stato FSM

        when K1 =>            -- serve per dare tempo per leggere la memoria

          gamma := K2;        -- stato FSM

        when K2 =>

          nl(data_out) <= LED_ON;    -- attiva LED tasto
          play <= PLAY_ON;           -- attiva suono
          sound <= data_out;     -- comunica il codice del suono
          count := timebase;         -- attiva contatore LED acceso
          gamma := K3;               -- stato FSM

        when K3 =>

          if count = 0 then              -- controlla se fine conteggio
            nl <= (others => LED_OFF);   -- spegne LED tasti
            play <= PLAY_OFF;            -- disattiva il suono
            count := timebase;           -- attiva contatore LED spento
            gamma := K4;                 -- stato FSM
          else
            count := count - 1;          -- decrementa contatore
            gamma := K3;                 -- stato FSM
          end if;

        when K4 =>

          if count = 0 then             -- controlla se fine conteggio
            if max /= scan then         -- controlla se fine lista
              max := max + 1;           -- incrementa indirizzo
              gamma := K0;              -- stato FSM
            else
              nl(data_out) <= LED_ON;   -- attiva LED tasto
              play <= PLAY_ON;          -- attiva suono
              sound <= S_LOSS;      -- codice suono perdita
              count := COUNT_FIN;       -- attiva contatore LED acceso
              gamma := K5;              -- stato FSM
            end if;
          else
            count := count - 1;         -- decrementa contatore
            gamma := K4;                -- stato FSM
          end if;

        when K5 =>

          if count = 0 then             -- controlla se fine conteggio
            nl <= (others => LED_OFF);  -- spegne LED tasti
            play <= PLAY_OFF;           -- disattiva il suono
            count := COUNT_FIN;         -- attiva contatore LED spento
            gamma := K6;                -- stato FSM
          else
            count := count - 1;         -- decrementa contatore
            gamma := K5;                -- stato FSM
          end if;

        when K6 =>

          if count = 0 then           -- controlla se fine conteggio
            nl(data_out) <= LED_ON;   -- attiva LED tasto
            play <= PLAY_ON;          -- attiva suono
            sound <= S_LOSS;      -- codice suono perdita
            count := COUNT_FIN;       -- attiva contatore LED acceso
            gamma := K5;              -- stato FSM
          else
            count := count - 1;       -- decrementa contatore
            gamma := K6;              -- stato FSM
          end if;

        when W0 =>

          if count = 0 then             -- controlla se fine conteggio
            nl <= (others => LED_ON);   -- attiva tutti i LED
            play <= PLAY_OFF;           -- disattiva il suono
            count := COUNT_FIN;         -- attiva contatore LED acceso
            gamma := W1;                -- stato FSM
          else
            count := count - 1;         -- decrementa contatore
            gamma := W0;                -- stato FSM
          end if;

        when W1 =>

          if count = 0 then              -- controlla se fine conteggio
            nl <= (others => LED_OFF);   -- disattiva tutti i LED
            play <= PLAY_ON;             -- attiva il suono
            sound <= S_WIN;          -- comunica il codice del suono
            count := COUNT_FIN;          -- attiva contatore LED spento
            gamma := W0;                 -- stato FSM
          else
            count := count - 1;          -- decrementa contatore
            gamma := W1;                -- stato FSM
          end if;

      end case;

    end if;

  end process;

end BEHAV;

