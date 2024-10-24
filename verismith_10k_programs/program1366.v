module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h103):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire4;
  input wire [(5'h10):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire76;
  wire signed [(5'h15):(1'h0)] wire24;
  wire signed [(5'h15):(1'h0)] wire23;
  wire [(5'h11):(1'h0)] wire22;
  wire signed [(5'h12):(1'h0)] wire21;
  wire signed [(4'he):(1'h0)] wire20;
  wire [(5'h11):(1'h0)] wire19;
  wire signed [(4'hb):(1'h0)] wire18;
  wire signed [(3'h5):(1'h0)] wire17;
  wire [(2'h2):(1'h0)] wire16;
  wire signed [(4'hc):(1'h0)] wire15;
  wire [(5'h15):(1'h0)] wire14;
  wire signed [(5'h13):(1'h0)] wire13;
  wire signed [(5'h11):(1'h0)] wire12;
  wire signed [(2'h3):(1'h0)] wire11;
  wire [(3'h6):(1'h0)] wire10;
  wire signed [(3'h4):(1'h0)] wire9;
  wire [(4'h8):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire5;
  reg [(2'h2):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg7 = (1'h0);
  assign y = {wire76,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire6,
                 wire5,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = ((($unsigned(((8'hb9) < wire1)) >>> wire4[(2'h3):(2'h3)]) >= wire0[(2'h3):(1'h1)]) == wire3[(3'h4):(2'h3)]);
  assign wire6 = (-$signed(wire0[(4'h9):(1'h1)]));
  always
    @(posedge clk) begin
      reg7 <= $unsigned($unsigned($unsigned((wire4[(3'h5):(1'h1)] * (wire4 >>> wire3)))));
      reg8 <= wire0[(4'he):(4'hc)];
    end
  assign wire9 = $signed(reg7);
  assign wire10 = $signed((reg8[(1'h1):(1'h0)] <<< (8'ha6)));
  assign wire11 = (8'ha8);
  assign wire12 = wire1[(3'h6):(2'h2)];
  assign wire13 = (|wire12);
  assign wire14 = $signed($signed(wire4));
  assign wire15 = ($signed(reg8) ?
                      (({$signed(wire14),
                              $unsigned(wire14)} > $unsigned($unsigned(wire14))) ?
                          ($signed($unsigned((8'haa))) ?
                              $unsigned((^~wire1)) : ((wire3 ? wire3 : wire2) ?
                                  (~&(7'h44)) : wire12[(3'h4):(1'h1)])) : wire0) : $signed($signed((wire11 * (wire0 ?
                          (8'hb8) : wire6)))));
  assign wire16 = (wire0[(4'h9):(2'h2)] ?
                      $signed(reg8[(2'h2):(1'h1)]) : $signed($unsigned(($unsigned((8'hb2)) ~^ $unsigned(wire6)))));
  assign wire17 = (^~($signed(wire12) ?
                      $signed($signed(wire14[(3'h6):(3'h4)])) : (~|wire12[(3'h5):(1'h0)])));
  assign wire18 = {(wire10[(3'h5):(2'h2)] ? wire14[(4'hb):(3'h5)] : wire3)};
  assign wire19 = ({(((^~wire3) ? wire5 : (wire11 + wire6)) ?
                          ((wire5 ? wire2 : wire11) + {wire18,
                              wire6}) : (^~wire4))} & ({wire1[(3'h4):(2'h3)]} ?
                      wire0 : {(wire14 ?
                              wire13[(3'h4):(2'h3)] : (wire9 ? wire9 : reg8)),
                          $signed($unsigned(wire15))}));
  assign wire20 = wire5;
  assign wire21 = $unsigned(({$signed((wire15 * wire16)), wire6} ?
                      (wire0 ?
                          wire16 : ($unsigned(wire4) < (reg7 - (8'hb9)))) : $unsigned($signed($unsigned(wire16)))));
  assign wire22 = wire15;
  assign wire23 = {{reg7[(1'h1):(1'h0)]},
                      {$unsigned((wire10[(3'h6):(3'h6)] && wire4[(4'hd):(4'h9)])),
                          {{$unsigned(wire16)}, $unsigned(reg8)}}};
  assign wire24 = $unsigned(($unsigned($signed({wire11, wire15})) ?
                      $unsigned((^~wire1[(1'h1):(1'h1)])) : ($unsigned(wire4[(3'h6):(2'h2)]) | $signed(wire9))));
  module25 #() modinst77 (.clk(clk), .wire28(wire21), .wire26(wire15), .y(wire76), .wire27(wire22), .wire29(wire6));
endmodule

module module25  (y, clk, wire29, wire28, wire27, wire26);
  output wire [(32'h48):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire29;
  input wire signed [(5'h10):(1'h0)] wire28;
  input wire [(4'hf):(1'h0)] wire27;
  input wire signed [(3'h4):(1'h0)] wire26;
  wire signed [(5'h13):(1'h0)] wire75;
  wire [(3'h5):(1'h0)] wire74;
  wire signed [(4'h9):(1'h0)] wire73;
  wire [(5'h10):(1'h0)] wire71;
  wire signed [(2'h3):(1'h0)] wire33;
  wire [(3'h6):(1'h0)] wire32;
  wire [(4'h9):(1'h0)] wire31;
  wire signed [(3'h4):(1'h0)] wire30;
  assign y = {wire75,
                 wire74,
                 wire73,
                 wire71,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 (1'h0)};
  assign wire30 = $unsigned($signed(wire27[(4'ha):(4'h8)]));
  assign wire31 = $signed(wire26);
  assign wire32 = ((wire28[(3'h4):(2'h3)] ?
                          $unsigned(($signed(wire29) ?
                              (!wire30) : (wire28 || wire26))) : $unsigned(wire29[(3'h7):(3'h4)])) ?
                      ({(wire30 ? {(8'hb3)} : (wire29 ? wire26 : wire28)),
                          wire26[(1'h1):(1'h0)]} * wire29) : (~|($unsigned((8'ha4)) != wire31[(3'h7):(1'h1)])));
  assign wire33 = (({wire31[(4'h9):(3'h7)], $signed($signed(wire30))} ?
                      wire32 : (wire30 ?
                          wire31[(2'h3):(1'h1)] : (wire29[(1'h1):(1'h0)] ~^ wire27))) <= wire31[(1'h0):(1'h0)]);
  module34 #() modinst72 (wire71, clk, wire29, wire28, wire31, wire32);
  assign wire73 = (&((({wire71} << $signed(wire71)) < wire26) ?
                      (7'h42) : wire31[(3'h4):(2'h3)]));
  assign wire74 = $signed({(~^(&(|wire28)))});
  assign wire75 = {$signed(wire32[(2'h2):(1'h0)]), wire27[(4'hb):(1'h0)]};
endmodule

module module34
#(parameter param70 = ((((7'h40) == (((7'h41) ? (8'hbe) : (8'had)) * ((8'ha2) ? (8'ha9) : (8'haf)))) ? (^~(~^{(8'hbb), (8'ha4)})) : (({(7'h44)} & (^(8'hb5))) ? (~&((8'ha0) ^~ (8'hbb))) : {((8'h9c) ? (8'hba) : (8'ha8))})) != (8'hbf)))
(y, clk, wire38, wire37, wire36, wire35);
  output wire [(32'h187):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire38;
  input wire [(5'h10):(1'h0)] wire37;
  input wire [(3'h4):(1'h0)] wire36;
  input wire [(3'h6):(1'h0)] wire35;
  wire [(5'h15):(1'h0)] wire69;
  wire [(3'h6):(1'h0)] wire68;
  wire signed [(5'h14):(1'h0)] wire67;
  wire [(5'h12):(1'h0)] wire66;
  wire signed [(2'h3):(1'h0)] wire65;
  wire [(5'h14):(1'h0)] wire64;
  wire [(4'hb):(1'h0)] wire63;
  wire [(4'hc):(1'h0)] wire62;
  wire signed [(2'h3):(1'h0)] wire61;
  wire signed [(3'h4):(1'h0)] wire60;
  wire signed [(5'h15):(1'h0)] wire59;
  wire [(5'h12):(1'h0)] wire58;
  wire [(4'hb):(1'h0)] wire57;
  wire signed [(4'h9):(1'h0)] wire56;
  wire signed [(5'h11):(1'h0)] wire55;
  wire signed [(4'hc):(1'h0)] wire54;
  wire [(4'h8):(1'h0)] wire53;
  wire signed [(4'he):(1'h0)] wire52;
  wire [(4'hf):(1'h0)] wire51;
  reg signed [(5'h10):(1'h0)] reg50 = (1'h0);
  reg [(5'h13):(1'h0)] reg49 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg48 = (1'h0);
  reg [(4'hd):(1'h0)] reg47 = (1'h0);
  reg [(5'h11):(1'h0)] reg46 = (1'h0);
  reg [(4'he):(1'h0)] reg45 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg43 = (1'h0);
  reg [(4'hc):(1'h0)] reg42 = (1'h0);
  reg [(4'hf):(1'h0)] reg41 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg40 = (1'h0);
  reg [(4'h8):(1'h0)] reg39 = (1'h0);
  assign y = {wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg39 <= $signed(($unsigned(wire38) || {$unsigned(wire36[(1'h1):(1'h1)])}));
      reg40 <= wire36;
      reg41 <= ($signed($signed((^(8'ha6)))) ?
          (((|wire36[(2'h2):(1'h0)]) ?
              (((8'haf) << wire36) ?
                  (wire36 || wire36) : (wire35 ? wire37 : reg40)) : ((|wire35) ?
                  wire37[(4'hc):(1'h0)] : $signed(wire35))) ^~ ({(reg40 == reg40)} ?
              reg39[(3'h5):(1'h0)] : {(^~(8'h9d))})) : wire37);
      if (({(((8'ha5) ? wire36[(3'h4):(1'h1)] : reg39) ?
                  ((reg41 ? wire38 : (8'hae)) && $signed(reg39)) : {wire37,
                      $unsigned(wire36)})} ?
          $signed(wire35) : $signed((^$unsigned($signed(reg39))))))
        begin
          reg42 <= (^~reg41);
          reg43 <= reg41[(4'ha):(1'h1)];
          if ((~^$signed((reg39 ?
              ((+reg42) ?
                  (wire35 >> reg42) : $signed(wire37)) : $unsigned(wire35)))))
            begin
              reg44 <= wire37;
              reg45 <= $signed($signed(($signed($signed(wire35)) >>> $signed((!wire36)))));
              reg46 <= $signed(({$unsigned(reg39)} ?
                  ((8'hb5) ?
                      {(^~reg42), reg41} : reg39[(3'h7):(1'h0)]) : (~&reg40)));
              reg47 <= ((8'h9f) ?
                  (~reg42[(1'h1):(1'h1)]) : reg45[(1'h1):(1'h0)]);
              reg48 <= $signed($signed(reg43[(5'h15):(3'h7)]));
            end
          else
            begin
              reg44 <= (~|$signed($unsigned(({reg46, reg39} ?
                  $signed(reg39) : (^~wire35)))));
              reg45 <= {($unsigned((reg42 ^ ((8'hb4) << reg40))) <<< ((8'hb8) ?
                      (&((7'h41) ? reg43 : (7'h40))) : $signed((wire37 ?
                          (8'ha4) : wire37)))),
                  {{$signed(reg46[(2'h3):(1'h1)]),
                          ($signed(reg44) | (wire38 ? wire35 : (7'h44)))}}};
              reg46 <= $unsigned(((wire35[(3'h5):(1'h0)] ~^ reg47) ?
                  reg42[(4'hb):(3'h4)] : ((reg41 * reg45) ?
                      ((reg48 <= reg44) ? reg46 : reg48) : (~&reg45))));
              reg47 <= ((8'ha3) << $unsigned(reg41[(4'hc):(2'h3)]));
              reg48 <= reg39[(2'h2):(2'h2)];
            end
          reg49 <= reg41;
          reg50 <= {$signed($signed((reg43[(3'h4):(1'h1)] + $unsigned(reg42)))),
              {((^wire38) * $unsigned($signed((7'h41))))}};
        end
      else
        begin
          if ((8'hb0))
            begin
              reg42 <= wire37[(2'h3):(2'h3)];
              reg43 <= wire37[(4'hf):(2'h3)];
              reg44 <= reg47;
              reg45 <= (reg49 < $unsigned($unsigned((^~(~&reg47)))));
              reg46 <= (((|reg48) ?
                  (((-reg43) != {reg45}) + wire35[(1'h0):(1'h0)]) : wire36) + reg43[(4'hb):(3'h6)]);
            end
          else
            begin
              reg42 <= (reg45[(4'hb):(1'h1)] <<< reg45[(1'h0):(1'h0)]);
              reg43 <= ((((!(wire37 ? reg46 : wire36)) | ($unsigned(reg41) ?
                  $unsigned(wire38) : (^reg41))) * $signed({((8'had) ?
                      reg40 : reg45),
                  ((8'h9c) ^ (8'ha3))})) & ({($signed(reg50) ?
                          (reg47 ? wire35 : reg48) : ((8'ha3) ?
                              reg47 : wire37))} ?
                  (reg47[(3'h7):(3'h7)] ?
                      ({wire35, reg46} ?
                          $signed((8'haa)) : reg42) : (reg44[(2'h3):(1'h0)] ^ ((8'hb6) ?
                          wire37 : reg50))) : reg49[(4'he):(2'h3)]));
              reg44 <= wire37;
              reg45 <= $signed(($signed($unsigned((wire37 ? reg42 : reg39))) ?
                  $unsigned((-((8'ha7) >> reg50))) : ((^{reg46,
                      wire38}) ~^ (~(~reg48)))));
            end
          reg47 <= $signed(wire37);
          reg48 <= $signed(reg47[(2'h2):(1'h0)]);
          reg49 <= reg46[(5'h10):(4'h8)];
          reg50 <= $unsigned((&$signed((8'haf))));
        end
    end
  assign wire51 = {((reg43[(5'h14):(5'h11)] ?
                              (((8'hb5) ?
                                  reg40 : wire38) | reg44[(3'h4):(2'h3)]) : $unsigned($unsigned(wire37))) ?
                          {reg41[(3'h7):(1'h0)]} : ($unsigned($signed(wire37)) >>> ($unsigned(reg47) ?
                              (~^reg42) : wire38[(1'h1):(1'h1)])))};
  assign wire52 = $signed($unsigned((((!(8'ha2)) && (reg48 ?
                      (8'hb4) : reg40)) ~^ (reg39[(3'h6):(3'h5)] ?
                      $unsigned(reg43) : (wire51 ? (8'ha0) : reg49)))));
  assign wire53 = reg42[(4'hc):(2'h3)];
  assign wire54 = $unsigned($signed((wire53 ?
                      $unsigned((^reg46)) : (reg46 ? wire38 : (^wire36)))));
  assign wire55 = $signed(wire51);
  assign wire56 = (^({($unsigned(wire36) ?
                              ((8'ha3) ~^ reg39) : $unsigned(wire38)),
                          wire35} ?
                      reg50 : $signed((~^$unsigned(wire37)))));
  assign wire57 = reg40[(2'h2):(1'h1)];
  assign wire58 = $signed({wire52[(4'hd):(4'hc)],
                      (|(wire57[(1'h1):(1'h0)] << (reg40 ? reg41 : wire51)))});
  assign wire59 = reg48[(1'h0):(1'h0)];
  assign wire60 = $unsigned(wire54[(3'h4):(1'h1)]);
  assign wire61 = ($signed(reg39[(3'h7):(2'h2)]) ?
                      (({$signed((8'ha6)), {wire35}} <= (8'ha6)) ?
                          (8'ha0) : reg45[(2'h3):(1'h0)]) : reg45[(4'he):(4'h9)]);
  assign wire62 = (wire61 ?
                      (wire52 ?
                          reg41 : (~wire59)) : $unsigned((reg47[(4'hb):(2'h2)] ?
                          ((wire58 ^ wire56) ? reg40 : (&wire58)) : wire52)));
  assign wire63 = (reg43 ^~ (~&((+(reg45 <<< wire56)) | reg48)));
  assign wire64 = wire36[(2'h2):(1'h1)];
  assign wire65 = wire58;
  assign wire66 = $unsigned(reg40);
  assign wire67 = (-({reg50[(2'h2):(1'h0)]} - wire35[(3'h4):(1'h0)]));
  assign wire68 = wire66;
  assign wire69 = wire67;
endmodule
