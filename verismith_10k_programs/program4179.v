module top
#(parameter param91 = ({{({(8'ha2)} ? ((8'hbe) ? (8'hae) : (8'h9e)) : {(8'hbc), (8'ha2)}), ((&(8'h9f)) && (|(8'ha6)))}} >> (+((((8'hac) ? (8'h9e) : (8'ha5)) < {(8'ha1)}) ? ((8'hb9) >>> {(7'h42), (8'hbb)}) : (((7'h42) ? (7'h42) : (8'ha4)) > ((8'h9c) && (7'h41)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h96):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire90;
  wire [(5'h12):(1'h0)] wire89;
  wire [(4'hf):(1'h0)] wire87;
  wire signed [(4'hd):(1'h0)] wire63;
  wire [(4'hb):(1'h0)] wire62;
  wire [(2'h3):(1'h0)] wire61;
  wire signed [(5'h10):(1'h0)] wire59;
  wire signed [(4'hd):(1'h0)] wire7;
  wire [(4'hc):(1'h0)] wire6;
  wire [(4'hb):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire4;
  assign y = {wire90,
                 wire89,
                 wire87,
                 wire63,
                 wire62,
                 wire61,
                 wire59,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 (1'h0)};
  assign wire4 = $unsigned(wire1[(1'h1):(1'h0)]);
  assign wire5 = (~^($signed($signed((wire3 + wire0))) << wire2));
  assign wire6 = ({wire5} ?
                     $unsigned(wire5[(2'h3):(1'h1)]) : {wire0[(3'h4):(1'h0)],
                         $signed({wire4})});
  assign wire7 = $signed((wire3 <<< $signed((+(wire1 ? wire6 : wire5)))));
  module8 #() modinst60 (.y(wire59), .wire9(wire4), .wire10(wire6), .clk(clk), .wire12(wire5), .wire11(wire7));
  assign wire61 = wire6[(4'h8):(1'h0)];
  assign wire62 = (wire4[(3'h7):(1'h1)] ?
                      ($unsigned((^~$unsigned(wire2))) ?
                          (wire3 == (+(wire4 | wire5))) : $signed(wire5)) : $unsigned(wire0[(2'h3):(2'h3)]));
  assign wire63 = ((^~$unsigned(wire61[(1'h1):(1'h1)])) >> ((7'h43) ^ (8'ha2)));
  module64 #() modinst88 (.wire65(wire2), .clk(clk), .wire68(wire1), .y(wire87), .wire66(wire0), .wire67(wire4));
  assign wire89 = {wire6[(4'h9):(2'h3)], wire61};
  assign wire90 = (($unsigned(((-wire0) > ((8'ha7) && wire1))) ?
                          ($signed($unsigned((8'haf))) ?
                              (|$unsigned(wire87)) : ((!wire89) != $unsigned(wire61))) : (wire87 ?
                              (^wire4[(1'h1):(1'h1)]) : (wire4 >> (wire6 >> wire3)))) ?
                      (~|(~|$signed($unsigned(wire6)))) : ({$signed(wire0[(2'h2):(1'h0)])} && (~&{$signed((8'hbc)),
                          wire87})));
endmodule

module module64
#(parameter param86 = (~((^~(8'hb6)) << ((((8'hbf) ? (8'hb8) : (8'had)) ? (-(8'ha5)) : (!(8'hb9))) ? {(8'hba), ((8'hac) ? (8'h9c) : (8'hb8))} : ((!(8'h9e)) ~^ (^(8'hb3)))))))
(y, clk, wire68, wire67, wire66, wire65);
  output wire [(32'hbf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire68;
  input wire [(5'h14):(1'h0)] wire67;
  input wire signed [(3'h4):(1'h0)] wire66;
  input wire [(5'h11):(1'h0)] wire65;
  wire [(5'h14):(1'h0)] wire85;
  wire signed [(4'he):(1'h0)] wire84;
  wire [(3'h4):(1'h0)] wire83;
  wire signed [(2'h3):(1'h0)] wire82;
  wire [(3'h6):(1'h0)] wire81;
  wire [(2'h3):(1'h0)] wire80;
  wire [(5'h13):(1'h0)] wire76;
  wire [(3'h7):(1'h0)] wire75;
  wire [(3'h5):(1'h0)] wire74;
  wire signed [(4'ha):(1'h0)] wire73;
  wire signed [(3'h7):(1'h0)] wire71;
  wire [(5'h10):(1'h0)] wire70;
  wire [(4'hc):(1'h0)] wire69;
  reg signed [(5'h11):(1'h0)] reg79 = (1'h0);
  reg [(5'h12):(1'h0)] reg78 = (1'h0);
  reg [(5'h10):(1'h0)] reg77 = (1'h0);
  reg [(4'hd):(1'h0)] reg72 = (1'h0);
  assign y = {wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire71,
                 wire70,
                 wire69,
                 reg79,
                 reg78,
                 reg77,
                 reg72,
                 (1'h0)};
  assign wire69 = wire68;
  assign wire70 = (8'had);
  assign wire71 = $signed($unsigned((~|(~^$signed(wire65)))));
  always
    @(posedge clk) begin
      reg72 <= (^~$signed(wire68));
    end
  assign wire73 = $unsigned($signed($unsigned({(~|wire65),
                      (wire71 || wire68)})));
  assign wire74 = wire70[(4'h8):(3'h7)];
  assign wire75 = $signed(wire67[(4'hf):(3'h7)]);
  assign wire76 = wire67[(4'hf):(3'h7)];
  always
    @(posedge clk) begin
      reg77 <= $signed((~^((^~(!wire76)) ^ {$unsigned(wire70), (|(7'h41))})));
      reg78 <= $signed($signed(wire71[(3'h5):(3'h4)]));
      reg79 <= (-$unsigned($signed($signed($signed(wire70)))));
    end
  assign wire80 = ($signed((8'hba)) ?
                      (wire71 ?
                          ($unsigned((wire71 & wire74)) ?
                              wire71 : (^~$signed((8'hbe)))) : ((wire75[(1'h0):(1'h0)] ?
                              ((8'hae) || wire69) : {wire75}) <= $signed(reg72))) : $signed($unsigned($signed((wire65 >> wire75)))));
  assign wire81 = $signed((({reg78} ?
                          (~^$signed((7'h42))) : {$signed((8'hb2)),
                              (wire68 > wire80)}) ?
                      wire66 : $unsigned(wire75[(3'h6):(3'h5)])));
  assign wire82 = {wire66};
  assign wire83 = $signed(($unsigned($unsigned($unsigned(wire71))) ?
                      (+(~^wire80[(2'h3):(2'h2)])) : wire66));
  assign wire84 = (8'hb0);
  assign wire85 = (-(&({(wire82 ^~ (7'h40))} < ($unsigned(wire71) ?
                      reg79 : (~&wire81)))));
endmodule

module module8
#(parameter param58 = (((((~|(8'ha8)) || {(8'hae), (8'h9d)}) | ({(7'h44), (8'had)} ? (~^(8'hb7)) : ((8'ha5) < (8'hae)))) | (|(((8'hb9) | (8'hb4)) < ((7'h44) ? (8'h9f) : (8'hbf))))) * ({(((8'hac) > (8'h9f)) ? (8'ha9) : (8'hb5)), ((&(7'h43)) ~^ ((8'hb9) ? (7'h40) : (8'had)))} > ((((7'h40) ? (8'ha7) : (8'hac)) >> (~|(8'h9e))) ? (&(~^(8'ha0))) : (^((8'hb8) ? (8'hb3) : (7'h42)))))))
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h1f6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire12;
  input wire [(4'hb):(1'h0)] wire11;
  input wire signed [(2'h2):(1'h0)] wire10;
  input wire signed [(3'h4):(1'h0)] wire9;
  wire signed [(3'h4):(1'h0)] wire57;
  wire [(2'h2):(1'h0)] wire39;
  wire signed [(2'h2):(1'h0)] wire38;
  wire [(5'h15):(1'h0)] wire37;
  wire [(5'h11):(1'h0)] wire36;
  wire signed [(2'h2):(1'h0)] wire35;
  wire [(4'ha):(1'h0)] wire34;
  wire signed [(2'h2):(1'h0)] wire33;
  wire [(4'he):(1'h0)] wire32;
  wire signed [(4'hd):(1'h0)] wire31;
  wire [(2'h2):(1'h0)] wire30;
  wire signed [(3'h5):(1'h0)] wire13;
  reg signed [(5'h15):(1'h0)] reg56 = (1'h0);
  reg [(5'h10):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg54 = (1'h0);
  reg [(4'he):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg50 = (1'h0);
  reg [(4'hc):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg47 = (1'h0);
  reg [(3'h5):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg44 = (1'h0);
  reg [(4'he):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg42 = (1'h0);
  reg [(4'hb):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg40 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg28 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg27 = (1'h0);
  reg [(3'h7):(1'h0)] reg26 = (1'h0);
  reg signed [(4'he):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg24 = (1'h0);
  reg [(5'h15):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg20 = (1'h0);
  reg [(4'he):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg17 = (1'h0);
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg [(4'hd):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg14 = (1'h0);
  assign y = {wire57,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire13,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
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
                 reg40,
                 reg29,
                 reg28,
                 reg27,
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
                 reg14,
                 (1'h0)};
  assign wire13 = ((({$signed(wire12),
                              (wire9 || (8'hb3))} != (^$unsigned(wire9))) ?
                          (^{(^wire12),
                              $unsigned(wire11)}) : $unsigned(((~^wire12) ?
                              (8'hb5) : (wire12 ? wire9 : wire9)))) ?
                      wire12 : $signed((~^($signed(wire9) ^~ $signed(wire10)))));
  always
    @(posedge clk) begin
      if ($signed($unsigned($unsigned($unsigned($signed(wire12))))))
        begin
          reg14 <= $unsigned($unsigned(wire10[(1'h1):(1'h1)]));
          reg15 <= ((-{((wire11 < wire12) & (reg14 ? wire9 : wire11)),
              reg14[(4'h8):(1'h1)]}) + $signed(reg14[(4'hb):(2'h2)]));
        end
      else
        begin
          reg14 <= {wire11};
          if ({((!wire10[(1'h1):(1'h0)]) >= reg15[(2'h3):(2'h3)])})
            begin
              reg15 <= wire13;
              reg16 <= (reg15 ?
                  $signed($signed(((8'ha0) & wire11[(4'ha):(4'ha)]))) : $unsigned($unsigned(({wire13} + ((8'hb8) > wire12)))));
              reg17 <= $unsigned(wire11[(2'h3):(2'h3)]);
              reg18 <= (+$unsigned((reg14 ?
                  $unsigned(reg16[(2'h3):(1'h1)]) : $signed($signed(reg15)))));
            end
          else
            begin
              reg15 <= (+reg17[(2'h2):(1'h1)]);
              reg16 <= wire10[(1'h0):(1'h0)];
            end
          reg19 <= wire12[(2'h3):(2'h2)];
          if ((~|$unsigned((|$signed($signed(reg16))))))
            begin
              reg20 <= $signed(wire9[(2'h3):(1'h1)]);
              reg21 <= ($signed(wire9[(2'h2):(2'h2)]) + (+wire11));
              reg22 <= $unsigned($signed(reg17));
            end
          else
            begin
              reg20 <= $signed(reg15[(2'h3):(2'h3)]);
            end
        end
      reg23 <= reg17[(1'h1):(1'h0)];
      if (reg19[(2'h2):(1'h0)])
        begin
          reg24 <= ((&{(reg17 ? $unsigned(reg18) : (~|reg21)),
                  $signed(reg18)}) ?
              ({((~wire13) && wire10[(1'h1):(1'h0)]),
                  $signed(reg20[(4'ha):(3'h7)])} > $unsigned(reg14[(2'h3):(1'h0)])) : (({(wire9 ?
                              reg21 : reg17),
                          $unsigned((8'ha1))} ?
                      (~|$signed(reg16)) : $signed(((8'ha0) ? reg17 : reg17))) ?
                  reg18 : (-wire9[(2'h2):(1'h0)])));
          reg25 <= $signed($unsigned((reg15[(2'h3):(2'h2)] ^ $signed({reg22,
              wire9}))));
          if (reg23[(3'h5):(2'h3)])
            begin
              reg26 <= wire10[(1'h0):(1'h0)];
            end
          else
            begin
              reg26 <= wire13;
              reg27 <= reg26[(2'h2):(1'h0)];
            end
        end
      else
        begin
          reg24 <= (8'hbc);
          reg25 <= (+$signed((^~reg24[(4'hd):(3'h5)])));
        end
      if ((&($unsigned($unsigned((~reg25))) > (8'ha8))))
        begin
          reg28 <= $signed({(reg22 ?
                  reg21[(4'hd):(2'h2)] : {(reg27 ? reg27 : reg24)}),
              reg25[(3'h7):(3'h6)]});
          reg29 <= reg18[(2'h3):(1'h1)];
        end
      else
        begin
          reg28 <= ($signed($signed((~|(|(7'h41))))) <= (~^reg26[(3'h6):(1'h1)]));
          reg29 <= $signed(wire10);
        end
    end
  assign wire30 = (((reg23 ?
                              $unsigned((reg29 < wire9)) : ((wire11 >>> reg14) ?
                                  $signed(reg14) : (reg15 ? reg17 : wire11))) ?
                          ($signed($signed(reg27)) ?
                              $unsigned(reg25[(1'h0):(1'h0)]) : (~^$signed(reg16))) : {reg20}) ?
                      ($unsigned((~$signed(reg27))) ?
                          reg14 : ($unsigned(reg22) ?
                              (~^wire13[(3'h4):(3'h4)]) : ($unsigned(reg23) ?
                                  $signed((8'hb1)) : $unsigned((8'hb9))))) : (reg23[(5'h13):(5'h12)] || (((reg14 * wire9) & (+reg24)) ~^ wire10[(1'h1):(1'h0)])));
  assign wire31 = reg22[(3'h4):(2'h3)];
  assign wire32 = $unsigned({(8'ha4), reg20});
  assign wire33 = $signed((8'hb3));
  assign wire34 = reg20[(2'h3):(1'h0)];
  assign wire35 = (8'ha4);
  assign wire36 = $unsigned((~^(wire31[(2'h3):(2'h2)] ?
                      (~|wire13) : $unsigned($signed((8'ha9))))));
  assign wire37 = (&reg29);
  assign wire38 = $unsigned(((~&wire37[(5'h11):(4'h8)]) >>> wire13));
  assign wire39 = reg15[(3'h4):(1'h1)];
  always
    @(posedge clk) begin
      if ((~&reg24[(5'h12):(4'hc)]))
        begin
          reg40 <= ((-$unsigned($signed((~^(8'haa))))) ?
              (~(reg22 ? reg28 : $unsigned((+wire39)))) : ({(~(8'ha6))} ?
                  $unsigned(wire37) : (reg24[(4'hd):(3'h7)] * (&wire12))));
          reg41 <= wire31[(3'h7):(3'h4)];
          if (reg20[(3'h6):(3'h5)])
            begin
              reg42 <= reg26[(2'h3):(2'h2)];
              reg43 <= reg41;
              reg44 <= ((~&(reg17 ?
                  ((reg23 != reg26) ?
                      wire9[(1'h1):(1'h0)] : {wire34}) : ((^reg15) || {wire39}))) >>> reg20);
              reg45 <= $unsigned((((^~{reg15, wire11}) ^ ((~|wire39) ?
                      (wire30 ? reg29 : reg25) : (reg22 ? (8'haf) : reg18))) ?
                  reg16[(3'h5):(1'h1)] : reg23));
            end
          else
            begin
              reg42 <= reg27[(3'h5):(2'h2)];
              reg43 <= wire31;
              reg44 <= (!$unsigned($signed(($signed((8'ha8)) ?
                  (wire10 | reg42) : ((8'hbc) ? reg27 : wire39)))));
              reg45 <= wire9[(2'h3):(2'h3)];
              reg46 <= {{($signed($unsigned(reg16)) ?
                          reg14 : $unsigned($unsigned(wire35)))}};
            end
        end
      else
        begin
          reg40 <= $unsigned((~|reg24[(4'hb):(3'h4)]));
          reg41 <= $unsigned(reg24);
          reg42 <= (!{$unsigned((-{reg28}))});
          reg43 <= $unsigned(wire31[(4'h9):(4'h9)]);
        end
      if ($unsigned(reg14))
        begin
          reg47 <= (({(reg43 <<< {reg26}),
                  $unsigned((~&(8'h9d)))} || $unsigned((~|$unsigned(wire30)))) ?
              ({(~^$unsigned(wire10))} | wire39[(1'h1):(1'h1)]) : wire9[(1'h1):(1'h1)]);
          reg48 <= ({(wire12 ?
                  ({reg23} - (reg25 ?
                      wire36 : wire12)) : (reg25 < wire38[(1'h1):(1'h0)]))} + wire34);
          reg49 <= reg43;
          reg50 <= ((wire30[(2'h2):(2'h2)] * $unsigned($unsigned((reg27 ^~ reg40)))) ?
              reg28 : $signed($unsigned($unsigned(reg25[(4'hb):(1'h1)]))));
        end
      else
        begin
          reg47 <= $signed((!{$signed(reg27[(3'h4):(1'h0)])}));
          if ((((wire30 ?
              (-(8'ha0)) : (reg46[(2'h2):(1'h1)] * $signed(reg22))) || $unsigned(reg20[(3'h4):(1'h1)])) || reg50))
            begin
              reg48 <= $unsigned(reg18);
              reg49 <= wire35[(2'h2):(1'h1)];
              reg50 <= $unsigned($unsigned(wire31[(4'hc):(4'ha)]));
              reg51 <= (|(reg27 ^~ $signed((-$signed(reg21)))));
              reg52 <= $signed((~$unsigned(reg27[(3'h4):(2'h2)])));
            end
          else
            begin
              reg48 <= $signed((reg16[(4'hc):(3'h4)] ?
                  (!$unsigned(reg22)) : $unsigned($signed($unsigned(reg29)))));
              reg49 <= {(reg15 ?
                      reg23[(4'ha):(4'h8)] : (({reg24} >> reg44) << ((~^wire11) >> (!wire34))))};
            end
          if (reg48[(4'h8):(4'h8)])
            begin
              reg53 <= reg18;
              reg54 <= (&reg14[(4'h9):(3'h6)]);
            end
          else
            begin
              reg53 <= (^~(wire11[(3'h4):(2'h2)] >>> ($signed((8'ha3)) ^ $unsigned($signed(wire10)))));
            end
        end
      reg55 <= $signed((($unsigned(reg52) | wire33) & $unsigned((wire9[(3'h4):(2'h3)] ?
          (wire10 * reg44) : $unsigned((8'ha2))))));
      reg56 <= ((&reg14) << ((reg49[(2'h2):(2'h2)] ?
              ((&reg43) < ((8'hbf) ? reg40 : reg45)) : ((~&reg15) ?
                  {(8'hbe), wire33} : {reg50, reg42})) ?
          (~&((reg29 * reg25) >>> reg28)) : (|(reg20 ^ $unsigned((8'h9f))))));
    end
  assign wire57 = ($unsigned(($unsigned(wire32) ?
                      ((reg56 ?
                          wire13 : reg27) - wire10) : reg18[(3'h4):(1'h1)])) ^ (~&((reg44 ?
                          {wire36, wire9} : $signed(wire36)) ?
                      {(reg43 << reg22)} : reg47[(2'h2):(1'h0)])));
endmodule
