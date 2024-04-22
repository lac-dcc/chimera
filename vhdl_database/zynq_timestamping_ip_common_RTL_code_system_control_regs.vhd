-- -----------------------------------------------------------------------------
-- 'system_control' Register Component
-- Revision: 55
-- -----------------------------------------------------------------------------
-- Generated on 2022-03-17 at 10:02 (UTC) by airhdl version 2022.03.1-114
-- -----------------------------------------------------------------------------
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
-- AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
-- IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
-- ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
-- LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
-- CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
-- SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
-- INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
-- CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
-- ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
-- POSSIBILITY OF SUCH DAMAGE.
-- -----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.system_control_regs_pkg.all;

entity system_control_regs is
    generic(
        AXI_ADDR_WIDTH : integer := 32;  -- width of the AXI address bus
        BASEADDR : std_logic_vector(31 downto 0) := x"00000000" -- the register file's system base address
    );
    port(
        -- Clock and Reset
        axi_aclk    : in  std_logic;
        axi_aresetn : in  std_logic;
        -- AXI Write Address Channel
        s_axi_awaddr  : in  std_logic_vector(AXI_ADDR_WIDTH - 1 downto 0);
        s_axi_awprot  : in  std_logic_vector(2 downto 0); -- sigasi @suppress "Unused port"
        s_axi_awvalid : in  std_logic;
        s_axi_awready : out std_logic;
        -- AXI Write Data Channel
        s_axi_wdata   : in  std_logic_vector(31 downto 0);
        s_axi_wstrb   : in  std_logic_vector(3 downto 0);
        s_axi_wvalid  : in  std_logic;
        s_axi_wready  : out std_logic;
        -- AXI Read Address Channel
        s_axi_araddr  : in  std_logic_vector(AXI_ADDR_WIDTH - 1 downto 0);
        s_axi_arprot  : in  std_logic_vector(2 downto 0); -- sigasi @suppress "Unused port"
        s_axi_arvalid : in  std_logic;
        s_axi_arready : out std_logic;
        -- AXI Read Data Channel
        s_axi_rdata   : out std_logic_vector(31 downto 0);
        s_axi_rresp   : out std_logic_vector(1 downto 0);
        s_axi_rvalid  : out std_logic;
        s_axi_rready  : in  std_logic;
        -- AXI Write Response Channel
        s_axi_bresp   : out std_logic_vector(1 downto 0);
        s_axi_bvalid  : out std_logic;
        s_axi_bready  : in  std_logic;
        -- User Ports
        user2regs     : in user2regs_t;
        regs2user     : out regs2user_t
    );
end entity system_control_regs;

