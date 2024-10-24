module top
#(parameter param18 = ((({{(8'hb2), (8'hbd)}, ((8'ha0) ? (8'haa) : (8'ha3))} & (((7'h43) ? (8'had) : (8'hb3)) <<< ((8'ha4) >> (8'h9d)))) ? ({(-(8'ha7)), (^~(8'hb8))} ? (((8'hb1) < (8'hbb)) <<< {(8'hb6)}) : ((~^(8'haa)) ? ((8'ha9) == (7'h44)) : ((8'ha1) >= (8'hbb)))) : ((^(!(7'h42))) << (+(~|(8'hba))))) ^ (((((8'ha0) ? (8'hbd) : (8'hb0)) ? {(7'h40), (7'h42)} : {(8'hb0)}) && (((7'h41) ? (8'h9c) : (8'ha6)) >> (~&(8'ha2)))) - (~&((~|(8'ha6)) == ((8'hab) ? (8'hb9) : (8'hb6)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h92):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire17;
  wire [(4'hc):(1'h0)] wire16;
  wire [(5'h10):(1'h0)] wire15;
  wire [(4'ha):(1'h0)] wire14;
  wire signed [(4'h9):(1'h0)] wire13;
  wire signed [(3'h5):(1'h0)] wire12;
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg8 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg7 = (1'h0);
  reg [(2'h3):(1'h0)] reg6 = (1'h0);
  reg [(3'h5):(1'h0)] reg5 = (1'h0);
  reg [(5'h12):(1'h0)] reg4 = (1'h0);
  assign y = {wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= {wire1[(3'h4):(2'h2)]};
      reg5 <= (wire0[(1'h1):(1'h1)] ~^ $unsigned(($signed((wire3 ?
              wire2 : (8'haa))) ?
          $signed($signed(wire3)) : (^(reg4 ~^ reg4)))));
      if (wire1[(2'h2):(1'h0)])
        begin
          if (wire0[(2'h2):(1'h1)])
            begin
              reg6 <= $signed({wire0});
              reg7 <= reg5[(3'h4):(1'h1)];
            end
          else
            begin
              reg6 <= $signed(reg6[(2'h2):(1'h0)]);
              reg7 <= $unsigned({(~&$signed({reg7, wire2})),
                  {$unsigned({wire2, wire2})}});
              reg8 <= reg6[(1'h1):(1'h0)];
              reg9 <= $unsigned((^(reg7 != (&$signed(reg7)))));
              reg10 <= {reg8};
            end
        end
      else
        begin
          reg6 <= $signed({(^~(-(reg9 ? reg8 : wire2)))});
          reg7 <= ({((8'ha3) && wire2[(2'h2):(1'h0)])} ?
              reg4[(4'hc):(1'h1)] : ({(wire1[(4'hb):(4'h8)] ?
                      $unsigned(reg4) : (wire1 && reg7))} >> (&((wire1 >= reg8) ?
                  reg5 : (~wire1)))));
          reg8 <= $signed(reg5[(2'h3):(1'h0)]);
        end
      reg11 <= $signed((wire1 ?
          ((^~wire3) ? (^$unsigned((8'hb0))) : reg8) : $signed(reg5)));
    end
  assign wire12 = (&reg4);
  assign wire13 = (reg4 >> reg4);
  assign wire14 = {$unsigned(wire1)};
  assign wire15 = $signed((((&$signed(reg11)) <= reg5) ?
                      (8'hbe) : (^~(7'h41))));
  assign wire16 = reg8;
  assign wire17 = $unsigned($signed($unsigned({(wire1 ? reg7 : (8'ha6)),
                      (wire15 ? reg10 : wire0)})));
endmodule
