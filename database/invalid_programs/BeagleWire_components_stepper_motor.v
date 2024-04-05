module stepper_motor (input                     clk,
                      input                     reset,
                      input                     en,
                      input                     dir,
                      input                     steps,
                      output                    dir_out,
                      output                    step_out,
                      );

parameter COUNTER_WIDTH = 16;
reg step;
reg [COUNTER_WIDTH-1:0] count;
reg div_clk;

initial begin
    count <= 0;
end

assign dir_out = dir;
//assign step_out = (en == 1'b1) ? step : 1'b0;
assign step_out = steps;

always @ (posedge clk or posedge rst)
begin
    if (rst) begin
        step  <= 1'b0;
        count <= 0;
        div_clk <= 1'b0;
    end else begin
        if (count==16'd5000) begin
            div_clk <= ~div_clk;
            count <= 16'd0;
        end else begin
            count = count + 1'b1;
        end
    end
end

endmodule
