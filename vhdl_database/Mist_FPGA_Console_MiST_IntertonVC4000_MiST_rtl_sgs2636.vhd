--------------------------------------------------------------------------------
-- Signetics 2636 PVI Programmable Video Interface
--------------------------------------------------------------------------------
-- DO 5/2018
--------------------------------------------------------------------------------
-- 7xx
-- F00       : Object 1 : Shape 0
-- F01       : Object 1 : Shape 1
-- F02       : Object 1 : Shape 2
-- F03       : Object 1 : Shape 3
-- F04       : Object 1 : Shape 4
-- F05       : Object 1 : Shape 5
-- F06       : Object 1 : Shape 6
-- F07       : Object 1 : Shape 7
-- F08       : Object 1 : Shape 8
-- F09       : Object 1 : Shape 9
-- F0A       : Object 1 : HC  : Horizontal coordinate
-- F0B       : Object 1   HCB : Horizontal coordinate replicate 
-- F0C       : Object 1 : VC  : Vertical   coordinate
-- F0D       : Object 1 : VCB : Vectical   coordinate replicate
-- F0E - F0F : SCRATCH : 2 bytes
-- F10 - F1D : Object 2
-- F1E - F1F : SCRATCH : 2 bytes
-- F20 - F2D : Object 3
-- F2E - F3F : <undef>
-- F40 - F4D : Object 4
-- F4E - F6D : SCRATCH : 32 bytes
-- F6E - F7F : <undef>
-- F80 - FA7 : Background : Vertical bars
-- FA8 - FAC : Background : Horizontal bars
-- FAD       : SCRATCH : 1 byte
-- FAE - FBF : <undef>
-- FC0       : Object sizes
-- FC1       : Object 1 & 2 colours
-- FC2       : Object 3 & 4 colours
-- FC3       : Score format & position
-- FC4 - FC5 : <undef>
-- FC6       : Background colour
-- FC7       : Sound
-- FC8       : Score N1 & N2
-- FC9       : Score N3 & N4
-- FCA       : Collision (read)
-- FCB       : Collision (read)
-- FCC       : POT1
-- FCD       : POT2
-- FCE - FCF : <undef>
-- FD0 - FDF : Mirror FC0 - FCF
-- FE0 - FEF : Mirror FC0 - FCF
-- FFO - FFF : Mirror FC0 - FCF

----------------------------------------------------------------
-- NTSC 60Hz. 480i
-- F = 3.579545MHz = 315 / 88 MHz
-- H=227 clocks
-- V=525/2 lines
--                 21 lines vblank
--              60Hz
-- Line rate 15734 HZ= (3.579545×2/455 MHz = 9/572 MHz)
                                           
--483 lines images + synchro = 525 lines

-- Divide by 262

----------------------------------------------------------------
-- PAL 50Hz. 576i
-- F = 4.43MHz = 4.43361875MHz
-- H= 283.75  clocks

-- 576 lignes image + synchro = 625 lines

-- Divide by 312
----------------------------------------------------------------

-- Horizontal : 32 .. 227
-- Vertical   : 20 .. 252

----------------------------------------------------------------
-- Zone affichage : Blocs 8x20.   16 x 10 blocs = 128 x 200 pixels
-- Zone fond      : H= 32..159  V=20..219
-- Zone affichage : H=  0..     V= 0..251
-- Résolution : 227 x 253

-- Nombres : 12x20 PIX

-- 227 pulses @ 3.58MHz/line

--  0 SET 1
--  1 SET 1
--  2 SET 2 TOP
--  3 SET 2 TOP
--  4 SET 2 TOP
--  5 SET 2 TOP
--  6 SET 2 TOP
--  7 SET 2 TOP
--  8 SET 2 TOP
--  9 SET 2 TOP
-- 10 SET 2 TOP
-- 11 SET 2 BOTTOM
-- 12 SET 2 BOTTOM
-- 13 SET 2 BOTTOM
-- 14 SET 2 BOTTOM
-- 15 SET 2 BOTTOM
-- 16 SET 2 BOTTOM
-- 17 SET 2 BOTTOM
-- 18 SET 2 BOTTOM
-- 19 SET 2 BOTTOM

--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

USE std.textio.ALL;

LIBRARY work;
USE work.base_pack.ALL;

ENTITY sgs2636 IS
  PORT (
    ad   : IN  uv15;      -- Address bus
    
    dw   : IN  uv8;       -- Data write
    dr   : OUT uv8;       -- Data read
    
    req  : IN  std_logic;
    ack  : OUT std_logic;
    wr   : IN  std_logic;
    tick : IN  std_logic;
    
    int    : OUT std_logic;
    intack : IN  std_logic;
    ivec   : OUT uv8;

    vrst      : OUT std_logic;
    vid_argb  : OUT uv4;         -- R | G | B. 1bit/color
    vid_de    : OUT std_logic;
    vid_hsyn  : OUT std_logic;
    vid_vsyn  : OUT std_logic;
    vid_ce    : OUT std_logic;
    
    sound    : OUT uv8;
    icol     : IN  std_logic;
    bright   : IN  std_logic;
    pot1     : IN  uv8;
    pot2     : IN  uv8;
    
    np       : IN  std_logic; -- 0=NTSC 60Hz, 1=PAL 50Hz
    
    reset    : IN  std_logic;
    clk      : IN  std_logic; -- 8x Pixel clock
    reset_na : IN  std_logic
    );
