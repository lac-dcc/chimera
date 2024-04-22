entity b14 is
port (
	clock,reset : in bit;
	addr : out integer range 2**20 - 1 downto 0;
	datai : in integer;
	datao : out integer;
	rd,wr : out bit
	);
end b14;

architecture BEHAV of b14 is

begin 

process(clock,reset)

variable reg0 : integer;
variable reg1 : integer;
variable reg2 : integer;
variable reg3 : integer;

variable B : bit;

variable MAR : integer range 2**20 - 1 downto 0;
variable MBR : integer;

variable mf : integer range 2**2 - 1 downto 0;
variable df : integer range 2**3 - 1 downto 0;
variable cf : integer range 1 downto 0;

variable ff : integer range 2**4 - 1 downto 0;
variable tail : integer range 2**20 - 1 downto 0;
variable IR : integer;

variable state : integer range 1 downto 0;

variable r,m,t: integer;
variable d : integer;
variable temp : integer;
variable s : integer range 3 downto 0;

constant FETCH : integer := 0;
constant EXEC : integer :=1;

begin

  if reset = '1' then
      MAR := 0;
      MBR := 0;
      IR := 0;
      d := 0;
      r := 0;
      m := 0;
      s := 0;
      temp := 0;
      mf := 0;
      df := 0;
      ff := 0;
      cf := 0;
      tail := 0;
      b := '0';
      reg0 := 0;
      reg1 := 0;
      reg2 := 0;
      reg3 := 0;
      addr <= 0;
      rd <= '0';
      wr <= '0';
      datao <= 0;
      state := FETCH;
 elsif clock'event and clock='1' then
      rd <= '0';
      wr <= '0';
      case state is
      when FETCH =>
        MAR := reg3 mod 2**20;
	addr <= MAR;
	rd <= '1';
	MBR := datai;
        IR := MBR;
	state := EXEC;
      when EXEC =>
	if IR<0 then
	  IR := -IR;
	end if;
	mf := (IR / 2**27) mod 4 ;

	df := (IR / 2**24) mod 2**3;

	ff := (IR / 2**19) mod 2**4;

	cf := (IR / 2**23) mod 2;

	tail := IR mod 2**20;
        reg3 := ((reg3 mod 2**29)+ 8);
	s := (IR/2**29) mod 4;
	case s is
	when 0 => r := reg0;
	when 1 => r := reg1;
	when 2 => r := reg2;
	when 3 => r := reg3;
	end case;
	case cf is
	when 1 =>
	  case mf is
	  when 0 => m := tail;
	  when 1 => m := datai;
		addr <= tail;
		rd <= '1';
	  when 2 => addr <= (tail + reg1) mod 2**20;
		rd <= '1';
                m := datai;
	  when 3 => addr <= (tail + reg2) mod 2**20;
		rd <= '1';
                m := datai;
	  end case;
	  case ff is
	  when 0 => if r < m then
                   B := '1';
                  else
                   B := '0';
                  end if;
	  when 1 => if not(r < m) then 
                   B := '1';
                  else
                   B := '0'; 
                  end if;
	  when 2 => if r = m then 
                   B := '1';
                  else 
                   B := '0'; 
                  end if;  
	  when 3 => if not(r = m) then 
                   B := '1'; 
                  else
                   B := '0';
                  end if; 
	  when 4 => if not(r > m) then
                   B := '1'; 
                  else 
                   B := '0'; 
                  end if;
	  when 5 => if r > m then 
                   B := '1'; 
                  else 
                   B := '0'; 
                  end if;
	  when 6 => if r > 2**30 - 1 then
                   r := r - 2**30;
                  end if;
		  if r < m then 
                   B := '1'; 
                  else 
                   B := '0'; 
                  end if;
	  when 7 => if r > 2**30 - 1 then
                   r := r - 2**30;
                  end if;
		  if not(r < m) then
                   B := '1'; 
                  else 
                   B := '0'; 
                  end if; 
	  when 8 => if (r < m) or ( B = '1') then
                    B := '1';
                   else
                    B := '0';
                   end if;
	  when 9 => if not(r < m) or ( B = '1') then
                    B := '1';
                   else
                    B := '0';
                   end if;
	  when 10 => if (r = m) or ( B = '1') then
                    B := '1';
                   else
                    B := '0';
                   end if;
	  when 11 => if not(r = m) or ( B = '1') then
                    B := '1';
                   else
                    B := '0';
                   end if;
	  when 12 => if not(r > m) or (B = '1') then
                    B := '1';
                   else
                    B := '0';
                   end if;
	  when 13 => if (r > m) or (B = '1') then
                    B := '1';
                   else
                    B := '0';
                   end if;
	  when 14 => if r > 2**30 - 1 then
                   r := r - 2**30;
                  end if;
		   if (r < m) or ( B = '1') then
                    B := '1';              
                   else
                    B := '0';
                   end if;
	  when 15 => if r > 2**30 - 1 then
                   r := r - 2**30;
                  end if;
	           if not(r < m) or ( B = '1') then
                    B := '1';
                   else
                    B := '0';
                   end if;
	  end case;
	when 0 =>
	    if not(df = 7) then
	        if df = 5 then 
	          if not(B) = '1' then
	            d := 3;
	          end if;
	        elsif df = 4 then
	          if B = '1' then
	            d := 3;
	          end if;
	        elsif df = 3 then
	          d := 3;
	        elsif df = 2 then d := 2;
	        elsif df = 1 then d := 1;
	        elsif df = 0 then d := 0;
	        end if;
	    case ff is
	    when 0 =>  
	      case mf is
	      when 0 => m := tail;
	      when 1 => m := datai;
		addr <= tail;
		rd <= '1';
	      when 2 => addr <= (tail + reg1) mod 2**20;
		rd <= '1';
                m := datai;
	      when 3 => addr <= (tail + reg2) mod 2**20;
		rd <= '1';
                m := datai;
	      end case;
	      t := 0;
	      case d is
	      when 0 => reg0 := t - m;
	      when 1 => reg1 := t - m;
	      when 2 => reg2 := t - m;
	      when 3 => reg3 := t - m;
	      when others => null;
	      end case;
	    when 1 =>  
	      case mf is
	      when 0 => m := tail;
	      when 1 => m := datai;
		addr <= tail;
		rd <= '1';
	      when 2 => addr <= (tail + reg1) mod 2**20;
		rd <= '1';
                m := datai;
	      when 3 => addr <= (tail + reg2) mod 2**20;
		rd <= '1';
                m := datai;
	      end case;
	      reg2 := reg3; 
	      reg3 := m;
	    when 2 =>  
	      case mf is
	      when 0 => m := tail;
	      when 1 => m := datai;
		addr <= tail;
		rd <= '1';
	      when 2 => addr <= (tail + reg1) mod 2**20;
		rd <= '1';
                m := datai;
	      when 3 => addr <= (tail + reg2) mod 2**20;
		rd <= '1';
                m := datai;
	      end case;
	      case d is
	      when 0 => reg0 := m;
	      when 1 => reg1 := m;
	      when 2 => reg2 := m;
	      when 3 => reg3 := m;
	      when others => null;
	      end case;
	    when 3 =>  
	      case mf is
	      when 0 => m := tail;
	      when 1 => m := datai;
		addr <= tail;
		rd <= '1';
	      when 2 => addr <= (tail + reg1) mod 2**20;
		rd <= '1';
                m := datai;
	      when 3 => addr <= (tail + reg2) mod 2**20;
		rd <= '1';
                m := datai;
	      end case;
	      case d is
	      when 0 => reg0 := m;
	      when 1 => reg1 := m;
	      when 2 => reg2 := m;
	      when 3 => reg3 := m;
	      when others => null;
	      end case;
	    when 4 =>  
	      case mf is
	      when 0 => m := tail;
	      when 1 => m := datai;
		addr <= tail;
		rd <= '1';
	      when 2 => addr <= (tail + reg1) mod 2**20;
		rd <= '1';
                m := datai;
	      when 3 => addr <= (tail + reg2) mod 2**20;
		rd <= '1';
                m := datai;
	      end case;
	      case d is
	      when 0 => reg0 := (r + m) mod 2**30;
	      when 1 => reg1 := (r + m) mod 2**30;
	      when 2 => reg2 := (r + m) mod 2**30;
	      when 3 => reg3 := (r + m) mod 2**30;
	      when others => null;
	      end case;
	    when 5 =>  
	      case mf is
	      when 0 => m := tail;
	      when 1 => m := datai;
		addr <= tail;
		rd <= '1';
	      when 2 => addr <= (tail + reg1) mod 2**20;
		rd <= '1';
                m := datai;
	      when 3 => addr <= (tail + reg2) mod 2**20;
		rd <= '1';
                m := datai;
	      end case;
	      case d is
	      when 0 => reg0 := (r + m) mod 2**30;
	      when 1 => reg1 := (r + m) mod 2**30;
	      when 2 => reg2 := (r + m) mod 2**30;
	      when 3 => reg3 := (r + m) mod 2**30;
	      when others => null;
	      end case;
	    when 6 =>   
	      case mf is
	      when 0 => m := tail;
	      when 1 => m := datai;
		addr <= tail;
		rd <= '1';
	      when 2 => addr <= (tail + reg1) mod 2**20;
		rd <= '1';
                m := datai;
	      when 3 => addr <= (tail + reg2) mod 2**20;
		rd <= '1';
                m := datai;
	      end case;
	      case d is
	      when 0 => reg0 := (r - m) mod 2**30;
	      when 1 => reg1 := (r - m) mod 2**30;
	      when 2 => reg2 := (r - m) mod 2**30;
	      when 3 => reg3 := (r - m) mod 2**30;
	      when others => null;
	      end case;
	    when 7 =>  
	      case mf is
	      when 0 => m := tail;
	      when 1 => m := datai;
		addr <= tail;
		rd <= '1';
	      when 2 => addr <= (tail + reg1) mod 2**20;
		rd <= '1';
                m := datai;
	      when 3 => addr <= (tail + reg2) mod 2**20;
		rd <= '1';
                m := datai;
	      end case;
	      case d is
	      when 0 => reg0 := (r - m) mod 2**30;
	      when 1 => reg1 := (r - m) mod 2**30;
	      when 2 => reg2 := (r - m) mod 2**30;
	      when 3 => reg3 := (r - m) mod 2**30;
	      when others => null;
	      end case;
	    when 8 =>  
	      case mf is
	      when 0 => m := tail;
	      when 1 => m := datai;
		addr <= tail;
		rd <= '1';
	      when 2 => addr <= (tail + reg1) mod 2**20;
		rd <= '1';
                m := datai;
	      when 3 => addr <= (tail + reg2) mod 2**20;
		rd <= '1';
                m := datai;
	      end case;
	      case d is
	      when 0 => reg0 := (r + m) mod 2**30;
	      when 1 => reg1 := (r + m) mod 2**30;
	      when 2 => reg2 := (r + m) mod 2**30;
	      when 3 => reg3 := (r + m) mod 2**30;
	      when others => null;
	      end case;
	    when 9 =>  
	      case mf is
	      when 0 => m := tail;
	      when 1 => m := datai;
		addr <= tail;
		rd <= '1';
	      when 2 => addr <= (tail + reg1) mod 2**20;
		rd <= '1';
                m := datai;
	      when 3 => addr <= (tail + reg2) mod 2**20;
		rd <= '1';
                m := datai;
	      end case;
	      case d is
	      when 0 => reg0 := (r - m) mod 2**30;
	      when 1 => reg1 := (r - m) mod 2**30;
	      when 2 => reg2 := (r - m) mod 2**30;
	      when 3 => reg3 := (r - m) mod 2**30;
	      when others => null;
	      end case;
	    when 10 =>  
	      case mf is
	      when 0 => m := tail;
	      when 1 => m := datai;
		addr <= tail;
		rd <= '1';
	      when 2 => addr <= (tail + reg1) mod 2**20;
		rd <= '1';
                m := datai;
	      when 3 => addr <= (tail + reg2) mod 2**20;
		rd <= '1';
                m := datai;
	      end case;
	      case d is
	      when 0 => reg0 := (r + m) mod 2**30;
	      when 1 => reg1 := (r + m) mod 2**30;
	      when 2 => reg2 := (r + m) mod 2**30;
	      when 3 => reg3 := (r + m) mod 2**30;
	      when others => null;
	      end case;
	    when 11 =>  
	      case mf is
	      when 0 => m := tail;
	      when 1 => m := datai;
		addr <= tail;
		rd <= '1';
	      when 2 => addr <= (tail + reg1) mod 2**20;
		rd <= '1';
                m := datai;
	      when 3 => addr <= (tail + reg2) mod 2**20;
		rd <= '1';
                m := datai;
	      end case;
	      case d is
	      when 0 => reg0 := (r - m) mod 2**30;
	      when 1 => reg1 := (r - m) mod 2**30;
	      when 2 => reg2 := (r - m) mod 2**30;
	      when 3 => reg3 := (r - m) mod 2**30;
	      when others => null;
	      end case;
	    when 12 =>
	      case mf is
	      when 0 => t := r / 2;
              when 1 => t := r / 2;
		if B = '1' then
		  t := t mod  2**29;
		end if;
	      when 2 => t := (r mod 2**29) * 2;
	      when 3 => t := (r mod 2**29) * 2;
		if t > 2**30 - 1 then
		  B := '1';
		else
		  B := '0';
		end if;
              when others => null;
	      end case;
	      case d is
	      when 0 => reg0 := t;
	      when 1 => reg1 := t;
	      when 2 => reg2 := t;
	      when 3 => reg3 := t;
	      when others => null;
	      end case;
	    when 13 | 14 | 15 => null;
	    end case;
	  elsif df = 7 then
	    case mf is
	    when 0 => m := tail;
	    when 1 => m := tail;
	    when 2 => m := (reg1 mod 2**20) + (tail mod 2**20);
	    when 3 => m := (reg2 mod 2**20) + (tail mod 2**20);
	    end case;
	    -- addr <= m;
	    addr <= m mod 2*20;
	    -- removed (!)fs020699
	    wr <='1';
	    datao <= r;
	  end if;
	end case;
	state := FETCH;
      end case;
  end if;

