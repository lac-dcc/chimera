----------------------------------------------------------------------------
----------------------------------------------------------------------------
--  The Free IP Project
--  VHDL 6502 Core
--  (c) 1999, The Free IP Project and David Kessner
--
--
--  FREE IP GENERAL PUBLIC LICENSE
--  TERMS AND CONDITIONS FOR USE, COPYING, DISTRIBUTION, AND MODIFICATION
--
--  1.  You may copy and distribute verbatim copies of this core, as long
--      as this file, and the other associated files, remain intact and
--      unmodified.  Modifications are outlined below.  Also, see the
--      import/export warning above for further restrictions on
--      distribution.
--  2.  You may use this core in any way, be it academic, commercial, or
--      military.  Modified or not.  
--  3.  Distribution of this core must be free of charge.  Charging is
--      allowed only for value added services.  Value added services
--      would include copying fees, modifications, customizations, and
--      inclusion in other products.
--  4.  If a modified source code is distributed, the original unmodified
--      source code must also be included (or a link to the Free IP web
--      site).  In the modified source code there must be clear
--      identification of the modified version.
--  5.  Visit the Free IP web site for additional information.
--      http://www.free-ip.com
--
----------------------------------------------------------------------------
----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library work;

package free_6502 is
  component core_6502
    port (clk	 	:in std_logic;
          reset	 	:in std_logic;
          irq_in	:in std_logic;
          nmi_in	:in std_logic;
          addr_pin 	:out std_logic_vector (15 downto 0);
          din	 	:in  std_logic_vector (7 downto 0);
          dout	 	:out std_logic_vector (7 downto 0);
          dout_oe  	:out std_logic;
          we_pin	:out std_logic;
          rd_pin	:out std_logic;
          sync	 	:out std_logic
         );
  end component;

  component core_6502_debug
    port (clk	 	:in std_logic;
          reset	 	:in std_logic;
          irq_in	:in std_logic;
          nmi_in	:in std_logic;
          addr_pin 	:out std_logic_vector (15 downto 0);
          din	 	:in  std_logic_vector (7 downto 0);
          dout	 	:out std_logic_vector (7 downto 0);
          dout_oe  	:out std_logic;
          we_pin	:out std_logic;
          rd_pin	:out std_logic;
          sync	 	:out std_logic;
          stack_page	:in  std_logic_vector (7 downto 0);
          reg_a_out	:out std_logic_vector (7 downto 0);
          reg_x_out	:out std_logic_vector (7 downto 0);
          reg_y_out	:out std_logic_vector (7 downto 0);
          reg_sr_out	:out std_logic_vector (7 downto 0);
          reg_sp_out	:out std_logic_vector (7 downto 0);
          reg_pc_out	:out std_logic_vector (15 downto 0)
         );
  end component;
end free_6502;

----------------------------------------------------------------------------
----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library work;
use work.microcode.all;
use work.free_6502.all;


entity core_6502_debug is
  port (clk	 :in std_logic;
        reset	 :in std_logic;
        irq_in	 :in std_logic;
        nmi_in	 :in std_logic;
        addr_pin :out std_logic_vector (15 downto 0);
        din	 :in  std_logic_vector (7 downto 0);
        dout	 :out std_logic_vector (7 downto 0);
        dout_oe  :out std_logic;
        we_pin	 :out std_logic;
        rd_pin	 :out std_logic;
        sync	 :out std_logic;
        stack_page	:in  std_logic_vector (7 downto 0);
        reg_a_out	:out std_logic_vector (7 downto 0);
        reg_x_out	:out std_logic_vector (7 downto 0);
        reg_y_out	:out std_logic_vector (7 downto 0);
        reg_sr_out	:out std_logic_vector (7 downto 0);
        reg_sp_out	:out std_logic_vector (7 downto 0);
        reg_pc_out	:out std_logic_vector (15 downto 0)
       );
end core_6502_debug;


