module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h81):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire4;
  wire [(5'h13):(1'h0)] wire47;
  wire signed [(4'hd):(1'h0)] wire46;
  wire signed [(3'h4):(1'h0)] wire45;
  wire signed [(4'hc):(1'h0)] wire44;
  wire [(4'hc):(1'h0)] wire43;
  wire signed [(2'h3):(1'h0)] wire42;
  wire [(5'h11):(1'h0)] wire41;
  wire [(5'h10):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire39;
  assign y = {wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire5,
                 wire6,
                 wire39,
                 (1'h0)};
  assign wire5 = (~^wire3);
  assign wire6 = wire2[(1'h0):(1'h0)];
  module7 #() modinst40 (wire39, clk, wire6, wire3, wire5, wire4, wire1);
  assign wire41 = ((wire1 ?
                      (((&(8'hbe)) ?
                          $unsigned(wire6) : (wire0 ?
                              wire0 : wire3)) & $unsigned((^~wire39))) : (wire0[(1'h1):(1'h1)] ?
                          ($unsigned(wire39) ?
                              {wire6,
                                  wire1} : wire2) : $signed((wire1 == wire3)))) >>> ((-{$unsigned(wire5),
                          wire4[(3'h4):(1'h0)]}) ?
                      (((+wire3) ? $unsigned(wire5) : {wire6, wire3}) ?
                          $unsigned($unsigned((8'hbb))) : (((8'ha7) ~^ wire4) ?
                              wire39[(1'h0):(1'h0)] : (+wire1))) : ((!(wire4 ?
                          wire6 : wire4)) - $signed(wire1))));
  assign wire42 = ((|$signed(wire2)) >= ((8'hb9) < (({wire41, wire1} ?
                          {wire39} : (+wire41)) ?
                      (^~wire1) : {(wire2 ? wire39 : (8'hbc)), (-wire41)})));
  assign wire43 = wire5[(3'h5):(2'h3)];
  assign wire44 = (8'hb5);
  assign wire45 = $signed((wire4 ?
                      (^($signed(wire4) || $signed(wire44))) : (8'haa)));
  assign wire46 = wire1[(2'h2):(1'h0)];
  assign wire47 = {wire43[(1'h0):(1'h0)], (8'ha2)};
endmodule

module module7
#(parameter param37 = (~^(~&{(^~((8'hbf) || (8'h9c))), ({(8'hae)} != ((8'hb0) ~^ (8'h9f)))})), 
parameter param38 = (~|(param37 ^~ {(|(~|param37))})))
(y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'he8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire12;
  input wire [(2'h3):(1'h0)] wire11;
  input wire signed [(5'h10):(1'h0)] wire10;
  input wire signed [(3'h6):(1'h0)] wire9;
  input wire signed [(3'h4):(1'h0)] wire8;
  wire [(5'h10):(1'h0)] wire36;
  wire [(3'h5):(1'h0)] wire19;
  wire signed [(5'h14):(1'h0)] wire18;
  wire [(3'h7):(1'h0)] wire17;
  wire [(5'h11):(1'h0)] wire16;
  wire [(5'h11):(1'h0)] wire15;
  wire signed [(2'h2):(1'h0)] wire14;
  wire [(4'h8):(1'h0)] wire13;
  reg [(2'h2):(1'h0)] reg35 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg34 = (1'h0);
  reg [(4'hb):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg32 = (1'h0);
  reg [(4'hc):(1'h0)] reg31 = (1'h0);
  reg [(2'h3):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg28 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg25 = (1'h0);
  reg [(2'h2):(1'h0)] reg24 = (1'h0);
  reg [(2'h3):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg22 = (1'h0);
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  reg [(4'hb):(1'h0)] reg20 = (1'h0);
  assign y = {wire36,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
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
                 (1'h0)};
  assign wire13 = $unsigned(wire12);
  assign wire14 = (~$unsigned((+wire13)));
  assign wire15 = {(~|wire11)};
  assign wire16 = (~|wire10[(4'hc):(3'h7)]);
  assign wire17 = $signed((~&$signed(($unsigned(wire12) ?
                      wire13[(1'h1):(1'h1)] : $signed((8'ha7))))));
  assign wire18 = $signed(wire14);
  assign wire19 = ($signed($unsigned((wire13[(1'h1):(1'h0)] - wire16))) ^~ {((^~(wire9 & wire12)) != wire11[(2'h3):(2'h2)])});
  always
    @(posedge clk) begin
      reg20 <= wire17;
      if ($unsigned(wire13))
        begin
          reg21 <= $signed($unsigned(({(wire18 ? reg20 : wire8)} ?
              ($unsigned(wire11) ?
                  (reg20 >= wire13) : $signed((8'ha8))) : (&wire14[(1'h1):(1'h0)]))));
        end
      else
        begin
          reg21 <= {(wire17[(2'h2):(1'h1)] < ((wire15 >> wire19[(3'h5):(2'h2)]) != reg20[(4'hb):(1'h1)]))};
          reg22 <= {$unsigned($unsigned((+$unsigned(wire8))))};
          reg23 <= wire9;
          reg24 <= $signed($unsigned($unsigned($signed($signed(reg23)))));
          reg25 <= {{$signed(wire10[(3'h5):(3'h5)])}};
        end
      if (((wire16 ?
          wire9 : ({(|(8'hbf))} - $unsigned($unsigned(wire8)))) - (~|$signed(wire19))))
        begin
          if (($signed(wire16[(5'h11):(4'hb)]) ?
              {{wire17}} : (~&$signed((!(wire18 << wire15))))))
            begin
              reg26 <= (~$unsigned((|wire13)));
              reg27 <= $signed((-$unsigned(((wire18 * reg26) >= $unsigned(wire16)))));
              reg28 <= wire14[(2'h2):(2'h2)];
            end
          else
            begin
              reg26 <= $unsigned(wire13);
              reg27 <= ((~^(reg21[(2'h2):(1'h0)] ?
                      ((reg20 < wire15) ^ (~&reg22)) : {{wire16}, (~wire15)})) ?
                  {$unsigned(wire8),
                      (wire9[(3'h4):(1'h0)] ?
                          ((8'ha4) ?
                              (^~wire16) : ((8'hb4) ?
                                  reg25 : reg22)) : wire11[(1'h1):(1'h1)])} : $unsigned(wire13));
            end
          if ($unsigned(reg27[(1'h0):(1'h0)]))
            begin
              reg29 <= reg28;
              reg30 <= (reg25 ?
                  (^$unsigned({$signed(wire8),
                      (~^(8'ha4))})) : (^~(($signed(reg23) ?
                      $signed((8'hb3)) : wire13) ^ (reg25[(4'hc):(4'ha)] & {wire9,
                      wire13}))));
              reg31 <= wire11[(2'h3):(1'h0)];
            end
          else
            begin
              reg29 <= (&((((~(8'ha1)) >= $unsigned(reg30)) != ($unsigned(wire10) ?
                      $signed((8'hb0)) : $signed(reg28))) ?
                  $signed($unsigned((!reg30))) : ($unsigned(wire18[(1'h1):(1'h1)]) ?
                      $signed((8'h9f)) : ((wire18 ^ wire19) + (reg26 >>> wire13)))));
            end
          if ((^~(^$signed($unsigned($unsigned(wire15))))))
            begin
              reg32 <= $unsigned(reg31[(1'h1):(1'h1)]);
              reg33 <= {reg23[(2'h3):(1'h0)],
                  ($unsigned(wire8) ^ $unsigned($unsigned($unsigned(wire15))))};
              reg34 <= (~|(wire19 ?
                  reg27[(1'h1):(1'h1)] : {((reg23 << reg32) ?
                          $unsigned(wire16) : $signed((8'hbf))),
                      (wire8 - $signed(reg32))}));
              reg35 <= $signed($unsigned(reg26[(1'h1):(1'h0)]));
            end
          else
            begin
              reg32 <= reg26;
            end
        end
      else
        begin
          reg26 <= (|reg21[(2'h3):(1'h0)]);
          if ($signed(wire15[(2'h2):(2'h2)]))
            begin
              reg27 <= $signed({(~|((wire19 ?
                      wire19 : reg27) * $unsigned(reg28)))});
              reg28 <= wire15;
              reg29 <= reg27[(2'h2):(2'h2)];
            end
          else
            begin
              reg27 <= $unsigned((8'h9f));
              reg28 <= $unsigned(($signed(((wire8 ?
                  reg22 : wire13) > reg28)) && wire11[(2'h3):(1'h1)]));
              reg29 <= $signed($unsigned((reg34[(2'h2):(2'h2)] & $unsigned((|reg27)))));
              reg30 <= reg22[(3'h7):(3'h6)];
            end
          if ((wire16[(4'ha):(2'h2)] >= reg25))
            begin
              reg31 <= {{(~|$unsigned(reg24[(1'h1):(1'h0)]))}, wire13};
              reg32 <= {((8'hab) ?
                      $signed(($signed(wire14) << (^wire8))) : reg21),
                  (8'ha4)};
              reg33 <= $signed($unsigned(wire14));
              reg34 <= reg33[(4'hb):(2'h2)];
              reg35 <= (8'ha7);
            end
          else
            begin
              reg31 <= wire15;
              reg32 <= (~$signed((((wire17 ? (8'ha0) : wire10) ^~ (wire10 ?
                      wire8 : (8'h9c))) ?
                  $signed(reg33[(1'h0):(1'h0)]) : wire18[(4'h9):(4'h9)])));
            end
        end
    end
  assign wire36 = $unsigned(reg27);
endmodule
