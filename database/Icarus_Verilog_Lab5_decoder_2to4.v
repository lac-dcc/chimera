`ifndef DECODER_2TO4
`define DECODER_2TO4
    module decoder_2to4(
        output reg [3:0] register,
        input [1:0] regNo);

        always @(regNo) begin
            case (regNo)
                2'b00 : 
                    register = 4'b0001;
                2'b01 : 
                    register = 4'b0010;
                2'b10 : 
                    register = 4'b0100;
                2'b11 : 
                    register = 4'b1000;
            endcase
        end
        
    endmodule
`endif