architecture core_6502_arch_debug of core_6502_debug is
  -- Constants
  constant reset_opcode :std_logic_vector (7 downto 0) := "00000011";
  constant irq_opcode   :std_logic_vector (7 downto 0) := "01000011";
  constant nmi_opcode   :std_logic_vector (7 downto 0) := "00110011";
  constant vect_nmi1    :std_logic_vector (15 downto 0) := "1111111111111010";
  constant vect_nmi2    :std_logic_vector (15 downto 0) := "1111111111111011";
  constant vect_reset1  :std_logic_vector (15 downto 0) := "1111111111111100";
  constant vect_reset2  :std_logic_vector (15 downto 0) := "1111111111111101";
  constant vect_irq1    :std_logic_vector (15 downto 0) := "1111111111111110";
  constant vect_irq2    :std_logic_vector (15 downto 0) := "1111111111111111";

  -- Internal state info
  type STATES is (RESET1, RESET2, FETCH, START_IRQ, START_NMI, RUN);
  signal state :STATES;
  signal step  :std_logic_vector (2 downto 0);

  -- registered inputs
  signal nmi_reg1	:std_logic;
  signal nmi_reg2	:std_logic;
  signal irq_reg	:std_logic;
  signal data_in	:std_logic_vector (7 downto 0);

  -- Microcode ROM outputs
  signal done		:MCT_DONE;
  signal addr_op	:MCT_ADDR_OP;
  signal din_le		:MCT_DIN_LE;
  signal rd_en      	:MCT_RD_EN;
  signal dout_op	:MCT_DOUT_OP;
  signal dint1_op	:MCT_DINT1_OP;
  signal dint2_op	:MCT_DINT2_OP;
  signal dint3_op	:MCT_DINT3_OP;
  signal pc_op		:MCT_PC_OP;
  signal sp_op		:MCT_SP_OP;
  signal alu1		:MCT_ALU1;
  signal alu2		:MCT_ALU2;
  signal alu_op		:MCT_ALU_OP;
  signal a_le		:MCT_A_LE;
  signal x_le		:MCT_X_LE;
  signal y_le		:MCT_Y_LE;
  signal flag_op	:MCT_FLAG_OP;

  -- Internal registers
  signal a_reg		:std_logic_vector (7 downto 0);
  signal x_reg		:std_logic_vector (7 downto 0);
  signal y_reg		:std_logic_vector (7 downto 0);
  signal dint1		:std_logic_vector (7 downto 0);
  signal dint2		:std_logic_vector (7 downto 0);
  signal dint3		:std_logic_vector (7 downto 0);
  signal opcode_reg	:std_logic_vector (7 downto 0);
  signal sp		:std_logic_vector (7 downto 0);
  signal pc		:std_logic_vector (15 downto 0);
  signal n_flag		:std_logic;
  signal v_flag		:std_logic;
  signal b_flag		:std_logic;
  signal d_flag		:std_logic;
  signal i_flag		:std_logic;
  signal z_flag		:std_logic;
  signal c_flag		:std_logic;

  -- Combinotorial signals
  signal opcode		:std_logic_vector (7 downto 0);
  signal alu_in1	:std_logic_vector (8 downto 0);
  signal alu_in2	:std_logic_vector (8 downto 0);
  signal alu_out	:std_logic_vector (8 downto 0);

  signal alu_add	:std_logic_vector (8 downto 0);
  signal alu_add_in2	:std_logic_vector (8 downto 0);
  signal alu_add_cin	:std_logic;
  
  signal addr_out_d     :std_logic_vector(15 downto 0);

  -- Misc signals
  signal first_run	:std_logic;
  signal fetch_d	:std_logic;
  signal data_out	:std_logic_vector (7 downto 0);
  signal data_oe	:std_logic;
  signal addr_out	:std_logic_vector (15 downto 0);
  signal we_out		:std_logic;
  signal nmi_event	:std_logic;

