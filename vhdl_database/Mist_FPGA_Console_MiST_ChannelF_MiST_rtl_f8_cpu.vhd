--------------------------------------------------------------------------------
-- Fairchild F8 F3850 CPU
--------------------------------------------------------------------------------
-- DO 8/2020
--------------------------------------------------------------------------------
-- With help from MAME F8 model

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

USE std.textio.ALL;

LIBRARY work;
USE work.base_pack.ALL;
USE work.f8_pack.ALL;

ENTITY f8_cpu IS
  PORT (
    dr     : IN  uv8; -- Data Read
    dw     : OUT uv8; -- Data Write / Address
    dv     : OUT std_logic;

    romc   : OUT uv5;
    tick   : OUT std_logic;  -- 1/4 or 1/6 cycle lenght
    phase  : OUT uint4;

    po_a   : OUT uv8;
    pi_a   : IN  uv8;
    po_b   : OUT uv8;
    pi_b   : IN  uv8;

    clk      : IN std_logic;
    ce       : IN std_logic;
    reset_na : IN std_logic;
    acco     : OUT uv8;
    visaro   : OUT uv6;
    iozcso   : OUT uv5
    );
END ENTITY;

ARCHITECTURE rtl OF f8_cpu IS

  SIGNAL phase_l : uint4;

  SIGNAL madrs : uint11; -- 256 * 8 = 2048 microcode entries
  SIGNAL opcode : uv8;
  SIGNAL mop : type_microcode;
  SIGNAL acc : uv8;
  SIGNAL visar : uv6;
  ALIAS visarl : uv3 IS visar(2 DOWNTO 0);

  SIGNAL rs,rd : uint6;
  SIGNAL scratch_regs : arr_uv8(0 TO 63); -- Scratch regs
  SIGNAL sreg_ra,sreg_wa : uint6;
  SIGNAL sreg_rd,sreg_wd : uv8;
  SIGNAL sreg_wr : std_logic;

  SIGNAL iozcs : uv5;

  SIGNAL op : enum_op;

  SIGNAL poa_l,pob_l : uv8;
  SIGNAL alu : uv8;
  SIGNAL test,bcc,testp,bccp,dstm : std_logic;

  SIGNAL txt : string(1 TO 12);

