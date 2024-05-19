// This program was cloned from: https://github.com/flyjancy/CortexM0_SoC_Task
// License: MIT License

module Mux(
    input        [2:0]  sel,
    input        [3:0]  dina,
    input        [3:0]  dinb,
    input        [3:0]  dinc,
    input        [3:0]  dind,
    input        [3:0]  dine,
    input        [3:0]  dinf,  
    output  reg  [3:0]  data_out
);

always@(*)begin
    case (sel)
        3'b000 : data_out = dina;
        3'b001 : data_out = dinb;
        3'b010 : data_out = dinc;
        3'b011 : data_out = dind;
        3'b100 : data_out = dine;
        3'b101 : data_out = dinf;
        default: data_out = 0;
    endcase   
end

endmodule

