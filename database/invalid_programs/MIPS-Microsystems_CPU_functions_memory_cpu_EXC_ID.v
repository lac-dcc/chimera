`include "ExcCode.v"

module ID_EXC(undef_D,ExcCode_D,ExcCode);
//interface
    input undef_D;

    input [6:2] ExcCode_D;      //ExcCode of last level

    output reg [6:2] ExcCode;   //ExcCode of this level

//IR
    always @(*)
        begin
            if(undef_D)ExcCode=`RI;
            else ExcCode=ExcCode_D;
        end

endmodule