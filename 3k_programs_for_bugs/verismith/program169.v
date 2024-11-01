module top
#(parameter param67 = ((((((8'ha8) >> (8'h9e)) ? (!(8'hac)) : (8'hb5)) && (~&((8'hb2) ? (8'ha0) : (8'had)))) > (({(8'ha0)} ? ((8'ha7) <<< (8'hb1)) : (+(7'h40))) ? ({(8'h9e), (8'h9e)} + {(8'ha6), (8'h9e)}) : ((~^(7'h41)) <= {(8'haa)}))) ? (&{{((8'hbb) ? (8'ha7) : (8'hba)), ((8'ha9) != (8'ha4))}}) : {{(!((8'hb5) ? (8'hb3) : (8'hbc)))}, {(((8'ha7) ? (8'ha6) : (8'hac)) ? {(8'hb1)} : {(8'hb7), (7'h42)})}}), 
parameter param68 = param67)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h7e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire4;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire66;
  wire signed [(2'h2):(1'h0)] wire60;
  wire [(3'h7):(1'h0)] wire8;
  wire [(4'h9):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire5;
  reg signed [(4'hf):(1'h0)] reg65 = (1'h0);
  reg [(4'he):(1'h0)] reg64 = (1'h0);
  reg [(4'hd):(1'h0)] reg63 = (1'h0);
  reg signed [(4'he):(1'h0)] reg62 = (1'h0);
  assign y = {wire66,
                 wire60,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 (1'h0)};
  assign wire5 = $signed(wire0);
  assign wire6 = $signed(((wire2[(4'hd):(1'h0)] ^ (-$signed(wire3))) ?
                     wire2 : {($unsigned((8'hb7)) ?
                             $signed(wire5) : $unsigned(wire3)),
                         $unsigned((wire1 ? wire4 : wire4))}));
  assign wire7 = $unsigned((wire1[(1'h1):(1'h1)] ?
                     {$unsigned(((8'h9c) ? wire4 : (8'hac)))} : wire0));
  assign wire8 = (wire3[(4'hb):(1'h0)] ? (|wire5) : {wire4[(2'h2):(2'h2)]});
  module9 #() modinst61 (.y(wire60), .wire11(wire2), .wire12(wire6), .wire13(wire1), .clk(clk), .wire10(wire5));
  always
    @(posedge clk) begin
      if (wire2)
        begin
          reg62 <= ((({$unsigned(wire2)} ^~ ($unsigned(wire6) | (|wire0))) ^ (((+wire6) << (wire7 ?
              wire7 : wire60)) >= wire3[(4'he):(2'h3)])) * wire60[(2'h2):(2'h2)]);
          reg63 <= wire6[(1'h1):(1'h1)];
        end
      else
        begin
          reg62 <= ($signed($unsigned($signed({reg62}))) >> $signed((|(&$signed((8'ha3))))));
        end
      reg64 <= $unsigned(((((~&reg63) ?
          (wire60 || wire3) : wire2) & $unsigned({wire3,
          (8'had)})) >= wire8[(2'h2):(1'h0)]));
      reg65 <= $unsigned({(wire8 + $signed($unsigned(wire2)))});
    end
  assign wire66 = $signed(wire7);
endmodule

module module9
#(parameter param58 = ((({{(8'ha5)}} ? ((^~(8'had)) ? ((8'hb3) >>> (8'hb1)) : ((8'hb2) ? (8'ha9) : (8'hb8))) : (((8'ha7) ? (8'hbd) : (8'ha2)) | (^(8'hb8)))) & (({(7'h40)} | {(8'hbc), (8'h9e)}) ? (((7'h44) ? (8'hb9) : (8'hba)) < {(8'ha5), (8'hb7)}) : (~^(|(8'hab))))) ~^ (((((8'h9d) & (8'hab)) ? (!(7'h43)) : ((8'hbd) && (8'h9d))) ~^ ({(7'h41), (8'hb0)} ? ((7'h41) ? (8'ha7) : (8'hac)) : ((8'h9c) ? (7'h41) : (8'had)))) < (((~|(8'hb3)) ? (^~(7'h43)) : ((8'hb2) || (8'ha7))) || {((8'ha3) <<< (8'h9e)), ((8'ha9) ? (8'ha1) : (8'ha8))}))), 
parameter param59 = param58)
(y, clk, wire13, wire12, wire11, wire10);
  output wire [(32'h1fb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire13;
  input wire signed [(3'h7):(1'h0)] wire12;
  input wire signed [(4'hd):(1'h0)] wire11;
  input wire [(5'h11):(1'h0)] wire10;
  wire [(4'h8):(1'h0)] wire57;
  wire [(5'h15):(1'h0)] wire54;
  wire signed [(3'h5):(1'h0)] wire53;
  wire signed [(4'hc):(1'h0)] wire47;
  wire [(2'h3):(1'h0)] wire46;
  wire signed [(5'h14):(1'h0)] wire45;
  wire signed [(3'h4):(1'h0)] wire44;
  wire signed [(4'ha):(1'h0)] wire43;
  wire [(4'he):(1'h0)] wire42;
  wire signed [(5'h14):(1'h0)] wire41;
  reg [(4'h8):(1'h0)] reg56 = (1'h0);
  reg [(2'h3):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg50 = (1'h0);
  reg [(3'h7):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg48 = (1'h0);
  reg [(4'ha):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg39 = (1'h0);
  reg [(4'he):(1'h0)] reg38 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg37 = (1'h0);
  reg signed [(4'he):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg34 = (1'h0);
  reg [(4'hd):(1'h0)] reg33 = (1'h0);
  reg [(3'h5):(1'h0)] reg32 = (1'h0);
  reg [(4'h8):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg30 = (1'h0);
  reg [(5'h14):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg28 = (1'h0);
  reg [(5'h11):(1'h0)] reg27 = (1'h0);
  reg [(4'hf):(1'h0)] reg26 = (1'h0);
  reg [(5'h12):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg24 = (1'h0);
  reg [(3'h6):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  reg [(2'h3):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg18 = (1'h0);
  reg [(5'h11):(1'h0)] reg17 = (1'h0);
  reg [(3'h6):(1'h0)] reg16 = (1'h0);
  reg [(4'hd):(1'h0)] reg15 = (1'h0);
  reg [(4'he):(1'h0)] reg14 = (1'h0);
  assign y = {wire57,
                 wire54,
                 wire53,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 reg56,
                 reg55,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
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
                 reg15,
                 reg14,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire11[(3'h7):(1'h1)])
        begin
          reg14 <= $unsigned(((wire12[(2'h2):(2'h2)] >= (~^$unsigned((8'h9e)))) <<< $signed((^wire12[(3'h5):(1'h1)]))));
          reg15 <= (~$unsigned(wire10));
          reg16 <= (^~($unsigned(wire12) ?
              reg15[(3'h4):(2'h2)] : {{(^~wire13), {wire13, (8'haa)}}}));
          reg17 <= wire13;
          if ((reg17 | ((|((reg14 || reg14) ? (wire12 | wire13) : wire11)) ?
              (~|(|$signed(reg15))) : reg15[(4'hb):(3'h5)])))
            begin
              reg18 <= ((((+{reg16}) ?
                          ((wire10 <<< wire10) * (^reg17)) : wire13[(5'h10):(3'h5)]) ?
                      $unsigned((-reg15)) : wire10) ?
                  wire11 : {$unsigned((wire13 <<< $signed(wire12))),
                      reg17[(3'h4):(2'h3)]});
              reg19 <= $signed({((!$signed((8'hb5))) & (reg18 << $unsigned(reg18))),
                  (~^wire11[(4'ha):(3'h5)])});
              reg20 <= reg18;
              reg21 <= (~(+(~$signed($signed((8'hbb))))));
            end
          else
            begin
              reg18 <= reg16[(2'h3):(2'h3)];
              reg19 <= reg14;
              reg20 <= reg16[(2'h2):(2'h2)];
            end
        end
      else
        begin
          reg14 <= wire10[(4'ha):(3'h7)];
          reg15 <= ($signed(reg20) ? reg21 : reg18);
          reg16 <= $signed((($signed((8'ha3)) ?
              (8'h9d) : (^(reg16 - reg20))) & reg19[(2'h2):(2'h2)]));
          reg17 <= (!((wire12[(3'h4):(3'h4)] ?
                  ($unsigned(wire12) << {wire10}) : wire10) ?
              (8'had) : reg18[(1'h0):(1'h0)]));
        end
      reg22 <= ($signed({reg19}) ?
          $unsigned($unsigned(wire13[(4'hd):(4'hc)])) : $signed((reg16 ^~ (~$signed(wire10)))));
      if (reg19)
        begin
          reg23 <= $unsigned($unsigned((!reg20)));
          if (wire11[(4'hb):(2'h2)])
            begin
              reg24 <= ($unsigned($signed($signed(wire10))) ?
                  $signed($signed($unsigned($unsigned(wire11)))) : ($unsigned(wire12) ?
                      (&{$signed(reg17)}) : ((+(wire13 >= reg23)) ?
                          (!(-reg17)) : (!(^wire10)))));
              reg25 <= (8'ha3);
              reg26 <= reg20;
            end
          else
            begin
              reg24 <= {wire10[(4'ha):(1'h1)], wire10[(4'h9):(3'h5)]};
              reg25 <= ((reg23[(2'h2):(2'h2)] <= $unsigned($unsigned(reg20[(4'hb):(3'h5)]))) ?
                  wire13 : ((+((reg17 ? reg14 : reg14) ?
                          ((8'ha2) ? reg17 : reg23) : reg23)) ?
                      (&$unsigned(reg26[(4'he):(4'hc)])) : (((7'h42) ?
                          {reg22, (7'h43)} : $signed(reg24)) != (8'hba))));
              reg26 <= $signed($unsigned($unsigned(reg16[(1'h0):(1'h0)])));
            end
          if ((reg21 < $unsigned($unsigned(reg25))))
            begin
              reg27 <= reg16;
            end
          else
            begin
              reg27 <= $signed(((^~reg22[(4'he):(2'h2)]) ?
                  wire13 : (((~reg25) | wire13[(1'h0):(1'h0)]) ?
                      ((8'hac) >= $unsigned(reg15)) : ($signed(wire12) <= reg26))));
              reg28 <= ((!$signed(($unsigned(wire13) ?
                  (~&reg15) : $unsigned(wire12)))) <<< ($unsigned(reg23[(3'h5):(2'h3)]) >>> (8'hb8)));
              reg29 <= (~^$unsigned($signed(reg19[(1'h1):(1'h1)])));
              reg30 <= (&($signed((reg29[(5'h14):(5'h11)] ?
                  reg29[(4'hd):(3'h6)] : (wire11 ?
                      reg17 : reg25))) > ((&(reg22 >>> reg29)) ?
                  $unsigned(wire10[(3'h6):(1'h0)]) : reg29)));
              reg31 <= wire11[(3'h5):(1'h0)];
            end
        end
      else
        begin
          reg23 <= {$signed(($signed((+(8'hbf))) != $signed(wire10)))};
          reg24 <= {{(~((-reg21) ? reg27 : (reg18 ^~ reg14))),
                  $signed(($unsigned(reg24) ? $unsigned(wire12) : (|reg26)))},
              $signed({$unsigned((^~reg26))})};
          reg25 <= ((reg19[(2'h2):(1'h0)] ?
                  (reg30 ?
                      {reg14[(3'h7):(2'h3)], wire12} : $signed({wire11,
                          reg31})) : $unsigned(reg26)) ?
              reg25 : (8'hb8));
          reg26 <= $signed(reg30[(1'h1):(1'h1)]);
        end
      reg32 <= ($signed($unsigned($unsigned(((8'hb5) ?
          wire12 : (8'hbf))))) ~^ reg15[(3'h6):(3'h6)]);
      if ($signed(reg23))
        begin
          reg33 <= {$signed((reg14[(4'h9):(3'h4)] != (reg19 ?
                  ((8'hb2) ? reg22 : wire13) : {reg30})))};
        end
      else
        begin
          reg33 <= $unsigned(reg32[(3'h5):(1'h1)]);
          reg34 <= $unsigned(reg16[(1'h0):(1'h0)]);
          reg35 <= wire10[(5'h10):(3'h6)];
          if (reg17)
            begin
              reg36 <= (^{$unsigned((|{wire11, (8'ha1)})),
                  ({(reg17 && reg28), reg14[(4'hb):(1'h1)]} > reg22)});
              reg37 <= $unsigned({$signed({$signed((7'h40))})});
              reg38 <= (&reg34[(2'h2):(2'h2)]);
              reg39 <= $unsigned((7'h42));
            end
          else
            begin
              reg36 <= (+reg32[(3'h5):(1'h1)]);
              reg37 <= (!$signed(reg39));
              reg38 <= reg22[(5'h10):(3'h4)];
              reg39 <= {$unsigned({wire10[(2'h2):(1'h0)],
                      reg24[(4'h8):(3'h4)]}),
                  (~|{((~|wire13) ? reg18 : wire13[(4'he):(2'h3)]),
                      $signed(reg21[(4'hb):(4'h8)])})};
            end
          reg40 <= {$unsigned($unsigned((~{(7'h42)}))),
              $unsigned(((reg19 ^~ reg16[(2'h3):(2'h2)]) ?
                  $signed((reg35 - reg30)) : reg38[(3'h6):(1'h1)]))};
        end
    end
  assign wire41 = ((((reg23 <<< reg27) >= (+{reg14})) <<< (+$unsigned((!reg36)))) ^ (reg16[(3'h6):(3'h5)] - reg30[(3'h4):(1'h1)]));
  assign wire42 = $unsigned(((+$unsigned({reg35})) ?
                      ({(wire10 & wire12)} ^~ (~$signed(reg23))) : ((wire10 ?
                              wire41[(4'hf):(3'h4)] : {reg19, reg22}) ?
                          reg15[(3'h5):(2'h2)] : (!$signed(wire10)))));
  assign wire43 = reg20[(5'h13):(2'h3)];
  assign wire44 = reg28;
  assign wire45 = (+($signed(reg27[(5'h11):(4'h8)]) * ((reg39[(2'h2):(2'h2)] ?
                      (reg26 & reg31) : $signed(wire43)) ^ ((^~wire44) ?
                      (reg34 << (8'hb1)) : $signed((8'hba))))));
  assign wire46 = reg21[(4'hc):(4'h8)];
  assign wire47 = ($unsigned((|$signed(((8'had) & reg20)))) ^~ reg24[(5'h11):(4'hf)]);
  always
    @(posedge clk) begin
      if ((~^{(reg27[(4'h8):(1'h0)] ?
              $signed(reg29) : (((8'hbb) ?
                  reg19 : wire45) > reg39[(3'h4):(1'h0)])),
          ((7'h40) & {$signed(wire11), reg22})}))
        begin
          reg48 <= ($unsigned((((reg37 <= (8'had)) ?
              (wire47 - reg18) : (~&wire47)) > $unsigned(reg31[(4'h8):(1'h1)]))) <<< (reg35 >= $signed((^~(-reg15)))));
          reg49 <= ((($signed($signed(wire43)) ?
                      {$signed(reg32)} : $unsigned($unsigned(wire41))) ?
                  $unsigned(({reg17, wire44} ?
                      (~|(8'hbd)) : (8'hb0))) : $signed(wire13[(2'h2):(1'h1)])) ?
              ($unsigned(($unsigned(reg17) << (^~wire42))) ?
                  reg25 : ($signed($unsigned(reg39)) << (-{reg40,
                      reg25}))) : (8'ha8));
          reg50 <= {wire12[(3'h6):(1'h0)], reg34};
          reg51 <= (-reg22);
        end
      else
        begin
          if ($signed(reg29))
            begin
              reg48 <= wire11;
              reg49 <= (reg26[(2'h3):(1'h1)] ?
                  ((~^wire10) > ((((8'h9e) ? (8'hb3) : (8'ha5)) ?
                          wire44[(2'h2):(2'h2)] : $signed(reg16)) ?
                      reg30[(3'h4):(2'h3)] : (((8'hbe) ?
                          wire46 : reg34) != reg35[(4'he):(4'hc)]))) : {((8'hac) ?
                          $unsigned({reg40, reg39}) : $unsigned(reg28))});
              reg50 <= reg15[(1'h0):(1'h0)];
            end
          else
            begin
              reg48 <= ((~|(8'ha4)) ?
                  (!$unsigned($unsigned(reg19))) : $signed(reg38[(3'h7):(1'h0)]));
            end
        end
      reg52 <= (8'hab);
    end
  assign wire53 = (&(~|reg34));
  assign wire54 = reg50[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg55 <= (((8'ha2) >> (~|{(reg20 ?
              wire12 : (8'hbb))})) ^~ $signed(wire12));
      reg56 <= $signed((~^(!$unsigned((reg32 ? reg33 : reg14)))));
    end
  assign wire57 = wire11[(3'h7):(2'h3)];
endmodule
