module IM(A,IR);
    input  [15:0] A ;    // address bus [11:2]
    output [31:0] IR;     // 32-bit memory output
    reg[31:0] im_128k[0:32767];  // 1024  * 32bit =    4KB
    // 32768 * 32bit =  128KB 

    initial begin
        // $readmemh("./code/code_wkx_2.txt",im_128k,32'H0C00,32'H0C0e);
        // $readmemh("code_rz.txt",im_4k,32'H0C00,32'H0C1D); 
        // $readmemh("code_hazard.txt",im_4k,32'H0C00,32'H0C05);
    end

    assign IR = im_128k[A[15:2]];//number addr[9:0] instruction
endmodule