end process;

end BEHAV;

entity b15 is
    port    (BE_n:                  out bit_vector(3 downto 0);
            Address:                out integer range 2**30 - 1 downto 0;
            W_R_n:                  out bit;
            D_C_n:                  out bit;
            M_IO_n:                 out bit;
            ADS_n:                  out bit;
            Datai:                  in integer;
            Datao:                  out integer;
            CLOCK:                  in bit;
            NA_n, BS16_n:           in bit;
            READY_n, HOLD:          in bit;
            RESET:                  in bit);

end b15;

architecture BEHAV of b15 is

    SIGNAL StateNA:	    bit;
    SIGNAL StateBS16:       bit;
    SIGNAL RequestPending:  bit;
    CONSTANT Pending:       bit                   := '1';
    CONSTANT NotPending:    bit                   := '0';
    SIGNAL NonAligned:      bit;
    SIGNAL ReadRequest:     bit;
    SIGNAL MemoryFetch:     bit;
    SIGNAL CodeFetch:       bit;
    SIGNAL ByteEnable:      bit_vector(3 downto 0);
    SIGNAL DataWidth:       integer;
    CONSTANT WidthByte:     INTEGER                 := 0;
    CONSTANT WidthWord:     INTEGER                 := 1;
    CONSTANT WidthDword:    INTEGER                 := 2;

    SIGNAL State:           integer range 7 downto 0;

    constant StateInit:     integer := 0;
    CONSTANT StateTi:       INTEGER := 1;
    CONSTANT StateT1:       INTEGER := 2;
    CONSTANT StateT2:       INTEGER := 3;
    CONSTANT StateT1P:      INTEGER := 4;
    CONSTANT StateTh:       INTEGER := 5;
    CONSTANT StateT2P:      INTEGER := 6;
    CONSTANT StateT2I:      INTEGER := 7;

    SIGNAL EAX: integer;
    SIGNAL EBX: integer;

    SIGNAL rEIP:        integer;

        CONSTANT REP:               INTEGER := 16#F3#;
        CONSTANT REPNE:             INTEGER := 16#F2#;
        CONSTANT LOCK:              INTEGER := 16#F0#;

        CONSTANT CSsop:             INTEGER := 16#2E#;
        CONSTANT SSsop:             INTEGER := 16#36#;
        CONSTANT DSsop:             INTEGER := 16#3E#;
        CONSTANT ESsop:             INTEGER := 16#26#;
        CONSTANT FSsop:             INTEGER := 16#64#;
        CONSTANT GSsop:             INTEGER := 16#65#;
        CONSTANT OPsop:             INTEGER := 16#66#;
        CONSTANT ADsop:             INTEGER := 16#67#;

        CONSTANT MOV_al_b:          INTEGER := 16#B0#;
        CONSTANT MOV_eax_dw:        INTEGER := 16#B8#;
        CONSTANT MOV_ebx_dw:        INTEGER := 16#BB#;
        CONSTANT MOV_ebx_eax:       INTEGER := 16#89#;
        CONSTANT MOV_eax_ebx:       INTEGER := 16#8B#;
        CONSTANT IN_al:             INTEGER := 16#E4#;
        CONSTANT OUT_al:            INTEGER := 16#E6#;
        CONSTANT ADD_al_b:          INTEGER := 16#04#;
        CONSTANT ADD_ax_w:          INTEGER := 16#05#;
        CONSTANT ROL_eax_b:         INTEGER := 16#D1#;
        CONSTANT ROL_al_1:          INTEGER := 16#D0#;
        CONSTANT ROL_al_n:          INTEGER := 16#C0#;
        CONSTANT INC_eax:           INTEGER := 16#40#;
        CONSTANT INC_ebx:           INTEGER := 16#43#;
        CONSTANT JMP_rel_short:     INTEGER := 16#EB#;
        CONSTANT JMP_rel_near:      INTEGER := 16#E9#;
        CONSTANT JMP_intseg_immed:  INTEGER := 16#EA#;
        CONSTANT HLT:               INTEGER := 16#F4#;
        CONSTANT WAITx:             INTEGER := 16#9B#;
        CONSTANT NOP:               INTEGER := 16#90#;

    BEGIN