BEGIN

  phase<=phase_l;
  po_a<=poa_l;
  po_b<=pob_l;

  ----------------------------------------------------------
  romc<=ROMC_01 WHEN (bcc='1' AND test='1') OR
         (opcode=x"8F" AND isarl/=7 AND mop.romc=ROMC_03) ELSE
        ROMC_03 WHEN (bcc='1' AND test='0') OR
         (opcode=x"8F" AND isarl=7 AND mop.romc=ROMC_03) ELSE
         mop.romc;

  sreg_ra<=mop.rs WHEN mop.rs<16 ELSE
           mop.rd WHEN mop.rd<16 ELSE
           to_integer(visar);

  sreg_rd<=scratch_regs(sreg_ra) WHEN rising_edge(clk);

  PROCESS(clk) IS
  BEGIN
    IF rising_edge(clk) THEN
      IF sreg_wr='1' THEN
        scratch_regs(sreg_wa)<=sreg_wd;
      END IF;
    END IF;
  END PROCESS;

  ----------------------------------------------------------
  PROCESS(clk,reset_na) IS
    VARIABLE len_v : enum_len;
    VARIABLE rs1_v,rs2_v,rd_v : uv8;
    VARIABLE dstm_v,test_v : std_logic;
    VARIABLE iozcs_v : uv5;
  BEGIN  
    IF rising_edge(clk) THEN
      IF ce='1' THEN
        mop<=MICROCODE(madrs);
        sreg_wr<='0';

        -----------------------------------------
        len_v:=mop.len;
        IF (bcc='1' AND test='1') OR (opcode=x"8F" AND visarl=7) THEN
          len_v:=L;
        ELSIF (bcc='1' AND test='0') OR (opcode=x"8F" AND visarl/=7) THEN
          len_v:=S;
        ELSE
          len_v:=mop.len;
        END IF;

        IF phase_l=7 AND len_v=S THEN
          phase_l<=0;
        ELSIF phase_l=11 AND len_v=L THEN
          phase_l<=0;
        ELSE
          phase_l<=phase_l+1;
        END IF;

        -----------------------------------------
        CASE phase_l IS
          WHEN 0 =>
            test<=testp;
            bcc<=bccp;

          WHEN 1 =>
            NULL;
          WHEN 2 =>
            NULL;  -- <dw :=> <AVOIR>

          WHEN 3 =>
            CASE mop.rd IS
              WHEN RACC => rs1_v:=acc;
              WHEN R0 | R1 | R2 | R3 | R4 | R5 | R6 | R7 |
                   R8 | R9 | R10 | R11 | R12 | R13 | R14 | R15 =>
                rs1_v:=sreg_rd;
              WHEN RISAR | RISARP | RISARM =>
                rs1_v:=sreg_rd;
              WHEN DATA =>
                rs1_v:=dr;
              WHEN OTHERS =>
                rs1_v:=acc;
            END CASE;
            CASE mop.rs IS
              WHEN PORT0 => rs2_v:=pi_a;
              WHEN PORT1 => rs2_v:=pi_b;
              WHEN RACC =>  rs2_v:=acc;
              WHEN R0 | R1 | R2 | R3 | R4 | R5 | R6 | R7 |
                   R8 | R9 | R10 | R11 | R12 | R13 | R14 | R15 =>
                rs2_v:=sreg_rd;
              WHEN RISAR | RISARP | RISARM =>
                rs2_v:=sreg_rd;
              WHEN WREG =>
                rs2_v:="000" & iozcs;
              WHEN ISAR =>
                rs2_v:="00" & visar;
              WHEN DATA =>
                rs2_v:=dr;
              WHEN OTHERS =>
                rs2_v:=acc;
            END CASE;

            aluop(mop.op,opcode,rs1_v,rs2_v,iozcs,rd_v,dstm_v,iozcs_v,test_v);
            dstm<=dstm_v;
            iozcs<=iozcs_v;
            alu<=rd_v;
            testp<=test_v;
            bccp <=to_std_logic(mop.op=OP_TST8 OR mop.op=OP_TST9);

          WHEN 4 =>
            dv<='0';
            IF dstm='1' THEN
              CASE mop.rd IS
                WHEN RACC   => acc<=alu;
                WHEN PORT0  => poa_l<=alu;
                WHEN PORT1  => pob_l<=alu;
                WHEN WREG   => iozcs<=alu(4 DOWNTO 0);
                WHEN ISARU  => visar(5 DOWNTO 3)<=alu(2 DOWNTO 0);
                WHEN ISARL  => visar(2 DOWNTO 0)<=alu(2 DOWNTO 0);
                WHEN ISAR   => visar<=alu(5 DOWNTO 0);
                WHEN R0 | R1 | R2 | R3 | R4 | R5 | R6 | R7 |
                     R8 | R9 | R10 | R11 | R12 | R13 | R14 | R15 =>
                  sreg_wd<=alu;
                  sreg_wa<=mop.rd;
                  sreg_wr<='1';
                WHEN RISAR | RISARP | RISARM =>
                  sreg_wd<=alu;
                  sreg_wa<=to_integer(visar);
                  sreg_wr<='1';
                WHEN DATA =>
                  dw<=alu;
                  dv<='1';
                WHEN OTHERS => NULL;
              END CASE;
            END IF;

          WHEN 5 =>
            IF mop.rs=RISARP OR mop.rd=RISARP THEN
              visar(2 DOWNTO 0)<=visar(2 DOWNTO 0)+1;
            END IF;
            IF mop.rs=RISARM OR mop.rd=RISARM THEN
              visar(2 DOWNTO 0)<=visar(2 DOWNTO 0)-1;
            END IF;

          WHEN 7 =>
            IF len_v=S THEN
              IF mop.romc=ROMC_00 THEN -- IFETCH
                opcode<=dr;
                txt<=OPTXT(to_integer(dr));
                madrs<=to_integer(dr)*8;
              ELSE
                madrs<=madrs+1;
              END IF;
            END IF;

          WHEN 11 =>
            IF len_v=L THEN
              IF mop.romc=ROMC_00 THEN -- IFETCH
                opcode<=dr;
                txt<=OPTXT(to_integer(dr));
                madrs<=to_integer(dr)*8;
              ELSE
                madrs<=madrs+1;
              END IF;
            END IF;

          WHEN OTHERS =>
            NULL;

        END CASE;

        IF reset_na='0' THEN
          opcode<=OP_RESET;
          txt<=OPTXT(to_integer(OP_RESET));
          madrs<=to_integer(OP_RESET)*8;
          phase_l<=0;
          iozcs<="00000";
        END IF;

      END IF;

    END IF;
  END PROCESS;

  acco<=acc;
  visaro<=visar;
  iozcso<=iozcs;

END ARCHITECTURE rtl;