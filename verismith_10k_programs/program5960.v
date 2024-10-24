module top
#(parameter param29 = (+(8'hb7)), 
parameter param30 = param29)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h106):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire4;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire28;
  wire signed [(4'h9):(1'h0)] wire27;
  wire [(4'hd):(1'h0)] wire26;
  wire [(2'h2):(1'h0)] wire25;
  wire [(5'h15):(1'h0)] wire24;
  wire [(3'h5):(1'h0)] wire23;
  wire [(5'h14):(1'h0)] wire22;
  wire [(3'h7):(1'h0)] wire21;
  wire [(2'h3):(1'h0)] wire20;
  wire [(4'hf):(1'h0)] wire19;
  wire [(4'hc):(1'h0)] wire18;
  wire [(4'h9):(1'h0)] wire17;
  wire signed [(5'h13):(1'h0)] wire5;
  reg signed [(4'ha):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg15 = (1'h0);
  reg [(5'h15):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg11 = (1'h0);
  reg [(4'he):(1'h0)] reg10 = (1'h0);
  reg [(2'h3):(1'h0)] reg9 = (1'h0);
  reg [(5'h12):(1'h0)] reg8 = (1'h0);
  reg [(4'h8):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg6 = (1'h0);
  assign y = {wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire5,
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
  assign wire5 = $unsigned((($unsigned({(8'haa), wire4}) ?
                     wire3[(2'h3):(2'h2)] : $unsigned(wire4)) || (8'haf)));
  always
    @(posedge clk) begin
      if (($signed((~^wire0)) ?
          $unsigned($unsigned(wire3)) : $signed($unsigned(wire0[(4'ha):(4'ha)]))))
        begin
          if (($signed($signed({$signed((8'ha4))})) <<< ((^($unsigned(wire1) | {wire0,
              wire5})) >>> $unsigned(({wire3} & (wire5 ? wire2 : wire2))))))
            begin
              reg6 <= wire5[(4'hb):(1'h1)];
              reg7 <= $signed({(wire0 ?
                      (!wire4) : ({(8'hb4), wire3} ^ $unsigned(wire0))),
                  (wire2 <= wire1[(3'h5):(1'h1)])});
              reg8 <= ($signed($signed($unsigned($signed((8'ha1))))) ?
                  (~&wire2) : wire3);
            end
          else
            begin
              reg6 <= $unsigned(wire4[(3'h5):(1'h1)]);
              reg7 <= ((~&wire5) != wire5[(4'hf):(4'hf)]);
              reg8 <= wire1[(2'h2):(1'h1)];
              reg9 <= {(8'h9d)};
            end
          reg10 <= ((wire5[(5'h12):(3'h6)] ?
                  $unsigned(reg8) : ((((7'h41) - wire3) ?
                      (8'h9f) : ((8'hbe) + wire0)) ^~ ((8'hbe) ?
                      (wire4 ? wire0 : wire4) : (reg6 ? reg9 : wire4)))) ?
              reg8 : $unsigned((!reg9)));
          reg11 <= $unsigned((wire2 >>> reg8[(4'h9):(3'h4)]));
          reg12 <= wire4;
          reg13 <= wire3;
        end
      else
        begin
          reg6 <= {(reg10[(1'h1):(1'h1)] ?
                  $unsigned((((8'hbb) ? reg8 : wire0) ?
                      wire1[(3'h5):(3'h5)] : reg9[(1'h0):(1'h0)])) : $unsigned(($unsigned(reg6) ?
                      (8'ha7) : $signed(wire1))))};
          reg7 <= ($unsigned(((|reg12[(1'h0):(1'h0)]) ?
              wire1[(2'h3):(1'h1)] : (+reg13[(1'h0):(1'h0)]))) >> (~(^~reg11[(1'h1):(1'h0)])));
          reg8 <= wire2;
        end
      reg14 <= reg12;
      reg15 <= (|(~$signed($unsigned((reg8 ^ (8'hb0))))));
      reg16 <= ((+(reg11[(2'h2):(1'h1)] + wire2)) | (wire4 ?
          (reg13[(3'h4):(2'h3)] ^~ ({reg15} <<< $signed(wire3))) : $signed($unsigned((~&(8'hab))))));
    end
  assign wire17 = (~&(-$unsigned($unsigned({wire4, reg14}))));
  assign wire18 = $unsigned(reg8[(5'h10):(3'h5)]);
  assign wire19 = ((^(reg16[(2'h3):(2'h3)] ?
                      wire18[(1'h0):(1'h0)] : $unsigned($unsigned(reg10)))) != {(!$signed(reg13[(2'h3):(2'h2)])),
                      $unsigned(wire4[(4'h9):(2'h3)])});
  assign wire20 = ({(~$signed(reg7[(2'h2):(1'h1)])),
                          $unsigned($unsigned((~wire19)))} ?
                      $unsigned($signed((wire1 ?
                          reg9[(2'h2):(1'h1)] : $signed(reg10)))) : reg7);
  assign wire21 = $unsigned($signed(wire0[(4'h8):(4'h8)]));
  assign wire22 = {(reg12[(1'h1):(1'h1)] == (^{(wire19 == wire18)})),
                      $unsigned($signed(({reg8, wire1} == (wire21 ?
                          reg10 : reg9))))};
  assign wire23 = $signed((((8'ha1) >= wire20) && $unsigned((|reg14[(2'h3):(1'h0)]))));
  assign wire24 = wire19[(4'hc):(4'hc)];
  assign wire25 = reg12[(2'h3):(2'h2)];
  assign wire26 = (8'ha8);
  assign wire27 = (wire24[(2'h2):(2'h2)] * ($signed($unsigned($signed(wire21))) ?
                      reg14 : $signed(((wire19 == reg7) <<< {wire23,
                          wire24}))));
  assign wire28 = $signed(($signed($signed(reg11)) ?
                      (reg8[(3'h7):(3'h7)] ?
                          (+(~wire27)) : $signed({(8'ha3)})) : $unsigned($signed($signed(reg9)))));
endmodule
