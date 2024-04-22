library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
--sim: use std.env.all;
use work.Common.all;

entity CPU is
  generic (
    debug      : boolean
    );
  port (
    clk : in std_logic;
    rst : in std_logic;
    start_addr : std_logic_vector (31 downto 0);
    addr_sw: in std_logic;

    -- Memory
    mem_en        : out std_logic                      := '1';
    mem_rw        : out RwType;
    mem_length    : out LenType;
    mem_addr      : out std_logic_vector (31 downto 0) := Int32_Zero;
    mem_data_in   : out std_logic_vector (31 downto 0);
    mem_data_out  : in  std_logic_vector (31 downto 0);
    mem_completed : in  std_logic;
    
    -- Interupts
    int_com : in std_logic;
    
    led    : out std_logic_vector (15 downto 0);
    seg7_l_num: out Int4
    );
end CPU;

architecture Behavioral of CPU is
  component RegisterFile
    port (
      clk     : in  std_logic;
      rst     : in  std_logic;
      rw      : in  RwType;
      rdReg1  : in  std_logic_vector (4 downto 0);
      rdReg2  : in  std_logic_vector (4 downto 0);
      wrReg   : in  std_logic_vector (4 downto 0);
      wrData  : in  std_logic_vector (31 downto 0);
      rdData1 : out std_logic_vector (31 downto 0);
      rdData2 : out std_logic_vector (31 downto 0));
  end component;
  component AluOpEncoder
    port (
      op    : in  std_logic_vector(5 downto 0);
      func  : in  std_logic_vector(5 downto 0);
      rt    : in  std_logic_vector(4 downto 0);
      aluop : out AluOpType);
  end component;
  component ALU
    port (
      aluop: in AluOpType;
      operand1: in Int32;
      operand2: in Int32;
      result: out Int32;
      result_ext: out Int32
    );
  end component;

  signal reg_rw      : RwType;
  signal reg_rdReg1  : std_logic_vector (4 downto 0)  := "00000";
  signal reg_rdReg2  : std_logic_vector (4 downto 0)  := "00000";
  signal reg_wrReg   : std_logic_vector (4 downto 0)  := "00000";
  signal reg_wrData  : std_logic_vector (31 downto 0) := Int32_Zero;
  signal reg_rdData1 : std_logic_vector (31 downto 0);
  signal reg_rdData2 : std_logic_vector (31 downto 0);

  signal aluop    : AluOpType;
  signal alu_op   : std_logic_vector(5 downto 0)  := "000000";
  signal alu_func : std_logic_vector(5 downto 0)  := "000000";
  signal alu_rt   : std_logic_vector(4 downto 0)  := "00000";
  signal alu_a    : std_logic_vector(31 downto 0) := Int32_Zero;
  signal alu_b    : std_logic_vector(31 downto 0) := Int32_Zero;
  signal alu_r    : std_logic_vector(31 downto 0);
  signal alu_rext : std_logic_vector(31 downto 0);

