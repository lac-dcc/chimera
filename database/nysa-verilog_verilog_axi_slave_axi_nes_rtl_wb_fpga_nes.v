// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

//wb_fpga_nes.v
/*
Distributed under the MIT license.
Copyright (c) 2011 Dave McCoy (dave.mccoy@cospandesign.com)

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

/*
  Self Defining Bus (SDB)

  Set the Vendor ID (Hexidecimal 64-bit Number)
  SDB_VENDOR_ID:0x800000000000C594

  Set the Device ID (Hexcidecimal 32-bit Number)
  SDB_DEVICE_ID:0x0000000F

  Set the version of the Core XX.XXX.XXX Example: 01.000.000
  SDB_CORE_VERSION:00.000.001

  Set the Device Name: (19 UNICODE characters)
  SDB_NAME:wb_fpga_nes

  Set the class of the device (16 bits) Set as 0
  SDB_ABI_CLASS:0

  Set the ABI Major Version: (8-bits)
  SDB_ABI_VERSION_MAJOR:0x0F

  Set the ABI Minor Version (8-bits)
  SDB_ABI_VERSION_MINOR:0x02

  Set the Module URL (63 Unicode Characters)
  SDB_MODULE_URL:http://www.example.com

  Set the date of module YYYY/MM/DD
  SDB_DATE:2015/01/07

  Device is executable (True/False)
  SDB_EXECUTABLE:True

  Device is readable (True/False)
  SDB_READABLE:True

  Device is writeable (True/False)
  SDB_WRITEABLE:True

  Device Size: Number of Registers
  SDB_SIZE:15
*/

module wb_fpga_nes (
  input               clk,
  input               rst,

  //Add signals to control your device here

  //Wishbone Bus Signals
  input               i_wbs_we,
  input               i_wbs_cyc,
  input       [3:0]   i_wbs_sel,
  input       [31:0]  i_wbs_dat,
  input               i_wbs_stb,
  output  reg         o_wbs_ack,
  output  reg [31:0]  o_wbs_dat,
  input       [31:0]  i_wbs_adr,

  //master control signal for memory arbitration
  output              mem_o_we,
  output              mem_o_stb,
  output              mem_o_cyc,
  output      [3:0]   mem_o_sel,
  output      [31:0]  mem_o_adr,
  output      [31:0]  mem_o_dat,
  input       [31:0]  mem_i_dat,
  input               mem_i_ack,
  input               mem_i_int,

  //This interrupt can be controlled from this module or a submodule
  output  reg         o_wbs_int

  //Nes Interface

);
//Local Parameters
localparam      CONTROL            = 32'h00000000;
localparam      STATUS             = 32'h00000001;
localparam      USER_INPUT         = 32'h00000002;
localparam      HCI_OPCODE_COUNT   = 32'h00000003;
localparam      HCI_OPCODE_ADDR    = 32'h00000004;
localparam      HCI_OPCODE         = 32'h00000005;
localparam      HCI_OPCODE_DATA    = 32'h00000006;
localparam      DMA_STATUS         = 32'h00000007;
localparam      REG_MEM_0_BASE     = 32'h00000008;
localparam      REG_MEM_0_SIZE     = 32'h00000009;
localparam      REG_MEM_1_BASE     = 32'h0000000A;
localparam      REG_MEM_1_SIZE     = 32'h0000000B;
localparam      REG_IMAGE_WIDTH    = 32'h0000000C;
localparam      REG_IMAGE_HEIGHT   = 32'h0000000D;

//Control
localparam      CONTROL_HCI_RESET             = 0;
localparam      CONTROL_CONSOLE_RESET         = 1;
localparam      CONTROL_ENABLE_DMA            = 2;

//Status
localparam      STATUS_CLOCK_LOCKED           = 0;
localparam      STATUS_HCI_READY              = 1;
localparam      STATUS_HCI_NEW_STATUS         = 2;
localparam      STATUS_HCI_S_BOT              = 16;
localparam      STATUS_HCI_S_TOP              = STATUS_HCI_S_BOT + 15;

//Local Registers/Wires
//wire                  clk_locked;
//wire                  nes_clk;
wire          [31:0]  status;
reg           [31:0]  control;
wire          [3:0]   dma_status;

//DMA Transfer Registers
wire                w_enable_dma;

reg         [31:0]  r_memory_0_base;
reg         [31:0]  r_memory_0_size;
wire        [31:0]  w_memory_0_count;
reg                 r_memory_0_ready;
wire                w_memory_0_finished;
wire                w_memory_0_empty;

wire        [31:0]  w_default_mem_0_base;

reg         [31:0]  r_memory_1_base;
reg         [31:0]  r_memory_1_size;
wire        [31:0]  w_memory_1_count;
reg                 r_memory_1_ready;
wire                w_memory_1_finished;
wire                w_memory_1_empty;

