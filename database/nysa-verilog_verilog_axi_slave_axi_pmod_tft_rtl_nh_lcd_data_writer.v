// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

`include "nh_lcd_defines.v"

module nh_lcd_data_writer#(
  parameter           DATAS_WIDTH = 24,
  parameter           BUFFER_SIZE = 12
)(
  input                           rst,
  input                           clk,

  output      [31:0]              debug,

  //Control
  input                           i_enable,
  input       [31:0]              i_image_width,
  input       [31:0]              i_image_height,
  input                           i_enable_tearing,

  //FIFO Signals
  input                           i_fifo_clk,
  input                           i_fifo_rst,
  output      [1:0]               o_fifo_rdy,
  input       [1:0]               i_fifo_act,
  input                           i_fifo_stb,
  output      [23:0]              o_fifo_size,
  input       [DATAS_WIDTH:0]     i_fifo_data,

  //Physical Signals
  output                          o_cmd_mode,
  output  reg [7:0]               o_data_out,
  input       [7:0]               i_data_in,
  output                          o_write,
  output                          o_read,
  output                          o_data_out_en,
  input                           i_tearing_effect,

  input                           i_tp_red,
  input                           i_tp_green,
  input                           i_tp_blue
);

//Local Parameters
localparam  IDLE                = 4'h0;
localparam  WRITE_ADDRESS       = 4'h1;
localparam  WRITE_ADDRESS_DELAY = 4'h2;
localparam  WRITE_RED_START     = 4'h3;
localparam  WRITE_RED           = 4'h4;
localparam  WRITE_GREEN_START   = 4'h5;
localparam  WRITE_GREEN         = 4'h6;
localparam  WRITE_BLUE_START    = 4'h7;
localparam  WRITE_BLUE          = 4'h8;
localparam  WAIT_FOR_TEAR_FIN   = 4'h9;

//Registers/Wires
reg           [3:0]   state;

reg           [7:0]   r_red;
reg           [7:0]   r_green;
reg           [7:0]   r_blue;

wire                  w_read_stb;
wire                  w_read_rdy;
reg                   r_read_act;
wire          [23:0]  w_read_size;
reg           [23:0]  r_read_count;
wire          [24:0]  w_read_data;

reg           [31:0]  r_line_count;
reg                   r_pixel_stb;
wire                  w_pixel_rdy;


//Tear Mode select
reg                   r_write;
reg                   r_cmd_mode;
reg                   r_wait_for_tear;

reg                   r_last;

//Tear control


//Submodules
//generate a Ping Pong FIFO to cross the clock domain
ppfifo #(
  .DATA_WIDTH       (DATAS_WIDTH + 1  ),
  .ADDRESS_WIDTH    (BUFFER_SIZE      )
)ping_pong (

  .reset           (rst || i_fifo_rst ),

  //write
  .write_clock     (i_fifo_clk        ),
  .write_ready     (o_fifo_rdy        ),
  .write_activate  (i_fifo_act        ),
  .write_fifo_size (o_fifo_size       ),
  .write_strobe    (i_fifo_stb        ),
  .write_data      (i_fifo_data       ),

  //.starved         (starved           ),

  //read
  .read_clock      (clk               ),
  .read_strobe     (w_read_stb        ),
  .read_ready      (w_read_rdy        ),
  .read_activate   (r_read_act        ),
  .read_count      (w_read_size       ),
  .read_data       (w_read_data       )
);

//Asynchronous Logic
assign  o_cmd_mode      = r_cmd_mode;
assign  o_write         = r_write;
assign  o_read          = 0;
assign  o_data_out_en   = 1;

assign  debug[0]        = i_enable;
assign  debug[1]        = o_cmd_mode;
assign  debug[2]        = o_write;
assign  debug[3]        = o_read;
//assign  debug[11:4]     = o_data_out_en ? o_data_out : i_data_in;
assign  debug[16:13]    = state;
assign  debug[21]       = o_data_out_en;
assign  debug[31:22]    = 10'b0;
assign  w_pixel_rdy     = r_read_act;
assign  w_read_stb      = r_pixel_stb;

//assign  r_red           = w_read_data[23:16];
//assign  r_green         = w_read_data[15: 8];
//assign  r_blue          = w_read_data[ 7: 0];
//assign  r_last          = w_read_data[24];

always @ (posedge clk) begin
  if (rst) begin
    r_read_count        <=  0;
    r_red               <=  0; 
    r_green             <=  0; 
    r_blue              <=  0; 
    r_last              <=  0; 
    r_read_act          <=  0;
  end
  else begin
    if (w_read_rdy && !r_read_act) begin
      r_read_act        <=  1;
      r_read_count      <=  0;
    end
    else if (r_read_act) begin
      if (r_read_count < w_read_size) begin
        if (w_read_stb) begin 
          r_read_count  <=  r_read_count + 1;
          r_red         <= w_read_data[23:16];
          r_green       <= w_read_data[15: 8];
          r_blue        <= w_read_data[ 7: 0];
          r_last        <= w_read_data[24];
        end
      end
      else begin
        r_read_act      <=  0;
      end
    end
  end
end

//Synchronous Logic
always @ (posedge clk) begin
  //De-assert strobes
  r_write               <=  0;
  r_cmd_mode            <=  1;
  r_pixel_stb           <=  0;
  if (rst) begin
    state               <=  IDLE;

    //Control of Physical lines
    r_line_count        <=  0;
    o_data_out          <=  `CMD_START_MEM_WRITE;
  end
  else begin
    //Strobes

    //Get a ping pong FIFO
    case (state)
      IDLE: begin
        o_data_out      <=  `CMD_START_MEM_WRITE;
        if (i_enable) begin

          if (w_pixel_rdy) begin
            if (r_line_count == 0) begin
              //Start a transaction
              //we are at the start of an image transaction
              if (i_tearing_effect) begin
                //We are at the beginning of a Frame, need to start writing to the
                //first address
                r_pixel_stb       <=  1;
                r_cmd_mode        <=  0;
                r_write           <=  1;
                state             <=  WRITE_ADDRESS;
              end
            end
            else if (r_line_count > 0) begin
                //Give it a clock to read the data
                state             <=  WRITE_ADDRESS;
                r_pixel_stb       <=  1;
            end
          end
        end
      end
      WRITE_ADDRESS: begin
        state               <=  WRITE_ADDRESS_DELAY;
      end
      WRITE_ADDRESS_DELAY: begin
        state               <=  WRITE_RED_START;
      end
      WRITE_RED_START: begin
        r_write             <=  1;
        state               <=  WRITE_RED;
        o_data_out          <=  r_red;
      end
      WRITE_RED: begin
        state               <=  WRITE_GREEN_START;
      end
      WRITE_GREEN_START: begin
        r_write             <=  1;
        state               <=  WRITE_GREEN;
        o_data_out          <=  r_green;
      end
      WRITE_GREEN: begin
        state               <=  WRITE_BLUE_START;
      end
      WRITE_BLUE_START: begin
        r_write             <=  1;
        o_data_out          <=  r_blue;
        if (r_last) begin
          //Finished a line
          if (r_line_count < (i_image_height - 1)) begin
            r_line_count    <=  r_line_count + 1;
            state           <=  IDLE;
          end
          else begin
            state           <=  WAIT_FOR_TEAR_FIN;
          end
        end
        else if (w_pixel_rdy) begin
          r_pixel_stb       <=  1;
          state             <=  WRITE_BLUE;
        end
        else begin
          state             <=  IDLE;
        end
      end
      WRITE_BLUE: begin
          state             <=  WRITE_RED_START;
      end
      WAIT_FOR_TEAR_FIN: begin
        if (!i_tearing_effect) begin
          r_line_count      <=  0;
          state             <=  IDLE;
        end
      end
    endcase
  end
end
endmodule
