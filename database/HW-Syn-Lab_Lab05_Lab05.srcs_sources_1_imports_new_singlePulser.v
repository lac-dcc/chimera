`timescale 1ns / 1ns

module singlePulser(
    input pulse,
    input clk,
    output out
    );

reg [1:0] pstate = 2'b0;
reg [1:0] nstate = 2'b0;
reg out = 0;


always @(posedge clk)
begin
    pstate = nstate;
end

always @(posedge clk)
begin
    case(pstate)
        1'b0: 
            if(pulse) 
            begin
                nstate = 1'b1;
                out = 1;
            end
            else 
            begin
                nstate = 1'b0;
                out = 0;
            end
        2'b1: 
            if(pulse) 
            begin
                nstate = 1'b1;
                out = 0;
            end
            else 
            begin
                nstate = 1'b0;
                out = 0;
            end
    endcase
end
 
endmodule