architecture RTL of system_control_regs is

    -- Constants
    constant AXI_OKAY           : std_logic_vector(1 downto 0) := "00";
    constant AXI_DECERR         : std_logic_vector(1 downto 0) := "11";

    -- Registered signals
    signal s_axi_awready_r    : std_logic;
    signal s_axi_wready_r     : std_logic;
    signal s_axi_awaddr_reg_r : unsigned(s_axi_awaddr'range);
    signal s_axi_bvalid_r     : std_logic;
    signal s_axi_bresp_r      : std_logic_vector(s_axi_bresp'range);
    signal s_axi_arready_r    : std_logic;
    signal s_axi_araddr_reg_r : unsigned(AXI_ADDR_WIDTH - 1 downto 0);
    signal s_axi_rvalid_r     : std_logic;
    signal s_axi_rresp_r      : std_logic_vector(s_axi_rresp'range);
    signal s_axi_wdata_reg_r  : std_logic_vector(s_axi_wdata'range);
    signal s_axi_wstrb_reg_r  : std_logic_vector(s_axi_wstrb'range);
    signal s_axi_rdata_r      : std_logic_vector(s_axi_rdata'range);

    -- User-defined registers
    signal s_system_control_id_strobe_r : std_logic;
    signal s_reg_system_control_id_id : std_logic_vector(31 downto 0);
    signal s_system_control_adc_fsm_status_strobe_r : std_logic;
    signal s_reg_system_control_adc_fsm_status_value : std_logic_vector(31 downto 0);
    signal s_system_control_dac_fsm_status_strobe_r : std_logic;
    signal s_reg_system_control_dac_fsm_status_value : std_logic_vector(31 downto 0);
    signal s_system_control_dac_late_flag_strobe_r : std_logic;
    signal s_reg_system_control_dac_late_flag_value : std_logic_vector(31 downto 0);

begin

    ----------------------------------------------------------------------------
    -- Inputs
    --
    s_reg_system_control_id_id <= user2regs.system_control_id_id;
    s_reg_system_control_adc_fsm_status_value <= user2regs.system_control_adc_fsm_status_value;
    s_reg_system_control_dac_fsm_status_value <= user2regs.system_control_dac_fsm_status_value;
    s_reg_system_control_dac_late_flag_value <= user2regs.system_control_dac_late_flag_value;

    ----------------------------------------------------------------------------
    -- Read-transaction FSM
    --
    read_fsm : process(axi_aclk, axi_aresetn) is
        constant MAX_MEMORY_LATENCY : natural := 5;
        type t_state is (IDLE, READ_REGISTER, WAIT_MEMORY_RDATA, READ_RESPONSE, DONE);
        -- registered state variables
        variable v_state_r          : t_state;
        variable v_rdata_r          : std_logic_vector(31 downto 0);
        variable v_rresp_r          : std_logic_vector(s_axi_rresp'range);
        variable v_mem_wait_count_r : natural range 0 to MAX_MEMORY_LATENCY;
        -- combinatorial helper variables
        variable v_addr_hit : boolean;
        variable v_mem_addr : unsigned(AXI_ADDR_WIDTH-1 downto 0);
    begin
        if axi_aresetn = '0' then
            v_state_r          := IDLE;
            v_rdata_r          := (others => '0');
            v_rresp_r          := (others => '0');
            v_mem_wait_count_r := 0;
            s_axi_arready_r    <= '0';
            s_axi_rvalid_r     <= '0';
            s_axi_rresp_r      <= (others => '0');
            s_axi_araddr_reg_r <= (others => '0');
            s_axi_rdata_r      <= (others => '0');
            s_system_control_id_strobe_r <= '0';
            s_system_control_adc_fsm_status_strobe_r <= '0';
            s_system_control_dac_fsm_status_strobe_r <= '0';
            s_system_control_dac_late_flag_strobe_r <= '0';

        elsif rising_edge(axi_aclk) then
            -- Default values:
            s_axi_arready_r <= '0';
            s_system_control_id_strobe_r <= '0';
            s_system_control_adc_fsm_status_strobe_r <= '0';
            s_system_control_dac_fsm_status_strobe_r <= '0';
            s_system_control_dac_late_flag_strobe_r <= '0';

            case v_state_r is

                -- Wait for the start of a read transaction, which is
                -- initiated by the assertion of ARVALID
                when IDLE =>
                    if s_axi_arvalid = '1' then
                        s_axi_araddr_reg_r <= unsigned(s_axi_araddr); -- save the read address
                        s_axi_arready_r    <= '1'; -- acknowledge the read-address
                        v_state_r          := READ_REGISTER;
                    end if;

                -- Read from the actual storage element
                when READ_REGISTER =>
                    -- defaults:
                    v_addr_hit := false;
                    v_rdata_r  := (others => '0');

                    -- register 'SYSTEM_CONTROL_ID' at address offset 0x4
                    if s_axi_araddr_reg_r(AXI_ADDR_WIDTH-1 downto 2) = resize(unsigned(BASEADDR(AXI_ADDR_WIDTH-1 downto 2)) + SYSTEM_CONTROL_ID_OFFSET(AXI_ADDR_WIDTH-1 downto 2), AXI_ADDR_WIDTH-2) then
                        v_addr_hit := true;
                        v_rdata_r(31 downto 0) := s_reg_system_control_id_id;
                        s_system_control_id_strobe_r <= '1';
                        v_state_r := READ_RESPONSE;
                    end if;
                    -- register 'SYSTEM_CONTROL_ADC_FSM_STATUS' at address offset 0x8
                    if s_axi_araddr_reg_r(AXI_ADDR_WIDTH-1 downto 2) = resize(unsigned(BASEADDR(AXI_ADDR_WIDTH-1 downto 2)) + SYSTEM_CONTROL_ADC_FSM_STATUS_OFFSET(AXI_ADDR_WIDTH-1 downto 2), AXI_ADDR_WIDTH-2) then
                        v_addr_hit := true;
                        v_rdata_r(31 downto 0) := s_reg_system_control_adc_fsm_status_value;
                        s_system_control_adc_fsm_status_strobe_r <= '1';
                        v_state_r := READ_RESPONSE;
                    end if;
                    -- register 'SYSTEM_CONTROL_DAC_FSM_STATUS' at address offset 0xC
                    if s_axi_araddr_reg_r(AXI_ADDR_WIDTH-1 downto 2) = resize(unsigned(BASEADDR(AXI_ADDR_WIDTH-1 downto 2)) + SYSTEM_CONTROL_DAC_FSM_STATUS_OFFSET(AXI_ADDR_WIDTH-1 downto 2), AXI_ADDR_WIDTH-2) then
                        v_addr_hit := true;
                        v_rdata_r(31 downto 0) := s_reg_system_control_dac_fsm_status_value;
                        s_system_control_dac_fsm_status_strobe_r <= '1';
                        v_state_r := READ_RESPONSE;
                    end if;
                    -- register 'SYSTEM_CONTROL_DAC_LATE_FLAG' at address offset 0x10
                    if s_axi_araddr_reg_r(AXI_ADDR_WIDTH-1 downto 2) = resize(unsigned(BASEADDR(AXI_ADDR_WIDTH-1 downto 2)) + SYSTEM_CONTROL_DAC_LATE_FLAG_OFFSET(AXI_ADDR_WIDTH-1 downto 2), AXI_ADDR_WIDTH-2) then
                        v_addr_hit := true;
                        v_rdata_r(31 downto 0) := s_reg_system_control_dac_late_flag_value;
                        s_system_control_dac_late_flag_strobe_r <= '1';
                        v_state_r := READ_RESPONSE;
                    end if;
                    --
                    if v_addr_hit then
                        v_rresp_r := AXI_OKAY;
                    else
                        v_rresp_r := AXI_DECERR;
                        -- pragma translate_off
                        report "ARADDR decode error" severity warning;
                        -- pragma translate_on
                        v_state_r := READ_RESPONSE;
                    end if;

                -- Wait for memory read data
                when WAIT_MEMORY_RDATA =>
                    if v_mem_wait_count_r = 0 then
                        v_state_r      := READ_RESPONSE;
                    else
                        v_mem_wait_count_r := v_mem_wait_count_r - 1;
                    end if;

                -- Generate read response
                when READ_RESPONSE =>
                    s_axi_rvalid_r <= '1';
                    s_axi_rresp_r  <= v_rresp_r;
                    s_axi_rdata_r  <= v_rdata_r;
                    --
                    v_state_r      := DONE;

                -- Write transaction completed, wait for master RREADY to proceed
                when DONE =>
                    if s_axi_rready = '1' then
                        s_axi_rvalid_r <= '0';
                        s_axi_rdata_r   <= (others => '0');
                        v_state_r      := IDLE;
                    end if;
            end case;
        end if;
    end process read_fsm;

    ----------------------------------------------------------------------------
    -- Write-transaction FSM
    --
    write_fsm : process(axi_aclk, axi_aresetn) is
        type t_state is (IDLE, ADDR_FIRST, DATA_FIRST, UPDATE_REGISTER, DONE);
        variable v_state_r  : t_state;
        variable v_addr_hit : boolean;
        variable v_mem_addr : unsigned(AXI_ADDR_WIDTH-1 downto 0);
    begin
        if axi_aresetn = '0' then
            v_state_r          := IDLE;
            s_axi_awready_r    <= '0';
            s_axi_wready_r     <= '0';
            s_axi_awaddr_reg_r <= (others => '0');
            s_axi_wdata_reg_r  <= (others => '0');
            s_axi_wstrb_reg_r  <= (others => '0');
            s_axi_bvalid_r     <= '0';
            s_axi_bresp_r      <= (others => '0');
            --

        elsif rising_edge(axi_aclk) then
            -- Default values:
            s_axi_awready_r <= '0';
            s_axi_wready_r  <= '0';

            case v_state_r is

                -- Wait for the start of a write transaction, which may be
                -- initiated by either of the following conditions:
                --   * assertion of both AWVALID and WVALID
                --   * assertion of AWVALID
                --   * assertion of WVALID
                when IDLE =>
                    if s_axi_awvalid = '1' and s_axi_wvalid = '1' then
                        s_axi_awaddr_reg_r <= unsigned(s_axi_awaddr); -- save the write-address
                        s_axi_awready_r    <= '1'; -- acknowledge the write-address
                        s_axi_wdata_reg_r  <= s_axi_wdata; -- save the write-data
                        s_axi_wstrb_reg_r  <= s_axi_wstrb; -- save the write-strobe
                        s_axi_wready_r     <= '1'; -- acknowledge the write-data
                        v_state_r          := UPDATE_REGISTER;
                    elsif s_axi_awvalid = '1' then
                        s_axi_awaddr_reg_r <= unsigned(s_axi_awaddr); -- save the write-address
                        s_axi_awready_r    <= '1'; -- acknowledge the write-address
                        v_state_r          := ADDR_FIRST;
                    elsif s_axi_wvalid = '1' then
                        s_axi_wdata_reg_r <= s_axi_wdata; -- save the write-data
                        s_axi_wstrb_reg_r <= s_axi_wstrb; -- save the write-strobe
                        s_axi_wready_r    <= '1'; -- acknowledge the write-data
                        v_state_r         := DATA_FIRST;
                    end if;

                -- Address-first write transaction: wait for the write-data
                when ADDR_FIRST =>
                    if s_axi_wvalid = '1' then
                        s_axi_wdata_reg_r <= s_axi_wdata; -- save the write-data
                        s_axi_wstrb_reg_r <= s_axi_wstrb; -- save the write-strobe
                        s_axi_wready_r    <= '1'; -- acknowledge the write-data
                        v_state_r         := UPDATE_REGISTER;
                    end if;

                -- Data-first write transaction: wait for the write-address
                when DATA_FIRST =>
                    if s_axi_awvalid = '1' then
                        s_axi_awaddr_reg_r <= unsigned(s_axi_awaddr); -- save the write-address
                        s_axi_awready_r    <= '1'; -- acknowledge the write-address
                        v_state_r          := UPDATE_REGISTER;
                    end if;

                -- Update the actual storage element
                when UPDATE_REGISTER =>
                    s_axi_bresp_r               <= AXI_OKAY; -- default value, may be overriden in case of decode error
                    s_axi_bvalid_r              <= '1';
                    --
                    v_addr_hit := false;
                    --
                    if not v_addr_hit then
                        s_axi_bresp_r <= AXI_DECERR;
                        -- pragma translate_off
                        report "AWADDR decode error" severity warning;
                        -- pragma translate_on
                    end if;
                    --
                    v_state_r := DONE;

                -- Write transaction completed, wait for master BREADY to proceed
                when DONE =>
                    if s_axi_bready = '1' then
                        s_axi_bvalid_r <= '0';
                        v_state_r      := IDLE;
                    end if;

            end case;


        end if;
    end process write_fsm;

    ----------------------------------------------------------------------------
    -- Outputs
    --
    s_axi_awready <= s_axi_awready_r;
    s_axi_wready  <= s_axi_wready_r;
    s_axi_bvalid  <= s_axi_bvalid_r;
    s_axi_bresp   <= s_axi_bresp_r;
    s_axi_arready <= s_axi_arready_r;
    s_axi_rvalid  <= s_axi_rvalid_r;
    s_axi_rresp   <= s_axi_rresp_r;
    s_axi_rdata   <= s_axi_rdata_r;

    regs2user.system_control_id_strobe <= s_system_control_id_strobe_r;
    regs2user.system_control_adc_fsm_status_strobe <= s_system_control_adc_fsm_status_strobe_r;
    regs2user.system_control_dac_fsm_status_strobe <= s_system_control_dac_fsm_status_strobe_r;
    regs2user.system_control_dac_late_flag_strobe <= s_system_control_dac_late_flag_strobe_r;

end architecture RTL;