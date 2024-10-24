module top
#(parameter param19 = ((^~({((8'hbb) - (8'hb1)), (+(7'h42))} ? (((8'hb6) + (8'hb2)) ? (-(8'ha8)) : ((8'ha5) ? (8'h9e) : (8'ha1))) : {{(8'hbc), (8'h9c)}})) ? (&((~|(~(8'hbf))) ? (^{(8'hbd), (8'hb9)}) : {(~^(8'haa))})) : (+((|{(7'h43)}) ? {(~|(8'hb0)), ((8'hb7) ? (8'hbd) : (8'h9f))} : (((8'ha5) ? (8'hab) : (7'h44)) - ((8'hb6) * (8'hb7)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h91):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire18;
  wire signed [(5'h15):(1'h0)] wire17;
  wire signed [(5'h15):(1'h0)] wire4;
  reg [(2'h3):(1'h0)] reg16 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg13 = (1'h0);
  reg [(3'h4):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg11 = (1'h0);
  reg signed [(4'he):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg8 = (1'h0);
  reg [(4'hb):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg6 = (1'h0);
  reg [(3'h4):(1'h0)] reg5 = (1'h0);
  assign y = {wire18,
                 wire17,
                 wire4,
                 reg16,
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
  assign wire4 = $unsigned((|(~|(~$unsigned(wire2)))));
  always
    @(posedge clk) begin
      if (((~|wire0) > ((wire4[(4'hd):(3'h4)] <= wire2[(4'h8):(3'h5)]) ^ (wire3[(3'h7):(3'h6)] ?
          $unsigned((wire1 ? wire2 : wire0)) : (-(wire2 ^ wire2))))))
        begin
          if ((8'ha0))
            begin
              reg5 <= $unsigned(({wire1, {wire0, wire0}} ?
                  $signed(wire0) : wire4[(3'h7):(1'h0)]));
              reg6 <= (~&reg5);
              reg7 <= (reg6[(3'h7):(3'h4)] || wire4[(5'h11):(4'ha)]);
              reg8 <= $unsigned((wire3 && reg6));
            end
          else
            begin
              reg5 <= wire3[(3'h7):(2'h3)];
              reg6 <= (~reg7[(3'h7):(2'h2)]);
            end
          reg9 <= wire0[(2'h2):(1'h0)];
          reg10 <= reg9;
          reg11 <= reg9;
        end
      else
        begin
          reg5 <= $signed((reg11 >= ($signed((reg7 ? reg5 : reg6)) ?
              wire0[(1'h0):(1'h0)] : wire3[(3'h5):(3'h4)])));
          reg6 <= {(wire3 ?
                  ($unsigned((wire2 ? (8'hb2) : reg5)) ?
                      $unsigned((reg11 ?
                          reg6 : (7'h42))) : (~^wire3)) : {reg10[(3'h4):(1'h1)]})};
          if ((+$signed((((wire2 ?
              wire3 : wire2) < $signed(reg9)) >>> $signed((reg6 ^~ wire0))))))
            begin
              reg7 <= (wire0 || wire1[(3'h5):(3'h5)]);
              reg8 <= {((wire1 << (+{reg10,
                      reg10})) - (-$unsigned(wire3[(4'ha):(3'h6)]))),
                  (~&(8'hae))};
              reg9 <= ({($unsigned((wire2 ? wire2 : wire3)) == ($signed(wire2) ?
                      (7'h44) : reg7)),
                  (8'hb3)} == ((~(~^$signed(wire1))) && $unsigned((7'h44))));
              reg10 <= (reg11[(1'h0):(1'h0)] ?
                  (reg6 ?
                      {wire3} : $signed($unsigned(reg9))) : {((^~$signed(reg6)) ?
                          reg7 : {reg10, (&reg9)})});
            end
          else
            begin
              reg7 <= $unsigned($unsigned($signed(((+wire3) == reg11[(1'h0):(1'h0)]))));
              reg8 <= {reg6};
              reg9 <= (wire0[(5'h10):(4'hc)] > reg9[(1'h0):(1'h0)]);
              reg10 <= wire2[(4'hb):(3'h5)];
              reg11 <= wire0;
            end
          reg12 <= reg6[(1'h1):(1'h0)];
          reg13 <= {((~{(~wire3)}) ? $signed((~&$unsigned(wire4))) : reg12),
              (((!wire3) >> $signed($unsigned(reg11))) ?
                  wire2[(4'hd):(4'h9)] : (-{((8'hae) ? wire4 : wire0)}))};
        end
      reg14 <= wire2[(2'h3):(1'h0)];
      reg15 <= (reg6[(2'h2):(2'h2)] * wire4);
      reg16 <= (((^~(reg14 & $signed(wire0))) ?
              $signed({(reg14 ? wire1 : wire1),
                  (reg12 ?
                      reg6 : (7'h41))}) : ($unsigned(wire2[(4'h9):(4'h8)]) ^ $signed({reg10,
                  reg7}))) ?
          wire2[(4'hc):(4'h9)] : $unsigned((-$unsigned((wire0 < reg10)))));
    end
  assign wire17 = $unsigned(reg12[(2'h3):(1'h0)]);
  assign wire18 = reg6;
endmodule
