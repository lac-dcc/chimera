module top
#(parameter param188 = {(((((8'ha9) ? (8'ha3) : (8'hae)) ? ((8'hbd) >>> (7'h43)) : ((8'hb2) & (8'haf))) ? (((8'had) ? (8'hab) : (8'hbb)) ? ((7'h41) <= (8'hb1)) : (-(8'ha2))) : (~&(^~(8'hb6)))) <= ((~^((8'ha3) >>> (8'hac))) ? (8'h9d) : {((8'ha3) ? (7'h44) : (8'hb6)), (~&(8'haf))}))}, 
parameter param189 = ({param188, ((param188 - (|param188)) || ((param188 ? param188 : (8'hbb)) ^ (~^param188)))} + ((~^(-(param188 ? param188 : param188))) ? ((param188 ? param188 : param188) | (^~param188)) : {(((7'h41) ? param188 : param188) ? (param188 ? param188 : param188) : (param188 ? param188 : param188))})))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h10b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire [(3'h6):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire4;
  wire signed [(3'h6):(1'h0)] wire187;
  wire [(4'hc):(1'h0)] wire186;
  wire [(5'h13):(1'h0)] wire184;
  wire [(5'h11):(1'h0)] wire183;
  wire [(3'h6):(1'h0)] wire182;
  wire [(5'h14):(1'h0)] wire181;
  wire [(4'hd):(1'h0)] wire180;
  wire signed [(2'h3):(1'h0)] wire179;
  wire signed [(3'h5):(1'h0)] wire168;
  wire signed [(4'h8):(1'h0)] wire166;
  wire signed [(5'h15):(1'h0)] wire125;
  reg [(3'h7):(1'h0)] reg185 = (1'h0);
  reg [(5'h12):(1'h0)] reg178 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg177 = (1'h0);
  reg [(3'h5):(1'h0)] reg176 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg175 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg174 = (1'h0);
  reg [(4'hb):(1'h0)] reg173 = (1'h0);
  reg [(4'hd):(1'h0)] reg172 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg171 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg170 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg169 = (1'h0);
  assign y = {wire187,
                 wire186,
                 wire184,
                 wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire179,
                 wire168,
                 wire166,
                 wire125,
                 reg185,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 (1'h0)};
  module5 #() modinst126 (.wire9(wire4), .clk(clk), .wire6(wire0), .wire7(wire3), .wire8(wire1), .y(wire125), .wire10(wire2));
  module127 #() modinst167 (.wire131(wire4), .wire129(wire125), .clk(clk), .wire130(wire2), .y(wire166), .wire128(wire3));
  assign wire168 = wire4[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      if ($signed((+$signed(($signed(wire1) ? {wire3} : $unsigned(wire1))))))
        begin
          reg169 <= wire125;
          reg170 <= ($signed(wire2[(4'he):(4'hd)]) <= $unsigned($signed($signed((wire3 | wire2)))));
          reg171 <= ($signed(((^(|wire0)) >> wire2)) > wire2);
          reg172 <= (^{((8'hba) < (^~wire166)),
              (($signed(wire4) >>> wire2[(5'h14):(4'h9)]) * wire1[(2'h2):(1'h0)])});
          if ((~^$signed($unsigned(((~reg171) ? wire1 : $unsigned(reg171))))))
            begin
              reg173 <= $unsigned(wire168);
              reg174 <= $signed((&$signed(reg172[(3'h7):(3'h4)])));
            end
          else
            begin
              reg173 <= wire166[(3'h6):(2'h3)];
              reg174 <= $unsigned(((wire0[(1'h0):(1'h0)] <<< ((wire166 ?
                      wire1 : wire168) ?
                  $signed(wire0) : $signed((8'hb1)))) ^ (wire2[(4'hc):(2'h3)] ?
                  ((reg174 ? wire1 : wire2) ?
                      reg174[(3'h4):(1'h1)] : wire0) : (|wire2))));
              reg175 <= wire1;
              reg176 <= {(8'ha9),
                  $unsigned((~|({reg171, (7'h40)} != $signed(wire2))))};
            end
        end
      else
        begin
          reg169 <= $unsigned($signed($signed(reg170[(3'h6):(1'h0)])));
          reg170 <= wire125[(5'h10):(3'h6)];
        end
      reg177 <= (wire2 ?
          (($unsigned(((8'hb5) ? reg174 : reg175)) ?
              (8'ha6) : $signed((wire168 && (8'hac)))) == $signed($unsigned($unsigned(wire166)))) : wire125[(1'h1):(1'h1)]);
      reg178 <= wire1[(2'h2):(1'h0)];
    end
  assign wire179 = $signed($signed((8'hb0)));
  assign wire180 = {(($unsigned(wire125) >> $signed(reg176)) ?
                           ($unsigned(wire0[(5'h10):(2'h3)]) ?
                               wire168[(1'h0):(1'h0)] : $signed(reg170)) : wire3[(3'h5):(3'h4)]),
                       (reg174[(4'hf):(2'h2)] ?
                           $signed($signed((reg175 == reg177))) : wire166)};
  assign wire181 = ($unsigned(reg175[(2'h2):(1'h1)]) * {(~^(~(wire180 ?
                           reg171 : wire179)))});
  assign wire182 = ($signed(reg177[(5'h12):(3'h4)]) ?
                       $signed($signed((!reg177))) : (^($unsigned((^reg176)) ?
                           wire1 : {{reg172}})));
  assign wire183 = $unsigned(wire181[(4'hc):(4'hc)]);
  assign wire184 = (((!{wire168,
                           (wire168 >>> wire168)}) >> ($unsigned((~&reg172)) > wire2[(5'h11):(3'h5)])) ?
                       (+$unsigned($unsigned({reg172,
                           wire0}))) : ($signed((^~(wire182 ?
                               reg173 : wire180))) ?
                           (($signed(wire0) ?
                               (wire2 ?
                                   wire4 : wire168) : wire3[(2'h3):(2'h2)]) <<< (^~$signed(wire182))) : (&{$signed((8'hb7))})));
  always
    @(posedge clk) begin
      reg185 <= (reg169[(2'h3):(2'h2)] << {((8'hb0) >= wire181),
          (^(|$unsigned((8'hac))))});
    end
  assign wire186 = {$unsigned(reg178[(3'h5):(3'h4)]), reg177};
  assign wire187 = $signed($unsigned($signed((~{(8'hb3), wire125}))));
endmodule

module module127
#(parameter param165 = (({({(8'ha9), (8'hac)} ? ((8'hac) ? (7'h43) : (8'ha7)) : ((8'hab) - (8'hb8))), (~^(+(8'had)))} ? ((~^((8'h9f) ? (8'ha3) : (8'ha9))) == ((-(8'ha0)) ? ((8'had) * (7'h42)) : ((7'h42) ? (8'hb2) : (7'h43)))) : ((^(~&(8'ha4))) ? ((~&(8'hb3)) == ((8'h9f) == (8'hb3))) : (((8'ha3) ? (8'hbd) : (8'h9d)) ? ((8'hbd) ? (8'ha3) : (8'haa)) : (8'hb5)))) ~^ (|(((~(8'haf)) ^~ ((8'hb3) >= (8'hb2))) ^ (((8'ha6) && (8'ha2)) != ((8'hbb) ? (8'hbb) : (8'hb3)))))))
(y, clk, wire131, wire130, wire129, wire128);
  output wire [(32'hbb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire131;
  input wire [(5'h14):(1'h0)] wire130;
  input wire signed [(5'h15):(1'h0)] wire129;
  input wire [(3'h4):(1'h0)] wire128;
  wire signed [(4'hb):(1'h0)] wire164;
  wire signed [(5'h11):(1'h0)] wire163;
  wire signed [(4'hf):(1'h0)] wire162;
  wire signed [(3'h4):(1'h0)] wire161;
  wire signed [(4'hb):(1'h0)] wire160;
  wire signed [(4'h8):(1'h0)] wire159;
  wire [(4'h9):(1'h0)] wire158;
  wire signed [(4'h9):(1'h0)] wire157;
  wire [(4'hb):(1'h0)] wire156;
  wire signed [(5'h11):(1'h0)] wire155;
  wire signed [(3'h6):(1'h0)] wire153;
  wire signed [(3'h6):(1'h0)] wire136;
  wire signed [(5'h10):(1'h0)] wire135;
  wire signed [(5'h12):(1'h0)] wire134;
  wire signed [(4'he):(1'h0)] wire133;
  wire signed [(4'he):(1'h0)] wire132;
  assign y = {wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire153,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 (1'h0)};
  assign wire132 = wire129[(2'h2):(2'h2)];
  assign wire133 = (+((~^(wire130 >> {(8'h9e)})) >= ($signed($unsigned(wire128)) ?
                       wire130[(4'h8):(2'h3)] : wire131)));
  assign wire134 = (wire128[(3'h4):(1'h0)] ?
                       (8'h9e) : (|wire133[(3'h4):(2'h3)]));
  assign wire135 = wire131[(3'h7):(1'h0)];
  assign wire136 = (wire132 || wire135);
  module137 #() modinst154 (.y(wire153), .clk(clk), .wire138(wire130), .wire141(wire134), .wire140(wire129), .wire139(wire132));
  assign wire155 = ((8'hb0) <<< ((!(!$signed(wire128))) && {wire131[(3'h7):(3'h7)]}));
  assign wire156 = $signed(wire131[(1'h1):(1'h0)]);
  assign wire157 = (!{wire156[(1'h1):(1'h1)]});
  assign wire158 = (($signed({$unsigned(wire132), (wire134 ~^ (8'ha5))}) ?
                       ((8'hb0) >= wire136) : wire129[(3'h7):(3'h7)]) != (+wire136));
  assign wire159 = $signed((8'ha1));
  assign wire160 = {(wire157 && (((wire130 << wire133) <<< {wire158, wire159}) ?
                           (wire159 || $signed(wire132)) : wire129[(4'hf):(4'hd)])),
                       wire155};
  assign wire161 = $signed(wire157[(3'h7):(1'h1)]);
  assign wire162 = wire155;
  assign wire163 = wire158;
  assign wire164 = (wire153 >>> wire131[(2'h2):(1'h1)]);
endmodule

module module5
#(parameter param123 = ((^~{{((8'hb2) - (8'haa)), ((8'hb1) ? (8'hb0) : (7'h40))}, (+((8'hac) ? (7'h44) : (8'ha6)))}) ? (+((|((8'h9d) ? (8'hbb) : (7'h43))) > (+((8'ha7) ? (8'h9e) : (8'h9e))))) : (((+(~&(8'ha1))) >>> (8'ha1)) ? {(+(~(8'h9e))), ((-(7'h43)) ? (8'h9d) : ((8'hbb) ? (8'haa) : (8'hba)))} : ((((8'h9c) ? (8'h9c) : (7'h43)) + (&(8'had))) ? (+((8'hb4) ? (8'hb7) : (8'ha0))) : (~^((8'hb6) || (8'hb5)))))), 
parameter param124 = (((param123 ? ((-param123) ? (7'h40) : (8'hbe)) : ((~&param123) * param123)) - {((param123 ? param123 : param123) - param123)}) ^~ {((|param123) ^~ ((7'h43) ? ((8'haa) < param123) : (|param123)))}))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h18a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire10;
  input wire [(5'h10):(1'h0)] wire9;
  input wire [(3'h4):(1'h0)] wire8;
  input wire [(3'h6):(1'h0)] wire7;
  input wire [(5'h15):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire120;
  wire signed [(4'he):(1'h0)] wire119;
  wire [(4'he):(1'h0)] wire118;
  wire signed [(4'hc):(1'h0)] wire117;
  wire [(2'h2):(1'h0)] wire116;
  wire signed [(3'h6):(1'h0)] wire115;
  wire [(5'h12):(1'h0)] wire98;
  wire [(5'h13):(1'h0)] wire96;
  wire [(4'ha):(1'h0)] wire15;
  wire signed [(4'he):(1'h0)] wire14;
  reg [(3'h5):(1'h0)] reg122 = (1'h0);
  reg [(5'h15):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg114 = (1'h0);
  reg [(4'hc):(1'h0)] reg113 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg112 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg111 = (1'h0);
  reg [(2'h3):(1'h0)] reg110 = (1'h0);
  reg [(3'h6):(1'h0)] reg109 = (1'h0);
  reg [(4'h9):(1'h0)] reg108 = (1'h0);
  reg [(4'hc):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg106 = (1'h0);
  reg [(5'h10):(1'h0)] reg105 = (1'h0);
  reg [(5'h12):(1'h0)] reg104 = (1'h0);
  reg [(3'h5):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg100 = (1'h0);
  reg signed [(4'he):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg11 = (1'h0);
  reg [(5'h10):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg13 = (1'h0);
  assign y = {wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire98,
                 wire96,
                 wire15,
                 wire14,
                 reg122,
                 reg121,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg11,
                 reg12,
                 reg13,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg11 <= wire7;
      reg12 <= $unsigned($unsigned($unsigned((~^{wire7}))));
      reg13 <= $unsigned(wire10);
    end
  assign wire14 = (~|{((wire10 & (wire7 ?
                          wire7 : (7'h42))) <<< $unsigned($signed(wire6)))});
  assign wire15 = reg13;
  module16 #() modinst97 (.wire20(reg11), .wire21(reg12), .wire19(reg13), .clk(clk), .y(wire96), .wire17(wire10), .wire18(wire9));
  assign wire98 = $unsigned(($unsigned(wire9[(3'h4):(2'h3)]) ?
                      {((wire10 ?
                              reg13 : wire15) <= reg13[(3'h7):(3'h7)])} : wire14));
  always
    @(posedge clk) begin
      if ($unsigned(($signed($unsigned((^wire7))) || ($signed($unsigned(wire6)) >= $unsigned($unsigned(reg11))))))
        begin
          reg99 <= ($signed((reg11[(1'h1):(1'h0)] ^ ($signed(reg13) ?
                  $signed(wire6) : $unsigned(wire15)))) ?
              {(reg11 ?
                      $signed((wire6 ? reg11 : reg12)) : ($unsigned(wire8) ?
                          (|wire10) : wire98[(2'h2):(1'h1)]))} : $unsigned((7'h43)));
          if (({((~{wire10}) <<< (reg13 && $signed((8'hb1)))),
              wire9} ^ wire15[(3'h4):(1'h1)]))
            begin
              reg100 <= $unsigned((wire6[(4'hb):(4'h9)] - $unsigned($signed(reg99))));
              reg101 <= (reg99 & {reg100[(1'h0):(1'h0)]});
              reg102 <= (((~wire8) >> reg11) ^ $signed((^~{$unsigned(reg13),
                  $signed(wire9)})));
              reg103 <= ((|($signed($signed(wire6)) ?
                      $signed((reg13 == reg12)) : ($signed(wire8) ?
                          wire96[(5'h12):(4'hd)] : wire14[(1'h1):(1'h1)]))) ?
                  (8'ha3) : (wire7 ?
                      $unsigned(wire7[(2'h3):(1'h1)]) : (-wire7[(3'h6):(1'h0)])));
            end
          else
            begin
              reg100 <= $unsigned($signed(wire15));
            end
          reg104 <= (~(wire8[(2'h3):(1'h0)] ? (7'h40) : $signed((8'hb9))));
          reg105 <= (reg101 << {($signed({(8'h9f)}) ?
                  ((wire8 ? (8'ha2) : reg11) ?
                      reg11[(5'h11):(1'h0)] : reg101[(4'hf):(4'hd)]) : reg13[(4'ha):(3'h6)])});
        end
      else
        begin
          reg99 <= (wire9[(4'hc):(1'h0)] - reg103);
          if ((reg12 >= (!{(8'hb0), $signed($unsigned((8'hb3)))})))
            begin
              reg100 <= reg101[(4'hb):(4'h8)];
            end
          else
            begin
              reg100 <= reg103[(2'h2):(1'h0)];
              reg101 <= ($unsigned(reg13) || ((~reg13) & $unsigned(wire96[(5'h10):(4'h9)])));
              reg102 <= ((wire96[(5'h13):(4'hb)] + wire15[(3'h7):(3'h4)]) ?
                  reg101[(4'ha):(2'h3)] : wire6[(5'h14):(4'hd)]);
            end
          reg103 <= (~reg105);
          reg104 <= ((~&reg105[(3'h7):(2'h3)]) ?
              wire14 : {$unsigned(wire9[(2'h2):(2'h2)]), wire98});
        end
      reg106 <= wire96;
      if ($unsigned((({(8'hb8)} ?
          $unsigned(((8'ha2) >>> wire6)) : ((~|wire98) ?
              reg11[(4'h8):(3'h4)] : $signed(reg13))) >>> ({{reg103, reg105},
          (reg106 <<< wire15)} != $signed({reg100})))))
        begin
          reg107 <= $signed(((((wire7 >> reg103) ?
              $unsigned(wire7) : $signed(wire7)) * ((~^reg11) >= (reg104 ^ wire7))) > $unsigned(wire7)));
        end
      else
        begin
          reg107 <= reg100;
          reg108 <= {$unsigned((wire10 || reg105[(4'h9):(4'h9)]))};
          reg109 <= (($signed($signed(wire14[(3'h7):(2'h3)])) ?
                  (reg99 <<< wire9) : reg11) ?
              (~{((|reg100) + (~^wire14))}) : $unsigned((^reg104)));
          reg110 <= wire10;
          if ($signed(($signed($signed($unsigned(reg13))) ?
              ((-$unsigned(reg105)) ?
                  (reg110[(1'h0):(1'h0)] == {(7'h41)}) : (|reg104[(4'hf):(3'h6)])) : (&$signed((~|(8'ha4)))))))
            begin
              reg111 <= wire15;
              reg112 <= ($signed(((8'hbc) ^~ reg105)) != reg103);
              reg113 <= $signed((^((~&(wire14 >>> wire8)) < $signed((reg102 ^ reg111)))));
            end
          else
            begin
              reg111 <= $unsigned(({$unsigned($unsigned(reg112)),
                      ((wire15 ? reg103 : wire7) ^ $signed(wire7))} ?
                  {((~^reg110) ?
                          (reg109 <= wire6) : ((7'h43) < reg100))} : $signed($signed($signed(reg105)))));
              reg112 <= ((($unsigned((reg108 ? wire98 : reg12)) ?
                      (wire6[(4'hd):(1'h0)] ?
                          wire96 : $unsigned(reg99)) : (reg12[(3'h5):(2'h2)] < reg102[(4'h9):(4'h9)])) ?
                  (~&((~|reg113) ? reg102[(2'h2):(1'h1)] : reg112)) : (reg111 ?
                      $unsigned({reg109}) : $unsigned($unsigned(wire6)))) < reg107);
              reg113 <= ((reg13 ?
                      (((&reg12) << (^~reg103)) + (^~reg109[(2'h2):(1'h0)])) : (wire7 >>> {$unsigned(wire7),
                          (|wire98)})) ?
                  reg13[(2'h2):(1'h1)] : (8'hbe));
            end
        end
      reg114 <= reg103[(1'h0):(1'h0)];
    end
  assign wire115 = reg114;
  assign wire116 = reg99[(1'h0):(1'h0)];
  assign wire117 = reg105[(3'h5):(1'h1)];
  assign wire118 = ((($signed((wire96 <= reg110)) ?
                               (^(reg13 ? wire96 : wire15)) : wire116) ?
                           (^~$unsigned((reg112 ?
                               wire7 : reg108))) : ((~|(^~wire115)) ^~ $signed((wire9 ?
                               (8'h9d) : reg104)))) ?
                       {(~(^~reg102[(3'h6):(2'h2)]))} : $signed(reg12));
  assign wire119 = $signed(reg108);
  assign wire120 = (reg109 || wire10[(3'h7):(3'h5)]);
  always
    @(posedge clk) begin
      reg121 <= $unsigned($unsigned(((!wire14[(3'h4):(1'h0)]) >> wire6)));
      reg122 <= ((wire96 ? reg12 : $signed(reg121[(2'h3):(1'h1)])) ?
          ((&(((8'hb5) ? reg100 : wire14) ?
                  $signed(wire9) : (reg110 != reg113))) ?
              reg105 : (reg100 ?
                  ($signed(wire14) & $unsigned(wire117)) : $signed(((8'hba) + (8'h9f))))) : $signed((((reg102 - reg110) ?
                  (wire14 ? reg112 : reg110) : (wire7 ? reg12 : wire8)) ?
              (-(reg107 ? reg106 : reg11)) : (wire8 << {(8'haf)}))));
    end
endmodule

module module16  (y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'h352):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire21;
  input wire signed [(2'h3):(1'h0)] wire20;
  input wire signed [(4'hd):(1'h0)] wire19;
  input wire signed [(5'h10):(1'h0)] wire18;
  input wire [(4'ha):(1'h0)] wire17;
  wire signed [(4'h8):(1'h0)] wire95;
  wire [(5'h10):(1'h0)] wire94;
  wire signed [(3'h4):(1'h0)] wire93;
  wire [(4'he):(1'h0)] wire92;
  wire [(5'h15):(1'h0)] wire91;
  wire signed [(2'h3):(1'h0)] wire90;
  wire signed [(4'he):(1'h0)] wire76;
  wire [(4'hf):(1'h0)] wire75;
  wire signed [(5'h15):(1'h0)] wire74;
  wire [(4'ha):(1'h0)] wire73;
  wire [(5'h10):(1'h0)] wire69;
  wire [(5'h12):(1'h0)] wire68;
  wire [(5'h11):(1'h0)] wire38;
  wire signed [(5'h10):(1'h0)] wire37;
  wire signed [(3'h7):(1'h0)] wire36;
  wire signed [(2'h2):(1'h0)] wire35;
  wire signed [(4'h9):(1'h0)] wire22;
  reg signed [(4'hc):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg88 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg85 = (1'h0);
  reg [(3'h7):(1'h0)] reg84 = (1'h0);
  reg [(5'h10):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg81 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg80 = (1'h0);
  reg [(4'hf):(1'h0)] reg79 = (1'h0);
  reg [(4'h8):(1'h0)] reg78 = (1'h0);
  reg [(4'h8):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg72 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg70 = (1'h0);
  reg [(2'h3):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg66 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg65 = (1'h0);
  reg [(5'h13):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg63 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg61 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg59 = (1'h0);
  reg [(2'h3):(1'h0)] reg58 = (1'h0);
  reg [(4'hc):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg55 = (1'h0);
  reg [(3'h4):(1'h0)] reg54 = (1'h0);
  reg [(4'he):(1'h0)] reg53 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg49 = (1'h0);
  reg [(4'hc):(1'h0)] reg48 = (1'h0);
  reg [(4'h8):(1'h0)] reg47 = (1'h0);
  reg [(4'hb):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg45 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg44 = (1'h0);
  reg [(5'h14):(1'h0)] reg43 = (1'h0);
  reg [(4'he):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg41 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg39 = (1'h0);
  reg [(4'he):(1'h0)] reg34 = (1'h0);
  reg [(4'hc):(1'h0)] reg33 = (1'h0);
  reg [(3'h7):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg31 = (1'h0);
  reg [(3'h5):(1'h0)] reg30 = (1'h0);
  reg [(4'h9):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg28 = (1'h0);
  reg [(2'h3):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg25 = (1'h0);
  reg [(2'h3):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  assign y = {wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire69,
                 wire68,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire22,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg72,
                 reg71,
                 reg70,
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
                 reg39,
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
                 (1'h0)};
  assign wire22 = $signed(wire20[(2'h2):(1'h1)]);
  always
    @(posedge clk) begin
      if (((~^{wire22[(4'h8):(2'h3)]}) ?
          $signed((($unsigned(wire18) ? (wire22 ^ wire21) : (^~wire17)) ?
              (!$signed(wire21)) : wire19)) : $unsigned($signed($signed((wire22 && (8'hb4)))))))
        begin
          reg23 <= wire17[(4'ha):(3'h4)];
        end
      else
        begin
          reg23 <= (8'ha7);
        end
      reg24 <= $signed(wire21);
      if ({(~&wire22[(2'h3):(1'h1)])})
        begin
          reg25 <= (wire21 || $unsigned(({$signed(reg23)} ^ (!wire19))));
          if (reg23)
            begin
              reg26 <= wire21;
              reg27 <= wire19;
              reg28 <= $signed($unsigned((&$signed((wire21 ?
                  reg24 : (8'ha3))))));
              reg29 <= $unsigned(wire20);
              reg30 <= wire21[(4'h8):(3'h5)];
            end
          else
            begin
              reg26 <= wire17;
              reg27 <= (8'hb0);
              reg28 <= (~&{wire18[(4'hf):(4'hd)]});
              reg29 <= $unsigned((+($signed({wire19}) ?
                  reg26[(1'h0):(1'h0)] : (&(reg28 ? reg25 : reg28)))));
            end
          if (reg24)
            begin
              reg31 <= (~|wire19);
              reg32 <= (&(8'ha4));
            end
          else
            begin
              reg31 <= $signed((~&(~$unsigned({(7'h40), wire18}))));
              reg32 <= (^~((!$unsigned({reg32})) == wire19));
            end
        end
      else
        begin
          if ((~^reg25))
            begin
              reg25 <= ({wire21,
                  {({wire18} ? $signed(reg28) : (wire20 ? reg24 : wire21)),
                      (wire21 ?
                          (reg31 ?
                              reg26 : (8'h9c)) : $unsigned((8'hb0)))}} ~^ reg28[(2'h2):(1'h0)]);
              reg26 <= $signed(((^~(reg30[(3'h4):(3'h4)] ?
                  $signed(reg26) : (reg29 ? reg23 : wire19))) + {(&(^wire18)),
                  (|(-reg28))}));
              reg27 <= reg32;
              reg28 <= $signed(({(&{reg25, wire21})} ?
                  $signed($signed(reg31[(3'h5):(1'h1)])) : ($signed((~&(8'h9d))) ^~ (reg30 ?
                      $signed(wire21) : $unsigned(reg28)))));
            end
          else
            begin
              reg25 <= $unsigned(wire20[(2'h3):(2'h2)]);
            end
          reg29 <= ($signed($unsigned($signed((wire18 && (8'hbe))))) ?
              (~^$signed($signed(reg27[(2'h3):(1'h1)]))) : wire18[(5'h10):(2'h3)]);
          if (((($signed(wire18) ?
                  (wire19[(4'h9):(4'h9)] ?
                      (&reg29) : (8'h9c)) : $unsigned((reg32 ?
                      reg32 : wire22))) >= $signed((-(!reg26)))) ?
              (^~(&wire22)) : (~&$unsigned(wire21[(2'h2):(1'h1)]))))
            begin
              reg30 <= $signed(reg25[(2'h2):(2'h2)]);
              reg31 <= reg27;
              reg32 <= reg28;
              reg33 <= wire22[(3'h5):(1'h1)];
            end
          else
            begin
              reg30 <= $unsigned((-$unsigned(reg28)));
              reg31 <= (|$unsigned($unsigned((~|(reg26 > reg29)))));
            end
          reg34 <= $signed(wire17);
        end
    end
  assign wire35 = wire17[(3'h5):(3'h4)];
  assign wire36 = wire17[(3'h4):(2'h2)];
  assign wire37 = $unsigned(($unsigned((8'haf)) ^~ reg30[(2'h2):(2'h2)]));
  assign wire38 = $unsigned((wire20[(1'h0):(1'h0)] ?
                      (($unsigned(wire19) != (8'hb9)) ?
                          ((~&wire22) + $signed(reg34)) : {(wire35 >>> wire19)}) : (~^(reg28[(2'h2):(2'h2)] <<< $signed((8'hb5))))));
  always
    @(posedge clk) begin
      if ((-((!(8'had)) | (&$unsigned($signed(wire18))))))
        begin
          if ((reg30[(2'h3):(1'h0)] ?
              $unsigned($signed(((~&reg32) & (~|(8'h9e))))) : (reg34 << $unsigned(reg29))))
            begin
              reg39 <= (|$unsigned({((wire35 ? reg25 : wire20) ?
                      reg26 : wire36),
                  {$unsigned(wire18)}}));
              reg40 <= reg28[(2'h2):(1'h0)];
              reg41 <= (8'hb9);
              reg42 <= $unsigned(((((reg25 ? reg32 : (8'hb7)) ?
                  $signed((8'h9f)) : reg34) >= $signed($signed(reg23))) != (reg39[(4'hb):(4'hb)] <<< $unsigned((8'ha1)))));
              reg43 <= (wire22[(4'h9):(1'h1)] ?
                  ((~&{$signed((8'hb2))}) ?
                      (&wire36[(3'h6):(1'h1)]) : {reg39, (^~reg42)}) : reg39);
            end
          else
            begin
              reg39 <= reg40;
              reg40 <= ($unsigned(reg24) ?
                  (!(reg28 != reg34[(4'he):(2'h3)])) : reg26);
              reg41 <= wire20[(2'h2):(2'h2)];
              reg42 <= $unsigned((({$unsigned(wire35)} ?
                  wire38[(4'hd):(3'h7)] : $signed($unsigned(reg30))) || reg43));
              reg43 <= ((($unsigned(wire22[(3'h5):(2'h3)]) ?
                  reg39 : $unsigned({wire37,
                      wire18})) & ($unsigned($signed(wire20)) | (reg25[(2'h2):(2'h2)] ?
                  (~&reg34) : wire37))) != wire17);
            end
        end
      else
        begin
          reg39 <= $unsigned(reg39);
          reg40 <= (|(8'hae));
          reg41 <= $signed({(reg42[(4'ha):(1'h1)] ?
                  ((reg42 ? wire35 : reg23) & (~reg31)) : reg23[(4'hd):(2'h3)]),
              (reg24[(1'h0):(1'h0)] ?
                  reg33 : ((reg24 || reg25) ^ (^~wire35)))});
          reg42 <= $unsigned((reg39 ?
              $signed((8'hba)) : ($unsigned((|reg33)) < (+reg34))));
        end
      if (wire38)
        begin
          reg44 <= {($unsigned(((|reg31) + (7'h42))) ?
                  $unsigned({(reg23 ? wire18 : reg32)}) : ((wire20 ~^ ((8'hbb) ?
                      reg29 : (8'had))) >= (~reg41)))};
          reg45 <= ($unsigned((reg29 >= ((wire20 ?
                  reg41 : reg41) ^~ (&reg34)))) ?
              $signed((+reg30)) : $signed($signed((8'had))));
          reg46 <= (8'hb6);
          if ($unsigned(($unsigned(reg40) > (^{wire19}))))
            begin
              reg47 <= $signed($unsigned($signed($signed(reg24))));
              reg48 <= wire37;
              reg49 <= {({(wire17 + (-wire37))} ?
                      {(+(~&reg40)),
                          ((reg40 ? reg32 : (7'h40)) ?
                              (reg34 ?
                                  reg32 : wire21) : (reg24 ~^ reg30))} : (8'hb0))};
            end
          else
            begin
              reg47 <= {wire18};
              reg48 <= $unsigned((^reg24[(2'h2):(2'h2)]));
              reg49 <= reg42[(2'h2):(2'h2)];
              reg50 <= (~&($signed($signed(reg42[(2'h3):(2'h3)])) <<< (~^wire38)));
              reg51 <= (~|reg29);
            end
          if ({(wire19[(4'hd):(3'h6)] >> ($unsigned({wire22,
                  wire19}) ~^ {(~&reg47), $signed((8'hab))}))})
            begin
              reg52 <= {{($signed((|reg31)) ?
                          $unsigned((reg49 ?
                              wire17 : reg39)) : (reg46[(4'h8):(3'h6)] ?
                              (reg46 | (8'ha6)) : (reg27 != reg30))),
                      wire35[(2'h2):(2'h2)]}};
              reg53 <= $signed(({$unsigned(((8'hbe) ? wire36 : reg46))} ?
                  ((wire22 ?
                          reg52[(3'h5):(3'h4)] : ((8'hbf) ? wire22 : reg42)) ?
                      ($unsigned(wire36) ?
                          wire36[(1'h1):(1'h0)] : $signed(wire18)) : (~^$signed((8'ha9)))) : $unsigned((~&(reg47 || wire38)))));
              reg54 <= {({$unsigned((reg53 != reg33))} ?
                      $unsigned(((|wire37) >> (wire18 <= (8'ha1)))) : $unsigned({(reg47 - reg30),
                          (8'ha3)}))};
            end
          else
            begin
              reg52 <= $unsigned((+{((&reg24) >>> (reg49 ?
                      (8'hb8) : wire19))}));
              reg53 <= $unsigned($signed($signed((reg41 ?
                  (reg44 ? reg27 : wire18) : (reg40 ? (8'hac) : reg44)))));
              reg54 <= (&((8'h9e) ?
                  {wire19[(3'h7):(1'h1)],
                      (reg45[(1'h0):(1'h0)] || (+reg25))} : $unsigned($unsigned($unsigned(reg30)))));
              reg55 <= (&((((reg31 || wire17) + reg30[(1'h0):(1'h0)]) ?
                  $signed(wire21[(4'hd):(4'hc)]) : $signed((+wire21))) ^~ $unsigned($signed(reg50))));
              reg56 <= reg24[(1'h1):(1'h0)];
            end
        end
      else
        begin
          reg44 <= $signed((!(+reg55[(3'h4):(1'h1)])));
        end
      if ((^$signed({({reg42} ? reg43 : {(7'h41)}), reg26})))
        begin
          reg57 <= (~^reg44[(1'h1):(1'h0)]);
          reg58 <= wire18[(4'hb):(3'h7)];
          reg59 <= reg47[(1'h1):(1'h0)];
          reg60 <= $signed(reg56[(2'h2):(1'h1)]);
        end
      else
        begin
          reg57 <= $unsigned((reg48[(2'h2):(2'h2)] && reg44[(1'h1):(1'h0)]));
          if (((|(|$unsigned($unsigned(reg42)))) ?
              ({$unsigned(((8'hbd) ? reg26 : reg24)), reg23} ?
                  $unsigned(reg41) : {{(&reg24), (reg29 ? wire36 : reg23)},
                      reg44[(1'h0):(1'h0)]}) : ((~(^(reg51 ?
                  reg23 : reg41))) ^~ reg44)))
            begin
              reg58 <= $unsigned($signed($signed((+(reg27 - wire35)))));
            end
          else
            begin
              reg58 <= ((!reg25[(3'h5):(3'h4)]) ~^ reg47);
              reg59 <= wire36;
              reg60 <= ((wire38[(5'h11):(4'hf)] ?
                  (^((reg58 ? reg33 : wire18) > (reg31 ?
                      reg43 : reg27))) : $signed((~(8'hb2)))) <<< {reg23});
              reg61 <= {wire38[(4'h9):(3'h5)]};
              reg62 <= reg40[(3'h4):(2'h2)];
            end
          reg63 <= (reg25 << ((+$signed((reg54 ? reg53 : (8'ha6)))) ?
              ((~|$signed(reg55)) ?
                  (^~(+(8'hb7))) : $signed($unsigned(reg59))) : reg46));
          reg64 <= $signed($signed(reg34[(4'he):(3'h4)]));
          reg65 <= (-$signed($signed($unsigned($unsigned(reg58)))));
        end
      reg66 <= reg65;
      reg67 <= $signed(reg57[(1'h0):(1'h0)]);
    end
  assign wire68 = (-reg28[(1'h0):(1'h0)]);
  assign wire69 = ((($unsigned({(8'ha3)}) >>> reg51[(4'h9):(3'h6)]) ?
                          (($signed(wire18) ?
                              $signed((8'h9f)) : (8'hb6)) | ((reg26 | reg44) && reg51)) : (reg27[(2'h3):(2'h2)] ?
                              (~&$signed(reg43)) : (~^reg44))) ?
                      {(8'had),
                          reg61} : $unsigned((reg56 > $signed(reg43[(1'h0):(1'h0)]))));
  always
    @(posedge clk) begin
      reg70 <= $signed($unsigned(reg49));
      reg71 <= wire18[(3'h6):(3'h4)];
      reg72 <= reg67;
    end
  assign wire73 = $unsigned({(~wire36)});
  assign wire74 = $unsigned(((((reg59 ? reg55 : reg63) ?
                              ((8'ha6) && reg58) : (reg40 ? reg48 : reg51)) ?
                          (~|(&reg57)) : reg46) ?
                      $unsigned(reg72[(4'h8):(2'h3)]) : $signed(((|reg58) ?
                          $unsigned(reg44) : {wire68, (8'ha1)}))));
  assign wire75 = {((8'ha5) ?
                          reg44[(2'h2):(2'h2)] : (&(reg23[(2'h3):(2'h3)] ?
                              (~wire21) : {(8'ha8)})))};
  assign wire76 = {((8'hab) ?
                          ((reg71 | (8'h9c)) && reg56[(3'h4):(1'h0)]) : $signed(($unsigned(reg41) != (wire37 >> reg45)))),
                      (reg52[(4'ha):(3'h4)] ?
                          {((wire17 - reg63) ?
                                  (reg55 ? reg33 : reg55) : (&reg44)),
                              {reg57[(3'h7):(3'h7)]}} : $unsigned(wire22))};
  always
    @(posedge clk) begin
      reg77 <= reg27[(2'h3):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg78 <= $unsigned($unsigned($unsigned($unsigned($unsigned(wire38)))));
      reg79 <= (+(+$unsigned((|$signed(reg71)))));
      if (({$unsigned(($signed(reg63) ? $signed(wire76) : wire37)),
          (~|reg55)} - (8'h9d)))
        begin
          reg80 <= reg47[(2'h3):(2'h3)];
          if (($signed(reg45[(3'h6):(2'h3)]) ?
              ({(+reg63)} >= ((reg62 * ((8'haf) ^ wire73)) ?
                  $signed($signed(reg39)) : {(^~wire36)})) : $signed($signed($signed(reg61)))))
            begin
              reg81 <= reg54[(1'h1):(1'h1)];
              reg82 <= reg26[(3'h4):(1'h1)];
              reg83 <= reg39[(4'h8):(1'h0)];
            end
          else
            begin
              reg81 <= (wire37 ?
                  {$unsigned(reg62),
                      (~|reg78[(2'h3):(1'h0)])} : $signed(((^~$unsigned(reg49)) & reg45[(4'hf):(1'h1)])));
              reg82 <= reg54[(3'h4):(1'h1)];
            end
          if (reg33)
            begin
              reg84 <= ((reg64 | ($unsigned((reg34 - reg81)) ?
                  $signed($signed(reg30)) : reg33)) <= reg66);
              reg85 <= $signed({({reg25[(2'h2):(1'h0)]} ?
                      reg79[(3'h7):(3'h5)] : reg61),
                  $signed({(wire68 ? reg55 : wire37)})});
              reg86 <= ($signed($signed({$unsigned(reg72)})) && {$unsigned(reg83),
                  wire35[(1'h1):(1'h1)]});
              reg87 <= (8'hb3);
            end
          else
            begin
              reg84 <= (reg39[(1'h1):(1'h0)] ?
                  (^(|reg85[(3'h5):(2'h3)])) : {((reg79 >>> {reg33, wire17}) ?
                          {reg81[(3'h4):(3'h4)]} : ($unsigned(wire20) ~^ {reg78})),
                      $unsigned($signed((reg78 ~^ (8'hb1))))});
              reg85 <= (~&(~|$signed(reg67[(2'h3):(2'h3)])));
              reg86 <= wire35;
              reg87 <= (((-(reg41 ~^ $signed((8'hb6)))) >>> (|$unsigned($signed((7'h43))))) ?
                  $unsigned(($signed(reg43[(5'h11):(3'h5)]) ?
                      reg61 : reg62[(1'h0):(1'h0)])) : wire18);
            end
          reg88 <= $unsigned({reg58});
        end
      else
        begin
          reg80 <= ((|$unsigned({(reg51 ? reg87 : reg45)})) ?
              ((~^(+(reg45 ^ reg33))) ?
                  {reg59} : ($unsigned(reg51) >>> (^~reg53))) : $signed((((-reg33) <<< reg85[(2'h2):(1'h1)]) ~^ (-{reg67}))));
          reg81 <= (wire69 ~^ {{(~&$signed((8'ha0))), reg40[(4'ha):(4'h8)]}});
          reg82 <= reg44[(2'h3):(2'h2)];
        end
      reg89 <= wire75[(1'h0):(1'h0)];
    end
  assign wire90 = (~|(!reg80));
  assign wire91 = $unsigned(reg26[(2'h2):(1'h1)]);
  assign wire92 = $unsigned((&($signed((^(8'ha6))) || ({reg33} ?
                      (wire75 + reg30) : wire74[(4'hd):(2'h3)]))));
  assign wire93 = reg64[(2'h3):(2'h3)];
  assign wire94 = (8'hac);
  assign wire95 = reg25;
endmodule

module module137
#(parameter param152 = (8'hb0))
(y, clk, wire141, wire140, wire139, wire138);
  output wire [(32'h6f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire141;
  input wire signed [(5'h10):(1'h0)] wire140;
  input wire signed [(4'he):(1'h0)] wire139;
  input wire signed [(4'ha):(1'h0)] wire138;
  wire [(4'hd):(1'h0)] wire151;
  wire signed [(5'h11):(1'h0)] wire150;
  wire signed [(4'h9):(1'h0)] wire149;
  wire [(5'h10):(1'h0)] wire148;
  wire signed [(2'h2):(1'h0)] wire147;
  wire [(5'h13):(1'h0)] wire145;
  wire [(3'h6):(1'h0)] wire144;
  wire signed [(3'h7):(1'h0)] wire143;
  wire signed [(4'h9):(1'h0)] wire142;
  reg [(4'hc):(1'h0)] reg146 = (1'h0);
  assign y = {wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 reg146,
                 (1'h0)};
  assign wire142 = (((wire141 ?
                               wire141[(2'h3):(2'h2)] : {((8'ha0) ^ wire139),
                                   $signed((7'h41))}) ?
                           ($signed((8'ha1)) - {wire141[(1'h0):(1'h0)]}) : wire139[(4'hb):(4'h9)]) ?
                       $signed((~|((|wire141) ?
                           $unsigned(wire138) : wire140[(5'h10):(3'h4)]))) : $unsigned({(~&(wire140 ?
                               wire140 : wire140)),
                           (|(wire139 >>> wire139))}));
  assign wire143 = $unsigned((((^~wire139) ?
                       wire138 : {$signed(wire141)}) >> (wire139 <= $unsigned((wire142 ?
                       wire138 : wire142)))));
  assign wire144 = ($unsigned(wire143) | $unsigned((-(!wire138))));
  assign wire145 = {$unsigned($signed(wire142))};
  always
    @(posedge clk) begin
      reg146 <= wire144;
    end
  assign wire147 = (8'hbc);
  assign wire148 = $signed(wire138[(4'ha):(4'h8)]);
  assign wire149 = ((~&((~|wire148[(4'ha):(1'h1)]) ^~ {(wire145 ?
                           wire144 : wire139)})) > ($signed(wire147) & (8'hb0)));
  assign wire150 = ((^(((wire145 ? wire143 : wire143) ?
                               $signed(wire144) : $signed(wire138)) ?
                           $unsigned(wire139[(4'hd):(2'h3)]) : $signed((wire143 ?
                               wire142 : wire141)))) ?
                       ((8'hbd) >= {wire139[(2'h3):(2'h2)]}) : (~^wire142[(3'h4):(2'h3)]));
  assign wire151 = ($unsigned(wire143) ^ (((&wire138) && (((8'hbe) ?
                               wire140 : wire139) ?
                           wire142[(3'h6):(2'h3)] : (wire145 ?
                               wire139 : (7'h41)))) ?
                       wire149[(3'h4):(2'h3)] : $signed((wire141[(2'h3):(1'h1)] == (8'ha7)))));
endmodule
