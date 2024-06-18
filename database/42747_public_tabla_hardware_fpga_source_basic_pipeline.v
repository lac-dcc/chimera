// This program was cloned from: https://github.com/VeriGOOD-ML/public
// License: Apache License 2.0

module pipeline #(

parameter NUM_BITS = 16,
parameter NUM_STAGES = 1,
parameter EN_RESET = 0
)(
input clk,
input [NUM_BITS-1:0] data_in,
input rstn,

output [NUM_BITS-1:0] data_out
);


generate
if(NUM_STAGES != 0 ) begin
    reg [NUM_BITS-1:0] data[0:NUM_STAGES];
    for(genvar gv =0;gv< NUM_STAGES;gv=gv+1)
        begin
        always @(posedge clk or negedge rstn)
            begin
                if(~rstn)
                    data[gv] <= {NUM_BITS{1'b0}};
                else
                    data[gv] <= (gv == 0) ? data_in : data[gv-1];
            end
         end
     assign data_out = data[NUM_STAGES-1];
end    
else
    assign data_out = data_in;
endgenerate

endmodule