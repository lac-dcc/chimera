// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

module sf_camera_reader #(
  parameter BUFFER_SIZE = 12
)(
input                 clk,
input                 rst,

output      [31:0]    debug,

input                 i_camera_reset,
input                 i_clk_locked,
input                 i_memory_ready,
input                 i_image_debug_en,
output                o_inactive,

//Configuration Registers
input                 i_enable,
input                 i_reset_counts,
output                o_captured,
output  reg           o_busy,
output  reg [31:0]    o_pixel_count,
output  reg [31:0]    o_row_count,

//Physical Interface
input                 i_pix_clk,
input                 i_vsync,
input                 i_hsync,
input       [7:0]     i_pix_data,

//Memory FIFO Interface
output                o_rfifo_ready,
input                 i_rfifo_activate,
input                 i_rfifo_strobe,
output      [31:0]    o_rfifo_data,
output      [23:0]    o_rfifo_size

);

//Local Parameters
localparam  IDLE            = 0;
localparam  CAPTURE         = 1;
localparam  READ_HORIZONTAL = 2;
localparam  SEND_TO_MEM     = 3;
localparam  IMAGE_CAPTURED  = 4;

//Registers/Wires
reg   [3:0]           state;


//ppfifo interface
wire  [1:0]           w_write_ready;
reg   [1:0]           r_write_activate;
wire  [23:0]          w_write_fifo_size;
reg                   r_write_strobe;
reg   [23:0]          r_write_count;
reg   [1:0]           r_byte_index;
reg   [31:0]          r_write_data;
wire                  w_locked;

reg   [31:0]          r_pix_count;
reg   [31:0]          r_pix_per_line;
reg   [31:0]          r_hcount;

reg   [7:0]           r_byte_data [3:0];
reg                   r_prev_vsync;
reg                   r_pre_write_strobe;

reg                   r_capture_image;
reg                   r_capture_strobe;

wire                  w_inactive;
reg                   r_image_debugger;



//Submodules
cross_clock_strobe ccs(
  .rst              (rst || !i_clk_locked),
  .in_clk           (i_pix_clk          ),
  .in_stb           (r_capture_strobe   ),

  .out_clk          (clk                ),
  .out_stb          (o_captured         )
);

cross_clock_enable cce(
  .rst              (rst || !i_clk_locked),
  .in_en            (w_inactive         ),

  .out_clk          (clk                ),
  .out_en           (o_inactive         )
);

ppfifo # (
  .DATA_WIDTH       (32                 ),
  .ADDRESS_WIDTH    (BUFFER_SIZE        )
)camera_fifo        (

  //universal input
  .reset            (rst || !i_clk_locked),

  //write side
  .write_clock      (i_pix_clk          ),
  .write_ready      (w_write_ready      ),
  .write_activate   (r_write_activate   ),
  .write_fifo_size  (w_write_fifo_size  ),
  .write_strobe     (r_write_strobe     ),
  .write_data       (r_write_data       ),

  .inactive          (w_inactive          ),

  //read side
  .read_clock       (clk                ),
  .read_strobe      (i_rfifo_strobe     ),
  .read_ready       (o_rfifo_ready      ),
  .read_activate    (i_rfifo_activate   ),
  .read_count       (o_rfifo_size       ),
  .read_data        (o_rfifo_data       )
);


//Asynchronous Logic
assign  debug[0]                  = i_enable;
assign  debug[2:1]                = w_write_ready;
assign  debug[4:3]                = r_write_activate;
assign  debug[5]                  = r_write_strobe;
assign  debug[13:6]               = i_pix_data;
assign  debug[14]                 = i_vsync;
assign  debug[15]                 = i_hsync;
assign  debug[16]                 = o_busy;


