module top
#(parameter param50 = (~^((((^(8'h9e)) ~^ (!(8'hb4))) <= ((~^(8'hbb)) ? ((8'hab) ? (8'hb6) : (8'hac)) : (-(8'ha3)))) ? ((8'h9e) > ((+(8'hae)) | ((8'ha1) < (8'hb3)))) : ((((8'ha8) ? (8'ha3) : (8'ha9)) ? ((8'haf) >>> (8'hae)) : (|(8'hab))) ? (((8'ha4) ? (8'ha6) : (8'hbe)) ? ((8'hb8) ? (8'hab) : (8'hb0)) : (~&(8'hbb))) : (((8'h9d) - (8'ha6)) ? {(8'ha3), (8'hb8)} : {(7'h44), (8'h9f)})))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h11d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire4;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire41;
  wire [(5'h11):(1'h0)] wire40;
  wire signed [(4'h8):(1'h0)] wire38;
  wire [(4'hf):(1'h0)] wire17;
  wire [(3'h5):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire5;
  reg [(4'he):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg48 = (1'h0);
  reg [(4'h9):(1'h0)] reg47 = (1'h0);
  reg [(5'h12):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg44 = (1'h0);
  reg [(5'h11):(1'h0)] reg43 = (1'h0);
  reg [(3'h4):(1'h0)] reg42 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg14 = (1'h0);
  reg [(4'hd):(1'h0)] reg13 = (1'h0);
  reg [(5'h13):(1'h0)] reg12 = (1'h0);
  reg [(3'h7):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg10 = (1'h0);
  reg [(3'h5):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg7 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire38,
                 wire17,
                 wire6,
                 wire5,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
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
                 (1'h0)};
  assign wire5 = ((+$signed(wire3[(3'h4):(1'h0)])) ?
                     wire4[(1'h0):(1'h0)] : ((^~$signed((wire2 >> wire4))) ?
                         ((+$unsigned(wire1)) >= ($signed((8'ha5)) ?
                             (~|wire0) : (-(7'h41)))) : $unsigned(wire0[(4'h8):(2'h3)])));
  assign wire6 = wire3;
  always
    @(posedge clk) begin
      reg7 <= $signed((wire5 - ((-(~^wire6)) ?
          (!wire6) : $unsigned($signed(wire0)))));
      if ((~(~(~&{(wire0 ^~ wire2)}))))
        begin
          if ((wire1[(3'h7):(3'h6)] ?
              $signed($signed(({wire6, wire6} >>> (reg7 ?
                  wire3 : (8'ha1))))) : {(((~|wire1) ?
                          (^wire2) : $unsigned(wire0)) ?
                      ((~&wire5) ~^ (~|wire2)) : (~&(wire4 | wire4)))}))
            begin
              reg8 <= wire2;
              reg9 <= $signed(reg7[(3'h4):(2'h2)]);
              reg10 <= $unsigned($signed(((~|wire2[(2'h2):(2'h2)]) ?
                  $unsigned($signed(reg8)) : ((reg9 ^~ wire6) ?
                      reg9[(3'h4):(2'h2)] : wire4[(1'h0):(1'h0)]))));
              reg11 <= ((wire1[(4'ha):(2'h2)] ?
                  wire1 : wire2) - $unsigned((&(&{wire5}))));
              reg12 <= {($unsigned($unsigned(reg9[(1'h0):(1'h0)])) >>> ($signed($unsigned(wire6)) ?
                      wire2 : reg11[(3'h5):(1'h1)]))};
            end
          else
            begin
              reg8 <= (reg11[(1'h1):(1'h1)] > reg10);
            end
        end
      else
        begin
          reg8 <= (wire0[(3'h7):(3'h4)] ?
              ($unsigned((reg10[(1'h0):(1'h0)] ?
                  $signed(reg11) : (reg12 ?
                      reg8 : wire1))) == wire4) : wire2[(1'h0):(1'h0)]);
          if ($signed((reg8[(2'h2):(1'h0)] ?
              (|(^(~&wire6))) : $unsigned({(+reg7), reg9}))))
            begin
              reg9 <= $unsigned((($signed(((8'hb1) || (8'hbd))) >= {reg11}) ?
                  $unsigned(($unsigned(wire5) ?
                      (!wire0) : $unsigned(wire3))) : reg9[(1'h1):(1'h1)]));
              reg10 <= (~^(($unsigned((wire4 ^~ wire5)) ?
                  $signed(reg8[(1'h1):(1'h1)]) : $unsigned(reg11[(3'h6):(2'h2)])) | wire4));
              reg11 <= wire0;
            end
          else
            begin
              reg9 <= ({(({wire0, wire4} ?
                          (wire4 > (8'hb2)) : (wire6 ? wire5 : reg10)) ?
                      $unsigned(wire6) : (8'hba)),
                  (^~((8'hb6) ?
                      (reg8 ?
                          wire1 : reg7) : wire3))} <<< (((wire1[(4'ha):(4'ha)] > (~^reg8)) ^~ wire0[(3'h6):(2'h3)]) ?
                  ($unsigned((~|reg7)) ?
                      ($unsigned(reg8) > reg12[(2'h3):(2'h2)]) : ($unsigned(wire4) || $signed(wire3))) : wire3[(3'h7):(3'h4)]));
              reg10 <= $unsigned($unsigned(wire1[(4'h8):(1'h1)]));
              reg11 <= $signed((8'hbc));
            end
          reg12 <= (~wire5[(4'ha):(3'h4)]);
          reg13 <= ((wire1[(4'he):(3'h4)] ?
                  wire1[(2'h2):(2'h2)] : (((wire2 ^~ wire4) ?
                          wire0 : (~wire4)) ?
                      ($unsigned(reg12) >= wire3[(4'h8):(3'h7)]) : wire0[(2'h2):(1'h0)])) ?
              $signed(reg10[(1'h0):(1'h0)]) : {($signed({wire4}) <<< (~|{wire0,
                      reg8})),
                  wire4[(2'h2):(1'h1)]});
          reg14 <= wire3;
        end
      reg15 <= ($signed({reg11[(3'h5):(2'h3)],
              ($signed(reg8) ? wire3 : $unsigned(wire0))}) ?
          $signed($signed($signed(wire0))) : {{$signed($signed(reg9))}});
      reg16 <= (+{(8'ha9),
          ($unsigned(((8'hb9) ^ reg10)) ?
              ((reg8 ? wire3 : wire3) > {reg15,
                  reg13}) : $unsigned($unsigned((8'hb7))))});
    end
  assign wire17 = ((wire5 ?
                      (^$unsigned($unsigned((8'hab)))) : $signed((7'h42))) ^~ $signed((reg8[(2'h2):(1'h0)] | (~(wire5 << wire2)))));
  module18 #() modinst39 (.wire22(wire0), .wire21(wire1), .clk(clk), .y(wire38), .wire20(wire4), .wire19(wire5));
  assign wire40 = ({{(+(reg14 ? wire6 : reg15)), wire2[(1'h0):(1'h0)]},
                      (~$unsigned(wire1))} && reg10[(1'h0):(1'h0)]);
  assign wire41 = wire38[(3'h6):(2'h2)];
  always
    @(posedge clk) begin
      reg42 <= reg16[(4'h8):(1'h0)];
      reg43 <= $unsigned((8'had));
      if (($unsigned((reg7 ^~ $signed($unsigned((8'hbd))))) & $unsigned($unsigned((~^reg11)))))
        begin
          if (reg8[(2'h2):(1'h0)])
            begin
              reg44 <= wire40[(4'h9):(4'h8)];
              reg45 <= reg15[(1'h1):(1'h0)];
              reg46 <= reg14;
            end
          else
            begin
              reg44 <= (((&(reg13[(4'hc):(4'hb)] ?
                      reg14[(5'h15):(4'hd)] : reg11)) - (reg13 & {$signed(wire17),
                      $signed(wire5)})) ?
                  (+(-(~^(wire0 ? reg8 : wire4)))) : $signed((~&wire4)));
              reg45 <= ((~^(^~(-(~&wire3)))) ?
                  $unsigned((~$signed(wire41))) : (&(((wire41 ?
                          wire4 : (8'ha2)) ?
                      wire17[(3'h4):(2'h3)] : (wire38 & wire5)) - reg45)));
              reg46 <= wire41[(4'ha):(1'h0)];
              reg47 <= ({wire38} || (|reg8));
            end
          reg48 <= wire17;
          reg49 <= (~&((^~(wire0 ^~ (wire41 ? reg43 : (8'ha6)))) ?
              wire41 : ($signed(reg10) << reg14[(4'hd):(4'h9)])));
        end
      else
        begin
          reg44 <= (~reg9[(1'h1):(1'h1)]);
          reg45 <= reg16[(3'h5):(3'h5)];
        end
    end
endmodule

module module18
#(parameter param37 = (((-(^~{(8'hb0)})) ? (+((8'hb4) - ((8'haf) ? (8'hb5) : (8'hb6)))) : ({((8'hba) < (8'h9f))} >>> {((8'hb2) ? (8'hb6) : (8'hb5)), ((8'ha1) ? (8'hbc) : (8'ha2))})) ? ((^(((8'hbd) >= (8'hba)) != {(8'ha2), (8'h9c)})) ~^ {{(!(8'ha6)), ((8'hac) ? (7'h42) : (8'had))}, (((8'ha8) ? (8'hb5) : (8'hbb)) <<< ((8'hb5) - (7'h42)))}) : (^~(~^(((8'hba) ? (8'hb9) : (8'hb7)) + ((8'hb4) == (8'ha1)))))))
(y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'h96):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire22;
  input wire [(5'h12):(1'h0)] wire21;
  input wire [(5'h10):(1'h0)] wire20;
  input wire signed [(5'h12):(1'h0)] wire19;
  wire signed [(3'h4):(1'h0)] wire36;
  wire signed [(5'h11):(1'h0)] wire35;
  wire signed [(3'h6):(1'h0)] wire34;
  wire signed [(5'h13):(1'h0)] wire33;
  wire signed [(3'h6):(1'h0)] wire32;
  wire signed [(3'h5):(1'h0)] wire31;
  wire signed [(5'h15):(1'h0)] wire30;
  wire [(4'h8):(1'h0)] wire29;
  wire [(3'h5):(1'h0)] wire28;
  wire signed [(5'h15):(1'h0)] wire27;
  wire [(3'h4):(1'h0)] wire26;
  wire [(3'h4):(1'h0)] wire25;
  wire signed [(4'ha):(1'h0)] wire24;
  wire [(5'h13):(1'h0)] wire23;
  assign y = {wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 (1'h0)};
  assign wire23 = $unsigned(wire22[(2'h2):(2'h2)]);
  assign wire24 = $signed($signed($signed($unsigned($signed(wire19)))));
  assign wire25 = (~&((wire22 ?
                      {wire21[(5'h11):(3'h7)],
                          $unsigned(wire19)} : $unsigned(wire20[(4'h8):(2'h3)])) * $unsigned($unsigned($unsigned(wire20)))));
  assign wire26 = (-({$unsigned((wire19 >= wire23)), wire20} ?
                      $unsigned((|{wire22})) : (+$signed($unsigned(wire22)))));
  assign wire27 = {wire21};
  assign wire28 = wire21[(5'h10):(4'he)];
  assign wire29 = ($signed({((wire22 ?
                          wire25 : wire20) >= wire22[(4'hd):(4'ha)])}) - wire25);
  assign wire30 = ((($unsigned(wire28) ?
                          (wire27[(1'h1):(1'h1)] <= {wire28,
                              (8'ha7)}) : $unsigned((-wire23))) ?
                      ($signed(wire29[(3'h7):(2'h2)]) ?
                          $unsigned((wire24 && (8'hb0))) : wire29[(3'h5):(3'h5)]) : (wire24[(4'ha):(3'h4)] >= ((wire26 ^ wire22) ?
                          $signed(wire24) : {wire28}))) ^ (~|wire27));
  assign wire31 = wire29[(3'h6):(3'h4)];
  assign wire32 = (7'h43);
  assign wire33 = $unsigned($signed(wire19[(4'he):(4'hc)]));
  assign wire34 = (wire29[(2'h3):(1'h0)] > $unsigned((~&{wire31[(2'h2):(2'h2)]})));
  assign wire35 = $signed((^wire21));
  assign wire36 = (wire23[(4'hd):(4'h9)] ?
                      wire30[(4'hc):(3'h7)] : wire34[(2'h3):(1'h1)]);
endmodule
