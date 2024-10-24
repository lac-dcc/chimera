module top
#(parameter param25 = (~|(((((8'h9d) >> (8'hb6)) ? ((8'hb1) ? (8'hbe) : (8'ha0)) : ((8'hb3) ? (8'ha4) : (8'ha3))) == (((8'hac) ? (8'hbc) : (8'hb8)) ? (^(7'h40)) : (^(8'hb8)))) ? ((+(!(8'hb0))) ? (^~(~^(8'hb0))) : (((7'h44) | (8'hab)) ? ((8'had) ? (8'ha0) : (8'ha2)) : (~&(8'hb0)))) : ((((8'ha9) && (8'ha4)) ? ((8'hb0) ~^ (8'ha5)) : {(7'h43)}) * (((7'h44) ? (8'h9d) : (8'hb5)) ? ((8'hbb) << (8'hbb)) : {(8'h9e), (8'ha9)})))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hed):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire24;
  wire signed [(4'h9):(1'h0)] wire21;
  wire [(3'h4):(1'h0)] wire20;
  wire signed [(4'hb):(1'h0)] wire19;
  wire [(5'h11):(1'h0)] wire18;
  wire [(5'h13):(1'h0)] wire17;
  wire signed [(4'h9):(1'h0)] wire16;
  wire signed [(5'h10):(1'h0)] wire5;
  reg [(5'h10):(1'h0)] reg23 = (1'h0);
  reg [(4'hb):(1'h0)] reg22 = (1'h0);
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg14 = (1'h0);
  reg [(4'h9):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg10 = (1'h0);
  reg signed [(4'he):(1'h0)] reg9 = (1'h0);
  reg [(3'h4):(1'h0)] reg8 = (1'h0);
  reg [(5'h11):(1'h0)] reg7 = (1'h0);
  reg [(5'h12):(1'h0)] reg6 = (1'h0);
  assign y = {wire24,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire5,
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
                 (1'h0)};
  assign wire5 = ((((((8'hb8) | wire2) ?
                         $signed((8'ha1)) : $unsigned(wire0)) || $signed(wire4)) ?
                     $unsigned(wire1) : (-(|(wire0 ?
                         wire1 : wire2)))) == ((^$signed(wire1[(3'h4):(2'h2)])) ?
                     (-wire3[(3'h7):(3'h5)]) : wire3[(3'h7):(2'h2)]));
  always
    @(posedge clk) begin
      reg6 <= wire4;
      reg7 <= {{reg6[(4'he):(3'h4)]}, wire4};
      if ((((^$unsigned({reg7, (8'hb4)})) - ((^(reg7 ? wire0 : wire0)) ?
              ((wire1 ? wire1 : wire5) ?
                  (~wire3) : (wire4 + wire2)) : wire1[(4'hb):(3'h6)])) ?
          (reg6 ?
              (+(8'ha3)) : $signed(($signed(wire1) ?
                  (reg6 ? wire0 : (8'hb5)) : reg6))) : wire0))
        begin
          reg8 <= {(($unsigned($signed(wire3)) >>> ($signed(wire1) ^ (reg7 ^ wire0))) ?
                  ((~&$signed(wire0)) ^ ((wire3 != (8'hbf)) && (^wire5))) : (~$unsigned((wire5 ?
                      reg7 : reg7))))};
          reg9 <= wire4[(3'h7):(3'h5)];
        end
      else
        begin
          if (wire4)
            begin
              reg8 <= wire1;
              reg9 <= $signed(wire0[(3'h5):(3'h4)]);
            end
          else
            begin
              reg8 <= wire1[(1'h0):(1'h0)];
              reg9 <= ($signed((~|{$unsigned(wire3), (wire1 ? wire0 : reg7)})) ?
                  $signed((reg6[(3'h4):(1'h0)] >= ((wire1 ?
                      wire5 : wire3) < wire4[(3'h4):(3'h4)]))) : (8'hb7));
              reg10 <= reg6;
              reg11 <= ($unsigned($signed(reg7[(3'h5):(1'h1)])) ?
                  wire1 : ((($signed(wire5) ?
                          $signed(reg7) : (~&wire0)) + wire3[(3'h4):(2'h2)]) ?
                      reg6[(4'h9):(3'h7)] : (wire3 ?
                          wire2[(3'h4):(1'h1)] : wire3)));
            end
          reg12 <= (7'h44);
          reg13 <= $signed(((^~{wire0[(3'h4):(2'h3)]}) ?
              ($signed({wire2, reg8}) >> (reg8[(1'h0):(1'h0)] ?
                  reg6 : (wire5 > reg6))) : (+$signed(((8'hbd) * (8'hb0))))));
        end
    end
  always
    @(posedge clk) begin
      reg14 <= ((-((|reg7) * $signed($signed(reg8)))) ?
          (wire0[(2'h3):(2'h3)] ?
              ($signed(wire5) ?
                  reg7 : wire0) : reg9) : ({wire4[(3'h6):(1'h1)]} || wire2));
      reg15 <= $signed($unsigned((^~wire4)));
    end
  assign wire16 = wire0;
  assign wire17 = (wire2[(3'h4):(2'h3)] ^ (~(reg7 ^ (wire0[(2'h2):(1'h1)] ?
                      $signed(reg8) : (wire5 ? wire5 : (8'ha6))))));
  assign wire18 = $signed((^~$signed(reg8)));
  assign wire19 = $unsigned($unsigned((((^wire17) | (wire2 ?
                      reg8 : reg8)) != $unsigned((wire5 >> reg12)))));
  assign wire20 = (~^$signed((8'hbc)));
  assign wire21 = ($unsigned(reg10[(5'h11):(4'he)]) * $signed(wire1));
  always
    @(posedge clk) begin
      reg22 <= wire19[(3'h5):(3'h5)];
      reg23 <= {{$unsigned(wire20),
              ((reg7 ? (~&reg7) : wire3[(4'hf):(4'hc)]) >>> $unsigned((wire17 ?
                  wire0 : wire1)))}};
    end
  assign wire24 = (|(wire4[(3'h4):(1'h1)] && reg14[(2'h3):(1'h0)]));
endmodule
