module PIPE_Control(substate, generation, pclk, reset_n, RxStatus, ElecIdle_req, Detect_req, PhyStatus, TxDetectRx_Loopback, PowerDown, Detect_status, TxElecIdle,RxStandbyRequest,RxStandby);


parameter number_of_lanes= 4;
parameter  DetectQuiet = 4'b0000, DetectActive = 4'b0001, PollingActive = 4'b0010,
      PollingConfigration = 4'b0011, ConfigrationLinkWidthStart = 4'b0100, ConfigrationLinkWidthAccept= 4'b0101,
            ConfigrationLaneNumWait = 4'b0110,  ConfigrationLaneNumActive = 4'b0111, ConfigrationComplete = 4'b1000,
            ConfigrationIdle = 4'b1001,L0=4'b1010 ,Idle=4'b1111;

input pclk, reset_n;
input [4:0] substate;
input [2:0] generation;
input [2:0] RxStatus; 
input ElecIdle_req, Detect_req, PhyStatus;
input RxStandbyRequest;
output reg TxDetectRx_Loopback;
output reg [3:0] PowerDown;
output reg Detect_status; 
output reg TxElecIdle;
output reg RxStandby;

always @(posedge pclk or negedge reset_n) begin
  if (~reset_n) begin
  	PowerDown= 2;
  	Detect_status=0;
  	TxElecIdle=1;
  	TxDetectRx_Loopback=0;
    RxStandby = 1'b0;
  end

  else begin

      if (ElecIdle_req==1 || substate == DetectQuiet || substate == DetectActive) begin
            TxElecIdle=1;
      end
      else if(substate > 1) begin
            TxElecIdle=0;
      end

      if(substate == DetectQuiet || substate  == DetectActive) begin
        PowerDown = 2;
      end
      else if(substate > 1) begin
        PowerDown = 0;
      end
        
      if (Detect_req==1 && Detect_status == 0) begin
          TxDetectRx_Loopback =1;
      end

      if (PhyStatus==1 && RxStatus==3'b011 && TxDetectRx_Loopback == 1) begin
          TxDetectRx_Loopback =0;
          Detect_status=1;      
      end
      else begin
          Detect_status=0;
      end

      if(RxStandbyRequest)
      begin
        RxStandby = 1'b1;
      end
      else RxStandby = 1'b0;

  end


 end

 endmodule