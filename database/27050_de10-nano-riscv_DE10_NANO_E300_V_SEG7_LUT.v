// This program was cloned from: https://github.com/thinkoco/de10-nano-riscv
// License: Apache License 2.0


module SEG7_LUT (       oSEG,iDIG       );
input   [3:0]   iDIG;
output  [7:0]   oSEG;
reg             [7:0]   oSEG;

always @(iDIG)
begin
                case(iDIG)
                4'h1: oSEG = 8'b01111001;        // ---0----
                4'h2: oSEG = 8'b00100100;        // |      |
                4'h3: oSEG = 8'b00110000;        // 5     1
                4'h4: oSEG = 8'b00011001;        // |      |
                4'h5: oSEG = 8'b00010010;        // ---6----
                4'h6: oSEG = 8'b00000010;        // |      |
                4'h7: oSEG = 8'b01111000;        // 4      2
                4'h8: oSEG = 8'b00000000;        // |      |
                4'h9: oSEG = 8'b00011000;        // ---3---- .7
                4'ha: oSEG = 8'b00001000;
                4'hb: oSEG = 8'b00000011;
                4'hc: oSEG = 8'b01000110;
                4'hd: oSEG = 8'b00100001;
                4'he: oSEG = 8'b00000110;
                4'hf: oSEG = 8'b00001110;  //C5P board's HEX is common anode
                4'h0: oSEG = 8'b01000000;  //this code use for default code ,so the point always light ,you can change it if you need.
                endcase
end

endmodule