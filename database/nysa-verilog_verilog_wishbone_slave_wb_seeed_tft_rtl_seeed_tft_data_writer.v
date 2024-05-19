// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

`include "seeed_tft_defines.v"

module seeed_tft_data_writer#(
  parameter           BUFFER_SIZE = 12
)(
  input               rst,
  input               clk,

  output      [31:0]  debug,

  input               i_soft_tearing,
  input       [7:0]   i_tearing_reg,
  input               i_tearing_polarity,
  input       [31:0]  i_tearing_value,
  input       [31:0]  i_tearing_count,
  input       [7:0]   i_mem_write_cmd,

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
  input               i_tearing_effect,
  output              o_chip_select,
  output              o_cmd_mode,
  output      [7:0]   o_data_out,
  input       [7:0]   i_data_in,
  output              o_write,
  output              o_read,
  output              o_data_out_en
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

localparam  TEARING_WRITE_DELAY = 4'h1;
localparam  GET_TEARING         = 4'h2;
localparam  READ_TEAR_STATUS    = 4'h3;
localparam  TEARING_FINISHED    = 4'h4;

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
wire                  w_hard_tear_ready;

reg           [23:0]  r_read_count;
reg           [31:0]  r_pixel_count;

reg           [2:0]   r_delay_count;
wire                  w_delayed;


//Tear Mode select
reg           [3:0]   tstate;
reg                   r_tmode;

reg                   r_write;
reg                   r_read;
reg                   r_chip_select;
reg                   r_cmd_mode;
reg                   r_data_out_en;
reg           [7:0]   r_data_out;

reg                   r_twrite;
reg                   r_tdata_out_en;
reg                   r_tread;
reg                   r_tchip_select;
reg                   r_tcmd_mode;
reg           [1:0]   r_tdata_count;
reg           [7:0]   r_tdata_out;
reg           [31:0]  r_tdata;

reg                   r_finished_image;
reg           [2:0]   r_tdelay_count;
wire                  w_tdelayed;


//Tear control


//Submodules
//generate a Ping Pong FIFO to cross the clock domain
ppfifo #(
  .DATA_WIDTH       (32                 ),
`ifndef SIMULATION
  .ADDRESS_WIDTH    (BUFFER_SIZE        )
`else
  .ADDRESS_WIDTH    (2                  )
`endif
)ping_pong (

  .reset            (rst                ),

  //write
  .write_clock      (clk                ),
  .write_ready      (o_fifo_rdy         ),
  .write_activate   (i_fifo_act         ),
  .write_fifo_size  (o_fifo_size        ),
  .write_strobe     (i_fifo_stb         ),
  .write_data       (i_fifo_data        ),

  //.starved          (starved          ),

  //read
  .read_clock       (clk                ),
  .read_strobe      (r_read_stb         ),
  .read_ready       (w_read_rdy         ),
  .read_activate    (r_read_act         ),
  .read_count       (w_read_size        ),
  .read_data        (w_read_data        )
);

//Asynchronous Logic
//assign  w_red   = w_read_data[23:16];
//assign  w_green = w_read_data[15:8];
//assign  w_blue  = w_read_data[7:0];

assign  w_red   = w_read_data[31:24];
assign  w_green = w_read_data[23:16];
assign  w_blue  = w_read_data[15:8];



assign  o_chip_select   = (r_tmode) ? r_tchip_select  : r_chip_select;
assign  o_cmd_mode      = (r_tmode) ? r_tcmd_mode     : r_cmd_mode;
assign  o_data_out      = (r_tmode) ? r_tdata_out     : r_data_out;
assign  o_write         = (r_tmode) ? r_twrite        : r_write;
assign  o_read          = (r_tmode) ? r_tread         : r_read;
assign  o_data_out_en   = (r_tmode) ? r_tdata_out_en  : r_data_out_en;

assign  w_hard_tear_ready = (i_enable_tearing && ! i_soft_tearing && (i_tearing_effect == i_tearing_polarity));

assign  w_delayed       = (r_delay_count >= `DELAY_COUNT);
assign  w_tdelayed      = (r_tdelay_count >= `DELAY_COUNT);

assign  debug[0]        = i_enable;
assign  debug[1]        = o_cmd_mode;
assign  debug[2]        = o_write;
assign  debug[3]        = o_read;
assign  debug[11:4]     = o_data_out_en ? o_data_out : i_data_in;
assign  debug[12]       = r_tmode;
assign  debug[16:13]    = state;
assign  debug[20:17]    = tstate;
assign  debug[21]       = o_data_out_en;
assign  debug[31:22]    = 10'b0;



