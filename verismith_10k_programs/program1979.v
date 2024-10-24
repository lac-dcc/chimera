module top
#(parameter param87 = (({(((8'ha9) ? (8'hab) : (7'h41)) ^ ((8'hb7) == (7'h41)))} * ((8'hae) < ({(8'ha6)} ? ((8'hb8) & (8'ha2)) : (^~(8'ha1))))) * ((^(~|((8'h9c) ? (8'hba) : (8'hb0)))) << (8'hb0))), 
parameter param88 = (((8'hb0) ? ((-(8'ha5)) != {param87}) : (7'h43)) == (((!(|param87)) ? ((^param87) >>> ((8'ha2) ? param87 : (8'ha3))) : (-param87)) ? ((param87 ? (param87 ~^ param87) : param87) ? ((param87 ? param87 : param87) < ((8'hbf) != (8'h9c))) : param87) : (!param87))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h79):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire86;
  wire [(4'hd):(1'h0)] wire84;
  wire [(5'h11):(1'h0)] wire10;
  wire signed [(3'h6):(1'h0)] wire9;
  wire signed [(5'h13):(1'h0)] wire8;
  wire [(4'h8):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  wire [(2'h3):(1'h0)] wire4;
  assign y = {wire86,
                 wire84,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 (1'h0)};
  assign wire4 = $signed(wire3[(1'h1):(1'h1)]);
  assign wire5 = (^wire3[(4'h8):(3'h7)]);
  assign wire6 = (~&(~((wire0[(3'h4):(2'h2)] << (^wire2)) | (+wire3))));
  assign wire7 = $signed($unsigned($signed(($signed(wire6) ?
                     $signed(wire2) : (wire5 ? wire5 : wire0)))));
  assign wire8 = (wire3[(2'h2):(2'h2)] ?
                     wire2[(1'h1):(1'h1)] : {wire4[(1'h0):(1'h0)]});
  assign wire9 = ({((8'ha2) << wire2),
                         $unsigned((wire3[(1'h0):(1'h0)] && (!wire3)))} ?
                     (^~$unsigned(((wire5 ?
                         (8'hbe) : (8'ha5)) && wire6))) : (~|wire0[(2'h3):(2'h2)]));
  assign wire10 = {wire3[(3'h4):(1'h1)],
                      (&(wire7[(3'h6):(1'h1)] & $unsigned(((7'h43) < wire6))))};
  module11 #() modinst85 (wire84, clk, wire3, wire2, wire5, wire10);
  assign wire86 = $unsigned(wire6[(4'h8):(3'h5)]);
endmodule

module module11  (y, clk, wire12, wire13, wire14, wire15);
  output wire [(32'h67):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire12;
  input wire signed [(5'h13):(1'h0)] wire13;
  input wire [(5'h13):(1'h0)] wire14;
  input wire signed [(4'hc):(1'h0)] wire15;
  wire signed [(5'h10):(1'h0)] wire83;
  wire signed [(5'h15):(1'h0)] wire82;
  wire [(4'he):(1'h0)] wire81;
  wire [(2'h3):(1'h0)] wire61;
  wire signed [(4'h8):(1'h0)] wire63;
  wire signed [(5'h11):(1'h0)] wire64;
  wire [(3'h6):(1'h0)] wire65;
  wire [(5'h11):(1'h0)] wire79;
  assign y = {wire83,
                 wire82,
                 wire81,
                 wire61,
                 wire63,
                 wire64,
                 wire65,
                 wire79,
                 (1'h0)};
  module16 #() modinst62 (.y(wire61), .wire20(wire15), .wire17(wire12), .wire19(wire13), .wire18(wire14), .clk(clk));
  assign wire63 = (($unsigned(wire14[(4'hb):(3'h6)]) >> $signed(wire14)) << (({wire13} >= wire12[(3'h7):(3'h4)]) && $unsigned(wire12[(5'h13):(4'hc)])));
  assign wire64 = wire63;
  assign wire65 = wire13[(4'hb):(4'h8)];
  module66 #() modinst80 (.wire67(wire64), .wire68(wire12), .wire69(wire63), .y(wire79), .clk(clk), .wire71(wire15), .wire70(wire14));
  assign wire81 = wire65[(3'h4):(2'h3)];
  assign wire82 = ($signed(wire61) ? wire13[(4'ha):(3'h5)] : wire13);
  assign wire83 = wire13[(4'hc):(4'h8)];
endmodule

module module66  (y, clk, wire71, wire70, wire69, wire68, wire67);
  output wire [(32'h5a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire71;
  input wire signed [(5'h10):(1'h0)] wire70;
  input wire signed [(4'h8):(1'h0)] wire69;
  input wire [(4'ha):(1'h0)] wire68;
  input wire [(4'hf):(1'h0)] wire67;
  wire signed [(5'h12):(1'h0)] wire76;
  wire signed [(4'h8):(1'h0)] wire75;
  wire signed [(4'ha):(1'h0)] wire74;
  wire [(5'h15):(1'h0)] wire73;
  wire signed [(5'h11):(1'h0)] wire72;
  reg signed [(4'hd):(1'h0)] reg78 = (1'h0);
  reg [(2'h2):(1'h0)] reg77 = (1'h0);
  assign y = {wire76, wire75, wire74, wire73, wire72, reg78, reg77, (1'h0)};
  assign wire72 = $unsigned((((-$unsigned(wire70)) ?
                          (wire70[(4'h9):(1'h0)] ?
                              $unsigned(wire71) : $signed(wire67)) : (^~$signed(wire68))) ?
                      (($unsigned(wire67) ? $unsigned(wire71) : (~|wire67)) ?
                          ($signed((8'h9e)) || {wire70}) : wire68[(2'h2):(1'h0)]) : (wire69 ?
                          ((-wire70) ?
                              $unsigned(wire67) : $unsigned(wire67)) : wire67[(4'hd):(2'h2)])));
  assign wire73 = $unsigned(((~|$unsigned((~^wire72))) != {(8'ha4)}));
  assign wire74 = (wire69 ?
                      ((~|wire70[(3'h5):(2'h2)]) ?
                          $signed(((~&wire72) ?
                              $signed(wire67) : (wire68 ?
                                  wire73 : wire73))) : wire68[(3'h5):(3'h5)]) : ($unsigned(wire70) ?
                          wire67[(3'h6):(1'h0)] : ({{(8'haa), wire68},
                              $signed(wire70)} + ($unsigned(wire73) - $signed(wire69)))));
  assign wire75 = wire73;
  assign wire76 = (($unsigned(wire72) ?
                          $unsigned(wire69[(3'h7):(2'h3)]) : $unsigned((wire73[(4'hb):(3'h7)] && $unsigned((8'hba))))) ?
                      ($signed(($signed((8'ha4)) > (~|(8'hbc)))) ?
                          (|wire73[(1'h0):(1'h0)]) : (wire71 ?
                              $signed((8'hb9)) : ((~|(8'hae)) <<< (wire74 ~^ wire73)))) : $signed(($unsigned(wire73[(4'hd):(4'hb)]) ?
                          $signed($unsigned(wire71)) : wire73[(5'h13):(3'h4)])));
  always
    @(posedge clk) begin
      reg77 <= (~^{$unsigned(wire72[(3'h5):(2'h3)])});
      reg78 <= $unsigned($unsigned($unsigned((wire71 <<< reg77[(2'h2):(1'h0)]))));
    end
endmodule

module module16
#(parameter param60 = {({(((8'hb6) + (8'hb4)) == ((8'hbb) ? (8'had) : (8'hac)))} + {(((8'haa) ^~ (8'hb7)) ? ((8'hb2) ? (8'hbf) : (7'h44)) : ((8'hb8) < (8'ha3))), (-{(8'ha7)})})})
(y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h1b8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire20;
  input wire [(5'h13):(1'h0)] wire19;
  input wire [(5'h10):(1'h0)] wire18;
  input wire [(5'h15):(1'h0)] wire17;
  wire [(5'h10):(1'h0)] wire59;
  wire signed [(4'hc):(1'h0)] wire43;
  wire [(5'h13):(1'h0)] wire42;
  wire [(5'h11):(1'h0)] wire36;
  wire signed [(4'he):(1'h0)] wire35;
  wire signed [(3'h6):(1'h0)] wire34;
  wire [(5'h15):(1'h0)] wire33;
  wire [(4'hc):(1'h0)] wire32;
  wire [(4'hd):(1'h0)] wire26;
  wire [(3'h5):(1'h0)] wire25;
  wire signed [(3'h6):(1'h0)] wire24;
  wire [(3'h4):(1'h0)] wire23;
  wire signed [(3'h6):(1'h0)] wire21;
  reg [(3'h5):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg57 = (1'h0);
  reg [(5'h11):(1'h0)] reg56 = (1'h0);
  reg [(5'h10):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg54 = (1'h0);
  reg [(5'h13):(1'h0)] reg53 = (1'h0);
  reg signed [(4'he):(1'h0)] reg52 = (1'h0);
  reg [(5'h14):(1'h0)] reg51 = (1'h0);
  reg [(4'he):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg48 = (1'h0);
  reg [(5'h10):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg46 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg44 = (1'h0);
  reg [(3'h7):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg39 = (1'h0);
  reg [(3'h7):(1'h0)] reg38 = (1'h0);
  reg [(5'h13):(1'h0)] reg37 = (1'h0);
  reg [(4'h9):(1'h0)] reg31 = (1'h0);
  reg [(4'h9):(1'h0)] reg30 = (1'h0);
  reg [(2'h3):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg28 = (1'h0);
  reg [(2'h2):(1'h0)] reg27 = (1'h0);
  reg [(2'h3):(1'h0)] reg22 = (1'h0);
  assign y = {wire59,
                 wire43,
                 wire42,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire21,
                 reg58,
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
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg22,
                 (1'h0)};
  assign wire21 = (~|{((wire18[(4'h8):(4'h8)] ?
                              (wire19 ~^ wire19) : (wire17 >>> wire19)) ?
                          $signed(wire19[(1'h0):(1'h0)]) : wire18),
                      $unsigned($signed((wire18 <<< wire18)))});
  always
    @(posedge clk) begin
      reg22 <= wire21[(1'h0):(1'h0)];
    end
  assign wire23 = ((8'hab) ?
                      wire19[(2'h2):(1'h0)] : {wire18[(3'h5):(3'h4)],
                          ((8'hbf) ?
                              wire18[(3'h4):(3'h4)] : wire17[(2'h3):(1'h1)])});
  assign wire24 = (~$signed(reg22[(1'h0):(1'h0)]));
  assign wire25 = ((~|(~|{$unsigned((8'hb5))})) ?
                      (8'had) : (((~$signed(wire17)) && (~^(&(8'hbd)))) ?
                          wire19[(3'h5):(3'h4)] : ((reg22 ^ ((8'ha6) ?
                              wire24 : wire20)) < wire24)));
  assign wire26 = {(8'ha1)};
  always
    @(posedge clk) begin
      reg27 <= wire18;
      reg28 <= $unsigned(reg22);
      reg29 <= wire20;
      reg30 <= (wire25[(3'h5):(1'h1)] && ((&(-((8'hb5) & wire26))) && $signed($unsigned(wire25))));
      reg31 <= (wire23[(2'h2):(2'h2)] <<< $signed($signed($unsigned(wire25))));
    end
  assign wire32 = $signed(((reg28 >> reg27[(2'h2):(2'h2)]) >>> ($signed(wire17) ?
                      reg28 : $signed((^~(8'hbc))))));
  assign wire33 = (-(reg22[(2'h3):(1'h0)] && $signed((8'h9d))));
  assign wire34 = (wire32[(4'hb):(1'h1)] - wire32[(2'h3):(2'h3)]);
  assign wire35 = {$unsigned($unsigned($signed((~reg22)))), (^~wire23)};
  assign wire36 = {wire18, reg30[(1'h1):(1'h0)]};
  always
    @(posedge clk) begin
      reg37 <= $signed($signed($signed(reg27[(2'h2):(1'h0)])));
      reg38 <= ($unsigned((~|$signed((reg28 ^~ wire23)))) - $unsigned(($unsigned(wire33) >= wire32)));
      reg39 <= reg22;
      reg40 <= reg38[(2'h3):(2'h3)];
      reg41 <= (($unsigned(reg30[(3'h6):(2'h3)]) ?
          $unsigned($signed($signed(wire32))) : $signed(($signed((8'hb9)) ?
              (wire36 ?
                  wire26 : wire24) : $unsigned(wire35)))) && $unsigned((reg30[(3'h5):(3'h4)] ?
          wire33 : ((wire32 >> wire34) ? $signed(reg39) : (&(8'hbf))))));
    end
  assign wire42 = wire24[(1'h1):(1'h0)];
  assign wire43 = ($unsigned(wire18[(4'he):(1'h0)]) <= {(^$signed(wire18[(3'h7):(3'h6)]))});
  always
    @(posedge clk) begin
      reg44 <= (~&wire21);
      if ($unsigned((wire26[(1'h1):(1'h0)] != reg39)))
        begin
          if ($unsigned({$unsigned((&$unsigned(reg38))),
              {{$unsigned(wire42)}, wire20}}))
            begin
              reg45 <= wire36;
              reg46 <= (reg37 ?
                  (((^~{wire36}) ?
                      $signed($signed(wire25)) : {(wire20 * wire23),
                          {wire25}}) - ($signed((reg38 <= (8'haa))) ?
                      (((8'haa) ?
                          reg28 : reg38) ^ (-wire26)) : wire33)) : (&$signed(((reg27 ?
                      reg40 : (8'hb8)) | (~|wire19)))));
              reg47 <= $signed(wire36);
              reg48 <= (reg38[(1'h0):(1'h0)] << reg31[(3'h5):(3'h4)]);
              reg49 <= {$unsigned((8'ha4))};
            end
          else
            begin
              reg45 <= reg37[(3'h6):(2'h3)];
              reg46 <= $unsigned(reg41[(3'h5):(2'h2)]);
              reg47 <= (~&$signed(wire32));
              reg48 <= $signed(reg40[(4'hb):(4'h8)]);
            end
          reg50 <= (~|$unsigned((8'hb3)));
          reg51 <= ({wire32[(3'h4):(2'h3)], (~&$signed((+wire42)))} ?
              wire25[(1'h0):(1'h0)] : wire43);
          reg52 <= $unsigned(((|$signed({wire18,
              reg38})) * (reg38[(3'h4):(2'h3)] ?
              ({wire33} != wire25) : wire20[(2'h3):(1'h0)])));
          if ((($signed((reg27[(1'h1):(1'h0)] ? (^wire17) : $signed(reg48))) ?
                  {{$signed(wire36), $unsigned(reg47)},
                      $signed((wire23 >> (8'had)))} : wire24) ?
              ((~^(-((7'h42) << reg47))) * ($unsigned((reg50 + wire25)) ?
                  (8'ha4) : {(reg44 ? wire33 : reg30),
                      $signed(wire43)})) : (^$unsigned(reg41[(3'h5):(3'h5)]))))
            begin
              reg53 <= (|$signed($unsigned(($signed((8'ha6)) << wire23))));
              reg54 <= $signed($signed(wire23[(3'h4):(1'h1)]));
              reg55 <= ((reg29 ?
                  $signed(wire26[(2'h2):(1'h0)]) : {reg40[(4'h9):(1'h0)],
                      ($unsigned(wire18) ?
                          (reg49 ?
                              wire26 : reg28) : reg22[(1'h1):(1'h0)])}) || (wire43 ?
                  reg50[(1'h1):(1'h0)] : wire35));
              reg56 <= ($unsigned(reg38[(3'h6):(2'h3)]) ?
                  (~|({reg28[(3'h5):(3'h4)]} ?
                      ((wire20 >> reg31) ?
                          wire35[(4'h8):(4'h8)] : (-wire26)) : {$signed(wire26),
                          wire17[(1'h0):(1'h0)]})) : wire32);
              reg57 <= $signed(reg27[(2'h2):(1'h1)]);
            end
          else
            begin
              reg53 <= reg28[(3'h5):(3'h4)];
              reg54 <= $signed(wire17);
              reg55 <= reg27[(1'h0):(1'h0)];
              reg56 <= reg41[(1'h0):(1'h0)];
              reg57 <= (8'h9d);
            end
        end
      else
        begin
          reg45 <= wire43;
          reg46 <= reg55;
          reg47 <= $signed($unsigned({(~|(reg57 ? reg22 : reg48))}));
          if (($signed($unsigned(reg41)) ~^ $unsigned({{reg55}})))
            begin
              reg48 <= reg56[(4'he):(4'hd)];
              reg49 <= (-($signed($signed({reg55, wire18})) <<< reg41));
              reg50 <= {reg27[(1'h0):(1'h0)]};
              reg51 <= reg55;
              reg52 <= (^($signed((&(reg50 && reg38))) ?
                  (~&(+(~wire36))) : (&(~&(reg40 ? reg39 : reg28)))));
            end
          else
            begin
              reg48 <= reg47[(4'hf):(2'h3)];
              reg49 <= $signed((+$signed($signed(wire36))));
              reg50 <= ({$signed({$signed(wire32)}), $signed(reg52)} ?
                  $unsigned((((+reg54) == $signed(wire18)) ?
                      (|(reg39 && (7'h44))) : $unsigned((wire33 ?
                          reg47 : reg28)))) : wire34[(3'h5):(1'h1)]);
            end
          reg53 <= wire21;
        end
      reg58 <= $signed(wire33);
    end
  assign wire59 = wire21;
endmodule
