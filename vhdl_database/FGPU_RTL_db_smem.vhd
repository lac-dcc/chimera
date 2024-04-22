-- libraries -------------------------------------------------------------------------------------------{{{
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library fgpu;
use fgpu.definitions.all;
use fgpu.components.all;
---------------------------------------------------------------------------------------------------------}}}
entity smem is --{{{
port (
  rqst                        : in std_logic; -- stage 0
    -- cu vector request to shared memory
  we                          : in std_logic; -- stage 0
    -- cu vector write-enable for shared memory
  wrData                      : in SLV32_ARRAY(CV_SIZE - 1 downto 0);
    -- data to be written during store operations
  rdData                      : out SLV32_ARRAY(CV_SIZE - 1 downto 0);
    -- data read during load operations
  addr                        : in smem_addr_t(CV_SIZE-1 downto 0);
    -- read/write address provided by the ALU
  rd_addr                     : in unsigned(REG_FILE_W - 1 downto 0);
    -- register file rd address provided by the cu vector
  alu_en                      : in std_logic_vector(CV_SIZE - 1 downto 0);
    -- signal provided by the cu vector and delivered to the cu memory controller and the WF scheduler
  rdData_rd_addr              : out unsigned(REG_FILE_W - 1 downto 0);
    -- rd_addr provided to the register file
  rdData_alu_en               : out std_logic_vector(CV_SIZE - 1 downto 0);
    -- signal provided to the register file interface to generate the write-enable
  rdData_v                    : out std_logic;
    -- rdData valid
  num_wg_per_cu               : in unsigned(N_WF_CU_W downto 0);
    -- number of WG within each CU
  wf_distribution_on_wg       : in wf_distribution_on_wg_type(N_WF_CU-1 downto 0);
    -- wf_distribution_on_wg(i) = j if the i-th wf belongs to the j-th workgroup
  smem_finish                 : out std_logic_vector(N_WF_CU-1 downto 0);
    -- smem_finish(i) = '1' when the i-th wf can exit the WAIT_SMEM_FINISH state
  reading_smem                : out std_logic;
    -- signal set to '1' when there are read requests to be served
  clk                         : in std_logic;
  nrst                        : in std_logic
);
end smem; --}}}

