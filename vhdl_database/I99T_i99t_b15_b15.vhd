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