P0 :     PROCESS(CLOCK,RESET)
    BEGIN
      if reset = '1' then
	    BE_n <= "0000";
            Address <= 0;
            W_R_n <= '0';
            D_C_n <= '0';
            M_IO_n <= '0';
	    ADS_n <= '0';

	    State <= StateInit;

	    StateNA <= '0';
	    StateBS16 <= '0';
	    DataWidth <= 0;

      elsif clock'event and clock = '1' then
        CASE State is
	    WHEN StateInit =>
		D_C_n <= '1';
		ADS_n <= '1';
		State <= StateTi;
		StateNA <= '1';
		StateBS16 <= '1';
		DataWidth <= 2;
		State <= StateTi;

            WHEN StateTi =>
                IF RequestPending = Pending THEN
                    State <= StateT1;
                ELSIF HOLD = '1' THEN
                    State <= StateTh;
                ELSE
                    State <= StateTi;
                END IF;

            WHEN StateT1 =>
                -- Address <= rEIP/4;
                -- fs 062299
	      Address <= rEIP/4 mod 2**30;
	      BE_n <= ByteEnable;
	      M_IO_n <= MemoryFetch;
	      IF ReadRequest = Pending THEN
		W_R_n <= '0';
	      ELSE
		W_R_n <= '1';
	      END IF;
	      IF CodeFetch = Pending THEN
		D_C_n <= '0';
	      ELSE
		D_C_n <= '1';
	      END IF;
	      ADS_n <= '0';
	      State <= StateT2;

            WHEN StateT2 =>
                IF READY_n = '0' and HOLD ='0' and RequestPending = Pending THEN
                    State <= StateT1;
                ELSIF READY_N = '1' and NA_n = '1' THEN
                    NULL;
                ELSIF (RequestPending = Pending or HOLD = '1') and (READY_N = '1' and NA_n = '0') THEN
                    State <= StateT2I;
                ELSIF RequestPending = Pending and HOLD = '0' and READY_N = '1' and NA_n = '0' THEN
                    State <= StateT2P;
                ELSIF RequestPending = NotPending and HOLD = '0' and READY_N = '0' THEN
                    State <= StateTi;
                ELSIF HOLD = '1' and READY_N = '1' THEN
                    State <= StateTh;
		ELSE
		    State <= StateT2;
                END IF;
		StateBS16 <= BS16_n;
		IF BS16_n = '0' THEN
		    DataWidth <= Widthword;
		ELSE
		    DataWidth <= WidthDword;
		END IF;
		StateNA <= NA_n;
		ADS_n <= '1';

            WHEN StateT1P =>
                IF NA_n = '0' and HOLD = '0' and RequestPending = Pending THEN
                    State <= StateT2P;
                ELSIF NA_n = '0' and (HOLD = '1' or RequestPending = NotPending) THEN
                    State <= StateT2I;
                ELSIF NA_n = '1' THEN
                    State <= StateT2;
		ELSE
		    State <= StateT1P;
                END IF;
		StateBS16 <= BS16_n;
		IF BS16_n = '0' THEN
		    DataWidth <= Widthword;
		ELSE
		    DataWidth <= WidthDword;
		END IF;
		StateNA <= NA_n;
		ADS_n <= '1';

            WHEN StateTh =>
                IF HOLD = '0' and RequestPending = Pending THEN
                    State <= StateT1;
                ELSIF HOLD = '0' and RequestPending = NotPending THEN
                    State <= StateTi;
		ELSE
		    State <= StateTh;
                END IF;

            WHEN StateT2P =>
	        -- Address <= rEIP/2;
                -- fs 990629
	        Address <= rEIP/2 mod 2**30;
                BE_n <= ByteEnable;
                M_IO_n <= MemoryFetch;
                IF ReadRequest = Pending THEN
                    W_R_n <= '0';
                ELSE
                    W_R_n <= '1';
                END IF;
                IF CodeFetch = Pending THEN
                    D_C_n <= '0';
                ELSE
                    D_C_n <= '1';
                END IF;
		ADS_n <= '0';
                IF READY_n = '0' THEN
                    State <= StateT1P;
		ELSE
		    State <= StateT2P;
                END IF;

            WHEN StateT2I =>
                IF READY_n = '1' and RequestPending = Pending and HOLD = '0' THEN
                    State <= StateT2P;
                ELSIF READY_n = '0' and HOLD = '1' THEN
                    State <= StateTh;
                ELSIF READY_n = '0' and HOLD = '0' and RequestPending = Pending THEN
                    State <= StateT1;
                ELSIF READY_n = '0' and HOLD = '0' and RequestPending = NotPending THEN
                    State <= StateTi;
		ELSE
		    State <= StateT2I;
                END IF;

        END CASE;
      end if;
    end PROCESS;

