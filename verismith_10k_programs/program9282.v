module top
#(parameter param203 = (^{(((|(7'h42)) ? ((8'hba) ? (8'hb5) : (8'hbf)) : (+(8'hb2))) ? (~((7'h42) && (8'hbb))) : (((8'ha2) >> (8'hbd)) != ((8'hae) ? (8'ha0) : (8'h9e)))), ((((8'ha4) <<< (8'hb6)) >>> ((8'ha3) <= (8'ha2))) || ((-(8'ha2)) & (^~(7'h42))))}))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h157):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire4;
  wire [(4'hb):(1'h0)] wire202;
  wire [(2'h3):(1'h0)] wire201;
  wire signed [(5'h14):(1'h0)] wire200;
  wire signed [(4'ha):(1'h0)] wire195;
  wire signed [(5'h13):(1'h0)] wire191;
  wire [(5'h11):(1'h0)] wire31;
  wire [(5'h10):(1'h0)] wire33;
  wire signed [(5'h14):(1'h0)] wire189;
  wire [(4'hf):(1'h0)] wire197;
  wire signed [(5'h13):(1'h0)] wire198;
  reg [(4'h8):(1'h0)] reg194 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg193 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg192 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg45 = (1'h0);
  reg [(4'he):(1'h0)] reg44 = (1'h0);
  reg [(4'he):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg42 = (1'h0);
  reg [(5'h13):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg40 = (1'h0);
  reg [(3'h6):(1'h0)] reg39 = (1'h0);
  reg [(4'h8):(1'h0)] reg38 = (1'h0);
  reg [(5'h10):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg35 = (1'h0);
  reg [(5'h13):(1'h0)] reg34 = (1'h0);
  assign y = {wire202,
                 wire201,
                 wire200,
                 wire195,
                 wire191,
                 wire31,
                 wire33,
                 wire189,
                 wire197,
                 wire198,
                 reg194,
                 reg193,
                 reg192,
                 reg45,
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
                 (1'h0)};
  module5 #() modinst32 (wire31, clk, wire0, wire2, wire1, wire4);
  assign wire33 = (^~$unsigned((((&wire31) != $unsigned(wire31)) << ($unsigned(wire0) ?
                      (wire0 ? wire1 : wire1) : wire31[(4'hf):(4'hc)]))));
  always
    @(posedge clk) begin
      if (($unsigned((~&(~&((8'ha6) ? wire0 : (8'hb5))))) ?
          wire4[(4'hd):(3'h6)] : wire0))
        begin
          reg34 <= wire2;
        end
      else
        begin
          reg34 <= $unsigned({wire0[(4'h9):(4'h9)]});
          reg35 <= $unsigned(wire2);
          reg36 <= reg34;
          reg37 <= $unsigned((reg34[(4'hb):(2'h3)] == $unsigned((~|$unsigned(wire33)))));
          reg38 <= (^~reg34[(4'ha):(2'h2)]);
        end
      reg39 <= wire4[(3'h5):(3'h4)];
      if ((wire33[(2'h2):(1'h1)] ?
          ({(^(wire1 ? wire4 : wire0)), (reg38[(1'h0):(1'h0)] ^ reg36)} ?
              $unsigned(wire31[(4'hd):(4'hb)]) : wire3[(1'h1):(1'h1)]) : reg39[(1'h1):(1'h1)]))
        begin
          reg40 <= (($unsigned(wire31) ?
              reg39[(3'h5):(1'h0)] : {$unsigned(wire33),
                  reg39}) <= (-(~&$signed((wire4 ? wire33 : reg38)))));
        end
      else
        begin
          reg40 <= $signed({(!((8'hbf) ? $unsigned(wire33) : (~&reg38))),
              {$unsigned((wire0 << wire0))}});
        end
    end
  always
    @(posedge clk) begin
      reg41 <= $signed((|$unsigned(wire33[(4'h8):(3'h5)])));
      reg42 <= {(wire33 ? {wire1} : wire0[(4'hb):(3'h7)])};
      if ($unsigned({((-{reg42}) >= $unsigned((-wire4)))}))
        begin
          reg43 <= (|(wire33 ? reg38[(4'h8):(3'h4)] : (|wire4[(4'hf):(2'h3)])));
        end
      else
        begin
          reg43 <= $unsigned((((reg37 ?
              (reg39 & wire4) : (&wire1)) ^~ (^reg35)) + (($unsigned(reg39) & $unsigned(reg35)) ?
              wire33[(2'h3):(1'h1)] : {reg42[(1'h1):(1'h1)]})));
          reg44 <= $unsigned({$unsigned((~^$unsigned(wire4))),
              reg38[(3'h5):(1'h1)]});
          reg45 <= $unsigned(((8'ha1) ?
              $unsigned((!$unsigned(reg40))) : reg36));
        end
    end
  module46 #() modinst190 (.y(wire189), .wire50(wire0), .clk(clk), .wire49(wire4), .wire51(reg41), .wire48(reg36), .wire47(wire33));
  assign wire191 = $unsigned($unsigned((8'h9f)));
  always
    @(posedge clk) begin
      reg192 <= (~$unsigned((reg40 & wire191)));
      reg193 <= reg42[(1'h1):(1'h1)];
      reg194 <= $unsigned(reg34[(3'h5):(1'h1)]);
    end
  module46 #() modinst196 (wire195, clk, wire191, reg41, wire189, reg40, wire33);
  assign wire197 = (reg42[(1'h1):(1'h1)] ? wire33 : (-reg41));
  module136 #() modinst199 (wire198, clk, wire1, reg45, wire31, reg44, wire2);
  assign wire200 = $signed(((|(~^(8'hb2))) ^ $signed($unsigned({reg35,
                       wire198}))));
  assign wire201 = $unsigned($signed(reg36));
  assign wire202 = (($unsigned($signed((~&wire4))) >>> wire2) & $unsigned(((~|{wire198}) & reg40[(3'h6):(3'h4)])));
endmodule

module module46  (y, clk, wire51, wire50, wire49, wire48, wire47);
  output wire [(32'h165):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire51;
  input wire [(2'h2):(1'h0)] wire50;
  input wire signed [(4'h8):(1'h0)] wire49;
  input wire signed [(4'hf):(1'h0)] wire48;
  input wire signed [(5'h10):(1'h0)] wire47;
  wire signed [(4'he):(1'h0)] wire188;
  wire signed [(2'h3):(1'h0)] wire187;
  wire signed [(5'h11):(1'h0)] wire133;
  wire [(5'h13):(1'h0)] wire109;
  wire [(4'hf):(1'h0)] wire103;
  wire [(4'hd):(1'h0)] wire102;
  wire [(4'h8):(1'h0)] wire101;
  wire [(4'hd):(1'h0)] wire89;
  wire signed [(3'h6):(1'h0)] wire88;
  wire signed [(4'he):(1'h0)] wire86;
  wire [(4'hd):(1'h0)] wire135;
  wire signed [(4'h9):(1'h0)] wire185;
  reg signed [(4'he):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg90 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg91 = (1'h0);
  reg [(2'h2):(1'h0)] reg92 = (1'h0);
  reg signed [(4'he):(1'h0)] reg93 = (1'h0);
  reg [(3'h5):(1'h0)] reg94 = (1'h0);
  reg [(3'h5):(1'h0)] reg95 = (1'h0);
  reg [(5'h13):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg97 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg98 = (1'h0);
  reg [(4'ha):(1'h0)] reg99 = (1'h0);
  reg [(5'h12):(1'h0)] reg100 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg104 = (1'h0);
  reg signed [(4'he):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg106 = (1'h0);
  reg [(4'hb):(1'h0)] reg107 = (1'h0);
  reg [(5'h12):(1'h0)] reg108 = (1'h0);
  assign y = {wire188,
                 wire187,
                 wire133,
                 wire109,
                 wire103,
                 wire102,
                 wire101,
                 wire89,
                 wire88,
                 wire86,
                 wire135,
                 wire185,
                 reg52,
                 reg53,
                 reg90,
                 reg91,
                 reg92,
                 reg93,
                 reg94,
                 reg95,
                 reg96,
                 reg97,
                 reg98,
                 reg99,
                 reg100,
                 reg104,
                 reg105,
                 reg106,
                 reg107,
                 reg108,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg52 <= ((wire47[(4'he):(4'hc)] || (((wire51 <<< (8'hbc)) || $signed((8'hab))) ?
          ((~wire47) ?
              (wire50 ? wire51 : wire51) : (wire48 ?
                  wire50 : wire50)) : (wire48[(2'h2):(1'h1)] ?
              wire51[(3'h5):(1'h1)] : wire48))) ~^ {(wire51[(2'h2):(1'h0)] ?
              wire47 : (+(wire50 ? wire48 : wire49))),
          wire48[(4'h9):(2'h3)]});
      reg53 <= $unsigned(reg52[(4'hc):(4'ha)]);
    end
  module54 #() modinst87 (.wire55(wire47), .wire58(reg53), .wire57(reg52), .y(wire86), .wire56(wire48), .clk(clk));
  assign wire88 = wire49;
  assign wire89 = wire49[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if ($signed((8'hbd)))
        begin
          reg90 <= reg52[(1'h0):(1'h0)];
        end
      else
        begin
          if ($signed($signed(wire47)))
            begin
              reg90 <= ($unsigned(($unsigned(wire88) * wire47[(1'h0):(1'h0)])) && reg53);
              reg91 <= ((wire89[(2'h2):(1'h1)] ?
                  reg90[(4'hd):(1'h1)] : ((+$unsigned(wire47)) | (wire50 ?
                      (~&wire88) : (|wire47)))) ^~ $signed($signed($unsigned((wire47 + reg53)))));
            end
          else
            begin
              reg90 <= ((~^(^($unsigned(reg53) < reg90[(4'h8):(3'h7)]))) != (-$unsigned((^(wire48 != wire88)))));
              reg91 <= reg53[(4'h8):(3'h7)];
            end
          reg92 <= reg52;
          reg93 <= ($unsigned($signed((wire47 - $signed(wire48)))) ?
              (^~(8'ha0)) : wire89);
          if ($unsigned($signed($unsigned((-wire51[(1'h1):(1'h1)])))))
            begin
              reg94 <= wire50;
              reg95 <= $unsigned($signed(reg94[(1'h1):(1'h0)]));
              reg96 <= wire50;
              reg97 <= (!{((+$unsigned(wire47)) | (^((8'hb8) ?
                      wire89 : reg52))),
                  {((wire50 << wire89) ~^ reg52),
                      $signed(reg52[(3'h6):(1'h0)])}});
            end
          else
            begin
              reg94 <= wire48[(4'h9):(4'h9)];
              reg95 <= (($signed((~(reg91 >>> wire51))) || ({{reg96},
                          $unsigned(wire49)} ?
                      {$unsigned(wire89), $unsigned(wire51)} : reg90)) ?
                  wire86[(1'h0):(1'h0)] : (^(-$unsigned((reg93 - reg97)))));
            end
        end
      reg98 <= reg94;
      reg99 <= (8'haa);
      reg100 <= $signed($unsigned($signed((~|(wire51 ? (8'hbd) : reg99)))));
    end
  assign wire101 = wire47[(4'hb):(3'h4)];
  assign wire102 = (reg52 <= wire88[(2'h2):(2'h2)]);
  assign wire103 = (8'h9e);
  always
    @(posedge clk) begin
      reg104 <= wire101;
      reg105 <= {reg90};
      reg106 <= (reg98[(2'h2):(1'h1)] - $signed((wire89 ?
          wire49 : (((8'hb9) ? reg104 : reg52) ? $signed(wire103) : reg94))));
      reg107 <= wire102[(3'h7):(3'h6)];
    end
  always
    @(posedge clk) begin
      reg108 <= reg93[(2'h2):(2'h2)];
    end
  assign wire109 = (8'hbb);
  module110 #() modinst134 (.wire111(reg90), .wire112(wire48), .wire113(reg53), .y(wire133), .wire114(reg93), .clk(clk));
  assign wire135 = $unsigned(($signed(($unsigned(wire51) <<< (reg53 ?
                           reg92 : reg107))) ?
                       $signed(($unsigned(reg106) < $unsigned(wire102))) : wire101));
  module136 #() modinst186 (.wire139(reg100), .wire140(wire101), .y(wire185), .wire137(wire103), .wire138(reg96), .clk(clk), .wire141(wire51));
  assign wire187 = $unsigned({$unsigned($unsigned((!reg53))),
                       (+reg92[(1'h0):(1'h0)])});
  assign wire188 = reg92[(1'h1):(1'h1)];
endmodule

module module5
#(parameter param30 = ((&(~{((7'h41) ? (8'hb4) : (8'hb6))})) ? {(8'ha2)} : ((+(((8'ha4) < (8'ha7)) ~^ ((8'h9c) ? (8'hbb) : (8'hb9)))) ~^ ((((8'hb2) ? (8'hab) : (8'ha6)) ? {(8'hb9)} : ((8'ha8) ? (8'hbe) : (8'hbe))) ? (~&((8'ha4) == (8'ha2))) : (!(+(8'hab)))))))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'hde):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire9;
  input wire [(5'h10):(1'h0)] wire8;
  input wire [(3'h7):(1'h0)] wire7;
  input wire signed [(2'h2):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire29;
  wire signed [(2'h3):(1'h0)] wire28;
  wire signed [(5'h15):(1'h0)] wire27;
  wire [(4'ha):(1'h0)] wire26;
  wire [(5'h11):(1'h0)] wire25;
  wire [(5'h12):(1'h0)] wire24;
  wire signed [(4'h8):(1'h0)] wire23;
  wire [(3'h5):(1'h0)] wire22;
  wire signed [(4'ha):(1'h0)] wire21;
  wire signed [(5'h13):(1'h0)] wire20;
  wire signed [(2'h2):(1'h0)] wire13;
  reg [(4'hb):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg18 = (1'h0);
  reg [(4'hf):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  reg [(4'hf):(1'h0)] reg15 = (1'h0);
  reg [(3'h6):(1'h0)] reg14 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg11 = (1'h0);
  reg [(2'h2):(1'h0)] reg10 = (1'h0);
  assign y = {wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire13,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg10 <= $unsigned(((((+wire6) + wire7[(3'h5):(1'h0)]) < ($signed(wire6) ?
              ((8'ha8) < wire8) : $unsigned((7'h43)))) ?
          wire8 : {{wire8}}));
      reg11 <= (wire9[(1'h1):(1'h1)] * (reg10 & (reg10 ?
          (wire6[(2'h2):(2'h2)] + wire7[(2'h3):(2'h2)]) : ($signed(wire9) <= $unsigned(wire8)))));
      reg12 <= $signed(wire6);
    end
  assign wire13 = wire7[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg14 <= (!(($signed($signed(wire9)) ?
              $signed((~^(8'h9d))) : $signed((~|wire9))) ?
          $unsigned(((wire7 ? wire9 : wire9) ?
              $unsigned((8'hb0)) : (~|reg12))) : wire7));
      if (((~{{$signed(wire7), (7'h41)}}) ?
          $unsigned($unsigned(((~reg14) < (wire13 & reg10)))) : ($signed((~^$signed(wire6))) && wire7)))
        begin
          reg15 <= (7'h42);
          reg16 <= reg14[(3'h4):(2'h3)];
        end
      else
        begin
          reg15 <= wire9[(5'h13):(4'ha)];
        end
      reg17 <= reg15[(4'he):(4'ha)];
      reg18 <= ((7'h42) ?
          $unsigned({(^(reg15 - reg10))}) : ((|(wire6[(2'h2):(2'h2)] ?
              (wire6 - wire13) : $signed((8'ha3)))) != reg11[(1'h0):(1'h0)]));
      reg19 <= $unsigned(reg17[(4'h8):(4'h8)]);
    end
  assign wire20 = ($signed(wire8[(4'hd):(1'h1)]) || (((~^$unsigned((8'hbd))) ?
                          ((wire9 ? wire8 : wire6) << (reg12 ?
                              wire13 : reg11)) : reg14) ?
                      (($unsigned(reg15) ^ $unsigned((7'h44))) ?
                          reg19[(4'h9):(3'h5)] : reg19[(1'h1):(1'h0)]) : $signed(($signed(reg10) ?
                          (reg12 ? reg15 : wire13) : {reg14, wire7}))));
  assign wire21 = $unsigned(({reg12[(4'hb):(3'h6)]} ?
                      reg18 : {(!{reg17}), wire8[(4'hb):(4'hb)]}));
  assign wire22 = (-(8'ha8));
  assign wire23 = reg15;
  assign wire24 = $unsigned(reg16[(4'h9):(2'h3)]);
  assign wire25 = reg11[(2'h3):(2'h2)];
  assign wire26 = {$unsigned({wire9})};
  assign wire27 = $signed(((^~{(|reg15), wire23[(3'h7):(1'h0)]}) ?
                      ((~&(8'hae)) ?
                          wire8 : $unsigned((reg18 ?
                              wire7 : wire22))) : (8'ha2)));
  assign wire28 = (|wire22);
  assign wire29 = $unsigned((+($unsigned((wire23 ? (8'hac) : reg15)) ?
                      $unsigned($signed(reg14)) : $unsigned($signed((8'ha3))))));
endmodule

module module136
#(parameter param184 = (((~{{(7'h42), (8'ha1)}}) && (({(7'h44), (8'ha5)} < {(8'ha3), (8'hac)}) <= (!(|(8'hbd))))) ? (((^~((8'ha5) & (8'h9e))) ? ((~(8'h9e)) <= (^(8'hb5))) : {{(7'h41)}, (~(8'hb6))}) ? ((~^{(8'hac), (8'ha0)}) || {((8'h9f) ? (8'hb3) : (8'hab))}) : (|(((8'hbd) <= (7'h42)) ? ((8'hbe) < (8'h9c)) : ((8'h9f) != (8'hab))))) : {(~^(((8'haf) ? (7'h43) : (8'had)) <= ((8'hbe) ? (7'h44) : (8'hac))))}))
(y, clk, wire141, wire140, wire139, wire138, wire137);
  output wire [(32'h1e1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire141;
  input wire [(3'h4):(1'h0)] wire140;
  input wire [(4'h8):(1'h0)] wire139;
  input wire [(3'h4):(1'h0)] wire138;
  input wire signed [(4'hf):(1'h0)] wire137;
  wire [(3'h4):(1'h0)] wire183;
  wire [(4'hb):(1'h0)] wire157;
  wire signed [(5'h14):(1'h0)] wire156;
  wire [(4'h8):(1'h0)] wire155;
  wire signed [(5'h11):(1'h0)] wire154;
  wire [(4'h8):(1'h0)] wire153;
  reg [(4'h8):(1'h0)] reg182 = (1'h0);
  reg [(4'hc):(1'h0)] reg181 = (1'h0);
  reg [(2'h2):(1'h0)] reg180 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg179 = (1'h0);
  reg signed [(4'he):(1'h0)] reg178 = (1'h0);
  reg [(2'h3):(1'h0)] reg177 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg176 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg175 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg174 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg173 = (1'h0);
  reg signed [(4'he):(1'h0)] reg172 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg171 = (1'h0);
  reg [(3'h4):(1'h0)] reg170 = (1'h0);
  reg [(5'h10):(1'h0)] reg169 = (1'h0);
  reg [(4'hd):(1'h0)] reg168 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg167 = (1'h0);
  reg [(4'he):(1'h0)] reg166 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg165 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg164 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg163 = (1'h0);
  reg [(4'h9):(1'h0)] reg162 = (1'h0);
  reg [(3'h5):(1'h0)] reg161 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg160 = (1'h0);
  reg [(4'hd):(1'h0)] reg159 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg158 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg152 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg151 = (1'h0);
  reg [(5'h13):(1'h0)] reg150 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg149 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg148 = (1'h0);
  reg [(4'ha):(1'h0)] reg147 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg146 = (1'h0);
  reg [(2'h3):(1'h0)] reg145 = (1'h0);
  reg [(3'h6):(1'h0)] reg144 = (1'h0);
  reg [(4'h8):(1'h0)] reg143 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg142 = (1'h0);
  assign y = {wire183,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
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
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg142 <= wire140;
      reg143 <= {(~&($signed((wire137 >> wire138)) == ($signed(reg142) ?
              wire137 : wire140)))};
      if ($unsigned(($unsigned($signed((&wire137))) > reg142)))
        begin
          if (wire137)
            begin
              reg144 <= $signed((wire139 ^~ (wire140 <<< $unsigned($unsigned((8'h9e))))));
              reg145 <= wire141;
              reg146 <= reg144[(2'h2):(1'h0)];
            end
          else
            begin
              reg144 <= (|((wire138[(1'h0):(1'h0)] ?
                      reg145[(1'h0):(1'h0)] : reg146[(1'h0):(1'h0)]) ?
                  $signed(wire140[(2'h3):(1'h1)]) : wire139[(1'h0):(1'h0)]));
              reg145 <= ((((reg143 <= (wire140 ? reg145 : wire138)) ?
                  ($unsigned(reg143) ?
                      {reg145,
                          (8'hbb)} : $signed(wire141)) : $unsigned($unsigned(reg145))) && (($signed(wire138) >> ((8'h9c) ?
                      wire137 : (8'hb9))) ?
                  ($unsigned((8'ha8)) ?
                      wire141[(4'hd):(4'hd)] : $signed(reg143)) : wire140[(2'h3):(1'h0)])) > reg144);
              reg146 <= wire138;
            end
          reg147 <= reg145[(1'h1):(1'h0)];
          if ($unsigned((wire141[(5'h10):(2'h2)] ?
              ((wire137[(4'hf):(4'hd)] ? $unsigned(reg145) : (~|(8'ha6))) ?
                  $signed(reg147) : $unsigned((reg147 ?
                      reg142 : reg145))) : (~&(wire141[(5'h13):(2'h3)] ?
                  (reg145 ^~ reg143) : (wire141 ? reg143 : reg147))))))
            begin
              reg148 <= wire137;
              reg149 <= ((reg147 ?
                  wire137[(4'ha):(4'h8)] : (~&(~&$unsigned(wire140)))) * (reg144[(2'h2):(2'h2)] ?
                  (($unsigned(wire137) ?
                      $signed(reg143) : $unsigned(reg145)) * $signed((reg146 ?
                      reg147 : reg142))) : reg147[(3'h6):(3'h4)]));
              reg150 <= $signed(wire140);
              reg151 <= {wire141[(4'hc):(4'h8)],
                  ((8'ha9) | (-$signed($unsigned((8'hb6)))))};
            end
          else
            begin
              reg148 <= $unsigned((((&(wire139 ? wire138 : wire138)) ?
                      ((~^reg144) + (8'haa)) : (8'h9e)) ?
                  $signed({wire139[(4'h8):(3'h6)]}) : $unsigned($signed((8'h9f)))));
              reg149 <= ((|(|{wire138})) ?
                  (^~{$signed((reg151 || reg142)),
                      (reg148 >= (~^(8'ha1)))}) : reg142);
              reg150 <= (&{{wire141}});
              reg151 <= ($signed((~|$unsigned({wire139, reg143}))) ?
                  ($unsigned($unsigned(reg143)) > (({reg146, wire137} ?
                          {wire140, reg149} : (&reg143)) ?
                      (+(reg149 * reg144)) : $unsigned(((7'h44) ?
                          reg144 : (8'ha4))))) : ((~&wire140) ?
                      (^{$signed(reg145)}) : $signed(wire137)));
            end
          reg152 <= ((+(~|{reg142[(5'h11):(1'h0)]})) - (reg143 ?
              (~^reg149[(2'h3):(2'h3)]) : reg147[(2'h3):(2'h3)]));
        end
      else
        begin
          reg144 <= reg146[(1'h1):(1'h1)];
          reg145 <= $unsigned(wire138[(1'h0):(1'h0)]);
        end
    end
  assign wire153 = ($unsigned($unsigned((reg144 - (reg146 ?
                           reg142 : reg149)))) ?
                       $unsigned((+(~&$unsigned(reg149)))) : (wire139[(1'h1):(1'h1)] ?
                           {(reg151[(2'h3):(2'h3)] ?
                                   $signed(reg147) : (reg146 >> wire138))} : (-$unsigned(reg149))));
  assign wire154 = reg143;
  assign wire155 = (!reg145[(1'h0):(1'h0)]);
  assign wire156 = reg145[(2'h3):(1'h0)];
  assign wire157 = reg151;
  always
    @(posedge clk) begin
      reg158 <= (8'ha6);
      reg159 <= $signed(((8'hb8) ?
          reg146[(1'h0):(1'h0)] : (wire156 ?
              reg149[(4'h8):(1'h1)] : reg150[(3'h4):(2'h3)])));
    end
  always
    @(posedge clk) begin
      reg160 <= (($signed(wire139[(1'h1):(1'h0)]) ?
          ((^~(wire157 & wire139)) ?
              reg150 : ((wire156 ^ wire156) ?
                  $unsigned(wire138) : (reg146 ?
                      (8'hb5) : reg148))) : (&reg150[(2'h3):(1'h0)])) | $unsigned((-({wire141} ?
          (reg159 ? (8'hb4) : reg152) : wire155[(3'h4):(2'h3)]))));
      reg161 <= reg158[(3'h6):(2'h3)];
      reg162 <= (&$signed($signed(reg150[(3'h5):(3'h4)])));
      reg163 <= $unsigned({$signed(reg146),
          ($unsigned($signed(reg161)) == $unsigned((~&wire141)))});
      if ($signed(reg143[(1'h1):(1'h1)]))
        begin
          reg164 <= wire139;
          if (((~|($signed((wire157 ?
              reg160 : wire141)) && reg143[(4'h8):(3'h5)])) < (&reg163[(3'h4):(1'h1)])))
            begin
              reg165 <= ($signed((((~wire140) == (wire137 >>> reg158)) && ((~^(8'ha0)) * $unsigned(wire137)))) <= (|wire139));
              reg166 <= $unsigned(((((reg142 >> reg145) ?
                          reg149 : $signed(reg164)) ?
                      $unsigned((-reg147)) : reg165[(5'h10):(4'hb)]) ?
                  (|(^{wire157})) : ($signed({(8'ha7)}) + reg159[(3'h5):(2'h2)])));
              reg167 <= $unsigned(({$unsigned({reg152}),
                      (wire141[(4'hc):(3'h6)] <<< (reg160 ^ reg158))} ?
                  $signed(wire156) : $unsigned(reg166)));
            end
          else
            begin
              reg165 <= (~(8'hac));
              reg166 <= $signed(reg167[(4'hb):(2'h3)]);
              reg167 <= $signed($unsigned((8'hbb)));
              reg168 <= (+({reg150[(3'h4):(1'h0)]} ?
                  (-($signed((8'haa)) | (reg151 != wire154))) : (^~(reg152[(4'hc):(1'h0)] ?
                      $unsigned(reg160) : $unsigned(reg143)))));
            end
          reg169 <= reg159[(4'h8):(1'h1)];
        end
      else
        begin
          reg164 <= {reg145[(1'h1):(1'h1)],
              ($unsigned($unsigned((^~wire155))) ?
                  $signed((reg149[(4'h9):(3'h5)] ?
                      wire156 : reg152[(2'h3):(2'h2)])) : (({reg160} - $unsigned(reg149)) >= wire137[(4'h8):(3'h6)]))};
          if ((+($signed(($unsigned(reg147) ?
              {wire139, reg160} : (reg168 ?
                  reg161 : reg152))) - (^reg161[(3'h4):(1'h0)]))))
            begin
              reg165 <= $signed(reg159);
              reg166 <= (~^reg152[(1'h0):(1'h0)]);
              reg167 <= $signed(reg160);
            end
          else
            begin
              reg165 <= wire154[(4'hd):(4'hc)];
              reg166 <= (^~($unsigned((^$signed(reg169))) ~^ $signed(($signed(wire157) <= $unsigned((8'hb0))))));
              reg167 <= reg152;
            end
        end
    end
  always
    @(posedge clk) begin
      reg170 <= reg169[(1'h0):(1'h0)];
      reg171 <= $signed((~|((reg148 & {wire154,
          reg158}) <= wire155[(2'h2):(2'h2)])));
      reg172 <= wire156;
      if ((~^(reg170 ? wire154 : reg148[(2'h3):(2'h3)])))
        begin
          reg173 <= reg172;
          if ({((~&(|(^~reg165))) >>> $signed($unsigned($signed(reg159))))})
            begin
              reg174 <= (reg143[(3'h5):(2'h2)] || wire137);
              reg175 <= $unsigned(((wire157[(4'hb):(2'h3)] >= (~$signed(reg169))) ?
                  ($signed((^reg170)) <<< wire139[(3'h4):(2'h3)]) : ((+(-reg150)) == ((reg166 ?
                      (8'hb4) : reg165) || $unsigned(reg165)))));
              reg176 <= (((8'hb7) ?
                      $unsigned($signed((-reg150))) : $unsigned(reg175)) ?
                  (wire138 ?
                      reg162 : reg148[(1'h1):(1'h0)]) : {{$signed($unsigned((8'hbb))),
                          (8'ha2)},
                      $signed(reg162[(4'h8):(2'h3)])});
            end
          else
            begin
              reg174 <= ({$signed((wire137[(2'h2):(1'h1)] ?
                      (reg162 ? wire141 : reg143) : $unsigned(reg149))),
                  $signed($unsigned(((8'ha5) >= reg158)))} >>> reg145);
              reg175 <= $unsigned(wire138);
              reg176 <= (~|(({(|reg148)} ?
                  ($signed(reg176) & (7'h40)) : $unsigned($unsigned(reg162))) & {$unsigned(reg144[(3'h6):(3'h5)])}));
              reg177 <= $signed($signed($signed(reg163)));
              reg178 <= ($signed((^~$signed((reg161 | reg172)))) + (~|reg167[(2'h2):(1'h1)]));
            end
          reg179 <= (^$signed((-($unsigned(wire138) >>> wire157))));
        end
      else
        begin
          reg173 <= wire153;
          reg174 <= reg160[(4'hc):(4'ha)];
          if ($unsigned(reg161))
            begin
              reg175 <= (wire137[(3'h5):(3'h4)] ?
                  $unsigned($signed(((^reg173) ~^ $unsigned((7'h44))))) : ((((reg159 ?
                              reg158 : (7'h40)) ?
                          reg149 : {reg151}) > (8'hb2)) ?
                      reg152 : $unsigned((&reg178))));
            end
          else
            begin
              reg175 <= (~|reg168);
              reg176 <= ((((+$unsigned((8'ha1))) ?
                  ($unsigned(reg167) && $signed(reg170)) : reg165) ^ {$unsigned(((8'hbf) ?
                      reg179 : (7'h41))),
                  $unsigned((wire140 ~^ reg164))}) & (&($signed(reg166) ?
                  $signed($signed(reg165)) : reg144)));
            end
          if (wire141[(4'hb):(3'h6)])
            begin
              reg177 <= $unsigned(reg166);
              reg178 <= reg174[(3'h4):(1'h1)];
              reg179 <= reg160;
              reg180 <= ((-$unsigned(((reg162 ?
                  reg145 : wire139) == reg147[(3'h6):(1'h1)]))) <= ({{wire137[(1'h1):(1'h1)]},
                  {$signed(reg143),
                      ((8'h9f) << (8'ha1))}} + $unsigned(reg173)));
              reg181 <= wire138[(1'h1):(1'h1)];
            end
          else
            begin
              reg177 <= (reg166[(4'he):(4'he)] ?
                  $unsigned({((reg181 ? reg145 : wire138) ?
                          ((8'haf) * reg150) : $unsigned(reg174)),
                      $signed((wire141 >> reg159))}) : $signed({$unsigned((7'h41))}));
              reg178 <= ((reg164[(5'h15):(3'h7)] ?
                  (((reg181 ? reg158 : reg180) == (reg172 >> reg170)) ?
                      wire139 : $unsigned(reg170[(3'h4):(3'h4)])) : reg171[(2'h3):(1'h0)]) != $unsigned(wire155));
              reg179 <= reg163[(1'h0):(1'h0)];
            end
        end
      reg182 <= (^~reg175);
    end
  assign wire183 = $unsigned(((wire155[(3'h6):(3'h4)] > reg149[(1'h0):(1'h0)]) || $unsigned($unsigned(reg179))));
endmodule

module module110  (y, clk, wire114, wire113, wire112, wire111);
  output wire [(32'he6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire114;
  input wire [(5'h11):(1'h0)] wire113;
  input wire signed [(4'hd):(1'h0)] wire112;
  input wire signed [(4'hd):(1'h0)] wire111;
  wire [(5'h13):(1'h0)] wire132;
  wire signed [(3'h5):(1'h0)] wire131;
  wire [(5'h13):(1'h0)] wire129;
  wire signed [(5'h14):(1'h0)] wire128;
  wire signed [(3'h7):(1'h0)] wire127;
  wire signed [(4'hf):(1'h0)] wire126;
  wire [(3'h4):(1'h0)] wire125;
  wire signed [(2'h3):(1'h0)] wire117;
  wire [(3'h4):(1'h0)] wire116;
  wire signed [(4'hb):(1'h0)] wire115;
  reg signed [(4'hf):(1'h0)] reg130 = (1'h0);
  reg [(5'h13):(1'h0)] reg124 = (1'h0);
  reg [(5'h14):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg122 = (1'h0);
  reg [(5'h12):(1'h0)] reg121 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg120 = (1'h0);
  reg [(5'h11):(1'h0)] reg119 = (1'h0);
  reg [(5'h12):(1'h0)] reg118 = (1'h0);
  assign y = {wire132,
                 wire131,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire117,
                 wire116,
                 wire115,
                 reg130,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 (1'h0)};
  assign wire115 = $signed($unsigned($signed(wire114)));
  assign wire116 = wire114;
  assign wire117 = $unsigned(((~|{(~wire111)}) ?
                       (^$signed($signed(wire114))) : (wire111[(2'h3):(2'h2)] ?
                           (wire112[(3'h6):(2'h2)] != wire113) : (wire115 ?
                               $unsigned(wire113) : wire115))));
  always
    @(posedge clk) begin
      if ((&(($signed(wire111[(4'ha):(1'h0)]) == $unsigned((wire111 & (8'hbc)))) ?
          (-$signed((wire111 + wire117))) : (($signed(wire114) < (wire115 ?
                  wire114 : wire115)) ?
              {{wire116, wire113}} : $unsigned(wire113)))))
        begin
          if (($unsigned(wire111[(1'h1):(1'h0)]) > ($unsigned(($unsigned(wire112) >= (+wire111))) ?
              $signed(wire117) : $signed(wire113[(4'hd):(3'h5)]))))
            begin
              reg118 <= $unsigned($signed(wire115));
              reg119 <= $unsigned((reg118[(5'h11):(4'hb)] ?
                  (wire115[(1'h0):(1'h0)] >= ((wire113 ^ wire116) ?
                      wire116[(1'h0):(1'h0)] : $signed(wire113))) : (~|$unsigned($signed(wire112)))));
              reg120 <= ((wire112[(3'h7):(3'h6)] ?
                  $unsigned((((8'hb4) ?
                      wire115 : wire116) != wire113[(5'h11):(1'h1)])) : $unsigned(wire113)) >>> $unsigned($signed($signed($unsigned(wire113)))));
              reg121 <= $unsigned(($unsigned({$signed(reg119)}) ?
                  ({$signed(wire112), ((8'hb9) ? wire117 : (8'had))} ?
                      $unsigned(((8'hbe) + reg120)) : {reg119[(2'h3):(1'h1)]}) : $unsigned(wire113[(3'h5):(1'h0)])));
              reg122 <= (reg121[(2'h3):(2'h2)] ?
                  $signed(($signed($signed(wire113)) ^~ {$unsigned(wire114)})) : (({$unsigned((8'hb4))} >>> ($unsigned(wire114) ?
                      $signed((8'hbf)) : wire116)) << wire111));
            end
          else
            begin
              reg118 <= (~|reg119[(4'h9):(3'h6)]);
              reg119 <= ($unsigned($unsigned({reg119[(4'hc):(4'ha)]})) ?
                  wire114 : $unsigned(($unsigned((8'h9e)) <<< wire115)));
              reg120 <= $signed(wire111[(3'h4):(3'h4)]);
            end
          reg123 <= (|(~|wire117));
        end
      else
        begin
          reg118 <= {($unsigned((~&(~|wire112))) ?
                  $unsigned(($signed(wire116) >= $unsigned(reg118))) : reg119),
              (8'hb8)};
        end
      reg124 <= (($signed(reg123) + (&$unsigned(wire114))) ?
          $signed(reg122) : $signed(reg122[(2'h2):(2'h2)]));
    end
  assign wire125 = reg120;
  assign wire126 = wire111[(3'h6):(3'h4)];
  assign wire127 = reg119[(4'hd):(4'h9)];
  assign wire128 = (^$unsigned({reg118[(5'h12):(5'h10)]}));
  assign wire129 = $unsigned(((wire115[(1'h0):(1'h0)] ?
                       (wire116 ~^ wire116[(1'h0):(1'h0)]) : reg121[(5'h10):(3'h5)]) && (^({reg122} ?
                       (8'ha9) : (reg121 ? wire116 : wire125)))));
  always
    @(posedge clk) begin
      reg130 <= (~^(~^$unsigned(reg119[(3'h6):(3'h4)])));
    end
  assign wire131 = $unsigned((+reg119));
  assign wire132 = wire131;
endmodule

module module54
#(parameter param84 = (~|(({(&(8'hb8)), {(8'ha8), (8'ha3)}} ? (((8'ha8) ? (7'h42) : (8'hbd)) ~^ ((8'ha2) ? (8'ha5) : (7'h43))) : {((8'hb1) != (8'hae))}) - (((~|(8'hbd)) >> {(8'ha9)}) > {(~^(8'hb5))}))), 
parameter param85 = (8'hbe))
(y, clk, wire58, wire57, wire56, wire55);
  output wire [(32'h135):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire58;
  input wire [(2'h3):(1'h0)] wire57;
  input wire signed [(4'hf):(1'h0)] wire56;
  input wire [(5'h10):(1'h0)] wire55;
  wire [(2'h2):(1'h0)] wire83;
  wire [(5'h11):(1'h0)] wire82;
  wire signed [(5'h11):(1'h0)] wire81;
  wire [(5'h13):(1'h0)] wire80;
  wire signed [(5'h12):(1'h0)] wire79;
  wire [(4'h8):(1'h0)] wire78;
  wire [(5'h10):(1'h0)] wire77;
  wire [(5'h13):(1'h0)] wire62;
  wire [(4'h9):(1'h0)] wire61;
  wire [(4'hb):(1'h0)] wire59;
  reg signed [(4'hd):(1'h0)] reg76 = (1'h0);
  reg [(5'h11):(1'h0)] reg75 = (1'h0);
  reg [(5'h15):(1'h0)] reg74 = (1'h0);
  reg [(3'h7):(1'h0)] reg73 = (1'h0);
  reg [(5'h12):(1'h0)] reg72 = (1'h0);
  reg [(4'he):(1'h0)] reg71 = (1'h0);
  reg [(4'hb):(1'h0)] reg70 = (1'h0);
  reg [(5'h13):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg68 = (1'h0);
  reg [(2'h3):(1'h0)] reg67 = (1'h0);
  reg [(3'h5):(1'h0)] reg66 = (1'h0);
  reg [(3'h4):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg63 = (1'h0);
  reg [(5'h11):(1'h0)] reg60 = (1'h0);
  assign y = {wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire62,
                 wire61,
                 wire59,
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
                 reg60,
                 (1'h0)};
  assign wire59 = {($signed(wire58[(3'h4):(1'h0)]) ?
                          (-$signed(wire57)) : {$unsigned({wire58, wire57}),
                              $unsigned((-wire56))})};
  always
    @(posedge clk) begin
      reg60 <= $signed((wire57[(1'h0):(1'h0)] ?
          (^{{(8'h9f), wire57}, wire56}) : wire59[(3'h7):(1'h1)]));
    end
  assign wire61 = wire58[(4'hc):(2'h3)];
  assign wire62 = ((-(wire58[(4'h8):(3'h6)] ?
                      ((wire57 ? (8'hb4) : reg60) ?
                          (!reg60) : (&wire58)) : (~(~wire59)))) >>> (|$unsigned($signed((wire55 ?
                      wire58 : wire55)))));
  always
    @(posedge clk) begin
      reg63 <= $signed((($unsigned(wire62[(3'h5):(1'h1)]) ?
          (~&((8'ha9) ?
              wire61 : wire58)) : (reg60[(3'h5):(3'h4)] < wire56)) ~^ wire59[(4'ha):(4'h8)]));
      reg64 <= (wire61 ?
          (~&$unsigned({{reg60, wire56}})) : (wire62[(4'he):(3'h5)] ?
              (~&{(wire57 ? wire57 : wire56),
                  $unsigned(wire62)}) : reg63[(1'h0):(1'h0)]));
      reg65 <= (8'hb5);
      if ($signed(((7'h42) << $signed(($unsigned(reg64) && $signed(wire55))))))
        begin
          reg66 <= $unsigned(wire57);
          reg67 <= reg63[(3'h4):(2'h3)];
        end
      else
        begin
          reg66 <= wire61[(3'h6):(2'h2)];
          reg67 <= {$signed(($unsigned((wire55 ? reg66 : reg66)) <<< {(wire59 ?
                      reg60 : reg65),
                  wire58}))};
        end
      if (wire56)
        begin
          reg68 <= (reg63 == (($unsigned({wire58}) ~^ ((wire59 ?
                      wire62 : wire61) ?
                  wire58[(4'h9):(1'h0)] : $unsigned(reg66))) ?
              $unsigned((8'ha2)) : (~&(^(wire61 ? (8'ha9) : wire61)))));
          if ({(&reg65[(1'h1):(1'h1)])})
            begin
              reg69 <= (~^$unsigned(reg64));
              reg70 <= $signed(({$signed(reg65[(2'h3):(1'h0)])} ?
                  wire56[(4'hd):(3'h4)] : wire59[(4'h9):(2'h3)]));
              reg71 <= reg69;
            end
          else
            begin
              reg69 <= (wire58[(4'hc):(4'ha)] >= wire56);
            end
          reg72 <= wire61[(3'h5):(1'h0)];
          if ($signed((8'hb5)))
            begin
              reg73 <= (wire61 && reg64);
              reg74 <= reg70;
              reg75 <= ((({{reg69, (7'h40)}, (reg67 & wire56)} | (8'hb0)) ?
                      (8'ha6) : (-$signed((!(8'ha2))))) ?
                  $unsigned(((-(|reg65)) != (!reg72[(4'hd):(3'h7)]))) : ($signed((~&(&reg73))) == ((reg60 ?
                          $unsigned(wire57) : wire58[(4'hd):(1'h1)]) ?
                      (-reg74[(5'h15):(4'h9)]) : reg65)));
              reg76 <= $signed((+reg68));
            end
          else
            begin
              reg73 <= {(^~({$signed(reg64)} >> (((8'ha2) ? reg67 : reg65) ?
                      (reg60 ? reg75 : reg66) : (~|reg70))))};
              reg74 <= (($unsigned($unsigned(reg76[(3'h7):(3'h5)])) == (((reg76 ?
                              reg66 : wire61) ?
                          $signed(reg66) : (&reg68)) ?
                      $signed((wire62 ?
                          wire62 : (8'ha6))) : (reg67[(1'h0):(1'h0)] ?
                          {reg71, wire59} : (reg70 >> wire59)))) ?
                  reg66 : wire58[(1'h1):(1'h0)]);
              reg75 <= $signed((&$signed((((8'h9d) ? (8'hbb) : (8'ha3)) ?
                  wire58[(3'h5):(3'h4)] : reg63[(1'h1):(1'h1)]))));
              reg76 <= reg71;
            end
        end
      else
        begin
          reg68 <= $signed(wire56);
        end
    end
  assign wire77 = ($unsigned((!$unsigned((wire55 || reg75)))) ?
                      (|(~|(((8'hb6) ~^ reg76) ?
                          $unsigned(reg63) : $signed(reg69)))) : (wire59[(3'h5):(2'h3)] ?
                          (wire57 ?
                              $unsigned($unsigned(reg76)) : $unsigned(reg60[(4'ha):(1'h1)])) : (8'hb2)));
  assign wire78 = ({$signed($signed(reg71)),
                      $unsigned(((!wire55) ?
                          reg66[(1'h0):(1'h0)] : ((8'hb2) > wire77)))} - ($signed((reg68[(1'h0):(1'h0)] | (-wire62))) & (~^(~&reg60[(3'h6):(3'h4)]))));
  assign wire79 = $signed(($unsigned((^$unsigned(wire57))) << $unsigned(({reg67,
                      wire56} <= (8'hbf)))));
  assign wire80 = $signed((-$signed(reg63[(2'h2):(1'h1)])));
  assign wire81 = (^({(^~$signed((8'h9f)))} ?
                      (-wire59[(2'h3):(2'h2)]) : (~^((8'hb6) ?
                          ((7'h42) ? wire61 : reg75) : $unsigned(reg60)))));
  assign wire82 = $unsigned((+(+{(reg64 >> (8'ha9))})));
  assign wire83 = ((^~($unsigned(((8'h9e) + reg76)) ?
                      ((reg67 * (8'hae)) || $unsigned((8'hba))) : (reg65[(2'h2):(2'h2)] ^ wire58))) * ((((reg74 ?
                          wire77 : (8'hac)) && $signed(wire81)) ~^ wire61) ?
                      $signed(wire59[(4'ha):(3'h7)]) : $unsigned(wire56)));
endmodule
