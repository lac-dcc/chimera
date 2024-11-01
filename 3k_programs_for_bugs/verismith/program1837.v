module top
#(parameter param26 = (8'hb2))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'he1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire4;
  input wire [(3'h4):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire25;
  wire [(5'h13):(1'h0)] wire24;
  wire signed [(2'h2):(1'h0)] wire23;
  wire [(3'h4):(1'h0)] wire22;
  wire signed [(5'h13):(1'h0)] wire10;
  wire signed [(3'h7):(1'h0)] wire9;
  wire [(5'h12):(1'h0)] wire8;
  wire [(4'h8):(1'h0)] wire7;
  wire signed [(4'ha):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire5;
  reg signed [(3'h4):(1'h0)] reg21 = (1'h0);
  reg [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg16 = (1'h0);
  reg [(4'hd):(1'h0)] reg15 = (1'h0);
  reg [(3'h6):(1'h0)] reg14 = (1'h0);
  reg [(3'h4):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg11 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 reg11,
                 (1'h0)};
  assign wire5 = wire0;
  assign wire6 = $unsigned((8'hbe));
  assign wire7 = (wire2 ^ wire3);
  assign wire8 = (^{wire1, (8'ha6)});
  assign wire9 = wire0;
  assign wire10 = ((wire8[(5'h10):(4'he)] ?
                          ($unsigned(wire7) ^ $unsigned((wire2 ^ wire0))) : $unsigned($unsigned(wire4))) ?
                      $signed(($unsigned((-wire0)) ?
                          ((wire7 >= wire6) ?
                              $signed(wire6) : (wire0 ?
                                  wire6 : wire7)) : $signed(wire2[(1'h0):(1'h0)]))) : (wire2[(4'h9):(4'h9)] ?
                          (8'hbb) : wire1[(2'h3):(1'h0)]));
  always
    @(posedge clk) begin
      reg11 <= $signed((+(8'hba)));
      if (($signed(({(wire7 || wire5)} ?
              wire10 : $unsigned(wire7[(3'h4):(1'h0)]))) ?
          {(|(+reg11)), (&$unsigned(wire1))} : wire1[(2'h2):(2'h2)]))
        begin
          if ((~^(~wire8[(3'h4):(1'h0)])))
            begin
              reg12 <= wire6;
              reg13 <= wire7;
            end
          else
            begin
              reg12 <= (^$signed(wire3));
              reg13 <= (^($signed((~&wire1[(1'h0):(1'h0)])) ^~ (~|((wire5 ?
                  wire1 : reg11) & (8'hb4)))));
              reg14 <= (~&$signed(($unsigned(wire9[(1'h1):(1'h1)]) ?
                  wire10 : $signed((reg13 ? reg13 : wire3)))));
            end
          reg15 <= {$unsigned(wire7[(3'h4):(3'h4)]),
              ($unsigned(($signed((8'h9e)) ?
                      (wire8 ? wire7 : wire3) : {wire1, wire4})) ?
                  (wire10 ?
                      {(reg11 >= wire10), reg14} : (wire0[(2'h2):(1'h1)] ?
                          $signed(wire10) : {wire4,
                              wire10})) : ($unsigned((wire3 >>> wire10)) ?
                      (|(+reg11)) : ((~&wire3) ^ {wire6})))};
          reg16 <= ((|$unsigned(wire9)) ?
              $unsigned((~&{(wire4 ? wire10 : wire9),
                  wire1[(3'h4):(2'h3)]})) : wire4[(3'h4):(3'h4)]);
          reg17 <= (~($unsigned((-wire7)) < ((^~(reg12 & (8'haf))) ?
              {(reg14 * reg16), (wire8 | wire6)} : $unsigned(reg11))));
          if (((~|(wire5[(5'h10):(4'h9)] ?
              (!(reg11 <<< reg15)) : ((wire5 << reg11) >= (reg16 ?
                  reg11 : reg12)))) ^~ (wire8[(3'h7):(2'h2)] ?
              wire8[(4'hf):(4'hd)] : wire0[(2'h3):(1'h1)])))
            begin
              reg18 <= $signed($unsigned((^~{wire5, {wire0}})));
              reg19 <= (({{$unsigned(wire6)},
                      $signed(wire5[(3'h5):(3'h4)])} | wire10) ?
                  wire5[(3'h7):(2'h2)] : (~$unsigned(wire9[(3'h6):(1'h1)])));
              reg20 <= (~&wire10[(4'he):(3'h4)]);
              reg21 <= (+reg20[(4'hd):(3'h7)]);
            end
          else
            begin
              reg18 <= $signed((reg13 || {$signed($unsigned(wire4)),
                  wire7[(3'h7):(3'h6)]}));
              reg19 <= wire9;
            end
        end
      else
        begin
          reg12 <= (~(wire5[(4'ha):(1'h1)] && ($unsigned(wire8) ?
              $unsigned(reg20) : ((|wire10) * {wire1, reg17}))));
          if ($signed($unsigned(wire3)))
            begin
              reg13 <= (|(($signed((wire4 >= wire10)) || $unsigned($unsigned(reg20))) >= reg18[(4'h9):(1'h1)]));
              reg14 <= {reg13};
              reg15 <= reg16[(1'h1):(1'h0)];
            end
          else
            begin
              reg13 <= wire4[(3'h5):(1'h0)];
              reg14 <= (({((~wire10) ? ((8'h9e) ~^ wire4) : (~^reg12))} ?
                  (^{$unsigned(wire6),
                      $signed(wire3)}) : reg17[(2'h2):(2'h2)]) + $signed($unsigned((|wire9[(1'h1):(1'h0)]))));
              reg15 <= (8'haa);
              reg16 <= reg19;
            end
          reg17 <= ($signed($unsigned(wire8)) + reg16[(2'h2):(1'h0)]);
          reg18 <= wire4[(3'h5):(1'h0)];
        end
    end
  assign wire22 = (($unsigned(wire4) ^~ wire2[(1'h0):(1'h0)]) > $signed($unsigned(reg19)));
  assign wire23 = reg14[(3'h4):(1'h0)];
  assign wire24 = {$signed($signed($signed(reg13))), (^~wire0)};
  assign wire25 = $unsigned($signed((8'h9d)));
endmodule
