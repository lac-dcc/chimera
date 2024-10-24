module top
#(parameter param52 = (~|(^~(7'h40))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h130):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire51;
  wire [(4'h8):(1'h0)] wire50;
  wire [(3'h6):(1'h0)] wire49;
  wire signed [(5'h10):(1'h0)] wire48;
  wire signed [(2'h3):(1'h0)] wire47;
  wire signed [(5'h11):(1'h0)] wire46;
  wire signed [(5'h13):(1'h0)] wire45;
  wire [(3'h6):(1'h0)] wire37;
  wire [(5'h11):(1'h0)] wire36;
  wire signed [(5'h14):(1'h0)] wire35;
  wire [(4'he):(1'h0)] wire34;
  wire signed [(4'hd):(1'h0)] wire29;
  wire signed [(3'h5):(1'h0)] wire28;
  wire signed [(4'h8):(1'h0)] wire27;
  wire signed [(4'he):(1'h0)] wire25;
  reg [(2'h2):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg43 = (1'h0);
  reg [(3'h7):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg41 = (1'h0);
  reg [(5'h15):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg39 = (1'h0);
  reg [(2'h3):(1'h0)] reg38 = (1'h0);
  reg [(5'h14):(1'h0)] reg33 = (1'h0);
  reg [(4'hf):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg30 = (1'h0);
  assign y = {wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire29,
                 wire28,
                 wire27,
                 wire25,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 (1'h0)};
  module4 #() modinst26 (wire25, clk, wire0, wire3, wire2, wire1, (8'hb6));
  assign wire27 = {wire0[(5'h12):(2'h3)], wire25};
  assign wire28 = (wire2 ?
                      ($unsigned($signed($signed(wire25))) <<< (((wire3 ?
                          wire1 : wire0) != {wire2}) > wire27)) : wire1);
  assign wire29 = $signed((($unsigned(wire28[(3'h5):(3'h4)]) ?
                          (wire25 ?
                              (+wire0) : wire3) : $unsigned($unsigned(wire28))) ?
                      (wire3 ?
                          (~&$signed(wire2)) : (wire1[(3'h5):(2'h2)] ?
                              wire0 : (8'hbc))) : $signed($unsigned({wire25}))));
  always
    @(posedge clk) begin
      reg30 <= (&((({wire28, wire3} && wire29) ?
              (8'hac) : (~|(wire3 < wire27))) ?
          (wire2 ?
              (8'h9e) : (wire28 <= {wire1,
                  wire27})) : $signed($unsigned((wire25 ? wire25 : wire3)))));
      reg31 <= wire0[(5'h11):(4'hd)];
      reg32 <= (~|wire0[(4'ha):(3'h7)]);
      reg33 <= {reg30[(4'h8):(2'h2)], wire29};
    end
  assign wire34 = ($unsigned($signed((reg30 ?
                          $unsigned(reg33) : $signed(wire0)))) ?
                      {$unsigned(((!wire28) ^~ (wire3 ? wire25 : wire0))),
                          ($unsigned({wire3, wire29}) >> ({wire3,
                              (8'hbb)} * wire27))} : (wire0[(5'h13):(4'h9)] ?
                          $unsigned({$unsigned(wire2)}) : (~|($signed(reg31) * wire0))));
  assign wire35 = reg32[(3'h5):(2'h3)];
  assign wire36 = ({reg33[(2'h3):(2'h3)]} ?
                      (wire35 >> $unsigned(((wire35 ? reg30 : wire1) ?
                          (wire1 < wire0) : wire2))) : ((~^$signed(wire34)) >>> (reg33 == (~(wire35 * wire27)))));
  assign wire37 = reg31[(4'hc):(4'h8)];
  always
    @(posedge clk) begin
      reg38 <= ($signed(wire3[(1'h1):(1'h1)]) ?
          (-(wire25 ?
              $signed($unsigned(wire28)) : ($unsigned(wire25) ?
                  $signed(wire34) : $signed(wire0)))) : wire0[(4'he):(4'he)]);
      reg39 <= wire28[(1'h1):(1'h0)];
      if ($signed($signed((|$unsigned((reg30 - (8'ha1)))))))
        begin
          reg40 <= $unsigned((wire1 ?
              wire0 : (^~(wire1[(1'h0):(1'h0)] ^~ (-wire37)))));
          reg41 <= ((|(~|{$signed(wire37), wire37[(1'h1):(1'h0)]})) ?
              (7'h40) : $signed($signed($signed(reg40[(3'h5):(1'h1)]))));
          reg42 <= (wire27[(1'h0):(1'h0)] + ($signed(reg39) >>> reg31));
          if ($signed((wire2 ~^ $signed($unsigned(wire35)))))
            begin
              reg43 <= $signed((($signed((wire36 ? reg41 : reg42)) ?
                  $signed(reg39) : (((7'h42) ? wire37 : wire1) ?
                      wire28[(1'h0):(1'h0)] : (wire2 & wire35))) <<< $unsigned(wire34[(1'h1):(1'h0)])));
            end
          else
            begin
              reg43 <= ((($unsigned(((8'hb9) >>> reg33)) ?
                      (wire1 & (reg39 ~^ wire3)) : wire35) >>> reg32[(4'h8):(1'h0)]) ?
                  {wire2,
                      $unsigned(wire34)} : {$unsigned($signed(reg41[(1'h0):(1'h0)]))});
            end
        end
      else
        begin
          reg40 <= $unsigned(reg31[(4'h9):(4'h8)]);
          reg41 <= (wire29[(4'h9):(1'h0)] && $signed(({(|(8'hba)), reg42} ?
              wire1 : (~&(reg40 ^~ (8'hba))))));
          reg42 <= {$signed((-($unsigned(wire27) ?
                  ((8'hb0) ? (8'hb4) : wire37) : {wire0})))};
        end
      reg44 <= (&(reg39 - $unsigned(reg30[(3'h5):(3'h4)])));
    end
  assign wire45 = wire2;
  assign wire46 = reg41;
  assign wire47 = (reg31 ?
                      wire37[(1'h0):(1'h0)] : ((^~$signed(reg44)) ?
                          $signed((8'hb6)) : {$unsigned((wire35 ?
                                  wire46 : reg42)),
                              (~^(reg33 ? wire36 : reg41))}));
  assign wire48 = wire37;
  assign wire49 = {$unsigned($signed(wire35))};
  assign wire50 = $signed($signed({(reg33[(4'h8):(1'h1)] ?
                          wire0[(1'h0):(1'h0)] : $signed(wire2))}));
  assign wire51 = reg33;
endmodule

module module4  (y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h9d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire9;
  input wire signed [(4'h9):(1'h0)] wire8;
  input wire [(4'h9):(1'h0)] wire7;
  input wire [(4'ha):(1'h0)] wire6;
  input wire [(3'h6):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire15;
  wire [(2'h3):(1'h0)] wire14;
  wire signed [(5'h14):(1'h0)] wire13;
  wire [(4'ha):(1'h0)] wire12;
  wire [(4'h9):(1'h0)] wire11;
  wire [(4'hf):(1'h0)] wire10;
  reg [(4'hf):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg22 = (1'h0);
  reg [(3'h4):(1'h0)] reg21 = (1'h0);
  reg [(4'he):(1'h0)] reg20 = (1'h0);
  reg [(5'h10):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg17 = (1'h0);
  reg [(3'h6):(1'h0)] reg16 = (1'h0);
  assign y = {wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 (1'h0)};
  assign wire10 = wire5;
  assign wire11 = wire8;
  assign wire12 = ((~|(~^(-((8'hb7) ? (7'h44) : wire7)))) + (8'h9c));
  assign wire13 = (8'ha8);
  assign wire14 = ($unsigned((^$signed((^~wire5)))) | (^~$signed((wire8 - $unsigned(wire6)))));
  assign wire15 = ((!wire7[(4'h9):(1'h0)]) ?
                      ((wire7[(3'h5):(2'h3)] || $unsigned(wire7)) ^~ (($signed(wire14) >= (wire13 && wire14)) ?
                          wire11[(3'h7):(1'h0)] : (|(wire7 != wire6)))) : ((8'hb6) >= wire14));
  always
    @(posedge clk) begin
      reg16 <= wire6;
      reg17 <= wire13[(4'he):(2'h2)];
      if ((~&$unsigned(wire5[(1'h1):(1'h0)])))
        begin
          reg18 <= wire5[(2'h2):(1'h1)];
        end
      else
        begin
          reg18 <= $unsigned($unsigned((wire8[(3'h6):(2'h2)] ?
              $signed($unsigned(reg16)) : $unsigned({wire13, wire5}))));
          reg19 <= ((((8'h9c) >= (!(+wire8))) >> {$signed($signed(wire11))}) - $signed((^~wire10[(4'hb):(4'ha)])));
          reg20 <= (wire13[(5'h12):(3'h5)] ? (!$unsigned(reg17)) : {wire12});
          reg21 <= $signed(wire11);
          reg22 <= reg18[(3'h7):(2'h3)];
        end
      reg23 <= $unsigned($signed({$unsigned($signed(reg17))}));
    end
  always
    @(posedge clk) begin
      reg24 <= {{($signed($signed(wire11)) ?
                  {(^wire5),
                      (wire10 ~^ (7'h40))} : ($unsigned(reg23) & wire14)),
              {((~reg16) ? wire12[(4'ha):(4'h8)] : (wire5 ? wire7 : wire5)),
                  $unsigned((reg23 >> wire6))}},
          $unsigned($signed(((+wire11) ~^ {wire7})))};
    end
endmodule
