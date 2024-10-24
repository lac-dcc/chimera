module top
#(parameter param45 = (((~^({(8'ha9)} ? (~|(8'hac)) : ((7'h44) <<< (8'hbf)))) ? (^(((8'hb8) ? (8'hb1) : (7'h41)) + {(8'hb7)})) : (+(((8'ha1) ? (7'h42) : (8'hb2)) * {(8'hb6)}))) ? (-{(!((8'had) + (8'hb5)))}) : {{(((8'hae) > (8'hae)) == ((8'h9e) ? (8'ha2) : (8'ha1))), {((8'hbc) >= (8'hab))}}}), 
parameter param46 = (|(&(((8'hb9) & (param45 ? (8'hb2) : param45)) ^ (^(7'h44))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h18f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire4;
  input wire [(4'hd):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire44;
  wire [(4'h8):(1'h0)] wire43;
  wire signed [(2'h2):(1'h0)] wire42;
  wire signed [(3'h6):(1'h0)] wire41;
  wire [(2'h2):(1'h0)] wire40;
  wire [(2'h2):(1'h0)] wire17;
  wire signed [(5'h14):(1'h0)] wire16;
  wire signed [(4'hf):(1'h0)] wire15;
  wire [(4'hb):(1'h0)] wire14;
  wire signed [(2'h3):(1'h0)] wire12;
  wire signed [(3'h7):(1'h0)] wire11;
  wire signed [(4'hd):(1'h0)] wire10;
  wire signed [(3'h6):(1'h0)] wire9;
  wire [(5'h15):(1'h0)] wire8;
  wire signed [(5'h10):(1'h0)] wire7;
  wire signed [(3'h6):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire5;
  reg [(4'hb):(1'h0)] reg39 = (1'h0);
  reg [(4'hd):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg37 = (1'h0);
  reg [(3'h4):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg35 = (1'h0);
  reg [(4'h8):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg32 = (1'h0);
  reg [(4'hd):(1'h0)] reg31 = (1'h0);
  reg [(5'h10):(1'h0)] reg30 = (1'h0);
  reg [(3'h4):(1'h0)] reg29 = (1'h0);
  reg [(2'h2):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg24 = (1'h0);
  reg [(3'h7):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg22 = (1'h0);
  reg signed [(4'he):(1'h0)] reg21 = (1'h0);
  reg [(5'h11):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg19 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg18 = (1'h0);
  reg [(3'h5):(1'h0)] reg13 = (1'h0);
  assign y = {wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
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
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg13,
                 (1'h0)};
  assign wire5 = (($unsigned({$signed((8'hb8))}) ?
                     $signed($signed(wire2)) : ((^wire2) ?
                         wire4[(4'hd):(2'h2)] : ($signed(wire3) ?
                             ((8'hb1) ~^ (8'hb0)) : (+wire1)))) >> (($signed(wire4) | (8'hb8)) >> $signed((wire2[(1'h0):(1'h0)] ?
                     (wire3 ? (8'hba) : (8'hb4)) : wire0[(4'h9):(3'h4)]))));
  assign wire6 = (^(wire0[(1'h1):(1'h1)] ?
                     ($signed(wire1[(2'h2):(1'h1)]) ?
                         wire4 : $signed((^~wire5))) : wire3[(4'h8):(2'h3)]));
  assign wire7 = wire4;
  assign wire8 = (8'hb6);
  assign wire9 = wire0[(4'hb):(2'h3)];
  assign wire10 = (!(($signed((wire1 ? wire6 : wire6)) - $signed({wire1})) ?
                      $unsigned(wire3) : (($signed((8'hbe)) ?
                          (wire4 ?
                              wire7 : wire9) : wire3[(4'ha):(4'h8)]) & wire7)));
  assign wire11 = $signed(((|wire10) ?
                      $signed({wire8[(2'h2):(2'h2)],
                          $signed(wire3)}) : ((|(wire6 ? wire6 : wire3)) ?
                          $unsigned((wire8 ?
                              wire5 : wire5)) : wire0[(2'h2):(1'h0)])));
  assign wire12 = (!(~&$unsigned(wire7)));
  always
    @(posedge clk) begin
      reg13 <= (8'h9f);
    end
  assign wire14 = ({$unsigned((~&$signed(wire8))),
                      (^~$unsigned($signed(wire8)))} & (+wire12[(1'h0):(1'h0)]));
  assign wire15 = (wire6 ?
                      wire7 : (|($signed((wire12 ? wire9 : wire6)) ?
                          (~|(wire11 ? (8'hba) : wire3)) : $signed((wire2 ?
                              wire9 : wire7)))));
  assign wire16 = ((8'hbf) || ((($signed(wire1) ~^ $signed(wire4)) != (wire0[(4'ha):(4'ha)] ?
                      wire7 : $unsigned((8'hb4)))) >>> $signed(((!wire12) ?
                      wire0 : $unsigned(wire14)))));
  assign wire17 = (((~^$unsigned($unsigned(wire6))) ?
                          $unsigned(wire16) : $unsigned(((~wire2) <= (&wire15)))) ?
                      $unsigned({wire1,
                          (wire2 ? wire12 : (wire14 << wire6))}) : wire4);
  always
    @(posedge clk) begin
      reg18 <= wire15[(4'ha):(3'h6)];
      if (wire12)
        begin
          reg19 <= wire6[(2'h3):(2'h3)];
          reg20 <= ((((8'hbd) ~^ $unsigned($unsigned(wire7))) ?
              wire7[(4'hb):(2'h3)] : {wire0,
                  (|{reg13, (8'hae)})}) ^~ wire6[(3'h6):(3'h5)]);
          reg21 <= wire6[(2'h2):(1'h0)];
          reg22 <= wire14;
        end
      else
        begin
          reg19 <= wire5;
          reg20 <= (+((((8'hab) || $unsigned(reg19)) ?
                  (wire3 ? $unsigned((8'hab)) : (wire14 ~^ wire14)) : reg19) ?
              $unsigned($unsigned(reg13[(2'h2):(1'h0)])) : (+($signed(reg20) ?
                  (wire5 == wire8) : $unsigned(reg18)))));
          if (((!({$unsigned(wire9)} - wire2[(2'h2):(1'h0)])) == ($signed(wire12[(1'h0):(1'h0)]) ?
              ((8'ha2) ?
                  $signed((7'h40)) : ((wire17 ? wire9 : (8'ha2)) ?
                      (~&reg22) : $unsigned(wire12))) : (!($unsigned(wire15) ?
                  wire2[(1'h1):(1'h0)] : wire11[(2'h2):(2'h2)])))))
            begin
              reg21 <= wire0[(1'h0):(1'h0)];
              reg22 <= $signed($unsigned(reg21));
              reg23 <= $unsigned((|$signed(((wire9 ?
                  reg13 : wire6) && wire6))));
              reg24 <= $unsigned((~&((~&(wire0 ? reg22 : wire17)) ?
                  $signed((~^wire8)) : $signed($unsigned((8'hb1))))));
            end
          else
            begin
              reg21 <= wire17[(1'h0):(1'h0)];
              reg22 <= ((((((8'hb1) ? wire4 : wire16) ?
                      wire9 : reg19[(2'h3):(1'h0)]) ?
                  $signed(reg23) : (8'hbc)) - $signed((((8'ha5) ?
                      reg13 : wire10) ?
                  (wire15 ?
                      wire9 : wire15) : reg20[(4'hf):(1'h1)]))) || ((((8'ha8) ?
                      $signed(wire16) : wire16[(3'h6):(1'h1)]) >>> (^$unsigned(wire14))) ?
                  wire3[(1'h1):(1'h1)] : ({(wire5 & wire8),
                          (wire16 ? reg18 : wire9)} ?
                      wire7 : $signed((wire9 + wire7)))));
              reg23 <= ((($signed(wire8) ?
                      wire10[(4'h9):(3'h4)] : reg20[(3'h7):(3'h4)]) ?
                  (-reg23[(3'h7):(3'h7)]) : {((wire15 <= wire1) ^ (~wire15))}) >= $unsigned($signed(wire16[(3'h7):(3'h4)])));
              reg24 <= ($signed((-$signed({wire9, wire16}))) ?
                  (wire16[(3'h7):(3'h5)] >= (^~reg13[(3'h4):(2'h3)])) : ((~|$unsigned($unsigned(reg23))) ?
                      wire3[(4'h8):(1'h0)] : reg24[(3'h4):(2'h2)]));
              reg25 <= wire5[(4'hb):(4'ha)];
            end
          reg26 <= ($unsigned($unsigned(wire4[(2'h2):(1'h1)])) ? wire6 : reg18);
          if ((({(8'ha2)} ?
                  ($unsigned($unsigned(reg25)) ?
                      (|((8'ha8) - reg25)) : {$unsigned((8'ha9))}) : $signed(({reg19} >> $signed(wire6)))) ?
              reg20 : (-reg23[(1'h0):(1'h0)])))
            begin
              reg27 <= (~|(wire7[(4'hf):(4'h8)] * $signed((^~$signed(reg18)))));
              reg28 <= wire3;
              reg29 <= {reg13[(2'h2):(1'h0)]};
            end
          else
            begin
              reg27 <= $unsigned(({(wire7[(4'hf):(3'h7)] * (wire2 >= wire9))} ?
                  reg19 : $unsigned((~|(wire1 ^~ wire8)))));
            end
        end
      if ($signed($unsigned(wire0[(3'h6):(1'h0)])))
        begin
          reg30 <= ({({$signed((8'hb5)), ((8'hbc) ? (8'ha8) : wire8)} ?
                      (reg29 * (~^reg27)) : {(reg29 ? wire2 : (8'hb7)),
                          $signed((8'hbf))}),
                  wire9} ?
              $unsigned({((|(8'hb6)) ? $unsigned(reg21) : $unsigned(wire17)),
                  ($signed(wire16) ?
                      (&wire8) : reg23)}) : {wire4[(4'hd):(4'ha)]});
          reg31 <= $unsigned({(((~|wire14) != {(7'h43)}) ?
                  reg18[(4'ha):(3'h4)] : reg30[(4'h9):(4'h9)])});
        end
      else
        begin
          reg30 <= wire3[(4'ha):(2'h2)];
          reg31 <= (reg31 ?
              {((&$unsigned(reg26)) ?
                      ($unsigned(reg29) >= {reg22}) : (^~{(8'hb1)}))} : $signed(reg22));
          reg32 <= {{(~&((wire4 > wire7) >= reg31[(3'h5):(1'h0)]))},
              {(-(reg31 + wire9[(3'h6):(3'h5)])), reg31}};
          if ($signed(reg13[(3'h5):(3'h4)]))
            begin
              reg33 <= reg22;
              reg34 <= (reg13 ^~ $signed($signed($unsigned((wire14 <<< wire7)))));
              reg35 <= $unsigned((-wire8[(4'hc):(2'h3)]));
              reg36 <= (!(^~$signed(({wire1, wire2} - (wire4 <= wire6)))));
              reg37 <= ($unsigned($signed($signed(wire14[(2'h3):(1'h1)]))) ?
                  $signed($signed((&(~&reg33)))) : reg31[(3'h4):(3'h4)]);
            end
          else
            begin
              reg33 <= ((wire5 && (reg21 && reg18[(1'h1):(1'h1)])) <= (reg31 < (^~$unsigned(reg22[(4'ha):(1'h1)]))));
              reg34 <= ($signed(reg20) >>> (-$unsigned(reg35)));
              reg35 <= wire8[(3'h7):(1'h1)];
              reg36 <= (reg26[(1'h0):(1'h0)] ?
                  $signed(reg31) : ($unsigned((^{reg35, reg13})) < reg13));
            end
          reg38 <= $unsigned((|(wire0 ?
              reg25[(3'h4):(3'h4)] : ($signed(wire5) ?
                  $unsigned(reg18) : $signed(wire15)))));
        end
    end
  always
    @(posedge clk) begin
      reg39 <= wire12[(2'h3):(2'h3)];
    end
  assign wire40 = reg23;
  assign wire41 = wire1;
  assign wire42 = reg13[(2'h3):(1'h1)];
  assign wire43 = (-wire14);
  assign wire44 = $unsigned($unsigned((wire40 ?
                      ((reg32 ?
                          reg22 : reg28) + $signed(reg31)) : $unsigned((|wire1)))));
endmodule
