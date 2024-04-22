-- The local memory is instantiated within the CU memory controller.
-- It is composed by one or more scratchpad memory blocks per PE to hold call stacks.
-- Dedicated assembly instructions are used to load and store data in this memory.
-- Each work-item is mapped to a fixed region is a scratchpad block.



-- libraries -------------------------------------------------------------------------------------------{{{
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library fgpu;
use fgpu.definitions.all;
use fgpu.components.all;
---------------------------------------------------------------------------------------------------------}}}
entity lmem is --{{{
port (
  clk                 : in std_logic;

  rqst                : in std_logic; -- stage 0
    -- cu vector request to local memory
  we                  : in std_logic; -- stage 0
	  -- cu vector write-enable for local memory
  alu_en              : in std_logic_vector(CV_SIZE - 1 downto 0);
    -- signal provided by the cu vector and delivered to the cu memory controller and the WF scheduler                   ---------------------------------- Add comment
  wrData              : in SLV32_ARRAY(CV_SIZE - 1 downto 0);
    -- write data provided by the cu vector
  rdData              : out SLV32_ARRAY(CV_SIZE - 1 downto 0); -- stage 2
    -- read data from local memory
  rdData_v            : out std_logic; -- stage 2
    -- read data valid from local memory
  rdData_rd_addr      : out unsigned(REG_FILE_W - 1 downto 0);
    -- rd_addr delayed by two cycles                                                                                     ---------------------------------- Check comment
  rdData_alu_en       : out std_logic_vector(CV_SIZE - 1 downto 0);
    -- alu_en delayed by two cycles
  sp                  : in unsigned(LMEM_ADDR_W - N_WF_CU_W - PHASE_W - 1 downto 0);
    --
  rd_addr             : in unsigned(REG_FILE_W - 1 downto 0);
    -- register file rd address provided by the cu vector
  nrst                : in std_logic
);
end lmem; --}}}

architecture basic of lmem is

  type lmemory_type is array (0 to 2 ** LMEM_ADDR_W - 1) of std_logic_vector(CV_SIZE * DATA_W - 1 downto 0);

  signal lmemory                          : lmemory_type;
    -- local memory
  signal lmemory_addr                     : unsigned(LMEM_ADDR_W - 1 downto 0);
    -- local memory address
  signal phase                            : unsigned(PHASE_W - 1 downto 0);
    -- signal used to count the clock cycles in which the PEs execute the same instruction -- NO! E' UN ALTRO SEGNALE PHASE! Ma comunque coincide
  signal rdData_n                         : SLV32_ARRAY(CV_SIZE - 1 downto 0);
    -- array containing the read words of the various PEs of a CU                                                         ---------------------------------- Check comment
  signal alu_en_vec                       : alu_en_vec_type(1 downto 0);
    -- alu_en_vec(1 downto 0) <= alu_en & alu_en_vec(1 downto 1)
  signal rd_addr_vec                      : reg_addr_array(1 downto 0);
    -- rd_addr_vec(1 downto 0) <= rd_addr & rd_addr_vec(1 downto 1)
  signal rdData_v_p0                      : std_logic;
    -- read data valid from local memory

begin
  -- lmemory ----------------------------------------------------------------------------------------------{{{
  lmemory_addr(LMEM_ADDR_W - 1 downto LMEM_ADDR_W - PHASE_W) <= phase;
    -- depends on the number of clock cycles in which the PEs execute the same instruction
  lmemory_addr(LMEM_ADDR_W - PHASE_W - 1 downto LMEM_ADDR_W - PHASE_W - N_WF_CU_W) <= rd_addr(WI_REG_ADDR_W + N_WF_CU_W - 1 downto WI_REG_ADDR_W);
    -- depends on the number of WF within a CU
  lmemory_addr(LMEM_ADDR_W - N_WF_CU_W - PHASE_W - 1 downto 0) <= sp;
    --

  process(clk)
  begin
    if rising_edge(clk) then
      for i in 0 to CV_SIZE-1 loop
        rdData_n(i) <= lmemory(to_integer(lmemory_addr))((i + 1) * DATA_W - 1 downto i * DATA_W); -- @ 1
      end loop;
      rdData <= rdData_n; -- @ 2

      if we = '1' then
        for i in 0 to CV_SIZE-1 loop
          if alu_en(i) = '1' then
            lmemory(to_integer(lmemory_addr))((i + 1) * DATA_W - 1 downto i * DATA_W) <= wrData(i);
          end if;
        end loop;
      end if;
    end if;
  end process;
  ---------------------------------------------------------------------------------------------------------}}}

  -- control ----------------------------------------------------------------------------------------------{{{
  rdData_alu_en  <= alu_en_vec(0);
  rdData_rd_addr <= rd_addr_vec(0);

  process(clk)
  begin
    if rising_edge(clk) then
      if nrst = '0' then
        phase <= (others => '0');
        rdData_v_p0 <= '0';

        rdData_v    <= '0'; -- NOT NEEDED
      else
        if rqst = '1' then
          phase <= phase + 1;
        end if;
        if phase = (phase'reverse_range => '0') then
          rdData_v_p0 <= '0';
        end if;
        if rqst = '1' and we = '0' then
          if phase = (phase'reverse_range => '0') then
            rdData_v_p0 <= '1';
          end if;
        end if;

        rdData_v <= rdData_v_p0;
      end if;
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      alu_en_vec  <= alu_en  & alu_en_vec(alu_en_vec'high downto 1);
      rd_addr_vec <= rd_addr & rd_addr_vec(rd_addr_vec'high downto 1);
    end if;
  end process;
  ---------------------------------------------------------------------------------------------------------}}}

end architecture;
