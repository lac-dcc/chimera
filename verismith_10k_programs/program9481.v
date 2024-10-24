module top
#(parameter param79 = {(-(&((~|(8'ha1)) >> (+(8'hb4)))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h54):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire78;
  wire signed [(5'h13):(1'h0)] wire77;
  wire signed [(5'h14):(1'h0)] wire76;
  wire [(5'h13):(1'h0)] wire74;
  wire signed [(5'h12):(1'h0)] wire4;
  assign y = {wire78, wire77, wire76, wire74, wire4, (1'h0)};
  assign wire4 = $signed({wire0});
  module5 #() modinst75 (wire74, clk, wire2, wire1, wire0, wire4);
  assign wire76 = $unsigned(wire4);
  assign wire77 = $signed((|(|$signed({wire3}))));
  assign wire78 = $unsigned(wire2);
endmodule

module module5  (y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h5c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire9;
  input wire [(3'h6):(1'h0)] wire8;
  input wire signed [(4'hb):(1'h0)] wire7;
  input wire signed [(5'h12):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire73;
  wire [(4'hf):(1'h0)] wire72;
  wire [(4'h9):(1'h0)] wire71;
  wire signed [(4'h9):(1'h0)] wire70;
  wire [(5'h10):(1'h0)] wire68;
  wire signed [(4'hc):(1'h0)] wire52;
  wire signed [(5'h13):(1'h0)] wire10;
  assign y = {wire73, wire72, wire71, wire70, wire68, wire52, wire10, (1'h0)};
  assign wire10 = wire6[(1'h0):(1'h0)];
  module11 #() modinst53 (wire52, clk, wire8, wire10, wire7, wire9);
  module54 #() modinst69 (wire68, clk, wire7, wire52, wire10, wire6);
  assign wire70 = wire9;
  assign wire71 = $unsigned((~|wire68[(5'h10):(4'hc)]));
  assign wire72 = (wire52[(1'h0):(1'h0)] ? (|wire71) : wire8[(2'h2):(2'h2)]);
  assign wire73 = wire7;
endmodule

module module54
#(parameter param66 = (~|(~|{{((8'hbe) ? (8'ha6) : (8'ha5))}})), 
parameter param67 = (-(param66 ? ((param66 ? (~^param66) : (param66 ^ param66)) ? {(^param66)} : (param66 ~^ param66)) : (param66 ? ((param66 > param66) ? {param66} : (&param66)) : (param66 ^~ (param66 ? param66 : (8'hb6)))))))
(y, clk, wire58, wire57, wire56, wire55);
  output wire [(32'h3f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire58;
  input wire [(3'h5):(1'h0)] wire57;
  input wire [(4'h8):(1'h0)] wire56;
  input wire [(5'h12):(1'h0)] wire55;
  wire signed [(4'h8):(1'h0)] wire65;
  wire signed [(4'hb):(1'h0)] wire64;
  wire signed [(3'h6):(1'h0)] wire63;
  wire signed [(4'h8):(1'h0)] wire62;
  wire [(5'h10):(1'h0)] wire61;
  wire signed [(2'h3):(1'h0)] wire60;
  wire signed [(4'ha):(1'h0)] wire59;
  assign y = {wire65, wire64, wire63, wire62, wire61, wire60, wire59, (1'h0)};
  assign wire59 = $signed((!{(~^{wire56, wire57})}));
  assign wire60 = $signed({$signed(wire58), wire58});
  assign wire61 = $signed(((({wire59} ~^ $signed(wire60)) ?
                          (wire58 >>> (wire57 != wire57)) : wire55) ?
                      ({wire56[(4'h8):(3'h4)],
                          (wire57 ?
                              wire60 : wire59)} == ($unsigned(wire58) > {wire57})) : (^~$unsigned(((8'hb5) ?
                          wire59 : wire57)))));
  assign wire62 = {wire57[(1'h1):(1'h0)]};
  assign wire63 = wire59[(2'h2):(2'h2)];
  assign wire64 = wire55[(4'hc):(1'h0)];
  assign wire65 = $unsigned(wire58);
endmodule

module module11
#(parameter param51 = (~^(8'ha7)))
(y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'h1b4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire15;
  input wire [(4'h8):(1'h0)] wire14;
  input wire [(4'h9):(1'h0)] wire13;
  input wire [(4'hf):(1'h0)] wire12;
  wire signed [(3'h4):(1'h0)] wire50;
  wire [(4'h9):(1'h0)] wire49;
  wire [(3'h7):(1'h0)] wire48;
  wire signed [(4'hf):(1'h0)] wire47;
  wire signed [(4'h9):(1'h0)] wire46;
  wire signed [(5'h14):(1'h0)] wire45;
  wire [(5'h14):(1'h0)] wire29;
  wire signed [(4'h8):(1'h0)] wire28;
  wire signed [(2'h3):(1'h0)] wire20;
  wire [(4'he):(1'h0)] wire19;
  wire [(3'h5):(1'h0)] wire18;
  reg [(5'h13):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg40 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg37 = (1'h0);
  reg [(4'h8):(1'h0)] reg36 = (1'h0);
  reg [(4'hf):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg34 = (1'h0);
  reg [(5'h13):(1'h0)] reg33 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg31 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg27 = (1'h0);
  reg [(4'hc):(1'h0)] reg26 = (1'h0);
  reg signed [(4'he):(1'h0)] reg25 = (1'h0);
  reg [(5'h13):(1'h0)] reg24 = (1'h0);
  reg [(5'h10):(1'h0)] reg23 = (1'h0);
  reg [(3'h7):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg21 = (1'h0);
  reg [(5'h14):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg16 = (1'h0);
  assign y = {wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire29,
                 wire28,
                 wire20,
                 wire19,
                 wire18,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
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
      reg16 <= {{(($signed(wire13) ~^ wire14) ?
                  wire15[(1'h1):(1'h0)] : (~&(wire13 & (8'ha3)))),
              (wire14 ? (~&{(8'ha5)}) : {$signed(wire13)})}};
      reg17 <= {$signed(wire15[(3'h4):(1'h0)])};
    end
  assign wire18 = $unsigned((^wire14));
  assign wire19 = wire12;
  assign wire20 = wire12;
  always
    @(posedge clk) begin
      if ((-((wire20[(2'h2):(1'h1)] ?
          $unsigned((|wire18)) : (~&wire15)) + reg17[(1'h0):(1'h0)])))
        begin
          reg21 <= $unsigned(((((8'h9e) ?
              (reg17 ?
                  wire13 : wire20) : (~wire19)) ~^ ((wire12 + reg16) <= {wire18,
              reg16})) || reg16));
          reg22 <= {$unsigned(wire13[(4'h9):(4'h8)])};
          reg23 <= wire14[(2'h3):(2'h2)];
          reg24 <= $unsigned(wire20[(2'h2):(2'h2)]);
          reg25 <= (reg23 > reg22);
        end
      else
        begin
          reg21 <= $unsigned(($signed(((reg17 < wire13) ?
              (8'ha2) : (reg24 >= wire15))) <<< ((+reg17) >> reg24)));
          reg22 <= ($signed($unsigned($signed((reg24 ?
              (8'hb1) : reg16)))) == $signed((~^reg17)));
          reg23 <= $unsigned((^(reg16 ^~ (&$unsigned((8'haa))))));
          reg24 <= (!((wire12 >> {((8'ha9) ? wire20 : reg23)}) ?
              wire15 : reg17[(2'h3):(2'h3)]));
          reg25 <= $signed(reg21[(3'h5):(2'h2)]);
        end
      reg26 <= reg23[(5'h10):(4'hc)];
      reg27 <= $unsigned($unsigned(reg17[(4'hf):(4'he)]));
    end
  assign wire28 = {wire19};
  assign wire29 = (reg21 ?
                      reg24[(5'h11):(4'h8)] : (($signed((8'ha7)) || wire14[(3'h4):(1'h1)]) ?
                          {$signed((wire15 ^ (8'haa))),
                              {$signed(wire14),
                                  wire14[(2'h2):(1'h0)]}} : $unsigned($unsigned({reg17,
                              reg16}))));
  always
    @(posedge clk) begin
      if ((8'ha7))
        begin
          reg30 <= reg25;
          reg31 <= $signed((^~{$signed($unsigned(reg30)),
              (wire18 ? wire19[(4'hc):(1'h1)] : $signed(reg24))}));
          reg32 <= {(-((reg24 ?
                  ((8'hb0) ?
                      reg24 : reg23) : $signed(wire13)) ^ $signed((reg23 ?
                  reg26 : reg31))))};
        end
      else
        begin
          if ((wire19 ? (wire28 ? (^(8'haa)) : (8'hbd)) : reg30[(4'h8):(2'h2)]))
            begin
              reg30 <= (~^$signed($signed(reg16[(1'h0):(1'h0)])));
              reg31 <= reg32;
            end
          else
            begin
              reg30 <= $unsigned($signed(($signed((reg27 ? wire19 : wire15)) ?
                  wire20[(2'h2):(1'h1)] : $signed($signed((7'h44))))));
              reg31 <= reg17;
              reg32 <= ((({((8'ha8) == wire18), ((8'hbb) ? reg27 : reg26)} ?
                  $signed(wire20) : {(wire29 >= reg27),
                      (wire29 == wire19)}) + reg16) && (~^$unsigned(reg26[(4'h8):(1'h0)])));
            end
          if (((^reg32) ?
              ($unsigned((wire12[(4'ha):(4'h9)] > $unsigned(reg24))) ?
                  reg17 : reg24) : (^~(reg32 || (~$signed(reg21))))))
            begin
              reg33 <= $signed($unsigned((($signed(reg21) >>> reg30) && $unsigned(((7'h44) ?
                  (8'hb6) : (8'ha3))))));
              reg34 <= reg24;
              reg35 <= reg26;
              reg36 <= (($unsigned($unsigned((wire14 ^~ wire13))) ?
                      $unsigned((^~$unsigned(reg34))) : {reg22,
                          $signed((reg22 - (8'ha7)))}) ?
                  reg24[(5'h10):(1'h0)] : $unsigned($unsigned(wire15[(2'h2):(1'h1)])));
            end
          else
            begin
              reg33 <= $signed(reg35);
              reg34 <= (~(-$signed((~|(wire12 - (8'h9f))))));
              reg35 <= $unsigned((reg36[(3'h6):(3'h6)] ?
                  (wire19[(4'h8):(4'h8)] ?
                      $unsigned(reg36) : $signed(wire29[(5'h13):(1'h1)])) : $unsigned($unsigned((8'h9c)))));
              reg36 <= {{{$signed(reg23)}}};
              reg37 <= $unsigned({((wire19[(3'h5):(3'h5)] <<< reg30) != (~reg35[(2'h2):(1'h1)]))});
            end
          reg38 <= wire18[(3'h4):(2'h3)];
        end
      reg39 <= $unsigned((~^$unsigned({((8'ha4) ? wire28 : (8'hb1)),
          (reg33 ? wire29 : reg23)})));
      if (reg39[(1'h1):(1'h0)])
        begin
          reg40 <= (&reg17[(5'h14):(4'hd)]);
          reg41 <= ($unsigned((reg31 ? wire13 : {$unsigned(reg36)})) ?
              ({$unsigned((wire12 ? wire18 : reg33)),
                  (reg34[(4'hb):(4'ha)] >>> reg39[(3'h4):(2'h2)])} >> (~|{reg35,
                  $signed(wire29)})) : wire18);
        end
      else
        begin
          if ({reg32})
            begin
              reg40 <= $signed(wire13);
              reg41 <= wire13;
              reg42 <= {((&wire20) - reg32),
                  $unsigned((((reg30 ? wire29 : reg32) > (wire15 ?
                          wire13 : wire20)) ?
                      (+{reg41, wire13}) : wire18))};
              reg43 <= wire14;
            end
          else
            begin
              reg40 <= wire19;
              reg41 <= reg42[(3'h4):(1'h1)];
              reg42 <= reg16[(5'h12):(1'h0)];
              reg43 <= (((((8'hae) ? (reg35 ^ wire18) : reg42[(4'h8):(4'h8)]) ?
                      reg17[(4'h9):(4'h8)] : (reg38[(3'h4):(1'h0)] ?
                          (reg27 ?
                              reg41 : reg34) : (reg26 == reg31))) >>> ($unsigned((reg40 ?
                          (7'h42) : reg27)) ?
                      $signed((wire12 ? wire28 : reg41)) : $unsigned({reg40,
                          reg37}))) ?
                  $unsigned({{$signed(reg31)}, (reg27 <= (~^reg22))}) : reg26);
            end
        end
      reg44 <= $signed($unsigned($signed(reg16)));
    end
  assign wire45 = reg41[(3'h7):(1'h1)];
  assign wire46 = (~^((~((!wire29) != wire14[(3'h4):(2'h3)])) ?
                      reg27 : {((~reg31) != {reg31})}));
  assign wire47 = {$signed(wire29[(3'h4):(2'h3)])};
  assign wire48 = reg24[(4'h8):(3'h7)];
  assign wire49 = ((reg34[(5'h11):(1'h1)] ?
                      (!wire13[(3'h5):(1'h1)]) : reg42[(1'h0):(1'h0)]) << (8'hbf));
  assign wire50 = wire29[(4'he):(4'hb)];
endmodule
