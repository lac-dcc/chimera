-- -----------------------------------------------------------------------------
-- 'system_control' Register Definitions
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

package system_control_regs_pkg is

    -- Type definitions
    type slv1_array_t is array(natural range <>) of std_logic_vector(0 downto 0);
    type slv2_array_t is array(natural range <>) of std_logic_vector(1 downto 0);
    type slv3_array_t is array(natural range <>) of std_logic_vector(2 downto 0);
    type slv4_array_t is array(natural range <>) of std_logic_vector(3 downto 0);
    type slv5_array_t is array(natural range <>) of std_logic_vector(4 downto 0);
    type slv6_array_t is array(natural range <>) of std_logic_vector(5 downto 0);
    type slv7_array_t is array(natural range <>) of std_logic_vector(6 downto 0);
    type slv8_array_t is array(natural range <>) of std_logic_vector(7 downto 0);
    type slv9_array_t is array(natural range <>) of std_logic_vector(8 downto 0);
    type slv10_array_t is array(natural range <>) of std_logic_vector(9 downto 0);
    type slv11_array_t is array(natural range <>) of std_logic_vector(10 downto 0);
    type slv12_array_t is array(natural range <>) of std_logic_vector(11 downto 0);
    type slv13_array_t is array(natural range <>) of std_logic_vector(12 downto 0);
    type slv14_array_t is array(natural range <>) of std_logic_vector(13 downto 0);
    type slv15_array_t is array(natural range <>) of std_logic_vector(14 downto 0);
    type slv16_array_t is array(natural range <>) of std_logic_vector(15 downto 0);
    type slv17_array_t is array(natural range <>) of std_logic_vector(16 downto 0);
    type slv18_array_t is array(natural range <>) of std_logic_vector(17 downto 0);
    type slv19_array_t is array(natural range <>) of std_logic_vector(18 downto 0);
    type slv20_array_t is array(natural range <>) of std_logic_vector(19 downto 0);
    type slv21_array_t is array(natural range <>) of std_logic_vector(20 downto 0);
    type slv22_array_t is array(natural range <>) of std_logic_vector(21 downto 0);
    type slv23_array_t is array(natural range <>) of std_logic_vector(22 downto 0);
    type slv24_array_t is array(natural range <>) of std_logic_vector(23 downto 0);
    type slv25_array_t is array(natural range <>) of std_logic_vector(24 downto 0);
    type slv26_array_t is array(natural range <>) of std_logic_vector(25 downto 0);
    type slv27_array_t is array(natural range <>) of std_logic_vector(26 downto 0);
    type slv28_array_t is array(natural range <>) of std_logic_vector(27 downto 0);
    type slv29_array_t is array(natural range <>) of std_logic_vector(28 downto 0);
    type slv30_array_t is array(natural range <>) of std_logic_vector(29 downto 0);
    type slv31_array_t is array(natural range <>) of std_logic_vector(30 downto 0);
    type slv32_array_t is array(natural range <>) of std_logic_vector(31 downto 0);

    -- User-logic ports (from user-logic to register file)
    type user2regs_t is record
        system_control_id_id : std_logic_vector(31 downto 0); -- value of register 'SYSTEM_CONTROL_ID', field 'ID'
        system_control_adc_fsm_status_value : std_logic_vector(31 downto 0); -- value of register 'SYSTEM_CONTROL_ADC_FSM_STATUS', field 'value'
        system_control_dac_fsm_status_value : std_logic_vector(31 downto 0); -- value of register 'SYSTEM_CONTROL_DAC_FSM_STATUS', field 'value'
        system_control_dac_late_flag_value : std_logic_vector(31 downto 0); -- value of register 'SYSTEM_CONTROL_DAC_LATE_FLAG', field 'value'
    end record;

    -- User-logic ports (from register file to user-logic)
    type regs2user_t is record
        system_control_id_strobe : std_logic; -- Strobe signal for register 'SYSTEM_CONTROL_ID' (pulsed when the register is read from the bus}
        system_control_adc_fsm_status_strobe : std_logic; -- Strobe signal for register 'SYSTEM_CONTROL_ADC_FSM_STATUS' (pulsed when the register is read from the bus}
        system_control_dac_fsm_status_strobe : std_logic; -- Strobe signal for register 'SYSTEM_CONTROL_DAC_FSM_STATUS' (pulsed when the register is read from the bus}
        system_control_dac_late_flag_strobe : std_logic; -- Strobe signal for register 'SYSTEM_CONTROL_DAC_LATE_FLAG' (pulsed when the register is read from the bus}
    end record;

    -- Revision number of the 'system_control' register map
    constant SYSTEM_CONTROL_REVISION : natural := 55;

    -- Default base address of the 'system_control' register map
    constant SYSTEM_CONTROL_DEFAULT_BASEADDR : unsigned(31 downto 0) := unsigned'(x"00000000");

    -- Size of the 'system_control' register map, in bytes
    constant SYSTEM_CONTROL_RANGE_BYTES : natural := 20;

    -- Register 'SYSTEM_CONTROL_ID'
    constant SYSTEM_CONTROL_ID_OFFSET : unsigned(31 downto 0) := unsigned'(x"00000004"); -- address offset of the 'SYSTEM_CONTROL_ID' register
    -- Field 'SYSTEM_CONTROL_ID.ID'
    constant SYSTEM_CONTROL_ID_ID_BIT_OFFSET : natural := 0; -- bit offset of the 'ID' field
    constant SYSTEM_CONTROL_ID_ID_BIT_WIDTH : natural := 32; -- bit width of the 'ID' field
    constant SYSTEM_CONTROL_ID_ID_RESET : std_logic_vector(31 downto 0) := std_logic_vector'("00000000000000000100001100100001"); -- reset value of the 'ID' field

    -- Register 'SYSTEM_CONTROL_ADC_FSM_STATUS'
    constant SYSTEM_CONTROL_ADC_FSM_STATUS_OFFSET : unsigned(31 downto 0) := unsigned'(x"00000008"); -- address offset of the 'SYSTEM_CONTROL_ADC_FSM_STATUS' register
    -- Field 'SYSTEM_CONTROL_ADC_FSM_STATUS.value'
    constant SYSTEM_CONTROL_ADC_FSM_STATUS_VALUE_BIT_OFFSET : natural := 0; -- bit offset of the 'value' field
    constant SYSTEM_CONTROL_ADC_FSM_STATUS_VALUE_BIT_WIDTH : natural := 32; -- bit width of the 'value' field
    constant SYSTEM_CONTROL_ADC_FSM_STATUS_VALUE_RESET : std_logic_vector(31 downto 0) := std_logic_vector'("00000000000000000000000000000000"); -- reset value of the 'value' field

    -- Register 'SYSTEM_CONTROL_DAC_FSM_STATUS'
    constant SYSTEM_CONTROL_DAC_FSM_STATUS_OFFSET : unsigned(31 downto 0) := unsigned'(x"0000000C"); -- address offset of the 'SYSTEM_CONTROL_DAC_FSM_STATUS' register
    -- Field 'SYSTEM_CONTROL_DAC_FSM_STATUS.value'
    constant SYSTEM_CONTROL_DAC_FSM_STATUS_VALUE_BIT_OFFSET : natural := 0; -- bit offset of the 'value' field
    constant SYSTEM_CONTROL_DAC_FSM_STATUS_VALUE_BIT_WIDTH : natural := 32; -- bit width of the 'value' field
    constant SYSTEM_CONTROL_DAC_FSM_STATUS_VALUE_RESET : std_logic_vector(31 downto 0) := std_logic_vector'("00000000000000000000000000000000"); -- reset value of the 'value' field

    -- Register 'SYSTEM_CONTROL_DAC_LATE_FLAG'
    constant SYSTEM_CONTROL_DAC_LATE_FLAG_OFFSET : unsigned(31 downto 0) := unsigned'(x"00000010"); -- address offset of the 'SYSTEM_CONTROL_DAC_LATE_FLAG' register
    -- Field 'SYSTEM_CONTROL_DAC_LATE_FLAG.value'
    constant SYSTEM_CONTROL_DAC_LATE_FLAG_VALUE_BIT_OFFSET : natural := 0; -- bit offset of the 'value' field
    constant SYSTEM_CONTROL_DAC_LATE_FLAG_VALUE_BIT_WIDTH : natural := 32; -- bit width of the 'value' field
    constant SYSTEM_CONTROL_DAC_LATE_FLAG_VALUE_RESET : std_logic_vector(31 downto 0) := std_logic_vector'("00000000000000000000000000000000"); -- reset value of the 'value' field

end system_control_regs_pkg;