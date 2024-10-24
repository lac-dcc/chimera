module top
#(parameter param179 = ({{(~^(^(8'haf)))}} ? (~&(^~(7'h41))) : (8'ha3)))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hca):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire0;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  wire [(5'h12):(1'h0)] wire178;
  wire signed [(3'h6):(1'h0)] wire168;
  wire [(5'h10):(1'h0)] wire4;
  wire [(5'h14):(1'h0)] wire5;
  wire signed [(4'hf):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire19;
  wire signed [(5'h15):(1'h0)] wire119;
  wire signed [(4'h8):(1'h0)] wire166;
  reg signed [(5'h11):(1'h0)] reg177 = (1'h0);
  reg [(2'h3):(1'h0)] reg176 = (1'h0);
  reg [(2'h3):(1'h0)] reg175 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg174 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg173 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg172 = (1'h0);
  reg [(3'h4):(1'h0)] reg171 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg170 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg169 = (1'h0);
  assign y = {wire178,
                 wire168,
                 wire4,
                 wire5,
                 wire6,
                 wire19,
                 wire119,
                 wire166,
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
  assign wire4 = $unsigned((^~($signed((wire3 ? wire0 : (8'hb7))) ?
                     (^~(wire1 > wire3)) : ($signed(wire1) == ((8'hbc) ?
                         (8'hbe) : wire2)))));
  assign wire5 = $signed(wire2[(4'ha):(1'h0)]);
  assign wire6 = (((!wire2) <= (~^($signed((8'ha2)) ?
                     wire2[(1'h0):(1'h0)] : $signed(wire2)))) + ((wire5 ?
                     (!$signed(wire2)) : (+wire1)) || wire3));
  module7 #() modinst20 (.wire8(wire3), .wire9(wire6), .clk(clk), .y(wire19), .wire11(wire4), .wire10(wire0));
  module21 #() modinst120 (wire119, clk, wire19, wire3, wire1, wire4);
  module121 #() modinst167 (.clk(clk), .wire124(wire6), .wire125(wire19), .wire126(wire3), .wire123(wire119), .wire122(wire5), .y(wire166));
  assign wire168 = (8'hbc);
  always
    @(posedge clk) begin
      reg169 <= {(^~wire4), wire5};
    end
  always
    @(posedge clk) begin
      reg170 <= $unsigned(($unsigned((~|wire168)) <<< (~$unsigned((!wire19)))));
      reg171 <= $signed((($unsigned(wire119) >>> (-wire0[(3'h7):(3'h7)])) ?
          $unsigned((((8'hb9) ? wire4 : reg170) ?
              (8'hb1) : $signed(wire3))) : ((^~(wire2 ? wire4 : wire166)) ?
              {(^~reg169)} : $unsigned((wire6 ? wire3 : wire4)))));
      reg172 <= (8'h9e);
      if ($signed({($signed((~wire3)) ?
              reg170[(4'h9):(3'h7)] : ((~reg172) ?
                  (!wire5) : $signed(wire119)))}))
        begin
          if ({wire4})
            begin
              reg173 <= wire4;
              reg174 <= {$unsigned((((wire6 ?
                      wire2 : wire19) > (reg169 << wire168)) >> {reg173[(3'h4):(3'h4)]})),
                  ((&{reg172, $signed(reg172)}) ? reg172 : (8'h9f))};
              reg175 <= reg170[(1'h0):(1'h0)];
              reg176 <= reg175[(1'h1):(1'h1)];
            end
          else
            begin
              reg173 <= (|((!($unsigned((7'h40)) ? wire2 : wire19)) ?
                  wire19 : {wire5}));
            end
          reg177 <= {$unsigned($signed(($unsigned(reg169) > wire0[(3'h6):(1'h0)])))};
        end
      else
        begin
          reg173 <= ($signed($unsigned(($unsigned(wire1) + reg174))) >= wire1[(4'hf):(4'hf)]);
          reg174 <= (reg177[(4'ha):(1'h0)] ^ (|({wire19, {wire119}} ?
              ($unsigned(reg174) ?
                  (reg175 ?
                      reg176 : wire1) : reg169[(5'h10):(3'h6)]) : $signed((+reg170)))));
          reg175 <= (^reg177);
        end
    end
  assign wire178 = $unsigned(((!(((8'ha5) >>> reg177) * {(8'h9d)})) ?
                       $unsigned((!$unsigned(wire4))) : $unsigned(reg172[(4'h9):(1'h1)])));
endmodule

module module121
#(parameter param164 = ({((8'hab) - (&(~&(8'hb9))))} & (-{(~(&(8'hb2))), (((8'ha7) <<< (8'hae)) ? ((8'ha5) | (8'ha9)) : {(8'ha1), (8'ha5)})})), 
parameter param165 = {((~|(param164 ? (!(8'had)) : param164)) ? param164 : (^(^~(~param164)))), ((|((|param164) ? (^(8'h9e)) : (param164 | param164))) << (((param164 >= (8'haf)) ? {param164, param164} : param164) ? ((param164 == param164) ^ param164) : ((|param164) ? (!(8'hab)) : (param164 && param164))))})
(y, clk, wire126, wire125, wire124, wire123, wire122);
  output wire [(32'hc0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire126;
  input wire signed [(3'h7):(1'h0)] wire125;
  input wire [(4'hf):(1'h0)] wire124;
  input wire [(5'h15):(1'h0)] wire123;
  input wire [(5'h14):(1'h0)] wire122;
  wire signed [(4'hf):(1'h0)] wire163;
  wire signed [(3'h4):(1'h0)] wire159;
  wire [(5'h14):(1'h0)] wire151;
  wire signed [(3'h4):(1'h0)] wire150;
  wire signed [(4'hd):(1'h0)] wire149;
  wire [(5'h14):(1'h0)] wire148;
  wire signed [(3'h5):(1'h0)] wire147;
  wire signed [(4'he):(1'h0)] wire145;
  reg signed [(2'h3):(1'h0)] reg162 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg161 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg160 = (1'h0);
  reg [(4'ha):(1'h0)] reg158 = (1'h0);
  reg [(4'h9):(1'h0)] reg157 = (1'h0);
  reg [(4'hd):(1'h0)] reg156 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg155 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg154 = (1'h0);
  reg [(3'h6):(1'h0)] reg153 = (1'h0);
  reg [(4'hc):(1'h0)] reg152 = (1'h0);
  assign y = {wire163,
                 wire159,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire145,
                 reg162,
                 reg161,
                 reg160,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 (1'h0)};
  module127 #() modinst146 (wire145, clk, wire126, wire123, wire122, wire124);
  assign wire147 = (~&wire122);
  assign wire148 = $signed($unsigned($signed($signed((~|(7'h44))))));
  assign wire149 = $signed(((8'hae) || wire147[(2'h2):(1'h1)]));
  assign wire150 = wire124;
  assign wire151 = (($unsigned(wire150) ?
                       (+(-$unsigned(wire150))) : wire147) ~^ wire125);
  always
    @(posedge clk) begin
      reg152 <= $unsigned($signed((wire122 >= (wire125 >> (wire148 ?
          wire122 : wire148)))));
      if ($signed($unsigned(wire150)))
        begin
          reg153 <= ((-$unsigned($unsigned((wire123 ?
              wire149 : reg152)))) & (wire151[(5'h10):(4'h9)] * {((wire147 ?
                      (8'hb1) : wire147) ?
                  (!wire150) : (reg152 * wire125)),
              $signed($signed(wire122))}));
        end
      else
        begin
          if ({(wire122[(4'he):(2'h2)] ?
                  wire149[(4'hd):(4'h8)] : wire122[(4'hc):(3'h7)])})
            begin
              reg153 <= wire148[(4'hb):(4'h8)];
              reg154 <= wire126;
              reg155 <= $unsigned(wire148[(2'h3):(2'h2)]);
              reg156 <= wire122[(5'h12):(4'h8)];
            end
          else
            begin
              reg153 <= wire145[(4'hc):(4'hc)];
              reg154 <= (~wire125[(2'h3):(1'h1)]);
              reg155 <= $unsigned(((($unsigned(wire124) ^~ (7'h41)) ?
                  $unsigned((reg155 ?
                      (8'hb2) : wire147)) : $signed($unsigned(wire149))) << wire148));
              reg156 <= reg156[(2'h3):(1'h1)];
              reg157 <= ((wire150[(1'h1):(1'h1)] < (((wire150 == wire151) << wire126) >> $signed($unsigned(reg152)))) ?
                  {$signed({$signed(reg155)}),
                      ((!wire148[(3'h5):(3'h4)]) ?
                          wire145[(3'h7):(1'h1)] : (reg156 ?
                              (wire151 ?
                                  reg155 : wire150) : reg153[(3'h4):(2'h3)]))} : {($unsigned((wire122 >> reg152)) ?
                          (wire123[(5'h14):(1'h1)] ?
                              (reg152 ? wire148 : wire150) : (reg155 ?
                                  wire125 : wire147)) : (8'ha3))});
            end
        end
      reg158 <= reg154[(3'h5):(1'h1)];
    end
  assign wire159 = $signed(wire126[(4'h9):(3'h7)]);
  always
    @(posedge clk) begin
      reg160 <= {reg154[(3'h4):(1'h1)], wire122};
      reg161 <= (8'ha6);
      reg162 <= $unsigned($unsigned(($unsigned($unsigned(reg154)) == $unsigned(wire159))));
    end
  assign wire163 = wire151;
endmodule

module module21  (y, clk, wire25, wire24, wire23, wire22);
  output wire [(32'h1be):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire25;
  input wire signed [(5'h15):(1'h0)] wire24;
  input wire signed [(4'hc):(1'h0)] wire23;
  input wire signed [(5'h10):(1'h0)] wire22;
  wire [(3'h5):(1'h0)] wire118;
  wire signed [(3'h4):(1'h0)] wire117;
  wire [(5'h11):(1'h0)] wire116;
  wire signed [(4'hd):(1'h0)] wire114;
  wire signed [(3'h5):(1'h0)] wire87;
  wire signed [(4'hd):(1'h0)] wire75;
  wire [(3'h5):(1'h0)] wire74;
  wire signed [(2'h2):(1'h0)] wire73;
  wire [(4'hf):(1'h0)] wire72;
  wire signed [(5'h15):(1'h0)] wire57;
  wire signed [(5'h14):(1'h0)] wire56;
  wire signed [(3'h7):(1'h0)] wire52;
  reg signed [(4'h8):(1'h0)] reg86 = (1'h0);
  reg [(4'hd):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg83 = (1'h0);
  reg [(4'h9):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg80 = (1'h0);
  reg [(4'hc):(1'h0)] reg79 = (1'h0);
  reg [(2'h3):(1'h0)] reg78 = (1'h0);
  reg [(4'hd):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg71 = (1'h0);
  reg [(5'h10):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg67 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg66 = (1'h0);
  reg [(3'h4):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg64 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg62 = (1'h0);
  reg [(2'h3):(1'h0)] reg61 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg60 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg59 = (1'h0);
  reg [(4'hd):(1'h0)] reg58 = (1'h0);
  reg [(4'h8):(1'h0)] reg55 = (1'h0);
  reg [(4'hf):(1'h0)] reg54 = (1'h0);
  assign y = {wire118,
                 wire117,
                 wire116,
                 wire114,
                 wire87,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire57,
                 wire56,
                 wire52,
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
                 reg76,
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
                 reg55,
                 reg54,
                 (1'h0)};
  module26 #() modinst53 (.wire27(wire24), .clk(clk), .wire28(wire22), .wire29(wire25), .wire30(wire23), .y(wire52));
  always
    @(posedge clk) begin
      reg54 <= wire22[(3'h5):(1'h0)];
      reg55 <= {$signed($signed({wire23[(3'h5):(1'h0)]})),
          $signed((reg54 & ((~^reg54) ? reg54 : (wire52 ? wire25 : wire24))))};
    end
  assign wire56 = wire25[(2'h3):(1'h1)];
  assign wire57 = wire23;
  always
    @(posedge clk) begin
      if ($unsigned((reg54 ? wire22[(4'h9):(1'h0)] : wire24)))
        begin
          reg58 <= $unsigned($unsigned(wire52));
          reg59 <= (~reg54[(3'h6):(3'h5)]);
          reg60 <= (-($signed(({wire24, reg54} ?
              wire56 : wire23)) >>> $signed((-(7'h43)))));
          reg61 <= reg55[(1'h1):(1'h0)];
          reg62 <= reg58[(3'h4):(1'h0)];
        end
      else
        begin
          reg58 <= (~&wire56[(4'hc):(4'ha)]);
          reg59 <= (reg62[(3'h4):(1'h0)] > {$unsigned(wire56[(4'h8):(3'h4)]),
              ($unsigned(((8'ha8) ? wire23 : wire24)) ~^ ($unsigned(reg54) ?
                  wire24[(2'h2):(1'h0)] : wire52))});
          if ((($unsigned((wire23 ? (~|(8'h9f)) : (^reg60))) ?
                  wire57[(5'h13):(5'h12)] : (wire25 + {(&reg59)})) ?
              wire52[(3'h5):(1'h0)] : $unsigned($unsigned((8'hb3)))))
            begin
              reg60 <= $signed({reg61[(1'h0):(1'h0)]});
              reg61 <= ((8'hb0) && (~&(reg55[(3'h6):(3'h6)] <<< $unsigned(reg58[(2'h3):(2'h3)]))));
              reg62 <= (wire24[(5'h14):(4'hf)] ?
                  ($unsigned(((reg60 ~^ reg54) ? reg62 : (~|wire52))) ?
                      wire22 : $signed(((reg59 ? reg58 : wire56) ?
                          ((8'hbc) ^~ reg55) : ((7'h43) - reg55)))) : $unsigned(((wire52 ?
                      (wire57 - wire56) : reg55[(3'h6):(1'h1)]) > (^~{reg59,
                      (8'h9f)}))));
              reg63 <= wire25;
            end
          else
            begin
              reg60 <= {{$signed((|reg60[(1'h0):(1'h0)]))}, {$signed(wire24)}};
            end
        end
      if ((reg63 ?
          $signed((reg61[(1'h1):(1'h1)] ?
              wire57[(3'h7):(1'h1)] : ($unsigned(reg55) ?
                  (-reg59) : (wire56 << reg54)))) : {$unsigned(((reg59 * reg62) ?
                  wire52 : (wire24 || reg63))),
              reg59}))
        begin
          if ((reg54[(4'h9):(1'h0)] == ($unsigned(wire57[(5'h10):(4'hd)]) ^~ $unsigned((reg55[(3'h6):(3'h6)] <= (|wire25))))))
            begin
              reg64 <= reg60[(3'h4):(2'h3)];
              reg65 <= $signed($signed({(^~reg58),
                  (reg58[(3'h7):(2'h2)] >= (reg58 << reg54))}));
              reg66 <= ((reg63[(2'h2):(1'h0)] ?
                  reg55[(3'h7):(3'h5)] : (~^$unsigned((&reg54)))) + $signed(reg60[(2'h3):(2'h3)]));
              reg67 <= $unsigned(reg59[(1'h0):(1'h0)]);
            end
          else
            begin
              reg64 <= (($unsigned(wire57) != wire56) ?
                  {reg66} : reg66[(3'h4):(2'h3)]);
              reg65 <= ($unsigned(wire23[(1'h1):(1'h1)]) ?
                  (~&wire22[(5'h10):(3'h6)]) : ($unsigned($unsigned(wire24)) <= wire22));
              reg66 <= ((reg58 ^~ ((~|reg59[(4'h8):(3'h5)]) | ((~reg58) == reg66))) ?
                  reg54 : {$signed((wire56[(3'h7):(3'h4)] << reg67))});
              reg67 <= (($signed($signed((wire25 ?
                      wire56 : reg55))) >> $signed(((reg66 ? wire25 : (8'ha7)) ?
                      wire23 : (reg61 ? wire52 : wire52)))) ?
                  ({{(wire52 ? wire23 : reg64)}} ?
                      $signed($signed((^reg55))) : reg64[(4'h9):(1'h1)]) : reg60[(3'h7):(2'h3)]);
            end
          if ((8'hb4))
            begin
              reg68 <= $unsigned((($signed((reg55 ? (8'haf) : wire52)) ?
                  reg64[(3'h5):(1'h0)] : ($unsigned(wire24) * (reg55 ?
                      reg58 : (8'hae)))) | wire57));
            end
          else
            begin
              reg68 <= reg67[(5'h12):(1'h0)];
              reg69 <= $signed((~&(~&(^~(^reg68)))));
              reg70 <= $signed(reg62);
            end
          reg71 <= $signed((~&$unsigned($unsigned((~^wire56)))));
        end
      else
        begin
          if ($unsigned(reg65[(3'h4):(2'h3)]))
            begin
              reg64 <= (&reg66);
              reg65 <= (wire56[(4'hd):(2'h3)] != {reg54});
              reg66 <= $signed($unsigned((~^wire52[(3'h5):(3'h4)])));
              reg67 <= ($unsigned(reg62[(1'h0):(1'h0)]) + (~&((~&reg63) == $signed((wire22 ?
                  reg55 : reg69)))));
            end
          else
            begin
              reg64 <= $unsigned(((reg63[(4'h9):(3'h6)] ~^ ($signed(reg67) < (wire23 == reg63))) || (({(8'hb5)} ?
                  reg58[(3'h7):(1'h1)] : (reg63 ? wire57 : wire56)) - wire25)));
              reg65 <= (((reg55[(2'h3):(1'h1)] ^~ $unsigned({reg71})) ?
                  (reg67 ?
                      ((reg71 ^~ (8'h9e)) != reg61) : (wire56 > (-reg58))) : reg60[(4'h9):(1'h1)]) & $unsigned(reg59[(2'h3):(1'h1)]));
              reg66 <= ($signed((^~(&reg69[(2'h2):(2'h2)]))) - $signed($signed($signed(((8'haa) >> reg67)))));
            end
          reg68 <= $unsigned($unsigned($unsigned($unsigned((~^reg58)))));
          if ({(|$signed(($unsigned(reg67) ?
                  (reg71 ^ reg64) : $unsigned(wire24)))),
              ($unsigned(((wire23 <= reg65) & reg60[(4'h9):(2'h3)])) && (|{reg67[(5'h10):(3'h5)],
                  $unsigned(wire24)}))})
            begin
              reg69 <= reg64;
              reg70 <= {(8'haa)};
              reg71 <= (|($unsigned($signed((reg71 ?
                  reg55 : wire57))) ^~ $unsigned(((wire56 ?
                  reg70 : reg71) >> reg71))));
            end
          else
            begin
              reg69 <= $signed($unsigned(reg59));
              reg70 <= $unsigned(reg54);
              reg71 <= (&($unsigned((reg61 != (reg69 ?
                  reg54 : reg64))) != $unsigned($unsigned(reg68[(3'h5):(1'h1)]))));
            end
        end
    end
  assign wire72 = {reg65[(1'h0):(1'h0)]};
  assign wire73 = wire23;
  assign wire74 = ($unsigned({reg54[(4'hf):(4'h8)]}) ?
                      $signed(wire73) : $unsigned((reg64[(4'he):(3'h5)] ^ ($unsigned(reg68) && ((7'h40) - reg61)))));
  assign wire75 = $unsigned(wire22[(4'hb):(3'h7)]);
  always
    @(posedge clk) begin
      reg76 <= reg67[(5'h10):(1'h1)];
      reg77 <= ($unsigned(($signed($unsigned((8'hba))) <<< $unsigned($signed(wire23)))) ~^ $signed((($unsigned(wire56) >> $unsigned(reg55)) >= (((7'h43) >>> reg60) ~^ $unsigned((8'haa))))));
      reg78 <= $unsigned((wire25[(4'h8):(2'h3)] ?
          reg54 : wire23[(4'ha):(1'h1)]));
      if (wire25)
        begin
          reg79 <= ((($unsigned({reg60}) * (reg67[(3'h6):(1'h1)] >>> reg64[(3'h7):(3'h7)])) ?
                  (((wire75 ~^ reg66) & {reg77,
                      reg71}) & wire52) : $unsigned(wire57)) ?
              {$signed(reg77),
                  $signed($signed($unsigned(reg54)))} : reg60[(2'h3):(1'h0)]);
          reg80 <= $signed((|($signed($unsigned(wire75)) ?
              reg65 : ((+reg54) ? ((8'hae) ^ (8'ha1)) : (wire73 >= (8'ha8))))));
          if (($signed({$unsigned((8'hbc))}) & ($signed($signed((&reg64))) == ({$signed(reg64),
              (reg71 ? (7'h43) : wire23)} < (&$signed(wire72))))))
            begin
              reg81 <= {$signed($unsigned(reg77[(1'h1):(1'h0)])),
                  (~^(|reg58[(4'h9):(3'h7)]))};
              reg82 <= {(&(((reg77 << reg59) ?
                          $unsigned(reg68) : $unsigned(reg78)) ?
                      ($signed(reg78) >> (wire52 >>> reg65)) : $unsigned((|wire73))))};
              reg83 <= (~(^(($signed(reg63) ? reg59[(4'h8):(2'h2)] : (8'hb6)) ?
                  $signed($unsigned(wire22)) : ((reg58 ? wire72 : reg77) ?
                      {reg77} : (~|reg61)))));
              reg84 <= $unsigned($unsigned(reg55[(1'h1):(1'h1)]));
            end
          else
            begin
              reg81 <= ($unsigned(($unsigned((wire23 ?
                  reg81 : reg62)) && ((^reg64) ?
                  $unsigned(reg83) : (reg78 ? reg81 : reg60)))) < {reg70,
                  ((reg63[(1'h1):(1'h0)] ? $unsigned(reg71) : (8'h9d)) ?
                      reg69 : ((!wire75) ?
                          $unsigned(reg61) : $signed(reg79)))});
              reg82 <= ((((~(!reg65)) != reg68[(5'h10):(3'h4)]) ?
                      wire74 : $signed(((-reg76) ?
                          {reg82, reg83} : {(8'hb5), (7'h42)}))) ?
                  (|(8'hb9)) : (|({$unsigned(reg59),
                          (wire75 ? reg70 : (8'h9e))} ?
                      reg68 : $unsigned($unsigned(wire57)))));
              reg83 <= (+$unsigned((reg80 ?
                  (((8'hb9) ? wire57 : wire24) > (reg77 <= reg76)) : reg83)));
            end
          reg85 <= reg81[(4'h9):(3'h7)];
          reg86 <= reg83[(4'h8):(3'h5)];
        end
      else
        begin
          reg79 <= reg70[(2'h3):(2'h2)];
          reg80 <= (($unsigned($signed((^~reg78))) <= ((wire22 - reg86[(1'h0):(1'h0)]) ?
              reg82[(3'h7):(3'h7)] : reg80)) * reg82);
          reg81 <= (8'hbb);
          reg82 <= (((~&reg58) ?
                  ((8'h9d) ? reg77 : (!reg76)) : ((reg61 ?
                      reg71 : (wire25 >= reg71)) <<< $unsigned((reg83 ?
                      reg54 : reg77)))) ?
              reg78 : ($unsigned(reg58[(3'h5):(3'h4)]) ?
                  $signed({reg71[(4'h9):(4'h8)],
                      reg54[(4'hc):(1'h1)]}) : $signed($signed(((8'hb0) ?
                      reg65 : reg78)))));
          reg83 <= {(&$signed($signed($unsigned(wire72))))};
        end
    end
  assign wire87 = $unsigned(reg85[(3'h6):(3'h4)]);
  module88 #() modinst115 (wire114, clk, reg60, reg81, reg54, reg84);
  assign wire116 = ((8'ha7) && $unsigned(((7'h42) ~^ {(&reg70)})));
  assign wire117 = ($signed($signed($unsigned(reg71[(3'h4):(2'h3)]))) ?
                       (!((^reg81) - $unsigned($unsigned(reg70)))) : {{(~|((8'hb1) * wire23)),
                               $signed((reg68 >>> reg83))}});
  assign wire118 = $unsigned($signed(reg70[(1'h1):(1'h1)]));
endmodule

module module7
#(parameter param17 = (!(((-(^~(8'hb5))) ? (((8'h9c) != (8'had)) != ((8'ha0) ~^ (8'ha2))) : (|(8'hac))) ? ((&((7'h41) <= (8'hbe))) ? (((8'ha7) ? (8'hb7) : (8'hb8)) ? (~&(8'haa)) : ((8'h9e) ~^ (7'h42))) : ((!(8'had)) ? ((8'hba) + (8'hb7)) : {(7'h44), (8'hb4)})) : {(&((8'hb6) ? (8'haf) : (8'ha4)))})), 
parameter param18 = (&(-(((param17 ? param17 : (8'haf)) ? (param17 ? param17 : param17) : (~^param17)) | ((^~(8'hba)) ? (param17 ? param17 : param17) : {param17})))))
(y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'h41):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire11;
  input wire signed [(4'hf):(1'h0)] wire10;
  input wire signed [(4'hf):(1'h0)] wire9;
  input wire signed [(5'h12):(1'h0)] wire8;
  wire [(4'hd):(1'h0)] wire16;
  wire signed [(5'h12):(1'h0)] wire15;
  wire [(5'h14):(1'h0)] wire14;
  wire signed [(4'hb):(1'h0)] wire13;
  wire signed [(2'h2):(1'h0)] wire12;
  assign y = {wire16, wire15, wire14, wire13, wire12, (1'h0)};
  assign wire12 = wire11[(3'h5):(1'h0)];
  assign wire13 = wire12[(2'h2):(1'h0)];
  assign wire14 = (~|((wire9[(4'hc):(1'h0)] ?
                      wire10 : wire8[(3'h7):(3'h4)]) + wire9[(1'h1):(1'h0)]));
  assign wire15 = (&$signed(wire10[(4'h8):(2'h3)]));
  assign wire16 = wire12[(1'h1):(1'h1)];
endmodule

module module88
#(parameter param113 = ((~((((7'h40) ? (7'h44) : (8'hb1)) ? ((7'h41) == (8'hac)) : ((8'ha6) ? (8'ha9) : (8'had))) >>> (((8'hb8) & (8'hbe)) ? ((8'hb7) ? (7'h40) : (8'hba)) : (^(8'h9e))))) ? {((((8'hb2) ? (8'hbb) : (8'ha6)) | (^(8'h9c))) & (((8'hbb) ? (8'ha0) : (8'hb8)) <= ((7'h41) >>> (8'hb8))))} : (^~(((+(8'hbe)) && (+(7'h40))) - {(^(8'hb6))}))))
(y, clk, wire92, wire91, wire90, wire89);
  output wire [(32'hfd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire92;
  input wire [(5'h13):(1'h0)] wire91;
  input wire [(4'h9):(1'h0)] wire90;
  input wire signed [(4'ha):(1'h0)] wire89;
  wire signed [(3'h6):(1'h0)] wire112;
  wire signed [(4'h9):(1'h0)] wire111;
  wire [(5'h14):(1'h0)] wire110;
  wire signed [(5'h15):(1'h0)] wire109;
  wire signed [(5'h13):(1'h0)] wire108;
  wire [(4'hd):(1'h0)] wire107;
  wire signed [(5'h11):(1'h0)] wire106;
  wire [(5'h15):(1'h0)] wire105;
  wire [(4'hd):(1'h0)] wire93;
  reg signed [(5'h14):(1'h0)] reg104 = (1'h0);
  reg [(4'h9):(1'h0)] reg103 = (1'h0);
  reg [(2'h3):(1'h0)] reg102 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg100 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg96 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg95 = (1'h0);
  reg [(3'h4):(1'h0)] reg94 = (1'h0);
  assign y = {wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire93,
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
                 reg94,
                 (1'h0)};
  assign wire93 = wire90;
  always
    @(posedge clk) begin
      if (({wire89, (+$unsigned((wire92 >= wire93)))} || wire89))
        begin
          reg94 <= {(-(8'ha7))};
          if ({((wire92[(2'h2):(2'h2)] ?
                  (wire89[(1'h0):(1'h0)] ?
                      (8'hb1) : (wire89 ?
                          wire93 : wire89)) : (wire91[(3'h7):(2'h3)] ?
                      (wire93 ?
                          wire92 : wire93) : $unsigned(wire92))) & (~^$signed($signed(wire93))))})
            begin
              reg95 <= $unsigned(wire91[(3'h7):(1'h1)]);
              reg96 <= reg94;
              reg97 <= $unsigned({(reg95 ^~ (reg96 | $signed(reg96))),
                  ({wire89[(1'h0):(1'h0)]} <= (reg96 > (~^(8'hbb))))});
              reg98 <= (~&wire91);
            end
          else
            begin
              reg95 <= (wire93 ?
                  ($unsigned((!(wire93 ? wire90 : (8'haf)))) ?
                      (~&(wire92[(1'h0):(1'h0)] ?
                          (wire90 ?
                              reg98 : reg96) : {reg95})) : $signed($signed(reg97[(5'h10):(5'h10)]))) : (-($signed(wire91) + $unsigned((reg98 ?
                      reg96 : (8'h9e))))));
              reg96 <= ($signed($signed(wire93[(4'hc):(3'h6)])) && reg94);
              reg97 <= $unsigned((((7'h42) ?
                  (reg98 ?
                      $unsigned((7'h40)) : wire92[(1'h0):(1'h0)]) : (^~$unsigned(wire92))) <= $signed({wire92[(1'h0):(1'h0)]})));
            end
          reg99 <= $unsigned(reg95[(1'h1):(1'h1)]);
          reg100 <= reg99[(2'h2):(1'h1)];
        end
      else
        begin
          if (reg100)
            begin
              reg94 <= reg96;
              reg95 <= $signed((~|((reg96 <= (wire92 ? (8'hbf) : wire93)) ?
                  reg94 : $signed($signed(wire89)))));
              reg96 <= (((reg98[(5'h10):(4'h8)] == $unsigned(reg99)) & ({$unsigned((8'hbd)),
                      ((8'hb1) == wire90)} >= (wire91 ?
                      (reg98 + wire93) : wire91))) ?
                  wire90 : wire89);
              reg97 <= reg95;
            end
          else
            begin
              reg94 <= {$signed(($signed(((8'ha5) & wire90)) ?
                      (~&reg99[(2'h2):(2'h2)]) : wire92[(2'h2):(2'h2)]))};
              reg95 <= (~|reg100[(1'h1):(1'h1)]);
              reg96 <= (+$unsigned($signed({wire92})));
              reg97 <= wire93;
            end
        end
      reg101 <= $signed($unsigned(((!(^~wire91)) ?
          reg94[(2'h3):(2'h2)] : wire91[(2'h2):(2'h2)])));
      reg102 <= $signed((|$signed({$signed(reg96)})));
      reg103 <= $unsigned(wire93);
      reg104 <= ((reg100 ^~ {reg102, $signed(wire90[(3'h6):(1'h0)])}) ?
          reg94 : {reg96, reg94});
    end
  assign wire105 = wire90[(1'h0):(1'h0)];
  assign wire106 = reg98[(4'hd):(3'h7)];
  assign wire107 = wire90;
  assign wire108 = (wire89[(1'h0):(1'h0)] ? wire90 : reg94[(1'h1):(1'h1)]);
  assign wire109 = reg94;
  assign wire110 = $signed((~|$unsigned(((wire107 > reg97) ?
                       (+reg99) : $signed(wire109)))));
  assign wire111 = {(((reg94 >> (wire110 == (8'h9f))) ^~ ($unsigned((8'hb0)) ?
                               (reg101 | reg101) : (reg97 >>> wire106))) ?
                           $unsigned((wire91 << $unsigned(wire109))) : (&wire109))};
  assign wire112 = $unsigned((($unsigned($signed(wire93)) > wire92[(1'h1):(1'h0)]) ~^ reg95[(2'h3):(1'h0)]));
endmodule

module module26
#(parameter param51 = (!(|((+((8'h9f) ? (8'hab) : (7'h42))) >>> (((7'h43) ? (8'hab) : (8'ha9)) ? ((8'hb2) >> (8'hb5)) : (~&(8'hac)))))))
(y, clk, wire30, wire29, wire28, wire27);
  output wire [(32'hba):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire30;
  input wire [(4'hd):(1'h0)] wire29;
  input wire [(5'h10):(1'h0)] wire28;
  input wire signed [(4'h9):(1'h0)] wire27;
  wire [(4'ha):(1'h0)] wire50;
  wire [(4'hc):(1'h0)] wire49;
  wire signed [(3'h7):(1'h0)] wire48;
  wire signed [(4'hf):(1'h0)] wire33;
  wire signed [(4'hf):(1'h0)] wire32;
  wire [(2'h3):(1'h0)] wire31;
  reg [(3'h4):(1'h0)] reg47 = (1'h0);
  reg [(2'h2):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg43 = (1'h0);
  reg [(3'h7):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg41 = (1'h0);
  reg [(2'h2):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg37 = (1'h0);
  reg signed [(4'he):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg35 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg34 = (1'h0);
  assign y = {wire50,
                 wire49,
                 wire48,
                 wire33,
                 wire32,
                 wire31,
                 reg47,
                 reg46,
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
  assign wire31 = wire28[(2'h3):(1'h1)];
  assign wire32 = ((~^{$signed($signed(wire31)), wire31[(2'h2):(1'h0)]}) ?
                      $signed((((wire29 ? wire27 : wire27) > (wire31 ?
                          wire27 : wire28)) ~^ wire31[(2'h2):(1'h0)])) : {wire27});
  assign wire33 = (~|wire31[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      if ((wire29[(1'h0):(1'h0)] ?
          wire32[(4'hf):(4'he)] : ({$signed((wire33 > wire32))} <= $unsigned((((8'hbb) ?
                  wire28 : wire30) ?
              (wire28 ? wire33 : (8'haf)) : (wire28 < wire30))))))
        begin
          reg34 <= wire31[(1'h0):(1'h0)];
          if ($signed($unsigned($signed(wire28[(3'h5):(2'h3)]))))
            begin
              reg35 <= $unsigned(wire29[(1'h0):(1'h0)]);
              reg36 <= wire30;
            end
          else
            begin
              reg35 <= wire32;
            end
        end
      else
        begin
          if ($unsigned($signed((wire27[(3'h5):(1'h0)] > (reg35[(1'h0):(1'h0)] ?
              (wire27 + reg35) : (wire29 && (8'h9f)))))))
            begin
              reg34 <= ((|(($signed(wire32) ?
                  (8'ha0) : wire27[(3'h4):(2'h3)]) + $unsigned((reg34 ?
                  wire31 : wire29)))) != (wire28[(2'h3):(1'h0)] ?
                  (wire30 ?
                      (~&(reg35 ?
                          wire30 : wire32)) : $signed(reg35)) : $unsigned({$unsigned(reg36)})));
              reg35 <= reg35[(3'h5):(1'h0)];
              reg36 <= $unsigned((~($unsigned((wire33 ?
                  reg35 : reg35)) <<< $signed((reg35 ? wire28 : wire32)))));
            end
          else
            begin
              reg34 <= reg34[(1'h1):(1'h1)];
              reg35 <= $unsigned(reg36);
              reg36 <= (~^(-((+$signed(reg34)) >= wire27[(3'h5):(2'h2)])));
              reg37 <= (~|(^~{($signed(wire31) < wire28[(4'hc):(4'h9)])}));
            end
          reg38 <= $unsigned($signed($unsigned((wire33[(2'h2):(1'h1)] ?
              wire29[(4'h8):(3'h5)] : $signed((8'hb7))))));
          if ({((+((reg36 ? reg36 : reg36) ?
                      ((8'hbe) ? wire27 : wire32) : wire32[(3'h5):(2'h2)])) ?
                  {(wire33[(4'hd):(3'h7)] * (reg37 + reg38))} : $unsigned((wire33[(3'h4):(2'h3)] ?
                      wire28[(4'hd):(4'hb)] : $signed(wire33))))})
            begin
              reg39 <= ((|(8'hba)) < reg35);
              reg40 <= (wire33[(4'hd):(4'hb)] - (($unsigned($signed((8'hab))) ?
                      (~&(|reg37)) : reg35[(4'ha):(2'h3)]) ?
                  (reg35[(4'he):(4'h8)] * $signed((reg38 | wire32))) : ((~&$signed(wire30)) ?
                      (8'hbe) : $signed((+reg39)))));
              reg41 <= wire29;
              reg42 <= ($signed((((^reg34) ^ (~reg40)) ^~ reg35)) ?
                  {$unsigned(wire27[(3'h7):(1'h1)])} : reg36);
              reg43 <= (8'ha7);
            end
          else
            begin
              reg39 <= reg35;
              reg40 <= reg40[(1'h1):(1'h1)];
              reg41 <= (((~&wire31[(2'h3):(1'h0)]) ?
                      (((reg38 ? wire33 : wire27) ?
                              wire28[(4'h9):(2'h3)] : (reg42 ?
                                  (8'hb4) : reg43)) ?
                          $unsigned($unsigned(wire32)) : reg38[(1'h0):(1'h0)]) : (8'hab)) ?
                  (reg40 ?
                      wire33[(3'h6):(3'h5)] : reg43[(4'hc):(3'h4)]) : ((!($signed((8'h9c)) * $signed(reg39))) ?
                      $unsigned(((~|(8'haa)) < (reg42 << wire28))) : wire27[(3'h5):(2'h2)]));
            end
          reg44 <= reg43;
          reg45 <= ((!$signed($signed((8'ha4)))) ?
              $unsigned((reg39[(1'h1):(1'h0)] == {$signed(reg43),
                  $signed(reg43)})) : (~|$signed({{(8'ha9)},
                  (wire32 * reg40)})));
        end
      reg46 <= $unsigned(reg37);
      reg47 <= (reg39 ? reg46[(1'h0):(1'h0)] : wire32);
    end
  assign wire48 = $unsigned({reg44, reg34[(2'h2):(1'h1)]});
  assign wire49 = ($signed($unsigned($signed(wire27[(3'h5):(2'h3)]))) ?
                      reg43[(4'hc):(1'h1)] : ($signed($signed((reg43 ?
                          reg37 : wire29))) <<< wire32));
  assign wire50 = {{(reg44[(5'h12):(4'hf)] || (reg39 + (-reg42)))}, (~|wire30)};
endmodule

module module127
#(parameter param144 = {(-(8'hb0))})
(y, clk, wire131, wire130, wire129, wire128);
  output wire [(32'h99):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire131;
  input wire signed [(4'hb):(1'h0)] wire130;
  input wire [(3'h4):(1'h0)] wire129;
  input wire signed [(4'hf):(1'h0)] wire128;
  wire signed [(4'he):(1'h0)] wire143;
  wire [(3'h4):(1'h0)] wire142;
  wire [(4'h9):(1'h0)] wire141;
  wire [(3'h6):(1'h0)] wire140;
  wire signed [(4'hb):(1'h0)] wire134;
  wire [(2'h3):(1'h0)] wire133;
  wire [(5'h15):(1'h0)] wire132;
  reg signed [(5'h14):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg138 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg136 = (1'h0);
  reg [(4'he):(1'h0)] reg135 = (1'h0);
  assign y = {wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire134,
                 wire133,
                 wire132,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 (1'h0)};
  assign wire132 = wire128;
  assign wire133 = wire131[(4'h8):(3'h4)];
  assign wire134 = $signed($unsigned(($unsigned($signed((8'hb7))) - $unsigned(wire132))));
  always
    @(posedge clk) begin
      reg135 <= $signed($unsigned(wire133[(2'h3):(2'h3)]));
      reg136 <= $signed((!$unsigned(((wire129 ~^ (8'hb4)) ?
          (reg135 ? wire132 : wire128) : wire132))));
      if ($signed($signed(reg135[(4'hb):(4'hb)])))
        begin
          reg137 <= $unsigned($signed({((reg135 - (8'hb0)) > reg135[(4'hd):(4'hd)]),
              (~&(-wire130))}));
          reg138 <= (^~(8'h9d));
        end
      else
        begin
          reg137 <= $unsigned($signed(reg136[(2'h2):(1'h1)]));
          reg138 <= reg135[(1'h1):(1'h1)];
        end
      reg139 <= wire133[(1'h1):(1'h0)];
    end
  assign wire140 = wire129[(3'h4):(1'h0)];
  assign wire141 = ($unsigned($unsigned(wire134)) ?
                       ((+(wire140[(2'h2):(2'h2)] ?
                           (wire130 >> wire128) : (wire132 != wire129))) != reg137) : {wire133[(1'h1):(1'h1)],
                           $unsigned(((&wire140) == (reg137 ?
                               wire128 : wire130)))});
  assign wire142 = ((wire141 ? wire131 : reg139[(2'h2):(1'h1)]) ?
                       (reg135 ?
                           wire134[(3'h4):(1'h0)] : $unsigned(reg138)) : (~$unsigned(reg136)));
  assign wire143 = $unsigned((reg138 || (~((&wire142) ?
                       reg136 : wire132[(4'h8):(4'h8)]))));
endmodule
