module top
#(parameter param33 = (({(((8'h9d) >= (8'hbe)) ? (~(8'hbd)) : {(8'ha6), (8'ha0)}), ((^~(8'h9c)) & (^~(8'hab)))} << ((~&((8'hbe) ? (8'hae) : (8'hb2))) || {{(8'ha6)}, {(8'hb3)}})) ? (8'h9d) : (~&{{(8'h9d)}})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h145):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire22;
  wire [(5'h13):(1'h0)] wire21;
  wire signed [(5'h11):(1'h0)] wire20;
  wire signed [(3'h5):(1'h0)] wire19;
  wire [(4'hd):(1'h0)] wire18;
  wire signed [(5'h12):(1'h0)] wire17;
  wire signed [(5'h12):(1'h0)] wire16;
  wire [(5'h11):(1'h0)] wire15;
  wire [(3'h7):(1'h0)] wire14;
  wire signed [(4'he):(1'h0)] wire13;
  wire [(2'h3):(1'h0)] wire5;
  wire [(3'h4):(1'h0)] wire4;
  reg [(5'h10):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg31 = (1'h0);
  reg [(4'ha):(1'h0)] reg30 = (1'h0);
  reg [(3'h6):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg28 = (1'h0);
  reg [(4'hb):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg24 = (1'h0);
  reg [(3'h4):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg11 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg8 = (1'h0);
  reg [(5'h12):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg6 = (1'h0);
  assign y = {wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire5,
                 wire4,
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
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = wire0[(4'hd):(4'ha)];
  assign wire5 = (wire0 ?
                     wire4[(2'h3):(1'h0)] : {({$signed(wire2),
                                 (wire2 ? wire2 : wire1)} ?
                             wire3[(3'h5):(3'h5)] : wire3)});
  always
    @(posedge clk) begin
      if ((wire1 ?
          wire0 : ($unsigned($unsigned($signed(wire4))) ?
              {wire0[(3'h7):(3'h6)]} : wire0)))
        begin
          reg6 <= {($unsigned(({wire2, wire0} >= wire1)) || (~$unsigned((wire5 ?
                  wire2 : wire4)))),
              (wire3[(2'h3):(2'h2)] >= $signed({(-wire1)}))};
        end
      else
        begin
          reg6 <= wire1[(2'h3):(1'h0)];
          if ((wire3[(1'h0):(1'h0)] < $unsigned(((~|wire3) ?
              (&{wire5, wire4}) : $signed((8'ha5))))))
            begin
              reg7 <= ($signed(wire5[(2'h3):(2'h3)]) ?
                  ({{(wire1 > (8'h9e)), wire1}, (|(wire1 ? wire5 : wire5))} ?
                      wire0 : (reg6[(2'h2):(1'h1)] ?
                          wire5 : $unsigned((-(8'ha5))))) : {$unsigned(($signed(wire5) >>> (^~(8'hb8))))});
              reg8 <= (7'h42);
            end
          else
            begin
              reg7 <= $signed(((8'hb0) ?
                  reg7 : ($unsigned(((8'hb8) ? wire1 : wire3)) ?
                      reg6 : ((reg6 ? reg7 : wire1) ^~ $unsigned((8'had))))));
              reg8 <= reg8[(1'h1):(1'h1)];
              reg9 <= $unsigned($signed($signed((+wire2))));
            end
          if ($unsigned($unsigned({$signed($signed(wire4)),
              $unsigned((reg6 ? (8'hbc) : wire1))})))
            begin
              reg10 <= {reg7};
              reg11 <= $signed((~|(~$unsigned(wire0[(3'h4):(2'h2)]))));
            end
          else
            begin
              reg10 <= wire4;
              reg11 <= $unsigned(reg7[(3'h4):(3'h4)]);
            end
        end
      reg12 <= reg7[(3'h4):(1'h0)];
    end
  assign wire13 = (7'h43);
  assign wire14 = reg9[(4'he):(4'hc)];
  assign wire15 = $signed((((^$signed(wire14)) ?
                      ($unsigned(reg10) ?
                          {reg6} : (~wire14)) : reg10) <<< wire2[(3'h5):(3'h4)]));
  assign wire16 = (^reg11);
  assign wire17 = wire2[(3'h6):(3'h6)];
  assign wire18 = $unsigned((&$unsigned({wire17[(4'hd):(4'ha)],
                      $unsigned(wire3)})));
  assign wire19 = (^(|$signed(({wire1, (8'hb1)} ?
                      (wire15 <<< (8'ha8)) : (~&wire1)))));
  assign wire20 = $signed((wire0[(3'h4):(2'h3)] ?
                      (!({wire16} ?
                          (reg10 ?
                              reg11 : wire15) : (reg6 == wire19))) : wire5[(1'h1):(1'h1)]));
  assign wire21 = $unsigned({$signed(wire3), $signed($signed(reg11))});
  assign wire22 = (reg8[(1'h1):(1'h0)] ^~ reg9[(3'h5):(2'h2)]);
  always
    @(posedge clk) begin
      reg23 <= (~$unsigned((reg6 ? wire15 : wire17[(4'hd):(4'hd)])));
      if (wire18[(2'h2):(2'h2)])
        begin
          reg24 <= (&(~^(~^$unsigned((&wire16)))));
          reg25 <= (-reg6);
          if ($signed((wire13 ? (&$signed($unsigned(reg12))) : wire16)))
            begin
              reg26 <= ((~&$unsigned(((~reg9) ? (reg10 | wire14) : reg8))) ?
                  reg9[(4'h8):(3'h7)] : $signed($signed((wire4[(1'h0):(1'h0)] ^~ (^wire3)))));
              reg27 <= $unsigned(reg9);
              reg28 <= $signed(($signed(reg11[(3'h6):(2'h3)]) >= {(~&$unsigned(wire4))}));
              reg29 <= reg28;
              reg30 <= $signed((~&$unsigned((((8'hae) | (8'hae)) - ((8'hb3) ?
                  wire20 : wire19)))));
            end
          else
            begin
              reg26 <= reg29;
              reg27 <= {$unsigned(wire14[(3'h6):(2'h2)]),
                  ((8'hba) * wire1[(2'h2):(1'h0)])};
            end
          reg31 <= ((({reg25, wire2[(4'hc):(3'h5)]} > (8'hb7)) ?
              $unsigned(($unsigned(reg6) != $unsigned(reg27))) : $unsigned(((reg30 << wire4) ?
                  (!wire18) : (~reg26)))) ^ $signed(wire5));
          reg32 <= wire0[(1'h1):(1'h1)];
        end
      else
        begin
          reg24 <= (|$unsigned($unsigned(wire14)));
          reg25 <= $unsigned($signed(($unsigned(reg11) < $unsigned($unsigned(reg32)))));
          reg26 <= reg12[(1'h1):(1'h1)];
          reg27 <= {(~^reg24)};
        end
    end
endmodule
