// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

module nes_hci (
  input               clk,
  input               rst,

  //Host Interface
  input               i_reset_sm,

  input       [7:0]   i_opcode,
  input               i_opcode_strobe,

  output  reg [15:0]  o_opcode_status,
  output  reg         o_opcode_ack,

  input       [15:0]  i_address,
  input       [31:0]  i_count,

  //Input data path
  input               i_data_strobe,
  output  reg         o_hci_ready,
  input       [7:0]   i_data,

  //Output data path
  output  reg         o_data_strobe,
  input               i_host_ready,
  output  reg [7:0]   o_data,


  //NES Interface
  //CPU Interface
  input               i_cpu_break,
  output  reg         o_cpu_r_nw,           //CPU Read/!Write Pin
  output  reg [15:0]  o_cpu_address,
  input       [7:0]   i_cpu_din,
  output  reg [7:0]   o_cpu_dout,

  //CPU Debug Registers
  output              o_dbg_active,
  output  reg         o_cpu_dbg_reg_wr,
  output  reg [3:0]   o_cpu_dbg_reg_sel,
  input       [7:0]   i_cpu_dbg_reg_din,
  output  reg [7:0]   o_cpu_dbg_reg_dout,

  //Picture Processing Unit (PPU)
  output  reg         o_ppu_vram_wr,
  output  reg [15:0]  o_ppu_vram_address,
  input       [7:0]   i_ppu_vram_din,
  output  reg [7:0]   o_ppu_vram_dout,

  //Cartridge Config Data
  output  reg [39:0]  o_cart_cfg,
  output  reg         o_cart_cfg_update
);

//localparams

// Debug packet opcodes.
localparam [7:0] OP_NOP                  = 8'h00; //Tested
localparam [7:0] OP_DBG_BRK              = 8'h01; //Tested
localparam [7:0] OP_DBG_RUN              = 8'h02; //Tested
localparam [7:0] OP_QUERY_DBG_BRK        = 8'h03; //Tested
localparam [7:0] OP_CPU_MEM_RD           = 8'h04; //Tested
localparam [7:0] OP_CPU_MEM_WR           = 8'h05; //Tested
localparam [7:0] OP_CPU_REG_RD           = 8'h06; //Tested
localparam [7:0] OP_CPU_REG_WR           = 8'h07; //Tested
localparam [7:0] OP_PPU_MEM_RD           = 8'h08; //Tested
localparam [7:0] OP_PPU_MEM_WR           = 8'h09; //Tested
localparam [7:0] OP_PPU_DISABLE          = 8'h0A; //Tested
localparam [7:0] OP_CART_SET_CFG         = 8'h0B; //Tested

// Symbolic state representations.
localparam [4:0] S_DISABLED             = 5'h00;
localparam [4:0] S_DECODE               = 5'h01;
localparam [4:0] S_CPU_MEM_RD           = 5'h02;
localparam [4:0] S_CPU_MEM_WR           = 5'h03;
localparam [4:0] S_CPU_REG_RD           = 5'h04;
localparam [4:0] S_CPU_REG_WR           = 5'h05;
localparam [4:0] S_PPU_MEM_RD           = 5'h06;
localparam [4:0] S_PPU_MEM_WR           = 5'h07;
localparam [4:0] S_PPU_DISABLE_STG_0    = 5'h08;
localparam [4:0] S_PPU_DISABLE_STG_1    = 5'h09;
localparam [4:0] S_PPU_DISABLE_STG_2    = 5'h0A;
localparam [4:0] S_PPU_DISABLE_STG_3    = 5'h0B;
localparam [4:0] S_PPU_DISABLE_STG_4    = 5'h0C;
localparam [4:0] S_PPU_DISABLE_STG_5    = 5'h0D;
localparam [4:0] S_CART_SET_CFG         = 5'h0E;

// Opcode Status
localparam       OS_OK                  = 32'h00000001;
localparam       OS_ERROR               = 32'h00000002;
localparam       OS_UNKNOWN_OPCODE      = 32'h00000004;
localparam       OS_COUNT_IS_ZERO       = 32'h00000008;

//registers/wires
reg         [4:0]   state;
reg         [15:0]  r_execute_count;
reg                 r_host_one_shot;
reg         [15:0]  r_address;
//submodules
//asynchronous logic
assign              o_dbg_active        = (state != S_DISABLED);
//synchronous logic

