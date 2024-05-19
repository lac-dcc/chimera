// This program was cloned from: https://github.com/multigcs/riocore
// License: GNU General Public License v2.0


module tlc549c
    #(parameter DIVIDER = 24)
     (
         input		clk,
         input		miso,
         output 	sclk,
         output reg	sel,
         output reg	[7:0] value
     );

    reg	[7:0] value_buf;
    reg	[3:0] cnt;
    reg sclk_valid;
    reg sel_valid;

    reg clk_1m;
    reg [31:0]counter_1m;
    always @(posedge clk) begin
        if (counter_1m == 0) begin
            counter_1m <= DIVIDER;
            clk_1m <= ~clk_1m;
        end else begin
            counter_1m <= counter_1m - 1;
        end
    end

    reg clk_40k;
    reg [31:0]counter_40k;
    always @(posedge clk_1m) begin
        if (counter_40k == 0) begin
            counter_40k <= 12;
            clk_40k <= ~clk_40k;
        end else begin
            counter_40k <= counter_40k - 1;
        end
    end

    always @(posedge clk_1m) begin
        if(clk_40k == 0) begin
            cnt <= 0;
        end else if(cnt == 10) begin
            cnt <= 10;
        end else begin
            cnt <= cnt + 1'b1;
        end
        sclk_valid <= !((cnt == 0) | (cnt == 1) | (cnt == 10));
        sel <= (cnt == 0) | (cnt == 10);
    end

    assign sclk = sclk_valid ? clk_1m : 1'b0;

    always @(posedge sclk) begin
        if(sel == 0) begin
            value_buf <= {miso, value_buf[7:1]};
        end
    end

    always @(posedge clk_40k) begin
        value <= value_buf;
    end

endmodule
