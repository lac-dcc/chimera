module top
#(parameter param67 = ((((((8'ha5) << (8'ha5)) ? (^~(7'h40)) : {(8'haa)}) ? (~|((8'hb2) + (7'h44))) : (((8'ha8) <<< (7'h42)) >>> ((8'ha9) & (8'ha7)))) <<< ((((8'hac) * (7'h43)) * {(7'h43), (8'hbd)}) ? ({(7'h41)} ? {(8'ha2), (8'hbc)} : (!(8'ha6))) : (8'hbe))) * (({((8'ha2) ? (8'ha8) : (8'hb4)), ((8'h9f) ^~ (8'hb6))} ? ((^~(8'hb6)) ~^ ((8'hbd) ? (8'haa) : (8'hb1))) : {(|(8'hbb))}) * (!(!(+(8'hbf)))))), 
parameter param68 = ((param67 && (7'h42)) ? {param67, ((param67 >>> ((8'ha3) ? param67 : (7'h42))) ? ((param67 < param67) - (|(8'hb3))) : param67)} : ((~^((param67 < param67) ? (param67 || param67) : (param67 ? param67 : param67))) ? (param67 != ((~param67) ? (param67 << param67) : param67)) : (^param67))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hfe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire65;
  wire signed [(4'he):(1'h0)] wire63;
  wire [(3'h4):(1'h0)] wire20;
  wire signed [(4'h9):(1'h0)] wire5;
  wire signed [(3'h5):(1'h0)] wire4;
  reg [(5'h14):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg6 = (1'h0);
  reg [(4'ha):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg8 = (1'h0);
  reg [(4'h8):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  reg [(4'ha):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg15 = (1'h0);
  reg [(3'h6):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg18 = (1'h0);
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  assign y = {wire65,
                 wire63,
                 wire20,
                 wire5,
                 wire4,
                 reg66,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 (1'h0)};
  assign wire4 = ($unsigned((wire2 ? wire3[(2'h2):(1'h1)] : $signed(wire0))) ?
                     ((~^wire3[(3'h6):(3'h6)]) - wire2) : wire1[(3'h4):(2'h2)]);
  assign wire5 = ((~&wire2[(3'h6):(3'h4)]) >= wire0);
  always
    @(posedge clk) begin
      reg6 <= ($signed({{{wire5, wire2}, $unsigned(wire3)}}) ?
          $unsigned((-wire5)) : $unsigned($signed($signed((wire4 ?
              wire3 : wire1)))));
      if ((reg6[(1'h1):(1'h0)] ?
          {($signed((8'haf)) << $unsigned($signed(wire1))),
              $unsigned((^wire0[(4'he):(4'hd)]))} : (wire1[(4'ha):(1'h1)] ?
              $signed(wire5) : $unsigned((wire3[(2'h3):(1'h0)] ?
                  (wire4 + wire2) : (wire3 ^ wire5))))))
        begin
          reg7 <= wire4;
        end
      else
        begin
          reg7 <= wire2;
          if (reg6)
            begin
              reg8 <= $signed((((~{wire3, wire1}) ?
                  {$unsigned(reg7)} : (^(reg7 ?
                      wire2 : wire2))) >= $unsigned($unsigned($unsigned(reg7)))));
              reg9 <= wire5;
            end
          else
            begin
              reg8 <= $unsigned(wire4);
              reg9 <= {((wire3[(3'h5):(3'h5)] ?
                      (~(wire4 - reg6)) : $unsigned($signed(wire4))) >>> reg9)};
            end
          reg10 <= reg8;
          reg11 <= (wire3[(2'h3):(2'h3)] ?
              {reg8[(4'hd):(4'ha)]} : ($unsigned($signed((reg8 >>> reg7))) <= (wire0 ?
                  reg7[(3'h6):(3'h5)] : (wire1[(4'ha):(3'h6)] ?
                      (reg8 && (8'ha7)) : $signed(wire2)))));
        end
      reg12 <= wire3[(3'h6):(2'h3)];
      if ($unsigned((^reg10[(2'h2):(1'h0)])))
        begin
          reg13 <= $signed(wire0);
          reg14 <= ($unsigned(wire3[(3'h4):(2'h2)]) >> {($unsigned($unsigned(reg11)) ?
                  reg12 : $unsigned((~^(8'ha6)))),
              ((8'hb0) ? $signed(reg7) : $unsigned($signed(reg13)))});
          reg15 <= (+(^(!(reg7 >= $signed((7'h41))))));
          reg16 <= $unsigned({reg8[(3'h7):(1'h0)], (7'h40)});
          reg17 <= $unsigned((($unsigned(reg7) ^ reg16[(1'h0):(1'h0)]) || reg11));
        end
      else
        begin
          reg13 <= wire4;
          if ((~&(wire0 >>> $signed(reg7[(2'h3):(1'h1)]))))
            begin
              reg14 <= reg11;
              reg15 <= ($unsigned((~(((8'ha8) ?
                  reg15 : (8'h9e)) >>> (reg6 << (7'h42))))) < $signed((({reg12,
                      reg7} == (~reg14)) ?
                  reg8 : $signed((reg13 >>> wire3)))));
            end
          else
            begin
              reg14 <= (!(wire4 ?
                  $signed($unsigned(reg17)) : $unsigned((reg17 + (8'hab)))));
              reg15 <= wire2;
              reg16 <= $signed($signed(reg17));
            end
          reg17 <= (8'hb5);
          reg18 <= ($unsigned(($unsigned(reg17) ?
                  (~&(reg8 ? wire4 : reg7)) : (~^(reg12 ? (7'h44) : wire2)))) ?
              ((^~reg6[(1'h0):(1'h0)]) ?
                  $unsigned((reg14 || (reg8 ?
                      wire4 : reg17))) : {$unsigned($signed(reg7)),
                      (wire5 < $signed(wire3))}) : {$unsigned({(~^reg7)}),
                  $signed($signed($unsigned(reg9)))});
        end
      reg19 <= (7'h40);
    end
  assign wire20 = wire4;
  module21 #() modinst64 (.y(wire63), .clk(clk), .wire23(wire5), .wire26(reg9), .wire25(wire2), .wire24(reg6), .wire22(reg19));
  assign wire65 = (~reg6[(4'ha):(1'h0)]);
  always
    @(posedge clk) begin
      reg66 <= $unsigned(((&{reg12}) < {($unsigned(reg16) > (reg7 ?
              (8'hb2) : wire4)),
          (|$signed(reg19))}));
    end
endmodule

module module21
#(parameter param62 = (8'hb7))
(y, clk, wire22, wire23, wire24, wire25, wire26);
  output wire [(32'h55):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire22;
  input wire signed [(2'h2):(1'h0)] wire23;
  input wire [(5'h15):(1'h0)] wire24;
  input wire [(4'hb):(1'h0)] wire25;
  input wire [(4'h8):(1'h0)] wire26;
  wire signed [(5'h15):(1'h0)] wire61;
  wire signed [(3'h7):(1'h0)] wire60;
  wire [(3'h6):(1'h0)] wire59;
  wire [(2'h2):(1'h0)] wire58;
  wire signed [(3'h7):(1'h0)] wire57;
  wire signed [(3'h7):(1'h0)] wire56;
  wire [(3'h4):(1'h0)] wire55;
  wire signed [(4'hc):(1'h0)] wire54;
  wire [(4'hc):(1'h0)] wire53;
  wire [(2'h2):(1'h0)] wire52;
  wire signed [(3'h4):(1'h0)] wire50;
  assign y = {wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire50,
                 (1'h0)};
  module27 #() modinst51 (wire50, clk, wire24, wire23, wire26, wire25, wire22);
  assign wire52 = (|$signed($signed(($signed(wire22) * wire50[(1'h0):(1'h0)]))));
  assign wire53 = wire25;
  assign wire54 = wire52;
  assign wire55 = wire23;
  assign wire56 = ($unsigned(($signed(wire52[(1'h0):(1'h0)]) - ($signed(wire53) + (~wire23)))) >> (~^wire22));
  assign wire57 = wire26[(1'h0):(1'h0)];
  assign wire58 = wire57[(3'h5):(1'h1)];
  assign wire59 = $unsigned((wire50 ?
                      wire26[(3'h6):(3'h5)] : (|$unsigned(wire26[(3'h5):(2'h2)]))));
  assign wire60 = (~^wire25);
  assign wire61 = $signed(wire24[(4'hf):(4'h9)]);
endmodule

module module27  (y, clk, wire32, wire31, wire30, wire29, wire28);
  output wire [(32'h99):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire32;
  input wire signed [(2'h2):(1'h0)] wire31;
  input wire signed [(2'h2):(1'h0)] wire30;
  input wire signed [(4'hb):(1'h0)] wire29;
  input wire signed [(3'h5):(1'h0)] wire28;
  wire [(4'h9):(1'h0)] wire49;
  wire signed [(4'h9):(1'h0)] wire48;
  wire signed [(4'hc):(1'h0)] wire47;
  wire signed [(3'h6):(1'h0)] wire46;
  wire signed [(5'h13):(1'h0)] wire45;
  wire [(5'h15):(1'h0)] wire44;
  wire signed [(3'h6):(1'h0)] wire43;
  wire [(2'h2):(1'h0)] wire42;
  wire signed [(2'h2):(1'h0)] wire41;
  wire [(4'hc):(1'h0)] wire40;
  wire signed [(3'h4):(1'h0)] wire39;
  wire signed [(2'h2):(1'h0)] wire38;
  wire signed [(4'hb):(1'h0)] wire34;
  wire signed [(4'h8):(1'h0)] wire33;
  reg signed [(4'hb):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg36 = (1'h0);
  reg [(2'h2):(1'h0)] reg35 = (1'h0);
  assign y = {wire49,
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
                 wire34,
                 wire33,
                 reg37,
                 reg36,
                 reg35,
                 (1'h0)};
  assign wire33 = (|$signed(wire32[(1'h0):(1'h0)]));
  assign wire34 = ((^((((8'h9e) - wire28) ?
                      $unsigned(wire29) : wire30) * ($unsigned(wire28) ?
                      $unsigned(wire31) : $unsigned(wire28)))) >> wire31[(2'h2):(2'h2)]);
  always
    @(posedge clk) begin
      reg35 <= (wire31[(1'h0):(1'h0)] ?
          (wire34 ?
              $unsigned((|(wire32 == (8'ha1)))) : wire28) : ($unsigned(wire29[(2'h2):(1'h1)]) ?
              wire30 : (wire33 > {(wire32 ? wire31 : wire28),
                  $unsigned(wire34)})));
      reg36 <= (^~$unsigned((({wire34, wire33} >>> ((8'hb5) ?
          (8'hbf) : wire34)) <= (wire31 + $signed(wire29)))));
      reg37 <= wire29[(4'h9):(3'h5)];
    end
  assign wire38 = $signed((({$unsigned(wire32),
                          (wire31 ? wire34 : wire29)} <= ((reg35 ?
                              reg35 : wire34) ?
                          $unsigned(reg37) : $signed(wire34))) ?
                      wire34[(4'hb):(4'ha)] : $signed(wire34)));
  assign wire39 = $signed($unsigned({(wire28 ? (wire38 > wire31) : wire38)}));
  assign wire40 = (~&reg37[(4'ha):(3'h4)]);
  assign wire41 = {wire40[(3'h7):(3'h7)], wire31};
  assign wire42 = (8'hbf);
  assign wire43 = $signed($signed($unsigned(wire29[(4'h9):(3'h7)])));
  assign wire44 = {$signed((reg37[(2'h2):(1'h1)] ?
                          wire33 : $signed(wire31[(1'h0):(1'h0)]))),
                      wire38[(2'h2):(1'h0)]};
  assign wire45 = {reg35, $unsigned((~&$signed((~^wire32))))};
  assign wire46 = wire28[(3'h4):(2'h3)];
  assign wire47 = $unsigned($unsigned(reg36[(4'hc):(4'ha)]));
  assign wire48 = ((8'h9d) + $unsigned($unsigned($signed(wire42))));
  assign wire49 = ($signed(wire44) ?
                      {wire41,
                          (wire48 ?
                              (+{wire28, wire29}) : ((wire29 ?
                                      wire39 : (8'hbd)) ?
                                  wire40 : $unsigned(wire45)))} : ((|$unsigned(wire38[(1'h1):(1'h1)])) ?
                          $signed(($signed(wire42) ^ (~&reg36))) : $unsigned(((wire43 ?
                                  wire48 : wire30) ?
                              (wire47 <= wire31) : reg36))));
endmodule
