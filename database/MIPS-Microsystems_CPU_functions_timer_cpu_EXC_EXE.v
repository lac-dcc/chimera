`include "ExcCode.v"

module EXE_EXC(overflow,flow_sus,ExcCode_E,ExcCode);
//interface
    input overflow;
    input flow_sus;     //add/sub/addi

    input [6:2] ExcCode_E;

    output reg [6:2] ExcCode;

//Ov
    always @(*)
        begin
            if(overflow&&flow_sus)ExcCode=`Ov;
            else ExcCode=ExcCode_E;
        end

endmodule