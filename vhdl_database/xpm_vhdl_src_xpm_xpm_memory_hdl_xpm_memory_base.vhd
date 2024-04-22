--! Copyright [2020] [Frans Schreuder]
--!
--!   Licensed under the Apache License, Version 2.0 (the "License");
--!   you may not use this file except in compliance with the License.
--!   You may obtain a copy of the License at
--!
--!       http://www.apache.org/licenses/LICENSE-2.0
--!
--!   Unless required by applicable law or agreed to in writing, software
--!   distributed under the License is distributed on an "AS IS" BASIS,
--!   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--!   See the License for the specific language governing permissions and
--!   limitations under the License.
library ieee;
use ieee.std_logic_1164.all;
library std;
use std.env.all;
use ieee.math_real.all;
use std.textio.all;
use ieee.numeric_std.all;
use ieee.numeric_std_unsigned.all;

entity xpm_memory_base is
  generic (

  -- Common module parameters
    MEMORY_TYPE             : integer := 2;
    MEMORY_SIZE             : integer := 2048;
    MEMORY_PRIMITIVE        : integer := 0;
    CLOCKING_MODE           : integer := 0;
    ECC_MODE                : integer := 0;
    MEMORY_INIT_FILE        : string  := "none";
    MEMORY_INIT_PARAM       : string  := "";
    USE_MEM_INIT_MMI        : integer := 0;
    USE_MEM_INIT            : integer := 1;
    MEMORY_OPTIMIZATION     : integer := 0;
    WAKEUP_TIME             : integer := 0;
    AUTO_SLEEP_TIME         : integer := 0;
    MESSAGE_CONTROL         : integer := 0;
    USE_EMBEDDED_CONSTRAINT : integer := 0;
    CASCADE_HEIGHT          : integer := 0;
    SIM_ASSERT_CHK          : integer := 0;
    WRITE_PROTECT           : integer := 1;
  -- Port A module s
    WRITE_DATA_WIDTH_A      : integer   := 32;
    READ_DATA_WIDTH_A       : integer   := 32;
    BYTE_WRITE_WIDTH_A      : integer   := 32;
    ADDR_WIDTH_A            : integer   := 6;
    READ_RESET_VALUE_A      : string    := "0";
    READ_LATENCY_A          : integer   := 2;
    WRITE_MODE_A            : integer   := 2;
    RST_MODE_A              : string    := "SYNC";

  -- Port B module s
    WRITE_DATA_WIDTH_B      : integer  := 32;
    READ_DATA_WIDTH_B       : integer  := 32;
    BYTE_WRITE_WIDTH_B      : integer  := 32;
    ADDR_WIDTH_B            : integer  := 6;
    READ_RESET_VALUE_B      : string    := "0";
    READ_LATENCY_B          : integer  := 2;
    WRITE_MODE_B            : integer  := 2;
    RST_MODE_B              : string   := "SYNC"
);
port (
 
  -- Common module ports
  sleep          : in  std_logic;
                                                                              
     -- Port A module ports                                                   
  clka           : in  std_logic;
  rsta           : in  std_logic;
  ena            : in  std_logic;
  regcea         : in  std_logic;
  wea            : in  std_logic_vector((WRITE_DATA_WIDTH_A/BYTE_WRITE_WIDTH_A)-1 downto 0);
  addra          : in  std_logic_vector(ADDR_WIDTH_A-1 downto 0);
  dina           : in  std_logic_vector(WRITE_DATA_WIDTH_A-1 downto 0);
  injectsbiterra : in  std_logic;
  injectdbiterra : in  std_logic;
  douta          : out std_logic_vector(READ_DATA_WIDTH_A-1 downto 0) := (others => '0');
  sbiterra       : out std_logic;
  dbiterra       : out std_logic;
                                                                              
     -- Port B module ports                                                   
  clkb           : in  std_logic;
  rstb           : in  std_logic;
  enb            : in  std_logic;
  regceb         : in  std_logic;
  web            : in  std_logic_vector((WRITE_DATA_WIDTH_B/BYTE_WRITE_WIDTH_B)-1 downto 0);
  addrb          : in  std_logic_vector(ADDR_WIDTH_B-1 downto 0);
  dinb           : in  std_logic_vector(WRITE_DATA_WIDTH_B-1 downto 0);
  injectsbiterrb : in  std_logic;
  injectdbiterrb : in  std_logic;
  doutb          : out std_logic_vector(READ_DATA_WIDTH_B-1 downto 0) := (others => '0');
  sbiterrb       : out std_logic;
  dbiterrb       : out std_logic                                                            
);
end xpm_memory_base;

