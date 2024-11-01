module top
#(parameter param96 = ({((((8'h9c) ? (8'hb3) : (8'hbd)) | ((7'h40) ? (7'h44) : (8'ha7))) ? ((~|(8'ha8)) <= (+(7'h41))) : {((8'had) ? (8'hb0) : (8'had)), (8'ha0)})} ~^ ((~&(((8'had) << (8'ha4)) ? (|(8'haf)) : ((8'hae) << (8'ha9)))) <<< (((^(8'ha6)) && ((8'haf) != (7'h40))) * ({(8'hb6)} ? ((8'ha2) == (8'h9f)) : ((8'hbb) & (8'hb3)))))), 
parameter param97 = (((((+(8'ha0)) >>> (param96 | param96)) <<< param96) - ((8'hbc) + param96)) >> (-(&param96))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h140):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire0;
  input wire [(4'h8):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire3;
  wire signed [(4'ha):(1'h0)] wire84;
  wire signed [(2'h2):(1'h0)] wire78;
  wire signed [(4'hd):(1'h0)] wire77;
  wire signed [(5'h11):(1'h0)] wire75;
  reg [(4'hd):(1'h0)] reg95 = (1'h0);
  reg [(4'he):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg93 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg91 = (1'h0);
  reg [(5'h10):(1'h0)] reg90 = (1'h0);
  reg [(4'hc):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg86 = (1'h0);
  reg [(4'he):(1'h0)] reg85 = (1'h0);
  reg [(4'hb):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg82 = (1'h0);
  reg [(4'hc):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg79 = (1'h0);
  reg [(4'he):(1'h0)] reg4 = (1'h0);
  reg signed [(4'he):(1'h0)] reg5 = (1'h0);
  reg [(5'h15):(1'h0)] reg6 = (1'h0);
  assign y = {wire84,
                 wire78,
                 wire77,
                 wire75,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg4,
                 reg5,
                 reg6,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= ((^$signed($unsigned((wire3 ?
          (8'ha1) : wire1)))) <<< $unsigned($unsigned(wire1)));
      reg5 <= ($unsigned(wire2) ?
          {{$signed(wire1), wire3}} : ((wire1 ?
              ($unsigned(wire1) | wire3) : (+(reg4 ?
                  wire3 : (8'h9d)))) ^~ (reg4 ~^ ((wire1 ^~ wire0) > {wire3}))));
      reg6 <= $unsigned(wire2[(1'h1):(1'h1)]);
    end
  module7 #() modinst76 (wire75, clk, wire3, reg5, reg4, reg6);
  assign wire77 = ((~$signed($signed((+wire75)))) ~^ ((8'hb8) ?
                      (8'hba) : $signed(wire1)));
  assign wire78 = (wire75 ?
                      ((~|$signed((+reg4))) + $unsigned($signed({wire0}))) : $unsigned({$signed((-wire2))}));
  always
    @(posedge clk) begin
      reg79 <= ((^~wire78[(1'h0):(1'h0)]) - (^$unsigned((~|reg4))));
      reg80 <= $signed($signed((^$unsigned(wire77))));
      if ($signed((~(((|reg6) ? (~reg79) : (-(8'hb4))) ?
          ($signed(wire77) == (|reg5)) : $unsigned({reg79, (8'hb9)})))))
        begin
          reg81 <= wire2;
          reg82 <= (reg81 << ($signed($unsigned((~&wire1))) ?
              (reg5 ^~ $unsigned((~&(8'ha0)))) : ($unsigned($signed((8'hb5))) && wire3[(4'ha):(4'ha)])));
        end
      else
        begin
          reg81 <= (($signed($signed((~reg81))) - $unsigned((8'ha5))) ?
              (!reg5) : ((|(!wire75)) ?
                  reg5 : $signed($signed(((8'hb5) ? wire78 : wire1)))));
          reg82 <= $signed($unsigned({($signed(wire0) ?
                  (wire1 || wire2) : (~|reg4))}));
        end
      reg83 <= (+(wire2 && ((7'h43) ^ (&$signed(wire0)))));
    end
  assign wire84 = {((reg82[(4'hf):(2'h3)] ?
                              ((wire1 >>> reg6) ?
                                  $signed(wire78) : reg80[(4'ha):(3'h4)]) : (reg81[(4'ha):(3'h7)] < reg6[(2'h3):(2'h2)])) ?
                          ((8'hbd) ?
                              (!((8'hb1) != wire75)) : reg80[(4'hc):(2'h2)]) : {{(reg80 <<< wire77),
                                  $signed((8'hae))},
                              (~$unsigned(wire1))}),
                      reg6};
  always
    @(posedge clk) begin
      if ({{wire84[(2'h3):(1'h1)], wire2[(1'h0):(1'h0)]},
          ((wire2 ? {$signed(wire3), reg80} : $signed((~&reg6))) ?
              (~^$unsigned((|reg6))) : (8'hbd))})
        begin
          reg85 <= (8'hb9);
          reg86 <= {{(^$signed($signed((8'hb1))))},
              {$unsigned($unsigned(reg83))}};
          reg87 <= (((|((reg80 ? wire3 : wire3) ~^ {reg4, reg83})) ?
                  (wire3[(3'h7):(3'h4)] ?
                      $unsigned($signed(wire84)) : ($signed(reg83) ?
                          ((7'h42) >>> reg80) : (reg86 <<< (8'hab)))) : reg83) ?
              reg85 : $signed($unsigned({(wire78 ~^ reg85),
                  (reg80 ? reg5 : reg83)})));
          reg88 <= $signed(reg86);
        end
      else
        begin
          if (wire3[(4'hf):(4'h9)])
            begin
              reg85 <= {{(-wire2), $signed($signed(reg83[(4'h8):(2'h2)]))}};
              reg86 <= reg85[(4'ha):(2'h3)];
              reg87 <= ((reg4 ?
                  reg81 : ((+{reg6}) ?
                      $unsigned($unsigned(wire78)) : ((wire77 ^ reg80) ?
                          (reg83 ?
                              wire1 : (8'h9d)) : reg86))) ~^ $unsigned(wire84));
              reg88 <= wire77;
              reg89 <= (~|$unsigned($signed(((wire2 ?
                  reg87 : reg86) && $unsigned(wire75)))));
            end
          else
            begin
              reg85 <= reg5[(1'h1):(1'h0)];
            end
          reg90 <= {wire77[(4'hc):(3'h7)]};
        end
      if ($signed((reg6[(5'h10):(5'h10)] ?
          (({wire1} + (reg4 ?
              reg87 : (8'hb5))) <= reg85[(4'hd):(4'hc)]) : reg86[(3'h7):(2'h2)])))
        begin
          reg91 <= (reg5[(4'hd):(2'h3)] ?
              ($signed(((reg79 <<< wire1) <= (reg86 + reg86))) >>> reg80) : reg85);
          reg92 <= $signed(((!(reg5 | wire84[(2'h2):(2'h2)])) ~^ $unsigned($signed(reg82))));
        end
      else
        begin
          reg91 <= $signed(reg83[(2'h2):(1'h1)]);
        end
      reg93 <= {$signed(reg4[(3'h5):(3'h5)])};
      reg94 <= $unsigned($unsigned(reg88));
      reg95 <= $signed($unsigned($signed({reg94})));
    end
endmodule

module module7
#(parameter param74 = (+({(^(^(7'h40))), (~&(!(8'hab)))} >> {(((8'hb1) ^ (8'hab)) && ((8'had) ? (8'hac) : (8'h9e))), ((^~(7'h43)) ? (-(8'hb3)) : ((8'hb1) ? (8'ha8) : (8'hb4)))})))
(y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'h165):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire11;
  input wire signed [(4'h8):(1'h0)] wire10;
  input wire signed [(4'hc):(1'h0)] wire9;
  input wire [(4'hc):(1'h0)] wire8;
  wire signed [(3'h4):(1'h0)] wire73;
  wire [(2'h2):(1'h0)] wire72;
  wire signed [(4'he):(1'h0)] wire46;
  wire signed [(5'h11):(1'h0)] wire30;
  wire signed [(5'h14):(1'h0)] wire29;
  wire [(5'h12):(1'h0)] wire28;
  wire signed [(5'h12):(1'h0)] wire27;
  wire signed [(4'ha):(1'h0)] wire15;
  wire [(5'h11):(1'h0)] wire14;
  wire [(4'hd):(1'h0)] wire13;
  wire [(4'hf):(1'h0)] wire12;
  wire [(4'hd):(1'h0)] wire48;
  wire signed [(3'h5):(1'h0)] wire49;
  wire signed [(4'ha):(1'h0)] wire50;
  wire signed [(5'h15):(1'h0)] wire51;
  wire signed [(2'h3):(1'h0)] wire52;
  wire signed [(3'h6):(1'h0)] wire53;
  wire signed [(3'h5):(1'h0)] wire54;
  wire signed [(4'ha):(1'h0)] wire55;
  wire signed [(3'h6):(1'h0)] wire70;
  reg [(3'h5):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg17 = (1'h0);
  reg [(4'h9):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg19 = (1'h0);
  reg [(3'h7):(1'h0)] reg20 = (1'h0);
  reg [(4'hb):(1'h0)] reg21 = (1'h0);
  reg [(4'h9):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  reg [(4'hb):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg26 = (1'h0);
  assign y = {wire73,
                 wire72,
                 wire46,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire48,
                 wire49,
                 wire50,
                 wire51,
                 wire52,
                 wire53,
                 wire54,
                 wire55,
                 wire70,
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
                 reg26,
                 (1'h0)};
  assign wire12 = wire9;
  assign wire13 = (wire8[(2'h2):(2'h2)] + (~wire10));
  assign wire14 = $signed(wire10[(2'h2):(1'h0)]);
  assign wire15 = (|(|$signed(({wire11, wire13} * $unsigned(wire11)))));
  always
    @(posedge clk) begin
      reg16 <= $unsigned($signed((wire8 + (~&$unsigned((7'h44))))));
      reg17 <= $unsigned($signed(wire14[(3'h7):(2'h3)]));
      if ((~^(wire8 ? (-(-(8'hbe))) : (^~((wire9 > wire9) >= $signed(reg16))))))
        begin
          reg18 <= $signed({wire13[(4'hd):(4'h9)]});
          reg19 <= ((8'hbe) ?
              ((reg16 ?
                      ($unsigned((8'ha9)) + $signed(reg16)) : ((~|wire10) & $unsigned((8'ha2)))) ?
                  (~&(7'h41)) : (^~$signed({wire13, wire9}))) : (-(wire9 ?
                  ((wire10 < reg18) ?
                      (wire14 ~^ wire8) : {wire13,
                          wire11}) : $signed((-(8'hb1))))));
          if (wire12[(1'h1):(1'h1)])
            begin
              reg20 <= (($signed((8'hb6)) ?
                  reg16 : wire12[(1'h1):(1'h1)]) << (&$signed($unsigned((+reg18)))));
            end
          else
            begin
              reg20 <= (&$signed(((&wire14[(4'he):(4'hd)]) ?
                  {(wire13 & reg19), (wire9 ? wire11 : reg16)} : (-(wire12 ?
                      reg18 : wire11)))));
              reg21 <= reg17;
              reg22 <= (~&($signed($signed({reg16, wire15})) - reg18));
            end
        end
      else
        begin
          reg18 <= wire13;
          reg19 <= ((-{((reg20 <= reg22) - (reg19 ?
                  reg20 : reg16))}) ^~ (7'h44));
          if (wire8)
            begin
              reg20 <= (7'h40);
              reg21 <= (+$unsigned((((reg18 << wire10) ~^ $unsigned(wire12)) <= reg19)));
            end
          else
            begin
              reg20 <= $signed((8'hab));
            end
          reg22 <= $unsigned({reg21[(3'h6):(2'h3)]});
        end
      reg23 <= $signed((8'hac));
    end
  always
    @(posedge clk) begin
      reg24 <= $signed((8'h9d));
      reg25 <= $unsigned($unsigned(reg24));
      reg26 <= $unsigned(($unsigned(($signed(reg25) ?
          (reg23 ?
              wire9 : (8'hba)) : wire12[(2'h2):(2'h2)])) | (wire11[(4'h9):(3'h6)] | $signed(((8'ha0) ?
          reg19 : reg19)))));
    end
  assign wire27 = (^$signed(reg22[(2'h3):(2'h2)]));
  assign wire28 = $unsigned($signed(wire9));
  assign wire29 = reg25;
  assign wire30 = reg24[(3'h7):(1'h1)];
  module31 #() modinst47 (.clk(clk), .wire34(reg18), .wire33(reg19), .wire35(reg17), .wire32(wire30), .y(wire46));
  assign wire48 = (~|$signed($signed({(wire11 ? wire29 : (8'ha5)),
                      {(8'hb2)}})));
  assign wire49 = reg23;
  assign wire50 = ($signed(({wire10, ((7'h41) - wire12)} ?
                          (reg19 >>> (wire8 ?
                              wire13 : wire10)) : (wire11[(4'h9):(1'h1)] ^ (-(7'h43))))) ?
                      wire46 : $signed(reg19[(3'h6):(3'h5)]));
  assign wire51 = wire49;
  assign wire52 = (wire30[(2'h2):(1'h1)] ?
                      (wire27[(1'h1):(1'h1)] ?
                          {(wire29[(3'h5):(3'h5)] ?
                                  (!wire8) : $unsigned((8'hb2))),
                              $unsigned($signed((8'hb1)))} : $unsigned((&$signed((8'had))))) : (~&wire49));
  assign wire53 = $signed((reg24 ? wire52 : $signed((|{(8'hb5), (8'hae)}))));
  assign wire54 = wire27[(3'h4):(3'h4)];
  assign wire55 = {(reg18[(3'h7):(3'h6)] < {$signed(((7'h42) & wire30))})};
  module56 #() modinst71 (wire70, clk, wire12, reg19, wire27, wire9, reg21);
  assign wire72 = ($signed((!($unsigned(wire52) * {(8'hb6), reg23}))) << reg23);
  assign wire73 = (+reg21[(4'ha):(4'h8)]);
endmodule

module module56  (y, clk, wire61, wire60, wire59, wire58, wire57);
  output wire [(32'h67):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire61;
  input wire signed [(4'hd):(1'h0)] wire60;
  input wire [(5'h12):(1'h0)] wire59;
  input wire signed [(4'hc):(1'h0)] wire58;
  input wire [(3'h5):(1'h0)] wire57;
  wire [(4'hb):(1'h0)] wire69;
  wire signed [(5'h13):(1'h0)] wire68;
  wire [(4'h8):(1'h0)] wire67;
  wire [(2'h3):(1'h0)] wire66;
  wire [(4'hd):(1'h0)] wire65;
  wire signed [(4'hd):(1'h0)] wire64;
  wire [(5'h13):(1'h0)] wire63;
  wire [(5'h10):(1'h0)] wire62;
  assign y = {wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 (1'h0)};
  assign wire62 = wire59;
  assign wire63 = wire58[(1'h1):(1'h0)];
  assign wire64 = wire62;
  assign wire65 = ((($unsigned({wire60}) ?
                          wire63 : ((~^wire62) >> $signed((8'h9c)))) <<< $signed($signed({(8'had),
                          wire57}))) ?
                      (7'h44) : wire64[(4'h8):(3'h7)]);
  assign wire66 = $unsigned((^(($unsigned(wire64) ?
                          $unsigned(wire60) : wire63) ?
                      wire61[(4'h8):(3'h4)] : $signed((wire60 + (8'hbb))))));
  assign wire67 = $signed(($signed(wire63) ?
                      ($unsigned(wire61[(2'h3):(2'h2)]) ^ $unsigned(wire58)) : ({(&wire62)} ?
                          $unsigned(wire57[(2'h3):(1'h1)]) : ((~&(8'hb5)) ?
                              $unsigned(wire66) : (wire63 < wire61)))));
  assign wire68 = ((($signed($unsigned(wire66)) == wire67) ?
                          wire58[(1'h0):(1'h0)] : (|(~wire59[(3'h6):(3'h5)]))) ?
                      $signed({wire63}) : ((wire61 ?
                          wire60 : wire57) ^~ $unsigned($unsigned($unsigned(wire63)))));
  assign wire69 = wire65[(3'h6):(3'h5)];
endmodule

module module31
#(parameter param44 = (({{{(8'hb0), (8'hb1)}, (!(8'had))}} ? ((8'hb7) ? ((~|(8'hbb)) != {(8'hb6)}) : (+{(8'hbb)})) : ((&((8'hac) <= (8'ha0))) ? {(&(8'hbc)), {(8'ha3)}} : (~^{(8'ha2), (8'hb3)}))) ^ (8'hb4)), 
parameter param45 = (8'hbf))
(y, clk, wire35, wire34, wire33, wire32);
  output wire [(32'h48):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire35;
  input wire signed [(4'h9):(1'h0)] wire34;
  input wire signed [(5'h12):(1'h0)] wire33;
  input wire signed [(4'hc):(1'h0)] wire32;
  wire signed [(5'h10):(1'h0)] wire42;
  wire [(4'h8):(1'h0)] wire41;
  wire signed [(3'h5):(1'h0)] wire40;
  wire signed [(2'h3):(1'h0)] wire39;
  wire [(3'h5):(1'h0)] wire38;
  wire [(4'ha):(1'h0)] wire37;
  wire [(5'h11):(1'h0)] wire36;
  reg [(3'h7):(1'h0)] reg43 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 reg43,
                 (1'h0)};
  assign wire36 = $unsigned((~|{(8'ha4)}));
  assign wire37 = wire33;
  assign wire38 = $signed(($unsigned((^~$unsigned(wire34))) ~^ (+$unsigned(wire37[(2'h3):(1'h0)]))));
  assign wire39 = ($signed((^~(-wire33))) ?
                      $signed(wire37) : $unsigned((wire37[(1'h0):(1'h0)] ?
                          wire35[(5'h13):(1'h0)] : $signed({(8'h9f)}))));
  assign wire40 = $signed((!$signed(((wire36 ? (8'ha0) : wire33) ?
                      (~wire35) : wire34[(3'h4):(1'h1)]))));
  assign wire41 = (wire37 ?
                      (~&(-(wire32[(3'h5):(2'h3)] ?
                          $signed(wire39) : $signed((8'hb9))))) : $signed((|($unsigned((8'h9d)) ?
                          ((8'ha9) << wire40) : wire36))));
  assign wire42 = (&$unsigned($unsigned($signed(((8'hb9) << (7'h44))))));
  always
    @(posedge clk) begin
      reg43 <= wire34[(3'h5):(1'h0)];
    end
endmodule
