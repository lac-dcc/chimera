module char_box(
  input [11:0] gray,
  input [15:0] iX_Cont,
  input [15:0] iY_Cont,
  
  output [11:0] g
  );
  
  wire box;
  
  assign box = (iX_Cont == 16'd300) & (iY_Cont <= 16'd328) & (iY_Cont >= 16'd300) |
					(iX_Cont == 16'd328) & (iY_Cont <= 16'd328) & (iY_Cont >= 16'd300) |
					(iY_Cont == 16'd300) & (iX_Cont <= 16'd328) & (iX_Cont >= 16'd300) |
					(iY_Cont == 16'd328) & (iX_Cont <= 16'd328) & (iX_Cont >= 16'd300);
					
  assign g = box ? 12'hfff : gray;
  endmodule
  