architecture rtl of xpm_memory_base is
    type t_generic_ram_init is array (integer range <>, integer range <>) of std_logic;
  
    subtype t_meminit_array is t_generic_ram_init;
    
   
    constant c_num_bytes_a : integer := (WRITE_DATA_WIDTH_A / BYTE_WRITE_WIDTH_A);
    constant c_num_bytes_b : integer := (WRITE_DATA_WIDTH_B / BYTE_WRITE_WIDTH_B);
    
    signal douta_i        : std_logic_vector(READ_DATA_WIDTH_A-1 downto 0) := (others => '0');
    signal doutb_i        : std_logic_vector(READ_DATA_WIDTH_B-1 downto 0) := (others => '0');
  
  function clog2(N : natural) return positive is
  begin
    if N <= 2 then
      return 1;
    elsif N mod 2 = 0 then
      return 1 + clog2(N/2);
    else
      return 1 + clog2((N+1)/2);
    end if;
  end function;
  
  function f_empty_file_name (
    file_name : in string)
    return boolean is
  begin
    if file_name = "" or file_name = "none" then
      return TRUE;
    end if;
    return FALSE;
  end function f_empty_file_name;
  
  procedure f_file_open_check (
    file_name        : in string;
    open_status      : in file_open_status;
    fail_if_notfound : in boolean) is
  begin
    if open_status /= OPEN_OK then

      if fail_if_notfound then
        report "f_load_mem_from_file(): can't open file '"&file_name&"'" severity FAILURE;
      else
        report "f_load_mem_from_file(): can't open file '"&file_name&"'" severity WARNING;
      end if;
    end if;
  end procedure f_file_open_check;
  
  impure function f_load_mem_from_file
    (file_name        : in string;
     mem_size         : in integer;
     mem_width        : in integer;
     fail_if_notfound : boolean)
    return t_meminit_array is

    FILE f_in  : text;
    variable l : line;
    variable tmp_bv : bit_vector(mem_width-1 downto 0);
    variable tmp_sv : std_logic_vector(mem_width-1 downto 0);
    variable mem: t_meminit_array(0 to mem_size-1, mem_width-1 downto 0) := (others => (others => '0'));
    variable status   : file_open_status;
  begin
    if f_empty_file_name(file_name) then
      return mem;
    end if;
    file_open(status, f_in, file_name, read_mode);
    

    f_file_open_check (file_name, status, fail_if_notfound);

    for I in 0 to mem_size-1 loop
      if not endfile(f_in) then
        readline (f_in, l);
        -- read function gives us bit_vector
        hread (l, tmp_bv);
      else
        tmp_bv := (others => '0');
      end if;
      tmp_sv := to_stdlogicvector(tmp_bv);
      for J in 0 to mem_width-1 loop
        mem(i, j) := tmp_sv(j);
      end loop;
    end loop;

    if not endfile(f_in) then
      report "f_load_mem_from_file(): file '"&file_name&"' is bigger than available memory" severity FAILURE;
    end if;

    file_close(f_in);
    return mem;
  end f_load_mem_from_file;
  
  impure function f_file_to_ramtype return std_logic_vector is
    variable tmp    : std_logic_vector(MEMORY_SIZE-1 downto 0);
    variable n, pos : integer;
    variable arr    : t_meminit_array(0 to MEMORY_SIZE/WRITE_DATA_WIDTH_A-1, WRITE_DATA_WIDTH_A-1 downto 0);
  begin
    -- If no file was given, there is nothing to convert, just return
    if (MEMORY_INIT_FILE = "" or MEMORY_INIT_FILE = "none") then
      tmp := (others=>'0');
      return tmp;
    end if;

    arr := f_load_mem_from_file(MEMORY_INIT_FILE, MEMORY_SIZE/WRITE_DATA_WIDTH_A, WRITE_DATA_WIDTH_A, false);
    pos := 0;
    while(pos < MEMORY_SIZE/WRITE_DATA_WIDTH_A)loop
      n := 0;
      -- avoid ISE loop iteration limit
      while (pos < MEMORY_SIZE/WRITE_DATA_WIDTH_A and n < 4096) loop
        for i in 0 to WRITE_DATA_WIDTH_A-1 loop
          tmp(pos*WRITE_DATA_WIDTH_A+i) := arr(pos, i);
        end loop;  -- i
        n   := n+1;
        pos := pos + 1;
      end loop;
    end loop;
    return tmp;
  end f_file_to_ramtype;

  function f_is_synthesis return boolean is
  begin
    -- synthesis translate_off
    return false;
    -- synthesis translate_on
    return true;
  end f_is_synthesis;

  type T is protected
    impure function Get_A(Index: std_logic_vector(ADDR_WIDTH_A-1 downto 0)) return std_logic_vector;
    procedure SetBE_A (Index: std_logic_vector(ADDR_WIDTH_A-1 downto 0); Data: std_logic_vector(WRITE_DATA_WIDTH_A-1 downto 0); BE : std_logic_vector(c_num_bytes_a-1 downto 0));
    impure function Get_B(Index: std_logic_vector(ADDR_WIDTH_B-1 downto 0)) return std_logic_vector;
    procedure SetBE_B (Index: std_logic_vector(ADDR_WIDTH_B-1 downto 0); Data: std_logic_vector(WRITE_DATA_WIDTH_B-1 downto 0); BE : std_logic_vector(c_num_bytes_b-1 downto 0));
  end protected T;

  type T is protected body
    variable V : std_logic_vector(MEMORY_SIZE-1 downto 0) := f_file_to_ramtype;
    
    impure function Get_A(Index: std_logic_vector(ADDR_WIDTH_A-1 downto 0)) return std_logic_vector is
    begin
        return V(to_integer(unsigned(Index))*READ_DATA_WIDTH_A+READ_DATA_WIDTH_A-1 downto to_integer(unsigned(Index))*READ_DATA_WIDTH_A);
    end function;
    
    procedure SetBE_A (Index: std_logic_vector(ADDR_WIDTH_A-1 downto 0); Data: std_logic_vector(WRITE_DATA_WIDTH_A-1 downto 0); BE : std_logic_vector(c_num_bytes_a-1 downto 0)) is
      variable tmp: std_logic_vector(WRITE_DATA_WIDTH_A-1 downto 0);
    begin
        tmp := V(to_integer(unsigned(Index))*WRITE_DATA_WIDTH_A+WRITE_DATA_WIDTH_A-1 downto to_integer(unsigned(Index))*WRITE_DATA_WIDTH_A);
        for i in 0 to c_num_bytes_a-1 loop
          if BE(i) = '1' then
            tmp((i+1)*BYTE_WRITE_WIDTH_A-1 downto i*BYTE_WRITE_WIDTH_A) := Data((i+1)*BYTE_WRITE_WIDTH_A-1 downto i*BYTE_WRITE_WIDTH_A);
          end if;
        end loop;
        
        V(to_integer(unsigned(Index))*WRITE_DATA_WIDTH_A+WRITE_DATA_WIDTH_A-1 downto to_integer(unsigned(Index))*WRITE_DATA_WIDTH_A) := tmp;
        
    end procedure;
    
    impure function Get_B(Index: std_logic_vector(ADDR_WIDTH_B-1 downto 0)) return std_logic_vector is
    begin
        return V(to_integer(unsigned(Index))*READ_DATA_WIDTH_B+READ_DATA_WIDTH_B-1 downto to_integer(unsigned(Index))*READ_DATA_WIDTH_B);
    end function;
    
    procedure SetBE_B (Index: std_logic_vector(ADDR_WIDTH_B-1 downto 0); Data: std_logic_vector(WRITE_DATA_WIDTH_B-1 downto 0); BE : std_logic_vector(c_num_bytes_b-1 downto 0)) is
      variable tmp: std_logic_vector(WRITE_DATA_WIDTH_B-1 downto 0);
    begin
        tmp := V(to_integer(unsigned(Index))*WRITE_DATA_WIDTH_B+WRITE_DATA_WIDTH_B-1 downto to_integer(unsigned(Index))*WRITE_DATA_WIDTH_B);
        for i in 0 to c_num_bytes_b-1 loop
          if BE(i) = '1' then
            tmp((i+1)*BYTE_WRITE_WIDTH_B-1 downto i*BYTE_WRITE_WIDTH_B) := Data((i+1)*BYTE_WRITE_WIDTH_B-1 downto i*BYTE_WRITE_WIDTH_B);
          end if;
        end loop;
        
        V(to_integer(unsigned(Index))*WRITE_DATA_WIDTH_B+WRITE_DATA_WIDTH_B-1 downto to_integer(unsigned(Index))*WRITE_DATA_WIDTH_B) := tmp;
        
    end procedure;
    
  end protected body T;
  
  shared variable ram: T;
  type slv_rwa_array is array(0 to READ_LATENCY_A) of std_logic_vector(READ_DATA_WIDTH_A-1 downto 0);
  type slv_rwb_array is array(0 to READ_LATENCY_B) of std_logic_vector(READ_DATA_WIDTH_B-1 downto 0);
  
  signal output_reg_a: slv_rwa_array;
  signal output_reg_b: slv_rwb_array;
    
