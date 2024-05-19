// This program was cloned from: https://github.com/HEP-Alliance/hsm
// License: Apache License 2.0

// Generator : SpinalHDL v1.6.1    git head : 7e3c3d1367eaac655f4ad5636fba441852fe073e
// Component : PQVexRiscvVEHEP
// Git hash  : f8416a502cd19630e6eb3b6e0b451763043c11dd


`define BranchCtrlEnum_binary_sequential_type [1:0]
`define BranchCtrlEnum_binary_sequential_INC 2'b00
`define BranchCtrlEnum_binary_sequential_B 2'b01
`define BranchCtrlEnum_binary_sequential_JAL 2'b10
`define BranchCtrlEnum_binary_sequential_JALR 2'b11

`define ShiftCtrlEnum_binary_sequential_type [1:0]
`define ShiftCtrlEnum_binary_sequential_DISABLE_1 2'b00
`define ShiftCtrlEnum_binary_sequential_SLL_1 2'b01
`define ShiftCtrlEnum_binary_sequential_SRL_1 2'b10
`define ShiftCtrlEnum_binary_sequential_SRA_1 2'b11

`define AluBitwiseCtrlEnum_binary_sequential_type [1:0]
`define AluBitwiseCtrlEnum_binary_sequential_XOR_1 2'b00
`define AluBitwiseCtrlEnum_binary_sequential_OR_1 2'b01
`define AluBitwiseCtrlEnum_binary_sequential_AND_1 2'b10

`define EnvCtrlEnum_binary_sequential_type [0:0]
`define EnvCtrlEnum_binary_sequential_NONE 1'b0
`define EnvCtrlEnum_binary_sequential_XRET 1'b1

`define AluCtrlEnum_binary_sequential_type [1:0]
`define AluCtrlEnum_binary_sequential_ADD_SUB 2'b00
`define AluCtrlEnum_binary_sequential_SLT_SLTU 2'b01
`define AluCtrlEnum_binary_sequential_BITWISE 2'b10

`define Src2CtrlEnum_binary_sequential_type [1:0]
`define Src2CtrlEnum_binary_sequential_RS 2'b00
`define Src2CtrlEnum_binary_sequential_IMI 2'b01
`define Src2CtrlEnum_binary_sequential_IMS 2'b10
`define Src2CtrlEnum_binary_sequential_PC 2'b11

`define Src1CtrlEnum_binary_sequential_type [1:0]
`define Src1CtrlEnum_binary_sequential_RS 2'b00
`define Src1CtrlEnum_binary_sequential_IMU 2'b01
`define Src1CtrlEnum_binary_sequential_PC_INCREMENT 2'b10
`define Src1CtrlEnum_binary_sequential_URS1 2'b11

`define JtagState_binary_sequential_type [3:0]
`define JtagState_binary_sequential_RESET 4'b0000
`define JtagState_binary_sequential_IDLE 4'b0001
`define JtagState_binary_sequential_IR_SELECT 4'b0010
`define JtagState_binary_sequential_IR_CAPTURE 4'b0011
`define JtagState_binary_sequential_IR_SHIFT 4'b0100
`define JtagState_binary_sequential_IR_EXIT1 4'b0101
`define JtagState_binary_sequential_IR_PAUSE 4'b0110
`define JtagState_binary_sequential_IR_EXIT2 4'b0111
`define JtagState_binary_sequential_IR_UPDATE 4'b1000
`define JtagState_binary_sequential_DR_SELECT 4'b1001
`define JtagState_binary_sequential_DR_CAPTURE 4'b1010
`define JtagState_binary_sequential_DR_SHIFT 4'b1011
`define JtagState_binary_sequential_DR_EXIT1 4'b1100
`define JtagState_binary_sequential_DR_PAUSE 4'b1101
`define JtagState_binary_sequential_DR_EXIT2 4'b1110
`define JtagState_binary_sequential_DR_UPDATE 4'b1111

`define UartStopType_binary_sequential_type [0:0]
`define UartStopType_binary_sequential_ONE 1'b0
`define UartStopType_binary_sequential_TWO 1'b1

`define UartParityType_binary_sequential_type [1:0]
`define UartParityType_binary_sequential_NONE 2'b00
`define UartParityType_binary_sequential_EVEN 2'b01
`define UartParityType_binary_sequential_ODD 2'b10

`define UartCtrlTxState_binary_sequential_type [2:0]
`define UartCtrlTxState_binary_sequential_IDLE 3'b000
`define UartCtrlTxState_binary_sequential_START 3'b001
`define UartCtrlTxState_binary_sequential_DATA 3'b010
`define UartCtrlTxState_binary_sequential_PARITY 3'b011
`define UartCtrlTxState_binary_sequential_STOP 3'b100

`define UartCtrlRxState_binary_sequential_type [2:0]
`define UartCtrlRxState_binary_sequential_IDLE 3'b000
`define UartCtrlRxState_binary_sequential_START 3'b001
`define UartCtrlRxState_binary_sequential_DATA 3'b010
`define UartCtrlRxState_binary_sequential_PARITY 3'b011
`define UartCtrlRxState_binary_sequential_STOP 3'b100


module PQVexRiscvVEHEP (
  input               jtag_tms,
  input               jtag_tdi,
  output              jtag_tdo,
  input               jtag_tck,
  output              uart_txd,
  input               uart_rxd,
  input      [31:0]   gpio_read,
  output     [31:0]   gpio_write,
  output     [31:0]   gpio_writeEnable,
  input               spi_sclk,
  input               spi_mosi,
  output              spi_miso_write,
  output              spi_miso_writeEnable,
  input               spi_ss,
  input               clk,
  input               reset
);
  wire       [7:0]    core_cpu_debug_bus_cmd_payload_address;
  wire       [4:0]    UARTPeripheral_uartCtrl_io_apb_PADDR;
  wire       [15:0]   AESMaskedPeripheral_aesCtrl_io_bus_PADDR;
  wire       [3:0]    GPIOPeripheral_gpioCtrl_io_apb_PADDR;
  wire       [7:0]    SpiSlavePeripheral_spiCtrl_io_apb_PADDR;
  wire       [14:0]   pipelinedMemoryBusVEHEP_8_io_bus_arbiter_io_inputs_0_cmd_payload_address;
  wire       [14:0]   pipelinedMemoryBusVEHEP_8_io_bus_arbiter_io_inputs_1_cmd_payload_address;
  wire       [14:0]   pipelinedMemoryBusVEHEP_9_io_bus_arbiter_io_inputs_0_cmd_payload_address;
  wire       [14:0]   pipelinedMemoryBusVEHEP_9_io_bus_arbiter_io_inputs_1_cmd_payload_address;
  wire       [14:0]   pipelinedMemoryBusVEHEP_10_io_bus_arbiter_io_inputs_0_cmd_payload_address;
  wire       [14:0]   pipelinedMemoryBusVEHEP_10_io_bus_arbiter_io_inputs_1_cmd_payload_address;
  wire       [14:0]   pipelinedMemoryBusVEHEP_11_io_bus_arbiter_io_inputs_0_cmd_payload_address;
  wire       [14:0]   pipelinedMemoryBusVEHEP_11_io_bus_arbiter_io_inputs_1_cmd_payload_address;
  wire       [14:0]   pipelinedMemoryBusVEHEP_12_io_bus_arbiter_io_inputs_0_cmd_payload_address;
  wire       [14:0]   pipelinedMemoryBusVEHEP_12_io_bus_arbiter_io_inputs_1_cmd_payload_address;
  wire       [14:0]   pipelinedMemoryBusVEHEP_13_io_bus_arbiter_io_inputs_0_cmd_payload_address;
  wire       [14:0]   pipelinedMemoryBusVEHEP_13_io_bus_arbiter_io_inputs_1_cmd_payload_address;
  wire       [14:0]   pipelinedMemoryBusVEHEP_14_io_bus_arbiter_io_inputs_0_cmd_payload_address;
  wire       [14:0]   pipelinedMemoryBusVEHEP_14_io_bus_arbiter_io_inputs_1_cmd_payload_address;
  wire       [14:0]   pipelinedMemoryBusVEHEP_15_io_bus_arbiter_io_inputs_0_cmd_payload_address;
  wire       [14:0]   pipelinedMemoryBusVEHEP_15_io_bus_arbiter_io_inputs_1_cmd_payload_address;
  wire                asyncReset_buffercc_io_dataOut;
  wire                core_cpu_iBus_cmd_valid;
  wire       [31:0]   core_cpu_iBus_cmd_payload_pc;
  wire                core_cpu_debug_bus_cmd_ready;
  wire       [31:0]   core_cpu_debug_bus_rsp_data;
  wire                core_cpu_debug_resetOut;
  wire                core_cpu_dBus_cmd_valid;
  wire                core_cpu_dBus_cmd_payload_wr;
  wire       [31:0]   core_cpu_dBus_cmd_payload_address;
  wire       [31:0]   core_cpu_dBus_cmd_payload_data;
  wire       [1:0]    core_cpu_dBus_cmd_payload_size;
  wire                jtagBridge_1_io_jtag_tdo;
  wire                jtagBridge_1_io_remote_cmd_valid;
  wire                jtagBridge_1_io_remote_cmd_payload_last;
  wire       [0:0]    jtagBridge_1_io_remote_cmd_payload_fragment;
  wire                jtagBridge_1_io_remote_rsp_ready;
  wire                systemDebugger_1_io_remote_cmd_ready;
  wire                systemDebugger_1_io_remote_rsp_valid;
  wire                systemDebugger_1_io_remote_rsp_payload_error;
  wire       [31:0]   systemDebugger_1_io_remote_rsp_payload_data;
  wire                systemDebugger_1_io_mem_cmd_valid;
  wire       [31:0]   systemDebugger_1_io_mem_cmd_payload_address;
  wire       [31:0]   systemDebugger_1_io_mem_cmd_payload_data;
  wire                systemDebugger_1_io_mem_cmd_payload_wr;
  wire       [1:0]    systemDebugger_1_io_mem_cmd_payload_size;
  wire                UARTPeripheral_uartCtrl_io_apb_PREADY;
  wire       [31:0]   UARTPeripheral_uartCtrl_io_apb_PRDATA;
  wire                UARTPeripheral_uartCtrl_io_uart_txd;
  wire                UARTPeripheral_uartCtrl_io_interrupt;
  wire                AESMaskedPeripheral_aesCtrl_io_bus_PREADY;
  wire       [31:0]   AESMaskedPeripheral_aesCtrl_io_bus_PRDATA;
  wire                GPIOPeripheral_gpioCtrl_io_apb_PREADY;
  wire       [31:0]   GPIOPeripheral_gpioCtrl_io_apb_PRDATA;
  wire                GPIOPeripheral_gpioCtrl_io_apb_PSLVERROR;
  wire       [31:0]   GPIOPeripheral_gpioCtrl_io_gpio_write;
  wire       [31:0]   GPIOPeripheral_gpioCtrl_io_gpio_writeEnable;
  wire       [31:0]   GPIOPeripheral_gpioCtrl_io_value;
  wire                SpiSlavePeripheral_spiCtrl_io_apb_PREADY;
  wire       [31:0]   SpiSlavePeripheral_spiCtrl_io_apb_PRDATA;
  wire                SpiSlavePeripheral_spiCtrl_io_spi_miso_write;
  wire                SpiSlavePeripheral_spiCtrl_io_spi_miso_writeEnable;
  wire                SpiSlavePeripheral_spiCtrl_io_interrupt;
  wire                pipelinedMemoryBusVEHEP_8_io_bus_cmd_ready;
  wire                pipelinedMemoryBusVEHEP_8_io_bus_rsp_valid;
  wire       [31:0]   pipelinedMemoryBusVEHEP_8_io_bus_rsp_payload_data;
  wire                pipelinedMemoryBusVEHEP_9_io_bus_cmd_ready;
  wire                pipelinedMemoryBusVEHEP_9_io_bus_rsp_valid;
  wire       [31:0]   pipelinedMemoryBusVEHEP_9_io_bus_rsp_payload_data;
  wire                pipelinedMemoryBusVEHEP_10_io_bus_cmd_ready;
  wire                pipelinedMemoryBusVEHEP_10_io_bus_rsp_valid;
  wire       [31:0]   pipelinedMemoryBusVEHEP_10_io_bus_rsp_payload_data;
  wire                pipelinedMemoryBusVEHEP_11_io_bus_cmd_ready;
  wire                pipelinedMemoryBusVEHEP_11_io_bus_rsp_valid;
  wire       [31:0]   pipelinedMemoryBusVEHEP_11_io_bus_rsp_payload_data;
  wire                pipelinedMemoryBusVEHEP_12_io_bus_cmd_ready;
  wire                pipelinedMemoryBusVEHEP_12_io_bus_rsp_valid;
  wire       [31:0]   pipelinedMemoryBusVEHEP_12_io_bus_rsp_payload_data;
  wire                pipelinedMemoryBusVEHEP_13_io_bus_cmd_ready;
  wire                pipelinedMemoryBusVEHEP_13_io_bus_rsp_valid;
  wire       [31:0]   pipelinedMemoryBusVEHEP_13_io_bus_rsp_payload_data;
  wire                pipelinedMemoryBusVEHEP_14_io_bus_cmd_ready;
  wire                pipelinedMemoryBusVEHEP_14_io_bus_rsp_valid;
  wire       [31:0]   pipelinedMemoryBusVEHEP_14_io_bus_rsp_payload_data;
  wire                pipelinedMemoryBusVEHEP_15_io_bus_cmd_ready;
  wire                pipelinedMemoryBusVEHEP_15_io_bus_rsp_valid;
  wire       [31:0]   pipelinedMemoryBusVEHEP_15_io_bus_rsp_payload_data;
  wire                apbCrossbar_apbBridge_io_pipelinedMemoryBus_cmd_ready;
  wire                apbCrossbar_apbBridge_io_pipelinedMemoryBus_rsp_valid;
  wire       [31:0]   apbCrossbar_apbBridge_io_pipelinedMemoryBus_rsp_payload_data;
  wire       [19:0]   apbCrossbar_apbBridge_io_apb_PADDR;
  wire       [0:0]    apbCrossbar_apbBridge_io_apb_PSEL;
  wire                apbCrossbar_apbBridge_io_apb_PENABLE;
  wire                apbCrossbar_apbBridge_io_apb_PWRITE;
  wire       [31:0]   apbCrossbar_apbBridge_io_apb_PWDATA;
  wire                io_apb_decoder_io_input_PREADY;
  wire       [31:0]   io_apb_decoder_io_input_PRDATA;
  wire                io_apb_decoder_io_input_PSLVERROR;
  wire       [19:0]   io_apb_decoder_io_output_PADDR;
  wire       [3:0]    io_apb_decoder_io_output_PSEL;
  wire                io_apb_decoder_io_output_PENABLE;
  wire                io_apb_decoder_io_output_PWRITE;
  wire       [31:0]   io_apb_decoder_io_output_PWDATA;
  wire                apb3Router_1_io_input_PREADY;
  wire       [31:0]   apb3Router_1_io_input_PRDATA;
  wire                apb3Router_1_io_input_PSLVERROR;
  wire       [19:0]   apb3Router_1_io_outputs_0_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_0_PSEL;
  wire                apb3Router_1_io_outputs_0_PENABLE;
  wire                apb3Router_1_io_outputs_0_PWRITE;
  wire       [31:0]   apb3Router_1_io_outputs_0_PWDATA;
  wire       [19:0]   apb3Router_1_io_outputs_1_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_1_PSEL;
  wire                apb3Router_1_io_outputs_1_PENABLE;
  wire                apb3Router_1_io_outputs_1_PWRITE;
  wire       [31:0]   apb3Router_1_io_outputs_1_PWDATA;
  wire       [19:0]   apb3Router_1_io_outputs_2_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_2_PSEL;
  wire                apb3Router_1_io_outputs_2_PENABLE;
  wire                apb3Router_1_io_outputs_2_PWRITE;
  wire       [31:0]   apb3Router_1_io_outputs_2_PWDATA;
  wire       [19:0]   apb3Router_1_io_outputs_3_PADDR;
  wire       [0:0]    apb3Router_1_io_outputs_3_PSEL;
  wire                apb3Router_1_io_outputs_3_PENABLE;
  wire                apb3Router_1_io_outputs_3_PWRITE;
  wire       [31:0]   apb3Router_1_io_outputs_3_PWDATA;
  wire                core_dbus_decoder_io_input_cmd_ready;
  wire                core_dbus_decoder_io_input_rsp_valid;
  wire       [31:0]   core_dbus_decoder_io_input_rsp_payload_data;
  wire                core_dbus_decoder_io_outputs_0_cmd_valid;
  wire                core_dbus_decoder_io_outputs_0_cmd_payload_write;
  wire       [31:0]   core_dbus_decoder_io_outputs_0_cmd_payload_address;
  wire       [31:0]   core_dbus_decoder_io_outputs_0_cmd_payload_data;
  wire       [3:0]    core_dbus_decoder_io_outputs_0_cmd_payload_mask;
  wire                core_dbus_decoder_io_outputs_1_cmd_valid;
  wire                core_dbus_decoder_io_outputs_1_cmd_payload_write;
  wire       [31:0]   core_dbus_decoder_io_outputs_1_cmd_payload_address;
  wire       [31:0]   core_dbus_decoder_io_outputs_1_cmd_payload_data;
  wire       [3:0]    core_dbus_decoder_io_outputs_1_cmd_payload_mask;
  wire                core_dbus_decoder_io_outputs_2_cmd_valid;
  wire                core_dbus_decoder_io_outputs_2_cmd_payload_write;
  wire       [31:0]   core_dbus_decoder_io_outputs_2_cmd_payload_address;
  wire       [31:0]   core_dbus_decoder_io_outputs_2_cmd_payload_data;
  wire       [3:0]    core_dbus_decoder_io_outputs_2_cmd_payload_mask;
  wire                core_dbus_decoder_io_outputs_3_cmd_valid;
  wire                core_dbus_decoder_io_outputs_3_cmd_payload_write;
  wire       [31:0]   core_dbus_decoder_io_outputs_3_cmd_payload_address;
  wire       [31:0]   core_dbus_decoder_io_outputs_3_cmd_payload_data;
  wire       [3:0]    core_dbus_decoder_io_outputs_3_cmd_payload_mask;
  wire                core_dbus_decoder_io_outputs_4_cmd_valid;
  wire                core_dbus_decoder_io_outputs_4_cmd_payload_write;
  wire       [31:0]   core_dbus_decoder_io_outputs_4_cmd_payload_address;
  wire       [31:0]   core_dbus_decoder_io_outputs_4_cmd_payload_data;
  wire       [3:0]    core_dbus_decoder_io_outputs_4_cmd_payload_mask;
  wire                core_dbus_decoder_io_outputs_5_cmd_valid;
  wire                core_dbus_decoder_io_outputs_5_cmd_payload_write;
  wire       [31:0]   core_dbus_decoder_io_outputs_5_cmd_payload_address;
  wire       [31:0]   core_dbus_decoder_io_outputs_5_cmd_payload_data;
  wire       [3:0]    core_dbus_decoder_io_outputs_5_cmd_payload_mask;
  wire                core_dbus_decoder_io_outputs_6_cmd_valid;
  wire                core_dbus_decoder_io_outputs_6_cmd_payload_write;
  wire       [31:0]   core_dbus_decoder_io_outputs_6_cmd_payload_address;
  wire       [31:0]   core_dbus_decoder_io_outputs_6_cmd_payload_data;
  wire       [3:0]    core_dbus_decoder_io_outputs_6_cmd_payload_mask;
  wire                core_dbus_decoder_io_outputs_7_cmd_valid;
  wire                core_dbus_decoder_io_outputs_7_cmd_payload_write;
  wire       [31:0]   core_dbus_decoder_io_outputs_7_cmd_payload_address;
  wire       [31:0]   core_dbus_decoder_io_outputs_7_cmd_payload_data;
  wire       [3:0]    core_dbus_decoder_io_outputs_7_cmd_payload_mask;
  wire                core_dbus_decoder_io_outputs_8_cmd_valid;
  wire                core_dbus_decoder_io_outputs_8_cmd_payload_write;
  wire       [31:0]   core_dbus_decoder_io_outputs_8_cmd_payload_address;
  wire       [31:0]   core_dbus_decoder_io_outputs_8_cmd_payload_data;
  wire       [3:0]    core_dbus_decoder_io_outputs_8_cmd_payload_mask;
  wire                core_ibus_decoder_io_input_cmd_ready;
  wire                core_ibus_decoder_io_input_rsp_valid;
  wire       [31:0]   core_ibus_decoder_io_input_rsp_payload_data;
  wire                core_ibus_decoder_io_outputs_0_cmd_valid;
  wire                core_ibus_decoder_io_outputs_0_cmd_payload_write;
  wire       [31:0]   core_ibus_decoder_io_outputs_0_cmd_payload_address;
  wire       [31:0]   core_ibus_decoder_io_outputs_0_cmd_payload_data;
  wire       [3:0]    core_ibus_decoder_io_outputs_0_cmd_payload_mask;
  wire                core_ibus_decoder_io_outputs_1_cmd_valid;
  wire                core_ibus_decoder_io_outputs_1_cmd_payload_write;
  wire       [31:0]   core_ibus_decoder_io_outputs_1_cmd_payload_address;
  wire       [31:0]   core_ibus_decoder_io_outputs_1_cmd_payload_data;
  wire       [3:0]    core_ibus_decoder_io_outputs_1_cmd_payload_mask;
  wire                core_ibus_decoder_io_outputs_2_cmd_valid;
  wire                core_ibus_decoder_io_outputs_2_cmd_payload_write;
  wire       [31:0]   core_ibus_decoder_io_outputs_2_cmd_payload_address;
  wire       [31:0]   core_ibus_decoder_io_outputs_2_cmd_payload_data;
  wire       [3:0]    core_ibus_decoder_io_outputs_2_cmd_payload_mask;
  wire                core_ibus_decoder_io_outputs_3_cmd_valid;
  wire                core_ibus_decoder_io_outputs_3_cmd_payload_write;
  wire       [31:0]   core_ibus_decoder_io_outputs_3_cmd_payload_address;
  wire       [31:0]   core_ibus_decoder_io_outputs_3_cmd_payload_data;
  wire       [3:0]    core_ibus_decoder_io_outputs_3_cmd_payload_mask;
  wire                core_ibus_decoder_io_outputs_4_cmd_valid;
  wire                core_ibus_decoder_io_outputs_4_cmd_payload_write;
  wire       [31:0]   core_ibus_decoder_io_outputs_4_cmd_payload_address;
  wire       [31:0]   core_ibus_decoder_io_outputs_4_cmd_payload_data;
  wire       [3:0]    core_ibus_decoder_io_outputs_4_cmd_payload_mask;
  wire                core_ibus_decoder_io_outputs_5_cmd_valid;
  wire                core_ibus_decoder_io_outputs_5_cmd_payload_write;
  wire       [31:0]   core_ibus_decoder_io_outputs_5_cmd_payload_address;
  wire       [31:0]   core_ibus_decoder_io_outputs_5_cmd_payload_data;
  wire       [3:0]    core_ibus_decoder_io_outputs_5_cmd_payload_mask;
  wire                core_ibus_decoder_io_outputs_6_cmd_valid;
  wire                core_ibus_decoder_io_outputs_6_cmd_payload_write;
  wire       [31:0]   core_ibus_decoder_io_outputs_6_cmd_payload_address;
  wire       [31:0]   core_ibus_decoder_io_outputs_6_cmd_payload_data;
  wire       [3:0]    core_ibus_decoder_io_outputs_6_cmd_payload_mask;
  wire                core_ibus_decoder_io_outputs_7_cmd_valid;
  wire                core_ibus_decoder_io_outputs_7_cmd_payload_write;
  wire       [31:0]   core_ibus_decoder_io_outputs_7_cmd_payload_address;
  wire       [31:0]   core_ibus_decoder_io_outputs_7_cmd_payload_data;
  wire       [3:0]    core_ibus_decoder_io_outputs_7_cmd_payload_mask;
  wire                pipelinedMemoryBusVEHEP_8_io_bus_arbiter_io_inputs_0_cmd_ready;
  wire                pipelinedMemoryBusVEHEP_8_io_bus_arbiter_io_inputs_0_rsp_valid;
  wire       [31:0]   pipelinedMemoryBusVEHEP_8_io_bus_arbiter_io_inputs_0_rsp_payload_data;
  wire                pipelinedMemoryBusVEHEP_8_io_bus_arbiter_io_inputs_1_cmd_ready;
  wire                pipelinedMemoryBusVEHEP_8_io_bus_arbiter_io_inputs_1_rsp_valid;
  wire       [31:0]   pipelinedMemoryBusVEHEP_8_io_bus_arbiter_io_inputs_1_rsp_payload_data;
  wire                pipelinedMemoryBusVEHEP_8_io_bus_arbiter_io_output_cmd_valid;
  wire                pipelinedMemoryBusVEHEP_8_io_bus_arbiter_io_output_cmd_payload_write;
  wire       [14:0]   pipelinedMemoryBusVEHEP_8_io_bus_arbiter_io_output_cmd_payload_address;
  wire       [31:0]   pipelinedMemoryBusVEHEP_8_io_bus_arbiter_io_output_cmd_payload_data;
  wire       [3:0]    pipelinedMemoryBusVEHEP_8_io_bus_arbiter_io_output_cmd_payload_mask;
  wire                pipelinedMemoryBusVEHEP_9_io_bus_arbiter_io_inputs_0_cmd_ready;
  wire                pipelinedMemoryBusVEHEP_9_io_bus_arbiter_io_inputs_0_rsp_valid;
  wire       [31:0]   pipelinedMemoryBusVEHEP_9_io_bus_arbiter_io_inputs_0_rsp_payload_data;
  wire                pipelinedMemoryBusVEHEP_9_io_bus_arbiter_io_inputs_1_cmd_ready;
  wire                pipelinedMemoryBusVEHEP_9_io_bus_arbiter_io_inputs_1_rsp_valid;
  wire       [31:0]   pipelinedMemoryBusVEHEP_9_io_bus_arbiter_io_inputs_1_rsp_payload_data;
  wire                pipelinedMemoryBusVEHEP_9_io_bus_arbiter_io_output_cmd_valid;
  wire                pipelinedMemoryBusVEHEP_9_io_bus_arbiter_io_output_cmd_payload_write;
  wire       [14:0]   pipelinedMemoryBusVEHEP_9_io_bus_arbiter_io_output_cmd_payload_address;
  wire       [31:0]   pipelinedMemoryBusVEHEP_9_io_bus_arbiter_io_output_cmd_payload_data;
  wire       [3:0]    pipelinedMemoryBusVEHEP_9_io_bus_arbiter_io_output_cmd_payload_mask;
  wire                pipelinedMemoryBusVEHEP_10_io_bus_arbiter_io_inputs_0_cmd_ready;
  wire                pipelinedMemoryBusVEHEP_10_io_bus_arbiter_io_inputs_0_rsp_valid;
  wire       [31:0]   pipelinedMemoryBusVEHEP_10_io_bus_arbiter_io_inputs_0_rsp_payload_data;
  wire                pipelinedMemoryBusVEHEP_10_io_bus_arbiter_io_inputs_1_cmd_ready;
  wire                pipelinedMemoryBusVEHEP_10_io_bus_arbiter_io_inputs_1_rsp_valid;
  wire       [31:0]   pipelinedMemoryBusVEHEP_10_io_bus_arbiter_io_inputs_1_rsp_payload_data;
  wire                pipelinedMemoryBusVEHEP_10_io_bus_arbiter_io_output_cmd_valid;
  wire                pipelinedMemoryBusVEHEP_10_io_bus_arbiter_io_output_cmd_payload_write;
  wire       [14:0]   pipelinedMemoryBusVEHEP_10_io_bus_arbiter_io_output_cmd_payload_address;
  wire       [31:0]   pipelinedMemoryBusVEHEP_10_io_bus_arbiter_io_output_cmd_payload_data;
  wire       [3:0]    pipelinedMemoryBusVEHEP_10_io_bus_arbiter_io_output_cmd_payload_mask;
  wire                pipelinedMemoryBusVEHEP_11_io_bus_arbiter_io_inputs_0_cmd_ready;
  wire                pipelinedMemoryBusVEHEP_11_io_bus_arbiter_io_inputs_0_rsp_valid;
  wire       [31:0]   pipelinedMemoryBusVEHEP_11_io_bus_arbiter_io_inputs_0_rsp_payload_data;
  wire                pipelinedMemoryBusVEHEP_11_io_bus_arbiter_io_inputs_1_cmd_ready;
  wire                pipelinedMemoryBusVEHEP_11_io_bus_arbiter_io_inputs_1_rsp_valid;
  wire       [31:0]   pipelinedMemoryBusVEHEP_11_io_bus_arbiter_io_inputs_1_rsp_payload_data;
  wire                pipelinedMemoryBusVEHEP_11_io_bus_arbiter_io_output_cmd_valid;
  wire                pipelinedMemoryBusVEHEP_11_io_bus_arbiter_io_output_cmd_payload_write;
  wire       [14:0]   pipelinedMemoryBusVEHEP_11_io_bus_arbiter_io_output_cmd_payload_address;
  wire       [31:0]   pipelinedMemoryBusVEHEP_11_io_bus_arbiter_io_output_cmd_payload_data;
  wire       [3:0]    pipelinedMemoryBusVEHEP_11_io_bus_arbiter_io_output_cmd_payload_mask;
  wire                pipelinedMemoryBusVEHEP_12_io_bus_arbiter_io_inputs_0_cmd_ready;
  wire                pipelinedMemoryBusVEHEP_12_io_bus_arbiter_io_inputs_0_rsp_valid;
  wire       [31:0]   pipelinedMemoryBusVEHEP_12_io_bus_arbiter_io_inputs_0_rsp_payload_data;
  wire                pipelinedMemoryBusVEHEP_12_io_bus_arbiter_io_inputs_1_cmd_ready;
  wire                pipelinedMemoryBusVEHEP_12_io_bus_arbiter_io_inputs_1_rsp_valid;
  wire       [31:0]   pipelinedMemoryBusVEHEP_12_io_bus_arbiter_io_inputs_1_rsp_payload_data;
  wire                pipelinedMemoryBusVEHEP_12_io_bus_arbiter_io_output_cmd_valid;
  wire                pipelinedMemoryBusVEHEP_12_io_bus_arbiter_io_output_cmd_payload_write;
  wire       [14:0]   pipelinedMemoryBusVEHEP_12_io_bus_arbiter_io_output_cmd_payload_address;
  wire       [31:0]   pipelinedMemoryBusVEHEP_12_io_bus_arbiter_io_output_cmd_payload_data;
  wire       [3:0]    pipelinedMemoryBusVEHEP_12_io_bus_arbiter_io_output_cmd_payload_mask;
  wire                pipelinedMemoryBusVEHEP_13_io_bus_arbiter_io_inputs_0_cmd_ready;
  wire                pipelinedMemoryBusVEHEP_13_io_bus_arbiter_io_inputs_0_rsp_valid;
  wire       [31:0]   pipelinedMemoryBusVEHEP_13_io_bus_arbiter_io_inputs_0_rsp_payload_data;
  wire                pipelinedMemoryBusVEHEP_13_io_bus_arbiter_io_inputs_1_cmd_ready;
  wire                pipelinedMemoryBusVEHEP_13_io_bus_arbiter_io_inputs_1_rsp_valid;
  wire       [31:0]   pipelinedMemoryBusVEHEP_13_io_bus_arbiter_io_inputs_1_rsp_payload_data;
  wire                pipelinedMemoryBusVEHEP_13_io_bus_arbiter_io_output_cmd_valid;
  wire                pipelinedMemoryBusVEHEP_13_io_bus_arbiter_io_output_cmd_payload_write;
  wire       [14:0]   pipelinedMemoryBusVEHEP_13_io_bus_arbiter_io_output_cmd_payload_address;
  wire       [31:0]   pipelinedMemoryBusVEHEP_13_io_bus_arbiter_io_output_cmd_payload_data;
  wire       [3:0]    pipelinedMemoryBusVEHEP_13_io_bus_arbiter_io_output_cmd_payload_mask;
  wire                pipelinedMemoryBusVEHEP_14_io_bus_arbiter_io_inputs_0_cmd_ready;
  wire                pipelinedMemoryBusVEHEP_14_io_bus_arbiter_io_inputs_0_rsp_valid;
  wire       [31:0]   pipelinedMemoryBusVEHEP_14_io_bus_arbiter_io_inputs_0_rsp_payload_data;
  wire                pipelinedMemoryBusVEHEP_14_io_bus_arbiter_io_inputs_1_cmd_ready;
  wire                pipelinedMemoryBusVEHEP_14_io_bus_arbiter_io_inputs_1_rsp_valid;
  wire       [31:0]   pipelinedMemoryBusVEHEP_14_io_bus_arbiter_io_inputs_1_rsp_payload_data;
  wire                pipelinedMemoryBusVEHEP_14_io_bus_arbiter_io_output_cmd_valid;
  wire                pipelinedMemoryBusVEHEP_14_io_bus_arbiter_io_output_cmd_payload_write;
  wire       [14:0]   pipelinedMemoryBusVEHEP_14_io_bus_arbiter_io_output_cmd_payload_address;
  wire       [31:0]   pipelinedMemoryBusVEHEP_14_io_bus_arbiter_io_output_cmd_payload_data;
  wire       [3:0]    pipelinedMemoryBusVEHEP_14_io_bus_arbiter_io_output_cmd_payload_mask;
  wire                pipelinedMemoryBusVEHEP_15_io_bus_arbiter_io_inputs_0_cmd_ready;
  wire                pipelinedMemoryBusVEHEP_15_io_bus_arbiter_io_inputs_0_rsp_valid;
  wire       [31:0]   pipelinedMemoryBusVEHEP_15_io_bus_arbiter_io_inputs_0_rsp_payload_data;
  wire                pipelinedMemoryBusVEHEP_15_io_bus_arbiter_io_inputs_1_cmd_ready;
  wire                pipelinedMemoryBusVEHEP_15_io_bus_arbiter_io_inputs_1_rsp_valid;
  wire       [31:0]   pipelinedMemoryBusVEHEP_15_io_bus_arbiter_io_inputs_1_rsp_payload_data;
  wire                pipelinedMemoryBusVEHEP_15_io_bus_arbiter_io_output_cmd_valid;
  wire                pipelinedMemoryBusVEHEP_15_io_bus_arbiter_io_output_cmd_payload_write;
  wire       [14:0]   pipelinedMemoryBusVEHEP_15_io_bus_arbiter_io_output_cmd_payload_address;
  wire       [31:0]   pipelinedMemoryBusVEHEP_15_io_bus_arbiter_io_output_cmd_payload_data;
  wire       [3:0]    pipelinedMemoryBusVEHEP_15_io_bus_arbiter_io_output_cmd_payload_mask;
  wire                apbCrossbar_apbBridge_io_pipelinedMemoryBus_arbiter_io_inputs_0_cmd_ready;
  wire                apbCrossbar_apbBridge_io_pipelinedMemoryBus_arbiter_io_inputs_0_rsp_valid;
  wire       [31:0]   apbCrossbar_apbBridge_io_pipelinedMemoryBus_arbiter_io_inputs_0_rsp_payload_data;
  wire                apbCrossbar_apbBridge_io_pipelinedMemoryBus_arbiter_io_output_cmd_valid;
  wire                apbCrossbar_apbBridge_io_pipelinedMemoryBus_arbiter_io_output_cmd_payload_write;
  wire       [31:0]   apbCrossbar_apbBridge_io_pipelinedMemoryBus_arbiter_io_output_cmd_payload_address;
  wire       [31:0]   apbCrossbar_apbBridge_io_pipelinedMemoryBus_arbiter_io_output_cmd_payload_data;
  wire       [3:0]    apbCrossbar_apbBridge_io_pipelinedMemoryBus_arbiter_io_output_cmd_payload_mask;
  wire                asyncReset;
  wire                mainClock;
  wire                resetCtrl_bufferedReset;
  reg                 resetCtrl_mainClockReset;
  reg                 resetCtrl_systemClockReset;
  wire                core_timerInterrupt;
  reg                 core_externalInterrupt;
  wire                core_softwareInterrupt;
  wire                core_ibus_cmd_valid;
  wire                core_ibus_cmd_ready;
  wire                core_ibus_cmd_payload_write;
  wire       [31:0]   core_ibus_cmd_payload_address;
  wire       [31:0]   core_ibus_cmd_payload_data;
  wire       [3:0]    core_ibus_cmd_payload_mask;
  wire                core_ibus_rsp_valid;
  wire       [31:0]   core_ibus_rsp_payload_data;
  wire                core_dbus_cmd_valid;
  wire                core_dbus_cmd_ready;
  wire                core_dbus_cmd_payload_write;
  wire       [31:0]   core_dbus_cmd_payload_address;
  wire       [31:0]   core_dbus_cmd_payload_data;
  wire       [3:0]    core_dbus_cmd_payload_mask;
  wire                core_dbus_rsp_valid;
  wire       [31:0]   core_dbus_rsp_payload_data;
  wire                _zz_core_ibus_cmd_valid;
  wire                _zz_iBus_cmd_ready;
  wire       [31:0]   _zz_core_ibus_cmd_payload_address;
  reg                 _zz_1;
  reg                 _zz_core_ibus_cmd_valid_1;
  reg                 _zz_core_ibus_cmd_payload_write;
  reg        [31:0]   _zz_core_ibus_cmd_payload_address_1;
  reg        [31:0]   _zz_core_ibus_cmd_payload_data;
  reg        [3:0]    _zz_core_ibus_cmd_payload_mask;
  wire                _zz_core_ibus_cmd_valid_2;
  reg                 _zz_core_ibus_cmd_valid_3;
  reg                 _zz_core_ibus_cmd_payload_write_1;
  reg        [31:0]   _zz_core_ibus_cmd_payload_address_2;
  reg        [31:0]   _zz_core_ibus_cmd_payload_data_1;
  reg        [3:0]    _zz_core_ibus_cmd_payload_mask_1;
  wire                when_Stream_l342;
  wire                _zz_core_dbus_cmd_valid;
  wire                _zz_dBus_cmd_ready;
  wire                _zz_core_dbus_cmd_payload_write;
  wire       [31:0]   _zz_core_dbus_cmd_payload_address;
  wire       [31:0]   _zz_core_dbus_cmd_payload_data;
  wire       [3:0]    _zz_core_dbus_cmd_payload_mask;
  reg        [3:0]    _zz_core_dbus_cmd_payload_mask_1;
  reg                 _zz_2;
  reg                 _zz_core_dbus_cmd_valid_1;
  reg                 _zz_core_dbus_cmd_payload_write_1;
  reg        [31:0]   _zz_core_dbus_cmd_payload_address_1;
  reg        [31:0]   _zz_core_dbus_cmd_payload_data_1;
  reg        [3:0]    _zz_core_dbus_cmd_payload_mask_2;
  wire                _zz_core_dbus_cmd_valid_2;
  reg                 _zz_core_dbus_cmd_valid_3;
  reg                 _zz_core_dbus_cmd_payload_write_2;
  reg        [31:0]   _zz_core_dbus_cmd_payload_address_2;
  reg        [31:0]   _zz_core_dbus_cmd_payload_data_2;
  reg        [3:0]    _zz_core_dbus_cmd_payload_mask_3;
  wire                when_Stream_l342_1;
  reg                 core_cpu_debug_resetOut_regNext;
  wire                core_cpu_debug_bus_cmd_fire;
  reg                 core_cpu_debug_bus_cmd_fire_regNext;

  BufferCC_6 asyncReset_buffercc (
    .io_dataIn     (asyncReset                      ), //i
    .io_dataOut    (asyncReset_buffercc_io_dataOut  ), //o
    .mainClock     (mainClock                       )  //i
  );
  VexRiscv core_cpu (
    .iBus_cmd_valid                   (core_cpu_iBus_cmd_valid                         ), //o
    .iBus_cmd_ready                   (_zz_iBus_cmd_ready                              ), //i
    .iBus_cmd_payload_pc              (core_cpu_iBus_cmd_payload_pc[31:0]              ), //o
    .iBus_rsp_valid                   (core_ibus_rsp_valid                             ), //i
    .iBus_rsp_payload_error           (1'b0                                            ), //i
    .iBus_rsp_payload_inst            (core_ibus_rsp_payload_data[31:0]                ), //i
    .timerInterrupt                   (core_timerInterrupt                             ), //i
    .externalInterrupt                (core_externalInterrupt                          ), //i
    .softwareInterrupt                (core_softwareInterrupt                          ), //i
    .debug_bus_cmd_valid              (systemDebugger_1_io_mem_cmd_valid               ), //i
    .debug_bus_cmd_ready              (core_cpu_debug_bus_cmd_ready                    ), //o
    .debug_bus_cmd_payload_wr         (systemDebugger_1_io_mem_cmd_payload_wr          ), //i
    .debug_bus_cmd_payload_address    (core_cpu_debug_bus_cmd_payload_address[7:0]     ), //i
    .debug_bus_cmd_payload_data       (systemDebugger_1_io_mem_cmd_payload_data[31:0]  ), //i
    .debug_bus_rsp_data               (core_cpu_debug_bus_rsp_data[31:0]               ), //o
    .debug_resetOut                   (core_cpu_debug_resetOut                         ), //o
    .dBus_cmd_valid                   (core_cpu_dBus_cmd_valid                         ), //o
    .dBus_cmd_ready                   (_zz_dBus_cmd_ready                              ), //i
    .dBus_cmd_payload_wr              (core_cpu_dBus_cmd_payload_wr                    ), //o
    .dBus_cmd_payload_address         (core_cpu_dBus_cmd_payload_address[31:0]         ), //o
    .dBus_cmd_payload_data            (core_cpu_dBus_cmd_payload_data[31:0]            ), //o
    .dBus_cmd_payload_size            (core_cpu_dBus_cmd_payload_size[1:0]             ), //o
    .dBus_rsp_ready                   (core_dbus_rsp_valid                             ), //i
    .dBus_rsp_error                   (1'b0                                            ), //i
    .dBus_rsp_data                    (core_dbus_rsp_payload_data[31:0]                ), //i
    .mainClock                        (mainClock                                       ), //i
    .resetCtrl_systemClockReset       (resetCtrl_systemClockReset                      ), //i
    .resetCtrl_mainClockReset         (resetCtrl_mainClockReset                        )  //i
  );
  JtagBridge jtagBridge_1 (
    .io_jtag_tms                       (jtag_tms                                           ), //i
    .io_jtag_tdi                       (jtag_tdi                                           ), //i
    .io_jtag_tdo                       (jtagBridge_1_io_jtag_tdo                           ), //o
    .io_jtag_tck                       (jtag_tck                                           ), //i
    .io_remote_cmd_valid               (jtagBridge_1_io_remote_cmd_valid                   ), //o
    .io_remote_cmd_ready               (systemDebugger_1_io_remote_cmd_ready               ), //i
    .io_remote_cmd_payload_last        (jtagBridge_1_io_remote_cmd_payload_last            ), //o
    .io_remote_cmd_payload_fragment    (jtagBridge_1_io_remote_cmd_payload_fragment        ), //o
    .io_remote_rsp_valid               (systemDebugger_1_io_remote_rsp_valid               ), //i
    .io_remote_rsp_ready               (jtagBridge_1_io_remote_rsp_ready                   ), //o
    .io_remote_rsp_payload_error       (systemDebugger_1_io_remote_rsp_payload_error       ), //i
    .io_remote_rsp_payload_data        (systemDebugger_1_io_remote_rsp_payload_data[31:0]  ), //i
    .mainClock                         (mainClock                                          ), //i
    .resetCtrl_mainClockReset          (resetCtrl_mainClockReset                           )  //i
  );
  SystemDebugger systemDebugger_1 (
    .io_remote_cmd_valid               (jtagBridge_1_io_remote_cmd_valid                   ), //i
    .io_remote_cmd_ready               (systemDebugger_1_io_remote_cmd_ready               ), //o
    .io_remote_cmd_payload_last        (jtagBridge_1_io_remote_cmd_payload_last            ), //i
    .io_remote_cmd_payload_fragment    (jtagBridge_1_io_remote_cmd_payload_fragment        ), //i
    .io_remote_rsp_valid               (systemDebugger_1_io_remote_rsp_valid               ), //o
    .io_remote_rsp_ready               (jtagBridge_1_io_remote_rsp_ready                   ), //i
    .io_remote_rsp_payload_error       (systemDebugger_1_io_remote_rsp_payload_error       ), //o
    .io_remote_rsp_payload_data        (systemDebugger_1_io_remote_rsp_payload_data[31:0]  ), //o
    .io_mem_cmd_valid                  (systemDebugger_1_io_mem_cmd_valid                  ), //o
    .io_mem_cmd_ready                  (core_cpu_debug_bus_cmd_ready                       ), //i
    .io_mem_cmd_payload_address        (systemDebugger_1_io_mem_cmd_payload_address[31:0]  ), //o
    .io_mem_cmd_payload_data           (systemDebugger_1_io_mem_cmd_payload_data[31:0]     ), //o
    .io_mem_cmd_payload_wr             (systemDebugger_1_io_mem_cmd_payload_wr             ), //o
    .io_mem_cmd_payload_size           (systemDebugger_1_io_mem_cmd_payload_size[1:0]      ), //o
    .io_mem_rsp_valid                  (core_cpu_debug_bus_cmd_fire_regNext                ), //i
    .io_mem_rsp_payload                (core_cpu_debug_bus_rsp_data[31:0]                  ), //i
    .mainClock                         (mainClock                                          ), //i
    .resetCtrl_mainClockReset          (resetCtrl_mainClockReset                           )  //i
  );
  Apb3UartCtrl UARTPeripheral_uartCtrl (
    .io_apb_PADDR                  (UARTPeripheral_uartCtrl_io_apb_PADDR[4:0]    ), //i
    .io_apb_PSEL                   (apb3Router_1_io_outputs_0_PSEL               ), //i
    .io_apb_PENABLE                (apb3Router_1_io_outputs_0_PENABLE            ), //i
    .io_apb_PREADY                 (UARTPeripheral_uartCtrl_io_apb_PREADY        ), //o
    .io_apb_PWRITE                 (apb3Router_1_io_outputs_0_PWRITE             ), //i
    .io_apb_PWDATA                 (apb3Router_1_io_outputs_0_PWDATA[31:0]       ), //i
    .io_apb_PRDATA                 (UARTPeripheral_uartCtrl_io_apb_PRDATA[31:0]  ), //o
    .io_uart_txd                   (UARTPeripheral_uartCtrl_io_uart_txd          ), //o
    .io_uart_rxd                   (uart_rxd                                     ), //i
    .io_interrupt                  (UARTPeripheral_uartCtrl_io_interrupt         ), //o
    .mainClock                     (mainClock                                    ), //i
    .resetCtrl_systemClockReset    (resetCtrl_systemClockReset                   )  //i
  );
  Apb3AESMaskedAccelerator AESMaskedPeripheral_aesCtrl (
    .io_bus_PADDR                  (AESMaskedPeripheral_aesCtrl_io_bus_PADDR[15:0]   ), //i
    .io_bus_PSEL                   (apb3Router_1_io_outputs_1_PSEL                   ), //i
    .io_bus_PENABLE                (apb3Router_1_io_outputs_1_PENABLE                ), //i
    .io_bus_PREADY                 (AESMaskedPeripheral_aesCtrl_io_bus_PREADY        ), //o
    .io_bus_PWRITE                 (apb3Router_1_io_outputs_1_PWRITE                 ), //i
    .io_bus_PWDATA                 (apb3Router_1_io_outputs_1_PWDATA[31:0]           ), //i
    .io_bus_PRDATA                 (AESMaskedPeripheral_aesCtrl_io_bus_PRDATA[31:0]  ), //o
    .resetCtrl_systemClockReset    (resetCtrl_systemClockReset                       ), //i
    .mainClock                     (mainClock                                        )  //i
  );
  Apb3Gpio GPIOPeripheral_gpioCtrl (
    .io_apb_PADDR                  (GPIOPeripheral_gpioCtrl_io_apb_PADDR[3:0]          ), //i
    .io_apb_PSEL                   (apb3Router_1_io_outputs_2_PSEL                     ), //i
    .io_apb_PENABLE                (apb3Router_1_io_outputs_2_PENABLE                  ), //i
    .io_apb_PREADY                 (GPIOPeripheral_gpioCtrl_io_apb_PREADY              ), //o
    .io_apb_PWRITE                 (apb3Router_1_io_outputs_2_PWRITE                   ), //i
    .io_apb_PWDATA                 (apb3Router_1_io_outputs_2_PWDATA[31:0]             ), //i
    .io_apb_PRDATA                 (GPIOPeripheral_gpioCtrl_io_apb_PRDATA[31:0]        ), //o
    .io_apb_PSLVERROR              (GPIOPeripheral_gpioCtrl_io_apb_PSLVERROR           ), //o
    .io_gpio_read                  (gpio_read[31:0]                                    ), //i
    .io_gpio_write                 (GPIOPeripheral_gpioCtrl_io_gpio_write[31:0]        ), //o
    .io_gpio_writeEnable           (GPIOPeripheral_gpioCtrl_io_gpio_writeEnable[31:0]  ), //o
    .io_value                      (GPIOPeripheral_gpioCtrl_io_value[31:0]             ), //o
    .mainClock                     (mainClock                                          ), //i
    .resetCtrl_systemClockReset    (resetCtrl_systemClockReset                         )  //i
  );
  Apb3SpiSlaveCtrl SpiSlavePeripheral_spiCtrl (
    .io_apb_PADDR                  (SpiSlavePeripheral_spiCtrl_io_apb_PADDR[7:0]        ), //i
    .io_apb_PSEL                   (apb3Router_1_io_outputs_3_PSEL                      ), //i
    .io_apb_PENABLE                (apb3Router_1_io_outputs_3_PENABLE                   ), //i
    .io_apb_PREADY                 (SpiSlavePeripheral_spiCtrl_io_apb_PREADY            ), //o
    .io_apb_PWRITE                 (apb3Router_1_io_outputs_3_PWRITE                    ), //i
    .io_apb_PWDATA                 (apb3Router_1_io_outputs_3_PWDATA[31:0]              ), //i
    .io_apb_PRDATA                 (SpiSlavePeripheral_spiCtrl_io_apb_PRDATA[31:0]      ), //o
    .io_spi_sclk                   (spi_sclk                                            ), //i
    .io_spi_mosi                   (spi_mosi                                            ), //i
    .io_spi_miso_write             (SpiSlavePeripheral_spiCtrl_io_spi_miso_write        ), //o
    .io_spi_miso_writeEnable       (SpiSlavePeripheral_spiCtrl_io_spi_miso_writeEnable  ), //o
    .io_spi_ss                     (spi_ss                                              ), //i
    .io_interrupt                  (SpiSlavePeripheral_spiCtrl_io_interrupt             ), //o
    .mainClock                     (mainClock                                           ), //i
    .resetCtrl_systemClockReset    (resetCtrl_systemClockReset                          )  //i
  );
  PipelinedMemoryBusVEHEP pipelinedMemoryBusVEHEP_8 (
    .io_clk                        (clk                                                                           ), //i
    .io_bus_cmd_valid              (pipelinedMemoryBusVEHEP_8_io_bus_arbiter_io_output_cmd_valid                  ), //i
    .io_bus_cmd_ready              (pipelinedMemoryBusVEHEP_8_io_bus_cmd_ready                                    ), //o
    .io_bus_cmd_payload_write      (pipelinedMemoryBusVEHEP_8_io_bus_arbiter_io_output_cmd_payload_write          ), //i
    .io_bus_cmd_payload_address    (pipelinedMemoryBusVEHEP_8_io_bus_arbiter_io_output_cmd_payload_address[14:0]  ), //i
    .io_bus_cmd_payload_data       (pipelinedMemoryBusVEHEP_8_io_bus_arbiter_io_output_cmd_payload_data[31:0]     ), //i
    .io_bus_cmd_payload_mask       (pipelinedMemoryBusVEHEP_8_io_bus_arbiter_io_output_cmd_payload_mask[3:0]      ), //i
    .io_bus_rsp_valid              (pipelinedMemoryBusVEHEP_8_io_bus_rsp_valid                                    ), //o
    .io_bus_rsp_payload_data       (pipelinedMemoryBusVEHEP_8_io_bus_rsp_payload_data[31:0]                       ), //o
    .mainClock                     (mainClock                                                                     ), //i
    .resetCtrl_systemClockReset    (resetCtrl_systemClockReset                                                    )  //i
  );
  PipelinedMemoryBusVEHEP pipelinedMemoryBusVEHEP_9 (
    .io_clk                        (clk                                                                           ), //i
    .io_bus_cmd_valid              (pipelinedMemoryBusVEHEP_9_io_bus_arbiter_io_output_cmd_valid                  ), //i
    .io_bus_cmd_ready              (pipelinedMemoryBusVEHEP_9_io_bus_cmd_ready                                    ), //o
    .io_bus_cmd_payload_write      (pipelinedMemoryBusVEHEP_9_io_bus_arbiter_io_output_cmd_payload_write          ), //i
    .io_bus_cmd_payload_address    (pipelinedMemoryBusVEHEP_9_io_bus_arbiter_io_output_cmd_payload_address[14:0]  ), //i
    .io_bus_cmd_payload_data       (pipelinedMemoryBusVEHEP_9_io_bus_arbiter_io_output_cmd_payload_data[31:0]     ), //i
    .io_bus_cmd_payload_mask       (pipelinedMemoryBusVEHEP_9_io_bus_arbiter_io_output_cmd_payload_mask[3:0]      ), //i
    .io_bus_rsp_valid              (pipelinedMemoryBusVEHEP_9_io_bus_rsp_valid                                    ), //o
    .io_bus_rsp_payload_data       (pipelinedMemoryBusVEHEP_9_io_bus_rsp_payload_data[31:0]                       ), //o
    .mainClock                     (mainClock                                                                     ), //i
    .resetCtrl_systemClockReset    (resetCtrl_systemClockReset                                                    )  //i
  );
  PipelinedMemoryBusVEHEP pipelinedMemoryBusVEHEP_10 (
    .io_clk                        (clk                                                                            ), //i
    .io_bus_cmd_valid              (pipelinedMemoryBusVEHEP_10_io_bus_arbiter_io_output_cmd_valid                  ), //i
    .io_bus_cmd_ready              (pipelinedMemoryBusVEHEP_10_io_bus_cmd_ready                                    ), //o
    .io_bus_cmd_payload_write      (pipelinedMemoryBusVEHEP_10_io_bus_arbiter_io_output_cmd_payload_write          ), //i
    .io_bus_cmd_payload_address    (pipelinedMemoryBusVEHEP_10_io_bus_arbiter_io_output_cmd_payload_address[14:0]  ), //i
    .io_bus_cmd_payload_data       (pipelinedMemoryBusVEHEP_10_io_bus_arbiter_io_output_cmd_payload_data[31:0]     ), //i
    .io_bus_cmd_payload_mask       (pipelinedMemoryBusVEHEP_10_io_bus_arbiter_io_output_cmd_payload_mask[3:0]      ), //i
    .io_bus_rsp_valid              (pipelinedMemoryBusVEHEP_10_io_bus_rsp_valid                                    ), //o
    .io_bus_rsp_payload_data       (pipelinedMemoryBusVEHEP_10_io_bus_rsp_payload_data[31:0]                       ), //o
    .mainClock                     (mainClock                                                                      ), //i
    .resetCtrl_systemClockReset    (resetCtrl_systemClockReset                                                     )  //i
  );
  PipelinedMemoryBusVEHEP pipelinedMemoryBusVEHEP_11 (
    .io_clk                        (clk                                                                            ), //i
    .io_bus_cmd_valid              (pipelinedMemoryBusVEHEP_11_io_bus_arbiter_io_output_cmd_valid                  ), //i
    .io_bus_cmd_ready              (pipelinedMemoryBusVEHEP_11_io_bus_cmd_ready                                    ), //o
    .io_bus_cmd_payload_write      (pipelinedMemoryBusVEHEP_11_io_bus_arbiter_io_output_cmd_payload_write          ), //i
    .io_bus_cmd_payload_address    (pipelinedMemoryBusVEHEP_11_io_bus_arbiter_io_output_cmd_payload_address[14:0]  ), //i
    .io_bus_cmd_payload_data       (pipelinedMemoryBusVEHEP_11_io_bus_arbiter_io_output_cmd_payload_data[31:0]     ), //i
    .io_bus_cmd_payload_mask       (pipelinedMemoryBusVEHEP_11_io_bus_arbiter_io_output_cmd_payload_mask[3:0]      ), //i
    .io_bus_rsp_valid              (pipelinedMemoryBusVEHEP_11_io_bus_rsp_valid                                    ), //o
    .io_bus_rsp_payload_data       (pipelinedMemoryBusVEHEP_11_io_bus_rsp_payload_data[31:0]                       ), //o
    .mainClock                     (mainClock                                                                      ), //i
    .resetCtrl_systemClockReset    (resetCtrl_systemClockReset                                                     )  //i
  );
  PipelinedMemoryBusVEHEP pipelinedMemoryBusVEHEP_12 (
    .io_clk                        (clk                                                                            ), //i
    .io_bus_cmd_valid              (pipelinedMemoryBusVEHEP_12_io_bus_arbiter_io_output_cmd_valid                  ), //i
    .io_bus_cmd_ready              (pipelinedMemoryBusVEHEP_12_io_bus_cmd_ready                                    ), //o
    .io_bus_cmd_payload_write      (pipelinedMemoryBusVEHEP_12_io_bus_arbiter_io_output_cmd_payload_write          ), //i
    .io_bus_cmd_payload_address    (pipelinedMemoryBusVEHEP_12_io_bus_arbiter_io_output_cmd_payload_address[14:0]  ), //i
    .io_bus_cmd_payload_data       (pipelinedMemoryBusVEHEP_12_io_bus_arbiter_io_output_cmd_payload_data[31:0]     ), //i
    .io_bus_cmd_payload_mask       (pipelinedMemoryBusVEHEP_12_io_bus_arbiter_io_output_cmd_payload_mask[3:0]      ), //i
    .io_bus_rsp_valid              (pipelinedMemoryBusVEHEP_12_io_bus_rsp_valid                                    ), //o
    .io_bus_rsp_payload_data       (pipelinedMemoryBusVEHEP_12_io_bus_rsp_payload_data[31:0]                       ), //o
    .mainClock                     (mainClock                                                                      ), //i
    .resetCtrl_systemClockReset    (resetCtrl_systemClockReset                                                     )  //i
  );
  PipelinedMemoryBusVEHEP pipelinedMemoryBusVEHEP_13 (
    .io_clk                        (clk                                                                            ), //i
    .io_bus_cmd_valid              (pipelinedMemoryBusVEHEP_13_io_bus_arbiter_io_output_cmd_valid                  ), //i
    .io_bus_cmd_ready              (pipelinedMemoryBusVEHEP_13_io_bus_cmd_ready                                    ), //o
    .io_bus_cmd_payload_write      (pipelinedMemoryBusVEHEP_13_io_bus_arbiter_io_output_cmd_payload_write          ), //i
    .io_bus_cmd_payload_address    (pipelinedMemoryBusVEHEP_13_io_bus_arbiter_io_output_cmd_payload_address[14:0]  ), //i
    .io_bus_cmd_payload_data       (pipelinedMemoryBusVEHEP_13_io_bus_arbiter_io_output_cmd_payload_data[31:0]     ), //i
    .io_bus_cmd_payload_mask       (pipelinedMemoryBusVEHEP_13_io_bus_arbiter_io_output_cmd_payload_mask[3:0]      ), //i
    .io_bus_rsp_valid              (pipelinedMemoryBusVEHEP_13_io_bus_rsp_valid                                    ), //o
    .io_bus_rsp_payload_data       (pipelinedMemoryBusVEHEP_13_io_bus_rsp_payload_data[31:0]                       ), //o
    .mainClock                     (mainClock                                                                      ), //i
    .resetCtrl_systemClockReset    (resetCtrl_systemClockReset                                                     )  //i
  );
  PipelinedMemoryBusVEHEP pipelinedMemoryBusVEHEP_14 (
    .io_clk                        (clk                                                                            ), //i
    .io_bus_cmd_valid              (pipelinedMemoryBusVEHEP_14_io_bus_arbiter_io_output_cmd_valid                  ), //i
    .io_bus_cmd_ready              (pipelinedMemoryBusVEHEP_14_io_bus_cmd_ready                                    ), //o
    .io_bus_cmd_payload_write      (pipelinedMemoryBusVEHEP_14_io_bus_arbiter_io_output_cmd_payload_write          ), //i
    .io_bus_cmd_payload_address    (pipelinedMemoryBusVEHEP_14_io_bus_arbiter_io_output_cmd_payload_address[14:0]  ), //i
    .io_bus_cmd_payload_data       (pipelinedMemoryBusVEHEP_14_io_bus_arbiter_io_output_cmd_payload_data[31:0]     ), //i
    .io_bus_cmd_payload_mask       (pipelinedMemoryBusVEHEP_14_io_bus_arbiter_io_output_cmd_payload_mask[3:0]      ), //i
    .io_bus_rsp_valid              (pipelinedMemoryBusVEHEP_14_io_bus_rsp_valid                                    ), //o
    .io_bus_rsp_payload_data       (pipelinedMemoryBusVEHEP_14_io_bus_rsp_payload_data[31:0]                       ), //o
    .mainClock                     (mainClock                                                                      ), //i
    .resetCtrl_systemClockReset    (resetCtrl_systemClockReset                                                     )  //i
  );
  PipelinedMemoryBusVEHEP pipelinedMemoryBusVEHEP_15 (
    .io_clk                        (clk                                                                            ), //i
    .io_bus_cmd_valid              (pipelinedMemoryBusVEHEP_15_io_bus_arbiter_io_output_cmd_valid                  ), //i
    .io_bus_cmd_ready              (pipelinedMemoryBusVEHEP_15_io_bus_cmd_ready                                    ), //o
    .io_bus_cmd_payload_write      (pipelinedMemoryBusVEHEP_15_io_bus_arbiter_io_output_cmd_payload_write          ), //i
    .io_bus_cmd_payload_address    (pipelinedMemoryBusVEHEP_15_io_bus_arbiter_io_output_cmd_payload_address[14:0]  ), //i
    .io_bus_cmd_payload_data       (pipelinedMemoryBusVEHEP_15_io_bus_arbiter_io_output_cmd_payload_data[31:0]     ), //i
    .io_bus_cmd_payload_mask       (pipelinedMemoryBusVEHEP_15_io_bus_arbiter_io_output_cmd_payload_mask[3:0]      ), //i
    .io_bus_rsp_valid              (pipelinedMemoryBusVEHEP_15_io_bus_rsp_valid                                    ), //o
    .io_bus_rsp_payload_data       (pipelinedMemoryBusVEHEP_15_io_bus_rsp_payload_data[31:0]                       ), //o
    .mainClock                     (mainClock                                                                      ), //i
    .resetCtrl_systemClockReset    (resetCtrl_systemClockReset                                                     )  //i
  );
  PipelinedMemoryBusToApbBridge apbCrossbar_apbBridge (
    .io_pipelinedMemoryBus_cmd_valid              (apbCrossbar_apbBridge_io_pipelinedMemoryBus_arbiter_io_output_cmd_valid                  ), //i
    .io_pipelinedMemoryBus_cmd_ready              (apbCrossbar_apbBridge_io_pipelinedMemoryBus_cmd_ready                                    ), //o
    .io_pipelinedMemoryBus_cmd_payload_write      (apbCrossbar_apbBridge_io_pipelinedMemoryBus_arbiter_io_output_cmd_payload_write          ), //i
    .io_pipelinedMemoryBus_cmd_payload_address    (apbCrossbar_apbBridge_io_pipelinedMemoryBus_arbiter_io_output_cmd_payload_address[31:0]  ), //i
    .io_pipelinedMemoryBus_cmd_payload_data       (apbCrossbar_apbBridge_io_pipelinedMemoryBus_arbiter_io_output_cmd_payload_data[31:0]     ), //i
    .io_pipelinedMemoryBus_cmd_payload_mask       (apbCrossbar_apbBridge_io_pipelinedMemoryBus_arbiter_io_output_cmd_payload_mask[3:0]      ), //i
    .io_pipelinedMemoryBus_rsp_valid              (apbCrossbar_apbBridge_io_pipelinedMemoryBus_rsp_valid                                    ), //o
    .io_pipelinedMemoryBus_rsp_payload_data       (apbCrossbar_apbBridge_io_pipelinedMemoryBus_rsp_payload_data[31:0]                       ), //o
    .io_apb_PADDR                                 (apbCrossbar_apbBridge_io_apb_PADDR[19:0]                                                 ), //o
    .io_apb_PSEL                                  (apbCrossbar_apbBridge_io_apb_PSEL                                                        ), //o
    .io_apb_PENABLE                               (apbCrossbar_apbBridge_io_apb_PENABLE                                                     ), //o
    .io_apb_PREADY                                (io_apb_decoder_io_input_PREADY                                                           ), //i
    .io_apb_PWRITE                                (apbCrossbar_apbBridge_io_apb_PWRITE                                                      ), //o
    .io_apb_PWDATA                                (apbCrossbar_apbBridge_io_apb_PWDATA[31:0]                                                ), //o
    .io_apb_PRDATA                                (io_apb_decoder_io_input_PRDATA[31:0]                                                     ), //i
    .io_apb_PSLVERROR                             (io_apb_decoder_io_input_PSLVERROR                                                        ), //i
    .mainClock                                    (mainClock                                                                                ), //i
    .resetCtrl_systemClockReset                   (resetCtrl_systemClockReset                                                               )  //i
  );
  Apb3Decoder io_apb_decoder (
    .io_input_PADDR         (apbCrossbar_apbBridge_io_apb_PADDR[19:0]   ), //i
    .io_input_PSEL          (apbCrossbar_apbBridge_io_apb_PSEL          ), //i
    .io_input_PENABLE       (apbCrossbar_apbBridge_io_apb_PENABLE       ), //i
    .io_input_PREADY        (io_apb_decoder_io_input_PREADY             ), //o
    .io_input_PWRITE        (apbCrossbar_apbBridge_io_apb_PWRITE        ), //i
    .io_input_PWDATA        (apbCrossbar_apbBridge_io_apb_PWDATA[31:0]  ), //i
    .io_input_PRDATA        (io_apb_decoder_io_input_PRDATA[31:0]       ), //o
    .io_input_PSLVERROR     (io_apb_decoder_io_input_PSLVERROR          ), //o
    .io_output_PADDR        (io_apb_decoder_io_output_PADDR[19:0]       ), //o
    .io_output_PSEL         (io_apb_decoder_io_output_PSEL[3:0]         ), //o
    .io_output_PENABLE      (io_apb_decoder_io_output_PENABLE           ), //o
    .io_output_PREADY       (apb3Router_1_io_input_PREADY               ), //i
    .io_output_PWRITE       (io_apb_decoder_io_output_PWRITE            ), //o
    .io_output_PWDATA       (io_apb_decoder_io_output_PWDATA[31:0]      ), //o
    .io_output_PRDATA       (apb3Router_1_io_input_PRDATA[31:0]         ), //i
    .io_output_PSLVERROR    (apb3Router_1_io_input_PSLVERROR            )  //i
  );
  Apb3Router apb3Router_1 (
    .io_input_PADDR                (io_apb_decoder_io_output_PADDR[19:0]             ), //i
    .io_input_PSEL                 (io_apb_decoder_io_output_PSEL[3:0]               ), //i
    .io_input_PENABLE              (io_apb_decoder_io_output_PENABLE                 ), //i
    .io_input_PREADY               (apb3Router_1_io_input_PREADY                     ), //o
    .io_input_PWRITE               (io_apb_decoder_io_output_PWRITE                  ), //i
    .io_input_PWDATA               (io_apb_decoder_io_output_PWDATA[31:0]            ), //i
    .io_input_PRDATA               (apb3Router_1_io_input_PRDATA[31:0]               ), //o
    .io_input_PSLVERROR            (apb3Router_1_io_input_PSLVERROR                  ), //o
    .io_outputs_0_PADDR            (apb3Router_1_io_outputs_0_PADDR[19:0]            ), //o
    .io_outputs_0_PSEL             (apb3Router_1_io_outputs_0_PSEL                   ), //o
    .io_outputs_0_PENABLE          (apb3Router_1_io_outputs_0_PENABLE                ), //o
    .io_outputs_0_PREADY           (UARTPeripheral_uartCtrl_io_apb_PREADY            ), //i
    .io_outputs_0_PWRITE           (apb3Router_1_io_outputs_0_PWRITE                 ), //o
    .io_outputs_0_PWDATA           (apb3Router_1_io_outputs_0_PWDATA[31:0]           ), //o
    .io_outputs_0_PRDATA           (UARTPeripheral_uartCtrl_io_apb_PRDATA[31:0]      ), //i
    .io_outputs_0_PSLVERROR        (1'b0                                             ), //i
    .io_outputs_1_PADDR            (apb3Router_1_io_outputs_1_PADDR[19:0]            ), //o
    .io_outputs_1_PSEL             (apb3Router_1_io_outputs_1_PSEL                   ), //o
    .io_outputs_1_PENABLE          (apb3Router_1_io_outputs_1_PENABLE                ), //o
    .io_outputs_1_PREADY           (AESMaskedPeripheral_aesCtrl_io_bus_PREADY        ), //i
    .io_outputs_1_PWRITE           (apb3Router_1_io_outputs_1_PWRITE                 ), //o
    .io_outputs_1_PWDATA           (apb3Router_1_io_outputs_1_PWDATA[31:0]           ), //o
    .io_outputs_1_PRDATA           (AESMaskedPeripheral_aesCtrl_io_bus_PRDATA[31:0]  ), //i
    .io_outputs_1_PSLVERROR        (1'b0                                             ), //i
    .io_outputs_2_PADDR            (apb3Router_1_io_outputs_2_PADDR[19:0]            ), //o
    .io_outputs_2_PSEL             (apb3Router_1_io_outputs_2_PSEL                   ), //o
    .io_outputs_2_PENABLE          (apb3Router_1_io_outputs_2_PENABLE                ), //o
    .io_outputs_2_PREADY           (GPIOPeripheral_gpioCtrl_io_apb_PREADY            ), //i
    .io_outputs_2_PWRITE           (apb3Router_1_io_outputs_2_PWRITE                 ), //o
    .io_outputs_2_PWDATA           (apb3Router_1_io_outputs_2_PWDATA[31:0]           ), //o
    .io_outputs_2_PRDATA           (GPIOPeripheral_gpioCtrl_io_apb_PRDATA[31:0]      ), //i
    .io_outputs_2_PSLVERROR        (GPIOPeripheral_gpioCtrl_io_apb_PSLVERROR         ), //i
    .io_outputs_3_PADDR            (apb3Router_1_io_outputs_3_PADDR[19:0]            ), //o
    .io_outputs_3_PSEL             (apb3Router_1_io_outputs_3_PSEL                   ), //o
    .io_outputs_3_PENABLE          (apb3Router_1_io_outputs_3_PENABLE                ), //o
    .io_outputs_3_PREADY           (SpiSlavePeripheral_spiCtrl_io_apb_PREADY         ), //i
    .io_outputs_3_PWRITE           (apb3Router_1_io_outputs_3_PWRITE                 ), //o
    .io_outputs_3_PWDATA           (apb3Router_1_io_outputs_3_PWDATA[31:0]           ), //o
    .io_outputs_3_PRDATA           (SpiSlavePeripheral_spiCtrl_io_apb_PRDATA[31:0]   ), //i
    .io_outputs_3_PSLVERROR        (1'b0                                             ), //i
    .mainClock                     (mainClock                                        ), //i
    .resetCtrl_systemClockReset    (resetCtrl_systemClockReset                       )  //i
  );
  PipelinedMemoryBusDecoder core_dbus_decoder (
    .io_input_cmd_valid                  (core_dbus_cmd_valid                                                                     ), //i
    .io_input_cmd_ready                  (core_dbus_decoder_io_input_cmd_ready                                                    ), //o
    .io_input_cmd_payload_write          (core_dbus_cmd_payload_write                                                             ), //i
    .io_input_cmd_payload_address        (core_dbus_cmd_payload_address[31:0]                                                     ), //i
    .io_input_cmd_payload_data           (core_dbus_cmd_payload_data[31:0]                                                        ), //i
    .io_input_cmd_payload_mask           (core_dbus_cmd_payload_mask[3:0]                                                         ), //i
    .io_input_rsp_valid                  (core_dbus_decoder_io_input_rsp_valid                                                    ), //o
    .io_input_rsp_payload_data           (core_dbus_decoder_io_input_rsp_payload_data[31:0]                                       ), //o
    .io_outputs_0_cmd_valid              (core_dbus_decoder_io_outputs_0_cmd_valid                                                ), //o
    .io_outputs_0_cmd_ready              (pipelinedMemoryBusVEHEP_8_io_bus_arbiter_io_inputs_0_cmd_ready                          ), //i
    .io_outputs_0_cmd_payload_write      (core_dbus_decoder_io_outputs_0_cmd_payload_write                                        ), //o
    .io_outputs_0_cmd_payload_address    (core_dbus_decoder_io_outputs_0_cmd_payload_address[31:0]                                ), //o
    .io_outputs_0_cmd_payload_data       (core_dbus_decoder_io_outputs_0_cmd_payload_data[31:0]                                   ), //o
    .io_outputs_0_cmd_payload_mask       (core_dbus_decoder_io_outputs_0_cmd_payload_mask[3:0]                                    ), //o
    .io_outputs_0_rsp_valid              (pipelinedMemoryBusVEHEP_8_io_bus_arbiter_io_inputs_0_rsp_valid                          ), //i
    .io_outputs_0_rsp_payload_data       (pipelinedMemoryBusVEHEP_8_io_bus_arbiter_io_inputs_0_rsp_payload_data[31:0]             ), //i
    .io_outputs_1_cmd_valid              (core_dbus_decoder_io_outputs_1_cmd_valid                                                ), //o
    .io_outputs_1_cmd_ready              (pipelinedMemoryBusVEHEP_9_io_bus_arbiter_io_inputs_0_cmd_ready                          ), //i
    .io_outputs_1_cmd_payload_write      (core_dbus_decoder_io_outputs_1_cmd_payload_write                                        ), //o
    .io_outputs_1_cmd_payload_address    (core_dbus_decoder_io_outputs_1_cmd_payload_address[31:0]                                ), //o
    .io_outputs_1_cmd_payload_data       (core_dbus_decoder_io_outputs_1_cmd_payload_data[31:0]                                   ), //o
    .io_outputs_1_cmd_payload_mask       (core_dbus_decoder_io_outputs_1_cmd_payload_mask[3:0]                                    ), //o
    .io_outputs_1_rsp_valid              (pipelinedMemoryBusVEHEP_9_io_bus_arbiter_io_inputs_0_rsp_valid                          ), //i
    .io_outputs_1_rsp_payload_data       (pipelinedMemoryBusVEHEP_9_io_bus_arbiter_io_inputs_0_rsp_payload_data[31:0]             ), //i
    .io_outputs_2_cmd_valid              (core_dbus_decoder_io_outputs_2_cmd_valid                                                ), //o
    .io_outputs_2_cmd_ready              (pipelinedMemoryBusVEHEP_10_io_bus_arbiter_io_inputs_0_cmd_ready                         ), //i
    .io_outputs_2_cmd_payload_write      (core_dbus_decoder_io_outputs_2_cmd_payload_write                                        ), //o
    .io_outputs_2_cmd_payload_address    (core_dbus_decoder_io_outputs_2_cmd_payload_address[31:0]                                ), //o
    .io_outputs_2_cmd_payload_data       (core_dbus_decoder_io_outputs_2_cmd_payload_data[31:0]                                   ), //o
    .io_outputs_2_cmd_payload_mask       (core_dbus_decoder_io_outputs_2_cmd_payload_mask[3:0]                                    ), //o
    .io_outputs_2_rsp_valid              (pipelinedMemoryBusVEHEP_10_io_bus_arbiter_io_inputs_0_rsp_valid                         ), //i
    .io_outputs_2_rsp_payload_data       (pipelinedMemoryBusVEHEP_10_io_bus_arbiter_io_inputs_0_rsp_payload_data[31:0]            ), //i
    .io_outputs_3_cmd_valid              (core_dbus_decoder_io_outputs_3_cmd_valid                                                ), //o
    .io_outputs_3_cmd_ready              (pipelinedMemoryBusVEHEP_11_io_bus_arbiter_io_inputs_0_cmd_ready                         ), //i
    .io_outputs_3_cmd_payload_write      (core_dbus_decoder_io_outputs_3_cmd_payload_write                                        ), //o
    .io_outputs_3_cmd_payload_address    (core_dbus_decoder_io_outputs_3_cmd_payload_address[31:0]                                ), //o
    .io_outputs_3_cmd_payload_data       (core_dbus_decoder_io_outputs_3_cmd_payload_data[31:0]                                   ), //o
    .io_outputs_3_cmd_payload_mask       (core_dbus_decoder_io_outputs_3_cmd_payload_mask[3:0]                                    ), //o
    .io_outputs_3_rsp_valid              (pipelinedMemoryBusVEHEP_11_io_bus_arbiter_io_inputs_0_rsp_valid                         ), //i
    .io_outputs_3_rsp_payload_data       (pipelinedMemoryBusVEHEP_11_io_bus_arbiter_io_inputs_0_rsp_payload_data[31:0]            ), //i
    .io_outputs_4_cmd_valid              (core_dbus_decoder_io_outputs_4_cmd_valid                                                ), //o
    .io_outputs_4_cmd_ready              (pipelinedMemoryBusVEHEP_12_io_bus_arbiter_io_inputs_0_cmd_ready                         ), //i
    .io_outputs_4_cmd_payload_write      (core_dbus_decoder_io_outputs_4_cmd_payload_write                                        ), //o
    .io_outputs_4_cmd_payload_address    (core_dbus_decoder_io_outputs_4_cmd_payload_address[31:0]                                ), //o
    .io_outputs_4_cmd_payload_data       (core_dbus_decoder_io_outputs_4_cmd_payload_data[31:0]                                   ), //o
    .io_outputs_4_cmd_payload_mask       (core_dbus_decoder_io_outputs_4_cmd_payload_mask[3:0]                                    ), //o
    .io_outputs_4_rsp_valid              (pipelinedMemoryBusVEHEP_12_io_bus_arbiter_io_inputs_0_rsp_valid                         ), //i
    .io_outputs_4_rsp_payload_data       (pipelinedMemoryBusVEHEP_12_io_bus_arbiter_io_inputs_0_rsp_payload_data[31:0]            ), //i
    .io_outputs_5_cmd_valid              (core_dbus_decoder_io_outputs_5_cmd_valid                                                ), //o
    .io_outputs_5_cmd_ready              (pipelinedMemoryBusVEHEP_13_io_bus_arbiter_io_inputs_0_cmd_ready                         ), //i
    .io_outputs_5_cmd_payload_write      (core_dbus_decoder_io_outputs_5_cmd_payload_write                                        ), //o
    .io_outputs_5_cmd_payload_address    (core_dbus_decoder_io_outputs_5_cmd_payload_address[31:0]                                ), //o
    .io_outputs_5_cmd_payload_data       (core_dbus_decoder_io_outputs_5_cmd_payload_data[31:0]                                   ), //o
    .io_outputs_5_cmd_payload_mask       (core_dbus_decoder_io_outputs_5_cmd_payload_mask[3:0]                                    ), //o
    .io_outputs_5_rsp_valid              (pipelinedMemoryBusVEHEP_13_io_bus_arbiter_io_inputs_0_rsp_valid                         ), //i
    .io_outputs_5_rsp_payload_data       (pipelinedMemoryBusVEHEP_13_io_bus_arbiter_io_inputs_0_rsp_payload_data[31:0]            ), //i
    .io_outputs_6_cmd_valid              (core_dbus_decoder_io_outputs_6_cmd_valid                                                ), //o
    .io_outputs_6_cmd_ready              (pipelinedMemoryBusVEHEP_14_io_bus_arbiter_io_inputs_0_cmd_ready                         ), //i
    .io_outputs_6_cmd_payload_write      (core_dbus_decoder_io_outputs_6_cmd_payload_write                                        ), //o
    .io_outputs_6_cmd_payload_address    (core_dbus_decoder_io_outputs_6_cmd_payload_address[31:0]                                ), //o
    .io_outputs_6_cmd_payload_data       (core_dbus_decoder_io_outputs_6_cmd_payload_data[31:0]                                   ), //o
    .io_outputs_6_cmd_payload_mask       (core_dbus_decoder_io_outputs_6_cmd_payload_mask[3:0]                                    ), //o
    .io_outputs_6_rsp_valid              (pipelinedMemoryBusVEHEP_14_io_bus_arbiter_io_inputs_0_rsp_valid                         ), //i
    .io_outputs_6_rsp_payload_data       (pipelinedMemoryBusVEHEP_14_io_bus_arbiter_io_inputs_0_rsp_payload_data[31:0]            ), //i
    .io_outputs_7_cmd_valid              (core_dbus_decoder_io_outputs_7_cmd_valid                                                ), //o
    .io_outputs_7_cmd_ready              (pipelinedMemoryBusVEHEP_15_io_bus_arbiter_io_inputs_0_cmd_ready                         ), //i
    .io_outputs_7_cmd_payload_write      (core_dbus_decoder_io_outputs_7_cmd_payload_write                                        ), //o
    .io_outputs_7_cmd_payload_address    (core_dbus_decoder_io_outputs_7_cmd_payload_address[31:0]                                ), //o
    .io_outputs_7_cmd_payload_data       (core_dbus_decoder_io_outputs_7_cmd_payload_data[31:0]                                   ), //o
    .io_outputs_7_cmd_payload_mask       (core_dbus_decoder_io_outputs_7_cmd_payload_mask[3:0]                                    ), //o
    .io_outputs_7_rsp_valid              (pipelinedMemoryBusVEHEP_15_io_bus_arbiter_io_inputs_0_rsp_valid                         ), //i
    .io_outputs_7_rsp_payload_data       (pipelinedMemoryBusVEHEP_15_io_bus_arbiter_io_inputs_0_rsp_payload_data[31:0]            ), //i
    .io_outputs_8_cmd_valid              (core_dbus_decoder_io_outputs_8_cmd_valid                                                ), //o
    .io_outputs_8_cmd_ready              (apbCrossbar_apbBridge_io_pipelinedMemoryBus_arbiter_io_inputs_0_cmd_ready               ), //i
    .io_outputs_8_cmd_payload_write      (core_dbus_decoder_io_outputs_8_cmd_payload_write                                        ), //o
    .io_outputs_8_cmd_payload_address    (core_dbus_decoder_io_outputs_8_cmd_payload_address[31:0]                                ), //o
    .io_outputs_8_cmd_payload_data       (core_dbus_decoder_io_outputs_8_cmd_payload_data[31:0]                                   ), //o
    .io_outputs_8_cmd_payload_mask       (core_dbus_decoder_io_outputs_8_cmd_payload_mask[3:0]                                    ), //o
    .io_outputs_8_rsp_valid              (apbCrossbar_apbBridge_io_pipelinedMemoryBus_arbiter_io_inputs_0_rsp_valid               ), //i
    .io_outputs_8_rsp_payload_data       (apbCrossbar_apbBridge_io_pipelinedMemoryBus_arbiter_io_inputs_0_rsp_payload_data[31:0]  ), //i
    .mainClock                           (mainClock                                                                               ), //i
    .resetCtrl_systemClockReset          (resetCtrl_systemClockReset                                                              )  //i
  );
  PipelinedMemoryBusDecoder_1 core_ibus_decoder (
    .io_input_cmd_valid                  (core_ibus_cmd_valid                                                           ), //i
    .io_input_cmd_ready                  (core_ibus_decoder_io_input_cmd_ready                                          ), //o
    .io_input_cmd_payload_write          (core_ibus_cmd_payload_write                                                   ), //i
    .io_input_cmd_payload_address        (core_ibus_cmd_payload_address[31:0]                                           ), //i
    .io_input_cmd_payload_data           (core_ibus_cmd_payload_data[31:0]                                              ), //i
    .io_input_cmd_payload_mask           (core_ibus_cmd_payload_mask[3:0]                                               ), //i
    .io_input_rsp_valid                  (core_ibus_decoder_io_input_rsp_valid                                          ), //o
    .io_input_rsp_payload_data           (core_ibus_decoder_io_input_rsp_payload_data[31:0]                             ), //o
    .io_outputs_0_cmd_valid              (core_ibus_decoder_io_outputs_0_cmd_valid                                      ), //o
    .io_outputs_0_cmd_ready              (pipelinedMemoryBusVEHEP_8_io_bus_arbiter_io_inputs_1_cmd_ready                ), //i
    .io_outputs_0_cmd_payload_write      (core_ibus_decoder_io_outputs_0_cmd_payload_write                              ), //o
    .io_outputs_0_cmd_payload_address    (core_ibus_decoder_io_outputs_0_cmd_payload_address[31:0]                      ), //o
    .io_outputs_0_cmd_payload_data       (core_ibus_decoder_io_outputs_0_cmd_payload_data[31:0]                         ), //o
    .io_outputs_0_cmd_payload_mask       (core_ibus_decoder_io_outputs_0_cmd_payload_mask[3:0]                          ), //o
    .io_outputs_0_rsp_valid              (pipelinedMemoryBusVEHEP_8_io_bus_arbiter_io_inputs_1_rsp_valid                ), //i
    .io_outputs_0_rsp_payload_data       (pipelinedMemoryBusVEHEP_8_io_bus_arbiter_io_inputs_1_rsp_payload_data[31:0]   ), //i
    .io_outputs_1_cmd_valid              (core_ibus_decoder_io_outputs_1_cmd_valid                                      ), //o
    .io_outputs_1_cmd_ready              (pipelinedMemoryBusVEHEP_9_io_bus_arbiter_io_inputs_1_cmd_ready                ), //i
    .io_outputs_1_cmd_payload_write      (core_ibus_decoder_io_outputs_1_cmd_payload_write                              ), //o
    .io_outputs_1_cmd_payload_address    (core_ibus_decoder_io_outputs_1_cmd_payload_address[31:0]                      ), //o
    .io_outputs_1_cmd_payload_data       (core_ibus_decoder_io_outputs_1_cmd_payload_data[31:0]                         ), //o
    .io_outputs_1_cmd_payload_mask       (core_ibus_decoder_io_outputs_1_cmd_payload_mask[3:0]                          ), //o
    .io_outputs_1_rsp_valid              (pipelinedMemoryBusVEHEP_9_io_bus_arbiter_io_inputs_1_rsp_valid                ), //i
    .io_outputs_1_rsp_payload_data       (pipelinedMemoryBusVEHEP_9_io_bus_arbiter_io_inputs_1_rsp_payload_data[31:0]   ), //i
    .io_outputs_2_cmd_valid              (core_ibus_decoder_io_outputs_2_cmd_valid                                      ), //o
    .io_outputs_2_cmd_ready              (pipelinedMemoryBusVEHEP_10_io_bus_arbiter_io_inputs_1_cmd_ready               ), //i
    .io_outputs_2_cmd_payload_write      (core_ibus_decoder_io_outputs_2_cmd_payload_write                              ), //o
    .io_outputs_2_cmd_payload_address    (core_ibus_decoder_io_outputs_2_cmd_payload_address[31:0]                      ), //o
    .io_outputs_2_cmd_payload_data       (core_ibus_decoder_io_outputs_2_cmd_payload_data[31:0]                         ), //o
    .io_outputs_2_cmd_payload_mask       (core_ibus_decoder_io_outputs_2_cmd_payload_mask[3:0]                          ), //o
    .io_outputs_2_rsp_valid              (pipelinedMemoryBusVEHEP_10_io_bus_arbiter_io_inputs_1_rsp_valid               ), //i
    .io_outputs_2_rsp_payload_data       (pipelinedMemoryBusVEHEP_10_io_bus_arbiter_io_inputs_1_rsp_payload_data[31:0]  ), //i
    .io_outputs_3_cmd_valid              (core_ibus_decoder_io_outputs_3_cmd_valid                                      ), //o
    .io_outputs_3_cmd_ready              (pipelinedMemoryBusVEHEP_11_io_bus_arbiter_io_inputs_1_cmd_ready               ), //i
    .io_outputs_3_cmd_payload_write      (core_ibus_decoder_io_outputs_3_cmd_payload_write                              ), //o
    .io_outputs_3_cmd_payload_address    (core_ibus_decoder_io_outputs_3_cmd_payload_address[31:0]                      ), //o
    .io_outputs_3_cmd_payload_data       (core_ibus_decoder_io_outputs_3_cmd_payload_data[31:0]                         ), //o
    .io_outputs_3_cmd_payload_mask       (core_ibus_decoder_io_outputs_3_cmd_payload_mask[3:0]                          ), //o
    .io_outputs_3_rsp_valid              (pipelinedMemoryBusVEHEP_11_io_bus_arbiter_io_inputs_1_rsp_valid               ), //i
    .io_outputs_3_rsp_payload_data       (pipelinedMemoryBusVEHEP_11_io_bus_arbiter_io_inputs_1_rsp_payload_data[31:0]  ), //i
    .io_outputs_4_cmd_valid              (core_ibus_decoder_io_outputs_4_cmd_valid                                      ), //o
    .io_outputs_4_cmd_ready              (pipelinedMemoryBusVEHEP_12_io_bus_arbiter_io_inputs_1_cmd_ready               ), //i
    .io_outputs_4_cmd_payload_write      (core_ibus_decoder_io_outputs_4_cmd_payload_write                              ), //o
    .io_outputs_4_cmd_payload_address    (core_ibus_decoder_io_outputs_4_cmd_payload_address[31:0]                      ), //o
    .io_outputs_4_cmd_payload_data       (core_ibus_decoder_io_outputs_4_cmd_payload_data[31:0]                         ), //o
    .io_outputs_4_cmd_payload_mask       (core_ibus_decoder_io_outputs_4_cmd_payload_mask[3:0]                          ), //o
    .io_outputs_4_rsp_valid              (pipelinedMemoryBusVEHEP_12_io_bus_arbiter_io_inputs_1_rsp_valid               ), //i
    .io_outputs_4_rsp_payload_data       (pipelinedMemoryBusVEHEP_12_io_bus_arbiter_io_inputs_1_rsp_payload_data[31:0]  ), //i
    .io_outputs_5_cmd_valid              (core_ibus_decoder_io_outputs_5_cmd_valid                                      ), //o
    .io_outputs_5_cmd_ready              (pipelinedMemoryBusVEHEP_13_io_bus_arbiter_io_inputs_1_cmd_ready               ), //i
    .io_outputs_5_cmd_payload_write      (core_ibus_decoder_io_outputs_5_cmd_payload_write                              ), //o
    .io_outputs_5_cmd_payload_address    (core_ibus_decoder_io_outputs_5_cmd_payload_address[31:0]                      ), //o
    .io_outputs_5_cmd_payload_data       (core_ibus_decoder_io_outputs_5_cmd_payload_data[31:0]                         ), //o
    .io_outputs_5_cmd_payload_mask       (core_ibus_decoder_io_outputs_5_cmd_payload_mask[3:0]                          ), //o
    .io_outputs_5_rsp_valid              (pipelinedMemoryBusVEHEP_13_io_bus_arbiter_io_inputs_1_rsp_valid               ), //i
    .io_outputs_5_rsp_payload_data       (pipelinedMemoryBusVEHEP_13_io_bus_arbiter_io_inputs_1_rsp_payload_data[31:0]  ), //i
    .io_outputs_6_cmd_valid              (core_ibus_decoder_io_outputs_6_cmd_valid                                      ), //o
    .io_outputs_6_cmd_ready              (pipelinedMemoryBusVEHEP_14_io_bus_arbiter_io_inputs_1_cmd_ready               ), //i
    .io_outputs_6_cmd_payload_write      (core_ibus_decoder_io_outputs_6_cmd_payload_write                              ), //o
    .io_outputs_6_cmd_payload_address    (core_ibus_decoder_io_outputs_6_cmd_payload_address[31:0]                      ), //o
    .io_outputs_6_cmd_payload_data       (core_ibus_decoder_io_outputs_6_cmd_payload_data[31:0]                         ), //o
    .io_outputs_6_cmd_payload_mask       (core_ibus_decoder_io_outputs_6_cmd_payload_mask[3:0]                          ), //o
    .io_outputs_6_rsp_valid              (pipelinedMemoryBusVEHEP_14_io_bus_arbiter_io_inputs_1_rsp_valid               ), //i
    .io_outputs_6_rsp_payload_data       (pipelinedMemoryBusVEHEP_14_io_bus_arbiter_io_inputs_1_rsp_payload_data[31:0]  ), //i
    .io_outputs_7_cmd_valid              (core_ibus_decoder_io_outputs_7_cmd_valid                                      ), //o
    .io_outputs_7_cmd_ready              (pipelinedMemoryBusVEHEP_15_io_bus_arbiter_io_inputs_1_cmd_ready               ), //i
    .io_outputs_7_cmd_payload_write      (core_ibus_decoder_io_outputs_7_cmd_payload_write                              ), //o
    .io_outputs_7_cmd_payload_address    (core_ibus_decoder_io_outputs_7_cmd_payload_address[31:0]                      ), //o
    .io_outputs_7_cmd_payload_data       (core_ibus_decoder_io_outputs_7_cmd_payload_data[31:0]                         ), //o
    .io_outputs_7_cmd_payload_mask       (core_ibus_decoder_io_outputs_7_cmd_payload_mask[3:0]                          ), //o
    .io_outputs_7_rsp_valid              (pipelinedMemoryBusVEHEP_15_io_bus_arbiter_io_inputs_1_rsp_valid               ), //i
    .io_outputs_7_rsp_payload_data       (pipelinedMemoryBusVEHEP_15_io_bus_arbiter_io_inputs_1_rsp_payload_data[31:0]  ), //i
    .mainClock                           (mainClock                                                                     ), //i
    .resetCtrl_systemClockReset          (resetCtrl_systemClockReset                                                    )  //i
  );
  PipelinedMemoryBusArbiter pipelinedMemoryBusVEHEP_8_io_bus_arbiter (
    .io_inputs_0_cmd_valid              (core_dbus_decoder_io_outputs_0_cmd_valid                                        ), //i
    .io_inputs_0_cmd_ready              (pipelinedMemoryBusVEHEP_8_io_bus_arbiter_io_inputs_0_cmd_ready                  ), //o
    .io_inputs_0_cmd_payload_write      (core_dbus_decoder_io_outputs_0_cmd_payload_write                                ), //i
    .io_inputs_0_cmd_payload_address    (pipelinedMemoryBusVEHEP_8_io_bus_arbiter_io_inputs_0_cmd_payload_address[14:0]  ), //i
    .io_inputs_0_cmd_payload_data       (core_dbus_decoder_io_outputs_0_cmd_payload_data[31:0]                           ), //i
    .io_inputs_0_cmd_payload_mask       (core_dbus_decoder_io_outputs_0_cmd_payload_mask[3:0]                            ), //i
    .io_inputs_0_rsp_valid              (pipelinedMemoryBusVEHEP_8_io_bus_arbiter_io_inputs_0_rsp_valid                  ), //o
    .io_inputs_0_rsp_payload_data       (pipelinedMemoryBusVEHEP_8_io_bus_arbiter_io_inputs_0_rsp_payload_data[31:0]     ), //o
    .io_inputs_1_cmd_valid              (core_ibus_decoder_io_outputs_0_cmd_valid                                        ), //i
    .io_inputs_1_cmd_ready              (pipelinedMemoryBusVEHEP_8_io_bus_arbiter_io_inputs_1_cmd_ready                  ), //o
    .io_inputs_1_cmd_payload_write      (core_ibus_decoder_io_outputs_0_cmd_payload_write                                ), //i
    .io_inputs_1_cmd_payload_address    (pipelinedMemoryBusVEHEP_8_io_bus_arbiter_io_inputs_1_cmd_payload_address[14:0]  ), //i
    .io_inputs_1_cmd_payload_data       (core_ibus_decoder_io_outputs_0_cmd_payload_data[31:0]                           ), //i
    .io_inputs_1_cmd_payload_mask       (core_ibus_decoder_io_outputs_0_cmd_payload_mask[3:0]                            ), //i
    .io_inputs_1_rsp_valid              (pipelinedMemoryBusVEHEP_8_io_bus_arbiter_io_inputs_1_rsp_valid                  ), //o
    .io_inputs_1_rsp_payload_data       (pipelinedMemoryBusVEHEP_8_io_bus_arbiter_io_inputs_1_rsp_payload_data[31:0]     ), //o
    .io_output_cmd_valid                (pipelinedMemoryBusVEHEP_8_io_bus_arbiter_io_output_cmd_valid                    ), //o
    .io_output_cmd_ready                (pipelinedMemoryBusVEHEP_8_io_bus_cmd_ready                                      ), //i
    .io_output_cmd_payload_write        (pipelinedMemoryBusVEHEP_8_io_bus_arbiter_io_output_cmd_payload_write            ), //o
    .io_output_cmd_payload_address      (pipelinedMemoryBusVEHEP_8_io_bus_arbiter_io_output_cmd_payload_address[14:0]    ), //o
    .io_output_cmd_payload_data         (pipelinedMemoryBusVEHEP_8_io_bus_arbiter_io_output_cmd_payload_data[31:0]       ), //o
    .io_output_cmd_payload_mask         (pipelinedMemoryBusVEHEP_8_io_bus_arbiter_io_output_cmd_payload_mask[3:0]        ), //o
    .io_output_rsp_valid                (pipelinedMemoryBusVEHEP_8_io_bus_rsp_valid                                      ), //i
    .io_output_rsp_payload_data         (pipelinedMemoryBusVEHEP_8_io_bus_rsp_payload_data[31:0]                         ), //i
    .mainClock                          (mainClock                                                                       ), //i
    .resetCtrl_systemClockReset         (resetCtrl_systemClockReset                                                      )  //i
  );
  PipelinedMemoryBusArbiter pipelinedMemoryBusVEHEP_9_io_bus_arbiter (
    .io_inputs_0_cmd_valid              (core_dbus_decoder_io_outputs_1_cmd_valid                                        ), //i
    .io_inputs_0_cmd_ready              (pipelinedMemoryBusVEHEP_9_io_bus_arbiter_io_inputs_0_cmd_ready                  ), //o
    .io_inputs_0_cmd_payload_write      (core_dbus_decoder_io_outputs_1_cmd_payload_write                                ), //i
    .io_inputs_0_cmd_payload_address    (pipelinedMemoryBusVEHEP_9_io_bus_arbiter_io_inputs_0_cmd_payload_address[14:0]  ), //i
    .io_inputs_0_cmd_payload_data       (core_dbus_decoder_io_outputs_1_cmd_payload_data[31:0]                           ), //i
    .io_inputs_0_cmd_payload_mask       (core_dbus_decoder_io_outputs_1_cmd_payload_mask[3:0]                            ), //i
    .io_inputs_0_rsp_valid              (pipelinedMemoryBusVEHEP_9_io_bus_arbiter_io_inputs_0_rsp_valid                  ), //o
    .io_inputs_0_rsp_payload_data       (pipelinedMemoryBusVEHEP_9_io_bus_arbiter_io_inputs_0_rsp_payload_data[31:0]     ), //o
    .io_inputs_1_cmd_valid              (core_ibus_decoder_io_outputs_1_cmd_valid                                        ), //i
    .io_inputs_1_cmd_ready              (pipelinedMemoryBusVEHEP_9_io_bus_arbiter_io_inputs_1_cmd_ready                  ), //o
    .io_inputs_1_cmd_payload_write      (core_ibus_decoder_io_outputs_1_cmd_payload_write                                ), //i
    .io_inputs_1_cmd_payload_address    (pipelinedMemoryBusVEHEP_9_io_bus_arbiter_io_inputs_1_cmd_payload_address[14:0]  ), //i
    .io_inputs_1_cmd_payload_data       (core_ibus_decoder_io_outputs_1_cmd_payload_data[31:0]                           ), //i
    .io_inputs_1_cmd_payload_mask       (core_ibus_decoder_io_outputs_1_cmd_payload_mask[3:0]                            ), //i
    .io_inputs_1_rsp_valid              (pipelinedMemoryBusVEHEP_9_io_bus_arbiter_io_inputs_1_rsp_valid                  ), //o
    .io_inputs_1_rsp_payload_data       (pipelinedMemoryBusVEHEP_9_io_bus_arbiter_io_inputs_1_rsp_payload_data[31:0]     ), //o
    .io_output_cmd_valid                (pipelinedMemoryBusVEHEP_9_io_bus_arbiter_io_output_cmd_valid                    ), //o
    .io_output_cmd_ready                (pipelinedMemoryBusVEHEP_9_io_bus_cmd_ready                                      ), //i
    .io_output_cmd_payload_write        (pipelinedMemoryBusVEHEP_9_io_bus_arbiter_io_output_cmd_payload_write            ), //o
    .io_output_cmd_payload_address      (pipelinedMemoryBusVEHEP_9_io_bus_arbiter_io_output_cmd_payload_address[14:0]    ), //o
    .io_output_cmd_payload_data         (pipelinedMemoryBusVEHEP_9_io_bus_arbiter_io_output_cmd_payload_data[31:0]       ), //o
    .io_output_cmd_payload_mask         (pipelinedMemoryBusVEHEP_9_io_bus_arbiter_io_output_cmd_payload_mask[3:0]        ), //o
    .io_output_rsp_valid                (pipelinedMemoryBusVEHEP_9_io_bus_rsp_valid                                      ), //i
    .io_output_rsp_payload_data         (pipelinedMemoryBusVEHEP_9_io_bus_rsp_payload_data[31:0]                         ), //i
    .mainClock                          (mainClock                                                                       ), //i
    .resetCtrl_systemClockReset         (resetCtrl_systemClockReset                                                      )  //i
  );
  PipelinedMemoryBusArbiter pipelinedMemoryBusVEHEP_10_io_bus_arbiter (
    .io_inputs_0_cmd_valid              (core_dbus_decoder_io_outputs_2_cmd_valid                                         ), //i
    .io_inputs_0_cmd_ready              (pipelinedMemoryBusVEHEP_10_io_bus_arbiter_io_inputs_0_cmd_ready                  ), //o
    .io_inputs_0_cmd_payload_write      (core_dbus_decoder_io_outputs_2_cmd_payload_write                                 ), //i
    .io_inputs_0_cmd_payload_address    (pipelinedMemoryBusVEHEP_10_io_bus_arbiter_io_inputs_0_cmd_payload_address[14:0]  ), //i
    .io_inputs_0_cmd_payload_data       (core_dbus_decoder_io_outputs_2_cmd_payload_data[31:0]                            ), //i
    .io_inputs_0_cmd_payload_mask       (core_dbus_decoder_io_outputs_2_cmd_payload_mask[3:0]                             ), //i
    .io_inputs_0_rsp_valid              (pipelinedMemoryBusVEHEP_10_io_bus_arbiter_io_inputs_0_rsp_valid                  ), //o
    .io_inputs_0_rsp_payload_data       (pipelinedMemoryBusVEHEP_10_io_bus_arbiter_io_inputs_0_rsp_payload_data[31:0]     ), //o
    .io_inputs_1_cmd_valid              (core_ibus_decoder_io_outputs_2_cmd_valid                                         ), //i
    .io_inputs_1_cmd_ready              (pipelinedMemoryBusVEHEP_10_io_bus_arbiter_io_inputs_1_cmd_ready                  ), //o
    .io_inputs_1_cmd_payload_write      (core_ibus_decoder_io_outputs_2_cmd_payload_write                                 ), //i
    .io_inputs_1_cmd_payload_address    (pipelinedMemoryBusVEHEP_10_io_bus_arbiter_io_inputs_1_cmd_payload_address[14:0]  ), //i
    .io_inputs_1_cmd_payload_data       (core_ibus_decoder_io_outputs_2_cmd_payload_data[31:0]                            ), //i
    .io_inputs_1_cmd_payload_mask       (core_ibus_decoder_io_outputs_2_cmd_payload_mask[3:0]                             ), //i
    .io_inputs_1_rsp_valid              (pipelinedMemoryBusVEHEP_10_io_bus_arbiter_io_inputs_1_rsp_valid                  ), //o
    .io_inputs_1_rsp_payload_data       (pipelinedMemoryBusVEHEP_10_io_bus_arbiter_io_inputs_1_rsp_payload_data[31:0]     ), //o
    .io_output_cmd_valid                (pipelinedMemoryBusVEHEP_10_io_bus_arbiter_io_output_cmd_valid                    ), //o
    .io_output_cmd_ready                (pipelinedMemoryBusVEHEP_10_io_bus_cmd_ready                                      ), //i
    .io_output_cmd_payload_write        (pipelinedMemoryBusVEHEP_10_io_bus_arbiter_io_output_cmd_payload_write            ), //o
    .io_output_cmd_payload_address      (pipelinedMemoryBusVEHEP_10_io_bus_arbiter_io_output_cmd_payload_address[14:0]    ), //o
    .io_output_cmd_payload_data         (pipelinedMemoryBusVEHEP_10_io_bus_arbiter_io_output_cmd_payload_data[31:0]       ), //o
    .io_output_cmd_payload_mask         (pipelinedMemoryBusVEHEP_10_io_bus_arbiter_io_output_cmd_payload_mask[3:0]        ), //o
    .io_output_rsp_valid                (pipelinedMemoryBusVEHEP_10_io_bus_rsp_valid                                      ), //i
    .io_output_rsp_payload_data         (pipelinedMemoryBusVEHEP_10_io_bus_rsp_payload_data[31:0]                         ), //i
    .mainClock                          (mainClock                                                                        ), //i
    .resetCtrl_systemClockReset         (resetCtrl_systemClockReset                                                       )  //i
  );
  PipelinedMemoryBusArbiter pipelinedMemoryBusVEHEP_11_io_bus_arbiter (
    .io_inputs_0_cmd_valid              (core_dbus_decoder_io_outputs_3_cmd_valid                                         ), //i
    .io_inputs_0_cmd_ready              (pipelinedMemoryBusVEHEP_11_io_bus_arbiter_io_inputs_0_cmd_ready                  ), //o
    .io_inputs_0_cmd_payload_write      (core_dbus_decoder_io_outputs_3_cmd_payload_write                                 ), //i
    .io_inputs_0_cmd_payload_address    (pipelinedMemoryBusVEHEP_11_io_bus_arbiter_io_inputs_0_cmd_payload_address[14:0]  ), //i
    .io_inputs_0_cmd_payload_data       (core_dbus_decoder_io_outputs_3_cmd_payload_data[31:0]                            ), //i
    .io_inputs_0_cmd_payload_mask       (core_dbus_decoder_io_outputs_3_cmd_payload_mask[3:0]                             ), //i
    .io_inputs_0_rsp_valid              (pipelinedMemoryBusVEHEP_11_io_bus_arbiter_io_inputs_0_rsp_valid                  ), //o
    .io_inputs_0_rsp_payload_data       (pipelinedMemoryBusVEHEP_11_io_bus_arbiter_io_inputs_0_rsp_payload_data[31:0]     ), //o
    .io_inputs_1_cmd_valid              (core_ibus_decoder_io_outputs_3_cmd_valid                                         ), //i
    .io_inputs_1_cmd_ready              (pipelinedMemoryBusVEHEP_11_io_bus_arbiter_io_inputs_1_cmd_ready                  ), //o
    .io_inputs_1_cmd_payload_write      (core_ibus_decoder_io_outputs_3_cmd_payload_write                                 ), //i
    .io_inputs_1_cmd_payload_address    (pipelinedMemoryBusVEHEP_11_io_bus_arbiter_io_inputs_1_cmd_payload_address[14:0]  ), //i
    .io_inputs_1_cmd_payload_data       (core_ibus_decoder_io_outputs_3_cmd_payload_data[31:0]                            ), //i
    .io_inputs_1_cmd_payload_mask       (core_ibus_decoder_io_outputs_3_cmd_payload_mask[3:0]                             ), //i
    .io_inputs_1_rsp_valid              (pipelinedMemoryBusVEHEP_11_io_bus_arbiter_io_inputs_1_rsp_valid                  ), //o
    .io_inputs_1_rsp_payload_data       (pipelinedMemoryBusVEHEP_11_io_bus_arbiter_io_inputs_1_rsp_payload_data[31:0]     ), //o
    .io_output_cmd_valid                (pipelinedMemoryBusVEHEP_11_io_bus_arbiter_io_output_cmd_valid                    ), //o
    .io_output_cmd_ready                (pipelinedMemoryBusVEHEP_11_io_bus_cmd_ready                                      ), //i
    .io_output_cmd_payload_write        (pipelinedMemoryBusVEHEP_11_io_bus_arbiter_io_output_cmd_payload_write            ), //o
    .io_output_cmd_payload_address      (pipelinedMemoryBusVEHEP_11_io_bus_arbiter_io_output_cmd_payload_address[14:0]    ), //o
    .io_output_cmd_payload_data         (pipelinedMemoryBusVEHEP_11_io_bus_arbiter_io_output_cmd_payload_data[31:0]       ), //o
    .io_output_cmd_payload_mask         (pipelinedMemoryBusVEHEP_11_io_bus_arbiter_io_output_cmd_payload_mask[3:0]        ), //o
    .io_output_rsp_valid                (pipelinedMemoryBusVEHEP_11_io_bus_rsp_valid                                      ), //i
    .io_output_rsp_payload_data         (pipelinedMemoryBusVEHEP_11_io_bus_rsp_payload_data[31:0]                         ), //i
    .mainClock                          (mainClock                                                                        ), //i
    .resetCtrl_systemClockReset         (resetCtrl_systemClockReset                                                       )  //i
  );
  PipelinedMemoryBusArbiter pipelinedMemoryBusVEHEP_12_io_bus_arbiter (
    .io_inputs_0_cmd_valid              (core_dbus_decoder_io_outputs_4_cmd_valid                                         ), //i
    .io_inputs_0_cmd_ready              (pipelinedMemoryBusVEHEP_12_io_bus_arbiter_io_inputs_0_cmd_ready                  ), //o
    .io_inputs_0_cmd_payload_write      (core_dbus_decoder_io_outputs_4_cmd_payload_write                                 ), //i
    .io_inputs_0_cmd_payload_address    (pipelinedMemoryBusVEHEP_12_io_bus_arbiter_io_inputs_0_cmd_payload_address[14:0]  ), //i
    .io_inputs_0_cmd_payload_data       (core_dbus_decoder_io_outputs_4_cmd_payload_data[31:0]                            ), //i
    .io_inputs_0_cmd_payload_mask       (core_dbus_decoder_io_outputs_4_cmd_payload_mask[3:0]                             ), //i
    .io_inputs_0_rsp_valid              (pipelinedMemoryBusVEHEP_12_io_bus_arbiter_io_inputs_0_rsp_valid                  ), //o
    .io_inputs_0_rsp_payload_data       (pipelinedMemoryBusVEHEP_12_io_bus_arbiter_io_inputs_0_rsp_payload_data[31:0]     ), //o
    .io_inputs_1_cmd_valid              (core_ibus_decoder_io_outputs_4_cmd_valid                                         ), //i
    .io_inputs_1_cmd_ready              (pipelinedMemoryBusVEHEP_12_io_bus_arbiter_io_inputs_1_cmd_ready                  ), //o
    .io_inputs_1_cmd_payload_write      (core_ibus_decoder_io_outputs_4_cmd_payload_write                                 ), //i
    .io_inputs_1_cmd_payload_address    (pipelinedMemoryBusVEHEP_12_io_bus_arbiter_io_inputs_1_cmd_payload_address[14:0]  ), //i
    .io_inputs_1_cmd_payload_data       (core_ibus_decoder_io_outputs_4_cmd_payload_data[31:0]                            ), //i
    .io_inputs_1_cmd_payload_mask       (core_ibus_decoder_io_outputs_4_cmd_payload_mask[3:0]                             ), //i
    .io_inputs_1_rsp_valid              (pipelinedMemoryBusVEHEP_12_io_bus_arbiter_io_inputs_1_rsp_valid                  ), //o
    .io_inputs_1_rsp_payload_data       (pipelinedMemoryBusVEHEP_12_io_bus_arbiter_io_inputs_1_rsp_payload_data[31:0]     ), //o
    .io_output_cmd_valid                (pipelinedMemoryBusVEHEP_12_io_bus_arbiter_io_output_cmd_valid                    ), //o
    .io_output_cmd_ready                (pipelinedMemoryBusVEHEP_12_io_bus_cmd_ready                                      ), //i
    .io_output_cmd_payload_write        (pipelinedMemoryBusVEHEP_12_io_bus_arbiter_io_output_cmd_payload_write            ), //o
    .io_output_cmd_payload_address      (pipelinedMemoryBusVEHEP_12_io_bus_arbiter_io_output_cmd_payload_address[14:0]    ), //o
    .io_output_cmd_payload_data         (pipelinedMemoryBusVEHEP_12_io_bus_arbiter_io_output_cmd_payload_data[31:0]       ), //o
    .io_output_cmd_payload_mask         (pipelinedMemoryBusVEHEP_12_io_bus_arbiter_io_output_cmd_payload_mask[3:0]        ), //o
    .io_output_rsp_valid                (pipelinedMemoryBusVEHEP_12_io_bus_rsp_valid                                      ), //i
    .io_output_rsp_payload_data         (pipelinedMemoryBusVEHEP_12_io_bus_rsp_payload_data[31:0]                         ), //i
    .mainClock                          (mainClock                                                                        ), //i
    .resetCtrl_systemClockReset         (resetCtrl_systemClockReset                                                       )  //i
  );
  PipelinedMemoryBusArbiter pipelinedMemoryBusVEHEP_13_io_bus_arbiter (
    .io_inputs_0_cmd_valid              (core_dbus_decoder_io_outputs_5_cmd_valid                                         ), //i
    .io_inputs_0_cmd_ready              (pipelinedMemoryBusVEHEP_13_io_bus_arbiter_io_inputs_0_cmd_ready                  ), //o
    .io_inputs_0_cmd_payload_write      (core_dbus_decoder_io_outputs_5_cmd_payload_write                                 ), //i
    .io_inputs_0_cmd_payload_address    (pipelinedMemoryBusVEHEP_13_io_bus_arbiter_io_inputs_0_cmd_payload_address[14:0]  ), //i
    .io_inputs_0_cmd_payload_data       (core_dbus_decoder_io_outputs_5_cmd_payload_data[31:0]                            ), //i
    .io_inputs_0_cmd_payload_mask       (core_dbus_decoder_io_outputs_5_cmd_payload_mask[3:0]                             ), //i
    .io_inputs_0_rsp_valid              (pipelinedMemoryBusVEHEP_13_io_bus_arbiter_io_inputs_0_rsp_valid                  ), //o
    .io_inputs_0_rsp_payload_data       (pipelinedMemoryBusVEHEP_13_io_bus_arbiter_io_inputs_0_rsp_payload_data[31:0]     ), //o
    .io_inputs_1_cmd_valid              (core_ibus_decoder_io_outputs_5_cmd_valid                                         ), //i
    .io_inputs_1_cmd_ready              (pipelinedMemoryBusVEHEP_13_io_bus_arbiter_io_inputs_1_cmd_ready                  ), //o
    .io_inputs_1_cmd_payload_write      (core_ibus_decoder_io_outputs_5_cmd_payload_write                                 ), //i
    .io_inputs_1_cmd_payload_address    (pipelinedMemoryBusVEHEP_13_io_bus_arbiter_io_inputs_1_cmd_payload_address[14:0]  ), //i
    .io_inputs_1_cmd_payload_data       (core_ibus_decoder_io_outputs_5_cmd_payload_data[31:0]                            ), //i
    .io_inputs_1_cmd_payload_mask       (core_ibus_decoder_io_outputs_5_cmd_payload_mask[3:0]                             ), //i
    .io_inputs_1_rsp_valid              (pipelinedMemoryBusVEHEP_13_io_bus_arbiter_io_inputs_1_rsp_valid                  ), //o
    .io_inputs_1_rsp_payload_data       (pipelinedMemoryBusVEHEP_13_io_bus_arbiter_io_inputs_1_rsp_payload_data[31:0]     ), //o
    .io_output_cmd_valid                (pipelinedMemoryBusVEHEP_13_io_bus_arbiter_io_output_cmd_valid                    ), //o
    .io_output_cmd_ready                (pipelinedMemoryBusVEHEP_13_io_bus_cmd_ready                                      ), //i
    .io_output_cmd_payload_write        (pipelinedMemoryBusVEHEP_13_io_bus_arbiter_io_output_cmd_payload_write            ), //o
    .io_output_cmd_payload_address      (pipelinedMemoryBusVEHEP_13_io_bus_arbiter_io_output_cmd_payload_address[14:0]    ), //o
    .io_output_cmd_payload_data         (pipelinedMemoryBusVEHEP_13_io_bus_arbiter_io_output_cmd_payload_data[31:0]       ), //o
    .io_output_cmd_payload_mask         (pipelinedMemoryBusVEHEP_13_io_bus_arbiter_io_output_cmd_payload_mask[3:0]        ), //o
    .io_output_rsp_valid                (pipelinedMemoryBusVEHEP_13_io_bus_rsp_valid                                      ), //i
    .io_output_rsp_payload_data         (pipelinedMemoryBusVEHEP_13_io_bus_rsp_payload_data[31:0]                         ), //i
    .mainClock                          (mainClock                                                                        ), //i
    .resetCtrl_systemClockReset         (resetCtrl_systemClockReset                                                       )  //i
  );
  PipelinedMemoryBusArbiter pipelinedMemoryBusVEHEP_14_io_bus_arbiter (
    .io_inputs_0_cmd_valid              (core_dbus_decoder_io_outputs_6_cmd_valid                                         ), //i
    .io_inputs_0_cmd_ready              (pipelinedMemoryBusVEHEP_14_io_bus_arbiter_io_inputs_0_cmd_ready                  ), //o
    .io_inputs_0_cmd_payload_write      (core_dbus_decoder_io_outputs_6_cmd_payload_write                                 ), //i
    .io_inputs_0_cmd_payload_address    (pipelinedMemoryBusVEHEP_14_io_bus_arbiter_io_inputs_0_cmd_payload_address[14:0]  ), //i
    .io_inputs_0_cmd_payload_data       (core_dbus_decoder_io_outputs_6_cmd_payload_data[31:0]                            ), //i
    .io_inputs_0_cmd_payload_mask       (core_dbus_decoder_io_outputs_6_cmd_payload_mask[3:0]                             ), //i
    .io_inputs_0_rsp_valid              (pipelinedMemoryBusVEHEP_14_io_bus_arbiter_io_inputs_0_rsp_valid                  ), //o
    .io_inputs_0_rsp_payload_data       (pipelinedMemoryBusVEHEP_14_io_bus_arbiter_io_inputs_0_rsp_payload_data[31:0]     ), //o
    .io_inputs_1_cmd_valid              (core_ibus_decoder_io_outputs_6_cmd_valid                                         ), //i
    .io_inputs_1_cmd_ready              (pipelinedMemoryBusVEHEP_14_io_bus_arbiter_io_inputs_1_cmd_ready                  ), //o
    .io_inputs_1_cmd_payload_write      (core_ibus_decoder_io_outputs_6_cmd_payload_write                                 ), //i
    .io_inputs_1_cmd_payload_address    (pipelinedMemoryBusVEHEP_14_io_bus_arbiter_io_inputs_1_cmd_payload_address[14:0]  ), //i
    .io_inputs_1_cmd_payload_data       (core_ibus_decoder_io_outputs_6_cmd_payload_data[31:0]                            ), //i
    .io_inputs_1_cmd_payload_mask       (core_ibus_decoder_io_outputs_6_cmd_payload_mask[3:0]                             ), //i
    .io_inputs_1_rsp_valid              (pipelinedMemoryBusVEHEP_14_io_bus_arbiter_io_inputs_1_rsp_valid                  ), //o
    .io_inputs_1_rsp_payload_data       (pipelinedMemoryBusVEHEP_14_io_bus_arbiter_io_inputs_1_rsp_payload_data[31:0]     ), //o
    .io_output_cmd_valid                (pipelinedMemoryBusVEHEP_14_io_bus_arbiter_io_output_cmd_valid                    ), //o
    .io_output_cmd_ready                (pipelinedMemoryBusVEHEP_14_io_bus_cmd_ready                                      ), //i
    .io_output_cmd_payload_write        (pipelinedMemoryBusVEHEP_14_io_bus_arbiter_io_output_cmd_payload_write            ), //o
    .io_output_cmd_payload_address      (pipelinedMemoryBusVEHEP_14_io_bus_arbiter_io_output_cmd_payload_address[14:0]    ), //o
    .io_output_cmd_payload_data         (pipelinedMemoryBusVEHEP_14_io_bus_arbiter_io_output_cmd_payload_data[31:0]       ), //o
    .io_output_cmd_payload_mask         (pipelinedMemoryBusVEHEP_14_io_bus_arbiter_io_output_cmd_payload_mask[3:0]        ), //o
    .io_output_rsp_valid                (pipelinedMemoryBusVEHEP_14_io_bus_rsp_valid                                      ), //i
    .io_output_rsp_payload_data         (pipelinedMemoryBusVEHEP_14_io_bus_rsp_payload_data[31:0]                         ), //i
    .mainClock                          (mainClock                                                                        ), //i
    .resetCtrl_systemClockReset         (resetCtrl_systemClockReset                                                       )  //i
  );
  PipelinedMemoryBusArbiter pipelinedMemoryBusVEHEP_15_io_bus_arbiter (
    .io_inputs_0_cmd_valid              (core_dbus_decoder_io_outputs_7_cmd_valid                                         ), //i
    .io_inputs_0_cmd_ready              (pipelinedMemoryBusVEHEP_15_io_bus_arbiter_io_inputs_0_cmd_ready                  ), //o
    .io_inputs_0_cmd_payload_write      (core_dbus_decoder_io_outputs_7_cmd_payload_write                                 ), //i
    .io_inputs_0_cmd_payload_address    (pipelinedMemoryBusVEHEP_15_io_bus_arbiter_io_inputs_0_cmd_payload_address[14:0]  ), //i
    .io_inputs_0_cmd_payload_data       (core_dbus_decoder_io_outputs_7_cmd_payload_data[31:0]                            ), //i
    .io_inputs_0_cmd_payload_mask       (core_dbus_decoder_io_outputs_7_cmd_payload_mask[3:0]                             ), //i
    .io_inputs_0_rsp_valid              (pipelinedMemoryBusVEHEP_15_io_bus_arbiter_io_inputs_0_rsp_valid                  ), //o
    .io_inputs_0_rsp_payload_data       (pipelinedMemoryBusVEHEP_15_io_bus_arbiter_io_inputs_0_rsp_payload_data[31:0]     ), //o
    .io_inputs_1_cmd_valid              (core_ibus_decoder_io_outputs_7_cmd_valid                                         ), //i
    .io_inputs_1_cmd_ready              (pipelinedMemoryBusVEHEP_15_io_bus_arbiter_io_inputs_1_cmd_ready                  ), //o
    .io_inputs_1_cmd_payload_write      (core_ibus_decoder_io_outputs_7_cmd_payload_write                                 ), //i
    .io_inputs_1_cmd_payload_address    (pipelinedMemoryBusVEHEP_15_io_bus_arbiter_io_inputs_1_cmd_payload_address[14:0]  ), //i
    .io_inputs_1_cmd_payload_data       (core_ibus_decoder_io_outputs_7_cmd_payload_data[31:0]                            ), //i
    .io_inputs_1_cmd_payload_mask       (core_ibus_decoder_io_outputs_7_cmd_payload_mask[3:0]                             ), //i
    .io_inputs_1_rsp_valid              (pipelinedMemoryBusVEHEP_15_io_bus_arbiter_io_inputs_1_rsp_valid                  ), //o
    .io_inputs_1_rsp_payload_data       (pipelinedMemoryBusVEHEP_15_io_bus_arbiter_io_inputs_1_rsp_payload_data[31:0]     ), //o
    .io_output_cmd_valid                (pipelinedMemoryBusVEHEP_15_io_bus_arbiter_io_output_cmd_valid                    ), //o
    .io_output_cmd_ready                (pipelinedMemoryBusVEHEP_15_io_bus_cmd_ready                                      ), //i
    .io_output_cmd_payload_write        (pipelinedMemoryBusVEHEP_15_io_bus_arbiter_io_output_cmd_payload_write            ), //o
    .io_output_cmd_payload_address      (pipelinedMemoryBusVEHEP_15_io_bus_arbiter_io_output_cmd_payload_address[14:0]    ), //o
    .io_output_cmd_payload_data         (pipelinedMemoryBusVEHEP_15_io_bus_arbiter_io_output_cmd_payload_data[31:0]       ), //o
    .io_output_cmd_payload_mask         (pipelinedMemoryBusVEHEP_15_io_bus_arbiter_io_output_cmd_payload_mask[3:0]        ), //o
    .io_output_rsp_valid                (pipelinedMemoryBusVEHEP_15_io_bus_rsp_valid                                      ), //i
    .io_output_rsp_payload_data         (pipelinedMemoryBusVEHEP_15_io_bus_rsp_payload_data[31:0]                         ), //i
    .mainClock                          (mainClock                                                                        ), //i
    .resetCtrl_systemClockReset         (resetCtrl_systemClockReset                                                       )  //i
  );
  PipelinedMemoryBusArbiter_8 apbCrossbar_apbBridge_io_pipelinedMemoryBus_arbiter (
    .io_inputs_0_cmd_valid              (core_dbus_decoder_io_outputs_8_cmd_valid                                                 ), //i
    .io_inputs_0_cmd_ready              (apbCrossbar_apbBridge_io_pipelinedMemoryBus_arbiter_io_inputs_0_cmd_ready                ), //o
    .io_inputs_0_cmd_payload_write      (core_dbus_decoder_io_outputs_8_cmd_payload_write                                         ), //i
    .io_inputs_0_cmd_payload_address    (core_dbus_decoder_io_outputs_8_cmd_payload_address[31:0]                                 ), //i
    .io_inputs_0_cmd_payload_data       (core_dbus_decoder_io_outputs_8_cmd_payload_data[31:0]                                    ), //i
    .io_inputs_0_cmd_payload_mask       (core_dbus_decoder_io_outputs_8_cmd_payload_mask[3:0]                                     ), //i
    .io_inputs_0_rsp_valid              (apbCrossbar_apbBridge_io_pipelinedMemoryBus_arbiter_io_inputs_0_rsp_valid                ), //o
    .io_inputs_0_rsp_payload_data       (apbCrossbar_apbBridge_io_pipelinedMemoryBus_arbiter_io_inputs_0_rsp_payload_data[31:0]   ), //o
    .io_output_cmd_valid                (apbCrossbar_apbBridge_io_pipelinedMemoryBus_arbiter_io_output_cmd_valid                  ), //o
    .io_output_cmd_ready                (apbCrossbar_apbBridge_io_pipelinedMemoryBus_cmd_ready                                    ), //i
    .io_output_cmd_payload_write        (apbCrossbar_apbBridge_io_pipelinedMemoryBus_arbiter_io_output_cmd_payload_write          ), //o
    .io_output_cmd_payload_address      (apbCrossbar_apbBridge_io_pipelinedMemoryBus_arbiter_io_output_cmd_payload_address[31:0]  ), //o
    .io_output_cmd_payload_data         (apbCrossbar_apbBridge_io_pipelinedMemoryBus_arbiter_io_output_cmd_payload_data[31:0]     ), //o
    .io_output_cmd_payload_mask         (apbCrossbar_apbBridge_io_pipelinedMemoryBus_arbiter_io_output_cmd_payload_mask[3:0]      ), //o
    .io_output_rsp_valid                (apbCrossbar_apbBridge_io_pipelinedMemoryBus_rsp_valid                                    ), //i
    .io_output_rsp_payload_data         (apbCrossbar_apbBridge_io_pipelinedMemoryBus_rsp_payload_data[31:0]                       )  //i
  );
  assign resetCtrl_bufferedReset = asyncReset_buffercc_io_dataOut;
  assign core_timerInterrupt = 1'b0;
  always @(*) begin
    core_externalInterrupt = 1'b0;
    if(UARTPeripheral_uartCtrl_io_interrupt) begin
      core_externalInterrupt = 1'b1;
    end
    if(SpiSlavePeripheral_spiCtrl_io_interrupt) begin
      core_externalInterrupt = 1'b1;
    end
  end

  assign core_softwareInterrupt = 1'b0;
  assign _zz_core_ibus_cmd_valid = core_cpu_iBus_cmd_valid;
  assign _zz_core_ibus_cmd_payload_address = core_cpu_iBus_cmd_payload_pc;
  assign _zz_iBus_cmd_ready = (! _zz_core_ibus_cmd_valid_1);
  always @(*) begin
    _zz_1 = core_ibus_cmd_ready;
    if(when_Stream_l342) begin
      _zz_1 = 1'b1;
    end
  end

  assign when_Stream_l342 = (! _zz_core_ibus_cmd_valid_2);
  assign _zz_core_ibus_cmd_valid_2 = _zz_core_ibus_cmd_valid_3;
  assign core_ibus_cmd_valid = _zz_core_ibus_cmd_valid_2;
  assign core_ibus_cmd_payload_write = _zz_core_ibus_cmd_payload_write_1;
  assign core_ibus_cmd_payload_address = _zz_core_ibus_cmd_payload_address_2;
  assign core_ibus_cmd_payload_data = _zz_core_ibus_cmd_payload_data_1;
  assign core_ibus_cmd_payload_mask = _zz_core_ibus_cmd_payload_mask_1;
  assign _zz_core_dbus_cmd_valid = core_cpu_dBus_cmd_valid;
  assign _zz_core_dbus_cmd_payload_write = core_cpu_dBus_cmd_payload_wr;
  assign _zz_core_dbus_cmd_payload_address = core_cpu_dBus_cmd_payload_address;
  assign _zz_core_dbus_cmd_payload_data = core_cpu_dBus_cmd_payload_data;
  always @(*) begin
    case(core_cpu_dBus_cmd_payload_size)
      2'b00 : begin
        _zz_core_dbus_cmd_payload_mask_1 = 4'b0001;
      end
      2'b01 : begin
        _zz_core_dbus_cmd_payload_mask_1 = 4'b0011;
      end
      default : begin
        _zz_core_dbus_cmd_payload_mask_1 = 4'b1111;
      end
    endcase
  end

  assign _zz_core_dbus_cmd_payload_mask = (_zz_core_dbus_cmd_payload_mask_1 <<< core_cpu_dBus_cmd_payload_address[1 : 0]);
  assign _zz_dBus_cmd_ready = (! _zz_core_dbus_cmd_valid_1);
  always @(*) begin
    _zz_2 = core_dbus_cmd_ready;
    if(when_Stream_l342_1) begin
      _zz_2 = 1'b1;
    end
  end

  assign when_Stream_l342_1 = (! _zz_core_dbus_cmd_valid_2);
  assign _zz_core_dbus_cmd_valid_2 = _zz_core_dbus_cmd_valid_3;
  assign core_dbus_cmd_valid = _zz_core_dbus_cmd_valid_2;
  assign core_dbus_cmd_payload_write = _zz_core_dbus_cmd_payload_write_2;
  assign core_dbus_cmd_payload_address = _zz_core_dbus_cmd_payload_address_2;
  assign core_dbus_cmd_payload_data = _zz_core_dbus_cmd_payload_data_2;
  assign core_dbus_cmd_payload_mask = _zz_core_dbus_cmd_payload_mask_3;
  assign core_cpu_debug_bus_cmd_payload_address = systemDebugger_1_io_mem_cmd_payload_address[7:0];
  assign core_cpu_debug_bus_cmd_fire = (systemDebugger_1_io_mem_cmd_valid && core_cpu_debug_bus_cmd_ready);
  assign jtag_tdo = jtagBridge_1_io_jtag_tdo;
  assign uart_txd = UARTPeripheral_uartCtrl_io_uart_txd;
  assign gpio_write = GPIOPeripheral_gpioCtrl_io_gpio_write;
  assign gpio_writeEnable = GPIOPeripheral_gpioCtrl_io_gpio_writeEnable;
  assign spi_miso_write = SpiSlavePeripheral_spiCtrl_io_spi_miso_write;
  assign spi_miso_writeEnable = SpiSlavePeripheral_spiCtrl_io_spi_miso_writeEnable;
  assign mainClock = clk;
  assign asyncReset = reset;
  assign UARTPeripheral_uartCtrl_io_apb_PADDR = apb3Router_1_io_outputs_0_PADDR[4:0];
  assign AESMaskedPeripheral_aesCtrl_io_bus_PADDR = apb3Router_1_io_outputs_1_PADDR[15:0];
  assign GPIOPeripheral_gpioCtrl_io_apb_PADDR = apb3Router_1_io_outputs_2_PADDR[3:0];
  assign SpiSlavePeripheral_spiCtrl_io_apb_PADDR = apb3Router_1_io_outputs_3_PADDR[7:0];
  assign core_dbus_cmd_ready = core_dbus_decoder_io_input_cmd_ready;
  assign core_dbus_rsp_valid = core_dbus_decoder_io_input_rsp_valid;
  assign core_dbus_rsp_payload_data = core_dbus_decoder_io_input_rsp_payload_data;
  assign core_ibus_cmd_ready = core_ibus_decoder_io_input_cmd_ready;
  assign core_ibus_rsp_valid = core_ibus_decoder_io_input_rsp_valid;
  assign core_ibus_rsp_payload_data = core_ibus_decoder_io_input_rsp_payload_data;
  assign pipelinedMemoryBusVEHEP_8_io_bus_arbiter_io_inputs_0_cmd_payload_address = core_dbus_decoder_io_outputs_0_cmd_payload_address[14:0];
  assign pipelinedMemoryBusVEHEP_9_io_bus_arbiter_io_inputs_0_cmd_payload_address = core_dbus_decoder_io_outputs_1_cmd_payload_address[14:0];
  assign pipelinedMemoryBusVEHEP_10_io_bus_arbiter_io_inputs_0_cmd_payload_address = core_dbus_decoder_io_outputs_2_cmd_payload_address[14:0];
  assign pipelinedMemoryBusVEHEP_11_io_bus_arbiter_io_inputs_0_cmd_payload_address = core_dbus_decoder_io_outputs_3_cmd_payload_address[14:0];
  assign pipelinedMemoryBusVEHEP_12_io_bus_arbiter_io_inputs_0_cmd_payload_address = core_dbus_decoder_io_outputs_4_cmd_payload_address[14:0];
  assign pipelinedMemoryBusVEHEP_13_io_bus_arbiter_io_inputs_0_cmd_payload_address = core_dbus_decoder_io_outputs_5_cmd_payload_address[14:0];
  assign pipelinedMemoryBusVEHEP_14_io_bus_arbiter_io_inputs_0_cmd_payload_address = core_dbus_decoder_io_outputs_6_cmd_payload_address[14:0];
  assign pipelinedMemoryBusVEHEP_15_io_bus_arbiter_io_inputs_0_cmd_payload_address = core_dbus_decoder_io_outputs_7_cmd_payload_address[14:0];
  assign pipelinedMemoryBusVEHEP_8_io_bus_arbiter_io_inputs_1_cmd_payload_address = core_ibus_decoder_io_outputs_0_cmd_payload_address[14:0];
  assign pipelinedMemoryBusVEHEP_9_io_bus_arbiter_io_inputs_1_cmd_payload_address = core_ibus_decoder_io_outputs_1_cmd_payload_address[14:0];
  assign pipelinedMemoryBusVEHEP_10_io_bus_arbiter_io_inputs_1_cmd_payload_address = core_ibus_decoder_io_outputs_2_cmd_payload_address[14:0];
  assign pipelinedMemoryBusVEHEP_11_io_bus_arbiter_io_inputs_1_cmd_payload_address = core_ibus_decoder_io_outputs_3_cmd_payload_address[14:0];
  assign pipelinedMemoryBusVEHEP_12_io_bus_arbiter_io_inputs_1_cmd_payload_address = core_ibus_decoder_io_outputs_4_cmd_payload_address[14:0];
  assign pipelinedMemoryBusVEHEP_13_io_bus_arbiter_io_inputs_1_cmd_payload_address = core_ibus_decoder_io_outputs_5_cmd_payload_address[14:0];
  assign pipelinedMemoryBusVEHEP_14_io_bus_arbiter_io_inputs_1_cmd_payload_address = core_ibus_decoder_io_outputs_6_cmd_payload_address[14:0];
  assign pipelinedMemoryBusVEHEP_15_io_bus_arbiter_io_inputs_1_cmd_payload_address = core_ibus_decoder_io_outputs_7_cmd_payload_address[14:0];
  always @(posedge mainClock) begin
    resetCtrl_mainClockReset <= resetCtrl_bufferedReset;
    resetCtrl_systemClockReset <= resetCtrl_bufferedReset;
    if(core_cpu_debug_resetOut_regNext) begin
      resetCtrl_systemClockReset <= 1'b1;
    end
  end

  always @(posedge mainClock or posedge resetCtrl_systemClockReset) begin
    if(resetCtrl_systemClockReset) begin
      _zz_core_ibus_cmd_valid_1 <= 1'b0;
      _zz_core_ibus_cmd_valid_3 <= 1'b0;
      _zz_core_dbus_cmd_valid_1 <= 1'b0;
      _zz_core_dbus_cmd_valid_3 <= 1'b0;
    end else begin
      if(_zz_core_ibus_cmd_valid) begin
        _zz_core_ibus_cmd_valid_1 <= 1'b1;
      end
      if(_zz_1) begin
        _zz_core_ibus_cmd_valid_1 <= 1'b0;
      end
      if(_zz_1) begin
        _zz_core_ibus_cmd_valid_3 <= (_zz_core_ibus_cmd_valid || _zz_core_ibus_cmd_valid_1);
      end
      if(_zz_core_dbus_cmd_valid) begin
        _zz_core_dbus_cmd_valid_1 <= 1'b1;
      end
      if(_zz_2) begin
        _zz_core_dbus_cmd_valid_1 <= 1'b0;
      end
      if(_zz_2) begin
        _zz_core_dbus_cmd_valid_3 <= (_zz_core_dbus_cmd_valid || _zz_core_dbus_cmd_valid_1);
      end
    end
  end

  always @(posedge mainClock) begin
    if(_zz_iBus_cmd_ready) begin
      _zz_core_ibus_cmd_payload_write <= 1'b0;
      _zz_core_ibus_cmd_payload_address_1 <= _zz_core_ibus_cmd_payload_address;
      _zz_core_ibus_cmd_payload_data <= 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      _zz_core_ibus_cmd_payload_mask <= 4'bxxxx;
    end
    if(_zz_1) begin
      _zz_core_ibus_cmd_payload_write_1 <= (_zz_core_ibus_cmd_valid_1 ? _zz_core_ibus_cmd_payload_write : 1'b0);
      _zz_core_ibus_cmd_payload_address_2 <= (_zz_core_ibus_cmd_valid_1 ? _zz_core_ibus_cmd_payload_address_1 : _zz_core_ibus_cmd_payload_address);
      _zz_core_ibus_cmd_payload_data_1 <= (_zz_core_ibus_cmd_valid_1 ? _zz_core_ibus_cmd_payload_data : 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
      _zz_core_ibus_cmd_payload_mask_1 <= (_zz_core_ibus_cmd_valid_1 ? _zz_core_ibus_cmd_payload_mask : 4'bxxxx);
    end
    if(_zz_dBus_cmd_ready) begin
      _zz_core_dbus_cmd_payload_write_1 <= _zz_core_dbus_cmd_payload_write;
      _zz_core_dbus_cmd_payload_address_1 <= _zz_core_dbus_cmd_payload_address;
      _zz_core_dbus_cmd_payload_data_1 <= _zz_core_dbus_cmd_payload_data;
      _zz_core_dbus_cmd_payload_mask_2 <= _zz_core_dbus_cmd_payload_mask;
    end
    if(_zz_2) begin
      _zz_core_dbus_cmd_payload_write_2 <= (_zz_core_dbus_cmd_valid_1 ? _zz_core_dbus_cmd_payload_write_1 : _zz_core_dbus_cmd_payload_write);
      _zz_core_dbus_cmd_payload_address_2 <= (_zz_core_dbus_cmd_valid_1 ? _zz_core_dbus_cmd_payload_address_1 : _zz_core_dbus_cmd_payload_address);
      _zz_core_dbus_cmd_payload_data_2 <= (_zz_core_dbus_cmd_valid_1 ? _zz_core_dbus_cmd_payload_data_1 : _zz_core_dbus_cmd_payload_data);
      _zz_core_dbus_cmd_payload_mask_3 <= (_zz_core_dbus_cmd_valid_1 ? _zz_core_dbus_cmd_payload_mask_2 : _zz_core_dbus_cmd_payload_mask);
    end
  end

  always @(posedge mainClock) begin
    core_cpu_debug_resetOut_regNext <= core_cpu_debug_resetOut;
  end

  always @(posedge mainClock or posedge resetCtrl_mainClockReset) begin
    if(resetCtrl_mainClockReset) begin
      core_cpu_debug_bus_cmd_fire_regNext <= 1'b0;
    end else begin
      core_cpu_debug_bus_cmd_fire_regNext <= core_cpu_debug_bus_cmd_fire;
    end
  end


endmodule

module PipelinedMemoryBusArbiter_8 (
  input               io_inputs_0_cmd_valid,
  output              io_inputs_0_cmd_ready,
  input               io_inputs_0_cmd_payload_write,
  input      [31:0]   io_inputs_0_cmd_payload_address,
  input      [31:0]   io_inputs_0_cmd_payload_data,
  input      [3:0]    io_inputs_0_cmd_payload_mask,
  output              io_inputs_0_rsp_valid,
  output     [31:0]   io_inputs_0_rsp_payload_data,
  output              io_output_cmd_valid,
  input               io_output_cmd_ready,
  output              io_output_cmd_payload_write,
  output     [31:0]   io_output_cmd_payload_address,
  output     [31:0]   io_output_cmd_payload_data,
  output     [3:0]    io_output_cmd_payload_mask,
  input               io_output_rsp_valid,
  input      [31:0]   io_output_rsp_payload_data
);

  assign io_output_cmd_valid = io_inputs_0_cmd_valid;
  assign io_output_cmd_payload_write = io_inputs_0_cmd_payload_write;
  assign io_output_cmd_payload_address = io_inputs_0_cmd_payload_address;
  assign io_output_cmd_payload_data = io_inputs_0_cmd_payload_data;
  assign io_output_cmd_payload_mask = io_inputs_0_cmd_payload_mask;
  assign io_inputs_0_cmd_ready = io_output_cmd_ready;
  assign io_inputs_0_rsp_valid = io_output_rsp_valid;
  assign io_inputs_0_rsp_payload_data = io_output_rsp_payload_data;

endmodule

//PipelinedMemoryBusArbiter replaced by PipelinedMemoryBusArbiter

//PipelinedMemoryBusArbiter replaced by PipelinedMemoryBusArbiter

//PipelinedMemoryBusArbiter replaced by PipelinedMemoryBusArbiter

//PipelinedMemoryBusArbiter replaced by PipelinedMemoryBusArbiter

//PipelinedMemoryBusArbiter replaced by PipelinedMemoryBusArbiter

//PipelinedMemoryBusArbiter replaced by PipelinedMemoryBusArbiter

//PipelinedMemoryBusArbiter replaced by PipelinedMemoryBusArbiter

module PipelinedMemoryBusArbiter (
  input               io_inputs_0_cmd_valid,
  output              io_inputs_0_cmd_ready,
  input               io_inputs_0_cmd_payload_write,
  input      [14:0]   io_inputs_0_cmd_payload_address,
  input      [31:0]   io_inputs_0_cmd_payload_data,
  input      [3:0]    io_inputs_0_cmd_payload_mask,
  output              io_inputs_0_rsp_valid,
  output     [31:0]   io_inputs_0_rsp_payload_data,
  input               io_inputs_1_cmd_valid,
  output              io_inputs_1_cmd_ready,
  input               io_inputs_1_cmd_payload_write,
  input      [14:0]   io_inputs_1_cmd_payload_address,
  input      [31:0]   io_inputs_1_cmd_payload_data,
  input      [3:0]    io_inputs_1_cmd_payload_mask,
  output              io_inputs_1_rsp_valid,
  output     [31:0]   io_inputs_1_rsp_payload_data,
  output              io_output_cmd_valid,
  input               io_output_cmd_ready,
  output              io_output_cmd_payload_write,
  output     [14:0]   io_output_cmd_payload_address,
  output     [31:0]   io_output_cmd_payload_data,
  output     [3:0]    io_output_cmd_payload_mask,
  input               io_output_rsp_valid,
  input      [31:0]   io_output_rsp_payload_data,
  input               mainClock,
  input               resetCtrl_systemClockReset
);
  wire                logic_arbiter_io_inputs_0_ready;
  wire                logic_arbiter_io_inputs_1_ready;
  wire                logic_arbiter_io_output_valid;
  wire                logic_arbiter_io_output_payload_write;
  wire       [14:0]   logic_arbiter_io_output_payload_address;
  wire       [31:0]   logic_arbiter_io_output_payload_data;
  wire       [3:0]    logic_arbiter_io_output_payload_mask;
  wire       [0:0]    logic_arbiter_io_chosen;
  wire       [1:0]    logic_arbiter_io_chosenOH;
  wire                logic_arbiter_io_output_fork_io_input_ready;
  wire                logic_arbiter_io_output_fork_io_outputs_0_valid;
  wire                logic_arbiter_io_output_fork_io_outputs_0_payload_write;
  wire       [14:0]   logic_arbiter_io_output_fork_io_outputs_0_payload_address;
  wire       [31:0]   logic_arbiter_io_output_fork_io_outputs_0_payload_data;
  wire       [3:0]    logic_arbiter_io_output_fork_io_outputs_0_payload_mask;
  wire                logic_arbiter_io_output_fork_io_outputs_1_valid;
  wire                logic_arbiter_io_output_fork_io_outputs_1_payload_write;
  wire       [14:0]   logic_arbiter_io_output_fork_io_outputs_1_payload_address;
  wire       [31:0]   logic_arbiter_io_output_fork_io_outputs_1_payload_data;
  wire       [3:0]    logic_arbiter_io_output_fork_io_outputs_1_payload_mask;
  wire                logic_arbiter_io_output_fork_io_outputs_1_translated_thrown_fifo_io_push_ready;
  wire                logic_arbiter_io_output_fork_io_outputs_1_translated_thrown_fifo_io_pop_valid;
  wire       [1:0]    logic_arbiter_io_output_fork_io_outputs_1_translated_thrown_fifo_io_pop_payload;
  wire       [2:0]    logic_arbiter_io_output_fork_io_outputs_1_translated_thrown_fifo_io_occupancy;
  wire       [1:0]    logic_rspRouteOh;
  wire                logic_arbiter_io_output_fork_io_outputs_1_translated_valid;
  reg                 logic_arbiter_io_output_fork_io_outputs_1_translated_ready;
  wire       [1:0]    logic_arbiter_io_output_fork_io_outputs_1_translated_payload;
  reg                 logic_arbiter_io_output_fork_io_outputs_1_translated_thrown_valid;
  wire                logic_arbiter_io_output_fork_io_outputs_1_translated_thrown_ready;
  wire       [1:0]    logic_arbiter_io_output_fork_io_outputs_1_translated_thrown_payload;

  StreamArbiter logic_arbiter (
    .io_inputs_0_valid              (io_inputs_0_cmd_valid                          ), //i
    .io_inputs_0_ready              (logic_arbiter_io_inputs_0_ready                ), //o
    .io_inputs_0_payload_write      (io_inputs_0_cmd_payload_write                  ), //i
    .io_inputs_0_payload_address    (io_inputs_0_cmd_payload_address[14:0]          ), //i
    .io_inputs_0_payload_data       (io_inputs_0_cmd_payload_data[31:0]             ), //i
    .io_inputs_0_payload_mask       (io_inputs_0_cmd_payload_mask[3:0]              ), //i
    .io_inputs_1_valid              (io_inputs_1_cmd_valid                          ), //i
    .io_inputs_1_ready              (logic_arbiter_io_inputs_1_ready                ), //o
    .io_inputs_1_payload_write      (io_inputs_1_cmd_payload_write                  ), //i
    .io_inputs_1_payload_address    (io_inputs_1_cmd_payload_address[14:0]          ), //i
    .io_inputs_1_payload_data       (io_inputs_1_cmd_payload_data[31:0]             ), //i
    .io_inputs_1_payload_mask       (io_inputs_1_cmd_payload_mask[3:0]              ), //i
    .io_output_valid                (logic_arbiter_io_output_valid                  ), //o
    .io_output_ready                (logic_arbiter_io_output_fork_io_input_ready    ), //i
    .io_output_payload_write        (logic_arbiter_io_output_payload_write          ), //o
    .io_output_payload_address      (logic_arbiter_io_output_payload_address[14:0]  ), //o
    .io_output_payload_data         (logic_arbiter_io_output_payload_data[31:0]     ), //o
    .io_output_payload_mask         (logic_arbiter_io_output_payload_mask[3:0]      ), //o
    .io_chosen                      (logic_arbiter_io_chosen                        ), //o
    .io_chosenOH                    (logic_arbiter_io_chosenOH[1:0]                 ), //o
    .mainClock                      (mainClock                                      ), //i
    .resetCtrl_systemClockReset     (resetCtrl_systemClockReset                     )  //i
  );
  StreamFork logic_arbiter_io_output_fork (
    .io_input_valid                  (logic_arbiter_io_output_valid                                    ), //i
    .io_input_ready                  (logic_arbiter_io_output_fork_io_input_ready                      ), //o
    .io_input_payload_write          (logic_arbiter_io_output_payload_write                            ), //i
    .io_input_payload_address        (logic_arbiter_io_output_payload_address[14:0]                    ), //i
    .io_input_payload_data           (logic_arbiter_io_output_payload_data[31:0]                       ), //i
    .io_input_payload_mask           (logic_arbiter_io_output_payload_mask[3:0]                        ), //i
    .io_outputs_0_valid              (logic_arbiter_io_output_fork_io_outputs_0_valid                  ), //o
    .io_outputs_0_ready              (io_output_cmd_ready                                              ), //i
    .io_outputs_0_payload_write      (logic_arbiter_io_output_fork_io_outputs_0_payload_write          ), //o
    .io_outputs_0_payload_address    (logic_arbiter_io_output_fork_io_outputs_0_payload_address[14:0]  ), //o
    .io_outputs_0_payload_data       (logic_arbiter_io_output_fork_io_outputs_0_payload_data[31:0]     ), //o
    .io_outputs_0_payload_mask       (logic_arbiter_io_output_fork_io_outputs_0_payload_mask[3:0]      ), //o
    .io_outputs_1_valid              (logic_arbiter_io_output_fork_io_outputs_1_valid                  ), //o
    .io_outputs_1_ready              (logic_arbiter_io_output_fork_io_outputs_1_translated_ready       ), //i
    .io_outputs_1_payload_write      (logic_arbiter_io_output_fork_io_outputs_1_payload_write          ), //o
    .io_outputs_1_payload_address    (logic_arbiter_io_output_fork_io_outputs_1_payload_address[14:0]  ), //o
    .io_outputs_1_payload_data       (logic_arbiter_io_output_fork_io_outputs_1_payload_data[31:0]     ), //o
    .io_outputs_1_payload_mask       (logic_arbiter_io_output_fork_io_outputs_1_payload_mask[3:0]      ), //o
    .mainClock                       (mainClock                                                        ), //i
    .resetCtrl_systemClockReset      (resetCtrl_systemClockReset                                       )  //i
  );
  StreamFifoLowLatency_1 logic_arbiter_io_output_fork_io_outputs_1_translated_thrown_fifo (
    .io_push_valid                 (logic_arbiter_io_output_fork_io_outputs_1_translated_thrown_valid                     ), //i
    .io_push_ready                 (logic_arbiter_io_output_fork_io_outputs_1_translated_thrown_fifo_io_push_ready        ), //o
    .io_push_payload               (logic_arbiter_io_output_fork_io_outputs_1_translated_thrown_payload[1:0]              ), //i
    .io_pop_valid                  (logic_arbiter_io_output_fork_io_outputs_1_translated_thrown_fifo_io_pop_valid         ), //o
    .io_pop_ready                  (io_output_rsp_valid                                                                   ), //i
    .io_pop_payload                (logic_arbiter_io_output_fork_io_outputs_1_translated_thrown_fifo_io_pop_payload[1:0]  ), //o
    .io_flush                      (1'b0                                                                                  ), //i
    .io_occupancy                  (logic_arbiter_io_output_fork_io_outputs_1_translated_thrown_fifo_io_occupancy[2:0]    ), //o
    .mainClock                     (mainClock                                                                             ), //i
    .resetCtrl_systemClockReset    (resetCtrl_systemClockReset                                                            )  //i
  );
  assign io_inputs_0_cmd_ready = logic_arbiter_io_inputs_0_ready;
  assign io_inputs_1_cmd_ready = logic_arbiter_io_inputs_1_ready;
  assign io_output_cmd_valid = logic_arbiter_io_output_fork_io_outputs_0_valid;
  assign io_output_cmd_payload_write = logic_arbiter_io_output_fork_io_outputs_0_payload_write;
  assign io_output_cmd_payload_address = logic_arbiter_io_output_fork_io_outputs_0_payload_address;
  assign io_output_cmd_payload_data = logic_arbiter_io_output_fork_io_outputs_0_payload_data;
  assign io_output_cmd_payload_mask = logic_arbiter_io_output_fork_io_outputs_0_payload_mask;
  assign logic_arbiter_io_output_fork_io_outputs_1_translated_valid = logic_arbiter_io_output_fork_io_outputs_1_valid;
  assign logic_arbiter_io_output_fork_io_outputs_1_translated_payload = logic_arbiter_io_chosenOH;
  always @(*) begin
    logic_arbiter_io_output_fork_io_outputs_1_translated_thrown_valid = logic_arbiter_io_output_fork_io_outputs_1_translated_valid;
    if(logic_arbiter_io_output_fork_io_outputs_1_payload_write) begin
      logic_arbiter_io_output_fork_io_outputs_1_translated_thrown_valid = 1'b0;
    end
  end

  always @(*) begin
    logic_arbiter_io_output_fork_io_outputs_1_translated_ready = logic_arbiter_io_output_fork_io_outputs_1_translated_thrown_ready;
    if(logic_arbiter_io_output_fork_io_outputs_1_payload_write) begin
      logic_arbiter_io_output_fork_io_outputs_1_translated_ready = 1'b1;
    end
  end

  assign logic_arbiter_io_output_fork_io_outputs_1_translated_thrown_payload = logic_arbiter_io_output_fork_io_outputs_1_translated_payload;
  assign logic_arbiter_io_output_fork_io_outputs_1_translated_thrown_ready = logic_arbiter_io_output_fork_io_outputs_1_translated_thrown_fifo_io_push_ready;
  assign logic_rspRouteOh = logic_arbiter_io_output_fork_io_outputs_1_translated_thrown_fifo_io_pop_payload;
  assign io_inputs_0_rsp_valid = (io_output_rsp_valid && logic_rspRouteOh[0]);
  assign io_inputs_0_rsp_payload_data = io_output_rsp_payload_data;
  assign io_inputs_1_rsp_valid = (io_output_rsp_valid && logic_rspRouteOh[1]);
  assign io_inputs_1_rsp_payload_data = io_output_rsp_payload_data;

endmodule

module PipelinedMemoryBusDecoder_1 (
  input               io_input_cmd_valid,
  output reg          io_input_cmd_ready,
  input               io_input_cmd_payload_write,
  input      [31:0]   io_input_cmd_payload_address,
  input      [31:0]   io_input_cmd_payload_data,
  input      [3:0]    io_input_cmd_payload_mask,
  output              io_input_rsp_valid,
  output     [31:0]   io_input_rsp_payload_data,
  output reg          io_outputs_0_cmd_valid,
  input               io_outputs_0_cmd_ready,
  output              io_outputs_0_cmd_payload_write,
  output     [31:0]   io_outputs_0_cmd_payload_address,
  output     [31:0]   io_outputs_0_cmd_payload_data,
  output     [3:0]    io_outputs_0_cmd_payload_mask,
  input               io_outputs_0_rsp_valid,
  input      [31:0]   io_outputs_0_rsp_payload_data,
  output reg          io_outputs_1_cmd_valid,
  input               io_outputs_1_cmd_ready,
  output              io_outputs_1_cmd_payload_write,
  output     [31:0]   io_outputs_1_cmd_payload_address,
  output     [31:0]   io_outputs_1_cmd_payload_data,
  output     [3:0]    io_outputs_1_cmd_payload_mask,
  input               io_outputs_1_rsp_valid,
  input      [31:0]   io_outputs_1_rsp_payload_data,
  output reg          io_outputs_2_cmd_valid,
  input               io_outputs_2_cmd_ready,
  output              io_outputs_2_cmd_payload_write,
  output     [31:0]   io_outputs_2_cmd_payload_address,
  output     [31:0]   io_outputs_2_cmd_payload_data,
  output     [3:0]    io_outputs_2_cmd_payload_mask,
  input               io_outputs_2_rsp_valid,
  input      [31:0]   io_outputs_2_rsp_payload_data,
  output reg          io_outputs_3_cmd_valid,
  input               io_outputs_3_cmd_ready,
  output              io_outputs_3_cmd_payload_write,
  output     [31:0]   io_outputs_3_cmd_payload_address,
  output     [31:0]   io_outputs_3_cmd_payload_data,
  output     [3:0]    io_outputs_3_cmd_payload_mask,
  input               io_outputs_3_rsp_valid,
  input      [31:0]   io_outputs_3_rsp_payload_data,
  output reg          io_outputs_4_cmd_valid,
  input               io_outputs_4_cmd_ready,
  output              io_outputs_4_cmd_payload_write,
  output     [31:0]   io_outputs_4_cmd_payload_address,
  output     [31:0]   io_outputs_4_cmd_payload_data,
  output     [3:0]    io_outputs_4_cmd_payload_mask,
  input               io_outputs_4_rsp_valid,
  input      [31:0]   io_outputs_4_rsp_payload_data,
  output reg          io_outputs_5_cmd_valid,
  input               io_outputs_5_cmd_ready,
  output              io_outputs_5_cmd_payload_write,
  output     [31:0]   io_outputs_5_cmd_payload_address,
  output     [31:0]   io_outputs_5_cmd_payload_data,
  output     [3:0]    io_outputs_5_cmd_payload_mask,
  input               io_outputs_5_rsp_valid,
  input      [31:0]   io_outputs_5_rsp_payload_data,
  output reg          io_outputs_6_cmd_valid,
  input               io_outputs_6_cmd_ready,
  output              io_outputs_6_cmd_payload_write,
  output     [31:0]   io_outputs_6_cmd_payload_address,
  output     [31:0]   io_outputs_6_cmd_payload_data,
  output     [3:0]    io_outputs_6_cmd_payload_mask,
  input               io_outputs_6_rsp_valid,
  input      [31:0]   io_outputs_6_rsp_payload_data,
  output reg          io_outputs_7_cmd_valid,
  input               io_outputs_7_cmd_ready,
  output              io_outputs_7_cmd_payload_write,
  output     [31:0]   io_outputs_7_cmd_payload_address,
  output     [31:0]   io_outputs_7_cmd_payload_data,
  output     [3:0]    io_outputs_7_cmd_payload_mask,
  input               io_outputs_7_rsp_valid,
  input      [31:0]   io_outputs_7_rsp_payload_data,
  input               mainClock,
  input               resetCtrl_systemClockReset
);
  wire                _zz_io_input_cmd_ready;
  wire       [0:0]    _zz_io_input_cmd_ready_1;
  wire       [0:0]    _zz_io_input_cmd_ready_2;
  wire       [1:0]    _zz_logic_rspPendingCounter;
  wire       [1:0]    _zz_logic_rspPendingCounter_1;
  wire       [0:0]    _zz_logic_rspPendingCounter_2;
  wire       [1:0]    _zz_logic_rspPendingCounter_3;
  wire       [0:0]    _zz_logic_rspPendingCounter_4;
  reg        [31:0]   _zz_io_input_rsp_payload_data_3;
  wire       [2:0]    _zz_io_input_rsp_payload_data_4;
  wire                _zz_logic_cmdWait;
  wire                _zz_logic_cmdWait_1;
  wire                logic_hits_0;
  wire                logic_hits_1;
  wire                logic_hits_2;
  wire                logic_hits_3;
  wire                logic_hits_4;
  wire                logic_hits_5;
  wire                logic_hits_6;
  wire                logic_hits_7;
  wire                _zz_io_outputs_0_cmd_payload_write;
  wire                _zz_io_outputs_1_cmd_payload_write;
  wire                _zz_io_outputs_2_cmd_payload_write;
  wire                _zz_io_outputs_3_cmd_payload_write;
  wire                _zz_io_outputs_4_cmd_payload_write;
  wire                _zz_io_outputs_5_cmd_payload_write;
  wire                _zz_io_outputs_6_cmd_payload_write;
  wire                _zz_io_outputs_7_cmd_payload_write;
  wire                logic_noHit;
  reg        [1:0]    logic_rspPendingCounter;
  wire                io_input_cmd_fire;
  wire                io_input_cmd_fire_1;
  reg                 logic_rspHits_0;
  reg                 logic_rspHits_1;
  reg                 logic_rspHits_2;
  reg                 logic_rspHits_3;
  reg                 logic_rspHits_4;
  reg                 logic_rspHits_5;
  reg                 logic_rspHits_6;
  reg                 logic_rspHits_7;
  wire                logic_rspPending;
  wire                logic_rspNoHit;
  wire                _zz_io_input_rsp_payload_data;
  wire                _zz_io_input_rsp_payload_data_1;
  wire                _zz_io_input_rsp_payload_data_2;
  wire                logic_cmdWait;

  assign _zz_logic_rspPendingCounter = (logic_rspPendingCounter + _zz_logic_rspPendingCounter_1);
  assign _zz_logic_rspPendingCounter_2 = (io_input_cmd_fire && (! io_input_cmd_payload_write));
  assign _zz_logic_rspPendingCounter_1 = {1'd0, _zz_logic_rspPendingCounter_2};
  assign _zz_logic_rspPendingCounter_4 = io_input_rsp_valid;
  assign _zz_logic_rspPendingCounter_3 = {1'd0, _zz_logic_rspPendingCounter_4};
  assign _zz_io_input_rsp_payload_data_4 = {_zz_io_input_rsp_payload_data_2,{_zz_io_input_rsp_payload_data_1,_zz_io_input_rsp_payload_data}};
  assign _zz_io_input_cmd_ready = (logic_hits_2 && io_outputs_2_cmd_ready);
  assign _zz_io_input_cmd_ready_1 = (logic_hits_1 && io_outputs_1_cmd_ready);
  assign _zz_io_input_cmd_ready_2 = (logic_hits_0 && io_outputs_0_cmd_ready);
  assign _zz_logic_cmdWait = (logic_hits_0 != logic_rspHits_0);
  assign _zz_logic_cmdWait_1 = (logic_hits_1 != logic_rspHits_1);
  always @(*) begin
    case(_zz_io_input_rsp_payload_data_4)
      3'b000 : begin
        _zz_io_input_rsp_payload_data_3 = io_outputs_0_rsp_payload_data;
      end
      3'b001 : begin
        _zz_io_input_rsp_payload_data_3 = io_outputs_1_rsp_payload_data;
      end
      3'b010 : begin
        _zz_io_input_rsp_payload_data_3 = io_outputs_2_rsp_payload_data;
      end
      3'b011 : begin
        _zz_io_input_rsp_payload_data_3 = io_outputs_3_rsp_payload_data;
      end
      3'b100 : begin
        _zz_io_input_rsp_payload_data_3 = io_outputs_4_rsp_payload_data;
      end
      3'b101 : begin
        _zz_io_input_rsp_payload_data_3 = io_outputs_5_rsp_payload_data;
      end
      3'b110 : begin
        _zz_io_input_rsp_payload_data_3 = io_outputs_6_rsp_payload_data;
      end
      default : begin
        _zz_io_input_rsp_payload_data_3 = io_outputs_7_rsp_payload_data;
      end
    endcase
  end

  assign logic_hits_0 = ((io_input_cmd_payload_address & (~ 32'h00007fff)) == 32'h80000000);
  always @(*) begin
    io_outputs_0_cmd_valid = (io_input_cmd_valid && logic_hits_0);
    if(logic_cmdWait) begin
      io_outputs_0_cmd_valid = 1'b0;
    end
  end

  assign _zz_io_outputs_0_cmd_payload_write = io_input_cmd_payload_write;
  assign io_outputs_0_cmd_payload_write = _zz_io_outputs_0_cmd_payload_write;
  assign io_outputs_0_cmd_payload_address = io_input_cmd_payload_address;
  assign io_outputs_0_cmd_payload_data = io_input_cmd_payload_data;
  assign io_outputs_0_cmd_payload_mask = io_input_cmd_payload_mask;
  assign logic_hits_1 = ((io_input_cmd_payload_address & (~ 32'h00007fff)) == 32'h80008000);
  always @(*) begin
    io_outputs_1_cmd_valid = (io_input_cmd_valid && logic_hits_1);
    if(logic_cmdWait) begin
      io_outputs_1_cmd_valid = 1'b0;
    end
  end

  assign _zz_io_outputs_1_cmd_payload_write = io_input_cmd_payload_write;
  assign io_outputs_1_cmd_payload_write = _zz_io_outputs_1_cmd_payload_write;
  assign io_outputs_1_cmd_payload_address = io_input_cmd_payload_address;
  assign io_outputs_1_cmd_payload_data = io_input_cmd_payload_data;
  assign io_outputs_1_cmd_payload_mask = io_input_cmd_payload_mask;
  assign logic_hits_2 = ((io_input_cmd_payload_address & (~ 32'h00007fff)) == 32'h80010000);
  always @(*) begin
    io_outputs_2_cmd_valid = (io_input_cmd_valid && logic_hits_2);
    if(logic_cmdWait) begin
      io_outputs_2_cmd_valid = 1'b0;
    end
  end

  assign _zz_io_outputs_2_cmd_payload_write = io_input_cmd_payload_write;
  assign io_outputs_2_cmd_payload_write = _zz_io_outputs_2_cmd_payload_write;
  assign io_outputs_2_cmd_payload_address = io_input_cmd_payload_address;
  assign io_outputs_2_cmd_payload_data = io_input_cmd_payload_data;
  assign io_outputs_2_cmd_payload_mask = io_input_cmd_payload_mask;
  assign logic_hits_3 = ((io_input_cmd_payload_address & (~ 32'h00007fff)) == 32'h80018000);
  always @(*) begin
    io_outputs_3_cmd_valid = (io_input_cmd_valid && logic_hits_3);
    if(logic_cmdWait) begin
      io_outputs_3_cmd_valid = 1'b0;
    end
  end

  assign _zz_io_outputs_3_cmd_payload_write = io_input_cmd_payload_write;
  assign io_outputs_3_cmd_payload_write = _zz_io_outputs_3_cmd_payload_write;
  assign io_outputs_3_cmd_payload_address = io_input_cmd_payload_address;
  assign io_outputs_3_cmd_payload_data = io_input_cmd_payload_data;
  assign io_outputs_3_cmd_payload_mask = io_input_cmd_payload_mask;
  assign logic_hits_4 = ((io_input_cmd_payload_address & (~ 32'h00007fff)) == 32'h80020000);
  always @(*) begin
    io_outputs_4_cmd_valid = (io_input_cmd_valid && logic_hits_4);
    if(logic_cmdWait) begin
      io_outputs_4_cmd_valid = 1'b0;
    end
  end

  assign _zz_io_outputs_4_cmd_payload_write = io_input_cmd_payload_write;
  assign io_outputs_4_cmd_payload_write = _zz_io_outputs_4_cmd_payload_write;
  assign io_outputs_4_cmd_payload_address = io_input_cmd_payload_address;
  assign io_outputs_4_cmd_payload_data = io_input_cmd_payload_data;
  assign io_outputs_4_cmd_payload_mask = io_input_cmd_payload_mask;
  assign logic_hits_5 = ((io_input_cmd_payload_address & (~ 32'h00007fff)) == 32'h80028000);
  always @(*) begin
    io_outputs_5_cmd_valid = (io_input_cmd_valid && logic_hits_5);
    if(logic_cmdWait) begin
      io_outputs_5_cmd_valid = 1'b0;
    end
  end

  assign _zz_io_outputs_5_cmd_payload_write = io_input_cmd_payload_write;
  assign io_outputs_5_cmd_payload_write = _zz_io_outputs_5_cmd_payload_write;
  assign io_outputs_5_cmd_payload_address = io_input_cmd_payload_address;
  assign io_outputs_5_cmd_payload_data = io_input_cmd_payload_data;
  assign io_outputs_5_cmd_payload_mask = io_input_cmd_payload_mask;
  assign logic_hits_6 = ((io_input_cmd_payload_address & (~ 32'h00007fff)) == 32'h80030000);
  always @(*) begin
    io_outputs_6_cmd_valid = (io_input_cmd_valid && logic_hits_6);
    if(logic_cmdWait) begin
      io_outputs_6_cmd_valid = 1'b0;
    end
  end

  assign _zz_io_outputs_6_cmd_payload_write = io_input_cmd_payload_write;
  assign io_outputs_6_cmd_payload_write = _zz_io_outputs_6_cmd_payload_write;
  assign io_outputs_6_cmd_payload_address = io_input_cmd_payload_address;
  assign io_outputs_6_cmd_payload_data = io_input_cmd_payload_data;
  assign io_outputs_6_cmd_payload_mask = io_input_cmd_payload_mask;
  assign logic_hits_7 = ((io_input_cmd_payload_address & (~ 32'h00007fff)) == 32'h80038000);
  always @(*) begin
    io_outputs_7_cmd_valid = (io_input_cmd_valid && logic_hits_7);
    if(logic_cmdWait) begin
      io_outputs_7_cmd_valid = 1'b0;
    end
  end

  assign _zz_io_outputs_7_cmd_payload_write = io_input_cmd_payload_write;
  assign io_outputs_7_cmd_payload_write = _zz_io_outputs_7_cmd_payload_write;
  assign io_outputs_7_cmd_payload_address = io_input_cmd_payload_address;
  assign io_outputs_7_cmd_payload_data = io_input_cmd_payload_data;
  assign io_outputs_7_cmd_payload_mask = io_input_cmd_payload_mask;
  assign logic_noHit = (! ({logic_hits_7,{logic_hits_6,{logic_hits_5,{logic_hits_4,{logic_hits_3,{logic_hits_2,{logic_hits_1,logic_hits_0}}}}}}} != 8'h0));
  always @(*) begin
    io_input_cmd_ready = (({(logic_hits_7 && io_outputs_7_cmd_ready),{(logic_hits_6 && io_outputs_6_cmd_ready),{(logic_hits_5 && io_outputs_5_cmd_ready),{(logic_hits_4 && io_outputs_4_cmd_ready),{(logic_hits_3 && io_outputs_3_cmd_ready),{_zz_io_input_cmd_ready,{_zz_io_input_cmd_ready_1,_zz_io_input_cmd_ready_2}}}}}}} != 8'h0) || logic_noHit);
    if(logic_cmdWait) begin
      io_input_cmd_ready = 1'b0;
    end
  end

  assign io_input_cmd_fire = (io_input_cmd_valid && io_input_cmd_ready);
  assign io_input_cmd_fire_1 = (io_input_cmd_valid && io_input_cmd_ready);
  assign logic_rspPending = (logic_rspPendingCounter != 2'b00);
  assign logic_rspNoHit = (! ({logic_rspHits_7,{logic_rspHits_6,{logic_rspHits_5,{logic_rspHits_4,{logic_rspHits_3,{logic_rspHits_2,{logic_rspHits_1,logic_rspHits_0}}}}}}} != 8'h0));
  assign io_input_rsp_valid = (({io_outputs_7_rsp_valid,{io_outputs_6_rsp_valid,{io_outputs_5_rsp_valid,{io_outputs_4_rsp_valid,{io_outputs_3_rsp_valid,{io_outputs_2_rsp_valid,{io_outputs_1_rsp_valid,io_outputs_0_rsp_valid}}}}}}} != 8'h0) || (logic_rspPending && logic_rspNoHit));
  assign _zz_io_input_rsp_payload_data = (((logic_rspHits_1 || logic_rspHits_3) || logic_rspHits_5) || logic_rspHits_7);
  assign _zz_io_input_rsp_payload_data_1 = (((logic_rspHits_2 || logic_rspHits_3) || logic_rspHits_6) || logic_rspHits_7);
  assign _zz_io_input_rsp_payload_data_2 = (((logic_rspHits_4 || logic_rspHits_5) || logic_rspHits_6) || logic_rspHits_7);
  assign io_input_rsp_payload_data = _zz_io_input_rsp_payload_data_3;
  assign logic_cmdWait = (((io_input_cmd_valid && logic_rspPending) && (((((((_zz_logic_cmdWait || _zz_logic_cmdWait_1) || (logic_hits_2 != logic_rspHits_2)) || (logic_hits_3 != logic_rspHits_3)) || (logic_hits_4 != logic_rspHits_4)) || (logic_hits_5 != logic_rspHits_5)) || (logic_hits_6 != logic_rspHits_6)) || (logic_hits_7 != logic_rspHits_7))) || (logic_rspPendingCounter == 2'b11));
  always @(posedge mainClock or posedge resetCtrl_systemClockReset) begin
    if(resetCtrl_systemClockReset) begin
      logic_rspPendingCounter <= 2'b00;
    end else begin
      logic_rspPendingCounter <= (_zz_logic_rspPendingCounter - _zz_logic_rspPendingCounter_3);
    end
  end

  always @(posedge mainClock) begin
    if(io_input_cmd_fire_1) begin
      logic_rspHits_0 <= logic_hits_0;
      logic_rspHits_1 <= logic_hits_1;
      logic_rspHits_2 <= logic_hits_2;
      logic_rspHits_3 <= logic_hits_3;
      logic_rspHits_4 <= logic_hits_4;
      logic_rspHits_5 <= logic_hits_5;
      logic_rspHits_6 <= logic_hits_6;
      logic_rspHits_7 <= logic_hits_7;
    end
  end


endmodule

module PipelinedMemoryBusDecoder (
  input               io_input_cmd_valid,
  output reg          io_input_cmd_ready,
  input               io_input_cmd_payload_write,
  input      [31:0]   io_input_cmd_payload_address,
  input      [31:0]   io_input_cmd_payload_data,
  input      [3:0]    io_input_cmd_payload_mask,
  output              io_input_rsp_valid,
  output     [31:0]   io_input_rsp_payload_data,
  output reg          io_outputs_0_cmd_valid,
  input               io_outputs_0_cmd_ready,
  output              io_outputs_0_cmd_payload_write,
  output     [31:0]   io_outputs_0_cmd_payload_address,
  output     [31:0]   io_outputs_0_cmd_payload_data,
  output     [3:0]    io_outputs_0_cmd_payload_mask,
  input               io_outputs_0_rsp_valid,
  input      [31:0]   io_outputs_0_rsp_payload_data,
  output reg          io_outputs_1_cmd_valid,
  input               io_outputs_1_cmd_ready,
  output              io_outputs_1_cmd_payload_write,
  output     [31:0]   io_outputs_1_cmd_payload_address,
  output     [31:0]   io_outputs_1_cmd_payload_data,
  output     [3:0]    io_outputs_1_cmd_payload_mask,
  input               io_outputs_1_rsp_valid,
  input      [31:0]   io_outputs_1_rsp_payload_data,
  output reg          io_outputs_2_cmd_valid,
  input               io_outputs_2_cmd_ready,
  output              io_outputs_2_cmd_payload_write,
  output     [31:0]   io_outputs_2_cmd_payload_address,
  output     [31:0]   io_outputs_2_cmd_payload_data,
  output     [3:0]    io_outputs_2_cmd_payload_mask,
  input               io_outputs_2_rsp_valid,
  input      [31:0]   io_outputs_2_rsp_payload_data,
  output reg          io_outputs_3_cmd_valid,
  input               io_outputs_3_cmd_ready,
  output              io_outputs_3_cmd_payload_write,
  output     [31:0]   io_outputs_3_cmd_payload_address,
  output     [31:0]   io_outputs_3_cmd_payload_data,
  output     [3:0]    io_outputs_3_cmd_payload_mask,
  input               io_outputs_3_rsp_valid,
  input      [31:0]   io_outputs_3_rsp_payload_data,
  output reg          io_outputs_4_cmd_valid,
  input               io_outputs_4_cmd_ready,
  output              io_outputs_4_cmd_payload_write,
  output     [31:0]   io_outputs_4_cmd_payload_address,
  output     [31:0]   io_outputs_4_cmd_payload_data,
  output     [3:0]    io_outputs_4_cmd_payload_mask,
  input               io_outputs_4_rsp_valid,
  input      [31:0]   io_outputs_4_rsp_payload_data,
  output reg          io_outputs_5_cmd_valid,
  input               io_outputs_5_cmd_ready,
  output              io_outputs_5_cmd_payload_write,
  output     [31:0]   io_outputs_5_cmd_payload_address,
  output     [31:0]   io_outputs_5_cmd_payload_data,
  output     [3:0]    io_outputs_5_cmd_payload_mask,
  input               io_outputs_5_rsp_valid,
  input      [31:0]   io_outputs_5_rsp_payload_data,
  output reg          io_outputs_6_cmd_valid,
  input               io_outputs_6_cmd_ready,
  output              io_outputs_6_cmd_payload_write,
  output     [31:0]   io_outputs_6_cmd_payload_address,
  output     [31:0]   io_outputs_6_cmd_payload_data,
  output     [3:0]    io_outputs_6_cmd_payload_mask,
  input               io_outputs_6_rsp_valid,
  input      [31:0]   io_outputs_6_rsp_payload_data,
  output reg          io_outputs_7_cmd_valid,
  input               io_outputs_7_cmd_ready,
  output              io_outputs_7_cmd_payload_write,
  output     [31:0]   io_outputs_7_cmd_payload_address,
  output     [31:0]   io_outputs_7_cmd_payload_data,
  output     [3:0]    io_outputs_7_cmd_payload_mask,
  input               io_outputs_7_rsp_valid,
  input      [31:0]   io_outputs_7_rsp_payload_data,
  output reg          io_outputs_8_cmd_valid,
  input               io_outputs_8_cmd_ready,
  output              io_outputs_8_cmd_payload_write,
  output     [31:0]   io_outputs_8_cmd_payload_address,
  output     [31:0]   io_outputs_8_cmd_payload_data,
  output     [3:0]    io_outputs_8_cmd_payload_mask,
  input               io_outputs_8_rsp_valid,
  input      [31:0]   io_outputs_8_rsp_payload_data,
  input               mainClock,
  input               resetCtrl_systemClockReset
);
  wire                _zz_io_input_cmd_ready;
  wire       [0:0]    _zz_io_input_cmd_ready_1;
  wire       [1:0]    _zz_io_input_cmd_ready_2;
  wire       [1:0]    _zz_logic_rspPendingCounter;
  wire       [1:0]    _zz_logic_rspPendingCounter_1;
  wire       [0:0]    _zz_logic_rspPendingCounter_2;
  wire       [1:0]    _zz_logic_rspPendingCounter_3;
  wire       [0:0]    _zz_logic_rspPendingCounter_4;
  reg        [31:0]   _zz_io_input_rsp_payload_data_3;
  wire       [3:0]    _zz_io_input_rsp_payload_data_4;
  wire                _zz_logic_cmdWait;
  wire                _zz_logic_cmdWait_1;
  wire                logic_hits_0;
  wire                logic_hits_1;
  wire                logic_hits_2;
  wire                logic_hits_3;
  wire                logic_hits_4;
  wire                logic_hits_5;
  wire                logic_hits_6;
  wire                logic_hits_7;
  wire                logic_hits_8;
  wire                _zz_io_outputs_0_cmd_payload_write;
  wire                _zz_io_outputs_1_cmd_payload_write;
  wire                _zz_io_outputs_2_cmd_payload_write;
  wire                _zz_io_outputs_3_cmd_payload_write;
  wire                _zz_io_outputs_4_cmd_payload_write;
  wire                _zz_io_outputs_5_cmd_payload_write;
  wire                _zz_io_outputs_6_cmd_payload_write;
  wire                _zz_io_outputs_7_cmd_payload_write;
  wire                _zz_io_outputs_8_cmd_payload_write;
  wire                logic_noHit;
  reg        [1:0]    logic_rspPendingCounter;
  wire                io_input_cmd_fire;
  wire                io_input_cmd_fire_1;
  reg                 logic_rspHits_0;
  reg                 logic_rspHits_1;
  reg                 logic_rspHits_2;
  reg                 logic_rspHits_3;
  reg                 logic_rspHits_4;
  reg                 logic_rspHits_5;
  reg                 logic_rspHits_6;
  reg                 logic_rspHits_7;
  reg                 logic_rspHits_8;
  wire                logic_rspPending;
  wire                logic_rspNoHit;
  wire                _zz_io_input_rsp_payload_data;
  wire                _zz_io_input_rsp_payload_data_1;
  wire                _zz_io_input_rsp_payload_data_2;
  wire                logic_cmdWait;

  assign _zz_logic_rspPendingCounter = (logic_rspPendingCounter + _zz_logic_rspPendingCounter_1);
  assign _zz_logic_rspPendingCounter_2 = (io_input_cmd_fire && (! io_input_cmd_payload_write));
  assign _zz_logic_rspPendingCounter_1 = {1'd0, _zz_logic_rspPendingCounter_2};
  assign _zz_logic_rspPendingCounter_4 = io_input_rsp_valid;
  assign _zz_logic_rspPendingCounter_3 = {1'd0, _zz_logic_rspPendingCounter_4};
  assign _zz_io_input_rsp_payload_data_4 = {logic_rspHits_8,{_zz_io_input_rsp_payload_data_2,{_zz_io_input_rsp_payload_data_1,_zz_io_input_rsp_payload_data}}};
  assign _zz_io_input_cmd_ready = (logic_hits_3 && io_outputs_3_cmd_ready);
  assign _zz_io_input_cmd_ready_1 = (logic_hits_2 && io_outputs_2_cmd_ready);
  assign _zz_io_input_cmd_ready_2 = {(logic_hits_1 && io_outputs_1_cmd_ready),(logic_hits_0 && io_outputs_0_cmd_ready)};
  assign _zz_logic_cmdWait = ((logic_hits_0 != logic_rspHits_0) || (logic_hits_1 != logic_rspHits_1));
  assign _zz_logic_cmdWait_1 = (logic_hits_2 != logic_rspHits_2);
  always @(*) begin
    case(_zz_io_input_rsp_payload_data_4)
      4'b0000 : begin
        _zz_io_input_rsp_payload_data_3 = io_outputs_0_rsp_payload_data;
      end
      4'b0001 : begin
        _zz_io_input_rsp_payload_data_3 = io_outputs_1_rsp_payload_data;
      end
      4'b0010 : begin
        _zz_io_input_rsp_payload_data_3 = io_outputs_2_rsp_payload_data;
      end
      4'b0011 : begin
        _zz_io_input_rsp_payload_data_3 = io_outputs_3_rsp_payload_data;
      end
      4'b0100 : begin
        _zz_io_input_rsp_payload_data_3 = io_outputs_4_rsp_payload_data;
      end
      4'b0101 : begin
        _zz_io_input_rsp_payload_data_3 = io_outputs_5_rsp_payload_data;
      end
      4'b0110 : begin
        _zz_io_input_rsp_payload_data_3 = io_outputs_6_rsp_payload_data;
      end
      4'b0111 : begin
        _zz_io_input_rsp_payload_data_3 = io_outputs_7_rsp_payload_data;
      end
      default : begin
        _zz_io_input_rsp_payload_data_3 = io_outputs_8_rsp_payload_data;
      end
    endcase
  end

  assign logic_hits_0 = ((io_input_cmd_payload_address & (~ 32'h00007fff)) == 32'h80000000);
  always @(*) begin
    io_outputs_0_cmd_valid = (io_input_cmd_valid && logic_hits_0);
    if(logic_cmdWait) begin
      io_outputs_0_cmd_valid = 1'b0;
    end
  end

  assign _zz_io_outputs_0_cmd_payload_write = io_input_cmd_payload_write;
  assign io_outputs_0_cmd_payload_write = _zz_io_outputs_0_cmd_payload_write;
  assign io_outputs_0_cmd_payload_address = io_input_cmd_payload_address;
  assign io_outputs_0_cmd_payload_data = io_input_cmd_payload_data;
  assign io_outputs_0_cmd_payload_mask = io_input_cmd_payload_mask;
  assign logic_hits_1 = ((io_input_cmd_payload_address & (~ 32'h00007fff)) == 32'h80008000);
  always @(*) begin
    io_outputs_1_cmd_valid = (io_input_cmd_valid && logic_hits_1);
    if(logic_cmdWait) begin
      io_outputs_1_cmd_valid = 1'b0;
    end
  end

  assign _zz_io_outputs_1_cmd_payload_write = io_input_cmd_payload_write;
  assign io_outputs_1_cmd_payload_write = _zz_io_outputs_1_cmd_payload_write;
  assign io_outputs_1_cmd_payload_address = io_input_cmd_payload_address;
  assign io_outputs_1_cmd_payload_data = io_input_cmd_payload_data;
  assign io_outputs_1_cmd_payload_mask = io_input_cmd_payload_mask;
  assign logic_hits_2 = ((io_input_cmd_payload_address & (~ 32'h00007fff)) == 32'h80010000);
  always @(*) begin
    io_outputs_2_cmd_valid = (io_input_cmd_valid && logic_hits_2);
    if(logic_cmdWait) begin
      io_outputs_2_cmd_valid = 1'b0;
    end
  end

  assign _zz_io_outputs_2_cmd_payload_write = io_input_cmd_payload_write;
  assign io_outputs_2_cmd_payload_write = _zz_io_outputs_2_cmd_payload_write;
  assign io_outputs_2_cmd_payload_address = io_input_cmd_payload_address;
  assign io_outputs_2_cmd_payload_data = io_input_cmd_payload_data;
  assign io_outputs_2_cmd_payload_mask = io_input_cmd_payload_mask;
  assign logic_hits_3 = ((io_input_cmd_payload_address & (~ 32'h00007fff)) == 32'h80018000);
  always @(*) begin
    io_outputs_3_cmd_valid = (io_input_cmd_valid && logic_hits_3);
    if(logic_cmdWait) begin
      io_outputs_3_cmd_valid = 1'b0;
    end
  end

  assign _zz_io_outputs_3_cmd_payload_write = io_input_cmd_payload_write;
  assign io_outputs_3_cmd_payload_write = _zz_io_outputs_3_cmd_payload_write;
  assign io_outputs_3_cmd_payload_address = io_input_cmd_payload_address;
  assign io_outputs_3_cmd_payload_data = io_input_cmd_payload_data;
  assign io_outputs_3_cmd_payload_mask = io_input_cmd_payload_mask;
  assign logic_hits_4 = ((io_input_cmd_payload_address & (~ 32'h00007fff)) == 32'h80020000);
  always @(*) begin
    io_outputs_4_cmd_valid = (io_input_cmd_valid && logic_hits_4);
    if(logic_cmdWait) begin
      io_outputs_4_cmd_valid = 1'b0;
    end
  end

  assign _zz_io_outputs_4_cmd_payload_write = io_input_cmd_payload_write;
  assign io_outputs_4_cmd_payload_write = _zz_io_outputs_4_cmd_payload_write;
  assign io_outputs_4_cmd_payload_address = io_input_cmd_payload_address;
  assign io_outputs_4_cmd_payload_data = io_input_cmd_payload_data;
  assign io_outputs_4_cmd_payload_mask = io_input_cmd_payload_mask;
  assign logic_hits_5 = ((io_input_cmd_payload_address & (~ 32'h00007fff)) == 32'h80028000);
  always @(*) begin
    io_outputs_5_cmd_valid = (io_input_cmd_valid && logic_hits_5);
    if(logic_cmdWait) begin
      io_outputs_5_cmd_valid = 1'b0;
    end
  end

  assign _zz_io_outputs_5_cmd_payload_write = io_input_cmd_payload_write;
  assign io_outputs_5_cmd_payload_write = _zz_io_outputs_5_cmd_payload_write;
  assign io_outputs_5_cmd_payload_address = io_input_cmd_payload_address;
  assign io_outputs_5_cmd_payload_data = io_input_cmd_payload_data;
  assign io_outputs_5_cmd_payload_mask = io_input_cmd_payload_mask;
  assign logic_hits_6 = ((io_input_cmd_payload_address & (~ 32'h00007fff)) == 32'h80030000);
  always @(*) begin
    io_outputs_6_cmd_valid = (io_input_cmd_valid && logic_hits_6);
    if(logic_cmdWait) begin
      io_outputs_6_cmd_valid = 1'b0;
    end
  end

  assign _zz_io_outputs_6_cmd_payload_write = io_input_cmd_payload_write;
  assign io_outputs_6_cmd_payload_write = _zz_io_outputs_6_cmd_payload_write;
  assign io_outputs_6_cmd_payload_address = io_input_cmd_payload_address;
  assign io_outputs_6_cmd_payload_data = io_input_cmd_payload_data;
  assign io_outputs_6_cmd_payload_mask = io_input_cmd_payload_mask;
  assign logic_hits_7 = ((io_input_cmd_payload_address & (~ 32'h00007fff)) == 32'h80038000);
  always @(*) begin
    io_outputs_7_cmd_valid = (io_input_cmd_valid && logic_hits_7);
    if(logic_cmdWait) begin
      io_outputs_7_cmd_valid = 1'b0;
    end
  end

  assign _zz_io_outputs_7_cmd_payload_write = io_input_cmd_payload_write;
  assign io_outputs_7_cmd_payload_write = _zz_io_outputs_7_cmd_payload_write;
  assign io_outputs_7_cmd_payload_address = io_input_cmd_payload_address;
  assign io_outputs_7_cmd_payload_data = io_input_cmd_payload_data;
  assign io_outputs_7_cmd_payload_mask = io_input_cmd_payload_mask;
  assign logic_hits_8 = ((io_input_cmd_payload_address & (~ 32'h000fffff)) == 32'hf0000000);
  always @(*) begin
    io_outputs_8_cmd_valid = (io_input_cmd_valid && logic_hits_8);
    if(logic_cmdWait) begin
      io_outputs_8_cmd_valid = 1'b0;
    end
  end

  assign _zz_io_outputs_8_cmd_payload_write = io_input_cmd_payload_write;
  assign io_outputs_8_cmd_payload_write = _zz_io_outputs_8_cmd_payload_write;
  assign io_outputs_8_cmd_payload_address = io_input_cmd_payload_address;
  assign io_outputs_8_cmd_payload_data = io_input_cmd_payload_data;
  assign io_outputs_8_cmd_payload_mask = io_input_cmd_payload_mask;
  assign logic_noHit = (! ({logic_hits_8,{logic_hits_7,{logic_hits_6,{logic_hits_5,{logic_hits_4,{logic_hits_3,{logic_hits_2,{logic_hits_1,logic_hits_0}}}}}}}} != 9'h0));
  always @(*) begin
    io_input_cmd_ready = (({(logic_hits_8 && io_outputs_8_cmd_ready),{(logic_hits_7 && io_outputs_7_cmd_ready),{(logic_hits_6 && io_outputs_6_cmd_ready),{(logic_hits_5 && io_outputs_5_cmd_ready),{(logic_hits_4 && io_outputs_4_cmd_ready),{_zz_io_input_cmd_ready,{_zz_io_input_cmd_ready_1,_zz_io_input_cmd_ready_2}}}}}}} != 9'h0) || logic_noHit);
    if(logic_cmdWait) begin
      io_input_cmd_ready = 1'b0;
    end
  end

  assign io_input_cmd_fire = (io_input_cmd_valid && io_input_cmd_ready);
  assign io_input_cmd_fire_1 = (io_input_cmd_valid && io_input_cmd_ready);
  assign logic_rspPending = (logic_rspPendingCounter != 2'b00);
  assign logic_rspNoHit = (! ({logic_rspHits_8,{logic_rspHits_7,{logic_rspHits_6,{logic_rspHits_5,{logic_rspHits_4,{logic_rspHits_3,{logic_rspHits_2,{logic_rspHits_1,logic_rspHits_0}}}}}}}} != 9'h0));
  assign io_input_rsp_valid = (({io_outputs_8_rsp_valid,{io_outputs_7_rsp_valid,{io_outputs_6_rsp_valid,{io_outputs_5_rsp_valid,{io_outputs_4_rsp_valid,{io_outputs_3_rsp_valid,{io_outputs_2_rsp_valid,{io_outputs_1_rsp_valid,io_outputs_0_rsp_valid}}}}}}}} != 9'h0) || (logic_rspPending && logic_rspNoHit));
  assign _zz_io_input_rsp_payload_data = (((logic_rspHits_1 || logic_rspHits_3) || logic_rspHits_5) || logic_rspHits_7);
  assign _zz_io_input_rsp_payload_data_1 = (((logic_rspHits_2 || logic_rspHits_3) || logic_rspHits_6) || logic_rspHits_7);
  assign _zz_io_input_rsp_payload_data_2 = (((logic_rspHits_4 || logic_rspHits_5) || logic_rspHits_6) || logic_rspHits_7);
  assign io_input_rsp_payload_data = _zz_io_input_rsp_payload_data_3;
  assign logic_cmdWait = (((io_input_cmd_valid && logic_rspPending) && (((((((_zz_logic_cmdWait || _zz_logic_cmdWait_1) || (logic_hits_3 != logic_rspHits_3)) || (logic_hits_4 != logic_rspHits_4)) || (logic_hits_5 != logic_rspHits_5)) || (logic_hits_6 != logic_rspHits_6)) || (logic_hits_7 != logic_rspHits_7)) || (logic_hits_8 != logic_rspHits_8))) || (logic_rspPendingCounter == 2'b11));
  always @(posedge mainClock or posedge resetCtrl_systemClockReset) begin
    if(resetCtrl_systemClockReset) begin
      logic_rspPendingCounter <= 2'b00;
    end else begin
      logic_rspPendingCounter <= (_zz_logic_rspPendingCounter - _zz_logic_rspPendingCounter_3);
    end
  end

  always @(posedge mainClock) begin
    if(io_input_cmd_fire_1) begin
      logic_rspHits_0 <= logic_hits_0;
      logic_rspHits_1 <= logic_hits_1;
      logic_rspHits_2 <= logic_hits_2;
      logic_rspHits_3 <= logic_hits_3;
      logic_rspHits_4 <= logic_hits_4;
      logic_rspHits_5 <= logic_hits_5;
      logic_rspHits_6 <= logic_hits_6;
      logic_rspHits_7 <= logic_hits_7;
      logic_rspHits_8 <= logic_hits_8;
    end
  end


endmodule

module Apb3Router (
  input      [19:0]   io_input_PADDR,
  input      [3:0]    io_input_PSEL,
  input               io_input_PENABLE,
  output              io_input_PREADY,
  input               io_input_PWRITE,
  input      [31:0]   io_input_PWDATA,
  output     [31:0]   io_input_PRDATA,
  output              io_input_PSLVERROR,
  output     [19:0]   io_outputs_0_PADDR,
  output     [0:0]    io_outputs_0_PSEL,
  output              io_outputs_0_PENABLE,
  input               io_outputs_0_PREADY,
  output              io_outputs_0_PWRITE,
  output     [31:0]   io_outputs_0_PWDATA,
  input      [31:0]   io_outputs_0_PRDATA,
  input               io_outputs_0_PSLVERROR,
  output     [19:0]   io_outputs_1_PADDR,
  output     [0:0]    io_outputs_1_PSEL,
  output              io_outputs_1_PENABLE,
  input               io_outputs_1_PREADY,
  output              io_outputs_1_PWRITE,
  output     [31:0]   io_outputs_1_PWDATA,
  input      [31:0]   io_outputs_1_PRDATA,
  input               io_outputs_1_PSLVERROR,
  output     [19:0]   io_outputs_2_PADDR,
  output     [0:0]    io_outputs_2_PSEL,
  output              io_outputs_2_PENABLE,
  input               io_outputs_2_PREADY,
  output              io_outputs_2_PWRITE,
  output     [31:0]   io_outputs_2_PWDATA,
  input      [31:0]   io_outputs_2_PRDATA,
  input               io_outputs_2_PSLVERROR,
  output     [19:0]   io_outputs_3_PADDR,
  output     [0:0]    io_outputs_3_PSEL,
  output              io_outputs_3_PENABLE,
  input               io_outputs_3_PREADY,
  output              io_outputs_3_PWRITE,
  output     [31:0]   io_outputs_3_PWDATA,
  input      [31:0]   io_outputs_3_PRDATA,
  input               io_outputs_3_PSLVERROR,
  input               mainClock,
  input               resetCtrl_systemClockReset
);
  reg                 _zz_io_input_PREADY;
  reg        [31:0]   _zz_io_input_PRDATA;
  reg                 _zz_io_input_PSLVERROR;
  wire                _zz_selIndex;
  wire                _zz_selIndex_1;
  wire                _zz_selIndex_2;
  reg        [1:0]    selIndex;

  always @(*) begin
    case(selIndex)
      2'b00 : begin
        _zz_io_input_PREADY = io_outputs_0_PREADY;
        _zz_io_input_PRDATA = io_outputs_0_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_0_PSLVERROR;
      end
      2'b01 : begin
        _zz_io_input_PREADY = io_outputs_1_PREADY;
        _zz_io_input_PRDATA = io_outputs_1_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_1_PSLVERROR;
      end
      2'b10 : begin
        _zz_io_input_PREADY = io_outputs_2_PREADY;
        _zz_io_input_PRDATA = io_outputs_2_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_2_PSLVERROR;
      end
      default : begin
        _zz_io_input_PREADY = io_outputs_3_PREADY;
        _zz_io_input_PRDATA = io_outputs_3_PRDATA;
        _zz_io_input_PSLVERROR = io_outputs_3_PSLVERROR;
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
  assign _zz_selIndex = io_input_PSEL[3];
  assign _zz_selIndex_1 = (io_input_PSEL[1] || _zz_selIndex);
  assign _zz_selIndex_2 = (io_input_PSEL[2] || _zz_selIndex);
  assign io_input_PREADY = _zz_io_input_PREADY;
  assign io_input_PRDATA = _zz_io_input_PRDATA;
  assign io_input_PSLVERROR = _zz_io_input_PSLVERROR;
  always @(posedge mainClock) begin
    selIndex <= {_zz_selIndex_2,_zz_selIndex_1};
  end


endmodule

module Apb3Decoder (
  input      [19:0]   io_input_PADDR,
  input      [0:0]    io_input_PSEL,
  input               io_input_PENABLE,
  output reg          io_input_PREADY,
  input               io_input_PWRITE,
  input      [31:0]   io_input_PWDATA,
  output     [31:0]   io_input_PRDATA,
  output reg          io_input_PSLVERROR,
  output     [19:0]   io_output_PADDR,
  output reg [3:0]    io_output_PSEL,
  output              io_output_PENABLE,
  input               io_output_PREADY,
  output              io_output_PWRITE,
  output     [31:0]   io_output_PWDATA,
  input      [31:0]   io_output_PRDATA,
  input               io_output_PSLVERROR
);
  wire                when_Apb3Decoder_l88;

  assign io_output_PADDR = io_input_PADDR;
  assign io_output_PENABLE = io_input_PENABLE;
  assign io_output_PWRITE = io_input_PWRITE;
  assign io_output_PWDATA = io_input_PWDATA;
  always @(*) begin
    io_output_PSEL[0] = (((io_input_PADDR & (~ 20'h0ffff)) == 20'h10000) && io_input_PSEL[0]);
    io_output_PSEL[1] = (((io_input_PADDR & (~ 20'h0ffff)) == 20'hb0000) && io_input_PSEL[0]);
    io_output_PSEL[2] = (((io_input_PADDR & (~ 20'h0ffff)) == 20'h0) && io_input_PSEL[0]);
    io_output_PSEL[3] = (((io_input_PADDR & (~ 20'h0ffff)) == 20'ha0000) && io_input_PSEL[0]);
  end

  always @(*) begin
    io_input_PREADY = io_output_PREADY;
    if(when_Apb3Decoder_l88) begin
      io_input_PREADY = 1'b1;
    end
  end

  assign io_input_PRDATA = io_output_PRDATA;
  always @(*) begin
    io_input_PSLVERROR = io_output_PSLVERROR;
    if(when_Apb3Decoder_l88) begin
      io_input_PSLVERROR = 1'b1;
    end
  end

  assign when_Apb3Decoder_l88 = (io_input_PSEL[0] && (io_output_PSEL == 4'b0000));

endmodule

module PipelinedMemoryBusToApbBridge (
  input               io_pipelinedMemoryBus_cmd_valid,
  output              io_pipelinedMemoryBus_cmd_ready,
  input               io_pipelinedMemoryBus_cmd_payload_write,
  input      [31:0]   io_pipelinedMemoryBus_cmd_payload_address,
  input      [31:0]   io_pipelinedMemoryBus_cmd_payload_data,
  input      [3:0]    io_pipelinedMemoryBus_cmd_payload_mask,
  output              io_pipelinedMemoryBus_rsp_valid,
  output     [31:0]   io_pipelinedMemoryBus_rsp_payload_data,
  output     [19:0]   io_apb_PADDR,
  output     [0:0]    io_apb_PSEL,
  output              io_apb_PENABLE,
  input               io_apb_PREADY,
  output              io_apb_PWRITE,
  output     [31:0]   io_apb_PWDATA,
  input      [31:0]   io_apb_PRDATA,
  input               io_apb_PSLVERROR,
  input               mainClock,
  input               resetCtrl_systemClockReset
);
  wire                pipelinedMemoryBusStage_cmd_valid;
  reg                 pipelinedMemoryBusStage_cmd_ready;
  wire                pipelinedMemoryBusStage_cmd_payload_write;
  wire       [31:0]   pipelinedMemoryBusStage_cmd_payload_address;
  wire       [31:0]   pipelinedMemoryBusStage_cmd_payload_data;
  wire       [3:0]    pipelinedMemoryBusStage_cmd_payload_mask;
  reg                 pipelinedMemoryBusStage_rsp_valid;
  wire       [31:0]   pipelinedMemoryBusStage_rsp_payload_data;
  wire                io_pipelinedMemoryBus_cmd_halfPipe_valid;
  wire                io_pipelinedMemoryBus_cmd_halfPipe_ready;
  wire                io_pipelinedMemoryBus_cmd_halfPipe_payload_write;
  wire       [31:0]   io_pipelinedMemoryBus_cmd_halfPipe_payload_address;
  wire       [31:0]   io_pipelinedMemoryBus_cmd_halfPipe_payload_data;
  wire       [3:0]    io_pipelinedMemoryBus_cmd_halfPipe_payload_mask;
  reg                 io_pipelinedMemoryBus_cmd_rValid;
  wire                io_pipelinedMemoryBus_cmd_halfPipe_fire;
  reg                 io_pipelinedMemoryBus_cmd_rData_write;
  reg        [31:0]   io_pipelinedMemoryBus_cmd_rData_address;
  reg        [31:0]   io_pipelinedMemoryBus_cmd_rData_data;
  reg        [3:0]    io_pipelinedMemoryBus_cmd_rData_mask;
  reg                 pipelinedMemoryBusStage_rsp_regNext_valid;
  reg        [31:0]   pipelinedMemoryBusStage_rsp_regNext_payload_data;
  reg                 state;
  wire                when_PipelinedMemoryBus_l369;

  assign io_pipelinedMemoryBus_cmd_halfPipe_fire = (io_pipelinedMemoryBus_cmd_halfPipe_valid && io_pipelinedMemoryBus_cmd_halfPipe_ready);
  assign io_pipelinedMemoryBus_cmd_ready = (! io_pipelinedMemoryBus_cmd_rValid);
  assign io_pipelinedMemoryBus_cmd_halfPipe_valid = io_pipelinedMemoryBus_cmd_rValid;
  assign io_pipelinedMemoryBus_cmd_halfPipe_payload_write = io_pipelinedMemoryBus_cmd_rData_write;
  assign io_pipelinedMemoryBus_cmd_halfPipe_payload_address = io_pipelinedMemoryBus_cmd_rData_address;
  assign io_pipelinedMemoryBus_cmd_halfPipe_payload_data = io_pipelinedMemoryBus_cmd_rData_data;
  assign io_pipelinedMemoryBus_cmd_halfPipe_payload_mask = io_pipelinedMemoryBus_cmd_rData_mask;
  assign pipelinedMemoryBusStage_cmd_valid = io_pipelinedMemoryBus_cmd_halfPipe_valid;
  assign io_pipelinedMemoryBus_cmd_halfPipe_ready = pipelinedMemoryBusStage_cmd_ready;
  assign pipelinedMemoryBusStage_cmd_payload_write = io_pipelinedMemoryBus_cmd_halfPipe_payload_write;
  assign pipelinedMemoryBusStage_cmd_payload_address = io_pipelinedMemoryBus_cmd_halfPipe_payload_address;
  assign pipelinedMemoryBusStage_cmd_payload_data = io_pipelinedMemoryBus_cmd_halfPipe_payload_data;
  assign pipelinedMemoryBusStage_cmd_payload_mask = io_pipelinedMemoryBus_cmd_halfPipe_payload_mask;
  assign io_pipelinedMemoryBus_rsp_valid = pipelinedMemoryBusStage_rsp_regNext_valid;
  assign io_pipelinedMemoryBus_rsp_payload_data = pipelinedMemoryBusStage_rsp_regNext_payload_data;
  always @(*) begin
    pipelinedMemoryBusStage_cmd_ready = 1'b0;
    if(!when_PipelinedMemoryBus_l369) begin
      if(io_apb_PREADY) begin
        pipelinedMemoryBusStage_cmd_ready = 1'b1;
      end
    end
  end

  assign io_apb_PSEL[0] = pipelinedMemoryBusStage_cmd_valid;
  assign io_apb_PENABLE = state;
  assign io_apb_PWRITE = pipelinedMemoryBusStage_cmd_payload_write;
  assign io_apb_PADDR = pipelinedMemoryBusStage_cmd_payload_address[19:0];
  assign io_apb_PWDATA = pipelinedMemoryBusStage_cmd_payload_data;
  always @(*) begin
    pipelinedMemoryBusStage_rsp_valid = 1'b0;
    if(!when_PipelinedMemoryBus_l369) begin
      if(io_apb_PREADY) begin
        pipelinedMemoryBusStage_rsp_valid = (! pipelinedMemoryBusStage_cmd_payload_write);
      end
    end
  end

  assign pipelinedMemoryBusStage_rsp_payload_data = io_apb_PRDATA;
  assign when_PipelinedMemoryBus_l369 = (! state);
  always @(posedge mainClock or posedge resetCtrl_systemClockReset) begin
    if(resetCtrl_systemClockReset) begin
      io_pipelinedMemoryBus_cmd_rValid <= 1'b0;
      pipelinedMemoryBusStage_rsp_regNext_valid <= 1'b0;
      state <= 1'b0;
    end else begin
      if(io_pipelinedMemoryBus_cmd_valid) begin
        io_pipelinedMemoryBus_cmd_rValid <= 1'b1;
      end
      if(io_pipelinedMemoryBus_cmd_halfPipe_fire) begin
        io_pipelinedMemoryBus_cmd_rValid <= 1'b0;
      end
      pipelinedMemoryBusStage_rsp_regNext_valid <= pipelinedMemoryBusStage_rsp_valid;
      if(when_PipelinedMemoryBus_l369) begin
        state <= pipelinedMemoryBusStage_cmd_valid;
      end else begin
        if(io_apb_PREADY) begin
          state <= 1'b0;
        end
      end
    end
  end

  always @(posedge mainClock) begin
    if(io_pipelinedMemoryBus_cmd_ready) begin
      io_pipelinedMemoryBus_cmd_rData_write <= io_pipelinedMemoryBus_cmd_payload_write;
      io_pipelinedMemoryBus_cmd_rData_address <= io_pipelinedMemoryBus_cmd_payload_address;
      io_pipelinedMemoryBus_cmd_rData_data <= io_pipelinedMemoryBus_cmd_payload_data;
      io_pipelinedMemoryBus_cmd_rData_mask <= io_pipelinedMemoryBus_cmd_payload_mask;
    end
    pipelinedMemoryBusStage_rsp_regNext_payload_data <= pipelinedMemoryBusStage_rsp_payload_data;
  end


endmodule

//PipelinedMemoryBusVEHEP replaced by PipelinedMemoryBusVEHEP

//PipelinedMemoryBusVEHEP replaced by PipelinedMemoryBusVEHEP

//PipelinedMemoryBusVEHEP replaced by PipelinedMemoryBusVEHEP

//PipelinedMemoryBusVEHEP replaced by PipelinedMemoryBusVEHEP

//PipelinedMemoryBusVEHEP replaced by PipelinedMemoryBusVEHEP

//PipelinedMemoryBusVEHEP replaced by PipelinedMemoryBusVEHEP

//PipelinedMemoryBusVEHEP replaced by PipelinedMemoryBusVEHEP

module PipelinedMemoryBusVEHEP (
  input               io_clk,
  input               io_bus_cmd_valid,
  output              io_bus_cmd_ready,
  input               io_bus_cmd_payload_write,
  input      [14:0]   io_bus_cmd_payload_address,
  input      [31:0]   io_bus_cmd_payload_data,
  input      [3:0]    io_bus_cmd_payload_mask,
  output              io_bus_rsp_valid,
  output     [31:0]   io_bus_rsp_payload_data,
  input               mainClock,
  input               resetCtrl_systemClockReset
);
  wire                sram_A_REN;
  wire       [12:0]   sram_A_ADDR;
  reg        [31:0]   sram_A_BM;
  wire       [31:0]   sram_A_DOUT;
  wire       [12:0]   _zz_A_ADDR;
  wire                io_bus_cmd_fire;
  reg                 _zz_io_bus_rsp_valid;
  reg                 _zz_io_bus_rsp_valid_1;
  reg        [31:0]   sram_A_DOUT_regNext;

  assign _zz_A_ADDR = (io_bus_cmd_payload_address >>> 2);
  RM_IHPSG13_1P_8192x32_c4_bm_bist sram (
    .A_CLK          (io_clk                         ), //i
    .A_MEN          (1'b1                           ), //i
    .A_WEN          (io_bus_cmd_payload_write       ), //i
    .A_REN          (sram_A_REN                     ), //i
    .A_ADDR         (sram_A_ADDR[12:0]              ), //i
    .A_DIN          (io_bus_cmd_payload_data[31:0]  ), //i
    .A_DLY          (1'b1                           ), //i
    .A_DOUT         (sram_A_DOUT[31:0]              ), //o
    .A_BM           (sram_A_BM[31:0]                ), //i
    .A_BIST_CLK     (io_clk                         ), //i
    .A_BIST_MEN     (1'b0                           ), //i
    .A_BIST_EN      (1'b0                           ), //i
    .A_BIST_WEN     (1'b0                           ), //i
    .A_BIST_REN     (1'b0                           ), //i
    .A_BIST_ADDR    (13'h0                          ), //i
    .A_BIST_DIN     (32'h0                          ), //i
    .A_BIST_BM      (32'h0                          )  //i
  );
  assign io_bus_cmd_fire = (io_bus_cmd_valid && io_bus_cmd_ready);
  assign io_bus_rsp_valid = _zz_io_bus_rsp_valid_1;
  assign sram_A_ADDR = _zz_A_ADDR;
  assign sram_A_REN = (! io_bus_cmd_payload_write);
  always @(*) begin
    sram_A_BM[0] = io_bus_cmd_payload_mask[0];
    sram_A_BM[1] = io_bus_cmd_payload_mask[0];
    sram_A_BM[2] = io_bus_cmd_payload_mask[0];
    sram_A_BM[3] = io_bus_cmd_payload_mask[0];
    sram_A_BM[4] = io_bus_cmd_payload_mask[0];
    sram_A_BM[5] = io_bus_cmd_payload_mask[0];
    sram_A_BM[6] = io_bus_cmd_payload_mask[0];
    sram_A_BM[7] = io_bus_cmd_payload_mask[0];
    sram_A_BM[8] = io_bus_cmd_payload_mask[1];
    sram_A_BM[9] = io_bus_cmd_payload_mask[1];
    sram_A_BM[10] = io_bus_cmd_payload_mask[1];
    sram_A_BM[11] = io_bus_cmd_payload_mask[1];
    sram_A_BM[12] = io_bus_cmd_payload_mask[1];
    sram_A_BM[13] = io_bus_cmd_payload_mask[1];
    sram_A_BM[14] = io_bus_cmd_payload_mask[1];
    sram_A_BM[15] = io_bus_cmd_payload_mask[1];
    sram_A_BM[16] = io_bus_cmd_payload_mask[2];
    sram_A_BM[17] = io_bus_cmd_payload_mask[2];
    sram_A_BM[18] = io_bus_cmd_payload_mask[2];
    sram_A_BM[19] = io_bus_cmd_payload_mask[2];
    sram_A_BM[20] = io_bus_cmd_payload_mask[2];
    sram_A_BM[21] = io_bus_cmd_payload_mask[2];
    sram_A_BM[22] = io_bus_cmd_payload_mask[2];
    sram_A_BM[23] = io_bus_cmd_payload_mask[2];
    sram_A_BM[24] = io_bus_cmd_payload_mask[3];
    sram_A_BM[25] = io_bus_cmd_payload_mask[3];
    sram_A_BM[26] = io_bus_cmd_payload_mask[3];
    sram_A_BM[27] = io_bus_cmd_payload_mask[3];
    sram_A_BM[28] = io_bus_cmd_payload_mask[3];
    sram_A_BM[29] = io_bus_cmd_payload_mask[3];
    sram_A_BM[30] = io_bus_cmd_payload_mask[3];
    sram_A_BM[31] = io_bus_cmd_payload_mask[3];
  end

  assign io_bus_rsp_payload_data = sram_A_DOUT_regNext;
  assign io_bus_cmd_ready = 1'b1;
  always @(posedge mainClock or posedge resetCtrl_systemClockReset) begin
    if(resetCtrl_systemClockReset) begin
      _zz_io_bus_rsp_valid <= 1'b0;
      _zz_io_bus_rsp_valid_1 <= 1'b0;
      sram_A_DOUT_regNext <= 32'h0;
    end else begin
      _zz_io_bus_rsp_valid <= (io_bus_cmd_fire && (! io_bus_cmd_payload_write));
      _zz_io_bus_rsp_valid_1 <= _zz_io_bus_rsp_valid;
      sram_A_DOUT_regNext <= sram_A_DOUT;
    end
  end


endmodule

module Apb3SpiSlaveCtrl (
  input      [7:0]    io_apb_PADDR,
  input      [0:0]    io_apb_PSEL,
  input               io_apb_PENABLE,
  output              io_apb_PREADY,
  input               io_apb_PWRITE,
  input      [31:0]   io_apb_PWDATA,
  output reg [31:0]   io_apb_PRDATA,
  input               io_spi_sclk,
  input               io_spi_mosi,
  output              io_spi_miso_write,
  output              io_spi_miso_writeEnable,
  input               io_spi_ss,
  output              io_interrupt,
  input               mainClock,
  input               resetCtrl_systemClockReset
);
  reg                 spiCtrl_io_rx_takeWhen_queueWithOccupancy_io_pop_ready;
  wire                spiCtrl_io_rx_valid;
  wire       [7:0]    spiCtrl_io_rx_payload;
  wire                spiCtrl_io_tx_ready;
  wire                spiCtrl_io_txError;
  wire                spiCtrl_io_ssFilted;
  wire                spiCtrl_io_spi_miso_write;
  wire                spiCtrl_io_spi_miso_writeEnable;
  wire                bridge_txLogic_streamUnbuffered_queueWithAvailability_io_push_ready;
  wire                bridge_txLogic_streamUnbuffered_queueWithAvailability_io_pop_valid;
  wire       [7:0]    bridge_txLogic_streamUnbuffered_queueWithAvailability_io_pop_payload;
  wire       [5:0]    bridge_txLogic_streamUnbuffered_queueWithAvailability_io_occupancy;
  wire       [5:0]    bridge_txLogic_streamUnbuffered_queueWithAvailability_io_availability;
  wire                spiCtrl_io_rx_takeWhen_queueWithOccupancy_io_push_ready;
  wire                spiCtrl_io_rx_takeWhen_queueWithOccupancy_io_pop_valid;
  wire       [7:0]    spiCtrl_io_rx_takeWhen_queueWithOccupancy_io_pop_payload;
  wire       [5:0]    spiCtrl_io_rx_takeWhen_queueWithOccupancy_io_occupancy;
  wire       [5:0]    spiCtrl_io_rx_takeWhen_queueWithOccupancy_io_availability;
  wire       [0:0]    _zz_bridge_interruptCtrl_ssEnabledInt;
  wire       [0:0]    _zz_bridge_interruptCtrl_ssDisabledInt;
  wire                busCtrl_askWrite;
  wire                busCtrl_askRead;
  wire                busCtrl_doWrite;
  wire                busCtrl_doRead;
  reg                 _zz_bridge_txLogic_streamUnbuffered_valid;
  wire                bridge_txLogic_streamUnbuffered_valid;
  wire                bridge_txLogic_streamUnbuffered_ready;
  wire       [7:0]    bridge_txLogic_streamUnbuffered_payload;
  reg                 bridge_rxLogic_listen;
  wire                spiCtrl_io_rx_takeWhen_valid;
  wire       [7:0]    spiCtrl_io_rx_takeWhen_payload;
  reg                 bridge_interruptCtrl_txIntEnable;
  reg                 bridge_interruptCtrl_rxIntEnable;
  reg                 bridge_interruptCtrl_ssEnabledIntEnable;
  reg                 bridge_interruptCtrl_ssDisabledIntEnable;
  wire                bridge_interruptCtrl_ssFiltedEdges_rise;
  wire                bridge_interruptCtrl_ssFiltedEdges_fall;
  wire                bridge_interruptCtrl_ssFiltedEdges_toggle;
  reg                 spiCtrl_io_ssFilted_regNext;
  wire                bridge_interruptCtrl_txInt;
  wire                bridge_interruptCtrl_rxInt;
  reg                 bridge_interruptCtrl_ssEnabledInt;
  wire                when_SpiSlaveCtrl_l97;
  reg                 bridge_interruptCtrl_ssDisabledInt;
  wire                when_SpiSlaveCtrl_l98;
  reg                 when_BusSlaveFactory_l335;
  wire                when_BusSlaveFactory_l337;
  reg                 when_BusSlaveFactory_l335_1;
  wire                when_BusSlaveFactory_l337_1;
  wire                bridge_interruptCtrl_interrupt;
  reg                 _zz_io_kind_cpol;
  reg                 _zz_io_kind_cpha;
  wire       [1:0]    _zz_io_kind_cpol_1;

  assign _zz_bridge_interruptCtrl_ssEnabledInt = 1'b0;
  assign _zz_bridge_interruptCtrl_ssDisabledInt = 1'b0;
  SpiSlaveCtrl spiCtrl (
    .io_kind_cpol                  (_zz_io_kind_cpol                                                           ), //i
    .io_kind_cpha                  (_zz_io_kind_cpha                                                           ), //i
    .io_rx_valid                   (spiCtrl_io_rx_valid                                                        ), //o
    .io_rx_payload                 (spiCtrl_io_rx_payload[7:0]                                                 ), //o
    .io_tx_valid                   (bridge_txLogic_streamUnbuffered_queueWithAvailability_io_pop_valid         ), //i
    .io_tx_ready                   (spiCtrl_io_tx_ready                                                        ), //o
    .io_tx_payload                 (bridge_txLogic_streamUnbuffered_queueWithAvailability_io_pop_payload[7:0]  ), //i
    .io_txError                    (spiCtrl_io_txError                                                         ), //o
    .io_ssFilted                   (spiCtrl_io_ssFilted                                                        ), //o
    .io_spi_sclk                   (io_spi_sclk                                                                ), //i
    .io_spi_mosi                   (io_spi_mosi                                                                ), //i
    .io_spi_miso_write             (spiCtrl_io_spi_miso_write                                                  ), //o
    .io_spi_miso_writeEnable       (spiCtrl_io_spi_miso_writeEnable                                            ), //o
    .io_spi_ss                     (io_spi_ss                                                                  ), //i
    .mainClock                     (mainClock                                                                  ), //i
    .resetCtrl_systemClockReset    (resetCtrl_systemClockReset                                                 )  //i
  );
  StreamFifo_5 bridge_txLogic_streamUnbuffered_queueWithAvailability (
    .io_push_valid                 (bridge_txLogic_streamUnbuffered_valid                                       ), //i
    .io_push_ready                 (bridge_txLogic_streamUnbuffered_queueWithAvailability_io_push_ready         ), //o
    .io_push_payload               (bridge_txLogic_streamUnbuffered_payload[7:0]                                ), //i
    .io_pop_valid                  (bridge_txLogic_streamUnbuffered_queueWithAvailability_io_pop_valid          ), //o
    .io_pop_ready                  (spiCtrl_io_tx_ready                                                         ), //i
    .io_pop_payload                (bridge_txLogic_streamUnbuffered_queueWithAvailability_io_pop_payload[7:0]   ), //o
    .io_flush                      (1'b0                                                                        ), //i
    .io_occupancy                  (bridge_txLogic_streamUnbuffered_queueWithAvailability_io_occupancy[5:0]     ), //o
    .io_availability               (bridge_txLogic_streamUnbuffered_queueWithAvailability_io_availability[5:0]  ), //o
    .mainClock                     (mainClock                                                                   ), //i
    .resetCtrl_systemClockReset    (resetCtrl_systemClockReset                                                  )  //i
  );
  StreamFifo_5 spiCtrl_io_rx_takeWhen_queueWithOccupancy (
    .io_push_valid                 (spiCtrl_io_rx_takeWhen_valid                                    ), //i
    .io_push_ready                 (spiCtrl_io_rx_takeWhen_queueWithOccupancy_io_push_ready         ), //o
    .io_push_payload               (spiCtrl_io_rx_takeWhen_payload[7:0]                             ), //i
    .io_pop_valid                  (spiCtrl_io_rx_takeWhen_queueWithOccupancy_io_pop_valid          ), //o
    .io_pop_ready                  (spiCtrl_io_rx_takeWhen_queueWithOccupancy_io_pop_ready          ), //i
    .io_pop_payload                (spiCtrl_io_rx_takeWhen_queueWithOccupancy_io_pop_payload[7:0]   ), //o
    .io_flush                      (1'b0                                                            ), //i
    .io_occupancy                  (spiCtrl_io_rx_takeWhen_queueWithOccupancy_io_occupancy[5:0]     ), //o
    .io_availability               (spiCtrl_io_rx_takeWhen_queueWithOccupancy_io_availability[5:0]  ), //o
    .mainClock                     (mainClock                                                       ), //i
    .resetCtrl_systemClockReset    (resetCtrl_systemClockReset                                      )  //i
  );
  assign io_spi_miso_write = spiCtrl_io_spi_miso_write;
  assign io_spi_miso_writeEnable = spiCtrl_io_spi_miso_writeEnable;
  assign io_apb_PREADY = 1'b1;
  always @(*) begin
    io_apb_PRDATA = 32'h0;
    case(io_apb_PADDR)
      8'h0 : begin
        io_apb_PRDATA[31 : 31] = (spiCtrl_io_rx_takeWhen_queueWithOccupancy_io_pop_valid ^ 1'b0);
        io_apb_PRDATA[7 : 0] = spiCtrl_io_rx_takeWhen_queueWithOccupancy_io_pop_payload;
        io_apb_PRDATA[21 : 16] = spiCtrl_io_rx_takeWhen_queueWithOccupancy_io_occupancy;
      end
      8'h04 : begin
        io_apb_PRDATA[21 : 16] = bridge_txLogic_streamUnbuffered_queueWithAvailability_io_availability;
        io_apb_PRDATA[15 : 15] = bridge_rxLogic_listen;
        io_apb_PRDATA[0 : 0] = bridge_interruptCtrl_txIntEnable;
        io_apb_PRDATA[1 : 1] = bridge_interruptCtrl_rxIntEnable;
        io_apb_PRDATA[2 : 2] = bridge_interruptCtrl_ssEnabledIntEnable;
        io_apb_PRDATA[3 : 3] = bridge_interruptCtrl_ssDisabledIntEnable;
        io_apb_PRDATA[8 : 8] = bridge_interruptCtrl_txInt;
        io_apb_PRDATA[9 : 9] = bridge_interruptCtrl_rxInt;
        io_apb_PRDATA[10 : 10] = bridge_interruptCtrl_ssEnabledInt;
        io_apb_PRDATA[11 : 11] = bridge_interruptCtrl_ssDisabledInt;
      end
      default : begin
      end
    endcase
  end

  assign busCtrl_askWrite = ((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PWRITE);
  assign busCtrl_askRead = ((io_apb_PSEL[0] && io_apb_PENABLE) && (! io_apb_PWRITE));
  assign busCtrl_doWrite = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && io_apb_PWRITE);
  assign busCtrl_doRead = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && (! io_apb_PWRITE));
  always @(*) begin
    _zz_bridge_txLogic_streamUnbuffered_valid = 1'b0;
    case(io_apb_PADDR)
      8'h0 : begin
        if(busCtrl_doWrite) begin
          _zz_bridge_txLogic_streamUnbuffered_valid = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign bridge_txLogic_streamUnbuffered_valid = _zz_bridge_txLogic_streamUnbuffered_valid;
  assign bridge_txLogic_streamUnbuffered_payload = io_apb_PWDATA[7 : 0];
  assign bridge_txLogic_streamUnbuffered_ready = bridge_txLogic_streamUnbuffered_queueWithAvailability_io_push_ready;
  assign spiCtrl_io_rx_takeWhen_valid = (spiCtrl_io_rx_valid && bridge_rxLogic_listen);
  assign spiCtrl_io_rx_takeWhen_payload = spiCtrl_io_rx_payload;
  always @(*) begin
    spiCtrl_io_rx_takeWhen_queueWithOccupancy_io_pop_ready = 1'b0;
    case(io_apb_PADDR)
      8'h0 : begin
        if(busCtrl_doRead) begin
          spiCtrl_io_rx_takeWhen_queueWithOccupancy_io_pop_ready = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign bridge_interruptCtrl_ssFiltedEdges_rise = ((! spiCtrl_io_ssFilted_regNext) && spiCtrl_io_ssFilted);
  assign bridge_interruptCtrl_ssFiltedEdges_fall = (spiCtrl_io_ssFilted_regNext && (! spiCtrl_io_ssFilted));
  assign bridge_interruptCtrl_ssFiltedEdges_toggle = (spiCtrl_io_ssFilted_regNext != spiCtrl_io_ssFilted);
  assign bridge_interruptCtrl_txInt = (bridge_interruptCtrl_txIntEnable && (! bridge_txLogic_streamUnbuffered_queueWithAvailability_io_pop_valid));
  assign bridge_interruptCtrl_rxInt = (bridge_interruptCtrl_rxIntEnable && spiCtrl_io_rx_takeWhen_queueWithOccupancy_io_pop_valid);
  assign when_SpiSlaveCtrl_l97 = (! bridge_interruptCtrl_ssEnabledIntEnable);
  assign when_SpiSlaveCtrl_l98 = (! bridge_interruptCtrl_ssDisabledIntEnable);
  always @(*) begin
    when_BusSlaveFactory_l335 = 1'b0;
    case(io_apb_PADDR)
      8'h04 : begin
        if(busCtrl_doWrite) begin
          when_BusSlaveFactory_l335 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l337 = io_apb_PWDATA[12];
  always @(*) begin
    when_BusSlaveFactory_l335_1 = 1'b0;
    case(io_apb_PADDR)
      8'h04 : begin
        if(busCtrl_doWrite) begin
          when_BusSlaveFactory_l335_1 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l337_1 = io_apb_PWDATA[13];
  assign bridge_interruptCtrl_interrupt = (((bridge_interruptCtrl_rxInt || bridge_interruptCtrl_txInt) || bridge_interruptCtrl_ssEnabledInt) || bridge_interruptCtrl_ssDisabledInt);
  assign io_interrupt = bridge_interruptCtrl_interrupt;
  assign _zz_io_kind_cpol_1 = io_apb_PWDATA[1 : 0];
  always @(posedge mainClock or posedge resetCtrl_systemClockReset) begin
    if(resetCtrl_systemClockReset) begin
      bridge_rxLogic_listen <= 1'b0;
      bridge_interruptCtrl_txIntEnable <= 1'b0;
      bridge_interruptCtrl_rxIntEnable <= 1'b0;
      bridge_interruptCtrl_ssEnabledIntEnable <= 1'b0;
      bridge_interruptCtrl_ssDisabledIntEnable <= 1'b0;
      spiCtrl_io_ssFilted_regNext <= 1'b1;
      bridge_interruptCtrl_ssEnabledInt <= 1'b0;
      bridge_interruptCtrl_ssDisabledInt <= 1'b0;
    end else begin
      spiCtrl_io_ssFilted_regNext <= spiCtrl_io_ssFilted;
      if(bridge_interruptCtrl_ssFiltedEdges_fall) begin
        bridge_interruptCtrl_ssEnabledInt <= 1'b1;
      end
      if(when_SpiSlaveCtrl_l97) begin
        bridge_interruptCtrl_ssEnabledInt <= 1'b0;
      end
      if(bridge_interruptCtrl_ssFiltedEdges_rise) begin
        bridge_interruptCtrl_ssDisabledInt <= 1'b1;
      end
      if(when_SpiSlaveCtrl_l98) begin
        bridge_interruptCtrl_ssDisabledInt <= 1'b0;
      end
      if(when_BusSlaveFactory_l335) begin
        if(when_BusSlaveFactory_l337) begin
          bridge_interruptCtrl_ssEnabledInt <= _zz_bridge_interruptCtrl_ssEnabledInt[0];
        end
      end
      if(when_BusSlaveFactory_l335_1) begin
        if(when_BusSlaveFactory_l337_1) begin
          bridge_interruptCtrl_ssDisabledInt <= _zz_bridge_interruptCtrl_ssDisabledInt[0];
        end
      end
      case(io_apb_PADDR)
        8'h04 : begin
          if(busCtrl_doWrite) begin
            bridge_rxLogic_listen <= io_apb_PWDATA[15];
            bridge_interruptCtrl_txIntEnable <= io_apb_PWDATA[0];
            bridge_interruptCtrl_rxIntEnable <= io_apb_PWDATA[1];
            bridge_interruptCtrl_ssEnabledIntEnable <= io_apb_PWDATA[2];
            bridge_interruptCtrl_ssDisabledIntEnable <= io_apb_PWDATA[3];
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge mainClock) begin
    case(io_apb_PADDR)
      8'h08 : begin
        if(busCtrl_doWrite) begin
          _zz_io_kind_cpol <= _zz_io_kind_cpol_1[0];
          _zz_io_kind_cpha <= _zz_io_kind_cpol_1[1];
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module Apb3Gpio (
  input      [3:0]    io_apb_PADDR,
  input      [0:0]    io_apb_PSEL,
  input               io_apb_PENABLE,
  output              io_apb_PREADY,
  input               io_apb_PWRITE,
  input      [31:0]   io_apb_PWDATA,
  output reg [31:0]   io_apb_PRDATA,
  output              io_apb_PSLVERROR,
  input      [31:0]   io_gpio_read,
  output     [31:0]   io_gpio_write,
  output     [31:0]   io_gpio_writeEnable,
  output     [31:0]   io_value,
  input               mainClock,
  input               resetCtrl_systemClockReset
);
  wire       [31:0]   io_gpio_read_buffercc_io_dataOut;
  wire                ctrl_askWrite;
  wire                ctrl_askRead;
  wire                ctrl_doWrite;
  wire                ctrl_doRead;
  reg        [31:0]   io_gpio_write_driver;
  reg        [31:0]   io_gpio_writeEnable_driver;

  BufferCC_5 io_gpio_read_buffercc (
    .io_dataIn                     (io_gpio_read[31:0]                      ), //i
    .io_dataOut                    (io_gpio_read_buffercc_io_dataOut[31:0]  ), //o
    .mainClock                     (mainClock                               ), //i
    .resetCtrl_systemClockReset    (resetCtrl_systemClockReset              )  //i
  );
  assign io_value = io_gpio_read_buffercc_io_dataOut;
  assign io_apb_PREADY = 1'b1;
  always @(*) begin
    io_apb_PRDATA = 32'h0;
    case(io_apb_PADDR)
      4'b0000 : begin
        io_apb_PRDATA[31 : 0] = io_value;
      end
      4'b0100 : begin
        io_apb_PRDATA[31 : 0] = io_gpio_write_driver;
      end
      4'b1000 : begin
        io_apb_PRDATA[31 : 0] = io_gpio_writeEnable_driver;
      end
      default : begin
      end
    endcase
  end

  assign io_apb_PSLVERROR = 1'b0;
  assign ctrl_askWrite = ((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PWRITE);
  assign ctrl_askRead = ((io_apb_PSEL[0] && io_apb_PENABLE) && (! io_apb_PWRITE));
  assign ctrl_doWrite = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && io_apb_PWRITE);
  assign ctrl_doRead = (((io_apb_PSEL[0] && io_apb_PENABLE) && io_apb_PREADY) && (! io_apb_PWRITE));
  assign io_gpio_write = io_gpio_write_driver;
  assign io_gpio_writeEnable = io_gpio_writeEnable_driver;
  always @(posedge mainClock or posedge resetCtrl_systemClockReset) begin
    if(resetCtrl_systemClockReset) begin
      io_gpio_writeEnable_driver <= 32'h0;
    end else begin
      case(io_apb_PADDR)
        4'b1000 : begin
          if(ctrl_doWrite) begin
            io_gpio_writeEnable_driver <= io_apb_PWDATA[31 : 0];
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge mainClock) begin
    case(io_apb_PADDR)
      4'b0100 : begin
        if(ctrl_doWrite) begin
          io_gpio_write_driver <= io_apb_PWDATA[31 : 0];
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module Apb3AESMaskedAccelerator (
  input      [15:0]   io_bus_PADDR,
  input      [0:0]    io_bus_PSEL,
  input               io_bus_PENABLE,
  output              io_bus_PREADY,
  input               io_bus_PWRITE,
  input      [31:0]   io_bus_PWDATA,
  output reg [31:0]   io_bus_PRDATA,
  input               resetCtrl_systemClockReset,
  input               mainClock
);
  reg                 aes_io_enable;
  reg        [31:0]   aes_io_pt1_payload;
  reg                 aes_io_pt1_valid;
  reg        [31:0]   aes_io_pt2_payload;
  reg                 aes_io_pt2_valid;
  reg        [31:0]   aes_io_key1_payload;
  reg                 aes_io_key1_valid;
  reg        [31:0]   aes_io_key2_payload;
  reg                 aes_io_key2_valid;
  reg                 aes_io_ct1_ready;
  reg                 aes_io_ct2_ready;
  wire       [31:0]   key_io_push_payload;
  reg                 key_io_pop_ready;
  wire       [31:0]   plaintext_io_push_payload;
  reg                 plaintext_io_pop_ready;
  wire       [27:0]   masking_io_push_payload;
  wire                masking_io_pop_ready;
  wire                aes_io_pt1_ready;
  wire                aes_io_pt2_ready;
  wire                aes_io_key1_ready;
  wire                aes_io_key2_ready;
  wire       [31:0]   aes_io_ct1_payload;
  wire                aes_io_ct1_valid;
  wire       [31:0]   aes_io_ct2_payload;
  wire                aes_io_ct2_valid;
  wire                aes_io_done;
  wire                key_io_push_ready;
  wire                key_io_pop_valid;
  wire       [31:0]   key_io_pop_payload;
  wire       [3:0]    key_io_occupancy;
  wire       [3:0]    key_io_availability;
  wire                plaintext_io_push_ready;
  wire                plaintext_io_pop_valid;
  wire       [31:0]   plaintext_io_pop_payload;
  wire       [3:0]    plaintext_io_occupancy;
  wire       [3:0]    plaintext_io_availability;
  wire                masking_io_push_ready;
  wire                masking_io_pop_valid;
  wire       [27:0]   masking_io_pop_payload;
  wire       [8:0]    masking_io_occupancy;
  wire       [8:0]    masking_io_availability;
  reg                 enable;
  reg                 done;
  reg                 ciphertext_valid;
  reg                 ciphertext_ready;
  reg        [31:0]   ciphertext_payload;
  wire                when_AESMaskedBlackbox_l89;
  wire                when_AESMaskedBlackbox_l105;
  wire                busCtrl_askWrite;
  wire                busCtrl_askRead;
  wire                busCtrl_doWrite;
  wire                busCtrl_doRead;
  reg                 _zz_io_push_valid;
  reg                 _zz_io_push_valid_1;
  wire                when_AESMaskedBlackbox_l149;
  reg                 _zz_io_push_valid_2;

  AES_Masked aes (
    .io_clk             (mainClock                     ), //i
    .io_reset           (resetCtrl_systemClockReset    ), //i
    .io_enable          (aes_io_enable                 ), //i
    .io_pt1_payload     (aes_io_pt1_payload[31:0]      ), //i
    .io_pt1_valid       (aes_io_pt1_valid              ), //i
    .io_pt1_ready       (aes_io_pt1_ready              ), //o
    .io_pt2_payload     (aes_io_pt2_payload[31:0]      ), //i
    .io_pt2_valid       (aes_io_pt2_valid              ), //i
    .io_pt2_ready       (aes_io_pt2_ready              ), //o
    .io_key1_payload    (aes_io_key1_payload[31:0]     ), //i
    .io_key1_valid      (aes_io_key1_valid             ), //i
    .io_key1_ready      (aes_io_key1_ready             ), //o
    .io_key2_payload    (aes_io_key2_payload[31:0]     ), //i
    .io_key2_valid      (aes_io_key2_valid             ), //i
    .io_key2_ready      (aes_io_key2_ready             ), //o
    .io_ct1_payload     (aes_io_ct1_payload[31:0]      ), //o
    .io_ct1_valid       (aes_io_ct1_valid              ), //o
    .io_ct1_ready       (aes_io_ct1_ready              ), //i
    .io_ct2_payload     (aes_io_ct2_payload[31:0]      ), //o
    .io_ct2_valid       (aes_io_ct2_valid              ), //o
    .io_ct2_ready       (aes_io_ct2_ready              ), //i
    .io_m               (masking_io_pop_payload[27:0]  ), //i
    .io_done            (aes_io_done                   )  //o
  );
  StreamFifo_2 key (
    .io_push_valid                 (_zz_io_push_valid           ), //i
    .io_push_ready                 (key_io_push_ready           ), //o
    .io_push_payload               (key_io_push_payload[31:0]   ), //i
    .io_pop_valid                  (key_io_pop_valid            ), //o
    .io_pop_ready                  (key_io_pop_ready            ), //i
    .io_pop_payload                (key_io_pop_payload[31:0]    ), //o
    .io_flush                      (1'b0                        ), //i
    .io_occupancy                  (key_io_occupancy[3:0]       ), //o
    .io_availability               (key_io_availability[3:0]    ), //o
    .mainClock                     (mainClock                   ), //i
    .resetCtrl_systemClockReset    (resetCtrl_systemClockReset  )  //i
  );
  StreamFifo_2 plaintext (
    .io_push_valid                 (_zz_io_push_valid_1              ), //i
    .io_push_ready                 (plaintext_io_push_ready          ), //o
    .io_push_payload               (plaintext_io_push_payload[31:0]  ), //i
    .io_pop_valid                  (plaintext_io_pop_valid           ), //o
    .io_pop_ready                  (plaintext_io_pop_ready           ), //i
    .io_pop_payload                (plaintext_io_pop_payload[31:0]   ), //o
    .io_flush                      (1'b0                             ), //i
    .io_occupancy                  (plaintext_io_occupancy[3:0]      ), //o
    .io_availability               (plaintext_io_availability[3:0]   ), //o
    .mainClock                     (mainClock                        ), //i
    .resetCtrl_systemClockReset    (resetCtrl_systemClockReset       )  //i
  );
  StreamFifo_4 masking (
    .io_push_valid                 (_zz_io_push_valid_2            ), //i
    .io_push_ready                 (masking_io_push_ready          ), //o
    .io_push_payload               (masking_io_push_payload[27:0]  ), //i
    .io_pop_valid                  (masking_io_pop_valid           ), //o
    .io_pop_ready                  (masking_io_pop_ready           ), //i
    .io_pop_payload                (masking_io_pop_payload[27:0]   ), //o
    .io_flush                      (1'b0                           ), //i
    .io_occupancy                  (masking_io_occupancy[8:0]      ), //o
    .io_availability               (masking_io_availability[8:0]   ), //o
    .mainClock                     (mainClock                      ), //i
    .resetCtrl_systemClockReset    (resetCtrl_systemClockReset     )  //i
  );
  assign masking_io_pop_ready = (((! key_io_pop_valid) && (! plaintext_io_pop_valid)) && enable);
  always @(*) begin
    aes_io_pt1_payload = 32'h0;
    if(!when_AESMaskedBlackbox_l89) begin
      aes_io_pt1_payload = plaintext_io_pop_payload;
    end
  end

  always @(*) begin
    aes_io_pt1_valid = 1'b0;
    if(!when_AESMaskedBlackbox_l89) begin
      aes_io_pt1_valid = plaintext_io_pop_valid;
    end
  end

  always @(*) begin
    aes_io_pt2_payload = 32'h0;
    if(when_AESMaskedBlackbox_l89) begin
      aes_io_pt2_payload = plaintext_io_pop_payload;
    end
  end

  always @(*) begin
    aes_io_pt2_valid = 1'b0;
    if(when_AESMaskedBlackbox_l89) begin
      aes_io_pt2_valid = plaintext_io_pop_valid;
    end
  end

  assign when_AESMaskedBlackbox_l89 = (plaintext_io_occupancy <= 4'b0100);
  always @(*) begin
    if(when_AESMaskedBlackbox_l89) begin
      plaintext_io_pop_ready = aes_io_pt2_ready;
    end else begin
      plaintext_io_pop_ready = aes_io_pt1_ready;
    end
  end

  always @(*) begin
    aes_io_key1_payload = 32'h0;
    if(!when_AESMaskedBlackbox_l105) begin
      aes_io_key1_payload = key_io_pop_payload;
    end
  end

  always @(*) begin
    aes_io_key1_valid = 1'b0;
    if(!when_AESMaskedBlackbox_l105) begin
      aes_io_key1_valid = key_io_pop_valid;
    end
  end

  always @(*) begin
    aes_io_key2_payload = 32'h0;
    if(when_AESMaskedBlackbox_l105) begin
      aes_io_key2_payload = key_io_pop_payload;
    end
  end

  always @(*) begin
    aes_io_key2_valid = 1'b0;
    if(when_AESMaskedBlackbox_l105) begin
      aes_io_key2_valid = key_io_pop_valid;
    end
  end

  assign when_AESMaskedBlackbox_l105 = (key_io_occupancy <= 4'b0100);
  always @(*) begin
    if(when_AESMaskedBlackbox_l105) begin
      key_io_pop_ready = aes_io_key2_ready;
    end else begin
      key_io_pop_ready = aes_io_key1_ready;
    end
  end

  always @(*) begin
    aes_io_ct1_ready = 1'b0;
    if(aes_io_ct1_valid) begin
      aes_io_ct1_ready = ciphertext_ready;
    end
  end

  always @(*) begin
    aes_io_ct2_ready = 1'b0;
    if(!aes_io_ct1_valid) begin
      aes_io_ct2_ready = ciphertext_ready;
    end
  end

  always @(*) begin
    if(aes_io_ct1_valid) begin
      ciphertext_payload = aes_io_ct1_payload;
    end else begin
      ciphertext_payload = aes_io_ct2_payload;
    end
  end

  always @(*) begin
    if(aes_io_ct1_valid) begin
      ciphertext_valid = aes_io_ct1_valid;
    end else begin
      ciphertext_valid = aes_io_ct2_valid;
    end
  end

  always @(*) begin
    aes_io_enable = enable;
    if(aes_io_done) begin
      aes_io_enable = 1'b0;
    end
  end

  assign io_bus_PREADY = 1'b1;
  always @(*) begin
    io_bus_PRDATA = 32'h0;
    case(io_bus_PADDR)
      16'h0 : begin
        io_bus_PRDATA[0 : 0] = done;
      end
      16'h0010 : begin
        io_bus_PRDATA[31 : 0] = ciphertext_payload;
      end
      default : begin
      end
    endcase
  end

  assign busCtrl_askWrite = ((io_bus_PSEL[0] && io_bus_PENABLE) && io_bus_PWRITE);
  assign busCtrl_askRead = ((io_bus_PSEL[0] && io_bus_PENABLE) && (! io_bus_PWRITE));
  assign busCtrl_doWrite = (((io_bus_PSEL[0] && io_bus_PENABLE) && io_bus_PREADY) && io_bus_PWRITE);
  assign busCtrl_doRead = (((io_bus_PSEL[0] && io_bus_PENABLE) && io_bus_PREADY) && (! io_bus_PWRITE));
  always @(*) begin
    _zz_io_push_valid = 1'b0;
    case(io_bus_PADDR)
      16'h0008 : begin
        if(busCtrl_doWrite) begin
          _zz_io_push_valid = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign key_io_push_payload = io_bus_PWDATA[31 : 0];
  always @(*) begin
    _zz_io_push_valid_1 = 1'b0;
    case(io_bus_PADDR)
      16'h000c : begin
        if(busCtrl_doWrite) begin
          _zz_io_push_valid_1 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign plaintext_io_push_payload = io_bus_PWDATA[31 : 0];
  always @(*) begin
    ciphertext_ready = 1'b0;
    if(when_AESMaskedBlackbox_l149) begin
      ciphertext_ready = 1'b1;
    end
  end

  assign when_AESMaskedBlackbox_l149 = ((io_bus_PADDR == 16'h0010) && io_bus_PENABLE);
  always @(*) begin
    _zz_io_push_valid_2 = 1'b0;
    case(io_bus_PADDR)
      16'h0014 : begin
        if(busCtrl_doWrite) begin
          _zz_io_push_valid_2 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign masking_io_push_payload = io_bus_PWDATA[27 : 0];
  always @(posedge mainClock or posedge resetCtrl_systemClockReset) begin
    if(resetCtrl_systemClockReset) begin
      enable <= 1'b0;
      done <= 1'b0;
    end else begin
      if(aes_io_done) begin
        enable <= 1'b0;
        done <= 1'b1;
      end
      if(aes_io_enable) begin
        done <= 1'b0;
      end
      case(io_bus_PADDR)
        16'h0004 : begin
          if(busCtrl_doWrite) begin
            enable <= io_bus_PWDATA[0];
          end
        end
        default : begin
        end
      endcase
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
  input               mainClock,
  input               resetCtrl_systemClockReset
);
  reg                 uartCtrl_1_io_read_queueWithOccupancy_io_pop_ready;
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
  wire       [0:0]    _zz_bridge_misc_readError;
  wire       [0:0]    _zz_bridge_misc_readOverflowError;
  wire       [0:0]    _zz_bridge_misc_breakDetected;
  wire       [0:0]    _zz_bridge_misc_doBreak;
  wire       [0:0]    _zz_bridge_misc_doBreak_1;
  wire       [4:0]    _zz_io_apb_PRDATA;
  wire                busCtrl_askWrite;
  wire                busCtrl_askRead;
  wire                busCtrl_doWrite;
  wire                busCtrl_doRead;
  wire       [2:0]    bridge_uartConfigReg_frame_dataLength;
  wire       `UartStopType_binary_sequential_type bridge_uartConfigReg_frame_stop;
  wire       `UartParityType_binary_sequential_type bridge_uartConfigReg_frame_parity;
  reg        [19:0]   bridge_uartConfigReg_clockDivider;
  reg                 _zz_bridge_write_streamUnbuffered_valid;
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
  reg                 when_BusSlaveFactory_l335;
  wire                when_BusSlaveFactory_l337;
  reg                 bridge_misc_readOverflowError;
  reg                 when_BusSlaveFactory_l335_1;
  wire                when_BusSlaveFactory_l337_1;
  wire                uartCtrl_1_io_read_isStall;
  reg                 bridge_misc_breakDetected;
  reg                 uartCtrl_1_io_readBreak_regNext;
  wire                when_UartCtrl_l155;
  reg                 when_BusSlaveFactory_l335_2;
  wire                when_BusSlaveFactory_l337_2;
  reg                 bridge_misc_doBreak;
  reg                 when_BusSlaveFactory_l366;
  wire                when_BusSlaveFactory_l368;
  reg                 when_BusSlaveFactory_l335_3;
  wire                when_BusSlaveFactory_l337_3;
  `ifndef SYNTHESIS
  reg [23:0] bridge_uartConfigReg_frame_stop_string;
  reg [31:0] bridge_uartConfigReg_frame_parity_string;
  `endif

  function [19:0] zz_bridge_uartConfigReg_clockDivider(input dummy);
    begin
      zz_bridge_uartConfigReg_clockDivider = 20'h0;
      zz_bridge_uartConfigReg_clockDivider = 20'h0002a;
    end
  endfunction
  wire [19:0] _zz_1;

  assign _zz_bridge_misc_readError = 1'b0;
  assign _zz_bridge_misc_readOverflowError = 1'b0;
  assign _zz_bridge_misc_breakDetected = 1'b0;
  assign _zz_bridge_misc_doBreak = 1'b1;
  assign _zz_bridge_misc_doBreak_1 = 1'b0;
  assign _zz_io_apb_PRDATA = (5'h10 - bridge_write_streamUnbuffered_queueWithOccupancy_io_occupancy);
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
    .mainClock                     (mainClock                                                             ), //i
    .resetCtrl_systemClockReset    (resetCtrl_systemClockReset                                            )  //i
  );
  StreamFifo bridge_write_streamUnbuffered_queueWithOccupancy (
    .io_push_valid                 (bridge_write_streamUnbuffered_valid                                    ), //i
    .io_push_ready                 (bridge_write_streamUnbuffered_queueWithOccupancy_io_push_ready         ), //o
    .io_push_payload               (bridge_write_streamUnbuffered_payload[7:0]                             ), //i
    .io_pop_valid                  (bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_valid          ), //o
    .io_pop_ready                  (uartCtrl_1_io_write_ready                                              ), //i
    .io_pop_payload                (bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_payload[7:0]   ), //o
    .io_flush                      (1'b0                                                                   ), //i
    .io_occupancy                  (bridge_write_streamUnbuffered_queueWithOccupancy_io_occupancy[4:0]     ), //o
    .io_availability               (bridge_write_streamUnbuffered_queueWithOccupancy_io_availability[4:0]  ), //o
    .mainClock                     (mainClock                                                              ), //i
    .resetCtrl_systemClockReset    (resetCtrl_systemClockReset                                             )  //i
  );
  StreamFifo uartCtrl_1_io_read_queueWithOccupancy (
    .io_push_valid                 (uartCtrl_1_io_read_valid                                    ), //i
    .io_push_ready                 (uartCtrl_1_io_read_queueWithOccupancy_io_push_ready         ), //o
    .io_push_payload               (uartCtrl_1_io_read_payload[7:0]                             ), //i
    .io_pop_valid                  (uartCtrl_1_io_read_queueWithOccupancy_io_pop_valid          ), //o
    .io_pop_ready                  (uartCtrl_1_io_read_queueWithOccupancy_io_pop_ready          ), //i
    .io_pop_payload                (uartCtrl_1_io_read_queueWithOccupancy_io_pop_payload[7:0]   ), //o
    .io_flush                      (1'b0                                                        ), //i
    .io_occupancy                  (uartCtrl_1_io_read_queueWithOccupancy_io_occupancy[4:0]     ), //o
    .io_availability               (uartCtrl_1_io_read_queueWithOccupancy_io_availability[4:0]  ), //o
    .mainClock                     (mainClock                                                   ), //i
    .resetCtrl_systemClockReset    (resetCtrl_systemClockReset                                  )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(bridge_uartConfigReg_frame_stop)
      `UartStopType_binary_sequential_ONE : bridge_uartConfigReg_frame_stop_string = "ONE";
      `UartStopType_binary_sequential_TWO : bridge_uartConfigReg_frame_stop_string = "TWO";
      default : bridge_uartConfigReg_frame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(bridge_uartConfigReg_frame_parity)
      `UartParityType_binary_sequential_NONE : bridge_uartConfigReg_frame_parity_string = "NONE";
      `UartParityType_binary_sequential_EVEN : bridge_uartConfigReg_frame_parity_string = "EVEN";
      `UartParityType_binary_sequential_ODD : bridge_uartConfigReg_frame_parity_string = "ODD ";
      default : bridge_uartConfigReg_frame_parity_string = "????";
    endcase
  end
  `endif

  assign io_uart_txd = uartCtrl_1_io_uart_txd;
  assign io_apb_PREADY = 1'b1;
  always @(*) begin
    io_apb_PRDATA = 32'h0;
    case(io_apb_PADDR)
      5'h0 : begin
        io_apb_PRDATA[16 : 16] = (bridge_read_streamBreaked_valid ^ 1'b0);
        io_apb_PRDATA[7 : 0] = bridge_read_streamBreaked_payload;
      end
      5'h04 : begin
        io_apb_PRDATA[20 : 16] = _zz_io_apb_PRDATA;
        io_apb_PRDATA[15 : 15] = bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_valid;
        io_apb_PRDATA[28 : 24] = uartCtrl_1_io_read_queueWithOccupancy_io_occupancy;
        io_apb_PRDATA[0 : 0] = bridge_interruptCtrl_writeIntEnable;
        io_apb_PRDATA[1 : 1] = bridge_interruptCtrl_readIntEnable;
        io_apb_PRDATA[8 : 8] = bridge_interruptCtrl_writeInt;
        io_apb_PRDATA[9 : 9] = bridge_interruptCtrl_readInt;
      end
      5'h10 : begin
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
  assign _zz_1 = zz_bridge_uartConfigReg_clockDivider(1'b0);
  always @(*) bridge_uartConfigReg_clockDivider = _zz_1;
  assign bridge_uartConfigReg_frame_dataLength = 3'b111;
  assign bridge_uartConfigReg_frame_parity = `UartParityType_binary_sequential_NONE;
  assign bridge_uartConfigReg_frame_stop = `UartStopType_binary_sequential_ONE;
  always @(*) begin
    _zz_bridge_write_streamUnbuffered_valid = 1'b0;
    case(io_apb_PADDR)
      5'h0 : begin
        if(busCtrl_doWrite) begin
          _zz_bridge_write_streamUnbuffered_valid = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign bridge_write_streamUnbuffered_valid = _zz_bridge_write_streamUnbuffered_valid;
  assign bridge_write_streamUnbuffered_payload = io_apb_PWDATA[7 : 0];
  assign bridge_write_streamUnbuffered_ready = bridge_write_streamUnbuffered_queueWithOccupancy_io_push_ready;
  always @(*) begin
    bridge_read_streamBreaked_valid = uartCtrl_1_io_read_queueWithOccupancy_io_pop_valid;
    if(uartCtrl_1_io_readBreak) begin
      bridge_read_streamBreaked_valid = 1'b0;
    end
  end

  always @(*) begin
    uartCtrl_1_io_read_queueWithOccupancy_io_pop_ready = bridge_read_streamBreaked_ready;
    if(uartCtrl_1_io_readBreak) begin
      uartCtrl_1_io_read_queueWithOccupancy_io_pop_ready = 1'b1;
    end
  end

  assign bridge_read_streamBreaked_payload = uartCtrl_1_io_read_queueWithOccupancy_io_pop_payload;
  always @(*) begin
    bridge_read_streamBreaked_ready = 1'b0;
    case(io_apb_PADDR)
      5'h0 : begin
        if(busCtrl_doRead) begin
          bridge_read_streamBreaked_ready = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign bridge_interruptCtrl_readInt = (bridge_interruptCtrl_readIntEnable && bridge_read_streamBreaked_valid);
  assign bridge_interruptCtrl_writeInt = (bridge_interruptCtrl_writeIntEnable && (! bridge_write_streamUnbuffered_queueWithOccupancy_io_pop_valid));
  assign bridge_interruptCtrl_interrupt = (bridge_interruptCtrl_readInt || bridge_interruptCtrl_writeInt);
  always @(*) begin
    when_BusSlaveFactory_l335 = 1'b0;
    case(io_apb_PADDR)
      5'h10 : begin
        if(busCtrl_doWrite) begin
          when_BusSlaveFactory_l335 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l337 = io_apb_PWDATA[0];
  always @(*) begin
    when_BusSlaveFactory_l335_1 = 1'b0;
    case(io_apb_PADDR)
      5'h10 : begin
        if(busCtrl_doWrite) begin
          when_BusSlaveFactory_l335_1 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l337_1 = io_apb_PWDATA[1];
  assign uartCtrl_1_io_read_isStall = (uartCtrl_1_io_read_valid && (! uartCtrl_1_io_read_queueWithOccupancy_io_push_ready));
  assign when_UartCtrl_l155 = (uartCtrl_1_io_readBreak && (! uartCtrl_1_io_readBreak_regNext));
  always @(*) begin
    when_BusSlaveFactory_l335_2 = 1'b0;
    case(io_apb_PADDR)
      5'h10 : begin
        if(busCtrl_doWrite) begin
          when_BusSlaveFactory_l335_2 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l337_2 = io_apb_PWDATA[9];
  always @(*) begin
    when_BusSlaveFactory_l366 = 1'b0;
    case(io_apb_PADDR)
      5'h10 : begin
        if(busCtrl_doWrite) begin
          when_BusSlaveFactory_l366 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l368 = io_apb_PWDATA[10];
  always @(*) begin
    when_BusSlaveFactory_l335_3 = 1'b0;
    case(io_apb_PADDR)
      5'h10 : begin
        if(busCtrl_doWrite) begin
          when_BusSlaveFactory_l335_3 = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign when_BusSlaveFactory_l337_3 = io_apb_PWDATA[11];
  assign io_interrupt = bridge_interruptCtrl_interrupt;
  always @(posedge mainClock or posedge resetCtrl_systemClockReset) begin
    if(resetCtrl_systemClockReset) begin
      bridge_interruptCtrl_writeIntEnable <= 1'b0;
      bridge_interruptCtrl_readIntEnable <= 1'b0;
      bridge_misc_readError <= 1'b0;
      bridge_misc_readOverflowError <= 1'b0;
      bridge_misc_breakDetected <= 1'b0;
      bridge_misc_doBreak <= 1'b0;
    end else begin
      if(when_BusSlaveFactory_l335) begin
        if(when_BusSlaveFactory_l337) begin
          bridge_misc_readError <= _zz_bridge_misc_readError[0];
        end
      end
      if(uartCtrl_1_io_readError) begin
        bridge_misc_readError <= 1'b1;
      end
      if(when_BusSlaveFactory_l335_1) begin
        if(when_BusSlaveFactory_l337_1) begin
          bridge_misc_readOverflowError <= _zz_bridge_misc_readOverflowError[0];
        end
      end
      if(uartCtrl_1_io_read_isStall) begin
        bridge_misc_readOverflowError <= 1'b1;
      end
      if(when_UartCtrl_l155) begin
        bridge_misc_breakDetected <= 1'b1;
      end
      if(when_BusSlaveFactory_l335_2) begin
        if(when_BusSlaveFactory_l337_2) begin
          bridge_misc_breakDetected <= _zz_bridge_misc_breakDetected[0];
        end
      end
      if(when_BusSlaveFactory_l366) begin
        if(when_BusSlaveFactory_l368) begin
          bridge_misc_doBreak <= _zz_bridge_misc_doBreak[0];
        end
      end
      if(when_BusSlaveFactory_l335_3) begin
        if(when_BusSlaveFactory_l337_3) begin
          bridge_misc_doBreak <= _zz_bridge_misc_doBreak_1[0];
        end
      end
      case(io_apb_PADDR)
        5'h04 : begin
          if(busCtrl_doWrite) begin
            bridge_interruptCtrl_writeIntEnable <= io_apb_PWDATA[0];
            bridge_interruptCtrl_readIntEnable <= io_apb_PWDATA[1];
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge mainClock) begin
    uartCtrl_1_io_readBreak_regNext <= uartCtrl_1_io_readBreak;
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
  input               mainClock,
  input               resetCtrl_mainClockReset
);
  reg        [66:0]   dispatcher_dataShifter;
  reg                 dispatcher_dataLoaded;
  reg        [7:0]    dispatcher_headerShifter;
  wire       [7:0]    dispatcher_header;
  reg                 dispatcher_headerLoaded;
  reg        [2:0]    dispatcher_counter;
  wire                when_Fragment_l346;
  wire                when_Fragment_l349;
  wire       [66:0]   _zz_io_mem_cmd_payload_address;
  wire                io_mem_cmd_isStall;
  wire                when_Fragment_l372;

  assign dispatcher_header = dispatcher_headerShifter[7 : 0];
  assign when_Fragment_l346 = (dispatcher_headerLoaded == 1'b0);
  assign when_Fragment_l349 = (dispatcher_counter == 3'b111);
  assign io_remote_cmd_ready = (! dispatcher_dataLoaded);
  assign _zz_io_mem_cmd_payload_address = dispatcher_dataShifter[66 : 0];
  assign io_mem_cmd_payload_address = _zz_io_mem_cmd_payload_address[31 : 0];
  assign io_mem_cmd_payload_data = _zz_io_mem_cmd_payload_address[63 : 32];
  assign io_mem_cmd_payload_wr = _zz_io_mem_cmd_payload_address[64];
  assign io_mem_cmd_payload_size = _zz_io_mem_cmd_payload_address[66 : 65];
  assign io_mem_cmd_valid = (dispatcher_dataLoaded && (dispatcher_header == 8'h0));
  assign io_mem_cmd_isStall = (io_mem_cmd_valid && (! io_mem_cmd_ready));
  assign when_Fragment_l372 = ((dispatcher_headerLoaded && dispatcher_dataLoaded) && (! io_mem_cmd_isStall));
  assign io_remote_rsp_valid = io_mem_rsp_valid;
  assign io_remote_rsp_payload_error = 1'b0;
  assign io_remote_rsp_payload_data = io_mem_rsp_payload;
  always @(posedge mainClock or posedge resetCtrl_mainClockReset) begin
    if(resetCtrl_mainClockReset) begin
      dispatcher_dataLoaded <= 1'b0;
      dispatcher_headerLoaded <= 1'b0;
      dispatcher_counter <= 3'b000;
    end else begin
      if(io_remote_cmd_valid) begin
        if(when_Fragment_l346) begin
          dispatcher_counter <= (dispatcher_counter + 3'b001);
          if(when_Fragment_l349) begin
            dispatcher_headerLoaded <= 1'b1;
          end
        end
        if(io_remote_cmd_payload_last) begin
          dispatcher_headerLoaded <= 1'b1;
          dispatcher_dataLoaded <= 1'b1;
          dispatcher_counter <= 3'b000;
        end
      end
      if(when_Fragment_l372) begin
        dispatcher_headerLoaded <= 1'b0;
        dispatcher_dataLoaded <= 1'b0;
      end
    end
  end

  always @(posedge mainClock) begin
    if(io_remote_cmd_valid) begin
      if(when_Fragment_l346) begin
        dispatcher_headerShifter <= ({io_remote_cmd_payload_fragment,dispatcher_headerShifter} >>> 1);
      end else begin
        dispatcher_dataShifter <= ({io_remote_cmd_payload_fragment,dispatcher_dataShifter} >>> 1);
      end
    end
  end


endmodule

module JtagBridge (
  input               io_jtag_tms,
  input               io_jtag_tdi,
  output              io_jtag_tdo,
  input               io_jtag_tck,
  output              io_remote_cmd_valid,
  input               io_remote_cmd_ready,
  output              io_remote_cmd_payload_last,
  output     [0:0]    io_remote_cmd_payload_fragment,
  input               io_remote_rsp_valid,
  output              io_remote_rsp_ready,
  input               io_remote_rsp_payload_error,
  input      [31:0]   io_remote_rsp_payload_data,
  input               mainClock,
  input               resetCtrl_mainClockReset
);
  wire                flowCCByToggle_1_io_input_payload_last;
  wire                flowCCByToggle_1_io_output_valid;
  wire                flowCCByToggle_1_io_output_payload_last;
  wire       [0:0]    flowCCByToggle_1_io_output_payload_fragment;
  wire       [1:0]    _zz_jtag_tap_instructionShift;
  wire                system_cmd_valid;
  wire                system_cmd_payload_last;
  wire       [0:0]    system_cmd_payload_fragment;
  (* async_reg = "true" *) reg                 system_rsp_valid;
  (* async_reg = "true" *) reg                 system_rsp_payload_error;
  (* async_reg = "true" *) reg        [31:0]   system_rsp_payload_data;
  wire                io_remote_rsp_fire;
  wire       `JtagState_binary_sequential_type jtag_tap_fsm_stateNext;
  reg        `JtagState_binary_sequential_type jtag_tap_fsm_state = `JtagState_binary_sequential_RESET;
  reg        `JtagState_binary_sequential_type _zz_jtag_tap_fsm_stateNext;
  reg        [3:0]    jtag_tap_instruction;
  reg        [3:0]    jtag_tap_instructionShift;
  reg                 jtag_tap_bypass;
  reg                 jtag_tap_tdoUnbufferd;
  reg                 jtag_tap_tdoDr;
  wire                jtag_tap_tdoIr;
  reg                 jtag_tap_tdoUnbufferd_regNext;
  wire                _zz_1;
  reg        [31:0]   _zz_jtag_tap_tdoDr;
  wire                when_JtagTap_l115;
  wire                _zz_io_input_valid;
  wire                _zz_io_input_valid_1;
  wire       [0:0]    _zz_io_input_payload_fragment;
  reg                 _zz_io_input_valid_2;
  reg                 _zz_io_input_payload_fragment_1;
  wire                _zz_2;
  reg        [33:0]   _zz_jtag_tap_tdoDr_1;
  `ifndef SYNTHESIS
  reg [79:0] jtag_tap_fsm_stateNext_string;
  reg [79:0] jtag_tap_fsm_state_string;
  reg [79:0] _zz_jtag_tap_fsm_stateNext_string;
  `endif


  assign _zz_jtag_tap_instructionShift = 2'b01;
  FlowCCByToggle flowCCByToggle_1 (
    .io_input_valid                (_zz_io_input_valid_2                         ), //i
    .io_input_payload_last         (flowCCByToggle_1_io_input_payload_last       ), //i
    .io_input_payload_fragment     (_zz_io_input_payload_fragment                ), //i
    .io_output_valid               (flowCCByToggle_1_io_output_valid             ), //o
    .io_output_payload_last        (flowCCByToggle_1_io_output_payload_last      ), //o
    .io_output_payload_fragment    (flowCCByToggle_1_io_output_payload_fragment  ), //o
    .io_jtag_tck                   (io_jtag_tck                                  ), //i
    .mainClock                     (mainClock                                    ), //i
    .resetCtrl_mainClockReset      (resetCtrl_mainClockReset                     )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(jtag_tap_fsm_stateNext)
      `JtagState_binary_sequential_RESET : jtag_tap_fsm_stateNext_string = "RESET     ";
      `JtagState_binary_sequential_IDLE : jtag_tap_fsm_stateNext_string = "IDLE      ";
      `JtagState_binary_sequential_IR_SELECT : jtag_tap_fsm_stateNext_string = "IR_SELECT ";
      `JtagState_binary_sequential_IR_CAPTURE : jtag_tap_fsm_stateNext_string = "IR_CAPTURE";
      `JtagState_binary_sequential_IR_SHIFT : jtag_tap_fsm_stateNext_string = "IR_SHIFT  ";
      `JtagState_binary_sequential_IR_EXIT1 : jtag_tap_fsm_stateNext_string = "IR_EXIT1  ";
      `JtagState_binary_sequential_IR_PAUSE : jtag_tap_fsm_stateNext_string = "IR_PAUSE  ";
      `JtagState_binary_sequential_IR_EXIT2 : jtag_tap_fsm_stateNext_string = "IR_EXIT2  ";
      `JtagState_binary_sequential_IR_UPDATE : jtag_tap_fsm_stateNext_string = "IR_UPDATE ";
      `JtagState_binary_sequential_DR_SELECT : jtag_tap_fsm_stateNext_string = "DR_SELECT ";
      `JtagState_binary_sequential_DR_CAPTURE : jtag_tap_fsm_stateNext_string = "DR_CAPTURE";
      `JtagState_binary_sequential_DR_SHIFT : jtag_tap_fsm_stateNext_string = "DR_SHIFT  ";
      `JtagState_binary_sequential_DR_EXIT1 : jtag_tap_fsm_stateNext_string = "DR_EXIT1  ";
      `JtagState_binary_sequential_DR_PAUSE : jtag_tap_fsm_stateNext_string = "DR_PAUSE  ";
      `JtagState_binary_sequential_DR_EXIT2 : jtag_tap_fsm_stateNext_string = "DR_EXIT2  ";
      `JtagState_binary_sequential_DR_UPDATE : jtag_tap_fsm_stateNext_string = "DR_UPDATE ";
      default : jtag_tap_fsm_stateNext_string = "??????????";
    endcase
  end
  always @(*) begin
    case(jtag_tap_fsm_state)
      `JtagState_binary_sequential_RESET : jtag_tap_fsm_state_string = "RESET     ";
      `JtagState_binary_sequential_IDLE : jtag_tap_fsm_state_string = "IDLE      ";
      `JtagState_binary_sequential_IR_SELECT : jtag_tap_fsm_state_string = "IR_SELECT ";
      `JtagState_binary_sequential_IR_CAPTURE : jtag_tap_fsm_state_string = "IR_CAPTURE";
      `JtagState_binary_sequential_IR_SHIFT : jtag_tap_fsm_state_string = "IR_SHIFT  ";
      `JtagState_binary_sequential_IR_EXIT1 : jtag_tap_fsm_state_string = "IR_EXIT1  ";
      `JtagState_binary_sequential_IR_PAUSE : jtag_tap_fsm_state_string = "IR_PAUSE  ";
      `JtagState_binary_sequential_IR_EXIT2 : jtag_tap_fsm_state_string = "IR_EXIT2  ";
      `JtagState_binary_sequential_IR_UPDATE : jtag_tap_fsm_state_string = "IR_UPDATE ";
      `JtagState_binary_sequential_DR_SELECT : jtag_tap_fsm_state_string = "DR_SELECT ";
      `JtagState_binary_sequential_DR_CAPTURE : jtag_tap_fsm_state_string = "DR_CAPTURE";
      `JtagState_binary_sequential_DR_SHIFT : jtag_tap_fsm_state_string = "DR_SHIFT  ";
      `JtagState_binary_sequential_DR_EXIT1 : jtag_tap_fsm_state_string = "DR_EXIT1  ";
      `JtagState_binary_sequential_DR_PAUSE : jtag_tap_fsm_state_string = "DR_PAUSE  ";
      `JtagState_binary_sequential_DR_EXIT2 : jtag_tap_fsm_state_string = "DR_EXIT2  ";
      `JtagState_binary_sequential_DR_UPDATE : jtag_tap_fsm_state_string = "DR_UPDATE ";
      default : jtag_tap_fsm_state_string = "??????????";
    endcase
  end
  always @(*) begin
    case(_zz_jtag_tap_fsm_stateNext)
      `JtagState_binary_sequential_RESET : _zz_jtag_tap_fsm_stateNext_string = "RESET     ";
      `JtagState_binary_sequential_IDLE : _zz_jtag_tap_fsm_stateNext_string = "IDLE      ";
      `JtagState_binary_sequential_IR_SELECT : _zz_jtag_tap_fsm_stateNext_string = "IR_SELECT ";
      `JtagState_binary_sequential_IR_CAPTURE : _zz_jtag_tap_fsm_stateNext_string = "IR_CAPTURE";
      `JtagState_binary_sequential_IR_SHIFT : _zz_jtag_tap_fsm_stateNext_string = "IR_SHIFT  ";
      `JtagState_binary_sequential_IR_EXIT1 : _zz_jtag_tap_fsm_stateNext_string = "IR_EXIT1  ";
      `JtagState_binary_sequential_IR_PAUSE : _zz_jtag_tap_fsm_stateNext_string = "IR_PAUSE  ";
      `JtagState_binary_sequential_IR_EXIT2 : _zz_jtag_tap_fsm_stateNext_string = "IR_EXIT2  ";
      `JtagState_binary_sequential_IR_UPDATE : _zz_jtag_tap_fsm_stateNext_string = "IR_UPDATE ";
      `JtagState_binary_sequential_DR_SELECT : _zz_jtag_tap_fsm_stateNext_string = "DR_SELECT ";
      `JtagState_binary_sequential_DR_CAPTURE : _zz_jtag_tap_fsm_stateNext_string = "DR_CAPTURE";
      `JtagState_binary_sequential_DR_SHIFT : _zz_jtag_tap_fsm_stateNext_string = "DR_SHIFT  ";
      `JtagState_binary_sequential_DR_EXIT1 : _zz_jtag_tap_fsm_stateNext_string = "DR_EXIT1  ";
      `JtagState_binary_sequential_DR_PAUSE : _zz_jtag_tap_fsm_stateNext_string = "DR_PAUSE  ";
      `JtagState_binary_sequential_DR_EXIT2 : _zz_jtag_tap_fsm_stateNext_string = "DR_EXIT2  ";
      `JtagState_binary_sequential_DR_UPDATE : _zz_jtag_tap_fsm_stateNext_string = "DR_UPDATE ";
      default : _zz_jtag_tap_fsm_stateNext_string = "??????????";
    endcase
  end
  `endif

  assign io_remote_cmd_valid = system_cmd_valid;
  assign io_remote_cmd_payload_last = system_cmd_payload_last;
  assign io_remote_cmd_payload_fragment = system_cmd_payload_fragment;
  assign io_remote_rsp_fire = (io_remote_rsp_valid && io_remote_rsp_ready);
  assign io_remote_rsp_ready = 1'b1;
  always @(*) begin
    case(jtag_tap_fsm_state)
      `JtagState_binary_sequential_IDLE : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? `JtagState_binary_sequential_DR_SELECT : `JtagState_binary_sequential_IDLE);
      end
      `JtagState_binary_sequential_IR_SELECT : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? `JtagState_binary_sequential_RESET : `JtagState_binary_sequential_IR_CAPTURE);
      end
      `JtagState_binary_sequential_IR_CAPTURE : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? `JtagState_binary_sequential_IR_EXIT1 : `JtagState_binary_sequential_IR_SHIFT);
      end
      `JtagState_binary_sequential_IR_SHIFT : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? `JtagState_binary_sequential_IR_EXIT1 : `JtagState_binary_sequential_IR_SHIFT);
      end
      `JtagState_binary_sequential_IR_EXIT1 : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? `JtagState_binary_sequential_IR_UPDATE : `JtagState_binary_sequential_IR_PAUSE);
      end
      `JtagState_binary_sequential_IR_PAUSE : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? `JtagState_binary_sequential_IR_EXIT2 : `JtagState_binary_sequential_IR_PAUSE);
      end
      `JtagState_binary_sequential_IR_EXIT2 : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? `JtagState_binary_sequential_IR_UPDATE : `JtagState_binary_sequential_IR_SHIFT);
      end
      `JtagState_binary_sequential_IR_UPDATE : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? `JtagState_binary_sequential_DR_SELECT : `JtagState_binary_sequential_IDLE);
      end
      `JtagState_binary_sequential_DR_SELECT : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? `JtagState_binary_sequential_IR_SELECT : `JtagState_binary_sequential_DR_CAPTURE);
      end
      `JtagState_binary_sequential_DR_CAPTURE : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? `JtagState_binary_sequential_DR_EXIT1 : `JtagState_binary_sequential_DR_SHIFT);
      end
      `JtagState_binary_sequential_DR_SHIFT : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? `JtagState_binary_sequential_DR_EXIT1 : `JtagState_binary_sequential_DR_SHIFT);
      end
      `JtagState_binary_sequential_DR_EXIT1 : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? `JtagState_binary_sequential_DR_UPDATE : `JtagState_binary_sequential_DR_PAUSE);
      end
      `JtagState_binary_sequential_DR_PAUSE : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? `JtagState_binary_sequential_DR_EXIT2 : `JtagState_binary_sequential_DR_PAUSE);
      end
      `JtagState_binary_sequential_DR_EXIT2 : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? `JtagState_binary_sequential_DR_UPDATE : `JtagState_binary_sequential_DR_SHIFT);
      end
      `JtagState_binary_sequential_DR_UPDATE : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? `JtagState_binary_sequential_DR_SELECT : `JtagState_binary_sequential_IDLE);
      end
      default : begin
        _zz_jtag_tap_fsm_stateNext = (io_jtag_tms ? `JtagState_binary_sequential_RESET : `JtagState_binary_sequential_IDLE);
      end
    endcase
  end

  assign jtag_tap_fsm_stateNext = _zz_jtag_tap_fsm_stateNext;
  always @(*) begin
    jtag_tap_tdoUnbufferd = jtag_tap_bypass;
    case(jtag_tap_fsm_state)
      `JtagState_binary_sequential_IR_SHIFT : begin
        jtag_tap_tdoUnbufferd = jtag_tap_tdoIr;
      end
      `JtagState_binary_sequential_DR_SHIFT : begin
        jtag_tap_tdoUnbufferd = jtag_tap_tdoDr;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    jtag_tap_tdoDr = 1'b0;
    if(_zz_1) begin
      jtag_tap_tdoDr = _zz_jtag_tap_tdoDr[0];
    end
    if(_zz_io_input_valid) begin
      jtag_tap_tdoDr = 1'b0;
    end
    if(_zz_2) begin
      jtag_tap_tdoDr = _zz_jtag_tap_tdoDr_1[0];
    end
  end

  assign jtag_tap_tdoIr = jtag_tap_instructionShift[0];
  assign io_jtag_tdo = jtag_tap_tdoUnbufferd_regNext;
  assign _zz_1 = (jtag_tap_instruction == 4'b0001);
  assign when_JtagTap_l115 = (jtag_tap_fsm_state == `JtagState_binary_sequential_RESET);
  assign _zz_io_input_payload_fragment[0] = _zz_io_input_payload_fragment_1;
  assign flowCCByToggle_1_io_input_payload_last = (! (_zz_io_input_valid && _zz_io_input_valid_1));
  assign system_cmd_valid = flowCCByToggle_1_io_output_valid;
  assign system_cmd_payload_last = flowCCByToggle_1_io_output_payload_last;
  assign system_cmd_payload_fragment = flowCCByToggle_1_io_output_payload_fragment;
  assign _zz_io_input_valid = (jtag_tap_instruction == 4'b0010);
  assign _zz_io_input_valid_1 = (jtag_tap_fsm_state == `JtagState_binary_sequential_DR_SHIFT);
  assign _zz_2 = (jtag_tap_instruction == 4'b0011);
  always @(posedge mainClock) begin
    if(io_remote_cmd_valid) begin
      system_rsp_valid <= 1'b0;
    end
    if(io_remote_rsp_fire) begin
      system_rsp_valid <= 1'b1;
      system_rsp_payload_error <= io_remote_rsp_payload_error;
      system_rsp_payload_data <= io_remote_rsp_payload_data;
    end
  end

  always @(posedge io_jtag_tck) begin
    jtag_tap_fsm_state <= jtag_tap_fsm_stateNext;
    jtag_tap_bypass <= io_jtag_tdi;
    case(jtag_tap_fsm_state)
      `JtagState_binary_sequential_IR_CAPTURE : begin
        jtag_tap_instructionShift <= {2'd0, _zz_jtag_tap_instructionShift};
      end
      `JtagState_binary_sequential_IR_SHIFT : begin
        jtag_tap_instructionShift <= ({io_jtag_tdi,jtag_tap_instructionShift} >>> 1);
      end
      `JtagState_binary_sequential_IR_UPDATE : begin
        jtag_tap_instruction <= jtag_tap_instructionShift;
      end
      `JtagState_binary_sequential_DR_SHIFT : begin
        jtag_tap_instructionShift <= ({io_jtag_tdi,jtag_tap_instructionShift} >>> 1);
      end
      default : begin
      end
    endcase
    if(_zz_1) begin
      if((jtag_tap_fsm_state == `JtagState_binary_sequential_DR_SHIFT)) begin
        _zz_jtag_tap_tdoDr <= ({io_jtag_tdi,_zz_jtag_tap_tdoDr} >>> 1);
      end
    end
    if((jtag_tap_fsm_state == `JtagState_binary_sequential_DR_CAPTURE)) begin
      _zz_jtag_tap_tdoDr <= 32'h10001fff;
    end
    if(when_JtagTap_l115) begin
      jtag_tap_instruction <= 4'b0001;
    end
    _zz_io_input_valid_2 <= (_zz_io_input_valid && _zz_io_input_valid_1);
    _zz_io_input_payload_fragment_1 <= io_jtag_tdi;
    if(_zz_2) begin
      if((jtag_tap_fsm_state == `JtagState_binary_sequential_DR_CAPTURE)) begin
        _zz_jtag_tap_tdoDr_1 <= {{system_rsp_payload_data,system_rsp_payload_error},system_rsp_valid};
      end
      if((jtag_tap_fsm_state == `JtagState_binary_sequential_DR_SHIFT)) begin
        _zz_jtag_tap_tdoDr_1 <= ({io_jtag_tdi,_zz_jtag_tap_tdoDr_1} >>> 1);
      end
    end
  end

  always @(negedge io_jtag_tck) begin
    jtag_tap_tdoUnbufferd_regNext <= jtag_tap_tdoUnbufferd;
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
  input               mainClock,
  input               resetCtrl_systemClockReset,
  input               resetCtrl_mainClockReset
);
  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_ready;
  reg        [31:0]   _zz_RegFilePlugin_regFile_port0;
  reg        [31:0]   _zz_RegFilePlugin_regFile_port1;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_push_ready;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_inst;
  wire       [0:0]    IBusSimplePlugin_rspJoin_rspBuffer_c_io_occupancy;
  wire       [47:0]   _zz_memory_MUL;
  wire       [47:0]   _zz_memory_MUL_1;
  wire       [31:0]   _zz_execute_SHIFT_RIGHT;
  wire       [32:0]   _zz_execute_SHIFT_RIGHT_1;
  wire       [32:0]   _zz_execute_SHIFT_RIGHT_2;
  wire       [30:0]   _zz_decode_DO_EBREAK;
  wire       [30:0]   _zz_decode_DO_EBREAK_1;
  wire       [30:0]   _zz_decode_DO_EBREAK_2;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_1;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_2;
  wire                _zz_decode_LEGAL_INSTRUCTION_3;
  wire       [0:0]    _zz_decode_LEGAL_INSTRUCTION_4;
  wire       [13:0]   _zz_decode_LEGAL_INSTRUCTION_5;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_6;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_7;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_8;
  wire                _zz_decode_LEGAL_INSTRUCTION_9;
  wire       [0:0]    _zz_decode_LEGAL_INSTRUCTION_10;
  wire       [7:0]    _zz_decode_LEGAL_INSTRUCTION_11;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_12;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_13;
  wire       [31:0]   _zz_decode_LEGAL_INSTRUCTION_14;
  wire                _zz_decode_LEGAL_INSTRUCTION_15;
  wire       [0:0]    _zz_decode_LEGAL_INSTRUCTION_16;
  wire       [1:0]    _zz_decode_LEGAL_INSTRUCTION_17;
  wire       [1:0]    _zz_IBusSimplePlugin_jump_pcLoad_payload_1;
  wire       [1:0]    _zz_IBusSimplePlugin_jump_pcLoad_payload_2;
  wire       [31:0]   _zz_IBusSimplePlugin_fetchPc_pc;
  wire       [2:0]    _zz_IBusSimplePlugin_fetchPc_pc_1;
  wire       [2:0]    _zz_IBusSimplePlugin_pending_next;
  wire       [2:0]    _zz_IBusSimplePlugin_pending_next_1;
  wire       [0:0]    _zz_IBusSimplePlugin_pending_next_2;
  wire       [2:0]    _zz_IBusSimplePlugin_pending_next_3;
  wire       [0:0]    _zz_IBusSimplePlugin_pending_next_4;
  wire       [2:0]    _zz_IBusSimplePlugin_rspJoin_rspBuffer_discardCounter;
  wire       [0:0]    _zz_IBusSimplePlugin_rspJoin_rspBuffer_discardCounter_1;
  wire       [2:0]    _zz_DBusSimplePlugin_memoryExceptionPort_payload_code;
  wire       [1:0]    _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1;
  wire       [1:0]    _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1_1;
  wire                _zz_when;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB_1;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB_2;
  wire                _zz__zz_decode_IS_OP_SUB_3;
  wire       [0:0]    _zz__zz_decode_IS_OP_SUB_4;
  wire       [0:0]    _zz__zz_decode_IS_OP_SUB_5;
  wire                _zz__zz_decode_IS_OP_SUB_6;
  wire       [0:0]    _zz__zz_decode_IS_OP_SUB_7;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB_8;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB_9;
  wire       [25:0]   _zz__zz_decode_IS_OP_SUB_10;
  wire                _zz__zz_decode_IS_OP_SUB_11;
  wire       [1:0]    _zz__zz_decode_IS_OP_SUB_12;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB_13;
  wire       [1:0]    _zz__zz_decode_IS_OP_SUB_14;
  wire                _zz__zz_decode_IS_OP_SUB_15;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB_16;
  wire       [0:0]    _zz__zz_decode_IS_OP_SUB_17;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB_18;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB_19;
  wire       [21:0]   _zz__zz_decode_IS_OP_SUB_20;
  wire       [0:0]    _zz__zz_decode_IS_OP_SUB_21;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB_22;
  wire       [1:0]    _zz__zz_decode_IS_OP_SUB_23;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB_24;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB_25;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB_26;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB_27;
  wire       [0:0]    _zz__zz_decode_IS_OP_SUB_28;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB_29;
  wire       [0:0]    _zz__zz_decode_IS_OP_SUB_30;
  wire                _zz__zz_decode_IS_OP_SUB_31;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB_32;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB_33;
  wire       [0:0]    _zz__zz_decode_IS_OP_SUB_34;
  wire                _zz__zz_decode_IS_OP_SUB_35;
  wire       [17:0]   _zz__zz_decode_IS_OP_SUB_36;
  wire       [1:0]    _zz__zz_decode_IS_OP_SUB_37;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB_38;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB_39;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB_40;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB_41;
  wire       [1:0]    _zz__zz_decode_IS_OP_SUB_42;
  wire                _zz__zz_decode_IS_OP_SUB_43;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB_44;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB_45;
  wire       [0:0]    _zz__zz_decode_IS_OP_SUB_46;
  wire       [0:0]    _zz__zz_decode_IS_OP_SUB_47;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB_48;
  wire       [0:0]    _zz__zz_decode_IS_OP_SUB_49;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB_50;
  wire       [14:0]   _zz__zz_decode_IS_OP_SUB_51;
  wire       [2:0]    _zz__zz_decode_IS_OP_SUB_52;
  wire                _zz__zz_decode_IS_OP_SUB_53;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB_54;
  wire                _zz__zz_decode_IS_OP_SUB_55;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB_56;
  wire       [2:0]    _zz__zz_decode_IS_OP_SUB_57;
  wire                _zz__zz_decode_IS_OP_SUB_58;
  wire                _zz__zz_decode_IS_OP_SUB_59;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB_60;
  wire       [0:0]    _zz__zz_decode_IS_OP_SUB_61;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB_62;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB_63;
  wire       [0:0]    _zz__zz_decode_IS_OP_SUB_64;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB_65;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB_66;
  wire       [0:0]    _zz__zz_decode_IS_OP_SUB_67;
  wire                _zz__zz_decode_IS_OP_SUB_68;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB_69;
  wire       [11:0]   _zz__zz_decode_IS_OP_SUB_70;
  wire       [3:0]    _zz__zz_decode_IS_OP_SUB_71;
  wire                _zz__zz_decode_IS_OP_SUB_72;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB_73;
  wire       [0:0]    _zz__zz_decode_IS_OP_SUB_74;
  wire       [1:0]    _zz__zz_decode_IS_OP_SUB_75;
  wire                _zz__zz_decode_IS_OP_SUB_76;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB_77;
  wire       [3:0]    _zz__zz_decode_IS_OP_SUB_78;
  wire                _zz__zz_decode_IS_OP_SUB_79;
  wire       [0:0]    _zz__zz_decode_IS_OP_SUB_80;
  wire       [3:0]    _zz__zz_decode_IS_OP_SUB_81;
  wire                _zz__zz_decode_IS_OP_SUB_82;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB_83;
  wire       [0:0]    _zz__zz_decode_IS_OP_SUB_84;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB_85;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB_86;
  wire       [1:0]    _zz__zz_decode_IS_OP_SUB_87;
  wire                _zz__zz_decode_IS_OP_SUB_88;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB_89;
  wire                _zz__zz_decode_IS_OP_SUB_90;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB_91;
  wire       [0:0]    _zz__zz_decode_IS_OP_SUB_92;
  wire       [6:0]    _zz__zz_decode_IS_OP_SUB_93;
  wire       [0:0]    _zz__zz_decode_IS_OP_SUB_94;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB_95;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB_96;
  wire       [4:0]    _zz__zz_decode_IS_OP_SUB_97;
  wire                _zz__zz_decode_IS_OP_SUB_98;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB_99;
  wire       [0:0]    _zz__zz_decode_IS_OP_SUB_100;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB_101;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB_102;
  wire       [2:0]    _zz__zz_decode_IS_OP_SUB_103;
  wire                _zz__zz_decode_IS_OP_SUB_104;
  wire       [0:0]    _zz__zz_decode_IS_OP_SUB_105;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB_106;
  wire       [0:0]    _zz__zz_decode_IS_OP_SUB_107;
  wire       [6:0]    _zz__zz_decode_IS_OP_SUB_108;
  wire       [8:0]    _zz__zz_decode_IS_OP_SUB_109;
  wire                _zz__zz_decode_IS_OP_SUB_110;
  wire       [0:0]    _zz__zz_decode_IS_OP_SUB_111;
  wire       [0:0]    _zz__zz_decode_IS_OP_SUB_112;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB_113;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB_114;
  wire       [0:0]    _zz__zz_decode_IS_OP_SUB_115;
  wire       [1:0]    _zz__zz_decode_IS_OP_SUB_116;
  wire       [1:0]    _zz__zz_decode_IS_OP_SUB_117;
  wire       [6:0]    _zz__zz_decode_IS_OP_SUB_118;
  wire                _zz__zz_decode_IS_OP_SUB_119;
  wire                _zz__zz_decode_IS_OP_SUB_120;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB_121;
  wire       [0:0]    _zz__zz_decode_IS_OP_SUB_122;
  wire       [0:0]    _zz__zz_decode_IS_OP_SUB_123;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB_124;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB_125;
  wire       [0:0]    _zz__zz_decode_IS_OP_SUB_126;
  wire       [4:0]    _zz__zz_decode_IS_OP_SUB_127;
  wire                _zz__zz_decode_IS_OP_SUB_128;
  wire       [0:0]    _zz__zz_decode_IS_OP_SUB_129;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB_130;
  wire       [2:0]    _zz__zz_decode_IS_OP_SUB_131;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB_132;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB_133;
  wire                _zz__zz_decode_IS_OP_SUB_134;
  wire                _zz__zz_decode_IS_OP_SUB_135;
  wire       [0:0]    _zz__zz_decode_IS_OP_SUB_136;
  wire       [0:0]    _zz__zz_decode_IS_OP_SUB_137;
  wire       [31:0]   _zz__zz_decode_IS_OP_SUB_138;
  wire       [0:0]    _zz__zz_decode_IS_OP_SUB_139;
  wire       [2:0]    _zz__zz_decode_IS_OP_SUB_140;
  wire                _zz__zz_decode_IS_OP_SUB_141;
  wire                _zz__zz_decode_IS_OP_SUB_142;
  wire       [0:0]    _zz__zz_decode_IS_OP_SUB_143;
  wire       [0:0]    _zz__zz_decode_IS_OP_SUB_144;
  wire       [0:0]    _zz__zz_decode_IS_OP_SUB_145;
  wire       [0:0]    _zz__zz_decode_IS_OP_SUB_146;
  wire       [0:0]    _zz__zz_decode_IS_OP_SUB_147;
  wire       [0:0]    _zz__zz_decode_IS_OP_SUB_148;
  wire       [0:0]    _zz__zz_decode_IS_OP_SUB_149;
  wire       [0:0]    _zz__zz_decode_IS_OP_SUB_150;
  wire                _zz_RegFilePlugin_regFile_port;
  wire                _zz_decode_RegFilePlugin_rs1Data;
  wire                _zz_RegFilePlugin_regFile_port_1;
  wire                _zz_decode_RegFilePlugin_rs2Data;
  wire       [0:0]    _zz__zz_execute_REGFILE_WRITE_DATA;
  wire       [2:0]    _zz__zz_decode_SRC1_1;
  wire       [4:0]    _zz__zz_decode_SRC1_1_1;
  wire       [11:0]   _zz__zz_decode_SRC2_4;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub_1;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub_2;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub_3;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub_4;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub_5;
  wire       [31:0]   _zz_execute_SrcPlugin_addSub_6;
  wire       [19:0]   _zz__zz_execute_BranchPlugin_branch_src2;
  wire       [11:0]   _zz__zz_execute_BranchPlugin_branch_src2_4;
  wire       [32:0]   _zz_memory_CombaPlugin_hllh;
  wire       [71:0]   _zz_writeBack_CombaPlugin_sum;
  wire       [39:0]   _zz_writeBack_CombaPlugin_acc;
  wire       [31:0]   _zz__zz_decode_RS2;
  wire       [31:0]   _zz__zz_decode_RS2_1;
  wire       [31:0]   _zz__zz_decode_RS2_2;
  wire       [31:0]   _zz__zz_decode_RS2_3;
  wire       [63:0]   memory_MUL;
  wire       [31:0]   execute_MUL_HH;
  wire       [31:0]   execute_MUL_HL;
  wire       [31:0]   execute_MUL_LH;
  wire       [31:0]   execute_MUL_LL;
  wire       [31:0]   execute_BRANCH_CALC;
  wire                execute_BRANCH_DO;
  wire       [31:0]   execute_SHIFT_RIGHT;
  wire       [31:0]   writeBack_REGFILE_WRITE_DATA;
  wire       [31:0]   execute_REGFILE_WRITE_DATA;
  wire       [1:0]    execute_MEMORY_ADDRESS_LOW;
  wire                decode_DO_EBREAK;
  wire       [31:0]   memory_SRC2;
  wire       [31:0]   decode_SRC2;
  wire       [31:0]   memory_SRC1;
  wire       [31:0]   decode_SRC1;
  wire                decode_SRC2_FORCE_ZERO;
  wire                memory_IS_OP_SUB;
  wire                execute_IS_OP_SUB;
  wire                decode_IS_OP_SUB;
  wire                memory_IS_OP_ADD;
  wire                execute_IS_OP_ADD;
  wire                decode_IS_OP_ADD;
  wire                memory_IS_OP_MUL;
  wire                execute_IS_OP_MUL;
  wire                decode_IS_OP_MUL;
  wire                memory_IS_COMBA;
  wire                execute_IS_COMBA;
  wire                decode_IS_COMBA;
  wire                memory_IS_OP_SHIFT;
  wire                execute_IS_OP_SHIFT;
  wire                decode_IS_OP_SHIFT;
  wire                memory_IS_MUL;
  wire                execute_IS_MUL;
  wire                decode_IS_MUL;
  wire       `BranchCtrlEnum_binary_sequential_type decode_BRANCH_CTRL;
  wire       `BranchCtrlEnum_binary_sequential_type _zz_decode_BRANCH_CTRL;
  wire       `BranchCtrlEnum_binary_sequential_type _zz_decode_to_execute_BRANCH_CTRL;
  wire       `BranchCtrlEnum_binary_sequential_type _zz_decode_to_execute_BRANCH_CTRL_1;
  wire       `ShiftCtrlEnum_binary_sequential_type _zz_execute_to_memory_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_binary_sequential_type _zz_execute_to_memory_SHIFT_CTRL_1;
  wire       `ShiftCtrlEnum_binary_sequential_type decode_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_binary_sequential_type _zz_decode_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_binary_sequential_type _zz_decode_to_execute_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_binary_sequential_type _zz_decode_to_execute_SHIFT_CTRL_1;
  wire       `AluBitwiseCtrlEnum_binary_sequential_type decode_ALU_BITWISE_CTRL;
  wire       `AluBitwiseCtrlEnum_binary_sequential_type _zz_decode_ALU_BITWISE_CTRL;
  wire       `AluBitwiseCtrlEnum_binary_sequential_type _zz_decode_to_execute_ALU_BITWISE_CTRL;
  wire       `AluBitwiseCtrlEnum_binary_sequential_type _zz_decode_to_execute_ALU_BITWISE_CTRL_1;
  wire                decode_SRC_LESS_UNSIGNED;
  wire       `EnvCtrlEnum_binary_sequential_type _zz_memory_to_writeBack_ENV_CTRL;
  wire       `EnvCtrlEnum_binary_sequential_type _zz_memory_to_writeBack_ENV_CTRL_1;
  wire       `EnvCtrlEnum_binary_sequential_type _zz_execute_to_memory_ENV_CTRL;
  wire       `EnvCtrlEnum_binary_sequential_type _zz_execute_to_memory_ENV_CTRL_1;
  wire       `EnvCtrlEnum_binary_sequential_type decode_ENV_CTRL;
  wire       `EnvCtrlEnum_binary_sequential_type _zz_decode_ENV_CTRL;
  wire       `EnvCtrlEnum_binary_sequential_type _zz_decode_to_execute_ENV_CTRL;
  wire       `EnvCtrlEnum_binary_sequential_type _zz_decode_to_execute_ENV_CTRL_1;
  wire                decode_IS_CSR;
  wire                decode_MEMORY_STORE;
  wire                execute_BYPASSABLE_MEMORY_STAGE;
  wire                decode_BYPASSABLE_MEMORY_STAGE;
  wire                decode_BYPASSABLE_EXECUTE_STAGE;
  wire       `AluCtrlEnum_binary_sequential_type decode_ALU_CTRL;
  wire       `AluCtrlEnum_binary_sequential_type _zz_decode_ALU_CTRL;
  wire       `AluCtrlEnum_binary_sequential_type _zz_decode_to_execute_ALU_CTRL;
  wire       `AluCtrlEnum_binary_sequential_type _zz_decode_to_execute_ALU_CTRL_1;
  wire                decode_MEMORY_ENABLE;
  wire                decode_CSR_READ_OPCODE;
  wire                decode_CSR_WRITE_OPCODE;
  wire       [31:0]   writeBack_FORMAL_PC_NEXT;
  wire       [31:0]   memory_FORMAL_PC_NEXT;
  wire       [31:0]   execute_FORMAL_PC_NEXT;
  wire       [31:0]   decode_FORMAL_PC_NEXT;
  wire       [31:0]   memory_PC;
  wire                execute_DO_EBREAK;
  wire                decode_IS_EBREAK;
  wire                writeBack_IS_MUL;
  wire                writeBack_IS_OP_SHIFT;
  wire                writeBack_IS_OP_SUB;
  wire       [31:0]   writeBack_SRC1;
  wire       [31:0]   writeBack_SRC2;
  wire                writeBack_IS_OP_ADD;
  wire       [63:0]   writeBack_MUL;
  wire                writeBack_IS_OP_MUL;
  wire                writeBack_IS_COMBA;
  wire       [31:0]   memory_MUL_HH;
  wire       [31:0]   memory_MUL_HL;
  wire       [31:0]   memory_MUL_LH;
  wire       [31:0]   memory_MUL_LL;
  wire       [31:0]   memory_BRANCH_CALC;
  wire                memory_BRANCH_DO;
  wire       [31:0]   execute_PC;
  wire       [31:0]   execute_RS1;
  wire       `BranchCtrlEnum_binary_sequential_type execute_BRANCH_CTRL;
  wire       `BranchCtrlEnum_binary_sequential_type _zz_execute_BRANCH_CTRL;
  wire                decode_RS2_USE;
  wire                decode_RS1_USE;
  wire                execute_REGFILE_WRITE_VALID;
  wire                execute_BYPASSABLE_EXECUTE_STAGE;
  wire                memory_REGFILE_WRITE_VALID;
  wire                memory_BYPASSABLE_MEMORY_STAGE;
  wire                writeBack_REGFILE_WRITE_VALID;
  reg        [31:0]   decode_RS2;
  reg        [31:0]   decode_RS1;
  wire       [31:0]   memory_SHIFT_RIGHT;
  wire       `ShiftCtrlEnum_binary_sequential_type memory_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_binary_sequential_type _zz_memory_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_binary_sequential_type execute_SHIFT_CTRL;
  wire       `ShiftCtrlEnum_binary_sequential_type _zz_execute_SHIFT_CTRL;
  wire                execute_SRC_LESS_UNSIGNED;
  wire                execute_SRC2_FORCE_ZERO;
  wire                execute_SRC_USE_SUB_LESS;
  wire       [31:0]   _zz_decode_SRC2;
  wire       [31:0]   _zz_decode_SRC2_1;
  wire       `Src2CtrlEnum_binary_sequential_type decode_SRC2_CTRL;
  wire       `Src2CtrlEnum_binary_sequential_type _zz_decode_SRC2_CTRL;
  wire       [31:0]   _zz_decode_SRC1;
  wire       `Src1CtrlEnum_binary_sequential_type decode_SRC1_CTRL;
  wire       `Src1CtrlEnum_binary_sequential_type _zz_decode_SRC1_CTRL;
  wire                decode_SRC_USE_SUB_LESS;
  wire                decode_SRC_ADD_ZERO;
  wire       [31:0]   execute_SRC_ADD_SUB;
  wire                execute_SRC_LESS;
  wire       `AluCtrlEnum_binary_sequential_type execute_ALU_CTRL;
  wire       `AluCtrlEnum_binary_sequential_type _zz_execute_ALU_CTRL;
  wire       [31:0]   execute_SRC2;
  wire       `AluBitwiseCtrlEnum_binary_sequential_type execute_ALU_BITWISE_CTRL;
  wire       `AluBitwiseCtrlEnum_binary_sequential_type _zz_execute_ALU_BITWISE_CTRL;
  reg        [31:0]   _zz_decode_RS2;
  wire       [31:0]   _zz_lastStageRegFileWrite_payload_address;
  wire                _zz_lastStageRegFileWrite_valid;
  reg                 _zz_1;
  wire       [31:0]   decode_INSTRUCTION_ANTICIPATED;
  reg                 decode_REGFILE_WRITE_VALID;
  wire                decode_LEGAL_INSTRUCTION;
  wire       `BranchCtrlEnum_binary_sequential_type _zz_decode_BRANCH_CTRL_1;
  wire       `ShiftCtrlEnum_binary_sequential_type _zz_decode_SHIFT_CTRL_1;
  wire       `AluBitwiseCtrlEnum_binary_sequential_type _zz_decode_ALU_BITWISE_CTRL_1;
  wire       `EnvCtrlEnum_binary_sequential_type _zz_decode_ENV_CTRL_1;
  wire       `Src2CtrlEnum_binary_sequential_type _zz_decode_SRC2_CTRL_1;
  wire       `AluCtrlEnum_binary_sequential_type _zz_decode_ALU_CTRL_1;
  wire       `Src1CtrlEnum_binary_sequential_type _zz_decode_SRC1_CTRL_1;
  reg        [31:0]   _zz_decode_RS2_1;
  wire       [31:0]   execute_SRC1;
  wire                execute_CSR_READ_OPCODE;
  wire                execute_CSR_WRITE_OPCODE;
  wire                execute_IS_CSR;
  wire       `EnvCtrlEnum_binary_sequential_type memory_ENV_CTRL;
  wire       `EnvCtrlEnum_binary_sequential_type _zz_memory_ENV_CTRL;
  wire       `EnvCtrlEnum_binary_sequential_type execute_ENV_CTRL;
  wire       `EnvCtrlEnum_binary_sequential_type _zz_execute_ENV_CTRL;
  wire       `EnvCtrlEnum_binary_sequential_type writeBack_ENV_CTRL;
  wire       `EnvCtrlEnum_binary_sequential_type _zz_writeBack_ENV_CTRL;
  reg        [31:0]   _zz_decode_RS2_2;
  wire       [31:0]   memory_INSTRUCTION;
  wire       [1:0]    memory_MEMORY_ADDRESS_LOW;
  wire       [31:0]   memory_MEMORY_READ_DATA;
  wire                memory_ALIGNEMENT_FAULT;
  wire       [31:0]   memory_REGFILE_WRITE_DATA;
  wire                memory_MEMORY_STORE;
  wire                memory_MEMORY_ENABLE;
  wire       [31:0]   execute_SRC_ADD;
  wire       [31:0]   execute_RS2;
  wire       [31:0]   execute_INSTRUCTION;
  wire                execute_MEMORY_STORE;
  wire                execute_MEMORY_ENABLE;
  wire                execute_ALIGNEMENT_FAULT;
  reg        [31:0]   _zz_memory_to_writeBack_FORMAL_PC_NEXT;
  wire       [31:0]   decode_PC;
  wire       [31:0]   decode_INSTRUCTION;
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
  wire                IBusSimplePlugin_pcValids_0;
  wire                IBusSimplePlugin_pcValids_1;
  wire                IBusSimplePlugin_pcValids_2;
  wire                IBusSimplePlugin_pcValids_3;
  wire                IBusSimplePlugin_decodeExceptionPort_valid;
  reg        [3:0]    IBusSimplePlugin_decodeExceptionPort_payload_code;
  wire       [31:0]   IBusSimplePlugin_decodeExceptionPort_payload_badAddr;
  reg                 DBusSimplePlugin_memoryExceptionPort_valid;
  reg        [3:0]    DBusSimplePlugin_memoryExceptionPort_payload_code;
  wire       [31:0]   DBusSimplePlugin_memoryExceptionPort_payload_badAddr;
  wire       [31:0]   CsrPlugin_csrMapping_readDataSignal;
  wire       [31:0]   CsrPlugin_csrMapping_readDataInit;
  wire       [31:0]   CsrPlugin_csrMapping_writeDataSignal;
  wire                CsrPlugin_csrMapping_allowCsrSignal;
  wire                CsrPlugin_csrMapping_hazardFree;
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
  reg                 CsrPlugin_allowInterrupts;
  reg                 CsrPlugin_allowException;
  reg                 CsrPlugin_allowEbreakException;
  wire                decodeExceptionPort_valid;
  wire       [3:0]    decodeExceptionPort_payload_code;
  wire       [31:0]   decodeExceptionPort_payload_badAddr;
  wire                BranchPlugin_jumpInterface_valid;
  wire       [31:0]   BranchPlugin_jumpInterface_payload;
  reg                 IBusSimplePlugin_injectionPort_valid;
  reg                 IBusSimplePlugin_injectionPort_ready;
  wire       [31:0]   IBusSimplePlugin_injectionPort_payload;
  wire                IBusSimplePlugin_externalFlush;
  wire                IBusSimplePlugin_jump_pcLoad_valid;
  wire       [31:0]   IBusSimplePlugin_jump_pcLoad_payload;
  wire       [1:0]    _zz_IBusSimplePlugin_jump_pcLoad_payload;
  wire                IBusSimplePlugin_fetchPc_output_valid;
  wire                IBusSimplePlugin_fetchPc_output_ready;
  wire       [31:0]   IBusSimplePlugin_fetchPc_output_payload;
  reg        [31:0]   IBusSimplePlugin_fetchPc_pcReg /* verilator public */ ;
  reg                 IBusSimplePlugin_fetchPc_correction;
  reg                 IBusSimplePlugin_fetchPc_correctionReg;
  wire                IBusSimplePlugin_fetchPc_output_fire;
  wire                IBusSimplePlugin_fetchPc_corrected;
  reg                 IBusSimplePlugin_fetchPc_pcRegPropagate;
  reg                 IBusSimplePlugin_fetchPc_booted;
  reg                 IBusSimplePlugin_fetchPc_inc;
  wire                when_Fetcher_l131;
  wire                IBusSimplePlugin_fetchPc_output_fire_1;
  wire                when_Fetcher_l131_1;
  reg        [31:0]   IBusSimplePlugin_fetchPc_pc;
  reg                 IBusSimplePlugin_fetchPc_flushed;
  wire                when_Fetcher_l158;
  wire                IBusSimplePlugin_iBusRsp_redoFetch;
  wire                IBusSimplePlugin_iBusRsp_stages_0_input_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_0_input_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_0_input_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_0_output_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_0_output_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_0_output_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_0_halt;
  wire                IBusSimplePlugin_iBusRsp_stages_1_input_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_1_input_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_1_input_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_1_output_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_1_output_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_1_output_payload;
  reg                 IBusSimplePlugin_iBusRsp_stages_1_halt;
  wire                IBusSimplePlugin_iBusRsp_stages_2_input_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_2_input_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_2_input_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_2_output_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_2_output_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_2_output_payload;
  wire                IBusSimplePlugin_iBusRsp_stages_2_halt;
  wire                _zz_IBusSimplePlugin_iBusRsp_stages_0_input_ready;
  wire                _zz_IBusSimplePlugin_iBusRsp_stages_1_input_ready;
  wire                _zz_IBusSimplePlugin_iBusRsp_stages_2_input_ready;
  wire                IBusSimplePlugin_iBusRsp_flush;
  wire                _zz_IBusSimplePlugin_iBusRsp_stages_0_output_ready;
  wire                _zz_IBusSimplePlugin_iBusRsp_stages_0_output_ready_1;
  reg                 _zz_IBusSimplePlugin_iBusRsp_stages_0_output_ready_2;
  wire                IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_valid;
  wire                IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_payload;
  reg                 _zz_IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_valid;
  reg        [31:0]   _zz_IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_payload;
  reg                 IBusSimplePlugin_iBusRsp_readyForError;
  wire                IBusSimplePlugin_iBusRsp_output_valid;
  wire                IBusSimplePlugin_iBusRsp_output_ready;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_output_payload_pc;
  wire                IBusSimplePlugin_iBusRsp_output_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_iBusRsp_output_payload_rsp_inst;
  wire                IBusSimplePlugin_iBusRsp_output_payload_isRvc;
  wire                when_Fetcher_l240;
  wire                IBusSimplePlugin_injector_decodeInput_valid;
  wire                IBusSimplePlugin_injector_decodeInput_ready;
  wire       [31:0]   IBusSimplePlugin_injector_decodeInput_payload_pc;
  wire                IBusSimplePlugin_injector_decodeInput_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_injector_decodeInput_payload_rsp_inst;
  wire                IBusSimplePlugin_injector_decodeInput_payload_isRvc;
  reg                 _zz_IBusSimplePlugin_injector_decodeInput_valid;
  reg        [31:0]   _zz_IBusSimplePlugin_injector_decodeInput_payload_pc;
  reg                 _zz_IBusSimplePlugin_injector_decodeInput_payload_rsp_error;
  reg        [31:0]   _zz_IBusSimplePlugin_injector_decodeInput_payload_rsp_inst;
  reg                 _zz_IBusSimplePlugin_injector_decodeInput_payload_isRvc;
  wire                when_Fetcher_l320;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_0;
  wire                when_Fetcher_l329;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_1;
  wire                when_Fetcher_l329_1;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_2;
  wire                when_Fetcher_l329_2;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_3;
  wire                when_Fetcher_l329_3;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_4;
  wire                when_Fetcher_l329_4;
  reg                 IBusSimplePlugin_injector_nextPcCalc_valids_5;
  wire                when_Fetcher_l329_5;
  reg        [31:0]   IBusSimplePlugin_injector_formal_rawInDecode;
  wire                IBusSimplePlugin_cmd_valid;
  wire                IBusSimplePlugin_cmd_ready;
  wire       [31:0]   IBusSimplePlugin_cmd_payload_pc;
  wire                IBusSimplePlugin_pending_inc;
  wire                IBusSimplePlugin_pending_dec;
  reg        [2:0]    IBusSimplePlugin_pending_value;
  wire       [2:0]    IBusSimplePlugin_pending_next;
  wire                IBusSimplePlugin_cmdFork_canEmit;
  wire                when_IBusSimplePlugin_l304;
  wire                IBusSimplePlugin_cmd_fire;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_output_valid;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_output_ready;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_output_payload_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_rspBuffer_output_payload_inst;
  reg        [2:0]    IBusSimplePlugin_rspJoin_rspBuffer_discardCounter;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_flush;
  wire                IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_fire;
  wire       [31:0]   IBusSimplePlugin_rspJoin_fetchRsp_pc;
  reg                 IBusSimplePlugin_rspJoin_fetchRsp_rsp_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst;
  wire                IBusSimplePlugin_rspJoin_fetchRsp_isRvc;
  wire                when_IBusSimplePlugin_l375;
  wire                IBusSimplePlugin_rspJoin_join_valid;
  wire                IBusSimplePlugin_rspJoin_join_ready;
  wire       [31:0]   IBusSimplePlugin_rspJoin_join_payload_pc;
  wire                IBusSimplePlugin_rspJoin_join_payload_rsp_error;
  wire       [31:0]   IBusSimplePlugin_rspJoin_join_payload_rsp_inst;
  wire                IBusSimplePlugin_rspJoin_join_payload_isRvc;
  reg                 IBusSimplePlugin_rspJoin_exceptionDetected;
  wire                IBusSimplePlugin_rspJoin_join_fire;
  wire                IBusSimplePlugin_rspJoin_join_fire_1;
  wire                _zz_IBusSimplePlugin_iBusRsp_output_valid;
  wire                when_IBusSimplePlugin_l401;
  wire                _zz_dBus_cmd_valid;
  reg                 execute_DBusSimplePlugin_skipCmd;
  reg        [31:0]   _zz_dBus_cmd_payload_data;
  wire                when_DBusSimplePlugin_l426;
  reg        [3:0]    _zz_execute_DBusSimplePlugin_formalMask;
  wire       [3:0]    execute_DBusSimplePlugin_formalMask;
  wire                when_DBusSimplePlugin_l479;
  wire                when_DBusSimplePlugin_l486;
  wire                when_DBusSimplePlugin_l512;
  reg        [31:0]   memory_DBusSimplePlugin_rspShifted;
  wire       [1:0]    switch_Misc_l202;
  wire                _zz_memory_DBusSimplePlugin_rspFormated;
  reg        [31:0]   _zz_memory_DBusSimplePlugin_rspFormated_1;
  wire                _zz_memory_DBusSimplePlugin_rspFormated_2;
  reg        [31:0]   _zz_memory_DBusSimplePlugin_rspFormated_3;
  reg        [31:0]   memory_DBusSimplePlugin_rspFormated;
  wire                when_DBusSimplePlugin_l558;
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
  wire                _zz_when_CsrPlugin_l952;
  wire                _zz_when_CsrPlugin_l952_1;
  wire                _zz_when_CsrPlugin_l952_2;
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
  wire       [1:0]    _zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code;
  wire                _zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1;
  wire                when_CsrPlugin_l909;
  wire                when_CsrPlugin_l909_1;
  wire                when_CsrPlugin_l909_2;
  wire                when_CsrPlugin_l909_3;
  wire                when_CsrPlugin_l922;
  reg                 CsrPlugin_interrupt_valid;
  reg        [3:0]    CsrPlugin_interrupt_code /* verilator public */ ;
  reg        [1:0]    CsrPlugin_interrupt_targetPrivilege;
  wire                when_CsrPlugin_l946;
  wire                when_CsrPlugin_l952;
  wire                when_CsrPlugin_l952_1;
  wire                when_CsrPlugin_l952_2;
  wire                CsrPlugin_exception;
  wire                CsrPlugin_lastStageWasWfi;
  reg                 CsrPlugin_pipelineLiberator_pcValids_0;
  reg                 CsrPlugin_pipelineLiberator_pcValids_1;
  reg                 CsrPlugin_pipelineLiberator_pcValids_2;
  wire                CsrPlugin_pipelineLiberator_active;
  wire                when_CsrPlugin_l980;
  wire                when_CsrPlugin_l980_1;
  wire                when_CsrPlugin_l980_2;
  wire                when_CsrPlugin_l985;
  reg                 CsrPlugin_pipelineLiberator_done;
  wire                when_CsrPlugin_l991;
  wire                CsrPlugin_interruptJump /* verilator public */ ;
  reg                 CsrPlugin_hadException /* verilator public */ ;
  reg        [1:0]    CsrPlugin_targetPrivilege;
  reg        [3:0]    CsrPlugin_trapCause;
  reg        [1:0]    CsrPlugin_xtvec_mode;
  reg        [29:0]   CsrPlugin_xtvec_base;
  wire                when_CsrPlugin_l1019;
  wire                when_CsrPlugin_l1064;
  wire       [1:0]    switch_CsrPlugin_l1068;
  reg                 execute_CsrPlugin_wfiWake;
  wire                when_CsrPlugin_l1116;
  wire                execute_CsrPlugin_blockedBySideEffects;
  reg                 execute_CsrPlugin_illegalAccess;
  reg                 execute_CsrPlugin_illegalInstruction;
  wire                when_CsrPlugin_l1136;
  wire                when_CsrPlugin_l1137;
  reg                 execute_CsrPlugin_writeInstruction;
  reg                 execute_CsrPlugin_readInstruction;
  wire                execute_CsrPlugin_writeEnable;
  wire                execute_CsrPlugin_readEnable;
  wire       [31:0]   execute_CsrPlugin_readToWriteData;
  wire                switch_Misc_l202_1;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_writeDataSignal;
  wire                when_CsrPlugin_l1176;
  wire                when_CsrPlugin_l1180;
  wire       [11:0]   execute_CsrPlugin_csrAddress;
  wire       [31:0]   _zz_decode_IS_OP_SUB;
  wire                _zz_decode_IS_OP_SUB_1;
  wire                _zz_decode_IS_OP_SUB_2;
  wire                _zz_decode_IS_OP_SUB_3;
  wire                _zz_decode_IS_OP_SUB_4;
  wire                _zz_decode_IS_OP_SUB_5;
  wire       `Src1CtrlEnum_binary_sequential_type _zz_decode_SRC1_CTRL_2;
  wire       `AluCtrlEnum_binary_sequential_type _zz_decode_ALU_CTRL_2;
  wire       `Src2CtrlEnum_binary_sequential_type _zz_decode_SRC2_CTRL_2;
  wire       `EnvCtrlEnum_binary_sequential_type _zz_decode_ENV_CTRL_2;
  wire       `AluBitwiseCtrlEnum_binary_sequential_type _zz_decode_ALU_BITWISE_CTRL_2;
  wire       `ShiftCtrlEnum_binary_sequential_type _zz_decode_SHIFT_CTRL_2;
  wire       `BranchCtrlEnum_binary_sequential_type _zz_decode_BRANCH_CTRL_2;
  wire                when_RegFilePlugin_l63;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress1;
  wire       [4:0]    decode_RegFilePlugin_regFileReadAddress2;
  wire       [31:0]   decode_RegFilePlugin_rs1Data;
  wire       [31:0]   decode_RegFilePlugin_rs2Data;
  reg                 lastStageRegFileWrite_valid /* verilator public */ ;
  reg        [4:0]    lastStageRegFileWrite_payload_address /* verilator public */ ;
  reg        [31:0]   lastStageRegFileWrite_payload_data /* verilator public */ ;
  reg                 _zz_2;
  reg        [31:0]   execute_IntAluPlugin_bitwise;
  reg        [31:0]   _zz_execute_REGFILE_WRITE_DATA;
  reg        [31:0]   _zz_decode_SRC1_1;
  wire                _zz_decode_SRC2_2;
  reg        [19:0]   _zz_decode_SRC2_3;
  wire                _zz_decode_SRC2_4;
  reg        [19:0]   _zz_decode_SRC2_5;
  reg        [31:0]   _zz_decode_SRC2_6;
  reg        [31:0]   execute_SrcPlugin_addSub;
  wire                execute_SrcPlugin_less;
  wire       [4:0]    execute_FullBarrelShifterPlugin_amplitude;
  reg        [31:0]   _zz_execute_FullBarrelShifterPlugin_reversed;
  wire       [31:0]   execute_FullBarrelShifterPlugin_reversed;
  reg        [31:0]   _zz_decode_RS2_3;
  reg                 HazardSimplePlugin_src0Hazard;
  reg                 HazardSimplePlugin_src1Hazard;
  wire                HazardSimplePlugin_writeBackWrites_valid;
  wire       [4:0]    HazardSimplePlugin_writeBackWrites_payload_address;
  wire       [31:0]   HazardSimplePlugin_writeBackWrites_payload_data;
  reg                 HazardSimplePlugin_writeBackBuffer_valid;
  reg        [4:0]    HazardSimplePlugin_writeBackBuffer_payload_address;
  reg        [31:0]   HazardSimplePlugin_writeBackBuffer_payload_data;
  wire                HazardSimplePlugin_addr0Match;
  wire                HazardSimplePlugin_addr1Match;
  wire                when_HazardSimplePlugin_l47;
  wire                when_HazardSimplePlugin_l48;
  wire                when_HazardSimplePlugin_l51;
  wire                when_HazardSimplePlugin_l45;
  wire                when_HazardSimplePlugin_l57;
  wire                when_HazardSimplePlugin_l58;
  wire                when_HazardSimplePlugin_l48_1;
  wire                when_HazardSimplePlugin_l51_1;
  wire                when_HazardSimplePlugin_l45_1;
  wire                when_HazardSimplePlugin_l57_1;
  wire                when_HazardSimplePlugin_l58_1;
  wire                when_HazardSimplePlugin_l48_2;
  wire                when_HazardSimplePlugin_l51_2;
  wire                when_HazardSimplePlugin_l45_2;
  wire                when_HazardSimplePlugin_l57_2;
  wire                when_HazardSimplePlugin_l58_2;
  wire                when_HazardSimplePlugin_l105;
  wire                when_HazardSimplePlugin_l108;
  wire                when_HazardSimplePlugin_l113;
  wire                execute_BranchPlugin_eq;
  wire       [2:0]    switch_Misc_l202_2;
  reg                 _zz_execute_BRANCH_DO;
  reg                 _zz_execute_BRANCH_DO_1;
  wire       [31:0]   execute_BranchPlugin_branch_src1;
  wire                _zz_execute_BranchPlugin_branch_src2;
  reg        [10:0]   _zz_execute_BranchPlugin_branch_src2_1;
  wire                _zz_execute_BranchPlugin_branch_src2_2;
  reg        [19:0]   _zz_execute_BranchPlugin_branch_src2_3;
  wire                _zz_execute_BranchPlugin_branch_src2_4;
  reg        [18:0]   _zz_execute_BranchPlugin_branch_src2_5;
  reg        [31:0]   _zz_execute_BranchPlugin_branch_src2_6;
  wire       [31:0]   execute_BranchPlugin_branch_src2;
  wire       [31:0]   execute_BranchPlugin_branchAdder;
  wire       [31:0]   execute_CombaPlugin_a;
  wire       [31:0]   execute_CombaPlugin_b;
  wire       [15:0]   execute_CombaPlugin_aLow;
  wire       [15:0]   execute_CombaPlugin_bLow;
  wire       [15:0]   execute_CombaPlugin_aHigh;
  wire       [15:0]   execute_CombaPlugin_bHigh;
  wire       [31:0]   memory_CombaPlugin_ll;
  wire       [32:0]   memory_CombaPlugin_lh;
  wire       [31:0]   memory_CombaPlugin_hl;
  wire       [31:0]   memory_CombaPlugin_hh;
  wire       [32:0]   memory_CombaPlugin_hllh;
  reg        [71:0]   writeBack_CombaPlugin_acc;
  reg        [63:0]   writeBack_CombaPlugin_invalue;
  wire       [71:0]   writeBack_CombaPlugin_sum;
  wire                when_CombaPlugin_l197;
  reg                 writeBack_CombaPlugin_aSigned;
  reg                 writeBack_CombaPlugin_bSigned;
  wire       [1:0]    switch_CombaPlugin_l215;
  wire       [31:0]   writeBack_CombaPlugin_a;
  wire       [31:0]   writeBack_CombaPlugin_b;
  wire                when_CombaPlugin_l233;
  wire       [1:0]    switch_CombaPlugin_l234;
  reg                 DebugPlugin_firstCycle;
  reg                 DebugPlugin_secondCycle;
  reg                 DebugPlugin_resetIt;
  reg                 DebugPlugin_haltIt;
  reg                 DebugPlugin_stepIt;
  reg                 DebugPlugin_isPipBusy;
  reg                 DebugPlugin_godmode;
  wire                when_DebugPlugin_l225;
  reg                 DebugPlugin_haltedByBreak;
  reg                 DebugPlugin_debugUsed /* verilator public */ ;
  reg                 DebugPlugin_disableEbreak;
  wire                DebugPlugin_allowEBreak;
  reg                 DebugPlugin_hardwareBreakpoints_0_valid;
  reg        [30:0]   DebugPlugin_hardwareBreakpoints_0_pc;
  reg                 DebugPlugin_hardwareBreakpoints_1_valid;
  reg        [30:0]   DebugPlugin_hardwareBreakpoints_1_pc;
  reg                 DebugPlugin_hardwareBreakpoints_2_valid;
  reg        [30:0]   DebugPlugin_hardwareBreakpoints_2_pc;
  reg        [31:0]   DebugPlugin_busReadDataReg;
  reg                 _zz_when_DebugPlugin_l244;
  wire                when_DebugPlugin_l244;
  wire       [5:0]    switch_DebugPlugin_l256;
  wire                when_DebugPlugin_l260;
  wire                when_DebugPlugin_l260_1;
  wire                when_DebugPlugin_l261;
  wire                when_DebugPlugin_l261_1;
  wire                when_DebugPlugin_l262;
  wire                when_DebugPlugin_l263;
  wire                when_DebugPlugin_l264;
  wire                when_DebugPlugin_l264_1;
  wire                when_DebugPlugin_l284;
  wire                when_DebugPlugin_l287;
  wire                when_DebugPlugin_l300;
  reg                 DebugPlugin_resetIt_regNext;
  wire                when_DebugPlugin_l316;
  wire                when_Pipeline_l124;
  reg        [31:0]   decode_to_execute_PC;
  wire                when_Pipeline_l124_1;
  reg        [31:0]   execute_to_memory_PC;
  wire                when_Pipeline_l124_2;
  reg        [31:0]   memory_to_writeBack_PC;
  wire                when_Pipeline_l124_3;
  reg        [31:0]   decode_to_execute_INSTRUCTION;
  wire                when_Pipeline_l124_4;
  reg        [31:0]   execute_to_memory_INSTRUCTION;
  wire                when_Pipeline_l124_5;
  reg        [31:0]   memory_to_writeBack_INSTRUCTION;
  wire                when_Pipeline_l124_6;
  reg        [31:0]   decode_to_execute_FORMAL_PC_NEXT;
  wire                when_Pipeline_l124_7;
  reg        [31:0]   execute_to_memory_FORMAL_PC_NEXT;
  wire                when_Pipeline_l124_8;
  reg        [31:0]   memory_to_writeBack_FORMAL_PC_NEXT;
  wire                when_Pipeline_l124_9;
  reg                 decode_to_execute_CSR_WRITE_OPCODE;
  wire                when_Pipeline_l124_10;
  reg                 decode_to_execute_CSR_READ_OPCODE;
  wire                when_Pipeline_l124_11;
  reg                 decode_to_execute_SRC_USE_SUB_LESS;
  wire                when_Pipeline_l124_12;
  reg                 decode_to_execute_MEMORY_ENABLE;
  wire                when_Pipeline_l124_13;
  reg                 execute_to_memory_MEMORY_ENABLE;
  wire                when_Pipeline_l124_14;
  reg        `AluCtrlEnum_binary_sequential_type decode_to_execute_ALU_CTRL;
  wire                when_Pipeline_l124_15;
  reg                 decode_to_execute_REGFILE_WRITE_VALID;
  wire                when_Pipeline_l124_16;
  reg                 execute_to_memory_REGFILE_WRITE_VALID;
  wire                when_Pipeline_l124_17;
  reg                 memory_to_writeBack_REGFILE_WRITE_VALID;
  wire                when_Pipeline_l124_18;
  reg                 decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  wire                when_Pipeline_l124_19;
  reg                 decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  wire                when_Pipeline_l124_20;
  reg                 execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  wire                when_Pipeline_l124_21;
  reg                 decode_to_execute_MEMORY_STORE;
  wire                when_Pipeline_l124_22;
  reg                 execute_to_memory_MEMORY_STORE;
  wire                when_Pipeline_l124_23;
  reg                 decode_to_execute_IS_CSR;
  wire                when_Pipeline_l124_24;
  reg        `EnvCtrlEnum_binary_sequential_type decode_to_execute_ENV_CTRL;
  wire                when_Pipeline_l124_25;
  reg        `EnvCtrlEnum_binary_sequential_type execute_to_memory_ENV_CTRL;
  wire                when_Pipeline_l124_26;
  reg        `EnvCtrlEnum_binary_sequential_type memory_to_writeBack_ENV_CTRL;
  wire                when_Pipeline_l124_27;
  reg                 decode_to_execute_SRC_LESS_UNSIGNED;
  wire                when_Pipeline_l124_28;
  reg        `AluBitwiseCtrlEnum_binary_sequential_type decode_to_execute_ALU_BITWISE_CTRL;
  wire                when_Pipeline_l124_29;
  reg        `ShiftCtrlEnum_binary_sequential_type decode_to_execute_SHIFT_CTRL;
  wire                when_Pipeline_l124_30;
  reg        `ShiftCtrlEnum_binary_sequential_type execute_to_memory_SHIFT_CTRL;
  wire                when_Pipeline_l124_31;
  reg        `BranchCtrlEnum_binary_sequential_type decode_to_execute_BRANCH_CTRL;
  wire                when_Pipeline_l124_32;
  reg                 decode_to_execute_IS_MUL;
  wire                when_Pipeline_l124_33;
  reg                 execute_to_memory_IS_MUL;
  wire                when_Pipeline_l124_34;
  reg                 memory_to_writeBack_IS_MUL;
  wire                when_Pipeline_l124_35;
  reg                 decode_to_execute_IS_OP_SHIFT;
  wire                when_Pipeline_l124_36;
  reg                 execute_to_memory_IS_OP_SHIFT;
  wire                when_Pipeline_l124_37;
  reg                 memory_to_writeBack_IS_OP_SHIFT;
  wire                when_Pipeline_l124_38;
  reg                 decode_to_execute_IS_COMBA;
  wire                when_Pipeline_l124_39;
  reg                 execute_to_memory_IS_COMBA;
  wire                when_Pipeline_l124_40;
  reg                 memory_to_writeBack_IS_COMBA;
  wire                when_Pipeline_l124_41;
  reg                 decode_to_execute_IS_OP_MUL;
  wire                when_Pipeline_l124_42;
  reg                 execute_to_memory_IS_OP_MUL;
  wire                when_Pipeline_l124_43;
  reg                 memory_to_writeBack_IS_OP_MUL;
  wire                when_Pipeline_l124_44;
  reg                 decode_to_execute_IS_OP_ADD;
  wire                when_Pipeline_l124_45;
  reg                 execute_to_memory_IS_OP_ADD;
  wire                when_Pipeline_l124_46;
  reg                 memory_to_writeBack_IS_OP_ADD;
  wire                when_Pipeline_l124_47;
  reg                 decode_to_execute_IS_OP_SUB;
  wire                when_Pipeline_l124_48;
  reg                 execute_to_memory_IS_OP_SUB;
  wire                when_Pipeline_l124_49;
  reg                 memory_to_writeBack_IS_OP_SUB;
  wire                when_Pipeline_l124_50;
  reg        [31:0]   decode_to_execute_RS1;
  wire                when_Pipeline_l124_51;
  reg        [31:0]   decode_to_execute_RS2;
  wire                when_Pipeline_l124_52;
  reg                 decode_to_execute_SRC2_FORCE_ZERO;
  wire                when_Pipeline_l124_53;
  reg        [31:0]   decode_to_execute_SRC1;
  wire                when_Pipeline_l124_54;
  reg        [31:0]   execute_to_memory_SRC1;
  wire                when_Pipeline_l124_55;
  reg        [31:0]   memory_to_writeBack_SRC1;
  wire                when_Pipeline_l124_56;
  reg        [31:0]   decode_to_execute_SRC2;
  wire                when_Pipeline_l124_57;
  reg        [31:0]   execute_to_memory_SRC2;
  wire                when_Pipeline_l124_58;
  reg        [31:0]   memory_to_writeBack_SRC2;
  wire                when_Pipeline_l124_59;
  reg                 decode_to_execute_DO_EBREAK;
  wire                when_Pipeline_l124_60;
  reg                 execute_to_memory_ALIGNEMENT_FAULT;
  wire                when_Pipeline_l124_61;
  reg        [1:0]    execute_to_memory_MEMORY_ADDRESS_LOW;
  wire                when_Pipeline_l124_62;
  reg        [31:0]   execute_to_memory_REGFILE_WRITE_DATA;
  wire                when_Pipeline_l124_63;
  reg        [31:0]   memory_to_writeBack_REGFILE_WRITE_DATA;
  wire                when_Pipeline_l124_64;
  reg        [31:0]   execute_to_memory_SHIFT_RIGHT;
  wire                when_Pipeline_l124_65;
  reg                 execute_to_memory_BRANCH_DO;
  wire                when_Pipeline_l124_66;
  reg        [31:0]   execute_to_memory_BRANCH_CALC;
  wire                when_Pipeline_l124_67;
  reg        [31:0]   execute_to_memory_MUL_LL;
  wire                when_Pipeline_l124_68;
  reg        [31:0]   execute_to_memory_MUL_LH;
  wire                when_Pipeline_l124_69;
  reg        [31:0]   execute_to_memory_MUL_HL;
  wire                when_Pipeline_l124_70;
  reg        [31:0]   execute_to_memory_MUL_HH;
  wire                when_Pipeline_l124_71;
  reg        [63:0]   memory_to_writeBack_MUL;
  wire                when_Pipeline_l151;
  wire                when_Pipeline_l154;
  wire                when_Pipeline_l151_1;
  wire                when_Pipeline_l154_1;
  wire                when_Pipeline_l151_2;
  wire                when_Pipeline_l154_2;
  reg        [2:0]    switch_Fetcher_l362;
  wire                when_Fetcher_l378;
  wire                when_Fetcher_l398;
  wire                when_CsrPlugin_l1264;
  reg                 execute_CsrPlugin_csr_768;
  wire                when_CsrPlugin_l1264_1;
  reg                 execute_CsrPlugin_csr_836;
  wire                when_CsrPlugin_l1264_2;
  reg                 execute_CsrPlugin_csr_772;
  wire                when_CsrPlugin_l1264_3;
  reg                 execute_CsrPlugin_csr_773;
  wire                when_CsrPlugin_l1264_4;
  reg                 execute_CsrPlugin_csr_834;
  wire                when_CsrPlugin_l1264_5;
  reg                 execute_CsrPlugin_csr_2816;
  wire                when_CsrPlugin_l1264_6;
  reg                 execute_CsrPlugin_csr_2944;
  wire                when_CsrPlugin_l1264_7;
  reg                 execute_CsrPlugin_csr_2818;
  wire                when_CsrPlugin_l1264_8;
  reg                 execute_CsrPlugin_csr_2946;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_1;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_2;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_3;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_4;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_5;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_6;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_7;
  reg        [31:0]   _zz_CsrPlugin_csrMapping_readDataInit_8;
  wire                when_CsrPlugin_l1297;
  wire                when_CsrPlugin_l1302;
  `ifndef SYNTHESIS
  reg [31:0] decode_BRANCH_CTRL_string;
  reg [31:0] _zz_decode_BRANCH_CTRL_string;
  reg [31:0] _zz_decode_to_execute_BRANCH_CTRL_string;
  reg [31:0] _zz_decode_to_execute_BRANCH_CTRL_1_string;
  reg [71:0] _zz_execute_to_memory_SHIFT_CTRL_string;
  reg [71:0] _zz_execute_to_memory_SHIFT_CTRL_1_string;
  reg [71:0] decode_SHIFT_CTRL_string;
  reg [71:0] _zz_decode_SHIFT_CTRL_string;
  reg [71:0] _zz_decode_to_execute_SHIFT_CTRL_string;
  reg [71:0] _zz_decode_to_execute_SHIFT_CTRL_1_string;
  reg [39:0] decode_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_decode_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_decode_to_execute_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string;
  reg [31:0] _zz_memory_to_writeBack_ENV_CTRL_string;
  reg [31:0] _zz_memory_to_writeBack_ENV_CTRL_1_string;
  reg [31:0] _zz_execute_to_memory_ENV_CTRL_string;
  reg [31:0] _zz_execute_to_memory_ENV_CTRL_1_string;
  reg [31:0] decode_ENV_CTRL_string;
  reg [31:0] _zz_decode_ENV_CTRL_string;
  reg [31:0] _zz_decode_to_execute_ENV_CTRL_string;
  reg [31:0] _zz_decode_to_execute_ENV_CTRL_1_string;
  reg [63:0] decode_ALU_CTRL_string;
  reg [63:0] _zz_decode_ALU_CTRL_string;
  reg [63:0] _zz_decode_to_execute_ALU_CTRL_string;
  reg [63:0] _zz_decode_to_execute_ALU_CTRL_1_string;
  reg [31:0] execute_BRANCH_CTRL_string;
  reg [31:0] _zz_execute_BRANCH_CTRL_string;
  reg [71:0] memory_SHIFT_CTRL_string;
  reg [71:0] _zz_memory_SHIFT_CTRL_string;
  reg [71:0] execute_SHIFT_CTRL_string;
  reg [71:0] _zz_execute_SHIFT_CTRL_string;
  reg [23:0] decode_SRC2_CTRL_string;
  reg [23:0] _zz_decode_SRC2_CTRL_string;
  reg [95:0] decode_SRC1_CTRL_string;
  reg [95:0] _zz_decode_SRC1_CTRL_string;
  reg [63:0] execute_ALU_CTRL_string;
  reg [63:0] _zz_execute_ALU_CTRL_string;
  reg [39:0] execute_ALU_BITWISE_CTRL_string;
  reg [39:0] _zz_execute_ALU_BITWISE_CTRL_string;
  reg [31:0] _zz_decode_BRANCH_CTRL_1_string;
  reg [71:0] _zz_decode_SHIFT_CTRL_1_string;
  reg [39:0] _zz_decode_ALU_BITWISE_CTRL_1_string;
  reg [31:0] _zz_decode_ENV_CTRL_1_string;
  reg [23:0] _zz_decode_SRC2_CTRL_1_string;
  reg [63:0] _zz_decode_ALU_CTRL_1_string;
  reg [95:0] _zz_decode_SRC1_CTRL_1_string;
  reg [31:0] memory_ENV_CTRL_string;
  reg [31:0] _zz_memory_ENV_CTRL_string;
  reg [31:0] execute_ENV_CTRL_string;
  reg [31:0] _zz_execute_ENV_CTRL_string;
  reg [31:0] writeBack_ENV_CTRL_string;
  reg [31:0] _zz_writeBack_ENV_CTRL_string;
  reg [95:0] _zz_decode_SRC1_CTRL_2_string;
  reg [63:0] _zz_decode_ALU_CTRL_2_string;
  reg [23:0] _zz_decode_SRC2_CTRL_2_string;
  reg [31:0] _zz_decode_ENV_CTRL_2_string;
  reg [39:0] _zz_decode_ALU_BITWISE_CTRL_2_string;
  reg [71:0] _zz_decode_SHIFT_CTRL_2_string;
  reg [31:0] _zz_decode_BRANCH_CTRL_2_string;
  reg [63:0] decode_to_execute_ALU_CTRL_string;
  reg [31:0] decode_to_execute_ENV_CTRL_string;
  reg [31:0] execute_to_memory_ENV_CTRL_string;
  reg [31:0] memory_to_writeBack_ENV_CTRL_string;
  reg [39:0] decode_to_execute_ALU_BITWISE_CTRL_string;
  reg [71:0] decode_to_execute_SHIFT_CTRL_string;
  reg [71:0] execute_to_memory_SHIFT_CTRL_string;
  reg [31:0] decode_to_execute_BRANCH_CTRL_string;
  `endif

  reg [31:0] RegFilePlugin_regFile [0:31] /* verilator public */ ;

  assign _zz_when = ({decodeExceptionPort_valid,IBusSimplePlugin_decodeExceptionPort_valid} != 2'b00);
  assign _zz_memory_MUL = ({memory_CombaPlugin_hh,memory_CombaPlugin_ll[31 : 16]} + _zz_memory_MUL_1);
  assign _zz_memory_MUL_1 = {15'd0, memory_CombaPlugin_hllh};
  assign _zz_execute_SHIFT_RIGHT_1 = ($signed(_zz_execute_SHIFT_RIGHT_2) >>> execute_FullBarrelShifterPlugin_amplitude);
  assign _zz_execute_SHIFT_RIGHT = _zz_execute_SHIFT_RIGHT_1[31 : 0];
  assign _zz_execute_SHIFT_RIGHT_2 = {((execute_SHIFT_CTRL == `ShiftCtrlEnum_binary_sequential_SRA_1) && execute_FullBarrelShifterPlugin_reversed[31]),execute_FullBarrelShifterPlugin_reversed};
  assign _zz_decode_DO_EBREAK = (decode_PC >>> 1);
  assign _zz_decode_DO_EBREAK_1 = (decode_PC >>> 1);
  assign _zz_decode_DO_EBREAK_2 = (decode_PC >>> 1);
  assign _zz_IBusSimplePlugin_jump_pcLoad_payload_1 = (_zz_IBusSimplePlugin_jump_pcLoad_payload & (~ _zz_IBusSimplePlugin_jump_pcLoad_payload_2));
  assign _zz_IBusSimplePlugin_jump_pcLoad_payload_2 = (_zz_IBusSimplePlugin_jump_pcLoad_payload - 2'b01);
  assign _zz_IBusSimplePlugin_fetchPc_pc_1 = {IBusSimplePlugin_fetchPc_inc,2'b00};
  assign _zz_IBusSimplePlugin_fetchPc_pc = {29'd0, _zz_IBusSimplePlugin_fetchPc_pc_1};
  assign _zz_IBusSimplePlugin_pending_next = (IBusSimplePlugin_pending_value + _zz_IBusSimplePlugin_pending_next_1);
  assign _zz_IBusSimplePlugin_pending_next_2 = IBusSimplePlugin_pending_inc;
  assign _zz_IBusSimplePlugin_pending_next_1 = {2'd0, _zz_IBusSimplePlugin_pending_next_2};
  assign _zz_IBusSimplePlugin_pending_next_4 = IBusSimplePlugin_pending_dec;
  assign _zz_IBusSimplePlugin_pending_next_3 = {2'd0, _zz_IBusSimplePlugin_pending_next_4};
  assign _zz_IBusSimplePlugin_rspJoin_rspBuffer_discardCounter_1 = (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid && (IBusSimplePlugin_rspJoin_rspBuffer_discardCounter != 3'b000));
  assign _zz_IBusSimplePlugin_rspJoin_rspBuffer_discardCounter = {2'd0, _zz_IBusSimplePlugin_rspJoin_rspBuffer_discardCounter_1};
  assign _zz_DBusSimplePlugin_memoryExceptionPort_payload_code = (memory_MEMORY_STORE ? 3'b110 : 3'b100);
  assign _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1 = (_zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code & (~ _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1_1));
  assign _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1_1 = (_zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code - 2'b01);
  assign _zz__zz_execute_REGFILE_WRITE_DATA = execute_SRC_LESS;
  assign _zz__zz_decode_SRC1_1 = 3'b100;
  assign _zz__zz_decode_SRC1_1_1 = decode_INSTRUCTION[19 : 15];
  assign _zz__zz_decode_SRC2_4 = {decode_INSTRUCTION[31 : 25],decode_INSTRUCTION[11 : 7]};
  assign _zz_execute_SrcPlugin_addSub = ($signed(_zz_execute_SrcPlugin_addSub_1) + $signed(_zz_execute_SrcPlugin_addSub_4));
  assign _zz_execute_SrcPlugin_addSub_1 = ($signed(_zz_execute_SrcPlugin_addSub_2) + $signed(_zz_execute_SrcPlugin_addSub_3));
  assign _zz_execute_SrcPlugin_addSub_2 = execute_SRC1;
  assign _zz_execute_SrcPlugin_addSub_3 = (execute_SRC_USE_SUB_LESS ? (~ execute_SRC2) : execute_SRC2);
  assign _zz_execute_SrcPlugin_addSub_4 = (execute_SRC_USE_SUB_LESS ? _zz_execute_SrcPlugin_addSub_5 : _zz_execute_SrcPlugin_addSub_6);
  assign _zz_execute_SrcPlugin_addSub_5 = 32'h00000001;
  assign _zz_execute_SrcPlugin_addSub_6 = 32'h0;
  assign _zz__zz_execute_BranchPlugin_branch_src2 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]};
  assign _zz__zz_execute_BranchPlugin_branch_src2_4 = {{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]};
  assign _zz_memory_CombaPlugin_hllh = {1'd0, memory_CombaPlugin_hl};
  assign _zz_writeBack_CombaPlugin_sum = {8'd0, writeBack_CombaPlugin_invalue};
  assign _zz_writeBack_CombaPlugin_acc = (writeBack_CombaPlugin_sum >>> 32);
  assign _zz__zz_decode_RS2 = (writeBack_CombaPlugin_sum[31 : 0] >>> writeBack_SRC1[3 : 0]);
  assign _zz__zz_decode_RS2_1 = (_zz__zz_decode_RS2_2 + _zz__zz_decode_RS2_3);
  assign _zz__zz_decode_RS2_2 = (writeBack_MUL[63 : 32] + (~ writeBack_CombaPlugin_a));
  assign _zz__zz_decode_RS2_3 = ((~ writeBack_CombaPlugin_b) + 32'h00000002);
  assign _zz_decode_RegFilePlugin_rs1Data = 1'b1;
  assign _zz_decode_RegFilePlugin_rs2Data = 1'b1;
  assign _zz_decode_LEGAL_INSTRUCTION = 32'h0000107f;
  assign _zz_decode_LEGAL_INSTRUCTION_1 = (decode_INSTRUCTION & 32'h0000207f);
  assign _zz_decode_LEGAL_INSTRUCTION_2 = 32'h00002073;
  assign _zz_decode_LEGAL_INSTRUCTION_3 = ((decode_INSTRUCTION & 32'h0000407f) == 32'h00004063);
  assign _zz_decode_LEGAL_INSTRUCTION_4 = ((decode_INSTRUCTION & 32'h0000207f) == 32'h00002013);
  assign _zz_decode_LEGAL_INSTRUCTION_5 = {((decode_INSTRUCTION & 32'h0000603f) == 32'h00000023),{((decode_INSTRUCTION & 32'h0000207f) == 32'h00000003),{((decode_INSTRUCTION & _zz_decode_LEGAL_INSTRUCTION_6) == 32'h00000003),{(_zz_decode_LEGAL_INSTRUCTION_7 == _zz_decode_LEGAL_INSTRUCTION_8),{_zz_decode_LEGAL_INSTRUCTION_9,{_zz_decode_LEGAL_INSTRUCTION_10,_zz_decode_LEGAL_INSTRUCTION_11}}}}}};
  assign _zz_decode_LEGAL_INSTRUCTION_6 = 32'h0000505f;
  assign _zz_decode_LEGAL_INSTRUCTION_7 = (decode_INSTRUCTION & 32'h0000707b);
  assign _zz_decode_LEGAL_INSTRUCTION_8 = 32'h00000063;
  assign _zz_decode_LEGAL_INSTRUCTION_9 = ((decode_INSTRUCTION & 32'h0000607f) == 32'h0000000f);
  assign _zz_decode_LEGAL_INSTRUCTION_10 = ((decode_INSTRUCTION & 32'hfc00407f) == 32'h00000033);
  assign _zz_decode_LEGAL_INSTRUCTION_11 = {((decode_INSTRUCTION & 32'hfe00007f) == 32'h00000033),{((decode_INSTRUCTION & 32'hfe00407f) == 32'hfe00400b),{((decode_INSTRUCTION & _zz_decode_LEGAL_INSTRUCTION_12) == 32'h00005013),{(_zz_decode_LEGAL_INSTRUCTION_13 == _zz_decode_LEGAL_INSTRUCTION_14),{_zz_decode_LEGAL_INSTRUCTION_15,{_zz_decode_LEGAL_INSTRUCTION_16,_zz_decode_LEGAL_INSTRUCTION_17}}}}}};
  assign _zz_decode_LEGAL_INSTRUCTION_12 = 32'hbc00707f;
  assign _zz_decode_LEGAL_INSTRUCTION_13 = (decode_INSTRUCTION & 32'hfc00307f);
  assign _zz_decode_LEGAL_INSTRUCTION_14 = 32'h00001013;
  assign _zz_decode_LEGAL_INSTRUCTION_15 = ((decode_INSTRUCTION & 32'hbe00707f) == 32'h00005033);
  assign _zz_decode_LEGAL_INSTRUCTION_16 = ((decode_INSTRUCTION & 32'hbe00707f) == 32'h00000033);
  assign _zz_decode_LEGAL_INSTRUCTION_17 = {((decode_INSTRUCTION & 32'hdfffffff) == 32'h10200073),((decode_INSTRUCTION & 32'hffffffff) == 32'h00100073)};
  assign _zz__zz_decode_IS_OP_SUB = 32'h10003050;
  assign _zz__zz_decode_IS_OP_SUB_1 = (decode_INSTRUCTION & 32'h0000300c);
  assign _zz__zz_decode_IS_OP_SUB_2 = 32'h00000008;
  assign _zz__zz_decode_IS_OP_SUB_3 = ((decode_INSTRUCTION & 32'h00003048) == 32'h00002008);
  assign _zz__zz_decode_IS_OP_SUB_4 = ((decode_INSTRUCTION & 32'h0000300c) == 32'h00001008);
  assign _zz__zz_decode_IS_OP_SUB_5 = 1'b0;
  assign _zz__zz_decode_IS_OP_SUB_6 = (_zz_decode_IS_OP_SUB_5 != 1'b0);
  assign _zz__zz_decode_IS_OP_SUB_7 = ((_zz__zz_decode_IS_OP_SUB_8 == _zz__zz_decode_IS_OP_SUB_9) != 1'b0);
  assign _zz__zz_decode_IS_OP_SUB_10 = {(_zz__zz_decode_IS_OP_SUB_11 != 1'b0),{(_zz__zz_decode_IS_OP_SUB_12 != _zz__zz_decode_IS_OP_SUB_14),{_zz__zz_decode_IS_OP_SUB_15,{_zz__zz_decode_IS_OP_SUB_17,_zz__zz_decode_IS_OP_SUB_20}}}};
  assign _zz__zz_decode_IS_OP_SUB_8 = (decode_INSTRUCTION & 32'h00003050);
  assign _zz__zz_decode_IS_OP_SUB_9 = 32'h00003000;
  assign _zz__zz_decode_IS_OP_SUB_11 = ((decode_INSTRUCTION & 32'h02000074) == 32'h02000030);
  assign _zz__zz_decode_IS_OP_SUB_12 = {_zz_decode_IS_OP_SUB_4,((decode_INSTRUCTION & _zz__zz_decode_IS_OP_SUB_13) == 32'h00000004)};
  assign _zz__zz_decode_IS_OP_SUB_14 = 2'b00;
  assign _zz__zz_decode_IS_OP_SUB_15 = (((decode_INSTRUCTION & _zz__zz_decode_IS_OP_SUB_16) == 32'h00000040) != 1'b0);
  assign _zz__zz_decode_IS_OP_SUB_17 = ((_zz__zz_decode_IS_OP_SUB_18 == _zz__zz_decode_IS_OP_SUB_19) != 1'b0);
  assign _zz__zz_decode_IS_OP_SUB_20 = {({_zz__zz_decode_IS_OP_SUB_21,_zz__zz_decode_IS_OP_SUB_23} != 3'b000),{(_zz__zz_decode_IS_OP_SUB_28 != _zz__zz_decode_IS_OP_SUB_30),{_zz__zz_decode_IS_OP_SUB_31,{_zz__zz_decode_IS_OP_SUB_34,_zz__zz_decode_IS_OP_SUB_36}}}};
  assign _zz__zz_decode_IS_OP_SUB_13 = 32'h0000001c;
  assign _zz__zz_decode_IS_OP_SUB_16 = 32'h00000058;
  assign _zz__zz_decode_IS_OP_SUB_18 = (decode_INSTRUCTION & 32'h00007054);
  assign _zz__zz_decode_IS_OP_SUB_19 = 32'h00005010;
  assign _zz__zz_decode_IS_OP_SUB_21 = ((decode_INSTRUCTION & _zz__zz_decode_IS_OP_SUB_22) == 32'h40001010);
  assign _zz__zz_decode_IS_OP_SUB_23 = {(_zz__zz_decode_IS_OP_SUB_24 == _zz__zz_decode_IS_OP_SUB_25),(_zz__zz_decode_IS_OP_SUB_26 == _zz__zz_decode_IS_OP_SUB_27)};
  assign _zz__zz_decode_IS_OP_SUB_28 = ((decode_INSTRUCTION & _zz__zz_decode_IS_OP_SUB_29) == 32'h00000024);
  assign _zz__zz_decode_IS_OP_SUB_30 = 1'b0;
  assign _zz__zz_decode_IS_OP_SUB_31 = ((_zz__zz_decode_IS_OP_SUB_32 == _zz__zz_decode_IS_OP_SUB_33) != 1'b0);
  assign _zz__zz_decode_IS_OP_SUB_34 = (_zz__zz_decode_IS_OP_SUB_35 != 1'b0);
  assign _zz__zz_decode_IS_OP_SUB_36 = {(_zz__zz_decode_IS_OP_SUB_37 != _zz__zz_decode_IS_OP_SUB_42),{_zz__zz_decode_IS_OP_SUB_43,{_zz__zz_decode_IS_OP_SUB_46,_zz__zz_decode_IS_OP_SUB_51}}};
  assign _zz__zz_decode_IS_OP_SUB_22 = 32'h40003054;
  assign _zz__zz_decode_IS_OP_SUB_24 = (decode_INSTRUCTION & 32'h00007034);
  assign _zz__zz_decode_IS_OP_SUB_25 = 32'h00001010;
  assign _zz__zz_decode_IS_OP_SUB_26 = (decode_INSTRUCTION & 32'h02007054);
  assign _zz__zz_decode_IS_OP_SUB_27 = 32'h00001010;
  assign _zz__zz_decode_IS_OP_SUB_29 = 32'h00000064;
  assign _zz__zz_decode_IS_OP_SUB_32 = (decode_INSTRUCTION & 32'h00001000);
  assign _zz__zz_decode_IS_OP_SUB_33 = 32'h00001000;
  assign _zz__zz_decode_IS_OP_SUB_35 = ((decode_INSTRUCTION & 32'h00003000) == 32'h00002000);
  assign _zz__zz_decode_IS_OP_SUB_37 = {(_zz__zz_decode_IS_OP_SUB_38 == _zz__zz_decode_IS_OP_SUB_39),(_zz__zz_decode_IS_OP_SUB_40 == _zz__zz_decode_IS_OP_SUB_41)};
  assign _zz__zz_decode_IS_OP_SUB_42 = 2'b00;
  assign _zz__zz_decode_IS_OP_SUB_43 = ((_zz__zz_decode_IS_OP_SUB_44 == _zz__zz_decode_IS_OP_SUB_45) != 1'b0);
  assign _zz__zz_decode_IS_OP_SUB_46 = ({_zz__zz_decode_IS_OP_SUB_47,_zz__zz_decode_IS_OP_SUB_49} != 2'b00);
  assign _zz__zz_decode_IS_OP_SUB_51 = {(_zz__zz_decode_IS_OP_SUB_52 != _zz__zz_decode_IS_OP_SUB_57),{_zz__zz_decode_IS_OP_SUB_58,{_zz__zz_decode_IS_OP_SUB_67,_zz__zz_decode_IS_OP_SUB_70}}};
  assign _zz__zz_decode_IS_OP_SUB_38 = (decode_INSTRUCTION & 32'h00002010);
  assign _zz__zz_decode_IS_OP_SUB_39 = 32'h00002000;
  assign _zz__zz_decode_IS_OP_SUB_40 = (decode_INSTRUCTION & 32'h00005000);
  assign _zz__zz_decode_IS_OP_SUB_41 = 32'h00001000;
  assign _zz__zz_decode_IS_OP_SUB_44 = (decode_INSTRUCTION & 32'h00103050);
  assign _zz__zz_decode_IS_OP_SUB_45 = 32'h00000050;
  assign _zz__zz_decode_IS_OP_SUB_47 = ((decode_INSTRUCTION & _zz__zz_decode_IS_OP_SUB_48) == 32'h00001050);
  assign _zz__zz_decode_IS_OP_SUB_49 = ((decode_INSTRUCTION & _zz__zz_decode_IS_OP_SUB_50) == 32'h00002050);
  assign _zz__zz_decode_IS_OP_SUB_52 = {_zz_decode_IS_OP_SUB_5,{_zz__zz_decode_IS_OP_SUB_53,_zz__zz_decode_IS_OP_SUB_55}};
  assign _zz__zz_decode_IS_OP_SUB_57 = 3'b000;
  assign _zz__zz_decode_IS_OP_SUB_58 = ({_zz__zz_decode_IS_OP_SUB_59,{_zz__zz_decode_IS_OP_SUB_61,_zz__zz_decode_IS_OP_SUB_64}} != 3'b000);
  assign _zz__zz_decode_IS_OP_SUB_67 = (_zz__zz_decode_IS_OP_SUB_68 != 1'b0);
  assign _zz__zz_decode_IS_OP_SUB_70 = {(_zz__zz_decode_IS_OP_SUB_71 != _zz__zz_decode_IS_OP_SUB_78),{_zz__zz_decode_IS_OP_SUB_79,{_zz__zz_decode_IS_OP_SUB_92,_zz__zz_decode_IS_OP_SUB_109}}};
  assign _zz__zz_decode_IS_OP_SUB_48 = 32'h00001050;
  assign _zz__zz_decode_IS_OP_SUB_50 = 32'h00002050;
  assign _zz__zz_decode_IS_OP_SUB_53 = ((decode_INSTRUCTION & _zz__zz_decode_IS_OP_SUB_54) == 32'h00000020);
  assign _zz__zz_decode_IS_OP_SUB_55 = ((decode_INSTRUCTION & _zz__zz_decode_IS_OP_SUB_56) == 32'h00000020);
  assign _zz__zz_decode_IS_OP_SUB_59 = ((decode_INSTRUCTION & _zz__zz_decode_IS_OP_SUB_60) == 32'h00000040);
  assign _zz__zz_decode_IS_OP_SUB_61 = (_zz__zz_decode_IS_OP_SUB_62 == _zz__zz_decode_IS_OP_SUB_63);
  assign _zz__zz_decode_IS_OP_SUB_64 = (_zz__zz_decode_IS_OP_SUB_65 == _zz__zz_decode_IS_OP_SUB_66);
  assign _zz__zz_decode_IS_OP_SUB_68 = ((decode_INSTRUCTION & _zz__zz_decode_IS_OP_SUB_69) == 32'h00000020);
  assign _zz__zz_decode_IS_OP_SUB_71 = {_zz__zz_decode_IS_OP_SUB_72,{_zz__zz_decode_IS_OP_SUB_74,_zz__zz_decode_IS_OP_SUB_75}};
  assign _zz__zz_decode_IS_OP_SUB_78 = 4'b0000;
  assign _zz__zz_decode_IS_OP_SUB_79 = ({_zz__zz_decode_IS_OP_SUB_80,_zz__zz_decode_IS_OP_SUB_81} != 5'h0);
  assign _zz__zz_decode_IS_OP_SUB_92 = (_zz__zz_decode_IS_OP_SUB_93 != _zz__zz_decode_IS_OP_SUB_108);
  assign _zz__zz_decode_IS_OP_SUB_109 = {_zz__zz_decode_IS_OP_SUB_110,{_zz__zz_decode_IS_OP_SUB_115,_zz__zz_decode_IS_OP_SUB_118}};
  assign _zz__zz_decode_IS_OP_SUB_54 = 32'h00000034;
  assign _zz__zz_decode_IS_OP_SUB_56 = 32'h00000064;
  assign _zz__zz_decode_IS_OP_SUB_60 = 32'h00000050;
  assign _zz__zz_decode_IS_OP_SUB_62 = (decode_INSTRUCTION & 32'h00000038);
  assign _zz__zz_decode_IS_OP_SUB_63 = 32'h0;
  assign _zz__zz_decode_IS_OP_SUB_65 = (decode_INSTRUCTION & 32'h00103040);
  assign _zz__zz_decode_IS_OP_SUB_66 = 32'h00000040;
  assign _zz__zz_decode_IS_OP_SUB_69 = 32'h00000020;
  assign _zz__zz_decode_IS_OP_SUB_72 = ((decode_INSTRUCTION & _zz__zz_decode_IS_OP_SUB_73) == 32'h00000040);
  assign _zz__zz_decode_IS_OP_SUB_74 = _zz_decode_IS_OP_SUB_3;
  assign _zz__zz_decode_IS_OP_SUB_75 = {_zz__zz_decode_IS_OP_SUB_76,_zz_decode_IS_OP_SUB_2};
  assign _zz__zz_decode_IS_OP_SUB_80 = _zz_decode_IS_OP_SUB_3;
  assign _zz__zz_decode_IS_OP_SUB_81 = {_zz__zz_decode_IS_OP_SUB_82,{_zz__zz_decode_IS_OP_SUB_84,_zz__zz_decode_IS_OP_SUB_87}};
  assign _zz__zz_decode_IS_OP_SUB_93 = {_zz_decode_IS_OP_SUB_4,{_zz__zz_decode_IS_OP_SUB_94,_zz__zz_decode_IS_OP_SUB_97}};
  assign _zz__zz_decode_IS_OP_SUB_108 = 7'h0;
  assign _zz__zz_decode_IS_OP_SUB_110 = ({_zz__zz_decode_IS_OP_SUB_111,_zz__zz_decode_IS_OP_SUB_112} != 2'b00);
  assign _zz__zz_decode_IS_OP_SUB_115 = (_zz__zz_decode_IS_OP_SUB_116 != _zz__zz_decode_IS_OP_SUB_117);
  assign _zz__zz_decode_IS_OP_SUB_118 = {_zz__zz_decode_IS_OP_SUB_119,{_zz__zz_decode_IS_OP_SUB_122,_zz__zz_decode_IS_OP_SUB_127}};
  assign _zz__zz_decode_IS_OP_SUB_73 = 32'h00000040;
  assign _zz__zz_decode_IS_OP_SUB_76 = ((decode_INSTRUCTION & _zz__zz_decode_IS_OP_SUB_77) == 32'h0);
  assign _zz__zz_decode_IS_OP_SUB_82 = ((decode_INSTRUCTION & _zz__zz_decode_IS_OP_SUB_83) == 32'h00002010);
  assign _zz__zz_decode_IS_OP_SUB_84 = (_zz__zz_decode_IS_OP_SUB_85 == _zz__zz_decode_IS_OP_SUB_86);
  assign _zz__zz_decode_IS_OP_SUB_87 = {_zz__zz_decode_IS_OP_SUB_88,_zz__zz_decode_IS_OP_SUB_90};
  assign _zz__zz_decode_IS_OP_SUB_94 = (_zz__zz_decode_IS_OP_SUB_95 == _zz__zz_decode_IS_OP_SUB_96);
  assign _zz__zz_decode_IS_OP_SUB_97 = {_zz__zz_decode_IS_OP_SUB_98,{_zz__zz_decode_IS_OP_SUB_100,_zz__zz_decode_IS_OP_SUB_103}};
  assign _zz__zz_decode_IS_OP_SUB_111 = _zz_decode_IS_OP_SUB_3;
  assign _zz__zz_decode_IS_OP_SUB_112 = (_zz__zz_decode_IS_OP_SUB_113 == _zz__zz_decode_IS_OP_SUB_114);
  assign _zz__zz_decode_IS_OP_SUB_116 = {_zz_decode_IS_OP_SUB_3,_zz_decode_IS_OP_SUB_2};
  assign _zz__zz_decode_IS_OP_SUB_117 = 2'b00;
  assign _zz__zz_decode_IS_OP_SUB_119 = (_zz__zz_decode_IS_OP_SUB_120 != 1'b0);
  assign _zz__zz_decode_IS_OP_SUB_122 = (_zz__zz_decode_IS_OP_SUB_123 != _zz__zz_decode_IS_OP_SUB_126);
  assign _zz__zz_decode_IS_OP_SUB_127 = {_zz__zz_decode_IS_OP_SUB_128,{_zz__zz_decode_IS_OP_SUB_136,_zz__zz_decode_IS_OP_SUB_140}};
  assign _zz__zz_decode_IS_OP_SUB_77 = 32'h02000000;
  assign _zz__zz_decode_IS_OP_SUB_83 = 32'h00002030;
  assign _zz__zz_decode_IS_OP_SUB_85 = (decode_INSTRUCTION & 32'h00001030);
  assign _zz__zz_decode_IS_OP_SUB_86 = 32'h00000010;
  assign _zz__zz_decode_IS_OP_SUB_88 = ((decode_INSTRUCTION & _zz__zz_decode_IS_OP_SUB_89) == 32'h00002020);
  assign _zz__zz_decode_IS_OP_SUB_90 = ((decode_INSTRUCTION & _zz__zz_decode_IS_OP_SUB_91) == 32'h00000020);
  assign _zz__zz_decode_IS_OP_SUB_95 = (decode_INSTRUCTION & 32'h00001010);
  assign _zz__zz_decode_IS_OP_SUB_96 = 32'h00001010;
  assign _zz__zz_decode_IS_OP_SUB_98 = ((decode_INSTRUCTION & _zz__zz_decode_IS_OP_SUB_99) == 32'h00002010);
  assign _zz__zz_decode_IS_OP_SUB_100 = (_zz__zz_decode_IS_OP_SUB_101 == _zz__zz_decode_IS_OP_SUB_102);
  assign _zz__zz_decode_IS_OP_SUB_103 = {_zz__zz_decode_IS_OP_SUB_104,{_zz__zz_decode_IS_OP_SUB_105,_zz__zz_decode_IS_OP_SUB_107}};
  assign _zz__zz_decode_IS_OP_SUB_113 = (decode_INSTRUCTION & 32'h00000070);
  assign _zz__zz_decode_IS_OP_SUB_114 = 32'h00000020;
  assign _zz__zz_decode_IS_OP_SUB_120 = ((decode_INSTRUCTION & _zz__zz_decode_IS_OP_SUB_121) == 32'h00004010);
  assign _zz__zz_decode_IS_OP_SUB_123 = (_zz__zz_decode_IS_OP_SUB_124 == _zz__zz_decode_IS_OP_SUB_125);
  assign _zz__zz_decode_IS_OP_SUB_126 = 1'b0;
  assign _zz__zz_decode_IS_OP_SUB_128 = ({_zz__zz_decode_IS_OP_SUB_129,_zz__zz_decode_IS_OP_SUB_131} != 4'b0000);
  assign _zz__zz_decode_IS_OP_SUB_136 = (_zz__zz_decode_IS_OP_SUB_137 != _zz__zz_decode_IS_OP_SUB_139);
  assign _zz__zz_decode_IS_OP_SUB_140 = {_zz__zz_decode_IS_OP_SUB_141,{_zz__zz_decode_IS_OP_SUB_145,_zz__zz_decode_IS_OP_SUB_148}};
  assign _zz__zz_decode_IS_OP_SUB_89 = 32'h02002060;
  assign _zz__zz_decode_IS_OP_SUB_91 = 32'h02003020;
  assign _zz__zz_decode_IS_OP_SUB_99 = 32'h00002010;
  assign _zz__zz_decode_IS_OP_SUB_101 = (decode_INSTRUCTION & 32'h00000050);
  assign _zz__zz_decode_IS_OP_SUB_102 = 32'h00000010;
  assign _zz__zz_decode_IS_OP_SUB_104 = ((decode_INSTRUCTION & 32'h00004040) == 32'h00004000);
  assign _zz__zz_decode_IS_OP_SUB_105 = ((decode_INSTRUCTION & _zz__zz_decode_IS_OP_SUB_106) == 32'h00000004);
  assign _zz__zz_decode_IS_OP_SUB_107 = _zz_decode_IS_OP_SUB_2;
  assign _zz__zz_decode_IS_OP_SUB_121 = 32'h00004014;
  assign _zz__zz_decode_IS_OP_SUB_124 = (decode_INSTRUCTION & 32'h00006014);
  assign _zz__zz_decode_IS_OP_SUB_125 = 32'h00002010;
  assign _zz__zz_decode_IS_OP_SUB_129 = ((decode_INSTRUCTION & _zz__zz_decode_IS_OP_SUB_130) == 32'h0);
  assign _zz__zz_decode_IS_OP_SUB_131 = {(_zz__zz_decode_IS_OP_SUB_132 == _zz__zz_decode_IS_OP_SUB_133),{_zz__zz_decode_IS_OP_SUB_134,_zz__zz_decode_IS_OP_SUB_135}};
  assign _zz__zz_decode_IS_OP_SUB_137 = ((decode_INSTRUCTION & _zz__zz_decode_IS_OP_SUB_138) == 32'h0);
  assign _zz__zz_decode_IS_OP_SUB_139 = 1'b0;
  assign _zz__zz_decode_IS_OP_SUB_141 = ({_zz__zz_decode_IS_OP_SUB_142,{_zz__zz_decode_IS_OP_SUB_143,_zz__zz_decode_IS_OP_SUB_144}} != 3'b000);
  assign _zz__zz_decode_IS_OP_SUB_145 = ({_zz__zz_decode_IS_OP_SUB_146,_zz__zz_decode_IS_OP_SUB_147} != 2'b00);
  assign _zz__zz_decode_IS_OP_SUB_148 = ({_zz__zz_decode_IS_OP_SUB_149,_zz__zz_decode_IS_OP_SUB_150} != 2'b00);
  assign _zz__zz_decode_IS_OP_SUB_106 = 32'h0000000c;
  assign _zz__zz_decode_IS_OP_SUB_130 = 32'h00000044;
  assign _zz__zz_decode_IS_OP_SUB_132 = (decode_INSTRUCTION & 32'h00000018);
  assign _zz__zz_decode_IS_OP_SUB_133 = 32'h0;
  assign _zz__zz_decode_IS_OP_SUB_134 = ((decode_INSTRUCTION & 32'h00006004) == 32'h00002000);
  assign _zz__zz_decode_IS_OP_SUB_135 = ((decode_INSTRUCTION & 32'h00005004) == 32'h00001000);
  assign _zz__zz_decode_IS_OP_SUB_138 = 32'h00000058;
  assign _zz__zz_decode_IS_OP_SUB_142 = ((decode_INSTRUCTION & 32'h00000044) == 32'h00000040);
  assign _zz__zz_decode_IS_OP_SUB_143 = ((decode_INSTRUCTION & 32'h00002014) == 32'h00002010);
  assign _zz__zz_decode_IS_OP_SUB_144 = ((decode_INSTRUCTION & 32'h40000034) == 32'h40000030);
  assign _zz__zz_decode_IS_OP_SUB_146 = ((decode_INSTRUCTION & 32'h00000014) == 32'h00000004);
  assign _zz__zz_decode_IS_OP_SUB_147 = _zz_decode_IS_OP_SUB_1;
  assign _zz__zz_decode_IS_OP_SUB_149 = ((decode_INSTRUCTION & 32'h00000044) == 32'h00000004);
  assign _zz__zz_decode_IS_OP_SUB_150 = _zz_decode_IS_OP_SUB_1;
  always @(posedge mainClock) begin
    if(_zz_decode_RegFilePlugin_rs1Data) begin
      _zz_RegFilePlugin_regFile_port0 <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress1];
    end
  end

  always @(posedge mainClock) begin
    if(_zz_decode_RegFilePlugin_rs2Data) begin
      _zz_RegFilePlugin_regFile_port1 <= RegFilePlugin_regFile[decode_RegFilePlugin_regFileReadAddress2];
    end
  end

  always @(posedge mainClock) begin
    if(_zz_1) begin
      RegFilePlugin_regFile[lastStageRegFileWrite_payload_address] <= lastStageRegFileWrite_payload_data;
    end
  end

  StreamFifoLowLatency IBusSimplePlugin_rspJoin_rspBuffer_c (
    .io_push_valid                 (iBus_rsp_valid                                                  ), //i
    .io_push_ready                 (IBusSimplePlugin_rspJoin_rspBuffer_c_io_push_ready              ), //o
    .io_push_payload_error         (iBus_rsp_payload_error                                          ), //i
    .io_push_payload_inst          (iBus_rsp_payload_inst[31:0]                                     ), //i
    .io_pop_valid                  (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid               ), //o
    .io_pop_ready                  (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_ready               ), //i
    .io_pop_payload_error          (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_error       ), //o
    .io_pop_payload_inst           (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_inst[31:0]  ), //o
    .io_flush                      (1'b0                                                            ), //i
    .io_occupancy                  (IBusSimplePlugin_rspJoin_rspBuffer_c_io_occupancy               ), //o
    .mainClock                     (mainClock                                                       ), //i
    .resetCtrl_systemClockReset    (resetCtrl_systemClockReset                                      )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(decode_BRANCH_CTRL)
      `BranchCtrlEnum_binary_sequential_INC : decode_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_binary_sequential_B : decode_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_binary_sequential_JAL : decode_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_binary_sequential_JALR : decode_BRANCH_CTRL_string = "JALR";
      default : decode_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_BRANCH_CTRL)
      `BranchCtrlEnum_binary_sequential_INC : _zz_decode_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_binary_sequential_B : _zz_decode_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_binary_sequential_JAL : _zz_decode_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_binary_sequential_JALR : _zz_decode_BRANCH_CTRL_string = "JALR";
      default : _zz_decode_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_BRANCH_CTRL)
      `BranchCtrlEnum_binary_sequential_INC : _zz_decode_to_execute_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_binary_sequential_B : _zz_decode_to_execute_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_binary_sequential_JAL : _zz_decode_to_execute_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_binary_sequential_JALR : _zz_decode_to_execute_BRANCH_CTRL_string = "JALR";
      default : _zz_decode_to_execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_BRANCH_CTRL_1)
      `BranchCtrlEnum_binary_sequential_INC : _zz_decode_to_execute_BRANCH_CTRL_1_string = "INC ";
      `BranchCtrlEnum_binary_sequential_B : _zz_decode_to_execute_BRANCH_CTRL_1_string = "B   ";
      `BranchCtrlEnum_binary_sequential_JAL : _zz_decode_to_execute_BRANCH_CTRL_1_string = "JAL ";
      `BranchCtrlEnum_binary_sequential_JALR : _zz_decode_to_execute_BRANCH_CTRL_1_string = "JALR";
      default : _zz_decode_to_execute_BRANCH_CTRL_1_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_to_memory_SHIFT_CTRL)
      `ShiftCtrlEnum_binary_sequential_DISABLE_1 : _zz_execute_to_memory_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_binary_sequential_SLL_1 : _zz_execute_to_memory_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRL_1 : _zz_execute_to_memory_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRA_1 : _zz_execute_to_memory_SHIFT_CTRL_string = "SRA_1    ";
      default : _zz_execute_to_memory_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_to_memory_SHIFT_CTRL_1)
      `ShiftCtrlEnum_binary_sequential_DISABLE_1 : _zz_execute_to_memory_SHIFT_CTRL_1_string = "DISABLE_1";
      `ShiftCtrlEnum_binary_sequential_SLL_1 : _zz_execute_to_memory_SHIFT_CTRL_1_string = "SLL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRL_1 : _zz_execute_to_memory_SHIFT_CTRL_1_string = "SRL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRA_1 : _zz_execute_to_memory_SHIFT_CTRL_1_string = "SRA_1    ";
      default : _zz_execute_to_memory_SHIFT_CTRL_1_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_SHIFT_CTRL)
      `ShiftCtrlEnum_binary_sequential_DISABLE_1 : decode_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_binary_sequential_SLL_1 : decode_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRL_1 : decode_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRA_1 : decode_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SHIFT_CTRL)
      `ShiftCtrlEnum_binary_sequential_DISABLE_1 : _zz_decode_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_binary_sequential_SLL_1 : _zz_decode_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRL_1 : _zz_decode_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRA_1 : _zz_decode_SHIFT_CTRL_string = "SRA_1    ";
      default : _zz_decode_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_SHIFT_CTRL)
      `ShiftCtrlEnum_binary_sequential_DISABLE_1 : _zz_decode_to_execute_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_binary_sequential_SLL_1 : _zz_decode_to_execute_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRL_1 : _zz_decode_to_execute_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRA_1 : _zz_decode_to_execute_SHIFT_CTRL_string = "SRA_1    ";
      default : _zz_decode_to_execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_SHIFT_CTRL_1)
      `ShiftCtrlEnum_binary_sequential_DISABLE_1 : _zz_decode_to_execute_SHIFT_CTRL_1_string = "DISABLE_1";
      `ShiftCtrlEnum_binary_sequential_SLL_1 : _zz_decode_to_execute_SHIFT_CTRL_1_string = "SLL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRL_1 : _zz_decode_to_execute_SHIFT_CTRL_1_string = "SRL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRA_1 : _zz_decode_to_execute_SHIFT_CTRL_1_string = "SRA_1    ";
      default : _zz_decode_to_execute_SHIFT_CTRL_1_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_binary_sequential_XOR_1 : decode_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_binary_sequential_OR_1 : decode_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_binary_sequential_AND_1 : decode_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_binary_sequential_XOR_1 : _zz_decode_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_binary_sequential_OR_1 : _zz_decode_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_binary_sequential_AND_1 : _zz_decode_ALU_BITWISE_CTRL_string = "AND_1";
      default : _zz_decode_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_binary_sequential_XOR_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_binary_sequential_OR_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_binary_sequential_AND_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : _zz_decode_to_execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ALU_BITWISE_CTRL_1)
      `AluBitwiseCtrlEnum_binary_sequential_XOR_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string = "XOR_1";
      `AluBitwiseCtrlEnum_binary_sequential_OR_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string = "OR_1 ";
      `AluBitwiseCtrlEnum_binary_sequential_AND_1 : _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string = "AND_1";
      default : _zz_decode_to_execute_ALU_BITWISE_CTRL_1_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_memory_to_writeBack_ENV_CTRL)
      `EnvCtrlEnum_binary_sequential_NONE : _zz_memory_to_writeBack_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_binary_sequential_XRET : _zz_memory_to_writeBack_ENV_CTRL_string = "XRET";
      default : _zz_memory_to_writeBack_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_memory_to_writeBack_ENV_CTRL_1)
      `EnvCtrlEnum_binary_sequential_NONE : _zz_memory_to_writeBack_ENV_CTRL_1_string = "NONE";
      `EnvCtrlEnum_binary_sequential_XRET : _zz_memory_to_writeBack_ENV_CTRL_1_string = "XRET";
      default : _zz_memory_to_writeBack_ENV_CTRL_1_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_to_memory_ENV_CTRL)
      `EnvCtrlEnum_binary_sequential_NONE : _zz_execute_to_memory_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_binary_sequential_XRET : _zz_execute_to_memory_ENV_CTRL_string = "XRET";
      default : _zz_execute_to_memory_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_to_memory_ENV_CTRL_1)
      `EnvCtrlEnum_binary_sequential_NONE : _zz_execute_to_memory_ENV_CTRL_1_string = "NONE";
      `EnvCtrlEnum_binary_sequential_XRET : _zz_execute_to_memory_ENV_CTRL_1_string = "XRET";
      default : _zz_execute_to_memory_ENV_CTRL_1_string = "????";
    endcase
  end
  always @(*) begin
    case(decode_ENV_CTRL)
      `EnvCtrlEnum_binary_sequential_NONE : decode_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_binary_sequential_XRET : decode_ENV_CTRL_string = "XRET";
      default : decode_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ENV_CTRL)
      `EnvCtrlEnum_binary_sequential_NONE : _zz_decode_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_binary_sequential_XRET : _zz_decode_ENV_CTRL_string = "XRET";
      default : _zz_decode_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ENV_CTRL)
      `EnvCtrlEnum_binary_sequential_NONE : _zz_decode_to_execute_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_binary_sequential_XRET : _zz_decode_to_execute_ENV_CTRL_string = "XRET";
      default : _zz_decode_to_execute_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ENV_CTRL_1)
      `EnvCtrlEnum_binary_sequential_NONE : _zz_decode_to_execute_ENV_CTRL_1_string = "NONE";
      `EnvCtrlEnum_binary_sequential_XRET : _zz_decode_to_execute_ENV_CTRL_1_string = "XRET";
      default : _zz_decode_to_execute_ENV_CTRL_1_string = "????";
    endcase
  end
  always @(*) begin
    case(decode_ALU_CTRL)
      `AluCtrlEnum_binary_sequential_ADD_SUB : decode_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_binary_sequential_SLT_SLTU : decode_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_binary_sequential_BITWISE : decode_ALU_CTRL_string = "BITWISE ";
      default : decode_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_CTRL)
      `AluCtrlEnum_binary_sequential_ADD_SUB : _zz_decode_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_binary_sequential_SLT_SLTU : _zz_decode_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_binary_sequential_BITWISE : _zz_decode_ALU_CTRL_string = "BITWISE ";
      default : _zz_decode_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ALU_CTRL)
      `AluCtrlEnum_binary_sequential_ADD_SUB : _zz_decode_to_execute_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_binary_sequential_SLT_SLTU : _zz_decode_to_execute_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_binary_sequential_BITWISE : _zz_decode_to_execute_ALU_CTRL_string = "BITWISE ";
      default : _zz_decode_to_execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_to_execute_ALU_CTRL_1)
      `AluCtrlEnum_binary_sequential_ADD_SUB : _zz_decode_to_execute_ALU_CTRL_1_string = "ADD_SUB ";
      `AluCtrlEnum_binary_sequential_SLT_SLTU : _zz_decode_to_execute_ALU_CTRL_1_string = "SLT_SLTU";
      `AluCtrlEnum_binary_sequential_BITWISE : _zz_decode_to_execute_ALU_CTRL_1_string = "BITWISE ";
      default : _zz_decode_to_execute_ALU_CTRL_1_string = "????????";
    endcase
  end
  always @(*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_binary_sequential_INC : execute_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_binary_sequential_B : execute_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_binary_sequential_JAL : execute_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_binary_sequential_JALR : execute_BRANCH_CTRL_string = "JALR";
      default : execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_BRANCH_CTRL)
      `BranchCtrlEnum_binary_sequential_INC : _zz_execute_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_binary_sequential_B : _zz_execute_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_binary_sequential_JAL : _zz_execute_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_binary_sequential_JALR : _zz_execute_BRANCH_CTRL_string = "JALR";
      default : _zz_execute_BRANCH_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(memory_SHIFT_CTRL)
      `ShiftCtrlEnum_binary_sequential_DISABLE_1 : memory_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_binary_sequential_SLL_1 : memory_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRL_1 : memory_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRA_1 : memory_SHIFT_CTRL_string = "SRA_1    ";
      default : memory_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_memory_SHIFT_CTRL)
      `ShiftCtrlEnum_binary_sequential_DISABLE_1 : _zz_memory_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_binary_sequential_SLL_1 : _zz_memory_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRL_1 : _zz_memory_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRA_1 : _zz_memory_SHIFT_CTRL_string = "SRA_1    ";
      default : _zz_memory_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(execute_SHIFT_CTRL)
      `ShiftCtrlEnum_binary_sequential_DISABLE_1 : execute_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_binary_sequential_SLL_1 : execute_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRL_1 : execute_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRA_1 : execute_SHIFT_CTRL_string = "SRA_1    ";
      default : execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_SHIFT_CTRL)
      `ShiftCtrlEnum_binary_sequential_DISABLE_1 : _zz_execute_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_binary_sequential_SLL_1 : _zz_execute_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRL_1 : _zz_execute_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRA_1 : _zz_execute_SHIFT_CTRL_string = "SRA_1    ";
      default : _zz_execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_SRC2_CTRL)
      `Src2CtrlEnum_binary_sequential_RS : decode_SRC2_CTRL_string = "RS ";
      `Src2CtrlEnum_binary_sequential_IMI : decode_SRC2_CTRL_string = "IMI";
      `Src2CtrlEnum_binary_sequential_IMS : decode_SRC2_CTRL_string = "IMS";
      `Src2CtrlEnum_binary_sequential_PC : decode_SRC2_CTRL_string = "PC ";
      default : decode_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC2_CTRL)
      `Src2CtrlEnum_binary_sequential_RS : _zz_decode_SRC2_CTRL_string = "RS ";
      `Src2CtrlEnum_binary_sequential_IMI : _zz_decode_SRC2_CTRL_string = "IMI";
      `Src2CtrlEnum_binary_sequential_IMS : _zz_decode_SRC2_CTRL_string = "IMS";
      `Src2CtrlEnum_binary_sequential_PC : _zz_decode_SRC2_CTRL_string = "PC ";
      default : _zz_decode_SRC2_CTRL_string = "???";
    endcase
  end
  always @(*) begin
    case(decode_SRC1_CTRL)
      `Src1CtrlEnum_binary_sequential_RS : decode_SRC1_CTRL_string = "RS          ";
      `Src1CtrlEnum_binary_sequential_IMU : decode_SRC1_CTRL_string = "IMU         ";
      `Src1CtrlEnum_binary_sequential_PC_INCREMENT : decode_SRC1_CTRL_string = "PC_INCREMENT";
      `Src1CtrlEnum_binary_sequential_URS1 : decode_SRC1_CTRL_string = "URS1        ";
      default : decode_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC1_CTRL)
      `Src1CtrlEnum_binary_sequential_RS : _zz_decode_SRC1_CTRL_string = "RS          ";
      `Src1CtrlEnum_binary_sequential_IMU : _zz_decode_SRC1_CTRL_string = "IMU         ";
      `Src1CtrlEnum_binary_sequential_PC_INCREMENT : _zz_decode_SRC1_CTRL_string = "PC_INCREMENT";
      `Src1CtrlEnum_binary_sequential_URS1 : _zz_decode_SRC1_CTRL_string = "URS1        ";
      default : _zz_decode_SRC1_CTRL_string = "????????????";
    endcase
  end
  always @(*) begin
    case(execute_ALU_CTRL)
      `AluCtrlEnum_binary_sequential_ADD_SUB : execute_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_binary_sequential_SLT_SLTU : execute_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_binary_sequential_BITWISE : execute_ALU_CTRL_string = "BITWISE ";
      default : execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_ALU_CTRL)
      `AluCtrlEnum_binary_sequential_ADD_SUB : _zz_execute_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_binary_sequential_SLT_SLTU : _zz_execute_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_binary_sequential_BITWISE : _zz_execute_ALU_CTRL_string = "BITWISE ";
      default : _zz_execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_binary_sequential_XOR_1 : execute_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_binary_sequential_OR_1 : execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_binary_sequential_AND_1 : execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_binary_sequential_XOR_1 : _zz_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_binary_sequential_OR_1 : _zz_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_binary_sequential_AND_1 : _zz_execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : _zz_execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_BRANCH_CTRL_1)
      `BranchCtrlEnum_binary_sequential_INC : _zz_decode_BRANCH_CTRL_1_string = "INC ";
      `BranchCtrlEnum_binary_sequential_B : _zz_decode_BRANCH_CTRL_1_string = "B   ";
      `BranchCtrlEnum_binary_sequential_JAL : _zz_decode_BRANCH_CTRL_1_string = "JAL ";
      `BranchCtrlEnum_binary_sequential_JALR : _zz_decode_BRANCH_CTRL_1_string = "JALR";
      default : _zz_decode_BRANCH_CTRL_1_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SHIFT_CTRL_1)
      `ShiftCtrlEnum_binary_sequential_DISABLE_1 : _zz_decode_SHIFT_CTRL_1_string = "DISABLE_1";
      `ShiftCtrlEnum_binary_sequential_SLL_1 : _zz_decode_SHIFT_CTRL_1_string = "SLL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRL_1 : _zz_decode_SHIFT_CTRL_1_string = "SRL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRA_1 : _zz_decode_SHIFT_CTRL_1_string = "SRA_1    ";
      default : _zz_decode_SHIFT_CTRL_1_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_BITWISE_CTRL_1)
      `AluBitwiseCtrlEnum_binary_sequential_XOR_1 : _zz_decode_ALU_BITWISE_CTRL_1_string = "XOR_1";
      `AluBitwiseCtrlEnum_binary_sequential_OR_1 : _zz_decode_ALU_BITWISE_CTRL_1_string = "OR_1 ";
      `AluBitwiseCtrlEnum_binary_sequential_AND_1 : _zz_decode_ALU_BITWISE_CTRL_1_string = "AND_1";
      default : _zz_decode_ALU_BITWISE_CTRL_1_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ENV_CTRL_1)
      `EnvCtrlEnum_binary_sequential_NONE : _zz_decode_ENV_CTRL_1_string = "NONE";
      `EnvCtrlEnum_binary_sequential_XRET : _zz_decode_ENV_CTRL_1_string = "XRET";
      default : _zz_decode_ENV_CTRL_1_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC2_CTRL_1)
      `Src2CtrlEnum_binary_sequential_RS : _zz_decode_SRC2_CTRL_1_string = "RS ";
      `Src2CtrlEnum_binary_sequential_IMI : _zz_decode_SRC2_CTRL_1_string = "IMI";
      `Src2CtrlEnum_binary_sequential_IMS : _zz_decode_SRC2_CTRL_1_string = "IMS";
      `Src2CtrlEnum_binary_sequential_PC : _zz_decode_SRC2_CTRL_1_string = "PC ";
      default : _zz_decode_SRC2_CTRL_1_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_CTRL_1)
      `AluCtrlEnum_binary_sequential_ADD_SUB : _zz_decode_ALU_CTRL_1_string = "ADD_SUB ";
      `AluCtrlEnum_binary_sequential_SLT_SLTU : _zz_decode_ALU_CTRL_1_string = "SLT_SLTU";
      `AluCtrlEnum_binary_sequential_BITWISE : _zz_decode_ALU_CTRL_1_string = "BITWISE ";
      default : _zz_decode_ALU_CTRL_1_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC1_CTRL_1)
      `Src1CtrlEnum_binary_sequential_RS : _zz_decode_SRC1_CTRL_1_string = "RS          ";
      `Src1CtrlEnum_binary_sequential_IMU : _zz_decode_SRC1_CTRL_1_string = "IMU         ";
      `Src1CtrlEnum_binary_sequential_PC_INCREMENT : _zz_decode_SRC1_CTRL_1_string = "PC_INCREMENT";
      `Src1CtrlEnum_binary_sequential_URS1 : _zz_decode_SRC1_CTRL_1_string = "URS1        ";
      default : _zz_decode_SRC1_CTRL_1_string = "????????????";
    endcase
  end
  always @(*) begin
    case(memory_ENV_CTRL)
      `EnvCtrlEnum_binary_sequential_NONE : memory_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_binary_sequential_XRET : memory_ENV_CTRL_string = "XRET";
      default : memory_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_memory_ENV_CTRL)
      `EnvCtrlEnum_binary_sequential_NONE : _zz_memory_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_binary_sequential_XRET : _zz_memory_ENV_CTRL_string = "XRET";
      default : _zz_memory_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(execute_ENV_CTRL)
      `EnvCtrlEnum_binary_sequential_NONE : execute_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_binary_sequential_XRET : execute_ENV_CTRL_string = "XRET";
      default : execute_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_execute_ENV_CTRL)
      `EnvCtrlEnum_binary_sequential_NONE : _zz_execute_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_binary_sequential_XRET : _zz_execute_ENV_CTRL_string = "XRET";
      default : _zz_execute_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(writeBack_ENV_CTRL)
      `EnvCtrlEnum_binary_sequential_NONE : writeBack_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_binary_sequential_XRET : writeBack_ENV_CTRL_string = "XRET";
      default : writeBack_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_writeBack_ENV_CTRL)
      `EnvCtrlEnum_binary_sequential_NONE : _zz_writeBack_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_binary_sequential_XRET : _zz_writeBack_ENV_CTRL_string = "XRET";
      default : _zz_writeBack_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC1_CTRL_2)
      `Src1CtrlEnum_binary_sequential_RS : _zz_decode_SRC1_CTRL_2_string = "RS          ";
      `Src1CtrlEnum_binary_sequential_IMU : _zz_decode_SRC1_CTRL_2_string = "IMU         ";
      `Src1CtrlEnum_binary_sequential_PC_INCREMENT : _zz_decode_SRC1_CTRL_2_string = "PC_INCREMENT";
      `Src1CtrlEnum_binary_sequential_URS1 : _zz_decode_SRC1_CTRL_2_string = "URS1        ";
      default : _zz_decode_SRC1_CTRL_2_string = "????????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_CTRL_2)
      `AluCtrlEnum_binary_sequential_ADD_SUB : _zz_decode_ALU_CTRL_2_string = "ADD_SUB ";
      `AluCtrlEnum_binary_sequential_SLT_SLTU : _zz_decode_ALU_CTRL_2_string = "SLT_SLTU";
      `AluCtrlEnum_binary_sequential_BITWISE : _zz_decode_ALU_CTRL_2_string = "BITWISE ";
      default : _zz_decode_ALU_CTRL_2_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SRC2_CTRL_2)
      `Src2CtrlEnum_binary_sequential_RS : _zz_decode_SRC2_CTRL_2_string = "RS ";
      `Src2CtrlEnum_binary_sequential_IMI : _zz_decode_SRC2_CTRL_2_string = "IMI";
      `Src2CtrlEnum_binary_sequential_IMS : _zz_decode_SRC2_CTRL_2_string = "IMS";
      `Src2CtrlEnum_binary_sequential_PC : _zz_decode_SRC2_CTRL_2_string = "PC ";
      default : _zz_decode_SRC2_CTRL_2_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ENV_CTRL_2)
      `EnvCtrlEnum_binary_sequential_NONE : _zz_decode_ENV_CTRL_2_string = "NONE";
      `EnvCtrlEnum_binary_sequential_XRET : _zz_decode_ENV_CTRL_2_string = "XRET";
      default : _zz_decode_ENV_CTRL_2_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_ALU_BITWISE_CTRL_2)
      `AluBitwiseCtrlEnum_binary_sequential_XOR_1 : _zz_decode_ALU_BITWISE_CTRL_2_string = "XOR_1";
      `AluBitwiseCtrlEnum_binary_sequential_OR_1 : _zz_decode_ALU_BITWISE_CTRL_2_string = "OR_1 ";
      `AluBitwiseCtrlEnum_binary_sequential_AND_1 : _zz_decode_ALU_BITWISE_CTRL_2_string = "AND_1";
      default : _zz_decode_ALU_BITWISE_CTRL_2_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_SHIFT_CTRL_2)
      `ShiftCtrlEnum_binary_sequential_DISABLE_1 : _zz_decode_SHIFT_CTRL_2_string = "DISABLE_1";
      `ShiftCtrlEnum_binary_sequential_SLL_1 : _zz_decode_SHIFT_CTRL_2_string = "SLL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRL_1 : _zz_decode_SHIFT_CTRL_2_string = "SRL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRA_1 : _zz_decode_SHIFT_CTRL_2_string = "SRA_1    ";
      default : _zz_decode_SHIFT_CTRL_2_string = "?????????";
    endcase
  end
  always @(*) begin
    case(_zz_decode_BRANCH_CTRL_2)
      `BranchCtrlEnum_binary_sequential_INC : _zz_decode_BRANCH_CTRL_2_string = "INC ";
      `BranchCtrlEnum_binary_sequential_B : _zz_decode_BRANCH_CTRL_2_string = "B   ";
      `BranchCtrlEnum_binary_sequential_JAL : _zz_decode_BRANCH_CTRL_2_string = "JAL ";
      `BranchCtrlEnum_binary_sequential_JALR : _zz_decode_BRANCH_CTRL_2_string = "JALR";
      default : _zz_decode_BRANCH_CTRL_2_string = "????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ALU_CTRL)
      `AluCtrlEnum_binary_sequential_ADD_SUB : decode_to_execute_ALU_CTRL_string = "ADD_SUB ";
      `AluCtrlEnum_binary_sequential_SLT_SLTU : decode_to_execute_ALU_CTRL_string = "SLT_SLTU";
      `AluCtrlEnum_binary_sequential_BITWISE : decode_to_execute_ALU_CTRL_string = "BITWISE ";
      default : decode_to_execute_ALU_CTRL_string = "????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ENV_CTRL)
      `EnvCtrlEnum_binary_sequential_NONE : decode_to_execute_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_binary_sequential_XRET : decode_to_execute_ENV_CTRL_string = "XRET";
      default : decode_to_execute_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(execute_to_memory_ENV_CTRL)
      `EnvCtrlEnum_binary_sequential_NONE : execute_to_memory_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_binary_sequential_XRET : execute_to_memory_ENV_CTRL_string = "XRET";
      default : execute_to_memory_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(memory_to_writeBack_ENV_CTRL)
      `EnvCtrlEnum_binary_sequential_NONE : memory_to_writeBack_ENV_CTRL_string = "NONE";
      `EnvCtrlEnum_binary_sequential_XRET : memory_to_writeBack_ENV_CTRL_string = "XRET";
      default : memory_to_writeBack_ENV_CTRL_string = "????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_binary_sequential_XOR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "XOR_1";
      `AluBitwiseCtrlEnum_binary_sequential_OR_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "OR_1 ";
      `AluBitwiseCtrlEnum_binary_sequential_AND_1 : decode_to_execute_ALU_BITWISE_CTRL_string = "AND_1";
      default : decode_to_execute_ALU_BITWISE_CTRL_string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_SHIFT_CTRL)
      `ShiftCtrlEnum_binary_sequential_DISABLE_1 : decode_to_execute_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_binary_sequential_SLL_1 : decode_to_execute_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRL_1 : decode_to_execute_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRA_1 : decode_to_execute_SHIFT_CTRL_string = "SRA_1    ";
      default : decode_to_execute_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(execute_to_memory_SHIFT_CTRL)
      `ShiftCtrlEnum_binary_sequential_DISABLE_1 : execute_to_memory_SHIFT_CTRL_string = "DISABLE_1";
      `ShiftCtrlEnum_binary_sequential_SLL_1 : execute_to_memory_SHIFT_CTRL_string = "SLL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRL_1 : execute_to_memory_SHIFT_CTRL_string = "SRL_1    ";
      `ShiftCtrlEnum_binary_sequential_SRA_1 : execute_to_memory_SHIFT_CTRL_string = "SRA_1    ";
      default : execute_to_memory_SHIFT_CTRL_string = "?????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_BRANCH_CTRL)
      `BranchCtrlEnum_binary_sequential_INC : decode_to_execute_BRANCH_CTRL_string = "INC ";
      `BranchCtrlEnum_binary_sequential_B : decode_to_execute_BRANCH_CTRL_string = "B   ";
      `BranchCtrlEnum_binary_sequential_JAL : decode_to_execute_BRANCH_CTRL_string = "JAL ";
      `BranchCtrlEnum_binary_sequential_JALR : decode_to_execute_BRANCH_CTRL_string = "JALR";
      default : decode_to_execute_BRANCH_CTRL_string = "????";
    endcase
  end
  `endif

  assign memory_MUL = {_zz_memory_MUL,memory_CombaPlugin_ll[15 : 0]};
  assign execute_MUL_HH = (execute_CombaPlugin_aHigh * execute_CombaPlugin_bHigh);
  assign execute_MUL_HL = (execute_CombaPlugin_aHigh * execute_CombaPlugin_bLow);
  assign execute_MUL_LH = (execute_CombaPlugin_aLow * execute_CombaPlugin_bHigh);
  assign execute_MUL_LL = (execute_CombaPlugin_aLow * execute_CombaPlugin_bLow);
  assign execute_BRANCH_CALC = {execute_BranchPlugin_branchAdder[31 : 1],1'b0};
  assign execute_BRANCH_DO = _zz_execute_BRANCH_DO_1;
  assign execute_SHIFT_RIGHT = _zz_execute_SHIFT_RIGHT;
  assign writeBack_REGFILE_WRITE_DATA = memory_to_writeBack_REGFILE_WRITE_DATA;
  assign execute_REGFILE_WRITE_DATA = _zz_execute_REGFILE_WRITE_DATA;
  assign execute_MEMORY_ADDRESS_LOW = dBus_cmd_payload_address[1 : 0];
  assign decode_DO_EBREAK = (((! DebugPlugin_haltIt) && (decode_IS_EBREAK || (((1'b0 || (DebugPlugin_hardwareBreakpoints_0_valid && (DebugPlugin_hardwareBreakpoints_0_pc == _zz_decode_DO_EBREAK))) || (DebugPlugin_hardwareBreakpoints_1_valid && (DebugPlugin_hardwareBreakpoints_1_pc == _zz_decode_DO_EBREAK_1))) || (DebugPlugin_hardwareBreakpoints_2_valid && (DebugPlugin_hardwareBreakpoints_2_pc == _zz_decode_DO_EBREAK_2))))) && DebugPlugin_allowEBreak);
  assign memory_SRC2 = execute_to_memory_SRC2;
  assign decode_SRC2 = _zz_decode_SRC2_6;
  assign memory_SRC1 = execute_to_memory_SRC1;
  assign decode_SRC1 = _zz_decode_SRC1_1;
  assign decode_SRC2_FORCE_ZERO = (decode_SRC_ADD_ZERO && (! decode_SRC_USE_SUB_LESS));
  assign memory_IS_OP_SUB = execute_to_memory_IS_OP_SUB;
  assign execute_IS_OP_SUB = decode_to_execute_IS_OP_SUB;
  assign decode_IS_OP_SUB = _zz_decode_IS_OP_SUB[30];
  assign memory_IS_OP_ADD = execute_to_memory_IS_OP_ADD;
  assign execute_IS_OP_ADD = decode_to_execute_IS_OP_ADD;
  assign decode_IS_OP_ADD = _zz_decode_IS_OP_SUB[29];
  assign memory_IS_OP_MUL = execute_to_memory_IS_OP_MUL;
  assign execute_IS_OP_MUL = decode_to_execute_IS_OP_MUL;
  assign decode_IS_OP_MUL = _zz_decode_IS_OP_SUB[28];
  assign memory_IS_COMBA = execute_to_memory_IS_COMBA;
  assign execute_IS_COMBA = decode_to_execute_IS_COMBA;
  assign decode_IS_COMBA = _zz_decode_IS_OP_SUB[27];
  assign memory_IS_OP_SHIFT = execute_to_memory_IS_OP_SHIFT;
  assign execute_IS_OP_SHIFT = decode_to_execute_IS_OP_SHIFT;
  assign decode_IS_OP_SHIFT = _zz_decode_IS_OP_SUB[26];
  assign memory_IS_MUL = execute_to_memory_IS_MUL;
  assign execute_IS_MUL = decode_to_execute_IS_MUL;
  assign decode_IS_MUL = _zz_decode_IS_OP_SUB[25];
  assign decode_BRANCH_CTRL = _zz_decode_BRANCH_CTRL;
  assign _zz_decode_to_execute_BRANCH_CTRL = _zz_decode_to_execute_BRANCH_CTRL_1;
  assign _zz_execute_to_memory_SHIFT_CTRL = _zz_execute_to_memory_SHIFT_CTRL_1;
  assign decode_SHIFT_CTRL = _zz_decode_SHIFT_CTRL;
  assign _zz_decode_to_execute_SHIFT_CTRL = _zz_decode_to_execute_SHIFT_CTRL_1;
  assign decode_ALU_BITWISE_CTRL = _zz_decode_ALU_BITWISE_CTRL;
  assign _zz_decode_to_execute_ALU_BITWISE_CTRL = _zz_decode_to_execute_ALU_BITWISE_CTRL_1;
  assign decode_SRC_LESS_UNSIGNED = _zz_decode_IS_OP_SUB[17];
  assign _zz_memory_to_writeBack_ENV_CTRL = _zz_memory_to_writeBack_ENV_CTRL_1;
  assign _zz_execute_to_memory_ENV_CTRL = _zz_execute_to_memory_ENV_CTRL_1;
  assign decode_ENV_CTRL = _zz_decode_ENV_CTRL;
  assign _zz_decode_to_execute_ENV_CTRL = _zz_decode_to_execute_ENV_CTRL_1;
  assign decode_IS_CSR = _zz_decode_IS_OP_SUB[15];
  assign decode_MEMORY_STORE = _zz_decode_IS_OP_SUB[12];
  assign execute_BYPASSABLE_MEMORY_STAGE = decode_to_execute_BYPASSABLE_MEMORY_STAGE;
  assign decode_BYPASSABLE_MEMORY_STAGE = _zz_decode_IS_OP_SUB[11];
  assign decode_BYPASSABLE_EXECUTE_STAGE = _zz_decode_IS_OP_SUB[10];
  assign decode_ALU_CTRL = _zz_decode_ALU_CTRL;
  assign _zz_decode_to_execute_ALU_CTRL = _zz_decode_to_execute_ALU_CTRL_1;
  assign decode_MEMORY_ENABLE = _zz_decode_IS_OP_SUB[3];
  assign decode_CSR_READ_OPCODE = (decode_INSTRUCTION[13 : 7] != 7'h20);
  assign decode_CSR_WRITE_OPCODE = (! (((decode_INSTRUCTION[14 : 13] == 2'b01) && (decode_INSTRUCTION[19 : 15] == 5'h0)) || ((decode_INSTRUCTION[14 : 13] == 2'b11) && (decode_INSTRUCTION[19 : 15] == 5'h0))));
  assign writeBack_FORMAL_PC_NEXT = memory_to_writeBack_FORMAL_PC_NEXT;
  assign memory_FORMAL_PC_NEXT = execute_to_memory_FORMAL_PC_NEXT;
  assign execute_FORMAL_PC_NEXT = decode_to_execute_FORMAL_PC_NEXT;
  assign decode_FORMAL_PC_NEXT = (decode_PC + 32'h00000004);
  assign memory_PC = execute_to_memory_PC;
  assign execute_DO_EBREAK = decode_to_execute_DO_EBREAK;
  assign decode_IS_EBREAK = _zz_decode_IS_OP_SUB[31];
  assign writeBack_IS_MUL = memory_to_writeBack_IS_MUL;
  assign writeBack_IS_OP_SHIFT = memory_to_writeBack_IS_OP_SHIFT;
  assign writeBack_IS_OP_SUB = memory_to_writeBack_IS_OP_SUB;
  assign writeBack_SRC1 = memory_to_writeBack_SRC1;
  assign writeBack_SRC2 = memory_to_writeBack_SRC2;
  assign writeBack_IS_OP_ADD = memory_to_writeBack_IS_OP_ADD;
  assign writeBack_MUL = memory_to_writeBack_MUL;
  assign writeBack_IS_OP_MUL = memory_to_writeBack_IS_OP_MUL;
  assign writeBack_IS_COMBA = memory_to_writeBack_IS_COMBA;
  assign memory_MUL_HH = execute_to_memory_MUL_HH;
  assign memory_MUL_HL = execute_to_memory_MUL_HL;
  assign memory_MUL_LH = execute_to_memory_MUL_LH;
  assign memory_MUL_LL = execute_to_memory_MUL_LL;
  assign memory_BRANCH_CALC = execute_to_memory_BRANCH_CALC;
  assign memory_BRANCH_DO = execute_to_memory_BRANCH_DO;
  assign execute_PC = decode_to_execute_PC;
  assign execute_RS1 = decode_to_execute_RS1;
  assign execute_BRANCH_CTRL = _zz_execute_BRANCH_CTRL;
  assign decode_RS2_USE = _zz_decode_IS_OP_SUB[14];
  assign decode_RS1_USE = _zz_decode_IS_OP_SUB[4];
  assign execute_REGFILE_WRITE_VALID = decode_to_execute_REGFILE_WRITE_VALID;
  assign execute_BYPASSABLE_EXECUTE_STAGE = decode_to_execute_BYPASSABLE_EXECUTE_STAGE;
  assign memory_REGFILE_WRITE_VALID = execute_to_memory_REGFILE_WRITE_VALID;
  assign memory_BYPASSABLE_MEMORY_STAGE = execute_to_memory_BYPASSABLE_MEMORY_STAGE;
  assign writeBack_REGFILE_WRITE_VALID = memory_to_writeBack_REGFILE_WRITE_VALID;
  always @(*) begin
    decode_RS2 = decode_RegFilePlugin_rs2Data;
    if(HazardSimplePlugin_writeBackBuffer_valid) begin
      if(HazardSimplePlugin_addr1Match) begin
        decode_RS2 = HazardSimplePlugin_writeBackBuffer_payload_data;
      end
    end
    if(when_HazardSimplePlugin_l45) begin
      if(when_HazardSimplePlugin_l47) begin
        if(when_HazardSimplePlugin_l51) begin
          decode_RS2 = _zz_decode_RS2;
        end
      end
    end
    if(when_HazardSimplePlugin_l45_1) begin
      if(memory_BYPASSABLE_MEMORY_STAGE) begin
        if(when_HazardSimplePlugin_l51_1) begin
          decode_RS2 = _zz_decode_RS2_2;
        end
      end
    end
    if(when_HazardSimplePlugin_l45_2) begin
      if(execute_BYPASSABLE_EXECUTE_STAGE) begin
        if(when_HazardSimplePlugin_l51_2) begin
          decode_RS2 = _zz_decode_RS2_1;
        end
      end
    end
  end

  always @(*) begin
    decode_RS1 = decode_RegFilePlugin_rs1Data;
    if(HazardSimplePlugin_writeBackBuffer_valid) begin
      if(HazardSimplePlugin_addr0Match) begin
        decode_RS1 = HazardSimplePlugin_writeBackBuffer_payload_data;
      end
    end
    if(when_HazardSimplePlugin_l45) begin
      if(when_HazardSimplePlugin_l47) begin
        if(when_HazardSimplePlugin_l48) begin
          decode_RS1 = _zz_decode_RS2;
        end
      end
    end
    if(when_HazardSimplePlugin_l45_1) begin
      if(memory_BYPASSABLE_MEMORY_STAGE) begin
        if(when_HazardSimplePlugin_l48_1) begin
          decode_RS1 = _zz_decode_RS2_2;
        end
      end
    end
    if(when_HazardSimplePlugin_l45_2) begin
      if(execute_BYPASSABLE_EXECUTE_STAGE) begin
        if(when_HazardSimplePlugin_l48_2) begin
          decode_RS1 = _zz_decode_RS2_1;
        end
      end
    end
  end

  assign memory_SHIFT_RIGHT = execute_to_memory_SHIFT_RIGHT;
  assign memory_SHIFT_CTRL = _zz_memory_SHIFT_CTRL;
  assign execute_SHIFT_CTRL = _zz_execute_SHIFT_CTRL;
  assign execute_SRC_LESS_UNSIGNED = decode_to_execute_SRC_LESS_UNSIGNED;
  assign execute_SRC2_FORCE_ZERO = decode_to_execute_SRC2_FORCE_ZERO;
  assign execute_SRC_USE_SUB_LESS = decode_to_execute_SRC_USE_SUB_LESS;
  assign _zz_decode_SRC2 = decode_PC;
  assign _zz_decode_SRC2_1 = decode_RS2;
  assign decode_SRC2_CTRL = _zz_decode_SRC2_CTRL;
  assign _zz_decode_SRC1 = decode_RS1;
  assign decode_SRC1_CTRL = _zz_decode_SRC1_CTRL;
  assign decode_SRC_USE_SUB_LESS = _zz_decode_IS_OP_SUB[2];
  assign decode_SRC_ADD_ZERO = _zz_decode_IS_OP_SUB[20];
  assign execute_SRC_ADD_SUB = execute_SrcPlugin_addSub;
  assign execute_SRC_LESS = execute_SrcPlugin_less;
  assign execute_ALU_CTRL = _zz_execute_ALU_CTRL;
  assign execute_SRC2 = decode_to_execute_SRC2;
  assign execute_ALU_BITWISE_CTRL = _zz_execute_ALU_BITWISE_CTRL;
  always @(*) begin
    _zz_decode_RS2 = writeBack_REGFILE_WRITE_DATA;
    if(when_CombaPlugin_l197) begin
      if(writeBack_IS_OP_SHIFT) begin
        _zz_decode_RS2 = _zz__zz_decode_RS2;
      end
    end
    if(when_CombaPlugin_l233) begin
      case(switch_CombaPlugin_l234)
        2'b00 : begin
          _zz_decode_RS2 = writeBack_MUL[31 : 0];
        end
        default : begin
          _zz_decode_RS2 = _zz__zz_decode_RS2_1;
        end
      endcase
    end
  end

  assign _zz_lastStageRegFileWrite_payload_address = writeBack_INSTRUCTION;
  assign _zz_lastStageRegFileWrite_valid = writeBack_REGFILE_WRITE_VALID;
  always @(*) begin
    _zz_1 = 1'b0;
    if(lastStageRegFileWrite_valid) begin
      _zz_1 = 1'b1;
    end
  end

  assign decode_INSTRUCTION_ANTICIPATED = (decode_arbitration_isStuck ? decode_INSTRUCTION : IBusSimplePlugin_iBusRsp_output_payload_rsp_inst);
  always @(*) begin
    decode_REGFILE_WRITE_VALID = _zz_decode_IS_OP_SUB[9];
    if(when_RegFilePlugin_l63) begin
      decode_REGFILE_WRITE_VALID = 1'b0;
    end
  end

  assign decode_LEGAL_INSTRUCTION = ({((decode_INSTRUCTION & 32'h0000005f) == 32'h00000017),{((decode_INSTRUCTION & 32'h0000007f) == 32'h0000006f),{((decode_INSTRUCTION & 32'h0000106f) == 32'h00000003),{((decode_INSTRUCTION & _zz_decode_LEGAL_INSTRUCTION) == 32'h00001073),{(_zz_decode_LEGAL_INSTRUCTION_1 == _zz_decode_LEGAL_INSTRUCTION_2),{_zz_decode_LEGAL_INSTRUCTION_3,{_zz_decode_LEGAL_INSTRUCTION_4,_zz_decode_LEGAL_INSTRUCTION_5}}}}}}} != 21'h0);
  always @(*) begin
    _zz_decode_RS2_1 = execute_REGFILE_WRITE_DATA;
    if(when_CsrPlugin_l1176) begin
      _zz_decode_RS2_1 = CsrPlugin_csrMapping_readDataSignal;
    end
  end

  assign execute_SRC1 = decode_to_execute_SRC1;
  assign execute_CSR_READ_OPCODE = decode_to_execute_CSR_READ_OPCODE;
  assign execute_CSR_WRITE_OPCODE = decode_to_execute_CSR_WRITE_OPCODE;
  assign execute_IS_CSR = decode_to_execute_IS_CSR;
  assign memory_ENV_CTRL = _zz_memory_ENV_CTRL;
  assign execute_ENV_CTRL = _zz_execute_ENV_CTRL;
  assign writeBack_ENV_CTRL = _zz_writeBack_ENV_CTRL;
  always @(*) begin
    _zz_decode_RS2_2 = memory_REGFILE_WRITE_DATA;
    if(when_DBusSimplePlugin_l558) begin
      _zz_decode_RS2_2 = memory_DBusSimplePlugin_rspFormated;
    end
    if(memory_arbitration_isValid) begin
      case(memory_SHIFT_CTRL)
        `ShiftCtrlEnum_binary_sequential_SLL_1 : begin
          _zz_decode_RS2_2 = _zz_decode_RS2_3;
        end
        `ShiftCtrlEnum_binary_sequential_SRL_1, `ShiftCtrlEnum_binary_sequential_SRA_1 : begin
          _zz_decode_RS2_2 = memory_SHIFT_RIGHT;
        end
        default : begin
        end
      endcase
    end
  end

  assign memory_INSTRUCTION = execute_to_memory_INSTRUCTION;
  assign memory_MEMORY_ADDRESS_LOW = execute_to_memory_MEMORY_ADDRESS_LOW;
  assign memory_MEMORY_READ_DATA = dBus_rsp_data;
  assign memory_ALIGNEMENT_FAULT = execute_to_memory_ALIGNEMENT_FAULT;
  assign memory_REGFILE_WRITE_DATA = execute_to_memory_REGFILE_WRITE_DATA;
  assign memory_MEMORY_STORE = execute_to_memory_MEMORY_STORE;
  assign memory_MEMORY_ENABLE = execute_to_memory_MEMORY_ENABLE;
  assign execute_SRC_ADD = execute_SrcPlugin_addSub;
  assign execute_RS2 = decode_to_execute_RS2;
  assign execute_INSTRUCTION = decode_to_execute_INSTRUCTION;
  assign execute_MEMORY_STORE = decode_to_execute_MEMORY_STORE;
  assign execute_MEMORY_ENABLE = decode_to_execute_MEMORY_ENABLE;
  assign execute_ALIGNEMENT_FAULT = (((dBus_cmd_payload_size == 2'b10) && (dBus_cmd_payload_address[1 : 0] != 2'b00)) || ((dBus_cmd_payload_size == 2'b01) && (dBus_cmd_payload_address[0 : 0] != 1'b0)));
  always @(*) begin
    _zz_memory_to_writeBack_FORMAL_PC_NEXT = memory_FORMAL_PC_NEXT;
    if(BranchPlugin_jumpInterface_valid) begin
      _zz_memory_to_writeBack_FORMAL_PC_NEXT = BranchPlugin_jumpInterface_payload;
    end
  end

  assign decode_PC = IBusSimplePlugin_injector_decodeInput_payload_pc;
  assign decode_INSTRUCTION = IBusSimplePlugin_injector_decodeInput_payload_rsp_inst;
  assign writeBack_PC = memory_to_writeBack_PC;
  assign writeBack_INSTRUCTION = memory_to_writeBack_INSTRUCTION;
  always @(*) begin
    decode_arbitration_haltItself = 1'b0;
    case(switch_Fetcher_l362)
      3'b010 : begin
        decode_arbitration_haltItself = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    decode_arbitration_haltByOther = 1'b0;
    if(CsrPlugin_pipelineLiberator_active) begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if(when_CsrPlugin_l1116) begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if(when_HazardSimplePlugin_l113) begin
      decode_arbitration_haltByOther = 1'b1;
    end
  end

  always @(*) begin
    decode_arbitration_removeIt = 1'b0;
    if(_zz_when) begin
      decode_arbitration_removeIt = 1'b1;
    end
    if(decode_arbitration_isFlushed) begin
      decode_arbitration_removeIt = 1'b1;
    end
  end

  assign decode_arbitration_flushIt = 1'b0;
  always @(*) begin
    decode_arbitration_flushNext = 1'b0;
    if(_zz_when) begin
      decode_arbitration_flushNext = 1'b1;
    end
  end

  always @(*) begin
    execute_arbitration_haltItself = 1'b0;
    if(when_DBusSimplePlugin_l426) begin
      execute_arbitration_haltItself = 1'b1;
    end
    if(when_CsrPlugin_l1180) begin
      if(execute_CsrPlugin_blockedBySideEffects) begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
  end

  always @(*) begin
    execute_arbitration_haltByOther = 1'b0;
    if(when_DebugPlugin_l284) begin
      execute_arbitration_haltByOther = 1'b1;
    end
  end

  always @(*) begin
    execute_arbitration_removeIt = 1'b0;
    if(execute_arbitration_isFlushed) begin
      execute_arbitration_removeIt = 1'b1;
    end
  end

  always @(*) begin
    execute_arbitration_flushIt = 1'b0;
    if(when_DebugPlugin_l284) begin
      if(when_DebugPlugin_l287) begin
        execute_arbitration_flushIt = 1'b1;
      end
    end
  end

  always @(*) begin
    execute_arbitration_flushNext = 1'b0;
    if(when_DebugPlugin_l284) begin
      if(when_DebugPlugin_l287) begin
        execute_arbitration_flushNext = 1'b1;
      end
    end
  end

  always @(*) begin
    memory_arbitration_haltItself = 1'b0;
    if(when_DBusSimplePlugin_l479) begin
      memory_arbitration_haltItself = 1'b1;
    end
  end

  assign memory_arbitration_haltByOther = 1'b0;
  always @(*) begin
    memory_arbitration_removeIt = 1'b0;
    if(DBusSimplePlugin_memoryExceptionPort_valid) begin
      memory_arbitration_removeIt = 1'b1;
    end
    if(memory_arbitration_isFlushed) begin
      memory_arbitration_removeIt = 1'b1;
    end
  end

  assign memory_arbitration_flushIt = 1'b0;
  always @(*) begin
    memory_arbitration_flushNext = 1'b0;
    if(DBusSimplePlugin_memoryExceptionPort_valid) begin
      memory_arbitration_flushNext = 1'b1;
    end
    if(BranchPlugin_jumpInterface_valid) begin
      memory_arbitration_flushNext = 1'b1;
    end
  end

  assign writeBack_arbitration_haltItself = 1'b0;
  assign writeBack_arbitration_haltByOther = 1'b0;
  always @(*) begin
    writeBack_arbitration_removeIt = 1'b0;
    if(writeBack_arbitration_isFlushed) begin
      writeBack_arbitration_removeIt = 1'b1;
    end
  end

  assign writeBack_arbitration_flushIt = 1'b0;
  always @(*) begin
    writeBack_arbitration_flushNext = 1'b0;
    if(when_CsrPlugin_l1019) begin
      writeBack_arbitration_flushNext = 1'b1;
    end
    if(when_CsrPlugin_l1064) begin
      writeBack_arbitration_flushNext = 1'b1;
    end
  end

  assign lastStageInstruction = writeBack_INSTRUCTION;
  assign lastStagePc = writeBack_PC;
  assign lastStageIsValid = writeBack_arbitration_isValid;
  assign lastStageIsFiring = writeBack_arbitration_isFiring;
  always @(*) begin
    IBusSimplePlugin_fetcherHalt = 1'b0;
    if(when_CsrPlugin_l922) begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
    if(when_CsrPlugin_l1019) begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
    if(when_CsrPlugin_l1064) begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
    if(when_DebugPlugin_l284) begin
      if(when_DebugPlugin_l287) begin
        IBusSimplePlugin_fetcherHalt = 1'b1;
      end
    end
    if(DebugPlugin_haltIt) begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
    if(when_DebugPlugin_l300) begin
      IBusSimplePlugin_fetcherHalt = 1'b1;
    end
  end

  always @(*) begin
    IBusSimplePlugin_incomingInstruction = 1'b0;
    if(when_Fetcher_l240) begin
      IBusSimplePlugin_incomingInstruction = 1'b1;
    end
    if(IBusSimplePlugin_injector_decodeInput_valid) begin
      IBusSimplePlugin_incomingInstruction = 1'b1;
    end
  end

  assign CsrPlugin_csrMapping_allowCsrSignal = 1'b0;
  assign CsrPlugin_csrMapping_readDataSignal = CsrPlugin_csrMapping_readDataInit;
  assign CsrPlugin_inWfi = 1'b0;
  always @(*) begin
    CsrPlugin_thirdPartyWake = 1'b0;
    if(DebugPlugin_haltIt) begin
      CsrPlugin_thirdPartyWake = 1'b1;
    end
  end

  always @(*) begin
    CsrPlugin_jumpInterface_valid = 1'b0;
    if(when_CsrPlugin_l1019) begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
    if(when_CsrPlugin_l1064) begin
      CsrPlugin_jumpInterface_valid = 1'b1;
    end
  end

  always @(*) begin
    CsrPlugin_jumpInterface_payload = 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    if(when_CsrPlugin_l1019) begin
      CsrPlugin_jumpInterface_payload = {CsrPlugin_xtvec_base,2'b00};
    end
    if(when_CsrPlugin_l1064) begin
      case(switch_CsrPlugin_l1068)
        2'b11 : begin
          CsrPlugin_jumpInterface_payload = CsrPlugin_mepc;
        end
        default : begin
        end
      endcase
    end
  end

  always @(*) begin
    CsrPlugin_forceMachineWire = 1'b0;
    if(DebugPlugin_godmode) begin
      CsrPlugin_forceMachineWire = 1'b1;
    end
  end

  always @(*) begin
    CsrPlugin_allowInterrupts = 1'b1;
    if(when_DebugPlugin_l316) begin
      CsrPlugin_allowInterrupts = 1'b0;
    end
  end

  always @(*) begin
    CsrPlugin_allowException = 1'b1;
    if(DebugPlugin_godmode) begin
      CsrPlugin_allowException = 1'b0;
    end
  end

  always @(*) begin
    CsrPlugin_allowEbreakException = 1'b1;
    if(DebugPlugin_allowEBreak) begin
      CsrPlugin_allowEbreakException = 1'b0;
    end
  end

  assign IBusSimplePlugin_externalFlush = ({writeBack_arbitration_flushNext,{memory_arbitration_flushNext,{execute_arbitration_flushNext,decode_arbitration_flushNext}}} != 4'b0000);
  assign IBusSimplePlugin_jump_pcLoad_valid = ({BranchPlugin_jumpInterface_valid,CsrPlugin_jumpInterface_valid} != 2'b00);
  assign _zz_IBusSimplePlugin_jump_pcLoad_payload = {BranchPlugin_jumpInterface_valid,CsrPlugin_jumpInterface_valid};
  assign IBusSimplePlugin_jump_pcLoad_payload = (_zz_IBusSimplePlugin_jump_pcLoad_payload_1[0] ? CsrPlugin_jumpInterface_payload : BranchPlugin_jumpInterface_payload);
  always @(*) begin
    IBusSimplePlugin_fetchPc_correction = 1'b0;
    if(IBusSimplePlugin_jump_pcLoad_valid) begin
      IBusSimplePlugin_fetchPc_correction = 1'b1;
    end
  end

  assign IBusSimplePlugin_fetchPc_output_fire = (IBusSimplePlugin_fetchPc_output_valid && IBusSimplePlugin_fetchPc_output_ready);
  assign IBusSimplePlugin_fetchPc_corrected = (IBusSimplePlugin_fetchPc_correction || IBusSimplePlugin_fetchPc_correctionReg);
  always @(*) begin
    IBusSimplePlugin_fetchPc_pcRegPropagate = 1'b0;
    if(IBusSimplePlugin_iBusRsp_stages_1_input_ready) begin
      IBusSimplePlugin_fetchPc_pcRegPropagate = 1'b1;
    end
  end

  assign when_Fetcher_l131 = (IBusSimplePlugin_fetchPc_correction || IBusSimplePlugin_fetchPc_pcRegPropagate);
  assign IBusSimplePlugin_fetchPc_output_fire_1 = (IBusSimplePlugin_fetchPc_output_valid && IBusSimplePlugin_fetchPc_output_ready);
  assign when_Fetcher_l131_1 = ((! IBusSimplePlugin_fetchPc_output_valid) && IBusSimplePlugin_fetchPc_output_ready);
  always @(*) begin
    IBusSimplePlugin_fetchPc_pc = (IBusSimplePlugin_fetchPc_pcReg + _zz_IBusSimplePlugin_fetchPc_pc);
    if(IBusSimplePlugin_jump_pcLoad_valid) begin
      IBusSimplePlugin_fetchPc_pc = IBusSimplePlugin_jump_pcLoad_payload;
    end
    IBusSimplePlugin_fetchPc_pc[0] = 1'b0;
    IBusSimplePlugin_fetchPc_pc[1] = 1'b0;
  end

  always @(*) begin
    IBusSimplePlugin_fetchPc_flushed = 1'b0;
    if(IBusSimplePlugin_jump_pcLoad_valid) begin
      IBusSimplePlugin_fetchPc_flushed = 1'b1;
    end
  end

  assign when_Fetcher_l158 = (IBusSimplePlugin_fetchPc_booted && ((IBusSimplePlugin_fetchPc_output_ready || IBusSimplePlugin_fetchPc_correction) || IBusSimplePlugin_fetchPc_pcRegPropagate));
  assign IBusSimplePlugin_fetchPc_output_valid = ((! IBusSimplePlugin_fetcherHalt) && IBusSimplePlugin_fetchPc_booted);
  assign IBusSimplePlugin_fetchPc_output_payload = IBusSimplePlugin_fetchPc_pc;
  assign IBusSimplePlugin_iBusRsp_redoFetch = 1'b0;
  assign IBusSimplePlugin_iBusRsp_stages_0_input_valid = IBusSimplePlugin_fetchPc_output_valid;
  assign IBusSimplePlugin_fetchPc_output_ready = IBusSimplePlugin_iBusRsp_stages_0_input_ready;
  assign IBusSimplePlugin_iBusRsp_stages_0_input_payload = IBusSimplePlugin_fetchPc_output_payload;
  assign IBusSimplePlugin_iBusRsp_stages_0_halt = 1'b0;
  assign _zz_IBusSimplePlugin_iBusRsp_stages_0_input_ready = (! IBusSimplePlugin_iBusRsp_stages_0_halt);
  assign IBusSimplePlugin_iBusRsp_stages_0_input_ready = (IBusSimplePlugin_iBusRsp_stages_0_output_ready && _zz_IBusSimplePlugin_iBusRsp_stages_0_input_ready);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_valid = (IBusSimplePlugin_iBusRsp_stages_0_input_valid && _zz_IBusSimplePlugin_iBusRsp_stages_0_input_ready);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_payload = IBusSimplePlugin_iBusRsp_stages_0_input_payload;
  always @(*) begin
    IBusSimplePlugin_iBusRsp_stages_1_halt = 1'b0;
    if(when_IBusSimplePlugin_l304) begin
      IBusSimplePlugin_iBusRsp_stages_1_halt = 1'b1;
    end
  end

  assign _zz_IBusSimplePlugin_iBusRsp_stages_1_input_ready = (! IBusSimplePlugin_iBusRsp_stages_1_halt);
  assign IBusSimplePlugin_iBusRsp_stages_1_input_ready = (IBusSimplePlugin_iBusRsp_stages_1_output_ready && _zz_IBusSimplePlugin_iBusRsp_stages_1_input_ready);
  assign IBusSimplePlugin_iBusRsp_stages_1_output_valid = (IBusSimplePlugin_iBusRsp_stages_1_input_valid && _zz_IBusSimplePlugin_iBusRsp_stages_1_input_ready);
  assign IBusSimplePlugin_iBusRsp_stages_1_output_payload = IBusSimplePlugin_iBusRsp_stages_1_input_payload;
  assign IBusSimplePlugin_iBusRsp_stages_2_halt = 1'b0;
  assign _zz_IBusSimplePlugin_iBusRsp_stages_2_input_ready = (! IBusSimplePlugin_iBusRsp_stages_2_halt);
  assign IBusSimplePlugin_iBusRsp_stages_2_input_ready = (IBusSimplePlugin_iBusRsp_stages_2_output_ready && _zz_IBusSimplePlugin_iBusRsp_stages_2_input_ready);
  assign IBusSimplePlugin_iBusRsp_stages_2_output_valid = (IBusSimplePlugin_iBusRsp_stages_2_input_valid && _zz_IBusSimplePlugin_iBusRsp_stages_2_input_ready);
  assign IBusSimplePlugin_iBusRsp_stages_2_output_payload = IBusSimplePlugin_iBusRsp_stages_2_input_payload;
  assign IBusSimplePlugin_iBusRsp_flush = (IBusSimplePlugin_externalFlush || IBusSimplePlugin_iBusRsp_redoFetch);
  assign IBusSimplePlugin_iBusRsp_stages_0_output_ready = _zz_IBusSimplePlugin_iBusRsp_stages_0_output_ready;
  assign _zz_IBusSimplePlugin_iBusRsp_stages_0_output_ready = ((1'b0 && (! _zz_IBusSimplePlugin_iBusRsp_stages_0_output_ready_1)) || IBusSimplePlugin_iBusRsp_stages_1_input_ready);
  assign _zz_IBusSimplePlugin_iBusRsp_stages_0_output_ready_1 = _zz_IBusSimplePlugin_iBusRsp_stages_0_output_ready_2;
  assign IBusSimplePlugin_iBusRsp_stages_1_input_valid = _zz_IBusSimplePlugin_iBusRsp_stages_0_output_ready_1;
  assign IBusSimplePlugin_iBusRsp_stages_1_input_payload = IBusSimplePlugin_fetchPc_pcReg;
  assign IBusSimplePlugin_iBusRsp_stages_1_output_ready = ((1'b0 && (! IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_valid)) || IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_ready);
  assign IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_valid = _zz_IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_valid;
  assign IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_payload = _zz_IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_payload;
  assign IBusSimplePlugin_iBusRsp_stages_2_input_valid = IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_valid;
  assign IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_ready = IBusSimplePlugin_iBusRsp_stages_2_input_ready;
  assign IBusSimplePlugin_iBusRsp_stages_2_input_payload = IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_payload;
  always @(*) begin
    IBusSimplePlugin_iBusRsp_readyForError = 1'b1;
    if(IBusSimplePlugin_injector_decodeInput_valid) begin
      IBusSimplePlugin_iBusRsp_readyForError = 1'b0;
    end
    if(when_Fetcher_l320) begin
      IBusSimplePlugin_iBusRsp_readyForError = 1'b0;
    end
  end

  assign when_Fetcher_l240 = (IBusSimplePlugin_iBusRsp_stages_1_input_valid || IBusSimplePlugin_iBusRsp_stages_2_input_valid);
  assign IBusSimplePlugin_iBusRsp_output_ready = ((1'b0 && (! IBusSimplePlugin_injector_decodeInput_valid)) || IBusSimplePlugin_injector_decodeInput_ready);
  assign IBusSimplePlugin_injector_decodeInput_valid = _zz_IBusSimplePlugin_injector_decodeInput_valid;
  assign IBusSimplePlugin_injector_decodeInput_payload_pc = _zz_IBusSimplePlugin_injector_decodeInput_payload_pc;
  assign IBusSimplePlugin_injector_decodeInput_payload_rsp_error = _zz_IBusSimplePlugin_injector_decodeInput_payload_rsp_error;
  assign IBusSimplePlugin_injector_decodeInput_payload_rsp_inst = _zz_IBusSimplePlugin_injector_decodeInput_payload_rsp_inst;
  assign IBusSimplePlugin_injector_decodeInput_payload_isRvc = _zz_IBusSimplePlugin_injector_decodeInput_payload_isRvc;
  assign when_Fetcher_l320 = (! IBusSimplePlugin_pcValids_0);
  assign when_Fetcher_l329 = (! (! IBusSimplePlugin_iBusRsp_stages_1_input_ready));
  assign when_Fetcher_l329_1 = (! (! IBusSimplePlugin_iBusRsp_stages_2_input_ready));
  assign when_Fetcher_l329_2 = (! (! IBusSimplePlugin_injector_decodeInput_ready));
  assign when_Fetcher_l329_3 = (! execute_arbitration_isStuck);
  assign when_Fetcher_l329_4 = (! memory_arbitration_isStuck);
  assign when_Fetcher_l329_5 = (! writeBack_arbitration_isStuck);
  assign IBusSimplePlugin_pcValids_0 = IBusSimplePlugin_injector_nextPcCalc_valids_2;
  assign IBusSimplePlugin_pcValids_1 = IBusSimplePlugin_injector_nextPcCalc_valids_3;
  assign IBusSimplePlugin_pcValids_2 = IBusSimplePlugin_injector_nextPcCalc_valids_4;
  assign IBusSimplePlugin_pcValids_3 = IBusSimplePlugin_injector_nextPcCalc_valids_5;
  assign IBusSimplePlugin_injector_decodeInput_ready = (! decode_arbitration_isStuck);
  always @(*) begin
    decode_arbitration_isValid = IBusSimplePlugin_injector_decodeInput_valid;
    case(switch_Fetcher_l362)
      3'b010 : begin
        decode_arbitration_isValid = 1'b1;
      end
      3'b011 : begin
        decode_arbitration_isValid = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign iBus_cmd_valid = IBusSimplePlugin_cmd_valid;
  assign IBusSimplePlugin_cmd_ready = iBus_cmd_ready;
  assign iBus_cmd_payload_pc = IBusSimplePlugin_cmd_payload_pc;
  assign IBusSimplePlugin_pending_next = (_zz_IBusSimplePlugin_pending_next - _zz_IBusSimplePlugin_pending_next_3);
  assign IBusSimplePlugin_cmdFork_canEmit = (IBusSimplePlugin_iBusRsp_stages_1_output_ready && (IBusSimplePlugin_pending_value != 3'b111));
  assign when_IBusSimplePlugin_l304 = (IBusSimplePlugin_iBusRsp_stages_1_input_valid && ((! IBusSimplePlugin_cmdFork_canEmit) || (! IBusSimplePlugin_cmd_ready)));
  assign IBusSimplePlugin_cmd_valid = (IBusSimplePlugin_iBusRsp_stages_1_input_valid && IBusSimplePlugin_cmdFork_canEmit);
  assign IBusSimplePlugin_cmd_fire = (IBusSimplePlugin_cmd_valid && IBusSimplePlugin_cmd_ready);
  assign IBusSimplePlugin_pending_inc = IBusSimplePlugin_cmd_fire;
  assign IBusSimplePlugin_cmd_payload_pc = {IBusSimplePlugin_iBusRsp_stages_1_input_payload[31 : 2],2'b00};
  assign IBusSimplePlugin_rspJoin_rspBuffer_flush = ((IBusSimplePlugin_rspJoin_rspBuffer_discardCounter != 3'b000) || IBusSimplePlugin_iBusRsp_flush);
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_valid = (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid && (IBusSimplePlugin_rspJoin_rspBuffer_discardCounter == 3'b000));
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_payload_error = IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_error;
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_payload_inst = IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_payload_inst;
  assign IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_ready = (IBusSimplePlugin_rspJoin_rspBuffer_output_ready || IBusSimplePlugin_rspJoin_rspBuffer_flush);
  assign IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_fire = (IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_valid && IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_ready);
  assign IBusSimplePlugin_pending_dec = IBusSimplePlugin_rspJoin_rspBuffer_c_io_pop_fire;
  assign IBusSimplePlugin_rspJoin_fetchRsp_pc = IBusSimplePlugin_iBusRsp_stages_2_output_payload;
  always @(*) begin
    IBusSimplePlugin_rspJoin_fetchRsp_rsp_error = IBusSimplePlugin_rspJoin_rspBuffer_output_payload_error;
    if(when_IBusSimplePlugin_l375) begin
      IBusSimplePlugin_rspJoin_fetchRsp_rsp_error = 1'b0;
    end
  end

  assign IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst = IBusSimplePlugin_rspJoin_rspBuffer_output_payload_inst;
  assign when_IBusSimplePlugin_l375 = (! IBusSimplePlugin_rspJoin_rspBuffer_output_valid);
  always @(*) begin
    IBusSimplePlugin_rspJoin_exceptionDetected = 1'b0;
    if(when_IBusSimplePlugin_l401) begin
      IBusSimplePlugin_rspJoin_exceptionDetected = 1'b1;
    end
  end

  assign IBusSimplePlugin_rspJoin_join_valid = (IBusSimplePlugin_iBusRsp_stages_2_output_valid && IBusSimplePlugin_rspJoin_rspBuffer_output_valid);
  assign IBusSimplePlugin_rspJoin_join_payload_pc = IBusSimplePlugin_rspJoin_fetchRsp_pc;
  assign IBusSimplePlugin_rspJoin_join_payload_rsp_error = IBusSimplePlugin_rspJoin_fetchRsp_rsp_error;
  assign IBusSimplePlugin_rspJoin_join_payload_rsp_inst = IBusSimplePlugin_rspJoin_fetchRsp_rsp_inst;
  assign IBusSimplePlugin_rspJoin_join_payload_isRvc = IBusSimplePlugin_rspJoin_fetchRsp_isRvc;
  assign IBusSimplePlugin_rspJoin_join_fire = (IBusSimplePlugin_rspJoin_join_valid && IBusSimplePlugin_rspJoin_join_ready);
  assign IBusSimplePlugin_iBusRsp_stages_2_output_ready = (IBusSimplePlugin_iBusRsp_stages_2_output_valid ? IBusSimplePlugin_rspJoin_join_fire : IBusSimplePlugin_rspJoin_join_ready);
  assign IBusSimplePlugin_rspJoin_join_fire_1 = (IBusSimplePlugin_rspJoin_join_valid && IBusSimplePlugin_rspJoin_join_ready);
  assign IBusSimplePlugin_rspJoin_rspBuffer_output_ready = IBusSimplePlugin_rspJoin_join_fire_1;
  assign _zz_IBusSimplePlugin_iBusRsp_output_valid = (! IBusSimplePlugin_rspJoin_exceptionDetected);
  assign IBusSimplePlugin_rspJoin_join_ready = (IBusSimplePlugin_iBusRsp_output_ready && _zz_IBusSimplePlugin_iBusRsp_output_valid);
  assign IBusSimplePlugin_iBusRsp_output_valid = (IBusSimplePlugin_rspJoin_join_valid && _zz_IBusSimplePlugin_iBusRsp_output_valid);
  assign IBusSimplePlugin_iBusRsp_output_payload_pc = IBusSimplePlugin_rspJoin_join_payload_pc;
  assign IBusSimplePlugin_iBusRsp_output_payload_rsp_error = IBusSimplePlugin_rspJoin_join_payload_rsp_error;
  assign IBusSimplePlugin_iBusRsp_output_payload_rsp_inst = IBusSimplePlugin_rspJoin_join_payload_rsp_inst;
  assign IBusSimplePlugin_iBusRsp_output_payload_isRvc = IBusSimplePlugin_rspJoin_join_payload_isRvc;
  always @(*) begin
    IBusSimplePlugin_decodeExceptionPort_payload_code = 4'bxxxx;
    if(when_IBusSimplePlugin_l401) begin
      IBusSimplePlugin_decodeExceptionPort_payload_code = 4'b0001;
    end
  end

  assign IBusSimplePlugin_decodeExceptionPort_payload_badAddr = {IBusSimplePlugin_rspJoin_join_payload_pc[31 : 2],2'b00};
  assign when_IBusSimplePlugin_l401 = (IBusSimplePlugin_rspJoin_join_valid && IBusSimplePlugin_rspJoin_join_payload_rsp_error);
  assign IBusSimplePlugin_decodeExceptionPort_valid = (IBusSimplePlugin_rspJoin_exceptionDetected && IBusSimplePlugin_iBusRsp_readyForError);
  assign _zz_dBus_cmd_valid = 1'b0;
  always @(*) begin
    execute_DBusSimplePlugin_skipCmd = 1'b0;
    if(execute_ALIGNEMENT_FAULT) begin
      execute_DBusSimplePlugin_skipCmd = 1'b1;
    end
  end

  assign dBus_cmd_valid = (((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! execute_arbitration_isStuckByOthers)) && (! execute_arbitration_isFlushed)) && (! execute_DBusSimplePlugin_skipCmd)) && (! _zz_dBus_cmd_valid));
  assign dBus_cmd_payload_wr = execute_MEMORY_STORE;
  assign dBus_cmd_payload_size = execute_INSTRUCTION[13 : 12];
  always @(*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_dBus_cmd_payload_data = {{{execute_RS2[7 : 0],execute_RS2[7 : 0]},execute_RS2[7 : 0]},execute_RS2[7 : 0]};
      end
      2'b01 : begin
        _zz_dBus_cmd_payload_data = {execute_RS2[15 : 0],execute_RS2[15 : 0]};
      end
      default : begin
        _zz_dBus_cmd_payload_data = execute_RS2[31 : 0];
      end
    endcase
  end

  assign dBus_cmd_payload_data = _zz_dBus_cmd_payload_data;
  assign when_DBusSimplePlugin_l426 = ((((execute_arbitration_isValid && execute_MEMORY_ENABLE) && (! dBus_cmd_ready)) && (! execute_DBusSimplePlugin_skipCmd)) && (! _zz_dBus_cmd_valid));
  always @(*) begin
    case(dBus_cmd_payload_size)
      2'b00 : begin
        _zz_execute_DBusSimplePlugin_formalMask = 4'b0001;
      end
      2'b01 : begin
        _zz_execute_DBusSimplePlugin_formalMask = 4'b0011;
      end
      default : begin
        _zz_execute_DBusSimplePlugin_formalMask = 4'b1111;
      end
    endcase
  end

  assign execute_DBusSimplePlugin_formalMask = (_zz_execute_DBusSimplePlugin_formalMask <<< dBus_cmd_payload_address[1 : 0]);
  assign dBus_cmd_payload_address = execute_SRC_ADD;
  assign when_DBusSimplePlugin_l479 = (((memory_arbitration_isValid && memory_MEMORY_ENABLE) && (! memory_MEMORY_STORE)) && ((! dBus_rsp_ready) || 1'b0));
  always @(*) begin
    DBusSimplePlugin_memoryExceptionPort_valid = 1'b0;
    if(when_DBusSimplePlugin_l486) begin
      DBusSimplePlugin_memoryExceptionPort_valid = 1'b1;
    end
    if(memory_ALIGNEMENT_FAULT) begin
      DBusSimplePlugin_memoryExceptionPort_valid = 1'b1;
    end
    if(when_DBusSimplePlugin_l512) begin
      DBusSimplePlugin_memoryExceptionPort_valid = 1'b0;
    end
  end

  always @(*) begin
    DBusSimplePlugin_memoryExceptionPort_payload_code = 4'bxxxx;
    if(when_DBusSimplePlugin_l486) begin
      DBusSimplePlugin_memoryExceptionPort_payload_code = 4'b0101;
    end
    if(memory_ALIGNEMENT_FAULT) begin
      DBusSimplePlugin_memoryExceptionPort_payload_code = {1'd0, _zz_DBusSimplePlugin_memoryExceptionPort_payload_code};
    end
  end

  assign DBusSimplePlugin_memoryExceptionPort_payload_badAddr = memory_REGFILE_WRITE_DATA;
  assign when_DBusSimplePlugin_l486 = ((dBus_rsp_ready && dBus_rsp_error) && (! memory_MEMORY_STORE));
  assign when_DBusSimplePlugin_l512 = (! ((memory_arbitration_isValid && memory_MEMORY_ENABLE) && (1'b1 || (! memory_arbitration_isStuckByOthers))));
  always @(*) begin
    memory_DBusSimplePlugin_rspShifted = memory_MEMORY_READ_DATA;
    case(memory_MEMORY_ADDRESS_LOW)
      2'b01 : begin
        memory_DBusSimplePlugin_rspShifted[7 : 0] = memory_MEMORY_READ_DATA[15 : 8];
      end
      2'b10 : begin
        memory_DBusSimplePlugin_rspShifted[15 : 0] = memory_MEMORY_READ_DATA[31 : 16];
      end
      2'b11 : begin
        memory_DBusSimplePlugin_rspShifted[7 : 0] = memory_MEMORY_READ_DATA[31 : 24];
      end
      default : begin
      end
    endcase
  end

  assign switch_Misc_l202 = memory_INSTRUCTION[13 : 12];
  assign _zz_memory_DBusSimplePlugin_rspFormated = (memory_DBusSimplePlugin_rspShifted[7] && (! memory_INSTRUCTION[14]));
  always @(*) begin
    _zz_memory_DBusSimplePlugin_rspFormated_1[31] = _zz_memory_DBusSimplePlugin_rspFormated;
    _zz_memory_DBusSimplePlugin_rspFormated_1[30] = _zz_memory_DBusSimplePlugin_rspFormated;
    _zz_memory_DBusSimplePlugin_rspFormated_1[29] = _zz_memory_DBusSimplePlugin_rspFormated;
    _zz_memory_DBusSimplePlugin_rspFormated_1[28] = _zz_memory_DBusSimplePlugin_rspFormated;
    _zz_memory_DBusSimplePlugin_rspFormated_1[27] = _zz_memory_DBusSimplePlugin_rspFormated;
    _zz_memory_DBusSimplePlugin_rspFormated_1[26] = _zz_memory_DBusSimplePlugin_rspFormated;
    _zz_memory_DBusSimplePlugin_rspFormated_1[25] = _zz_memory_DBusSimplePlugin_rspFormated;
    _zz_memory_DBusSimplePlugin_rspFormated_1[24] = _zz_memory_DBusSimplePlugin_rspFormated;
    _zz_memory_DBusSimplePlugin_rspFormated_1[23] = _zz_memory_DBusSimplePlugin_rspFormated;
    _zz_memory_DBusSimplePlugin_rspFormated_1[22] = _zz_memory_DBusSimplePlugin_rspFormated;
    _zz_memory_DBusSimplePlugin_rspFormated_1[21] = _zz_memory_DBusSimplePlugin_rspFormated;
    _zz_memory_DBusSimplePlugin_rspFormated_1[20] = _zz_memory_DBusSimplePlugin_rspFormated;
    _zz_memory_DBusSimplePlugin_rspFormated_1[19] = _zz_memory_DBusSimplePlugin_rspFormated;
    _zz_memory_DBusSimplePlugin_rspFormated_1[18] = _zz_memory_DBusSimplePlugin_rspFormated;
    _zz_memory_DBusSimplePlugin_rspFormated_1[17] = _zz_memory_DBusSimplePlugin_rspFormated;
    _zz_memory_DBusSimplePlugin_rspFormated_1[16] = _zz_memory_DBusSimplePlugin_rspFormated;
    _zz_memory_DBusSimplePlugin_rspFormated_1[15] = _zz_memory_DBusSimplePlugin_rspFormated;
    _zz_memory_DBusSimplePlugin_rspFormated_1[14] = _zz_memory_DBusSimplePlugin_rspFormated;
    _zz_memory_DBusSimplePlugin_rspFormated_1[13] = _zz_memory_DBusSimplePlugin_rspFormated;
    _zz_memory_DBusSimplePlugin_rspFormated_1[12] = _zz_memory_DBusSimplePlugin_rspFormated;
    _zz_memory_DBusSimplePlugin_rspFormated_1[11] = _zz_memory_DBusSimplePlugin_rspFormated;
    _zz_memory_DBusSimplePlugin_rspFormated_1[10] = _zz_memory_DBusSimplePlugin_rspFormated;
    _zz_memory_DBusSimplePlugin_rspFormated_1[9] = _zz_memory_DBusSimplePlugin_rspFormated;
    _zz_memory_DBusSimplePlugin_rspFormated_1[8] = _zz_memory_DBusSimplePlugin_rspFormated;
    _zz_memory_DBusSimplePlugin_rspFormated_1[7 : 0] = memory_DBusSimplePlugin_rspShifted[7 : 0];
  end

  assign _zz_memory_DBusSimplePlugin_rspFormated_2 = (memory_DBusSimplePlugin_rspShifted[15] && (! memory_INSTRUCTION[14]));
  always @(*) begin
    _zz_memory_DBusSimplePlugin_rspFormated_3[31] = _zz_memory_DBusSimplePlugin_rspFormated_2;
    _zz_memory_DBusSimplePlugin_rspFormated_3[30] = _zz_memory_DBusSimplePlugin_rspFormated_2;
    _zz_memory_DBusSimplePlugin_rspFormated_3[29] = _zz_memory_DBusSimplePlugin_rspFormated_2;
    _zz_memory_DBusSimplePlugin_rspFormated_3[28] = _zz_memory_DBusSimplePlugin_rspFormated_2;
    _zz_memory_DBusSimplePlugin_rspFormated_3[27] = _zz_memory_DBusSimplePlugin_rspFormated_2;
    _zz_memory_DBusSimplePlugin_rspFormated_3[26] = _zz_memory_DBusSimplePlugin_rspFormated_2;
    _zz_memory_DBusSimplePlugin_rspFormated_3[25] = _zz_memory_DBusSimplePlugin_rspFormated_2;
    _zz_memory_DBusSimplePlugin_rspFormated_3[24] = _zz_memory_DBusSimplePlugin_rspFormated_2;
    _zz_memory_DBusSimplePlugin_rspFormated_3[23] = _zz_memory_DBusSimplePlugin_rspFormated_2;
    _zz_memory_DBusSimplePlugin_rspFormated_3[22] = _zz_memory_DBusSimplePlugin_rspFormated_2;
    _zz_memory_DBusSimplePlugin_rspFormated_3[21] = _zz_memory_DBusSimplePlugin_rspFormated_2;
    _zz_memory_DBusSimplePlugin_rspFormated_3[20] = _zz_memory_DBusSimplePlugin_rspFormated_2;
    _zz_memory_DBusSimplePlugin_rspFormated_3[19] = _zz_memory_DBusSimplePlugin_rspFormated_2;
    _zz_memory_DBusSimplePlugin_rspFormated_3[18] = _zz_memory_DBusSimplePlugin_rspFormated_2;
    _zz_memory_DBusSimplePlugin_rspFormated_3[17] = _zz_memory_DBusSimplePlugin_rspFormated_2;
    _zz_memory_DBusSimplePlugin_rspFormated_3[16] = _zz_memory_DBusSimplePlugin_rspFormated_2;
    _zz_memory_DBusSimplePlugin_rspFormated_3[15 : 0] = memory_DBusSimplePlugin_rspShifted[15 : 0];
  end

  always @(*) begin
    case(switch_Misc_l202)
      2'b00 : begin
        memory_DBusSimplePlugin_rspFormated = _zz_memory_DBusSimplePlugin_rspFormated_1;
      end
      2'b01 : begin
        memory_DBusSimplePlugin_rspFormated = _zz_memory_DBusSimplePlugin_rspFormated_3;
      end
      default : begin
        memory_DBusSimplePlugin_rspFormated = memory_DBusSimplePlugin_rspShifted;
      end
    endcase
  end

  assign when_DBusSimplePlugin_l558 = (memory_arbitration_isValid && memory_MEMORY_ENABLE);
  always @(*) begin
    CsrPlugin_privilege = 2'b11;
    if(CsrPlugin_forceMachineWire) begin
      CsrPlugin_privilege = 2'b11;
    end
  end

  assign CsrPlugin_misa_base = 2'b01;
  assign CsrPlugin_misa_extensions = 26'h0000042;
  assign _zz_when_CsrPlugin_l952 = (CsrPlugin_mip_MTIP && CsrPlugin_mie_MTIE);
  assign _zz_when_CsrPlugin_l952_1 = (CsrPlugin_mip_MSIP && CsrPlugin_mie_MSIE);
  assign _zz_when_CsrPlugin_l952_2 = (CsrPlugin_mip_MEIP && CsrPlugin_mie_MEIE);
  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped = 2'b11;
  assign CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege = ((CsrPlugin_privilege < CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped) ? CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilegeUncapped : CsrPlugin_privilege);
  assign _zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code = {decodeExceptionPort_valid,IBusSimplePlugin_decodeExceptionPort_valid};
  assign _zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1 = _zz__zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1[0];
  always @(*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_decode = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
    if(_zz_when) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_decode = 1'b1;
    end
    if(decode_arbitration_isFlushed) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_decode = 1'b0;
    end
  end

  always @(*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_execute = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
    if(execute_arbitration_isFlushed) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_execute = 1'b0;
    end
  end

  always @(*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_memory = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
    if(DBusSimplePlugin_memoryExceptionPort_valid) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_memory = 1'b1;
    end
    if(memory_arbitration_isFlushed) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_memory = 1'b0;
    end
  end

  always @(*) begin
    CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
    if(writeBack_arbitration_isFlushed) begin
      CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack = 1'b0;
    end
  end

  assign when_CsrPlugin_l909 = (! decode_arbitration_isStuck);
  assign when_CsrPlugin_l909_1 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l909_2 = (! memory_arbitration_isStuck);
  assign when_CsrPlugin_l909_3 = (! writeBack_arbitration_isStuck);
  assign when_CsrPlugin_l922 = ({CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack,{CsrPlugin_exceptionPortCtrl_exceptionValids_memory,{CsrPlugin_exceptionPortCtrl_exceptionValids_execute,CsrPlugin_exceptionPortCtrl_exceptionValids_decode}}} != 4'b0000);
  assign CsrPlugin_exceptionPendings_0 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  assign CsrPlugin_exceptionPendings_1 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
  assign CsrPlugin_exceptionPendings_2 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
  assign CsrPlugin_exceptionPendings_3 = CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
  assign when_CsrPlugin_l946 = (CsrPlugin_mstatus_MIE || (CsrPlugin_privilege < 2'b11));
  assign when_CsrPlugin_l952 = ((_zz_when_CsrPlugin_l952 && 1'b1) && (! 1'b0));
  assign when_CsrPlugin_l952_1 = ((_zz_when_CsrPlugin_l952_1 && 1'b1) && (! 1'b0));
  assign when_CsrPlugin_l952_2 = ((_zz_when_CsrPlugin_l952_2 && 1'b1) && (! 1'b0));
  assign CsrPlugin_exception = (CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack && CsrPlugin_allowException);
  assign CsrPlugin_lastStageWasWfi = 1'b0;
  assign CsrPlugin_pipelineLiberator_active = ((CsrPlugin_interrupt_valid && CsrPlugin_allowInterrupts) && decode_arbitration_isValid);
  assign when_CsrPlugin_l980 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l980_1 = (! memory_arbitration_isStuck);
  assign when_CsrPlugin_l980_2 = (! writeBack_arbitration_isStuck);
  assign when_CsrPlugin_l985 = ((! CsrPlugin_pipelineLiberator_active) || decode_arbitration_removeIt);
  always @(*) begin
    CsrPlugin_pipelineLiberator_done = CsrPlugin_pipelineLiberator_pcValids_2;
    if(when_CsrPlugin_l991) begin
      CsrPlugin_pipelineLiberator_done = 1'b0;
    end
    if(CsrPlugin_hadException) begin
      CsrPlugin_pipelineLiberator_done = 1'b0;
    end
  end

  assign when_CsrPlugin_l991 = ({CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack,{CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory,CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute}} != 3'b000);
  assign CsrPlugin_interruptJump = ((CsrPlugin_interrupt_valid && CsrPlugin_pipelineLiberator_done) && CsrPlugin_allowInterrupts);
  always @(*) begin
    CsrPlugin_targetPrivilege = CsrPlugin_interrupt_targetPrivilege;
    if(CsrPlugin_hadException) begin
      CsrPlugin_targetPrivilege = CsrPlugin_exceptionPortCtrl_exceptionTargetPrivilege;
    end
  end

  always @(*) begin
    CsrPlugin_trapCause = CsrPlugin_interrupt_code;
    if(CsrPlugin_hadException) begin
      CsrPlugin_trapCause = CsrPlugin_exceptionPortCtrl_exceptionContext_code;
    end
  end

  always @(*) begin
    CsrPlugin_xtvec_mode = 2'bxx;
    case(CsrPlugin_targetPrivilege)
      2'b11 : begin
        CsrPlugin_xtvec_mode = CsrPlugin_mtvec_mode;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    CsrPlugin_xtvec_base = 30'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
    case(CsrPlugin_targetPrivilege)
      2'b11 : begin
        CsrPlugin_xtvec_base = CsrPlugin_mtvec_base;
      end
      default : begin
      end
    endcase
  end

  assign when_CsrPlugin_l1019 = (CsrPlugin_hadException || CsrPlugin_interruptJump);
  assign when_CsrPlugin_l1064 = (writeBack_arbitration_isValid && (writeBack_ENV_CTRL == `EnvCtrlEnum_binary_sequential_XRET));
  assign switch_CsrPlugin_l1068 = writeBack_INSTRUCTION[29 : 28];
  assign contextSwitching = CsrPlugin_jumpInterface_valid;
  assign when_CsrPlugin_l1116 = ({(writeBack_arbitration_isValid && (writeBack_ENV_CTRL == `EnvCtrlEnum_binary_sequential_XRET)),{(memory_arbitration_isValid && (memory_ENV_CTRL == `EnvCtrlEnum_binary_sequential_XRET)),(execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_binary_sequential_XRET))}} != 3'b000);
  assign execute_CsrPlugin_blockedBySideEffects = (({writeBack_arbitration_isValid,memory_arbitration_isValid} != 2'b00) || 1'b0);
  always @(*) begin
    execute_CsrPlugin_illegalAccess = 1'b1;
    if(execute_CsrPlugin_csr_768) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_836) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_772) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_773) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(execute_CsrPlugin_csr_834) begin
      if(execute_CSR_READ_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_2816) begin
      if(execute_CSR_READ_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_2944) begin
      if(execute_CSR_READ_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_2818) begin
      if(execute_CSR_READ_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(execute_CsrPlugin_csr_2946) begin
      if(execute_CSR_READ_OPCODE) begin
        execute_CsrPlugin_illegalAccess = 1'b0;
      end
    end
    if(CsrPlugin_csrMapping_allowCsrSignal) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
    if(when_CsrPlugin_l1297) begin
      execute_CsrPlugin_illegalAccess = 1'b1;
    end
    if(when_CsrPlugin_l1302) begin
      execute_CsrPlugin_illegalAccess = 1'b0;
    end
  end

  always @(*) begin
    execute_CsrPlugin_illegalInstruction = 1'b0;
    if(when_CsrPlugin_l1136) begin
      if(when_CsrPlugin_l1137) begin
        execute_CsrPlugin_illegalInstruction = 1'b1;
      end
    end
  end

  assign when_CsrPlugin_l1136 = (execute_arbitration_isValid && (execute_ENV_CTRL == `EnvCtrlEnum_binary_sequential_XRET));
  assign when_CsrPlugin_l1137 = (CsrPlugin_privilege < execute_INSTRUCTION[29 : 28]);
  always @(*) begin
    execute_CsrPlugin_writeInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_WRITE_OPCODE);
    if(when_CsrPlugin_l1297) begin
      execute_CsrPlugin_writeInstruction = 1'b0;
    end
  end

  always @(*) begin
    execute_CsrPlugin_readInstruction = ((execute_arbitration_isValid && execute_IS_CSR) && execute_CSR_READ_OPCODE);
    if(when_CsrPlugin_l1297) begin
      execute_CsrPlugin_readInstruction = 1'b0;
    end
  end

  assign execute_CsrPlugin_writeEnable = (execute_CsrPlugin_writeInstruction && (! execute_arbitration_isStuck));
  assign execute_CsrPlugin_readEnable = (execute_CsrPlugin_readInstruction && (! execute_arbitration_isStuck));
  assign CsrPlugin_csrMapping_hazardFree = (! execute_CsrPlugin_blockedBySideEffects);
  assign execute_CsrPlugin_readToWriteData = CsrPlugin_csrMapping_readDataSignal;
  assign switch_Misc_l202_1 = execute_INSTRUCTION[13];
  always @(*) begin
    case(switch_Misc_l202_1)
      1'b0 : begin
        _zz_CsrPlugin_csrMapping_writeDataSignal = execute_SRC1;
      end
      default : begin
        _zz_CsrPlugin_csrMapping_writeDataSignal = (execute_INSTRUCTION[12] ? (execute_CsrPlugin_readToWriteData & (~ execute_SRC1)) : (execute_CsrPlugin_readToWriteData | execute_SRC1));
      end
    endcase
  end

  assign CsrPlugin_csrMapping_writeDataSignal = _zz_CsrPlugin_csrMapping_writeDataSignal;
  assign when_CsrPlugin_l1176 = (execute_arbitration_isValid && execute_IS_CSR);
  assign when_CsrPlugin_l1180 = (execute_arbitration_isValid && (execute_IS_CSR || 1'b0));
  assign execute_CsrPlugin_csrAddress = execute_INSTRUCTION[31 : 20];
  assign _zz_decode_IS_OP_SUB_1 = ((decode_INSTRUCTION & 32'h00004050) == 32'h00004050);
  assign _zz_decode_IS_OP_SUB_2 = ((decode_INSTRUCTION & 32'h00000028) == 32'h0);
  assign _zz_decode_IS_OP_SUB_3 = ((decode_INSTRUCTION & 32'h00000004) == 32'h00000004);
  assign _zz_decode_IS_OP_SUB_4 = ((decode_INSTRUCTION & 32'h00000048) == 32'h00000048);
  assign _zz_decode_IS_OP_SUB_5 = ((decode_INSTRUCTION & 32'h0000000c) == 32'h00000008);
  assign _zz_decode_IS_OP_SUB = {(((decode_INSTRUCTION & _zz__zz_decode_IS_OP_SUB) == 32'h00000050) != 1'b0),{((_zz__zz_decode_IS_OP_SUB_1 == _zz__zz_decode_IS_OP_SUB_2) != 1'b0),{(_zz__zz_decode_IS_OP_SUB_3 != 1'b0),{(_zz__zz_decode_IS_OP_SUB_4 != _zz__zz_decode_IS_OP_SUB_5),{_zz__zz_decode_IS_OP_SUB_6,{_zz__zz_decode_IS_OP_SUB_7,_zz__zz_decode_IS_OP_SUB_10}}}}}};
  assign _zz_decode_SRC1_CTRL_2 = _zz_decode_IS_OP_SUB[1 : 0];
  assign _zz_decode_SRC1_CTRL_1 = _zz_decode_SRC1_CTRL_2;
  assign _zz_decode_ALU_CTRL_2 = _zz_decode_IS_OP_SUB[6 : 5];
  assign _zz_decode_ALU_CTRL_1 = _zz_decode_ALU_CTRL_2;
  assign _zz_decode_SRC2_CTRL_2 = _zz_decode_IS_OP_SUB[8 : 7];
  assign _zz_decode_SRC2_CTRL_1 = _zz_decode_SRC2_CTRL_2;
  assign _zz_decode_ENV_CTRL_2 = _zz_decode_IS_OP_SUB[16 : 16];
  assign _zz_decode_ENV_CTRL_1 = _zz_decode_ENV_CTRL_2;
  assign _zz_decode_ALU_BITWISE_CTRL_2 = _zz_decode_IS_OP_SUB[19 : 18];
  assign _zz_decode_ALU_BITWISE_CTRL_1 = _zz_decode_ALU_BITWISE_CTRL_2;
  assign _zz_decode_SHIFT_CTRL_2 = _zz_decode_IS_OP_SUB[22 : 21];
  assign _zz_decode_SHIFT_CTRL_1 = _zz_decode_SHIFT_CTRL_2;
  assign _zz_decode_BRANCH_CTRL_2 = _zz_decode_IS_OP_SUB[24 : 23];
  assign _zz_decode_BRANCH_CTRL_1 = _zz_decode_BRANCH_CTRL_2;
  assign decodeExceptionPort_valid = (decode_arbitration_isValid && (! decode_LEGAL_INSTRUCTION));
  assign decodeExceptionPort_payload_code = 4'b0010;
  assign decodeExceptionPort_payload_badAddr = decode_INSTRUCTION;
  assign when_RegFilePlugin_l63 = (decode_INSTRUCTION[11 : 7] == 5'h0);
  assign decode_RegFilePlugin_regFileReadAddress1 = decode_INSTRUCTION_ANTICIPATED[19 : 15];
  assign decode_RegFilePlugin_regFileReadAddress2 = decode_INSTRUCTION_ANTICIPATED[24 : 20];
  assign decode_RegFilePlugin_rs1Data = _zz_RegFilePlugin_regFile_port0;
  assign decode_RegFilePlugin_rs2Data = _zz_RegFilePlugin_regFile_port1;
  always @(*) begin
    lastStageRegFileWrite_valid = (_zz_lastStageRegFileWrite_valid && writeBack_arbitration_isFiring);
    if(_zz_2) begin
      lastStageRegFileWrite_valid = 1'b1;
    end
  end

  always @(*) begin
    lastStageRegFileWrite_payload_address = _zz_lastStageRegFileWrite_payload_address[11 : 7];
    if(_zz_2) begin
      lastStageRegFileWrite_payload_address = 5'h0;
    end
  end

  always @(*) begin
    lastStageRegFileWrite_payload_data = _zz_decode_RS2;
    if(_zz_2) begin
      lastStageRegFileWrite_payload_data = 32'h0;
    end
  end

  always @(*) begin
    case(execute_ALU_BITWISE_CTRL)
      `AluBitwiseCtrlEnum_binary_sequential_AND_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 & execute_SRC2);
      end
      `AluBitwiseCtrlEnum_binary_sequential_OR_1 : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 | execute_SRC2);
      end
      default : begin
        execute_IntAluPlugin_bitwise = (execute_SRC1 ^ execute_SRC2);
      end
    endcase
  end

  always @(*) begin
    case(execute_ALU_CTRL)
      `AluCtrlEnum_binary_sequential_BITWISE : begin
        _zz_execute_REGFILE_WRITE_DATA = execute_IntAluPlugin_bitwise;
      end
      `AluCtrlEnum_binary_sequential_SLT_SLTU : begin
        _zz_execute_REGFILE_WRITE_DATA = {31'd0, _zz__zz_execute_REGFILE_WRITE_DATA};
      end
      default : begin
        _zz_execute_REGFILE_WRITE_DATA = execute_SRC_ADD_SUB;
      end
    endcase
  end

  always @(*) begin
    case(decode_SRC1_CTRL)
      `Src1CtrlEnum_binary_sequential_RS : begin
        _zz_decode_SRC1_1 = _zz_decode_SRC1;
      end
      `Src1CtrlEnum_binary_sequential_PC_INCREMENT : begin
        _zz_decode_SRC1_1 = {29'd0, _zz__zz_decode_SRC1_1};
      end
      `Src1CtrlEnum_binary_sequential_IMU : begin
        _zz_decode_SRC1_1 = {decode_INSTRUCTION[31 : 12],12'h0};
      end
      default : begin
        _zz_decode_SRC1_1 = {27'd0, _zz__zz_decode_SRC1_1_1};
      end
    endcase
  end

  assign _zz_decode_SRC2_2 = decode_INSTRUCTION[31];
  always @(*) begin
    _zz_decode_SRC2_3[19] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[18] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[17] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[16] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[15] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[14] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[13] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[12] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[11] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[10] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[9] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[8] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[7] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[6] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[5] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[4] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[3] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[2] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[1] = _zz_decode_SRC2_2;
    _zz_decode_SRC2_3[0] = _zz_decode_SRC2_2;
  end

  assign _zz_decode_SRC2_4 = _zz__zz_decode_SRC2_4[11];
  always @(*) begin
    _zz_decode_SRC2_5[19] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[18] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[17] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[16] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[15] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[14] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[13] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[12] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[11] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[10] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[9] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[8] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[7] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[6] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[5] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[4] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[3] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[2] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[1] = _zz_decode_SRC2_4;
    _zz_decode_SRC2_5[0] = _zz_decode_SRC2_4;
  end

  always @(*) begin
    case(decode_SRC2_CTRL)
      `Src2CtrlEnum_binary_sequential_RS : begin
        _zz_decode_SRC2_6 = _zz_decode_SRC2_1;
      end
      `Src2CtrlEnum_binary_sequential_IMI : begin
        _zz_decode_SRC2_6 = {_zz_decode_SRC2_3,decode_INSTRUCTION[31 : 20]};
      end
      `Src2CtrlEnum_binary_sequential_IMS : begin
        _zz_decode_SRC2_6 = {_zz_decode_SRC2_5,{decode_INSTRUCTION[31 : 25],decode_INSTRUCTION[11 : 7]}};
      end
      default : begin
        _zz_decode_SRC2_6 = _zz_decode_SRC2;
      end
    endcase
  end

  always @(*) begin
    execute_SrcPlugin_addSub = _zz_execute_SrcPlugin_addSub;
    if(execute_SRC2_FORCE_ZERO) begin
      execute_SrcPlugin_addSub = execute_SRC1;
    end
  end

  assign execute_SrcPlugin_less = ((execute_SRC1[31] == execute_SRC2[31]) ? execute_SrcPlugin_addSub[31] : (execute_SRC_LESS_UNSIGNED ? execute_SRC2[31] : execute_SRC1[31]));
  assign execute_FullBarrelShifterPlugin_amplitude = execute_SRC2[4 : 0];
  always @(*) begin
    _zz_execute_FullBarrelShifterPlugin_reversed[0] = execute_SRC1[31];
    _zz_execute_FullBarrelShifterPlugin_reversed[1] = execute_SRC1[30];
    _zz_execute_FullBarrelShifterPlugin_reversed[2] = execute_SRC1[29];
    _zz_execute_FullBarrelShifterPlugin_reversed[3] = execute_SRC1[28];
    _zz_execute_FullBarrelShifterPlugin_reversed[4] = execute_SRC1[27];
    _zz_execute_FullBarrelShifterPlugin_reversed[5] = execute_SRC1[26];
    _zz_execute_FullBarrelShifterPlugin_reversed[6] = execute_SRC1[25];
    _zz_execute_FullBarrelShifterPlugin_reversed[7] = execute_SRC1[24];
    _zz_execute_FullBarrelShifterPlugin_reversed[8] = execute_SRC1[23];
    _zz_execute_FullBarrelShifterPlugin_reversed[9] = execute_SRC1[22];
    _zz_execute_FullBarrelShifterPlugin_reversed[10] = execute_SRC1[21];
    _zz_execute_FullBarrelShifterPlugin_reversed[11] = execute_SRC1[20];
    _zz_execute_FullBarrelShifterPlugin_reversed[12] = execute_SRC1[19];
    _zz_execute_FullBarrelShifterPlugin_reversed[13] = execute_SRC1[18];
    _zz_execute_FullBarrelShifterPlugin_reversed[14] = execute_SRC1[17];
    _zz_execute_FullBarrelShifterPlugin_reversed[15] = execute_SRC1[16];
    _zz_execute_FullBarrelShifterPlugin_reversed[16] = execute_SRC1[15];
    _zz_execute_FullBarrelShifterPlugin_reversed[17] = execute_SRC1[14];
    _zz_execute_FullBarrelShifterPlugin_reversed[18] = execute_SRC1[13];
    _zz_execute_FullBarrelShifterPlugin_reversed[19] = execute_SRC1[12];
    _zz_execute_FullBarrelShifterPlugin_reversed[20] = execute_SRC1[11];
    _zz_execute_FullBarrelShifterPlugin_reversed[21] = execute_SRC1[10];
    _zz_execute_FullBarrelShifterPlugin_reversed[22] = execute_SRC1[9];
    _zz_execute_FullBarrelShifterPlugin_reversed[23] = execute_SRC1[8];
    _zz_execute_FullBarrelShifterPlugin_reversed[24] = execute_SRC1[7];
    _zz_execute_FullBarrelShifterPlugin_reversed[25] = execute_SRC1[6];
    _zz_execute_FullBarrelShifterPlugin_reversed[26] = execute_SRC1[5];
    _zz_execute_FullBarrelShifterPlugin_reversed[27] = execute_SRC1[4];
    _zz_execute_FullBarrelShifterPlugin_reversed[28] = execute_SRC1[3];
    _zz_execute_FullBarrelShifterPlugin_reversed[29] = execute_SRC1[2];
    _zz_execute_FullBarrelShifterPlugin_reversed[30] = execute_SRC1[1];
    _zz_execute_FullBarrelShifterPlugin_reversed[31] = execute_SRC1[0];
  end

  assign execute_FullBarrelShifterPlugin_reversed = ((execute_SHIFT_CTRL == `ShiftCtrlEnum_binary_sequential_SLL_1) ? _zz_execute_FullBarrelShifterPlugin_reversed : execute_SRC1);
  always @(*) begin
    _zz_decode_RS2_3[0] = memory_SHIFT_RIGHT[31];
    _zz_decode_RS2_3[1] = memory_SHIFT_RIGHT[30];
    _zz_decode_RS2_3[2] = memory_SHIFT_RIGHT[29];
    _zz_decode_RS2_3[3] = memory_SHIFT_RIGHT[28];
    _zz_decode_RS2_3[4] = memory_SHIFT_RIGHT[27];
    _zz_decode_RS2_3[5] = memory_SHIFT_RIGHT[26];
    _zz_decode_RS2_3[6] = memory_SHIFT_RIGHT[25];
    _zz_decode_RS2_3[7] = memory_SHIFT_RIGHT[24];
    _zz_decode_RS2_3[8] = memory_SHIFT_RIGHT[23];
    _zz_decode_RS2_3[9] = memory_SHIFT_RIGHT[22];
    _zz_decode_RS2_3[10] = memory_SHIFT_RIGHT[21];
    _zz_decode_RS2_3[11] = memory_SHIFT_RIGHT[20];
    _zz_decode_RS2_3[12] = memory_SHIFT_RIGHT[19];
    _zz_decode_RS2_3[13] = memory_SHIFT_RIGHT[18];
    _zz_decode_RS2_3[14] = memory_SHIFT_RIGHT[17];
    _zz_decode_RS2_3[15] = memory_SHIFT_RIGHT[16];
    _zz_decode_RS2_3[16] = memory_SHIFT_RIGHT[15];
    _zz_decode_RS2_3[17] = memory_SHIFT_RIGHT[14];
    _zz_decode_RS2_3[18] = memory_SHIFT_RIGHT[13];
    _zz_decode_RS2_3[19] = memory_SHIFT_RIGHT[12];
    _zz_decode_RS2_3[20] = memory_SHIFT_RIGHT[11];
    _zz_decode_RS2_3[21] = memory_SHIFT_RIGHT[10];
    _zz_decode_RS2_3[22] = memory_SHIFT_RIGHT[9];
    _zz_decode_RS2_3[23] = memory_SHIFT_RIGHT[8];
    _zz_decode_RS2_3[24] = memory_SHIFT_RIGHT[7];
    _zz_decode_RS2_3[25] = memory_SHIFT_RIGHT[6];
    _zz_decode_RS2_3[26] = memory_SHIFT_RIGHT[5];
    _zz_decode_RS2_3[27] = memory_SHIFT_RIGHT[4];
    _zz_decode_RS2_3[28] = memory_SHIFT_RIGHT[3];
    _zz_decode_RS2_3[29] = memory_SHIFT_RIGHT[2];
    _zz_decode_RS2_3[30] = memory_SHIFT_RIGHT[1];
    _zz_decode_RS2_3[31] = memory_SHIFT_RIGHT[0];
  end

  always @(*) begin
    HazardSimplePlugin_src0Hazard = 1'b0;
    if(when_HazardSimplePlugin_l57) begin
      if(when_HazardSimplePlugin_l58) begin
        if(when_HazardSimplePlugin_l48) begin
          HazardSimplePlugin_src0Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l57_1) begin
      if(when_HazardSimplePlugin_l58_1) begin
        if(when_HazardSimplePlugin_l48_1) begin
          HazardSimplePlugin_src0Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l57_2) begin
      if(when_HazardSimplePlugin_l58_2) begin
        if(when_HazardSimplePlugin_l48_2) begin
          HazardSimplePlugin_src0Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l105) begin
      HazardSimplePlugin_src0Hazard = 1'b0;
    end
  end

  always @(*) begin
    HazardSimplePlugin_src1Hazard = 1'b0;
    if(when_HazardSimplePlugin_l57) begin
      if(when_HazardSimplePlugin_l58) begin
        if(when_HazardSimplePlugin_l51) begin
          HazardSimplePlugin_src1Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l57_1) begin
      if(when_HazardSimplePlugin_l58_1) begin
        if(when_HazardSimplePlugin_l51_1) begin
          HazardSimplePlugin_src1Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l57_2) begin
      if(when_HazardSimplePlugin_l58_2) begin
        if(when_HazardSimplePlugin_l51_2) begin
          HazardSimplePlugin_src1Hazard = 1'b1;
        end
      end
    end
    if(when_HazardSimplePlugin_l108) begin
      HazardSimplePlugin_src1Hazard = 1'b0;
    end
  end

  assign HazardSimplePlugin_writeBackWrites_valid = (_zz_lastStageRegFileWrite_valid && writeBack_arbitration_isFiring);
  assign HazardSimplePlugin_writeBackWrites_payload_address = _zz_lastStageRegFileWrite_payload_address[11 : 7];
  assign HazardSimplePlugin_writeBackWrites_payload_data = _zz_decode_RS2;
  assign HazardSimplePlugin_addr0Match = (HazardSimplePlugin_writeBackBuffer_payload_address == decode_INSTRUCTION[19 : 15]);
  assign HazardSimplePlugin_addr1Match = (HazardSimplePlugin_writeBackBuffer_payload_address == decode_INSTRUCTION[24 : 20]);
  assign when_HazardSimplePlugin_l47 = 1'b1;
  assign when_HazardSimplePlugin_l48 = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign when_HazardSimplePlugin_l51 = (writeBack_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign when_HazardSimplePlugin_l45 = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l57 = (writeBack_arbitration_isValid && writeBack_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l58 = (1'b0 || (! when_HazardSimplePlugin_l47));
  assign when_HazardSimplePlugin_l48_1 = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign when_HazardSimplePlugin_l51_1 = (memory_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign when_HazardSimplePlugin_l45_1 = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l57_1 = (memory_arbitration_isValid && memory_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l58_1 = (1'b0 || (! memory_BYPASSABLE_MEMORY_STAGE));
  assign when_HazardSimplePlugin_l48_2 = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[19 : 15]);
  assign when_HazardSimplePlugin_l51_2 = (execute_INSTRUCTION[11 : 7] == decode_INSTRUCTION[24 : 20]);
  assign when_HazardSimplePlugin_l45_2 = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l57_2 = (execute_arbitration_isValid && execute_REGFILE_WRITE_VALID);
  assign when_HazardSimplePlugin_l58_2 = (1'b0 || (! execute_BYPASSABLE_EXECUTE_STAGE));
  assign when_HazardSimplePlugin_l105 = (! decode_RS1_USE);
  assign when_HazardSimplePlugin_l108 = (! decode_RS2_USE);
  assign when_HazardSimplePlugin_l113 = (decode_arbitration_isValid && (HazardSimplePlugin_src0Hazard || HazardSimplePlugin_src1Hazard));
  assign execute_BranchPlugin_eq = (execute_SRC1 == execute_SRC2);
  assign switch_Misc_l202_2 = execute_INSTRUCTION[14 : 12];
  always @(*) begin
    casez(switch_Misc_l202_2)
      3'b000 : begin
        _zz_execute_BRANCH_DO = execute_BranchPlugin_eq;
      end
      3'b001 : begin
        _zz_execute_BRANCH_DO = (! execute_BranchPlugin_eq);
      end
      3'b1?1 : begin
        _zz_execute_BRANCH_DO = (! execute_SRC_LESS);
      end
      default : begin
        _zz_execute_BRANCH_DO = execute_SRC_LESS;
      end
    endcase
  end

  always @(*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_binary_sequential_INC : begin
        _zz_execute_BRANCH_DO_1 = 1'b0;
      end
      `BranchCtrlEnum_binary_sequential_JAL : begin
        _zz_execute_BRANCH_DO_1 = 1'b1;
      end
      `BranchCtrlEnum_binary_sequential_JALR : begin
        _zz_execute_BRANCH_DO_1 = 1'b1;
      end
      default : begin
        _zz_execute_BRANCH_DO_1 = _zz_execute_BRANCH_DO;
      end
    endcase
  end

  assign execute_BranchPlugin_branch_src1 = ((execute_BRANCH_CTRL == `BranchCtrlEnum_binary_sequential_JALR) ? execute_RS1 : execute_PC);
  assign _zz_execute_BranchPlugin_branch_src2 = _zz__zz_execute_BranchPlugin_branch_src2[19];
  always @(*) begin
    _zz_execute_BranchPlugin_branch_src2_1[10] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[9] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[8] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[7] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[6] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[5] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[4] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[3] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[2] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[1] = _zz_execute_BranchPlugin_branch_src2;
    _zz_execute_BranchPlugin_branch_src2_1[0] = _zz_execute_BranchPlugin_branch_src2;
  end

  assign _zz_execute_BranchPlugin_branch_src2_2 = execute_INSTRUCTION[31];
  always @(*) begin
    _zz_execute_BranchPlugin_branch_src2_3[19] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[18] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[17] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[16] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[15] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[14] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[13] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[12] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[11] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[10] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[9] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[8] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[7] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[6] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[5] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[4] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[3] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[2] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[1] = _zz_execute_BranchPlugin_branch_src2_2;
    _zz_execute_BranchPlugin_branch_src2_3[0] = _zz_execute_BranchPlugin_branch_src2_2;
  end

  assign _zz_execute_BranchPlugin_branch_src2_4 = _zz__zz_execute_BranchPlugin_branch_src2_4[11];
  always @(*) begin
    _zz_execute_BranchPlugin_branch_src2_5[18] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[17] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[16] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[15] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[14] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[13] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[12] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[11] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[10] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[9] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[8] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[7] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[6] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[5] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[4] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[3] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[2] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[1] = _zz_execute_BranchPlugin_branch_src2_4;
    _zz_execute_BranchPlugin_branch_src2_5[0] = _zz_execute_BranchPlugin_branch_src2_4;
  end

  always @(*) begin
    case(execute_BRANCH_CTRL)
      `BranchCtrlEnum_binary_sequential_JAL : begin
        _zz_execute_BranchPlugin_branch_src2_6 = {{_zz_execute_BranchPlugin_branch_src2_1,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[19 : 12]},execute_INSTRUCTION[20]},execute_INSTRUCTION[30 : 21]}},1'b0};
      end
      `BranchCtrlEnum_binary_sequential_JALR : begin
        _zz_execute_BranchPlugin_branch_src2_6 = {_zz_execute_BranchPlugin_branch_src2_3,execute_INSTRUCTION[31 : 20]};
      end
      default : begin
        _zz_execute_BranchPlugin_branch_src2_6 = {{_zz_execute_BranchPlugin_branch_src2_5,{{{execute_INSTRUCTION[31],execute_INSTRUCTION[7]},execute_INSTRUCTION[30 : 25]},execute_INSTRUCTION[11 : 8]}},1'b0};
      end
    endcase
  end

  assign execute_BranchPlugin_branch_src2 = _zz_execute_BranchPlugin_branch_src2_6;
  assign execute_BranchPlugin_branchAdder = (execute_BranchPlugin_branch_src1 + execute_BranchPlugin_branch_src2);
  assign BranchPlugin_jumpInterface_valid = ((memory_arbitration_isValid && memory_BRANCH_DO) && (! 1'b0));
  assign BranchPlugin_jumpInterface_payload = memory_BRANCH_CALC;
  assign execute_CombaPlugin_a = execute_SRC1;
  assign execute_CombaPlugin_b = execute_SRC2;
  assign execute_CombaPlugin_aLow = execute_CombaPlugin_a[15 : 0];
  assign execute_CombaPlugin_bLow = execute_CombaPlugin_b[15 : 0];
  assign execute_CombaPlugin_aHigh = execute_CombaPlugin_a[31 : 16];
  assign execute_CombaPlugin_bHigh = execute_CombaPlugin_b[31 : 16];
  assign memory_CombaPlugin_ll = memory_MUL_LL;
  assign memory_CombaPlugin_lh = {1'd0, memory_MUL_LH};
  assign memory_CombaPlugin_hl = memory_MUL_HL;
  assign memory_CombaPlugin_hh = memory_MUL_HH;
  assign memory_CombaPlugin_hllh = (memory_CombaPlugin_lh + _zz_memory_CombaPlugin_hllh);
  always @(*) begin
    writeBack_CombaPlugin_invalue = 64'h0;
    if(when_CombaPlugin_l197) begin
      if(writeBack_IS_OP_MUL) begin
        writeBack_CombaPlugin_invalue = writeBack_MUL[63 : 0];
      end
      if(writeBack_IS_OP_ADD) begin
        writeBack_CombaPlugin_invalue = {writeBack_SRC2[31 : 0],writeBack_SRC1[31 : 0]};
      end
      if(writeBack_IS_OP_SUB) begin
        writeBack_CombaPlugin_invalue = ({(~ writeBack_SRC2[31 : 0]),(~ writeBack_SRC1[31 : 0])} + 64'h0000000000000001);
      end
    end
  end

  assign writeBack_CombaPlugin_sum = (writeBack_CombaPlugin_acc + _zz_writeBack_CombaPlugin_sum);
  assign when_CombaPlugin_l197 = (writeBack_IS_COMBA && writeBack_arbitration_isFiring);
  assign switch_CombaPlugin_l215 = writeBack_INSTRUCTION[13 : 12];
  always @(*) begin
    case(switch_CombaPlugin_l215)
      2'b01 : begin
        writeBack_CombaPlugin_aSigned = 1'b1;
      end
      2'b10 : begin
        writeBack_CombaPlugin_aSigned = 1'b1;
      end
      default : begin
        writeBack_CombaPlugin_aSigned = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(switch_CombaPlugin_l215)
      2'b01 : begin
        writeBack_CombaPlugin_bSigned = 1'b1;
      end
      2'b10 : begin
        writeBack_CombaPlugin_bSigned = 1'b0;
      end
      default : begin
        writeBack_CombaPlugin_bSigned = 1'b0;
      end
    endcase
  end

  assign writeBack_CombaPlugin_a = ((writeBack_CombaPlugin_aSigned && writeBack_SRC1[31]) ? writeBack_SRC2 : 32'h0);
  assign writeBack_CombaPlugin_b = ((writeBack_CombaPlugin_bSigned && writeBack_SRC2[31]) ? writeBack_SRC1 : 32'h0);
  assign when_CombaPlugin_l233 = (writeBack_arbitration_isValid && writeBack_IS_MUL);
  assign switch_CombaPlugin_l234 = writeBack_INSTRUCTION[13 : 12];
  assign when_DebugPlugin_l225 = (DebugPlugin_haltIt && (! DebugPlugin_isPipBusy));
  assign DebugPlugin_allowEBreak = (DebugPlugin_debugUsed && (! DebugPlugin_disableEbreak));
  always @(*) begin
    debug_bus_cmd_ready = 1'b1;
    if(debug_bus_cmd_valid) begin
      case(switch_DebugPlugin_l256)
        6'h01 : begin
          if(debug_bus_cmd_payload_wr) begin
            debug_bus_cmd_ready = IBusSimplePlugin_injectionPort_ready;
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(*) begin
    debug_bus_rsp_data = DebugPlugin_busReadDataReg;
    if(when_DebugPlugin_l244) begin
      debug_bus_rsp_data[0] = DebugPlugin_resetIt;
      debug_bus_rsp_data[1] = DebugPlugin_haltIt;
      debug_bus_rsp_data[2] = DebugPlugin_isPipBusy;
      debug_bus_rsp_data[3] = DebugPlugin_haltedByBreak;
      debug_bus_rsp_data[4] = DebugPlugin_stepIt;
    end
  end

  assign when_DebugPlugin_l244 = (! _zz_when_DebugPlugin_l244);
  always @(*) begin
    IBusSimplePlugin_injectionPort_valid = 1'b0;
    if(debug_bus_cmd_valid) begin
      case(switch_DebugPlugin_l256)
        6'h01 : begin
          if(debug_bus_cmd_payload_wr) begin
            IBusSimplePlugin_injectionPort_valid = 1'b1;
          end
        end
        default : begin
        end
      endcase
    end
  end

  assign IBusSimplePlugin_injectionPort_payload = debug_bus_cmd_payload_data;
  assign switch_DebugPlugin_l256 = debug_bus_cmd_payload_address[7 : 2];
  assign when_DebugPlugin_l260 = debug_bus_cmd_payload_data[16];
  assign when_DebugPlugin_l260_1 = debug_bus_cmd_payload_data[24];
  assign when_DebugPlugin_l261 = debug_bus_cmd_payload_data[17];
  assign when_DebugPlugin_l261_1 = debug_bus_cmd_payload_data[25];
  assign when_DebugPlugin_l262 = debug_bus_cmd_payload_data[25];
  assign when_DebugPlugin_l263 = debug_bus_cmd_payload_data[25];
  assign when_DebugPlugin_l264 = debug_bus_cmd_payload_data[18];
  assign when_DebugPlugin_l264_1 = debug_bus_cmd_payload_data[26];
  assign when_DebugPlugin_l284 = (execute_arbitration_isValid && execute_DO_EBREAK);
  assign when_DebugPlugin_l287 = (({writeBack_arbitration_isValid,memory_arbitration_isValid} != 2'b00) == 1'b0);
  assign when_DebugPlugin_l300 = (DebugPlugin_stepIt && IBusSimplePlugin_incomingInstruction);
  assign debug_resetOut = DebugPlugin_resetIt_regNext;
  assign when_DebugPlugin_l316 = (DebugPlugin_haltIt || DebugPlugin_stepIt);
  assign when_Pipeline_l124 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_1 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_2 = ((! writeBack_arbitration_isStuck) && (! CsrPlugin_exceptionPortCtrl_exceptionValids_writeBack));
  assign when_Pipeline_l124_3 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_4 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_5 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_6 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_7 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_8 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_9 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_10 = (! execute_arbitration_isStuck);
  assign _zz_decode_SRC1_CTRL = _zz_decode_SRC1_CTRL_1;
  assign when_Pipeline_l124_11 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_12 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_13 = (! memory_arbitration_isStuck);
  assign _zz_decode_to_execute_ALU_CTRL_1 = decode_ALU_CTRL;
  assign _zz_decode_ALU_CTRL = _zz_decode_ALU_CTRL_1;
  assign when_Pipeline_l124_14 = (! execute_arbitration_isStuck);
  assign _zz_execute_ALU_CTRL = decode_to_execute_ALU_CTRL;
  assign _zz_decode_SRC2_CTRL = _zz_decode_SRC2_CTRL_1;
  assign when_Pipeline_l124_15 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_16 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_17 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_18 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_19 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_20 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_21 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_22 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_23 = (! execute_arbitration_isStuck);
  assign _zz_decode_to_execute_ENV_CTRL_1 = decode_ENV_CTRL;
  assign _zz_execute_to_memory_ENV_CTRL_1 = execute_ENV_CTRL;
  assign _zz_memory_to_writeBack_ENV_CTRL_1 = memory_ENV_CTRL;
  assign _zz_decode_ENV_CTRL = _zz_decode_ENV_CTRL_1;
  assign when_Pipeline_l124_24 = (! execute_arbitration_isStuck);
  assign _zz_execute_ENV_CTRL = decode_to_execute_ENV_CTRL;
  assign when_Pipeline_l124_25 = (! memory_arbitration_isStuck);
  assign _zz_memory_ENV_CTRL = execute_to_memory_ENV_CTRL;
  assign when_Pipeline_l124_26 = (! writeBack_arbitration_isStuck);
  assign _zz_writeBack_ENV_CTRL = memory_to_writeBack_ENV_CTRL;
  assign when_Pipeline_l124_27 = (! execute_arbitration_isStuck);
  assign _zz_decode_to_execute_ALU_BITWISE_CTRL_1 = decode_ALU_BITWISE_CTRL;
  assign _zz_decode_ALU_BITWISE_CTRL = _zz_decode_ALU_BITWISE_CTRL_1;
  assign when_Pipeline_l124_28 = (! execute_arbitration_isStuck);
  assign _zz_execute_ALU_BITWISE_CTRL = decode_to_execute_ALU_BITWISE_CTRL;
  assign _zz_decode_to_execute_SHIFT_CTRL_1 = decode_SHIFT_CTRL;
  assign _zz_execute_to_memory_SHIFT_CTRL_1 = execute_SHIFT_CTRL;
  assign _zz_decode_SHIFT_CTRL = _zz_decode_SHIFT_CTRL_1;
  assign when_Pipeline_l124_29 = (! execute_arbitration_isStuck);
  assign _zz_execute_SHIFT_CTRL = decode_to_execute_SHIFT_CTRL;
  assign when_Pipeline_l124_30 = (! memory_arbitration_isStuck);
  assign _zz_memory_SHIFT_CTRL = execute_to_memory_SHIFT_CTRL;
  assign _zz_decode_to_execute_BRANCH_CTRL_1 = decode_BRANCH_CTRL;
  assign _zz_decode_BRANCH_CTRL = _zz_decode_BRANCH_CTRL_1;
  assign when_Pipeline_l124_31 = (! execute_arbitration_isStuck);
  assign _zz_execute_BRANCH_CTRL = decode_to_execute_BRANCH_CTRL;
  assign when_Pipeline_l124_32 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_33 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_34 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_35 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_36 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_37 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_38 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_39 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_40 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_41 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_42 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_43 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_44 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_45 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_46 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_47 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_48 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_49 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_50 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_51 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_52 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_53 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_54 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_55 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_56 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_57 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_58 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_59 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l124_60 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_61 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_62 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_63 = (! writeBack_arbitration_isStuck);
  assign when_Pipeline_l124_64 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_65 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_66 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_67 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_68 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_69 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_70 = (! memory_arbitration_isStuck);
  assign when_Pipeline_l124_71 = (! writeBack_arbitration_isStuck);
  assign decode_arbitration_isFlushed = (({writeBack_arbitration_flushNext,{memory_arbitration_flushNext,execute_arbitration_flushNext}} != 3'b000) || ({writeBack_arbitration_flushIt,{memory_arbitration_flushIt,{execute_arbitration_flushIt,decode_arbitration_flushIt}}} != 4'b0000));
  assign execute_arbitration_isFlushed = (({writeBack_arbitration_flushNext,memory_arbitration_flushNext} != 2'b00) || ({writeBack_arbitration_flushIt,{memory_arbitration_flushIt,execute_arbitration_flushIt}} != 3'b000));
  assign memory_arbitration_isFlushed = ((writeBack_arbitration_flushNext != 1'b0) || ({writeBack_arbitration_flushIt,memory_arbitration_flushIt} != 2'b00));
  assign writeBack_arbitration_isFlushed = (1'b0 || (writeBack_arbitration_flushIt != 1'b0));
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
  assign when_Pipeline_l151 = ((! execute_arbitration_isStuck) || execute_arbitration_removeIt);
  assign when_Pipeline_l154 = ((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt));
  assign when_Pipeline_l151_1 = ((! memory_arbitration_isStuck) || memory_arbitration_removeIt);
  assign when_Pipeline_l154_1 = ((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt));
  assign when_Pipeline_l151_2 = ((! writeBack_arbitration_isStuck) || writeBack_arbitration_removeIt);
  assign when_Pipeline_l154_2 = ((! memory_arbitration_isStuck) && (! memory_arbitration_removeIt));
  always @(*) begin
    IBusSimplePlugin_injectionPort_ready = 1'b0;
    case(switch_Fetcher_l362)
      3'b100 : begin
        IBusSimplePlugin_injectionPort_ready = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign when_Fetcher_l378 = (! decode_arbitration_isStuck);
  assign when_Fetcher_l398 = (switch_Fetcher_l362 != 3'b000);
  assign when_CsrPlugin_l1264 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1264_1 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1264_2 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1264_3 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1264_4 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1264_5 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1264_6 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1264_7 = (! execute_arbitration_isStuck);
  assign when_CsrPlugin_l1264_8 = (! execute_arbitration_isStuck);
  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit = 32'h0;
    if(execute_CsrPlugin_csr_768) begin
      _zz_CsrPlugin_csrMapping_readDataInit[12 : 11] = CsrPlugin_mstatus_MPP;
      _zz_CsrPlugin_csrMapping_readDataInit[7 : 7] = CsrPlugin_mstatus_MPIE;
      _zz_CsrPlugin_csrMapping_readDataInit[3 : 3] = CsrPlugin_mstatus_MIE;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_1 = 32'h0;
    if(execute_CsrPlugin_csr_836) begin
      _zz_CsrPlugin_csrMapping_readDataInit_1[11 : 11] = CsrPlugin_mip_MEIP;
      _zz_CsrPlugin_csrMapping_readDataInit_1[7 : 7] = CsrPlugin_mip_MTIP;
      _zz_CsrPlugin_csrMapping_readDataInit_1[3 : 3] = CsrPlugin_mip_MSIP;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_2 = 32'h0;
    if(execute_CsrPlugin_csr_772) begin
      _zz_CsrPlugin_csrMapping_readDataInit_2[11 : 11] = CsrPlugin_mie_MEIE;
      _zz_CsrPlugin_csrMapping_readDataInit_2[7 : 7] = CsrPlugin_mie_MTIE;
      _zz_CsrPlugin_csrMapping_readDataInit_2[3 : 3] = CsrPlugin_mie_MSIE;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_3 = 32'h0;
    if(execute_CsrPlugin_csr_773) begin
      _zz_CsrPlugin_csrMapping_readDataInit_3[31 : 2] = CsrPlugin_mtvec_base;
      _zz_CsrPlugin_csrMapping_readDataInit_3[1 : 0] = CsrPlugin_mtvec_mode;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_4 = 32'h0;
    if(execute_CsrPlugin_csr_834) begin
      _zz_CsrPlugin_csrMapping_readDataInit_4[31 : 31] = CsrPlugin_mcause_interrupt;
      _zz_CsrPlugin_csrMapping_readDataInit_4[3 : 0] = CsrPlugin_mcause_exceptionCode;
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_5 = 32'h0;
    if(execute_CsrPlugin_csr_2816) begin
      _zz_CsrPlugin_csrMapping_readDataInit_5[31 : 0] = CsrPlugin_mcycle[31 : 0];
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_6 = 32'h0;
    if(execute_CsrPlugin_csr_2944) begin
      _zz_CsrPlugin_csrMapping_readDataInit_6[31 : 0] = CsrPlugin_mcycle[63 : 32];
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_7 = 32'h0;
    if(execute_CsrPlugin_csr_2818) begin
      _zz_CsrPlugin_csrMapping_readDataInit_7[31 : 0] = CsrPlugin_minstret[31 : 0];
    end
  end

  always @(*) begin
    _zz_CsrPlugin_csrMapping_readDataInit_8 = 32'h0;
    if(execute_CsrPlugin_csr_2946) begin
      _zz_CsrPlugin_csrMapping_readDataInit_8[31 : 0] = CsrPlugin_minstret[63 : 32];
    end
  end

  assign CsrPlugin_csrMapping_readDataInit = ((((_zz_CsrPlugin_csrMapping_readDataInit | _zz_CsrPlugin_csrMapping_readDataInit_1) | (_zz_CsrPlugin_csrMapping_readDataInit_2 | _zz_CsrPlugin_csrMapping_readDataInit_3)) | ((_zz_CsrPlugin_csrMapping_readDataInit_4 | _zz_CsrPlugin_csrMapping_readDataInit_5) | (_zz_CsrPlugin_csrMapping_readDataInit_6 | _zz_CsrPlugin_csrMapping_readDataInit_7))) | _zz_CsrPlugin_csrMapping_readDataInit_8);
  assign when_CsrPlugin_l1297 = (CsrPlugin_privilege < execute_CsrPlugin_csrAddress[9 : 8]);
  assign when_CsrPlugin_l1302 = ((! execute_arbitration_isValid) || (! execute_IS_CSR));
  always @(posedge mainClock or posedge resetCtrl_systemClockReset) begin
    if(resetCtrl_systemClockReset) begin
      IBusSimplePlugin_fetchPc_pcReg <= 32'h80000000;
      IBusSimplePlugin_fetchPc_correctionReg <= 1'b0;
      IBusSimplePlugin_fetchPc_booted <= 1'b0;
      IBusSimplePlugin_fetchPc_inc <= 1'b0;
      _zz_IBusSimplePlugin_iBusRsp_stages_0_output_ready_2 <= 1'b0;
      _zz_IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_valid <= 1'b0;
      _zz_IBusSimplePlugin_injector_decodeInput_valid <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      IBusSimplePlugin_injector_nextPcCalc_valids_5 <= 1'b0;
      IBusSimplePlugin_pending_value <= 3'b000;
      IBusSimplePlugin_rspJoin_rspBuffer_discardCounter <= 3'b000;
      CsrPlugin_mtvec_mode <= 2'b00;
      CsrPlugin_mtvec_base <= 30'h20000000;
      CsrPlugin_mstatus_MIE <= 1'b0;
      CsrPlugin_mstatus_MPIE <= 1'b0;
      CsrPlugin_mstatus_MPP <= 2'b11;
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
      _zz_2 <= 1'b1;
      HazardSimplePlugin_writeBackBuffer_valid <= 1'b0;
      writeBack_CombaPlugin_acc <= 72'h0;
      execute_arbitration_isValid <= 1'b0;
      memory_arbitration_isValid <= 1'b0;
      writeBack_arbitration_isValid <= 1'b0;
      switch_Fetcher_l362 <= 3'b000;
    end else begin
      if(IBusSimplePlugin_fetchPc_correction) begin
        IBusSimplePlugin_fetchPc_correctionReg <= 1'b1;
      end
      if(IBusSimplePlugin_fetchPc_output_fire) begin
        IBusSimplePlugin_fetchPc_correctionReg <= 1'b0;
      end
      IBusSimplePlugin_fetchPc_booted <= 1'b1;
      if(when_Fetcher_l131) begin
        IBusSimplePlugin_fetchPc_inc <= 1'b0;
      end
      if(IBusSimplePlugin_fetchPc_output_fire_1) begin
        IBusSimplePlugin_fetchPc_inc <= 1'b1;
      end
      if(when_Fetcher_l131_1) begin
        IBusSimplePlugin_fetchPc_inc <= 1'b0;
      end
      if(when_Fetcher_l158) begin
        IBusSimplePlugin_fetchPc_pcReg <= IBusSimplePlugin_fetchPc_pc;
      end
      if(IBusSimplePlugin_iBusRsp_flush) begin
        _zz_IBusSimplePlugin_iBusRsp_stages_0_output_ready_2 <= 1'b0;
      end
      if(_zz_IBusSimplePlugin_iBusRsp_stages_0_output_ready) begin
        _zz_IBusSimplePlugin_iBusRsp_stages_0_output_ready_2 <= (IBusSimplePlugin_iBusRsp_stages_0_output_valid && (! 1'b0));
      end
      if(IBusSimplePlugin_iBusRsp_flush) begin
        _zz_IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_valid <= 1'b0;
      end
      if(IBusSimplePlugin_iBusRsp_stages_1_output_ready) begin
        _zz_IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_valid <= (IBusSimplePlugin_iBusRsp_stages_1_output_valid && (! IBusSimplePlugin_iBusRsp_flush));
      end
      if(decode_arbitration_removeIt) begin
        _zz_IBusSimplePlugin_injector_decodeInput_valid <= 1'b0;
      end
      if(IBusSimplePlugin_iBusRsp_output_ready) begin
        _zz_IBusSimplePlugin_injector_decodeInput_valid <= (IBusSimplePlugin_iBusRsp_output_valid && (! IBusSimplePlugin_externalFlush));
      end
      if(IBusSimplePlugin_fetchPc_flushed) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      end
      if(when_Fetcher_l329) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_0 <= 1'b1;
      end
      if(IBusSimplePlugin_fetchPc_flushed) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if(when_Fetcher_l329_1) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= IBusSimplePlugin_injector_nextPcCalc_valids_0;
      end
      if(IBusSimplePlugin_fetchPc_flushed) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if(IBusSimplePlugin_fetchPc_flushed) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if(when_Fetcher_l329_2) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_2 <= IBusSimplePlugin_injector_nextPcCalc_valids_1;
      end
      if(IBusSimplePlugin_fetchPc_flushed) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if(IBusSimplePlugin_fetchPc_flushed) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      if(when_Fetcher_l329_3) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_3 <= IBusSimplePlugin_injector_nextPcCalc_valids_2;
      end
      if(IBusSimplePlugin_fetchPc_flushed) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      if(IBusSimplePlugin_fetchPc_flushed) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      end
      if(when_Fetcher_l329_4) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_4 <= IBusSimplePlugin_injector_nextPcCalc_valids_3;
      end
      if(IBusSimplePlugin_fetchPc_flushed) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      end
      if(IBusSimplePlugin_fetchPc_flushed) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_5 <= 1'b0;
      end
      if(when_Fetcher_l329_5) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_5 <= IBusSimplePlugin_injector_nextPcCalc_valids_4;
      end
      if(IBusSimplePlugin_fetchPc_flushed) begin
        IBusSimplePlugin_injector_nextPcCalc_valids_5 <= 1'b0;
      end
      IBusSimplePlugin_pending_value <= IBusSimplePlugin_pending_next;
      IBusSimplePlugin_rspJoin_rspBuffer_discardCounter <= (IBusSimplePlugin_rspJoin_rspBuffer_discardCounter - _zz_IBusSimplePlugin_rspJoin_rspBuffer_discardCounter);
      if(IBusSimplePlugin_iBusRsp_flush) begin
        IBusSimplePlugin_rspJoin_rspBuffer_discardCounter <= IBusSimplePlugin_pending_next;
      end
      `ifndef SYNTHESIS
        `ifdef FORMAL
          assert((! (((dBus_rsp_ready && memory_MEMORY_ENABLE) && memory_arbitration_isValid) && memory_arbitration_isStuck)));
        `else
          if(!(! (((dBus_rsp_ready && memory_MEMORY_ENABLE) && memory_arbitration_isValid) && memory_arbitration_isStuck))) begin
            $display("FAILURE DBusSimplePlugin doesn't allow memory stage stall when read happend");
            $finish;
          end
        `endif
      `endif
      if(when_CsrPlugin_l909) begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= 1'b0;
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= CsrPlugin_exceptionPortCtrl_exceptionValids_decode;
      end
      if(when_CsrPlugin_l909_1) begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= (CsrPlugin_exceptionPortCtrl_exceptionValids_decode && (! decode_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= CsrPlugin_exceptionPortCtrl_exceptionValids_execute;
      end
      if(when_CsrPlugin_l909_2) begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= (CsrPlugin_exceptionPortCtrl_exceptionValids_execute && (! execute_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= CsrPlugin_exceptionPortCtrl_exceptionValids_memory;
      end
      if(when_CsrPlugin_l909_3) begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= (CsrPlugin_exceptionPortCtrl_exceptionValids_memory && (! memory_arbitration_isStuck));
      end else begin
        CsrPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= 1'b0;
      end
      CsrPlugin_interrupt_valid <= 1'b0;
      if(when_CsrPlugin_l946) begin
        if(when_CsrPlugin_l952) begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(when_CsrPlugin_l952_1) begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
        if(when_CsrPlugin_l952_2) begin
          CsrPlugin_interrupt_valid <= 1'b1;
        end
      end
      if(CsrPlugin_pipelineLiberator_active) begin
        if(when_CsrPlugin_l980) begin
          CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b1;
        end
        if(when_CsrPlugin_l980_1) begin
          CsrPlugin_pipelineLiberator_pcValids_1 <= CsrPlugin_pipelineLiberator_pcValids_0;
        end
        if(when_CsrPlugin_l980_2) begin
          CsrPlugin_pipelineLiberator_pcValids_2 <= CsrPlugin_pipelineLiberator_pcValids_1;
        end
      end
      if(when_CsrPlugin_l985) begin
        CsrPlugin_pipelineLiberator_pcValids_0 <= 1'b0;
        CsrPlugin_pipelineLiberator_pcValids_1 <= 1'b0;
        CsrPlugin_pipelineLiberator_pcValids_2 <= 1'b0;
      end
      if(CsrPlugin_interruptJump) begin
        CsrPlugin_interrupt_valid <= 1'b0;
      end
      CsrPlugin_hadException <= CsrPlugin_exception;
      if(when_CsrPlugin_l1019) begin
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
      if(when_CsrPlugin_l1064) begin
        case(switch_CsrPlugin_l1068)
          2'b11 : begin
            CsrPlugin_mstatus_MPP <= 2'b00;
            CsrPlugin_mstatus_MIE <= CsrPlugin_mstatus_MPIE;
            CsrPlugin_mstatus_MPIE <= 1'b1;
          end
          default : begin
          end
        endcase
      end
      execute_CsrPlugin_wfiWake <= (({_zz_when_CsrPlugin_l952_2,{_zz_when_CsrPlugin_l952_1,_zz_when_CsrPlugin_l952}} != 3'b000) || CsrPlugin_thirdPartyWake);
      _zz_2 <= 1'b0;
      HazardSimplePlugin_writeBackBuffer_valid <= HazardSimplePlugin_writeBackWrites_valid;
      if(when_CombaPlugin_l197) begin
        if(writeBack_IS_OP_SHIFT) begin
          writeBack_CombaPlugin_acc <= {32'd0, _zz_writeBack_CombaPlugin_acc};
        end else begin
          writeBack_CombaPlugin_acc <= writeBack_CombaPlugin_sum;
        end
      end
      if(when_Pipeline_l151) begin
        execute_arbitration_isValid <= 1'b0;
      end
      if(when_Pipeline_l154) begin
        execute_arbitration_isValid <= decode_arbitration_isValid;
      end
      if(when_Pipeline_l151_1) begin
        memory_arbitration_isValid <= 1'b0;
      end
      if(when_Pipeline_l154_1) begin
        memory_arbitration_isValid <= execute_arbitration_isValid;
      end
      if(when_Pipeline_l151_2) begin
        writeBack_arbitration_isValid <= 1'b0;
      end
      if(when_Pipeline_l154_2) begin
        writeBack_arbitration_isValid <= memory_arbitration_isValid;
      end
      case(switch_Fetcher_l362)
        3'b000 : begin
          if(IBusSimplePlugin_injectionPort_valid) begin
            switch_Fetcher_l362 <= 3'b001;
          end
        end
        3'b001 : begin
          switch_Fetcher_l362 <= 3'b010;
        end
        3'b010 : begin
          switch_Fetcher_l362 <= 3'b011;
        end
        3'b011 : begin
          if(when_Fetcher_l378) begin
            switch_Fetcher_l362 <= 3'b100;
          end
        end
        3'b100 : begin
          switch_Fetcher_l362 <= 3'b000;
        end
        default : begin
        end
      endcase
      if(execute_CsrPlugin_csr_768) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_mstatus_MPP <= CsrPlugin_csrMapping_writeDataSignal[12 : 11];
          CsrPlugin_mstatus_MPIE <= CsrPlugin_csrMapping_writeDataSignal[7];
          CsrPlugin_mstatus_MIE <= CsrPlugin_csrMapping_writeDataSignal[3];
        end
      end
      if(execute_CsrPlugin_csr_772) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_mie_MEIE <= CsrPlugin_csrMapping_writeDataSignal[11];
          CsrPlugin_mie_MTIE <= CsrPlugin_csrMapping_writeDataSignal[7];
          CsrPlugin_mie_MSIE <= CsrPlugin_csrMapping_writeDataSignal[3];
        end
      end
      if(execute_CsrPlugin_csr_773) begin
        if(execute_CsrPlugin_writeEnable) begin
          CsrPlugin_mtvec_base <= CsrPlugin_csrMapping_writeDataSignal[31 : 2];
          CsrPlugin_mtvec_mode <= CsrPlugin_csrMapping_writeDataSignal[1 : 0];
        end
      end
    end
  end

  always @(posedge mainClock) begin
    if(IBusSimplePlugin_iBusRsp_stages_1_output_ready) begin
      _zz_IBusSimplePlugin_iBusRsp_stages_1_output_m2sPipe_payload <= IBusSimplePlugin_iBusRsp_stages_1_output_payload;
    end
    if(IBusSimplePlugin_iBusRsp_output_ready) begin
      _zz_IBusSimplePlugin_injector_decodeInput_payload_pc <= IBusSimplePlugin_iBusRsp_output_payload_pc;
      _zz_IBusSimplePlugin_injector_decodeInput_payload_rsp_error <= IBusSimplePlugin_iBusRsp_output_payload_rsp_error;
      _zz_IBusSimplePlugin_injector_decodeInput_payload_rsp_inst <= IBusSimplePlugin_iBusRsp_output_payload_rsp_inst;
      _zz_IBusSimplePlugin_injector_decodeInput_payload_isRvc <= IBusSimplePlugin_iBusRsp_output_payload_isRvc;
    end
    if(IBusSimplePlugin_injector_decodeInput_ready) begin
      IBusSimplePlugin_injector_formal_rawInDecode <= IBusSimplePlugin_iBusRsp_output_payload_rsp_inst;
    end
    CsrPlugin_mip_MEIP <= externalInterrupt;
    CsrPlugin_mip_MTIP <= timerInterrupt;
    CsrPlugin_mip_MSIP <= softwareInterrupt;
    CsrPlugin_mcycle <= (CsrPlugin_mcycle + 64'h0000000000000001);
    if(writeBack_arbitration_isFiring) begin
      CsrPlugin_minstret <= (CsrPlugin_minstret + 64'h0000000000000001);
    end
    if(_zz_when) begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= (_zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1 ? IBusSimplePlugin_decodeExceptionPort_payload_code : decodeExceptionPort_payload_code);
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= (_zz_CsrPlugin_exceptionPortCtrl_exceptionContext_code_1 ? IBusSimplePlugin_decodeExceptionPort_payload_badAddr : decodeExceptionPort_payload_badAddr);
    end
    if(DBusSimplePlugin_memoryExceptionPort_valid) begin
      CsrPlugin_exceptionPortCtrl_exceptionContext_code <= DBusSimplePlugin_memoryExceptionPort_payload_code;
      CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr <= DBusSimplePlugin_memoryExceptionPort_payload_badAddr;
    end
    if(when_CsrPlugin_l946) begin
      if(when_CsrPlugin_l952) begin
        CsrPlugin_interrupt_code <= 4'b0111;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(when_CsrPlugin_l952_1) begin
        CsrPlugin_interrupt_code <= 4'b0011;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
      if(when_CsrPlugin_l952_2) begin
        CsrPlugin_interrupt_code <= 4'b1011;
        CsrPlugin_interrupt_targetPrivilege <= 2'b11;
      end
    end
    if(when_CsrPlugin_l1019) begin
      case(CsrPlugin_targetPrivilege)
        2'b11 : begin
          CsrPlugin_mcause_interrupt <= (! CsrPlugin_hadException);
          CsrPlugin_mcause_exceptionCode <= CsrPlugin_trapCause;
          CsrPlugin_mepc <= writeBack_PC;
          if(CsrPlugin_hadException) begin
            CsrPlugin_mtval <= CsrPlugin_exceptionPortCtrl_exceptionContext_badAddr;
          end
        end
        default : begin
        end
      endcase
    end
    HazardSimplePlugin_writeBackBuffer_payload_address <= HazardSimplePlugin_writeBackWrites_payload_address;
    HazardSimplePlugin_writeBackBuffer_payload_data <= HazardSimplePlugin_writeBackWrites_payload_data;
    if(when_Pipeline_l124) begin
      decode_to_execute_PC <= _zz_decode_SRC2;
    end
    if(when_Pipeline_l124_1) begin
      execute_to_memory_PC <= execute_PC;
    end
    if(when_Pipeline_l124_2) begin
      memory_to_writeBack_PC <= memory_PC;
    end
    if(when_Pipeline_l124_3) begin
      decode_to_execute_INSTRUCTION <= decode_INSTRUCTION;
    end
    if(when_Pipeline_l124_4) begin
      execute_to_memory_INSTRUCTION <= execute_INSTRUCTION;
    end
    if(when_Pipeline_l124_5) begin
      memory_to_writeBack_INSTRUCTION <= memory_INSTRUCTION;
    end
    if(when_Pipeline_l124_6) begin
      decode_to_execute_FORMAL_PC_NEXT <= decode_FORMAL_PC_NEXT;
    end
    if(when_Pipeline_l124_7) begin
      execute_to_memory_FORMAL_PC_NEXT <= execute_FORMAL_PC_NEXT;
    end
    if(when_Pipeline_l124_8) begin
      memory_to_writeBack_FORMAL_PC_NEXT <= _zz_memory_to_writeBack_FORMAL_PC_NEXT;
    end
    if(when_Pipeline_l124_9) begin
      decode_to_execute_CSR_WRITE_OPCODE <= decode_CSR_WRITE_OPCODE;
    end
    if(when_Pipeline_l124_10) begin
      decode_to_execute_CSR_READ_OPCODE <= decode_CSR_READ_OPCODE;
    end
    if(when_Pipeline_l124_11) begin
      decode_to_execute_SRC_USE_SUB_LESS <= decode_SRC_USE_SUB_LESS;
    end
    if(when_Pipeline_l124_12) begin
      decode_to_execute_MEMORY_ENABLE <= decode_MEMORY_ENABLE;
    end
    if(when_Pipeline_l124_13) begin
      execute_to_memory_MEMORY_ENABLE <= execute_MEMORY_ENABLE;
    end
    if(when_Pipeline_l124_14) begin
      decode_to_execute_ALU_CTRL <= _zz_decode_to_execute_ALU_CTRL;
    end
    if(when_Pipeline_l124_15) begin
      decode_to_execute_REGFILE_WRITE_VALID <= decode_REGFILE_WRITE_VALID;
    end
    if(when_Pipeline_l124_16) begin
      execute_to_memory_REGFILE_WRITE_VALID <= execute_REGFILE_WRITE_VALID;
    end
    if(when_Pipeline_l124_17) begin
      memory_to_writeBack_REGFILE_WRITE_VALID <= memory_REGFILE_WRITE_VALID;
    end
    if(when_Pipeline_l124_18) begin
      decode_to_execute_BYPASSABLE_EXECUTE_STAGE <= decode_BYPASSABLE_EXECUTE_STAGE;
    end
    if(when_Pipeline_l124_19) begin
      decode_to_execute_BYPASSABLE_MEMORY_STAGE <= decode_BYPASSABLE_MEMORY_STAGE;
    end
    if(when_Pipeline_l124_20) begin
      execute_to_memory_BYPASSABLE_MEMORY_STAGE <= execute_BYPASSABLE_MEMORY_STAGE;
    end
    if(when_Pipeline_l124_21) begin
      decode_to_execute_MEMORY_STORE <= decode_MEMORY_STORE;
    end
    if(when_Pipeline_l124_22) begin
      execute_to_memory_MEMORY_STORE <= execute_MEMORY_STORE;
    end
    if(when_Pipeline_l124_23) begin
      decode_to_execute_IS_CSR <= decode_IS_CSR;
    end
    if(when_Pipeline_l124_24) begin
      decode_to_execute_ENV_CTRL <= _zz_decode_to_execute_ENV_CTRL;
    end
    if(when_Pipeline_l124_25) begin
      execute_to_memory_ENV_CTRL <= _zz_execute_to_memory_ENV_CTRL;
    end
    if(when_Pipeline_l124_26) begin
      memory_to_writeBack_ENV_CTRL <= _zz_memory_to_writeBack_ENV_CTRL;
    end
    if(when_Pipeline_l124_27) begin
      decode_to_execute_SRC_LESS_UNSIGNED <= decode_SRC_LESS_UNSIGNED;
    end
    if(when_Pipeline_l124_28) begin
      decode_to_execute_ALU_BITWISE_CTRL <= _zz_decode_to_execute_ALU_BITWISE_CTRL;
    end
    if(when_Pipeline_l124_29) begin
      decode_to_execute_SHIFT_CTRL <= _zz_decode_to_execute_SHIFT_CTRL;
    end
    if(when_Pipeline_l124_30) begin
      execute_to_memory_SHIFT_CTRL <= _zz_execute_to_memory_SHIFT_CTRL;
    end
    if(when_Pipeline_l124_31) begin
      decode_to_execute_BRANCH_CTRL <= _zz_decode_to_execute_BRANCH_CTRL;
    end
    if(when_Pipeline_l124_32) begin
      decode_to_execute_IS_MUL <= decode_IS_MUL;
    end
    if(when_Pipeline_l124_33) begin
      execute_to_memory_IS_MUL <= execute_IS_MUL;
    end
    if(when_Pipeline_l124_34) begin
      memory_to_writeBack_IS_MUL <= memory_IS_MUL;
    end
    if(when_Pipeline_l124_35) begin
      decode_to_execute_IS_OP_SHIFT <= decode_IS_OP_SHIFT;
    end
    if(when_Pipeline_l124_36) begin
      execute_to_memory_IS_OP_SHIFT <= execute_IS_OP_SHIFT;
    end
    if(when_Pipeline_l124_37) begin
      memory_to_writeBack_IS_OP_SHIFT <= memory_IS_OP_SHIFT;
    end
    if(when_Pipeline_l124_38) begin
      decode_to_execute_IS_COMBA <= decode_IS_COMBA;
    end
    if(when_Pipeline_l124_39) begin
      execute_to_memory_IS_COMBA <= execute_IS_COMBA;
    end
    if(when_Pipeline_l124_40) begin
      memory_to_writeBack_IS_COMBA <= memory_IS_COMBA;
    end
    if(when_Pipeline_l124_41) begin
      decode_to_execute_IS_OP_MUL <= decode_IS_OP_MUL;
    end
    if(when_Pipeline_l124_42) begin
      execute_to_memory_IS_OP_MUL <= execute_IS_OP_MUL;
    end
    if(when_Pipeline_l124_43) begin
      memory_to_writeBack_IS_OP_MUL <= memory_IS_OP_MUL;
    end
    if(when_Pipeline_l124_44) begin
      decode_to_execute_IS_OP_ADD <= decode_IS_OP_ADD;
    end
    if(when_Pipeline_l124_45) begin
      execute_to_memory_IS_OP_ADD <= execute_IS_OP_ADD;
    end
    if(when_Pipeline_l124_46) begin
      memory_to_writeBack_IS_OP_ADD <= memory_IS_OP_ADD;
    end
    if(when_Pipeline_l124_47) begin
      decode_to_execute_IS_OP_SUB <= decode_IS_OP_SUB;
    end
    if(when_Pipeline_l124_48) begin
      execute_to_memory_IS_OP_SUB <= execute_IS_OP_SUB;
    end
    if(when_Pipeline_l124_49) begin
      memory_to_writeBack_IS_OP_SUB <= memory_IS_OP_SUB;
    end
    if(when_Pipeline_l124_50) begin
      decode_to_execute_RS1 <= _zz_decode_SRC1;
    end
    if(when_Pipeline_l124_51) begin
      decode_to_execute_RS2 <= _zz_decode_SRC2_1;
    end
    if(when_Pipeline_l124_52) begin
      decode_to_execute_SRC2_FORCE_ZERO <= decode_SRC2_FORCE_ZERO;
    end
    if(when_Pipeline_l124_53) begin
      decode_to_execute_SRC1 <= decode_SRC1;
    end
    if(when_Pipeline_l124_54) begin
      execute_to_memory_SRC1 <= execute_SRC1;
    end
    if(when_Pipeline_l124_55) begin
      memory_to_writeBack_SRC1 <= memory_SRC1;
    end
    if(when_Pipeline_l124_56) begin
      decode_to_execute_SRC2 <= decode_SRC2;
    end
    if(when_Pipeline_l124_57) begin
      execute_to_memory_SRC2 <= execute_SRC2;
    end
    if(when_Pipeline_l124_58) begin
      memory_to_writeBack_SRC2 <= memory_SRC2;
    end
    if(when_Pipeline_l124_59) begin
      decode_to_execute_DO_EBREAK <= decode_DO_EBREAK;
    end
    if(when_Pipeline_l124_60) begin
      execute_to_memory_ALIGNEMENT_FAULT <= execute_ALIGNEMENT_FAULT;
    end
    if(when_Pipeline_l124_61) begin
      execute_to_memory_MEMORY_ADDRESS_LOW <= execute_MEMORY_ADDRESS_LOW;
    end
    if(when_Pipeline_l124_62) begin
      execute_to_memory_REGFILE_WRITE_DATA <= _zz_decode_RS2_1;
    end
    if(when_Pipeline_l124_63) begin
      memory_to_writeBack_REGFILE_WRITE_DATA <= _zz_decode_RS2_2;
    end
    if(when_Pipeline_l124_64) begin
      execute_to_memory_SHIFT_RIGHT <= execute_SHIFT_RIGHT;
    end
    if(when_Pipeline_l124_65) begin
      execute_to_memory_BRANCH_DO <= execute_BRANCH_DO;
    end
    if(when_Pipeline_l124_66) begin
      execute_to_memory_BRANCH_CALC <= execute_BRANCH_CALC;
    end
    if(when_Pipeline_l124_67) begin
      execute_to_memory_MUL_LL <= execute_MUL_LL;
    end
    if(when_Pipeline_l124_68) begin
      execute_to_memory_MUL_LH <= execute_MUL_LH;
    end
    if(when_Pipeline_l124_69) begin
      execute_to_memory_MUL_HL <= execute_MUL_HL;
    end
    if(when_Pipeline_l124_70) begin
      execute_to_memory_MUL_HH <= execute_MUL_HH;
    end
    if(when_Pipeline_l124_71) begin
      memory_to_writeBack_MUL <= memory_MUL;
    end
    if(when_Fetcher_l398) begin
      _zz_IBusSimplePlugin_injector_decodeInput_payload_rsp_inst <= IBusSimplePlugin_injectionPort_payload;
    end
    if(when_CsrPlugin_l1264) begin
      execute_CsrPlugin_csr_768 <= (decode_INSTRUCTION[31 : 20] == 12'h300);
    end
    if(when_CsrPlugin_l1264_1) begin
      execute_CsrPlugin_csr_836 <= (decode_INSTRUCTION[31 : 20] == 12'h344);
    end
    if(when_CsrPlugin_l1264_2) begin
      execute_CsrPlugin_csr_772 <= (decode_INSTRUCTION[31 : 20] == 12'h304);
    end
    if(when_CsrPlugin_l1264_3) begin
      execute_CsrPlugin_csr_773 <= (decode_INSTRUCTION[31 : 20] == 12'h305);
    end
    if(when_CsrPlugin_l1264_4) begin
      execute_CsrPlugin_csr_834 <= (decode_INSTRUCTION[31 : 20] == 12'h342);
    end
    if(when_CsrPlugin_l1264_5) begin
      execute_CsrPlugin_csr_2816 <= (decode_INSTRUCTION[31 : 20] == 12'hb00);
    end
    if(when_CsrPlugin_l1264_6) begin
      execute_CsrPlugin_csr_2944 <= (decode_INSTRUCTION[31 : 20] == 12'hb80);
    end
    if(when_CsrPlugin_l1264_7) begin
      execute_CsrPlugin_csr_2818 <= (decode_INSTRUCTION[31 : 20] == 12'hb02);
    end
    if(when_CsrPlugin_l1264_8) begin
      execute_CsrPlugin_csr_2946 <= (decode_INSTRUCTION[31 : 20] == 12'hb82);
    end
    if(execute_CsrPlugin_csr_836) begin
      if(execute_CsrPlugin_writeEnable) begin
        CsrPlugin_mip_MSIP <= CsrPlugin_csrMapping_writeDataSignal[3];
      end
    end
  end

  always @(posedge mainClock) begin
    DebugPlugin_firstCycle <= 1'b0;
    if(debug_bus_cmd_ready) begin
      DebugPlugin_firstCycle <= 1'b1;
    end
    DebugPlugin_secondCycle <= DebugPlugin_firstCycle;
    DebugPlugin_isPipBusy <= (({writeBack_arbitration_isValid,{memory_arbitration_isValid,{execute_arbitration_isValid,decode_arbitration_isValid}}} != 4'b0000) || IBusSimplePlugin_incomingInstruction);
    if(writeBack_arbitration_isValid) begin
      DebugPlugin_busReadDataReg <= _zz_decode_RS2;
    end
    _zz_when_DebugPlugin_l244 <= debug_bus_cmd_payload_address[2];
    if(debug_bus_cmd_valid) begin
      case(switch_DebugPlugin_l256)
        6'h10 : begin
          if(debug_bus_cmd_payload_wr) begin
            DebugPlugin_hardwareBreakpoints_0_pc <= debug_bus_cmd_payload_data[31 : 1];
          end
        end
        6'h11 : begin
          if(debug_bus_cmd_payload_wr) begin
            DebugPlugin_hardwareBreakpoints_1_pc <= debug_bus_cmd_payload_data[31 : 1];
          end
        end
        6'h12 : begin
          if(debug_bus_cmd_payload_wr) begin
            DebugPlugin_hardwareBreakpoints_2_pc <= debug_bus_cmd_payload_data[31 : 1];
          end
        end
        default : begin
        end
      endcase
    end
    if(when_DebugPlugin_l284) begin
      DebugPlugin_busReadDataReg <= execute_PC;
    end
    DebugPlugin_resetIt_regNext <= DebugPlugin_resetIt;
  end

  always @(posedge mainClock or posedge resetCtrl_mainClockReset) begin
    if(resetCtrl_mainClockReset) begin
      DebugPlugin_resetIt <= 1'b0;
      DebugPlugin_haltIt <= 1'b0;
      DebugPlugin_stepIt <= 1'b0;
      DebugPlugin_godmode <= 1'b0;
      DebugPlugin_haltedByBreak <= 1'b0;
      DebugPlugin_debugUsed <= 1'b0;
      DebugPlugin_disableEbreak <= 1'b0;
      DebugPlugin_hardwareBreakpoints_0_valid <= 1'b0;
      DebugPlugin_hardwareBreakpoints_1_valid <= 1'b0;
      DebugPlugin_hardwareBreakpoints_2_valid <= 1'b0;
    end else begin
      if(when_DebugPlugin_l225) begin
        DebugPlugin_godmode <= 1'b1;
      end
      if(debug_bus_cmd_valid) begin
        DebugPlugin_debugUsed <= 1'b1;
      end
      if(debug_bus_cmd_valid) begin
        case(switch_DebugPlugin_l256)
          6'h0 : begin
            if(debug_bus_cmd_payload_wr) begin
              DebugPlugin_stepIt <= debug_bus_cmd_payload_data[4];
              if(when_DebugPlugin_l260) begin
                DebugPlugin_resetIt <= 1'b1;
              end
              if(when_DebugPlugin_l260_1) begin
                DebugPlugin_resetIt <= 1'b0;
              end
              if(when_DebugPlugin_l261) begin
                DebugPlugin_haltIt <= 1'b1;
              end
              if(when_DebugPlugin_l261_1) begin
                DebugPlugin_haltIt <= 1'b0;
              end
              if(when_DebugPlugin_l262) begin
                DebugPlugin_haltedByBreak <= 1'b0;
              end
              if(when_DebugPlugin_l263) begin
                DebugPlugin_godmode <= 1'b0;
              end
              if(when_DebugPlugin_l264) begin
                DebugPlugin_disableEbreak <= 1'b1;
              end
              if(when_DebugPlugin_l264_1) begin
                DebugPlugin_disableEbreak <= 1'b0;
              end
            end
          end
          6'h10 : begin
            if(debug_bus_cmd_payload_wr) begin
              DebugPlugin_hardwareBreakpoints_0_valid <= debug_bus_cmd_payload_data[0];
            end
          end
          6'h11 : begin
            if(debug_bus_cmd_payload_wr) begin
              DebugPlugin_hardwareBreakpoints_1_valid <= debug_bus_cmd_payload_data[0];
            end
          end
          6'h12 : begin
            if(debug_bus_cmd_payload_wr) begin
              DebugPlugin_hardwareBreakpoints_2_valid <= debug_bus_cmd_payload_data[0];
            end
          end
          default : begin
          end
        endcase
      end
      if(when_DebugPlugin_l284) begin
        if(when_DebugPlugin_l287) begin
          DebugPlugin_haltIt <= 1'b1;
          DebugPlugin_haltedByBreak <= 1'b1;
        end
      end
      if(when_DebugPlugin_l300) begin
        if(decode_arbitration_isValid) begin
          DebugPlugin_haltIt <= 1'b1;
        end
      end
    end
  end


endmodule

module BufferCC_6 (
  input               io_dataIn,
  output              io_dataOut,
  input               mainClock
);
  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge mainClock) begin
    buffers_0 <= io_dataIn;
    buffers_1 <= buffers_0;
  end


endmodule

//StreamFifoLowLatency_1 replaced by StreamFifoLowLatency_1

//StreamFork replaced by StreamFork

//StreamArbiter replaced by StreamArbiter

//StreamFifoLowLatency_1 replaced by StreamFifoLowLatency_1

//StreamFork replaced by StreamFork

//StreamArbiter replaced by StreamArbiter

//StreamFifoLowLatency_1 replaced by StreamFifoLowLatency_1

//StreamFork replaced by StreamFork

//StreamArbiter replaced by StreamArbiter

//StreamFifoLowLatency_1 replaced by StreamFifoLowLatency_1

//StreamFork replaced by StreamFork

//StreamArbiter replaced by StreamArbiter

//StreamFifoLowLatency_1 replaced by StreamFifoLowLatency_1

//StreamFork replaced by StreamFork

//StreamArbiter replaced by StreamArbiter

//StreamFifoLowLatency_1 replaced by StreamFifoLowLatency_1

//StreamFork replaced by StreamFork

//StreamArbiter replaced by StreamArbiter

//StreamFifoLowLatency_1 replaced by StreamFifoLowLatency_1

//StreamFork replaced by StreamFork

//StreamArbiter replaced by StreamArbiter

module StreamFifoLowLatency_1 (
  input               io_push_valid,
  output              io_push_ready,
  input      [1:0]    io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [1:0]    io_pop_payload,
  input               io_flush,
  output reg [2:0]    io_occupancy,
  input               mainClock,
  input               resetCtrl_systemClockReset
);
  wire       [1:0]    _zz_ram_port0;
  wire       [2:0]    _zz_pushPtr_valueNext;
  wire       [0:0]    _zz_pushPtr_valueNext_1;
  wire       [2:0]    _zz_popPtr_valueNext;
  wire       [0:0]    _zz_popPtr_valueNext_1;
  wire       [2:0]    _zz_io_occupancy;
  reg                 _zz_1;
  reg                 pushPtr_willIncrement;
  reg                 pushPtr_willClear;
  reg        [2:0]    pushPtr_valueNext;
  reg        [2:0]    pushPtr_value;
  wire                pushPtr_willOverflowIfInc;
  wire                pushPtr_willOverflow;
  reg                 popPtr_willIncrement;
  reg                 popPtr_willClear;
  reg        [2:0]    popPtr_valueNext;
  reg        [2:0]    popPtr_value;
  wire                popPtr_willOverflowIfInc;
  wire                popPtr_willOverflow;
  wire                ptrMatch;
  reg                 risingOccupancy;
  wire                empty;
  wire                full;
  wire                pushing;
  wire                popping;
  wire                when_Stream_l1008;
  wire       [2:0]    ptrDif;
  (* ram_style = "distributed" *) reg [1:0] ram [0:6];

  assign _zz_pushPtr_valueNext_1 = pushPtr_willIncrement;
  assign _zz_pushPtr_valueNext = {2'd0, _zz_pushPtr_valueNext_1};
  assign _zz_popPtr_valueNext_1 = popPtr_willIncrement;
  assign _zz_popPtr_valueNext = {2'd0, _zz_popPtr_valueNext_1};
  assign _zz_io_occupancy = (3'b111 + ptrDif);
  assign _zz_ram_port0 = ram[popPtr_value];
  always @(posedge mainClock) begin
    if(_zz_1) begin
      ram[pushPtr_value] <= io_push_payload;
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(pushing) begin
      _zz_1 = 1'b1;
    end
  end

  always @(*) begin
    pushPtr_willIncrement = 1'b0;
    if(pushing) begin
      pushPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    pushPtr_willClear = 1'b0;
    if(io_flush) begin
      pushPtr_willClear = 1'b1;
    end
  end

  assign pushPtr_willOverflowIfInc = (pushPtr_value == 3'b110);
  assign pushPtr_willOverflow = (pushPtr_willOverflowIfInc && pushPtr_willIncrement);
  always @(*) begin
    if(pushPtr_willOverflow) begin
      pushPtr_valueNext = 3'b000;
    end else begin
      pushPtr_valueNext = (pushPtr_value + _zz_pushPtr_valueNext);
    end
    if(pushPtr_willClear) begin
      pushPtr_valueNext = 3'b000;
    end
  end

  always @(*) begin
    popPtr_willIncrement = 1'b0;
    if(popping) begin
      popPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    popPtr_willClear = 1'b0;
    if(io_flush) begin
      popPtr_willClear = 1'b1;
    end
  end

  assign popPtr_willOverflowIfInc = (popPtr_value == 3'b110);
  assign popPtr_willOverflow = (popPtr_willOverflowIfInc && popPtr_willIncrement);
  always @(*) begin
    if(popPtr_willOverflow) begin
      popPtr_valueNext = 3'b000;
    end else begin
      popPtr_valueNext = (popPtr_value + _zz_popPtr_valueNext);
    end
    if(popPtr_willClear) begin
      popPtr_valueNext = 3'b000;
    end
  end

  assign ptrMatch = (pushPtr_value == popPtr_value);
  assign empty = (ptrMatch && (! risingOccupancy));
  assign full = (ptrMatch && risingOccupancy);
  assign pushing = (io_push_valid && io_push_ready);
  assign popping = (io_pop_valid && io_pop_ready);
  assign io_push_ready = (! full);
  assign io_pop_valid = (! empty);
  assign io_pop_payload = _zz_ram_port0;
  assign when_Stream_l1008 = (pushing != popping);
  assign ptrDif = (pushPtr_value - popPtr_value);
  always @(*) begin
    if(ptrMatch) begin
      io_occupancy = (risingOccupancy ? 3'b111 : 3'b000);
    end else begin
      io_occupancy = ((popPtr_value < pushPtr_value) ? ptrDif : _zz_io_occupancy);
    end
  end

  always @(posedge mainClock or posedge resetCtrl_systemClockReset) begin
    if(resetCtrl_systemClockReset) begin
      pushPtr_value <= 3'b000;
      popPtr_value <= 3'b000;
      risingOccupancy <= 1'b0;
    end else begin
      pushPtr_value <= pushPtr_valueNext;
      popPtr_value <= popPtr_valueNext;
      if(when_Stream_l1008) begin
        risingOccupancy <= pushing;
      end
      if(io_flush) begin
        risingOccupancy <= 1'b0;
      end
    end
  end


endmodule

module StreamFork (
  input               io_input_valid,
  output reg          io_input_ready,
  input               io_input_payload_write,
  input      [14:0]   io_input_payload_address,
  input      [31:0]   io_input_payload_data,
  input      [3:0]    io_input_payload_mask,
  output              io_outputs_0_valid,
  input               io_outputs_0_ready,
  output              io_outputs_0_payload_write,
  output     [14:0]   io_outputs_0_payload_address,
  output     [31:0]   io_outputs_0_payload_data,
  output     [3:0]    io_outputs_0_payload_mask,
  output              io_outputs_1_valid,
  input               io_outputs_1_ready,
  output              io_outputs_1_payload_write,
  output     [14:0]   io_outputs_1_payload_address,
  output     [31:0]   io_outputs_1_payload_data,
  output     [3:0]    io_outputs_1_payload_mask,
  input               mainClock,
  input               resetCtrl_systemClockReset
);
  reg                 _zz_io_outputs_0_valid;
  reg                 _zz_io_outputs_1_valid;
  wire                when_Stream_l806;
  wire                when_Stream_l806_1;
  wire                io_outputs_0_fire;
  wire                io_outputs_1_fire;

  always @(*) begin
    io_input_ready = 1'b1;
    if(when_Stream_l806) begin
      io_input_ready = 1'b0;
    end
    if(when_Stream_l806_1) begin
      io_input_ready = 1'b0;
    end
  end

  assign when_Stream_l806 = ((! io_outputs_0_ready) && _zz_io_outputs_0_valid);
  assign when_Stream_l806_1 = ((! io_outputs_1_ready) && _zz_io_outputs_1_valid);
  assign io_outputs_0_valid = (io_input_valid && _zz_io_outputs_0_valid);
  assign io_outputs_0_payload_write = io_input_payload_write;
  assign io_outputs_0_payload_address = io_input_payload_address;
  assign io_outputs_0_payload_data = io_input_payload_data;
  assign io_outputs_0_payload_mask = io_input_payload_mask;
  assign io_outputs_0_fire = (io_outputs_0_valid && io_outputs_0_ready);
  assign io_outputs_1_valid = (io_input_valid && _zz_io_outputs_1_valid);
  assign io_outputs_1_payload_write = io_input_payload_write;
  assign io_outputs_1_payload_address = io_input_payload_address;
  assign io_outputs_1_payload_data = io_input_payload_data;
  assign io_outputs_1_payload_mask = io_input_payload_mask;
  assign io_outputs_1_fire = (io_outputs_1_valid && io_outputs_1_ready);
  always @(posedge mainClock or posedge resetCtrl_systemClockReset) begin
    if(resetCtrl_systemClockReset) begin
      _zz_io_outputs_0_valid <= 1'b1;
      _zz_io_outputs_1_valid <= 1'b1;
    end else begin
      if(io_outputs_0_fire) begin
        _zz_io_outputs_0_valid <= 1'b0;
      end
      if(io_outputs_1_fire) begin
        _zz_io_outputs_1_valid <= 1'b0;
      end
      if(io_input_ready) begin
        _zz_io_outputs_0_valid <= 1'b1;
        _zz_io_outputs_1_valid <= 1'b1;
      end
    end
  end


endmodule

module StreamArbiter (
  input               io_inputs_0_valid,
  output              io_inputs_0_ready,
  input               io_inputs_0_payload_write,
  input      [14:0]   io_inputs_0_payload_address,
  input      [31:0]   io_inputs_0_payload_data,
  input      [3:0]    io_inputs_0_payload_mask,
  input               io_inputs_1_valid,
  output              io_inputs_1_ready,
  input               io_inputs_1_payload_write,
  input      [14:0]   io_inputs_1_payload_address,
  input      [31:0]   io_inputs_1_payload_data,
  input      [3:0]    io_inputs_1_payload_mask,
  output              io_output_valid,
  input               io_output_ready,
  output              io_output_payload_write,
  output     [14:0]   io_output_payload_address,
  output     [31:0]   io_output_payload_data,
  output     [3:0]    io_output_payload_mask,
  output     [0:0]    io_chosen,
  output     [1:0]    io_chosenOH,
  input               mainClock,
  input               resetCtrl_systemClockReset
);
  wire       [1:0]    _zz_maskProposal_1_1;
  wire       [1:0]    _zz_maskProposal_1_2;
  reg                 locked;
  wire                maskProposal_0;
  wire                maskProposal_1;
  reg                 maskLocked_0;
  reg                 maskLocked_1;
  wire                maskRouted_0;
  wire                maskRouted_1;
  wire       [1:0]    _zz_maskProposal_1;
  wire                io_output_fire;
  wire                _zz_io_chosen;

  assign _zz_maskProposal_1_1 = (_zz_maskProposal_1 & (~ _zz_maskProposal_1_2));
  assign _zz_maskProposal_1_2 = (_zz_maskProposal_1 - 2'b01);
  assign maskRouted_0 = (locked ? maskLocked_0 : maskProposal_0);
  assign maskRouted_1 = (locked ? maskLocked_1 : maskProposal_1);
  assign _zz_maskProposal_1 = {io_inputs_1_valid,io_inputs_0_valid};
  assign maskProposal_0 = io_inputs_0_valid;
  assign maskProposal_1 = _zz_maskProposal_1_1[1];
  assign io_output_fire = (io_output_valid && io_output_ready);
  assign io_output_valid = ((io_inputs_0_valid && maskRouted_0) || (io_inputs_1_valid && maskRouted_1));
  assign io_output_payload_write = (maskRouted_0 ? io_inputs_0_payload_write : io_inputs_1_payload_write);
  assign io_output_payload_address = (maskRouted_0 ? io_inputs_0_payload_address : io_inputs_1_payload_address);
  assign io_output_payload_data = (maskRouted_0 ? io_inputs_0_payload_data : io_inputs_1_payload_data);
  assign io_output_payload_mask = (maskRouted_0 ? io_inputs_0_payload_mask : io_inputs_1_payload_mask);
  assign io_inputs_0_ready = (maskRouted_0 && io_output_ready);
  assign io_inputs_1_ready = (maskRouted_1 && io_output_ready);
  assign io_chosenOH = {maskRouted_1,maskRouted_0};
  assign _zz_io_chosen = io_chosenOH[1];
  assign io_chosen = _zz_io_chosen;
  always @(posedge mainClock or posedge resetCtrl_systemClockReset) begin
    if(resetCtrl_systemClockReset) begin
      locked <= 1'b0;
    end else begin
      if(io_output_valid) begin
        locked <= 1'b1;
      end
      if(io_output_fire) begin
        locked <= 1'b0;
      end
    end
  end

  always @(posedge mainClock) begin
    if(io_output_valid) begin
      maskLocked_0 <= maskRouted_0;
      maskLocked_1 <= maskRouted_1;
    end
  end


endmodule

//StreamFifo_5 replaced by StreamFifo_5

module StreamFifo_5 (
  input               io_push_valid,
  output              io_push_ready,
  input      [7:0]    io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [7:0]    io_pop_payload,
  input               io_flush,
  output     [5:0]    io_occupancy,
  output     [5:0]    io_availability,
  input               mainClock,
  input               resetCtrl_systemClockReset
);
  reg        [7:0]    _zz_logic_ram_port0;
  wire       [4:0]    _zz_logic_pushPtr_valueNext;
  wire       [0:0]    _zz_logic_pushPtr_valueNext_1;
  wire       [4:0]    _zz_logic_popPtr_valueNext;
  wire       [0:0]    _zz_logic_popPtr_valueNext_1;
  wire                _zz_logic_ram_port;
  wire                _zz_io_pop_payload;
  wire       [4:0]    _zz_io_availability;
  reg                 _zz_1;
  reg                 logic_pushPtr_willIncrement;
  reg                 logic_pushPtr_willClear;
  reg        [4:0]    logic_pushPtr_valueNext;
  reg        [4:0]    logic_pushPtr_value;
  wire                logic_pushPtr_willOverflowIfInc;
  wire                logic_pushPtr_willOverflow;
  reg                 logic_popPtr_willIncrement;
  reg                 logic_popPtr_willClear;
  reg        [4:0]    logic_popPtr_valueNext;
  reg        [4:0]    logic_popPtr_value;
  wire                logic_popPtr_willOverflowIfInc;
  wire                logic_popPtr_willOverflow;
  wire                logic_ptrMatch;
  reg                 logic_risingOccupancy;
  wire                logic_pushing;
  wire                logic_popping;
  wire                logic_empty;
  wire                logic_full;
  reg                 _zz_io_pop_valid;
  wire                when_Stream_l933;
  wire       [4:0]    logic_ptrDif;
  reg [7:0] logic_ram [0:31];

  assign _zz_logic_pushPtr_valueNext_1 = logic_pushPtr_willIncrement;
  assign _zz_logic_pushPtr_valueNext = {4'd0, _zz_logic_pushPtr_valueNext_1};
  assign _zz_logic_popPtr_valueNext_1 = logic_popPtr_willIncrement;
  assign _zz_logic_popPtr_valueNext = {4'd0, _zz_logic_popPtr_valueNext_1};
  assign _zz_io_availability = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz_io_pop_payload = 1'b1;
  always @(posedge mainClock) begin
    if(_zz_io_pop_payload) begin
      _zz_logic_ram_port0 <= logic_ram[logic_popPtr_valueNext];
    end
  end

  always @(posedge mainClock) begin
    if(_zz_1) begin
      logic_ram[logic_pushPtr_value] <= io_push_payload;
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_pushing) begin
      _zz_1 = 1'b1;
    end
  end

  always @(*) begin
    logic_pushPtr_willIncrement = 1'b0;
    if(logic_pushing) begin
      logic_pushPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    logic_pushPtr_willClear = 1'b0;
    if(io_flush) begin
      logic_pushPtr_willClear = 1'b1;
    end
  end

  assign logic_pushPtr_willOverflowIfInc = (logic_pushPtr_value == 5'h1f);
  assign logic_pushPtr_willOverflow = (logic_pushPtr_willOverflowIfInc && logic_pushPtr_willIncrement);
  always @(*) begin
    logic_pushPtr_valueNext = (logic_pushPtr_value + _zz_logic_pushPtr_valueNext);
    if(logic_pushPtr_willClear) begin
      logic_pushPtr_valueNext = 5'h0;
    end
  end

  always @(*) begin
    logic_popPtr_willIncrement = 1'b0;
    if(logic_popping) begin
      logic_popPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    logic_popPtr_willClear = 1'b0;
    if(io_flush) begin
      logic_popPtr_willClear = 1'b1;
    end
  end

  assign logic_popPtr_willOverflowIfInc = (logic_popPtr_value == 5'h1f);
  assign logic_popPtr_willOverflow = (logic_popPtr_willOverflowIfInc && logic_popPtr_willIncrement);
  always @(*) begin
    logic_popPtr_valueNext = (logic_popPtr_value + _zz_logic_popPtr_valueNext);
    if(logic_popPtr_willClear) begin
      logic_popPtr_valueNext = 5'h0;
    end
  end

  assign logic_ptrMatch = (logic_pushPtr_value == logic_popPtr_value);
  assign logic_pushing = (io_push_valid && io_push_ready);
  assign logic_popping = (io_pop_valid && io_pop_ready);
  assign logic_empty = (logic_ptrMatch && (! logic_risingOccupancy));
  assign logic_full = (logic_ptrMatch && logic_risingOccupancy);
  assign io_push_ready = (! logic_full);
  assign io_pop_valid = ((! logic_empty) && (! (_zz_io_pop_valid && (! logic_full))));
  assign io_pop_payload = _zz_logic_ram_port0;
  assign when_Stream_l933 = (logic_pushing != logic_popping);
  assign logic_ptrDif = (logic_pushPtr_value - logic_popPtr_value);
  assign io_occupancy = {(logic_risingOccupancy && logic_ptrMatch),logic_ptrDif};
  assign io_availability = {((! logic_risingOccupancy) && logic_ptrMatch),_zz_io_availability};
  always @(posedge mainClock or posedge resetCtrl_systemClockReset) begin
    if(resetCtrl_systemClockReset) begin
      logic_pushPtr_value <= 5'h0;
      logic_popPtr_value <= 5'h0;
      logic_risingOccupancy <= 1'b0;
      _zz_io_pop_valid <= 1'b0;
    end else begin
      logic_pushPtr_value <= logic_pushPtr_valueNext;
      logic_popPtr_value <= logic_popPtr_valueNext;
      _zz_io_pop_valid <= (logic_popPtr_valueNext == logic_pushPtr_value);
      if(when_Stream_l933) begin
        logic_risingOccupancy <= logic_pushing;
      end
      if(io_flush) begin
        logic_risingOccupancy <= 1'b0;
      end
    end
  end


endmodule

module SpiSlaveCtrl (
  input               io_kind_cpol,
  input               io_kind_cpha,
  output              io_rx_valid,
  output     [7:0]    io_rx_payload,
  input               io_tx_valid,
  output              io_tx_ready,
  input      [7:0]    io_tx_payload,
  output              io_txError,
  output              io_ssFilted,
  input               io_spi_sclk,
  input               io_spi_mosi,
  output              io_spi_miso_write,
  output              io_spi_miso_writeEnable,
  input               io_spi_ss,
  input               mainClock,
  input               resetCtrl_systemClockReset
);
  wire                io_spi_sclk_buffercc_io_dataOut;
  wire                io_spi_ss_buffercc_io_dataOut;
  wire                io_spi_mosi_buffercc_io_dataOut;
  wire       [3:0]    _zz_counter_valueNext;
  wire       [0:0]    _zz_counter_valueNext_1;
  wire       [8:0]    _zz_buffer_1;
  wire       [2:0]    _zz_rspBit;
  wire       [2:0]    _zz_rspBit_1;
  wire                spi_sclk;
  wire                spi_mosi;
  wire                spi_miso_write;
  wire                spi_miso_writeEnable;
  wire                spi_ss;
  wire                _zz_normalizedSclkEdges_rise;
  wire                normalizedSclkEdges_rise;
  wire                normalizedSclkEdges_fall;
  wire                normalizedSclkEdges_toggle;
  reg                 _zz_normalizedSclkEdges_rise_1;
  reg                 counter_willIncrement;
  reg                 counter_willClear;
  reg        [3:0]    counter_valueNext;
  reg        [3:0]    counter_value;
  wire                counter_willOverflowIfInc;
  wire                counter_willOverflow;
  reg        [7:0]    buffer_1;
  reg                 counter_willOverflow_regNext;
  wire                rspBit;
  reg                 rspBitSampled;

  assign _zz_counter_valueNext_1 = counter_willIncrement;
  assign _zz_counter_valueNext = {3'd0, _zz_counter_valueNext_1};
  assign _zz_buffer_1 = {buffer_1,spi_mosi};
  assign _zz_rspBit = (3'b111 - _zz_rspBit_1);
  assign _zz_rspBit_1 = (counter_value >>> 1);
  BufferCC_2 io_spi_sclk_buffercc (
    .io_dataIn                     (io_spi_sclk                      ), //i
    .io_dataOut                    (io_spi_sclk_buffercc_io_dataOut  ), //o
    .mainClock                     (mainClock                        ), //i
    .resetCtrl_systemClockReset    (resetCtrl_systemClockReset       )  //i
  );
  BufferCC_2 io_spi_ss_buffercc (
    .io_dataIn                     (io_spi_ss                      ), //i
    .io_dataOut                    (io_spi_ss_buffercc_io_dataOut  ), //o
    .mainClock                     (mainClock                      ), //i
    .resetCtrl_systemClockReset    (resetCtrl_systemClockReset     )  //i
  );
  BufferCC_2 io_spi_mosi_buffercc (
    .io_dataIn                     (io_spi_mosi                      ), //i
    .io_dataOut                    (io_spi_mosi_buffercc_io_dataOut  ), //o
    .mainClock                     (mainClock                        ), //i
    .resetCtrl_systemClockReset    (resetCtrl_systemClockReset       )  //i
  );
  assign spi_sclk = io_spi_sclk_buffercc_io_dataOut;
  assign spi_ss = io_spi_ss_buffercc_io_dataOut;
  assign spi_mosi = io_spi_mosi_buffercc_io_dataOut;
  assign io_spi_miso_write = spi_miso_write;
  assign io_spi_miso_writeEnable = spi_miso_writeEnable;
  assign _zz_normalizedSclkEdges_rise = ((spi_sclk ^ io_kind_cpol) ^ io_kind_cpha);
  assign normalizedSclkEdges_rise = ((! _zz_normalizedSclkEdges_rise_1) && _zz_normalizedSclkEdges_rise);
  assign normalizedSclkEdges_fall = (_zz_normalizedSclkEdges_rise_1 && (! _zz_normalizedSclkEdges_rise));
  assign normalizedSclkEdges_toggle = (_zz_normalizedSclkEdges_rise_1 != _zz_normalizedSclkEdges_rise);
  always @(*) begin
    counter_willIncrement = 1'b0;
    if(!spi_ss) begin
      if(normalizedSclkEdges_toggle) begin
        counter_willIncrement = 1'b1;
      end
    end
  end

  always @(*) begin
    counter_willClear = 1'b0;
    if(spi_ss) begin
      counter_willClear = 1'b1;
    end
  end

  assign counter_willOverflowIfInc = (counter_value == 4'b1111);
  assign counter_willOverflow = (counter_willOverflowIfInc && counter_willIncrement);
  always @(*) begin
    counter_valueNext = (counter_value + _zz_counter_valueNext);
    if(counter_willClear) begin
      counter_valueNext = 4'b0000;
    end
  end

  assign io_ssFilted = spi_ss;
  assign io_rx_valid = counter_willOverflow_regNext;
  assign io_rx_payload = buffer_1;
  assign io_tx_ready = (counter_willOverflow || spi_ss);
  assign io_txError = (io_tx_ready && (! io_tx_valid));
  assign rspBit = io_tx_payload[_zz_rspBit];
  assign spi_miso_writeEnable = (! spi_ss);
  assign spi_miso_write = (io_kind_cpha ? rspBitSampled : rspBit);
  always @(posedge mainClock) begin
    _zz_normalizedSclkEdges_rise_1 <= _zz_normalizedSclkEdges_rise;
    if(!spi_ss) begin
      if(normalizedSclkEdges_rise) begin
        buffer_1 <= _zz_buffer_1[7:0];
      end
    end
    counter_willOverflow_regNext <= counter_willOverflow;
    if(normalizedSclkEdges_fall) begin
      rspBitSampled <= rspBit;
    end
  end

  always @(posedge mainClock or posedge resetCtrl_systemClockReset) begin
    if(resetCtrl_systemClockReset) begin
      counter_value <= 4'b0000;
    end else begin
      counter_value <= counter_valueNext;
    end
  end


endmodule

module BufferCC_5 (
  input      [31:0]   io_dataIn,
  output     [31:0]   io_dataOut,
  input               mainClock,
  input               resetCtrl_systemClockReset
);
  (* async_reg = "true" *) reg        [31:0]   buffers_0;
  (* async_reg = "true" *) reg        [31:0]   buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge mainClock) begin
    buffers_0 <= io_dataIn;
    buffers_1 <= buffers_0;
  end


endmodule

module StreamFifo_4 (
  input               io_push_valid,
  output              io_push_ready,
  input      [27:0]   io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [27:0]   io_pop_payload,
  input               io_flush,
  output reg [8:0]    io_occupancy,
  output reg [8:0]    io_availability,
  input               mainClock,
  input               resetCtrl_systemClockReset
);
  reg        [27:0]   _zz_logic_ram_port0;
  wire       [8:0]    _zz_logic_pushPtr_valueNext;
  wire       [0:0]    _zz_logic_pushPtr_valueNext_1;
  wire       [8:0]    _zz_logic_popPtr_valueNext;
  wire       [0:0]    _zz_logic_popPtr_valueNext_1;
  wire                _zz_logic_ram_port;
  wire                _zz_io_pop_payload;
  wire       [8:0]    _zz_io_occupancy;
  wire       [8:0]    _zz_io_availability;
  wire       [8:0]    _zz_io_availability_1;
  wire       [8:0]    _zz_io_availability_2;
  reg                 _zz_1;
  reg                 logic_pushPtr_willIncrement;
  reg                 logic_pushPtr_willClear;
  reg        [8:0]    logic_pushPtr_valueNext;
  reg        [8:0]    logic_pushPtr_value;
  wire                logic_pushPtr_willOverflowIfInc;
  wire                logic_pushPtr_willOverflow;
  reg                 logic_popPtr_willIncrement;
  reg                 logic_popPtr_willClear;
  reg        [8:0]    logic_popPtr_valueNext;
  reg        [8:0]    logic_popPtr_value;
  wire                logic_popPtr_willOverflowIfInc;
  wire                logic_popPtr_willOverflow;
  wire                logic_ptrMatch;
  reg                 logic_risingOccupancy;
  wire                logic_pushing;
  wire                logic_popping;
  wire                logic_empty;
  wire                logic_full;
  reg                 _zz_io_pop_valid;
  wire                when_Stream_l933;
  wire       [8:0]    logic_ptrDif;
  reg [27:0] logic_ram [0:279];

  assign _zz_logic_pushPtr_valueNext_1 = logic_pushPtr_willIncrement;
  assign _zz_logic_pushPtr_valueNext = {8'd0, _zz_logic_pushPtr_valueNext_1};
  assign _zz_logic_popPtr_valueNext_1 = logic_popPtr_willIncrement;
  assign _zz_logic_popPtr_valueNext = {8'd0, _zz_logic_popPtr_valueNext_1};
  assign _zz_io_occupancy = (9'h118 + logic_ptrDif);
  assign _zz_io_availability = (9'h118 + _zz_io_availability_1);
  assign _zz_io_availability_1 = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz_io_availability_2 = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz_io_pop_payload = 1'b1;
  always @(posedge mainClock) begin
    if(_zz_io_pop_payload) begin
      _zz_logic_ram_port0 <= logic_ram[logic_popPtr_valueNext];
    end
  end

  always @(posedge mainClock) begin
    if(_zz_1) begin
      logic_ram[logic_pushPtr_value] <= io_push_payload;
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_pushing) begin
      _zz_1 = 1'b1;
    end
  end

  always @(*) begin
    logic_pushPtr_willIncrement = 1'b0;
    if(logic_pushing) begin
      logic_pushPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    logic_pushPtr_willClear = 1'b0;
    if(io_flush) begin
      logic_pushPtr_willClear = 1'b1;
    end
  end

  assign logic_pushPtr_willOverflowIfInc = (logic_pushPtr_value == 9'h117);
  assign logic_pushPtr_willOverflow = (logic_pushPtr_willOverflowIfInc && logic_pushPtr_willIncrement);
  always @(*) begin
    if(logic_pushPtr_willOverflow) begin
      logic_pushPtr_valueNext = 9'h0;
    end else begin
      logic_pushPtr_valueNext = (logic_pushPtr_value + _zz_logic_pushPtr_valueNext);
    end
    if(logic_pushPtr_willClear) begin
      logic_pushPtr_valueNext = 9'h0;
    end
  end

  always @(*) begin
    logic_popPtr_willIncrement = 1'b0;
    if(logic_popping) begin
      logic_popPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    logic_popPtr_willClear = 1'b0;
    if(io_flush) begin
      logic_popPtr_willClear = 1'b1;
    end
  end

  assign logic_popPtr_willOverflowIfInc = (logic_popPtr_value == 9'h117);
  assign logic_popPtr_willOverflow = (logic_popPtr_willOverflowIfInc && logic_popPtr_willIncrement);
  always @(*) begin
    if(logic_popPtr_willOverflow) begin
      logic_popPtr_valueNext = 9'h0;
    end else begin
      logic_popPtr_valueNext = (logic_popPtr_value + _zz_logic_popPtr_valueNext);
    end
    if(logic_popPtr_willClear) begin
      logic_popPtr_valueNext = 9'h0;
    end
  end

  assign logic_ptrMatch = (logic_pushPtr_value == logic_popPtr_value);
  assign logic_pushing = (io_push_valid && io_push_ready);
  assign logic_popping = (io_pop_valid && io_pop_ready);
  assign logic_empty = (logic_ptrMatch && (! logic_risingOccupancy));
  assign logic_full = (logic_ptrMatch && logic_risingOccupancy);
  assign io_push_ready = (! logic_full);
  assign io_pop_valid = ((! logic_empty) && (! (_zz_io_pop_valid && (! logic_full))));
  assign io_pop_payload = _zz_logic_ram_port0;
  assign when_Stream_l933 = (logic_pushing != logic_popping);
  assign logic_ptrDif = (logic_pushPtr_value - logic_popPtr_value);
  always @(*) begin
    if(logic_ptrMatch) begin
      io_occupancy = (logic_risingOccupancy ? 9'h118 : 9'h0);
    end else begin
      io_occupancy = ((logic_popPtr_value < logic_pushPtr_value) ? logic_ptrDif : _zz_io_occupancy);
    end
  end

  always @(*) begin
    if(logic_ptrMatch) begin
      io_availability = (logic_risingOccupancy ? 9'h0 : 9'h118);
    end else begin
      io_availability = ((logic_popPtr_value < logic_pushPtr_value) ? _zz_io_availability : _zz_io_availability_2);
    end
  end

  always @(posedge mainClock or posedge resetCtrl_systemClockReset) begin
    if(resetCtrl_systemClockReset) begin
      logic_pushPtr_value <= 9'h0;
      logic_popPtr_value <= 9'h0;
      logic_risingOccupancy <= 1'b0;
      _zz_io_pop_valid <= 1'b0;
    end else begin
      logic_pushPtr_value <= logic_pushPtr_valueNext;
      logic_popPtr_value <= logic_popPtr_valueNext;
      _zz_io_pop_valid <= (logic_popPtr_valueNext == logic_pushPtr_value);
      if(when_Stream_l933) begin
        logic_risingOccupancy <= logic_pushing;
      end
      if(io_flush) begin
        logic_risingOccupancy <= 1'b0;
      end
    end
  end


endmodule

//StreamFifo_2 replaced by StreamFifo_2

module StreamFifo_2 (
  input               io_push_valid,
  output              io_push_ready,
  input      [31:0]   io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [31:0]   io_pop_payload,
  input               io_flush,
  output     [3:0]    io_occupancy,
  output     [3:0]    io_availability,
  input               mainClock,
  input               resetCtrl_systemClockReset
);
  reg        [31:0]   _zz_logic_ram_port0;
  wire       [2:0]    _zz_logic_pushPtr_valueNext;
  wire       [0:0]    _zz_logic_pushPtr_valueNext_1;
  wire       [2:0]    _zz_logic_popPtr_valueNext;
  wire       [0:0]    _zz_logic_popPtr_valueNext_1;
  wire                _zz_logic_ram_port;
  wire                _zz_io_pop_payload;
  wire       [2:0]    _zz_io_availability;
  reg                 _zz_1;
  reg                 logic_pushPtr_willIncrement;
  reg                 logic_pushPtr_willClear;
  reg        [2:0]    logic_pushPtr_valueNext;
  reg        [2:0]    logic_pushPtr_value;
  wire                logic_pushPtr_willOverflowIfInc;
  wire                logic_pushPtr_willOverflow;
  reg                 logic_popPtr_willIncrement;
  reg                 logic_popPtr_willClear;
  reg        [2:0]    logic_popPtr_valueNext;
  reg        [2:0]    logic_popPtr_value;
  wire                logic_popPtr_willOverflowIfInc;
  wire                logic_popPtr_willOverflow;
  wire                logic_ptrMatch;
  reg                 logic_risingOccupancy;
  wire                logic_pushing;
  wire                logic_popping;
  wire                logic_empty;
  wire                logic_full;
  reg                 _zz_io_pop_valid;
  wire                when_Stream_l933;
  wire       [2:0]    logic_ptrDif;
  reg [31:0] logic_ram [0:7];

  assign _zz_logic_pushPtr_valueNext_1 = logic_pushPtr_willIncrement;
  assign _zz_logic_pushPtr_valueNext = {2'd0, _zz_logic_pushPtr_valueNext_1};
  assign _zz_logic_popPtr_valueNext_1 = logic_popPtr_willIncrement;
  assign _zz_logic_popPtr_valueNext = {2'd0, _zz_logic_popPtr_valueNext_1};
  assign _zz_io_availability = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz_io_pop_payload = 1'b1;
  always @(posedge mainClock) begin
    if(_zz_io_pop_payload) begin
      _zz_logic_ram_port0 <= logic_ram[logic_popPtr_valueNext];
    end
  end

  always @(posedge mainClock) begin
    if(_zz_1) begin
      logic_ram[logic_pushPtr_value] <= io_push_payload;
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_pushing) begin
      _zz_1 = 1'b1;
    end
  end

  always @(*) begin
    logic_pushPtr_willIncrement = 1'b0;
    if(logic_pushing) begin
      logic_pushPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    logic_pushPtr_willClear = 1'b0;
    if(io_flush) begin
      logic_pushPtr_willClear = 1'b1;
    end
  end

  assign logic_pushPtr_willOverflowIfInc = (logic_pushPtr_value == 3'b111);
  assign logic_pushPtr_willOverflow = (logic_pushPtr_willOverflowIfInc && logic_pushPtr_willIncrement);
  always @(*) begin
    logic_pushPtr_valueNext = (logic_pushPtr_value + _zz_logic_pushPtr_valueNext);
    if(logic_pushPtr_willClear) begin
      logic_pushPtr_valueNext = 3'b000;
    end
  end

  always @(*) begin
    logic_popPtr_willIncrement = 1'b0;
    if(logic_popping) begin
      logic_popPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    logic_popPtr_willClear = 1'b0;
    if(io_flush) begin
      logic_popPtr_willClear = 1'b1;
    end
  end

  assign logic_popPtr_willOverflowIfInc = (logic_popPtr_value == 3'b111);
  assign logic_popPtr_willOverflow = (logic_popPtr_willOverflowIfInc && logic_popPtr_willIncrement);
  always @(*) begin
    logic_popPtr_valueNext = (logic_popPtr_value + _zz_logic_popPtr_valueNext);
    if(logic_popPtr_willClear) begin
      logic_popPtr_valueNext = 3'b000;
    end
  end

  assign logic_ptrMatch = (logic_pushPtr_value == logic_popPtr_value);
  assign logic_pushing = (io_push_valid && io_push_ready);
  assign logic_popping = (io_pop_valid && io_pop_ready);
  assign logic_empty = (logic_ptrMatch && (! logic_risingOccupancy));
  assign logic_full = (logic_ptrMatch && logic_risingOccupancy);
  assign io_push_ready = (! logic_full);
  assign io_pop_valid = ((! logic_empty) && (! (_zz_io_pop_valid && (! logic_full))));
  assign io_pop_payload = _zz_logic_ram_port0;
  assign when_Stream_l933 = (logic_pushing != logic_popping);
  assign logic_ptrDif = (logic_pushPtr_value - logic_popPtr_value);
  assign io_occupancy = {(logic_risingOccupancy && logic_ptrMatch),logic_ptrDif};
  assign io_availability = {((! logic_risingOccupancy) && logic_ptrMatch),_zz_io_availability};
  always @(posedge mainClock or posedge resetCtrl_systemClockReset) begin
    if(resetCtrl_systemClockReset) begin
      logic_pushPtr_value <= 3'b000;
      logic_popPtr_value <= 3'b000;
      logic_risingOccupancy <= 1'b0;
      _zz_io_pop_valid <= 1'b0;
    end else begin
      logic_pushPtr_value <= logic_pushPtr_valueNext;
      logic_popPtr_value <= logic_popPtr_valueNext;
      _zz_io_pop_valid <= (logic_popPtr_valueNext == logic_pushPtr_value);
      if(when_Stream_l933) begin
        logic_risingOccupancy <= logic_pushing;
      end
      if(io_flush) begin
        logic_risingOccupancy <= 1'b0;
      end
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
  input               mainClock,
  input               resetCtrl_systemClockReset
);
  reg        [7:0]    _zz_logic_ram_port0;
  wire       [3:0]    _zz_logic_pushPtr_valueNext;
  wire       [0:0]    _zz_logic_pushPtr_valueNext_1;
  wire       [3:0]    _zz_logic_popPtr_valueNext;
  wire       [0:0]    _zz_logic_popPtr_valueNext_1;
  wire                _zz_logic_ram_port;
  wire                _zz_io_pop_payload;
  wire       [3:0]    _zz_io_availability;
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
  reg                 _zz_io_pop_valid;
  wire                when_Stream_l933;
  wire       [3:0]    logic_ptrDif;
  reg [7:0] logic_ram [0:15];

  assign _zz_logic_pushPtr_valueNext_1 = logic_pushPtr_willIncrement;
  assign _zz_logic_pushPtr_valueNext = {3'd0, _zz_logic_pushPtr_valueNext_1};
  assign _zz_logic_popPtr_valueNext_1 = logic_popPtr_willIncrement;
  assign _zz_logic_popPtr_valueNext = {3'd0, _zz_logic_popPtr_valueNext_1};
  assign _zz_io_availability = (logic_popPtr_value - logic_pushPtr_value);
  assign _zz_io_pop_payload = 1'b1;
  always @(posedge mainClock) begin
    if(_zz_io_pop_payload) begin
      _zz_logic_ram_port0 <= logic_ram[logic_popPtr_valueNext];
    end
  end

  always @(posedge mainClock) begin
    if(_zz_1) begin
      logic_ram[logic_pushPtr_value] <= io_push_payload;
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(logic_pushing) begin
      _zz_1 = 1'b1;
    end
  end

  always @(*) begin
    logic_pushPtr_willIncrement = 1'b0;
    if(logic_pushing) begin
      logic_pushPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    logic_pushPtr_willClear = 1'b0;
    if(io_flush) begin
      logic_pushPtr_willClear = 1'b1;
    end
  end

  assign logic_pushPtr_willOverflowIfInc = (logic_pushPtr_value == 4'b1111);
  assign logic_pushPtr_willOverflow = (logic_pushPtr_willOverflowIfInc && logic_pushPtr_willIncrement);
  always @(*) begin
    logic_pushPtr_valueNext = (logic_pushPtr_value + _zz_logic_pushPtr_valueNext);
    if(logic_pushPtr_willClear) begin
      logic_pushPtr_valueNext = 4'b0000;
    end
  end

  always @(*) begin
    logic_popPtr_willIncrement = 1'b0;
    if(logic_popping) begin
      logic_popPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    logic_popPtr_willClear = 1'b0;
    if(io_flush) begin
      logic_popPtr_willClear = 1'b1;
    end
  end

  assign logic_popPtr_willOverflowIfInc = (logic_popPtr_value == 4'b1111);
  assign logic_popPtr_willOverflow = (logic_popPtr_willOverflowIfInc && logic_popPtr_willIncrement);
  always @(*) begin
    logic_popPtr_valueNext = (logic_popPtr_value + _zz_logic_popPtr_valueNext);
    if(logic_popPtr_willClear) begin
      logic_popPtr_valueNext = 4'b0000;
    end
  end

  assign logic_ptrMatch = (logic_pushPtr_value == logic_popPtr_value);
  assign logic_pushing = (io_push_valid && io_push_ready);
  assign logic_popping = (io_pop_valid && io_pop_ready);
  assign logic_empty = (logic_ptrMatch && (! logic_risingOccupancy));
  assign logic_full = (logic_ptrMatch && logic_risingOccupancy);
  assign io_push_ready = (! logic_full);
  assign io_pop_valid = ((! logic_empty) && (! (_zz_io_pop_valid && (! logic_full))));
  assign io_pop_payload = _zz_logic_ram_port0;
  assign when_Stream_l933 = (logic_pushing != logic_popping);
  assign logic_ptrDif = (logic_pushPtr_value - logic_popPtr_value);
  assign io_occupancy = {(logic_risingOccupancy && logic_ptrMatch),logic_ptrDif};
  assign io_availability = {((! logic_risingOccupancy) && logic_ptrMatch),_zz_io_availability};
  always @(posedge mainClock or posedge resetCtrl_systemClockReset) begin
    if(resetCtrl_systemClockReset) begin
      logic_pushPtr_value <= 4'b0000;
      logic_popPtr_value <= 4'b0000;
      logic_risingOccupancy <= 1'b0;
      _zz_io_pop_valid <= 1'b0;
    end else begin
      logic_pushPtr_value <= logic_pushPtr_valueNext;
      logic_popPtr_value <= logic_popPtr_valueNext;
      _zz_io_pop_valid <= (logic_popPtr_valueNext == logic_pushPtr_value);
      if(when_Stream_l933) begin
        logic_risingOccupancy <= logic_pushing;
      end
      if(io_flush) begin
        logic_risingOccupancy <= 1'b0;
      end
    end
  end


endmodule

module UartCtrl (
  input      [2:0]    io_config_frame_dataLength,
  input      `UartStopType_binary_sequential_type io_config_frame_stop,
  input      `UartParityType_binary_sequential_type io_config_frame_parity,
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
  input               mainClock,
  input               resetCtrl_systemClockReset
);
  wire                tx_io_write_ready;
  wire                tx_io_txd;
  wire                rx_io_read_valid;
  wire       [7:0]    rx_io_read_payload;
  wire                rx_io_rts;
  wire                rx_io_error;
  wire                rx_io_break;
  reg        [19:0]   clockDivider_counter;
  wire                clockDivider_tick;
  reg                 clockDivider_tickReg;
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
    .io_samplingTick               (clockDivider_tickReg             ), //i
    .io_write_valid                (io_write_thrown_valid            ), //i
    .io_write_ready                (tx_io_write_ready                ), //o
    .io_write_payload              (io_write_thrown_payload[7:0]     ), //i
    .io_cts                        (1'b0                             ), //i
    .io_txd                        (tx_io_txd                        ), //o
    .io_break                      (io_writeBreak                    ), //i
    .mainClock                     (mainClock                        ), //i
    .resetCtrl_systemClockReset    (resetCtrl_systemClockReset       )  //i
  );
  UartCtrlRx rx (
    .io_configFrame_dataLength     (io_config_frame_dataLength[2:0]  ), //i
    .io_configFrame_stop           (io_config_frame_stop             ), //i
    .io_configFrame_parity         (io_config_frame_parity[1:0]      ), //i
    .io_samplingTick               (clockDivider_tickReg             ), //i
    .io_read_valid                 (rx_io_read_valid                 ), //o
    .io_read_ready                 (io_read_ready                    ), //i
    .io_read_payload               (rx_io_read_payload[7:0]          ), //o
    .io_rxd                        (io_uart_rxd                      ), //i
    .io_rts                        (rx_io_rts                        ), //o
    .io_error                      (rx_io_error                      ), //o
    .io_break                      (rx_io_break                      ), //o
    .mainClock                     (mainClock                        ), //i
    .resetCtrl_systemClockReset    (resetCtrl_systemClockReset       )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_config_frame_stop)
      `UartStopType_binary_sequential_ONE : io_config_frame_stop_string = "ONE";
      `UartStopType_binary_sequential_TWO : io_config_frame_stop_string = "TWO";
      default : io_config_frame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(io_config_frame_parity)
      `UartParityType_binary_sequential_NONE : io_config_frame_parity_string = "NONE";
      `UartParityType_binary_sequential_EVEN : io_config_frame_parity_string = "EVEN";
      `UartParityType_binary_sequential_ODD : io_config_frame_parity_string = "ODD ";
      default : io_config_frame_parity_string = "????";
    endcase
  end
  `endif

  assign clockDivider_tick = (clockDivider_counter == 20'h0);
  always @(*) begin
    io_write_thrown_valid = io_write_valid;
    if(rx_io_break) begin
      io_write_thrown_valid = 1'b0;
    end
  end

  always @(*) begin
    io_write_ready = io_write_thrown_ready;
    if(rx_io_break) begin
      io_write_ready = 1'b1;
    end
  end

  assign io_write_thrown_payload = io_write_payload;
  assign io_write_thrown_ready = tx_io_write_ready;
  assign io_read_valid = rx_io_read_valid;
  assign io_read_payload = rx_io_read_payload;
  assign io_uart_txd = tx_io_txd;
  assign io_readError = rx_io_error;
  assign io_readBreak = rx_io_break;
  always @(posedge mainClock or posedge resetCtrl_systemClockReset) begin
    if(resetCtrl_systemClockReset) begin
      clockDivider_counter <= 20'h0;
      clockDivider_tickReg <= 1'b0;
    end else begin
      clockDivider_tickReg <= clockDivider_tick;
      clockDivider_counter <= (clockDivider_counter - 20'h00001);
      if(clockDivider_tick) begin
        clockDivider_counter <= io_config_clockDivider;
      end
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
  input               io_jtag_tck,
  input               mainClock,
  input               resetCtrl_mainClockReset
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
  reg                 outputArea_flow_m2sPipe_valid;
  reg                 outputArea_flow_m2sPipe_payload_last;
  reg        [0:0]    outputArea_flow_m2sPipe_payload_fragment;

  BufferCC_1 inputArea_target_buffercc (
    .io_dataIn                   (inputArea_target                      ), //i
    .io_dataOut                  (inputArea_target_buffercc_io_dataOut  ), //o
    .mainClock                   (mainClock                             ), //i
    .resetCtrl_mainClockReset    (resetCtrl_mainClockReset              )  //i
  );
  assign outputArea_target = inputArea_target_buffercc_io_dataOut;
  assign outputArea_flow_valid = (outputArea_target != outputArea_hit);
  assign outputArea_flow_payload_last = inputArea_data_last;
  assign outputArea_flow_payload_fragment = inputArea_data_fragment;
  assign io_output_valid = outputArea_flow_m2sPipe_valid;
  assign io_output_payload_last = outputArea_flow_m2sPipe_payload_last;
  assign io_output_payload_fragment = outputArea_flow_m2sPipe_payload_fragment;
  always @(posedge io_jtag_tck) begin
    if(io_input_valid) begin
      inputArea_target <= (! inputArea_target);
      inputArea_data_last <= io_input_payload_last;
      inputArea_data_fragment <= io_input_payload_fragment;
    end
  end

  always @(posedge mainClock) begin
    outputArea_hit <= outputArea_target;
    if(outputArea_flow_valid) begin
      outputArea_flow_m2sPipe_payload_last <= outputArea_flow_payload_last;
      outputArea_flow_m2sPipe_payload_fragment <= outputArea_flow_payload_fragment;
    end
  end

  always @(posedge mainClock or posedge resetCtrl_mainClockReset) begin
    if(resetCtrl_mainClockReset) begin
      outputArea_flow_m2sPipe_valid <= 1'b0;
    end else begin
      outputArea_flow_m2sPipe_valid <= outputArea_flow_valid;
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
  input               mainClock,
  input               resetCtrl_systemClockReset
);
  reg                 when_Phase_l623;
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
  wire                when_Stream_l995;
  wire       [32:0]   _zz_io_pop_payload_error;
  wire                when_Stream_l1008;
  reg        [32:0]   _zz_io_pop_payload_error_1;

  always @(*) begin
    when_Phase_l623 = 1'b0;
    if(pushing) begin
      when_Phase_l623 = 1'b1;
    end
  end

  always @(*) begin
    pushPtr_willIncrement = 1'b0;
    if(pushing) begin
      pushPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    pushPtr_willClear = 1'b0;
    if(io_flush) begin
      pushPtr_willClear = 1'b1;
    end
  end

  assign pushPtr_willOverflowIfInc = 1'b1;
  assign pushPtr_willOverflow = (pushPtr_willOverflowIfInc && pushPtr_willIncrement);
  always @(*) begin
    popPtr_willIncrement = 1'b0;
    if(popping) begin
      popPtr_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    popPtr_willClear = 1'b0;
    if(io_flush) begin
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
  assign when_Stream_l995 = (! empty);
  always @(*) begin
    if(when_Stream_l995) begin
      io_pop_valid = 1'b1;
    end else begin
      io_pop_valid = io_push_valid;
    end
  end

  assign _zz_io_pop_payload_error = _zz_io_pop_payload_error_1;
  always @(*) begin
    if(when_Stream_l995) begin
      io_pop_payload_error = _zz_io_pop_payload_error[0];
    end else begin
      io_pop_payload_error = io_push_payload_error;
    end
  end

  always @(*) begin
    if(when_Stream_l995) begin
      io_pop_payload_inst = _zz_io_pop_payload_error[32 : 1];
    end else begin
      io_pop_payload_inst = io_push_payload_inst;
    end
  end

  assign when_Stream_l1008 = (pushing != popping);
  assign io_occupancy = (risingOccupancy && ptrMatch);
  always @(posedge mainClock or posedge resetCtrl_systemClockReset) begin
    if(resetCtrl_systemClockReset) begin
      risingOccupancy <= 1'b0;
    end else begin
      if(when_Stream_l1008) begin
        risingOccupancy <= pushing;
      end
      if(io_flush) begin
        risingOccupancy <= 1'b0;
      end
    end
  end

  always @(posedge mainClock) begin
    if(when_Phase_l623) begin
      _zz_io_pop_payload_error_1 <= {io_push_payload_inst,io_push_payload_error};
    end
  end


endmodule

//BufferCC_2 replaced by BufferCC_2

//BufferCC_2 replaced by BufferCC_2

module BufferCC_2 (
  input               io_dataIn,
  output              io_dataOut,
  input               mainClock,
  input               resetCtrl_systemClockReset
);
  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge mainClock) begin
    buffers_0 <= io_dataIn;
    buffers_1 <= buffers_0;
  end


endmodule

module UartCtrlRx (
  input      [2:0]    io_configFrame_dataLength,
  input      `UartStopType_binary_sequential_type io_configFrame_stop,
  input      `UartParityType_binary_sequential_type io_configFrame_parity,
  input               io_samplingTick,
  output              io_read_valid,
  input               io_read_ready,
  output     [7:0]    io_read_payload,
  input               io_rxd,
  output              io_rts,
  output reg          io_error,
  output              io_break,
  input               mainClock,
  input               resetCtrl_systemClockReset
);
  wire                io_rxd_buffercc_io_dataOut;
  wire       [2:0]    _zz_when_UartCtrlRx_l139;
  wire       [0:0]    _zz_when_UartCtrlRx_l139_1;
  reg                 _zz_io_rts;
  wire                sampler_synchroniser;
  wire                sampler_samples_0;
  reg                 sampler_samples_1;
  reg                 sampler_samples_2;
  reg                 sampler_value;
  reg                 sampler_tick;
  reg        [2:0]    bitTimer_counter;
  reg                 bitTimer_tick;
  wire                when_UartCtrlRx_l43;
  reg        [2:0]    bitCounter_value;
  reg        [6:0]    break_counter;
  wire                break_valid;
  wire                when_UartCtrlRx_l69;
  reg        `UartCtrlRxState_binary_sequential_type stateMachine_state;
  reg                 stateMachine_parity;
  reg        [7:0]    stateMachine_shifter;
  reg                 stateMachine_validReg;
  wire                when_UartCtrlRx_l93;
  wire                when_UartCtrlRx_l103;
  wire                when_UartCtrlRx_l111;
  wire                when_UartCtrlRx_l113;
  wire                when_UartCtrlRx_l125;
  wire                when_UartCtrlRx_l136;
  wire                when_UartCtrlRx_l139;
  `ifndef SYNTHESIS
  reg [23:0] io_configFrame_stop_string;
  reg [31:0] io_configFrame_parity_string;
  reg [47:0] stateMachine_state_string;
  `endif


  assign _zz_when_UartCtrlRx_l139_1 = ((io_configFrame_stop == `UartStopType_binary_sequential_ONE) ? 1'b0 : 1'b1);
  assign _zz_when_UartCtrlRx_l139 = {2'd0, _zz_when_UartCtrlRx_l139_1};
  BufferCC io_rxd_buffercc (
    .io_dataIn                     (io_rxd                      ), //i
    .io_dataOut                    (io_rxd_buffercc_io_dataOut  ), //o
    .mainClock                     (mainClock                   ), //i
    .resetCtrl_systemClockReset    (resetCtrl_systemClockReset  )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_configFrame_stop)
      `UartStopType_binary_sequential_ONE : io_configFrame_stop_string = "ONE";
      `UartStopType_binary_sequential_TWO : io_configFrame_stop_string = "TWO";
      default : io_configFrame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(io_configFrame_parity)
      `UartParityType_binary_sequential_NONE : io_configFrame_parity_string = "NONE";
      `UartParityType_binary_sequential_EVEN : io_configFrame_parity_string = "EVEN";
      `UartParityType_binary_sequential_ODD : io_configFrame_parity_string = "ODD ";
      default : io_configFrame_parity_string = "????";
    endcase
  end
  always @(*) begin
    case(stateMachine_state)
      `UartCtrlRxState_binary_sequential_IDLE : stateMachine_state_string = "IDLE  ";
      `UartCtrlRxState_binary_sequential_START : stateMachine_state_string = "START ";
      `UartCtrlRxState_binary_sequential_DATA : stateMachine_state_string = "DATA  ";
      `UartCtrlRxState_binary_sequential_PARITY : stateMachine_state_string = "PARITY";
      `UartCtrlRxState_binary_sequential_STOP : stateMachine_state_string = "STOP  ";
      default : stateMachine_state_string = "??????";
    endcase
  end
  `endif

  always @(*) begin
    io_error = 1'b0;
    case(stateMachine_state)
      `UartCtrlRxState_binary_sequential_IDLE : begin
      end
      `UartCtrlRxState_binary_sequential_START : begin
      end
      `UartCtrlRxState_binary_sequential_DATA : begin
      end
      `UartCtrlRxState_binary_sequential_PARITY : begin
        if(bitTimer_tick) begin
          if(!when_UartCtrlRx_l125) begin
            io_error = 1'b1;
          end
        end
      end
      default : begin
        if(bitTimer_tick) begin
          if(when_UartCtrlRx_l136) begin
            io_error = 1'b1;
          end
        end
      end
    endcase
  end

  assign io_rts = _zz_io_rts;
  assign sampler_synchroniser = io_rxd_buffercc_io_dataOut;
  assign sampler_samples_0 = sampler_synchroniser;
  always @(*) begin
    bitTimer_tick = 1'b0;
    if(sampler_tick) begin
      if(when_UartCtrlRx_l43) begin
        bitTimer_tick = 1'b1;
      end
    end
  end

  assign when_UartCtrlRx_l43 = (bitTimer_counter == 3'b000);
  assign break_valid = (break_counter == 7'h41);
  assign when_UartCtrlRx_l69 = (io_samplingTick && (! break_valid));
  assign io_break = break_valid;
  assign io_read_valid = stateMachine_validReg;
  assign when_UartCtrlRx_l93 = ((sampler_tick && (! sampler_value)) && (! break_valid));
  assign when_UartCtrlRx_l103 = (sampler_value == 1'b1);
  assign when_UartCtrlRx_l111 = (bitCounter_value == io_configFrame_dataLength);
  assign when_UartCtrlRx_l113 = (io_configFrame_parity == `UartParityType_binary_sequential_NONE);
  assign when_UartCtrlRx_l125 = (stateMachine_parity == sampler_value);
  assign when_UartCtrlRx_l136 = (! sampler_value);
  assign when_UartCtrlRx_l139 = (bitCounter_value == _zz_when_UartCtrlRx_l139);
  assign io_read_payload = stateMachine_shifter;
  always @(posedge mainClock or posedge resetCtrl_systemClockReset) begin
    if(resetCtrl_systemClockReset) begin
      _zz_io_rts <= 1'b0;
      sampler_samples_1 <= 1'b1;
      sampler_samples_2 <= 1'b1;
      sampler_value <= 1'b1;
      sampler_tick <= 1'b0;
      break_counter <= 7'h0;
      stateMachine_state <= `UartCtrlRxState_binary_sequential_IDLE;
      stateMachine_validReg <= 1'b0;
    end else begin
      _zz_io_rts <= (! io_read_ready);
      if(io_samplingTick) begin
        sampler_samples_1 <= sampler_samples_0;
      end
      if(io_samplingTick) begin
        sampler_samples_2 <= sampler_samples_1;
      end
      sampler_value <= (((1'b0 || ((1'b1 && sampler_samples_0) && sampler_samples_1)) || ((1'b1 && sampler_samples_0) && sampler_samples_2)) || ((1'b1 && sampler_samples_1) && sampler_samples_2));
      sampler_tick <= io_samplingTick;
      if(sampler_value) begin
        break_counter <= 7'h0;
      end else begin
        if(when_UartCtrlRx_l69) begin
          break_counter <= (break_counter + 7'h01);
        end
      end
      stateMachine_validReg <= 1'b0;
      case(stateMachine_state)
        `UartCtrlRxState_binary_sequential_IDLE : begin
          if(when_UartCtrlRx_l93) begin
            stateMachine_state <= `UartCtrlRxState_binary_sequential_START;
          end
        end
        `UartCtrlRxState_binary_sequential_START : begin
          if(bitTimer_tick) begin
            stateMachine_state <= `UartCtrlRxState_binary_sequential_DATA;
            if(when_UartCtrlRx_l103) begin
              stateMachine_state <= `UartCtrlRxState_binary_sequential_IDLE;
            end
          end
        end
        `UartCtrlRxState_binary_sequential_DATA : begin
          if(bitTimer_tick) begin
            if(when_UartCtrlRx_l111) begin
              if(when_UartCtrlRx_l113) begin
                stateMachine_state <= `UartCtrlRxState_binary_sequential_STOP;
                stateMachine_validReg <= 1'b1;
              end else begin
                stateMachine_state <= `UartCtrlRxState_binary_sequential_PARITY;
              end
            end
          end
        end
        `UartCtrlRxState_binary_sequential_PARITY : begin
          if(bitTimer_tick) begin
            if(when_UartCtrlRx_l125) begin
              stateMachine_state <= `UartCtrlRxState_binary_sequential_STOP;
              stateMachine_validReg <= 1'b1;
            end else begin
              stateMachine_state <= `UartCtrlRxState_binary_sequential_IDLE;
            end
          end
        end
        default : begin
          if(bitTimer_tick) begin
            if(when_UartCtrlRx_l136) begin
              stateMachine_state <= `UartCtrlRxState_binary_sequential_IDLE;
            end else begin
              if(when_UartCtrlRx_l139) begin
                stateMachine_state <= `UartCtrlRxState_binary_sequential_IDLE;
              end
            end
          end
        end
      endcase
    end
  end

  always @(posedge mainClock) begin
    if(sampler_tick) begin
      bitTimer_counter <= (bitTimer_counter - 3'b001);
      if(when_UartCtrlRx_l43) begin
        bitTimer_counter <= 3'b100;
      end
    end
    if(bitTimer_tick) begin
      bitCounter_value <= (bitCounter_value + 3'b001);
    end
    if(bitTimer_tick) begin
      stateMachine_parity <= (stateMachine_parity ^ sampler_value);
    end
    case(stateMachine_state)
      `UartCtrlRxState_binary_sequential_IDLE : begin
        if(when_UartCtrlRx_l93) begin
          bitTimer_counter <= 3'b001;
        end
      end
      `UartCtrlRxState_binary_sequential_START : begin
        if(bitTimer_tick) begin
          bitCounter_value <= 3'b000;
          stateMachine_parity <= (io_configFrame_parity == `UartParityType_binary_sequential_ODD);
        end
      end
      `UartCtrlRxState_binary_sequential_DATA : begin
        if(bitTimer_tick) begin
          stateMachine_shifter[bitCounter_value] <= sampler_value;
          if(when_UartCtrlRx_l111) begin
            bitCounter_value <= 3'b000;
          end
        end
      end
      `UartCtrlRxState_binary_sequential_PARITY : begin
        if(bitTimer_tick) begin
          bitCounter_value <= 3'b000;
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module UartCtrlTx (
  input      [2:0]    io_configFrame_dataLength,
  input      `UartStopType_binary_sequential_type io_configFrame_stop,
  input      `UartParityType_binary_sequential_type io_configFrame_parity,
  input               io_samplingTick,
  input               io_write_valid,
  output reg          io_write_ready,
  input      [7:0]    io_write_payload,
  input               io_cts,
  output              io_txd,
  input               io_break,
  input               mainClock,
  input               resetCtrl_systemClockReset
);
  wire       [2:0]    _zz_clockDivider_counter_valueNext;
  wire       [0:0]    _zz_clockDivider_counter_valueNext_1;
  wire       [2:0]    _zz_when_UartCtrlTx_l93;
  wire       [0:0]    _zz_when_UartCtrlTx_l93_1;
  reg                 clockDivider_counter_willIncrement;
  wire                clockDivider_counter_willClear;
  reg        [2:0]    clockDivider_counter_valueNext;
  reg        [2:0]    clockDivider_counter_value;
  wire                clockDivider_counter_willOverflowIfInc;
  wire                clockDivider_counter_willOverflow;
  reg        [2:0]    tickCounter_value;
  reg        `UartCtrlTxState_binary_sequential_type stateMachine_state;
  reg                 stateMachine_parity;
  reg                 stateMachine_txd;
  wire                when_UartCtrlTx_l58;
  wire                when_UartCtrlTx_l73;
  wire                when_UartCtrlTx_l76;
  wire                when_UartCtrlTx_l93;
  reg                 _zz_io_txd;
  `ifndef SYNTHESIS
  reg [23:0] io_configFrame_stop_string;
  reg [31:0] io_configFrame_parity_string;
  reg [47:0] stateMachine_state_string;
  `endif


  assign _zz_clockDivider_counter_valueNext_1 = clockDivider_counter_willIncrement;
  assign _zz_clockDivider_counter_valueNext = {2'd0, _zz_clockDivider_counter_valueNext_1};
  assign _zz_when_UartCtrlTx_l93_1 = ((io_configFrame_stop == `UartStopType_binary_sequential_ONE) ? 1'b0 : 1'b1);
  assign _zz_when_UartCtrlTx_l93 = {2'd0, _zz_when_UartCtrlTx_l93_1};
  `ifndef SYNTHESIS
  always @(*) begin
    case(io_configFrame_stop)
      `UartStopType_binary_sequential_ONE : io_configFrame_stop_string = "ONE";
      `UartStopType_binary_sequential_TWO : io_configFrame_stop_string = "TWO";
      default : io_configFrame_stop_string = "???";
    endcase
  end
  always @(*) begin
    case(io_configFrame_parity)
      `UartParityType_binary_sequential_NONE : io_configFrame_parity_string = "NONE";
      `UartParityType_binary_sequential_EVEN : io_configFrame_parity_string = "EVEN";
      `UartParityType_binary_sequential_ODD : io_configFrame_parity_string = "ODD ";
      default : io_configFrame_parity_string = "????";
    endcase
  end
  always @(*) begin
    case(stateMachine_state)
      `UartCtrlTxState_binary_sequential_IDLE : stateMachine_state_string = "IDLE  ";
      `UartCtrlTxState_binary_sequential_START : stateMachine_state_string = "START ";
      `UartCtrlTxState_binary_sequential_DATA : stateMachine_state_string = "DATA  ";
      `UartCtrlTxState_binary_sequential_PARITY : stateMachine_state_string = "PARITY";
      `UartCtrlTxState_binary_sequential_STOP : stateMachine_state_string = "STOP  ";
      default : stateMachine_state_string = "??????";
    endcase
  end
  `endif

  always @(*) begin
    clockDivider_counter_willIncrement = 1'b0;
    if(io_samplingTick) begin
      clockDivider_counter_willIncrement = 1'b1;
    end
  end

  assign clockDivider_counter_willClear = 1'b0;
  assign clockDivider_counter_willOverflowIfInc = (clockDivider_counter_value == 3'b100);
  assign clockDivider_counter_willOverflow = (clockDivider_counter_willOverflowIfInc && clockDivider_counter_willIncrement);
  always @(*) begin
    if(clockDivider_counter_willOverflow) begin
      clockDivider_counter_valueNext = 3'b000;
    end else begin
      clockDivider_counter_valueNext = (clockDivider_counter_value + _zz_clockDivider_counter_valueNext);
    end
    if(clockDivider_counter_willClear) begin
      clockDivider_counter_valueNext = 3'b000;
    end
  end

  always @(*) begin
    stateMachine_txd = 1'b1;
    case(stateMachine_state)
      `UartCtrlTxState_binary_sequential_IDLE : begin
      end
      `UartCtrlTxState_binary_sequential_START : begin
        stateMachine_txd = 1'b0;
      end
      `UartCtrlTxState_binary_sequential_DATA : begin
        stateMachine_txd = io_write_payload[tickCounter_value];
      end
      `UartCtrlTxState_binary_sequential_PARITY : begin
        stateMachine_txd = stateMachine_parity;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_write_ready = io_break;
    case(stateMachine_state)
      `UartCtrlTxState_binary_sequential_IDLE : begin
      end
      `UartCtrlTxState_binary_sequential_START : begin
      end
      `UartCtrlTxState_binary_sequential_DATA : begin
        if(clockDivider_counter_willOverflow) begin
          if(when_UartCtrlTx_l73) begin
            io_write_ready = 1'b1;
          end
        end
      end
      `UartCtrlTxState_binary_sequential_PARITY : begin
      end
      default : begin
      end
    endcase
  end

  assign when_UartCtrlTx_l58 = ((io_write_valid && (! io_cts)) && clockDivider_counter_willOverflow);
  assign when_UartCtrlTx_l73 = (tickCounter_value == io_configFrame_dataLength);
  assign when_UartCtrlTx_l76 = (io_configFrame_parity == `UartParityType_binary_sequential_NONE);
  assign when_UartCtrlTx_l93 = (tickCounter_value == _zz_when_UartCtrlTx_l93);
  assign io_txd = _zz_io_txd;
  always @(posedge mainClock or posedge resetCtrl_systemClockReset) begin
    if(resetCtrl_systemClockReset) begin
      clockDivider_counter_value <= 3'b000;
      stateMachine_state <= `UartCtrlTxState_binary_sequential_IDLE;
      _zz_io_txd <= 1'b1;
    end else begin
      clockDivider_counter_value <= clockDivider_counter_valueNext;
      case(stateMachine_state)
        `UartCtrlTxState_binary_sequential_IDLE : begin
          if(when_UartCtrlTx_l58) begin
            stateMachine_state <= `UartCtrlTxState_binary_sequential_START;
          end
        end
        `UartCtrlTxState_binary_sequential_START : begin
          if(clockDivider_counter_willOverflow) begin
            stateMachine_state <= `UartCtrlTxState_binary_sequential_DATA;
          end
        end
        `UartCtrlTxState_binary_sequential_DATA : begin
          if(clockDivider_counter_willOverflow) begin
            if(when_UartCtrlTx_l73) begin
              if(when_UartCtrlTx_l76) begin
                stateMachine_state <= `UartCtrlTxState_binary_sequential_STOP;
              end else begin
                stateMachine_state <= `UartCtrlTxState_binary_sequential_PARITY;
              end
            end
          end
        end
        `UartCtrlTxState_binary_sequential_PARITY : begin
          if(clockDivider_counter_willOverflow) begin
            stateMachine_state <= `UartCtrlTxState_binary_sequential_STOP;
          end
        end
        default : begin
          if(clockDivider_counter_willOverflow) begin
            if(when_UartCtrlTx_l93) begin
              stateMachine_state <= (io_write_valid ? `UartCtrlTxState_binary_sequential_START : `UartCtrlTxState_binary_sequential_IDLE);
            end
          end
        end
      endcase
      _zz_io_txd <= (stateMachine_txd && (! io_break));
    end
  end

  always @(posedge mainClock) begin
    if(clockDivider_counter_willOverflow) begin
      tickCounter_value <= (tickCounter_value + 3'b001);
    end
    if(clockDivider_counter_willOverflow) begin
      stateMachine_parity <= (stateMachine_parity ^ stateMachine_txd);
    end
    case(stateMachine_state)
      `UartCtrlTxState_binary_sequential_IDLE : begin
      end
      `UartCtrlTxState_binary_sequential_START : begin
        if(clockDivider_counter_willOverflow) begin
          stateMachine_parity <= (io_configFrame_parity == `UartParityType_binary_sequential_ODD);
          tickCounter_value <= 3'b000;
        end
      end
      `UartCtrlTxState_binary_sequential_DATA : begin
        if(clockDivider_counter_willOverflow) begin
          if(when_UartCtrlTx_l73) begin
            tickCounter_value <= 3'b000;
          end
        end
      end
      `UartCtrlTxState_binary_sequential_PARITY : begin
        if(clockDivider_counter_willOverflow) begin
          tickCounter_value <= 3'b000;
        end
      end
      default : begin
      end
    endcase
  end


endmodule

module BufferCC_1 (
  input               io_dataIn,
  output              io_dataOut,
  input               mainClock,
  input               resetCtrl_mainClockReset
);
  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge mainClock) begin
    buffers_0 <= io_dataIn;
    buffers_1 <= buffers_0;
  end


endmodule

module BufferCC (
  input               io_dataIn,
  output              io_dataOut,
  input               mainClock,
  input               resetCtrl_systemClockReset
);
  (* async_reg = "true" *) reg                 buffers_0;
  (* async_reg = "true" *) reg                 buffers_1;

  assign io_dataOut = buffers_1;
  always @(posedge mainClock or posedge resetCtrl_systemClockReset) begin
    if(resetCtrl_systemClockReset) begin
      buffers_0 <= 1'b0;
      buffers_1 <= 1'b0;
    end else begin
      buffers_0 <= io_dataIn;
      buffers_1 <= buffers_0;
    end
  end


endmodule
