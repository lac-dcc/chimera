module top
#(parameter param171 = {(((~^((8'hb7) <<< (7'h44))) ? (((8'hab) || (8'hae)) & (-(8'hb4))) : ((~(8'had)) ? ((8'hb3) - (8'ha0)) : {(7'h40), (8'ha8)})) >> ({((8'ha4) ? (8'hb8) : (7'h42))} * (~(8'ha4)))), ((((!(8'ha2)) ~^ (7'h41)) || (&((8'hb4) <= (8'haf)))) < (~(((8'ha2) ? (8'hba) : (8'hb6)) ? {(8'hba)} : {(8'hb0), (8'haa)})))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hca):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire159;
  wire [(4'hd):(1'h0)] wire57;
  wire [(4'hf):(1'h0)] wire54;
  wire [(5'h11):(1'h0)] wire53;
  wire signed [(4'hd):(1'h0)] wire51;
  wire [(5'h13):(1'h0)] wire4;
  wire [(4'hd):(1'h0)] wire167;
  wire [(3'h6):(1'h0)] wire169;
  reg [(3'h6):(1'h0)] reg166 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg165 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg164 = (1'h0);
  reg signed [(4'he):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg162 = (1'h0);
  reg [(5'h10):(1'h0)] reg161 = (1'h0);
  reg [(3'h6):(1'h0)] reg56 = (1'h0);
  reg [(5'h12):(1'h0)] reg55 = (1'h0);
  assign y = {wire159,
                 wire57,
                 wire54,
                 wire53,
                 wire51,
                 wire4,
                 wire167,
                 wire169,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg56,
                 reg55,
                 (1'h0)};
  assign wire4 = $signed({$signed(((wire1 < (8'ha6)) >= $unsigned(wire3)))});
  module5 #() modinst52 (.wire7(wire1), .clk(clk), .wire6(wire2), .y(wire51), .wire8(wire3), .wire9(wire4));
  assign wire53 = ((&$unsigned(($unsigned(wire51) ?
                          {wire1} : wire3[(4'h8):(1'h0)]))) ?
                      $unsigned(wire4) : $unsigned((~&(wire0 ?
                          $unsigned(wire0) : wire0[(4'hf):(3'h6)]))));
  assign wire54 = {$unsigned(wire3[(4'ha):(3'h4)]),
                      $unsigned((wire2[(3'h4):(2'h2)] - ((wire2 ^ wire0) ?
                          $unsigned(wire51) : wire3)))};
  always
    @(posedge clk) begin
      reg55 <= $unsigned($signed(wire4));
      reg56 <= (&wire0[(3'h5):(3'h5)]);
    end
  assign wire57 = (~$unsigned({(wire51[(2'h3):(2'h3)] >= wire54[(4'h9):(1'h0)]),
                      $signed(((8'hb2) ? wire0 : wire54))}));
  module58 #() modinst160 (.wire60(wire2), .clk(clk), .wire62(wire54), .y(wire159), .wire63(wire0), .wire61(wire3), .wire59(wire51));
  always
    @(posedge clk) begin
      reg161 <= ((wire53[(3'h7):(2'h3)] ?
          (($signed(wire51) ?
              wire53 : (^~wire54)) >>> $signed((~(7'h44)))) : wire1) * ((({wire0} ?
          (wire3 ?
              wire0 : wire3) : {(7'h43)}) > $signed((~^wire51))) ^~ {$signed((^(8'hb7))),
          ($signed(wire1) && (^~reg55))}));
      reg162 <= wire53;
      reg163 <= wire1[(5'h11):(4'ha)];
      if ((+($unsigned((((8'ha8) ? reg55 : wire0) ?
          wire159[(4'hc):(3'h5)] : $signed(reg56))) || (!((-wire0) * (wire54 ?
          wire2 : reg162))))))
        begin
          reg164 <= $unsigned(($signed($unsigned(wire54[(3'h4):(1'h1)])) != $signed(((wire4 < wire51) >= reg55[(1'h1):(1'h0)]))));
          reg165 <= (8'hba);
          reg166 <= wire0[(4'hf):(4'hd)];
        end
      else
        begin
          reg164 <= wire51[(3'h6):(3'h4)];
        end
    end
  module58 #() modinst168 (wire167, clk, wire54, reg163, wire51, wire4, wire57);
  module5 #() modinst170 (.wire7(wire53), .wire9(reg162), .wire8(wire2), .clk(clk), .wire6(wire167), .y(wire169));
endmodule

module module58
#(parameter param158 = (((((^(8'hac)) ? (~^(8'ha5)) : ((7'h40) ? (8'hb8) : (8'hba))) <= (-(-(8'hb8)))) ? ((&((8'ha6) ? (8'h9e) : (8'hb5))) <= (^~((8'ha6) ^~ (8'hb4)))) : (-{{(8'ha4)}})) ? (|(~(-{(8'hb6), (8'hb0)}))) : (~&{({(8'hb5)} & (~|(8'hb5))), (+(!(8'ha9)))})))
(y, clk, wire63, wire62, wire61, wire60, wire59);
  output wire [(32'h28):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire63;
  input wire signed [(4'he):(1'h0)] wire62;
  input wire signed [(4'hd):(1'h0)] wire61;
  input wire [(5'h13):(1'h0)] wire60;
  input wire signed [(4'hd):(1'h0)] wire59;
  wire [(2'h2):(1'h0)] wire157;
  wire [(3'h5):(1'h0)] wire156;
  wire signed [(5'h11):(1'h0)] wire154;
  wire [(4'hf):(1'h0)] wire119;
  assign y = {wire157, wire156, wire154, wire119, (1'h0)};
  module64 #() modinst120 (wire119, clk, wire63, wire61, wire59, wire60);
  module121 #() modinst155 (wire154, clk, wire63, wire62, wire61, wire60);
  assign wire156 = (8'hb3);
  assign wire157 = wire63;
endmodule

module module5  (y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h163):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire9;
  input wire [(4'hd):(1'h0)] wire8;
  input wire signed [(5'h11):(1'h0)] wire7;
  input wire [(4'hc):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire50;
  wire [(4'h8):(1'h0)] wire48;
  wire [(5'h10):(1'h0)] wire36;
  wire signed [(3'h7):(1'h0)] wire26;
  wire signed [(5'h15):(1'h0)] wire25;
  wire signed [(4'hc):(1'h0)] wire24;
  wire signed [(4'ha):(1'h0)] wire18;
  wire [(2'h3):(1'h0)] wire17;
  wire [(4'hb):(1'h0)] wire16;
  wire [(4'hd):(1'h0)] wire10;
  reg [(4'hf):(1'h0)] reg11 = (1'h0);
  reg signed [(4'he):(1'h0)] reg12 = (1'h0);
  reg [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(4'h9):(1'h0)] reg14 = (1'h0);
  reg [(3'h6):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg21 = (1'h0);
  reg [(5'h10):(1'h0)] reg22 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg23 = (1'h0);
  reg [(2'h3):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg30 = (1'h0);
  reg [(4'hf):(1'h0)] reg31 = (1'h0);
  reg [(2'h3):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg34 = (1'h0);
  reg [(4'hf):(1'h0)] reg35 = (1'h0);
  assign y = {wire50,
                 wire48,
                 wire36,
                 wire26,
                 wire25,
                 wire24,
                 wire18,
                 wire17,
                 wire16,
                 wire10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 (1'h0)};
  assign wire10 = (-{{$unsigned((wire9 ? (8'haf) : wire8))}});
  always
    @(posedge clk) begin
      reg11 <= wire7;
      reg12 <= (-reg11);
    end
  always
    @(posedge clk) begin
      reg13 <= $unsigned((({$signed(wire7)} + ((wire7 ?
          reg11 : wire10) << (~&reg11))) > (~(((8'ha5) ? reg12 : reg11) ?
          {reg12, wire7} : wire9[(3'h6):(3'h5)]))));
      reg14 <= wire8;
      reg15 <= $unsigned((&reg14[(3'h4):(1'h0)]));
    end
  assign wire16 = $unsigned($signed($signed(($unsigned(reg11) - {wire7,
                      wire6}))));
  assign wire17 = $signed(wire16);
  assign wire18 = $signed((wire8[(1'h1):(1'h1)] >> reg15[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg19 <= {$unsigned($unsigned(wire16)),
          $unsigned($signed((^~$unsigned(wire9))))};
      reg20 <= wire17[(1'h1):(1'h1)];
      reg21 <= ($signed(($unsigned($signed(wire6)) & (-(~|reg15)))) == {{(reg12[(4'hd):(4'hd)] <<< $signed(wire16)),
              $signed(wire17[(1'h1):(1'h1)])},
          $unsigned(wire17)});
      if (($unsigned((($signed((8'had)) | reg15) <= (+(|reg12)))) ?
          wire10 : (reg13[(4'he):(4'hc)] | reg14)))
        begin
          reg22 <= {reg20[(4'he):(4'h8)],
              (~|({$unsigned(wire16),
                  $unsigned(wire10)} * $signed($signed(wire18))))};
        end
      else
        begin
          reg22 <= $signed(wire9[(4'hc):(1'h0)]);
        end
      reg23 <= reg22;
    end
  assign wire24 = (wire7[(2'h3):(2'h3)] ?
                      ($unsigned(($unsigned(reg22) ?
                              (8'ha3) : {reg19, wire17})) ?
                          (~^reg21) : ($unsigned(reg21) >>> (8'h9e))) : $signed((reg14[(3'h4):(2'h2)] ?
                          (reg12[(1'h1):(1'h1)] * wire6[(3'h6):(3'h5)]) : reg21[(2'h3):(2'h2)])));
  assign wire25 = reg11;
  assign wire26 = (($unsigned($unsigned((wire24 == (8'hb4)))) ?
                      $signed((~$unsigned(reg14))) : ((reg23 ?
                              $signed(reg21) : reg13[(2'h2):(2'h2)]) ?
                          (^(~&reg14)) : $unsigned($signed(reg23)))) << wire6);
  always
    @(posedge clk) begin
      reg27 <= (~&wire18);
      reg28 <= $signed((reg21[(4'hd):(3'h7)] ?
          $unsigned(reg20) : {reg27[(1'h0):(1'h0)]}));
      reg29 <= wire17;
      if (({reg15,
          (wire16 ?
              wire25 : ({wire6} ^ (wire25 <<< wire25)))} < wire18[(3'h4):(1'h1)]))
        begin
          reg30 <= ((^~reg22[(4'hd):(4'ha)]) ?
              reg22[(2'h3):(1'h0)] : $unsigned(wire18[(1'h0):(1'h0)]));
          if ($unsigned(reg23[(3'h5):(1'h0)]))
            begin
              reg31 <= reg21[(3'h6):(2'h2)];
              reg32 <= reg20;
            end
          else
            begin
              reg31 <= reg27;
              reg32 <= $unsigned((^wire10[(3'h7):(3'h4)]));
              reg33 <= wire7;
              reg34 <= reg15;
            end
          reg35 <= (8'hae);
        end
      else
        begin
          reg30 <= reg11[(3'h6):(3'h4)];
          reg31 <= wire7[(4'h8):(2'h3)];
        end
    end
  assign wire36 = wire25[(2'h2):(1'h1)];
  module37 #() modinst49 (wire48, clk, wire25, reg32, reg15, reg35, wire10);
  assign wire50 = reg23;
endmodule

module module37  (y, clk, wire42, wire41, wire40, wire39, wire38);
  output wire [(32'h45):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire42;
  input wire signed [(2'h2):(1'h0)] wire41;
  input wire [(3'h4):(1'h0)] wire40;
  input wire signed [(3'h7):(1'h0)] wire39;
  input wire signed [(4'hd):(1'h0)] wire38;
  wire [(2'h2):(1'h0)] wire47;
  wire signed [(4'hb):(1'h0)] wire46;
  wire [(5'h15):(1'h0)] wire45;
  reg [(4'hf):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg43 = (1'h0);
  assign y = {wire47, wire46, wire45, reg44, reg43, (1'h0)};
  always
    @(posedge clk) begin
      reg43 <= (!((7'h43) ? wire39 : wire40[(2'h2):(2'h2)]));
      reg44 <= reg43;
    end
  assign wire45 = $signed(($signed($unsigned((wire41 < reg44))) ?
                      (+wire42[(5'h14):(4'ha)]) : (-{wire42[(3'h4):(3'h4)],
                          wire41[(1'h1):(1'h0)]})));
  assign wire46 = wire41[(1'h1):(1'h0)];
  assign wire47 = {$signed($signed((!(wire40 - wire40))))};
endmodule

module module121  (y, clk, wire125, wire124, wire123, wire122);
  output wire [(32'h15d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire125;
  input wire signed [(4'he):(1'h0)] wire124;
  input wire [(4'hd):(1'h0)] wire123;
  input wire signed [(4'he):(1'h0)] wire122;
  wire [(5'h10):(1'h0)] wire153;
  wire signed [(4'ha):(1'h0)] wire131;
  wire [(3'h5):(1'h0)] wire130;
  wire [(2'h3):(1'h0)] wire129;
  wire [(4'hf):(1'h0)] wire128;
  wire signed [(5'h12):(1'h0)] wire127;
  wire signed [(2'h3):(1'h0)] wire126;
  reg signed [(3'h7):(1'h0)] reg152 = (1'h0);
  reg [(3'h4):(1'h0)] reg151 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg150 = (1'h0);
  reg [(5'h11):(1'h0)] reg149 = (1'h0);
  reg [(5'h10):(1'h0)] reg148 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg147 = (1'h0);
  reg [(4'hd):(1'h0)] reg146 = (1'h0);
  reg [(5'h10):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg144 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg143 = (1'h0);
  reg [(5'h13):(1'h0)] reg142 = (1'h0);
  reg [(3'h7):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg139 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg138 = (1'h0);
  reg [(5'h15):(1'h0)] reg137 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg136 = (1'h0);
  reg [(3'h5):(1'h0)] reg135 = (1'h0);
  reg [(4'hf):(1'h0)] reg134 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg133 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg132 = (1'h0);
  assign y = {wire153,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
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
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 (1'h0)};
  assign wire126 = $signed((^{wire122, (wire123 & $signed(wire122))}));
  assign wire127 = {(^wire124), wire122[(3'h7):(3'h5)]};
  assign wire128 = ({wire125[(4'hb):(3'h6)],
                       $unsigned($unsigned($signed((8'hb3))))} || {$signed(wire126),
                       $signed(wire123)});
  assign wire129 = (wire122[(2'h2):(1'h0)] ?
                       $signed((((wire122 ?
                           wire127 : wire128) | wire122[(2'h3):(1'h0)]) ^ wire125[(4'hc):(2'h2)])) : (^$unsigned(wire127)));
  assign wire130 = wire126[(2'h3):(1'h1)];
  assign wire131 = ($signed({(!$signed(wire126)),
                           ({wire128, wire124} != (wire128 ?
                               wire124 : wire130))}) ?
                       wire122[(4'h8):(3'h7)] : wire125[(3'h4):(3'h4)]);
  always
    @(posedge clk) begin
      if (((~&(~&(&wire130))) ? wire131[(1'h1):(1'h0)] : $signed(wire127)))
        begin
          reg132 <= $signed({({wire122} ?
                  $signed((!wire126)) : ({(8'ha9)} ?
                      (~|(8'h9d)) : $signed(wire128)))});
          if ((($unsigned(wire123[(4'ha):(2'h2)]) ?
                  {wire126[(1'h0):(1'h0)]} : $unsigned(((wire124 ?
                      wire125 : wire125) >> (wire128 | reg132)))) ?
              {(8'ha6), $signed((|((8'hbb) ? wire125 : wire131)))} : wire128))
            begin
              reg133 <= (+((({(7'h43)} + wire128[(4'he):(3'h7)]) ?
                      ($signed(wire124) ?
                          (wire127 ^ wire130) : $unsigned(wire129)) : {$unsigned(wire122)}) ?
                  {(reg132 ? (wire131 >= wire124) : wire122[(2'h3):(1'h0)]),
                      $unsigned((wire125 ?
                          wire125 : (8'hb9)))} : wire124[(4'h9):(3'h5)]));
            end
          else
            begin
              reg133 <= $signed((wire131 ?
                  (+wire122[(4'hd):(4'h9)]) : $signed($unsigned((wire129 ?
                      wire122 : wire127)))));
              reg134 <= $unsigned(wire125);
              reg135 <= $unsigned((^(~&(wire129[(2'h3):(2'h2)] ?
                  $signed(wire123) : ((8'hab) ? (8'hbd) : wire122)))));
              reg136 <= (wire125 ?
                  $signed($signed({(^~wire128),
                      (wire128 & wire123)})) : (-(^~((wire127 - wire123) || wire129))));
              reg137 <= ($signed($unsigned($signed(wire125))) ^ wire129[(2'h3):(2'h2)]);
            end
        end
      else
        begin
          if (($signed(($signed(wire123[(2'h3):(1'h0)]) == wire122[(3'h4):(1'h1)])) & (8'hbc)))
            begin
              reg132 <= {(!(7'h42))};
              reg133 <= (wire131[(3'h4):(3'h4)] <<< {$unsigned(wire128),
                  (wire131[(3'h7):(1'h1)] ^~ reg135[(1'h1):(1'h0)])});
              reg134 <= (~(!($unsigned((!wire122)) && wire122[(3'h4):(3'h4)])));
            end
          else
            begin
              reg132 <= {$unsigned(($unsigned((!wire123)) - ($unsigned((7'h42)) | $unsigned((8'ha8))))),
                  (8'h9e)};
            end
        end
      if ($signed(reg135))
        begin
          reg138 <= wire127;
          if (($unsigned((^~wire129)) ? (|reg132[(3'h7):(1'h0)]) : wire126))
            begin
              reg139 <= (~&(reg138[(4'he):(4'hb)] ?
                  reg134 : reg135[(1'h0):(1'h0)]));
            end
          else
            begin
              reg139 <= wire127[(3'h6):(3'h4)];
            end
          reg140 <= (wire130 ?
              $signed($signed((^~$signed(wire128)))) : $signed(($signed(wire123) == (^~reg135))));
        end
      else
        begin
          reg138 <= $signed((&wire130));
          reg139 <= reg139[(2'h3):(2'h3)];
        end
      reg141 <= ((wire129 << wire122) - (8'hb2));
      if (wire129)
        begin
          reg142 <= $unsigned(wire124[(4'hc):(3'h7)]);
          reg143 <= reg139[(4'h9):(4'h8)];
          reg144 <= ((-wire129[(2'h3):(2'h2)]) != wire125);
        end
      else
        begin
          reg142 <= $unsigned(({(!(wire124 > (8'hb2)))} | $unsigned((~(wire124 ?
              reg141 : wire125)))));
          reg143 <= $unsigned({reg138[(3'h4):(3'h4)]});
          reg144 <= ($unsigned(wire128) == reg134[(1'h0):(1'h0)]);
          if ($signed(({((reg144 ? wire131 : wire127) ?
                  wire130[(1'h1):(1'h0)] : (~^reg132))} <<< $unsigned(reg144[(1'h1):(1'h0)]))))
            begin
              reg145 <= ($signed($unsigned(($signed(wire125) ?
                  (reg144 >= reg141) : $unsigned((8'hab))))) ~^ ((~&$signed((reg134 >= wire131))) ^~ $unsigned(((wire127 ?
                  wire128 : reg136) | (reg140 * wire128)))));
              reg146 <= ((reg135[(2'h2):(2'h2)] == reg142[(5'h12):(5'h12)]) ?
                  wire125 : $unsigned(wire122[(4'hc):(2'h3)]));
            end
          else
            begin
              reg145 <= ({$unsigned($signed($unsigned(wire124))),
                      $signed(reg137[(1'h1):(1'h1)])} ?
                  $signed((8'ha8)) : ((&$signed((wire129 + reg138))) ?
                      $unsigned($unsigned((reg135 & (8'hae)))) : ({wire122[(4'hb):(3'h4)],
                              (8'ha7)} ?
                          ((reg138 ?
                              wire127 : reg133) >>> reg138) : $unsigned($unsigned(reg132)))));
              reg146 <= wire124;
              reg147 <= $unsigned(($unsigned({wire128[(4'hb):(4'ha)]}) >>> ($signed(reg139) ?
                  {(&(8'hbe)),
                      $unsigned(wire127)} : $unsigned($signed(wire129)))));
              reg148 <= $unsigned({$unsigned($unsigned({reg143}))});
              reg149 <= reg139;
            end
          if ((~|(~reg147[(4'hb):(4'hb)])))
            begin
              reg150 <= $signed($signed($signed($signed((wire122 ?
                  (8'ha4) : wire123)))));
            end
          else
            begin
              reg150 <= $signed(reg145);
              reg151 <= reg148;
              reg152 <= $signed($unsigned(($signed(reg136) | (^~(reg144 ?
                  (8'hb0) : reg133)))));
            end
        end
    end
  assign wire153 = wire130[(2'h2):(2'h2)];
endmodule

module module64  (y, clk, wire68, wire67, wire66, wire65);
  output wire [(32'h297):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire68;
  input wire [(4'hb):(1'h0)] wire67;
  input wire [(4'hd):(1'h0)] wire66;
  input wire [(5'h13):(1'h0)] wire65;
  wire signed [(5'h14):(1'h0)] wire118;
  wire signed [(4'he):(1'h0)] wire117;
  wire [(4'ha):(1'h0)] wire102;
  wire signed [(5'h14):(1'h0)] wire101;
  wire [(4'hc):(1'h0)] wire100;
  wire [(4'ha):(1'h0)] wire99;
  wire signed [(4'hd):(1'h0)] wire98;
  wire [(5'h13):(1'h0)] wire97;
  wire [(4'h9):(1'h0)] wire96;
  wire signed [(4'he):(1'h0)] wire95;
  wire signed [(5'h11):(1'h0)] wire85;
  wire signed [(4'he):(1'h0)] wire84;
  wire signed [(5'h11):(1'h0)] wire83;
  wire signed [(5'h15):(1'h0)] wire82;
  wire [(4'hf):(1'h0)] wire81;
  wire signed [(5'h12):(1'h0)] wire69;
  reg signed [(4'h8):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg115 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg114 = (1'h0);
  reg [(4'hc):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg112 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg111 = (1'h0);
  reg [(5'h11):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg107 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg106 = (1'h0);
  reg [(5'h13):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg104 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg103 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg94 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg91 = (1'h0);
  reg [(5'h13):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg89 = (1'h0);
  reg signed [(4'he):(1'h0)] reg88 = (1'h0);
  reg [(5'h12):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg86 = (1'h0);
  reg [(3'h7):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg79 = (1'h0);
  reg [(5'h11):(1'h0)] reg78 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg76 = (1'h0);
  reg [(5'h12):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg73 = (1'h0);
  reg [(2'h3):(1'h0)] reg72 = (1'h0);
  reg [(5'h10):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg70 = (1'h0);
  assign y = {wire118,
                 wire117,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire69,
                 reg116,
                 reg115,
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
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 (1'h0)};
  assign wire69 = (($signed($unsigned(((8'ha7) ? wire66 : wire66))) ?
                          wire66 : wire65) ?
                      ($unsigned(wire65) >>> {$signed(wire65),
                          (~^$signed(wire65))}) : ((wire66 >> $unsigned((~|wire68))) >>> wire65[(5'h10):(4'h8)]));
  always
    @(posedge clk) begin
      reg70 <= (~(~&wire69));
      reg71 <= wire65;
      reg72 <= wire66[(1'h1):(1'h0)];
      reg73 <= ((~^(^~(wire65[(3'h5):(2'h2)] * wire65[(4'hd):(4'h9)]))) * $unsigned($unsigned($unsigned(wire66))));
      reg74 <= wire68;
    end
  always
    @(posedge clk) begin
      reg75 <= wire65;
      reg76 <= ((+(reg72 ? wire68 : $signed((reg75 ^~ reg72)))) ^~ wire65);
      if (wire66)
        begin
          reg77 <= ((&(((~|reg75) * (wire69 ? reg75 : reg76)) ?
              reg70[(2'h2):(1'h0)] : (reg74[(4'ha):(1'h1)] ?
                  reg75[(4'h8):(2'h2)] : (^reg75)))) >>> reg72[(2'h2):(1'h0)]);
          reg78 <= (~&((((&(7'h43)) <= $signed(reg77)) ?
                  $unsigned((&(8'hab))) : reg74) ?
              $unsigned($signed(reg71[(4'ha):(3'h6)])) : reg75[(3'h6):(3'h6)]));
          reg79 <= {$unsigned(wire65)};
        end
      else
        begin
          reg77 <= wire67[(1'h1):(1'h1)];
          if ($signed((~^$signed($signed(reg73)))))
            begin
              reg78 <= reg79;
              reg79 <= (($signed($unsigned($signed(wire68))) ?
                  $signed(wire66) : (~|$signed((reg74 ?
                      wire65 : reg70)))) <= $signed($signed(((reg70 < wire66) ?
                  reg79 : {(8'ha7), wire69}))));
            end
          else
            begin
              reg78 <= ((($unsigned((~|(8'ha1))) >= (wire69 ?
                      reg70 : ((8'ha7) >> (8'ha5)))) ^ (~reg74)) ?
                  (({$unsigned((8'hae))} ?
                          ($signed(wire66) < {wire66}) : wire66) ?
                      reg73[(1'h1):(1'h0)] : reg78[(4'ha):(3'h7)]) : $signed($signed((!(~&wire67)))));
              reg79 <= ($unsigned($signed(reg71[(3'h6):(3'h6)])) ?
                  (!reg79[(3'h4):(2'h3)]) : $unsigned((reg71 && reg79[(2'h2):(2'h2)])));
            end
          reg80 <= ((^((reg77 <= ((8'hb5) ? reg77 : reg72)) ? reg73 : reg75)) ?
              $signed($unsigned((|wire66[(4'h9):(4'h9)]))) : reg77);
        end
    end
  assign wire81 = reg70;
  assign wire82 = ((~(~&reg71[(2'h3):(2'h2)])) != $signed((8'ha4)));
  assign wire83 = (8'had);
  assign wire84 = (reg78 ? reg75[(4'hc):(3'h5)] : reg72[(2'h2):(2'h2)]);
  assign wire85 = (reg76 ?
                      $signed({$unsigned((~^wire67)),
                          $unsigned(((7'h43) <= wire81))}) : $unsigned((~^reg70)));
  always
    @(posedge clk) begin
      reg86 <= {wire68[(1'h1):(1'h1)],
          {reg78[(2'h3):(1'h0)],
              ($unsigned($signed(reg76)) ? reg74 : (+$signed((8'ha1))))}};
      reg87 <= $unsigned(wire81);
      reg88 <= wire83[(4'h8):(3'h4)];
      reg89 <= $signed((({wire82[(2'h3):(1'h0)]} ^~ $unsigned(wire65)) > $unsigned(((~|(8'h9e)) ?
          (!reg78) : (wire68 ? reg74 : (8'hba))))));
    end
  always
    @(posedge clk) begin
      reg90 <= $signed($unsigned(((|{wire66,
          reg88}) <= $unsigned(reg70[(1'h0):(1'h0)]))));
      reg91 <= $signed($signed($unsigned(reg70[(4'hb):(2'h3)])));
      reg92 <= reg76;
      reg93 <= reg75;
      reg94 <= wire81[(4'h9):(2'h2)];
    end
  assign wire95 = ((((wire84[(4'hc):(2'h2)] << reg88[(2'h2):(1'h0)]) ?
                              (((8'hab) ? reg79 : (8'haf)) ?
                                  (reg80 >= reg77) : reg71) : ($unsigned(reg87) ?
                                  $signed(reg73) : (reg79 ?
                                      (8'hab) : wire84))) ?
                          (($signed(reg79) ?
                                  (~|(8'h9f)) : (reg77 ? reg93 : (8'h9d))) ?
                              reg78 : {((8'ha6) * reg71)}) : (8'haf)) ?
                      (7'h43) : ((&reg88[(3'h7):(3'h4)]) & (+(|reg75))));
  assign wire96 = $unsigned({(~wire65[(2'h3):(1'h0)]),
                      (({reg71, reg79} ^ reg71[(4'ha):(4'h9)]) ?
                          (!(~^(8'hb9))) : {reg87,
                              (reg88 ? (8'h9e) : reg79)})});
  assign wire97 = (($unsigned(wire95[(3'h5):(2'h2)]) >>> ($unsigned((wire67 & reg76)) <<< $unsigned(wire96))) ?
                      wire67[(4'ha):(2'h2)] : (((wire69 + {reg79}) >= (^(wire84 ?
                          reg86 : reg76))) <<< reg74));
  assign wire98 = (($signed(((wire95 ? (8'hae) : wire66) - (~^wire83))) ?
                      ($unsigned((reg94 ?
                          wire97 : reg93)) + reg80[(3'h7):(1'h0)]) : $signed(((!(8'hb3)) ?
                          (7'h42) : (reg87 < reg77)))) ^ ($signed((8'hbf)) <<< reg87));
  assign wire99 = wire95;
  assign wire100 = (-$signed((($unsigned(wire83) ?
                       (~|reg92) : reg90) + $unsigned((reg92 << wire95)))));
  assign wire101 = $signed((8'ha5));
  assign wire102 = (~$signed({$signed(reg89)}));
  always
    @(posedge clk) begin
      if ((8'hba))
        begin
          if ($signed(wire99[(1'h0):(1'h0)]))
            begin
              reg103 <= $unsigned($unsigned($signed((~^reg91[(3'h5):(1'h0)]))));
              reg104 <= ({($signed((wire65 ?
                      reg72 : reg103)) || wire65)} >>> (^(((reg89 ?
                      reg73 : wire67) ?
                  reg79[(3'h4):(2'h2)] : (reg76 || (8'hbc))) >>> reg89)));
              reg105 <= ((~reg104[(4'h8):(4'h8)]) ?
                  (8'ha2) : ($signed($signed((^wire101))) ?
                      wire98[(2'h3):(2'h3)] : $signed(reg86[(4'hc):(3'h7)])));
              reg106 <= $signed($unsigned((($signed((8'h9e)) ?
                  ((8'ha5) | (8'h9d)) : reg93) || $unsigned($signed(wire81)))));
              reg107 <= ($unsigned(wire102) ?
                  reg74[(5'h15):(1'h1)] : ($signed((!$unsigned(wire96))) * $unsigned(((-wire65) ^~ reg106))));
            end
          else
            begin
              reg103 <= $unsigned($unsigned($unsigned((wire95[(1'h1):(1'h0)] >> (reg79 != reg103)))));
              reg104 <= (((&$signed(((8'hbf) ? (8'ha8) : reg107))) ?
                  reg73 : reg89[(4'he):(2'h3)]) + $unsigned($unsigned({wire84[(4'h9):(4'h9)]})));
            end
          if ((reg89[(1'h1):(1'h0)] ?
              {{(wire98[(4'hb):(2'h3)] ?
                          $signed(reg79) : (reg106 ? reg94 : wire67)),
                      $signed(wire81[(1'h0):(1'h0)])},
                  (~|({wire65} ? $unsigned(wire83) : $signed(reg94)))} : reg71))
            begin
              reg108 <= ($unsigned({$unsigned(((8'hb9) + (8'h9f))),
                      wire97[(4'hb):(4'hb)]}) ?
                  reg89 : ($signed((~^$signed(reg72))) == $unsigned((|(reg78 ?
                      reg70 : reg93)))));
            end
          else
            begin
              reg108 <= $unsigned(reg104);
              reg109 <= ((~wire99) ?
                  {((&reg87[(3'h5):(2'h2)]) + $signed((~|reg108)))} : reg107[(4'hd):(3'h5)]);
              reg110 <= (($signed((wire95 ?
                      $signed(reg73) : $unsigned(wire85))) << reg72) ?
                  {$unsigned({wire68[(4'h9):(2'h3)]})} : reg104[(3'h7):(3'h4)]);
              reg111 <= reg91[(2'h2):(2'h2)];
              reg112 <= ($signed($signed(($signed(wire65) > (reg93 & reg79)))) ?
                  wire66[(2'h3):(2'h2)] : reg103[(2'h3):(1'h1)]);
            end
          reg113 <= ($signed($signed((reg79[(4'hd):(4'hc)] ?
                  {wire67} : ((8'haf) ? wire97 : reg76)))) ?
              reg110 : wire95);
        end
      else
        begin
          reg103 <= $unsigned(reg111);
          reg104 <= $signed({($unsigned({reg70}) | wire84[(3'h4):(2'h3)]),
              (8'hb3)});
          if ($signed($signed(reg74)))
            begin
              reg105 <= ((wire85[(4'h9):(3'h4)] > (({reg112, reg103} ?
                      (reg72 | reg93) : (reg94 >= (8'haa))) ?
                  reg110 : {(8'ha9),
                      wire68})) <= $unsigned($signed(((reg107 > wire66) ?
                  reg90[(3'h6):(2'h2)] : reg113[(1'h0):(1'h0)]))));
              reg106 <= $signed($signed(reg107[(2'h3):(2'h2)]));
            end
          else
            begin
              reg105 <= ($signed({$unsigned(wire102),
                  (~((8'hac) > reg105))}) >= ((~$unsigned((wire65 << wire68))) ?
                  (wire83 ?
                      (~&{reg112}) : (~|$signed(reg107))) : $unsigned(($unsigned(reg77) ?
                      (reg79 ? wire98 : reg109) : (~reg110)))));
              reg106 <= {(~&(8'ha4))};
            end
        end
      reg114 <= $signed($signed(wire97[(3'h7):(1'h1)]));
      if (wire102)
        begin
          reg115 <= $signed($unsigned($unsigned((^~(reg105 > reg114)))));
        end
      else
        begin
          reg115 <= $signed($signed(reg88));
          reg116 <= $unsigned((-(8'hba)));
        end
    end
  assign wire117 = reg87;
  assign wire118 = (-$signed(wire81));
endmodule
