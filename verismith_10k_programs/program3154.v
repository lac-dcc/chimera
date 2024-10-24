module top
#(parameter param53 = (~((({(8'h9e), (8'hab)} < ((8'h9d) ? (8'ha6) : (8'hb5))) < {((7'h43) == (8'hb4)), {(8'hbd), (8'ha5)}}) ~^ (|(((8'ha3) ? (7'h44) : (8'hbb)) ? {(8'ha7), (8'hb4)} : ((8'hb3) ? (8'hb1) : (8'hb1)))))), 
parameter param54 = param53)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h197):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire4;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire44;
  wire [(4'hc):(1'h0)] wire36;
  wire [(4'hf):(1'h0)] wire26;
  wire signed [(2'h3):(1'h0)] wire23;
  wire [(4'ha):(1'h0)] wire22;
  wire signed [(4'h8):(1'h0)] wire20;
  wire [(5'h13):(1'h0)] wire5;
  reg [(2'h3):(1'h0)] reg52 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg51 = (1'h0);
  reg [(3'h5):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg49 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg47 = (1'h0);
  reg [(5'h13):(1'h0)] reg46 = (1'h0);
  reg [(4'hf):(1'h0)] reg45 = (1'h0);
  reg [(4'hb):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg42 = (1'h0);
  reg [(3'h7):(1'h0)] reg41 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg39 = (1'h0);
  reg [(5'h13):(1'h0)] reg38 = (1'h0);
  reg [(5'h14):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg35 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg32 = (1'h0);
  reg [(4'hc):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg29 = (1'h0);
  reg [(5'h12):(1'h0)] reg28 = (1'h0);
  reg [(5'h14):(1'h0)] reg27 = (1'h0);
  reg [(4'hd):(1'h0)] reg25 = (1'h0);
  reg [(4'he):(1'h0)] reg24 = (1'h0);
  assign y = {wire44,
                 wire36,
                 wire26,
                 wire23,
                 wire22,
                 wire20,
                 wire5,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg25,
                 reg24,
                 (1'h0)};
  assign wire5 = $signed((((!$signed(wire2)) >= wire0) ?
                     (((wire4 ~^ wire0) ? $unsigned(wire4) : $signed(wire3)) ?
                         wire1[(4'ha):(3'h4)] : $unsigned(wire3[(4'ha):(3'h7)])) : (|$unsigned(wire0))));
  module6 #() modinst21 (wire20, clk, wire5, wire1, wire4, wire2);
  assign wire22 = $unsigned(wire5);
  assign wire23 = $unsigned(wire4);
  always
    @(posedge clk) begin
      reg24 <= {wire2[(3'h4):(2'h3)],
          {$unsigned($unsigned($unsigned(wire4))),
              $unsigned(wire22[(3'h6):(1'h1)])}};
    end
  always
    @(posedge clk) begin
      reg25 <= (wire0[(4'hd):(3'h7)] ?
          ((wire1[(3'h7):(3'h7)] ?
              (~|wire22) : $unsigned((-wire2))) + $unsigned((^$unsigned(wire22)))) : (8'hae));
    end
  assign wire26 = wire2;
  always
    @(posedge clk) begin
      reg27 <= ($signed(({(wire0 >> wire22),
              (reg25 ? reg24 : wire5)} >= $unsigned((~&wire5)))) ?
          (7'h40) : reg25);
      reg28 <= {{({(wire5 ? wire3 : wire26),
                  (^wire3)} <<< wire20[(3'h5):(3'h4)]),
              wire3},
          wire1[(3'h6):(1'h1)]};
      if (reg25[(1'h0):(1'h0)])
        begin
          if (($signed($unsigned((wire20 ?
              wire26[(1'h1):(1'h1)] : reg24[(3'h6):(1'h0)]))) & (8'hb4)))
            begin
              reg29 <= $signed($signed($signed(wire0)));
              reg30 <= $signed($signed($signed(((reg29 ? reg25 : wire1) ?
                  wire23 : $signed(wire22)))));
              reg31 <= {wire3[(4'hd):(4'hb)]};
              reg32 <= wire5[(4'he):(3'h7)];
              reg33 <= ((~&$signed($signed($signed((8'hb9))))) <= $signed($unsigned($signed($unsigned(wire0)))));
            end
          else
            begin
              reg29 <= (((~^wire5[(4'ha):(3'h6)]) >= $unsigned((8'ha8))) <<< (8'hab));
              reg30 <= {(reg31 <= $unsigned((~|$unsigned(wire2)))), reg33};
              reg31 <= {$unsigned($unsigned($unsigned((wire1 ?
                      wire4 : reg33))))};
            end
          reg34 <= $signed(wire5);
          reg35 <= reg34[(3'h4):(1'h0)];
        end
      else
        begin
          if (wire20)
            begin
              reg29 <= {$unsigned(wire23),
                  {$unsigned(((reg32 ? wire26 : wire1) ?
                          $unsigned((8'hb7)) : $unsigned(reg24)))}};
              reg30 <= (($unsigned((^$unsigned(reg35))) + ($unsigned((reg34 || reg24)) ?
                  {wire4} : (~&reg28))) <= ((reg34 || $unsigned($unsigned(wire26))) ?
                  {(((8'haf) ? reg34 : wire5) ? {reg24} : wire1[(3'h5):(2'h3)]),
                      reg29} : $unsigned((^~(reg25 > wire4)))));
              reg31 <= $signed(reg29);
            end
          else
            begin
              reg29 <= wire4;
              reg30 <= ({reg35, reg29} ?
                  $unsigned((^reg24[(1'h1):(1'h0)])) : $unsigned($unsigned({reg30,
                      wire3})));
            end
          reg32 <= $unsigned($unsigned(((+$signed((7'h42))) <<< ((wire5 >> reg33) ?
              (8'hbf) : reg29))));
          reg33 <= (reg34 ?
              reg34 : {$unsigned($unsigned($signed(wire5))),
                  {(!$signed(reg27))}});
          reg34 <= $signed({$unsigned(wire0[(2'h3):(2'h3)]),
              {((wire2 ? reg31 : wire22) * $signed(reg28)), wire26}});
        end
    end
  assign wire36 = $unsigned((!(reg31[(3'h6):(1'h1)] || ($unsigned((8'hbe)) ?
                      wire5 : $unsigned(reg27)))));
  always
    @(posedge clk) begin
      reg37 <= $signed(reg24);
      reg38 <= (^~(~(((&reg25) && wire5[(4'hd):(3'h7)]) * ((wire26 >= reg37) >>> reg32[(3'h6):(1'h0)]))));
      if (wire23)
        begin
          reg39 <= $signed((~$signed($unsigned(((8'hb6) ? reg24 : reg24)))));
          reg40 <= reg24[(4'hd):(1'h0)];
          reg41 <= ((wire1 < $unsigned((~&wire20[(3'h5):(1'h0)]))) * {$signed(reg32)});
          reg42 <= (wire36 && ((($unsigned((8'hbd)) ?
                      $signed(wire1) : (reg32 ? wire36 : reg30)) ?
                  (|reg29[(1'h0):(1'h0)]) : (~&{(8'hb3), reg28})) ?
              wire23 : reg35));
          reg43 <= $unsigned((^{((wire2 ? wire20 : reg31) ?
                  $unsigned(wire23) : (reg30 ? reg27 : reg35))}));
        end
      else
        begin
          reg39 <= $signed($signed(reg33));
          reg40 <= $unsigned({({wire5} ?
                  $unsigned($unsigned(reg29)) : $unsigned(reg28))});
          reg41 <= reg32;
        end
    end
  assign wire44 = (wire4[(2'h3):(2'h2)] ?
                      (-(({reg37} ?
                          ((8'ha3) ? reg41 : wire5) : (^~reg24)) > ((&reg38) ?
                          {reg42} : (reg27 ?
                              wire1 : wire5)))) : $unsigned((!(-reg32[(4'hf):(3'h4)]))));
  always
    @(posedge clk) begin
      reg45 <= (^~wire4);
      reg46 <= ($signed($unsigned($signed((reg25 ? (8'hb6) : reg42)))) ?
          (^~$unsigned((^~(reg31 ?
              reg25 : wire0)))) : $signed($signed(wire26)));
      if ((+reg42))
        begin
          reg47 <= wire23;
          reg48 <= $signed(({($signed(reg28) ?
                      wire0[(3'h5):(3'h5)] : $unsigned(wire36)),
                  $signed((reg37 ? reg33 : reg45))} ?
              $unsigned(($unsigned(reg43) ?
                  wire0[(5'h10):(4'hf)] : (wire23 == wire20))) : (^$signed($signed((8'h9c))))));
          reg49 <= ((wire26 ?
                  ($unsigned((7'h41)) << $unsigned(wire4)) : (reg42 ?
                      $unsigned($signed(reg48)) : reg33[(4'h8):(1'h0)])) ?
              {reg29} : ({wire26, ({reg43} - wire36[(3'h7):(3'h6)])} ?
                  wire3[(4'he):(2'h2)] : (reg31 || reg25)));
          reg50 <= ($signed((~wire36[(2'h3):(1'h0)])) ?
              $signed($unsigned(reg45[(4'ha):(3'h4)])) : $unsigned(wire2[(3'h4):(2'h2)]));
          if (($unsigned(reg28) + reg45[(4'hd):(4'hd)]))
            begin
              reg51 <= reg24;
              reg52 <= $signed((~^reg30));
            end
          else
            begin
              reg51 <= (-(^~({reg43[(3'h4):(3'h4)]} >>> reg45)));
            end
        end
      else
        begin
          reg47 <= $signed((((&(|reg25)) ?
                  (reg40 <= (reg24 < reg25)) : wire23[(1'h1):(1'h0)]) ?
              reg47 : (-({reg43, reg42} + (wire5 ? reg29 : reg48)))));
          reg48 <= wire44[(4'hc):(2'h3)];
          reg49 <= (($signed(reg49[(4'ha):(4'h9)]) ?
              (wire5[(3'h4):(1'h0)] & $signed($unsigned(reg43))) : reg45) << (|(reg33 ?
              ($signed(reg34) || (~&reg28)) : $unsigned({wire23, reg45}))));
          reg50 <= $unsigned({((~^$signed(reg40)) ?
                  reg52 : $signed((reg34 - reg32))),
              (!(8'hbb))});
          reg51 <= reg43[(2'h3):(1'h0)];
        end
    end
endmodule

module module6  (y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h50):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire10;
  input wire [(3'h4):(1'h0)] wire9;
  input wire signed [(4'h9):(1'h0)] wire8;
  input wire [(4'h9):(1'h0)] wire7;
  wire [(4'hf):(1'h0)] wire19;
  wire [(5'h10):(1'h0)] wire18;
  wire [(2'h3):(1'h0)] wire17;
  wire [(4'h9):(1'h0)] wire16;
  wire signed [(3'h4):(1'h0)] wire15;
  wire [(2'h2):(1'h0)] wire14;
  wire signed [(4'ha):(1'h0)] wire13;
  wire signed [(3'h4):(1'h0)] wire12;
  wire signed [(5'h10):(1'h0)] wire11;
  assign y = {wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 (1'h0)};
  assign wire11 = ($unsigned({{(wire9 <<< wire7)}, $signed(wire7)}) ?
                      wire10[(3'h5):(2'h3)] : wire10[(2'h2):(2'h2)]);
  assign wire12 = wire7[(1'h0):(1'h0)];
  assign wire13 = $unsigned($unsigned($unsigned($unsigned({wire8, wire11}))));
  assign wire14 = $signed({($signed(wire12) <= (wire10[(5'h10):(4'hb)] ?
                          $signed(wire10) : $signed(wire8)))});
  assign wire15 = wire14[(2'h2):(2'h2)];
  assign wire16 = wire14;
  assign wire17 = wire8[(4'h8):(2'h2)];
  assign wire18 = (wire13 ?
                      wire17[(1'h0):(1'h0)] : {$unsigned(($signed(wire8) ?
                              wire7[(4'h9):(1'h0)] : $signed(wire16))),
                          $unsigned(wire14[(1'h1):(1'h0)])});
  assign wire19 = wire8;
endmodule
