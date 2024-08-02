// This program was cloned from: https://github.com/Motherboard77/8-point-Number-Theoretic-Transform-NTT-processor-with-on-the-fly-twiddle-generator
// License: GNU General Public License v3.0


module NTT_Controller(i,j,N,t,tprev,clock,start1,start2,mem_en,rd_wr,local_start,tw_ack,buf_ack);

parameter n = 5; 

input clock; 
input local_start;     //activate this to enable the NTT module
input tw_ack;          //ack signal from twiddle gen
input buf_ack;         //ack signal from buf unit
output reg [n-1:0] i;
output reg [n-1:0] j;
output reg [n-1:0] N;
output reg [n-1:0] t;
output reg [n-1:0] tprev;
output reg start1;
output reg start2;
output reg mem_en; //enable the memmory for read/write operation
output reg rd_wr;

reg [3:0] state;  

initial
begin
    N <= 5'b01_000;      //N = 8
    i <= 5'b00_000;
    j <= 5'b00_000;
    t <= 5'b00_100;      //t = 4
    tprev <= 5'b00_000;
    mem_en <= 0;
    rd_wr <= 1;
    state <= 4'b0000;
end

always @(posedge clock)
begin
    case(state)
        
        4'b0000: begin
                    if(local_start)
                        state <= 4'b1001;
                    else
                        state <= 4'b0000;
                 end                
                 
        4'b1001: begin
                    if(i < 5'b00011)
                        state <= 4'b0001;
                    else
                        begin
                        i <= 5'b000_00;
                        state <= 4'b1010;
                        end   
                 end
        
                
        4'b0001: begin
                    if(j < 5'b00_100)
                        begin
                        start1 <= 1;                 //activate encapsulate 2: jmod + buf index generator
                        start2 <= 0;
                        state <= 4'b0010;
                        end
                    else
                        begin
                        state <= 4'b1000;
                        end
                 end
        4'b0010: begin
                  start1 <= 0;
                  state <= 4'b0011;
                 end
        4'b0011: begin
                  mem_en <= 1;                
                  rd_wr <= 1;                   //read operation
                  start2 <= 1;                  //activate encapsulate 1: tw gen + buf gen
                  state <= 4'b0101;
                 end
                 
//        4'b0100: begin
//                 if(tw_ack)
//                    state <= 4'b0101;  
//                 else
//                    state <= 4'b0100;   //remain in this state
//                 end         
   
        4'b0101: begin
                  if(buf_ack)
                    state <= 4'b0110;
                  else
                    state <= 4'b0101;  //remain in this state
                 end
   
        4'b0110: begin
                  //enable memory for write operation
                  start2 <= 0;
                  rd_wr <= 0;
                  //j <= j + 1;
                  state <= 4'b0111;
                 end
   
        4'b0111: begin
                    mem_en <= 0;
                    j <= j + 1;
                    state <= 4'b0001;
                 end
                  
        4'b1000: begin                      
                    tprev <= t;
                    t <= t >> 1'b1;   
                    i <= i + 1;
                    j <= 5'b000_00;
                    state <= 4'b1001;
                 end
                
        4'b1010: begin
                    state <= 4'b1010;
                 end

    endcase
end

endmodule
