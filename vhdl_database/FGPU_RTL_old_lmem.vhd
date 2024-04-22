-- libraries -------------------------------------------------------------------------------------------{{{
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.all;
use work.FGPU_definitions.all;
---------------------------------------------------------------------------------------------------------}}}
entity lmem is --{{{
port (
  clk                 : in std_logic;
  rqst, we            : in std_logic; -- stage 0
  alu_en              : in std_logic_vector(CV_SIZE-1 downto 0);
  wrData              : in SLV32_ARRAY(CV_SIZE-1 downto 0);
  rdData              : out SLV32_ARRAY(CV_SIZE-1 downto 0) := (others=>(others=>'0')); -- stage 2
  rdData_v            : out std_logic := '0'; -- stage 2
  rdData_rd_addr      : out unsigned(REG_FILE_W-1 downto 0) := (others=>'0');
  rdData_alu_en       : out std_logic_vector(CV_SIZE-1 downto 0) := (others=>'0');
  sp                  : in unsigned(LMEM_ADDR_W-N_WF_CU_W-PHASE_W-1 downto 0);
  rd_addr             : in unsigned(REG_FILE_W-1 downto 0);
  nrst                : in std_logic
);
end lmem; --}}}
architecture basic of lmem is
  type lmemory_type is array (0 to 2**LMEM_ADDR_W-1) of std_logic_vector(CV_SIZE*DATA_W-1 downto 0);
  signal lmemory                          : lmemory_type := (others=>(others=>'0'));
  signal lmemory_addr                     : unsigned(LMEM_ADDR_W-1 downto 0) := (others=>'0');
  signal phase                            : unsigned(PHASE_W-1 downto 0) := (others=>'0');
  signal rdData_n                         : SLV32_ARRAY(CV_SIZE-1 downto 0) := (others=>(others=>'0'));
  signal alu_en_vec                       : alu_en_vec_type(1 downto 0) := (others=>(others=>'0'));
  signal rd_addr_vec                      : reg_addr_array(1 downto 0) := (others=>(others=>'0'));
  signal rdData_v_p0                      : std_logic := '0';
begin
  -- lmemory ----------------------------------------------------------------------------------------------{{{
  lmemory_addr(LMEM_ADDR_W-1 downto LMEM_ADDR_W-PHASE_W) <= phase;
  lmemory_addr(LMEM_ADDR_W-PHASE_W-1 downto LMEM_ADDR_W-PHASE_W-N_WF_CU_W) <= rd_addr(WI_REG_ADDR_W+N_WF_CU_W-1 downto WI_REG_ADDR_W);
  lmemory_addr(LMEM_ADDR_W-N_WF_CU_W-PHASE_W-1 downto 0) <= sp;
  process(clk)
  begin
    if rising_edge(clk) then
      for i in 0 to CV_SIZE-1 loop
        rdData_n(i) <= lmemory(to_integer(lmemory_addr))((i+1)*DATA_W-1 downto i*DATA_W); -- @ 1
      end loop;
      rdData <= rdData_n; -- @ 2
      if we = '1' then
        for i in 0 to CV_SIZE-1 loop
          if alu_en(i) = '1' then
            lmemory(to_integer(lmemory_addr))((i+1)*DATA_W-1 downto i*DATA_W) <= wrData(i);
          end if;
        end loop;
      end if;
    end if;
  end process;
  ---------------------------------------------------------------------------------------------------------}}}
  -- control ----------------------------------------------------------------------------------------------{{{
  rdData_alu_en <= alu_en_vec(0);
  rdData_rd_addr <= rd_addr_vec(0);
  process(clk)
  begin
    if rising_edge(clk) then
      alu_en_vec(alu_en_vec'high) <= alu_en;
      alu_en_vec(alu_en_vec'high-1 downto 0) <= alu_en_vec(alu_en_vec'high downto 1);
      rd_addr_vec(rd_addr_vec'high) <= rd_addr;
      rd_addr_vec(rd_addr_vec'high-1 downto 0) <= rd_addr_vec(rd_addr_vec'high downto 1);
      rdData_v <= rdData_v_p0;

      if nrst = '0' then
        phase <= (others=>'0');
        rdData_v_p0 <= '0';
      else
        if rqst = '1' then
          phase <= phase + 1;
        end if;
        if phase = (phase'reverse_range=>'0') then
          rdData_v_p0 <= '0';
        end if;
        if rqst = '1' and we = '0' then
          if phase = (phase'reverse_range=>'0') then
            rdData_v_p0 <= '1';
          end if;
        end if;
      end if;
    end if;
  end process;
  ---------------------------------------------------------------------------------------------------------}}}
end architecture;
