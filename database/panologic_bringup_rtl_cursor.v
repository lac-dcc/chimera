
module cursor(
    input wire          vo_clk,
    input wire          vo_reset_,

    input wire          in_vsync,
    input wire          in_req,
    input wire          in_eol,
    input wire          in_eof,
    input wire [23:0]   in_pixel,

    output reg          out_vsync,
    output reg          out_req,
    output reg          out_eol,
    output reg          out_eof,
    output reg [23:0]   out_pixel
    );

`include "video_timings.v"

    wire [11:0] h_cntr;
    wire [10:0] v_cntr;

    vid_cntr u_vid_cntr(
        .clk(vo_clk),
        .reset_(vo_reset_),
        .in_vsync(in_vsync),
        .in_req(in_req),
        .in_eol(in_eol),
        .in_eof(in_eof),
        .h_cntr(h_cntr),
        .v_cntr(v_cntr)
    );

    wire cursor;

    localparam x_size = 50;
    localparam y_size = 50;

    reg [11:0] x_pos;
    reg [10:0] y_pos;
    reg x_dir;
    reg y_dir;

    assign cursor =    (h_cntr >= x_pos && h_cntr < x_pos+x_size) 
                    && (v_cntr >= y_pos && v_cntr < y_pos+y_size);

    always @(posedge vo_clk) begin
        if (in_vsync) begin
            if (x_dir == 1'b0) begin
                if (x_pos + x_size < h_active-1) begin
                    x_pos <= x_pos + 1;
                end
                else begin
                    x_dir <= 1'b1;
                end
            end
            else begin
                if (x_pos > 0) begin
                    x_pos <= x_pos - 1;
                end
                else begin
                    x_dir <= 1'b0;
                end
            end

            if (y_dir == 1'b0) begin
                if (y_pos + y_size < v_active-1) begin
                    y_pos <= y_pos + 1;
                end
                else begin
                    y_dir <= 1'b1;
                end
            end
            else begin
                if (y_pos > 0) begin
                    y_pos <= y_pos - 1;
                end
                else begin
                    y_dir <= 1'b0;
                end
            end
        end

        if (!vo_reset_) begin
            x_pos <= 0;
            y_pos <= 0;
            x_dir <= 1'b0;
            y_dir <= 1'b0;
        end
    end

    always @(posedge vo_clk) begin
        if (cursor) begin
            out_pixel[ 7: 0] <= {8{1'b1}} ^ in_pixel[ 7: 0]; 
            out_pixel[15: 8] <= {8{1'b1}} ^ in_pixel[15: 8]; 
            out_pixel[23:16] <= {8{1'b1}} ^ in_pixel[23:16]; 
        end
        else begin
            out_pixel <= in_pixel;
        end

        out_vsync        <= in_vsync;
        out_req          <= in_req;
        out_eof          <= in_eof;
        out_eol          <= in_eol;
    end

endmodule
