module MUX (sel,data_valid, os_valid, data_in, os_in, data_datak, os_datak, out, datak_out, valid_out,MuxSyncHeader);
input sel;//selector signal coming from Tx LTSSM in order to tell MUX to forward either order sets coming from os generator or TLPs or DLLPs coming from LPIF Tx control and dataflow
input [63:0]data_valid;// valid data coming from LPIF Tx control and dataflow
input [63:0]os_valid;// valid data comimg from os generator
input [63:0]data_datak; // K or D characters coming coming from LPIF Tx control and dataflow
input [63:0]os_datak;// K or D characters coming coming from OS GENERATOR
input [511:0] data_in;// TLPS or DLLPS coming from LPIF Tx control and dataflow
input [511:0] os_in;// order sets coming from os generator
output reg MuxSyncHeader;
output reg [63:0]valid_out; 
output reg [63:0]datak_out;
output reg [511:0] out;
always@(*)begin
 if(sel)begin  // if Tx LTSSM choose to forward TLPs or DLLPs coming from LPIF Tx control and dataflow
   out=data_in;
   valid_out=data_valid;
   datak_out=data_datak;
   MuxSyncHeader=0;
   end
 else begin // if Tx LTSSM choose to forward order sets coming from os generator
  out=os_in;
  valid_out=os_valid;
  datak_out=os_datak;
  MuxSyncHeader=1;
  end
 end
 endmodule
       


