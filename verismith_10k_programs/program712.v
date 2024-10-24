module top
#(parameter param20 = (&{({{(8'ha8), (8'ha8)}, (|(7'h42))} || (((8'ha6) ? (8'hbc) : (8'hba)) & ((8'hac) ? (8'ha3) : (8'hb3))))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hd4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire [(5'h14):(1'h0)] wire19;
  wire signed [(5'h12):(1'h0)] wire18;
  wire signed [(4'hf):(1'h0)] wire17;
  wire [(4'he):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire4;
  reg [(4'h8):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg14 = (1'h0);
  reg [(3'h5):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg12 = (1'h0);
  reg [(3'h5):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg9 = (1'h0);
  reg [(4'hf):(1'h0)] reg8 = (1'h0);
  reg [(4'ha):(1'h0)] reg7 = (1'h0);
  assign y = {wire19,
                 wire18,
                 wire17,
                 wire6,
                 wire5,
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
                 (1'h0)};
  assign wire4 = $unsigned(($unsigned($unsigned(((8'ha0) <= wire1))) ?
                     $unsigned({$signed(wire1),
                         wire0[(3'h6):(3'h5)]}) : (~|((wire1 ? wire3 : wire2) ?
                         wire2[(3'h7):(3'h4)] : (wire3 ? wire3 : wire0)))));
  assign wire5 = ((($signed($signed(wire1)) - $unsigned((wire1 ^~ wire1))) && wire1) * wire2[(4'h8):(2'h2)]);
  assign wire6 = wire1;
  always
    @(posedge clk) begin
      reg7 <= $signed({wire1});
      if ((~^(-$unsigned({$signed(wire5)}))))
        begin
          reg8 <= ($signed(wire0) ?
              (^$unsigned($signed((wire5 ? wire3 : wire3)))) : (~|reg7));
        end
      else
        begin
          if (wire5[(4'hd):(4'hd)])
            begin
              reg8 <= ($signed((wire2 || $signed((wire3 ? wire2 : wire3)))) ?
                  {$signed(($signed(wire6) ^ {wire6, reg8})),
                      $signed({$unsigned(wire2)})} : $signed(wire2));
            end
          else
            begin
              reg8 <= (~(!$unsigned($signed({wire5, (8'hb7)}))));
              reg9 <= $signed($signed((reg8 ?
                  wire1[(2'h3):(1'h0)] : {$unsigned(wire1)})));
              reg10 <= wire1;
            end
          reg11 <= $unsigned((^~(reg10[(1'h0):(1'h0)] ?
              (8'ha5) : (^reg7[(1'h0):(1'h0)]))));
          if ((!{$unsigned({{wire0}, $signed(wire5)})}))
            begin
              reg12 <= wire3;
            end
          else
            begin
              reg12 <= (^(8'hbb));
              reg13 <= wire3[(3'h6):(1'h0)];
              reg14 <= $signed($unsigned($unsigned(reg8[(2'h3):(1'h1)])));
              reg15 <= $unsigned($signed({($unsigned((8'ha0)) == (reg13 ?
                      wire0 : reg14)),
                  reg7}));
            end
        end
      reg16 <= (&(^~{((-reg15) < $unsigned(wire2))}));
    end
  assign wire17 = $unsigned(((($unsigned(wire0) ?
                      ((8'hb8) <<< reg8) : $signed(wire3)) < $unsigned((reg12 ?
                      wire0 : reg13))) >> ($signed($signed(reg8)) >>> ((reg15 == reg13) ?
                      (wire3 ? (8'hbd) : reg7) : (reg11 ? reg7 : reg14)))));
  assign wire18 = (~|$unsigned(({(wire3 >> (8'h9e))} <= $unsigned(((8'h9d) >> reg15)))));
  assign wire19 = (($signed(wire2[(5'h11):(5'h10)]) ?
                          $signed(((|(8'ha0)) == wire4)) : $unsigned($unsigned($signed(wire4)))) ?
                      $unsigned(((~^(wire17 > wire1)) ?
                          wire2[(4'h9):(2'h2)] : (!{(7'h43),
                              (8'hb9)}))) : ($signed(wire2[(5'h11):(4'hb)]) != reg12[(1'h0):(1'h0)]));
endmodule
