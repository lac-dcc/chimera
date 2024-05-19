// This program was cloned from: https://github.com/YutongChenVictor/Fpga-accelerator-demos
// License: MIT License

module vga(
    input           clk         ,
    input           rst_n       ,

    input   [23:0]  data        ,

    output          hs          ,
    output          vs          ,

    output  [ 9:0]  x_pix       ,
    output  [ 9:0]  y_pix       ,
	
    output  [23:0]  color_rgb
);

parameter   h_sync = 'd96   ;
parameter   h_back = 'd40   ;
parameter   h_left = 'd8    ;
parameter   h_vali = 'd640  ;
parameter   h_righ = 'd8    ;
parameter   h_fron = 'd8    ;
parameter   h_peri = 'd800  ;

parameter   v_sync = 'd2    ;
parameter   v_back = 'd25   ;
parameter   v_topb = 'd8    ;
parameter   v_vali = 'd480  ;
parameter   v_unde = 'd8    ;
parameter   v_fron = 'd2    ;
parameter   v_peri = 'd525  ;

reg     [9:0]   v_count     ;
reg     [9:0]   h_count     ;

wire            h_en        ;
wire            v_en        ;

always @ (posedge clk or negedge rst_n)begin
    if (!rst_n)begin
        h_count <= 10'd0;
        v_count <= 10'd0;
    end
    else if(h_count < h_peri)
        h_count <= h_count + 1'b1;
    else begin
        h_count <= 10'd0;
        if (v_count < v_peri)
            v_count <= v_count + 1'b1;
        else
            v_count <= 10'd0;
    end
end

assign hs = (h_count > 'd0 && h_count < h_sync) ? 1'b0 : 1'b1;
assign vs = (v_count > 'd0 && v_count < v_sync) ? 1'b0 : 1'b1;

assign h_en = (h_count > h_sync + h_back + h_left && h_count < h_sync + h_back + h_left + h_vali) ? 1'b1 : 1'b0;
assign v_en = (v_count > v_sync + v_back + v_topb && v_count < v_sync + v_back + v_topb + v_vali) ? 1'b1 : 1'b0;

assign x_pix = h_en ? h_count - h_sync - h_back - h_left : 10'b0;
assign y_pix = v_en ? v_count - v_sync - v_back - v_topb : 10'b0;

assign color_rgb = h_en && v_en ? data : 24'd0;
endmodule