always @ (posedge clk) begin
  if (rst || i_reset_sm) begin
    state             <=  S_DECODE;
    o_opcode_ack      <=  0;
    o_opcode_status   <=  0;
    r_execute_count   <=  0;
    o_hci_ready       <=  0;

    o_data_strobe     <=  0;
    o_data            <=  0;

    //CPU
    o_cpu_address     <=  0;
    o_cpu_dout        <=  0;
    o_cpu_r_nw        <=  1;

    //Debug Interface
    o_cpu_dbg_reg_wr  <=  0;
    o_cpu_dbg_reg_sel <=  0;
    o_cpu_dbg_reg_dout<=  0;

    //Picture Processing Unit (PPU)
    o_ppu_vram_wr     <=  0;
    o_ppu_vram_dout   <=  0;
    o_ppu_vram_address<=  0;

    //Cartridge
    o_cart_cfg        <=  0;
    o_cart_cfg_update <=  0;

    r_host_one_shot   <=  0;
    r_address         <=  0;
  end
  else begin
    //De-assert strobes
    o_opcode_ack      <=  0;
    o_opcode_status   <=  0;
    o_hci_ready       <=  0;
    o_cart_cfg_update <=  0;
    o_cpu_r_nw        <=  1;
    o_ppu_vram_wr     <=  0;
    o_data_strobe     <=  0;
    o_cpu_dbg_reg_wr  <=  0;

    case (state)
      S_DISABLED: begin
          o_hci_ready                   <=  1;
          if (i_cpu_break) begin
            //Received CPU initiated break. Begin active Debugging
            state                       <=  S_DECODE;
          end
          else if (i_opcode_strobe) begin
            case (i_opcode)
              //User Initiated break
              OP_DBG_BRK: begin
                state                   <=  S_DECODE;
                o_opcode_status         <=  OS_OK;
                o_opcode_ack            <=  1;
              end
              OP_QUERY_DBG_BRK: begin
                o_opcode_status         <=  OS_ERROR;
                o_opcode_ack            <=  1;
              end
              OP_NOP: begin
                o_opcode_status         <=  OS_OK;
                o_opcode_ack            <=  1;
              end
            endcase
          end
        end
      S_DECODE: begin
          o_hci_ready                   <=  1;
          r_execute_count               <=  0;
          r_address                     <=  i_address;

          o_cpu_address                 <=  0;
          o_ppu_vram_address            <=  0;
          o_cpu_dbg_reg_sel             <=  4'h0;

          o_cpu_dbg_reg_sel             <=  i_address[3:0];

          r_host_one_shot               <=  1;
          if (i_opcode_strobe) begin
            case (i_opcode)
              OP_CPU_MEM_RD:  begin
                o_cpu_address           <=  i_address;
                state                   <= S_CPU_MEM_RD;
              end
              OP_CPU_MEM_WR:     state  <= S_CPU_MEM_WR;
              OP_CPU_REG_RD:     state  <= S_CPU_REG_RD;
              OP_CPU_REG_WR:     state  <= S_CPU_REG_WR;
              OP_PPU_MEM_RD: begin
                o_ppu_vram_address      <=  i_address;
                state                   <= S_PPU_MEM_RD;
              end
              OP_PPU_MEM_WR:     state  <= S_PPU_MEM_WR;
              OP_CART_SET_CFG:   state  <= S_CART_SET_CFG;
              OP_DBG_BRK:        state  <= S_DECODE;
              OP_PPU_DISABLE:    state  <= S_PPU_DISABLE_STG_0;
              OP_DBG_RUN: begin
                  //Go into normal execution of code
                  state                 <=  S_DISABLED;
                  o_opcode_status       <=  OS_OK;
                  o_opcode_ack          <=  1;
                end
              OP_QUERY_DBG_BRK: begin
                  //Yes we are in a debug break
                  o_opcode_status       <=  OS_OK;
                  o_opcode_ack          <=  1;
                end
              OP_NOP: begin
                  o_opcode_status       <=  OS_OK;
                  o_opcode_ack          <=  1;
                end
              default:
                begin
                  // Invalid opcode.  Ignore, but set error code.
                  o_opcode_status       <=  OS_UNKNOWN_OPCODE | OS_ERROR;
                  o_opcode_ack          <=  1;
                  //Stay in decode
                end
            endcase
          end
        end
      //CPU Mem Read
      //User must populate the count and the address
      //When data is available read the data  [data] * count bytes
      S_CPU_MEM_RD: begin
        if (r_execute_count >= i_count) begin
          o_opcode_status             <=  OS_OK;
          o_opcode_ack                <=  1;
          state                       <=  S_DECODE;
        end
        if (i_host_ready && r_host_one_shot) begin
          o_data                      <=  i_cpu_din;
          o_data_strobe               <=  1;
          r_host_one_shot             <=  0;
        end
        if (o_data_strobe) begin
          r_execute_count             <=  r_execute_count + 32'h00000001;
          o_cpu_address               <=  o_cpu_address + 16'h0001;
        end

        if (!i_host_ready) begin
          r_host_one_shot             <=  1;
        end
      end
      //CPU Mem Write
      //User must populate count and address before sending opcode
      S_CPU_MEM_WR: begin

        if (r_execute_count >= i_count) begin
          o_opcode_status             <=  OS_OK;
          o_opcode_ack                <=  1;
          state                       <=  S_DECODE;
        end
        else if (i_data_strobe) begin
          o_cpu_dout                  <=  i_data;
          o_cpu_r_nw                  <=  0;
          o_cpu_address               <=  r_address;
        end
        else begin
          o_hci_ready                 <=  1;
        end

        //When the strobe is high increment the counter and address
        if (!o_cpu_r_nw) begin
          r_execute_count             <=  r_execute_count + 32'h00000001;
          r_address                   <=  r_address + 16'h0001;
        end
      end
      //CPU Read Register
      S_CPU_REG_RD: begin
        if (i_host_ready) begin
          o_data                      <=  i_cpu_dbg_reg_din;
          o_data_strobe               <=  1;
          o_opcode_status             <=  OS_OK;
          o_opcode_ack                <=  1;
          state                       <=  S_DECODE;
        end
      end
      //CPU Write Register
      //Set up the CPU Address for the debug register
      S_CPU_REG_WR: begin
        o_hci_ready                   <=  1;
        if (i_data_strobe) begin
          o_cpu_dbg_reg_wr            <=  1;
          o_cpu_dbg_reg_dout          <=  i_data;
          o_opcode_status             <=  OS_OK;
          o_opcode_ack                <=  1;
          state                       <=  S_DECODE;
        end
      end

      //Picture Processing Unit Memory Read
      S_PPU_MEM_RD: begin
        if (r_execute_count >= i_count) begin
          o_opcode_status             <=  OS_OK;
          o_opcode_ack                <=  1;
          state                       <=  S_DECODE;
        end
        else if (i_host_ready && r_host_one_shot) begin
          o_data                      <=  i_ppu_vram_din;
          o_data_strobe               <=  1;
          r_host_one_shot             <=  0;
        end
        if (o_data_strobe) begin
          r_execute_count             <=  r_execute_count + 32'h00000001;
          o_ppu_vram_address          <=  o_ppu_vram_address + 16'h0001;
        end
        if (!i_host_ready) begin
          r_host_one_shot             <=  1;
        end
      end
      //Picture Processing Unit Memory Write
      S_PPU_MEM_WR: begin

        if (r_execute_count >= i_count) begin
          o_opcode_status             <=  OS_OK;
          o_opcode_ack                <=  1;
          state                       <=  S_DECODE;
        end
        else if (i_data_strobe) begin
          o_ppu_vram_dout             <=  i_data;
          o_ppu_vram_wr               <=  1;
          o_ppu_vram_address          <=  r_address;
        end
        else begin
          o_hci_ready                 <=  1;
        end

        //When the write stobe goes high increment the address
        if (o_ppu_vram_wr) begin
          r_execute_count             <=  r_execute_count + 32'h00000001;
          r_address                   <=  r_address + 16'h0001;
        end
      end
      S_PPU_DISABLE_STG_0: begin
        o_cpu_address                 <=  16'h2000;
        state                         <=  S_PPU_DISABLE_STG_1;
      end
      S_PPU_DISABLE_STG_1: begin
        // Write 0x2000 to 0.
        o_cpu_r_nw                    <=  1;
        o_cpu_dout                    <=  8'h00;

        // Set addr to 0x0000 for one cycle (due to PPU quirk only recognizing register
        // interface reads/writes when address bits [15-13] change from 3'b001 from another
        // value.
        o_cpu_address                 <=  16'h0000;
        state                         <=  S_PPU_DISABLE_STG_2;
      end
      S_PPU_DISABLE_STG_2: begin
        o_cpu_address                 <=  16'h2001;
        state                         <=  S_PPU_DISABLE_STG_3;
      end
      S_PPU_DISABLE_STG_3: begin
        // Write 0x2001 to 0.
        o_cpu_r_nw                    <=  1;
        o_cpu_dout                    <=  8'h00;

        // Set addr to 0x0000 for one cycle (due to PPU quirk only recognizing register
        // interface reads/writes when address bits [15-13] change from 3'b001 from another
        // value.
        o_cpu_address                 <=  16'h0000;
        state                         <=  S_PPU_DISABLE_STG_4;
      end
      S_PPU_DISABLE_STG_4: begin
        o_cpu_address                 <=  16'h2002;
        state                         <=  S_PPU_DISABLE_STG_5;
      end
      S_PPU_DISABLE_STG_5: begin
        // Read 0x2002 to reset PPU byte pointer.
        o_cpu_address                 <=  16'h0000;
        o_opcode_status               <=  OS_OK;
        o_opcode_ack                  <=  1;
        state                         <=  S_DECODE;
      end
      S_CART_SET_CFG: begin
        if (r_execute_count >= 4) begin
          o_opcode_status             <=  OS_OK;
          o_opcode_ack                <=  1;
          state                       <=  S_DECODE;
          o_cart_cfg_update           <=  1;
        end
        else if (i_data_strobe && o_hci_ready) begin
          o_hci_ready                 <=  0;
          r_execute_count             <=  r_execute_count + 32'h00000001;
          o_cart_cfg                  <=  {o_cart_cfg[31:0], i_data};
        end
        else begin
          o_hci_ready                 <=  1;
        end
        //When the write stobe goes high increment the address
      end
      default: begin
        state                         <=  S_DECODE;
      end
    endcase
  end
end
endmodule
