module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire0;
  input wire [(4'hc):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire4;
  wire [(5'h12):(1'h0)] wire71;
  wire signed [(4'h9):(1'h0)] wire70;
  wire signed [(5'h10):(1'h0)] wire69;
  wire [(3'h6):(1'h0)] wire68;
  wire [(3'h6):(1'h0)] wire67;
  wire [(3'h5):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire6;
  wire [(4'ha):(1'h0)] wire7;
  wire [(5'h12):(1'h0)] wire65;
  assign y = {wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire5,
                 wire6,
                 wire7,
                 wire65,
                 (1'h0)};
  assign wire5 = wire3[(1'h1):(1'h0)];
  assign wire6 = {(^wire1), $unsigned((wire5 * (8'ha7)))};
  assign wire7 = (!wire0[(2'h3):(1'h1)]);
  module8 #() modinst66 (wire65, clk, wire2, wire7, wire4, wire6, wire0);
  assign wire67 = {({wire1, wire5} ?
                          (~^(!(wire5 <= wire3))) : wire5[(1'h1):(1'h1)]),
                      wire7[(1'h0):(1'h0)]};
  assign wire68 = wire67[(1'h1):(1'h1)];
  assign wire69 = $signed(wire65[(4'hb):(2'h2)]);
  assign wire70 = $signed(({$signed(wire4[(3'h6):(3'h4)])} ?
                      {$unsigned(wire3), (8'hb8)} : {(8'hae)}));
  assign wire71 = wire1[(3'h5):(1'h1)];
endmodule

module module8  (y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'h115):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire13;
  input wire [(3'h5):(1'h0)] wire12;
  input wire [(5'h12):(1'h0)] wire11;
  input wire [(4'hf):(1'h0)] wire10;
  input wire [(4'h9):(1'h0)] wire9;
  wire signed [(5'h12):(1'h0)] wire64;
  wire signed [(4'ha):(1'h0)] wire63;
  wire signed [(3'h5):(1'h0)] wire62;
  wire signed [(4'h8):(1'h0)] wire61;
  wire [(5'h12):(1'h0)] wire60;
  wire signed [(5'h13):(1'h0)] wire58;
  wire signed [(4'he):(1'h0)] wire30;
  wire [(3'h5):(1'h0)] wire29;
  wire [(4'he):(1'h0)] wire28;
  wire [(4'hd):(1'h0)] wire27;
  wire [(3'h5):(1'h0)] wire14;
  reg signed [(3'h5):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg23 = (1'h0);
  reg [(5'h10):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg21 = (1'h0);
  reg [(5'h15):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg18 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg16 = (1'h0);
  reg [(5'h15):(1'h0)] reg15 = (1'h0);
  assign y = {wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire58,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire14,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 (1'h0)};
  assign wire14 = wire12;
  always
    @(posedge clk) begin
      reg15 <= (({$signed((wire13 ? wire13 : wire12))} ?
              (^($signed(wire9) ?
                  $unsigned(wire10) : (wire13 ?
                      wire9 : (7'h44)))) : $unsigned($signed(wire13[(5'h12):(4'hc)]))) ?
          wire9 : $signed($signed(((&wire11) ?
              wire11[(5'h12):(4'hd)] : (~^wire13)))));
      reg16 <= wire12[(2'h3):(1'h0)];
      reg17 <= $signed(((+(!$signed(wire12))) != ($signed(wire13) & wire14[(3'h5):(3'h5)])));
      if ((^~(((wire14 ? (wire9 ? wire14 : wire14) : $signed((8'hb8))) ?
              wire12 : $unsigned((wire14 ? wire13 : reg17))) ?
          $signed(wire11) : {reg16})))
        begin
          if ((((($unsigned((8'hbc)) << $signed(wire9)) ?
                      ($unsigned(reg15) >> {wire9,
                          (7'h43)}) : (((8'haa) >= reg16) >= wire10[(2'h2):(1'h0)])) ?
                  $signed(wire14[(2'h3):(1'h0)]) : (($unsigned(wire10) ?
                          wire11[(5'h12):(1'h1)] : reg16[(3'h6):(3'h5)]) ?
                      $unsigned(wire11[(3'h7):(2'h3)]) : reg15)) ?
              (-wire9) : wire12[(3'h4):(2'h3)]))
            begin
              reg18 <= ($signed({$signed((wire9 ? reg15 : (7'h41)))}) ?
                  reg16 : (8'ha9));
              reg19 <= reg17[(2'h3):(1'h0)];
              reg20 <= $unsigned(reg18);
            end
          else
            begin
              reg18 <= (~^wire10[(1'h1):(1'h0)]);
              reg19 <= (reg19[(4'h9):(3'h5)] ~^ $unsigned(reg15[(4'h8):(3'h4)]));
              reg20 <= $unsigned(($signed(((wire9 ?
                      wire14 : wire13) ~^ (~&reg15))) ?
                  wire11 : reg18));
              reg21 <= ($unsigned(wire14[(2'h3):(2'h3)]) ?
                  (({$signed((8'hb6))} ?
                          $unsigned($signed(wire12)) : (~|wire11)) ?
                      (~($signed(wire9) < (+reg16))) : (~&$unsigned((^(8'hb9))))) : ((wire10 ?
                          $signed((reg16 ? wire12 : reg17)) : (reg18 ?
                              (|reg17) : {reg18, reg20})) ?
                      reg20 : (^{$signed(reg19), $unsigned(wire12)})));
              reg22 <= (~|(~reg17));
            end
          reg23 <= reg19[(3'h4):(3'h4)];
          reg24 <= (~($unsigned($signed((~^(8'ha1)))) ?
              $signed($signed(reg18[(1'h1):(1'h0)])) : (((reg16 ?
                      reg22 : reg16) - wire13[(4'h8):(3'h6)]) ?
                  $signed($unsigned(wire11)) : $signed(reg17[(4'hc):(2'h2)]))));
          reg25 <= reg15[(1'h1):(1'h0)];
        end
      else
        begin
          if (reg25[(4'ha):(1'h1)])
            begin
              reg18 <= $unsigned(wire10[(2'h3):(1'h0)]);
              reg19 <= (((-((reg25 ? wire12 : reg25) ?
                      $unsigned(reg23) : wire13[(5'h14):(3'h6)])) ?
                  $unsigned($signed((reg18 ?
                      (8'ha8) : wire11))) : reg18) >= $unsigned((($unsigned(reg16) ?
                      $unsigned((8'haf)) : reg15[(4'hd):(3'h6)]) ?
                  (-(reg17 ? reg20 : reg17)) : {reg15[(5'h10):(4'ha)]})));
              reg20 <= (((reg16[(4'h8):(2'h3)] ^~ reg24[(2'h2):(1'h1)]) ?
                      reg19 : $signed($unsigned($unsigned(reg15)))) ?
                  $unsigned($signed((wire10[(2'h2):(1'h0)] ^~ (reg19 ?
                      reg15 : reg15)))) : ($unsigned((-$unsigned(reg16))) ?
                      reg21 : reg24[(1'h1):(1'h1)]));
              reg21 <= reg17[(4'hc):(3'h4)];
              reg22 <= $signed({$signed((|$signed(reg16))), (~&wire11)});
            end
          else
            begin
              reg18 <= ($signed((wire13[(4'he):(4'hc)] ?
                      wire10 : wire12[(1'h0):(1'h0)])) ?
                  $signed($unsigned($unsigned(wire12[(3'h5):(1'h1)]))) : reg18);
              reg19 <= wire9;
              reg20 <= $unsigned(reg19[(2'h3):(2'h3)]);
              reg21 <= $signed($unsigned(reg23));
            end
          if (reg24)
            begin
              reg23 <= reg24;
            end
          else
            begin
              reg23 <= ($unsigned(({$signed((8'hb7))} ?
                      ((wire13 > reg17) ?
                          (reg16 ? (8'ha8) : reg19) : {reg19,
                              wire9}) : $unsigned($signed(reg15)))) ?
                  reg22 : ((+{$unsigned(reg19)}) * $signed(reg25[(2'h2):(2'h2)])));
              reg24 <= (|$signed($signed((8'ha5))));
              reg25 <= wire13[(5'h14):(5'h14)];
            end
          reg26 <= wire10[(4'ha):(1'h1)];
        end
    end
  assign wire27 = ((^~($signed((reg21 ? reg26 : reg19)) ?
                          ({reg17} - $unsigned(wire13)) : $unsigned((reg22 ^~ wire10)))) ?
                      $unsigned((!(|(reg23 << reg21)))) : $signed($signed({reg15})));
  assign wire28 = reg19[(4'h8):(3'h4)];
  assign wire29 = ((8'ha2) == (~wire9));
  assign wire30 = (reg18[(1'h1):(1'h0)] ?
                      wire12[(1'h1):(1'h1)] : wire28[(4'hc):(4'h8)]);
  module31 #() modinst59 (.wire34(reg17), .wire33(reg20), .y(wire58), .wire35(wire27), .clk(clk), .wire32(wire10));
  assign wire60 = ({((wire30 ? {reg15} : $signed(reg16)) ?
                              ((reg25 <= reg18) ?
                                  reg24 : (wire58 - wire13)) : ((reg18 ?
                                  reg19 : (8'hae)) >> wire12))} ?
                      reg19 : (^~$signed((~&((8'ha5) >>> wire11)))));
  assign wire61 = $unsigned(wire14);
  assign wire62 = reg15[(5'h11):(3'h5)];
  assign wire63 = (~|($unsigned(reg21[(1'h0):(1'h0)]) ^ wire62));
  assign wire64 = (-($signed($unsigned((wire11 & (8'haa)))) ?
                      {(+$unsigned(wire9)), wire9} : {$unsigned((+reg18))}));
endmodule

module module31
#(parameter param56 = (!(((((8'hae) ? (8'ha7) : (8'hb0)) ? (~|(8'hb8)) : ((8'hbd) ? (8'hb4) : (8'hb8))) ? {{(8'hac)}} : (!(~|(7'h43)))) ? (~&((!(8'ha3)) ^ ((8'h9c) < (7'h40)))) : ({((8'ha8) ? (8'ha4) : (8'hbb)), {(8'ha5)}} ? ({(8'ha1), (8'ha3)} ? ((8'haf) <<< (8'ha2)) : (8'h9f)) : {(|(8'hbe)), ((8'hae) + (8'h9d))}))), 
parameter param57 = (((7'h44) ? (+param56) : (&{{param56}, (param56 != (8'ha8))})) ? ((((param56 + param56) ? param56 : (param56 ? param56 : param56)) ? ((param56 >= param56) ? (param56 ^ param56) : {param56, param56}) : ((param56 ? param56 : (8'hbc)) ? {(7'h41), param56} : (!param56))) ? (^((param56 ? param56 : param56) ? (param56 ^~ (8'hbd)) : (param56 >= param56))) : (({param56, param56} ? (param56 >= param56) : (param56 ? param56 : (8'had))) >= (param56 ? (param56 ? param56 : param56) : ((8'hb4) && param56)))) : {((8'hb8) ? (param56 && (param56 + param56)) : (^(param56 ^~ param56))), (((-param56) ? (-param56) : {param56}) == (8'hac))}))
(y, clk, wire35, wire34, wire33, wire32);
  output wire [(32'hdc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire35;
  input wire signed [(5'h12):(1'h0)] wire34;
  input wire [(5'h15):(1'h0)] wire33;
  input wire signed [(4'hf):(1'h0)] wire32;
  wire [(5'h13):(1'h0)] wire55;
  wire [(4'hd):(1'h0)] wire54;
  wire signed [(4'hb):(1'h0)] wire53;
  wire [(4'hc):(1'h0)] wire52;
  wire signed [(3'h5):(1'h0)] wire51;
  wire [(4'h9):(1'h0)] wire47;
  wire [(3'h5):(1'h0)] wire46;
  wire [(4'h9):(1'h0)] wire45;
  reg signed [(4'hd):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg49 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg41 = (1'h0);
  reg [(4'h9):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg39 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg38 = (1'h0);
  reg [(5'h10):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg36 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire47,
                 wire46,
                 wire45,
                 reg50,
                 reg49,
                 reg48,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg36 <= ({((^~wire33[(3'h6):(2'h2)]) ?
                  (wire35[(3'h7):(3'h7)] >> wire33) : ((wire32 ?
                          wire35 : (8'ha5)) ?
                      (~^wire34) : (wire35 ? wire35 : wire32))),
              wire34[(3'h5):(1'h0)]} ?
          wire34 : ($unsigned((wire33 ?
              (8'h9d) : (wire33 > wire32))) - ($signed(((8'ha3) << wire32)) | (8'ha8))));
      if (reg36)
        begin
          reg37 <= (($unsigned((|$signed(wire34))) ?
              reg36 : wire34[(3'h5):(1'h0)]) ^~ (wire35[(4'hb):(2'h2)] ?
              wire34 : {$signed(wire32), {reg36, {wire33}}}));
          reg38 <= (&wire33[(1'h1):(1'h0)]);
          reg39 <= (^($signed(wire35) ?
              wire33[(5'h11):(5'h10)] : wire33[(2'h2):(2'h2)]));
          if ($signed((wire32[(4'hd):(1'h0)] ?
              $signed($signed((~^wire35))) : ({$signed(wire32)} <= ($signed(wire32) & (wire32 != wire35))))))
            begin
              reg40 <= reg37;
              reg41 <= wire35[(3'h7):(2'h3)];
              reg42 <= reg36[(1'h1):(1'h0)];
            end
          else
            begin
              reg40 <= reg42;
              reg41 <= (($signed(reg42[(4'ha):(3'h5)]) != (reg40[(4'h8):(1'h0)] ?
                      (~|(~&wire35)) : $unsigned(reg41[(2'h2):(1'h1)]))) ?
                  wire33[(2'h3):(2'h2)] : $unsigned(($signed(wire35[(4'hb):(4'h8)]) ?
                      (reg39 - wire33) : (reg38 ? {reg40, wire33} : (8'ha5)))));
              reg42 <= $signed($signed((($signed(reg38) == reg39[(4'hd):(4'hb)]) >>> $unsigned(reg36))));
              reg43 <= {{reg39[(5'h15):(5'h12)], reg42}};
              reg44 <= $unsigned(reg36);
            end
        end
      else
        begin
          reg37 <= (+(^(~|$unsigned((reg41 == reg42)))));
        end
    end
  assign wire45 = $signed({((~$signed((8'ha9))) - (~^(reg38 ?
                          wire32 : wire34))),
                      {$unsigned(reg44[(1'h0):(1'h0)])}});
  assign wire46 = $unsigned({(7'h40)});
  assign wire47 = (wire45[(3'h5):(1'h0)] != $signed(((^(~reg40)) >>> $unsigned((wire35 ?
                      wire33 : wire33)))));
  always
    @(posedge clk) begin
      reg48 <= reg42;
      reg49 <= wire45;
      reg50 <= reg43;
    end
  assign wire51 = $unsigned(wire45);
  assign wire52 = ($signed(wire33) ?
                      (reg48[(2'h2):(1'h0)] ?
                          $signed($signed((~|wire46))) : $unsigned({((8'hae) ?
                                  reg42 : wire46),
                              $unsigned(reg36)})) : (~&(!(reg42 ?
                          (reg39 >>> wire46) : $signed(reg36)))));
  assign wire53 = reg41[(2'h3):(1'h0)];
  assign wire54 = ($unsigned($unsigned(wire51)) ?
                      $signed($signed($signed((reg37 == reg44)))) : ((($signed(reg38) && ((8'hb4) ?
                          wire46 : reg43)) * reg42[(3'h6):(3'h4)]) * (~|$unsigned(((8'ha8) >= wire46)))));
  assign wire55 = $signed($unsigned(reg49[(3'h6):(2'h3)]));
endmodule
