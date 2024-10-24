module top
#(parameter param18 = {(((~&((8'ha5) ? (8'hbb) : (8'hb3))) ? (|{(8'ha4)}) : (((8'hb4) ? (7'h42) : (8'had)) ? ((8'hab) ? (8'ha5) : (8'had)) : (~^(8'had)))) ^~ {(((8'hb2) ? (8'h9c) : (8'hb7)) ^ ((7'h40) && (8'hb6))), ((8'hab) != ((8'h9e) ? (8'hbb) : (8'hb9)))}), (((((8'hb7) ? (8'had) : (8'hbc)) ? (~^(8'hbc)) : (~&(7'h40))) ? (((8'h9e) - (8'ha5)) || ((8'hbf) ^~ (8'hb2))) : ((!(8'had)) ? {(7'h40)} : (~&(8'haf)))) >= (~((~(8'hbf)) ? ((8'h9c) ? (8'ha8) : (8'hbf)) : ((8'hb0) | (8'hb0)))))}, 
parameter param19 = (({param18} ? ((^((8'hb2) ? param18 : param18)) | param18) : {(&(param18 < param18))}) ? (&(param18 - ({param18, param18} ? (-param18) : (param18 | param18)))) : param18))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hae):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire4;
  input wire [(3'h5):(1'h0)] wire3;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire17;
  wire signed [(4'h9):(1'h0)] wire16;
  wire signed [(4'hd):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire5;
  reg [(4'hd):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg13 = (1'h0);
  reg [(5'h15):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg11 = (1'h0);
  reg [(2'h3):(1'h0)] reg10 = (1'h0);
  reg [(5'h12):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  reg [(4'ha):(1'h0)] reg7 = (1'h0);
  assign y = {wire17,
                 wire16,
                 wire6,
                 wire5,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = (~^wire0[(4'h8):(3'h7)]);
  assign wire6 = wire0;
  always
    @(posedge clk) begin
      reg7 <= wire6;
      reg8 <= $unsigned(wire6);
      reg9 <= {wire3};
      reg10 <= (8'ha9);
    end
  always
    @(posedge clk) begin
      reg11 <= $signed(wire2);
      reg12 <= ((~&{wire4[(5'h11):(1'h0)]}) ?
          ($unsigned($signed(((7'h40) != wire2))) ?
              $unsigned($signed($unsigned(reg7))) : reg8) : wire1[(4'h8):(2'h3)]);
      reg13 <= $signed($signed(reg10[(2'h3):(1'h1)]));
      reg14 <= ((~|wire4[(2'h3):(2'h2)]) ? wire4 : (^~reg13));
      reg15 <= wire6[(1'h1):(1'h1)];
    end
  assign wire16 = $signed((($unsigned($unsigned(wire1)) ?
                      ($signed(wire2) ?
                          (wire1 ^ (8'hb0)) : wire1) : $unsigned(reg9)) - reg13[(2'h2):(1'h0)]));
  assign wire17 = $signed((8'haa));
endmodule