begin

    -- "write_first"   0;
    -- "read_first"    1 ;
    -- "no_change"     2 ; 

  gen_readfirst_a : if(WRITE_MODE_A = 1) generate
    process (clka, rsta)
    begin
      if rsta = '1' then
        douta_i <= (others => '0');
      elsif rising_edge(clka) then
        if ena = '1' then
          douta_i <= ram.Get_A(addra);
          ram.SetBE_A(addra, dina, wea);
        end if;
      end if;
    end process;
  end generate gen_readfirst_a;
  
  gen_writefirst_a : if(WRITE_MODE_A = 0) generate
    process (clka, rsta)
    begin
      if rsta = '1' then
        douta_i <= (others => '0');
      elsif rising_edge(clka) then
        if ena = '1' then
          ram.SetBE_A(addra, dina, wea);
          douta_i <= ram.Get_A(addra);
        end if;
      end if;
    end process;
  end generate gen_writefirst_a;
  
  gen_nochange_a : if(WRITE_MODE_A = 2) generate
    process (clka, rsta)
    begin
      if rsta = '1' then
        douta_i <= (others => '0');
      elsif rising_edge(clka) then
        if ena = '1' then
          if(wea = (wea'range=> '0')) then
            douta_i <= ram.Get_A(addra);
          else
            ram.SetBE_A(addra, dina, wea);
          end if;
        end if;
      end if;
    end process;
  end generate gen_nochange_a;
  
  
  gen_readfirst_b : if(WRITE_MODE_B = 1) generate
    process (clkb, rstb)
    begin
      if rstb = '1' then
        doutb_i <= (others => '0');
      elsif rising_edge(clkb) then
        if enb = '1' then
          doutb_i <= ram.Get_B(addrb);
          ram.SetBE_B(addrb, dinb, web);
        end if;
      end if;
    end process;
  end generate gen_readfirst_b;
  
  gen_writefirst_b : if(WRITE_MODE_B = 0) generate
    process (clkb, rstb)
    begin
      if rstb = '1' then
        doutb_i <= (others => '0');
      elsif rising_edge(clkb) then
        if enb = '1' then
          ram.SetBE_B(addrb, dinb, web);
          doutb_i <= ram.Get_B(addrb);
        end if;
      end if;
    end process;
  end generate gen_writefirst_b;
  
  gen_nochange_b : if(WRITE_MODE_B = 2) generate
    process (clkb, rstb)
    begin
      if rstb = '1' then
          doutb_i <= (others => '0');
      elsif rising_edge(clkb) then
        if enb = '1' then
          if(web = (web'range=> '0')) then
            doutb_i <= ram.Get_B(addrb);
          else
            ram.SetBE_B(addrb, dinb, web);
          end if;
        end if;
      end if;
    end process;
  end generate gen_nochange_b;
  g_latb_1: if READ_LATENCY_B < 2 generate
    output_reg_b(READ_LATENCY_B) <= doutb_i;
  end generate;
  g_latb_2: if READ_LATENCY_B >= 2 generate
    output_reg_b_proc: process(clkb, rstb)
    begin
        if rstb = '1' then
            for i in 2 to READ_LATENCY_B loop
                if(READ_RESET_VALUE_B = "1") then
                    output_reg_b(i) <= (others => '1');
                else
                    output_reg_b(i) <= (others => '0');
                end if;
            end loop;
        elsif rising_edge(clkb) then
            if regceb = '1' then
                for i in 2 to READ_LATENCY_B loop
                    if i = 2 then
                        output_reg_b(i) <= doutb_i;
                    else
                        output_reg_b(i) <= output_reg_b(i-1);
                    end if;
                end loop;
            end if;
        end if;
    end process;
  end generate;
    doutb <= output_reg_b(READ_LATENCY_B);
  
  g_lata_1: if READ_LATENCY_A < 2 generate
    output_reg_a(READ_LATENCY_A) <= douta_i;
  end generate;
  g_lata_2: if READ_LATENCY_A >= 2 generate
  
    output_reg_a_proc: process(clka, rsta)
    begin
        if rsta = '1' then
            for i in 2 to READ_LATENCY_A loop
                if(READ_RESET_VALUE_A = "1") then
                    output_reg_a(i) <= (others => '1');
                else
                    output_reg_a(i) <= (others => '0');
                end if;
            end loop;
        elsif rising_edge(clka) then
            if regcea = '1' then
                for i in 2 to READ_LATENCY_A loop
                    if i = 2 then
                        output_reg_a(i) <= douta_i;
                    else
                        output_reg_a(i) <= output_reg_a(i-1);
                    end if;
                end loop;
            end if;
        end if;
    end process;
  end generate;
    douta <= output_reg_a(READ_LATENCY_A);

    
    
    sbiterrb <= '0';
    dbiterrb <= '0';
    sbiterra <= '0';
    dbiterra <= '0';

end rtl;
