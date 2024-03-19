// Company           :   racyics                      
// Author            :   pilz            
// E-Mail            :   <email>                    
//                    			
// Filename          :   ecc_encode.v                
// Project Name      :   p_cc    
// Subproject Name   :   s_fpga    
// Description       :   ecc encoder for 34 bit data (40 bit code)            
//
// Create Date       :   Tue Aug 13 14:47:15 2013 
// Last Change       :   $Date: 2015-05-13 15:02:01 +0200 (Wed, 13 May 2015) $
// by                :   $Author: pilz $                  			
//------------------------------------------------------------
`timescale 1 ns / 1 ps
module ecc_encode(data_in,
                  code_out);

parameter P_DATAWIDTH=32;
parameter P_CODEWIDTH=39;  //  CC changed 38 to 39
parameter P_PARITYWIDTH=7; //  CC changed 6 to 7


input   [P_DATAWIDTH-1:0] data_in;
output  [P_CODEWIDTH-1:0] code_out;

reg [P_CODEWIDTH-1:0] c;
 
integer i,n;

//computation of the Hamming-Code (39,32) with 7 parity bits SECDED
always @(*) begin
    n=0;
    for(i=1;i<P_CODEWIDTH;i=i+1) begin  //  CC changed i<=P_CODEWIDTH to i<P_CODEWIDTH
        if(i!=1 && i!=2 && i!=4 && i!=8 && i!=16 && i!=32) begin
            c[i-1]=data_in[n];
            n=n+1;
        end
        else begin
            c[i-1]=1'b0;
        end
    end 
          
    c[0]=c[2]^c[4]^c[6]^c[8]^c[10]^c[12]^c[14]^c[16]^c[18]^c[20]^c[22]^c[24]^c[26]^c[28]^c[30]^c[32]^c[34]^c[36];
    c[1]=c[2]^c[5]^c[6]^c[9]^c[10]^c[13]^c[14]^c[17]^c[18]^c[21]^c[22]^c[25]^c[26]^c[29]^c[30]^c[33]^c[34]^c[37];
    c[3]=c[4]^c[5]^c[6]^c[11]^c[12]^c[13]^c[14]^c[19]^c[20]^c[21]^c[22]^c[27]^c[28]^c[29]^c[30] ^c[35]^c[36]^c[37];
    c[7]=c[8]^c[9]^c[10]^c[11]^c[12]^c[13]^c[14] ^c[23]^c[24]^c[25]^c[26]^c[27]^c[28]^c[29]^c[30];
    c[15]=c[16]^c[17]^c[18]^c[19]^c[20]^c[21]^c[22]^c[23]^c[24]^c[25]^c[26]^c[27]^c[28]^c[29]^c[30];
    c[31]=c[32]^c[33]^c[34]^c[35]^c[36]^c[37];
            
    c[38]=1'b0; //  CC overall parity for double error detection 
	 
    for(i=1;i<P_CODEWIDTH;i=i+1) begin
        c[38]= c[38]^c[i-1];
    end
     
end //always

assign code_out=c;

endmodule 

