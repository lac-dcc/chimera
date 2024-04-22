--------------------------------------------------------------------------------------------------------------
--  stage IF -- (Instruction Fetch)                                                                       --
--  Author(s): Abdallah Cheikh abdallah.cheikh@uniroma1.it (abdallah93.as@gmail.com)                        --
--                                                                                                          --
--  Date Modified: 17-11-2019                                                                               --
--------------------------------------------------------------------------------------------------------------
--  The fetch stage requests an instruction from the program memory, and the instruction arrives in the     --
--  next cycle going directly to the decode stage. The fetch stage does not hold any buffers                --
--------------------------------------------------------------------------------------------------------------

-- ieee packages ------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_misc.all;
use ieee.numeric_std.all;
use std.textio.all;

-- local packages ------------
use work.riscv_klessydra.all;
--use work.klessydra_parameters.all;

-- pipeline  pinout --------------------
entity IF_STAGE is
  generic(
    THREAD_POOL_SIZE           : integer
    );
  port(
    pc_IF                      : in  std_logic_vector(31 downto 0);
    harc_IF                    : in  integer range THREAD_POOL_SIZE-1 downto 0;
	busy_ID                    : in  std_logic;
	instr_rvalid_i             : in  std_logic;  
    harc_ID                    : out integer range THREAD_POOL_SIZE-1 downto 0;
    pc_ID                      : out std_logic_vector(31 downto 0);  -- pc_ID is PC entering ID stage
    instr_rvalid_ID            : out std_logic; 
	instr_word_ID_lat          : out std_logic_vector(31 downto 0);
    -- clock, reset active low
    clk_i                      : in  std_logic;
    rst_ni                     : in  std_logic;
    -- program memory interface
    instr_req_o                : out std_logic;
    instr_gnt_i                : in  std_logic;
    instr_rdata_i              : in  std_logic_vector(31 downto 0)
    );
end entity;  ------------------------------------------


-- Klessydra T03x (4 stages) pipeline implementation -----------------------
architecture FETCH of IF_STAGE is

  -- state signals
  signal instr_word_ID          : std_logic_vector(31 downto 0);
  signal instr_rvalid_state     : std_logic;

--------------------------------------------------------------------------------------------------
----------------------- ARCHITECTURE BEGIN -------------------------------------------------------
begin

----------------------------------------------------------------------------------------------------
-- stage IF -- (instruction fetch)
----------------------------------------------------------------------------------------------------
-- This pipeline stage is implicitly present as the program memory is synchronous
-- with 1 cycle latency.
-- The fsm_IF manages the interface with program memory. 
-- The PC_IF is updated by a dedicated unit which is transparent to the fsm_IF.
----------------------------------------------------------------------------------------------------

  fsm_IF_nextstate : process(all)  -- acts as the control unit of the synchronous program memory
  begin
    if busy_ID = '0' then
      instr_req_o <= '1';
    else
      instr_req_o <= '0';
    end if;
  end process;

  process(clk_i, rst_ni)
  begin
    if rising_edge(clk_i) then
      if instr_gnt_i = '1' then
        -- pc propagation
        pc_ID   <= pc_IF;
        -- harc propagation
        harc_ID <= harc_IF;
      end if;
    end if;
  end process;

  -- instr_rvalid_ID controller, needed to keep instr_valid_ID set during 
  -- stalls of the fetch stage. This is a synthesized mealy fsm
  process(clk_i, rst_ni)
  begin
    if rst_ni = '0' then
      instr_rvalid_state <= '0';
    elsif rising_edge(clk_i) then
      if instr_rvalid_i = '1'  then 
        instr_word_ID <= instr_rdata_i;
      end if;
      instr_rvalid_state <= busy_ID and (instr_rvalid_i or instr_rvalid_state);
    end if;
  end process;
  instr_rvalid_ID <= (instr_rvalid_i or instr_rvalid_state);

  -- latch ir on program memory output, because memory output remains for 1 cycle only
  instr_word_ID_lat  <= instr_rdata_i when instr_rvalid_i = '1' else instr_word_ID;
  --instr_word_ID_lat  <= instr_rdata_i when instr_rvalid_i = '1' else (others => '0');

--------------------------------------------------------------------- end of IF stage -------------
---------------------------------------------------------------------------------------------------

end FETCH;
--------------------------------------------------------------------------------------------------
-- END of IE architecture ------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------