-- A Register File with 2 write ports and 2 read ports built out of
-- 2 RAM blocks with 1 read and 1 independant write port. Register 0
-- also has independant ouput. 32 regs x 32 bits by default, one write clock. 
--
-- Both write ports actually write to the same RAM blocks by delaying EX stage
-- writes to the WB stage and assuming that the decoder will never schedule
-- register writes for both Z and W busses in same ID stage.
--
-- To delay EX stage writes, a pipeline of 2 pending writes is kept. To service
-- a read, either the data in the EX pipeline or the current WB write value
-- may be returned instead of the data in the RAM block. Servicing reads from
-- the current WB write value implements W bus forwarding.

library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity register_file is
  generic (
    ADDR_WIDTH : integer;
    NUM_REGS : integer;
    REG_WIDTH : integer);
  port (
    clk     : in  std_logic;
    rst     : in  std_logic;
    ce      : in  std_logic;

    addr_ra : in  std_logic_vector(ADDR_WIDTH-1 downto 0);
    dout_a  : out std_logic_vector(REG_WIDTH-1 downto 0);
    addr_rb : in  std_logic_vector(ADDR_WIDTH-1 downto 0);
    dout_b  : out std_logic_vector(REG_WIDTH-1 downto 0);
    dout_0  : out std_logic_vector(REG_WIDTH-1 downto 0);

    we_wb     : in  std_logic;
    w_addr_wb : in  std_logic_vector(ADDR_WIDTH-1 downto 0);
    din_wb    : in  std_logic_vector(REG_WIDTH-1 downto 0);

    we_ex     : in  std_logic;
    w_addr_ex : in  std_logic_vector(ADDR_WIDTH-1 downto 0);
    din_ex    : in  std_logic_vector(REG_WIDTH-1 downto 0);

    -- wr_data_o exposes the data about to be written to the
    -- register memories
    wr_data_o : out std_logic_vector(REG_WIDTH-1 downto 0)
    );

  subtype addr_t is std_logic_vector(ADDR_WIDTH-1 downto 0);
  subtype data_t is std_logic_vector(REG_WIDTH-1 downto 0);

  type reg_pipe_t is
  record
    en : std_logic;
    data : data_t;
    addr : addr_t;
  end record;
  type ex_pipeline_t is array(0 to 2) of reg_pipe_t;
  constant REG_PIPE_RESET : reg_pipe_t := (
    en   => '0',
    data => (others => '0'),
    addr => (others => '0'));

  function pipe_matches(pipe : reg_pipe_t; addr : addr_t)
  return boolean is
  begin
    return pipe.en = '1' and pipe.addr = addr;
  end;

  function read_with_forwarding(addr : addr_t; bank_data : data_t;
                                wb_pipe : reg_pipe_t;
                                ex_pipes : ex_pipeline_t)
  return std_logic_vector is
  begin
    -- The goal here is to read the most recent value for a register.
    -- (I believe the order of the wb_pipe and ex_pipes(1) checks doesn't
    -- matter and can be reversed because they cannot both be writing to the
    -- same register. Register conflict detection prevents that.)

    -- forward from W bus writes occuring this cycle
    if (pipe_matches(wb_pipe, addr)) then
      return wb_pipe.data;
    
    -- ex_pipes(1) and ex_pipes(2) are "already written" values that should be
    -- returned before the bank data. Check ex_pipes(1) first as it is the more
    -- recent write.
    elsif (pipe_matches(ex_pipes(1), addr)) then
      return ex_pipes(1).data;
    elsif (pipe_matches(ex_pipes(2), addr)) then
      return ex_pipes(2).data;
    else
      -- no matching pending writes in the pipeline, return bank data
      return bank_data;
    end if;
  end;

  function to_reg_index(addr : addr_t)
  return integer is
  variable ret : integer range 0 to 31;
  begin
     ret := to_integer(unsigned(addr));
     if ret >= NUM_REGS then
        report "Register out of range";
        ret := 0;
     end if;
     return ret;
  end;
end register_file;
