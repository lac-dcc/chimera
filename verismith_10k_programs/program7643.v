module top
#(parameter param34 = ((~((((8'hb9) >>> (7'h43)) ? ((8'ha0) | (8'hb4)) : {(8'ha3), (8'h9d)}) ? (^~{(8'h9c), (8'hb4)}) : (((8'hb1) >= (8'ha1)) ^ (~^(8'ha0))))) >>> (-((^~((8'haa) ? (8'hb7) : (8'had))) << (((7'h44) ? (7'h43) : (8'hb7)) ? {(8'hb1), (8'hb9)} : ((8'hbf) ? (8'hae) : (8'ha6)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h13c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire4;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire33;
  wire signed [(5'h12):(1'h0)] wire32;
  wire [(2'h2):(1'h0)] wire21;
  wire signed [(2'h2):(1'h0)] wire20;
  wire [(2'h3):(1'h0)] wire19;
  wire signed [(5'h11):(1'h0)] wire18;
  wire [(3'h4):(1'h0)] wire17;
  wire [(2'h3):(1'h0)] wire16;
  reg [(4'he):(1'h0)] reg31 = (1'h0);
  reg signed [(4'he):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg29 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg28 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg26 = (1'h0);
  reg [(5'h14):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg22 = (1'h0);
  reg [(5'h13):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  reg [(4'hd):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg11 = (1'h0);
  reg [(4'ha):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg8 = (1'h0);
  reg [(4'hc):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg6 = (1'h0);
  reg [(4'hb):(1'h0)] reg5 = (1'h0);
  assign y = {wire33,
                 wire32,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
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
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= $unsigned($unsigned({$signed((^wire4)),
          {$signed(wire0), (8'ha2)}}));
      reg6 <= wire1[(4'h8):(3'h7)];
      if (wire2)
        begin
          if (($signed(wire0[(2'h3):(1'h1)]) >> wire0))
            begin
              reg7 <= wire0[(1'h1):(1'h0)];
              reg8 <= (wire0[(3'h4):(1'h0)] || ($unsigned($unsigned(wire0)) != $unsigned($signed({wire2}))));
            end
          else
            begin
              reg7 <= $signed((~&wire3));
              reg8 <= $signed(((($unsigned(wire4) >= (reg8 ? (8'ha2) : wire1)) ?
                  $unsigned(((8'hbe) ?
                      reg7 : reg8)) : $signed((wire2 << wire2))) | ($signed($unsigned(wire3)) ^ $signed((reg7 * reg7)))));
              reg9 <= wire3;
              reg10 <= $unsigned((reg8[(1'h0):(1'h0)] ?
                  reg5 : ((wire1[(2'h2):(1'h0)] < $signed(reg7)) ^~ reg7)));
            end
          if ({(|$signed(reg6[(3'h7):(3'h6)])),
              (^~$signed((reg5[(1'h0):(1'h0)] & $unsigned((8'hb4)))))})
            begin
              reg11 <= wire1;
              reg12 <= (wire1 ? wire0[(3'h5):(3'h4)] : reg6[(3'h6):(3'h4)]);
              reg13 <= reg5[(4'h9):(2'h2)];
              reg14 <= $signed($unsigned($signed({reg5,
                  (reg7 ? reg12 : (8'hae))})));
            end
          else
            begin
              reg11 <= reg5[(3'h4):(1'h1)];
            end
        end
      else
        begin
          reg7 <= ($signed((wire3[(4'h9):(4'h8)] ?
              reg7[(2'h2):(1'h0)] : (8'ha7))) ^~ reg14);
          reg8 <= (8'ha1);
          reg9 <= (reg10[(3'h6):(3'h6)] ?
              $unsigned((8'hab)) : {$unsigned(wire4),
                  ({$signed((8'hbc))} <= (^~(wire1 == (8'hb1))))});
          reg10 <= {$unsigned(((~^(reg13 ? reg11 : reg14)) ^ ({reg11} ?
                  wire4[(2'h2):(2'h2)] : reg14[(4'hb):(4'h9)])))};
        end
      reg15 <= (($signed((((8'ha4) > reg13) ? wire2 : {reg8, reg8})) ?
          reg11[(1'h0):(1'h0)] : $signed(($unsigned(reg9) > $unsigned(reg13)))) << wire4[(4'hf):(3'h5)]);
    end
  assign wire16 = (^reg6[(2'h3):(2'h3)]);
  assign wire17 = $signed((-($unsigned($unsigned(reg10)) > (8'ha6))));
  assign wire18 = wire17[(1'h1):(1'h1)];
  assign wire19 = $unsigned({((wire17 << reg7[(4'hc):(3'h5)]) <= $signed(wire17[(1'h1):(1'h1)])),
                      (reg11[(2'h2):(1'h1)] >> (8'hb5))});
  assign wire20 = $signed($signed(reg11));
  assign wire21 = $signed(($signed(((reg12 ? reg6 : reg7) ?
                          (wire19 <= (8'hba)) : $unsigned(reg15))) ?
                      wire20[(2'h2):(2'h2)] : (^~wire2)));
  always
    @(posedge clk) begin
      reg22 <= reg11;
      reg23 <= {wire16[(2'h2):(1'h1)], (8'ha6)};
      if (((-wire16[(2'h2):(1'h0)]) != {(^~({wire18, (8'hbb)} ?
              (wire4 || reg14) : (&(8'hbb)))),
          (reg9[(1'h0):(1'h0)] ?
              $signed((~&reg11)) : $signed(wire21[(1'h1):(1'h1)]))}))
        begin
          if ($signed($signed(wire3[(1'h1):(1'h0)])))
            begin
              reg24 <= (+$unsigned(reg6));
              reg25 <= (7'h42);
              reg26 <= {wire20[(1'h1):(1'h1)]};
              reg27 <= reg8;
              reg28 <= (&(&wire4[(4'he):(3'h6)]));
            end
          else
            begin
              reg24 <= wire2;
              reg25 <= $unsigned((8'hb7));
              reg26 <= wire3;
              reg27 <= reg15;
            end
          if ((({$signed((^~wire4)),
              $signed((wire1 ? wire3 : reg7))} - (((reg12 ? reg12 : reg7) ?
                  (reg22 < wire21) : reg14[(4'h8):(3'h5)]) ?
              (+$signed(wire16)) : $signed($unsigned(reg27)))) || {reg10[(2'h3):(2'h2)],
              wire17}))
            begin
              reg29 <= wire3[(3'h5):(2'h2)];
            end
          else
            begin
              reg29 <= (($unsigned((~^$unsigned(reg27))) - {$unsigned(wire18[(3'h4):(2'h2)]),
                      (~&((8'hb9) ? reg7 : wire0))}) ?
                  (-$signed((^~$signed(reg10)))) : (~($unsigned($signed(reg22)) ?
                      reg23[(1'h0):(1'h0)] : reg24)));
            end
          reg30 <= (^~reg26[(4'hd):(4'hd)]);
          reg31 <= $signed({({{reg25}, (&reg15)} | (~&(reg11 ^ wire2))),
              (^~wire1[(3'h4):(2'h3)])});
        end
      else
        begin
          reg24 <= $unsigned((~&(reg25 & ((reg25 ? wire16 : reg29) || (reg9 ?
              reg5 : wire18)))));
        end
    end
  assign wire32 = wire1;
  assign wire33 = wire16[(2'h2):(2'h2)];
endmodule
