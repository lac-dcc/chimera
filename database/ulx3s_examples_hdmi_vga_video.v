module vga_video (input clk,
              input resetn,
              output reg vga_hsync,
              output reg vga_vsync,
              output reg vga_blank,
              output reg [9:0] h_pos,
              output reg [9:0] v_pos
);
              
            
parameter h_visible = 10'd640;
parameter h_front = 10'd16;
parameter h_sync = 10'd96;
parameter h_back = 10'd44;
parameter h_total = h_visible + h_front + h_sync + h_back;

parameter v_visible = 10'd480;
parameter v_front = 10'd10;
parameter v_sync = 10'd2;
parameter v_back = 10'd31;
parameter v_total = v_visible + v_front + v_sync + v_back;

wire h_active, v_active, visible;

always @(posedge clk) 
begin
  if (resetn == 0) begin
    h_pos <= 10'b0;
    v_pos <= 10'b0;

  end else begin
    //Pixel counters
    if (h_pos == h_total - 1) begin
      h_pos <= 0;
      if (v_pos == v_total - 1) begin
        v_pos <= 0;
      end else begin
        v_pos <= v_pos + 1;
      end
    end else begin
      h_pos <= h_pos + 1;
    end
    vga_blank <= !visible;
    vga_hsync <= !((h_pos >= (h_visible + h_front)) && (h_pos < (h_visible + h_front + h_sync)));
    vga_vsync <= !((v_pos >= (v_visible + v_front)) && (v_pos < (v_visible + v_front + v_sync)));
  end
end

assign h_active = (h_pos < h_visible);
assign v_active = (v_pos < v_visible);
assign visible = h_active && v_active;

endmodule
