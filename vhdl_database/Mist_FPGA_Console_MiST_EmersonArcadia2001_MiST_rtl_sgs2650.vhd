--------------------------------------------------------------------------------
-- Signetics 2650A CPU
--------------------------------------------------------------------------------
-- DO 4/2018
--------------------------------------------------------------------------------

-- Bus Operations
-- - Orignal 2650 use 3 clock cycles per memory access. This core uses 1 cycle
-- - For reads, data shall be available one cycle after req=ack=1
-- - Same instruction timings as orignal

-- <AVOIR> Indirect indexé ++ / --

--INHERENT
--      FETCH EXE
--  A   A+1   A+1
--      OP    OP2   OP2

--LOAD RELATIVE
--      FETCH IMM
--  A   A+1   rDA   A+2    A+3
--      OP    IMM   DR     OP

--STORE RELATIVE
--  A   A+1   wDA   A+2    
--      OP    IMM   ___    OP

--  A   A+1   A+2   wDA
--      OP    IMM   IMM2


-- LOAD ABSOLUTE
--      FETCH IMM   IMM2
-- A    A+1   A+2   AD
--      OP    IMM1  IMM2   DATA
--                  WIDX   WR

-- STORE ABSOLUTE
-- A    A+1   A+2   AD
--      OP    IMM1  IMM2
--                  WIDX

-- LOAD ABSOLUTE INDIRECT
-- A    A+1   A+2   IX     IX+1   AD
--      OP    IMM1  IMM2   ABS1   ABS2   DATA
--                                WIDX   WR

-- Si indexed (absolute indexed)
--   Base
-- Si indirect indexed, addition de l'index après indirection

--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

USE std.textio.ALL;

LIBRARY work;
USE work.base_pack.ALL;
USE work.sgs2650_pack.ALL;

ENTITY sgs2650 IS
  GENERIC (
    VER_B : boolean :=false -- false=2650A,  true=2650B
    );
  PORT (
    req    : OUT std_logic;
    ack    : IN  std_logic;
    ad     : OUT uv15;      -- Address bus
    wr     : OUT std_logic;
    dw     : OUT uv8;       -- Data write
    dr     : IN  uv8;       -- Data read
    mio    : OUT std_logic; -- 1=Memory access 0=IO Port access
    ene    : OUT std_logic; -- 1=Extended / 0=Not Extended I/O
    dc     : OUT std_logic; -- 1=Data 0=Control I/O
    
    ph     : OUT uv2; -- 00=CODE 01=DATA 10=INDIRECT 11=IO
    
    int    : IN  std_logic;
    intack : OUT std_logic;
    ivec   : IN  uv8; -- Interrupt vector
    sense  : IN  std_logic;
    flag   : OUT std_logic;
    
    reset  : IN  std_logic;
    
    clk      : IN std_logic;
    reset_na : IN std_logic
    );
END ENTITY sgs2650;

ARCHITECTURE rtl OF sgs2650 IS

  CONSTANT phCODE     : uv2 :="00";
  CONSTANT phDATA     : uv2 :="01";
  CONSTANT phINDIRECT : uv2 :="10";
  CONSTANT phIO       : uv2 :="11";
  
  ------------------------------------------------
  SIGNAL req_i,req_c : std_logic;
  SIGNAL reqack    : std_logic;
  SIGNAL dw_i,dw_c : uv8;
  SIGNAL ad_i,ad_c : uv15;
  SIGNAL wr_i,wr_c : std_logic;
  SIGNAL ph_i,ph_c : uv2;
  SIGNAL rd_c      : uv8;
  SIGNAL nrd_c     : uv2;
  SIGNAL intp,intp_c : std_logic;
  SIGNAL mio_c,ene_c,dc_c : std_logic;
  SIGNAL rd_maj_c,pushsub_c,popsub_c : std_logic;
  SIGNAL indexed_c,indexed : std_logic;
  
  TYPE enum_state IS (sOPCODE,sIMM,sIMM2,sINDIRECT,sINDIRECT2,sWAIT,
                      sDATA,sIO,sEXE,sINTER,sHALT);
  SIGNAL state,state_c : enum_state;
  
  ------------------------------------------------
  SIGNAL iar,iar_c : uv15; -- Instruction Addres Register
  SIGNAL r0,r1,r1b,r2,r2b,r3,r3b : uv8; -- Registers
  TYPE arr_uv15 IS ARRAY (natural RANGE <>) OF uv15;
  SIGNAL ras : arr_uv15(0 TO 7); -- Return Address Stack
  SIGNAL rras : uv15;
  SIGNAL psu,psl,psu_c,psl_c : uv8; -- Program Status Word
  ALIAS psu_sp  : uv3       IS psu(2 DOWNTO 0); -- Stack pointer
  
  ALIAS psu_ii   : std_logic IS psu(5); -- Interrupt inhibit
  ALIAS psu_ii_c : std_logic IS psu_c(5); -- Interrupt inhibit
  
  ALIAS psu_f   : std_logic IS psu(6); -- Flag output
  ALIAS psu_s   : std_logic IS psu(7); -- Sense input

  ALIAS psl_rs  : std_logic IS psl(4); -- Register Bank Select
  ALIAS psl_idc : std_logic IS psl(5); -- Inter-Digit Carry
  ALIAS psl_cc  : uv2       IS psl(7 DOWNTO 6); -- Condition Code

  ------------------------------------------------
  SIGNAL ri  : uv8;       -- Instruction Register : Opcode
  SIGNAL rh,rh_c : uv8;   -- Holding Register : Second instruction byte
  SIGNAL ru,ru_c : uv8;   -- Holding Register : Second instruction byte
  SIGNAL dec,dec_c : type_deco; -- Decoded opcode

  SIGNAL xxx_rs_v : uv8;
  SIGNAL xxx_ph   : string(1 TO 4);
  SIGNAL xxx_indirect : std_logic;
  SIGNAL ccnt : natural;
  
  ------------------------------------------------
  FILE fil : text OPEN write_mode IS "trace.log";
  
