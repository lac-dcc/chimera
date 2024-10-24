module top
#(parameter param18 = (&(((((8'ha9) ? (8'h9d) : (8'ha7)) >> ((8'ha7) <= (8'hb3))) ? (((8'hbf) ? (8'h9f) : (8'hbf)) > ((8'hba) ? (8'hac) : (8'ha6))) : (((8'hae) < (8'ha9)) ^~ (-(8'ha7)))) + (-{(~|(8'hb2))}))), 
parameter param19 = ({{param18}, ((param18 < ((8'ha1) ? param18 : param18)) < ((~|param18) <= (param18 ? param18 : (8'had))))} < (({param18} ? ((~^param18) ? (~|param18) : (~|(8'hb3))) : param18) ? ((-(param18 ? param18 : param18)) ? {(param18 ? param18 : param18), (8'h9f)} : (param18 ? (param18 & param18) : (&param18))) : (param18 ^ param18))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'ha4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire17;
  wire signed [(4'hb):(1'h0)] wire13;
  wire [(5'h13):(1'h0)] wire9;
  wire signed [(5'h14):(1'h0)] wire8;
  wire [(3'h6):(1'h0)] wire7;
  wire [(3'h5):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire5;
  wire signed [(3'h6):(1'h0)] wire4;
  reg signed [(4'hb):(1'h0)] reg16 = (1'h0);
  reg [(3'h4):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg12 = (1'h0);
  reg [(5'h15):(1'h0)] reg11 = (1'h0);
  reg [(4'ha):(1'h0)] reg10 = (1'h0);
  assign y = {wire17,
                 wire13,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg16,
                 reg15,
                 reg14,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire4 = (8'h9d);
  assign wire5 = wire0[(2'h2):(2'h2)];
  assign wire6 = wire1[(4'hf):(1'h0)];
  assign wire7 = ((|(7'h44)) <<< $unsigned(((|(&wire6)) ?
                     (!(wire2 ?
                         wire5 : wire4)) : $unsigned($unsigned(wire1)))));
  assign wire8 = $signed(((((wire6 ? wire3 : wire1) > {wire6,
                     wire6}) + {$unsigned(wire3),
                     (wire2 != wire4)}) ~^ wire0[(3'h7):(1'h1)]));
  assign wire9 = wire1[(4'hc):(4'hb)];
  always
    @(posedge clk) begin
      reg10 <= wire4;
      reg11 <= (wire1 ?
          wire7 : ((wire4 ?
              wire1[(2'h3):(1'h1)] : wire9) <<< ($unsigned($signed(wire3)) + (~|(reg10 <<< wire1)))));
      reg12 <= ($signed(wire8) ~^ $signed(reg10[(4'ha):(3'h6)]));
    end
  assign wire13 = wire8[(4'he):(4'hc)];
  always
    @(posedge clk) begin
      reg14 <= $unsigned({wire8});
      reg15 <= wire3;
      reg16 <= $signed((~&$unsigned(($unsigned(reg15) ?
          $signed((7'h44)) : wire7[(2'h3):(1'h0)]))));
    end
  assign wire17 = $signed($signed(((reg14[(3'h5):(3'h4)] * {reg16}) ?
                      (((8'haa) >>> reg11) ?
                          (wire9 ?
                              wire13 : wire3) : wire6[(3'h4):(1'h0)]) : wire7)));
endmodule