wire        [31:0]  w_default_mem_1_base;

wire                w_write_finished;

wire                w_rfifo_ready;
wire                w_rfifo_activate;
wire                w_rfifo_strobe;
wire        [31:0]  w_rfifo_data;
wire        [23:0]  w_rfifo_size;
wire                w_captured;
wire                w_busy;
//NES Wires
wire                  w_console_reset;

//NES Controls
wire          [3:0]   w_mute_control;

reg           [7:0]   r_jp1_state;     //State of joypad 1
reg           [7:0]   r_jp2_state;     //State of joypad 2


//Audio
wire                  w_audio;

//Video Interface
wire          [9:0]   w_image_width;
wire          [9:0]   w_image_height;

wire                  w_hsync;
wire                  w_vsync;
wire          [2:0]   w_red;
wire          [2:0]   w_green;
wire          [1:0]   w_blue;

//HCI Interface
wire                  w_hci_reset;
reg           [7:0]   r_hci_opcode;
reg                   r_hci_opcode_strobe;

wire          [15:0]  w_hci_opcode_status;
reg           [15:0]  r_hci_opcode_status;
wire                  w_hci_opcode_ack;
reg                   r_hci_opcode_new_status;

reg           [15:0]  r_hci_address;
reg           [31:0]  r_hci_count;

reg                   r_hci_din_strobe;
wire                  w_hci_sm_ready;
reg           [7:0]   r_hci_din;

wire                  w_hci_dout_strobe;
reg                   r_hci_host_ready;
wire          [7:0]   w_hci_dout;

wire                  w_flush_memory;
wire                  w_memory_ready;


//Submodules

image_to_ppfifo proc (
  .clk                  (clk                      ),
  .rst                  (rst                      ),
  .i_enable             (w_enable_dma             ),

  .i_hsync              (w_hsync                  ),
  .i_vsync              (w_vsync                  ),
  .i_red                (w_red                    ),
  .i_green              (w_green                  ),
  .i_blue               (w_blue                   ),

  .o_frame_finished     (w_flush_memory           ),

  .o_rfifo_ready        (w_rfifo_ready            ),
  .i_rfifo_activate     (w_rfifo_activate         ),
  .i_rfifo_strobe       (w_rfifo_strobe           ),
  .o_rfifo_data         (w_rfifo_data             ),
  .o_rfifo_size         (w_rfifo_size             )
);

wb_ppfifo_2_mem p2m(

  .clk                  (clk                      ),
  .rst                  (rst  || !w_console_reset ),
  //.debug                (debug                    ),

  //Control
  .i_enable             (w_enable_dma             ),
  .i_flush              (w_flush_memory           ),

  .i_memory_0_base      (r_memory_0_base          ),
  .i_memory_0_size      (r_memory_0_size          ),
  .o_memory_0_count     (w_memory_0_count         ),
  .i_memory_0_ready     (r_memory_0_ready         ),
  .o_memory_0_finished  (w_memory_0_finished      ),
  .o_memory_0_empty     (w_memory_0_empty         ),

  .o_default_mem_0_base (w_default_mem_0_base     ),

  .i_memory_1_base      (r_memory_1_base          ),
  .i_memory_1_size      (r_memory_1_size          ),
  .o_memory_1_count     (w_memory_1_count         ),
  .i_memory_1_ready     (r_memory_1_ready         ),
  .o_memory_1_finished  (w_memory_1_finished      ),
  .o_memory_1_empty     (w_memory_1_empty         ),

  .o_default_mem_1_base (w_default_mem_1_base     ),

  .o_write_finished     (w_write_finished         ),

  //master control signal for memory arbitration
  .o_mem_we             (mem_o_we                 ),
  .o_mem_stb            (mem_o_stb                ),
  .o_mem_cyc            (mem_o_cyc                ),
  .o_mem_sel            (mem_o_sel                ),
  .o_mem_adr            (mem_o_adr                ),
  .o_mem_dat            (mem_o_dat                ),
  .i_mem_dat            (mem_i_dat                ),
  .i_mem_ack            (mem_i_ack                ),
  .i_mem_int            (mem_i_int                ),

  //Ping Pong FIFO Interface (Read)
  .i_ppfifo_rdy         (w_rfifo_ready            ),
  .o_ppfifo_act         (w_rfifo_activate         ),
  .i_ppfifo_size        (w_rfifo_size             ),
  .o_ppfifo_stb         (w_rfifo_strobe           ),
  .i_ppfifo_data        (w_rfifo_data             )
);


/*
nes_clkgen clkgen (
	.clk                 (clk                 ),
	.rst                 (rst                 ),

	.locked              (clk_locked          ),
	//.phy_out_clk         (phy_out_clk         ),
	.out_clk             (nes_clk             )
);
*/

