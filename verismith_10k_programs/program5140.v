module top
#(parameter param158 = ({(8'haa)} ? (((^~(^(8'ha7))) <= (((8'hab) && (8'ha6)) <<< {(8'hb5)})) ~^ (~^(8'hba))) : {((8'ha9) >>> (+{(7'h42)})), {(!((8'hb9) ? (7'h44) : (8'haa)))}}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h12e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire4;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire157;
  wire [(5'h15):(1'h0)] wire156;
  wire [(5'h12):(1'h0)] wire154;
  wire [(5'h12):(1'h0)] wire153;
  wire signed [(5'h15):(1'h0)] wire149;
  wire signed [(3'h7):(1'h0)] wire70;
  wire signed [(4'hc):(1'h0)] wire69;
  wire [(4'ha):(1'h0)] wire57;
  wire signed [(4'hc):(1'h0)] wire56;
  wire signed [(2'h2):(1'h0)] wire54;
  wire signed [(5'h10):(1'h0)] wire7;
  wire signed [(4'ha):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire5;
  wire signed [(3'h4):(1'h0)] wire151;
  reg [(4'hc):(1'h0)] reg58 = (1'h0);
  reg [(3'h7):(1'h0)] reg59 = (1'h0);
  reg [(5'h14):(1'h0)] reg60 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg62 = (1'h0);
  reg [(5'h13):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg64 = (1'h0);
  reg [(3'h5):(1'h0)] reg65 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg68 = (1'h0);
  assign y = {wire157,
                 wire156,
                 wire154,
                 wire153,
                 wire149,
                 wire70,
                 wire69,
                 wire57,
                 wire56,
                 wire54,
                 wire7,
                 wire6,
                 wire5,
                 wire151,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 reg68,
                 (1'h0)};
  assign wire5 = ((+{($unsigned(wire2) * $unsigned((7'h41)))}) ^~ $signed(((^~$unsigned(wire4)) ?
                     {$unsigned(wire1),
                         (wire0 && wire1)} : $unsigned($signed(wire4)))));
  assign wire6 = $signed((&(~&wire0[(5'h12):(5'h10)])));
  assign wire7 = $unsigned($unsigned((+wire3)));
  module8 #() modinst55 (wire54, clk, wire7, wire4, wire6, wire0);
  assign wire56 = $unsigned($signed((((wire4 < wire3) ~^ (wire54 <= wire3)) ?
                      (wire54 >= wire54[(1'h1):(1'h1)]) : $unsigned({wire6,
                          wire0}))));
  assign wire57 = $signed((~$signed(wire1)));
  always
    @(posedge clk) begin
      reg58 <= (8'haf);
      reg59 <= (wire1[(3'h5):(2'h3)] ? wire56 : wire56);
      if ((reg59 ?
          ({$unsigned(wire6[(1'h0):(1'h0)]),
              ($signed(wire2) >= {wire4,
                  wire3})} & $unsigned((^~wire6))) : ((($signed((7'h41)) ?
              (wire3 ?
                  wire1 : wire7) : (wire3 >= wire6)) & (!$unsigned(wire56))) | $signed((^(wire2 & reg59))))))
        begin
          if ((($unsigned({$signed(wire2), reg59[(3'h4):(1'h1)]}) ^ (7'h41)) ?
              $unsigned(wire54[(1'h1):(1'h0)]) : ((wire54[(1'h1):(1'h1)] ?
                  $unsigned($unsigned(wire54)) : reg58) >= (~$unsigned(wire6)))))
            begin
              reg60 <= wire3[(1'h1):(1'h0)];
              reg61 <= $signed($unsigned(wire56));
            end
          else
            begin
              reg60 <= (wire7 ? (!wire3[(1'h1):(1'h0)]) : (+wire7));
              reg61 <= (^~wire56);
              reg62 <= {$unsigned({reg58[(2'h3):(2'h2)], {(8'hb7)}})};
              reg63 <= {{($unsigned(reg62) ^~ ((wire4 ? reg58 : wire0) ?
                          (wire2 ? wire5 : wire54) : $unsigned(wire1))),
                      ($signed((wire1 < reg61)) ?
                          ((reg60 ^~ wire1) ?
                              (wire54 ?
                                  wire2 : wire54) : (&wire7)) : {$signed((8'hae))})},
                  $unsigned($unsigned($signed({(8'ha5), wire7})))};
            end
          reg64 <= $unsigned({(((^wire6) ?
                  $unsigned((8'hb0)) : (~&wire56)) << $signed((reg60 ?
                  wire3 : wire56))),
              $unsigned((8'hbd))});
          reg65 <= (wire4[(4'ha):(3'h5)] <= (^($signed($unsigned(reg58)) ?
              reg61 : ($unsigned(wire6) + wire57[(4'h8):(3'h5)]))));
        end
      else
        begin
          reg60 <= (~|reg59);
          reg61 <= reg65;
          reg62 <= ((wire54 == wire4) >= wire4[(1'h1):(1'h0)]);
          reg63 <= (reg64 ~^ {wire2[(4'h9):(2'h3)]});
          if (reg60[(2'h3):(1'h0)])
            begin
              reg64 <= (^~reg62[(3'h7):(3'h7)]);
            end
          else
            begin
              reg64 <= wire56[(1'h0):(1'h0)];
              reg65 <= wire54;
              reg66 <= $signed(((wire1 ? $signed(((7'h43) || wire2)) : reg58) ?
                  (^wire57) : reg65[(1'h0):(1'h0)]));
              reg67 <= $signed(wire2);
            end
        end
      reg68 <= wire3[(2'h3):(1'h1)];
    end
  assign wire69 = (&reg59[(3'h4):(3'h4)]);
  assign wire70 = (8'hb7);
  module71 #() modinst150 (wire149, clk, reg63, reg68, reg64, wire4, reg60);
  module32 #() modinst152 (.wire34(wire56), .wire35(wire57), .y(wire151), .wire33(reg60), .clk(clk), .wire36(wire4));
  assign wire153 = {((+wire151[(3'h4):(1'h0)]) >= $signed((~|reg68[(4'ha):(3'h4)])))};
  module32 #() modinst155 (wire154, clk, wire0, wire70, reg63, reg59);
  assign wire156 = wire5;
  assign wire157 = ((^~((~&(reg63 ?
                       reg59 : wire4)) <<< reg61[(3'h5):(3'h4)])) && $signed((wire4 ?
                       wire149[(5'h13):(4'hd)] : wire149)));
endmodule

module module71
#(parameter param148 = ((~|(((~&(8'h9d)) > (!(8'ha1))) < ((^(8'ha5)) + ((8'had) ~^ (8'hb3))))) ? (((((8'hb9) ^~ (8'hb0)) ? ((8'hbc) + (8'hba)) : (~(8'ha3))) < ((+(8'hb9)) ? (~&(8'ha1)) : ((8'ha6) != (8'had)))) ? ((((8'hbf) <<< (7'h42)) < (&(8'hb5))) & (((8'h9f) <<< (8'hb0)) != {(8'hac), (8'hb0)})) : {(&((8'hac) | (8'hbc)))}) : (((((8'hb7) ? (8'hba) : (8'hac)) > (8'hba)) | {((7'h44) && (8'h9d)), ((8'hb8) <<< (7'h44))}) ~^ ((((8'ha7) >> (7'h42)) ? ((8'hb6) ? (7'h40) : (8'hbc)) : (^~(8'ha3))) >>> (+(8'hbc))))))
(y, clk, wire72, wire73, wire74, wire75, wire76);
  output wire [(32'h40):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire72;
  input wire signed [(5'h11):(1'h0)] wire73;
  input wire signed [(5'h10):(1'h0)] wire74;
  input wire signed [(4'hf):(1'h0)] wire75;
  input wire [(5'h14):(1'h0)] wire76;
  wire [(2'h3):(1'h0)] wire147;
  wire [(4'hb):(1'h0)] wire146;
  wire [(5'h12):(1'h0)] wire145;
  wire [(5'h15):(1'h0)] wire113;
  wire [(3'h5):(1'h0)] wire115;
  wire [(3'h5):(1'h0)] wire143;
  assign y = {wire147, wire146, wire145, wire113, wire115, wire143, (1'h0)};
  module77 #() modinst114 (wire113, clk, wire73, wire74, wire75, wire76);
  assign wire115 = ($unsigned(wire113) ?
                       $signed($signed((^~(8'ha4)))) : $signed({wire74,
                           (~^$unsigned(wire72))}));
  module116 #() modinst144 (wire143, clk, wire72, wire76, wire113, wire74, wire73);
  assign wire145 = wire75;
  assign wire146 = (-(wire73[(1'h1):(1'h1)] + ($signed((+wire74)) ?
                       wire115 : (|wire113[(4'he):(4'ha)]))));
  assign wire147 = (&($unsigned($unsigned((wire73 <= wire143))) ^~ $signed(((^~(8'hb5)) || wire73))));
endmodule

module module8
#(parameter param53 = (((((+(7'h43)) < (~&(8'ha0))) ? (((8'had) < (8'ha4)) ? ((8'hb9) ? (7'h40) : (8'h9e)) : ((8'hbc) ? (8'hb8) : (8'ha4))) : {{(8'hb8), (8'hb2)}}) ? ((((8'h9e) ? (8'hb3) : (8'hb2)) ~^ ((8'hba) || (8'haf))) <= (8'ha9)) : ((!(|(8'hbd))) ? {((8'hb3) ? (8'haa) : (7'h42))} : (!(~^(7'h43))))) ? (^(^~{((8'hbf) + (7'h40)), ((8'h9f) || (8'hb2))})) : (~^(((8'hac) ? ((8'hac) | (8'hb6)) : ((8'hb7) ? (8'hbf) : (8'ha7))) ~^ (((8'hbd) > (8'hac)) * (~|(8'ha4)))))))
(y, clk, wire9, wire10, wire11, wire12);
  output wire [(32'hdc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire9;
  input wire [(4'hc):(1'h0)] wire10;
  input wire signed [(4'h9):(1'h0)] wire11;
  input wire signed [(4'h9):(1'h0)] wire12;
  wire [(5'h14):(1'h0)] wire13;
  wire [(3'h6):(1'h0)] wire14;
  wire signed [(5'h10):(1'h0)] wire15;
  wire signed [(3'h4):(1'h0)] wire26;
  wire [(5'h12):(1'h0)] wire27;
  wire [(4'hc):(1'h0)] wire28;
  wire [(5'h13):(1'h0)] wire29;
  wire [(4'hf):(1'h0)] wire30;
  wire [(2'h3):(1'h0)] wire31;
  wire signed [(3'h7):(1'h0)] wire51;
  reg [(3'h5):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg17 = (1'h0);
  reg [(4'hc):(1'h0)] reg18 = (1'h0);
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  reg [(4'hb):(1'h0)] reg20 = (1'h0);
  reg [(4'hc):(1'h0)] reg21 = (1'h0);
  reg [(3'h6):(1'h0)] reg22 = (1'h0);
  reg [(2'h3):(1'h0)] reg23 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg25 = (1'h0);
  assign y = {wire13,
                 wire14,
                 wire15,
                 wire26,
                 wire27,
                 wire28,
                 wire29,
                 wire30,
                 wire31,
                 wire51,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 (1'h0)};
  assign wire13 = $unsigned(({wire12[(3'h4):(1'h0)]} ?
                      (wire9[(4'hc):(3'h5)] ?
                          (wire10 ?
                              $signed(wire11) : $unsigned(wire9)) : $signed((!wire10))) : wire10[(3'h4):(1'h1)]));
  assign wire14 = wire10;
  assign wire15 = wire14;
  always
    @(posedge clk) begin
      reg16 <= (((^~wire11) >> wire10) ?
          $unsigned(wire11[(1'h0):(1'h0)]) : wire11);
      reg17 <= $unsigned(wire14);
      if ($signed($signed(wire12[(4'h8):(3'h5)])))
        begin
          if ($unsigned((wire12[(4'h9):(2'h3)] | wire15[(5'h10):(4'hf)])))
            begin
              reg18 <= wire12[(3'h6):(1'h0)];
              reg19 <= (~&(~^$signed(wire15)));
              reg20 <= $unsigned(($unsigned($unsigned((reg19 ?
                      reg16 : reg19))) ?
                  {(!(8'hbe)),
                      {(reg16 ? wire13 : wire13), (^reg16)}} : (8'h9c)));
            end
          else
            begin
              reg18 <= (((reg18[(4'hb):(4'hb)] << ((&reg16) ?
                  (reg18 & reg20) : (reg17 <= reg16))) && (({(7'h43), wire14} ?
                      wire12[(3'h4):(2'h2)] : wire12[(4'h9):(3'h7)]) ?
                  (wire11[(3'h6):(1'h1)] ?
                      wire15 : $unsigned(wire12)) : (reg17 * ((7'h43) ?
                      (8'ha7) : (8'haa))))) != reg19);
            end
          reg21 <= {wire9};
          reg22 <= (~&(!wire9));
          if (wire12[(1'h1):(1'h1)])
            begin
              reg23 <= ((($signed(((8'hbb) ?
                          wire14 : (8'ha8))) != $unsigned(wire15[(4'he):(3'h7)])) ?
                      wire10 : reg21) ?
                  (+$unsigned(wire9[(4'h8):(1'h0)])) : (reg17[(3'h6):(2'h2)] >> wire9[(3'h6):(1'h1)]));
            end
          else
            begin
              reg23 <= wire10;
              reg24 <= $unsigned((-($unsigned(reg22[(3'h5):(3'h4)]) & $signed((!(8'ha8))))));
              reg25 <= wire14;
            end
        end
      else
        begin
          reg18 <= $signed((~wire10[(3'h4):(1'h1)]));
          reg19 <= (reg21 ^~ $unsigned({$unsigned($signed(reg17)),
              $unsigned({(8'hae)})}));
          reg20 <= (($signed(({(8'ha8)} & reg23[(2'h3):(2'h2)])) >= ($signed($signed(reg25)) ?
              reg23[(1'h1):(1'h0)] : (^~wire13[(3'h6):(3'h6)]))) < {{$unsigned($signed(reg19))},
              $signed({reg25[(3'h6):(1'h0)], (~|wire13)})});
        end
    end
  assign wire26 = $unsigned($unsigned((~&$signed((8'hbf)))));
  assign wire27 = wire15[(2'h3):(1'h0)];
  assign wire28 = ({(~$unsigned($signed((8'haa)))),
                          $unsigned($signed(wire26[(2'h2):(2'h2)]))} ?
                      $signed(((-(wire26 ? reg20 : reg19)) ?
                          reg19[(2'h3):(1'h0)] : {reg17})) : $unsigned({{{wire13,
                                  wire15}}}));
  assign wire29 = (8'hab);
  assign wire30 = (wire27[(4'he):(1'h0)] >> $unsigned(wire15));
  assign wire31 = ({(8'hb0)} ?
                      ($unsigned($signed(reg19[(4'hc):(4'h9)])) ?
                          reg18 : (((-(7'h43)) ^ $signed(reg17)) ?
                              (~^$signed(wire12)) : wire15)) : {$unsigned((-(reg17 <<< reg22)))});
  module32 #() modinst52 (wire51, clk, wire11, wire27, reg19, wire15);
endmodule

module module32
#(parameter param49 = (({(((8'h9d) + (8'hba)) ? ((8'ha0) ? (8'hb1) : (8'hbb)) : (^(8'ha3))), {(~^(8'had))}} < (((~&(8'ha4)) ? ((8'hb8) ? (8'ha2) : (8'hb5)) : {(8'had)}) <<< (((8'hbb) ? (8'hac) : (8'hbc)) ? ((8'hb7) - (8'ha3)) : ((8'hba) || (8'hae))))) ? {({(~(8'haa))} ? (|((7'h44) ? (8'h9f) : (8'hb7))) : ((~(8'hb1)) && {(7'h44), (8'hba)}))} : ((((^(7'h43)) ? (-(8'hac)) : (&(8'hb8))) * (((8'hb1) ? (8'haa) : (8'hbf)) ? ((8'had) ? (8'hba) : (8'ha0)) : ((8'ha3) * (8'h9d)))) ? {({(7'h42)} || {(8'ha5)})} : (!((~&(8'hb3)) ? {(8'ha9)} : (8'hae))))), 
parameter param50 = (|param49))
(y, clk, wire36, wire35, wire34, wire33);
  output wire [(32'h84):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire36;
  input wire [(3'h5):(1'h0)] wire35;
  input wire signed [(4'hc):(1'h0)] wire34;
  input wire signed [(3'h4):(1'h0)] wire33;
  wire [(4'h8):(1'h0)] wire41;
  wire [(2'h2):(1'h0)] wire40;
  wire signed [(5'h14):(1'h0)] wire39;
  wire signed [(4'he):(1'h0)] wire38;
  wire [(5'h14):(1'h0)] wire37;
  reg signed [(4'hd):(1'h0)] reg48 = (1'h0);
  reg [(4'h9):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg44 = (1'h0);
  reg [(4'hd):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg42 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 (1'h0)};
  assign wire37 = wire33[(1'h0):(1'h0)];
  assign wire38 = ({(((wire37 * wire33) == (-(8'hb3))) >>> (+wire37[(3'h4):(2'h2)]))} ?
                      wire34 : wire35[(2'h3):(2'h2)]);
  assign wire39 = ($signed({wire33[(2'h2):(1'h0)]}) + $unsigned((wire36 ?
                      ({wire37} <<< (wire35 == wire35)) : wire38)));
  assign wire40 = {wire39};
  assign wire41 = $unsigned($signed(wire39[(3'h4):(2'h3)]));
  always
    @(posedge clk) begin
      reg42 <= (^(wire37[(1'h0):(1'h0)] ?
          ($signed(wire39[(4'he):(2'h3)]) ~^ {(wire33 ^ wire35),
              wire33}) : ((~|$signed(wire37)) ?
              ($unsigned(wire36) <<< ((8'haf) << wire34)) : ((wire40 & wire33) ?
                  $unsigned(wire34) : (8'h9d)))));
      reg43 <= ((reg42 ?
              wire39 : ((-(wire37 & wire40)) ?
                  ((^~wire37) >>> wire40[(1'h0):(1'h0)]) : ((wire37 ?
                          wire39 : (8'ha3)) ?
                      $signed((7'h42)) : wire39[(1'h0):(1'h0)]))) ?
          wire38[(1'h0):(1'h0)] : ((((8'ha4) ?
                  ((7'h44) ? wire38 : wire34) : (wire38 ? reg42 : wire41)) ?
              $unsigned(wire40[(1'h1):(1'h1)]) : $signed((wire34 + (8'haa)))) == ((wire34[(3'h5):(2'h3)] < wire34[(4'hb):(1'h1)]) ?
              $unsigned((+wire35)) : (~^reg42[(1'h1):(1'h0)]))));
      if ((~$unsigned(($signed(wire41) > reg43))))
        begin
          reg44 <= ((8'h9c) ^ wire37);
          reg45 <= (({((wire41 && wire36) ? (~^(8'hb4)) : $signed(wire41))} ?
                  (&(-$unsigned(wire36))) : $unsigned($signed((~&wire36)))) ?
              $signed(wire37[(5'h13):(4'ha)]) : (+(^wire34)));
          reg46 <= {$unsigned({reg43,
                  ((reg42 < reg44) ? $signed(reg43) : (-wire41))}),
              $unsigned($unsigned(($signed((7'h41)) | wire35[(2'h2):(2'h2)])))};
          reg47 <= wire33[(2'h3):(1'h1)];
        end
      else
        begin
          reg44 <= reg47;
          reg45 <= (-(^$unsigned(wire35[(2'h2):(2'h2)])));
        end
      reg48 <= (wire34 ? reg44[(4'he):(4'hb)] : reg43[(4'hd):(1'h0)]);
    end
endmodule

module module116  (y, clk, wire121, wire120, wire119, wire118, wire117);
  output wire [(32'hef):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire121;
  input wire [(5'h14):(1'h0)] wire120;
  input wire signed [(5'h15):(1'h0)] wire119;
  input wire [(3'h5):(1'h0)] wire118;
  input wire signed [(5'h11):(1'h0)] wire117;
  wire signed [(4'h9):(1'h0)] wire142;
  wire [(4'he):(1'h0)] wire141;
  wire signed [(3'h6):(1'h0)] wire140;
  wire [(4'h8):(1'h0)] wire139;
  wire signed [(4'he):(1'h0)] wire138;
  wire [(4'hc):(1'h0)] wire137;
  wire [(3'h5):(1'h0)] wire134;
  wire [(5'h15):(1'h0)] wire133;
  wire [(5'h13):(1'h0)] wire132;
  wire signed [(4'h9):(1'h0)] wire131;
  wire [(4'hc):(1'h0)] wire124;
  wire [(3'h7):(1'h0)] wire123;
  wire signed [(4'he):(1'h0)] wire122;
  reg [(5'h14):(1'h0)] reg136 = (1'h0);
  reg [(4'h9):(1'h0)] reg135 = (1'h0);
  reg [(3'h6):(1'h0)] reg130 = (1'h0);
  reg [(4'hb):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg128 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg127 = (1'h0);
  reg [(2'h3):(1'h0)] reg126 = (1'h0);
  reg [(4'he):(1'h0)] reg125 = (1'h0);
  assign y = {wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire137,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire124,
                 wire123,
                 wire122,
                 reg136,
                 reg135,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 (1'h0)};
  assign wire122 = (wire120 ?
                       wire118[(3'h5):(3'h4)] : {{({wire117} <= {wire117,
                                   (8'hbe)})}});
  assign wire123 = ($signed($unsigned(($signed((8'h9f)) & (-wire120)))) & $unsigned((&((wire118 ?
                       wire121 : wire120) - (wire119 != wire121)))));
  assign wire124 = (+wire117[(4'h9):(1'h0)]);
  always
    @(posedge clk) begin
      reg125 <= $unsigned(($unsigned($unsigned($signed(wire118))) > wire123[(3'h6):(3'h6)]));
      if ({(((wire117 ? {reg125} : (-wire124)) ?
                  (wire123[(3'h7):(1'h1)] ?
                      $signed(wire121) : wire124[(2'h3):(1'h1)]) : $signed((wire118 <<< wire121))) ?
              wire121 : (&(wire121 - {wire122}))),
          $unsigned((wire117 >>> (wire118[(1'h0):(1'h0)] ?
              $signed((8'hb0)) : (7'h43))))})
        begin
          reg126 <= wire119[(3'h4):(1'h0)];
          reg127 <= ((^~$signed($signed($unsigned(wire117)))) && (+(({wire121} ?
                  (wire123 >>> wire121) : (reg126 ? reg125 : wire120)) ?
              wire120[(3'h7):(2'h2)] : (~^{reg125, wire123}))));
          reg128 <= ($unsigned({($signed((8'hb6)) >= reg125),
              wire123[(3'h7):(1'h0)]}) && {{$signed($signed(reg126)),
                  $signed(wire117)},
              ((!$unsigned((8'h9c))) ?
                  (wire121[(1'h0):(1'h0)] < (wire123 >>> wire119)) : wire122)});
          reg129 <= wire123[(1'h0):(1'h0)];
        end
      else
        begin
          reg126 <= (^~wire121[(1'h1):(1'h1)]);
          reg127 <= {{wire123}};
          reg128 <= wire118[(3'h4):(1'h0)];
          reg129 <= wire119;
        end
      reg130 <= ((~&reg128) ?
          (^~((-$signed((8'haf))) <<< ((wire118 >> wire119) ?
              reg129[(4'h9):(3'h7)] : (reg129 ? wire124 : reg127)))) : wire124);
    end
  assign wire131 = wire123;
  assign wire132 = reg129[(1'h0):(1'h0)];
  assign wire133 = $unsigned(reg129[(4'h9):(4'h8)]);
  assign wire134 = wire133;
  always
    @(posedge clk) begin
      reg135 <= wire119[(4'hf):(4'h9)];
      reg136 <= (8'ha9);
    end
  assign wire137 = ((wire119 ?
                       (((wire132 ~^ wire119) ?
                               $unsigned(wire118) : (~&reg125)) ?
                           wire121 : reg130[(3'h4):(3'h4)]) : $signed((~|$signed((8'hbf))))) + (($unsigned(wire121[(1'h1):(1'h0)]) ?
                           $signed($unsigned(wire122)) : ((wire117 ?
                               wire123 : wire133) || $unsigned(wire133))) ?
                       (wire131 == {wire121[(4'ha):(2'h3)],
                           $signed(wire133)}) : ((~&reg126[(1'h1):(1'h1)]) * reg129)));
  assign wire138 = (($signed(((-wire120) ?
                           $unsigned(wire131) : wire133)) < (((~wire118) && (reg127 ?
                           wire121 : wire118)) == reg128)) ?
                       wire119 : wire137[(3'h5):(3'h5)]);
  assign wire139 = {($unsigned((((8'had) - wire124) ?
                               reg135[(3'h5):(2'h2)] : $unsigned(reg126))) ?
                           reg130[(2'h3):(1'h1)] : (((reg125 ?
                                   reg130 : wire120) == (&wire133)) ?
                               wire117 : (!$signed(wire132)))),
                       reg135};
  assign wire140 = (-wire119);
  assign wire141 = (~(~|(~&(+((8'ha5) ? reg129 : wire134)))));
  assign wire142 = reg125[(4'ha):(4'h8)];
endmodule

module module77  (y, clk, wire81, wire80, wire79, wire78);
  output wire [(32'h185):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire81;
  input wire [(4'h9):(1'h0)] wire80;
  input wire [(4'hc):(1'h0)] wire79;
  input wire signed [(4'hc):(1'h0)] wire78;
  wire signed [(5'h11):(1'h0)] wire112;
  wire [(5'h11):(1'h0)] wire111;
  wire signed [(3'h5):(1'h0)] wire110;
  wire signed [(4'h9):(1'h0)] wire109;
  wire [(4'he):(1'h0)] wire108;
  wire signed [(2'h3):(1'h0)] wire107;
  wire [(5'h10):(1'h0)] wire104;
  wire [(4'hc):(1'h0)] wire103;
  wire signed [(5'h15):(1'h0)] wire102;
  wire [(5'h13):(1'h0)] wire101;
  wire [(3'h4):(1'h0)] wire100;
  wire [(5'h14):(1'h0)] wire99;
  wire [(5'h12):(1'h0)] wire88;
  wire signed [(5'h14):(1'h0)] wire87;
  wire signed [(4'hb):(1'h0)] wire86;
  wire [(5'h10):(1'h0)] wire85;
  wire [(5'h11):(1'h0)] wire84;
  wire [(4'hd):(1'h0)] wire83;
  wire [(4'hf):(1'h0)] wire82;
  reg [(2'h2):(1'h0)] reg106 = (1'h0);
  reg [(5'h13):(1'h0)] reg105 = (1'h0);
  reg [(4'hd):(1'h0)] reg98 = (1'h0);
  reg [(3'h6):(1'h0)] reg97 = (1'h0);
  reg [(4'h8):(1'h0)] reg96 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg94 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg93 = (1'h0);
  reg [(3'h7):(1'h0)] reg92 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg91 = (1'h0);
  reg signed [(4'he):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg89 = (1'h0);
  assign y = {wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 reg106,
                 reg105,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 (1'h0)};
  assign wire82 = wire78;
  assign wire83 = ((+(~&($signed(wire81) != (wire80 ^~ wire81)))) ^ {(^~(wire82 & (wire79 ?
                          (8'haf) : wire78))),
                      wire81[(3'h6):(3'h4)]});
  assign wire84 = $unsigned({{{((8'haf) ? wire78 : wire82)}}});
  assign wire85 = ((~&wire80[(1'h0):(1'h0)]) >> wire82);
  assign wire86 = wire83;
  assign wire87 = wire79[(4'hc):(4'hb)];
  assign wire88 = (~|$signed((~^($unsigned((8'h9e)) <= (-wire79)))));
  always
    @(posedge clk) begin
      reg89 <= wire81[(3'h6):(1'h1)];
      reg90 <= (!(wire85[(3'h4):(1'h0)] ? wire79 : wire81[(4'h9):(3'h6)]));
      if ($signed($signed(reg89)))
        begin
          reg91 <= wire87;
          reg92 <= $signed({($unsigned($signed(wire87)) <<< $signed((reg90 ?
                  wire85 : wire82))),
              $unsigned(wire84)});
          reg93 <= wire78;
          if ($unsigned({$unsigned((+(|(8'h9d)))),
              (^~({(7'h42), wire80} ? reg90 : $unsigned(wire88)))}))
            begin
              reg94 <= $unsigned(((&(7'h42)) ?
                  (~^($signed((8'ha8)) ?
                      (+wire80) : $unsigned(wire81))) : $unsigned($signed((!wire80)))));
              reg95 <= (~|$signed((wire84[(3'h4):(2'h2)] ?
                  (~^$signed(wire83)) : (+{(8'hbe)}))));
              reg96 <= wire85[(3'h7):(3'h6)];
            end
          else
            begin
              reg94 <= ((+reg94) ?
                  wire81[(4'h8):(1'h0)] : $unsigned(reg91[(3'h6):(3'h6)]));
              reg95 <= ((^~{(!$unsigned(wire80))}) <<< {$signed(reg93[(3'h7):(2'h3)]),
                  $signed(((reg91 ? wire86 : wire79) ?
                      $signed(reg95) : (reg91 | (7'h40))))});
              reg96 <= $signed($signed((reg89 ?
                  ({wire80} ?
                      reg93 : ((7'h40) >> reg93)) : $signed($signed(wire79)))));
              reg97 <= (^~wire86[(1'h0):(1'h0)]);
            end
          reg98 <= $signed(((((wire79 | wire80) ?
                      reg93 : wire85[(3'h5):(2'h2)]) ?
                  (reg93[(3'h4):(2'h3)] ?
                      (^~wire78) : wire78[(4'ha):(4'ha)]) : $unsigned((reg96 ^ wire84))) ?
              $unsigned((8'hb3)) : reg93));
        end
      else
        begin
          if (wire83[(1'h0):(1'h0)])
            begin
              reg91 <= wire86;
              reg92 <= ((wire84[(4'h8):(1'h1)] < ($unsigned($unsigned((8'h9d))) ?
                      wire84[(2'h2):(1'h1)] : wire82[(3'h5):(2'h3)])) ?
                  $signed($unsigned((reg98[(3'h6):(1'h0)] ?
                      (reg91 ^ wire87) : {(8'hb3),
                          (8'hb0)}))) : $unsigned((((|reg91) ?
                          (reg94 ? wire82 : reg97) : $signed(reg96)) ?
                      (+$signed(reg98)) : wire85[(4'hb):(3'h4)])));
              reg93 <= wire80;
              reg94 <= reg95;
            end
          else
            begin
              reg91 <= wire82[(4'h9):(3'h6)];
              reg92 <= $unsigned({wire85, $unsigned(wire87[(4'h9):(4'h8)])});
            end
          reg95 <= (8'ha2);
          reg96 <= {$signed((((~^wire88) ?
                  $signed(wire88) : (wire78 ? reg91 : wire80)) <= ((reg94 ?
                  reg97 : wire88) || $unsigned(reg98)))),
              reg98};
        end
    end
  assign wire99 = (8'hb9);
  assign wire100 = ({$unsigned(($signed(reg89) >= (+wire88))),
                       (wire78[(4'h8):(1'h1)] != (reg92[(1'h0):(1'h0)] ?
                           $signed(wire78) : $signed(reg89)))} && $unsigned({(~(wire85 ?
                           reg89 : wire84))}));
  assign wire101 = (~&$unsigned($unsigned($unsigned($unsigned(wire84)))));
  assign wire102 = ($signed({(&wire78[(4'hc):(1'h1)]),
                       $signed($unsigned(wire81))}) ^~ wire86);
  assign wire103 = $signed($signed(reg93[(3'h4):(1'h0)]));
  assign wire104 = wire88;
  always
    @(posedge clk) begin
      reg105 <= wire84[(5'h10):(4'h9)];
      reg106 <= reg98[(1'h0):(1'h0)];
    end
  assign wire107 = (7'h40);
  assign wire108 = $unsigned($signed({reg92[(3'h6):(3'h5)],
                       $unsigned(wire103)}));
  assign wire109 = reg97[(3'h5):(3'h4)];
  assign wire110 = wire82;
  assign wire111 = wire110;
  assign wire112 = ($unsigned($signed($unsigned(reg97[(2'h2):(2'h2)]))) ?
                       ((~|(wire79[(3'h4):(1'h0)] - wire83[(4'hc):(3'h6)])) ~^ wire82[(3'h4):(1'h0)]) : $signed((~|(^$signed((8'hb5))))));
endmodule