architecture bhv of smem is

  -- 0..31: DATA, 32:45: ADDR, 46: we, 47: alu_enable, 48..58: rd_addr
  constant MEM_RQST_W : integer := DATA_W+SMEM_ADDR_W+1+1+REG_FILE_W;
    -- length of the memory request word
  constant MEM_RQST_DATA_LOW              : integer := 0;
    -- index of the data lsb within the memory request word
  constant MEM_RQST_DATA_HIGH             : integer := MEM_RQST_DATA_LOW+DATA_W-1;
    -- index of the data msb within the memory request word
  constant MEM_RQST_ADDR_LOW              : integer := MEM_RQST_DATA_HIGH+1;
    -- index of the global memory address lsb within the memory request word
  constant MEM_RQST_ADDR_HIGH             : integer := MEM_RQST_ADDR_LOW+SMEM_ADDR_W-1;
    -- index of the global memory address msb within the memory request word
  constant MEM_RQST_WE_POS                : integer := MEM_RQST_ADDR_HIGH+1;
    -- index of the the write-enable bit within the memory request word
  constant MEM_RQST_ALU_EN_POS            : integer := MEM_RQST_WE_POS+1;
    -- index of the alu enable bit within the memory request word
  constant MEM_RQST_RD_ADDR_LOW           : integer := MEM_RQST_ALU_EN_POS+1;
    -- index of the the register file address lsb within the memory request word
  constant MEM_RQST_RD_ADDR_HIGH          : integer := MEM_RQST_RD_ADDR_LOW+REG_FILE_W-1;
    -- index of the the register file address msb within the memory request word

  type mem_rqsts_fifo_type is array(natural range <>) of std_logic_vector(CV_SIZE*MEM_RQST_W-1 downto 0);
  type mem_rqsts_array is array(natural range <>) of std_logic_vector(MEM_RQST_W-1 downto 0);

  signal mem_rqsts_fifo                   : mem_rqsts_fifo_type(N_WF_CU*2**(PHASE_W)-1 downto 0) := (others => (others => '0'));
    -- memory requests FIFO
  attribute ram_style : string;
  attribute ram_style of mem_rqsts_fifo : signal is "distributed";

  signal mem_rqsts_fifo_we                : std_logic;
    -- write-enable of the memory request FIFO
  signal mem_rqsts_wrData                 : std_logic_vector(CV_SIZE*MEM_RQST_W-1 downto 0);
    -- write data in the memory request FIFO
  signal mem_rqsts_rdData_n               : std_logic_vector(CV_SIZE*MEM_RQST_W-1 downto 0);
    -- read data from the memory request FIFO
  signal mem_rqsts_rdData                 : std_logic_vector(CV_SIZE*MEM_RQST_W-1 downto 0);
    -- registered mem_rqsts_rdData_n
  signal mem_rqsts_rdData_vec             : mem_rqsts_array(CV_SIZE-1 downto 0);
    --
  signal mem_rqsts_rdAddr                 : unsigned(PHASE_W+N_WF_CU_W-1 downto 0);
    -- read address of the memory request FIFO
  signal mem_rqsts_rdAddr_inc_n           : std_logic;
    -- signal set high to increment the read address of the memory request FIFO
  signal mem_rqsts_wrAddr                 : unsigned(PHASE_W+N_WF_CU_W-1 downto 0);
    -- write address of the memory request FIFO
  signal mem_rqst_waiting_p0              : std_logic;
    -- signal high if there are memory requests to be served in the memory request FIFO
  signal mem_rqst_waiting                 : std_logic;
    -- registered mem_rqst_waiting_p0


  signal mem_rqsts_data, mem_rqsts_data_n : SLV32_ARRAY(CV_SIZE-1 downto 0);
    -- array used to store the data of the memory requests contained in a FIFO word
  signal mem_rqsts_addr, mem_rqsts_addr_n : smem_addr_t(CV_SIZE-1 downto 0);
    -- array used to store the address of the memory requests contained in a FIFO word
  signal mem_rqsts_we, mem_rqsts_we_n     : std_logic_vector(CV_SIZE-1 downto 0);
    -- array used to store the write-enable of the memory requests contained in a FIFO word
  signal mem_rqsts_alu_enable, mem_rqsts_alu_enable_n : std_logic_vector(CV_SIZE-1 downto 0);
    -- array used to store the alu enable of the memory requests contained in a FIFO word
  signal mem_rqsts_rd_addr, mem_rqsts_rd_addr_n : unsigned(REG_FILE_W - 1 downto 0);
    -- array used to store the rd address of the memory requests contained in a FIFO word
  signal mem_rqsts_wf_indx, mem_rqsts_wf_indx_n : std_logic_vector(N_WF_CU-1 downto 0);
    -- mem_rqsts_wf_indx(i) = '1' if the request comes from the i-th wf


  type smem_rqst_t is (get_rqst, process_rqst);
  signal st_rqst_smem, st_rqst_smem_n : smem_rqst_t;
    -- state of the FSM used to extract memory requests from the FIFO
  signal rqst_indx, rqst_indx_n, rqst_indx_d0 : integer range 0 to CV_SIZE-1;
    -- signal used to index the CV_SIZE requests contained in the memory request FIFO word

  type smemory_type is array (0 to 2**SMEM_ADDR_W-1) of std_logic_vector(DATA_W-1 downto 0);
  signal smemory        : smemory_type;
    -- shared memory
  signal smemory_rdData : std_logic_vector(DATA_W-1 downto 0);
    -- shared memory read data
  signal smemory_wrData, smemory_wrData_d0 : std_logic_vector(DATA_W-1 downto 0);
    -- shared memory write data
  signal smemory_we : std_logic;
    -- shared memory write enable
  signal smemory_offset, smemory_offset_d0 : integer range 0 to 2**SMEM_ADDR_W-1;
    -- shared memory address
  signal smem_finish_n, smem_finish_i : std_logic_vector(N_WF_CU-1 downto 0);
    -- smem_finish_i(i) = '1' when the i-th wf can exit the WAIT_SMEM_FINISH state

  signal reading_smem_i, reading_smem_d0 : std_logic;
    -- signal set to '1' when there are read requests to be served
  signal rdData_i, rdData_d0 : SLV32_ARRAY(CV_SIZE - 1 downto 0);
    -- data read during load operations
  signal rdData_v_i : std_logic;
    -- rdData valid
  signal rdData_alu_en_i : std_logic_vector(CV_SIZE - 1 downto 0);
    -- signal provided to the register file interface to generate the write-enable
  signal rdData_rd_addr_i : unsigned(REG_FILE_W - 1 downto 0);
    -- rd_addr provided to the register file
  signal read_rqst_cnt : integer range 0 to N_WF_CU*2**(PHASE_W);
    -- signal used to count the number of read requests to be served
  signal processed_fifo_word_n, processed_fifo_word : integer range 0 to 2**PHASE_W-1;
    -- signal used to count the number of processed fifo words of the current wf

