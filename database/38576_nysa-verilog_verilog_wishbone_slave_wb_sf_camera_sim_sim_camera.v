// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

module sim_camera (
input               i_cam_in_clk,
input               i_cam_rst,

input               i_flash,

output              o_pix_clk,
output  reg         o_flash_strobe = 0,
output  reg         o_vsync = 0,
output  reg         o_hsync = 0,
output  reg [7:0]   o_pix_data = 0

);

//Local Parameters
localparam          START           = 4'h0;
localparam          INIT            = 4'h1;
localparam          VBLANK          = 4'h2;
localparam          HBLANK          = 4'h3;
localparam          WRITE_ROW       = 4'h4;

localparam          VBLANK_COUNT    = 100;
localparam          HBLANK_COUNT    = 20;

localparam          ROW_COUNT       = 32'h10;
localparam          BYTE_COUNT      = 32'h20;

//Registers/Wires
reg         [31:0]  r_vblank_count  = 0;
reg         [31:0]  r_hblank_count  = 0;

reg         [31:0]  r_byte_count    = 0;
reg         [31:0]  r_row_count     = 0;

reg         [31:0]  r_byte_index    = 0;

reg         [3:0]   state           = START;

wire                w_vblank;
wire                w_hblank;

reg         [7:0]   r_data          = 8'h00;

//Submodules
//Asynchronous Logic
assign  o_pix_clk       = i_cam_in_clk;
assign  w_vblank        = (r_vblank_count < VBLANK_COUNT);
assign  w_hblank        = (r_hblank_count < HBLANK_COUNT);

//Synchronous Logic
always @ (posedge i_cam_in_clk) begin
  if (!i_cam_rst) begin
    o_flash_strobe      <=  0;
    o_vsync             <=  0;
    o_hsync             <=  0;
    o_pix_data          <=  0;

    r_vblank_count      <=  VBLANK_COUNT;
    r_hblank_count      <=  HBLANK_COUNT;

    r_row_count         <=  ROW_COUNT;
    r_byte_count        <=  BYTE_COUNT;

    state               <=  INIT;

    r_data              <=  0;

  end
  else begin
    if (r_vblank_count < VBLANK_COUNT) begin
      r_vblank_count    <=  r_vblank_count + 1;
    end
    if (r_hblank_count < HBLANK_COUNT) begin
      r_hblank_count    <=  r_hblank_count + 1;
    end

    case (state)
      START: begin
      end
      INIT: begin
        o_vsync         <=  0;
        o_hsync         <=  0;

        r_vblank_count  <=  0;
        state           <= VBLANK;
      end
      VBLANK: begin
        o_vsync         <=  0;
        o_hsync         <=  0;
        r_data          <=  0;
        r_byte_count    <=  0;
        r_row_count     <=  0;
        if (!w_vblank) begin
          state         <=  WRITE_ROW;
        end
      end
      HBLANK: begin
        o_vsync         <=  1;
        o_hsync         <=  0;

        r_data          <=  0;
        r_byte_count    <=  0;
        if (!w_hblank) begin
          state         <=  WRITE_ROW;
        end
      end
      WRITE_ROW: begin
        o_vsync         <=  1;
        o_hsync         <=  1;

        if (r_byte_count < BYTE_COUNT) begin
          //Send a byte
          o_pix_data    <=  r_data;
          r_data        <=  r_data + 1;
          r_byte_count  <=  r_byte_count + 1;
        end
        else begin
          //Still more rows to write
          if (r_row_count < ROW_COUNT - 1) begin
            r_hblank_count  <=  0;
            o_hsync         <=  0;
            state           <=  HBLANK;
            r_row_count     <=  r_row_count + 1;
          end
          else begin
            r_vblank_count  <=  0;
            o_vsync         <=  0;
            o_hsync         <=  0;
            state           <=  VBLANK;
          end
        end
      end
    endcase
  end
end

endmodule
