module top
#(parameter param39 = ((((+(8'h9c)) ? (((8'hbf) ^ (8'hbd)) ? ((8'ha3) ^ (7'h41)) : {(8'h9d)}) : {((8'ha9) ? (8'had) : (8'haa)), ((8'ha6) ? (8'haf) : (8'hbb))}) ? {((!(8'hb7)) ? ((8'ha3) ? (8'haf) : (8'ha6)) : ((8'hb5) ? (8'ha3) : (8'hb3)))} : (~^(+(|(8'hba))))) ? (((^{(8'ha4), (7'h40)}) ? {{(7'h43)}} : (|((8'ha8) ? (8'hbb) : (8'ha5)))) ? {(^~(~|(8'hb4)))} : (((8'hb8) > ((8'hbb) | (8'hb9))) ? (((8'hab) ? (8'had) : (8'ha1)) | {(8'h9d), (8'h9d)}) : (!((8'h9d) && (8'h9c))))) : ((~^(&{(7'h40)})) >> ({{(7'h43)}} + {((8'ha4) >= (8'hac))}))), 
parameter param40 = (param39 ? param39 : param39))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h17c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire38;
  wire [(3'h5):(1'h0)] wire37;
  wire signed [(5'h12):(1'h0)] wire36;
  wire [(5'h12):(1'h0)] wire35;
  wire [(3'h4):(1'h0)] wire34;
  wire signed [(4'hc):(1'h0)] wire15;
  reg [(4'hf):(1'h0)] reg33 = (1'h0);
  reg [(4'he):(1'h0)] reg32 = (1'h0);
  reg [(5'h10):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg28 = (1'h0);
  reg [(2'h3):(1'h0)] reg27 = (1'h0);
  reg signed [(4'he):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg24 = (1'h0);
  reg [(5'h12):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg22 = (1'h0);
  reg [(2'h2):(1'h0)] reg21 = (1'h0);
  reg [(2'h3):(1'h0)] reg20 = (1'h0);
  reg [(3'h6):(1'h0)] reg19 = (1'h0);
  reg [(5'h14):(1'h0)] reg18 = (1'h0);
  reg [(4'he):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg12 = (1'h0);
  reg [(4'h9):(1'h0)] reg11 = (1'h0);
  reg [(4'hf):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg5 = (1'h0);
  reg [(2'h3):(1'h0)] reg4 = (1'h0);
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire15,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
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
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= ($signed($unsigned((~wire0))) ?
          ({(&(^~wire3))} ? (8'hb3) : (+$signed($unsigned(wire0)))) : wire2);
      if ((^wire3[(3'h5):(3'h5)]))
        begin
          reg5 <= $signed(wire2);
        end
      else
        begin
          reg5 <= (8'h9e);
          reg6 <= ((!wire0) ?
              {($signed((~wire0)) ?
                      $signed({(8'hb6), reg5}) : wire0[(3'h7):(2'h2)]),
                  wire0[(2'h2):(1'h0)]} : $signed(reg4[(2'h2):(2'h2)]));
          if ((!wire1[(1'h1):(1'h0)]))
            begin
              reg7 <= (~wire1[(3'h6):(1'h1)]);
              reg8 <= reg5;
              reg9 <= ($unsigned((8'ha6)) << $unsigned((~&(~$signed((8'h9e))))));
            end
          else
            begin
              reg7 <= reg6;
              reg8 <= $signed((~&reg8[(3'h5):(1'h1)]));
              reg9 <= {$unsigned(wire3[(1'h0):(1'h0)]),
                  (reg9[(2'h3):(2'h2)] >> wire1)};
              reg10 <= (~|wire1);
              reg11 <= (!$unsigned(wire0[(1'h1):(1'h1)]));
            end
          reg12 <= $unsigned({reg11, reg9[(1'h0):(1'h0)]});
        end
      reg13 <= (&$signed((8'hb3)));
      reg14 <= $unsigned(((8'hb4) ?
          (reg11 < $unsigned((reg12 ? reg13 : (7'h40)))) : ((~&(wire2 ?
                  wire0 : wire0)) ?
              $unsigned(reg11[(3'h7):(2'h3)]) : {reg8[(1'h1):(1'h0)],
                  {reg13}})));
    end
  assign wire15 = reg13[(3'h4):(1'h0)];
  always
    @(posedge clk) begin
      reg16 <= reg8;
    end
  always
    @(posedge clk) begin
      if (reg12[(4'h9):(1'h0)])
        begin
          reg17 <= $unsigned($unsigned($unsigned({reg8[(2'h2):(1'h1)], reg7})));
          reg18 <= {(wire15 < $signed(wire1[(1'h1):(1'h0)])),
              reg6[(4'hc):(3'h7)]};
        end
      else
        begin
          if (({wire2[(5'h12):(4'hc)]} & wire15))
            begin
              reg17 <= reg10;
              reg18 <= ($unsigned(reg13[(1'h0):(1'h0)]) ?
                  {reg16[(3'h5):(3'h5)]} : ($unsigned(reg16[(3'h5):(1'h1)]) ?
                      ($unsigned(reg13) ?
                          (wire0[(4'h8):(1'h1)] << $unsigned(reg5)) : $unsigned((!reg12))) : $unsigned(reg5[(3'h4):(2'h3)])));
            end
          else
            begin
              reg17 <= $unsigned($signed($unsigned($unsigned((wire3 ?
                  reg7 : reg11)))));
              reg18 <= reg16;
              reg19 <= ((~^wire0) ?
                  (~(reg10[(3'h7):(3'h4)] ?
                      $signed({reg17,
                          wire2}) : ($unsigned(reg9) >> wire0))) : $signed((~^reg12[(1'h1):(1'h0)])));
              reg20 <= (^~reg5);
              reg21 <= (!((reg17 ?
                      ($signed(reg16) & (8'ha3)) : $unsigned(reg5[(3'h4):(2'h2)])) ?
                  $unsigned(((~&reg13) || (reg12 ?
                      reg6 : (8'hb2)))) : ($signed(reg6) || $signed(reg5))));
            end
          reg22 <= {$unsigned({reg9}),
              (reg17[(4'h9):(1'h0)] ?
                  (~$unsigned((reg12 || reg21))) : $signed({{reg10, reg4},
                      (wire1 && wire0)}))};
          if ($unsigned((~reg9[(2'h3):(2'h3)])))
            begin
              reg23 <= {$signed(($unsigned({reg12}) != reg17[(2'h3):(1'h0)])),
                  ({reg14} < ((reg21[(2'h2):(1'h0)] ?
                      (&reg8) : reg13) >>> {{reg13, reg22}}))};
              reg24 <= $unsigned(($signed(reg12[(1'h0):(1'h0)]) >= ({(reg6 ?
                          reg19 : reg4)} ?
                  ((reg7 <= (8'had)) ?
                      (reg16 >> (8'ha2)) : ((8'hb9) & reg13)) : {(reg11 | wire2)})));
              reg25 <= reg5;
              reg26 <= reg18;
              reg27 <= ((^($signed(reg21[(2'h2):(2'h2)]) ?
                  wire0[(3'h6):(3'h5)] : {{wire3}})) * (reg11 ?
                  (^~reg6) : $unsigned({$signed(reg26)})));
            end
          else
            begin
              reg23 <= ($signed(reg27[(1'h1):(1'h1)]) | (~|({$signed(reg11),
                      (~^reg4)} ?
                  (~|{reg8, (7'h44)}) : ($unsigned(reg7) ^~ $signed(reg8)))));
              reg24 <= ((reg14[(1'h0):(1'h0)] ?
                  {reg24[(4'h8):(3'h6)]} : {({reg14} != $unsigned(reg16))}) && (+(8'ha0)));
              reg25 <= (reg24[(1'h0):(1'h0)] ?
                  reg23[(5'h12):(4'h9)] : reg16[(3'h5):(2'h3)]);
            end
          reg28 <= reg6[(3'h5):(2'h2)];
          if (wire2)
            begin
              reg29 <= $unsigned((reg12[(4'h9):(2'h2)] ?
                  $signed((reg8 < (reg20 ?
                      wire0 : wire2))) : $unsigned((8'hb0))));
              reg30 <= (wire0[(4'ha):(4'h9)] ?
                  (~&$unsigned((+(wire1 >>> reg12)))) : {reg4[(1'h1):(1'h1)]});
              reg31 <= reg28;
              reg32 <= ($unsigned((~^((~^reg8) ?
                      (wire3 <<< reg28) : $signed(reg21)))) ?
                  $unsigned($unsigned(((reg26 >= reg24) ?
                      reg28[(4'he):(2'h3)] : (reg14 ?
                          reg8 : wire0)))) : $unsigned((~|{reg31})));
              reg33 <= reg6;
            end
          else
            begin
              reg29 <= (reg23 ^~ ($signed(reg4) + (reg6[(3'h6):(2'h3)] << $unsigned((reg8 ?
                  reg33 : wire3)))));
              reg30 <= $signed(reg20);
              reg31 <= $signed((((reg24[(3'h7):(3'h6)] & {wire2}) < (reg22 ?
                  reg8[(3'h6):(2'h3)] : {(8'ha8), (8'hb6)})) & reg33));
            end
        end
    end
  assign wire34 = reg22[(3'h4):(1'h0)];
  assign wire35 = (reg27 ^ ($unsigned(reg28[(3'h7):(3'h6)]) ?
                      ((~&{wire0}) ?
                          reg28[(5'h11):(4'hd)] : (reg27[(1'h0):(1'h0)] >> reg27)) : $signed(($signed(reg11) ?
                          reg31 : (reg22 <= reg19)))));
  assign wire36 = $signed({$signed({reg24[(4'h9):(3'h7)]}),
                      $unsigned($signed($unsigned(reg7)))});
  assign wire37 = {((~^reg11[(2'h3):(2'h2)]) ? (!(!$signed(wire35))) : reg21)};
  assign wire38 = $unsigned(reg18[(3'h5):(3'h5)]);
endmodule
