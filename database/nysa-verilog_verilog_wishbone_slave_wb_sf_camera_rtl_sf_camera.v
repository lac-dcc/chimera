// This program was cloned from: https://github.com/CospanDesign/nysa-verilog
// License: MIT License

module sf_camera #(
  parameter           BUFFER_SIZE = 12
)(
input                 clk,
input                 rst,

output      [31:0]    debug,

input                 i_camera_reset,
input                 i_auto_flash,
input                 i_manual_flash_on,
input                 i_reset_counts,
input                 i_enable,
input                 i_memory_ready,
output                o_inactive,
input                 i_image_debug_en,

output                o_captured,
output                o_clk_locked,
output                o_busy,
output      [31:0]    o_pixel_count,
output      [31:0]    o_row_count,

//Memory FIFO Interface
output                o_enable_dma,

output                o_rfifo_ready,
input                 i_rfifo_activate,
input                 i_rfifo_strobe,
output      [31:0]    o_rfifo_data,
output      [23:0]    o_rfifo_size,

//Physical Interface
output                o_cam_rst,
output                o_flash,

output                o_cam_in_clk,
input                 i_pix_clk,
input                 i_flash_strobe,
input                 i_vsync,
input                 i_hsync,
input       [7:0]     i_pix_data
);

//Local Parameters
//Registers/Wires
//Submodules

//20MHz Clock Genertors
sf_camera_clk_gen clk_gen(
  .clk              (clk                ),
  .rst              (rst                ),
  .locked           (o_clk_locked       ),
  .phy_out_clk      (o_cam_in_clk       )
);


sf_camera_reader#(
  .BUFFER_SIZE          (BUFFER_SIZE              )
)reader(
  .clk                  (clk                      ),
  .rst                  (rst                      ),

  .debug                (debug                    ),

  .i_camera_reset       (i_camera_reset           ),
  .i_clk_locked         (o_clk_locked             ),
  .i_memory_ready       (i_memory_ready           ),
  .o_inactive           (o_inactive               ),

  //Control
  .i_enable             (i_enable                 ),
  .i_reset_counts       (i_reset_counts           ),
  .i_image_debug_en     (i_image_debug_en         ),

  //Status
  .o_captured           (o_captured               ),
  .o_busy               (o_busy                   ),
  .o_row_count          (o_row_count              ),
  .o_pixel_count        (o_pixel_count            ),

  //Physical Interface
  .i_pix_clk            (i_pix_clk                ),
  .i_vsync              (i_vsync                  ),
  .i_hsync              (i_hsync                  ),
  .i_pix_data           (i_pix_data               ),

  //read
  .i_rfifo_strobe       (i_rfifo_strobe           ),
  .o_rfifo_ready        (o_rfifo_ready            ),
  .i_rfifo_activate     (i_rfifo_activate         ),
  .o_rfifo_size         (o_rfifo_size             ),
  .o_rfifo_data         (o_rfifo_data             )
);

//Asynchronous Logic
assign  o_flash             = (i_auto_flash) ? i_flash_strobe:
                                               i_manual_flash_on;
assign  o_cam_rst           = i_camera_reset;


//Synchronous Logic

endmodule
