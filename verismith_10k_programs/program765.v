module top
#(parameter param49 = (^((~&((~&(8'hb1)) ~^ ((8'hbf) ? (8'hb1) : (8'hba)))) ? ((((8'haf) << (8'hab)) ? ((8'ha6) ^~ (8'had)) : ((8'ha5) ? (8'ha2) : (8'haf))) == ((~(8'h9c)) ~^ ((8'haa) ? (8'haa) : (8'hb5)))) : (^(+((8'hb3) ? (8'haa) : (8'hbc)))))), 
parameter param50 = {(8'hab), (8'ha3)})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h178):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire0;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire4;
  wire [(3'h4):(1'h0)] wire48;
  wire [(3'h6):(1'h0)] wire36;
  wire signed [(5'h11):(1'h0)] wire28;
  wire signed [(4'hc):(1'h0)] wire27;
  wire signed [(4'hb):(1'h0)] wire26;
  wire signed [(5'h13):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire7;
  wire [(5'h12):(1'h0)] wire8;
  wire signed [(4'hf):(1'h0)] wire20;
  reg signed [(4'hc):(1'h0)] reg47 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg46 = (1'h0);
  reg [(4'hb):(1'h0)] reg45 = (1'h0);
  reg [(4'h8):(1'h0)] reg44 = (1'h0);
  reg [(5'h11):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg42 = (1'h0);
  reg [(2'h2):(1'h0)] reg41 = (1'h0);
  reg [(5'h14):(1'h0)] reg40 = (1'h0);
  reg [(4'hc):(1'h0)] reg39 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg35 = (1'h0);
  reg [(5'h15):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg33 = (1'h0);
  reg [(3'h4):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg29 = (1'h0);
  reg [(3'h5):(1'h0)] reg25 = (1'h0);
  reg [(5'h10):(1'h0)] reg24 = (1'h0);
  reg [(2'h3):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg22 = (1'h0);
  assign y = {wire48,
                 wire36,
                 wire28,
                 wire27,
                 wire26,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire20,
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
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 (1'h0)};
  assign wire5 = wire3[(5'h10):(4'hc)];
  assign wire6 = (&(!($signed($unsigned(wire4)) ?
                     $signed((&wire5)) : ($signed(wire4) ? wire3 : (-wire3)))));
  assign wire7 = (wire2 ?
                     ($signed($unsigned(wire3[(4'hd):(1'h1)])) ?
                         $signed(((8'ha1) || wire5[(2'h3):(1'h1)])) : $signed(wire1)) : $unsigned((|wire0[(1'h1):(1'h0)])));
  assign wire8 = {(((wire6 ? (~^wire4) : (wire4 | wire0)) ?
                             $signed(wire7) : (((7'h44) ?
                                 wire6 : wire6) ~^ $signed(wire0))) ?
                         $unsigned((!{wire5})) : (^~{$signed(wire1)}))};
  module9 #() modinst21 (.wire13(wire3), .wire14(wire8), .y(wire20), .wire12(wire2), .wire11(wire5), .clk(clk), .wire10(wire1));
  always
    @(posedge clk) begin
      reg22 <= ((|$unsigned($unsigned((wire2 ? wire4 : wire20)))) ?
          ($unsigned($unsigned({wire0})) | wire1) : ($unsigned((~&wire4[(3'h7):(3'h7)])) ?
              (~|{(wire20 * wire0),
                  wire2[(3'h7):(3'h7)]}) : wire2[(4'hc):(2'h2)]));
      reg23 <= (wire6 ~^ $unsigned(wire20[(3'h4):(1'h0)]));
      reg24 <= $unsigned($signed($unsigned(((8'hbd) ?
          ((8'ha8) < wire8) : (8'hbf)))));
      reg25 <= (8'ha3);
    end
  assign wire26 = $unsigned({($signed((-wire5)) ?
                          (8'hae) : $unsigned((+wire2)))});
  assign wire27 = $signed(wire3);
  assign wire28 = (wire3 * {(wire1 ?
                          $signed((~|wire5)) : $unsigned($signed(wire6)))});
  always
    @(posedge clk) begin
      reg29 <= ($unsigned({{{reg22, wire8}, wire20},
          ((wire27 ?
              (8'haa) : (8'hbb)) >= $unsigned(wire20))}) && ($signed(wire0[(2'h3):(2'h2)]) ?
          {$unsigned((wire27 << wire26))} : (~|(&(7'h42)))));
      if ($signed($unsigned(wire2[(4'he):(3'h5)])))
        begin
          reg30 <= {wire28};
          reg31 <= ({$signed($signed(wire27[(1'h0):(1'h0)]))} <= (((|$signed(wire2)) ?
              reg23[(2'h2):(2'h2)] : wire6) ~^ ({$signed(wire27),
                  (wire6 ? wire8 : (8'hab))} ?
              (!(wire5 <<< wire1)) : ((~&wire2) << (~^wire2)))));
          reg32 <= $unsigned($unsigned($signed(reg23[(2'h2):(2'h2)])));
          reg33 <= $signed((~&{(^$signed(wire7))}));
          reg34 <= $signed(wire26);
        end
      else
        begin
          reg30 <= {wire4[(4'hf):(4'h9)], wire8[(1'h0):(1'h0)]};
          reg31 <= wire6[(3'h4):(1'h1)];
          reg32 <= (8'hbf);
        end
      reg35 <= (~|wire1[(4'hd):(1'h0)]);
    end
  assign wire36 = $signed($signed(wire20[(1'h1):(1'h0)]));
  always
    @(posedge clk) begin
      reg37 <= ($signed((!((+reg31) - reg31))) ?
          $unsigned($signed(wire7)) : wire6[(5'h10):(2'h2)]);
      if (reg34[(4'hd):(3'h7)])
        begin
          reg38 <= $signed({$unsigned(($signed(wire28) ?
                  $signed(wire27) : $signed(reg24))),
              (~(|(reg22 >>> reg32)))});
        end
      else
        begin
          reg38 <= (wire7 ?
              ((&((reg23 * wire26) ?
                  (reg33 - wire4) : (wire28 ?
                      wire8 : reg29))) + reg38) : (reg25[(3'h4):(3'h4)] ?
                  (~&(~^$signed((8'ha2)))) : (((reg23 ?
                          (8'ha6) : wire27) * $signed(reg35)) ?
                      (~^$unsigned(reg35)) : $signed($unsigned(wire26)))));
        end
      if (wire7)
        begin
          reg39 <= wire4;
          reg40 <= reg22;
        end
      else
        begin
          reg39 <= reg33;
          reg40 <= (((~|($signed((8'h9d)) ? (+(8'h9c)) : $unsigned((8'hbe)))) ?
              $signed($signed($signed(wire1))) : wire2[(2'h3):(2'h3)]) ^~ (($unsigned(reg35) || $unsigned((^~wire26))) ?
              (^(wire6[(4'hf):(3'h6)] - (reg33 != reg23))) : (reg25 ?
                  $unsigned($signed(reg38)) : $unsigned(reg37))));
          reg41 <= (~&reg22[(3'h6):(2'h3)]);
          reg42 <= wire2[(5'h12):(3'h7)];
        end
      if (wire36[(1'h0):(1'h0)])
        begin
          reg43 <= $signed($signed(reg39));
          reg44 <= (|($unsigned(reg43) * (((!wire5) ?
                  (reg37 + reg40) : ((8'hb1) ? reg32 : reg42)) ?
              $unsigned($signed(reg41)) : {(8'hac)})));
          reg45 <= {(^$unsigned($signed((wire4 < wire27))))};
        end
      else
        begin
          if ($signed((!(+(8'ha1)))))
            begin
              reg43 <= $signed($signed(wire27));
              reg44 <= wire20[(3'h6):(2'h3)];
              reg45 <= ((^reg42) - ($unsigned(($signed(wire6) || $unsigned(wire28))) ?
                  $signed($unsigned(((7'h43) < wire36))) : (8'ha2)));
            end
          else
            begin
              reg43 <= $unsigned(wire20);
              reg44 <= reg42;
            end
          reg46 <= $unsigned((|{reg33,
              {(reg45 ? wire5 : reg31), $signed(wire0)}}));
        end
      reg47 <= {($unsigned($signed((~^wire27))) ?
              ((wire2 ?
                  $signed(wire5) : ((8'h9f) & reg45)) & ((~(8'h9f)) + wire7)) : reg44[(2'h2):(1'h1)])};
    end
  assign wire48 = wire3;
endmodule

module module9  (y, clk, wire14, wire13, wire12, wire11, wire10);
  output wire [(32'h2b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire14;
  input wire signed [(3'h4):(1'h0)] wire13;
  input wire signed [(5'h13):(1'h0)] wire12;
  input wire signed [(3'h7):(1'h0)] wire11;
  input wire signed [(4'hf):(1'h0)] wire10;
  wire signed [(5'h15):(1'h0)] wire19;
  wire signed [(3'h5):(1'h0)] wire18;
  wire signed [(3'h5):(1'h0)] wire17;
  wire [(4'h9):(1'h0)] wire16;
  wire signed [(2'h2):(1'h0)] wire15;
  assign y = {wire19, wire18, wire17, wire16, wire15, (1'h0)};
  assign wire15 = $signed((~^{(-(wire14 ? wire11 : wire11))}));
  assign wire16 = ($signed((wire13[(1'h1):(1'h1)] ?
                      ((wire10 ? wire11 : wire15) ?
                          $unsigned(wire11) : $unsigned(wire11)) : ((wire11 <<< wire10) ?
                          $unsigned(wire10) : (^wire14)))) << {(-$unsigned(wire15)),
                      (({wire10} > (+wire14)) ?
                          $unsigned((wire14 ?
                              (8'hb1) : wire11)) : ($signed((7'h42)) <= {wire14}))});
  assign wire17 = wire14[(3'h5):(1'h1)];
  assign wire18 = $unsigned(({$unsigned((7'h42))} ?
                      $signed(wire14[(1'h1):(1'h0)]) : ($signed({wire16}) + $signed((wire15 ^~ (8'ha4))))));
  assign wire19 = (-wire14);
endmodule
