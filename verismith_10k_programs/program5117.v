module top
#(parameter param92 = ({(7'h40), ((((8'ha7) < (8'h9d)) ? {(8'hb5), (8'hb7)} : ((8'hb1) - (8'ha0))) ? (((8'hb7) ? (8'ha2) : (8'hb7)) + ((8'ha9) > (8'hb4))) : (^~(&(8'hb8))))} >>> (((((7'h41) ? (8'hb2) : (8'had)) > (~|(8'ha9))) ^~ (((8'hb3) ? (8'hb8) : (8'ha5)) ? ((8'hba) ? (8'hb6) : (8'hbd)) : ((8'ha6) ? (8'ha2) : (8'hac)))) ? ({((8'h9e) ? (8'h9c) : (7'h41))} ? (((8'hb7) - (8'h9e)) != ((8'h9d) ? (8'h9f) : (8'hb8))) : (((8'ha3) ? (8'hb1) : (8'hb3)) ? ((7'h40) ? (8'ha6) : (7'h44)) : {(8'hb7), (8'hb9)})) : ((^{(8'hbf), (8'hb4)}) ? ({(8'hbb), (7'h40)} << ((8'haf) && (8'hb4))) : (((7'h40) ? (8'hb3) : (8'hb8)) << (~^(8'hb3)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h93):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire0;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire4;
  wire signed [(2'h3):(1'h0)] wire10;
  wire signed [(2'h3):(1'h0)] wire11;
  wire signed [(2'h3):(1'h0)] wire12;
  wire [(3'h5):(1'h0)] wire13;
  wire signed [(3'h7):(1'h0)] wire14;
  wire signed [(5'h13):(1'h0)] wire15;
  wire [(3'h5):(1'h0)] wire16;
  wire [(5'h15):(1'h0)] wire58;
  wire [(5'h12):(1'h0)] wire90;
  reg signed [(5'h10):(1'h0)] reg5 = (1'h0);
  reg [(4'ha):(1'h0)] reg6 = (1'h0);
  reg [(5'h10):(1'h0)] reg7 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg8 = (1'h0);
  reg [(5'h11):(1'h0)] reg9 = (1'h0);
  assign y = {wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire58,
                 wire90,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($signed(wire2[(3'h5):(1'h1)]))
        begin
          reg5 <= {wire1[(4'ha):(4'h9)]};
        end
      else
        begin
          reg5 <= {wire2,
              ($unsigned(((wire2 + wire3) || reg5)) ?
                  $signed((^wire4[(4'he):(2'h3)])) : ($unsigned(reg5) ?
                      (wire1 > {wire4, (8'h9c)}) : (-reg5)))};
          reg6 <= (~&$unsigned((!(+$unsigned(wire0)))));
          reg7 <= wire3[(1'h0):(1'h0)];
        end
      reg8 <= $unsigned({$unsigned((|$unsigned(reg5)))});
      reg9 <= $signed((($signed($unsigned(reg8)) != $signed((reg8 ?
              reg6 : wire0))) ?
          $unsigned((8'hb3)) : {($unsigned(wire4) != (reg8 << reg7))}));
    end
  assign wire10 = (reg5[(4'h8):(3'h5)] ?
                      $unsigned(((reg5 ? $unsigned((8'hb3)) : (^~(8'h9d))) ?
                          (-((8'hb6) ?
                              reg6 : (8'ha7))) : $signed($signed(reg7)))) : (+reg7));
  assign wire11 = (~&$unsigned(reg6[(3'h7):(3'h5)]));
  assign wire12 = wire2[(4'h8):(4'h8)];
  assign wire13 = reg7;
  assign wire14 = wire1[(1'h0):(1'h0)];
  assign wire15 = (wire13[(3'h4):(3'h4)] <= (+$signed(($unsigned(wire2) ?
                      $unsigned(wire12) : (wire1 > (8'hb6))))));
  assign wire16 = (((+(reg5 ?
                          (reg9 ? (8'hb0) : wire14) : wire10[(1'h0):(1'h0)])) ?
                      reg7 : (($unsigned((8'hb3)) ?
                              $unsigned(wire0) : ((8'hb7) - reg9)) ?
                          wire2 : ($unsigned(wire0) ?
                              (^wire10) : wire0))) & wire2);
  module17 #() modinst59 (wire58, clk, reg7, wire0, reg5, reg6, wire3);
  module60 #() modinst91 (wire90, clk, wire15, reg8, wire58, wire0, reg7);
endmodule

module module60
#(parameter param88 = ((-((^((8'hbd) + (8'hb3))) ^~ (~(~(8'h9d))))) > {(^(~&((8'hb3) >>> (8'ha9)))), (((~(8'h9f)) != (!(7'h44))) ? (|(^(8'h9f))) : (8'ha5))}), 
parameter param89 = {(!param88), {(((param88 == param88) ? ((8'hab) << param88) : {param88}) ? ((~|param88) ? (param88 ? param88 : (8'ha3)) : (param88 >= param88)) : (8'hb2)), {(8'hb4), param88}}})
(y, clk, wire65, wire64, wire63, wire62, wire61);
  output wire [(32'hf9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire65;
  input wire signed [(2'h2):(1'h0)] wire64;
  input wire [(5'h15):(1'h0)] wire63;
  input wire [(5'h11):(1'h0)] wire62;
  input wire [(4'ha):(1'h0)] wire61;
  wire [(3'h5):(1'h0)] wire87;
  wire signed [(4'he):(1'h0)] wire86;
  wire signed [(5'h12):(1'h0)] wire85;
  wire signed [(4'h9):(1'h0)] wire84;
  wire signed [(5'h13):(1'h0)] wire83;
  wire signed [(2'h2):(1'h0)] wire82;
  wire [(5'h12):(1'h0)] wire81;
  wire [(5'h12):(1'h0)] wire80;
  wire [(3'h4):(1'h0)] wire66;
  reg [(3'h5):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg78 = (1'h0);
  reg [(4'h8):(1'h0)] reg77 = (1'h0);
  reg [(4'hc):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg75 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg74 = (1'h0);
  reg signed [(4'he):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg72 = (1'h0);
  reg [(3'h5):(1'h0)] reg71 = (1'h0);
  reg [(4'ha):(1'h0)] reg70 = (1'h0);
  reg [(4'he):(1'h0)] reg69 = (1'h0);
  reg [(4'he):(1'h0)] reg68 = (1'h0);
  reg [(4'h8):(1'h0)] reg67 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire66,
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
                 reg68,
                 reg67,
                 (1'h0)};
  assign wire66 = $signed({(&((!wire65) ? $unsigned(wire65) : $signed(wire61))),
                      wire62});
  always
    @(posedge clk) begin
      if (wire65)
        begin
          if ((($unsigned($unsigned({wire62, (8'ha2)})) ^~ ($signed((wire63 ?
                  (7'h44) : wire62)) ^~ {(wire62 && wire61)})) ?
              ($unsigned({{wire62, wire61},
                  wire64}) - (^wire64[(2'h2):(1'h0)])) : ((~&$signed((wire65 || wire61))) >> (&{(wire63 | wire63),
                  wire61[(2'h3):(1'h0)]}))))
            begin
              reg67 <= wire66[(1'h0):(1'h0)];
              reg68 <= reg67;
              reg69 <= (reg68[(1'h1):(1'h0)] & (wire62 ?
                  wire64 : (wire64[(1'h1):(1'h0)] > ((8'hb4) << $unsigned(wire64)))));
              reg70 <= ($signed($unsigned({reg69})) ? wire62 : reg69);
            end
          else
            begin
              reg67 <= (~((wire62[(4'hd):(2'h3)] ?
                      $unsigned($unsigned(reg68)) : $signed((wire64 ^~ reg67))) ?
                  ($unsigned((reg69 >>> (8'hbf))) ?
                      ($signed(reg70) * ((7'h42) ^~ wire64)) : {{reg70}}) : wire61[(2'h2):(1'h0)]));
              reg68 <= (reg67[(1'h0):(1'h0)] && wire62[(3'h5):(2'h3)]);
              reg69 <= reg68[(4'hc):(4'h8)];
            end
          if (($signed($signed(reg67[(2'h2):(2'h2)])) - reg69))
            begin
              reg71 <= reg68[(4'h9):(3'h6)];
            end
          else
            begin
              reg71 <= ($unsigned(($unsigned($unsigned(wire65)) ?
                      ({reg70, wire66} ?
                          (reg69 ?
                              wire64 : reg70) : reg71[(1'h0):(1'h0)]) : reg69[(3'h7):(1'h1)])) ?
                  reg68 : wire61);
            end
          reg72 <= {wire65};
          reg73 <= (&$signed((($signed(reg70) ~^ wire61) + ($signed(reg72) ?
              $signed(reg67) : reg68))));
        end
      else
        begin
          reg67 <= $unsigned($unsigned(reg72[(3'h7):(3'h6)]));
          if ((~^(8'h9d)))
            begin
              reg68 <= $signed(($unsigned(wire65[(4'hb):(3'h6)]) <= reg68[(2'h3):(2'h2)]));
            end
          else
            begin
              reg68 <= reg73;
            end
        end
      reg74 <= reg73;
    end
  always
    @(posedge clk) begin
      if ($signed((&reg71[(2'h3):(1'h1)])))
        begin
          reg75 <= (reg73[(3'h4):(3'h4)] | (wire65 ?
              $unsigned((8'ha2)) : reg73));
        end
      else
        begin
          reg75 <= $signed(($unsigned($signed({reg71, wire64})) <= (((wire66 ?
                      wire61 : wire64) ?
                  $unsigned(reg71) : (reg73 ? (8'haa) : reg69)) ?
              wire64[(1'h1):(1'h1)] : {$unsigned(wire63)})));
        end
      reg76 <= (~{$signed($unsigned($signed(wire64))),
          (($signed(wire66) && $signed(reg68)) ?
              $unsigned((~wire66)) : reg72)});
      reg77 <= $unsigned(((8'ha0) >>> (|({wire65,
          reg73} > wire65[(1'h1):(1'h0)]))));
      reg78 <= $unsigned((+(8'h9f)));
      reg79 <= (^(~^($signed((!reg69)) <<< $signed((^reg74)))));
    end
  assign wire80 = $signed(($signed({$signed(reg79)}) * {(((8'hba) ^ wire63) ?
                          $unsigned(reg72) : (reg74 >= (8'ha1))),
                      (~(&reg76))}));
  assign wire81 = $unsigned($signed($unsigned(reg71)));
  assign wire82 = wire80[(5'h12):(2'h2)];
  assign wire83 = $unsigned($unsigned(reg79));
  assign wire84 = $unsigned($unsigned((((reg78 ? reg71 : (8'haf)) ?
                      (+reg71) : $unsigned(wire62)) ~^ (8'ha6))));
  assign wire85 = $unsigned(((reg77 ?
                          $signed(reg71) : ((|(8'ha0)) << $unsigned((8'hac)))) ?
                      {wire65,
                          (-wire80[(2'h3):(1'h0)])} : reg69[(4'hc):(3'h6)]));
  assign wire86 = (7'h43);
  assign wire87 = (8'hbb);
endmodule

module module17
#(parameter param56 = (({((|(7'h43)) ? (|(8'hac)) : {(8'hb7), (8'h9f)})} ? ({((8'hae) == (7'h43)), {(8'hbe), (8'haa)}} * (((8'hb7) && (7'h40)) ? (~^(8'hac)) : ((8'h9d) ? (8'ha3) : (8'ha6)))) : ((~&{(8'had), (8'ha7)}) ? ((8'h9e) ? {(8'hbe)} : ((8'hb7) + (7'h43))) : (|(8'ha4)))) | (~^(!({(7'h41)} <= {(8'ha2)})))), 
parameter param57 = ((param56 ? (((param56 ? param56 : param56) >= (param56 << param56)) ? ((~param56) ? (-param56) : (8'ha1)) : (&((8'hb3) ? param56 : param56))) : (^((param56 ? param56 : param56) ? (-param56) : {param56, param56}))) ? {(^~{(param56 ? param56 : param56), (param56 || param56)}), ({param56} ? param56 : ((param56 == (7'h44)) ? (&param56) : param56))} : ((~|{(param56 ^ (8'had)), ((8'h9c) - param56)}) ? (8'hb0) : (^{(param56 ? param56 : param56), {(8'hb8), param56}}))))
(y, clk, wire18, wire19, wire20, wire21, wire22);
  output wire [(32'h5c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire18;
  input wire signed [(3'h4):(1'h0)] wire19;
  input wire [(5'h10):(1'h0)] wire20;
  input wire signed [(2'h3):(1'h0)] wire21;
  input wire [(3'h5):(1'h0)] wire22;
  wire [(5'h11):(1'h0)] wire55;
  wire [(2'h3):(1'h0)] wire54;
  wire [(2'h2):(1'h0)] wire53;
  wire signed [(4'hf):(1'h0)] wire23;
  wire [(4'hf):(1'h0)] wire27;
  wire signed [(4'h8):(1'h0)] wire51;
  reg [(4'ha):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg25 = (1'h0);
  reg [(5'h11):(1'h0)] reg26 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire53,
                 wire23,
                 wire27,
                 wire51,
                 reg24,
                 reg25,
                 reg26,
                 (1'h0)};
  assign wire23 = {(wire20[(1'h1):(1'h1)] ?
                          $unsigned((&wire18[(2'h2):(1'h1)])) : $unsigned(((wire21 + wire22) + ((8'hb1) < wire20))))};
  always
    @(posedge clk) begin
      reg24 <= $unsigned((($unsigned((~&wire19)) | {(wire21 ?
              (8'haf) : wire22)}) > wire23[(3'h5):(3'h4)]));
      reg25 <= wire21[(2'h2):(1'h1)];
      reg26 <= wire20;
    end
  assign wire27 = (reg26[(3'h4):(2'h2)] > $signed((-wire18[(3'h5):(1'h1)])));
  module28 #() modinst52 (wire51, clk, wire18, wire27, reg26, wire19);
  assign wire53 = (^$unsigned((-{(|wire51), wire51})));
  assign wire54 = $unsigned($signed(($signed({reg24}) ?
                      ($unsigned(reg26) == (~&wire22)) : wire51)));
  assign wire55 = wire23;
endmodule

module module28  (y, clk, wire32, wire31, wire30, wire29);
  output wire [(32'hda):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire32;
  input wire [(4'hf):(1'h0)] wire31;
  input wire signed [(5'h11):(1'h0)] wire30;
  input wire signed [(2'h2):(1'h0)] wire29;
  wire signed [(5'h14):(1'h0)] wire50;
  wire signed [(4'h9):(1'h0)] wire49;
  wire [(5'h12):(1'h0)] wire48;
  wire signed [(3'h4):(1'h0)] wire47;
  wire [(5'h15):(1'h0)] wire46;
  wire signed [(5'h11):(1'h0)] wire45;
  wire signed [(5'h15):(1'h0)] wire44;
  wire signed [(3'h6):(1'h0)] wire43;
  wire signed [(4'hc):(1'h0)] wire42;
  wire signed [(5'h15):(1'h0)] wire41;
  wire [(5'h10):(1'h0)] wire40;
  wire [(3'h7):(1'h0)] wire39;
  wire signed [(2'h3):(1'h0)] wire38;
  wire [(3'h7):(1'h0)] wire37;
  wire [(5'h11):(1'h0)] wire36;
  wire [(2'h2):(1'h0)] wire35;
  wire [(4'hb):(1'h0)] wire34;
  wire [(3'h5):(1'h0)] wire33;
  assign y = {wire50,
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
  assign wire33 = wire32[(5'h10):(3'h5)];
  assign wire34 = {$unsigned({(|(7'h43))}), $unsigned(wire32[(3'h7):(3'h5)])};
  assign wire35 = (~|wire30);
  assign wire36 = ($unsigned(($unsigned(wire32) > (&(!wire31)))) ?
                      (~|$unsigned(($unsigned(wire31) * (wire30 >= wire35)))) : wire35[(1'h0):(1'h0)]);
  assign wire37 = ({$signed($signed(((8'hbf) ~^ wire32)))} << (~&wire34[(4'h8):(1'h1)]));
  assign wire38 = wire31[(3'h4):(2'h2)];
  assign wire39 = (8'h9d);
  assign wire40 = (wire34[(2'h3):(2'h2)] ?
                      (+($unsigned($signed((8'hbe))) > wire30)) : wire34[(4'h9):(4'h8)]);
  assign wire41 = $signed(wire34);
  assign wire42 = ($signed(({$signed(wire38), ((8'had) ? wire29 : wire33)} ?
                          $signed((^wire31)) : $signed(wire34))) ?
                      wire39[(1'h0):(1'h0)] : ({wire35[(2'h2):(1'h0)]} & ($signed($unsigned(wire38)) ?
                          $unsigned({wire37}) : $signed($unsigned(wire33)))));
  assign wire43 = (~($signed({wire40[(4'he):(4'ha)],
                          (wire42 ? (8'ha7) : wire42)}) ?
                      $signed({wire40, (~wire42)}) : $unsigned($signed((wire29 ?
                          wire42 : wire32)))));
  assign wire44 = $unsigned({wire37[(1'h1):(1'h0)]});
  assign wire45 = wire41[(1'h1):(1'h0)];
  assign wire46 = (^~(wire32[(3'h6):(2'h2)] + wire35));
  assign wire47 = wire38;
  assign wire48 = $signed(((8'hb7) - ((wire46[(3'h6):(2'h2)] ?
                          (-(7'h42)) : {(8'hb7), wire36}) ?
                      {(-wire31), $signed(wire34)} : ((8'hb7) ?
                          wire42[(4'hb):(4'h8)] : $signed(wire34)))));
  assign wire49 = wire41;
  assign wire50 = $unsigned((wire48[(5'h12):(4'hb)] ?
                      (wire37[(3'h7):(1'h1)] && (!wire34[(3'h4):(3'h4)])) : wire41));
endmodule