nes_top nes(
//  .clk          (nes_clk             ),
  .clk                  (clk                 ),
  .rst                  (rst                 ),
  //.RXD                 (rxd                 ),
  //.TXD                 (txd                 ),
  .i_console_reset      (w_console_reset     ),
  .i_mute_control       (w_mute_control      ),

  .i_jp1_state          (r_jp1_state         ),
  .i_jp2_state          (r_jp2_state         ),

  .o_audio              (w_audio             ),

  .o_image_width        (w_image_width       ),
  .o_image_height       (w_image_height      ),
  .o_hsync              (w_hsync             ),
  .o_vsync              (w_vsync             ),
  .o_red                (w_red               ),
  .o_green              (w_green             ),
  .o_blue               (w_blue              ),

  //HCI Interface
  .i_hci_reset          (w_hci_reset         ),
  .i_hci_opcode         (r_hci_opcode        ),
  .i_hci_opcode_strobe  (r_hci_opcode_strobe ),

  .o_hci_opcode_status  (w_hci_opcode_status ),
  .o_hci_opcode_ack     (w_hci_opcode_ack    ),

  .i_hci_address        (r_hci_address       ),
  .i_hci_count          (r_hci_count         ),

  .i_hci_data_strobe    (r_hci_din_strobe    ),
  .o_hci_sm_ready       (w_hci_sm_ready      ),
  .i_hci_data           (r_hci_din           ),

  .o_hci_data_strobe    (w_hci_dout_strobe   ),
  .i_hci_host_ready     (r_hci_host_ready    ),
  .o_hci_data           (w_hci_dout          )
);

//Asynchronous Logic
//assign  status[STATUS_CLOCK_LOCKED]               = clk_locked;
assign  status[STATUS_CLOCK_LOCKED]               = 1'b0;
assign  status[STATUS_HCI_READY]                  = w_hci_sm_ready;
assign  status[STATUS_HCI_NEW_STATUS]             = r_hci_opcode_new_status;
assign  status[STATUS_HCI_S_TOP:STATUS_HCI_S_BOT] = r_hci_opcode_status;
assign  status[15:3]                              = 0;

assign  dma_status[3:0]                           = {
                                                      (r_memory_1_size == 0),
                                                      (r_memory_0_size == 0),
                                                       w_memory_1_finished,
                                                       w_memory_0_finished
                                                    };
assign w_memory_ready                             = (!w_memory_0_empty) || (!w_memory_1_empty);


assign  w_hci_reset                               = control[CONTROL_HCI_RESET];
assign  w_console_reset                           = control[CONTROL_CONSOLE_RESET];
assign  w_enable_dma                              = control[CONTROL_ENABLE_DMA];
assign  w_mute_control                            = 4'h0;

//Synchronous Logic
always @ (posedge clk) begin
  if (rst || !w_enable_dma || o_wbs_int) begin
    o_wbs_int           <= 0;
  end
  else begin
    if (w_memory_0_finished || w_memory_1_finished) begin
      o_wbs_int         <= 1;
    end
    else if (!w_memory_0_finished && !w_memory_1_finished) begin
      o_wbs_int         <= 0;
    end
  end
end