begin
  -- Debug outputs
  reg_a_out <= a_reg;
  reg_x_out <= x_reg;
  reg_y_out <= y_reg;
  reg_sr_out <= n_flag & v_flag & '1' & b_flag & d_flag
                & i_flag & z_flag & c_flag;
  reg_sp_out <= sp;
  reg_pc_out <= pc;


  -- The sync output
  process (clk, reset)
  begin
    if reset='1' then
      sync <= '0';
    elsif clk'event and clk='1' then
      case state is
        when RESET1 =>		sync <= '0';
        when RESET2 =>		sync <= '0';
        when FETCH =>		sync <= '0';
        when START_IRQ =>	sync <= '0';
        when START_NMI =>	sync <= '0';
        when RUN =>
            if done=MC_DONE then
              if nmi_event='1' then
                sync <= '0';
              elsif i_flag='0' and irq_reg='1' then
                sync <= '0';
              else
                sync <= '1';
              end if;
            end if;
        when others =>  sync <= '0';	
      end case;
    end if;
  end process;
  

  -- The main state machine
  process (clk, reset)
  begin
    if reset='1' then
      state <= RESET1;
    elsif clk'event and clk='1' then
      case state is
        when RESET1 =>		state <= RESET2;
        when RESET2 =>		state <= RUN;
        when FETCH =>		state <= RUN;
        when START_IRQ =>	state <= RUN;
        when START_NMI =>	state <= RUN;
        when RUN =>
            if done=MC_DONE then
              if nmi_event='1' then
                state <= START_NMI;
              elsif i_flag='0' and irq_reg='1' then
                state <= START_IRQ;
              else
                state <= FETCH;
              end if;
            end if;
        when others =>  	state <= RESET1;
      end case;
    end if;
  end process;


  -- The microcode step counter
  process (clk, reset)
  begin
    if reset='1' then
      step<="000";
    elsif clk'event and clk='1' then
      case state is
        when RESET1 =>          step <= "000";
        when RESET2 =>          step <= "000";
        when FETCH =>           step <= "000";
        when START_IRQ =>       step <= "000";
        when START_NMI =>       step <= "000";
        when RUN =>             step <= step + 1;
        when others =>          step <= step + 1;
      end case;
    end if;
  end process;


  -- The input registers
  process (clk, reset)
  begin
    if reset='1' then
      data_in <= "00000000";
    elsif clk'event and clk='1' then
      if din_le=MC_EN or state=FETCH then
        data_in <= din;
      end if;
    end if;
  end process;

  process (clk, reset)
  begin
    if reset='1' then
      irq_reg <= '0';
    elsif clk'event and clk='1' then
      irq_reg <= irq_in;
    end if;
  end process;

  process (clk, reset)
  begin
    if reset='1' then
      nmi_reg1 <= '0';
      nmi_reg2 <= '0';
    elsif clk'event and clk='1' then
      nmi_reg1 <= nmi_in;
      nmi_reg2 <= nmi_reg1;
    end if;
  end process;

  -- The NMI __RISING_EDGE__ detect
  process (clk, reset)
  begin
    if reset='1' then
      nmi_event <= '0';
    elsif clk'event and clk='1' then
      if nmi_reg1='1' and nmi_reg2='0' then
        nmi_event <= '1';
      elsif state=START_NMI then
        nmi_event <= '0';
      end if;
    end if;
  end process;
      

  -- The first run signal.  Active on the first run clock
  process (clk, reset)
  begin
    if reset='1' then
      first_run <= '0';
    elsif clk'event and clk='1' then
      case state is
        when RESET2 =>          first_run <= '0';
        when FETCH =>           first_run <= '1';
        when START_IRQ =>       first_run <= '0'; -- was '1' -- bjs 09/05/99
        when START_NMI =>       first_run <= '0'; -- was '1' -- bjs 09/05/99
        when RUN =>             first_run <= '0';
        when others =>          first_run <= '0';
      end case;
    end if;
  end process;


  -- The fetch_d signal.  Active one clock after a fetch cycle
  process (clk, reset)
  begin
    if reset='1' then
      fetch_d <= '0';
    elsif clk'event and clk='1' then
      if state=FETCH then
        fetch_d <= '1';
      else
        fetch_d <= '0';
      end if;
    end if;
  end process;


  -- The opcode register and opcode decode logic
  process (clk, reset)
  begin
    if reset='1' then
      opcode_reg <= "00000000";
    elsif clk'event and clk='1' then
      case state is
        when RESET2 =>          opcode_reg <= reset_opcode;
        when START_IRQ =>       opcode_reg <= irq_opcode;
        when START_NMI =>       opcode_reg <= nmi_opcode;

        when RUN =>
            if first_run='1' then
              opcode_reg <=data_in;
            end if;

        when others =>
            --
      end case;
    end if;
  end process;

  opcode <= data_in when fetch_d='1' else opcode_reg;


  -- The Microcode ROM
  MC_ROM0:  mc_rom port map
        (opcode, step, done, addr_op, din_le, rd_en, dout_op,
         dint1_op, dint2_op, dint3_op, pc_op, sp_op, alu1, alu2,
         alu_op, a_le, x_le, y_le, flag_op);

  -- The program counter
  process (clk, reset)
    variable pc_add : std_logic_vector(15 downto 0);
    variable pc_inc : std_logic_vector(15 downto 0);
  begin
    if reset='1' then
      pc <= "0000000000000000";
    elsif clk'event and clk='1' then
      -- Sept 23, 1999 -- Fixed by David Kessner, reported by Bill Seiler
      -- was:  pc_add <= pc + data_in
      -- now:  pc_add <= pc + a sign extended version of data_in
      pc_add := pc +
                (data_in(7) & data_in(7) & data_in(7) & data_in(7) &
                 data_in(7) & data_in(7) & data_in(7) & data_in(7) &
                 data_in);
      pc_inc := pc + '1';
      if state=fetch then
        pc <= pc_inc;
      else
        case pc_op is
            when MC_NOP =>   -- Do nothing
            when MC_INC =>   pc <= pc_inc;
            when MC_BCC =>   if c_flag='0' then pc<=pc_add; end if;
            when MC_BCS =>   if c_flag='1' then pc<=pc_add; end if;
            when MC_BEQ =>   if z_flag='1' then pc<=pc_add; end if;
            when MC_BNE =>   if z_flag='0' then pc<=pc_add; end if;
            when MC_BMI =>   if n_flag='1' then pc<=pc_add; end if;
            when MC_BPL =>   if n_flag='0' then pc<=pc_add; end if;
            when MC_BVC =>   if v_flag='0' then pc<=pc_add; end if;
            when MC_BVS =>   if v_flag='1' then pc<=pc_add; end if;
            when MC_SPLIT => pc <= data_in & dint1;
            when others =>   -- Do nothing
        end case;
      end if;
    end if;
  end process;


  -- Data output logic
  process (clk, reset)
  begin
    if reset='1' then
      data_out <= "00000000";
      data_oe  <= '0';
      we_out   <= '0';
    elsif clk'event and clk='1' then
      case dout_op is
          when MC_NOP =>	data_oe <= '0';  we_out<='0';  data_out <= dint3;
          when MC_DINT3 =>	data_oe <= '1';  we_out<='1';  data_out <= dint3;
          when MC_PCH =>	data_oe <= '1';  we_out<='1';  data_out <= pc(15 downto 8);
          when MC_PCL =>	data_oe <= '1';  we_out<='1';  data_out <= pc (7 downto 0);
          when MC_P_REG =>	data_oe <= '1';  we_out<='1';
                                data_out <= n_flag & v_flag & '1' & b_flag &
                                            d_flag & i_flag & z_flag & c_flag;
          when MC_A_REG =>	data_oe <= '1';  we_out<='1';  data_out <= a_reg;
          when MC_X_REG =>	data_oe <= '1';  we_out<='1';  data_out <= x_reg;
          when MC_Y_REG =>	data_oe <= '1';  we_out<='1';  data_out <= y_reg;
          when others =>	data_oe <= '0';  we_out<='0';  data_out <= dint3;
      end case;
    end if;
  end process;

  dout <= data_out;
  dout_oe <= data_oe;
 
  we_pin <= we_out;


  -- Generate the rd_pin signals
  process (reset, clk)
  begin
    if reset='1' then
      rd_pin <= '0';
    elsif clk'event and clk='1' then
      case state is
        when RESET1 =>		rd_pin <= '0';
        when RESET2 =>		rd_pin <= '0';
        when FETCH =>		rd_pin <= '1';
        when START_IRQ =>	rd_pin <= '0';
        when START_NMI =>	rd_pin <= '0';
        when RUN =>
            if done=MC_DONE then
              if nmi_event='1' then
                rd_pin <= '0';
              elsif i_flag='0' and irq_reg='1' then
                rd_pin <= '0';
              else
                rd_pin <= '1';
              end if;
            elsif rd_en=MC_READ then
              rd_pin <= '1';
            else
              rd_pin <= '0';
            end if;
        when others =>  	rd_pin <= '0';
      end case;
    end if;
  end process;

  -----------------------------------------------------------------------------
  -- Revised address output block
  -------------------------------
  -- These revisons to the address output block are intended to improve
  -- synthesis results for both area and speed.  They intended to
  -- accomplish the following:
  -- - Make the use of a single adder very clear to the synthesis tool.
  -- - Move all decoding and muxing in front of the adder.  This allows
  --   the synthesis more flexibility in optimizing an balancing propagation
  --   paths.
  -- Ed Beers (sreeb@beers.nu) 9/14/99
  -----------------------------------------------------------------------------
  
  -- The address output logic
  process (clk, reset)
    variable addr_add_1     :std_logic_vector(15 downto 0);
    variable addr_add_2     :std_logic_vector(7 downto 0);
    variable addr_add_cin   :std_logic;

    variable addr_out_low   :std_logic_vector (8 downto 0);
    variable addr_out_high  :std_logic_vector (7 downto 0);
    variable eight_bit_flag :std_logic;
  begin
    if reset='1' then
      addr_out <= (others=>'0');
    elsif clk'event and clk='1' then 

      -- default for adder
      addr_add_2 := (others=>'0');
      addr_add_cin := '0';
      eight_bit_flag := '0';
      
      if done=MC_DONE then
        --addr_out <= pc;
        addr_add_1 := pc;
      elsif state=FETCH then
        --addr_out <= pc + 1;
        addr_add_1 := pc;
        addr_add_cin := '1';
      else      
        case addr_op is
          when MC_NOP =>
            --addr_out <= pc;
            addr_add_1 := pc;
          when MC_PC_P =>
            --addr_out <= pc + 1;
            addr_add_1 := pc;
            addr_add_cin := '1';
          when MC_SPLIT =>
            --addr_out <= data_in & dint1;
            addr_add_1 := data_in & dint1;
          when MC_SPLIT_P =>
            --addr_out <= (data_in & dint1) + 1;
            addr_add_1 := data_in & dint1;
            addr_add_cin := '1';
          when MC_SPLIT_X =>
            --addr_out <= (data_in & dint1) + x_reg;
            addr_add_1 := data_in & dint1;
            addr_add_2 := x_reg;
          when MC_SPLIT_Y =>
            --addr_out <= (data_in & dint1) + y_reg;
            addr_add_1 := data_in & dint1;
            addr_add_2 := y_reg;
          when MC_DIN_Z =>
            --addr_out <= ("00000000" & data_in);
            addr_add_1 := "00000000" & data_in;
          when MC_DIN_ZP =>
            --addr_out <= ("00000000" & data_in) + 1;
            addr_add_1 := "00000000" & data_in;
            addr_add_cin := '1';
          when MC_DIN_ZX =>
            --addr_out <= ("00000000" & data_in) + x_reg;
            addr_add_1 := "00000000" & data_in;
            addr_add_2 := x_reg;
            eight_bit_flag := '1';
          when MC_DIN_ZXP =>
            --addr_out <= ("00000000" & data_in) + x_reg + 1;
            addr_add_1 := "00000000" & data_in;
            addr_add_2 := x_reg;
            addr_add_cin := '1';
            eight_bit_flag := '1';
          when MC_DIN_ZY =>
            --addr_out <= ("00000000" & data_in) + y_reg;
            addr_add_1 := "00000000" & data_in;
            addr_add_2 :=  y_reg;
	    eight_bit_flag := '1';
          when MC_DINT16 =>
            --addr_out <= dint2 & dint1;
            addr_add_1 := dint2 & dint1;
          when MC_DINT16_X =>
            --addr_out <= dint2 & dint1 + x_reg;
            addr_add_1 := dint2 & dint1;
            addr_add_2 := x_reg;
          when MC_DINT1_Z =>
            --addr_out_d <= ("00000000" & dint1);
            addr_add_1 := ("00000000" & dint1);
          when MC_DINT1_ZX =>
            --addr_out <= ("00000000" & dint1) + x_reg;
            addr_add_1 := "00000000" & dint1;
            addr_add_2 := x_reg;
          when MC_SP =>
            --addr_out <= stack_page & sp;
            addr_add_1 := stack_page & sp;
          when MC_V_NMI1 =>
            --addr_out <= vect_nmi1;
            addr_add_1 := vect_nmi1;
          when MC_V_NMI2 =>
            --addr_out <= vect_nmi2;
            addr_add_1 := vect_nmi2;
          when MC_V_RESET1 =>
            --addr_out <= vect_reset1;
            addr_add_1 := vect_reset1;
          when MC_V_RESET2 =>
            --addr_out <= vect_reset2;
            addr_add_1 := vect_reset2;
          when MC_V_IRQ1 =>
            --addr_out <= vect_irq1;
            addr_add_1 := vect_irq1;
          when MC_V_IRQ2 =>
            --addr_out <= vect_irq2;
            addr_add_1 := vect_irq2;
          when others =>
            --addr_out <= pc;
            addr_add_1 := pc;
        end case;
      end if;

      --addr_out <= addr_add_1 + addr_add_2 + addr_add_cin;      
      addr_out_low  := ("0" & addr_add_1(7 downto 0)) + ("0" & addr_add_2) + addr_add_cin;
      addr_out_high := addr_add_1(15 downto 8) + (addr_out_low(8) and not eight_bit_flag);
      addr_out <= addr_out_high(7 downto 0) & addr_out_low (7 downto 0);

    end if;
  end process;

  addr_pin <= addr_out;


  -- The DINT registers
  process (clk, reset)
  begin
    if reset='1' then
      dint1 <= "00000000";
    elsif clk'event and clk='1' then
      if dint1_op=MC_DIN then
        dint1 <= data_in;
      end if;
    end if;
  end process;

  process (clk, reset)
  begin
    if reset='1' then
      dint2 <= "00000000";
    elsif clk'event and clk='1' then
      if dint2_op=MC_DIN then
        dint2 <= data_in;
      end if;
    end if;
  end process;

  process (clk, reset)
  begin
    if reset='1' then
      dint3 <= "00000000";
    elsif clk'event and clk='1' then
      if dint3_op=MC_ALU then
        dint3 <= alu_out (7 downto 0);
      end if;
    end if;
  end process;


  -- The stack pointer
  process (clk, reset)
  begin
    if reset='1' then
      sp <= "11111111";
    elsif clk'event and clk='1' then
      case sp_op is
          when MC_NOP =>	-- Do nothing
          when MC_PUSH =>	sp <= sp - 1;
          when MC_POP =>	sp <= sp + 1;
          when MC_X_REG =>      sp <= x_reg;
          when others =>	-- Do nothing
      end case;
    end if;
  end process;


  -- The registers
  process (clk, reset)
  begin
    if reset='1' then
      a_reg <= "00000000";
    elsif clk'event and clk='1' then
      if a_le=MC_LE then
        a_reg <= alu_out (7 downto 0);
      end if;
    end if;
  end process;

  process (clk, reset)
  begin
    if reset='1' then
      x_reg <= "00000000";
    elsif clk'event and clk='1' then
      if x_le=MC_LE then
        x_reg <= alu_out (7 downto 0);
      end if;
    end if;
  end process;

  process (clk, reset)
  begin
    if reset='1' then
      y_reg <= "00000000";
    elsif clk'event and clk='1' then
      if y_le=MC_LE then
        y_reg <= alu_out (7 downto 0);
      end if;
    end if;
  end process;


  -- The ALU input muxes
  process(a_reg, alu1, data_in, x_reg, y_reg)
  begin  -- process
    case alu1 is
      when MC_A_REG => alu_in1 <= ("0" & a_reg);
      when MC_x_REG => alu_in1 <= ("0"  & x_reg);
      when MC_Y_REG => alu_in1 <= ("0"  & y_reg);
      when others =>   alu_in1 <= ("0"  & data_in);
    end case;
  end process;

  process (alu2, data_in, sp)
  begin  -- process
    case alu2 is
      when MC_ONE =>    alu_in2 <= "000000001";
      when MC_SP_REG => alu_in2 <= ("0" & sp);
      when others =>    alu_in2 <= ("0" & data_in);
    end case;
  end process;

  -- The ALU adder
  alu_add <= alu_in1 + alu_add_in2 + alu_add_cin;  

  -- The ALU itself    This is purely combinatorial logic
  process (alu_add, alu_in1, alu_in2, alu_op, c_flag)
  begin
    -- default for alu_add inputs
    alu_add_in2 <= alu_in2;
    alu_add_cin <= c_flag;
      
    case alu_op is
      when MC_PASS1 =>  	alu_out <= alu_in1;
      when MC_PASS2 =>          alu_out <= alu_in2;
      when MC_ADD =>
        --alu_out <= alu_in1 + alu_in2;
        alu_add_in2 <= alu_in2;
        alu_add_cin <= '0';
        alu_out <= alu_add;
      when MC_ADDC =>
        --alu_out <= alu_in1 + alu_in2 + ("00000000" & c_flag);
        alu_add_in2 <= alu_in2;
        alu_add_cin <= c_flag;
        alu_out <= alu_add;
      when MC_SUB =>
        --alu_out <= alu_in1 - alu_in2;
        alu_add_in2 <= not alu_in2;
        alu_add_cin <= '1';
        alu_out <= (not alu_add(8)) & alu_add(7 downto 0);
      when MC_SUBB =>
        --alu_out <= alu_in1 - alu_in2 - ("00000000" & c_flag);
        alu_add_in2 <= not alu_in2;
        alu_add_cin <= c_flag;
        alu_out <= (not alu_add(8)) & alu_add(7 downto 0);
      when MC_BIT_AND =>        alu_out <= alu_in1 and alu_in2;
      when MC_BIT_OR =>         alu_out <= alu_in1 or  alu_in2;
      when MC_BIT_XOR =>        alu_out <= alu_in1 xor alu_in2;
      when MC_BIT_ASL =>        alu_out <= alu_in1(7 downto 0) & "0";
      when MC_BIT_LSR =>        alu_out <= alu_in1(0) & "0" & alu_in1(7 downto 1);
      when MC_BIT_ROL =>        alu_out <= alu_in1(7 downto 0) & c_flag;
      when MC_BIT_ROR =>        alu_out <= alu_in1(0) & c_flag & alu_in1(7 downto 1);
      when others =>            alu_out <= alu_in1;
    end case;
  end process;


  -- The flag stuff
  process (reset, clk)
  begin
    if reset='1' then
      n_flag <= '0';
    elsif clk'event and clk='1' then
      case flag_op is
        when MC_NOP =>		-- Do nothing
        when MC_NVZC =>		n_flag <= alu_out(7);
        when MC_NZ =>		n_flag <= alu_out(7);
        when MC_NZC =>          n_flag <= alu_out(7);
        when MC_BIT =>          n_flag <= alu_out(7);
        when MC_DIN =>          n_flag <= data_in(7);
        when others =>		-- Do nothing
      end case;
    end if;
  end process;

  process (reset, clk)
  begin
    if reset='1' then
      v_flag <= '0';
    elsif clk'event and clk='1' then
      case flag_op is
        when MC_NOP =>		-- Do nothing
        when MC_NVZC =>
             if alu_op=MC_ADD or alu_op=MC_ADDC then
               if alu_in1(7)=alu_in2(7) and alu_in1(7)/=alu_add(7) then
                 v_flag <= '1';
               else
                 v_flag <= '0';
               end if;
             elsif alu_op=MC_SUB or alu_op=MC_SUBB then
               if alu_in1(7)/=alu_in2(7) and alu_in1(7)/=alu_add(7)then
                 v_flag <= '1';
               else
                 v_flag <= '0';
               end if;
             end if;
        when MC_CLEARV =>       v_flag <= '0';
        when MC_DIN =>          v_flag <= data_in(6);
        when MC_BIT =>          v_flag <= data_in(6);
        when others =>		-- Do nothing
      end case;
    end if;
  end process;


  process (reset, clk)
  begin
    if reset='1' then
      b_flag <= '0';
    elsif clk'event and clk='1' then
      case flag_op is
        when MC_NOP =>		-- Do nothing
        when MC_SETB =>         b_flag <= '1';
        when MC_DIN =>          b_flag <= data_in(4);
        when others =>		-- Do nothing
      end case;
    end if;
  end process;

  process (reset, clk)
  begin
    if reset='1' then
      d_flag <= '0';
    elsif clk'event and clk='1' then
      case flag_op is
        when MC_NOP =>		-- Do nothing
        when MC_CLEARD =>       d_flag <= '0';
        when MC_DIN =>          d_flag <= data_in(3);
        when MC_SETD =>         d_flag <= '1';
        when others =>		-- Do nothing
      end case;
    end if;
  end process;

  process (reset, clk)
  begin
    if reset='1' then
      i_flag <= '1';
    elsif clk'event and clk='1' then
      case flag_op is
        when MC_NOP =>		-- Do nothing
        when MC_SETI =>         i_flag <= '1';
        when MC_CLEARI =>       i_flag <= '0';
        when MC_DIN =>          i_flag <= data_in(2);
        when others =>		-- Do nothing
      end case;
    end if;
  end process;

  process (reset, clk)
  begin
    if reset='1' then
      z_flag <= '1';
    elsif clk'event and clk='1' then
      case flag_op is
        when MC_NOP =>		-- Do nothing
        when MC_NVZC =>
            if alu_out(7 downto 0)="00000000" then
              z_flag <='1';
            else
              z_flag <= '0';
            end if;
        when MC_NZ =>
            if alu_out(7 downto 0)="00000000" then
              z_flag <='1';
            else
              z_flag <= '0';
            end if;
        when MC_NZC =>
            if alu_out(7 downto 0)="00000000" then
              z_flag <='1';
            else
              z_flag <='0';
            end if;
        when MC_BIT =>
            if alu_out(7 downto 0)="00000000" then
              z_flag <='1';
            else
              z_flag <='0';
            end if;
        when MC_DIN =>          z_flag <= data_in(1);
        when others =>		-- Do nothing
      end case;
    end if;
  end process;

  process (reset, clk)
  begin
    if reset='1' then
      c_flag <= '0';
    elsif clk'event and clk='1' then
      case flag_op is
        when MC_NOP =>		-- Do nothing
        when MC_NVZC =>		c_flag <= alu_out(8);
        when MC_NZC =>          c_flag <= alu_out(8);
        when MC_CLEARC =>       c_flag <= '0';
        when MC_DIN =>          c_flag <= data_in(0);
        when MC_SETC =>         c_flag <= '1';
        when others =>		-- Do nothing
      end case;
    end if;
  end process;

