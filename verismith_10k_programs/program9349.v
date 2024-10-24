module top
#(parameter param49 = (!(~|((((8'ha3) ? (7'h43) : (8'h9e)) ? ((8'haa) >> (8'hbb)) : ((8'hbb) * (8'haa))) > {{(8'h9d), (8'h9e)}}))), 
parameter param50 = (+((~param49) > param49)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h207):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire34;
  wire signed [(3'h5):(1'h0)] wire33;
  wire [(2'h3):(1'h0)] wire32;
  wire signed [(5'h13):(1'h0)] wire26;
  wire signed [(5'h10):(1'h0)] wire25;
  wire [(2'h2):(1'h0)] wire24;
  wire [(5'h11):(1'h0)] wire11;
  wire [(3'h6):(1'h0)] wire10;
  wire [(4'h9):(1'h0)] wire9;
  wire [(3'h7):(1'h0)] wire8;
  wire signed [(4'h9):(1'h0)] wire7;
  wire [(4'hd):(1'h0)] wire6;
  wire signed [(3'h6):(1'h0)] wire5;
  wire [(5'h11):(1'h0)] wire4;
  reg signed [(5'h13):(1'h0)] reg48 = (1'h0);
  reg [(5'h14):(1'h0)] reg47 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg46 = (1'h0);
  reg [(5'h12):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg43 = (1'h0);
  reg [(4'hc):(1'h0)] reg42 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg41 = (1'h0);
  reg [(5'h15):(1'h0)] reg40 = (1'h0);
  reg [(2'h3):(1'h0)] reg39 = (1'h0);
  reg [(5'h11):(1'h0)] reg38 = (1'h0);
  reg [(3'h4):(1'h0)] reg37 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg36 = (1'h0);
  reg [(2'h2):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg31 = (1'h0);
  reg [(4'hf):(1'h0)] reg30 = (1'h0);
  reg [(4'ha):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg28 = (1'h0);
  reg [(3'h7):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg23 = (1'h0);
  reg [(5'h10):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg18 = (1'h0);
  reg [(5'h14):(1'h0)] reg17 = (1'h0);
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(4'he):(1'h0)] reg12 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire32,
                 wire26,
                 wire25,
                 wire24,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire4 = wire1[(5'h15):(4'hd)];
  assign wire5 = (wire1[(5'h14):(3'h7)] ?
                     $unsigned(((wire0 || (!wire1)) ?
                         (wire4 ? wire4 : (wire0 <<< wire3)) : (wire0 ?
                             (^wire1) : wire2[(2'h3):(2'h3)]))) : $signed(wire4[(5'h10):(1'h1)]));
  assign wire6 = $unsigned(($signed($signed($unsigned((7'h43)))) ?
                     wire4 : (7'h41)));
  assign wire7 = wire4;
  assign wire8 = $signed($unsigned((!{$signed(wire2)})));
  assign wire9 = ((($unsigned((-wire2)) <<< wire3) ?
                     wire1[(4'hf):(2'h2)] : {wire8[(3'h5):(1'h0)]}) - {(!wire0),
                     (^~({wire8} ? $signed(wire2) : (wire4 * wire8)))});
  assign wire10 = wire9;
  assign wire11 = $unsigned(wire9[(2'h3):(2'h2)]);
  always
    @(posedge clk) begin
      reg12 <= (wire2[(3'h7):(2'h2)] ?
          ((|wire11[(4'h9):(4'h8)]) >> $signed(wire2[(4'h9):(3'h6)])) : $signed($unsigned(wire7[(3'h7):(1'h1)])));
      if (wire9[(1'h1):(1'h1)])
        begin
          if (reg12[(4'hc):(1'h1)])
            begin
              reg13 <= $unsigned((8'ha8));
              reg14 <= $signed(($unsigned((reg13 ?
                      ((8'hb4) ? wire6 : wire3) : reg12)) ?
                  {((~^wire2) ?
                          wire8 : ((8'ha1) ?
                              wire3 : wire7))} : $signed(($unsigned(reg13) ?
                      (reg13 > wire3) : wire6))));
              reg15 <= reg13[(4'ha):(1'h0)];
              reg16 <= wire4[(1'h1):(1'h1)];
              reg17 <= (-$signed((({reg13, reg16} > (reg15 ? reg13 : wire3)) ?
                  {wire4} : (+(!wire11)))));
            end
          else
            begin
              reg13 <= {(~&$unsigned({(reg12 | wire2), (reg14 >> wire11)}))};
              reg14 <= reg14[(1'h0):(1'h0)];
              reg15 <= $signed((8'hb7));
            end
          reg18 <= reg13;
          reg19 <= {$signed((reg18[(4'hc):(1'h0)] <= ((|reg14) | (~^wire7)))),
              $unsigned(reg18[(3'h4):(3'h4)])};
        end
      else
        begin
          reg13 <= (((wire4 ?
                      $unsigned({wire7, wire6}) : (wire10[(3'h6):(2'h2)] ?
                          reg12[(4'h8):(1'h0)] : $signed((8'ha0)))) ?
                  $unsigned(reg14) : reg17[(4'hb):(2'h3)]) ?
              $signed(wire6) : $unsigned((reg12[(4'hc):(3'h4)] ^ $signed((wire7 ?
                  wire8 : wire0)))));
          reg14 <= $signed($unsigned({$signed($signed(reg16)),
              (wire7[(1'h1):(1'h1)] ? reg12 : (wire1 - wire3))}));
          if (reg17)
            begin
              reg15 <= {wire6, (+{$unsigned({wire4}), $unsigned(wire11)})};
              reg16 <= reg15[(4'ha):(4'h8)];
              reg17 <= reg19;
              reg18 <= {(wire5[(1'h0):(1'h0)] && $unsigned(wire6[(4'hd):(2'h3)]))};
              reg19 <= wire4;
            end
          else
            begin
              reg15 <= $unsigned((&($signed(wire3) ?
                  $signed((wire8 | wire10)) : $signed((wire8 >>> wire7)))));
              reg16 <= (reg13[(4'hf):(4'he)] > reg18[(4'h9):(3'h6)]);
              reg17 <= ($signed((wire1 ?
                  wire1[(5'h15):(3'h4)] : $signed(wire9[(3'h4):(2'h2)]))) * $signed(wire10));
              reg18 <= wire0;
            end
        end
      if ((reg16 ?
          {((wire10[(3'h5):(3'h4)] ?
                  (wire9 ? (8'hbe) : reg18) : (+wire5)) ^~ $unsigned((reg19 ?
                  (8'h9e) : (8'hb8))))} : reg19))
        begin
          if ($unsigned(wire6[(3'h4):(2'h2)]))
            begin
              reg20 <= $signed(reg18);
              reg21 <= $signed(reg18);
            end
          else
            begin
              reg20 <= {(^~wire8)};
              reg21 <= reg21[(2'h3):(1'h0)];
              reg22 <= (^(~^{((wire2 <= wire9) && $signed(reg13))}));
            end
        end
      else
        begin
          reg20 <= $signed((reg14 ?
              reg22[(4'he):(4'he)] : {((~wire8) <= $signed((8'ha3))),
                  {wire0[(4'ha):(4'ha)]}}));
          reg21 <= {$signed($signed(({(8'haa), reg17} ?
                  (reg13 ? reg20 : wire8) : (reg22 ? (8'ha7) : wire3))))};
        end
      reg23 <= $unsigned(wire8);
    end
  assign wire24 = (($unsigned(wire11) ? reg21 : reg14) ?
                      wire1 : (wire5 ?
                          wire10[(2'h3):(2'h3)] : $unsigned(reg20)));
  assign wire25 = $unsigned($signed($unsigned(reg19[(1'h0):(1'h0)])));
  assign wire26 = wire2[(3'h6):(2'h3)];
  always
    @(posedge clk) begin
      reg27 <= wire5;
      reg28 <= (&({{$unsigned((8'hba)), {reg22, wire10}},
              (reg21 ? (wire4 == reg22) : wire11)} ?
          reg22 : $signed($unsigned($unsigned(wire11)))));
      reg29 <= (-((wire9[(3'h4):(3'h4)] ?
              (reg14 >> (-wire8)) : $signed(reg19[(1'h1):(1'h0)])) ?
          $signed((-$signed(wire10))) : wire1));
      reg30 <= (^{$signed((!wire7)), reg23});
      reg31 <= $unsigned(wire1);
    end
  assign wire32 = (reg19 ?
                      wire7[(3'h4):(3'h4)] : ((!{$unsigned((8'ha9)),
                              reg22[(3'h7):(3'h6)]}) ?
                          (8'hac) : (($unsigned(wire9) ?
                              {reg27,
                                  wire26} : reg14[(2'h2):(1'h1)]) | ((~wire6) >>> $unsigned(reg17)))));
  assign wire33 = ($unsigned($signed($unsigned($unsigned(reg19)))) ?
                      $unsigned(reg15[(4'h8):(3'h5)]) : wire1[(4'hc):(3'h7)]);
  assign wire34 = wire8;
  always
    @(posedge clk) begin
      reg35 <= wire32;
      if ($unsigned(reg15))
        begin
          reg36 <= $signed($signed((-{reg31})));
        end
      else
        begin
          reg36 <= (~|$signed(reg12));
          reg37 <= (+(~(reg14 ?
              wire6[(4'ha):(3'h5)] : ((^(8'h9c)) || (wire34 ?
                  (8'hab) : wire7)))));
          if ($signed($unsigned((-(8'hbf)))))
            begin
              reg38 <= reg13[(4'h8):(3'h6)];
              reg39 <= wire33[(3'h4):(2'h3)];
              reg40 <= (~|$signed($signed(wire3)));
            end
          else
            begin
              reg38 <= $unsigned(reg23[(2'h2):(2'h2)]);
              reg39 <= ((reg37 && {$signed((reg28 <= reg29)),
                  reg21}) & $unsigned((^(reg39 >= wire10[(2'h2):(1'h1)]))));
              reg40 <= reg17[(4'h8):(2'h3)];
              reg41 <= $signed($signed($signed(($signed(reg30) << reg39))));
            end
          reg42 <= reg35;
          if (((reg27 | ((!$signed((8'hb0))) ?
              $signed(wire6) : (8'had))) ^~ $unsigned({$signed(((7'h42) ?
                  wire0 : (8'ha4))),
              (8'hb9)})))
            begin
              reg43 <= $signed((+$unsigned($unsigned((^wire3)))));
              reg44 <= $signed($unsigned(wire1));
            end
          else
            begin
              reg43 <= wire7[(3'h4):(1'h0)];
              reg44 <= wire26[(4'h9):(4'h8)];
            end
        end
    end
  always
    @(posedge clk) begin
      reg45 <= reg38[(3'h5):(2'h3)];
      reg46 <= ((-(8'ha2)) | (~^wire11[(4'hc):(3'h4)]));
      reg47 <= $unsigned(reg29[(1'h0):(1'h0)]);
      reg48 <= reg22[(2'h3):(1'h1)];
    end
endmodule
