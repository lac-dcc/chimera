module vo(
    input wire          vo_clk,
    input wire          vo_reset_,

    input wire          in_vsync,
    input wire          in_req,
    input wire          in_eol,
    input wire          in_eof,
    input wire [23:0]   in_pixel,

    output reg          vo_blank_,
    output reg          vo_vsync,
    output reg          vo_hsync,
    output reg [7:0]    vo_r,
    output reg [7:0]    vo_g,
    output reg [7:0]    vo_b
    );

`include "video_timings.v"

    reg [11:0] h_cntr;
    reg [10:0] v_cntr;

    always @(posedge vo_clk) begin
        if (in_req && in_eof) begin
            h_cntr  <= 0;
            v_cntr  <= 0;
        end
        else if (h_cntr == h_total-1) begin
                h_cntr  <= 0;
                v_cntr  <= v_cntr + 1;
        end
        else begin
            h_cntr  <= h_cntr + 1;
        end
    
        if (!vo_reset_) begin
            h_cntr  <= 0;
            v_cntr  <= 0;
        end
    end

    wire vo_blank;
    assign vo_blank = (v_cntr < v_blank) || (h_cntr < h_blank);

	always @(posedge vo_clk) begin
        vo_blank_ <= !vo_blank;
		vo_hsync  <= (h_cntr >= h_fp) && (h_cntr < (h_fp + h_sync)) ^ !(h_sync_positive);
		vo_vsync  <= (v_cntr >= v_fp) && (v_cntr < (v_fp + v_sync)) ^ !(v_sync_positive);

		vo_r <= vo_blank ? 8'd0 : in_pixel[ 7: 0];
		vo_g <= vo_blank ? 8'd0 : in_pixel[15: 8];
		vo_b <= vo_blank ? 8'd0 : in_pixel[23:16];
	end

endmodule
