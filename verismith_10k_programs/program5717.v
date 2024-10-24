module top
#(parameter param39 = (((((|(8'h9e)) ? ((8'hb1) ^ (7'h41)) : ((8'hae) ^ (8'haa))) ^~ (((8'h9c) ? (8'haa) : (8'h9d)) ? (~|(8'hb5)) : ((7'h40) ? (7'h42) : (8'hb5)))) ? {(!{(8'ha5)}), (((8'hb6) || (8'hb0)) ? (8'hb5) : ((8'h9c) ^~ (8'ha0)))} : ((^~{(8'hbe)}) ? {((8'hb0) >>> (8'ha5)), ((8'hb2) ? (8'haf) : (8'ha0))} : (-(8'hb8)))) + (((|(~&(8'h9e))) ? {((8'hbf) ? (7'h43) : (8'hb4))} : ({(8'hb3)} ~^ {(8'ha0), (8'h9d)})) && {(((8'hb3) ^~ (8'haf)) == ((8'hb9) ? (8'hb2) : (8'hbf))), ({(8'hbd), (8'h9e)} >> ((7'h41) - (7'h42)))})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h188):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire4;
  input wire [(4'hc):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire38;
  wire signed [(4'h8):(1'h0)] wire37;
  wire [(4'h9):(1'h0)] wire36;
  wire signed [(4'hb):(1'h0)] wire35;
  wire [(5'h11):(1'h0)] wire34;
  wire [(4'h9):(1'h0)] wire21;
  wire signed [(3'h4):(1'h0)] wire20;
  wire [(5'h12):(1'h0)] wire17;
  wire [(3'h5):(1'h0)] wire13;
  wire signed [(4'hd):(1'h0)] wire12;
  wire signed [(5'h14):(1'h0)] wire11;
  wire signed [(5'h15):(1'h0)] wire10;
  wire signed [(5'h13):(1'h0)] wire9;
  wire [(4'h8):(1'h0)] wire8;
  wire signed [(2'h3):(1'h0)] wire7;
  wire signed [(3'h6):(1'h0)] wire6;
  wire signed [(3'h6):(1'h0)] wire5;
  reg [(5'h14):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg32 = (1'h0);
  reg [(3'h5):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg29 = (1'h0);
  reg [(4'h9):(1'h0)] reg28 = (1'h0);
  reg [(4'ha):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg26 = (1'h0);
  reg [(5'h11):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg23 = (1'h0);
  reg [(5'h11):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg18 = (1'h0);
  reg [(3'h6):(1'h0)] reg16 = (1'h0);
  reg [(4'h8):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg14 = (1'h0);
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire21,
                 wire20,
                 wire17,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 reg19,
                 reg18,
                 reg16,
                 reg15,
                 reg14,
                 (1'h0)};
  assign wire5 = $signed($signed(($unsigned($signed(wire1)) && ((+wire2) ?
                     $unsigned(wire0) : {wire4}))));
  assign wire6 = ((wire4[(4'hb):(4'ha)] > (((8'hbd) ?
                         $unsigned(wire3) : $unsigned(wire0)) ?
                     $unsigned(wire0[(1'h1):(1'h0)]) : (wire1 | (^wire2)))) & ((wire2 > $signed((wire0 ?
                         wire0 : wire3))) ?
                     (~|(^~{wire4})) : $unsigned((8'hb9))));
  assign wire7 = (wire6 ?
                     $signed($unsigned($signed(wire4[(4'h8):(3'h4)]))) : $unsigned($unsigned((wire0 ?
                         wire0[(4'h9):(3'h6)] : (wire5 ? wire4 : (8'ha3))))));
  assign wire8 = (^$unsigned($unsigned((!(wire5 ? wire1 : (7'h44))))));
  assign wire9 = $signed(((wire0 ?
                         wire8[(3'h5):(3'h5)] : $unsigned(wire5[(3'h5):(2'h3)])) ?
                     wire7 : $unsigned(wire7[(2'h2):(1'h0)])));
  assign wire10 = (wire4[(3'h7):(2'h3)] ?
                      $unsigned($signed(wire2[(1'h0):(1'h0)])) : wire8[(1'h1):(1'h1)]);
  assign wire11 = ((|wire3[(2'h3):(2'h3)]) ?
                      (!((8'haf) && wire10[(5'h15):(3'h6)])) : (~wire4));
  assign wire12 = ((wire3 && $signed($signed($unsigned(wire1)))) ?
                      (($signed({wire10}) ?
                              $signed($unsigned(wire4)) : $signed(wire2[(3'h5):(3'h5)])) ?
                          (((wire3 ?
                              wire10 : wire2) | wire9[(5'h12):(4'hf)]) >>> ((wire0 ?
                              wire8 : wire10) - $signed(wire1))) : wire10[(3'h4):(2'h3)]) : $unsigned($unsigned(wire10[(4'he):(1'h0)])));
  assign wire13 = wire10;
  always
    @(posedge clk) begin
      reg14 <= (wire7 ? wire8 : $unsigned($unsigned(wire1[(2'h3):(2'h2)])));
      reg15 <= {$unsigned({wire9, $unsigned((+wire0))})};
      reg16 <= wire6;
    end
  assign wire17 = reg16;
  always
    @(posedge clk) begin
      reg18 <= ((((^~wire8[(3'h4):(3'h4)]) - (reg16[(3'h4):(1'h1)] ?
          (wire0 <= wire4) : wire1[(3'h4):(1'h0)])) <= (($unsigned(wire17) ?
              (8'had) : wire10[(3'h5):(1'h0)]) ?
          wire11[(4'ha):(1'h1)] : (-{wire3,
              wire6}))) + $unsigned((wire1[(4'he):(2'h2)] ?
          wire13[(2'h3):(2'h3)] : $signed((wire5 >>> wire13)))));
    end
  always
    @(posedge clk) begin
      reg19 <= reg15[(1'h0):(1'h0)];
    end
  assign wire20 = (!(($signed({wire5}) ^~ ((wire8 & wire4) * $signed((8'haf)))) <<< $signed((wire2[(2'h2):(2'h2)] ?
                      reg15[(3'h6):(2'h3)] : ((8'ha3) + wire13)))));
  assign wire21 = {(wire8[(2'h3):(1'h0)] ~^ $unsigned(((!(8'hb3)) - $signed(reg18)))),
                      $unsigned($unsigned(((wire2 ^ (8'had)) ?
                          wire6 : $signed((8'hb6)))))};
  always
    @(posedge clk) begin
      if ((+(+(8'h9d))))
        begin
          reg22 <= $unsigned(wire21);
          reg23 <= ((~|((+$signed(wire8)) ?
                  ($signed((8'hbe)) | (wire17 * reg22)) : (~(^reg22)))) ?
              ($unsigned($unsigned({wire12, reg16})) ?
                  $unsigned(($unsigned(reg18) ~^ (~(8'hb3)))) : (wire6 ?
                      reg22 : $unsigned(reg15[(2'h3):(1'h0)]))) : wire8[(3'h4):(1'h0)]);
          reg24 <= wire11[(2'h2):(1'h1)];
          reg25 <= (~(wire11[(5'h11):(3'h6)] && {((reg22 ? wire7 : reg23) ?
                  (^~reg15) : (reg22 ? reg23 : wire4)),
              $signed((^~reg22))}));
        end
      else
        begin
          if ($unsigned(reg19[(4'hf):(1'h1)]))
            begin
              reg22 <= ((8'hb4) ?
                  reg16[(2'h2):(1'h1)] : ($unsigned(wire11) ?
                      wire2[(3'h5):(1'h1)] : (((wire21 ^ (8'ha0)) ?
                              (&wire1) : wire11) ?
                          reg25 : $signed((wire1 ? reg15 : wire10)))));
              reg23 <= $signed($signed((~^{wire2})));
              reg24 <= (&wire17[(3'h5):(3'h5)]);
              reg25 <= $unsigned((wire7[(1'h1):(1'h0)] ?
                  reg18[(3'h6):(1'h0)] : wire9));
              reg26 <= ($unsigned(($unsigned($unsigned(wire2)) <= wire0)) ?
                  $signed($signed(reg24[(3'h5):(2'h3)])) : {($unsigned((wire2 ?
                              wire1 : wire7)) ?
                          $unsigned($unsigned(reg15)) : $signed($signed(reg16)))});
            end
          else
            begin
              reg22 <= (~&(~^wire0));
              reg23 <= reg19;
              reg24 <= $unsigned($unsigned($signed((8'hac))));
              reg25 <= $signed(reg26[(3'h5):(2'h2)]);
              reg26 <= wire5;
            end
          reg27 <= ($signed((&(~&{wire8, (8'hb6)}))) - (reg25 ?
              $unsigned(wire12) : reg24[(4'hd):(3'h6)]));
          reg28 <= reg26[(3'h5):(2'h2)];
          reg29 <= (wire3 ?
              reg24[(1'h1):(1'h0)] : ($signed((wire2 == wire6[(3'h4):(1'h1)])) | {{(8'ha1),
                      {reg14}}}));
          if (((|(^~wire20)) ?
              (^~$signed(wire4[(4'hb):(2'h3)])) : wire4[(3'h7):(3'h6)]))
            begin
              reg30 <= $unsigned(reg18[(2'h2):(1'h1)]);
              reg31 <= {(~^{{$unsigned(reg23)}, {wire11[(1'h1):(1'h0)]}}),
                  $unsigned((((^wire2) ?
                      (~|wire13) : $signed(reg24)) + reg24[(4'he):(4'hd)]))};
            end
          else
            begin
              reg30 <= (^~wire1);
              reg31 <= reg15[(3'h7):(1'h1)];
            end
        end
      reg32 <= (!$signed((wire3 == ($unsigned((8'hba)) ?
          {reg14} : (reg24 >= wire2)))));
      reg33 <= (($signed($signed(wire2)) ?
              (((^reg19) < reg16[(3'h4):(3'h4)]) ?
                  wire12[(2'h2):(1'h1)] : {$unsigned(wire0),
                      wire2[(3'h5):(1'h0)]}) : (8'hbe)) ?
          (wire12 ?
              {((^wire11) ? $unsigned(wire12) : $unsigned(wire1)),
                  ($signed(wire12) ~^ (!wire2))} : (8'hae)) : (8'hbd));
    end
  assign wire34 = ($unsigned(({$signed(reg31), (wire5 ? (8'hb7) : reg23)} ?
                          $signed((-wire9)) : ((reg30 ? wire13 : (8'hb1)) ?
                              {wire20, wire1} : $unsigned(reg19)))) ?
                      reg19 : (+($unsigned({reg19}) != wire1)));
  assign wire35 = (reg18[(3'h4):(3'h4)] ?
                      $signed(((&$signed(reg29)) ?
                          $signed(wire10) : wire20)) : (&$signed($unsigned(reg18[(3'h4):(3'h4)]))));
  assign wire36 = (~^(reg26 > {reg24}));
  assign wire37 = ($unsigned({reg15[(1'h1):(1'h0)]}) <<< ((~&wire11) ?
                      {((8'ha5) & ((8'hb2) > reg23))} : ($unsigned({wire8,
                              reg25}) ?
                          reg29[(3'h5):(2'h3)] : ((~|wire8) != $unsigned(reg25)))));
  assign wire38 = wire4;
endmodule
