module Mirror_Col_4X(	//	Input Side
						iCCD_R,
						iCCD_G,
						iCCD_B,
						iCCD_DVAL,
						iCCD_PIXCLK,
						iRST_N,
						//	Output Side
						oCCD_R,
						oCCD_G,
						oCCD_B,
						oCCD_DVAL	);
//	Input Side					
input	[9:0]	iCCD_R;
input	[9:0]	iCCD_G;
input	[9:0]	iCCD_B;
input			iCCD_DVAL;
input			iCCD_PIXCLK;
input			iRST_N;
//	Output Side
output	[9:0]	oCCD_R;
output	[9:0]	oCCD_G;
output	[9:0]	oCCD_B;
output			oCCD_DVAL;
//	Internal Registers
reg		[9:0]	Z_Cont;
reg				mCCD_DVAL;

assign	oCCD_DVAL	=	mCCD_DVAL;

always@(posedge iCCD_PIXCLK or negedge iRST_N)
begin
	if(!iRST_N)
	begin
		mCCD_DVAL	<=	0;
		Z_Cont		<=	0;
	end
	else
	begin
		mCCD_DVAL	<=	iCCD_DVAL;
		if(Z_Cont<320)
		begin
			if(iCCD_DVAL)
			Z_Cont	<=	Z_Cont+1'b1;
		end
		else
		Z_Cont	<=	0;
	end
end

Stack_4X_RAM (	.clock(iCCD_PIXCLK),
				.data(iCCD_R),
				.rdaddress(319-Z_Cont),
				.wraddress(Z_Cont),
				.wren(iCCD_DVAL),
				.q(oCCD_R));

Stack_4X_RAM (	.clock(iCCD_PIXCLK),
				.data(iCCD_G),
				.rdaddress(319-Z_Cont),
				.wraddress(Z_Cont),
				.wren(iCCD_DVAL),
				.q(oCCD_G));

Stack_4X_RAM (	.clock(iCCD_PIXCLK),
				.data(iCCD_B),
				.rdaddress(319-Z_Cont),
				.wraddress(Z_Cont),
				.wren(iCCD_DVAL),
				.q(oCCD_B));

endmodule