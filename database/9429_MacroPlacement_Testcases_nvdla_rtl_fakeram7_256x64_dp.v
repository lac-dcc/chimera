// This program was cloned from: https://github.com/TILOS-AI-Institute/MacroPlacement
// License: BSD 3-Clause "New" or "Revised" License

module fakeram_256x64_dp 
(
  QA, 
  CLKA, 
  CENA, 
  AA, 
  CLKB,
  CENB, 
  AB, 
  DB, 
  STOV, 
  EMAA, 
  EMASA, 
  EMAB, 
  RET1N
);

input CLKA;
input CLKB;

input CENA;
input [7:0]  AA;
output [63:0] QA;

input CENB;
input [7:0]  AB;
input [63:0] DB;

input STOV;
input [2:0] EMAA; 
input EMASA;
input [2:0] EMAB;
input RET1N;

assign STOV = 1'b0;
assign EMASA = 1'b0;	
assign EMAA = 3'b010;	// Extra margin adjustment A: Default for 0.8V
assign EMAB = 3'b010;	// Extra margin adjustment B: Default for 0.8V
assign RET1N = 1'b1;	
wire [63:0] QB;
wire [63:0] QA1;

sram_asap7_64x256_1rw rmod_a
(
   .rd_out(QA1),
   .addr_in(AA),
   .we_in(~CENA),
   .wd_in(DB), //dummy
   .clk(CLKA),
   .ce_in(CENA)
);

sram_asap7_64x256_1rw rmod_b
(
   .rd_out(QB), //dummy
   .addr_in(AB),
   .we_in(CENB),
   .wd_in(DB), 
   .clk(CLKB),
   .ce_in(CENB)
);

genvar k;
generate
    for (k = 0; k < 64; k=k+1) begin
        assign QA[k] = (~CENB & QB[k]) | (CENB & QA1[k]);
    end
endgenerate

endmodule

