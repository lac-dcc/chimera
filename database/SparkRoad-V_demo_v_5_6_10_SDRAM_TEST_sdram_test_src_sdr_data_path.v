

module sdr_data_path(CLK, RESET_N, OE, DATAIN, DATAOUT, DQIN, DQOUT);
   
   parameter          DSIZE = 32;
   
   input              CLK;
   input              RESET_N;
   input              OE;
   input [DSIZE-1:0]  DATAIN;
   output [DSIZE-1:0] DATAOUT;
   input [DSIZE-1:0]  DQIN;
   output [DSIZE-1:0] DQOUT;
   
   
   reg [DSIZE-1:0]    DIN1;
   reg [DSIZE-1:0]    DIN2;
   
   
   always @(posedge CLK or negedge RESET_N)
      if (RESET_N == 1'b0)
      begin
         DIN1 <= {DSIZE{1'b0}};
         DIN2 <= {DSIZE{1'b0}};
      end
      else 
      begin
         DIN1 <= DATAIN;
         DIN2 <= DIN1;
      end
   
   assign DATAOUT = DQIN;
   assign DQOUT = DIN2;
   
endmodule


