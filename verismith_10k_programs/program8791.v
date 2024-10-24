module top
#(parameter param61 = (+((~(((8'ha1) <<< (8'hbb)) <<< {(8'hae), (8'hb0)})) ? {(~|((8'h9f) ? (8'hac) : (8'hb0))), (+((8'ha6) ? (8'hb1) : (7'h44)))} : (8'hbc))), 
parameter param62 = (~^(!(8'ha9))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h98):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire0;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire4;
  wire [(4'hb):(1'h0)] wire60;
  wire [(3'h5):(1'h0)] wire59;
  wire signed [(5'h11):(1'h0)] wire58;
  wire [(4'h8):(1'h0)] wire5;
  wire signed [(4'ha):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire7;
  wire [(4'ha):(1'h0)] wire8;
  wire [(5'h12):(1'h0)] wire9;
  wire [(4'h8):(1'h0)] wire10;
  wire [(5'h14):(1'h0)] wire11;
  wire signed [(4'hf):(1'h0)] wire12;
  wire [(4'he):(1'h0)] wire13;
  wire signed [(4'hc):(1'h0)] wire56;
  assign y = {wire60,
                 wire59,
                 wire58,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire56,
                 (1'h0)};
  assign wire5 = {wire1[(4'h8):(3'h7)]};
  assign wire6 = wire4;
  assign wire7 = wire4;
  assign wire8 = wire0;
  assign wire9 = wire8[(3'h6):(3'h4)];
  assign wire10 = $signed(((&($unsigned(wire1) ?
                          (wire9 ? (8'hb6) : (8'ha4)) : $unsigned(wire3))) ?
                      {(wire0 + (^~wire3)), {(+wire5)}} : (~|wire5)));
  assign wire11 = (&wire3);
  assign wire12 = (($unsigned(wire0) >>> $unsigned($signed((|wire8)))) ~^ (8'h9d));
  assign wire13 = $signed((wire1 ?
                      wire10 : $unsigned(($signed(wire1) && (!(8'ha6))))));
  module14 #() modinst57 (wire56, clk, wire8, wire9, wire13, wire5, wire11);
  assign wire58 = $signed(((wire12[(4'hc):(4'hc)] != $unsigned((wire2 ?
                          wire11 : (8'hb6)))) ?
                      {(wire5[(1'h1):(1'h1)] ? {wire5, wire0} : (!wire3)),
                          wire12[(1'h0):(1'h0)]} : (wire0[(3'h5):(2'h3)] ?
                          wire5[(3'h5):(1'h0)] : (^(wire10 <= wire12)))));
  assign wire59 = wire13;
  assign wire60 = wire10[(3'h6):(3'h5)];
endmodule

module module14
#(parameter param54 = (~|{((~&(8'ha7)) >>> ((~^(7'h43)) ? {(8'hab), (8'ha0)} : (~&(8'hb3)))), ((!((8'ha1) ? (7'h43) : (8'hbf))) ? ((~(8'h9f)) ? ((8'ha3) + (8'haa)) : {(8'hb3)}) : (8'hbb))}), 
parameter param55 = (~&(param54 ? (((7'h43) - {param54}) ? (param54 ? (param54 <<< param54) : param54) : (~^param54)) : ((~|(param54 ? (8'h9c) : param54)) ? ({param54} < (param54 ? param54 : param54)) : ((param54 ? param54 : param54) ? (param54 ? param54 : param54) : (param54 ? param54 : (8'ha4)))))))
(y, clk, wire19, wire18, wire17, wire16, wire15);
  output wire [(32'h176):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire19;
  input wire [(5'h12):(1'h0)] wire18;
  input wire [(3'h6):(1'h0)] wire17;
  input wire signed [(4'h8):(1'h0)] wire16;
  input wire [(5'h13):(1'h0)] wire15;
  wire [(4'hd):(1'h0)] wire53;
  wire signed [(2'h2):(1'h0)] wire40;
  wire signed [(5'h15):(1'h0)] wire39;
  wire [(4'hc):(1'h0)] wire38;
  wire signed [(5'h14):(1'h0)] wire37;
  wire signed [(5'h14):(1'h0)] wire36;
  wire signed [(3'h5):(1'h0)] wire35;
  wire [(3'h4):(1'h0)] wire20;
  reg [(3'h6):(1'h0)] reg52 = (1'h0);
  reg [(4'he):(1'h0)] reg51 = (1'h0);
  reg [(2'h3):(1'h0)] reg50 = (1'h0);
  reg [(3'h5):(1'h0)] reg49 = (1'h0);
  reg [(5'h13):(1'h0)] reg48 = (1'h0);
  reg signed [(4'he):(1'h0)] reg47 = (1'h0);
  reg [(3'h6):(1'h0)] reg46 = (1'h0);
  reg [(3'h5):(1'h0)] reg45 = (1'h0);
  reg [(4'h9):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg41 = (1'h0);
  reg [(5'h15):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg32 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg31 = (1'h0);
  reg [(4'ha):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg29 = (1'h0);
  reg [(3'h6):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg25 = (1'h0);
  reg [(3'h6):(1'h0)] reg24 = (1'h0);
  reg [(5'h13):(1'h0)] reg23 = (1'h0);
  reg [(4'hb):(1'h0)] reg22 = (1'h0);
  reg [(3'h5):(1'h0)] reg21 = (1'h0);
  assign y = {wire53,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire20,
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
                 (1'h0)};
  assign wire20 = $signed({(~wire16[(2'h3):(2'h3)])});
  always
    @(posedge clk) begin
      reg21 <= wire16[(1'h0):(1'h0)];
      reg22 <= {wire17[(1'h1):(1'h0)],
          $signed(((((8'ha7) + (8'ha3)) ?
                  (wire19 ? wire16 : wire18) : reg21[(1'h1):(1'h0)]) ?
              $signed((+wire16)) : $signed(wire18)))};
      if ((wire19 == (((^~$signed(wire18)) ?
              ($signed(wire19) ?
                  ((8'hac) <= reg22) : (wire15 ?
                      reg21 : wire17)) : (^~$signed(wire15))) ?
          (8'hbd) : wire16[(2'h2):(1'h1)])))
        begin
          reg23 <= (!$signed(wire16));
        end
      else
        begin
          reg23 <= $signed($unsigned((($unsigned(wire18) ?
              (wire18 ?
                  wire17 : wire17) : reg22[(1'h1):(1'h0)]) >>> (~$unsigned(wire16)))));
          reg24 <= reg23;
          if ({{{{$unsigned(wire17)}, (-(wire17 ~^ wire18))},
                  $unsigned((wire17 != $signed((8'ha3))))}})
            begin
              reg25 <= (wire19[(4'h8):(1'h0)] == (!$unsigned(reg23)));
              reg26 <= {(&reg21), $unsigned($signed((&(8'ha0))))};
              reg27 <= (!wire19[(1'h0):(1'h0)]);
              reg28 <= wire15;
              reg29 <= (^~reg23);
            end
          else
            begin
              reg25 <= reg21;
              reg26 <= $unsigned(reg27[(3'h5):(1'h0)]);
              reg27 <= (wire19 ~^ reg28);
            end
        end
      if ((wire20 ^ reg25[(2'h2):(1'h1)]))
        begin
          reg30 <= $unsigned($unsigned($signed((reg22 ?
              (^~reg24) : $signed(wire15)))));
          reg31 <= reg23[(1'h0):(1'h0)];
          reg32 <= ($signed(reg30[(4'h9):(3'h7)]) * reg26[(2'h3):(1'h0)]);
          reg33 <= (+$signed(wire18[(3'h5):(2'h2)]));
          reg34 <= (8'h9f);
        end
      else
        begin
          reg30 <= ($signed((reg23 >> $unsigned((reg24 ? reg24 : reg29)))) ?
              ({$unsigned(reg27), reg29} ?
                  (($signed(reg31) >= {reg25}) < ({reg22, reg32} ?
                      (reg24 ? (7'h40) : reg21) : reg28)) : {(7'h44),
                      {(wire19 ? reg27 : wire17),
                          (reg26 >>> (8'had))}}) : ((reg21 | ({reg30} ?
                      (wire17 + wire16) : ((8'hb6) ? reg25 : reg24))) ?
                  wire19[(3'h4):(2'h2)] : reg26));
        end
    end
  assign wire35 = $unsigned(wire18[(4'h8):(1'h0)]);
  assign wire36 = (8'hbb);
  assign wire37 = {$unsigned((8'ha2)), $unsigned(reg25[(2'h3):(2'h2)])};
  assign wire38 = reg29;
  assign wire39 = {$unsigned(reg25[(1'h0):(1'h0)]), $unsigned(wire38)};
  assign wire40 = $signed((+(+$unsigned((wire35 + reg25)))));
  always
    @(posedge clk) begin
      reg41 <= $signed(wire35);
      reg42 <= $unsigned($unsigned((^~$signed(reg33[(1'h1):(1'h1)]))));
      if (reg32[(3'h7):(3'h7)])
        begin
          if ((((reg26[(1'h1):(1'h1)] <= wire18) ?
              (($signed((8'hbe)) ?
                  $signed(reg30) : {wire35,
                      reg24}) | wire39[(5'h15):(4'ha)]) : (8'had)) <<< (($signed((7'h44)) != ($unsigned((8'hac)) < (wire36 - wire39))) < reg23[(3'h7):(3'h4)])))
            begin
              reg43 <= wire35[(2'h2):(1'h1)];
              reg44 <= (~|{reg28[(3'h6):(1'h0)]});
              reg45 <= $unsigned(reg32);
              reg46 <= {wire19[(4'h8):(3'h7)],
                  ((((~&reg28) >> (wire20 && wire37)) ^ reg45[(2'h2):(1'h0)]) ~^ $signed({{wire18},
                      reg25[(1'h0):(1'h0)]}))};
              reg47 <= wire37;
            end
          else
            begin
              reg43 <= (|($unsigned(wire36) ?
                  ({reg30[(4'h8):(1'h0)]} ?
                      ((!wire16) << ((8'hb6) ?
                          wire18 : reg23)) : (&$unsigned(wire20))) : reg44));
              reg44 <= (~$unsigned((({reg31} - ((8'ha1) ?
                  wire15 : reg31)) && (wire17 ?
                  reg26[(1'h0):(1'h0)] : ((8'haf) ? reg34 : reg24)))));
              reg45 <= $unsigned($signed((~&((reg34 ^~ reg23) >> $unsigned((8'hae))))));
              reg46 <= wire16[(3'h6):(1'h0)];
              reg47 <= ($signed(reg41[(4'hd):(4'ha)]) * wire17[(3'h6):(3'h4)]);
            end
          if ({wire40,
              ($signed((reg34[(3'h5):(3'h5)] != reg46)) ? reg46 : (~|(8'hbf)))})
            begin
              reg48 <= reg24;
              reg49 <= reg41;
              reg50 <= (7'h41);
              reg51 <= reg42[(4'h8):(2'h3)];
              reg52 <= reg28[(2'h3):(1'h0)];
            end
          else
            begin
              reg48 <= (reg47[(3'h5):(3'h5)] & (-reg21));
              reg49 <= reg25[(2'h3):(1'h0)];
              reg50 <= wire36[(5'h10):(1'h1)];
              reg51 <= ((|{$signed($signed(wire19))}) && $unsigned(reg44[(4'h8):(4'h8)]));
            end
        end
      else
        begin
          reg43 <= $unsigned({$signed($unsigned(reg31)),
              wire35[(2'h2):(1'h1)]});
          reg44 <= $signed((-(wire37[(2'h3):(2'h2)] + ($signed((8'hb0)) << $unsigned(reg50)))));
          reg45 <= $unsigned(reg31);
          if ((^$signed((&$signed(reg42[(3'h7):(1'h1)])))))
            begin
              reg46 <= ((wire36[(5'h11):(4'h9)] ?
                  reg23[(5'h13):(3'h5)] : $signed($unsigned($unsigned(reg26)))) + reg21[(2'h2):(2'h2)]);
              reg47 <= reg23;
              reg48 <= ($signed({(reg33[(2'h2):(1'h1)] ?
                      reg45 : reg26[(1'h1):(1'h0)])}) - reg47);
            end
          else
            begin
              reg46 <= (+wire40[(1'h0):(1'h0)]);
            end
          reg49 <= ($unsigned({$signed($signed(wire39))}) ?
              (~wire17) : reg31[(2'h2):(2'h2)]);
        end
    end
  assign wire53 = reg44[(3'h7):(3'h5)];
endmodule
