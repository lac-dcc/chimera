module top
#(parameter param94 = (((&(((8'hbc) ^~ (7'h42)) & (|(8'hbc)))) ? (|(((8'ha0) ? (8'h9c) : (8'hbe)) ? ((8'h9e) ? (7'h40) : (8'haf)) : {(8'hab), (8'ha0)})) : {((!(8'h9c)) ? ((8'ha4) < (8'haa)) : {(8'hb9)}), (((8'hb9) ? (8'h9c) : (8'hb3)) ^~ (-(8'hb5)))}) * (((((8'hbd) ? (8'haa) : (8'ha7)) ? {(7'h42), (8'hab)} : ((8'hbd) < (8'ha1))) ? (((8'hb9) ? (8'had) : (8'hac)) ? (+(8'ha3)) : {(8'ha4)}) : {(~&(8'hbb)), ((8'ha8) ? (8'ha8) : (8'hb5))}) ? (-(((8'ha4) ? (8'had) : (8'hb1)) ? ((8'hbd) | (7'h44)) : (-(8'h9c)))) : (((^(8'hb8)) * ((8'hb6) >> (7'h40))) ? (8'hbd) : (^((8'hbf) && (8'ha2)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h5f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire93;
  wire [(4'h9):(1'h0)] wire92;
  wire [(4'hb):(1'h0)] wire91;
  wire [(4'hb):(1'h0)] wire90;
  wire signed [(4'hb):(1'h0)] wire88;
  wire [(5'h15):(1'h0)] wire5;
  wire signed [(4'hb):(1'h0)] wire4;
  assign y = {wire93, wire92, wire91, wire90, wire88, wire5, wire4, (1'h0)};
  assign wire4 = $unsigned(wire0);
  assign wire5 = $unsigned($signed({(8'hbf),
                     ((wire0 ? wire0 : wire3) ^ (&wire2))}));
  module6 #() modinst89 (.wire8(wire0), .y(wire88), .clk(clk), .wire10(wire5), .wire7(wire1), .wire9(wire4));
  assign wire90 = $signed($unsigned($unsigned(wire3[(3'h6):(2'h2)])));
  assign wire91 = wire4;
  assign wire92 = ((wire5 ^ wire88) ?
                      ($signed((|(-wire2))) ?
                          {wire2} : (|wire3[(5'h12):(1'h1)])) : ({$signed(wire3)} != (^$unsigned(wire0))));
  assign wire93 = ({wire2[(2'h3):(2'h2)],
                      (~^wire5[(4'h9):(3'h7)])} != wire92[(2'h3):(1'h1)]);
endmodule

module module6
#(parameter param86 = {(((((8'hab) ? (8'ha3) : (8'ha5)) ? ((8'had) >= (8'haf)) : ((8'h9d) >= (8'hb6))) ? (((8'hb3) ^~ (8'hbc)) * (8'ha3)) : (&((7'h41) ? (8'hb8) : (8'h9d)))) ? (&(~^((8'ha1) ? (8'hbc) : (8'ha1)))) : ({{(8'h9e)}, {(7'h41), (8'hbc)}} ? (((8'hb0) >= (8'hba)) || ((8'ha9) ? (8'ha0) : (7'h42))) : (~&((8'ha6) ^~ (8'hb4)))))}, 
parameter param87 = {{(8'ha6)}})
(y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'h108):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire7;
  input wire [(5'h15):(1'h0)] wire8;
  input wire [(4'hb):(1'h0)] wire9;
  input wire [(5'h15):(1'h0)] wire10;
  wire signed [(3'h5):(1'h0)] wire85;
  wire [(2'h2):(1'h0)] wire84;
  wire [(5'h15):(1'h0)] wire82;
  wire signed [(2'h2):(1'h0)] wire54;
  wire [(5'h11):(1'h0)] wire53;
  wire [(4'h9):(1'h0)] wire52;
  wire [(4'h8):(1'h0)] wire51;
  wire signed [(5'h11):(1'h0)] wire49;
  wire [(4'ha):(1'h0)] wire37;
  wire [(3'h5):(1'h0)] wire21;
  wire [(2'h3):(1'h0)] wire22;
  wire signed [(5'h14):(1'h0)] wire23;
  wire [(5'h10):(1'h0)] wire24;
  wire signed [(2'h3):(1'h0)] wire35;
  reg signed [(4'ha):(1'h0)] reg11 = (1'h0);
  reg [(5'h15):(1'h0)] reg12 = (1'h0);
  reg signed [(4'he):(1'h0)] reg13 = (1'h0);
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg15 = (1'h0);
  reg [(4'h9):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg18 = (1'h0);
  reg [(3'h7):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg20 = (1'h0);
  assign y = {wire85,
                 wire84,
                 wire82,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire49,
                 wire37,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire35,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (((8'hab) ? wire10[(3'h5):(1'h0)] : wire10))
        begin
          reg11 <= $unsigned($unsigned($unsigned(wire8[(4'h9):(4'h9)])));
          reg12 <= ({(^~$unsigned(wire8[(3'h6):(2'h2)])),
                  $signed(($signed(reg11) ~^ $signed((8'ha9))))} ?
              wire8[(5'h11):(3'h4)] : wire8[(4'hd):(3'h7)]);
          reg13 <= (~|$unsigned(wire9[(4'h8):(3'h6)]));
          if (({$unsigned({{wire8, wire7}, $unsigned(reg11)}),
              reg12} - (($signed((wire8 - wire10)) ?
              (wire8[(3'h5):(2'h2)] ?
                  ((8'hb4) != reg12) : $unsigned(wire9)) : wire10) >>> reg11[(4'h8):(1'h1)])))
            begin
              reg14 <= {$signed(reg13[(2'h2):(1'h0)])};
              reg15 <= reg12[(2'h2):(2'h2)];
              reg16 <= $unsigned((^~reg15[(1'h0):(1'h0)]));
            end
          else
            begin
              reg14 <= (reg11[(4'ha):(4'h8)] ^~ (($signed(wire10[(4'h8):(3'h5)]) >>> $unsigned(reg11)) == reg11));
              reg15 <= $unsigned(wire9);
              reg16 <= reg14;
            end
        end
      else
        begin
          reg11 <= $signed($unsigned({$unsigned((reg12 | reg14))}));
          if (reg14[(5'h12):(3'h7)])
            begin
              reg12 <= (~($signed(reg12) ?
                  (reg11 ?
                      {(reg13 ? reg16 : reg16),
                          wire9[(2'h3):(2'h2)]} : $unsigned($signed(wire7))) : $unsigned(({(7'h42)} || reg12))));
              reg13 <= $unsigned(($signed($signed(wire7)) ?
                  $unsigned(((^wire8) >>> $signed((8'hb4)))) : wire8));
              reg14 <= reg12;
              reg15 <= (+reg15);
            end
          else
            begin
              reg12 <= ({reg11[(1'h0):(1'h0)]} > reg15);
              reg13 <= reg12;
            end
          if (reg13)
            begin
              reg16 <= (-reg16[(3'h7):(3'h5)]);
              reg17 <= (-wire8[(5'h12):(4'h9)]);
            end
          else
            begin
              reg16 <= $unsigned($unsigned(reg12));
            end
          if ((-(~&(reg12 <= reg11))))
            begin
              reg18 <= (8'hb5);
            end
          else
            begin
              reg18 <= $unsigned(wire8[(3'h7):(2'h2)]);
              reg19 <= reg13;
              reg20 <= (((({reg14, reg19} ? (&reg13) : (^~wire9)) ?
                      reg15 : reg11) ?
                  wire8 : $unsigned($unsigned((wire8 != (8'ha9))))) <<< reg15[(2'h3):(2'h2)]);
            end
        end
    end
  assign wire21 = reg13[(2'h2):(1'h0)];
  assign wire22 = $signed(($signed({$unsigned(wire10),
                          ((8'hb2) ? reg11 : wire21)}) ?
                      (($unsigned(reg18) >>> {wire7}) > {wire9}) : reg16));
  assign wire23 = $signed(reg15);
  assign wire24 = $unsigned({(8'hb9)});
  module25 #() modinst36 (.y(wire35), .wire30(reg14), .wire27(wire10), .clk(clk), .wire26(reg18), .wire28(wire21), .wire29(wire23));
  assign wire37 = $signed({(+$unsigned((wire24 || wire9))),
                      {$unsigned($unsigned(wire7))}});
  module38 #() modinst50 (wire49, clk, wire23, wire24, reg14, wire10, wire9);
  assign wire51 = $unsigned((|$unsigned($unsigned(reg14))));
  assign wire52 = {$signed(wire24)};
  assign wire53 = (wire8[(2'h2):(1'h1)] ?
                      wire23 : (wire37 ?
                          wire49[(3'h5):(1'h0)] : $signed({wire22[(1'h0):(1'h0)],
                              reg11})));
  assign wire54 = ({($unsigned((reg20 <= wire10)) == wire10),
                      (~^(~^$unsigned(reg18)))} ^~ (reg18 > wire21[(3'h4):(2'h3)]));
  module55 #() modinst83 (wire82, clk, reg13, reg14, reg12, reg15);
  assign wire84 = ((({(reg17 ~^ reg14), (reg15 ? wire10 : reg16)} ?
                              (~|$signed(wire49)) : wire21) ?
                          (8'h9c) : wire22) ?
                      $signed(((8'haa) ?
                          ($signed(wire53) ?
                              $signed((8'hb5)) : wire7) : (+((8'hbd) || wire51)))) : (8'hb7));
  assign wire85 = {wire37[(3'h4):(2'h3)]};
endmodule

module module55  (y, clk, wire59, wire58, wire57, wire56);
  output wire [(32'hf3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire59;
  input wire signed [(5'h10):(1'h0)] wire58;
  input wire signed [(5'h15):(1'h0)] wire57;
  input wire [(4'ha):(1'h0)] wire56;
  wire signed [(3'h5):(1'h0)] wire81;
  wire [(4'ha):(1'h0)] wire80;
  wire [(3'h4):(1'h0)] wire79;
  wire signed [(5'h15):(1'h0)] wire78;
  wire signed [(4'hf):(1'h0)] wire77;
  wire [(3'h5):(1'h0)] wire76;
  wire signed [(3'h5):(1'h0)] wire75;
  wire [(3'h6):(1'h0)] wire74;
  wire signed [(5'h10):(1'h0)] wire73;
  wire [(4'hf):(1'h0)] wire67;
  wire signed [(4'hd):(1'h0)] wire66;
  wire [(4'h8):(1'h0)] wire65;
  wire [(5'h13):(1'h0)] wire64;
  wire signed [(5'h12):(1'h0)] wire63;
  wire [(3'h4):(1'h0)] wire62;
  wire signed [(3'h4):(1'h0)] wire61;
  wire signed [(4'he):(1'h0)] wire60;
  reg signed [(3'h7):(1'h0)] reg72 = (1'h0);
  reg [(5'h14):(1'h0)] reg71 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg70 = (1'h0);
  reg [(5'h12):(1'h0)] reg69 = (1'h0);
  reg [(3'h5):(1'h0)] reg68 = (1'h0);
  assign y = {wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 (1'h0)};
  assign wire60 = (!({$signed({wire58, wire57})} + (~&(~|$signed(wire59)))));
  assign wire61 = wire56[(3'h4):(3'h4)];
  assign wire62 = $unsigned((wire60 == ((^~(~|(8'hb5))) ?
                      ({(8'had), wire60} ?
                          wire61 : (wire57 ?
                              wire58 : wire61)) : $signed({(8'haf)}))));
  assign wire63 = (|$unsigned(wire57[(4'hf):(3'h7)]));
  assign wire64 = {$unsigned((&wire59))};
  assign wire65 = (wire59 + wire63);
  assign wire66 = {wire60[(4'hb):(3'h7)]};
  assign wire67 = (~^(~^wire61));
  always
    @(posedge clk) begin
      if (({((wire67 != wire64[(1'h0):(1'h0)]) ?
                  wire60 : ($unsigned(wire59) ?
                      (+(8'h9d)) : (wire59 & wire66))),
              (wire64[(2'h2):(1'h0)] ? $unsigned($unsigned(wire65)) : wire63)} ?
          wire66[(4'hc):(4'hc)] : ($unsigned((wire59[(3'h7):(1'h1)] ?
              $signed(wire61) : (wire56 ?
                  wire61 : (7'h42)))) | ($unsigned({wire57}) ?
              {$signed(wire57), wire66} : $unsigned((8'hbb))))))
        begin
          reg68 <= ($unsigned((8'h9c)) ? wire66 : wire62[(1'h0):(1'h0)]);
          reg69 <= $signed($signed({{$unsigned(wire61)},
              $signed($signed((8'ha3)))}));
        end
      else
        begin
          reg68 <= wire62[(3'h4):(2'h2)];
          reg69 <= wire61[(1'h0):(1'h0)];
          reg70 <= $unsigned((8'hbc));
        end
      reg71 <= wire63[(4'hf):(4'hf)];
      reg72 <= wire67;
    end
  assign wire73 = reg70;
  assign wire74 = $unsigned({wire56[(3'h5):(1'h1)], (8'hbe)});
  assign wire75 = reg70;
  assign wire76 = ((+$unsigned(($unsigned(wire58) != reg68[(2'h2):(1'h1)]))) >>> (($unsigned((8'hbf)) ^ ((wire60 ?
                              reg68 : wire75) ?
                          wire75[(2'h3):(2'h2)] : wire56)) ?
                      ($signed(wire60[(1'h1):(1'h1)]) * wire66) : (reg69 < (wire75 ?
                          ((8'haa) != wire61) : $unsigned(reg70)))));
  assign wire77 = (((wire63 < $unsigned(wire64[(3'h4):(1'h0)])) ?
                      ({{wire65, wire59},
                          $unsigned(reg71)} != wire62) : wire56) != (8'haa));
  assign wire78 = wire65;
  assign wire79 = wire60;
  assign wire80 = $unsigned(wire65);
  assign wire81 = $signed(wire66[(3'h6):(1'h0)]);
endmodule

module module38  (y, clk, wire43, wire42, wire41, wire40, wire39);
  output wire [(32'h3c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire43;
  input wire [(5'h10):(1'h0)] wire42;
  input wire signed [(4'he):(1'h0)] wire41;
  input wire signed [(4'hf):(1'h0)] wire40;
  input wire signed [(2'h3):(1'h0)] wire39;
  wire [(2'h3):(1'h0)] wire48;
  wire [(4'hf):(1'h0)] wire47;
  wire [(4'hc):(1'h0)] wire46;
  wire signed [(4'h9):(1'h0)] wire45;
  wire signed [(5'h14):(1'h0)] wire44;
  assign y = {wire48, wire47, wire46, wire45, wire44, (1'h0)};
  assign wire44 = wire41;
  assign wire45 = wire44;
  assign wire46 = wire39[(2'h3):(2'h2)];
  assign wire47 = (-$unsigned(wire39[(1'h1):(1'h0)]));
  assign wire48 = $signed((^wire47[(2'h2):(2'h2)]));
endmodule

module module25  (y, clk, wire30, wire29, wire28, wire27, wire26);
  output wire [(32'h32):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire30;
  input wire signed [(5'h13):(1'h0)] wire29;
  input wire signed [(3'h5):(1'h0)] wire28;
  input wire signed [(5'h15):(1'h0)] wire27;
  input wire signed [(3'h5):(1'h0)] wire26;
  wire signed [(3'h4):(1'h0)] wire34;
  wire signed [(5'h15):(1'h0)] wire33;
  wire [(4'h9):(1'h0)] wire32;
  wire signed [(4'hf):(1'h0)] wire31;
  assign y = {wire34, wire33, wire32, wire31, (1'h0)};
  assign wire31 = (^((+((~(7'h44)) > $signed((8'hac)))) ?
                      wire30 : $signed((8'hb1))));
  assign wire32 = ((((wire30[(4'hd):(4'ha)] ? wire27 : wire31) <<< ((-(8'h9f)) ?
                      (wire28 ?
                          wire26 : wire27) : $signed(wire31))) < wire26) & wire27);
  assign wire33 = $unsigned((~|(($unsigned(wire29) >= $signed(wire26)) ^~ wire26[(2'h2):(1'h0)])));
  assign wire34 = (((|$unsigned((7'h41))) ?
                          ($unsigned(wire30) == ((wire33 ? wire27 : wire31) ?
                              ((7'h40) ?
                                  wire26 : wire28) : (wire33 >= wire28))) : wire28) ?
                      $signed(wire27[(4'ha):(2'h2)]) : wire31);
endmodule
