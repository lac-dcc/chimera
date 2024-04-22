--*********************************************************************
-- SDRAM, single-port, instantiated.
--*********************************************************************

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use work.ClkgenPckg.all;     -- For the clock generator module.
use work.SdramCntlPckg.all;  -- For the SDRAM controller module.
use work.HostIoPckg.HostIoToDut;     -- For the FPGA<=>PC transfer link module.

entity SdramSPInst is
  port (
    fpgaClk_i : in    std_logic;  -- 12 MHz clock input from external clock source.
    sdClk_o   : out   std_logic;  -- 100 MHz clock to SDRAM.
    sdClkFb_i : in    std_logic;  -- 100 MHz clock fed back into FPGA.
    sdCke_o   : out   std_logic;  -- SDRAM clock enable.
    sdCe_bo   : out   std_logic;  -- SDRAM chip-enable.
    sdRas_bo  : out   std_logic;  -- SDRAM row address strobe.
    sdCas_bo  : out   std_logic;  -- SDRAM column address strobe.
    sdWe_bo   : out   std_logic;  -- SDRAM write-enable.
    sdBs_o    : out   std_logic_vector(1 downto 0);  -- SDRAM bank-address.
    sdAddr_o  : out   std_logic_vector(12 downto 0);  -- SDRAM address bus.
    sdData_io : inout std_logic_vector(15 downto 0);    -- SDRAM data bus.
    sdDqmh_o  : out   std_logic;  -- SDRAM high-byte databus qualifier.
    sdDqml_o  : out   std_logic  -- SDRAM low-byte databus qualifier.
    );
end entity;