begin

  RegisterFile_1 : RegisterFile
    port map (
      clk     => clk,
      rst     => rst,
      rw      => reg_rw,
      rdReg1  => reg_rdReg1,
      rdReg2  => reg_rdReg2,
      wrReg   => reg_wrReg,
      wrData  => reg_wrData,
      rdData1 => reg_rdData1,
      rdData2 => reg_rdData2);
  AluOpEncoder_1 : AluOpEncoder
    port map (
      op    => alu_op,
      func  => alu_func,
      rt    => alu_rt,
      aluop => aluop);
  ALU_1 : ALU
    port map (
      aluop    => aluop,
      operand1 => alu_a,
      operand2 => alu_b,
      result   => alu_r,
      result_ext => alu_rext
    );

  process (clk, rst)
    type StateType is (
      HALT,
      IF_0,                             -- Instruction Fetch
      IF_1,                             -- wait for fetching
      ID_0,                             -- Instruction Decode
      EX_0,                             -- Execute
      MEM_0,                            -- Memory Access
      MEM_1,                            -- wait for memory operation
      WB_0                              -- Write Back
      );
    type Cp0RegsType is array(0 to 31) of Int32;
    type TlbType is array(0 to 15) of std_logic_vector(62 downto 0);

    variable state   : StateType;
    variable L       : line;
    variable pc, npc : Int32;
    variable instr   : Int32;   
    variable hi, lo  : Int32;
    variable cp0regs : Cp0RegsType;
    variable tlb     : TlbType;
    
    variable idx        : integer range 0 to 15;
    variable cp0reg_num : integer range 0 to 31;

    alias op          : Int6 is instr(31 downto 26);
    alias rs          : Int5 is instr(25 downto 21);
    alias rt          : Int5 is instr(20 downto 16);
    alias rd          : Int5 is instr(15 downto 11);
    alias sa          : Int5 is instr(10 downto 6);
    alias func        : Int6 is instr(5 downto 0);
    alias instr_index : Int26 is instr(25 downto 0);
    alias imm         : Int16 is instr(15 downto 0);
    
    alias Index : Int32 is cp0regs(0);
    alias EntryLo0 : Int32 is cp0regs(2);
    alias EntryLo1 : Int32 is cp0regs(3);
    alias BadVAddr : Int32 is cp0regs(8);
    alias Count : Int32 is cp0regs(9);
    alias EntryHi : Int32 is cp0regs(10);
    alias Compare : Int32 is cp0regs(11);
    alias SR : Int32 is cp0regs(12);
    alias Cause : Int32 is cp0regs(13);
    alias EPC : Int32 is cp0regs(14);
    alias EBase : Int32 is cp0regs(15);
    
    -- SR
    alias IM : std_logic_vector(7 downto 0) is cp0regs(12)(15 downto 8);
    alias KSU : std_logic_vector(1 downto 0) is cp0regs(12)(4 downto 3);
    alias EXL : std_logic is cp0regs(12)(1);
    alias IE : std_logic is cp0regs(12)(0);
    
    -- Cause
    alias IP : std_logic_vector(7 downto 0) is cp0regs(13)(15 downto 8);
    alias ExcCode : std_logic_vector(4 downto 0) is cp0regs(13)(6 downto 2);
    
    -- EBase
    alias ExcBase : std_logic_vector(17 downto 0) is cp0regs(15)(29 downto 12);
    
    -- EntryHi
    alias VPN2 : std_logic_vector(18 downto 0) is cp0regs(10)(31 downto 13);

    procedure print_state(
      state: in StateType;
      signal seg7_l_num: out Int4) is
    begin
      case state is
        when HALT =>
          seg7_l_num <= std_logic_vector(to_signed(0, 4));
        when IF_0 =>
          seg7_l_num <= std_logic_vector(to_signed(1, 4));
        when IF_1 =>
          seg7_l_num <= std_logic_vector(to_signed(2, 4));
        when ID_0 =>
          seg7_l_num <= std_logic_vector(to_signed(3, 4));
        when EX_0 =>
          seg7_l_num <= std_logic_vector(to_signed(4, 4));
        when MEM_0 =>
          seg7_l_num <= std_logic_vector(to_signed(5, 4));
        when MEM_1 =>
          seg7_l_num <= std_logic_vector(to_signed(6, 4));
        when WB_0 =>
          seg7_l_num <= std_logic_vector(to_signed(7, 4));
        when others =>
          seg7_l_num <= std_logic_vector(to_signed(15, 4));
      end case;
    end;
    
    procedure halt is
    begin
      if debug then
        write(L, string'("halt"));
        writeline(output, L);
      end if;
      --sim: finish(0);
    end procedure;

    procedure exception is
    begin
      EXL   := '1';
      EPC   := pc;
      npc   := add("10" & ExcBase & "000000000000", 16#180#);
      if debug then
        write(L, string'("Exception (ExcCode:"));
        write(L, to_integer(unsigned(ExcCode)));
        write(L, string'(")"));
        writeline(output, L);
      end if;
      state := IF_0;
    end procedure;    
    
    procedure instr_invalid is
    begin
      if debug then
        write(L, string'("Invalid Instruction"));
        writeline(output, L);
      end if;

      if EXL = '0' then
        ExcCode := ExcRI;
        exception;
      else
--        halt;
      end if;
      state := IF_0;
    end procedure;

    procedure fetch_debug(
      pc : Int32) is    
    begin
      if debug then
        write(L, string'("fetch instr @ "));
        write(L, to_hex_string(pc));
        write(L, string'(" ("));
        write(L, to_bitvector(pc));
        write(L, string'(")"));
        writeline(output, L);
      end if;
    end procedure;

    procedure decode_debug is
    begin
      if debug then
        case op is
          when op_special =>
            write(L, to_bitvector(op));
            write(L, string'(" | "));
            write(L, to_bitvector(rs));
            write(L, string'(" | "));
            write(L, to_bitvector(rt));
            write(L, string'(" | "));
            write(L, to_bitvector(rd));
            write(L, string'(" | "));
            write(L, to_bitvector(sa));
            write(L, string'(" | "));
            write(L, to_bitvector(func));
            writeline(output, L);
            write(L, opcode_names(to_integer(unsigned(op))));
            write(L, string'("  "));
            write(L, string'("rs:"));
            write(L, to_integer(unsigned(rs)), right, 2);
            write(L, string'("   "));
            write(L, string'("rt:"));
            write(L, to_integer(unsigned(rt)), right, 2);
            write(L, string'("   "));
            write(L, string'("rd:"));
            write(L, to_integer(unsigned(rd)), right, 2);
            write(L, string'("   "));
            write(L, string'("sa:"));
            write(L, to_integer(unsigned(sa)), right, 2);
            write(L, string'("   "));
            write(L, sp_func_names(to_integer(unsigned(func))));
            writeline(output, L);
          when op_regimm =>
            write(L, to_bitvector(op));
            write(L, string'(" | "));
            write(L, to_bitvector(rs));
            write(L, string'(" | "));
            write(L, to_bitvector(rt));
            write(L, string'(" | "));
            write(L, to_bitvector(imm));
            writeline(output, L);
            write(L, opcode_names(to_integer(unsigned(op))));
            write(L, string'("  "));
            write(L, string'("rs:"));
            write(L, to_integer(unsigned(rs)), right, 2);
            write(L, string'("   "));
            write(L, ri_rt_names(to_integer(unsigned(rt))));
            write(L, string'("    "));
            write(L, string'("imm:"));
            write(L, to_hex_string(imm));
            writeline(output, L);
          when op_j | op_jal =>
            write(L, to_bitvector(op));
            write(L, string'(" | "));
            write(L, to_bitvector(instr_index));
            writeline(output, L);
            write(L, opcode_names(to_integer(unsigned(op))));
            write(L, string'("  "));
            write(L, string'("instr_index:"));
            write(L, to_hex_string(instr_index));
            writeline(output, L);
          when op_cop0 =>
            if rs = rs_mtc0 or rs = rs_mfc0 then
              write(L, to_bitvector(op));
              write(L, string'(" | "));
              write(L, to_bitvector(rs));
              write(L, string'(" | "));
              write(L, to_bitvector(rt));
              write(L, string'(" | "));
              write(L, to_bitvector(rd));
              write(L, string'(" | "));
              write(L, to_bitvector(instr(10 downto 3)));
              write(L, string'(" | "));
              write(L, to_bitvector(instr(2 downto 0)));
              writeline(output, L);
              write(L, opcode_names(to_integer(unsigned(op))));
              write(L, string'("  "));
              if rs = rs_mtc0 then
                write(L, string'("mtc0 "));
              else
                write(L, string'("mfc0 "));
              end if;
              write(L, string'("   "));
              write(L, string'("rt:"));
              write(L, to_integer(unsigned(rt)), right, 2);
              write(L, string'("   "));
              write(L, cp0regs_names(cp0reg_num));
              writeline(output, L);
            elsif rs = rs_co then
              write(L, to_bitvector(op));
              write(L, string'(" | "));
              write(L, to_bit(instr(25)));
              write(L, string'(" | "));
              write(L, to_bitvector(instr(24 downto 6)));
              write(L, string'(" | "));
              write(L, to_bitvector(func));
              writeline(output, L);
              write(L, opcode_names(to_integer(unsigned(op))));
              write(L, string'(" CO   "));
              write(L, string'("0"), right, 19);
              write(L, string'("   "));
              if func = func_eret then
                write(L, string'("ERET"));
              elsif func = func_tlbwi then
                write(L, string'("TLBWI"));
              end if;
              writeline(output, L);              
            end if;
          when others =>
            write(L, to_bitvector(op));
            write(L, string'(" | "));
            write(L, to_bitvector(rs));
            write(L, string'(" | "));
            write(L, to_bitvector(rt));
            write(L, string'(" | "));
            write(L, to_bitvector(imm));
            writeline(output, L);
            write(L, opcode_names(to_integer(unsigned(op))));
            write(L, string'("  "));
            write(L, string'("rs:"));
            write(L, to_integer(unsigned(rs)), right, 2);
            write(L, string'("   "));
            write(L, string'("rt:"));
            write(L, to_integer(unsigned(rt)), right, 2);
            write(L, string'("   "));
            write(L, string'("imm:"));
            write(L, to_hex_string(imm));
            writeline(output, L);
        end case;
        
      end if;
    end procedure;
    
    procedure alu_debug(
      alu_a, alu_b, alu_r : std_logic_vector(31 downto 0)) is
    begin
      if debug then
        write(L, string'("alu_a <= "));
        write(L, to_hex_string(alu_a));
        write(L, string'(" ("));
        write(L, to_bitvector(alu_a));
        write(L, string'(")"));
        writeline(output, L);
        write(L, string'("alu_b <= "));
        write(L, to_hex_string(alu_b));
        write(L, string'(" ("));
        write(L, to_bitvector(alu_b));
        write(L, string'(")"));
        writeline(output, L);
        write(L, string'("alu_r :  "));
        write(L, to_hex_string(alu_r));
        write(L, string'(" ("));
        write(L, to_bitvector(alu_r));
        write(L, string'(")"));
        writeline(output, L);
      end if;
    end procedure;
    
    procedure alu_debug(
      alu_a, alu_b, alu_r, alu_rext : std_logic_vector(31 downto 0)) is
    begin
      if debug then
        alu_debug(alu_a, alu_b, alu_r);
        write(L, string'("alu_re:  "));
        write(L, to_hex_string(alu_rext));
        write(L, string'(" ("));
        write(L, to_bitvector(alu_rext));
        write(L, string'(")"));
        writeline(output, L);
      end if;
    end procedure;
    
    procedure reg_debug(
      rw   : RwType;
      reg  : std_logic_vector(4 downto 0);
      data : std_logic_vector(31 downto 0)) is
    begin
      if debug then
        write(L, string'("R["));
        write(L, to_integer(unsigned(reg)), right, 2);
        if rw = R then
          write(L, string'("] :  "));
        else
          write(L, string'("] <= "));
        end if;
        write(L, to_hex_string(data));
        write(L, string'(" ("));
        write(L, to_bitvector(data));
        write(L, string'(")"));
        writeline(output, L);
      end if;
    end procedure;
    
    procedure hilo_debug(
      rw   : RwType;
      hilo : string;
      data : std_logic_vector(31 downto 0)) is
    begin
      if debug then
        write(L, string'("R["));
        write(L, hilo);
        if rw = R then
          write(L, string'("] :  "));
        else
          write(L, string'("] <= "));
        end if;
        write(L, to_hex_string(data));
        write(L, string'(" ("));
        write(L, to_bitvector(data));
        write(L, string'(")"));
        writeline(output, L);
      end if;
    end procedure;
    
    procedure cp0_debug(
      rw      : RwType;
      reg_num : integer range 0 to 31;
      data    : std_logic_vector(31 downto 0)) is
    begin
      if debug then
        write(L, string'("R["));
        write(L, cp0regs_names(reg_num));
        if rw = R then
          write(L, string'("] :  "));
        else
          write(L, string'("] <= "));
        end if;
        write(L, to_hex_string(data));
        write(L, string'(" ("));
        write(L, to_bitvector(data));
        write(L, string'(")"));
        writeline(output, L);
      end if;
    end procedure;
    
    procedure mmu_debug(
      addr_virt : std_logic_vector(31 downto 0);
      addr_phys : std_logic_vector(31 downto 0)) is
    begin
      if debug then
        write(L, string'("MMU["));
        write(L, to_hex_string(addr_virt));
        write(L, string'("] :  "));
        write(L, to_hex_string(addr_phys));
        writeline(output, L);
      end if;
    end procedure;

    function sign_extend(data_in : std_logic_vector) return Int32 is
    begin
      return (std_logic_vector(resize(signed(data_in), 32)));
    end function;

    procedure newline is
    begin
      if debug then
        writeline(output, L);
      end if;
    end procedure;
    
    procedure write_reg(
      reg  : std_logic_vector(4 downto 0);
      data : std_logic_vector(31 downto 0)) is
    begin
      reg_rw     <= W;
      reg_wrReg  <= reg;
      reg_wrData <= data;
      reg_debug(W, reg, data);
    end procedure;
    
    procedure bad_addr (
      rw   : RwType;
      addr : std_logic_vector(31 downto 0)) is
    begin
      if debug then
        write(L, string'("Bad Address"));
        writeline(output, L);
      end if;
      mem_en <= '1';
      if EXL = '0' then
        if rw = R then
          ExcCode := ExcAdEL;
        else
          ExcCode := ExcAdES;
        end if;
        BadVAddr := addr;
        exception;
      else
--        halt;
      end if;
      state := IF_0;
    end procedure;
    
    procedure tlb_refill(
      rw   : RwType;
      addr : std_logic_vector (31 downto 0)) is
    begin
      mem_en <= '1';
      if EXL = '0' then
        if rw = R then
          ExcCode := ExcTLBL;
        else
          ExcCode := ExcTLBS;
        end if;
        BadVAddr := addr;
        VPN2 := addr(31 downto 13);
        exception;
      else
--        halt;
      end if;
      state := IF_0;
    end procedure;    
    
    procedure gettlb(
      rw   : RwType;
      addr : std_logic_vector (31 downto 0)) is
      variable found : boolean;
      variable   pos : integer;
    begin
      found := false;
      for i in 0 to 15 loop
        if addr(31 downto 13) = tlb(i)(62 downto 44) then
          found := true;
          pos := i;
          exit;
        end if;
      end loop;

      if found then
        if addr(12) = '0' and tlb(pos)(0) = '1' then
          mem_addr <= tlb(pos)(21 downto 2) & addr(11 downto 0);
        elsif addr(12) = '1' and tlb(pos)(22) = '1' then
          mem_addr <= tlb(pos)(43 downto 24) & addr(11 downto 0);
        else
          found := false;
        end if;
      end if;
      
      if not found then
        tlb_refill(rw, addr);
      end if;
    end procedure;
    
    procedure conv_mem_addr(
      rw   : RwType;
      len  : LenType;
      addr : std_logic_vector (31 downto 0)) is
    begin
      if addr(1 downto 0) = "00" or len = Lbyte or
        (addr(0) = '0' and len = Lhalf) then
        mem_rw     <= rw;
        mem_length <= len;
        case addr(31 downto 28) is
          when x"8" | x"9" | x"A" | x"B" =>
            if KSU = "00" or EXL = '1' then
              mmu_debug(addr, "000" & addr(28 downto 0));
              mem_addr <= "000" & addr(28 downto 0);
            else
              bad_addr(rw, addr); -- no right
            end if;
          when x"0" | x"1" | x"2" | x"3" |
               x"4" | x"5" | x"6" | x"7" =>
            gettlb(rw, addr);
          when x"C" | x"D" | x"E" | x"F" =>
            if KSU = "00" or EXL = '1' then
              gettlb(rw, addr);
            else
              bad_addr(rw, addr); -- no right
            end if;
          when others =>
            bad_addr(rw, addr); -- wrong address       
        end case;
      else
        bad_addr(rw, addr); -- wrong alignment
      end if;
    end procedure;
    
  begin
    if rst = '0' then
      --reset
      if debug then
        write(L, string'("booting"));
        writeline(output, L);
      end if;

      mem_en <= '1';
      mem_rw <= R;
      reg_rw <= R;
      
      hi := Int32_Zero;
      lo := Int32_Zero;
      for i in 0 to 31 loop
        cp0regs(i) := Int32_Zero;
      end loop;
      for i in 0 to 15 loop
        tlb(i) := Int32_Zero & Int31_Zero;
      end loop;
      
      -- setting initial values for cop0 regs
      SR(31 downto 28) := "0001";
      EBase(31 downto 30) := "10";
      KSU := "00";
      IE := '0';
      EXL := '1';
      Count := Int32_Zero;

      npc   := start_addr;
      state := IF_0;
      
    elsif rising_edge(clk) then
      print_state(state, seg7_l_num); -- Debug --
      if addr_sw = '0' then
        led <= pc(15 downto 0);
      else
        led <= pc(31 downto 16);
      end if;

      -- fresh interupt bit
      Count := add(Count, 1);
      if Count = Compare then
        IP(7) := '1';
      end if;
      IP(4) := int_com;     
            
      case state is
        when HALT =>
          -- do nothing
        when IF_0 =>
          newline;
        
          -- finish writing to register
          reg_rw     <= R;
          -- renew pc
          pc         := npc;
          npc        := add(pc, 4);
          
          -- throw exception if interupted
          if IE = '1' and EXL = '0' and ( (IP and IM) /= Int8_Zero) then
            ExcCode := ExcInt;
            exception;
          else                   
            -- prepare to fetch an instruction
            fetch_debug(pc);
            mem_en     <= '0';
            state := IF_1;
            conv_mem_addr(R, Lword, pc);
          end if;
        when IF_1 =>
          -- wait until fetching complete
          if mem_completed = '1' then
            -- instruction fetched
            mem_en <= '1';
            instr  := mem_data_out;
            state  := ID_0;
          end if;
        when others =>
          if state = ID_0 then
            cp0reg_num := to_integer(unsigned(rd));
            decode_debug;
            alu_op   <= op;
            alu_func <= func;
            alu_rt   <= rt;
          end if;
          -- ID_0, EX_0, MEM_0, MEM_1, WB_0 for each instruction
          case op is
            when op_special =>
              case func is
                when func_syscall =>
                  if EXL = '0' then
                    ExcCode := ExcSyscall;
                    exception;
                  end if;
                  state := ID_0;
                when func_break =>
                  halt;
                  state := HALT;
                when func_jr | func_jalr =>
                  case state is
                    when ID_0 =>
                      reg_rdReg1 <= rs;
                      state      := WB_0;
                    when WB_0 =>
                      reg_debug(R, reg_rdReg1, reg_rdData1);
                      npc := reg_rdData1;
                      if func = func_jalr then
                        write_reg(rd, add(pc, 8));
                      end if;
                      state := IF_0;
                    when others =>
                      -- impossible
                  end case;
                when func_mfhi =>
                  hilo_debug(R, "hi", hi);
                  write_reg(rd, hi);
                  state := IF_0;
                when func_mflo =>
                  hilo_debug(R, "lo", lo);
                  write_reg(rd, lo);
                  state := IF_0;
                when func_mthi | func_mtlo =>
                  case state is
                    when ID_0 =>
                      reg_rdReg1 <= rs;
                      state      := WB_0;
                    when WB_0 =>
                      reg_debug(R, reg_rdReg1, reg_rdData1);
                      if func = func_mthi then
                        hi := reg_rdData1;
                        hilo_debug(W, "hi", hi);
                      else
                        lo := reg_rdData1;
                        hilo_debug(W, "lo", lo);
                      end if;
                      state := IF_0;
                    when others =>
                      -- impossible
                  end case;
                when func_sll | func_srl | func_sra |
                  func_sllv | func_srlv | func_srav |
                  func_addu | func_subu |
                  func_mult | func_multu |
                  func_and | func_or | func_xor | func_nor |
                  func_slt | func_sltu =>
                  case state is
                    when ID_0 =>
                      reg_rdReg1 <= rs;
                      reg_rdReg2 <= rt;
                      state      := EX_0;
                    when EX_0 =>
                      if func /= func_sll and
                        func /= func_srl and
                        func /= func_sra then
                        reg_debug(R, reg_rdReg1, reg_rdData1);
                      end if;
                      reg_debug(R, reg_rdReg2, reg_rdData2);
                      if func = func_sll or func = func_srl or func = func_sra then
                        alu_a <= Int24_Zero & "000" & sa;
                      else
                        alu_a <= reg_rdData1;
                      end if;
                      alu_b <= reg_rdData2;
                      state := WB_0;
                    when WB_0 =>
                      if func = func_mult or func = func_multu then
                        alu_debug(alu_a, alu_b, alu_r, alu_rext);
                        hi := alu_rext;
                        lo := alu_r;
                        hilo_debug(W, "hi", hi);
                        hilo_debug(W, "lo", lo);
                      else
                        alu_debug(alu_a, alu_b, alu_r);
                        write_reg(rd, alu_r);
                      end if;
                      state := IF_0;
                    when others =>
                      -- impossible;
                  end case;
                when others =>
                  instr_invalid;
              end case;
            when op_regimm | op_beq | op_bne | op_blez | op_bgtz =>
              case state is
                when ID_0 =>
                  if op = op_regimm and rt /= rt_bltz and rt /= rt_bgez then
                    instr_invalid;
                  end if;
                  reg_rdReg1 <= rs;
                  reg_rdReg2 <= rt;
                  state      := EX_0;
                when EX_0 =>
                  reg_debug(R, reg_rdReg1, reg_rdData1);
                  if op = op_beq or op = op_bne then
                    reg_debug(R, reg_rdReg2, reg_rdData2);
                  end if;
                  alu_a <= reg_rdData1;
                  alu_b <= reg_rdData2;
                  state := WB_0;
                when WB_0 =>
                  if alu_r(0) = '1' then
                    npc := std_logic_vector(resize((signed(imm) sll 2), 32));
                    npc := add(pc, npc, 4);
                  end if;
                  state := IF_0;
                when others =>
                  -- impossible
              end case;
            when op_j | op_jal =>
              case state is
                when ID_0 =>
                  npc := npc(31 downto 28) & instr_index & "00";
                  if op = op_j then
                    state := IF_0;
                  else
                    state := WB_0;
                  end if;
                when WB_0 =>
                  write_reg("11111", add(pc, 8));
                  state := IF_0;
                when others =>
                  -- impossible
              end case;
            when op_addiu | op_slti | op_sltiu | op_andi | op_ori | op_xori =>
              case state is
                when ID_0 =>
                  reg_rdReg1 <= rs;
                  state      := EX_0;
                when EX_0 =>
                  reg_debug(R, reg_rdReg1, reg_rdData1);
                  alu_a <= reg_rdData1;
                  if op = op_andi or op = op_ori or op = op_xori then
                    alu_b <= Int16_Zero & imm;
                  else
                    alu_b <= sign_extend(imm);
                  end if;
                  state := WB_0;
                when WB_0 =>
                  alu_debug(alu_a, alu_b, alu_r);
                  write_reg(rt, alu_r);
                  state := IF_0;
                when others =>
                  -- impossible
              end case;
            when op_lui =>
              write_reg(rt, imm & Int16_Zero);
              state := IF_0;
            when op_cop0 =>
              case rs is
                when rs_mfc0 =>
                  cp0_debug(R, cp0reg_num, cp0regs(cp0reg_num));
                  write_reg(rt, cp0regs(cp0reg_num));
                  state := IF_0;
                when rs_mtc0 =>
                  case state is
                    when ID_0 =>
                      reg_rdReg2 <= rt;
                      state      := WB_0;
                    when WB_0 =>
                      reg_debug(R, reg_rdReg2, reg_rdData2);
                      cp0regs(cp0reg_num) := reg_rdData2;
                      cp0_debug(W, cp0reg_num, cp0regs(cp0reg_num));
                      if cp0reg_num = 11 then
                        -- write to Compare, clear interupt 7
                        IP(7) := '0';
                      elsif cp0reg_num = 15 then
                        EBase(31 downto 30) := "10";
                      elsif cp0reg_num = 12 then
                        SR(31 downto 28) := "0001";
                      end if;
                      state := IF_0;
                    when others =>
                      -- impossible
                  end case;
                when rs_co =>
                  if func = func_tlbwi then
                    idx   := to_integer(unsigned(Index(3 downto 0)));
                    tlb(idx)(62 downto 44) := VPN2;
                    tlb(idx)(43 downto 24) := EntryLo1(25 downto 6);
                    tlb(idx)(23 downto 22) := EntryLo1(2 downto 1);
                    tlb(idx)(21 downto 2) := EntryLo0(25 downto 6);
                    tlb(idx)(1 downto 0) := EntryLo0(2 downto 1);
                    state := IF_0;
                  elsif func = func_eret then
                    EXL   := '0';
                    npc   := EPC;
                    if debug then
                      write(L, string'("Exception Return"));
                      writeline(output, L);
                    end if;
                    state := IF_0;
                  else
                    instr_invalid;
                  end if;
                when others =>
                  instr_invalid;
              end case;
            when op_lb | op_lh | op_lw | op_lbu | op_lhu =>
              case state is
                when ID_0 =>
                  reg_rdReg1 <= rs;
                  state      := EX_0;
                when EX_0 =>
                  reg_debug(R, reg_rdReg1, reg_rdData1);
                  alu_a <= reg_rdData1;
                  alu_b <= sign_extend(imm);
                  state := MEM_0;
                when MEM_0 =>
                  alu_debug(alu_a, alu_b, alu_r);
                  mem_en   <= '0';
                  state := MEM_1;
                  if op = op_lw then
                    conv_mem_addr(R, Lword, alu_r);
                  elsif op = op_lh or op = op_lhu then
                    conv_mem_addr(R, Lhalf, alu_r);
                  else
                    conv_mem_addr(R, Lbyte, alu_r);
                  end if;
                when MEM_1 =>
                  -- wait until loading complete
                  if mem_completed = '1' then
                    mem_en <= '1';
                    state  := WB_0;
                  end if;
                when WB_0 =>
                  if op = op_lb then
                    write_reg(rt, sign_extend(mem_data_out(7 downto 0)));
                  elsif op = op_lh then
                    write_reg(rt, sign_extend(mem_data_out(15 downto 0)));
                  else
                    write_reg(rt, mem_data_out);
                  end if;
                  state := IF_0;
                when others =>
                  -- impossible
              end case;
            when op_sb | op_sh | op_sw =>
              case state is
                when ID_0 =>
                  reg_rdReg1 <= rs;
                  reg_rdReg2 <= rt;
                  state      := EX_0;
                when EX_0 =>
                  reg_debug(R, reg_rdReg1, reg_rdData1);
                  reg_debug(R, reg_rdReg2, reg_rdData2);
                  alu_a <= reg_rdData1;
                  alu_b <= sign_extend(imm);
                  state := MEM_0;
                when MEM_0 =>
                  alu_debug(alu_a, alu_b, alu_r);
                  mem_en      <= '0';
                  mem_data_in <= reg_rdData2;
                  state := MEM_1;
                  if op = op_sw then
                    conv_mem_addr(W, Lword, alu_r); 
                  elsif op = op_sh then
                    conv_mem_addr(W, Lhalf, alu_r); 
                  else
                    conv_mem_addr(W, Lbyte, alu_r); 
                  end if;
                when MEM_1 =>
                  -- wait until storing complete
                  if mem_completed = '1' then
                    mem_en <= '1';
                    mem_rw <= R;
                    state  := IF_0;
                  end if;
                when others =>
                  -- impossible
              end case;
            when op_cache =>
              -- NOP
              state := IF_0;
            when others =>
              instr_invalid;
          end case;
      end case;
            
    end if;
  end process;
  
end Behavioral;
