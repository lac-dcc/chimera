// This program was cloned from: https://github.com/SilenceX12138/MIPS-Microsystems
// License: MIT License

`include "ExcCode.v"

module MEM_EXC(load,DMWe,mfc0,byte_op,half_op,AO,ExcCode_M,ExcCode);
//interface
    input load;
    input DMWe;   //use as store_M
	input mfc0;	  //time feature is load but no need to trap AdEL

    input byte_op;
    input half_op;

    input [31:0] AO;

    input [6:2] ExcCode_M;

    output reg [6:2] ExcCode;

//AdEL & AdES
//cannot judge them seperately because ExcCode may be set val twice
    always @(*)
        begin
			ExcCode=ExcCode_M;
            if(load&&(!mfc0))
                begin
                    if(!((AO<=32'h0000_1fff)||(AO>=32'h0000_7f00&&AO<=32'h0000_7f0b)||(AO>=32'h0000_7f10&&AO<=32'h0000_7f43)))ExcCode=`AdEL;
                    else if(ExcCode_M==`Ov)ExcCode=`AdEL;
                    else if(half_op)
                        begin
                            if(AO%2!=0)ExcCode=`AdEL;
                            else if(!(AO<=32'h0000_1fff))ExcCode=`AdEL;
                            else ExcCode=ExcCode_M;
                        end
                    else if(byte_op)
                        begin
                            if(!(AO<=32'h0000_1fff))ExcCode=`AdEL;
                            else ExcCode=ExcCode_M;
                        end
                    else if(AO%4)ExcCode=`AdEL;
                    else ExcCode=ExcCode_M;
                end
            else if(DMWe)         
                begin
                    if(!((AO<=32'h0000_1fff)||(AO>=32'h0000_7f00&&AO<=32'h0000_7f0b)||(AO>=32'h0000_7f10&&AO<=32'h0000_7f43)))ExcCode=`AdES;
                    else if(ExcCode_M==`Ov)ExcCode=`AdES;
                    else if(AO==32'h0000_7f08||AO==32'h0000_7f18)ExcCode=`AdES;
                    else if(half_op)
                        begin
                            if(AO%2!=0)ExcCode=`AdES;
                            else if(!(AO<=32'h0000_1fff))ExcCode=`AdES;
                            else ExcCode=ExcCode_M;
                        end
                    else if(byte_op)
                        begin
                            if(!(AO<=32'h0000_1fff))ExcCode=`AdES;
                            else ExcCode=ExcCode_M;
                        end
                    else if(AO%4)ExcCode=`AdES;
                    else ExcCode=ExcCode_M;
                end
            else ExcCode=ExcCode_M;
        end

endmodule