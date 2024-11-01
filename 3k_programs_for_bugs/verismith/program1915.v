module top
#(parameter param107 = {((7'h41) ? (~^(((8'ha0) ? (8'hbb) : (8'hb3)) ? ((8'hb0) ? (8'hb0) : (8'ha3)) : (|(8'hbb)))) : ({((8'hbc) ? (7'h44) : (8'haf)), (~^(8'haa))} & ((^~(7'h40)) ? (7'h43) : {(8'hb3)}))), ((((~&(8'ha0)) * ((8'hb6) ? (8'ha7) : (8'hbc))) ? (!((8'hac) ? (7'h41) : (8'had))) : (^~(~&(8'hb8)))) == {(((7'h44) < (8'h9d)) ? ((8'ha2) ? (8'hb0) : (8'hbb)) : ((7'h40) ? (8'ha1) : (8'hbd)))})}, 
parameter param108 = (&(^(8'hb9))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h6d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire0;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire3;
  wire [(3'h7):(1'h0)] wire106;
  wire [(5'h15):(1'h0)] wire105;
  wire signed [(4'hf):(1'h0)] wire4;
  wire [(3'h4):(1'h0)] wire96;
  reg signed [(4'hb):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg103 = (1'h0);
  reg [(3'h5):(1'h0)] reg102 = (1'h0);
  reg [(3'h6):(1'h0)] reg101 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg99 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg98 = (1'h0);
  assign y = {wire106,
                 wire105,
                 wire4,
                 wire96,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 (1'h0)};
  assign wire4 = (&(~^((~|wire1) ?
                     $unsigned(((8'hb8) ? wire3 : wire0)) : (wire3 > {wire1,
                         (7'h40)}))));
  module5 #() modinst97 (.wire8(wire4), .wire10(wire3), .wire9(wire2), .wire6(wire1), .wire7(wire0), .clk(clk), .y(wire96));
  always
    @(posedge clk) begin
      if (((wire3 > (wire96 ?
          wire96[(2'h3):(2'h2)] : (^~(|(8'hb5))))) >> wire4[(4'hc):(4'ha)]))
        begin
          reg98 <= $signed((!(wire3 ? $unsigned((8'ha4)) : $signed((8'h9c)))));
          reg99 <= (((wire3[(2'h3):(1'h1)] ?
                  (&(wire2 ?
                      wire2 : wire1)) : wire4[(1'h1):(1'h0)]) << (~^{{wire1}})) ?
              ((|((wire2 ? wire3 : reg98) <<< {wire3})) <<< $unsigned((+{wire1,
                  wire3}))) : wire96[(3'h4):(1'h1)]);
          reg100 <= (!$signed((~({wire1} == (~&wire96)))));
        end
      else
        begin
          reg98 <= $unsigned($unsigned(($signed($unsigned(wire2)) ?
              ($unsigned(wire4) ^ (reg100 ? (8'hb4) : wire0)) : (wire1 ?
                  $signed(wire3) : (|(8'hb7))))));
          reg99 <= (~&{({wire0, (+reg98)} ? (8'hb3) : $signed((~^reg98)))});
        end
      reg101 <= wire96[(1'h0):(1'h0)];
      reg102 <= ((((8'hac) != $unsigned((!(8'ha4)))) != $unsigned((|(reg99 ?
          wire4 : reg101)))) ^ wire0[(4'ha):(3'h5)]);
      reg103 <= $unsigned($signed({$signed({wire2, (8'ha8)})}));
      reg104 <= $unsigned($unsigned(wire4));
    end
  assign wire105 = ($unsigned($unsigned(($signed((8'hb4)) ?
                       {reg99, reg103} : (wire1 ?
                           reg102 : wire2)))) || reg104[(4'hb):(2'h2)]);
  assign wire106 = (|($unsigned(wire96) == (|reg104)));
endmodule

module module5  (y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'hab):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire10;
  input wire [(5'h14):(1'h0)] wire9;
  input wire [(4'hf):(1'h0)] wire8;
  input wire signed [(4'hc):(1'h0)] wire7;
  input wire signed [(4'he):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire95;
  wire [(5'h15):(1'h0)] wire93;
  wire [(5'h11):(1'h0)] wire50;
  wire [(2'h3):(1'h0)] wire49;
  wire [(5'h13):(1'h0)] wire48;
  wire [(5'h15):(1'h0)] wire47;
  wire [(3'h5):(1'h0)] wire46;
  wire signed [(5'h12):(1'h0)] wire45;
  wire [(4'he):(1'h0)] wire40;
  reg [(4'hc):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg43 = (1'h0);
  reg [(2'h3):(1'h0)] reg44 = (1'h0);
  assign y = {wire95,
                 wire93,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire40,
                 reg42,
                 reg43,
                 reg44,
                 (1'h0)};
  module11 #() modinst41 (.wire12(wire10), .wire14(wire7), .wire15(wire6), .y(wire40), .clk(clk), .wire13(wire8));
  always
    @(posedge clk) begin
      reg42 <= $signed(((wire7 >>> wire7[(1'h1):(1'h1)]) ?
          $unsigned(({(8'haa), wire6} ?
              wire8 : (wire40 >> wire8))) : ((((8'haf) == wire6) ?
                  ((8'hab) ? (7'h43) : wire8) : {wire9}) ?
              $signed($signed(wire8)) : (|(&wire8)))));
      reg43 <= (((^~wire10[(1'h0):(1'h0)]) | ((&$unsigned(wire6)) ^~ (wire10 ?
              (wire9 + reg42) : (wire9 ? wire40 : wire9)))) ?
          {{wire9[(3'h5):(2'h2)], ({(8'ha2), wire40} - $signed(wire8))},
              (!((~|reg42) <= reg42[(1'h0):(1'h0)]))} : wire8);
      reg44 <= ((~^($unsigned($unsigned(wire6)) <<< $signed((^~reg42)))) ~^ $unsigned(wire6));
    end
  assign wire45 = $signed(wire8[(4'hf):(4'h9)]);
  assign wire46 = wire9[(4'h8):(2'h3)];
  assign wire47 = {(reg42 ?
                          $signed($unsigned($unsigned(reg42))) : $unsigned({(wire9 - wire46),
                              $unsigned(wire46)})),
                      ($unsigned(wire8[(4'ha):(3'h4)]) ?
                          $unsigned($unsigned((wire10 != (8'ha2)))) : wire9[(5'h10):(2'h3)])};
  assign wire48 = {(~($unsigned((wire7 ?
                          reg42 : (8'hae))) <= {$signed(wire46)}))};
  assign wire49 = wire45[(4'ha):(4'h9)];
  assign wire50 = wire49;
  module51 #() modinst94 (wire93, clk, wire49, wire46, wire9, reg43, wire8);
  assign wire95 = (wire45[(3'h7):(3'h6)] ?
                      (($unsigned($signed(reg43)) ?
                          ((reg42 || wire10) ?
                              (wire8 ?
                                  (8'ha7) : (8'hb6)) : wire7) : wire10) <<< ($unsigned((wire40 ?
                          reg44 : wire47)) << ({wire9} ?
                          wire6[(3'h6):(2'h2)] : wire50))) : wire6);
endmodule

module module51
#(parameter param92 = (8'ha9))
(y, clk, wire56, wire55, wire54, wire53, wire52);
  output wire [(32'h165):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire56;
  input wire [(3'h5):(1'h0)] wire55;
  input wire [(5'h14):(1'h0)] wire54;
  input wire signed [(5'h15):(1'h0)] wire53;
  input wire [(3'h7):(1'h0)] wire52;
  wire [(3'h4):(1'h0)] wire91;
  wire signed [(3'h7):(1'h0)] wire90;
  wire signed [(4'h9):(1'h0)] wire89;
  wire [(3'h5):(1'h0)] wire70;
  wire [(4'hd):(1'h0)] wire59;
  wire [(3'h6):(1'h0)] wire58;
  wire [(3'h5):(1'h0)] wire57;
  reg signed [(4'hf):(1'h0)] reg88 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg87 = (1'h0);
  reg [(3'h7):(1'h0)] reg86 = (1'h0);
  reg [(5'h11):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg81 = (1'h0);
  reg signed [(4'he):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg79 = (1'h0);
  reg [(4'ha):(1'h0)] reg78 = (1'h0);
  reg [(2'h2):(1'h0)] reg77 = (1'h0);
  reg [(4'hd):(1'h0)] reg76 = (1'h0);
  reg [(4'h9):(1'h0)] reg75 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg73 = (1'h0);
  reg [(3'h7):(1'h0)] reg72 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg69 = (1'h0);
  reg [(5'h10):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg65 = (1'h0);
  reg [(3'h4):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg63 = (1'h0);
  reg [(3'h5):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg61 = (1'h0);
  reg [(5'h10):(1'h0)] reg60 = (1'h0);
  assign y = {wire91,
                 wire90,
                 wire89,
                 wire70,
                 wire59,
                 wire58,
                 wire57,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
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
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 (1'h0)};
  assign wire57 = ({wire52[(3'h7):(3'h4)]} == $signed(wire55));
  assign wire58 = $signed(({((wire57 ? wire52 : wire54) ?
                              (wire55 <<< wire53) : wire53[(1'h1):(1'h0)]),
                          {(|(8'h9e)), (wire57 ? wire55 : wire56)}} ?
                      wire52[(2'h3):(1'h1)] : wire53[(5'h13):(3'h5)]));
  assign wire59 = ($signed($unsigned(wire52[(1'h1):(1'h0)])) ?
                      ((8'hb3) < wire56[(1'h0):(1'h0)]) : ($signed($unsigned($signed(wire57))) ?
                          wire54 : (8'ha9)));
  always
    @(posedge clk) begin
      if ($unsigned((|wire58)))
        begin
          if (wire56)
            begin
              reg60 <= $signed((~|$signed((wire56 << wire53))));
            end
          else
            begin
              reg60 <= (($unsigned(((wire57 ? wire54 : reg60) ?
                      $unsigned(wire58) : $signed(reg60))) ?
                  wire55 : wire55[(2'h2):(1'h0)]) > wire58);
            end
          reg61 <= reg60[(4'h8):(4'h8)];
          reg62 <= wire54;
          reg63 <= reg61[(3'h5):(3'h5)];
        end
      else
        begin
          reg60 <= $unsigned((!wire58));
          if ({(({$unsigned(wire58), wire56} ?
                  reg60 : (wire57[(3'h4):(1'h1)] || (reg61 ?
                      wire55 : reg61))) * ($unsigned((+wire52)) << ($signed(wire55) == $unsigned(reg60)))),
              ({((wire56 ? wire59 : (8'hb1)) ? {wire53} : (~wire56)),
                      $signed($signed((8'hb1)))} ?
                  wire54 : $unsigned({(~&(8'hb4)), $unsigned(reg63)}))})
            begin
              reg61 <= ((reg62 ?
                      $unsigned(((wire53 ?
                          reg62 : wire57) & (wire56 <<< wire59))) : wire52) ?
                  $signed((((reg60 ? (7'h43) : wire55) ?
                          (wire59 >> wire55) : (reg60 >>> reg62)) ?
                      $signed((reg63 ?
                          wire58 : wire55)) : ((wire56 + reg61) < (wire53 ?
                          wire57 : wire52)))) : wire57[(1'h0):(1'h0)]);
              reg62 <= (!wire52);
              reg63 <= {{(^{$signed(wire52), $unsigned(wire57)})},
                  ($unsigned({wire53}) >= (~&{$signed(wire54)}))};
              reg64 <= $signed(reg63[(3'h5):(2'h2)]);
              reg65 <= wire58[(3'h5):(2'h3)];
            end
          else
            begin
              reg61 <= (((wire56 ? wire54[(4'hd):(2'h2)] : wire52) ?
                      $unsigned($signed((reg64 | wire55))) : $unsigned($signed(wire56))) ?
                  $signed(({(wire54 ~^ wire58)} ?
                      ($signed(wire53) ?
                          $signed(reg63) : (wire59 ^~ wire58)) : {(reg61 ?
                              reg60 : (8'hbf)),
                          $unsigned((8'hac))})) : $signed($signed(wire58[(3'h4):(2'h2)])));
              reg62 <= $unsigned(((!(~&$signed(wire52))) ^ ({(wire58 ~^ reg61)} * ((wire59 << wire59) + $unsigned(reg60)))));
              reg63 <= $unsigned((!(($signed(wire58) & {reg60}) <= {(wire54 ?
                      (8'ha4) : (8'h9d)),
                  ((8'hab) >>> reg60)})));
              reg64 <= $unsigned(wire58);
              reg65 <= (~$signed((&((wire56 ?
                  (8'hb6) : wire57) + reg61[(3'h5):(2'h3)]))));
            end
          reg66 <= $unsigned({$signed($unsigned((wire53 >= wire58)))});
          reg67 <= wire54[(1'h1):(1'h1)];
          reg68 <= $unsigned(($signed((reg67 <<< reg66[(1'h0):(1'h0)])) < ({reg63} ?
              $signed((|wire59)) : reg63)));
        end
      reg69 <= (8'ha0);
    end
  assign wire70 = $signed(reg66);
  always
    @(posedge clk) begin
      reg71 <= reg67[(4'hb):(4'hb)];
      reg72 <= reg61;
      reg73 <= (($unsigned(reg65[(5'h10):(4'hb)]) ?
          ($signed(wire59[(2'h3):(2'h3)]) << (8'ha5)) : $unsigned((reg60[(4'ha):(1'h0)] && $unsigned(reg61)))) * reg61[(3'h4):(2'h2)]);
      reg74 <= (!$signed($unsigned((^reg71[(1'h0):(1'h0)]))));
    end
  always
    @(posedge clk) begin
      reg75 <= wire70[(1'h1):(1'h0)];
      if (($unsigned(((^~(reg63 ? wire56 : wire52)) <<< ((8'hbe) ?
              reg62 : (~&wire57)))) ?
          (reg69[(2'h2):(1'h1)] ?
              (|(wire54 * (reg69 ~^ reg62))) : {wire59[(3'h4):(1'h0)],
                  ($signed(reg73) > $unsigned(reg75))}) : reg67))
        begin
          reg76 <= reg67;
          reg77 <= $signed($signed((~^reg67)));
          if ((~^((|{(reg75 ^ (8'hb7)), reg75}) ?
              reg63[(1'h1):(1'h1)] : $unsigned(wire53))))
            begin
              reg78 <= {((8'hae) ?
                      (8'hb1) : (reg73[(1'h0):(1'h0)] == (~&$signed(reg68)))),
                  (^($signed(wire54) + wire52[(2'h2):(1'h0)]))};
              reg79 <= reg65;
              reg80 <= ((~|reg69) ^~ {$signed($signed((~|reg74))),
                  {reg79[(4'h8):(3'h4)],
                      ((wire52 <= (8'hac)) ? reg79 : reg67)}});
              reg81 <= (+(^(~&reg76)));
            end
          else
            begin
              reg78 <= $signed(reg62);
              reg79 <= ($unsigned(($unsigned($signed(reg66)) ?
                  (+(reg72 ?
                      reg67 : (8'ha4))) : wire54[(5'h13):(1'h1)])) != reg79);
              reg80 <= wire59;
              reg81 <= $signed((-(|$signed(wire59))));
            end
          if ((($unsigned($unsigned({reg78})) ?
                  ((~^(reg77 ? reg62 : (7'h40))) ?
                      reg76 : $unsigned(reg62)) : $unsigned(((reg62 ?
                      reg69 : (8'ha0)) + {reg65, wire58}))) ?
              $unsigned({{(reg74 < wire53)},
                  $signed($signed(reg76))}) : wire70))
            begin
              reg82 <= $unsigned((((!wire53[(4'ha):(4'h8)]) ?
                      (!$signed(wire52)) : (8'hb6)) ?
                  (wire53[(4'hd):(3'h7)] ?
                      $unsigned((reg64 && wire55)) : wire55[(2'h3):(1'h0)]) : (~&($signed(wire52) ^ $unsigned(reg60)))));
              reg83 <= (reg75 ?
                  (~&((reg62[(2'h3):(2'h2)] ?
                      (&reg64) : wire55) ~^ (|wire56))) : ($signed(((+wire53) ?
                      (^~reg81) : wire52[(1'h1):(1'h0)])) | (~^$unsigned($signed(reg72)))));
              reg84 <= reg66;
              reg85 <= (reg82 ?
                  $signed(wire57[(1'h1):(1'h1)]) : $signed($unsigned((reg79[(4'h9):(2'h3)] ?
                      (~|(8'h9d)) : (reg83 != reg75)))));
            end
          else
            begin
              reg82 <= wire53[(2'h2):(1'h1)];
              reg83 <= (reg66 ? reg75 : reg81[(3'h7):(2'h2)]);
              reg84 <= wire54;
            end
        end
      else
        begin
          reg76 <= (reg81[(4'hd):(4'ha)] && $signed(((reg67 != reg78) >> reg69)));
          reg77 <= $signed(reg73);
        end
      reg86 <= {$unsigned((wire59[(4'h8):(3'h6)] ?
              ((reg80 << reg62) >>> (reg71 ? (7'h44) : reg82)) : wire56)),
          (~^((-(wire52 && reg71)) ?
              ($signed(reg68) ?
                  (wire53 != reg62) : ((7'h41) ?
                      reg73 : reg76)) : ($unsigned(reg71) < $unsigned(reg65))))};
      reg87 <= $signed(reg78[(3'h4):(2'h3)]);
      reg88 <= wire58[(3'h4):(2'h3)];
    end
  assign wire89 = ($signed(reg67) < reg62);
  assign wire90 = $unsigned(((wire57 ?
                      reg83[(4'h8):(3'h6)] : (reg84[(2'h3):(2'h2)] + $unsigned(reg82))) && {reg62[(3'h5):(1'h1)],
                      reg67[(1'h0):(1'h0)]}));
  assign wire91 = reg63;
endmodule

module module11
#(parameter param39 = ((({((8'h9d) ? (8'hac) : (7'h41))} - (^(8'hb4))) ? (((&(7'h41)) ? (~^(8'ha8)) : ((8'hba) ? (8'hb2) : (8'ha8))) ? (((8'ha9) ? (8'h9d) : (8'ha5)) > ((8'h9f) <= (8'hac))) : (+{(8'hac), (8'ha3)})) : (~&(((8'haf) + (8'h9f)) ? ((8'ha4) ? (8'h9d) : (8'hac)) : ((8'ha1) ? (7'h44) : (8'ha0))))) - (({{(8'hbe)}} >> {(~(7'h44)), ((7'h40) && (8'h9d))}) * ((((8'haf) <<< (8'hb9)) ? (~(8'hb1)) : {(8'ha9)}) - ((8'ha8) << ((8'hb3) ? (8'hb3) : (8'hb9)))))))
(y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'h105):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire15;
  input wire [(4'hc):(1'h0)] wire14;
  input wire [(4'h9):(1'h0)] wire13;
  input wire [(4'ha):(1'h0)] wire12;
  wire [(2'h2):(1'h0)] wire38;
  wire signed [(5'h15):(1'h0)] wire20;
  wire [(3'h5):(1'h0)] wire19;
  wire signed [(3'h5):(1'h0)] wire18;
  reg [(5'h13):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg35 = (1'h0);
  reg signed [(4'he):(1'h0)] reg34 = (1'h0);
  reg [(3'h4):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg32 = (1'h0);
  reg [(3'h7):(1'h0)] reg31 = (1'h0);
  reg [(5'h14):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg28 = (1'h0);
  reg [(5'h12):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg26 = (1'h0);
  reg [(5'h15):(1'h0)] reg25 = (1'h0);
  reg [(4'hd):(1'h0)] reg24 = (1'h0);
  reg [(3'h7):(1'h0)] reg23 = (1'h0);
  reg [(3'h6):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg17 = (1'h0);
  reg [(5'h10):(1'h0)] reg16 = (1'h0);
  assign y = {wire38,
                 wire20,
                 wire19,
                 wire18,
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
                 reg21,
                 reg17,
                 reg16,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg16 <= wire14;
      reg17 <= wire13;
    end
  assign wire18 = (wire13 ?
                      ({(^~$unsigned((7'h44))), $unsigned({reg17, reg16})} ?
                          (^~reg16) : {(7'h42)}) : reg16[(3'h5):(1'h0)]);
  assign wire19 = (reg16 <= (7'h44));
  assign wire20 = {$unsigned(wire15),
                      ((~(reg17[(2'h3):(1'h1)] ?
                          wire12[(2'h3):(1'h0)] : $signed(wire19))) >>> {$unsigned((8'hbf)),
                          wire12})};
  always
    @(posedge clk) begin
      reg21 <= ({$signed($unsigned((wire14 || reg17)))} ?
          (reg16[(5'h10):(4'hd)] ?
              $signed(($unsigned(reg17) >>> $signed(wire18))) : (^$unsigned((reg16 != wire12)))) : (~^(8'hb4)));
      if ((wire19 >>> wire19[(3'h5):(2'h3)]))
        begin
          reg22 <= wire18;
          if (wire15)
            begin
              reg23 <= $signed(wire19);
              reg24 <= (((($signed(wire15) + $unsigned(wire14)) ^~ (^~reg23[(1'h1):(1'h1)])) | $signed((((8'ha0) ?
                          wire14 : reg21) ?
                      (|reg17) : $unsigned((8'ha6))))) ?
                  ($unsigned($signed($signed(wire14))) ?
                      {($unsigned(wire13) >= (wire20 & reg16)),
                          (+wire19)} : $unsigned({wire14[(3'h5):(1'h0)]})) : wire20[(5'h11):(1'h0)]);
            end
          else
            begin
              reg23 <= (wire14 ? $unsigned(wire20) : (+reg22[(2'h3):(2'h2)]));
              reg24 <= (~{((-wire13[(1'h1):(1'h0)]) ?
                      (wire14 ?
                          $unsigned((8'ha1)) : {reg23}) : ((8'ha3) == $unsigned(reg16))),
                  (wire19 ^~ (reg16 & wire13[(3'h7):(3'h6)]))});
            end
        end
      else
        begin
          reg22 <= (^($unsigned($signed((wire15 ?
              wire13 : reg23))) && (|((8'ha1) ^~ (8'ha1)))));
          reg23 <= $signed((wire13 ^~ (+$unsigned($unsigned(reg21)))));
        end
      reg25 <= ((-$unsigned((^(wire19 << reg21)))) == ($unsigned($unsigned($unsigned(wire14))) != ((8'h9d) ?
          wire20 : (reg17[(4'ha):(2'h3)] || reg17))));
      if (wire12)
        begin
          reg26 <= (reg23 | $signed(reg24[(1'h0):(1'h0)]));
          if ($unsigned((&(wire13[(3'h4):(1'h1)] < ((wire14 ?
              (8'hb4) : (8'hb2)) < wire15[(3'h4):(2'h3)])))))
            begin
              reg27 <= $signed((&{$unsigned($signed(reg16))}));
              reg28 <= (wire12 ?
                  reg25 : ($signed(reg17) ?
                      {$unsigned(reg26[(2'h3):(1'h1)]),
                          (reg17 ^ $signed(wire20))} : (reg26 << ((^~wire18) - (8'hb6)))));
              reg29 <= $signed(reg21);
              reg30 <= $signed((($unsigned(wire18) < (|$unsigned((8'hba)))) <<< reg25[(3'h4):(2'h2)]));
              reg31 <= reg27;
            end
          else
            begin
              reg27 <= (~$signed(reg24[(4'hc):(4'hc)]));
              reg28 <= reg25;
              reg29 <= ((-(((!wire13) - (-reg16)) ?
                      $signed({(8'h9d), wire15}) : $unsigned((reg22 ?
                          reg16 : wire19)))) ?
                  reg22[(2'h3):(2'h3)] : $signed(reg22[(1'h0):(1'h0)]));
              reg30 <= wire14;
            end
          reg32 <= (~|(-(reg16[(4'hf):(3'h7)] ?
              $unsigned($signed(reg21)) : $unsigned((reg28 ~^ wire12)))));
          if ((wire15 | (reg31 ^ reg32)))
            begin
              reg33 <= wire19[(2'h3):(1'h1)];
              reg34 <= reg30[(4'hb):(3'h4)];
              reg35 <= wire19[(3'h5):(2'h3)];
              reg36 <= (!((reg25 ? (~|$signed(reg21)) : $signed(reg31)) ?
                  {reg23,
                      ($signed(reg21) ?
                          (reg26 ?
                              reg26 : reg25) : wire12[(3'h4):(1'h0)])} : $unsigned(((8'haf) ~^ (^reg25)))));
              reg37 <= $signed((+(((+wire15) ?
                      $signed((7'h41)) : $signed(reg30)) ?
                  ($signed((8'ha9)) ? (+reg36) : (+reg31)) : reg27)));
            end
          else
            begin
              reg33 <= $signed({wire13,
                  (|((+reg16) ? reg16[(2'h3):(1'h0)] : (reg29 ^~ reg25)))});
              reg34 <= ($signed((wire15 >> reg27)) ?
                  reg17 : $unsigned((^~$signed((wire13 * reg25)))));
            end
        end
      else
        begin
          reg26 <= reg25;
          reg27 <= (~^((wire18 > $unsigned((8'h9e))) || reg36[(1'h1):(1'h0)]));
        end
    end
  assign wire38 = (~|$signed((~&((reg24 ? reg27 : wire12) - (reg24 ?
                      reg34 : reg31)))));
endmodule
