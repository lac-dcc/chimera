module top
#(parameter param151 = ((~|((~((8'hb7) >= (8'hb7))) >= (((8'hb9) <<< (8'hb5)) - (&(8'hb5))))) ? (~&{(((8'hbe) <<< (7'h40)) < (~&(8'hba)))}) : (^~(((|(8'hb5)) ? (8'hb9) : {(8'ha8), (7'h42)}) * (((7'h41) <<< (8'hba)) ? ((8'had) ? (8'hba) : (8'hb7)) : {(8'hbc)})))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h8d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire150;
  wire signed [(4'hd):(1'h0)] wire149;
  wire signed [(4'hf):(1'h0)] wire146;
  wire [(4'hb):(1'h0)] wire145;
  wire signed [(4'hf):(1'h0)] wire144;
  wire [(5'h10):(1'h0)] wire143;
  wire signed [(4'h8):(1'h0)] wire142;
  wire [(2'h2):(1'h0)] wire140;
  wire signed [(4'he):(1'h0)] wire6;
  wire signed [(3'h6):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire4;
  reg [(3'h5):(1'h0)] reg148 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg147 = (1'h0);
  assign y = {wire150,
                 wire149,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire140,
                 wire6,
                 wire5,
                 wire4,
                 reg148,
                 reg147,
                 (1'h0)};
  assign wire4 = (&((~^((wire2 ? (8'ha8) : wire2) ?
                     wire2 : (wire0 ? wire1 : wire1))) <= $unsigned((&(wire0 ?
                     wire2 : wire0)))));
  assign wire5 = {(~|wire0),
                     ($signed($signed(wire1[(1'h0):(1'h0)])) > ((!wire0[(4'he):(1'h1)]) >> (+{wire4})))};
  assign wire6 = (-(({wire2} < $unsigned((&wire2))) ?
                     ((wire5 ? (wire4 >> wire2) : wire4) ?
                         $unsigned((^~wire2)) : $signed((~^wire0))) : ((~^wire1[(2'h3):(2'h2)]) ?
                         wire3[(4'hb):(3'h4)] : wire1[(2'h3):(1'h0)])));
  module7 #() modinst141 (wire140, clk, wire6, wire3, wire1, wire0);
  assign wire142 = (wire140 ?
                       $unsigned(((&$unsigned(wire2)) ?
                           (|$signed(wire2)) : $unsigned($signed(wire4)))) : (^~wire2[(4'hb):(2'h2)]));
  assign wire143 = $unsigned(($signed($unsigned(((8'ha7) ?
                           wire142 : wire142))) ?
                       $unsigned(wire0[(3'h7):(3'h5)]) : $signed($unsigned({wire2}))));
  assign wire144 = ((wire3[(4'ha):(4'ha)] ?
                       $signed(wire142) : wire0) | (wire3 <<< wire6[(4'hb):(3'h5)]));
  assign wire145 = $unsigned(($unsigned({wire2[(3'h5):(2'h3)], wire3}) ?
                       ((-$signed(wire142)) ?
                           wire3 : wire5[(1'h1):(1'h1)]) : (8'ha9)));
  assign wire146 = wire3;
  always
    @(posedge clk) begin
      reg147 <= (-$unsigned((&$unsigned(wire140[(1'h0):(1'h0)]))));
      reg148 <= ((^~wire5) >= (-(&(~|{wire0}))));
    end
  assign wire149 = ($signed((&(~|$unsigned(wire6)))) ~^ $unsigned(reg147[(3'h7):(1'h0)]));
  assign wire150 = wire2[(3'h6):(1'h0)];
endmodule

module module7  (y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'h221):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire11;
  input wire signed [(4'h8):(1'h0)] wire10;
  input wire [(3'h4):(1'h0)] wire9;
  input wire signed [(3'h4):(1'h0)] wire8;
  wire signed [(5'h11):(1'h0)] wire139;
  wire [(4'h8):(1'h0)] wire110;
  wire [(4'hd):(1'h0)] wire74;
  wire [(4'hf):(1'h0)] wire73;
  wire signed [(5'h14):(1'h0)] wire72;
  wire [(3'h4):(1'h0)] wire71;
  wire [(5'h10):(1'h0)] wire70;
  wire signed [(5'h10):(1'h0)] wire68;
  wire signed [(5'h12):(1'h0)] wire41;
  wire [(5'h15):(1'h0)] wire40;
  wire [(2'h2):(1'h0)] wire39;
  wire [(5'h11):(1'h0)] wire38;
  wire [(3'h7):(1'h0)] wire37;
  wire signed [(4'hc):(1'h0)] wire36;
  wire [(3'h5):(1'h0)] wire112;
  wire [(4'hb):(1'h0)] wire134;
  reg signed [(5'h15):(1'h0)] reg138 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg136 = (1'h0);
  reg [(3'h5):(1'h0)] reg35 = (1'h0);
  reg [(4'he):(1'h0)] reg34 = (1'h0);
  reg [(3'h4):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg32 = (1'h0);
  reg [(4'h8):(1'h0)] reg31 = (1'h0);
  reg [(5'h14):(1'h0)] reg30 = (1'h0);
  reg [(4'hb):(1'h0)] reg29 = (1'h0);
  reg [(5'h15):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg25 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg22 = (1'h0);
  reg [(5'h13):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg18 = (1'h0);
  reg [(5'h15):(1'h0)] reg17 = (1'h0);
  reg [(4'h8):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg15 = (1'h0);
  reg [(3'h5):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg13 = (1'h0);
  reg [(4'hd):(1'h0)] reg12 = (1'h0);
  assign y = {wire139,
                 wire110,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire68,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire112,
                 wire134,
                 reg138,
                 reg137,
                 reg136,
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
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($signed(wire8[(3'h4):(3'h4)]))
        begin
          if (((~&{wire9}) ?
              $signed($unsigned((-$signed(wire10)))) : (($unsigned(wire9) ?
                  (~^$unsigned(wire10)) : wire11) | ((-(wire11 << wire10)) ?
                  (wire9 ? $signed(wire9) : (+wire9)) : wire9[(1'h0):(1'h0)]))))
            begin
              reg12 <= wire11;
              reg13 <= $signed($unsigned(wire11[(1'h0):(1'h0)]));
            end
          else
            begin
              reg12 <= $signed(((($unsigned(wire10) * $unsigned(wire10)) ?
                      $unsigned({(8'ha2), wire8}) : $unsigned($signed(reg12))) ?
                  wire9 : reg13));
              reg13 <= $signed($signed(($signed(wire11[(2'h2):(1'h1)]) - (^~wire8[(1'h1):(1'h0)]))));
              reg14 <= $unsigned({(~&$unsigned(reg12[(2'h2):(2'h2)]))});
              reg15 <= wire11[(3'h4):(2'h2)];
              reg16 <= $signed((($signed((^wire8)) ?
                  reg13 : $unsigned({(8'ha5)})) > ((^~(&wire8)) * $unsigned({(8'hb8)}))));
            end
          if (($signed(wire10) ?
              (($unsigned((wire9 * wire9)) << reg14[(3'h5):(1'h0)]) | {($unsigned(wire10) ?
                      (reg16 ^ wire9) : $signed(reg12))}) : (&wire9)))
            begin
              reg17 <= $unsigned(reg15[(3'h7):(1'h1)]);
              reg18 <= ((-($signed(reg12[(4'hd):(4'hd)]) > (|$unsigned(wire8)))) >> (^~$signed(({reg13,
                      (8'h9e)} ?
                  (wire10 ? reg16 : wire8) : wire8[(2'h3):(2'h3)]))));
              reg19 <= (~^wire9);
              reg20 <= $unsigned((+{wire10[(3'h6):(2'h3)],
                  reg12[(1'h1):(1'h1)]}));
              reg21 <= ($unsigned((reg16[(3'h4):(3'h4)] ?
                  (8'had) : reg15)) ^~ $signed((~&reg20)));
            end
          else
            begin
              reg17 <= reg14[(3'h5):(3'h4)];
              reg18 <= $unsigned(reg17[(5'h11):(4'hb)]);
              reg19 <= (+reg12[(3'h4):(3'h4)]);
            end
          if ((reg17 ?
              (~wire8[(2'h2):(1'h1)]) : $signed($signed($signed(reg20[(2'h2):(1'h1)])))))
            begin
              reg22 <= {($unsigned($unsigned($unsigned(reg15))) ?
                      (((reg13 == reg13) >>> $unsigned(reg21)) > {(+reg13)}) : (($signed(reg14) ?
                              ((8'hbf) ? (8'hbd) : (7'h40)) : {(7'h41)}) ?
                          {$unsigned((7'h40)),
                              {reg13}} : reg12[(3'h6):(3'h4)]))};
              reg23 <= (8'hbc);
            end
          else
            begin
              reg22 <= (&{($unsigned((wire8 ? reg20 : wire9)) ?
                      reg20 : (wire8[(1'h1):(1'h0)] | $signed(reg12)))});
            end
        end
      else
        begin
          reg12 <= $unsigned($signed($unsigned($unsigned(reg23[(2'h2):(1'h0)]))));
          reg13 <= {reg22[(3'h4):(2'h2)]};
        end
      reg24 <= {($signed(($signed(reg17) ? $unsigned(wire9) : $signed(wire9))) ?
              reg21 : (8'hb5)),
          {(!(^(8'h9c)))}};
      if (reg16[(3'h6):(2'h2)])
        begin
          reg25 <= $unsigned(reg17[(4'hf):(4'h8)]);
          reg26 <= ((8'ha5) == (wire10 ?
              (wire9[(2'h3):(1'h1)] ^~ $signed((|reg21))) : $signed((8'hac))));
          reg27 <= ((reg18[(1'h0):(1'h0)] < reg24[(3'h4):(2'h3)]) ?
              {(&reg23),
                  (reg24[(4'h9):(3'h7)] | (~{wire9}))} : $signed($unsigned($unsigned($unsigned(reg17)))));
          reg28 <= wire10[(1'h0):(1'h0)];
          if (reg26)
            begin
              reg29 <= ($unsigned(reg24[(4'ha):(1'h0)]) ?
                  $signed($unsigned((~&$signed(reg24)))) : reg27[(2'h3):(1'h1)]);
              reg30 <= reg21[(5'h13):(4'hd)];
              reg31 <= ({($unsigned($signed(reg20)) || $unsigned((reg22 >>> reg17)))} < $signed($signed(reg26)));
            end
          else
            begin
              reg29 <= (~$signed((!($signed((8'h9f)) & (!reg28)))));
              reg30 <= $unsigned($signed((^reg12[(3'h6):(2'h3)])));
              reg31 <= reg25[(2'h2):(2'h2)];
            end
        end
      else
        begin
          if (((reg18 ? reg17[(4'hc):(3'h4)] : reg22) ?
              ($unsigned({$unsigned(wire9)}) || reg14) : $unsigned($unsigned(reg16))))
            begin
              reg25 <= $signed(reg23);
              reg26 <= wire11[(1'h1):(1'h1)];
            end
          else
            begin
              reg25 <= reg15;
            end
          reg27 <= $unsigned((^~reg17));
          reg28 <= $unsigned((|(^($signed(wire11) ?
              reg20[(1'h0):(1'h0)] : ((8'hb8) ? reg24 : wire9)))));
          if ((($unsigned(reg21[(4'h8):(3'h7)]) ?
              ({{reg13}, wire9} ?
                  reg21[(4'hf):(4'hf)] : wire11[(3'h4):(3'h4)]) : (reg24 ?
                  $unsigned($signed(reg27)) : ((reg17 ?
                      reg20 : reg12) == (~reg30)))) >= reg12))
            begin
              reg29 <= $unsigned(reg15);
              reg30 <= (^($signed({wire8[(1'h1):(1'h1)]}) * ({(^reg19)} ^~ ($unsigned((8'ha8)) ?
                  $unsigned(reg17) : (reg14 && reg17)))));
              reg31 <= ($signed($signed(reg29)) + (!(~^({reg27} ?
                  reg13[(1'h0):(1'h0)] : $signed((8'hac))))));
              reg32 <= $unsigned((~&$signed(reg15[(4'hb):(1'h0)])));
              reg33 <= $unsigned((~|reg17[(1'h1):(1'h0)]));
            end
          else
            begin
              reg29 <= reg22;
              reg30 <= {$signed(($unsigned((reg27 ? reg15 : reg31)) ?
                      {(reg20 + reg29), reg25} : reg23)),
                  {$signed(wire11[(2'h2):(1'h0)])}};
              reg31 <= reg15;
              reg32 <= ((&wire11) ?
                  wire10[(2'h3):(2'h2)] : reg23[(4'h8):(2'h2)]);
            end
          reg34 <= {(8'hbd)};
        end
      reg35 <= $signed($unsigned(reg14[(2'h2):(1'h1)]));
    end
  assign wire36 = (wire10 ? wire10[(2'h2):(2'h2)] : $signed((&reg19)));
  assign wire37 = (^$signed((wire8[(1'h1):(1'h0)] ^ reg15[(1'h0):(1'h0)])));
  assign wire38 = {reg27[(3'h4):(1'h1)],
                      ({(~((8'ha8) ? wire36 : reg25))} ?
                          (reg13 ?
                              $unsigned((|reg20)) : $signed({reg23,
                                  wire9})) : (~&reg30))};
  assign wire39 = reg33;
  assign wire40 = $signed(((~|reg34) ?
                      ({(wire37 >= (8'hac)), wire8} ?
                          ((~(8'h9f)) ?
                              (!(8'h9d)) : reg30[(5'h10):(3'h6)]) : ((reg27 & reg27) <= (reg18 ?
                              reg28 : reg13))) : reg32[(5'h12):(2'h3)]));
  assign wire41 = wire10[(2'h2):(2'h2)];
  module42 #() modinst69 (wire68, clk, reg17, reg16, reg25, reg35, reg33);
  assign wire70 = {reg20[(1'h1):(1'h0)], reg20};
  assign wire71 = {$unsigned($unsigned($unsigned((8'hbc)))), reg25};
  assign wire72 = $unsigned((!(wire39[(1'h0):(1'h0)] << $unsigned((!reg16)))));
  assign wire73 = wire41[(2'h2):(2'h2)];
  assign wire74 = {$signed(((8'hae) ?
                          (8'had) : ($signed(wire10) ?
                              (wire68 < reg20) : wire10[(1'h1):(1'h1)]))),
                      (^~$signed((&wire73[(3'h5):(1'h0)])))};
  module75 #() modinst111 (wire110, clk, wire74, wire72, reg27, wire68, reg29);
  assign wire112 = wire73[(2'h3):(2'h2)];
  module113 #() modinst135 (.wire116(wire68), .y(wire134), .wire115(reg28), .wire117(wire40), .clk(clk), .wire114(wire72));
  always
    @(posedge clk) begin
      reg136 <= (^($unsigned(wire37[(1'h1):(1'h0)]) >>> wire110));
      reg137 <= (~|reg28);
      reg138 <= ($unsigned((8'hb0)) != $unsigned($signed(((~&wire10) ?
          reg33[(2'h3):(2'h3)] : {(8'ha5), reg13}))));
    end
  assign wire139 = reg136;
endmodule

module module113  (y, clk, wire117, wire116, wire115, wire114);
  output wire [(32'hb6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire117;
  input wire signed [(5'h10):(1'h0)] wire116;
  input wire [(5'h15):(1'h0)] wire115;
  input wire [(5'h14):(1'h0)] wire114;
  wire signed [(2'h2):(1'h0)] wire123;
  wire signed [(4'hc):(1'h0)] wire122;
  wire [(5'h12):(1'h0)] wire121;
  wire [(4'h8):(1'h0)] wire120;
  reg [(5'h12):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg132 = (1'h0);
  reg [(5'h15):(1'h0)] reg131 = (1'h0);
  reg [(3'h7):(1'h0)] reg130 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg128 = (1'h0);
  reg [(3'h4):(1'h0)] reg127 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg126 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg125 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg124 = (1'h0);
  reg [(4'ha):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg118 = (1'h0);
  assign y = {wire123,
                 wire122,
                 wire121,
                 wire120,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg119,
                 reg118,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg118 <= $unsigned((~(+$unsigned((wire116 != wire116)))));
      reg119 <= $unsigned(($signed($unsigned((wire115 >>> wire115))) ?
          wire116[(2'h3):(2'h2)] : wire114[(4'hd):(3'h6)]));
    end
  assign wire120 = wire114;
  assign wire121 = $signed(reg118);
  assign wire122 = wire117[(4'h9):(2'h3)];
  assign wire123 = $signed(wire117[(4'hc):(4'h9)]);
  always
    @(posedge clk) begin
      reg124 <= $unsigned($unsigned((wire114 ?
          {(wire114 ? wire117 : wire114)} : $unsigned(wire121))));
    end
  always
    @(posedge clk) begin
      reg125 <= wire123;
      if ($signed(wire123))
        begin
          reg126 <= {$signed((reg118[(4'ha):(2'h3)] ?
                  (((8'hb3) && wire117) ?
                      {wire117, (8'ha7)} : {wire123}) : (wire115 ?
                      wire121 : wire116))),
              $unsigned($unsigned(reg124))};
          reg127 <= wire116[(4'hd):(4'hb)];
          reg128 <= ($unsigned(((!((8'ha5) * reg127)) << ($signed(reg119) & (~|wire120)))) == $unsigned((~^{(-reg124)})));
          reg129 <= $unsigned(wire114[(1'h1):(1'h1)]);
          reg130 <= $unsigned((~{(-$signed(reg124)),
              $signed($unsigned(wire122))}));
        end
      else
        begin
          reg126 <= wire116[(3'h5):(3'h4)];
          reg127 <= (^($unsigned($unsigned((wire115 ? wire122 : reg118))) ?
              wire120[(3'h6):(2'h3)] : $signed(reg125)));
          reg128 <= (^~$signed(({$unsigned(reg128)} ?
              $signed($unsigned(reg127)) : ((&reg124) && $unsigned(reg126)))));
        end
      reg131 <= $signed(($unsigned((wire123[(1'h0):(1'h0)] != (reg130 || reg118))) - (~|wire120[(3'h5):(2'h2)])));
      reg132 <= (reg127 ? $signed(reg118) : $signed(wire122));
      reg133 <= (~&$signed(wire114));
    end
endmodule

module module75
#(parameter param109 = ((((((8'hb7) ? (8'h9c) : (8'ha6)) != {(7'h40)}) ? (&((8'hb1) < (8'hbf))) : (8'hb0)) ? {(^~(|(8'ha4))), (((8'hb9) ? (8'hb7) : (8'ha0)) ^~ {(8'ha8)})} : (~|(((8'hbc) < (8'haf)) ? ((8'hb2) ? (8'hb8) : (8'hbe)) : ((7'h41) + (8'hbc))))) > {((((8'hb5) && (7'h41)) ? {(8'ha3), (8'h9d)} : {(8'haf), (8'hbb)}) ? (^{(8'hb0), (8'hbc)}) : (~((8'ha1) >>> (8'ha0)))), (({(8'hb9), (8'hb3)} ? ((8'h9d) ? (8'hb8) : (7'h42)) : (~(8'hb4))) && {((8'hbc) ? (8'ha6) : (7'h42))})}))
(y, clk, wire80, wire79, wire78, wire77, wire76);
  output wire [(32'h162):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire80;
  input wire [(4'hc):(1'h0)] wire79;
  input wire [(5'h10):(1'h0)] wire78;
  input wire signed [(4'h9):(1'h0)] wire77;
  input wire [(4'hb):(1'h0)] wire76;
  wire [(5'h12):(1'h0)] wire108;
  wire signed [(5'h12):(1'h0)] wire104;
  wire signed [(4'h9):(1'h0)] wire84;
  wire signed [(5'h12):(1'h0)] wire83;
  wire signed [(4'hb):(1'h0)] wire82;
  wire [(4'hb):(1'h0)] wire81;
  reg [(5'h14):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg106 = (1'h0);
  reg [(5'h13):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg103 = (1'h0);
  reg [(4'ha):(1'h0)] reg102 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg99 = (1'h0);
  reg [(4'h9):(1'h0)] reg98 = (1'h0);
  reg [(3'h5):(1'h0)] reg97 = (1'h0);
  reg [(3'h4):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg95 = (1'h0);
  reg [(4'h8):(1'h0)] reg94 = (1'h0);
  reg [(2'h3):(1'h0)] reg93 = (1'h0);
  reg [(5'h12):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg90 = (1'h0);
  reg [(4'hf):(1'h0)] reg89 = (1'h0);
  reg [(4'hc):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg87 = (1'h0);
  reg [(2'h2):(1'h0)] reg86 = (1'h0);
  reg [(5'h12):(1'h0)] reg85 = (1'h0);
  assign y = {wire108,
                 wire104,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 reg107,
                 reg106,
                 reg105,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
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
                 (1'h0)};
  assign wire81 = wire78;
  assign wire82 = wire79;
  assign wire83 = wire77;
  assign wire84 = wire79;
  always
    @(posedge clk) begin
      if ((-$unsigned($unsigned(wire78))))
        begin
          reg85 <= ((($signed({(8'hb3)}) ?
              $unsigned((wire84 ?
                  wire82 : wire82)) : (8'ha5)) <<< ((8'hb8) ^ wire80)) <= $unsigned($unsigned(wire83)));
          reg86 <= ((((reg85 != $signed(wire78)) ?
                      (~$unsigned(wire79)) : $unsigned($signed(wire82))) ?
                  (wire82[(4'ha):(3'h7)] & ((wire81 >> reg85) ?
                      (wire77 != wire78) : wire79[(3'h6):(3'h6)])) : ((wire78 == ((8'ha1) ?
                      reg85 : wire79)) ~^ (wire82[(1'h1):(1'h0)] ^~ {reg85,
                      (8'hb1)}))) ?
              ((~&(-((7'h40) ? wire80 : wire77))) > $signed(((reg85 ?
                      (8'ha7) : wire83) ?
                  (wire80 ?
                      wire78 : wire78) : (~^(8'ha0))))) : $signed(wire84[(3'h7):(3'h4)]));
          reg87 <= $unsigned({(wire80[(1'h0):(1'h0)] <= reg86)});
          reg88 <= $signed({(-wire82[(4'h8):(2'h3)]),
              $signed((wire83[(5'h11):(1'h1)] ? (~^wire82) : wire77))});
          reg89 <= $signed(reg85[(2'h3):(2'h3)]);
        end
      else
        begin
          reg85 <= ($unsigned(((^(reg85 ? wire82 : wire78)) ?
                  $signed({wire80, wire81}) : $signed((wire80 ?
                      reg87 : reg86)))) ?
              {(wire77 ?
                      ($signed(wire77) - wire79[(4'h9):(3'h7)]) : (&((8'hbc) * reg85))),
                  ($unsigned(reg87[(2'h2):(1'h1)]) ?
                      $unsigned((|wire77)) : ($unsigned(wire78) & (~&(8'ha8))))} : $signed(wire79));
          if (reg86[(1'h1):(1'h0)])
            begin
              reg86 <= {$signed((~&({(8'hb1), wire78} ?
                      reg85[(1'h0):(1'h0)] : wire82))),
                  {(($signed((8'h9e)) ?
                          $unsigned((8'h9c)) : $unsigned((8'hab))) - (^wire77[(3'h6):(1'h0)]))}};
              reg87 <= {((((8'hb3) >> {reg87,
                      reg88}) && $unsigned((reg88 >> wire78))) ^~ (({reg89,
                          reg87} ?
                      (wire81 ? reg85 : (8'hb3)) : {wire79,
                          wire81}) != reg88))};
              reg88 <= (wire76 - {(&(wire81 ? (8'hb6) : reg86))});
              reg89 <= wire82;
            end
          else
            begin
              reg86 <= $signed(wire81);
            end
          if ({$unsigned(wire76[(4'h8):(4'h8)]),
              {($signed((wire78 >= (8'hbf))) * wire76[(2'h2):(1'h1)])}})
            begin
              reg90 <= $signed((~|(reg85 | $signed(((8'hb5) || wire81)))));
              reg91 <= ($unsigned({reg86[(1'h0):(1'h0)], (&$unsigned(reg87))}) ?
                  ({reg88,
                      {$signed((8'hbb))}} << ($signed((+reg88)) << ($signed(reg89) * (^(8'ha0))))) : {((!$unsigned(wire83)) ?
                          wire80[(3'h4):(3'h4)] : wire82)});
              reg92 <= {(-$signed((((8'ha1) ^~ wire81) & {reg86, reg88}))),
                  reg91};
              reg93 <= $signed(reg91[(3'h4):(2'h2)]);
              reg94 <= $unsigned(wire83);
            end
          else
            begin
              reg90 <= {$signed((|(~^reg86[(1'h0):(1'h0)])))};
            end
          reg95 <= $signed((8'hb8));
        end
      reg96 <= (~&(&$unsigned($signed($signed(reg87)))));
      reg97 <= $unsigned($signed($signed((reg91[(4'h8):(3'h5)] || wire83[(4'h9):(1'h1)]))));
      if (reg90)
        begin
          reg98 <= (reg90[(1'h1):(1'h0)] ^~ wire79);
        end
      else
        begin
          if ({(8'hb3), (&$signed($unsigned((wire82 >> reg87))))})
            begin
              reg98 <= (~($signed(reg90) ^ reg92[(5'h12):(1'h0)]));
              reg99 <= $signed((8'hb1));
              reg100 <= reg85;
              reg101 <= ((^~$unsigned({$unsigned(reg94),
                  (reg95 | wire83)})) ^ $signed(reg100[(1'h1):(1'h1)]));
              reg102 <= ($unsigned(reg88[(4'h9):(3'h5)]) >= reg87[(3'h5):(1'h1)]);
            end
          else
            begin
              reg98 <= {$signed(reg91)};
              reg99 <= (reg98[(4'h9):(4'h9)] == ((reg89 != reg85) ?
                  $signed(((reg100 ~^ (8'hbf)) >> (wire83 ^ reg88))) : (wire82[(2'h2):(1'h0)] ?
                      $unsigned($signed(reg99)) : {(reg94 ? reg86 : reg91),
                          (reg102 > wire83)})));
              reg100 <= (~^reg92);
              reg101 <= $signed($signed((&{$unsigned(reg99),
                  (wire84 >>> reg86)})));
            end
        end
      reg103 <= $unsigned(reg96);
    end
  assign wire104 = reg96;
  always
    @(posedge clk) begin
      reg105 <= (-$unsigned($unsigned({wire80[(1'h0):(1'h0)],
          (reg95 ? reg88 : (8'h9c))})));
      reg106 <= (+(+$signed($signed(wire83[(4'h8):(2'h3)]))));
      reg107 <= reg90[(4'ha):(3'h6)];
    end
  assign wire108 = reg86[(2'h2):(2'h2)];
endmodule

module module42
#(parameter param66 = ((((((7'h40) ^ (8'ha5)) >> ((8'ha2) <<< (8'hb9))) ? (8'hac) : ((~^(8'hbd)) <<< (&(8'had)))) ? (~(^(+(8'hb4)))) : (+(((8'haa) + (8'hb3)) ? (-(8'hbb)) : (&(8'hb8))))) ? ((^((-(8'h9f)) ? (!(8'ha6)) : (^(8'had)))) ? (~|(((8'hb8) <= (8'haf)) ^~ ((7'h41) ? (8'hac) : (8'h9e)))) : (({(8'ha8)} << {(8'hb8)}) * {((8'ha1) ? (8'h9d) : (8'hb1))})) : (((((8'hb0) * (8'hb1)) ? ((8'ha1) && (8'hb0)) : {(8'ha4)}) ? (!((8'hab) ? (8'hbc) : (7'h41))) : (~(~^(8'hb2)))) ? {(!((8'hb2) + (7'h43))), (((8'ha1) ? (8'haf) : (8'ha0)) ? ((8'h9c) < (8'hb0)) : ((8'hbc) & (8'hbe)))} : ((&(~&(8'ha5))) && (((8'ha9) >> (8'hba)) ? (~^(8'had)) : ((8'hb5) ? (8'hab) : (8'h9c)))))), 
parameter param67 = (((-(param66 ? (param66 || param66) : (~|(8'hb0)))) ? (((8'hb8) ? param66 : (^~param66)) ? (param66 ? (param66 ? param66 : param66) : (param66 ? param66 : param66)) : (param66 ? (param66 ? (8'had) : (8'hb6)) : (~^param66))) : (param66 <<< ((~&(8'ha8)) ? param66 : (param66 ^~ param66)))) + {(^(param66 ? ((8'ha8) ? param66 : param66) : param66)), (((^param66) ? param66 : param66) * param66)}))
(y, clk, wire47, wire46, wire45, wire44, wire43);
  output wire [(32'hc9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire47;
  input wire signed [(4'h8):(1'h0)] wire46;
  input wire signed [(4'h9):(1'h0)] wire45;
  input wire signed [(2'h3):(1'h0)] wire44;
  input wire signed [(2'h3):(1'h0)] wire43;
  wire [(3'h4):(1'h0)] wire65;
  wire signed [(3'h4):(1'h0)] wire64;
  wire signed [(5'h14):(1'h0)] wire63;
  wire signed [(4'h9):(1'h0)] wire62;
  wire signed [(3'h6):(1'h0)] wire61;
  wire signed [(5'h14):(1'h0)] wire60;
  wire [(4'h8):(1'h0)] wire59;
  wire signed [(3'h6):(1'h0)] wire58;
  wire signed [(4'h8):(1'h0)] wire57;
  wire signed [(5'h10):(1'h0)] wire56;
  wire [(5'h14):(1'h0)] wire55;
  wire [(4'ha):(1'h0)] wire54;
  wire signed [(5'h13):(1'h0)] wire53;
  wire [(2'h2):(1'h0)] wire52;
  wire [(5'h13):(1'h0)] wire51;
  wire signed [(4'h8):(1'h0)] wire50;
  wire [(4'hb):(1'h0)] wire49;
  wire signed [(4'ha):(1'h0)] wire48;
  assign y = {wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 (1'h0)};
  assign wire48 = wire43;
  assign wire49 = ({$signed((8'hac))} ?
                      wire45 : (wire48 || ($signed((wire46 <= (8'hb9))) && (8'hb5))));
  assign wire50 = wire45[(4'h9):(3'h7)];
  assign wire51 = (wire45 + {(&(~wire45[(4'h8):(2'h2)]))});
  assign wire52 = $unsigned(($signed((((8'hbc) ?
                          (8'ha0) : wire47) != $signed(wire50))) ?
                      (&$signed((wire46 & (8'hb7)))) : $signed(wire50)));
  assign wire53 = wire48;
  assign wire54 = wire45[(4'h9):(3'h7)];
  assign wire55 = ((^(wire54 > (~$signed(wire45)))) ?
                      (wire48 ?
                          ({(wire51 ? wire47 : wire47),
                              {wire48}} > (~wire43[(2'h3):(2'h2)])) : wire50[(3'h4):(1'h0)]) : (8'hbb));
  assign wire56 = ((^(+wire51)) ?
                      wire50[(3'h4):(3'h4)] : (wire51 ?
                          ($signed((wire52 != wire55)) ?
                              $signed((wire50 ^~ wire54)) : $signed($unsigned(wire49))) : wire53));
  assign wire57 = $unsigned(((($signed(wire49) >>> (wire49 * wire44)) ?
                      ($signed(wire44) - $unsigned(wire54)) : $unsigned(wire45[(2'h3):(2'h2)])) - (+wire44)));
  assign wire58 = (($signed(((!wire53) ?
                          $unsigned(wire51) : $unsigned(wire55))) << (^~(wire53[(3'h7):(2'h2)] ?
                          $unsigned(wire47) : ((8'hab) ? (8'hba) : wire55)))) ?
                      (~(+(wire55[(4'hd):(4'hc)] ?
                          (wire49 > wire54) : {(8'hbe)}))) : $unsigned(wire56));
  assign wire59 = (+wire46);
  assign wire60 = wire52;
  assign wire61 = $signed(({wire53, wire46[(1'h1):(1'h0)]} ?
                      ((+wire60) ?
                          wire44 : (~^$signed(wire51))) : (wire57[(2'h2):(1'h0)] <= (!{(8'ha4),
                          (8'hab)}))));
  assign wire62 = wire56[(4'hd):(4'hb)];
  assign wire63 = $unsigned(wire54[(1'h1):(1'h0)]);
  assign wire64 = wire46[(3'h6):(1'h0)];
  assign wire65 = $signed(wire58[(3'h4):(2'h2)]);
endmodule
