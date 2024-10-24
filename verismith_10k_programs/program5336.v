module top
#(parameter param183 = (&(((~&(!(7'h40))) >>> {((7'h41) <= (8'h9d))}) ? (!(((8'hae) ? (8'hb2) : (8'haf)) ^~ {(8'ha0)})) : ((|{(8'h9f), (8'haf)}) - (!(~^(8'h9e)))))), 
parameter param184 = (({((param183 ? param183 : param183) & (param183 ? param183 : (8'hb1)))} ? {(|{(7'h42), (8'hbb)}), param183} : {(param183 && param183)}) <= (8'hba)))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h5e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire0;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire3;
  wire [(5'h14):(1'h0)] wire182;
  wire signed [(2'h2):(1'h0)] wire181;
  wire signed [(5'h12):(1'h0)] wire4;
  wire signed [(5'h13):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire176;
  wire signed [(3'h6):(1'h0)] wire178;
  wire signed [(4'hd):(1'h0)] wire179;
  assign y = {wire182,
                 wire181,
                 wire4,
                 wire5,
                 wire176,
                 wire178,
                 wire179,
                 (1'h0)};
  assign wire4 = (~^$unsigned($unsigned({{wire3, wire3}})));
  assign wire5 = {(^~$unsigned({(wire4 > wire4), (wire3 ? wire4 : wire1)})),
                     ((wire1 >= wire1) || wire2)};
  module6 #() modinst177 (.wire9(wire3), .wire8(wire4), .wire7(wire5), .y(wire176), .clk(clk), .wire10(wire1));
  assign wire178 = $unsigned((8'hb5));
  module131 #() modinst180 (wire179, clk, wire3, wire4, wire1, wire2, wire0);
  assign wire181 = $unsigned(wire0);
  assign wire182 = wire4;
endmodule

module module6
#(parameter param175 = (((((^(8'h9c)) ? (!(8'hbd)) : ((7'h43) ^~ (8'h9e))) ? (^~{(8'haa), (8'hb0)}) : ((^~(8'h9f)) || {(8'hbc), (8'hbb)})) ? ((((8'h9f) << (8'hb1)) ? ((8'ha8) ? (7'h44) : (8'hb2)) : ((7'h41) >>> (8'hbf))) ? (((8'hb4) >= (8'hb1)) ^ {(8'haa)}) : ((8'hab) >= (^~(8'ha4)))) : (-{((8'hb4) || (8'hb3))})) ? ((((~(7'h40)) ? {(7'h40)} : {(8'hbc), (8'h9d)}) ? {((8'hb7) ? (8'hbc) : (7'h44)), ((8'hac) != (8'hb7))} : (((8'ha7) ? (8'hb5) : (8'ha4)) ? ((8'had) ? (7'h43) : (8'hb0)) : (^~(8'haf)))) ^~ ((~&(~&(8'hbe))) << (((8'haa) ~^ (8'ha4)) ? ((8'ha8) ^~ (8'ha5)) : ((8'hab) ? (8'hb2) : (8'hbb))))) : (((~^((8'hac) ? (8'ha0) : (8'ha4))) ? (|((8'hbc) ? (7'h44) : (8'hb7))) : ((8'hb8) ? (!(8'ha3)) : ((8'hb1) << (8'ha9)))) ? (|(((8'hac) ~^ (8'h9e)) ? (~^(8'ha8)) : ((8'hbb) ? (8'haa) : (7'h42)))) : (!{((8'hbd) & (8'hb2)), ((8'ha0) ? (8'hb2) : (8'hbc))}))))
(y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'h28f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire7;
  input wire signed [(2'h2):(1'h0)] wire8;
  input wire [(4'hb):(1'h0)] wire9;
  input wire signed [(5'h13):(1'h0)] wire10;
  wire signed [(3'h6):(1'h0)] wire174;
  wire [(2'h3):(1'h0)] wire165;
  wire [(4'h8):(1'h0)] wire107;
  wire signed [(4'hc):(1'h0)] wire86;
  wire signed [(4'hd):(1'h0)] wire85;
  wire signed [(4'hb):(1'h0)] wire11;
  wire signed [(2'h3):(1'h0)] wire24;
  wire signed [(4'hb):(1'h0)] wire25;
  wire [(5'h10):(1'h0)] wire47;
  wire signed [(4'h8):(1'h0)] wire49;
  wire signed [(4'hf):(1'h0)] wire83;
  wire signed [(5'h13):(1'h0)] wire109;
  wire signed [(4'ha):(1'h0)] wire163;
  reg signed [(5'h12):(1'h0)] reg173 = (1'h0);
  reg [(5'h11):(1'h0)] reg172 = (1'h0);
  reg [(2'h2):(1'h0)] reg171 = (1'h0);
  reg [(5'h15):(1'h0)] reg170 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg169 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg168 = (1'h0);
  reg [(2'h2):(1'h0)] reg167 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg166 = (1'h0);
  reg [(2'h2):(1'h0)] reg130 = (1'h0);
  reg [(4'hc):(1'h0)] reg129 = (1'h0);
  reg [(4'ha):(1'h0)] reg128 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg127 = (1'h0);
  reg [(3'h7):(1'h0)] reg126 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg124 = (1'h0);
  reg [(4'hd):(1'h0)] reg123 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg122 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg119 = (1'h0);
  reg [(4'hd):(1'h0)] reg118 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg117 = (1'h0);
  reg [(3'h6):(1'h0)] reg116 = (1'h0);
  reg [(4'hd):(1'h0)] reg115 = (1'h0);
  reg [(5'h14):(1'h0)] reg114 = (1'h0);
  reg [(5'h11):(1'h0)] reg113 = (1'h0);
  reg [(5'h13):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg111 = (1'h0);
  reg [(3'h6):(1'h0)] reg110 = (1'h0);
  reg [(5'h10):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg21 = (1'h0);
  reg [(3'h6):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg19 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg17 = (1'h0);
  reg [(5'h12):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg15 = (1'h0);
  reg [(5'h10):(1'h0)] reg14 = (1'h0);
  reg signed [(4'he):(1'h0)] reg13 = (1'h0);
  reg [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg87 = (1'h0);
  assign y = {wire174,
                 wire165,
                 wire107,
                 wire86,
                 wire85,
                 wire11,
                 wire24,
                 wire25,
                 wire47,
                 wire49,
                 wire83,
                 wire109,
                 wire163,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
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
                 reg87,
                 (1'h0)};
  assign wire11 = (wire7 ? wire10 : (^(7'h40)));
  always
    @(posedge clk) begin
      reg12 <= (~^{wire7});
      reg13 <= {$unsigned($unsigned((wire11[(2'h2):(1'h1)] < ((7'h41) + reg12))))};
      if (wire11)
        begin
          if ((+{(~|(+$unsigned(wire8))),
              ((~&{reg13}) ? (-(wire11 >> wire10)) : (~&wire11))}))
            begin
              reg14 <= $unsigned(reg12[(4'hb):(3'h7)]);
              reg15 <= wire9[(3'h5):(1'h0)];
            end
          else
            begin
              reg14 <= (reg15 >>> (&reg14[(4'h9):(4'h8)]));
            end
        end
      else
        begin
          if (((wire8 ? (8'hbf) : ({$signed(reg12)} + (|(wire9 >= reg12)))) ?
              ((^reg15) ?
                  wire9 : ({(&reg14), (~^wire10)} || ($unsigned(wire11) ?
                      wire11[(4'hb):(4'hb)] : (-reg12)))) : (^~reg12[(4'he):(4'h8)])))
            begin
              reg14 <= ({reg12} ?
                  ($unsigned($unsigned($unsigned(wire9))) ?
                      ((((8'ha4) >>> wire9) ?
                          (wire9 ? reg13 : (8'hbb)) : reg12) || (!((8'hbc) ?
                          reg13 : (8'hb7)))) : $signed((8'hab))) : ($signed((8'hae)) * wire7[(4'hc):(4'hc)]));
              reg15 <= $signed(({{wire8[(2'h2):(1'h0)]}} ?
                  (($unsigned(wire8) == $unsigned(wire9)) ~^ ((~wire8) ?
                      ((8'hbc) ?
                          (8'ha7) : (8'hb0)) : (+reg12))) : (~|wire11[(4'ha):(2'h2)])));
              reg16 <= (wire7[(3'h4):(3'h4)] + $signed(reg14[(4'hf):(4'hf)]));
            end
          else
            begin
              reg14 <= $unsigned((+reg14[(4'he):(3'h7)]));
              reg15 <= $signed(($unsigned((reg13 <= wire10[(3'h7):(3'h5)])) ?
                  (($signed(reg14) ^~ (wire10 <<< reg12)) < $unsigned(reg16)) : $unsigned(reg14)));
              reg16 <= $unsigned(reg14);
              reg17 <= (reg16[(4'hb):(3'h7)] | (~|(8'hbb)));
              reg18 <= $unsigned(reg16);
            end
          reg19 <= (reg12 ? reg15 : reg12[(4'h8):(4'h8)]);
          reg20 <= $unsigned((!(-$signed($unsigned((8'hb2))))));
          reg21 <= wire7[(4'ha):(3'h5)];
        end
    end
  always
    @(posedge clk) begin
      reg22 <= (wire10[(3'h5):(1'h1)] ? reg13 : reg19[(3'h4):(3'h4)]);
      reg23 <= (({(~&wire7), $signed((8'hb2))} ?
          reg22 : reg18) == $signed(($signed($unsigned((8'hab))) != reg22)));
    end
  assign wire24 = (^~(((^reg15[(4'h9):(2'h2)]) < $unsigned((reg21 > (7'h43)))) ?
                      (&((!(8'ha1)) != wire10)) : wire7));
  assign wire25 = reg12;
  module26 #() modinst48 (.wire27(wire7), .wire28(reg21), .y(wire47), .wire30(reg14), .wire31(wire11), .wire29(reg19), .clk(clk));
  assign wire49 = {$signed((~|{$signed((8'hb9)), (reg17 ? (8'ha7) : reg20)})),
                      wire9[(2'h3):(1'h0)]};
  module50 #() modinst84 (wire83, clk, reg16, reg19, reg12, reg18, wire7);
  assign wire85 = ((-(reg17 ? (reg22 | wire9) : reg17)) ?
                      ($signed(reg18[(3'h6):(3'h4)]) + reg16[(4'hd):(4'hb)]) : reg12[(5'h13):(3'h4)]);
  assign wire86 = $signed($signed((((&reg17) ?
                      {reg20, reg20} : wire11) - (wire8 ?
                      reg19[(1'h0):(1'h0)] : (reg18 - reg13)))));
  always
    @(posedge clk) begin
      reg87 <= (~|(((^~wire7[(4'ha):(4'h8)]) ?
              reg14 : $signed(reg16[(4'he):(4'hb)])) ?
          $signed($unsigned(wire86)) : $unsigned((&reg12))));
    end
  module88 #() modinst108 (wire107, clk, reg23, wire83, wire10, wire7);
  assign wire109 = $unsigned(reg18);
  always
    @(posedge clk) begin
      if ((8'hb9))
        begin
          if ({wire49})
            begin
              reg110 <= ((~|(^~$unsigned((^wire24)))) * {wire24[(1'h1):(1'h0)],
                  reg13[(2'h2):(1'h1)]});
              reg111 <= ($unsigned($unsigned(wire85)) ? wire107 : (8'hac));
              reg112 <= $unsigned($signed(wire83));
              reg113 <= ($signed((wire8[(1'h1):(1'h1)] ?
                  wire107[(1'h1):(1'h0)] : (((8'ha8) ?
                      reg14 : reg15) >> $unsigned(reg16)))) <= {(~|reg23)});
            end
          else
            begin
              reg110 <= wire10[(3'h4):(3'h4)];
            end
          if ($unsigned($unsigned($unsigned((~|reg17)))))
            begin
              reg114 <= (!reg15);
            end
          else
            begin
              reg114 <= wire8;
              reg115 <= wire25;
              reg116 <= wire85;
            end
          reg117 <= $signed((((reg14 < (wire9 >> reg113)) || reg15) <<< wire25));
          reg118 <= (~|$unsigned(reg20));
          if ((wire86 + (^({(wire10 ?
                  reg117 : reg15)} > (~|$unsigned(reg21))))))
            begin
              reg119 <= reg23[(4'he):(2'h3)];
              reg120 <= $unsigned($unsigned(reg18[(3'h7):(1'h1)]));
              reg121 <= (($signed((+(reg112 <<< (8'hb8)))) != $signed($unsigned((8'hbd)))) ?
                  wire7 : $signed((reg87 ?
                      wire25[(4'hb):(4'h8)] : ({reg21} == (-(8'hbf))))));
              reg122 <= (($unsigned((&reg22[(2'h2):(2'h2)])) <= wire47[(4'hf):(3'h6)]) ^~ ($signed($signed($unsigned(reg13))) ?
                  reg15[(4'hf):(4'hd)] : reg116[(1'h1):(1'h0)]));
              reg123 <= $signed($unsigned((|(((8'had) ? wire86 : wire86) ?
                  (reg87 ? reg18 : wire7) : $unsigned(reg15)))));
            end
          else
            begin
              reg119 <= reg117;
              reg120 <= wire11;
            end
        end
      else
        begin
          if (wire25)
            begin
              reg110 <= wire107;
              reg111 <= $unsigned($unsigned($signed((wire7 ?
                  $signed(reg121) : wire10[(3'h5):(2'h3)]))));
              reg112 <= $unsigned($unsigned($signed(wire9[(1'h1):(1'h0)])));
              reg113 <= ($signed($signed({(reg117 ^ reg110)})) != $signed($signed($signed(((8'ha0) ?
                  reg22 : reg16)))));
            end
          else
            begin
              reg110 <= ($unsigned(wire107[(1'h1):(1'h1)]) ?
                  (((wire109[(4'ha):(4'h9)] != {(8'h9c)}) ?
                      {(wire85 ? wire85 : reg14),
                          (wire49 ?
                              wire10 : wire49)} : $signed($signed((8'hbe)))) ~^ (+(reg20[(1'h1):(1'h0)] + {reg16,
                      wire24}))) : (~^(~((reg123 ? reg14 : reg18) ?
                      $unsigned(wire8) : reg15[(2'h3):(1'h0)]))));
              reg111 <= ($signed((^~{(wire49 ~^ wire8),
                  wire85})) != $unsigned(reg114));
              reg112 <= ((&reg20[(3'h6):(1'h1)]) ?
                  wire8[(1'h0):(1'h0)] : (~^$unsigned((^~(reg110 ?
                      (8'ha1) : (7'h43))))));
              reg113 <= (^wire109[(4'hb):(4'ha)]);
              reg114 <= wire8;
            end
        end
      if ((8'ha6))
        begin
          reg124 <= ($signed((-wire8[(1'h1):(1'h0)])) >= ({reg120[(1'h0):(1'h0)]} ?
              ($signed(reg22) ?
                  reg122 : (reg117 ? $signed((8'hac)) : reg123)) : (8'ha7)));
          if ($unsigned((((~|$signed(wire11)) ? wire49 : wire10) > (7'h40))))
            begin
              reg125 <= (&$signed((reg18[(4'h9):(3'h6)] >>> reg21)));
              reg126 <= ($unsigned(reg114[(3'h6):(2'h2)]) ?
                  reg124[(4'h9):(3'h6)] : (-{(wire24[(1'h0):(1'h0)] ?
                          (reg117 < (8'hb5)) : reg15)}));
              reg127 <= reg16;
            end
          else
            begin
              reg125 <= $signed(($signed(((!reg118) << ((8'hb4) ^ reg127))) + $signed($signed((wire83 << reg23)))));
              reg126 <= ($unsigned({(8'ha9), (~^{reg124})}) | (^(&reg116)));
              reg127 <= $unsigned(((wire109 ?
                  $unsigned((wire49 ? reg19 : wire86)) : (reg113 ?
                      (wire25 == (8'haa)) : (reg20 ?
                          wire85 : wire11))) || wire49[(2'h3):(2'h3)]));
            end
          reg128 <= $signed($signed(wire8[(1'h1):(1'h1)]));
          reg129 <= ($signed($unsigned({$signed(wire8), wire49})) ?
              $unsigned((-wire25[(1'h0):(1'h0)])) : ($unsigned(wire109) * $signed(($signed(wire7) & wire49))));
          reg130 <= {(^~reg113)};
        end
      else
        begin
          reg124 <= (($signed(wire11) ?
              reg120[(3'h4):(2'h3)] : reg123) >> reg113);
        end
    end
  module131 #() modinst164 (.wire135(reg114), .wire133(wire9), .wire132(reg87), .clk(clk), .y(wire163), .wire136(reg16), .wire134(reg123));
  assign wire165 = $signed(((8'hb9) ?
                       ((reg117[(4'h8):(1'h1)] ?
                               $unsigned(reg129) : $signed((8'hb0))) ?
                           reg117[(1'h1):(1'h0)] : {{reg16, reg124},
                               reg17}) : reg116));
  always
    @(posedge clk) begin
      if ((^~($unsigned((~&(+reg115))) ?
          (reg19[(5'h12):(4'hd)] ?
              wire109[(2'h2):(1'h0)] : wire107) : reg117[(1'h0):(1'h0)])))
        begin
          reg166 <= $signed($signed({($unsigned(reg123) << $unsigned((8'ha0))),
              {reg130[(2'h2):(1'h0)]}}));
          reg167 <= $signed(wire47[(4'hf):(4'hc)]);
        end
      else
        begin
          reg166 <= (-$signed($signed((wire7[(1'h1):(1'h1)] ?
              (reg22 + wire83) : {reg116}))));
          reg167 <= (((|(~^(reg16 ? reg125 : wire109))) >>> {$unsigned((reg19 ?
                  reg17 : reg116)),
              (~^(|reg21))}) <= $unsigned(wire47));
          reg168 <= ((|wire47) ?
              $unsigned({(reg130 >> (|reg15))}) : $signed(reg18[(1'h0):(1'h0)]));
          reg169 <= reg21;
        end
      reg170 <= ((&wire24) ?
          $signed({$unsigned((~reg21))}) : (^reg87[(5'h10):(4'he)]));
      reg171 <= wire25;
      reg172 <= {(&reg116[(1'h0):(1'h0)]),
          $unsigned($unsigned((+(reg121 ? reg14 : reg22))))};
      reg173 <= reg129[(1'h1):(1'h0)];
    end
  assign wire174 = $signed(($unsigned(wire24) == (-(-$unsigned(wire86)))));
endmodule

module module131  (y, clk, wire136, wire135, wire134, wire133, wire132);
  output wire [(32'hf7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire136;
  input wire [(5'h12):(1'h0)] wire135;
  input wire [(2'h3):(1'h0)] wire134;
  input wire signed [(4'h9):(1'h0)] wire133;
  input wire signed [(5'h11):(1'h0)] wire132;
  wire signed [(2'h3):(1'h0)] wire162;
  wire signed [(3'h7):(1'h0)] wire161;
  wire signed [(4'hc):(1'h0)] wire146;
  wire [(5'h15):(1'h0)] wire145;
  reg [(4'h9):(1'h0)] reg160 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg159 = (1'h0);
  reg [(4'he):(1'h0)] reg158 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg157 = (1'h0);
  reg [(2'h3):(1'h0)] reg156 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg155 = (1'h0);
  reg [(5'h13):(1'h0)] reg154 = (1'h0);
  reg signed [(4'he):(1'h0)] reg153 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg152 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg151 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg149 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg147 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg144 = (1'h0);
  reg [(3'h4):(1'h0)] reg143 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg142 = (1'h0);
  reg [(3'h4):(1'h0)] reg141 = (1'h0);
  reg [(5'h15):(1'h0)] reg140 = (1'h0);
  reg [(2'h2):(1'h0)] reg139 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg138 = (1'h0);
  reg [(2'h2):(1'h0)] reg137 = (1'h0);
  assign y = {wire162,
                 wire161,
                 wire146,
                 wire145,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg137 <= $unsigned($signed($signed((wire136 < $unsigned(wire136)))));
    end
  always
    @(posedge clk) begin
      reg138 <= $signed(reg137[(2'h2):(2'h2)]);
      reg139 <= reg137[(1'h0):(1'h0)];
      if ($unsigned(wire133[(2'h3):(1'h0)]))
        begin
          reg140 <= wire135;
          if ((~$signed(reg137)))
            begin
              reg141 <= $signed((({((8'hb9) ^ reg139),
                      wire133[(3'h4):(2'h2)]} ^~ $unsigned($unsigned(wire134))) ?
                  (^~$unsigned(reg139)) : reg139));
              reg142 <= $unsigned(wire133);
              reg143 <= $signed($unsigned($unsigned(((wire135 ?
                  reg138 : wire132) == reg142))));
            end
          else
            begin
              reg141 <= reg141;
              reg142 <= wire132;
              reg143 <= {((+wire132) > (((8'ha7) + (reg141 ?
                      reg139 : reg139)) * (~^reg141))),
                  wire135};
            end
        end
      else
        begin
          reg140 <= reg139[(2'h2):(1'h0)];
          reg141 <= (&$signed($signed({reg139, $unsigned(wire134)})));
          reg142 <= (&({(!$unsigned((8'hb7))),
              $signed(wire132[(5'h11):(4'hc)])} & ((reg143[(2'h3):(2'h2)] ?
              $signed(wire133) : reg142[(2'h2):(2'h2)]) ^ $unsigned({wire132,
              reg140}))));
        end
      reg144 <= (~(|(-(!(reg138 || reg141)))));
    end
  assign wire145 = {(reg137[(1'h0):(1'h0)] <= $unsigned((reg140[(3'h4):(1'h1)] <= (reg142 ?
                           wire132 : wire135))))};
  assign wire146 = {({$signed((~reg138)), (!{wire133, wire145})} ?
                           ((|$unsigned(reg138)) ?
                               $signed(wire145) : $unsigned((reg138 * wire133))) : reg141)};
  always
    @(posedge clk) begin
      reg147 <= $unsigned(wire146);
      reg148 <= (((+$unsigned(wire132[(4'hb):(1'h1)])) ^ (&((wire134 ^~ reg139) * {reg143,
          (8'ha5)}))) <<< (-$signed((!$signed(reg137)))));
      if (((((reg142 >= (|reg139)) | $signed($unsigned(wire132))) ?
              (!$signed(reg147[(3'h7):(2'h3)])) : wire133) ?
          (8'hac) : ($signed((wire136 || (~|reg138))) ?
              wire145[(4'h8):(3'h6)] : wire136)))
        begin
          if (({{reg147[(4'h9):(3'h4)],
                      ((wire134 <<< wire145) ?
                          (&reg148) : (reg137 ? reg141 : (7'h41)))},
                  $signed($signed(reg138))} ?
              $unsigned($signed(reg144[(2'h3):(1'h1)])) : reg139[(1'h0):(1'h0)]))
            begin
              reg149 <= $unsigned(wire134[(2'h3):(1'h1)]);
            end
          else
            begin
              reg149 <= (-(^~{$signed((^wire133))}));
              reg150 <= $signed((~&$unsigned((8'ha8))));
              reg151 <= (~^{reg149,
                  {{(reg138 ^ (8'ha3))}, $signed($unsigned((8'ha0)))}});
            end
          if ((reg147[(3'h4):(2'h3)] ?
              $signed(({(~reg147)} ?
                  $unsigned($signed(wire135)) : $signed((reg139 != reg139)))) : (-(~|$unsigned((~&wire146))))))
            begin
              reg152 <= {({$unsigned((reg149 * reg144)),
                      ((~|reg141) * reg139)} < wire132[(5'h11):(3'h7)])};
              reg153 <= (reg137 ? wire135 : (&$signed(wire146[(3'h5):(1'h0)])));
              reg154 <= $signed((reg138[(3'h4):(1'h1)] != reg150[(1'h1):(1'h1)]));
            end
          else
            begin
              reg152 <= (~|reg141[(2'h3):(1'h0)]);
              reg153 <= $signed(reg151[(3'h7):(3'h5)]);
              reg154 <= $unsigned(reg150[(1'h1):(1'h1)]);
            end
          if ((reg143 ? reg144 : reg143))
            begin
              reg155 <= reg151;
              reg156 <= (~&$unsigned(reg141));
              reg157 <= $signed((wire135 ?
                  $signed({reg154,
                      reg139[(1'h0):(1'h0)]}) : $unsigned((reg137 >= {reg154}))));
              reg158 <= (reg152 ?
                  reg140[(3'h7):(3'h6)] : $unsigned($unsigned(reg144)));
              reg159 <= reg141;
            end
          else
            begin
              reg155 <= wire132[(4'hd):(2'h2)];
              reg156 <= ((~^reg157[(2'h3):(1'h0)]) << $signed($signed(($unsigned(reg137) ?
                  $signed((8'ha9)) : $signed(reg156)))));
            end
        end
      else
        begin
          if (reg139[(1'h1):(1'h0)])
            begin
              reg149 <= $signed(($signed($unsigned((&(8'hba)))) ?
                  $unsigned(reg143[(3'h4):(2'h3)]) : ((^~$signed(reg144)) ~^ reg140)));
              reg150 <= {reg147[(4'hb):(4'h8)]};
              reg151 <= (reg151[(4'h8):(3'h6)] + $signed($signed($unsigned((~^wire134)))));
              reg152 <= $signed(reg142);
              reg153 <= $unsigned($unsigned((!(reg153 ?
                  (reg148 >> reg144) : reg141[(2'h2):(1'h0)]))));
            end
          else
            begin
              reg149 <= wire133[(3'h4):(1'h0)];
              reg150 <= reg137;
              reg151 <= (~^(reg154[(5'h11):(3'h6)] ^ (reg149 ?
                  ((+reg137) ^ reg158[(4'he):(1'h1)]) : ($unsigned(reg154) ?
                      $signed(wire135) : (reg142 != reg141)))));
              reg152 <= $signed((reg147[(5'h13):(4'hf)] >>> ($unsigned((reg159 ?
                  reg153 : (8'hac))) <<< wire132[(4'hc):(4'ha)])));
              reg153 <= wire132;
            end
          reg154 <= (reg151[(3'h4):(2'h3)] ?
              (reg155 ?
                  (-(reg159 >= (~^reg151))) : $unsigned(reg144[(1'h0):(1'h0)])) : $unsigned(((8'hab) ?
                  $unsigned($signed(reg155)) : $signed((reg148 ?
                      reg141 : reg151)))));
          if ((({$signed({wire135}),
              (7'h44)} + (~^$unsigned((reg155 != reg152)))) || $unsigned((~^reg140[(5'h13):(5'h11)]))))
            begin
              reg155 <= wire135;
            end
          else
            begin
              reg155 <= (((($unsigned(reg143) ?
                          (reg157 ? reg148 : reg159) : (reg139 - wire145)) ?
                      $signed((|reg147)) : (reg138[(1'h0):(1'h0)] ?
                          {reg158} : $unsigned((7'h44)))) >> $signed($signed({reg158,
                      reg138}))) ?
                  ($signed($unsigned(reg151)) < reg138) : $unsigned($signed(((reg156 ?
                      wire145 : reg148) && reg142[(3'h5):(3'h5)]))));
            end
          reg156 <= reg140[(3'h4):(1'h1)];
        end
      reg160 <= $signed((((8'haf) >> ((wire136 >= reg157) << $signed(reg139))) < reg147[(5'h11):(4'ha)]));
    end
  assign wire161 = $unsigned((!({$signed(wire133)} ?
                       (8'had) : ({wire132, reg148} ^~ (^(8'had))))));
  assign wire162 = ($unsigned($signed(wire146)) ?
                       (7'h42) : (|$unsigned((-{reg160}))));
endmodule

module module88
#(parameter param106 = {(&(({(8'ha2)} ? ((8'hab) * (8'hb1)) : ((8'haf) ? (7'h41) : (8'hbb))) ? (~|((8'h9c) ? (8'hb0) : (8'ha0))) : (((8'hbc) ? (8'ha2) : (8'ha3)) ? ((8'hb0) != (8'ha8)) : ((8'hbc) + (8'h9d)))))})
(y, clk, wire92, wire91, wire90, wire89);
  output wire [(32'h65):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire92;
  input wire signed [(4'hf):(1'h0)] wire91;
  input wire [(5'h13):(1'h0)] wire90;
  input wire [(4'hb):(1'h0)] wire89;
  wire [(4'ha):(1'h0)] wire105;
  wire [(4'h9):(1'h0)] wire104;
  wire signed [(3'h4):(1'h0)] wire103;
  reg [(3'h4):(1'h0)] reg102 = (1'h0);
  reg [(4'h8):(1'h0)] reg101 = (1'h0);
  reg [(4'hc):(1'h0)] reg100 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg99 = (1'h0);
  reg [(2'h3):(1'h0)] reg98 = (1'h0);
  reg [(4'hf):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg95 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg94 = (1'h0);
  reg [(2'h3):(1'h0)] reg93 = (1'h0);
  assign y = {wire105,
                 wire104,
                 wire103,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg93 <= (wire90 <<< (((wire90[(4'he):(4'ha)] <= (wire90 ?
              (8'haa) : (8'ha0))) ?
          $signed((wire89 >= wire91)) : {wire92}) >> (~^wire89[(2'h2):(1'h0)])));
      reg94 <= wire92[(3'h4):(3'h4)];
      reg95 <= wire92[(3'h5):(1'h0)];
      reg96 <= $signed(reg95);
      if ($unsigned({(&reg96)}))
        begin
          reg97 <= $unsigned({(-($unsigned(wire90) ? (|wire92) : (!reg96)))});
          reg98 <= $unsigned($signed(wire92));
          if ((wire90[(2'h3):(2'h3)] ~^ wire92))
            begin
              reg99 <= ($signed($unsigned($signed((wire92 != reg94)))) ?
                  (&$signed((wire92 * (reg94 ?
                      (8'h9c) : wire92)))) : {(-wire92)});
              reg100 <= reg95[(4'h8):(2'h2)];
              reg101 <= ($unsigned($signed((&(wire90 ? reg93 : reg97)))) ?
                  (reg93[(2'h3):(1'h1)] ?
                      wire89 : ((^$signed(wire92)) >>> ((^~(8'hae)) ?
                          (reg99 ?
                              reg93 : wire91) : (wire92 != reg100)))) : wire90);
              reg102 <= $signed((~^reg101));
            end
          else
            begin
              reg99 <= (+$signed(($unsigned(wire90[(2'h3):(2'h2)]) ?
                  $signed(reg102[(2'h2):(1'h0)]) : reg102[(1'h1):(1'h0)])));
              reg100 <= $unsigned(reg101);
              reg101 <= $signed((reg96[(3'h7):(3'h6)] != ($unsigned($signed(wire91)) << reg96)));
            end
        end
      else
        begin
          reg97 <= (($signed($unsigned((reg97 >>> reg98))) ?
              reg93 : (^((^~wire89) || ((8'hb6) ?
                  reg101 : (8'hb5))))) | $unsigned(wire89[(3'h4):(1'h1)]));
        end
    end
  assign wire103 = (reg99 ?
                       $unsigned($signed($signed($unsigned(reg97)))) : (~(~|$unsigned(reg101))));
  assign wire104 = (($unsigned(({wire103, reg101} ?
                       reg99[(2'h2):(2'h2)] : (reg97 >> reg93))) - {(reg96[(1'h0):(1'h0)] & reg96),
                       ({(8'ha3), reg94} ?
                           (reg98 | reg94) : (~^(8'hae)))}) == $unsigned(reg97));
  assign wire105 = {(~|reg98)};
endmodule

module module50  (y, clk, wire55, wire54, wire53, wire52, wire51);
  output wire [(32'h148):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire55;
  input wire [(5'h12):(1'h0)] wire54;
  input wire [(5'h15):(1'h0)] wire53;
  input wire [(2'h2):(1'h0)] wire52;
  input wire [(3'h4):(1'h0)] wire51;
  wire signed [(5'h10):(1'h0)] wire82;
  wire signed [(4'h8):(1'h0)] wire81;
  wire [(5'h13):(1'h0)] wire80;
  wire signed [(3'h6):(1'h0)] wire79;
  wire [(5'h14):(1'h0)] wire78;
  wire signed [(5'h11):(1'h0)] wire56;
  reg [(5'h14):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg75 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg74 = (1'h0);
  reg [(4'hf):(1'h0)] reg73 = (1'h0);
  reg [(3'h5):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg71 = (1'h0);
  reg [(4'hc):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg69 = (1'h0);
  reg [(4'ha):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg67 = (1'h0);
  reg [(4'hf):(1'h0)] reg66 = (1'h0);
  reg [(3'h4):(1'h0)] reg65 = (1'h0);
  reg [(3'h5):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg62 = (1'h0);
  reg [(4'he):(1'h0)] reg61 = (1'h0);
  reg [(5'h15):(1'h0)] reg60 = (1'h0);
  reg [(2'h2):(1'h0)] reg59 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg58 = (1'h0);
  reg [(5'h13):(1'h0)] reg57 = (1'h0);
  assign y = {wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire56,
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
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 (1'h0)};
  assign wire56 = wire51[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      if (wire55)
        begin
          reg57 <= (wire53[(2'h3):(2'h3)] <<< $unsigned(($signed(wire53) ?
              wire56 : {$unsigned(wire52), (wire56 ? wire51 : (8'hb7))})));
          reg58 <= ((8'hb4) ?
              ({wire51, ({(8'hbd)} > $signed(wire54))} ?
                  wire56 : wire52) : (($signed($unsigned(wire52)) >= ((~^(8'hae)) ?
                      wire55 : $unsigned(wire52))) ?
                  ((8'hb6) && wire55) : (wire51[(1'h1):(1'h0)] == (wire51[(2'h2):(2'h2)] ?
                      (wire52 ? wire51 : wire56) : {wire51}))));
        end
      else
        begin
          if (wire52)
            begin
              reg57 <= $unsigned((^$signed(wire51)));
              reg58 <= {(|$signed(wire52[(1'h1):(1'h1)])),
                  wire51[(2'h3):(1'h0)]};
            end
          else
            begin
              reg57 <= reg58[(3'h4):(1'h0)];
              reg58 <= wire56[(4'he):(4'h9)];
              reg59 <= {$signed($signed((&(-(8'hb8))))), wire52[(2'h2):(2'h2)]};
              reg60 <= wire56[(4'hf):(3'h5)];
            end
          reg61 <= (^($signed({(wire53 * wire53),
              ((8'hb6) ~^ reg58)}) & ($unsigned({wire52}) ?
              wire54[(4'hc):(3'h4)] : ((reg57 ? reg58 : wire53) ?
                  (&wire51) : {(8'ha0)}))));
          reg62 <= wire52[(1'h1):(1'h1)];
        end
      reg63 <= (-$unsigned((~^$unsigned({wire54}))));
      if ($signed(($signed((~^wire55[(2'h2):(2'h2)])) ?
          (!($unsigned(reg58) ^ $unsigned(reg63))) : (+$unsigned(reg63[(3'h7):(1'h0)])))))
        begin
          reg64 <= ((({wire54} | (~^{wire54})) >= reg62[(2'h3):(2'h2)]) ?
              (8'h9c) : reg59[(1'h0):(1'h0)]);
        end
      else
        begin
          if ((((((^reg58) <= (reg58 ? wire54 : wire55)) ?
              ((^~(8'ha4)) ^~ (7'h40)) : ({(8'ha1),
                  reg59} ^~ {wire52})) | reg57) << reg58))
            begin
              reg64 <= ((($unsigned(reg58[(2'h3):(2'h2)]) != ({(8'haa), reg63} ?
                      reg61 : reg60[(4'hb):(3'h5)])) ?
                  (+$signed($signed((8'hba)))) : (((wire53 ? reg62 : wire56) ?
                      reg63 : $signed(reg61)) & $signed(wire51[(1'h1):(1'h0)]))) > (((-(wire53 >>> reg62)) ?
                  (~^((8'hb5) ?
                      (8'hbe) : wire55)) : (!reg58[(2'h2):(1'h0)])) ^ (($signed(reg64) ~^ (wire52 ^ (8'hb2))) ?
                  ($unsigned(reg61) ?
                      $signed((8'had)) : $signed((8'hb2))) : (reg59[(1'h0):(1'h0)] ?
                      reg62 : (wire51 ? (8'hab) : reg58)))));
              reg65 <= reg64;
              reg66 <= ((reg63[(1'h0):(1'h0)] ?
                      (wire53 + {reg59}) : ({(~&(8'hb8))} ?
                          {(reg59 ? reg61 : reg65),
                              reg65[(1'h0):(1'h0)]} : ($unsigned(wire55) ?
                              wire51[(1'h0):(1'h0)] : reg57))) ?
                  wire52[(1'h1):(1'h0)] : {$unsigned(($unsigned((8'hab)) ^ wire52[(1'h0):(1'h0)])),
                      reg58});
            end
          else
            begin
              reg64 <= $signed((-(reg60 | wire53[(5'h10):(1'h0)])));
              reg65 <= wire51[(1'h1):(1'h0)];
            end
          if (($signed(reg64) ?
              (~$signed((^~$signed(wire51)))) : (reg65 ?
                  (reg58[(3'h6):(3'h4)] - (|$unsigned(reg63))) : ($unsigned((~|reg58)) ?
                      $unsigned(wire51[(1'h0):(1'h0)]) : ((~&reg62) + $signed(reg65))))))
            begin
              reg67 <= (((8'ha3) ?
                      $signed((reg65 && reg58[(3'h6):(1'h0)])) : (|$unsigned(reg59[(1'h1):(1'h1)]))) ?
                  ({(wire55[(4'h8):(1'h1)] ? (|reg62) : wire53)} ?
                      wire54[(3'h5):(2'h3)] : reg62[(2'h2):(1'h0)]) : ($signed((reg66 == {reg60,
                          wire53})) ?
                      $unsigned($unsigned((+(8'ha9)))) : reg65));
            end
          else
            begin
              reg67 <= $signed(wire54[(3'h6):(3'h6)]);
              reg68 <= $signed(reg65[(1'h0):(1'h0)]);
              reg69 <= $signed($signed((((reg62 ? reg57 : reg58) ?
                  (~^wire54) : (reg66 || reg66)) + ($signed(reg57) - {reg58,
                  reg60}))));
              reg70 <= wire52;
              reg71 <= reg68[(3'h7):(1'h0)];
            end
          if ($unsigned($signed(reg67)))
            begin
              reg72 <= (~^$signed($unsigned((-(~|(8'hb6))))));
            end
          else
            begin
              reg72 <= (reg58[(3'h7):(2'h3)] >> $unsigned((({(8'hb2)} <<< (8'ha5)) - $signed(reg67[(3'h4):(3'h4)]))));
              reg73 <= (~reg66[(3'h5):(2'h3)]);
              reg74 <= (8'ha8);
            end
          if ($signed(reg69))
            begin
              reg75 <= $signed($unsigned(reg63));
              reg76 <= $unsigned(wire54);
              reg77 <= reg76;
            end
          else
            begin
              reg75 <= (wire55[(3'h4):(1'h0)] && reg70[(4'h9):(4'h9)]);
              reg76 <= ($unsigned((((|wire52) ?
                      (wire54 ~^ wire54) : (reg77 >> reg71)) & reg71[(4'hc):(3'h6)])) ?
                  ((($unsigned(wire54) ? (reg57 ? reg75 : (8'haa)) : (|reg60)) ?
                      $signed({reg60, reg62}) : {(reg62 ?
                              reg63 : reg70)}) && ($signed((reg61 ~^ (8'haa))) ?
                      reg69[(4'ha):(3'h5)] : reg76[(5'h13):(4'hd)])) : ((wire55 >> $unsigned(((8'hac) ~^ (8'hbe)))) ?
                      (($signed(reg60) == $unsigned(reg63)) ?
                          reg70[(2'h3):(1'h1)] : (reg61 ?
                              wire51[(2'h3):(2'h2)] : (reg63 >>> (8'hb2)))) : ($unsigned($unsigned(reg74)) ?
                          reg63 : ((~|wire55) * reg71[(5'h14):(4'h9)]))));
            end
        end
    end
  assign wire78 = (~&reg66);
  assign wire79 = $unsigned(((reg76[(4'h9):(3'h5)] ?
                          ({wire51} - $unsigned(reg64)) : (|$unsigned(wire52))) ?
                      wire53[(2'h2):(1'h0)] : $signed(($unsigned(reg70) && (^reg73)))));
  assign wire80 = {reg70,
                      (&(reg60[(5'h12):(2'h2)] ?
                          $signed(reg74) : wire56[(4'h9):(3'h6)]))};
  assign wire81 = $signed((({(wire53 ? reg62 : reg64),
                              (reg74 ? wire79 : reg70)} ?
                          (wire80 << (reg72 ?
                              wire55 : reg69)) : (reg61[(4'he):(4'hc)] | $signed(reg58))) ?
                      $unsigned(reg70[(2'h2):(1'h1)]) : {(-(reg60 < reg57)),
                          $unsigned((~wire80))}));
  assign wire82 = {$signed(({(reg75 >> wire79)} ?
                          $signed((wire81 != reg77)) : reg62[(1'h1):(1'h0)]))};
endmodule

module module26
#(parameter param46 = (|(((&(~^(8'hb2))) - (((8'hae) ? (8'haa) : (8'had)) >>> (|(8'hab)))) ? ((~^((8'hab) - (7'h40))) >= (^((8'hbb) ? (8'hb5) : (8'ha6)))) : (^(((8'haf) <= (8'hb7)) >= {(8'hbf)})))))
(y, clk, wire31, wire30, wire29, wire28, wire27);
  output wire [(32'h99):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire31;
  input wire signed [(4'h8):(1'h0)] wire30;
  input wire [(4'hd):(1'h0)] wire29;
  input wire signed [(4'hc):(1'h0)] wire28;
  input wire signed [(5'h13):(1'h0)] wire27;
  wire [(5'h14):(1'h0)] wire45;
  wire [(3'h4):(1'h0)] wire40;
  wire [(5'h11):(1'h0)] wire39;
  wire [(4'hd):(1'h0)] wire38;
  wire [(4'hb):(1'h0)] wire37;
  wire [(2'h3):(1'h0)] wire36;
  wire signed [(5'h12):(1'h0)] wire35;
  wire [(3'h7):(1'h0)] wire34;
  wire signed [(3'h6):(1'h0)] wire33;
  wire signed [(4'he):(1'h0)] wire32;
  reg [(5'h12):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg43 = (1'h0);
  reg [(4'he):(1'h0)] reg42 = (1'h0);
  reg [(3'h4):(1'h0)] reg41 = (1'h0);
  assign y = {wire45,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 (1'h0)};
  assign wire32 = $unsigned({(!wire30[(3'h6):(1'h1)]),
                      ($signed((&wire31)) < {((8'hb4) ? wire28 : (8'hbf))})});
  assign wire33 = (+($unsigned(wire31) <= wire30[(1'h1):(1'h0)]));
  assign wire34 = $unsigned($unsigned((+$unsigned((wire30 || wire30)))));
  assign wire35 = $unsigned((8'had));
  assign wire36 = (wire30[(3'h7):(3'h4)] >>> (wire33 ?
                      ({wire27,
                          wire27} <= $unsigned($unsigned(wire32))) : wire29[(2'h3):(2'h3)]));
  assign wire37 = $signed({$unsigned(wire33), wire32[(1'h0):(1'h0)]});
  assign wire38 = ((8'hb8) ?
                      ({{{(8'h9c), wire30}},
                          {(wire31 == (8'ha0))}} - (((wire34 ?
                          wire35 : wire30) * (wire32 ?
                          wire33 : wire37)) * (^~((8'hb7) ?
                          wire34 : wire35)))) : (~&(~&{wire27})));
  assign wire39 = (~(wire35[(5'h10):(4'hb)] - (({wire27, wire32} ?
                          (wire27 != wire29) : (+wire37)) ?
                      ($signed(wire28) <<< (wire30 ?
                          wire30 : (7'h42))) : ((~(8'ha4)) < $unsigned(wire37)))));
  assign wire40 = $unsigned((^~(8'ha6)));
  always
    @(posedge clk) begin
      reg41 <= $signed(($unsigned((-(wire36 ?
          wire32 : (8'hae)))) << (-$signed((wire37 > wire40)))));
      reg42 <= $signed(($unsigned($unsigned($unsigned(wire36))) >> ($signed(((8'hbe) ?
          wire39 : wire30)) >= ((|wire39) << (wire27 ? (8'hab) : wire36)))));
      reg43 <= (wire28 ? wire34[(3'h5):(1'h1)] : (~|wire33));
      reg44 <= $signed($signed(wire35[(4'hb):(4'hb)]));
    end
  assign wire45 = (((((7'h44) & (8'ha7)) ?
                      (8'hb0) : (^~(~&wire39))) <= wire32[(1'h1):(1'h1)]) ~^ wire34[(3'h6):(1'h0)]);
endmodule
