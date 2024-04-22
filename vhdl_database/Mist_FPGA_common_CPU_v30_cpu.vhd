library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

package whatever is
   type cpu_export_type is record
      reg_ax           : unsigned(15 downto 0);
      reg_cx           : unsigned(15 downto 0);
      reg_dx           : unsigned(15 downto 0);
      reg_bx           : unsigned(15 downto 0);
      reg_sp           : unsigned(15 downto 0);
      reg_bp           : unsigned(15 downto 0);
      reg_si           : unsigned(15 downto 0);
      reg_di           : unsigned(15 downto 0);
      reg_es           : unsigned(15 downto 0);
      reg_cs           : unsigned(15 downto 0);
      reg_ss           : unsigned(15 downto 0);
      reg_ds           : unsigned(15 downto 0);
      reg_ip           : unsigned(15 downto 0);
      reg_f            : unsigned(15 downto 0);
      opcodebyte_last  : std_logic_vector(7 downto 0);
   end record;
end package;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- use work.pexport.all;
use work.pBus_savestates.all;
use work.pReg_savestates.all;

use work.whatever.all;

entity v30 is
   generic
   (
      INTACK_DELAY      : integer := 22
   );
   port
   (
      clk               : in  std_logic;
      ce                : in  std_logic;
      ce_4x             : in  std_logic;
      reset             : in  std_logic;
      turbo             : in  std_logic;
      SLOWTIMING        : in  std_logic; -- only used in simulation to sync up with prefetching
            
      cpu_idle          : out std_logic;
      cpu_halt          : out std_logic;
      cpu_irqrequest    : out std_logic;
      cpu_prefix        : out std_logic;
      dma_active        : in  std_logic;
      sdma_request      : in  std_logic;
      canSpeedup        : out std_logic;
         
      bus_read          : out std_logic := '0';
      bus_write         : out std_logic := '0';
      bus_prefetch      : out std_logic := '0';
      bus_be            : out std_logic_vector(1 downto 0) := "00";
      bus_addr          : out unsigned(19 downto 0) := (others => '0');
      bus_datawrite     : out std_logic_vector(15 downto 0) := (others => '0');
      bus_dataread      : in  std_logic_vector(15 downto 0);    
         
      irqrequest_in     : in std_logic;
      irqvector_in      : in unsigned(9 downto 0) := (others => '0');
      irqrequest_ack    : out std_logic := '0';
      irqrequest_fini   : out std_logic := '0';

      load_savestate    : in  std_logic;
            
      cpu_done          : out std_logic := '0'; 
      cpu_export_opcode : out std_logic_vector(7 downto 0);
		cpu_export_reg_cs : out unsigned(15 downto 0);
		cpu_export_reg_ip : out unsigned(15 downto 0);
		
      secure            : in std_logic := '0';
      secure_wr         : in std_logic;
      secure_addr       : in unsigned(7 downto 0);
      secure_data       : in std_logic_vector(7 downto 0);
 
      -- register 
      RegBus_Din        : out std_logic_vector(7 downto 0) := (others => '0');
      RegBus_Adr        : out std_logic_vector(7 downto 0) := (others => '0');
      RegBus_wren       : out std_logic := '0';
      RegBus_rden       : out std_logic := '0';
      RegBus_Dout       : in  std_logic_vector(7 downto 0);
         
      -- savestates        
      sleep_savestate   : in  std_logic;
         
      SSBUS_Din         : in  std_logic_vector(SSBUS_buswidth-1 downto 0);
      SSBUS_Adr         : in  std_logic_vector(SSBUS_busadr-1 downto 0);
      SSBUS_wren        : in  std_logic;
      SSBUS_rst         : in  std_logic;
      SSBUS_Dout        : out std_logic_vector(SSBUS_buswidth-1 downto 0)
   );
end entity;

architecture arch of v30 is
   
   -- push/pop
   constant REGPOS_ax  : std_logic_vector(15 downto 0) := x"0001";
   constant REGPOS_cx  : std_logic_vector(15 downto 0) := x"0002";
   constant REGPOS_dx  : std_logic_vector(15 downto 0) := x"0004";
   constant REGPOS_bx  : std_logic_vector(15 downto 0) := x"0008";
   constant REGPOS_sp  : std_logic_vector(15 downto 0) := x"0010";
   constant REGPOS_bp  : std_logic_vector(15 downto 0) := x"0020";
   constant REGPOS_si  : std_logic_vector(15 downto 0) := x"0040";
   constant REGPOS_di  : std_logic_vector(15 downto 0) := x"0080";
   constant REGPOS_es  : std_logic_vector(15 downto 0) := x"0100";
   constant REGPOS_f   : std_logic_vector(15 downto 0) := x"0200";
   constant REGPOS_cs  : std_logic_vector(15 downto 0) := x"0400";
   constant REGPOS_ss  : std_logic_vector(15 downto 0) := x"0800";
   constant REGPOS_ds  : std_logic_vector(15 downto 0) := x"1000";
   constant REGPOS_ip  : std_logic_vector(15 downto 0) := x"2000";
   constant REGPOS_mem : std_logic_vector(15 downto 0) := x"4000";
   constant REGPOS_imm : std_logic_vector(15 downto 0) := x"8000";
   
   type tPrefetchState is
   (
      PREFETCH_IDLE,
      PREFETCH_READ,
      PREFETCH_WAIT,
      PREFETCH_RECEIVE
   );
   signal prefetchState : tPrefetchState;
   
   type tCPUSTAGE is
   (
      CPUSTAGE_IDLE,
      CPUSTAGE_DECODEOP,
      CPUSTAGE_MODRM,
      CPUSTAGE_CHECKDATAREADY,
      CPUSTAGE_FETCHDATA1_8,
      CPUSTAGE_FETCHDATA1_16,      
      CPUSTAGE_FETCHDATA2_8,
      CPUSTAGE_FETCHDATA2_16,
      CPUSTAGE_FETCHMEM_REQ,
      CPUSTAGE_FETCHMEM_WAIT,
      CPUSTAGE_FETCHMEM_REC,
      CPUSTAGE_IRQVECTOR_REQ,
      CPUSTAGE_IRQVECTOR_WAIT,
      CPUSTAGE_IRQVECTOR_REC,
      CPUSTAGE_PUSH,
      CPUSTAGE_POP_REQ,
      CPUSTAGE_POP_WAIT,
      CPUSTAGE_POP_REC,
      CPUSTAGE_EXECUTE
   );
   signal cpustage : tCPUSTAGE;
   
   type tCPU_Opcode is
   (
      --modrm
      OP_MEMIMM1,
      OP_MEMIMM2,
      OP_MEMIMM3,
      OP_MEMIMM4,
      -- final
      OP_MOVMEM,
      OP_MOVREG,
      OP_EXCHANGE,
      OP_BOUND,
      OP_OPIN,
      OP_OPOUT,
      OP_BCDSTRING,
      OP_STRINGLOAD,
      OP_STRINGCOMPARE,
      OP_STRINGSTORE,
      OP_ENTER,
      OP_JUMPIF,
      OP_JUMP,
      OP_JUMPABS,
      OP_JUMPFAR,
      OP_RETURNFAR,
      OP_IRQ,
      OP_IRQREQUEST,
      OP_FLAGSFROMACC,
      OP_FLAGSTOACC,
      OP_DIV,
      OP_DIVI,
      OP_MULADJUST,
      OP_DIVADJUST,
      OP_NOP,
      OP_INVALID
   );
   
   type tOPSOURCE is
   (
      OPSOURCE_FETCHVALUE8,
      OPSOURCE_FETCHVALUE16,
      OPSOURCE_MEM,
      OPSOURCE_MODRM_REG,
      OPSOURCE_MODRM_ADDR,
      OPSOURCE_ACC,
      OPSOURCE_IMMIDIATE,
      OPSOURCE_POPVALUE,
      OPSOURCE_STRINGLOAD1,
      OPSOURCE_STRINGLOAD2,
      OPSOURCE_IRQVECTOR,
      OPSOURCE_REG_ax,
      OPSOURCE_REG_cx,
      OPSOURCE_REG_dx,
      OPSOURCE_REG_bx,
      OPSOURCE_REG_sp,
      OPSOURCE_REG_bp,
      OPSOURCE_REG_si,
      OPSOURCE_REG_di,
      OPSOURCE_INVALID
   );
   
   type tOPTARGET is
   (
      OPTARGET_DECODE,
      OPTARGET_MEM,
      OPTARGET_MODRM_REG,
      OPTARGET_NONE
   );
   
   type tCPU_REG is
   (
      CPU_REG_al,
      CPU_REG_ah,
      CPU_REG_ax,
      CPU_REG_bl,
      CPU_REG_bh,
      CPU_REG_bx,
      CPU_REG_cl,
      CPU_REG_ch,
      CPU_REG_cx,
      CPU_REG_dl,
      CPU_REG_dh,
      CPU_REG_dx,
      CPU_REG_sp,
      CPU_REG_bp,
      CPU_REG_si,
      CPU_REG_di,
      CPU_REG_es,
      CPU_REG_cs,
      CPU_REG_ss,
      CPU_REG_ds,
      CPU_REG_ip,
      CPU_REG_f,
      CPU_REG_NONE
   );
   
   type tALU_OP is
   (
      ALU_OP_AND,
      ALU_OP_OR,
      ALU_OP_XOR,
      ALU_OP_NOT,
      ALU_OP_NEG,
      ALU_OP_ADD,
      ALU_OP_ADC,
      ALU_OP_INC,
      ALU_OP_SUB,
      ALU_OP_SBB,
      ALU_OP_DEC,
      ALU_OP_CMP,
      ALU_OP_TST,
      ALU_OP_ROL,
      ALU_OP_ROR,
      ALU_OP_RCL,
      ALU_OP_RCR,
      ALU_OP_SHL,
      ALU_OP_SHR,
      ALU_OP_SAL,
      ALU_OP_SAR,
      ALU_OP_MUL,
      ALU_OP_MULI,
      ALU_OP_DIV,
      ALU_OP_DIVI,
      ALU_OP_SXT,
      ALU_OP_DECADJUST,
      ALU_OP_ASCIIADJUST,
      ALU_OP_SET1,
      ALU_OP_CLR1,
      ALU_OP_NOT1,
      ALU_OP_TEST1,
      ALU_OP_ROR4,
      ALU_OP_ROL4,
      ALU_OP_NOTHING
   );

   type tBCD_OP is
   (
      BCD_OP_ADD,
      BCD_OP_SUB,
      BCD_OP_CMP
   );

   
   -- decodedInstruction
   signal opcode           : tCPU_Opcode;
   signal opcodeNext       : tCPU_Opcode;
   signal source1          : tOPSOURCE;
   signal source2          : tOPSOURCE;
   signal optarget         : tOPTARGET;
   signal optarget2        : tOPTARGET;
   signal target_reg       : tCPU_REG;
   signal target_reg2      : tCPU_REG;
   signal target_decode    : tCPU_REG;
   signal Repeat           : std_logic;
   signal RepeatNext       : std_logic;
   signal PrefixIP         : unsigned(3 downto 0);
   signal segmentaccess    : std_logic;
   signal prefixSegmentES  : std_logic;
   signal prefixSegmentCS  : std_logic;
   signal prefixSegmentSS  : std_logic;
   signal prefixSegmentDS  : std_logic;
   signal aluop            : tALU_OP;
   signal bcdOp            : tBCD_OP;
   signal useAluResult     : std_logic;
   signal memSegment       : unsigned(15 downto 0);
   signal pushlist         : std_logic_vector(15 downto 0);
   signal poplist          : std_logic_vector(15 downto 0);
   signal reg_sp_push      : unsigned(15 downto 0);
   signal fetchedSource1   : std_logic;
   signal fetchedSource2   : std_logic;
   signal opsign           : std_logic;
   signal irqBlocked       : std_logic;
   signal reqModRM         : std_logic;
   signal repeatZero       : std_logic;
   signal opsize           : std_logic;
   signal instantFetch     : std_logic;
   signal fetch1Val        : unsigned(15 downto 0);
   signal fetch2Val        : unsigned(15 downto 0);
   signal memFetchValue1   : unsigned(15 downto 0);
   signal memFetchValue2   : unsigned(15 downto 0);
   signal MODRM_value_reg  : unsigned(15 downto 0);
   signal memAddr          : unsigned(15 downto 0);
   signal immidiate8       : unsigned( 7 downto 0);
   signal poptarget        : integer range 0 to 14;
   signal popval           : unsigned(15 downto 0);
   signal stringLoad       : unsigned(15 downto 0);
   signal stringLoad2      : unsigned(15 downto 0);
   signal unaligned1       : std_logic;
   signal unaligned2       : std_logic;
   signal irqrequest       : std_logic;
   signal irqExtern        : std_logic;
   signal irqvector        : unsigned(9 downto 0);
   signal irqIP            : unsigned(15 downto 0);
   signal irqCS            : unsigned(15 downto 0);
   signal adjustNegate     : std_logic;
   signal enterCnt         : unsigned(5 downto 0);
   signal bcdOffset        : unsigned(6 downto 0);
   signal bcdAccLow        : unsigned(4 downto 0);
   signal bcdAccHigh       : unsigned(4 downto 0);
   signal bcdAcc           : unsigned(7 downto 0);
   
   type tMemAccessType is 
   (
      MEMACC_NONE,
      MEMACC_PREFETCH,
      MEMACC_MEMFETCH,
      MEMACC_MEMWRITE,
      MEMACC_POP,
      MEMACC_STRINGLOAD1,
      MEMACC_STRINGLOAD2,
      MEMACC_IRQFETCH1,
      MEMACC_IRQFETCH2
   );
   signal MemAccessType     : tMemAccessType;
   
   type tRegister is record
      reg_ax           : unsigned(15 downto 0);
      reg_cx           : unsigned(15 downto 0);
      reg_dx           : unsigned(15 downto 0);
      reg_bx           : unsigned(15 downto 0);
      reg_sp           : unsigned(15 downto 0);
      reg_bp           : unsigned(15 downto 0);
      reg_si           : unsigned(15 downto 0);
      reg_di           : unsigned(15 downto 0);
      reg_es           : unsigned(15 downto 0);
      reg_cs           : unsigned(15 downto 0);
      reg_ss           : unsigned(15 downto 0);
      reg_ds           : unsigned(15 downto 0);
      reg_ip           : unsigned(15 downto 0);
      FlagCar          : std_logic;
      FlagPar          : std_logic;
      FlagHaC          : std_logic;
      FlagZer          : std_logic;
      FlagSgn          : std_logic;
      FlagBrk          : std_logic;
      FlagIrq          : std_logic;
      FlagDir          : std_logic;
      FlagOvf          : std_logic;
      FlagMod          : std_logic;
   end record;
   signal regs             : tRegister;
   signal Reg_f            : unsigned(15 downto 0);  
   
   -- prefetch
   signal prefetchCount    : integer range 0 to 15;
   signal prefetchBuffer   : std_logic_vector(127 downto 0);
   signal prefetchAddr     : unsigned(19 downto 0);
   signal prefetchAddrOld  : unsigned(19 downto 0);
   signal prefetch1byte    : std_logic;
   signal clearPrefetch    : std_logic;
   signal consumePrefetch  : integer range 0 to 3;
   signal prefetchAllow    : std_logic;
   signal prefetchDisturb  : std_logic;
   
   -- control and decode
   signal delay            : integer range 0 to 31;
   signal dbuf             : integer range 0 to 7;
   signal opcodebyte       : std_logic_vector(7 downto 0);
   signal exOpcodebyte     : std_logic_vector(7 downto 0);
   signal halt             : std_logic := '0';
   signal memFirst         : std_logic := '0';
   signal lastaddr         : unsigned(19 downto 0);
   signal cpu_finished     : std_logic := '0';
   signal opstep           : integer range 0 to 7;
   signal waitexe          : std_logic;
   signal pushFirst        : std_logic;
   signal popFirst         : std_logic;
   signal popUnalnByte     : std_logic_vector(7 downto 0);
   signal flagCarry        : std_logic;

   attribute keep : string;
   attribute keep of exOpcodebyte : signal is "true";


   -- divider
   signal DIVstart         : std_logic;
   signal DIVdividend      : signed(32 downto 0);
   signal DIVdivisor       : signed(32 downto 0);
   signal DIVquotient      : signed(32 downto 0);
   signal DIVremainder     : signed(32 downto 0);

   type arr_opcode IS ARRAY (0 to 255) OF std_logic_vector(7 downto 0);
   signal decryption_table : arr_opcode;
   attribute ramstyle : string;
   --attribute ramstyle OF decryption_table : signal is "logic";
   signal decryption_addr : unsigned(7 downto 0);
   signal decryption_q : std_logic_vector(7 downto 0);

   -- savestates
   signal SS_CPU1          : std_logic_vector(REG_SAVESTATE_CPU1.upper downto REG_SAVESTATE_CPU1.lower);
   signal SS_CPU2          : std_logic_vector(REG_SAVESTATE_CPU2.upper downto REG_SAVESTATE_CPU2.lower);
   signal SS_CPU3          : std_logic_vector(REG_SAVESTATE_CPU3.upper downto REG_SAVESTATE_CPU3.lower);
   signal SS_CPU4          : std_logic_vector(REG_SAVESTATE_CPU4.upper downto REG_SAVESTATE_CPU4.lower);
   signal SS_CPU_BACK1     : std_logic_vector(REG_SAVESTATE_CPU1.upper downto REG_SAVESTATE_CPU1.lower);
   signal SS_CPU_BACK2     : std_logic_vector(REG_SAVESTATE_CPU2.upper downto REG_SAVESTATE_CPU2.lower);
   signal SS_CPU_BACK3     : std_logic_vector(REG_SAVESTATE_CPU3.upper downto REG_SAVESTATE_CPU3.lower);
   signal SS_CPU_BACK4     : std_logic_vector(REG_SAVESTATE_CPU4.upper downto REG_SAVESTATE_CPU4.lower);

   type t_ss_wired_or is array(0 to 3) of std_logic_vector(63 downto 0);
   signal ss_wired_or : t_ss_wired_or;

   -- debug
   signal executeDone      : std_logic := '0';
   signal dma_active_1     : std_logic := '0';
  
   signal testcmd          : unsigned(31 downto 0);
   signal testpcsum        : unsigned(63 downto 0);


