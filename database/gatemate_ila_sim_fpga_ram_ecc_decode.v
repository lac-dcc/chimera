// last changed 15.11.2016

//	single_error | double_error  | condition
//	--------------------------------------------------------------------
//	     0		 |       0       | no detectable error
//		 1		 |       0       | one error detected and corrected
//   	 0		 |       1       | two errors detected / not correctable
//		 1		 |       1       | invalid / three or more errors
//----------------------------------------------------------------------

 `timescale 1 ns / 1 ps
module ecc_decode(code_in,
                  data_out,
				  single_error,
				  double_error);  //  CC double_error flag

parameter P_DATAWIDTH=32;
parameter P_CODEWIDTH=39;   //  CC changed 38 to 39
parameter P_CHECKBITS_COUNT=7;  //  CC changed 6 to 7


input       [P_CODEWIDTH-1:0] code_in;
output reg  [P_DATAWIDTH-1:0] data_out;
output reg 					  single_error;
output reg 					  double_error;  //  CC double_error

reg [P_CODEWIDTH-1:0] c;
reg [P_CODEWIDTH:0] d;    // data one bit shifted  changed by CCAG
reg [P_CHECKBITS_COUNT-2:0] fail_location; // CC changed P_CHECKBITS_COUNT-1 to P_CHECKBITS_COUNT-2


integer i,n;


reg [P_CHECKBITS_COUNT-1:0]  p;
reg  fail_bit;


always @(*) begin
    fail_location=0;
    c=code_in;
	d={code_in,1'b0};      // changed by CCAG
    single_error=1'b0;
    double_error=1'b0;  // CC

    p[0]=c[2]^c[4]^c[6]^c[8]^c[10]^c[12]^c[14]^c[16]^c[18]^c[20]^c[22]^c[24]^c[26]^c[28]^c[30]^c[32]^c[34]^c[36];
    p[1]=c[2]^c[5]^c[6]^c[9]^c[10]^c[13]^c[14]^c[17]^c[18]^c[21]^c[22]^c[25]^c[26]^c[29]^c[30]^c[33]^c[34]^c[37];
    p[2]=c[4]^c[5]^c[6]^c[11]^c[12]^c[13]^c[14]^c[19]^c[20]^c[21]^c[22]^c[27]^c[28]^c[29]^c[30] ^c[35]^c[36]^c[37];
    p[3]=c[8]^c[9]^c[10]^c[11]^c[12]^c[13]^c[14] ^c[23]^c[24]^c[25]^c[26]^c[27]^c[28]^c[29]^c[30];
    p[4]=c[16]^c[17]^c[18]^c[19]^c[20]^c[21]^c[22]^c[23]^c[24]^c[25]^c[26]^c[27]^c[28]^c[29]^c[30];
    p[5]=c[32]^c[33]^c[34]^c[35]^c[36]^c[37];

    p[6]=1'b0;  // CC overall parity for DED

    for(i=1;i<P_CODEWIDTH;i=i+1) begin
        p[6] = p[6]^c[i-1];
    end


    if(p[0]!=c[0]) fail_location[0]=1'b1;
    if(p[1]!=c[1]) fail_location[1]=1'b1;
    if(p[2]!=c[3]) fail_location[2]=1'b1;
    if(p[3]!=c[7]) fail_location[3]=1'b1;
    if(p[4]!=c[15])fail_location[4]=1'b1;
    if(p[5]!=c[31])fail_location[5]=1'b1;

    //  CC detection and correction logic
    if(fail_location==0 && p[6]!=c[38]) begin
        single_error=1'b1;
        double_error=1'b1;	//  unknown condition three or more errors
    end

    if(fail_location!=0) begin
        if (p[6]!=c[38]) begin
            single_error=1'b1;
        end
        else begin
            double_error=1'b1; // uncorrectable even-number of errors
        end
    end


//    if(fail_location!=0) begin         // changed by CCAG
        fail_bit=d[fail_location];
        d[fail_location]=~fail_bit;      // changed by CCAG
//    end                                // changed by CCAG


    n=0;
    for(i=1;i<P_CODEWIDTH;i=i+1) begin  //  CC changed i<=P_CODEWIDTH to i<P_CODEWIDTH
        if(i!=1 && i!=2 && i!=4 && i!=8 && i!=16 && i!=32) begin
            data_out[n]=d[i];      // changed by CCAG
            n=n+1;
        end
    end

end //always

endmodule
