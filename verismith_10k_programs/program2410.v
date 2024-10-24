module top
#(parameter param24 = (~|(+((^((8'ha1) ? (8'ha2) : (8'had))) ? {(^~(8'ha6))} : (((8'hb8) ? (8'hb0) : (8'ha8)) ? ((8'ha1) ? (7'h44) : (8'hb2)) : ((8'hbf) + (8'hb5)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hf0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire23;
  wire signed [(5'h13):(1'h0)] wire22;
  wire signed [(5'h13):(1'h0)] wire21;
  wire signed [(3'h4):(1'h0)] wire20;
  wire signed [(2'h3):(1'h0)] wire19;
  wire [(4'ha):(1'h0)] wire18;
  wire [(4'hc):(1'h0)] wire17;
  wire [(4'ha):(1'h0)] wire5;
  wire signed [(4'he):(1'h0)] wire4;
  reg [(5'h15):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg10 = (1'h0);
  reg [(3'h7):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg8 = (1'h0);
  reg [(4'h9):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg6 = (1'h0);
  assign y = {wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
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
                 reg6,
                 (1'h0)};
  assign wire4 = $unsigned((~((^(8'ha2)) ?
                     $unsigned($signed(wire0)) : ({wire2} || $unsigned((8'hba))))));
  assign wire5 = wire4[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg6 <= ({$signed((~((7'h40) <= wire1))),
          (|((wire1 ? wire5 : wire2) & wire3))} <= (((!wire5) ^~ (+wire4)) ?
          (((8'h9e) >>> $unsigned(wire4)) < $unsigned($unsigned(wire1))) : (~{wire4})));
      if (wire1[(5'h10):(4'ha)])
        begin
          reg7 <= $unsigned(($signed($unsigned($signed(wire5))) ^~ wire3));
          if ((($signed((!(wire4 != wire3))) >> $unsigned($unsigned(wire0))) ^~ (((|(wire0 ?
                  reg7 : reg7)) ?
              $signed(wire2[(3'h6):(2'h3)]) : $unsigned((~&wire2))) - (((wire4 <<< wire3) + wire1) & $signed(wire2[(3'h4):(3'h4)])))))
            begin
              reg8 <= wire4;
              reg9 <= (8'hb1);
              reg10 <= (reg7 ? wire3 : wire4);
              reg11 <= (({{(wire0 ? wire2 : reg9)},
                          ((~|reg8) ? (wire1 ? wire1 : wire4) : (7'h40))} ?
                      (&$unsigned((wire2 <= wire0))) : wire1[(5'h10):(3'h4)]) ?
                  $unsigned(wire5) : ($signed(reg8[(1'h0):(1'h0)]) == (7'h40)));
              reg12 <= $unsigned($signed((reg6 << (wire1 ?
                  $unsigned(wire1) : wire5))));
            end
          else
            begin
              reg8 <= ($signed($unsigned(((^~(8'haa)) <<< ((8'hb8) ?
                      reg10 : wire5)))) ?
                  (|wire2[(1'h1):(1'h1)]) : (~^$signed((^(wire1 & reg6)))));
            end
          reg13 <= (((wire3 + reg6) ^ $unsigned((+(7'h41)))) ?
              (~&$unsigned($unsigned(reg10[(4'h9):(3'h6)]))) : (|$signed(wire2[(1'h1):(1'h0)])));
          reg14 <= wire5;
        end
      else
        begin
          reg7 <= ($signed(reg6) && reg12);
          reg8 <= reg7;
          if ({$unsigned($unsigned($signed((reg13 ? (8'ha0) : reg10))))})
            begin
              reg9 <= (reg12 ? (~|wire3[(2'h2):(2'h2)]) : reg11);
              reg10 <= $signed({(^~$signed((reg13 ? (8'haa) : reg11))),
                  ($signed(reg13[(2'h3):(1'h1)]) ?
                      reg13[(1'h0):(1'h0)] : ($unsigned(reg13) < (reg6 ?
                          reg11 : reg14)))});
              reg11 <= ($unsigned((reg14[(3'h7):(3'h4)] < wire5)) != $unsigned(((^wire0[(4'h8):(2'h3)]) ?
                  (reg7[(1'h1):(1'h0)] ?
                      (!wire1) : (reg12 ? (8'hb6) : reg12)) : reg6)));
              reg12 <= $signed($unsigned((((|reg8) ?
                      {(8'ha1)} : $unsigned(wire2)) ?
                  (|$unsigned((7'h41))) : $signed((~^(8'hb6))))));
            end
          else
            begin
              reg9 <= (~^reg7);
              reg10 <= (~|(~((wire0 || {(8'hbb)}) ?
                  ($signed((8'hb3)) ~^ (8'hb9)) : wire5)));
              reg11 <= ($unsigned(((|$unsigned(reg11)) ?
                      {(+reg14)} : $signed((wire1 ? wire4 : wire3)))) ?
                  reg13[(1'h0):(1'h0)] : (wire0[(3'h5):(1'h1)] ^~ $signed({(wire4 * reg13),
                      reg10})));
            end
        end
      reg15 <= (wire2 ?
          reg6[(3'h4):(1'h1)] : $unsigned(($unsigned((~&wire4)) ^ wire2)));
      reg16 <= {((($signed(reg10) ^ ((8'hbd) ? (8'hb9) : reg8)) ?
                  $unsigned(reg14[(1'h1):(1'h0)]) : reg15) ?
              {{(wire0 << reg13),
                      (wire3 <<< wire2)}} : ({(wire0 << (8'ha9))} == $signed($signed(wire1))))};
    end
  assign wire17 = reg6;
  assign wire18 = (($unsigned((~&(wire1 ? (8'hb7) : (7'h43)))) ?
                      (^(((8'hb6) ? reg16 : reg15) ^~ (reg12 ?
                          wire5 : wire0))) : {reg15[(1'h1):(1'h0)],
                          ({(8'hb6)} | wire0[(3'h5):(2'h2)])}) && {{(~^wire0)},
                      (&reg11)});
  assign wire19 = wire1[(3'h5):(3'h4)];
  assign wire20 = wire0;
  assign wire21 = reg16;
  assign wire22 = (&($signed($signed((wire5 & wire19))) ?
                      wire2[(2'h2):(2'h2)] : {{(wire19 ? reg15 : reg14)}}));
  assign wire23 = $unsigned((wire1 & (^~($unsigned(reg15) & reg13[(2'h2):(1'h0)]))));
endmodule
