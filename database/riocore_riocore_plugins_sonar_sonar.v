// This program was cloned from: https://github.com/multigcs/riocore
// License: GNU General Public License v2.0


module sonar
    #(parameter TRIGGER_START = 500, TRIGGER_LEN = 2000000, RESET_CNT = 5000000)
     (
         input clk,
         output trigger,
         input echo,
         output [31:0] distance
     );
    reg [31:0] distance_set = 0;
    reg [31:0] dist_counter = 0;
    reg [31:0] counter = 0;
    reg trg = 0;

    assign distance = distance_set;
    assign trigger = trg;

    always @ (posedge clk) begin
        counter <= counter + 1;
        if (counter == TRIGGER_START) begin
            trg <= 1;
            dist_counter <= 0;
        end
        if (counter == TRIGGER_LEN) begin
            trg <= 0;
        end
        if (counter == RESET_CNT) begin
            counter <= 0;
        end

        if (echo) begin
            dist_counter <= dist_counter + 1;
        end else if (dist_counter > 0) begin
            distance_set <= dist_counter;
        end
    end
endmodule
