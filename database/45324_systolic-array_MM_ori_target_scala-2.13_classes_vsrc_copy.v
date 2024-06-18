// This program was cloned from: https://github.com/benhuangpf/systolic-array
// License: MIT License

//Module for calculating Res = A*B
//Where A,B and C are 2 by 2 matrices.
module MMMMIOBlackBox
#(parameter WIDTH=32)(
    input                  clock,
    input                  reset,
    output                 input_ready,
    input                  input_valid,
    input                  output_ready,
    output                 output_valid,
    //input and output ports.
    //The size 32 bits which is 2*2=4 elements,each of which is 8 bits wide.    
    input [31:0] a,
    input [31:0] b,
    output reg [31:0] res
);

    localparam S_IDLE = 2'b00, S_RUN = 2'b01, S_DONE = 2'b10;

    reg [1:0]               state;

    assign input_ready = state == S_IDLE;
   assign output_valid = state == S_DONE;
   assign busy = state != S_IDLE;

   always @(posedge clock) begin
      if (reset)
        state <= S_IDLE;
      else if (state == S_IDLE && input_valid)
        state <= S_RUN;
      else if (state == S_RUN)
        state <= S_DONE;
      else if (state == S_DONE && output_ready)
        state <= S_IDLE;
   end
    
    //internal variables    
    // reg [31:0] Res;
    reg [7:0] A1 [0:1][0:1];
    reg [7:0] B1 [0:1][0:1];
    reg [7:0] Res1 [0:1][0:1]; 
    integer i,j,k;

    always @(posedge clock) begin
        if (state == S_IDLE && input_valid) begin
        //Initialize the matrices-convert 1 D to 3D arrays
            {A1[0][0],A1[0][1],A1[1][0],A1[1][1]} = a;
            {B1[0][0],B1[0][1],B1[1][0],B1[1][1]} = b;
            i = 0;
            j = 0;
            k = 0;
            {Res1[0][0],Res1[0][1],Res1[1][0],Res1[1][1]} = 32'd0; //initialize to zeros.
        end
        else if (state == S_RUN) begin
            //Matrix multiplication
            for(i=0;i < 2;i=i+1)
                for(j=0;j < 2;j=j+1)
                    for(k=0;k < 2;k=k+1)
                        Res1[i][j] = Res1[i][j] + (A1[i][k] * B1[k][j]);
            //final output assignment - 3D array to 1D array conversion.            
            res = {Res1[0][0],Res1[0][1],Res1[1][0],Res1[1][1]};    
        end        
    end 

endmodule