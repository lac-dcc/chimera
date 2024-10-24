module top
#(parameter param55 = (~^(&(((8'hb0) >>> ((8'hbe) == (8'hb2))) & (((8'hb9) | (8'h9e)) ? ((8'ha8) < (7'h43)) : ((7'h41) ? (8'h9c) : (8'haa)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h5c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire4;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire54;
  wire [(5'h13):(1'h0)] wire53;
  wire signed [(5'h13):(1'h0)] wire52;
  wire signed [(5'h15):(1'h0)] wire51;
  wire [(4'h8):(1'h0)] wire21;
  wire [(5'h14):(1'h0)] wire49;
  assign y = {wire54, wire53, wire52, wire51, wire21, wire49, (1'h0)};
  module5 #() modinst22 (.wire6(wire2), .wire7(wire1), .clk(clk), .wire8(wire3), .wire9(wire4), .y(wire21), .wire10(wire0));
  module23 #() modinst50 (wire49, clk, wire2, wire4, wire3, wire1, wire21);
  assign wire51 = (-wire3[(5'h10):(3'h5)]);
  assign wire52 = $signed(wire51[(3'h6):(2'h3)]);
  assign wire53 = ((wire3[(1'h1):(1'h1)] * $unsigned(($signed(wire1) << $unsigned(wire49)))) ?
                      (|{$unsigned((wire49 ? wire52 : wire51)),
                          wire2}) : $unsigned(wire52[(5'h10):(4'hd)]));
  assign wire54 = (((wire49[(5'h12):(5'h10)] && $signed((+wire2))) ~^ wire4) >> wire4);
endmodule

module module23
#(parameter param48 = ({(8'hb9), (((~|(8'ha2)) ? {(7'h42)} : (^(8'h9c))) ? {((7'h40) ? (8'ha2) : (8'haa))} : ((!(7'h43)) || ((8'ha6) != (8'hac))))} >= (|((((8'hba) << (7'h40)) >= ((8'ha6) ? (8'hb1) : (8'ha0))) ? {((8'hbf) ? (8'haf) : (8'hb4)), (~^(8'ha8))} : (~(~&(8'h9c)))))))
(y, clk, wire24, wire25, wire26, wire27, wire28);
  output wire [(32'h53):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire24;
  input wire signed [(4'he):(1'h0)] wire25;
  input wire [(5'h11):(1'h0)] wire26;
  input wire signed [(4'hd):(1'h0)] wire27;
  input wire signed [(4'h8):(1'h0)] wire28;
  wire [(4'he):(1'h0)] wire47;
  wire signed [(3'h4):(1'h0)] wire30;
  wire signed [(5'h12):(1'h0)] wire31;
  wire signed [(4'h8):(1'h0)] wire32;
  wire [(4'h9):(1'h0)] wire33;
  wire [(5'h13):(1'h0)] wire45;
  reg [(4'ha):(1'h0)] reg29 = (1'h0);
  assign y = {wire47, wire30, wire31, wire32, wire33, wire45, reg29, (1'h0)};
  always
    @(posedge clk) begin
      reg29 <= (+(wire25[(1'h1):(1'h0)] ?
          ((8'hb4) ?
              wire28 : ($unsigned(wire26) ?
                  (wire24 == wire26) : $signed((8'ha6)))) : wire25));
    end
  assign wire30 = ((wire24 ?
                          $signed($unsigned((7'h42))) : ($unsigned((~|wire24)) <= (~^$signed(wire24)))) ?
                      ($signed(wire25) & ((8'ha9) ?
                          ((wire27 ?
                              wire25 : wire24) ~^ $signed(wire27)) : (|$unsigned(reg29)))) : {$signed(wire24)});
  assign wire31 = ((wire30 ? wire28[(3'h4):(2'h2)] : (8'hbc)) ?
                      (wire30[(3'h4):(2'h2)] + {$signed(wire24[(2'h2):(1'h1)])}) : ((({wire27,
                          wire25} + (wire27 ?
                          wire25 : wire24)) >> ({wire28} ^~ $signed(wire25))) == wire30));
  assign wire32 = $signed(reg29);
  assign wire33 = wire25[(4'he):(4'h9)];
  module34 #() modinst46 (wire45, clk, reg29, wire25, wire28, wire33);
  assign wire47 = ($signed(($unsigned($signed(wire28)) ?
                      {$unsigned(wire27),
                          (wire33 ?
                              wire32 : wire26)} : wire27)) >> $unsigned(wire25[(1'h1):(1'h1)]));
endmodule

module module5
#(parameter param20 = ((8'hbb) ? (&(~&({(8'hbb)} >> (8'hbe)))) : ((((~|(8'haf)) ? (^(8'hb7)) : (~(8'hb9))) ? (((8'ha2) ? (7'h40) : (8'hb4)) ? (~|(8'haa)) : ((8'haa) >= (8'h9d))) : ((8'haa) ? (~(8'ha0)) : (&(8'hac)))) ? ((((8'hb3) ? (8'hbb) : (8'hbf)) ? ((7'h42) ~^ (8'hb7)) : ((8'ha4) | (8'hb5))) || (((8'hb8) < (8'hb4)) ? ((8'hb8) ? (8'ha0) : (8'haa)) : (~&(8'ha4)))) : (^({(8'hb0)} ? (~|(8'ha5)) : (~(8'ha6)))))))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h65):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire10;
  input wire signed [(5'h10):(1'h0)] wire9;
  input wire [(4'hd):(1'h0)] wire8;
  input wire signed [(5'h14):(1'h0)] wire7;
  input wire [(5'h10):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire19;
  wire signed [(5'h14):(1'h0)] wire17;
  wire signed [(3'h4):(1'h0)] wire16;
  wire [(2'h3):(1'h0)] wire13;
  wire [(4'hf):(1'h0)] wire12;
  wire [(5'h12):(1'h0)] wire11;
  reg [(4'hf):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg15 = (1'h0);
  reg [(3'h7):(1'h0)] reg14 = (1'h0);
  assign y = {wire19,
                 wire17,
                 wire16,
                 wire13,
                 wire12,
                 wire11,
                 reg18,
                 reg15,
                 reg14,
                 (1'h0)};
  assign wire11 = ($unsigned(wire9) ?
                      (((wire6[(4'he):(4'he)] ? (wire9 - (8'h9e)) : (~wire9)) ?
                          ($signed(wire7) >= (wire7 ?
                              wire8 : wire10)) : wire8[(4'hd):(3'h5)]) == (wire8[(3'h6):(3'h6)] ?
                          (wire7[(4'h9):(3'h7)] ?
                              {wire10,
                                  wire6} : {wire6}) : wire10[(1'h1):(1'h1)])) : (wire9 ?
                          (^({wire9} ? $unsigned(wire6) : wire9)) : {wire6,
                              wire9[(5'h10):(1'h1)]}));
  assign wire12 = ($unsigned({($unsigned(wire8) ^ wire11),
                          (^(wire9 ? wire10 : wire9))}) ?
                      {{wire11, wire8[(4'hd):(3'h7)]}} : wire11);
  assign wire13 = {$signed($unsigned(((wire12 ?
                          wire6 : wire6) >> (wire10 <<< wire11))))};
  always
    @(posedge clk) begin
      reg14 <= {(wire8 ?
              wire7 : $signed(((wire12 ? wire12 : wire7) ?
                  {wire10, wire8} : (&wire7)))),
          wire11[(3'h6):(2'h3)]};
      reg15 <= $unsigned($signed((&reg14)));
    end
  assign wire16 = ((~wire10) > $signed(reg15[(2'h2):(2'h2)]));
  assign wire17 = $unsigned((wire7[(5'h13):(3'h5)] ~^ ({$unsigned(wire10)} ^ (|$unsigned(wire13)))));
  always
    @(posedge clk) begin
      reg18 <= (^~wire12);
    end
  assign wire19 = wire7;
endmodule

module module34  (y, clk, wire38, wire37, wire36, wire35);
  output wire [(32'h55):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire38;
  input wire signed [(2'h3):(1'h0)] wire37;
  input wire signed [(4'h8):(1'h0)] wire36;
  input wire signed [(4'h9):(1'h0)] wire35;
  wire [(4'hf):(1'h0)] wire44;
  wire signed [(5'h12):(1'h0)] wire43;
  wire signed [(3'h7):(1'h0)] wire42;
  wire [(5'h13):(1'h0)] wire41;
  wire [(3'h4):(1'h0)] wire40;
  wire [(5'h15):(1'h0)] wire39;
  assign y = {wire44, wire43, wire42, wire41, wire40, wire39, (1'h0)};
  assign wire39 = $signed($unsigned((&($unsigned(wire37) ?
                      (wire36 ? wire38 : wire35) : (8'hbc)))));
  assign wire40 = wire37;
  assign wire41 = (~|(wire35[(3'h5):(3'h4)] ?
                      ({(wire40 ? wire38 : wire37)} ?
                          $unsigned((wire37 ?
                              wire35 : wire38)) : $signed((^wire38))) : wire38));
  assign wire42 = wire36;
  assign wire43 = $unsigned(wire35[(4'h9):(1'h1)]);
  assign wire44 = (wire39[(4'h9):(3'h7)] ?
                      wire38 : (wire42 | ($signed(((8'hbf) || (7'h41))) ?
                          $signed((8'hb8)) : $unsigned((!wire43)))));
endmodule
