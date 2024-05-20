// This program was cloned from: https://github.com/Motherboard77/8-point-Number-Theoretic-Transform-NTT-processor-with-on-the-fly-twiddle-generator
// License: GNU General Public License v3.0



module NTTtest();

parameter n = 4;
parameter m = 25;
reg [n:0] i;
reg [n:0] j;
reg [n:0] N;
reg start1;
reg start2;
reg [n:0] t;
reg [n:0] tprev;
reg enable;
reg rw;
reg clock = 1'b0;
wire [m-1:0] x1_out;
wire [m-1:0] x2_out;
//wire [n:0] index1_out;
//wire [n:0] index2_out;
reg local_start;
wire tw_ack;
wire buf_ack;

NTT_8point NTT1(clock,local_start,x1_out,x2_out);


always
#2 clock <= ~clock;

initial
begin
    //first activate encapsulate2 to generate the address
    //then activate the enable of the memory to give read access
    //finally, activate the start2 signal to activate encapsulate1 to output x1_out,x2_out
//    //SIGNAL TEST SET 1
//    start1 <= 1;
//    start2 <= 0;
//    //enable <= 1;
//    N <= 5'b01000;   //8
//    i <= 5'b00001; j<= 5'b00000; t <= 5'b00010; tprev <= 5'b00100;
//    #7 
//    start1 <= 0;
//    #6
//    enable <= 1;   //enable memory for access
//    rw <= 1;       //read access
//    start2 <= 1;
//     #7
//    start2 <= 0;
//    #7
//    enable <= 0;

//SIGNAL TEST SET 2
//    start1 <= 1;
//    start2 <= 0;
//    //enable <= 1;
//    N <= 5'b01000;   //8
//    i <= 5'b00001; j<= 5'b00000; t <= 5'b00010; tprev <= 5'b00100;
//    #7 
//    start1 <= 0;
//    #6
//    enable <= 1;   //enable memory for access
//    rw <= 1;       //read access
//    start2 <= 1;
//     #7
//    start2 <= 0;
//    #7
//    rw <= 0;
//    #100
//    start1 <= 1;
//    start2 <= 0;
//    //enable <= 1;
//    N <= 5'b01000;   //8
//    i <= 5'b00001; j<= 5'b00001; t <= 5'b00010; tprev <= 5'b00100;
//    #7 
//    start1 <= 0;
//    #6
//    enable <= 1;   //enable memory for access
//    rw <= 1;       //read access
//    start2 <= 1;
//     #7
//    start2 <= 0;

//SIGNAL TEST SET 3
local_start <= 1;
#30
local_start <= 0;


end

endmodule
