module fx68k (
	clk,
	HALTn,
	extReset,
	pwrUp,
	enPhi1,
	enPhi2,
	eRWn,
	ASn,
	LDSn,
	UDSn,
	E,
	VMAn,
	FC0,
	FC1,
	FC2,
	BGn,
	oRESETn,
	oHALTEDn,
	DTACKn,
	VPAn,
	BERRn,
	BRn,
	BGACKn,
	IPL0n,
	IPL1n,
	IPL2n,
	iEdb,
	oEdb,
	eab
);
	input clk;
	input HALTn;
	input extReset;
	input pwrUp;
	input enPhi1;
	input enPhi2;
	output eRWn;
	output ASn;
	output LDSn;
	output UDSn;
	output reg E;
	output VMAn;
	output FC0;
	output FC1;
	output FC2;
	output BGn;
	output oRESETn;
	output oHALTEDn;
	input DTACKn;
	input VPAn;
	input BERRn;
	input BRn;
	input BGACKn;
	input IPL0n;
	input IPL1n;
	input IPL2n;
	input [15:0] iEdb;
	output [15:0] oEdb;
	output [23:1] eab;
  
	wire [4:0] Clks;
	assign Clks[4] = clk;
	assign Clks[3] = extReset;
	assign Clks[2] = pwrUp;
	assign Clks[1] = enPhi1;
	assign Clks[0] = enPhi2;
	wire wClk;
	reg [31:0] tState;
  localparam [31:0] T0 = 0;
  localparam [31:0] T1 = 1;
  localparam [31:0] T2 = 2;
  localparam [31:0] T3 = 3;
  localparam [31:0] T4 = 4;
  wire enT1 = (Clks[1] & (tState == T4)) & ~wClk;
	wire enT2 = Clks[0] & (tState == T1);
	wire enT3 = Clks[1] & (tState == T2);
	wire enT4 = Clks[0] & ((tState == T0) | (tState == T3));
	always @(posedge Clks[4])
		if (Clks[2])
			tState <= T0;
		else
			case (tState)
				T0:
					if (Clks[0])
						tState <= T4;
				T1:
					if (Clks[0])
						tState <= T2;
				T2:
					if (Clks[1])
						tState <= T3;
				T3:
					if (Clks[0])
						tState <= T4;
				T4:
					if (Clks[1])
						tState <= (wClk ? T0 : T1);
			endcase
	reg rDtack;
	reg rBerr;
	reg [2:0] rIpl;
	reg [2:0] iIpl;
	reg Vpai;
	reg BeI;
	reg Halti;
	reg BRi;
	reg BgackI;
	reg BeiDelay;
	wire BeDebounced = ~(BeI | BeiDelay);
	always @(posedge Clks[4])
		if (Clks[2]) begin
			rBerr <= 1'b0;
			BeI <= 1'b0;
		end
		else if (Clks[0]) begin
			rDtack <= DTACKn;
			rBerr <= BERRn;
			rIpl <= ~{IPL2n, IPL1n, IPL0n};
			iIpl <= rIpl;
		end
		else if (Clks[1]) begin
			Vpai <= VPAn;
			BeI <= rBerr;
			BeiDelay <= BeI;
			BgackI <= BGACKn;
			BRi <= BRn;
			Halti <= HALTn;
		end
	localparam NANO_WIDTH = 68;
	reg [NANO_WIDTH - 1:0] nanoLatch;
	wire [NANO_WIDTH - 1:0] nanoOutput;
	localparam UROM_WIDTH = 17;
	reg [UROM_WIDTH - 1:0] microLatch;
	wire [UROM_WIDTH - 1:0] microOutput;
	localparam UADDR_WIDTH = 10;
	reg [UADDR_WIDTH - 1:0] microAddr;
	wire [UADDR_WIDTH - 1:0] nma;
	localparam NADDR_WIDTH = 9;
	reg [NADDR_WIDTH - 1:0] nanoAddr;
	wire [NADDR_WIDTH - 1:0] orgAddr;
	wire rstUrom;
	microToNanoAddr microToNanoAddr(
		.uAddr(nma),
		.orgAddr(orgAddr)
	);
	nanoRom nanoRom(
		.clk(Clks[4]),
		.nanoAddr(nanoAddr),
		.nanoOutput(nanoOutput)
	);
	uRom uRom(
		.clk(Clks[4]),
		.microAddr(microAddr),
		.microOutput(microOutput)
	);
	localparam RSTP0_NMA = 'h002;
	always @(posedge Clks[4]) begin
		if (Clks[2]) begin
			microAddr <= RSTP0_NMA;
			nanoAddr <= RSTP0_NMA;
		end
		else if (enT1) begin
			microAddr <= nma;
			nanoAddr <= orgAddr;
		end
		if (Clks[3]) begin
			microLatch <= 'sd0;
			nanoLatch <= 'sd0;
		end
		else if (rstUrom) begin
			{microLatch[16], microLatch[15], microLatch[0]} <= 'sd0;
			nanoLatch <= 'sd0;
		end
		else if (enT3) begin
			microLatch <= microOutput;
			nanoLatch <= nanoOutput;
		end
	end
	wire [104:0] Nanod;
	wire [41:0] Irdecod;
	reg Tpend;
	reg intPend;
	reg pswT;
	reg pswS;
	reg [2:0] pswI;
	wire [7:0] ccr;
	wire [15:0] psw = {pswT, 1'b0, pswS, 2'b00, pswI, ccr};
	reg [15:0] ftu;
	wire [15:0] Irc;
	reg [15:0] Ir;
	reg [15:0] Ird;
	wire [15:0] alue;
	wire [15:0] Abl;
	wire prenEmpty;
	wire au05z;
	wire dcr4;
	wire ze;
	wire [UADDR_WIDTH - 1:0] a1;
	wire [UADDR_WIDTH - 1:0] a2;
	wire [UADDR_WIDTH - 1:0] a3;
	wire isPriv;
	wire isIllegal;
	wire isLineA;
	wire isLineF;
	always @(posedge Clks[4])
		if (enT1)
			if (Nanod[81])
				Ird <= Ir;
			else if (microLatch[0])
				Ir <= Irc;
	wire [3:0] tvn;
	wire waitBusCycle;
	wire busStarting;
	wire BusRetry = 1'b0;
	wire busAddrErr;
	wire bciWrite;
	wire bgBlock;
	wire busAvail;
	wire addrOe;
	wire busIsByte = Nanod[101] & (Irdecod[32] | Irdecod[31]);
	wire aob0;
	reg iStop;
	reg A0Err;
	reg excRst;
	reg BerrA;
	reg Spuria;
	reg Avia;
	wire Iac;
	reg rAddrErr;
	reg iBusErr;
	reg Err6591;
	wire iAddrErr = rAddrErr & addrOe;
	wire enErrClk;
	assign rstUrom = Clks[1] & enErrClk;
	uaddrDecode uaddrDecode(
		.opcode(Ir),
		.a1(a1),
		.a2(a2),
		.a3(a3),
		.isPriv(isPriv),
		.isIllegal(isIllegal),
		.isLineA(isLineA),
		.isLineF(isLineF),
		.lineBmap()
	);
	sequencer sequencer(
		.Clks(Clks),
		.enT3(enT3),
		.microLatch(microLatch),
		.Ird(Ird),
		.A0Err(A0Err),
		.excRst(excRst),
		.BerrA(BerrA),
		.busAddrErr(busAddrErr),
		.Spuria(Spuria),
		.Avia(Avia),
		.Tpend(Tpend),
		.intPend(intPend),
		.isIllegal(isIllegal),
		.isPriv(isPriv),
		.isLineA(isLineA),
		.isLineF(isLineF),
		.nma(nma),
		.a1(a1),
		.a2(a2),
		.a3(a3),
		.tvn(tvn),
		.psw(psw),
		.prenEmpty(prenEmpty),
		.au05z(au05z),
		.dcr4(dcr4),
		.ze(ze),
		.alue01(alue[1:0]),
		.i11(Irc[11])
	);
	excUnit excUnit(
		.Clks(Clks),
		.Nanod(Nanod),
		.Irdecod(Irdecod),
		.enT1(enT1),
		.enT2(enT2),
		.enT3(enT3),
		.enT4(enT4),
		.Ird(Ird),
		.ftu(ftu),
		.iEdb(iEdb),
		.pswS(pswS),
		.prenEmpty(prenEmpty),
		.au05z(au05z),
		.dcr4(dcr4),
		.ze(ze),
		.AblOut(Abl),
		.eab(eab),
		.aob0(aob0),
		.Irc(Irc),
		.oEdb(oEdb),
		.alue(alue),
		.ccr(ccr)
	);
	nDecoder3 nDecoder(
		.Clks(Clks),
		.Nanod(Nanod),
		.Irdecod(Irdecod),
		.enT2(enT2),
		.enT4(enT4),
		.microLatch(microLatch),
		.nanoLatch(nanoLatch)
	);
	irdDecode irdDecode(
		.ird(Ird),
		.Irdecod(Irdecod)
	);
	busControl busControl(
		.Clks(Clks),
		.enT1(enT1),
		.enT4(enT4),
		.permStart(Nanod[104]),
		.permStop(Nanod[103]),
		.iStop(iStop),
		.aob0(aob0),
		.isWrite(Nanod[102]),
		.isRmc(Nanod[100]),
		.isByte(busIsByte),
		.busAvail(busAvail),
		.bciWrite(bciWrite),
		.addrOe(addrOe),
		.bgBlock(bgBlock),
		.waitBusCycle(waitBusCycle),
		.busStarting(busStarting),
		.busAddrErr(busAddrErr),
		.rDtack(rDtack),
		.BeDebounced(BeDebounced),
		.Vpai(Vpai),
		.ASn(ASn),
		.LDSn(LDSn),
		.UDSn(UDSn),
		.eRWn(eRWn)
	);
	busArbiter busArbiter(
		.Clks(Clks),
		.BRi(BRi),
		.BgackI(BgackI),
		.Halti(Halti),
		.bgBlock(bgBlock),
		.busAvail(busAvail),
		.BGn(BGn)
	);
	wire [1:0] uFc = microLatch[16:15];
	reg oReset;
	reg oHalted;
	assign oRESETn = !oReset;
	assign oHALTEDn = !oHalted;
	always @(posedge Clks[4])
		if (Clks[2]) begin
			oReset <= 1'b0;
			oHalted <= 1'b0;
		end
		else if (enT1) begin
			oReset <= (uFc == 2'b01) & !Nanod[104];
			oHalted <= (uFc == 2'b10) & !Nanod[104];
		end
	reg [2:0] rFC;
	assign {FC2, FC1, FC0} = rFC;
	assign Iac = rFC == 3'b111;
	always @(posedge Clks[4])
		if (Clks[3])
			rFC <= 'sd0;
		else if (enT1 & Nanod[104]) begin
			rFC[2] <= pswS;
			rFC[1] <= microLatch[16] | (~microLatch[15] & Irdecod[41]);
			rFC[0] <= microLatch[15] | (~microLatch[16] & ~Irdecod[41]);
		end
	reg [2:0] inl;
	reg updIll;
	reg prevNmi;
	wire nmi = iIpl == 3'b111;
	wire iplStable = iIpl == rIpl;
	wire iplComp = iIpl > pswI;
	always @(posedge Clks[4]) begin
		if (Clks[3]) begin
			intPend <= 1'b0;
			prevNmi <= 1'b0;
		end
		else begin
			if (Clks[0])
				prevNmi <= nmi;
			if (Clks[0])
				if (iplStable & ((nmi & ~prevNmi) | iplComp))
					intPend <= 1'b1;
				else if (((inl == 3'b111) & Iac) | ((iplStable & !nmi) & !iplComp))
					intPend <= 1'b0;
		end
		if (Clks[3]) begin
			inl <= -'sd1;
			updIll <= 1'b0;
		end
		else if (enT4)
			updIll <= microLatch[0];
		else if (enT1 & updIll)
			inl <= iIpl;
		if (enT4) begin
			Spuria <= ~BeiDelay & Iac;
			Avia <= ~Vpai & Iac;
		end
	end
	assign enErrClk = iAddrErr | iBusErr;
	assign wClk = ((waitBusCycle | ~BeI) | iAddrErr) | Err6591;
	reg [3:0] eCntr;
	reg rVma;
	assign VMAn = rVma;
	wire xVma = ~rVma & (eCntr == 8);
	always @(posedge Clks[4]) begin
		if (Clks[2]) begin
			E <= 1'b0;
			eCntr <= 'sd0;
			rVma <= 1'b1;
		end
		if (Clks[0]) begin
			if (eCntr == 9)
				E <= 1'b0;
			else if (eCntr == 5)
				E <= 1'b1;
			if (eCntr == 9)
				eCntr <= 'sd0;
			else
				eCntr <= eCntr + 1'b1;
		end
		if (((Clks[0] & addrOe) & ~Vpai) & (eCntr == 3))
			rVma <= 1'b0;
		else if (Clks[1] & (eCntr == 'sd0))
			rVma <= 1'b1;
	end
	always @(posedge Clks[4]) begin
		if (Clks[3])
			rAddrErr <= 1'b0;
		else if (Clks[1])
			if (busAddrErr & addrOe)
				rAddrErr <= 1'b1;
			else if (~addrOe)
				rAddrErr <= 1'b0;
		if (Clks[3])
			iBusErr <= 1'b0;
		else if (Clks[1])
			iBusErr <= ((BerrA & ~BeI) & ~Iac) & !BusRetry;
		if (Clks[3])
			BerrA <= 1'b0;
		else if (Clks[0])
			if ((~BeI & ~Iac) & addrOe)
				BerrA <= 1'b1;
			else if (BeI & busStarting)
				BerrA <= 1'b0;
		if (Clks[3])
			excRst <= 1'b1;
		else if (enT2 & Nanod[104])
			excRst <= 1'b0;
		if (Clks[3])
			A0Err <= 1'b1;
		else if (enT3)
			A0Err <= 1'b0;
		else if ((Clks[1] & enErrClk) & (busAddrErr | BerrA))
			A0Err <= 1'b1;
		if (Clks[3]) begin
			iStop <= 1'b0;
			Err6591 <= 1'b0;
		end
		else if (Clks[1])
			Err6591 <= enErrClk;
		else if (Clks[0])
			iStop <= xVma | (Vpai & (iAddrErr | ~rBerr));
	end
	reg irdToCcr_t4;
	always @(posedge Clks[4])
		if (Clks[2]) begin
			Tpend <= 1'b0;
			{pswT, pswS, pswI} <= 'sd0;
			irdToCcr_t4 <= 'sd0;
		end
		else if (enT4)
			irdToCcr_t4 <= Irdecod[38];
		else if (enT3) begin
			if (Nanod[97])
				Tpend <= pswT;
			else if (Nanod[96])
				Tpend <= 1'b0;
			if (Nanod[88] & !irdToCcr_t4)
				{pswT, pswS, pswI} <= {ftu[15], ftu[13], ftu[10:8]};
			else begin
				if (Nanod[82]) begin
					pswS <= 1'b1;
					pswT <= 1'b0;
				end
				if (Nanod[89])
					pswI <= inl;
			end
		end
	reg [4:0] ssw;
	reg [3:0] tvnLatch;
	reg [15:0] tvnMux;
	reg inExcept01;
	always @(posedge Clks[4]) begin
		if (Nanod[61] & enT3)
			ssw <= {~bciWrite, inExcept01, rFC};
		if (enT1 & Nanod[81]) begin
			tvnLatch <= tvn;
			inExcept01 <= tvn != 1;
		end
		if (Clks[2])
			ftu <= 'sd0;
		else if (enT3)
			case (1'b1)
				Nanod[95]: ftu <= tvnMux;
				Nanod[87]: ftu <= {pswT, 1'b0, pswS, 2'b00, pswI, 3'b000, ccr[4:0]};
				Nanod[84]: ftu <= Ird;
				Nanod[83]: ftu[4:0] <= ssw;
				Nanod[85]: ftu <= {12'hFFF, pswI, 1'b0};
				Nanod[94]: ftu <= Irdecod[22-:16];
				Nanod[91]: ftu <= Abl;
				default: ftu <= ftu;
			endcase
	end
	localparam TVN_AUTOVEC = 13;
	localparam TVN_INTERRUPT = 15;
	localparam TVN_SPURIOUS = 12;
	always @(*)
		if (inExcept01) begin
			if (tvnLatch == TVN_SPURIOUS)
				tvnMux = {9'b0, 5'd24, 2'b00};
			else if (tvnLatch == TVN_AUTOVEC)
				tvnMux = {9'b0, 2'b11, pswI, 2'b00};
			else if (tvnLatch == TVN_INTERRUPT)
				tvnMux = {6'b0, Ird[7:0], 2'b00};
			else
				tvnMux = {10'b0, tvnLatch, 2'b00};
		end
		else
			tvnMux = {8'h0, Irdecod[6-:6], 2'b00};
endmodule
module nDecoder3 (
	Clks,
	Irdecod,
	Nanod,
	enT2,
	enT4,
	microLatch,
	nanoLatch
);
	input wire [4:0] Clks;
	input wire [41:0] Irdecod;
	output reg [104:0] Nanod;
	input enT2;
	input enT4;
	localparam UROM_WIDTH = 17;
	input [UROM_WIDTH - 1:0] microLatch;
	localparam NANO_WIDTH = 68;
	input [NANO_WIDTH - 1:0] nanoLatch;
	localparam NANO_IR2IRD = 67;
	localparam NANO_TOIRC = 66;
	localparam NANO_ALU_COL = 63;
	localparam NANO_ALU_FI = 61;
	localparam NANO_TODBIN = 60;
	localparam NANO_ALUE = 57;
	localparam NANO_DCR = 57;
	localparam NANO_DOBCTRL_1 = 56;
	localparam NANO_LOWBYTE = 55;
	localparam NANO_HIGHBYTE = 54;
	localparam NANO_DOBCTRL_0 = 53;
	localparam NANO_ALU_DCTRL = 51;
	localparam NANO_ALU_ACTRL = 50;
	localparam NANO_DBD2ALUB = 49;
	localparam NANO_ABD2ALUB = 48;
	localparam NANO_DBIN2DBD = 47;
	localparam NANO_DBIN2ABD = 46;
	localparam NANO_ALU2ABD = 45;
	localparam NANO_ALU2DBD = 44;
	localparam NANO_RZ = 43;
	localparam NANO_BUSBYTE = 42;
	localparam NANO_PCLABL = 41;
	localparam NANO_RXL_DBL = 40;
	localparam NANO_PCLDBL = 39;
	localparam NANO_ABDHRECHARGE = 38;
	localparam NANO_REG2ABL = 37;
	localparam NANO_ABL2REG = 36;
	localparam NANO_ABLABD = 35;
	localparam NANO_DBLDBD = 34;
	localparam NANO_DBL2REG = 33;
	localparam NANO_REG2DBL = 32;
	localparam NANO_ATLCTRL = 29;
	localparam NANO_FTUCONTROL = 25;
	localparam NANO_SSP = 24;
	localparam NANO_RXH_DBH = 22;
	localparam NANO_AUOUT = 20;
	localparam NANO_AUCLKEN = 19;
	localparam NANO_AUCTRL = 16;
	localparam NANO_DBLDBH = 15;
	localparam NANO_ABLABH = 14;
	localparam NANO_EXT_ABH = 13;
	localparam NANO_EXT_DBH = 12;
	localparam NANO_ATHCTRL = 9;
	localparam NANO_REG2ABH = 8;
	localparam NANO_ABH2REG = 7;
	localparam NANO_REG2DBH = 6;
	localparam NANO_DBH2REG = 5;
	localparam NANO_AOBCTRL = 3;
	localparam NANO_PCH = 0;
	localparam NANO_NO_SP_ALGN = 0;
	localparam NANO_FTU_UPDTPEND = 1;
	localparam NANO_FTU_INIT_ST = 15;
	localparam NANO_FTU_CLRTPEND = 14;
	localparam NANO_FTU_TVN = 13;
	localparam NANO_FTU_ABL2PREN = 12;
	localparam NANO_FTU_SSW = 11;
	localparam NANO_FTU_RSTPREN = 10;
	localparam NANO_FTU_IRD = 9;
	localparam NANO_FTU_2ABL = 8;
	localparam NANO_FTU_RDSR = 7;
	localparam NANO_FTU_INL = 6;
	localparam NANO_FTU_PSWI = 5;
	localparam NANO_FTU_DBL = 4;
	localparam NANO_FTU_2SR = 2;
	localparam NANO_FTU_CONST = 1;
	reg [3:0] ftuCtrl;
	wire [2:0] athCtrl;
	wire [2:0] atlCtrl;
	assign athCtrl = nanoLatch[NANO_ATHCTRL + 2:NANO_ATHCTRL];
	assign atlCtrl = nanoLatch[NANO_ATLCTRL + 2:NANO_ATLCTRL];
	wire [1:0] aobCtrl = nanoLatch[NANO_AOBCTRL + 1:NANO_AOBCTRL];
	wire [1:0] dobCtrl = {nanoLatch[NANO_DOBCTRL_1], nanoLatch[NANO_DOBCTRL_0]};
	always @(posedge Clks[4])
		if (enT4) begin
			ftuCtrl <= {nanoLatch[NANO_FTUCONTROL], nanoLatch[NANO_FTUCONTROL + 1], nanoLatch[NANO_FTUCONTROL + 2], nanoLatch[NANO_FTUCONTROL + 3]};
			Nanod[80] <= !nanoLatch[NANO_AUCLKEN];
			Nanod[78-:3] <= nanoLatch[NANO_AUCTRL + 2:NANO_AUCTRL];
			Nanod[79] <= nanoLatch[NANO_NO_SP_ALGN + 1:NANO_NO_SP_ALGN] == 2'b11;
			Nanod[6] <= nanoLatch[NANO_EXT_DBH];
			Nanod[5] <= nanoLatch[NANO_EXT_ABH];
			Nanod[75] <= nanoLatch[NANO_TODBIN];
			Nanod[74] <= nanoLatch[NANO_TOIRC];
			Nanod[4] <= nanoLatch[NANO_ABLABD];
			Nanod[3] <= nanoLatch[NANO_ABLABH];
			Nanod[2] <= nanoLatch[NANO_DBLDBD];
			Nanod[1] <= nanoLatch[NANO_DBLDBH];
			Nanod[73] <= atlCtrl == 3'b010;
			Nanod[70] <= atlCtrl == 3'b011;
			Nanod[72] <= atlCtrl == 3'b100;
			Nanod[71] <= atlCtrl == 3'b101;
			Nanod[62] <= athCtrl == 3'b101;
			Nanod[69] <= (athCtrl == 3'b001) | (athCtrl == 3'b101);
			Nanod[68] <= athCtrl == 3'b100;
			Nanod[67] <= athCtrl == 3'b110;
			Nanod[66] <= athCtrl == 3'b011;
			Nanod[13] <= nanoLatch[NANO_ALU2DBD];
			Nanod[12] <= nanoLatch[NANO_ALU2ABD];
			Nanod[19] <= nanoLatch[NANO_DCR + 1:NANO_DCR] == 2'b11;
			Nanod[18] <= nanoLatch[NANO_DCR + 2:NANO_DCR + 1] == 2'b11;
			Nanod[17] <= nanoLatch[NANO_ALUE + 2:NANO_ALUE + 1] == 2'b10;
			Nanod[16] <= nanoLatch[NANO_ALUE + 1:NANO_ALUE] == 2'b01;
			Nanod[15] <= nanoLatch[NANO_DBD2ALUB];
			Nanod[14] <= nanoLatch[NANO_ABD2ALUB];
			Nanod[60-:2] <= dobCtrl;
		end
	always @(*) Nanod[61] = Nanod[62];
	always @(*) Nanod[97] = ftuCtrl == NANO_FTU_UPDTPEND;
	always @(*) Nanod[96] = ftuCtrl == NANO_FTU_CLRTPEND;
	always @(*) Nanod[95] = ftuCtrl == NANO_FTU_TVN;
	always @(*) Nanod[94] = ftuCtrl == NANO_FTU_CONST;
	always @(*) Nanod[93] = (ftuCtrl == NANO_FTU_DBL) | (ftuCtrl == NANO_FTU_INL);
	always @(*) Nanod[92] = ftuCtrl == NANO_FTU_2ABL;
	always @(*) Nanod[89] = ftuCtrl == NANO_FTU_INL;
	always @(*) Nanod[85] = ftuCtrl == NANO_FTU_PSWI;
	always @(*) Nanod[88] = ftuCtrl == NANO_FTU_2SR;
	always @(*) Nanod[87] = ftuCtrl == NANO_FTU_RDSR;
	always @(*) Nanod[84] = ftuCtrl == NANO_FTU_IRD;
	always @(*) Nanod[83] = ftuCtrl == NANO_FTU_SSW;
	always @(*) Nanod[82] = ((ftuCtrl == NANO_FTU_INL) | (ftuCtrl == NANO_FTU_CLRTPEND)) | (ftuCtrl == NANO_FTU_INIT_ST);
	always @(*) Nanod[91] = ftuCtrl == NANO_FTU_ABL2PREN;
	always @(*) Nanod[90] = ftuCtrl == NANO_FTU_RSTPREN;
	always @(*) Nanod[81] = nanoLatch[NANO_IR2IRD];
	always @(*) Nanod[24-:2] = nanoLatch[NANO_ALU_DCTRL + 1:NANO_ALU_DCTRL];
	always @(*) Nanod[22] = nanoLatch[NANO_ALU_ACTRL];
	always @(*) Nanod[27-:3] = {nanoLatch[NANO_ALU_COL], nanoLatch[NANO_ALU_COL + 1], nanoLatch[NANO_ALU_COL + 2]};
	wire [1:0] aluFinInit = nanoLatch[NANO_ALU_FI + 1:NANO_ALU_FI];
	always @(*) Nanod[20] = aluFinInit == 2'b10;
	always @(*) Nanod[21] = aluFinInit == 2'b01;
	always @(*) Nanod[86] = aluFinInit == 2'b11;
	always @(*) Nanod[0] = nanoLatch[NANO_ABDHRECHARGE];
	always @(*) Nanod[11] = nanoLatch[NANO_AUOUT + 1:NANO_AUOUT] == 2'b01;
	always @(*) Nanod[10] = nanoLatch[NANO_AUOUT + 1:NANO_AUOUT] == 2'b10;
	always @(*) Nanod[9] = nanoLatch[NANO_AUOUT + 1:NANO_AUOUT] == 2'b11;
	always @(*) Nanod[65] = aobCtrl == 2'b10;
	always @(*) Nanod[64] = aobCtrl == 2'b01;
	always @(*) Nanod[63] = aobCtrl == 2'b11;
	always @(*) Nanod[8] = nanoLatch[NANO_DBIN2ABD];
	always @(*) Nanod[7] = nanoLatch[NANO_DBIN2DBD];
	always @(*) Nanod[104] = |aobCtrl;
	always @(*) Nanod[102] = |dobCtrl;
	always @(*) Nanod[103] = (nanoLatch[NANO_TOIRC] | nanoLatch[NANO_TODBIN]) | Nanod[102];
	always @(*) Nanod[101] = nanoLatch[NANO_BUSBYTE];
	always @(*) Nanod[99] = nanoLatch[NANO_LOWBYTE];
	always @(*) Nanod[98] = nanoLatch[NANO_HIGHBYTE];
	always @(*) Nanod[57] = nanoLatch[NANO_ABL2REG];
	always @(*) Nanod[58] = nanoLatch[NANO_ABH2REG];
	always @(*) Nanod[53] = nanoLatch[NANO_DBL2REG];
	always @(*) Nanod[54] = nanoLatch[NANO_DBH2REG];
	always @(*) Nanod[52] = nanoLatch[NANO_REG2DBL];
	always @(*) Nanod[51] = nanoLatch[NANO_REG2DBH];
	always @(*) Nanod[56] = nanoLatch[NANO_REG2ABL];
	always @(*) Nanod[55] = nanoLatch[NANO_REG2ABH];
	always @(*) Nanod[50] = nanoLatch[NANO_SSP];
	always @(*) Nanod[29] = nanoLatch[NANO_RZ];
	wire dtldbd = 1'b0;
	wire dthdbh = 1'b0;
	wire dtlabd = 1'b0;
	wire dthabh = 1'b0;
	wire dblSpecial = Nanod[48] | dtldbd;
	wire dbhSpecial = Nanod[49] | dthdbh;
	wire ablSpecial = Nanod[47] | dtlabd;
	wire abhSpecial = Nanod[46] | dthabh;
	always @(*) Nanod[28] = nanoLatch[NANO_RXL_DBL];
	wire isPcRel = Irdecod[41] & !Nanod[29];
	wire pcRelDbl = isPcRel & !nanoLatch[NANO_RXL_DBL];
	wire pcRelDbh = isPcRel & !nanoLatch[NANO_RXH_DBH];
	wire pcRelAbl = isPcRel & nanoLatch[NANO_RXL_DBL];
	wire pcRelAbh = isPcRel & nanoLatch[NANO_RXH_DBH];
	always @(*) Nanod[48] = nanoLatch[NANO_PCLDBL] | pcRelDbl;
	always @(*) Nanod[49] = (nanoLatch[NANO_PCH + 1:NANO_PCH] == 2'b01) | pcRelDbh;
	always @(*) Nanod[47] = nanoLatch[NANO_PCLABL] | pcRelAbl;
	always @(*) Nanod[46] = (nanoLatch[NANO_PCH + 1:NANO_PCH] == 2'b10) | pcRelAbh;
	always @(posedge Clks[4]) begin
		if (enT4) begin
			Nanod[41] <= (Nanod[52] & !dblSpecial) & nanoLatch[NANO_RXL_DBL];
			Nanod[40] <= (Nanod[56] & !ablSpecial) & !nanoLatch[NANO_RXL_DBL];
			Nanod[43] <= (Nanod[53] & !dblSpecial) & nanoLatch[NANO_RXL_DBL];
			Nanod[39] <= (Nanod[57] & !ablSpecial) & !nanoLatch[NANO_RXL_DBL];
			Nanod[45] <= (Nanod[51] & !dbhSpecial) & nanoLatch[NANO_RXH_DBH];
			Nanod[44] <= (Nanod[55] & !abhSpecial) & !nanoLatch[NANO_RXH_DBH];
			Nanod[42] <= (Nanod[54] & !dbhSpecial) & nanoLatch[NANO_RXH_DBH];
			Nanod[38] <= (Nanod[58] & !abhSpecial) & !nanoLatch[NANO_RXH_DBH];
			Nanod[37] <= (Nanod[54] & !dbhSpecial) & !nanoLatch[NANO_RXH_DBH];
			Nanod[36] <= (Nanod[58] & !abhSpecial) & nanoLatch[NANO_RXH_DBH];
			Nanod[31] <= (Nanod[53] & !dblSpecial) & !nanoLatch[NANO_RXL_DBL];
			Nanod[30] <= (Nanod[57] & !ablSpecial) & nanoLatch[NANO_RXL_DBL];
			Nanod[35] <= (Nanod[52] & !dblSpecial) & !nanoLatch[NANO_RXL_DBL];
			Nanod[34] <= (Nanod[56] & !ablSpecial) & nanoLatch[NANO_RXL_DBL];
			Nanod[33] <= (Nanod[51] & !dbhSpecial) & !nanoLatch[NANO_RXH_DBH];
			Nanod[32] <= (Nanod[55] & !abhSpecial) & nanoLatch[NANO_RXH_DBH];
		end
		if (enT4)
			Nanod[100] <= Irdecod[40] & nanoLatch[NANO_BUSBYTE];
	end
endmodule
module irdDecode (
	ird,
	Irdecod
);
	input [15:0] ird;
	output reg [41:0] Irdecod;
	wire [3:0] line = ird[15:12];
	wire [15:0] lineOnehot;
	onehotEncoder4 irdLines(
		.bin(line),
		.bitMap(lineOnehot)
	);
	wire isRegShift = lineOnehot['he] & (ird[7:6] != 2'b11);
	wire isDynShift = isRegShift & ird[5];
	always @(*) Irdecod[41] = ((&ird[5:3] & ~isDynShift) & !ird[2]) & ird[1];
	always @(*) Irdecod[40] = lineOnehot[4] & (ird[11:6] == 6'b101011);
	always @(*) Irdecod[30-:3] = ird[11:9];
	always @(*) Irdecod[27-:3] = ird[2:0];
	wire isPreDecr = ird[5:3] == 3'b100;
	wire eaAreg = ird[5:3] == 3'b001;
	always @(*)
		case (1'b1)
			lineOnehot[1], lineOnehot[2], lineOnehot[3]: Irdecod[24] = |ird[8:6];
			lineOnehot[4]: Irdecod[24] = &ird[8:6];
			lineOnehot['h8]: Irdecod[24] = (eaAreg & ird[8]) & ~ird[7];
			lineOnehot['hc]: Irdecod[24] = (eaAreg & ird[8]) & ~ird[7];
			lineOnehot['h9], lineOnehot['hb], lineOnehot['hd]: Irdecod[24] = (ird[7] & ird[6]) | ((eaAreg & ird[8]) & (ird[7:6] != 2'b11));
			default: Irdecod[24] = Irdecod[39];
		endcase
	always @(*) Irdecod[34] = (lineOnehot[4] & ~ird[8]) & ~Irdecod[39];
	always @(*) Irdecod[33] = Irdecod[34] & isPreDecr;
	always @(*) Irdecod[37] = lineOnehot[5] | (lineOnehot[0] & ~ird[8]);
	always @(*) Irdecod[35] = lineOnehot[4] & (ird[11:4] == 8'he6);
	wire eaImmOrAbs = (ird[5:3] == 3'b111) & ~ird[1];
	always @(*) Irdecod[36] = eaImmOrAbs & ~isRegShift;
	always @(*) begin : sv2v_autoblock_1
		reg eaIsAreg;
		eaIsAreg = (ird[5:3] != 3'b000) & (ird[5:3] != 3'b111);
		case (1'b1)
			default: Irdecod[23] = eaIsAreg;
			lineOnehot[5]: Irdecod[23] = eaIsAreg & (ird[7:3] != 5'b11001);
			lineOnehot[6], lineOnehot[7]: Irdecod[23] = 1'b0;
			lineOnehot['he]: Irdecod[23] = ~isRegShift;
		endcase
	end
	wire xIsScc = (ird[7:6] == 2'b11) & (ird[5:3] != 3'b001);
	wire xStaticMem = (ird[11:8] == 4'b1000) & (ird[5:4] == 2'b00);
	always @(*)
		case (1'b1)
			lineOnehot[0]: Irdecod[32] = (((ird[8] & (ird[5:4] != 2'b00)) | ((ird[11:8] == 4'b1000) & (ird[5:4] != 2'b00))) | ((ird[8:7] == 2'b10) & (ird[5:3] == 3'b001))) | ((ird[8:6] == 3'b000) & !xStaticMem);
			lineOnehot[1]: Irdecod[32] = 1'b1;
			lineOnehot[4]: Irdecod[32] = (ird[7:6] == 2'b00) | Irdecod[40];
			lineOnehot[5]: Irdecod[32] = (ird[7:6] == 2'b00) | xIsScc;
			lineOnehot[8], lineOnehot[9], lineOnehot['hb], lineOnehot['hc], lineOnehot['hd], lineOnehot['he]: Irdecod[32] = ird[7:6] == 2'b00;
			default: Irdecod[32] = 1'b0;
		endcase
	always @(*) Irdecod[31] = (lineOnehot[0] & ird[8]) & eaAreg;
	always @(*)
		case (1'b1)
			lineOnehot[6]: Irdecod[39] = ird[11:8] == 4'b0001;
			lineOnehot[4]: Irdecod[39] = (ird[11:8] == 4'b1110) | (ird[11:6] == 6'b1000_01);
			default: Irdecod[39] = 1'b0;
		endcase
	always @(*) Irdecod[38] = (lineOnehot[4] & ((ird[11:0] == 12'he77) | (ird[11:6] == 6'b010011))) | (lineOnehot[0] & (ird[8:6] == 3'b000));
	reg [15:0] ftuConst;
	wire [3:0] zero28 = (ird[11:9] == 0 ? 4'h8 : {1'b0, ird[11:9]});
	always @(*)
		case (1'b1)
			lineOnehot[6], lineOnehot[7]: ftuConst = {{8 {ird[7]}}, ird[7:0]};
			lineOnehot['h5], lineOnehot['he]: ftuConst = {12'b0, zero28};
			lineOnehot['h8], lineOnehot['hc]: ftuConst = 16'h0f;
			lineOnehot[4]: ftuConst = 16'h80;
			default: ftuConst = 'sd0;
		endcase
	always @(*) Irdecod[22-:16] = ftuConst;
	always @(*)
		if (lineOnehot[4])
			case (ird[6:5])
				2'b00, 2'b01: Irdecod[6-:6] = 6;
				2'b11: Irdecod[6-:6] = 7;
				2'b10: Irdecod[6-:6] = {2'b10, ird[3:0]};
			endcase
		else
			Irdecod[6-:6] = 5;
	wire eaAdir = ird[5:3] == 3'b001;
	wire size11 = ird[7] & ird[6];
	always @(*) Irdecod[0] = (((lineOnehot[9] | lineOnehot['hd]) & size11) | (lineOnehot[5] & eaAdir)) | ((lineOnehot[2] | lineOnehot[3]) & (ird[8:6] == 3'b001));
endmodule
module excUnit (
	Clks,
	enT1,
	enT2,
	enT3,
	enT4,
	Nanod,
	Irdecod,
	Ird,
	pswS,
	ftu,
	iEdb,
	ccr,
	alue,
	prenEmpty,
	au05z,
	dcr4,
	ze,
	aob0,
	AblOut,
	Irc,
	oEdb,
	eab
);
	input wire [4:0] Clks;
	input enT1;
	input enT2;
	input enT3;
	input enT4;
	input wire [104:0] Nanod;
	input wire [41:0] Irdecod;
	input [15:0] Ird;
	input pswS;
	input [15:0] ftu;
	input [15:0] iEdb;
	output wire [7:0] ccr;
	output [15:0] alue;
	output prenEmpty;
	output au05z;
	output reg dcr4;
	output wire ze;
	output wire aob0;
	output [15:0] AblOut;
	output wire [15:0] Irc;
	output wire [15:0] oEdb;
	output wire [23:1] eab;
	localparam REG_USP = 15;
	localparam REG_SSP = 16;
	localparam REG_DT = 17;
	reg [15:0] regs68L [0:17];
	reg [15:0] regs68H [0:17];
	initial begin : sv2v_autoblock_2
		reg signed [31:0] i;
		for (i = 0; i < 18; i = i + 1)
			begin
				regs68L[i] <= 'sd0;
				regs68H[i] <= 'sd0;
			end
	end
	wire [31:0] SSP = {regs68H[REG_SSP], regs68L[REG_SSP]};
	wire [15:0] aluOut;
	wire [15:0] dbin;
	reg [15:0] dcrOutput;
	reg [15:0] PcL;
	reg [15:0] PcH;
	reg [31:0] auReg;
	reg [31:0] aob;
	reg [15:0] Ath;
	reg [15:0] Atl;
	reg [15:0] Dbl;
	reg [15:0] Dbh;
	reg [15:0] Abh;
	reg [15:0] Abl;
	reg [15:0] Abd;
	reg [15:0] Dbd;
	assign AblOut = Abl;
	assign au05z = ~|auReg[5:0];
	reg [15:0] dblMux;
	reg [15:0] dbhMux;
	reg [15:0] abhMux;
	reg [15:0] ablMux;
	reg [15:0] abdMux;
	reg [15:0] dbdMux;
	reg abdIsByte;
	reg Pcl2Dbl;
	reg Pch2Dbh;
	reg Pcl2Abl;
	reg Pch2Abh;
	reg [4:0] actualRx;
	reg [4:0] actualRy;
	reg [3:0] movemRx;
	reg byteNotSpAlign;
	reg [4:0] rxMux;
	reg [4:0] ryMux;
	reg [3:0] rxReg;
	reg [3:0] ryReg;
	reg rxIsSp;
	reg ryIsSp;
	reg rxIsAreg;
	reg ryIsAreg;
	always @(*) begin
		if (Nanod[50]) begin
			rxMux = REG_SSP;
			rxIsSp = 1'b1;
			rxReg = 1'bX;
		end
		else if (Irdecod[35]) begin
			rxMux = REG_USP;
			rxIsSp = 1'b1;
			rxReg = 1'bX;
		end
		else if (Irdecod[37] & !Irdecod[39]) begin
			rxMux = REG_DT;
			rxIsSp = 1'b0;
			rxReg = 1'bX;
		end
		else begin
			if (Irdecod[39])
				rxReg = 15;
			else if (Irdecod[34])
				rxReg = movemRx;
			else
				rxReg = {Irdecod[24], Irdecod[30-:3]};
			if (&rxReg) begin
				rxMux = (pswS ? REG_SSP : 15);
				rxIsSp = 1'b1;
			end
			else begin
				rxMux = {1'b0, rxReg};
				rxIsSp = 1'b0;
			end
		end
		if (Irdecod[36] & !Nanod[29]) begin
			ryMux = REG_DT;
			ryIsSp = 1'b0;
			ryReg = 'sdX;
		end
		else begin
			ryReg = (Nanod[29] ? Irc[15:12] : {Irdecod[23], Irdecod[27-:3]});
			ryIsSp = &ryReg;
			if (ryIsSp & pswS)
				ryMux = REG_SSP;
			else
				ryMux = {1'b0, ryReg};
		end
	end
	always @(posedge Clks[4]) begin
		if (enT4) begin
			byteNotSpAlign <= Irdecod[32] & ~(Nanod[28] ? rxIsSp : ryIsSp);
			actualRx <= rxMux;
			actualRy <= ryMux;
			rxIsAreg <= rxIsSp | rxMux[3];
			ryIsAreg <= ryIsSp | ryMux[3];
		end
		if (enT4)
			abdIsByte <= Nanod[0] & Irdecod[32];
	end
	wire ryl2Abl = Nanod[34] & (ryIsAreg | Nanod[4]);
	wire ryl2Abd = Nanod[34] & (~ryIsAreg | Nanod[4]);
	wire ryl2Dbl = Nanod[35] & (ryIsAreg | Nanod[2]);
	wire ryl2Dbd = Nanod[35] & (~ryIsAreg | Nanod[2]);
	wire rxl2Abl = Nanod[40] & (rxIsAreg | Nanod[4]);
	wire rxl2Abd = Nanod[40] & (~rxIsAreg | Nanod[4]);
	wire rxl2Dbl = Nanod[41] & (rxIsAreg | Nanod[2]);
	wire rxl2Dbd = Nanod[41] & (~rxIsAreg | Nanod[2]);
	reg abhIdle;
	reg ablIdle;
	reg abdIdle;
	reg dbhIdle;
	reg dblIdle;
	reg dbdIdle;
	always @(*) begin
		{abhIdle, ablIdle, abdIdle} = 'sd0;
		{dbhIdle, dblIdle, dbdIdle} = 'sd0;
		case (1'b1)
			ryl2Dbd: dbdMux = regs68L[actualRy];
			rxl2Dbd: dbdMux = regs68L[actualRx];
			Nanod[16]: dbdMux = alue;
			Nanod[7]: dbdMux = dbin;
			Nanod[13]: dbdMux = aluOut;
			Nanod[18]: dbdMux = dcrOutput;
			default: begin
				dbdMux = 'sdX;
				dbdIdle = 1'b1;
			end
		endcase
		case (1'b1)
			rxl2Dbl: dblMux = regs68L[actualRx];
			ryl2Dbl: dblMux = regs68L[actualRy];
			Nanod[93]: dblMux = ftu;
			Nanod[11]: dblMux = auReg[15:0];
			Nanod[70]: dblMux = Atl;
			Pcl2Dbl: dblMux = PcL;
			default: begin
				dblMux = 'sdX;
				dblIdle = 1'b1;
			end
		endcase
		case (1'b1)
			Nanod[45]: dbhMux = regs68H[actualRx];
			Nanod[33]: dbhMux = regs68H[actualRy];
			Nanod[11]: dbhMux = auReg[31:16];
			Nanod[67]: dbhMux = Ath;
			Pch2Dbh: dbhMux = PcH;
			default: begin
				dbhMux = 'sdX;
				dbhIdle = 1'b1;
			end
		endcase
		case (1'b1)
			ryl2Abd: abdMux = regs68L[actualRy];
			rxl2Abd: abdMux = regs68L[actualRx];
			Nanod[8]: abdMux = dbin;
			Nanod[12]: abdMux = aluOut;
			default: begin
				abdMux = 'sdX;
				abdIdle = 1'b1;
			end
		endcase
		case (1'b1)
			Pcl2Abl: ablMux = PcL;
			rxl2Abl: ablMux = regs68L[actualRx];
			ryl2Abl: ablMux = regs68L[actualRy];
			Nanod[92]: ablMux = ftu;
			Nanod[10]: ablMux = auReg[15:0];
			Nanod[62]: ablMux = aob[15:0];
			Nanod[71]: ablMux = Atl;
			default: begin
				ablMux = 'sdX;
				ablIdle = 1'b1;
			end
		endcase
		case (1'b1)
			Pch2Abh: abhMux = PcH;
			Nanod[44]: abhMux = regs68H[actualRx];
			Nanod[32]: abhMux = regs68H[actualRy];
			Nanod[10]: abhMux = auReg[31:16];
			Nanod[62]: abhMux = aob[31:16];
			Nanod[66]: abhMux = Ath;
			default: begin
				abhMux = 'sdX;
				abhIdle = 1'b1;
			end
		endcase
	end
	reg [15:0] preAbh;
	reg [15:0] preAbl;
	reg [15:0] preAbd;
	reg [15:0] preDbh;
	reg [15:0] preDbl;
	reg [15:0] preDbd;
	always @(posedge Clks[4]) begin
		if (enT1) begin
			{preAbh, preAbl, preAbd} <= {abhMux, ablMux, abdMux};
			{preDbh, preDbl, preDbd} <= {dbhMux, dblMux, dbdMux};
		end
		if (enT2) begin
			if (Nanod[5])
				Abh <= {16 {(ablIdle ? preAbd[15] : preAbl[15])}};
			else if (abhIdle)
				Abh <= (ablIdle ? preAbd : preAbl);
			else
				Abh <= preAbh;
			if (~ablIdle)
				Abl <= preAbl;
			else
				Abl <= (Nanod[3] ? preAbh : preAbd);
			Abd <= (~abdIdle ? preAbd : (ablIdle ? preAbh : preAbl));
			if (Nanod[6])
				Dbh <= {16 {(dblIdle ? preDbd[15] : preDbl[15])}};
			else if (dbhIdle)
				Dbh <= (dblIdle ? preDbd : preDbl);
			else
				Dbh <= preDbh;
			if (~dblIdle)
				Dbl <= preDbl;
			else
				Dbl <= (Nanod[1] ? preDbh : preDbd);
			Dbd <= (~dbdIdle ? preDbd : (dblIdle ? preDbh : preDbl));
		end
	end
	wire au2Aob = Nanod[63] | (Nanod[11] & Nanod[65]);
	always @(posedge Clks[4])
		if (enT1 & au2Aob)
			aob <= auReg;
		else if (enT2)
			if (Nanod[65])
				aob <= {preDbh, (~dblIdle ? preDbl : preDbd)};
			else if (Nanod[64])
				aob <= {preAbh, (~ablIdle ? preAbl : preAbd)};
	assign eab = aob[23:1];
	assign aob0 = aob[0];
	reg [31:0] auInpMux;
	always @(*)
		case (Nanod[78-:3])
			3'b000: auInpMux = 0;
			3'b001: auInpMux = (byteNotSpAlign | Nanod[79] ? 1 : 2);
			3'b010: auInpMux = -4;
			3'b011: auInpMux = {Abh, Abl};
			3'b100: auInpMux = 2;
			3'b101: auInpMux = 4;
			3'b110: auInpMux = -2;
			3'b111: auInpMux = (byteNotSpAlign | Nanod[79] ? -1 : -2);
			default: auInpMux = 'sdX;
		endcase
	wire [16:0] aulow = Dbl + auInpMux[15:0];
	wire [31:0] auResult = {(Dbh + auInpMux[31:16]) + aulow[16], aulow[15:0]};
	always @(posedge Clks[4])
		if (Clks[2])
			auReg <= 'sd0;
		else if (enT3 & Nanod[80])
			auReg <= auResult;
	always @(posedge Clks[4])
		if (enT3) begin
			if (Nanod[43] | Nanod[39])
				if (~rxIsAreg) begin
					if (Nanod[43])
						regs68L[actualRx] <= Dbd;
					else if (abdIsByte)
						regs68L[actualRx][7:0] <= Abd[7:0];
					else
						regs68L[actualRx] <= Abd;
				end
				else
					regs68L[actualRx] <= (Nanod[43] ? Dbl : Abl);
			if (Nanod[31] | Nanod[30])
				if (~ryIsAreg) begin
					if (Nanod[31])
						regs68L[actualRy] <= Dbd;
					else if (abdIsByte)
						regs68L[actualRy][7:0] <= Abd[7:0];
					else
						regs68L[actualRy] <= Abd;
				end
				else
					regs68L[actualRy] <= (Nanod[31] ? Dbl : Abl);
			if (Nanod[42] | Nanod[38])
				regs68H[actualRx] <= (Nanod[42] ? Dbh : Abh);
			if (Nanod[37] | Nanod[36])
				regs68H[actualRy] <= (Nanod[37] ? Dbh : Abh);
		end
	reg dbl2Pcl;
	reg dbh2Pch;
	reg abh2Pch;
	reg abl2Pcl;
	always @(posedge Clks[4]) begin
		if (Clks[3]) begin
			{dbl2Pcl, dbh2Pch, abh2Pch, abl2Pcl} <= 'sd0;
			Pcl2Dbl <= 1'b0;
			Pch2Dbh <= 1'b0;
			Pcl2Abl <= 1'b0;
			Pch2Abh <= 1'b0;
		end
		else if (enT4) begin
			dbl2Pcl <= Nanod[53] & Nanod[48];
			dbh2Pch <= Nanod[54] & Nanod[49];
			abh2Pch <= Nanod[58] & Nanod[46];
			abl2Pcl <= Nanod[57] & Nanod[47];
			Pcl2Dbl <= Nanod[52] & Nanod[48];
			Pch2Dbh <= Nanod[51] & Nanod[49];
			Pcl2Abl <= Nanod[56] & Nanod[47];
			Pch2Abh <= Nanod[55] & Nanod[46];
		end
		if (enT1 & Nanod[9])
			PcL <= auReg[15:0];
		else if (enT3)
			if (dbl2Pcl)
				PcL <= Dbl;
			else if (abl2Pcl)
				PcL <= Abl;
		if (enT1 & Nanod[9])
			PcH <= auReg[31:16];
		else if (enT3)
			if (dbh2Pch)
				PcH <= Dbh;
			else if (abh2Pch)
				PcH <= Abh;
		if (enT3)
			if (Nanod[73])
				Atl <= Dbl;
			else if (Nanod[72])
				Atl <= Abl;
		if (enT3)
			if (Nanod[69])
				Ath <= Abh;
			else if (Nanod[68])
				Ath <= Dbh;
	end
	wire rmIdle;
	wire [3:0] prHbit;
	reg [15:0] prenLatch;
	assign prenEmpty = ~|prenLatch;
	pren rmPren(
		.mask(prenLatch),
		.hbit(prHbit)
	);
	always @(posedge Clks[4])
		if (enT1 & Nanod[91])
			prenLatch <= dbin;
		else if (enT3 & Nanod[90]) begin
			prenLatch[prHbit] <= 1'b0;
			movemRx <= (Irdecod[33] ? ~prHbit : prHbit);
		end
	wire [15:0] dcrCode;
	wire [3:0] dcrInput = (abdIsByte ? {1'b0, Abd[2:0]} : Abd[3:0]);
	onehotEncoder4 dcrDecoder(
		.bin(dcrInput),
		.bitMap(dcrCode)
	);
	always @(posedge Clks[4])
		if (Clks[2])
			dcr4 <= 'sd0;
		else if (enT3 & Nanod[19]) begin
			dcrOutput <= dcrCode;
			dcr4 <= Abd[4];
		end
	reg [15:0] alub;
	always @(posedge Clks[4])
		if (enT3)
			if (Nanod[15])
				alub <= Dbd;
			else if (Nanod[14])
				alub <= Abd;
	wire alueClkEn = enT3 & Nanod[17];
	reg [15:0] dobInput;
	wire dobIdle = ~|Nanod[60-:2];
	localparam NANO_DOB_ADB = 2'b10;
	localparam NANO_DOB_ALU = 2'b11;
	localparam NANO_DOB_DBD = 2'b01;
	always @(*)
		case (Nanod[60-:2])
			NANO_DOB_ADB: dobInput = Abd;
			NANO_DOB_DBD: dobInput = Dbd;
			NANO_DOB_ALU: dobInput = aluOut;
			default: dobInput = 'sdX;
		endcase
	dataIo dataIo(
		.Clks(Clks),
		.enT1(enT1),
		.enT2(enT2),
		.enT3(enT3),
		.enT4(enT4),
		.Nanod(Nanod),
		.Irdecod(Irdecod),
		.iEdb(iEdb),
		.dobIdle(dobIdle),
		.dobInput(dobInput),
		.aob0(aob0),
		.Irc(Irc),
		.dbin(dbin),
		.oEdb(oEdb)
	);
	fx68kAlu alu(
		.clk(Clks[4]),
		.pwrUp(Clks[2]),
		.enT1(enT1),
		.enT3(enT3),
		.enT4(enT4),
		.ird(Ird),
		.aluColumn(Nanod[27-:3]),
		.aluAddrCtrl(Nanod[22]),
		.init(Nanod[21]),
		.finish(Nanod[20]),
		.aluIsByte(Irdecod[32]),
		.ftu2Ccr(Nanod[86]),
		.alub(alub),
		.ftu(ftu),
		.alueClkEn(alueClkEn),
		.alue(alue),
		.aluDataCtrl(Nanod[24-:2]),
		.iDataBus(Dbd),
		.iAddrBus(Abd),
		.ze(ze),
		.aluOut(aluOut),
		.ccr(ccr)
	);
endmodule
module dataIo (
	Clks,
	enT1,
	enT2,
	enT3,
	enT4,
	Nanod,
	Irdecod,
	iEdb,
	aob0,
	dobIdle,
	dobInput,
	Irc,
	dbin,
	oEdb
);
	input wire [4:0] Clks;
	input enT1;
	input enT2;
	input enT3;
	input enT4;
	input wire [104:0] Nanod;
	input wire [41:0] Irdecod;
	input [15:0] iEdb;
	input aob0;
	input dobIdle;
	input [15:0] dobInput;
	output reg [15:0] Irc;
	output reg [15:0] dbin;
	output wire [15:0] oEdb;
	reg [15:0] dob;
	reg xToDbin;
	reg xToIrc;
	reg dbinNoLow;
	reg dbinNoHigh;
	reg byteMux;
	reg isByte_T4;
	always @(posedge Clks[4]) begin
		if (enT4)
			isByte_T4 <= Irdecod[32];
		if (enT3) begin
			dbinNoHigh <= Nanod[98];
			dbinNoLow <= Nanod[99];
			byteMux <= (Nanod[101] & isByte_T4) & ~aob0;
		end
		if (enT1) begin
			xToDbin <= 1'b0;
			xToIrc <= 1'b0;
		end
		else if (enT3) begin
			xToDbin <= Nanod[75];
			xToIrc <= Nanod[74];
		end
		if (xToIrc & Clks[0])
			Irc <= iEdb;
		if (xToDbin & Clks[0]) begin
			if (~dbinNoLow)
				dbin[7:0] <= (byteMux ? iEdb[15:8] : iEdb[7:0]);
			if (~dbinNoHigh)
				dbin[15:8] <= (~byteMux & dbinNoLow ? iEdb[7:0] : iEdb[15:8]);
		end
	end
	reg byteCycle;
	always @(posedge Clks[4]) begin
		if (enT4)
			byteCycle <= Nanod[101] & Irdecod[32];
		if (enT3 & ~dobIdle) begin
			dob[7:0] <= (Nanod[99] ? dobInput[15:8] : dobInput[7:0]);
			dob[15:8] <= (byteCycle | Nanod[98] ? dobInput[7:0] : dobInput[15:8]);
		end
	end
	assign oEdb = dob;
endmodule
module uaddrDecode (
	opcode,
	a1,
	a2,
	a3,
	isPriv,
	isIllegal,
	isLineA,
	isLineF,
	lineBmap
);
	input [15:0] opcode;
	localparam UADDR_WIDTH = 10;
	output [UADDR_WIDTH - 1:0] a1;
	output [UADDR_WIDTH - 1:0] a2;
	output [UADDR_WIDTH - 1:0] a3;
	output reg isPriv;
	output wire isIllegal;
	output wire isLineA;
	output wire isLineF;
	output [15:0] lineBmap;
	wire [3:0] line = opcode[15:12];
	wire [3:0] eaCol;
	wire [3:0] movEa;
	onehotEncoder4 irLineDecod(
		.bin(line),
		.bitMap(lineBmap)
	);
	assign isLineA = lineBmap['hA];
	assign isLineF = lineBmap['hF];
	pla_lined pla_lined(
		.movEa(movEa),
		.col(eaCol),
		.opcode(opcode),
		.lineBmap(lineBmap),
		.palIll(isIllegal),
		.plaA1(a1),
		.plaA2(a2),
		.plaA3(a3)
	);
	assign eaCol = eaDecode(opcode[5:0]);
	assign movEa = eaDecode({opcode[8:6], opcode[11:9]});
	function [3:0] eaDecode;
		input reg [5:0] eaBits;
		case (eaBits[5:3])
			3'b111:
				case (eaBits[2:0])
					3'b000: eaDecode = 7;
					3'b001: eaDecode = 8;
					3'b010: eaDecode = 9;
					3'b011: eaDecode = 10;
					3'b100: eaDecode = 11;
					default: eaDecode = 12;
				endcase
			default: eaDecode = eaBits[5:3];
		endcase
	endfunction
	always @(*)
		case (lineBmap)
			'h01: isPriv = (opcode & 16'hf5ff) == 16'h007c;
			'h10:
				if ((opcode & 16'hffc0) == 16'h46c0)
					isPriv = 1'b1;
				else if ((opcode & 16'hfff0) == 16'h4e60)
					isPriv = 1'b1;
				else if (((opcode == 16'h4e70) || (opcode == 16'h4e73)) || (opcode == 16'h4e72))
					isPriv = 1'b1;
				else
					isPriv = 1'b0;
			default: isPriv = 1'b0;
		endcase
endmodule
module onehotEncoder4 (
	bin,
	bitMap
);
	input [3:0] bin;
	output reg [15:0] bitMap;
	always @(*)
		case (bin)
			'b0000: bitMap = 16'h0001;
			'b0001: bitMap = 16'h0002;
			'b0010: bitMap = 16'h0004;
			'b0011: bitMap = 16'h0008;
			'b0100: bitMap = 16'h0010;
			'b0101: bitMap = 16'h0020;
			'b0110: bitMap = 16'h0040;
			'b0111: bitMap = 16'h0080;
			'b1000: bitMap = 16'h0100;
			'b1001: bitMap = 16'h0200;
			'b1010: bitMap = 16'h0400;
			'b1011: bitMap = 16'h0800;
			'b1100: bitMap = 16'h1000;
			'b1101: bitMap = 16'h2000;
			'b1110: bitMap = 16'h4000;
			'b1111: bitMap = 16'h8000;
		endcase
endmodule
module pren (
	mask,
	hbit
);
	parameter size = 16;
	parameter outbits = 4;
	input [size - 1:0] mask;
	output reg [outbits - 1:0] hbit;
	always @(mask) begin : sv2v_autoblock_3
		integer i;
		hbit = 0;
		for (i = size - 1; i >= 0; i = i - 1)
			if (mask[i])
				hbit = i;
	end
endmodule
module sequencer (
	Clks,
	enT3,
	microLatch,
	A0Err,
	BerrA,
	busAddrErr,
	Spuria,
	Avia,
	Tpend,
	intPend,
	isIllegal,
	isPriv,
	excRst,
	isLineA,
	isLineF,
	psw,
	prenEmpty,
	au05z,
	dcr4,
	ze,
	i11,
	alue01,
	Ird,
	a1,
	a2,
	a3,
	tvn,
	nma
);
	input wire [4:0] Clks;
	input enT3;
	localparam UROM_WIDTH = 17;
	input [UROM_WIDTH - 1:0] microLatch;
	input A0Err;
	input BerrA;
	input busAddrErr;
	input Spuria;
	input Avia;
	input Tpend;
	input intPend;
	input isIllegal;
	input isPriv;
	input excRst;
	input isLineA;
	input isLineF;
	input [15:0] psw;
	input prenEmpty;
	input au05z;
	input dcr4;
	input ze;
	input i11;
	input [1:0] alue01;
	input [15:0] Ird;
	localparam UADDR_WIDTH = 10;
	input [UADDR_WIDTH - 1:0] a1;
	input [UADDR_WIDTH - 1:0] a2;
	input [UADDR_WIDTH - 1:0] a3;
	output reg [3:0] tvn;
	output reg [UADDR_WIDTH - 1:0] nma;
	reg [UADDR_WIDTH - 1:0] uNma;
	reg [UADDR_WIDTH - 1:0] grp1Nma;
	reg [1:0] c0c1;
	reg a0Rst;
	wire A0Sel;
	wire inGrp0Exc;
	wire [UADDR_WIDTH - 1:0] dbNma = {microLatch[14:13], microLatch[6:5], microLatch[10:7], microLatch[12:11]};
	localparam BSER1_NMA = 'h003;
	localparam HALT1_NMA = 'h001;
	localparam RSTP0_NMA = 'h002;
	always @(*)
		if (A0Err) begin
			if (a0Rst)
				nma = RSTP0_NMA;
			else if (inGrp0Exc)
				nma = HALT1_NMA;
			else
				nma = BSER1_NMA;
		end
		else
			nma = uNma;
	always @(*)
		if (microLatch[1])
			uNma = {microLatch[14:13], c0c1, microLatch[10:7], microLatch[12:11]};
		else
			case (microLatch[3:2])
				0: uNma = dbNma;
				1: uNma = (A0Sel ? grp1Nma : a1);
				2: uNma = a2;
				3: uNma = a3;
			endcase
	wire [1:0] enl = {Ird[6], prenEmpty};
	wire [1:0] ms0 = {Ird[8], alue01[0]};
	wire [3:0] m01 = {au05z, Ird[8], alue01};
	localparam NF = 3;
	localparam ZF = 2;
	wire [1:0] nz1 = {psw[NF], psw[ZF]};
	localparam VF = 1;
	wire [1:0] nv = {psw[NF], psw[VF]};
	reg ccTest;
	wire [4:0] cbc = microLatch[6:2];
	localparam CF = 0;
	always @(*)
		case (cbc)
			'h0: c0c1 = {i11, i11};
			'h1: c0c1 = (au05z ? 2'b01 : 2'b11);
			'h11: c0c1 = (au05z ? 2'b00 : 2'b11);
			'h02: c0c1 = {1'b0, ~psw[CF]};
			'h12: c0c1 = {1'b1, ~psw[CF]};
			'h03: c0c1 = {psw[ZF], psw[ZF]};
			'h04:
				case (nz1)
					'b00: c0c1 = 2'b10;
					'b10: c0c1 = 2'b01;
					'b01, 'b11: c0c1 = 2'b11;
				endcase
			'h05: c0c1 = {psw[NF], 1'b1};
			'h15: c0c1 = {1'b1, psw[NF]};
			'h06: c0c1 = {~nz1[1] & ~nz1[0], 1'b1};
			'h07:
				case (ms0)
					'b10, 'b00: c0c1 = 2'b11;
					'b01: c0c1 = 2'b01;
					'b11: c0c1 = 2'b10;
				endcase
			'h08:
				case (m01)
					'b0000, 'b0001, 'b0100, 'b0111: c0c1 = 2'b11;
					'b0010, 'b0011, 'b0101: c0c1 = 2'b01;
					'b0110: c0c1 = 2'b10;
					default: c0c1 = 2'b00;
				endcase
			'h09: c0c1 = (ccTest ? 2'b11 : 2'b01);
			'h19: c0c1 = (ccTest ? 2'b11 : 2'b10);
			'h0c: c0c1 = (dcr4 ? 2'b01 : 2'b11);
			'h1c: c0c1 = (dcr4 ? 2'b10 : 2'b11);
			'h0a: c0c1 = (ze ? 2'b11 : 2'b00);
			'h0b: c0c1 = (nv == 2'b00 ? 2'b00 : 2'b11);
			'h0d: c0c1 = {~psw[VF], ~psw[VF]};
			'h0e, 'h1e:
				case (enl)
					2'b00: c0c1 = 'b10;
					2'b10: c0c1 = 'b11;
					2'b01, 2'b11: c0c1 = {1'b0, microLatch[6]};
				endcase
			default: c0c1 = 'sdX;
		endcase
	always @(*)
		case (Ird[11:8])
			'h0: ccTest = 1'b1;
			'h1: ccTest = 1'b0;
			'h2: ccTest = ~psw[CF] & ~psw[ZF];
			'h3: ccTest = psw[CF] | psw[ZF];
			'h4: ccTest = ~psw[CF];
			'h5: ccTest = psw[CF];
			'h6: ccTest = ~psw[ZF];
			'h7: ccTest = psw[ZF];
			'h8: ccTest = ~psw[VF];
			'h9: ccTest = psw[VF];
			'ha: ccTest = ~psw[NF];
			'hb: ccTest = psw[NF];
			'hc: ccTest = (psw[NF] & psw[VF]) | (~psw[NF] & ~psw[VF]);
			'hd: ccTest = (psw[NF] & ~psw[VF]) | (~psw[NF] & psw[VF]);
			'he: ccTest = ((psw[NF] & psw[VF]) & ~psw[ZF]) | ((~psw[NF] & ~psw[VF]) & ~psw[ZF]);
			'hf: ccTest = (psw[ZF] | (psw[NF] & ~psw[VF])) | (~psw[NF] & psw[VF]);
		endcase
	reg rTrace;
	reg rInterrupt;
	reg rIllegal;
	reg rPriv;
	reg rLineA;
	reg rLineF;
	reg rExcRst;
	reg rExcAdrErr;
	reg rExcBusErr;
	reg rSpurious;
	reg rAutovec;
	wire grp1LatchEn;
	wire grp0LatchEn;
	assign grp1LatchEn = microLatch[0] & (microLatch[1] | !microLatch[4]);
	assign grp0LatchEn = microLatch[4] & !microLatch[1];
	assign inGrp0Exc = (rExcRst | rExcBusErr) | rExcAdrErr;
	localparam SF = 13;
	always @(posedge Clks[4]) begin
		if (grp0LatchEn & enT3) begin
			rExcRst <= excRst;
			rExcBusErr <= BerrA;
			rExcAdrErr <= busAddrErr;
			rSpurious <= Spuria;
			rAutovec <= Avia;
		end
		if (grp1LatchEn & enT3) begin
			rTrace <= Tpend;
			rInterrupt <= intPend;
			rIllegal <= (isIllegal & ~isLineA) & ~isLineF;
			rLineA <= isLineA;
			rLineF <= isLineF;
			rPriv <= isPriv & !psw[SF];
		end
	end
	localparam ITLX1_NMA = 'h1C4;
	localparam TRAC1_NMA = 'h1C0;
	localparam TVN_AUTOVEC = 13;
	localparam TVN_INTERRUPT = 15;
	localparam TVN_SPURIOUS = 12;
	always @(*) begin
		grp1Nma = TRAC1_NMA;
		if (rExcRst)
			tvn = 'sd0;
		else if (rExcBusErr | rExcAdrErr)
			tvn = {1'b1, rExcAdrErr};
		else if (rSpurious | rAutovec)
			tvn = (rSpurious ? TVN_SPURIOUS : TVN_AUTOVEC);
		else if (rTrace)
			tvn = 9;
		else if (rInterrupt) begin
			tvn = TVN_INTERRUPT;
			grp1Nma = ITLX1_NMA;
		end
		else
			case (1'b1)
				rIllegal: tvn = 4;
				rPriv: tvn = 8;
				rLineA: tvn = 10;
				rLineF: tvn = 11;
				default: tvn = 1;
			endcase
	end
	assign A0Sel = ((((rIllegal | rLineF) | rLineA) | rPriv) | rTrace) | rInterrupt;
	always @(posedge Clks[4])
		if (Clks[3])
			a0Rst <= 1'b1;
		else if (enT3)
			a0Rst <= 1'b0;
endmodule
module busArbiter (
	Clks,
	BRi,
	BgackI,
	Halti,
	bgBlock,
	busAvail,
	BGn
);
	input wire [4:0] Clks;
	input BRi;
	input BgackI;
	input Halti;
	input bgBlock;
	output busAvail;
	output reg BGn;
	reg [31:0] dmaPhase;
	reg [31:0] next;
	localparam [31:0] D1 = 2;
	localparam [31:0] D2 = 7;
	localparam [31:0] D3 = 6;
	localparam [31:0] DIDLE = 1;
	localparam [31:0] DRESET = 0;
	localparam [31:0] D_BA = 4;
	localparam [31:0] D_BR = 3;
	localparam [31:0] D_BRA = 5;
	always @(*)
		case (dmaPhase)
			DRESET: next = DIDLE;
			DIDLE:
				if (bgBlock)
					next = DIDLE;
				else if (~BgackI)
					next = D_BA;
				else if (~BRi)
					next = D1;
				else
					next = DIDLE;
			D_BA:
				if (~BRi & !bgBlock)
					next = D3;
				else if (~BgackI & !bgBlock)
					next = D_BA;
				else
					next = DIDLE;
			D1: next = D_BR;
			D_BR: next = (~BRi & BgackI ? D_BR : D_BA);
			D3: next = D_BRA;
			D_BRA:
				case ({BgackI, BRi})
					2'b11: next = DIDLE;
					2'b10: next = D_BR;
					2'b01: next = D2;
					2'b00: next = D_BRA;
				endcase
			D2: next = D_BA;
			default: next = DIDLE;
		endcase
	reg granting;
	always @(*)
		case (next)
			D1, D3, D_BR, D_BRA: granting = 1'b1;
			default: granting = 1'b0;
		endcase
	reg rGranted;
	assign busAvail = ((Halti & BRi) & BgackI) & ~rGranted;
	always @(posedge Clks[4]) begin
		if (Clks[3]) begin
			dmaPhase <= DRESET;
			rGranted <= 1'b0;
		end
		else if (Clks[0]) begin
			dmaPhase <= next;
			rGranted <= granting;
		end
		if (Clks[3])
			BGn <= 1'b1;
		else if (Clks[1])
			BGn <= ~rGranted;
	end
endmodule
module busControl (
	Clks,
	enT1,
	enT4,
	permStart,
	permStop,
	iStop,
	aob0,
	isWrite,
	isByte,
	isRmc,
	busAvail,
	bgBlock,
	busAddrErr,
	waitBusCycle,
	busStarting,
	addrOe,
	bciWrite,
	rDtack,
	BeDebounced,
	Vpai,
	ASn,
	LDSn,
	UDSn,
	eRWn
);
	input wire [4:0] Clks;
	input enT1;
	input enT4;
	input permStart;
	input permStop;
	input iStop;
	input aob0;
	input isWrite;
	input isByte;
	input isRmc;
	input busAvail;
	output bgBlock;
	output busAddrErr;
	output waitBusCycle;
	output busStarting;
	output reg addrOe;
	output bciWrite;
	input rDtack;
	input BeDebounced;
	input Vpai;
	output ASn;
	output LDSn;
	output UDSn;
	output eRWn;
	reg rAS;
	reg rLDS;
	reg rUDS;
	reg rRWn;
	assign ASn = rAS;
	assign LDSn = rLDS;
	assign UDSn = rUDS;
	assign eRWn = rRWn;
	reg dataOe;
	reg bcPend;
	reg isWriteReg;
	reg bciByte;
	reg isRmcReg;
	reg wendReg;
	assign bciWrite = isWriteReg;
	reg addrOeDelay;
	reg isByteT4;
	wire canStart;
	wire busEnd;
	wire bcComplete;
	wire bcReset;
	wire isRcmReset = (bcComplete & bcReset) & isRmcReg;
	assign busAddrErr = aob0 & ~bciByte;
	wire busRetry = ~busAddrErr & 1'b0;
	reg [31:0] busPhase;
	reg [31:0] next;
	localparam [31:0] SRESET = 0;
	always @(posedge Clks[4])
		if (Clks[3])
			busPhase <= SRESET;
		else if (Clks[1])
			busPhase <= next;
	localparam [31:0] S0 = 2;
	localparam [31:0] S2 = 3;
	localparam [31:0] S4 = 4;
	localparam [31:0] S6 = 5;
	localparam [31:0] SIDLE = 1;
	localparam [31:0] SRMC_RES = 6;
	always @(*)
		case (busPhase)
			SRESET: next = SIDLE;
			SRMC_RES: next = SIDLE;
			S0: next = S2;
			S2: next = S4;
			S4: next = (busEnd ? S6 : S4);
			S6: next = (isRcmReset ? SRMC_RES : (canStart ? S0 : SIDLE));
			SIDLE: next = (canStart ? S0 : SIDLE);
			default: next = SIDLE;
		endcase
	wire rmcIdle = ((busPhase == SIDLE) & ~ASn) & isRmcReg;
	assign canStart = (((busAvail | rmcIdle) & (bcPend | permStart)) & !busRetry) & !bcReset;
	wire busEnding = (next == SIDLE) | (next == S0);
	assign busStarting = busPhase == S0;
	assign busEnd = ~rDtack | iStop;
	assign bcComplete = busPhase == S6;
	wire bciClear = bcComplete & ~busRetry;
	assign bcReset = Clks[3] | ((addrOeDelay & BeDebounced) & Vpai);
	assign waitBusCycle = wendReg & !bcComplete;
	assign bgBlock = ((busPhase == S0) & ASn) | (busPhase == SRMC_RES);
	always @(posedge Clks[4]) begin
		if (Clks[3])
			addrOe <= 1'b0;
		else if (Clks[0] & (busPhase == S0))
			addrOe <= 1'b1;
		else if (Clks[1] & (busPhase == SRMC_RES))
			addrOe <= 1'b0;
		else if ((Clks[1] & ~isRmcReg) & busEnding)
			addrOe <= 1'b0;
		if (Clks[1])
			addrOeDelay <= addrOe;
		if (Clks[3]) begin
			rAS <= 1'b1;
			rUDS <= 1'b1;
			rLDS <= 1'b1;
			rRWn <= 1'b1;
			dataOe <= 'sd0;
		end
		else begin
			if ((Clks[0] & isWriteReg) & (busPhase == S2))
				dataOe <= 1'b1;
			else if (Clks[1] & (busEnding | (busPhase == SIDLE)))
				dataOe <= 1'b0;
			if (Clks[1] & busEnding)
				rRWn <= 1'b1;
			else if (Clks[1] & isWriteReg)
				if ((busPhase == S0) & isWriteReg)
					rRWn <= 1'b0;
			if (Clks[1] & (busPhase == S0))
				rAS <= 1'b0;
			else if (Clks[0] & (busPhase == SRMC_RES))
				rAS <= 1'b1;
			else if ((Clks[0] & bcComplete) & ~SRMC_RES)
				if (~isRmcReg)
					rAS <= 1'b1;
			if (Clks[1] & (busPhase == S0)) begin
				if (~isWriteReg & !busAddrErr) begin
					rUDS <= ~(~bciByte | ~aob0);
					rLDS <= ~(~bciByte | aob0);
				end
			end
			else if (((Clks[1] & isWriteReg) & (busPhase == S2)) & !busAddrErr) begin
				rUDS <= ~(~bciByte | ~aob0);
				rLDS <= ~(~bciByte | aob0);
			end
			else if (Clks[0] & bcComplete) begin
				rUDS <= 1'b1;
				rLDS <= 1'b1;
			end
		end
	end
	always @(posedge Clks[4])
		if (enT4)
			isByteT4 <= isByte;
	always @(posedge Clks[4])
		if (Clks[2]) begin
			bcPend <= 1'b0;
			wendReg <= 1'b0;
			isWriteReg <= 1'b0;
			bciByte <= 1'b0;
			isRmcReg <= 1'b0;
		end
		else if (Clks[0] & (bciClear | bcReset)) begin
			bcPend <= 1'b0;
			wendReg <= 1'b0;
		end
		else begin
			if (enT1 & permStart) begin
				isWriteReg <= isWrite;
				bciByte <= isByteT4;
				isRmcReg <= isRmc & ~isWrite;
				bcPend <= 1'b1;
			end
			if (enT1)
				wendReg <= permStop;
		end
endmodule
module uRom (
	clk,
	microAddr,
	microOutput
);
	input clk;
	localparam UADDR_WIDTH = 10;
	input [UADDR_WIDTH - 1:0] microAddr;
	localparam UROM_WIDTH = 17;
	output reg [UROM_WIDTH - 1:0] microOutput;
	localparam UROM_DEPTH = 1024;
	reg [UROM_WIDTH - 1:0] uRam [0:UROM_DEPTH - 1];
	initial $readmemb("microrom.mem", uRam);
	always @(posedge clk) microOutput <= uRam[microAddr];
endmodule
module nanoRom (
	clk,
	nanoAddr,
	nanoOutput
);
	input clk;
	localparam NADDR_WIDTH = 9;
	input [NADDR_WIDTH - 1:0] nanoAddr;
	localparam NANO_WIDTH = 68;
	output reg [NANO_WIDTH - 1:0] nanoOutput;
	localparam NANO_DEPTH = 336;
	reg [NANO_WIDTH - 1:0] nRam [0:NANO_DEPTH - 1];
	initial $readmemb("nanorom.mem", nRam);
	always @(posedge clk) nanoOutput <= nRam[nanoAddr];
endmodule
module microToNanoAddr (
	uAddr,
	orgAddr
);
	localparam UADDR_WIDTH = 10;
	input [UADDR_WIDTH - 1:0] uAddr;
	localparam NADDR_WIDTH = 9;
	output [NADDR_WIDTH - 1:0] orgAddr;
	wire [UADDR_WIDTH - 1:2] baseAddr = uAddr[UADDR_WIDTH - 1:2];
	reg [NADDR_WIDTH - 1:2] orgBase;
	assign orgAddr = {orgBase, uAddr[1:0]};
	always @(baseAddr)
		case (baseAddr)
			'h00: orgBase = 7'h0;
			'h01: orgBase = 7'h1;
			'h02: orgBase = 7'h2;
			'h03: orgBase = 7'h2;
			'h08: orgBase = 7'h3;
			'h09: orgBase = 7'h4;
			'h0A: orgBase = 7'h5;
			'h0B: orgBase = 7'h5;
			'h10: orgBase = 7'h6;
			'h11: orgBase = 7'h7;
			'h12: orgBase = 7'h8;
			'h13: orgBase = 7'h8;
			'h18: orgBase = 7'h9;
			'h19: orgBase = 7'hA;
			'h1A: orgBase = 7'hB;
			'h1B: orgBase = 7'hB;
			'h20: orgBase = 7'hC;
			'h21: orgBase = 7'hD;
			'h22: orgBase = 7'hE;
			'h23: orgBase = 7'hD;
			'h28: orgBase = 7'hF;
			'h29: orgBase = 7'h10;
			'h2A: orgBase = 7'h11;
			'h2B: orgBase = 7'h10;
			'h30: orgBase = 7'h12;
			'h31: orgBase = 7'h13;
			'h32: orgBase = 7'h14;
			'h33: orgBase = 7'h14;
			'h38: orgBase = 7'h15;
			'h39: orgBase = 7'h16;
			'h3A: orgBase = 7'h17;
			'h3B: orgBase = 7'h17;
			'h40: orgBase = 7'h18;
			'h41: orgBase = 7'h18;
			'h42: orgBase = 7'h18;
			'h43: orgBase = 7'h18;
			'h44: orgBase = 7'h19;
			'h45: orgBase = 7'h19;
			'h46: orgBase = 7'h19;
			'h47: orgBase = 7'h19;
			'h48: orgBase = 7'h1A;
			'h49: orgBase = 7'h1A;
			'h4A: orgBase = 7'h1A;
			'h4B: orgBase = 7'h1A;
			'h4C: orgBase = 7'h1B;
			'h4D: orgBase = 7'h1B;
			'h4E: orgBase = 7'h1B;
			'h4F: orgBase = 7'h1B;
			'h54: orgBase = 7'h1C;
			'h55: orgBase = 7'h1D;
			'h56: orgBase = 7'h1E;
			'h57: orgBase = 7'h1F;
			'h5C: orgBase = 7'h20;
			'h5D: orgBase = 7'h21;
			'h5E: orgBase = 7'h22;
			'h5F: orgBase = 7'h23;
			'h70: orgBase = 7'h24;
			'h71: orgBase = 7'h24;
			'h72: orgBase = 7'h24;
			'h73: orgBase = 7'h24;
			'h74: orgBase = 7'h24;
			'h75: orgBase = 7'h24;
			'h76: orgBase = 7'h24;
			'h77: orgBase = 7'h24;
			'h78: orgBase = 7'h25;
			'h79: orgBase = 7'h25;
			'h7A: orgBase = 7'h25;
			'h7B: orgBase = 7'h25;
			'h7C: orgBase = 7'h25;
			'h7D: orgBase = 7'h25;
			'h7E: orgBase = 7'h25;
			'h7F: orgBase = 7'h25;
			'h84: orgBase = 7'h26;
			'h85: orgBase = 7'h27;
			'h86: orgBase = 7'h28;
			'h87: orgBase = 7'h29;
			'h8C: orgBase = 7'h2A;
			'h8D: orgBase = 7'h2B;
			'h8E: orgBase = 7'h2C;
			'h8F: orgBase = 7'h2D;
			'h94: orgBase = 7'h2E;
			'h95: orgBase = 7'h2F;
			'h96: orgBase = 7'h30;
			'h97: orgBase = 7'h31;
			'h9C: orgBase = 7'h32;
			'h9D: orgBase = 7'h33;
			'h9E: orgBase = 7'h34;
			'h9F: orgBase = 7'h35;
			'hA4: orgBase = 7'h36;
			'hA5: orgBase = 7'h36;
			'hA6: orgBase = 7'h37;
			'hA7: orgBase = 7'h37;
			'hAC: orgBase = 7'h38;
			'hAD: orgBase = 7'h38;
			'hAE: orgBase = 7'h39;
			'hAF: orgBase = 7'h39;
			'hB4: orgBase = 7'h3A;
			'hB5: orgBase = 7'h3A;
			'hB6: orgBase = 7'h3B;
			'hB7: orgBase = 7'h3B;
			'hBC: orgBase = 7'h3C;
			'hBD: orgBase = 7'h3C;
			'hBE: orgBase = 7'h3D;
			'hBF: orgBase = 7'h3D;
			'hC0: orgBase = 7'h3E;
			'hC1: orgBase = 7'h3F;
			'hC2: orgBase = 7'h40;
			'hC3: orgBase = 7'h41;
			'hC8: orgBase = 7'h42;
			'hC9: orgBase = 7'h43;
			'hCA: orgBase = 7'h44;
			'hCB: orgBase = 7'h45;
			'hD0: orgBase = 7'h46;
			'hD1: orgBase = 7'h47;
			'hD2: orgBase = 7'h48;
			'hD3: orgBase = 7'h49;
			'hD8: orgBase = 7'h4A;
			'hD9: orgBase = 7'h4B;
			'hDA: orgBase = 7'h4C;
			'hDB: orgBase = 7'h4D;
			'hE0: orgBase = 7'h4E;
			'hE1: orgBase = 7'h4E;
			'hE2: orgBase = 7'h4F;
			'hE3: orgBase = 7'h4F;
			'hE8: orgBase = 7'h50;
			'hE9: orgBase = 7'h50;
			'hEA: orgBase = 7'h51;
			'hEB: orgBase = 7'h51;
			'hF0: orgBase = 7'h52;
			'hF1: orgBase = 7'h52;
			'hF2: orgBase = 7'h52;
			'hF3: orgBase = 7'h52;
			'hF8: orgBase = 7'h53;
			'hF9: orgBase = 7'h53;
			'hFA: orgBase = 7'h53;
			'hFB: orgBase = 7'h53;
			default: orgBase = 'sdX;
		endcase
endmodule