END ENTITY sgs2636;

ARCHITECTURE rtl OF sgs2636 IS
  SUBTYPE uint9 IS natural RANGE 0 TO 511;

  SIGNAL wreq : std_logic;
  SIGNAL mem : arr_uv8(0 TO 255) :=(OTHERS =>x"00");
  ATTRIBUTE ramstyle : string;
  ATTRIBUTE ramstyle OF mem : SIGNAL IS "no_rw_check";

  SIGNAL bgv0_dr,bgv1_dr,bgh_dr : uv8;
  SIGNAL mad,mdr : uv8;
  SIGNAL drreg_sel : std_logic;
  SIGNAL dr_mem,dr_reg : uv8;
  
  SIGNAL osize,ocol12,ocol34,spos,bgcolour,sper : uv8 :=x"00";
  SIGNAL sval12,sval34,bgcoll,ocoll : uv8 :=x"00";
  SIGNAL clr_coll,clr_ocoll : std_logic;
  SIGNAL pre_coll,pre_ocoll : std_logic;
  ALIAS bg_ena  : std_logic IS bgcolour(3); -- Background Enable
  ALIAS bg_colour : uv3 IS bgcolour(6 DOWNTO 4); -- Background colour
  ALIAS sc_colour : uv3 IS bgcolour(2 DOWNTO 0); -- Screen colour
  ALIAS o4_size : uv2 IS osize(7 DOWNTO 6); -- Object 4 size
  ALIAS o3_size : uv2 IS osize(5 DOWNTO 4); -- Object 3 size
  ALIAS o2_size : uv2 IS osize(3 DOWNTO 2); -- Object 2 size
  ALIAS o1_size : uv2 IS osize(1 DOWNTO 0); -- Object 1 size
  ALIAS o1_col  : uv3 IS ocol12(5 DOWNTO 3); -- Object 1 colour
  ALIAS o2_col  : uv3 IS ocol12(2 DOWNTO 0); -- Object 2 colour
  ALIAS o3_col  : uv3 IS ocol34(5 DOWNTO 3); -- Object 3 colour
  ALIAS o4_col  : uv3 IS ocol34(2 DOWNTO 0); -- Object 4 colour
  ALIAS s_pos   : std_logic IS spos(0); -- Score position
  ALIAS s_form  : std_logic IS spos(1); -- Score format
  ALIAS s1_val  : uv4 IS sval12(7 DOWNTO 4); -- Score value 1
  ALIAS s2_val  : uv4 IS sval12(3 DOWNTO 0); -- Score value 2
  ALIAS s3_val  : uv4 IS sval34(7 DOWNTO 4); -- Score value 3
  ALIAS s4_val  : uv4 IS sval34(3 DOWNTO 0); -- Score value 4

  SIGNAL o1_hc,o1_hcb,o1_vc,o1_vcb : uv8 :=x"00";
  SIGNAL o2_hc,o2_hcb,o2_vc,o2_vcb : uv8 :=x"00";
  SIGNAL o3_hc,o3_hcb,o3_vc,o3_vcb : uv8 :=x"00";
  SIGNAL o4_hc,o4_hcb,o4_vc,o4_vcb : uv8 :=x"00";
  SIGNAL o1_vcm,o1_vcbm : uv8 :=x"00";
  SIGNAL o2_vcm,o2_vcbm : uv8 :=x"00";
  SIGNAL o3_vcm,o3_vcbm : uv8 :=x"00";
  SIGNAL o4_vcm,o4_vcbm : uv8 :=x"00";
  SIGNAL o1_hcm,o2_hcm,o3_hcm,o4_hcm : uint9;
  SIGNAL o1_vhit,o2_vhit,o3_vhit,o4_vhit : boolean;
  
  SIGNAL o12_cola,o13_cola,o23_cola,o14_cola,o34_cola,o24_cola : std_logic;
  SIGNAL o1b_cola,o2b_cola,o3b_cola,o4b_cola : std_logic;
  SIGNAL o1_mdr,o2_mdr,o3_mdr,o4_mdr : uv8;
  SIGNAL o1_cplt,o2_cplt,o3_cplt,o4_cplt : std_logic;
  
  SIGNAL o1_diff,o2_diff,o3_diff,o4_diff : uint9 :=0;
  SIGNAL hpos,htotal,hsyncstart,hsyncend,hdispstart : uint9;
  SIGNAL vpos,vtotal,vsyncstart,vsyncend : uint9;
  SIGNAL vbar   : uint5; -- Vertical bar number 0 .. 19
  SIGNAL vpos20 : uint5; -- Line number within bar 0..19
  
  SIGNAL hpulse,sound_i,int_i : std_logic;
  SIGNAL snd_cpt : uv8;
  SIGNAL o1_post ,o2_post ,o3_post ,o4_post  : std_logic;
  SIGNAL vrst_i,vrst_pre,hrst : std_logic;

  SIGNAL cyc : natural RANGE 0 TO 7;
  SIGNAL reqd : std_logic;

  CONSTANT HDELAY : uint8 := 82;
  CONSTANT VDELAY : uint8 := 38;
  
  CONSTANT segments : arr_uv8(0 TO 15):=(
--   abcdefgh
    "11101110",  -- 0
    "00100100",  -- 1
    "10111010",  -- 2
    "10110110",  -- 3
    "01110100",  -- 4
    "11010110",  -- 5
    "11011110",  -- 6
    "10100100",  -- 7
    "11111110",  -- 8
    "11110110",  -- 9
    "00000000",  -- A
    "00000000",  -- B
    "00000000",  -- C
    "00000000",  -- D
    "00000000",  -- E
    "00000000"); -- F

