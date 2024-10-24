module top
#(parameter param89 = (((|(!(&(8'hba)))) ? {(((8'ha8) * (8'ha7)) ? ((8'had) ^~ (8'hb4)) : ((8'hb5) ? (7'h41) : (8'hb0))), ({(8'haf), (8'ha6)} ? (8'hbe) : (!(8'ha5)))} : (~^((^(8'hac)) ? (~(8'haa)) : {(7'h44), (8'hb5)}))) ? (+((((8'h9c) & (8'hac)) ? (+(8'hb3)) : (&(8'ha0))) >= {(7'h41), ((8'ha4) & (8'h9e))})) : {{(((8'hbc) < (8'had)) ^~ ((8'h9f) ? (8'had) : (7'h40))), (-(~(8'hb9)))}, ((~{(8'hb2), (8'hbc)}) * (8'ha9))}))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h113):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire4;
  wire [(5'h10):(1'h0)] wire88;
  wire [(5'h14):(1'h0)] wire86;
  wire [(4'hb):(1'h0)] wire51;
  wire signed [(5'h15):(1'h0)] wire5;
  wire signed [(4'hd):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire17;
  wire [(4'h9):(1'h0)] wire18;
  wire signed [(5'h10):(1'h0)] wire19;
  wire [(3'h7):(1'h0)] wire20;
  wire [(4'ha):(1'h0)] wire49;
  reg [(5'h10):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg13 = (1'h0);
  reg [(5'h15):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg7 = (1'h0);
  assign y = {wire88,
                 wire86,
                 wire51,
                 wire5,
                 wire6,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire49,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = ($unsigned(wire2[(2'h2):(1'h1)]) >= ($unsigned((8'h9e)) <<< ((+$unsigned((8'had))) | $unsigned((wire0 && (8'ha1))))));
  assign wire6 = {wire1, $unsigned((-$signed((8'hbe))))};
  always
    @(posedge clk) begin
      reg7 <= $unsigned((($signed($signed(wire6)) | wire5[(4'h8):(4'h8)]) ?
          ({$unsigned(wire1), $signed(wire0)} <= wire3) : wire0));
      reg8 <= $unsigned(wire2);
      reg9 <= $signed(wire6);
      reg10 <= (($unsigned($signed($signed(wire1))) < ($signed(wire3[(2'h3):(2'h2)]) >>> (!(7'h43)))) && ($unsigned((((8'ha2) ?
                  wire5 : wire5) ?
              $unsigned(wire5) : (wire6 ? (8'ha8) : (8'ha8)))) ?
          (|(-$unsigned((8'hbb)))) : {$signed($signed(wire1))}));
      reg11 <= $unsigned(((!{(reg10 ? (8'ha3) : reg10), $signed(wire1)}) ?
          ({(wire5 ? (8'hbd) : wire3),
              (~wire6)} ^ (((8'hbf) > wire5) ^~ (wire2 ?
              wire1 : wire5))) : {(reg7 ? ((8'had) > (8'hbc)) : reg10)}));
    end
  always
    @(posedge clk) begin
      if ($unsigned($unsigned(((reg9[(4'hb):(2'h3)] ^ reg10) ?
          $unsigned((!wire1)) : reg8[(1'h0):(1'h0)]))))
        begin
          reg12 <= $unsigned(reg10);
        end
      else
        begin
          reg12 <= ((wire3 ?
              reg8 : (($unsigned(wire4) ?
                      (reg8 ? (8'haa) : wire4) : wire0[(2'h2):(2'h2)]) ?
                  reg12[(1'h0):(1'h0)] : (~|$signed(wire1)))) << wire3);
          reg13 <= (^~$unsigned($unsigned(wire2[(4'h9):(4'h8)])));
          reg14 <= $unsigned(($unsigned({$unsigned((8'haa)),
                  reg10[(3'h7):(1'h0)]}) ?
              reg9[(4'ha):(2'h3)] : wire6[(3'h5):(1'h1)]));
          reg15 <= ($signed(reg9) ?
              $unsigned({reg12[(5'h11):(4'he)],
                  {wire4, {reg14, wire6}}}) : (-$unsigned(({reg9} ~^ {(8'hb5),
                  reg13}))));
          reg16 <= {wire0[(2'h2):(2'h2)],
              {((+wire0[(1'h0):(1'h0)]) ~^ ($signed(reg7) <= $unsigned((8'ha1)))),
                  (wire5[(5'h11):(5'h10)] ^ $unsigned($unsigned(reg10)))}};
        end
    end
  assign wire17 = (!(((!{wire1, (8'hae)}) ?
                      (&(~reg12)) : (|((8'hb9) ? wire1 : wire2))) * wire6));
  assign wire18 = (&reg11[(1'h0):(1'h0)]);
  assign wire19 = (^reg7[(2'h2):(1'h0)]);
  assign wire20 = (&$signed((~|(8'had))));
  module21 #() modinst50 (wire49, clk, reg12, wire3, reg14, wire19, wire1);
  assign wire51 = wire19;
  module52 #() modinst87 (wire86, clk, wire0, reg13, reg16, wire17);
  assign wire88 = reg12[(5'h15):(4'hb)];
endmodule

module module52
#(parameter param85 = (((&(^~(~(8'hb6)))) ? (-(~(^~(8'hb2)))) : (-(((8'hb6) <<< (8'ha9)) ~^ ((8'h9f) ? (8'ha1) : (8'hb8))))) ? ((&(((7'h40) - (8'hb2)) ? ((8'ha0) >= (8'hb8)) : (~^(8'hb6)))) ? (|({(8'ha6)} << (~|(8'ha2)))) : ((|(~&(8'h9d))) ? (((8'hab) ? (8'ha6) : (8'hb5)) <<< ((8'h9c) ? (8'hb7) : (8'ha5))) : (^((8'hbb) ? (8'hb5) : (8'hbb))))) : ({(-(-(8'hb3))), (-(&(7'h44)))} != (({(8'h9f), (8'hb9)} < (8'h9d)) ? (~(~(8'h9e))) : {(~(8'hbb))}))))
(y, clk, wire53, wire54, wire55, wire56);
  output wire [(32'h4e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire53;
  input wire [(5'h13):(1'h0)] wire54;
  input wire signed [(4'h8):(1'h0)] wire55;
  input wire signed [(4'hf):(1'h0)] wire56;
  wire signed [(5'h14):(1'h0)] wire57;
  wire signed [(5'h12):(1'h0)] wire58;
  wire signed [(3'h6):(1'h0)] wire59;
  wire [(5'h12):(1'h0)] wire60;
  wire [(4'hf):(1'h0)] wire83;
  assign y = {wire57, wire58, wire59, wire60, wire83, (1'h0)};
  assign wire57 = $signed({{$signed((&wire55))}});
  assign wire58 = wire54;
  assign wire59 = $signed($unsigned(wire57));
  assign wire60 = ((wire59 <= ({{wire59}} ?
                          $signed($unsigned(wire53)) : {$signed(wire55)})) ?
                      ($unsigned(wire56) + $unsigned((wire59[(3'h5):(3'h5)] ?
                          (&wire59) : (|wire53)))) : (wire57[(3'h7):(1'h1)] ?
                          ((^wire57[(4'hb):(2'h2)]) ?
                              wire58 : wire58) : ((!(wire59 > wire53)) ?
                              ($signed(wire55) <= {wire58}) : ((wire59 ?
                                  (8'hab) : wire54) >> {wire56}))));
  module61 #() modinst84 (.wire66(wire53), .wire64(wire55), .clk(clk), .wire62(wire60), .wire63(wire57), .y(wire83), .wire65(wire54));
endmodule

module module21
#(parameter param47 = (8'ha7), 
parameter param48 = {((((~&param47) <= (param47 << (8'hba))) ? param47 : param47) ? (((-param47) * (param47 == (8'hb5))) ? param47 : {((8'ha7) ? (8'hac) : param47)}) : (((param47 > param47) <= (param47 ? param47 : (7'h40))) ? ((param47 - (8'hbd)) & (param47 == param47)) : (param47 >> (|param47)))), (param47 * param47)})
(y, clk, wire26, wire25, wire24, wire23, wire22);
  output wire [(32'h2a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire26;
  input wire signed [(5'h15):(1'h0)] wire25;
  input wire [(3'h6):(1'h0)] wire24;
  input wire signed [(5'h10):(1'h0)] wire23;
  input wire [(5'h10):(1'h0)] wire22;
  wire [(3'h4):(1'h0)] wire46;
  wire [(3'h4):(1'h0)] wire45;
  wire [(4'he):(1'h0)] wire44;
  wire [(2'h2):(1'h0)] wire43;
  wire [(3'h6):(1'h0)] wire42;
  wire signed [(3'h4):(1'h0)] wire41;
  wire signed [(3'h7):(1'h0)] wire39;
  assign y = {wire46, wire45, wire44, wire43, wire42, wire41, wire39, (1'h0)};
  module27 #() modinst40 (.wire31(wire22), .y(wire39), .wire29(wire23), .wire30(wire25), .clk(clk), .wire28(wire26));
  assign wire41 = ({($unsigned((~|wire23)) ?
                          $unsigned($unsigned(wire26)) : (8'hb9)),
                      {wire39[(3'h6):(3'h6)]}} <<< $unsigned(({$signed(wire23),
                          (^~wire23)} ?
                      {{wire24, (8'h9e)}} : (((8'hbb) ?
                          wire24 : wire24) ^~ (wire39 ? (8'ha0) : wire22)))));
  assign wire42 = wire25[(4'hb):(3'h6)];
  assign wire43 = wire26[(5'h10):(3'h5)];
  assign wire44 = $signed($unsigned(($signed({(8'hb9)}) >>> wire43[(1'h1):(1'h1)])));
  assign wire45 = wire44[(4'h9):(1'h0)];
  assign wire46 = (($unsigned((!$unsigned(wire25))) || ($signed($unsigned(wire45)) > $unsigned(wire39))) ?
                      wire24 : (~$signed($signed((wire22 <<< wire43)))));
endmodule

module module27
#(parameter param38 = (((~&(~|((7'h40) ^~ (7'h41)))) + {(8'hba), {(&(8'hbc)), {(7'h43)}}}) == ((~((+(8'hbd)) ? ((7'h43) ^~ (8'hb4)) : {(8'hba)})) != {{(+(8'hae)), ((8'ha0) ? (8'h9f) : (8'hbf))}, (((8'ha3) >> (8'hb5)) ? ((8'hbd) >> (8'hbf)) : {(8'hab)})})))
(y, clk, wire31, wire30, wire29, wire28);
  output wire [(32'h48):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire31;
  input wire [(4'h9):(1'h0)] wire30;
  input wire [(4'h8):(1'h0)] wire29;
  input wire signed [(5'h15):(1'h0)] wire28;
  wire signed [(4'hb):(1'h0)] wire37;
  wire [(4'ha):(1'h0)] wire36;
  wire [(5'h11):(1'h0)] wire35;
  wire [(4'hf):(1'h0)] wire34;
  wire [(4'ha):(1'h0)] wire33;
  reg [(4'h8):(1'h0)] reg32 = (1'h0);
  assign y = {wire37, wire36, wire35, wire34, wire33, reg32, (1'h0)};
  always
    @(posedge clk) begin
      reg32 <= $signed((wire31[(4'hf):(3'h4)] ~^ wire31));
    end
  assign wire33 = ($signed((($unsigned((8'ha4)) < {wire28}) ?
                      (8'hb4) : wire30[(3'h7):(1'h0)])) >> (($unsigned((wire29 ?
                              wire29 : wire29)) ?
                          (-(|reg32)) : (wire28 ?
                              $signed(wire29) : (~|wire31))) ?
                      $unsigned((~&$signed(wire31))) : ({(wire29 + (8'ha3)),
                              (wire29 ? wire31 : wire29)} ?
                          $signed($unsigned((8'ha0))) : ((!reg32) ?
                              $signed(wire29) : (wire30 ? reg32 : wire31)))));
  assign wire34 = wire33[(4'ha):(4'ha)];
  assign wire35 = $signed((($unsigned($unsigned(wire31)) ?
                      ((+wire30) == wire33) : wire31[(4'hb):(3'h6)]) & (!$unsigned({(8'hbe),
                      wire31}))));
  assign wire36 = (|((~^{(~wire35), wire34[(2'h2):(1'h0)]}) ?
                      ($signed($signed(wire29)) ?
                          $unsigned(wire34[(1'h0):(1'h0)]) : ((~|wire34) != $signed(wire28))) : wire31[(4'h8):(3'h5)]));
  assign wire37 = $signed($unsigned($signed(wire36)));
endmodule

module module61
#(parameter param81 = (~^(({((8'ha4) ^~ (8'ha7)), ((8'hbb) ? (8'hbd) : (8'hbb))} ? ((&(8'hb8)) - ((8'hbd) ? (8'ha8) : (8'hb3))) : (^~((8'hbd) ? (8'ha6) : (8'ha6)))) ? (({(8'hb4)} ? ((8'ha3) == (8'h9e)) : ((8'ha4) ? (8'ha2) : (8'h9c))) ? (~|{(8'hb8), (8'hac)}) : ((^(8'ha2)) ? {(8'ha6)} : ((8'h9f) ? (8'ha1) : (8'ha0)))) : ((((8'hb5) ? (8'ha6) : (8'hb6)) <<< ((8'h9d) > (8'hac))) & ({(8'hb3)} << (~(8'hb2)))))), 
parameter param82 = (((param81 ? ((param81 ? param81 : (8'hb8)) ? (param81 ? param81 : param81) : (!param81)) : {param81}) ? ((~|param81) + (((8'hb5) >>> param81) == param81)) : ({((8'hab) > param81)} >= ((|param81) ? (7'h42) : (param81 <<< param81)))) && ((((param81 ? param81 : param81) ~^ (param81 >> param81)) >> ((~&param81) ^~ {param81, param81})) ? (~|(((8'hbf) + (8'hac)) ? (param81 >>> param81) : (param81 ? param81 : param81))) : (|(^(^param81))))))
(y, clk, wire66, wire65, wire64, wire63, wire62);
  output wire [(32'h9b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire66;
  input wire signed [(5'h13):(1'h0)] wire65;
  input wire signed [(4'h8):(1'h0)] wire64;
  input wire signed [(5'h14):(1'h0)] wire63;
  input wire signed [(4'hc):(1'h0)] wire62;
  wire [(2'h3):(1'h0)] wire80;
  wire [(4'he):(1'h0)] wire75;
  wire [(5'h14):(1'h0)] wire74;
  wire signed [(4'h9):(1'h0)] wire73;
  wire signed [(4'h9):(1'h0)] wire72;
  wire [(2'h3):(1'h0)] wire71;
  wire signed [(4'hd):(1'h0)] wire70;
  wire [(4'hb):(1'h0)] wire69;
  wire [(4'h8):(1'h0)] wire67;
  reg [(3'h5):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg68 = (1'h0);
  assign y = {wire80,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire67,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg68,
                 (1'h0)};
  assign wire67 = $unsigned((~|wire62));
  always
    @(posedge clk) begin
      reg68 <= ((~(wire62[(3'h5):(3'h4)] ?
          $signed((wire65 && wire63)) : ((wire65 ?
              wire62 : (8'haa)) || (|wire67)))) ~^ wire64);
    end
  assign wire69 = $unsigned(wire64);
  assign wire70 = $signed(reg68);
  assign wire71 = (~|$signed(wire67));
  assign wire72 = $signed($unsigned(wire62[(1'h0):(1'h0)]));
  assign wire73 = {(!{(wire72 ?
                              $unsigned(wire72) : (wire69 ?
                                  (7'h42) : wire67))})};
  assign wire74 = (8'hb1);
  assign wire75 = $signed((wire71[(2'h2):(2'h2)] ?
                      wire74[(4'hb):(4'hb)] : $signed(wire63[(2'h3):(2'h3)])));
  always
    @(posedge clk) begin
      reg76 <= (^(wire65 || $unsigned((8'ha2))));
      reg77 <= {wire70, wire72};
      reg78 <= (^~{(8'haf)});
      reg79 <= ((wire65[(2'h3):(1'h1)] ?
              {wire73[(3'h4):(1'h1)]} : $signed(((wire63 ? wire73 : wire62) ?
                  $unsigned(wire69) : (~|(8'hb0))))) ?
          $unsigned(wire64[(1'h1):(1'h0)]) : wire74);
    end
  assign wire80 = ((wire72 < wire72[(4'h8):(3'h4)]) ?
                      $unsigned($unsigned((8'haf))) : {$unsigned((+(reg68 ?
                              wire65 : wire63))),
                          (~|{(wire67 ? (8'haa) : wire66), {wire71}})});
endmodule
