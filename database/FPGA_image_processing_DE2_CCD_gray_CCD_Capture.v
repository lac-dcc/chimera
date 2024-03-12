module CCD_Capture(	oDATA,
					oDVAL,
					oX_Cont,
					oY_Cont,
					oFrame_Cont,
					iDATA,
					iFVAL,
					iLVAL,
					iSTART,
					iEND,
					iCLK,
					iRST	);
					
input	[9:0]	iDATA;
input			iFVAL;
input			iLVAL;
input			iSTART;
input			iEND;
input			iCLK;
input			iRST;
output	[9:0]	oDATA;
output	[10:0]	oX_Cont;
output	[10:0]	oY_Cont;
output	[31:0]	oFrame_Cont;
output			oDVAL;
reg				Pre_FVAL;
reg				mCCD_FVAL;
reg				mCCD_LVAL;
reg		[9:0]	mCCD_DATA;
reg		[10:0]	X_Cont;
reg		[10:0]	Y_Cont;
reg		[31:0]	Frame_Cont;
reg				mSTART;

assign	oX_Cont		=	X_Cont;
assign	oY_Cont		=	Y_Cont;
assign	oFrame_Cont	=	Frame_Cont;
assign	oDATA		=	mCCD_DATA;
assign	oDVAL		=	mCCD_FVAL&mCCD_LVAL;

always@(posedge iCLK or negedge iRST)
begin
	if(!iRST)
	mSTART	<=	0;
	else
	begin
		if(iSTART)
		mSTART	<=	1;
		if(iEND)
		mSTART	<=	0;		
	end
end

always@(posedge iCLK or negedge iRST)
begin
	if(!iRST)
	begin
		Pre_FVAL	<=	0;
		mCCD_FVAL	<=	0;
		mCCD_LVAL	<=	0;
		mCCD_DATA	<=	0;
		X_Cont		<=	0;
		Y_Cont		<=	0;
	end
	else
	begin
		Pre_FVAL	<=	iFVAL;
		if( ({Pre_FVAL,iFVAL}==2'b01) && mSTART )
		mCCD_FVAL	<=	1;
		else if({Pre_FVAL,iFVAL}==2'b10)
		mCCD_FVAL	<=	0;
		mCCD_LVAL	<=	iLVAL;
		mCCD_DATA	<=	iDATA;
		if(mCCD_FVAL)
		begin
			if(mCCD_LVAL)
			begin
				if(X_Cont<1279)
				X_Cont	<=	X_Cont+1;
				else
				begin
					X_Cont	<=	0;
					Y_Cont	<=	Y_Cont+1;
				end
			end
		end
		else
		begin
			X_Cont	<=	0;
			Y_Cont	<=	0;
		end
	end
end

always@(posedge iCLK or negedge iRST)
begin
	if(!iRST)
	Frame_Cont	<=	0;
	else
	begin
		if( ({Pre_FVAL,iFVAL}==2'b01) && mSTART )
		Frame_Cont	<=	Frame_Cont+1;
	end
end

endmodule