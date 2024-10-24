module top
#(parameter param85 = ((!{(~^((8'hab) ? (8'ha8) : (8'hac))), {((8'h9f) >= (8'hb2)), (+(8'hbf))}}) >= (&((^~((8'hb6) == (8'hbb))) >= (((8'ha2) ^ (8'ha7)) ? (!(8'hb8)) : ((8'ha8) ? (7'h43) : (8'ha1)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1b7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire0;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire4;
  wire [(4'hd):(1'h0)] wire84;
  wire [(5'h14):(1'h0)] wire83;
  wire signed [(5'h14):(1'h0)] wire82;
  wire [(3'h4):(1'h0)] wire68;
  wire signed [(4'hb):(1'h0)] wire65;
  wire [(3'h5):(1'h0)] wire64;
  wire [(3'h4):(1'h0)] wire63;
  wire signed [(2'h3):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire7;
  wire signed [(2'h3):(1'h0)] wire8;
  wire [(2'h3):(1'h0)] wire11;
  wire signed [(2'h3):(1'h0)] wire12;
  wire signed [(2'h3):(1'h0)] wire13;
  wire [(4'hc):(1'h0)] wire21;
  wire signed [(4'he):(1'h0)] wire61;
  reg signed [(5'h13):(1'h0)] reg81 = (1'h0);
  reg signed [(4'he):(1'h0)] reg80 = (1'h0);
  reg [(4'h8):(1'h0)] reg79 = (1'h0);
  reg [(5'h13):(1'h0)] reg78 = (1'h0);
  reg [(5'h14):(1'h0)] reg77 = (1'h0);
  reg [(5'h15):(1'h0)] reg76 = (1'h0);
  reg [(5'h15):(1'h0)] reg75 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg74 = (1'h0);
  reg [(3'h7):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg72 = (1'h0);
  reg [(3'h6):(1'h0)] reg71 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg70 = (1'h0);
  reg [(4'h9):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg67 = (1'h0);
  reg [(5'h12):(1'h0)] reg66 = (1'h0);
  reg [(2'h3):(1'h0)] reg20 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg19 = (1'h0);
  reg [(2'h2):(1'h0)] reg18 = (1'h0);
  reg [(2'h3):(1'h0)] reg17 = (1'h0);
  reg [(5'h14):(1'h0)] reg16 = (1'h0);
  reg [(3'h5):(1'h0)] reg15 = (1'h0);
  reg signed [(4'he):(1'h0)] reg14 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg9 = (1'h0);
  assign y = {wire84,
                 wire83,
                 wire82,
                 wire68,
                 wire65,
                 wire64,
                 wire63,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire11,
                 wire12,
                 wire13,
                 wire21,
                 wire61,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg67,
                 reg66,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire5 = ($unsigned(wire1[(4'ha):(4'ha)]) >>> $unsigned((|wire0[(3'h6):(1'h1)])));
  assign wire6 = wire1;
  assign wire7 = $signed((-((8'ha5) ?
                     $unsigned((!wire5)) : wire1[(4'h9):(3'h4)])));
  assign wire8 = (($signed(($unsigned(wire0) ?
                         (wire7 && wire6) : (wire1 ? wire1 : wire1))) ?
                     wire1 : $signed((-(|(8'hb5))))) >>> ((~|(^~wire3[(3'h4):(1'h1)])) <<< $signed($signed($unsigned(wire5)))));
  always
    @(posedge clk) begin
      reg9 <= ($unsigned($unsigned((^(!wire4)))) >> wire3);
      reg10 <= $signed(wire7[(1'h0):(1'h0)]);
    end
  assign wire11 = wire2;
  assign wire12 = ($unsigned(((~&reg9) <<< $unsigned((wire11 ?
                      reg10 : wire2)))) && reg9[(4'h9):(4'h8)]);
  assign wire13 = ((^(wire1[(1'h1):(1'h1)] ?
                      $unsigned(reg10[(3'h4):(1'h1)]) : reg9)) * (&wire3));
  always
    @(posedge clk) begin
      reg14 <= (($unsigned(($unsigned((8'haf)) ?
              wire2[(3'h7):(2'h3)] : $unsigned(wire7))) <= (-{(+(8'hac)),
              $signed(wire5)})) ?
          (~^(((wire0 > wire3) << wire7) | $signed(reg9))) : $signed((&$unsigned($unsigned(reg10)))));
      reg15 <= wire5;
      reg16 <= (wire5 ? wire4[(3'h6):(2'h3)] : (~^wire12));
    end
  always
    @(posedge clk) begin
      reg17 <= $unsigned((((reg10[(2'h3):(2'h3)] ?
              (^(8'hb5)) : wire5) <<< wire5) ?
          ($signed((wire5 > wire1)) ?
              (wire7 > $signed(wire11)) : {(~^wire7)}) : (reg9 | wire6[(4'he):(2'h2)])));
      reg18 <= $signed(wire8);
      reg19 <= (wire13[(2'h2):(1'h0)] ?
          ($unsigned(((reg15 ?
              (8'had) : reg16) - reg17)) != (+(wire13[(2'h2):(1'h0)] ?
              $signed(wire12) : (reg18 ?
                  reg16 : reg9)))) : wire0[(2'h2):(1'h1)]);
    end
  always
    @(posedge clk) begin
      reg20 <= wire3;
    end
  assign wire21 = (!{(~$unsigned($signed((8'hac))))});
  module22 #() modinst62 (.y(wire61), .clk(clk), .wire24(reg10), .wire23(reg14), .wire26(wire21), .wire27(wire3), .wire25(wire2));
  assign wire63 = (reg16[(3'h6):(3'h6)] ?
                      ({$signed($unsigned(wire0))} ~^ wire3) : $unsigned($signed((|(wire13 ?
                          (8'ha9) : (8'h9e))))));
  assign wire64 = $unsigned(wire3);
  assign wire65 = $unsigned(wire21);
  always
    @(posedge clk) begin
      reg66 <= wire21[(3'h4):(1'h1)];
      reg67 <= $signed(wire8[(2'h2):(1'h1)]);
    end
  assign wire68 = (|$signed($unsigned(($signed(reg10) ^~ (reg20 >= reg10)))));
  always
    @(posedge clk) begin
      reg69 <= $unsigned(reg14);
      reg70 <= ($signed({wire63[(2'h2):(1'h0)],
          $unsigned({reg14})}) == $unsigned((+(|(|reg67)))));
      reg71 <= ($signed(reg69) ? reg18[(1'h1):(1'h1)] : (|wire64));
      reg72 <= ((reg20[(2'h2):(2'h2)] ?
          (+wire0) : reg20) < ($signed(((reg18 > wire12) ?
          {wire1, reg16} : (reg66 <= reg17))) || (!(^~((8'had) <= reg20)))));
      if ($signed(reg20[(1'h0):(1'h0)]))
        begin
          if ($unsigned(wire2))
            begin
              reg73 <= $signed($signed(reg10));
              reg74 <= $unsigned($unsigned($unsigned(($unsigned(reg73) & reg73[(2'h2):(1'h1)]))));
              reg75 <= wire8;
              reg76 <= ({reg17[(2'h2):(2'h2)]} & (|{$unsigned((wire3 ?
                      wire7 : wire4))}));
              reg77 <= reg67[(2'h2):(1'h0)];
            end
          else
            begin
              reg73 <= reg20;
              reg74 <= reg20[(1'h0):(1'h0)];
              reg75 <= reg66;
              reg76 <= $unsigned($unsigned($signed(wire3)));
            end
          if ($signed(((!$unsigned(reg9[(5'h14):(3'h4)])) ?
              ($signed(wire7[(5'h13):(4'h8)]) < (^$unsigned(reg14))) : (({(8'haf),
                      reg75} <= $signed((8'h9e))) ?
                  $unsigned($signed(reg9)) : reg17))))
            begin
              reg78 <= (reg73[(1'h1):(1'h1)] == ((reg76[(5'h14):(3'h4)] ?
                  $unsigned($signed((8'ha8))) : ((reg15 ?
                      reg69 : wire21) << ((8'hb2) ?
                      wire3 : wire8))) & ($unsigned($unsigned(reg9)) ?
                  wire68 : (8'hbf))));
              reg79 <= reg75;
              reg80 <= $unsigned({{$signed(reg17)}});
              reg81 <= (reg72[(3'h7):(3'h4)] ? wire65 : (8'hb1));
            end
          else
            begin
              reg78 <= wire61;
            end
        end
      else
        begin
          reg73 <= ($signed($unsigned((wire12 <<< {reg69}))) ?
              (-reg74[(1'h0):(1'h0)]) : (~|(&$unsigned($signed(reg15)))));
          if (($signed((wire4[(3'h7):(2'h2)] ?
                  (^~reg66[(3'h7):(3'h5)]) : (~|(~&wire8)))) ?
              (7'h43) : ((-reg10[(3'h6):(2'h3)]) & (~&reg76[(4'hc):(1'h1)]))))
            begin
              reg74 <= (reg74[(2'h2):(2'h2)] - wire7[(4'hd):(4'hc)]);
              reg75 <= {((wire11[(2'h3):(2'h3)] ?
                          reg10[(2'h3):(1'h0)] : ($signed(reg76) >= $unsigned(reg66))) ?
                      ((&(reg18 << wire0)) ?
                          (~&wire11) : {reg16[(4'hd):(2'h2)],
                              (wire61 ?
                                  wire63 : wire21)}) : {$signed($unsigned(reg75)),
                          $signed(wire65)}),
                  {($signed($signed((8'hbe))) & (~&(^reg18))),
                      (|(wire6[(2'h3):(1'h1)] ? (~^reg16) : wire0))}};
              reg76 <= (reg75 + ({reg69[(1'h0):(1'h0)],
                      $unsigned($unsigned((8'hb4)))} ?
                  (-$unsigned($signed(reg18))) : ($signed((~^reg80)) ?
                      wire8 : ($unsigned(wire6) ? (8'hac) : wire7))));
            end
          else
            begin
              reg74 <= (-(+($signed(reg67) < wire6)));
              reg75 <= $unsigned((+(wire0 + (7'h40))));
              reg76 <= (wire7[(5'h13):(4'hd)] ?
                  $signed({((wire5 | wire61) ?
                          (^~(7'h42)) : {reg78})}) : ($unsigned(wire3) ?
                      (reg66 ? wire11[(2'h2):(2'h2)] : wire5) : ((~(8'h9f)) ?
                          $unsigned((wire2 < wire68)) : {((8'hae) ?
                                  wire61 : wire0)})));
              reg77 <= $signed(reg69[(2'h2):(2'h2)]);
            end
        end
    end
  assign wire82 = {(~|(((~|wire13) >= $signed(reg17)) >> reg70)),
                      $unsigned((($signed((8'hb8)) & (reg77 ? wire3 : reg74)) ?
                          (reg19 | $signed(reg9)) : (^((8'hbb) - (8'hb8)))))};
  assign wire83 = ($unsigned((^(^~$unsigned(wire65)))) + ((reg69[(4'h8):(3'h5)] != $unsigned((8'ha0))) ?
                      reg19 : reg75));
  assign wire84 = reg80;
endmodule

module module22
#(parameter param59 = ((^(8'hac)) || {((((8'hac) ? (8'hb8) : (8'h9d)) ? {(7'h40), (7'h40)} : ((8'hba) != (8'hbd))) ? (((8'ha2) || (8'hb2)) ? (7'h41) : ((8'ha5) && (8'ha8))) : (((8'hb9) ? (8'ha4) : (7'h42)) ^ {(7'h41)})), ((|((8'hba) ? (8'ha8) : (8'h9d))) >= ((~&(8'ha2)) ? (^~(7'h43)) : ((8'hbe) ? (8'ha0) : (8'haa))))}), 
parameter param60 = (((&((param59 * param59) || {param59, param59})) - {(!(param59 ? param59 : param59)), ((!param59) ? param59 : (param59 | param59))}) ? (param59 ? (((|param59) ? {(8'hbc)} : ((8'ha9) ? param59 : param59)) ? param59 : {{param59, (8'hb2)}}) : (param59 ? ((param59 ? param59 : param59) << {param59, param59}) : (param59 ? (param59 ? param59 : param59) : param59))) : (|({(param59 != (8'hbb))} ? ((param59 ? (8'ha7) : param59) + (param59 <<< param59)) : ({param59, param59} << (param59 + param59))))))
(y, clk, wire27, wire26, wire25, wire24, wire23);
  output wire [(32'h34):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire27;
  input wire [(4'hc):(1'h0)] wire26;
  input wire [(3'h6):(1'h0)] wire25;
  input wire [(4'ha):(1'h0)] wire24;
  input wire [(4'hc):(1'h0)] wire23;
  wire [(4'hd):(1'h0)] wire58;
  wire signed [(5'h14):(1'h0)] wire57;
  wire [(4'h8):(1'h0)] wire56;
  wire [(4'ha):(1'h0)] wire54;
  assign y = {wire58, wire57, wire56, wire54, (1'h0)};
  module28 #() modinst55 (wire54, clk, wire27, wire26, wire25, wire24);
  assign wire56 = (~&($signed((wire26 <= wire54[(3'h4):(1'h1)])) ?
                      {{wire27}} : wire23[(4'ha):(2'h2)]));
  assign wire57 = ((&wire23) ?
                      ($unsigned({{(8'hb1)}, (wire24 ? wire27 : wire26)}) ?
                          $unsigned(((wire26 ?
                              (8'hbd) : (7'h43)) - $unsigned(wire56))) : $signed({(wire54 ?
                                  wire25 : wire56)})) : (|$unsigned($signed(wire23[(4'h8):(1'h1)]))));
  assign wire58 = (+$unsigned((&$signed(wire25))));
endmodule

module module28  (y, clk, wire32, wire31, wire30, wire29);
  output wire [(32'he3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire32;
  input wire signed [(3'h5):(1'h0)] wire31;
  input wire signed [(2'h3):(1'h0)] wire30;
  input wire signed [(4'ha):(1'h0)] wire29;
  wire [(3'h6):(1'h0)] wire53;
  wire [(4'he):(1'h0)] wire52;
  wire signed [(4'hd):(1'h0)] wire51;
  wire [(4'hc):(1'h0)] wire50;
  wire [(4'hb):(1'h0)] wire49;
  wire signed [(4'hb):(1'h0)] wire48;
  wire [(4'he):(1'h0)] wire47;
  wire [(4'hc):(1'h0)] wire46;
  wire signed [(4'hc):(1'h0)] wire45;
  wire signed [(3'h6):(1'h0)] wire44;
  wire signed [(5'h10):(1'h0)] wire43;
  wire signed [(4'h8):(1'h0)] wire42;
  wire signed [(4'h9):(1'h0)] wire41;
  wire signed [(2'h2):(1'h0)] wire40;
  wire [(3'h6):(1'h0)] wire39;
  wire signed [(5'h10):(1'h0)] wire38;
  wire [(3'h5):(1'h0)] wire37;
  wire [(5'h11):(1'h0)] wire36;
  wire [(5'h10):(1'h0)] wire35;
  wire signed [(4'hc):(1'h0)] wire34;
  wire signed [(4'h8):(1'h0)] wire33;
  assign y = {wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 (1'h0)};
  assign wire33 = wire32[(3'h4):(3'h4)];
  assign wire34 = wire31[(2'h3):(1'h1)];
  assign wire35 = $unsigned($signed(($signed(wire31[(2'h3):(1'h1)]) >> (wire30[(1'h1):(1'h0)] >> ((8'hb5) ?
                      wire30 : (8'hb1))))));
  assign wire36 = $unsigned((^$signed(($signed((7'h40)) ?
                      {wire33, wire35} : (wire34 >>> (8'hb0))))));
  assign wire37 = $unsigned(($signed($signed((wire35 << wire29))) == ($unsigned((wire34 || wire30)) << wire32)));
  assign wire38 = $signed((((wire33[(1'h0):(1'h0)] ^~ $signed(wire30)) ?
                      wire37[(2'h2):(2'h2)] : ((wire30 ? wire33 : (8'hbc)) ?
                          (8'had) : wire35)) | $signed((((7'h41) ^~ wire33) ^ (8'hbb)))));
  assign wire39 = wire32[(2'h2):(1'h1)];
  assign wire40 = wire32;
  assign wire41 = ($signed($unsigned($signed(((8'ha9) < wire34)))) <<< (&(~&((wire34 >>> wire32) ~^ $unsigned(wire32)))));
  assign wire42 = $unsigned((wire32[(1'h0):(1'h0)] ?
                      $unsigned((wire29[(1'h0):(1'h0)] ?
                          wire31[(2'h2):(1'h0)] : (wire37 ?
                              wire36 : wire33))) : wire34));
  assign wire43 = $signed($unsigned(wire42));
  assign wire44 = (~^wire31);
  assign wire45 = wire31[(2'h2):(1'h0)];
  assign wire46 = (wire40 < $signed((~^(|(wire39 ? wire38 : (8'hb3))))));
  assign wire47 = wire46[(3'h6):(2'h3)];
  assign wire48 = $unsigned(wire30);
  assign wire49 = (wire29[(1'h1):(1'h1)] >= ($unsigned(wire46[(2'h2):(1'h1)]) ?
                      $unsigned(wire33[(2'h3):(1'h1)]) : $unsigned(($unsigned(wire30) + (wire30 ?
                          wire46 : wire40)))));
  assign wire50 = $unsigned(wire45[(3'h5):(3'h5)]);
  assign wire51 = wire36[(2'h3):(2'h2)];
  assign wire52 = $unsigned($signed(($signed(wire47[(1'h1):(1'h0)]) == (wire33[(3'h4):(2'h2)] ?
                      wire32 : wire41[(4'h9):(2'h3)]))));
  assign wire53 = ($unsigned($signed($unsigned((wire32 ? wire44 : wire47)))) ?
                      {$signed($unsigned((8'ha1))),
                          ($signed(wire44[(3'h5):(2'h3)]) && $unsigned(wire45[(4'hc):(1'h1)]))} : $unsigned({wire49}));
endmodule