begin

   cpu_idle       <= '1' when cpustage = CPUSTAGE_IDLE else '0';
   cpu_halt       <= halt;
   cpu_irqrequest <= irqrequest;
   cpu_prefix     <= '1' when PrefixIP > 0 else '0';
   bus_prefetch   <= '0' when (prefetchAllow = '0' or prefetchState = PREFETCH_IDLE or prefetchState = PREFETCH_RECEIVE) else '1';

   canSpeedup <= '1';
   
   Reg_f(0 ) <= regs.FlagCar;
   Reg_f(1 ) <= '1'    ;
   Reg_f(2 ) <= regs.FlagPar;
   Reg_f(3 ) <= '0'    ;
   Reg_f(4 ) <= regs.FlagHaC;
   Reg_f(5 ) <= '0'    ;
   Reg_f(6 ) <= regs.FlagZer;
   Reg_f(7 ) <= regs.FlagSgn;
   Reg_f(8 ) <= regs.FlagBrk;
   Reg_f(9 ) <= regs.FlagIrq;
   Reg_f(10) <= regs.FlagDir;
   Reg_f(11) <= regs.FlagOvf;
   Reg_f(12) <= '1'    ;
   Reg_f(13) <= '1'    ;
   Reg_f(14) <= '1'    ;
   Reg_f(15) <= regs.FlagMod;

   -- savestate
   iSS_CPU1 : entity work.eReg_SS generic map ( REG_SAVESTATE_CPU1 ) port map (clk, SSBUS_Din, SSBUS_Adr, SSBUS_wren, SSBUS_rst, ss_wired_or(0), SS_CPU_BACK1, SS_CPU1);  
   iSS_CPU2 : entity work.eReg_SS generic map ( REG_SAVESTATE_CPU2 ) port map (clk, SSBUS_Din, SSBUS_Adr, SSBUS_wren, SSBUS_rst, ss_wired_or(1), SS_CPU_BACK2, SS_CPU2);  
   iSS_CPU3 : entity work.eReg_SS generic map ( REG_SAVESTATE_CPU3 ) port map (clk, SSBUS_Din, SSBUS_Adr, SSBUS_wren, SSBUS_rst, ss_wired_or(2), SS_CPU_BACK3, SS_CPU3);  
   iSS_CPU4 : entity work.eReg_SS generic map ( REG_SAVESTATE_CPU4 ) port map (clk, SSBUS_Din, SSBUS_Adr, SSBUS_wren, SSBUS_rst, ss_wired_or(3), SS_CPU_BACK4, SS_CPU4);  

   process (ss_wired_or)
      variable wired_or : std_logic_vector(63 downto 0);
   begin
      wired_or := ss_wired_or(0);
      for i in 1 to (ss_wired_or'length - 1) loop
         wired_or := wired_or or ss_wired_or(i);
      end loop;
      SSBUS_Dout <= wired_or;
   end process;

   SS_CPU_BACK1(15 downto  0) <= std_logic_vector(regs.reg_ip);
   SS_CPU_BACK1(31 downto 16) <= std_logic_vector(regs.reg_ax);
   SS_CPU_BACK1(47 downto 32) <= std_logic_vector(regs.reg_cx);
   SS_CPU_BACK1(63 downto 48) <= std_logic_vector(regs.reg_dx);
   SS_CPU_BACK2(15 downto  0) <= std_logic_vector(regs.reg_bx);
   SS_CPU_BACK2(31 downto 16) <= std_logic_vector(regs.reg_sp);
   SS_CPU_BACK2(47 downto 32) <= std_logic_vector(regs.reg_bp);
   SS_CPU_BACK2(63 downto 48) <= std_logic_vector(regs.reg_si);
   SS_CPU_BACK3(15 downto  0) <= std_logic_vector(regs.reg_di);
   SS_CPU_BACK3(31 downto 16) <= std_logic_vector(regs.reg_es);
   SS_CPU_BACK3(47 downto 32) <= std_logic_vector(regs.reg_cs);
   SS_CPU_BACK3(63 downto 48) <= std_logic_vector(regs.reg_ss);
   SS_CPU_BACK4(15 downto  0) <= std_logic_vector(regs.reg_ds);
   SS_CPU_BACK4(31 downto 16) <= std_logic_vector(Reg_f);      

   decryption_addr <= secure_addr when secure_wr = '1' else 
                      unsigned(prefetchBuffer(15 downto 8)) when consumePrefetch = 1 else unsigned(prefetchBuffer(7 downto 0));
   process (clk) begin
      if falling_edge(clk) then
         decryption_q <= decryption_table(to_integer(decryption_addr));
      end if;
   end process;

   process (clk)
      variable varPrefetchCount  : integer range 0 to 15;
      variable varprefetchBuffer : std_logic_vector(127 downto 0);
      variable isPrefix          : std_logic;
      variable usePrefix         : std_logic;
      variable source1Val        : unsigned(15 downto 0);
      variable source2Val        : unsigned(15 downto 0);
      variable op2value          : unsigned(15 downto 0);
      variable resultval         : unsigned(15 downto 0);
      variable target            : tCPU_REG;
      variable result            : unsigned(15 downto 0);
      variable result17          : unsigned(16 downto 0);
      variable result32          : unsigned(31 downto 0);
      variable result8           : unsigned(7 downto 0);
      variable result8h          : unsigned(7 downto 0);
      variable result9           : unsigned(8 downto 0);
      variable newZero           : std_logic;
      variable newParity         : std_logic;
      variable newSign           : std_logic;
      variable carryWork1        : std_logic;
      variable carryWork2        : std_logic;
      variable cond              : std_logic;
      variable exeDone           : std_logic;
      variable pushValue         : std_logic_vector(15 downto 0);
      variable pushindex         : integer range 0 to 15;
      variable popindex          : integer range 0 to 15;
      variable popValue          : std_logic_vector(15 downto 0);
      variable popDone           : std_logic;
      variable MODRM_mem         : unsigned(2 downto 0);
      variable MODRM_reg         : unsigned(2 downto 0);
      variable MODRM_mod         : unsigned(1 downto 0);
      variable varoptarget       : tOPTARGET;
      variable varsource1        : tOPSOURCE;
      variable varsource2        : tOPSOURCE;
      variable varfetchedSource1 : std_logic;
      variable varfetchedSource2 : std_logic;
      variable vartarget_reg     : tCPU_REG;
      variable varmemSegment     : unsigned(15 downto 0);
      variable varmemaddr        : unsigned(15 downto 0);
      variable varpushlist       : std_logic_vector(15 downto 0);
      variable fetchedRMMODData  : unsigned(15 downto 0);
      variable newDelay          : integer range 0 to 31;
      variable newBuf            : integer range 0 to 7;
      variable newModDelay       : integer range 0 to 31;
      variable newExeDelay       : integer range 0 to 31;
      variable endRepeat         : std_logic;
      variable newRepeat         : std_logic;
      variable jumpNow           : std_logic;
      variable jumpAddr          : unsigned(15 downto 0);
      variable bcdResultLow      : unsigned(4 downto 0);
      variable bcdResultHigh     : unsigned(4 downto 0);
      variable wordAligned       : std_logic;
   begin
      if rising_edge(clk) then
         
         DIVstart         <= '0';
         cpu_done         <= '0';
         
         bus_read         <= '0';
         bus_write        <= '0';

         if (ce_4x = '1') then
            clearPrefetch    <= '0';
            consumePrefetch  <= 0;  
         end if;
         
         if (ce = '1') then
            prefetchAllow  <= '1';
            RegBus_wren    <= '0';
            RegBus_rden    <= '0';
            irqrequest_ack <= '0';
            irqrequest_fini <= '0';
         end if;

         if (secure_wr = '1') then
            decryption_table(to_integer(decryption_addr)) <= secure_data;
         end if;
         --if (testpcsum(63) = '1' and testcmd(31) = '1') then
         --   DIVstart      <= '1';
         --end if;
         
         if (sleep_savestate = '1') then
            prefetchDisturb <= '1';
         end if;
      
         if (reset = '1') then
            
            regs.reg_ip  <= x"0000";
            regs.reg_ax  <= x"0000";
            regs.reg_cx  <= x"0000";
            regs.reg_dx  <= x"0000";
            regs.reg_bx  <= x"0000";
            regs.reg_sp  <= x"2000";
            regs.reg_bp  <= x"0000";
            regs.reg_si  <= x"0000";
            regs.reg_di  <= x"0000";
            regs.reg_es  <= x"0000";
            regs.reg_cs  <= x"FFFF";
            regs.reg_ss  <= x"0000";
            regs.reg_ds  <= x"0000";
  
            regs.FlagCar <= '0';
            regs.FlagPar <= '0';
            regs.FlagHaC <= '0';
            regs.FlagZer <= '0';
            regs.FlagSgn <= '0';
            regs.FlagBrk <= '0';
            regs.FlagIrq <= '0';
            regs.FlagDir <= '0';
            regs.FlagOvf <= '0';
            regs.FlagMod <= '1';
            
            halt            <= '0';
            cpustage        <= CPUSTAGE_IDLE;
            opcodebyte      <= (others => '0');
            exOpcodebyte    <= (others => '0');
            
            clearPrefetch   <= '1';
            
            delay           <= 8; -- fill prefetch buffer
            dbuf            <= 0;
            
            repeat     <= '0';        
            repeatNext <= '0'; 
            
            irqrequest <= '0'; 
            irqBlocked <= '0'; 
            irqrequest_ack <= '0';
            
            prefixSegmentES <= '0';  
            prefixSegmentCS <= '0';  
            prefixSegmentSS <= '0';  
            prefixSegmentDS <= '0'; 
            
            prefixIP        <= (others => '0');
            
            testcmd         <= (others => '0');
            testpcsum       <= (others => '0');
            
            RegBus_wren     <= '0';
            RegBus_rden     <= '0';
            
         elsif (ce_4x = '1') then
         
            dma_active_1 <= dma_active;
         
            if (ce = '1' and irqrequest_in = '1' and irqBlocked = '0' and cpustage = CPUSTAGE_IDLE) then
               halt <= '0';
            end if;
            
            if (cpu_finished = '1' and dma_active = '0' and dma_active_1 = '1') then
               cpu_finished <= '0';
               cpu_done     <= '1';
            end if;
            
            if (dma_active = '1') then
               delay <= 0;
            end if;
         
            if (ce = '1' and delay > 0) then
            
               delay <= delay - 1;
               
               if (delay = 1 and cpu_finished = '1' and dma_active = '0') then
                  cpu_finished <= '0';
                  cpu_done     <= '1';
               end if;
            
            else
            
               case (cpustage) is
               
                  when CPUSTAGE_IDLE =>
                     if (ce = '1' and sdma_request = '0') then
                     
                        if (irqrequest = '1') then
                           irqrequest     <= '0';
                           repeat         <= '0';
                           delay          <= INTACK_DELAY;
                           cpustage       <= CPUSTAGE_IRQVECTOR_REQ;
                           pushlist       <= REGPOS_f or REGPOS_cs or REGPOS_ip;
                           poplist        <= (others => '0');
                           pushFirst      <= '1';
                           opcode         <= OP_IRQ;
                           aluop          <= ALU_OP_NOTHING;
                           source1        <= OPSOURCE_IRQVECTOR;
                           source2        <= OPSOURCE_IRQVECTOR;
                           fetchedSource1 <= '0';
                           fetchedSource2 <= '0';
                           memFirst       <= '1';
                           
                        elsif (irqrequest_in = '1' and irqBlocked = '0' and regs.FlagIrq = '1') then
                           
                           irqrequest <= '1';
                           irqrequest_ack <= '1';
                           irqExtern  <= '1';
                           halt       <= '0';
                           
                        elsif (halt = '1') then
                           null;
                        elsif (prefetchCount > 3 + consumePrefetch) then
                           testpcsum  <= testpcsum + regs.reg_ip;
                           testcmd    <= testcmd + 1;
                           
                           if (repeat = '0') then
                                 exOpcodebyte <= x"00";
                              if (consumePrefetch = 1) then
                                 if (secure) then
                                    opcodebyte <= decryption_q;
                                 else
                                    opcodebyte   <= prefetchBuffer(15 downto 8);
                                 end if;
                              else
                                 if (secure) then
                                    opcodebyte <= decryption_q;
                                 else
                                    opcodebyte   <= prefetchBuffer(7 downto 0);
                                 end if;
                              end if;
                              if (repeatNext = '0') then
                                 regs.reg_ip     <= regs.reg_ip + 1;
                                 consumePrefetch <= 1;
                                 PrefixIP        <= (others => '0');
                              end if;
                           end if;
                           cpustage <= CPUSTAGE_DECODEOP;
                           
                           if (dBuf > 6) then
                              dBuf <= 6;
                           end if;
                           
                        end if;
   
                     end if;
                     
                  when CPUSTAGE_DECODEOP =>
                  
                     newRepeat := '0';
                     if (repeatNext = '1') then
                        if (opcodebyte = x"26" or opcodebyte = x"2E" or opcodebyte = x"36" or opcodebyte = x"3E") then
                           regs.reg_ip     <= regs.reg_ip + 1;
                           consumePrefetch <= 1;
                        else
                           RepeatNext <= '0';
                           Repeat     <= '1';
                           newRepeat  := '1';
                        end if;
                     end if;
                  
                     opcode           <= OP_INVALID;
                     opcodeNext       <= OP_INVALID;
                     source1          <= OPSOURCE_INVALID;
                     source2          <= OPSOURCE_INVALID;
                     optarget         <= OPTARGET_NONE;
                     optarget2        <= OPTARGET_NONE;
                     target_reg       <= CPU_REG_NONE;
                     target_reg2      <= CPU_REG_NONE;
                     segmentaccess    <= '0';
                     aluop            <= ALU_OP_NOTHING;
                     useAluResult     <= '0';
                     memSegment       <= Regs.reg_ds;
                     pushlist         <= (others => '0');
                     poplist          <= (others => '0');
                     reg_sp_push      <= Regs.reg_sp;
                     instantFetch     <= '0';
                     fetchedSource1   <= '0';
                     fetchedSource2   <= '0';
                     opsign           <= '0';
                     irqBlocked       <= '0';
                     unaligned1       <= '0';
                     unaligned2       <= '0';
                     memFirst         <= '1';
                     opstep           <= 0;
                     waitexe          <= '0';
                     enterCnt         <= (others => '0');
                     irqExtern        <= '0';
                     pushFirst        <= '1';
                     popFirst         <= '1';
                     flagCarry        <= regs.FlagCar;
                     
                     isPrefix  := '0';
                     usePrefix := '0';
                     
                     newDelay := 0;
                     newBuf := dbuf;
                     
                     case (opcodebyte) is
                        
                        when x"00" => opcode <= OP_MOVMEM; aluop <= ALU_OP_ADD; useAluResult <= '1'; opsize <= '0'; newDelay := 1;       source1 <= OPSOURCE_MEM;       source2 <= OPSOURCE_MODRM_REG;    cpustage <= CPUSTAGE_MODRM;         optarget <= OPTARGET_MEM; 
                        when x"01" => opcode <= OP_MOVMEM; aluop <= ALU_OP_ADD; useAluResult <= '1'; opsize <= '1'; newDelay := 1;       source1 <= OPSOURCE_MEM;       source2 <= OPSOURCE_MODRM_REG;    cpustage <= CPUSTAGE_MODRM;         optarget <= OPTARGET_MEM; 
                        when x"02" => opcode <= OP_MOVREG; aluop <= ALU_OP_ADD; useAluResult <= '1'; opsize <= '0';                      source1 <= OPSOURCE_MODRM_REG; source2 <= OPSOURCE_MEM;          cpustage <= CPUSTAGE_MODRM;         optarget <= OPTARGET_MODRM_REG; 
                        when x"03" => opcode <= OP_MOVREG; aluop <= ALU_OP_ADD; useAluResult <= '1'; opsize <= '1';                      source1 <= OPSOURCE_MODRM_REG; source2 <= OPSOURCE_MEM;          cpustage <= CPUSTAGE_MODRM;         optarget <= OPTARGET_MODRM_REG; 
                        when x"04" => opcode <= OP_MOVREG; aluop <= ALU_OP_ADD; useAluResult <= '1'; opsize <= '0'; instantFetch <= '1'; source1 <= OPSOURCE_ACC;       source2 <= OPSOURCE_FETCHVALUE8;  cpustage <= CPUSTAGE_FETCHDATA2_8 ; optarget <= OPTARGET_DECODE; target_decode <= CPU_REG_al;
                        when x"05" => opcode <= OP_MOVREG; aluop <= ALU_OP_ADD; useAluResult <= '1'; opsize <= '1'; instantFetch <= '1'; source1 <= OPSOURCE_ACC;       source2 <= OPSOURCE_FETCHVALUE16; cpustage <= CPUSTAGE_FETCHDATA2_16; optarget <= OPTARGET_DECODE; target_decode <= CPU_REG_ax;

                        when x"06" => pushlist <= REGPOS_es; cpustage <= CPUSTAGE_CHECKDATAREADY;
                        when x"07" => poplist  <= REGPOS_es; cpustage <= CPUSTAGE_CHECKDATAREADY; newDelay := 1;

                        when x"08" => opcode <= OP_MOVMEM; aluop <= ALU_OP_OR ; useAluResult <= '1'; opsize <= '0'; newDelay := 1;       source1 <= OPSOURCE_MEM;       source2 <= OPSOURCE_MODRM_REG;    cpustage <= CPUSTAGE_MODRM;         optarget <= OPTARGET_MEM; 
                        when x"09" => opcode <= OP_MOVMEM; aluop <= ALU_OP_OR ; useAluResult <= '1'; opsize <= '1'; newDelay := 1;       source1 <= OPSOURCE_MEM;       source2 <= OPSOURCE_MODRM_REG;    cpustage <= CPUSTAGE_MODRM;         optarget <= OPTARGET_MEM; 
                        when x"0A" => opcode <= OP_MOVREG; aluop <= ALU_OP_OR ; useAluResult <= '1'; opsize <= '0';                      source1 <= OPSOURCE_MODRM_REG; source2 <= OPSOURCE_MEM;          cpustage <= CPUSTAGE_MODRM;         optarget <= OPTARGET_MODRM_REG; 
                        when x"0B" => opcode <= OP_MOVREG; aluop <= ALU_OP_OR ; useAluResult <= '1'; opsize <= '1';                      source1 <= OPSOURCE_MODRM_REG; source2 <= OPSOURCE_MEM;          cpustage <= CPUSTAGE_MODRM;         optarget <= OPTARGET_MODRM_REG; 
                        when x"0C" => opcode <= OP_MOVREG; aluop <= ALU_OP_OR ; useAluResult <= '1'; opsize <= '0'; instantFetch <= '1'; source1 <= OPSOURCE_ACC;       source2 <= OPSOURCE_FETCHVALUE8;  cpustage <= CPUSTAGE_FETCHDATA2_8 ; optarget <= OPTARGET_DECODE; target_decode <= CPU_REG_al;
                        when x"0D" => opcode <= OP_MOVREG; aluop <= ALU_OP_OR ; useAluResult <= '1'; opsize <= '1'; instantFetch <= '1'; source1 <= OPSOURCE_ACC;       source2 <= OPSOURCE_FETCHVALUE16; cpustage <= CPUSTAGE_FETCHDATA2_16; optarget <= OPTARGET_DECODE; target_decode <= CPU_REG_ax;

                        when x"0E" => pushlist <= REGPOS_cs; cpustage <= CPUSTAGE_CHECKDATAREADY;
                        when x"0F" =>
                           exOpcodebyte <= prefetchBuffer(15 downto 8);
                           regs.reg_ip <= regs.reg_ip + 1;
                           consumePrefetch <= 1;
                           case (prefetchBuffer(15 downto 8)) is
                              -- TEST1
                              when x"10" => cpustage <= CPUSTAGE_MODRM; opcode <= OP_NOP; aluop <= ALU_OP_TEST1; opsize <= '0'; source2 <= OPSOURCE_REG_cx; source1 <= OPSOURCE_MEM;
                              when x"11" => cpustage <= CPUSTAGE_MODRM; opcode <= OP_NOP; aluop <= ALU_OP_TEST1; opsize <= '1'; source2 <= OPSOURCE_REG_cx; source1 <= OPSOURCE_MEM;
                              when x"18" => cpustage <= CPUSTAGE_MODRM; opcode <= OP_NOP; aluop <= ALU_OP_TEST1; opsize <= '0'; source2 <= OPSOURCE_FETCHVALUE8; source1 <= OPSOURCE_MEM;
                              when x"19" => cpustage <= CPUSTAGE_MODRM; opcode <= OP_NOP; aluop <= ALU_OP_TEST1; opsize <= '1'; source2 <= OPSOURCE_FETCHVALUE8; source1 <= OPSOURCE_MEM;
                              -- CLR1
                              when x"12" => cpustage <= CPUSTAGE_MODRM; opcode <= OP_MOVMEM; aluop <= ALU_OP_CLR1; opsize <= '0'; useAluResult <= '1'; source2 <= OPSOURCE_REG_cx; source1 <= OPSOURCE_MEM; optarget <= OPTARGET_MEM;
                              when x"13" => cpustage <= CPUSTAGE_MODRM; opcode <= OP_MOVMEM; aluop <= ALU_OP_CLR1; opsize <= '1'; useAluResult <= '1'; source2 <= OPSOURCE_REG_cx; source1 <= OPSOURCE_MEM; optarget <= OPTARGET_MEM;
                              when x"1a" => cpustage <= CPUSTAGE_MODRM; opcode <= OP_MOVMEM; aluop <= ALU_OP_CLR1; opsize <= '0'; useAluResult <= '1'; source2 <= OPSOURCE_FETCHVALUE8; source1 <= OPSOURCE_MEM; optarget <= OPTARGET_MEM;
                              when x"1b" => cpustage <= CPUSTAGE_MODRM; opcode <= OP_MOVMEM; aluop <= ALU_OP_CLR1; opsize <= '1'; useAluResult <= '1'; source2 <= OPSOURCE_FETCHVALUE8; source1 <= OPSOURCE_MEM; optarget <= OPTARGET_MEM;
                              -- SET1
                              when x"14" => cpustage <= CPUSTAGE_MODRM; opcode <= OP_MOVMEM; aluop <= ALU_OP_SET1; opsize <= '0'; useAluResult <= '1'; source2 <= OPSOURCE_REG_cx; source1 <= OPSOURCE_MEM; optarget <= OPTARGET_MEM;
                              when x"15" => cpustage <= CPUSTAGE_MODRM; opcode <= OP_MOVMEM; aluop <= ALU_OP_SET1; opsize <= '1'; useAluResult <= '1'; source2 <= OPSOURCE_REG_cx; source1 <= OPSOURCE_MEM; optarget <= OPTARGET_MEM;
                              when x"1c" => cpustage <= CPUSTAGE_MODRM; opcode <= OP_MOVMEM; aluop <= ALU_OP_SET1; opsize <= '0'; useAluResult <= '1'; source2 <= OPSOURCE_FETCHVALUE8; source1 <= OPSOURCE_MEM; optarget <= OPTARGET_MEM;
                              when x"1d" => cpustage <= CPUSTAGE_MODRM; opcode <= OP_MOVMEM; aluop <= ALU_OP_SET1; opsize <= '1'; useAluResult <= '1'; source2 <= OPSOURCE_FETCHVALUE8; source1 <= OPSOURCE_MEM; optarget <= OPTARGET_MEM;
                              -- NOT1
                              when x"16" => cpustage <= CPUSTAGE_MODRM; opcode <= OP_MOVMEM; aluop <= ALU_OP_NOT1; opsize <= '0'; useAluResult <= '1'; source2 <= OPSOURCE_REG_cx; source1 <= OPSOURCE_MEM; optarget <= OPTARGET_MEM;
                              when x"17" => cpustage <= CPUSTAGE_MODRM; opcode <= OP_MOVMEM; aluop <= ALU_OP_NOT1; opsize <= '1'; useAluResult <= '1'; source2 <= OPSOURCE_REG_cx; source1 <= OPSOURCE_MEM; optarget <= OPTARGET_MEM;
                              when x"1e" => cpustage <= CPUSTAGE_MODRM; opcode <= OP_MOVMEM; aluop <= ALU_OP_NOT1; opsize <= '0'; useAluResult <= '1'; source2 <= OPSOURCE_FETCHVALUE8; source1 <= OPSOURCE_MEM; optarget <= OPTARGET_MEM;
                              when x"1f" => cpustage <= CPUSTAGE_MODRM; opcode <= OP_MOVMEM; aluop <= ALU_OP_NOT1; opsize <= '1'; useAluResult <= '1'; source2 <= OPSOURCE_FETCHVALUE8; source1 <= OPSOURCE_MEM; optarget <= OPTARGET_MEM;
                              -- ADD4S
                              when x"20" => cpustage <= CPUSTAGE_EXECUTE; opcode <= OP_BCDSTRING; bcdOp <= BCD_OP_ADD; bcdOffset <= (others => '0'); regs.FlagCar <= '0'; regs.FlagZer <= '1';
                              -- SUB4S
                              when x"22" => cpustage <= CPUSTAGE_EXECUTE; opcode <= OP_BCDSTRING; bcdOp <= BCD_OP_SUB; bcdOffset <= (others => '0'); regs.FlagCar <= '0'; regs.FlagZer <= '1';
                              -- CMP4S
                              when x"26" => cpustage <= CPUSTAGE_EXECUTE; opcode <= OP_BCDSTRING; bcdOp <= BCD_OP_CMP; bcdOffset <= (others => '0'); regs.FlagCar <= '0'; regs.FlagZer <= '1';
                              -- ROL4
                              when x"28" => cpustage <= CPUSTAGE_MODRM; opcode <= OP_MOVMEM; aluop <= ALU_OP_ROL4; opsize <= '0'; useAluResult <= '1'; source1 <= OPSOURCE_MEM; optarget <= OPTARGET_MEM;
                              -- ROR4
                              when x"2a" =>  cpustage <= CPUSTAGE_MODRM; opcode <= OP_MOVMEM; aluop <= ALU_OP_ROR4; opsize <= '0'; useAluResult <= '1'; source1 <= OPSOURCE_MEM; optarget <= OPTARGET_MEM;
                              -- INS
                              when x"31" => cpustage <= CPUSTAGE_IDLE; cpu_done <= '1'; halt <= '1';
                              -- EXT
                              when x"33" => cpustage <= CPUSTAGE_IDLE; cpu_done <= '1'; halt <= '1';
                              -- INS
                              when x"39" => cpustage <= CPUSTAGE_IDLE; cpu_done <= '1'; halt <= '1';
                              -- FINT
                              when x"92" => newDelay := 2; cpustage <= CPUSTAGE_IDLE; cpu_finished <= '1'; irqrequest_fini <= '1';
                              -- BRKEM
                              when x"ff" => cpustage <= CPUSTAGE_IDLE; cpu_done <= '1'; halt <= '1';
                              
                              when others => cpustage <= CPUSTAGE_IDLE; cpu_done <= '1'; halt <= '1';
                           end case;


                        when x"10" => opcode <= OP_MOVMEM; aluop <= ALU_OP_ADC; useAluResult <= '1'; opsize <= '0'; newDelay := 1;       source1 <= OPSOURCE_MEM;       source2 <= OPSOURCE_MODRM_REG;    cpustage <= CPUSTAGE_MODRM;         optarget <= OPTARGET_MEM; 
                        when x"11" => opcode <= OP_MOVMEM; aluop <= ALU_OP_ADC; useAluResult <= '1'; opsize <= '1'; newDelay := 1;       source1 <= OPSOURCE_MEM;       source2 <= OPSOURCE_MODRM_REG;    cpustage <= CPUSTAGE_MODRM;         optarget <= OPTARGET_MEM; 
                        when x"12" => opcode <= OP_MOVREG; aluop <= ALU_OP_ADC; useAluResult <= '1'; opsize <= '0';                      source1 <= OPSOURCE_MODRM_REG; source2 <= OPSOURCE_MEM;          cpustage <= CPUSTAGE_MODRM;         optarget <= OPTARGET_MODRM_REG; 
                        when x"13" => opcode <= OP_MOVREG; aluop <= ALU_OP_ADC; useAluResult <= '1'; opsize <= '1';                      source1 <= OPSOURCE_MODRM_REG; source2 <= OPSOURCE_MEM;          cpustage <= CPUSTAGE_MODRM;         optarget <= OPTARGET_MODRM_REG; 
                        when x"14" => opcode <= OP_MOVREG; aluop <= ALU_OP_ADC; useAluResult <= '1'; opsize <= '0'; instantFetch <= '1'; source1 <= OPSOURCE_ACC;       source2 <= OPSOURCE_FETCHVALUE8;  cpustage <= CPUSTAGE_FETCHDATA2_8 ; optarget <= OPTARGET_DECODE; target_decode <= CPU_REG_al;
                        when x"15" => opcode <= OP_MOVREG; aluop <= ALU_OP_ADC; useAluResult <= '1'; opsize <= '1'; instantFetch <= '1'; source1 <= OPSOURCE_ACC;       source2 <= OPSOURCE_FETCHVALUE16; cpustage <= CPUSTAGE_FETCHDATA2_16; optarget <= OPTARGET_DECODE; target_decode <= CPU_REG_ax;

                        when x"16" => pushlist <= REGPOS_ss; cpustage <= CPUSTAGE_CHECKDATAREADY;
                        when x"17" => poplist  <= REGPOS_ss; cpustage <= CPUSTAGE_CHECKDATAREADY; newDelay := 1; irqBlocked <= '1';  

                        when x"18" => opcode <= OP_MOVMEM; aluop <= ALU_OP_SBB; useAluResult <= '1'; opsize <= '0'; newDelay := 1;       source1 <= OPSOURCE_MEM;       source2 <= OPSOURCE_MODRM_REG;    cpustage <= CPUSTAGE_MODRM;         optarget <= OPTARGET_MEM; 
                        when x"19" => opcode <= OP_MOVMEM; aluop <= ALU_OP_SBB; useAluResult <= '1'; opsize <= '1'; newDelay := 1;       source1 <= OPSOURCE_MEM;       source2 <= OPSOURCE_MODRM_REG;    cpustage <= CPUSTAGE_MODRM;         optarget <= OPTARGET_MEM; 
                        when x"1A" => opcode <= OP_MOVREG; aluop <= ALU_OP_SBB; useAluResult <= '1'; opsize <= '0';                      source1 <= OPSOURCE_MODRM_REG; source2 <= OPSOURCE_MEM;          cpustage <= CPUSTAGE_MODRM;         optarget <= OPTARGET_MODRM_REG; 
                        when x"1B" => opcode <= OP_MOVREG; aluop <= ALU_OP_SBB; useAluResult <= '1'; opsize <= '1';                      source1 <= OPSOURCE_MODRM_REG; source2 <= OPSOURCE_MEM;          cpustage <= CPUSTAGE_MODRM;         optarget <= OPTARGET_MODRM_REG; 
                        when x"1C" => opcode <= OP_MOVREG; aluop <= ALU_OP_SBB; useAluResult <= '1'; opsize <= '0'; instantFetch <= '1'; source1 <= OPSOURCE_ACC;       source2 <= OPSOURCE_FETCHVALUE8;  cpustage <= CPUSTAGE_FETCHDATA2_8 ; optarget <= OPTARGET_DECODE; target_decode <= CPU_REG_al;
                        when x"1D" => opcode <= OP_MOVREG; aluop <= ALU_OP_SBB; useAluResult <= '1'; opsize <= '1'; instantFetch <= '1'; source1 <= OPSOURCE_ACC;       source2 <= OPSOURCE_FETCHVALUE16; cpustage <= CPUSTAGE_FETCHDATA2_16; optarget <= OPTARGET_DECODE; target_decode <= CPU_REG_ax;
                   
                        when x"1E" => pushlist <= REGPOS_ds; cpustage <= CPUSTAGE_CHECKDATAREADY;
                        when x"1F" => poplist  <= REGPOS_ds; cpustage <= CPUSTAGE_CHECKDATAREADY; newDelay := 1;
                   
                        when x"20" => opcode <= OP_MOVMEM; aluop <= ALU_OP_AND; useAluResult <= '1'; opsize <= '0'; newDelay := 1;       source1 <= OPSOURCE_MEM;       source2 <= OPSOURCE_MODRM_REG;    cpustage <= CPUSTAGE_MODRM;         optarget <= OPTARGET_MEM; 
                        when x"21" => opcode <= OP_MOVMEM; aluop <= ALU_OP_AND; useAluResult <= '1'; opsize <= '1'; newDelay := 1;       source1 <= OPSOURCE_MEM;       source2 <= OPSOURCE_MODRM_REG;    cpustage <= CPUSTAGE_MODRM;         optarget <= OPTARGET_MEM; 
                        when x"22" => opcode <= OP_MOVREG; aluop <= ALU_OP_AND; useAluResult <= '1'; opsize <= '0';                      source1 <= OPSOURCE_MODRM_REG; source2 <= OPSOURCE_MEM;          cpustage <= CPUSTAGE_MODRM;         optarget <= OPTARGET_MODRM_REG; 
                        when x"23" => opcode <= OP_MOVREG; aluop <= ALU_OP_AND; useAluResult <= '1'; opsize <= '1';                      source1 <= OPSOURCE_MODRM_REG; source2 <= OPSOURCE_MEM;          cpustage <= CPUSTAGE_MODRM;         optarget <= OPTARGET_MODRM_REG; 
                        when x"24" => opcode <= OP_MOVREG; aluop <= ALU_OP_AND; useAluResult <= '1'; opsize <= '0'; instantFetch <= '1'; source1 <= OPSOURCE_ACC;       source2 <= OPSOURCE_FETCHVALUE8;  cpustage <= CPUSTAGE_FETCHDATA2_8 ; optarget <= OPTARGET_DECODE; target_decode <= CPU_REG_al;
                        when x"25" => opcode <= OP_MOVREG; aluop <= ALU_OP_AND; useAluResult <= '1'; opsize <= '1'; instantFetch <= '1'; source1 <= OPSOURCE_ACC;       source2 <= OPSOURCE_FETCHVALUE16; cpustage <= CPUSTAGE_FETCHDATA2_16; optarget <= OPTARGET_DECODE; target_decode <= CPU_REG_ax;

                        when x"26" => prefixSegmentES <= '1'; isPrefix := '1'; irqBlocked <= '1'; usePrefix := '1'; cpu_done <= '1'; newBuf := dbuf + 1; cpustage <= CPUSTAGE_IDLE;
      
                        when x"27" => opcode <= OP_MOVREG; aluop <= ALU_OP_DECADJUST; useAluResult <= '1'; newDelay := 9; opsize <= '0';  cpustage <= CPUSTAGE_EXECUTE; target_decode <= CPU_REG_al; optarget <= OPTARGET_DECODE; adjustNegate <= '0';
      
                        when x"28" => opcode <= OP_MOVMEM; aluop <= ALU_OP_SUB; useAluResult <= '1'; opsize <= '0'; newDelay := 1;       source1 <= OPSOURCE_MEM;       source2 <= OPSOURCE_MODRM_REG;    cpustage <= CPUSTAGE_MODRM;         optarget <= OPTARGET_MEM; 
                        when x"29" => opcode <= OP_MOVMEM; aluop <= ALU_OP_SUB; useAluResult <= '1'; opsize <= '1'; newDelay := 1;       source1 <= OPSOURCE_MEM;       source2 <= OPSOURCE_MODRM_REG;    cpustage <= CPUSTAGE_MODRM;         optarget <= OPTARGET_MEM; 
                        when x"2A" => opcode <= OP_MOVREG; aluop <= ALU_OP_SUB; useAluResult <= '1'; opsize <= '0';                      source1 <= OPSOURCE_MODRM_REG; source2 <= OPSOURCE_MEM;          cpustage <= CPUSTAGE_MODRM;         optarget <= OPTARGET_MODRM_REG; 
                        when x"2B" => opcode <= OP_MOVREG; aluop <= ALU_OP_SUB; useAluResult <= '1'; opsize <= '1';                      source1 <= OPSOURCE_MODRM_REG; source2 <= OPSOURCE_MEM;          cpustage <= CPUSTAGE_MODRM;         optarget <= OPTARGET_MODRM_REG; 
                        when x"2C" => opcode <= OP_MOVREG; aluop <= ALU_OP_SUB; useAluResult <= '1'; opsize <= '0'; instantFetch <= '1'; source1 <= OPSOURCE_ACC;       source2 <= OPSOURCE_FETCHVALUE8;  cpustage <= CPUSTAGE_FETCHDATA2_8 ; optarget <= OPTARGET_DECODE; target_decode <= CPU_REG_al;
                        when x"2D" => opcode <= OP_MOVREG; aluop <= ALU_OP_SUB; useAluResult <= '1'; opsize <= '1'; instantFetch <= '1'; source1 <= OPSOURCE_ACC;       source2 <= OPSOURCE_FETCHVALUE16; cpustage <= CPUSTAGE_FETCHDATA2_16; optarget <= OPTARGET_DECODE; target_decode <= CPU_REG_ax;

                        when x"2E" => prefixSegmentCS <= '1'; isPrefix := '1'; irqBlocked <= '1'; usePrefix := '1'; cpu_done <= '1'; newBuf := dbuf + 1; cpustage <= CPUSTAGE_IDLE;
      
                        when x"2F" => opcode <= OP_MOVREG; aluop <= ALU_OP_DECADJUST; useAluResult <= '1'; newDelay := 10; opsize <= '0';  cpustage <= CPUSTAGE_EXECUTE; target_decode <= CPU_REG_al; optarget <= OPTARGET_DECODE; adjustNegate <= '1';
      
                        when x"30" => opcode <= OP_MOVMEM; aluop <= ALU_OP_XOR; useAluResult <= '1'; opsize <= '0'; newDelay := 1;       source1 <= OPSOURCE_MEM;       source2 <= OPSOURCE_MODRM_REG;    cpustage <= CPUSTAGE_MODRM;         optarget <= OPTARGET_MEM; 
                        when x"31" => opcode <= OP_MOVMEM; aluop <= ALU_OP_XOR; useAluResult <= '1'; opsize <= '1'; newDelay := 1;       source1 <= OPSOURCE_MEM;       source2 <= OPSOURCE_MODRM_REG;    cpustage <= CPUSTAGE_MODRM;         optarget <= OPTARGET_MEM; 
                        when x"32" => opcode <= OP_MOVREG; aluop <= ALU_OP_XOR; useAluResult <= '1'; opsize <= '0';                      source1 <= OPSOURCE_MODRM_REG; source2 <= OPSOURCE_MEM;          cpustage <= CPUSTAGE_MODRM;         optarget <= OPTARGET_MODRM_REG; 
                        when x"33" => opcode <= OP_MOVREG; aluop <= ALU_OP_XOR; useAluResult <= '1'; opsize <= '1';                      source1 <= OPSOURCE_MODRM_REG; source2 <= OPSOURCE_MEM;          cpustage <= CPUSTAGE_MODRM;         optarget <= OPTARGET_MODRM_REG; 
                        when x"34" => opcode <= OP_MOVREG; aluop <= ALU_OP_XOR; useAluResult <= '1'; opsize <= '0'; instantFetch <= '1'; source1 <= OPSOURCE_ACC;       source2 <= OPSOURCE_FETCHVALUE8;  cpustage <= CPUSTAGE_FETCHDATA2_8 ; optarget <= OPTARGET_DECODE; target_decode <= CPU_REG_al;
                        when x"35" => opcode <= OP_MOVREG; aluop <= ALU_OP_XOR; useAluResult <= '1'; opsize <= '1'; instantFetch <= '1'; source1 <= OPSOURCE_ACC;       source2 <= OPSOURCE_FETCHVALUE16; cpustage <= CPUSTAGE_FETCHDATA2_16; optarget <= OPTARGET_DECODE; target_decode <= CPU_REG_ax;

                        when x"36" => prefixSegmentSS <= '1'; isPrefix := '1'; irqBlocked <= '1'; usePrefix := '1'; cpu_done <= '1'; newBuf := dbuf + 1; cpustage <= CPUSTAGE_IDLE;
      
                        when x"37" => opcode <= OP_MOVREG; aluop <= ALU_OP_ASCIIADJUST; useAluResult <= '1'; newDelay := 8; opsize <= '1';  cpustage <= CPUSTAGE_EXECUTE; target_decode <= CPU_REG_ax; optarget <= OPTARGET_DECODE; adjustNegate <= '0';
      
                        when x"38" => opcode <= OP_NOP; aluop <= ALU_OP_CMP; opsize <= '0';                      source1 <= OPSOURCE_MEM;       source2 <= OPSOURCE_MODRM_REG;    cpustage <= CPUSTAGE_MODRM;        
                        when x"39" => opcode <= OP_NOP; aluop <= ALU_OP_CMP; opsize <= '1';                      source1 <= OPSOURCE_MEM;       source2 <= OPSOURCE_MODRM_REG;    cpustage <= CPUSTAGE_MODRM;        
                        when x"3A" => opcode <= OP_NOP; aluop <= ALU_OP_CMP; opsize <= '0';                      source1 <= OPSOURCE_MODRM_REG; source2 <= OPSOURCE_MEM;          cpustage <= CPUSTAGE_MODRM;        
                        when x"3B" => opcode <= OP_NOP; aluop <= ALU_OP_CMP; opsize <= '1';                      source1 <= OPSOURCE_MODRM_REG; source2 <= OPSOURCE_MEM;          cpustage <= CPUSTAGE_MODRM;        
                        when x"3C" => opcode <= OP_NOP; aluop <= ALU_OP_CMP; opsize <= '0'; instantFetch <= '1'; source1 <= OPSOURCE_ACC;       source2 <= OPSOURCE_FETCHVALUE8;  cpustage <= CPUSTAGE_FETCHDATA2_8 ;
                        when x"3D" => opcode <= OP_NOP; aluop <= ALU_OP_CMP; opsize <= '1'; instantFetch <= '1'; source1 <= OPSOURCE_ACC;       source2 <= OPSOURCE_FETCHVALUE16; cpustage <= CPUSTAGE_FETCHDATA2_16;

                        when x"3E" => prefixSegmentDS <= '1'; isPrefix := '1'; irqBlocked <= '1'; usePrefix := '1'; cpu_done <= '1'; newBuf := dbuf + 1; cpustage <= CPUSTAGE_IDLE;

                        when x"3F" => opcode <= OP_MOVREG; aluop <= ALU_OP_ASCIIADJUST; useAluResult <= '1'; newDelay := 8; opsize <= '1';  cpustage <= CPUSTAGE_EXECUTE; target_decode <= CPU_REG_ax; optarget <= OPTARGET_DECODE; adjustNegate <= '1';

                        when x"40" => opcode <= OP_MOVREG; cpustage <= CPUSTAGE_EXECUTE; aluop <= ALU_OP_INC; source1 <= OPSOURCE_REG_ax; source2 <= OPSOURCE_IMMIDIATE; immidiate8 <= x"01"; target_decode <= CPU_REG_ax; optarget <= OPTARGET_DECODE; opsize <= '1'; useAluResult <= '1'; 
                        when x"41" => opcode <= OP_MOVREG; cpustage <= CPUSTAGE_EXECUTE; aluop <= ALU_OP_INC; source1 <= OPSOURCE_REG_cx; source2 <= OPSOURCE_IMMIDIATE; immidiate8 <= x"01"; target_decode <= CPU_REG_cx; optarget <= OPTARGET_DECODE; opsize <= '1'; useAluResult <= '1';
                        when x"42" => opcode <= OP_MOVREG; cpustage <= CPUSTAGE_EXECUTE; aluop <= ALU_OP_INC; source1 <= OPSOURCE_REG_dx; source2 <= OPSOURCE_IMMIDIATE; immidiate8 <= x"01"; target_decode <= CPU_REG_dx; optarget <= OPTARGET_DECODE; opsize <= '1'; useAluResult <= '1';
                        when x"43" => opcode <= OP_MOVREG; cpustage <= CPUSTAGE_EXECUTE; aluop <= ALU_OP_INC; source1 <= OPSOURCE_REG_bx; source2 <= OPSOURCE_IMMIDIATE; immidiate8 <= x"01"; target_decode <= CPU_REG_bx; optarget <= OPTARGET_DECODE; opsize <= '1'; useAluResult <= '1';
                        when x"44" => opcode <= OP_MOVREG; cpustage <= CPUSTAGE_EXECUTE; aluop <= ALU_OP_INC; source1 <= OPSOURCE_REG_sp; source2 <= OPSOURCE_IMMIDIATE; immidiate8 <= x"01"; target_decode <= CPU_REG_sp; optarget <= OPTARGET_DECODE; opsize <= '1'; useAluResult <= '1';
                        when x"45" => opcode <= OP_MOVREG; cpustage <= CPUSTAGE_EXECUTE; aluop <= ALU_OP_INC; source1 <= OPSOURCE_REG_bp; source2 <= OPSOURCE_IMMIDIATE; immidiate8 <= x"01"; target_decode <= CPU_REG_bp; optarget <= OPTARGET_DECODE; opsize <= '1'; useAluResult <= '1';
                        when x"46" => opcode <= OP_MOVREG; cpustage <= CPUSTAGE_EXECUTE; aluop <= ALU_OP_INC; source1 <= OPSOURCE_REG_si; source2 <= OPSOURCE_IMMIDIATE; immidiate8 <= x"01"; target_decode <= CPU_REG_si; optarget <= OPTARGET_DECODE; opsize <= '1'; useAluResult <= '1';
                        when x"47" => opcode <= OP_MOVREG; cpustage <= CPUSTAGE_EXECUTE; aluop <= ALU_OP_INC; source1 <= OPSOURCE_REG_di; source2 <= OPSOURCE_IMMIDIATE; immidiate8 <= x"01"; target_decode <= CPU_REG_di; optarget <= OPTARGET_DECODE; opsize <= '1'; useAluResult <= '1';
                        when x"48" => opcode <= OP_MOVREG; cpustage <= CPUSTAGE_EXECUTE; aluop <= ALU_OP_DEC; source1 <= OPSOURCE_REG_ax; source2 <= OPSOURCE_IMMIDIATE; immidiate8 <= x"01"; target_decode <= CPU_REG_ax; optarget <= OPTARGET_DECODE; opsize <= '1'; useAluResult <= '1';
                        when x"49" => opcode <= OP_MOVREG; cpustage <= CPUSTAGE_EXECUTE; aluop <= ALU_OP_DEC; source1 <= OPSOURCE_REG_cx; source2 <= OPSOURCE_IMMIDIATE; immidiate8 <= x"01"; target_decode <= CPU_REG_cx; optarget <= OPTARGET_DECODE; opsize <= '1'; useAluResult <= '1';
                        when x"4A" => opcode <= OP_MOVREG; cpustage <= CPUSTAGE_EXECUTE; aluop <= ALU_OP_DEC; source1 <= OPSOURCE_REG_dx; source2 <= OPSOURCE_IMMIDIATE; immidiate8 <= x"01"; target_decode <= CPU_REG_dx; optarget <= OPTARGET_DECODE; opsize <= '1'; useAluResult <= '1';
                        when x"4B" => opcode <= OP_MOVREG; cpustage <= CPUSTAGE_EXECUTE; aluop <= ALU_OP_DEC; source1 <= OPSOURCE_REG_bx; source2 <= OPSOURCE_IMMIDIATE; immidiate8 <= x"01"; target_decode <= CPU_REG_bx; optarget <= OPTARGET_DECODE; opsize <= '1'; useAluResult <= '1';
                        when x"4C" => opcode <= OP_MOVREG; cpustage <= CPUSTAGE_EXECUTE; aluop <= ALU_OP_DEC; source1 <= OPSOURCE_REG_sp; source2 <= OPSOURCE_IMMIDIATE; immidiate8 <= x"01"; target_decode <= CPU_REG_sp; optarget <= OPTARGET_DECODE; opsize <= '1'; useAluResult <= '1';
                        when x"4D" => opcode <= OP_MOVREG; cpustage <= CPUSTAGE_EXECUTE; aluop <= ALU_OP_DEC; source1 <= OPSOURCE_REG_bp; source2 <= OPSOURCE_IMMIDIATE; immidiate8 <= x"01"; target_decode <= CPU_REG_bp; optarget <= OPTARGET_DECODE; opsize <= '1'; useAluResult <= '1';
                        when x"4E" => opcode <= OP_MOVREG; cpustage <= CPUSTAGE_EXECUTE; aluop <= ALU_OP_DEC; source1 <= OPSOURCE_REG_si; source2 <= OPSOURCE_IMMIDIATE; immidiate8 <= x"01"; target_decode <= CPU_REG_si; optarget <= OPTARGET_DECODE; opsize <= '1'; useAluResult <= '1';
                        when x"4F" => opcode <= OP_MOVREG; cpustage <= CPUSTAGE_EXECUTE; aluop <= ALU_OP_DEC; source1 <= OPSOURCE_REG_di; source2 <= OPSOURCE_IMMIDIATE; immidiate8 <= x"01"; target_decode <= CPU_REG_di; optarget <= OPTARGET_DECODE; opsize <= '1'; useAluResult <= '1';

                        when x"50" => pushlist <= REGPOS_ax; cpustage <= CPUSTAGE_CHECKDATAREADY; newBuf := dbuf + 1;
                        when x"51" => pushlist <= REGPOS_cx; cpustage <= CPUSTAGE_CHECKDATAREADY; newBuf := dbuf + 1;
                        when x"52" => pushlist <= REGPOS_dx; cpustage <= CPUSTAGE_CHECKDATAREADY; newBuf := dbuf + 1;
                        when x"53" => pushlist <= REGPOS_bx; cpustage <= CPUSTAGE_CHECKDATAREADY; newBuf := dbuf + 1;
                        when x"54" => pushlist <= REGPOS_sp; cpustage <= CPUSTAGE_CHECKDATAREADY; newBuf := dbuf + 1;
                        when x"55" => pushlist <= REGPOS_bp; cpustage <= CPUSTAGE_CHECKDATAREADY; newBuf := dbuf + 1;
                        when x"56" => pushlist <= REGPOS_si; cpustage <= CPUSTAGE_CHECKDATAREADY; newBuf := dbuf + 1;
                        when x"57" => pushlist <= REGPOS_di; cpustage <= CPUSTAGE_CHECKDATAREADY; newBuf := dbuf + 1;
                        when x"58" => poplist  <= REGPOS_ax; cpustage <= CPUSTAGE_CHECKDATAREADY; newBuf := dbuf + 1;
                        when x"59" => poplist  <= REGPOS_cx; cpustage <= CPUSTAGE_CHECKDATAREADY; newBuf := dbuf + 1;
                        when x"5A" => poplist  <= REGPOS_dx; cpustage <= CPUSTAGE_CHECKDATAREADY; newBuf := dbuf + 1;
                        when x"5B" => poplist  <= REGPOS_bx; cpustage <= CPUSTAGE_CHECKDATAREADY; newBuf := dbuf + 1;
                        when x"5C" => poplist  <= REGPOS_sp; cpustage <= CPUSTAGE_CHECKDATAREADY; newBuf := dbuf + 1;
                        when x"5D" => poplist  <= REGPOS_bp; cpustage <= CPUSTAGE_CHECKDATAREADY; newBuf := dbuf + 1;
                        when x"5E" => poplist  <= REGPOS_si; cpustage <= CPUSTAGE_CHECKDATAREADY; newBuf := dbuf + 1;
                        when x"5F" => poplist  <= REGPOS_di; cpustage <= CPUSTAGE_CHECKDATAREADY; newBuf := dbuf + 1;

                        when x"60" => pushlist <= REGPOS_ax or REGPOS_cx or REGPOS_dx or REGPOS_bx or REGPOS_sp or REGPOS_bp or REGPOS_si or REGPOS_di; cpustage <= CPUSTAGE_CHECKDATAREADY;
                        when x"61" => poplist  <= REGPOS_ax or REGPOS_cx or REGPOS_dx or REGPOS_bx or REGPOS_bp or REGPOS_si or REGPOS_di;              cpustage <= CPUSTAGE_CHECKDATAREADY; newDelay := 1; 

                        when x"62" => opcode <= OP_BOUND; newDelay := 4; opsize <= '1'; cpustage <= CPUSTAGE_MODRM; source1 <= OPSOURCE_MEM; source2 <= OPSOURCE_MEM;

                        -- when x"63" => ?
                        -- when x"64" => repnc
                        -- when x"65" => repc
                        -- when x"66" => fpo2
                        -- when x"67" => fpo2
                        
                        when x"68" => pushlist <= REGPOS_imm; cpustage <= CPUSTAGE_PUSH; opsize <= '1'; newBuf := dbuf + 1; fetch1Val <= unsigned(prefetchBuffer(23 downto 8)); regs.reg_ip <= regs.reg_ip + 2; consumePrefetch <= 2;
                        when x"69" => opcode <= OP_MOVREG; aluop <= ALU_OP_MULI; newDelay := 3; useAluResult <= '1'; opsize <= '1'; source1 <= OPSOURCE_FETCHVALUE16; source2 <= OPSOURCE_MEM; cpustage <= CPUSTAGE_MODRM; optarget <= OPTARGET_MODRM_REG;
                        when x"6A" => pushlist <= REGPOS_imm; cpustage <= CPUSTAGE_PUSH; opsize <= '0'; newBuf := dbuf + 1; fetch1Val <= x"00" & unsigned(prefetchBuffer(15 downto 8)); regs.reg_ip <= regs.reg_ip + 1; consumePrefetch <= 1;
                        when x"6B" => opcode <= OP_MOVREG; aluop <= ALU_OP_MULI; newDelay := 3; useAluResult <= '1'; opsize <= '1'; source1 <= OPSOURCE_FETCHVALUE8;  source2 <= OPSOURCE_MEM; cpustage <= CPUSTAGE_MODRM; optarget <= OPTARGET_MODRM_REG;
                        
                        when x"6C" => opcode <= OP_OPIN;       newDelay := 5; opcodeNext <= OP_STRINGSTORE; opsize <= '0'; cpustage <= CPUSTAGE_FETCHDATA1_8; source1 <= OPSOURCE_FETCHVALUE8; source2 <= OPSOURCE_MEM;
                        when x"6D" => opcode <= OP_OPIN;       newDelay := 4; opcodeNext <= OP_STRINGSTORE; opsize <= '1'; cpustage <= CPUSTAGE_FETCHDATA1_8; source1 <= OPSOURCE_FETCHVALUE8; source2 <= OPSOURCE_MEM;
                        when x"6E" => opcode <= OP_STRINGLOAD; newDelay := 5; opcodeNext <= OP_OPOUT;       opsize <= '0'; cpustage <= CPUSTAGE_EXECUTE;      source1 <= OPSOURCE_REG_dx;      source2 <= OPSOURCE_STRINGLOAD1;
                        when x"6F" => opcode <= OP_STRINGLOAD; newDelay := 1; opcodeNext <= OP_OPOUT;       opsize <= '1'; cpustage <= CPUSTAGE_EXECUTE;      source1 <= OPSOURCE_REG_dx;      source2 <= OPSOURCE_STRINGLOAD1;
                        
                        when x"70" | x"71" | x"72" | x"73" | x"74" | x"75" | x"76" | x"77" | x"78" | x"79" | x"7a" | x"7b" | x"7c" | x"7d" | x"7e" | x"7f" =>
                           opcode <= OP_JUMPIF; source1 <= OPSOURCE_FETCHVALUE8; cpustage <= CPUSTAGE_FETCHDATA1_8;
                     
                        when x"80" => opcode <= OP_MEMIMM1; cpustage <= CPUSTAGE_MODRM; source1 <= OPSOURCE_MEM; source2 <= OPSOURCE_FETCHVALUE8;  optarget <= OPTARGET_MEM; useAluResult <= '1'; opsize <= '0'; opsign <= '0';
                        when x"81" => opcode <= OP_MEMIMM1; cpustage <= CPUSTAGE_MODRM; source1 <= OPSOURCE_MEM; source2 <= OPSOURCE_FETCHVALUE16; optarget <= OPTARGET_MEM; useAluResult <= '1'; opsize <= '1'; opsign <= '0';
                        when x"82" => opcode <= OP_MEMIMM1; cpustage <= CPUSTAGE_MODRM; source1 <= OPSOURCE_MEM; source2 <= OPSOURCE_FETCHVALUE8;  optarget <= OPTARGET_MEM; useAluResult <= '1'; opsize <= '0'; opsign <= '1';
                        when x"83" => opcode <= OP_MEMIMM1; cpustage <= CPUSTAGE_MODRM; source1 <= OPSOURCE_MEM; source2 <= OPSOURCE_FETCHVALUE8;  optarget <= OPTARGET_MEM; useAluResult <= '1'; opsize <= '1'; opsign <= '1';

                        when x"84" => opcode <= OP_NOP; cpustage <= CPUSTAGE_MODRM; opsize <= '0'; aluop <= ALU_OP_TST; source1 <= OPSOURCE_MEM; source2 <= OPSOURCE_MODRM_REG;
                        when x"85" => opcode <= OP_NOP; cpustage <= CPUSTAGE_MODRM; opsize <= '1'; aluop <= ALU_OP_TST; source1 <= OPSOURCE_MEM; source2 <= OPSOURCE_MODRM_REG;

                        when x"86" => opcode <= OP_MOVMEM; newDelay := 2; opcodeNext <= OP_MOVREG; opsize <= '0'; cpustage <= CPUSTAGE_MODRM; source1 <= OPSOURCE_MODRM_REG; source2 <= OPSOURCE_MEM; optarget <= OPTARGET_MEM; optarget2 <= OPTARGET_MODRM_REG;
                        when x"87" => opcode <= OP_MOVMEM; newDelay := 2; opcodeNext <= OP_MOVREG; opsize <= '1'; cpustage <= CPUSTAGE_MODRM; source1 <= OPSOURCE_MODRM_REG; source2 <= OPSOURCE_MEM; optarget <= OPTARGET_MEM; optarget2 <= OPTARGET_MODRM_REG;

                        when x"88" => opcode <= OP_MOVMEM; cpustage <= CPUSTAGE_MODRM; opsize <= '0'; source1 <= OPSOURCE_MODRM_REG; optarget <= OPTARGET_MEM;
                        when x"89" => opcode <= OP_MOVMEM; cpustage <= CPUSTAGE_MODRM; opsize <= '1'; source1 <= OPSOURCE_MODRM_REG; optarget <= OPTARGET_MEM;
                        when x"8A" => opcode <= OP_MOVREG; cpustage <= CPUSTAGE_MODRM; opsize <= '0'; source1 <= OPSOURCE_MEM;       optarget <= OPTARGET_MODRM_REG; newBuf := dbuf + 1;
                        when x"8B" => opcode <= OP_MOVREG; cpustage <= CPUSTAGE_MODRM; opsize <= '1'; source1 <= OPSOURCE_MEM;       optarget <= OPTARGET_MODRM_REG; newBuf := dbuf + 1;
                     
                        when x"8C" => opcode <= OP_MOVMEM; cpustage <= CPUSTAGE_MODRM; opsize <= '1'; source1 <= OPSOURCE_MODRM_REG; segmentaccess <= '1'; optarget <= OPTARGET_MEM; irqBlocked <= '1';
                     
                        when x"8D" => opcode <= OP_MOVREG; cpustage <= CPUSTAGE_MODRM; opsize <= '1'; source1 <= OPSOURCE_MODRM_ADDR; optarget <= OPTARGET_MODRM_REG;
                     
                        when x"8E" => opcode <= OP_MOVREG; cpustage <= CPUSTAGE_MODRM; opsize <= '1'; source1 <= OPSOURCE_MEM;       optarget <= OPTARGET_MODRM_REG; segmentaccess <= '1'; newDelay := 1; 
                    
                        when x"8F" => opcode <= OP_MOVMEM; poplist <= REGPOS_mem; cpustage <= CPUSTAGE_MODRM; source1 <= OPSOURCE_POPVALUE; optarget <= OPTARGET_MEM; opsize <= '1'; newDelay := 1; 
                    
                        -- when x"90" => NOP
                    
                     	when x"91" => opcode <= OP_EXCHANGE; cpustage <= CPUSTAGE_EXECUTE; newDelay := 2;
                        when x"92" => opcode <= OP_EXCHANGE; cpustage <= CPUSTAGE_EXECUTE; newDelay := 2;
                        when x"93" => opcode <= OP_EXCHANGE; cpustage <= CPUSTAGE_EXECUTE; newDelay := 2;
                        when x"94" => opcode <= OP_EXCHANGE; cpustage <= CPUSTAGE_EXECUTE; newDelay := 2;
                        when x"95" => opcode <= OP_EXCHANGE; cpustage <= CPUSTAGE_EXECUTE; newDelay := 2;
                        when x"96" => opcode <= OP_EXCHANGE; cpustage <= CPUSTAGE_EXECUTE; newDelay := 2;
                        when x"97" => opcode <= OP_EXCHANGE; cpustage <= CPUSTAGE_EXECUTE; newDelay := 2;
                    
                        when x"98" => opcode <= OP_MOVREG; cpustage <= CPUSTAGE_EXECUTE; aluop <= ALU_OP_SXT; source1 <= OPSOURCE_ACC; opsize <= '1'; useAluResult <= '1'; optarget <= OPTARGET_DECODE; target_decode <= CPU_REG_ax;
                        when x"99" => opcode <= OP_MOVREG; cpustage <= CPUSTAGE_EXECUTE; aluop <= ALU_OP_SXT; source1 <= OPSOURCE_ACC; opsize <= '1'; useAluResult <= '1'; optarget <= OPTARGET_DECODE; target_decode <= CPU_REG_dx;
                    
                        when x"9A" => opcode <= OP_JUMPFAR; newDelay := 4; cpustage <= CPUSTAGE_FETCHDATA1_16; pushlist <= REGPOS_cs or REGPOS_ip; source1 <= OPSOURCE_FETCHVALUE16; source2 <= OPSOURCE_FETCHVALUE16;
                    
                        -- when x"9B" => wait
                        
                        when x"9C" => pushlist <= REGPOS_f; cpustage <= CPUSTAGE_CHECKDATAREADY;
                        when x"9D" => poplist  <= REGPOS_f; cpustage <= CPUSTAGE_CHECKDATAREADY; irqBlocked <= '1'; newDelay := 1; 
                    
                        when x"9E" => opcode <= OP_FLAGSFROMACC; newDelay := 3; cpustage <= CPUSTAGE_EXECUTE;
                        when x"9F" => opcode <= OP_FLAGSTOACC;   newDelay := 1; cpustage <= CPUSTAGE_EXECUTE;
                    
                        when x"A0" => opcode <= OP_MOVREG; newBuf := dbuf + 1; memAddr <= unsigned(prefetchBuffer(23 downto 8)); regs.reg_ip <= regs.reg_ip + 2; consumePrefetch <= 2; cpustage <= CPUSTAGE_CHECKDATAREADY; opsize <= '0'; source1 <= OPSOURCE_MEM; target_decode <= CPU_REG_al; optarget <= OPTARGET_DECODE;
                        when x"A1" => opcode <= OP_MOVREG; newBuf := dbuf + 1; memAddr <= unsigned(prefetchBuffer(23 downto 8)); regs.reg_ip <= regs.reg_ip + 2; consumePrefetch <= 2; cpustage <= CPUSTAGE_CHECKDATAREADY; opsize <= '1'; source1 <= OPSOURCE_MEM; target_decode <= CPU_REG_ax; optarget <= OPTARGET_DECODE;              
                        when x"A2" => opcode <= OP_MOVMEM;                     memAddr <= unsigned(prefetchBuffer(23 downto 8)); regs.reg_ip <= regs.reg_ip + 2; consumePrefetch <= 2; cpustage <= CPUSTAGE_CHECKDATAREADY; opsize <= '0'; source1 <= OPSOURCE_ACC; optarget <= OPTARGET_MEM;
                        when x"A3" => opcode <= OP_MOVMEM;                     memAddr <= unsigned(prefetchBuffer(23 downto 8)); regs.reg_ip <= regs.reg_ip + 2; consumePrefetch <= 2; cpustage <= CPUSTAGE_CHECKDATAREADY; opsize <= '1'; source1 <= OPSOURCE_ACC; optarget <= OPTARGET_MEM;
                        
                        when x"A4" => opcode <= OP_STRINGLOAD; newDelay := 3; opcodeNext <= OP_STRINGSTORE; opsize <= '0'; cpustage <= CPUSTAGE_EXECUTE; source1 <= OPSOURCE_STRINGLOAD1; usePrefix := '1';
                        when x"A5" => opcode <= OP_STRINGLOAD; newDelay := 1; opcodeNext <= OP_STRINGSTORE; opsize <= '1'; cpustage <= CPUSTAGE_EXECUTE; source1 <= OPSOURCE_STRINGLOAD1; usePrefix := '1';	
                    
                        when x"A6" => opcode <= OP_STRINGLOAD; newDelay := 2; opcodeNext <= OP_STRINGCOMPARE; opsize <= '0'; cpustage <= CPUSTAGE_EXECUTE; source1 <= OPSOURCE_STRINGLOAD1; source2 <= OPSOURCE_STRINGLOAD2; usePrefix := '1';
                        when x"A7" => opcode <= OP_STRINGLOAD;                opcodeNext <= OP_STRINGCOMPARE; opsize <= '1'; cpustage <= CPUSTAGE_EXECUTE; source1 <= OPSOURCE_STRINGLOAD1; source2 <= OPSOURCE_STRINGLOAD2; usePrefix := '1';

                        when x"A8" => opcode <= OP_NOP; opsize <= '0'; cpustage <= CPUSTAGE_FETCHDATA1_8 ; aluop <= ALU_OP_TST; source1 <= OPSOURCE_FETCHVALUE8;  source2 <= OPSOURCE_ACC; instantFetch <= '1';
                        when x"A9" => opcode <= OP_NOP; opsize <= '1'; cpustage <= CPUSTAGE_FETCHDATA1_16; aluop <= ALU_OP_TST; source1 <= OPSOURCE_FETCHVALUE16; source2 <= OPSOURCE_ACC; instantFetch <= '1';
                    
                        when x"AA" => opcode <= OP_STRINGSTORE; newDelay := 2; opsize <= '0'; cpustage <= CPUSTAGE_EXECUTE; source1 <= OPSOURCE_ACC; usePrefix := '1';
                        when x"AB" => opcode <= OP_STRINGSTORE; newDelay := 1; opsize <= '1'; cpustage <= CPUSTAGE_EXECUTE; source1 <= OPSOURCE_ACC; usePrefix := '1';
                    
                        when x"AC" => opcode <= OP_STRINGLOAD; newDelay := 1; opcodeNext <= OP_MOVREG; opsize <= '0'; source1 <= OPSOURCE_STRINGLOAD1; cpustage <= CPUSTAGE_EXECUTE; usePrefix := '1'; target_decode <= CPU_REG_al; optarget <= OPTARGET_DECODE;
                        when x"AD" => opcode <= OP_STRINGLOAD;             opcodeNext <= OP_MOVREG; opsize <= '1'; source1 <= OPSOURCE_STRINGLOAD1; cpustage <= CPUSTAGE_EXECUTE; usePrefix := '1'; target_decode <= CPU_REG_ax; optarget <= OPTARGET_DECODE;
   
                        when x"AE" => opcode <= OP_STRINGCOMPARE; newDelay := 1; opsize <= '0'; cpustage <= CPUSTAGE_EXECUTE; source1 <= OPSOURCE_ACC; source2 <= OPSOURCE_STRINGLOAD2; usePrefix := '1';
                        when x"AF" => opcode <= OP_STRINGCOMPARE;                opsize <= '1'; cpustage <= CPUSTAGE_EXECUTE; source1 <= OPSOURCE_ACC; source2 <= OPSOURCE_STRINGLOAD2; usePrefix := '1';
                    
                        when x"B0" => opcode <= OP_MOVREG; target_decode <= CPU_REG_al; cpustage <= CPUSTAGE_FETCHDATA1_8 ; source1 <= OPSOURCE_FETCHVALUE8;  opsize <= '0'; optarget <= OPTARGET_DECODE; instantFetch <= '1';
                        when x"B1" => opcode <= OP_MOVREG; target_decode <= CPU_REG_cl; cpustage <= CPUSTAGE_FETCHDATA1_8 ; source1 <= OPSOURCE_FETCHVALUE8;  opsize <= '0'; optarget <= OPTARGET_DECODE; instantFetch <= '1';
                        when x"B2" => opcode <= OP_MOVREG; target_decode <= CPU_REG_dl; cpustage <= CPUSTAGE_FETCHDATA1_8 ; source1 <= OPSOURCE_FETCHVALUE8;  opsize <= '0'; optarget <= OPTARGET_DECODE; instantFetch <= '1';
                        when x"B3" => opcode <= OP_MOVREG; target_decode <= CPU_REG_bl; cpustage <= CPUSTAGE_FETCHDATA1_8 ; source1 <= OPSOURCE_FETCHVALUE8;  opsize <= '0'; optarget <= OPTARGET_DECODE; instantFetch <= '1';
                        when x"B4" => opcode <= OP_MOVREG; target_decode <= CPU_REG_ah; cpustage <= CPUSTAGE_FETCHDATA1_8 ; source1 <= OPSOURCE_FETCHVALUE8;  opsize <= '0'; optarget <= OPTARGET_DECODE; instantFetch <= '1';
                        when x"B5" => opcode <= OP_MOVREG; target_decode <= CPU_REG_ch; cpustage <= CPUSTAGE_FETCHDATA1_8 ; source1 <= OPSOURCE_FETCHVALUE8;  opsize <= '0'; optarget <= OPTARGET_DECODE; instantFetch <= '1';
                        when x"B6" => opcode <= OP_MOVREG; target_decode <= CPU_REG_dh; cpustage <= CPUSTAGE_FETCHDATA1_8 ; source1 <= OPSOURCE_FETCHVALUE8;  opsize <= '0'; optarget <= OPTARGET_DECODE; instantFetch <= '1';
                        when x"B7" => opcode <= OP_MOVREG; target_decode <= CPU_REG_bh; cpustage <= CPUSTAGE_FETCHDATA1_8 ; source1 <= OPSOURCE_FETCHVALUE8;  opsize <= '0'; optarget <= OPTARGET_DECODE; instantFetch <= '1';
                        when x"B8" => opcode <= OP_MOVREG; target_decode <= CPU_REG_ax; cpustage <= CPUSTAGE_FETCHDATA1_16; source1 <= OPSOURCE_FETCHVALUE16; opsize <= '1'; optarget <= OPTARGET_DECODE; instantFetch <= '1';
                        when x"B9" => opcode <= OP_MOVREG; target_decode <= CPU_REG_cx; cpustage <= CPUSTAGE_FETCHDATA1_16; source1 <= OPSOURCE_FETCHVALUE16; opsize <= '1'; optarget <= OPTARGET_DECODE; instantFetch <= '1';
                        when x"BA" => opcode <= OP_MOVREG; target_decode <= CPU_REG_dx; cpustage <= CPUSTAGE_FETCHDATA1_16; source1 <= OPSOURCE_FETCHVALUE16; opsize <= '1'; optarget <= OPTARGET_DECODE; instantFetch <= '1';
                        when x"BB" => opcode <= OP_MOVREG; target_decode <= CPU_REG_bx; cpustage <= CPUSTAGE_FETCHDATA1_16; source1 <= OPSOURCE_FETCHVALUE16; opsize <= '1'; optarget <= OPTARGET_DECODE; instantFetch <= '1';
                        when x"BC" => opcode <= OP_MOVREG; target_decode <= CPU_REG_sp; cpustage <= CPUSTAGE_FETCHDATA1_16; source1 <= OPSOURCE_FETCHVALUE16; opsize <= '1'; optarget <= OPTARGET_DECODE; instantFetch <= '1';
                        when x"BD" => opcode <= OP_MOVREG; target_decode <= CPU_REG_bp; cpustage <= CPUSTAGE_FETCHDATA1_16; source1 <= OPSOURCE_FETCHVALUE16; opsize <= '1'; optarget <= OPTARGET_DECODE; instantFetch <= '1';
                        when x"BE" => opcode <= OP_MOVREG; target_decode <= CPU_REG_si; cpustage <= CPUSTAGE_FETCHDATA1_16; source1 <= OPSOURCE_FETCHVALUE16; opsize <= '1'; optarget <= OPTARGET_DECODE; instantFetch <= '1';
                        when x"BF" => opcode <= OP_MOVREG; target_decode <= CPU_REG_di; cpustage <= CPUSTAGE_FETCHDATA1_16; source1 <= OPSOURCE_FETCHVALUE16; opsize <= '1'; optarget <= OPTARGET_DECODE; instantFetch <= '1';
                                    	
                        when x"C0" => opcode <= OP_MEMIMM2; newDelay := 2; cpustage <= CPUSTAGE_MODRM; opsize <= '0'; source1 <= OPSOURCE_MEM; source2 <= OPSOURCE_FETCHVALUE8; useAluResult <= '1'; optarget <= OPTARGET_MEM;
                        when x"C1" => opcode <= OP_MEMIMM2; newDelay := 2; cpustage <= CPUSTAGE_MODRM; opsize <= '1'; source1 <= OPSOURCE_MEM; source2 <= OPSOURCE_FETCHVALUE8; useAluResult <= '1'; optarget <= OPTARGET_MEM;
                                 
                        when x"C2" => opcode <= OP_RETURNFAR; opsize <= '1'; source1 <= OPSOURCE_FETCHVALUE16; cpustage <= CPUSTAGE_FETCHDATA1_16; newDelay := 1; poplist <= REGPOS_ip;
                                 
                        when x"C3" => newDelay := 1; poplist <= REGPOS_ip; cpustage <= CPUSTAGE_CHECKDATAREADY;
                             
                        when x"C4" => opcode <= OP_MOVREG; newDelay := 3; cpustage <= CPUSTAGE_MODRM; opsize <= '1'; source1 <= OPSOURCE_MEM; source2 <= OPSOURCE_MEM; optarget <= OPTARGET_MODRM_REG;
                        when x"C5" => opcode <= OP_MOVREG; newDelay := 3; cpustage <= CPUSTAGE_MODRM; opsize <= '1'; source1 <= OPSOURCE_MEM; source2 <= OPSOURCE_MEM; optarget <= OPTARGET_MODRM_REG;
                             
                        when x"C6" => opcode <= OP_MOVMEM; cpustage <= CPUSTAGE_MODRM; opsize <= '0'; source1 <= OPSOURCE_FETCHVALUE8;  optarget <= OPTARGET_MEM; newBuf := dbuf + 1;
                        when x"C7" => opcode <= OP_MOVMEM; cpustage <= CPUSTAGE_MODRM; opsize <= '1'; source1 <= OPSOURCE_FETCHVALUE16; optarget <= OPTARGET_MEM; newBuf := dbuf + 1;
                     
                        when x"C8" => opcode <= OP_ENTER; cpustage <= CPUSTAGE_FETCHDATA1_16; newDelay := 6; pushlist <= REGPOS_bp; opsize <= '0'; source1 <= OPSOURCE_FETCHVALUE16; source2 <= OPSOURCE_FETCHVALUE8;
                        when x"C9" => opcode <= OP_MOVREG; regs.reg_sp <= regs.reg_bp; poplist <= REGPOS_MEM; cpustage <= CPUSTAGE_POP_REQ; source1 <= OPSOURCE_POPVALUE; target_decode <= CPU_REG_bp; optarget <= OPTARGET_DECODE;
            
                        when x"CA" => opcode <= OP_RETURNFAR; opsize <= '1'; source1 <= OPSOURCE_FETCHVALUE16; cpustage <= CPUSTAGE_FETCHDATA1_16; poplist <= REGPOS_cs or REGPOS_ip;
                     
                        when x"CB" => newDelay := 2; poplist <= REGPOS_cs or REGPOS_ip; cpustage <= CPUSTAGE_CHECKDATAREADY;
               
                        when x"CC" => opcode <= OP_IRQREQUEST; newDelay := 9;  cpustage <= CPUSTAGE_EXECUTE;      source1 <= OPSOURCE_IMMIDIATE; immidiate8 <= x"03";
                        when x"CD" => opcode <= OP_IRQREQUEST; newDelay := 10; cpustage <= CPUSTAGE_FETCHDATA1_8; source1 <= OPSOURCE_FETCHVALUE8;
                        when x"CE" => opcode <= OP_IRQREQUEST; newDelay := 6;  cpustage <= CPUSTAGE_EXECUTE;      source1 <= OPSOURCE_IMMIDIATE; immidiate8 <= x"04";
               
                        when x"CF" => newDelay := 3; poplist <= REGPOS_cs or REGPOS_ip or REGPOS_f; cpustage <= CPUSTAGE_CHECKDATAREADY; irqBlocked <= '1';
                     
                        when x"D0" => opcode <= OP_MEMIMM2; cpustage <= CPUSTAGE_MODRM; opsize <= '0'; source1 <= OPSOURCE_MEM; source2 <= OPSOURCE_IMMIDIATE; useAluResult <= '1'; optarget <= OPTARGET_MEM; newDelay := 1; immidiate8 <= x"01";
                        when x"D1" => opcode <= OP_MEMIMM2; cpustage <= CPUSTAGE_MODRM; opsize <= '1'; source1 <= OPSOURCE_MEM; source2 <= OPSOURCE_IMMIDIATE; useAluResult <= '1'; optarget <= OPTARGET_MEM; newDelay := 1; immidiate8 <= x"01";
                        when x"D2" => opcode <= OP_MEMIMM2; cpustage <= CPUSTAGE_MODRM; opsize <= '0'; source1 <= OPSOURCE_MEM; source2 <= OPSOURCE_IMMIDIATE; useAluResult <= '1'; optarget <= OPTARGET_MEM; newDelay := 3; immidiate8 <= regs.reg_cx(7 downto 0);
                        when x"D3" => opcode <= OP_MEMIMM2; cpustage <= CPUSTAGE_MODRM; opsize <= '1'; source1 <= OPSOURCE_MEM; source2 <= OPSOURCE_IMMIDIATE; useAluResult <= '1'; optarget <= OPTARGET_MEM; newDelay := 3; immidiate8 <= regs.reg_cx(7 downto 0);
                     
                        when x"D4" => opcode <= OP_MULADJUST; cpustage <= CPUSTAGE_FETCHDATA1_8; source1 <= OPSOURCE_FETCHVALUE8; newDelay := 2; opsize <= '1';
                        when x"D5" => opcode <= OP_DIVADJUST; cpustage <= CPUSTAGE_FETCHDATA1_8; source1 <= OPSOURCE_FETCHVALUE8; newDelay := 4; opsize <= '1';
                     
                     	when x"D6" | x"D7" => 
                           opcode <= OP_MOVREG; cpustage <= CPUSTAGE_CHECKDATAREADY; source1 <= OPSOURCE_MEM; opsize <= '0'; optarget <= OPTARGET_DECODE; target_decode <= CPU_REG_al; newDelay := 3;
                           memSegment <= regs.reg_ds;
                           if (prefixSegmentES = '1') then memSegment <= regs.reg_es; end if;
                           if (prefixSegmentCS = '1') then memSegment <= regs.reg_cs; end if;
                           if (prefixSegmentSS = '1') then memSegment <= regs.reg_ss; end if;
                           if (prefixSegmentDS = '1') then memSegment <= regs.reg_ds; end if;
                           memAddr <= regs.reg_bx + regs.reg_ax(7 downto 0);
                           if (opcodebyte = x"D6") then newDelay := 6; else newDelay := 3; end if;
                     
                        -- when x"D8" => fpo1
                        -- when x"D9" => fpo1
                        -- when x"DA" => fpo1
                        -- when x"DB" => fpo1
                        -- when x"DC" => fpo1
                        -- when x"DD" => fpo1
                        -- when x"DE" => fpo1
                        -- when x"DF" => fpo1

                        when x"E0" => opcode <= OP_JUMPIF; newDelay := 2; cpustage <= CPUSTAGE_FETCHDATA1_8; source1 <= OPSOURCE_FETCHVALUE8;
                        when x"E1" => opcode <= OP_JUMPIF; newDelay := 2; cpustage <= CPUSTAGE_FETCHDATA1_8; source1 <= OPSOURCE_FETCHVALUE8;
                        when x"E2" => opcode <= OP_JUMPIF; newDelay := 1; cpustage <= CPUSTAGE_FETCHDATA1_8; source1 <= OPSOURCE_FETCHVALUE8;
                        when x"E3" => opcode <= OP_JUMPIF;             cpustage <= CPUSTAGE_FETCHDATA1_8; source1 <= OPSOURCE_FETCHVALUE8;
                     
                        when x"E4" => opcode <= OP_OPIN;  newDelay := 5; cpustage <= CPUSTAGE_FETCHDATA1_8; opsize <= '0'; source1 <= OPSOURCE_FETCHVALUE8;
                        when x"E5" => opcode <= OP_OPIN;  newDelay := 4; cpustage <= CPUSTAGE_FETCHDATA1_8; opsize <= '1'; source1 <= OPSOURCE_FETCHVALUE8;
                        when x"E6" => opcode <= OP_OPOUT; newDelay := 4; cpustage <= CPUSTAGE_FETCHDATA1_8; opsize <= '0'; source1 <= OPSOURCE_FETCHVALUE8; source2 <= OPSOURCE_ACC;
                        when x"E7" => opcode <= OP_OPOUT; newDelay := 3; cpustage <= CPUSTAGE_FETCHDATA1_8; opsize <= '1'; source1 <= OPSOURCE_FETCHVALUE8; source2 <= OPSOURCE_ACC;
                     
                     	when x"E8" => opcode <= OP_JUMP; cpustage <= CPUSTAGE_FETCHDATA1_16; source1 <= OPSOURCE_FETCHVALUE16; pushlist <= REGPOS_ip;
                        when x"E9" => opcode <= OP_JUMP; cpustage <= CPUSTAGE_FETCHDATA1_16; source1 <= OPSOURCE_FETCHVALUE16;
                        when x"EA" => opcode <= OP_JUMPFAR; newDelay := 3; opsize <= '1'; cpustage <= CPUSTAGE_FETCHDATA1_16; source1 <= OPSOURCE_FETCHVALUE16; source2 <= OPSOURCE_FETCHVALUE16;
                        when x"EB" => opcode <= OP_JUMPIF; cpustage <= CPUSTAGE_FETCHDATA1_8; source1 <= OPSOURCE_FETCHVALUE8;

                        when x"EC" => opcode <= OP_OPIN; newDelay := 4;  cpustage <= CPUSTAGE_EXECUTE; opsize <= '0'; source1 <= OPSOURCE_REG_dx;
                        when x"ED" => opcode <= OP_OPIN; newDelay := 4;  cpustage <= CPUSTAGE_EXECUTE; opsize <= '1'; source1 <= OPSOURCE_REG_dx;
                        when x"EE" => opcode <= OP_OPOUT; newDelay := 3; cpustage <= CPUSTAGE_EXECUTE; opsize <= '0'; source1 <= OPSOURCE_REG_dx; source2 <= OPSOURCE_ACC;
                        when x"EF" => opcode <= OP_OPOUT; newDelay := 2; cpustage <= CPUSTAGE_EXECUTE; opsize <= '1'; source1 <= OPSOURCE_REG_dx; source2 <= OPSOURCE_ACC;

                        when x"F0" => isPrefix := '1'; irqBlocked <= '1'; usePrefix := '1'; -- lock
                        
                        --when x"F1" => ?

                        when x"F2" => newDelay := 4; RepeatNext <= '1'; isPrefix := '1'; repeatZero <= '0'; irqBlocked <= '1'; cpustage <= CPUSTAGE_IDLE; cpu_finished <= '1';
                        when x"F3" => newDelay := 4; RepeatNext <= '1'; isPrefix := '1'; repeatZero <= '1'; irqBlocked <= '1'; cpustage <= CPUSTAGE_IDLE; cpu_finished <= '1';
                     
                        when x"F4" => newDelay := 8; halt <= '1'; cpustage <= CPUSTAGE_IDLE;
                        
                        when x"F5" => opcode <= OP_NOP; newDelay := 3; regs.FlagCar <= not regs.FlagCar; cpustage <= CPUSTAGE_EXECUTE;

                        when x"F6" => opcode <= OP_MEMIMM3; source1 <= OPSOURCE_MEM; cpustage <= CPUSTAGE_MODRM; opsize <= '0';
                        when x"F7" => opcode <= OP_MEMIMM3; source1 <= OPSOURCE_MEM; cpustage <= CPUSTAGE_MODRM; opsize <= '1';

                        when x"F8" => newDelay := 3; cpustage <= CPUSTAGE_IDLE; cpu_finished <= '1'; regs.FlagCar <= '0'; 
                        when x"F9" => newDelay := 3; cpustage <= CPUSTAGE_IDLE; cpu_finished <= '1'; regs.FlagCar <= '1'; 
                        when x"FA" => newDelay := 3; cpustage <= CPUSTAGE_IDLE; cpu_finished <= '1'; regs.FlagIrq <= '0'; 
                        when x"FB" => newDelay := 3; cpustage <= CPUSTAGE_IDLE; cpu_finished <= '1'; regs.FlagIrq <= '1'; irqBlocked <= '1';
                        when x"FC" => newDelay := 3; cpustage <= CPUSTAGE_IDLE; cpu_finished <= '1'; regs.FlagDir <= '0';
                        when x"FD" => newDelay := 3; cpustage <= CPUSTAGE_IDLE; cpu_finished <= '1'; regs.FlagDir <= '1';
                     
                        when x"FE" => opcode <= OP_MEMIMM4; source1 <= OPSOURCE_MEM; cpustage <= CPUSTAGE_MODRM; opsize <= '0';
                        when x"FF" => opcode <= OP_MEMIMM4; source1 <= OPSOURCE_MEM; cpustage <= CPUSTAGE_MODRM; opsize <= '1';
                     
                        when others => cpustage <= CPUSTAGE_IDLE; cpu_done <= '1';
                  
                     end case;
                     
                     if (turbo = '1') then
                        delay <= 0;
                        dbuf  <= 0;
                     elsif (newBuf = 0) then
                        delay <= newDelay;
                        dbuf  <= 0;
                     elsif (newBuf > newDelay) then
                        delay <= 0;
                        dbuf  <= newBuf - newDelay;
                     else
                        delay <= newDelay - newBuf;
                        dbuf  <= 0;
                     end if;

                     if (isPrefix = '1') then
                        PrefixIP <= PrefixIP + 1;
                     end if;
                     
                     if ((repeat = '1' or newRepeat = '1') and usePrefix = '0') then
                        regs.reg_ip     <= regs.reg_ip + 1;
                        consumePrefetch <= 1;
                        Repeat          <= '0';
                        PrefixIP        <= (others => '0');
                     end if;

-- ####################################################################################
-- ############################## MODRM      ##########################################
-- ####################################################################################
                     
                  when CPUSTAGE_MODRM =>
                     if (consumePrefetch = 0 and prefetchCount > 2) then
                        regs.reg_ip     <= regs.reg_ip + 1;
                        consumePrefetch <= 1;
                        MODRM_mem := unsigned(prefetchBuffer(2 downto 0));
                        MODRM_reg := unsigned(prefetchBuffer(5 downto 3));
                        MODRM_mod := unsigned(prefetchBuffer(7 downto 6));
                        
                        if (opcodebyte = x"8E" and MODRM_reg = 3) then irqBlocked <= '1'; end if;
                        
                        newModDelay := delay;
                        
                        if (MODRM_mod = 0 and MODRM_mem = 6) then
                           if (SLOWTIMING = '1') then newModDelay := newModDelay + 1; end if;
                           consumePrefetch <= 3;
                           regs.reg_ip     <= regs.reg_ip + 3;
                           memAddr         <= unsigned(prefetchBuffer(23 downto 8));
                        else 
                           varmemaddr := x"0000";
                           case (to_integer(MODRM_mem)) is
                              when 0 => memSegment <= regs.reg_ds; varmemaddr := regs.reg_bx + regs.reg_si;
                              when 1 => memSegment <= regs.reg_ds; varmemaddr := regs.reg_bx + regs.reg_di;
                              when 2 => memSegment <= regs.reg_ss; varmemaddr := regs.reg_bp + regs.reg_si;
                              when 3 => memSegment <= regs.reg_ss; varmemaddr := regs.reg_bp + regs.reg_di;
                              when 4 => memSegment <= regs.reg_ds; varmemaddr := regs.reg_si;
                              when 5 => memSegment <= regs.reg_ds; varmemaddr := regs.reg_di;
                              when 6 => memSegment <= regs.reg_ss; varmemaddr := regs.reg_bp;
                              when 7 => memSegment <= regs.reg_ds; varmemaddr := regs.reg_bx;
                              when others => null;
                           end case;
                           if (MODRM_mod = 1) then
                              if (SLOWTIMING = '1') then newModDelay := newModDelay + 1; end if;
                              consumePrefetch <= 2;
                              regs.reg_ip     <= regs.reg_ip + 2;
                              varmemaddr      := to_unsigned(to_integer(varmemaddr) + to_integer(signed(prefetchBuffer(15 downto 8))), 16);
                           elsif (MODRM_mod = 2) then
                              if (SLOWTIMING = '1') then newModDelay := newModDelay + 1; end if;
                              consumePrefetch <= 3;
                              regs.reg_ip     <= regs.reg_ip + 3;
                              varmemaddr      := varmemaddr + unsigned(prefetchBuffer(23 downto 8));
                           end if;
                           memaddr <= varmemaddr;
                        end if;
                        
                        -- set target reg
                        varoptarget   := optarget;
                        varsource1    := source1;
                        varsource2    := source2;
                        vartarget_reg := CPU_REG_NONE; 
                        varpushlist   := pushlist;
                        if (segmentaccess = '1') then
                           case (to_integer(MODRM_reg(1 downto 0))) is
                              when 0 => vartarget_reg := CPU_REG_es;
                              when 1 => vartarget_reg := CPU_REG_cs;
                              when 2 => vartarget_reg := CPU_REG_ss;
                              when 3 => vartarget_reg := CPU_REG_ds;
                              when others => null;
                           end case;
                        else
                           if (opsize = '0') then
                              case (to_integer(MODRM_reg)) is
                                 when 0 => vartarget_reg := CPU_REG_al;
                                 when 1 => vartarget_reg := CPU_REG_cl;
                                 when 2 => vartarget_reg := CPU_REG_dl;
                                 when 3 => vartarget_reg := CPU_REG_bl;
                                 when 4 => vartarget_reg := CPU_REG_ah;
                                 when 5 => vartarget_reg := CPU_REG_ch;
                                 when 6 => vartarget_reg := CPU_REG_dh;
                                 when 7 => vartarget_reg := CPU_REG_bh;
                                 when others => null;
                              end case;
                           elsif (opsize = '1') then
                              case (to_integer(MODRM_reg)) is
                                 when 0 => vartarget_reg := CPU_REG_ax;
                                 when 1 => vartarget_reg := CPU_REG_cx;
                                 when 2 => vartarget_reg := CPU_REG_dx;
                                 when 3 => vartarget_reg := CPU_REG_bx;
                                 when 4 => vartarget_reg := CPU_REG_sp;
                                 when 5 => vartarget_reg := CPU_REG_bp;
                                 when 6 => vartarget_reg := CPU_REG_si;
                                 when 7 => vartarget_reg := CPU_REG_di;
                                 when others => null;
                              end case;
                           end if;
                        end if;
                        target_reg <= vartarget_reg;
                        
                        -- get reg
                        if (segmentaccess = '1') then
                           case (to_integer(MODRM_reg(1 downto 0))) is
                              when 0 => MODRM_value_reg <= regs.reg_es;
                              when 1 => MODRM_value_reg <= regs.reg_cs;
                              when 2 => MODRM_value_reg <= regs.reg_ss;
                              when 3 => MODRM_value_reg <= regs.reg_ds;
                              when others => null;
                           end case;
                        else
                           if (opsize = '0') then
                              case (to_integer(MODRM_reg)) is
                                 when 0 => MODRM_value_reg <= x"00" & regs.reg_ax( 7 downto 0);
                                 when 1 => MODRM_value_reg <= x"00" & regs.reg_cx( 7 downto 0);
                                 when 2 => MODRM_value_reg <= x"00" & regs.reg_dx( 7 downto 0);
                                 when 3 => MODRM_value_reg <= x"00" & regs.reg_bx( 7 downto 0);
                                 when 4 => MODRM_value_reg <= x"00" & regs.reg_ax(15 downto 8);
                                 when 5 => MODRM_value_reg <= x"00" & regs.reg_cx(15 downto 8);
                                 when 6 => MODRM_value_reg <= x"00" & regs.reg_dx(15 downto 8);
                                 when 7 => MODRM_value_reg <= x"00" & regs.reg_bx(15 downto 8);
                                 when others => null;
                              end case;
                           elsif (opsize = '1') then
                              case (to_integer(MODRM_reg)) is
                                 when 0 => MODRM_value_reg <= regs.reg_ax;
                                 when 1 => MODRM_value_reg <= regs.reg_cx;
                                 when 2 => MODRM_value_reg <= regs.reg_dx;
                                 when 3 => MODRM_value_reg <= regs.reg_bx;
                                 when 4 => MODRM_value_reg <= regs.reg_sp;
                                 when 5 => MODRM_value_reg <= regs.reg_bp;
                                 when 6 => MODRM_value_reg <= regs.reg_si;
                                 when 7 => MODRM_value_reg <= regs.reg_di;
                                 when others => null;
                              end case;
                           end if;
                        end if;
                        
                        -- second decode
                        case (opcode) is
                           when OP_MEMIMM1 =>
                              opcode <= OP_MOVMEM;
                              case (to_integer(MODRM_reg)) is
                                 when 0 => aluop <= ALU_OP_ADD;
                                 when 1 => aluop <= ALU_OP_OR; 
                                 when 2 => aluop <= ALU_OP_ADC;
                                 when 3 => aluop <= ALU_OP_SBB;
                                 when 4 => aluop <= ALU_OP_AND;
                                 when 5 => aluop <= ALU_OP_SUB;
                                 when 6 => aluop <= ALU_OP_XOR;
                                 when 7 => aluop <= ALU_OP_CMP; opcode <= OP_NOP;
                                 when others => null;
                              end case;
                           
                           when OP_MEMIMM2 =>
                              opcode <= OP_MOVMEM;
                              case (to_integer(MODRM_reg)) is
                                 when 0 => aluop <= ALU_OP_ROL;
                                 when 1 => aluop <= ALU_OP_ROR;
                                 when 2 => aluop <= ALU_OP_RCL;
                                 when 3 => aluop <= ALU_OP_RCR;
                                 when 4 => aluop <= ALU_OP_SHL;
                                 when 5 => aluop <= ALU_OP_SHR;
                                 when 6 => aluop <= ALU_OP_SAL;
                                 when 7 => aluop <= ALU_OP_SAR;
                                 when others => null;
                              end case;
                           
                           when OP_MEMIMM3 =>
                              case (to_integer(MODRM_reg)) is
                                 when 0 | 1 =>
                                    opcode <= OP_NOP; aluop <= ALU_OP_TST;
                                    if (opsize = '1') then varsource2 := OPSOURCE_FETCHVALUE16; else varsource2 := OPSOURCE_FETCHVALUE8; end if;
                                    dbuf <= dbuf + 1;
                                 when 2 => opcode <= OP_MOVMEM; varoptarget := OPTARGET_MEM; aluop <= ALU_OP_NOT; useAluResult <= '1'; if (MODRM_mod /= 3) then newModDelay := newModDelay + 1; end if;
                                 when 3 => opcode <= OP_MOVMEM; varoptarget := OPTARGET_MEM; aluop <= ALU_OP_NEG; useAluResult <= '1'; if (MODRM_mod /= 3) then newModDelay := newModDelay + 1; end if;
                                 when 4 => opcode <= OP_NOP; varsource1 := OPSOURCE_ACC; varsource2 := OPSOURCE_MEM; aluop <= ALU_OP_MUL;  useAluResult <= '1'; newModDelay := newModDelay + 2;
                                 when 5 => opcode <= OP_NOP; varsource1 := OPSOURCE_ACC; varsource2 := OPSOURCE_MEM; aluop <= ALU_OP_MULI; useAluResult <= '1'; newModDelay := newModDelay + 2;
                                 when 6 => opcode <= OP_DIV; varsource1 := OPSOURCE_ACC; varsource2 := OPSOURCE_MEM;
                                    if (opsize = '0') then newModDelay := newModDelay + 2; else newModDelay := newModDelay + 11; end if;
                                 when 7 => opcode <= OP_DIVI; varsource1 := OPSOURCE_ACC; varsource2 := OPSOURCE_MEM;
                                    if (opsize = '0') then newModDelay := newModDelay + 4; else newModDelay := newModDelay + 12; end if;
                                 when others => null;
                              end case;
                           
                           when OP_MEMIMM4 =>
                              case (to_integer(MODRM_reg)) is
                                 when 0     => opcode <= OP_MOVMEM;  varoptarget := OPTARGET_MEM; aluop <= ALU_OP_INC; varsource2 := OPSOURCE_IMMIDIATE; immidiate8 <= x"01"; useAluResult <= '1'; if (MODRM_mod /= 3) then newModDelay := newModDelay + 1; end if;
                                 when 1     => opcode <= OP_MOVMEM;  varoptarget := OPTARGET_MEM; aluop <= ALU_OP_DEC; varsource2 := OPSOURCE_IMMIDIATE; immidiate8 <= x"01"; useAluResult <= '1'; if (MODRM_mod /= 3) then newModDelay := newModDelay + 1; end if;
                                 when 2     => opcode <= OP_JUMPABS; newModDelay := newModDelay + 1; varpushlist := REGPOS_ip;
                                 when 3     => opcode <= OP_JUMPFAR; varsource2 := OPSOURCE_MEM; varpushlist := REGPOS_cs or REGPOS_ip; newModDelay := newModDelay + 6;
                                 when 4     => opcode <= OP_JUMPABS; newModDelay := newModDelay + 1;
                                 when 5     => opcode <= OP_JUMPFAR; varsource2 := OPSOURCE_MEM; newModDelay := newModDelay + 6;
                                 when 6 | 7 => opcode <= OP_NOP; varpushlist := REGPOS_mem; dbuf <= dbuf + 1;
                                 when others => null;
                              end case;
                           
                              when others => null;
                        
                        end case;
                        
                        varfetchedSource1 := fetchedSource1;
                        varfetchedSource2 := fetchedSource2;
                        
                        --set target mem
                        if (varoptarget = OPTARGET_MEM and MODRM_mod = 3) then
                           target_reg2 <= vartarget_reg;
                           varoptarget := OPTARGET_MODRM_REG;
                           opcode      <= OP_MOVREG;
                           if (opcodebyte = x"8F") then --special case: PopMem
                              opcode <= OP_NOP;
                           end if;
                           if (opcode = OP_MEMIMM1 and to_integer(MODRM_reg) = 7) then -- special case: CMP
                              opcode <= OP_NOP;
                           end if;
                           if (opsize = '0') then
                              case (to_integer(MODRM_mem)) is
                                 when 0 => target_reg <= CPU_REG_al;
                                 when 1 => target_reg <= CPU_REG_cl;
                                 when 2 => target_reg <= CPU_REG_dl;
                                 when 3 => target_reg <= CPU_REG_bl;
                                 when 4 => target_reg <= CPU_REG_ah;
                                 when 5 => target_reg <= CPU_REG_ch;
                                 when 6 => target_reg <= CPU_REG_dh;
                                 when 7 => target_reg <= CPU_REG_bh;
                                 when others => null;
                              end case;
                           elsif (opsize = '1') then
                              case (to_integer(MODRM_mem)) is
                                 when 0 => target_reg <= CPU_REG_ax;
                                 when 1 => target_reg <= CPU_REG_cx;
                                 when 2 => target_reg <= CPU_REG_dx;
                                 when 3 => target_reg <= CPU_REG_bx;
                                 when 4 => target_reg <= CPU_REG_sp;
                                 when 5 => target_reg <= CPU_REG_bp;
                                 when 6 => target_reg <= CPU_REG_si;
                                 when 7 => target_reg <= CPU_REG_di;
                                 when others => null;
                              end case;
                           end if;
                           
                           if (opcode = OP_MEMIMM1) then
                              varfetchedSource2 := '1';
                              if (source2 = OPSOURCE_FETCHVALUE8) then
                                 if (opsign = '1') then 
                                    fetch2Val <= unsigned(resize(signed(prefetchBuffer(15 downto 8)), 16));
                                 else                   
                                    fetch2Val <= x"00" & unsigned(prefetchBuffer(15 downto 8)); 
                                 end if;
                                 consumePrefetch <= 2;
                                 regs.reg_ip     <= regs.reg_ip + 2;
                              else
                                 fetch2Val       <= unsigned(prefetchBuffer(23 downto 8));
                                 consumePrefetch <= 3;
                                 regs.reg_ip     <= regs.reg_ip + 3;
                              end if;
                           end if;
                           
                        end if;
                        
                        optarget <= varoptarget;
                           
                           
                        -- instant fetching if memory access degrades to register access
                        fetchedRMMODData := x"0000";
                        if (opsize = '0') then
                           case (to_integer(MODRM_mem)) is
                              when 0 => fetchedRMMODData := x"00" & regs.reg_ax( 7 downto 0);
                              when 1 => fetchedRMMODData := x"00" & regs.reg_cx( 7 downto 0);
                              when 2 => fetchedRMMODData := x"00" & regs.reg_dx( 7 downto 0);
                              when 3 => fetchedRMMODData := x"00" & regs.reg_bx( 7 downto 0);
                              when 4 => fetchedRMMODData := x"00" & regs.reg_ax(15 downto 8);
                              when 5 => fetchedRMMODData := x"00" & regs.reg_cx(15 downto 8);
                              when 6 => fetchedRMMODData := x"00" & regs.reg_dx(15 downto 8);
                              when 7 => fetchedRMMODData := x"00" & regs.reg_bx(15 downto 8);
                              when others => null;
                           end case;
                        elsif (opsize = '1') then
                           case (to_integer(MODRM_mem)) is
                              when 0 => fetchedRMMODData := regs.reg_ax;
                              when 1 => fetchedRMMODData := regs.reg_cx;
                              when 2 => fetchedRMMODData := regs.reg_dx;
                              when 3 => fetchedRMMODData := regs.reg_bx;
                              when 4 => fetchedRMMODData := regs.reg_sp;
                              when 5 => fetchedRMMODData := regs.reg_bp;
                              when 6 => fetchedRMMODData := regs.reg_si;
                              when 7 => fetchedRMMODData := regs.reg_di;
                              when others => null;
                           end case;
                        end if;
                           
                        if (varsource1 = OPSOURCE_MEM and MODRM_mod = 3) then varfetchedSource1 := '1'; memFetchValue1 <= fetchedRMMODData; end if;
                        if (varsource2 = OPSOURCE_MEM and MODRM_mod = 3) then varfetchedSource2 := '1'; memFetchValue2 <= fetchedRMMODData; end if;   

                        source1 <= varsource1;
                        source2 <= varsource2;
                        
                        fetchedSource1 <= varfetchedSource1;
                        fetchedSource2 <= varfetchedSource2;
                        
                        pushlist <= varpushlist;

                        delay <= newModDelay;
                        
                        if (turbo = '1') then
                           delay <= 0;
                        end if;
                        cpustage <= CPUSTAGE_CHECKDATAREADY;
                     end if; -- consumePrefetch = 0
                     
-- ####################################################################################
-- ############################## Source 1 + 2 ########################################
-- ####################################################################################  
                     
                  when CPUSTAGE_CHECKDATAREADY =>
                     if (ce = '1' or delay = 0) then
                        if    (fetchedSource1 = '0' and source1 <= OPSOURCE_FETCHVALUE8 ) then cpustage <= CPUSTAGE_FETCHDATA1_8;
                        elsif (fetchedSource1 = '0' and source1 <= OPSOURCE_FETCHVALUE16) then cpustage <= CPUSTAGE_FETCHDATA1_16;                  
                        elsif (fetchedSource1 = '0' and source1 <= OPSOURCE_MEM         ) then cpustage <= CPUSTAGE_FETCHMEM_REQ;                  
                        
                        elsif (fetchedSource2 = '0' and source2 <= OPSOURCE_FETCHVALUE8 ) then cpustage <= CPUSTAGE_FETCHDATA2_8;
                        elsif (fetchedSource2 = '0' and source2 <= OPSOURCE_FETCHVALUE16) then cpustage <= CPUSTAGE_FETCHDATA2_16;
                        elsif (fetchedSource2 = '0' and source2 <= OPSOURCE_MEM         ) then cpustage <= CPUSTAGE_FETCHMEM_REQ;
                        
                        elsif (pushlist /= x"0000") then cpustage <= CPUSTAGE_PUSH;
                        elsif (poplist  /= x"0000") then cpustage <= CPUSTAGE_POP_REQ;
                        
                        else  cpustage <= CPUSTAGE_EXECUTE;
                        end if;
                     end if;
                     
                  when CPUSTAGE_FETCHDATA1_8 =>
                     if ((ce = '1' or instantFetch = '1') and (prefetchCount - consumePrefetch) > 0) then
                        fetchedSource1  <= '1';
                        if (instantFetch = '1') then
                           cpustage        <= CPUSTAGE_EXECUTE;
                        else
                           cpustage        <= CPUSTAGE_CHECKDATAREADY;
                        end if;
                        if (consumePrefetch = 1) then
                           if (opsign = '1') then fetch1Val <= unsigned(resize(signed(prefetchBuffer(15 downto 8)), 16));
                           else                   fetch1Val <= x"00" & unsigned(prefetchBuffer(15 downto 8)); end if;
                        else
                           if (opsign = '1') then fetch1Val <= unsigned(resize(signed(prefetchBuffer(7 downto 0)), 16));
                           else                   fetch1Val <= x"00" & unsigned(prefetchBuffer(7 downto 0)); end if;
                        end if;
                        regs.reg_ip     <= Regs.reg_ip + 1;
                        consumePrefetch <= 1;
                     end if;
                     
                  when CPUSTAGE_FETCHDATA1_16 =>
                     if ((ce = '1' or instantFetch = '1') and (prefetchCount - consumePrefetch) > 1) then
                        fetchedSource1  <= '1';
                        if (instantFetch = '1') then
                           cpustage        <= CPUSTAGE_EXECUTE;
                        else
                           cpustage        <= CPUSTAGE_CHECKDATAREADY;
                        end if;
                        if (consumePrefetch = 1) then
                           fetch1Val       <= unsigned(prefetchBuffer(23 downto 8));
                        else
                           fetch1Val       <= unsigned(prefetchBuffer(15 downto 0));
                        end if;
                        regs.reg_ip     <= regs.reg_ip + 2; 
                        consumePrefetch <= 2;
                        if (SLOWTIMING = '1') then delay <= 1; end if;                        
                     end if;
                     
                  when CPUSTAGE_FETCHDATA2_8 =>
                     if ((ce = '1' or instantFetch = '1') and (prefetchCount - consumePrefetch) > 0) then
                        fetchedSource2  <= '1';
                        if (instantFetch = '1') then
                           cpustage        <= CPUSTAGE_EXECUTE;
                        else
                           cpustage        <= CPUSTAGE_CHECKDATAREADY;
                        end if;
                        if (consumePrefetch = 1) then
                           if (opsign = '1') then fetch2Val <= unsigned(resize(signed(prefetchBuffer(15 downto 8)), 16));
                           else                   fetch2Val <= x"00" & unsigned(prefetchBuffer(15 downto 8)); end if;
                        else
                           if (opsign = '1') then fetch2Val <= unsigned(resize(signed(prefetchBuffer(7 downto 0)), 16));
                           else                   fetch2Val <= x"00" & unsigned(prefetchBuffer(7 downto 0)); end if;
                        end if;
                        regs.reg_ip     <= Regs.reg_ip + 1;
                        consumePrefetch <= 1;
                     end if;
                     
                  when CPUSTAGE_FETCHDATA2_16 =>
                     if ((ce = '1' or instantFetch = '1') and (prefetchCount - consumePrefetch) > 1) then
                        fetchedSource2  <= '1';
                        if (instantFetch = '1') then
                           cpustage        <= CPUSTAGE_EXECUTE;
                        else
                           cpustage        <= CPUSTAGE_CHECKDATAREADY;
                        end if;
                        if (consumePrefetch = 1) then
                           fetch2Val       <= unsigned(prefetchBuffer(23 downto 8));
                        else
                           fetch2Val       <= unsigned(prefetchBuffer(15 downto 0));
                        end if;
                        regs.reg_ip     <= regs.reg_ip + 2; 
                        consumePrefetch <= 2;
                        if (SLOWTIMING = '1') then delay <= 1; end if;                     
                     end if;
  
-- ####################################################################################
-- ############################## FETCH Mem  ##########################################
-- ####################################################################################  
                     
                  when CPUSTAGE_FETCHMEM_REQ =>
                     if (ce = '1') then
                        cpustage <= CPUSTAGE_FETCHMEM_WAIT;
                        varmemSegment := memSegment;
                        if (prefixSegmentES = '1') then varmemSegment := regs.reg_es; end if;
                        if (prefixSegmentCS = '1') then varmemSegment := regs.reg_cs; end if;
                        if (prefixSegmentSS = '1') then varmemSegment := regs.reg_ss; end if;
                        if (prefixSegmentDS = '1') then varmemSegment := regs.reg_ds; end if;
                        if (source1 = OPSOURCE_MEM and fetchedSource1 = '0') then
                           if (unaligned1 = '1') then
                              bus_addr         <= resize(varmemSegment * 16 + memAddr + 1, 20);
                           else
                              bus_addr         <= resize(varmemSegment * 16 + memAddr, 20);
                           end if;
                           bus_read         <= '1';
                           prefetchAllow    <= '0';
                        elsif (source2 = OPSOURCE_MEM and fetchedSource2 = '0') then
                           if (unaligned2 = '1') then
                              bus_addr         <= resize(varmemSegment * 16 + memAddr + 1, 20);
                           else
                              bus_addr         <= resize(varmemSegment * 16 + memAddr, 20);
                           end if;
                           bus_read         <= '1';
                           prefetchAllow    <= '0';
                        end if;
                     end if;  
                     
                  when CPUSTAGE_FETCHMEM_WAIT => 
                     cpustage      <= CPUSTAGE_FETCHMEM_REC;   
                  
                  when CPUSTAGE_FETCHMEM_REC =>
                     if (source1 = OPSOURCE_MEM and fetchedSource1 = '0') then
                        if (opsize = '0') then
                           memFetchValue1 <= x"00" & unsigned(bus_dataread(7 downto 0));
                           if (source2 = OPSOURCE_MEM) then memAddr <= memAddr + 1; end if;
                           fetchedSource1 <= '1';
                           cpustage       <= CPUSTAGE_CHECKDATAREADY;
                           if (pushlist /= x"0000" or (fetchedSource2 = '0' and (source2 <= OPSOURCE_FETCHVALUE8 or source2 <= OPSOURCE_FETCHVALUE16 or source2 <= OPSOURCE_MEM))) then
                              cpustage <= CPUSTAGE_CHECKDATAREADY;
                           else
                              cpustage <= CPUSTAGE_EXECUTE;
                           end if;  
                        else
                           if (unaligned1 = '1') then
                              if (source2 = OPSOURCE_MEM) then memAddr <= memAddr + 2; end if;
                              fetchedSource1              <= '1';
                              memFetchValue1(15 downto 8) <= unsigned(bus_dataread(7 downto 0));
                              if (pushlist /= x"0000" or (fetchedSource2 = '0' and (source2 <= OPSOURCE_FETCHVALUE8 or source2 <= OPSOURCE_FETCHVALUE16 or source2 <= OPSOURCE_MEM))) then
                                 cpustage <= CPUSTAGE_CHECKDATAREADY;
                              else
                                 cpustage <= CPUSTAGE_EXECUTE;
                              end if;  
                           else
                              memFetchValue1 <= unsigned(bus_dataread);
                              if (memAddr(0) = '1') then
                                 unaligned1   <= '1';
                                 cpustage     <= CPUSTAGE_FETCHMEM_REQ;
                              else
                                 if (source2 = OPSOURCE_MEM) then memAddr <= memAddr + 2; end if;
                                 if (SLOWTIMING = '1') then delay <= 1; end if;
                                 fetchedSource1 <= '1';
                                 if (pushlist /= x"0000" or (fetchedSource2 = '0' and (source2 <= OPSOURCE_FETCHVALUE8 or source2 <= OPSOURCE_FETCHVALUE16 or source2 <= OPSOURCE_MEM))) then
                                    cpustage <= CPUSTAGE_CHECKDATAREADY;
                                 else
                                    cpustage <= CPUSTAGE_EXECUTE;
                                 end if;  
                              end if;
                           end if;
                        end if;            
                     elsif (source2 = OPSOURCE_MEM and fetchedSource2 = '0') then
                        if (opsize = '0') then
                           memFetchValue2 <= x"00" & unsigned(bus_dataread(7 downto 0));
                           fetchedSource2 <= '1';
                           if (pushlist /= x"0000") then
                              cpustage <= CPUSTAGE_CHECKDATAREADY;
                           else
                              cpustage       <= CPUSTAGE_EXECUTE;
                           end if;
                        else
                           if (unaligned2 = '1') then
                              fetchedSource2              <= '1';
                              memFetchValue2(15 downto 8) <= unsigned(bus_dataread(7 downto 0));
                              if (pushlist /= x"0000") then
                                 cpustage <= CPUSTAGE_CHECKDATAREADY;
                              else
                                 cpustage       <= CPUSTAGE_EXECUTE;
                              end if;
                           else
                              memFetchValue2 <= unsigned(bus_dataread);
                              if (memAddr(0) = '1') then
                                 unaligned2   <= '1';
                                 cpustage     <= CPUSTAGE_FETCHMEM_REQ;
                              else
                                 if (SLOWTIMING = '1') then delay <= 1; end if;
                                 fetchedSource2 <= '1';
                                 if (pushlist /= x"0000") then
                                    cpustage <= CPUSTAGE_CHECKDATAREADY;
                                 else
                                    cpustage       <= CPUSTAGE_EXECUTE;
                                 end if;
                              end if;
                           end if;
                        end if;  
                     end if;
                     
-- ####################################################################################
-- ############################## FETCH IRQ Vector ####################################
-- ####################################################################################  
                     
                  when CPUSTAGE_IRQVECTOR_REQ =>
                     if (ce = '1') then
                        if (irqExtern = '1') then
                           if (memFirst = '1') then
                              bus_addr      <= resize(irqvector_in, 20);
                           else
                              bus_addr      <= resize(irqvector_in + 2, 20);
                           end if;
                        else
                           if (memFirst = '1') then
                              bus_addr      <= resize(irqvector, 20);
                           else
                              bus_addr      <= resize(irqvector + 2, 20);
                           end if;
                        end if;

                        bus_read      <= '1';
                        prefetchAllow <= '0';
                        cpustage      <= CPUSTAGE_IRQVECTOR_WAIT;
                     end if;
                     
                  when CPUSTAGE_IRQVECTOR_WAIT => 
                     cpustage      <= CPUSTAGE_IRQVECTOR_REC;
                  
                  when CPUSTAGE_IRQVECTOR_REC =>
                     memFirst <= '0';
                     if (memFirst = '1') then
                        irqIP    <= unsigned(bus_dataread); 
                        cpustage <= CPUSTAGE_IRQVECTOR_REQ;
                     else
                        irqCS    <= unsigned(bus_dataread); 
                        cpustage <= CPUSTAGE_CHECKDATAREADY;
                     end if;  
                     
-- ####################################################################################
-- ############################## Push       ##########################################
-- ####################################################################################   
                  
                  when CPUSTAGE_PUSH =>
                     if (ce = '1') then
                        pushindex := 0;
                        for i in 15 downto 0 loop
                           if (pushlist(i) = '1') then
                              pushindex := i;
                           end if;
                        end loop;
                        
                        pushValue := x"0000";
                        
                        case (pushindex) is
                           when 0  => pushValue := std_logic_vector(regs.reg_ax);
                           when 1  => pushValue := std_logic_vector(regs.reg_cx);
                           when 2  => pushValue := std_logic_vector(regs.reg_dx);
                           when 3  => pushValue := std_logic_vector(regs.reg_bx);
                           when 4  => pushValue := std_logic_vector(reg_sp_push);
                           when 5  => pushValue := std_logic_vector(regs.reg_bp);
                           when 6  => pushValue := std_logic_vector(regs.reg_si);
                           when 7  => pushValue := std_logic_vector(regs.reg_di);
                           when 8  => pushValue := std_logic_vector(regs.reg_es);
                           when 9  => pushValue := std_logic_vector(reg_f); 
                           when 10 => pushValue := std_logic_vector(regs.reg_cs);
                           when 11 => pushValue := std_logic_vector(regs.reg_ss);
                           when 12 => pushValue := std_logic_vector(regs.reg_ds);
                           when 13 => pushValue := std_logic_vector(regs.reg_ip - prefixIP);
                           when 14 => pushValue := std_logic_vector(memFetchValue1);
                           when 15 => 
                              if (opsize = '0') then
                                 pushValue := std_logic_vector(resize(signed(fetch1Val(7 downto 0)), 16)); 
                              else 
                                 pushValue := std_logic_vector(fetch1Val);
                              end if;
                           when others => null;
                        end case;
                        
                        if (pushFirst = '1') then
                           if (regs.reg_sp(0) = '0') then -- aligned
                              regs.reg_sp      <= regs.reg_sp - 2;
                              bus_read         <= '0';
                              bus_write        <= '1';
                              bus_be           <= "11";
                              bus_addr         <= resize(regs.reg_ss * 16 + resize(regs.reg_sp - 2,16), 20);
                              bus_datawrite    <= pushValue;
                              prefetchAllow    <= '0';
                              cpustage         <= CPUSTAGE_CHECKDATAREADY;
                              pushlist(pushindex) <= '0';
                           else
                              bus_read         <= '0';
                              bus_write        <= '1';
                              bus_be           <= "01";
                              bus_addr         <= resize(regs.reg_ss * 16 + resize(regs.reg_sp - 2,16), 20);
                              bus_datawrite    <= pushValue;
                              prefetchAllow    <= '0';
                              pushFirst        <= '0';
                           end if;
                        else
                           regs.reg_sp      <= regs.reg_sp - 2;
                           bus_read         <= '0';
                           bus_write        <= '1';
                           bus_be           <= "01";
                           bus_addr         <= resize(regs.reg_ss * 16 + resize(regs.reg_sp - 1,16), 20);
                           bus_datawrite    <= x"00" & pushValue(15 downto 8);
                           prefetchAllow    <= '0';
                           cpustage         <= CPUSTAGE_CHECKDATAREADY;
                           pushFirst        <= '1';
                           pushlist(pushindex) <= '0';
                        end if;

                     end if;
               
-- ####################################################################################
-- ############################## Pop        ##########################################
-- ####################################################################################  
                     
                  when CPUSTAGE_POP_REQ =>   
                     if (ce = '1') then
                        cpustage <= CPUSTAGE_POP_WAIT;
                        
                        popindex := 0;
                        for i in 0 to 15 loop
                           if (poplist(i) = '1') then
                              popindex := i;
                           end if;
                        end loop;
                        poptarget <= popindex;
                        
                        bus_read         <= '1';
                        bus_write        <= '0';
                        if (popFirst = '1') then
                           bus_addr         <= resize(regs.reg_ss * 16 + regs.reg_sp, 20);
                        else
                           bus_addr         <= resize(regs.reg_ss * 16 + resize(regs.reg_sp + 1, 16), 20);
                        end if;
                        prefetchAllow    <= '0';
                        
                     end if;
                  
                  when CPUSTAGE_POP_WAIT => 
                     cpustage      <= CPUSTAGE_POP_REC;  
                     if (popFirst = '0' or regs.reg_sp(0) = '0') then
                        poplist(poptarget) <= '0';    
                     end if;
                  
                  when CPUSTAGE_POP_REC =>  
                     cpustage <= CPUSTAGE_POP_REQ;
                  
                     popValue := bus_dataread;
                     popDone := '0';
                     if (popFirst = '1') then
                        if (regs.reg_sp(0) = '0') then -- aligned
                           popDone := '1';
                        else
                           popFirst     <= '0';
                           popUnalnByte <= bus_dataread(7 downto 0);
                        end if;
                     else
                        popDone  := '1';
                        popValue := bus_dataread(7 downto 0) & popUnalnByte;
                     end if;
                     
                     if (popDone = '1') then
                     
                        popFirst <= '1';
                     
                        if (opcodebyte = x"61" and popindex = 5) then
                           regs.reg_sp <= regs.reg_sp + 4;
                        else
                           regs.reg_sp <= regs.reg_sp + 2;
                        end if;
                     
                        case (poptarget) is
                           when 0  => regs.reg_ax <= unsigned(popValue);
                           when 1  => regs.reg_cx <= unsigned(popValue);
                           when 2  => regs.reg_dx <= unsigned(popValue);
                           when 3  => regs.reg_bx <= unsigned(popValue);
                           when 4  => regs.reg_sp <= unsigned(popValue);
                           when 5  => regs.reg_bp <= unsigned(popValue);
                           when 6  => regs.reg_si <= unsigned(popValue);
                           when 7  => regs.reg_di <= unsigned(popValue);
                           when 8  => regs.reg_es <= unsigned(popValue);
                           when 9  => 
                              regs.FlagCar <= popValue(0);
                              regs.FlagPar <= popValue(2);
                              regs.FlagHaC <= popValue(4);
                              regs.FlagZer <= popValue(6);
                              regs.FlagSgn <= popValue(7);
                              regs.FlagBrk <= popValue(8);
                              regs.FlagIrq <= popValue(9);
                              regs.FlagDir <= popValue(10);
                              regs.FlagOvf <= popValue(11);
                              regs.FlagMod <= popValue(15);
                           when 10 => regs.reg_cs <= unsigned(popValue);
                           when 11 => regs.reg_ss <= unsigned(popValue);
                           when 12 => regs.reg_ds <= unsigned(popValue);
                           when 13 => regs.reg_ip <= unsigned(popValue);
                           when 14 => popVal      <= unsigned(popValue);
                           when others => null;
                        end case;
                        
                        if (poplist = x"0000") then
                           cpustage <= CPUSTAGE_EXECUTE;
                           if (SLOWTIMING = '1') then delay <= 1; end if;
                           if (opcodebyte = x"C2" or opcodebyte = x"C3" or opcodebyte = x"CA" or opcodebyte = x"CB" or opcodebyte = x"CF") then
                              clearPrefetch  <= '1';
                              delay          <= 3;
                           end if;
                        end if;
                        
                     end if;
                        
                     
-- ####################################################################################
-- ############################## EXECUTE    ##########################################
-- ####################################################################################
                     
                  when CPUSTAGE_EXECUTE =>
                  
                     source1Val := x"0000";
                     case (source1) is
                        when OPSOURCE_FETCHVALUE8  => source1Val := fetch1Val;
                        when OPSOURCE_FETCHVALUE16 => source1Val := fetch1Val;
                        when OPSOURCE_IRQVECTOR    => source1Val := fetch1Val;
                        when OPSOURCE_MEM          => source1Val := memFetchValue1;
                        when OPSOURCE_MODRM_REG    => source1Val := MODRM_value_reg;
                        when OPSOURCE_MODRM_ADDR   => source1Val := memAddr;
                        when OPSOURCE_ACC          => if (opsize = '0') then source1Val := x"00" & regs.reg_ax(7 downto 0); else source1Val := regs.reg_ax; end if; 
                        when OPSOURCE_STRINGLOAD1  => source1Val := stringLoad;
                        when OPSOURCE_STRINGLOAD2  => source1Val := stringLoad2;
                        when OPSOURCE_IMMIDIATE    => source1Val := x"00" & immidiate8;
                        when OPSOURCE_POPVALUE     => source1Val := popVal;
                        when OPSOURCE_REG_ax       => source1Val := regs.reg_ax;
                        when OPSOURCE_REG_cx       => source1Val := regs.reg_cx;
                        when OPSOURCE_REG_dx       => source1Val := regs.reg_dx;
                        when OPSOURCE_REG_bx       => source1Val := regs.reg_bx;
                        when OPSOURCE_REG_sp       => source1Val := regs.reg_sp;
                        when OPSOURCE_REG_bp       => source1Val := regs.reg_bp;
                        when OPSOURCE_REG_si       => source1Val := regs.reg_si;
                        when OPSOURCE_REG_di       => source1Val := regs.reg_di;
                        when others => null;
                     end case;
                     
                     source2Val := x"0000";
                     case (source2) is
                        when OPSOURCE_FETCHVALUE8  => source2Val := fetch2Val;
                        when OPSOURCE_FETCHVALUE16 => source2Val := fetch2Val;
                        when OPSOURCE_IRQVECTOR    => source2Val := fetch2Val;
                        when OPSOURCE_MEM          => source2Val := memFetchValue2;
                        when OPSOURCE_MODRM_REG    => source2Val := MODRM_value_reg;
                        when OPSOURCE_ACC          => if (opsize = '0') then source2Val := x"00" & regs.reg_ax(7 downto 0); else source2Val := regs.reg_ax; end if; 
                        when OPSOURCE_STRINGLOAD1  => source2Val := stringLoad;
                        when OPSOURCE_STRINGLOAD2  => source2Val := stringLoad2;
                        when OPSOURCE_IMMIDIATE    => source2Val := x"00" & immidiate8;
                        when OPSOURCE_REG_cx       => source2Val := regs.reg_cx;
                        when others => null;
                     end case;
                     
                     target := CPU_REG_ip;
                     case (optarget) is
                        when OPTARGET_DECODE    => target := target_decode;
                        --when OPTARGET_MEM       => target := target_mem;
                        when OPTARGET_MODRM_REG => target := target_reg;
                        when others => null;
                     end case;
                     
-- ####################################################################################
-- ############################## CALC       ##########################################
-- ####################################################################################
            
                     result    := x"0000";
                     newZero   := '0'; 
                     newParity := '0';
                     newSign   := '0';
                     
                     if (aluop /= ALU_OP_NOTHING) then
                        case (aluop) is
                           when ALU_OP_SET1 =>
                              if (opsize = '0') then
                                 op2value := shift_left(to_unsigned(1, 16), to_integer(source2Val(2 downto 0)));
                              else
                                 op2value := shift_left(to_unsigned(1, 16), to_integer(source2Val(3 downto 0)));
                              end if;
                              result := source1Val or op2value;

                           when ALU_OP_CLR1 =>
                              if (opsize = '0') then
                                 op2value := shift_left(to_unsigned(1, 16), to_integer(source2Val(2 downto 0)));
                              else
                                 op2value := shift_left(to_unsigned(1, 16), to_integer(source2Val(3 downto 0)));
                              end if;
                              result := source1Val and (not op2value);

                           when ALU_OP_TEST1 =>
                              if (opsize = '0') then
                                 op2value := shift_left(to_unsigned(1, 16), to_integer(source2Val(2 downto 0)));
                              else
                                 op2value := shift_left(to_unsigned(1, 16), to_integer(source2Val(3 downto 0)));
                              end if;
                              result := source1Val and op2value;
                              regs.FlagCar <= '0'; regs.FlagOvf <= '0'; regs.FlagHaC <= '0';
                              newZero := '1'; newParity := '1'; newSign := '1';

                           when ALU_OP_NOT1 =>
                              if (opsize = '0') then
                                 op2value := shift_left(to_unsigned(1, 16), to_integer(source2Val(2 downto 0)));
                              else
                                 op2value := shift_left(to_unsigned(1, 16), to_integer(source2Val(3 downto 0)));
                              end if;
                              result := source1Val xor op2value;

                           when ALU_OP_ROR4 =>
                              result := x"00" & regs.reg_ax(3 downto 0) & source1Val(7 downto 4);
                              regs.reg_ax(7 downto 0) <= regs.reg_ax(7 downto 4) & source1Val(3 downto 0);

                           when ALU_OP_ROL4 =>
                              result := x"00" & source1Val(3 downto 0) & regs.reg_ax(3 downto 0);
                              regs.reg_ax(7 downto 0) <= regs.reg_ax(7 downto 4) & source1Val(7 downto 4);

                           when ALU_OP_AND | ALU_OP_TST =>
                              result := source1Val and source2Val;
                              regs.FlagCar <= '0'; regs.FlagOvf <= '0'; regs.FlagHaC <= '0';
                              newZero := '1'; newParity := '1'; newSign := '1';
                           
                           when ALU_OP_OR =>
                              result := source1Val or source2Val;
                              regs.FlagCar <= '0'; regs.FlagOvf <= '0'; regs.FlagHaC <= '0';
                              newZero := '1'; newParity := '1'; newSign := '1';
                              
                           when ALU_OP_XOR =>
                              result := source1Val xor source2Val;
                              regs.FlagCar <= '0'; regs.FlagOvf <= '0'; regs.FlagHaC <= '0';
                              newZero := '1'; newParity := '1'; newSign := '1';
                              
                           when ALU_OP_NOT =>
                              result := not source1Val;
                           
                           when ALU_OP_NEG =>
                              result := 0 - source1Val;
                              if (source1Val             > 0) then regs.FlagCar <= '1'; else regs.FlagCar <= '0'; end if;
                              if (source1Val(3 downto 0) > 0) then regs.FlagHaC <= '1'; else regs.FlagHaC <= '0'; end if;
                              regs.FlagOvf <= '0';
                              if (opsize = '0' and source1Val(7 downto 0) =   x"80") then regs.FlagOvf <= '1'; end if;
                              if (opsize = '1' and source1Val             = x"8000") then regs.FlagOvf <= '1'; end if;
                              newZero := '1'; newParity := '1'; newSign := '1';
                           
                           when ALU_OP_ADD | ALU_OP_INC | ALU_OP_ADC =>
                              op2value := source2Val;
                              if (aluop = ALU_OP_ADC and flagCarry = '1') then
                                 op2value := op2value + 1;
                              end if;
                              newZero := '1'; newParity := '1'; newSign := '1';
                              result  := source1Val + op2value;
                              if (aluop /= ALU_OP_INC) then
                                 regs.FlagCar <= '0';
                                 if (opsize = '0' and to_integer(source1Val) + to_integer(op2value) >   16#FF#) then regs.FlagCar <= '1'; end if;
                                 if (opsize = '1' and to_integer(source1Val) + to_integer(op2value) > 16#FFFF#) then regs.FlagCar <= '1'; end if;
                              end if;
                              if (to_integer(source1Val(3 downto 0)) + to_integer(op2value(3 downto 0))  >= 16) then regs.FlagHaC <= '1'; else regs.FlagHaC <= '0'; end if;
                              if (opsize = '0') then
                                 regs.FlagOvf <= (source1Val(7) xor result(7)) and (op2value(7) xor result(7));
                              else
                                 regs.FlagOvf <= (source1Val(15) xor result(15)) and (op2value(15) xor result(15));
                              end if;
                           
                           when ALU_OP_SUB | ALU_OP_CMP | ALU_OP_DEC | ALU_OP_SBB =>
                              op2value := source2Val;
                              if (aluop = ALU_OP_SBB and flagCarry = '1') then
                                 op2value := op2value + 1;
                              end if;
                              newZero := '1'; newParity := '1'; newSign := '1';
                              result  := source1Val - op2value;
                              if (aluop /= ALU_OP_DEC) then
                                 if (op2value > source1Val) then regs.FlagCar <= '1'; else regs.FlagCar <= '0'; end if;
                              end if;
                              if (op2value(3 downto 0) > source1Val(3 downto 0)) then regs.FlagHaC <= '1'; else regs.FlagHaC <= '0'; end if;
                              if (opsize = '0') then
                                 regs.FlagOvf <= (source1Val(7) xor op2value(7)) and (source1Val(7) xor result(7));
                              else
                                 regs.FlagOvf <= (source1Val(15) xor op2value(15)) and (source1Val(15) xor result(15));
                              end if;
                              
                           when ALU_OP_ROL =>
                              result17 := resize(source1Val, 17) sll to_integer(source2Val(4 downto 0));
                              if (opsize = '0') then
                                 result(7 downto 0) := source1Val(7 downto 0) rol to_integer(source2Val(4 downto 0));
                                 regs.FlagCar <= result17(8);
                                 regs.FlagOvf <= source1Val(7) xor result(7);
                              else
                                 result17 := resize(source1Val, 17) sll to_integer(source2Val(4 downto 0));
                                 result   := resize(source1Val, 16) rol to_integer(source2Val(4 downto 0));
                                 regs.FlagCar <= result17(16);
                                 regs.FlagOvf <= source1Val(15) xor result(15);
                              end if;
                           
                           when ALU_OP_ROR =>
                              result17 := (source1Val & '0') srl to_integer(source2Val(4 downto 0));
                              result := result17(16 downto 1);
                              regs.FlagCar <= result17(0);
                              if (opsize = '0') then
                                 result(7 downto 0) := source1Val(7 downto 0) ror to_integer(source2Val(4 downto 0));
                                 regs.FlagOvf <= source1Val(7) xor result(7);
                              else
                                 result := resize(source1Val, 16) ror to_integer(source2Val(4 downto 0));
                                 regs.FlagOvf <= source1Val(15) xor result(15);
                              end if;
                           
                           when ALU_OP_RCL => 
                              carryWork1 := flagCarry;
                              result := source1Val;
                              for i in 0 to 31 loop
                                 if (i < source2Val(4 downto 0)) then
                                    if (opsize = '0') then
                                       carryWork2 := result(7);
                                    else
                                       carryWork2 := result(15);
                                    end if;
                                    result     := result(14 downto 0) & carryWork1;
                                    carryWork1 := carryWork2;
                                 end if;
                              end loop;
                              regs.FlagCar <= carryWork1;
                              if (opsize = '0') then
                                 regs.FlagOvf <= (source1Val(7) xor result(7));
                              else
                                 regs.FlagOvf <= (source1Val(15) xor result(15));
                              end if;
                           
                           when ALU_OP_RCR =>
                              carryWork1 := flagCarry;
                              result := source1Val;
                              for i in 0 to 31 loop
                                 if (i < source2Val(4 downto 0)) then
                                    carryWork2 := result(0);
                                    result     := '0' & result(15 downto 1);
                                    if (opsize = '0') then
                                       result(7) := carryWork1;
                                    else
                                       result(15) := carryWork1;
                                    end if;
                                    carryWork1 := carryWork2;
                                 end if;
                              end loop;
                              regs.FlagCar <= carryWork1;
                              if (opsize = '0') then
                                 regs.FlagOvf <= (source1Val(7) xor result(7));
                              else
                                 regs.FlagOvf <= (source1Val(15) xor result(15));
                              end if;
                           
                           when ALU_OP_SHL | ALU_OP_SAL =>
                              result17 := resize(source1Val, 17) sll to_integer(source2Val(4 downto 0));
                              if (opsize = '0') then regs.FlagCar <= result17(8); end if;
                              if (opsize = '1') then regs.FlagCar <= result17(16); end if;
                              if (aluop = ALU_OP_SAL) then 
                                 regs.FlagOvf <= '0'; 
                              else
                                 if (opsize = '0') then
                                    regs.FlagOvf <= source1Val(7) xor result17(7);
                                 else
                                    regs.FlagOvf <= source1Val(15) xor result17(15);
                                 end if;
                              end if;
                              result := result17(15 downto 0);
                              newZero := '1'; newParity := '1'; newSign := '1';
                           
                           when ALU_OP_SHR =>
                              result17 := (source1Val & '0') srl to_integer(source2Val(4 downto 0));
                              result := result17(16 downto 1);
                              regs.FlagCar <= result17(0);
                              if (opsize = '0') then
                                 regs.FlagOvf <= source1Val(7) xor result(7);
                              else
                                 regs.FlagOvf <= source1Val(15) xor result(15);
                              end if;
                              newZero := '1'; newParity := '1'; newSign := '1';
                              
                           when ALU_OP_SAR =>
                              if (source2Val(4) = '1') then
                                 if ((opsize = '0' and source1Val(7) = '1') or (opsize = '1' and source1Val(15) = '1')) then
                                    result       := x"FFFF";
                                    regs.FlagCar <= '1';
                                 else
                                    result       := x"0000";
                                    regs.FlagCar <= '0';
                                 end if;
                              else
                                 result17 := (source1Val & '0') srl to_integer(source2Val(4 downto 0));
                                 regs.FlagCar <= result17(0);
                                 if (opsize = '0') then
                                    result   := x"00" & unsigned(shift_right(signed(source1Val(7 downto 0)),to_integer(source2Val(4 downto 0))));
                                 else
                                    result   := unsigned(shift_right(signed(source1Val),to_integer(source2Val(4 downto 0))));
                                 end if;
                                 regs.FlagOvf <= '0';
                                 newZero := '1'; newParity := '1'; newSign := '1';
                              end if;
                           
                           
                           when ALU_OP_MUL =>
                              regs.FlagCar <= '0'; regs.FlagOvf <= '0';
                              if (opsize = '0') then
                                 result32 := resize(source1Val(7 downto 0) * memFetchValue2, 32);
                                 regs.reg_ax <= result32(15 downto 0);
                                 if (result32(31 downto 8) /= x"000000") then
                                    regs.FlagCar <= '1'; regs.FlagOvf <= '1';
                                 end if;
                              else
                                 result32 := source1Val * memFetchValue2;
                                 regs.reg_ax <= result32(15 downto 0);
                                 regs.reg_dx <= result32(31 downto 16);
                                 if (result32(31 downto 16) /= x"0000") then
                                    regs.FlagCar <= '1'; regs.FlagOvf <= '1';
                                 end if;
                              end if;
                           
                           when ALU_OP_MULI => 
                              regs.FlagCar <= '0'; regs.FlagOvf <= '0';
                              if (opsize = '0') then
                                 result32 := unsigned(to_signed(to_integer(signed(source1Val(7 downto 0))) * to_integer(signed(memFetchValue2(7 downto 0))), 32));
                                 if (opcode = OP_NOP) then regs.reg_ax <= result32(15 downto 0); end if;
                                 if (result32(31 downto 8) /= x"000000") then
                                    regs.FlagCar <= '1'; regs.FlagOvf <= '1';
                                 end if;
                              else
                                 if (source1 = OPSOURCE_FETCHVALUE8) then
                                    result32 := unsigned(to_signed(to_integer(signed(source1Val(7 downto 0))) * to_integer(signed(memFetchValue2)), 32));
                                 else
                                    result32 := unsigned(to_signed(to_integer(signed(source1Val)) * to_integer(signed(memFetchValue2)), 32));
                                 end if;
                                 if (opcode = OP_NOP) then
                                    regs.reg_ax <= result32(15 downto 0);
                                    regs.reg_dx <= result32(31 downto 16);
                                 end if;
                                 if (result32(31 downto 16) /= x"0000") then
                                    regs.FlagCar <= '1'; regs.FlagOvf <= '1';
                                 end if;
                              end if;
                              result := result32(15 downto 0);
                              
                           when ALU_OP_DECADJUST => 
                              result9 := resize(regs.reg_ax(7 downto 0), 9);
                              regs.FlagCar <= '0';
                              if (regs.FlagHaC = '1' or regs.reg_ax(3 downto 0) > x"9") then
                                 if (adjustNegate = '1') then 
                                    result9 := result9 - 6;
                                 else
                                    result9 := result9 + 6;
                                 end if;
                                 regs.FlagHaC <= '1';
                                 regs.FlagCar <= flagCarry or result9(8);
                              end if;
                              if (flagCarry = '1' or regs.reg_ax(7 downto 0) > x"99") then
                                 if (adjustNegate = '1') then 
                                    result9 := result9 - 16#60#;
                                 else
                                    result9 := result9 + 16#60#;
                                 end if;
                                 regs.FlagCar <= '1';
                              end if;
                              result := x"00" & result9(7 downto 0);
                              newZero := '1'; newParity := '1'; newSign := '1';
                           
                           when ALU_OP_ASCIIADJUST =>
                              result8  := regs.reg_ax(7 downto 0);
                              result8h := regs.reg_ax(15 downto 8);
                              if (regs.FlagHaC = '1' or regs.reg_ax(3 downto 0) > x"9") then
                                 if (adjustNegate = '1') then 
                                    result8  := result8 - 6;
                                    result8h := result8h - 1;
                                 else
                                    result8  := result8 + 6;
                                    result8h := result8h + 1;
                                 end if;
                                 regs.FlagHaC <= '1';
                                 regs.FlagCar <= '1';
                              else
                                 regs.FlagHaC <= '0';
                                 regs.FlagCar <= '0';
                              end if;
                              result8(7 downto 4) := x"0";
                              result := result8h & result8;
                           
                           when ALU_OP_SXT =>
                              if (opcodebyte = x"98") then
                                 if (regs.reg_ax(7) = '1') then
                                    result := x"FF" & regs.reg_ax(7 downto 0);
                                 else 
                                    result := x"00" & regs.reg_ax(7 downto 0);
                                 end if;
                              else
                                 if (regs.reg_ax(15) = '1')  then
                                    result := x"FFFF";
                                 else 
                                    result := x"0000";
                                 end if;
                              end if;
                           
                           when others => null;
                        end case;
                     end if;
         
                     -- flags
                     if (opsize = '0') then
                        result(15 downto 8) := x"00";
                     end if;
                     
                     if (newZero = '1') then
                        if (result = 0) then regs.FlagZer <= '1'; else regs.FlagZer <= '0'; end if;
                     end if;
                     
                     if (newSign = '1') then
                        if (opsize = '0') then regs.FlagSgn <= result(7); else regs.FlagSgn <= result(15); end if;
                     end if;
         
                     if (newParity = '1') then
                        regs.FlagPar <= not(result(7) xor result(6) xor result(5) xor result(4) xor result(3) xor result(2) xor result(1) xor result(0));
                     end if;
                     
                     -- mux result
                     if (useAluResult = '1') then
                        resultval := result;
                     else
                        resultval := source1Val;
                     end if;
            
-- ####################################################################################
-- ############################## OPCodes    ##########################################
-- ####################################################################################
                     
                     exeDone     := '0';
                     newExeDelay := delay;
                     endRepeat   := '0';
                     jumpNow     := '0';
                     jumpAddr    := (others => '0');
                     
                     case (opcode) is
                     
                        when OP_MOVMEM =>
                           if (optarget /= OPTARGET_NONE) then
                              prefetchAllow <= '0';
                              if (bus_read = '0' and bus_write = '0' and (waitexe = '0' or ce = '1')) then
                                 memFirst  <= '0';
                                 waitexe   <= '1';
                                 
                                 varmemSegment := memSegment;
                                 if (prefixSegmentES = '1') then varmemSegment := regs.reg_es; end if;
                                 if (prefixSegmentCS = '1') then varmemSegment := regs.reg_cs; end if;
                                 if (prefixSegmentSS = '1') then varmemSegment := regs.reg_ss; end if;
                                 if (prefixSegmentDS = '1') then varmemSegment := regs.reg_ds; end if;
                                 bus_read          <= '0';
                                 bus_write         <= '1';
                        
                                 if (memFirst = '0') then
                                    bus_addr         <= resize(varmemSegment * 16 + memAddr + 1, 20);
                                    bus_datawrite    <= x"00" & std_logic_vector(resultval(15 downto 8));
                                    bus_be           <= "01";
                                 elsif (opsize = '1' and memAddr(0) = '0') then
                                    bus_addr         <= resize(varmemSegment * 16 + memAddr, 20);
                                    bus_datawrite    <= std_logic_vector(resultval);
                                    bus_be           <= "11";
                                 else
                                    bus_addr         <= resize(varmemSegment * 16 + memAddr, 20);
                                    bus_datawrite    <= std_logic_vector(resultval);
                                    bus_be           <= "01";
                                 end if;
                                 
                                 if (opsize = '0' or memFirst = '0' or memAddr(0) = '0') then
                                    if (SLOWTIMING = '1') then newExeDelay := newExeDelay + 1; end if;
                                    if (opcodeNext /= OP_INVALID) then
                                       if (target_reg2 /= CPU_REG_NONE) then 
                                          target_reg <= target_reg2;
                                       end if;
                                       optarget       <= optarget2;
                                       source1        <= source2;
                                       memFetchValue1 <= memFetchValue2;
                                       opcode         <= opcodeNext;
                                       opcodeNext     <= OP_INVALID;
                                    else
                                       exeDone      := '1';
                                    end if;
                                 end if;
                              elsif (waitexe = '1' and ce = '1') then
                                 waitexe <= '0'; 
                              end if;
                           else
                              exeDone   := '1';
                           end if;
                     
                        when OP_MOVREG =>
                           if (optarget /= OPTARGET_NONE) then
                              case (target) is
                                 when CPU_REG_al => regs.reg_ax(7 downto  0) <= resultval(7 downto 0);
                                 when CPU_REG_ah => regs.reg_ax(15 downto 8) <= resultval(7 downto 0);
                                 when CPU_REG_ax => regs.reg_ax <= resultval;
                                 when CPU_REG_bl => regs.reg_bx(7 downto  0) <= resultval(7 downto 0);
                                 when CPU_REG_bh => regs.reg_bx(15 downto 8) <= resultval(7 downto 0);
                                 when CPU_REG_bx => regs.reg_bx <= resultval;
                                 when CPU_REG_cl => regs.reg_cx(7 downto  0) <= resultval(7 downto 0);
                                 when CPU_REG_ch => regs.reg_cx(15 downto 8) <= resultval(7 downto 0);
                                 when CPU_REG_cx => regs.reg_cx <= resultval;
                                 when CPU_REG_dl => regs.reg_dx(7 downto  0) <= resultval(7 downto 0);
                                 when CPU_REG_dh => regs.reg_dx(15 downto 8) <= resultval(7 downto 0);
                                 when CPU_REG_dx => regs.reg_dx <= resultval;
                                 when CPU_REG_sp => regs.reg_sp <= resultval;
                                 when CPU_REG_bp => regs.reg_bp <= resultval;
                                 when CPU_REG_si => regs.reg_si <= resultval;
                                 when CPU_REG_di => regs.reg_di <= resultval;
                                 when CPU_REG_es => regs.reg_es <= resultval;
                                 when CPU_REG_cs => regs.reg_cs <= resultval;
                                 when CPU_REG_ss => regs.reg_ss <= resultval;
                                 when CPU_REG_ds => regs.reg_ds <= resultval;
                                 when others => null;
                              end case;
                           end if;
                           if (opcodebyte = x"C4") then regs.reg_es <= memFetchValue2; end if;
                           if (opcodebyte = x"C5") then regs.reg_ds <= memFetchValue2; end if;
                           if (opcodeNext /= OP_INVALID) then
                              if (ce = '1') then
                                 if (target_reg2 /= CPU_REG_NONE) then 
                                    target_reg <= target_reg2;
                                 end if;
                                 optarget       <= optarget2;
                                 source1        <= source2;
                                 memFetchValue1 <= memFetchValue2;
                                 opcode         <= opcodeNext;
                                 opcodeNext     <= OP_INVALID;
                              end if;
                           else
                              exeDone   := '1';
                           end if;
                           
                        when OP_EXCHANGE =>
                        	case (opcodebyte) is
                              when x"91" => regs.reg_ax <= regs.reg_cx; regs.reg_cx <= regs.reg_ax;
                              when x"92" => regs.reg_ax <= regs.reg_dx; regs.reg_dx <= regs.reg_ax;
                              when x"93" => regs.reg_ax <= regs.reg_bx; regs.reg_bx <= regs.reg_ax;
                              when x"94" => regs.reg_ax <= regs.reg_sp; regs.reg_sp <= regs.reg_ax;
                              when x"95" => regs.reg_ax <= regs.reg_bp; regs.reg_bp <= regs.reg_ax;
                              when x"96" => regs.reg_ax <= regs.reg_si; regs.reg_si <= regs.reg_ax;
                              when x"97" => regs.reg_ax <= regs.reg_di; regs.reg_di <= regs.reg_ax;
                              when others => null;
                           end case;
                           exeDone := '1';
                           
                        when OP_BOUND =>
                           if (MODRM_value_reg < memFetchValue1 or MODRM_value_reg > memFetchValue2) then
                              irqrequest <= '1';
                              irqvector  <= to_unsigned(20, 10); --5 * 4;
                           end if;
                           exeDone := '1';
                           
                        when OP_OPIN =>
                           case (opstep) is
                              when 0 => 
                                 RegBus_Adr  <= std_logic_vector(source1Val(7 downto 0));
                                 RegBus_rden <= '1';
                                 opstep      <= 1;
                                 
                              when 1 =>
                                 opstep <= 2;
                                 memFetchValue1(7 downto 0) <= unsigned(RegBus_Dout);
                                 if (opcodeNext = OP_INVALID) then
                                    regs.reg_ax(7 downto 0) <= unsigned(RegBus_Dout);
                                 end if;
                                 if (opsize = '0') then
                                    if (opcodeNext /= OP_INVALID) then
                                       if (ce = '1') then
                                          source1        <= source2;
                                          opcode         <= opcodeNext;
                                          opcodeNext     <= OP_INVALID;
                                          opstep         <= 0;
                                       end if;
                                    else
                                       exeDone := '1';
                                    end if;
                                 else
                                    RegBus_Adr   <= std_logic_vector(source1Val(7 downto 0) + 1);
                                    RegBus_rden  <= '1';
                                 end if;

                              when 2 => 
                                 memFetchValue1(15 downto 8)  <= unsigned(RegBus_Dout);
                                 if (opcodeNext = OP_INVALID) then
                                    regs.reg_ax(15 downto 8)  <= unsigned(RegBus_Dout);
                                 end if;
                                 if (opcodeNext /= OP_INVALID) then
                                    if (ce = '1') then
                                       source1        <= source2;
                                       opcode         <= opcodeNext;
                                       opcodeNext     <= OP_INVALID;
                                       opstep         <= 0;
                                    end if;
                                 else
                                    exeDone := '1';
                                 end if;
                                 
                              when others => null;
                           end case;
                           
                        when OP_OPOUT =>
                           memFirst <= '0';
                           if (opsize = '0' or memFirst = '1') then
                              RegBus_Din   <= std_logic_vector(source2Val(7 downto 0));
                              RegBus_Adr   <= std_logic_vector(source1Val(7 downto 0));
                              RegBus_wren  <= '1';
                           elsif (ce = '1') then
                              RegBus_Din   <= std_logic_vector(source2Val(15 downto 8));
                              RegBus_Adr   <= std_logic_vector(source1Val(7 downto 0) + 1);
                              RegBus_wren  <= '1';
                           end if;
                           if (opsize = '0' or (memFirst = '0' and ce = '1')) then
                              exeDone      := '1';
                              newExeDelay  := newExeDelay + 1;
                           end if;

                        when OP_BCDSTRING =>
                           if ((bcdOffset & "0") >= regs.reg_cx(7 downto 0)) then
                              exeDone         := '1';
                           else              
                              case (opstep) is
                                 when 0 =>
                                    if (ce = '1') then
                                       opstep <= 1;
                                       varmemSegment := regs.reg_ds;
                                       if (prefixSegmentES = '1') then varmemSegment := regs.reg_es; end if;
                                       if (prefixSegmentCS = '1') then varmemSegment := regs.reg_cs; end if;
                                       if (prefixSegmentSS = '1') then varmemSegment := regs.reg_ss; end if;
                                       if (prefixSegmentDS = '1') then varmemSegment := regs.reg_ds; end if;
                                       bus_read          <= '1';
                                       bus_write         <= '0';
                                       bus_addr          <= resize(varmemSegment * 16 + regs.reg_si + bcdOffset, 20);
                                       prefetchAllow     <= '0';
                                    end if;
                                 
                                 when 1 => opstep <= 2; -- wait

                                 when 2 =>
                                    opstep <= 3;
                                    if (regs.FlagCar = '0') then
                                       fetch1Val(7 downto 0)  <= unsigned(bus_dataread(7 downto 0));
                                    else
                                       fetch1Val(7 downto 0)  <= unsigned(bus_dataread(7 downto 0)) + 1;
                                    end if;
                                    regs.FlagCar <= '0';
                                 
                                 when 3 =>
                                    if (ce = '1') then
                                       bus_read          <= '1';
                                       bus_write         <= '0';
                                       bus_addr          <= resize(regs.reg_es * 16 + regs.reg_di + bcdOffset, 20);
                                       prefetchAllow     <= '0';
                                       opstep <= 4;
                                    end if;
                                 
                                 when 4 => opstep <= 5; -- wait
                                 
                                 when 5 =>
                                    opstep <= 6;
                                    if (bcdOp = BCD_OP_ADD) then
                                       bcdAccLow <= resize(unsigned(bus_dataread(3 downto 0)), 5) + resize(unsigned(fetch1Val(3 downto 0)), 5);
                                       bcdAccHigh <= resize(unsigned(bus_dataread(7 downto 4)), 5) + resize(unsigned(fetch1Val(7 downto 4)), 5);
                                    else
                                       bcdAccLow <= resize(unsigned(bus_dataread(3 downto 0)), 5) - resize(unsigned(fetch1Val(3 downto 0)), 5);
                                       bcdAccHigh <= resize(unsigned(bus_dataread(7 downto 4)), 5) - resize(unsigned(fetch1Val(7 downto 4)), 5);
                                    end if;

                                 when 6 =>
                                    opstep <= 7;
                                    bcdResultLow := bcdAccLow;
                                    bcdResultHigh := bcdAccHigh;
                                    if (bcdResultLow > x"9") then
                                       if (bcdOp = BCD_OP_ADD) then 
                                          bcdResultLow := bcdResultLow + 6;
                                          bcdResultHigh := bcdResultHigh + 1;
                                       else
                                          bcdResultLow := bcdResultLow - 6;
                                          bcdResultHigh := bcdResultHigh - 1;
                                       end if;
                                    end if;
                                    if (bcdResultHigh > x"9") then
                                       if (bcdOp = BCD_OP_ADD) then 
                                          bcdResultHigh := bcdResultHigh + 6;
                                       else
                                          bcdResultHigh := bcdResultHigh - 6;
                                       end if;
                                       regs.FlagCar <= '1';
                                    end if;
                                    bcdAcc <= bcdResultHigh(3 downto 0) & bcdResultLow(3 downto 0);
                                 
                                 when 7 =>
                                    if (bcdOp = BCD_OP_CMP) then
                                       if (bcdAcc /= x"00") then
                                          regs.FlagZer <= '0';
                                       end if;

                                       bcdOffset <= bcdOffset + 1;
                                       opstep <= 0;
                                    else
                                       prefetchAllow <= '0';
                                       if (bus_read = '0' and bus_write = '0' and (waitexe = '0' or ce = '1')) then
                                          waitexe   <= '1';
                                          bus_read          <= '0';
                                          bus_write         <= '1';
                                          bus_be            <= "01";
                                          bus_datawrite    <= x"00" & std_logic_vector(bcdAcc);
                                          bus_addr         <= resize(regs.reg_es * 16 + regs.reg_di + bcdOffset, 20);

                                          if (bcdAcc /= x"00") then
                                             regs.FlagZer <= '0';
                                          end if;

                                          bcdOffset <= bcdOffset + 1;
                                          opstep <= 0;
                                       elsif (waitexe = '1' and ce = '1') then
                                          waitexe <= '0'; 
                                       end if;
                                    end if;
                              end case;
                           end if;
                        
                        when OP_STRINGLOAD =>
                           if (opsize = '1') then
                               wordAligned := (not regs.reg_si(0));
                           else
                               wordAligned := '0';
                           end if;
                           if (repeat = '1' and regs.reg_cx = 0) then
                              repeat          <= '0';
                              endRepeat       := '1';
                              prefixIP        <= (others => '0');
                              regs.reg_ip     <= regs.reg_ip + 1;
                              consumePrefetch <= 1;
                              newExeDelay     := newExeDelay + 1;
                              exeDone         := '1';
                              if (opcodeNext /= OP_INVALID) then newExeDelay := newExeDelay + 2 + to_integer('0'&opsize); end if;
                           else
                           
                              case (opstep) is
                                 when 0 =>
                                    if (ce = '1') then
                                       opstep <= 1;
                                       varmemSegment := regs.reg_ds;
                                       if (prefixSegmentES = '1') then varmemSegment := regs.reg_es; end if;
                                       if (prefixSegmentCS = '1') then varmemSegment := regs.reg_cs; end if;
                                       if (prefixSegmentSS = '1') then varmemSegment := regs.reg_ss; end if;
                                       if (prefixSegmentDS = '1') then varmemSegment := regs.reg_ds; end if;
                                       bus_read          <= '1';
                                       bus_write         <= '0';
                                       if (memFirst = '0') then
                                          bus_addr       <= resize(varmemSegment * 16 + regs.reg_si + 1, 20);
                                       else
                                          bus_addr       <= resize(varmemSegment * 16 + regs.reg_si, 20);
                                       end if;
                                       prefetchAllow     <= '0';
                                    end if;
                                 
                                 when 1 => opstep <= 2;
                                 
                                 when 2 => 
                                    opstep <= 0;
                                    memFirst <= '0';
                                    if (wordAligned = '1') then
                                       stringLoad(15 downto 0) <= unsigned(bus_dataread(15 downto 0));
                                    elsif (opsize = '0' or memFirst = '1') then
                                       stringLoad(7 downto 0) <= unsigned(bus_dataread(7 downto 0));
                                       if (opsize = '0') then stringLoad(15 downto 8) <= x"00"; end if;
                                    else
                                       stringLoad(15 downto 8) <= unsigned(bus_dataread(7 downto 0));
                                    end if;
                                    if (opsize = '0' or memFirst = '0' or wordAligned = '1') then
                                       if (regs.FlagDir) then 
                                          regs.reg_si <= regs.reg_si - 1 - to_integer('0'&opsize);
                                       else                                 
                                          regs.reg_si <= regs.reg_si + 1 + to_integer('0'&opsize);
                                       end if;
                                    
                                       if (opcodeNext /= OP_INVALID) then
                                          opcode     <= opcodeNext;
                                          opcodeNext <= OP_INVALID;
                                          memFirst   <= '1';
                                       else
                                          exeDone := '1';
                                          if (repeat = '1') then
                                             regs.reg_cx <= regs.reg_cx - 1;
                                             if (regs.reg_cx = 1) then
                                                repeat          <= '0';
                                                endRepeat       := '1';
                                                prefixIP        <= (others => '0');
                                                regs.reg_ip     <= regs.reg_ip + 1;
                                                consumePrefetch <= 1;
                                             end if;
                                          end if;
                                       end if;
                                    end if;
                                 
                                 when others => null;
                              end case;
                              
                           end if;
                           
                        when OP_STRINGCOMPARE =>
                           if (opsize = '1') then
                               wordAligned := (not regs.reg_di(0));
                           else
                               wordAligned := '0';
                           end if;

                           if (repeat = '1' and regs.reg_cx = 0) then
                              repeat          <= '0';
                              endRepeat       := '1';
                              prefixIP        <= (others => '0');
                              regs.reg_ip     <= regs.reg_ip + 1;
                              consumePrefetch <= 1;
                              exeDone         := '1';
                           else
                           
                              case (opstep) is
                                 when 0 =>
                                    if (ce = '1') then
                                       opstep <= 1;
                                       bus_read          <= '1';
                                       bus_write         <= '0';
                                       if (memFirst = '0') then
                                          bus_addr       <= resize(regs.reg_es * 16 + regs.reg_di + 1, 20);
                                       else
                                          bus_addr       <= resize(regs.reg_es * 16 + regs.reg_di, 20);
                                       end if;
                                       prefetchAllow     <= '0';
                                    end if;
                                 
                                 when 1 => opstep <= 2;
                                 
                                 when 2 => 
                                    memFirst <= '0';
                                    if (wordAligned = '1') then
                                       stringLoad2(15 downto 0) <= unsigned(bus_dataread(15 downto 0));
                                    elsif (opsize = '0' or memFirst = '1') then
                                       stringLoad2(7 downto 0) <= unsigned(bus_dataread(7 downto 0));
                                       if (opsize = '0') then stringLoad2(15 downto 8) <= x"00"; end if;
                                    else
                                       stringLoad2(15 downto 8) <= unsigned(bus_dataread(7 downto 0));
                                    end if;
                                    if (opsize = '0' or memFirst = '0' or wordAligned = '1') then
                                       opstep <= 3;
                                       aluop  <= ALU_OP_CMP;
                                    else
                                       opstep <= 0;
                                    end if;
                                    
                                 when 3 =>
                                    if (ce = '1') then
                                       exeDone := '1';
                                       if (regs.FlagDir) then 
                                          regs.reg_di <= regs.reg_di - 1 - to_integer('0'&opsize);
                                       else                                 
                                          regs.reg_di <= regs.reg_di + 1 + to_integer('0'&opsize);
                                       end if;
                                       if (repeat = '1') then
                                          regs.reg_cx <= regs.reg_cx - 1;
                                          if (regs.reg_cx = 1 or (repeatZero = '0' and regs.FlagZer = '1') or (repeatZero = '1' and regs.FlagZer = '0')) then
                                             repeat          <= '0';
                                             endRepeat       := '1';
                                             prefixIP        <= (others => '0');
                                             regs.reg_ip     <= regs.reg_ip + 1;
                                             consumePrefetch <= 1;
                                          end if;
                                       end if;
                                    end if;
                                    
                                 
                                 when others => null;
                              end case;
                              
                           end if;
                           
                        when OP_STRINGSTORE =>
                           if (opsize = '1') then
                               wordAligned := (not regs.reg_di(0));
                           else
                               wordAligned := '0';
                           end if;
                           if (repeat = '1' and regs.reg_cx = 0) then
                              repeat          <= '0';
                              endRepeat       := '1';
                              prefixIP        <= (others => '0');
                              regs.reg_ip     <= regs.reg_ip + 1;
                              consumePrefetch <= 1;
                              newExeDelay     := newExeDelay + 1;
                              exeDone         := '1';
                           else
                              prefetchAllow <= '0';
                              if (bus_read = '0' and bus_write = '0' and (waitexe = '0' or ce = '1')) then
                                 memFirst  <= '0';
                                 waitexe   <= '1';
                                 
                                 bus_read          <= '0';
                                 bus_write         <= '1';
                                 bus_be            <= "01";
                                 if (wordAligned = '1') then
                                    bus_datawrite    <= std_logic_vector(resultval(15 downto 0));
                                    bus_addr         <= resize(regs.reg_es * 16 + regs.reg_di, 20);
                                    bus_be           <= "11";
                                 elsif (memFirst = '0') then
                                    bus_datawrite    <= x"00" & std_logic_vector(resultval(15 downto 8));
                                    bus_addr         <= resize(regs.reg_es * 16 + regs.reg_di + 1, 20);
                                 else
                                    bus_datawrite    <= x"00" & std_logic_vector(resultval(7 downto 0));
                                    bus_addr         <= resize(regs.reg_es * 16 + regs.reg_di, 20);
                                 end if;
                                 
                                 if (opsize = '0' or memFirst = '0' or wordAligned = '1') then
                                    exeDone   := '1';
                                    if (regs.FlagDir) then 
                                       regs.reg_di <= regs.reg_di - 1 - to_integer('0'&opsize);
                                    else                                 
                                       regs.reg_di <= regs.reg_di + 1 + to_integer('0'&opsize);
                                    end if;
                                    if (repeat = '1') then
                                       regs.reg_cx <= regs.reg_cx - 1;
                                       if (regs.reg_cx = 1) then
                                          repeat          <= '0';
                                          endRepeat       := '1';
                                          prefixIP        <= (others => '0');
                                          regs.reg_ip     <= regs.reg_ip + 1;
                                          consumePrefetch <= 1;
                                       end if;
                                    end if;
                                 end if;
                              elsif (waitexe = '1' and ce = '1') then
                                 waitexe <= '0'; 
                              end if;
                           end if;
                           
                        when OP_ENTER =>
                           case (opstep) is
                              when 0 =>
                                 regs.reg_bp <= regs.reg_sp;
                                 regs.reg_sp <= regs.reg_sp - fetch1Val;
                                 opstep      <= 1;
                                 if (fetch2Val(4 downto 0) = 0) then
                                    exeDone   := '1';
                                 end if;
                              
                              when 1 =>
                                 if (ce = '1') then
                                    opstep <= 2;
                                    varmemSegment := regs.reg_ds;
                                    if (prefixSegmentES = '1') then varmemSegment := regs.reg_es; end if;
                                    if (prefixSegmentCS = '1') then varmemSegment := regs.reg_cs; end if;
                                    if (prefixSegmentSS = '1') then varmemSegment := regs.reg_ss; end if;
                                    if (prefixSegmentDS = '1') then varmemSegment := regs.reg_ds; end if;
                                    bus_read          <= '1';
                                    bus_write         <= '0';
                                    if (memFirst = '1') then 
                                       bus_addr          <= resize(varmemSegment * 16 + regs.reg_bp - (enterCnt * 2), 20);
                                    else
                                       bus_addr          <= resize(varmemSegment * 16 + regs.reg_bp - (enterCnt * 2) + 1, 20);
                                    end if;
                                    prefetchAllow     <= '0';
                                 end if;
                              
                              when 2 => opstep <= 3;
                              
                              when 3 =>
                                 memFirst <= '0';
                                 if (memFirst = '1') then 
                                    memFetchValue1(7 downto 0)  <= unsigned(bus_dataread(7 downto 0));
                                 else
                                    memFetchValue1(15 downto 8) <= unsigned(bus_dataread(7 downto 0));
                                 end if;
                                 if (memFirst = '0') then
                                    enterCnt <= enterCnt + 1;
                                    if (enterCnt = fetch2Val(4 downto 0)) then
                                       pushlist <= REGPOS_bp;
                                       opcode   <= OP_NOP;
                                       cpustage <= CPUSTAGE_PUSH;
                                    else
                                       pushlist <= REGPOS_mem;
                                       cpustage <= CPUSTAGE_PUSH;
                                       opstep   <= 1;
                                       memFirst <= '1';
                                    end if;
                                 end if;
                                 
                              when others => null;
                           
                           end case;
                           
                        when OP_JUMPIF =>
                           cond := '0';
                           case (opcodebyte) is
                              when x"70" => if (regs.FlagOvf  = '1'                                ) then cond := '1'; end if;
                              when x"71" => if (regs.FlagOvf  = '0'                                ) then cond := '1'; end if;
                              when x"72" => if (regs.FlagCar  = '1'                                ) then cond := '1'; end if;
                              when x"73" => if (regs.FlagCar  = '0'                                ) then cond := '1'; end if;
                              when x"74" => if (regs.FlagZer  = '1'                                ) then cond := '1'; end if;
                              when x"75" => if (regs.FlagZer  = '0'                                ) then cond := '1'; end if;
                              when x"76" => if (regs.FlagZer  = '1'  or regs.FlagCar = '1'         ) then cond := '1'; end if;
                              when x"77" => if (regs.FlagZer  = '0' and regs.FlagCar = '0'         ) then cond := '1'; end if;
                              when x"78" => if (regs.FlagSgn  = '1'                                ) then cond := '1'; end if;
                              when x"79" => if (regs.FlagSgn  = '0'                                ) then cond := '1'; end if;
                              when x"7A" => if (regs.FlagPar  = '1'                                ) then cond := '1'; end if;
                              when x"7B" => if (regs.FlagPar  = '0'                                ) then cond := '1'; end if;
                              when x"7C" => if (regs.FlagSgn /= regs.FlagOvf and regs.FlagZer = '0') then cond := '1'; end if;
                              when x"7D" => if (regs.FlagSgn  = regs.FlagOvf  or regs.FlagZer = '1') then cond := '1'; end if;
                              when x"7E" => if (regs.FlagSgn /= regs.FlagOvf  or regs.FlagZer = '1') then cond := '1'; end if;
                              when x"7F" => if (regs.FlagSgn  = regs.FlagOvf and regs.FlagZer = '0') then cond := '1'; end if;
                              when x"E0" => if (regs.reg_cx /= 1 and regs.FlagZer = '0') then cond := '1'; end if; regs.reg_cx <= regs.reg_cx - 1;
                              when x"E1" => if (regs.reg_cx /= 1 and regs.FlagZer = '1') then cond := '1'; end if; regs.reg_cx <= regs.reg_cx - 1;
                              when x"E2" => if (regs.reg_cx /= 1) then cond := '1'; end if; regs.reg_cx <= regs.reg_cx - 1;
                              when x"E3" => if (regs.reg_cx  = 0) then cond := '1'; end if;
                              when x"EB" => cond := '1';
                              when others => null;
                           end case;
                           if (cond = '1') then
                              jumpNow  := '1';
                              jumpAddr := to_unsigned(to_integer(regs.reg_ip) + to_integer(signed(source1Val(7 downto 0))), 16);
                           end if;
                           exeDone       := '1';
                           
                        when OP_JUMP =>
                           jumpNow       := '1';
                           jumpAddr      := regs.reg_ip + source1Val;
                           clearPrefetch <= '1';
                           exeDone       := '1';
                           
                        when OP_JUMPABS =>
                           jumpNow       := '1';
                           jumpAddr      := source1Val;
                           clearPrefetch <= '1';
                           exeDone       := '1';
               
                        when OP_JUMPFAR =>
                           jumpNow       := '1';
                           jumpAddr      := source1Val;
                           regs.reg_cs   <= source2Val;
                           clearPrefetch <= '1';
                           exeDone       := '1';
                           
                        when OP_RETURNFAR =>
                           regs.reg_sp   <= regs.reg_sp + source1Val;
                           clearPrefetch <= '1';
                           newExeDelay   := newExeDelay + 3;
                           exeDone       := '1';
                           
                        when OP_IRQ =>
                           regs.FlagBrk  <= '0';
                           regs.FlagIrq  <= '0';
                           regs.FlagMod  <= '1';
                           jumpNow       := '1';
                           jumpAddr      := irqIP;
                           regs.reg_cs   <= irqCS;
                           clearPrefetch <= '1';
                           exeDone       := '1';
                           
                        when OP_IRQREQUEST =>
                           irqrequest <= '1';
                           irqvector  <= source1Val(7 downto 0) & "00";
                           cpustage   <= CPUSTAGE_IDLE;
                           
                        when OP_FLAGSFROMACC =>
                           regs.FlagCar <= regs.reg_ax(8);
                           regs.FlagPar <= regs.reg_ax(10);
                           regs.FlagHaC <= regs.reg_ax(12);
                           regs.FlagZer <= regs.reg_ax(14);
                           regs.FlagSgn <= regs.reg_ax(15);
                           exeDone       := '1';
                        
                        when OP_FLAGSTOACC => 
                           regs.reg_ax(15 downto 8) <= Reg_f(7 downto 0);
                           exeDone     := '1';
                           
                        when OP_DIV =>
                           if (opstep = 0 and ce = '1') then
                              delay      <= 10;
                              opstep     <= 1;
                              DIVstart   <= '1';
                              DIVdivisor <= '0' & x"0000" & signed(memFetchValue2);
                              if (opsize = '0') then
                                 DIVdividend <= '0' & x"0000" & signed(regs.reg_ax);
                              else
                                 DIVdividend <= '0' & signed(regs.reg_dx) & signed(regs.reg_ax);
                              end if;
                           elsif (ce = '1') then
                              exeDone := '1';
                              if (memFetchValue2 = 0) then
                                 irqrequest <= '1';
                                 irqvector  <= (others => '0');
                              else
                                  if (opsize = '0') then
                                    regs.reg_ax <= unsigned(DIVremainder(7 downto 0)) & unsigned(DIVquotient(7 downto 0));
                                 else
                                    regs.reg_ax <= unsigned(DIVquotient(15 downto 0));
                                    regs.reg_dx <= unsigned(DIVremainder(15 downto 0));
                                 end if;
                              end if;
                           end if;  
                           
                         when OP_DIVI =>
                           if (opstep = 0 and ce = '1') then
                              delay      <= 10;
                              opstep     <= 1;
                              DIVstart   <= '1';
                              if (opsize = '0') then
                                 DIVdividend <= resize(signed(regs.reg_ax), 33);
                                 DIVdivisor  <= resize(signed(memFetchValue2(7 downto 0)), 33);
                              else
                                 DIVdividend <= resize(signed(regs.reg_dx & regs.reg_ax), 33);
                                 DIVdivisor  <= resize(signed(memFetchValue2), 33);
                              end if;
                           elsif (ce = '1') then
                              exeDone := '1';
                              if (memFetchValue2 = 0) then
                                 irqrequest <= '1';
                                 irqvector  <= (others => '0');
                              else
                                  if (opsize = '0') then
                                    regs.reg_ax <= unsigned(DIVremainder(7 downto 0)) & unsigned(DIVquotient(7 downto 0));
                                 else
                                    regs.reg_ax <= unsigned(DIVquotient(15 downto 0));
                                    regs.reg_dx <= unsigned(DIVremainder(15 downto 0));
                                 end if;
                              end if;
                           end if;  
                           
                        when OP_MULADJUST =>
                           if (opstep = 0 and ce = '1') then
                              delay      <= 10;
                              opstep     <= 1;
                              DIVstart   <= '1';
                              DIVdividend <= '0' & x"000000" & signed(regs.reg_ax(7 downto 0));
                              DIVdivisor <= to_signed(10, 33);
                           elsif (ce = '1') then
                              exeDone := '1';
                              if (fetch1Val = 0) then
                                 irqrequest <= '1';
                                 irqvector  <= (others => '0');
                              else
                                 regs.reg_ax <= unsigned(DIVquotient(7 downto 0)) & unsigned(DIVremainder(7 downto 0));
                                 if (DIVremainder(7 downto 0) = 0 and DIVquotient(7 downto 0) = 0) then regs.FlagZer <= '1'; else regs.FlagZer <= '0'; end if;
                                 regs.FlagSgn <= DIVremainder(7);
                                 regs.FlagPar <= not(DIVremainder(7) xor DIVremainder(6) xor DIVremainder(5) xor DIVremainder(4) xor DIVremainder(3) xor DIVremainder(2) xor DIVremainder(1) xor DIVremainder(0));
                              end if;
                           end if;  
                        
                        when OP_DIVADJUST =>
                           result8 := regs.reg_ax(7 downto 0) + resize(regs.reg_ax(15 downto 8) * 10, 8);
                           regs.reg_ax( 7 downto 0) <= result8;
                           regs.reg_ax(15 downto 8) <= x"00";
                           if (result8 = 0) then regs.FlagZer <= '1'; else regs.FlagZer <= '0'; end if;
                           regs.FlagSgn <='0';
                           regs.FlagPar <= not(result8(7) xor result8(6) xor result8(5) xor result8(4) xor result8(3) xor result8(2) xor result8(1) xor result8(0));
                           exeDone       := '1';

                        when others => 
                           exeDone    := '1';
               
                     end case;
                     
                     if (jumpNow = '1') then
                        regs.reg_ip    <= jumpAddr;
                        clearPrefetch  <= '1';
                        if (jumpAddr(0) = '1') then
                           newExeDelay    := newExeDelay + 4;
                        else
                           newExeDelay    := newExeDelay + 3;
                        end if;
                     end if;
                     
                     if (exeDone = '1') then 
                        delay <= newExeDelay;
                        if (newExeDelay = 0) then
                           cpu_done <= '1';
                        else
                           cpu_finished <= '1';
                        end if;
                        cpustage        <= CPUSTAGE_IDLE;
                        if (repeat = '0' or endRepeat = '1') then
                           prefixSegmentES <= '0';  
                           prefixSegmentCS <= '0';  
                           prefixSegmentSS <= '0';  
                           prefixSegmentDS <= '0';
                        end if;
                     end if;
                  
                  when others =>
                     null;
               
               end case;
               
            end if; 
            
            -- prefetch
            varPrefetchCount  := prefetchCount;
            varprefetchBuffer := prefetchBuffer;
            
            case (prefetchState) is
            
               when PREFETCH_IDLE =>
                  if (ce = '1' and prefetchCount < 14 and dma_active = '0' and sdma_request = '0') then
                     prefetchState   <= PREFETCH_READ;
                     prefetchDisturb <= '0';
                  end if;
               
               when PREFETCH_READ =>
                  if (prefetchAllow = '1') then
                     prefetchAddrOld <= prefetchAddr;
                     prefetchState <= PREFETCH_WAIT;
                     bus_addr <= prefetchAddr;
                     bus_read <= '1';
                     if (prefetchAddr(0) = '1') then
                        prefetchAddr  <= PrefetchAddr + 1;
                        prefetch1byte <= '1';
                     else
                        prefetchAddr  <= PrefetchAddr + 2;
                        prefetch1byte <= '0';
                     end if;
                  else
                     prefetchState <= PREFETCH_IDLE;
                  end if;
               
               when PREFETCH_WAIT   => prefetchState <= PREFETCH_RECEIVE;
               
               when PREFETCH_RECEIVE =>
                  prefetchState <= PREFETCH_IDLE;
                  if (prefetchAllow = '1' and dma_active = '0' and prefetchDisturb = '0') then
                     varprefetchBuffer((PrefetchCount * 8) + 7 downto (PrefetchCount * 8)) := bus_dataread(7 downto 0);
                     if (prefetch1byte = '0') then
                        varprefetchBuffer((PrefetchCount * 8) + 15 downto (PrefetchCount * 8) + 8) := bus_dataread(15 downto 8);
                        varPrefetchCount := varPrefetchCount + 2;
                     else
                        varPrefetchCount := varPrefetchCount + 1;
                     end if;
                  else
                     prefetchAddr <= prefetchAddrOld;
                  end if;

            end case;
            
            if (consumePrefetch = 1) then
               varprefetchBuffer := x"00" & varprefetchBuffer(127 downto 8);
               varPrefetchCount  := varPrefetchCount - 1;
            elsif (consumePrefetch = 2) then
               varprefetchBuffer := x"0000" & varprefetchBuffer(127 downto 16);
               varPrefetchCount  := varPrefetchCount - 2;
            elsif (consumePrefetch = 3) then
               varprefetchBuffer := x"000000" & varprefetchBuffer(127 downto 24);
               varPrefetchCount  := varPrefetchCount - 3;
            end if;
            
            prefetchCount  <= varPrefetchCount;
            prefetchBuffer <= varprefetchBuffer;
            
            if (clearPrefetch = '1') then
               if (ce = '1') then
                  prefetchState <= PREFETCH_READ;
               else
                  prefetchState <= PREFETCH_IDLE;
               end if;
               prefetchCount    <= 0;
               prefetchBuffer   <= (others => '0');
               prefetchAddr     <= resize(regs.reg_cs * 16 + regs.reg_ip, 20);
            end if;
         
         end if;
      end if;
   end process;
   
   idivider : entity work.divider
   port map
   (
      clk       => clk,      
      start     => DIVstart,
      done      => open,      
      busy      => open,
      dividend  => DIVdividend, 
      divisor   => DIVdivisor,  
      quotient  => DIVquotient, 
      remainder => DIVremainder
   );

   cpu_export_reg_cs <= regs.reg_cs;        
   cpu_export_reg_ip <= regs.reg_ip;        
   cpu_export_opcode  <= opcodebyte;        

end architecture;