BEGIN
  
  Comb:PROCESS(dr,psl,psu,iar,state,req_i,ack,
               r0,r1,r1b,r2,r2b,r3,r3b,ru,rras,
               int,ivec,ph_i,intp,dec,
               ad_i,wr_i,dw_i,ri,rh,indexed) IS
    VARIABLE rs_v,rd_v,psl_v : uv8;
    VARIABLE rd_mav : std_logic;
    VARIABLE cond_v : boolean;
    VARIABLE nrd_v : uv2;
    VARIABLE dec_v : type_deco;
  BEGIN
    
    rd_maj_c<='0';
    rd_c<=ri;
    rd_v:=x"00";
    
    pushsub_c<='0';
    popsub_c <='0';
    
    psl_c<=psl;
    psu_c<=psu;
    iar_c<=iar;
    state_c<=state;
    dec_v:=dec;

    dec_c<=dec;
    ad_c<=ad_i;
    wr_c<=wr_i;
    dw_c<=dw_i;
    ph_c<=ph_i;
    mio_c<='1';   -- Memory access as default
    ene_c<=ri(2); -- Extended/non Extended IO access
    dc_c <=ri(6); -- Data/Control IO access
    rh_c<=rh;
    ru_c<=ru;
    indexed_c<=indexed;
    req_c<='1';
    intp_c<=intp;
    
    ---------------------------------------------
    -- Source register
    IF state=sOPCODE THEN
      CASE dr(1 DOWNTO 0) IS
        WHEN "01"   => rs_v:=mux(psl_rs,r1b,r1);
        WHEN "10"   => rs_v:=mux(psl_rs,r2b,r2);
        WHEN "11"   => rs_v:=mux(psl_rs,r3b,r3);
        WHEN OTHERS => rs_v:=r0;
      END CASE;
      nrd_c<=dr(1 DOWNTO 0);
    ELSE
      CASE ri(1 DOWNTO 0) IS
        WHEN "01"   => rs_v:=mux(psl_rs,r1b,r1);
        WHEN "10"   => rs_v:=mux(psl_rs,r2b,r2);
        WHEN "11"   => rs_v:=mux(psl_rs,r3b,r3);
        WHEN OTHERS => rs_v:=r0;
      END CASE;
      nrd_c<=ri(1 DOWNTO 0);
    END IF;

    xxx_rs_v<=rs_v;
    
    cond_v:=(ri(1 DOWNTO 0)=psl_cc OR ri(1 DOWNTO 0)="11");
    psl_v:=psl;
    
    ---------------------------------------------
    IF (req_i='1' AND ack='1') OR req_i='0' THEN
      CASE state IS
          --------------------------------------
        WHEN sOPCODE =>
          indexed_c<='0';
          iar_c<=iar+1;
          ad_c<=iar+1;
          wr_c<='0'; -- READ
          dw_c<=x"00";
          ph_c<=phCODE;
          intp_c<='0';
          
          dec_v:=opcodes(to_integer(dr));
          dec_c<=dec_v;
          IF int='1' AND psu_ii='0' THEN
            state_c<=sINTER;
            iar_c<=iar - 1;
            -- <AFAIRE> Indirect ?
            --iar_c<="00"  & sext(ivec(6 DOWNTO 0),13);
            ad_c <="00"  & sext(ivec(6 DOWNTO 0),13);
            
          ELSIF dec_v.len>1 THEN
            state_c<=sIMM;
          ELSIF dec_v.ins=IO THEN
            state_c<=sIO;
            ad_c<="0000000" & x"00";
            dw_c<=rs_v;
            IF dr(7)='1' THEN -- WRTC, WRTD, WRTE : Write IO
              wr_c<='1';
            END IF;
            mio_c<='0';
            ph_c<=phIO;
          ELSE
            state_c<=sEXE;
          END IF;
          
          --------------------------------------
        WHEN sIMM =>
          -- Immediate, Relative or Absolute
          iar_c<=iar+1;
          ad_c<=iar+1;
          wr_c<='0';
          dw_c<=rs_v;
          ph_c<=phCODE;
          rh_c<=dr;
          ru_c<=dr;
          
          IF dec.len>2 THEN
            state_c<=sIMM2;
          ELSE
            CASE dec.fmt IS
              WHEN I | EI => -- IMMEDIATE
                CASE dec.ins IS
                  WHEN ALU => -- rn = rn <op> imm
                    state_c<=sOPCODE;
                    op_alu(ri,rs_v,dr,psl,rd_v,psl_v);
                    rd_maj_c<='1';
                    rd_c<=rd_v;
                    psl_c<=psl_v;
                    
                  WHEN TMI => -- Test under Mask, Immediate (3cy)
                    state_c<=sWAIT;
                    op_tmi(rs_v,dr,psl,psl_v);
                    psl_c<=psl_v;
                    
                  WHEN IO => -- READ/WRITE EXTENDED IO
                    state_c <=sIO;
                    ad_c<="0000000" & dr;
                    dw_c<=rs_v;
                    IF ri(7)='1' THEN -- WRTC, WRTD, WRTE : Write IO
                      wr_c<='1';
                    END IF;
                    mio_c<='0';
                    ph_c<=phIO;
                    
                  WHEN CPPS => -- Clear/Preset Program Status Upper/Lower (3cy)
                    state_c<=sWAIT;
                    IF ri(1 DOWNTO 0)="00" THEN -- CPSU
                      psu_c<=psu AND NOT dr;
                    ELSIF ri(1 DOWNTO 0)="01" THEN -- CPSL
                      psl_c<=psl AND NOT dr;
                    ELSIF ri(1 DOWNTO 0)="10" THEN -- PPSU
                      psu_c<=psu OR dr;
                    ELSE -- PPSL
                      psl_c<=psl OR dr;
                    END IF;
                    
                  WHEN TPS  => -- Test Program Status Upper / Lower (3cy)
                    state_c<=sWAIT;
                    IF (mux(ri(0),psl,psu) AND dr)=dr THEN
                      psl_c(7 DOWNTO 6)<="00";
                    ELSE
                      psl_c(7 DOWNTO 6)<="10";
                    END IF;

                  WHEN OTHERS => -- IMPOSSIBLE
                    NULL;
                    
                END CASE;
                
              WHEN R | ER => -- RELATIVE
                dw_c<=rs_v;
                ru_c(6 DOWNTO 5)<="00"; -- No indexed indirect
                
                CASE dec.ins IS
                    -------------------------------
                  WHEN ALU => -- Add, Sub, And, Xor, Cmp, Load Relative
                    ad_c<=iar + sext(dr(6 DOWNTO 0),15) + 1;
                    IF dr(7)='1' THEN -- INDIRECT
                      state_c<=sINDIRECT;
                      ph_c<=phINDIRECT;
                    ELSE
                      state_c<=sDATA;
                      ph_c<=phDATA;
                    END IF;
                    
                  WHEN STR => -- Store Relative
                    ad_c<=iar + sext(dr(6 DOWNTO 0),15) + 1;
                    IF dr(7)='1' THEN -- INDIRECT
                      state_c<=sINDIRECT;
                      ph_c<=phINDIRECT;
                    ELSE
                      state_c<=sDATA;
                      ph_c<=phDATA;
                      wr_c<='1';
                    END IF;
                    
                    -- Adresse relative = PC_instruction_suivante + Offset
                      
                    -------------------------------
                  WHEN BCTF |  -- Branch on condition True/False Relativ 18/98
                       BRN  |  -- Branch on register non-zero, Relative  58
                       BIDR => -- Branch on Inc / Dec Register, Relative D8/F8
                    state_c<=sWAIT;
                    IF ri(7 DOWNTO 6)="11" THEN -- BIDR : Inc/Dec
                      IF ri(5)='0' THEN -- BRIR : INC
                        rd_v:=rs_v+1;
                      ELSE -- BDRR
                        rd_v:=rs_v-1;
                      END IF;
                      rd_maj_c<='1';
                    END IF;
                    rd_c<=rd_v;
                    
                    IF (ri(7 DOWNTO 6)="00" AND cond_v) OR         -- BCTR
                       (ri(7 DOWNTO 6)="10" AND NOT cond_v) OR     -- BCFR
                       (ri(7 DOWNTO 6)="01" AND rs_v/=x"00") OR    -- BRN
                       (ri(7 DOWNTO 6)="11" AND rd_v/=x"00") THEN  -- BIDR
                      ad_c <=iar + sext(dr(6 DOWNTO 0),15) + 1;
                      iar_c<=iar + sext(dr(6 DOWNTO 0),15) + 1;
                      IF dr(7)='1' THEN -- INDIRECT
                        ph_c<=phINDIRECT;
                        state_c<=sINDIRECT;
                      ELSE
                        ph_c<=phCODE;
                        state_c<=sWAIT;
                      END IF;
                    ELSE
                      state_c<=sWAIT;
                    END IF;
                    
                  WHEN ZBRR => -- Zero Branch, Relative, unconditional
                    state_c<=sWAIT;
                    ad_c <="00" & sext(dr(6 DOWNTO 0),13);
                    iar_c<="00" & sext(dr(6 DOWNTO 0),13);
                    IF dr(7)='1' THEN -- INDIRECT
                      ph_c<=phINDIRECT;
                      state_c<=sINDIRECT;
                    ELSE
                      ph_c<=phCODE;
                      state_c<=sWAIT;
                    END IF;
                    
                    -------------------------------
                  WHEN BSTF |  -- Branch to sub on condition True/False Relative
                       BSN  => -- Branch to sub on register non-zero, Relative
                    IF (ri(7 DOWNTO 6)="00" AND cond_v) OR         -- BSTR
                       (ri(7 DOWNTO 6)="10" AND NOT cond_v) OR     -- BSFR
                       (ri(7 DOWNTO 6)="01" AND rs_v/=x"00") THEN  -- BSN
                      pushsub_c<='1';
                      ad_c <=iar + sext(dr(6 DOWNTO 0),15) + 1;
                      iar_c<=iar + sext(dr(6 DOWNTO 0),15) + 1;
                      IF dr(7)='1' THEN -- INDIRECT
                        ph_c<=phINDIRECT;
                        state_c<=sINDIRECT;
                      ELSE
                        ph_c<=phCODE;
                        state_c<=sWAIT;
                      END IF;
                    ELSE
                      state_c<=sWAIT;
                    END IF;
                    
                  WHEN ZBSR => -- Zero Branch to Sub, Relative, unconditional
                    pushsub_c<='1';
                    ad_c <="00" & sext(dr(6 DOWNTO 0),13);
                    iar_c<="00" & sext(dr(6 DOWNTO 0),13);
                    IF dr(7)='1' THEN -- INDIRECT
                      ph_c<=phINDIRECT;
                      state_c<=sINDIRECT;
                    ELSE
                      ph_c<=phCODE;
                      state_c<=sWAIT;
                    END IF;

                  WHEN OTHERS => -- Impossible
                    NULL;
                END CASE;
              WHEN OTHERS => -- Impossible
                NULL;
                
            END CASE;
          END IF;
          
          --------------------------------------
        WHEN sIMM2 =>
          -- Absolute
          iar_c<=iar+1;
          ad_c<=iar+1;
          wr_c<='0';
          dw_c<=rs_v;
          
          CASE dec.ins IS
            -------------------------------
            WHEN ALU =>
              IF rh(7)='1' THEN
                state_c<=sINDIRECT;
                ad_c<=iar(14 DOWNTO 13) & rh(4 DOWNTO 0) & dr;
                ph_c<=phINDIRECT;
              ELSE
                state_c<=sDATA;
                ph_c<=phDATA;
                CASE ru(6 DOWNTO 5) IS
                  WHEN "00"   => -- No index
                    ad_c<=(iar(14 DOWNTO 13) & rh(4 DOWNTO 0) & dr);
                    indexed_c<='0';
                  WHEN "01"   => -- Pre increment indexed
                    rd_v:=rs_v+1;
                    rd_c<=rd_v;
                    rd_maj_c<='1';
                    ad_c<=(iar(14 DOWNTO 13) & rh(4 DOWNTO 0) & dr) + rd_v;
                    indexed_c<='1';
                  WHEN "10"   => -- Pre decrement indexed
                    rd_v:=rs_v-1;
                    rd_c<=rd_v;
                    rd_maj_c<='1';
                    ad_c<=(iar(14 DOWNTO 13) & rh(4 DOWNTO 0) & dr) + rd_v;
                    indexed_c<='1';
                  WHEN OTHERS => -- Indexed
                    rd_v:=rs_v;
                    ad_c<=(iar(14 DOWNTO 13) & rh(4 DOWNTO 0) & dr) + rd_v;
                    indexed_c<='1';
                END CASE;
              END IF;
              
            -------------------------------
            WHEN STR =>
              IF rh(7)='1' THEN
                state_c<=sINDIRECT;
                ad_c<=iar(14 DOWNTO 13) & rh(4 DOWNTO 0) & dr;
                ph_c<=phINDIRECT;
              ELSE
                state_c<=sDATA;
                ph_c<=phDATA;
                -- Positionne bus data
                wr_c<='1';
                CASE ru(6 DOWNTO 5) IS
                  WHEN "00"   => -- No index
                    ad_c<=(iar(14 DOWNTO 13) & rh(4 DOWNTO 0) & dr);
                    dw_c<=rs_v;
                    indexed_c<='0';
                  WHEN "01"   => -- Auto increment indexed
                    rd_v:=rs_v+1;
                    rd_c<=rd_v;
                    rd_maj_c<='1';
                    ad_c<=(iar(14 DOWNTO 13) & rh(4 DOWNTO 0) & dr) + rd_v;
                    dw_c<=r0;
                    IF ri(1 DOWNTO 0)="00" THEN
                      dw_c<=r0+1;
                    END IF;
                    indexed_c<='1';
                  WHEN "10"   => -- Auto decrement indexed
                    rd_v:=rs_v-1;
                    rd_c<=rd_v;
                    rd_maj_c<='1';
                    ad_c<=(iar(14 DOWNTO 13) & rh(4 DOWNTO 0) & dr) + rd_v;
                    dw_c<=r0;
                    IF ri(1 DOWNTO 0)="00" THEN
                      dw_c<=r0-1;
                    END IF;
                    indexed_c<='1';
                  WHEN OTHERS => -- Indexed
                    rd_v:=rs_v;
                    ad_c<=(iar(14 DOWNTO 13) & rh(4 DOWNTO 0) & dr) + rd_v;
                    dw_c<=r0;
                    indexed_c<='1';
                END CASE;
              END IF;
              
            -------------------------------
            WHEN BCTF |  -- Branch on condition True/False, Absolute
                 BRN  |  -- Branch on register non-zero, Absolute
                 BIDR => -- Branch on Inc / Dec Register, Absolute
              IF ri(7 DOWNTO 6)="11" THEN
                IF ri(5)='0' THEN -- BIRR
                  rd_v:=rs_v+1;
                ELSE -- BDRR
                  rd_v:=rs_v-1;
                END IF;
                rd_maj_c<='1';
              END IF;
              rd_c<=rd_v;
              
              IF (ri(7 DOWNTO 6)="00" AND cond_v) OR         -- BCTA
                 (ri(7 DOWNTO 6)="10" AND NOT cond_v) OR     -- BCFA
                 (ri(7 DOWNTO 6)="01" AND rs_v/=x"00") OR    -- BRNA
                 (ri(7 DOWNTO 6)="11" AND rd_v/=x"00") THEN  -- BIDA
                iar_c<=rh(6 DOWNTO 0) & dr;
                ad_c <=rh(6 DOWNTO 0) & dr;
                IF rh(7)='1' THEN -- INDIRECT
                  ph_c <=phINDIRECT;
                  state_c<=sINDIRECT;
                ELSE
                  ph_c <=phCODE;
                  state_c<=sOPCODE;
                END IF;
              ELSE
                iar_c<=iar + 1;
                state_c<=sOPCODE;
              END IF;
              
            WHEN BXA => -- Branch indexed absolute, unconditional
              IF rh(7)='1' THEN -- INDIRECT
                state_c<=sINDIRECT;
                ad_c <=rh(6 DOWNTO 0) & dr;
                ph_c<=phINDIRECT;
              ELSE
                state_c<=sOPCODE;
                iar_c<=(rh(6 DOWNTO 0) & dr) + rs_v; -- RS=R3 : Index
                ad_c <=(rh(6 DOWNTO 0) & dr) + rs_v;
                ph_c<=phCODE;
                state_c<=sOPCODE;
              END IF;
              
            -------------------------------
            WHEN BSTF |  -- Branch to sub on condition True/False absolute
                 BSN  => -- Branch to sub on register non-zero, absolute
              IF (ri(7 DOWNTO 6)="00" AND cond_v) OR         -- BSTA
                 (ri(7 DOWNTO 6)="10" AND NOT cond_v) OR     -- BSFA
                 (ri(7 DOWNTO 6)="01" AND rs_v/=x"00") THEN  -- BSN
                pushsub_c<='1';
                IF rh(7)='1' THEN -- INDIRECT
                  state_c<=sINDIRECT;
                  ad_c<=rh(6 DOWNTO 0) & dr;
                  ph_c<=phINDIRECT;
                ELSE
                  iar_c<=rh(6 DOWNTO 0) & dr;
                  ad_c <=rh(6 DOWNTO 0) & dr;
                  ph_c<=phCODE;
                  state_c<=sOPCODE;
                END IF;
              ELSE
                iar_c<=iar + 1;
                state_c<=sOPCODE;
              END IF;
              
            WHEN BSXA => -- Branch to sub indexed absolute unconditional
              pushsub_c<='1';
              IF rh(7)='1' THEN -- INDIRECT
                state_c<=sINDIRECT;
                ad_c<=rh(6 DOWNTO 0) & dr;
                ph_c<=phINDIRECT; 
              ELSE
                iar_c<=(rh(6 DOWNTO 0) & dr)+rs_v;
                ad_c <=(rh(6 DOWNTO 0) & dr)+rs_v;
                ph_c<=phCODE;
                state_c<=sOPCODE;
              END IF;

            WHEN OTHERS => -- Impossible
              NULL;
          END CASE;
          
          --------------------------------------
          -- DATA READ. Relative or absolute ALU op
        WHEN sDATA =>
          state_c<=sOPCODE;
          ph_c<=phCODE;
          ad_c<=iar;
          wr_c<='0';
          IF dec.ins=ALU THEN
            IF indexed='1' THEN
              -- Indexed: R0 = R0 <alu> [abs+Rn], No index: Rn = Rn <alu> [abs]
              nrd_c<="00";
              rs_v:=r0;
            END IF;
            op_alu(ri,rs_v,dr,psl,rd_v,psl_v);
            rd_maj_c<='1';
            rd_c<=rd_v;
            psl_c<=psl_v;
            
          END IF;
          -- STORE : Nothing to do, just default to fetch address
          
          --------------------------------------
          -- After I/O Access
        WHEN sIO =>
          state_c<=sOPCODE;
          IF ri(7)='0' THEN -- READ IO : REDE,REDD,REDC
            rd_c<=dr;
            rd_maj_c<='1';
            psl_c(7 DOWNTO 6)<=sign(dr);
          END IF;
          
          --------------------------------------
        WHEN sINDIRECT  =>
          state_c<=sINDIRECT2;
          ad_c<=ad_i+1;
          rh_c<=dr;
          
        WHEN sINDIRECT2 =>
          -- Indirect
          ad_c<=iar;
          dw_c<=rs_v;

          IF intp='1' THEN
            state_c<=sOPCODE;
            iar_c<=rh(6 DOWNTO 0) & dr;
            ad_c <=rh(6 DOWNTO 0) & dr;
            ph_c<=phCODE;
          ELSE
            
            CASE dec.ins IS
              -------------------------------
              WHEN ALU | STR =>
                state_c<=sDATA;
                ph_c<=phDATA;
                IF dec.ins=STR THEN
                  wr_c<='1';
                END IF;
                
                CASE ru(6 DOWNTO 5) IS
                  WHEN "00"   => -- No index
                    ad_c<=(rh(6 DOWNTO 0) & dr);
                    dw_c<=rs_v;
                    indexed_c<='0';
                  WHEN "01"   => -- Pre increment indexed
                    rd_v:=rs_v+1;
                    rd_c<=rd_v;
                    rd_maj_c<='1';
                    ad_c<=(rh(6 DOWNTO 0) & dr)+rd_v;
                    dw_c<=r0;
                    indexed_c<='1';
                  WHEN "10"   => -- Pre decrement indexed
                    rd_v:=rs_v-1;
                    rd_c<=rd_v;
                    rd_maj_c<='1';
                    ad_c<=(rh(6 DOWNTO 0) & dr)+rd_v;
                    dw_c<=r0;
                    indexed_c<='1';
                  WHEN OTHERS => -- Indexed
                    rd_v:=rs_v;
                    ad_c<=(rh(6 DOWNTO 0) & dr)+rd_v;
                    dw_c<=r0;
                    indexed_c<='1';
                END CASE;
                
              -------------------------------
              WHEN BCTF |  -- Branch on condition True/False, Absolute
                   BRN  |  -- Branch on register non-zero, Absolute
                   BIDR |  -- Branch on Inc / Dec Register, Absolute
                   BSTF |  -- Branch to sub on condition True/False Relative
                   BSN  => -- Branch to sub on register non-zero, Relative
                state_c<=sOPCODE;
                iar_c<=rh(6 DOWNTO 0) & dr;
                ad_c <=rh(6 DOWNTO 0) & dr;
                ph_c<=phCODE;
                
              WHEN BXA |   -- Branch indexed absolute, unconditional
                   BSXA => -- Branch to sub indexed absolute unconditional
                state_c<=sOPCODE;
                iar_c<=(rh(6 DOWNTO 0) & dr)+rs_v; -- RS=R3 : Index
                ad_c <=(rh(6 DOWNTO 0) & dr)+rs_v;
                ph_c<=phCODE;

              WHEN OTHERS =>
                NULL;
                
            END CASE;
          END IF;
          --------------------------------------
        WHEN sEXE => -- Z & E
          state_c<=sOPCODE;
          
          CASE dec.ins IS
            WHEN ALU  => -- R0=R0 <op> Rn
              nrd_c<="00";
              op_alu(ri,r0,rs_v,psl,rd_v,psl_v);
              rd_maj_c<='1';
              rd_c<=rd_v;
              psl_c<=psl_v;
              
            WHEN STR  => -- Rn=R0
              rd_maj_c<='1';
              rd_c<=r0;
              IF ri(1 DOWNTO 0)/="00" THEN -- NOP : No CC reg update
                psl_c(7 DOWNTO 6)<=sign(r0);
              END IF;
              
            WHEN ROT  => -- Rn = Rotate(Rn)
              op_rotate(ri,rs_v,rd_v,psl,psl_v);
              rd_maj_c<='1';
              rd_c<=rd_v;
              psl_c<=psl_v;
              
            WHEN DAR  =>
              op_dar(rs_v,rd_v,psl,psl_v);
              rd_maj_c<='1';
              rd_c<=rd_v;
              psl_c<=psl_v;
              state_c<=sWAIT;
              
            WHEN RET  => -- Return from Subroutine, Conditional
              IF cond_v THEN
                iar_c<=rras; --ras(to_integer(psu_sp-1));
                ad_c <=rras; --ras(to_integer(psu_sp-1));
                popsub_c<='1';
                IF ri(5)='1' THEN -- RETE
                  psu_ii_c<='0';
                END IF;
              END IF;
              state_c<=sWAIT;
              
            WHEN SPS  => -- Store Program Status Upper / Lower
              nrd_c<="00";
              rd_maj_c<='1';
              rd_v:=mux(ri(0),psl,psu);
              rd_c<=rd_v;
              psl_c(7 DOWNTO 6)<=sign(rd_v);
              
            WHEN LPS  => -- Load Program Status Upper / Lower
              IF ri(0)='1' THEN
                psl_c<=r0;
              ELSE
                psu_c<=r0;
              END IF;
              
            WHEN HALT =>
              state_c<=sHALT;
              
            WHEN OTHERS => -- <ERROR>
              NULL;
              
          END CASE;

        WHEN sWAIT =>
          state_c<=sOPCODE;
          ph_c<=phCODE;
          
          --------------------------------------
        WHEN sINTER =>
          intp_c<='1';
          psu_ii_c<='1';
          pushsub_c<='1';
          ru_c<=x"00";
          iar_c<="00"  & sext(ivec(6 DOWNTO 0),13);
          ad_c <="00"  & sext(ivec(6 DOWNTO 0),13);
          IF ivec(7)='1' THEN -- INDIRECT
            -- <TESTER !>
            iar_c<="00"  & sext(dr(6 DOWNTO 0),13);
            ad_c <="00"  & sext(dr(6 DOWNTO 0),13);
            state_c<=sINDIRECT;
            ph_c<=phINDIRECT;
          ELSE
            ph_c<=phCODE;
            state_c<=sOPCODE;
          END IF;
          -- ZBSR +03
          
          --------------------------------------
        WHEN sHALT =>
          IF int='1' AND psu_ii='0' THEN
            state_c<=sINTER;
          END IF;
          req_c<='0';
          
      END CASE;
      
      ---------------------------------------------
    END IF;
  END PROCESS Comb;
  
  --############################################################################
  reqack<=req_c AND ack;
  
  Sync:PROCESS (clk,reset_na) IS
  BEGIN
    IF reset_na='0' THEN
      iar<="000000000000000";
      psu_sp<="000";
      psu_ii<='0';

