module top
#(parameter param61 = (((({(7'h43)} & (^~(8'ha9))) << ({(8'ha4), (7'h40)} ^~ {(8'h9e)})) ? {(^((8'hbc) != (8'hbb)))} : {({(8'ha8), (8'hb4)} ? {(8'h9e)} : ((8'hb6) >= (8'hb5)))}) > (((^((8'h9c) ? (8'haa) : (7'h42))) ? {((8'ha2) ? (8'haf) : (8'hb3)), (^~(8'ha1))} : (&((8'ha6) ? (8'hb2) : (8'hae)))) >>> ((((8'hb3) ? (8'hba) : (8'hb7)) && (~&(8'hb7))) > (((8'ha3) ? (8'ha1) : (8'h9c)) ? (~^(8'ha2)) : (!(8'hbb)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h66):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire4;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire60;
  wire [(3'h4):(1'h0)] wire59;
  wire signed [(5'h15):(1'h0)] wire58;
  wire [(5'h13):(1'h0)] wire57;
  wire [(3'h7):(1'h0)] wire56;
  wire signed [(5'h13):(1'h0)] wire54;
  wire [(5'h11):(1'h0)] wire5;
  assign y = {wire60, wire59, wire58, wire57, wire56, wire54, wire5, (1'h0)};
  assign wire5 = (8'hb7);
  module6 #() modinst55 (.wire8(wire0), .y(wire54), .wire9(wire4), .wire10(wire3), .wire7(wire2), .clk(clk));
  assign wire56 = (wire4[(4'h8):(3'h5)] ?
                      (|({(~&wire0), wire1[(3'h5):(2'h3)]} ?
                          $signed((~wire4)) : (wire3[(2'h2):(2'h2)] ?
                              $signed(wire5) : wire5[(3'h4):(2'h3)]))) : wire3[(1'h0):(1'h0)]);
  assign wire57 = wire2;
  assign wire58 = (!$unsigned(wire56[(1'h1):(1'h1)]));
  assign wire59 = (wire58 >= wire54);
  assign wire60 = $unsigned($signed({(&$unsigned(wire59)),
                      (wire2[(5'h11):(4'ha)] ^ (~|wire0))}));
endmodule

module module6
#(parameter param53 = ((!((((8'hb6) ? (8'hbf) : (8'hbc)) ? (^~(8'hbd)) : ((8'hbe) | (7'h42))) * ((!(8'h9f)) ? {(8'hbd)} : ((8'ha3) ? (8'ha9) : (8'haa))))) ? (~|{(8'hb2), (~&(8'hb6))}) : (({(~|(8'hbb))} ? {(~|(7'h43)), ((8'hac) >> (8'hbd))} : (8'hac)) ^~ ((((8'h9e) && (8'h9c)) ? ((8'hae) < (8'had)) : ((8'hbb) ? (8'haf) : (7'h40))) ? (-((8'ha9) ? (8'hbd) : (8'ha6))) : {{(8'ha7)}}))))
(y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'h103):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire7;
  input wire signed [(5'h14):(1'h0)] wire8;
  input wire signed [(4'he):(1'h0)] wire9;
  input wire [(4'h8):(1'h0)] wire10;
  wire [(4'hb):(1'h0)] wire52;
  wire signed [(2'h3):(1'h0)] wire51;
  wire signed [(3'h7):(1'h0)] wire50;
  wire signed [(5'h15):(1'h0)] wire11;
  wire signed [(5'h10):(1'h0)] wire26;
  wire signed [(5'h13):(1'h0)] wire27;
  wire signed [(5'h15):(1'h0)] wire28;
  wire [(4'hc):(1'h0)] wire48;
  reg [(3'h6):(1'h0)] reg12 = (1'h0);
  reg [(4'hd):(1'h0)] reg13 = (1'h0);
  reg [(4'hc):(1'h0)] reg14 = (1'h0);
  reg [(5'h11):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg16 = (1'h0);
  reg [(4'he):(1'h0)] reg17 = (1'h0);
  reg [(2'h3):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg19 = (1'h0);
  reg [(4'h8):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg21 = (1'h0);
  reg [(2'h3):(1'h0)] reg22 = (1'h0);
  reg [(5'h10):(1'h0)] reg23 = (1'h0);
  reg [(3'h7):(1'h0)] reg24 = (1'h0);
  reg [(5'h14):(1'h0)] reg25 = (1'h0);
  assign y = {wire52,
                 wire51,
                 wire50,
                 wire11,
                 wire26,
                 wire27,
                 wire28,
                 wire48,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
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
  assign wire11 = ($unsigned((-wire7)) ? (8'hac) : {(7'h40)});
  always
    @(posedge clk) begin
      reg12 <= $unsigned((~|$signed((~wire10))));
      reg13 <= $unsigned(wire9);
      if ($unsigned(((~|(~^$signed((8'hb7)))) ?
          (reg12 ?
              $unsigned($unsigned(reg13)) : wire9[(3'h5):(2'h3)]) : wire10[(3'h7):(2'h2)])))
        begin
          if ((~&$signed((&$signed((wire10 != wire8))))))
            begin
              reg14 <= ($unsigned(((&(wire11 ? (8'hb2) : reg12)) ?
                      ($unsigned(wire9) ?
                          (-reg12) : wire10) : $unsigned((wire8 ?
                          reg13 : wire9)))) ?
                  $signed((((~&wire7) & wire7[(4'hb):(3'h4)]) ?
                      $signed($signed(wire11)) : (~|{reg12}))) : reg13);
            end
          else
            begin
              reg14 <= $signed($signed((($signed(wire7) + (wire11 || reg12)) ?
                  (wire10[(2'h2):(1'h1)] ?
                      wire10 : (&reg12)) : $unsigned($unsigned((8'hb7))))));
              reg15 <= (+{reg14[(4'h9):(3'h7)],
                  ($unsigned((~|wire11)) ^~ $signed((reg12 != wire9)))});
              reg16 <= $unsigned({($unsigned(wire10[(3'h4):(1'h1)]) ?
                      (reg12 >>> wire10[(2'h2):(1'h1)]) : (reg15[(5'h11):(3'h4)] <= (reg12 ?
                          wire10 : wire10)))});
            end
          reg17 <= reg16[(3'h7):(3'h7)];
          if ((8'hbc))
            begin
              reg18 <= wire9[(4'ha):(4'h8)];
              reg19 <= $signed((~|((|$unsigned(reg13)) > $signed($signed(reg13)))));
              reg20 <= (8'ha0);
            end
          else
            begin
              reg18 <= ({reg17,
                      (~^(wire9 ? $unsigned(reg14) : (reg18 != reg20)))} ?
                  (~|{$signed((wire9 ? wire11 : wire7))}) : ($signed((-reg16)) ?
                      (&wire7) : reg17));
              reg19 <= ($unsigned({$unsigned(reg17),
                      ($signed(reg16) << wire10[(2'h2):(1'h0)])}) ?
                  (8'ha1) : $signed($signed($unsigned($signed(reg12)))));
              reg20 <= wire9;
              reg21 <= (wire9 ? reg13[(4'h9):(4'h9)] : reg18);
            end
          reg22 <= $signed(reg15);
          if ((({reg17[(4'he):(4'h8)],
                  $unsigned((wire7 ^ reg12))} ~^ $signed((~&wire10[(3'h6):(3'h4)]))) ?
              wire9[(2'h3):(1'h1)] : reg21))
            begin
              reg23 <= {(~$signed(($unsigned(wire9) || (reg17 ?
                      wire11 : wire7)))),
                  $unsigned(reg19[(2'h3):(1'h0)])};
              reg24 <= ({{reg19, $signed(wire10)}, (&(~reg19[(1'h1):(1'h0)]))} ?
                  (8'hae) : $signed($unsigned($signed({(8'ha7), reg17}))));
            end
          else
            begin
              reg23 <= (8'haa);
              reg24 <= (|(reg21[(4'ha):(1'h1)] ?
                  $signed({(8'h9f)}) : $signed(($unsigned(reg16) ?
                      $signed(reg22) : reg15))));
              reg25 <= (~reg22[(2'h3):(1'h1)]);
            end
        end
      else
        begin
          reg14 <= (reg21[(1'h1):(1'h1)] ?
              ($unsigned($signed((reg14 ? (8'hb8) : reg16))) ?
                  {$signed(reg17)} : $signed(reg12[(3'h4):(3'h4)])) : (&$unsigned(((~&reg24) <= (|(8'hb1))))));
          reg15 <= $signed({reg19, reg25[(4'he):(1'h1)]});
          if (wire8)
            begin
              reg16 <= $signed(reg17[(4'he):(2'h3)]);
              reg17 <= (~^$signed({(reg12[(2'h2):(2'h2)] == ((8'hb9) * reg12))}));
              reg18 <= $signed((^~(~|reg15)));
              reg19 <= $signed($signed((!$signed($signed(reg12)))));
            end
          else
            begin
              reg16 <= ((~|$unsigned({$unsigned(reg25),
                  (reg24 ? reg22 : (8'hb7))})) == reg23);
              reg17 <= $signed(reg22);
            end
        end
    end
  assign wire26 = (($unsigned($signed($signed(reg13))) ?
                      wire10 : {$unsigned((reg19 ? reg18 : reg22)),
                          wire10}) - $signed(($signed((~|(8'had))) != $signed((|reg13)))));
  assign wire27 = (reg15 ?
                      (8'had) : {$signed({$signed(wire7), $unsigned((8'hb3))}),
                          ($signed((reg13 ?
                              reg24 : reg16)) & (~|$unsigned((8'hbf))))});
  assign wire28 = $signed((wire11[(3'h7):(3'h7)] == (($signed(wire7) || (wire27 ?
                      reg17 : reg24)) | $signed($unsigned(wire27)))));
  module29 #() modinst49 (.wire32(reg24), .wire30(wire11), .clk(clk), .y(wire48), .wire33(wire8), .wire31(wire28));
  assign wire50 = (($signed(reg17[(4'he):(4'he)]) - {(8'ha3)}) ?
                      $unsigned(reg25[(4'h9):(2'h3)]) : (reg18[(2'h2):(1'h0)] >> $unsigned((&(wire48 <<< (8'ha1))))));
  assign wire51 = $unsigned((~$unsigned($signed((reg16 ? reg17 : wire26)))));
  assign wire52 = (reg12[(2'h3):(1'h0)] ?
                      $signed(reg21) : ((wire50[(3'h6):(2'h3)] > $signed({wire7,
                          wire9})) | $unsigned($unsigned($unsigned((8'ha3))))));
endmodule

module module29
#(parameter param47 = ((((((8'had) ? (8'hbd) : (7'h44)) || ((8'h9d) << (8'ha2))) < (^~(^~(8'hbe)))) ? (!({(8'hac), (8'ha6)} ? {(8'ha3)} : ((8'hbe) << (8'hb5)))) : {(&((8'hbb) ? (8'hbb) : (8'ha8))), (-(|(8'hbb)))}) != ((7'h44) >= (+(+((8'ha3) ? (8'hb0) : (8'hb3)))))))
(y, clk, wire33, wire32, wire31, wire30);
  output wire [(32'h65):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire33;
  input wire [(3'h7):(1'h0)] wire32;
  input wire [(4'he):(1'h0)] wire31;
  input wire signed [(5'h15):(1'h0)] wire30;
  wire [(4'h9):(1'h0)] wire46;
  wire [(4'hf):(1'h0)] wire36;
  wire [(4'hc):(1'h0)] wire35;
  wire signed [(4'he):(1'h0)] wire34;
  reg [(3'h5):(1'h0)] reg45 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg43 = (1'h0);
  reg [(2'h2):(1'h0)] reg42 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg39 = (1'h0);
  reg [(4'he):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg37 = (1'h0);
  assign y = {wire46,
                 wire36,
                 wire35,
                 wire34,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 (1'h0)};
  assign wire34 = {(8'ha4), $signed((8'hbe))};
  assign wire35 = ({(|wire34[(4'he):(3'h7)])} ?
                      $signed((-(~|wire33))) : (^~({(~wire31),
                          wire33[(3'h7):(2'h3)]} != ((wire31 ?
                              wire33 : (8'hbb)) ?
                          $unsigned(wire31) : (wire31 != wire32)))));
  assign wire36 = $unsigned(wire30);
  always
    @(posedge clk) begin
      reg37 <= (&({(&{wire36}),
          ((wire35 >>> wire33) ?
              (wire33 ? wire31 : wire35) : (~|wire32))} & wire34));
      reg38 <= ((!wire33[(5'h12):(4'hf)]) << (~^$signed(wire30[(4'hb):(4'ha)])));
      reg39 <= (^~(wire32 ?
          ((reg37[(2'h3):(1'h0)] & wire30[(5'h12):(1'h0)]) ?
              $signed(((8'hbb) ?
                  (8'ha2) : reg38)) : (&(wire31 > reg38))) : ($unsigned((~&(8'hbb))) ?
              $unsigned((wire33 ?
                  wire32 : reg38)) : (((8'hb3) ~^ wire30) < wire31[(3'h5):(3'h4)]))));
      reg40 <= $unsigned($unsigned(((8'hb2) >> (~^reg37))));
      if (reg39)
        begin
          reg41 <= (reg37[(3'h7):(3'h6)] ?
              wire30[(4'hd):(3'h5)] : (!(~reg40[(2'h3):(1'h0)])));
          reg42 <= ((^{$signed((wire33 ? wire34 : (8'h9c))),
              wire30[(4'hf):(1'h0)]}) <= $signed((8'had)));
          reg43 <= $signed({$signed((wire33[(3'h6):(2'h3)] >= ((7'h43) & reg37)))});
          reg44 <= (|($unsigned(reg40) << $unsigned($signed(wire32))));
          reg45 <= $signed((wire34[(1'h1):(1'h1)] >>> (((+reg37) - (wire32 ?
              wire33 : wire34)) - wire36[(4'hc):(4'hb)])));
        end
      else
        begin
          reg41 <= $signed(reg44);
          reg42 <= wire34[(1'h0):(1'h0)];
          reg43 <= reg38[(4'h9):(2'h2)];
          reg44 <= (|wire31[(4'h9):(2'h2)]);
          reg45 <= ((~^$signed($unsigned(reg43[(2'h2):(1'h0)]))) && (~|wire34[(4'hb):(4'ha)]));
        end
    end
  assign wire46 = $signed($unsigned(((^~$signed(reg43)) > reg37[(1'h1):(1'h0)])));
endmodule
