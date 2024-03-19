
/*
module pcieTB;
    parameter MAXPIPEWIDTH = 32;
	parameter DEVICETYPE = 0; //0 for downstream 1 for upstream
	parameter LANESNUMBER =16;
	parameter GEN1_PIPEWIDTH = 8 ;	
	parameter GEN2_PIPEWIDTH = 8 ;	
	parameter GEN3_PIPEWIDTH = 8 ;								
	parameter GEN4_PIPEWIDTH = 8 ;	
	parameter GEN5_PIPEWIDTH = 8 ;	
	parameter MAX_GEN = 1;
reg CLK;
reg reset;
//output phy_reset,
//PIPE interface width
//output [1:0] width, ///////////////////which module
//TX_signals
wire [1:0] width;
wire [MAXPIPEWIDTH*LANESNUMBER-1:0]TxData;
wire [LANESNUMBER-1:0]TxDataValid;
wire [LANESNUMBER-1:0]TxElecIdle;
wire [LANESNUMBER-1:0]TxStartBlock;
wire [(MAXPIPEWIDTH/8)*LANESNUMBER-1:0]TxDataK;
wire [2*LANESNUMBER -1:0]TxSyncHeader;
wire [LANESNUMBER-1:0]TxDetectRx_Loopback;
//RX_signals
wire [MAXPIPEWIDTH*LANESNUMBER-1:0]RxData;
wire [LANESNUMBER-1:0]RxDataValid;////////////////////////////////////////
wire	[(MAXPIPEWIDTH/8)*LANESNUMBER-1:0]RxDataK;
reg	[LANESNUMBER-1:0]RxStartBlock;
reg	[2*LANESNUMBER -1:0]RxSyncHeader;
wire	[LANESNUMBER-1:0]RxValid;
reg	[3*LANESNUMBER -1:0]RxStatus;
reg [15:0]RxElectricalIdle;
//commands and status signals
wire [4*LANESNUMBER-1:0]PowerDown;
wire  [3:0]Rate;
reg [LANESNUMBER-1:0]PhyStatus;

//pclkcontrolsignal
wire [4:0]PCLKRate;
wire PclkChangeAck;
reg  PclkChangeOk;
//eq_signals
reg 	[18*LANESNUMBER -1:0]LocalTxPresetCoefficients;
wire 	[18*LANESNUMBER -1:0]TxDeemph;
reg 	[6*LANESNUMBER -1:0]LocalFS;
reg 	[6*LANESNUMBER -1:0]LocalLF;
wire 	[4*LANESNUMBER -1:0]LocalPresetIndex;
wire 	[LANESNUMBER -1:0]GetLocalPresetCoeffcients;
reg 	[LANESNUMBER -1:0]LocalTxCoefficientsValid;
wire 	[6*LANESNUMBER -1:0]LF;
wire 	[6*LANESNUMBER -1:0]FS;
wire 	[LANESNUMBER -1:0]RxEqEval;
wire 	[LANESNUMBER -1:0]InvalidRequest;
reg 	[6*LANESNUMBER -1:0]LinkEvaluationFeedbackDirectionChange;
wire    pl_trdy;
reg     lp_irdy;
reg     [512-1:0]lp_data;
reg     [64-1:0]lp_valid;
wire [512-1:0]pl_data;
wire [64-1:0] pl_valid;
reg  [3:0]lp_state_req;
wire [3:0]pl_state_sts;
wire [2:0]pl_speedmode;////////////////////////////////////////
reg lp_force_detect;
////lPIF start & end of TLP DLLP
reg [64-1:0]lp_dlpstart;
reg [64-1:0]lp_dlpend;
reg  [64-1:0]lp_tlpstart;
reg  [64-1:0]lp_tlpend;
wire [64-1:0]pl_dlpstart;
wire [64-1:0]pl_dlpend;
wire [64-1:0]pl_tlpstart;
wire [64-1:0]pl_tlpend;
wire [64-1:0]pl_tlpedb;
wire linkUp;
//optional Message bus
wire [7:0] M2P_MessageBus;
reg  [7:0] P2M_MessageBus;

localparam[1:0]
        reset_   = 2'd0,
        active_  = 2'd1,
        retrain_ = 2'd2;
integer i;
initial
begin
    CLK = 0;
    reset = 0;
    #20
    reset = 1;
    #10
    lp_state_req = reset_;
    #10
    wait(TxDetectRx_Loopback);
    #10
    PhyStatus={16{1'b1}};
    RxStatus={16{3'b011}};
    #10
    RxStatus=16'd0;
	wait(linkUp);
	lp_state_req = active_;
	@(negedge CLK);
	lp_irdy=1;
	for (i=0;i<512;i=i+1) 
	begin
		lp_data[i]=$random;
		lp_tlpstart[i]=0;
		lp_tlpend[i]=0;
		lp_dlpend[i]=0;
		lp_dlpstart[i]=0;
	end
	lp_valid={2'b00, {62{1'b1}}};
	lp_dlpstart[0]=1;
	lp_dlpend[61]=1;
	#10
	lp_irdy=0;


end
always #5 CLK = ~CLK;




PCIe #(
	
	.MAXPIPEWIDTH(32),
	.DEVICETYPE (0), //0 for downstream 1 for upstream
	. LANESNUMBER (16),
	. GEN1_PIPEWIDTH (8) ,	
	. GEN2_PIPEWIDTH (8) ,	
	. GEN3_PIPEWIDTH (8) ,								
	. GEN4_PIPEWIDTH (8) ,	
	. GEN5_PIPEWIDTH (8) ,	
	. MAX_GEN (1)
)
pcie
(
//clk and reset 
 CLK,
 reset,
 phy_reset,
//PIPE interface width
 width, ///////////////////which module
//TX_signals
 TxData,
 TxDataValid,
 TxElecIdle,
 TxStartBlock,
 TxDataK,
 TxSyncHeader,
 TxDetectRx_Loopback,
//RX_signals
 RxData,
 RxDataValid,////////////////////////////////////////
 RxDataK,
 RxStartBlock,
 RxSyncHeader,
 RxStatus,
 RxElectricalIdle,
//commands and status signals
 PowerDown,
 Rate,
 PhyStatus,

//pclkcontrolsignal
 PCLKRate,
 PclkChangeAck,
 PclkChangeOk,
//eq_signals
 LocalTxPresetCoefficients,
 TxDeemph,
 LocalFS,
 LocalLF,
 LocalPresetIndex,
 GetLocalPresetCoeffcients,
 LocalTxCoefficientsValid,
LF,
FS,
RxEqEval,
InvalidRequest,
LinkEvaluationFeedbackDirectionChange,

pl_trdy,
lp_irdy,
lp_data,
lp_valid,
pl_data,
pl_valid,
lp_state_req,
pl_state_sts,
pl_speedmode,////////////////////////////////////////
lp_force_detect,
////lPIF start & end of TLP DLLP
lp_dlpstart,
lp_dlpend,
lp_tlpstart,
lp_tlpend,
pl_dlpstart,
pl_dlpend,
pl_tlpstart,
pl_tlpend,
pl_tlpedb,
linkUp,
//optional Message bus
M2P_MessageBus,
P2M_MessageBus
);

assign {RxData,RxDataValid,RxDataK,RxValid} = {TxData,TxDataValid,TxDataK,TxDataValid}; 
endmodule
*/