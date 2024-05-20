// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

// 240405

`default_nettype none

module SlaveSPI (
	input  wire Clock,
	input  wire Reset,
	
	input  wire CS_i,					// Chip select, active low
	input  wire SCK_i,					// Serial clock
	input  wire MOSI_i,					// Master Out, Slave In
	output wire MISO_o,					// Master In, Slave Out
	
	input  wire [7:0] DataToSend_i,		// Byte to be sent via MISO
	output reg  [7:0] DataReceived_o,	// Byte received from MOSI
	output reg  TransactionDone_o,		// High strobe after a byte is sent and received
	output wire TransmissionStart_o,	// High strobe after CS input goes low
	output wire TransmissionEnd_o		// High strobe after CS input goes high
);
	
	// Syncronize CS, SCK and MOSI with clock domain
	wire SyncCS;
	wire SyncSCK;
	wire SyncMOSI;
	
	Synchronizer #(
		.WIDTH(3)
	) Synchronizer_inst(
		.Clock(Clock),
		.Reset(Reset),
		.Async_i({CS_i, SCK_i, MOSI_i}),
		.Sync_o({SyncCS, SyncSCK, SyncMOSI})
	);
	
	// Recognize events
	wire TransmissionInProgress = !SyncCS;
	wire InputSampleRequest;
	wire OutputShiftRequest;
	
	EdgeDetector EdgeDetectorCS(
		.Clock(Clock),
		.Reset(Reset),
		.Signal_i(SyncCS),
		.RisingEdge_o(TransmissionEnd_o),
		.FallingEdge_o(TransmissionStart_o)
	);
	
	EdgeDetector EdgeDetectorSCK(
		.Clock(Clock),
		.Reset(Reset),
		.Signal_i(SyncSCK),
		.RisingEdge_o(InputSampleRequest),
		.FallingEdge_o(OutputShiftRequest)
	);
	
	// Receiver
	reg [2:0] BitCounter;
	
	always @(posedge Clock, negedge Reset) begin
		if(!Reset) begin
			BitCounter		<= 0;
			DataReceived_o	<= 0;
		end 
		
		else if(TransmissionStart_o) begin
			BitCounter		<= 0;
		end
		
		else if(TransmissionInProgress && InputSampleRequest) begin
			BitCounter		<= BitCounter + 1'b1;
			DataReceived_o	<= {DataReceived_o[6:0], SyncMOSI};
		end
	end
	
	// Done event
	always @(posedge Clock, negedge Reset) begin
		if(!Reset)
			TransactionDone_o <= 0;
		else if(InputSampleRequest && BitCounter == 3'd7)
			TransactionDone_o <= 1;
		else
			TransactionDone_o <= 0;
	end
	
	// Transmiter
	reg [7:0] DataToSend;
	
	always @(posedge Clock, negedge Reset) begin
		if(!Reset) begin
			DataToSend <= 0;
		end 
		
		else if(TransmissionStart_o || (OutputShiftRequest && BitCounter == 3'd0)) begin
			DataToSend <= DataToSend_i;
		end
		
		else if(OutputShiftRequest) begin
			DataToSend <= DataToSend << 1;
		end
	end
	
	// Transmiter output
	assign MISO_o = TransmissionInProgress ? DataToSend[7] : 1'bZ;
	
endmodule

`default_nettype wire
