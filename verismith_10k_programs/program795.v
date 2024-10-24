module top
#(parameter param48 = (-((((~|(8'hb6)) ? {(8'hbd)} : {(8'hb4), (8'ha8)}) ? (~|{(8'hb5), (8'hb8)}) : (|((8'hb7) ? (7'h44) : (8'ha4)))) ? ((((8'haa) ? (8'hb1) : (7'h44)) ? ((8'hac) - (8'ha3)) : ((8'ha4) ? (8'h9d) : (8'hb8))) ~^ (~{(7'h40), (8'hb0)})) : ({((8'ha8) ~^ (7'h43)), {(8'hb5), (8'hb9)}} ? ({(8'hae)} > ((7'h40) ? (8'hb0) : (8'hbe))) : {(~(8'ha8)), (~&(8'h9c))}))), 
parameter param49 = {(+(|((param48 | param48) ? (!param48) : (param48 & param48)))), (8'ha3)})
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h182):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire3;
  wire [(4'hc):(1'h0)] wire47;
  wire [(4'he):(1'h0)] wire10;
  wire signed [(2'h3):(1'h0)] wire11;
  wire signed [(5'h12):(1'h0)] wire45;
  reg [(4'h8):(1'h0)] reg4 = (1'h0);
  reg [(5'h10):(1'h0)] reg5 = (1'h0);
  reg [(3'h7):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  reg [(5'h10):(1'h0)] reg9 = (1'h0);
  reg [(4'he):(1'h0)] reg12 = (1'h0);
  reg [(4'h8):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg15 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg [(3'h6):(1'h0)] reg17 = (1'h0);
  reg [(5'h11):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg19 = (1'h0);
  reg [(4'hb):(1'h0)] reg20 = (1'h0);
  reg [(4'hc):(1'h0)] reg21 = (1'h0);
  reg [(4'hc):(1'h0)] reg22 = (1'h0);
  reg [(4'hd):(1'h0)] reg23 = (1'h0);
  reg [(5'h10):(1'h0)] reg24 = (1'h0);
  reg [(5'h13):(1'h0)] reg25 = (1'h0);
  reg [(2'h2):(1'h0)] reg26 = (1'h0);
  reg [(4'hf):(1'h0)] reg27 = (1'h0);
  reg [(5'h13):(1'h0)] reg28 = (1'h0);
  reg [(5'h11):(1'h0)] reg29 = (1'h0);
  reg [(5'h10):(1'h0)] reg30 = (1'h0);
  reg [(3'h4):(1'h0)] reg31 = (1'h0);
  reg [(4'hb):(1'h0)] reg32 = (1'h0);
  assign y = {wire47,
                 wire10,
                 wire11,
                 wire45,
                 reg4,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (&wire0);
      if (((&$unsigned(wire0)) ? (7'h41) : reg4))
        begin
          reg5 <= (!$signed((&$signed((wire0 > (8'h9f))))));
          reg6 <= wire0;
          reg7 <= ((8'ha5) && (8'ha2));
        end
      else
        begin
          if ((8'ha1))
            begin
              reg5 <= ((-$signed(((^~wire1) ^~ (wire2 ? wire0 : wire3)))) ?
                  ($signed(wire3[(3'h7):(2'h2)]) || reg7[(4'hf):(4'hb)]) : (wire3 <= (wire0 * $unsigned({wire1}))));
            end
          else
            begin
              reg5 <= $unsigned(wire3[(1'h1):(1'h0)]);
              reg6 <= {($unsigned(((wire3 && wire0) ?
                          wire0[(2'h3):(2'h3)] : reg4[(4'h8):(1'h1)])) ?
                      {$signed($signed(wire1))} : (~|(8'hb0))),
                  reg7};
            end
          reg7 <= (8'hae);
          reg8 <= {wire0, wire3[(4'he):(4'ha)]};
        end
      reg9 <= (+reg8[(4'h9):(1'h1)]);
    end
  assign wire10 = (reg9[(5'h10):(3'h5)] >= ((^~(^~$unsigned(reg8))) ?
                      (-(8'ha4)) : (wire1[(3'h7):(3'h7)] ?
                          $unsigned((wire3 ?
                              wire1 : reg5)) : reg7[(5'h15):(4'hf)])));
  assign wire11 = $unsigned($unsigned({$signed(reg7[(5'h15):(4'hb)])}));
  always
    @(posedge clk) begin
      reg12 <= $signed({(~{reg4})});
      reg13 <= {wire2};
      reg14 <= ({$signed((8'hb8))} >> wire1);
    end
  always
    @(posedge clk) begin
      reg15 <= ($signed(wire3[(3'h7):(1'h0)]) - (reg9[(2'h2):(1'h1)] ?
          wire10[(4'hb):(3'h4)] : $signed((reg6[(3'h7):(3'h4)] < (reg12 ^~ reg14)))));
      if ((($unsigned($unsigned($signed(reg15))) ?
          ($unsigned((^~reg13)) ?
              wire11[(1'h1):(1'h1)] : $unsigned($unsigned(reg5))) : reg4) >> wire3[(4'h9):(1'h0)]))
        begin
          reg16 <= reg13;
          reg17 <= ((((~^(wire3 < reg6)) <= ($signed(wire10) << ((8'hb2) ?
                  wire10 : wire1))) + ($unsigned((reg9 ?
                  reg8 : wire10)) + (!reg15[(3'h7):(3'h7)]))) ?
              ((8'h9e) ?
                  reg9[(1'h1):(1'h1)] : $unsigned(wire1)) : wire11[(1'h0):(1'h0)]);
          reg18 <= reg16[(4'ha):(3'h4)];
          reg19 <= (reg8[(2'h2):(1'h0)] ?
              ((~((wire2 && reg9) ?
                      wire2[(1'h0):(1'h0)] : wire1[(1'h0):(1'h0)])) ?
                  $signed((|wire10)) : (7'h44)) : $signed({$signed(reg9[(1'h1):(1'h0)])}));
          reg20 <= reg12;
        end
      else
        begin
          reg16 <= ($unsigned((((wire11 == reg14) ? (7'h41) : $signed(wire10)) ?
                  (~^$signed(reg13)) : $unsigned($unsigned(wire11)))) ?
              wire2 : (^reg20[(2'h3):(1'h0)]));
          reg17 <= (($unsigned(((~reg8) ?
                  $signed(reg4) : reg13)) <<< (+(reg7 > (reg12 ?
                  wire0 : reg14)))) ?
              reg12[(4'hd):(4'h9)] : $signed($signed($unsigned((reg6 ?
                  wire3 : (8'h9f))))));
          if (reg13[(3'h5):(2'h3)])
            begin
              reg18 <= (8'h9d);
              reg19 <= (wire11[(1'h1):(1'h1)] ?
                  (((!wire1) ? reg9 : $signed(reg13[(3'h6):(1'h0)])) ?
                      $signed((reg12 && $signed(reg17))) : $unsigned(reg17)) : reg16[(4'h8):(3'h4)]);
              reg20 <= ($signed({$signed(reg4), (~(^(8'haf)))}) | reg14);
              reg21 <= reg18[(1'h0):(1'h0)];
              reg22 <= reg9[(3'h5):(3'h5)];
            end
          else
            begin
              reg18 <= ($unsigned(((reg21[(1'h0):(1'h0)] >>> $unsigned(reg8)) || reg18)) ?
                  ($unsigned((~&(reg14 ? reg4 : reg4))) >= $signed(((^~wire11) ?
                      (reg5 ^ wire0) : (wire10 <= reg5)))) : $signed(($unsigned((|wire2)) ?
                      $signed({reg7, reg5}) : $unsigned(((8'ha5) && wire11)))));
            end
          if (reg14)
            begin
              reg23 <= (!$signed($unsigned($unsigned(((8'haf) ^ (8'ha9))))));
              reg24 <= $unsigned(reg23);
              reg25 <= reg15[(3'h5):(2'h2)];
              reg26 <= (^(($signed(((8'ha5) ?
                  wire0 : wire3)) - ($signed(reg14) ?
                  (reg23 ~^ (7'h40)) : (|(8'hb2)))) >>> (~|{reg21})));
              reg27 <= reg25;
            end
          else
            begin
              reg23 <= $unsigned(reg17[(1'h0):(1'h0)]);
            end
        end
      if ((~^$signed(((&reg20) ?
          (|$signed(reg13)) : {(reg26 ? reg13 : reg13)}))))
        begin
          if ({{$unsigned(reg16[(3'h4):(1'h1)]),
                  $signed($unsigned((reg5 & wire3)))},
              reg5})
            begin
              reg28 <= $unsigned(((~$signed(reg4[(3'h4):(3'h4)])) <= (^(&$signed((8'ha4))))));
              reg29 <= reg16;
              reg30 <= (^~$unsigned(reg8));
              reg31 <= $signed($unsigned($signed($unsigned(reg22))));
            end
          else
            begin
              reg28 <= (reg15[(3'h5):(1'h0)] ?
                  $signed($signed((reg27[(4'ha):(4'h8)] <<< $signed(reg31)))) : $unsigned($signed($signed($signed(reg22)))));
              reg29 <= $unsigned($signed({$unsigned(reg27[(3'h5):(2'h3)])}));
              reg30 <= $unsigned($unsigned($unsigned(reg6[(3'h7):(3'h7)])));
              reg31 <= wire11;
              reg32 <= reg8[(4'h8):(3'h5)];
            end
        end
      else
        begin
          if ((-{reg22[(2'h2):(1'h1)]}))
            begin
              reg28 <= (+$signed(reg19[(4'h9):(4'h9)]));
              reg29 <= reg32[(3'h7):(3'h7)];
              reg30 <= $unsigned(($signed(((reg20 ? wire10 : reg9) ?
                  (^reg15) : {(8'hbf)})) >= reg18[(4'h9):(3'h6)]));
              reg31 <= (((reg21[(2'h3):(2'h2)] ?
                      reg18 : ((8'hb9) ~^ wire0[(4'he):(1'h0)])) ?
                  $signed(((wire11 ? (8'hb9) : reg12) ?
                      (reg19 != reg16) : reg29)) : ({(~^wire11),
                          $signed(reg23)} ?
                      $unsigned((!reg17)) : reg26)) <= $unsigned(reg20));
            end
          else
            begin
              reg28 <= $signed($unsigned({$signed(wire11[(1'h1):(1'h1)]),
                  $unsigned((8'hb2))}));
              reg29 <= $unsigned($unsigned((reg4 | {$signed(reg31)})));
              reg30 <= reg25[(3'h4):(2'h2)];
              reg31 <= reg22[(3'h5):(2'h2)];
              reg32 <= ((reg20 + (($unsigned((8'hbe)) * (reg17 ?
                          (8'haa) : reg18)) ?
                      (8'hb6) : $signed((8'hac)))) ?
                  (-$signed(reg6[(3'h7):(3'h6)])) : $signed(reg6));
            end
        end
    end
  module33 #() modinst46 (.wire36(reg18), .y(wire45), .wire37(reg7), .wire34(wire1), .clk(clk), .wire35(reg21));
  assign wire47 = $signed(reg25);
endmodule

module module33  (y, clk, wire37, wire36, wire35, wire34);
  output wire [(32'h4c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire37;
  input wire [(5'h11):(1'h0)] wire36;
  input wire signed [(4'hc):(1'h0)] wire35;
  input wire [(5'h15):(1'h0)] wire34;
  wire [(4'ha):(1'h0)] wire44;
  wire signed [(4'ha):(1'h0)] wire43;
  wire [(5'h10):(1'h0)] wire42;
  wire [(5'h13):(1'h0)] wire41;
  wire [(4'h9):(1'h0)] wire40;
  wire signed [(2'h3):(1'h0)] wire39;
  wire signed [(4'h8):(1'h0)] wire38;
  assign y = {wire44, wire43, wire42, wire41, wire40, wire39, wire38, (1'h0)};
  assign wire38 = wire36[(5'h11):(3'h7)];
  assign wire39 = ((wire35[(4'ha):(1'h1)] >>> wire35[(4'h9):(4'h8)]) >= wire34[(3'h6):(3'h5)]);
  assign wire40 = (~wire37);
  assign wire41 = ((((8'ha7) && (|{wire37})) ?
                      (&($signed(wire38) - wire34)) : $unsigned(($signed(wire37) ?
                          wire38 : (!wire36)))) >= $unsigned((!(wire38[(1'h1):(1'h1)] >= $signed(wire39)))));
  assign wire42 = (wire37[(4'hb):(3'h4)] > (wire37[(1'h1):(1'h1)] * (((wire41 * (8'ha8)) ?
                      (wire35 ? wire37 : wire38) : ((8'hb0) ?
                          (8'hbe) : wire39)) ^~ wire34[(5'h12):(4'ha)])));
  assign wire43 = (wire36[(3'h6):(1'h0)] ?
                      {($signed((wire37 ? wire41 : wire34)) ?
                              {(wire40 + wire39)} : $unsigned((wire34 | wire34))),
                          wire42} : ((((wire42 ? wire35 : (8'ha9)) || ((8'ha5) ?
                              wire42 : wire39)) * $unsigned(wire41[(4'hc):(2'h2)])) ?
                          (~$unsigned(wire36[(4'h9):(3'h6)])) : {{wire37[(5'h11):(4'hf)]}}));
  assign wire44 = $signed(((8'ha2) - (((^wire41) ?
                          $signed(wire40) : (wire37 ? wire41 : wire34)) ?
                      wire41 : wire39)));
endmodule
