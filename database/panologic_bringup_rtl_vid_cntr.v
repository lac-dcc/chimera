
module vid_cntr(
    input wire          clk,
    input wire          reset_,

    input wire          in_vsync,
    input wire          in_req,
    input wire          in_eol,
    input wire          in_eof,

    output reg [11:0]   h_cntr,
    output reg [10:0]   v_cntr
    );

    always @(posedge clk) begin
        if (in_vsync) begin
            h_cntr  <= 0;
            v_cntr  <= 0;
        end
        else if (in_req) begin
            if (in_eof) begin
                h_cntr  <= 0;
                v_cntr  <= 0;
            end
            else if (in_eol) begin
                h_cntr  <= 0;
                v_cntr  <= v_cntr + 1;
            end
            else begin
                h_cntr  <= h_cntr + 1;
            end
        end
    
        if (!reset_) begin
            h_cntr  <= 0;
            v_cntr  <= 0;
        end
    end

endmodule