//Synchronous Logic
always @ (posedge i_pix_clk) begin
  if (!i_camera_reset || !i_clk_locked) begin
    r_write_activate              <=  0;
    r_write_strobe                <=  0;
    r_write_count                 <=  0;
    r_byte_index                  <=  0;
    r_write_data                  <=  0;
    r_pre_write_strobe            <=  0;

    r_byte_data[0]                <=  0;
    r_byte_data[1]                <=  0;
    r_byte_data[2]                <=  0;
    r_byte_data[3]                <=  0;

    r_hcount                      <=  0;
    r_capture_strobe              <=  0;
    o_busy                        <=  0;

    r_capture_image               <=  0;
    r_image_debugger              <=  0;

  end
  else begin
    //Strobes
    r_write_strobe                <=  0;
    r_pre_write_strobe            <=  0;
    r_capture_strobe              <=  0;

    //Detect the start of a frame
    //Only attempt to start a frame when we have an active FIFO
    if (i_enable && !r_capture_image && !i_vsync && (r_write_activate > 0) && i_memory_ready) begin
      r_capture_image             <=  1;
      r_image_debugger            <=  ~r_image_debugger;
    end
    else if (!i_vsync && !i_memory_ready) begin
      r_capture_image             <=  0;
      r_image_debugger            <=  ~r_image_debugger;
    end

    if (i_vsync) begin
      o_busy                      <=  1;
    end
    else if (o_busy && w_inactive && r_capture_image) begin
      o_busy                      <=  0;
      r_capture_strobe            <=  1;
      r_hcount                    <=  0;
      r_capture_image             <=  0;
    end
    if (r_pre_write_strobe) begin
        r_write_strobe            <=  1;
    end

    //Get an empty FIFO
    if ((w_write_ready > 0) && (r_write_activate == 0)) begin
      r_byte_index                <=  0;
      r_write_count               <=  0;

      r_byte_data[0]              <=  0;
      r_byte_data[1]              <=  0;
      r_byte_data[2]              <=  0;
      r_byte_data[3]              <=  0;

      if (w_write_ready[0]) begin
        r_write_activate[0]       <=  1;
      end
      else begin
        r_write_activate[1]       <=  1;
      end
    end

    //Capture Pixels when hsync is high
    if (i_enable && (r_write_activate > 0) && r_capture_image) begin
      if (i_hsync && i_vsync) begin
        r_byte_data[r_byte_index]   <=  i_pix_data;
        if (r_byte_index == 3)begin
          //if we hit the double word boundary send this peice of data to the
          //FIFO
          r_write_count               <=  r_write_count + 1;
          if (i_image_debug_en) begin
            if (r_image_debugger) begin
              if (r_write_count == 0) begin
                r_write_data            <=  32'h001F001F;
              end
              else begin
                r_write_data            <=  32'h07D007D0;
              end
            end
            else begin
              if (r_write_count == 0) begin
                r_write_data            <=  32'hFFFFFFFF;
              end
              else begin
                r_write_data            <=  32'hF800F800;
              end
            end
          end
          else begin
            r_write_data                <=  {r_byte_data[0], r_byte_data[1], r_byte_data[2], i_pix_data};
          end
          r_pre_write_strobe          <=  1;
          r_byte_index                <=  0;
        end
        else begin
          r_byte_index                <=  r_byte_index + 1;
        end
      end
      else begin
        //if the hsync line is low we are done with a line capture
        if (!r_pre_write_strobe && !r_write_strobe && (r_write_activate > 0) && (r_write_count > 0)) begin
          r_hcount                  <=  r_hcount + 1;
          r_byte_index              <=  0;
          r_write_activate          <=  0;
          r_write_count             <=  0;
        end
      end
    end
  end
end

reg   [31:0]      r_row_count;
reg   [31:0]      r_pixel_count;
always @ (posedge i_pix_clk) begin
  if (!i_camera_reset || !i_clk_locked) begin
    r_row_count                     <=  0;
    o_row_count                     <=  0;
    r_pixel_count                   <=  0;
    o_pixel_count                   <=  0;

  end
  else begin
    if (i_reset_counts) begin
      o_pixel_count                 <=  0;
      o_row_count                   <=  0;
    end

    if (!i_vsync) begin
      if ((r_row_count > 0) && (r_row_count > o_row_count)) begin
        o_row_count                 <=  r_row_count;
      end
      r_row_count                   <=  0;
    end

    if (!i_hsync) begin
      if (r_pixel_count > 0) begin
        o_pixel_count               <=  r_pixel_count;
        r_row_count                 <=  r_row_count + 1;
      end
      r_pixel_count                 <=  0;
    end
    else begin
      r_pixel_count                 <=  r_pixel_count + 1;
    end
  end
end

endmodule
