// This program was cloned from: https://github.com/Efinix-Inc/xyloni
// License: MIT License

// Generator : SpinalHDL v1.4.1    git head : 387addbd0f77d7dc52544d06e0272fdbc8aa1c01
// Component : OpalSoc_t8


`define UartStopType_defaultEncoding_type [0:0]
`define UartStopType_defaultEncoding_ONE 1'b0
`define UartStopType_defaultEncoding_TWO 1'b1

`define UartParityType_defaultEncoding_type [1:0]
`define UartParityType_defaultEncoding_NONE 2'b00
`define UartParityType_defaultEncoding_EVEN 2'b01
`define UartParityType_defaultEncoding_ODD 2'b10

`define UartCtrlTxState_defaultEncoding_type [2:0]
`define UartCtrlTxState_defaultEncoding_IDLE 3'b000
`define UartCtrlTxState_defaultEncoding_START 3'b001
`define UartCtrlTxState_defaultEncoding_DATA 3'b010
`define UartCtrlTxState_defaultEncoding_PARITY 3'b011
`define UartCtrlTxState_defaultEncoding_STOP 3'b100

`define UartCtrlRxState_defaultEncoding_type [2:0]
`define UartCtrlRxState_defaultEncoding_IDLE 3'b000
`define UartCtrlRxState_defaultEncoding_START 3'b001
`define UartCtrlRxState_defaultEncoding_DATA 3'b010
`define UartCtrlRxState_defaultEncoding_PARITY 3'b011
`define UartCtrlRxState_defaultEncoding_STOP 3'b100

`define I2cSlaveCmdMode_defaultEncoding_type [2:0]
`define I2cSlaveCmdMode_defaultEncoding_NONE 3'b000
`define I2cSlaveCmdMode_defaultEncoding_START 3'b001
`define I2cSlaveCmdMode_defaultEncoding_RESTART 3'b010
`define I2cSlaveCmdMode_defaultEncoding_STOP 3'b011
`define I2cSlaveCmdMode_defaultEncoding_DROP 3'b100
`define I2cSlaveCmdMode_defaultEncoding_DRIVE 3'b101
`define I2cSlaveCmdMode_defaultEncoding_READ 3'b110

`define bridge_masterLogic_fsm_enumDefinition_defaultEncoding_type [3:0]
`define bridge_masterLogic_fsm_enumDefinition_defaultEncoding_boot 4'b0000
`define bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_IDLE 4'b0001
`define bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_START1 4'b0010
`define bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_START2 4'b0011
`define bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_LOW 4'b0100
`define bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_HIGH 4'b0101
`define bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_RESTART 4'b0110
`define bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_STOP1 4'b0111
`define bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_STOP2 4'b1000
`define bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_TBUF 4'b1001

`define EnvCtrlEnum_defaultEncoding_type [1:0]
`define EnvCtrlEnum_defaultEncoding_NONE 2'b00
`define EnvCtrlEnum_defaultEncoding_XRET 2'b01
`define EnvCtrlEnum_defaultEncoding_ECALL 2'b10

`define BranchCtrlEnum_defaultEncoding_type [1:0]
`define BranchCtrlEnum_defaultEncoding_INC 2'b00
`define BranchCtrlEnum_defaultEncoding_B 2'b01
`define BranchCtrlEnum_defaultEncoding_JAL 2'b10
`define BranchCtrlEnum_defaultEncoding_JALR 2'b11

`define ShiftCtrlEnum_defaultEncoding_type [1:0]
`define ShiftCtrlEnum_defaultEncoding_DISABLE_1 2'b00
`define ShiftCtrlEnum_defaultEncoding_SLL_1 2'b01
`define ShiftCtrlEnum_defaultEncoding_SRL_1 2'b10
`define ShiftCtrlEnum_defaultEncoding_SRA_1 2'b11

`define AluBitwiseCtrlEnum_defaultEncoding_type [1:0]
`define AluBitwiseCtrlEnum_defaultEncoding_XOR_1 2'b00
`define AluBitwiseCtrlEnum_defaultEncoding_OR_1 2'b01
`define AluBitwiseCtrlEnum_defaultEncoding_AND_1 2'b10

`define AluCtrlEnum_defaultEncoding_type [1:0]
`define AluCtrlEnum_defaultEncoding_ADD_SUB 2'b00
`define AluCtrlEnum_defaultEncoding_SLT_SLTU 2'b01
`define AluCtrlEnum_defaultEncoding_BITWISE 2'b10

`define Src2CtrlEnum_defaultEncoding_type [1:0]
`define Src2CtrlEnum_defaultEncoding_RS 2'b00
`define Src2CtrlEnum_defaultEncoding_IMI 2'b01
`define Src2CtrlEnum_defaultEncoding_IMS 2'b10
`define Src2CtrlEnum_defaultEncoding_PC 2'b11

`define Src1CtrlEnum_defaultEncoding_type [1:0]
`define Src1CtrlEnum_defaultEncoding_RS 2'b00
`define Src1CtrlEnum_defaultEncoding_IMU 2'b01
`define Src1CtrlEnum_defaultEncoding_PC_INCREMENT 2'b10
`define Src1CtrlEnum_defaultEncoding_URS1 2'b11


module OpalSoc_t8 (
  input               io_systemClk,
  input               io_asyncReset,
  input               jtagCtrl_tck,
  output              system_uart_0_io_txd,
  input               system_uart_0_io_rxd,
  output              system_i2c_0_io_sda_write,
  input               system_i2c_0_io_sda_read,
  output              system_i2c_0_io_scl_write,
  input               system_i2c_0_io_scl_read,
  input      [15:0]   system_gpio_0_io_read,
  output     [15:0]   system_gpio_0_io_write,
  output     [15:0]   system_gpio_0_io_writeEnable,
  output     [11:0]   io_apbSlave_0_PADDR,
  output     [0:0]    io_apbSlave_0_PSEL,
  output              io_apbSlave_0_PENABLE,
  input               io_apbSlave_0_PREADY,
  output              io_apbSlave_0_PWRITE,
  output     [31:0]   io_apbSlave_0_PWDATA,
  input      [31:0]   io_apbSlave_0_PRDATA,
  input               io_apbSlave_0_PSLVERROR,
  input               userInterruptA,
  output              io_systemReset,
  input               jtagCtrl_tdi,
  input               jtagCtrl_enable,
  input               jtagCtrl_capture,
  input               jtagCtrl_shift,
  input               jtagCtrl_update,
  input               jtagCtrl_reset,
  output              jtagCtrl_tdo,
  output     [0:0]    system_spi_0_io_sclk_write,
  output              system_spi_0_io_data_0_writeEnable,
  input      [0:0]    system_spi_0_io_data_0_read,
  output     [0:0]    system_spi_0_io_data_0_write,
  output              system_spi_0_io_data_1_writeEnable,
  input      [0:0]    system_spi_0_io_data_1_read,
  output     [0:0]    system_spi_0_io_data_1_write,
  output              system_spi_0_io_data_2_writeEnable,
  input      [0:0]    system_spi_0_io_data_2_read,
  output     [0:0]    system_spi_0_io_data_2_write,
  output              system_spi_0_io_data_3_writeEnable,
  input      [0:0]    system_spi_0_io_data_3_read,
  output     [0:0]    system_spi_0_io_data_3_write,
  output     [0:0]    system_spi_0_io_ss,
  output     [0:0]    system_spi_1_io_sclk_write,
  output              system_spi_1_io_data_0_writeEnable,
  input      [0:0]    system_spi_1_io_data_0_read,
  output     [0:0]    system_spi_1_io_data_0_write,
  output              system_spi_1_io_data_1_writeEnable,
  input      [0:0]    system_spi_1_io_data_1_read,
  output     [0:0]    system_spi_1_io_data_1_write,
  output              system_spi_1_io_data_2_writeEnable,
  input      [0:0]    system_spi_1_io_data_2_read,
  output     [0:0]    system_spi_1_io_data_2_write,
  output              system_spi_1_io_data_3_writeEnable,
  input      [0:0]    system_spi_1_io_data_3_read,
  output     [0:0]    system_spi_1_io_data_3_write,
  output     [0:0]    system_spi_1_io_ss
);
  wire       [3:0]    _zz_43;
  wire       [4:0]    _zz_44;
  wire       [7:0]    _zz_45;
  wire       [11:0]   _zz_46;
  wire                _zz_47;
  wire                _zz_48;
  wire                _zz_49;
  wire                _zz_50;
  wire                _zz_51;
  wire                _zz_52;
  wire       [7:0]    _zz_53;
  wire                _zz_54;
  wire                _zz_55;
  wire       [11:0]   _zz_56;
  wire       [11:0]   _zz_57;
  wire       [31:0]   _zz_58;
  wire       [3:0]    _zz_59;
  wire       [0:0]    _zz_60;
  wire       [7:0]    _zz_61;
  wire       [7:0]    _zz_62;
  wire                _zz_63;
  wire                _zz_64;
  wire                _zz_65;
  wire                _zz_66;
  wire                _zz_67;
  wire                _zz_68;
  wire       [23:0]   _zz_69;
  wire                system_machineTimer_logic_io_bus_PREADY;
  wire       [31:0]   system_machineTimer_logic_io_bus_PRDATA;
  wire                system_machineTimer_logic_io_bus_PSLVERROR;
  wire                system_machineTimer_logic_io_mTimeInterrupt;
  wire                system_uart_0_io_logic_io_apb_PREADY;
  wire       [31:0]   system_uart_0_io_logic_io_apb_PRDATA;
  wire                system_uart_0_io_logic_io_uart_txd;
  wire                system_uart_0_io_logic_io_interrupt;
  wire                system_i2c_0_io_logic_io_apb_PREADY;
  wire       [31:0]   system_i2c_0_io_logic_io_apb_PRDATA;
  wire                system_i2c_0_io_logic_io_i2c_scl_write;
  wire                system_i2c_0_io_logic_io_i2c_sda_write;
  wire                system_i2c_0_io_logic_io_interrupt;
  wire       [15:0]   system_gpio_0_io_logic_io_gpio_write;
  wire       [15:0]   system_gpio_0_io_logic_io_gpio_writeEnable;
  wire                system_gpio_0_io_logic_io_bus_PREADY;
  wire       [31:0]   system_gpio_0_io_logic_io_bus_PRDATA;
  wire                system_gpio_0_io_logic_io_bus_PSLVERROR;
  wire       [15:0]   system_gpio_0_io_logic_io_interrupt;
  wire                userInterruptA_buffercc_io_dataOut;
  wire                bufferCC_9_io_dataOut;
  wire                bufferCC_10_io_dataOut;
  wire                system_cpu_logic_cpu_iBus_cmd_valid;
  wire       [31:0]   system_cpu_logic_cpu_iBus_cmd_payload_pc;
  wire                system_cpu_logic_cpu_debug_bus_cmd_ready;
  wire       [31:0]   system_cpu_logic_cpu_debug_bus_rsp_data;
  wire                system_cpu_logic_cpu_debug_resetOut;
  wire                system_cpu_logic_cpu_dBus_cmd_valid;
  wire                system_cpu_logic_cpu_dBus_cmd_payload_wr;
  wire       [31:0]   system_cpu_logic_cpu_dBus_cmd_payload_address;
  wire       [31:0]   system_cpu_logic_cpu_dBus_cmd_payload_data;
  wire       [1:0]    system_cpu_logic_cpu_dBus_cmd_payload_size;
  wire                jtagBridgeNoTap_1_io_ctrl_tdo;
  wire                jtagBridgeNoTap_1_io_remote_cmd_valid;
  wire                jtagBridgeNoTap_1_io_remote_cmd_payload_last;
  wire       [0:0]    jtagBridgeNoTap_1_io_remote_cmd_payload_fragment;
  wire                jtagBridgeNoTap_1_io_remote_rsp_ready;
  wire                systemDebugger_1_io_remote_cmd_ready;
  wire                systemDebugger_1_io_remote_rsp_valid;
  wire                systemDebugger_1_io_remote_rsp_payload_error;
  wire       [31:0]   systemDebugger_1_io_remote_rsp_payload_data;
  wire                systemDebugger_1_io_mem_cmd_valid;
  wire       [31:0]   systemDebugger_1_io_mem_cmd_payload_address;
  wire       [31:0]   systemDebugger_1_io_mem_cmd_payload_data;
  wire                systemDebugger_1_io_mem_cmd_payload_wr;
  wire       [1:0]    systemDebugger_1_io_mem_cmd_payload_size;
  wire                system_cpu_iBus_decoder_io_input_cmd_ready;
  wire                system_cpu_iBus_decoder_io_input_rsp_valid;
  wire                system_cpu_iBus_decoder_io_input_rsp_payload_last;
  wire       [0:0]    system_cpu_iBus_decoder_io_input_rsp_payload_fragment_opcode;
  wire       [31:0]   system_cpu_iBus_decoder_io_input_rsp_payload_fragment_data;
  wire                system_cpu_iBus_decoder_io_outputs_0_cmd_valid;
  wire                system_cpu_iBus_decoder_io_outputs_0_cmd_payload_last;
  wire       [0:0]    system_cpu_iBus_decoder_io_outputs_0_cmd_payload_fragment_opcode;
  wire       [31:0]   system_cpu_iBus_decoder_io_outputs_0_cmd_payload_fragment_address;
  wire       [1:0]    system_cpu_iBus_decoder_io_outputs_0_cmd_payload_fragment_length;
  wire                system_cpu_iBus_decoder_io_outputs_0_rsp_ready;
  wire                system_ramA_logic_io_bus_cmd_ready;
  wire                system_ramA_logic_io_bus_rsp_valid;
  wire                system_ramA_logic_io_bus_rsp_payload_last;
  wire       [0:0]    system_ramA_logic_io_bus_rsp_payload_fragment_source;
  wire       [0:0]    system_ramA_logic_io_bus_rsp_payload_fragment_opcode;
  wire       [31:0]   system_ramA_logic_io_bus_rsp_payload_fragment_data;
  wire       [0:0]    system_ramA_logic_io_bus_rsp_payload_fragment_context;
  wire                system_ramA_bmb_arbiter_io_inputs_0_cmd_ready;
  wire                system_ramA_bmb_arbiter_io_inputs_0_rsp_valid;
  wire                system_ramA_bmb_arbiter_io_inputs_0_rsp_payload_last;
  wire       [0:0]    system_ramA_bmb_arbiter_io_inputs_0_rsp_payload_fragment_opcode;
  wire       [31:0]   system_ramA_bmb_arbiter_io_inputs_0_rsp_payload_fragment_data;
  wire       [0:0]    system_ramA_bmb_arbiter_io_inputs_0_rsp_payload_fragment_context;
  wire                system_ramA_bmb_arbiter_io_inputs_1_cmd_ready;
  wire                system_ramA_bmb_arbiter_io_inputs_1_rsp_valid;
  wire                system_ramA_bmb_arbiter_io_inputs_1_rsp_payload_last;
  wire       [0:0]    system_ramA_bmb_arbiter_io_inputs_1_rsp_payload_fragment_opcode;
  wire       [31:0]   system_ramA_bmb_arbiter_io_inputs_1_rsp_payload_fragment_data;
  wire       [0:0]    system_ramA_bmb_arbiter_io_inputs_1_rsp_payload_fragment_context;
  wire                system_ramA_bmb_arbiter_io_output_cmd_valid;
  wire                system_ramA_bmb_arbiter_io_output_cmd_payload_last;
  wire       [0:0]    system_ramA_bmb_arbiter_io_output_cmd_payload_fragment_source;
  wire       [0:0]    system_ramA_bmb_arbiter_io_output_cmd_payload_fragment_opcode;
  wire       [11:0]   system_ramA_bmb_arbiter_io_output_cmd_payload_fragment_address;
  wire       [1:0]    system_ramA_bmb_arbiter_io_output_cmd_payload_fragment_length;
  wire       [31:0]   system_ramA_bmb_arbiter_io_output_cmd_payload_fragment_data;
  wire       [3:0]    system_ramA_bmb_arbiter_io_output_cmd_payload_fragment_mask;
  wire       [0:0]    system_ramA_bmb_arbiter_io_output_cmd_payload_fragment_context;
  wire                system_ramA_bmb_arbiter_io_output_rsp_ready;
  wire                system_spi_0_io_logic_io_apb_PREADY;
  wire       [31:0]   system_spi_0_io_logic_io_apb_PRDATA;
  wire       [0:0]    system_spi_0_io_logic_io_spi_sclk_write;
  wire       [0:0]    system_spi_0_io_logic_io_spi_ss;
  wire       [0:0]    system_spi_0_io_logic_io_spi_data_0_write;
  wire                system_spi_0_io_logic_io_spi_data_0_writeEnable;
  wire       [0:0]    system_spi_0_io_logic_io_spi_data_1_write;
  wire                system_spi_0_io_logic_io_spi_data_1_writeEnable;
  wire       [0:0]    system_spi_0_io_logic_io_spi_data_2_write;
  wire                system_spi_0_io_logic_io_spi_data_2_writeEnable;
  wire       [0:0]    system_spi_0_io_logic_io_spi_data_3_write;
  wire                system_spi_0_io_logic_io_spi_data_3_writeEnable;
  wire                system_spi_0_io_logic_io_interrupt;
  wire                system_spi_1_io_logic_io_apb_PREADY;
  wire       [31:0]   system_spi_1_io_logic_io_apb_PRDATA;
  wire       [0:0]    system_spi_1_io_logic_io_spi_sclk_write;
  wire       [0:0]    system_spi_1_io_logic_io_spi_ss;
  wire       [0:0]    system_spi_1_io_logic_io_spi_data_0_write;
  wire                system_spi_1_io_logic_io_spi_data_0_writeEnable;
  wire       [0:0]    system_spi_1_io_logic_io_spi_data_1_write;
  wire                system_spi_1_io_logic_io_spi_data_1_writeEnable;
  wire       [0:0]    system_spi_1_io_logic_io_spi_data_2_write;
  wire                system_spi_1_io_logic_io_spi_data_2_writeEnable;
  wire       [0:0]    system_spi_1_io_logic_io_spi_data_3_write;
  wire                system_spi_1_io_logic_io_spi_data_3_writeEnable;
  wire                system_spi_1_io_logic_io_interrupt;
  wire                bufferCC_11_io_dataOut;
  wire                system_cpu_dBus_decoder_io_input_cmd_ready;
  wire                system_cpu_dBus_decoder_io_input_rsp_valid;
  wire                system_cpu_dBus_decoder_io_input_rsp_payload_last;
  wire       [0:0]    system_cpu_dBus_decoder_io_input_rsp_payload_fragment_opcode;
  wire       [31:0]   system_cpu_dBus_decoder_io_input_rsp_payload_fragment_data;
  wire       [0:0]    system_cpu_dBus_decoder_io_input_rsp_payload_fragment_context;
  wire                system_cpu_dBus_decoder_io_outputs_0_cmd_valid;
  wire                system_cpu_dBus_decoder_io_outputs_0_cmd_payload_last;
  wire       [0:0]    system_cpu_dBus_decoder_io_outputs_0_cmd_payload_fragment_opcode;
  wire       [31:0]   system_cpu_dBus_decoder_io_outputs_0_cmd_payload_fragment_address;
  wire       [1:0]    system_cpu_dBus_decoder_io_outputs_0_cmd_payload_fragment_length;
  wire       [31:0]   system_cpu_dBus_decoder_io_outputs_0_cmd_payload_fragment_data;
  wire       [3:0]    system_cpu_dBus_decoder_io_outputs_0_cmd_payload_fragment_mask;
  wire       [0:0]    system_cpu_dBus_decoder_io_outputs_0_cmd_payload_fragment_context;
  wire                system_cpu_dBus_decoder_io_outputs_0_rsp_ready;
  wire                system_cpu_dBus_decoder_io_outputs_1_cmd_valid;
  wire                system_cpu_dBus_decoder_io_outputs_1_cmd_payload_last;
  wire       [0:0]    system_cpu_dBus_decoder_io_outputs_1_cmd_payload_fragment_opcode;
  wire       [31:0]   system_cpu_dBus_decoder_io_outputs_1_cmd_payload_fragment_address;
  wire       [1:0]    system_cpu_dBus_decoder_io_outputs_1_cmd_payload_fragment_length;
  wire       [31:0]   system_cpu_dBus_decoder_io_outputs_1_cmd_payload_fragment_data;
  wire       [3:0]    system_cpu_dBus_decoder_io_outputs_1_cmd_payload_fragment_mask;
  wire       [0:0]    system_cpu_dBus_decoder_io_outputs_1_cmd_payload_fragment_context;
  wire                system_cpu_dBus_decoder_io_outputs_1_rsp_ready;
  wire                system_apbDecoder_input_decoder_io_input_PREADY;
  wire       [31:0]   system_apbDecoder_input_decoder_io_input_PRDATA;
  wire                system_apbDecoder_input_decoder_io_input_PSLVERROR;
  wire       [23:0]   system_apbDecoder_input_decoder_io_output_PADDR;
  wire       [7:0]    system_apbDecoder_input_decoder_io_output_PSEL;
  wire                system_apbDecoder_input_decoder_io_output_PENABLE;
  wire                system_apbDecoder_input_decoder_io_output_PWRITE;
  wire       [31:0]   system_apbDecoder_input_decoder_io_output_PWDATA;
  wire                apb3Router_1_io_input_PREADY;
  wire       [31:0]   apb3Router_1_io_input_PRDATA;
  wire                apb3Router_1_io_input_PSLVERROR;
  wire       [23:0]   apb3Router_1_io_outputs_0_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_0_PSEL;
  wire                apb3Router_1_io_outputs_0_PENABLE;
  wire                apb3Router_1_io_outputs_0_PWRITE;
  wire       [31:0]   apb3Router_1_io_outputs_0_PWDATA;
  wire       [23:0]   apb3Router_1_io_outputs_1_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_1_PSEL;
  wire                apb3Router_1_io_outputs_1_PENABLE;
  wire                apb3Router_1_io_outputs_1_PWRITE;
  wire       [31:0]   apb3Router_1_io_outputs_1_PWDATA;
  wire       [23:0]   apb3Router_1_io_outputs_2_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_2_PSEL;
  wire                apb3Router_1_io_outputs_2_PENABLE;
  wire                apb3Router_1_io_outputs_2_PWRITE;
  wire       [31:0]   apb3Router_1_io_outputs_2_PWDATA;
  wire       [23:0]   apb3Router_1_io_outputs_3_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_3_PSEL;
  wire                apb3Router_1_io_outputs_3_PENABLE;
  wire                apb3Router_1_io_outputs_3_PWRITE;
  wire       [31:0]   apb3Router_1_io_outputs_3_PWDATA;
  wire       [23:0]   apb3Router_1_io_outputs_4_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_4_PSEL;
  wire                apb3Router_1_io_outputs_4_PENABLE;
  wire                apb3Router_1_io_outputs_4_PWRITE;
  wire       [31:0]   apb3Router_1_io_outputs_4_PWDATA;
  wire       [23:0]   apb3Router_1_io_outputs_5_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_5_PSEL;
  wire                apb3Router_1_io_outputs_5_PENABLE;
  wire                apb3Router_1_io_outputs_5_PWRITE;
  wire       [31:0]   apb3Router_1_io_outputs_5_PWDATA;
  wire       [23:0]   apb3Router_1_io_outputs_6_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_6_PSEL;
  wire                apb3Router_1_io_outputs_6_PENABLE;
  wire                apb3Router_1_io_outputs_6_PWRITE;
  wire       [31:0]   apb3Router_1_io_outputs_6_PWDATA;
  wire       [23:0]   apb3Router_1_io_outputs_7_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_7_PSEL;
  wire                apb3Router_1_io_outputs_7_PENABLE;
  wire                apb3Router_1_io_outputs_7_PWRITE;
  wire       [31:0]   apb3Router_1_io_outputs_7_PWDATA;
  wire                system_peripheralBridge_logic_bridge_io_input_cmd_ready;
  wire                system_peripheralBridge_logic_bridge_io_input_rsp_valid;
  wire                system_peripheralBridge_logic_bridge_io_input_rsp_payload_last;
  wire       [0:0]    system_peripheralBridge_logic_bridge_io_input_rsp_payload_fragment_opcode;
  wire       [31:0]   system_peripheralBridge_logic_bridge_io_input_rsp_payload_fragment_data;
  wire       [0:0]    system_peripheralBridge_logic_bridge_io_input_rsp_payload_fragment_context;
  wire       [23:0]   system_peripheralBridge_logic_bridge_io_output_PADDR;
  wire       [0:0]    system_peripheralBridge_logic_bridge_io_output_PSEL;
  wire                system_peripheralBridge_logic_bridge_io_output_PENABLE;
  wire                system_peripheralBridge_logic_bridge_io_output_PWRITE;
  wire       [31:0]   system_peripheralBridge_logic_bridge_io_output_PWDATA;
  wire                system_peripheralBridge_input_arbiter_io_inputs_0_cmd_ready;
  wire                system_peripheralBridge_input_arbiter_io_inputs_0_rsp_valid;
  wire                system_peripheralBridge_input_arbiter_io_inputs_0_rsp_payload_last;
  wire       [0:0]    system_peripheralBridge_input_arbiter_io_inputs_0_rsp_payload_fragment_opcode;
  wire       [31:0]   system_peripheralBridge_input_arbiter_io_inputs_0_rsp_payload_fragment_data;
  wire       [0:0]    system_peripheralBridge_input_arbiter_io_inputs_0_rsp_payload_fragment_context;
  wire                system_peripheralBridge_input_arbiter_io_output_cmd_valid;
  wire                system_peripheralBridge_input_arbiter_io_output_cmd_payload_last;
  wire       [0:0]    system_peripheralBridge_input_arbiter_io_output_cmd_payload_fragment_opcode;
  wire       [23:0]   system_peripheralBridge_input_arbiter_io_output_cmd_payload_fragment_address;
  wire       [1:0]    system_peripheralBridge_input_arbiter_io_output_cmd_payload_fragment_length;
  wire       [31:0]   system_peripheralBridge_input_arbiter_io_output_cmd_payload_fragment_data;
  wire       [3:0]    system_peripheralBridge_input_arbiter_io_output_cmd_payload_fragment_mask;
  wire       [0:0]    system_peripheralBridge_input_arbiter_io_output_cmd_payload_fragment_context;
  wire                system_peripheralBridge_input_arbiter_io_output_rsp_ready;
  wire                _zz_70;
  wire                _zz_71;
  wire       [0:0]    _zz_72;
  wire       [0:0]    _zz_73;
  wire       [0:0]    _zz_74;
  wire       [0:0]    _zz_75;
  wire       [0:0]    _zz_76;
  wire       [0:0]    _zz_77;
  wire       [0:0]    _zz_78;
  wire       [0:0]    _zz_79;
  reg                 debugCd_logic_inputResetTrigger;
  reg                 debugCd_logic_outputResetUnbuffered;
  reg        [11:0]   debugCd_logic_holdingLogic_resetCounter = 12'h0;
  reg                 debugCd_logic_outputReset = 1'b1;
  reg                 systemCd_logic_inputResetTrigger;
  reg                 systemCd_logic_outputResetUnbuffered;
  reg        [5:0]    systemCd_logic_holdingLogic_resetCounter;
  reg                 systemCd_logic_outputReset;
  wire                system_cpu_jtagInstructionCtrl_tdi;
  wire                system_cpu_jtagInstructionCtrl_enable;
  wire                system_cpu_jtagInstructionCtrl_capture;
  wire                system_cpu_jtagInstructionCtrl_shift;
  wire                system_cpu_jtagInstructionCtrl_update;
  wire                system_cpu_jtagInstructionCtrl_reset;
  wire                system_cpu_jtagInstructionCtrl_tdo;
  wire       [1:0]    system_machineTimer_interrupt_plic_gateway_priority;
  reg                 system_machineTimer_interrupt_plic_gateway_ip;
  reg                 system_machineTimer_interrupt_plic_gateway_waitCompletion;
  wire       [1:0]    system_uart_0_io_interrupt_plic_gateway_priority;
  reg                 system_uart_0_io_interrupt_plic_gateway_ip;
  reg                 system_uart_0_io_interrupt_plic_gateway_waitCompletion;
  wire       [1:0]    system_i2c_0_io_interrupt_plic_gateway_priority;
  reg                 system_i2c_0_io_interrupt_plic_gateway_ip;
  reg                 system_i2c_0_io_interrupt_plic_gateway_waitCompletion;
  wire                userInterruptA_interrupt;
  wire       [1:0]    userInterruptA_interrupt_plic_gateway_priority;
  reg                 userInterruptA_interrupt_plic_gateway_ip;
  reg                 userInterruptA_interrupt_plic_gateway_waitCompletion;
  wire                debugCd_logic_inputResetAdapter_stuff_syncTrigger;
  wire                system_cpu_iBus_cmd_valid;
  wire                system_cpu_iBus_cmd_ready;
  wire                system_cpu_iBus_cmd_payload_last;
  wire       [0:0]    system_cpu_iBus_cmd_payload_fragment_opcode;
  wire       [31:0]   system_cpu_iBus_cmd_payload_fragment_address;
  wire       [1:0]    system_cpu_iBus_cmd_payload_fragment_length;
  wire                system_cpu_iBus_rsp_valid;
  wire                system_cpu_iBus_rsp_ready;
  wire                system_cpu_iBus_rsp_payload_last;
  wire       [0:0]    system_cpu_iBus_rsp_payload_fragment_opcode;
  wire       [31:0]   system_cpu_iBus_rsp_payload_fragment_data;
  wire                system_cpu_dBus_cmd_valid;
  wire                system_cpu_dBus_cmd_ready;
  wire                system_cpu_dBus_cmd_payload_last;
  wire       [0:0]    system_cpu_dBus_cmd_payload_fragment_opcode;
  wire       [31:0]   system_cpu_dBus_cmd_payload_fragment_address;
  wire       [1:0]    system_cpu_dBus_cmd_payload_fragment_length;
  wire       [31:0]   system_cpu_dBus_cmd_payload_fragment_data;
  wire       [3:0]    system_cpu_dBus_cmd_payload_fragment_mask;
  wire       [0:0]    system_cpu_dBus_cmd_payload_fragment_context;
  wire                system_cpu_dBus_rsp_valid;
  wire                system_cpu_dBus_rsp_ready;
  wire                system_cpu_dBus_rsp_payload_last;
  wire       [0:0]    system_cpu_dBus_rsp_payload_fragment_opcode;
  wire       [31:0]   system_cpu_dBus_rsp_payload_fragment_data;
  wire       [0:0]    system_cpu_dBus_rsp_payload_fragment_context;
  reg        [1:0]    _zz_1;
  reg        [3:0]    _zz_2;
  reg                 system_cpu_debugReset;
  reg                 _zz_3;
  wire       [1:0]    system_spi_0_io_interrupt_plic_gateway_priority;
  reg                 system_spi_0_io_interrupt_plic_gateway_ip;
  reg                 system_spi_0_io_interrupt_plic_gateway_waitCompletion;
  wire       [1:0]    system_spi_1_io_interrupt_plic_gateway_priority;
  reg                 system_spi_1_io_interrupt_plic_gateway_ip;
  reg                 system_spi_1_io_interrupt_plic_gateway_waitCompletion;
  wire                resetGenerator_stuff_syncTrigger;
  wire                system_gpio_0_io_interrupts_0;
  wire                system_gpio_0_io_interrupts_1;
  wire                system_gpio_0_io_interrupts_2;
  wire                system_gpio_0_io_interrupts_3;
  wire                system_gpio_0_io_interrupts_4;
  wire                system_gpio_0_io_interrupts_5;
  wire                system_gpio_0_io_interrupts_6;
  wire                system_gpio_0_io_interrupts_7;
  wire                system_gpio_0_io_interrupts_8;
  wire                system_gpio_0_io_interrupts_9;
  wire                system_gpio_0_io_interrupts_10;
  wire                system_gpio_0_io_interrupts_11;
  wire                system_gpio_0_io_interrupts_12;
  wire                system_gpio_0_io_interrupts_13;
  wire                system_gpio_0_io_interrupts_14;
  wire                system_gpio_0_io_interrupts_15;
  wire       [1:0]    system_gpio_0_io_interrupts_0_plic_gateway_priority;
  reg                 system_gpio_0_io_interrupts_0_plic_gateway_ip;
  reg                 system_gpio_0_io_interrupts_0_plic_gateway_waitCompletion;
  wire       [1:0]    system_gpio_0_io_interrupts_1_plic_gateway_priority;
  reg                 system_gpio_0_io_interrupts_1_plic_gateway_ip;
  reg                 system_gpio_0_io_interrupts_1_plic_gateway_waitCompletion;
  wire       [23:0]   system_apbDecoder_input_PADDR;
  wire       [0:0]    system_apbDecoder_input_PSEL;
  wire                system_apbDecoder_input_PENABLE;
  wire                system_apbDecoder_input_PREADY;
  wire                system_apbDecoder_input_PWRITE;
  wire       [31:0]   system_apbDecoder_input_PWDATA;
  wire       [31:0]   system_apbDecoder_input_PRDATA;
  wire                system_apbDecoder_input_PSLVERROR;
  wire       [21:0]   system_plic_logic_apb_PADDR;
  wire       [0:0]    system_plic_logic_apb_PSEL;
  wire                system_plic_logic_apb_PENABLE;
  wire                system_plic_logic_apb_PREADY;
  wire                system_plic_logic_apb_PWRITE;
  wire       [31:0]   system_plic_logic_apb_PWDATA;
  reg        [31:0]   system_plic_logic_apb_PRDATA;
  wire                system_plic_logic_apb_PSLVERROR;
  wire                system_plic_logic_bus_askWrite;
  wire                system_plic_logic_bus_askRead;
  wire                system_plic_logic_bus_doWrite;
  wire                system_plic_logic_bus_doRead;
  wire                system_cpu_externalInterrupt_plic_target_ie_0;
  wire                system_cpu_externalInterrupt_plic_target_ie_1;
  wire                system_cpu_externalInterrupt_plic_target_ie_2;
  wire                system_cpu_externalInterrupt_plic_target_ie_3;
  wire                system_cpu_externalInterrupt_plic_target_ie_4;
  wire                system_cpu_externalInterrupt_plic_target_ie_5;
  wire                system_cpu_externalInterrupt_plic_target_ie_6;
  wire                system_cpu_externalInterrupt_plic_target_ie_7;
  wire       [1:0]    system_cpu_externalInterrupt_plic_target_threshold;
  wire       [1:0]    system_cpu_externalInterrupt_plic_target_requests_0_priority;
  wire       [4:0]    system_cpu_externalInterrupt_plic_target_requests_0_id;
  wire                system_cpu_externalInterrupt_plic_target_requests_0_valid;
  wire       [1:0]    system_cpu_externalInterrupt_plic_target_requests_1_priority;
  wire       [4:0]    system_cpu_externalInterrupt_plic_target_requests_1_id;
  wire                system_cpu_externalInterrupt_plic_target_requests_1_valid;
  wire       [1:0]    system_cpu_externalInterrupt_plic_target_requests_2_priority;
  wire       [4:0]    system_cpu_externalInterrupt_plic_target_requests_2_id;
  wire                system_cpu_externalInterrupt_plic_target_requests_2_valid;
  wire       [1:0]    system_cpu_externalInterrupt_plic_target_requests_3_priority;
  wire       [4:0]    system_cpu_externalInterrupt_plic_target_requests_3_id;
  wire                system_cpu_externalInterrupt_plic_target_requests_3_valid;
  wire       [1:0]    system_cpu_externalInterrupt_plic_target_requests_4_priority;
  wire       [4:0]    system_cpu_externalInterrupt_plic_target_requests_4_id;
  wire                system_cpu_externalInterrupt_plic_target_requests_4_valid;
  wire       [1:0]    system_cpu_externalInterrupt_plic_target_requests_5_priority;
  wire       [4:0]    system_cpu_externalInterrupt_plic_target_requests_5_id;
  wire                system_cpu_externalInterrupt_plic_target_requests_5_valid;
  wire       [1:0]    system_cpu_externalInterrupt_plic_target_requests_6_priority;
  wire       [4:0]    system_cpu_externalInterrupt_plic_target_requests_6_id;
  wire                system_cpu_externalInterrupt_plic_target_requests_6_valid;
  wire       [1:0]    system_cpu_externalInterrupt_plic_target_requests_7_priority;
  wire       [4:0]    system_cpu_externalInterrupt_plic_target_requests_7_id;
  wire                system_cpu_externalInterrupt_plic_target_requests_7_valid;
  wire       [1:0]    system_cpu_externalInterrupt_plic_target_requests_8_priority;
  wire       [4:0]    system_cpu_externalInterrupt_plic_target_requests_8_id;
  wire                system_cpu_externalInterrupt_plic_target_requests_8_valid;
  wire                _zz_4;
  wire       [1:0]    _zz_5;
  wire                _zz_6;
  wire                _zz_7;
  wire       [1:0]    _zz_8;
  wire                _zz_9;
  wire                _zz_10;
  wire       [1:0]    _zz_11;
  wire                _zz_12;
  wire                _zz_13;
  wire       [1:0]    _zz_14;
  wire                _zz_15;
  wire                _zz_16;
  wire       [1:0]    _zz_17;
  wire                _zz_18;
  wire                _zz_19;
  wire       [1:0]    _zz_20;
  wire                _zz_21;
  wire                _zz_22;
  wire       [1:0]    _zz_23;
  wire                _zz_24;
  wire                _zz_25;
  wire       [1:0]    system_cpu_externalInterrupt_plic_target_bestRequest_priority;
  wire       [4:0]    system_cpu_externalInterrupt_plic_target_bestRequest_id;
  wire                system_cpu_externalInterrupt_plic_target_bestRequest_valid;
  wire                system_cpu_externalInterrupt_plic_target_iep;
  wire       [4:0]    system_cpu_externalInterrupt_plic_target_claim;
  reg        [1:0]    _zz_26;
  reg        [1:0]    _zz_27;
  reg        [1:0]    _zz_28;
  reg        [1:0]    _zz_29;
  reg        [1:0]    _zz_30;
  reg        [1:0]    _zz_31;
  reg        [1:0]    _zz_32;
  reg        [1:0]    _zz_33;
  reg                 system_plic_logic_bridge_claim_valid;
  reg        [4:0]    system_plic_logic_bridge_claim_payload;
  reg                 system_plic_logic_bridge_completion_valid;
  reg        [4:0]    system_plic_logic_bridge_completion_payload;
  reg        [1:0]    _zz_34;
  reg                 system_plic_logic_bridge_targetMapping_0_targetCompletion_valid;
  wire       [4:0]    system_plic_logic_bridge_targetMapping_0_targetCompletion_payload;
  reg                 _zz_35;
  reg                 _zz_36;
  reg                 _zz_37;
  reg                 _zz_38;
  reg                 _zz_39;
  reg                 _zz_40;
  reg                 _zz_41;
  reg                 _zz_42;

  assign _zz_70 = (debugCd_logic_holdingLogic_resetCounter != 12'hfff);
  assign _zz_71 = (systemCd_logic_holdingLogic_resetCounter != 6'h3f);
  assign _zz_72 = system_plic_logic_apb_PWDATA[31 : 31];
  assign _zz_73 = system_plic_logic_apb_PWDATA[1 : 1];
  assign _zz_74 = system_plic_logic_apb_PWDATA[8 : 8];
  assign _zz_75 = system_plic_logic_apb_PWDATA[25 : 25];
  assign _zz_76 = system_plic_logic_apb_PWDATA[4 : 4];
  assign _zz_77 = system_plic_logic_apb_PWDATA[5 : 5];
  assign _zz_78 = system_plic_logic_apb_PWDATA[12 : 12];
  assign _zz_79 = system_plic_logic_apb_PWDATA[13 : 13];
  MachineTimer system_machineTimer_logic (
    .io_bus_PADDR                  (_zz_43[3:0]                                    ), //i
    .io_bus_PSEL                   (apb3Router_1_io_outputs_1_PSEL                 ), //i
    .io_bus_PENABLE                (apb3Router_1_io_outputs_1_PENABLE              ), //i
    .io_bus_PREADY                 (system_machineTimer_logic_io_bus_PREADY        ), //o
    .io_bus_PWRITE                 (apb3Router_1_io_outputs_1_PWRITE               ), //i
    .io_bus_PWDATA                 (apb3Router_1_io_outputs_1_PWDATA[31:0]         ), //i
    .io_bus_PRDATA                 (system_machineTimer_logic_io_bus_PRDATA[31:0]  ), //o
    .io_bus_PSLVERROR              (system_machineTimer_logic_io_bus_PSLVERROR     ), //o
    .io_mTimeInterrupt             (system_machineTimer_logic_io_mTimeInterrupt    ), //o
    .io_systemClk                  (io_systemClk                                   ), //i
    .systemCd_logic_outputReset    (systemCd_logic_outputReset                     )  //i
  );
  Apb3UartCtrl system_uart_0_io_logic (
    .io_apb_PADDR                  (_zz_44[4:0]                                 ), //i
    .io_apb_PSEL                   (apb3Router_1_io_outputs_2_PSEL              ), //i
    .io_apb_PENABLE                (apb3Router_1_io_outputs_2_PENABLE           ), //i
    .io_apb_PREADY                 (system_uart_0_io_logic_io_apb_PREADY        ), //o
    .io_apb_PWRITE                 (apb3Router_1_io_outputs_2_PWRITE            ), //i
    .io_apb_PWDATA                 (apb3Router_1_io_outputs_2_PWDATA[31:0]      ), //i
    .io_apb_PRDATA                 (system_uart_0_io_logic_io_apb_PRDATA[31:0]  ), //o
    .io_uart_txd                   (system_uart_0_io_logic_io_uart_txd          ), //o
    .io_uart_rxd                   (system_uart_0_io_rxd                        ), //i
    .io_interrupt                  (system_uart_0_io_logic_io_interrupt         ), //o
    .io_systemClk                  (io_systemClk                                ), //i
    .systemCd_logic_outputReset    (systemCd_logic_outputReset                  )  //i
  );
  Apb3I2cCtrl system_i2c_0_io_logic (
    .io_apb_PADDR                  (_zz_45[7:0]                                ), //i
    .io_apb_PSEL                   (apb3Router_1_io_outputs_5_PSEL             ), //i
    .io_apb_PENABLE                (apb3Router_1_io_outputs_5_PENABLE          ), //i
    .io_apb_PREADY                 (system_i2c_0_io_logic_io_apb_PREADY        ), //o
    .io_apb_PWRITE                 (apb3Router_1_io_outputs_5_PWRITE           ), //i
    .io_apb_PWDATA                 (apb3Router_1_io_outputs_5_PWDATA[31:0]     ), //i
    .io_apb_PRDATA                 (system_i2c_0_io_logic_io_apb_PRDATA[31:0]  ), //o
    .io_i2c_sda_write              (system_i2c_0_io_logic_io_i2c_sda_write     ), //o
    .io_i2c_sda_read               (system_i2c_0_io_sda_read                   ), //i
    .io_i2c_scl_write              (system_i2c_0_io_logic_io_i2c_scl_write     ), //o
    .io_i2c_scl_read               (system_i2c_0_io_scl_read                   ), //i
    .io_interrupt                  (system_i2c_0_io_logic_io_interrupt         ), //o
    .io_systemClk                  (io_systemClk                               ), //i
    .systemCd_logic_outputReset    (systemCd_logic_outputReset                 )  //i
  );
  Apb3Gpio2 system_gpio_0_io_logic (
    .io_gpio_read                  (system_gpio_0_io_read[15:0]                       ), //i
    .io_gpio_write                 (system_gpio_0_io_logic_io_gpio_write[15:0]        ), //o
    .io_gpio_writeEnable           (system_gpio_0_io_logic_io_gpio_writeEnable[15:0]  ), //o
    .io_bus_PADDR                  (_zz_46[11:0]                                      ), //i
    .io_bus_PSEL                   (apb3Router_1_io_outputs_6_PSEL                    ), //i
    .io_bus_PENABLE                (apb3Router_1_io_outputs_6_PENABLE                 ), //i
    .io_bus_PREADY                 (system_gpio_0_io_logic_io_bus_PREADY              ), //o
    .io_bus_PWRITE                 (apb3Router_1_io_outputs_6_PWRITE                  ), //i
    .io_bus_PWDATA                 (apb3Router_1_io_outputs_6_PWDATA[31:0]            ), //i
    .io_bus_PRDATA                 (system_gpio_0_io_logic_io_bus_PRDATA[31:0]        ), //o
    .io_bus_PSLVERROR              (system_gpio_0_io_logic_io_bus_PSLVERROR           ), //o
    .io_interrupt                  (system_gpio_0_io_logic_io_interrupt[15:0]         ), //o
    .io_systemClk                  (io_systemClk                                      ), //i
    .systemCd_logic_outputReset    (systemCd_logic_outputReset                        )  //i
  );
  BufferCC_5 userInterruptA_buffercc (
    .io_dataIn                     (userInterruptA                      ), //i
    .io_dataOut                    (userInterruptA_buffercc_io_dataOut  ), //o
    .io_systemClk                  (io_systemClk                        ), //i
    .systemCd_logic_outputReset    (systemCd_logic_outputReset          )  //i
  );
  BufferCC_6 bufferCC_9 (
    .io_initial       (_zz_47                 ), //i
    .io_dataIn        (_zz_48                 ), //i
    .io_dataOut       (bufferCC_9_io_dataOut  ), //o
    .io_systemClk     (io_systemClk           ), //i
    .io_asyncReset    (io_asyncReset          )  //i
  );
  BufferCC_7 bufferCC_10 (
    .io_initial                   (_zz_49                     ), //i
    .io_dataIn                    (_zz_50                     ), //i
    .io_dataOut                   (bufferCC_10_io_dataOut     ), //o
    .io_systemClk                 (io_systemClk               ), //i
    .debugCd_logic_outputReset    (debugCd_logic_outputReset  )  //i
  );
  VexRiscv system_cpu_logic_cpu (
    .iBus_cmd_valid                   (system_cpu_logic_cpu_iBus_cmd_valid                  ), //o
    .iBus_cmd_ready                   (system_cpu_iBus_cmd_ready                            ), //i
    .iBus_cmd_payload_pc              (system_cpu_logic_cpu_iBus_cmd_payload_pc[31:0]       ), //o
    .iBus_rsp_valid                   (system_cpu_iBus_rsp_valid                            ), //i
    .iBus_rsp_payload_error           (_zz_51                                               ), //i
    .iBus_rsp_payload_inst            (system_cpu_iBus_rsp_payload_fragment_data[31:0]      ), //i
    .timerInterrupt                   (system_machineTimer_logic_io_mTimeInterrupt          ), //i
    .externalInterrupt                (system_cpu_externalInterrupt_plic_target_iep         ), //i
    .softwareInterrupt                (_zz_52                                               ), //i
    .debug_bus_cmd_valid              (systemDebugger_1_io_mem_cmd_valid                    ), //i
    .debug_bus_cmd_ready              (system_cpu_logic_cpu_debug_bus_cmd_ready             ), //o
    .debug_bus_cmd_payload_wr         (systemDebugger_1_io_mem_cmd_payload_wr               ), //i
    .debug_bus_cmd_payload_address    (_zz_53[7:0]                                          ), //i
    .debug_bus_cmd_payload_data       (systemDebugger_1_io_mem_cmd_payload_data[31:0]       ), //i
    .debug_bus_rsp_data               (system_cpu_logic_cpu_debug_bus_rsp_data[31:0]        ), //o
    .debug_resetOut                   (system_cpu_logic_cpu_debug_resetOut                  ), //o
    .dBus_cmd_valid                   (system_cpu_logic_cpu_dBus_cmd_valid                  ), //o
    .dBus_cmd_ready                   (system_cpu_dBus_cmd_ready                            ), //i
    .dBus_cmd_payload_wr              (system_cpu_logic_cpu_dBus_cmd_payload_wr             ), //o
    .dBus_cmd_payload_address         (system_cpu_logic_cpu_dBus_cmd_payload_address[31:0]  ), //o
    .dBus_cmd_payload_data            (system_cpu_logic_cpu_dBus_cmd_payload_data[31:0]     ), //o
    .dBus_cmd_payload_size            (system_cpu_logic_cpu_dBus_cmd_payload_size[1:0]      ), //o
    .dBus_rsp_ready                   (_zz_54                                               ), //i
    .dBus_rsp_error                   (_zz_55                                               ), //i
    .dBus_rsp_data                    (system_cpu_dBus_rsp_payload_fragment_data[31:0]      ), //i
    .io_systemClk                     (io_systemClk                                         ), //i
    .systemCd_logic_outputReset       (systemCd_logic_outputReset                           ), //i
    .debugCd_logic_outputReset        (debugCd_logic_outputReset                            )  //i
  );
  JtagBridgeNoTap jtagBridgeNoTap_1 (
    .io_ctrl_tdi                       (system_cpu_jtagInstructionCtrl_tdi                 ), //i
    .io_ctrl_enable                    (system_cpu_jtagInstructionCtrl_enable              ), //i
    .io_ctrl_capture                   (system_cpu_jtagInstructionCtrl_capture             ), //i
    .io_ctrl_shift                     (system_cpu_jtagInstructionCtrl_shift               ), //i
    .io_ctrl_update                    (system_cpu_jtagInstructionCtrl_update              ), //i
    .io_ctrl_reset                     (system_cpu_jtagInstructionCtrl_reset               ), //i
    .io_ctrl_tdo                       (jtagBridgeNoTap_1_io_ctrl_tdo                      ), //o
    .io_remote_cmd_valid               (jtagBridgeNoTap_1_io_remote_cmd_valid              ), //o
    .io_remote_cmd_ready               (systemDebugger_1_io_remote_cmd_ready               ), //i
    .io_remote_cmd_payload_last        (jtagBridgeNoTap_1_io_remote_cmd_payload_last       ), //o
    .io_remote_cmd_payload_fragment    (jtagBridgeNoTap_1_io_remote_cmd_payload_fragment   ), //o
    .io_remote_rsp_valid               (systemDebugger_1_io_remote_rsp_valid               ), //i
    .io_remote_rsp_ready               (jtagBridgeNoTap_1_io_remote_rsp_ready              ), //o
    .io_remote_rsp_payload_error       (systemDebugger_1_io_remote_rsp_payload_error       ), //i
    .io_remote_rsp_payload_data        (systemDebugger_1_io_remote_rsp_payload_data[31:0]  ), //i
    .io_systemClk                      (io_systemClk                                       ), //i
    .debugCd_logic_outputReset         (debugCd_logic_outputReset                          ), //i
    .jtagCtrl_tck                      (jtagCtrl_tck                                       )  //i
  );
  SystemDebugger systemDebugger_1 (
    .io_remote_cmd_valid               (jtagBridgeNoTap_1_io_remote_cmd_valid              ), //i
    .io_remote_cmd_ready               (systemDebugger_1_io_remote_cmd_ready               ), //o
    .io_remote_cmd_payload_last        (jtagBridgeNoTap_1_io_remote_cmd_payload_last       ), //i
    .io_remote_cmd_payload_fragment    (jtagBridgeNoTap_1_io_remote_cmd_payload_fragment   ), //i
    .io_remote_rsp_valid               (systemDebugger_1_io_remote_rsp_valid               ), //o
    .io_remote_rsp_ready               (jtagBridgeNoTap_1_io_remote_rsp_ready              ), //i
    .io_remote_rsp_payload_error       (systemDebugger_1_io_remote_rsp_payload_error       ), //o
    .io_remote_rsp_payload_data        (systemDebugger_1_io_remote_rsp_payload_data[31:0]  ), //o
    .io_mem_cmd_valid                  (systemDebugger_1_io_mem_cmd_valid                  ), //o
    .io_mem_cmd_ready                  (system_cpu_logic_cpu_debug_bus_cmd_ready           ), //i
    .io_mem_cmd_payload_address        (systemDebugger_1_io_mem_cmd_payload_address[31:0]  ), //o
    .io_mem_cmd_payload_data           (systemDebugger_1_io_mem_cmd_payload_data[31:0]     ), //o
    .io_mem_cmd_payload_wr             (systemDebugger_1_io_mem_cmd_payload_wr             ), //o
    .io_mem_cmd_payload_size           (systemDebugger_1_io_mem_cmd_payload_size[1:0]      ), //o
    .io_mem_rsp_valid                  (_zz_3                                              ), //i
    .io_mem_rsp_payload                (system_cpu_logic_cpu_debug_bus_rsp_data[31:0]      ), //i
    .io_systemClk                      (io_systemClk                                       ), //i
    .debugCd_logic_outputReset         (debugCd_logic_outputReset                          )  //i
  );
  BmbDecoder system_cpu_iBus_decoder (
    .io_input_cmd_valid                           (system_cpu_iBus_cmd_valid                                                ), //i
    .io_input_cmd_ready                           (system_cpu_iBus_decoder_io_input_cmd_ready                               ), //o
    .io_input_cmd_payload_last                    (system_cpu_iBus_cmd_payload_last                                         ), //i
    .io_input_cmd_payload_fragment_opcode         (system_cpu_iBus_cmd_payload_fragment_opcode                              ), //i
    .io_input_cmd_payload_fragment_address        (system_cpu_iBus_cmd_payload_fragment_address[31:0]                       ), //i
    .io_input_cmd_payload_fragment_length         (system_cpu_iBus_cmd_payload_fragment_length[1:0]                         ), //i
    .io_input_rsp_valid                           (system_cpu_iBus_decoder_io_input_rsp_valid                               ), //o
    .io_input_rsp_ready                           (system_cpu_iBus_rsp_ready                                                ), //i
    .io_input_rsp_payload_last                    (system_cpu_iBus_decoder_io_input_rsp_payload_last                        ), //o
    .io_input_rsp_payload_fragment_opcode         (system_cpu_iBus_decoder_io_input_rsp_payload_fragment_opcode             ), //o
    .io_input_rsp_payload_fragment_data           (system_cpu_iBus_decoder_io_input_rsp_payload_fragment_data[31:0]         ), //o
    .io_outputs_0_cmd_valid                       (system_cpu_iBus_decoder_io_outputs_0_cmd_valid                           ), //o
    .io_outputs_0_cmd_ready                       (system_ramA_bmb_arbiter_io_inputs_1_cmd_ready                            ), //i
    .io_outputs_0_cmd_payload_last                (system_cpu_iBus_decoder_io_outputs_0_cmd_payload_last                    ), //o
    .io_outputs_0_cmd_payload_fragment_opcode     (system_cpu_iBus_decoder_io_outputs_0_cmd_payload_fragment_opcode         ), //o
    .io_outputs_0_cmd_payload_fragment_address    (system_cpu_iBus_decoder_io_outputs_0_cmd_payload_fragment_address[31:0]  ), //o
    .io_outputs_0_cmd_payload_fragment_length     (system_cpu_iBus_decoder_io_outputs_0_cmd_payload_fragment_length[1:0]    ), //o
    .io_outputs_0_rsp_valid                       (system_ramA_bmb_arbiter_io_inputs_1_rsp_valid                            ), //i
    .io_outputs_0_rsp_ready                       (system_cpu_iBus_decoder_io_outputs_0_rsp_ready                           ), //o
    .io_outputs_0_rsp_payload_last                (system_ramA_bmb_arbiter_io_inputs_1_rsp_payload_last                     ), //i
    .io_outputs_0_rsp_payload_fragment_opcode     (system_ramA_bmb_arbiter_io_inputs_1_rsp_payload_fragment_opcode          ), //i
    .io_outputs_0_rsp_payload_fragment_data       (system_ramA_bmb_arbiter_io_inputs_1_rsp_payload_fragment_data[31:0]      ), //i
    .io_systemClk                                 (io_systemClk                                                             ), //i
    .systemCd_logic_outputReset                   (systemCd_logic_outputReset                                               )  //i
  );
  BmbOnChipRam system_ramA_logic (
    .io_bus_cmd_valid                       (system_ramA_bmb_arbiter_io_output_cmd_valid                           ), //i
    .io_bus_cmd_ready                       (system_ramA_logic_io_bus_cmd_ready                                    ), //o
    .io_bus_cmd_payload_last                (system_ramA_bmb_arbiter_io_output_cmd_payload_last                    ), //i
    .io_bus_cmd_payload_fragment_source     (system_ramA_bmb_arbiter_io_output_cmd_payload_fragment_source         ), //i
    .io_bus_cmd_payload_fragment_opcode     (system_ramA_bmb_arbiter_io_output_cmd_payload_fragment_opcode         ), //i
    .io_bus_cmd_payload_fragment_address    (system_ramA_bmb_arbiter_io_output_cmd_payload_fragment_address[11:0]  ), //i
    .io_bus_cmd_payload_fragment_length     (system_ramA_bmb_arbiter_io_output_cmd_payload_fragment_length[1:0]    ), //i
    .io_bus_cmd_payload_fragment_data       (system_ramA_bmb_arbiter_io_output_cmd_payload_fragment_data[31:0]     ), //i
    .io_bus_cmd_payload_fragment_mask       (system_ramA_bmb_arbiter_io_output_cmd_payload_fragment_mask[3:0]      ), //i
    .io_bus_cmd_payload_fragment_context    (system_ramA_bmb_arbiter_io_output_cmd_payload_fragment_context        ), //i
    .io_bus_rsp_valid                       (system_ramA_logic_io_bus_rsp_valid                                    ), //o
    .io_bus_rsp_ready                       (system_ramA_bmb_arbiter_io_output_rsp_ready                           ), //i
    .io_bus_rsp_payload_last                (system_ramA_logic_io_bus_rsp_payload_last                             ), //o
    .io_bus_rsp_payload_fragment_source     (system_ramA_logic_io_bus_rsp_payload_fragment_source                  ), //o
    .io_bus_rsp_payload_fragment_opcode     (system_ramA_logic_io_bus_rsp_payload_fragment_opcode                  ), //o
    .io_bus_rsp_payload_fragment_data       (system_ramA_logic_io_bus_rsp_payload_fragment_data[31:0]              ), //o
    .io_bus_rsp_payload_fragment_context    (system_ramA_logic_io_bus_rsp_payload_fragment_context                 ), //o
    .io_systemClk                           (io_systemClk                                                          ), //i
    .systemCd_logic_outputReset             (systemCd_logic_outputReset                                            )  //i
  );
  BmbArbiter system_ramA_bmb_arbiter (
    .io_inputs_0_cmd_valid                       (system_cpu_dBus_decoder_io_outputs_0_cmd_valid                         ), //i
    .io_inputs_0_cmd_ready                       (system_ramA_bmb_arbiter_io_inputs_0_cmd_ready                          ), //o
    .io_inputs_0_cmd_payload_last                (system_cpu_dBus_decoder_io_outputs_0_cmd_payload_last                  ), //i
    .io_inputs_0_cmd_payload_fragment_opcode     (system_cpu_dBus_decoder_io_outputs_0_cmd_payload_fragment_opcode       ), //i
    .io_inputs_0_cmd_payload_fragment_address    (_zz_56[11:0]                                                           ), //i
    .io_inputs_0_cmd_payload_fragment_length     (system_cpu_dBus_decoder_io_outputs_0_cmd_payload_fragment_length[1:0]  ), //i
    .io_inputs_0_cmd_payload_fragment_data       (system_cpu_dBus_decoder_io_outputs_0_cmd_payload_fragment_data[31:0]   ), //i
    .io_inputs_0_cmd_payload_fragment_mask       (system_cpu_dBus_decoder_io_outputs_0_cmd_payload_fragment_mask[3:0]    ), //i
    .io_inputs_0_cmd_payload_fragment_context    (system_cpu_dBus_decoder_io_outputs_0_cmd_payload_fragment_context      ), //i
    .io_inputs_0_rsp_valid                       (system_ramA_bmb_arbiter_io_inputs_0_rsp_valid                          ), //o
    .io_inputs_0_rsp_ready                       (system_cpu_dBus_decoder_io_outputs_0_rsp_ready                         ), //i
    .io_inputs_0_rsp_payload_last                (system_ramA_bmb_arbiter_io_inputs_0_rsp_payload_last                   ), //o
    .io_inputs_0_rsp_payload_fragment_opcode     (system_ramA_bmb_arbiter_io_inputs_0_rsp_payload_fragment_opcode        ), //o
    .io_inputs_0_rsp_payload_fragment_data       (system_ramA_bmb_arbiter_io_inputs_0_rsp_payload_fragment_data[31:0]    ), //o
    .io_inputs_0_rsp_payload_fragment_context    (system_ramA_bmb_arbiter_io_inputs_0_rsp_payload_fragment_context       ), //o
    .io_inputs_1_cmd_valid                       (system_cpu_iBus_decoder_io_outputs_0_cmd_valid                         ), //i
    .io_inputs_1_cmd_ready                       (system_ramA_bmb_arbiter_io_inputs_1_cmd_ready                          ), //o
    .io_inputs_1_cmd_payload_last                (system_cpu_iBus_decoder_io_outputs_0_cmd_payload_last                  ), //i
    .io_inputs_1_cmd_payload_fragment_opcode     (system_cpu_iBus_decoder_io_outputs_0_cmd_payload_fragment_opcode       ), //i
    .io_inputs_1_cmd_payload_fragment_address    (_zz_57[11:0]                                                           ), //i
    .io_inputs_1_cmd_payload_fragment_length     (system_cpu_iBus_decoder_io_outputs_0_cmd_payload_fragment_length[1:0]  ), //i
    .io_inputs_1_cmd_payload_fragment_data       (_zz_58[31:0]                                                           ), //i
    .io_inputs_1_cmd_payload_fragment_mask       (_zz_59[3:0]                                                            ), //i
    .io_inputs_1_cmd_payload_fragment_context    (_zz_60                                                                 ), //i
    .io_inputs_1_rsp_valid                       (system_ramA_bmb_arbiter_io_inputs_1_rsp_valid                          ), //o
    .io_inputs_1_rsp_ready                       (system_cpu_iBus_decoder_io_outputs_0_rsp_ready                         ), //i
    .io_inputs_1_rsp_payload_last                (system_ramA_bmb_arbiter_io_inputs_1_rsp_payload_last                   ), //o
    .io_inputs_1_rsp_payload_fragment_opcode     (system_ramA_bmb_arbiter_io_inputs_1_rsp_payload_fragment_opcode        ), //o
    .io_inputs_1_rsp_payload_fragment_data       (system_ramA_bmb_arbiter_io_inputs_1_rsp_payload_fragment_data[31:0]    ), //o
    .io_inputs_1_rsp_payload_fragment_context    (system_ramA_bmb_arbiter_io_inputs_1_rsp_payload_fragment_context       ), //o
    .io_output_cmd_valid                         (system_ramA_bmb_arbiter_io_output_cmd_valid                            ), //o
    .io_output_cmd_ready                         (system_ramA_logic_io_bus_cmd_ready                                     ), //i
    .io_output_cmd_payload_last                  (system_ramA_bmb_arbiter_io_output_cmd_payload_last                     ), //o
    .io_output_cmd_payload_fragment_source       (system_ramA_bmb_arbiter_io_output_cmd_payload_fragment_source          ), //o
    .io_output_cmd_payload_fragment_opcode       (system_ramA_bmb_arbiter_io_output_cmd_payload_fragment_opcode          ), //o
    .io_output_cmd_payload_fragment_address      (system_ramA_bmb_arbiter_io_output_cmd_payload_fragment_address[11:0]   ), //o
    .io_output_cmd_payload_fragment_length       (system_ramA_bmb_arbiter_io_output_cmd_payload_fragment_length[1:0]     ), //o
    .io_output_cmd_payload_fragment_data         (system_ramA_bmb_arbiter_io_output_cmd_payload_fragment_data[31:0]      ), //o
    .io_output_cmd_payload_fragment_mask         (system_ramA_bmb_arbiter_io_output_cmd_payload_fragment_mask[3:0]       ), //o
    .io_output_cmd_payload_fragment_context      (system_ramA_bmb_arbiter_io_output_cmd_payload_fragment_context         ), //o
    .io_output_rsp_valid                         (system_ramA_logic_io_bus_rsp_valid                                     ), //i
    .io_output_rsp_ready                         (system_ramA_bmb_arbiter_io_output_rsp_ready                            ), //o
    .io_output_rsp_payload_last                  (system_ramA_logic_io_bus_rsp_payload_last                              ), //i
    .io_output_rsp_payload_fragment_source       (system_ramA_logic_io_bus_rsp_payload_fragment_source                   ), //i
    .io_output_rsp_payload_fragment_opcode       (system_ramA_logic_io_bus_rsp_payload_fragment_opcode                   ), //i
    .io_output_rsp_payload_fragment_data         (system_ramA_logic_io_bus_rsp_payload_fragment_data[31:0]               ), //i
    .io_output_rsp_payload_fragment_context      (system_ramA_logic_io_bus_rsp_payload_fragment_context                  ), //i
    .io_systemClk                                (io_systemClk                                                           ), //i
    .systemCd_logic_outputReset                  (systemCd_logic_outputReset                                             )  //i
  );
  Apb3SpiXdrMasterCtrl system_spi_0_io_logic (
    .io_apb_PADDR                  (_zz_61[7:0]                                      ), //i
    .io_apb_PSEL                   (apb3Router_1_io_outputs_3_PSEL                   ), //i
    .io_apb_PENABLE                (apb3Router_1_io_outputs_3_PENABLE                ), //i
    .io_apb_PREADY                 (system_spi_0_io_logic_io_apb_PREADY              ), //o
    .io_apb_PWRITE                 (apb3Router_1_io_outputs_3_PWRITE                 ), //i
    .io_apb_PWDATA                 (apb3Router_1_io_outputs_3_PWDATA[31:0]           ), //i
    .io_apb_PRDATA                 (system_spi_0_io_logic_io_apb_PRDATA[31:0]        ), //o
    .io_spi_sclk_write             (system_spi_0_io_logic_io_spi_sclk_write          ), //o
    .io_spi_data_0_writeEnable     (system_spi_0_io_logic_io_spi_data_0_writeEnable  ), //o
    .io_spi_data_0_read            (system_spi_0_io_data_0_read                      ), //i
    .io_spi_data_0_write           (system_spi_0_io_logic_io_spi_data_0_write        ), //o
    .io_spi_data_1_writeEnable     (system_spi_0_io_logic_io_spi_data_1_writeEnable  ), //o
    .io_spi_data_1_read            (system_spi_0_io_data_1_read                      ), //i
    .io_spi_data_1_write           (system_spi_0_io_logic_io_spi_data_1_write        ), //o
    .io_spi_data_2_writeEnable     (system_spi_0_io_logic_io_spi_data_2_writeEnable  ), //o
    .io_spi_data_2_read            (system_spi_0_io_data_2_read                      ), //i
    .io_spi_data_2_write           (system_spi_0_io_logic_io_spi_data_2_write        ), //o
    .io_spi_data_3_writeEnable     (system_spi_0_io_logic_io_spi_data_3_writeEnable  ), //o
    .io_spi_data_3_read            (system_spi_0_io_data_3_read                      ), //i
    .io_spi_data_3_write           (system_spi_0_io_logic_io_spi_data_3_write        ), //o
    .io_spi_ss                     (system_spi_0_io_logic_io_spi_ss                  ), //o
    .io_interrupt                  (system_spi_0_io_logic_io_interrupt               ), //o
    .io_systemClk                  (io_systemClk                                     ), //i
    .systemCd_logic_outputReset    (systemCd_logic_outputReset                       )  //i
  );
  Apb3SpiXdrMasterCtrl system_spi_1_io_logic (
    .io_apb_PADDR                  (_zz_62[7:0]                                      ), //i
    .io_apb_PSEL                   (apb3Router_1_io_outputs_4_PSEL                   ), //i
    .io_apb_PENABLE                (apb3Router_1_io_outputs_4_PENABLE                ), //i
    .io_apb_PREADY                 (system_spi_1_io_logic_io_apb_PREADY              ), //o
    .io_apb_PWRITE                 (apb3Router_1_io_outputs_4_PWRITE                 ), //i
    .io_apb_PWDATA                 (apb3Router_1_io_outputs_4_PWDATA[31:0]           ), //i
    .io_apb_PRDATA                 (system_spi_1_io_logic_io_apb_PRDATA[31:0]        ), //o
    .io_spi_sclk_write             (system_spi_1_io_logic_io_spi_sclk_write          ), //o
    .io_spi_data_0_writeEnable     (system_spi_1_io_logic_io_spi_data_0_writeEnable  ), //o
    .io_spi_data_0_read            (system_spi_1_io_data_0_read                      ), //i
    .io_spi_data_0_write           (system_spi_1_io_logic_io_spi_data_0_write        ), //o
    .io_spi_data_1_writeEnable     (system_spi_1_io_logic_io_spi_data_1_writeEnable  ), //o
    .io_spi_data_1_read            (system_spi_1_io_data_1_read                      ), //i
    .io_spi_data_1_write           (system_spi_1_io_logic_io_spi_data_1_write        ), //o
    .io_spi_data_2_writeEnable     (system_spi_1_io_logic_io_spi_data_2_writeEnable  ), //o
    .io_spi_data_2_read            (system_spi_1_io_data_2_read                      ), //i
    .io_spi_data_2_write           (system_spi_1_io_logic_io_spi_data_2_write        ), //o
    .io_spi_data_3_writeEnable     (system_spi_1_io_logic_io_spi_data_3_writeEnable  ), //o
    .io_spi_data_3_read            (system_spi_1_io_data_3_read                      ), //i
    .io_spi_data_3_write           (system_spi_1_io_logic_io_spi_data_3_write        ), //o
    .io_spi_ss                     (system_spi_1_io_logic_io_spi_ss                  ), //o
    .io_interrupt                  (system_spi_1_io_logic_io_interrupt               ), //o
    .io_systemClk                  (io_systemClk                                     ), //i
    .systemCd_logic_outputReset    (systemCd_logic_outputReset                       )  //i
  );
  BufferCC_8 bufferCC_11 (
    .io_initial               (_zz_63                  ), //i
    .io_dataIn                (_zz_64                  ), //i
    .io_dataOut               (bufferCC_11_io_dataOut  ), //o
    .io_systemClk             (io_systemClk            ), //i
    .system_cpu_debugReset    (system_cpu_debugReset   )  //i
  );
  BmbDecoder_1 system_cpu_dBus_decoder (
    .io_input_cmd_valid                           (system_cpu_dBus_cmd_valid                                                          ), //i
    .io_input_cmd_ready                           (system_cpu_dBus_decoder_io_input_cmd_ready                                         ), //o
    .io_input_cmd_payload_last                    (system_cpu_dBus_cmd_payload_last                                                   ), //i
    .io_input_cmd_payload_fragment_opcode         (system_cpu_dBus_cmd_payload_fragment_opcode                                        ), //i
    .io_input_cmd_payload_fragment_address        (system_cpu_dBus_cmd_payload_fragment_address[31:0]                                 ), //i
    .io_input_cmd_payload_fragment_length         (system_cpu_dBus_cmd_payload_fragment_length[1:0]                                   ), //i
    .io_input_cmd_payload_fragment_data           (system_cpu_dBus_cmd_payload_fragment_data[31:0]                                    ), //i
    .io_input_cmd_payload_fragment_mask           (system_cpu_dBus_cmd_payload_fragment_mask[3:0]                                     ), //i
    .io_input_cmd_payload_fragment_context        (system_cpu_dBus_cmd_payload_fragment_context                                       ), //i
    .io_input_rsp_valid                           (system_cpu_dBus_decoder_io_input_rsp_valid                                         ), //o
    .io_input_rsp_ready                           (system_cpu_dBus_rsp_ready                                                          ), //i
    .io_input_rsp_payload_last                    (system_cpu_dBus_decoder_io_input_rsp_payload_last                                  ), //o
    .io_input_rsp_payload_fragment_opcode         (system_cpu_dBus_decoder_io_input_rsp_payload_fragment_opcode                       ), //o
    .io_input_rsp_payload_fragment_data           (system_cpu_dBus_decoder_io_input_rsp_payload_fragment_data[31:0]                   ), //o
    .io_input_rsp_payload_fragment_context        (system_cpu_dBus_decoder_io_input_rsp_payload_fragment_context                      ), //o
    .io_outputs_0_cmd_valid                       (system_cpu_dBus_decoder_io_outputs_0_cmd_valid                                     ), //o
    .io_outputs_0_cmd_ready                       (system_ramA_bmb_arbiter_io_inputs_0_cmd_ready                                      ), //i
    .io_outputs_0_cmd_payload_last                (system_cpu_dBus_decoder_io_outputs_0_cmd_payload_last                              ), //o
    .io_outputs_0_cmd_payload_fragment_opcode     (system_cpu_dBus_decoder_io_outputs_0_cmd_payload_fragment_opcode                   ), //o
    .io_outputs_0_cmd_payload_fragment_address    (system_cpu_dBus_decoder_io_outputs_0_cmd_payload_fragment_address[31:0]            ), //o
    .io_outputs_0_cmd_payload_fragment_length     (system_cpu_dBus_decoder_io_outputs_0_cmd_payload_fragment_length[1:0]              ), //o
    .io_outputs_0_cmd_payload_fragment_data       (system_cpu_dBus_decoder_io_outputs_0_cmd_payload_fragment_data[31:0]               ), //o
    .io_outputs_0_cmd_payload_fragment_mask       (system_cpu_dBus_decoder_io_outputs_0_cmd_payload_fragment_mask[3:0]                ), //o
    .io_outputs_0_cmd_payload_fragment_context    (system_cpu_dBus_decoder_io_outputs_0_cmd_payload_fragment_context                  ), //o
    .io_outputs_0_rsp_valid                       (system_ramA_bmb_arbiter_io_inputs_0_rsp_valid                                      ), //i
    .io_outputs_0_rsp_ready                       (system_cpu_dBus_decoder_io_outputs_0_rsp_ready                                     ), //o
    .io_outputs_0_rsp_payload_last                (system_ramA_bmb_arbiter_io_inputs_0_rsp_payload_last                               ), //i
    .io_outputs_0_rsp_payload_fragment_opcode     (system_ramA_bmb_arbiter_io_inputs_0_rsp_payload_fragment_opcode                    ), //i
    .io_outputs_0_rsp_payload_fragment_data       (system_ramA_bmb_arbiter_io_inputs_0_rsp_payload_fragment_data[31:0]                ), //i
    .io_outputs_0_rsp_payload_fragment_context    (system_ramA_bmb_arbiter_io_inputs_0_rsp_payload_fragment_context                   ), //i
    .io_outputs_1_cmd_valid                       (system_cpu_dBus_decoder_io_outputs_1_cmd_valid                                     ), //o
    .io_outputs_1_cmd_ready                       (system_peripheralBridge_input_arbiter_io_inputs_0_cmd_ready                        ), //i
    .io_outputs_1_cmd_payload_last                (system_cpu_dBus_decoder_io_outputs_1_cmd_payload_last                              ), //o
    .io_outputs_1_cmd_payload_fragment_opcode     (system_cpu_dBus_decoder_io_outputs_1_cmd_payload_fragment_opcode                   ), //o
    .io_outputs_1_cmd_payload_fragment_address    (system_cpu_dBus_decoder_io_outputs_1_cmd_payload_fragment_address[31:0]            ), //o
    .io_outputs_1_cmd_payload_fragment_length     (system_cpu_dBus_decoder_io_outputs_1_cmd_payload_fragment_length[1:0]              ), //o
    .io_outputs_1_cmd_payload_fragment_data       (system_cpu_dBus_decoder_io_outputs_1_cmd_payload_fragment_data[31:0]               ), //o
    .io_outputs_1_cmd_payload_fragment_mask       (system_cpu_dBus_decoder_io_outputs_1_cmd_payload_fragment_mask[3:0]                ), //o
    .io_outputs_1_cmd_payload_fragment_context    (system_cpu_dBus_decoder_io_outputs_1_cmd_payload_fragment_context                  ), //o
    .io_outputs_1_rsp_valid                       (system_peripheralBridge_input_arbiter_io_inputs_0_rsp_valid                        ), //i
    .io_outputs_1_rsp_ready                       (system_cpu_dBus_decoder_io_outputs_1_rsp_ready                                     ), //o
    .io_outputs_1_rsp_payload_last                (system_peripheralBridge_input_arbiter_io_inputs_0_rsp_payload_last                 ), //i
    .io_outputs_1_rsp_payload_fragment_opcode     (system_peripheralBridge_input_arbiter_io_inputs_0_rsp_payload_fragment_opcode      ), //i
    .io_outputs_1_rsp_payload_fragment_data       (system_peripheralBridge_input_arbiter_io_inputs_0_rsp_payload_fragment_data[31:0]  ), //i
    .io_outputs_1_rsp_payload_fragment_context    (system_peripheralBridge_input_arbiter_io_inputs_0_rsp_payload_fragment_context     ), //i
    .io_systemClk                                 (io_systemClk                                                                       ), //i
    .systemCd_logic_outputReset                   (systemCd_logic_outputReset                                                         )  //i
  );
  Apb3Decoder system_apbDecoder_input_decoder (
    .io_input_PADDR         (system_apbDecoder_input_PADDR[23:0]                     ), //i
    .io_input_PSEL          (system_apbDecoder_input_PSEL                            ), //i
    .io_input_PENABLE       (system_apbDecoder_input_PENABLE                         ), //i
    .io_input_PREADY        (system_apbDecoder_input_decoder_io_input_PREADY         ), //o
    .io_input_PWRITE        (system_apbDecoder_input_PWRITE                          ), //i
    .io_input_PWDATA        (system_apbDecoder_input_PWDATA[31:0]                    ), //i
    .io_input_PRDATA        (system_apbDecoder_input_decoder_io_input_PRDATA[31:0]   ), //o
    .io_input_PSLVERROR     (system_apbDecoder_input_decoder_io_input_PSLVERROR      ), //o
    .io_output_PADDR        (system_apbDecoder_input_decoder_io_output_PADDR[23:0]   ), //o
    .io_output_PSEL         (system_apbDecoder_input_decoder_io_output_PSEL[7:0]     ), //o
    .io_output_PENABLE      (system_apbDecoder_input_decoder_io_output_PENABLE       ), //o
    .io_output_PREADY       (apb3Router_1_io_input_PREADY                            ), //i
    .io_output_PWRITE       (system_apbDecoder_input_decoder_io_output_PWRITE        ), //o
    .io_output_PWDATA       (system_apbDecoder_input_decoder_io_output_PWDATA[31:0]  ), //o
    .io_output_PRDATA       (apb3Router_1_io_input_PRDATA[31:0]                      ), //i
    .io_output_PSLVERROR    (apb3Router_1_io_input_PSLVERROR                         )  //i
  );
  Apb3Router apb3Router_1 (
    .io_input_PADDR                (system_apbDecoder_input_decoder_io_output_PADDR[23:0]   ), //i
    .io_input_PSEL                 (system_apbDecoder_input_decoder_io_output_PSEL[7:0]     ), //i
    .io_input_PENABLE              (system_apbDecoder_input_decoder_io_output_PENABLE       ), //i
    .io_input_PREADY               (apb3Router_1_io_input_PREADY                            ), //o
    .io_input_PWRITE               (system_apbDecoder_input_decoder_io_output_PWRITE        ), //i
    .io_input_PWDATA               (system_apbDecoder_input_decoder_io_output_PWDATA[31:0]  ), //i
    .io_input_PRDATA               (apb3Router_1_io_input_PRDATA[31:0]                      ), //o
    .io_input_PSLVERROR            (apb3Router_1_io_input_PSLVERROR                         ), //o
    .io_outputs_0_PADDR            (apb3Router_1_io_outputs_0_PADDR[23:0]                   ), //o
    .io_outputs_0_PSEL             (apb3Router_1_io_outputs_0_PSEL                          ), //o
    .io_outputs_0_PENABLE          (apb3Router_1_io_outputs_0_PENABLE                       ), //o
    .io_outputs_0_PREADY           (system_plic_logic_apb_PREADY                            ), //i
    .io_outputs_0_PWRITE           (apb3Router_1_io_outputs_0_PWRITE                        ), //o
    .io_outputs_0_PWDATA           (apb3Router_1_io_outputs_0_PWDATA[31:0]                  ), //o
    .io_outputs_0_PRDATA           (system_plic_logic_apb_PRDATA[31:0]                      ), //i
    .io_outputs_0_PSLVERROR        (system_plic_logic_apb_PSLVERROR                         ), //i
    .io_outputs_1_PADDR            (apb3Router_1_io_outputs_1_PADDR[23:0]                   ), //o
    .io_outputs_1_PSEL             (apb3Router_1_io_outputs_1_PSEL                          ), //o
    .io_outputs_1_PENABLE          (apb3Router_1_io_outputs_1_PENABLE                       ), //o
    .io_outputs_1_PREADY           (system_machineTimer_logic_io_bus_PREADY                 ), //i
    .io_outputs_1_PWRITE           (apb3Router_1_io_outputs_1_PWRITE                        ), //o
    .io_outputs_1_PWDATA           (apb3Router_1_io_outputs_1_PWDATA[31:0]                  ), //o
    .io_outputs_1_PRDATA           (system_machineTimer_logic_io_bus_PRDATA[31:0]           ), //i
    .io_outputs_1_PSLVERROR        (system_machineTimer_logic_io_bus_PSLVERROR              ), //i
    .io_outputs_2_PADDR            (apb3Router_1_io_outputs_2_PADDR[23:0]                   ), //o
    .io_outputs_2_PSEL             (apb3Router_1_io_outputs_2_PSEL                          ), //o
    .io_outputs_2_PENABLE          (apb3Router_1_io_outputs_2_PENABLE                       ), //o
    .io_outputs_2_PREADY           (system_uart_0_io_logic_io_apb_PREADY                    ), //i
    .io_outputs_2_PWRITE           (apb3Router_1_io_outputs_2_PWRITE                        ), //o
    .io_outputs_2_PWDATA           (apb3Router_1_io_outputs_2_PWDATA[31:0]                  ), //o
    .io_outputs_2_PRDATA           (system_uart_0_io_logic_io_apb_PRDATA[31:0]              ), //i
    .io_outputs_2_PSLVERROR        (_zz_65                                                  ), //i
    .io_outputs_3_PADDR            (apb3Router_1_io_outputs_3_PADDR[23:0]                   ), //o
    .io_outputs_3_PSEL             (apb3Router_1_io_outputs_3_PSEL                          ), //o
    .io_outputs_3_PENABLE          (apb3Router_1_io_outputs_3_PENABLE                       ), //o
    .io_outputs_3_PREADY           (system_spi_0_io_logic_io_apb_PREADY                     ), //i
    .io_outputs_3_PWRITE           (apb3Router_1_io_outputs_3_PWRITE                        ), //o
    .io_outputs_3_PWDATA           (apb3Router_1_io_outputs_3_PWDATA[31:0]                  ), //o
    .io_outputs_3_PRDATA           (system_spi_0_io_logic_io_apb_PRDATA[31:0]               ), //i
    .io_outputs_3_PSLVERROR        (_zz_66                                                  ), //i
    .io_outputs_4_PADDR            (apb3Router_1_io_outputs_4_PADDR[23:0]                   ), //o
    .io_outputs_4_PSEL             (apb3Router_1_io_outputs_4_PSEL                          ), //o
    .io_outputs_4_PENABLE          (apb3Router_1_io_outputs_4_PENABLE                       ), //o
    .io_outputs_4_PREADY           (system_spi_1_io_logic_io_apb_PREADY                     ), //i
    .io_outputs_4_PWRITE           (apb3Router_1_io_outputs_4_PWRITE                        ), //o
    .io_outputs_4_PWDATA           (apb3Router_1_io_outputs_4_PWDATA[31:0]                  ), //o
    .io_outputs_4_PRDATA           (system_spi_1_io_logic_io_apb_PRDATA[31:0]               ), //i
    .io_outputs_4_PSLVERROR        (_zz_67                                                  ), //i
    .io_outputs_5_PADDR            (apb3Router_1_io_outputs_5_PADDR[23:0]                   ), //o
    .io_outputs_5_PSEL             (apb3Router_1_io_outputs_5_PSEL                          ), //o
    .io_outputs_5_PENABLE          (apb3Router_1_io_outputs_5_PENABLE                       ), //o
    .io_outputs_5_PREADY           (system_i2c_0_io_logic_io_apb_PREADY                     ), //i
    .io_outputs_5_PWRITE           (apb3Router_1_io_outputs_5_PWRITE                        ), //o
    .io_outputs_5_PWDATA           (apb3Router_1_io_outputs_5_PWDATA[31:0]                  ), //o
    .io_outputs_5_PRDATA           (system_i2c_0_io_logic_io_apb_PRDATA[31:0]               ), //i
    .io_outputs_5_PSLVERROR        (_zz_68                                                  ), //i
    .io_outputs_6_PADDR            (apb3Router_1_io_outputs_6_PADDR[23:0]                   ), //o
    .io_outputs_6_PSEL             (apb3Router_1_io_outputs_6_PSEL                          ), //o
    .io_outputs_6_PENABLE          (apb3Router_1_io_outputs_6_PENABLE                       ), //o
    .io_outputs_6_PREADY           (system_gpio_0_io_logic_io_bus_PREADY                    ), //i
    .io_outputs_6_PWRITE           (apb3Router_1_io_outputs_6_PWRITE                        ), //o
    .io_outputs_6_PWDATA           (apb3Router_1_io_outputs_6_PWDATA[31:0]                  ), //o
    .io_outputs_6_PRDATA           (system_gpio_0_io_logic_io_bus_PRDATA[31:0]              ), //i
    .io_outputs_6_PSLVERROR        (system_gpio_0_io_logic_io_bus_PSLVERROR                 ), //i
    .io_outputs_7_PADDR            (apb3Router_1_io_outputs_7_PADDR[23:0]                   ), //o
    .io_outputs_7_PSEL             (apb3Router_1_io_outputs_7_PSEL                          ), //o
    .io_outputs_7_PENABLE          (apb3Router_1_io_outputs_7_PENABLE                       ), //o
    .io_outputs_7_PREADY           (io_apbSlave_0_PREADY                                    ), //i
    .io_outputs_7_PWRITE           (apb3Router_1_io_outputs_7_PWRITE                        ), //o
    .io_outputs_7_PWDATA           (apb3Router_1_io_outputs_7_PWDATA[31:0]                  ), //o
    .io_outputs_7_PRDATA           (io_apbSlave_0_PRDATA[31:0]                              ), //i
    .io_outputs_7_PSLVERROR        (io_apbSlave_0_PSLVERROR                                 ), //i
    .io_systemClk                  (io_systemClk                                            ), //i
    .systemCd_logic_outputReset    (systemCd_logic_outputReset                              )  //i
  );
  BmbToApb3Bridge system_peripheralBridge_logic_bridge (
    .io_input_cmd_valid                       (system_peripheralBridge_input_arbiter_io_output_cmd_valid                           ), //i
    .io_input_cmd_ready                       (system_peripheralBridge_logic_bridge_io_input_cmd_ready                             ), //o
    .io_input_cmd_payload_last                (system_peripheralBridge_input_arbiter_io_output_cmd_payload_last                    ), //i
    .io_input_cmd_payload_fragment_opcode     (system_peripheralBridge_input_arbiter_io_output_cmd_payload_fragment_opcode         ), //i
    .io_input_cmd_payload_fragment_address    (system_peripheralBridge_input_arbiter_io_output_cmd_payload_fragment_address[23:0]  ), //i
    .io_input_cmd_payload_fragment_length     (system_peripheralBridge_input_arbiter_io_output_cmd_payload_fragment_length[1:0]    ), //i
    .io_input_cmd_payload_fragment_data       (system_peripheralBridge_input_arbiter_io_output_cmd_payload_fragment_data[31:0]     ), //i
    .io_input_cmd_payload_fragment_mask       (system_peripheralBridge_input_arbiter_io_output_cmd_payload_fragment_mask[3:0]      ), //i
    .io_input_cmd_payload_fragment_context    (system_peripheralBridge_input_arbiter_io_output_cmd_payload_fragment_context        ), //i
    .io_input_rsp_valid                       (system_peripheralBridge_logic_bridge_io_input_rsp_valid                             ), //o
    .io_input_rsp_ready                       (system_peripheralBridge_input_arbiter_io_output_rsp_ready                           ), //i
    .io_input_rsp_payload_last                (system_peripheralBridge_logic_bridge_io_input_rsp_payload_last                      ), //o
    .io_input_rsp_payload_fragment_opcode     (system_peripheralBridge_logic_bridge_io_input_rsp_payload_fragment_opcode           ), //o
    .io_input_rsp_payload_fragment_data       (system_peripheralBridge_logic_bridge_io_input_rsp_payload_fragment_data[31:0]       ), //o
    .io_input_rsp_payload_fragment_context    (system_peripheralBridge_logic_bridge_io_input_rsp_payload_fragment_context          ), //o
    .io_output_PADDR                          (system_peripheralBridge_logic_bridge_io_output_PADDR[23:0]                          ), //o
    .io_output_PSEL                           (system_peripheralBridge_logic_bridge_io_output_PSEL                                 ), //o
    .io_output_PENABLE                        (system_peripheralBridge_logic_bridge_io_output_PENABLE                              ), //o
    .io_output_PREADY                         (system_apbDecoder_input_PREADY                                                      ), //i
    .io_output_PWRITE                         (system_peripheralBridge_logic_bridge_io_output_PWRITE                               ), //o
    .io_output_PWDATA                         (system_peripheralBridge_logic_bridge_io_output_PWDATA[31:0]                         ), //o
    .io_output_PRDATA                         (system_apbDecoder_input_PRDATA[31:0]                                                ), //i
    .io_output_PSLVERROR                      (system_apbDecoder_input_PSLVERROR                                                   ), //i
    .io_systemClk                             (io_systemClk                                                                        ), //i
    .systemCd_logic_outputReset               (systemCd_logic_outputReset                                                          )  //i
  );
  BmbArbiter_1 system_peripheralBridge_input_arbiter (
    .io_inputs_0_cmd_valid                       (system_cpu_dBus_decoder_io_outputs_1_cmd_valid                                      ), //i
    .io_inputs_0_cmd_ready                       (system_peripheralBridge_input_arbiter_io_inputs_0_cmd_ready                         ), //o
    .io_inputs_0_cmd_payload_last                (system_cpu_dBus_decoder_io_outputs_1_cmd_payload_last                               ), //i
    .io_inputs_0_cmd_payload_fragment_opcode     (system_cpu_dBus_decoder_io_outputs_1_cmd_payload_fragment_opcode                    ), //i
    .io_inputs_0_cmd_payload_fragment_address    (_zz_69[23:0]                                                                        ), //i
    .io_inputs_0_cmd_payload_fragment_length     (system_cpu_dBus_decoder_io_outputs_1_cmd_payload_fragment_length[1:0]               ), //i
    .io_inputs_0_cmd_payload_fragment_data       (system_cpu_dBus_decoder_io_outputs_1_cmd_payload_fragment_data[31:0]                ), //i
    .io_inputs_0_cmd_payload_fragment_mask       (system_cpu_dBus_decoder_io_outputs_1_cmd_payload_fragment_mask[3:0]                 ), //i
    .io_inputs_0_cmd_payload_fragment_context    (system_cpu_dBus_decoder_io_outputs_1_cmd_payload_fragment_context                   ), //i
    .io_inputs_0_rsp_valid                       (system_peripheralBridge_input_arbiter_io_inputs_0_rsp_valid                         ), //o
    .io_inputs_0_rsp_ready                       (system_cpu_dBus_decoder_io_outputs_1_rsp_ready                                      ), //i
    .io_inputs_0_rsp_payload_last                (system_peripheralBridge_input_arbiter_io_inputs_0_rsp_payload_last                  ), //o
    .io_inputs_0_rsp_payload_fragment_opcode     (system_peripheralBridge_input_arbiter_io_inputs_0_rsp_payload_fragment_opcode       ), //o
    .io_inputs_0_rsp_payload_fragment_data       (system_peripheralBridge_input_arbiter_io_inputs_0_rsp_payload_fragment_data[31:0]   ), //o
    .io_inputs_0_rsp_payload_fragment_context    (system_peripheralBridge_input_arbiter_io_inputs_0_rsp_payload_fragment_context      ), //o
    .io_output_cmd_valid                         (system_peripheralBridge_input_arbiter_io_output_cmd_valid                           ), //o
    .io_output_cmd_ready                         (system_peripheralBridge_logic_bridge_io_input_cmd_ready                             ), //i
    .io_output_cmd_payload_last                  (system_peripheralBridge_input_arbiter_io_output_cmd_payload_last                    ), //o
    .io_output_cmd_payload_fragment_opcode       (system_peripheralBridge_input_arbiter_io_output_cmd_payload_fragment_opcode         ), //o
    .io_output_cmd_payload_fragment_address      (system_peripheralBridge_input_arbiter_io_output_cmd_payload_fragment_address[23:0]  ), //o
    .io_output_cmd_payload_fragment_length       (system_peripheralBridge_input_arbiter_io_output_cmd_payload_fragment_length[1:0]    ), //o
    .io_output_cmd_payload_fragment_data         (system_peripheralBridge_input_arbiter_io_output_cmd_payload_fragment_data[31:0]     ), //o
    .io_output_cmd_payload_fragment_mask         (system_peripheralBridge_input_arbiter_io_output_cmd_payload_fragment_mask[3:0]      ), //o
    .io_output_cmd_payload_fragment_context      (system_peripheralBridge_input_arbiter_io_output_cmd_payload_fragment_context        ), //o
    .io_output_rsp_valid                         (system_peripheralBridge_logic_bridge_io_input_rsp_valid                             ), //i
    .io_output_rsp_ready                         (system_peripheralBridge_input_arbiter_io_output_rsp_ready                           ), //o
    .io_output_rsp_payload_last                  (system_peripheralBridge_logic_bridge_io_input_rsp_payload_last                      ), //i
    .io_output_rsp_payload_fragment_opcode       (system_peripheralBridge_logic_bridge_io_input_rsp_payload_fragment_opcode           ), //i
    .io_output_rsp_payload_fragment_data         (system_peripheralBridge_logic_bridge_io_input_rsp_payload_fragment_data[31:0]       ), //i
    .io_output_rsp_payload_fragment_context      (system_peripheralBridge_logic_bridge_io_input_rsp_payload_fragment_context          )  //i
  );
  always @ (*) begin
    debugCd_logic_inputResetTrigger = 1'b0;
    if(debugCd_logic_inputResetAdapter_stuff_syncTrigger)begin
      debugCd_logic_inputResetTrigger = 1'b1;
    end
  end

  always @ (*) begin
    debugCd_logic_outputResetUnbuffered = 1'b0;
    if(_zz_70)begin
      debugCd_logic_outputResetUnbuffered = 1'b1;
    end
  end

  always @ (*) begin
    systemCd_logic_inputResetTrigger = 1'b0;
    if(bufferCC_10_io_dataOut)begin
      systemCd_logic_inputResetTrigger = 1'b1;
    end
    if(resetGenerator_stuff_syncTrigger)begin
      systemCd_logic_inputResetTrigger = 1'b1;
    end
  end

  always @ (*) begin
    systemCd_logic_outputResetUnbuffered = 1'b0;
    if(_zz_71)begin
      systemCd_logic_outputResetUnbuffered = 1'b1;
    end
  end

  assign system_uart_0_io_txd = system_uart_0_io_logic_io_uart_txd;
  assign system_i2c_0_io_sda_write = system_i2c_0_io_logic_io_i2c_sda_write;
  assign system_i2c_0_io_scl_write = system_i2c_0_io_logic_io_i2c_scl_write;
  assign system_gpio_0_io_write = system_gpio_0_io_logic_io_gpio_write;
  assign system_gpio_0_io_writeEnable = system_gpio_0_io_logic_io_gpio_writeEnable;
  assign userInterruptA_interrupt = userInterruptA_buffercc_io_dataOut;
  assign io_systemReset = systemCd_logic_outputReset;
  assign system_cpu_jtagInstructionCtrl_tdi = jtagCtrl_tdi;
  assign system_cpu_jtagInstructionCtrl_enable = jtagCtrl_enable;
  assign system_cpu_jtagInstructionCtrl_capture = jtagCtrl_capture;
  assign system_cpu_jtagInstructionCtrl_shift = jtagCtrl_shift;
  assign system_cpu_jtagInstructionCtrl_update = jtagCtrl_update;
  assign system_cpu_jtagInstructionCtrl_reset = jtagCtrl_reset;
  assign jtagCtrl_tdo = system_cpu_jtagInstructionCtrl_tdo;
  assign _zz_48 = 1'b0;
  assign _zz_47 = 1'b1;
  assign debugCd_logic_inputResetAdapter_stuff_syncTrigger = bufferCC_9_io_dataOut;
  assign _zz_50 = 1'b0;
  assign _zz_49 = 1'b1;
  assign system_cpu_iBus_cmd_valid = system_cpu_logic_cpu_iBus_cmd_valid;
  assign system_cpu_iBus_cmd_payload_fragment_opcode = (1'b0);
  assign system_cpu_iBus_cmd_payload_fragment_address = system_cpu_logic_cpu_iBus_cmd_payload_pc;
  assign system_cpu_iBus_cmd_payload_fragment_length = (2'b11);
  assign system_cpu_iBus_cmd_payload_last = 1'b1;
  assign _zz_51 = (system_cpu_iBus_rsp_payload_fragment_opcode == (1'b1));
  assign system_cpu_iBus_rsp_ready = 1'b1;
  assign system_cpu_dBus_cmd_valid = system_cpu_logic_cpu_dBus_cmd_valid;
  assign system_cpu_dBus_cmd_payload_last = 1'b1;
  assign system_cpu_dBus_cmd_payload_fragment_context[0] = system_cpu_logic_cpu_dBus_cmd_payload_wr;
  assign system_cpu_dBus_cmd_payload_fragment_opcode = (system_cpu_logic_cpu_dBus_cmd_payload_wr ? (1'b1) : (1'b0));
  assign system_cpu_dBus_cmd_payload_fragment_address = system_cpu_logic_cpu_dBus_cmd_payload_address;
  assign system_cpu_dBus_cmd_payload_fragment_data = system_cpu_logic_cpu_dBus_cmd_payload_data;
  always @ (*) begin
    case(system_cpu_logic_cpu_dBus_cmd_payload_size)
      2'b00 : begin
        _zz_1 = (2'b00);
      end
      2'b01 : begin
        _zz_1 = (2'b01);
      end
      default : begin
        _zz_1 = (2'b11);
      end
    endcase
  end

  assign system_cpu_dBus_cmd_payload_fragment_length = _zz_1;
  always @ (*) begin
    case(system_cpu_logic_cpu_dBus_cmd_payload_size)
      2'b00 : begin
        _zz_2 = (4'b0001);
      end
      2'b01 : begin
        _zz_2 = (4'b0011);
      end
      default : begin
        _zz_2 = (4'b1111);
      end
    endcase
  end

  assign system_cpu_dBus_cmd_payload_fragment_mask = (_zz_2 <<< system_cpu_logic_cpu_dBus_cmd_payload_address[1 : 0]);
  assign _zz_54 = (system_cpu_dBus_rsp_valid && (! system_cpu_dBus_rsp_payload_fragment_context[0]));
  assign _zz_55 = (system_cpu_dBus_rsp_payload_fragment_opcode == (1'b1));
  assign system_cpu_dBus_rsp_ready = 1'b1;
  assign _zz_53 = systemDebugger_1_io_mem_cmd_payload_address[7:0];
  assign system_cpu_jtagInstructionCtrl_tdo = jtagBridgeNoTap_1_io_ctrl_tdo;
  assign system_cpu_iBus_cmd_ready = system_cpu_iBus_decoder_io_input_cmd_ready;
  assign system_cpu_iBus_rsp_valid = system_cpu_iBus_decoder_io_input_rsp_valid;
  assign system_cpu_iBus_rsp_payload_last = system_cpu_iBus_decoder_io_input_rsp_payload_last;
  assign system_cpu_iBus_rsp_payload_fragment_opcode = system_cpu_iBus_decoder_io_input_rsp_payload_fragment_opcode;
  assign system_cpu_iBus_rsp_payload_fragment_data = system_cpu_iBus_decoder_io_input_rsp_payload_fragment_data;
  assign _zz_57 = system_cpu_iBus_decoder_io_outputs_0_cmd_payload_fragment_address[11:0];
  assign _zz_58 = 32'h0;
  assign _zz_59 = (4'bxxxx);
  assign _zz_60 = (1'b0);
  assign system_spi_0_io_sclk_write = system_spi_0_io_logic_io_spi_sclk_write;
  assign system_spi_0_io_data_0_writeEnable = system_spi_0_io_logic_io_spi_data_0_writeEnable;
  assign system_spi_0_io_data_0_write = system_spi_0_io_logic_io_spi_data_0_write;
  assign system_spi_0_io_data_1_writeEnable = system_spi_0_io_logic_io_spi_data_1_writeEnable;
  assign system_spi_0_io_data_1_write = system_spi_0_io_logic_io_spi_data_1_write;
  assign system_spi_0_io_data_2_writeEnable = system_spi_0_io_logic_io_spi_data_2_writeEnable;
  assign system_spi_0_io_data_2_write = system_spi_0_io_logic_io_spi_data_2_write;
  assign system_spi_0_io_data_3_writeEnable = system_spi_0_io_logic_io_spi_data_3_writeEnable;
  assign system_spi_0_io_data_3_write = system_spi_0_io_logic_io_spi_data_3_write;
  assign system_spi_0_io_ss = system_spi_0_io_logic_io_spi_ss;
  assign system_spi_1_io_sclk_write = system_spi_1_io_logic_io_spi_sclk_write;
  assign system_spi_1_io_data_0_writeEnable = system_spi_1_io_logic_io_spi_data_0_writeEnable;
  assign system_spi_1_io_data_0_write = system_spi_1_io_logic_io_spi_data_0_write;
  assign system_spi_1_io_data_1_writeEnable = system_spi_1_io_logic_io_spi_data_1_writeEnable;
  assign system_spi_1_io_data_1_write = system_spi_1_io_logic_io_spi_data_1_write;
  assign system_spi_1_io_data_2_writeEnable = system_spi_1_io_logic_io_spi_data_2_writeEnable;
  assign system_spi_1_io_data_2_write = system_spi_1_io_logic_io_spi_data_2_write;
  assign system_spi_1_io_data_3_writeEnable = system_spi_1_io_logic_io_spi_data_3_writeEnable;
  assign system_spi_1_io_data_3_write = system_spi_1_io_logic_io_spi_data_3_write;
  assign system_spi_1_io_ss = system_spi_1_io_logic_io_spi_ss;
  assign _zz_64 = 1'b0;
  assign _zz_63 = 1'b1;
  assign resetGenerator_stuff_syncTrigger = bufferCC_11_io_dataOut;
  assign system_gpio_0_io_interrupts_0 = system_gpio_0_io_logic_io_interrupt[0];
  assign system_gpio_0_io_interrupts_1 = system_gpio_0_io_logic_io_interrupt[1];
  assign system_gpio_0_io_interrupts_2 = system_gpio_0_io_logic_io_interrupt[2];
  assign system_gpio_0_io_interrupts_3 = system_gpio_0_io_logic_io_interrupt[3];
  assign system_gpio_0_io_interrupts_4 = system_gpio_0_io_logic_io_interrupt[4];
  assign system_gpio_0_io_interrupts_5 = system_gpio_0_io_logic_io_interrupt[5];
  assign system_gpio_0_io_interrupts_6 = system_gpio_0_io_logic_io_interrupt[6];
  assign system_gpio_0_io_interrupts_7 = system_gpio_0_io_logic_io_interrupt[7];
  assign system_gpio_0_io_interrupts_8 = system_gpio_0_io_logic_io_interrupt[8];
  assign system_gpio_0_io_interrupts_9 = system_gpio_0_io_logic_io_interrupt[9];
  assign system_gpio_0_io_interrupts_10 = system_gpio_0_io_logic_io_interrupt[10];
  assign system_gpio_0_io_interrupts_11 = system_gpio_0_io_logic_io_interrupt[11];
  assign system_gpio_0_io_interrupts_12 = system_gpio_0_io_logic_io_interrupt[12];
  assign system_gpio_0_io_interrupts_13 = system_gpio_0_io_logic_io_interrupt[13];
  assign system_gpio_0_io_interrupts_14 = system_gpio_0_io_logic_io_interrupt[14];
  assign system_gpio_0_io_interrupts_15 = system_gpio_0_io_logic_io_interrupt[15];
  assign system_cpu_dBus_cmd_ready = system_cpu_dBus_decoder_io_input_cmd_ready;
  assign system_cpu_dBus_rsp_valid = system_cpu_dBus_decoder_io_input_rsp_valid;
  assign system_cpu_dBus_rsp_payload_last = system_cpu_dBus_decoder_io_input_rsp_payload_last;
  assign system_cpu_dBus_rsp_payload_fragment_opcode = system_cpu_dBus_decoder_io_input_rsp_payload_fragment_opcode;
  assign system_cpu_dBus_rsp_payload_fragment_data = system_cpu_dBus_decoder_io_input_rsp_payload_fragment_data;
  assign system_cpu_dBus_rsp_payload_fragment_context = system_cpu_dBus_decoder_io_input_rsp_payload_fragment_context;
  assign system_plic_logic_apb_PREADY = 1'b1;
  always @ (*) begin
    system_plic_logic_apb_PRDATA = 32'h0;
    case(system_plic_logic_apb_PADDR)
      22'b0000000000000001111100 : begin
        system_plic_logic_apb_PRDATA[1 : 0] = system_machineTimer_interrupt_plic_gateway_priority;
      end
      22'b0000000001000001111100 : begin
        system_plic_logic_apb_PRDATA[0 : 0] = system_machineTimer_interrupt_plic_gateway_ip;
      end
      22'b0000000000000000000100 : begin
        system_plic_logic_apb_PRDATA[1 : 0] = system_uart_0_io_interrupt_plic_gateway_priority;
      end
      22'b0000000001000000000100 : begin
        system_plic_logic_apb_PRDATA[0 : 0] = system_uart_0_io_interrupt_plic_gateway_ip;
      end
      22'b0000000000000000100000 : begin
        system_plic_logic_apb_PRDATA[1 : 0] = system_i2c_0_io_interrupt_plic_gateway_priority;
      end
      22'b0000000001000000100000 : begin
        system_plic_logic_apb_PRDATA[0 : 0] = system_i2c_0_io_interrupt_plic_gateway_ip;
      end
      22'b0000000000000001100100 : begin
        system_plic_logic_apb_PRDATA[1 : 0] = userInterruptA_interrupt_plic_gateway_priority;
      end
      22'b0000000001000001100100 : begin
        system_plic_logic_apb_PRDATA[0 : 0] = userInterruptA_interrupt_plic_gateway_ip;
      end
      22'b0000000000000000010000 : begin
        system_plic_logic_apb_PRDATA[1 : 0] = system_spi_0_io_interrupt_plic_gateway_priority;
      end
      22'b0000000001000000010000 : begin
        system_plic_logic_apb_PRDATA[0 : 0] = system_spi_0_io_interrupt_plic_gateway_ip;
      end
      22'b0000000000000000010100 : begin
        system_plic_logic_apb_PRDATA[1 : 0] = system_spi_1_io_interrupt_plic_gateway_priority;
      end
      22'b0000000001000000010100 : begin
        system_plic_logic_apb_PRDATA[0 : 0] = system_spi_1_io_interrupt_plic_gateway_ip;
      end
      22'b0000000000000000110000 : begin
        system_plic_logic_apb_PRDATA[1 : 0] = system_gpio_0_io_interrupts_0_plic_gateway_priority;
      end
      22'b0000000001000000110000 : begin
        system_plic_logic_apb_PRDATA[0 : 0] = system_gpio_0_io_interrupts_0_plic_gateway_ip;
      end
      22'b0000000000000000110100 : begin
        system_plic_logic_apb_PRDATA[1 : 0] = system_gpio_0_io_interrupts_1_plic_gateway_priority;
      end
      22'b0000000001000000110100 : begin
        system_plic_logic_apb_PRDATA[0 : 0] = system_gpio_0_io_interrupts_1_plic_gateway_ip;
      end
      22'b1000000000000000000000 : begin
        system_plic_logic_apb_PRDATA[1 : 0] = system_cpu_externalInterrupt_plic_target_threshold;
      end
      22'b1000000000000000000100 : begin
        system_plic_logic_apb_PRDATA[4 : 0] = system_cpu_externalInterrupt_plic_target_claim;
      end
      22'b0000000010000000000000 : begin
        system_plic_logic_apb_PRDATA[31 : 31] = system_cpu_externalInterrupt_plic_target_ie_0;
        system_plic_logic_apb_PRDATA[1 : 1] = system_cpu_externalInterrupt_plic_target_ie_1;
        system_plic_logic_apb_PRDATA[8 : 8] = system_cpu_externalInterrupt_plic_target_ie_2;
        system_plic_logic_apb_PRDATA[25 : 25] = system_cpu_externalInterrupt_plic_target_ie_3;
        system_plic_logic_apb_PRDATA[4 : 4] = system_cpu_externalInterrupt_plic_target_ie_4;
        system_plic_logic_apb_PRDATA[5 : 5] = system_cpu_externalInterrupt_plic_target_ie_5;
        system_plic_logic_apb_PRDATA[12 : 12] = system_cpu_externalInterrupt_plic_target_ie_6;
        system_plic_logic_apb_PRDATA[13 : 13] = system_cpu_externalInterrupt_plic_target_ie_7;
      end
      default : begin
      end
    endcase
  end

  assign system_plic_logic_apb_PSLVERROR = 1'b0;
  assign system_plic_logic_bus_askWrite = ((system_plic_logic_apb_PSEL[0] && system_plic_logic_apb_PENABLE) && system_plic_logic_apb_PWRITE);
  assign system_plic_logic_bus_askRead = ((system_plic_logic_apb_PSEL[0] && system_plic_logic_apb_PENABLE) && (! system_plic_logic_apb_PWRITE));
  assign system_plic_logic_bus_doWrite = (((system_plic_logic_apb_PSEL[0] && system_plic_logic_apb_PENABLE) && system_plic_logic_apb_PREADY) && system_plic_logic_apb_PWRITE);
  assign system_plic_logic_bus_doRead = (((system_plic_logic_apb_PSEL[0] && system_plic_logic_apb_PENABLE) && system_plic_logic_apb_PREADY) && (! system_plic_logic_apb_PWRITE));
  assign system_cpu_externalInterrupt_plic_target_requests_0_priority = (2'b00);
  assign system_cpu_externalInterrupt_plic_target_requests_0_id = 5'h0;
  assign system_cpu_externalInterrupt_plic_target_requests_0_valid = 1'b1;
  assign system_cpu_externalInterrupt_plic_target_requests_1_priority = system_uart_0_io_interrupt_plic_gateway_priority;
  assign system_cpu_externalInterrupt_plic_target_requests_1_id = 5'h01;
  assign system_cpu_externalInterrupt_plic_target_requests_1_valid = (system_uart_0_io_interrupt_plic_gateway_ip && system_cpu_externalInterrupt_plic_target_ie_1);
  assign system_cpu_externalInterrupt_plic_target_requests_2_priority = system_spi_0_io_interrupt_plic_gateway_priority;
  assign system_cpu_externalInterrupt_plic_target_requests_2_id = 5'h04;
  assign system_cpu_externalInterrupt_plic_target_requests_2_valid = (system_spi_0_io_interrupt_plic_gateway_ip && system_cpu_externalInterrupt_plic_target_ie_4);
  assign system_cpu_externalInterrupt_plic_target_requests_3_priority = system_spi_1_io_interrupt_plic_gateway_priority;
  assign system_cpu_externalInterrupt_plic_target_requests_3_id = 5'h05;
  assign system_cpu_externalInterrupt_plic_target_requests_3_valid = (system_spi_1_io_interrupt_plic_gateway_ip && system_cpu_externalInterrupt_plic_target_ie_5);
  assign system_cpu_externalInterrupt_plic_target_requests_4_priority = system_i2c_0_io_interrupt_plic_gateway_priority;
  assign system_cpu_externalInterrupt_plic_target_requests_4_id = 5'h08;
  assign system_cpu_externalInterrupt_plic_target_requests_4_valid = (system_i2c_0_io_interrupt_plic_gateway_ip && system_cpu_externalInterrupt_plic_target_ie_2);
  assign system_cpu_externalInterrupt_plic_target_requests_5_priority = system_gpio_0_io_interrupts_0_plic_gateway_priority;
  assign system_cpu_externalInterrupt_plic_target_requests_5_id = 5'h0c;
  assign system_cpu_externalInterrupt_plic_target_requests_5_valid = (system_gpio_0_io_interrupts_0_plic_gateway_ip && system_cpu_externalInterrupt_plic_target_ie_6);
  assign system_cpu_externalInterrupt_plic_target_requests_6_priority = system_gpio_0_io_interrupts_1_plic_gateway_priority;
  assign system_cpu_externalInterrupt_plic_target_requests_6_id = 5'h0d;
  assign system_cpu_externalInterrupt_plic_target_requests_6_valid = (system_gpio_0_io_interrupts_1_plic_gateway_ip && system_cpu_externalInterrupt_plic_target_ie_7);
  assign system_cpu_externalInterrupt_plic_target_requests_7_priority = userInterruptA_interrupt_plic_gateway_priority;
  assign system_cpu_externalInterrupt_plic_target_requests_7_id = 5'h19;
  assign system_cpu_externalInterrupt_plic_target_requests_7_valid = (userInterruptA_interrupt_plic_gateway_ip && system_cpu_externalInterrupt_plic_target_ie_3);
  assign system_cpu_externalInterrupt_plic_target_requests_8_priority = system_machineTimer_interrupt_plic_gateway_priority;
  assign system_cpu_externalInterrupt_plic_target_requests_8_id = 5'h1f;
  assign system_cpu_externalInterrupt_plic_target_requests_8_valid = (system_machineTimer_interrupt_plic_gateway_ip && system_cpu_externalInterrupt_plic_target_ie_0);
  assign _zz_4 = ((! system_cpu_externalInterrupt_plic_target_requests_1_valid) || (system_cpu_externalInterrupt_plic_target_requests_0_valid && (system_cpu_externalInterrupt_plic_target_requests_1_priority <= system_cpu_externalInterrupt_plic_target_requests_0_priority)));
  assign _zz_5 = (_zz_4 ? system_cpu_externalInterrupt_plic_target_requests_0_priority : system_cpu_externalInterrupt_plic_target_requests_1_priority);
  assign _zz_6 = (_zz_4 ? system_cpu_externalInterrupt_plic_target_requests_0_valid : system_cpu_externalInterrupt_plic_target_requests_1_valid);
  assign _zz_7 = ((! system_cpu_externalInterrupt_plic_target_requests_3_valid) || (system_cpu_externalInterrupt_plic_target_requests_2_valid && (system_cpu_externalInterrupt_plic_target_requests_3_priority <= system_cpu_externalInterrupt_plic_target_requests_2_priority)));
  assign _zz_8 = (_zz_7 ? system_cpu_externalInterrupt_plic_target_requests_2_priority : system_cpu_externalInterrupt_plic_target_requests_3_priority);
  assign _zz_9 = (_zz_7 ? system_cpu_externalInterrupt_plic_target_requests_2_valid : system_cpu_externalInterrupt_plic_target_requests_3_valid);
  assign _zz_10 = ((! system_cpu_externalInterrupt_plic_target_requests_5_valid) || (system_cpu_externalInterrupt_plic_target_requests_4_valid && (system_cpu_externalInterrupt_plic_target_requests_5_priority <= system_cpu_externalInterrupt_plic_target_requests_4_priority)));
  assign _zz_11 = (_zz_10 ? system_cpu_externalInterrupt_plic_target_requests_4_priority : system_cpu_externalInterrupt_plic_target_requests_5_priority);
  assign _zz_12 = (_zz_10 ? system_cpu_externalInterrupt_plic_target_requests_4_valid : system_cpu_externalInterrupt_plic_target_requests_5_valid);
  assign _zz_13 = ((! system_cpu_externalInterrupt_plic_target_requests_7_valid) || (system_cpu_externalInterrupt_plic_target_requests_6_valid && (system_cpu_externalInterrupt_plic_target_requests_7_priority <= system_cpu_externalInterrupt_plic_target_requests_6_priority)));
  assign _zz_14 = (_zz_13 ? system_cpu_externalInterrupt_plic_target_requests_6_priority : system_cpu_externalInterrupt_plic_target_requests_7_priority);
  assign _zz_15 = (_zz_13 ? system_cpu_externalInterrupt_plic_target_requests_6_valid : system_cpu_externalInterrupt_plic_target_requests_7_valid);
  assign _zz_16 = ((! _zz_9) || (_zz_6 && (_zz_8 <= _zz_5)));
  assign _zz_17 = (_zz_16 ? _zz_5 : _zz_8);
  assign _zz_18 = (_zz_16 ? _zz_6 : _zz_9);
  assign _zz_19 = ((! _zz_15) || (_zz_12 && (_zz_14 <= _zz_11)));
  assign _zz_20 = (_zz_19 ? _zz_11 : _zz_14);
  assign _zz_21 = (_zz_19 ? _zz_12 : _zz_15);
  assign _zz_22 = ((! _zz_21) || (_zz_18 && (_zz_20 <= _zz_17)));
  assign _zz_23 = (_zz_22 ? _zz_17 : _zz_20);
  assign _zz_24 = (_zz_22 ? _zz_18 : _zz_21);
  assign _zz_25 = ((! system_cpu_externalInterrupt_plic_target_requests_8_valid) || (_zz_24 && (system_cpu_externalInterrupt_plic_target_requests_8_priority <= _zz_23)));
  assign system_cpu_externalInterrupt_plic_target_bestRequest_priority = (_zz_25 ? _zz_23 : system_cpu_externalInterrupt_plic_target_requests_8_priority);
  assign system_cpu_externalInterrupt_plic_target_bestRequest_id = (_zz_25 ? (_zz_22 ? (_zz_16 ? (_zz_4 ? system_cpu_externalInterrupt_plic_target_requests_0_id : system_cpu_externalInterrupt_plic_target_requests_1_id) : (_zz_7 ? system_cpu_externalInterrupt_plic_target_requests_2_id : system_cpu_externalInterrupt_plic_target_requests_3_id)) : (_zz_19 ? (_zz_10 ? system_cpu_externalInterrupt_plic_target_requests_4_id : system_cpu_externalInterrupt_plic_target_requests_5_id) : (_zz_13 ? system_cpu_externalInterrupt_plic_target_requests_6_id : system_cpu_externalInterrupt_plic_target_requests_7_id))) : system_cpu_externalInterrupt_plic_target_requests_8_id);
  assign system_cpu_externalInterrupt_plic_target_bestRequest_valid = (_zz_25 ? _zz_24 : system_cpu_externalInterrupt_plic_target_requests_8_valid);
  assign system_cpu_externalInterrupt_plic_target_iep = (system_cpu_externalInterrupt_plic_target_threshold < system_cpu_externalInterrupt_plic_target_bestRequest_priority);
  assign system_cpu_externalInterrupt_plic_target_claim = (system_cpu_externalInterrupt_plic_target_iep ? system_cpu_externalInterrupt_plic_target_bestRequest_id : 5'h0);
  assign system_machineTimer_interrupt_plic_gateway_priority = _zz_26;
  assign system_uart_0_io_interrupt_plic_gateway_priority = _zz_27;
  assign system_i2c_0_io_interrupt_plic_gateway_priority = _zz_28;
  assign userInterruptA_interrupt_plic_gateway_priority = _zz_29;
  assign system_spi_0_io_interrupt_plic_gateway_priority = _zz_30;
  assign system_spi_1_io_interrupt_plic_gateway_priority = _zz_31;
  assign system_gpio_0_io_interrupts_0_plic_gateway_priority = _zz_32;
  assign system_gpio_0_io_interrupts_1_plic_gateway_priority = _zz_33;
  always @ (*) begin
    system_plic_logic_bridge_claim_valid = 1'b0;
    case(system_plic_logic_apb_PADDR)
      22'b0000000000000001111100 : begin
      end
      22'b0000000001000001111100 : begin
      end
      22'b0000000000000000000100 : begin
      end
      22'b0000000001000000000100 : begin
      end
      22'b0000000000000000100000 : begin
      end
      22'b0000000001000000100000 : begin
      end
      22'b0000000000000001100100 : begin
      end
      22'b0000000001000001100100 : begin
      end
      22'b0000000000000000010000 : begin
      end
      22'b0000000001000000010000 : begin
      end
      22'b0000000000000000010100 : begin
      end
      22'b0000000001000000010100 : begin
      end
      22'b0000000000000000110000 : begin
      end
      22'b0000000001000000110000 : begin
      end
      22'b0000000000000000110100 : begin
      end
      22'b0000000001000000110100 : begin
      end
      22'b1000000000000000000000 : begin
      end
      22'b1000000000000000000100 : begin
        if(system_plic_logic_bus_doRead)begin
          system_plic_logic_bridge_claim_valid = 1'b1;
        end
      end
      22'b0000000010000000000000 : begin
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    system_plic_logic_bridge_claim_payload = 5'h0;
    case(system_plic_logic_apb_PADDR)
      22'b0000000000000001111100 : begin
      end
      22'b0000000001000001111100 : begin
      end
      22'b0000000000000000000100 : begin
      end
      22'b0000000001000000000100 : begin
      end
      22'b0000000000000000100000 : begin
      end
      22'b0000000001000000100000 : begin
      end
      22'b0000000000000001100100 : begin
      end
      22'b0000000001000001100100 : begin
      end
      22'b0000000000000000010000 : begin
      end
      22'b0000000001000000010000 : begin
      end
      22'b0000000000000000010100 : begin
      end
      22'b0000000001000000010100 : begin
      end
      22'b0000000000000000110000 : begin
      end
      22'b0000000001000000110000 : begin
      end
      22'b0000000000000000110100 : begin
      end
      22'b0000000001000000110100 : begin
      end
      22'b1000000000000000000000 : begin
      end
      22'b1000000000000000000100 : begin
        if(system_plic_logic_bus_doRead)begin
          system_plic_logic_bridge_claim_payload = system_cpu_externalInterrupt_plic_target_claim;
        end
      end
      22'b0000000010000000000000 : begin
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    system_plic_logic_bridge_completion_valid = 1'b0;
    if(system_plic_logic_bridge_targetMapping_0_targetCompletion_valid)begin
      system_plic_logic_bridge_completion_valid = 1'b1;
    end
  end

  always @ (*) begin
    system_plic_logic_bridge_completion_payload = 5'h0;
    if(system_plic_logic_bridge_targetMapping_0_targetCompletion_valid)begin
      system_plic_logic_bridge_completion_payload = system_plic_logic_bridge_targetMapping_0_targetCompletion_payload;
    end
  end

  assign system_cpu_externalInterrupt_plic_target_threshold = _zz_34;
  always @ (*) begin
    system_plic_logic_bridge_targetMapping_0_targetCompletion_valid = 1'b0;
    case(system_plic_logic_apb_PADDR)
      22'b0000000000000001111100 : begin
      end
      22'b0000000001000001111100 : begin
      end
      22'b0000000000000000000100 : begin
      end
      22'b0000000001000000000100 : begin
      end
      22'b0000000000000000100000 : begin
      end
      22'b0000000001000000100000 : begin
      end
      22'b0000000000000001100100 : begin
      end
      22'b0000000001000001100100 : begin
      end
      22'b0000000000000000010000 : begin
      end
      22'b0000000001000000010000 : begin
      end
      22'b0000000000000000010100 : begin
      end
      22'b0000000001000000010100 : begin
      end
      22'b0000000000000000110000 : begin
      end
      22'b0000000001000000110000 : begin
      end
      22'b0000000000000000110100 : begin
      end
      22'b0000000001000000110100 : begin
      end
      22'b1000000000000000000000 : begin
      end
      22'b1000000000000000000100 : begin
        if(system_plic_logic_bus_doWrite)begin
          system_plic_logic_bridge_targetMapping_0_targetCompletion_valid = 1'b1;
        end
      end
      22'b0000000010000000000000 : begin
      end
      default : begin
      end
    endcase
  end

  assign system_cpu_externalInterrupt_plic_target_ie_0 = _zz_35;
  assign system_cpu_externalInterrupt_plic_target_ie_1 = _zz_36;
  assign system_cpu_externalInterrupt_plic_target_ie_2 = _zz_37;
  assign system_cpu_externalInterrupt_plic_target_ie_3 = _zz_38;
  assign system_cpu_externalInterrupt_plic_target_ie_4 = _zz_39;
  assign system_cpu_externalInterrupt_plic_target_ie_5 = _zz_40;
  assign system_cpu_externalInterrupt_plic_target_ie_6 = _zz_41;
  assign system_cpu_externalInterrupt_plic_target_ie_7 = _zz_42;
  assign _zz_56 = system_cpu_dBus_decoder_io_outputs_0_cmd_payload_fragment_address[11:0];
  assign system_apbDecoder_input_PREADY = system_apbDecoder_input_decoder_io_input_PREADY;
  assign system_apbDecoder_input_PRDATA = system_apbDecoder_input_decoder_io_input_PRDATA;
  assign system_apbDecoder_input_PSLVERROR = system_apbDecoder_input_decoder_io_input_PSLVERROR;
  assign system_plic_logic_apb_PADDR = apb3Router_1_io_outputs_0_PADDR[21:0];
  assign system_plic_logic_apb_PSEL = apb3Router_1_io_outputs_0_PSEL;
  assign system_plic_logic_apb_PENABLE = apb3Router_1_io_outputs_0_PENABLE;
  assign system_plic_logic_apb_PWRITE = apb3Router_1_io_outputs_0_PWRITE;
  assign system_plic_logic_apb_PWDATA = apb3Router_1_io_outputs_0_PWDATA;
  assign _zz_43 = apb3Router_1_io_outputs_1_PADDR[3:0];
  assign _zz_44 = apb3Router_1_io_outputs_2_PADDR[4:0];
  assign _zz_65 = 1'b0;
  assign _zz_61 = apb3Router_1_io_outputs_3_PADDR[7:0];
  assign _zz_66 = 1'b0;
  assign _zz_62 = apb3Router_1_io_outputs_4_PADDR[7:0];
  assign _zz_67 = 1'b0;
  assign _zz_45 = apb3Router_1_io_outputs_5_PADDR[7:0];
  assign _zz_68 = 1'b0;
  assign _zz_46 = apb3Router_1_io_outputs_6_PADDR[11:0];
  assign io_apbSlave_0_PADDR = apb3Router_1_io_outputs_7_PADDR[11:0];
  assign io_apbSlave_0_PSEL = apb3Router_1_io_outputs_7_PSEL;
  assign io_apbSlave_0_PENABLE = apb3Router_1_io_outputs_7_PENABLE;
  assign io_apbSlave_0_PWRITE = apb3Router_1_io_outputs_7_PWRITE;
  assign io_apbSlave_0_PWDATA = apb3Router_1_io_outputs_7_PWDATA;
  assign system_apbDecoder_input_PADDR = system_peripheralBridge_logic_bridge_io_output_PADDR;
  assign system_apbDecoder_input_PSEL = system_peripheralBridge_logic_bridge_io_output_PSEL;
  assign system_apbDecoder_input_PENABLE = system_peripheralBridge_logic_bridge_io_output_PENABLE;
  assign system_apbDecoder_input_PWRITE = system_peripheralBridge_logic_bridge_io_output_PWRITE;
  assign system_apbDecoder_input_PWDATA = system_peripheralBridge_logic_bridge_io_output_PWDATA;
  assign _zz_69 = system_cpu_dBus_decoder_io_outputs_1_cmd_payload_fragment_address[23:0];
  assign system_plic_logic_bridge_targetMapping_0_targetCompletion_payload = system_plic_logic_apb_PWDATA[4 : 0];
  assign _zz_52 = 1'b0;
  always @ (posedge io_systemClk) begin
    if(_zz_70)begin
      debugCd_logic_holdingLogic_resetCounter <= (debugCd_logic_holdingLogic_resetCounter + 12'h001);
    end
    if(debugCd_logic_inputResetTrigger)begin
      debugCd_logic_holdingLogic_resetCounter <= 12'h0;
    end
    debugCd_logic_outputReset <= debugCd_logic_outputResetUnbuffered;
  end

  always @ (posedge io_systemClk) begin
    if(_zz_71)begin
      systemCd_logic_holdingLogic_resetCounter <= (systemCd_logic_holdingLogic_resetCounter + 6'h01);
    end
    if(systemCd_logic_inputResetTrigger)begin
      systemCd_logic_holdingLogic_resetCounter <= 6'h0;
    end
    systemCd_logic_outputReset <= systemCd_logic_outputResetUnbuffered;
  end

  always @ (posedge io_systemClk) begin
    if(systemCd_logic_outputReset) begin
      system_machineTimer_interrupt_plic_gateway_ip <= 1'b0;
      system_machineTimer_interrupt_plic_gateway_waitCompletion <= 1'b0;
      system_uart_0_io_interrupt_plic_gateway_ip <= 1'b0;
      system_uart_0_io_interrupt_plic_gateway_waitCompletion <= 1'b0;
      system_i2c_0_io_interrupt_plic_gateway_ip <= 1'b0;
      system_i2c_0_io_interrupt_plic_gateway_waitCompletion <= 1'b0;
      userInterruptA_interrupt_plic_gateway_ip <= 1'b0;
      userInterruptA_interrupt_plic_gateway_waitCompletion <= 1'b0;
      system_spi_0_io_interrupt_plic_gateway_ip <= 1'b0;
      system_spi_0_io_interrupt_plic_gateway_waitCompletion <= 1'b0;
      system_spi_1_io_interrupt_plic_gateway_ip <= 1'b0;
      system_spi_1_io_interrupt_plic_gateway_waitCompletion <= 1'b0;
      system_gpio_0_io_interrupts_0_plic_gateway_ip <= 1'b0;
      system_gpio_0_io_interrupts_0_plic_gateway_waitCompletion <= 1'b0;
      system_gpio_0_io_interrupts_1_plic_gateway_ip <= 1'b0;
      system_gpio_0_io_interrupts_1_plic_gateway_waitCompletion <= 1'b0;
      _zz_26 <= (2'b00);
      _zz_27 <= (2'b00);
      _zz_28 <= (2'b00);
      _zz_29 <= (2'b00);
      _zz_30 <= (2'b00);
      _zz_31 <= (2'b00);
      _zz_32 <= (2'b00);
      _zz_33 <= (2'b00);
      _zz_34 <= (2'b00);
      _zz_35 <= 1'b0;
      _zz_36 <= 1'b0;
      _zz_37 <= 1'b0;
      _zz_38 <= 1'b0;
      _zz_39 <= 1'b0;
      _zz_40 <= 1'b0;
      _zz_41 <= 1'b0;
      _zz_42 <= 1'b0;
    end else begin
      if((! system_machineTimer_interrupt_plic_gateway_waitCompletion))begin
        system_machineTimer_interrupt_plic_gateway_ip <= system_machineTimer_logic_io_mTimeInterrupt;
        system_machineTimer_interrupt_plic_gateway_waitCompletion <= system_machineTimer_logic_io_mTimeInterrupt;
      end
      if((! system_uart_0_io_interrupt_plic_gateway_waitCompletion))begin
        system_uart_0_io_interrupt_plic_gateway_ip <= system_uart_0_io_logic_io_interrupt;
        system_uart_0_io_interrupt_plic_gateway_waitCompletion <= system_uart_0_io_logic_io_interrupt;
      end
      if((! system_i2c_0_io_interrupt_plic_gateway_waitCompletion))begin
        system_i2c_0_io_interrupt_plic_gateway_ip <= system_i2c_0_io_logic_io_interrupt;
        system_i2c_0_io_interrupt_plic_gateway_waitCompletion <= system_i2c_0_io_logic_io_interrupt;
      end
      if((! userInterruptA_interrupt_plic_gateway_waitCompletion))begin
        userInterruptA_interrupt_plic_gateway_ip <= userInterruptA_interrupt;
        userInterruptA_interrupt_plic_gateway_waitCompletion <= userInterruptA_interrupt;
      end
      if((! system_spi_0_io_interrupt_plic_gateway_waitCompletion))begin
        system_spi_0_io_interrupt_plic_gateway_ip <= system_spi_0_io_logic_io_interrupt;
        system_spi_0_io_interrupt_plic_gateway_waitCompletion <= system_spi_0_io_logic_io_interrupt;
      end
      if((! system_spi_1_io_interrupt_plic_gateway_waitCompletion))begin
        system_spi_1_io_interrupt_plic_gateway_ip <= system_spi_1_io_logic_io_interrupt;
        system_spi_1_io_interrupt_plic_gateway_waitCompletion <= system_spi_1_io_logic_io_interrupt;
      end
      if((! system_gpio_0_io_interrupts_0_plic_gateway_waitCompletion))begin
        system_gpio_0_io_interrupts_0_plic_gateway_ip <= system_gpio_0_io_interrupts_0;
        system_gpio_0_io_interrupts_0_plic_gateway_waitCompletion <= system_gpio_0_io_interrupts_0;
      end
      if((! system_gpio_0_io_interrupts_1_plic_gateway_waitCompletion))begin
        system_gpio_0_io_interrupts_1_plic_gateway_ip <= system_gpio_0_io_interrupts_1;
        system_gpio_0_io_interrupts_1_plic_gateway_waitCompletion <= system_gpio_0_io_interrupts_1;
      end
      if(system_plic_logic_bridge_claim_valid)begin
        case(system_plic_logic_bridge_claim_payload)
          5'b11111 : begin
            system_machineTimer_interrupt_plic_gateway_ip <= 1'b0;
          end
          5'b00001 : begin
            system_uart_0_io_interrupt_plic_gateway_ip <= 1'b0;
          end
          5'b01000 : begin
            system_i2c_0_io_interrupt_plic_gateway_ip <= 1'b0;
          end
          5'b11001 : begin
            userInterruptA_interrupt_plic_gateway_ip <= 1'b0;
          end
          5'b00100 : begin
            system_spi_0_io_interrupt_plic_gateway_ip <= 1'b0;
          end
          5'b00101 : begin
            system_spi_1_io_interrupt_plic_gateway_ip <= 1'b0;
          end
          5'b01100 : begin
            system_gpio_0_io_interrupts_0_plic_gateway_ip <= 1'b0;
          end
          5'b01101 : begin
            system_gpio_0_io_interrupts_1_plic_gateway_ip <= 1'b0;
          end
          default : begin
          end
        endcase
      end
      if(system_plic_logic_bridge_completion_valid)begin
        case(system_plic_logic_bridge_completion_payload)
          5'b11111 : begin
            system_machineTimer_interrupt_plic_gateway_waitCompletion <= 1'b0;
          end
          5'b00001 : begin
            system_uart_0_io_interrupt_plic_gateway_waitCompletion <= 1'b0;
          end
          5'b01000 : begin
            system_i2c_0_io_interrupt_plic_gateway_waitCompletion <= 1'b0;
          end
          5'b11001 : begin
            userInterruptA_interrupt_plic_gateway_waitCompletion <= 1'b0;
          end
          5'b00100 : begin
            system_spi_0_io_interrupt_plic_gateway_waitCompletion <= 1'b0;
          end
          5'b00101 : begin
            system_spi_1_io_interrupt_plic_gateway_waitCompletion <= 1'b0;
          end
          5'b01100 : begin
            system_gpio_0_io_interrupts_0_plic_gateway_waitCompletion <= 1'b0;
          end
          5'b01101 : begin
            system_gpio_0_io_interrupts_1_plic_gateway_waitCompletion <= 1'b0;
          end
          default : begin
          end
        endcase
      end
      case(system_plic_logic_apb_PADDR)
        22'b0000000000000001111100 : begin
          if(system_plic_logic_bus_doWrite)begin
            _zz_26 <= system_plic_logic_apb_PWDATA[1 : 0];
          end
        end
        22'b0000000001000001111100 : begin
        end
        22'b0000000000000000000100 : begin
          if(system_plic_logic_bus_doWrite)begin
            _zz_27 <= system_plic_logic_apb_PWDATA[1 : 0];
          end
        end
        22'b0000000001000000000100 : begin
        end
        22'b0000000000000000100000 : begin
          if(system_plic_logic_bus_doWrite)begin
            _zz_28 <= system_plic_logic_apb_PWDATA[1 : 0];
          end
        end
        22'b0000000001000000100000 : begin
        end
        22'b0000000000000001100100 : begin
          if(system_plic_logic_bus_doWrite)begin
            _zz_29 <= system_plic_logic_apb_PWDATA[1 : 0];
          end
        end
        22'b0000000001000001100100 : begin
        end
        22'b0000000000000000010000 : begin
          if(system_plic_logic_bus_doWrite)begin
            _zz_30 <= system_plic_logic_apb_PWDATA[1 : 0];
          end
        end
        22'b0000000001000000010000 : begin
        end
        22'b0000000000000000010100 : begin
          if(system_plic_logic_bus_doWrite)begin
            _zz_31 <= system_plic_logic_apb_PWDATA[1 : 0];
          end
        end
        22'b0000000001000000010100 : begin
        end
        22'b0000000000000000110000 : begin
          if(system_plic_logic_bus_doWrite)begin
            _zz_32 <= system_plic_logic_apb_PWDATA[1 : 0];
          end
        end
        22'b0000000001000000110000 : begin
        end
        22'b0000000000000000110100 : begin
          if(system_plic_logic_bus_doWrite)begin
            _zz_33 <= system_plic_logic_apb_PWDATA[1 : 0];
          end
        end
        22'b0000000001000000110100 : begin
        end
        22'b1000000000000000000000 : begin
          if(system_plic_logic_bus_doWrite)begin
            _zz_34 <= system_plic_logic_apb_PWDATA[1 : 0];
          end
        end
        22'b1000000000000000000100 : begin
        end
        22'b0000000010000000000000 : begin
          if(system_plic_logic_bus_doWrite)begin
            _zz_35 <= _zz_72[0];
            _zz_36 <= _zz_73[0];
            _zz_37 <= _zz_74[0];
            _zz_38 <= _zz_75[0];
            _zz_39 <= _zz_76[0];
            _zz_40 <= _zz_77[0];
            _zz_41 <= _zz_78[0];
            _zz_42 <= _zz_79[0];
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @ (posedge io_systemClk) begin
    system_cpu_debugReset <= system_cpu_logic_cpu_debug_resetOut;
  end

  always @ (posedge io_systemClk) begin
    if(debugCd_logic_outputReset) begin
      _zz_3 <= 1'b0;
    end else begin
      _zz_3 <= (systemDebugger_1_io_mem_cmd_valid && system_cpu_logic_cpu_debug_bus_cmd_ready);
    end
  end


endmodule

module BmbArbiter_1 (
  input               io_inputs_0_cmd_valid,
  output              io_inputs_0_cmd_ready,
  input               io_inputs_0_cmd_payload_last,
  input      [0:0]    io_inputs_0_cmd_payload_fragment_opcode,
  input      [23:0]   io_inputs_0_cmd_payload_fragment_address,
  input      [1:0]    io_inputs_0_cmd_payload_fragment_length,
  input      [31:0]   io_inputs_0_cmd_payload_fragment_data,
  input      [3:0]    io_inputs_0_cmd_payload_fragment_mask,
  input      [0:0]    io_inputs_0_cmd_payload_fragment_context,
  output              io_inputs_0_rsp_valid,
  input               io_inputs_0_rsp_ready,
  output              io_inputs_0_rsp_payload_last,
  output     [0:0]    io_inputs_0_rsp_payload_fragment_opcode,
  output     [31:0]   io_inputs_0_rsp_payload_fragment_data,
  output     [0:0]    io_inputs_0_rsp_payload_fragment_context,
  output              io_output_cmd_valid,
  input               io_output_cmd_ready,
  output              io_output_cmd_payload_last,
  output     [0:0]    io_output_cmd_payload_fragment_opcode,
  output     [23:0]   io_output_cmd_payload_fragment_address,
  output     [1:0]    io_output_cmd_payload_fragment_length,
  output     [31:0]   io_output_cmd_payload_fragment_data,
  output     [3:0]    io_output_cmd_payload_fragment_mask,
  output     [0:0]    io_output_cmd_payload_fragment_context,
  input               io_output_rsp_valid,
  output              io_output_rsp_ready,
  input               io_output_rsp_payload_last,
  input      [0:0]    io_output_rsp_payload_fragment_opcode,
  input      [31:0]   io_output_rsp_payload_fragment_data,
  input      [0:0]    io_output_rsp_payload_fragment_context
);

  assign io_output_cmd_valid = io_inputs_0_cmd_valid;
  assign io_inputs_0_cmd_ready = io_output_cmd_ready;
  assign io_inputs_0_rsp_valid = io_output_rsp_valid;
  assign io_output_rsp_ready = io_inputs_0_rsp_ready;
  assign io_output_cmd_payload_last = io_inputs_0_cmd_payload_last;
  assign io_inputs_0_rsp_payload_last = io_output_rsp_payload_last;
  assign io_output_cmd_payload_fragment_opcode = io_inputs_0_cmd_payload_fragment_opcode;
  assign io_output_cmd_payload_fragment_address = io_inputs_0_cmd_payload_fragment_address;
  assign io_output_cmd_payload_fragment_length = io_inputs_0_cmd_payload_fragment_length;
  assign io_output_cmd_payload_fragment_data = io_inputs_0_cmd_payload_fragment_data;
  assign io_output_cmd_payload_fragment_mask = io_inputs_0_cmd_payload_fragment_mask;
  assign io_output_cmd_payload_fragment_context = io_inputs_0_cmd_payload_fragment_context;
  assign io_inputs_0_rsp_payload_fragment_opcode = io_output_rsp_payload_fragment_opcode;
  assign io_inputs_0_rsp_payload_fragment_data = io_output_rsp_payload_fragment_data;
  assign io_inputs_0_rsp_payload_fragment_context = io_output_rsp_payload_fragment_context;

endmodule

module BmbToApb3Bridge (
  input               io_input_cmd_valid,
  output              io_input_cmd_ready,
  input               io_input_cmd_payload_last,
  input      [0:0]    io_input_cmd_payload_fragment_opcode,
  input      [23:0]   io_input_cmd_payload_fragment_address,
  input      [1:0]    io_input_cmd_payload_fragment_length,
  input      [31:0]   io_input_cmd_payload_fragment_data,
  input      [3:0]    io_input_cmd_payload_fragment_mask,
  input      [0:0]    io_input_cmd_payload_fragment_context,
  output              io_input_rsp_valid,
  input               io_input_rsp_ready,
  output              io_input_rsp_payload_last,
  output     [0:0]    io_input_rsp_payload_fragment_opcode,
  output     [31:0]   io_input_rsp_payload_fragment_data,
  output     [0:0]    io_input_rsp_payload_fragment_context,
  output     [23:0]   io_output_PADDR,
  output     [0:0]    io_output_PSEL,
  output              io_output_PENABLE,
  input               io_output_PREADY,
  output              io_output_PWRITE,
  output     [31:0]   io_output_PWDATA,
  input      [31:0]   io_output_PRDATA,
  input               io_output_PSLVERROR,
  input               io_systemClk,
  input               systemCd_logic_outputReset
);
  wire                _zz_2;
  wire                bmbBuffer_cmd_valid;
  reg                 bmbBuffer_cmd_ready;
  wire                bmbBuffer_cmd_payload_last;
  wire       [0:0]    bmbBuffer_cmd_payload_fragment_opcode;
  wire       [23:0]   bmbBuffer_cmd_payload_fragment_address;
  wire       [1:0]    bmbBuffer_cmd_payload_fragment_length;
  wire       [31:0]   bmbBuffer_cmd_payload_fragment_data;
  wire       [3:0]    bmbBuffer_cmd_payload_fragment_mask;
  wire       [0:0]    bmbBuffer_cmd_payload_fragment_context;
  reg                 bmbBuffer_rsp_valid;
  wire                bmbBuffer_rsp_ready;
  wire                bmbBuffer_rsp_payload_last;
  reg        [0:0]    bmbBuffer_rsp_payload_fragment_opcode;
  wire       [31:0]   bmbBuffer_rsp_payload_fragment_data;
  wire       [0:0]    bmbBuffer_rsp_payload_fragment_context;
  wire                _zz_1;
  wire                bmbBuffer_rsp_m2sPipe_valid;
  wire                bmbBuffer_rsp_m2sPipe_ready;
  wire                bmbBuffer_rsp_m2sPipe_payload_last;
  wire       [0:0]    bmbBuffer_rsp_m2sPipe_payload_fragment_opcode;
  wire       [31:0]   bmbBuffer_rsp_m2sPipe_payload_fragment_data;
  wire       [0:0]    bmbBuffer_rsp_m2sPipe_payload_fragment_context;
  reg                 bmbBuffer_rsp_m2sPipe_rValid;
  reg                 bmbBuffer_rsp_m2sPipe_rData_last;
  reg        [0:0]    bmbBuffer_rsp_m2sPipe_rData_fragment_opcode;
  reg        [31:0]   bmbBuffer_rsp_m2sPipe_rData_fragment_data;
  reg        [0:0]    bmbBuffer_rsp_m2sPipe_rData_fragment_context;
  reg                 state;

  assign _zz_2 = (! state);
  assign _zz_1 = (! (io_input_rsp_valid && (! io_input_rsp_ready)));
  assign io_input_cmd_ready = (bmbBuffer_cmd_ready && _zz_1);
  assign bmbBuffer_cmd_valid = (io_input_cmd_valid && _zz_1);
  assign bmbBuffer_cmd_payload_last = io_input_cmd_payload_last;
  assign bmbBuffer_cmd_payload_fragment_opcode = io_input_cmd_payload_fragment_opcode;
  assign bmbBuffer_cmd_payload_fragment_address = io_input_cmd_payload_fragment_address;
  assign bmbBuffer_cmd_payload_fragment_length = io_input_cmd_payload_fragment_length;
  assign bmbBuffer_cmd_payload_fragment_data = io_input_cmd_payload_fragment_data;
  assign bmbBuffer_cmd_payload_fragment_mask = io_input_cmd_payload_fragment_mask;
  assign bmbBuffer_cmd_payload_fragment_context = io_input_cmd_payload_fragment_context;
  assign bmbBuffer_rsp_ready = ((1'b1 && (! bmbBuffer_rsp_m2sPipe_valid)) || bmbBuffer_rsp_m2sPipe_ready);
  assign bmbBuffer_rsp_m2sPipe_valid = bmbBuffer_rsp_m2sPipe_rValid;
  assign bmbBuffer_rsp_m2sPipe_payload_last = bmbBuffer_rsp_m2sPipe_rData_last;
  assign bmbBuffer_rsp_m2sPipe_payload_fragment_opcode = bmbBuffer_rsp_m2sPipe_rData_fragment_opcode;
  assign bmbBuffer_rsp_m2sPipe_payload_fragment_data = bmbBuffer_rsp_m2sPipe_rData_fragment_data;
  assign bmbBuffer_rsp_m2sPipe_payload_fragment_context = bmbBuffer_rsp_m2sPipe_rData_fragment_context;
  assign io_input_rsp_valid = bmbBuffer_rsp_m2sPipe_valid;
  assign bmbBuffer_rsp_m2sPipe_ready = io_input_rsp_ready;
  assign io_input_rsp_payload_last = bmbBuffer_rsp_m2sPipe_payload_last;
  assign io_input_rsp_payload_fragment_opcode = bmbBuffer_rsp_m2sPipe_payload_fragment_opcode;
  assign io_input_rsp_payload_fragment_data = bmbBuffer_rsp_m2sPipe_payload_fragment_data;
  assign io_input_rsp_payload_fragment_context = bmbBuffer_rsp_m2sPipe_payload_fragment_context;
  always @ (*) begin
    bmbBuffer_cmd_ready = 1'b0;
    if(! _zz_2) begin
      if(io_output_PREADY)begin
        bmbBuffer_cmd_ready = 1'b1;
      end
    end
  end

  assign io_output_PSEL[0] = bmbBuffer_cmd_valid;
  assign io_output_PENABLE = state;
  assign io_output_PWRITE = (bmbBuffer_cmd_payload_fragment_opcode == (1'b1));
  assign io_output_PADDR = bmbBuffer_cmd_payload_fragment_address;
  assign io_output_PWDATA = bmbBuffer_cmd_payload_fragment_data;
  always @ (*) begin
    bmbBuffer_rsp_valid = 1'b0;
    if(! _zz_2) begin
      if(io_output_PREADY)begin
        bmbBuffer_rsp_valid = 1'b1;
      end
    end
  end

  assign bmbBuffer_rsp_payload_fragment_data = io_output_PRDATA;
  assign bmbBuffer_rsp_payload_fragment_context = io_input_cmd_payload_fragment_context;
  assign bmbBuffer_rsp_payload_last = 1'b1;
  always @ (*) begin
    bmbBuffer_rsp_payload_fragment_opcode = (1'b0);
    if(io_output_PSLVERROR)begin
      bmbBuffer_rsp_payload_fragment_opcode = (1'b1);
    end
  end

  always @ (posedge io_systemClk) begin
    if(systemCd_logic_outputReset) begin
      bmbBuffer_rsp_m2sPipe_rValid <= 1'b0;
      state <= 1'b0;
    end else begin
      if(bmbBuffer_rsp_ready)begin
        bmbBuffer_rsp_m2sPipe_rValid <= bmbBuffer_rsp_valid;
      end
      if(_zz_2)begin
        state <= bmbBuffer_cmd_valid;
      end else begin
        if(io_output_PREADY)begin
          state <= 1'b0;
        end
      end
    end
  end

  always @ (posedge io_systemClk) begin
    if(bmbBuffer_rsp_ready)begin
      bmbBuffer_rsp_m2sPipe_rData_last <= bmbBuffer_rsp_payload_last;
      bmbBuffer_rsp_m2sPipe_rData_fragment_opcode <= bmbBuffer_rsp_payload_fragment_opcode;
      bmbBuffer_rsp_m2sPipe_rData_fragment_data <= bmbBuffer_rsp_payload_fragment_data;
      bmbBuffer_rsp_m2sPipe_rData_fragment_context <= bmbBuffer_rsp_payload_fragment_context;
    end
  end


endmodule

module Apb3Router (
  input      [23:0]   io_input_PADDR,
  input      [7:0]    io_input_PSEL,
  input               io_input_PENABLE,
  output              io_input_PREADY,
  input               io_input_PWRITE,
  input      [31:0]   io_input_PWDATA,
  output     [31:0]   io_input_PRDATA,
  output              io_input_PSLVERROR,
  output     [23:0]   io_outputs_0_PADDR,
  output     [0:0]    io_outputs_0_PSEL,
  output              io_outputs_0_PENABLE,
  input               io_outputs_0_PREADY,
  output              io_outputs_0_PWRITE,
  output     [31:0]   io_outputs_0_PWDATA,
  input      [31:0]   io_outputs_0_PRDATA,
  input               io_outputs_0_PSLVERROR,
  output     [23:0]   io_outputs_1_PADDR,
  output     [0:0]    io_outputs_1_PSEL,
  output              io_outputs_1_PENABLE,
  input               io_outputs_1_PREADY,
  output              io_outputs_1_PWRITE,
  output     [31:0]   io_outputs_1_PWDATA,
  input      [31:0]   io_outputs_1_PRDATA,
  input               io_outputs_1_PSLVERROR,
  output     [23:0]   io_outputs_2_PADDR,
  output     [0:0]    io_outputs_2_PSEL,
  output              io_outputs_2_PENABLE,
  input               io_outputs_2_PREADY,
  output              io_outputs_2_PWRITE,
  output     [31:0]   io_outputs_2_PWDATA,
  input      [31:0]   io_outputs_2_PRDATA,
  input               io_outputs_2_PSLVERROR,
  output     [23:0]   io_outputs_3_PADDR,
  output     [0:0]    io_outputs_3_PSEL,
  output              io_outputs_3_PENABLE,
  input               io_outputs_3_PREADY,
  output              io_outputs_3_PWRITE,
  output     [31:0]   io_outputs_3_PWDATA,
  input      [31:0]   io_outputs_3_PRDATA,
  input               io_outputs_3_PSLVERROR,
  output     [23:0]   io_outputs_4_PADDR,
  output     [0:0]    io_outputs_4_PSEL,
  output              io_outputs_4_PENABLE,
  input               io_outputs_4_PREADY,
  output              io_outputs_4_PWRITE,
  output     [31:0]   io_outputs_4_PWDATA,
  input      [31:0]   io_outputs_4_PRDATA,
  input               io_outputs_4_PSLVERROR,
  output     [23:0]   io_outputs_5_PADDR,
  output     [0:0]    io_outputs_5_PSEL,
  output              io_outputs_5_PENABLE,
  input               io_outputs_5_PREADY,
  output              io_outputs_5_PWRITE,
  output     [31:0]   io_outputs_5_PWDATA,
  input      [31:0]   io_outputs_5_PRDATA,
  input               io_outputs_5_PSLVERROR,
  output     [23:0]   io_outputs_6_PADDR,
  output     [0:0]    io_outputs_6_PSEL,
  output              io_outputs_6_PENABLE,
  input               io_outputs_6_PREADY,
  output              io_outputs_6_PWRITE,
  output     [31:0]   io_outputs_6_PWDATA,
  input      [31:0]   io_outputs_6_PRDATA,
  input               io_outputs_6_PSLVERROR,
  output     [23:0]   io_outputs_7_PADDR,
  output     [0:0]    io_outputs_7_PSEL,
  output              io_outputs_7_PENABLE,
  input               io_outputs_7_PREADY,
  output              io_outputs_7_PWRITE,
  output     [31:0]   io_outputs_7_PWDATA,
  input      [31:0]   io_outputs_7_PRDATA,
  input               io_outputs_7_PSLVERROR,
  input               io_systemClk,
  input               systemCd_logic_outputReset
);
  reg                 _zz_8;
  reg        [31:0]   _zz_9;
  reg                 _zz_10;
  wire                _zz_1;
  wire                _zz_2;
  wire                _zz_3;
  wire                _zz_4;
  wire                _zz_5;
  wire                _zz_6;
  wire                _zz_7;
  reg        [2:0]    selIndex;

  always @(*) begin
    case(selIndex)
      3'b000 : begin
        _zz_8 = io_outputs_0_PREADY;
        _zz_9 = io_outputs_0_PRDATA;
        _zz_10 = io_outputs_0_PSLVERROR;
      end
      3'b001 : begin
        _zz_8 = io_outputs_1_PREADY;
        _zz_9 = io_outputs_1_PRDATA;
        _zz_10 = io_outputs_1_PSLVERROR;
      end
      3'b010 : begin
        _zz_8 = io_outputs_2_PREADY;
        _zz_9 = io_outputs_2_PRDATA;
        _zz_10 = io_outputs_2_PSLVERROR;
      end
      3'b011 : begin
        _zz_8 = io_outputs_3_PREADY;
        _zz_9 = io_outputs_3_PRDATA;
        _zz_10 = io_outputs_3_PSLVERROR;
      end
      3'b100 : begin
        _zz_8 = io_outputs_4_PREADY;
        _zz_9 = io_outputs_4_PRDATA;
        _zz_10 = io_outputs_4_PSLVERROR;
      end
      3'b101 : begin
        _zz_8 = io_outputs_5_PREADY;
        _zz_9 = io_outputs_5_PRDATA;
        _zz_10 = io_outputs_5_PSLVERROR;
      end
      3'b110 : begin
        _zz_8 = io_outputs_6_PREADY;
        _zz_9 = io_outputs_6_PRDATA;
        _zz_10 = io_outputs_6_PSLVERROR;
      end
      default : begin
        _zz_8 = io_outputs_7_PREADY;
        _zz_9 = io_outputs_7_PRDATA;
        _zz_10 = io_outputs_7_PSLVERROR;
      end
    endcase
  end

  assign io_outputs_0_PADDR = io_input_PADDR;
  assign io_outputs_0_PENABLE = io_input_PENABLE;
  assign io_outputs_0_PSEL[0] = io_input_PSEL[0];
  assign io_outputs_0_PWRITE = io_input_PWRITE;
  assign io_outputs_0_PWDATA = io_input_PWDATA;
  assign io_outputs_1_PADDR = io_input_PADDR;
  assign io_outputs_1_PENABLE = io_input_PENABLE;
  assign io_outputs_1_PSEL[0] = io_input_PSEL[1];
  assign io_outputs_1_PWRITE = io_input_PWRITE;
  assign io_outputs_1_PWDATA = io_input_PWDATA;
  assign io_outputs_2_PADDR = io_input_PADDR;
  assign io_outputs_2_PENABLE = io_input_PENABLE;
  assign io_outputs_2_PSEL[0] = io_input_PSEL[2];
  assign io_outputs_2_PWRITE = io_input_PWRITE;
  assign io_outputs_2_PWDATA = io_input_PWDATA;
  assign io_outputs_3_PADDR = io_input_PADDR;
  assign io_outputs_3_PENABLE = io_input_PENABLE;
  assign io_outputs_3_PSEL[0] = io_input_PSEL[3];
  assign io_outputs_3_PWRITE = io_input_PWRITE;
  assign io_outputs_3_PWDATA = io_input_PWDATA;
  assign io_outputs_4_PADDR = io_input_PADDR;
  assign io_outputs_4_PENABLE = io_input_PENABLE;
  assign io_outputs_4_PSEL[0] = io_input_PSEL[4];
  assign io_outputs_4_PWRITE = io_input_PWRITE;
  assign io_outputs_4_PWDATA = io_input_PWDATA;
  assign io_outputs_5_PADDR = io_input_PADDR;
  assign io_outputs_5_PENABLE = io_input_PENABLE;
  assign io_outputs_5_PSEL[0] = io_input_PSEL[5];
  assign io_outputs_5_PWRITE = io_input_PWRITE;
  assign io_outputs_5_PWDATA = io_input_PWDATA;
  assign io_outputs_6_PADDR = io_input_PADDR;
  assign io_outputs_6_PENABLE = io_input_PENABLE;
  assign io_outputs_6_PSEL[0] = io_input_PSEL[6];
  assign io_outputs_6_PWRITE = io_input_PWRITE;
  assign io_outputs_6_PWDATA = io_input_PWDATA;
  assign io_outputs_7_PADDR = io_input_PADDR;
  assign io_outputs_7_PENABLE = io_input_PENABLE;
  assign io_outputs_7_PSEL[0] = io_input_PSEL[7];
  assign io_outputs_7_PWRITE = io_input_PWRITE;
  assign io_outputs_7_PWDATA = io_input_PWDATA;
  assign _zz_1 = io_input_PSEL[3];
  assign _zz_2 = io_input_PSEL[5];
  assign _zz_3 = io_input_PSEL[6];
  assign _zz_4 = io_input_PSEL[7];
  assign _zz_5 = (((io_input_PSEL[1] || _zz_1) || _zz_2) || _zz_4);
  assign _zz_6 = (((io_input_PSEL[2] || _zz_1) || _zz_3) || _zz_4);
  assign _zz_7 = (((io_input_PSEL[4] || _zz_2) || _zz_3) || _zz_4);
  assign io_input_PREADY = _zz_8;
  assign io_input_PRDATA = _zz_9;
  assign io_input_PSLVERROR = _zz_10;
  always @ (posedge io_systemClk) begin
    selIndex <= {_zz_7,{_zz_6,_zz_5}};
  end


endmodule

module Apb3Decoder (
  input      [23:0]   io_input_PADDR,
  input      [0:0]    io_input_PSEL,
  input               io_input_PENABLE,
  output reg          io_input_PREADY,
  input               io_input_PWRITE,
  input      [31:0]   io_input_PWDATA,
  output     [31:0]   io_input_PRDATA,
  output reg          io_input_PSLVERROR,
  output     [23:0]   io_output_PADDR,
  output reg [7:0]    io_output_PSEL,
  output              io_output_PENABLE,
  input               io_output_PREADY,
  output              io_output_PWRITE,
  output     [31:0]   io_output_PWDATA,
  input      [31:0]   io_output_PRDATA,
  input               io_output_PSLVERROR
);
  wire                _zz_1;

  assign _zz_1 = (io_input_PSEL[0] && (io_output_PSEL == 8'h0));
  assign io_output_PADDR = io_input_PADDR;
  assign io_output_PENABLE = io_input_PENABLE;
  assign io_output_PWRITE = io_input_PWRITE;
  assign io_output_PWDATA = io_input_PWDATA;
  always @ (*) begin
    io_output_PSEL[0] = (((io_input_PADDR & (~ 24'h3fffff)) == 24'hc00000) && io_input_PSEL[0]);
    io_output_PSEL[1] = (((io_input_PADDR & (~ 24'h00000f)) == 24'h008000) && io_input_PSEL[0]);
    io_output_PSEL[2] = (((io_input_PADDR & (~ 24'h00001f)) == 24'h010000) && io_input_PSEL[0]);
    io_output_PSEL[3] = (((io_input_PADDR & (~ 24'h0000ff)) == 24'h014000) && io_input_PSEL[0]);
    io_output_PSEL[4] = (((io_input_PADDR & (~ 24'h0000ff)) == 24'h015000) && io_input_PSEL[0]);
    io_output_PSEL[5] = (((io_input_PADDR & (~ 24'h0000ff)) == 24'h018000) && io_input_PSEL[0]);
    io_output_PSEL[6] = (((io_input_PADDR & (~ 24'h000fff)) == 24'h0) && io_input_PSEL[0]);
    io_output_PSEL[7] = (((io_input_PADDR & (~ 24'h000fff)) == 24'h800000) && io_input_PSEL[0]);
  end

  always @ (*) begin
    io_input_PREADY = io_output_PREADY;
    if(_zz_1)begin
      io_input_PREADY = 1'b1;
    end
  end

  assign io_input_PRDATA = io_output_PRDATA;
  always @ (*) begin
    io_input_PSLVERROR = io_output_PSLVERROR;
    if(_zz_1)begin
      io_input_PSLVERROR = 1'b1;
    end
  end


endmodule

module BmbDecoder_1 (
  input               io_input_cmd_valid,
  output reg          io_input_cmd_ready,
  input               io_input_cmd_payload_last,
  input      [0:0]    io_input_cmd_payload_fragment_opcode,
  input      [31:0]   io_input_cmd_payload_fragment_address,
  input      [1:0]    io_input_cmd_payload_fragment_length,
  input      [31:0]   io_input_cmd_payload_fragment_data,
  input      [3:0]    io_input_cmd_payload_fragment_mask,
  input      [0:0]    io_input_cmd_payload_fragment_context,
  output reg          io_input_rsp_valid,
  input               io_input_rsp_ready,
  output reg          io_input_rsp_payload_last,
  output reg [0:0]    io_input_rsp_payload_fragment_opcode,
  output     [31:0]   io_input_rsp_payload_fragment_data,
  output reg [0:0]    io_input_rsp_payload_fragment_context,
  output reg          io_outputs_0_cmd_valid,
  input               io_outputs_0_cmd_ready,
  output              io_outputs_0_cmd_payload_last,
  output     [0:0]    io_outputs_0_cmd_payload_fragment_opcode,
  output     [31:0]   io_outputs_0_cmd_payload_fragment_address,
  output     [1:0]    io_outputs_0_cmd_payload_fragment_length,
  output     [31:0]   io_outputs_0_cmd_payload_fragment_data,
  output     [3:0]    io_outputs_0_cmd_payload_fragment_mask,
  output     [0:0]    io_outputs_0_cmd_payload_fragment_context,
  input               io_outputs_0_rsp_valid,
  output              io_outputs_0_rsp_ready,
  input               io_outputs_0_rsp_payload_last,
  input      [0:0]    io_outputs_0_rsp_payload_fragment_opcode,
  input      [31:0]   io_outputs_0_rsp_payload_fragment_data,
  input      [0:0]    io_outputs_0_rsp_payload_fragment_context,
  output reg          io_outputs_1_cmd_valid,
  input               io_outputs_1_cmd_ready,
  output              io_outputs_1_cmd_payload_last,
  output     [0:0]    io_outputs_1_cmd_payload_fragment_opcode,
  output     [31:0]   io_outputs_1_cmd_payload_fragment_address,
  output     [1:0]    io_outputs_1_cmd_payload_fragment_length,
  output     [31:0]   io_outputs_1_cmd_payload_fragment_data,
  output     [3:0]    io_outputs_1_cmd_payload_fragment_mask,
  output     [0:0]    io_outputs_1_cmd_payload_fragment_context,
  input               io_outputs_1_rsp_valid,
  output              io_outputs_1_rsp_ready,
  input               io_outputs_1_rsp_payload_last,
  input      [0:0]    io_outputs_1_rsp_payload_fragment_opcode,
  input      [31:0]   io_outputs_1_rsp_payload_fragment_data,
  input      [0:0]    io_outputs_1_rsp_payload_fragment_context,
  input               io_systemClk,
  input               systemCd_logic_outputReset
);
  reg                 _zz_4;
  reg        [0:0]    _zz_5;
  reg        [31:0]   _zz_6;
  reg        [0:0]    _zz_7;
  wire       [3:0]    _zz_8;
  wire       [0:0]    _zz_9;
  wire       [3:0]    _zz_10;
  wire       [0:0]    _zz_11;
  wire       [3:0]    _zz_12;
  wire                logic_hits_0;
  wire                logic_hits_1;
  wire                _zz_1;
  wire                _zz_2;
  wire                logic_noHit;
  reg        [3:0]    logic_rspPendingCounter;
  wire                logic_cmdWait;
  reg                 logic_rspHits_0;
  reg                 logic_rspHits_1;
  wire                logic_rspPending;
  wire                logic_rspNoHitValid;
  reg                 logic_rspNoHit_doIt;
  reg                 logic_rspNoHit_singleBeatRsp;
  reg        [0:0]    logic_rspNoHit_context;
  wire       [0:0]    _zz_3;

  assign _zz_8 = (logic_rspPendingCounter + _zz_10);
  assign _zz_9 = ((io_input_cmd_valid && io_input_cmd_ready) && io_input_cmd_payload_last);
  assign _zz_10 = {3'd0, _zz_9};
  assign _zz_11 = ((io_input_rsp_valid && io_input_rsp_ready) && io_input_rsp_payload_last);
  assign _zz_12 = {3'd0, _zz_11};
  always @(*) begin
    case(_zz_3)
      1'b0 : begin
        _zz_4 = io_outputs_0_rsp_payload_last;
        _zz_5 = io_outputs_0_rsp_payload_fragment_opcode;
        _zz_6 = io_outputs_0_rsp_payload_fragment_data;
        _zz_7 = io_outputs_0_rsp_payload_fragment_context;
      end
      default : begin
        _zz_4 = io_outputs_1_rsp_payload_last;
        _zz_5 = io_outputs_1_rsp_payload_fragment_opcode;
        _zz_6 = io_outputs_1_rsp_payload_fragment_data;
        _zz_7 = io_outputs_1_rsp_payload_fragment_context;
      end
    endcase
  end

  assign logic_hits_0 = ((io_input_cmd_payload_fragment_address & (~ 32'h00000fff)) == 32'hf9000000);
  always @ (*) begin
    io_outputs_0_cmd_valid = (io_input_cmd_valid && logic_hits_0);
    if(logic_cmdWait)begin
      io_outputs_0_cmd_valid = 1'b0;
    end
  end

  assign _zz_1 = io_input_cmd_payload_last;
  assign io_outputs_0_cmd_payload_last = _zz_1;
  assign io_outputs_0_cmd_payload_fragment_opcode = io_input_cmd_payload_fragment_opcode;
  assign io_outputs_0_cmd_payload_fragment_address = io_input_cmd_payload_fragment_address;
  assign io_outputs_0_cmd_payload_fragment_length = io_input_cmd_payload_fragment_length;
  assign io_outputs_0_cmd_payload_fragment_data = io_input_cmd_payload_fragment_data;
  assign io_outputs_0_cmd_payload_fragment_mask = io_input_cmd_payload_fragment_mask;
  assign io_outputs_0_cmd_payload_fragment_context = io_input_cmd_payload_fragment_context;
  assign logic_hits_1 = ((io_input_cmd_payload_fragment_address & (~ 32'h00ffffff)) == 32'hf8000000);
  always @ (*) begin
    io_outputs_1_cmd_valid = (io_input_cmd_valid && logic_hits_1);
    if(logic_cmdWait)begin
      io_outputs_1_cmd_valid = 1'b0;
    end
  end

  assign _zz_2 = io_input_cmd_payload_last;
  assign io_outputs_1_cmd_payload_last = _zz_2;
  assign io_outputs_1_cmd_payload_fragment_opcode = io_input_cmd_payload_fragment_opcode;
  assign io_outputs_1_cmd_payload_fragment_address = io_input_cmd_payload_fragment_address;
  assign io_outputs_1_cmd_payload_fragment_length = io_input_cmd_payload_fragment_length;
  assign io_outputs_1_cmd_payload_fragment_data = io_input_cmd_payload_fragment_data;
  assign io_outputs_1_cmd_payload_fragment_mask = io_input_cmd_payload_fragment_mask;
  assign io_outputs_1_cmd_payload_fragment_context = io_input_cmd_payload_fragment_context;
  assign logic_noHit = (! ({logic_hits_1,logic_hits_0} != (2'b00)));
  always @ (*) begin
    io_input_cmd_ready = (({(logic_hits_1 && io_outputs_1_cmd_ready),(logic_hits_0 && io_outputs_0_cmd_ready)} != (2'b00)) || logic_noHit);
    if(logic_cmdWait)begin
      io_input_cmd_ready = 1'b0;
    end
  end

  assign logic_rspPending = (logic_rspPendingCounter != (4'b0000));
  assign logic_rspNoHitValid = (! ({logic_rspHits_1,logic_rspHits_0} != (2'b00)));
  always @ (*) begin
    io_input_rsp_valid = (({io_outputs_1_rsp_valid,io_outputs_0_rsp_valid} != (2'b00)) || (logic_rspPending && logic_rspNoHitValid));
    if(logic_rspNoHit_doIt)begin
      io_input_rsp_valid = 1'b1;
    end
  end

  assign _zz_3 = logic_rspHits_1;
  always @ (*) begin
    io_input_rsp_payload_last = _zz_4;
    if(logic_rspNoHit_doIt)begin
      io_input_rsp_payload_last = 1'b1;
    end
  end

  always @ (*) begin
    io_input_rsp_payload_fragment_opcode = _zz_5;
    if(logic_rspNoHit_doIt)begin
      io_input_rsp_payload_fragment_opcode = (1'b1);
    end
  end

  assign io_input_rsp_payload_fragment_data = _zz_6;
  always @ (*) begin
    io_input_rsp_payload_fragment_context = _zz_7;
    if(logic_rspNoHit_doIt)begin
      io_input_rsp_payload_fragment_context = logic_rspNoHit_context;
    end
  end

  assign io_outputs_0_rsp_ready = io_input_rsp_ready;
  assign io_outputs_1_rsp_ready = io_input_rsp_ready;
  assign logic_cmdWait = ((logic_rspPending && (((logic_hits_0 != logic_rspHits_0) || (logic_hits_1 != logic_rspHits_1)) || logic_rspNoHitValid)) || (logic_rspPendingCounter == (4'b1111)));
  always @ (posedge io_systemClk) begin
    if(systemCd_logic_outputReset) begin
      logic_rspPendingCounter <= (4'b0000);
      logic_rspNoHit_doIt <= 1'b0;
    end else begin
      logic_rspPendingCounter <= (_zz_8 - _zz_12);
      if(((io_input_rsp_valid && io_input_rsp_ready) && io_input_rsp_payload_last))begin
        logic_rspNoHit_doIt <= 1'b0;
      end
      if((((io_input_cmd_valid && io_input_cmd_ready) && logic_noHit) && io_input_cmd_payload_last))begin
        logic_rspNoHit_doIt <= 1'b1;
      end
    end
  end

  always @ (posedge io_systemClk) begin
    if((io_input_cmd_valid && (! logic_cmdWait)))begin
      logic_rspHits_0 <= logic_hits_0;
      logic_rspHits_1 <= logic_hits_1;
    end
    if((io_input_cmd_valid && io_input_cmd_ready))begin
      logic_rspNoHit_singleBeatRsp <= (io_input_cmd_payload_fragment_opcode == (1'b1));
    end
    if((io_input_cmd_valid && io_input_cmd_ready))begin
      logic_rspNoHit_context <= io_input_cmd_payload_fragment_context;
    end
  end


endmodule

module BufferCC_8 (
  input               io_initial,
  input               io_dataIn,
  output              io_dataOut,
  input               io_systemClk,
  input               system_cpu_debugReset
);
  reg                 buffers_0;
  reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @ (posedge io_systemClk or posedge system_cpu_debugReset) begin
    if (system_cpu_debugReset) begin
      buffers_0 <= io_initial;
      buffers_1 <= io_initial;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

//Apb3SpiXdrMasterCtrl replaced by Apb3SpiXdrMasterCtrl

module Apb3SpiXdrMasterCtrl (
  input      [7:0]    io_apb_PADDR,
  input      [0:0]    io_apb_PSEL,
  input               io_apb_PENABLE,
  output              io_apb_PREADY,
  input               io_apb_PWRITE,
  input      [31:0]   io_apb_PWDATA,
  output reg [31:0]   io_apb_PRDATA,
  output     [0:0]    io_spi_sclk_write,
  output              io_spi_data_0_writeEnable,
  input      [0:0]    io_spi_data_0_read,
  output     [0:0]    io_spi_data_0_write,
  output              io_spi_data_1_writeEnable,
  input      [0:0]    io_spi_data_1_read,
  output     [0:0]    io_spi_data_1_write,
  output              io_spi_data_2_writeEnable,
  input      [0:0]    io_spi_data_2_read,
  output     [0:0]    io_spi_data_2_write,
  output              io_spi_data_3_writeEnable,
  input      [0:0]    io_spi_data_3_read,
  output     [0:0]    io_spi_data_3_write,
  output     [0:0]    io_spi_ss,
  output              io_interrupt,
  input               io_systemClk,
  input               systemCd_logic_outputReset
);
  wire                _zz_13;
  wire                _zz_14;
  reg                 _zz_15;
  wire                _zz_16;
  wire                ctrl_io_cmd_ready;
  wire                ctrl_io_rsp_valid;
  wire       [7:0]    ctrl_io_rsp_payload_data;
  wire       [0:0]    ctrl_io_spi_sclk_write;
  wire       [0:0]    ctrl_io_spi_ss;
  wire       [0:0]    ctrl_io_spi_data_0_write;
  wire                ctrl_io_spi_data_0_writeEnable;
  wire       [0:0]    ctrl_io_spi_data_1_write;
  wire                ctrl_io_spi_data_1_writeEnable;
  wire       [0:0]    ctrl_io_spi_data_2_write;
  wire                ctrl_io_spi_data_2_writeEnable;
  wire       [0:0]    ctrl_io_spi_data_3_write;
  wire                ctrl_io_spi_data_3_writeEnable;
  wire                mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_push_ready;
  wire                mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_valid;
  wire                mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_payload_kind;
  wire                mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_payload_read;
  wire                mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_payload_write;
  wire       [7:0]    mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_payload_data;
  wire       [8:0]    mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_occupancy;
  wire       [8:0]    mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_availability;
  wire                ctrl_io_rsp_queueWithOccupancy_io_push_ready;
  wire                ctrl_io_rsp_queueWithOccupancy_io_pop_valid;
  wire       [7:0]    ctrl_io_rsp_queueWithOccupancy_io_pop_payload_data;
  wire       [8:0]    ctrl_io_rsp_queueWithOccupancy_io_occupancy;
  wire       [8:0]    ctrl_io_rsp_queueWithOccupancy_io_availability;
  wire       [0:0]    _zz_17;
  wire       [0:0]    _zz_18;
  wire       [0:0]    _zz_19;
  wire       [0:0]    _zz_20;
  wire       [0:0]    _zz_21;
  wire       [0:0]    _zz_22;
  wire       [0:0]    _zz_23;
  wire                _zz_1;
  wire                _zz_2;
  wire                mapping_cmdLogic_streamUnbuffered_valid;
  wire                mapping_cmdLogic_streamUnbuffered_ready;
  wire                mapping_cmdLogic_streamUnbuffered_payload_kind;
  wire                mapping_cmdLogic_streamUnbuffered_payload_read;
  wire                mapping_cmdLogic_streamUnbuffered_payload_write;
  wire       [7:0]    mapping_cmdLogic_streamUnbuffered_payload_data;
  reg                 _zz_3;
  wire                mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_m2sPipe_valid;
  wire                mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_m2sPipe_ready;
  wire                mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_m2sPipe_payload_kind;
  wire                mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_m2sPipe_payload_read;
  wire                mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_m2sPipe_payload_write;
  wire       [7:0]    mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_m2sPipe_payload_data;
  reg                 mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_m2sPipe_rValid;
  reg                 mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_m2sPipe_rData_kind;
  reg                 mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_m2sPipe_rData_read;
  reg                 mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_m2sPipe_rData_write;
  reg        [7:0]    mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_m2sPipe_rData_data;
  reg                 mapping_interruptCtrl_cmdIntEnable;
  reg                 mapping_interruptCtrl_rspIntEnable;
  wire                mapping_interruptCtrl_cmdInt;
  wire                mapping_interruptCtrl_rspInt;
  wire                mapping_interruptCtrl_interrupt;
  reg                 _zz_4;
  reg                 _zz_5;
  reg        [1:0]    _zz_6;
  reg        [11:0]   _zz_7;
  reg        [11:0]   _zz_8;
  reg        [11:0]   _zz_9;
  reg        [11:0]   _zz_10;
  reg        [0:0]    _zz_11;
  wire       [1:0]    _zz_12;

  assign _zz_17 = io_apb_PWDATA[8 : 8];
  assign _zz_18 = io_apb_PWDATA[9 : 9];
  assign _zz_19 = io_apb_PWDATA[11 : 11];
  assign _zz_20 = io_apb_PWDATA[0 : 0];
  assign _zz_21 = io_apb_PWDATA[1 : 1];
  assign _zz_22 = _zz_12[0 : 0];
  assign _zz_23 = _zz_12[1 : 1];
  SpiXdrMasterCtrl ctrl (
    .io_config_kind_cpol           (_zz_4                                                                                     ), //i
    .io_config_kind_cpha           (_zz_5                                                                                     ), //i
    .io_config_sclkToogle          (_zz_7[11:0]                                                                               ), //i
    .io_config_mod                 (_zz_6[1:0]                                                                                ), //i
    .io_config_ss_activeHigh       (_zz_11                                                                                    ), //i
    .io_config_ss_setup            (_zz_8[11:0]                                                                               ), //i
    .io_config_ss_hold             (_zz_9[11:0]                                                                               ), //i
    .io_config_ss_disable          (_zz_10[11:0]                                                                              ), //i
    .io_cmd_valid                  (mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_m2sPipe_valid              ), //i
    .io_cmd_ready                  (ctrl_io_cmd_ready                                                                         ), //o
    .io_cmd_payload_kind           (mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_m2sPipe_payload_kind       ), //i
    .io_cmd_payload_read           (mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_m2sPipe_payload_read       ), //i
    .io_cmd_payload_write          (mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_m2sPipe_payload_write      ), //i
    .io_cmd_payload_data           (mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_m2sPipe_payload_data[7:0]  ), //i
    .io_rsp_valid                  (ctrl_io_rsp_valid                                                                         ), //o
    .io_rsp_payload_data           (ctrl_io_rsp_payload_data[7:0]                                                             ), //o
    .io_spi_sclk_write             (ctrl_io_spi_sclk_write                                                                    ), //o
    .io_spi_data_0_writeEnable     (ctrl_io_spi_data_0_writeEnable                                                            ), //o
    .io_spi_data_0_read            (io_spi_data_0_read                                                                        ), //i
    .io_spi_data_0_write           (ctrl_io_spi_data_0_write                                                                  ), //o
    .io_spi_data_1_writeEnable     (ctrl_io_spi_data_1_writeEnable                                                            ), //o
    .io_spi_data_1_read            (io_spi_data_1_read                                                                        ), //i
    .io_spi_data_1_write           (ctrl_io_spi_data_1_write                                                                  ), //o
    .io_spi_data_2_writeEnable     (ctrl_io_spi_data_2_writeEnable                                                            ), //o
    .io_spi_data_2_read            (io_spi_data_2_read                                                                        ), //i
    .io_spi_data_2_write           (ctrl_io_spi_data_2_write                                                                  ), //o
    .io_spi_data_3_writeEnable     (ctrl_io_spi_data_3_writeEnable                                                            ), //o
    .io_spi_data_3_read            (io_spi_data_3_read                                                                        ), //i
    .io_spi_data_3_write           (ctrl_io_spi_data_3_write                                                                  ), //o
    .io_spi_ss                     (ctrl_io_spi_ss                                                                            ), //o
    .io_systemClk                  (io_systemClk                                                                              ), //i
    .systemCd_logic_outputReset    (systemCd_logic_outputReset                                                                )  //i
  );
  StreamFifo_2 mapping_cmdLogic_streamUnbuffered_queueWithAvailability (
    .io_push_valid                 (mapping_cmdLogic_streamUnbuffered_valid                                           ), //i
    .io_push_ready                 (mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_push_ready             ), //o
    .io_push_payload_kind          (mapping_cmdLogic_streamUnbuffered_payload_kind                                    ), //i
    .io_push_payload_read          (mapping_cmdLogic_streamUnbuffered_payload_read                                    ), //i
    .io_push_payload_write         (mapping_cmdLogic_streamUnbuffered_payload_write                                   ), //i
    .io_push_payload_data          (mapping_cmdLogic_streamUnbuffered_payload_data[7:0]                               ), //i
    .io_pop_valid                  (mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_valid              ), //o
    .io_pop_ready                  (_zz_13                                                                            ), //i
    .io_pop_payload_kind           (mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_payload_kind       ), //o
    .io_pop_payload_read           (mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_payload_read       ), //o
    .io_pop_payload_write          (mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_payload_write      ), //o
    .io_pop_payload_data           (mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_payload_data[7:0]  ), //o
    .io_flush                      (_zz_14                                                                            ), //i
    .io_occupancy                  (mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_occupancy[8:0]         ), //o
    .io_availability               (mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_availability[8:0]      ), //o
    .io_systemClk                  (io_systemClk                                                                      ), //i
    .systemCd_logic_outputReset    (systemCd_logic_outputReset                                                        )  //i
  );
  StreamFifo_3 ctrl_io_rsp_queueWithOccupancy (
    .io_push_valid                 (ctrl_io_rsp_valid                                        ), //i
    .io_push_ready                 (ctrl_io_rsp_queueWithOccupancy_io_push_ready             ), //o
    .io_push_payload_data          (ctrl_io_rsp_payload_data[7:0]                            ), //i
    .io_pop_valid                  (ctrl_io_rsp_queueWithOccupancy_io_pop_valid              ), //o
    .io_pop_ready                  (_zz_15                                                   ), //i
    .io_pop_payload_data           (ctrl_io_rsp_queueWithOccupancy_io_pop_payload_data[7:0]  ), //o
    .io_flush                      (_zz_16                                                   ), //i
    .io_occupancy                  (ctrl_io_rsp_queueWithOccupancy_io_occupancy[8:0]         ), //o
    .io_availability               (ctrl_io_rsp_queueWithOccupancy_io_availability[8:0]      ), //o
    .io_systemClk                  (io_systemClk                                             ), //i
    .systemCd_logic_outputReset    (systemCd_logic_outputReset                               )  //i
  );
  assign io_apb_PREADY = 1'b1;
  always @ (*) begin
    io_apb_PRDATA = 32'h0;
    case(io_apb_PADDR)
      8'b00000000 : begin
        io_apb_PRDATA[31 : 31] = (ctrl_io_rsp_queueWithOccupancy_io_pop_valid ^ 1'b1);
        io_apb_PRDATA[7 : 0] = ctrl_io_rsp_queueWithOccupancy_io_pop_payload_data;
      end
      8'b00000100 : begin
        io_apb_PRDATA[8 : 0] = mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_availability;
        io_apb_PRDATA[24 : 16] = ctrl_io_rsp_queueWithOccupancy_io_occupancy;
      end
      8'b00001100 : begin
        io_apb_PRDATA[0 : 0] = mapping_interruptCtrl_cmdIntEnable;
        io_apb_PRDATA[1 : 1] = mapping_interruptCtrl_rspIntEnable;
        io_apb_PRDATA[8 : 8] = mapping_interruptCtrl_cmdInt;
        io_apb_PRDATA[9 : 9] = mapping_interruptCtrl_rspInt;
      end
      8'b00001000 : begin
      end
      8'b00100000 : begin
      end
      8'b00100100 : begin
      end
      8'b00101000 : begin
      end
      8'b00101100 : begin
      end
      8'b00110000 : begin
      end
      default : begin
      end
    endcase
  end

  assign _zz_1 = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && io_apb_PWRITE);
  assign _zz_2 = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && (! io_apb_PWRITE));
  always @ (*) begin
    _zz_3 = 1'b0;
    case(io_apb_PADDR)
      8'b00000000 : begin
        if(_zz_1)begin
          _zz_3 = 1'b1;
        end
      end
      8'b00000100 : begin
      end
      8'b00001100 : begin
      end
      8'b00001000 : begin
      end
      8'b00100000 : begin
      end
      8'b00100100 : begin
      end
      8'b00101000 : begin
      end
      8'b00101100 : begin
      end
      8'b00110000 : begin
      end
      default : begin
      end
    endcase
  end

  assign mapping_cmdLogic_streamUnbuffered_valid = _zz_3;
  assign mapping_cmdLogic_streamUnbuffered_ready = mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_push_ready;
  assign _zz_13 = ((1'b1 && (! mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_m2sPipe_valid)) || mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_m2sPipe_ready);
  assign mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_m2sPipe_valid = mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_m2sPipe_rValid;
  assign mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_m2sPipe_payload_kind = mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_m2sPipe_rData_kind;
  assign mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_m2sPipe_payload_read = mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_m2sPipe_rData_read;
  assign mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_m2sPipe_payload_write = mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_m2sPipe_rData_write;
  assign mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_m2sPipe_payload_data = mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_m2sPipe_rData_data;
  assign mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_m2sPipe_ready = ctrl_io_cmd_ready;
  always @ (*) begin
    _zz_15 = 1'b0;
    case(io_apb_PADDR)
      8'b00000000 : begin
        if(_zz_2)begin
          _zz_15 = 1'b1;
        end
      end
      8'b00000100 : begin
      end
      8'b00001100 : begin
      end
      8'b00001000 : begin
      end
      8'b00100000 : begin
      end
      8'b00100100 : begin
      end
      8'b00101000 : begin
      end
      8'b00101100 : begin
      end
      8'b00110000 : begin
      end
      default : begin
      end
    endcase
  end

  assign mapping_interruptCtrl_cmdInt = (mapping_interruptCtrl_cmdIntEnable && (! mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_valid));
  assign mapping_interruptCtrl_rspInt = (mapping_interruptCtrl_rspIntEnable && ctrl_io_rsp_queueWithOccupancy_io_pop_valid);
  assign mapping_interruptCtrl_interrupt = (mapping_interruptCtrl_rspInt || mapping_interruptCtrl_cmdInt);
  assign io_spi_sclk_write = ctrl_io_spi_sclk_write;
  assign io_spi_data_0_writeEnable = ctrl_io_spi_data_0_writeEnable;
  assign io_spi_data_0_write = ctrl_io_spi_data_0_write;
  assign io_spi_data_1_writeEnable = ctrl_io_spi_data_1_writeEnable;
  assign io_spi_data_1_write = ctrl_io_spi_data_1_write;
  assign io_spi_data_2_writeEnable = ctrl_io_spi_data_2_writeEnable;
  assign io_spi_data_2_write = ctrl_io_spi_data_2_write;
  assign io_spi_data_3_writeEnable = ctrl_io_spi_data_3_writeEnable;
  assign io_spi_data_3_write = ctrl_io_spi_data_3_write;
  assign io_spi_ss = ctrl_io_spi_ss;
  assign io_interrupt = mapping_interruptCtrl_interrupt;
  assign mapping_cmdLogic_streamUnbuffered_payload_data = io_apb_PWDATA[7 : 0];
  assign mapping_cmdLogic_streamUnbuffered_payload_write = _zz_17[0];
  assign mapping_cmdLogic_streamUnbuffered_payload_read = _zz_18[0];
  assign mapping_cmdLogic_streamUnbuffered_payload_kind = _zz_19[0];
  assign _zz_12 = io_apb_PWDATA[1 : 0];
  assign _zz_14 = 1'b0;
  assign _zz_16 = 1'b0;
  always @ (posedge io_systemClk) begin
    if(systemCd_logic_outputReset) begin
      mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_m2sPipe_rValid <= 1'b0;
      mapping_interruptCtrl_cmdIntEnable <= 1'b0;
      mapping_interruptCtrl_rspIntEnable <= 1'b0;
      _zz_11 <= (1'b0);
    end else begin
      if(_zz_13)begin
        mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_m2sPipe_rValid <= mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_valid;
      end
      case(io_apb_PADDR)
        8'b00000000 : begin
        end
        8'b00000100 : begin
        end
        8'b00001100 : begin
          if(_zz_1)begin
            mapping_interruptCtrl_cmdIntEnable <= _zz_20[0];
            mapping_interruptCtrl_rspIntEnable <= _zz_21[0];
          end
        end
        8'b00001000 : begin
        end
        8'b00100000 : begin
        end
        8'b00100100 : begin
        end
        8'b00101000 : begin
        end
        8'b00101100 : begin
        end
        8'b00110000 : begin
          if(_zz_1)begin
            _zz_11 <= io_apb_PWDATA[0 : 0];
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @ (posedge io_systemClk) begin
    if(_zz_13)begin
      mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_m2sPipe_rData_kind <= mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_payload_kind;
      mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_m2sPipe_rData_read <= mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_payload_read;
      mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_m2sPipe_rData_write <= mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_payload_write;
      mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_m2sPipe_rData_data <= mapping_cmdLogic_streamUnbuffered_queueWithAvailability_io_pop_payload_data;
    end
    case(io_apb_PADDR)
      8'b00000000 : begin
      end
      8'b00000100 : begin
      end
      8'b00001100 : begin
      end
      8'b00001000 : begin
        if(_zz_1)begin
          _zz_4 <= _zz_22[0];
          _zz_5 <= _zz_23[0];
          _zz_6 <= io_apb_PWDATA[5 : 4];
        end
      end
      8'b00100000 : begin
        if(_zz_1)begin
          _zz_7 <= io_apb_PWDATA[11 : 0];
        end
      end
      8'b00100100 : begin
        if(_zz_1)begin
          _zz_8 <= io_apb_PWDATA[11 : 0];
        end
      end
      8'b00101000 : begin
        if(_zz_1)begin
          _zz_9 <= io_apb_PWDATA[11 : 0];
        end
      end
      8'b00101100 : begin
        if(_zz_1)begin
          _zz_10 <= io_apb_PWDATA[11 : 0];
        end
      end
      8'b00110000 : begin
      end
      default : begin
      end
    endcase
  end


endmodule

module BmbArbiter (
  input               io_inputs_0_cmd_valid,
  output              io_inputs_0_cmd_ready,
  input               io_inputs_0_cmd_payload_last,
  input      [0:0]    io_inputs_0_cmd_payload_fragment_opcode,
  input      [11:0]   io_inputs_0_cmd_payload_fragment_address,
  input      [1:0]    io_inputs_0_cmd_payload_fragment_length,
  input      [31:0]   io_inputs_0_cmd_payload_fragment_data,
  input      [3:0]    io_inputs_0_cmd_payload_fragment_mask,
  input      [0:0]    io_inputs_0_cmd_payload_fragment_context,
  output              io_inputs_0_rsp_valid,
  input               io_inputs_0_rsp_ready,
  output              io_inputs_0_rsp_payload_last,
  output     [0:0]    io_inputs_0_rsp_payload_fragment_opcode,
  output     [31:0]   io_inputs_0_rsp_payload_fragment_data,
  output     [0:0]    io_inputs_0_rsp_payload_fragment_context,
  input               io_inputs_1_cmd_valid,
  output              io_inputs_1_cmd_ready,
  input               io_inputs_1_cmd_payload_last,
  input      [0:0]    io_inputs_1_cmd_payload_fragment_opcode,
  input      [11:0]   io_inputs_1_cmd_payload_fragment_address,
  input      [1:0]    io_inputs_1_cmd_payload_fragment_length,
  input      [31:0]   io_inputs_1_cmd_payload_fragment_data,
  input      [3:0]    io_inputs_1_cmd_payload_fragment_mask,
  input      [0:0]    io_inputs_1_cmd_payload_fragment_context,
  output              io_inputs_1_rsp_valid,
  input               io_inputs_1_rsp_ready,
  output              io_inputs_1_rsp_payload_last,
  output     [0:0]    io_inputs_1_rsp_payload_fragment_opcode,
  output     [31:0]   io_inputs_1_rsp_payload_fragment_data,
  output     [0:0]    io_inputs_1_rsp_payload_fragment_context,
  output              io_output_cmd_valid,
  input               io_output_cmd_ready,
  output              io_output_cmd_payload_last,
  output     [0:0]    io_output_cmd_payload_fragment_source,
  output     [0:0]    io_output_cmd_payload_fragment_opcode,
  output     [11:0]   io_output_cmd_payload_fragment_address,
  output     [1:0]    io_output_cmd_payload_fragment_length,
  output     [31:0]   io_output_cmd_payload_fragment_data,
  output     [3:0]    io_output_cmd_payload_fragment_mask,
  output     [0:0]    io_output_cmd_payload_fragment_context,
  input               io_output_rsp_valid,
  output              io_output_rsp_ready,
  input               io_output_rsp_payload_last,
  input      [0:0]    io_output_rsp_payload_fragment_source,
  input      [0:0]    io_output_rsp_payload_fragment_opcode,
  input      [31:0]   io_output_rsp_payload_fragment_data,
  input      [0:0]    io_output_rsp_payload_fragment_context,
  input               io_systemClk,
  input               systemCd_logic_outputReset
);
  wire       [0:0]    _zz_1;
  wire       [0:0]    _zz_2;
  reg                 _zz_3;
  wire                memory_arbiter_io_inputs_0_ready;
  wire                memory_arbiter_io_inputs_1_ready;
  wire                memory_arbiter_io_output_valid;
  wire                memory_arbiter_io_output_payload_last;
  wire       [0:0]    memory_arbiter_io_output_payload_fragment_source;
  wire       [0:0]    memory_arbiter_io_output_payload_fragment_opcode;
  wire       [11:0]   memory_arbiter_io_output_payload_fragment_address;
  wire       [1:0]    memory_arbiter_io_output_payload_fragment_length;
  wire       [31:0]   memory_arbiter_io_output_payload_fragment_data;
  wire       [3:0]    memory_arbiter_io_output_payload_fragment_mask;
  wire       [0:0]    memory_arbiter_io_output_payload_fragment_context;
  wire       [0:0]    memory_arbiter_io_chosen;
  wire       [1:0]    memory_arbiter_io_chosenOH;
  wire       [0:0]    memory_rspSel;

  StreamArbiter memory_arbiter (
    .io_inputs_0_valid                       (io_inputs_0_cmd_valid                                    ), //i
    .io_inputs_0_ready                       (memory_arbiter_io_inputs_0_ready                         ), //o
    .io_inputs_0_payload_last                (io_inputs_0_cmd_payload_last                             ), //i
    .io_inputs_0_payload_fragment_source     (_zz_1                                                    ), //i
    .io_inputs_0_payload_fragment_opcode     (io_inputs_0_cmd_payload_fragment_opcode                  ), //i
    .io_inputs_0_payload_fragment_address    (io_inputs_0_cmd_payload_fragment_address[11:0]           ), //i
    .io_inputs_0_payload_fragment_length     (io_inputs_0_cmd_payload_fragment_length[1:0]             ), //i
    .io_inputs_0_payload_fragment_data       (io_inputs_0_cmd_payload_fragment_data[31:0]              ), //i
    .io_inputs_0_payload_fragment_mask       (io_inputs_0_cmd_payload_fragment_mask[3:0]               ), //i
    .io_inputs_0_payload_fragment_context    (io_inputs_0_cmd_payload_fragment_context                 ), //i
    .io_inputs_1_valid                       (io_inputs_1_cmd_valid                                    ), //i
    .io_inputs_1_ready                       (memory_arbiter_io_inputs_1_ready                         ), //o
    .io_inputs_1_payload_last                (io_inputs_1_cmd_payload_last                             ), //i
    .io_inputs_1_payload_fragment_source     (_zz_2                                                    ), //i
    .io_inputs_1_payload_fragment_opcode     (io_inputs_1_cmd_payload_fragment_opcode                  ), //i
    .io_inputs_1_payload_fragment_address    (io_inputs_1_cmd_payload_fragment_address[11:0]           ), //i
    .io_inputs_1_payload_fragment_length     (io_inputs_1_cmd_payload_fragment_length[1:0]             ), //i
    .io_inputs_1_payload_fragment_data       (io_inputs_1_cmd_payload_fragment_data[31:0]              ), //i
    .io_inputs_1_payload_fragment_mask       (io_inputs_1_cmd_payload_fragment_mask[3:0]               ), //i
    .io_inputs_1_payload_fragment_context    (io_inputs_1_cmd_payload_fragment_context                 ), //i
    .io_output_valid                         (memory_arbiter_io_output_valid                           ), //o
    .io_output_ready                         (io_output_cmd_ready                                      ), //i
    .io_output_payload_last                  (memory_arbiter_io_output_payload_last                    ), //o
    .io_output_payload_fragment_source       (memory_arbiter_io_output_payload_fragment_source         ), //o
    .io_output_payload_fragment_opcode       (memory_arbiter_io_output_payload_fragment_opcode         ), //o
    .io_output_payload_fragment_address      (memory_arbiter_io_output_payload_fragment_address[11:0]  ), //o
    .io_output_payload_fragment_length       (memory_arbiter_io_output_payload_fragment_length[1:0]    ), //o
    .io_output_payload_fragment_data         (memory_arbiter_io_output_payload_fragment_data[31:0]     ), //o
    .io_output_payload_fragment_mask         (memory_arbiter_io_output_payload_fragment_mask[3:0]      ), //o
    .io_output_payload_fragment_context      (memory_arbiter_io_output_payload_fragment_context        ), //o
    .io_chosen                               (memory_arbiter_io_chosen                                 ), //o
    .io_chosenOH                             (memory_arbiter_io_chosenOH[1:0]                          ), //o
    .io_systemClk                            (io_systemClk                                             ), //i
    .systemCd_logic_outputReset              (systemCd_logic_outputReset                               )  //i
  );
  always @(*) begin
    case(memory_rspSel)
      1'b0 : begin
        _zz_3 = io_inputs_0_rsp_ready;
      end
      default : begin
        _zz_3 = io_inputs_1_rsp_ready;
      end
    endcase
  end

  assign io_inputs_0_cmd_ready = memory_arbiter_io_inputs_0_ready;
  assign _zz_1 = (1'b0);
  assign io_inputs_1_cmd_ready = memory_arbiter_io_inputs_1_ready;
  assign _zz_2 = (1'b0);
  assign io_output_cmd_valid = memory_arbiter_io_output_valid;
  assign io_output_cmd_payload_last = memory_arbiter_io_output_payload_last;
  assign io_output_cmd_payload_fragment_opcode = memory_arbiter_io_output_payload_fragment_opcode;
  assign io_output_cmd_payload_fragment_address = memory_arbiter_io_output_payload_fragment_address;
  assign io_output_cmd_payload_fragment_length = memory_arbiter_io_output_payload_fragment_length;
  assign io_output_cmd_payload_fragment_data = memory_arbiter_io_output_payload_fragment_data;
  assign io_output_cmd_payload_fragment_mask = memory_arbiter_io_output_payload_fragment_mask;
  assign io_output_cmd_payload_fragment_context = memory_arbiter_io_output_payload_fragment_context;
  assign io_output_cmd_payload_fragment_source[0 : 0] = memory_arbiter_io_chosen;
  assign memory_rspSel = io_output_rsp_payload_fragment_source[0 : 0];
  assign io_inputs_0_rsp_valid = (io_output_rsp_valid && (memory_rspSel == (1'b0)));
  assign io_inputs_0_rsp_payload_last = io_output_rsp_payload_last;
  assign io_inputs_0_rsp_payload_fragment_opcode = io_output_rsp_payload_fragment_opcode;
  assign io_inputs_0_rsp_payload_fragment_data = io_output_rsp_payload_fragment_data;
  assign io_inputs_0_rsp_payload_fragment_context = io_output_rsp_payload_fragment_context;
  assign io_inputs_1_rsp_valid = (io_output_rsp_valid && (memory_rspSel == (1'b1)));
  assign io_inputs_1_rsp_payload_last = io_output_rsp_payload_last;
  assign io_inputs_1_rsp_payload_fragment_opcode = io_output_rsp_payload_fragment_opcode;
  assign io_inputs_1_rsp_payload_fragment_data = io_output_rsp_payload_fragment_data;
  assign io_inputs_1_rsp_payload_fragment_context = io_output_rsp_payload_fragment_context;
  assign io_output_rsp_ready = _zz_3;

endmodule

module BmbOnChipRam (
  input               io_bus_cmd_valid,
  output              io_bus_cmd_ready,
  input               io_bus_cmd_payload_last,
  input      [0:0]    io_bus_cmd_payload_fragment_source,
  input      [0:0]    io_bus_cmd_payload_fragment_opcode,
  input      [11:0]   io_bus_cmd_payload_fragment_address,
  input      [1:0]    io_bus_cmd_payload_fragment_length,
  input      [31:0]   io_bus_cmd_payload_fragment_data,
  input      [3:0]    io_bus_cmd_payload_fragment_mask,
  input      [0:0]    io_bus_cmd_payload_fragment_context,
  output              io_bus_rsp_valid,
  input               io_bus_rsp_ready,
  output              io_bus_rsp_payload_last,
  output     [0:0]    io_bus_rsp_payload_fragment_source,
  output     [0:0]    io_bus_rsp_payload_fragment_opcode,
  output     [31:0]   io_bus_rsp_payload_fragment_data,
  output     [0:0]    io_bus_rsp_payload_fragment_context,
  input               io_systemClk,
  input               systemCd_logic_outputReset
);
  reg        [31:0]   _zz_5;
  reg                 io_bus_cmd_valid_regNextWhen;
  reg        [0:0]    io_bus_cmd_payload_fragment_source_regNextWhen;
  reg        [0:0]    io_bus_cmd_payload_fragment_context_regNextWhen;
  wire       [9:0]    _zz_1;
  wire                _zz_2;
  wire                _zz_3;
  wire       [31:0]   _zz_4;
  reg [7:0] ram_symbol0 [0:1023];
  reg [7:0] ram_symbol1 [0:1023];
  reg [7:0] ram_symbol2 [0:1023];
  reg [7:0] ram_symbol3 [0:1023];
  reg [7:0] _zz_6;
  reg [7:0] _zz_7;
  reg [7:0] _zz_8;
  reg [7:0] _zz_9;

  initial begin
    $readmemb("OpalSoc_t8.v_toplevel_system_ramA_logic_ram_symbol0.bin",ram_symbol0);
    $readmemb("OpalSoc_t8.v_toplevel_system_ramA_logic_ram_symbol1.bin",ram_symbol1);
    $readmemb("OpalSoc_t8.v_toplevel_system_ramA_logic_ram_symbol2.bin",ram_symbol2);
    $readmemb("OpalSoc_t8.v_toplevel_system_ramA_logic_ram_symbol3.bin",ram_symbol3);
  end
  always @ (*) begin
    _zz_5 = {_zz_9, _zz_8, _zz_7, _zz_6};
  end
  always @ (posedge io_systemClk) begin
    if(_zz_2) begin
      _zz_6 <= ram_symbol0[_zz_1];
      _zz_7 <= ram_symbol1[_zz_1];
      _zz_8 <= ram_symbol2[_zz_1];
      _zz_9 <= ram_symbol3[_zz_1];
    end
  end

  always @ (posedge io_systemClk) begin
    if(io_bus_cmd_payload_fragment_mask[0] && _zz_2 && _zz_3 ) begin
      ram_symbol0[_zz_1] <= _zz_4[7 : 0];
    end
    if(io_bus_cmd_payload_fragment_mask[1] && _zz_2 && _zz_3 ) begin
      ram_symbol1[_zz_1] <= _zz_4[15 : 8];
    end
    if(io_bus_cmd_payload_fragment_mask[2] && _zz_2 && _zz_3 ) begin
      ram_symbol2[_zz_1] <= _zz_4[23 : 16];
    end
    if(io_bus_cmd_payload_fragment_mask[3] && _zz_2 && _zz_3 ) begin
      ram_symbol3[_zz_1] <= _zz_4[31 : 24];
    end
  end

  assign io_bus_cmd_ready = (! (io_bus_rsp_valid && (! io_bus_rsp_ready)));
  assign io_bus_rsp_valid = io_bus_cmd_valid_regNextWhen;
  assign io_bus_rsp_payload_fragment_source = io_bus_cmd_payload_fragment_source_regNextWhen;
  assign io_bus_rsp_payload_fragment_context = io_bus_cmd_payload_fragment_context_regNextWhen;
  assign _zz_1 = (io_bus_cmd_payload_fragment_address >>> 2);
  assign _zz_2 = (io_bus_cmd_valid && io_bus_cmd_ready);
  assign _zz_3 = (io_bus_cmd_payload_fragment_opcode == (1'b1));
  assign _zz_4 = io_bus_cmd_payload_fragment_data;
  assign io_bus_rsp_payload_fragment_data = _zz_5;
  assign io_bus_rsp_payload_fragment_opcode = (1'b0);
  assign io_bus_rsp_payload_last = 1'b1;
  always @ (posedge io_systemClk) begin
    if(systemCd_logic_outputReset) begin
      io_bus_cmd_valid_regNextWhen <= 1'b0;
    end else begin
      if(io_bus_cmd_ready)begin
        io_bus_cmd_valid_regNextWhen <= io_bus_cmd_valid;
      end
    end
  end

  always @ (posedge io_systemClk) begin
    if(io_bus_cmd_ready)begin
      io_bus_cmd_payload_fragment_source_regNextWhen <= io_bus_cmd_payload_fragment_source;
    end
    if(io_bus_cmd_ready)begin
      io_bus_cmd_payload_fragment_context_regNextWhen <= io_bus_cmd_payload_fragment_context;
    end
  end


endmodule

module BmbDecoder (
  input               io_input_cmd_valid,
  output reg          io_input_cmd_ready,
  input               io_input_cmd_payload_last,
  input      [0:0]    io_input_cmd_payload_fragment_opcode,
  input      [31:0]   io_input_cmd_payload_fragment_address,
  input      [1:0]    io_input_cmd_payload_fragment_length,
  output reg          io_input_rsp_valid,
  input               io_input_rsp_ready,
  output reg          io_input_rsp_payload_last,
  output reg [0:0]    io_input_rsp_payload_fragment_opcode,
  output     [31:0]   io_input_rsp_payload_fragment_data,
  output reg          io_outputs_0_cmd_valid,
  input               io_outputs_0_cmd_ready,
  output              io_outputs_0_cmd_payload_last,
  output     [0:0]    io_outputs_0_cmd_payload_fragment_opcode,
  output     [31:0]   io_outputs_0_cmd_payload_fragment_address,
  output     [1:0]    io_outputs_0_cmd_payload_fragment_length,
  input               io_outputs_0_rsp_valid,
  output              io_outputs_0_rsp_ready,
  input               io_outputs_0_rsp_payload_last,
  input      [0:0]    io_outputs_0_rsp_payload_fragment_opcode,
  input      [31:0]   io_outputs_0_rsp_payload_fragment_data,
  input               io_systemClk,
  input               systemCd_logic_outputReset
);
  wire       [3:0]    _zz_2;
  wire       [0:0]    _zz_3;
  wire       [3:0]    _zz_4;
  wire       [0:0]    _zz_5;
  wire       [3:0]    _zz_6;
  wire                logic_hits_0;
  wire                _zz_1;
  wire                logic_noHit;
  reg        [3:0]    logic_rspPendingCounter;
  wire                logic_cmdWait;
  reg                 logic_rspHits_0;
  wire                logic_rspPending;
  wire                logic_rspNoHitValid;
  reg                 logic_rspNoHit_doIt;
  reg                 logic_rspNoHit_singleBeatRsp;

  assign _zz_2 = (logic_rspPendingCounter + _zz_4);
  assign _zz_3 = ((io_input_cmd_valid && io_input_cmd_ready) && io_input_cmd_payload_last);
  assign _zz_4 = {3'd0, _zz_3};
  assign _zz_5 = ((io_input_rsp_valid && io_input_rsp_ready) && io_input_rsp_payload_last);
  assign _zz_6 = {3'd0, _zz_5};
  assign logic_hits_0 = ((io_input_cmd_payload_fragment_address & (~ 32'h00000fff)) == 32'hf9000000);
  always @ (*) begin
    io_outputs_0_cmd_valid = (io_input_cmd_valid && logic_hits_0);
    if(logic_cmdWait)begin
      io_outputs_0_cmd_valid = 1'b0;
    end
  end

  assign _zz_1 = io_input_cmd_payload_last;
  assign io_outputs_0_cmd_payload_last = _zz_1;
  assign io_outputs_0_cmd_payload_fragment_opcode = io_input_cmd_payload_fragment_opcode;
  assign io_outputs_0_cmd_payload_fragment_address = io_input_cmd_payload_fragment_address;
  assign io_outputs_0_cmd_payload_fragment_length = io_input_cmd_payload_fragment_length;
  assign logic_noHit = (! (logic_hits_0 != (1'b0)));
  always @ (*) begin
    io_input_cmd_ready = (((logic_hits_0 && io_outputs_0_cmd_ready) != (1'b0)) || logic_noHit);
    if(logic_cmdWait)begin
      io_input_cmd_ready = 1'b0;
    end
  end

  assign logic_rspPending = (logic_rspPendingCounter != (4'b0000));
  assign logic_rspNoHitValid = (! (logic_rspHits_0 != (1'b0)));
  always @ (*) begin
    io_input_rsp_valid = ((io_outputs_0_rsp_valid != (1'b0)) || (logic_rspPending && logic_rspNoHitValid));
    if(logic_rspNoHit_doIt)begin
      io_input_rsp_valid = 1'b1;
    end
  end

  always @ (*) begin
    io_input_rsp_payload_last = io_outputs_0_rsp_payload_last;
    if(logic_rspNoHit_doIt)begin
      io_input_rsp_payload_last = 1'b1;
    end
  end

  always @ (*) begin
    io_input_rsp_payload_fragment_opcode = io_outputs_0_rsp_payload_fragment_opcode;
    if(logic_rspNoHit_doIt)begin
      io_input_rsp_payload_fragment_opcode = (1'b1);
    end
  end

  assign io_input_rsp_payload_fragment_data = io_outputs_0_rsp_payload_fragment_data;
  assign io_outputs_0_rsp_ready = io_input_rsp_ready;
  assign logic_cmdWait = ((logic_rspPending && ((logic_hits_0 != logic_rspHits_0) || logic_rspNoHitValid)) || (logic_rspPendingCounter == (4'b1111)));
  always @ (posedge io_systemClk) begin
    if(systemCd_logic_outputReset) begin
      logic_rspPendingCounter <= (4'b0000);
      logic_rspNoHit_doIt <= 1'b0;
    end else begin
      logic_rspPendingCounter <= (_zz_2 - _zz_6);
      if(((io_input_rsp_valid && io_input_rsp_ready) && io_input_rsp_payload_last))begin
        logic_rspNoHit_doIt <= 1'b0;
      end
      if((((io_input_cmd_valid && io_input_cmd_ready) && logic_noHit) && io_input_cmd_payload_last))begin
        logic_rspNoHit_doIt <= 1'b1;
      end
    end
  end

  always @ (posedge io_systemClk) begin
    if((io_input_cmd_valid && (! logic_cmdWait)))begin
      logic_rspHits_0 <= logic_hits_0;
    end
    if((io_input_cmd_valid && io_input_cmd_ready))begin
      logic_rspNoHit_singleBeatRsp <= (io_input_cmd_payload_fragment_opcode == (1'b1));
    end
  end


endmodule

module SystemDebugger (
  input               io_remote_cmd_valid,
  output              io_remote_cmd_ready,
  input               io_remote_cmd_payload_last,
  input      [0:0]    io_remote_cmd_payload_fragment,
  output              io_remote_rsp_valid,
  input               io_remote_rsp_ready,
  output              io_remote_rsp_payload_error,
  output     [31:0]   io_remote_rsp_payload_data,
  output              io_mem_cmd_valid,
  input               io_mem_cmd_ready,
  output     [31:0]   io_mem_cmd_payload_address,
  output     [31:0]   io_mem_cmd_payload_data,
  output              io_mem_cmd_payload_wr,
  output     [1:0]    io_mem_cmd_payload_size,
  input               io_mem_rsp_valid,
  input      [31:0]   io_mem_rsp_payload,
  input               io_systemClk,
  input               debugCd_logic_outputReset
);
  wire                _zz_2;
  wire       [0:0]    _zz_3;
  reg        [66:0]   dispatcher_dataShifter;
  reg                 dispatcher_dataLoaded;
  reg        [7:0]    dispatcher_headerShifter;
  wire       [7:0]    dispatcher_header;
  reg                 dispatcher_headerLoaded;
  reg        [2:0]    dispatcher_counter;
  wire       [66:0]   _zz_1;

  assign _zz_2 = (dispatcher_headerLoaded == 1'b0);
  assign _zz_3 = _zz_1[64 : 64];
  assign dispatcher_header = dispatcher_headerShifter[7 : 0];
  assign io_remote_cmd_ready = (! dispatcher_dataLoaded);
  assign _zz_1 = dispatcher_dataShifter[66 : 0];
  assign io_mem_cmd_payload_address = _zz_1[31 : 0];
  assign io_mem_cmd_payload_data = _zz_1[63 : 32];
  assign io_mem_cmd_payload_wr = _zz_3[0];
  assign io_mem_cmd_payload_size = _zz_1[66 : 65];
  assign io_mem_cmd_valid = (dispatcher_dataLoaded && (dispatcher_header == 8'h0));
  assign io_remote_rsp_valid = io_mem_rsp_valid;
  assign io_remote_rsp_payload_error = 1'b0;
  assign io_remote_rsp_payload_data = io_mem_rsp_payload;
  always @ (posedge io_systemClk) begin
    if(debugCd_logic_outputReset) begin
      dispatcher_dataLoaded <= 1'b0;
      dispatcher_headerLoaded <= 1'b0;
      dispatcher_counter <= (3'b000);
    end else begin
      if(io_remote_cmd_valid)begin
        if(_zz_2)begin
          dispatcher_counter <= (dispatcher_counter + (3'b001));
          if((dispatcher_counter == (3'b111)))begin
            dispatcher_headerLoaded <= 1'b1;
          end
        end
        if(io_remote_cmd_payload_last)begin
          dispatcher_headerLoaded <= 1'b1;
          dispatcher_dataLoaded <= 1'b1;
          dispatcher_counter <= (3'b000);
        end
      end
      if((io_mem_cmd_valid && io_mem_cmd_ready))begin
        dispatcher_headerLoaded <= 1'b0;
        dispatcher_dataLoaded <= 1'b0;
      end
    end
  end

  always @ (posedge io_systemClk) begin
    if(io_remote_cmd_valid)begin
      if(_zz_2)begin
        dispatcher_headerShifter <= ({io_remote_cmd_payload_fragment,dispatcher_headerShifter} >>> 1);
      end else begin
        dispatcher_dataShifter <= ({io_remote_cmd_payload_fragment,dispatcher_dataShifter} >>> 1);
      end
    end
  end


endmodule

module JtagBridgeNoTap (
  input               io_ctrl_tdi,
  input               io_ctrl_enable,
  input               io_ctrl_capture,
  input               io_ctrl_shift,
  input               io_ctrl_update,
  input               io_ctrl_reset,
  output              io_ctrl_tdo,
  output              io_remote_cmd_valid,
  input               io_remote_cmd_ready,
  output              io_remote_cmd_payload_last,
  output     [0:0]    io_remote_cmd_payload_fragment,
  input               io_remote_rsp_valid,
  output              io_remote_rsp_ready,
  input               io_remote_rsp_payload_error,
  input      [31:0]   io_remote_rsp_payload_data,
  input               io_systemClk,
  input               debugCd_logic_outputReset,
  input               jtagCtrl_tck
);
  wire                _zz_9;
  wire                flowCCByToggle_1_io_output_valid;
  wire                flowCCByToggle_1_io_output_payload_last;
  wire       [0:0]    flowCCByToggle_1_io_output_payload_fragment;
  wire                _zz_10;
  wire                _zz_11;
  wire                system_cmd_valid;
  wire                system_cmd_payload_last;
  wire       [0:0]    system_cmd_payload_fragment;
  reg                 system_rsp_valid;
  reg                 system_rsp_payload_error;
  reg        [31:0]   system_rsp_payload_data;
  wire                jtag_wrapper_ctrl_tdi;
  wire                jtag_wrapper_ctrl_enable;
  wire                jtag_wrapper_ctrl_capture;
  wire                jtag_wrapper_ctrl_shift;
  wire                jtag_wrapper_ctrl_update;
  wire                jtag_wrapper_ctrl_reset;
  reg                 jtag_wrapper_ctrl_tdo;
  reg        [1:0]    jtag_wrapper_header;
  wire       [1:0]    jtag_wrapper_headerNext;
  reg        [0:0]    jtag_wrapper_counter;
  reg                 jtag_wrapper_done;
  reg                 jtag_wrapper_sendCapture;
  reg                 jtag_wrapper_sendShift;
  reg                 jtag_wrapper_sendUpdate;
  wire                _zz_1;
  wire                _zz_2;
  wire       [0:0]    _zz_3;
  reg                 _zz_4;
  reg                 _zz_5;
  wire                _zz_6;
  reg        [33:0]   _zz_7;
  wire                _zz_8;

  assign _zz_10 = (! jtag_wrapper_done);
  assign _zz_11 = (jtag_wrapper_counter == (1'b1));
  FlowCCByToggle flowCCByToggle_1 (
    .io_input_valid                (_zz_4                                        ), //i
    .io_input_payload_last         (_zz_9                                        ), //i
    .io_input_payload_fragment     (_zz_3                                        ), //i
    .io_output_valid               (flowCCByToggle_1_io_output_valid             ), //o
    .io_output_payload_last        (flowCCByToggle_1_io_output_payload_last      ), //o
    .io_output_payload_fragment    (flowCCByToggle_1_io_output_payload_fragment  ), //o
    .jtagCtrl_tck                  (jtagCtrl_tck                                 ), //i
    .io_systemClk                  (io_systemClk                                 ), //i
    .debugCd_logic_outputReset     (debugCd_logic_outputReset                    )  //i
  );
  assign io_remote_cmd_valid = system_cmd_valid;
  assign io_remote_cmd_payload_last = system_cmd_payload_last;
  assign io_remote_cmd_payload_fragment = system_cmd_payload_fragment;
  assign io_remote_rsp_ready = 1'b1;
  assign jtag_wrapper_headerNext = ({jtag_wrapper_ctrl_tdi,jtag_wrapper_header} >>> 1);
  always @ (*) begin
    jtag_wrapper_sendCapture = 1'b0;
    if(jtag_wrapper_ctrl_enable)begin
      if(jtag_wrapper_ctrl_shift)begin
        if(_zz_10)begin
          if(_zz_11)begin
            jtag_wrapper_sendCapture = 1'b1;
          end
        end
      end
    end
  end

  always @ (*) begin
    jtag_wrapper_sendShift = 1'b0;
    if(jtag_wrapper_ctrl_enable)begin
      if(jtag_wrapper_ctrl_shift)begin
        if(! _zz_10) begin
          jtag_wrapper_sendShift = 1'b1;
        end
      end
    end
  end

  always @ (*) begin
    jtag_wrapper_sendUpdate = 1'b0;
    if(jtag_wrapper_ctrl_enable)begin
      if(jtag_wrapper_ctrl_update)begin
        jtag_wrapper_sendUpdate = 1'b1;
      end
    end
  end

  always @ (*) begin
    jtag_wrapper_ctrl_tdo = 1'b0;
    if(_zz_6)begin
      jtag_wrapper_ctrl_tdo = 1'b0;
    end
    if(_zz_8)begin
      jtag_wrapper_ctrl_tdo = _zz_7[0];
    end
  end

  assign jtag_wrapper_ctrl_tdi = io_ctrl_tdi;
  assign jtag_wrapper_ctrl_enable = io_ctrl_enable;
  assign jtag_wrapper_ctrl_capture = io_ctrl_capture;
  assign jtag_wrapper_ctrl_shift = io_ctrl_shift;
  assign jtag_wrapper_ctrl_update = io_ctrl_update;
  assign jtag_wrapper_ctrl_reset = io_ctrl_reset;
  assign io_ctrl_tdo = jtag_wrapper_ctrl_tdo;
  assign _zz_3[0] = _zz_5;
  assign _zz_9 = (! (_zz_1 && _zz_2));
  assign system_cmd_valid = flowCCByToggle_1_io_output_valid;
  assign system_cmd_payload_last = flowCCByToggle_1_io_output_payload_last;
  assign system_cmd_payload_fragment = flowCCByToggle_1_io_output_payload_fragment;
  assign _zz_6 = (jtag_wrapper_header == (2'b00));
  assign _zz_1 = 1'b1;
  assign _zz_2 = (_zz_6 && jtag_wrapper_sendShift);
  assign _zz_8 = (jtag_wrapper_header == (2'b01));
  always @ (posedge io_systemClk) begin
    if(io_remote_cmd_valid)begin
      system_rsp_valid <= 1'b0;
    end
    if((io_remote_rsp_valid && io_remote_rsp_ready))begin
      system_rsp_valid <= 1'b1;
      system_rsp_payload_error <= io_remote_rsp_payload_error;
      system_rsp_payload_data <= io_remote_rsp_payload_data;
    end
  end

  always @ (posedge jtagCtrl_tck) begin
    if(jtag_wrapper_ctrl_enable)begin
      if(jtag_wrapper_ctrl_capture)begin
        jtag_wrapper_done <= 1'b0;
        jtag_wrapper_counter <= (1'b0);
      end
      if(jtag_wrapper_ctrl_shift)begin
        if(_zz_10)begin
          jtag_wrapper_counter <= (jtag_wrapper_counter + (1'b1));
          jtag_wrapper_header <= jtag_wrapper_headerNext;
          if(_zz_11)begin
            jtag_wrapper_done <= 1'b1;
          end
        end
      end
    end
    _zz_4 <= (_zz_1 && _zz_2);
    _zz_5 <= jtag_wrapper_ctrl_tdi;
    if(1'b1)begin
      if(((jtag_wrapper_headerNext == (2'b01)) && jtag_wrapper_sendCapture))begin
        _zz_7 <= {{system_rsp_payload_data,system_rsp_payload_error},system_rsp_valid};
      end
      if((_zz_8 && jtag_wrapper_sendShift))begin
        _zz_7 <= ({jtag_wrapper_ctrl_tdi,_zz_7} >>> 1);
      end
    end
  end


endmodule

module VexRiscv (
  output              iBus_cmd_valid,
  input               iBus_cmd_ready,
  output     [31:0]   iBus_cmd_payload_pc,
  input               iBus_rsp_valid,
  input               iBus_rsp_payload_error,
  input      [31:0]   iBus_rsp_payload_inst,
  input               timerInterrupt,
  input               externalInterrupt,
  input               softwareInterrupt,
  input               debug_bus_cmd_valid,
  output reg          debug_bus_cmd_ready,
  input               debug_bus_cmd_payload_wr,
  input      [7:0]    debug_bus_cmd_payload_address,
  input      [31:0]   debug_bus_cmd_payload_data,
  output reg [31:0]   debug_bus_rsp_data,
  output              debug_resetOut,
  output              dBus_cmd_valid,
  input               dBus_cmd_ready,
  output              dBus_cmd_payload_wr,
  output     [31:0]   dBus_cmd_payload_address,
  output     [31:0]   dBus_cmd_payload_data,
  output     [1:0]    dBus_cmd_payload_size,
  input               dBus_rsp_ready,
  input               dBus_rsp_error,
  input      [31:0]   dBus_rsp_data,
  input               io_systemClk,
  input               systemCd_logic_outputReset,
  input               debugCd_logic_outputReset
);
  wire                _zz_165;
  wire                _zz_166;
  reg        [31:0]   _zz_167;
  reg        [31:0]   _zz_168;
  reg        [31:0]   _zz_169;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_push_ready;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_inst;
  wire       [0:0]    IBusSimplePlugin_rspJoin_rspBuffer_c_io_occupancy;
  wire                _zz_170;
  wire                _zz_171;
  wire                _zz_172;
  wire                _zz_173;
  wire                _zz_174;
  wire                _zz_175;
  wire                _zz_176;
  wire                _zz_177;
  wire                _zz_178;
  wire                _zz_179;
  wire                _zz_180;
  wire       [1:0]    _zz_181;
  wire                _zz_182;
  wire       [1:0]    _zz_183;
  wire                _zz_184;
  wire                _zz_185;
  wire                _zz_186;
  wire                _zz_187;
  wire                _zz_188;
  wire                _zz_189;
  wire                _zz_190;
  wire                _zz_191;
  wire                _zz_192;
  wire                _zz_193;
  wire       [5:0]    _zz_194;
  wire                _zz_195;
  wire                _zz_196;
  wire                _zz_197;
  wire                _zz_198;
  wire                _zz_199;
  wire                _zz_200;
  wire       [4:0]    _zz_201;
  wire       [1:0]    _zz_202;
  wire       [1:0]    _zz_203;
  wire       [1:0]    _zz_204;
  wire       [1:0]    _zz_205;
  wire                _zz_206;
  wire       [51:0]   _zz_207;
  wire       [51:0]   _zz_208;
  wire       [51:0]   _zz_209;
  wire       [32:0]   _zz_210;
  wire       [51:0]   _zz_211;
  wire       [49:0]   _zz_212;
  wire       [51:0]   _zz_213;
  wire       [49:0]   _zz_214;
  wire       [51:0]   _zz_215;
  wire       [32:0]   _zz_216;
  wire       [31:0]   _zz_217;
  wire       [32:0]   _zz_218;
  wire       [0:0]    _zz_219;
  wire       [0:0]    _zz_220;
  wire       [0:0]    _zz_221;
  wire       [0:0]    _zz_222;
  wire       [0:0]    _zz_223;
  wire       [0:0]    _zz_224;
  wire       [0:0]    _zz_225;
  wire       [0:0]    _zz_226;
  wire       [0:0]    _zz_227;
  wire       [0:0]    _zz_228;
  wire       [2:0]    _zz_229;
  wire       [31:0]   _zz_230;
  wire       [0:0]    _zz_231;
  wire       [0:0]    _zz_232;
  wire       [0:0]    _zz_233;
  wire       [0:0]    _zz_234;
  wire       [0:0]    _zz_235;
  wire       [0:0]    _zz_236;
  wire       [2:0]    _zz_237;
  wire       [2:0]    _zz_238;
  wire       [31:0]   _zz_239;
  wire       [2:0]    _zz_240;
  wire       [31:0]   _zz_241;
  wire       [31:0]   _zz_242;
  wire       [11:0]   _zz_243;
  wire       [11:0]   _zz_244;
  wire       [11:0]   _zz_245;
  wire       [31:0]   _zz_246;
  wire       [19:0]   _zz_247;
  wire       [11:0]   _zz_248;
  wire       [2:0]    _zz_249;
  wire       [0:0]    _zz_250;
  wire       [2:0]    _zz_251;
  wire       [0:0]    _zz_252;
  wire       [2:0]    _zz_253;
  wire       [0:0]    _zz_254;
  wire       [2:0]    _zz_255;
  wire       [0:0]    _zz_256;
  wire       [2:0]    _zz_257;
  wire       [0:0]    _zz_258;
  wire       [2:0]    _zz_259;
  wire       [4:0]    _zz_260;
  wire       [11:0]   _zz_261;
  wire       [11:0]   _zz_262;
  wire       [31:0]   _zz_263;
  wire       [31:0]   _zz_264;
  wire       [31:0]   _zz_265;
  wire       [31:0]   _zz_266;
  wire       [31:0]   _zz_267;
  wire       [31:0]   _zz_268;
  wire       [31:0]   _zz_269;
  wire       [65:0]   _zz_270;
  wire       [65:0]   _zz_271;
  wire       [31:0]   _zz_272;
  wire       [31:0]   _zz_273;
  wire       [0:0]    _zz_274;
  wire       [5:0]    _zz_275;
  wire       [32:0]   _zz_276;
  wire       [31:0]   _zz_277;
  wire       [31:0]   _zz_278;
  wire       [32:0]   _zz_279;
  wire       [32:0]   _zz_280;
  wire       [32:0]   _zz_281;
  wire       [32:0]   _zz_282;
  wire       [0:0]    _zz_283;
  wire       [32:0]   _zz_284;
  wire       [0:0]    _zz_285;
  wire       [32:0]   _zz_286;
  wire       [0:0]    _zz_287;
  wire       [31:0]   _zz_288;
  wire       [11:0]   _zz_289;
  wire       [19:0]   _zz_290;
  wire       [11:0]   _zz_291;
  wire       [2:0]    _zz_292;
  wire       [0:0]    _zz_293;
  wire       [0:0]    _zz_294;
  wire       [0:0]    _zz_295;
  wire       [0:0]    _zz_296;
  wire       [0:0]    _zz_297;
  wire       [0:0]    _zz_298;
  wire                _zz_299;
  wire                _zz_300;
  wire       [1:0]    _zz_301;
  wire       [31:0]   _zz_302;
  wire       [31:0]   _zz_303;
  wire       [31:0]   _zz_304;
  wire                _zz_305;
  wire       [0:0]    _zz_306;
  wire       [12:0]   _zz_307;
  wire       [31:0]   _zz_308;
  wire       [31:0]   _zz_309;
  wire       [31:0]   _zz_310;
  wire                _zz_311;
  wire       [0:0]    _zz_312;
  wire       [6:0]    _zz_313;
  wire       [31:0]   _zz_314;
  wire       [31:0]   _zz_315;
  wire       [31:0]   _zz_316;
  wire                _zz_317;
  wire       [0:0]    _zz_318;
  wire       [0:0]    _zz_319;
  wire                _zz_320;
  wire                _zz_321;
  wire       [6:0]    _zz_322;
  wire       [4:0]    _zz_323;
  wire                _zz_324;
  wire       [4:0]    _zz_325;
  wire       [0:0]    _zz_326;
  wire       [7:0]    _zz_327;
  wire                _zz_328;
  wire       [0:0]    _zz_329;
  wire       [0:0]    _zz_330;
  wire       [31:0]   _zz_331;
  wire       [31:0]   _zz_332;
  wire       [31:0]   _zz_333;
  wire                _zz_334;
  wire       [1:0]    _zz_335;
  wire       [1:0]    _zz_336;
  wire                _zz_337;
  wire       [0:0]    _zz_338;
  wire       [24:0]   _zz_339;
  wire       [31:0]   _zz_340;
  wire       [31:0]   _zz_341;
  wire       [31:0]   _zz_342;
  wire       [31:0]   _zz_343;
  wire                _zz_344;
  wire                _zz_345;
  wire       [3:0]    _zz_346;
  wire       [3:0]    _zz_347;
  wire                _zz_348;
  wire       [0:0]    _zz_349;
  wire       [21:0]   _zz_350;
  wire       [31:0]   _zz_351;
  wire       [31:0]   _zz_352;
  wire                _zz_353;
  wire       [0:0]    _zz_354;
  wire       [0:0]    _zz_355;
  wire       [0:0]    _zz_356;
  wire       [0:0]    _zz_357;
  wire                _zz_358;
  wire       [0:0]    _zz_359;
  wire       [18:0]   _zz_360;
  wire       [31:0]   _zz_361;
  wire       [31:0]   _zz_362;
  wire       [31:0]   _zz_363;
  wire       [31:0]   _zz_364;
  wire       [31:0]   _zz_365;
  wire       [0:0]    _zz_366;
  wire       [0:0]    _zz_367;
  wire       [2:0]    _zz_368;
  wire       [2:0]    _zz_369;
  wire                _zz_370;
  wire       [0:0]    _zz_371;
  wire       [15:0]   _zz_372;
  wire       [31:0]   _zz_373;
  wire       [31:0]   _zz_374;
  wire       [31:0]   _zz_375;
  wire       [31:0]   _zz_376;
  wire                _zz_377;
  wire                _zz_378;
  wire       [31:0]   _zz_379;
  wire       [31:0]   _zz_380;
  wire                _zz_381;
  wire       [0:0]    _zz_382;
  wire       [0:0]    _zz_383;
  wire                _zz_384;
  wire       [0:0]    _zz_385;
  wire       [12:0]   _zz_386;
  wire       [31:0]   _zz_387;
  wire                _zz_388;
  wire                _zz_389;
  wire                _zz_390;
  wire       [0:0]    _zz_391;
  wire       [0:0]    _zz_392;
  wire                _zz_393;
  wire       [0:0]    _zz_394;
  wire       [9:0]    _zz_395;
  wire       [31:0]   _zz_396;
  wire       [31:0]   _zz_397;
  wire       [31:0]   _zz_398;
  wire       [31:0]   _zz_399;
  wire       [31:0]   _zz_400;
  wire       [31:0]   _zz_401;
  wire       [0:0]    _zz_402;
  wire       [3:0]    _zz_403;
  wire       [4:0]    _zz_404;
  wire       [4:0]    _zz_405;
  wire                _zz_406;
  wire       [0:0]    _zz_407;
  wire       [5:0]    _zz_408;
  wire       [31:0]   _zz_409;
  wire                _zz_410;
  wire       [0:0]    _zz_411;
  wire       [0:0]    _zz_412;
  wire                _zz_413;
  wire       [0:0]    _zz_414;
  wire       [1:0]    _zz_415;
  wire       [0:0]    _zz_416;
  wire       [3:0]    _zz_417;
  wire       [0:0]    _zz_418;
  wire       [0:0]    _zz_419;
  wire       [1:0]    _zz_420;
  wire       [1:0]    _zz_421;
  wire                _zz_422;
  wire       [0:0]    _zz_423;
  wire       [2:0]    _zz_424;
  wire       [31:0]   _zz_425;
  wire       [31:0]   _zz_426;
  wire       [31:0]   _zz_427;
  wire       [31:0]   _zz_428;
  wire       [31:0]   _zz_429;
  wire       [31:0]   _zz_430;
  wire       [31:0]   _zz_431;
  wire       [31:0]   _zz_432;
  wire                _zz_433;
  wire                _zz_434;
  wire       [31:0]   _zz_435;
  wire       [31:0]   _zz_436;
  wire                _zz_437;
  wire       [0:0]    _zz_438;
  wire       [1:0]    _zz_439;
  wire       [31:0]   _zz_440;
  wire       [31:0]   _zz_441;
  wire                _zz_442;
  wire       [0:0]    _zz_443;
  wire       [2:0]    _zz_444;
  wire       [0:0]    _zz_445;
  wire       [0:0]    _zz_446;
  wire                _zz_447;
  wire       [0:0]    _zz_448;
  wire       [0:0]    _zz_449;
  wire       [31:0]   _zz_450;
  wire       [31:0]   _zz_451;
  wire       [31:0]   _zz_452;
  wire       [31:0]   _zz_453;
  wire       [31:0]   _zz_454;
  wire                _zz_455;
  wire                _zz_456;
  wire       [31:0]   _zz_457;
  wire       [31:0]   _zz_458;
  wire       [31:0]   _zz_459;
  wire                _zz_460;
  wire       [0:0]    _zz_461;
  wire       [0:0]    _zz_462;
  wire       [31:0]   _zz_463;
  wire       [31:0]   _zz_464;
  wire       [0:0]    _zz_465;
  wire       [1:0]    _zz_466;
  wire       [1:0]    _zz_467;
  wire       [1:0]    _zz_468;
  wire       [1:0]    _zz_469;
  wire       [1:0]    _zz_470;
  wire       [31:0]   _zz_471;
  wire       [31:0]   _zz_472;
  wire       [31:0]   _zz_473;
  wire       [31:0]   _zz_474;
  wire       [31:0]   _zz_475;
  wire       [31:0]   _zz_476;
  wire       [31:0]   _zz_477;
  wire       [31:0]   _zz_478;
  wire       [31:0]   _zz_479;
  wire       [31:0]   _zz_480;
  wire                _zz_481;
  wire                _zz_482;
  wire                _zz_483;
  wire       [51:0]   memory_MUL_LOW;
  wire       [31:0]   memory_MEMORY_READ_DATA;
  wire       [31:0]   execute_BRANCH_CALC;
  wire                execute_BRANCH_DO;
  wire       [33:0]   memory_MUL_HH;
  wire       [33:0]   execute_MUL_HH;
  wire       [33:0]   execute_MUL_HL;
  wire       [33:0]   execute_MUL_LH;
  wire       [31:0]   execute_MUL_LL;
  wire       [31:0]   execute_SHIFT_RIGHT;
  wire       [31:0]   writeBack_REGFILE_WRITE_DATA;
  wire       [31:0]   memory_REGFILE_WRITE_DATA;
  wire       [31:0]   execute_REGFILE_WRITE_DATA;
  wire       [1:0]    memory_MEMORY_ADDRESS_LOW;
  wire       [1:0]    execute_MEMORY_ADDRESS_LOW;
  wire                decode_DO_EBREAK;
  wire                decode_CSR_READ_OPCODE;
  wire                decode_CSR_WRITE_OPCODE;
  wire                decode_PREDICTION_HAD_BRANCHED2;
  wire       [31:0]   decode_SRC2;
  wire       [31:0]   decode_SRC1;
  wire                decode_SRC2_FORCE_ZERO;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_1;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_2;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_3;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_4;
  wire       `EnvCtrlEnum_defaultEncoding_type decode_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_5;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_6;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_7;
  wire                decode_IS_CSR;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_8;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_9;
  wire                decode_IS_RS2_SIGNED;
  wire                decode_IS_RS1_SIGNED;
  wire                decode_IS_DIV;
  wire                memory_IS_MUL;
  wire                execute_IS_MUL;
  wire                decode_IS_MUL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_10;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_11;
  wire       `ShiftCtrlEnum_defaultEncoding_type decode_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_12;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_13;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_14;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type decode_ALU_BITWISE_CTRL;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_15;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_16;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_17;
  wire                decode_SRC_LESS_UNSIGNED;
  wire       `AluCtrlEnum_defaultEncoding_type decode_ALU_CTRL;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_18;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_19;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_20;
  wire                decode_MEMORY_STORE;
  wire                execute_BYPASSABLE_MEMORY_STAGE;
  wire                decode_BYPASSABLE_MEMORY_STAGE;
  wire                decode_BYPASSABLE_EXECUTE_STAGE;
  wire                decode_MEMORY_ENABLE;
  wire       [31:0]   writeBack_FORMAL_PC_NEXT;
  wire       [31:0]   memory_FORMAL_PC_NEXT;
  wire       [31:0]   execute_FORMAL_PC_NEXT;
  wire       [31:0]   decode_FORMAL_PC_NEXT;
  wire       [31:0]   memory_PC;
  wire                execute_DO_EBREAK;
  wire                decode_IS_EBREAK;
  wire                execute_CSR_READ_OPCODE;
  wire                execute_CSR_WRITE_OPCODE;
  wire                execute_IS_CSR;
  wire       `EnvCtrlEnum_defaultEncoding_type memory_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_21;
  wire       `EnvCtrlEnum_defaultEncoding_type execute_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_22;
  wire       `EnvCtrlEnum_defaultEncoding_type writeBack_ENV_CTRL;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_23;
  wire       [31:0]   memory_BRANCH_CALC;
  wire                memory_BRANCH_DO;
  wire                execute_IS_RVC;
  wire       [31:0]   execute_PC;
  wire                execute_BRANCH_COND_RESULT;
  wire                execute_PREDICTION_HAD_BRANCHED2;
  wire       `BranchCtrlEnum_defaultEncoding_type execute_BRANCH_CTRL;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_24;
  wire                decode_RS2_USE;
  wire                decode_RS1_USE;
  reg        [31:0]   _zz_25;
  wire                execute_REGFILE_WRITE_VALID;
  wire                execute_BYPASSABLE_EXECUTE_STAGE;
  wire                memory_REGFILE_WRITE_VALID;
  wire                memory_BYPASSABLE_MEMORY_STAGE;
  wire                writeBack_REGFILE_WRITE_VALID;
  reg        [31:0]   decode_RS2;
  reg        [31:0]   decode_RS1;
  wire                execute_IS_RS1_SIGNED;
  wire                execute_IS_DIV;
  wire                execute_IS_RS2_SIGNED;
  wire       [31:0]   memory_INSTRUCTION;
  wire                memory_IS_DIV;
  wire                writeBack_IS_MUL;
  wire       [33:0]   writeBack_MUL_HH;
  wire       [51:0]   writeBack_MUL_LOW;
  wire       [33:0]   memory_MUL_HL;
  wire       [33:0]   memory_MUL_LH;
  wire       [31:0]   memory_MUL_LL;
  (* keep , syn_keep *) wire       [31:0]   execute_RS1 /* synthesis syn_keep = 1 */ ;
  wire       [31:0]   memory_SHIFT_RIGHT;
  reg        [31:0]   _zz_26;
  wire       `ShiftCtrlEnum_defaultEncoding_type memory_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_27;
  wire       `ShiftCtrlEnum_defaultEncoding_type execute_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_28;
  wire                execute_SRC_LESS_UNSIGNED;
  wire                execute_SRC2_FORCE_ZERO;
  wire                execute_SRC_USE_SUB_LESS;
  wire       [31:0]   _zz_29;
  wire       [31:0]   _zz_30;
  wire       `Src2CtrlEnum_defaultEncoding_type decode_SRC2_CTRL;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_31;
  wire       [31:0]   _zz_32;
  wire       `Src1CtrlEnum_defaultEncoding_type decode_SRC1_CTRL;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_33;
  wire                decode_SRC_USE_SUB_LESS;
  wire                decode_SRC_ADD_ZERO;
  wire       [31:0]   execute_SRC_ADD_SUB;
  wire                execute_SRC_LESS;
  wire       `AluCtrlEnum_defaultEncoding_type execute_ALU_CTRL;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_34;
  wire       [31:0]   execute_SRC2;
  wire       [31:0]   execute_SRC1;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type execute_ALU_BITWISE_CTRL;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_35;
  wire       [31:0]   _zz_36;
  wire                _zz_37;
  reg                 _zz_38;
  wire       [31:0]   decode_INSTRUCTION_ANTICIPATED;
  reg                 decode_REGFILE_WRITE_VALID;
  wire                decode_LEGAL_INSTRUCTION;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_39;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_40;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_41;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_42;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_43;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_44;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_45;
  wire                writeBack_MEMORY_STORE;
  reg        [31:0]   _zz_46;
  wire                writeBack_MEMORY_ENABLE;
  wire       [1:0]    writeBack_MEMORY_ADDRESS_LOW;
  wire       [31:0]   writeBack_MEMORY_READ_DATA;
  wire                memory_MEMORY_STORE;
  wire                memory_MEMORY_ENABLE;
  wire       [31:0]   execute_SRC_ADD;
  (* keep , syn_keep *) wire       [31:0]   execute_RS2 /* synthesis syn_keep = 1 */ ;
  wire       [31:0]   execute_INSTRUCTION;
  wire                execute_MEMORY_STORE;
  wire                execute_MEMORY_ENABLE;
  wire                execute_ALIGNEMENT_FAULT;
  wire       `BranchCtrlEnum_defaultEncoding_type decode_BRANCH_CTRL;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_47;
  reg        [31:0]   _zz_48;
  reg        [31:0]   _zz_49;
  wire       [31:0]   decode_PC;
  wire       [31:0]   decode_INSTRUCTION;
  wire                decode_IS_RVC;
  wire       [31:0]   writeBack_PC;
  wire       [31:0]   writeBack_INSTRUCTION;
  reg                 decode_arbitration_haltItself;
  reg                 decode_arbitration_haltByOther;
  reg                 decode_arbitration_removeIt;
  wire                decode_arbitration_flushIt;
  reg                 decode_arbitration_flushNext;
  reg                 decode_arbitration_isValid;
  wire                decode_arbitration_isStuck;
  wire                decode_arbitration_isStuckByOthers;
  wire                decode_arbitration_isFlushed;
  wire                decode_arbitration_isMoving;
  wire                decode_arbitration_isFiring;
  reg                 execute_arbitration_haltItself;
  reg                 execute_arbitration_haltByOther;
  reg                 execute_arbitration_removeIt;
  reg                 execute_arbitration_flushIt;
  reg                 execute_arbitration_flushNext;
  reg                 execute_arbitration_isValid;
  wire                execute_arbitration_isStuck;
  wire                execute_arbitration_isStuckByOthers;
  wire                execute_arbitration_isFlushed;
  wire                execute_arbitration_isMoving;
  wire                execute_arbitration_isFiring;
  reg                 memory_arbitration_haltItself;
  wire                memory_arbitration_haltByOther;
  reg                 memory_arbitration_removeIt;
  wire                memory_arbitration_flushIt;
  reg                 memory_arbitration_flushNext;
  reg                 memory_arbitration_isValid;
  wire                memory_arbitration_isStuck;
  wire                memory_arbitration_isStuckByOthers;
  wire                memory_arbitration_isFlushed;
  wire                memory_arbitration_isMoving;
  wire                memory_arbitration_isFiring;
  wire                writeBack_arbitration_haltItself;
  wire                writeBack_arbitration_haltByOther;
  reg                 writeBack_arbitration_removeIt;
  wire                writeBack_arbitration_flushIt;
  reg                 writeBack_arbitration_flushNext;
  reg                 writeBack_arbitration_isValid;
  wire                writeBack_arbitration_isStuck;
  wire                writeBack_arbitration_isStuckByOthers;
  wire                writeBack_arbitration_isFlushed;
  wire                writeBack_arbitration_isMoving;
  wire                writeBack_arbitration_isFiring;
  wire       [31:0]   lastStageInstruction /* verilator public */ ;
  wire       [31:0]   lastStagePc /* verilator public */ ;
  wire                lastStageIsValid /* verilator public */ ;
  wire                lastStageIsFiring /* verilator public */ ;
  reg                 IBusSimplePlugin_fetcherHalt;
  reg                 IBusSimplePlugin_incomingInstruction;
  wire                IBusSimplePlugin_predictionJumpInterface_valid;
  (* keep , syn_keep *) wire       [31:0]   IBusSimplePlugin_predictionJumpInterface_payload /* synthesis syn_keep = 1 */ ;
  wire                IBusSimplePlugin_decodePrediction_cmd_hadBranch;
  wire                IBusSimplePlugin_decodePrediction_rsp_wasWrong;
  wire                IBusSimplePlugin_pcValids_0;
  wire                IBusSimplePlugin_pcValids_1;
  wire                IBusSimplePlugin_pcValids_2;
  wire                IBusSimplePlugin_pcValids_3;
  wire                decodeExceptionPort_valid;
  wire       [3:0]    decodeExceptionPort_payload_code;
  wire       [31:0]   decodeExceptionPort_payload_badAddr;
  wire                BranchPlugin_jumpInterface_valid;
  wire       [31:0]   BranchPlugin_jumpInterface_payload;
  wire                CsrPlugin_inWfi /* verilator public */ ;
  reg                 CsrPlugin_thirdPartyWake;
  reg                 CsrPlugin_jumpInterface_valid;
  reg        [31:0]   CsrPlugin_jumpInterface_payload;
  wire                CsrPlugin_exceptionPendings_0;
  wire                CsrPlugin_exceptionPendings_1;
  wire                CsrPlugin_exceptionPendings_2;
  wire                CsrPlugin_exceptionPendings_3;
  wire                contextSwitching;
  reg        [1:0]    CsrPlugin_privilege;
  reg                 CsrPlugin_forceMachineWire;
  reg                 CsrPlugin_selfException_valid;
  reg        [3:0]    CsrPlugin_selfException_payload_code;
  wire       [31:0]   CsrPlugin_selfException_payload_badAddr;
  reg                 CsrPlugin_allowInterrupts;
  reg                 CsrPlugin_allowException;
  reg                 IBusSimplePlugin_injectionPort_valid;
  reg                 IBusSimplePlugin_injectionPort_ready;
  wire       [31:0]   IBusSimplePlugin_injectionPort_payload;
  wire                IBusSimplePlugin_externalFlush;
  wire                IBusSimplePlugin_jump_pcLoad_valid;
  wire       [31:0]   IBusSimplePlugin_jump_pcLoad_payload;
  wire       [2:0]    _zz_50;
  wire       [2:0]    _zz_51;
  wire                _zz_52;
  wire                _zz_53;
  wire                IBusSimplePlugin_fetchPc_output_valid;
  wire                IBusSimplePlugin_fetchPc_output_ready;
  wire       [31:0]   IBusSimplePlugin_fetchPc_output_payload;
  reg        [31:0]   IBusSimplePlugin_fetchPc_pcReg /* verilator public */ ;
  reg                 IBusSimplePlugin_fetchPc_correction;
  reg                 IBusSimplePlugin_fetchPc_correctionReg;
  wire                IBusSimplePlugin_fetchPc_corrected;
  reg                 IBusSimplePlugin_fetchPc_pcRegPropagate;
  reg                 IBusSimplePlugin_fetchPc_booted;
  reg                 IBusSimplePlugin_fetchPc_inc;
  reg        [31:0]   IBusSimplePlugin_fetchPc_pc;
  reg                 IBusSimplePlugin_fetchPc_flushed;
  reg                 IBusSimplePlugin_decodePc_flushed;
  reg        [31:0]   IBusSimplePlugin_decodePc_pcReg /* verilator public */ ;
  wire       [31:0]   IBusSimplePlugin_decodePc_pcPlus;
  reg                 IBusSimplePlugin_decodePc_injectedDecode;
  wire                IBusSimplePlugin_iBusRsp_redoFetch;
  wire                IBusSimplePlugin_iBusRsp_stages_0_input_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_0_input_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_0_input_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_0_output_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_0_output_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_0_output_payload;
  reg                 IBusSimplePlugin_iBusRsp_stages_0_halt;
  wire                IBusSimplePlugin_iBusRsp_stages_1_input_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_1_input_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_1_input_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_1_output_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_1_output_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_1_output_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_1_halt;
  wire                _zz_54;
  wire                _zz_55;
  wire                IBusSimplePlugin_iBusRsp_flush;
  wire                _zz_56;
  wire                _zz_57;
  reg                 _zz_58;
  reg                 IBusSimplePlugin_iBusRsp_readyForError;
  wire                IBusSimplePlugin_iBusRsp_output_valid;
  wire                IBusSimplePlugin_iBusRsp_output_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_output_payload_pc;
  wire                IBusSimplePlugin_iBusRsp_output_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_output_payload_rsp_inst;
  wire                IBusSimplePlugin_iBusRsp_output_payload_isRvc;
  wire                IBusSimplePlugin_decompressor_input_valid;
  wire                IBusSimplePlugin_decompressor_input_ready;
  wire       [31:0]   IBusSimplePlugin_decompressor_input_payload_pc;
  wire                IBusSimplePlugin_decompressor_input_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_decompressor_input_payload_rsp_inst;
  wire                IBusSimplePlugin_decompressor_input_payload_isRvc;
  wire                IBusSimplePlugin_decompressor_output_valid;
  wire                IBusSimplePlugin_decompressor_output_ready;
  wire       [31:0]   IBusSimplePlugin_decompressor_output_payload_pc;
  wire                IBusSimplePlugin_decompressor_output_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_decompressor_output_payload_rsp_inst;
  wire                IBusSimplePlugin_decompressor_output_payload_isRvc;
  wire                IBusSimplePlugin_decompressor_flushNext;
  wire                IBusSimplePlugin_decompressor_consumeCurrent;
  reg                 IBusSimplePlugin_decompressor_bufferValid;
  reg        [15:0]   IBusSimplePlugin_decompressor_bufferData;
  wire                IBusSimplePlugin_decompressor_isInputLowRvc;
  wire                IBusSimplePlugin_decompressor_isInputHighRvc;
  reg                 IBusSimplePlugin_decompressor_throw2BytesReg;
  wire                IBusSimplePlugin_decompressor_throw2Bytes;
  wire                IBusSimplePlugin_decompressor_unaligned;
  wire       [31:0]   IBusSimplePlugin_decompressor_raw;
  wire                IBusSimplePlugin_decompressor_isRvc;
  wire       [15:0]   _zz_59;
  reg        [31:0]   IBusSimplePlugin_decompressor_decompressed;
  wire       [4:0]    _zz_60;
  wire       [4:0]    _zz_61;
  wire       [11:0]   _zz_62;
  wire                _zz_63;
  reg        [11:0]   _zz_64;
  wire                _zz_65;
  reg        [9:0]    _zz_66;
  wire       [20:0]   _zz_67;
  wire                _zz_68;
  reg        [14:0]   _zz_69;
  wire                _zz_70;
  reg        [2:0]    _zz_71;
  wire                _zz_72;
  reg        [9:0]    _zz_73;
  wire       [20:0]   _zz_74;
  wire                _zz_75;
  reg        [4:0]    _zz_76;
  wire       [12:0]   _zz_77;
  wire       [4:0]    _zz_78;
  wire       [4:0]    _zz_79;
  wire       [4:0]    _zz_80;
  wire                _zz_81;
  reg        [2:0]    _zz_82;
  reg        [2:0]    _zz_83;
  wire                _zz_84;
  reg        [6:0]    _zz_85;
  wire                IBusSimplePlugin_decompressor_bufferFill;
  wire                IBusSimplePlugin_injector_decodeInput_valid;
  wire                IBusSimplePlugin_injector_decodeInput_ready;
  wire       [31:0]   IBusSimplePlugin_injector_decodeInput_payload_pc;
  wire                IBusSimplePlugin_injector_decodeInput_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_injector_decodeInput_payload_rsp_inst;
  wire                IBusSimplePlugin_injector_decodeInput_payload_isRvc;
  reg                 _zz_86;
  reg        [31:0]   _zz_87;
  reg                 _zz_88;
  reg        [31:0]   _zz_89;
  reg                 _zz_90;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_0;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_1;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_2;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_3;
  reg        [31:0]   IBusSimplePlugin_injector_formal_rawInDecode;
  wire                _zz_91;
  reg        [18:0]   _zz_92;
  wire                _zz_93;
  reg        [10:0]   _zz_94;
  wire                _zz_95;
  reg        [18:0]   _zz_96;
  wire                IBusSimplePlugin_cmd_valid;
  wire                IBusSimplePlugin_cmd_ready;
  wire       [31:0]   IBusSimplePlugin_cmd_payload_pc;
  wire                IBusSimplePlugin_cmd_s2mPipe_valid;
  wire                IBusSimplePlugin_cmd_s2mPipe_ready;
  wire       [31:0]   IBusSimplePlugin_cmd_s2mPipe_payload_pc;
  reg                 IBusSimplePlugin_cmd_s2mPipe_rValid;
  reg        [31:0]   IBusSimplePlugin_cmd_s2mPipe_rData_pc;
  wire                IBusSimplePlugin_pending_inc;
  wire                IBusSimplePlugin_pending_dec;
  reg        [2:0]    IBusSimplePlugin_pending_value;
  wire       [2:0]    IBusSimplePlugin_pending_next;
  wire                IBusSimplePlugin_cmdFork_canEmit;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_output_valid;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_output_ready;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_output_payload_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_rspBuffer_output_payload_inst;
  reg        [2:0]    IBusSimplePlugin_rspJoin_rspBuffer_discardCounter;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_flush;
  wire       [31:0]   IBusSimplePlugin_rspJoin_fetchRsp_pc;
  reg                 IBusSimplePlugin_rspJoin_fetchRsp_rsp_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst;
  wire                IBusSimplePlugin_rspJoin_fetchRsp_isRvc;
  wire                IBusSimplePlugin_rspJoin_join_valid;
  wire                IBusSimplePlugin_rspJoin_join_ready;
  wire       [31:0]   IBusSimplePlugin_rspJoin_join_payload_pc;
  wire                IBusSimplePlugin_rspJoin_join_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_join_payload_rsp_inst;
  wire                IBusSimplePlugin_rspJoin_join_payload_isRvc;
  wire                IBusSimplePlugin_rspJoin_exceptionDetected;
  wire                _zz_97;
  wire                _zz_98;
  reg                 execute_DBusSimplePlugin_skipCmd;
  reg        [31:0]   _zz_99;
  reg        [3:0]    _zz_100;
  wire       [3:0]    execute_DBusSimplePlugin_formalMask;
  reg        [31:0]   writeBack_DBusSimplePlugin_rspShifted;
  wire                _zz_101;
  reg        [31:0]   _zz_102;
  wire                _zz_103;
  reg        [31:0]   _zz_104;
  reg        [31:0]   writeBack_DBusSimplePlugin_rspFormated;
  wire       [30:0]   _zz_105;
  wire                _zz_106;
  wire                _zz_107;
  wire                _zz_108;
  wire                _zz_109;
  wire                _zz_110;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_111;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_112;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_113;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_114;
  wire       `ShiftCtrlEnum_defaultEncoding_type _zz_115;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_116;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_117;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress1;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress2;
  wire       [31:0]   decode_RegFilePlugin_rs1Data;
  wire       [31:0]   decode_RegFilePlugin_rs2Data;
  reg                 lastStageRegFileWrite_valid /* verilator public */ ;
  wire       [4:0]    lastStageRegFileWrite_payload_address /* verilator public */ ;
  wire       [31:0]   lastStageRegFileWrite_payload_data /* verilator public */ ;
  reg        [31:0]   execute_IntAluPlugin_bitwise;
  reg        [31:0]   _zz_118;
  reg        [31:0]   _zz_119;
  wire                _zz_120;
  reg        [19:0]   _zz_121;
  wire                _zz_122;
  reg        [19:0]   _zz_123;
  reg        [31:0]   _zz_124;
  reg        [31:0]   execute_SrcPlugin_addSub;
  wire                execute_SrcPlugin_less;
  wire       [4:0]    execute_FullBarrelShifterPlugin_amplitude;
  reg        [31:0]   _zz_125;
  wire       [31:0]   execute_FullBarrelShifterPlugin_reversed;
  reg        [31:0]   _zz_126;
  reg                 execute_MulPlugin_aSigned;
  reg                 execute_MulPlugin_bSigned;
  wire       [31:0]   execute_MulPlugin_a;
  wire       [31:0]   execute_MulPlugin_b;
  wire       [15:0]   execute_MulPlugin_aULow;
  wire       [15:0]   execute_MulPlugin_bULow;
  wire       [16:0]   execute_MulPlugin_aSLow;
  wire       [16:0]   execute_MulPlugin_bSLow;
  wire       [16:0]   execute_MulPlugin_aHigh;
  wire       [16:0]   execute_MulPlugin_bHigh;
  wire       [65:0]   writeBack_MulPlugin_result;
  reg        [32:0]   memory_DivPlugin_rs1;
  reg        [31:0]   memory_DivPlugin_rs2;
  reg        [64:0]   memory_DivPlugin_accumulator;
  wire                memory_DivPlugin_frontendOk;
  reg                 memory_DivPlugin_div_needRevert;
  reg                 memory_DivPlugin_div_counter_willIncrement;
  reg                 memory_DivPlugin_div_counter_willClear;
  reg        [5:0]    memory_DivPlugin_div_counter_valueNext;
  reg        [5:0]    memory_DivPlugin_div_counter_value;
  wire                memory_DivPlugin_div_counter_willOverflowIfInc;
  wire                memory_DivPlugin_div_counter_willOverflow;
  reg                 memory_DivPlugin_div_done;
  reg        [31:0]   memory_DivPlugin_div_result;
  wire       [31:0]   _zz_127;
  wire       [32:0]   memory_DivPlugin_div_stage_0_remainderShifted;
  wire       [32:0]   memory_DivPlugin_div_stage_0_remainderMinusDenominator;
  wire       [31:0]   memory_DivPlugin_div_stage_0_outRemainder;
  wire       [31:0]   memory_DivPlugin_div_stage_0_outNumerator;
  wire       [31:0]   _zz_128;
  wire                _zz_129;
  wire                _zz_130;
  reg        [32:0]   _zz_131;
  reg                 _zz_132;
  reg                 _zz_133;
  reg                 _zz_134;
  reg        [4:0]    _zz_135;
  reg        [31:0]   _zz_136;
  wire                _zz_137;
  wire                _zz_138;
  wire                _zz_139;
  wire                _zz_140;
  wire                _zz_141;
  wire                _zz_142;
  wire                execute_BranchPlugin_eq;
  wire       [2:0]    _zz_143;
  reg                 _zz_144;
  reg                 _zz_145;
  wire                execute_BranchPlugin_missAlignedTarget;
  reg        [31:0]   execute_BranchPlugin_branch_src1;
  reg        [31:0]   execute_BranchPlugin_branch_src2;
  wire                _zz_146;
  reg        [19:0]   _zz_147;
  wire                _zz_148;
  reg        [10:0]   _zz_149;
  wire                _zz_150;
  reg        [18:0]   _zz_151;
  wire       [31:0]   execute_BranchPlugin_branchAdder;
  wire       [1:0]    CsrPlugin_misa_base;
  wire       [25:0]   CsrPlugin_misa_extensions;
  reg        [1:0]    CsrPlugin_mtvec_mode;
  reg        [29:0]   CsrPlugin_mtvec_base;
  reg        [31:0]   CsrPlugin_mepc;
  reg                 CsrPlugin_mstatus_MIE;
  reg                 CsrPlugin_mstatus_MPIE;
  reg        [1:0]    CsrPlugin_mstatus_MPP;
  reg                 CsrPlugin_mip_MEIP;
  reg                 CsrPlugin_mip_MTIP;
  reg                 CsrPlugin_mip_MSIP;
  reg                 CsrPlugin_mie_MEIE;
  reg                 CsrPlugin_mie_MTIE;
  reg                 CsrPlugin_mie_MSIE;
  reg                 CsrPlugin_mcause_interrupt;
  reg        [3:0]    CsrPlugin_mcause_exceptionCode;
  reg        [31:0]   CsrPlugin_mtval;
  reg        [63:0]   CsrPlugin_mcycle = 64'b0000000000000000000000000000000000000000000000000000000000000000;
  reg        [63:0]   CsrPlugin_minstret = 64'b0000000000000000000000000000000000000000000000000000000000000000;
  wire                _zz_152;
  wire                _zz_153;
  wire                _zz_154;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_decode;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_execute;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_memory;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
  reg                 CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
  reg        [3:0]    CsrPlugin_exceptionPortCtrl_exceptionContext_code;
  reg        [31:0]   CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr;
  wire       [1:0]    CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped;
  wire       [1:0]    CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege;
  reg                 CsrPlugin_interrupt_valid;
  reg        [3:0]    CsrPlugin_interrupt_code /* verilator public */ ;
  reg        [1:0]    CsrPlugin_interrupt_targetPrivilege;
  wire                CsrPlugin_exception;
  wire                CsrPlugin_lastStageWasWfi;
  reg                 CsrPlugin_pipelineLiberator_pcValids_0;
  reg                 CsrPlugin_pipelineLiberator_pcValids_1;
  reg                 CsrPlugin_pipelineLiberator_pcValids_2;
  wire                CsrPlugin_pipelineLiberator_active;
  reg                 CsrPlugin_pipelineLiberator_done;
  wire                CsrPlugin_interruptJump /* verilator public */ ;
  reg                 CsrPlugin_hadException;
  reg        [1:0]    CsrPlugin_targetPrivilege;
  reg        [3:0]    CsrPlugin_trapCause;
  reg        [1:0]    CsrPlugin_xtvec_mode;
  reg        [29:0]   CsrPlugin_xtvec_base;
  reg                 execute_CsrPlugin_wfiWake;
  wire                execute_CsrPlugin_blockedBySideEffects;
  reg                 execute_CsrPlugin_illegalAccess;
  reg                 execute_CsrPlugin_illegalInstruction;
  wire       [31:0]   execute_CsrPlugin_readData;
  wire                execute_CsrPlugin_writeInstruction;
  wire                execute_CsrPlugin_readInstruction;
  wire                execute_CsrPlugin_writeEnable;
  wire                execute_CsrPlugin_readEnable;
  wire       [31:0]   execute_CsrPlugin_readToWriteData;
  reg        [31:0]   execute_CsrPlugin_writeData;
  wire       [11:0]   execute_CsrPlugin_csrAddress;
  reg                 DebugPlugin_firstCycle;
  reg                 DebugPlugin_secondCycle;
  reg                 DebugPlugin_resetIt;
  reg                 DebugPlugin_haltIt;
  reg                 DebugPlugin_stepIt;
  reg                 DebugPlugin_isPipBusy;
  reg                 DebugPlugin_godmode;
  reg                 DebugPlugin_haltedByBreak;
  reg        [31:0]   DebugPlugin_busReadDataReg;
  reg                 _zz_155;
  reg                 _zz_156;
  reg                 DebugPlugin_resetIt_regNext;
  reg        [31:0]   decode_to_execute_PC;
  reg        [31:0]   execute_to_memory_PC;
  reg        [31:0]   memory_to_writeBack_PC;
  reg        [31:0]   decode_to_execute_INSTRUCTION;
  reg        [31:0]   execute_to_memory_INSTRUCTION;
  reg        [31:0]   memory_to_writeBack_INSTRUCTION;
  reg                 decode_to_execute_IS_RVC;
  reg        [31:0]   decode_to_execute_FORMAL_PC_NEXT;
  reg        [31:0]   execute_to_memory_FORMAL_PC_NEXT;
  reg        [31:0]   memory_to_writeBack_FORMAL_PC_NEXT;
  reg                 decode_to_execute_SRC_USE_SUB_LESS;
  reg                 decode_to_execute_MEMORY_ENABLE;
  reg                 execute_to_memory_MEMORY_ENABLE;
  reg                 memory_to_writeBack_MEMORY_ENABLE;
  reg                 decode_to_execute_REGFILE_WRITE_VALID;
  reg                 execute_to_memory_REGFILE_WRITE_VALID;
  reg                 memory_to_writeBack_REGFILE_WRITE_VALID;
  reg                 decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  reg                 decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  reg                 execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  reg                 decode_to_execute_MEMORY_STORE;
  reg                 execute_to_memory_MEMORY_STORE;
  reg                 memory_to_writeBack_MEMORY_STORE;
  reg        `AluCtrlEnum_defaultEncoding_type decode_to_execute_ALU_CTRL;
  reg                 decode_to_execute_SRC_LESS_UNSIGNED;
  reg        `AluBitwiseCtrlEnum_defaultEncoding_type decode_to_execute_ALU_BITWISE_CTRL;
  reg        `ShiftCtrlEnum_defaultEncoding_type decode_to_execute_SHIFT_CTRL;
  reg        `ShiftCtrlEnum_defaultEncoding_type execute_to_memory_SHIFT_CTRL;
  reg                 decode_to_execute_IS_MUL;
  reg                 execute_to_memory_IS_MUL;
  reg                 memory_to_writeBack_IS_MUL;
  reg                 decode_to_execute_IS_DIV;
  reg                 execute_to_memory_IS_DIV;
  reg                 decode_to_execute_IS_RS1_SIGNED;
  reg                 decode_to_execute_IS_RS2_SIGNED;
  reg        `BranchCtrlEnum_defaultEncoding_type decode_to_execute_BRANCH_CTRL;
  reg                 decode_to_execute_IS_CSR;
  reg        `EnvCtrlEnum_defaultEncoding_type decode_to_execute_ENV_CTRL;
  reg        `EnvCtrlEnum_defaultEncoding_type execute_to_memory_ENV_CTRL;
  reg        `EnvCtrlEnum_defaultEncoding_type memory_to_writeBack_ENV_CTRL;
  reg        [31:0]   decode_to_execute_RS1;
  reg        [31:0]   decode_to_execute_RS2;
  reg                 decode_to_execute_SRC2_FORCE_ZERO;
  reg        [31:0]   decode_to_execute_SRC1;
  reg        [31:0]   decode_to_execute_SRC2;
  reg                 decode_to_execute_PREDICTION_HAD_BRANCHED2;
  reg                 decode_to_execute_CSR_WRITE_OPCODE;
  reg                 decode_to_execute_CSR_READ_OPCODE;
  reg                 decode_to_execute_DO_EBREAK;
  reg        [1:0]    execute_to_memory_MEMORY_ADDRESS_LOW;
  reg        [1:0]    memory_to_writeBack_MEMORY_ADDRESS_LOW;
  reg        [31:0]   execute_to_memory_REGFILE_WRITE_DATA;
  reg        [31:0]   memory_to_writeBack_REGFILE_WRITE_DATA;
  reg        [31:0]   execute_to_memory_SHIFT_RIGHT;
  reg        [31:0]   execute_to_memory_MUL_LL;
  reg        [33:0]   execute_to_memory_MUL_LH;
  reg        [33:0]   execute_to_memory_MUL_HL;
  reg        [33:0]   execute_to_memory_MUL_HH;
  reg        [33:0]   memory_to_writeBack_MUL_HH;
  reg                 execute_to_memory_BRANCH_DO;
  reg        [31:0]   execute_to_memory_BRANCH_CALC;
  reg        [31:0]   memory_to_writeBack_MEMORY_READ_DATA;
  reg        [51:0]   memory_to_writeBack_MUL_LOW;
  reg        [2:0]    _zz_157;
  reg                 execute_CsrPlugin_csr_3860;
  reg                 execute_CsrPlugin_csr_768;
  reg                 execute_CsrPlugin_csr_836;
  reg                 execute_CsrPlugin_csr_772;
  reg                 execute_CsrPlugin_csr_773;
  reg                 execute_CsrPlugin_csr_833;
  reg                 execute_CsrPlugin_csr_834;
  reg                 execute_CsrPlugin_csr_835;
  reg        [31:0]   _zz_158;
  reg        [31:0]   _zz_159;
  reg        [31:0]   _zz_160;
  reg        [31:0]   _zz_161;
  reg        [31:0]   _zz_162;
  reg        [31:0]   _zz_163;
  reg        [31:0]   _zz_164;
  `ifndef SYNTHESIS
  reg [39:0] _zz_1_string;
  reg [39:0] _zz_2_string;
  reg [39:0] _zz_3_string;
  reg [39:0] _zz_4_string;
  reg [39:0] decode_ENV_CTRL_string;
  reg [39:0] _zz_5_string;
  reg [39:0] _zz_6_string;
  reg [39:0] _zz_7_string;
  reg [31:0] _zz_8_string;
  reg [31:0] _zz_9_string;
  reg [71:0] _zz_10_string;
  reg [71:0] _zz_11_string;
  reg [71:0] decode_SHIFT_CTRL_string;
  reg [71:0] _zz_12_string;
  reg [71:0] _zz_13_string;
  reg [71:0] _zz_14_string;
  reg [39:0] decode_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_15_string;
  reg [39:0] _zz_16_string;
  reg [39:0] _zz_17_string;
  reg [63:0] decode_ALU_CTRL_string;
  reg [63:0] _zz_18_string;
  reg [63:0] _zz_19_string;
  reg [63:0] _zz_20_string;
  reg [39:0] memory_ENV_CTRL_string;
  reg [39:0] _zz_21_string;
  reg [39:0] execute_ENV_CTRL_string;
  reg [39:0] _zz_22_string;
  reg [39:0] writeBack_ENV_CTRL_string;
  reg [39:0] _zz_23_string;
  reg [31:0] execute_BRANCH_CTRL_string;
  reg [31:0] _zz_24_string;
  reg [71:0] memory_SHIFT_CTRL_string;
  reg [71:0] _zz_27_string;
  reg [71:0] execute_SHIFT_CTRL_string;
  reg [71:0] _zz_28_string;
  reg [23:0] decode_SRC2_CTRL_string;
  reg [23:0] _zz_31_string;
  reg [95:0] decode_SRC1_CTRL_string;
  reg [95:0] _zz_33_string;
  reg [63:0] execute_ALU_CTRL_string;
  reg [63:0] _zz_34_string;
  reg [39:0] execute_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_35_string;
  reg [39:0] _zz_39_string;
  reg [31:0] _zz_40_string;
  reg [71:0] _zz_41_string;
  reg [39:0] _zz_42_string;
  reg [63:0] _zz_43_string;
  reg [23:0] _zz_44_string;
  reg [95:0] _zz_45_string;
  reg [31:0] decode_BRANCH_CTRL_string;
  reg [31:0] _zz_47_string;
  reg [95:0] _zz_111_string;
  reg [23:0] _zz_112_string;
  reg [63:0] _zz_113_string;
  reg [39:0] _zz_114_string;
  reg [71:0] _zz_115_string;
  reg [31:0] _zz_116_string;
  reg [39:0] _zz_117_string;
  reg [63:0] decode_to_execute_ALU_CTRL_string;
  reg [39:0] decode_to_execute_ALU_BITWISE_CTRL_string;
  reg [71:0] decode_to_execute_SHIFT_CTRL_string;
  reg [71:0] execute_to_memory_SHIFT_CTRL_string;
  reg [31:0] decode_to_execute_BRANCH_CTRL_string;
  reg [39:0] decode_to_execute_ENV_CTRL_string;
  reg [39:0] execute_to_memory_ENV_CTRL_string;
  reg [39:0] memory_to_writeBack_ENV_CTRL_string;
  `endif

  reg [31:0] RegFilePlugin_regFile [0:31] /* verilator public */ ;

  assign _zz_170 = (execute_arbitration_isValid && execute_IS_CSR);
  assign _zz_171 = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign _zz_172 = 1'b1;
  assign _zz_173 = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign _zz_174 = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign _zz_175 = (memory_arbitration_isValid && memory_IS_DIV);
  assign _zz_176 = (execute_arbitration_isValid && execute_DO_EBREAK);
  assign _zz_177 = (({writeBack_arbitration_isValid,memory_arbitration_isValid} != (2'b00)) == 1'b0);
  assign _zz_178 = (CsrPlugin_hadException || CsrPlugin_interruptJump);
  assign _zz_179 = (writeBack_arbitration_isValid && (writeBack_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET));
  assign _zz_180 = (DebugPlugin_stepIt && IBusSimplePlugin_incomingInstruction);
  assign _zz_181 = writeBack_INSTRUCTION[29 : 28];
  assign _zz_182 = (IBusSimplePlugin_jump_pcLoad_valid && ((! decode_arbitration_isStuck) || decode_arbitration_removeIt));
  assign _zz_183 = execute_INSTRUCTION[13 : 12];
  assign _zz_184 = (memory_DivPlugin_frontendOk && (! memory_DivPlugin_div_done));
  assign _zz_185 = (! memory_arbitration_isStuck);
  assign _zz_186 = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign _zz_187 = (1'b0 || (! 1'b1));
  assign _zz_188 = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign _zz_189 = (1'b0 || (! memory_BYPASSABLE_MEMORY_STAGE));
  assign _zz_190 = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign _zz_191 = (1'b0 || (! execute_BYPASSABLE_EXECUTE_STAGE));
  assign _zz_192 = (execute_CsrPlugin_illegalAccess || execute_CsrPlugin_illegalInstruction);
  assign _zz_193 = (execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_ECALL));
  assign _zz_194 = debug_bus_cmd_payload_address[7 : 2];
  assign _zz_195 = (IBusSimplePlugin_decompressor_output_ready && IBusSimplePlugin_decompressor_input_valid);
  assign _zz_196 = (IBusSimplePlugin_cmd_ready && (! IBusSimplePlugin_cmd_s2mPipe_ready));
  assign _zz_197 = (CsrPlugin_mstatus_MIE || (CsrPlugin_privilege < (2'b11)));
  assign _zz_198 = ((_zz_152 && 1'b1) && (! 1'b0));
  assign _zz_199 = ((_zz_153 && 1'b1) && (! 1'b0));
  assign _zz_200 = ((_zz_154 && 1'b1) && (! 1'b0));
  assign _zz_201 = {_zz_59[1 : 0],_zz_59[15 : 13]};
  assign _zz_202 = _zz_59[6 : 5];
  assign _zz_203 = _zz_59[11 : 10];
  assign _zz_204 = writeBack_INSTRUCTION[13 : 12];
  assign _zz_205 = writeBack_INSTRUCTION[13 : 12];
  assign _zz_206 = execute_INSTRUCTION[13];
  assign _zz_207 = ($signed(_zz_208) + $signed(_zz_213));
  assign _zz_208 = ($signed(_zz_209) + $signed(_zz_211));
  assign _zz_209 = 52'h0;
  assign _zz_210 = {1'b0,memory_MUL_LL};
  assign _zz_211 = {{19{_zz_210[32]}}, _zz_210};
  assign _zz_212 = ({16'd0,memory_MUL_LH} <<< 16);
  assign _zz_213 = {{2{_zz_212[49]}}, _zz_212};
  assign _zz_214 = ({16'd0,memory_MUL_HL} <<< 16);
  assign _zz_215 = {{2{_zz_214[49]}}, _zz_214};
  assign _zz_216 = ($signed(_zz_218) >>> execute_FullBarrelShifterPlugin_amplitude);
  assign _zz_217 = _zz_216[31 : 0];
  assign _zz_218 = {((execute_SHIFT_CTRL == `ShiftCtrlEnum_defaultEncoding_SRA_1) && execute_FullBarrelShifterPlugin_reversed[31]),execute_FullBarrelShifterPlugin_reversed};
  assign _zz_219 = _zz_105[27 : 27];
  assign _zz_220 = _zz_105[23 : 23];
  assign _zz_221 = _zz_105[22 : 22];
  assign _zz_222 = _zz_105[21 : 21];
  assign _zz_223 = _zz_105[20 : 20];
  assign _zz_224 = _zz_105[14 : 14];
  assign _zz_225 = _zz_105[10 : 10];
  assign _zz_226 = _zz_105[9 : 9];
  assign _zz_227 = _zz_105[8 : 8];
  assign _zz_228 = _zz_105[3 : 3];
  assign _zz_229 = (decode_IS_RVC ? (3'b010) : (3'b100));
  assign _zz_230 = {29'd0, _zz_229};
  assign _zz_231 = _zz_105[30 : 30];
  assign _zz_232 = _zz_105[11 : 11];
  assign _zz_233 = _zz_105[4 : 4];
  assign _zz_234 = _zz_105[2 : 2];
  assign _zz_235 = _zz_105[17 : 17];
  assign _zz_236 = _zz_105[7 : 7];
  assign _zz_237 = (_zz_50 - (3'b001));
  assign _zz_238 = {IBusSimplePlugin_fetchPc_inc,(2'b00)};
  assign _zz_239 = {29'd0, _zz_238};
  assign _zz_240 = (decode_IS_RVC ? (3'b010) : (3'b100));
  assign _zz_241 = {29'd0, _zz_240};
  assign _zz_242 = {{_zz_69,_zz_59[6 : 2]},12'h0};
  assign _zz_243 = {{{(4'b0000),_zz_59[8 : 7]},_zz_59[12 : 9]},(2'b00)};
  assign _zz_244 = {{{(4'b0000),_zz_59[8 : 7]},_zz_59[12 : 9]},(2'b00)};
  assign _zz_245 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_246 = {{_zz_92,{{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0};
  assign _zz_247 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]};
  assign _zz_248 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz_249 = (IBusSimplePlugin_pending_value + _zz_251);
  assign _zz_250 = IBusSimplePlugin_pending_inc;
  assign _zz_251 = {2'd0, _zz_250};
  assign _zz_252 = IBusSimplePlugin_pending_dec;
  assign _zz_253 = {2'd0, _zz_252};
  assign _zz_254 = (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid && (IBusSimplePlugin_rspJoin_rspBuffer_discardCounter != (3'b000)));
  assign _zz_255 = {2'd0, _zz_254};
  assign _zz_256 = IBusSimplePlugin_pending_dec;
  assign _zz_257 = {2'd0, _zz_256};
  assign _zz_258 = execute_SRC_LESS;
  assign _zz_259 = (decode_IS_RVC ? (3'b010) : (3'b100));
  assign _zz_260 = decode_INSTRUCTION[19 : 15];
  assign _zz_261 = decode_INSTRUCTION[31 : 20];
  assign _zz_262 = {decode_INSTRUCTION[31 : 25],decode_INSTRUCTION[11 : 7]};
  assign _zz_263 = ($signed(_zz_264) + $signed(_zz_267));
  assign _zz_264 = ($signed(_zz_265) + $signed(_zz_266));
  assign _zz_265 = execute_SRC1;
  assign _zz_266 = (execute_SRC_USE_SUB_LESS ? (~ execute_SRC2) : execute_SRC2);
  assign _zz_267 = (execute_SRC_USE_SUB_LESS ? _zz_268 : _zz_269);
  assign _zz_268 = 32'h00000001;
  assign _zz_269 = 32'h0;
  assign _zz_270 = {{14{writeBack_MUL_LOW[51]}}, writeBack_MUL_LOW};
  assign _zz_271 = ({32'd0,writeBack_MUL_HH} <<< 32);
  assign _zz_272 = writeBack_MUL_LOW[31 : 0];
  assign _zz_273 = writeBack_MulPlugin_result[63 : 32];
  assign _zz_274 = memory_DivPlugin_div_counter_willIncrement;
  assign _zz_275 = {5'd0, _zz_274};
  assign _zz_276 = {1'd0, memory_DivPlugin_rs2};
  assign _zz_277 = memory_DivPlugin_div_stage_0_remainderMinusDenominator[31:0];
  assign _zz_278 = memory_DivPlugin_div_stage_0_remainderShifted[31:0];
  assign _zz_279 = {_zz_127,(! memory_DivPlugin_div_stage_0_remainderMinusDenominator[32])};
  assign _zz_280 = _zz_281;
  assign _zz_281 = _zz_282;
  assign _zz_282 = ({1'b0,(memory_DivPlugin_div_needRevert ? (~ _zz_128) : _zz_128)} + _zz_284);
  assign _zz_283 = memory_DivPlugin_div_needRevert;
  assign _zz_284 = {32'd0, _zz_283};
  assign _zz_285 = _zz_130;
  assign _zz_286 = {32'd0, _zz_285};
  assign _zz_287 = _zz_129;
  assign _zz_288 = {31'd0, _zz_287};
  assign _zz_289 = execute_INSTRUCTION[31 : 20];
  assign _zz_290 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz_291 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_292 = (execute_IS_RVC ? (3'b010) : (3'b100));
  assign _zz_293 = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_294 = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_295 = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_296 = execute_CsrPlugin_writeData[11 : 11];
  assign _zz_297 = execute_CsrPlugin_writeData[7 : 7];
  assign _zz_298 = execute_CsrPlugin_writeData[3 : 3];
  assign _zz_299 = 1'b1;
  assign _zz_300 = 1'b1;
  assign _zz_301 = {_zz_53,_zz_52};
  assign _zz_302 = 32'h0000107f;
  assign _zz_303 = (decode_INSTRUCTION & 32'h0000207f);
  assign _zz_304 = 32'h00002073;
  assign _zz_305 = ((decode_INSTRUCTION & 32'h0000407f) == 32'h00004063);
  assign _zz_306 = ((decode_INSTRUCTION & 32'h0000207f) == 32'h00002013);
  assign _zz_307 = {((decode_INSTRUCTION & 32'h0000603f) == 32'h00000023),{((decode_INSTRUCTION & 32'h0000207f) == 32'h00000003),{((decode_INSTRUCTION & _zz_308) == 32'h00000003),{(_zz_309 == _zz_310),{_zz_311,{_zz_312,_zz_313}}}}}};
  assign _zz_308 = 32'h0000505f;
  assign _zz_309 = (decode_INSTRUCTION & 32'h0000707b);
  assign _zz_310 = 32'h00000063;
  assign _zz_311 = ((decode_INSTRUCTION & 32'h0000607f) == 32'h0000000f);
  assign _zz_312 = ((decode_INSTRUCTION & 32'hfc00007f) == 32'h00000033);
  assign _zz_313 = {((decode_INSTRUCTION & 32'hbc00707f) == 32'h00005013),{((decode_INSTRUCTION & 32'hfc00307f) == 32'h00001013),{((decode_INSTRUCTION & _zz_314) == 32'h00005033),{(_zz_315 == _zz_316),{_zz_317,{_zz_318,_zz_319}}}}}};
  assign _zz_314 = 32'hbe00707f;
  assign _zz_315 = (decode_INSTRUCTION & 32'hbe00707f);
  assign _zz_316 = 32'h00000033;
  assign _zz_317 = ((decode_INSTRUCTION & 32'hdfffffff) == 32'h10200073);
  assign _zz_318 = ((decode_INSTRUCTION & 32'hffefffff) == 32'h00000073);
  assign _zz_319 = ((decode_INSTRUCTION & 32'hffffffff) == 32'h10500073);
  assign _zz_320 = (_zz_59[11 : 10] == (2'b01));
  assign _zz_321 = ((_zz_59[11 : 10] == (2'b11)) && (_zz_59[6 : 5] == (2'b00)));
  assign _zz_322 = 7'h0;
  assign _zz_323 = _zz_59[6 : 2];
  assign _zz_324 = _zz_59[12];
  assign _zz_325 = _zz_59[11 : 7];
  assign _zz_326 = decode_INSTRUCTION[31];
  assign _zz_327 = decode_INSTRUCTION[19 : 12];
  assign _zz_328 = decode_INSTRUCTION[20];
  assign _zz_329 = decode_INSTRUCTION[31];
  assign _zz_330 = decode_INSTRUCTION[7];
  assign _zz_331 = 32'h10103050;
  assign _zz_332 = (decode_INSTRUCTION & 32'h10103050);
  assign _zz_333 = 32'h00000050;
  assign _zz_334 = ((decode_INSTRUCTION & 32'h10403050) == 32'h10000050);
  assign _zz_335 = {(_zz_340 == _zz_341),(_zz_342 == _zz_343)};
  assign _zz_336 = (2'b00);
  assign _zz_337 = ({_zz_109,_zz_344} != (2'b00));
  assign _zz_338 = (_zz_345 != (1'b0));
  assign _zz_339 = {(_zz_346 != _zz_347),{_zz_348,{_zz_349,_zz_350}}};
  assign _zz_340 = (decode_INSTRUCTION & 32'h00001050);
  assign _zz_341 = 32'h00001050;
  assign _zz_342 = (decode_INSTRUCTION & 32'h00002050);
  assign _zz_343 = 32'h00002050;
  assign _zz_344 = ((decode_INSTRUCTION & 32'h0000001c) == 32'h00000004);
  assign _zz_345 = ((decode_INSTRUCTION & 32'h00000058) == 32'h00000040);
  assign _zz_346 = {(_zz_351 == _zz_352),{_zz_353,{_zz_354,_zz_355}}};
  assign _zz_347 = (4'b0000);
  assign _zz_348 = (_zz_110 != (1'b0));
  assign _zz_349 = (_zz_110 != (1'b0));
  assign _zz_350 = {(_zz_356 != _zz_357),{_zz_358,{_zz_359,_zz_360}}};
  assign _zz_351 = (decode_INSTRUCTION & 32'h00002040);
  assign _zz_352 = 32'h00002040;
  assign _zz_353 = ((decode_INSTRUCTION & 32'h00001040) == 32'h00001040);
  assign _zz_354 = ((decode_INSTRUCTION & _zz_361) == 32'h00000040);
  assign _zz_355 = ((decode_INSTRUCTION & _zz_362) == 32'h00000040);
  assign _zz_356 = ((decode_INSTRUCTION & _zz_363) == 32'h02004020);
  assign _zz_357 = (1'b0);
  assign _zz_358 = ((_zz_364 == _zz_365) != (1'b0));
  assign _zz_359 = ({_zz_366,_zz_367} != (2'b00));
  assign _zz_360 = {(_zz_368 != _zz_369),{_zz_370,{_zz_371,_zz_372}}};
  assign _zz_361 = 32'h00100040;
  assign _zz_362 = 32'h00000050;
  assign _zz_363 = 32'h02004064;
  assign _zz_364 = (decode_INSTRUCTION & 32'h02004074);
  assign _zz_365 = 32'h02000030;
  assign _zz_366 = ((decode_INSTRUCTION & _zz_373) == 32'h00005010);
  assign _zz_367 = ((decode_INSTRUCTION & _zz_374) == 32'h00005020);
  assign _zz_368 = {(_zz_375 == _zz_376),{_zz_377,_zz_378}};
  assign _zz_369 = (3'b000);
  assign _zz_370 = ((_zz_379 == _zz_380) != (1'b0));
  assign _zz_371 = (_zz_381 != (1'b0));
  assign _zz_372 = {(_zz_382 != _zz_383),{_zz_384,{_zz_385,_zz_386}}};
  assign _zz_373 = 32'h00007034;
  assign _zz_374 = 32'h02007064;
  assign _zz_375 = (decode_INSTRUCTION & 32'h40003054);
  assign _zz_376 = 32'h40001010;
  assign _zz_377 = ((decode_INSTRUCTION & 32'h00007034) == 32'h00001010);
  assign _zz_378 = ((decode_INSTRUCTION & 32'h02007054) == 32'h00001010);
  assign _zz_379 = (decode_INSTRUCTION & 32'h00000064);
  assign _zz_380 = 32'h00000024;
  assign _zz_381 = ((decode_INSTRUCTION & 32'h00001000) == 32'h00001000);
  assign _zz_382 = ((decode_INSTRUCTION & _zz_387) == 32'h00002000);
  assign _zz_383 = (1'b0);
  assign _zz_384 = ({_zz_388,_zz_389} != (2'b00));
  assign _zz_385 = (_zz_390 != (1'b0));
  assign _zz_386 = {(_zz_391 != _zz_392),{_zz_393,{_zz_394,_zz_395}}};
  assign _zz_387 = 32'h00003000;
  assign _zz_388 = ((decode_INSTRUCTION & 32'h00002010) == 32'h00002000);
  assign _zz_389 = ((decode_INSTRUCTION & 32'h00005000) == 32'h00001000);
  assign _zz_390 = ((decode_INSTRUCTION & 32'h00004004) == 32'h00004000);
  assign _zz_391 = _zz_107;
  assign _zz_392 = (1'b0);
  assign _zz_393 = ({(_zz_396 == _zz_397),(_zz_398 == _zz_399)} != (2'b00));
  assign _zz_394 = ((_zz_400 == _zz_401) != (1'b0));
  assign _zz_395 = {({_zz_402,_zz_403} != 5'h0),{(_zz_404 != _zz_405),{_zz_406,{_zz_407,_zz_408}}}};
  assign _zz_396 = (decode_INSTRUCTION & 32'h00000034);
  assign _zz_397 = 32'h00000020;
  assign _zz_398 = (decode_INSTRUCTION & 32'h00000064);
  assign _zz_399 = 32'h00000020;
  assign _zz_400 = (decode_INSTRUCTION & 32'h00000020);
  assign _zz_401 = 32'h00000020;
  assign _zz_402 = ((decode_INSTRUCTION & _zz_409) == 32'h00000040);
  assign _zz_403 = {_zz_108,{_zz_410,{_zz_411,_zz_412}}};
  assign _zz_404 = {_zz_108,{_zz_413,{_zz_414,_zz_415}}};
  assign _zz_405 = 5'h0;
  assign _zz_406 = ({_zz_109,{_zz_416,_zz_417}} != 6'h0);
  assign _zz_407 = ({_zz_418,_zz_419} != (2'b00));
  assign _zz_408 = {(_zz_420 != _zz_421),{_zz_422,{_zz_423,_zz_424}}};
  assign _zz_409 = 32'h00000040;
  assign _zz_410 = ((decode_INSTRUCTION & _zz_425) == 32'h00004020);
  assign _zz_411 = (_zz_426 == _zz_427);
  assign _zz_412 = (_zz_428 == _zz_429);
  assign _zz_413 = ((decode_INSTRUCTION & _zz_430) == 32'h00002010);
  assign _zz_414 = (_zz_431 == _zz_432);
  assign _zz_415 = {_zz_433,_zz_434};
  assign _zz_416 = (_zz_435 == _zz_436);
  assign _zz_417 = {_zz_437,{_zz_438,_zz_439}};
  assign _zz_418 = _zz_108;
  assign _zz_419 = (_zz_440 == _zz_441);
  assign _zz_420 = {_zz_108,_zz_442};
  assign _zz_421 = (2'b00);
  assign _zz_422 = ({_zz_443,_zz_444} != (4'b0000));
  assign _zz_423 = (_zz_445 != _zz_446);
  assign _zz_424 = {_zz_447,{_zz_448,_zz_449}};
  assign _zz_425 = 32'h00004020;
  assign _zz_426 = (decode_INSTRUCTION & 32'h00000030);
  assign _zz_427 = 32'h00000010;
  assign _zz_428 = (decode_INSTRUCTION & 32'h02000020);
  assign _zz_429 = 32'h00000020;
  assign _zz_430 = 32'h00002030;
  assign _zz_431 = (decode_INSTRUCTION & 32'h00001030);
  assign _zz_432 = 32'h00000010;
  assign _zz_433 = ((decode_INSTRUCTION & _zz_450) == 32'h00002020);
  assign _zz_434 = ((decode_INSTRUCTION & _zz_451) == 32'h00000020);
  assign _zz_435 = (decode_INSTRUCTION & 32'h00001010);
  assign _zz_436 = 32'h00001010;
  assign _zz_437 = ((decode_INSTRUCTION & _zz_452) == 32'h00002010);
  assign _zz_438 = (_zz_453 == _zz_454);
  assign _zz_439 = {_zz_455,_zz_456};
  assign _zz_440 = (decode_INSTRUCTION & 32'h00000070);
  assign _zz_441 = 32'h00000020;
  assign _zz_442 = ((decode_INSTRUCTION & _zz_457) == 32'h0);
  assign _zz_443 = (_zz_458 == _zz_459);
  assign _zz_444 = {_zz_460,{_zz_461,_zz_462}};
  assign _zz_445 = (_zz_463 == _zz_464);
  assign _zz_446 = (1'b0);
  assign _zz_447 = ({_zz_465,_zz_466} != (3'b000));
  assign _zz_448 = (_zz_467 != _zz_468);
  assign _zz_449 = (_zz_469 != _zz_470);
  assign _zz_450 = 32'h02002060;
  assign _zz_451 = 32'h02003020;
  assign _zz_452 = 32'h00002010;
  assign _zz_453 = (decode_INSTRUCTION & 32'h00000050);
  assign _zz_454 = 32'h00000010;
  assign _zz_455 = ((decode_INSTRUCTION & 32'h0000000c) == 32'h00000004);
  assign _zz_456 = ((decode_INSTRUCTION & 32'h00000028) == 32'h0);
  assign _zz_457 = 32'h00000020;
  assign _zz_458 = (decode_INSTRUCTION & 32'h00000044);
  assign _zz_459 = 32'h0;
  assign _zz_460 = ((decode_INSTRUCTION & 32'h00000018) == 32'h0);
  assign _zz_461 = _zz_107;
  assign _zz_462 = ((decode_INSTRUCTION & _zz_471) == 32'h00001000);
  assign _zz_463 = (decode_INSTRUCTION & 32'h00000058);
  assign _zz_464 = 32'h0;
  assign _zz_465 = ((decode_INSTRUCTION & _zz_472) == 32'h00000040);
  assign _zz_466 = {(_zz_473 == _zz_474),(_zz_475 == _zz_476)};
  assign _zz_467 = {(_zz_477 == _zz_478),_zz_106};
  assign _zz_468 = (2'b00);
  assign _zz_469 = {(_zz_479 == _zz_480),_zz_106};
  assign _zz_470 = (2'b00);
  assign _zz_471 = 32'h00005004;
  assign _zz_472 = 32'h00000044;
  assign _zz_473 = (decode_INSTRUCTION & 32'h00002014);
  assign _zz_474 = 32'h00002010;
  assign _zz_475 = (decode_INSTRUCTION & 32'h40000034);
  assign _zz_476 = 32'h40000030;
  assign _zz_477 = (decode_INSTRUCTION & 32'h00000014);
  assign _zz_478 = 32'h00000004;
  assign _zz_479 = (decode_INSTRUCTION & 32'h00000044);
  assign _zz_480 = 32'h00000004;
  assign _zz_481 = execute_INSTRUCTION[31];
  assign _zz_482 = execute_INSTRUCTION[31];
  assign _zz_483 = execute_INSTRUCTION[7];
  initial begin
    $readmemb("OpalSoc_t8.v_toplevel_system_cpu_logic_cpu_RegFilePlugin_regFile.bin",RegFilePlugin_regFile);
  end
  always @ (posedge io_systemClk) begin
    if(_zz_299) begin
      _zz_167 <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress1];
    end
  end

  always @ (posedge io_systemClk) begin
    if(_zz_300) begin
      _zz_168 <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress2];
    end
  end

  always @ (posedge io_systemClk) begin
    if(_zz_38) begin
      RegFilePlugin_regFile[lastStageRegFileWrite_payload_address] <= lastStageRegFileWrite_payload_data;
    end
  end

  StreamFifoLowLatency IBusSimplePlugin_rspJoin_rspBuffer_c (
    .io_push_valid                 (iBus_rsp_valid                                                  ), //i
    .io_push_ready                 (IBusSimplePlugin_rspJoin_rspBuffer_c_io_push_ready              ), //o
    .io_push_payload_error         (iBus_rsp_payload_error                                          ), //i
    .io_push_payload_inst          (iBus_rsp_payload_inst[31:0]                                     ), //i
    .io_pop_valid                  (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid               ), //o
    .io_pop_ready                  (_zz_165                                                         ), //i
    .io_pop_payload_error          (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_error       ), //o
    .io_pop_payload_inst           (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_inst[31:0]  ), //o
    .io_flush                      (_zz_166                                                         ), //i
    .io_occupancy                  (IBusSimplePlugin_rspJoin_rspBuffer_c_io_occupancy               ), //o
    .io_systemClk                  (io_systemClk                                                    ), //i
    .systemCd_logic_outputReset    (systemCd_logic_outputReset                                      )  //i
  );
  always @(*) begin
    case(_zz_301)
      2'b00 : begin
        _zz_169 = CsrPlugin_jumpInterface_payload;
      end
      2'b01 : begin
        _zz_169 = BranchPlugin_jumpInterface_payload;
      end
      default : begin
        _zz_169 = IBusSimplePlugin_predictionJumpInterface_payload;
      end
    endcase
  end

  `ifndef SYNTHESIS
  always @(*) begin
    case(_zz_1)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_1_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_1_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_1_string = "ECALL";
      default : _zz_1_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_2)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_2_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_2_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_2_string = "ECALL";
      default : _zz_2_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_3)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_3_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_3_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_3_string = "ECALL";
      default : _zz_3_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_4)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_4_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_4_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_4_string = "ECALL";
      default : _zz_4_string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : decode_ENV_CTRL_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : decode_ENV_CTRL_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_ECALL : decode_ENV_CTRL_string = "ECALL";
      default : decode_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_5)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_5_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_5_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_5_string = "ECALL";
      default : _zz_5_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_6)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_6_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_6_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_6_string = "ECALL";
      default : _zz_6_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_7)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_7_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_7_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_7_string = "ECALL";
      default : _zz_7_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_8)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_8_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_8_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_8_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_8_string = "JALR";
      default : _zz_8_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_9)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_9_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_9_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_9_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_9_string = "JALR";
      default : _zz_9_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_10)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_10_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_10_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_10_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_10_string = "SRA_1    ";
      default : _zz_10_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_11)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_11_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_11_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_11_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_11_string = "SRA_1    ";
      default : _zz_11_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : decode_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : decode_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : decode_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : decode_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_12)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_12_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_12_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_12_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_12_string = "SRA_1    ";
      default : _zz_12_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_13)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_13_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_13_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_13_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_13_string = "SRA_1    ";
      default : _zz_13_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_14)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_14_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_14_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_14_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_14_string = "SRA_1    ";
      default : _zz_14_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : decode_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : decode_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : decode_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_15)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_15_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_15_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_15_string = "AND_1";
      default : _zz_15_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_16)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_16_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_16_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_16_string = "AND_1";
      default : _zz_16_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_17)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_17_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_17_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_17_string = "AND_1";
      default : _zz_17_string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : decode_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : decode_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : decode_ALU_CTRL_string = "BITWISE ";
      default : decode_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_18)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_18_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_18_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_18_string = "BITWISE ";
      default : _zz_18_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_19)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_19_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_19_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_19_string = "BITWISE ";
      default : _zz_19_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_20)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_20_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_20_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_20_string = "BITWISE ";
      default : _zz_20_string = "????????";
    endcase
  end
  always @(*) begin
    case(memory_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : memory_ENV_CTRL_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : memory_ENV_CTRL_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_ECALL : memory_ENV_CTRL_string = "ECALL";
      default : memory_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_21)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_21_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_21_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_21_string = "ECALL";
      default : _zz_21_string = "?????";
    endcase
  end
  always @(*) begin
    case(execute_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : execute_ENV_CTRL_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : execute_ENV_CTRL_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_ECALL : execute_ENV_CTRL_string = "ECALL";
      default : execute_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_22)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_22_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_22_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_22_string = "ECALL";
      default : _zz_22_string = "?????";
    endcase
  end
  always @(*) begin
    case(writeBack_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : writeBack_ENV_CTRL_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : writeBack_ENV_CTRL_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_ECALL : writeBack_ENV_CTRL_string = "ECALL";
      default : writeBack_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_23)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_23_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_23_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_23_string = "ECALL";
      default : _zz_23_string = "?????";
    endcase
  end
  always @(*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : execute_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : execute_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : execute_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : execute_BRANCH_CTRL_string = "JALR";
      default : execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_24)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_24_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_24_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_24_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_24_string = "JALR";
      default : _zz_24_string = "????";
    endcase
  end
  always @(*) begin
    case(memory_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : memory_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : memory_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : memory_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : memory_SHIFT_CTRL_string = "SRA_1    ";
      default : memory_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_27)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_27_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_27_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_27_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_27_string = "SRA_1    ";
      default : _zz_27_string = "?????????";
    endcase
  end
  always @(*) begin
    case(execute_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : execute_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : execute_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : execute_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : execute_SHIFT_CTRL_string = "SRA_1    ";
      default : execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_28)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_28_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_28_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_28_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_28_string = "SRA_1    ";
      default : _zz_28_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : decode_SRC2_CTRL_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : decode_SRC2_CTRL_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : decode_SRC2_CTRL_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : decode_SRC2_CTRL_string = "PC ";
      default : decode_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_31)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_31_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_31_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_31_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_31_string = "PC ";
      default : _zz_31_string = "???";
    endcase
  end
  always @(*) begin
    case(decode_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : decode_SRC1_CTRL_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : decode_SRC1_CTRL_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : decode_SRC1_CTRL_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : decode_SRC1_CTRL_string = "URS1        ";
      default : decode_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_33)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_33_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_33_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_33_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_33_string = "URS1        ";
      default : _zz_33_string = "????????????";
    endcase
  end
  always @(*) begin
    case(execute_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : execute_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : execute_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : execute_ALU_CTRL_string = "BITWISE ";
      default : execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_34)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_34_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_34_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_34_string = "BITWISE ";
      default : _zz_34_string = "????????";
    endcase
  end
  always @(*) begin
    case(execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : execute_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_35)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_35_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_35_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_35_string = "AND_1";
      default : _zz_35_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_39)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_39_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_39_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_39_string = "ECALL";
      default : _zz_39_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_40)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_40_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_40_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_40_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_40_string = "JALR";
      default : _zz_40_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_41)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_41_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_41_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_41_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_41_string = "SRA_1    ";
      default : _zz_41_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_42)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_42_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_42_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_42_string = "AND_1";
      default : _zz_42_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_43)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_43_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_43_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_43_string = "BITWISE ";
      default : _zz_43_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_44)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_44_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_44_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_44_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_44_string = "PC ";
      default : _zz_44_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_45)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_45_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_45_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_45_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_45_string = "URS1        ";
      default : _zz_45_string = "????????????";
    endcase
  end
  always @(*) begin
    case(decode_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : decode_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : decode_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : decode_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : decode_BRANCH_CTRL_string = "JALR";
      default : decode_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_47)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_47_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_47_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_47_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_47_string = "JALR";
      default : _zz_47_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_111)
      `Src1CtrlEnum_defaultEncoding_RS : _zz_111_string = "RS          ";
      `Src1CtrlEnum_defaultEncoding_IMU : _zz_111_string = "IMU         ";
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : _zz_111_string = "PC_INCREMENT";
      `Src1CtrlEnum_defaultEncoding_URS1 : _zz_111_string = "URS1        ";
      default : _zz_111_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_112)
      `Src2CtrlEnum_defaultEncoding_RS : _zz_112_string = "RS ";
      `Src2CtrlEnum_defaultEncoding_IMI : _zz_112_string = "IMI";
      `Src2CtrlEnum_defaultEncoding_IMS : _zz_112_string = "IMS";
      `Src2CtrlEnum_defaultEncoding_PC : _zz_112_string = "PC ";
      default : _zz_112_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_113)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : _zz_113_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : _zz_113_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : _zz_113_string = "BITWISE ";
      default : _zz_113_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_114)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_114_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_114_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_114_string = "AND_1";
      default : _zz_114_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_115)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : _zz_115_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : _zz_115_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : _zz_115_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : _zz_115_string = "SRA_1    ";
      default : _zz_115_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_116)
      `BranchCtrlEnum_defaultEncoding_INC : _zz_116_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : _zz_116_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : _zz_116_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : _zz_116_string = "JALR";
      default : _zz_116_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_117)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_117_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : _zz_117_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_ECALL : _zz_117_string = "ECALL";
      default : _zz_117_string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_ADD_SUB : decode_to_execute_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : decode_to_execute_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_defaultEncoding_BITWISE : decode_to_execute_ALU_CTRL_string = "BITWISE ";
      default : decode_to_execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_to_execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : decode_to_execute_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : decode_to_execute_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : decode_to_execute_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : decode_to_execute_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_to_execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(execute_to_memory_SHIFT_CTRL)
      `ShiftCtrlEnum_defaultEncoding_DISABLE_1 : execute_to_memory_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_defaultEncoding_SLL_1 : execute_to_memory_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRL_1 : execute_to_memory_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_defaultEncoding_SRA_1 : execute_to_memory_SHIFT_CTRL_string = "SRA_1    ";
      default : execute_to_memory_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : decode_to_execute_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_defaultEncoding_B : decode_to_execute_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_defaultEncoding_JAL : decode_to_execute_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_defaultEncoding_JALR : decode_to_execute_BRANCH_CTRL_string = "JALR";
      default : decode_to_execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : decode_to_execute_ENV_CTRL_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : decode_to_execute_ENV_CTRL_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_ECALL : decode_to_execute_ENV_CTRL_string = "ECALL";
      default : decode_to_execute_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(execute_to_memory_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : execute_to_memory_ENV_CTRL_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : execute_to_memory_ENV_CTRL_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_ECALL : execute_to_memory_ENV_CTRL_string = "ECALL";
      default : execute_to_memory_ENV_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(memory_to_writeBack_ENV_CTRL)
      `EnvCtrlEnum_defaultEncoding_NONE : memory_to_writeBack_ENV_CTRL_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_XRET : memory_to_writeBack_ENV_CTRL_string = "XRET ";
      `EnvCtrlEnum_defaultEncoding_ECALL : memory_to_writeBack_ENV_CTRL_string = "ECALL";
      default : memory_to_writeBack_ENV_CTRL_string = "?????";
    endcase
  end
  `endif

  assign memory_MUL_LOW = ($signed(_zz_207) + $signed(_zz_215));
  assign memory_MEMORY_READ_DATA = dBus_rsp_data;
  assign execute_BRANCH_CALC = {execute_BranchPlugin_branchAdder[31 : 1],(1'b0)};
  assign execute_BRANCH_DO = ((execute_PREDICTION_HAD_BRANCHED2 != execute_BRANCH_COND_RESULT) || execute_BranchPlugin_missAlignedTarget);
  assign memory_MUL_HH = execute_to_memory_MUL_HH;
  assign execute_MUL_HH = ($signed(execute_MulPlugin_aHigh) * $signed(execute_MulPlugin_bHigh));
  assign execute_MUL_HL = ($signed(execute_MulPlugin_aHigh) * $signed(execute_MulPlugin_bSLow));
  assign execute_MUL_LH = ($signed(execute_MulPlugin_aSLow) * $signed(execute_MulPlugin_bHigh));
  assign execute_MUL_LL = (execute_MulPlugin_aULow * execute_MulPlugin_bULow);
  assign execute_SHIFT_RIGHT = _zz_217;
  assign writeBack_REGFILE_WRITE_DATA = memory_to_writeBack_REGFILE_WRITE_DATA;
  assign memory_REGFILE_WRITE_DATA = execute_to_memory_REGFILE_WRITE_DATA;
  assign execute_REGFILE_WRITE_DATA = _zz_118;
  assign memory_MEMORY_ADDRESS_LOW = execute_to_memory_MEMORY_ADDRESS_LOW;
  assign execute_MEMORY_ADDRESS_LOW = dBus_cmd_payload_address[1 : 0];
  assign decode_DO_EBREAK = ((! DebugPlugin_haltIt) && (decode_IS_EBREAK || 1'b0));
  assign decode_CSR_READ_OPCODE = (decode_INSTRUCTION[13 : 7] != 7'h20);
  assign decode_CSR_WRITE_OPCODE = (! (((decode_INSTRUCTION[14 : 13] == (2'b01)) && (decode_INSTRUCTION[19 : 15] == 5'h0)) || ((decode_INSTRUCTION[14 : 13] == (2'b11)) && (decode_INSTRUCTION[19 : 15] == 5'h0))));
  assign decode_PREDICTION_HAD_BRANCHED2 = IBusSimplePlugin_decodePrediction_cmd_hadBranch;
  assign decode_SRC2 = _zz_124;
  assign decode_SRC1 = _zz_119;
  assign decode_SRC2_FORCE_ZERO = (decode_SRC_ADD_ZERO && (! decode_SRC_USE_SUB_LESS));
  assign _zz_1 = _zz_2;
  assign _zz_3 = _zz_4;
  assign decode_ENV_CTRL = _zz_5;
  assign _zz_6 = _zz_7;
  assign decode_IS_CSR = _zz_219[0];
  assign _zz_8 = _zz_9;
  assign decode_IS_RS2_SIGNED = _zz_220[0];
  assign decode_IS_RS1_SIGNED = _zz_221[0];
  assign decode_IS_DIV = _zz_222[0];
  assign memory_IS_MUL = execute_to_memory_IS_MUL;
  assign execute_IS_MUL = decode_to_execute_IS_MUL;
  assign decode_IS_MUL = _zz_223[0];
  assign _zz_10 = _zz_11;
  assign decode_SHIFT_CTRL = _zz_12;
  assign _zz_13 = _zz_14;
  assign decode_ALU_BITWISE_CTRL = _zz_15;
  assign _zz_16 = _zz_17;
  assign decode_SRC_LESS_UNSIGNED = _zz_224[0];
  assign decode_ALU_CTRL = _zz_18;
  assign _zz_19 = _zz_20;
  assign decode_MEMORY_STORE = _zz_225[0];
  assign execute_BYPASSABLE_MEMORY_STAGE = decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  assign decode_BYPASSABLE_MEMORY_STAGE = _zz_226[0];
  assign decode_BYPASSABLE_EXECUTE_STAGE = _zz_227[0];
  assign decode_MEMORY_ENABLE = _zz_228[0];
  assign writeBack_FORMAL_PC_NEXT = memory_to_writeBack_FORMAL_PC_NEXT;
  assign memory_FORMAL_PC_NEXT = execute_to_memory_FORMAL_PC_NEXT;
  assign execute_FORMAL_PC_NEXT = decode_to_execute_FORMAL_PC_NEXT;
  assign decode_FORMAL_PC_NEXT = (decode_PC + _zz_230);
  assign memory_PC = execute_to_memory_PC;
  assign execute_DO_EBREAK = decode_to_execute_DO_EBREAK;
  assign decode_IS_EBREAK = _zz_231[0];
  assign execute_CSR_READ_OPCODE = decode_to_execute_CSR_READ_OPCODE;
  assign execute_CSR_WRITE_OPCODE = decode_to_execute_CSR_WRITE_OPCODE;
  assign execute_IS_CSR = decode_to_execute_IS_CSR;
  assign memory_ENV_CTRL = _zz_21;
  assign execute_ENV_CTRL = _zz_22;
  assign writeBack_ENV_CTRL = _zz_23;
  assign memory_BRANCH_CALC = execute_to_memory_BRANCH_CALC;
  assign memory_BRANCH_DO = execute_to_memory_BRANCH_DO;
  assign execute_IS_RVC = decode_to_execute_IS_RVC;
  assign execute_PC = decode_to_execute_PC;
  assign execute_BRANCH_COND_RESULT = _zz_145;
  assign execute_PREDICTION_HAD_BRANCHED2 = decode_to_execute_PREDICTION_HAD_BRANCHED2;
  assign execute_BRANCH_CTRL = _zz_24;
  assign decode_RS2_USE = _zz_232[0];
  assign decode_RS1_USE = _zz_233[0];
  always @ (*) begin
    _zz_25 = execute_REGFILE_WRITE_DATA;
    if(_zz_170)begin
      _zz_25 = execute_CsrPlugin_readData;
    end
  end

  assign execute_REGFILE_WRITE_VALID = decode_to_execute_REGFILE_WRITE_VALID;
  assign execute_BYPASSABLE_EXECUTE_STAGE = decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  assign memory_REGFILE_WRITE_VALID = execute_to_memory_REGFILE_WRITE_VALID;
  assign memory_BYPASSABLE_MEMORY_STAGE = execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  assign writeBack_REGFILE_WRITE_VALID = memory_to_writeBack_REGFILE_WRITE_VALID;
  always @ (*) begin
    decode_RS2 = decode_RegFilePlugin_rs2Data;
    if(_zz_134)begin
      if((_zz_135 == decode_INSTRUCTION[24 : 20]))begin
        decode_RS2 = _zz_136;
      end
    end
    if(_zz_171)begin
      if(_zz_172)begin
        if(_zz_138)begin
          decode_RS2 = _zz_46;
        end
      end
    end
    if(_zz_173)begin
      if(memory_BYPASSABLE_MEMORY_STAGE)begin
        if(_zz_140)begin
          decode_RS2 = _zz_26;
        end
      end
    end
    if(_zz_174)begin
      if(execute_BYPASSABLE_EXECUTE_STAGE)begin
        if(_zz_142)begin
          decode_RS2 = _zz_25;
        end
      end
    end
  end

  always @ (*) begin
    decode_RS1 = decode_RegFilePlugin_rs1Data;
    if(_zz_134)begin
      if((_zz_135 == decode_INSTRUCTION[19 : 15]))begin
        decode_RS1 = _zz_136;
      end
    end
    if(_zz_171)begin
      if(_zz_172)begin
        if(_zz_137)begin
          decode_RS1 = _zz_46;
        end
      end
    end
    if(_zz_173)begin
      if(memory_BYPASSABLE_MEMORY_STAGE)begin
        if(_zz_139)begin
          decode_RS1 = _zz_26;
        end
      end
    end
    if(_zz_174)begin
      if(execute_BYPASSABLE_EXECUTE_STAGE)begin
        if(_zz_141)begin
          decode_RS1 = _zz_25;
        end
      end
    end
  end

  assign execute_IS_RS1_SIGNED = decode_to_execute_IS_RS1_SIGNED;
  assign execute_IS_DIV = decode_to_execute_IS_DIV;
  assign execute_IS_RS2_SIGNED = decode_to_execute_IS_RS2_SIGNED;
  assign memory_INSTRUCTION = execute_to_memory_INSTRUCTION;
  assign memory_IS_DIV = execute_to_memory_IS_DIV;
  assign writeBack_IS_MUL = memory_to_writeBack_IS_MUL;
  assign writeBack_MUL_HH = memory_to_writeBack_MUL_HH;
  assign writeBack_MUL_LOW = memory_to_writeBack_MUL_LOW;
  assign memory_MUL_HL = execute_to_memory_MUL_HL;
  assign memory_MUL_LH = execute_to_memory_MUL_LH;
  assign memory_MUL_LL = execute_to_memory_MUL_LL;
  assign execute_RS1 = decode_to_execute_RS1;
  assign memory_SHIFT_RIGHT = execute_to_memory_SHIFT_RIGHT;
  always @ (*) begin
    _zz_26 = memory_REGFILE_WRITE_DATA;
    if(memory_arbitration_isValid)begin
      case(memory_SHIFT_CTRL)
        `ShiftCtrlEnum_defaultEncoding_SLL_1 : begin
          _zz_26 = _zz_126;
        end
        `ShiftCtrlEnum_defaultEncoding_SRL_1, `ShiftCtrlEnum_defaultEncoding_SRA_1 : begin
          _zz_26 = memory_SHIFT_RIGHT;
        end
        default : begin
        end
      endcase
    end
    if(_zz_175)begin
      _zz_26 = memory_DivPlugin_div_result;
    end
  end

  assign memory_SHIFT_CTRL = _zz_27;
  assign execute_SHIFT_CTRL = _zz_28;
  assign execute_SRC_LESS_UNSIGNED = decode_to_execute_SRC_LESS_UNSIGNED;
  assign execute_SRC2_FORCE_ZERO = decode_to_execute_SRC2_FORCE_ZERO;
  assign execute_SRC_USE_SUB_LESS = decode_to_execute_SRC_USE_SUB_LESS;
  assign _zz_29 = decode_PC;
  assign _zz_30 = decode_RS2;
  assign decode_SRC2_CTRL = _zz_31;
  assign _zz_32 = decode_RS1;
  assign decode_SRC1_CTRL = _zz_33;
  assign decode_SRC_USE_SUB_LESS = _zz_234[0];
  assign decode_SRC_ADD_ZERO = _zz_235[0];
  assign execute_SRC_ADD_SUB = execute_SrcPlugin_addSub;
  assign execute_SRC_LESS = execute_SrcPlugin_less;
  assign execute_ALU_CTRL = _zz_34;
  assign execute_SRC2 = decode_to_execute_SRC2;
  assign execute_SRC1 = decode_to_execute_SRC1;
  assign execute_ALU_BITWISE_CTRL = _zz_35;
  assign _zz_36 = writeBack_INSTRUCTION;
  assign _zz_37 = writeBack_REGFILE_WRITE_VALID;
  always @ (*) begin
    _zz_38 = 1'b0;
    if(lastStageRegFileWrite_valid)begin
      _zz_38 = 1'b1;
    end
  end

  assign decode_INSTRUCTION_ANTICIPATED = (decode_arbitration_isStuck ? decode_INSTRUCTION : IBusSimplePlugin_decompressor_output_payload_rsp_inst);
  always @ (*) begin
    decode_REGFILE_WRITE_VALID = _zz_236[0];
    if((decode_INSTRUCTION[11 : 7] == 5'h0))begin
      decode_REGFILE_WRITE_VALID = 1'b0;
    end
  end

  assign decode_LEGAL_INSTRUCTION = ({((decode_INSTRUCTION & 32'h0000005f) == 32'h00000017),{((decode_INSTRUCTION & 32'h0000007f) == 32'h0000006f),{((decode_INSTRUCTION & 32'h0000106f) == 32'h00000003),{((decode_INSTRUCTION & _zz_302) == 32'h00001073),{(_zz_303 == _zz_304),{_zz_305,{_zz_306,_zz_307}}}}}}} != 20'h0);
  assign writeBack_MEMORY_STORE = memory_to_writeBack_MEMORY_STORE;
  always @ (*) begin
    _zz_46 = writeBack_REGFILE_WRITE_DATA;
    if((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE))begin
      _zz_46 = writeBack_DBusSimplePlugin_rspFormated;
    end
    if((writeBack_arbitration_isValid && writeBack_IS_MUL))begin
      case(_zz_205)
        2'b00 : begin
          _zz_46 = _zz_272;
        end
        default : begin
          _zz_46 = _zz_273;
        end
      endcase
    end
  end

  assign writeBack_MEMORY_ENABLE = memory_to_writeBack_MEMORY_ENABLE;
  assign writeBack_MEMORY_ADDRESS_LOW = memory_to_writeBack_MEMORY_ADDRESS_LOW;
  assign writeBack_MEMORY_READ_DATA = memory_to_writeBack_MEMORY_READ_DATA;
  assign memory_MEMORY_STORE = execute_to_memory_MEMORY_STORE;
  assign memory_MEMORY_ENABLE = execute_to_memory_MEMORY_ENABLE;
  assign execute_SRC_ADD = execute_SrcPlugin_addSub;
  assign execute_RS2 = decode_to_execute_RS2;
  assign execute_INSTRUCTION = decode_to_execute_INSTRUCTION;
  assign execute_MEMORY_STORE = decode_to_execute_MEMORY_STORE;
  assign execute_MEMORY_ENABLE = decode_to_execute_MEMORY_ENABLE;
  assign execute_ALIGNEMENT_FAULT = 1'b0;
  assign decode_BRANCH_CTRL = _zz_47;
  always @ (*) begin
    _zz_48 = memory_FORMAL_PC_NEXT;
    if(BranchPlugin_jumpInterface_valid)begin
      _zz_48 = BranchPlugin_jumpInterface_payload;
    end
  end

  always @ (*) begin
    _zz_49 = decode_FORMAL_PC_NEXT;
    if(IBusSimplePlugin_predictionJumpInterface_valid)begin
      _zz_49 = IBusSimplePlugin_predictionJumpInterface_payload;
    end
  end

  assign decode_PC = IBusSimplePlugin_decodePc_pcReg;
  assign decode_INSTRUCTION = IBusSimplePlugin_injector_decodeInput_payload_rsp_inst;
  assign decode_IS_RVC = IBusSimplePlugin_injector_decodeInput_payload_isRvc;
  assign writeBack_PC = memory_to_writeBack_PC;
  assign writeBack_INSTRUCTION = memory_to_writeBack_INSTRUCTION;
  always @ (*) begin
    decode_arbitration_haltItself = 1'b0;
    case(_zz_157)
      3'b000 : begin
      end
      3'b001 : begin
      end
      3'b010 : begin
        decode_arbitration_haltItself = 1'b1;
      end
      3'b011 : begin
      end
      3'b100 : begin
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    decode_arbitration_haltByOther = 1'b0;
    if((decode_arbitration_isValid && (_zz_132 || _zz_133)))begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if(CsrPlugin_pipelineLiberator_active)begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if(({(writeBack_arbitration_isValid && (writeBack_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)),{(memory_arbitration_isValid && (memory_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)),(execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET))}} != (3'b000)))begin
      decode_arbitration_haltByOther = 1'b1;
    end
  end

  always @ (*) begin
    decode_arbitration_removeIt = 1'b0;
    if(decodeExceptionPort_valid)begin
      decode_arbitration_removeIt = 1'b1;
    end
    if(decode_arbitration_isFlushed)begin
      decode_arbitration_removeIt = 1'b1;
    end
  end

  assign decode_arbitration_flushIt = 1'b0;
  always @ (*) begin
    decode_arbitration_flushNext = 1'b0;
    if(IBusSimplePlugin_predictionJumpInterface_valid)begin
      decode_arbitration_flushNext = 1'b1;
    end
    if(decodeExceptionPort_valid)begin
      decode_arbitration_flushNext = 1'b1;
    end
  end

  always @ (*) begin
    execute_arbitration_haltItself = 1'b0;
    if(((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! dBus_cmd_ready)) && (! execute_DBusSimplePlugin_skipCmd)) && (! _zz_98)))begin
      execute_arbitration_haltItself = 1'b1;
    end
    if(_zz_170)begin
      if(execute_CsrPlugin_blockedBySideEffects)begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
  end

  always @ (*) begin
    execute_arbitration_haltByOther = 1'b0;
    if(_zz_176)begin
      execute_arbitration_haltByOther = 1'b1;
    end
  end

  always @ (*) begin
    execute_arbitration_removeIt = 1'b0;
    if(CsrPlugin_selfException_valid)begin
      execute_arbitration_removeIt = 1'b1;
    end
    if(execute_arbitration_isFlushed)begin
      execute_arbitration_removeIt = 1'b1;
    end
  end

  always @ (*) begin
    execute_arbitration_flushIt = 1'b0;
    if(_zz_176)begin
      if(_zz_177)begin
        execute_arbitration_flushIt = 1'b1;
      end
    end
  end

  always @ (*) begin
    execute_arbitration_flushNext = 1'b0;
    if(CsrPlugin_selfException_valid)begin
      execute_arbitration_flushNext = 1'b1;
    end
    if(_zz_176)begin
      if(_zz_177)begin
        execute_arbitration_flushNext = 1'b1;
      end
    end
    if(_zz_156)begin
      execute_arbitration_flushNext = 1'b1;
    end
  end

  always @ (*) begin
    memory_arbitration_haltItself = 1'b0;
    if((((memory_arbitration_isValid && memory_MEMORY_ENABLE) && (! memory_MEMORY_STORE)) && ((! dBus_rsp_ready) || 1'b0)))begin
      memory_arbitration_haltItself = 1'b1;
    end
    if(_zz_175)begin
      if(((! memory_DivPlugin_frontendOk) || (! memory_DivPlugin_div_done)))begin
        memory_arbitration_haltItself = 1'b1;
      end
    end
  end

  assign memory_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    memory_arbitration_removeIt = 1'b0;
    if(memory_arbitration_isFlushed)begin
      memory_arbitration_removeIt = 1'b1;
    end
  end

  assign memory_arbitration_flushIt = 1'b0;
  always @ (*) begin
    memory_arbitration_flushNext = 1'b0;
    if(BranchPlugin_jumpInterface_valid)begin
      memory_arbitration_flushNext = 1'b1;
    end
  end

  assign writeBack_arbitration_haltItself = 1'b0;
  assign writeBack_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    writeBack_arbitration_removeIt = 1'b0;
    if(writeBack_arbitration_isFlushed)begin
      writeBack_arbitration_removeIt = 1'b1;
    end
  end

  assign writeBack_arbitration_flushIt = 1'b0;
  always @ (*) begin
    writeBack_arbitration_flushNext = 1'b0;
    if(_zz_178)begin
      writeBack_arbitration_flushNext = 1'b1;
    end
    if(_zz_179)begin
      writeBack_arbitration_flushNext = 1'b1;
    end
  end

  assign lastStageInstruction = writeBack_INSTRUCTION;
  assign lastStagePc = writeBack_PC;
  assign lastStageIsValid = writeBack_arbitration_isValid;
  assign lastStageIsFiring = writeBack_arbitration_isFiring;
  always @ (*) begin
    IBusSimplePlugin_fetcherHalt = 1'b0;
    if(({CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack,{CsrPlugin_exceptionPortCtrl_exceptionValids_memory,{CsrPlugin_exceptionPortCtrl_exceptionValids_execute,CsrPlugin_exceptionPortCtrl_exceptionValids_decode}}} != (4'b0000)))begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
    if(_zz_178)begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
    if(_zz_179)begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
    if(_zz_176)begin
      if(_zz_177)begin
        IBusSimplePlugin_fetcherHalt = 1'b1;
      end
    end
    if(DebugPlugin_haltIt)begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
    if(_zz_180)begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
  end

  always @ (*) begin
    IBusSimplePlugin_incomingInstruction = 1'b0;
    if(IBusSimplePlugin_iBusRsp_stages_1_input_valid)begin
      IBusSimplePlugin_incomingInstruction = 1'b1;
    end
    if(IBusSimplePlugin_injector_decodeInput_valid)begin
      IBusSimplePlugin_incomingInstruction = 1'b1;
    end
  end

  assign CsrPlugin_inWfi = 1'b0;
  always @ (*) begin
    CsrPlugin_thirdPartyWake = 1'b0;
    if(DebugPlugin_haltIt)begin
      CsrPlugin_thirdPartyWake = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_jumpInterface_valid = 1'b0;
    if(_zz_178)begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
    if(_zz_179)begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_jumpInterface_payload = 32'h0;
    if(_zz_178)begin
      CsrPlugin_jumpInterface_payload = {CsrPlugin_xtvec_base,(2'b00)};
    end
    if(_zz_179)begin
      case(_zz_181)
        2'b11 : begin
          CsrPlugin_jumpInterface_payload = CsrPlugin_mepc;
        end
        default : begin
        end
      endcase
    end
  end

  always @ (*) begin
    CsrPlugin_forceMachineWire = 1'b0;
    if(DebugPlugin_godmode)begin
      CsrPlugin_forceMachineWire = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_allowInterrupts = 1'b1;
    if((DebugPlugin_haltIt || DebugPlugin_stepIt))begin
      CsrPlugin_allowInterrupts = 1'b0;
    end
  end

  always @ (*) begin
    CsrPlugin_allowException = 1'b1;
    if(DebugPlugin_godmode)begin
      CsrPlugin_allowException = 1'b0;
    end
  end

  assign IBusSimplePlugin_externalFlush = ({writeBack_arbitration_flushNext,{memory_arbitration_flushNext,{execute_arbitration_flushNext,decode_arbitration_flushNext}}} != (4'b0000));
  assign IBusSimplePlugin_jump_pcLoad_valid = ({CsrPlugin_jumpInterface_valid,{BranchPlugin_jumpInterface_valid,IBusSimplePlugin_predictionJumpInterface_valid}} != (3'b000));
  assign _zz_50 = {IBusSimplePlugin_predictionJumpInterface_valid,{BranchPlugin_jumpInterface_valid,CsrPlugin_jumpInterface_valid}};
  assign _zz_51 = (_zz_50 & (~ _zz_237));
  assign _zz_52 = _zz_51[1];
  assign _zz_53 = _zz_51[2];
  assign IBusSimplePlugin_jump_pcLoad_payload = _zz_169;
  always @ (*) begin
    IBusSimplePlugin_fetchPc_correction = 1'b0;
    if(IBusSimplePlugin_jump_pcLoad_valid)begin
      IBusSimplePlugin_fetchPc_correction = 1'b1;
    end
  end

  assign IBusSimplePlugin_fetchPc_corrected = (IBusSimplePlugin_fetchPc_correction || IBusSimplePlugin_fetchPc_correctionReg);
  always @ (*) begin
    IBusSimplePlugin_fetchPc_pcRegPropagate = 1'b0;
    if(IBusSimplePlugin_iBusRsp_stages_1_input_ready)begin
      IBusSimplePlugin_fetchPc_pcRegPropagate = 1'b1;
    end
  end

  always @ (*) begin
    IBusSimplePlugin_fetchPc_pc = (IBusSimplePlugin_fetchPc_pcReg + _zz_239);
    if(IBusSimplePlugin_fetchPc_inc)begin
      IBusSimplePlugin_fetchPc_pc[1] = 1'b0;
    end
    if(IBusSimplePlugin_jump_pcLoad_valid)begin
      IBusSimplePlugin_fetchPc_pc = IBusSimplePlugin_jump_pcLoad_payload;
    end
    IBusSimplePlugin_fetchPc_pc[0] = 1'b0;
  end

  always @ (*) begin
    IBusSimplePlugin_fetchPc_flushed = 1'b0;
    if(IBusSimplePlugin_jump_pcLoad_valid)begin
      IBusSimplePlugin_fetchPc_flushed = 1'b1;
    end
  end

  assign IBusSimplePlugin_fetchPc_output_valid = ((! IBusSimplePlugin_fetcherHalt) && IBusSimplePlugin_fetchPc_booted);
  assign IBusSimplePlugin_fetchPc_output_payload = IBusSimplePlugin_fetchPc_pc;
  always @ (*) begin
    IBusSimplePlugin_decodePc_flushed = 1'b0;
    if(_zz_182)begin
      IBusSimplePlugin_decodePc_flushed = 1'b1;
    end
  end

  assign IBusSimplePlugin_decodePc_pcPlus = (IBusSimplePlugin_decodePc_pcReg + _zz_241);
  always @ (*) begin
    IBusSimplePlugin_decodePc_injectedDecode = 1'b0;
    if((_zz_157 != (3'b000)))begin
      IBusSimplePlugin_decodePc_injectedDecode = 1'b1;
    end
  end

  assign IBusSimplePlugin_iBusRsp_redoFetch = 1'b0;
  assign IBusSimplePlugin_iBusRsp_stages_0_input_valid = IBusSimplePlugin_fetchPc_output_valid;
  assign IBusSimplePlugin_fetchPc_output_ready = IBusSimplePlugin_iBusRsp_stages_0_input_ready;
  assign IBusSimplePlugin_iBusRsp_stages_0_input_payload = IBusSimplePlugin_fetchPc_output_payload;
  always @ (*) begin
    IBusSimplePlugin_iBusRsp_stages_0_halt = 1'b0;
    if((IBusSimplePlugin_iBusRsp_stages_0_input_valid && ((! IBusSimplePlugin_cmdFork_canEmit) || (! IBusSimplePlugin_cmd_ready))))begin
      IBusSimplePlugin_iBusRsp_stages_0_halt = 1'b1;
    end
  end

  assign _zz_54 = (! IBusSimplePlugin_iBusRsp_stages_0_halt);
  assign IBusSimplePlugin_iBusRsp_stages_0_input_ready = (IBusSimplePlugin_iBusRsp_stages_0_output_ready && _zz_54);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_valid = (IBusSimplePlugin_iBusRsp_stages_0_input_valid && _zz_54);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_payload = IBusSimplePlugin_iBusRsp_stages_0_input_payload;
  assign IBusSimplePlugin_iBusRsp_stages_1_halt = 1'b0;
  assign _zz_55 = (! IBusSimplePlugin_iBusRsp_stages_1_halt);
  assign IBusSimplePlugin_iBusRsp_stages_1_input_ready = (IBusSimplePlugin_iBusRsp_stages_1_output_ready && _zz_55);
  assign IBusSimplePlugin_iBusRsp_stages_1_output_valid = (IBusSimplePlugin_iBusRsp_stages_1_input_valid && _zz_55);
  assign IBusSimplePlugin_iBusRsp_stages_1_output_payload = IBusSimplePlugin_iBusRsp_stages_1_input_payload;
  assign IBusSimplePlugin_iBusRsp_flush = (IBusSimplePlugin_externalFlush || IBusSimplePlugin_iBusRsp_redoFetch);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_ready = _zz_56;
  assign _zz_56 = ((1'b0 && (! _zz_57)) || IBusSimplePlugin_iBusRsp_stages_1_input_ready);
  assign _zz_57 = _zz_58;
  assign IBusSimplePlugin_iBusRsp_stages_1_input_valid = _zz_57;
  assign IBusSimplePlugin_iBusRsp_stages_1_input_payload = IBusSimplePlugin_fetchPc_pcReg;
  always @ (*) begin
    IBusSimplePlugin_iBusRsp_readyForError = 1'b1;
    if(IBusSimplePlugin_injector_decodeInput_valid)begin
      IBusSimplePlugin_iBusRsp_readyForError = 1'b0;
    end
  end

  assign IBusSimplePlugin_decompressor_input_valid = (IBusSimplePlugin_iBusRsp_output_valid && (! IBusSimplePlugin_iBusRsp_redoFetch));
  assign IBusSimplePlugin_decompressor_input_payload_pc = IBusSimplePlugin_iBusRsp_output_payload_pc;
  assign IBusSimplePlugin_decompressor_input_payload_rsp_error = IBusSimplePlugin_iBusRsp_output_payload_rsp_error;
  assign IBusSimplePlugin_decompressor_input_payload_rsp_inst = IBusSimplePlugin_iBusRsp_output_payload_rsp_inst;
  assign IBusSimplePlugin_decompressor_input_payload_isRvc = IBusSimplePlugin_iBusRsp_output_payload_isRvc;
  assign IBusSimplePlugin_iBusRsp_output_ready = IBusSimplePlugin_decompressor_input_ready;
  assign IBusSimplePlugin_decompressor_flushNext = 1'b0;
  assign IBusSimplePlugin_decompressor_consumeCurrent = 1'b0;
  assign IBusSimplePlugin_decompressor_isInputLowRvc = (IBusSimplePlugin_decompressor_input_payload_rsp_inst[1 : 0] != (2'b11));
  assign IBusSimplePlugin_decompressor_isInputHighRvc = (IBusSimplePlugin_decompressor_input_payload_rsp_inst[17 : 16] != (2'b11));
  assign IBusSimplePlugin_decompressor_throw2Bytes = (IBusSimplePlugin_decompressor_throw2BytesReg || IBusSimplePlugin_decompressor_input_payload_pc[1]);
  assign IBusSimplePlugin_decompressor_unaligned = (IBusSimplePlugin_decompressor_throw2Bytes || IBusSimplePlugin_decompressor_bufferValid);
  assign IBusSimplePlugin_decompressor_raw = (IBusSimplePlugin_decompressor_bufferValid ? {IBusSimplePlugin_decompressor_input_payload_rsp_inst[15 : 0],IBusSimplePlugin_decompressor_bufferData} : {IBusSimplePlugin_decompressor_input_payload_rsp_inst[31 : 16],(IBusSimplePlugin_decompressor_throw2Bytes ? IBusSimplePlugin_decompressor_input_payload_rsp_inst[31 : 16] : IBusSimplePlugin_decompressor_input_payload_rsp_inst[15 : 0])});
  assign IBusSimplePlugin_decompressor_isRvc = (IBusSimplePlugin_decompressor_raw[1 : 0] != (2'b11));
  assign _zz_59 = IBusSimplePlugin_decompressor_raw[15 : 0];
  always @ (*) begin
    IBusSimplePlugin_decompressor_decompressed = 32'h0;
    case(_zz_201)
      5'b00000 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{{{{{(2'b00),_zz_59[10 : 7]},_zz_59[12 : 11]},_zz_59[5]},_zz_59[6]},(2'b00)},5'h02},(3'b000)},_zz_61},7'h13};
      end
      5'b00010 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{_zz_62,_zz_60},(3'b010)},_zz_61},7'h03};
      end
      5'b00110 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{_zz_62[11 : 5],_zz_61},_zz_60},(3'b010)},_zz_62[4 : 0]},7'h23};
      end
      5'b01000 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{_zz_64,_zz_59[11 : 7]},(3'b000)},_zz_59[11 : 7]},7'h13};
      end
      5'b01001 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{_zz_67[20],_zz_67[10 : 1]},_zz_67[11]},_zz_67[19 : 12]},_zz_79},7'h6f};
      end
      5'b01010 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{_zz_64,5'h0},(3'b000)},_zz_59[11 : 7]},7'h13};
      end
      5'b01011 : begin
        IBusSimplePlugin_decompressor_decompressed = ((_zz_59[11 : 7] == 5'h02) ? {{{{{{{{{_zz_71,_zz_59[4 : 3]},_zz_59[5]},_zz_59[2]},_zz_59[6]},(4'b0000)},_zz_59[11 : 7]},(3'b000)},_zz_59[11 : 7]},7'h13} : {{_zz_242[31 : 12],_zz_59[11 : 7]},7'h37});
      end
      5'b01100 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{((_zz_59[11 : 10] == (2'b10)) ? _zz_85 : {{(1'b0),(_zz_320 || _zz_321)},5'h0}),(((! _zz_59[11]) || _zz_81) ? _zz_59[6 : 2] : _zz_61)},_zz_60},_zz_83},_zz_60},(_zz_81 ? 7'h13 : 7'h33)};
      end
      5'b01101 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{_zz_74[20],_zz_74[10 : 1]},_zz_74[11]},_zz_74[19 : 12]},_zz_78},7'h6f};
      end
      5'b01110 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{{{_zz_77[12],_zz_77[10 : 5]},_zz_78},_zz_60},(3'b000)},_zz_77[4 : 1]},_zz_77[11]},7'h63};
      end
      5'b01111 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{{{_zz_77[12],_zz_77[10 : 5]},_zz_78},_zz_60},(3'b001)},_zz_77[4 : 1]},_zz_77[11]},7'h63};
      end
      5'b10000 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{7'h0,_zz_59[6 : 2]},_zz_59[11 : 7]},(3'b001)},_zz_59[11 : 7]},7'h13};
      end
      5'b10010 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{{{{(4'b0000),_zz_59[3 : 2]},_zz_59[12]},_zz_59[6 : 4]},(2'b00)},_zz_80},(3'b010)},_zz_59[11 : 7]},7'h03};
      end
      5'b10100 : begin
        IBusSimplePlugin_decompressor_decompressed = ((_zz_59[12 : 2] == 11'h400) ? 32'h00100073 : ((_zz_59[6 : 2] == 5'h0) ? {{{{12'h0,_zz_59[11 : 7]},(3'b000)},(_zz_59[12] ? _zz_79 : _zz_78)},7'h67} : {{{{{_zz_322,_zz_323},(_zz_324 ? _zz_325 : _zz_78)},(3'b000)},_zz_59[11 : 7]},7'h33}));
      end
      5'b10110 : begin
        IBusSimplePlugin_decompressor_decompressed = {{{{{_zz_243[11 : 5],_zz_59[6 : 2]},_zz_80},(3'b010)},_zz_244[4 : 0]},7'h23};
      end
      default : begin
      end
    endcase
  end

  assign _zz_60 = {(2'b01),_zz_59[9 : 7]};
  assign _zz_61 = {(2'b01),_zz_59[4 : 2]};
  assign _zz_62 = {{{{5'h0,_zz_59[5]},_zz_59[12 : 10]},_zz_59[6]},(2'b00)};
  assign _zz_63 = _zz_59[12];
  always @ (*) begin
    _zz_64[11] = _zz_63;
    _zz_64[10] = _zz_63;
    _zz_64[9] = _zz_63;
    _zz_64[8] = _zz_63;
    _zz_64[7] = _zz_63;
    _zz_64[6] = _zz_63;
    _zz_64[5] = _zz_63;
    _zz_64[4 : 0] = _zz_59[6 : 2];
  end

  assign _zz_65 = _zz_59[12];
  always @ (*) begin
    _zz_66[9] = _zz_65;
    _zz_66[8] = _zz_65;
    _zz_66[7] = _zz_65;
    _zz_66[6] = _zz_65;
    _zz_66[5] = _zz_65;
    _zz_66[4] = _zz_65;
    _zz_66[3] = _zz_65;
    _zz_66[2] = _zz_65;
    _zz_66[1] = _zz_65;
    _zz_66[0] = _zz_65;
  end

  assign _zz_67 = {{{{{{{{_zz_66,_zz_59[8]},_zz_59[10 : 9]},_zz_59[6]},_zz_59[7]},_zz_59[2]},_zz_59[11]},_zz_59[5 : 3]},(1'b0)};
  assign _zz_68 = _zz_59[12];
  always @ (*) begin
    _zz_69[14] = _zz_68;
    _zz_69[13] = _zz_68;
    _zz_69[12] = _zz_68;
    _zz_69[11] = _zz_68;
    _zz_69[10] = _zz_68;
    _zz_69[9] = _zz_68;
    _zz_69[8] = _zz_68;
    _zz_69[7] = _zz_68;
    _zz_69[6] = _zz_68;
    _zz_69[5] = _zz_68;
    _zz_69[4] = _zz_68;
    _zz_69[3] = _zz_68;
    _zz_69[2] = _zz_68;
    _zz_69[1] = _zz_68;
    _zz_69[0] = _zz_68;
  end

  assign _zz_70 = _zz_59[12];
  always @ (*) begin
    _zz_71[2] = _zz_70;
    _zz_71[1] = _zz_70;
    _zz_71[0] = _zz_70;
  end

  assign _zz_72 = _zz_59[12];
  always @ (*) begin
    _zz_73[9] = _zz_72;
    _zz_73[8] = _zz_72;
    _zz_73[7] = _zz_72;
    _zz_73[6] = _zz_72;
    _zz_73[5] = _zz_72;
    _zz_73[4] = _zz_72;
    _zz_73[3] = _zz_72;
    _zz_73[2] = _zz_72;
    _zz_73[1] = _zz_72;
    _zz_73[0] = _zz_72;
  end

  assign _zz_74 = {{{{{{{{_zz_73,_zz_59[8]},_zz_59[10 : 9]},_zz_59[6]},_zz_59[7]},_zz_59[2]},_zz_59[11]},_zz_59[5 : 3]},(1'b0)};
  assign _zz_75 = _zz_59[12];
  always @ (*) begin
    _zz_76[4] = _zz_75;
    _zz_76[3] = _zz_75;
    _zz_76[2] = _zz_75;
    _zz_76[1] = _zz_75;
    _zz_76[0] = _zz_75;
  end

  assign _zz_77 = {{{{{_zz_76,_zz_59[6 : 5]},_zz_59[2]},_zz_59[11 : 10]},_zz_59[4 : 3]},(1'b0)};
  assign _zz_78 = 5'h0;
  assign _zz_79 = 5'h01;
  assign _zz_80 = 5'h02;
  assign _zz_81 = (_zz_59[11 : 10] != (2'b11));
  always @ (*) begin
    case(_zz_202)
      2'b00 : begin
        _zz_82 = (3'b000);
      end
      2'b01 : begin
        _zz_82 = (3'b100);
      end
      2'b10 : begin
        _zz_82 = (3'b110);
      end
      default : begin
        _zz_82 = (3'b111);
      end
    endcase
  end

  always @ (*) begin
    case(_zz_203)
      2'b00 : begin
        _zz_83 = (3'b101);
      end
      2'b01 : begin
        _zz_83 = (3'b101);
      end
      2'b10 : begin
        _zz_83 = (3'b111);
      end
      default : begin
        _zz_83 = _zz_82;
      end
    endcase
  end

  assign _zz_84 = _zz_59[12];
  always @ (*) begin
    _zz_85[6] = _zz_84;
    _zz_85[5] = _zz_84;
    _zz_85[4] = _zz_84;
    _zz_85[3] = _zz_84;
    _zz_85[2] = _zz_84;
    _zz_85[1] = _zz_84;
    _zz_85[0] = _zz_84;
  end

  assign IBusSimplePlugin_decompressor_output_valid = (IBusSimplePlugin_decompressor_input_valid && (! ((IBusSimplePlugin_decompressor_throw2Bytes && (! IBusSimplePlugin_decompressor_bufferValid)) && (! IBusSimplePlugin_decompressor_isInputHighRvc))));
  assign IBusSimplePlugin_decompressor_output_payload_pc = IBusSimplePlugin_decompressor_input_payload_pc;
  assign IBusSimplePlugin_decompressor_output_payload_isRvc = IBusSimplePlugin_decompressor_isRvc;
  assign IBusSimplePlugin_decompressor_output_payload_rsp_inst = (IBusSimplePlugin_decompressor_isRvc ? IBusSimplePlugin_decompressor_decompressed : IBusSimplePlugin_decompressor_raw);
  assign IBusSimplePlugin_decompressor_input_ready = (IBusSimplePlugin_decompressor_output_ready && (((! IBusSimplePlugin_iBusRsp_stages_1_input_valid) || IBusSimplePlugin_decompressor_flushNext) || ((! (IBusSimplePlugin_decompressor_bufferValid && IBusSimplePlugin_decompressor_isInputHighRvc)) && (! (((! IBusSimplePlugin_decompressor_unaligned) && IBusSimplePlugin_decompressor_isInputLowRvc) && IBusSimplePlugin_decompressor_isInputHighRvc)))));
  assign IBusSimplePlugin_decompressor_bufferFill = (((((! IBusSimplePlugin_decompressor_unaligned) && IBusSimplePlugin_decompressor_isInputLowRvc) && (! IBusSimplePlugin_decompressor_isInputHighRvc)) || (IBusSimplePlugin_decompressor_bufferValid && (! IBusSimplePlugin_decompressor_isInputHighRvc))) || ((IBusSimplePlugin_decompressor_throw2Bytes && (! IBusSimplePlugin_decompressor_isRvc)) && (! IBusSimplePlugin_decompressor_isInputHighRvc)));
  assign IBusSimplePlugin_decompressor_output_ready = ((1'b0 && (! IBusSimplePlugin_injector_decodeInput_valid)) || IBusSimplePlugin_injector_decodeInput_ready);
  assign IBusSimplePlugin_injector_decodeInput_valid = _zz_86;
  assign IBusSimplePlugin_injector_decodeInput_payload_pc = _zz_87;
  assign IBusSimplePlugin_injector_decodeInput_payload_rsp_error = _zz_88;
  assign IBusSimplePlugin_injector_decodeInput_payload_rsp_inst = _zz_89;
  assign IBusSimplePlugin_injector_decodeInput_payload_isRvc = _zz_90;
  assign IBusSimplePlugin_pcValids_0 = IBusSimplePlugin_injector_nextPcCalc_valids_0;
  assign IBusSimplePlugin_pcValids_1 = IBusSimplePlugin_injector_nextPcCalc_valids_1;
  assign IBusSimplePlugin_pcValids_2 = IBusSimplePlugin_injector_nextPcCalc_valids_2;
  assign IBusSimplePlugin_pcValids_3 = IBusSimplePlugin_injector_nextPcCalc_valids_3;
  assign IBusSimplePlugin_injector_decodeInput_ready = (! decode_arbitration_isStuck);
  always @ (*) begin
    decode_arbitration_isValid = IBusSimplePlugin_injector_decodeInput_valid;
    case(_zz_157)
      3'b000 : begin
      end
      3'b001 : begin
      end
      3'b010 : begin
        decode_arbitration_isValid = 1'b1;
      end
      3'b011 : begin
        decode_arbitration_isValid = 1'b1;
      end
      3'b100 : begin
      end
      default : begin
      end
    endcase
  end

  assign _zz_91 = _zz_245[11];
  always @ (*) begin
    _zz_92[18] = _zz_91;
    _zz_92[17] = _zz_91;
    _zz_92[16] = _zz_91;
    _zz_92[15] = _zz_91;
    _zz_92[14] = _zz_91;
    _zz_92[13] = _zz_91;
    _zz_92[12] = _zz_91;
    _zz_92[11] = _zz_91;
    _zz_92[10] = _zz_91;
    _zz_92[9] = _zz_91;
    _zz_92[8] = _zz_91;
    _zz_92[7] = _zz_91;
    _zz_92[6] = _zz_91;
    _zz_92[5] = _zz_91;
    _zz_92[4] = _zz_91;
    _zz_92[3] = _zz_91;
    _zz_92[2] = _zz_91;
    _zz_92[1] = _zz_91;
    _zz_92[0] = _zz_91;
  end

  assign IBusSimplePlugin_decodePrediction_cmd_hadBranch = ((decode_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JAL) || ((decode_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_B) && _zz_246[31]));
  assign IBusSimplePlugin_predictionJumpInterface_valid = (decode_arbitration_isValid && IBusSimplePlugin_decodePrediction_cmd_hadBranch);
  assign _zz_93 = _zz_247[19];
  always @ (*) begin
    _zz_94[10] = _zz_93;
    _zz_94[9] = _zz_93;
    _zz_94[8] = _zz_93;
    _zz_94[7] = _zz_93;
    _zz_94[6] = _zz_93;
    _zz_94[5] = _zz_93;
    _zz_94[4] = _zz_93;
    _zz_94[3] = _zz_93;
    _zz_94[2] = _zz_93;
    _zz_94[1] = _zz_93;
    _zz_94[0] = _zz_93;
  end

  assign _zz_95 = _zz_248[11];
  always @ (*) begin
    _zz_96[18] = _zz_95;
    _zz_96[17] = _zz_95;
    _zz_96[16] = _zz_95;
    _zz_96[15] = _zz_95;
    _zz_96[14] = _zz_95;
    _zz_96[13] = _zz_95;
    _zz_96[12] = _zz_95;
    _zz_96[11] = _zz_95;
    _zz_96[10] = _zz_95;
    _zz_96[9] = _zz_95;
    _zz_96[8] = _zz_95;
    _zz_96[7] = _zz_95;
    _zz_96[6] = _zz_95;
    _zz_96[5] = _zz_95;
    _zz_96[4] = _zz_95;
    _zz_96[3] = _zz_95;
    _zz_96[2] = _zz_95;
    _zz_96[1] = _zz_95;
    _zz_96[0] = _zz_95;
  end

  assign IBusSimplePlugin_predictionJumpInterface_payload = (decode_PC + ((decode_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JAL) ? {{_zz_94,{{{_zz_326,_zz_327},_zz_328},decode_INSTRUCTION[30 : 21]}},1'b0} : {{_zz_96,{{{_zz_329,_zz_330},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0}));
  assign IBusSimplePlugin_cmd_s2mPipe_valid = (IBusSimplePlugin_cmd_valid || IBusSimplePlugin_cmd_s2mPipe_rValid);
  assign IBusSimplePlugin_cmd_ready = (! IBusSimplePlugin_cmd_s2mPipe_rValid);
  assign IBusSimplePlugin_cmd_s2mPipe_payload_pc = (IBusSimplePlugin_cmd_s2mPipe_rValid ? IBusSimplePlugin_cmd_s2mPipe_rData_pc : IBusSimplePlugin_cmd_payload_pc);
  assign iBus_cmd_valid = IBusSimplePlugin_cmd_s2mPipe_valid;
  assign IBusSimplePlugin_cmd_s2mPipe_ready = iBus_cmd_ready;
  assign iBus_cmd_payload_pc = IBusSimplePlugin_cmd_s2mPipe_payload_pc;
  assign IBusSimplePlugin_pending_next = (_zz_249 - _zz_253);
  assign IBusSimplePlugin_cmdFork_canEmit = (IBusSimplePlugin_iBusRsp_stages_0_output_ready && (IBusSimplePlugin_pending_value != (3'b111)));
  assign IBusSimplePlugin_cmd_valid = (IBusSimplePlugin_iBusRsp_stages_0_input_valid && IBusSimplePlugin_cmdFork_canEmit);
  assign IBusSimplePlugin_pending_inc = (IBusSimplePlugin_cmd_valid && IBusSimplePlugin_cmd_ready);
  assign IBusSimplePlugin_cmd_payload_pc = {IBusSimplePlugin_iBusRsp_stages_0_input_payload[31 : 2],(2'b00)};
  assign IBusSimplePlugin_rspJoin_rspBuffer_flush = ((IBusSimplePlugin_rspJoin_rspBuffer_discardCounter != (3'b000)) || IBusSimplePlugin_iBusRsp_flush);
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_valid = (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid && (IBusSimplePlugin_rspJoin_rspBuffer_discardCounter == (3'b000)));
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_payload_error = IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_error;
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_payload_inst = IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_inst;
  assign _zz_165 = (IBusSimplePlugin_rspJoin_rspBuffer_output_ready || IBusSimplePlugin_rspJoin_rspBuffer_flush);
  assign IBusSimplePlugin_pending_dec = (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid && _zz_165);
  assign IBusSimplePlugin_rspJoin_fetchRsp_pc = IBusSimplePlugin_iBusRsp_stages_1_output_payload;
  always @ (*) begin
    IBusSimplePlugin_rspJoin_fetchRsp_rsp_error = IBusSimplePlugin_rspJoin_rspBuffer_output_payload_error;
    if((! IBusSimplePlugin_rspJoin_rspBuffer_output_valid))begin
      IBusSimplePlugin_rspJoin_fetchRsp_rsp_error = 1'b0;
    end
  end

  assign IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst = IBusSimplePlugin_rspJoin_rspBuffer_output_payload_inst;
  assign IBusSimplePlugin_rspJoin_exceptionDetected = 1'b0;
  assign IBusSimplePlugin_rspJoin_join_valid = (IBusSimplePlugin_iBusRsp_stages_1_output_valid && IBusSimplePlugin_rspJoin_rspBuffer_output_valid);
  assign IBusSimplePlugin_rspJoin_join_payload_pc = IBusSimplePlugin_rspJoin_fetchRsp_pc;
  assign IBusSimplePlugin_rspJoin_join_payload_rsp_error = IBusSimplePlugin_rspJoin_fetchRsp_rsp_error;
  assign IBusSimplePlugin_rspJoin_join_payload_rsp_inst = IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst;
  assign IBusSimplePlugin_rspJoin_join_payload_isRvc = IBusSimplePlugin_rspJoin_fetchRsp_isRvc;
  assign IBusSimplePlugin_iBusRsp_stages_1_output_ready = (IBusSimplePlugin_iBusRsp_stages_1_output_valid ? (IBusSimplePlugin_rspJoin_join_valid && IBusSimplePlugin_rspJoin_join_ready) : IBusSimplePlugin_rspJoin_join_ready);
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_ready = (IBusSimplePlugin_rspJoin_join_valid && IBusSimplePlugin_rspJoin_join_ready);
  assign _zz_97 = (! IBusSimplePlugin_rspJoin_exceptionDetected);
  assign IBusSimplePlugin_rspJoin_join_ready = (IBusSimplePlugin_iBusRsp_output_ready && _zz_97);
  assign IBusSimplePlugin_iBusRsp_output_valid = (IBusSimplePlugin_rspJoin_join_valid && _zz_97);
  assign IBusSimplePlugin_iBusRsp_output_payload_pc = IBusSimplePlugin_rspJoin_join_payload_pc;
  assign IBusSimplePlugin_iBusRsp_output_payload_rsp_error = IBusSimplePlugin_rspJoin_join_payload_rsp_error;
  assign IBusSimplePlugin_iBusRsp_output_payload_rsp_inst = IBusSimplePlugin_rspJoin_join_payload_rsp_inst;
  assign IBusSimplePlugin_iBusRsp_output_payload_isRvc = IBusSimplePlugin_rspJoin_join_payload_isRvc;
  assign _zz_98 = 1'b0;
  always @ (*) begin
    execute_DBusSimplePlugin_skipCmd = 1'b0;
    if(execute_ALIGNEMENT_FAULT)begin
      execute_DBusSimplePlugin_skipCmd = 1'b1;
    end
  end

  assign dBus_cmd_valid = (((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! execute_arbitration_isStuckByOthers)) && (! execute_arbitration_isFlushed)) && (! execute_DBusSimplePlugin_skipCmd)) && (! _zz_98));
  assign dBus_cmd_payload_wr = execute_MEMORY_STORE;
  assign dBus_cmd_payload_size = execute_INSTRUCTION[13 : 12];
  always @ (*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_99 = {{{execute_RS2[7 : 0],execute_RS2[7 : 0]},execute_RS2[7 : 0]},execute_RS2[7 : 0]};
      end
      2'b01 : begin
        _zz_99 = {execute_RS2[15 : 0],execute_RS2[15 : 0]};
      end
      default : begin
        _zz_99 = execute_RS2[31 : 0];
      end
    endcase
  end

  assign dBus_cmd_payload_data = _zz_99;
  always @ (*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_100 = (4'b0001);
      end
      2'b01 : begin
        _zz_100 = (4'b0011);
      end
      default : begin
        _zz_100 = (4'b1111);
      end
    endcase
  end

  assign execute_DBusSimplePlugin_formalMask = (_zz_100 <<< dBus_cmd_payload_address[1 : 0]);
  assign dBus_cmd_payload_address = execute_SRC_ADD;
  always @ (*) begin
    writeBack_DBusSimplePlugin_rspShifted = writeBack_MEMORY_READ_DATA;
    case(writeBack_MEMORY_ADDRESS_LOW)
      2'b01 : begin
        writeBack_DBusSimplePlugin_rspShifted[7 : 0] = writeBack_MEMORY_READ_DATA[15 : 8];
      end
      2'b10 : begin
        writeBack_DBusSimplePlugin_rspShifted[15 : 0] = writeBack_MEMORY_READ_DATA[31 : 16];
      end
      2'b11 : begin
        writeBack_DBusSimplePlugin_rspShifted[7 : 0] = writeBack_MEMORY_READ_DATA[31 : 24];
      end
      default : begin
      end
    endcase
  end

  assign _zz_101 = (writeBack_DBusSimplePlugin_rspShifted[7] && (! writeBack_INSTRUCTION[14]));
  always @ (*) begin
    _zz_102[31] = _zz_101;
    _zz_102[30] = _zz_101;
    _zz_102[29] = _zz_101;
    _zz_102[28] = _zz_101;
    _zz_102[27] = _zz_101;
    _zz_102[26] = _zz_101;
    _zz_102[25] = _zz_101;
    _zz_102[24] = _zz_101;
    _zz_102[23] = _zz_101;
    _zz_102[22] = _zz_101;
    _zz_102[21] = _zz_101;
    _zz_102[20] = _zz_101;
    _zz_102[19] = _zz_101;
    _zz_102[18] = _zz_101;
    _zz_102[17] = _zz_101;
    _zz_102[16] = _zz_101;
    _zz_102[15] = _zz_101;
    _zz_102[14] = _zz_101;
    _zz_102[13] = _zz_101;
    _zz_102[12] = _zz_101;
    _zz_102[11] = _zz_101;
    _zz_102[10] = _zz_101;
    _zz_102[9] = _zz_101;
    _zz_102[8] = _zz_101;
    _zz_102[7 : 0] = writeBack_DBusSimplePlugin_rspShifted[7 : 0];
  end

  assign _zz_103 = (writeBack_DBusSimplePlugin_rspShifted[15] && (! writeBack_INSTRUCTION[14]));
  always @ (*) begin
    _zz_104[31] = _zz_103;
    _zz_104[30] = _zz_103;
    _zz_104[29] = _zz_103;
    _zz_104[28] = _zz_103;
    _zz_104[27] = _zz_103;
    _zz_104[26] = _zz_103;
    _zz_104[25] = _zz_103;
    _zz_104[24] = _zz_103;
    _zz_104[23] = _zz_103;
    _zz_104[22] = _zz_103;
    _zz_104[21] = _zz_103;
    _zz_104[20] = _zz_103;
    _zz_104[19] = _zz_103;
    _zz_104[18] = _zz_103;
    _zz_104[17] = _zz_103;
    _zz_104[16] = _zz_103;
    _zz_104[15 : 0] = writeBack_DBusSimplePlugin_rspShifted[15 : 0];
  end

  always @ (*) begin
    case(_zz_204)
      2'b00 : begin
        writeBack_DBusSimplePlugin_rspFormated = _zz_102;
      end
      2'b01 : begin
        writeBack_DBusSimplePlugin_rspFormated = _zz_104;
      end
      default : begin
        writeBack_DBusSimplePlugin_rspFormated = writeBack_DBusSimplePlugin_rspShifted;
      end
    endcase
  end

  assign _zz_106 = ((decode_INSTRUCTION & 32'h00004050) == 32'h00004050);
  assign _zz_107 = ((decode_INSTRUCTION & 32'h00006004) == 32'h00002000);
  assign _zz_108 = ((decode_INSTRUCTION & 32'h00000004) == 32'h00000004);
  assign _zz_109 = ((decode_INSTRUCTION & 32'h00000048) == 32'h00000048);
  assign _zz_110 = ((decode_INSTRUCTION & 32'h00001000) == 32'h0);
  assign _zz_105 = {(((decode_INSTRUCTION & _zz_331) == 32'h00100050) != (1'b0)),{((_zz_332 == _zz_333) != (1'b0)),{(_zz_334 != (1'b0)),{(_zz_335 != _zz_336),{_zz_337,{_zz_338,_zz_339}}}}}};
  assign _zz_111 = _zz_105[1 : 0];
  assign _zz_45 = _zz_111;
  assign _zz_112 = _zz_105[6 : 5];
  assign _zz_44 = _zz_112;
  assign _zz_113 = _zz_105[13 : 12];
  assign _zz_43 = _zz_113;
  assign _zz_114 = _zz_105[16 : 15];
  assign _zz_42 = _zz_114;
  assign _zz_115 = _zz_105[19 : 18];
  assign _zz_41 = _zz_115;
  assign _zz_116 = _zz_105[26 : 25];
  assign _zz_40 = _zz_116;
  assign _zz_117 = _zz_105[29 : 28];
  assign _zz_39 = _zz_117;
  assign decodeExceptionPort_valid = (decode_arbitration_isValid && (! decode_LEGAL_INSTRUCTION));
  assign decodeExceptionPort_payload_code = (4'b0010);
  assign decodeExceptionPort_payload_badAddr = decode_INSTRUCTION;
  assign decode_RegFilePlugin_regFileReadAddress1 = decode_INSTRUCTION_ANTICIPATED[19 : 15];
  assign decode_RegFilePlugin_regFileReadAddress2 = decode_INSTRUCTION_ANTICIPATED[24 : 20];
  assign decode_RegFilePlugin_rs1Data = _zz_167;
  assign decode_RegFilePlugin_rs2Data = _zz_168;
  always @ (*) begin
    lastStageRegFileWrite_valid = (_zz_37 && writeBack_arbitration_isFiring);
    if((lastStageRegFileWrite_payload_address == 5'h0))begin
      lastStageRegFileWrite_valid = 1'b0;
    end
  end

  assign lastStageRegFileWrite_payload_address = _zz_36[11 : 7];
  assign lastStageRegFileWrite_payload_data = _zz_46;
  always @ (*) begin
    case(execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 & execute_SRC2);
      end
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 | execute_SRC2);
      end
      default : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 ^ execute_SRC2);
      end
    endcase
  end

  always @ (*) begin
    case(execute_ALU_CTRL)
      `AluCtrlEnum_defaultEncoding_BITWISE : begin
        _zz_118 = execute_IntAluPlugin_bitwise;
      end
      `AluCtrlEnum_defaultEncoding_SLT_SLTU : begin
        _zz_118 = {31'd0, _zz_258};
      end
      default : begin
        _zz_118 = execute_SRC_ADD_SUB;
      end
    endcase
  end

  always @ (*) begin
    case(decode_SRC1_CTRL)
      `Src1CtrlEnum_defaultEncoding_RS : begin
        _zz_119 = _zz_32;
      end
      `Src1CtrlEnum_defaultEncoding_PC_INCREMENT : begin
        _zz_119 = {29'd0, _zz_259};
      end
      `Src1CtrlEnum_defaultEncoding_IMU : begin
        _zz_119 = {decode_INSTRUCTION[31 : 12],12'h0};
      end
      default : begin
        _zz_119 = {27'd0, _zz_260};
      end
    endcase
  end

  assign _zz_120 = _zz_261[11];
  always @ (*) begin
    _zz_121[19] = _zz_120;
    _zz_121[18] = _zz_120;
    _zz_121[17] = _zz_120;
    _zz_121[16] = _zz_120;
    _zz_121[15] = _zz_120;
    _zz_121[14] = _zz_120;
    _zz_121[13] = _zz_120;
    _zz_121[12] = _zz_120;
    _zz_121[11] = _zz_120;
    _zz_121[10] = _zz_120;
    _zz_121[9] = _zz_120;
    _zz_121[8] = _zz_120;
    _zz_121[7] = _zz_120;
    _zz_121[6] = _zz_120;
    _zz_121[5] = _zz_120;
    _zz_121[4] = _zz_120;
    _zz_121[3] = _zz_120;
    _zz_121[2] = _zz_120;
    _zz_121[1] = _zz_120;
    _zz_121[0] = _zz_120;
  end

  assign _zz_122 = _zz_262[11];
  always @ (*) begin
    _zz_123[19] = _zz_122;
    _zz_123[18] = _zz_122;
    _zz_123[17] = _zz_122;
    _zz_123[16] = _zz_122;
    _zz_123[15] = _zz_122;
    _zz_123[14] = _zz_122;
    _zz_123[13] = _zz_122;
    _zz_123[12] = _zz_122;
    _zz_123[11] = _zz_122;
    _zz_123[10] = _zz_122;
    _zz_123[9] = _zz_122;
    _zz_123[8] = _zz_122;
    _zz_123[7] = _zz_122;
    _zz_123[6] = _zz_122;
    _zz_123[5] = _zz_122;
    _zz_123[4] = _zz_122;
    _zz_123[3] = _zz_122;
    _zz_123[2] = _zz_122;
    _zz_123[1] = _zz_122;
    _zz_123[0] = _zz_122;
  end

  always @ (*) begin
    case(decode_SRC2_CTRL)
      `Src2CtrlEnum_defaultEncoding_RS : begin
        _zz_124 = _zz_30;
      end
      `Src2CtrlEnum_defaultEncoding_IMI : begin
        _zz_124 = {_zz_121,decode_INSTRUCTION[31 : 20]};
      end
      `Src2CtrlEnum_defaultEncoding_IMS : begin
        _zz_124 = {_zz_123,{decode_INSTRUCTION[31 : 25],decode_INSTRUCTION[11 : 7]}};
      end
      default : begin
        _zz_124 = _zz_29;
      end
    endcase
  end

  always @ (*) begin
    execute_SrcPlugin_addSub = _zz_263;
    if(execute_SRC2_FORCE_ZERO)begin
      execute_SrcPlugin_addSub = execute_SRC1;
    end
  end

  assign execute_SrcPlugin_less = ((execute_SRC1[31] == execute_SRC2[31]) ? execute_SrcPlugin_addSub[31] : (execute_SRC_LESS_UNSIGNED ? execute_SRC2[31] : execute_SRC1[31]));
  assign execute_FullBarrelShifterPlugin_amplitude = execute_SRC2[4 : 0];
  always @ (*) begin
    _zz_125[0] = execute_SRC1[31];
    _zz_125[1] = execute_SRC1[30];
    _zz_125[2] = execute_SRC1[29];
    _zz_125[3] = execute_SRC1[28];
    _zz_125[4] = execute_SRC1[27];
    _zz_125[5] = execute_SRC1[26];
    _zz_125[6] = execute_SRC1[25];
    _zz_125[7] = execute_SRC1[24];
    _zz_125[8] = execute_SRC1[23];
    _zz_125[9] = execute_SRC1[22];
    _zz_125[10] = execute_SRC1[21];
    _zz_125[11] = execute_SRC1[20];
    _zz_125[12] = execute_SRC1[19];
    _zz_125[13] = execute_SRC1[18];
    _zz_125[14] = execute_SRC1[17];
    _zz_125[15] = execute_SRC1[16];
    _zz_125[16] = execute_SRC1[15];
    _zz_125[17] = execute_SRC1[14];
    _zz_125[18] = execute_SRC1[13];
    _zz_125[19] = execute_SRC1[12];
    _zz_125[20] = execute_SRC1[11];
    _zz_125[21] = execute_SRC1[10];
    _zz_125[22] = execute_SRC1[9];
    _zz_125[23] = execute_SRC1[8];
    _zz_125[24] = execute_SRC1[7];
    _zz_125[25] = execute_SRC1[6];
    _zz_125[26] = execute_SRC1[5];
    _zz_125[27] = execute_SRC1[4];
    _zz_125[28] = execute_SRC1[3];
    _zz_125[29] = execute_SRC1[2];
    _zz_125[30] = execute_SRC1[1];
    _zz_125[31] = execute_SRC1[0];
  end

  assign execute_FullBarrelShifterPlugin_reversed = ((execute_SHIFT_CTRL == `ShiftCtrlEnum_defaultEncoding_SLL_1) ? _zz_125 : execute_SRC1);
  always @ (*) begin
    _zz_126[0] = memory_SHIFT_RIGHT[31];
    _zz_126[1] = memory_SHIFT_RIGHT[30];
    _zz_126[2] = memory_SHIFT_RIGHT[29];
    _zz_126[3] = memory_SHIFT_RIGHT[28];
    _zz_126[4] = memory_SHIFT_RIGHT[27];
    _zz_126[5] = memory_SHIFT_RIGHT[26];
    _zz_126[6] = memory_SHIFT_RIGHT[25];
    _zz_126[7] = memory_SHIFT_RIGHT[24];
    _zz_126[8] = memory_SHIFT_RIGHT[23];
    _zz_126[9] = memory_SHIFT_RIGHT[22];
    _zz_126[10] = memory_SHIFT_RIGHT[21];
    _zz_126[11] = memory_SHIFT_RIGHT[20];
    _zz_126[12] = memory_SHIFT_RIGHT[19];
    _zz_126[13] = memory_SHIFT_RIGHT[18];
    _zz_126[14] = memory_SHIFT_RIGHT[17];
    _zz_126[15] = memory_SHIFT_RIGHT[16];
    _zz_126[16] = memory_SHIFT_RIGHT[15];
    _zz_126[17] = memory_SHIFT_RIGHT[14];
    _zz_126[18] = memory_SHIFT_RIGHT[13];
    _zz_126[19] = memory_SHIFT_RIGHT[12];
    _zz_126[20] = memory_SHIFT_RIGHT[11];
    _zz_126[21] = memory_SHIFT_RIGHT[10];
    _zz_126[22] = memory_SHIFT_RIGHT[9];
    _zz_126[23] = memory_SHIFT_RIGHT[8];
    _zz_126[24] = memory_SHIFT_RIGHT[7];
    _zz_126[25] = memory_SHIFT_RIGHT[6];
    _zz_126[26] = memory_SHIFT_RIGHT[5];
    _zz_126[27] = memory_SHIFT_RIGHT[4];
    _zz_126[28] = memory_SHIFT_RIGHT[3];
    _zz_126[29] = memory_SHIFT_RIGHT[2];
    _zz_126[30] = memory_SHIFT_RIGHT[1];
    _zz_126[31] = memory_SHIFT_RIGHT[0];
  end

  assign execute_MulPlugin_a = execute_RS1;
  assign execute_MulPlugin_b = execute_RS2;
  always @ (*) begin
    case(_zz_183)
      2'b01 : begin
        execute_MulPlugin_aSigned = 1'b1;
      end
      2'b10 : begin
        execute_MulPlugin_aSigned = 1'b1;
      end
      default : begin
        execute_MulPlugin_aSigned = 1'b0;
      end
    endcase
  end

  always @ (*) begin
    case(_zz_183)
      2'b01 : begin
        execute_MulPlugin_bSigned = 1'b1;
      end
      2'b10 : begin
        execute_MulPlugin_bSigned = 1'b0;
      end
      default : begin
        execute_MulPlugin_bSigned = 1'b0;
      end
    endcase
  end

  assign execute_MulPlugin_aULow = execute_MulPlugin_a[15 : 0];
  assign execute_MulPlugin_bULow = execute_MulPlugin_b[15 : 0];
  assign execute_MulPlugin_aSLow = {1'b0,execute_MulPlugin_a[15 : 0]};
  assign execute_MulPlugin_bSLow = {1'b0,execute_MulPlugin_b[15 : 0]};
  assign execute_MulPlugin_aHigh = {(execute_MulPlugin_aSigned && execute_MulPlugin_a[31]),execute_MulPlugin_a[31 : 16]};
  assign execute_MulPlugin_bHigh = {(execute_MulPlugin_bSigned && execute_MulPlugin_b[31]),execute_MulPlugin_b[31 : 16]};
  assign writeBack_MulPlugin_result = ($signed(_zz_270) + $signed(_zz_271));
  assign memory_DivPlugin_frontendOk = 1'b1;
  always @ (*) begin
    memory_DivPlugin_div_counter_willIncrement = 1'b0;
    if(_zz_175)begin
      if(_zz_184)begin
        memory_DivPlugin_div_counter_willIncrement = 1'b1;
      end
    end
  end

  always @ (*) begin
    memory_DivPlugin_div_counter_willClear = 1'b0;
    if(_zz_185)begin
      memory_DivPlugin_div_counter_willClear = 1'b1;
    end
  end

  assign memory_DivPlugin_div_counter_willOverflowIfInc = (memory_DivPlugin_div_counter_value == 6'h21);
  assign memory_DivPlugin_div_counter_willOverflow = (memory_DivPlugin_div_counter_willOverflowIfInc && memory_DivPlugin_div_counter_willIncrement);
  always @ (*) begin
    if(memory_DivPlugin_div_counter_willOverflow)begin
      memory_DivPlugin_div_counter_valueNext = 6'h0;
    end else begin
      memory_DivPlugin_div_counter_valueNext = (memory_DivPlugin_div_counter_value + _zz_275);
    end
    if(memory_DivPlugin_div_counter_willClear)begin
      memory_DivPlugin_div_counter_valueNext = 6'h0;
    end
  end

  assign _zz_127 = memory_DivPlugin_rs1[31 : 0];
  assign memory_DivPlugin_div_stage_0_remainderShifted = {memory_DivPlugin_accumulator[31 : 0],_zz_127[31]};
  assign memory_DivPlugin_div_stage_0_remainderMinusDenominator = (memory_DivPlugin_div_stage_0_remainderShifted - _zz_276);
  assign memory_DivPlugin_div_stage_0_outRemainder = ((! memory_DivPlugin_div_stage_0_remainderMinusDenominator[32]) ? _zz_277 : _zz_278);
  assign memory_DivPlugin_div_stage_0_outNumerator = _zz_279[31:0];
  assign _zz_128 = (memory_INSTRUCTION[13] ? memory_DivPlugin_accumulator[31 : 0] : memory_DivPlugin_rs1[31 : 0]);
  assign _zz_129 = (execute_RS2[31] && execute_IS_RS2_SIGNED);
  assign _zz_130 = (1'b0 || ((execute_IS_DIV && execute_RS1[31]) && execute_IS_RS1_SIGNED));
  always @ (*) begin
    _zz_131[32] = (execute_IS_RS1_SIGNED && execute_RS1[31]);
    _zz_131[31 : 0] = execute_RS1;
  end

  always @ (*) begin
    _zz_132 = 1'b0;
    if(_zz_186)begin
      if(_zz_187)begin
        if(_zz_137)begin
          _zz_132 = 1'b1;
        end
      end
    end
    if(_zz_188)begin
      if(_zz_189)begin
        if(_zz_139)begin
          _zz_132 = 1'b1;
        end
      end
    end
    if(_zz_190)begin
      if(_zz_191)begin
        if(_zz_141)begin
          _zz_132 = 1'b1;
        end
      end
    end
    if((! decode_RS1_USE))begin
      _zz_132 = 1'b0;
    end
  end

  always @ (*) begin
    _zz_133 = 1'b0;
    if(_zz_186)begin
      if(_zz_187)begin
        if(_zz_138)begin
          _zz_133 = 1'b1;
        end
      end
    end
    if(_zz_188)begin
      if(_zz_189)begin
        if(_zz_140)begin
          _zz_133 = 1'b1;
        end
      end
    end
    if(_zz_190)begin
      if(_zz_191)begin
        if(_zz_142)begin
          _zz_133 = 1'b1;
        end
      end
    end
    if((! decode_RS2_USE))begin
      _zz_133 = 1'b0;
    end
  end

  assign _zz_137 = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_138 = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign _zz_139 = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_140 = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign _zz_141 = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign _zz_142 = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign execute_BranchPlugin_eq = (execute_SRC1 == execute_SRC2);
  assign _zz_143 = execute_INSTRUCTION[14 : 12];
  always @ (*) begin
    if((_zz_143 == (3'b000))) begin
        _zz_144 = execute_BranchPlugin_eq;
    end else if((_zz_143 == (3'b001))) begin
        _zz_144 = (! execute_BranchPlugin_eq);
    end else if((((_zz_143 & (3'b101)) == (3'b101)))) begin
        _zz_144 = (! execute_SRC_LESS);
    end else begin
        _zz_144 = execute_SRC_LESS;
    end
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_INC : begin
        _zz_145 = 1'b0;
      end
      `BranchCtrlEnum_defaultEncoding_JAL : begin
        _zz_145 = 1'b1;
      end
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        _zz_145 = 1'b1;
      end
      default : begin
        _zz_145 = _zz_144;
      end
    endcase
  end

  assign execute_BranchPlugin_missAlignedTarget = 1'b0;
  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        execute_BranchPlugin_branch_src1 = execute_RS1;
      end
      default : begin
        execute_BranchPlugin_branch_src1 = execute_PC;
      end
    endcase
  end

  assign _zz_146 = _zz_289[11];
  always @ (*) begin
    _zz_147[19] = _zz_146;
    _zz_147[18] = _zz_146;
    _zz_147[17] = _zz_146;
    _zz_147[16] = _zz_146;
    _zz_147[15] = _zz_146;
    _zz_147[14] = _zz_146;
    _zz_147[13] = _zz_146;
    _zz_147[12] = _zz_146;
    _zz_147[11] = _zz_146;
    _zz_147[10] = _zz_146;
    _zz_147[9] = _zz_146;
    _zz_147[8] = _zz_146;
    _zz_147[7] = _zz_146;
    _zz_147[6] = _zz_146;
    _zz_147[5] = _zz_146;
    _zz_147[4] = _zz_146;
    _zz_147[3] = _zz_146;
    _zz_147[2] = _zz_146;
    _zz_147[1] = _zz_146;
    _zz_147[0] = _zz_146;
  end

  always @ (*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_defaultEncoding_JALR : begin
        execute_BranchPlugin_branch_src2 = {_zz_147,execute_INSTRUCTION[31 : 20]};
      end
      default : begin
        execute_BranchPlugin_branch_src2 = ((execute_BRANCH_CTRL == `BranchCtrlEnum_defaultEncoding_JAL) ? {{_zz_149,{{{_zz_481,execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0} : {{_zz_151,{{{_zz_482,_zz_483},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0});
        if(execute_PREDICTION_HAD_BRANCHED2)begin
          execute_BranchPlugin_branch_src2 = {29'd0, _zz_292};
        end
      end
    endcase
  end

  assign _zz_148 = _zz_290[19];
  always @ (*) begin
    _zz_149[10] = _zz_148;
    _zz_149[9] = _zz_148;
    _zz_149[8] = _zz_148;
    _zz_149[7] = _zz_148;
    _zz_149[6] = _zz_148;
    _zz_149[5] = _zz_148;
    _zz_149[4] = _zz_148;
    _zz_149[3] = _zz_148;
    _zz_149[2] = _zz_148;
    _zz_149[1] = _zz_148;
    _zz_149[0] = _zz_148;
  end

  assign _zz_150 = _zz_291[11];
  always @ (*) begin
    _zz_151[18] = _zz_150;
    _zz_151[17] = _zz_150;
    _zz_151[16] = _zz_150;
    _zz_151[15] = _zz_150;
    _zz_151[14] = _zz_150;
    _zz_151[13] = _zz_150;
    _zz_151[12] = _zz_150;
    _zz_151[11] = _zz_150;
    _zz_151[10] = _zz_150;
    _zz_151[9] = _zz_150;
    _zz_151[8] = _zz_150;
    _zz_151[7] = _zz_150;
    _zz_151[6] = _zz_150;
    _zz_151[5] = _zz_150;
    _zz_151[4] = _zz_150;
    _zz_151[3] = _zz_150;
    _zz_151[2] = _zz_150;
    _zz_151[1] = _zz_150;
    _zz_151[0] = _zz_150;
  end

  assign execute_BranchPlugin_branchAdder = (execute_BranchPlugin_branch_src1 + execute_BranchPlugin_branch_src2);
  assign BranchPlugin_jumpInterface_valid = ((memory_arbitration_isValid && memory_BRANCH_DO) && (! 1'b0));
  assign BranchPlugin_jumpInterface_payload = memory_BRANCH_CALC;
  assign IBusSimplePlugin_decodePrediction_rsp_wasWrong = BranchPlugin_jumpInterface_valid;
  always @ (*) begin
    CsrPlugin_privilege = (2'b11);
    if(CsrPlugin_forceMachineWire)begin
      CsrPlugin_privilege = (2'b11);
    end
  end

  assign CsrPlugin_misa_base = (2'b01);
  assign CsrPlugin_misa_extensions = 26'h0;
  assign _zz_152 = (CsrPlugin_mip_MTIP && CsrPlugin_mie_MTIE);
  assign _zz_153 = (CsrPlugin_mip_MSIP && CsrPlugin_mie_MSIE);
  assign _zz_154 = (CsrPlugin_mip_MEIP && CsrPlugin_mie_MEIE);
  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = (2'b11);
  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege = ((CsrPlugin_privilege < CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped) ? CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped : CsrPlugin_privilege);
  always @ (*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_decode = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
    if(decodeExceptionPort_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_decode = 1'b1;
    end
    if(decode_arbitration_isFlushed)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_decode = 1'b0;
    end
  end

  always @ (*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_execute = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
    if(CsrPlugin_selfException_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_execute = 1'b1;
    end
    if(execute_arbitration_isFlushed)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_execute = 1'b0;
    end
  end

  always @ (*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_memory = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
    if(memory_arbitration_isFlushed)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_memory = 1'b0;
    end
  end

  always @ (*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
    if(writeBack_arbitration_isFlushed)begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack = 1'b0;
    end
  end

  assign CsrPlugin_exceptionPendings_0 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  assign CsrPlugin_exceptionPendings_1 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
  assign CsrPlugin_exceptionPendings_2 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
  assign CsrPlugin_exceptionPendings_3 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
  assign CsrPlugin_exception = (CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack && CsrPlugin_allowException);
  assign CsrPlugin_lastStageWasWfi = 1'b0;
  assign CsrPlugin_pipelineLiberator_active = ((CsrPlugin_interrupt_valid && CsrPlugin_allowInterrupts) && decode_arbitration_isValid);
  always @ (*) begin
    CsrPlugin_pipelineLiberator_done = CsrPlugin_pipelineLiberator_pcValids_2;
    if(({CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack,{CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory,CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute}} != (3'b000)))begin
      CsrPlugin_pipelineLiberator_done = 1'b0;
    end
    if(CsrPlugin_hadException)begin
      CsrPlugin_pipelineLiberator_done = 1'b0;
    end
  end

  assign CsrPlugin_interruptJump = ((CsrPlugin_interrupt_valid && CsrPlugin_pipelineLiberator_done) && CsrPlugin_allowInterrupts);
  always @ (*) begin
    CsrPlugin_targetPrivilege = CsrPlugin_interrupt_targetPrivilege;
    if(CsrPlugin_hadException)begin
      CsrPlugin_targetPrivilege = CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege;
    end
  end

  always @ (*) begin
    CsrPlugin_trapCause = CsrPlugin_interrupt_code;
    if(CsrPlugin_hadException)begin
      CsrPlugin_trapCause = CsrPlugin_exceptionPortCtrl_exceptionContext_code;
    end
  end

  always @ (*) begin
    CsrPlugin_xtvec_mode = (2'bxx);
    case(CsrPlugin_targetPrivilege)
      2'b11 : begin
        CsrPlugin_xtvec_mode = CsrPlugin_mtvec_mode;
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    CsrPlugin_xtvec_base = 30'h0;
    case(CsrPlugin_targetPrivilege)
      2'b11 : begin
        CsrPlugin_xtvec_base = CsrPlugin_mtvec_base;
      end
      default : begin
      end
    endcase
  end

  assign contextSwitching = CsrPlugin_jumpInterface_valid;
  assign execute_CsrPlugin_blockedBySideEffects = ({writeBack_arbitration_isValid,memory_arbitration_isValid} != (2'b00));
  always @ (*) begin
    execute_CsrPlugin_illegalAccess = 1'b1;
    if(execute_CsrPlugin_csr_3860)begin
      if(execute_CSR_READ_OPCODE)begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_768)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_836)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_772)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_773)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_833)begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_834)begin
      if(execute_CSR_READ_OPCODE)begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_835)begin
      if(execute_CSR_READ_OPCODE)begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if((CsrPlugin_privilege < execute_CsrPlugin_csrAddress[9 : 8]))begin
      execute_CsrPlugin_illegalAccess = 1'b1;
    end
    if(((! execute_arbitration_isValid) || (! execute_IS_CSR)))begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
  end

  always @ (*) begin
    execute_CsrPlugin_illegalInstruction = 1'b0;
    if((execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_defaultEncoding_XRET)))begin
      if((CsrPlugin_privilege < execute_INSTRUCTION[29 : 28]))begin
        execute_CsrPlugin_illegalInstruction = 1'b1;
      end
    end
  end

  always @ (*) begin
    CsrPlugin_selfException_valid = 1'b0;
    if(_zz_192)begin
      CsrPlugin_selfException_valid = 1'b1;
    end
    if(_zz_193)begin
      CsrPlugin_selfException_valid = 1'b1;
    end
  end

  always @ (*) begin
    CsrPlugin_selfException_payload_code = (4'bxxxx);
    if(_zz_192)begin
      CsrPlugin_selfException_payload_code = (4'b0010);
    end
    if(_zz_193)begin
      case(CsrPlugin_privilege)
        2'b00 : begin
          CsrPlugin_selfException_payload_code = (4'b1000);
        end
        default : begin
          CsrPlugin_selfException_payload_code = (4'b1011);
        end
      endcase
    end
  end

  assign CsrPlugin_selfException_payload_badAddr = execute_INSTRUCTION;
  assign execute_CsrPlugin_writeInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_WRITE_OPCODE);
  assign execute_CsrPlugin_readInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_READ_OPCODE);
  assign execute_CsrPlugin_writeEnable = ((execute_CsrPlugin_writeInstruction && (! execute_CsrPlugin_blockedBySideEffects)) && (! execute_arbitration_isStuckByOthers));
  assign execute_CsrPlugin_readEnable = ((execute_CsrPlugin_readInstruction && (! execute_CsrPlugin_blockedBySideEffects)) && (! execute_arbitration_isStuckByOthers));
  assign execute_CsrPlugin_readToWriteData = execute_CsrPlugin_readData;
  always @ (*) begin
    case(_zz_206)
      1'b0 : begin
        execute_CsrPlugin_writeData = execute_SRC1;
      end
      default : begin
        execute_CsrPlugin_writeData = (execute_INSTRUCTION[12] ? (execute_CsrPlugin_readToWriteData & (~ execute_SRC1)) : (execute_CsrPlugin_readToWriteData | execute_SRC1));
      end
    endcase
  end

  assign execute_CsrPlugin_csrAddress = execute_INSTRUCTION[31 : 20];
  always @ (*) begin
    debug_bus_cmd_ready = 1'b1;
    if(debug_bus_cmd_valid)begin
      case(_zz_194)
        6'b000000 : begin
        end
        6'b000001 : begin
          if(debug_bus_cmd_payload_wr)begin
            debug_bus_cmd_ready = IBusSimplePlugin_injectionPort_ready;
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @ (*) begin
    debug_bus_rsp_data = DebugPlugin_busReadDataReg;
    if((! _zz_155))begin
      debug_bus_rsp_data[0] = DebugPlugin_resetIt;
      debug_bus_rsp_data[1] = DebugPlugin_haltIt;
      debug_bus_rsp_data[2] = DebugPlugin_isPipBusy;
      debug_bus_rsp_data[3] = DebugPlugin_haltedByBreak;
      debug_bus_rsp_data[4] = DebugPlugin_stepIt;
    end
  end

  always @ (*) begin
    IBusSimplePlugin_injectionPort_valid = 1'b0;
    if(debug_bus_cmd_valid)begin
      case(_zz_194)
        6'b000000 : begin
        end
        6'b000001 : begin
          if(debug_bus_cmd_payload_wr)begin
            IBusSimplePlugin_injectionPort_valid = 1'b1;
          end
        end
        default : begin
        end
      endcase
    end
  end

  assign IBusSimplePlugin_injectionPort_payload = debug_bus_cmd_payload_data;
  assign debug_resetOut = DebugPlugin_resetIt_regNext;
  assign _zz_33 = _zz_45;
  assign _zz_31 = _zz_44;
  assign _zz_20 = decode_ALU_CTRL;
  assign _zz_18 = _zz_43;
  assign _zz_34 = decode_to_execute_ALU_CTRL;
  assign _zz_17 = decode_ALU_BITWISE_CTRL;
  assign _zz_15 = _zz_42;
  assign _zz_35 = decode_to_execute_ALU_BITWISE_CTRL;
  assign _zz_14 = decode_SHIFT_CTRL;
  assign _zz_11 = execute_SHIFT_CTRL;
  assign _zz_12 = _zz_41;
  assign _zz_28 = decode_to_execute_SHIFT_CTRL;
  assign _zz_27 = execute_to_memory_SHIFT_CTRL;
  assign _zz_9 = decode_BRANCH_CTRL;
  assign _zz_47 = _zz_40;
  assign _zz_24 = decode_to_execute_BRANCH_CTRL;
  assign _zz_7 = decode_ENV_CTRL;
  assign _zz_4 = execute_ENV_CTRL;
  assign _zz_2 = memory_ENV_CTRL;
  assign _zz_5 = _zz_39;
  assign _zz_22 = decode_to_execute_ENV_CTRL;
  assign _zz_21 = execute_to_memory_ENV_CTRL;
  assign _zz_23 = memory_to_writeBack_ENV_CTRL;
  assign decode_arbitration_isFlushed = (({writeBack_arbitration_flushNext,{memory_arbitration_flushNext,execute_arbitration_flushNext}} != (3'b000)) || ({writeBack_arbitration_flushIt,{memory_arbitration_flushIt,{execute_arbitration_flushIt,decode_arbitration_flushIt}}} != (4'b0000)));
  assign execute_arbitration_isFlushed = (({writeBack_arbitration_flushNext,memory_arbitration_flushNext} != (2'b00)) || ({writeBack_arbitration_flushIt,{memory_arbitration_flushIt,execute_arbitration_flushIt}} != (3'b000)));
  assign memory_arbitration_isFlushed = ((writeBack_arbitration_flushNext != (1'b0)) || ({writeBack_arbitration_flushIt,memory_arbitration_flushIt} != (2'b00)));
  assign writeBack_arbitration_isFlushed = (1'b0 || (writeBack_arbitration_flushIt != (1'b0)));
  assign decode_arbitration_isStuckByOthers = (decode_arbitration_haltByOther || (((1'b0 || execute_arbitration_isStuck) || memory_arbitration_isStuck) || writeBack_arbitration_isStuck));
  assign decode_arbitration_isStuck = (decode_arbitration_haltItself || decode_arbitration_isStuckByOthers);
  assign decode_arbitration_isMoving = ((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt));
  assign decode_arbitration_isFiring = ((decode_arbitration_isValid && (! decode_arbitration_isStuck)) && (! decode_arbitration_removeIt));
  assign execute_arbitration_isStuckByOthers = (execute_arbitration_haltByOther || ((1'b0 || memory_arbitration_isStuck) || writeBack_arbitration_isStuck));
  assign execute_arbitration_isStuck = (execute_arbitration_haltItself || execute_arbitration_isStuckByOthers);
  assign execute_arbitration_isMoving = ((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt));
  assign execute_arbitration_isFiring = ((execute_arbitration_isValid && (! execute_arbitration_isStuck)) && (! execute_arbitration_removeIt));
  assign memory_arbitration_isStuckByOthers = (memory_arbitration_haltByOther || (1'b0 || writeBack_arbitration_isStuck));
  assign memory_arbitration_isStuck = (memory_arbitration_haltItself || memory_arbitration_isStuckByOthers);
  assign memory_arbitration_isMoving = ((! memory_arbitration_isStuck) && (! memory_arbitration_removeIt));
  assign memory_arbitration_isFiring = ((memory_arbitration_isValid && (! memory_arbitration_isStuck)) && (! memory_arbitration_removeIt));
  assign writeBack_arbitration_isStuckByOthers = (writeBack_arbitration_haltByOther || 1'b0);
  assign writeBack_arbitration_isStuck = (writeBack_arbitration_haltItself || writeBack_arbitration_isStuckByOthers);
  assign writeBack_arbitration_isMoving = ((! writeBack_arbitration_isStuck) && (! writeBack_arbitration_removeIt));
  assign writeBack_arbitration_isFiring = ((writeBack_arbitration_isValid && (! writeBack_arbitration_isStuck)) && (! writeBack_arbitration_removeIt));
  always @ (*) begin
    IBusSimplePlugin_injectionPort_ready = 1'b0;
    case(_zz_157)
      3'b000 : begin
      end
      3'b001 : begin
      end
      3'b010 : begin
      end
      3'b011 : begin
      end
      3'b100 : begin
        IBusSimplePlugin_injectionPort_ready = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    _zz_158 = 32'h0;
    if(execute_CsrPlugin_csr_768)begin
      _zz_158[12 : 11] = CsrPlugin_mstatus_MPP;
      _zz_158[7 : 7] = CsrPlugin_mstatus_MPIE;
      _zz_158[3 : 3] = CsrPlugin_mstatus_MIE;
    end
  end

  always @ (*) begin
    _zz_159 = 32'h0;
    if(execute_CsrPlugin_csr_836)begin
      _zz_159[11 : 11] = CsrPlugin_mip_MEIP;
      _zz_159[7 : 7] = CsrPlugin_mip_MTIP;
      _zz_159[3 : 3] = CsrPlugin_mip_MSIP;
    end
  end

  always @ (*) begin
    _zz_160 = 32'h0;
    if(execute_CsrPlugin_csr_772)begin
      _zz_160[11 : 11] = CsrPlugin_mie_MEIE;
      _zz_160[7 : 7] = CsrPlugin_mie_MTIE;
      _zz_160[3 : 3] = CsrPlugin_mie_MSIE;
    end
  end

  always @ (*) begin
    _zz_161 = 32'h0;
    if(execute_CsrPlugin_csr_773)begin
      _zz_161[31 : 2] = CsrPlugin_mtvec_base;
      _zz_161[1 : 0] = CsrPlugin_mtvec_mode;
    end
  end

  always @ (*) begin
    _zz_162 = 32'h0;
    if(execute_CsrPlugin_csr_833)begin
      _zz_162[31 : 0] = CsrPlugin_mepc;
    end
  end

  always @ (*) begin
    _zz_163 = 32'h0;
    if(execute_CsrPlugin_csr_834)begin
      _zz_163[31 : 31] = CsrPlugin_mcause_interrupt;
      _zz_163[3 : 0] = CsrPlugin_mcause_exceptionCode;
    end
  end

  always @ (*) begin
    _zz_164 = 32'h0;
    if(execute_CsrPlugin_csr_835)begin
      _zz_164[31 : 0] = CsrPlugin_mtval;
    end
  end

  assign execute_CsrPlugin_readData = (((32'h0 | _zz_158) | (_zz_159 | _zz_160)) | ((_zz_161 | _zz_162) | (_zz_163 | _zz_164)));
  assign _zz_166 = 1'b0;
  always @ (posedge io_systemClk) begin
    if(systemCd_logic_outputReset) begin
      IBusSimplePlugin_fetchPc_pcReg <= 32'hf9000000;
      IBusSimplePlugin_fetchPc_correctionReg <= 1'b0;
      IBusSimplePlugin_fetchPc_booted <= 1'b0;
      IBusSimplePlugin_fetchPc_inc <= 1'b0;
      IBusSimplePlugin_decodePc_pcReg <= 32'hf9000000;
      _zz_58 <= 1'b0;
      IBusSimplePlugin_decompressor_bufferValid <= 1'b0;
      IBusSimplePlugin_decompressor_throw2BytesReg <= 1'b0;
      _zz_86 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      IBusSimplePlugin_cmd_s2mPipe_rValid <= 1'b0;
      IBusSimplePlugin_pending_value <= (3'b000);
      IBusSimplePlugin_rspJoin_rspBuffer_discardCounter <= (3'b000);
      memory_DivPlugin_div_counter_value <= 6'h0;
      _zz_134 <= 1'b0;
      CsrPlugin_mstatus_MIE <= 1'b0;
      CsrPlugin_mstatus_MPIE <= 1'b0;
      CsrPlugin_mstatus_MPP <= (2'b11);
      CsrPlugin_mie_MEIE <= 1'b0;
      CsrPlugin_mie_MTIE <= 1'b0;
      CsrPlugin_mie_MSIE <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= 1'b0;
      CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= 1'b0;
      CsrPlugin_interrupt_valid <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_1 <= 1'b0;
      CsrPlugin_pipelineLiberator_pcValids_2 <= 1'b0;
      CsrPlugin_hadException <= 1'b0;
      execute_CsrPlugin_wfiWake <= 1'b0;
      execute_arbitration_isValid <= 1'b0;
      memory_arbitration_isValid <= 1'b0;
      writeBack_arbitration_isValid <= 1'b0;
      _zz_157 <= (3'b000);
    end else begin
      if(IBusSimplePlugin_fetchPc_correction)begin
        IBusSimplePlugin_fetchPc_correctionReg <= 1'b1;
      end
      if((IBusSimplePlugin_fetchPc_output_valid && IBusSimplePlugin_fetchPc_output_ready))begin
        IBusSimplePlugin_fetchPc_correctionReg <= 1'b0;
      end
      IBusSimplePlugin_fetchPc_booted <= 1'b1;
      if((IBusSimplePlugin_fetchPc_correction || IBusSimplePlugin_fetchPc_pcRegPropagate))begin
        IBusSimplePlugin_fetchPc_inc <= 1'b0;
      end
      if((IBusSimplePlugin_fetchPc_output_valid && IBusSimplePlugin_fetchPc_output_ready))begin
        IBusSimplePlugin_fetchPc_inc <= 1'b1;
      end
      if(((! IBusSimplePlugin_fetchPc_output_valid) && IBusSimplePlugin_fetchPc_output_ready))begin
        IBusSimplePlugin_fetchPc_inc <= 1'b0;
      end
      if((IBusSimplePlugin_fetchPc_booted && ((IBusSimplePlugin_fetchPc_output_ready || IBusSimplePlugin_fetchPc_correction) || IBusSimplePlugin_fetchPc_pcRegPropagate)))begin
        IBusSimplePlugin_fetchPc_pcReg <= IBusSimplePlugin_fetchPc_pc;
      end
      if((decode_arbitration_isFiring && (! IBusSimplePlugin_decodePc_injectedDecode)))begin
        IBusSimplePlugin_decodePc_pcReg <= IBusSimplePlugin_decodePc_pcPlus;
      end
      if(_zz_182)begin
        IBusSimplePlugin_decodePc_pcReg <= IBusSimplePlugin_jump_pcLoad_payload;
      end
      if(IBusSimplePlugin_iBusRsp_flush)begin
        _zz_58 <= 1'b0;
      end
      if(_zz_56)begin
        _zz_58 <= (IBusSimplePlugin_iBusRsp_stages_0_output_valid && (! 1'b0));
      end
      if((IBusSimplePlugin_decompressor_output_valid && IBusSimplePlugin_decompressor_output_ready))begin
        IBusSimplePlugin_decompressor_throw2BytesReg <= ((((! IBusSimplePlugin_decompressor_unaligned) && IBusSimplePlugin_decompressor_isInputLowRvc) && IBusSimplePlugin_decompressor_isInputHighRvc) || (IBusSimplePlugin_decompressor_bufferValid && IBusSimplePlugin_decompressor_isInputHighRvc));
      end
      if((IBusSimplePlugin_decompressor_output_ready && IBusSimplePlugin_decompressor_input_valid))begin
        IBusSimplePlugin_decompressor_bufferValid <= 1'b0;
      end
      if(_zz_195)begin
        if(IBusSimplePlugin_decompressor_bufferFill)begin
          IBusSimplePlugin_decompressor_bufferValid <= 1'b1;
        end
      end
      if((IBusSimplePlugin_externalFlush || IBusSimplePlugin_decompressor_consumeCurrent))begin
        IBusSimplePlugin_decompressor_throw2BytesReg <= 1'b0;
        IBusSimplePlugin_decompressor_bufferValid <= 1'b0;
      end
      if(decode_arbitration_removeIt)begin
        _zz_86 <= 1'b0;
      end
      if(IBusSimplePlugin_decompressor_output_ready)begin
        _zz_86 <= (IBusSimplePlugin_decompressor_output_valid && (! IBusSimplePlugin_externalFlush));
      end
      if((! 1'b0))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b1;
      end
      if(IBusSimplePlugin_decodePc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      end
      if((! execute_arbitration_isStuck))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= IBusSimplePlugin_injector_nextPcCalc_valids_0;
      end
      if(IBusSimplePlugin_decodePc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if((! memory_arbitration_isStuck))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_2 <= IBusSimplePlugin_injector_nextPcCalc_valids_1;
      end
      if(IBusSimplePlugin_decodePc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if((! writeBack_arbitration_isStuck))begin
        IBusSimplePlugin_injector_nextPcCalc_valids_3 <= IBusSimplePlugin_injector_nextPcCalc_valids_2;
      end
      if(IBusSimplePlugin_decodePc_flushed)begin
        IBusSimplePlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      if(IBusSimplePlugin_cmd_s2mPipe_ready)begin
        IBusSimplePlugin_cmd_s2mPipe_rValid <= 1'b0;
      end
      if(_zz_196)begin
        IBusSimplePlugin_cmd_s2mPipe_rValid <= IBusSimplePlugin_cmd_valid;
      end
      IBusSimplePlugin_pending_value <= IBusSimplePlugin_pending_next;
      IBusSimplePlugin_rspJoin_rspBuffer_discardCounter <= (IBusSimplePlugin_rspJoin_rspBuffer_discardCounter - _zz_255);
      if(IBusSimplePlugin_iBusRsp_flush)begin
        IBusSimplePlugin_rspJoin_rspBuffer_discardCounter <= (IBusSimplePlugin_pending_value - _zz_257);
      end
      memory_DivPlugin_div_counter_value <= memory_DivPlugin_div_counter_valueNext;
      _zz_134 <= (_zz_37 && writeBack_arbitration_isFiring);
      if((! decode_arbitration_isStuck))begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= 1'b0;
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= CsrPlugin_exceptionPortCtrl_exceptionValids_decode;
      end
      if((! execute_arbitration_isStuck))begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= (CsrPlugin_exceptionPortCtrl_exceptionValids_decode && (! decode_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= CsrPlugin_exceptionPortCtrl_exceptionValids_execute;
      end
      if((! memory_arbitration_isStuck))begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= (CsrPlugin_exceptionPortCtrl_exceptionValids_execute && (! execute_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= CsrPlugin_exceptionPortCtrl_exceptionValids_memory;
      end
      if((! writeBack_arbitration_isStuck))begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= (CsrPlugin_exceptionPortCtrl_exceptionValids_memory && (! memory_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= 1'b0;
      end
      CsrPlugin_interrupt_valid <= 1'b0;
      if(_zz_197)begin
        if(_zz_198)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(_zz_199)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(_zz_200)begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
      end
      if(CsrPlugin_pipelineLiberator_active)begin
        if((! execute_arbitration_isStuck))begin
          CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b1;
        end
        if((! memory_arbitration_isStuck))begin
          CsrPlugin_pipelineLiberator_pcValids_1 <= CsrPlugin_pipelineLiberator_pcValids_0;
        end
        if((! writeBack_arbitration_isStuck))begin
          CsrPlugin_pipelineLiberator_pcValids_2 <= CsrPlugin_pipelineLiberator_pcValids_1;
        end
      end
      if(((! CsrPlugin_pipelineLiberator_active) || decode_arbitration_removeIt))begin
        CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b0;
        CsrPlugin_pipelineLiberator_pcValids_1 <= 1'b0;
        CsrPlugin_pipelineLiberator_pcValids_2 <= 1'b0;
      end
      if(CsrPlugin_interruptJump)begin
        CsrPlugin_interrupt_valid <= 1'b0;
      end
      CsrPlugin_hadException <= CsrPlugin_exception;
      if(_zz_178)begin
        case(CsrPlugin_targetPrivilege)
          2'b11 : begin
            CsrPlugin_mstatus_MIE <= 1'b0;
            CsrPlugin_mstatus_MPIE <= CsrPlugin_mstatus_MIE;
            CsrPlugin_mstatus_MPP <= CsrPlugin_privilege;
          end
          default : begin
          end
        endcase
      end
      if(_zz_179)begin
        case(_zz_181)
          2'b11 : begin
            CsrPlugin_mstatus_MPP <= (2'b00);
            CsrPlugin_mstatus_MIE <= CsrPlugin_mstatus_MPIE;
            CsrPlugin_mstatus_MPIE <= 1'b1;
          end
          default : begin
          end
        endcase
      end
      execute_CsrPlugin_wfiWake <= (({_zz_154,{_zz_153,_zz_152}} != (3'b000)) || CsrPlugin_thirdPartyWake);
      if(((! execute_arbitration_isStuck) || execute_arbitration_removeIt))begin
        execute_arbitration_isValid <= 1'b0;
      end
      if(((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt)))begin
        execute_arbitration_isValid <= decode_arbitration_isValid;
      end
      if(((! memory_arbitration_isStuck) || memory_arbitration_removeIt))begin
        memory_arbitration_isValid <= 1'b0;
      end
      if(((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt)))begin
        memory_arbitration_isValid <= execute_arbitration_isValid;
      end
      if(((! writeBack_arbitration_isStuck) || writeBack_arbitration_removeIt))begin
        writeBack_arbitration_isValid <= 1'b0;
      end
      if(((! memory_arbitration_isStuck) && (! memory_arbitration_removeIt)))begin
        writeBack_arbitration_isValid <= memory_arbitration_isValid;
      end
      case(_zz_157)
        3'b000 : begin
          if(IBusSimplePlugin_injectionPort_valid)begin
            _zz_157 <= (3'b001);
          end
        end
        3'b001 : begin
          _zz_157 <= (3'b010);
        end
        3'b010 : begin
          _zz_157 <= (3'b011);
        end
        3'b011 : begin
          if((! decode_arbitration_isStuck))begin
            _zz_157 <= (3'b100);
          end
        end
        3'b100 : begin
          _zz_157 <= (3'b000);
        end
        default : begin
        end
      endcase
      if(execute_CsrPlugin_csr_768)begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mstatus_MPP <= execute_CsrPlugin_writeData[12 : 11];
          CsrPlugin_mstatus_MPIE <= _zz_293[0];
          CsrPlugin_mstatus_MIE <= _zz_294[0];
        end
      end
      if(execute_CsrPlugin_csr_772)begin
        if(execute_CsrPlugin_writeEnable)begin
          CsrPlugin_mie_MEIE <= _zz_296[0];
          CsrPlugin_mie_MTIE <= _zz_297[0];
          CsrPlugin_mie_MSIE <= _zz_298[0];
        end
      end
    end
  end

  always @ (posedge io_systemClk) begin
    if(_zz_195)begin
      IBusSimplePlugin_decompressor_bufferData <= IBusSimplePlugin_decompressor_input_payload_rsp_inst[31 : 16];
    end
    if(IBusSimplePlugin_decompressor_output_ready)begin
      _zz_87 <= IBusSimplePlugin_decompressor_output_payload_pc;
      _zz_88 <= IBusSimplePlugin_decompressor_output_payload_rsp_error;
      _zz_89 <= IBusSimplePlugin_decompressor_output_payload_rsp_inst;
      _zz_90 <= IBusSimplePlugin_decompressor_output_payload_isRvc;
    end
    if(IBusSimplePlugin_injector_decodeInput_ready)begin
      IBusSimplePlugin_injector_formal_rawInDecode <= IBusSimplePlugin_decompressor_raw;
    end
    if(_zz_196)begin
      IBusSimplePlugin_cmd_s2mPipe_rData_pc <= IBusSimplePlugin_cmd_payload_pc;
    end
    `ifndef SYNTHESIS
      `ifdef FORMAL
        assert((! (((dBus_rsp_ready && memory_MEMORY_ENABLE) && memory_arbitration_isValid) && memory_arbitration_isStuck)))
      `else
        if(!(! (((dBus_rsp_ready && memory_MEMORY_ENABLE) && memory_arbitration_isValid) && memory_arbitration_isStuck))) begin
          $display("FAILURE DBusSimplePlugin doesn't allow memory stage stall when read happend");
          $finish;
        end
      `endif
    `endif
    `ifndef SYNTHESIS
      `ifdef FORMAL
        assert((! (((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE) && (! writeBack_MEMORY_STORE)) && writeBack_arbitration_isStuck)))
      `else
        if(!(! (((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE) && (! writeBack_MEMORY_STORE)) && writeBack_arbitration_isStuck))) begin
          $display("FAILURE DBusSimplePlugin doesn't allow writeback stage stall when read happend");
          $finish;
        end
      `endif
    `endif
    if((memory_DivPlugin_div_counter_value == 6'h20))begin
      memory_DivPlugin_div_done <= 1'b1;
    end
    if((! memory_arbitration_isStuck))begin
      memory_DivPlugin_div_done <= 1'b0;
    end
    if(_zz_175)begin
      if(_zz_184)begin
        memory_DivPlugin_rs1[31 : 0] <= memory_DivPlugin_div_stage_0_outNumerator;
        memory_DivPlugin_accumulator[31 : 0] <= memory_DivPlugin_div_stage_0_outRemainder;
        if((memory_DivPlugin_div_counter_value == 6'h20))begin
          memory_DivPlugin_div_result <= _zz_280[31:0];
        end
      end
    end
    if(_zz_185)begin
      memory_DivPlugin_accumulator <= 65'h0;
      memory_DivPlugin_rs1 <= ((_zz_130 ? (~ _zz_131) : _zz_131) + _zz_286);
      memory_DivPlugin_rs2 <= ((_zz_129 ? (~ execute_RS2) : execute_RS2) + _zz_288);
      memory_DivPlugin_div_needRevert <= ((_zz_130 ^ (_zz_129 && (! execute_INSTRUCTION[13]))) && (! (((execute_RS2 == 32'h0) && execute_IS_RS2_SIGNED) && (! execute_INSTRUCTION[13]))));
    end
    _zz_135 <= _zz_36[11 : 7];
    _zz_136 <= _zz_46;
    CsrPlugin_mip_MEIP <= externalInterrupt;
    CsrPlugin_mip_MTIP <= timerInterrupt;
    CsrPlugin_mip_MSIP <= softwareInterrupt;
    CsrPlugin_mcycle <= (CsrPlugin_mcycle + 64'h0000000000000001);
    if(writeBack_arbitration_isFiring)begin
      CsrPlugin_minstret <= (CsrPlugin_minstret + 64'h0000000000000001);
    end
    if(decodeExceptionPort_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= decodeExceptionPort_payload_code;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= decodeExceptionPort_payload_badAddr;
    end
    if(CsrPlugin_selfException_valid)begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= CsrPlugin_selfException_payload_code;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= CsrPlugin_selfException_payload_badAddr;
    end
    if(_zz_197)begin
      if(_zz_198)begin
        CsrPlugin_interrupt_code <= (4'b0111);
        CsrPlugin_interrupt_targetPrivilege <= (2'b11);
      end
      if(_zz_199)begin
        CsrPlugin_interrupt_code <= (4'b0011);
        CsrPlugin_interrupt_targetPrivilege <= (2'b11);
      end
      if(_zz_200)begin
        CsrPlugin_interrupt_code <= (4'b1011);
        CsrPlugin_interrupt_targetPrivilege <= (2'b11);
      end
    end
    if(_zz_178)begin
      case(CsrPlugin_targetPrivilege)
        2'b11 : begin
          CsrPlugin_mcause_interrupt <= (! CsrPlugin_hadException);
          CsrPlugin_mcause_exceptionCode <= CsrPlugin_trapCause;
          CsrPlugin_mepc <= writeBack_PC;
          if(CsrPlugin_hadException)begin
            CsrPlugin_mtval <= CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr;
          end
        end
        default : begin
        end
      endcase
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_PC <= _zz_29;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_PC <= execute_PC;
    end
    if(((! writeBack_arbitration_isStuck) && (! CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack)))begin
      memory_to_writeBack_PC <= memory_PC;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_INSTRUCTION <= decode_INSTRUCTION;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_INSTRUCTION <= execute_INSTRUCTION;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_INSTRUCTION <= memory_INSTRUCTION;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_RVC <= decode_IS_RVC;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_FORMAL_PC_NEXT <= _zz_49;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_FORMAL_PC_NEXT <= execute_FORMAL_PC_NEXT;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_FORMAL_PC_NEXT <= _zz_48;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_USE_SUB_LESS <= decode_SRC_USE_SUB_LESS;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_ENABLE <= decode_MEMORY_ENABLE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_ENABLE <= execute_MEMORY_ENABLE;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_ENABLE <= memory_MEMORY_ENABLE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_REGFILE_WRITE_VALID <= decode_REGFILE_WRITE_VALID;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_REGFILE_WRITE_VALID <= execute_REGFILE_WRITE_VALID;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_REGFILE_WRITE_VALID <= memory_REGFILE_WRITE_VALID;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BYPASSABLE_EXECUTE_STAGE <= decode_BYPASSABLE_EXECUTE_STAGE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BYPASSABLE_MEMORY_STAGE <= decode_BYPASSABLE_MEMORY_STAGE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BYPASSABLE_MEMORY_STAGE <= execute_BYPASSABLE_MEMORY_STAGE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MEMORY_STORE <= decode_MEMORY_STORE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_STORE <= execute_MEMORY_STORE;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_STORE <= memory_MEMORY_STORE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_CTRL <= _zz_19;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC_LESS_UNSIGNED <= decode_SRC_LESS_UNSIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ALU_BITWISE_CTRL <= _zz_16;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SHIFT_CTRL <= _zz_13;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_SHIFT_CTRL <= _zz_10;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_MUL <= decode_IS_MUL;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_IS_MUL <= execute_IS_MUL;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_IS_MUL <= memory_IS_MUL;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_DIV <= decode_IS_DIV;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_IS_DIV <= execute_IS_DIV;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_RS1_SIGNED <= decode_IS_RS1_SIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_RS2_SIGNED <= decode_IS_RS2_SIGNED;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_BRANCH_CTRL <= _zz_8;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_IS_CSR <= decode_IS_CSR;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_ENV_CTRL <= _zz_6;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_ENV_CTRL <= _zz_3;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_ENV_CTRL <= _zz_1;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_RS1 <= _zz_32;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_RS2 <= _zz_30;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2_FORCE_ZERO <= decode_SRC2_FORCE_ZERO;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC1 <= decode_SRC1;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_SRC2 <= decode_SRC2;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_PREDICTION_HAD_BRANCHED2 <= decode_PREDICTION_HAD_BRANCHED2;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_WRITE_OPCODE <= decode_CSR_WRITE_OPCODE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CSR_READ_OPCODE <= decode_CSR_READ_OPCODE;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DO_EBREAK <= decode_DO_EBREAK;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_ADDRESS_LOW <= execute_MEMORY_ADDRESS_LOW;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_ADDRESS_LOW <= memory_MEMORY_ADDRESS_LOW;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_REGFILE_WRITE_DATA <= _zz_25;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_REGFILE_WRITE_DATA <= _zz_26;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_SHIFT_RIGHT <= execute_SHIFT_RIGHT;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_LL <= execute_MUL_LL;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_LH <= execute_MUL_LH;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_HL <= execute_MUL_HL;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_HH <= execute_MUL_HH;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MUL_HH <= memory_MUL_HH;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BRANCH_DO <= execute_BRANCH_DO;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BRANCH_CALC <= execute_BRANCH_CALC;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_READ_DATA <= memory_MEMORY_READ_DATA;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MUL_LOW <= memory_MUL_LOW;
    end
    if((_zz_157 != (3'b000)))begin
      _zz_89 <= IBusSimplePlugin_injectionPort_payload;
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_3860 <= (decode_INSTRUCTION[31 : 20] == 12'hf14);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_768 <= (decode_INSTRUCTION[31 : 20] == 12'h300);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_836 <= (decode_INSTRUCTION[31 : 20] == 12'h344);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_772 <= (decode_INSTRUCTION[31 : 20] == 12'h304);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_773 <= (decode_INSTRUCTION[31 : 20] == 12'h305);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_833 <= (decode_INSTRUCTION[31 : 20] == 12'h341);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_834 <= (decode_INSTRUCTION[31 : 20] == 12'h342);
    end
    if((! execute_arbitration_isStuck))begin
      execute_CsrPlugin_csr_835 <= (decode_INSTRUCTION[31 : 20] == 12'h343);
    end
    if(execute_CsrPlugin_csr_836)begin
      if(execute_CsrPlugin_writeEnable)begin
        CsrPlugin_mip_MSIP <= _zz_295[0];
      end
    end
    if(execute_CsrPlugin_csr_773)begin
      if(execute_CsrPlugin_writeEnable)begin
        CsrPlugin_mtvec_base <= execute_CsrPlugin_writeData[31 : 2];
        CsrPlugin_mtvec_mode <= execute_CsrPlugin_writeData[1 : 0];
      end
    end
    if(execute_CsrPlugin_csr_833)begin
      if(execute_CsrPlugin_writeEnable)begin
        CsrPlugin_mepc <= execute_CsrPlugin_writeData[31 : 0];
      end
    end
  end

  always @ (posedge io_systemClk) begin
    DebugPlugin_firstCycle <= 1'b0;
    if(debug_bus_cmd_ready)begin
      DebugPlugin_firstCycle <= 1'b1;
    end
    DebugPlugin_secondCycle <= DebugPlugin_firstCycle;
    DebugPlugin_isPipBusy <= (({writeBack_arbitration_isValid,{memory_arbitration_isValid,{execute_arbitration_isValid,decode_arbitration_isValid}}} != (4'b0000)) || IBusSimplePlugin_incomingInstruction);
    if(writeBack_arbitration_isValid)begin
      DebugPlugin_busReadDataReg <= _zz_46;
    end
    _zz_155 <= debug_bus_cmd_payload_address[2];
    if(_zz_176)begin
      DebugPlugin_busReadDataReg <= execute_PC;
    end
    DebugPlugin_resetIt_regNext <= DebugPlugin_resetIt;
  end

  always @ (posedge io_systemClk) begin
    if(debugCd_logic_outputReset) begin
      DebugPlugin_resetIt <= 1'b0;
      DebugPlugin_haltIt <= 1'b0;
      DebugPlugin_stepIt <= 1'b0;
      DebugPlugin_godmode <= 1'b0;
      DebugPlugin_haltedByBreak <= 1'b0;
      _zz_156 <= 1'b0;
    end else begin
      if((DebugPlugin_haltIt && (! DebugPlugin_isPipBusy)))begin
        DebugPlugin_godmode <= 1'b1;
      end
      if(debug_bus_cmd_valid)begin
        case(_zz_194)
          6'b000000 : begin
            if(debug_bus_cmd_payload_wr)begin
              DebugPlugin_stepIt <= debug_bus_cmd_payload_data[4];
              if(debug_bus_cmd_payload_data[16])begin
                DebugPlugin_resetIt <= 1'b1;
              end
              if(debug_bus_cmd_payload_data[24])begin
                DebugPlugin_resetIt <= 1'b0;
              end
              if(debug_bus_cmd_payload_data[17])begin
                DebugPlugin_haltIt <= 1'b1;
              end
              if(debug_bus_cmd_payload_data[25])begin
                DebugPlugin_haltIt <= 1'b0;
              end
              if(debug_bus_cmd_payload_data[25])begin
                DebugPlugin_haltedByBreak <= 1'b0;
              end
              if(debug_bus_cmd_payload_data[25])begin
                DebugPlugin_godmode <= 1'b0;
              end
            end
          end
          6'b000001 : begin
          end
          default : begin
          end
        endcase
      end
      if(_zz_176)begin
        if(_zz_177)begin
          DebugPlugin_haltIt <= 1'b1;
          DebugPlugin_haltedByBreak <= 1'b1;
        end
      end
      if(_zz_180)begin
        if(decode_arbitration_isValid)begin
          DebugPlugin_haltIt <= 1'b1;
        end
      end
      _zz_156 <= (DebugPlugin_stepIt && decode_arbitration_isFiring);
    end
  end


endmodule

module BufferCC_7 (
  input               io_initial,
  input               io_dataIn,
  output              io_dataOut,
  input               io_systemClk,
  input               debugCd_logic_outputReset
);
  reg                 buffers_0;
  reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @ (posedge io_systemClk or posedge debugCd_logic_outputReset) begin
    if (debugCd_logic_outputReset) begin
      buffers_0 <= io_initial;
      buffers_1 <= io_initial;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module BufferCC_6 (
  input               io_initial,
  input               io_dataIn,
  output              io_dataOut,
  input               io_systemClk,
  input               io_asyncReset
);
  reg                 buffers_0;
  reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @ (posedge io_systemClk or posedge io_asyncReset) begin
    if (io_asyncReset) begin
      buffers_0 <= io_initial;
      buffers_1 <= io_initial;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule

module BufferCC_5 (
  input               io_dataIn,
  output              io_dataOut,
  input               io_systemClk,
  input               systemCd_logic_outputReset
);
  reg                 buffers_0;
  reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @ (posedge io_systemClk) begin
    buffers_0 <= io_dataIn;
    buffers_1 <= buffers_0;
  end


endmodule

module Apb3Gpio2 (
  input      [15:0]   io_gpio_read,
  output reg [15:0]   io_gpio_write,
  output reg [15:0]   io_gpio_writeEnable,
  input      [11:0]   io_bus_PADDR,
  input      [0:0]    io_bus_PSEL,
  input               io_bus_PENABLE,
  output              io_bus_PREADY,
  input               io_bus_PWRITE,
  input      [31:0]   io_bus_PWDATA,
  output reg [31:0]   io_bus_PRDATA,
  output              io_bus_PSLVERROR,
  output reg [15:0]   io_interrupt,
  input               io_systemClk,
  input               systemCd_logic_outputReset
);
  wire       [15:0]   io_gpio_read_buffercc_io_dataOut;
  wire       [0:0]    _zz_41;
  wire       [0:0]    _zz_42;
  wire       [0:0]    _zz_43;
  wire       [0:0]    _zz_44;
  wire       [0:0]    _zz_45;
  wire       [0:0]    _zz_46;
  wire       [0:0]    _zz_47;
  wire       [0:0]    _zz_48;
  wire       [0:0]    _zz_49;
  wire       [0:0]    _zz_50;
  wire       [0:0]    _zz_51;
  wire       [0:0]    _zz_52;
  wire       [0:0]    _zz_53;
  wire       [0:0]    _zz_54;
  wire       [0:0]    _zz_55;
  wire       [0:0]    _zz_56;
  wire       [0:0]    _zz_57;
  wire       [0:0]    _zz_58;
  wire       [0:0]    _zz_59;
  wire       [0:0]    _zz_60;
  wire       [0:0]    _zz_61;
  wire       [0:0]    _zz_62;
  wire       [0:0]    _zz_63;
  wire       [0:0]    _zz_64;
  wire       [0:0]    _zz_65;
  wire       [0:0]    _zz_66;
  wire       [0:0]    _zz_67;
  wire       [0:0]    _zz_68;
  wire       [0:0]    _zz_69;
  wire       [0:0]    _zz_70;
  wire       [0:0]    _zz_71;
  wire       [0:0]    _zz_72;
  wire       [0:0]    _zz_73;
  wire       [0:0]    _zz_74;
  wire       [0:0]    _zz_75;
  wire       [0:0]    _zz_76;
  wire       [0:0]    _zz_77;
  wire       [0:0]    _zz_78;
  wire       [0:0]    _zz_79;
  wire       [0:0]    _zz_80;
  wire                mapper_askWrite;
  wire                mapper_askRead;
  wire                mapper_doWrite;
  wire                mapper_doRead;
  wire       [15:0]   syncronized;
  reg        [15:0]   last;
  reg                 _zz_1;
  reg                 _zz_2;
  reg                 _zz_3;
  reg                 _zz_4;
  reg                 _zz_5;
  reg                 _zz_6;
  reg                 _zz_7;
  reg                 _zz_8;
  reg                 _zz_9;
  reg                 _zz_10;
  reg                 _zz_11;
  reg                 _zz_12;
  reg                 _zz_13;
  reg                 _zz_14;
  reg                 _zz_15;
  reg                 _zz_16;
  reg                 _zz_17;
  reg                 _zz_18;
  reg                 _zz_19;
  reg                 _zz_20;
  reg                 _zz_21;
  reg                 _zz_22;
  reg                 _zz_23;
  reg                 _zz_24;
  reg                 _zz_25;
  reg                 _zz_26;
  reg                 _zz_27;
  reg                 _zz_28;
  reg                 _zz_29;
  reg                 _zz_30;
  reg                 _zz_31;
  reg                 _zz_32;
  reg        [15:0]   interrupt_enable_high;
  reg        [15:0]   interrupt_enable_low;
  reg        [15:0]   interrupt_enable_rise;
  reg        [15:0]   interrupt_enable_fall;
  wire       [15:0]   interrupt_valid;
  reg                 _zz_33;
  reg                 _zz_34;
  reg                 _zz_35;
  reg                 _zz_36;
  reg                 _zz_37;
  reg                 _zz_38;
  reg                 _zz_39;
  reg                 _zz_40;

  assign _zz_41 = io_bus_PWDATA[0 : 0];
  assign _zz_42 = io_bus_PWDATA[1 : 1];
  assign _zz_43 = io_bus_PWDATA[2 : 2];
  assign _zz_44 = io_bus_PWDATA[3 : 3];
  assign _zz_45 = io_bus_PWDATA[4 : 4];
  assign _zz_46 = io_bus_PWDATA[5 : 5];
  assign _zz_47 = io_bus_PWDATA[6 : 6];
  assign _zz_48 = io_bus_PWDATA[7 : 7];
  assign _zz_49 = io_bus_PWDATA[8 : 8];
  assign _zz_50 = io_bus_PWDATA[9 : 9];
  assign _zz_51 = io_bus_PWDATA[10 : 10];
  assign _zz_52 = io_bus_PWDATA[11 : 11];
  assign _zz_53 = io_bus_PWDATA[12 : 12];
  assign _zz_54 = io_bus_PWDATA[13 : 13];
  assign _zz_55 = io_bus_PWDATA[14 : 14];
  assign _zz_56 = io_bus_PWDATA[15 : 15];
  assign _zz_57 = io_bus_PWDATA[0 : 0];
  assign _zz_58 = io_bus_PWDATA[1 : 1];
  assign _zz_59 = io_bus_PWDATA[2 : 2];
  assign _zz_60 = io_bus_PWDATA[3 : 3];
  assign _zz_61 = io_bus_PWDATA[4 : 4];
  assign _zz_62 = io_bus_PWDATA[5 : 5];
  assign _zz_63 = io_bus_PWDATA[6 : 6];
  assign _zz_64 = io_bus_PWDATA[7 : 7];
  assign _zz_65 = io_bus_PWDATA[8 : 8];
  assign _zz_66 = io_bus_PWDATA[9 : 9];
  assign _zz_67 = io_bus_PWDATA[10 : 10];
  assign _zz_68 = io_bus_PWDATA[11 : 11];
  assign _zz_69 = io_bus_PWDATA[12 : 12];
  assign _zz_70 = io_bus_PWDATA[13 : 13];
  assign _zz_71 = io_bus_PWDATA[14 : 14];
  assign _zz_72 = io_bus_PWDATA[15 : 15];
  assign _zz_73 = io_bus_PWDATA[0 : 0];
  assign _zz_74 = io_bus_PWDATA[1 : 1];
  assign _zz_75 = io_bus_PWDATA[0 : 0];
  assign _zz_76 = io_bus_PWDATA[1 : 1];
  assign _zz_77 = io_bus_PWDATA[0 : 0];
  assign _zz_78 = io_bus_PWDATA[1 : 1];
  assign _zz_79 = io_bus_PWDATA[0 : 0];
  assign _zz_80 = io_bus_PWDATA[1 : 1];
  BufferCC_4 io_gpio_read_buffercc (
    .io_dataIn                     (io_gpio_read[15:0]                      ), //i
    .io_dataOut                    (io_gpio_read_buffercc_io_dataOut[15:0]  ), //o
    .io_systemClk                  (io_systemClk                            ), //i
    .systemCd_logic_outputReset    (systemCd_logic_outputReset              )  //i
  );
  assign io_bus_PREADY = 1'b1;
  always @ (*) begin
    io_bus_PRDATA = 32'h0;
    case(io_bus_PADDR)
      12'b000000000000 : begin
        io_bus_PRDATA[0 : 0] = syncronized[0];
        io_bus_PRDATA[1 : 1] = syncronized[1];
        io_bus_PRDATA[2 : 2] = syncronized[2];
        io_bus_PRDATA[3 : 3] = syncronized[3];
        io_bus_PRDATA[4 : 4] = syncronized[4];
        io_bus_PRDATA[5 : 5] = syncronized[5];
        io_bus_PRDATA[6 : 6] = syncronized[6];
        io_bus_PRDATA[7 : 7] = syncronized[7];
        io_bus_PRDATA[8 : 8] = syncronized[8];
        io_bus_PRDATA[9 : 9] = syncronized[9];
        io_bus_PRDATA[10 : 10] = syncronized[10];
        io_bus_PRDATA[11 : 11] = syncronized[11];
        io_bus_PRDATA[12 : 12] = syncronized[12];
        io_bus_PRDATA[13 : 13] = syncronized[13];
        io_bus_PRDATA[14 : 14] = syncronized[14];
        io_bus_PRDATA[15 : 15] = syncronized[15];
      end
      12'b000000000100 : begin
        io_bus_PRDATA[0 : 0] = _zz_1;
        io_bus_PRDATA[1 : 1] = _zz_3;
        io_bus_PRDATA[2 : 2] = _zz_5;
        io_bus_PRDATA[3 : 3] = _zz_7;
        io_bus_PRDATA[4 : 4] = _zz_9;
        io_bus_PRDATA[5 : 5] = _zz_11;
        io_bus_PRDATA[6 : 6] = _zz_13;
        io_bus_PRDATA[7 : 7] = _zz_15;
        io_bus_PRDATA[8 : 8] = _zz_17;
        io_bus_PRDATA[9 : 9] = _zz_19;
        io_bus_PRDATA[10 : 10] = _zz_21;
        io_bus_PRDATA[11 : 11] = _zz_23;
        io_bus_PRDATA[12 : 12] = _zz_25;
        io_bus_PRDATA[13 : 13] = _zz_27;
        io_bus_PRDATA[14 : 14] = _zz_29;
        io_bus_PRDATA[15 : 15] = _zz_31;
      end
      12'b000000001000 : begin
        io_bus_PRDATA[0 : 0] = _zz_2;
        io_bus_PRDATA[1 : 1] = _zz_4;
        io_bus_PRDATA[2 : 2] = _zz_6;
        io_bus_PRDATA[3 : 3] = _zz_8;
        io_bus_PRDATA[4 : 4] = _zz_10;
        io_bus_PRDATA[5 : 5] = _zz_12;
        io_bus_PRDATA[6 : 6] = _zz_14;
        io_bus_PRDATA[7 : 7] = _zz_16;
        io_bus_PRDATA[8 : 8] = _zz_18;
        io_bus_PRDATA[9 : 9] = _zz_20;
        io_bus_PRDATA[10 : 10] = _zz_22;
        io_bus_PRDATA[11 : 11] = _zz_24;
        io_bus_PRDATA[12 : 12] = _zz_26;
        io_bus_PRDATA[13 : 13] = _zz_28;
        io_bus_PRDATA[14 : 14] = _zz_30;
        io_bus_PRDATA[15 : 15] = _zz_32;
      end
      12'b000000100000 : begin
        io_bus_PRDATA[0 : 0] = _zz_33;
        io_bus_PRDATA[1 : 1] = _zz_37;
      end
      12'b000000100100 : begin
        io_bus_PRDATA[0 : 0] = _zz_34;
        io_bus_PRDATA[1 : 1] = _zz_38;
      end
      12'b000000101000 : begin
        io_bus_PRDATA[0 : 0] = _zz_35;
        io_bus_PRDATA[1 : 1] = _zz_39;
      end
      12'b000000101100 : begin
        io_bus_PRDATA[0 : 0] = _zz_36;
        io_bus_PRDATA[1 : 1] = _zz_40;
      end
      default : begin
      end
    endcase
  end

  assign io_bus_PSLVERROR = 1'b0;
  assign mapper_askWrite = ((io_bus_PSEL[0] && io_bus_PENABLE) && io_bus_PWRITE);
  assign mapper_askRead = ((io_bus_PSEL[0] && io_bus_PENABLE) && (! io_bus_PWRITE));
  assign mapper_doWrite = (((io_bus_PSEL[0] && io_bus_PENABLE) && io_bus_PREADY) && io_bus_PWRITE);
  assign mapper_doRead = (((io_bus_PSEL[0] && io_bus_PENABLE) && io_bus_PREADY) && (! io_bus_PWRITE));
  assign syncronized = io_gpio_read_buffercc_io_dataOut;
  always @ (*) begin
    io_gpio_write[0] = _zz_1;
    io_gpio_write[1] = _zz_3;
    io_gpio_write[2] = _zz_5;
    io_gpio_write[3] = _zz_7;
    io_gpio_write[4] = _zz_9;
    io_gpio_write[5] = _zz_11;
    io_gpio_write[6] = _zz_13;
    io_gpio_write[7] = _zz_15;
    io_gpio_write[8] = _zz_17;
    io_gpio_write[9] = _zz_19;
    io_gpio_write[10] = _zz_21;
    io_gpio_write[11] = _zz_23;
    io_gpio_write[12] = _zz_25;
    io_gpio_write[13] = _zz_27;
    io_gpio_write[14] = _zz_29;
    io_gpio_write[15] = _zz_31;
  end

  always @ (*) begin
    io_gpio_writeEnable[0] = _zz_2;
    io_gpio_writeEnable[1] = _zz_4;
    io_gpio_writeEnable[2] = _zz_6;
    io_gpio_writeEnable[3] = _zz_8;
    io_gpio_writeEnable[4] = _zz_10;
    io_gpio_writeEnable[5] = _zz_12;
    io_gpio_writeEnable[6] = _zz_14;
    io_gpio_writeEnable[7] = _zz_16;
    io_gpio_writeEnable[8] = _zz_18;
    io_gpio_writeEnable[9] = _zz_20;
    io_gpio_writeEnable[10] = _zz_22;
    io_gpio_writeEnable[11] = _zz_24;
    io_gpio_writeEnable[12] = _zz_26;
    io_gpio_writeEnable[13] = _zz_28;
    io_gpio_writeEnable[14] = _zz_30;
    io_gpio_writeEnable[15] = _zz_32;
  end

  assign interrupt_valid = ((((interrupt_enable_high & syncronized) | (interrupt_enable_low & (~ syncronized))) | (interrupt_enable_rise & (syncronized & (~ last)))) | (interrupt_enable_fall & ((~ syncronized) & last)));
  always @ (*) begin
    io_interrupt[0] = interrupt_valid[0];
    io_interrupt[1] = interrupt_valid[1];
    io_interrupt[2] = 1'b0;
    io_interrupt[3] = 1'b0;
    io_interrupt[4] = 1'b0;
    io_interrupt[5] = 1'b0;
    io_interrupt[6] = 1'b0;
    io_interrupt[7] = 1'b0;
    io_interrupt[8] = 1'b0;
    io_interrupt[9] = 1'b0;
    io_interrupt[10] = 1'b0;
    io_interrupt[11] = 1'b0;
    io_interrupt[12] = 1'b0;
    io_interrupt[13] = 1'b0;
    io_interrupt[14] = 1'b0;
    io_interrupt[15] = 1'b0;
  end

  always @ (*) begin
    interrupt_enable_rise[0] = _zz_33;
    interrupt_enable_rise[1] = _zz_37;
    interrupt_enable_rise[2] = 1'b0;
    interrupt_enable_rise[3] = 1'b0;
    interrupt_enable_rise[4] = 1'b0;
    interrupt_enable_rise[5] = 1'b0;
    interrupt_enable_rise[6] = 1'b0;
    interrupt_enable_rise[7] = 1'b0;
    interrupt_enable_rise[8] = 1'b0;
    interrupt_enable_rise[9] = 1'b0;
    interrupt_enable_rise[10] = 1'b0;
    interrupt_enable_rise[11] = 1'b0;
    interrupt_enable_rise[12] = 1'b0;
    interrupt_enable_rise[13] = 1'b0;
    interrupt_enable_rise[14] = 1'b0;
    interrupt_enable_rise[15] = 1'b0;
  end

  always @ (*) begin
    interrupt_enable_fall[0] = _zz_34;
    interrupt_enable_fall[1] = _zz_38;
    interrupt_enable_fall[2] = 1'b0;
    interrupt_enable_fall[3] = 1'b0;
    interrupt_enable_fall[4] = 1'b0;
    interrupt_enable_fall[5] = 1'b0;
    interrupt_enable_fall[6] = 1'b0;
    interrupt_enable_fall[7] = 1'b0;
    interrupt_enable_fall[8] = 1'b0;
    interrupt_enable_fall[9] = 1'b0;
    interrupt_enable_fall[10] = 1'b0;
    interrupt_enable_fall[11] = 1'b0;
    interrupt_enable_fall[12] = 1'b0;
    interrupt_enable_fall[13] = 1'b0;
    interrupt_enable_fall[14] = 1'b0;
    interrupt_enable_fall[15] = 1'b0;
  end

  always @ (*) begin
    interrupt_enable_high[0] = _zz_35;
    interrupt_enable_high[1] = _zz_39;
    interrupt_enable_high[2] = 1'b0;
    interrupt_enable_high[3] = 1'b0;
    interrupt_enable_high[4] = 1'b0;
    interrupt_enable_high[5] = 1'b0;
    interrupt_enable_high[6] = 1'b0;
    interrupt_enable_high[7] = 1'b0;
    interrupt_enable_high[8] = 1'b0;
    interrupt_enable_high[9] = 1'b0;
    interrupt_enable_high[10] = 1'b0;
    interrupt_enable_high[11] = 1'b0;
    interrupt_enable_high[12] = 1'b0;
    interrupt_enable_high[13] = 1'b0;
    interrupt_enable_high[14] = 1'b0;
    interrupt_enable_high[15] = 1'b0;
  end

  always @ (*) begin
    interrupt_enable_low[0] = _zz_36;
    interrupt_enable_low[1] = _zz_40;
    interrupt_enable_low[2] = 1'b0;
    interrupt_enable_low[3] = 1'b0;
    interrupt_enable_low[4] = 1'b0;
    interrupt_enable_low[5] = 1'b0;
    interrupt_enable_low[6] = 1'b0;
    interrupt_enable_low[7] = 1'b0;
    interrupt_enable_low[8] = 1'b0;
    interrupt_enable_low[9] = 1'b0;
    interrupt_enable_low[10] = 1'b0;
    interrupt_enable_low[11] = 1'b0;
    interrupt_enable_low[12] = 1'b0;
    interrupt_enable_low[13] = 1'b0;
    interrupt_enable_low[14] = 1'b0;
    interrupt_enable_low[15] = 1'b0;
  end

  always @ (posedge io_systemClk) begin
    last <= syncronized;
    case(io_bus_PADDR)
      12'b000000000000 : begin
      end
      12'b000000000100 : begin
        if(mapper_doWrite)begin
          _zz_1 <= _zz_41[0];
          _zz_3 <= _zz_42[0];
          _zz_5 <= _zz_43[0];
          _zz_7 <= _zz_44[0];
          _zz_9 <= _zz_45[0];
          _zz_11 <= _zz_46[0];
          _zz_13 <= _zz_47[0];
          _zz_15 <= _zz_48[0];
          _zz_17 <= _zz_49[0];
          _zz_19 <= _zz_50[0];
          _zz_21 <= _zz_51[0];
          _zz_23 <= _zz_52[0];
          _zz_25 <= _zz_53[0];
          _zz_27 <= _zz_54[0];
          _zz_29 <= _zz_55[0];
          _zz_31 <= _zz_56[0];
        end
      end
      12'b000000001000 : begin
      end
      12'b000000100000 : begin
      end
      12'b000000100100 : begin
      end
      12'b000000101000 : begin
      end
      12'b000000101100 : begin
      end
      default : begin
      end
    endcase
  end

  always @ (posedge io_systemClk) begin
    if(systemCd_logic_outputReset) begin
      _zz_2 <= 1'b0;
      _zz_4 <= 1'b0;
      _zz_6 <= 1'b0;
      _zz_8 <= 1'b0;
      _zz_10 <= 1'b0;
      _zz_12 <= 1'b0;
      _zz_14 <= 1'b0;
      _zz_16 <= 1'b0;
      _zz_18 <= 1'b0;
      _zz_20 <= 1'b0;
      _zz_22 <= 1'b0;
      _zz_24 <= 1'b0;
      _zz_26 <= 1'b0;
      _zz_28 <= 1'b0;
      _zz_30 <= 1'b0;
      _zz_32 <= 1'b0;
      _zz_33 <= 1'b0;
      _zz_34 <= 1'b0;
      _zz_35 <= 1'b0;
      _zz_36 <= 1'b0;
      _zz_37 <= 1'b0;
      _zz_38 <= 1'b0;
      _zz_39 <= 1'b0;
      _zz_40 <= 1'b0;
    end else begin
      case(io_bus_PADDR)
        12'b000000000000 : begin
        end
        12'b000000000100 : begin
        end
        12'b000000001000 : begin
          if(mapper_doWrite)begin
            _zz_2 <= _zz_57[0];
            _zz_4 <= _zz_58[0];
            _zz_6 <= _zz_59[0];
            _zz_8 <= _zz_60[0];
            _zz_10 <= _zz_61[0];
            _zz_12 <= _zz_62[0];
            _zz_14 <= _zz_63[0];
            _zz_16 <= _zz_64[0];
            _zz_18 <= _zz_65[0];
            _zz_20 <= _zz_66[0];
            _zz_22 <= _zz_67[0];
            _zz_24 <= _zz_68[0];
            _zz_26 <= _zz_69[0];
            _zz_28 <= _zz_70[0];
            _zz_30 <= _zz_71[0];
            _zz_32 <= _zz_72[0];
          end
        end
        12'b000000100000 : begin
          if(mapper_doWrite)begin
            _zz_33 <= _zz_73[0];
            _zz_37 <= _zz_74[0];
          end
        end
        12'b000000100100 : begin
          if(mapper_doWrite)begin
            _zz_34 <= _zz_75[0];
            _zz_38 <= _zz_76[0];
          end
        end
        12'b000000101000 : begin
          if(mapper_doWrite)begin
            _zz_35 <= _zz_77[0];
            _zz_39 <= _zz_78[0];
          end
        end
        12'b000000101100 : begin
          if(mapper_doWrite)begin
            _zz_36 <= _zz_79[0];
            _zz_40 <= _zz_80[0];
          end
        end
        default : begin
        end
      endcase
    end
  end


endmodule

module Apb3I2cCtrl (
  input      [7:0]    io_apb_PADDR,
  input      [0:0]    io_apb_PSEL,
  input               io_apb_PENABLE,
  output              io_apb_PREADY,
  input               io_apb_PWRITE,
  input      [31:0]   io_apb_PWDATA,
  output reg [31:0]   io_apb_PRDATA,
  output              io_i2c_sda_write,
  input               io_i2c_sda_read,
  output              io_i2c_scl_write,
  input               io_i2c_scl_read,
  output              io_interrupt,
  input               io_systemClk,
  input               systemCd_logic_outputReset
);
  reg                 _zz_17;
  reg                 _zz_18;
  reg                 _zz_19;
  wire                i2cCtrl_io_i2c_scl_write;
  wire                i2cCtrl_io_i2c_sda_write;
  wire       `I2cSlaveCmdMode_defaultEncoding_type i2cCtrl_io_bus_cmd_kind;
  wire                i2cCtrl_io_bus_cmd_data;
  wire                i2cCtrl_io_internals_inFrame;
  wire                i2cCtrl_io_internals_sdaRead;
  wire                i2cCtrl_io_internals_sclRead;
  wire                _zz_20;
  wire                _zz_21;
  wire                _zz_22;
  wire                _zz_23;
  wire                _zz_24;
  wire                _zz_25;
  wire                _zz_26;
  wire                _zz_27;
  wire                _zz_28;
  wire       [6:0]    _zz_29;
  wire       [6:0]    _zz_30;
  wire       [0:0]    _zz_31;
  wire       [0:0]    _zz_32;
  wire       [0:0]    _zz_33;
  wire       [0:0]    _zz_34;
  wire       [0:0]    _zz_35;
  wire       [0:0]    _zz_36;
  wire       [0:0]    _zz_37;
  wire       [11:0]   _zz_38;
  wire       [2:0]    _zz_39;
  wire       [2:0]    _zz_40;
  wire       [0:0]    _zz_41;
  wire       [0:0]    _zz_42;
  wire       [0:0]    _zz_43;
  wire       [0:0]    _zz_44;
  wire       [0:0]    _zz_45;
  wire       [0:0]    _zz_46;
  wire       [0:0]    _zz_47;
  wire       [0:0]    _zz_48;
  wire       [0:0]    _zz_49;
  wire       [0:0]    _zz_50;
  wire       [0:0]    _zz_51;
  wire       [0:0]    _zz_52;
  wire       [0:0]    _zz_53;
  wire       [0:0]    _zz_54;
  wire       [0:0]    _zz_55;
  wire       [0:0]    _zz_56;
  wire       [0:0]    _zz_57;
  wire       [0:0]    _zz_58;
  wire       [0:0]    _zz_59;
  wire       [0:0]    _zz_60;
  wire       [0:0]    _zz_61;
  wire       [0:0]    _zz_62;
  wire       [0:0]    _zz_63;
  wire       [0:0]    _zz_64;
  wire       [0:0]    _zz_65;
  wire       [0:0]    _zz_66;
  wire       [0:0]    _zz_67;
  wire       [0:0]    _zz_68;
  wire       [0:0]    _zz_69;
  wire       [0:0]    _zz_70;
  wire       [0:0]    _zz_71;
  wire       [0:0]    _zz_72;
  wire       [0:0]    _zz_73;
  wire       [0:0]    _zz_74;
  wire       [0:0]    _zz_75;
  wire       [0:0]    _zz_76;
  wire       [0:0]    _zz_77;
  wire                busCtrl_askWrite;
  wire                busCtrl_askRead;
  wire                busCtrl_doWrite;
  wire                busCtrl_doRead;
  reg                 bridge_frameReset;
  reg                 bridge_i2cBuffer_sda_write;
  wire                bridge_i2cBuffer_sda_read;
  reg                 bridge_i2cBuffer_scl_write;
  wire                bridge_i2cBuffer_scl_read;
  reg                 bridge_rxData_event;
  reg                 bridge_rxData_listen;
  reg                 bridge_rxData_valid;
  reg        [7:0]    bridge_rxData_value;
  reg                 _zz_1;
  reg                 bridge_rxAck_listen;
  reg                 bridge_rxAck_valid;
  reg                 bridge_rxAck_value;
  reg                 _zz_2;
  reg                 bridge_txData_valid;
  reg                 bridge_txData_repeat;
  reg                 bridge_txData_enable;
  reg        [7:0]    bridge_txData_value;
  reg                 bridge_txData_forceDisable;
  reg                 bridge_txData_disableOnDataConflict;
  reg                 bridge_txAck_valid;
  reg                 bridge_txAck_repeat;
  reg                 bridge_txAck_enable;
  reg                 bridge_txAck_value;
  reg                 bridge_txAck_forceAck;
  reg                 bridge_txAck_disableOnDataConflict;
  reg                 bridge_addressFilter_addresses_0_enable;
  reg        [9:0]    bridge_addressFilter_addresses_0_value;
  reg                 bridge_addressFilter_addresses_0_is10Bit;
  reg                 bridge_addressFilter_addresses_1_enable;
  reg        [9:0]    bridge_addressFilter_addresses_1_value;
  reg                 bridge_addressFilter_addresses_1_is10Bit;
  reg        [1:0]    bridge_addressFilter_state;
  reg        [7:0]    bridge_addressFilter_byte0;
  reg        [7:0]    bridge_addressFilter_byte1;
  wire                bridge_addressFilter_byte0Is10Bit;
  wire                bridge_addressFilter_hits_0;
  wire                bridge_addressFilter_hits_1;
  wire                _zz_3;
  reg                 _zz_3_regNext;
  reg                 bridge_masterLogic_start;
  reg                 _zz_4;
  reg                 bridge_masterLogic_stop;
  reg                 _zz_5;
  reg                 bridge_masterLogic_drop;
  reg                 _zz_6;
  reg        [11:0]   bridge_masterLogic_timer_value;
  reg        [11:0]   bridge_masterLogic_timer_tLow;
  reg        [11:0]   bridge_masterLogic_timer_tHigh;
  reg        [11:0]   bridge_masterLogic_timer_tBuf;
  wire                bridge_masterLogic_timer_done;
  wire                bridge_masterLogic_txReady;
  wire                bridge_masterLogic_fsm_wantExit;
  reg                 bridge_masterLogic_fsm_inFrameLate;
  wire                bridge_masterLogic_fsm_isBusy;
  reg        [2:0]    bridge_dataCounter;
  reg                 bridge_inAckState;
  reg                 bridge_wasntAck;
  reg                 bridge_interruptCtrl_rxDataEnable;
  reg                 bridge_interruptCtrl_rxAckEnable;
  reg                 bridge_interruptCtrl_txDataEnable;
  reg                 bridge_interruptCtrl_txAckEnable;
  reg                 bridge_interruptCtrl_interrupt;
  reg                 bridge_interruptCtrl_start_enable;
  reg                 bridge_interruptCtrl_start_flag;
  reg                 _zz_7;
  reg                 bridge_interruptCtrl_restart_enable;
  reg                 bridge_interruptCtrl_restart_flag;
  reg                 _zz_8;
  reg                 bridge_interruptCtrl_end_enable;
  reg                 bridge_interruptCtrl_end_flag;
  reg                 _zz_9;
  reg                 bridge_interruptCtrl_drop_enable;
  reg                 bridge_interruptCtrl_drop_flag;
  reg                 _zz_10;
  wire                _zz_11;
  reg                 _zz_11_regNext;
  reg                 bridge_interruptCtrl_filterGen_enable;
  reg                 bridge_interruptCtrl_filterGen_flag;
  reg                 _zz_12;
  reg                 bridge_masterLogic_fsm_isBusy_regNext;
  reg                 bridge_interruptCtrl_clockGen_enable;
  reg                 bridge_interruptCtrl_clockGen_flag;
  reg                 _zz_13;
  reg        [9:0]    _zz_14;
  reg        [19:0]   _zz_15 = 20'b00000000000000000000;
  reg        [5:0]    _zz_16 = 6'b000000;
  reg                 bridge_i2cBuffer_scl_write_regNext;
  reg                 bridge_i2cBuffer_sda_write_regNext;
  reg        `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_type bridge_masterLogic_fsm_stateReg;
  reg        `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_type bridge_masterLogic_fsm_stateNext;
  reg                 i2cCtrl_io_internals_inFrame_regNext;
  `ifndef SYNTHESIS
  reg [239:0] bridge_masterLogic_fsm_stateReg_string;
  reg [239:0] bridge_masterLogic_fsm_stateNext_string;
  `endif


  assign _zz_20 = (bridge_masterLogic_stop && (! bridge_inAckState));
  assign _zz_21 = (bridge_masterLogic_start && (! bridge_inAckState));
  assign _zz_22 = ((i2cCtrl_io_bus_cmd_kind == `I2cSlaveCmdMode_defaultEncoding_STOP) || (i2cCtrl_io_bus_cmd_kind == `I2cSlaveCmdMode_defaultEncoding_DROP));
  assign _zz_23 = (! bridge_inAckState);
  assign _zz_24 = (bridge_wasntAck && (! bridge_masterLogic_fsm_isBusy));
  assign _zz_25 = ((! i2cCtrl_io_internals_inFrame) && i2cCtrl_io_internals_inFrame_regNext);
  assign _zz_26 = (bridge_masterLogic_start && (! bridge_masterLogic_fsm_inFrameLate));
  assign _zz_27 = (bridge_masterLogic_drop || ((! (bridge_masterLogic_fsm_stateReg == `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_IDLE)) && (i2cCtrl_io_bus_cmd_kind == `I2cSlaveCmdMode_defaultEncoding_DROP)));
  assign _zz_28 = (! bridge_inAckState);
  assign _zz_29 = (bridge_addressFilter_byte0 >>> 1);
  assign _zz_30 = (bridge_addressFilter_byte0 >>> 1);
  assign _zz_31 = io_apb_PWDATA[4 : 4];
  assign _zz_32 = (1'b1);
  assign _zz_33 = io_apb_PWDATA[5 : 5];
  assign _zz_34 = (1'b1);
  assign _zz_35 = io_apb_PWDATA[6 : 6];
  assign _zz_36 = (1'b1);
  assign _zz_37 = (! bridge_masterLogic_timer_done);
  assign _zz_38 = {11'd0, _zz_37};
  assign _zz_39 = ((3'b111) - bridge_dataCounter);
  assign _zz_40 = ((3'b111) - bridge_dataCounter);
  assign _zz_41 = io_apb_PWDATA[4 : 4];
  assign _zz_42 = (1'b0);
  assign _zz_43 = io_apb_PWDATA[5 : 5];
  assign _zz_44 = (1'b0);
  assign _zz_45 = io_apb_PWDATA[6 : 6];
  assign _zz_46 = (1'b0);
  assign _zz_47 = io_apb_PWDATA[7 : 7];
  assign _zz_48 = (1'b0);
  assign _zz_49 = io_apb_PWDATA[17 : 17];
  assign _zz_50 = (1'b0);
  assign _zz_51 = io_apb_PWDATA[16 : 16];
  assign _zz_52 = (1'b0);
  assign _zz_53 = io_apb_PWDATA[9 : 9];
  assign _zz_54 = io_apb_PWDATA[9 : 9];
  assign _zz_55 = io_apb_PWDATA[10 : 10];
  assign _zz_56 = io_apb_PWDATA[11 : 11];
  assign _zz_57 = io_apb_PWDATA[8 : 8];
  assign _zz_58 = io_apb_PWDATA[9 : 9];
  assign _zz_59 = io_apb_PWDATA[0 : 0];
  assign _zz_60 = io_apb_PWDATA[10 : 10];
  assign _zz_61 = io_apb_PWDATA[11 : 11];
  assign _zz_62 = io_apb_PWDATA[8 : 8];
  assign _zz_63 = io_apb_PWDATA[9 : 9];
  assign _zz_64 = io_apb_PWDATA[14 : 14];
  assign _zz_65 = io_apb_PWDATA[15 : 15];
  assign _zz_66 = io_apb_PWDATA[14 : 14];
  assign _zz_67 = io_apb_PWDATA[15 : 15];
  assign _zz_68 = io_apb_PWDATA[0 : 0];
  assign _zz_69 = io_apb_PWDATA[1 : 1];
  assign _zz_70 = io_apb_PWDATA[2 : 2];
  assign _zz_71 = io_apb_PWDATA[3 : 3];
  assign _zz_72 = io_apb_PWDATA[4 : 4];
  assign _zz_73 = io_apb_PWDATA[5 : 5];
  assign _zz_74 = io_apb_PWDATA[6 : 6];
  assign _zz_75 = io_apb_PWDATA[7 : 7];
  assign _zz_76 = io_apb_PWDATA[17 : 17];
  assign _zz_77 = io_apb_PWDATA[16 : 16];
  I2cSlave i2cCtrl (
    .io_i2c_sda_write                  (i2cCtrl_io_i2c_sda_write      ), //o
    .io_i2c_sda_read                   (bridge_i2cBuffer_sda_read     ), //i
    .io_i2c_scl_write                  (i2cCtrl_io_i2c_scl_write      ), //o
    .io_i2c_scl_read                   (bridge_i2cBuffer_scl_read     ), //i
    .io_config_samplingClockDivider    (_zz_14[9:0]                   ), //i
    .io_config_timeout                 (_zz_15[19:0]                  ), //i
    .io_config_tsuData                 (_zz_16[5:0]                   ), //i
    .io_bus_cmd_kind                   (i2cCtrl_io_bus_cmd_kind[2:0]  ), //o
    .io_bus_cmd_data                   (i2cCtrl_io_bus_cmd_data       ), //o
    .io_bus_rsp_valid                  (_zz_17                        ), //i
    .io_bus_rsp_enable                 (_zz_18                        ), //i
    .io_bus_rsp_data                   (_zz_19                        ), //i
    .io_internals_inFrame              (i2cCtrl_io_internals_inFrame  ), //o
    .io_internals_sdaRead              (i2cCtrl_io_internals_sdaRead  ), //o
    .io_internals_sclRead              (i2cCtrl_io_internals_sclRead  ), //o
    .io_systemClk                      (io_systemClk                  ), //i
    .systemCd_logic_outputReset        (systemCd_logic_outputReset    )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(bridge_masterLogic_fsm_stateReg)
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_boot : bridge_masterLogic_fsm_stateReg_string = "boot                          ";
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_IDLE : bridge_masterLogic_fsm_stateReg_string = "bridge_masterLogic_fsm_IDLE   ";
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_START1 : bridge_masterLogic_fsm_stateReg_string = "bridge_masterLogic_fsm_START1 ";
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_START2 : bridge_masterLogic_fsm_stateReg_string = "bridge_masterLogic_fsm_START2 ";
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_LOW : bridge_masterLogic_fsm_stateReg_string = "bridge_masterLogic_fsm_LOW    ";
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_HIGH : bridge_masterLogic_fsm_stateReg_string = "bridge_masterLogic_fsm_HIGH   ";
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_RESTART : bridge_masterLogic_fsm_stateReg_string = "bridge_masterLogic_fsm_RESTART";
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_STOP1 : bridge_masterLogic_fsm_stateReg_string = "bridge_masterLogic_fsm_STOP1  ";
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_STOP2 : bridge_masterLogic_fsm_stateReg_string = "bridge_masterLogic_fsm_STOP2  ";
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_TBUF : bridge_masterLogic_fsm_stateReg_string = "bridge_masterLogic_fsm_TBUF   ";
      default : bridge_masterLogic_fsm_stateReg_string = "??????????????????????????????";
    endcase
  end
  always @(*) begin
    case(bridge_masterLogic_fsm_stateNext)
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_boot : bridge_masterLogic_fsm_stateNext_string = "boot                          ";
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_IDLE : bridge_masterLogic_fsm_stateNext_string = "bridge_masterLogic_fsm_IDLE   ";
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_START1 : bridge_masterLogic_fsm_stateNext_string = "bridge_masterLogic_fsm_START1 ";
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_START2 : bridge_masterLogic_fsm_stateNext_string = "bridge_masterLogic_fsm_START2 ";
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_LOW : bridge_masterLogic_fsm_stateNext_string = "bridge_masterLogic_fsm_LOW    ";
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_HIGH : bridge_masterLogic_fsm_stateNext_string = "bridge_masterLogic_fsm_HIGH   ";
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_RESTART : bridge_masterLogic_fsm_stateNext_string = "bridge_masterLogic_fsm_RESTART";
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_STOP1 : bridge_masterLogic_fsm_stateNext_string = "bridge_masterLogic_fsm_STOP1  ";
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_STOP2 : bridge_masterLogic_fsm_stateNext_string = "bridge_masterLogic_fsm_STOP2  ";
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_TBUF : bridge_masterLogic_fsm_stateNext_string = "bridge_masterLogic_fsm_TBUF   ";
      default : bridge_masterLogic_fsm_stateNext_string = "??????????????????????????????";
    endcase
  end
  `endif

  assign io_apb_PREADY = 1'b1;
  always @ (*) begin
    io_apb_PRDATA = 32'h0;
    case(io_apb_PADDR)
      8'b00001000 : begin
        io_apb_PRDATA[8 : 8] = bridge_rxData_valid;
        io_apb_PRDATA[7 : 0] = bridge_rxData_value;
      end
      8'b00001100 : begin
        io_apb_PRDATA[8 : 8] = bridge_rxAck_valid;
        io_apb_PRDATA[0 : 0] = bridge_rxAck_value;
      end
      8'b00000000 : begin
        io_apb_PRDATA[8 : 8] = bridge_txData_valid;
        io_apb_PRDATA[9 : 9] = bridge_txData_enable;
      end
      8'b00000100 : begin
        io_apb_PRDATA[8 : 8] = bridge_txAck_valid;
        io_apb_PRDATA[9 : 9] = bridge_txAck_enable;
      end
      8'b10001000 : begin
      end
      8'b10001100 : begin
      end
      8'b10000000 : begin
        io_apb_PRDATA[1 : 0] = {bridge_addressFilter_hits_1,bridge_addressFilter_hits_0};
      end
      8'b10000100 : begin
        io_apb_PRDATA[0 : 0] = bridge_addressFilter_byte0[0];
      end
      8'b01000000 : begin
        io_apb_PRDATA[4 : 4] = bridge_masterLogic_start;
        io_apb_PRDATA[5 : 5] = bridge_masterLogic_stop;
        io_apb_PRDATA[6 : 6] = bridge_masterLogic_drop;
        io_apb_PRDATA[0 : 0] = bridge_masterLogic_fsm_isBusy;
      end
      8'b01010000 : begin
      end
      8'b01010100 : begin
      end
      8'b01011000 : begin
      end
      8'b00100000 : begin
        io_apb_PRDATA[0 : 0] = bridge_interruptCtrl_rxDataEnable;
        io_apb_PRDATA[1 : 1] = bridge_interruptCtrl_rxAckEnable;
        io_apb_PRDATA[2 : 2] = bridge_interruptCtrl_txDataEnable;
        io_apb_PRDATA[3 : 3] = bridge_interruptCtrl_txAckEnable;
        io_apb_PRDATA[4 : 4] = bridge_interruptCtrl_start_enable;
        io_apb_PRDATA[5 : 5] = bridge_interruptCtrl_restart_enable;
        io_apb_PRDATA[6 : 6] = bridge_interruptCtrl_end_enable;
        io_apb_PRDATA[7 : 7] = bridge_interruptCtrl_drop_enable;
        io_apb_PRDATA[17 : 17] = bridge_interruptCtrl_filterGen_enable;
        io_apb_PRDATA[16 : 16] = bridge_interruptCtrl_clockGen_enable;
      end
      8'b00100100 : begin
        io_apb_PRDATA[4 : 4] = bridge_interruptCtrl_start_flag;
        io_apb_PRDATA[5 : 5] = bridge_interruptCtrl_restart_flag;
        io_apb_PRDATA[6 : 6] = bridge_interruptCtrl_end_flag;
        io_apb_PRDATA[7 : 7] = bridge_interruptCtrl_drop_flag;
        io_apb_PRDATA[17 : 17] = bridge_interruptCtrl_filterGen_flag;
        io_apb_PRDATA[16 : 16] = bridge_interruptCtrl_clockGen_flag;
      end
      8'b00101000 : begin
      end
      8'b00101100 : begin
      end
      8'b00110000 : begin
      end
      default : begin
      end
    endcase
  end

  assign busCtrl_askWrite = ((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PWRITE);
  assign busCtrl_askRead = ((io_apb_PSEL[0] && io_apb_PENABLE) && (! io_apb_PWRITE));
  assign busCtrl_doWrite = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && io_apb_PWRITE);
  assign busCtrl_doRead = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && (! io_apb_PWRITE));
  always @ (*) begin
    bridge_frameReset = 1'b0;
    case(i2cCtrl_io_bus_cmd_kind)
      `I2cSlaveCmdMode_defaultEncoding_START : begin
        bridge_frameReset = 1'b1;
      end
      `I2cSlaveCmdMode_defaultEncoding_RESTART : begin
        bridge_frameReset = 1'b1;
      end
      `I2cSlaveCmdMode_defaultEncoding_STOP : begin
        bridge_frameReset = 1'b1;
      end
      `I2cSlaveCmdMode_defaultEncoding_DROP : begin
        bridge_frameReset = 1'b1;
      end
      `I2cSlaveCmdMode_defaultEncoding_READ : begin
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    bridge_i2cBuffer_sda_write = i2cCtrl_io_i2c_sda_write;
    case(bridge_masterLogic_fsm_stateReg)
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_IDLE : begin
      end
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_START1 : begin
        bridge_i2cBuffer_sda_write = 1'b0;
      end
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_START2 : begin
        bridge_i2cBuffer_sda_write = 1'b0;
      end
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_LOW : begin
      end
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_HIGH : begin
      end
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_RESTART : begin
      end
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_STOP1 : begin
        bridge_i2cBuffer_sda_write = 1'b0;
      end
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_STOP2 : begin
        bridge_i2cBuffer_sda_write = 1'b0;
      end
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_TBUF : begin
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    bridge_i2cBuffer_scl_write = i2cCtrl_io_i2c_scl_write;
    case(bridge_masterLogic_fsm_stateReg)
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_IDLE : begin
      end
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_START1 : begin
      end
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_START2 : begin
        bridge_i2cBuffer_scl_write = 1'b0;
      end
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_LOW : begin
        if(bridge_masterLogic_timer_done)begin
          if(_zz_20)begin
            bridge_i2cBuffer_scl_write = 1'b0;
          end else begin
            if(_zz_21)begin
              bridge_i2cBuffer_scl_write = 1'b0;
            end
          end
        end else begin
          bridge_i2cBuffer_scl_write = 1'b0;
        end
      end
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_HIGH : begin
      end
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_RESTART : begin
      end
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_STOP1 : begin
        bridge_i2cBuffer_scl_write = 1'b0;
      end
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_STOP2 : begin
      end
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_TBUF : begin
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    _zz_1 = 1'b0;
    case(io_apb_PADDR)
      8'b00001000 : begin
        if(busCtrl_doRead)begin
          _zz_1 = 1'b1;
        end
      end
      8'b00001100 : begin
      end
      8'b00000000 : begin
      end
      8'b00000100 : begin
      end
      8'b10001000 : begin
      end
      8'b10001100 : begin
      end
      8'b10000000 : begin
      end
      8'b10000100 : begin
      end
      8'b01000000 : begin
      end
      8'b01010000 : begin
      end
      8'b01010100 : begin
      end
      8'b01011000 : begin
      end
      8'b00100000 : begin
      end
      8'b00100100 : begin
      end
      8'b00101000 : begin
      end
      8'b00101100 : begin
      end
      8'b00110000 : begin
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    _zz_2 = 1'b0;
    case(io_apb_PADDR)
      8'b00001000 : begin
      end
      8'b00001100 : begin
        if(busCtrl_doRead)begin
          _zz_2 = 1'b1;
        end
      end
      8'b00000000 : begin
      end
      8'b00000100 : begin
      end
      8'b10001000 : begin
      end
      8'b10001100 : begin
      end
      8'b10000000 : begin
      end
      8'b10000100 : begin
      end
      8'b01000000 : begin
      end
      8'b01010000 : begin
      end
      8'b01010100 : begin
      end
      8'b01011000 : begin
      end
      8'b00100000 : begin
      end
      8'b00100100 : begin
      end
      8'b00101000 : begin
      end
      8'b00101100 : begin
      end
      8'b00110000 : begin
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    bridge_txData_forceDisable = 1'b0;
    if(_zz_22)begin
      bridge_txData_forceDisable = 1'b0;
    end
    case(bridge_masterLogic_fsm_stateReg)
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_IDLE : begin
      end
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_START1 : begin
      end
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_START2 : begin
      end
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_LOW : begin
        if(bridge_masterLogic_timer_done)begin
          if(_zz_20)begin
            bridge_txData_forceDisable = 1'b1;
          end else begin
            if(_zz_21)begin
              bridge_txData_forceDisable = 1'b1;
            end
          end
        end
      end
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_HIGH : begin
      end
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_RESTART : begin
      end
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_STOP1 : begin
      end
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_STOP2 : begin
      end
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_TBUF : begin
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    bridge_txAck_forceAck = 1'b0;
    if(((bridge_addressFilter_byte0Is10Bit && (bridge_addressFilter_state == (2'b01))) && ({((bridge_addressFilter_addresses_1_enable && bridge_addressFilter_addresses_1_is10Bit) && (bridge_addressFilter_byte0[2 : 1] == bridge_addressFilter_addresses_1_value[9 : 8])),((bridge_addressFilter_addresses_0_enable && bridge_addressFilter_addresses_0_is10Bit) && (bridge_addressFilter_byte0[2 : 1] == bridge_addressFilter_addresses_0_value[9 : 8]))} != (2'b00))))begin
      bridge_txAck_forceAck = 1'b1;
    end
  end

  assign bridge_addressFilter_byte0Is10Bit = (bridge_addressFilter_byte0[7 : 3] == 5'h1e);
  assign bridge_addressFilter_hits_0 = (bridge_addressFilter_addresses_0_enable && ((! bridge_addressFilter_addresses_0_is10Bit) ? ((_zz_29 == bridge_addressFilter_addresses_0_value[6 : 0]) && (bridge_addressFilter_state != (2'b00))) : (({bridge_addressFilter_byte0[2 : 1],bridge_addressFilter_byte1} == bridge_addressFilter_addresses_0_value) && (bridge_addressFilter_state == (2'b10)))));
  assign bridge_addressFilter_hits_1 = (bridge_addressFilter_addresses_1_enable && ((! bridge_addressFilter_addresses_1_is10Bit) ? ((_zz_30 == bridge_addressFilter_addresses_1_value[6 : 0]) && (bridge_addressFilter_state != (2'b00))) : (({bridge_addressFilter_byte0[2 : 1],bridge_addressFilter_byte1} == bridge_addressFilter_addresses_1_value) && (bridge_addressFilter_state == (2'b10)))));
  assign _zz_3 = ({bridge_addressFilter_hits_1,bridge_addressFilter_hits_0} != (2'b00));
  always @ (*) begin
    _zz_4 = 1'b0;
    case(io_apb_PADDR)
      8'b00001000 : begin
      end
      8'b00001100 : begin
      end
      8'b00000000 : begin
      end
      8'b00000100 : begin
      end
      8'b10001000 : begin
      end
      8'b10001100 : begin
      end
      8'b10000000 : begin
      end
      8'b10000100 : begin
      end
      8'b01000000 : begin
        if(busCtrl_doWrite)begin
          _zz_4 = 1'b1;
        end
      end
      8'b01010000 : begin
      end
      8'b01010100 : begin
      end
      8'b01011000 : begin
      end
      8'b00100000 : begin
      end
      8'b00100100 : begin
      end
      8'b00101000 : begin
      end
      8'b00101100 : begin
      end
      8'b00110000 : begin
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    _zz_5 = 1'b0;
    case(io_apb_PADDR)
      8'b00001000 : begin
      end
      8'b00001100 : begin
      end
      8'b00000000 : begin
      end
      8'b00000100 : begin
      end
      8'b10001000 : begin
      end
      8'b10001100 : begin
      end
      8'b10000000 : begin
      end
      8'b10000100 : begin
      end
      8'b01000000 : begin
        if(busCtrl_doWrite)begin
          _zz_5 = 1'b1;
        end
      end
      8'b01010000 : begin
      end
      8'b01010100 : begin
      end
      8'b01011000 : begin
      end
      8'b00100000 : begin
      end
      8'b00100100 : begin
      end
      8'b00101000 : begin
      end
      8'b00101100 : begin
      end
      8'b00110000 : begin
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    _zz_6 = 1'b0;
    case(io_apb_PADDR)
      8'b00001000 : begin
      end
      8'b00001100 : begin
      end
      8'b00000000 : begin
      end
      8'b00000100 : begin
      end
      8'b10001000 : begin
      end
      8'b10001100 : begin
      end
      8'b10000000 : begin
      end
      8'b10000100 : begin
      end
      8'b01000000 : begin
        if(busCtrl_doWrite)begin
          _zz_6 = 1'b1;
        end
      end
      8'b01010000 : begin
      end
      8'b01010100 : begin
      end
      8'b01011000 : begin
      end
      8'b00100000 : begin
      end
      8'b00100100 : begin
      end
      8'b00101000 : begin
      end
      8'b00101100 : begin
      end
      8'b00110000 : begin
      end
      default : begin
      end
    endcase
  end

  assign bridge_masterLogic_timer_done = (bridge_masterLogic_timer_value == 12'h0);
  assign bridge_masterLogic_fsm_wantExit = 1'b0;
  assign bridge_masterLogic_fsm_isBusy = ((! (bridge_masterLogic_fsm_stateReg == `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_IDLE)) && (! (bridge_masterLogic_fsm_stateReg == `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_TBUF)));
  assign bridge_masterLogic_txReady = (bridge_inAckState ? bridge_txAck_valid : bridge_txData_valid);
  always @ (*) begin
    if(_zz_23)begin
      _zz_17 = ((bridge_txData_valid && (! (bridge_rxData_valid && bridge_rxData_listen))) && (i2cCtrl_io_bus_cmd_kind == `I2cSlaveCmdMode_defaultEncoding_DRIVE));
      if(bridge_txData_forceDisable)begin
        _zz_17 = 1'b1;
      end
    end else begin
      _zz_17 = ((bridge_txAck_valid && (! (bridge_rxAck_valid && bridge_rxAck_listen))) && (i2cCtrl_io_bus_cmd_kind == `I2cSlaveCmdMode_defaultEncoding_DRIVE));
      if(bridge_txAck_forceAck)begin
        _zz_17 = 1'b1;
      end
    end
    if(_zz_24)begin
      _zz_17 = (i2cCtrl_io_bus_cmd_kind == `I2cSlaveCmdMode_defaultEncoding_DRIVE);
    end
  end

  always @ (*) begin
    if(_zz_23)begin
      _zz_18 = bridge_txData_enable;
      if(bridge_txData_forceDisable)begin
        _zz_18 = 1'b0;
      end
    end else begin
      _zz_18 = bridge_txAck_enable;
      if(bridge_txAck_forceAck)begin
        _zz_18 = 1'b1;
      end
    end
    if(_zz_24)begin
      _zz_18 = 1'b0;
    end
  end

  always @ (*) begin
    if(_zz_23)begin
      _zz_19 = bridge_txData_value[_zz_39];
    end else begin
      _zz_19 = bridge_txAck_value;
      if(bridge_txAck_forceAck)begin
        _zz_19 = 1'b0;
      end
    end
  end

  always @ (*) begin
    bridge_interruptCtrl_interrupt = ((((bridge_interruptCtrl_rxDataEnable && bridge_rxData_valid) || (bridge_interruptCtrl_rxAckEnable && bridge_rxAck_valid)) || (bridge_interruptCtrl_txDataEnable && (! bridge_txData_valid))) || (bridge_interruptCtrl_txAckEnable && (! bridge_txAck_valid)));
    if(bridge_interruptCtrl_start_flag)begin
      bridge_interruptCtrl_interrupt = 1'b1;
    end
    if(bridge_interruptCtrl_restart_flag)begin
      bridge_interruptCtrl_interrupt = 1'b1;
    end
    if(bridge_interruptCtrl_end_flag)begin
      bridge_interruptCtrl_interrupt = 1'b1;
    end
    if(bridge_interruptCtrl_drop_flag)begin
      bridge_interruptCtrl_interrupt = 1'b1;
    end
    if(bridge_interruptCtrl_filterGen_flag)begin
      bridge_interruptCtrl_interrupt = 1'b1;
    end
    if(bridge_interruptCtrl_clockGen_flag)begin
      bridge_interruptCtrl_interrupt = 1'b1;
    end
  end

  always @ (*) begin
    _zz_7 = 1'b0;
    case(io_apb_PADDR)
      8'b00001000 : begin
      end
      8'b00001100 : begin
      end
      8'b00000000 : begin
      end
      8'b00000100 : begin
      end
      8'b10001000 : begin
      end
      8'b10001100 : begin
      end
      8'b10000000 : begin
      end
      8'b10000100 : begin
      end
      8'b01000000 : begin
      end
      8'b01010000 : begin
      end
      8'b01010100 : begin
      end
      8'b01011000 : begin
      end
      8'b00100000 : begin
      end
      8'b00100100 : begin
        if(busCtrl_doWrite)begin
          _zz_7 = 1'b1;
        end
      end
      8'b00101000 : begin
      end
      8'b00101100 : begin
      end
      8'b00110000 : begin
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    _zz_8 = 1'b0;
    case(io_apb_PADDR)
      8'b00001000 : begin
      end
      8'b00001100 : begin
      end
      8'b00000000 : begin
      end
      8'b00000100 : begin
      end
      8'b10001000 : begin
      end
      8'b10001100 : begin
      end
      8'b10000000 : begin
      end
      8'b10000100 : begin
      end
      8'b01000000 : begin
      end
      8'b01010000 : begin
      end
      8'b01010100 : begin
      end
      8'b01011000 : begin
      end
      8'b00100000 : begin
      end
      8'b00100100 : begin
        if(busCtrl_doWrite)begin
          _zz_8 = 1'b1;
        end
      end
      8'b00101000 : begin
      end
      8'b00101100 : begin
      end
      8'b00110000 : begin
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    _zz_9 = 1'b0;
    case(io_apb_PADDR)
      8'b00001000 : begin
      end
      8'b00001100 : begin
      end
      8'b00000000 : begin
      end
      8'b00000100 : begin
      end
      8'b10001000 : begin
      end
      8'b10001100 : begin
      end
      8'b10000000 : begin
      end
      8'b10000100 : begin
      end
      8'b01000000 : begin
      end
      8'b01010000 : begin
      end
      8'b01010100 : begin
      end
      8'b01011000 : begin
      end
      8'b00100000 : begin
      end
      8'b00100100 : begin
        if(busCtrl_doWrite)begin
          _zz_9 = 1'b1;
        end
      end
      8'b00101000 : begin
      end
      8'b00101100 : begin
      end
      8'b00110000 : begin
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    _zz_10 = 1'b0;
    case(io_apb_PADDR)
      8'b00001000 : begin
      end
      8'b00001100 : begin
      end
      8'b00000000 : begin
      end
      8'b00000100 : begin
      end
      8'b10001000 : begin
      end
      8'b10001100 : begin
      end
      8'b10000000 : begin
      end
      8'b10000100 : begin
      end
      8'b01000000 : begin
      end
      8'b01010000 : begin
      end
      8'b01010100 : begin
      end
      8'b01011000 : begin
      end
      8'b00100000 : begin
      end
      8'b00100100 : begin
        if(busCtrl_doWrite)begin
          _zz_10 = 1'b1;
        end
      end
      8'b00101000 : begin
      end
      8'b00101100 : begin
      end
      8'b00110000 : begin
      end
      default : begin
      end
    endcase
  end

  assign _zz_11 = ({bridge_addressFilter_hits_1,bridge_addressFilter_hits_0} != (2'b00));
  always @ (*) begin
    _zz_12 = 1'b0;
    case(io_apb_PADDR)
      8'b00001000 : begin
      end
      8'b00001100 : begin
      end
      8'b00000000 : begin
      end
      8'b00000100 : begin
      end
      8'b10001000 : begin
      end
      8'b10001100 : begin
      end
      8'b10000000 : begin
      end
      8'b10000100 : begin
      end
      8'b01000000 : begin
      end
      8'b01010000 : begin
      end
      8'b01010100 : begin
      end
      8'b01011000 : begin
      end
      8'b00100000 : begin
      end
      8'b00100100 : begin
        if(busCtrl_doWrite)begin
          _zz_12 = 1'b1;
        end
      end
      8'b00101000 : begin
      end
      8'b00101100 : begin
      end
      8'b00110000 : begin
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    _zz_13 = 1'b0;
    case(io_apb_PADDR)
      8'b00001000 : begin
      end
      8'b00001100 : begin
      end
      8'b00000000 : begin
      end
      8'b00000100 : begin
      end
      8'b10001000 : begin
      end
      8'b10001100 : begin
      end
      8'b10000000 : begin
      end
      8'b10000100 : begin
      end
      8'b01000000 : begin
      end
      8'b01010000 : begin
      end
      8'b01010100 : begin
      end
      8'b01011000 : begin
      end
      8'b00100000 : begin
      end
      8'b00100100 : begin
        if(busCtrl_doWrite)begin
          _zz_13 = 1'b1;
        end
      end
      8'b00101000 : begin
      end
      8'b00101100 : begin
      end
      8'b00110000 : begin
      end
      default : begin
      end
    endcase
  end

  assign io_i2c_scl_write = bridge_i2cBuffer_scl_write_regNext;
  assign io_i2c_sda_write = bridge_i2cBuffer_sda_write_regNext;
  assign bridge_i2cBuffer_scl_read = io_i2c_scl_read;
  assign bridge_i2cBuffer_sda_read = io_i2c_sda_read;
  assign io_interrupt = bridge_interruptCtrl_interrupt;
  always @ (*) begin
    bridge_masterLogic_fsm_stateNext = bridge_masterLogic_fsm_stateReg;
    case(bridge_masterLogic_fsm_stateReg)
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_IDLE : begin
        if(_zz_25)begin
          bridge_masterLogic_fsm_stateNext = `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_TBUF;
        end else begin
          if(_zz_26)begin
            bridge_masterLogic_fsm_stateNext = `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_START1;
          end
        end
      end
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_START1 : begin
        if((bridge_masterLogic_timer_done || (! i2cCtrl_io_internals_sclRead)))begin
          bridge_masterLogic_fsm_stateNext = `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_START2;
        end
      end
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_START2 : begin
        if(bridge_masterLogic_timer_done)begin
          bridge_masterLogic_fsm_stateNext = `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_LOW;
        end
      end
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_LOW : begin
        if(bridge_masterLogic_timer_done)begin
          if(_zz_20)begin
            bridge_masterLogic_fsm_stateNext = `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_STOP1;
          end else begin
            if(_zz_21)begin
              bridge_masterLogic_fsm_stateNext = `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_RESTART;
            end else begin
              if(i2cCtrl_io_internals_sclRead)begin
                bridge_masterLogic_fsm_stateNext = `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_HIGH;
              end
            end
          end
        end
      end
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_HIGH : begin
        if((bridge_masterLogic_timer_done || (! i2cCtrl_io_internals_sclRead)))begin
          bridge_masterLogic_fsm_stateNext = `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_LOW;
        end
      end
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_RESTART : begin
        if(bridge_masterLogic_timer_done)begin
          bridge_masterLogic_fsm_stateNext = `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_START1;
        end
      end
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_STOP1 : begin
        if(bridge_masterLogic_timer_done)begin
          bridge_masterLogic_fsm_stateNext = `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_STOP2;
        end
      end
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_STOP2 : begin
        if(bridge_masterLogic_timer_done)begin
          bridge_masterLogic_fsm_stateNext = `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_TBUF;
        end
      end
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_TBUF : begin
        if(bridge_masterLogic_timer_done)begin
          bridge_masterLogic_fsm_stateNext = `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_IDLE;
        end
      end
      default : begin
        bridge_masterLogic_fsm_stateNext = `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_IDLE;
      end
    endcase
    if(_zz_27)begin
      bridge_masterLogic_fsm_stateNext = `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_TBUF;
    end
  end

  always @ (posedge io_systemClk) begin
    if(systemCd_logic_outputReset) begin
      bridge_rxData_event <= 1'b0;
      bridge_rxData_listen <= 1'b0;
      bridge_rxData_valid <= 1'b0;
      bridge_rxAck_listen <= 1'b0;
      bridge_rxAck_valid <= 1'b0;
      bridge_txData_valid <= 1'b1;
      bridge_txData_repeat <= 1'b1;
      bridge_txData_enable <= 1'b0;
      bridge_txAck_valid <= 1'b1;
      bridge_txAck_repeat <= 1'b1;
      bridge_txAck_enable <= 1'b0;
      bridge_addressFilter_addresses_0_enable <= 1'b0;
      bridge_addressFilter_addresses_1_enable <= 1'b0;
      bridge_addressFilter_state <= (2'b00);
      bridge_masterLogic_start <= 1'b0;
      bridge_masterLogic_stop <= 1'b0;
      bridge_masterLogic_drop <= 1'b0;
      bridge_dataCounter <= (3'b000);
      bridge_inAckState <= 1'b0;
      bridge_wasntAck <= 1'b0;
      bridge_interruptCtrl_rxDataEnable <= 1'b0;
      bridge_interruptCtrl_rxAckEnable <= 1'b0;
      bridge_interruptCtrl_txDataEnable <= 1'b0;
      bridge_interruptCtrl_txAckEnable <= 1'b0;
      bridge_interruptCtrl_start_enable <= 1'b0;
      bridge_interruptCtrl_start_flag <= 1'b0;
      bridge_interruptCtrl_restart_enable <= 1'b0;
      bridge_interruptCtrl_restart_flag <= 1'b0;
      bridge_interruptCtrl_end_enable <= 1'b0;
      bridge_interruptCtrl_end_flag <= 1'b0;
      bridge_interruptCtrl_drop_enable <= 1'b0;
      bridge_interruptCtrl_drop_flag <= 1'b0;
      bridge_interruptCtrl_filterGen_enable <= 1'b0;
      bridge_interruptCtrl_filterGen_flag <= 1'b0;
      bridge_interruptCtrl_clockGen_enable <= 1'b0;
      bridge_interruptCtrl_clockGen_flag <= 1'b0;
      _zz_14 <= 10'h0;
      bridge_i2cBuffer_scl_write_regNext <= 1'b1;
      bridge_i2cBuffer_sda_write_regNext <= 1'b1;
      bridge_masterLogic_fsm_stateReg <= `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_boot;
    end else begin
      bridge_rxData_event <= 1'b0;
      if(_zz_1)begin
        bridge_rxData_valid <= 1'b0;
      end
      if(_zz_2)begin
        bridge_rxAck_valid <= 1'b0;
      end
      if(bridge_rxData_event)begin
        case(bridge_addressFilter_state)
          2'b00 : begin
            bridge_addressFilter_state <= (2'b01);
          end
          2'b01 : begin
            bridge_addressFilter_state <= (2'b10);
          end
          default : begin
          end
        endcase
      end
      if(bridge_frameReset)begin
        bridge_addressFilter_state <= (2'b00);
      end
      if((_zz_3 && (! _zz_3_regNext)))begin
        bridge_txAck_valid <= 1'b0;
      end
      if(_zz_4)begin
        if(_zz_31[0])begin
          bridge_masterLogic_start <= _zz_32[0];
        end
      end
      if(_zz_5)begin
        if(_zz_33[0])begin
          bridge_masterLogic_stop <= _zz_34[0];
        end
      end
      if(_zz_6)begin
        if(_zz_35[0])begin
          bridge_masterLogic_drop <= _zz_36[0];
        end
      end
      case(i2cCtrl_io_bus_cmd_kind)
        `I2cSlaveCmdMode_defaultEncoding_START : begin
        end
        `I2cSlaveCmdMode_defaultEncoding_RESTART : begin
        end
        `I2cSlaveCmdMode_defaultEncoding_STOP : begin
        end
        `I2cSlaveCmdMode_defaultEncoding_DROP : begin
        end
        `I2cSlaveCmdMode_defaultEncoding_READ : begin
          if(_zz_28)begin
            bridge_dataCounter <= (bridge_dataCounter + (3'b001));
            if((_zz_19 != i2cCtrl_io_bus_cmd_data))begin
              if(bridge_txData_disableOnDataConflict)begin
                bridge_txData_enable <= 1'b0;
              end
              if(bridge_txAck_disableOnDataConflict)begin
                bridge_txAck_enable <= 1'b0;
              end
            end
            if((bridge_dataCounter == (3'b111)))begin
              if(bridge_rxData_listen)begin
                bridge_rxData_valid <= 1'b1;
              end
              bridge_rxData_event <= 1'b1;
              bridge_inAckState <= 1'b1;
              if((bridge_txData_valid && (! bridge_txData_repeat)))begin
                bridge_txData_valid <= 1'b0;
              end
            end
          end else begin
            if(bridge_rxAck_listen)begin
              bridge_rxAck_valid <= 1'b1;
            end
            bridge_inAckState <= 1'b0;
            bridge_wasntAck <= i2cCtrl_io_bus_cmd_data;
            if((bridge_txAck_valid && (! bridge_txAck_repeat)))begin
              bridge_txAck_valid <= 1'b0;
            end
          end
        end
        default : begin
        end
      endcase
      if(bridge_frameReset)begin
        bridge_inAckState <= 1'b0;
        bridge_dataCounter <= (3'b000);
        bridge_wasntAck <= 1'b0;
      end
      if(_zz_22)begin
        bridge_txData_valid <= 1'b1;
        bridge_txData_enable <= 1'b0;
        bridge_txData_repeat <= 1'b1;
        bridge_txAck_valid <= 1'b1;
        bridge_txAck_enable <= 1'b0;
        bridge_txAck_repeat <= 1'b1;
        bridge_rxData_listen <= 1'b0;
        bridge_rxAck_listen <= 1'b0;
      end
      if((i2cCtrl_io_bus_cmd_kind == `I2cSlaveCmdMode_defaultEncoding_START))begin
        bridge_interruptCtrl_start_flag <= 1'b1;
      end
      if((! bridge_interruptCtrl_start_enable))begin
        bridge_interruptCtrl_start_flag <= 1'b0;
      end
      if(_zz_7)begin
        if(_zz_41[0])begin
          bridge_interruptCtrl_start_flag <= _zz_42[0];
        end
      end
      if((i2cCtrl_io_bus_cmd_kind == `I2cSlaveCmdMode_defaultEncoding_RESTART))begin
        bridge_interruptCtrl_restart_flag <= 1'b1;
      end
      if((! bridge_interruptCtrl_restart_enable))begin
        bridge_interruptCtrl_restart_flag <= 1'b0;
      end
      if(_zz_8)begin
        if(_zz_43[0])begin
          bridge_interruptCtrl_restart_flag <= _zz_44[0];
        end
      end
      if((i2cCtrl_io_bus_cmd_kind == `I2cSlaveCmdMode_defaultEncoding_STOP))begin
        bridge_interruptCtrl_end_flag <= 1'b1;
      end
      if((! bridge_interruptCtrl_end_enable))begin
        bridge_interruptCtrl_end_flag <= 1'b0;
      end
      if(_zz_9)begin
        if(_zz_45[0])begin
          bridge_interruptCtrl_end_flag <= _zz_46[0];
        end
      end
      if((i2cCtrl_io_bus_cmd_kind == `I2cSlaveCmdMode_defaultEncoding_DROP))begin
        bridge_interruptCtrl_drop_flag <= 1'b1;
      end
      if((! bridge_interruptCtrl_drop_enable))begin
        bridge_interruptCtrl_drop_flag <= 1'b0;
      end
      if(_zz_10)begin
        if(_zz_47[0])begin
          bridge_interruptCtrl_drop_flag <= _zz_48[0];
        end
      end
      if((_zz_11 && (! _zz_11_regNext)))begin
        bridge_interruptCtrl_filterGen_flag <= 1'b1;
      end
      if((! bridge_interruptCtrl_filterGen_enable))begin
        bridge_interruptCtrl_filterGen_flag <= 1'b0;
      end
      if(_zz_12)begin
        if(_zz_49[0])begin
          bridge_interruptCtrl_filterGen_flag <= _zz_50[0];
        end
      end
      if((bridge_masterLogic_fsm_isBusy && (! bridge_masterLogic_fsm_isBusy_regNext)))begin
        bridge_interruptCtrl_clockGen_flag <= 1'b1;
      end
      if((! bridge_interruptCtrl_clockGen_enable))begin
        bridge_interruptCtrl_clockGen_flag <= 1'b0;
      end
      if(_zz_13)begin
        if(_zz_51[0])begin
          bridge_interruptCtrl_clockGen_flag <= _zz_52[0];
        end
      end
      bridge_i2cBuffer_scl_write_regNext <= bridge_i2cBuffer_scl_write;
      bridge_i2cBuffer_sda_write_regNext <= bridge_i2cBuffer_sda_write;
      case(io_apb_PADDR)
        8'b00001000 : begin
          if(busCtrl_doWrite)begin
            bridge_rxData_listen <= _zz_53[0];
          end
        end
        8'b00001100 : begin
          if(busCtrl_doWrite)begin
            bridge_rxAck_listen <= _zz_54[0];
          end
        end
        8'b00000000 : begin
          if(busCtrl_doWrite)begin
            bridge_txData_repeat <= _zz_55[0];
            bridge_txData_valid <= _zz_57[0];
            bridge_txData_enable <= _zz_58[0];
          end
        end
        8'b00000100 : begin
          if(busCtrl_doWrite)begin
            bridge_txAck_repeat <= _zz_60[0];
            bridge_txAck_valid <= _zz_62[0];
            bridge_txAck_enable <= _zz_63[0];
          end
        end
        8'b10001000 : begin
          if(busCtrl_doWrite)begin
            bridge_addressFilter_addresses_0_enable <= _zz_65[0];
          end
        end
        8'b10001100 : begin
          if(busCtrl_doWrite)begin
            bridge_addressFilter_addresses_1_enable <= _zz_67[0];
          end
        end
        8'b10000000 : begin
        end
        8'b10000100 : begin
        end
        8'b01000000 : begin
        end
        8'b01010000 : begin
        end
        8'b01010100 : begin
        end
        8'b01011000 : begin
        end
        8'b00100000 : begin
          if(busCtrl_doWrite)begin
            bridge_interruptCtrl_rxDataEnable <= _zz_68[0];
            bridge_interruptCtrl_rxAckEnable <= _zz_69[0];
            bridge_interruptCtrl_txDataEnable <= _zz_70[0];
            bridge_interruptCtrl_txAckEnable <= _zz_71[0];
            bridge_interruptCtrl_start_enable <= _zz_72[0];
            bridge_interruptCtrl_restart_enable <= _zz_73[0];
            bridge_interruptCtrl_end_enable <= _zz_74[0];
            bridge_interruptCtrl_drop_enable <= _zz_75[0];
            bridge_interruptCtrl_filterGen_enable <= _zz_76[0];
            bridge_interruptCtrl_clockGen_enable <= _zz_77[0];
          end
        end
        8'b00100100 : begin
        end
        8'b00101000 : begin
          if(busCtrl_doWrite)begin
            _zz_14 <= io_apb_PWDATA[9 : 0];
          end
        end
        8'b00101100 : begin
        end
        8'b00110000 : begin
        end
        default : begin
        end
      endcase
      bridge_masterLogic_fsm_stateReg <= bridge_masterLogic_fsm_stateNext;
      case(bridge_masterLogic_fsm_stateReg)
        `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_IDLE : begin
          if(! _zz_25) begin
            if(_zz_26)begin
              bridge_txData_valid <= 1'b0;
            end
          end
        end
        `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_START1 : begin
        end
        `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_START2 : begin
          if(bridge_masterLogic_timer_done)begin
            bridge_masterLogic_start <= 1'b0;
          end
        end
        `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_LOW : begin
        end
        `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_HIGH : begin
        end
        `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_RESTART : begin
        end
        `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_STOP1 : begin
        end
        `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_STOP2 : begin
          if(bridge_masterLogic_timer_done)begin
            bridge_masterLogic_stop <= 1'b0;
          end
        end
        `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_TBUF : begin
        end
        default : begin
        end
      endcase
      if(_zz_27)begin
        bridge_masterLogic_start <= 1'b0;
        bridge_masterLogic_stop <= 1'b0;
        bridge_masterLogic_drop <= 1'b0;
      end
    end
  end

  always @ (posedge io_systemClk) begin
    if(bridge_rxData_event)begin
      case(bridge_addressFilter_state)
        2'b00 : begin
          bridge_addressFilter_byte0 <= bridge_rxData_value;
        end
        2'b01 : begin
          bridge_addressFilter_byte1 <= bridge_rxData_value;
        end
        default : begin
        end
      endcase
    end
    _zz_3_regNext <= _zz_3;
    bridge_masterLogic_timer_value <= (bridge_masterLogic_timer_value - _zz_38);
    if((! i2cCtrl_io_internals_sclRead))begin
      bridge_masterLogic_fsm_inFrameLate <= 1'b1;
    end
    if((! i2cCtrl_io_internals_inFrame))begin
      bridge_masterLogic_fsm_inFrameLate <= 1'b0;
    end
    case(i2cCtrl_io_bus_cmd_kind)
      `I2cSlaveCmdMode_defaultEncoding_START : begin
      end
      `I2cSlaveCmdMode_defaultEncoding_RESTART : begin
      end
      `I2cSlaveCmdMode_defaultEncoding_STOP : begin
      end
      `I2cSlaveCmdMode_defaultEncoding_DROP : begin
      end
      `I2cSlaveCmdMode_defaultEncoding_READ : begin
        if(_zz_28)begin
          bridge_rxData_value[_zz_40] <= i2cCtrl_io_bus_cmd_data;
        end else begin
          bridge_rxAck_value <= i2cCtrl_io_bus_cmd_data;
        end
      end
      default : begin
      end
    endcase
    if(_zz_22)begin
      bridge_txData_disableOnDataConflict <= 1'b0;
      bridge_txAck_disableOnDataConflict <= 1'b0;
    end
    _zz_11_regNext <= _zz_11;
    bridge_masterLogic_fsm_isBusy_regNext <= bridge_masterLogic_fsm_isBusy;
    case(io_apb_PADDR)
      8'b00001000 : begin
      end
      8'b00001100 : begin
      end
      8'b00000000 : begin
        if(busCtrl_doWrite)begin
          bridge_txData_value <= io_apb_PWDATA[7 : 0];
          bridge_txData_disableOnDataConflict <= _zz_56[0];
        end
      end
      8'b00000100 : begin
        if(busCtrl_doWrite)begin
          bridge_txAck_value <= _zz_59[0];
          bridge_txAck_disableOnDataConflict <= _zz_61[0];
        end
      end
      8'b10001000 : begin
        if(busCtrl_doWrite)begin
          bridge_addressFilter_addresses_0_value <= io_apb_PWDATA[9 : 0];
          bridge_addressFilter_addresses_0_is10Bit <= _zz_64[0];
        end
      end
      8'b10001100 : begin
        if(busCtrl_doWrite)begin
          bridge_addressFilter_addresses_1_value <= io_apb_PWDATA[9 : 0];
          bridge_addressFilter_addresses_1_is10Bit <= _zz_66[0];
        end
      end
      8'b10000000 : begin
      end
      8'b10000100 : begin
      end
      8'b01000000 : begin
      end
      8'b01010000 : begin
        if(busCtrl_doWrite)begin
          bridge_masterLogic_timer_tLow <= io_apb_PWDATA[11 : 0];
        end
      end
      8'b01010100 : begin
        if(busCtrl_doWrite)begin
          bridge_masterLogic_timer_tHigh <= io_apb_PWDATA[11 : 0];
        end
      end
      8'b01011000 : begin
        if(busCtrl_doWrite)begin
          bridge_masterLogic_timer_tBuf <= io_apb_PWDATA[11 : 0];
        end
      end
      8'b00100000 : begin
      end
      8'b00100100 : begin
      end
      8'b00101000 : begin
      end
      8'b00101100 : begin
        if(busCtrl_doWrite)begin
          _zz_15 <= io_apb_PWDATA[19 : 0];
        end
      end
      8'b00110000 : begin
        if(busCtrl_doWrite)begin
          _zz_16 <= io_apb_PWDATA[5 : 0];
        end
      end
      default : begin
      end
    endcase
    case(bridge_masterLogic_fsm_stateReg)
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_IDLE : begin
      end
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_START1 : begin
      end
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_START2 : begin
      end
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_LOW : begin
      end
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_HIGH : begin
      end
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_RESTART : begin
        if((! i2cCtrl_io_internals_sclRead))begin
          bridge_masterLogic_timer_value <= bridge_masterLogic_timer_tHigh;
        end
      end
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_STOP1 : begin
      end
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_STOP2 : begin
      end
      `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_TBUF : begin
      end
      default : begin
      end
    endcase
    if(((! (bridge_masterLogic_fsm_stateReg == `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_START1)) && (bridge_masterLogic_fsm_stateNext == `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_START1)))begin
      bridge_masterLogic_timer_value <= bridge_masterLogic_timer_tHigh;
    end
    if(((! (bridge_masterLogic_fsm_stateReg == `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_START2)) && (bridge_masterLogic_fsm_stateNext == `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_START2)))begin
      bridge_masterLogic_timer_value <= bridge_masterLogic_timer_tLow;
    end
    if(((! (bridge_masterLogic_fsm_stateReg == `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_LOW)) && (bridge_masterLogic_fsm_stateNext == `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_LOW)))begin
      bridge_masterLogic_timer_value <= bridge_masterLogic_timer_tLow;
    end
    if(((! (bridge_masterLogic_fsm_stateReg == `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_HIGH)) && (bridge_masterLogic_fsm_stateNext == `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_HIGH)))begin
      bridge_masterLogic_timer_value <= bridge_masterLogic_timer_tHigh;
    end
    if(((! (bridge_masterLogic_fsm_stateReg == `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_RESTART)) && (bridge_masterLogic_fsm_stateNext == `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_RESTART)))begin
      bridge_masterLogic_timer_value <= bridge_masterLogic_timer_tHigh;
    end
    if(((! (bridge_masterLogic_fsm_stateReg == `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_STOP1)) && (bridge_masterLogic_fsm_stateNext == `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_STOP1)))begin
      bridge_masterLogic_timer_value <= bridge_masterLogic_timer_tHigh;
    end
    if(((! (bridge_masterLogic_fsm_stateReg == `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_STOP2)) && (bridge_masterLogic_fsm_stateNext == `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_STOP2)))begin
      bridge_masterLogic_timer_value <= bridge_masterLogic_timer_tHigh;
    end
    if(((! (bridge_masterLogic_fsm_stateReg == `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_TBUF)) && (bridge_masterLogic_fsm_stateNext == `bridge_masterLogic_fsm_enumDefinition_defaultEncoding_bridge_masterLogic_fsm_TBUF)))begin
      bridge_masterLogic_timer_value <= bridge_masterLogic_timer_tBuf;
    end
  end

  always @ (posedge io_systemClk) begin
    if(systemCd_logic_outputReset) begin
      i2cCtrl_io_internals_inFrame_regNext <= 1'b0;
    end else begin
      i2cCtrl_io_internals_inFrame_regNext <= i2cCtrl_io_internals_inFrame;
    end
  end


endmodule

module Apb3UartCtrl (
  input      [4:0]    io_apb_PADDR,
  input      [0:0]    io_apb_PSEL,
  input               io_apb_PENABLE,
  output              io_apb_PREADY,
  input               io_apb_PWRITE,
  input      [31:0]   io_apb_PWDATA,
  output reg [31:0]   io_apb_PRDATA,
  output              io_uart_txd,
  input               io_uart_rxd,
  output              io_interrupt,
  input               io_systemClk,
  input               systemCd_logic_outputReset
);
  wire                _zz_9;
  reg                 _zz_10;
  wire                _zz_11;
  wire                uartCtrl_1_io_write_ready;
  wire                uartCtrl_1_io_read_valid;
  wire       [7:0]    uartCtrl_1_io_read_payload;
  wire                uartCtrl_1_io_uart_txd;
  wire                uartCtrl_1_io_readError;
  wire                uartCtrl_1_io_readBreak;
  wire                bridge_write_streamUnbuffered_queueWithOccupancy_io_push_ready;
  wire                bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_valid;
  wire       [7:0]    bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_payload;
  wire       [4:0]    bridge_write_streamUnbuffered_queueWithOccupancy_io_occupancy;
  wire       [4:0]    bridge_write_streamUnbuffered_queueWithOccupancy_io_availability;
  wire                uartCtrl_1_io_read_queueWithOccupancy_io_push_ready;
  wire                uartCtrl_1_io_read_queueWithOccupancy_io_pop_valid;
  wire       [7:0]    uartCtrl_1_io_read_queueWithOccupancy_io_pop_payload;
  wire       [4:0]    uartCtrl_1_io_read_queueWithOccupancy_io_occupancy;
  wire       [4:0]    uartCtrl_1_io_read_queueWithOccupancy_io_availability;
  wire       [0:0]    _zz_12;
  wire       [0:0]    _zz_13;
  wire       [0:0]    _zz_14;
  wire       [0:0]    _zz_15;
  wire       [0:0]    _zz_16;
  wire       [0:0]    _zz_17;
  wire       [0:0]    _zz_18;
  wire       [0:0]    _zz_19;
  wire       [0:0]    _zz_20;
  wire       [0:0]    _zz_21;
  wire       [19:0]   _zz_22;
  wire       [19:0]   _zz_23;
  wire       [0:0]    _zz_24;
  wire       [0:0]    _zz_25;
  wire       [4:0]    _zz_26;
  wire                busCtrl_askWrite;
  wire                busCtrl_askRead;
  wire                busCtrl_doWrite;
  wire                busCtrl_doRead;
  reg        [2:0]    bridge_uartConfigReg_frame_dataLength;
  reg        `UartStopType_defaultEncoding_type bridge_uartConfigReg_frame_stop;
  reg        `UartParityType_defaultEncoding_type bridge_uartConfigReg_frame_parity;
  reg        [19:0]   bridge_uartConfigReg_clockDivider;
  reg                 _zz_1;
  wire                bridge_write_streamUnbuffered_valid;
  wire                bridge_write_streamUnbuffered_ready;
  wire       [7:0]    bridge_write_streamUnbuffered_payload;
  reg                 bridge_read_streamBreaked_valid;
  reg                 bridge_read_streamBreaked_ready;
  wire       [7:0]    bridge_read_streamBreaked_payload;
  reg                 bridge_interruptCtrl_writeIntEnable;
  reg                 bridge_interruptCtrl_readIntEnable;
  wire                bridge_interruptCtrl_readInt;
  wire                bridge_interruptCtrl_writeInt;
  wire                bridge_interruptCtrl_interrupt;
  reg                 bridge_misc_readError;
  reg                 _zz_2;
  reg                 bridge_misc_readOverflowError;
  reg                 _zz_3;
  reg                 bridge_misc_breakDetected;
  reg                 uartCtrl_1_io_readBreak_regNext;
  reg                 _zz_4;
  reg                 bridge_misc_doBreak;
  reg                 _zz_5;
  reg                 _zz_6;
  wire       `UartParityType_defaultEncoding_type _zz_7;
  wire       `UartStopType_defaultEncoding_type _zz_8;
  `ifndef SYNTHESIS
  reg [23:0] bridge_uartConfigReg_frame_stop_string;
  reg [31:0] bridge_uartConfigReg_frame_parity_string;
  reg [31:0] _zz_7_string;
  reg [23:0] _zz_8_string;
  `endif


  assign _zz_12 = io_apb_PWDATA[0 : 0];
  assign _zz_13 = (1'b0);
  assign _zz_14 = io_apb_PWDATA[1 : 1];
  assign _zz_15 = (1'b0);
  assign _zz_16 = io_apb_PWDATA[9 : 9];
  assign _zz_17 = (1'b0);
  assign _zz_18 = io_apb_PWDATA[10 : 10];
  assign _zz_19 = (1'b1);
  assign _zz_20 = io_apb_PWDATA[11 : 11];
  assign _zz_21 = (1'b0);
  assign _zz_22 = io_apb_PWDATA[19 : 0];
  assign _zz_23 = _zz_22;
  assign _zz_24 = io_apb_PWDATA[0 : 0];
  assign _zz_25 = io_apb_PWDATA[1 : 1];
  assign _zz_26 = (5'h10 - bridge_write_streamUnbuffered_queueWithOccupancy_io_occupancy);
  UartCtrl uartCtrl_1 (
    .io_config_frame_dataLength    (bridge_uartConfigReg_frame_dataLength[2:0]                            ), //i
    .io_config_frame_stop          (bridge_uartConfigReg_frame_stop                                       ), //i
    .io_config_frame_parity        (bridge_uartConfigReg_frame_parity[1:0]                                ), //i
    .io_config_clockDivider        (bridge_uartConfigReg_clockDivider[19:0]                               ), //i
    .io_write_valid                (bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_valid         ), //i
    .io_write_ready                (uartCtrl_1_io_write_ready                                             ), //o
    .io_write_payload              (bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_payload[7:0]  ), //i
    .io_read_valid                 (uartCtrl_1_io_read_valid                                              ), //o
    .io_read_ready                 (uartCtrl_1_io_read_queueWithOccupancy_io_push_ready                   ), //i
    .io_read_payload               (uartCtrl_1_io_read_payload[7:0]                                       ), //o
    .io_uart_txd                   (uartCtrl_1_io_uart_txd                                                ), //o
    .io_uart_rxd                   (io_uart_rxd                                                           ), //i
    .io_readError                  (uartCtrl_1_io_readError                                               ), //o
    .io_writeBreak                 (bridge_misc_doBreak                                                   ), //i
    .io_readBreak                  (uartCtrl_1_io_readBreak                                               ), //o
    .io_systemClk                  (io_systemClk                                                          ), //i
    .systemCd_logic_outputReset    (systemCd_logic_outputReset                                            )  //i
  );
  StreamFifo bridge_write_streamUnbuffered_queueWithOccupancy (
    .io_push_valid                 (bridge_write_streamUnbuffered_valid                                    ), //i
    .io_push_ready                 (bridge_write_streamUnbuffered_queueWithOccupancy_io_push_ready         ), //o
    .io_push_payload               (bridge_write_streamUnbuffered_payload[7:0]                             ), //i
    .io_pop_valid                  (bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_valid          ), //o
    .io_pop_ready                  (uartCtrl_1_io_write_ready                                              ), //i
    .io_pop_payload                (bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_payload[7:0]   ), //o
    .io_flush                      (_zz_9                                                                  ), //i
    .io_occupancy                  (bridge_write_streamUnbuffered_queueWithOccupancy_io_occupancy[4:0]     ), //o
    .io_availability               (bridge_write_streamUnbuffered_queueWithOccupancy_io_availability[4:0]  ), //o
    .io_systemClk                  (io_systemClk                                                           ), //i
    .systemCd_logic_outputReset    (systemCd_logic_outputReset                                             )  //i
  );
  StreamFifo uartCtrl_1_io_read_queueWithOccupancy (
    .io_push_valid                 (uartCtrl_1_io_read_valid                                    ), //i
    .io_push_ready                 (uartCtrl_1_io_read_queueWithOccupancy_io_push_ready         ), //o
    .io_push_payload               (uartCtrl_1_io_read_payload[7:0]                             ), //i
    .io_pop_valid                  (uartCtrl_1_io_read_queueWithOccupancy_io_pop_valid          ), //o
    .io_pop_ready                  (_zz_10                                                      ), //i
    .io_pop_payload                (uartCtrl_1_io_read_queueWithOccupancy_io_pop_payload[7:0]   ), //o
    .io_flush                      (_zz_11                                                      ), //i
    .io_occupancy                  (uartCtrl_1_io_read_queueWithOccupancy_io_occupancy[4:0]     ), //o
    .io_availability               (uartCtrl_1_io_read_queueWithOccupancy_io_availability[4:0]  ), //o
    .io_systemClk                  (io_systemClk                                                ), //i
    .systemCd_logic_outputReset    (systemCd_logic_outputReset                                  )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(bridge_uartConfigReg_frame_stop)
      `UartStopType_defaultEncoding_ONE : bridge_uartConfigReg_frame_stop_string = "ONE";
      `UartStopType_defaultEncoding_TWO : bridge_uartConfigReg_frame_stop_string = "TWO";
      default : bridge_uartConfigReg_frame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(bridge_uartConfigReg_frame_parity)
      `UartParityType_defaultEncoding_NONE : bridge_uartConfigReg_frame_parity_string = "NONE";
      `UartParityType_defaultEncoding_EVEN : bridge_uartConfigReg_frame_parity_string = "EVEN";
      `UartParityType_defaultEncoding_ODD : bridge_uartConfigReg_frame_parity_string = "ODD ";
      default : bridge_uartConfigReg_frame_parity_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_7)
      `UartParityType_defaultEncoding_NONE : _zz_7_string = "NONE";
      `UartParityType_defaultEncoding_EVEN : _zz_7_string = "EVEN";
      `UartParityType_defaultEncoding_ODD : _zz_7_string = "ODD ";
      default : _zz_7_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_8)
      `UartStopType_defaultEncoding_ONE : _zz_8_string = "ONE";
      `UartStopType_defaultEncoding_TWO : _zz_8_string = "TWO";
      default : _zz_8_string = "???";
    endcase
  end
  `endif

  assign io_uart_txd = uartCtrl_1_io_uart_txd;
  assign io_apb_PREADY = 1'b1;
  always @ (*) begin
    io_apb_PRDATA = 32'h0;
    case(io_apb_PADDR)
      5'b01000 : begin
      end
      5'b01100 : begin
      end
      5'b00000 : begin
        io_apb_PRDATA[16 : 16] = (bridge_read_streamBreaked_valid ^ 1'b0);
        io_apb_PRDATA[7 : 0] = bridge_read_streamBreaked_payload;
      end
      5'b00100 : begin
        io_apb_PRDATA[20 : 16] = _zz_26;
        io_apb_PRDATA[15 : 15] = bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_valid;
        io_apb_PRDATA[28 : 24] = uartCtrl_1_io_read_queueWithOccupancy_io_occupancy;
        io_apb_PRDATA[0 : 0] = bridge_interruptCtrl_writeIntEnable;
        io_apb_PRDATA[1 : 1] = bridge_interruptCtrl_readIntEnable;
        io_apb_PRDATA[8 : 8] = bridge_interruptCtrl_writeInt;
        io_apb_PRDATA[9 : 9] = bridge_interruptCtrl_readInt;
      end
      5'b10000 : begin
        io_apb_PRDATA[0 : 0] = bridge_misc_readError;
        io_apb_PRDATA[1 : 1] = bridge_misc_readOverflowError;
        io_apb_PRDATA[8 : 8] = uartCtrl_1_io_readBreak;
        io_apb_PRDATA[9 : 9] = bridge_misc_breakDetected;
      end
      default : begin
      end
    endcase
  end

  assign busCtrl_askWrite = ((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PWRITE);
  assign busCtrl_askRead = ((io_apb_PSEL[0] && io_apb_PENABLE) && (! io_apb_PWRITE));
  assign busCtrl_doWrite = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && io_apb_PWRITE);
  assign busCtrl_doRead = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && (! io_apb_PWRITE));
  always @ (*) begin
    _zz_1 = 1'b0;
    case(io_apb_PADDR)
      5'b01000 : begin
      end
      5'b01100 : begin
      end
      5'b00000 : begin
        if(busCtrl_doWrite)begin
          _zz_1 = 1'b1;
        end
      end
      5'b00100 : begin
      end
      5'b10000 : begin
      end
      default : begin
      end
    endcase
  end

  assign bridge_write_streamUnbuffered_valid = _zz_1;
  assign bridge_write_streamUnbuffered_payload = io_apb_PWDATA[7 : 0];
  assign bridge_write_streamUnbuffered_ready = bridge_write_streamUnbuffered_queueWithOccupancy_io_push_ready;
  always @ (*) begin
    bridge_read_streamBreaked_valid = uartCtrl_1_io_read_queueWithOccupancy_io_pop_valid;
    if(uartCtrl_1_io_readBreak)begin
      bridge_read_streamBreaked_valid = 1'b0;
    end
  end

  always @ (*) begin
    _zz_10 = bridge_read_streamBreaked_ready;
    if(uartCtrl_1_io_readBreak)begin
      _zz_10 = 1'b1;
    end
  end

  assign bridge_read_streamBreaked_payload = uartCtrl_1_io_read_queueWithOccupancy_io_pop_payload;
  always @ (*) begin
    bridge_read_streamBreaked_ready = 1'b0;
    case(io_apb_PADDR)
      5'b01000 : begin
      end
      5'b01100 : begin
      end
      5'b00000 : begin
        if(busCtrl_doRead)begin
          bridge_read_streamBreaked_ready = 1'b1;
        end
      end
      5'b00100 : begin
      end
      5'b10000 : begin
      end
      default : begin
      end
    endcase
  end

  assign bridge_interruptCtrl_readInt = (bridge_interruptCtrl_readIntEnable && bridge_read_streamBreaked_valid);
  assign bridge_interruptCtrl_writeInt = (bridge_interruptCtrl_writeIntEnable && (! bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_valid));
  assign bridge_interruptCtrl_interrupt = (bridge_interruptCtrl_readInt || bridge_interruptCtrl_writeInt);
  always @ (*) begin
    _zz_2 = 1'b0;
    case(io_apb_PADDR)
      5'b01000 : begin
      end
      5'b01100 : begin
      end
      5'b00000 : begin
      end
      5'b00100 : begin
      end
      5'b10000 : begin
        if(busCtrl_doWrite)begin
          _zz_2 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    _zz_3 = 1'b0;
    case(io_apb_PADDR)
      5'b01000 : begin
      end
      5'b01100 : begin
      end
      5'b00000 : begin
      end
      5'b00100 : begin
      end
      5'b10000 : begin
        if(busCtrl_doWrite)begin
          _zz_3 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    _zz_4 = 1'b0;
    case(io_apb_PADDR)
      5'b01000 : begin
      end
      5'b01100 : begin
      end
      5'b00000 : begin
      end
      5'b00100 : begin
      end
      5'b10000 : begin
        if(busCtrl_doWrite)begin
          _zz_4 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    _zz_5 = 1'b0;
    case(io_apb_PADDR)
      5'b01000 : begin
      end
      5'b01100 : begin
      end
      5'b00000 : begin
      end
      5'b00100 : begin
      end
      5'b10000 : begin
        if(busCtrl_doWrite)begin
          _zz_5 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    _zz_6 = 1'b0;
    case(io_apb_PADDR)
      5'b01000 : begin
      end
      5'b01100 : begin
      end
      5'b00000 : begin
      end
      5'b00100 : begin
      end
      5'b10000 : begin
        if(busCtrl_doWrite)begin
          _zz_6 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign io_interrupt = bridge_interruptCtrl_interrupt;
  assign _zz_7 = io_apb_PWDATA[9 : 8];
  assign _zz_8 = io_apb_PWDATA[16 : 16];
  assign _zz_9 = 1'b0;
  assign _zz_11 = 1'b0;
  always @ (posedge io_systemClk) begin
    if(systemCd_logic_outputReset) begin
      bridge_uartConfigReg_clockDivider <= 20'h0;
      bridge_uartConfigReg_clockDivider <= 20'h00014;
      bridge_uartConfigReg_frame_dataLength <= (3'b111);
      bridge_uartConfigReg_frame_parity <= `UartParityType_defaultEncoding_NONE;
      bridge_uartConfigReg_frame_stop <= `UartStopType_defaultEncoding_ONE;
      bridge_interruptCtrl_writeIntEnable <= 1'b0;
      bridge_interruptCtrl_readIntEnable <= 1'b0;
      bridge_misc_readError <= 1'b0;
      bridge_misc_readOverflowError <= 1'b0;
      bridge_misc_breakDetected <= 1'b0;
      bridge_misc_doBreak <= 1'b0;
    end else begin
      if(_zz_2)begin
        if(_zz_12[0])begin
          bridge_misc_readError <= _zz_13[0];
        end
      end
      if(uartCtrl_1_io_readError)begin
        bridge_misc_readError <= 1'b1;
      end
      if(_zz_3)begin
        if(_zz_14[0])begin
          bridge_misc_readOverflowError <= _zz_15[0];
        end
      end
      if((uartCtrl_1_io_read_valid && (! uartCtrl_1_io_read_queueWithOccupancy_io_push_ready)))begin
        bridge_misc_readOverflowError <= 1'b1;
      end
      if((uartCtrl_1_io_readBreak && (! uartCtrl_1_io_readBreak_regNext)))begin
        bridge_misc_breakDetected <= 1'b1;
      end
      if(_zz_4)begin
        if(_zz_16[0])begin
          bridge_misc_breakDetected <= _zz_17[0];
        end
      end
      if(_zz_5)begin
        if(_zz_18[0])begin
          bridge_misc_doBreak <= _zz_19[0];
        end
      end
      if(_zz_6)begin
        if(_zz_20[0])begin
          bridge_misc_doBreak <= _zz_21[0];
        end
      end
      case(io_apb_PADDR)
        5'b01000 : begin
          if(busCtrl_doWrite)begin
            bridge_uartConfigReg_clockDivider[19 : 0] <= _zz_23;
          end
        end
        5'b01100 : begin
          if(busCtrl_doWrite)begin
            bridge_uartConfigReg_frame_dataLength <= io_apb_PWDATA[2 : 0];
            bridge_uartConfigReg_frame_parity <= _zz_7;
            bridge_uartConfigReg_frame_stop <= _zz_8;
          end
        end
        5'b00000 : begin
        end
        5'b00100 : begin
          if(busCtrl_doWrite)begin
            bridge_interruptCtrl_writeIntEnable <= _zz_24[0];
            bridge_interruptCtrl_readIntEnable <= _zz_25[0];
          end
        end
        5'b10000 : begin
        end
        default : begin
        end
      endcase
    end
  end

  always @ (posedge io_systemClk) begin
    uartCtrl_1_io_readBreak_regNext <= uartCtrl_1_io_readBreak;
  end


endmodule

module MachineTimer (
  input      [3:0]    io_bus_PADDR,
  input      [0:0]    io_bus_PSEL,
  input               io_bus_PENABLE,
  output              io_bus_PREADY,
  input               io_bus_PWRITE,
  input      [31:0]   io_bus_PWDATA,
  output reg [31:0]   io_bus_PRDATA,
  output              io_bus_PSLVERROR,
  output              io_mTimeInterrupt,
  input               io_systemClk,
  input               systemCd_logic_outputReset
);
  wire       [63:0]   _zz_2;
  wire       [31:0]   _zz_3;
  wire       [31:0]   _zz_4;
  wire       [31:0]   _zz_5;
  wire       [31:0]   _zz_6;
  wire                mapper_askWrite;
  wire                mapper_askRead;
  wire                mapper_doWrite;
  wire                mapper_doRead;
  reg        [63:0]   counter;
  reg        [63:0]   cmp;
  reg                 interrupt;
  wire       [63:0]   _zz_1;

  assign _zz_2 = (counter - cmp);
  assign _zz_3 = io_bus_PWDATA[31 : 0];
  assign _zz_4 = _zz_3;
  assign _zz_5 = io_bus_PWDATA[31 : 0];
  assign _zz_6 = _zz_5;
  assign io_bus_PREADY = 1'b1;
  always @ (*) begin
    io_bus_PRDATA = 32'h0;
    case(io_bus_PADDR)
      4'b0000 : begin
        io_bus_PRDATA[31 : 0] = _zz_1[31 : 0];
      end
      4'b0100 : begin
        io_bus_PRDATA[31 : 0] = _zz_1[63 : 32];
      end
      4'b1000 : begin
      end
      4'b1100 : begin
      end
      default : begin
      end
    endcase
  end

  assign io_bus_PSLVERROR = 1'b0;
  assign mapper_askWrite = ((io_bus_PSEL[0] && io_bus_PENABLE) && io_bus_PWRITE);
  assign mapper_askRead = ((io_bus_PSEL[0] && io_bus_PENABLE) && (! io_bus_PWRITE));
  assign mapper_doWrite = (((io_bus_PSEL[0] && io_bus_PENABLE) && io_bus_PREADY) && io_bus_PWRITE);
  assign mapper_doRead = (((io_bus_PSEL[0] && io_bus_PENABLE) && io_bus_PREADY) && (! io_bus_PWRITE));
  assign io_mTimeInterrupt = interrupt;
  assign _zz_1 = counter;
  always @ (posedge io_systemClk) begin
    if(systemCd_logic_outputReset) begin
      counter <= 64'h0;
    end else begin
      counter <= (counter + 64'h0000000000000001);
    end
  end

  always @ (posedge io_systemClk) begin
    interrupt <= (! _zz_2[63]);
    case(io_bus_PADDR)
      4'b0000 : begin
      end
      4'b0100 : begin
      end
      4'b1000 : begin
        if(mapper_doWrite)begin
          cmp[31 : 0] <= _zz_4;
        end
      end
      4'b1100 : begin
        if(mapper_doWrite)begin
          cmp[63 : 32] <= _zz_6;
        end
      end
      default : begin
      end
    endcase
  end


endmodule

//StreamFifo_3 replaced by StreamFifo_3

//StreamFifo_2 replaced by StreamFifo_2

//SpiXdrMasterCtrl replaced by SpiXdrMasterCtrl

module StreamFifo_3 (
  input               io_push_valid,
  output              io_push_ready,
  input      [7:0]    io_push_payload_data,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [7:0]    io_pop_payload_data,
  input               io_flush,
  output     [8:0]    io_occupancy,
  output     [8:0]    io_availability,
  input               io_systemClk,
  input               systemCd_logic_outputReset
);
  reg        [7:0]    _zz_3;
  wire       [0:0]    _zz_4;
  wire       [7:0]    _zz_5;
  wire       [0:0]    _zz_6;
  wire       [7:0]    _zz_7;
  wire       [7:0]    _zz_8;
  wire                _zz_9;
  reg                 _zz_1;
  reg                 logic_pushPtr_willIncrement;
  reg                 logic_pushPtr_willClear;
  reg        [7:0]    logic_pushPtr_valueNext;
  reg        [7:0]    logic_pushPtr_value;
  wire                logic_pushPtr_willOverflowIfInc;
  wire                logic_pushPtr_willOverflow;
  reg                 logic_popPtr_willIncrement;
  reg                 logic_popPtr_willClear;
  reg        [7:0]    logic_popPtr_valueNext;
  reg        [7:0]    logic_popPtr_value;
  wire                logic_popPtr_willOverflowIfInc;
  wire                logic_popPtr_willOverflow;
  wire                logic_ptrMatch;
  reg                 logic_risingOccupancy;
  wire                logic_pushing;
  wire                logic_popping;
  wire                logic_empty;
  wire                logic_full;
  reg                 _zz_2;
  wire       [7:0]    logic_ptrDif;
  reg [7:0] logic_ram [0:255];

  assign _zz_4 = logic_pushPtr_willIncrement;
  assign _zz_5 = {7'd0, _zz_4};
  assign _zz_6 = logic_popPtr_willIncrement;
  assign _zz_7 = {7'd0, _zz_6};
  assign _zz_8 = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz_9 = 1'b1;
  always @ (posedge io_systemClk) begin
    if(_zz_9) begin
      _zz_3 <= logic_ram[logic_popPtr_valueNext];
    end
  end

  always @ (posedge io_systemClk) begin
    if(_zz_1) begin
      logic_ram[logic_pushPtr_value] <= io_push_payload_data;
    end
  end

  always @ (*) begin
    _zz_1 = 1'b0;
    if(logic_pushing)begin
      _zz_1 = 1'b1;
    end
  end

  always @ (*) begin
    logic_pushPtr_willIncrement = 1'b0;
    if(logic_pushing)begin
      logic_pushPtr_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    logic_pushPtr_willClear = 1'b0;
    if(io_flush)begin
      logic_pushPtr_willClear = 1'b1;
    end
  end

  assign logic_pushPtr_willOverflowIfInc = (logic_pushPtr_value == 8'hff);
  assign logic_pushPtr_willOverflow = (logic_pushPtr_willOverflowIfInc && logic_pushPtr_willIncrement);
  always @ (*) begin
    logic_pushPtr_valueNext = (logic_pushPtr_value + _zz_5);
    if(logic_pushPtr_willClear)begin
      logic_pushPtr_valueNext = 8'h0;
    end
  end

  always @ (*) begin
    logic_popPtr_willIncrement = 1'b0;
    if(logic_popping)begin
      logic_popPtr_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    logic_popPtr_willClear = 1'b0;
    if(io_flush)begin
      logic_popPtr_willClear = 1'b1;
    end
  end

  assign logic_popPtr_willOverflowIfInc = (logic_popPtr_value == 8'hff);
  assign logic_popPtr_willOverflow = (logic_popPtr_willOverflowIfInc && logic_popPtr_willIncrement);
  always @ (*) begin
    logic_popPtr_valueNext = (logic_popPtr_value + _zz_7);
    if(logic_popPtr_willClear)begin
      logic_popPtr_valueNext = 8'h0;
    end
  end

  assign logic_ptrMatch = (logic_pushPtr_value == logic_popPtr_value);
  assign logic_pushing = (io_push_valid && io_push_ready);
  assign logic_popping = (io_pop_valid && io_pop_ready);
  assign logic_empty = (logic_ptrMatch && (! logic_risingOccupancy));
  assign logic_full = (logic_ptrMatch && logic_risingOccupancy);
  assign io_push_ready = (! logic_full);
  assign io_pop_valid = ((! logic_empty) && (! (_zz_2 && (! logic_full))));
  assign io_pop_payload_data = _zz_3[7 : 0];
  assign logic_ptrDif = (logic_pushPtr_value - logic_popPtr_value);
  assign io_occupancy = {(logic_risingOccupancy && logic_ptrMatch),logic_ptrDif};
  assign io_availability = {((! logic_risingOccupancy) && logic_ptrMatch),_zz_8};
  always @ (posedge io_systemClk) begin
    if(systemCd_logic_outputReset) begin
      logic_pushPtr_value <= 8'h0;
      logic_popPtr_value <= 8'h0;
      logic_risingOccupancy <= 1'b0;
      _zz_2 <= 1'b0;
    end else begin
      logic_pushPtr_value <= logic_pushPtr_valueNext;
      logic_popPtr_value <= logic_popPtr_valueNext;
      _zz_2 <= (logic_popPtr_valueNext == logic_pushPtr_value);
      if((logic_pushing != logic_popping))begin
        logic_risingOccupancy <= logic_pushing;
      end
      if(io_flush)begin
        logic_risingOccupancy <= 1'b0;
      end
    end
  end


endmodule

module StreamFifo_2 (
  input               io_push_valid,
  output              io_push_ready,
  input               io_push_payload_kind,
  input               io_push_payload_read,
  input               io_push_payload_write,
  input      [7:0]    io_push_payload_data,
  output              io_pop_valid,
  input               io_pop_ready,
  output              io_pop_payload_kind,
  output              io_pop_payload_read,
  output              io_pop_payload_write,
  output     [7:0]    io_pop_payload_data,
  input               io_flush,
  output     [8:0]    io_occupancy,
  output     [8:0]    io_availability,
  input               io_systemClk,
  input               systemCd_logic_outputReset
);
  reg        [10:0]   _zz_4;
  wire       [0:0]    _zz_5;
  wire       [7:0]    _zz_6;
  wire       [0:0]    _zz_7;
  wire       [7:0]    _zz_8;
  wire       [0:0]    _zz_9;
  wire       [0:0]    _zz_10;
  wire       [0:0]    _zz_11;
  wire       [7:0]    _zz_12;
  wire                _zz_13;
  wire       [10:0]   _zz_14;
  reg                 _zz_1;
  reg                 logic_pushPtr_willIncrement;
  reg                 logic_pushPtr_willClear;
  reg        [7:0]    logic_pushPtr_valueNext;
  reg        [7:0]    logic_pushPtr_value;
  wire                logic_pushPtr_willOverflowIfInc;
  wire                logic_pushPtr_willOverflow;
  reg                 logic_popPtr_willIncrement;
  reg                 logic_popPtr_willClear;
  reg        [7:0]    logic_popPtr_valueNext;
  reg        [7:0]    logic_popPtr_value;
  wire                logic_popPtr_willOverflowIfInc;
  wire                logic_popPtr_willOverflow;
  wire                logic_ptrMatch;
  reg                 logic_risingOccupancy;
  wire                logic_pushing;
  wire                logic_popping;
  wire                logic_empty;
  wire                logic_full;
  reg                 _zz_2;
  wire       [10:0]   _zz_3;
  wire       [7:0]    logic_ptrDif;
  reg [10:0] logic_ram [0:255];

  assign _zz_5 = logic_pushPtr_willIncrement;
  assign _zz_6 = {7'd0, _zz_5};
  assign _zz_7 = logic_popPtr_willIncrement;
  assign _zz_8 = {7'd0, _zz_7};
  assign _zz_9 = _zz_3[0 : 0];
  assign _zz_10 = _zz_3[1 : 1];
  assign _zz_11 = _zz_3[2 : 2];
  assign _zz_12 = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz_13 = 1'b1;
  assign _zz_14 = {io_push_payload_data,{io_push_payload_write,{io_push_payload_read,io_push_payload_kind}}};
  always @ (posedge io_systemClk) begin
    if(_zz_13) begin
      _zz_4 <= logic_ram[logic_popPtr_valueNext];
    end
  end

  always @ (posedge io_systemClk) begin
    if(_zz_1) begin
      logic_ram[logic_pushPtr_value] <= _zz_14;
    end
  end

  always @ (*) begin
    _zz_1 = 1'b0;
    if(logic_pushing)begin
      _zz_1 = 1'b1;
    end
  end

  always @ (*) begin
    logic_pushPtr_willIncrement = 1'b0;
    if(logic_pushing)begin
      logic_pushPtr_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    logic_pushPtr_willClear = 1'b0;
    if(io_flush)begin
      logic_pushPtr_willClear = 1'b1;
    end
  end

  assign logic_pushPtr_willOverflowIfInc = (logic_pushPtr_value == 8'hff);
  assign logic_pushPtr_willOverflow = (logic_pushPtr_willOverflowIfInc && logic_pushPtr_willIncrement);
  always @ (*) begin
    logic_pushPtr_valueNext = (logic_pushPtr_value + _zz_6);
    if(logic_pushPtr_willClear)begin
      logic_pushPtr_valueNext = 8'h0;
    end
  end

  always @ (*) begin
    logic_popPtr_willIncrement = 1'b0;
    if(logic_popping)begin
      logic_popPtr_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    logic_popPtr_willClear = 1'b0;
    if(io_flush)begin
      logic_popPtr_willClear = 1'b1;
    end
  end

  assign logic_popPtr_willOverflowIfInc = (logic_popPtr_value == 8'hff);
  assign logic_popPtr_willOverflow = (logic_popPtr_willOverflowIfInc && logic_popPtr_willIncrement);
  always @ (*) begin
    logic_popPtr_valueNext = (logic_popPtr_value + _zz_8);
    if(logic_popPtr_willClear)begin
      logic_popPtr_valueNext = 8'h0;
    end
  end

  assign logic_ptrMatch = (logic_pushPtr_value == logic_popPtr_value);
  assign logic_pushing = (io_push_valid && io_push_ready);
  assign logic_popping = (io_pop_valid && io_pop_ready);
  assign logic_empty = (logic_ptrMatch && (! logic_risingOccupancy));
  assign logic_full = (logic_ptrMatch && logic_risingOccupancy);
  assign io_push_ready = (! logic_full);
  assign io_pop_valid = ((! logic_empty) && (! (_zz_2 && (! logic_full))));
  assign _zz_3 = _zz_4;
  assign io_pop_payload_kind = _zz_9[0];
  assign io_pop_payload_read = _zz_10[0];
  assign io_pop_payload_write = _zz_11[0];
  assign io_pop_payload_data = _zz_3[10 : 3];
  assign logic_ptrDif = (logic_pushPtr_value - logic_popPtr_value);
  assign io_occupancy = {(logic_risingOccupancy && logic_ptrMatch),logic_ptrDif};
  assign io_availability = {((! logic_risingOccupancy) && logic_ptrMatch),_zz_12};
  always @ (posedge io_systemClk) begin
    if(systemCd_logic_outputReset) begin
      logic_pushPtr_value <= 8'h0;
      logic_popPtr_value <= 8'h0;
      logic_risingOccupancy <= 1'b0;
      _zz_2 <= 1'b0;
    end else begin
      logic_pushPtr_value <= logic_pushPtr_valueNext;
      logic_popPtr_value <= logic_popPtr_valueNext;
      _zz_2 <= (logic_popPtr_valueNext == logic_pushPtr_value);
      if((logic_pushing != logic_popping))begin
        logic_risingOccupancy <= logic_pushing;
      end
      if(io_flush)begin
        logic_risingOccupancy <= 1'b0;
      end
    end
  end


endmodule

module SpiXdrMasterCtrl (
  input               io_config_kind_cpol,
  input               io_config_kind_cpha,
  input      [11:0]   io_config_sclkToogle,
  input      [1:0]    io_config_mod,
  input      [0:0]    io_config_ss_activeHigh,
  input      [11:0]   io_config_ss_setup,
  input      [11:0]   io_config_ss_hold,
  input      [11:0]   io_config_ss_disable,
  input               io_cmd_valid,
  output reg          io_cmd_ready,
  input               io_cmd_payload_kind,
  input               io_cmd_payload_read,
  input               io_cmd_payload_write,
  input      [7:0]    io_cmd_payload_data,
  output              io_rsp_valid,
  output     [7:0]    io_rsp_payload_data,
  output     [0:0]    io_spi_sclk_write,
  output reg          io_spi_data_0_writeEnable,
  input      [0:0]    io_spi_data_0_read,
  output reg [0:0]    io_spi_data_0_write,
  output reg          io_spi_data_1_writeEnable,
  input      [0:0]    io_spi_data_1_read,
  output reg [0:0]    io_spi_data_1_write,
  output reg          io_spi_data_2_writeEnable,
  input      [0:0]    io_spi_data_2_read,
  output reg [0:0]    io_spi_data_2_write,
  output reg          io_spi_data_3_writeEnable,
  input      [0:0]    io_spi_data_3_read,
  output reg [0:0]    io_spi_data_3_write,
  output     [0:0]    io_spi_ss,
  input               io_systemClk,
  input               systemCd_logic_outputReset
);
  reg        [0:0]    _zz_3;
  reg        [1:0]    _zz_4;
  reg        [3:0]    _zz_5;
  wire                _zz_6;
  wire                _zz_7;
  wire                _zz_8;
  wire                _zz_9;
  wire                _zz_10;
  wire                _zz_11;
  wire                _zz_12;
  wire                _zz_13;
  wire       [2:0]    _zz_14;
  wire       [1:0]    _zz_15;
  wire       [0:0]    _zz_16;
  wire       [3:0]    _zz_17;
  wire       [3:0]    _zz_18;
  wire       [3:0]    _zz_19;
  wire       [3:0]    _zz_20;
  wire       [3:0]    _zz_21;
  wire       [3:0]    _zz_22;
  wire       [3:0]    _zz_23;
  wire       [8:0]    _zz_24;
  wire       [10:0]   _zz_25;
  reg        [11:0]   timer_counter;
  reg                 timer_reset;
  wire                timer_ss_setupHit;
  wire                timer_ss_holdHit;
  wire                timer_ss_disableHit;
  wire                timer_sclkToogleHit;
  reg                 fsm_state;
  reg        [2:0]    fsm_counter;
  reg        [2:0]    _zz_1;
  wire       [2:0]    fsm_counterPlus;
  reg                 fsm_fastRate;
  reg                 fsm_isDdr;
  reg                 fsm_readFill;
  reg                 fsm_readDone;
  reg        [0:0]    fsm_ss;
  reg        [0:0]    outputPhy_sclkWrite;
  wire       [0:0]    _zz_2;
  reg        [3:0]    outputPhy_dataWrite;
  reg        [2:0]    outputPhy_widthSel;
  reg        [1:0]    io_config_mod_delay_1;
  reg        [1:0]    inputPhy_mod;
  reg                 fsm_readFill_delay_1;
  reg                 inputPhy_readFill;
  reg                 fsm_readDone_delay_1;
  reg                 inputPhy_readDone;
  reg        [6:0]    inputPhy_buffer;
  reg        [7:0]    inputPhy_bufferNext;
  reg        [2:0]    inputPhy_widthSel;
  wire       [3:0]    inputPhy_dataWrite;
  reg        [3:0]    inputPhy_dataRead;
  reg                 fsm_state_delay_1;
  reg                 fsm_state_delay_2;
  reg        [3:0]    inputPhy_dataReadBuffer;

  assign _zz_6 = (! io_cmd_payload_kind);
  assign _zz_7 = io_cmd_payload_data[7];
  assign _zz_8 = (! fsm_state);
  assign _zz_9 = ((! io_cmd_valid) || io_cmd_ready);
  assign _zz_10 = ((timer_sclkToogleHit && (fsm_state || fsm_isDdr)) || fsm_fastRate);
  assign _zz_11 = (fsm_counterPlus == (3'b000));
  assign _zz_12 = (io_cmd_valid && io_cmd_payload_write);
  assign _zz_13 = (io_cmd_valid && io_cmd_payload_write);
  assign _zz_14 = (fsm_counter >>> 0);
  assign _zz_15 = (fsm_counter >>> 1);
  assign _zz_16 = (fsm_counter >>> 2);
  assign _zz_17 = {io_spi_data_3_read[0],{io_spi_data_2_read[0],{io_spi_data_1_read[0],io_spi_data_0_read[0]}}};
  assign _zz_18 = {io_spi_data_3_read[0],{io_spi_data_2_read[0],{io_spi_data_1_read[0],io_spi_data_0_read[0]}}};
  assign _zz_19 = {io_spi_data_3_read[0],{io_spi_data_2_read[0],{io_spi_data_1_read[0],io_spi_data_0_read[0]}}};
  assign _zz_20 = {io_spi_data_3_read[0],{io_spi_data_2_read[0],{io_spi_data_1_read[0],io_spi_data_0_read[0]}}};
  assign _zz_21 = {io_spi_data_3_read[0],{io_spi_data_2_read[0],{io_spi_data_1_read[0],io_spi_data_0_read[0]}}};
  assign _zz_22 = {io_spi_data_3_read[0],{io_spi_data_2_read[0],{io_spi_data_1_read[0],io_spi_data_0_read[0]}}};
  assign _zz_23 = {io_spi_data_3_read[0],{io_spi_data_2_read[0],{io_spi_data_1_read[0],io_spi_data_0_read[0]}}};
  assign _zz_24 = {inputPhy_buffer,inputPhy_dataRead[1 : 0]};
  assign _zz_25 = {inputPhy_buffer,inputPhy_dataRead[3 : 0]};
  always @(*) begin
    case(_zz_14)
      3'b000 : begin
        _zz_3 = io_cmd_payload_data[7 : 7];
      end
      3'b001 : begin
        _zz_3 = io_cmd_payload_data[6 : 6];
      end
      3'b010 : begin
        _zz_3 = io_cmd_payload_data[5 : 5];
      end
      3'b011 : begin
        _zz_3 = io_cmd_payload_data[4 : 4];
      end
      3'b100 : begin
        _zz_3 = io_cmd_payload_data[3 : 3];
      end
      3'b101 : begin
        _zz_3 = io_cmd_payload_data[2 : 2];
      end
      3'b110 : begin
        _zz_3 = io_cmd_payload_data[1 : 1];
      end
      default : begin
        _zz_3 = io_cmd_payload_data[0 : 0];
      end
    endcase
  end

  always @(*) begin
    case(_zz_15)
      2'b00 : begin
        _zz_4 = io_cmd_payload_data[7 : 6];
      end
      2'b01 : begin
        _zz_4 = io_cmd_payload_data[5 : 4];
      end
      2'b10 : begin
        _zz_4 = io_cmd_payload_data[3 : 2];
      end
      default : begin
        _zz_4 = io_cmd_payload_data[1 : 0];
      end
    endcase
  end

  always @(*) begin
    case(_zz_16)
      1'b0 : begin
        _zz_5 = io_cmd_payload_data[7 : 4];
      end
      default : begin
        _zz_5 = io_cmd_payload_data[3 : 0];
      end
    endcase
  end

  always @ (*) begin
    timer_reset = 1'b0;
    if(io_cmd_valid)begin
      if(_zz_6)begin
        timer_reset = timer_sclkToogleHit;
      end else begin
        if(! _zz_7) begin
          if(_zz_8)begin
            if(timer_ss_holdHit)begin
              timer_reset = 1'b1;
            end
          end
        end
      end
    end
    if(_zz_9)begin
      timer_reset = 1'b1;
    end
  end

  assign timer_ss_setupHit = (timer_counter == io_config_ss_setup);
  assign timer_ss_holdHit = (timer_counter == io_config_ss_hold);
  assign timer_ss_disableHit = (timer_counter == io_config_ss_disable);
  assign timer_sclkToogleHit = (timer_counter == io_config_sclkToogle);
  always @ (*) begin
    _zz_1 = (3'bxxx);
    case(io_config_mod)
      2'b00 : begin
        _zz_1 = (3'b001);
      end
      2'b01 : begin
        _zz_1 = (3'b010);
      end
      2'b10 : begin
        _zz_1 = (3'b100);
      end
      default : begin
      end
    endcase
  end

  assign fsm_counterPlus = (fsm_counter + _zz_1);
  always @ (*) begin
    fsm_fastRate = 1'bx;
    case(io_config_mod)
      2'b00 : begin
        fsm_fastRate = 1'b0;
      end
      2'b01 : begin
        fsm_fastRate = 1'b0;
      end
      2'b10 : begin
        fsm_fastRate = 1'b0;
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    fsm_isDdr = 1'bx;
    case(io_config_mod)
      2'b00 : begin
        fsm_isDdr = 1'b0;
      end
      2'b01 : begin
        fsm_isDdr = 1'b0;
      end
      2'b10 : begin
        fsm_isDdr = 1'b0;
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    fsm_readFill = 1'b0;
    if(io_cmd_valid)begin
      if(_zz_6)begin
        if(_zz_10)begin
          fsm_readFill = 1'b1;
        end
      end
    end
  end

  always @ (*) begin
    fsm_readDone = 1'b0;
    if(io_cmd_valid)begin
      if(_zz_6)begin
        if(_zz_10)begin
          if(_zz_11)begin
            fsm_readDone = io_cmd_payload_read;
          end
        end
      end
    end
  end

  assign io_spi_ss = (~ (fsm_ss ^ io_config_ss_activeHigh));
  always @ (*) begin
    io_cmd_ready = 1'b0;
    if(io_cmd_valid)begin
      if(_zz_6)begin
        if(_zz_10)begin
          if(_zz_11)begin
            io_cmd_ready = 1'b1;
          end
        end
      end else begin
        if(_zz_7)begin
          if(timer_ss_setupHit)begin
            io_cmd_ready = 1'b1;
          end
        end else begin
          if(! _zz_8) begin
            if(timer_ss_disableHit)begin
              io_cmd_ready = 1'b1;
            end
          end
        end
      end
    end
  end

  always @ (*) begin
    outputPhy_sclkWrite = (1'b0);
    if((io_cmd_valid && (! io_cmd_payload_kind)))begin
      case(io_config_mod)
        2'b00 : begin
          outputPhy_sclkWrite = ((fsm_state ^ io_config_kind_cpha) ? (1'b1) : (1'b0));
        end
        2'b01 : begin
          outputPhy_sclkWrite = ((fsm_state ^ io_config_kind_cpha) ? (1'b1) : (1'b0));
        end
        2'b10 : begin
          outputPhy_sclkWrite = ((fsm_state ^ io_config_kind_cpha) ? (1'b1) : (1'b0));
        end
        default : begin
        end
      endcase
    end
  end

  assign _zz_2[0] = io_config_kind_cpol;
  assign io_spi_sclk_write = (outputPhy_sclkWrite ^ _zz_2);
  always @ (*) begin
    outputPhy_widthSel = (3'bxxx);
    case(io_config_mod)
      2'b00 : begin
        outputPhy_widthSel = (3'b000);
      end
      2'b01 : begin
        outputPhy_widthSel = (3'b001);
      end
      2'b10 : begin
        outputPhy_widthSel = (3'b010);
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    outputPhy_dataWrite = (4'bxxxx);
    case(outputPhy_widthSel)
      3'b000 : begin
        outputPhy_dataWrite[0 : 0] = _zz_3;
      end
      3'b001 : begin
        outputPhy_dataWrite[1 : 0] = _zz_4;
      end
      3'b010 : begin
        outputPhy_dataWrite[3 : 0] = _zz_5;
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    io_spi_data_0_writeEnable = 1'b0;
    case(io_config_mod)
      2'b00 : begin
        io_spi_data_0_writeEnable = 1'b1;
      end
      2'b01 : begin
        if(_zz_12)begin
          io_spi_data_0_writeEnable = 1'b1;
        end
      end
      2'b10 : begin
        if(_zz_13)begin
          io_spi_data_0_writeEnable = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    io_spi_data_1_writeEnable = 1'b0;
    case(io_config_mod)
      2'b00 : begin
      end
      2'b01 : begin
        if(_zz_12)begin
          io_spi_data_1_writeEnable = 1'b1;
        end
      end
      2'b10 : begin
        if(_zz_13)begin
          io_spi_data_1_writeEnable = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    io_spi_data_2_writeEnable = 1'b0;
    case(io_config_mod)
      2'b00 : begin
      end
      2'b01 : begin
      end
      2'b10 : begin
        if(_zz_13)begin
          io_spi_data_2_writeEnable = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    io_spi_data_3_writeEnable = 1'b0;
    case(io_config_mod)
      2'b00 : begin
      end
      2'b01 : begin
      end
      2'b10 : begin
        if(_zz_13)begin
          io_spi_data_3_writeEnable = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    io_spi_data_0_write = (1'bx);
    case(io_config_mod)
      2'b00 : begin
        io_spi_data_0_write[0] = (outputPhy_dataWrite[0] || (! (io_cmd_valid && io_cmd_payload_write)));
      end
      2'b01 : begin
        io_spi_data_0_write[0] = outputPhy_dataWrite[0];
      end
      2'b10 : begin
        io_spi_data_0_write[0] = outputPhy_dataWrite[0];
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    io_spi_data_1_write = (1'bx);
    case(io_config_mod)
      2'b00 : begin
      end
      2'b01 : begin
        io_spi_data_1_write[0] = outputPhy_dataWrite[1];
      end
      2'b10 : begin
        io_spi_data_1_write[0] = outputPhy_dataWrite[1];
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    io_spi_data_2_write = (1'bx);
    case(io_config_mod)
      2'b00 : begin
      end
      2'b01 : begin
      end
      2'b10 : begin
        io_spi_data_2_write[0] = outputPhy_dataWrite[2];
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    io_spi_data_3_write = (1'bx);
    case(io_config_mod)
      2'b00 : begin
      end
      2'b01 : begin
      end
      2'b10 : begin
        io_spi_data_3_write[0] = outputPhy_dataWrite[3];
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    inputPhy_bufferNext = 8'h0;
    case(inputPhy_widthSel)
      3'b000 : begin
        inputPhy_bufferNext = {inputPhy_buffer,inputPhy_dataRead[0 : 0]};
      end
      3'b001 : begin
        inputPhy_bufferNext = _zz_24[7:0];
      end
      3'b010 : begin
        inputPhy_bufferNext = _zz_25[7:0];
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    inputPhy_widthSel = (3'bxxx);
    case(inputPhy_mod)
      2'b00 : begin
        inputPhy_widthSel = (3'b000);
      end
      2'b01 : begin
        inputPhy_widthSel = (3'b001);
      end
      2'b10 : begin
        inputPhy_widthSel = (3'b010);
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    inputPhy_dataRead = (4'bxxxx);
    case(inputPhy_mod)
      2'b00 : begin
        inputPhy_dataRead[0] = _zz_17[1];
      end
      2'b01 : begin
        inputPhy_dataRead[0] = _zz_18[0];
        inputPhy_dataRead[1] = _zz_19[1];
      end
      2'b10 : begin
        inputPhy_dataRead[0] = _zz_20[0];
        inputPhy_dataRead[1] = _zz_21[1];
        inputPhy_dataRead[2] = _zz_22[2];
        inputPhy_dataRead[3] = _zz_23[3];
      end
      default : begin
      end
    endcase
  end

  assign io_rsp_valid = inputPhy_readDone;
  assign io_rsp_payload_data = inputPhy_bufferNext;
  always @ (posedge io_systemClk) begin
    timer_counter <= (timer_counter + 12'h001);
    if(timer_reset)begin
      timer_counter <= 12'h0;
    end
    io_config_mod_delay_1 <= io_config_mod;
    inputPhy_mod <= io_config_mod_delay_1;
    fsm_state_delay_1 <= fsm_state;
    fsm_state_delay_2 <= fsm_state_delay_1;
    if((! fsm_state_delay_2))begin
      inputPhy_dataReadBuffer <= {io_spi_data_3_read[0],{io_spi_data_2_read[0],{io_spi_data_1_read[0],io_spi_data_0_read[0]}}};
    end
    case(inputPhy_widthSel)
      3'b000 : begin
        if(inputPhy_readFill)begin
          inputPhy_buffer <= inputPhy_bufferNext[6:0];
        end
      end
      3'b001 : begin
        if(inputPhy_readFill)begin
          inputPhy_buffer <= inputPhy_bufferNext[6:0];
        end
      end
      3'b010 : begin
        if(inputPhy_readFill)begin
          inputPhy_buffer <= inputPhy_bufferNext[6:0];
        end
      end
      default : begin
      end
    endcase
  end

  always @ (posedge io_systemClk) begin
    if(systemCd_logic_outputReset) begin
      fsm_state <= 1'b0;
      fsm_counter <= (3'b000);
      fsm_ss <= (1'b0);
      fsm_readFill_delay_1 <= 1'b0;
      inputPhy_readFill <= 1'b0;
      fsm_readDone_delay_1 <= 1'b0;
      inputPhy_readDone <= 1'b0;
    end else begin
      if(io_cmd_valid)begin
        if(_zz_6)begin
          if(timer_sclkToogleHit)begin
            fsm_state <= (! fsm_state);
          end
          if(_zz_10)begin
            fsm_counter <= fsm_counterPlus;
            if(_zz_11)begin
              fsm_state <= 1'b0;
            end
          end
        end else begin
          if(_zz_7)begin
            fsm_ss[0] <= 1'b1;
          end else begin
            if(_zz_8)begin
              if(timer_ss_holdHit)begin
                fsm_state <= 1'b1;
              end
            end else begin
              fsm_ss[0] <= 1'b0;
            end
          end
        end
      end
      if(_zz_9)begin
        fsm_state <= 1'b0;
        fsm_counter <= (3'b000);
      end
      fsm_readFill_delay_1 <= fsm_readFill;
      inputPhy_readFill <= fsm_readFill_delay_1;
      fsm_readDone_delay_1 <= fsm_readDone;
      inputPhy_readDone <= fsm_readDone_delay_1;
    end
  end


endmodule

module StreamArbiter (
  input               io_inputs_0_valid,
  output              io_inputs_0_ready,
  input               io_inputs_0_payload_last,
  input      [0:0]    io_inputs_0_payload_fragment_source,
  input      [0:0]    io_inputs_0_payload_fragment_opcode,
  input      [11:0]   io_inputs_0_payload_fragment_address,
  input      [1:0]    io_inputs_0_payload_fragment_length,
  input      [31:0]   io_inputs_0_payload_fragment_data,
  input      [3:0]    io_inputs_0_payload_fragment_mask,
  input      [0:0]    io_inputs_0_payload_fragment_context,
  input               io_inputs_1_valid,
  output              io_inputs_1_ready,
  input               io_inputs_1_payload_last,
  input      [0:0]    io_inputs_1_payload_fragment_source,
  input      [0:0]    io_inputs_1_payload_fragment_opcode,
  input      [11:0]   io_inputs_1_payload_fragment_address,
  input      [1:0]    io_inputs_1_payload_fragment_length,
  input      [31:0]   io_inputs_1_payload_fragment_data,
  input      [3:0]    io_inputs_1_payload_fragment_mask,
  input      [0:0]    io_inputs_1_payload_fragment_context,
  output              io_output_valid,
  input               io_output_ready,
  output              io_output_payload_last,
  output     [0:0]    io_output_payload_fragment_source,
  output     [0:0]    io_output_payload_fragment_opcode,
  output     [11:0]   io_output_payload_fragment_address,
  output     [1:0]    io_output_payload_fragment_length,
  output     [31:0]   io_output_payload_fragment_data,
  output     [3:0]    io_output_payload_fragment_mask,
  output     [0:0]    io_output_payload_fragment_context,
  output     [0:0]    io_chosen,
  output     [1:0]    io_chosenOH,
  input               io_systemClk,
  input               systemCd_logic_outputReset
);
  wire       [1:0]    _zz_3;
  wire       [1:0]    _zz_4;
  reg                 locked;
  wire                maskProposal_0;
  wire                maskProposal_1;
  reg                 maskLocked_0;
  reg                 maskLocked_1;
  wire                maskRouted_0;
  wire                maskRouted_1;
  wire       [1:0]    _zz_1;
  wire                _zz_2;

  assign _zz_3 = (_zz_1 & (~ _zz_4));
  assign _zz_4 = (_zz_1 - (2'b01));
  assign maskRouted_0 = (locked ? maskLocked_0 : maskProposal_0);
  assign maskRouted_1 = (locked ? maskLocked_1 : maskProposal_1);
  assign _zz_1 = {io_inputs_1_valid,io_inputs_0_valid};
  assign maskProposal_0 = io_inputs_0_valid;
  assign maskProposal_1 = _zz_3[1];
  assign io_output_valid = ((io_inputs_0_valid && maskRouted_0) || (io_inputs_1_valid && maskRouted_1));
  assign io_output_payload_last = (maskRouted_0 ? io_inputs_0_payload_last : io_inputs_1_payload_last);
  assign io_output_payload_fragment_source = (maskRouted_0 ? io_inputs_0_payload_fragment_source : io_inputs_1_payload_fragment_source);
  assign io_output_payload_fragment_opcode = (maskRouted_0 ? io_inputs_0_payload_fragment_opcode : io_inputs_1_payload_fragment_opcode);
  assign io_output_payload_fragment_address = (maskRouted_0 ? io_inputs_0_payload_fragment_address : io_inputs_1_payload_fragment_address);
  assign io_output_payload_fragment_length = (maskRouted_0 ? io_inputs_0_payload_fragment_length : io_inputs_1_payload_fragment_length);
  assign io_output_payload_fragment_data = (maskRouted_0 ? io_inputs_0_payload_fragment_data : io_inputs_1_payload_fragment_data);
  assign io_output_payload_fragment_mask = (maskRouted_0 ? io_inputs_0_payload_fragment_mask : io_inputs_1_payload_fragment_mask);
  assign io_output_payload_fragment_context = (maskRouted_0 ? io_inputs_0_payload_fragment_context : io_inputs_1_payload_fragment_context);
  assign io_inputs_0_ready = (maskRouted_0 && io_output_ready);
  assign io_inputs_1_ready = (maskRouted_1 && io_output_ready);
  assign io_chosenOH = {maskRouted_1,maskRouted_0};
  assign _zz_2 = io_chosenOH[1];
  assign io_chosen = _zz_2;
  always @ (posedge io_systemClk) begin
    if(systemCd_logic_outputReset) begin
      locked <= 1'b0;
    end else begin
      if(io_output_valid)begin
        locked <= 1'b1;
      end
      if(((io_output_valid && io_output_ready) && io_output_payload_last))begin
        locked <= 1'b0;
      end
    end
  end

  always @ (posedge io_systemClk) begin
    if(io_output_valid)begin
      maskLocked_0 <= maskRouted_0;
      maskLocked_1 <= maskRouted_1;
    end
  end


endmodule

module FlowCCByToggle (
  input               io_input_valid,
  input               io_input_payload_last,
  input      [0:0]    io_input_payload_fragment,
  output              io_output_valid,
  output              io_output_payload_last,
  output     [0:0]    io_output_payload_fragment,
  input               jtagCtrl_tck,
  input               io_systemClk,
  input               debugCd_logic_outputReset
);
  wire                inputArea_target_buffercc_io_dataOut;
  wire                outHitSignal;
  reg                 inputArea_target = 0;
  reg                 inputArea_data_last;
  reg        [0:0]    inputArea_data_fragment;
  wire                outputArea_target;
  reg                 outputArea_hit;
  wire                outputArea_flow_valid;
  wire                outputArea_flow_payload_last;
  wire       [0:0]    outputArea_flow_payload_fragment;
  reg                 outputArea_flow_regNext_valid;
  reg                 outputArea_flow_regNext_payload_last;
  reg        [0:0]    outputArea_flow_regNext_payload_fragment;

  BufferCC_3 inputArea_target_buffercc (
    .io_dataIn                    (inputArea_target                      ), //i
    .io_dataOut                   (inputArea_target_buffercc_io_dataOut  ), //o
    .io_systemClk                 (io_systemClk                          ), //i
    .debugCd_logic_outputReset    (debugCd_logic_outputReset             )  //i
  );
  assign outputArea_target = inputArea_target_buffercc_io_dataOut;
  assign outputArea_flow_valid = (outputArea_target != outputArea_hit);
  assign outputArea_flow_payload_last = inputArea_data_last;
  assign outputArea_flow_payload_fragment = inputArea_data_fragment;
  assign io_output_valid = outputArea_flow_regNext_valid;
  assign io_output_payload_last = outputArea_flow_regNext_payload_last;
  assign io_output_payload_fragment = outputArea_flow_regNext_payload_fragment;
  always @ (posedge jtagCtrl_tck) begin
    if(io_input_valid)begin
      inputArea_target <= (! inputArea_target);
      inputArea_data_last <= io_input_payload_last;
      inputArea_data_fragment <= io_input_payload_fragment;
    end
  end

  always @ (posedge io_systemClk) begin
    outputArea_hit <= outputArea_target;
    outputArea_flow_regNext_payload_last <= outputArea_flow_payload_last;
    outputArea_flow_regNext_payload_fragment <= outputArea_flow_payload_fragment;
  end

  always @ (posedge io_systemClk) begin
    if(debugCd_logic_outputReset) begin
      outputArea_flow_regNext_valid <= 1'b0;
    end else begin
      outputArea_flow_regNext_valid <= outputArea_flow_valid;
    end
  end


endmodule

module StreamFifoLowLatency (
  input               io_push_valid,
  output              io_push_ready,
  input               io_push_payload_error,
  input      [31:0]   io_push_payload_inst,
  output reg          io_pop_valid,
  input               io_pop_ready,
  output reg          io_pop_payload_error,
  output reg [31:0]   io_pop_payload_inst,
  input               io_flush,
  output     [0:0]    io_occupancy,
  input               io_systemClk,
  input               systemCd_logic_outputReset
);
  wire                _zz_4;
  wire       [0:0]    _zz_5;
  reg                 _zz_1;
  reg                 pushPtr_willIncrement;
  reg                 pushPtr_willClear;
  wire                pushPtr_willOverflowIfInc;
  wire                pushPtr_willOverflow;
  reg                 popPtr_willIncrement;
  reg                 popPtr_willClear;
  wire                popPtr_willOverflowIfInc;
  wire                popPtr_willOverflow;
  wire                ptrMatch;
  reg                 risingOccupancy;
  wire                empty;
  wire                full;
  wire                pushing;
  wire                popping;
  wire       [32:0]   _zz_2;
  reg        [32:0]   _zz_3;

  assign _zz_4 = (! empty);
  assign _zz_5 = _zz_2[0 : 0];
  always @ (*) begin
    _zz_1 = 1'b0;
    if(pushing)begin
      _zz_1 = 1'b1;
    end
  end

  always @ (*) begin
    pushPtr_willIncrement = 1'b0;
    if(pushing)begin
      pushPtr_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    pushPtr_willClear = 1'b0;
    if(io_flush)begin
      pushPtr_willClear = 1'b1;
    end
  end

  assign pushPtr_willOverflowIfInc = 1'b1;
  assign pushPtr_willOverflow = (pushPtr_willOverflowIfInc && pushPtr_willIncrement);
  always @ (*) begin
    popPtr_willIncrement = 1'b0;
    if(popping)begin
      popPtr_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    popPtr_willClear = 1'b0;
    if(io_flush)begin
      popPtr_willClear = 1'b1;
    end
  end

  assign popPtr_willOverflowIfInc = 1'b1;
  assign popPtr_willOverflow = (popPtr_willOverflowIfInc && popPtr_willIncrement);
  assign ptrMatch = 1'b1;
  assign empty = (ptrMatch && (! risingOccupancy));
  assign full = (ptrMatch && risingOccupancy);
  assign pushing = (io_push_valid && io_push_ready);
  assign popping = (io_pop_valid && io_pop_ready);
  assign io_push_ready = (! full);
  always @ (*) begin
    if(_zz_4)begin
      io_pop_valid = 1'b1;
    end else begin
      io_pop_valid = io_push_valid;
    end
  end

  assign _zz_2 = _zz_3;
  always @ (*) begin
    if(_zz_4)begin
      io_pop_payload_error = _zz_5[0];
    end else begin
      io_pop_payload_error = io_push_payload_error;
    end
  end

  always @ (*) begin
    if(_zz_4)begin
      io_pop_payload_inst = _zz_2[32 : 1];
    end else begin
      io_pop_payload_inst = io_push_payload_inst;
    end
  end

  assign io_occupancy = (risingOccupancy && ptrMatch);
  always @ (posedge io_systemClk) begin
    if(systemCd_logic_outputReset) begin
      risingOccupancy <= 1'b0;
    end else begin
      if((pushing != popping))begin
        risingOccupancy <= pushing;
      end
      if(io_flush)begin
        risingOccupancy <= 1'b0;
      end
    end
  end

  always @ (posedge io_systemClk) begin
    if(_zz_1)begin
      _zz_3 <= {io_push_payload_inst,io_push_payload_error};
    end
  end


endmodule

module BufferCC_4 (
  input      [15:0]   io_dataIn,
  output     [15:0]   io_dataOut,
  input               io_systemClk,
  input               systemCd_logic_outputReset
);
  reg        [15:0]   buffers_0;
  reg        [15:0]   buffers_1;

  assign io_dataOut = buffers_1;
  always @ (posedge io_systemClk) begin
    buffers_0 <= io_dataIn;
    buffers_1 <= buffers_0;
  end


endmodule

module I2cSlave (
  output              io_i2c_sda_write,
  input               io_i2c_sda_read,
  output              io_i2c_scl_write,
  input               io_i2c_scl_read,
  input      [9:0]    io_config_samplingClockDivider,
  input      [19:0]   io_config_timeout,
  input      [5:0]    io_config_tsuData,
  output reg `I2cSlaveCmdMode_defaultEncoding_type io_bus_cmd_kind,
  output              io_bus_cmd_data,
  input               io_bus_rsp_valid,
  input               io_bus_rsp_enable,
  input               io_bus_rsp_data,
  output              io_internals_inFrame,
  output              io_internals_sdaRead,
  output              io_internals_sclRead,
  input               io_systemClk,
  input               systemCd_logic_outputReset
);
  wire                _zz_7;
  wire                _zz_8;
  wire                io_i2c_scl_read_buffercc_io_dataOut;
  wire                io_i2c_sda_read_buffercc_io_dataOut;
  wire                _zz_9;
  wire                _zz_10;
  reg        [9:0]    filter_timer_counter;
  wire                filter_timer_tick;
  wire                filter_sampler_sclSync;
  wire                filter_sampler_sdaSync;
  wire                filter_sampler_sclSamples_0;
  wire                filter_sampler_sclSamples_1;
  wire                filter_sampler_sclSamples_2;
  wire                _zz_1;
  reg                 _zz_2;
  reg                 _zz_3;
  wire                filter_sampler_sdaSamples_0;
  wire                filter_sampler_sdaSamples_1;
  wire                filter_sampler_sdaSamples_2;
  wire                _zz_4;
  reg                 _zz_5;
  reg                 _zz_6;
  reg                 filter_sda;
  reg                 filter_scl;
  wire                sclEdge_rise;
  wire                sclEdge_fall;
  wire                sclEdge_toggle;
  reg                 filter_scl_regNext;
  wire                sdaEdge_rise;
  wire                sdaEdge_fall;
  wire                sdaEdge_toggle;
  reg                 filter_sda_regNext;
  wire                detector_start;
  wire                detector_stop;
  reg        [5:0]    tsuData_counter;
  wire                tsuData_done;
  reg                 tsuData_reset;
  reg                 ctrl_inFrame;
  reg                 ctrl_inFrameData;
  reg                 ctrl_sdaWrite;
  reg                 ctrl_sclWrite;
  wire                ctrl_rspBufferIn_valid;
  wire                ctrl_rspBufferIn_ready;
  wire                ctrl_rspBufferIn_payload_enable;
  wire                ctrl_rspBufferIn_payload_data;
  wire                ctrl_rspBuffer_valid;
  reg                 ctrl_rspBuffer_ready;
  wire                ctrl_rspBuffer_payload_enable;
  wire                ctrl_rspBuffer_payload_data;
  reg                 ctrl_rspBufferIn_m2sPipe_rValid;
  reg                 ctrl_rspBufferIn_m2sPipe_rData_enable;
  reg                 ctrl_rspBufferIn_m2sPipe_rData_data;
  wire                ctrl_rspAhead_valid;
  wire                ctrl_rspAhead_payload_enable;
  wire                ctrl_rspAhead_payload_data;
  reg        [19:0]   timeout_counter;
  reg                 timeout_tick;
  `ifndef SYNTHESIS
  reg [55:0] io_bus_cmd_kind_string;
  `endif


  assign _zz_9 = (detector_stop || timeout_tick);
  assign _zz_10 = (sclEdge_toggle || (! ctrl_inFrame));
  BufferCC io_i2c_scl_read_buffercc (
    .io_initial                    (_zz_7                                ), //i
    .io_dataIn                     (io_i2c_scl_read                      ), //i
    .io_dataOut                    (io_i2c_scl_read_buffercc_io_dataOut  ), //o
    .io_systemClk                  (io_systemClk                         ), //i
    .systemCd_logic_outputReset    (systemCd_logic_outputReset           )  //i
  );
  BufferCC io_i2c_sda_read_buffercc (
    .io_initial                    (_zz_8                                ), //i
    .io_dataIn                     (io_i2c_sda_read                      ), //i
    .io_dataOut                    (io_i2c_sda_read_buffercc_io_dataOut  ), //o
    .io_systemClk                  (io_systemClk                         ), //i
    .systemCd_logic_outputReset    (systemCd_logic_outputReset           )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_bus_cmd_kind)
      `I2cSlaveCmdMode_defaultEncoding_NONE : io_bus_cmd_kind_string = "NONE   ";
      `I2cSlaveCmdMode_defaultEncoding_START : io_bus_cmd_kind_string = "START  ";
      `I2cSlaveCmdMode_defaultEncoding_RESTART : io_bus_cmd_kind_string = "RESTART";
      `I2cSlaveCmdMode_defaultEncoding_STOP : io_bus_cmd_kind_string = "STOP   ";
      `I2cSlaveCmdMode_defaultEncoding_DROP : io_bus_cmd_kind_string = "DROP   ";
      `I2cSlaveCmdMode_defaultEncoding_DRIVE : io_bus_cmd_kind_string = "DRIVE  ";
      `I2cSlaveCmdMode_defaultEncoding_READ : io_bus_cmd_kind_string = "READ   ";
      default : io_bus_cmd_kind_string = "???????";
    endcase
  end
  `endif

  assign filter_timer_tick = (filter_timer_counter == 10'h0);
  assign _zz_7 = 1'b1;
  assign filter_sampler_sclSync = io_i2c_scl_read_buffercc_io_dataOut;
  assign _zz_8 = 1'b1;
  assign filter_sampler_sdaSync = io_i2c_sda_read_buffercc_io_dataOut;
  assign _zz_1 = filter_sampler_sclSync;
  assign filter_sampler_sclSamples_0 = _zz_1;
  assign filter_sampler_sclSamples_1 = _zz_2;
  assign filter_sampler_sclSamples_2 = _zz_3;
  assign _zz_4 = filter_sampler_sdaSync;
  assign filter_sampler_sdaSamples_0 = _zz_4;
  assign filter_sampler_sdaSamples_1 = _zz_5;
  assign filter_sampler_sdaSamples_2 = _zz_6;
  assign sclEdge_rise = ((! filter_scl_regNext) && filter_scl);
  assign sclEdge_fall = (filter_scl_regNext && (! filter_scl));
  assign sclEdge_toggle = (filter_scl_regNext != filter_scl);
  assign sdaEdge_rise = ((! filter_sda_regNext) && filter_sda);
  assign sdaEdge_fall = (filter_sda_regNext && (! filter_sda));
  assign sdaEdge_toggle = (filter_sda_regNext != filter_sda);
  assign detector_start = (filter_scl && sdaEdge_fall);
  assign detector_stop = (filter_scl && sdaEdge_rise);
  assign tsuData_done = (tsuData_counter == 6'h0);
  always @ (*) begin
    tsuData_reset = 1'b0;
    if(ctrl_inFrameData)begin
      tsuData_reset = (! ctrl_rspAhead_valid);
    end
  end

  always @ (*) begin
    ctrl_sdaWrite = 1'b1;
    if(ctrl_inFrameData)begin
      if((ctrl_rspAhead_valid && ctrl_rspAhead_payload_enable))begin
        ctrl_sdaWrite = ctrl_rspAhead_payload_data;
      end
    end
  end

  always @ (*) begin
    ctrl_sclWrite = 1'b1;
    if(ctrl_inFrameData)begin
      if(((! ctrl_rspAhead_valid) || (ctrl_rspAhead_payload_enable && (! tsuData_done))))begin
        ctrl_sclWrite = 1'b0;
      end
    end
  end

  assign ctrl_rspBufferIn_ready = ((1'b1 && (! ctrl_rspBuffer_valid)) || ctrl_rspBuffer_ready);
  assign ctrl_rspBuffer_valid = ctrl_rspBufferIn_m2sPipe_rValid;
  assign ctrl_rspBuffer_payload_enable = ctrl_rspBufferIn_m2sPipe_rData_enable;
  assign ctrl_rspBuffer_payload_data = ctrl_rspBufferIn_m2sPipe_rData_data;
  assign ctrl_rspAhead_valid = (ctrl_rspBuffer_valid ? ctrl_rspBuffer_valid : ctrl_rspBufferIn_valid);
  assign ctrl_rspAhead_payload_enable = (ctrl_rspBuffer_valid ? ctrl_rspBuffer_payload_enable : ctrl_rspBufferIn_payload_enable);
  assign ctrl_rspAhead_payload_data = (ctrl_rspBuffer_valid ? ctrl_rspBuffer_payload_data : ctrl_rspBufferIn_payload_data);
  assign ctrl_rspBufferIn_valid = io_bus_rsp_valid;
  assign ctrl_rspBufferIn_payload_enable = io_bus_rsp_enable;
  assign ctrl_rspBufferIn_payload_data = io_bus_rsp_data;
  always @ (*) begin
    ctrl_rspBuffer_ready = 1'b0;
    if(ctrl_inFrame)begin
      if(sclEdge_fall)begin
        ctrl_rspBuffer_ready = 1'b1;
      end
    end
  end

  always @ (*) begin
    io_bus_cmd_kind = `I2cSlaveCmdMode_defaultEncoding_NONE;
    if(ctrl_inFrame)begin
      if(sclEdge_rise)begin
        io_bus_cmd_kind = `I2cSlaveCmdMode_defaultEncoding_READ;
      end
    end
    if(ctrl_inFrameData)begin
      if(((! ctrl_rspBuffer_valid) || ctrl_rspBuffer_ready))begin
        io_bus_cmd_kind = `I2cSlaveCmdMode_defaultEncoding_DRIVE;
      end
    end
    if(detector_start)begin
      io_bus_cmd_kind = (ctrl_inFrame ? `I2cSlaveCmdMode_defaultEncoding_RESTART : `I2cSlaveCmdMode_defaultEncoding_START);
    end
    if(_zz_9)begin
      if(ctrl_inFrame)begin
        io_bus_cmd_kind = (timeout_tick ? `I2cSlaveCmdMode_defaultEncoding_DROP : `I2cSlaveCmdMode_defaultEncoding_STOP);
      end
    end
  end

  assign io_bus_cmd_data = filter_sda;
  always @ (*) begin
    timeout_tick = (timeout_counter == 20'h0);
    if(_zz_10)begin
      timeout_tick = 1'b0;
    end
  end

  assign io_internals_inFrame = ctrl_inFrame;
  assign io_internals_sdaRead = filter_sda;
  assign io_internals_sclRead = filter_scl;
  assign io_i2c_scl_write = ctrl_sclWrite;
  assign io_i2c_sda_write = ctrl_sdaWrite;
  always @ (posedge io_systemClk) begin
    if(systemCd_logic_outputReset) begin
      filter_timer_counter <= 10'h0;
      _zz_2 <= 1'b1;
      _zz_3 <= 1'b1;
      _zz_5 <= 1'b1;
      _zz_6 <= 1'b1;
      filter_sda <= 1'b1;
      filter_scl <= 1'b1;
      filter_scl_regNext <= 1'b1;
      filter_sda_regNext <= 1'b1;
      tsuData_counter <= 6'h0;
      ctrl_inFrame <= 1'b0;
      ctrl_inFrameData <= 1'b0;
      ctrl_rspBufferIn_m2sPipe_rValid <= 1'b0;
      timeout_counter <= 20'h0;
    end else begin
      filter_timer_counter <= (filter_timer_counter - 10'h001);
      if(filter_timer_tick)begin
        filter_timer_counter <= io_config_samplingClockDivider;
      end
      if(filter_timer_tick)begin
        _zz_2 <= _zz_1;
      end
      if(filter_timer_tick)begin
        _zz_3 <= _zz_2;
      end
      if(filter_timer_tick)begin
        _zz_5 <= _zz_4;
      end
      if(filter_timer_tick)begin
        _zz_6 <= _zz_5;
      end
      if(filter_timer_tick)begin
        if((((filter_sampler_sdaSamples_0 != filter_sda) && (filter_sampler_sdaSamples_1 != filter_sda)) && (filter_sampler_sdaSamples_2 != filter_sda)))begin
          filter_sda <= filter_sampler_sdaSamples_2;
        end
        if((((filter_sampler_sclSamples_0 != filter_scl) && (filter_sampler_sclSamples_1 != filter_scl)) && (filter_sampler_sclSamples_2 != filter_scl)))begin
          filter_scl <= filter_sampler_sclSamples_2;
        end
      end
      filter_scl_regNext <= filter_scl;
      filter_sda_regNext <= filter_sda;
      if((! tsuData_done))begin
        tsuData_counter <= (tsuData_counter - 6'h01);
      end
      if(tsuData_reset)begin
        tsuData_counter <= io_config_tsuData;
      end
      if(ctrl_rspBufferIn_ready)begin
        ctrl_rspBufferIn_m2sPipe_rValid <= ctrl_rspBufferIn_valid;
      end
      if(ctrl_inFrame)begin
        if(sclEdge_fall)begin
          ctrl_inFrameData <= 1'b1;
        end
      end
      if(detector_start)begin
        ctrl_inFrame <= 1'b1;
        ctrl_inFrameData <= 1'b0;
      end
      timeout_counter <= (timeout_counter - 20'h00001);
      if(_zz_10)begin
        timeout_counter <= io_config_timeout;
      end
      if(_zz_9)begin
        ctrl_inFrame <= 1'b0;
        ctrl_inFrameData <= 1'b0;
      end
    end
  end

  always @ (posedge io_systemClk) begin
    if(ctrl_rspBufferIn_ready)begin
      ctrl_rspBufferIn_m2sPipe_rData_enable <= ctrl_rspBufferIn_payload_enable;
      ctrl_rspBufferIn_m2sPipe_rData_data <= ctrl_rspBufferIn_payload_data;
    end
  end


endmodule

//StreamFifo replaced by StreamFifo

module StreamFifo (
  input               io_push_valid,
  output              io_push_ready,
  input      [7:0]    io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [7:0]    io_pop_payload,
  input               io_flush,
  output     [4:0]    io_occupancy,
  output     [4:0]    io_availability,
  input               io_systemClk,
  input               systemCd_logic_outputReset
);
  reg        [7:0]    _zz_3;
  wire       [0:0]    _zz_4;
  wire       [3:0]    _zz_5;
  wire       [0:0]    _zz_6;
  wire       [3:0]    _zz_7;
  wire       [3:0]    _zz_8;
  wire                _zz_9;
  reg                 _zz_1;
  reg                 logic_pushPtr_willIncrement;
  reg                 logic_pushPtr_willClear;
  reg        [3:0]    logic_pushPtr_valueNext;
  reg        [3:0]    logic_pushPtr_value;
  wire                logic_pushPtr_willOverflowIfInc;
  wire                logic_pushPtr_willOverflow;
  reg                 logic_popPtr_willIncrement;
  reg                 logic_popPtr_willClear;
  reg        [3:0]    logic_popPtr_valueNext;
  reg        [3:0]    logic_popPtr_value;
  wire                logic_popPtr_willOverflowIfInc;
  wire                logic_popPtr_willOverflow;
  wire                logic_ptrMatch;
  reg                 logic_risingOccupancy;
  wire                logic_pushing;
  wire                logic_popping;
  wire                logic_empty;
  wire                logic_full;
  reg                 _zz_2;
  wire       [3:0]    logic_ptrDif;
  reg [7:0] logic_ram [0:15];

  assign _zz_4 = logic_pushPtr_willIncrement;
  assign _zz_5 = {3'd0, _zz_4};
  assign _zz_6 = logic_popPtr_willIncrement;
  assign _zz_7 = {3'd0, _zz_6};
  assign _zz_8 = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz_9 = 1'b1;
  always @ (posedge io_systemClk) begin
    if(_zz_9) begin
      _zz_3 <= logic_ram[logic_popPtr_valueNext];
    end
  end

  always @ (posedge io_systemClk) begin
    if(_zz_1) begin
      logic_ram[logic_pushPtr_value] <= io_push_payload;
    end
  end

  always @ (*) begin
    _zz_1 = 1'b0;
    if(logic_pushing)begin
      _zz_1 = 1'b1;
    end
  end

  always @ (*) begin
    logic_pushPtr_willIncrement = 1'b0;
    if(logic_pushing)begin
      logic_pushPtr_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    logic_pushPtr_willClear = 1'b0;
    if(io_flush)begin
      logic_pushPtr_willClear = 1'b1;
    end
  end

  assign logic_pushPtr_willOverflowIfInc = (logic_pushPtr_value == (4'b1111));
  assign logic_pushPtr_willOverflow = (logic_pushPtr_willOverflowIfInc && logic_pushPtr_willIncrement);
  always @ (*) begin
    logic_pushPtr_valueNext = (logic_pushPtr_value + _zz_5);
    if(logic_pushPtr_willClear)begin
      logic_pushPtr_valueNext = (4'b0000);
    end
  end

  always @ (*) begin
    logic_popPtr_willIncrement = 1'b0;
    if(logic_popping)begin
      logic_popPtr_willIncrement = 1'b1;
    end
  end

  always @ (*) begin
    logic_popPtr_willClear = 1'b0;
    if(io_flush)begin
      logic_popPtr_willClear = 1'b1;
    end
  end

  assign logic_popPtr_willOverflowIfInc = (logic_popPtr_value == (4'b1111));
  assign logic_popPtr_willOverflow = (logic_popPtr_willOverflowIfInc && logic_popPtr_willIncrement);
  always @ (*) begin
    logic_popPtr_valueNext = (logic_popPtr_value + _zz_7);
    if(logic_popPtr_willClear)begin
      logic_popPtr_valueNext = (4'b0000);
    end
  end

  assign logic_ptrMatch = (logic_pushPtr_value == logic_popPtr_value);
  assign logic_pushing = (io_push_valid && io_push_ready);
  assign logic_popping = (io_pop_valid && io_pop_ready);
  assign logic_empty = (logic_ptrMatch && (! logic_risingOccupancy));
  assign logic_full = (logic_ptrMatch && logic_risingOccupancy);
  assign io_push_ready = (! logic_full);
  assign io_pop_valid = ((! logic_empty) && (! (_zz_2 && (! logic_full))));
  assign io_pop_payload = _zz_3;
  assign logic_ptrDif = (logic_pushPtr_value - logic_popPtr_value);
  assign io_occupancy = {(logic_risingOccupancy && logic_ptrMatch),logic_ptrDif};
  assign io_availability = {((! logic_risingOccupancy) && logic_ptrMatch),_zz_8};
  always @ (posedge io_systemClk) begin
    if(systemCd_logic_outputReset) begin
      logic_pushPtr_value <= (4'b0000);
      logic_popPtr_value <= (4'b0000);
      logic_risingOccupancy <= 1'b0;
      _zz_2 <= 1'b0;
    end else begin
      logic_pushPtr_value <= logic_pushPtr_valueNext;
      logic_popPtr_value <= logic_popPtr_valueNext;
      _zz_2 <= (logic_popPtr_valueNext == logic_pushPtr_value);
      if((logic_pushing != logic_popping))begin
        logic_risingOccupancy <= logic_pushing;
      end
      if(io_flush)begin
        logic_risingOccupancy <= 1'b0;
      end
    end
  end


endmodule

module UartCtrl (
  input      [2:0]    io_config_frame_dataLength,
  input      `UartStopType_defaultEncoding_type io_config_frame_stop,
  input      `UartParityType_defaultEncoding_type io_config_frame_parity,
  input      [19:0]   io_config_clockDivider,
  input               io_write_valid,
  output reg          io_write_ready,
  input      [7:0]    io_write_payload,
  output              io_read_valid,
  input               io_read_ready,
  output     [7:0]    io_read_payload,
  output              io_uart_txd,
  input               io_uart_rxd,
  output              io_readError,
  input               io_writeBreak,
  output              io_readBreak,
  input               io_systemClk,
  input               systemCd_logic_outputReset
);
  wire                _zz_1;
  wire                tx_io_write_ready;
  wire                tx_io_txd;
  wire                rx_io_read_valid;
  wire       [7:0]    rx_io_read_payload;
  wire                rx_io_rts;
  wire                rx_io_error;
  wire                rx_io_break;
  reg        [19:0]   clockDivider_counter;
  wire                clockDivider_tick;
  reg                 io_write_thrown_valid;
  wire                io_write_thrown_ready;
  wire       [7:0]    io_write_thrown_payload;
  `ifndef SYNTHESIS
  reg [23:0] io_config_frame_stop_string;
  reg [31:0] io_config_frame_parity_string;
  `endif


  UartCtrlTx tx (
    .io_configFrame_dataLength     (io_config_frame_dataLength[2:0]  ), //i
    .io_configFrame_stop           (io_config_frame_stop             ), //i
    .io_configFrame_parity         (io_config_frame_parity[1:0]      ), //i
    .io_samplingTick               (clockDivider_tick                ), //i
    .io_write_valid                (io_write_thrown_valid            ), //i
    .io_write_ready                (tx_io_write_ready                ), //o
    .io_write_payload              (io_write_thrown_payload[7:0]     ), //i
    .io_cts                        (_zz_1                            ), //i
    .io_txd                        (tx_io_txd                        ), //o
    .io_break                      (io_writeBreak                    ), //i
    .io_systemClk                  (io_systemClk                     ), //i
    .systemCd_logic_outputReset    (systemCd_logic_outputReset       )  //i
  );
  UartCtrlRx rx (
    .io_configFrame_dataLength     (io_config_frame_dataLength[2:0]  ), //i
    .io_configFrame_stop           (io_config_frame_stop             ), //i
    .io_configFrame_parity         (io_config_frame_parity[1:0]      ), //i
    .io_samplingTick               (clockDivider_tick                ), //i
    .io_read_valid                 (rx_io_read_valid                 ), //o
    .io_read_ready                 (io_read_ready                    ), //i
    .io_read_payload               (rx_io_read_payload[7:0]          ), //o
    .io_rxd                        (io_uart_rxd                      ), //i
    .io_rts                        (rx_io_rts                        ), //o
    .io_error                      (rx_io_error                      ), //o
    .io_break                      (rx_io_break                      ), //o
    .io_systemClk                  (io_systemClk                     ), //i
    .systemCd_logic_outputReset    (systemCd_logic_outputReset       )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_config_frame_stop)
      `UartStopType_defaultEncoding_ONE : io_config_frame_stop_string = "ONE";
      `UartStopType_defaultEncoding_TWO : io_config_frame_stop_string = "TWO";
      default : io_config_frame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(io_config_frame_parity)
      `UartParityType_defaultEncoding_NONE : io_config_frame_parity_string = "NONE";
      `UartParityType_defaultEncoding_EVEN : io_config_frame_parity_string = "EVEN";
      `UartParityType_defaultEncoding_ODD : io_config_frame_parity_string = "ODD ";
      default : io_config_frame_parity_string = "????";
    endcase
  end
  `endif

  assign clockDivider_tick = (clockDivider_counter == 20'h0);
  always @ (*) begin
    io_write_thrown_valid = io_write_valid;
    if(rx_io_break)begin
      io_write_thrown_valid = 1'b0;
    end
  end

  always @ (*) begin
    io_write_ready = io_write_thrown_ready;
    if(rx_io_break)begin
      io_write_ready = 1'b1;
    end
  end

  assign io_write_thrown_payload = io_write_payload;
  assign io_write_thrown_ready = tx_io_write_ready;
  assign io_read_valid = rx_io_read_valid;
  assign io_read_payload = rx_io_read_payload;
  assign io_uart_txd = tx_io_txd;
  assign io_readError = rx_io_error;
  assign _zz_1 = 1'b0;
  assign io_readBreak = rx_io_break;
  always @ (posedge io_systemClk) begin
    if(systemCd_logic_outputReset) begin
      clockDivider_counter <= 20'h0;
    end else begin
      clockDivider_counter <= (clockDivider_counter - 20'h00001);
      if(clockDivider_tick)begin
        clockDivider_counter <= io_config_clockDivider;
      end
    end
  end


endmodule

module BufferCC_3 (
  input               io_dataIn,
  output              io_dataOut,
  input               io_systemClk,
  input               debugCd_logic_outputReset
);
  reg                 buffers_0;
  reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @ (posedge io_systemClk) begin
    buffers_0 <= io_dataIn;
    buffers_1 <= buffers_0;
  end


endmodule

//BufferCC replaced by BufferCC

//BufferCC replaced by BufferCC

module UartCtrlRx (
  input      [2:0]    io_configFrame_dataLength,
  input      `UartStopType_defaultEncoding_type io_configFrame_stop,
  input      `UartParityType_defaultEncoding_type io_configFrame_parity,
  input               io_samplingTick,
  output              io_read_valid,
  input               io_read_ready,
  output     [7:0]    io_read_payload,
  input               io_rxd,
  output              io_rts,
  output reg          io_error,
  output              io_break,
  input               io_systemClk,
  input               systemCd_logic_outputReset
);
  wire                _zz_2;
  wire                io_rxd_buffercc_io_dataOut;
  wire                _zz_3;
  wire                _zz_4;
  wire                _zz_5;
  wire                _zz_6;
  wire       [0:0]    _zz_7;
  wire       [2:0]    _zz_8;
  wire                _zz_9;
  wire                _zz_10;
  wire                _zz_11;
  wire                _zz_12;
  wire                _zz_13;
  wire                _zz_14;
  wire                _zz_15;
  reg                 _zz_1;
  wire                sampler_synchroniser;
  wire                sampler_samples_0;
  reg                 sampler_samples_1;
  reg                 sampler_samples_2;
  reg                 sampler_samples_3;
  reg                 sampler_samples_4;
  reg                 sampler_value;
  reg                 sampler_tick;
  reg        [2:0]    bitTimer_counter;
  reg                 bitTimer_tick;
  reg        [2:0]    bitCounter_value;
  reg        [6:0]    break_counter;
  wire                break_valid;
  reg        `UartCtrlRxState_defaultEncoding_type stateMachine_state;
  reg                 stateMachine_parity;
  reg        [7:0]    stateMachine_shifter;
  reg                 stateMachine_validReg;
  `ifndef SYNTHESIS
  reg [23:0] io_configFrame_stop_string;
  reg [31:0] io_configFrame_parity_string;
  reg [47:0] stateMachine_state_string;
  `endif


  assign _zz_3 = (stateMachine_parity == sampler_value);
  assign _zz_4 = (! sampler_value);
  assign _zz_5 = ((sampler_tick && (! sampler_value)) && (! break_valid));
  assign _zz_6 = (bitCounter_value == io_configFrame_dataLength);
  assign _zz_7 = ((io_configFrame_stop == `UartStopType_defaultEncoding_ONE) ? (1'b0) : (1'b1));
  assign _zz_8 = {2'd0, _zz_7};
  assign _zz_9 = ((((1'b0 || ((_zz_14 && sampler_samples_1) && sampler_samples_2)) || (((_zz_15 && sampler_samples_0) && sampler_samples_1) && sampler_samples_3)) || (((1'b1 && sampler_samples_0) && sampler_samples_2) && sampler_samples_3)) || (((1'b1 && sampler_samples_1) && sampler_samples_2) && sampler_samples_3));
  assign _zz_10 = (((1'b1 && sampler_samples_0) && sampler_samples_1) && sampler_samples_4);
  assign _zz_11 = ((1'b1 && sampler_samples_0) && sampler_samples_2);
  assign _zz_12 = (1'b1 && sampler_samples_1);
  assign _zz_13 = 1'b1;
  assign _zz_14 = (1'b1 && sampler_samples_0);
  assign _zz_15 = 1'b1;
  BufferCC io_rxd_buffercc (
    .io_initial                    (_zz_2                       ), //i
    .io_dataIn                     (io_rxd                      ), //i
    .io_dataOut                    (io_rxd_buffercc_io_dataOut  ), //o
    .io_systemClk                  (io_systemClk                ), //i
    .systemCd_logic_outputReset    (systemCd_logic_outputReset  )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_configFrame_stop)
      `UartStopType_defaultEncoding_ONE : io_configFrame_stop_string = "ONE";
      `UartStopType_defaultEncoding_TWO : io_configFrame_stop_string = "TWO";
      default : io_configFrame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(io_configFrame_parity)
      `UartParityType_defaultEncoding_NONE : io_configFrame_parity_string = "NONE";
      `UartParityType_defaultEncoding_EVEN : io_configFrame_parity_string = "EVEN";
      `UartParityType_defaultEncoding_ODD : io_configFrame_parity_string = "ODD ";
      default : io_configFrame_parity_string = "????";
    endcase
  end
  always @(*) begin
    case(stateMachine_state)
      `UartCtrlRxState_defaultEncoding_IDLE : stateMachine_state_string = "IDLE  ";
      `UartCtrlRxState_defaultEncoding_START : stateMachine_state_string = "START ";
      `UartCtrlRxState_defaultEncoding_DATA : stateMachine_state_string = "DATA  ";
      `UartCtrlRxState_defaultEncoding_PARITY : stateMachine_state_string = "PARITY";
      `UartCtrlRxState_defaultEncoding_STOP : stateMachine_state_string = "STOP  ";
      default : stateMachine_state_string = "??????";
    endcase
  end
  `endif

  always @ (*) begin
    io_error = 1'b0;
    case(stateMachine_state)
      `UartCtrlRxState_defaultEncoding_IDLE : begin
      end
      `UartCtrlRxState_defaultEncoding_START : begin
      end
      `UartCtrlRxState_defaultEncoding_DATA : begin
      end
      `UartCtrlRxState_defaultEncoding_PARITY : begin
        if(bitTimer_tick)begin
          if(! _zz_3) begin
            io_error = 1'b1;
          end
        end
      end
      default : begin
        if(bitTimer_tick)begin
          if(_zz_4)begin
            io_error = 1'b1;
          end
        end
      end
    endcase
  end

  assign io_rts = _zz_1;
  assign _zz_2 = 1'b0;
  assign sampler_synchroniser = io_rxd_buffercc_io_dataOut;
  assign sampler_samples_0 = sampler_synchroniser;
  always @ (*) begin
    bitTimer_tick = 1'b0;
    if(sampler_tick)begin
      if((bitTimer_counter == (3'b000)))begin
        bitTimer_tick = 1'b1;
      end
    end
  end

  assign break_valid = (break_counter == 7'h68);
  assign io_break = break_valid;
  assign io_read_valid = stateMachine_validReg;
  assign io_read_payload = stateMachine_shifter;
  always @ (posedge io_systemClk) begin
    if(systemCd_logic_outputReset) begin
      _zz_1 <= 1'b0;
      sampler_samples_1 <= 1'b1;
      sampler_samples_2 <= 1'b1;
      sampler_samples_3 <= 1'b1;
      sampler_samples_4 <= 1'b1;
      sampler_value <= 1'b1;
      sampler_tick <= 1'b0;
      break_counter <= 7'h0;
      stateMachine_state <= `UartCtrlRxState_defaultEncoding_IDLE;
      stateMachine_validReg <= 1'b0;
    end else begin
      _zz_1 <= (! io_read_ready);
      if(io_samplingTick)begin
        sampler_samples_1 <= sampler_samples_0;
      end
      if(io_samplingTick)begin
        sampler_samples_2 <= sampler_samples_1;
      end
      if(io_samplingTick)begin
        sampler_samples_3 <= sampler_samples_2;
      end
      if(io_samplingTick)begin
        sampler_samples_4 <= sampler_samples_3;
      end
      sampler_value <= ((((((_zz_9 || _zz_10) || (_zz_11 && sampler_samples_4)) || ((_zz_12 && sampler_samples_2) && sampler_samples_4)) || (((_zz_13 && sampler_samples_0) && sampler_samples_3) && sampler_samples_4)) || (((1'b1 && sampler_samples_1) && sampler_samples_3) && sampler_samples_4)) || (((1'b1 && sampler_samples_2) && sampler_samples_3) && sampler_samples_4));
      sampler_tick <= io_samplingTick;
      if(sampler_value)begin
        break_counter <= 7'h0;
      end else begin
        if((io_samplingTick && (! break_valid)))begin
          break_counter <= (break_counter + 7'h01);
        end
      end
      stateMachine_validReg <= 1'b0;
      case(stateMachine_state)
        `UartCtrlRxState_defaultEncoding_IDLE : begin
          if(_zz_5)begin
            stateMachine_state <= `UartCtrlRxState_defaultEncoding_START;
          end
        end
        `UartCtrlRxState_defaultEncoding_START : begin
          if(bitTimer_tick)begin
            stateMachine_state <= `UartCtrlRxState_defaultEncoding_DATA;
            if((sampler_value == 1'b1))begin
              stateMachine_state <= `UartCtrlRxState_defaultEncoding_IDLE;
            end
          end
        end
        `UartCtrlRxState_defaultEncoding_DATA : begin
          if(bitTimer_tick)begin
            if(_zz_6)begin
              if((io_configFrame_parity == `UartParityType_defaultEncoding_NONE))begin
                stateMachine_state <= `UartCtrlRxState_defaultEncoding_STOP;
                stateMachine_validReg <= 1'b1;
              end else begin
                stateMachine_state <= `UartCtrlRxState_defaultEncoding_PARITY;
              end
            end
          end
        end
        `UartCtrlRxState_defaultEncoding_PARITY : begin
          if(bitTimer_tick)begin
            if(_zz_3)begin
              stateMachine_state <= `UartCtrlRxState_defaultEncoding_STOP;
              stateMachine_validReg <= 1'b1;
            end else begin
              stateMachine_state <= `UartCtrlRxState_defaultEncoding_IDLE;
            end
          end
        end
        default : begin
          if(bitTimer_tick)begin
            if(_zz_4)begin
              stateMachine_state <= `UartCtrlRxState_defaultEncoding_IDLE;
            end else begin
              if((bitCounter_value == _zz_8))begin
                stateMachine_state <= `UartCtrlRxState_defaultEncoding_IDLE;
              end
            end
          end
        end
      endcase
    end
  end

  always @ (posedge io_systemClk) begin
    if(sampler_tick)begin
      bitTimer_counter <= (bitTimer_counter - (3'b001));
    end
    if(bitTimer_tick)begin
      bitCounter_value <= (bitCounter_value + (3'b001));
    end
    if(bitTimer_tick)begin
      stateMachine_parity <= (stateMachine_parity ^ sampler_value);
    end
    case(stateMachine_state)
      `UartCtrlRxState_defaultEncoding_IDLE : begin
        if(_zz_5)begin
          bitTimer_counter <= (3'b010);
        end
      end
      `UartCtrlRxState_defaultEncoding_START : begin
        if(bitTimer_tick)begin
          bitCounter_value <= (3'b000);
          stateMachine_parity <= (io_configFrame_parity == `UartParityType_defaultEncoding_ODD);
        end
      end
      `UartCtrlRxState_defaultEncoding_DATA : begin
        if(bitTimer_tick)begin
          stateMachine_shifter[bitCounter_value] <= sampler_value;
          if(_zz_6)begin
            bitCounter_value <= (3'b000);
          end
        end
      end
      `UartCtrlRxState_defaultEncoding_PARITY : begin
        if(bitTimer_tick)begin
          bitCounter_value <= (3'b000);
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module UartCtrlTx (
  input      [2:0]    io_configFrame_dataLength,
  input      `UartStopType_defaultEncoding_type io_configFrame_stop,
  input      `UartParityType_defaultEncoding_type io_configFrame_parity,
  input               io_samplingTick,
  input               io_write_valid,
  output reg          io_write_ready,
  input      [7:0]    io_write_payload,
  input               io_cts,
  output              io_txd,
  input               io_break,
  input               io_systemClk,
  input               systemCd_logic_outputReset
);
  wire                _zz_2;
  wire       [0:0]    _zz_3;
  wire       [2:0]    _zz_4;
  wire       [0:0]    _zz_5;
  wire       [2:0]    _zz_6;
  reg                 clockDivider_counter_willIncrement;
  wire                clockDivider_counter_willClear;
  reg        [2:0]    clockDivider_counter_valueNext;
  reg        [2:0]    clockDivider_counter_value;
  wire                clockDivider_counter_willOverflowIfInc;
  wire                clockDivider_counter_willOverflow;
  reg        [2:0]    tickCounter_value;
  reg        `UartCtrlTxState_defaultEncoding_type stateMachine_state;
  reg                 stateMachine_parity;
  reg                 stateMachine_txd;
  reg                 _zz_1;
  `ifndef SYNTHESIS
  reg [23:0] io_configFrame_stop_string;
  reg [31:0] io_configFrame_parity_string;
  reg [47:0] stateMachine_state_string;
  `endif


  assign _zz_2 = (tickCounter_value == io_configFrame_dataLength);
  assign _zz_3 = clockDivider_counter_willIncrement;
  assign _zz_4 = {2'd0, _zz_3};
  assign _zz_5 = ((io_configFrame_stop == `UartStopType_defaultEncoding_ONE) ? (1'b0) : (1'b1));
  assign _zz_6 = {2'd0, _zz_5};
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_configFrame_stop)
      `UartStopType_defaultEncoding_ONE : io_configFrame_stop_string = "ONE";
      `UartStopType_defaultEncoding_TWO : io_configFrame_stop_string = "TWO";
      default : io_configFrame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(io_configFrame_parity)
      `UartParityType_defaultEncoding_NONE : io_configFrame_parity_string = "NONE";
      `UartParityType_defaultEncoding_EVEN : io_configFrame_parity_string = "EVEN";
      `UartParityType_defaultEncoding_ODD : io_configFrame_parity_string = "ODD ";
      default : io_configFrame_parity_string = "????";
    endcase
  end
  always @(*) begin
    case(stateMachine_state)
      `UartCtrlTxState_defaultEncoding_IDLE : stateMachine_state_string = "IDLE  ";
      `UartCtrlTxState_defaultEncoding_START : stateMachine_state_string = "START ";
      `UartCtrlTxState_defaultEncoding_DATA : stateMachine_state_string = "DATA  ";
      `UartCtrlTxState_defaultEncoding_PARITY : stateMachine_state_string = "PARITY";
      `UartCtrlTxState_defaultEncoding_STOP : stateMachine_state_string = "STOP  ";
      default : stateMachine_state_string = "??????";
    endcase
  end
  `endif

  always @ (*) begin
    clockDivider_counter_willIncrement = 1'b0;
    if(io_samplingTick)begin
      clockDivider_counter_willIncrement = 1'b1;
    end
  end

  assign clockDivider_counter_willClear = 1'b0;
  assign clockDivider_counter_willOverflowIfInc = (clockDivider_counter_value == (3'b111));
  assign clockDivider_counter_willOverflow = (clockDivider_counter_willOverflowIfInc && clockDivider_counter_willIncrement);
  always @ (*) begin
    clockDivider_counter_valueNext = (clockDivider_counter_value + _zz_4);
    if(clockDivider_counter_willClear)begin
      clockDivider_counter_valueNext = (3'b000);
    end
  end

  always @ (*) begin
    stateMachine_txd = 1'b1;
    case(stateMachine_state)
      `UartCtrlTxState_defaultEncoding_IDLE : begin
      end
      `UartCtrlTxState_defaultEncoding_START : begin
        stateMachine_txd = 1'b0;
      end
      `UartCtrlTxState_defaultEncoding_DATA : begin
        stateMachine_txd = io_write_payload[tickCounter_value];
      end
      `UartCtrlTxState_defaultEncoding_PARITY : begin
        stateMachine_txd = stateMachine_parity;
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    io_write_ready = io_break;
    case(stateMachine_state)
      `UartCtrlTxState_defaultEncoding_IDLE : begin
      end
      `UartCtrlTxState_defaultEncoding_START : begin
      end
      `UartCtrlTxState_defaultEncoding_DATA : begin
        if(clockDivider_counter_willOverflow)begin
          if(_zz_2)begin
            io_write_ready = 1'b1;
          end
        end
      end
      `UartCtrlTxState_defaultEncoding_PARITY : begin
      end
      default : begin
      end
    endcase
  end

  assign io_txd = _zz_1;
  always @ (posedge io_systemClk) begin
    if(systemCd_logic_outputReset) begin
      clockDivider_counter_value <= (3'b000);
      stateMachine_state <= `UartCtrlTxState_defaultEncoding_IDLE;
      _zz_1 <= 1'b1;
    end else begin
      clockDivider_counter_value <= clockDivider_counter_valueNext;
      case(stateMachine_state)
        `UartCtrlTxState_defaultEncoding_IDLE : begin
          if(((io_write_valid && (! io_cts)) && clockDivider_counter_willOverflow))begin
            stateMachine_state <= `UartCtrlTxState_defaultEncoding_START;
          end
        end
        `UartCtrlTxState_defaultEncoding_START : begin
          if(clockDivider_counter_willOverflow)begin
            stateMachine_state <= `UartCtrlTxState_defaultEncoding_DATA;
          end
        end
        `UartCtrlTxState_defaultEncoding_DATA : begin
          if(clockDivider_counter_willOverflow)begin
            if(_zz_2)begin
              if((io_configFrame_parity == `UartParityType_defaultEncoding_NONE))begin
                stateMachine_state <= `UartCtrlTxState_defaultEncoding_STOP;
              end else begin
                stateMachine_state <= `UartCtrlTxState_defaultEncoding_PARITY;
              end
            end
          end
        end
        `UartCtrlTxState_defaultEncoding_PARITY : begin
          if(clockDivider_counter_willOverflow)begin
            stateMachine_state <= `UartCtrlTxState_defaultEncoding_STOP;
          end
        end
        default : begin
          if(clockDivider_counter_willOverflow)begin
            if((tickCounter_value == _zz_6))begin
              stateMachine_state <= (io_write_valid ? `UartCtrlTxState_defaultEncoding_START : `UartCtrlTxState_defaultEncoding_IDLE);
            end
          end
        end
      endcase
      _zz_1 <= (stateMachine_txd && (! io_break));
    end
  end

  always @ (posedge io_systemClk) begin
    if(clockDivider_counter_willOverflow)begin
      tickCounter_value <= (tickCounter_value + (3'b001));
    end
    if(clockDivider_counter_willOverflow)begin
      stateMachine_parity <= (stateMachine_parity ^ stateMachine_txd);
    end
    case(stateMachine_state)
      `UartCtrlTxState_defaultEncoding_IDLE : begin
      end
      `UartCtrlTxState_defaultEncoding_START : begin
        if(clockDivider_counter_willOverflow)begin
          stateMachine_parity <= (io_configFrame_parity == `UartParityType_defaultEncoding_ODD);
          tickCounter_value <= (3'b000);
        end
      end
      `UartCtrlTxState_defaultEncoding_DATA : begin
        if(clockDivider_counter_willOverflow)begin
          if(_zz_2)begin
            tickCounter_value <= (3'b000);
          end
        end
      end
      `UartCtrlTxState_defaultEncoding_PARITY : begin
        if(clockDivider_counter_willOverflow)begin
          tickCounter_value <= (3'b000);
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module BufferCC (
  input               io_initial,
  input               io_dataIn,
  output              io_dataOut,
  input               io_systemClk,
  input               systemCd_logic_outputReset
);
  reg                 buffers_0;
  reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @ (posedge io_systemClk) begin
    if(systemCd_logic_outputReset) begin
      buffers_0 <= io_initial;
      buffers_1 <= io_initial;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule
