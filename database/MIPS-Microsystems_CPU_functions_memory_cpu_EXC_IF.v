`include "ExcCode.v"

module IF_EXC(PC,ExcCode);
//interface
    input [31:0] PC;

    output reg [6:2] ExcCode;

//AdEL
    always @(*)
        begin
            if(PC[1:0]||PC<32'h0000_3000||PC>32'h0000_4ffc)ExcCode=`AdEL;
            else ExcCode=0;
        end

endmodule