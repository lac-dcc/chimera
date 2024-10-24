module top
#(parameter param92 = ((((((8'hab) ? (8'ha3) : (8'ha3)) ? ((8'had) ? (7'h40) : (8'ha0)) : {(8'hb0), (8'ha5)}) || {((8'ha3) ? (8'hb0) : (8'ha9)), (8'hb3)}) > ({((8'h9e) ? (7'h44) : (8'hb0)), (|(8'hbe))} ? ((~(8'hbf)) ? ((8'h9f) ? (8'hba) : (8'hbd)) : ((8'hae) & (8'hbb))) : (((8'hb8) - (8'hb6)) < ((7'h41) & (8'hb5))))) ~^ ({(|((7'h41) != (8'ha0))), (((8'hb6) > (8'ha3)) >= (~|(8'hab)))} ? ({{(7'h41)}} + (~{(8'ha0), (8'ha4)})) : ((&((8'hb8) ? (8'ha6) : (8'hb3))) ? {(&(8'hba)), ((8'ha8) ? (8'ha9) : (8'hb0))} : (((8'hab) ? (8'ha8) : (7'h40)) + ((8'hb1) <= (8'ha8)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h3d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire4;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire90;
  wire signed [(4'he):(1'h0)] wire9;
  wire signed [(3'h5):(1'h0)] wire8;
  wire [(4'h8):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire6;
  wire [(4'h9):(1'h0)] wire5;
  assign y = {wire90, wire9, wire8, wire7, wire6, wire5, (1'h0)};
  assign wire5 = (&wire4);
  assign wire6 = $unsigned((^wire0));
  assign wire7 = (~^wire4[(4'hc):(3'h5)]);
  assign wire8 = $unsigned(wire6[(1'h1):(1'h0)]);
  assign wire9 = wire7;
  module10 #() modinst91 (wire90, clk, wire5, wire3, wire6, wire0);
endmodule

module module10
#(parameter param89 = ((^~(^((-(8'hb2)) | (~(8'hb7))))) - (~&(~^(8'hb8)))))
(y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'h121):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire14;
  input wire [(4'hb):(1'h0)] wire13;
  input wire [(5'h10):(1'h0)] wire12;
  input wire signed [(5'h14):(1'h0)] wire11;
  wire [(5'h12):(1'h0)] wire88;
  wire [(5'h13):(1'h0)] wire87;
  wire [(4'h8):(1'h0)] wire86;
  wire [(4'hd):(1'h0)] wire85;
  wire [(5'h15):(1'h0)] wire60;
  wire signed [(3'h5):(1'h0)] wire62;
  wire [(4'h9):(1'h0)] wire63;
  wire signed [(3'h6):(1'h0)] wire64;
  wire [(5'h10):(1'h0)] wire65;
  wire signed [(3'h6):(1'h0)] wire83;
  reg signed [(4'h8):(1'h0)] reg28 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg26 = (1'h0);
  reg [(5'h11):(1'h0)] reg25 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg24 = (1'h0);
  reg [(5'h15):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg20 = (1'h0);
  reg [(4'h9):(1'h0)] reg19 = (1'h0);
  reg [(4'hb):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg16 = (1'h0);
  reg [(5'h10):(1'h0)] reg15 = (1'h0);
  assign y = {wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire60,
                 wire62,
                 wire63,
                 wire64,
                 wire65,
                 wire83,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((!$unsigned((&((wire12 ? wire11 : wire14) << {wire14})))))
        begin
          reg15 <= $unsigned($signed($unsigned((wire12 >>> $unsigned(wire12)))));
          reg16 <= wire14[(3'h5):(2'h3)];
          reg17 <= ($unsigned((($unsigned(reg16) & (wire13 ?
                  reg15 : wire13)) ~^ (^~(reg16 * (7'h40))))) ?
              $signed(($unsigned(wire14[(1'h0):(1'h0)]) ?
                  $signed((~^wire12)) : {(wire13 & wire11),
                      $signed(wire14)})) : $unsigned((-$unsigned((^wire12)))));
        end
      else
        begin
          reg15 <= wire14[(3'h7):(3'h5)];
          if (((wire12[(3'h5):(1'h1)] + $unsigned($unsigned((reg16 + reg17)))) | wire11))
            begin
              reg16 <= ((!wire14[(3'h7):(2'h3)]) ?
                  {wire12,
                      ((~|$unsigned((8'h9c))) ?
                          $unsigned((reg16 * wire12)) : $signed(wire14[(2'h2):(1'h1)]))} : $signed(wire14));
              reg17 <= $signed(((reg16 ?
                      $signed(reg16[(1'h0):(1'h0)]) : reg17[(4'h8):(4'h8)]) ?
                  $unsigned((&$unsigned(reg15))) : {$unsigned(((8'hb8) << wire13))}));
              reg18 <= wire12;
              reg19 <= $signed(reg18[(1'h0):(1'h0)]);
              reg20 <= (reg19[(4'h9):(1'h1)] - {(8'ha5),
                  (reg18 ?
                      wire12 : (wire14 ?
                          $unsigned(wire14) : $signed((8'ha0))))});
            end
          else
            begin
              reg16 <= (!(wire12 ?
                  (~&{(+wire11)}) : $signed($unsigned((reg18 ?
                      (8'hbf) : reg20)))));
              reg17 <= (+(&$unsigned((wire12[(3'h5):(1'h1)] ?
                  $signed(wire14) : (reg17 ^ reg18)))));
              reg18 <= $unsigned(wire14);
              reg19 <= wire13[(3'h7):(2'h2)];
            end
          reg21 <= reg17;
          reg22 <= {((reg18 > {reg19[(1'h0):(1'h0)]}) != $unsigned(wire13[(3'h4):(1'h0)]))};
          if (reg19)
            begin
              reg23 <= wire14[(2'h3):(1'h0)];
            end
          else
            begin
              reg23 <= $unsigned(reg22[(4'hc):(2'h2)]);
              reg24 <= $unsigned(((8'hbd) > {wire12}));
              reg25 <= (+reg18[(4'hb):(2'h3)]);
              reg26 <= (wire14[(3'h4):(1'h0)] ?
                  ((reg15 ? reg20 : $unsigned({(8'ha0)})) ?
                      (reg15 ?
                          ((+wire14) ?
                              (wire13 & reg22) : $signed((8'haa))) : $unsigned(reg24[(3'h5):(1'h0)])) : $unsigned($signed((reg20 ?
                          (8'hbf) : reg15)))) : ({$signed(reg17[(2'h2):(2'h2)])} ?
                      $unsigned(($signed(reg25) | $unsigned(wire12))) : reg16));
            end
        end
      reg27 <= wire11[(4'hd):(4'hc)];
      reg28 <= (-(((~|$signed((7'h44))) ?
              reg16[(2'h2):(1'h1)] : reg18[(4'h8):(3'h5)]) ?
          $signed($signed($unsigned((7'h42)))) : reg27[(1'h0):(1'h0)]));
    end
  module29 #() modinst61 (.wire30(reg24), .wire31(wire12), .clk(clk), .wire33(reg25), .y(wire60), .wire34(reg20), .wire32(reg21));
  assign wire62 = wire12;
  assign wire63 = (~&((~&wire11) ? reg23[(3'h4):(2'h3)] : reg23));
  assign wire64 = (^~{(wire11[(3'h6):(1'h0)] ?
                          ((|reg22) <<< (&reg20)) : $signed($signed(wire11))),
                      $unsigned(reg21[(4'ha):(3'h4)])});
  assign wire65 = (8'ha1);
  module66 #() modinst84 (.y(wire83), .wire67(wire60), .wire68(reg22), .wire70(reg17), .wire71(reg23), .clk(clk), .wire69(reg15));
  assign wire85 = wire60;
  assign wire86 = ((reg26 ? wire14 : $unsigned(reg28)) ?
                      wire60 : {wire63[(4'h9):(4'h8)],
                          (reg16[(1'h0):(1'h0)] >> ($unsigned(reg27) != (wire85 ?
                              wire13 : wire14)))});
  assign wire87 = (reg19[(4'h8):(2'h3)] << $unsigned($signed((&(wire11 ^~ wire13)))));
  assign wire88 = (&$signed({$unsigned(wire12)}));
endmodule

module module66
#(parameter param82 = (-(&(^(~|{(8'hb5), (8'had)})))))
(y, clk, wire71, wire70, wire69, wire68, wire67);
  output wire [(32'h56):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire71;
  input wire [(2'h2):(1'h0)] wire70;
  input wire signed [(5'h10):(1'h0)] wire69;
  input wire signed [(3'h6):(1'h0)] wire68;
  input wire [(5'h15):(1'h0)] wire67;
  wire signed [(2'h3):(1'h0)] wire81;
  wire [(3'h4):(1'h0)] wire80;
  wire [(4'h9):(1'h0)] wire79;
  wire [(3'h7):(1'h0)] wire78;
  wire [(2'h2):(1'h0)] wire77;
  wire signed [(3'h7):(1'h0)] wire76;
  wire [(5'h13):(1'h0)] wire74;
  wire signed [(4'ha):(1'h0)] wire73;
  wire signed [(4'hb):(1'h0)] wire72;
  reg signed [(4'hd):(1'h0)] reg75 = (1'h0);
  assign y = {wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire74,
                 wire73,
                 wire72,
                 reg75,
                 (1'h0)};
  assign wire72 = {$unsigned((((wire69 << wire67) ?
                              (wire67 ? wire71 : wire71) : (wire68 + (8'ha9))) ?
                          $signed((~wire71)) : $signed((wire67 ?
                              (8'hb0) : wire70))))};
  assign wire73 = wire70[(2'h2):(1'h1)];
  assign wire74 = $unsigned(wire71[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg75 <= (~&wire73[(1'h1):(1'h1)]);
    end
  assign wire76 = (((wire74[(4'ha):(2'h3)] - $unsigned(((8'hae) <<< (8'h9c)))) ?
                      wire70[(1'h1):(1'h0)] : wire72[(4'ha):(2'h2)]) ~^ ((wire68[(1'h0):(1'h0)] & (wire68 <<< (8'haf))) + $signed(((^wire74) ^~ {(8'ha5)}))));
  assign wire77 = $signed($signed(($unsigned((wire73 ^ wire71)) ?
                      $unsigned($signed(wire71)) : (~&$signed(wire70)))));
  assign wire78 = ($unsigned(((~^wire71) ?
                      (wire68[(3'h5):(3'h5)] ?
                          (wire77 < wire68) : wire76) : wire70)) >> $signed((wire76[(3'h6):(3'h4)] >= {(^wire69)})));
  assign wire79 = ((wire68 <<< ($signed((wire73 ? (8'ha1) : wire68)) ?
                          ($unsigned(wire74) ^ (wire68 ?
                              wire71 : wire78)) : (wire68 ?
                              $signed(wire69) : (~wire74)))) ?
                      (8'h9e) : ((~^$signed({wire77})) ?
                          $unsigned((-(wire68 ?
                              wire78 : wire77))) : $signed(wire77)));
  assign wire80 = $unsigned(reg75);
  assign wire81 = (~wire72);
endmodule

module module29  (y, clk, wire34, wire33, wire32, wire31, wire30);
  output wire [(32'h11e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire34;
  input wire signed [(4'hb):(1'h0)] wire33;
  input wire [(3'h7):(1'h0)] wire32;
  input wire signed [(5'h10):(1'h0)] wire31;
  input wire [(4'ha):(1'h0)] wire30;
  wire signed [(3'h7):(1'h0)] wire59;
  wire [(4'hd):(1'h0)] wire58;
  wire [(4'h9):(1'h0)] wire41;
  wire [(4'hb):(1'h0)] wire40;
  wire [(3'h7):(1'h0)] wire39;
  wire signed [(4'hf):(1'h0)] wire38;
  wire signed [(3'h5):(1'h0)] wire37;
  wire [(3'h4):(1'h0)] wire36;
  wire signed [(5'h12):(1'h0)] wire35;
  reg signed [(3'h4):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg56 = (1'h0);
  reg [(3'h6):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg52 = (1'h0);
  reg [(4'h8):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg48 = (1'h0);
  reg [(5'h15):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg43 = (1'h0);
  reg [(4'h8):(1'h0)] reg42 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 (1'h0)};
  assign wire35 = wire34[(1'h1):(1'h0)];
  assign wire36 = $unsigned(wire35[(3'h4):(2'h3)]);
  assign wire37 = (8'hb3);
  assign wire38 = wire32;
  assign wire39 = {wire30,
                      $unsigned($unsigned(($signed(wire36) >= {wire32,
                          wire32})))};
  assign wire40 = (^{(^~wire31[(4'hc):(3'h5)]),
                      $signed($unsigned($unsigned((8'haa))))});
  assign wire41 = $unsigned({wire32[(2'h2):(1'h1)]});
  always
    @(posedge clk) begin
      if ((|(!(wire30 > ((wire39 ? wire41 : wire34) ~^ (wire38 ^ wire33))))))
        begin
          if ($unsigned($unsigned(({(wire31 && wire36),
              wire35[(2'h3):(1'h0)]} - {wire31[(4'hf):(2'h3)]}))))
            begin
              reg42 <= ((+$unsigned(($unsigned(wire33) ?
                  (wire39 | wire37) : wire33[(2'h3):(2'h2)]))) & wire35);
            end
          else
            begin
              reg42 <= $signed(wire33[(4'ha):(1'h1)]);
              reg43 <= wire38[(4'ha):(1'h1)];
            end
          reg44 <= wire37[(2'h3):(2'h3)];
        end
      else
        begin
          reg42 <= {$unsigned($signed(($signed((8'hb4)) <<< (reg43 ?
                  reg44 : wire32))))};
          if (((~|$unsigned({(-wire30), $signed(reg42)})) ?
              $signed(wire36) : $signed((8'hb4))))
            begin
              reg43 <= $signed($unsigned({$unsigned({reg44}),
                  {(wire36 ? wire39 : wire30), (wire34 ? reg44 : wire40)}}));
              reg44 <= ($signed(wire36[(1'h0):(1'h0)]) ?
                  $unsigned({$unsigned($unsigned(wire30)),
                      ((wire35 - wire33) == $unsigned(wire33))}) : wire31);
              reg45 <= (reg42[(3'h5):(2'h2)] ?
                  wire41 : $unsigned($unsigned(($signed(wire33) ?
                      (wire41 || wire35) : $signed(wire41)))));
              reg46 <= reg45[(3'h6):(3'h5)];
              reg47 <= $signed({({$unsigned(wire33)} ?
                      $unsigned($unsigned(wire40)) : (^(wire30 ?
                          wire34 : reg45))),
                  (+((wire32 ? wire37 : wire36) ?
                      $signed((8'ha6)) : (8'ha9)))});
            end
          else
            begin
              reg43 <= {wire34[(4'ha):(3'h5)], (&$unsigned($signed(wire33)))};
              reg44 <= (&$unsigned(wire34[(3'h6):(3'h5)]));
              reg45 <= wire39[(3'h5):(3'h5)];
            end
          reg48 <= (^~(-$signed((~&wire41[(3'h7):(3'h7)]))));
        end
      reg49 <= ((reg42 < ((reg47 ? (~^reg48) : (-wire35)) ?
              $unsigned(reg48) : wire35[(4'h9):(1'h0)])) ?
          wire34 : reg44);
      if (reg48[(1'h0):(1'h0)])
        begin
          if ((-$signed((~|(~&((8'hb4) ? reg46 : wire41))))))
            begin
              reg50 <= ((wire35 ?
                  (8'ha4) : (|$signed($signed(reg43)))) >= wire34);
              reg51 <= (8'hae);
              reg52 <= wire32[(3'h6):(1'h0)];
              reg53 <= wire32[(3'h4):(2'h2)];
            end
          else
            begin
              reg50 <= $unsigned(reg42);
              reg51 <= wire37;
              reg52 <= (((reg50 ?
                          {(wire33 ? reg46 : reg47),
                              (reg47 < wire30)} : $unsigned((~^reg51))) ?
                      ((8'h9e) ?
                          (wire35 ?
                              reg45 : wire37[(2'h2):(1'h0)]) : wire36[(1'h1):(1'h1)]) : wire34) ?
                  reg45 : (wire36[(2'h2):(1'h0)] ?
                      ($unsigned($signed(reg51)) ?
                          $unsigned(wire37[(1'h1):(1'h0)]) : {$signed(wire34),
                              $signed((8'hb6))}) : $unsigned($signed(reg46))));
            end
          reg54 <= $signed({(({(7'h40), (8'hb1)} ?
                      ((8'hb2) & (8'ha2)) : reg45[(4'he):(4'he)]) ?
                  ($signed(wire32) ?
                      $signed(wire36) : reg43[(2'h3):(2'h2)]) : ((reg43 >= (8'ha5)) ?
                      (+reg51) : $signed(reg53))),
              reg43[(4'hf):(3'h7)]});
          reg55 <= ((wire41 ?
                  $signed($unsigned((~wire31))) : $signed(((reg50 || reg47) >= wire31))) ?
              $unsigned(wire30[(4'h8):(4'h8)]) : $unsigned((((reg44 ?
                  wire30 : reg45) && (reg46 ?
                  wire32 : wire34)) && $unsigned($signed(wire32)))));
          reg56 <= $unsigned($signed(wire31));
          reg57 <= $signed({(7'h44)});
        end
      else
        begin
          if ($signed((~^$unsigned(((8'ha5) ? (~&reg53) : $unsigned(reg42))))))
            begin
              reg50 <= ((reg45 <= reg53) + reg42);
            end
          else
            begin
              reg50 <= {reg53,
                  $signed({((8'hb5) << wire32[(2'h2):(2'h2)]),
                      ($signed(wire32) == {wire41, reg44})})};
            end
          reg51 <= ($signed(((+$signed(reg43)) && $signed({(8'ha0)}))) ?
              reg53[(3'h7):(1'h0)] : wire40);
          reg52 <= (|((+((+(8'hae)) ?
                  (reg48 ? reg52 : reg53) : (reg56 || wire33))) ?
              wire33 : {(~|$unsigned(wire39))}));
          if (reg43[(3'h6):(1'h0)])
            begin
              reg53 <= (wire38[(2'h3):(1'h0)] && (((~&$unsigned(reg49)) <= reg50[(4'ha):(4'h8)]) < (^~(wire35 < (wire33 ?
                  reg54 : reg49)))));
              reg54 <= $unsigned($signed(reg44));
              reg55 <= reg46;
              reg56 <= wire41[(1'h0):(1'h0)];
              reg57 <= reg42;
            end
          else
            begin
              reg53 <= {((wire32 + {wire31, (reg42 >> wire33)}) & (8'hb8))};
            end
        end
    end
  assign wire58 = (wire36[(1'h1):(1'h0)] & (&reg48[(4'ha):(4'h8)]));
  assign wire59 = ($signed((~|wire58)) ?
                      (^$unsigned(wire38[(1'h0):(1'h0)])) : $unsigned(((+(wire30 ?
                              wire32 : wire38)) ?
                          $unsigned((reg54 >> wire33)) : $unsigned($signed((8'ha3))))));
endmodule