end core_6502_arch_debug;


----------------------------------------------------------------------------
----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library work;
use work.microcode.all;
use work.free_6502.all;


entity core_6502 is
  port (clk	 :in std_logic;
        reset	 :in std_logic;
        irq_in	 :in std_logic;
        nmi_in	 :in std_logic;
        addr_pin :out std_logic_vector (15 downto 0);
        din	 :in  std_logic_vector (7 downto 0);
        dout	 :out std_logic_vector (7 downto 0);
        dout_oe  :out std_logic;
        we_pin	 :out std_logic;
        rd_pin	 :out std_logic;
        sync	 :out std_logic
       );
end core_6502;


architecture arch_core_6502 of core_6502 is
  signal stack_page	:std_logic_vector (7 downto 0);
  signal reg_a_out	:std_logic_vector (7 downto 0);
  signal reg_x_out	:std_logic_vector (7 downto 0);
  signal reg_y_out	:std_logic_vector (7 downto 0);
  signal reg_sr_out	:std_logic_vector (7 downto 0);
  signal reg_sp_out	:std_logic_vector (7 downto 0);
  signal reg_pc_out	:std_logic_vector (15 downto 0);
begin
  stack_page <= "00000001";

  U6502: core_6502_debug port map
    (clk, reset, irq_in, nmi_in, addr_pin, din, dout, dout_oe, we_pin, 
     rd_pin, sync, stack_page, reg_a_out, reg_x_out, reg_y_out,
     reg_sr_out, reg_sp_out, reg_pc_out);

end arch_core_6502;


----------------------------------------------------------------------------
----------------------------------------------------------------------------

