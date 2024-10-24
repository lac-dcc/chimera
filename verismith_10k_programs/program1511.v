module top
#(parameter param74 = (!(((+((8'hbd) | (8'ha1))) ? ({(8'h9e)} ? (~|(8'haa)) : (|(8'hb3))) : (((8'ha1) >> (8'hbd)) ? ((8'hb2) ? (8'hb4) : (8'hb1)) : (~&(8'ha0)))) ? (|(-((8'ha8) ~^ (8'hae)))) : (8'ha6))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hee):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire0;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire3;
  wire [(4'ha):(1'h0)] wire73;
  wire [(5'h12):(1'h0)] wire72;
  wire signed [(5'h15):(1'h0)] wire4;
  wire signed [(3'h5):(1'h0)] wire54;
  reg signed [(5'h12):(1'h0)] reg71 = (1'h0);
  reg [(5'h10):(1'h0)] reg70 = (1'h0);
  reg [(4'h8):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg67 = (1'h0);
  reg signed [(4'he):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg65 = (1'h0);
  reg [(2'h2):(1'h0)] reg64 = (1'h0);
  reg [(4'h8):(1'h0)] reg63 = (1'h0);
  reg [(4'h9):(1'h0)] reg62 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg60 = (1'h0);
  reg [(5'h14):(1'h0)] reg59 = (1'h0);
  reg [(5'h15):(1'h0)] reg58 = (1'h0);
  reg [(4'hb):(1'h0)] reg57 = (1'h0);
  reg [(5'h10):(1'h0)] reg56 = (1'h0);
  assign y = {wire73,
                 wire72,
                 wire4,
                 wire54,
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
                 reg56,
                 (1'h0)};
  assign wire4 = $signed(wire1[(2'h2):(1'h1)]);
  module5 #() modinst55 (wire54, clk, wire2, wire3, wire4, wire1, wire0);
  always
    @(posedge clk) begin
      if (($signed($signed($unsigned((!wire2)))) <<< {(wire54[(3'h4):(1'h0)] && (^~$unsigned(wire4)))}))
        begin
          reg56 <= (~^((wire4 ?
                  (&wire2) : $unsigned((wire0 ? (8'hb7) : (8'hb9)))) ?
              $unsigned((!wire0[(4'h8):(1'h0)])) : (({wire3,
                      wire0} == (8'ha0)) ?
                  (wire2[(3'h7):(3'h4)] + (~(8'ha3))) : $unsigned((8'hbf)))));
          reg57 <= reg56;
          reg58 <= {(!(wire1[(3'h6):(2'h2)] + $signed((reg56 ^ wire54))))};
        end
      else
        begin
          reg56 <= $unsigned($unsigned($signed($unsigned($unsigned(reg56)))));
        end
      if ($unsigned({reg58}))
        begin
          if ($unsigned(wire54[(1'h0):(1'h0)]))
            begin
              reg59 <= ((($unsigned($unsigned(reg56)) != ($signed(reg56) ?
                          (wire54 >> wire1) : wire54[(1'h1):(1'h0)])) ?
                      {wire54} : ((~(reg56 | reg56)) ?
                          wire0 : $signed($signed(wire2)))) ?
                  {(((wire54 ? (7'h42) : wire2) ? (reg56 * reg58) : wire4) ?
                          ((wire0 >>> wire54) ?
                              (+wire54) : wire0[(2'h3):(1'h1)]) : wire1)} : (($unsigned($unsigned(wire0)) ?
                      (wire54 < $unsigned(wire54)) : (~&wire4)) || (8'hb9)));
              reg60 <= ((wire2 && (($unsigned(wire1) * $unsigned(reg59)) + wire1)) ?
                  reg56 : ($unsigned({(!reg56)}) ?
                      ((^~(|wire4)) ?
                          (((8'hbf) && reg56) ?
                              $unsigned(reg56) : (|(8'ha3))) : (|$unsigned(wire2))) : reg58[(5'h11):(4'h9)]));
              reg61 <= wire3;
              reg62 <= (^~(wire4 ?
                  (~&(reg58 ^ (wire4 + (8'ha0)))) : $unsigned($unsigned(wire4))));
              reg63 <= {(~^reg61),
                  $signed({(^(wire4 + wire2)),
                      ($unsigned(reg59) << $signed(wire1))})};
            end
          else
            begin
              reg59 <= wire4;
            end
          if (((((^~reg59[(2'h3):(2'h2)]) ?
                  reg57[(1'h1):(1'h0)] : wire0[(3'h7):(3'h5)]) ?
              ((~|(wire54 ? reg57 : wire0)) && (wire54[(1'h0):(1'h0)] ?
                  (+reg56) : {reg61})) : wire3) ~^ reg56[(4'h8):(3'h4)]))
            begin
              reg64 <= reg57;
              reg65 <= wire54;
              reg66 <= $signed((^(({(8'hab), reg56} ?
                  {wire0, reg65} : (wire54 + reg58)) | ($signed(reg64) ?
                  $signed(reg58) : (reg61 != wire0)))));
              reg67 <= (reg60 ? (~wire2[(3'h5):(1'h1)]) : reg66);
            end
          else
            begin
              reg64 <= wire1;
              reg65 <= wire4;
              reg66 <= reg59[(2'h3):(2'h2)];
              reg67 <= (+(~|$signed(reg61)));
              reg68 <= reg57[(4'h8):(3'h7)];
            end
          reg69 <= {$signed(reg58[(3'h7):(3'h7)]), wire4};
        end
      else
        begin
          reg59 <= $unsigned(reg67);
          reg60 <= reg57;
        end
      reg70 <= ($unsigned(((-reg64) ?
          $unsigned((reg59 <= reg68)) : reg66[(2'h2):(2'h2)])) > (8'hb8));
      reg71 <= (8'ha3);
    end
  assign wire72 = wire3;
  assign wire73 = reg62[(1'h1):(1'h1)];
endmodule

module module5
#(parameter param53 = (~|(((^~((8'hac) ? (8'hb9) : (8'ha1))) ? ((~&(7'h44)) ? (^~(8'h9c)) : ((7'h40) > (7'h41))) : (((8'hbf) ? (8'hb2) : (8'had)) ? {(8'ha9)} : ((8'h9c) ? (8'hbb) : (8'hb4)))) && (~|(~((8'hb6) ~^ (8'ha0)))))))
(y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h15a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire6;
  input wire signed [(5'h11):(1'h0)] wire7;
  input wire [(5'h15):(1'h0)] wire8;
  input wire [(3'h6):(1'h0)] wire9;
  input wire [(4'hc):(1'h0)] wire10;
  wire [(2'h3):(1'h0)] wire38;
  wire [(5'h15):(1'h0)] wire36;
  wire [(5'h11):(1'h0)] wire35;
  wire [(5'h13):(1'h0)] wire34;
  wire signed [(4'h9):(1'h0)] wire33;
  wire [(4'hd):(1'h0)] wire32;
  wire signed [(5'h10):(1'h0)] wire31;
  wire signed [(3'h5):(1'h0)] wire30;
  wire signed [(4'he):(1'h0)] wire29;
  wire signed [(4'ha):(1'h0)] wire13;
  wire [(3'h7):(1'h0)] wire14;
  wire signed [(4'he):(1'h0)] wire27;
  reg [(4'hb):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg51 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg50 = (1'h0);
  reg [(2'h2):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg48 = (1'h0);
  reg [(4'hc):(1'h0)] reg47 = (1'h0);
  reg [(5'h14):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg45 = (1'h0);
  reg [(3'h5):(1'h0)] reg44 = (1'h0);
  reg [(3'h6):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg42 = (1'h0);
  reg [(5'h15):(1'h0)] reg41 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg40 = (1'h0);
  reg [(5'h13):(1'h0)] reg39 = (1'h0);
  reg [(3'h7):(1'h0)] reg37 = (1'h0);
  reg [(4'h9):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg11 = (1'h0);
  assign y = {wire38,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire13,
                 wire14,
                 wire27,
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
                 reg37,
                 reg12,
                 reg11,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg11 <= wire10[(4'hb):(3'h4)];
      reg12 <= $signed($signed(reg11[(5'h10):(3'h4)]));
    end
  assign wire13 = $unsigned((reg12 ?
                      reg11 : (&$unsigned(reg12[(2'h3):(1'h0)]))));
  assign wire14 = $unsigned(($signed(($signed(reg11) * reg12)) >>> reg12));
  module15 #() modinst28 (.wire16(wire9), .clk(clk), .wire19(wire8), .wire20(wire7), .wire17(wire6), .wire18(wire13), .y(wire27));
  assign wire29 = wire7;
  assign wire30 = $unsigned($signed(wire10[(2'h2):(1'h0)]));
  assign wire31 = $signed({wire9[(3'h6):(2'h2)],
                      {$signed(wire30[(3'h4):(2'h3)]), $signed(wire8)}});
  assign wire32 = $signed(wire14);
  assign wire33 = wire30[(3'h5):(1'h0)];
  assign wire34 = ((-reg12[(1'h0):(1'h0)]) || $signed($unsigned($signed(wire8[(5'h13):(4'he)]))));
  assign wire35 = $signed($unsigned(({(wire30 && wire34)} ?
                      $signed((wire10 ?
                          wire31 : wire8)) : $signed(wire9[(3'h4):(1'h1)]))));
  assign wire36 = ((|(~&((-(8'hb0)) ?
                      $unsigned(wire14) : $signed(wire6)))) ^~ {$unsigned(wire13[(3'h5):(1'h0)]),
                      reg11});
  always
    @(posedge clk) begin
      reg37 <= $unsigned(wire14[(3'h7):(1'h1)]);
    end
  assign wire38 = $signed(wire33);
  always
    @(posedge clk) begin
      if (wire36[(3'h5):(1'h0)])
        begin
          reg39 <= $signed($unsigned(wire29[(4'h8):(2'h2)]));
          reg40 <= reg37[(3'h6):(3'h6)];
          reg41 <= (-(wire13[(3'h5):(3'h5)] >>> (-(!(!wire30)))));
          reg42 <= (~&$unsigned(wire10[(4'hb):(3'h7)]));
        end
      else
        begin
          if ({$signed(reg39[(3'h5):(2'h3)])})
            begin
              reg39 <= $unsigned(((-(~(wire38 ^ reg12))) - (($unsigned(reg12) ?
                  (wire9 ?
                      wire36 : reg12) : (~|wire34)) <= wire38[(1'h1):(1'h1)])));
              reg40 <= (wire13 || (+$unsigned(($unsigned(wire30) ?
                  reg41 : $unsigned(wire36)))));
            end
          else
            begin
              reg39 <= reg42;
            end
          reg41 <= (!($unsigned($unsigned((&reg37))) ?
              (wire38 >> (reg39[(4'ha):(3'h4)] ?
                  wire31 : ((8'hb0) ? wire10 : (8'hb2)))) : (8'hb8)));
          reg42 <= $signed(($signed($unsigned(reg37[(2'h2):(1'h0)])) <<< wire29));
        end
      reg43 <= $signed(wire27[(2'h3):(2'h3)]);
      reg44 <= reg37[(2'h3):(1'h1)];
      reg45 <= $signed(wire33);
      if ($unsigned($signed(($unsigned($signed(reg40)) ?
          wire36 : (~|$unsigned(wire6))))))
        begin
          reg46 <= (((&$unsigned((8'hab))) ? reg11 : wire8) ?
              (~&$unsigned($unsigned(wire9[(3'h6):(3'h5)]))) : wire7[(2'h2):(1'h1)]);
          reg47 <= wire7;
          reg48 <= (~($signed((~$unsigned(reg44))) != (+$unsigned(reg39))));
          if (reg37)
            begin
              reg49 <= reg41;
              reg50 <= $signed($unsigned({wire9[(3'h4):(3'h4)],
                  $signed($signed(reg41))}));
              reg51 <= $unsigned($unsigned($unsigned(($signed(reg41) ?
                  wire14 : wire10[(3'h7):(3'h6)]))));
            end
          else
            begin
              reg49 <= (($unsigned($unsigned(wire30)) | (-reg48[(3'h4):(3'h4)])) ?
                  $unsigned($signed($signed($unsigned(wire30)))) : (wire30[(3'h4):(1'h1)] * $signed((8'h9f))));
            end
          reg52 <= (({{((8'ha8) | wire7)},
              (^$unsigned(wire8))} << $signed(((^~wire30) ?
              $signed(reg47) : wire30))) - reg43[(3'h6):(3'h5)]);
        end
      else
        begin
          reg46 <= (((~&((8'ha7) ?
              (8'hb9) : $signed(wire38))) << (($unsigned(reg41) >= wire29) ^ (^{reg44,
              reg37}))) * (wire9 == $signed((reg46[(5'h13):(4'hb)] ~^ (&wire9)))));
          reg47 <= $unsigned({(reg48[(4'hf):(4'h9)] && $unsigned((reg41 ^~ reg12)))});
        end
    end
endmodule

module module15  (y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h4c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire20;
  input wire signed [(5'h15):(1'h0)] wire19;
  input wire signed [(2'h2):(1'h0)] wire18;
  input wire [(4'h8):(1'h0)] wire17;
  input wire signed [(2'h3):(1'h0)] wire16;
  wire [(3'h7):(1'h0)] wire26;
  wire signed [(4'he):(1'h0)] wire25;
  wire signed [(4'he):(1'h0)] wire24;
  wire signed [(4'ha):(1'h0)] wire23;
  wire signed [(5'h14):(1'h0)] wire22;
  reg [(4'ha):(1'h0)] reg21 = (1'h0);
  assign y = {wire26, wire25, wire24, wire23, wire22, reg21, (1'h0)};
  always
    @(posedge clk) begin
      reg21 <= ($signed(wire19) << (($signed(wire17[(3'h5):(1'h0)]) >>> $signed(wire20)) << (~&((wire19 >>> wire19) ?
          (!wire17) : wire20))));
    end
  assign wire22 = (!{((wire20 | (~wire20)) ?
                          (((8'h9c) ?
                              wire19 : wire19) + (wire16 ^ wire16)) : {$unsigned(wire18),
                              $signed(wire19)})});
  assign wire23 = $signed(wire16);
  assign wire24 = wire19[(5'h11):(1'h0)];
  assign wire25 = wire16;
  assign wire26 = $unsigned(wire22[(3'h5):(3'h4)]);
endmodule
