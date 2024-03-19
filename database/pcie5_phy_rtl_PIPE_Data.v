module PIPE_Data #(parameter pipe_width_gen1 = 8,
                   parameter pipe_width_gen2 = 8,
                   parameter pipe_width_gen3 = 16,
                   parameter pipe_width_gen4 = 32,
                   parameter pipe_width_gen5 = 32

  )(generation, pclk, reset_n, scramblerDataOut, scramblerDataK, scramblerSyncHeader, scramblerDataValid, TxData, TxDataValid, TxDataK, TxSyncHeader, TxStartBlock);


//reg [5:0] pipe_width;

input pclk, reset_n;
input [2:0] generation;
input [31:0] scramblerDataOut;
input [3:0] scramblerDataK;
input [1:0] scramblerSyncHeader;
input scramblerDataValid;

output reg [31:0] TxData; 
output reg TxDataValid, TxStartBlock; 
output reg [3:0] TxDataK;
output reg [1:0] TxSyncHeader;

always @(/*posedge pclk or negedge reset_n*/*) begin
  if (~reset_n) begin
  	TxData = 0;
  	TxDataK = 0;
  	TxDataValid = 0;
    TxSyncHeader = 0;
    TxStartBlock = 0;
  end
  else if (generation==1) begin
//  		pipe_width=pipe_width_gen1;
  		TxData= scramblerDataOut[pipe_width_gen1-1:0];
  		TxDataK=scramblerDataK[(pipe_width_gen1/8)-1:0];
  		TxDataValid= scramblerDataValid;
  end
  else if (generation==2) begin
  //  	pipe_width=pipe_width_gen2;
  		TxData= scramblerDataOut[pipe_width_gen2-1:0];
  		TxDataK=scramblerDataK[(pipe_width_gen2/8)-1:0];
  		TxDataValid= scramblerDataValid;
  end 
  else if (generation==3) begin
   // 	pipe_width=pipe_width_gen3;
  		TxData= scramblerDataOut[pipe_width_gen3-1:0];
  		TxDataK=scramblerDataK[(pipe_width_gen3/8)-1:0];
  		TxDataValid= scramblerDataValid;
      TxSyncHeader= scramblerSyncHeader;
      if(scramblerSyncHeader==2'b10 || scramblerSyncHeader==2'b01)
          TxStartBlock=1;
      else 
          TxStartBlock=0;
  end 
  else if (generation==4) begin
    //	pipe_width=pipe_width_gen4;
  		TxData= scramblerDataOut[pipe_width_gen4-1:0];
  		TxDataK=scramblerDataK[(pipe_width_gen4/8)-1:0];
  		TxDataValid= scramblerDataValid;
      TxSyncHeader= scramblerSyncHeader;
      if(scramblerSyncHeader==2'b10 || scramblerSyncHeader==2'b01)
          TxStartBlock=1;
      else 
          TxStartBlock=0;      
  end
  else if (generation==5) begin
      //	pipe_width=pipe_width_gen5;
  		TxData= scramblerDataOut[pipe_width_gen5-1:0];
  		TxDataK=scramblerDataK[(pipe_width_gen5/8)-1:0];
  		TxDataValid= scramblerDataValid;
      TxSyncHeader= scramblerSyncHeader;   
      if(scramblerSyncHeader==2'b10 || scramblerSyncHeader==2'b01)
          TxStartBlock=1;
      else 
          TxStartBlock=0;   
  end  
  else begin
  		TxData=0;
  		TxDataK=0;
  		TxDataValid=0;
      TxSyncHeader= 0;
      TxStartBlock = 0;
  end
end
endmodule

