// first implementation
module work_IConcreteExternalPackage1_ExternalEntity ( 
		Clock,
		Reset,
		InSignal,
		OutSignal,
		InTrigger,
		OutReady
	);
input wire Clock;
input wire Reset;
input wire unsigned [8:1] InSignal;
output wire unsigned [8:1] OutSignal;
input wire InTrigger;
output wire OutReady;

assign OutSignal = InSignal + 1;
assign OutReady = 1;
endmodule
