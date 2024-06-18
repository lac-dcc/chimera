// This program was cloned from: https://github.com/MihVuongNguyen/RISC-V
// License: Apache License 2.0

module load_size (
    input [31:0] in_load,
    input [2:0] load_sel,
    output reg [31:0] out_load 
);
    always @(*) begin
        case (load_sel)
           3'b000 : out_load = {{24{in_load[7]}}, in_load[7:0]}; //LB
           3'b001 : out_load = {{16{in_load[15]}}, in_load[15:0]};  //LH
           3'b010 : out_load = in_load;  //LW
           3'b011 : out_load = {24'b0, in_load[7:0]}; //LBU
           3'b100 : out_load = {16'b0, in_load[15:0]};  //LHU
            default: out_load = in_load;
        endcase
    end
endmodule