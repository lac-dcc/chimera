module top
#(parameter param41 = ((^~((^{(8'hbe)}) >> (~{(8'hb5)}))) == (((|(|(8'h9d))) ? {{(8'hbc)}, {(8'hb4), (8'hab)}} : (((8'ha5) | (8'haf)) == ((8'ha4) ? (8'hbd) : (8'hbb)))) <<< (!((~^(8'hbe)) << {(8'hbf)})))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hc9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire4;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire40;
  wire [(3'h7):(1'h0)] wire39;
  wire [(4'ha):(1'h0)] wire37;
  wire signed [(3'h7):(1'h0)] wire18;
  wire signed [(5'h12):(1'h0)] wire17;
  wire [(4'hc):(1'h0)] wire12;
  wire [(4'h8):(1'h0)] wire11;
  wire signed [(5'h10):(1'h0)] wire10;
  wire [(5'h10):(1'h0)] wire9;
  wire [(5'h14):(1'h0)] wire8;
  wire [(2'h2):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire5;
  reg [(3'h6):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg14 = (1'h0);
  reg signed [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg16 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire37,
                 wire18,
                 wire17,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 (1'h0)};
  assign wire5 = ($unsigned($signed(wire0)) ? $signed(wire0) : wire4);
  assign wire6 = (8'hb8);
  assign wire7 = (^~$signed(wire6));
  assign wire8 = $unsigned((wire7 + ($unsigned((wire0 != wire5)) ?
                     ($unsigned(wire7) ?
                         wire3[(3'h4):(3'h4)] : (~&(8'ha3))) : {$signed(wire0),
                         $signed(wire3)})));
  assign wire9 = {wire1};
  assign wire10 = (-{$unsigned($unsigned(wire3))});
  assign wire11 = (((wire9 ?
                              (8'hb6) : ($signed(wire0) ?
                                  (wire9 ? wire7 : wire0) : (wire4 << wire2))) ?
                          (8'hbf) : {((wire6 ? wire1 : wire1) >> (8'ha5))}) ?
                      wire3 : ((^~wire9) ?
                          ($unsigned(wire0[(3'h4):(1'h0)]) ?
                              {(~&wire5)} : $signed($unsigned(wire1))) : wire4));
  assign wire12 = $unsigned((wire8 ?
                      wire5[(4'hf):(3'h5)] : $signed({(wire6 ? wire4 : wire2),
                          $signed(wire5)})));
  always
    @(posedge clk) begin
      reg13 <= (+wire3[(1'h1):(1'h1)]);
      reg14 <= ((^$signed(($signed(wire7) ?
          $signed((8'h9c)) : ((8'hb2) ?
              wire12 : wire1)))) << $unsigned($signed(wire3)));
      reg15 <= $signed((~^((~wire1) ? wire4 : wire2[(1'h0):(1'h0)])));
      reg16 <= $signed($unsigned($signed($unsigned(wire2[(1'h0):(1'h0)]))));
    end
  assign wire17 = (8'hb2);
  assign wire18 = $unsigned({((~^wire3[(3'h7):(3'h4)]) ?
                          wire12[(1'h0):(1'h0)] : $unsigned(wire12[(2'h3):(1'h0)])),
                      (wire6 ? $unsigned(wire10[(2'h3):(1'h0)]) : wire4)});
  module19 #() modinst38 (wire37, clk, reg16, wire10, wire2, wire1, wire4);
  assign wire39 = (wire8[(4'h9):(4'h8)] ? wire10 : reg14[(3'h4):(2'h3)]);
  assign wire40 = (((+$unsigned((wire7 ?
                      wire17 : reg15))) > $signed($unsigned((wire1 ?
                      wire6 : wire2)))) || (reg14 & {{$signed((7'h41)),
                          {(8'hbb)}}}));
endmodule

module module19
#(parameter param35 = (!({((~|(8'ha7)) + (~|(8'ha4))), ((^~(8'ha6)) == ((8'h9c) ? (8'hb8) : (8'h9d)))} > (((+(8'hb4)) ? (~^(8'hac)) : (8'ha1)) > (~^((8'had) ? (8'ha4) : (8'h9c)))))), 
parameter param36 = {(({(8'hba), param35} - (&(param35 ^ param35))) >>> param35), param35})
(y, clk, wire24, wire23, wire22, wire21, wire20);
  output wire [(32'h7e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire24;
  input wire [(4'hb):(1'h0)] wire23;
  input wire [(3'h7):(1'h0)] wire22;
  input wire signed [(5'h14):(1'h0)] wire21;
  input wire signed [(2'h3):(1'h0)] wire20;
  wire signed [(4'hb):(1'h0)] wire34;
  wire [(5'h10):(1'h0)] wire33;
  wire signed [(4'hd):(1'h0)] wire32;
  wire [(3'h7):(1'h0)] wire31;
  wire signed [(5'h13):(1'h0)] wire30;
  wire signed [(5'h10):(1'h0)] wire29;
  wire signed [(4'hb):(1'h0)] wire28;
  wire [(4'hc):(1'h0)] wire27;
  wire [(3'h5):(1'h0)] wire26;
  wire signed [(4'hf):(1'h0)] wire25;
  assign y = {wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 (1'h0)};
  assign wire25 = wire20[(2'h2):(1'h0)];
  assign wire26 = ((-(&wire22[(1'h0):(1'h0)])) <<< $unsigned($signed((~^wire21))));
  assign wire27 = (~wire26);
  assign wire28 = ($signed((8'hb3)) == ((((wire25 ?
                      (8'ha4) : wire24) << wire20) >= $unsigned(wire24[(5'h10):(1'h0)])) <= wire21));
  assign wire29 = wire26[(1'h1):(1'h0)];
  assign wire30 = (wire27[(2'h2):(1'h1)] | ((($signed(wire26) <<< {wire27}) == (^wire24[(4'hf):(3'h6)])) + (&$unsigned($signed(wire28)))));
  assign wire31 = ((wire24[(1'h0):(1'h0)] ?
                          (7'h40) : ((^~$unsigned(wire28)) & ($signed(wire22) ?
                              $unsigned((8'had)) : wire24))) ?
                      wire25 : (!(~{$unsigned(wire27)})));
  assign wire32 = (((8'haa) * $signed({(wire23 >= wire28)})) << (~|wire27));
  assign wire33 = wire29;
  assign wire34 = wire27;
endmodule
