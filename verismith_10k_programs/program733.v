module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h9d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire17;
  wire signed [(4'hb):(1'h0)] wire8;
  wire [(4'ha):(1'h0)] wire4;
  reg [(4'h8):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg15 = (1'h0);
  reg [(4'h8):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(4'h9):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg10 = (1'h0);
  reg [(5'h13):(1'h0)] reg9 = (1'h0);
  reg [(3'h5):(1'h0)] reg7 = (1'h0);
  reg [(5'h15):(1'h0)] reg6 = (1'h0);
  reg [(2'h3):(1'h0)] reg5 = (1'h0);
  assign y = {wire17,
                 wire8,
                 wire4,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = $unsigned($unsigned(((8'ha3) ?
                     (!(^~wire2)) : {wire1[(3'h4):(2'h3)],
                         wire3[(2'h3):(2'h3)]})));
  always
    @(posedge clk) begin
      reg5 <= {(({$unsigned(wire4)} ?
                  $unsigned(wire2) : ((wire2 ?
                      wire4 : wire4) >>> wire3[(2'h3):(2'h2)])) ?
              $unsigned(wire1[(2'h3):(1'h0)]) : (|wire4[(3'h5):(1'h0)]))};
      reg6 <= wire1[(1'h1):(1'h1)];
      reg7 <= ({$signed({reg5, $unsigned(wire4)})} ?
          $signed((((wire1 ? wire3 : wire1) ?
              $signed(reg6) : $unsigned(reg6)) | wire4[(3'h7):(3'h5)])) : ((((-wire1) > wire2) ?
                  (|$signed((7'h40))) : ((8'hb4) ?
                      ((7'h40) ? reg6 : reg5) : wire0[(4'h9):(2'h2)])) ?
              $unsigned((!(wire2 ?
                  wire4 : (8'hbd)))) : ($signed(wire1[(1'h1):(1'h0)]) * ((reg6 & (7'h43)) ?
                  wire4 : (reg5 || reg6)))));
    end
  assign wire8 = (|$unsigned(({$unsigned(wire2)} ?
                     (wire4 != {wire1}) : $unsigned(reg7[(1'h1):(1'h0)]))));
  always
    @(posedge clk) begin
      if (((^(^(~reg7))) * (^~($signed(((8'h9e) & wire3)) ?
          (-wire3[(1'h1):(1'h0)]) : reg7))))
        begin
          reg9 <= {{$signed($unsigned($signed(wire4)))},
              (-(($signed(wire8) ? (reg6 ? wire8 : reg6) : (^reg7)) ?
                  wire1[(1'h0):(1'h0)] : ((8'hbb) > reg5[(1'h0):(1'h0)])))};
          reg10 <= $signed($unsigned((reg9[(4'ha):(3'h4)] ^~ {$signed(wire4),
              (^~wire4)})));
          reg11 <= (8'ha3);
          reg12 <= $signed(reg9[(5'h10):(3'h4)]);
        end
      else
        begin
          reg9 <= $signed($signed({wire3, wire4[(3'h6):(2'h2)]}));
          reg10 <= (reg11 ?
              wire8 : (($unsigned((wire8 == reg9)) >>> reg7) ?
                  (((wire1 | (8'hbb)) ? wire0 : reg7) >> wire3) : reg10));
          reg11 <= ($signed({reg6}) ?
              ($signed(wire4) ?
                  (|wire4[(3'h5):(2'h2)]) : ((+$unsigned(reg10)) >>> (reg6 ?
                      {reg7,
                          reg7} : $signed((8'had))))) : (reg12 >>> {((8'hbe) ?
                      ((8'hb5) ? (8'hb5) : wire0) : ((8'ha1) ? wire0 : reg6)),
                  {$unsigned(wire2)}}));
          reg12 <= (reg5 & wire2[(4'h8):(1'h0)]);
          reg13 <= ($unsigned($unsigned($signed($signed(reg5)))) ?
              (wire3 | $signed((|$unsigned(wire2)))) : wire4[(2'h3):(2'h3)]);
        end
      reg14 <= (-reg9[(3'h5):(2'h2)]);
      reg15 <= ($unsigned((|(8'hb7))) - $unsigned((((wire8 >>> (8'hb2)) < {reg6,
          wire8}) || $unsigned(reg13[(1'h1):(1'h0)]))));
      reg16 <= reg15;
    end
  assign wire17 = wire3[(2'h3):(2'h3)];
endmodule