--pragma synthesis_off
      r0<=x"00";
      r1<=x"00";
      r2<=x"00";
      r3<=x"00";
      r1b<=x"00";
      r2b<=x"00";
      r3b<=x"00";
--pragma synthesis_on
            
    ELSIF rising_edge(clk) THEN
      
      --------------------------------------------
      state<=state_c;
      
      --------------------------------------------
      IF state=sOPCODE THEN
        ri<=dr;
      END IF;
      
      iar<=iar_c;
      dec<=dec_c;
      rh<=rh_c;
      ru<=ru_c;
      ph<=ph_c;
      
      indexed<=indexed_c;
      intp<=intp_c;
      intack<=to_std_logic(state=sINTER);
      
      ad_i<=ad_c;
      wr_i<=wr_c;
      dw_i<=dw_c;
      ph_i<=ph_c;
      req_i<=req_c;
      
      --------------------------------------------
      IF rd_maj_c='1' THEN
        CASE nrd_c IS
          WHEN "01"   =>
            IF psl_rs='0' THEN r1<=rd_c; ELSE r1b<=rd_c; END IF;
          WHEN "10"   =>
            IF psl_rs='0' THEN r2<=rd_c; ELSE r2b<=rd_c; END IF;
          WHEN "11"   =>
            IF psl_rs='0' THEN r3<=rd_c; ELSE r3b<=rd_c; END IF;
          WHEN OTHERS =>
            r0<=rd_c;
        END CASE;
      END IF;
      
      --------------------------------------------
      psl<=psl_c;
      psu<=psu_c;
      
      ---------------------------------------------
      IF pushsub_c='1' THEN
        psu_sp<=psu(2 DOWNTO 0) + 1;
        ras(to_integer(psu(2 DOWNTO 0)))<=iar + 1;
      END IF;

      rras<=ras(to_integer(psu_sp-1));
      
      IF popsub_c='1' THEN
        psu_sp<=psu(2 DOWNTO 0) - 1;
      END IF;
      
      --------------------------------------------
      psu(7)<=sense;
      
      --------------------------------------------
      IF reset='1' THEN
        ad_i<=(OTHERS =>'0');
        iar<=(OTHERS =>'0');
        psu_ii<='0';
        psu_sp<="000";
        psl_rs<='0';
        psu(4 DOWNTO 3)<="00"; -- User Flags
        state<=sOPCODE;
        psu(6)<='0'; -- FLAG
      END IF;

      IF NOT VER_B THEN -- User Flags fixed to 00
        psu(4 DOWNTO 3)<="00";
      END IF;
      
    END IF;
  END PROCESS Sync;
  
  --############################################################################
  req<=req_c;
  ad <=ad_c;
  dw <=dw_c;
  wr <=wr_c;
  mio<=mio_c;
  dc <=dc_c;
  ene<=ene_c;

  flag<=psu(6);

  xxx_ph<="CODE" WHEN ph_c=phCODE ELSE
          "DATA" WHEN ph_c=phDATA ELSE
          "INDI" WHEN ph_c=phINDIRECT ELSE
          "IO  " WHEN ph_c=phIO   ELSE
           "XXXX";

  xxx_indirect<=to_std_logic(ph_c=phINDIRECT) WHEN rising_edge(clk);
  
  
  --pragma synthesis_off
  --############################################################################
  -- Instruction trace
  Trace:PROCESS IS
    VARIABLE rd_v : std_logic :='0';
    VARIABLE csa ,csb ,csc,cst : string(1 TO 1000) :=(OTHERS =>NUL);
    VARIABLE lout : line;
    VARIABLE admem : uv15;
    VARIABLE phmem : uv2;
    VARIABLE ta,tb : uv8;
    CONSTANT COND : string := "=><*";
    -----------------------------------------------
    PROCEDURE write(cs: INOUT string; s : IN string) IS
      VARIABLE j,k : integer;
    BEGIN
      j:=-1;
      FOR i IN 1 TO cs'length LOOP
        IF cs(i)=nul THEN j:=i; EXIT; END IF;
      END LOOP;
      k:=s'length;
      FOR i IN 1 TO s'length LOOP
        IF s(i)=nul THEN k:=i; EXIT; END IF;
      END LOOP;
      
      IF j>0 THEN
        cs(j TO j+k-1):=s(1 TO k);
      END IF;
    END PROCEDURE write;

    FUNCTION strip(s : IN string) RETURN string IS
    BEGIN
      FOR i IN 1 TO s'length LOOP
        IF s(i)=nul THEN RETURN s(1 TO i-1); END IF;
      END LOOP;
      RETURN s;
    END FUNCTION;
    
    PROCEDURE pad(s : INOUT string; l : natural) IS
      VARIABLE j : integer;
    BEGIN
      j:=-1;
      FOR i IN 1 TO s'length LOOP
        IF s(i)=nul THEN j:=i; EXIT; END IF;
      END LOOP;
      IF j>0 THEN
        s(j TO l):=(OTHERS =>' ');
      END IF;
    END PROCEDURE;
    -----------------------------------------------
    PROCEDURE waitdata IS
    BEGIN
      LOOP
        wure(clk);
        EXIT WHEN reqack='1';
      END LOOP;
      write (csb,to_hstring(dr) & " ");
    END PROCEDURE;

    TYPE arr_string4 IS ARRAY(natural RANGE <>) OF string(1 TO 4);
    CONSTANT ph_txt : arr_string4(0 TO 3):=("CODE","DATA","INDI","IO  ");
    VARIABLE dec_v : type_deco;
    -----------------------------------------------
  BEGIN
    WAIT UNTIL reset_na='1';
    LOOP
      wure(clk);
      --IF rd_v='1' THEN
      --  write(lout," RD("&to_hstring('0' & admem) &")=" & to_hstring(dr));
      --  write(lout," <" & ph_txt(to_integer(phmem)) & ">");
      --  write(lout,"  <" & time'image(now));
      --  writeline(fil,lout);
      --  rd_v:='0';
      --END IF;
      IF reqack='1' AND reset='0' THEN
        IF state=sDATA THEN
          IF wr_i='1' THEN
            write(lout,";WR("&to_hstring('0' & ad_i) &")=" & to_hstring(dw_i));
            write(lout," <" & ph_txt(to_integer(ph_i)) & ">");
            write(lout,"  <" & time'image(now));
            writeline(fil,lout);
          ELSE
            rd_v:='1';
            admem:=ad_i;
            phmem:=ph_i;
            write(lout,";RD("&to_hstring('0' & admem) &")=" & to_hstring(dr));
            write(lout," <" & ph_txt(to_integer(phmem)) & ">");
            write(lout,"  <" & time'image(now));
            writeline(fil,lout);
            rd_v:='0';
          END IF;
          
        ELSIF state=sINDIRECT OR state=sINDIRECT2 THEN
          IF wr_i='1' THEN
            write(lout,";WR("&to_hstring('0' & ad_i) &")=" & to_hstring(dw_i));
            write(lout," <" & ph_txt(to_integer(ph_i)) & ">");
            write(lout,"  <" & time'image(now));
            writeline(fil,lout);
          ELSE
            rd_v:='1';
            admem:=ad_i;
            phmem:=ph_i;
            write(lout,";RD("&to_hstring('0' & admem) &")=" & to_hstring(dr));
            write(lout," <" & ph_txt(to_integer(phmem)) & ">");
            write(lout,"  <" & time'image(now));
            writeline(fil,lout);
            rd_v:='0';
          END IF;
          
        ELSIF state=sOPCODE AND int='1' AND psu_ii='0' THEN
          write(lout,string'("### INT ###"));
          writeline(fil,lout);
          waitdata;
          
        ELSIF state=sOPCODE THEN
          csa:=(OTHERS =>nul);
          csb:=(OTHERS =>nul);
          csc:=(OTHERS =>nul);
          write (csa,to_hstring('0' & iar) & " : ");
          write (csb,to_hstring(dr) & " ");
          dec_v:=opcodes(to_integer(dr));
          write (csc,dec_v.dis);
          -- New instruction;
          CASE dec_v.fmt IS
            WHEN  Z  |     -- 1 Register Zero, register in [1:0]
                  E  =>    -- 1 Misc, implicit
              write(csc,string'(" "));
              
            WHEN  I  |     -- 2 Immediate, register in [1:0]
                  EI =>    -- 2 Immediate, no register
              waitdata;
              write(csc, " #" & to_hstring(dr));

            WHEN  R  |     -- 2 Relative, register in [1:0]
                  ER =>    -- 2 Relative, no register
              waitdata;
              write(csc, " #" & to_hstring(dr));
              IF dr(7)='1' THEN write (csc,string'(" <IND> ")); END IF;
              
            WHEN  A  =>    -- 3 Absolute, non branch, register in [1:0]
              waitdata;
              ta:=dr;
              waitdata;
              tb:=dr;
              write(csc," >");
              IF ta(6 DOWNTO 5)="00" THEN -- Non indexed
                write(csc,to_hstring((ta AND x"1F") & tb));
              ELSIF ta(6 DOWNTO 5)="01" THEN -- Auto increment
                csc:=(OTHERS =>nul);
                write(csc,dec_v.dis(1 TO 5) & "R0 " & " , " &
                      dec_v.dis(6 TO 7) & "+ + " &
                      to_hstring((ta AND x"1F") & tb));
              ELSIF ta(6 DOWNTO 5)="10" THEN -- Auto decrement
                csc:=(OTHERS =>nul);
                write(csc,dec_v.dis(1 TO 5) & "R0 " & " , " &
                      dec_v.dis(6 TO 7) & "- + " &
                      to_hstring((ta AND x"1F") & tb));
              ELSE -- Indexed
                csc:=(OTHERS =>nul);
                write(csc,dec_v.dis(1 TO 5) & "R0 " & " , " &
                      dec_v.dis(6 TO 7) & "  + " &
                      to_hstring((ta AND x"1F") & tb));
              END IF;
              IF ta(7)='1' THEN write (csc,string'(" <IND> ")); END IF;
              
            WHEN  B  |     -- 3 Absolute, branch instruction
                  C  |     -- 3 (LDPL/STPL)
                  EB =>    -- 3 Absolute =>  branch, no register
              waitdata;
              ta:=dr;
              write(csc," >" & to_hstring(dr));
              waitdata;
              write(csc,to_hstring(dr) & ' ');
              IF ta(7)='1' THEN write (csc,string'(" <IND> ")); END IF;
              
          END CASE;
          
          pad(csc,22);
          write(csc," ; PSU=" & to_hstring(psu) & " PSL=" & to_hstring(psl) &
                    " " & COND(to_integer(psl(7 DOWNTO 6))+1) &
                    " | R0=" & to_hstring(r0) & " | " & to_hstring(r1) &
                    "," & to_hstring(r2) & "," & to_hstring(r3) &
                    " | " & to_hstring(r1b) &
                    "," & to_hstring(r2b) & "," & to_hstring(r3b));
          write(csc,"  " & integer'image(ccnt/8/12));
          write(csc,"  " & time'image(now));
          pad(csb,16);
          
          cst:=(OTHERS =>nul);
          write(cst,csa); -- PC :
          write(cst,csb); -- opcodes
          write(cst,csc); -- Disas
          write(lout,strip(cst));
          writeline(fil,lout);
        END IF;
      END IF;
    END LOOP;
  END PROCESS Trace;


  ccnt<=0 WHEN reset_na='0' ELSE ccnt+1 WHEN rising_edge(clk);
  
--pragma synthesis_on
  
  
END ARCHITECTURE rtl;

