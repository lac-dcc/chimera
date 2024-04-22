library ieee;
use ieee.std_logic_1164.all;
package sys_Type_Package is -- 
  subtype unsigned_7_downto_0 is std_logic_vector(7 downto 0);
  subtype unsigned_0_downto_0 is std_logic_vector(0 downto 0);
  -- 
end package;
library ahir;
use ahir.BaseComponents.all;
use ahir.Utilities.all;
use ahir.Subprograms.all;
use ahir.OperatorPackage.all;
use ahir.BaseComponents.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library SYS_LIB;
use SYS_LIB.sys_Type_Package.all;
entity MuxT is  -- 
  port (-- 
    In_1: in std_logic_vector(7 downto 0);
    In_1_pipe_read_req: out std_logic_vector(0 downto 0);
    In_1_pipe_read_ack: in std_logic_vector(0 downto 0);
    In_2: in std_logic_vector(7 downto 0);
    In_2_pipe_read_req: out std_logic_vector(0 downto 0);
    In_2_pipe_read_ack: in std_logic_vector(0 downto 0);
    Out_1: out std_logic_vector(7 downto 0);
    Out_1_pipe_write_req: out std_logic_vector(0 downto 0);
    Out_1_pipe_write_ack: in std_logic_vector(0 downto 0);
    clk, reset: in std_logic); --
  --
end entity MuxT;
architecture rtlThreadArch of MuxT is --
  type ThreadState is (s_uc_rst, s_uc_Receive, s_uc_send);
  signal current_thread_state : ThreadState;
  signal Out_1_buffer: unsigned_7_downto_0;
  constant o1: unsigned_0_downto_0 := "1";
  signal priority: unsigned_0_downto_0;
  constant z1: unsigned_0_downto_0 := "0";
  --
begin -- 
  Out_1 <= Out_1_buffer;
  process(clk, reset, current_thread_state , In_1, In_1_pipe_read_ack, In_2, In_2_pipe_read_ack, Out_1_pipe_write_ack, priority) --
    -- declared variables and implied variables 
    variable d_buffer: unsigned_7_downto_0;
    variable d_var: unsigned_7_downto_0;
    variable n_e_x_t_priority: unsigned_0_downto_0;
    variable next_thread_state : ThreadState;
    --
  begin -- 
    -- default values 
    next_thread_state := current_thread_state;
    -- default initializations... 
    --  $now  In_1$req  :=  z1
    In_1_pipe_read_req <= z1;
    --  $now  In_2$req  :=  z1
    In_2_pipe_read_req <= z1;
    --  $now  Out_1$req  :=  z1
    Out_1_pipe_write_req <= z1;
    --  $now  Out_1 :=  ( $unsigned<8> )  00000000 
    Out_1_buffer <= "00000000";
    n_e_x_t_priority := priority;
    -- case statement 
    case current_thread_state is -- 
      when s_uc_rst => -- 
        next_thread_state := s_uc_Receive;
        --  priority :=  ( $unsigned<1> )  1 
        n_e_x_t_priority := "1";
        next_thread_state := s_uc_Receive;
        --
      when s_uc_Receive => -- 
        next_thread_state := s_uc_send;
        --  $now  In_1$req  :=  priority
        In_1_pipe_read_req <= priority;
        --  $now  In_2$req  := ( ~  priority) 
        In_2_pipe_read_req <= ( not priority);
        if (isTrue((priority and In_1_pipe_read_ack))) then  -- 
          --  d_buffer :=  In_1
          d_buffer := In_1;
          next_thread_state := s_uc_send;
          --
        else -- 
          if (isTrue((( not priority) and In_2_pipe_read_ack))) then  -- 
            --  d_buffer :=  In_2
            d_buffer := In_2;
            next_thread_state := s_uc_send;
            --
          else -- 
            next_thread_state := s_uc_Receive;
            --
          end if;
          --
        end if;
        --
      when s_uc_send => -- 
        next_thread_state := s_uc_send;
        --  $now  Out_1$req  :=  o1
        Out_1_pipe_write_req <= o1;
        --  $now  Out_1 :=  d_buffer
        Out_1_buffer <= d_buffer;
        if (isTrue(Out_1_pipe_write_ack)) then  -- 
          next_thread_state := s_uc_Receive;
          --  priority := ( ~  priority) 
          n_e_x_t_priority := ( not priority);
          --
        end if;
        --
      --
    end case;
    if (clk'event and clk = '1') then -- 
      if (reset = '1') then -- 
        current_thread_state <= s_uc_rst;
        -- 
      else -- 
        current_thread_state <= next_thread_state; 
        -- objects to be updated under tick.
        priority <= n_e_x_t_priority;
        -- specified tick assignments. 
        -- 
      end if; 
      -- 
    end if; 
    --
  end process; 
  --
end rtlThreadArch;
library ahir;
use ahir.BaseComponents.all;
use ahir.Utilities.all;
use ahir.Subprograms.all;
use ahir.OperatorPackage.all;
use ahir.BaseComponents.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-->>>>>
library SYS_LIB;
use SYS_LIB.sys_Type_Package.all;
--<<<<<
-->>>>>
--<<<<<
entity sys is -- 
  port( -- 
    In_1_pipe_write_data : in std_logic_vector(7 downto 0);
    In_1_pipe_write_req  : in std_logic_vector(0  downto 0);
    In_1_pipe_write_ack  : out std_logic_vector(0  downto 0);
    In_2_pipe_write_data : in std_logic_vector(7 downto 0);
    In_2_pipe_write_req  : in std_logic_vector(0  downto 0);
    In_2_pipe_write_ack  : out std_logic_vector(0  downto 0);
    Out_1_pipe_read_data : out std_logic_vector(7 downto 0);
    Out_1_pipe_read_req  : in std_logic_vector(0  downto 0);
    Out_1_pipe_read_ack  : out std_logic_vector(0  downto 0);
    clk, reset: in std_logic 
    -- 
  );
  --
end entity sys;
architecture struct of sys is -- 
  component MuxT is  -- 
    port (-- 
      In_1: in std_logic_vector(7 downto 0);
      In_1_pipe_read_req: out std_logic_vector(0 downto 0);
      In_1_pipe_read_ack: in std_logic_vector(0 downto 0);
      In_2: in std_logic_vector(7 downto 0);
      In_2_pipe_read_req: out std_logic_vector(0 downto 0);
      In_2_pipe_read_ack: in std_logic_vector(0 downto 0);
      Out_1: out std_logic_vector(7 downto 0);
      Out_1_pipe_write_req: out std_logic_vector(0 downto 0);
      Out_1_pipe_write_ack: in std_logic_vector(0 downto 0);
      clk, reset: in std_logic); --
    --
  end component;
  -->>>>>
  for mux_inst :  MuxT -- 
    use entity SYS_LIB.MuxT; -- 
  --<<<<<
  -- 
begin -- 
  mux_inst: MuxT -- 
    port map ( -- 
      In_1 => In_1_pipe_write_data,
      In_1_pipe_read_req => In_1_pipe_write_ack,
      In_1_pipe_read_ack => In_1_pipe_write_req,
      In_2 => In_2_pipe_write_data,
      In_2_pipe_read_req => In_2_pipe_write_ack,
      In_2_pipe_read_ack => In_2_pipe_write_req,
      Out_1 => Out_1_pipe_read_data,
      Out_1_pipe_write_req => Out_1_pipe_read_ack,
      Out_1_pipe_write_ack => Out_1_pipe_read_req,
      clk => clk, reset => reset--
    ); -- 
  -- 
end struct;
