------------------------------------------------------------------------------
--  This file is a part of the GRLIB VHDL IP LIBRARY
--  Copyright (C) 2003 - 2008, Gaisler Research
--  Copyright (C) 2008 - 2014, Aeroflex Gaisler
--  Copyright (C) 2015 - 2017, Cobham Gaisler
--
--  This program is free software; you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation; either version 2 of the License, or
--  (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with this program; if not, write to the Free Software
--  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
-----------------------------------------------------------------------------
-- Entity:      iu3
-- File:        iu3.vhd
-- Author:      Jiri Gaisler, Edvin Catovic, Gaisler Research
-- Modified:    Magnus Hjorth, Cobham Gaisler (LEON-REX extension)
--              Alen Bardizbanyan, Cobham Gaisler (ITRACE filtering extensions)
--              Lucas Castro, IC-Unicamp (Changed processor ISA to RISCV-RV32I)
-- Description: ReonV (before was LEON3) 7-stage RV32I integer pipeline
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library grlib;
use grlib.config_types.all;
use grlib.config.all;

use grlib.stdlib.all;
library techmap;
use techmap.gencomp.all;
library gaisler;
use gaisler.leon3.all;
use gaisler.libiu.all;
use gaisler.libfpu.all;
use gaisler.arith.all;
-- pragma translate_off
use grlib.sparc_disas.all;
-- pragma translate_on

entity iu3 is
  generic (
    nwin     : integer range 2 to 32 := 8;
    isets    : integer range 1 to 4 := 1;
    dsets    : integer range 1 to 4 := 1;
    fpu      : integer range 0 to 15 := 0;
    v8       : integer range 0 to 63 := 0;
    cp, mac  : integer range 0 to 1 := 0;
    dsu      : integer range 0 to 1 := 0;
    nwp      : integer range 0 to 4 := 0;
    pclow    : integer range 0 to 2 := 2;
    notag    : integer range 0 to 1 := 0;
    index    : integer range 0 to 15:= 0;
    lddel    : integer range 1 to 2 := 2;
    irfwt    : integer range 0 to 1 := 0;
    disas    : integer range 0 to 2 := 0;
    tbuf     : integer range 0 to 128 := 0;  -- trace buf size in kB (0 - no trace buffer)
    pwd      : integer range 0 to 2 := 0;   -- power-down
    svt      : integer range 0 to 1 := 0;   -- single-vector trapping
    rstaddr  : integer := 16#00000#;   -- reset vector MSB address
    smp      : integer range 0 to 15 := 0;  -- support SMP systems
    fabtech  : integer range 0 to NTECH := 0;
    clk2x    : integer := 0;
    bp       : integer range 0 to 2 := 1;
    npasi    : integer range 0 to 1 := 0;
    pwrpsr   : integer range 0 to 1  := 0;
    rex      : integer range 0 to 1 := 0;
    altwin   : integer range 0 to 1 := 0;
    rfmemtech: integer range 0 to NTECH := 0;
    irqlat   : integer range 0 to 1 := 0
  );
  port (
    clk   : in  std_ulogic;
    rstn  : in  std_ulogic;
    holdn : in  std_ulogic;
    ici   : out icache_in_type;
    ico   : in  icache_out_type;
    dci   : out dcache_in_type;
    dco   : in  dcache_out_type;
    rfi   : out iregfile_in_type;
    rfo   : in  iregfile_out_type;
    irqi  : in  l3_irq_in_type;
    irqo  : out l3_irq_out_type;
    dbgi  : in  l3_debug_in_type;
    dbgo  : out l3_debug_out_type;
    muli  : out mul32_in_type;
    mulo  : in  mul32_out_type;
    divi  : out div32_in_type;
    divo  : in  div32_out_type;
    fpo   : in  fpc_out_type;
    fpi   : out fpc_in_type;
    cpo   : in  fpc_out_type;
    cpi   : out fpc_in_type;
    tbo   : in  tracebuf_out_type;
    tbi   : out tracebuf_in_type;
    tbo_2p : in  tracebuf_2p_out_type;
    tbi_2p : out tracebuf_2p_in_type;
    sclk   : in  std_ulogic
    );


  attribute sync_set_reset of rstn : signal is "true";
end;

architecture rtl of iu3 is


--------------------------------------------------------------------------------
--                     RISCV OP decoding constants

    subtype r_op_type is std_logic_vector(6 downto 0);

    constant R_LUI       : r_op_type := "0110111";
    constant R_AUIPC     : r_op_type := "0010111";
    constant R_JAL       : r_op_type := "1101111";
    constant R_JALR      : r_op_type := "1100111";
    constant R_BRANCH    : r_op_type := "1100011";
    constant R_LD        : r_op_type := "0000011";
    constant R_ST        : r_op_type := "0100011";
    constant R_IMM       : r_op_type := "0010011";
    constant R_NOIMM     : r_op_type := "0110011";
    constant R_FENCE     : r_op_type := "0001111";
    constant R_CONTROL   : r_op_type := "1110011";

--------------------------------------------------------------------------------
--                     RISCV funct3 decoding constants

    subtype r_funct3_type is std_logic_vector(2 downto 0);
    --Jump register
    constant R_F3_JALR   : r_funct3_type := "000";

    --Branches
    constant R_F3_BEQ    : r_funct3_type := "000";
    constant R_F3_BNE    : r_funct3_type := "001";
    constant R_F3_BLT    : r_funct3_type := "100";
    constant R_F3_BGE    : r_funct3_type := "101";
    constant R_F3_BLTU   : r_funct3_type := "110";
    constant R_F3_BGEU   : r_funct3_type := "111";

    -- Loads
    constant R_F3_LB     : r_funct3_type := "000";
    constant R_F3_LH     : r_funct3_type := "001";
    constant R_F3_LW     : r_funct3_type := "010";
    constant R_F3_LBU    : r_funct3_type := "100";
    constant R_F3_LHU    : r_funct3_type := "101";

    -- Stores
    constant R_F3_SB     : r_funct3_type := "000";
    constant R_F3_SH     : r_funct3_type := "001";
    constant R_F3_SW     : r_funct3_type := "010";

    -- Logic and arith instructions with or without immediate
    constant R_F3_ADD    : r_funct3_type := "000"; --Same to sub
    constant R_F3_SLT    : r_funct3_type := "010";
    constant R_F3_SLTU   : r_funct3_type := "011";
    constant R_F3_XOR    : r_funct3_type := "100";
    constant R_F3_OR     : r_funct3_type := "110";
    constant R_F3_AND    : r_funct3_type := "111";
    constant R_F3_SLL    : r_funct3_type := "001";
    constant R_F3_SRL    : r_funct3_type := "101"; --Same to SRA


--                  RISC-V SPECIAL CONSTANTS (NOT USED YET)

    -- Fence
    constant R_F3_FENCE  : r_funct3_type := "000";
    constant R_F3_FENCEI : r_funct3_type := "001";

    -- Control
    constant R_F3_ECALL  : r_funct3_type := "000"; --Same to EBREAK
    constant R_F3_CSRRW  : r_funct3_type := "001";
    constant R_F3_CSRRS  : r_funct3_type := "010";
    constant R_F3_CSRRC  : r_funct3_type := "100";
    constant R_F3_CSRRWI : r_funct3_type := "101";
    constant R_F3_CSRRSI : r_funct3_type := "110";
    constant R_F3_CSRRCI : r_funct3_type := "111";

    -- RISCV trap type numbers by privileged ISA manual v1.1
    subtype r_exc_type is std_logic_vector(3 downto 0);
    -- AFAULT = access fault
    -- PFAULT = page fault
    constant EXC_UNALIGN_INST      : r_exc_type := "0000";
    constant EXC_AFAULT_INST       : r_exc_type := "0001";
    constant EXC_IINST             : r_exc_type := "0010";
    constant EXC_BREAKPOINT        : r_exc_type := "0011";
    constant EXC_UNALIGN_LD        : r_exc_type := "0100";
    constant EXC_AFAULT_LD         : r_exc_type := "0101";
    constant EXC_UNALIGN_ST        : r_exc_type := "0110";
    constant EXC_AFAULT_ST         : r_exc_type := "0111";
    constant EXC_USER_ECALL        : r_exc_type := "1000";
    constant EXC_SUPERVISOR_ECALL  : r_exc_type := "1001";
    -- 1010 RESERVED
    constant EXC_MACHINE_ECALL     : r_exc_type := "1011";
    constant EXC_PFAULT_INST       : r_exc_type := "1100";
    constant EXC_PFAULT_LD         : r_exc_type := "1101";
    -- 1110 RESERVED
    constant EXC_PFAULT_ST         : r_exc_type := "1111";

--------------------------------------------------------------------------------
--                      END OF RISC-V SPECIFIC CONSTANTS
--------------------------------------------------------------------------------

    -- Used by
    subtype asi_type is std_logic_vector(4 downto 0);

    constant ASI_SYSR    : asi_type := "00010"; -- 0x02
    constant ASI_UINST   : asi_type := "01000"; -- 0x08
    constant ASI_SINST   : asi_type := "01001"; -- 0x09
    constant ASI_UDATA   : asi_type := "01010"; -- 0x0A
    constant ASI_SDATA   : asi_type := "01011"; -- 0x0B
    constant ASI_ITAG    : asi_type := "01100"; -- 0x0C
    constant ASI_IDATA   : asi_type := "01101"; -- 0x0D
    constant ASI_DTAG    : asi_type := "01110"; -- 0x0E
    constant ASI_DDATA   : asi_type := "01111"; -- 0x0F
    constant ASI_IFLUSH  : asi_type := "10000"; -- 0x10
    constant ASI_DFLUSH  : asi_type := "10001"; -- 0x11

    constant ASI_FLUSH_PAGE     : std_logic_vector(4 downto 0) := "10000";  -- 0x10 i/dcache flush page
    constant ASI_FLUSH_CTX      : std_logic_vector(4 downto 0) := "10011";  -- 0x13 i/dcache flush ctx

    constant ASI_DCTX           : std_logic_vector(4 downto 0) := "10100";  -- 0x14 dcache ctx
    constant ASI_ICTX           : std_logic_vector(4 downto 0) := "10101";  -- 0x15 icache ctx
    -- ASIs traditionally used by LEON for SRMMU
    constant ASI_MMUFLUSHPROBE  : std_logic_vector(4 downto 0) := "11000";  -- 0x18 i/dtlb flush/(probe)
    constant ASI_MMUREGS        : std_logic_vector(4 downto 0) := "11001";  -- 0x19 mmu regs access
    constant ASI_MMU_BP         : std_logic_vector(4 downto 0) := "11100";  -- 0x1c mmu Bypass
    constant ASI_MMU_DIAG       : std_logic_vector(4 downto 0) := "11101";  -- 0x1d mmu diagnostic
    constant ASI_MMUSNOOP_DTAG  : std_logic_vector(4 downto 0) := "11110";  -- 0x1e mmusnoop physical dtag
    --constant ASI_MMU_DSU        : std_logic_vector(4 downto 0) := "11111";  -- 0x1f mmu diagnostic
    -- ASIs recommended in V8 specification, appendix I
    constant ASI_MMUFLUSHPROBE_V8 : std_logic_vector(4 downto 0) := "00011";  -- 0x03 i/dtlb flush/(probe)
    constant ASI_MMUREGS_V8       : std_logic_vector(4 downto 0) := "00100";  -- 0x04 mmu regs access
    --constant ASI_MMU_BP_V8        : std_logic_vector(4 downto 0) := "11100";  -- 0x1c mmu Bypass
    --constant ASI_MMU_DIAG_V8      : std_logic_vector(4 downto 0) := "11101";  -- 0x1d mmu diagnostic

    subtype trap_type is std_logic_vector(5 downto 0);

    constant TT_IAEX   : trap_type := "000001";
    constant TT_IINST  : trap_type := "000010";
    constant TT_PRIV   : trap_type := "000011";
    constant TT_FPDIS  : trap_type := "000100";
    constant TT_WINOF  : trap_type := "000101";
    constant TT_WINUF  : trap_type := "000110";
    constant TT_UNALA  : trap_type := "000111";
    constant TT_FPEXC  : trap_type := "001000";
    constant TT_DAEX   : trap_type := "001001";
    constant TT_TAG    : trap_type := "001010";
    constant TT_WATCH  : trap_type := "001011";

    constant TT_DSU    : trap_type := "010000";
    constant TT_PWD    : trap_type := "010001";

    constant TT_RFERR  : trap_type := "100000";
    constant TT_IAERR  : trap_type := "100001";
    constant TT_CPDIS  : trap_type := "100100";
    constant TT_CPEXC  : trap_type := "101000";
    constant TT_DIV    : trap_type := "101010";
    constant TT_DSEX   : trap_type := "101011";
    constant TT_TICC   : trap_type := "111111";


  function get_tbuf(tracebuf_2p: boolean; tbuf: integer) return integer is
  begin
    if (TRACEBUF_2P) then
        return(tbuf-64);
    else
        return(tbuf);
    end if;
  end function get_tbuf;

  constant ISETMSB : integer := log2x(isets)-1;
  constant DSETMSB : integer := log2x(dsets)-1;
  constant RFBITS : integer range 6 to 10 := log2(NWIN+1) + 4;
  constant NWINLOG2   : integer range 1 to 5 := log2(NWIN);
  constant CWPOPT : boolean := (NWIN = (2**NWINLOG2));
  constant CWPMIN : std_logic_vector(NWINLOG2-1 downto 0) := (others => '0');
  constant CWPMAX : std_logic_vector(NWINLOG2-1 downto 0) :=
        conv_std_logic_vector(NWIN-1, NWINLOG2);
  constant CWPGLB : std_logic_vector(NWINLOG2-1 downto 0) :=
        conv_std_logic_vector(NWIN, NWINLOG2);
  constant FPEN   : boolean := (fpu /= 0);
  constant CPEN   : boolean := (cp = 1);
  constant MULEN  : boolean := (v8 /= 0);
  constant MULTYPE: integer := (v8 / 16);
  constant DIVEN  : boolean := (v8 /= 0);
  constant MACEN  : boolean := (mac = 1);
  constant MACPIPE: boolean := (mac = 1) and (v8/2 = 1);
  constant IMPL   : integer := 15;
  constant VER    : integer := 3;
  constant DBGUNIT : boolean := (dsu = 1);
  constant TRACEBUF    : boolean := (tbuf /= 0);
  constant TRACEBUF_2P : boolean := (tbuf > 64);
  constant TBUFBITS : integer := 10 + log2(get_tbuf(TRACEBUF_2P, tbuf)) - 4;
  constant PWRD1  : boolean := false; --(pwd = 1) and not (index /= 0);
  constant PWRD2  : boolean := (pwd /= 0); --(pwd = 2) or (index /= 0);
  constant RS1OPT : boolean := (is_fpga(FABTECH) /= 0);
  constant DYNRST : boolean := (rstaddr = 16#FFFFF#);

  constant CASAEN : boolean := (notag = 0);
  signal BPRED : std_logic;
  signal BLOCKBPMISS: std_logic;
  constant REXPIPE : boolean := (REX=1) and (is_fpga(FABTECH)/=0);
  constant AWPEN : boolean := (altwin /= 0);
  constant RFPART : boolean := (altwin /= 0);

  constant RF_READHOLD : boolean := regfile_3p_infer(rfmemtech)/=0 or syncram_2p_readhold(rfmemtech)/=0;

  subtype word is std_logic_vector(31 downto 0);
  subtype pctype is std_logic_vector(31 downto PCLOW);
  subtype rfatype is std_logic_vector(RFBITS-1 downto 0);
  subtype cwptype is std_logic_vector(NWINLOG2-1 downto 0);
  type icdtype is array (0 to isets-1) of word;
  type dcdtype is array (0 to dsets-1) of word;


  type dc_in_type is record
    signed, enaddr, read, write, lock, dsuen : std_ulogic;
    size : std_logic_vector(1 downto 0);
    asi  : std_logic_vector(7 downto 0);
  end record;

  type pipeline_ctrl_type is record
    pc    : pctype;
    inst  : word;
    cnt   : std_logic_vector(1 downto 0);
    rd    : rfatype;
    tt    : std_logic_vector(5 downto 0);
    trap  : std_ulogic;
    annul : std_ulogic;
    wreg  : std_ulogic;
    wicc  : std_ulogic;
    wy    : std_ulogic;
    ld    : std_ulogic;
    pv    : std_ulogic;
    rett  : std_ulogic;
    itovr : std_ulogic;
  end record;

  type fetch_reg_type is record
    pc     : pctype;
    branch : std_ulogic;
  end record;

  type rex_pipeline_reg_type is record
    opout: std_logic_vector(31 downto 0);
    szout: std_logic_vector(1 downto 0);
    ncntout: std_logic_vector(0 downto 0);
    baddr1: std_ulogic;
    immexp: std_ulogic;
    immval: std_logic_vector(31 downto 13);
    getpc: std_ulogic;
    maskpv: std_ulogic;
    illinst: std_ulogic;
    nostep: std_ulogic;
    itovr: std_ulogic;
    leave: std_ulogic;
  end record;

  type decode_reg_type is record
    pc    : pctype;
    inst  : icdtype;
    cwp   : cwptype;
    awp   : cwptype;
    aw    : std_ulogic;
    paw   : std_ulogic;
    stwin : cwptype;
    cwpmax: cwptype;
    set   : std_logic_vector(ISETMSB downto 0);
    mexc  : std_ulogic;
    cnt   : std_logic_vector(1 downto 0);
    pv    : std_ulogic;
    annul : std_ulogic;
    inull : std_ulogic;
    step  : std_ulogic;
    divrdy: std_ulogic;
    pcheld: std_ulogic;
    rexen : std_ulogic;
    rexpos: std_logic_vector(1 downto 0);
    rexbuf: std_logic_vector(31 downto 0);
    rexcnt: std_logic_vector(0 downto 0);
    rexpl : rex_pipeline_reg_type;
    irqstart : std_ulogic;
    irqlatctr : std_logic_vector(11 downto 0);
    irqlatmet : std_ulogic;
  end record;

  type regacc_reg_type is record
    ctrl  : pipeline_ctrl_type;
    rs1   : std_logic_vector(4 downto 0);
    rfa1, rfa2 : rfatype;
    rsel1, rsel2 : std_logic_vector(2 downto 0);
    rfe1, rfe2 : std_ulogic;
    cwp   : cwptype;
    awp   : cwptype;
    aw    : std_ulogic;
    paw   : std_ulogic;
    imm   : word;
    ldcheck1 : std_ulogic;
    ldcheck2 : std_ulogic;
    ldchkra : std_ulogic;
    ldchkex : std_ulogic;
    su : std_ulogic;
    et : std_ulogic;
    wovf : std_ulogic;
    wunf : std_ulogic;
    ticc : std_ulogic;
    jmpl : std_ulogic;
    step  : std_ulogic;
    mulstart : std_ulogic;
    divstart : std_ulogic;
    bp, nobp : std_ulogic;
    bpimiss : std_ulogic;
    getpc : std_ulogic;
    decill: std_ulogic;
  end record;

  type execute_reg_type is record
    ctrl   : pipeline_ctrl_type;
    op1    : word;
    op2    : word;
    aluop  : std_logic_vector(2 downto 0);      -- Alu operation
    alusel : std_logic_vector(1 downto 0);      -- Alu result select
    aluadd : std_ulogic;
    alucin : std_ulogic;
    ldbp1, ldbp2 : std_ulogic;
    invop2 : std_ulogic;
    shcnt  : std_logic_vector(4 downto 0);      -- shift count
    sari   : std_ulogic;                                -- shift msb
    shleft : std_ulogic;                                -- shift left/right
    ymsb   : std_ulogic;                                -- shift left/right
    rd     : std_logic_vector(4 downto 0);
    jmpl   : std_ulogic;
    su     : std_ulogic;
    et     : std_ulogic;
    cwp    : cwptype;
    awp    : cwptype;
    aw     : std_ulogic;
    paw    : std_ulogic;
    icc    : std_logic_vector(3 downto 0);
    mulstep: std_ulogic;
    mul    : std_ulogic;
    mac    : std_ulogic;
    bp     : std_ulogic;
    rfe1, rfe2 : std_ulogic;
    itrhit  : std_ulogic;
  end record;

  type memory_reg_type is record
    ctrl   : pipeline_ctrl_type;
    result : word;
    y      : word;
    icc    : std_logic_vector(3 downto 0);
    nalign : std_ulogic;
    dci    : dc_in_type;
    werr   : std_ulogic;
    wcwp   : std_ulogic;
    wawp   : std_ulogic;
    irqen  : std_ulogic;
    irqen2 : std_ulogic;
    mac    : std_ulogic;
    divz   : std_ulogic;
    su     : std_ulogic;
    mul    : std_ulogic;
    casa   : std_ulogic;
    casaz  : std_ulogic;
    rexalign : std_ulogic;
    rexnalign :std_ulogic;
    itrhit : std_ulogic;

    rs1     : word;         -- Used to pass rs1 to be used in sp_write
  end record;


  type exception_state is (run, trap, dsu1, dsu2);

  type exception_reg_type is record
    ctrl   : pipeline_ctrl_type;
    result : word;
    y      : word;
    icc    : std_logic_vector( 3 downto 0);
    annul_all : std_ulogic;
    data   : dcdtype;
    set    : std_logic_vector(DSETMSB downto 0);
    mexc   : std_ulogic;
    dci    : dc_in_type;
    laddr  : std_logic_vector(1 downto 0);
    rstate : exception_state;
    npc    : std_logic_vector(2 downto 0);
    intack : std_ulogic;
    ipend  : std_ulogic;
    mac    : std_ulogic;
    debug  : std_ulogic;
    nerror : std_ulogic;
    itrhit  : std_ulogic;
    asifilt : std_ulogic;

    rs1     : word;         -- Used to pass rs1 to be used in sp_write
  end record;

  type dsu_registers is record
    tt          : std_logic_vector(7 downto 0);
    err         : std_ulogic;
    tbufcnt     : std_logic_vector(TBUFBITS-1 downto 0);
    asi         : std_logic_vector(7 downto 0);
    crdy        : std_logic_vector(2 downto 1);  -- diag cache access ready
    tfilt       : std_logic_vector(3 downto 0);  -- trace filter
    itfiltmask  : std_logic_vector(7 downto 0);  -- (3 downto 0) -> iTB filter enable
                                                -- (7 downto 4) -> include('0') / exclude('1')
    asifiltmask : std_logic_vector(15 downto 0);  --ASI filer mask
    cfc         : std_logic_vector(4 downto 0);  -- control-flow change
    tlim        : std_logic_vector(2 downto 0);
    tov         : std_ulogic;
    tovb        : std_ulogic;
  end record;

  type irestart_register is record
    addr   : pctype;
    pwd    : std_ulogic;
  end record;


  type pwd_register_type is record
    pwd    : std_ulogic;
    error  : std_ulogic;
  end record;

  type special_register_type is record
    cwp    : cwptype;                                -- current window pointer
    icc    : std_logic_vector(3 downto 0);        -- integer condition codes
    tt     : std_logic_vector(7 downto 0);        -- trap type
    tba    : std_logic_vector(19 downto 0);       -- trap base address
    wim    : std_logic_vector(NWIN-1 downto 0);       -- window invalid mask
    pil    : std_logic_vector(3 downto 0);        -- processor interrupt level
    ec     : std_ulogic;                                  -- enable CP
    ef     : std_ulogic;                                  -- enable FP
    ps     : std_ulogic;                                  -- previous supervisor flag
    s      : std_ulogic;                                  -- supervisor flag
    et     : std_ulogic;                                  -- enable traps
    y      : word;
    asr18  : word;
    svt    : std_ulogic;                                  -- enable traps
    dwt    : std_ulogic;                           -- disable write error trap
    dbp    : std_ulogic;                           -- disable branch prediction
    dbprepl: std_ulogic;                -- Disable speculative Icache miss/replacement

    rexdis : std_ulogic;
    rextrap : std_ulogic;

    aw     : std_ulogic;                -- use alternative window pointer
    paw    : std_ulogic;                -- previous aw (for trap handler)
    awp    : cwptype;                   -- alternative window pointer
    stwin  : cwptype;                   -- starting window
    cwpmax : cwptype;                   -- max cwp value
    ducnt  : std_ulogic;

--------------------------------------------------------------------------------
--                  RISC-V SPECIAL REGISTERS (NOT USED YET)
--------------------------------------------------------------------------------

    -- RISC-V CSRs used by GNU/Linux    -- Encoding
    status   : word;                    -- 0
    epc      : pctype;                  -- 1
    badvaddr : word;                    -- 2
    evec     : word;                    -- 3
    count    : word;                    -- 4
    compare  : word;                    -- 5
    cause    : word;                    -- 6
    ptbr     : word;                    -- 7
    k0       : word;                    -- 12
    k1       : word;                    -- 13
    tosim    : word;                    -- 26
    fromsim  : word;                    -- 27
    tohost   : word;                    -- 30
    fromhost : word;                    -- 31

  end record;

  type write_reg_type is record
    s      : special_register_type;
    result : word;
    wa     : rfatype;
    wreg   : std_ulogic;
    except : std_ulogic;
    twcwp  : cwptype;                   -- trap wrap CWP (for regfile partitioning)
  end record;

  type registers is record
    f  : fetch_reg_type;
    d  : decode_reg_type;
    a  : regacc_reg_type;
    e  : execute_reg_type;
    m  : memory_reg_type;
    x  : exception_reg_type;
    w  : write_reg_type;
  end record;

  type exception_type is record
    pri   : std_ulogic;
    ill   : std_ulogic;
    fpdis : std_ulogic;
    cpdis : std_ulogic;
    wovf  : std_ulogic;
    wunf  : std_ulogic;
    ticc  : std_ulogic;
  end record;

  type watchpoint_register is record
    addr    : std_logic_vector(31 downto 2);  -- watchpoint address
    mask    : std_logic_vector(31 downto 2);  -- watchpoint mask
    exec    : std_ulogic;                           -- trap on instruction
    load    : std_ulogic;                           -- trap on load
    store   : std_ulogic;                           -- trap on store
  end record;

  type watchpoint_registers is array (0 to 3) of watchpoint_register;

  function dbgexc(
    r     : registers; dbgi : l3_debug_in_type;
    trap  : std_ulogic;
    tt    : std_logic_vector(7 downto 0);
    dsur  : dsu_registers) return std_ulogic is
    variable dmode : std_ulogic;
  begin
    dmode := '0';
    if (not r.x.ctrl.annul and trap) = '1' then
      if (((tt = "00" & TT_WATCH) and (dbgi.bwatch = '1')) or
          ((dbgi.bsoft = '1') and (tt = "10000001")) or
          (dbgi.btrapa = '1') or
          ((dbgi.btrape = '1') and not ((tt(5 downto 0) = TT_PRIV) or
            (tt(5 downto 0) = TT_FPDIS) or (tt(5 downto 0) = TT_WINOF) or
            (tt(5 downto 0) = TT_WINUF) or (tt(5 downto 4) = "01") or (tt(7) = '1'))) or
          (((not r.w.s.et) and dbgi.berror) = '1')) then
        dmode := '1';
      end if;
    end if;
    return(dmode);
  end;

  function dbgerr(r : registers; dbgi : l3_debug_in_type;
                  tt : std_logic_vector(7 downto 0))
  return std_ulogic is
    variable err : std_ulogic;
  begin
    err := not r.w.s.et;
    if (((dbgi.dbreak = '1') and (tt = ("00" & TT_WATCH))) or
        ((dbgi.bsoft = '1') and (tt = ("10000001")))) then
      err := '0';
    end if;
    return(err);
  end;


  procedure diagwr(r    : in registers;
                   dsur : in dsu_registers;
                   ir   : in irestart_register;
                   dbg  : in l3_debug_in_type;
                   wpr  : in watchpoint_registers;
                   s    : out special_register_type;
                   vwpr : out watchpoint_registers;
                   asi : out std_logic_vector(7 downto 0);
                   pc, npc  : out pctype;
                   tbufcnt : out std_logic_vector(TBUFBITS-1 downto 0);
                   tfilt : out std_logic_vector(3 downto 0);
                   wr : out std_ulogic;
                   addr : out std_logic_vector(9 downto 0);
                   data : out word;
                   fpcwr : out std_ulogic) is
  variable i : integer range 0 to 3;
  begin
    s := r.w.s; pc := r.f.pc; npc := ir.addr; wr := '0';
    vwpr := wpr; asi := dsur.asi; addr := (others => '0');
    data := dbg.ddata;
    tbufcnt := dsur.tbufcnt; fpcwr := '0'; tfilt := dsur.tfilt;
      if (dbg.dsuen and dbg.denable and dbg.dwrite) = '1' then
        case dbg.daddr(23 downto 20) is
          when "0001" =>
            if (dbg.daddr(16) = '1' and dbg.daddr(2) = '0') and TRACEBUF then
                tbufcnt     := dbg.ddata(TBUFBITS-1 downto 0);
                tfilt       := dbg.ddata(31 downto 28);
            end if;
          when "0011" => -- IU reg file
            if dbg.daddr(12) = '0' then
              wr := '1';
              addr := (others => '0');
              addr(RFBITS-1 downto 0) := dbg.daddr(RFBITS+1 downto 2);
            else  -- FPC
              fpcwr := '1';
            end if;
          when "0100" => -- IU special registers
            case dbg.daddr(7 downto 6) is
              when "00" => -- IU regs Y - TBUF ctrl reg
                case dbg.daddr(5 downto 2) is
                  when "0000" => -- Y
                    s.y := dbg.ddata;
                  when "0001" => -- PSR
                    s.cwp := dbg.ddata(NWINLOG2-1 downto 0);
                    s.icc := dbg.ddata(23 downto 20);
                    s.ec  := dbg.ddata(13);
                    if FPEN then s.ef := dbg.ddata(12); end if;
                    s.pil := dbg.ddata(11 downto 8);
                    s.s   := dbg.ddata(7);
                    s.ps  := dbg.ddata(6);
                    s.et  := dbg.ddata(5);
                    if AWPEN then
                      s.aw := dbg.ddata(15);
                      s.paw := dbg.ddata(14);
                    end if;
                  when "0010" => -- WIM
                    s.wim := dbg.ddata(NWIN-1 downto 0);
                  when "0011" => -- TBR
                    s.tba := dbg.ddata(31 downto 12);
                    s.tt  := dbg.ddata(11 downto 4);
                  when "0100" => -- PC
                    pc := dbg.ddata(31 downto PCLOW);
                  when "0101" => -- NPC
                    npc := dbg.ddata(31 downto PCLOW);
                  when "0110" => --FSR
                    fpcwr := '1';
                  when "0111" => --CFSR
                  when "1001" => -- ASI reg
                    asi := dbg.ddata(7 downto 0);
                  when others =>
                end case;
              when "01" => -- ASR16 - ASR31
                case dbg.daddr(5 downto 2) is
                when "0001" =>  -- %ASR17
                  if bp = 2 then s.dbp := dbg.ddata(27); end if;
                  if bp = 2 then s.dbprepl := dbg.ddata(25); end if;
                  if rex=1 then
                    s.rexdis := dbg.ddata(22);
                    s.rextrap := dbg.ddata(21);
                  end if;
                  s.dwt := dbg.ddata(14);
                  s.svt := dbg.ddata(13);
                when "0010" =>  -- %ASR18
                  if MACEN then s.asr18 := dbg.ddata; end if;
                when "0100" =>  -- %ASR20
                  if AWPEN then
                    s.awp := dbg.ddata(NWINLOG2-1 downto 0);
                  end if;
                  if RFPART then
                    if dbg.ddata(15+NWINLOG2 downto 16) /= CWPMIN then
                      s.stwin := dbg.ddata(20+NWINLOG2 downto 21);
                      s.cwpmax := dbg.ddata(15+NWINLOG2 downto 16);
                    end if;
                  end if;
                when "0110" =>          -- %ASR22
                  s.ducnt := dbg.ddata(31);
                when "1000" =>          -- %ASR24 - %ASR31
                  vwpr(0).addr    := dbg.ddata(31 downto 2);
                  vwpr(0).exec    := dbg.ddata(0);
                when "1001" =>
                  vwpr(0).mask  := dbg.ddata(31 downto 2);
                  vwpr(0).load  := dbg.ddata(1);
                  vwpr(0).store := dbg.ddata(0);
                when "1010" =>
                  vwpr(1).addr    := dbg.ddata(31 downto 2);
                  vwpr(1).exec    := dbg.ddata(0);
                when "1011" =>
                  vwpr(1).mask := dbg.ddata(31 downto 2);
                  vwpr(1).load := dbg.ddata(1);
                  vwpr(1).store := dbg.ddata(0);
                when "1100" =>
                  vwpr(2).addr    := dbg.ddata(31 downto 2);
                  vwpr(2).exec    := dbg.ddata(0);
                when "1101" =>
                  vwpr(2).mask  := dbg.ddata(31 downto 2);
                  vwpr(2).load  := dbg.ddata(1);
                  vwpr(2).store := dbg.ddata(0);
                when "1110" =>
                  vwpr(3).addr    := dbg.ddata(31 downto 2);
                  vwpr(3).exec    := dbg.ddata(0);
                when "1111" => --
                  vwpr(3).mask  := dbg.ddata(31 downto 2);
                  vwpr(3).load  := dbg.ddata(1);
                  vwpr(3).store := dbg.ddata(0);
                when others => --
                end case;
-- disabled due to bug in XST
--                  i := conv_integer(dbg.daddr(4 downto 3));
--                  if dbg.daddr(2) = '0' then
--                    vwpr(i).addr := dbg.ddata(31 downto 2);
--                    vwpr(i).exec := dbg.ddata(0);
--                  else
--                    vwpr(i).mask := dbg.ddata(31 downto 2);
--                    vwpr(i).load := dbg.ddata(1);
--                    vwpr(i).store := dbg.ddata(0);
--                  end if;
              when others =>
            end case;
          when others =>
        end case;
      end if;
  end;

  function asr17_gen ( r : in registers) return word is
  variable asr17 : word;
  variable fpu2 : integer range 0 to 3;
  begin
    asr17 := zero32;
    asr17(31 downto 28) := conv_std_logic_vector(index, 4);
    if bp = 2 then asr17(27) := r.w.s.dbp; end if;
    if notag = 0 then asr17(26) := '1'; end if; -- CASA and tagged arith
    if bp = 2 then asr17(25) := r.w.s.dbprepl;
    elsif bp = 1 then asr17(25) := '1'; end if;
    if rex=1 then
      asr17(24 downto 23) := "01";
      asr17(22) := r.w.s.rexdis;
      asr17(21) := r.w.s.rextrap;
    else
      asr17(24 downto 23) := "00";
    end if;
    if (clk2x > 8) then
      asr17(16 downto 15) := conv_std_logic_vector(clk2x-8, 2);
      asr17(17) := '1';
    elsif (clk2x > 0) then
      asr17(16 downto 15) := conv_std_logic_vector(clk2x, 2);
    end if;
    asr17(14) := r.w.s.dwt;
    if svt = 1 then asr17(13) := r.w.s.svt; end if;
    if lddel = 2 then asr17(12) := '1'; end if;
    if (fpu > 0) and (fpu < 8) then fpu2 := 1;
    elsif (fpu >= 8) and (fpu < 15) then fpu2 := 3;
    elsif fpu = 15 then fpu2 := 2;
    else fpu2 := 0; end if;
    asr17(11 downto 10) := conv_std_logic_vector(fpu2, 2);
    if mac = 1 then asr17(9) := '1'; end if;
    if v8 /= 0 then asr17(8) := '1'; end if;
    asr17(7 downto 5) := conv_std_logic_vector(nwp, 3);
    asr17(4 downto 0) := conv_std_logic_vector(nwin-1, 5);
    return(asr17);
  end;

  procedure diagread(dbgi   : in l3_debug_in_type;
                     r      : in registers;
                     dsur   : in dsu_registers;
                     ir     : in irestart_register;
                     wpr    : in watchpoint_registers;
                     dco    : in  dcache_out_type;
                     tbufo  : in tracebuf_out_type;
                     tbufo_2p : in tracebuf_2p_out_type;
                     xc_wimmask: in std_logic_vector;
                     data : out word) is
    variable cwp : std_logic_vector(4 downto 0);
    variable rd : std_logic_vector(4 downto 0);
    variable i : integer range 0 to 3;
  begin
    data := (others => '0'); cwp := (others => '0');
    cwp(NWINLOG2-1 downto 0) := r.w.s.cwp;
      case dbgi.daddr(22 downto 20) is
        when "001" => -- trace buffer
          if TRACEBUF then
            if dbgi.daddr(16) = '1' then -- trace buffer control reg
              if dbgi.daddr(2) = '0' then
                data(TBUFBITS-1 downto 0) := dsur.tbufcnt;
                data(31 downto 28) := dsur.tfilt;
              else
                data(23) := dsur.tov;
                data(26 downto 24) := dsur.tlim;
                data(27) := dsur.tovb;
                for i in 1 to NWP loop
                  data(27+i) := dsur.itfiltmask(i-1);
                  data(15+i) := dsur.itfiltmask(3+i);
                end loop;
                data(15 downto 0) := dsur.asifiltmask;
              end if;
            else
              if TRACEBUF_2P then
                case dbgi.daddr(3 downto 2) is
                when "00" => data := tbufo_2p.data(127 downto 96);
                when "01" => data := tbufo_2p.data(95 downto 64);
                when "10" => data := tbufo_2p.data(63 downto 32);
                when others => data := tbufo_2p.data(31 downto 0);
                end case;
              else
                case dbgi.daddr(3 downto 2) is
                when "00" => data := tbufo.data(127 downto 96);
                when "01" => data := tbufo.data(95 downto 64);
                when "10" => data := tbufo.data(63 downto 32);
                when others => data := tbufo.data(31 downto 0);
                end case;
              end if;
            end if;
          end if;
        when "011" => -- IU reg file
          if dbgi.daddr(12) = '0' then
            if dbgi.daddr(11) = '0' then
                data := rfo.data1(31 downto 0);
              else data := rfo.data2(31 downto 0); end if;
          else
              data := fpo.dbg.data;
          end if;
        when "100" => -- IU regs
          case dbgi.daddr(7 downto 6) is
            when "00" => -- IU regs Y - TBUF ctrl reg
              case dbgi.daddr(5 downto 2) is
                when "0000" =>
                  data := r.w.s.y;
                when "0001" =>
                  data := conv_std_logic_vector(IMPL, 4) & conv_std_logic_vector(VER, 4) &
                          r.w.s.icc & "000000" & r.w.s.ec & r.w.s.ef & r.w.s.pil &
                          r.w.s.s & r.w.s.ps & r.w.s.et & cwp;
                  if AWPEN then
                    data(15) := r.w.s.aw;
                    data(14) := r.w.s.paw;
                  end if;
                when "0010" =>
                  data(NWIN-1 downto 0) := r.w.s.wim;
                  if RFPART then data(NWIN-1 downto 0) := r.w.s.wim and not xc_wimmask; end if;
                when "0011" =>
                  data := r.w.s.tba & r.w.s.tt & "0000";
                when "0100" =>
                  data(31 downto PCLOW) := r.f.pc;
                when "0101" =>
                  data(31 downto PCLOW) := ir.addr;
                when "0110" => -- FSR
                  data := fpo.dbg.data;
                when "0111" => -- CPSR
                when "1000" => -- TT reg
                  data(12 downto 4) := dsur.err & dsur.tt;
                when "1001" => -- ASI reg
                  data(7 downto 0) := dsur.asi;
                when others =>
              end case;
            when "01" =>
              if dbgi.daddr(5) = '0' then
                if dbgi.daddr(4 downto 2) = "001" then -- %ASR17
                  data := asr17_gen(r);
                elsif MACEN and  dbgi.daddr(4 downto 2) = "010" then -- %ASR18
                  data := r.w.s.asr18;
                elsif (AWPEN or RFPART) and dbgi.daddr(4 downto 2) = "100" then  -- %ASR20
                  if AWPEN then
                    data(NWINLOG2-1 downto 0) := r.w.s.awp;
                  end if;
                  if RFPART then
                    data(15+NWINLOG2 downto 16) := r.w.s.cwpmax;
                    data(20+NWINLOG2 downto 21) := r.w.s.stwin;
                  end if;
                elsif dbgi.daddr(4 downto 2) = "110" then  -- %ASR22
                  data(31) := r.w.s.ducnt;
                end if;
              else  -- %ASR24 - %ASR31
                i := conv_integer(dbgi.daddr(4 downto 3));                                           --
                if dbgi.daddr(2) = '0' then
                  data(31 downto 2) := wpr(i).addr;
                  data(0) := wpr(i).exec;
                else
                  data(31 downto 2) := wpr(i).mask;
                  data(1) := wpr(i).load;
                  data(0) := wpr(i).store;
                end if;
              end if;
            when others =>
          end case;
        when "111" =>
          data := r.x.data(conv_integer(r.x.set));
        when others =>
      end case;
  end;

  function itfilt (inst : word; asifilt : std_ulogic; filter : std_logic_vector(3 downto 0); trap, cfc : std_logic) return std_ulogic is
    variable tren : std_ulogic;
  begin
      tren := '0';
    return(tren);
  end;

  procedure pccompare (r      : in registers;
                       wpr    : in watchpoint_registers;
                       pccomp : out std_logic_vector(3 downto 0)) is
  begin
    pccomp := (others => '0');

    for i in 1 to NWP loop
      if (((wpr(i-1).addr xor r.a.ctrl.pc(31 downto 2)) and wpr(i-1).mask) = Zero32(31 downto 2)) then
        pccomp(i-1) := '1';
      end if;
    end loop;

  end;

  -- itrace filtering
  function itrhitc(dsur : dsu_registers; pccomp : std_logic_vector(3 downto 0))
    return std_ulogic is
  variable hit          : std_ulogic;
  variable temp_hit_inc_array : std_logic_vector(NWP downto 0);
  variable temp_hit_exc_array : std_logic_vector(NWP downto 0);
  variable temp_hit_array : std_logic_vector(NWP downto 0);
  begin

    temp_hit_inc_array := ( others => '0' );
    temp_hit_exc_array := ( others => '0' );
    temp_hit_array := ( others => '0' );


    for i in 1 to NWP loop
      if (dsur.itfiltmask(i-1) = '1') then
        if (pccomp(i-1) = '1') then
          if (dsur.itfiltmask(3+i)) = '0' then
            temp_hit_inc_array(i) := '1';
          end if;
        else
          if (dsur.itfiltmask(3+i)) = '1' then
            temp_hit_exc_array(i) := '1';
          end if;
        end if;
      else
        --if there is no filter set it should be a hit
        temp_hit_inc_array(i) := '1';
        temp_hit_exc_array(i) := '1';
      end if;
    end loop;

    --combine the filter result
    temp_hit_array(0) := '1';
    for i in 1 to NWP loop
        temp_hit_array(i) := temp_hit_array(i-1) and (temp_hit_inc_array(i) or temp_hit_exc_array(i));
    end loop;

    hit := temp_hit_array(NWP);


    return(hit);
  end;

  procedure itrace(r        : in registers;
                   dsur     : in dsu_registers;
                   vdsu     : in dsu_registers;
                   wpr      : in watchpoint_registers;
                   res      : in word;
                   exc      : in std_ulogic;
                   dbgi     : in l3_debug_in_type;
                   error    : in std_ulogic;
                   trap     : in std_ulogic;
                   tbufcnt  : out std_logic_vector(TBUFBITS-1 downto 0);
                   ov       : out std_ulogic;
                   di       : out tracebuf_in_type;
                   di_2p    : out tracebuf_2p_in_type;
                   ierr     : in std_ulogic;
                   derr     : in std_ulogic
                   ) is
  variable meminst : std_ulogic;
  variable tfen    : std_ulogic;
  variable vdi_2p  : tracebuf_2p_in_type;
  variable vdi     : tracebuf_in_type;
  variable indata  : std_logic_vector(255 downto 0);
  variable write   : std_logic_vector(7 downto 0);
  variable tov     : std_ulogic;
  begin
    vdi_2p := tracebuf_2p_in_type_none;
    vdi    := tracebuf_in_type_none;
    indata := (others => '0');
    write  := (others => '0');
    tbufcnt := vdsu.tbufcnt;
    meminst := r.x.ctrl.inst(31) and r.x.ctrl.inst(30);
    tov    := vdsu.tov;
    if TRACEBUF then
      if dbgi.tenable = '1' then
        if dsur.tbufcnt(TBUFBITS-1 downto TBUFBITS-3) = dsur.tlim(2 downto 0) then
          tov := '1';
        end if;
      end if;
      indata(127) := tov;
      indata(126) := not r.x.ctrl.pv;
      indata(125 downto 96) := dbgi.timer(29 downto 0);
      if REX=1 then
        indata(125) := r.x.ctrl.pc(2-2*REX);
        indata(124) := r.x.ctrl.pc(2-1*REX);
      end if;
      indata(95 downto 64) := res;
      indata(63 downto 34) := r.x.ctrl.pc(31 downto 2);
      indata(33) := trap;
      indata(32) := error;
      indata(31 downto 0) := r.x.ctrl.inst;
      vdi.addr(TBUFBITS-1 downto 0) := dsur.tbufcnt;
      vdi.data := indata;
      if (dbgi.tenable = '0') or (r.x.rstate = dsu2) then
        if ((dbgi.dsuen and dbgi.denable) = '1') and (dbgi.daddr(23 downto 20) & dbgi.daddr(16) = "00010") then
          vdi.enable := '1';
          vdi.addr(TBUFBITS-1 downto 0) := dbgi.daddr(TBUFBITS-1+4 downto 4);
          vdi_2p.renable := '1';
          vdi_2p.raddr(TBUFBITS-1 downto 0) := dbgi.daddr(TBUFBITS-1+4 downto 4);
          if dbgi.dwrite = '1' then
            case dbgi.daddr(3 downto 2) is
              when "00" => write(3) := '1';
              when "01" => write(2) := '1';
              when "10" => write(1) := '1';
              when others => write(0) := '1';
            end case;
            indata(127 downto 0) := dbgi.ddata & dbgi.ddata & dbgi.ddata & dbgi.ddata;
            vdi.write   := write;
            vdi.data    := indata;
            vdi_2p.renable  := '0';
            vdi_2p.write    := write;
            vdi_2p.waddr(TBUFBITS-1 downto 0) := dbgi.daddr(TBUFBITS-1+4 downto 4);
            vdi_2p.data     := indata;
          end if;
        end if;
      elsif (not r.x.ctrl.annul and (r.x.ctrl.pv or meminst or r.x.ctrl.itovr) and not r.x.debug and
              itfilt(r.x.ctrl.inst,r.x.asifilt, dsur.tfilt, trap, dsur.cfc(4)) and r.x.itrhit) = '1' then
        vdi.enable      := holdn;
        vdi.write       := (others => '1');
        vdi_2p.write    := (others => '1');
        vdi_2p.waddr(TBUFBITS-1 downto 0) := dsur.tbufcnt;
        vdi_2p.data     := indata;
        tbufcnt := dsur.tbufcnt + 1;
      end if;
      if TRACEBUF_2P and ((dbgi.dsuen and dbgi.denable) = '1') and (dbgi.daddr(23 downto 20) & dbgi.daddr(16) = "00010") then
        vdi_2p.renable := '1';
        vdi_2p.raddr(TBUFBITS-1 downto 0) := dbgi.daddr(TBUFBITS-1+4 downto 4);
      end if;
    end if;
    ov    := tov;
    di    := vdi;
    di_2p := vdi_2p;
  end;

  procedure dbg_cache(holdn    : in std_ulogic;
                      dbgi     :  in l3_debug_in_type;
                      r        : in registers;
                      dsur     : in dsu_registers;
                      mresult  : in word;
                      dci      : in dc_in_type;
                      mresult2 : out word;
                      dci2     : out dc_in_type
                      ) is
  begin
    mresult2 := mresult; dci2 := dci; dci2.dsuen := '0';
    if DBGUNIT then
      if (r.x.rstate = dsu2)
      then
        dci2.asi := dsur.asi;
        if (dbgi.daddr(22 downto 20) = "111") and (dbgi.dsuen = '1') then
          dci2.dsuen := (dbgi.denable or r.m.dci.dsuen) and not dsur.crdy(2);
          dci2.enaddr := dbgi.denable;
          dci2.size := "10"; dci2.read := '1'; dci2.write := '0';
          if (dbgi.denable and not r.m.dci.enaddr) = '1' then
            mresult2 := (others => '0'); mresult2(19 downto 2) := dbgi.daddr(19 downto 2);
          else
            mresult2 := dbgi.ddata;
          end if;
          if dbgi.dwrite = '1' then
            dci2.read := '0'; dci2.write := '1';
          end if;
        end if;
      end if;
    end if;
  end;

  procedure fpexack(r : in registers; fpexc : out std_ulogic) is
  begin
    fpexc := '0';
    -- if FPEN then
    --   if r.x.ctrl.tt = TT_FPEXC then fpexc := '1'; end if;
    -- end if;
  end;

  procedure diagrdy(denable : in std_ulogic;
                    dsur : in dsu_registers;
                    dci   : in dc_in_type;
                    mds : in std_ulogic;
                    ico : in icache_out_type;
                    crdy : out std_logic_vector(2 downto 1)) is
  begin
    crdy := dsur.crdy(1) & '0';
    if dci.dsuen = '1' then
      case dsur.asi(4 downto 0) is
        when ASI_ITAG | ASI_IDATA | ASI_UINST | ASI_SINST =>
          crdy(2) := ico.diagrdy and not dsur.crdy(2);
        when ASI_DTAG | ASI_MMUSNOOP_DTAG | ASI_DDATA | ASI_UDATA | ASI_SDATA =>
          crdy(1) := not denable and dci.enaddr and not dsur.crdy(1);
        when others =>
          crdy(2) := dci.enaddr and denable;
      end case;
    end if;
  end;


  constant RESET_ALL : boolean := GRLIB_CONFIG_ARRAY(grlib_sync_reset_enable_all) = 1;
  constant dc_in_res : dc_in_type := (
    signed => '0',
    enaddr => '0',
    read   => '0',
    write  => '0',
    lock   => '0',
    dsuen  => '0',
    size   => (others => '0'),
    asi    => (others => '0'));
  constant pipeline_ctrl_res :  pipeline_ctrl_type := (
    pc    => (others => '0'),
    inst  => (others => '0'),
    cnt   => (others => '0'),
    rd    => (others => '0'),
    tt    => (others => '0'),
    trap  => '0',
    annul => '1',
    wreg  => '0',
    wicc  => '0',
    wy    => '0',
    ld    => '0',
    pv    => '0',
    rett  => '0',
    itovr => '0');
  constant fpc_res : pctype := conv_std_logic_vector(rstaddr, 20) & zero32(11 downto PCLOW);

  constant fetch_reg_res : fetch_reg_type := (
    pc     => fpc_res,  -- Needs special handling
    branch => '0'
    );
  constant decode_reg_res : decode_reg_type := (
    pc     => (others => '0'),
    inst   => (others => (others => '0')),
    cwp    => (others => '0'),
    awp    => (others => '0'),
    aw     => '0',
    paw    => '0',
    stwin  => (others => '0'),
    cwpmax => CWPMAX,
    set    => (others => '0'),
    mexc   => '0',
    cnt    => (others => '0'),
    pv     => '0',
    annul  => '1',
    inull  => '0',
    step   => '0',
    divrdy => '0',
    pcheld => '0',
    rexen  => '0',
    rexpos => "10",
    rexbuf => (others => '0'),
    rexcnt => (others => '0'),
    rexpl => ((others => '0'),"00","0",'0','0',(others => '0'),'0','0','0','0','0','0'),
    irqstart => '0',
    irqlatctr => (others => '0'),
    irqlatmet => '0'
    );
  constant regacc_reg_res : regacc_reg_type := (
    ctrl     => pipeline_ctrl_res,
    rs1      => (others => '0'),
    rfa1     => (others => '0'),
    rfa2     => (others => '0'),
    rsel1    => (others => '0'),
    rsel2    => (others => '0'),
    rfe1     => '0',
    rfe2     => '0',
    cwp      => (others => '0'),
    awp      => (others => '0'),
    aw       => '0',
    paw      => '0',
    imm      => (others => '0'),
    ldcheck1 => '0',
    ldcheck2 => '0',
    ldchkra  => '1',
    ldchkex  => '1',
    su       => '1',
    et       => '0',
    wovf     => '0',
    wunf     => '0',
    ticc     => '0',
    jmpl     => '0',
    step     => '0',
    mulstart => '0',
    divstart => '0',
    bp       => '0',
    nobp     => '0',
    bpimiss  => '0',
    getpc    => '0',
    decill   => '0'
    );
  constant execute_reg_res : execute_reg_type := (
    ctrl    =>  pipeline_ctrl_res,
    op1     => (others => '0'),
    op2     => (others => '0'),
    aluop   => (others => '0'),
    alusel  => "11",
    aluadd  => '1',
    alucin  => '0',
    ldbp1   => '0',
    ldbp2   => '0',
    invop2  => '0',
    shcnt   => (others => '0'),
    sari    => '0',
    shleft  => '0',
    ymsb    => '0',
    rd      => (others => '0'),
    jmpl    => '0',
    su      => '0',
    et      => '0',
    cwp     => (others => '0'),
    awp      => (others => '0'),
    aw       => '0',
    paw      => '0',
    icc     => (others => '0'),
    mulstep => '0',
    mul     => '0',
    mac     => '0',
    bp      => '0',
    rfe1    => '0',
    rfe2    => '0',
    itrhit => '1'
    );
  constant memory_reg_res : memory_reg_type := (
    ctrl   => pipeline_ctrl_res,
    result => (others => '0'),
    y      => (others => '0'),
    icc    => (others => '0'),
    nalign => '0',
    dci    => dc_in_res,
    werr   => '0',
    wcwp   => '0',
    wawp   => '0',
    irqen  => '0',
    irqen2 => '0',
    mac    => '0',
    divz   => '0',
    su     => '0',
    mul    => '0',
    casa   => '0',
    casaz  => '0',
    rexnalign => '0',
    rexalign => '0',
    itrhit => '1',

    rs1 => (others => '0')
    );
  function xnpc_res return std_logic_vector is
  begin
    if v8 /= 0 then return "100"; end if;
    return "011";
  end function xnpc_res;
  constant exception_reg_res : exception_reg_type := (
    ctrl      => pipeline_ctrl_res,
    result    => (others => '0'),
    y         => (others => '0'),
    icc       => (others => '0'),
    annul_all => '1',
    data      => (others => (others => '0')),
    set       => (others => '0'),
    mexc      => '0',
    dci       => dc_in_res,
    laddr     => (others => '0'),
    rstate    => run,                   -- Has special handling
    npc       => xnpc_res,
    intack    => '0',
    ipend     => '0',
    mac       => '0',
    debug     => '0',                   -- Has special handling
    nerror    => '0',
    itrhit    => '1',
    asifilt   => '0',

    rs1 => (others => '0')
    );
  constant DRES : dsu_registers := (
    tt      => (others => '0'),
    err     => '0',
    tbufcnt => (others => '0'),
    asi     => (others => '0'),
    crdy    => (others => '0'),
    tfilt => (others => '0'),
    itfiltmask => (others => '0'),
    --by default track all the ASIs
    asifiltmask => (others => '0'),
    cfc => (others => '0'),
    tlim => (others => '0'),
    tov => '0',
    tovb => '0'
    );
  constant IRES : irestart_register := (
    addr => (others => '0'), pwd => '0'
    );
  constant PRES : pwd_register_type := (
    pwd => '0',                         -- Needs special handling
    error => '0'
    );
  --constant special_register_res : special_register_type := (
  --  cwp    => zero32(NWINLOG2-1 downto 0),
  --  icc    => (others => '0'),
  --  tt     => (others => '0'),
  --  tba    => fpc_res(31 downto 12),
  --  wim    => (others => '0'),
  --  pil    => (others => '0'),
  --  ec     => '0',
  --  ef     => '0',
  --  ps     => '1',
  --  s      => '1',
  --  et     => '0',
  --  y      => (others => '0'),
  --  asr18  => (others => '0'),
  --  svt    => '0',
  --  dwt    => '0',
  --  dbp    => '0'
  --  );
  --XST workaround:
  function special_register_res return special_register_type is
    variable s : special_register_type;
  begin
    s.cwp   := zero32(NWINLOG2-1 downto 0);
    s.icc   := (others => '0');
    s.tt    := (others => '0');
    s.tba   := fpc_res(31 downto 12);
    s.wim   := (others => '0');
    s.pil   := (others => '0');
    s.ec    := '0';
    s.ef    := '0';
    s.ps    := '1';
    s.s     := '1';
    s.et    := '0';
    s.y     := (others => '0');
    s.asr18 := (others => '0');
    s.svt   := '0';
    s.dwt   := '0';
    s.dbp   := '0';
    s.dbprepl := '1';
    s.rexdis :='1';
    s.rextrap:='1';
    s.aw     := '0';
    s.paw    := '0';
    s.awp    := (others => '0');
    s.stwin  := (others => '0');
    s.cwpmax := "000";
    s.ducnt  := '1';
    return s;
  end function special_register_res;
  --constant write_reg_res : write_reg_type := (
  --  s      => special_register_res,
  --  result => (others => '0'),
  --  wa     => (others => '0'),
  --  wreg   => '0',
  --  except => '0'
  --  );
  -- XST workaround:
  function write_reg_res return write_reg_type is
    variable w : write_reg_type;
  begin
    w.s      := special_register_res;
    w.result := (others => '0');
    w.wa     := (others => '0');
    w.wreg   := '0';
    w.except := '0';
    w.twcwp:= (others => '0');
    return w;
  end function write_reg_res;
  constant RRES : registers := (
    f => fetch_reg_res,
    d => decode_reg_res,
    a => regacc_reg_res,
    e => execute_reg_res,
    m => memory_reg_res,
    x => exception_reg_res,
    w => write_reg_res
    );
  constant exception_res : exception_type := (
    pri   => '0',
    ill   => '0',
    fpdis => '0',
    cpdis => '0',
    wovf  => '0',
    wunf  => '0',
    ticc  => '0'
    );
  constant wpr_none : watchpoint_register := (
    addr    => zero32(31 downto 2),
    mask    => zero32(31 downto 2),
    exec    => '0',
    load    => '0',
    store   => '0');

  signal r, rin : registers;
  signal wpr, wprin : watchpoint_registers;
  signal dsur, dsuin : dsu_registers;
  signal ir, irin : irestart_register;
  signal rp, rpin : pwd_register_type;

-- execute stage operations

  constant EXE_AND   : std_logic_vector(2 downto 0) := "000";
  constant EXE_XOR   : std_logic_vector(2 downto 0) := "001"; -- must be equal to EXE_PASS2
  constant EXE_OR    : std_logic_vector(2 downto 0) := "010";
-- Replaced following SPARC instructions with SLT and SLTU
--  constant EXE_XNOR  : std_logic_vector(2 downto 0) := "011";
--  constant EXE_ANDN  : std_logic_vector(2 downto 0) := "100";
  constant EXE_SLTU  : std_logic_vector(2 downto 0) := "011";
  constant EXE_SLT   : std_logic_vector(2 downto 0) := "100";
  constant EXE_ORN   : std_logic_vector(2 downto 0) := "101";
  constant EXE_DIV   : std_logic_vector(2 downto 0) := "110";

  constant EXE_PASS1 : std_logic_vector(2 downto 0) := "000";
  constant EXE_PASS2 : std_logic_vector(2 downto 0) := "001";
  constant EXE_STB   : std_logic_vector(2 downto 0) := "010";
  constant EXE_STH   : std_logic_vector(2 downto 0) := "011";
--  constant EXE_ONES  : std_logic_vector(2 downto 0) := "100"; -- replaced, not used for RV32I
  constant EXE_AUIPC : std_logic_vector(2 downto 0) := "100";
  constant EXE_RDY   : std_logic_vector(2 downto 0) := "101";
  constant EXE_SPR   : std_logic_vector(2 downto 0) := "110";
  constant EXE_LINK  : std_logic_vector(2 downto 0) := "111";

  constant EXE_SLL   : std_logic_vector(2 downto 0) := "001";
  constant EXE_SRL   : std_logic_vector(2 downto 0) := "010";
  constant EXE_SRA   : std_logic_vector(2 downto 0) := "100";

  constant EXE_NOP   : std_logic_vector(2 downto 0) := "000";

-- EXE result select

  constant EXE_RES_ADD   : std_logic_vector(1 downto 0) := "00";
  constant EXE_RES_SHIFT : std_logic_vector(1 downto 0) := "01";
  constant EXE_RES_LOGIC : std_logic_vector(1 downto 0) := "10";
  constant EXE_RES_MISC  : std_logic_vector(1 downto 0) := "11";

-- Load types

  constant SZBYTE    : std_logic_vector(1 downto 0) := "00";
  constant SZHALF    : std_logic_vector(1 downto 0) := "01";
  constant SZWORD    : std_logic_vector(1 downto 0) := "10";
  constant SZDBL     : std_logic_vector(1 downto 0) := "11";

-- branch adder

  function branch_address(inst : word; pc : pctype; de_rexbaddr1, de_rexen: std_logic) return std_logic_vector is
    variable addr, tmp : pctype;
  begin

--------------------------------------------------------------------------------
    --     Calculates RISC-V branch address
    addr(31 downto 12) := (others => inst(31));
    addr(11)           := inst(7);
    addr(10 downto 5)  := inst(30 downto 25);
    --addr(4 downto 1)   := inst(11 downto 8);
    addr(4 downto 2)   := inst(11 downto 9);
    tmp(31 downto 2)  :=  addr(31 downto 2) + pc(31 downto 2) - 2;
    return (tmp);
  end;

-- evaluate branch condition

  function branch_true(cnt : std_logic_vector(1 downto 0); icc : std_logic_vector(3 downto 0); inst : word)
        return std_ulogic is
  variable n, z, v, c, branch : std_ulogic;
  begin
      branch := '0';

       if(inst(6 downto 0) = R_BRANCH and cnt = "11") then
          case inst(14 downto 12) is
              when "000" => branch := icc(2);                   -- beq
              when "001" => branch := not icc(2);               -- bne
              when "100" => branch := icc(3) xor icc(1);        -- blt
              when "101" => branch := not(icc(3) xor icc(1));   -- bge
              when "110" => branch := not icc(0);               -- bltu
              when "111" => branch := icc(0);                   -- bgeu
              when others => null;
          end case;
       end if;
    return(branch);
  end;

-- detect RETT instruction in the pipeline and set the local psr.su and psr.et

  procedure su_et_select(r : in registers; xc_ps, xc_s, xc_et : in std_ulogic;
                       su, et : out std_ulogic) is
  begin
   if ((r.a.ctrl.rett or r.e.ctrl.rett or r.m.ctrl.rett or r.x.ctrl.rett) = '1')
     and (r.x.annul_all = '0')
   then su := xc_ps; et := '1';
   else su := xc_s; et := xc_et; end if;
  end;

-- detect watchpoint trap

  function wphit(r : registers; wpr : watchpoint_registers; debug : l3_debug_in_type;
                 dsur : dsu_registers; pccomp : std_logic_vector(3 downto 0))
    return std_ulogic is
  variable exc : std_ulogic;
  begin
    exc := '0';
    for i in 1 to NWP loop
      if ((wpr(i-1).exec and r.a.ctrl.pv and not r.a.ctrl.annul) = '1') then
         if (pccomp(i-1) = '1') then
           exc := '1';
         end if;
      end if;
    end loop;

   if DBGUNIT then
     if (debug.dsuen and not r.a.ctrl.annul) = '1' then
       exc := exc or (r.a.ctrl.pv and ((((debug.dbreak and debug.bwatch) or r.a.step)) or
                                       (debug.bwatch and dsur.tovb and dsur.tov)));
     end if;
   end if;
    -- Can not handle breaking on RETT
    if r.a.ctrl.rett='1' then exc := '0'; end if;
    return(exc);
  end;



-- 32-bit shifter

  function shift3(r : registers; aluin1, aluin2 : word) return word is
  variable shiftin : unsigned(63 downto 0);
  variable shiftout : unsigned(63 downto 0);
  variable cnt : natural range 0 to 31;
  begin

    cnt := conv_integer(r.e.shcnt);
    if r.e.shleft = '1' then
      shiftin(30 downto 0) := (others => '0');
      shiftin(63 downto 31) := '0' & unsigned(aluin1);
    else
      shiftin(63 downto 32) := (others => r.e.sari);
      shiftin(31 downto 0) := unsigned(aluin1);
    end if;
    shiftout := SHIFT_RIGHT(shiftin, cnt);
    return(std_logic_vector(shiftout(31 downto 0)));

  end;

  function shift2(r : registers; aluin1, aluin2 : word) return word is
  variable ushiftin : unsigned(31 downto 0);
  variable sshiftin : signed(32 downto 0);
  variable cnt : natural range 0 to 31;
  variable resleft, resright : word;
  begin

    cnt := conv_integer(r.e.shcnt);
    ushiftin := unsigned(aluin1);
    sshiftin := signed('0' & aluin1);
    if r.e.shleft = '1' then
      resleft := std_logic_vector(SHIFT_LEFT(ushiftin, cnt));
      return(resleft);
    else
      if r.e.sari = '1' then sshiftin(32) := aluin1(31); end if;
      sshiftin := SHIFT_RIGHT(sshiftin, cnt);
      resright := std_logic_vector(sshiftin(31 downto 0));
      return(resright);
    end if;

  end;

  function shift(r : registers; aluin1, aluin2 : word;
                 shiftcnt : std_logic_vector(4 downto 0); sari : std_ulogic ) return word is
  variable shiftin : std_logic_vector(63 downto 0);
  begin
    shiftin := zero32 & aluin1;
    if r.e.shleft = '1' then
      shiftin(31 downto 0) := zero32; shiftin(63 downto 31) := '0' & aluin1;
    else shiftin(63 downto 32) := (others => sari); end if;
    if shiftcnt (4) = '1' then shiftin(47 downto 0) := shiftin(63 downto 16); end if;
    if shiftcnt (3) = '1' then shiftin(39 downto 0) := shiftin(47 downto 8); end if;
    if shiftcnt (2) = '1' then shiftin(35 downto 0) := shiftin(39 downto 4); end if;
    if shiftcnt (1) = '1' then shiftin(33 downto 0) := shiftin(35 downto 2); end if;
    if shiftcnt (0) = '1' then shiftin(31 downto 0) := shiftin(32 downto 1); end if;
    return(shiftin(31 downto 0));
  end;

-- Check for illegal and privileged instructions

procedure exception_detect(r : registers; wpr : watchpoint_registers; dbgi : l3_debug_in_type;
        trapin : in std_ulogic; ttin : in std_logic_vector(5 downto 0); pccomp : in std_logic_vector(3 downto 0);
        trap : out std_ulogic; tt : out std_logic_vector(5 downto 0)) is
variable illegal_inst, ecall, ebreak,privileged_inst  : std_ulogic;
variable cp_disabled, fp_disabled, fpop : std_ulogic;
variable rd  : std_logic_vector(4 downto 0);
variable inst : word;
variable wph : std_ulogic;
begin
    inst := r.a.ctrl.inst; trap := trapin; tt := ttin;
    illegal_inst := '0'; privileged_inst := '0'; ecall := '0'; ebreak := '0';

    if r.a.ctrl.annul = '0' then
        case inst(6 downto 0) is
          when  R_LUI | R_AUIPC | R_JAL | R_JALR | R_BRANCH | R_LD | R_ST | R_IMM
            | R_NOIMM =>
              illegal_inst := '0';

          -- Must change for correctly treating ecall and ebreak.
          -- For now, ebreak sends illega instruction
          when R_CONTROL =>
              if(inst(14 downto 12) = R_F3_ECALL) and (inst(20) = '1') then --ebreak
                  ebreak := '1';
                  illegal_inst := '1';

              elsif(inst(14 downto 12) = R_F3_ECALL) then -- ecall
                  ecall := '1';
                  privileged_inst := '1';
              end if;
          when others =>
              illegal_inst := '1';
        end case;

        wph := wphit(r, wpr, dbgi, dsur, pccomp);
        trap := '1';
        if r.a.ctrl.trap = '1' then tt := r.a.ctrl.tt;
        elsif privileged_inst = '1' then tt := TT_PRIV;
        elsif illegal_inst = '1' or r.a.decill = '1' then tt := TT_IINST;
        elsif wph = '1' then tt := TT_WATCH;
        else trap := '0'; tt:= (others => '0'); end if;
    end if;
end;

-- instructions that write the condition codes (psr.icc)

procedure wicc_y_gen(r : registers; inst : word; wicc, wy : out std_ulogic) is
begin
  wicc := '0'; wy := '0';
  if(inst(6 downto 0) = R_BRANCH and r.d.cnt = "00") then
      wicc := '1';
  end if;
end;

-- select cwp

-- This is not used by RISC-V, since there is no resgiter window. This should be removed
-- in future
procedure cwp_gen(r, v : registers; annul, wcwp : std_ulogic; ncwp : cwptype;
                  cwp : out cwptype; awp: out cwptype; aw,paw: out std_ulogic;
                  stwin,de_cwpmax: out cwptype) is
 begin
    cwp := "000";
    aw := '0';
    paw := '0';
    awp := "000";
    stwin := "000";
    de_cwpmax := "000";
end;

-- generate wcwp in ex stage

-- This is not used by RISC-V, since there is no resgiter window. This should be removed
-- in future
procedure cwp_ex(r : in  registers; wcwp : out std_ulogic; wawp : out std_ulogic) is
  variable vwcwp, vwawp: std_ulogic;
begin
  vwcwp := '0'; vwawp := '0';
end;

-- generate next cwp & window under- and overflow traps

-- This is not used by RISC-V, since there is no resgiter window. This should be removed
-- in future
procedure cwp_ctrl(r : in registers; rcwp: in cwptype; xc_wim : in std_logic_vector(NWIN-1 downto 0);
        inst : word; de_cwp : out cwptype; wovf_exc, wunf_exc, wcwp : out std_ulogic) is
variable op : std_logic_vector(1 downto 0);
variable op3 : std_logic_vector(5 downto 0);
variable wim : word;
variable ncwp : cwptype;
begin
  op := inst(31 downto 30); op3 := inst(24 downto 19);
  wovf_exc := '0'; wunf_exc := '0'; wim := (others => '0');
  wim(NWIN-1 downto 0) := xc_wim; wcwp := '0';
  ncwp := "000";
  de_cwp := ncwp;
end;

-- generate register read address 1

procedure rs1_gen(r : registers; inst : word;  rs1 : out std_logic_vector(4 downto 0);
        rs1mod : out std_ulogic) is
    variable op : std_logic_vector(6 downto 0);
    variable op3 : std_logic_vector(2 downto 0);
    begin
      op := inst(6 downto 0);
      rs1 := inst(19 downto 15); rs1mod := '0';

      -- Second stage of store, rs1 = register to be written in memory
      if(inst(6 downto 0) = R_ST and r.d.cnt = "01")then
          rs1 := inst(24 downto 20);
      end if;
end;
-- load/icc interlock detection

  function icc_valid(r : registers) return std_logic is
  variable not_valid : std_logic;
  begin
    not_valid := (r.a.ctrl.wicc or r.e.ctrl.wicc);
    return(not not_valid);
  end;

--                  RISC-V BRANCH PREDICTION IS CURRENTLY DISABLED

  -- procedure bp_miss_ex(r : registers; icc : std_logic_vector(3 downto 0);
  --       ex_bpmiss, ra_bpannul : out std_logic) is
  -- variable miss : std_logic;
  -- begin
  --   if(r.e.ctrl.inst(6 downto 0) = R_BRANCH) and (r.e.ctrl.cnt = "01") then
  --       miss := (not r.e.ctrl.annul) and r.e.bp and not branch_true(icc, r.e.ctrl.inst);
  --   else
  --       miss := '0';
  --   end if;
  --   --ra_bpannul := miss and r.e.ctrl.inst(29);
  --   ra_bpannul := miss;
  --   ex_bpmiss := miss;
  -- end;
  --
  -- -- NOTE: no use for RV32I since icc is only updated while executing branch instructions
  -- procedure bp_miss_ra(r : registers; ra_bpmiss, de_bpannul : out std_logic) is
  -- variable miss : std_logic;
  -- begin
  --   miss := ((not r.a.ctrl.annul) and r.a.bp and icc_valid(r) and not branch_true(r.m.icc, r.a.ctrl.inst));
  --   --de_bpannul := miss and r.a.ctrl.inst(29;
  --   de_bpannul := miss;
  --   ra_bpmiss := miss;
  -- end;

  procedure lock_gen(r : registers; rs2, rd : std_logic_vector(4 downto 0);
        rfa1, rfa2, rfrd : rfatype; inst : word; fpc_lock, mulinsn, divinsn, de_wcwp : std_ulogic;
        lldcheck1, lldcheck2, lldlock, lldchkra, lldchkex, bp, nobp, de_fins_hold : out std_ulogic;
        iperr : std_logic; icbpmiss: std_ulogic) is
  variable op : std_logic_vector(6 downto 0);
  variable op2 : std_logic_vector(2 downto 0);
  variable f3 : std_logic_vector(2 downto 0);
  variable cond : std_logic_vector(3 downto 0);
  variable rs1  : std_logic_vector(4 downto 0);
  variable ldcheck1, ldcheck2, ldchkra, ldchkex, ldcheck3 : std_ulogic;
  variable ldlock, icc_check, bicc_hold, chkmul, y_check : std_logic;
  variable icc_check_bp, y_hold, mul_hold, bicc_hold_bp, fins, call_hold  : std_ulogic;
  variable de_fins_holdx : std_ulogic;
  begin
    op := inst(6 downto 0); f3 := inst(14 downto 12);
    op2 := inst(24 downto 22); cond := inst(28 downto 25);
    rs1 := inst(18 downto 14);
    ldcheck1 := '0'; ldcheck2 := '0'; ldcheck3 := '0'; ldlock := '0';
    ldchkra := '1'; ldchkex := '1'; icc_check := '0'; bicc_hold := '0';
    y_check := '0'; y_hold := '0'; bp := '0'; mul_hold := '0';
    icc_check_bp := '0'; nobp := '0'; fins := '0'; call_hold := '0';

--------------------------------------------------------------------------------
    -- RV32I changes
    ldcheck1 := '1'; ldcheck2 := '1';

    if (r.d.annul = '0') and (icbpmiss='0')
    then
      case op is
      when R_IMM =>
        ldcheck1 := '1'; ldcheck2 := '1';

      when R_JAL | R_JALR =>
        -- call_hold := '1';
        -- nobp := BPRED;

      when R_BRANCH =>
        if not(r.d.cnt = "00") then
            ldcheck1 := '0'; ldcheck2 := '0';
        end if;
        -- if r.d.cnt = "01" then
        --     nobp := BPRED;
        -- end if;

      when R_LD | R_ST =>
        ldcheck1 := '1'; ldchkra := '0';
        case r.d.cnt is
            when "00" =>
                if (op(5) = '1') then ldcheck3 := '1'; end if; -- store
                ldchkra := '1';
            when "01" =>
                ldchkra := '1';
            when others => NULL;
        end case;
      when others => null;
      end case;
    end if;


    if MULEN or DIVEN then
      chkmul := mulinsn;
      mul_hold := (r.a.mulstart and r.a.ctrl.wicc) or (r.m.ctrl.wicc and (r.m.ctrl.cnt(0) or r.m.mul));
      if (MULTYPE = 0) and ((icc_check_bp and BPRED and r.a.ctrl.wicc and r.a.ctrl.wy) = '1')
      then mul_hold := '1'; end if;
    else chkmul := '0'; end if;
    if DIVEN then
      y_hold := y_check and (r.a.ctrl.wy or r.e.ctrl.wy);
      chkmul := chkmul or divinsn;
    end if;

    bicc_hold := icc_check; --and not icc_valid(r);
    bicc_hold_bp := icc_check_bp; --and not icc_valid(r);

    if (((r.a.ctrl.ld or chkmul) and r.a.ctrl.wreg and ldchkra) = '1') and
       (((ldcheck1 = '1') and (r.a.ctrl.rd = rfa1)) or
        ((ldcheck2 = '1') and (r.a.ctrl.rd = rfa2)) or
        ((ldcheck3 = '1') and (r.a.ctrl.rd = rfrd)))
    then ldlock := '1'; end if;

    if (((r.e.ctrl.ld or r.e.mac) and r.e.ctrl.wreg and ldchkex) = '1') and
        ((lddel = 2) or (MACPIPE and (r.e.mac = '1')) or ((MULTYPE = 3) and (r.e.mul = '1'))) and
       (((ldcheck1 = '1') and (r.e.ctrl.rd = rfa1)) or
        ((ldcheck2 = '1') and (r.e.ctrl.rd = rfa2)))
    then ldlock := '1'; end if;

    -- de_fins_holdx := BPRED and fins and (r.a.bp or r.e.bp); -- skip BP on FPU inst in branch target address
    -- de_fins_hold := de_fins_holdx;
    ldlock := ldlock or y_hold or fpc_lock or (BPRED and r.a.bp) or de_fins_holdx;
    if ((icc_check_bp and BPRED) = '1') and ((r.a.nobp or mul_hold) = '0') then
      bp := bicc_hold_bp;
    else ldlock := ldlock or bicc_hold or bicc_hold_bp; end if;
    lldcheck1 := ldcheck1; lldcheck2:= ldcheck2; lldlock := ldlock;
    lldchkra := ldchkra; lldchkex := ldchkex;
  end;

  procedure fpbranch(inst : in word; fcc  : in std_logic_vector(1 downto 0);
                      branch : out std_ulogic) is
  variable cond : std_logic_vector(3 downto 0);
  variable fbres : std_ulogic;
  begin
    cond := inst(28 downto 25);
    case cond(2 downto 0) is
      when "000" => fbres := '0';                       -- fba, fbn
      when "001" => fbres := fcc(1) or fcc(0);
      when "010" => fbres := fcc(1) xor fcc(0);
      when "011" => fbres := fcc(0);
      when "100" => fbres := (not fcc(1)) and fcc(0);
      when "101" => fbres := fcc(1);
      when "110" => fbres := fcc(1) and not fcc(0);
      when others => fbres := fcc(1) and fcc(0);
    end case;
    branch := cond(3) xor fbres;
  end;

-- PC generation

  procedure ic_ctrl(r : registers; inst : word; annul_all, ldlock, de_rexhold, de_rexbubble, de_rexmaskpv, de_rexillinst, branch_true,
        fbranch_true, cbranch_true, fccv, cccv : in std_ulogic;
        cnt : out std_logic_vector(1 downto 0);
        de_pc : out pctype; de_branch, ctrl_annul, de_annul, jmpl_inst, inull,
        de_pv, ctrl_pv, de_hold_pc, ticc_exception, rett_inst, mulstart,
        divstart : out std_ulogic; rabpmiss, exbpmiss, iperr : std_logic;
        icbpmiss, eocl: std_ulogic) is
  variable op : std_logic_vector(1 downto 0);
  variable op2 : std_logic_vector(2 downto 0);
  variable op3 : std_logic_vector(5 downto 0);
  variable cond : std_logic_vector(3 downto 0);
  variable hold_pc, annul_current, annul_next, branch, annul, pv : std_ulogic;
  variable de_jmpl, inhibit_current : std_ulogic;
  begin
    branch := '0'; annul_next := '0'; annul_current := '0'; pv := '1';
    hold_pc := '0'; ticc_exception := '0'; rett_inst := '0';
    op := inst(31 downto 30); op3 := inst(24 downto 19);
    op2 := inst(24 downto 22); cond := inst(28 downto 25);
    annul := '0'; de_jmpl := '0'; cnt := "00";
    mulstart := '0'; divstart := '0'; inhibit_current := '0';

--------------------------------------------------------------------------------
    -- RV32I changes
    if (r.d.annul = '0') and (irqlat=0 or not (r.d.irqstart='1' and r.d.irqlatmet='0'))
    then
        case inst(6 downto 0) is
            when R_LD | R_ST =>
                case r.d.cnt is
                    when "00" =>
                      if (inst(5) = '1') then -- ST
                        cnt := "01"; hold_pc := '1'; pv := '0';
                      end if;
                    when "01" =>
                        cnt := "00";
                    when others => null;
                end case;

            -- This is a workaround to run branch instructions with no branch prediction
            when R_BRANCH =>
                if r.d.cnt = "11" then
                    branch := branch_true;
                    if (branch = '1') then
                        --if (annul = '1') then
                            annul_next := '1';
                        --end if;
                    else
                        annul_next := annul_next or annul;
                    end if;
                    if r.d.inull = '1' then -- contention with JMPL
                        hold_pc := '1'; annul_current := '1'; annul_next := '0';
                    end if;
                    cnt := "00";
                elsif r.d.cnt = "10" then
                    cnt := "11";
                    hold_pc := '1';
                    pv := '0';
                elsif r.d.cnt = "01" then
                    cnt := "10";
                    hold_pc := '1';
                    pv := '0';
                else
                    cnt := "01";
                    hold_pc := '1';
                    pv := '0';
                end if;

            when R_JAL | R_JALR =>
                de_jmpl := '1';
                if(hold_pc = '0') then
                    annul_next := '1';
                    if r.d.inull ='1' then
                        hold_pc := '1'; annul_current := '1';
                    end if;
                end if;

            when others => null;
        end case;
    end if;


    if ldlock = '1' then
      cnt := r.d.cnt; annul_next := '0'; pv := '1';
    end if;
    hold_pc := (hold_pc or ldlock) and not annul_all;
    -- if icbpmiss='1' and r.d.annul='0' then
    --   annul_current := '1'; annul_next := '1'; pv := '0'; hold_pc := '0';
    -- end if;
    -- if ((exbpmiss and r.a.ctrl.annul and r.d.pv and not hold_pc) = '1') then
    --     annul_next := '1'; pv := '0';
    -- end if;
    -- if ((exbpmiss and not r.a.ctrl.annul and r.d.pv) = '1') then
    --     annul_next := '1'; pv := '0'; annul_current := '1';
    -- end if;
    -- if ((exbpmiss and not r.a.ctrl.annul and not r.d.pv and not hold_pc) = '1') then
    --     annul_next := '1'; pv := '0';
    -- end if;

    if irqlat/=0 and r.d.irqstart='1' and r.d.irqlatmet='0' then
      annul_current := '1';
      hold_pc := '1';
    end if;

    if (hold_pc or de_rexhold) = '1' then de_pc := r.d.pc; else de_pc := r.f.pc; end if;

    annul_current := (annul_current or (ldlock and not inhibit_current) or annul_all or de_rexbubble);
    annul_current := annul_current and not de_rexillinst;
    ctrl_annul := r.d.annul or annul_all or annul_current or inhibit_current;
    pv := pv and not ((r.d.inull and not hold_pc) or annul_all or de_rexmaskpv);
    jmpl_inst := (de_jmpl or branch) and not annul_current and not inhibit_current;
    annul_next := (r.d.inull and not hold_pc) or annul_next or annul_all;
    if (annul_next = '1') or (rstn = '0') then
      cnt := (others => '0');
    end if;

    de_hold_pc := hold_pc; de_branch := branch; de_annul := annul_next;
    de_pv := pv; ctrl_pv := r.d.pv and
        not ((r.d.annul and not r.d.pv) or annul_all or annul_current);
    inull := (not rstn) or r.d.inull or hold_pc or annul_all;

  end;

-- register write address generation

  procedure rd_gen(r : registers; inst : word; wreg, ld : out std_ulogic;
        rdo : out std_logic_vector(4 downto 0); rexen: out std_ulogic) is
  variable write_reg : std_ulogic;
  variable op : std_logic_vector(6 downto 0);
  variable rd  : std_logic_vector(4 downto 0);
  begin

    op    := inst(6 downto 0);

---------------------------------------------------------------------------
    -- Changed rd according to RISCV32I convention
    write_reg := '1'; rd := inst(11 downto 7);
    -- Default for LEON3 signals
    ld := '0';
    rexen := '0';

    case op is
        when R_ST | R_BRANCH =>
            write_reg := '0';
        when R_LD =>
            ld := '1';
        when others => null;
    end case;

    -- Reg0 always 0
    if (rd = "00000") then
        write_reg := '0';
    end if;
    wreg := write_reg; rdo := rd;
  end;

-- immediate data generation

  function imm_data (r : registers; inst : word)
        return word is
  variable immediate_data : std_logic_vector(31 downto 0);
  begin
      immediate_data := (others => '0');

      case inst(6 downto 0) is
          when R_IMM | R_LD | R_JALR =>
              immediate_data(31 downto 11) := (others => inst(31));
              immediate_data(10 downto 0) := inst(30 downto 20);

          when R_LUI | R_AUIPC =>
              immediate_data(31 downto 12) := inst(31 downto 12);
              immediate_data(11 downto 0) := (others => '0');

          when R_JAL =>
              immediate_data(31 downto 20) := (others => inst(31));
              immediate_data(19 downto 11) := inst(19 downto 12) & inst(20);
              immediate_data(10 downto 1)  := inst(30 downto 21);

          when R_ST =>
              immediate_data(31 downto 11) := (others => inst(31));
              immediate_data(10 downto 5)  := inst(30 downto 25);
              immediate_data(4 downto 0)  := inst(11 downto 7);

          when others => null;
      end case;
      return(immediate_data);
  end;

-- read special registers

-- THIS IS NOT READY, SPECIAL INSTRUCTIONS SHOULD NOT BE USED
function get_spr (r : registers) return word is
variable spr : word;
begin
    spr := (others => '0');
    -- Select special registers to be read
    -- RISC-V CSRs used by GNU/Linux    -- Encoding
    -- status                                 00
    -- epc                                    01
    -- badvaddr                               02
    -- evec                                   03
    -- count                                  04
    -- compare                                05
    -- cause                                  06
    -- ptbr                                   07
    -- k0                                     12
    -- k1                                     13
    -- tosim                                  26
    -- fromsim                                27
    -- tohost                                 30
    -- fromhost                               31
    case r.e.ctrl.inst(31 downto 20) is
        when x"000" =>
            spr := r.w.s.status;
        when x"001" =>
            spr := r.w.s.epc & "00";
        when x"002" =>
            spr := r.w.s.badvaddr;
        when x"003" =>
            spr := r.w.s.evec;
        when x"004" =>
            spr := r.w.s.count;
        when x"005" =>
            spr := r.w.s.compare;
        when x"006" =>
            spr := r.w.s.cause;
        when x"007" =>
            spr := r.w.s.ptbr;
        when x"00C" =>
            spr := r.w.s.k0;
        when x"00D" =>
            spr := r.w.s.k1;
        when x"01A" =>
            spr := r.w.s.tosim;
        when x"01B" =>
            spr := r.w.s.fromsim;
        when x"01E" =>
            spr := r.w.s.tohost;
        when x"01F" =>
            spr := r.w.s.fromhost;
        when others => null;
    end case;

    return(spr);
end;

-- immediate data select

  function imm_select(inst : word; de_rexen: std_ulogic) return boolean is
  variable imm : boolean;
  begin
    imm := true;

    if(inst(6 downto 0) = R_NOIMM or inst(6 downto 0) = R_BRANCH) then
        imm := false;
    end if;
    return(imm);
end;

-- EXE operation

  procedure alu_op(r : in registers; iop1, iop2 : in word; me_icc : std_logic_vector(3 downto 0);
        my, ldbp : std_ulogic; aop1, aop2 : out word; aluop  : out std_logic_vector(2 downto 0);
        alusel : out std_logic_vector(1 downto 0); aluadd : out std_ulogic;
        shcnt : out std_logic_vector(4 downto 0); sari, shleft, ymsb,
        mulins, divins, mulstep, macins, ldbp2, invop2 : out std_logic
        ) is
  variable op : std_logic_vector(6 downto 0);
  variable f3 : std_logic_vector(2 downto 0);
  variable rs1, rs2, rd  : std_logic_vector(4 downto 0);
  variable icc : std_logic_vector(3 downto 0);
  variable y0, i  : std_ulogic;
  begin

    op   := r.a.ctrl.inst(6 downto 0);
    f3  := r.a.ctrl.inst(14 downto 12);
    rs1 := r.a.ctrl.inst(19 downto 15); i := r.a.ctrl.inst(30);
    rs2 := r.a.ctrl.inst(24 downto 20); rd := r.a.ctrl.inst(29 downto 25);
    aop1 := iop1; aop2 := iop2; ldbp2 := ldbp;
    aluop := EXE_NOP; alusel := EXE_RES_MISC; aluadd := '1';
    shcnt := iop2(4 downto 0); sari := '0'; shleft := '0'; invop2 := '0';
    ymsb := iop1(0); mulins := '0'; divins := '0'; mulstep := '0';
    macins := '0';

    if r.e.ctrl.wicc = '1' then icc := me_icc;
    elsif r.m.ctrl.wicc = '1' then icc := r.m.icc;
    elsif r.x.ctrl.wicc = '1' then icc := r.x.icc;
    else icc := r.w.s.icc; end if;

--------------------------------------------------------------------
    --TODO: finish
    -- RISCV32I operations
    case op is
        when R_AUIPC =>
            aluop := EXE_AUIPC;

        when R_LUI =>
            aluop := EXE_PASS2;

        when R_IMM | R_NOIMM | R_JALR =>
            case f3 is
                when R_F3_ADD =>                    -- ADD
                    alusel := EXE_RES_ADD;

                    if(i = '1' and op = R_NOIMM) then -- SUB
                        --aluadd := '0';
                        aop2 := not iop2;
                        invop2 := '1';
                    end if;
                when R_F3_XOR =>                    -- XOR
                    aluop := EXE_XOR;
                    alusel := EXE_RES_LOGIC;
                when R_F3_AND =>                    -- AND
                    aluop := EXE_AND;
                    alusel := EXE_RES_LOGIC;
                when R_F3_OR =>                     -- OR
                    aluop := EXE_OR;
                    alusel := EXE_RES_LOGIC;
                when R_F3_SLL =>                    -- SLL
                    aluop := EXE_SLL;
                    alusel := EXE_RES_SHIFT;
                    shleft := '1';
                    --??
                    shcnt := not iop2(4 downto 0);
                    invop2 := '1';
                when R_F3_SRL =>
                    if (i = '1') then               -- SRA
                        aluop := EXE_SRA;
                        alusel := EXE_RES_SHIFT;
                        sari := iop1(31);
                    else                            -- SRL
                        aluop := EXE_SRL;
                        alusel := EXE_RES_SHIFT;
                    end if;
                when R_F3_SLT =>
                    aluop := EXE_SLT;
                    alusel := EXE_RES_LOGIC;
                when R_F3_SLTU =>
                    aluop := EXE_SLTU;
                    alusel := EXE_RES_LOGIC;
                when others => null;
            end case;

        when R_JAL =>
            aluop := EXE_LINK;

        when R_BRANCH =>
            if r.a.ctrl.cnt = "00" then
                alusel := EXE_RES_ADD;
                aluadd := '0';
                aop2 := not iop2;
                invop2 := '1';
            end if;
--
        when R_LD  =>      -- LDST
            alusel := EXE_RES_ADD;

        when R_ST =>
            case r.a.ctrl.cnt is
                when "00" =>
                    alusel := EXE_RES_ADD;
                when "01" =>
                    case f3 is
                        when R_F3_SH =>
                            aluop := EXE_STH;
                        when R_F3_SB =>
                            aluop := EXE_STB;
                        when others =>
                            aluop := EXE_PASS1;
                    end case;
                when others => null;
            end case;
        when R_CONTROL =>
            if not(f3 = R_F3_ECALL) and not(rd = "00000") then
                aluop := EXE_SPR;
            end if;
        when others => null;
    end case;
  end;


  function ra_inull_gen(r, v : registers) return std_ulogic is
  variable de_inull : std_ulogic;
  begin
    de_inull := '0';
    if ((v.e.jmpl or v.e.ctrl.rett) and not v.e.ctrl.annul and not (r.e.jmpl and not r.e.ctrl.annul)) = '1' then de_inull := '1'; end if;
    if ((v.a.jmpl or v.a.ctrl.rett) and not v.a.ctrl.annul and not (r.a.jmpl and not r.a.ctrl.annul)) = '1' then de_inull := '1'; end if;
    return(de_inull);
  end;

-- operand generation

  procedure op_mux(r : in registers; rfd, ed, md, xd, im : in word;
        rsel : in std_logic_vector(2 downto 0);
        ldbp : out std_ulogic; d : out word; id : std_logic) is
  begin
    ldbp := '0';
    case rsel is
        when "000" => d := rfd;
        when "001" => d := ed;
        when "010" => d := md; if lddel = 1 then ldbp := r.m.ctrl.ld; end if;
        when "011" => d := xd;
                      if (CASAEN and lddel=2) and (r.m.casa='1' and r.a.ctrl.cnt="11" and id='1') then d:=xd xor rfd; end if;
        when "100" => d := im;
        when "101" => d := (others => '0');
        when "110" => d := r.w.result;
        when others => d := (others => '-');
    end case;
  end;

  procedure op_find(r : in registers; ldchkra : std_ulogic; ldchkex : std_ulogic;
         rs1 : std_logic_vector(4 downto 0); ra : rfatype; im : boolean; rfe : out std_ulogic;
        osel : out std_logic_vector(2 downto 0); ldcheck : std_ulogic) is
  begin

    -- Immediate, forwarding and reading from register bank
    rfe := '0';
    if im then osel := "100";
    elsif rs1 = "00000" then osel := "101";     -- %g0
    elsif ((r.a.ctrl.wreg and ldchkra) = '1') and (ra = r.a.ctrl.rd) then osel := "001";
    elsif ((r.e.ctrl.wreg and ldchkex) = '1') and (ra = r.e.ctrl.rd) then osel := "010";
    elsif (r.m.ctrl.wreg = '1') and (ra = r.m.ctrl.rd) then osel := "011";
    elsif (irfwt = 0) and (r.x.ctrl.wreg = '1') and (ra = r.x.ctrl.rd) then osel := "110";
    else  osel := "000"; rfe := ldcheck; end if;
  end;

-- generate carry-in for alu

  procedure cin_gen(r : registers; me_cin : in std_ulogic; cin : out std_ulogic) is
  variable op : std_logic_vector(6 downto 0);
  variable f3 : std_logic_vector(2 downto 0);
  variable ncin : std_ulogic;
  begin

    op := r.a.ctrl.inst(6 downto 0); f3 := r.a.ctrl.inst(14 downto 12);
    if r.e.ctrl.wicc = '1' then ncin := me_cin;
    else ncin := r.m.icc(0); end if;
    cin := '0';
-------------------------------------------------------------------------------
    -- RV32I changes
    case op is
        when R_NOIMM =>
            if(f3 = R_F3_ADD and r.a.ctrl.inst(30) = '1')then
                cin := '1';
            end if;

        when R_BRANCH =>
            if(r.a.ctrl.cnt = "00") then
                cin := '1';
            end if;
        when others => null;
    end case;
  end;


  procedure logic_op(r : registers; aluin1, aluin2, mey : word;
        ymsb : std_ulogic; logicres, y : out word) is
  variable logicout : word;
  begin
    case r.e.aluop is
    when EXE_AND   => logicout := aluin1 and aluin2;
    --when EXE_ANDN  => logicout := aluin1 and not aluin2;
    when EXE_OR    => logicout := aluin1 or aluin2;
    when EXE_ORN   => logicout := aluin1 or not aluin2;
    when EXE_XOR   => logicout := aluin1 xor aluin2;
    --when EXE_XNOR  => logicout := aluin1 xor not aluin2;
    when EXE_SLT   =>
        if(signed(aluin1) < signed(aluin2)) then
            logicout(0) := '1';
        else
            logicout(0) := '0';
        end if;
        logicout(31 downto 1) := (others => '0');
    when EXE_SLTU =>
        if(unsigned(aluin1) < unsigned(aluin2)) then
            logicout(0) := '1';
        else
            logicout(0) := '0';
        end if;
        logicout(31 downto 1) := (others => '0');

    when others => logicout := (others => '-');
    end case;
    if (r.e.ctrl.wy and r.e.mulstep) = '1' then
      y := ymsb & r.m.y(31 downto 1);
    elsif r.e.ctrl.wy = '1' then y := logicout;
    elsif r.m.ctrl.wy = '1' then y := mey;
    elsif MACPIPE and (r.x.mac = '1') then y := mulo.result(63 downto 32);
    elsif r.x.ctrl.wy = '1' then y := r.x.y;
    else y := r.w.s.y; end if;
    logicres := logicout;
  end;

  function st_align(size : std_logic_vector(1 downto 0); bpdata : word) return word is
  variable edata : word;
  begin
    case size is
    when "01"   => edata := bpdata(7 downto 0) & bpdata(7 downto 0) &
                             bpdata(7 downto 0) & bpdata(7 downto 0);
    when "10"   => edata := bpdata(15 downto 0) & bpdata(15 downto 0);
    when others    => edata := bpdata;
    end case;
    return(edata);
  end;

  procedure misc_op(r : registers; wpr : watchpoint_registers;
        aluin1, aluin2, ldata, mey : word; xc_wimmask: std_logic_vector;
        mout, edata : out word) is
  variable miscout, bpdata, stdata : word;
  variable wpi : integer;
  begin
    wpi := 0;
    miscout := (others => '0');
    miscout(31 downto PCLOW) := r.e.ctrl.pc(31 downto PCLOW);
    if REX/=0 and r.e.ctrl.pc(PCLOW)='1' then
      miscout(31 downto 2) := miscout(31 downto 2)-1;
    end if;
    edata := aluin1;

    bpdata(7 downto 0) := aluin1(31 downto 24);
    bpdata(15 downto 8) := aluin1(23 downto 16);
    bpdata(23 downto 16) := aluin1(15 downto 8);
    bpdata(31 downto 24) := aluin1(7 downto 0);


    if ((r.x.ctrl.wreg and r.x.ctrl.ld and not r.x.ctrl.annul) = '1') and
       (r.x.ctrl.rd = r.e.ctrl.rd) and (r.e.ctrl.inst(6 downto 0) = R_LD) and
        (r.e.ctrl.cnt /= "10")
    then bpdata := ldata; end if;



    case r.e.aluop is
    when EXE_STB   => miscout := bpdata(31 downto 24) & bpdata(31 downto 24) &
                             bpdata(31 downto 24) & bpdata(31 downto 24);
                      edata := miscout;
    when EXE_STH   => miscout := bpdata(31 downto 16) & bpdata(31 downto 16);
                      edata := miscout;
    when EXE_PASS1 => miscout := bpdata; edata := miscout;
    when EXE_PASS2 => miscout := aluin2;
--    when EXE_ONES  => miscout := (others => '1');
--                      edata := miscout;

    when EXE_AUIPC =>
        miscout := aluin2 + (r.e.ctrl.pc & "00");

    when EXE_RDY  =>
      if MULEN and (r.m.ctrl.wy = '1') then miscout := mey;
      else miscout := r.m.y; end if;
      if (NWP > 0) and (r.e.ctrl.inst(18 downto 17) = "11") then
        wpi := conv_integer(r.e.ctrl.inst(16 downto 15));
        if r.e.ctrl.inst(14) = '0' then miscout := wpr(wpi).addr & '0' & wpr(wpi).exec;
        else miscout := wpr(wpi).mask & wpr(wpi).load & wpr(wpi).store; end if;
      end if;

      if AWPEN or RFPART then
        if (r.e.ctrl.inst(18 downto 14) = "10100") then  -- %asr20
          miscout := (others => '0');
          if AWPEN then
            miscout(NWINLOG2-1 downto 0) := r.e.awp;
          end if;
          if RFPART then
            miscout(20+NWINLOG2 downto 21) := r.w.s.stwin;
            miscout(15+NWINLOG2 downto 16) := r.w.s.cwpmax;
          end if;
        end if;
      end if;
    when EXE_SPR  =>
      miscout := get_spr(r);
    when others => null;
    end case;
    mout := miscout;
  end;

  procedure alu_select(r : registers; addout : std_logic_vector(33 downto 0);
        op1, op2 : word; shiftout, logicout, miscout : word; res : out word;
        me_icc : std_logic_vector(3 downto 0);
        icco : out std_logic_vector(3 downto 0); divz, mzero : out std_ulogic) is
  variable icc : std_logic_vector(3 downto 0);
  variable aluresult : word;
  variable azero : std_logic;
  begin
    icc := (others => '0');
    if addout(32 downto 1) = zero32 then azero := '1'; else azero := '0'; end if;
    mzero := azero;
    case r.e.alusel is
    when EXE_RES_ADD =>
        -- Flags are set for branch conditions
        aluresult := addout(32 downto 1);
        icc(0) := addout(33); -- Carry
        icc(1) := (op1(31) and op2(31) and not addout(32)) or   -- Overflow
              (addout(32) and (not op1(31)) and (not op2(31)));

        if aluresult = zero32 then icc(2) := '1'; end if;
        icc(3) := aluresult(31);

    when EXE_RES_SHIFT => aluresult := shiftout;
    when EXE_RES_LOGIC => aluresult := logicout;
      if aluresult = zero32 then icc(2) := '1'; end if;
    when others => aluresult := miscout;
    end case;

    -- Save PC on jump and link
    if r.e.jmpl = '1' then aluresult := (r.e.ctrl.pc(31 downto 2) + 1) & "00"; end if;

    -- Write icc, used for branch
    if r.e.ctrl.wicc = '1' then
        icco := icc;
    elsif r.m.ctrl.wicc = '1' then icco := me_icc;
    elsif r.x.ctrl.wicc = '1' then icco := r.x.icc;
    else icco := r.w.s.icc;
    end if;

    res := aluresult;
  end;

  procedure dcache_gen(r, v : registers; dci : out dc_in_type;
        link_pc, jump, force_a2, load, mcasa : out std_ulogic) is
  variable op : std_logic_vector(6 downto 0);
  variable f3 : std_logic_vector(2 downto 0);
  variable su, lock : std_ulogic;
  begin
    op := r.e.ctrl.inst(6 downto 0); f3 := r.e.ctrl.inst(14 downto 12);
    dci.signed := '0'; dci.lock := '0'; dci.dsuen := '0'; dci.size := SZWORD;
    mcasa := '0';

-----------------------------------------------------------------------------
    -- RV32I changes

    if((op = R_LD) or (op = R_ST)) then
        case f3 is
            when R_F3_LBU =>
                dci.size := SZBYTE;
            when R_F3_LHU =>
                dci.size := SZHALF;
            when R_F3_LW =>
                dci.size := SZWORD;
            when R_F3_LB =>
                dci.size := SZBYTE;
                dci.signed := '1';
            when R_F3_LH =>
                dci.size := SZHALF;
                dci.signed := '1';
            when others =>
                dci.size := SZWORD; dci.lock := '0'; dci.signed := '0';
        end case;
    end if;

    link_pc := '0'; jump:= '0'; force_a2 := '0'; load := '0';
    dci.write := '0'; dci.enaddr := '0'; dci.read := not op(5);

    if (r.e.ctrl.annul or r.e.ctrl.trap) = '0' then
        case op is
            when R_JAL | R_JALR =>
                jump := '1'; link_pc := '1';

            when R_LD | R_ST =>
                case r.e.ctrl.cnt is
                    when "00" =>
                        dci.read := not op(5);                      -- LOAD
                        load := not op(5);
                        dci.enaddr := '1';
                    when "01" =>
                        if op(5) = '1' then                         -- STORE
                            dci.write := '1';
                        end if;

                    when others => null;
                end case;
            when others => null;
        end case;
    end if;

    if ((r.x.ctrl.rett and not r.x.ctrl.annul) = '1') then su := r.w.s.ps;
    else su := r.w.s.s; end if;
    if su = '1' then dci.asi := "00001011"; else dci.asi := "00001010"; end if;
  end;


  -- Memory instructions involving float point registers, not implemented
  procedure fpstdata(r : in registers; edata, eres : in word; fpstdata : in std_logic_vector(31 downto 0);
                       edata2, eres2 : out word) is
    variable op : std_logic_vector(1 downto 0);
    variable op3 : std_logic_vector(5 downto 0);
  begin
    edata2 := edata; eres2 := eres;
    -- op := r.e.ctrl.inst(31 downto 30); op3 := r.e.ctrl.inst(24 downto 19);
    -- if FPEN then
    --   if FPEN and (op = LDST) and  ((op3(5 downto 4) & op3(2)) = "101") and (r.e.ctrl.cnt /= "00") then
    --     edata2 := fpstdata; eres2 := fpstdata;
    --   end if;
    -- end if;
    -- if CASAEN and (r.m.casa = '1') and r.e.ctrl.cnt(1)='1' then
    --   edata2 := r.e.op1; eres2 := r.e.op1;
    -- end if;
  end;

  function ld_align(data : dcdtype; set : std_logic_vector(DSETMSB downto 0);
        size, laddr : std_logic_vector(1 downto 0); signed : std_ulogic) return word is
  variable align_data, rdata, outdata : word;
  begin
    align_data := data(conv_integer(set)); rdata := (others => '0');
    case size is
    when "00" =>                        -- byte read
      case laddr is
      when "00" =>
        rdata(7 downto 0) := align_data(31 downto 24);
        if signed = '1' then rdata(31 downto 8) := (others => align_data(31)); end if;
      when "01" =>
        rdata(7 downto 0) := align_data(23 downto 16);
        if signed = '1' then rdata(31 downto 8) := (others => align_data(23)); end if;
      when "10" =>
        rdata(7 downto 0) := align_data(15 downto 8);
        if signed = '1' then rdata(31 downto 8) := (others => align_data(15)); end if;
      when others =>
        rdata(7 downto 0) := align_data(7 downto 0);
        if signed = '1' then rdata(31 downto 8) := (others => align_data(7)); end if;
      end case;
      outdata := rdata;
      
    when "01" =>                        -- half-word read
      if  laddr(1) = '1' then
        rdata(15 downto 8) := align_data(7 downto 0);
        rdata(7 downto 0) := align_data(15 downto 8);
        if signed = '1' then rdata(31 downto 15) := (others => align_data(7)); end if;
      else
        rdata(15 downto 8) := align_data(23 downto 16);
        rdata(7 downto 0) := align_data(31 downto 24);
        if signed = '1' then rdata(31 downto 15) := (others => align_data(23)); end if;
      end if;
      outdata := rdata;

    when others =>                      -- single and double word read
      rdata := align_data;
      outdata(7 downto 0) := rdata(31 downto 24);
      outdata(15 downto 8) := rdata(23 downto 16);
      outdata(23 downto 16) := rdata(15 downto 8);
      outdata(31 downto 24) := rdata(7 downto 0);
    end case;

    return(outdata);
  end;

-- RISC-V mem trap not implemented

  -- procedure mem_trap(r : registers; wpr : watchpoint_registers;
  --                    annul, holdn : in std_ulogic;
  --                    trapout, iflush, nullify, werrout : out std_ulogic;
  --                    tt : out std_logic_vector(5 downto 0)) is
  -- variable cwp   : std_logic_vector(NWINLOG2-1 downto 0);
  -- variable cwpx  : std_logic_vector(5 downto NWINLOG2);
  -- variable op : std_logic_vector(1 downto 0);
  -- variable op2 : std_logic_vector(2 downto 0);
  -- variable op3 : std_logic_vector(5 downto 0);
  -- variable nalign_d : std_ulogic;
  -- variable trap, werr : std_ulogic;
  -- begin
  --   op := r.m.ctrl.inst(31 downto 30); op2  := r.m.ctrl.inst(24 downto 22);
  --   op3 := r.m.ctrl.inst(24 downto 19);
  --   cwpx := r.m.result(5 downto NWINLOG2); cwpx(5) := '0';
  --   iflush := '0'; trap := r.m.ctrl.trap; nullify := annul;
  --   tt := r.m.ctrl.tt; werr := (dco.werr or r.m.werr) and not r.w.s.dwt;
  --   nalign_d := r.m.nalign or r.m.result(2);
  --   if (trap = '1') and (r.m.ctrl.pv = '1') then
  --     if op = LDST then nullify := '1'; end if;
  --   end if;
  --   if ((annul or trap) /= '1') and (r.m.ctrl.pv = '1') then
  --     if (werr and holdn) = '1' then
  --       trap := '1'; tt := TT_DSEX; werr := '0';
  --       if op = LDST then nullify := '1'; end if;
  --     end if;
  --   end if;
  --   if ((annul or trap) /= '1') then
  --     case op is
  --     when FMT2 =>
  --       case op2 is
  --       when FBFCC =>
  --         if FPEN and (fpo.exc = '1') then trap := '1'; tt := TT_FPEXC; end if;
  --       when CBCCC =>
  --         if CPEN and (cpo.exc = '1') then trap := '1'; tt := TT_CPEXC; end if;
  --       when others => null;
  --       end case;
  --     when FMT3 =>
  --       case op3 is
  --       when WRPSR =>
  --         if (orv(cwpx) = '1') and (pwrpsr=0 or r.m.ctrl.inst(29 downto 25)="00000") then trap := '1'; tt := TT_IINST; end if;
  --       when UDIV | SDIV | UDIVCC | SDIVCC =>
  --         if DIVEN then
  --           if r.m.divz = '1' then trap := '1'; tt := TT_DIV; end if;
  --         end if;
  --       when JMPL | RETT =>
  --         if (REX=1 and r.m.rexnalign='1') or (REX=0 and r.m.nalign = '1') then
  --           trap := '1'; tt := TT_UNALA;
  --         end if;
  --       when TADDCCTV | TSUBCCTV =>
  --         if (notag = 0) and (r.m.icc(1) = '1') then
  --           trap := '1'; tt := TT_TAG;
  --         end if;
  --       when FLUSH => iflush := '1';
  --       when FPOP1 | FPOP2 =>
  --         if FPEN and (fpo.exc = '1') then trap := '1'; tt := TT_FPEXC; end if;
  --       when CPOP1 | CPOP2 =>
  --         if CPEN and (cpo.exc = '1') then trap := '1'; tt := TT_CPEXC; end if;
  --       when others => null;
  --       end case;
  --     when LDST =>
  --       if r.m.ctrl.cnt = "00" then
  --         case op3 is
  --           when LDDF | STDF | STDFQ =>
  --           if FPEN then
  --             if nalign_d = '1' then
  --               trap := '1'; tt := TT_UNALA; nullify := '1';
  --             elsif (fpo.exc and r.m.ctrl.pv) = '1'
  --             then trap := '1'; tt := TT_FPEXC; nullify := '1'; end if;
  --           end if;
  --         when LDDC | STDC | STDCQ =>
  --           if CPEN then
  --             if nalign_d = '1' then
  --               trap := '1'; tt := TT_UNALA; nullify := '1';
  --             elsif ((cpo.exc and r.m.ctrl.pv) = '1')
  --             then trap := '1'; tt := TT_CPEXC; nullify := '1'; end if;
  --           end if;
  --         when LDD | ISTD | LDDA | STDA =>
  --           if r.m.result(2 downto 0) /= "000" then
  --             trap := '1'; tt := TT_UNALA; nullify := '1';
  --           end if;
  --         when LDF | LDFSR | STFSR | STF =>
  --           if FPEN and (r.m.nalign = '1') then
  --             trap := '1'; tt := TT_UNALA; nullify := '1';
  --           elsif FPEN and ((fpo.exc and r.m.ctrl.pv) = '1')
  --           then trap := '1'; tt := TT_FPEXC; nullify := '1'; end if;
  --         when LDC | LDCSR | STCSR | STC =>
  --           if CPEN and (r.m.nalign = '1') then
  --             trap := '1'; tt := TT_UNALA; nullify := '1';
  --           elsif CPEN and ((cpo.exc and r.m.ctrl.pv) = '1')
  --           then trap := '1'; tt := TT_CPEXC; nullify := '1'; end if;
  --         when LD | LDA | ST | STA | SWAP | SWAPA | CASA =>
  --           if r.m.result(1 downto 0) /= "00" then
  --             trap := '1'; tt := TT_UNALA; nullify := '1';
  --           end if;
  --         when LDUH | LDUHA | LDSH | LDSHA | STH | STHA =>
  --           if r.m.result(0) /= '0' then
  --             trap := '1'; tt := TT_UNALA; nullify := '1';
  --           end if;
  --         when others => null;
  --         end case;
  --         for i in 1 to NWP loop
  --           if ((((wpr(i-1).load and not op3(2)) or (wpr(i-1).store and op3(2))) = '1') and
  --               (((wpr(i-1).addr xor r.m.result(31 downto 2)) and wpr(i-1).mask) = zero32(31 downto 2)))
  --           then trap := '1'; tt := TT_WATCH; nullify := '1'; end if;
  --         end loop;
  --       end if;
  --     when others => null;
  --     end case;
  --   end if;
  --   if (rstn = '0') or (r.x.rstate = dsu2) then werr := '0'; end if;
  --   trapout := trap; werrout := werr;
  -- end;

-- RISC-V IRQ trap not implemented
  procedure irq_trap(r       : in registers;
                     ir      : in irestart_register;
                     irl     : in std_logic_vector(3 downto 0);
                     annul   : in std_ulogic;
                     pv      : in std_ulogic;
                     trap    : in std_ulogic;
                     tt      : in std_logic_vector(5 downto 0);
                     nullify : in std_ulogic;
                     irqen   : out std_ulogic;
                     irqen2  : out std_ulogic;
                     nullify2 : out std_ulogic;
                     trap2, ipend  : out std_ulogic;
                     tt2      : out std_logic_vector(5 downto 0)) is
    variable op : std_logic_vector(1 downto 0);
    variable op3 : std_logic_vector(5 downto 0);
    variable pend : std_ulogic;
  begin
    nullify2 := nullify; trap2 := trap; tt2 := tt;
    op := r.m.ctrl.inst(31 downto 30); op3 := r.m.ctrl.inst(24 downto 19);
    irqen := '1'; irqen2 := r.m.irqen;

    -- if (annul or trap) = '0' then
    --   if ((op = FMT3) and (op3 = WRPSR)) then irqen := '0'; end if;
    -- end if;
    --
    -- if (irl = "1111") or (irl > r.w.s.pil) then
    --   pend := r.m.irqen and r.m.irqen2 and r.w.s.et and not ir.pwd;
    -- else pend := '0'; end if;
    -- ipend := pend;
    --
    -- if ((not annul) and pv and (not trap) and pend) = '1' then
    --   trap2 := '1'; tt2 := "01" & irl;
    --   if op = LDST then nullify2 := '1'; end if;
    -- end if;
  end;

  procedure irq_intack(r : in registers; holdn : in std_ulogic; intack: out std_ulogic) is
  begin
    intack := '0';
    if r.x.rstate = trap then
      if r.w.s.tt(7 downto 4) = "0001" then intack := '1'; end if;
    end if;
  end;

-- write special registers
-- RISC-V SPECIAL INSTRUCTIONS ARE NOT COMPLETLY IMPLEMENTED AND SHOULD NOT BE USED
procedure sp_write (r : registers; wpr : watchpoint_registers;
      s : out special_register_type; vwpr : out watchpoint_registers) is
variable op : std_logic_vector(6 downto 0);
variable f3 : std_logic_vector(2 downto 0);
variable rd : std_logic_vector(4 downto 0);
variable data : word;
variable rs1 : word;
variable csr : std_logic_vector(11 downto 0);
variable enable : std_logic;
variable old_value : word;

begin

  op  := r.x.ctrl.inst(6 downto 0);
  f3  := r.x.ctrl.inst(14 downto 12);
  s   := r.w.s;
  data := r.x.rs1;
  rs1 := (others => '0'); rs1(4 downto 0) := r.x.ctrl.inst(19 downto 15);
  rd  := r.x.ctrl.inst(11 downto 7);
  csr := r.x.ctrl.inst(31 downto 20);
  old_value := get_spr(r);
  enable := '0';
  vwpr := wpr;

  -- if AWPEN then
  --   if r.w.s.aw='0' and r.w.s.paw='0' then
  --     s.awp := r.w.s.cwp;
  --   end if;
  -- end if;


  -- RISC-V CSRs used by GNU/Linux    -- Encoding
  -- status                                 00
  -- epc                                    01
  -- badvaddr                               02
  -- evec                                   03
  -- count                                  04
  -- compare                                05
  -- cause                                  06
  -- ptbr                                   07
  -- k0                                     12
  -- k1                                     13
  -- tosim                                  26
  -- fromsim                                27
  -- tohost                                 30
  -- fromhost                               31

  -- Check if we should try to write the special register
  if(op = R_CONTROL) then
      enable := '1';
      case f3 is
          when R_F3_CSRRW =>

          when R_F3_CSRRWI =>
              data := rs1;

          when R_F3_CSRRC =>
              if(rs1(4 downto 0) = "00000") then
                  enable := '0';
              else
                  data := old_value and (not data);
              end if;
          when R_F3_CSRRCI =>
              if(rs1(4 downto 0) = "00000") then
                  enable := '0';
              else
                  data := old_value and (not rs1);
              end if;
          when R_F3_CSRRS =>
              if(rs1(4 downto 0) = "00000") then
                  enable := '0';
              else
                  data := data or old_value;
              end if;
          when R_F3_CSRRSI =>
              if(rs1(4 downto 0) = "00000") then
                  enable := '0';
              else
                  data := rs1 or old_value;
              end if;
          -- ecall and ebreak
          when others => enable := '0';
      end case;
  end if;

  -- Must add exception check for this

  -- Updates special register
  if(enable = '1') then
      case csr is
          when x"000" => s.status := data;
          when x"001" => s.epc := data(31 downto 2);
          when x"002" => s.badvaddr := data;
          when x"003" => s.evec := data;
          when x"004" => s.count := data;
          when x"005" => s.compare := data;
          when x"006" => s.cause := data;
          when x"007" => s.ptbr := data;
          when x"00C" => s.k0 := data;
          when x"00D" => s.k1 := data;
          when x"01A" => s.tosim := data;
          when x"01B" => s.fromsim := data;
          when x"01E" => s.tohost := data;
          when x"01F" => s.fromhost := data;
          when others => null;
      end case;
  end if;
  -- Conditional branches are evaluated using this icc
  if r.x.ctrl.wicc = '1' then s.icc := r.x.icc; end if;

  -- Mult signals
  --if r.x.ctrl.wy = '1' then s.y := r.x.y; end if;
  --if MACPIPE and (r.x.mac = '1') then
  --s.asr18 := mulo.result(31 downto 0);
  --s.y := mulo.result(63 downto 32);
  --end if;
end;

  function npc_find (r : registers) return std_logic_vector is
  variable npc : std_logic_vector(2 downto 0);
  begin
    npc := "011";
    if r.m.ctrl.pv = '1' then npc := "000";
    elsif r.e.ctrl.pv = '1' then npc := "001";
    elsif r.a.ctrl.pv = '1' then npc := "010";
    elsif r.d.pv = '1' then npc := "011";
    elsif v8 /= 0 then npc := "100"; end if;
    return(npc);
  end;

  function npc_gen (r : registers; de_pcout: std_logic_vector) return word is
  variable npc : std_logic_vector(31 downto 0);
  begin
    npc := (others => '0');
    npc(31 downto PCLOW) :=  r.a.ctrl.pc(31 downto PCLOW);
    case r.x.npc is
    when "000" => npc(31 downto PCLOW) := r.x.ctrl.pc(31 downto PCLOW);
    when "001" => npc(31 downto PCLOW) := r.m.ctrl.pc(31 downto PCLOW);
    when "010" => npc(31 downto PCLOW) := r.e.ctrl.pc(31 downto PCLOW);
    when "011" => npc(31 downto PCLOW) := r.a.ctrl.pc(31 downto PCLOW);
    when others =>
        if v8 /= 0 then npc(31 downto PCLOW) := de_pcout(31 downto PCLOW); end if;
    end case;
    return(npc);
  end;

-- RISC-V mul instructions are not implemented
  procedure mul_res(r : registers; asr18in : word; result, y, asr18 : out word;
          icc : out std_logic_vector(3 downto 0)) is
  variable op  : std_logic_vector(1 downto 0);
  variable op3 : std_logic_vector(5 downto 0);
  begin
    op    := r.m.ctrl.inst(31 downto 30); op3   := r.m.ctrl.inst(24 downto 19);
    result := r.m.result; y := r.m.y; icc := r.m.icc; asr18 := asr18in;
    -- case op is
    -- when FMT3 =>
    --   case op3 is
    --   when UMUL | SMUL =>
    --     if MULEN then
    --       result := mulo.result(31 downto 0);
    --       y := mulo.result(63 downto 32);
    --     end if;
    --   when UMULCC | SMULCC =>
    --     if MULEN then
    --       result := mulo.result(31 downto 0); icc := mulo.icc;
    --       y := mulo.result(63 downto 32);
    --     end if;
    --   when UMAC | SMAC =>
    --     if MACEN and not MACPIPE then
    --       result := mulo.result(31 downto 0);
    --       asr18  := mulo.result(31 downto 0);
    --       y := mulo.result(63 downto 32);
    --     end if;
    --   when UDIV | SDIV =>
    --     if DIVEN then
    --       result := divo.result(31 downto 0);
    --     end if;
    --   when UDIVCC | SDIVCC =>
    --     if DIVEN then
    --       result := divo.result(31 downto 0); icc := divo.icc;
    --     end if;
    --   when others => null;
    --   end case;
    -- when others => null;
    -- end case;
  end;

  function powerdwn(r : registers; trap : std_ulogic; rp : pwd_register_type) return std_ulogic is
    variable op : std_logic_vector(1 downto 0);
    variable op3 : std_logic_vector(5 downto 0);
    variable rd  : std_logic_vector(4 downto 0);
    variable pd  : std_ulogic;
  begin
    pd := '0';
    return(pd);
  end;


  function rex_dpc(pcin: pctype; rexen: std_ulogic; rexpos: std_logic_vector(1 downto 0))
    return std_logic_vector is
    variable vpcout: std_logic_vector(31 downto 0);
  begin
    vpcout := pcin(31 downto 2) & rexpos(0) & rexen;
    if rexpos(1)='0' then
      vpcout(31 downto 2) := vpcout(31 downto 2)-1;
    end if;
    return vpcout;
  end;

  function rex_regunp(rn: std_logic_vector(3 downto 0))
    return std_logic_vector is
    variable y: std_logic_vector(4 downto 0);
  begin
    y := "00" & rn(2 downto 0);
    y(4) := rn(3) or rn(2);
    y(3) := rn(3) or (not rn(2));
    return y;
  end rex_regunp;

  signal dummy : std_ulogic;
  signal cpu_index : std_logic_vector(3 downto 0);
  signal disasen : std_ulogic;

begin

  BPRED <= '0' when bp = 0 else '1' when bp = 1 else not (r.w.s.dbp or r.d.rexen);
  BLOCKBPMISS <= '0' when bp = 0 else '1' when bp = 1 else r.w.s.dbprepl;

  comb : process(ico, dco, rfo, r, wpr, ir, dsur, rstn, holdn, irqi, dbgi, fpo, cpo, tbo, tbo_2p,
                 mulo, divo, dummy, rp, BPRED, BLOCKBPMISS)

  variable v    : registers;
  variable vp  : pwd_register_type;
  variable vwpr : watchpoint_registers;
  variable vdsu : dsu_registers;
  variable fe_pc, fe_npc :  std_logic_vector(31 downto PCLOW);
  variable npc  : std_logic_vector(31 downto PCLOW);
  variable de_raddr1, de_raddr2 : std_logic_vector(9 downto 0);
  variable de_rs2, de_rd : std_logic_vector(4 downto 0);
  variable de_hold_pc, de_branch, de_ldlock : std_ulogic;
  variable de_cwp, de_rcwp : cwptype;
  variable de_inull : std_ulogic;
  variable de_ren1, de_ren2 : std_ulogic;
  variable de_wcwp : std_ulogic;
  variable de_inst1, de_inst : word;
  variable de_icc : std_logic_vector(3 downto 0);
  variable de_fbranch, de_cbranch : std_ulogic;
  variable de_rs1mod : std_ulogic;
  variable de_bpannul : std_ulogic;
  variable de_fins_hold : std_ulogic;
  variable de_iperr : std_ulogic;
  variable de_rexen, de_nrexen, de_rexhold, de_rexbubble, de_rexbaddr1 : std_ulogic;
  variable de_rexmaskpv, de_rexnostep : std_ulogic;
  variable de_rexillinst: std_ulogic;
  variable de_nbufpos16: std_logic_vector(1 downto 0);
  variable de_ncnt16: std_logic_vector(0 downto 0);
  variable de_pcout: std_logic_vector(31 downto 0);
  variable de_reximmexp: std_ulogic;
  variable de_reximmval: std_logic_vector(31 downto 13);

  variable ra_op1, ra_op2 : word;
  variable ra_div : std_ulogic;
  variable ra_bpmiss : std_ulogic;
  variable ra_bpannul : std_ulogic;

  variable ex_jump, ex_link_pc : std_ulogic;
  variable ex_jump_address : pctype;
  variable ex_add_res : std_logic_vector(33 downto 0);
  variable ex_shift_res, ex_logic_res, ex_misc_res : word;
  variable ex_edata, ex_edata2 : word;
  variable ex_dci : dc_in_type;
  variable ex_force_a2, ex_load, ex_ymsb : std_ulogic;
  variable ex_op1, ex_op2, ex_result, ex_result2, ex_result3, mul_op2 : word;
  variable ex_shcnt : std_logic_vector(4 downto 0);
  variable ex_dsuen : std_ulogic;
  variable ex_ldbp2 : std_ulogic;
  variable ex_sari : std_ulogic;
  variable ex_bpmiss : std_ulogic;

  variable ex_cdata : std_logic_vector(31 downto 0);
  variable ex_mulop1, ex_mulop2 : std_logic_vector(32 downto 0);

  variable me_bp_res : word;
  variable me_inull, me_nullify, me_nullify2 : std_ulogic;
  variable me_iflush : std_ulogic;
  variable me_newtt : std_logic_vector(5 downto 0);
  variable me_asr18 : word;
  variable me_signed : std_ulogic;
  variable me_size, me_laddr : std_logic_vector(1 downto 0);
  variable me_icc : std_logic_vector(3 downto 0);


  variable xc_result : word;
  variable xc_df_result : word;
  variable xc_waddr : std_logic_vector(9 downto 0);
  variable xc_exception, xc_wreg : std_ulogic;
  variable xc_trap_address : pctype;
  variable xc_newtt, xc_vectt : std_logic_vector(7 downto 0);
  variable xc_trap : std_ulogic;
  variable xc_fpexack : std_ulogic;
  variable xc_rstn, xc_halt : std_ulogic;
  variable xc_inull : std_ulogic;
  variable xc_mmucacheclr : std_ulogic;
  variable xc_wimmask: std_logic_vector(NWIN-1 downto 0);
  variable xc_trapcwp: cwptype;

  variable diagdata : word;
  variable tbufi : tracebuf_in_type;
  variable tbufi_2p : tracebuf_2p_in_type;
  variable dbgm : std_ulogic;
  variable fpcdbgwr : std_ulogic;
  variable vfpi : fpc_in_type;
  variable dsign : std_ulogic;
  variable pwrd, sidle : std_ulogic;
  variable vir : irestart_register;
  variable xc_dflushl  : std_ulogic;
  variable xc_dcperr : std_ulogic;
  variable st : std_ulogic;
  variable icnt, fcnt : std_ulogic;
  variable tbufcntx : std_logic_vector(TBUFBITS-1 downto 0);
  variable tovx : std_ulogic;
  variable bpmiss : std_ulogic;
  variable pccomp : std_logic_vector(3 downto 0);

  begin

    v := r; vwpr := wpr; vdsu := dsur; vp := rp;
    xc_fpexack := '0'; sidle := '0';
    fpcdbgwr := '0'; vir := ir; xc_rstn := rstn;
    de_pcout := rex_dpc(r.d.pc, r.d.rexen, r.d.rexpos);

-----------------------------------------------------------------------
-- EXCEPTION STAGE
-----------------------------------------------------------------------

    xc_exception := '0'; xc_halt := '0'; icnt := '0'; fcnt := '0';
    xc_waddr := (others => '0');
    xc_waddr(RFBITS-1 downto 0) := r.x.ctrl.rd(RFBITS-1 downto 0);
    xc_trap := r.x.mexc or r.x.ctrl.trap;
    v.x.nerror := rp.error; xc_dflushl := '0';
    xc_mmucacheclr := '0';
    xc_inull := '0';

    -- Gets trap address of evec (NOT COMPLETY IMPLEMENTED)
    xc_trap_address := r.w.s.evec(31 downto 2);

    xc_wreg := '0'; v.x.annul_all := '0';

    if (not r.x.ctrl.annul and r.x.ctrl.ld) = '1' then
      if (lddel = 2) then
        xc_result := ld_align(r.x.data, r.x.set, r.x.dci.size, r.x.laddr, r.x.dci.signed);
      else
        xc_result := r.x.data(0);
      end if;
    elsif MACEN and MACPIPE and ((not r.x.ctrl.annul and r.x.mac) = '1') then
      xc_result := mulo.result(31 downto 0);
    else xc_result := r.x.result; end if;
    xc_df_result := xc_result;

    xc_wimmask := (others => '0');
    if RFPART then
      for x in NWIN-1 downto 1 loop
        if unsigned(r.w.s.cwpmax) < to_unsigned(x,NWINLOG2) then xc_wimmask(x) := '1'; end if;
      end loop;
    end if;

    xc_trapcwp := r.w.s.cwp;

    if DBGUNIT
    then
      dbgm := dbgexc(r, dbgi, xc_trap, xc_vectt, dsur);
      if (dbgi.dsuen and dbgi.dbreak) = '0'then v.x.debug := '0'; end if;
    else dbgm := '0'; v.x.debug := '0'; end if;
    if PWRD2 then pwrd := powerdwn(r, xc_trap, rp); else pwrd := '0'; end if;

    -- Processor current state
    case r.x.rstate is
    when run =>
      if (dbgm
      ) /= '0' then
        v.x.annul_all := '1'; vir.addr := r.x.ctrl.pc;
        v.x.rstate := dsu1;
          v.x.debug := '1';
        v.x.npc := npc_find(r);
        vdsu.tt := xc_vectt; vdsu.err := dbgerr(r, dbgi, xc_vectt);
      elsif ((pwrd = '1') or (smp/=0 and irqi.forceerr='1')) and (ir.pwd = '0') then
        v.x.annul_all := '1'; vir.addr := r.x.ctrl.pc;
        v.x.rstate := dsu1; v.x.npc := npc_find(r); vp.pwd := '1';
      elsif (r.x.ctrl.annul or xc_trap) = '0' then
        xc_wreg := r.x.ctrl.wreg;
        sp_write (r, wpr, v.w.s, vwpr);
        vir.pwd := '0';
        if (r.x.ctrl.pv and not r.x.debug) = '1' then
          icnt := holdn;
          -- if (r.x.ctrl.inst(31 downto 30) = FMT3) and
          --       ((r.x.ctrl.inst(24 downto 19) = FPOP1) or
          --        (r.x.ctrl.inst(24 downto 19) = FPOP2))
          -- then fcnt := holdn; end if;
        end if;
      elsif ((not r.x.ctrl.annul) and xc_trap) = '1' then
        xc_exception := '1';
        xc_result := (others => '0'); xc_result(31 downto PCLOW) := r.x.ctrl.pc(31 downto PCLOW);
        xc_wreg := '1'; v.w.s.tt := xc_vectt; v.w.s.ps := r.w.s.s;
        v.w.s.s := '1'; v.x.annul_all := '1'; v.x.rstate := trap;
        xc_waddr := (others => '0');
        xc_waddr(NWINLOG2 + 3  downto 0) :=  xc_trapcwp & "0001";
        v.x.npc := npc_find(r);
        fpexack(r, xc_fpexack);
        if r.w.s.et = '0' then
--        v.x.rstate := dsu1; xc_wreg := '0'; vp.error := '1';
          xc_wreg := '0';
        end if;
      end if;
    when trap =>
      xc_result := npc_gen(r,de_pcout); xc_wreg := '1';
      xc_waddr := (others => '0');
      xc_waddr(NWINLOG2 + 3  downto 0) :=  xc_trapcwp & "0010";
      if r.w.s.et = '1' then
        v.w.s.et := '0'; v.x.rstate := run;
      else
        xc_inull := '1';
        v.x.rstate := dsu1; xc_wreg := '0'; vp.error := '1';
      end if;
    when dsu1 =>
      xc_exception := '1'; v.x.annul_all := '1';
      xc_trap_address(31 downto PCLOW) := r.f.pc;
      if DBGUNIT or PWRD2 or (smp /= 0)
      then
        xc_trap_address(31 downto PCLOW) := ir.addr;
        vir.addr := npc_gen(r,de_pcout)(31 downto PCLOW);
        v.x.rstate := dsu2;
      end if;
      if DBGUNIT then v.x.debug := r.x.debug; end if;
    when dsu2 =>
      xc_exception := '1'; v.x.annul_all := '1';
      xc_trap_address(31 downto PCLOW) := r.f.pc;
      if DBGUNIT or PWRD2 or (smp /= 0)
      then
        sidle := (rp.pwd or rp.error) and ico.idle and dco.idle and not r.x.debug;
        if DBGUNIT then
          if dbgi.reset = '1' then
            if smp /=0 then vp.pwd := not irqi.rstrun; else vp.pwd := '0'; end if;
            vp.error := '0';
          end if;
          if (dbgi.dsuen and dbgi.dbreak) = '1'then v.x.debug := '1'; end if;
          diagwr(r, dsur, ir, dbgi, wpr, v.w.s, vwpr, vdsu.asi, xc_trap_address,
               vir.addr, vdsu.tbufcnt, vdsu.tfilt,
               xc_wreg, xc_waddr, xc_result, fpcdbgwr);
          xc_halt := dbgi.halt;
        end if;
        if smp/=0 and (rp.pwd or rp.error)='1' and irqi.pwdsetaddr='1' then
          xc_trap_address(31 downto PCLOW) := ir.addr;
          vir.addr := (others => '0');
          vir.addr(31 downto 2) := irqi.pwdnewaddr;
        end if;
        if (smp /= 0) and irqi.forceerr='1' then
          vp.error := '1'; v.w.s.et := '0'; v.w.s.s := '1';
          xc_mmucacheclr := '1';
        end if;
        if r.x.ipend = '1' then vp.pwd := '0'; end if;
        if (rp.error or rp.pwd or r.x.debug or xc_halt) = '0' then
          v.x.rstate := run; v.x.annul_all := '0'; vp.error := '0';
          xc_trap_address(31 downto PCLOW) := ir.addr; v.x.debug := '0';
          vir.pwd := '1';
          if REX=1 and r.f.pc(2-2*REX)='1' then xc_exception:='0'; end if;
        end if;
        if (smp /= 0) and (irqi.resume = '1') then
          vp.pwd := '0'; vp.error := '0';
        end if;
        if SVT/=0 and irqi.svtclrtt='1' then
          v.w.s.tt := (others => '0');
        end if;
      end if;
    when others =>
    end case;

    if DBGUNIT and TRACEBUF then
      if (dbgi.dsuen and dbgi.denable and dbgi.dwrite) = '1' then
        if (dbgi.daddr(23 downto 20) = "0001" and dbgi.daddr(16) = '1' and
            dbgi.daddr(2) = '1') then
          vdsu.tov     := dbgi.ddata(23);
          vdsu.tlim    := dbgi.ddata(26 downto 24);
          vdsu.tovb    := dbgi.ddata(27);
          for i in 0 to 3 loop
            if (NWP > i) then
              vdsu.itfiltmask(i)   := dbgi.ddata(28+i);
              vdsu.itfiltmask(4+i) := dbgi.ddata(16+i);
            else
                vdsu.itfiltmask(i)   := '0';
              vdsu.itfiltmask(4+i) := '0';
            end if;
          end loop;
          vdsu.asifiltmask := dbgi.ddata(15 downto 0);
        end if;
      end if;
    end if;

    dci.flushl <= xc_dflushl;
    dci.mmucacheclr <= xc_mmucacheclr;

    -- Not changed
    irq_intack(r, holdn, v.x.intack);
    itrace(r, dsur, vdsu, wpr,xc_result, xc_exception, dbgi, rp.error, xc_trap, tbufcntx, tovx, tbufi, tbufi_2p, '0', xc_dcperr);
    vdsu.tbufcnt := tbufcntx; vdsu.tov := tovx;

    v.w.except := xc_exception; v.w.result := xc_result;
    if (r.x.rstate = dsu2) then v.w.except := '0'; end if;
    v.w.wa := xc_waddr(RFBITS-1 downto 0); v.w.wreg := xc_wreg and holdn;

    rfi.wdata <= xc_result; rfi.waddr <= xc_waddr;

    irqo.intack <= r.x.intack and holdn;
    irqo.irl <= r.w.s.tt(3 downto 0);
    irqo.pwd <= rp.pwd;
    irqo.fpen <= r.w.s.ef;
    irqo.err <= r.x.nerror;
    dbgo.halt <= xc_halt;
    dbgo.pwd  <= rp.pwd;
    dbgo.idle <= sidle;
    dbgo.icnt <= icnt;
    dbgo.fcnt <= fcnt;
    dbgo.optype <= r.x.ctrl.inst(31 downto 30) & r.x.ctrl.inst(24 downto 21);
    dci.intack <= r.x.intack and holdn;

    if (not RESET_ALL) and (xc_rstn = '0') then
      v.w.except := RRES.w.except; v.w.s.et := RRES.w.s.et;
      v.w.s.svt := RRES.w.s.svt; v.w.s.dwt := RRES.w.s.dwt;
      v.w.s.ef := RRES.w.s.ef;

      if need_extra_sync_reset(fabtech) /= 0 then
        v.w.s.cwp := RRES.w.s.cwp;
        v.w.s.icc := RRES.w.s.icc;
      end if;
      v.w.s.dbp := RRES.w.s.dbp;
      v.w.s.dbprepl := RRES.w.s.dbprepl;
      v.w.s.rexdis := RRES.w.s.rexdis;
      v.w.s.rextrap := RRES.w.s.rextrap;
      v.w.s.tba := RRES.w.s.tba;
      v.x.annul_all := RRES.x.annul_all;
      v.x.rstate := RRES.x.rstate; vir.pwd := IRES.pwd;
      vp.pwd := PRES.pwd; v.x.debug := RRES.x.debug;
      v.x.nerror := RRES.x.nerror;
      if svt = 1 then v.w.s.tt := RRES.w.s.tt; end if;
      if DBGUNIT then
        if (dbgi.dsuen and dbgi.dbreak) = '1' then
          v.x.rstate := dsu1; v.x.debug := '1';
        end if;
        vdsu.tfilt := DRES.tfilt; vdsu.tovb := DRES.tovb;
      end if;
      if (smp /= 0) and (irqi.rstrun = '0') and (rstn = '0') then
        v.x.rstate := dsu1; vp.pwd := '1';
      end if;
      v.x.npc := "100";
    end if;

    -- kill off unused regs
    if not FPEN then v.w.s.ef := '0'; end if;
    if not CPEN then v.w.s.ec := '0'; end if;


-----------------------------------------------------------------------
-- MEMORY STAGE
-----------------------------------------------------------------------

    v.x.ctrl := r.m.ctrl; v.x.dci := r.m.dci;
    v.x.ctrl.rett := r.m.ctrl.rett and not r.m.ctrl.annul;
    v.x.mac := r.m.mac; v.x.laddr := r.m.result(1 downto 0);
    v.x.ctrl.annul := r.m.ctrl.annul or v.x.annul_all;
    v.x.rs1 := r.m.rs1;
    st := '0';

    -- Mul nos implemented
    mul_res(r, v.w.s.asr18, v.x.result, v.x.y, me_asr18, me_icc);

    -- Memory instruction and irq traps disabled
    -- mem_trap(r, wpr, v.x.ctrl.annul, holdn, v.x.ctrl.trap, me_iflush,
    --         me_nullify, v.m.werr, v.x.ctrl.tt);
    -- me_newtt := v.x.ctrl.tt;

    -- irq_trap(r, ir, irqi.irl, v.x.ctrl.annul, v.x.ctrl.pv, v.x.ctrl.trap, me_newtt, me_nullify,
    --         v.m.irqen, v.m.irqen2, me_nullify2, v.x.ctrl.trap,
    --         v.x.ipend, v.x.ctrl.tt);


    if (r.m.ctrl.ld or st or not dco.mds) = '1' then
      for i in 0 to dsets-1 loop
        v.x.data(i) := dco.data(i);
      end loop;
      v.x.set := dco.set(DSETMSB downto 0);
      if dco.mds = '0' then
        me_size := r.x.dci.size; me_laddr := r.x.laddr; me_signed := r.x.dci.signed;
      else
        me_size := v.x.dci.size; me_laddr := v.x.laddr; me_signed := v.x.dci.signed;
      end if;
      if (lddel /= 2) then
        v.x.data(0) := ld_align(v.x.data, v.x.set, me_size, me_laddr, me_signed);
      end if;
    end if;
    if (not RESET_ALL) and (is_fpga(fabtech) = 0) and (xc_rstn = '0') then
      v.x.data := (others => (others => '0')); --v.x.ldc := '0';
    end if;
    v.x.mexc := dco.mexc;

    v.x.icc := me_icc;
    v.x.ctrl.wicc := r.m.ctrl.wicc and not v.x.annul_all;

    if MACEN and ((v.x.ctrl.annul or v.x.ctrl.trap) = '0') then
      v.w.s.asr18 := me_asr18;
    end if;

    if (r.x.rstate = dsu2)
    then
      me_nullify2 := '0'; v.x.set := dco.set(DSETMSB downto 0);
    end if;


    if (not RESET_ALL) and (xc_rstn = '0') then
        v.x.ctrl.trap := '0'; v.x.ctrl.annul := '1';
    end if;

    dci.maddress <= r.m.result;
    dci.enaddr   <= r.m.dci.enaddr;
    dci.asi      <= r.m.dci.asi;
    dci.size     <= r.m.dci.size;
    dci.lock     <= (r.m.dci.lock and not r.m.ctrl.annul);
    dci.read     <= r.m.dci.read;
    dci.write    <= r.m.dci.write;
    dci.flush    <= me_iflush;
    dci.dsuen    <= r.m.dci.dsuen;
    dci.msu    <= r.m.su;
    dci.esu    <= r.e.su;
    dbgo.ipend <= v.x.ipend or irqi.forceerr or irqi.pwdsetaddr;

    v.x.itrhit := r.m.itrhit;
    --ASI filter based on the last digit of the ASI
    v.x.asifilt := '0';
    if notx(r.m.ctrl.inst) then
      v.x.asifilt := not(dsur.asifiltmask(to_integer(unsigned(r.m.ctrl.inst(8 downto 5)))));
    end if;

-----------------------------------------------------------------------
-- EXECUTE STAGE
-----------------------------------------------------------------------

    v.m.ctrl := r.e.ctrl; ex_op1 := r.e.op1; ex_op2 := r.e.op2;
    v.m.ctrl.rett := r.e.ctrl.rett and not r.e.ctrl.annul;
    v.m.ctrl.wreg := r.e.ctrl.wreg and not v.x.annul_all;
    ex_ymsb := r.e.ymsb; mul_op2 := ex_op2; ex_shcnt := r.e.shcnt;
    v.e.cwp := r.a.cwp; ex_sari := r.e.sari;
    v.m.su := r.e.su;

    -- MUL related
    if MULTYPE = 3 then v.m.mul := r.e.mul;
    else v.m.mul := '0'; end if;

    -- Related to load instructions, do not remove
    if lddel = 1 then
      if r.e.ldbp1 = '1' then
        ex_op1 := r.x.data(0);
        ex_sari := r.x.data(0)(31) and r.e.ctrl.inst(19) and r.e.ctrl.inst(20);
      end if;
      if r.e.ldbp2 = '1' then
        ex_op2 := r.x.data(0); ex_ymsb := r.x.data(0)(0);
        mul_op2 := ex_op2; ex_shcnt := r.x.data(0)(4 downto 0);
        if r.e.invop2 = '1' then
          ex_op2 := not ex_op2; ex_shcnt := not ex_shcnt;
        end if;
      end if;
    end if;

    -- Adder
    ex_add_res := ("0" & ex_op1 & '1') + ("0" & ex_op2 & r.e.alucin);
    -- Check align (used by mem instructions)
    if ex_add_res(2 downto 1) = "00" then v.m.nalign := '0';
    else v.m.nalign := '1'; end if;

    -- Data cache
    dcache_gen(r, v, ex_dci, ex_link_pc, ex_jump, ex_force_a2, ex_load, v.m.casa);

    -- Jump address
    if(r.e.alusel = EXE_RES_ADD) then                       -- JALR
        ex_jump_address := ex_add_res(32 downto PCLOW+1);
    else                                                    -- JAL
        ex_jump_address := ex_add_res(32 downto PCLOW+1) + r.e.ctrl.pc(31 downto PCLOW);
    end if;

    -- Logic instructions
    logic_op(r, ex_op1, ex_op2, v.x.y, ex_ymsb, ex_logic_res, v.m.y);

    -- Shift instructions
    ex_shift_res := shift(r, ex_op1, ex_op2, ex_shcnt, ex_sari);

    -- Other instructions
    misc_op(r, wpr, ex_op1, ex_op2, xc_df_result, v.x.y, xc_wimmask, ex_misc_res, ex_edata);

    -- Select ALU outputs
    alu_select(r, ex_add_res, ex_op1, ex_op2, ex_shift_res, ex_logic_res,
        ex_misc_res, ex_result, me_icc, v.m.icc, v.m.divz, v.m.casaz);

    -- DSU outs
    dbg_cache(holdn, dbgi, r, dsur, ex_result, ex_dci, ex_result2, v.m.dci);

    -- Float point (not implemented)
    fpstdata(r, ex_edata, ex_result2, fpo.data, ex_edata2, ex_result3);

    -- Pass rs1 (may be used in future for special instructions)
    v.m.rs1 := ex_op1;
    -- ALU result
    v.m.result := ex_result3;

    -- Register windows related, will be removed
    cwp_ex(r, v.m.wcwp, v.m.wawp);

    dci.nullify <= '0';

    -- Mul related, not implemented
    --ex_mulop1 := (ex_op1(31) and r.e.ctrl.inst(19)) & ex_op1;
    --ex_mulop2 := (mul_op2(31) and r.e.ctrl.inst(19)) & mul_op2;

    if is_fpga(fabtech) = 0 and (r.e.mul = '0') then     -- power-save for mul
--    if (r.e.mul = '0') then
        ex_mulop1 := (others => '0'); ex_mulop2 := (others => '0');
    end if;

    -- Updates pipeline registers
    v.m.ctrl.annul := v.m.ctrl.annul or v.x.annul_all;
    v.m.ctrl.wicc := r.e.ctrl.wicc and not v.x.annul_all;
    v.m.mac := r.e.mac;
    dci.eenaddr  <= v.m.dci.enaddr;
    if (DBGUNIT and (r.x.rstate = dsu2)) then v.m.ctrl.ld := '1'; end if;
    dci.eaddress <= ex_add_res(32 downto 1);
    dci.edata <= ex_edata2;
    -- BP disabled
    --bp_miss_ex(r, r.m.icc, ex_bpmiss, ra_bpannul);

    v.m .itrhit := r.e.itrhit;

-----------------------------------------------------------------------
-- REGFILE STAGE
-----------------------------------------------------------------------

--Resource Sharing between hardware breakpoint detection
--and instruction trace buffer filter
    pccompare(r,wpr,pccomp);
    v.e.itrhit := itrhitc(dsur,pccomp);

    v.e.ctrl := r.a.ctrl; v.e.jmpl := r.a.jmpl and not r.a.ctrl.trap;
    v.e.ctrl.annul := r.a.ctrl.annul or ra_bpannul or v.x.annul_all;
    v.e.ctrl.rett := r.a.ctrl.rett and not r.a.ctrl.annul and not r.a.ctrl.trap;
    v.e.ctrl.wreg := r.a.ctrl.wreg and not (ra_bpannul or v.x.annul_all);
    v.e.su := r.a.su; v.e.et := r.a.et;
    v.e.ctrl.wicc := r.a.ctrl.wicc and not (ra_bpannul or v.x.annul_all);
    v.e.rfe1 := r.a.rfe1; v.e.rfe2 := r.a.rfe2;
    v.e.ctrl.pv := r.a.ctrl.pv or (ra_bpannul and r.a.bpimiss);

    -- Exception
    exception_detect(r, wpr, dbgi, r.a.ctrl.trap, r.a.ctrl.tt,
                     pccomp, v.e.ctrl.trap, v.e.ctrl.tt);
    -- Operands muxes for ALU
    op_mux(r, rfo.data1, ex_result3, v.x.result, xc_df_result, zero32,
        r.a.rsel1, v.e.ldbp1, ra_op1, '0');
    op_mux(r, rfo.data2,  ex_result3, v.x.result, xc_df_result, r.a.imm,
        r.a.rsel2, ex_ldbp2, ra_op2, '1');

    -- Selects ALU operation
    alu_op(r, ra_op1, ra_op2, v.m.icc, v.m.y(0), ex_ldbp2, v.e.op1, v.e.op2,
           v.e.aluop, v.e.alusel, v.e.aluadd, v.e.shcnt, v.e.sari, v.e.shleft,
           v.e.ymsb, v.e.mul, ra_div, v.e.mulstep, v.e.mac, v.e.ldbp2, v.e.invop2
    );

    -- Carry for ALU adder
    cin_gen(r, v.m.icc(0), v.e.alucin);

    -- BP disabled
    --bp_miss_ra(r, ra_bpmiss, de_bpannul);
    --v.e.bp := r.a.bp and not ra_bpmiss;


-----------------------------------------------------------------------
-- DECODE STAGE
-----------------------------------------------------------------------

    if irqlat /= 0 then
      if irqi.irl="0000" and r.d.irqstart='0' then
        v.d.irqlatctr := (others => '0');
        v.d.irqlatmet := '0';
      else
        if r.d.irqlatmet='0' then
          v.d.irqlatctr := std_logic_vector(unsigned(r.d.irqlatctr)+1);
        end if;
        if r.d.irqlatctr=dco.irqlatctrl then v.d.irqlatmet:='1'; end if;
      end if;
    end if;

    if ISETS > 1 then de_inst1 := r.d.inst(conv_integer(r.d.set));
    else de_inst1 := r.d.inst(0); end if;

    de_nrexen := '0'; de_nbufpos16:="10"; de_ncnt16:="0"; de_rexhold:='0';
    de_rexbubble := '0'; de_rexbaddr1:='0'; de_reximmexp:='0'; de_reximmval:=(others => '0');
    de_rexmaskpv := '0'; de_rexillinst:='0'; de_rexnostep:='0';

    -- Swap endianess, Leon3 was designed for big-endian
    de_inst(7 downto 0) := de_inst1(31 downto 24);
    de_inst(15 downto 8) := de_inst1(23 downto 16);
    de_inst(23 downto 16) := de_inst1(15 downto 8);
    de_inst(31 downto 24) := de_inst1(7 downto 0);

    de_icc := r.m.icc; v.a.cwp := r.d.cwp;
    -- May be removed
    su_et_select(r, v.w.s.ps, v.w.s.s, v.w.s.et, v.a.su, v.a.et);

    -- ICC is updated on branches for RV32I
    wicc_y_gen(r, de_inst, v.a.ctrl.wicc, v.a.ctrl.wy);
    v.a.ctrl.wy := '0';

    de_rcwp := r.d.cwp;
    cwp_ctrl(r, de_rcwp, v.w.s.wim, de_inst, de_cwp, v.a.wovf, v.a.wunf, de_wcwp);

    -- Get rs1 and rs2
    rs1_gen(r, de_inst, v.a.rs1, de_rs1mod);
    de_rs2 := de_inst(24 downto 20);

    -- Get registers address based on the LEON3 register window system
    de_raddr1 := (others => '0'); de_raddr2 := (others => '0');
    de_raddr1(4 downto 0) := v.a.rs1(4 downto 0);
    de_raddr2(4 downto 0) := de_rs2(4 downto 0);

    v.a.rfa1 := de_raddr1(RFBITS-1 downto 0);
    v.a.rfa2 := de_raddr2(RFBITS-1 downto 0);

    -- Get rd and set write enable and other LEON3 signals
    rd_gen(r, de_inst, v.a.ctrl.wreg, v.a.ctrl.ld, de_rd, de_rexen);
    v.a.ctrl.rd(4 downto 0) := de_rd(4 downto 0);

    -- No RISC-V FP unit
--    fpbranch(de_inst, fpo.cc, de_fbranch);
--    fpbranch(de_inst, cpo.cc, de_cbranch);

    -- Get immediate
    v.a.imm := imm_data(r, de_inst);
    de_iperr := '0';

    -- Generates control signals
    lock_gen(r, de_rs2, de_rd, v.a.rfa1, v.a.rfa2, v.a.ctrl.rd, de_inst,
        fpo.ldlock, v.e.mul, ra_div, de_wcwp, v.a.ldcheck1, v.a.ldcheck2, de_ldlock,
        v.a.ldchkra, v.a.ldchkex, v.a.bp, v.a.nobp, de_fins_hold, de_iperr, ico.bpmiss);

    -- Generates behavior of next cycle based on current instruction
    ic_ctrl(r, de_inst, v.x.annul_all, de_ldlock, de_rexhold, de_rexbubble, de_rexmaskpv, de_rexillinst, branch_true(r.d.cnt, de_icc, de_inst),
        de_fbranch, de_cbranch, fpo.ccv, cpo.ccv, v.d.cnt, v.d.pc, de_branch,
        v.a.ctrl.annul, v.d.annul, v.a.jmpl, de_inull, v.d.pv, v.a.ctrl.pv,
        de_hold_pc, v.a.ticc, v.a.ctrl.rett, v.a.mulstart, v.a.divstart,
        ra_bpmiss, ex_bpmiss, de_iperr, ico.bpmiss, ico.eocl);
    v.d.pcheld := de_hold_pc;

    -- Branch prediction disabled
    --v.a.bp := v.a.bp and not v.a.ctrl.annul;
    --v.a.nobp := v.a.nobp and not v.a.ctrl.annul;

    v.a.ctrl.inst := de_inst;
    v.a.decill := de_rexillinst or (de_rexen and r.w.s.rextrap);

    cwp_gen(r, v, v.a.ctrl.annul, de_wcwp, de_cwp, v.d.cwp, v.d.awp, v.d.aw, v.d.paw, v.d.stwin, v.d.cwpmax);

    v.d.inull := ra_inull_gen(r, v);

    -- Select operand control signals of ALU
    op_find(r, v.a.ldchkra, v.a.ldchkex, v.a.rs1, v.a.rfa1,
            false, v.a.rfe1, v.a.rsel1, v.a.ldcheck1);
    op_find(r, v.a.ldchkra, v.a.ldchkex, de_rs2, v.a.rfa2,
            imm_select(de_inst,(de_rexen and not r.w.s.rexdis)), v.a.rfe2, v.a.rsel2, v.a.ldcheck2);

    -- Updates signals
    v.a.ctrl.wicc := v.a.ctrl.wicc and (not v.a.ctrl.annul);
    v.a.ctrl.wreg := v.a.ctrl.wreg and (not v.a.ctrl.annul);
    v.a.ctrl.rett := v.a.ctrl.rett and (not v.a.ctrl.annul);
    v.a.ctrl.wy := v.a.ctrl.wy and (not v.a.ctrl.annul);

    v.a.ctrl.trap := r.d.mexc;
    v.a.ctrl.tt := "000000";
    -- Memory exception
      if r.d.mexc = '1' then
        v.a.ctrl.tt := "00" & EXC_AFAULT_INST;
      end if;
    v.a.ctrl.pc := de_pcout(31 downto PCLOW);
    v.a.ctrl.cnt := r.d.cnt;
    v.a.step := r.d.step;

    if holdn = '0' and not RF_READHOLD then
      de_raddr1(RFBITS-1 downto 0) := r.a.rfa1;
      de_raddr2(RFBITS-1 downto 0) := r.a.rfa2;
      de_ren1 := r.a.rfe1; de_ren2 := r.a.rfe2;
    elsif holdn='0' and RF_READHOLD then
      de_ren1 := '0'; de_ren2 := '0';
    else
      de_ren1 := v.a.rfe1; de_ren2 := v.a.rfe2;
    end if;

    if DBGUNIT then
      if (dbgi.denable = '1') and (r.x.rstate = dsu2) then
        de_raddr1(RFBITS-1 downto 0) := dbgi.daddr(RFBITS+1 downto 2); de_ren1 := '1';
        de_raddr2 := de_raddr1; de_ren2 := '1';
      end if;
      v.d.step := dbgi.step and not r.d.annul and not de_rexnostep;
    end if;

    if de_hold_pc='0' then
      v.d.rexen := de_nrexen or de_rexen;
      v.d.rexpos := de_nbufpos16;
      v.d.rexcnt := de_ncnt16;
    end if;
    if (de_rexhold='1' and de_branch='0') then de_hold_pc:='1'; de_inull:='1'; end if;
    if v.x.annul_all='1' then
      v.d.rexen := '0';
      v.d.rexpos := "10";
    end if;

    rfi.wren <= (xc_wreg and holdn);
    rfi.raddr1 <= de_raddr1; rfi.raddr2 <= de_raddr2;
    rfi.ren1 <= de_ren1;
    rfi.ren2 <= de_ren2;
    ici.inull <= de_inull or xc_inull;
    ici.flush <= me_iflush;
    v.d.divrdy := divo.nready;
    ici.fline <= r.x.ctrl.pc(31 downto 3);
    ici.nobpmiss <= '0';--(r.a.bp or r.e.bp) and BLOCKBPMISS;
    dbgo.bpmiss <= bpmiss and holdn;
    if (xc_rstn = '0') then
      v.d.cnt := (others => '0');
      v.d.rexen := '0';
      v.d.rexpos := "10";
      if need_extra_sync_reset(fabtech) /= 0 then
        v.d.cwp := (others => '0');
      end if;
    end if;

-----------------------------------------------------------------------
-- FETCH STAGE
-----------------------------------------------------------------------

    if irqlat /= 0 then
      v.d.irqstart := r.d.irqstart and not r.d.irqlatmet;
      if r.x.rstate=trap and r.w.s.tt(7 downto 4)="0001" then
        v.d.irqstart := '1';
      end if;
      if (xc_rstn = '0') then v.d.irqstart:='0'; end if;
    end if;

    -- Slect next PC based on branch predictions (which are disabled)
    bpmiss := ex_bpmiss or ra_bpmiss;
    npc := r.f.pc; fe_pc := r.f.pc;
    if ra_bpmiss = '1' then fe_pc := r.d.pc; end if;
    if ex_bpmiss = '1' then fe_pc := r.a.ctrl.pc; end if;
    fe_npc := zero32(31 downto PCLOW);
    fe_npc(31 downto 2) := fe_pc(31 downto 2) + 1;    -- Address incrementer

    v.a.bpimiss := '0';
    if (xc_rstn = '0') then
      if (not RESET_ALL) then
        v.f.pc := (others => '0'); v.f.branch := '0';
        if DYNRST then v.f.pc(31 downto 12) := irqi.rstvec;
        else
          v.f.pc(31 downto 12) := conv_std_logic_vector(rstaddr, 20);
        end if;
      end if;
    elsif xc_exception = '1' then       -- exception
      v.f.branch := '1'; v.f.pc := xc_trap_address;
      npc := v.f.pc;
    elsif de_hold_pc = '1' then         -- 2 or more cycles instructions
      v.f.pc := r.f.pc; v.f.branch := r.f.branch;
    --   if bpmiss = '1' then
    --     v.f.pc := fe_npc; v.f.branch := '1';
    --     npc := v.f.pc;
      if ex_jump = '1' then
        v.f.pc := ex_jump_address; v.f.branch := '1';
        npc := v.f.pc;
      end if;
    elsif ex_jump = '1' then            -- Jump
      v.f.pc := ex_jump_address; v.f.branch := '1';
      npc := v.f.pc;
    -- elsif (ex_jump and not bpmiss) = '1' then
    --   v.f.pc := ex_jump_address; v.f.branch := '1';
    --   npc := v.f.pc;
    -- elsif (((ico.bpmiss and not r.d.annul) or r.a.bpimiss) and not bpmiss) = '1' then
    --    v.f.pc := r.d.pc; v.f.branch := '1';
    --    npc := v.f.pc;
    --    v.a.bpimiss := ico.bpmiss and not r.d.annul;
    elsif de_branch = '1'               -- Branch
    then
       v.f.pc := branch_address(de_inst, de_pcout(31 downto PCLOW), de_rexbaddr1, r.d.rexen); v.f.branch := '1';
       npc := v.f.pc;
    else
      v.f.branch := '0'; v.f.pc := fe_npc; npc := v.f.pc;
    end if;

    ici.dpc <= r.d.pc(31 downto 2) & "00";
    ici.fpc <= r.f.pc(31 downto 2) & "00";
    ici.rpc <= npc(31 downto 2) & "00";
    ici.fbranch <= r.f.branch;
    ici.rbranch <= v.f.branch;
    ici.su <= v.a.su;


    if (ico.mds and de_hold_pc) = '0' then
      v.d.rexbuf := de_inst1;
      for i in 0 to isets-1 loop
        v.d.inst(i) := ico.data(i);                     -- latch instruction
      end loop;
      v.d.set := ico.set(ISETMSB downto 0);             -- latch instruction
      v.d.mexc := ico.mexc;                             -- latch instruction

    end if;

-----------------------------------------------------------------------
-----------------------------------------------------------------------

    if DBGUNIT then -- DSU diagnostic read
      diagread(dbgi, r, dsur, ir, wpr, dco, tbo, tbo_2p, xc_wimmask, diagdata);
      diagrdy(dbgi.denable, dsur, r.m.dci, dco.mds, ico, vdsu.crdy);
      vdsu.cfc := dsur.cfc(3 downto 0) & r.f.branch;
    end if;

-----------------------------------------------------------------------
-- OUTPUTS
-----------------------------------------------------------------------

    rin <= v; wprin <= vwpr; dsuin <= vdsu; irin <= vir;
    muli.start <= r.a.mulstart and not r.a.ctrl.annul and
        not r.a.ctrl.trap and not ra_bpannul;
    muli.signed <= r.e.ctrl.inst(19);
    muli.op1 <= ex_mulop1; --(ex_op1(31) and r.e.ctrl.inst(19)) & ex_op1;
    muli.op2 <= ex_mulop2; --(mul_op2(31) and r.e.ctrl.inst(19)) & mul_op2;
    muli.mac <= r.e.ctrl.inst(24);
    if MACPIPE then muli.acc(39 downto 32) <= r.w.s.y(7 downto 0);
    else muli.acc(39 downto 32) <= r.x.y(7 downto 0); end if;
    muli.acc(31 downto 0) <= r.w.s.asr18;
    muli.flush <= r.x.annul_all;
    divi.start <= r.a.divstart and not r.a.ctrl.annul and
        not r.a.ctrl.trap and not ra_bpannul;
    divi.signed <= r.e.ctrl.inst(19);
    divi.flush <= r.x.annul_all;
    divi.op1 <= (ex_op1(31) and r.e.ctrl.inst(19)) & ex_op1;
    divi.op2 <= (ex_op2(31) and r.e.ctrl.inst(19)) & ex_op2;
    if (r.a.divstart and not r.a.ctrl.annul) = '1' then
      dsign :=  r.a.ctrl.inst(19);
    else dsign := r.e.ctrl.inst(19); end if;
    divi.y <= (r.m.y(31) and dsign) & r.m.y;
    rpin <= vp;

    if DBGUNIT then
      dbgo.dsu <= '1'; dbgo.dsumode <= r.x.debug; dbgo.crdy <= dsur.crdy(2);
      dbgo.data <= diagdata;
      if TRACEBUF then
        tbi <= tbufi;
        if TRACEBUF_2P then tbi_2p <= tbufi_2p; else tbi_2p <= tracebuf_2p_in_type_none; end if;
      else
        tbi <= tracebuf_in_type_none;
        tbi_2p <= tracebuf_2p_in_type_none;
      end if;
    else
      dbgo.dsu <= '0'; dbgo.data <= (others => '0'); dbgo.crdy  <= '0';
      dbgo.dsumode <= '0'; tbi.addr <= (others => '0');
      tbi.data <= (others => '0'); tbi.enable <= '0';
      tbi.write <= (others => '0');
    end if;
    dbgo.error <= dummy and not r.x.nerror;
    dbgo.istat <= ico.cstat;
    dbgo.dstat <= dco.cstat;
    dbgo.wbhold <= dco.wbhold;
    dbgo.su <= r.w.s.s;
    dbgo.ducnt <= r.w.s.ducnt;

    vfpi := fpc_in_none;
    --if FPEN then
    --   if (r.x.rstate = dsu2) then vfpi.flush := '1'; else vfpi.flush := v.x.annul_all and holdn; end if;
    --   vfpi.exack := xc_fpexack; vfpi.a_rs1 := r.a.rs1; vfpi.d.inst := de_inst;
    --   vfpi.d.cnt := r.d.cnt;
    --   vfpi.d.annul := v.x.annul_all or de_bpannul or r.d.annul or de_fins_hold or (ico.bpmiss and not r.d.pcheld)
    --     ;
    --   if REX=1 then vfpi.d.annul := vfpi.d.annul or de_rexbubble; end if;
    --   vfpi.d.trap := r.d.mexc;
    --   vfpi.d.pc(1 downto 0) := (others => '0'); vfpi.d.pc(31 downto PCLOW) := r.d.pc(31 downto PCLOW);
    --   vfpi.d.pv := r.d.pv;
    --   vfpi.a.pc(1 downto 0) := (others => '0'); vfpi.a.pc(31 downto PCLOW) := r.a.ctrl.pc(31 downto PCLOW);
    --   vfpi.a.inst := r.a.ctrl.inst; vfpi.a.cnt := r.a.ctrl.cnt; vfpi.a.trap := r.a.ctrl.trap;
    --   vfpi.a.annul := r.a.ctrl.annul or (ex_bpmiss and r.e.ctrl.inst(29))
    --     ;
    --   vfpi.a.pv := r.a.ctrl.pv;
    --   vfpi.e.pc(1 downto 0) := (others => '0'); vfpi.e.pc(31 downto PCLOW) := r.e.ctrl.pc(31 downto PCLOW);
    --   vfpi.e.inst := r.e.ctrl.inst; vfpi.e.cnt := r.e.ctrl.cnt; vfpi.e.trap := r.e.ctrl.trap; vfpi.e.annul := r.e.ctrl.annul;
    --   vfpi.e.pv := r.e.ctrl.pv;
    --   vfpi.m.pc(1 downto 0) := (others => '0'); vfpi.m.pc(31 downto PCLOW) := r.m.ctrl.pc(31 downto PCLOW);
    --   vfpi.m.inst := r.m.ctrl.inst; vfpi.m.cnt := r.m.ctrl.cnt; vfpi.m.trap := r.m.ctrl.trap; vfpi.m.annul := r.m.ctrl.annul;
    --   vfpi.m.pv := r.m.ctrl.pv;
    --   vfpi.x.pc(1 downto 0) := (others => '0'); vfpi.x.pc(31 downto PCLOW) := r.x.ctrl.pc(31 downto PCLOW);
    --   vfpi.x.inst := r.x.ctrl.inst; vfpi.x.cnt := r.x.ctrl.cnt; vfpi.x.trap := xc_trap;
    --   vfpi.x.annul := r.x.ctrl.annul; vfpi.x.pv := r.x.ctrl.pv;
    --   if (lddel = 2) then vfpi.lddata := r.x.data(conv_integer(r.x.set)); else vfpi.lddata := r.x.data(0); end if;
    --   if (r.x.rstate = dsu2)
    --   then vfpi.dbg.enable := dbgi.denable;
    --   else vfpi.dbg.enable := '0'; end if;
    --   vfpi.dbg.write := fpcdbgwr;
    --   vfpi.dbg.fsr := dbgi.daddr(22); -- IU reg access
    --   vfpi.dbg.addr := dbgi.daddr(6 downto 2);
    --   vfpi.dbg.data := dbgi.ddata;
    -- end if;
    fpi <= vfpi;
    cpi <= vfpi;      -- dummy, just to kill some warnings ...

  end process;

  preg : process (sclk)
  begin
    if rising_edge(sclk) then
      rp <= rpin;
      if rstn = '0' then
        rp.error <= PRES.error;
        if RESET_ALL then
          if (smp /= 0) and (irqi.rstrun = '0') then
            rp.pwd <= '1';
          else
            rp.pwd <= '0';
          end if;
        end if;
      end if;
    end if;
  end process;

  reg : process (clk)
  begin
    if rising_edge(clk) then
      if (holdn = '1') then
        r <= rin;
      else
        r.x.ipend <= rin.x.ipend;
        r.m.werr <= rin.m.werr;
        if irqlat /= 0 then
          r.d.irqlatctr <= rin.d.irqlatctr;
          r.d.irqlatmet <= rin.d.irqlatmet;
        end if;
        if (holdn or ico.mds) = '0' then
          r.d.inst <= rin.d.inst; r.d.mexc <= rin.d.mexc;
          r.d.set <= rin.d.set;
          r.d.rexpl <= rin.d.rexpl;
        end if;
        if (holdn or dco.mds) = '0' then
          r.x.data <= rin.x.data; r.x.mexc <= rin.x.mexc;
          r.x.set <= rin.x.set;
        end if;
      end if;
      if rstn = '0' then
        if RESET_ALL then
          r <= RRES;
          if DYNRST then
            r.f.pc(31 downto 12) <= irqi.rstvec;
            r.w.s.tba <= irqi.rstvec;
          end if;
          if DBGUNIT then
            if (dbgi.dsuen and dbgi.dbreak) = '1' then
              r.x.rstate <= dsu1; r.x.debug <= '1';
            end if;
          end if;
          if (smp /= 0) and irqi.rstrun = '0' then
            r.x.rstate <= dsu1;
          end if;
        else
          r.w.s.s <= '1'; r.w.s.ps <= '1';
          if need_extra_sync_reset(fabtech) /= 0 then
            r.d.inst <= (others => (others => '0'));
            r.x.mexc <= '0';
          end if;
        end if;
      end if;
      if REX=0 then
        r.d.rexen <= RRES.d.rexen;
        r.d.rexpos <= RRES.d.rexpos;
        r.d.rexbuf <= RRES.d.rexbuf;
        r.d.rexcnt <= RRES.d.rexcnt;
        r.a.getpc <= RRES.a.getpc;
        r.a.decill <= RRES.a.decill;
        r.m.rexnalign <= RRES.m.rexnalign;
        r.a.ctrl.itovr <= RRES.a.ctrl.itovr;
        r.e.ctrl.itovr <= RRES.e.ctrl.itovr;
        r.m.ctrl.itovr <= RRES.m.ctrl.itovr;
        r.x.ctrl.itovr <= RRES.x.ctrl.itovr;
      end if;
      if not REXPIPE then r.d.rexpl <= RRES.d.rexpl; end if;
      if not AWPEN then
        r.w.s.aw <= RRES.w.s.aw;
        r.w.s.paw <= RRES.w.s.paw;
        r.w.s.awp <= RRES.w.s.awp;
        r.d.awp <= RRES.d.awp;
        r.d.aw <= RRES.d.aw;
        r.d.paw <= RRES.d.paw;
        r.a.awp <= RRES.a.awp;
        r.a.aw <= RRES.a.aw;
        r.a.paw <= RRES.a.paw;
        r.m.wawp <= RRES.m.wawp;
      end if;
      if not RFPART then
        r.w.s.stwin <= RRES.w.s.stwin;
        r.w.s.cwpmax <= RRES.w.s.cwpmax;
        r.w.twcwp <= RRES.w.twcwp;
        r.d.stwin <= RRES.d.stwin;
        r.d.cwpmax <= RRES.d.cwpmax;
      end if;
      if irqlat=0 then
        r.d.irqstart <= RRES.d.irqstart;
        r.d.irqlatctr <= RRES.d.irqlatctr;
        r.d.irqlatmet <= RRES.d.irqlatmet;
      end if;
    end if;
  end process;


  dsugen : if DBGUNIT generate
    dsureg : process(clk) begin
      if rising_edge(clk) then
        if holdn = '1' then
          dsur <= dsuin;
        else
          dsur.crdy <= dsuin.crdy;
        end if;
        if rstn = '0' then
          if RESET_ALL then
            dsur <= DRES;
          elsif need_extra_sync_reset(fabtech) /= 0 then
            dsur.err <= '0'; dsur.tbufcnt <= (others => '0'); dsur.tt <= (others => '0');
            dsur.asi <= (others => '0'); dsur.crdy <= (others => '0');
          end if;
          if RESET_ALL = FALSE then
            dsur.asifiltmask <= ( others => '0');
            dsur.itfiltmask <= ( others => '0');
          end if;
        end if;
      end if;
    end process;
  end generate;

  nodsugen : if not DBGUNIT generate
    dsur.err <= '0'; dsur.tbufcnt <= (others => '0'); dsur.tt <= (others => '0');
    dsur.asi <= (others => '0'); dsur.crdy <= (others => '0');
    dsur.tfilt <= (others => '0'); dsur.cfc <= (others => '0');
    dsur.tlim <= (others => '0'); dsur.tov <= '0'; dsur.tovb <= '0';
    dsur.itfiltmask <= ( others => '0'); dsur.asifiltmask <= (others => '0');
  end generate;

  irreg : if DBGUNIT or PWRD2
  generate
    dsureg : process(clk) begin
      if rising_edge(clk) then
        if holdn = '1' then ir <= irin; end if;
        if RESET_ALL and rstn = '0' then ir <= IRES; end if;
      end if;
    end process;
  end generate;

  nirreg : if not (DBGUNIT or PWRD2
    )
  generate
    ir.pwd <= '0'; ir.addr <= (others => '0');
  end generate;

  wpgen : for i in 0 to 3 generate
    wpg0 : if nwp > i generate
      wpreg : process(clk) begin
        if rising_edge(clk) then
          if holdn = '1' then wpr(i) <= wprin(i); end if;
          if rstn = '0' then
            if RESET_ALL then
              wpr(i) <= wpr_none;
            else
              wpr(i).exec <= '0'; wpr(i).load <= '0'; wpr(i).store <= '0';
            end if;
          end if;
        end if;
      end process;
    end generate;
    wpg1 : if nwp <= i generate
      wpr(i) <= wpr_none;
    end generate;
  end generate;

-- pragma translate_off
  trc : process(clk)
    variable valid : boolean;
    variable op : std_logic_vector(1 downto 0);
    variable op3 : std_logic_vector(5 downto 0);
    variable fpins, fpld : boolean;
    variable pc: std_logic_vector(31 downto 0);
    variable rexen: boolean;
  begin
    --if (fpu /= 0) then
    -- op := r.x.ctrl.inst(31 downto 30); op3 := r.x.ctrl.inst(24 downto 19);
    --  fpins := (op = FMT3) and ((op3 = FPOP1) or (op3 = FPOP2));
    --  fpld := (op = LDST) and ((op3 = LDF) or (op3 = LDDF) or (op3 = LDFSR));
    --else
      fpins := false; fpld := false;
    --end if;
      valid := (((not r.x.ctrl.annul) and (r.x.ctrl.pv or r.x.ctrl.itovr)) = '1') and (not ((fpins or fpld) and (r.x.ctrl.trap = '0')));
      valid := valid and (holdn = '1');
    pc := r.x.ctrl.pc(31 downto 2) & "00";
    rexen:=false;
    if rex=1 then pc(1):=r.x.ctrl.pc(2-1*REX); rexen:=(r.x.ctrl.pc(2-2*REX)='1'); end if;
    if (disas = 1) and rising_edge(clk) and (rstn = '1') then
      print_insn (index, pc, r.x.ctrl.inst,
                  rin.w.result, valid, r.x.ctrl.trap = '1', rin.w.wreg = '1',
                  rexen);
    end if;
  end process;
-- pragma translate_on

  dis0 : if disas < 2 generate dummy <= '1'; end generate;

  dis2 : if disas > 1 generate
      disasen <= '1' when disas /= 0 else '0';
      cpu_index <= conv_std_logic_vector(index, 4);
      x0 : cpu_disasx
      port map (clk, rstn, dummy, r.x.ctrl.inst, r.x.ctrl.pc(31 downto 2),
        rin.w.result, cpu_index, rin.w.wreg, r.x.ctrl.annul, holdn,
        r.x.ctrl.pv, r.x.ctrl.trap, disasen);
  end generate;

end;