--     0 1 2 3 4 5 6 7 8 9 1011
--     
--  0  ABABA A A A A A A A ACAC
--  1  ABABA A A A A A A A ACAC
--  2  B B                 C C
--  3  B B                 C C
--  4  B B                 C C
--  5  B B                 C C
--  6  B B                 C C
--  7  B B                 C C
--  8  B B                 C C
--  9  BDE D D D D D D D D CDF
-- 10  BDE D D D D D D D D CDF
-- 11  E E                 F F
-- 12  E E                 F F
-- 13  E E                 F F
-- 14  E E                 F F
-- 15  E E                 F F
-- 16  E E                 F F
-- 17  E E                 F F
-- 18  EGEGG G G G G G G G FGFG
-- 19  EGEGG G G G G G G G FGFG

 ------------------------------------------------
  FUNCTION objadrs(
    vpos : uint9; -- Spot vertical   position
    vc   : uv8; -- Vertical   coordinate object
    size : uv2; -- Object size
    base : uv8) RETURN unsigned IS
    VARIABLE a : uint8;
    VARIABLE ivc : natural := to_integer(vc);
  BEGIN
    CASE size IS
      WHEN "00" => -- Scale x1
        a:=(vpos-ivc)  MOD 16;
      WHEN "01" => -- Scale x2
        a:=((vpos-ivc)/2) MOD 16;
      WHEN "10" => -- Scale x4
        a:=((vpos-ivc)/4) MOD 16;
      WHEN OTHERS => -- Scale x8
        a:=((vpos-ivc)/8) MOD 16;
    END CASE;
    RETURN to_unsigned(a,8) + base;
  END FUNCTION;
  
  ------------------------------------------------
  -- Bottom line of objects
  FUNCTION objlast(
    vpos : uint9; -- Spot vertical   position
    vc   : uv8; -- Vertical   coordinate object
    size : uv2) RETURN boolean IS -- Object size
    VARIABLE ivc : uint8 := to_integer(vc);
  BEGIN
    CASE size IS
      WHEN "00" => -- Scale x1
        RETURN vpos>=ivc AND (vpos-ivc)=9;
      WHEN "01" => -- Scale x2
        RETURN vpos>=ivc AND (vpos-ivc)=19;
      WHEN "10" => -- Scale x4
        RETURN vpos>=ivc AND (vpos-ivc)=39;
      WHEN OTHERS => -- Scale x8
        RETURN vpos>=ivc AND (vpos-ivc)=79;
    END CASE;
  END FUNCTION;
  
  ------------------------------------------------
  -- Bit selection in object pattern
  FUNCTION objbit(
    hpos : uint9; -- Spot horizontal position
    hc   : uint9; -- Horizontal coordinate object
    size : uv2) RETURN natural IS -- Object size
    VARIABLE a : uint3;
  BEGIN
    CASE size IS
      WHEN "00" => -- Scale x1
        a:=(hpos-hc) MOD 8;
      WHEN "01" => -- Scale x2
        a:=((hpos-hc)/2) MOD 8;
      WHEN "10" => -- Scale x4
        a:=((hpos-hc)/4) MOD 8;
      WHEN OTHERS => -- Scale x8
        a:=((hpos-hc)/8) MOD 8;
    END CASE;
    RETURN 7-a;
  END FUNCTION;
  
  ------------------------------------------------
  -- Object hit
  FUNCTION objvhit(
    vpos : uint9; -- Spot vertical   position
    vc   : uv8; -- Vertical   coordinate object
    size : uv2) RETURN boolean IS -- Object size
    VARIABLE ivc : uint8 := to_integer(vc);
  BEGIN
    CASE size IS
      WHEN "00" => -- Scale x1
        RETURN vpos>=ivc AND (vpos-ivc)<10;
      WHEN "01" => -- Scale x2
        RETURN vpos>=ivc AND (vpos-ivc)<20;
      WHEN "10" => -- Scale x4
        RETURN vpos>=ivc AND (vpos-ivc)<40;
      WHEN OTHERS => -- Scale x8
        RETURN vpos>=ivc AND (vpos-ivc)<80;
    END CASE;
  END FUNCTION;
  
  FUNCTION objhhit(
    hpos : uint9; -- Spot horizontal position
    hc   : uint9; -- Horizontal coordinate object
    size : uv2) RETURN boolean IS -- Object size
  BEGIN
    CASE size IS
      WHEN "00" => -- Scale x1
        RETURN hpos>=hc AND (hpos-hc)<8;
      WHEN "01" => -- Scale x2
        RETURN hpos>=hc AND (hpos-hc)<16;
      WHEN "10" => -- Scale x4
        RETURN hpos>=hc AND (hpos-hc)<32;
      WHEN OTHERS => -- Scale x8
        RETURN hpos>=hc AND (hpos-hc)<64;
    END CASE;
  END FUNCTION;
  
  ------------------------------------------------
  FUNCTION bgmax(
    dr : uv8; 
    hpos : uint9;
    vpos20 : uint5;
    vbar   : uint5) RETURN boolean IS
    VARIABLE b : uint3;
    VARIABLE a : std_logic;
    VARIABLE r : boolean;
  BEGIN
    b:=(hpos-94+16) MOD 8;
    
    -- 0 : Extend bars of set 1 to 8 clocks
    -- 1 : Extend top 9 lines of set 2 to 8 clocks
    -- 2 : Extend bottom 9 lines of set 2 to 8 clocks
    -- 3 : Extend bars of set 3 to 8 clocks
    -- 4 : Extend top 9 lines of set 4 to 8 clocks
    -- 5 : Extend bottom 9 lines of set 4 to 8 clocks
    -- 7:6 : 00=x1 01=x2 10=x1 11=x4 for non selected lines
    
    IF vbar MOD 4=0 THEN
      a:=dr(0);
    ELSIF vpos20<11 AND vbar MOD 4=1 THEN
      a:=dr(1);
    ELSIF vbar MOD 4=1 THEN
      a:=dr(2);
    ELSIF vbar MOD 4=2 THEN
      a:=dr(3);
    ELSIF vpos20<11 AND vbar MOD 4=3 THEN
      a:=dr(4);
    ELSE
      a:=dr(5);
    END IF;
    
    IF a='1' THEN
      r:=true;
    ELSE
      CASE dr(7 DOWNTO 6) IS
        WHEN "00"   => r:=(b=0); -- 1 pixel
        WHEN "01"   => r:=(b<2); -- 2 pixels
        WHEN "10"   => r:=(b=0); -- 1 pixel
        WHEN OTHERS => r:=(b<4); -- 4 pixels
      END CASE;
    END IF;
    
    RETURN r;
  END FUNCTION;

  ------------------------------------------------
  -- 28 12 4 12 4 12 4 12
  --    ##   ##   ##   ##
  --    28   44   60   76

  -- 28 12 4 12   20   12 4 12
  --    ##   ##        ##   ##
  --    28   44        76   92
  
  FUNCTION score(
    hpos   : uint9;
    vpos   : uint9;
    s1_val : uv4;
    s2_val : uv4;
    s3_val : uv4;
    s4_val : uv4;
    s_pos  : std_logic;
    s_form : std_logic) RETURN boolean IS
    VARIABLE d   : natural RANGE 0 TO 3; -- DIGIT
    VARIABLE mask : uv8;
    VARIABLE val : uv4;
    VARIABLE a : boolean;
    VARIABLE h,v : uint8;
    CONSTANT OFF : natural :=106;
  BEGIN
    -- pos : 0= HIGH : 20V...39V 1= LOW = 200v .. 219V
    IF s_pos='0' AND vpos>=20+2 AND vpos<40+2 THEN
      v:=vpos-20-2;
      a:=true;
    ELSIF s_pos='1' AND vpos>=200+2 AND vpos<220+2 THEN
      v:=vpos-200-2;
      a:=true;
    ELSE
      v:=0;
      a:=false;
    END IF;
    
    IF s_form='1' THEN
      IF hpos>=OFF AND hpos<OFF+12 THEN
        d:=0;
        h:=hpos-OFF;
      ELSIF hpos>=OFF+16 AND hpos<OFF+16+12 THEN
        d:=1;
        h:=hpos-OFF-16;
      ELSIF hpos>=OFF+32 AND hpos<OFF+32+12 THEN
        d:=2;
        h:=hpos-OFF-32;
      ELSIF hpos>=OFF+48 AND hpos<OFF+48+12 THEN
        d:=3;
        h:=hpos-OFF-48;
      ELSE
        a:=false;
        d:=0;
        h:=0;
      END IF;
    ELSE
      IF hpos>=OFF AND hpos<OFF+12 THEN
        d:=0;
        h:=hpos-OFF;
      ELSIF hpos>=OFF+16 AND hpos<OFF+16+12 THEN
        d:=1;
        h:=hpos-OFF-16;
      ELSIF hpos>=OFF+48 AND hpos<OFF+48+12 THEN
        d:=2;
        h:=hpos-OFF-48;
      ELSIF hpos>=OFF+64 AND hpos<OFF+64+12 THEN
        d:=3;
        h:=hpos-OFF-64;
      ELSE
        a:=false;
        d:=0;
        h:=0;
      END IF;
    END IF;
    CASE d IS
      WHEN 0 => val:=s1_val;
      WHEN 1 => val:=s2_val;
      WHEN 2 => val:=s3_val;
      WHEN 3 => val:=s4_val;
    END CASE;
    
    mask(7):=to_std_logic(v<2); -- A
    mask(6):=to_std_logic(h<4 AND v<11); -- B
    mask(5):=to_std_logic(h>7 AND v<11); -- C
    mask(4):=to_std_logic(v>8 AND v<11); -- D
    mask(3):=to_std_logic(h<4 AND v>8);  -- E
    mask(2):=to_std_logic(h>7 AND v>8);  -- F
    mask(1):=to_std_logic(v>17); -- G
    mask(0):='0';
    
    IF (mask AND segments(to_integer(val)))=x"00" THEN
      a:=false;
    END IF;
    
    RETURN a;
    
  END FUNCTION;
  
  ------------------------------------------------
  FUNCTION colo(c      : unsigned(2 DOWNTO 0);
                obj    : std_logic;
                icol   : std_logic;
                bright : std_logic) RETURN unsigned IS
  BEGIN
    IF obj='0' AND icol='0' THEN
      RETURN '0' & c;
    ELSIF obj='1' THEN
      RETURN bright & NOT c;
    ELSE
      RETURN '0' & NOT c;
    END IF;
  END FUNCTION;
  
  ------------------------------------------------
  
