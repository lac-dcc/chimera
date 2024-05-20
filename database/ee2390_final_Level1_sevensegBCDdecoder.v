// This program was cloned from: https://github.com/tlimato/ee2390_final
// License: MIT License

// sevensegBCDdecoder.v for EE 2390 Lab #10

module sevensegBCDdecoder(Minutes, Tens_Seconds, Ones_Seconds, Tenths_Seconds, clk, Seg, an);
    output reg [0:6] Seg;
	output reg [3:0] an = 4'b0000;
    input  [3:0] Minutes, Tens_Seconds, Ones_Seconds, Tenths_Seconds;
	input clk;
    always @(posedge clk) // Do this whenever HexVal changes
    begin
    case(Minutes)
            4'b0000:  begin Seg<= 7'b000_0001; an[3] <= 1; end   // forms the character for 0
            4'b0001:  begin Seg<= 7'b100_1111; an[3] <= 1; end 
			4'b0010:  begin Seg<= 7'b001_0010; an[3] <= 1; end 
			4'b0011:  begin Seg<= 7'b000_0110; an[3] <= 1; end 
			4'b0100:  begin Seg<= 7'b100_1100; an[3] <= 1; end 
			4'b0101:  begin Seg<= 7'b010_0100; an[3] <= 1; end  // forms 5
			4'b0110:  begin Seg<= 7'b000_1000; an[3] <= 1; end  // forms 4
			4'b0111:  begin Seg<= 7'b000_0110; an[3] <= 1; end  // forms 3
			4'b1000:  begin Seg<= 7'b001_0010; an[3] <= 1; end  // forms 2
			4'b1001:  begin Seg<= 7'b100_1111; an[3] <= 1; end  // forms 1
            default:  begin Seg<= 7'b111_1111; an[3] <= 1; end  //  specify a default (all off)
    endcase
	
	case(Tens_Seconds)
			4'b0000:  begin Seg<= 7'b000_0001; an[2] <= 1; end   // forms the character for 0
			4'b0101:  begin Seg<= 7'b010_0100; an[2] <= 1; end  // forms 5
			4'b0110:  begin Seg<= 7'b000_1000; an[2] <= 1; end  // forms 4
			4'b0111:  begin Seg<= 7'b000_0110; an[2] <= 1; end  // forms 3
			4'b1000:  begin Seg<= 7'b001_0010; an[2] <= 1; end  // forms 2
			4'b1001:  begin Seg<= 7'b100_1111; an[2] <= 1; end  // forms 1
            default:  begin Seg<= 7'b111_1111; an[2] <= 1; end  //  specify a default (all off)
	endcase
	
	case(Ones_Seconds)
			4'b0000:  begin Seg<= 7'b000_0001; an[1] <= 1; end   // forms the character for 0
            4'b0001:  begin Seg<= 7'b100_1111; an[1] <= 1; end  
			4'b0010:  begin Seg<= 7'b001_0010; an[1] <= 1; end 
			4'b0011:  begin Seg<= 7'b000_0110; an[1] <= 1; end 
			4'b0100:  begin Seg<= 7'b100_1100; an[1] <= 1; end 
			4'b0101:  begin Seg<= 7'b010_0100; an[1] <= 1; end  // forms 5
			4'b0110:  begin Seg<= 7'b000_1000; an[1] <= 1; end  // forms 4
			4'b0111:  begin Seg<= 7'b000_0110; an[1] <= 1; end  // forms 3
			4'b1000:  begin Seg<= 7'b001_0010; an[1] <= 1; end  // forms 2
			4'b1001:  begin Seg<= 7'b100_1111; an[1] <= 1; end  // forms 1
            default:  begin Seg<= 7'b111_1111; an[1] <= 1; end  //  specify a default (all off)
	endcase
	
	case(Tenths_Seconds)
			4'b0000:  begin Seg<= 7'b000_0001; an[0] <= 1; end   // forms the character for 0
            4'b0001:  begin Seg<= 7'b100_1111; an[0] <= 1; end  
			4'b0010:  begin Seg<= 7'b001_0010; an[0] <= 1; end 
			4'b0011:  begin Seg<= 7'b000_0110; an[0] <= 1; end 
			4'b0100:  begin Seg<= 7'b100_1100; an[0] <= 1; end 
			4'b0101:  begin Seg<= 7'b010_0100; an[0] <= 1; end  // forms 5
			4'b0110:  begin Seg<= 7'b000_1000; an[0] <= 1; end  // forms 4
			4'b0111:  begin Seg<= 7'b000_0110; an[0] <= 1; end  // forms 3
			4'b1000:  begin Seg<= 7'b001_0010; an[0] <= 1; end  // forms 2
			4'b1001:  begin Seg<= 7'b100_1111; an[0] <= 1; end  // forms 1
            default:  begin Seg<= 7'b111_1111; an[0] <= 1; end  //  specify a default (all off)
	endcase
	
    end
endmodule