P1 :     PROCESS(clock,reset)
    type queue is array(15 downto 0) of integer range 255 downto 0;
    VARIABLE InstQueue:         queue;
    VARIABLE InstQueueRd_Addr:  INTEGER range 31 downto 0;
    VARIABLE InstQueueWr_Addr:  INTEGER range 31 downto 0;
    constant InstQueueLimit:    INTEGER := 15;
    VARIABLE InstAddrPointer:   INTEGER;
    VARIABLE PhyAddrPointer:    INTEGER;
    VARIABLE Extended:          BOOLEAN;
    VARIABLE More:              BOOLEAN;
    VARIABLE Flush:             BOOLEAN;
    VARIABLE lWord:             integer range (2**16) - 1 downto 0;
    VARIABLE uWord:             integer range (2**15) - 1 downto 0;
    VARIABLE fWord:             integer;
    variable State2:		integer range 9 downto 0;
    constant Si:		integer := 0;
    constant S1:		integer := 1;
    constant S2:		integer := 2;
    constant S3:		integer := 3;
    constant S4:		integer := 4;
    constant S5:		integer := 5;
    constant S6:		integer := 6;
    constant S7:		integer := 7;
    constant S8:		integer := 8;
    constant S9:		integer := 9;

    BEGIN
	if reset = '1' then
	    State2 := Si;
	    InstQueue := (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
	    InstQueueRd_Addr := 0;
	    InstQueueWr_Addr := 0;
	    InstAddrPointer := 0;
	    PhyAddrPointer := 0;
	    Extended := FALSE;
	    More := FALSE;
	    Flush := FALSE;
	    lWord := 0;
	    uWord := 0;
	    fWord := 0;
	    CodeFetch <= '0';
            Datao <= 0;
	    EAX <= 0;
	    EBX <= 0;
	    rEIP <= 0;
	    ReadRequest <= '0';
	    MemoryFetch <= '0';
	    RequestPending <= '0';

	elsif clock'event and clock = '1' then
	case State2 is
	when Si =>
            PhyAddrPointer := rEIP;
            InstAddrPointer := PhyAddrPointer;
	    State2 := S1;
	    rEIP <= 16#FFFF0#;
	    ReadRequest <= '1';
	    MemoryFetch <= '1';
	    RequestPending <= '1';
	when S1 =>
            RequestPending <= Pending;
            ReadRequest <= Pending;
            MemoryFetch <= Pending;
            CodeFetch <= Pending;
	    if READY_n = '0' then
		State2 := S2;
	    else
		State2 := S1;
	    end if;
	when S2 =>
            RequestPending <= NotPending;
            InstQueue(InstQueueWr_Addr) := Datai mod (2**8);
            InstQueueWr_Addr := (InstQueueWr_Addr+ 1) mod 16;
--            InstQueue(InstQueueWr_Addr) := (Datai / (2**8)) mod (2**8);
            InstQueue(InstQueueWr_Addr) := Datai mod 2**8;
            InstQueueWr_Addr := (InstQueueWr_Addr + 1) mod 16;
            IF StateBS16 = '1' THEN
		InstQueue(InstQueueWr_Addr) := (Datai / (2**16)) mod (2**8);
		InstQueueWr_Addr := (InstQueueWr_Addr+ 1) mod 16;
		InstQueue(InstQueueWr_Addr) := (Datai / (2**24)) mod (2**8);
		InstQueueWr_Addr := (InstQueueWr_Addr + 1) mod 16;
		PhyAddrPointer := PhyAddrPointer + 4;
		State2 := S5;
            ELSE
		PhyAddrPointer := PhyAddrPointer + 2;
		if (PhyAddrPointer < 0) then
			rEIP <= -PhyAddrPointer;
		else
			rEIP <= PhyAddrPointer;
		end if;
		State2 := S3;
	    END IF;
	when S3 =>
            RequestPending <= Pending;
	    if READY_n = '0' then
		State2 := S4;
	    else
		State2 := S3;
	    end if;
	when S4 =>
            RequestPending <= NotPending;
            InstQueue(InstQueueWr_Addr) := Datai mod (2**8);
            InstQueueWr_Addr := (InstQueueWr_Addr + 1) mod 16;
            InstQueue(InstQueueWr_Addr) := Datai mod (2**8);
            InstQueueWr_Addr := (InstQueueWr_Addr + 1) mod 16;
            PhyAddrPointer := PhyAddrPointer + 2;
	    State2 := S5;
	when S5 =>
            CASE InstQueue(InstQueueRd_Addr) is
                WHEN NOP =>
                    InstAddrPointer := InstAddrPointer + 1;
                    InstQueueRd_Addr := (InstQueueRd_Addr + 1) mod 16;
                    Flush := FALSE;
                    More := FALSE;
                WHEN OPsop =>
                    InstAddrPointer := InstAddrPointer + 1;
                    InstQueueRd_Addr := (InstQueueRd_Addr + 1) mod 16;
                    Extended := TRUE;
                    Flush := FALSE;
                    More := FALSE;
                WHEN JMP_rel_short =>
                    IF (InstQueueWr_Addr - InstQueueRd_Addr) >= 3 THEN
                        IF InstQueue((InstQueueRd_Addr +1) mod 16) > 127 THEN
                            PhyAddrPointer := InstAddrPointer + 1 - (16#FF# - InstQueue((InstQueueRd_Addr +1) mod 16));
                            InstAddrPointer := PhyAddrPointer;
                        ELSE
                            PhyAddrPointer := InstAddrPointer + 2 + InstQueue((InstQueueRd_Addr +1)mod 16);
                            InstAddrPointer := PhyAddrPointer;
                        END IF;
                        Flush := TRUE;
                        More := FALSE;
                    ELSE
                        Flush := FALSE;
                        More := TRUE;
                    END IF;
                WHEN JMP_rel_near =>
                    IF (InstQueueWr_Addr - InstQueueRd_Addr) >= 5 THEN
                        PhyAddrPointer := InstAddrPointer + 5 + InstQueue((InstQueueRd_Addr +1)mod 16);
                        InstAddrPointer := PhyAddrPointer;
                        Flush := TRUE;
                        More := FALSE;
                    ELSE
                        Flush := FALSE;
                        More := TRUE;
                    END IF;
                WHEN JMP_intseg_immed =>
                    InstAddrPointer := InstAddrPointer + 1;
                    InstQueueRd_Addr := (InstQueueRd_Addr + 1)mod 16;
                    Flush := FALSE;
                    More := FALSE;
                WHEN MOV_al_b =>
                    InstAddrPointer := InstAddrPointer + 1;
                    InstQueueRd_Addr := (InstQueueRd_Addr+ 1) mod 16;
                    Flush := FALSE;
                    More := FALSE;
                WHEN MOV_eax_dw =>
                    IF (InstQueueWr_Addr - InstQueueRd_Addr) >= 5 THEN
                        EAX <= InstQueue((InstQueueRd_Addr +4)mod 16)*(2**23) + InstQueue((InstQueueRd_Addr +3) mod 16)*(2**16) + InstQueue((InstQueueRd_Addr +2) mod 16)*(2**8) + InstQueue((InstQueueRd_Addr+1)mod 16);
                        More := FALSE;
                        Flush := FALSE;
                        InstAddrPointer := InstAddrPointer + 5;
                        InstQueueRd_Addr := (InstQueueRd_Addr + 5) mod 16;
                    ELSE
                        Flush := FALSE;
                        More := TRUE;
                    END IF;
                WHEN MOV_ebx_dw =>
                    IF (InstQueueWr_Addr - InstQueueRd_Addr) >= 5 THEN
                        EBX <= InstQueue((InstQueueRd_Addr+4) mod 16)*(2**23) + InstQueue((InstQueueRd_Addr +3) mod 16)*(2**16) + InstQueue((InstQueueRd_Addr +2) mod 16)*(2**8) + InstQueue((InstQueueRd_Addr +1) mod 1);
                        More := FALSE;
                        Flush := FALSE;
                        InstAddrPointer := InstAddrPointer + 5;
                        InstQueueRd_Addr := (InstQueueRd_Addr + 5) mod 16;
                    ELSE
                        Flush := FALSE;
                        More := TRUE;
                    END IF;
                WHEN MOV_eax_ebx =>
                    IF (InstQueueWr_Addr - InstQueueRd_Addr) >= 2 THEN
			if (EBX < 0) then
				rEIP <= -EBX;
			else
	                        rEIP <= EBX;
			end if;
                        RequestPending <= Pending;
                        ReadRequest <= Pending;
                        MemoryFetch <= Pending;
                        CodeFetch <= NotPending;
			if READY_n = '0' then
                        RequestPending <= NotPending;
                        uWord := Datai mod (2**15);
                        IF StateBS16 = '1' THEN
                            -- lWord := Datai/(2**16);
			    -- fs 062299
			  lWord := Datai mod (2**16);
                        ELSE
                            rEIP <= rEIP + 2;
                            RequestPending <= Pending;
			    if READY_n = '0' then
				RequestPending <= NotPending;
				lWord := Datai mod (2**16);
			    end if;
                        END IF;
			if READY_n = '0' then
                            EAX <= uWord*(2**16) + lWord;
                            More := FALSE;
                            Flush := FALSE;
                            InstAddrPointer := InstAddrPointer + 2;
                            InstQueueRd_Addr := (InstQueueRd_Addr + 2) mod 16;
			end if;
			end if;
                    ELSE
                        Flush := FALSE;
                        More := TRUE;
                    END IF;
                WHEN MOV_ebx_eax =>
                    IF (InstQueueWr_Addr - InstQueueRd_Addr) >= 2 THEN
			if EBX < 0 then
	                        rEIP <= EBX;
			else
	                        rEIP <= EBX;
			end if;
                        lWord := EAX mod (2**16);
                        uWord := (EAX/(2**16)) mod (2**15);
                        RequestPending <= Pending;
                        ReadRequest <= NotPending;
                        MemoryFetch <= Pending;
                        CodeFetch <= NotPending;
			if State = StateT1 or State = StateT1P then
                        Datao <= (uWord*(2**16) + lWord);
			if READY_n = '0' then
                        RequestPending <= NotPending;
                        IF StateBS16 = '0' THEN
                            rEIP <= rEIP + 2;
                            RequestPending <= Pending;
                            ReadRequest <= NotPending;
                            MemoryFetch <= Pending;
                            CodeFetch <= NotPending;
			    State2 :=S6;
                        END IF;
                        More := FALSE;
                        Flush := FALSE;
                        InstAddrPointer := InstAddrPointer + 2;
                        InstQueueRd_Addr := (InstQueueRd_Addr + 2) mod 16;
			end if;
			end if;
                    ELSE
                        Flush := FALSE;
                        More := TRUE;
                    END IF;
                WHEN IN_al =>
                    IF (InstQueueWr_Addr - InstQueueRd_Addr) >= 2 THEN
                        rEIP <= InstQueueRd_Addr+1;
                        RequestPending <= Pending;
                        ReadRequest <= Pending;
                        MemoryFetch <= NotPending;
                        CodeFetch <= NotPending;
			if READY_n = '0' then
                        RequestPending <= NotPending;
                        EAX <= Datai;
                        InstAddrPointer := InstAddrPointer + 2;
                        InstQueueRd_Addr := (InstQueueRd_Addr + 2);
                        Flush := FALSE;
                        More := FALSE;
			end if;
                    ELSE
                        Flush := FALSE;
                        More := TRUE;
                    END IF;
                WHEN OUT_al =>
                    IF (InstQueueWr_Addr - InstQueueRd_Addr) >= 2 THEN
                        rEIP <= InstQueueRd_Addr+1;
                        RequestPending <= Pending;
                        ReadRequest <= NotPending;
                        MemoryFetch <= NotPending;
                        CodeFetch <= NotPending;
			if State = StateT1 or State = StateT1P then
                            fWord := EAX mod (2**16);
                            Datao <= fWord;
			    if READY_n = '0' then
                        	RequestPending <= NotPending;
                        	InstAddrPointer := InstAddrPointer + 2;
                        	InstQueueRd_Addr := (InstQueueRd_Addr + 2) mod 16;
                        	Flush := FALSE;
                        	More := FALSE;
			    end if;
			end if;
                    ELSE
                        Flush := FALSE;
                        More := TRUE;
                    END IF;
                WHEN ADD_al_b =>
                    InstAddrPointer := InstAddrPointer + 1;
                    InstQueueRd_Addr := (InstQueueRd_Addr + 1) mod 16;
                    Flush := FALSE;
                    More := FALSE;
                WHEN ADD_ax_w =>
                    InstAddrPointer := InstAddrPointer + 1;
                    InstQueueRd_Addr := (InstQueueRd_Addr + 1) mod 16;
                    Flush := FALSE;
                    More := FALSE;
                WHEN ROL_al_1 =>
                    InstAddrPointer := InstAddrPointer + 2;
                    InstQueueRd_Addr := (InstQueueRd_Addr + 2) mod 16;
                    Flush := FALSE;
                    More := FALSE;
                WHEN ROL_al_n =>
                    InstAddrPointer := InstAddrPointer + 2;
                    InstQueueRd_Addr := (InstQueueRd_Addr + 2) mod 16;
                    Flush := FALSE;
                    More := FALSE;
                WHEN INC_eax =>
                    EAX <= EAX + 1;
                    InstAddrPointer := InstAddrPointer + 1;
                    InstQueueRd_Addr := (InstQueueRd_Addr + 1) mod 16;
                    Flush := FALSE;
                    More := FALSE;
                WHEN INC_ebx =>
                    EBX <= EBX + 1;
                    InstAddrPointer := InstAddrPointer + 1;
                    InstQueueRd_Addr := (InstQueueRd_Addr + 1) mod 16;
                    Flush := FALSE;
                    More := FALSE;
                WHEN OTHERS  =>
                    InstAddrPointer := InstAddrPointer + 1;
                    InstQueueRd_Addr := (InstQueueRd_Addr + 1) mod 16;
                    Flush := FALSE;
                    More := FALSE;
            END CASE;
	    if not (InstQueueRd_Addr < InstQueueWr_Addr) or (((InstQueueLimit - InstQueueRd_Addr) < 4) OR Flush OR More) then
		State2 := S7;
	    end if;

	when S6 =>
		Datao <= (uWord*(2**16) + lWord);
		if READY_n = '0'then
		    RequestPending <= NotPending;
		    State2 := S5;
		end if;

	when S7 =>
        IF Flush THEN
            InstQueueRd_Addr := 1;
            InstQueueWr_Addr := 1;

	    if (InstAddrPointer < 0) then
		fWord := -InstAddrPointer;
	    else
	     	fWord := InstAddrPointer;
	    end if;

            IF fWord mod 2 = 1 THEN
                InstQueueRd_Addr := (InstQueueRd_Addr + fWord mod 4) mod 16;
            END IF;
        END IF;
        IF (InstQueueLimit - InstQueueRd_Addr) < 3 THEN
	    State2 := S8;
            InstQueueWr_Addr := 0;
	ELSE
	    State2 := S9;
	END IF;

	when S8 =>
	    if InstQueueRd_Addr <= InstQueueLimit then
                InstQueue(InstQueueWr_Addr) := InstQueue(InstQueueRd_Addr);
                InstQueueRd_Addr := (InstQueueRd_Addr + 1) mod 16;
                InstQueueWr_Addr := (InstQueueWr_Addr + 1) mod 16;
		State2 := S8;
	    else
                InstQueueRd_Addr := 0;
		State2 := S9;
	    end if;

	when S9 =>
            rEIP <= PhyAddrPointer;
	    State2 := S1;

	end case;
	end if;
    end PROCESS;

P2 :     PROCESS(clock,reset)
    BEGIN
	if reset = '1' then
	    ByteEnable <= "0000";
	    NonAligned <= '0';
	elsif clock'event and clock = '1' then
        CASE DataWidth is
            WHEN WidthByte =>
                CASE rEIP mod 4 is
                    WHEN 0 =>
                        ByteEnable <= "1110";
                    WHEN 1 =>
                        ByteEnable <= "1101";
                    WHEN 2 =>
                        ByteEnable <= "1011";
                    WHEN 3 =>
                        ByteEnable <= "0111";
                    WHEN OTHERS  => NULL;
                END CASE;
            WHEN WidthWord =>
                CASE rEIP mod 4 is
                    WHEN 0 =>
                        ByteEnable <= "1100";
                        NonAligned <= NotPending;
                    WHEN 1 =>
                        ByteEnable <= "1001";
                        NonAligned <= NotPending;
                    WHEN 2 =>
                        ByteEnable <= "0011";
                        NonAligned <= NotPending;
                    WHEN 3 =>
                        ByteEnable <= "0111";
                        NonAligned <= Pending;
                    WHEN OTHERS  => NULL;
                END CASE;
            WHEN WidthDword =>
                CASE rEIP mod 4 is
                    WHEN 0 =>
                        ByteEnable <= "0000";
                        NonAligned <= NotPending;
                    WHEN 1 =>
                        ByteEnable <= "0001";
                        NonAligned <= Pending;
                    WHEN 2 =>
                        NonAligned <= Pending;
                        ByteEnable <= "0011";
                    WHEN 3 =>
                        NonAligned <= Pending;
                        ByteEnable <= "0111";
                    WHEN OTHERS  => NULL;
                END CASE;
            WHEN OTHERS  => null;
        END CASE;
	end if;
    end PROCESS;

end BEHAV;

entity b17 is
    port    (clock, reset : in bit;
	    datai : in integer;
	    datao : out integer;
	    hold : in bit;
	    na,bs16 : in bit;
	    address1,address2 : out  integer range 2**30 - 1 downto 0;
	    wr,dc,mio,ast1,ast2 : out bit;
	    ready1,ready2 : in bit
	    );
end b17;

architecture BEHAV of b17 is

signal buf1,buf2 : integer;
signal be1,be2,be3 : bit_vector(3 downto 0);
signal addr1,addr2,addr3 :  integer range 2**30 - 1 downto 0;
signal wr1,wr2,wr3 : bit;
signal dc1,dc2,dc3 : bit;
signal mio1,mio2,mio3 : bit;
signal ads1,ads2,ads3 : bit;
signal di1,di2,di3 : integer;
signal do1,do2,do3 : integer;
signal rdy1,rdy2,rdy3 : bit;
signal ready11,ready12,ready21,ready22 : bit;

component b15
    port    (BE_n:                  out bit_vector(3 downto 0);
            Address:                out integer range 2**30 - 1 downto 0;
            W_R_n:                  out bit;
            D_C_n:                  out bit;
            M_IO_n:                 out bit;
            ADS_n:                  out bit;
            Datai:                  in integer;
            Datao:                  out integer;
            CLOCK:                  in bit;
            NA_n, BS16_n:           in bit;
            READY_n, HOLD:          in bit;
            RESET:                  in bit);

end component;

for all : b15 use entity work.b15(BEHAV);

begin

process(clock,reset)
begin
    if reset = '1' then
	buf1 <= 0;
	ready11 <= '0';
	ready12 <= '0';
    elsif clock'event and clock ='1' then
	if addr1 > 2**29 and ads1 = '0' and mio1 = '1' and dc1 = '0' and wr1 = '1' and be1 = "0000" then
	    buf1 <= do1;
	    ready11 <= '0';
	    ready12 <= '1';
	elsif addr2 > 2**29 and ads2 = '0' and mio2 = '1' and dc2 = '0' and wr2 = '1' and be2 = "0000" then
	    buf1 <= do2;
	    ready11 <= '1';
	    ready12 <= '0';
	else
	    ready11 <= '1';
	    ready12 <= '1';
	end if;
    end if;
end process;

process(clock,reset)
begin
    if reset = '1' then
	buf2 <= 0;
	ready21 <= '0';
	ready22 <= '0';
    elsif clock'event and clock ='1' then
	if addr2 < 2**29 and ads2 = '0' and mio2 = '1' and dc2 = '0' and wr2 = '1' and be2 = "0000" then
	    buf2 <= do2;
	    ready21 <= '0';
	    ready22 <= '1';
	elsif ads3 = '0' and mio3 = '1' and dc3 = '0' and wr3 = '0' and be3 = "0000" then
	    ready21 <= '1';
	    ready22 <= '0';
	else
	    ready21 <= '1';
	    ready22 <= '1';
	end if;
    end if;
end process;

process(addr1,buf1,datai)
begin
    if addr1 > 2**29 then
	di1 <= buf1;
    else
	di1 <= datai;
    end if;
end process;

process(addr2,buf1,buf2)
begin
    if addr2 > 2**29 then
	di2 <= buf1;
    else
	di2 <= buf2;
    end if;
end process;

process(addr2,addr3,do1,do2,do3)
begin
    if (do1 < 2**30)  and (do2 < 2**30)  and (do3 < 2**30 )  then
	address2 <= addr3;
    else
	address2 <= addr2;
    end if;
end process;

process(buf2,do3,addr1,wr3,dc3,mio3,ads1,ads3,ready1,ready2,ready11,ready12,ready21,ready22)
begin
    di3 <= buf2;
    datao <= do3;
    address1 <= addr1;
    wr <= wr3;
    dc <= dc3;
    mio <= mio3;
    ast1 <= ads1;
    ast2 <= ads3;
    rdy1 <= ready11 and ready1;
    rdy2 <= ready12 and ready21;
    rdy3 <= ready22 and ready2;
end process;

P1 : b15 port map (be1,addr1,wr1,dc1,mio1,ads1,di1,do1,clock,na,bs16,rdy1,hold,reset);
P2 : b15 port map (be2,addr2,wr2,dc2,mio2,ads2,di2,do2,clock,na,bs16,rdy2,hold,reset);
P3 : b15 port map (be3,addr3,wr3,dc3,mio3,ads3,di3,do3,clock,na,bs16,rdy3,hold,reset);

end BEHAV;

entity b18 is
    port(clock,reset : in bit;
	hold,na,bs,sel : in bit;
	dout : out integer range 2**19 downto 0;
	din : in integer;
	aux : out integer range 7  downto 0
	);
end b18;

architecture BEHAV of b18 is

component b14
port (
	clock,reset : in bit;
	addr : out integer range 2**20 - 1 downto 0;
	datai : in integer;
	datao : out integer;
	rd,wr : out bit
	);
end component;

component b17
    port(clock, reset : in bit;
	datai : in integer;
	datao : out integer;
	hold : in bit;
	na,bs16 : in bit;
	address1,address2 : out integer range 2**30 -1 downto 0;
	wr,dc,mio,ast1,ast2 : out bit;
	ready1,ready2 : in bit
	);
end component;

for all:b14 use entity work.b14(BEHAV);
for all:b17 use entity work.b17(BEHAV);

signal di1,di2,do1,do2,td1,td2 : integer;
signal di3,di4,do3,do4 :integer;
signal tad1,tad2,ad11,ad12,ad21,ad22 : integer range 2**30-1 downto 0;
signal ad31,ad41 :integer range 2**20 - 1 downto 0;
signal tad3,tad4 : integer range 2**20 - 1 downto 0;
signal wr1,wr2,wr3,wr4,dc1,dc2,mio1,mio2 : bit;
signal as11,as12,as21,as22,r11,r12,r21,r22 : bit;
signal rd3,rd4 : bit;

-- signal prova : integer range 2**30-1 downto 0;
-- removed (!)gs020699

begin

P1 : b17 port map (clock,reset,di1,do1,hold,na,bs,ad11,ad12,wr1,dc1,mio1,as11,as12,r11,r12);
P2 : b17 port map (clock,reset,di2,do2,hold,na,bs,ad21,ad22,wr2,dc2,mio2,as21,as22,r21,r22);
P3 : b14 port map (clock,reset,ad31,di3,do3,rd3,wr3);
P4 : b14 port map (clock,reset,ad41,di4,do4,rd4,wr4);

process(do1,rd3,wr1,mio1,dc1,as12,do2,rd4,wr2,mio2,dc2,as22,as21,as11,wr3,ad31,tad2,wr4,ad41,tad1,do3,do4,ad11,ad12,ad21,ad22,tad3,tad4,sel,din,td1,td2)
begin
-- prova <= do1;
-- di3 <= prova mod 2**20;
    di3 <= do1 mod 2**20;
-- removed (!)gs020699

    r12 <= not (rd3 and wr1 and mio1 and dc1 and not as12);
    di4 <= do2;
    r22 <= not (rd4 and wr2 and mio2 and dc2 and not as22);
    r11 <= as21;
    r21 <= as11;
    if wr3 = '1' then
	tad3 <= ad31;
    else
	--tad3 <= tad2;
	tad3 <= tad2 mod 2**20;
	-- removed (!)fs020699
    end if;
    if wr4 = '1' then
	tad4 <= ad41;
    else
	--tad4 <= tad1;
	tad4 <= tad1 mod 2**20;
	-- removed (!)fs020699
    end if;
    if do3 > 2**28 then
	tad1 <= ad11;
    else
	tad1 <= ad12;
    end if;
    if do4 > 2**29  then
	tad2 <= ad21;
    else
	tad2 <= ad22;
    end if;
    dout <= (tad3 * tad4) mod 2**19;
    if sel = '0' then
	td1 <= 0;
	td2 <= din;
    else
	td1 <= din;
	td2 <= 0;
    end if;
    di1 <= do4 * td1;
    di2 <= do3 * td2;
    aux <= (tad1 * tad2) mod 2**3;
end process;

end BEHAV;
