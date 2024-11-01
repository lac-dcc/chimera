module top
#(parameter param203 = (|({(~&((8'ha4) | (8'h9d))), (&(~&(8'hbb)))} < (~((~|(8'hbe)) >>> (~|(8'hb5)))))), 
parameter param204 = (!((~|(~^((8'haf) ? param203 : param203))) << ((~|((8'hb1) ? param203 : (8'hb5))) ? ((param203 && param203) >= ((8'ha3) ? param203 : param203)) : (^~(7'h42))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h2a9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire4;
  wire [(4'hd):(1'h0)] wire202;
  wire [(5'h10):(1'h0)] wire200;
  wire signed [(3'h4):(1'h0)] wire199;
  wire [(5'h11):(1'h0)] wire180;
  wire signed [(5'h11):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire8;
  wire [(4'h8):(1'h0)] wire12;
  wire signed [(4'hc):(1'h0)] wire13;
  wire [(3'h4):(1'h0)] wire14;
  wire [(4'h9):(1'h0)] wire15;
  wire [(2'h3):(1'h0)] wire25;
  wire [(5'h11):(1'h0)] wire165;
  wire [(5'h10):(1'h0)] wire176;
  wire [(5'h10):(1'h0)] wire177;
  wire [(4'hd):(1'h0)] wire178;
  reg [(3'h4):(1'h0)] reg24 = (1'h0);
  reg [(5'h10):(1'h0)] reg23 = (1'h0);
  reg [(5'h14):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg20 = (1'h0);
  reg [(3'h4):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg17 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg11 = (1'h0);
  reg [(4'he):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg167 = (1'h0);
  reg [(4'hc):(1'h0)] reg168 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg169 = (1'h0);
  reg [(5'h15):(1'h0)] reg170 = (1'h0);
  reg [(4'h9):(1'h0)] reg171 = (1'h0);
  reg [(4'h9):(1'h0)] reg172 = (1'h0);
  reg [(5'h15):(1'h0)] reg173 = (1'h0);
  reg signed [(4'he):(1'h0)] reg174 = (1'h0);
  reg [(4'hd):(1'h0)] reg175 = (1'h0);
  reg [(3'h5):(1'h0)] reg181 = (1'h0);
  reg [(4'hd):(1'h0)] reg182 = (1'h0);
  reg [(5'h12):(1'h0)] reg183 = (1'h0);
  reg [(3'h7):(1'h0)] reg184 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg185 = (1'h0);
  reg [(2'h3):(1'h0)] reg186 = (1'h0);
  reg [(3'h7):(1'h0)] reg187 = (1'h0);
  reg [(4'hc):(1'h0)] reg188 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg189 = (1'h0);
  reg [(4'h8):(1'h0)] reg190 = (1'h0);
  reg [(4'hd):(1'h0)] reg191 = (1'h0);
  reg [(4'hd):(1'h0)] reg192 = (1'h0);
  reg [(5'h12):(1'h0)] reg193 = (1'h0);
  reg [(2'h3):(1'h0)] reg194 = (1'h0);
  reg [(5'h14):(1'h0)] reg195 = (1'h0);
  reg [(5'h13):(1'h0)] reg196 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg197 = (1'h0);
  reg [(5'h15):(1'h0)] reg198 = (1'h0);
  assign y = {wire202,
                 wire200,
                 wire199,
                 wire180,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire25,
                 wire165,
                 wire176,
                 wire177,
                 wire178,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg11,
                 reg10,
                 reg9,
                 reg167,
                 reg168,
                 reg169,
                 reg170,
                 reg171,
                 reg172,
                 reg173,
                 reg174,
                 reg175,
                 reg181,
                 reg182,
                 reg183,
                 reg184,
                 reg185,
                 reg186,
                 reg187,
                 reg188,
                 reg189,
                 reg190,
                 reg191,
                 reg192,
                 reg193,
                 reg194,
                 reg195,
                 reg196,
                 reg197,
                 reg198,
                 (1'h0)};
  assign wire5 = wire4;
  assign wire6 = wire0[(3'h6):(1'h0)];
  assign wire7 = $unsigned(((((|(7'h42)) >>> (wire6 ? wire1 : wire5)) ?
                     $unsigned(wire2[(2'h2):(2'h2)]) : (((8'hbf) | wire6) ~^ (+wire6))) | wire0));
  assign wire8 = $signed($signed((7'h41)));
  always
    @(posedge clk) begin
      reg9 <= (wire0[(4'ha):(2'h3)] ?
          (((wire7 - wire3[(4'ha):(4'ha)]) + (wire2[(3'h5):(1'h0)] ?
                  wire3[(4'h9):(4'h9)] : (|wire6))) ?
              (~$signed(wire7[(2'h2):(2'h2)])) : (($unsigned(wire3) ?
                  (wire1 < wire0) : (wire6 ?
                      wire5 : wire3)) < wire1[(3'h5):(1'h0)])) : ($unsigned(wire5) ?
              $signed($unsigned($unsigned(wire0))) : wire7));
      reg10 <= reg9[(3'h5):(3'h5)];
      reg11 <= wire1;
    end
  assign wire12 = $signed(reg11[(4'hc):(3'h4)]);
  assign wire13 = wire4;
  assign wire14 = $signed(wire4);
  assign wire15 = $signed($signed((reg10 && (^~reg10))));
  always
    @(posedge clk) begin
      reg16 <= wire0;
      reg17 <= wire8;
      reg18 <= wire8;
      if (($signed($unsigned(($unsigned(wire3) ? (reg11 * wire5) : {reg17}))) ?
          {(~|(7'h40))} : (|(~^wire15[(2'h2):(1'h0)]))))
        begin
          reg19 <= ($signed($signed($unsigned((wire14 ? reg16 : wire7)))) ?
              wire0[(5'h13):(3'h7)] : ((|$signed((reg18 ? wire5 : (8'ha6)))) ?
                  wire2[(5'h13):(2'h2)] : (wire3[(4'h9):(3'h6)] ?
                      $unsigned(wire13) : wire13)));
          if ($unsigned((($unsigned((+wire8)) ?
              ((^~reg11) >> $unsigned(wire8)) : $signed(wire3[(4'h9):(3'h4)])) >> (~(^~$signed(wire4))))))
            begin
              reg20 <= (7'h44);
              reg21 <= wire3;
              reg22 <= reg11[(3'h6):(2'h2)];
              reg23 <= wire1;
            end
          else
            begin
              reg20 <= (reg22 ?
                  {$unsigned(wire8),
                      reg10[(1'h1):(1'h1)]} : wire6[(4'ha):(4'ha)]);
              reg21 <= (($unsigned({$unsigned(reg17)}) ?
                  ($signed($signed(reg18)) == ($signed(wire8) - {wire3,
                      wire15})) : (reg19 ~^ reg19[(2'h2):(1'h0)])) * reg23);
              reg22 <= (($unsigned($unsigned((wire3 ?
                  wire4 : reg11))) >> $unsigned(reg21[(4'hc):(4'h9)])) | wire12);
            end
        end
      else
        begin
          reg19 <= $signed($unsigned(reg10));
        end
      reg24 <= (((&$unsigned((wire7 - (8'hb4)))) * ((7'h43) >= wire7[(1'h0):(1'h0)])) >> ((+wire5[(4'hb):(3'h6)]) >= $unsigned((reg9[(2'h3):(1'h0)] ?
          (wire12 | wire2) : (reg20 ? reg23 : wire12)))));
    end
  assign wire25 = (reg21 << $signed((~&wire12)));
  module26 #() modinst166 (.y(wire165), .wire27(wire15), .wire30(reg9), .wire29(reg22), .wire31(reg23), .clk(clk), .wire28(wire7));
  always
    @(posedge clk) begin
      if ({(($unsigned((wire25 & wire0)) ?
                  reg16[(4'h8):(2'h3)] : ($signed(wire4) ?
                      $signed(wire165) : {reg10})) ?
              $unsigned(((&reg11) + {wire14, wire6})) : ($signed((reg19 ?
                      (8'h9d) : wire15)) ?
                  (+{wire2}) : reg11[(3'h4):(2'h2)]))})
        begin
          reg167 <= ((^~({{reg9}} <= ($unsigned(wire7) > (+wire6)))) ?
              (+$signed((7'h40))) : {$signed(({wire6, reg20} ?
                      {(7'h42), reg9} : wire15[(3'h7):(2'h2)])),
                  (8'hae)});
        end
      else
        begin
          reg167 <= (reg24 ?
              wire13 : $signed($unsigned($signed(reg21[(4'hb):(2'h3)]))));
          reg168 <= wire5;
        end
      reg169 <= $signed($unsigned(reg167));
      if ($unsigned((~&$signed(reg24))))
        begin
          reg170 <= ($unsigned((($signed(wire13) > (~^reg22)) & reg10[(2'h2):(1'h0)])) | (~(-$signed((!wire3)))));
          if ((($unsigned(((&wire13) ?
                  $unsigned(wire13) : ((8'hb0) ?
                      (7'h41) : wire6))) != (wire5 ^ {reg23})) ?
              $unsigned({(~|(wire165 ? (8'ha8) : reg10)),
                  (((8'hbc) ? reg168 : wire12) ?
                      $signed(wire6) : $signed(reg169))}) : ($unsigned($unsigned((wire6 - wire14))) ?
                  (|$unsigned(((8'ha1) ?
                      reg18 : wire15))) : reg20[(1'h0):(1'h0)])))
            begin
              reg171 <= ((8'hab) ?
                  $unsigned($signed(($unsigned(reg18) != (reg9 << reg18)))) : wire1[(4'he):(3'h4)]);
              reg172 <= (({(wire12[(3'h7):(3'h6)] ?
                              (~reg18) : wire165[(4'hf):(4'ha)])} ?
                      $signed(($unsigned(wire15) - (wire3 * reg167))) : (+(^reg168))) ?
                  $unsigned(wire2[(1'h0):(1'h0)]) : wire12);
            end
          else
            begin
              reg171 <= $unsigned($signed((wire14[(3'h4):(2'h2)] ?
                  $unsigned(reg167) : (8'ha5))));
            end
          reg173 <= $unsigned((|wire2));
          reg174 <= $signed(($unsigned($unsigned((wire25 <= reg18))) ?
              (($signed(reg16) ? (reg23 + reg16) : wire13) ?
                  reg22 : ($unsigned(wire2) ?
                      (reg169 ? (7'h43) : reg168) : (wire2 ?
                          reg17 : reg21))) : (8'h9d)));
          reg175 <= (8'hb3);
        end
      else
        begin
          reg170 <= (wire0[(3'h6):(3'h5)] ?
              ((&$signed((+reg174))) ? reg170 : wire8) : (~&$signed(reg17)));
          if (reg19)
            begin
              reg171 <= reg10;
              reg172 <= wire1[(4'h9):(3'h5)];
              reg173 <= (((-($signed(reg172) ?
                      {wire7, wire5} : {reg18, reg172})) ?
                  (&wire15[(1'h0):(1'h0)]) : reg18[(3'h5):(1'h1)]) << {($unsigned($unsigned(reg171)) ?
                      reg10 : reg171),
                  $unsigned($unsigned((reg11 ? wire6 : wire12)))});
              reg174 <= wire4[(3'h4):(1'h0)];
            end
          else
            begin
              reg171 <= (^~(($signed(reg20) ?
                      $unsigned($signed(wire12)) : $unsigned($signed(wire25))) ?
                  ((&reg173[(4'ha):(2'h2)]) ?
                      wire2[(4'h8):(1'h1)] : (|wire13)) : $signed((reg172[(2'h2):(1'h0)] ?
                      ((8'hb0) >>> reg167) : reg16))));
              reg172 <= $unsigned({{$signed($signed(wire14)),
                      reg174[(4'hd):(4'ha)]},
                  (-(wire4 ? {reg22, (8'ha5)} : (wire14 ? reg16 : reg18)))});
              reg173 <= ($signed($unsigned(reg9[(4'ha):(3'h5)])) ?
                  (reg19[(1'h1):(1'h1)] ?
                      wire12[(2'h2):(1'h0)] : reg171[(4'h9):(3'h4)]) : $signed(($signed((~wire14)) ?
                      reg10 : $signed((reg167 >>> reg11)))));
              reg174 <= (&$unsigned(wire5));
            end
        end
    end
  assign wire176 = $unsigned((|((reg168 ?
                       ((7'h42) ?
                           wire15 : (8'hb6)) : wire3) > (reg20 ~^ (!wire2)))));
  assign wire177 = {$signed((+(~^(wire14 ? reg24 : wire4)))),
                       (reg20 <<< $signed((8'haf)))};
  module141 #() modinst179 (.clk(clk), .wire145(reg170), .wire143(reg9), .wire142(wire2), .wire146(reg10), .wire144(reg171), .y(wire178));
  assign wire180 = (($unsigned((~&$signed((8'hbf)))) | wire178) <= $unsigned(reg172[(3'h4):(1'h1)]));
  always
    @(posedge clk) begin
      if (($signed(reg22[(1'h0):(1'h0)]) ^ (wire25[(1'h1):(1'h0)] ~^ $signed(((+reg22) & {wire12,
          wire8})))))
        begin
          if (((+reg10[(3'h6):(3'h4)]) ?
              (-{({(7'h44)} || (wire12 | wire3))}) : $signed((wire2 ?
                  ({wire5} - reg174[(1'h1):(1'h1)]) : wire176))))
            begin
              reg181 <= wire177;
              reg182 <= ((|{wire5}) >>> (~&$signed(reg20)));
            end
          else
            begin
              reg181 <= ((+$signed(((|reg173) != (wire7 ?
                  reg11 : wire5)))) <= $signed((($unsigned((8'ha2)) >>> {reg17}) - ((wire5 ?
                  wire8 : reg10) <<< {(8'h9e)}))));
              reg182 <= reg168[(4'h8):(1'h0)];
              reg183 <= {($signed((wire8 ? $unsigned(reg181) : (~reg16))) ?
                      reg173 : (($signed((8'ha7)) | wire2[(5'h10):(4'hd)]) ?
                          wire2 : (~{reg169}))),
                  (wire177[(4'h9):(3'h5)] * reg21)};
            end
          reg184 <= (((-wire8[(3'h7):(1'h0)]) ?
              $signed(($signed((8'hbe)) ?
                  $unsigned(reg172) : {reg11,
                      wire12})) : $signed((wire176 * $unsigned((8'h9e))))) < reg175[(4'h9):(4'h9)]);
        end
      else
        begin
          reg181 <= reg19;
          reg182 <= (reg173[(3'h7):(1'h1)] ?
              (8'h9d) : (|(wire12 <<< (~|reg172[(2'h2):(1'h1)]))));
          reg183 <= (+(|$signed(wire177)));
          reg184 <= (($unsigned(((^~reg16) || $unsigned(wire177))) ?
              reg168 : $signed(reg169)) != (reg168[(3'h5):(1'h0)] ?
              (+reg18[(1'h1):(1'h1)]) : reg11[(4'hb):(3'h4)]));
          if ((~^((reg11 ?
              (~$unsigned(reg20)) : (((8'h9c) ? reg22 : reg11) ?
                  $unsigned(wire25) : (~^reg173))) >>> {reg170[(4'hf):(4'h9)]})))
            begin
              reg185 <= $signed(wire3);
              reg186 <= reg181[(1'h1):(1'h1)];
              reg187 <= $signed(reg173[(1'h1):(1'h0)]);
              reg188 <= ($unsigned(wire4[(5'h13):(4'h8)]) ?
                  (8'h9d) : $unsigned((((reg18 >= wire3) && (^~wire1)) ?
                      (^~$unsigned(wire2)) : $unsigned((+reg172)))));
            end
          else
            begin
              reg185 <= wire165;
            end
        end
      reg189 <= (&(+$signed(reg173)));
      if (({(~{wire176[(3'h4):(2'h3)], (|wire8)})} ?
          reg188[(2'h3):(1'h0)] : reg187))
        begin
          reg190 <= (8'ha5);
          reg191 <= {reg175, $unsigned((^~$signed(reg19[(3'h4):(1'h0)])))};
          reg192 <= ({(~$unsigned(wire1[(2'h2):(1'h1)])),
                  ($signed((reg9 == reg175)) ^~ wire6[(4'h9):(3'h6)])} ?
              (((reg189[(3'h4):(3'h4)] || {wire5,
                      wire25}) != $unsigned($unsigned(reg170))) ?
                  $signed({((8'hb3) ? wire176 : reg22),
                      {(8'h9c),
                          reg170}}) : $unsigned(reg17)) : reg186[(2'h3):(2'h2)]);
        end
      else
        begin
          if ((wire14 >= wire14))
            begin
              reg190 <= $unsigned(reg171[(3'h6):(3'h4)]);
              reg191 <= reg187[(3'h5):(3'h4)];
              reg192 <= wire176;
            end
          else
            begin
              reg190 <= $unsigned({reg23, (-wire4)});
              reg191 <= $signed($signed(reg23[(4'hc):(3'h4)]));
              reg192 <= ((8'h9e) && $unsigned(reg172));
            end
          if (({$unsigned({wire180[(4'hf):(3'h5)]}),
              (|$signed($signed(wire8)))} <<< reg16))
            begin
              reg193 <= ((-reg10) ?
                  reg19 : $unsigned(($unsigned($signed(reg20)) ^ $unsigned($unsigned(wire4)))));
              reg194 <= {{(reg18[(3'h5):(2'h3)] ^ ($unsigned(reg185) ?
                          reg188[(1'h0):(1'h0)] : $signed(reg18))),
                      (reg184[(3'h6):(2'h2)] ?
                          $unsigned($signed(wire4)) : reg18[(3'h5):(3'h5)])}};
              reg195 <= $signed(reg191[(3'h6):(2'h3)]);
              reg196 <= $unsigned((^wire177));
            end
          else
            begin
              reg193 <= reg182;
            end
          reg197 <= reg16[(3'h4):(2'h3)];
        end
      reg198 <= reg182[(3'h4):(1'h0)];
    end
  assign wire199 = reg23;
  module26 #() modinst201 (wire200, clk, reg192, reg183, reg195, reg173, reg167);
  assign wire202 = (~^$unsigned($signed((~(+wire7)))));
endmodule

module module26  (y, clk, wire31, wire30, wire29, wire28, wire27);
  output wire [(32'hf6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire31;
  input wire signed [(5'h12):(1'h0)] wire30;
  input wire signed [(5'h14):(1'h0)] wire29;
  input wire signed [(5'h15):(1'h0)] wire28;
  input wire [(4'h9):(1'h0)] wire27;
  wire [(4'h9):(1'h0)] wire163;
  wire signed [(5'h11):(1'h0)] wire140;
  wire [(2'h2):(1'h0)] wire139;
  wire signed [(3'h4):(1'h0)] wire138;
  wire signed [(4'hf):(1'h0)] wire136;
  wire signed [(5'h15):(1'h0)] wire85;
  wire [(4'hc):(1'h0)] wire84;
  wire signed [(5'h15):(1'h0)] wire83;
  wire [(4'hd):(1'h0)] wire82;
  wire signed [(4'he):(1'h0)] wire81;
  wire [(4'ha):(1'h0)] wire63;
  wire signed [(4'hf):(1'h0)] wire34;
  wire signed [(5'h11):(1'h0)] wire33;
  wire [(5'h15):(1'h0)] wire32;
  wire signed [(5'h12):(1'h0)] wire65;
  wire [(4'ha):(1'h0)] wire66;
  wire signed [(3'h5):(1'h0)] wire79;
  reg signed [(5'h15):(1'h0)] reg86 = (1'h0);
  assign y = {wire163,
                 wire140,
                 wire139,
                 wire138,
                 wire136,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire63,
                 wire34,
                 wire33,
                 wire32,
                 wire65,
                 wire66,
                 wire79,
                 reg86,
                 (1'h0)};
  assign wire32 = wire27;
  assign wire33 = $unsigned({($signed($unsigned(wire29)) ?
                          {(wire28 ?
                                  (8'had) : wire31)} : $signed($signed(wire29))),
                      $unsigned(wire31[(4'h8):(4'h8)])});
  assign wire34 = wire33[(3'h4):(3'h4)];
  module35 #() modinst64 (.wire40(wire32), .wire36(wire31), .wire38(wire33), .wire37(wire30), .y(wire63), .clk(clk), .wire39(wire29));
  assign wire65 = (wire32[(3'h5):(1'h0)] >> (((!$signed(wire28)) || wire27[(4'h9):(1'h1)]) >> wire28[(4'hf):(4'hd)]));
  assign wire66 = $unsigned($signed({$unsigned(wire31[(1'h0):(1'h0)]),
                      $signed(wire29[(5'h11):(4'hf)])}));
  module67 #() modinst80 (wire79, clk, wire32, wire33, wire65, wire34, wire28);
  assign wire81 = {(~(~^wire79))};
  assign wire82 = ($signed($signed($signed((|wire31)))) ?
                      (($signed($signed(wire28)) ~^ (wire34 ?
                              {wire31, wire63} : wire28)) ?
                          ((^~wire30[(4'h9):(2'h3)]) == wire30[(2'h3):(2'h3)]) : (-$signed(((8'hbd) ?
                              wire30 : (8'h9e))))) : ($unsigned(((wire34 ?
                              wire66 : wire33) ^~ wire30[(4'hf):(4'he)])) ?
                          wire32 : ((7'h40) >> $unsigned(wire32))));
  assign wire83 = wire32;
  assign wire84 = ((((((8'hae) ? wire30 : wire65) & (wire31 * wire31)) ?
                      $signed($signed(wire83)) : $signed((wire82 ?
                          (8'ha7) : wire66))) >= ($signed((wire34 ?
                      wire82 : wire83)) << wire28[(3'h5):(1'h1)])) - ({$unsigned({wire27,
                              wire28}),
                          wire32} ?
                      wire79[(2'h3):(2'h2)] : ((~wire30) <= wire83[(1'h1):(1'h1)])));
  assign wire85 = (((&({wire30, wire28} != wire33)) ?
                          (!wire30) : $signed((^~wire84))) ?
                      ({$signed((-wire84)),
                          (~&(~&wire28))} > {wire30[(3'h7):(1'h0)],
                          $signed(wire83)}) : $signed($unsigned((wire29 ?
                          (wire83 ?
                              wire83 : wire27) : wire66[(4'h8):(3'h7)]))));
  always
    @(posedge clk) begin
      reg86 <= ({$signed($unsigned({wire82})),
              ((|(wire85 ^ (8'ha2))) + wire84[(3'h7):(1'h1)])} ?
          $unsigned(wire84) : wire31);
    end
  module87 #() modinst137 (.wire92(wire66), .wire89(wire81), .wire91(reg86), .wire88(wire32), .wire90(wire30), .y(wire136), .clk(clk));
  assign wire138 = ((!(({wire79, wire79} ? {wire83} : (^wire84)) || (((8'ha4) ?
                       wire65 : wire81) + (^~(8'hb7))))) != $signed({{(wire79 ~^ wire29),
                           (wire84 <<< wire83)}}));
  assign wire139 = (+{wire28[(4'hc):(1'h0)], (+{$signed(wire82)})});
  assign wire140 = $unsigned($signed((^~($unsigned(wire85) ?
                       (~wire82) : $signed(wire84)))));
  module141 #() modinst164 (.clk(clk), .wire145(reg86), .wire146(wire85), .wire143(wire32), .wire142(wire82), .y(wire163), .wire144(wire27));
endmodule

module module141
#(parameter param161 = (((((^(8'ha8)) >>> ((8'h9d) * (8'ha6))) ? (^~((8'hb7) ? (8'hb3) : (8'hb3))) : (((8'hb7) ? (8'hb9) : (7'h43)) ? (^(8'h9d)) : ((8'hab) <<< (8'hb7)))) & (~&(((8'hbe) ? (8'hbc) : (8'hb5)) >> ((7'h42) ? (8'hb6) : (8'hb2))))) ^~ (((((7'h44) ^ (8'haa)) ? (~^(7'h42)) : {(8'h9d)}) - (((7'h43) && (8'h9c)) ? ((7'h44) & (8'hb7)) : ((8'hbe) | (8'hbd)))) ? ((((7'h40) ? (8'hbb) : (8'hab)) >>> ((8'hb7) <<< (8'hb5))) ? {((8'ha6) | (8'ha2)), ((8'had) == (8'hac))} : ((~&(8'hbb)) ~^ ((8'ha9) != (8'hba)))) : (~|(((8'h9f) <<< (8'ha3)) > ((8'ha5) ? (8'h9d) : (8'h9d)))))), 
parameter param162 = (param161 ? {(((param161 ? param161 : param161) ? (+param161) : ((8'hb1) ? param161 : param161)) ? (^~param161) : param161), param161} : {(~^param161)}))
(y, clk, wire146, wire145, wire144, wire143, wire142);
  output wire [(32'h9f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire146;
  input wire [(5'h15):(1'h0)] wire145;
  input wire [(2'h3):(1'h0)] wire144;
  input wire signed [(5'h15):(1'h0)] wire143;
  input wire [(2'h3):(1'h0)] wire142;
  wire [(3'h5):(1'h0)] wire160;
  wire [(4'hc):(1'h0)] wire159;
  wire signed [(5'h12):(1'h0)] wire158;
  wire [(5'h10):(1'h0)] wire157;
  wire [(3'h4):(1'h0)] wire156;
  wire [(2'h3):(1'h0)] wire155;
  wire signed [(5'h14):(1'h0)] wire152;
  wire signed [(4'he):(1'h0)] wire151;
  wire [(4'ha):(1'h0)] wire150;
  wire [(3'h7):(1'h0)] wire149;
  wire signed [(5'h14):(1'h0)] wire148;
  wire signed [(2'h3):(1'h0)] wire147;
  reg signed [(3'h5):(1'h0)] reg154 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg153 = (1'h0);
  assign y = {wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 reg154,
                 reg153,
                 (1'h0)};
  assign wire147 = (((wire145[(2'h2):(1'h0)] - ($signed((8'hba)) ?
                       (wire143 ?
                           (8'hb2) : wire145) : $unsigned(wire146))) * (-$signed($unsigned(wire146)))) * $unsigned({(8'hb4),
                       (wire143 ?
                           wire144[(1'h1):(1'h0)] : ((7'h42) ?
                               wire143 : wire144))}));
  assign wire148 = (8'h9e);
  assign wire149 = $signed($unsigned((~|wire143[(5'h15):(3'h4)])));
  assign wire150 = wire143;
  assign wire151 = $signed(wire145[(4'hb):(2'h2)]);
  assign wire152 = wire146[(4'hb):(4'hb)];
  always
    @(posedge clk) begin
      reg153 <= {(!wire145[(4'hb):(4'h9)]),
          $signed(($unsigned($signed(wire151)) ?
              (~^(wire143 ^ (8'hb8))) : wire145))};
      reg154 <= {({wire152, ((|wire151) < (~wire146))} | (|wire146))};
    end
  assign wire155 = (($unsigned(((wire152 ?
                           wire151 : reg154) >= (reg153 ^~ wire151))) ?
                       (|wire142) : wire145[(5'h13):(4'he)]) >> wire142[(2'h2):(1'h1)]);
  assign wire156 = ((~^(-wire142)) > (|wire146));
  assign wire157 = $unsigned($signed(({$signed(wire146),
                       wire142} >>> (~&wire144[(1'h1):(1'h1)]))));
  assign wire158 = $signed(((8'hb0) & $signed(wire157)));
  assign wire159 = $signed((~|{wire147}));
  assign wire160 = wire146;
endmodule

module module87  (y, clk, wire92, wire91, wire90, wire89, wire88);
  output wire [(32'h1e1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire92;
  input wire signed [(3'h4):(1'h0)] wire91;
  input wire signed [(4'hf):(1'h0)] wire90;
  input wire signed [(4'he):(1'h0)] wire89;
  input wire signed [(5'h12):(1'h0)] wire88;
  wire signed [(4'ha):(1'h0)] wire135;
  wire [(2'h3):(1'h0)] wire134;
  wire [(4'ha):(1'h0)] wire128;
  wire [(4'ha):(1'h0)] wire126;
  wire signed [(4'hc):(1'h0)] wire114;
  wire signed [(4'hb):(1'h0)] wire113;
  wire signed [(5'h11):(1'h0)] wire112;
  wire [(5'h11):(1'h0)] wire111;
  wire [(4'hf):(1'h0)] wire94;
  wire signed [(4'hf):(1'h0)] wire93;
  reg signed [(3'h6):(1'h0)] reg133 = (1'h0);
  reg [(5'h11):(1'h0)] reg132 = (1'h0);
  reg [(3'h6):(1'h0)] reg131 = (1'h0);
  reg [(2'h2):(1'h0)] reg130 = (1'h0);
  reg [(5'h12):(1'h0)] reg129 = (1'h0);
  reg signed [(4'he):(1'h0)] reg127 = (1'h0);
  reg [(4'ha):(1'h0)] reg125 = (1'h0);
  reg [(5'h15):(1'h0)] reg124 = (1'h0);
  reg [(4'ha):(1'h0)] reg123 = (1'h0);
  reg [(5'h11):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg121 = (1'h0);
  reg [(3'h4):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg119 = (1'h0);
  reg [(4'he):(1'h0)] reg118 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg116 = (1'h0);
  reg [(3'h6):(1'h0)] reg115 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg107 = (1'h0);
  reg [(5'h14):(1'h0)] reg106 = (1'h0);
  reg [(4'h9):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg104 = (1'h0);
  reg signed [(4'he):(1'h0)] reg103 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg102 = (1'h0);
  reg [(5'h11):(1'h0)] reg101 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg99 = (1'h0);
  reg [(2'h2):(1'h0)] reg98 = (1'h0);
  reg [(4'he):(1'h0)] reg97 = (1'h0);
  reg [(4'hb):(1'h0)] reg96 = (1'h0);
  reg [(4'h9):(1'h0)] reg95 = (1'h0);
  assign y = {wire135,
                 wire134,
                 wire128,
                 wire126,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire94,
                 wire93,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg127,
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
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 (1'h0)};
  assign wire93 = {wire90, wire90};
  assign wire94 = wire93;
  always
    @(posedge clk) begin
      reg95 <= (wire88 ?
          $signed($signed(wire91)) : (((-(wire94 ? wire89 : (8'hb0))) ?
              $unsigned($unsigned(wire91)) : $signed($unsigned(wire89))) * wire91[(2'h2):(1'h0)]));
      if ($unsigned(($unsigned(($unsigned(wire92) ~^ (8'hb2))) <<< $signed(wire93[(2'h3):(1'h1)]))))
        begin
          reg96 <= $unsigned(($signed($unsigned(wire90)) ?
              wire93[(4'ha):(4'ha)] : $signed((wire94 ?
                  {wire94, wire93} : wire89))));
          reg97 <= (8'ha9);
          reg98 <= ((!(($signed(wire92) ^~ (reg95 ? wire88 : wire88)) ?
                  $unsigned((~^(8'ha2))) : reg95)) ?
              (-wire93[(3'h4):(1'h1)]) : {$signed($unsigned((-wire91)))});
          reg99 <= wire90[(1'h0):(1'h0)];
          reg100 <= (^~((wire94 ^ $signed({(8'ha0)})) ?
              (~$signed($unsigned((7'h40)))) : {wire89}));
        end
      else
        begin
          if (wire91[(1'h0):(1'h0)])
            begin
              reg96 <= wire92[(1'h1):(1'h1)];
              reg97 <= (^~(|(+({reg100, reg99} ?
                  {reg98, reg96} : (reg96 == reg97)))));
              reg98 <= (^~((^reg96[(3'h6):(2'h3)]) ?
                  (^reg95[(2'h2):(1'h1)]) : (^($signed(wire91) ?
                      $unsigned(wire93) : $unsigned((7'h40))))));
            end
          else
            begin
              reg96 <= (^~reg99);
            end
          reg99 <= wire93;
          reg100 <= (!(8'ha3));
          reg101 <= (wire92[(3'h5):(2'h3)] >>> {(($signed(reg95) ?
                      (wire92 ? wire94 : (8'hb5)) : reg95) ?
                  $signed((~|(8'ha6))) : (8'ha0))});
        end
      if ((~|{$unsigned(wire93[(1'h1):(1'h0)]), $unsigned({{wire91, wire88}})}))
        begin
          reg102 <= reg96[(3'h6):(3'h6)];
          reg103 <= ($unsigned((~&$signed((reg100 >= (8'hb3))))) ?
              $unsigned({((wire92 >>> reg100) ?
                      $unsigned(wire91) : reg96[(2'h2):(2'h2)]),
                  $signed($unsigned(reg102))}) : $unsigned((((wire90 || wire89) ?
                  wire91[(1'h1):(1'h0)] : (&reg95)) & wire88)));
          if (wire94)
            begin
              reg104 <= (+(8'ha6));
              reg105 <= wire92;
            end
          else
            begin
              reg104 <= {{((&(~|wire90)) ~^ $signed((8'h9f))),
                      (-(~^(~^(8'haf))))},
                  reg97[(1'h1):(1'h1)]};
              reg105 <= (((+wire90) ?
                  wire91 : ($signed((reg99 && reg96)) ?
                      $signed($signed(reg96)) : wire88)) >> (~|(((^~wire90) <<< reg104) ?
                  {wire94[(2'h3):(1'h0)],
                      (reg104 ? (8'ha2) : wire90)} : $signed(reg99))));
              reg106 <= $signed($unsigned((~reg98)));
              reg107 <= (7'h44);
              reg108 <= $signed((((~(reg101 ?
                      reg107 : (7'h44))) < (~(reg102 <= reg107))) ?
                  $unsigned(((^~(8'haa)) + $signed((8'haf)))) : reg101));
            end
        end
      else
        begin
          reg102 <= $unsigned(((-(reg104[(1'h0):(1'h0)] ^ (reg106 << (8'hb0)))) ?
              wire93[(3'h4):(3'h4)] : reg95));
          if ($signed($unsigned($signed(((reg100 ?
              wire94 : reg98) < $signed((7'h43)))))))
            begin
              reg103 <= reg104;
              reg104 <= (&(~&($unsigned({wire93}) ?
                  wire88[(1'h0):(1'h0)] : (~^$unsigned(reg104)))));
              reg105 <= $signed($unsigned(reg105));
              reg106 <= wire91;
              reg107 <= reg106[(4'ha):(3'h4)];
            end
          else
            begin
              reg103 <= $unsigned((!(($unsigned(reg108) != reg97[(4'hb):(2'h2)]) ?
                  reg102[(1'h1):(1'h0)] : ((|reg104) ?
                      ((8'ha9) ~^ reg107) : {reg106}))));
              reg104 <= reg106[(5'h13):(1'h1)];
            end
          reg108 <= ((wire91[(3'h4):(2'h3)] < reg103) ?
              ((((|(8'hb4)) || (~|reg99)) ?
                  $signed((|wire88)) : (~^wire89[(3'h7):(1'h0)])) - (&reg98)) : ($unsigned(wire89) + {($unsigned(reg100) ?
                      (8'hb5) : (8'hbe))}));
          reg109 <= reg101;
          reg110 <= wire91[(2'h3):(2'h3)];
        end
    end
  assign wire111 = ($signed($signed($unsigned(reg101))) ?
                       wire88[(4'h9):(1'h1)] : $signed($signed($unsigned($signed(reg104)))));
  assign wire112 = reg97[(1'h1):(1'h1)];
  assign wire113 = (reg110 ?
                       reg108[(1'h1):(1'h1)] : ((reg98 >= $unsigned($signed(wire90))) | {(^wire91[(3'h4):(1'h1)]),
                           $signed((~&reg103))}));
  assign wire114 = wire113[(3'h5):(3'h5)];
  always
    @(posedge clk) begin
      if ($unsigned($signed((-($signed(reg103) ^~ reg99[(1'h0):(1'h0)])))))
        begin
          reg115 <= (~^reg105[(3'h7):(1'h0)]);
          reg116 <= (!(wire89 ?
              (~&reg97[(4'hb):(3'h6)]) : ($signed((reg96 | reg106)) < $signed((-wire113)))));
        end
      else
        begin
          reg115 <= $signed($signed(((!(wire92 ? (8'ha1) : (8'ha9))) ?
              reg95[(2'h2):(1'h0)] : (reg104 ? $unsigned(reg109) : wire93))));
          if ($signed(wire94[(4'he):(2'h3)]))
            begin
              reg116 <= wire89;
              reg117 <= reg115[(1'h1):(1'h0)];
              reg118 <= (reg105 ?
                  $signed(wire89[(4'hc):(4'hb)]) : {((reg110 - reg96[(3'h4):(1'h1)]) <<< $unsigned(reg96[(3'h6):(3'h4)])),
                      (wire92 + $unsigned({(8'ha5)}))});
              reg119 <= $signed(($signed($unsigned((^~wire88))) ?
                  reg116 : (reg110 ?
                      reg105 : ($unsigned(reg97) ?
                          (reg99 ? reg99 : reg102) : $unsigned(reg105)))));
              reg120 <= reg118[(4'h8):(1'h1)];
            end
          else
            begin
              reg116 <= ({$unsigned((^(reg109 ?
                      wire90 : reg117)))} <= ({($unsigned(wire92) || wire112)} | reg108));
              reg117 <= ($unsigned($signed(((+(8'ha9)) ?
                  ((8'ha6) ?
                      reg119 : reg101) : (reg116 << reg105)))) || wire90);
            end
          reg121 <= reg102;
        end
      if (($signed(($signed({wire92, wire89}) ?
          reg103[(4'hb):(3'h7)] : reg118)) < ((reg119[(4'hf):(4'he)] ?
              (~((8'h9f) ? (8'hb6) : wire112)) : wire111) ?
          ($signed(reg117[(3'h5):(3'h5)]) ? wire89 : (^~{reg96})) : reg98)))
        begin
          reg122 <= (wire114[(4'hc):(3'h7)] ?
              (wire111 <= (reg119[(5'h10):(1'h0)] ?
                  ((wire113 | (8'hb0)) ?
                      reg109 : (reg98 ?
                          reg96 : reg96)) : wire112[(4'h8):(3'h4)])) : {wire93[(1'h0):(1'h0)]});
          reg123 <= $unsigned(reg98);
          reg124 <= (($unsigned(($signed(reg123) <<< (&reg95))) == reg105) >> (!(wire92[(4'h9):(1'h0)] ?
              (~&(wire113 ? wire90 : reg118)) : $unsigned(reg104))));
        end
      else
        begin
          if ((8'h9d))
            begin
              reg122 <= (-({$signed(((8'hb5) ? reg99 : (8'had)))} ?
                  (wire92[(2'h2):(1'h1)] >= (((8'hb1) ?
                      reg102 : reg101) == (-wire90))) : wire94));
              reg123 <= $signed($unsigned(reg109[(2'h3):(1'h0)]));
              reg124 <= ($unsigned(reg119[(4'hb):(2'h3)]) > (reg105 <<< ($unsigned($unsigned(reg117)) | reg123)));
            end
          else
            begin
              reg122 <= $signed((^~($signed((reg110 * wire113)) && {{wire112}})));
            end
          reg125 <= wire114[(3'h4):(1'h1)];
        end
    end
  assign wire126 = $signed(($signed((&{wire111, wire91})) ?
                       (reg117[(2'h2):(1'h1)] ^ reg104) : $signed(reg120[(3'h4):(1'h1)])));
  always
    @(posedge clk) begin
      reg127 <= (&(-(+(reg117 >>> reg95))));
    end
  assign wire128 = $signed($unsigned({(reg97[(2'h2):(2'h2)] ~^ reg105[(2'h2):(1'h1)])}));
  always
    @(posedge clk) begin
      reg129 <= (~$signed((reg115[(2'h3):(2'h2)] ?
          (8'haf) : ((reg95 != wire90) || $signed(reg109)))));
      reg130 <= $unsigned(wire128);
      reg131 <= $signed(wire112);
      reg132 <= reg99;
      reg133 <= $unsigned((~|$unsigned(reg101)));
    end
  assign wire134 = $unsigned($signed({reg120}));
  assign wire135 = reg103;
endmodule

module module67  (y, clk, wire72, wire71, wire70, wire69, wire68);
  output wire [(32'h2b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire72;
  input wire signed [(4'ha):(1'h0)] wire71;
  input wire [(5'h12):(1'h0)] wire70;
  input wire signed [(4'he):(1'h0)] wire69;
  input wire [(3'h6):(1'h0)] wire68;
  wire [(2'h3):(1'h0)] wire78;
  wire [(3'h6):(1'h0)] wire77;
  wire signed [(3'h4):(1'h0)] wire76;
  reg [(4'hc):(1'h0)] reg75 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg74 = (1'h0);
  reg signed [(4'he):(1'h0)] reg73 = (1'h0);
  assign y = {wire78, wire77, wire76, reg75, reg74, reg73, (1'h0)};
  always
    @(posedge clk) begin
      if ((&(wire70 ?
          $signed($signed((wire72 ?
              wire69 : wire70))) : ($signed(wire72[(5'h10):(3'h4)]) ?
              (~^$signed(wire72)) : {wire72, wire70}))))
        begin
          reg73 <= $signed((wire68[(3'h6):(3'h4)] ?
              $unsigned($signed(wire72)) : $signed(wire70[(4'hf):(4'hd)])));
          reg74 <= wire69[(4'ha):(4'h8)];
          reg75 <= (8'h9d);
        end
      else
        begin
          reg73 <= wire69;
          reg74 <= wire70[(1'h1):(1'h1)];
          reg75 <= reg73[(4'h8):(3'h5)];
        end
    end
  assign wire76 = reg74;
  assign wire77 = $unsigned(((-wire69[(4'hd):(3'h5)]) || {(wire72[(4'hc):(1'h0)] - wire68)}));
  assign wire78 = {($signed(((reg74 <<< reg74) ?
                          $signed(reg75) : (reg74 ?
                              wire76 : reg74))) << wire71[(4'h8):(3'h5)])};
endmodule

module module35  (y, clk, wire40, wire39, wire38, wire37, wire36);
  output wire [(32'hc6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire40;
  input wire signed [(5'h14):(1'h0)] wire39;
  input wire [(5'h11):(1'h0)] wire38;
  input wire signed [(5'h10):(1'h0)] wire37;
  input wire [(4'h8):(1'h0)] wire36;
  wire [(5'h13):(1'h0)] wire62;
  wire [(3'h4):(1'h0)] wire61;
  wire signed [(5'h10):(1'h0)] wire56;
  wire signed [(3'h7):(1'h0)] wire55;
  wire [(3'h6):(1'h0)] wire54;
  wire [(3'h5):(1'h0)] wire53;
  wire [(2'h3):(1'h0)] wire52;
  wire signed [(5'h12):(1'h0)] wire51;
  wire signed [(5'h10):(1'h0)] wire41;
  reg signed [(2'h3):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg58 = (1'h0);
  reg [(4'h8):(1'h0)] reg57 = (1'h0);
  reg [(4'h8):(1'h0)] reg50 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg49 = (1'h0);
  reg [(3'h6):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg47 = (1'h0);
  reg [(4'hc):(1'h0)] reg46 = (1'h0);
  reg [(2'h2):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg43 = (1'h0);
  reg [(2'h3):(1'h0)] reg42 = (1'h0);
  assign y = {wire62,
                 wire61,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire41,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 (1'h0)};
  assign wire41 = (^~(~(!(wire39[(5'h11):(2'h2)] ?
                      $unsigned((8'had)) : $unsigned(wire39)))));
  always
    @(posedge clk) begin
      if (((wire40[(2'h2):(1'h0)] ? (~|(!$unsigned(wire41))) : wire41) ?
          $unsigned((+$signed(wire39[(5'h12):(3'h6)]))) : $signed(wire38)))
        begin
          if ($unsigned({{((wire39 ? (8'hb1) : wire37) + wire39[(4'hd):(4'hd)]),
                  ($signed(wire40) ? {wire41, wire38} : wire36)},
              (8'ha0)}))
            begin
              reg42 <= (((((^~wire39) ?
                      $signed(wire36) : wire37[(2'h2):(1'h1)]) >= wire40) ?
                  wire37[(1'h0):(1'h0)] : ((~^{wire36}) && $signed((wire37 ?
                      wire41 : wire39)))) << ((|wire38[(3'h6):(1'h0)]) ?
                  {($signed((8'h9d)) ?
                          (wire40 <<< (8'hae)) : {wire41})} : ($unsigned((~&wire39)) ~^ wire39)));
              reg43 <= $unsigned(reg42);
              reg44 <= wire37;
              reg45 <= $signed({(8'hb3)});
              reg46 <= wire38[(3'h7):(3'h6)];
            end
          else
            begin
              reg42 <= reg42;
              reg43 <= $unsigned(({(~|$signed(wire38)),
                  wire40} >= $signed((((8'hb8) << wire39) && $unsigned(reg46)))));
              reg44 <= $signed(reg46);
            end
          reg47 <= wire40[(4'h8):(4'h8)];
          reg48 <= (reg47[(3'h5):(3'h5)] ?
              $signed((|$signed((&wire37)))) : reg46);
          reg49 <= (-(|({(^reg48), $signed(reg44)} ?
              ($unsigned(reg44) || wire36[(3'h6):(3'h6)]) : (|wire36))));
        end
      else
        begin
          reg42 <= (^~($unsigned(wire37) ? reg42 : reg46[(1'h0):(1'h0)]));
          reg43 <= (wire36 ?
              (wire38 >>> (~^wire36)) : ($signed($signed(((8'had) ?
                      wire37 : reg46))) ?
                  reg47[(1'h0):(1'h0)] : $unsigned($signed((~^wire39)))));
          reg44 <= $signed(wire38[(1'h0):(1'h0)]);
        end
      reg50 <= reg43;
    end
  assign wire51 = $signed((8'hbb));
  assign wire52 = ((wire41[(3'h5):(2'h3)] || wire37) * (($unsigned($signed((8'hb1))) + reg42) ?
                      (+($unsigned(reg46) ~^ wire51[(4'hd):(4'h8)])) : wire36));
  assign wire53 = {(-(^~$unsigned((reg50 ~^ reg43))))};
  assign wire54 = $unsigned($unsigned(wire51[(4'hf):(2'h3)]));
  assign wire55 = ($signed($signed((+$signed(wire41)))) ?
                      (reg45 || (($unsigned(reg42) * {(8'hbf)}) ?
                          reg43[(3'h4):(1'h0)] : (^$signed(wire51)))) : $unsigned((!reg42[(1'h0):(1'h0)])));
  assign wire56 = (($signed($signed($signed((8'hac)))) ?
                      $unsigned($signed($signed(wire38))) : (!wire55[(1'h0):(1'h0)])) & (&($unsigned((!wire39)) ?
                      wire40 : reg43[(2'h2):(2'h2)])));
  always
    @(posedge clk) begin
      if ((wire38 ? reg49 : {$signed(reg50[(2'h2):(1'h1)]), reg45}))
        begin
          reg57 <= wire40;
        end
      else
        begin
          reg57 <= reg44[(3'h4):(1'h0)];
          reg58 <= (+(|$signed($signed($unsigned(reg47)))));
          reg59 <= $unsigned((~|$signed($unsigned((reg42 ? wire39 : wire54)))));
          reg60 <= $signed(($unsigned($signed(wire39)) ?
              $unsigned($signed((^(8'hb9)))) : (!({reg58, wire52} ?
                  (~^(7'h40)) : $signed(reg58)))));
        end
    end
  assign wire61 = ({$signed((((8'hac) << wire53) ? reg43 : (&reg44))),
                          $unsigned($signed(((7'h43) ^~ wire40)))} ?
                      $unsigned($unsigned((8'hb0))) : ((~|$unsigned($signed(wire40))) ?
                          wire55 : reg44[(3'h7):(3'h6)]));
  assign wire62 = (!{($unsigned({wire38, reg57}) ?
                          $unsigned(wire39[(3'h4):(2'h2)]) : {(reg48 ?
                                  reg46 : (8'hab)),
                              $signed(wire36)}),
                      (((reg59 ? (8'h9c) : wire51) > {reg57}) ?
                          $signed($signed(reg49)) : $signed((^(8'hbc))))});
endmodule
