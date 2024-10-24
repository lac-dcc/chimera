module top
#(parameter param79 = (^(((((8'hab) > (8'ha2)) ? {(8'h9d), (8'hb4)} : ((7'h42) ? (8'hb3) : (8'hb3))) ? (!((8'h9e) ? (8'ha2) : (8'hbd))) : (8'ha2)) ? ((-(8'hbb)) ? (((7'h44) ? (8'h9d) : (8'ha5)) + (^(8'ha3))) : (((8'ha5) ? (8'ha7) : (8'ha5)) ? {(7'h42), (8'haa)} : ((7'h40) & (8'hb2)))) : (~&(8'hb7)))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h72):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire0;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire4;
  wire signed [(5'h13):(1'h0)] wire77;
  wire signed [(5'h11):(1'h0)] wire63;
  wire [(5'h14):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire8;
  wire signed [(3'h7):(1'h0)] wire61;
  assign y = {wire77, wire63, wire5, wire6, wire7, wire8, wire61, (1'h0)};
  assign wire5 = {{wire1},
                     $signed($unsigned(((wire1 & (8'haa)) && (wire1 < wire0))))};
  assign wire6 = $signed(wire5[(2'h3):(1'h0)]);
  assign wire7 = $unsigned(((~&(^$signed(wire4))) ?
                     $unsigned(((wire2 ? wire2 : wire6) ?
                         $unsigned((8'hb3)) : (8'hbc))) : {(&wire4[(3'h7):(3'h5)]),
                         (-(!wire4))}));
  assign wire8 = (^($unsigned(((wire1 <= wire2) ?
                         wire7[(1'h0):(1'h0)] : (wire5 ? wire6 : wire5))) ?
                     wire5[(3'h5):(1'h0)] : ((~|(wire1 || wire5)) >>> (wire6[(3'h4):(2'h2)] | wire5[(5'h12):(3'h6)]))));
  module9 #() modinst62 (.wire14(wire3), .wire13(wire0), .wire12(wire6), .wire11(wire7), .wire10(wire4), .clk(clk), .y(wire61));
  assign wire63 = (~&$unsigned($signed(((wire1 > (8'hb4)) ?
                      (+(8'h9e)) : (wire6 != (8'h9f))))));
  module64 #() modinst78 (.wire66(wire63), .wire68(wire8), .wire65(wire1), .wire67(wire2), .clk(clk), .y(wire77));
endmodule

module module64
#(parameter param76 = ((|(~|((~&(7'h40)) >>> (8'h9c)))) + (~((((8'ha9) ? (8'hb2) : (8'hae)) ? ((8'ha2) + (8'hab)) : (8'hb9)) ? ({(8'ha6)} ? ((8'hba) ? (8'ha6) : (8'hbf)) : (&(8'ha7))) : (|(8'hbb))))))
(y, clk, wire68, wire67, wire66, wire65);
  output wire [(32'h54):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire68;
  input wire signed [(4'hb):(1'h0)] wire67;
  input wire [(2'h3):(1'h0)] wire66;
  input wire [(4'ha):(1'h0)] wire65;
  wire [(3'h6):(1'h0)] wire75;
  wire [(5'h12):(1'h0)] wire74;
  wire [(4'hc):(1'h0)] wire73;
  wire signed [(3'h4):(1'h0)] wire72;
  wire [(5'h11):(1'h0)] wire71;
  wire [(4'hf):(1'h0)] wire70;
  wire signed [(4'hb):(1'h0)] wire69;
  assign y = {wire75, wire74, wire73, wire72, wire71, wire70, wire69, (1'h0)};
  assign wire69 = (~&(+wire67[(4'hb):(2'h3)]));
  assign wire70 = $unsigned($signed(($signed((wire67 ? (8'hb8) : wire65)) ?
                      $signed($unsigned(wire67)) : (8'ha4))));
  assign wire71 = $unsigned(wire70[(3'h4):(3'h4)]);
  assign wire72 = (wire69[(1'h0):(1'h0)] ?
                      ((wire65 ?
                              {$signed((8'hb3)),
                                  $unsigned(wire65)} : {$unsigned(wire67),
                                  $signed((8'hba))}) ?
                          (8'hbb) : wire71) : (($unsigned(((8'h9f) >= wire65)) || $unsigned((~&wire68))) ?
                          $signed(wire70[(4'hd):(1'h1)]) : $unsigned(({wire70} < (wire65 ?
                              wire71 : (8'ha5))))));
  assign wire73 = wire71;
  assign wire74 = ({$signed((~^wire69)),
                      ($signed($unsigned(wire66)) <<< (^~(wire69 != wire66)))} >> wire67);
  assign wire75 = $signed(((&$unsigned(wire67[(3'h7):(3'h6)])) & (wire71[(4'hc):(3'h7)] ?
                      ((+wire65) || ((8'hac) ? wire68 : wire71)) : ((~&wire72) ?
                          (wire69 ? wire73 : wire66) : (wire72 || wire70)))));
endmodule

module module9
#(parameter param60 = ((((|((8'haf) ? (8'hb6) : (8'hb1))) ^ ((^~(8'hac)) != ((8'ha2) && (8'hbd)))) ? (7'h43) : ((((8'had) & (7'h41)) ? {(8'ha1), (8'hba)} : ((8'ha9) | (8'haa))) ~^ (~|(8'ha2)))) ? ((+{(~|(8'h9d))}) ? (!(!((8'hae) && (8'hbc)))) : {((8'hb2) > {(7'h43), (8'haf)})}) : (+((-((8'h9e) ? (8'h9c) : (8'ha8))) ? (7'h44) : (((8'hbd) ? (8'h9c) : (8'hac)) ^~ ((8'hba) && (8'haa)))))))
(y, clk, wire14, wire13, wire12, wire11, wire10);
  output wire [(32'h25):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire14;
  input wire signed [(4'hd):(1'h0)] wire13;
  input wire [(4'hf):(1'h0)] wire12;
  input wire signed [(5'h11):(1'h0)] wire11;
  input wire [(5'h11):(1'h0)] wire10;
  wire [(4'h8):(1'h0)] wire59;
  wire signed [(4'hd):(1'h0)] wire58;
  wire signed [(4'hb):(1'h0)] wire57;
  wire signed [(3'h4):(1'h0)] wire55;
  assign y = {wire59, wire58, wire57, wire55, (1'h0)};
  module15 #() modinst56 (wire55, clk, wire10, wire12, wire14, wire13);
  assign wire57 = ((^~($unsigned(wire55[(1'h0):(1'h0)]) ?
                          (^~(8'hb8)) : ((wire10 == wire13) ?
                              (!wire13) : $signed(wire14)))) ?
                      $unsigned($signed(($signed(wire14) <<< {wire11}))) : {{($signed(wire11) ?
                                  wire14[(3'h6):(3'h6)] : (wire14 != wire11))}});
  assign wire58 = wire14[(1'h0):(1'h0)];
  assign wire59 = $signed(wire12[(4'he):(3'h5)]);
endmodule

module module15
#(parameter param53 = ({(-(^(8'hbb))), {({(8'ha2), (8'hac)} * (+(8'hac)))}} - (|(&{((8'hb1) ? (8'hb3) : (8'hac))}))), 
parameter param54 = param53)
(y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'h164):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire19;
  input wire [(4'hf):(1'h0)] wire18;
  input wire [(3'h6):(1'h0)] wire17;
  input wire [(3'h7):(1'h0)] wire16;
  wire [(5'h12):(1'h0)] wire52;
  wire [(2'h2):(1'h0)] wire48;
  wire [(4'h8):(1'h0)] wire47;
  wire [(4'ha):(1'h0)] wire46;
  wire [(5'h12):(1'h0)] wire45;
  wire signed [(4'he):(1'h0)] wire44;
  wire signed [(3'h6):(1'h0)] wire43;
  wire signed [(2'h3):(1'h0)] wire42;
  wire [(4'hc):(1'h0)] wire41;
  wire [(3'h7):(1'h0)] wire40;
  wire [(2'h2):(1'h0)] wire22;
  wire [(4'hf):(1'h0)] wire21;
  wire [(3'h5):(1'h0)] wire20;
  reg [(2'h2):(1'h0)] reg51 = (1'h0);
  reg [(5'h10):(1'h0)] reg50 = (1'h0);
  reg [(5'h12):(1'h0)] reg49 = (1'h0);
  reg [(4'h9):(1'h0)] reg39 = (1'h0);
  reg [(5'h11):(1'h0)] reg38 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg32 = (1'h0);
  reg [(5'h15):(1'h0)] reg31 = (1'h0);
  reg [(5'h12):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg29 = (1'h0);
  reg [(4'h9):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg26 = (1'h0);
  reg [(4'hc):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg23 = (1'h0);
  assign y = {wire52,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire22,
                 wire21,
                 wire20,
                 reg51,
                 reg50,
                 reg49,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 (1'h0)};
  assign wire20 = ($unsigned(($unsigned($unsigned(wire18)) || wire16[(1'h0):(1'h0)])) > (7'h42));
  assign wire21 = $unsigned(wire16[(3'h5):(1'h1)]);
  assign wire22 = $signed($unsigned((wire16 < ((wire19 ^~ wire20) & $signed(wire18)))));
  always
    @(posedge clk) begin
      if ($signed(wire21))
        begin
          reg23 <= wire22[(2'h2):(2'h2)];
          reg24 <= wire19[(3'h6):(3'h5)];
          reg25 <= wire20;
          reg26 <= $signed((&wire20));
        end
      else
        begin
          reg23 <= wire21[(3'h7):(2'h2)];
          reg24 <= ($unsigned({(|wire19[(3'h6):(2'h3)])}) ?
              (~|((|$unsigned(wire22)) >> (~^$signed((8'hbb))))) : ((!wire17[(3'h4):(2'h2)]) ?
                  $signed($unsigned((^wire22))) : wire19[(4'hc):(4'h8)]));
        end
      reg27 <= wire16[(3'h7):(2'h2)];
      if ($unsigned((wire16 && $unsigned((~|{reg26, wire16})))))
        begin
          reg28 <= reg26[(3'h7):(2'h2)];
          reg29 <= $signed(reg27);
          reg30 <= ((^(wire22 ?
              {(|wire20),
                  reg28[(3'h6):(3'h5)]} : reg29[(3'h5):(3'h4)])) >>> $unsigned((!wire20[(3'h5):(3'h5)])));
          reg31 <= $signed($signed($signed($signed($signed(reg26)))));
          if ($unsigned(wire21[(1'h0):(1'h0)]))
            begin
              reg32 <= wire19;
              reg33 <= reg32;
              reg34 <= (|(~&wire20));
              reg35 <= wire19[(4'h9):(1'h1)];
            end
          else
            begin
              reg32 <= reg29[(1'h1):(1'h0)];
              reg33 <= {$unsigned(reg34)};
              reg34 <= (^~(($signed(((8'h9c) ? reg30 : reg35)) ?
                  wire16[(3'h4):(2'h3)] : (~|reg29)) + reg26));
              reg35 <= {(|(|((reg29 >= reg27) == (&wire19))))};
            end
        end
      else
        begin
          reg28 <= wire20;
          reg29 <= wire17;
          reg30 <= (reg26[(3'h5):(3'h5)] ?
              (($signed($signed((8'had))) >>> reg29[(3'h4):(1'h1)]) ?
                  wire19 : ($unsigned((wire21 ? reg29 : (8'hb0))) ?
                      $unsigned((wire18 == reg28)) : wire22)) : wire16);
          reg31 <= $unsigned({({$unsigned(reg23), $unsigned(wire20)} ?
                  ($signed(reg27) ?
                      {(8'h9e)} : $unsigned(reg32)) : (~$unsigned((8'hbc)))),
              wire16});
          reg32 <= (((~^reg23[(2'h3):(1'h0)]) ?
                  ($unsigned({wire20}) ?
                      $unsigned((reg26 & reg31)) : reg32) : ({(wire22 | wire17),
                      (reg31 ?
                          wire20 : (8'ha2))} >>> {wire21[(4'hf):(3'h5)]})) ?
              ((wire19[(1'h0):(1'h0)] ?
                  $signed({wire16,
                      (7'h44)}) : reg33) & $unsigned(((reg29 >>> reg28) ?
                  $unsigned(wire17) : ((8'ha9) || reg34)))) : (reg32[(4'h9):(4'h8)] >>> $unsigned((reg25 ?
                  (wire16 | reg28) : {wire20}))));
        end
      reg36 <= wire16;
    end
  always
    @(posedge clk) begin
      reg37 <= ((($unsigned({reg33, wire18}) ?
              $signed((reg32 ? reg28 : wire17)) : reg32) > reg35) ?
          (&reg23) : (~$signed($signed((^reg24)))));
      reg38 <= (^$unsigned((+((reg34 ? reg24 : wire19) ?
          (reg32 > reg27) : (!wire20)))));
      reg39 <= (reg30[(4'ha):(2'h3)] ?
          $unsigned((~&($unsigned(reg34) ?
              (^~reg35) : wire19[(3'h5):(2'h2)]))) : reg29);
    end
  assign wire40 = $unsigned((^(reg24 ?
                      $unsigned(((8'ha8) == wire19)) : ((reg31 ?
                          (8'hab) : reg35) << reg25))));
  assign wire41 = (7'h40);
  assign wire42 = reg23;
  assign wire43 = wire42[(2'h3):(1'h0)];
  assign wire44 = (($unsigned((reg33[(1'h0):(1'h0)] & $signed(reg24))) ?
                          {$signed(reg38[(4'hc):(4'ha)])} : reg28) ?
                      $unsigned($unsigned(($unsigned(wire17) ?
                          $unsigned(reg24) : {reg23}))) : (wire21[(4'hf):(3'h5)] ?
                          (reg28 ?
                              wire40[(2'h2):(1'h0)] : {reg33[(2'h2):(1'h1)],
                                  (~(8'h9c))}) : (wire43 ?
                              (!wire16[(1'h0):(1'h0)]) : (&(-wire43)))));
  assign wire45 = $signed((8'hab));
  assign wire46 = $signed($signed({{(wire43 ? wire42 : reg25),
                          (reg29 <= reg23)}}));
  assign wire47 = (reg36[(2'h3):(2'h3)] ?
                      ((reg30 & wire42) ?
                          ($unsigned((wire44 ~^ wire20)) ?
                              reg35 : wire17) : $signed(reg32[(3'h4):(1'h1)])) : ($unsigned(wire18[(4'hb):(4'hb)]) - ((~&$signed(reg24)) || {(~|wire22),
                          (wire18 & reg26)})));
  assign wire48 = ($signed((~&$unsigned(reg28[(1'h1):(1'h0)]))) + (~|reg32));
  always
    @(posedge clk) begin
      reg49 <= $signed((reg29[(3'h6):(3'h5)] ~^ ($signed($unsigned(wire19)) ?
          wire44[(3'h7):(3'h7)] : (~reg29[(4'h8):(3'h5)]))));
      reg50 <= (~|((wire21[(3'h5):(2'h3)] > (((8'haa) >= wire48) < wire40)) ?
          (&(-$signed(wire22))) : (((reg27 >> reg39) <= {(8'haf), wire44}) ?
              ($unsigned(reg38) ~^ (-wire48)) : ($unsigned(wire18) - (8'ha7)))));
      reg51 <= (reg27 ?
          (8'hba) : (((wire17 ? {wire44} : wire18) ?
              (wire16 ?
                  (reg28 ?
                      wire19 : reg50) : (reg31 ^~ reg23)) : wire17) >= (+$signed($signed(reg35)))));
    end
  assign wire52 = {(~(~|(^(~&reg33)))),
                      (^$unsigned(($signed(reg30) ?
                          wire17[(3'h4):(1'h1)] : $unsigned((8'ha0)))))};
endmodule
