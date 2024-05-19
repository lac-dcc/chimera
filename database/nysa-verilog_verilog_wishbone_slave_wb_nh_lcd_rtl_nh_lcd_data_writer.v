// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

`include "nh_lcd_defines.v"

module nh_lcd_data_writer#(
  parameter           BUFFER_SIZE = 12
)(
  input               rst,
  input               clk,

  output      [31:0]  debug,

  //Control
  input               i_enable,
  input       [31:0]  i_num_pixels,
  input               i_enable_tearing,

  //FIFO Signals
  output      [1:0]   o_fifo_rdy,
  input       [1:0]   i_fifo_act,
  input               i_fifo_stb,
  output      [23:0]  o_fifo_size,
  input       [31:0]  i_fifo_data,

  //Physical Signals
  output              o_cmd_mode,
  output      [7:0]   o_data_out,
  input       [7:0]   i_data_in,
  output              o_write,
  output              o_read,
  output              o_data_out_en,
  input               i_tearing_effect
);

//Local Parameters
localparam  IDLE                = 4'h0;
localparam  WRITE_ADDRESS       = 4'h1;
localparam  WRITE_RED_START     = 4'h2;
localparam  WRITE_RED           = 4'h3;
localparam  WRITE_GREEN_START   = 4'h4;
localparam  WRITE_GREEN         = 4'h5;
localparam  WRITE_BLUE_START    = 4'h6;
localparam  WRITE_BLUE          = 4'h7;

//Registers/Wires
reg           [3:0]   state;

wire          [7:0]   w_red;
wire          [7:0]   w_green;
wire          [7:0]   w_blue;

reg                   r_read_stb;
wire                  w_read_rdy;
reg                   r_read_act;
wire          [23:0]  w_read_size;
wire          [31:0]  w_read_data;

reg           [23:0]  r_read_count;
reg           [31:0]  r_pixel_count;


//Tear Mode select
reg                   r_write;
reg                   r_read;
reg                   r_cmd_mode;
reg                   r_data_out_en;
reg           [7:0]   r_data_out;

//Tear control


//Submodules
//generate a Ping Pong FIFO to cross the clock domain
ppfifo #(
  .DATA_WIDTH(32),
`ifndef SIMULATION
  .ADDRESS_WIDTH(BUFFER_SIZE)
`else
  .ADDRESS_WIDTH(2)
`endif
)ping_pong (

  .reset           (rst               ),

  //write
  .write_clock     (clk               ),
  .write_ready     (o_fifo_rdy        ),
  .write_activate  (i_fifo_act        ),
  .write_fifo_size (o_fifo_size       ),
  .write_strobe    (i_fifo_stb        ),
  .write_data      (i_fifo_data       ),

  //.starved         (starved           ),

  //read
  .read_clock      (clk               ),
  .read_strobe     (r_read_stb        ),
  .read_ready      (w_read_rdy        ),
  .read_activate   (r_read_act        ),
  .read_count      (w_read_size       ),
  .read_data       (w_read_data       )
);

//Asynchronous Logic
//assign  w_red   = w_read_data[23:16];
//assign  w_green = w_read_data[15:8];
//assign  w_blue  = w_read_data[7:0];

assign  w_red   = w_read_data[31:24];
assign  w_green = w_read_data[23:16];
assign  w_blue  = w_read_data[15:8];

assign  o_cmd_mode      = r_cmd_mode;
assign  o_data_out      = r_data_out;
assign  o_write         = r_write;
assign  o_read          = r_read;
assign  o_data_out_en   = r_data_out_en;

assign  debug[0]        = i_enable;
assign  debug[1]        = o_cmd_mode;
assign  debug[2]        = o_write;
assign  debug[3]        = o_read;
assign  debug[11:4]     = o_data_out_en ? o_data_out : i_data_in;
assign  debug[16:13]    = state;
assign  debug[21]       = o_data_out_en;
assign  debug[31:22]    = 10'b0;

//Synchronous Logic
always @ (posedge clk) begin
  if (rst) begin
    state               <=  IDLE;

    //Control of Physical lines
    r_data_out          <=  0;
    r_write             <=  0;
    r_read              <=  0;
    r_cmd_mode          <=  1;
    r_data_out_en       <=  1;

    r_read_count        <=  0;
    r_read_stb          <=  0;
    r_read_act          <=  0;
    r_pixel_count       <=  0;
  end
  else begin
    //Strobes
    r_write             <=  0;
    r_read_stb          <=  0;
    r_cmd_mode          <=  1;

    //Get a ping pong FIFO
    if (w_read_rdy && !r_read_act) begin
      r_read_count      <=  0;
      r_read_act        <=  1;
    end

    case (state)
      IDLE: begin
        if (i_enable) begin
          if (r_read_act) begin
            if (r_pixel_count >= i_num_pixels) begin
                r_pixel_count   <=  0;
            end
            else if (r_pixel_count == 0) begin
              //Start a transaction
              //we are at the start of an image transaction
              if (i_tearing_effect) begin
                //We are at the beginning of a Frame, need to start writing to the
                //first address
                r_cmd_mode      <=  0;
                r_write         <=  1;
                r_data_out      <=  `CMD_START_MEM_WRITE;
                state           <=  WRITE_ADDRESS;
              end
            end
            else begin
                state           <=  WRITE_RED_START;
            end
          end
        end
        else begin
            r_pixel_count       <= 0;
        end
      end
      WRITE_ADDRESS: begin
        state               <=  WRITE_RED_START;
      end
      WRITE_RED_START: begin
        r_write             <=  1;
        r_data_out          <=  w_red[7:0];
        state               <=  WRITE_RED;
      end
      WRITE_RED: begin
        state               <=  WRITE_GREEN_START;
      end
      WRITE_GREEN_START: begin
        r_write             <=  1;
        r_data_out          <=  w_green[7:0];
        state               <=  WRITE_GREEN;
      end
      WRITE_GREEN: begin
        state               <=  WRITE_BLUE_START;
      end
      WRITE_BLUE_START: begin
        if (r_read_count < w_read_size - 1) begin
          r_read_stb        <=  1;
        end
        r_write             <=  1;
        r_data_out          <=  w_blue[7:0];
        state               <=  WRITE_BLUE;
      end
      WRITE_BLUE: begin
        r_pixel_count       <=  r_pixel_count + 1;
        if (r_read_count < w_read_size - 1) begin
          r_read_count      <=  r_read_count + 1;
          state             <=  WRITE_RED_START;
        end
        else begin
          r_read_act        <=  0;
          state             <=  IDLE;
        end
      end
    endcase
  end
end
endmodule
