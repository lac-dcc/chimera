module top
#(parameter param29 = ((((((8'ha7) ? (8'hac) : (8'h9f)) < (!(8'h9c))) && {(^(8'hbc)), (!(8'haf))}) || (&(8'hb0))) ? (^~{(~^((8'hab) ? (8'hb8) : (8'ha1))), (^((8'ha9) ? (8'hbc) : (7'h44)))}) : ({((^(8'ha8)) >> ((8'hbe) - (7'h44))), (((8'hb1) ? (8'hb4) : (8'hbd)) <= (~^(8'ha4)))} >= ((((8'ha8) ~^ (8'h9c)) ? {(8'h9c), (8'hbc)} : {(8'hb2), (8'ha0)}) || {((8'ha6) ? (7'h41) : (7'h42)), ((8'hb8) & (8'hbe))}))), 
parameter param30 = ((((&(param29 ? (8'hb1) : param29)) < (8'hb1)) ? param29 : ({(param29 ? param29 : param29), (param29 >= param29)} ? (^(+param29)) : {((8'ha9) * param29), ((8'hbd) * param29)})) ? (({(8'hab)} >> (^param29)) || ((~param29) ? (~^param29) : ({(8'ha8), param29} >= param29))) : {(((^~(8'hb7)) & (!param29)) ? ((|(8'hb8)) ~^ {param29, param29}) : ((param29 ? (8'hb9) : param29) * (param29 != param29)))}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h10a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire4;
  input wire [(2'h2):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire28;
  wire [(4'ha):(1'h0)] wire27;
  wire signed [(3'h4):(1'h0)] wire26;
  wire [(2'h3):(1'h0)] wire25;
  wire signed [(3'h7):(1'h0)] wire17;
  wire signed [(4'hc):(1'h0)] wire16;
  wire [(5'h12):(1'h0)] wire15;
  wire signed [(3'h7):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire5;
  reg signed [(3'h7):(1'h0)] reg24 = (1'h0);
  reg [(3'h4):(1'h0)] reg23 = (1'h0);
  reg [(4'h9):(1'h0)] reg22 = (1'h0);
  reg [(4'hb):(1'h0)] reg21 = (1'h0);
  reg [(5'h10):(1'h0)] reg20 = (1'h0);
  reg [(4'he):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg12 = (1'h0);
  reg [(5'h10):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg9 = (1'h0);
  reg [(4'hf):(1'h0)] reg8 = (1'h0);
  reg [(4'hc):(1'h0)] reg7 = (1'h0);
  assign y = {wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire17,
                 wire16,
                 wire15,
                 wire6,
                 wire5,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = (7'h41);
  assign wire6 = ((({(wire2 ~^ (8'haa))} ?
                         {(&(8'ha8))} : {(wire2 | wire0)}) <= $signed(($unsigned(wire0) + (wire3 ?
                         wire5 : wire1)))) ?
                     (+(wire3[(1'h1):(1'h0)] >= (wire2[(3'h6):(1'h1)] ?
                         wire3 : {wire5, wire3}))) : $signed((~^{(wire0 ?
                             wire0 : (8'hb2))})));
  always
    @(posedge clk) begin
      reg7 <= wire3[(2'h2):(1'h0)];
      reg8 <= (|$signed(((~$unsigned(wire0)) & wire4)));
      if (wire2)
        begin
          if (wire1[(4'hd):(4'hb)])
            begin
              reg9 <= wire6;
              reg10 <= (8'ha5);
              reg11 <= $signed((({reg9, wire5} ?
                  (~&(~^wire1)) : ($signed(wire4) ?
                      (|wire4) : $unsigned(reg8))) ^~ {((wire0 <= reg8) ?
                      (reg7 >> wire4) : wire4[(4'hd):(3'h6)]),
                  (wire3 != $unsigned(wire2))}));
            end
          else
            begin
              reg9 <= reg7;
              reg10 <= wire3;
              reg11 <= $signed((((((8'ha0) ? wire3 : wire1) ^~ (reg9 ?
                      wire1 : wire4)) & (reg8 & wire2[(4'hc):(1'h0)])) ?
                  $unsigned(($signed((8'ha5)) ~^ (8'ha0))) : (!(~wire4))));
              reg12 <= reg10[(2'h2):(1'h0)];
            end
          reg13 <= reg11[(4'h9):(1'h0)];
          reg14 <= $unsigned((($unsigned((+reg10)) ?
                  ((wire3 ^ wire0) ?
                      $unsigned((8'ha4)) : wire5[(4'he):(4'h9)]) : wire3[(1'h1):(1'h1)]) ?
              (~(((8'hb1) + wire2) ?
                  $signed(wire4) : wire4[(5'h15):(5'h13)])) : (reg7[(3'h6):(3'h5)] >>> reg9[(4'hd):(2'h3)])));
        end
      else
        begin
          reg9 <= wire5[(1'h0):(1'h0)];
          reg10 <= $signed(reg9);
        end
    end
  assign wire15 = ($signed(($unsigned((!reg7)) ?
                      ({wire0,
                          reg14} ~^ reg10[(5'h11):(3'h7)]) : ((^wire0) + $unsigned(reg7)))) <= ((8'ha1) ?
                      ((reg13[(4'hd):(1'h0)] >>> (^(8'had))) ?
                          $signed((wire0 ?
                              wire2 : wire1)) : reg13[(1'h1):(1'h1)]) : (reg7 + $signed((wire5 << wire3)))));
  assign wire16 = reg11;
  assign wire17 = reg9;
  always
    @(posedge clk) begin
      if (($signed(wire1[(4'hb):(4'h9)]) ? wire0 : wire1))
        begin
          reg18 <= wire1;
          reg19 <= (+reg8[(4'ha):(1'h1)]);
          reg20 <= $signed($signed(wire4));
          reg21 <= ($signed(reg18) + (&$signed(((reg19 >>> reg19) ?
              (reg12 ? wire15 : wire1) : (wire17 ? wire4 : wire15)))));
          reg22 <= ($signed(wire3) ?
              (7'h42) : ((~(~{reg13})) ?
                  ((reg12 << $signed(wire16)) ?
                      $signed({wire4, reg7}) : (((8'haa) || wire1) ?
                          (!wire1) : reg19)) : reg12));
        end
      else
        begin
          reg18 <= $signed($unsigned((reg14 ?
              (~(reg19 == wire5)) : (reg8[(4'he):(3'h4)] ?
                  wire17[(2'h2):(1'h0)] : reg10))));
          reg19 <= $unsigned($signed(wire16));
          reg20 <= (({(((7'h41) ? wire16 : wire5) >= (8'hbd))} ?
                  reg12[(1'h1):(1'h1)] : (($unsigned(wire4) ?
                          (wire17 + wire4) : (reg7 ? reg9 : wire2)) ?
                      $unsigned(wire3[(1'h1):(1'h0)]) : $signed({reg11,
                          reg8}))) ?
              reg7[(3'h5):(2'h3)] : (^wire1[(3'h7):(3'h4)]));
          reg21 <= {(wire1[(3'h4):(2'h3)] && (^((8'hb5) ?
                  (reg18 ? reg7 : reg21) : wire4)))};
        end
      reg23 <= (reg11[(1'h0):(1'h0)] ?
          (+(reg21[(3'h5):(1'h1)] ?
              $signed($signed(reg7)) : (reg7[(2'h3):(2'h2)] * (reg11 ?
                  wire0 : reg8)))) : (+{reg8[(3'h4):(1'h0)],
              ({wire5, wire5} ? wire1[(3'h5):(1'h1)] : $signed(reg22))}));
    end
  always
    @(posedge clk) begin
      reg24 <= {$signed((~^($signed(reg7) ?
              ((8'hbf) ? wire0 : wire15) : wire0[(1'h0):(1'h0)]))),
          $signed(((&$signed((8'hb4))) == wire15))};
    end
  assign wire25 = ((~|$signed(wire1)) + ($signed(reg19) ~^ wire15[(3'h5):(2'h2)]));
  assign wire26 = ($signed(reg11[(1'h1):(1'h1)]) > ((^~$unsigned({reg12,
                          wire17})) ?
                      (~&reg19[(4'ha):(3'h6)]) : (-$unsigned($unsigned(wire15)))));
  assign wire27 = (reg11[(4'ha):(3'h5)] && $signed(({(|wire16)} << wire3[(1'h1):(1'h0)])));
  assign wire28 = ((8'had) ^ (wire4[(4'hb):(4'ha)] & (~&({wire6, reg19} ?
                      wire17[(3'h4):(3'h4)] : reg7))));
endmodule