begin

  smem_finish <= smem_finish_i;
  reading_smem <= reading_smem_i;
  rdData <= rdData_i;
  rdData_v <= rdData_v_i;
  rdData_alu_en <= rdData_alu_en_i;
  rdData_rd_addr <= rdData_rd_addr_i;

  -- Memory request FIFO ----------------------------------------------------------------------------------{{{
  process(clk)
  begin
    if rising_edge(clk) then
      if nrst = '0' then
        mem_rqsts_wrAddr    <= (others => '0');
        mem_rqsts_rdAddr    <= (others => '0');
        mem_rqsts_rdData    <= (others => '0');
        mem_rqsts_fifo_we   <= '0';
        mem_rqsts_wrData    <= (others => '0');
        mem_rqst_waiting_p0 <= '0';
        mem_rqst_waiting    <= '0';
      else

        if mem_rqsts_fifo_we = '1' then
          mem_rqsts_wrAddr <= mem_rqsts_wrAddr + 1;
        end if;
        if mem_rqsts_rdAddr_inc_n = '1' then
          mem_rqsts_rdAddr <= mem_rqsts_rdAddr + 1;
        end if;

        mem_rqsts_rdData <= mem_rqsts_rdData_n;

        mem_rqsts_fifo_we <= '0';
        if rqst = '1' then
          mem_rqsts_fifo_we <= '1';
        end if;

        for i in 0 to CV_SIZE-1 loop
          mem_rqsts_wrData(i*MEM_RQST_W+MEM_RQST_DATA_HIGH downto i*MEM_RQST_W+MEM_RQST_DATA_LOW) <= wrData(i);
          mem_rqsts_wrData(i*MEM_RQST_W+MEM_RQST_ADDR_HIGH downto i*MEM_RQST_W+MEM_RQST_ADDR_LOW) <= std_logic_vector(addr(i));
          mem_rqsts_wrData(i*MEM_RQST_W+MEM_RQST_WE_POS) <= we;
          mem_rqsts_wrData(i*MEM_RQST_W+MEM_RQST_ALU_EN_POS) <= alu_en(i);
          mem_rqsts_wrData(i*MEM_RQST_W+MEM_RQST_RD_ADDR_HIGH downto i*MEM_RQST_W+MEM_RQST_RD_ADDR_LOW) <= std_logic_vector(rd_addr);
        end loop;

        mem_rqst_waiting_p0 <= '0';
        if mem_rqsts_wrAddr /= mem_rqsts_rdAddr then
          mem_rqst_waiting_p0 <= '1';
        end if;
        mem_rqst_waiting <= mem_rqst_waiting_p0;

      end if;
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then

      mem_rqsts_rdData_n <= mem_rqsts_fifo(to_integer(mem_rqsts_rdAddr));

      if mem_rqsts_fifo_we = '1' then
        mem_rqsts_fifo(to_integer(mem_rqsts_wrAddr)) <= mem_rqsts_wrData;
      end if;

    end if;
  end process;

  mem_rqsts_rdData_vec_gen: for i in 0 to CV_SIZE-1 generate
    mem_rqsts_rdData_vec(i) <= mem_rqsts_rdData((i+1)*MEM_RQST_W-1 downto i*MEM_RQST_W);
  end generate;
  ---------------------------------------------------------------------------------------------------------}}}

  -- Shared Memory FSM ------------------------------------------------------------------------------------{{{
  st_smem_seq_proc: process(clk, nrst)

  begin

    if rising_edge(clk) then
      if nrst = '0' then
        st_rqst_smem <= get_rqst;
        mem_rqsts_data <= (others => (others => '0'));
        mem_rqsts_addr <= (others => (others => '0'));
        mem_rqsts_we <= (others => '0');
        mem_rqsts_alu_enable <= (others => '0');
        mem_rqsts_rd_addr <= (others => '0');
        mem_rqsts_wf_indx <= (others => '0');
        rqst_indx <= 0;
        processed_fifo_word <= 0;
        smem_finish_i <= (others => '0');
    else
        st_rqst_smem <= st_rqst_smem_n;
        mem_rqsts_data <= mem_rqsts_data_n;
        mem_rqsts_addr <= mem_rqsts_addr_n;
        mem_rqsts_we <= mem_rqsts_we_n;
        mem_rqsts_alu_enable <= mem_rqsts_alu_enable_n;
        mem_rqsts_rd_addr <= mem_rqsts_rd_addr_n;
        mem_rqsts_wf_indx <= mem_rqsts_wf_indx_n;
        rqst_indx <= rqst_indx_n;
        processed_fifo_word <= processed_fifo_word_n;
        smem_finish_i <= smem_finish_n;
      end if;
    end if;

  end process;

  st_smem_comb_proc: process(st_rqst_smem, rqst, mem_rqsts_data, mem_rqsts_addr, mem_rqsts_we, mem_rqsts_alu_enable, mem_rqsts_rd_addr, mem_rqsts_wf_indx, rqst_indx, mem_rqsts_rdData, mem_rqsts_rdData_vec, mem_rqst_waiting, smem_finish_i, processed_fifo_word)

  begin

    st_rqst_smem_n <= st_rqst_smem;
    mem_rqsts_data_n <= mem_rqsts_data;
    mem_rqsts_addr_n <= mem_rqsts_addr;
    mem_rqsts_we_n <= mem_rqsts_we;
    mem_rqsts_alu_enable_n <= mem_rqsts_alu_enable;
    mem_rqsts_rd_addr_n <= mem_rqsts_rd_addr;
    mem_rqsts_wf_indx_n <= mem_rqsts_wf_indx;
    rqst_indx_n <= rqst_indx;
    processed_fifo_word_n <= processed_fifo_word;
    mem_rqsts_rdAddr_inc_n <= '0';
    smem_finish_n <= (others => '0');

    case st_rqst_smem is

      when get_rqst =>

        for i in 0 to CV_SIZE-1 loop
          mem_rqsts_data_n(i) <= mem_rqsts_rdData_vec(i)(MEM_RQST_DATA_HIGH downto MEM_RQST_DATA_LOW);
          mem_rqsts_addr_n(i) <= unsigned(mem_rqsts_rdData_vec(i)(MEM_RQST_ADDR_HIGH downto MEM_RQST_ADDR_LOW));
          mem_rqsts_we_n(i) <= mem_rqsts_rdData_vec(i)(MEM_RQST_WE_POS);
          mem_rqsts_alu_enable_n(i) <= mem_rqsts_rdData_vec(i)(MEM_RQST_ALU_EN_POS);
        end loop;

        mem_rqsts_wf_indx_n <= (others => '0');
        mem_rqsts_wf_indx_n(to_integer(unsigned(mem_rqsts_rdData_vec(0)(MEM_RQST_RD_ADDR_LOW+WI_REG_ADDR_W+N_WF_CU_W-1 downto MEM_RQST_RD_ADDR_LOW+WI_REG_ADDR_W)))) <= '1';
        mem_rqsts_rd_addr_n <= unsigned(mem_rqsts_rdData_vec(0)(MEM_RQST_RD_ADDR_HIGH downto MEM_RQST_RD_ADDR_LOW));

        if mem_rqst_waiting = '1' then
          st_rqst_smem_n <= process_rqst;
          mem_rqsts_rdAddr_inc_n <= '1';
        end if;

      when process_rqst =>

        if (rqst_indx = CV_SIZE-1) then
          rqst_indx_n <= 0;
          -- st_rqst_smem_n <= get_rqst;

          if (processed_fifo_word = 2**PHASE_W-1) then
            processed_fifo_word_n <= 0;

            for i in 0 to N_WF_CU-1 loop
              if (mem_rqsts_wf_indx(i) = '1') then
                smem_finish_n(i) <= '1';
              end if;
            end loop;

          else
            processed_fifo_word_n <= processed_fifo_word +1;
          end if;

          for i in 0 to CV_SIZE-1 loop
            mem_rqsts_data_n(i) <= mem_rqsts_rdData_vec(i)(MEM_RQST_DATA_HIGH downto MEM_RQST_DATA_LOW);
            mem_rqsts_addr_n(i) <= unsigned(mem_rqsts_rdData_vec(i)(MEM_RQST_ADDR_HIGH downto MEM_RQST_ADDR_LOW));
            mem_rqsts_we_n(i) <= mem_rqsts_rdData_vec(i)(MEM_RQST_WE_POS);
            mem_rqsts_alu_enable_n(i) <= mem_rqsts_rdData_vec(i)(MEM_RQST_ALU_EN_POS);
          end loop;

          mem_rqsts_wf_indx_n <= (others => '0');
          mem_rqsts_wf_indx_n(to_integer(unsigned(mem_rqsts_rdData_vec(0)(MEM_RQST_RD_ADDR_LOW+WI_REG_ADDR_W+N_WF_CU_W-1 downto MEM_RQST_RD_ADDR_LOW+WI_REG_ADDR_W)))) <= '1';
          mem_rqsts_rd_addr_n <= unsigned(mem_rqsts_rdData_vec(0)(MEM_RQST_RD_ADDR_HIGH downto MEM_RQST_RD_ADDR_LOW));

          if mem_rqst_waiting = '1' then
            mem_rqsts_rdAddr_inc_n <= '1';
          else
            -- smem_finish_n(0) <= '1';
            -- smem_finish_n(N_WF_CU-1 downto 1) <= (others => '0');
            st_rqst_smem_n <= get_rqst;
          end if;

        else
          rqst_indx_n <= rqst_indx + 1;
        end if;

    end case;

  end process;
  ---------------------------------------------------------------------------------------------------------}}}

  -- Read and write logic ---------------------------------------------------------------------------------{{{
  seq_proc: process(clk, nrst)
  begin
    if rising_edge(clk) then
      if nrst = '0' then
        rdData_v_i <= '0';
        rdData_alu_en_i <= (others => '0');
        rdData_rd_addr_i <= (others => '0');
        smemory_offset_d0 <= 0;
      else

        rdData_v_i <= '0';

        if (rqst_indx = CV_SIZE-1 and mem_rqsts_we(rqst_indx) = '0') then
          rdData_v_i <= '1';
        end if;

        rdData_rd_addr_i <= mem_rqsts_rd_addr;
        rdData_alu_en_i <= mem_rqsts_alu_enable;

        smemory_offset_d0 <= smemory_offset;

      end if;
    end if;
  end process;

  comb_proc: process(smemory_rdData, rqst_indx_d0, rdData_d0, mem_rqsts_data, rqst_indx, smemory_wrData_d0, st_rqst_smem, mem_rqsts_we, mem_rqsts_alu_enable, mem_rqsts_wf_indx, num_wg_per_cu, smemory_offset_d0, wf_distribution_on_wg)
  begin

    rdData_i <= rdData_d0;

    for i in 0 to CV_SIZE-1 loop
        if (rqst_indx_d0 = i) then
        rdData_i(i) <= smemory_rdData;
      end if;
    end loop;

    smemory_wrData <= smemory_wrData_d0;

    for i in 0 to CV_SIZE-1 loop
      if (rqst_indx = i) then
        smemory_wrData <= mem_rqsts_data(i);
      end if;
    end loop;

    smemory_we <= '0';

    if (st_rqst_smem = process_rqst and mem_rqsts_we(rqst_indx) = '1' and mem_rqsts_alu_enable(rqst_indx) = '1') then
      smemory_we <= '1';
    end if;

    smemory_offset <= smemory_offset_d0;

    for i in 0 to N_WF_CU-1 loop
      if (mem_rqsts_wf_indx(i) = '1') then
          if (num_wg_per_cu = "1000") then -- 8 WG
            smemory_offset <= ((2**SMEM_ADDR_W)/8)*to_integer(wf_distribution_on_wg(i));
          elsif (num_wg_per_cu = "0100") then -- 4 WG
            smemory_offset <= ((2**SMEM_ADDR_W)/4)*to_integer(wf_distribution_on_wg(i));
          elsif (num_wg_per_cu = "0010") then -- 2 WG
            smemory_offset <= ((2**SMEM_ADDR_W)/2)*to_integer(wf_distribution_on_wg(i));
          else -- 1 WG
            smemory_offset <= 0;
          end if;
      end if;
    end loop;

  end process;
  ---------------------------------------------------------------------------------------------------------}}}

  -- Shared memory ----------------------------------------------------------------------------------------{{{
  process(clk)
  begin

    if rising_edge(clk) then

      -- smemory_rdData <= smemory(to_integer(mem_rqsts_addr(rqst_indx)));
      smemory_rdData <= smemory(to_integer(mem_rqsts_addr(rqst_indx)) + smemory_offset);

      if smemory_we = '1' then
        -- smemory(to_integer(mem_rqsts_addr(rqst_indx))) <= smemory_wrData;
        smemory(to_integer(mem_rqsts_addr(rqst_indx)) + smemory_offset) <= smemory_wrData;
      end if;

    end if;
  end process;
  ---------------------------------------------------------------------------------------------------------}}}

  -- read request counter ---------------------------------------------------------------------------------{{{
  reading_smem_i <= '1' when rqst = '1' and we = '0' else -- set to '1' when receving a read request
                    '0' when read_rqst_cnt = 0 else -- set to '0' when all writing requests have been served
                    reading_smem_d0;

  read_rqst_cnt_proc: process(clk)
  begin
    if rising_edge(clk) then
      if nrst = '0' then
        read_rqst_cnt <= 0;
      else

        if (rqst = '1' and we = '0') then
          read_rqst_cnt <= read_rqst_cnt + 1;
        end if;

        if (rdData_v_i = '1') then
          read_rqst_cnt <= read_rqst_cnt - 1;
        end if;

        if (rqst = '1' and we = '0') and (rdData_v_i = '1') then
          read_rqst_cnt <= read_rqst_cnt;
        end if;

      end if;
    end if;
  end process;
  ---------------------------------------------------------------------------------------------------------}}}

  -- pipes  -----------------------------------------------------------------------------------------------{{{
  process(clk, nrst)
  begin
    if rising_edge(clk) then
      if nrst = '0' then
        rdData_d0 <= (others => (others => '0'));
        smemory_wrData_d0 <= (others => '0');
        reading_smem_d0 <= '0';
        rqst_indx_d0 <= 0;
      else
        rdData_d0 <= rdData_i;
        smemory_wrData_d0 <= smemory_wrData;
        reading_smem_d0 <= reading_smem_i;
        rqst_indx_d0 <= rqst_indx;
      end if;
    end if;
  end process;
  ---------------------------------------------------------------------------------------------------------}}}

end architecture;
