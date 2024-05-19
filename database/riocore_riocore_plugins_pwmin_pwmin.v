// This program was cloned from: https://github.com/multigcs/riocore
// License: GNU General Public License v2.0


module pwmin
    #(parameter RESET_CNT = 25000000)
     (
         input clk,
         input pwm,
         output reg valid,
         output reg [31:0] width = 0
     );
    reg [31:0] width_cnt = 0;

    reg[2:0] SIGr;  always @(posedge clk) SIGr <= {SIGr[1:0], pwm};
    wire SIG_risingedge = (SIGr[2:1]==2'b01);
    wire SIG_fallingedge = (SIGr[2:1]==2'b10);

    always @(posedge clk)
    begin
        if (SIG_fallingedge) begin
            width <= width_cnt + 1;
            valid <= 1;
        end else if (SIG_risingedge) begin
            width_cnt <= 0;
        end else begin
            width_cnt <= width_cnt + 1;
            if (width_cnt > RESET_CNT) begin
                width <= RESET_CNT;
                valid <= 0;
                width_cnt <= 0;
            end
        end
    end
endmodule