always @ (posedge clk) begin
  if (rst) begin
    o_wbs_dat           <= 32'h0;
    o_wbs_ack           <= 0;

    //HCI
    r_hci_address       <=  0;
    r_hci_count         <=  0;

    r_hci_opcode_status <=  0;
    r_hci_opcode        <=  0;
    r_hci_opcode_strobe <=  0;

    r_hci_din_strobe    <=  0;
    r_hci_din           <=  0;

    //Control
    control             <=  0;

    r_jp1_state         <=  0;
    r_jp2_state         <=  0;

    //DMA Controller
    //Default base, user can change this from the API
    r_memory_0_base     <=  w_default_mem_0_base;
    r_memory_1_base     <=  w_default_mem_1_base;

    //Nothing in the memory initially
    r_memory_0_size     <=  0;
    r_memory_1_size     <=  0;

    r_memory_0_ready    <=  0;
    r_memory_1_ready    <=  0;


  end
  else begin
    r_hci_opcode_strobe <=  0;
    r_hci_din_strobe    <=  0;
    r_hci_host_ready    <=  0;

    r_memory_0_ready    <=  0;
    r_memory_1_ready    <=  0;



    //when the master acks our ack, then put our ack down
    if (o_wbs_ack && ~i_wbs_stb)begin
      o_wbs_ack <= 0;
      if (i_wbs_adr == STATUS) begin
        r_hci_opcode_new_status <= 0;
      end
    end

    if (i_wbs_stb && i_wbs_cyc) begin
      //master is requesting somethign
      if (!o_wbs_ack) begin
        if (i_wbs_we) begin
          //write request
          case (i_wbs_adr)
            CONTROL: begin
              control                 <=  i_wbs_dat;
              o_wbs_ack               <= 1;
            end
            //STATUS
            USER_INPUT: begin
              //Need to make the 32-bit values to joypad locations
              r_jp1_state             <=  i_wbs_dat[7:0];
              r_jp2_state             <=  i_wbs_dat[15:8];
              o_wbs_ack               <= 1;
            end
            HCI_OPCODE_COUNT: begin
              r_hci_count             <= i_wbs_dat;
              o_wbs_ack               <= 1;
            end
            HCI_OPCODE_ADDR: begin
              r_hci_address           <= i_wbs_dat;
              o_wbs_ack               <= 1;
            end
            HCI_OPCODE: begin
              r_hci_opcode            <= i_wbs_dat;
              r_hci_opcode_strobe     <= 1;
              o_wbs_ack               <= 1;
            end
            HCI_OPCODE_DATA: begin
              r_hci_din               <=  i_wbs_dat[7:0];
              if (w_hci_sm_ready) begin
                r_hci_din_strobe      <= 1;
                o_wbs_ack             <= 1;
              end
            end
            REG_MEM_0_BASE: begin
              r_memory_0_base         <=  i_wbs_dat;
              o_wbs_ack               <= 1;
            end
            REG_MEM_0_SIZE: begin
              r_memory_0_size         <=  i_wbs_dat;
              if (i_wbs_dat > 0) begin
                r_memory_0_ready      <=  1;
              end
              o_wbs_ack               <= 1;
            end
            REG_MEM_1_BASE: begin
              r_memory_1_base         <=  i_wbs_dat;
              o_wbs_ack               <= 1;
            end
            REG_MEM_1_SIZE: begin
              r_memory_1_size         <=  i_wbs_dat;
              if (i_wbs_dat > 0) begin
                r_memory_1_ready      <=  1;
              end
              o_wbs_ack               <= 1;
            end
            default: begin
              o_wbs_ack               <= 1;
            end
          endcase
        end
        else begin
          //read request
          case (i_wbs_adr)
            CONTROL: begin
              o_wbs_dat               <=  control;
              o_wbs_ack               <= 1;
            end
            STATUS: begin
              o_wbs_dat               <= status;
              o_wbs_ack               <= 1;
            end
            //USER_INPUT
            HCI_OPCODE_COUNT: begin
              o_wbs_dat               <= r_hci_count;
              o_wbs_ack               <= 1;
            end

            //Host Controller Interface
            HCI_OPCODE_ADDR: begin
              o_wbs_dat               <= r_hci_address;
              o_wbs_ack               <= 1;
            end
            HCI_OPCODE: begin
              o_wbs_dat               <= r_hci_opcode;
              o_wbs_ack               <= 1;
            end
            HCI_OPCODE_DATA: begin
              r_hci_host_ready        <=  1;
              if (w_hci_dout_strobe) begin
                o_wbs_dat             <= {24'h000000, w_hci_dout};
                o_wbs_ack             <= 1;
              end
            end

            //DMA Registers
            DMA_STATUS: begin
              o_wbs_dat             <=  {28'h0000000, dma_status};
              if (w_memory_0_finished) begin
                $display ("Reset size 0");
                r_memory_0_size     <=  0;
              end
              if (w_memory_1_finished) begin
                $display ("Reset size 1");
                r_memory_1_size     <=  0;
              end
              o_wbs_ack             <= 1;
            end
            REG_MEM_0_BASE: begin
              o_wbs_dat <=  r_memory_0_base;
              o_wbs_ack             <= 1;
            end
            REG_MEM_0_SIZE: begin
              o_wbs_dat <=  w_memory_0_count;
              o_wbs_ack             <= 1;
            end
            REG_MEM_1_BASE: begin
              o_wbs_dat <=  r_memory_1_base;
              o_wbs_ack             <= 1;
            end
            REG_MEM_1_SIZE: begin
              o_wbs_dat <=  w_memory_1_count;
              o_wbs_ack             <= 1;
            end
            REG_IMAGE_WIDTH: begin
              o_wbs_dat <=  w_image_width;
              o_wbs_ack             <= 1;
            end
            REG_IMAGE_HEIGHT: begin
              o_wbs_dat <=  w_image_height;
              o_wbs_ack             <= 1;
            end

            default: begin
              o_wbs_ack             <= 1;
            end
          endcase
        end
      end //!o_wbs_ack
    end
    if (w_hci_opcode_ack) begin
      r_hci_opcode_status <= w_hci_opcode_status;
    end
  end
end

endmodule
