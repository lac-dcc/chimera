module top
#(parameter param83 = ((((-((8'had) ? (7'h43) : (8'hb2))) ? {((7'h43) && (8'had))} : {((8'h9c) ? (7'h44) : (8'hb5)), {(8'hb1)}}) ? ((((7'h40) ? (8'ha0) : (7'h40)) ? (~(8'hba)) : (|(7'h41))) >>> (((8'ha2) <<< (8'hb7)) ? (^(8'ha2)) : ((8'ha9) ? (8'hb2) : (8'hb4)))) : {(~|(^(8'h9d)))}) ? {{((~(8'hbd)) && (~(8'hac)))}, ({((8'ha5) & (8'haf))} != {{(8'hbb), (8'ha3)}, {(7'h42), (8'ha2)}})} : (({(!(7'h43))} ? (-((7'h40) + (8'hb9))) : ((|(8'hac)) ? ((8'hac) ? (7'h40) : (8'h9c)) : ((8'hbf) ~^ (8'haa)))) ? (^{{(8'ha8)}, (!(8'ha9))}) : ((((8'hb6) & (8'hb2)) >> {(8'hbe), (8'hac)}) ? ((8'h9c) ? (^~(8'hab)) : ((8'h9c) < (8'ha8))) : {((8'ha6) <= (7'h40)), ((7'h40) ? (7'h43) : (8'ha6))}))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h7d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire82;
  wire [(2'h3):(1'h0)] wire80;
  wire [(5'h14):(1'h0)] wire11;
  wire signed [(4'h9):(1'h0)] wire10;
  wire [(5'h13):(1'h0)] wire9;
  wire [(5'h15):(1'h0)] wire8;
  wire [(4'hd):(1'h0)] wire7;
  wire [(3'h6):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire5;
  wire signed [(5'h11):(1'h0)] wire4;
  assign y = {wire82,
                 wire80,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 (1'h0)};
  assign wire4 = ((7'h42) ? wire2[(5'h15):(4'hc)] : (7'h40));
  assign wire5 = (~|(wire2 ?
                     (~&((^~wire2) <= wire4[(4'hf):(4'h8)])) : (($signed((7'h41)) ?
                             (wire0 ? wire2 : wire0) : (&wire2)) ?
                         wire2[(5'h12):(4'hb)] : $unsigned($signed(wire3)))));
  assign wire6 = wire1;
  assign wire7 = (wire4 << wire5[(1'h0):(1'h0)]);
  assign wire8 = $signed(wire5[(1'h1):(1'h0)]);
  assign wire9 = wire5[(1'h0):(1'h0)];
  assign wire10 = $signed(wire0[(5'h10):(1'h0)]);
  assign wire11 = {wire6[(1'h0):(1'h0)],
                      (^~($signed($unsigned(wire5)) ?
                          (wire4 ?
                              wire8[(5'h13):(3'h7)] : wire10[(4'h9):(3'h4)]) : ((&wire5) ?
                              (!wire9) : $signed(wire7))))};
  module12 #() modinst81 (.wire16(wire2), .y(wire80), .wire15(wire0), .clk(clk), .wire14(wire11), .wire13(wire9));
  assign wire82 = (~^(^~wire11[(4'hc):(1'h1)]));
endmodule

module module12
#(parameter param78 = {(+{(8'hb3)}), ({(+(~|(8'hb7))), {((7'h41) || (7'h42)), ((8'hbd) ? (8'ha9) : (8'hbc))}} ? ((((8'ha9) <<< (8'hb3)) ~^ (8'hbc)) ? (!((8'hbd) || (8'hbe))) : ((^(8'ha5)) ? ((8'ha0) ? (8'hbc) : (8'ha3)) : ((8'had) < (8'hb5)))) : (~|(8'ha0)))}, 
parameter param79 = (|(+(&(param78 ? {param78} : param78)))))
(y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'h29d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire16;
  input wire [(4'hd):(1'h0)] wire15;
  input wire signed [(5'h14):(1'h0)] wire14;
  input wire [(5'h11):(1'h0)] wire13;
  wire signed [(5'h15):(1'h0)] wire77;
  wire [(3'h6):(1'h0)] wire65;
  wire signed [(3'h5):(1'h0)] wire64;
  wire [(3'h6):(1'h0)] wire63;
  wire signed [(5'h14):(1'h0)] wire62;
  wire signed [(3'h4):(1'h0)] wire61;
  wire signed [(4'h9):(1'h0)] wire60;
  wire [(4'hb):(1'h0)] wire59;
  wire [(5'h13):(1'h0)] wire40;
  wire signed [(5'h11):(1'h0)] wire39;
  wire signed [(3'h5):(1'h0)] wire21;
  wire [(4'hb):(1'h0)] wire20;
  wire [(2'h3):(1'h0)] wire19;
  wire signed [(3'h5):(1'h0)] wire18;
  wire [(4'h8):(1'h0)] wire17;
  reg signed [(4'hc):(1'h0)] reg76 = (1'h0);
  reg [(3'h5):(1'h0)] reg75 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg73 = (1'h0);
  reg [(4'hb):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg71 = (1'h0);
  reg [(4'he):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg69 = (1'h0);
  reg [(5'h11):(1'h0)] reg68 = (1'h0);
  reg [(4'he):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg66 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg58 = (1'h0);
  reg [(5'h10):(1'h0)] reg57 = (1'h0);
  reg [(4'ha):(1'h0)] reg56 = (1'h0);
  reg [(3'h5):(1'h0)] reg55 = (1'h0);
  reg [(4'hd):(1'h0)] reg54 = (1'h0);
  reg [(3'h6):(1'h0)] reg53 = (1'h0);
  reg [(4'h9):(1'h0)] reg52 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg51 = (1'h0);
  reg [(5'h12):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg46 = (1'h0);
  reg [(5'h11):(1'h0)] reg45 = (1'h0);
  reg [(4'hd):(1'h0)] reg44 = (1'h0);
  reg [(2'h3):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg42 = (1'h0);
  reg [(3'h7):(1'h0)] reg41 = (1'h0);
  reg [(5'h12):(1'h0)] reg38 = (1'h0);
  reg [(3'h5):(1'h0)] reg37 = (1'h0);
  reg [(5'h15):(1'h0)] reg36 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg35 = (1'h0);
  reg [(3'h4):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg29 = (1'h0);
  reg [(5'h12):(1'h0)] reg28 = (1'h0);
  reg signed [(4'he):(1'h0)] reg27 = (1'h0);
  reg [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg25 = (1'h0);
  reg [(5'h14):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg23 = (1'h0);
  reg [(2'h3):(1'h0)] reg22 = (1'h0);
  assign y = {wire77,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire40,
                 wire39,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
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
                 reg43,
                 reg42,
                 reg41,
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
                 reg22,
                 (1'h0)};
  assign wire17 = wire16;
  assign wire18 = wire15;
  assign wire19 = wire13[(4'h8):(3'h4)];
  assign wire20 = (^{(wire19[(2'h3):(2'h3)] < {wire13[(4'h9):(2'h2)],
                          (wire19 ? wire19 : wire16)}),
                      (&(wire14[(2'h2):(1'h0)] << (wire16 ?
                          wire13 : wire15)))});
  assign wire21 = wire17;
  always
    @(posedge clk) begin
      reg22 <= ($signed(wire19) ? $signed($signed({wire20})) : wire18);
      reg23 <= (^(wire13 ?
          $unsigned($signed({reg22})) : {$signed((^(8'ha9))),
              (((7'h43) ? wire17 : (8'ha8)) ?
                  $unsigned((8'hb5)) : $unsigned(wire21))}));
      reg24 <= {wire18[(3'h4):(2'h3)]};
    end
  always
    @(posedge clk) begin
      reg25 <= $signed($signed(({(+reg22)} - reg22[(1'h0):(1'h0)])));
      if ($signed(wire15))
        begin
          reg26 <= (wire20 ?
              reg22[(1'h1):(1'h1)] : $signed($signed($unsigned((reg25 ?
                  wire13 : (7'h43))))));
        end
      else
        begin
          reg26 <= $signed($signed((8'hab)));
          reg27 <= ((wire14 * (!{(reg22 & wire18), reg25[(3'h7):(3'h5)]})) ?
              ((-(reg25 | (wire14 ~^ wire16))) || (^~((wire13 && (8'hb3)) - reg26[(3'h4):(1'h0)]))) : $signed((((wire21 ?
                  wire16 : wire17) >>> wire18) >>> (8'hbe))));
        end
      if ((~&$unsigned(($unsigned($signed((8'hb0))) ?
          $unsigned(wire13) : (~((8'ha3) ? wire20 : wire21))))))
        begin
          if (reg26[(1'h1):(1'h1)])
            begin
              reg28 <= ((reg25[(4'ha):(3'h4)] ?
                  $unsigned($unsigned((wire17 >>> wire13))) : (-((!wire15) ?
                      (reg26 ?
                          reg22 : wire13) : (wire18 << wire21)))) ^ $signed((-wire14[(3'h7):(3'h5)])));
              reg29 <= wire13[(4'hd):(4'h9)];
              reg30 <= $signed((wire19[(1'h1):(1'h0)] >= ($unsigned($signed((8'ha8))) >>> {$signed(reg26)})));
              reg31 <= reg27;
              reg32 <= $unsigned($signed(((wire13 ?
                  wire18 : (reg29 <= (8'hbf))) ^~ $signed({reg28, reg30}))));
            end
          else
            begin
              reg28 <= wire16;
              reg29 <= reg31[(3'h5):(2'h3)];
              reg30 <= ((8'ha3) | $unsigned($signed($signed($signed(wire13)))));
            end
          if (($signed(wire20) ^ reg23[(3'h6):(1'h0)]))
            begin
              reg33 <= wire20;
              reg34 <= (wire21[(2'h3):(2'h3)] ?
                  (&($signed(reg32[(4'he):(1'h1)]) ?
                      ((|wire17) ? (~^(8'hb3)) : (8'hbc)) : ((+wire13) ?
                          (~(8'ha9)) : reg22))) : $signed((+$signed(((7'h42) || wire13)))));
              reg35 <= $unsigned((reg31 ?
                  (reg30[(4'hd):(3'h7)] ^ reg25[(3'h4):(1'h1)]) : reg23[(4'ha):(1'h1)]));
            end
          else
            begin
              reg33 <= $signed($signed((-$signed($signed(wire19)))));
              reg34 <= wire18;
              reg35 <= ((+($signed({wire21}) ~^ (~(wire16 + reg22)))) ^~ $signed(reg31));
              reg36 <= {(&reg24),
                  ((wire19[(2'h3):(1'h0)] ?
                      reg22 : wire13[(3'h7):(1'h1)]) && $signed(reg22[(1'h0):(1'h0)]))};
            end
          reg37 <= {reg23[(2'h3):(1'h1)], $signed(reg25[(3'h6):(2'h3)])};
          reg38 <= reg23[(2'h2):(1'h0)];
        end
      else
        begin
          if ({reg37[(3'h4):(2'h2)],
              $unsigned($unsigned(wire17[(2'h3):(1'h0)]))})
            begin
              reg28 <= reg32[(4'h9):(1'h0)];
              reg29 <= (((-(reg38[(4'hb):(2'h3)] ?
                      (reg36 ~^ reg36) : (reg38 < reg33))) != reg38) ?
                  wire18 : ((reg26 <<< wire13) ?
                      wire19[(2'h3):(1'h0)] : reg28[(4'hb):(1'h0)]));
              reg30 <= wire14[(4'he):(4'ha)];
            end
          else
            begin
              reg28 <= $signed((8'hba));
            end
          reg31 <= ($signed((~&reg24)) ?
              (8'hb0) : $unsigned($unsigned(reg24[(4'ha):(2'h2)])));
        end
    end
  assign wire39 = $signed($signed(reg26[(2'h2):(1'h0)]));
  assign wire40 = {reg34[(1'h0):(1'h0)]};
  always
    @(posedge clk) begin
      if ((reg22 ? $signed((~^{(reg29 ? reg28 : reg27)})) : reg26))
        begin
          reg41 <= $signed($unsigned(($signed((!reg31)) ?
              $unsigned(wire40[(4'h9):(4'h9)]) : (-wire20[(4'ha):(4'ha)]))));
          reg42 <= reg23;
          reg43 <= $signed(reg29[(2'h3):(2'h3)]);
          if ($unsigned($unsigned((($unsigned(reg37) ?
                  reg38[(5'h10):(2'h2)] : reg29[(2'h3):(1'h0)]) ?
              (reg30[(4'hb):(1'h1)] ~^ (reg32 ?
                  wire18 : reg29)) : $signed($unsigned(reg30))))))
            begin
              reg44 <= (((^reg41[(1'h0):(1'h0)]) ?
                  reg29 : {((reg37 - reg37) == (-reg27))}) >= wire18[(3'h5):(2'h2)]);
            end
          else
            begin
              reg44 <= $unsigned($unsigned(({(reg41 ?
                      reg44 : wire19)} == $signed({wire20}))));
            end
        end
      else
        begin
          reg41 <= $unsigned($unsigned(($unsigned({wire17, reg36}) ?
              {wire13[(4'he):(4'ha)]} : (reg32[(4'ha):(2'h3)] ?
                  (&reg44) : reg32[(4'hb):(2'h2)]))));
        end
      reg45 <= (reg35[(4'h9):(1'h0)] == ($unsigned({$signed(reg30),
          (&reg26)}) >> reg31));
      reg46 <= (8'hbc);
      if (reg45[(3'h5):(3'h5)])
        begin
          reg47 <= reg29;
          reg48 <= reg22[(2'h3):(1'h0)];
          reg49 <= $unsigned(wire13);
          if ({$signed({(~|{reg46}), wire19})})
            begin
              reg50 <= wire21;
              reg51 <= reg33[(4'hc):(3'h7)];
              reg52 <= ({(((8'hb4) >>> $signed(reg41)) >> (^~(8'ha5))),
                      $unsigned(reg31)} ?
                  $unsigned((8'hae)) : (+$unsigned(reg49[(4'hc):(3'h5)])));
              reg53 <= (~(reg52 ?
                  (reg49 ?
                      (((8'hba) ^ wire15) ?
                          {wire19, wire20} : (-reg37)) : {(reg44 | reg42),
                          $signed(reg25)}) : reg50));
              reg54 <= $signed((reg23 <= ((-reg23) ?
                  (reg46[(4'h9):(1'h0)] && {reg51, reg31}) : $signed(((8'ha1) ?
                      reg30 : reg43)))));
            end
          else
            begin
              reg50 <= ((+$signed($unsigned((&wire20)))) > reg37[(3'h5):(3'h5)]);
              reg51 <= (~&$signed(wire13));
              reg52 <= {(~(~&reg49[(4'hf):(2'h3)])),
                  $unsigned({reg23, ((!wire13) + $unsigned((8'hb9)))})};
            end
          if ((wire13[(4'hf):(2'h2)] == $unsigned(reg29[(3'h5):(1'h0)])))
            begin
              reg55 <= (((7'h40) + reg54) ?
                  $signed($unsigned($unsigned(reg27[(4'h9):(1'h0)]))) : {(~&wire20[(3'h4):(2'h3)]),
                      $signed((wire20 <= (reg54 ? wire18 : reg46)))});
              reg56 <= ($signed(($signed((reg41 ? reg28 : wire39)) - (reg28 ?
                  $signed((8'hb5)) : $signed(reg54)))) < (reg38 ?
                  (-reg33[(4'hc):(1'h1)]) : $unsigned(reg37[(1'h1):(1'h1)])));
            end
          else
            begin
              reg55 <= $signed((&$unsigned(reg24[(5'h11):(4'he)])));
              reg56 <= (reg35 || reg43);
              reg57 <= {$unsigned(reg54[(2'h2):(1'h0)])};
              reg58 <= {$signed($signed(((~|(8'had)) >>> reg45)))};
            end
        end
      else
        begin
          reg47 <= (reg32[(4'h9):(2'h2)] + (8'hb9));
          if (wire40[(3'h5):(2'h2)])
            begin
              reg48 <= {$signed($signed(reg37[(3'h5):(1'h1)]))};
              reg49 <= ($signed(reg26) ~^ wire15);
              reg50 <= $unsigned($signed(((-wire16) - $signed(reg23[(3'h6):(1'h1)]))));
              reg51 <= reg26;
              reg52 <= ({(8'hbe)} | ($signed($signed(reg22[(2'h3):(1'h0)])) ?
                  (-(!(-reg28))) : $signed(reg43[(1'h0):(1'h0)])));
            end
          else
            begin
              reg48 <= (^(reg31[(1'h0):(1'h0)] - (wire15[(1'h1):(1'h0)] ?
                  ((~reg38) < {reg35}) : ($unsigned(reg55) || $unsigned(reg27)))));
              reg49 <= $unsigned((~|(reg36 ?
                  ((&reg34) && (+reg41)) : $signed($signed((8'ha7))))));
            end
          if ($unsigned(reg56[(2'h3):(2'h2)]))
            begin
              reg53 <= reg41[(3'h5):(2'h3)];
            end
          else
            begin
              reg53 <= (~(!$unsigned(((wire15 ? (8'hbf) : reg37) ?
                  (!reg41) : reg37[(3'h4):(2'h2)]))));
              reg54 <= $unsigned({(&((reg22 < reg43) ?
                      $signed(reg31) : (!reg52))),
                  (wire21 ? wire21[(3'h4):(1'h1)] : (^wire20[(1'h0):(1'h0)]))});
            end
        end
    end
  assign wire59 = $unsigned(reg51[(2'h3):(1'h1)]);
  assign wire60 = $signed(reg34[(2'h2):(1'h1)]);
  assign wire61 = $unsigned(((({reg55} >= (-reg44)) >> reg35[(2'h3):(1'h1)]) ?
                      reg36[(3'h7):(3'h6)] : (wire14 ?
                          reg48[(4'ha):(1'h1)] : $unsigned((7'h43)))));
  assign wire62 = wire19;
  assign wire63 = ((+reg30) ? wire14[(5'h12):(3'h6)] : $signed(reg46));
  assign wire64 = ($signed($signed((&$signed(reg33)))) ?
                      (-reg44[(2'h2):(1'h0)]) : ({((reg44 ? (7'h40) : wire60) ?
                              reg36[(3'h6):(2'h3)] : (^reg26))} != ($signed($unsigned(reg54)) ?
                          wire15 : wire14)));
  assign wire65 = {$unsigned($unsigned({wire20[(2'h3):(1'h1)]}))};
  always
    @(posedge clk) begin
      reg66 <= reg34[(1'h1):(1'h1)];
      reg67 <= (8'hb1);
      reg68 <= $unsigned((wire64[(2'h3):(1'h1)] < $signed(reg44)));
      reg69 <= ((8'h9f) ? reg54[(4'h9):(1'h0)] : reg43[(1'h0):(1'h0)]);
      if (($unsigned((^~{(wire65 ? wire19 : wire13)})) ?
          $signed($unsigned($signed(reg36[(3'h4):(3'h4)]))) : wire19))
        begin
          reg70 <= reg47[(3'h5):(3'h5)];
          if (reg30)
            begin
              reg71 <= reg34[(2'h2):(2'h2)];
              reg72 <= $signed(((~^(~&(wire15 == (8'ha9)))) & wire20[(4'ha):(3'h5)]));
              reg73 <= wire13[(3'h6):(1'h0)];
              reg74 <= (-$unsigned((wire14[(2'h2):(1'h1)] >> reg45[(3'h5):(3'h5)])));
              reg75 <= (~|(+$unsigned($unsigned((reg36 & wire59)))));
            end
          else
            begin
              reg71 <= {({$unsigned(reg56[(4'h8):(2'h2)]),
                          ($signed(reg52) & reg70)} ?
                      $signed(wire17[(2'h3):(2'h3)]) : wire20),
                  reg26};
              reg72 <= $signed(reg38[(5'h12):(4'ha)]);
            end
          reg76 <= wire13;
        end
      else
        begin
          reg70 <= $signed((~^$signed(reg25)));
          reg71 <= (reg24[(2'h2):(2'h2)] != $signed((-($signed(reg53) | {reg32}))));
        end
    end
  assign wire77 = ($unsigned(wire40) ?
                      {reg32,
                          {reg38, (reg54 ? reg67 : $unsigned(reg28))}} : reg50);
endmodule