architecture Behavioral of SdramSPInst is
  constant NO                     : std_logic := '0';
  constant YES                    : std_logic := '1';
  constant RAM_SIZE_C             : natural   := 256;  -- Number of words in RAM.
  constant RAM_WIDTH_C            : natural   := 16;  -- Width of RAM words.
  constant MIN_ADDR_C             : natural   := 1;  -- Process RAM from this address ...
  constant MAX_ADDR_C             : natural   := 5;  -- ... to this address.
  subtype RamWord_t is unsigned(RAM_WIDTH_C-1 downto 0);  -- RAM word type.
  signal clk_s                    : std_logic;  -- Internal clock.
  signal wr_s                     : std_logic;  -- Write-enable control.
  signal rd_s                     : std_logic;  -- Read-enable control.
  signal done_s                   : std_logic;  -- SDRAM R/W operation done signal.
  signal addr_r, addr_x           : natural range 0 to RAM_SIZE_C-1;  -- RAM address.
  signal dataToRam_r, dataToRam_x : RamWord_t;  -- Data to write to RAM.
  signal dataFromRam_s            : RamWord_t;  -- Data read from RAM.
  -- Convert the busses for connection to the SDRAM controller.
  signal addrSdram_s              : std_logic_vector(23 downto 0);  -- Address.
  signal dataToSdram_s            : std_logic_vector(sdData_io'range);  -- Data.
  signal dataFromSdram_s          : std_logic_vector(sdData_io'range);  -- Data.
  -- FSM state.
  type state_t is (INIT, WRITE_DATA, READ_AND_SUM_DATA, DONE);  -- FSM states.
  signal state_r, state_x         : state_t   := INIT;  -- FSM starts off in init state.
  signal sum_r, sum_x             : natural range 0 to RAM_SIZE_C * (2**RAM_WIDTH_C) - 1;
  signal sumDut_s                 : std_logic_vector(15 downto 0);  -- Send sum back to PC.
  signal nullDutOut_s             : std_logic_vector(0 downto 0);  -- Dummy output for HostIo module.
begin

  --*********************************************************************
  -- Generate a 100 MHz clock from the 12 MHz input clock and send it out
  -- to the SDRAM. Then feed it back in to clock the internal logic.
  -- (The Spartan-6 FPGAs are a bit picky about what their DCM outputs
  -- are allowed to drive, so I have to use the clkToLogic_o output to
  -- send the clock signal to the output pin of the FPGA and on to the
  -- SDRAM chip.)
  --*********************************************************************
  Clkgen_u1 : Clkgen
    generic map (BASE_FREQ_G => 12.0, CLK_MUL_G => 25, CLK_DIV_G => 3)
    port map(I               => fpgaClk_i, clkToLogic_o => sdClk_o);
  clk_s <= sdClkFb_i;                   -- SDRAM clock feeds back into FPGA.

  --*********************************************************************
  -- Instantiate the SDRAM controller that connects to the FSM
  -- and interfaces to the external SDRAM chip.
  --*********************************************************************
  SdramCntl_u0 : SdramCntl
    generic map(
      FREQ_G       => 100.0,  -- Use clock freq. to compute timing parameters.
      DATA_WIDTH_G => RAM_WIDTH_C       -- Width of data words.
      )
    port map(
      clk_i     => clk_s,
      -- FSM side.
      rd_i      => rd_s,
      wr_i      => wr_s,
      done_o    => done_s,
      addr_i    => addrSdram_s,
      data_i    => dataToSdram_s,
      data_o    => dataFromSdram_s,
      -- SDRAM side.
      sdCke_o   => sdCke_o, -- SDRAM clock-enable pin is connected on the XuLA2.
      sdCe_bo   => sdCe_bo, -- SDRAM chip-enable is connected on the XuLA2.
      sdRas_bo  => sdRas_bo,
      sdCas_bo  => sdCas_bo,
      sdWe_bo   => sdWe_bo,
      sdBs_o    => sdBs_o, -- Both SDRAM bank selects are connected on the XuLA2.
      sdAddr_o  => sdAddr_o,
      sdData_io => sdData_io,
      sdDqmh_o  => sdDqmh_o, -- SDRAM high-byte databus qualifier is connected on the XuLA2.
      sdDqml_o  => sdDqml_o  -- SDRAM low-byte databus qualifier is connected on the XuLA2.
      );

  -- Connect the SDRAM controller signals to the FSM signals.     
  dataToSdram_s <= std_logic_vector(dataToRam_r);
  dataFromRam_s <= RamWord_t(dataFromSdram_s);
  addrSdram_s   <= std_logic_vector(TO_UNSIGNED(addr_r, addrSdram_s'length));

  --*********************************************************************
  -- State machine that initializes RAM and then reads RAM to compute
  -- the sum of products of the RAM address and data. This section
  -- is combinatorial logic that sets the control bits for each state 
  -- and determines the next state.
  --*********************************************************************
  FsmComb_p : process(state_r, addr_r, dataToRam_r,
                      sum_r, dataFromRam_s, done_s)
  begin
    -- Disable RAM reads and writes by default.
    rd_s        <= NO;                  -- Don't write to RAM.
    wr_s        <= NO;                  -- Don't read from RAM.
    -- Load the registers with their current values by default.
    addr_x      <= addr_r;
    sum_x       <= sum_r;
    dataToRam_x <= dataToRam_r;
    state_x     <= state_r;

    case state_r is

      when INIT =>                      -- Initialize the FSM.
        addr_x      <= MIN_ADDR_C;      -- Start writing data at this address.
        dataToRam_x <= TO_UNSIGNED(1, RAM_WIDTH_C);  -- Initial value to write.
        state_x     <= WRITE_DATA;      -- Go to next state.

      when WRITE_DATA =>                -- Load RAM with values.
        if done_s = NO then  -- While current RAM write is not complete ...
          wr_s <= YES;                  -- keep write-enable active.
        elsif addr_r < MAX_ADDR_C then  -- If haven't reach final address ...
          addr_x      <= addr_r + 1;    -- go to next address ...
          dataToRam_x <= dataToRam_r + 3;  -- and write this value.
        else                 -- Else, the final address has been written ...
          addr_x  <= MIN_ADDR_C;        -- go back to the start, ...
          sum_x   <= 0;                 -- clear the sum-of-products, ...
          state_x <= READ_AND_SUM_DATA;    -- and go to next state.
        end if;

      when READ_AND_SUM_DATA =>  -- Read RAM and sum address*data products
        if done_s = NO then      -- While current RAM read is not complete ...
          rd_s <= YES;                  -- keep read-enable active.
        elsif addr_r <= MAX_ADDR_C then  -- If not the final address ...
          -- add product of previous RAM address and data read 
          -- from that address to the summation ...
          sum_x  <= sum_r + TO_INTEGER(dataFromRam_s * addr_r);
          addr_x <= addr_r + 1;         -- and go to next address.
          if addr_r = MAX_ADDR_C then  -- Else, the final address has been read ...
            state_x <= DONE;            -- so go to the next state.
          end if;
        end if;

      when DONE =>                      -- Summation complete ...
        null;                           -- so wait here and do nothing.
      when others =>                    -- Erroneous state ...
        state_x <= INIT;                -- so re-run the entire process.
        
    end case;

  end process;

  --*********************************************************************
  -- Update the FSM's registers with their next values as computed by
  -- the FSM's combinatorial section.       
  --*********************************************************************
  FsmUpdate_p : process(clk_s)
  begin
    if rising_edge(clk_s) then
      addr_r      <= addr_x;
      dataToRam_r <= dataToRam_x;
      state_r     <= state_x;
      sum_r       <= sum_x;
    end if;
  end process;

  --*********************************************************************
  -- Send the summation to the HostIoToDut module and then on to the PC.
  --*********************************************************************
  sumDut_s <= std_logic_vector(TO_UNSIGNED(sum_r, 16));
  HostIoToDut_u2 : HostIoToDut
    generic map (SIMPLE_G => true)
    port map (
      vectorFromDut_i => sumDut_s,
      vectorToDut_o   => nullDutOut_s
      );

end architecture;
