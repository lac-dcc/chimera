
module vi_gen(
    input wire          vo_clk,
    input wire          vo_reset_,

    output reg          out_vsync,
    output reg          out_req,
    output reg          out_eol,
    output reg          out_eof,
    output reg [23:0]   out_pixel
    );

`include "video_timings.v"

    reg [11:0] col_cntr;
    reg [10:0] line_cntr;

    wire last_col, last_line;
    assign last_col  = (col_cntr  == h_total-1);
    assign last_line = (line_cntr == v_total-1);

	always @(posedge vo_clk) begin

        if (!last_col) begin
            col_cntr <= col_cntr + 1;
        end
        else begin
            col_cntr <= 0;

            if (!last_line) begin
                line_cntr <= line_cntr + 1;
            end
            else begin
                line_cntr <= 0;
            end
        end

        if (!vo_reset_) begin
			col_cntr  <= 0;
            line_cntr <= 0;
        end
	end

    wire pixel_active = (col_cntr >= h_blank) && (line_cntr >= v_blank);

    always @(posedge vo_clk) begin
        out_vsync   <= (col_cntr == 0) && (line_cntr == 0);

        out_req     <= pixel_active;

        if (pixel_active) begin
            out_eol     <= last_col;
            out_eof     <= last_col && last_line;
        end
        else begin
            out_eol     <= 1'b0;
            out_eof     <= 1'b0;
        end

		out_pixel[ 7: 0] <= !pixel_active ? 8'd0 : {line_cntr[3:0],col_cntr[3:0]};
		out_pixel[15: 8] <= !pixel_active ? 8'd0 : line_cntr << 3;
		out_pixel[23:16] <= !pixel_active ? 8'd0 : col_cntr << 3;
    end
    
endmodule