//Synchronous Logic
always @ (posedge clk) begin
  if (rst) begin
    state                   <=  IDLE;

    //Control of Physical lines
    r_chip_select           <=  0;
    r_data_out              <=  0;
    r_write                 <=  0;
    r_read                  <=  0;
    r_cmd_mode              <=  1;
    r_data_out_en           <=  1;
                            
    r_read_count            <=  0;
    r_read_stb              <=  0;
    r_read_act              <=  0;
    r_pixel_count           <=  0;
    r_finished_image        <=  0;
    r_delay_count           <=  0;
  end                       
  else begin                
    //Strobes               
    r_finished_image        <=  0;
    r_read_stb              <=  0;

    //Get a ping pong FIFO
    if (w_read_rdy && !r_read_act) begin
      r_read_count          <=  0;
      r_read_act            <=  1;
    end
    if (r_delay_count < `DELAY_COUNT) begin
        r_delay_count       <=  r_delay_count + 1;
    end
    else begin
        r_write             <=  0;
        r_cmd_mode          <=  1;
    end

    case (state)
      IDLE: begin
        //Is there going to be some weird behavior with the state machine
        if ((r_pixel_count >= i_num_pixels) || !i_enable) begin
          r_pixel_count     <=  0;
          r_finished_image  <=  1;
          r_chip_select     <=  0;
        end
        //Start a transaction
        if (i_enable && r_read_act && (!r_tmode || w_hard_tear_ready)) begin
          if (r_pixel_count == 0) begin
            //We are at the beginning of a Frame, need to start writing to the
            //first address
            $display("initiate a LCD MEM write");
            r_chip_select   <=  1;
            r_cmd_mode      <=  0;
            r_write         <=  1;
            r_data_out      <=  i_mem_write_cmd;
            state           <=  WRITE_ADDRESS;
            //r_read_stb      <=  1;
            r_delay_count   <=  0;
          end
          else if (r_read_act) begin
            state           <=  WRITE_RED_START;
            r_delay_count   <=  0;
          end
        end
        //else begin
        //    r_chip_select   <=  0;
        //end
      end
      WRITE_ADDRESS: begin
        if (w_delayed) begin
            state               <=  WRITE_RED_START;

        end
      end
      WRITE_RED_START: begin
        r_write             <=  1;
        r_data_out          <=  {w_red[7:2], 2'b00};
        state               <=  WRITE_RED;
        r_delay_count       <=  0;
      end
      WRITE_RED: begin
        if (w_delayed) begin
            state               <=  WRITE_GREEN_START;
        end
      end
      WRITE_GREEN_START: begin
        r_write             <=  1;
        r_data_out          <=  {w_green[7:2], 2'b00};
        r_delay_count       <=  0;
        state               <=  WRITE_GREEN;
      end
      WRITE_GREEN: begin
        if (w_delayed) begin
            state           <=  WRITE_BLUE_START;
        end
      end
      WRITE_BLUE_START: begin
        if (r_read_count < w_read_size - 1) begin
          r_read_stb        <=  1;
        end

        r_write             <=  1;
        r_data_out          <=  {w_blue[7:2], 2'b00};
        state               <=  WRITE_BLUE;
        r_delay_count       <=  0;
      end
      WRITE_BLUE: begin
        if (w_delayed) begin
          r_delay_count     <=  0;
          r_pixel_count     <=  r_pixel_count + 1;
          if (r_read_count < w_read_size - 1) begin
            r_read_count    <=  r_read_count + 1;
            //r_read_stb      <=  1;
            state           <=  WRITE_RED_START;
          end
          else begin
            //Hard tearing
            if (i_enable_tearing && !i_soft_tearing && !w_hard_tear_ready) begin
              //Wait for hard tearing to be deasserted
              r_read_act    <=  0;
              state         <=  IDLE;
            end
            else if (!i_enable_tearing || i_soft_tearing) begin
              //soft tearing
              r_read_act    <=  0;
              state         <=  IDLE;
            end
          end
        end
      end
    endcase
  end
end


always @ (posedge clk) begin
  if (rst || !i_enable) begin
    tstate                  <=  IDLE;

    if (i_enable_tearing && i_soft_tearing) begin
      r_tmode               <=  1;
    end
    else begin
      r_tmode               <=  0;
    end
    r_tchip_select          <=  0;
    r_tcmd_mode             <=  0;
    r_twrite                <=  0;
    r_tread                 <=  0;
    r_tdata_out_en          <=  0;
    r_tdata_out             <=  i_tearing_reg;
    r_tdata_count           <=  0;
  end
  else begin
    r_twrite                <=  0;
    r_tread                 <=  0;
    r_tcmd_mode             <=  1;    //Default to data mode
    r_tdata_out_en          <=  0;
    r_tdata                 <=  0;
    case (tstate)
      IDLE: begin
        if (i_enable_tearing && i_soft_tearing) begin
          r_tmode           <=  1;
        end
        else begin
          r_tmode           <=  0;
          r_tchip_select    <=  0;
        end
        r_tdata_count       <=  0;
        if (i_enable && r_read_act) begin
          r_tchip_select    <=  1;
          r_tcmd_mode       <=  0;
          r_tdata_out_en    <=  1;
          r_tdata_out       <=  i_tearing_reg;
          r_tdelay_count    <= 0;
          tstate            <=  TEARING_WRITE_DELAY;
          //Output is always to get the tear status
          r_twrite          <=  1;
        end
      end
      TEARING_WRITE_DELAY: begin
        if (w_tdelayed) begin
            tstate          <=  GET_TEARING;
        end
      end
      GET_TEARING: begin
        tstate              <=  READ_TEAR_STATUS;
        r_tread             <=  1;
      end
      READ_TEAR_STATUS: begin
        if (w_tdelayed) begin
            r_tdata               <=  {r_tdata[23:0], i_data_in};
            if (r_tdata_count < i_tearing_count) begin
                r_tdata_count     <= r_tdata_count + 1;
                tstate            <= GET_TEARING;
                r_tdelay_count    <= 0;
            end
            else begin
                tstate            <=  TEARING_FINISHED;
            end
        end
      end
      TEARING_FINISHED: begin
        if (r_tdata == i_tearing_value) begin
          r_tmode           <=  0;
          r_tchip_select    <=  0;
          if (r_finished_image) begin
            tstate          <=  IDLE;
          end
        end
        else begin
          tstate            <=  IDLE;
        end
      end
    endcase
  end
end

endmodule
