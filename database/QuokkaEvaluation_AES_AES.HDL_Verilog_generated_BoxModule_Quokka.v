module work_Quokka_BoardSignalsProc (
	BoardSignals_Clock,
	BoardSignals_Reset,
	BoardSignals_Running,
	BoardSignals_Starting,
	BoardSignals_Started,
	Clock,
	Reset,
	InternalReset
	);

	input wire Clock;
	inout wire Reset;
	input wire InternalReset;

	output wire BoardSignals_Clock;
	output wire BoardSignals_Reset;
	output wire BoardSignals_Running;
	output wire BoardSignals_Starting;
	output wire BoardSignals_Started;
	
	reg internalRunning = 0;
	reg internalStarted = 0;
	
	assign BoardSignals_Clock = Clock;
	assign BoardSignals_Reset = Reset | InternalReset;
	assign BoardSignals_Running = internalRunning;
	assign BoardSignals_Started = internalStarted;
	assign BoardSignals_Starting = internalRunning & !internalStarted;

	
	always @ (posedge BoardSignals_Clock)
	begin
		if (BoardSignals_Reset) begin
			internalRunning <= 0;
			internalStarted <= 0;
		end
		else begin
			if ( BoardSignals_Running ) begin
				internalStarted <= 1;
			end
			
			internalRunning <= 1;
		end
	end
endmodule

module work_Quokka_Metastability(Clock, Reset, in, out);
input Clock;
input Reset;
input in;
output out;
reg [2:1] buff = 2'b00;

always @(posedge Clock)
begin
	if (Reset)
		begin
			buff <= 2'b00;
		end
	else
		begin
			buff <= {buff[1], in};
		end;
end

assign out = buff[2];

endmodule
