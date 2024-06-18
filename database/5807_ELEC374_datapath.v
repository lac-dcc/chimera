// This program was cloned from: https://github.com/martinmaly21/ELEC374
// License: MIT License

module datapath(
	input Clock,
	Reset,
	Stop

);
	 
	 wire     PCin, 
    PCout, 
	 IncPC,
    IRin, 
    Clear, 
    Yin, 
    MARin,
    MDRin, 
    MDRout, 
    Read, 
    HIin, 
    HIout, 
    LOin, 
    LOout, 
    Zhighin,
    Zlowin,
	 Zhighout,
    Zlowout,
    Cout,
    InPortout,
	 wren,
	 outPortEnable,
 	 Rin,
	 Rout,
	 BAout,
	 conInput,
	 IRout;
	 
	 wire [3:0] ctrl;
    
	 
	 wire [15:0] inEnableR, outEnableR; //register in and out enables

    
    wire [31:0] MDRinput, toOutputUnit, fromInputUnit;
	 
	 wire [31:0] alu_hi_dataOut, alu_lo_dataOut, BusMuxOut;

    //inputs for the Bus
    wire [31:0] R0dataOut, R1dataOut,  R2dataOut, R3dataOut, R4dataOut,
    R5dataOut, R6dataOut, R7dataOut, R8dataOut, R9dataOut, R10dataOut,
    R11dataOut, R12dataOut, R13dataOut, R14dataOut, R15dataOut, 
    ZhighdataOut, ZlowdataOut, HIdataOut, LOdataOut, PCdataOut, MDRdataOut, InPortdataOut, CSignExtdataOut, IRdataOut;

    wire PCOut, Run;
	 
	 wire Gra, Grb, Grc; 
	 
	 
	 wire [8:0] address;

    wire [31:0] yContents;
	
	 wire conOutput;		

	//input  reg [7:0] address
		
		
	 select_encode_logic encodeLogic ( 
	     IRdataOut, 
		  Gra, 
		  Grb, 
		  Grc, 
		  Rin, 
		  Rout, 
		  BAout, 
		  inEnableR, 
		  outEnableR, 
		  CSignExtdataOut
	 ); 

    //Registers
	 //TODO, chnage all reg inputs and outputs ENABLE signal to array thing so it works
    Register_0 R0 (Clock, Clear, BusMuxOut, inEnableR[0], R0dataOut, BAout);
    Register #(3) R1 (Clock, Clear, BusMuxOut, inEnableR[1], R1dataOut);
    Register #(16) R2 (Clock, Clear, BusMuxOut, inEnableR[2], R2dataOut);
    Register #(85) R3 (Clock, Clear, BusMuxOut, inEnableR[3], R3dataOut);
    Register #(2) R4 (Clock, Clear, BusMuxOut, inEnableR[4], R4dataOut);
    Register #(15) R5 (Clock, Clear, BusMuxOut, inEnableR[5], R5dataOut);
    Register #(16) R6 (Clock, Clear, BusMuxOut, inEnableR[6], R6dataOut);
    Register R7 (Clock, Clear, BusMuxOut, inEnableR[7], R7dataOut);
    Register R8 (Clock, Clear, BusMuxOut, inEnableR[8], R8dataOut);
    Register R9 (Clock, Clear, BusMuxOut, inEnableR[9], R9dataOut);
    Register R10 (Clock, Clear, BusMuxOut, inEnableR[10], R10dataOut);
    Register R11 (Clock, Clear, BusMuxOut, inEnableR[11], R11dataOut);
    Register #(32) R12 (Clock, Clear, BusMuxOut, inEnableR[12], R12dataOut);
    Register R13 (Clock, Clear, BusMuxOut, inEnableR[13], R13dataOut);
    Register R14 (Clock, Clear, BusMuxOut, inEnableR[14], R14dataOut);
	 //15 is special
    Register R15 (Clock, Clear, BusMuxOut, inEnableR[15], R15dataOut);

    Register #(64) HI (Clock, Clear, BusMuxOut, HIin, HIdataOut);
    Register #(32) LO (Clock, Clear, BusMuxOut, LOin, LOdataOut);
	
    Register zHI (Clock, Clear, alu_hi_dataOut, Zhighin, ZhighdataOut);
    Register zLO (Clock, Clear, alu_lo_dataOut, Zlowin, ZlowdataOut);

    Register #(1) PC  (Clock, Clear, BusMuxOut, PCin, PCdataOut);
    Register IR (Clock, Clear, BusMuxOut, IRin, IRdataOut);

		wire thisIsUseless;
		
    Register #(17) inPORT (Clock, Clear, BusMuxOut, thisIsUseless, InPortdataOut);
    Register Y (Clock, Clear, BusMuxOut, Yin, yContents);
	 
	// IncPCModule PCCounter (Clock, IncPC, Enable,);
	 


    //TODO: bus
	     //TODO: bus
	 BUS bus (
	 .R0out(outEnableR[0]),
	 .R1out(outEnableR[1]),
	 .R2out(outEnableR[2]),
	 .R3out(outEnableR[3]),
	 .R4out(outEnableR[4]),
	 .R5out(outEnableR[5]),
	 .R6out(outEnableR[6]),
	 .R7out(outEnableR[7]),
	 .R8out(outEnableR[8]),
	 .R9out(outEnableR[9]),
	 .R10out(outEnableR[10]),
	 .R11out(outEnableR[11]),
	 .R12out(outEnableR[12]),
	 .R13out(outEnableR[13]),
	 .R14out(outEnableR[14]),
	 .R15out(outEnableR[15]),
	 .PCout(PCout),
	 .Zhighout(Zhighout),
	 .Zlowout(Zlowout),
	 .MDRout(MDRout),
	 .HIout(HIout),
	 .LOout(LOout),
	 .Cout(Cout),
	 .InPortout(InPortout),
	 .IRout(IRout),
	 
	 .R0dataOut(R0dataOut),
	 .R1dataOut(R1dataOut),
	 .R2dataOut(R2dataOut),
	 .R3dataOut(R3dataOut),
	 .R4dataOut(R4dataOut),
	 .R5dataOut(R5dataOut),
	 .R6dataOut(R6dataOut),
	 .R7dataOut(R7dataOut),
	 .R8dataOut(R8dataOut),
	 .R9dataOut(R9dataOut),
	 .R10dataOut(R10dataOut),
	 .R11dataOut(R11dataOut),
	 .R12dataOut(R12dataOut),
	 .R13dataOut(R13dataOut),
	 .R14dataOut(R14dataOut),
	 .R15dataOut(R15dataOut),
	 .PCdataOut(PCdataOut),
	 .HIdataOut(HIdataOut),
	 .LOdataOut(LOdataOut),
	 .ZhighdataOut(ZhighdataOut),
	 .ZlowdataOut(ZlowdataOut),
	 .MDRdataOut(MDRdataOut),
	 .InPortdataOut(InPortdataOut),
	 .CSignExtdataOut(CSignExtdataOut),
	 .BusMuxOut(BusMuxOut),
	 .IRdataOut(IRdataOut)
	 );
	 
	 control_unit the_control_unit(
		.MDRout(MDRout), 
		.PCout(PCout), 
		.Zhighout(Zhighout), 
		.Zlowout(Zlowout), 
		.HIout(HIout), 
		.LOout(LOout), 
		.Rin(Rin), 
		.Rout(Rout), 
		.Gra(Gra), 
		.Grb(Grb), 
		.Grc(Grc), 
		.HIin(HIin), 
		.LOin(LOin), 
		.conInput(conInput), 
		.PCin(PCin), 
		.IRin(IRin), 
		.Yin(Yin), 
		.Zlowin(Zlowin), 
		.Zhighin(Zhighin),
		.MARin(MARin), 
		.MDRin(MDRin), 
		.OutportIn(outPortEnable), 
		.Cout(Cout), 
		.BAout(BAout), 
		.wren(wren), 
		.enableInport(thisIsUseless), 
		.Run(Run), 
		.Clear(Clear),
		.ctrl(ctrl),
		.IncPC(IncPC),
		.read(Read),
		.outPortEnable(outPortEnable), 
		.InPortout(InPortout),
		.Clock(Clock),
		.Reset(Reset),
		.Stop(Stop),
		.conOut(conOutput),
		.IR(IRdataOut)
	);
	 

//    ALU alu (
//        .a_in(yContents),
//        .b_in(BusMuxOut), 
//        .c_lo_out(alu_lo_dataOut),
//        .c_hi_out(alu_hi_dataOut),
//        .ctrl(ctrl)
//    );
//	 
	ram2 my_ram (
	
	address,
	Clock,
	MDRdataOut,
	wren,
	MDRinput
	);
	
	//make sure all bless todo, make all wires in data path, check all order with the . in parameter
//	MAR mar (Clock, 
//	  Clear,
//	  BusMuxOut,
//	  MARin,
//	  address
//);
//
// CON_FF conFF(
//	IRdataOut[20:19],
//	BusMuxOut,
//	conInput,
//	conOutput
//);

    //TODO: MDR
	// MDR memDR (Clock, Clear, Read, MDRin, BusMuxOut, MDRinput, MDRdataOut);

	//outPort out_port (Clock, Clear, BusMuxOut, outPortEnable, toOutputUnit);
	
	//THIS COULD BE A BIG ERROR! Do we use inPortdataOut OR inPortOut??
	//inPort in_port (Clock, Clear, fromInputUnit, InPortdataOut);

endmodule