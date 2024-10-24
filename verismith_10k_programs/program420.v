module top
#(parameter param14 = (!{(({(8'hbb), (8'had)} ? (~|(8'ha1)) : ((8'hb7) >>> (8'hb7))) ? ((~(8'hbc)) ^~ (8'ha2)) : (~|((8'h9c) ? (8'ha1) : (8'h9d)))), (((^~(7'h43)) ? {(8'ha7)} : (^(8'hb2))) ? {((8'h9c) ? (8'hbc) : (8'ha5)), ((8'ha6) <<< (7'h40))} : ((8'h9e) ? (-(8'h9c)) : ((8'hab) ? (8'hbd) : (8'hab))))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h84):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire13;
  wire signed [(3'h6):(1'h0)] wire12;
  wire [(5'h14):(1'h0)] wire5;
  wire signed [(4'hb):(1'h0)] wire4;
  reg signed [(4'hc):(1'h0)] reg11 = (1'h0);
  reg [(5'h15):(1'h0)] reg10 = (1'h0);
  reg [(4'h9):(1'h0)] reg9 = (1'h0);
  reg [(4'hb):(1'h0)] reg8 = (1'h0);
  reg [(5'h10):(1'h0)] reg7 = (1'h0);
  reg [(3'h5):(1'h0)] reg6 = (1'h0);
  assign y = {wire13,
                 wire12,
                 wire5,
                 wire4,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = (|(8'ha8));
  assign wire5 = ((!$signed($signed((wire0 <= wire3)))) ?
                     wire4 : (!wire1[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      if ($signed(wire4[(4'h8):(2'h2)]))
        begin
          if ($signed((^~(({wire0, wire2} ?
                  (wire1 ? wire0 : wire2) : (wire3 != wire2)) ?
              ((wire2 - wire4) << $signed(wire1)) : (^{wire3})))))
            begin
              reg6 <= $unsigned({(^$unsigned(wire2[(4'ha):(2'h3)])),
                  (wire3 ^ wire1[(2'h2):(1'h0)])});
              reg7 <= (^wire4);
              reg8 <= $unsigned({$signed(wire0)});
              reg9 <= ({wire2,
                      (({(8'ha5)} == (^~wire0)) ?
                          (wire1[(1'h0):(1'h0)] << $signed(reg7)) : {wire4})} ?
                  wire2[(3'h4):(2'h2)] : $signed(wire0[(4'hd):(2'h2)]));
              reg10 <= ((+(8'hb0)) << {(($signed(reg7) || $signed(wire2)) ?
                      $unsigned((~&wire4)) : $unsigned((8'hab)))});
            end
          else
            begin
              reg6 <= $unsigned((!reg10[(4'hc):(4'hc)]));
              reg7 <= ((|wire2[(4'hb):(3'h5)]) <<< $unsigned(wire0[(3'h5):(2'h2)]));
            end
        end
      else
        begin
          reg6 <= ($signed(reg6[(1'h0):(1'h0)]) ?
              $signed(($signed(reg6) ?
                  $unsigned($signed(wire0)) : wire5[(3'h4):(3'h4)])) : (-$unsigned($unsigned(wire5))));
          reg7 <= (wire0[(3'h7):(3'h7)] ? wire3 : wire2[(3'h7):(1'h1)]);
          reg8 <= ({(+reg7[(4'hc):(4'h9)]), wire0[(3'h4):(3'h4)]} ?
              ((~&reg8[(1'h0):(1'h0)]) ?
                  {$unsigned((reg9 ?
                          (8'hb1) : reg8))} : (wire2[(4'h8):(2'h2)] + ((|reg10) <<< (wire1 ?
                      reg7 : wire1)))) : ({{((8'hb4) + reg9),
                      ((8'h9c) >= reg8)},
                  $signed({wire0, wire4})} + $unsigned(reg8[(3'h6):(3'h4)])));
          reg9 <= reg10[(2'h3):(1'h0)];
          reg10 <= reg6;
        end
      reg11 <= (^reg8[(1'h1):(1'h1)]);
    end
  assign wire12 = ((({$unsigned(wire5), ((8'ha9) ? reg10 : (8'hac))} ?
                              ((wire5 ?
                                  reg9 : reg8) <= $unsigned(wire5)) : (8'hbf)) ?
                          $signed((reg6[(1'h1):(1'h0)] <<< wire5[(4'hf):(3'h7)])) : (wire2 ?
                              ((+reg8) != ((8'hae) ~^ reg11)) : (~(reg10 ?
                                  wire5 : wire1)))) ?
                      reg9 : ($unsigned((((8'hb8) ? wire5 : wire1) ?
                              $unsigned(wire2) : $unsigned((8'ha6)))) ?
                          wire1 : wire3[(3'h6):(1'h1)]));
  assign wire13 = wire12;
endmodule