BEGIN

  wreq<=wr AND req AND tick;
  
  dr<=dr_reg WHEN drreg_sel='1' ELSE dr_mem;
  
  Regs:PROCESS(clk,reset_na) IS
  BEGIN
    IF reset_na='0' THEN
      pre_ocoll<='0';
      pre_coll<='0';
      
      osize   <=x"FF";
      ocol12  <=x"FF";
      ocol34  <=x"FF";
      spos    <=x"FF";
      bgcolour<=x"FF";
      sval12  <=x"FF";
      sval34  <=x"FF";
      
      o1_hc <=x"00";  o1_hcb<=x"00";
      o1_vc <=x"00";  o1_vcb<=x"00";
      o2_hc <=x"00";  o2_hcb<=x"00";
      o2_vc <=x"00";  o2_vcb<=x"00";
      o3_hc <=x"00";  o3_hcb<=x"00";
      o3_vc <=x"00";  o3_vcb<=x"00";
      o4_hc <=x"00";  o4_hcb<=x"00";
      o4_vc <=x"00";  o4_vcb<=x"00";
      
    ELSIF rising_edge(clk) THEN
      --------------------------------------------
      -- RAM
      dr_mem<=mem(to_integer(ad(7 DOWNTO 0)));
      IF wreq='1' THEN
        mem(to_integer(ad(7 DOWNTO 0)))<=dw;
      END IF;

      --------------------------------------------
      drreg_sel<='0';
      
      IF ad(10 DOWNTO 0)>="111" & x"C0" THEN
        drreg_sel<='1';
        CASE ad(3 DOWNTO 0) IS
          WHEN x"0" => dr_reg<=x"00"; IF wreq='1' THEN  osize <=dw; END IF;
          WHEN x"1" => dr_reg<=x"00"; IF wreq='1' THEN  ocol12<=dw; END IF;
          WHEN x"2" => dr_reg<=x"00"; IF wreq='1' THEN  ocol34<=dw; END IF;
          WHEN x"3" => dr_reg<=x"00"; IF wreq='1' THEN  spos  <=dw; END IF;
          WHEN x"4" => dr_reg<=x"00"; -- <undef>
          WHEN x"5" => dr_reg<=x"00"; -- <undef>
          WHEN x"6" => dr_reg<=x"00"; IF wreq='1' THEN bgcolour<=dw; END IF;
          WHEN x"7" => dr_reg<=x"00"; IF wreq='1' THEN sper   <=dw; END IF;
          WHEN x"8" => dr_reg<=x"00"; IF wreq='1' THEN sval12 <=dw; END IF;
          WHEN x"9" => dr_reg<=x"00"; IF wreq='1' THEN sval34 <=dw; END IF;
          WHEN x"A" => dr_reg<=bgcoll;
          WHEN x"B" => dr_reg<=ocoll;
          WHEN x"C" => dr_reg<=pot1;
          WHEN x"D" => dr_reg<=pot2;
          WHEN x"E" => dr_reg<=x"00"; -- <undef>
          WHEN x"F" => dr_reg<=x"00"; -- <undef>
          WHEN OTHERS => NULL;
        END CASE;
        
      ELSE
        IF wreq='1' THEN
          CASE ad(11 DOWNTO 0) IS
            WHEN x"70A" | x"F0A" => o1_hc <=dw;
            WHEN x"70B" | x"F0B" => o1_hcb<=dw;
            WHEN x"70C" | x"F0C" => o1_vc <=dw;
            WHEN x"70D" | x"F0D" => o1_vcb<=dw;
            WHEN x"71A" | x"F1A" => o2_hc <=dw;
            WHEN x"71B" | x"F1B" => o2_hcb<=dw;
            WHEN x"71C" | x"F1C" => o2_vc <=dw;
            WHEN x"71D" | x"F1D" => o2_vcb<=dw;
            WHEN x"72A" | x"F2A" => o3_hc <=dw;
            WHEN x"72B" | x"F2B" => o3_hcb<=dw;
            WHEN x"72C" | x"F2C" => o3_vc <=dw;
            WHEN x"72D" | x"F2D" => o3_vcb<=dw;
            WHEN x"74A" | x"F4A" => o4_hc <=dw;
            WHEN x"74B" | x"F4B" => o4_hcb<=dw;
            WHEN x"74C" | x"F4C" => o4_vc <=dw;
            WHEN x"74D" | x"F4D" => o4_vcb<=dw;
            WHEN OTHERS => NULL;
          END CASE;
        END IF;
      END IF;
      
      --------------------------------------------
      -- Clear collisions after register read
      bgcoll<=bgcoll OR (o1b_cola & o2b_cola & o3b_cola & o4b_cola &
                          o1_cplt & o2_cplt & o3_cplt & o4_cplt);
      
      IF (ad(11 DOWNTO 0)=x"FCA" OR ad(11 DOWNTO 0)=x"7CA") AND req='1' AND
        tick='1' THEN
        pre_coll<='1';
      END IF;
      
      clr_coll<='0';
      IF (ad(11 DOWNTO 0)/=x"FCA" AND ad(11 DOWNTO 0)/=x"7CA") AND pre_coll='1' THEN
        clr_coll<='1';
        pre_coll<='0';
      END IF;
      
      IF clr_coll='1' OR (vrst_pre='1' AND vrst_i='0') THEN
        bgcoll<=x"00";
      END IF;
      
      --------------------------------------------
      ocoll<=ocoll OR ("00" & o12_cola & o13_cola &
                       o14_cola & o23_cola & o24_cola & o34_cola);
      ocoll(6)<=ocoll(6) OR (vrst_i AND NOT vrst_pre);
      
      IF (ad(11 DOWNTO 0)=x"FCB" OR ad(11 DOWNTO 0)=x"7CB") AND req='1' AND
        tick='1' THEN
        pre_ocoll<='1';
      END IF;
      
      clr_ocoll<='0';
      IF (ad(11 DOWNTO 0)/=x"FCB" AND ad(11 DOWNTO 0)/=x"7CB") AND pre_ocoll='1' THEN
        clr_ocoll<='1';
        pre_ocoll<='0';
      END IF;

      IF clr_ocoll='1' OR (vrst_pre='1' AND vrst_i='0') THEN
        ocoll<=x"00";
      END IF;
      --ocoll(6)<=vrst_i;
      
      --------------------------------------------
    END IF;
    
  END PROCESS Regs;
  
  ------------------------------------------------------------------------------
  Madar:PROCESS(clk) IS
  BEGIN
    IF rising_edge(clk) THEN
      mdr<=mem(to_integer(mad));
    END IF;
  END PROCESS Madar;
  
  ------------------------------------------------------------------------------
  Vid:PROCESS (clk,reset_na) IS
    VARIABLE b,h : boolean;
    VARIABLE i : natural RANGE 0 TO 7;
    VARIABLE hpix_v : uint9;
    VARIABLE o1_hit_v,o2_hit_v,o3_hit_v,o4_hit_v,bg_hit_v : std_logic;
    VARIABLE col_v,cob_v : uv4;
  BEGIN
    IF reset_na='0' THEN
      int_i<='0';
      o1_cplt<='0';
      o2_cplt<='0';
      o3_cplt<='0';
      o4_cplt<='0';
    ELSIF rising_edge(clk) THEN
      --------------------------------------------
      -- VRST  : 1 ... 43
      -- VSYNC : 12 ... 14
      -- TOTAL : 312
      
      -- HTOTAL            = 227 cycles
      -- HRST              = cycles 6 à 48 inclus
      -- HS                = cycles 11 à 27 inclus
      -- Position 0 objets = cycle 39+6 = 45
      -- Wait states       = cycles 6 à 48 inclus
      
      -- (Si front montant HRST cycle 0, si position objet HC=0,
      -- l’objet commence à partir de 0x27=39)
      
      --si VCPT=0x22 avec VRST actif jusqu'à 0x1F => position objet VC=0
      --Si HCPT=0x39 => position objet HC=0

      -- Suppression CYC :
      -- - Empile 4 objets + fond + score en 1 cycle
      -- - Pendant les 40 cycles de blanking, traite séquentiellement
      --   lecture objets, début/fin de ligne
      
      --------------------------------------------
      -- Collisions pulses
      o1_cplt<='0';
      o2_cplt<='0';
      o3_cplt<='0';
      o4_cplt<='0';
      hpulse<='0';
      o1_hit_v:='0';
      o2_hit_v:='0';
      o3_hit_v:='0';
      o4_hit_v:='0';
      bg_hit_v:='0';
      
      hpix_v:=((hpos-78) MOD 128)/8;
      --------------------------------------------
      cyc<=(cyc+1) MOD 8;
      
      -- EE
      IF cyc=0 THEN

        IF hpos<htotal-1 THEN
          hpos<=hpos+1;
        ELSE
          hpos<=0;
          hpulse<='1';
          IF vpos<vtotal-1 THEN
            vpos<=vpos+1;
          ELSE
            vpos<=0;  
          END IF;
          IF vpos<22 THEN
            --valt<='0';
            vpos20<=0;
            vbar<=0;
          ELSE
            IF vpos20<19 THEN
              vpos20<=vpos20+1;
            ELSE
              vpos20<=0;
            END IF;
            IF vpos20=1 OR vpos20=19 THEN
              vbar<=vbar+1;
            END IF;
          END IF;
          
        END IF;
        
        CASE hpos IS
          
          WHEN 2 => --

          WHEN 4 => -- Vertical background : Set address
            mad<=to_unsigned(vbar * 2,8) + x"80";
            
          WHEN 6 => -- Vertical background : Read content
            bgv0_dr<=mdr;
            
          WHEN 8 => -- Vertical background : Set address
            mad<=to_unsigned(vbar * 2,8) + x"81";
            
          WHEN 10 => -- Vertical background : Read content
            bgv1_dr<=mdr;
            
          WHEN 12 => -- Horizontal background : Set address
            mad<=to_unsigned(vbar / 4,8) + x"A8";

          WHEN 14 => -- Horizontal background : Read content
            bgh_dr<=mdr;
            
          WHEN 16 => -- Object 1 : Set address
            IF o1_post='0' THEN
              mad<=objadrs(vpos,o1_vcm+2,o1_size,x"00");
            ELSE
              mad<=objadrs(o1_diff,o1_vcbm,o1_size,x"00");
            END IF;
            
          WHEN 18 => -- Object 1 : Read
            o1_mdr<=mdr;
            o1_diff<=o1_diff+1;
            IF o1_post='0' THEN
              o1_vhit<=objvhit(vpos,o1_vcm+2,o1_size);
              IF objlast(vpos,o1_vcm+2,o1_size) THEN
                o1_post<='1';
                o1_cplt<='1';
                o1_diff<=0;
                o1_vcbm<=o1_vcb+1;
              END IF;
              o1_hcm<=to_integer(o1_hc) + 47;
            ELSE
              o1_vhit<=objvhit(o1_diff,o1_vcbm,o1_size);
              IF objlast(o1_diff,o1_vcbm,o1_size) THEN
                o1_cplt<='1';
                o1_diff<=0;
                o1_vcbm<=o1_vcb+1;
              END IF;
              o1_hcm<=to_integer(o1_hcb) + 47;
            END IF;
            
          WHEN 24 => -- Object 2 : Set address
            IF o2_post='0' THEN
              mad<=objadrs(vpos,o2_vcm+2,o2_size,x"10");
            ELSE
              mad<=objadrs(o2_diff,o2_vcbm,o2_size,x"10");
            END IF;
            
          WHEN 26 => -- Object 2 : Read
            o2_mdr<=mdr;
            o2_diff<=o2_diff+1;
            IF o2_post='0' THEN
              o2_vhit<=objvhit(vpos,o2_vcm+2,o2_size);
              IF objlast(vpos,o2_vcm+2,o2_size) THEN
                o2_post<='1';
                o2_cplt<='1';
                o2_diff<=0;
                o2_vcbm<=o2_vcb+1;
              END IF;
              o2_hcm<=to_integer(o2_hc) + 47;
            ELSE
              o2_vhit<=objvhit(o2_diff,o2_vcbm,o2_size);
              IF objlast(o2_diff,o2_vcbm,o2_size) THEN
                o2_cplt<='1';
                o2_diff<=0;
                o2_vcbm<=o2_vcb+1;
              END IF;
              o2_hcm<=to_integer(o2_hcb) + 47;
            END IF;
            
          WHEN 32 => -- Object 3 : Set address
            IF o3_post='0' THEN
              mad<=objadrs(vpos,o3_vcm+2,o3_size,x"20");
            ELSE
              mad<=objadrs(o3_diff,o3_vcbm,o3_size,x"20");
            END IF;
            
          WHEN 34 => -- Object 3 : Read
            o3_mdr<=mdr;
            o3_diff<=o3_diff+1;
            IF o3_post='0' THEN
              o3_vhit<=objvhit(vpos,o3_vcm+2,o3_size);
              IF objlast(vpos,o3_vcm+2,o3_size) THEN
                o3_post<='1';
                o3_cplt<='1';
                o3_diff<=0;
                o3_vcbm<=o3_vcb+1;
              END IF;
              o3_hcm<=to_integer(o3_hc) + 47;
            ELSE
              o3_vhit<=objvhit(o3_diff,o3_vcbm,o3_size);
              IF objlast(o3_diff,o3_vcbm,o3_size) THEN
                o3_cplt<='1';
                o3_diff<=0;
                o3_vcbm<=o3_vcb+1;
              END IF;
              o3_hcm<=to_integer(o3_hcb) + 47;
            END IF;
            
          WHEN 40 => -- Object 4 : Set address
            IF o4_post='0' THEN
              mad<=objadrs(vpos,o4_vcm+2,o4_size,x"40");
            ELSE
              mad<=objadrs(o4_diff,o4_vcbm,o4_size,x"40");
            END IF;
            
          WHEN 42 => -- Object 4 : Read
            o4_mdr<=mdr;
            o4_diff<=o4_diff+1;
            IF o4_post='0' THEN
              o4_vhit<=objvhit(vpos,o4_vcm+2,o4_size);
              IF objlast(vpos,o4_vcm+2,o4_size) THEN
                o4_post<='1';
                o4_cplt<='1';
                o4_diff<=0;
                o4_vcbm<=o4_vcb+1;
              END IF;
              o4_hcm<=to_integer(o4_hc) + 47;
            ELSE
              o4_vhit<=objvhit(o4_diff,o4_vcbm,o4_size);
              IF objlast(o4_diff,o4_vcbm,o4_size) THEN
                o4_cplt<='1';
                o4_diff<=0;
                o4_vcbm<=o4_vcb+1;
              END IF;
              o4_hcm<=to_integer(o4_hcb) + 47;
            END IF;
            
            IF vrst_i='1' THEN
              o1_post<='0';
              o2_post<='0';
              o3_post<='0';
              o4_post<='0';
              o1_diff<=0;
              o2_diff<=0;
              o3_diff<=0;
              o4_diff<=0;
            END IF;
            IF vpos=0 THEN
              o1_post<='0';
              o2_post<='0';
              o3_post<='0';
              o4_post<='0';
              o1_vcm<=o1_vc+1;
              o2_vcm<=o2_vc+1;
              o3_vcm<=o3_vc+1;
              o4_vcm<=o4_vc+1;
              o1_diff<=0;
              o2_diff<=0;
              o3_diff<=0;
              o4_diff<=0;
            END IF;
            
          WHEN 48 TO 227 =>

            -- Screen colour ---------------------
            col_v:=colo(sc_colour,'0',icol,bright);
            
            -- Background ------------------------
            IF hpix_v<8 THEN
              b:=bgv0_dr(7-(hpix_v MOD 8))='1'; -- Hit Vertical
            ELSE
              b:=bgv1_dr(7-(hpix_v MOD 8))='1'; -- Hit Vertical
            END  IF;
            h:=(hpos>=78) AND (hpos<78+128) AND (vpos>=22) AND (vpos<22+200);
            
            IF h AND b AND bgmax(bgh_dr,hpos,vpos20,vbar) AND bg_ena='1' THEN
              col_v:=colo(bg_colour,'0',icol,bright); -- Background colour
              bg_hit_v:='1';
            END IF;
            
            cob_v:=x"F";
            
            -- Obj 1 -----------------------------
            i:=objbit(hpos,o1_hcm,o1_size);
            IF objhhit(hpos,o1_hcm,o1_size) AND o1_mdr(i)='1' AND o1_vhit THEN
              cob_v:=cob_v AND colo(o1_col,'1',icol,bright);
              o1_hit_v:='1';
            END IF;
            
            -- Obj 2 -----------------------------
            i:=objbit(hpos,o2_hcm,o2_size);
            IF objhhit(hpos,o2_hcm,o2_size) AND o2_mdr(i)='1' AND o2_vhit THEN
              cob_v:=cob_v AND colo(o2_col,'1',icol,bright);
              o2_hit_v:='1';
            END IF;
            
            -- Obj 3 -----------------------------
            i:=objbit(hpos,o3_hcm,o3_size);
            IF objhhit(hpos,o3_hcm,o3_size) AND o3_mdr(i)='1' AND o3_vhit THEN
              cob_v:=cob_v AND colo(o3_col,'1',icol,bright);
              o3_hit_v:='1';
            END IF;
            
            -- Obj 4 -----------------------------
            i:=objbit(hpos,o4_hcm,o4_size);
            IF objhhit(hpos,o4_hcm,o4_size) AND o4_mdr(i)='1' AND o4_vhit THEN
              cob_v:=cob_v AND colo(o4_col,'1',icol,bright);
              o4_hit_v:='1';
            END IF;
            
            IF (o1_hit_v OR o2_hit_v OR o3_hit_v OR o4_hit_v)='1' THEN
              col_v:=cob_v;
            END IF;
            
            -- Score -----------------------------
            IF score(hpos,vpos,s1_val,s2_val,s3_val,s4_val,s_pos,s_form) THEN
              col_v:=colo(bg_colour,'1',icol,bright);
            END IF;
            
            vid_argb<=col_v;
            
            -- Collisions ------------------------
            o12_cola<=o1_hit_v AND o2_hit_v;
            o23_cola<=o2_hit_v AND o3_hit_v;
            o34_cola<=o3_hit_v AND o4_hit_v;
            o13_cola<=o1_hit_v AND o3_hit_v;
            o14_cola<=o1_hit_v AND o4_hit_v;
            o24_cola<=o2_hit_v AND o4_hit_v;
            o1b_cola<=o1_hit_v AND bg_hit_v;
            o2b_cola<=o2_hit_v AND bg_hit_v;
            o3b_cola<=o3_hit_v AND bg_hit_v;
            o4b_cola<=o4_hit_v AND bg_hit_v;

          WHEN OTHERS =>
            NULL;
        END CASE;
        
      END IF;
      
      --------------------------------------------
      hdispstart<=55;
      hsyncstart<=11;
      hsyncend  <=28;
      htotal    <=227;
      
      vsyncstart<=301;
      vsyncend  <=303;
      vtotal    <=312;
      
      vid_de  <=to_std_logic((hpos>=hdispstart) AND
                             vpos<vtotal-43);
      vid_ce  <=to_std_logic(cyc=0);
      vid_hsyn<=to_std_logic(hpos>=hsyncstart AND hpos<hsyncend);
      vid_vsyn<=to_std_logic((vpos=vsyncstart AND hpos>=hsyncstart) OR
                             (vpos>vsyncstart AND vpos<vsyncend) OR
                             (vpos=vsyncend   AND hpos<hsyncstart));
      
      vrst_i  <=to_std_logic(vpos>=vtotal-VDELAY);
      vrst_pre<=vrst_i;
      hrst<=to_std_logic(hpos>=6 AND hpos<=HDELAY);
      
      --------------------------------------------
      int_i<=(int_i OR
              (o1_cplt OR o2_cplt OR o3_cplt OR o4_cplt) OR
              (vrst_i AND NOT vrst_pre))
              AND NOT intack AND NOT (NOT vrst_i AND vrst_pre);
    --------------------------------------------
    END IF;
    
  END PROCESS Vid;

  vrst<=vrst_i;
  
  ------------------------------------------------------------------------------
  Sono:PROCESS(clk) IS
  BEGIN
    IF rising_edge(clk) THEN
      IF hpulse='1' THEN
        IF snd_cpt<sper THEN
          snd_cpt<=snd_cpt+1;
        ELSE
          snd_cpt<=x"00";
          sound_i<=NOT sound_i;
        END IF;
      END IF;
      
      IF sper=x"00" THEN
        sound_i<='0';
      END IF;

      IF tick='1' THEN
        reqd<=req;
      END IF;

    END IF;
  END PROCESS Sono;
  
  sound<=x"7F" WHEN sound_i='0' ELSE x"80";
  
  ack<=to_std_logic(hrst='0' OR vrst_i='1') AND reqd AND req;
  int<=int_i;
  ivec<=x"03";
  
END ARCHITECTURE rtl;
