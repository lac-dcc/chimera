module top
#(parameter param18 = ({(~|(|{(8'h9d), (8'ha1)}))} ? ((~^((+(8'hbd)) ? (|(8'h9f)) : ((8'hb2) ? (8'ha7) : (8'ha2)))) ~^ (^(((7'h40) ? (8'hb1) : (8'hb7)) - (~^(8'hbe))))) : (~^(((&(7'h40)) << ((8'ha9) ^ (8'ha9))) ? ((~|(8'ha8)) ~^ ((8'ha7) ? (8'hb9) : (8'hb3))) : (-((8'ha8) ? (8'hb8) : (8'h9f)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hb6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire17;
  wire signed [(5'h11):(1'h0)] wire16;
  wire [(2'h2):(1'h0)] wire15;
  wire signed [(3'h5):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire4;
  reg signed [(4'ha):(1'h0)] reg14 = (1'h0);
  reg [(5'h12):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg10 = (1'h0);
  reg [(4'ha):(1'h0)] reg9 = (1'h0);
  reg [(3'h5):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg7 = (1'h0);
  assign y = {wire17,
                 wire16,
                 wire15,
                 wire6,
                 wire5,
                 wire4,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire4 = wire2;
  assign wire5 = $unsigned(((wire1 >= (&((8'hac) ? wire1 : wire3))) ?
                     (($signed((8'haf)) ?
                         wire2[(3'h4):(1'h1)] : $signed(wire4)) > $signed({wire1})) : wire2[(4'h8):(3'h5)]));
  assign wire6 = (~&((((!wire1) >> {wire1, wire4}) < (((8'haf) >= wire0) ?
                         (wire1 * (8'hbd)) : (wire0 << (8'ha0)))) ?
                     (8'hb8) : $signed(wire5)));
  always
    @(posedge clk) begin
      if ((wire3[(2'h2):(1'h1)] ^~ wire2))
        begin
          reg7 <= (wire1[(4'hc):(3'h6)] >>> wire4);
          if (wire5[(1'h1):(1'h1)])
            begin
              reg8 <= $signed(($signed(((^~wire4) ?
                  $unsigned(wire6) : (-wire1))) < (8'ha9)));
              reg9 <= wire6;
            end
          else
            begin
              reg8 <= ((($signed({reg8, wire2}) ?
                      {{reg8}} : $signed((-wire4))) != (wire5 ?
                      wire1 : $signed(reg7))) ?
                  ($unsigned(wire1[(5'h10):(4'hb)]) > wire1) : (^(^~{wire3[(3'h5):(2'h3)],
                      {wire4}})));
              reg9 <= {((wire0 ?
                      (((8'hbb) ? wire2 : reg7) ~^ (wire1 ?
                          (8'hb4) : (7'h41))) : wire3[(4'ha):(2'h3)]) || wire5)};
              reg10 <= ((&(!reg8)) ? {(&(8'hb9))} : (~^wire1[(4'hf):(3'h5)]));
              reg11 <= $unsigned((~^reg7[(4'he):(3'h7)]));
            end
        end
      else
        begin
          reg7 <= (^$unsigned((^~((wire3 ? reg7 : reg11) << wire5))));
          reg8 <= $signed(wire5);
          if ((wire1[(5'h12):(5'h11)] >> $signed({(8'haa)})))
            begin
              reg9 <= (8'hb3);
              reg10 <= wire4[(4'h8):(3'h5)];
            end
          else
            begin
              reg9 <= (reg10[(3'h7):(3'h5)] * $signed($signed(reg8[(2'h2):(2'h2)])));
              reg10 <= $unsigned(((reg11 & ((-wire1) ?
                  (reg10 <= reg11) : (7'h40))) ^~ ((-((7'h43) + wire5)) ?
                  $unsigned($unsigned(reg10)) : (-(wire3 >> reg10)))));
              reg11 <= $signed({($signed(reg11) ?
                      (~^$signed(wire2)) : {{wire5}}),
                  $signed({(reg10 ? wire5 : reg7)})});
              reg12 <= (({($signed(reg10) << (+wire5))} * wire6[(2'h3):(2'h2)]) ?
                  ($unsigned((~&(8'h9c))) ?
                      wire2[(3'h4):(1'h0)] : (~|$unsigned($signed(wire3)))) : reg8);
              reg13 <= $signed(($signed(((reg8 == reg7) <= $signed((8'hae)))) != ($unsigned((reg10 && wire3)) >= ((!reg8) ^~ reg9[(4'ha):(3'h7)]))));
            end
        end
      reg14 <= $signed((~&(^~reg12[(3'h7):(2'h2)])));
    end
  assign wire15 = reg14;
  assign wire16 = $unsigned(((reg10[(3'h7):(1'h0)] ?
                          $unsigned($signed(reg7)) : wire1) ?
                      $unsigned($signed(wire5)) : $signed(($unsigned(wire3) ?
                          (wire2 | wire0) : reg14))));
  assign wire17 = reg9[(4'ha):(1'h0)];
endmodule
