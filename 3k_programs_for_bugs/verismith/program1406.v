module top
#(parameter param48 = ((((((8'ha6) ? (8'hb3) : (8'hbf)) <<< ((8'hb6) ? (8'hb5) : (7'h42))) ? ((|(7'h43)) > ((8'hba) * (8'hbd))) : ((~^(8'hb6)) >> (|(8'hb9)))) ? ((8'hbe) ? {((8'haf) ? (8'hb7) : (7'h42)), (+(8'hab))} : ({(8'ha1)} ? ((8'ha6) ^ (8'hac)) : ((8'ha9) ? (8'hb9) : (8'ha3)))) : ((~^(^~(7'h44))) ? {(&(8'hbb)), ((8'hb2) ? (8'ha9) : (8'h9f))} : (((8'ha5) ? (8'hab) : (7'h41)) ? ((7'h42) ? (8'ha1) : (8'hb6)) : (8'hb7)))) + ((({(8'ha9), (8'hb8)} & (^(8'h9c))) ? (((8'ha4) == (8'haa)) ? {(7'h41), (8'ha0)} : {(8'hb4), (8'hb0)}) : ((~|(8'h9c)) <<< ((8'hbc) | (8'hbd)))) == (((^(7'h40)) || (~(8'hb8))) ? ((!(8'hbd)) <= ((8'ha4) & (8'hae))) : (((8'ha0) ? (8'had) : (8'hb8)) ? ((8'ha0) ? (8'haa) : (8'hb0)) : ((7'h44) && (8'hb0)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h5a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire4;
  input wire [(4'ha):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire47;
  wire [(3'h4):(1'h0)] wire46;
  wire signed [(5'h15):(1'h0)] wire45;
  wire [(3'h7):(1'h0)] wire44;
  wire [(3'h5):(1'h0)] wire43;
  wire signed [(2'h3):(1'h0)] wire42;
  wire signed [(4'hf):(1'h0)] wire40;
  wire [(5'h11):(1'h0)] wire5;
  assign y = {wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire40,
                 wire5,
                 (1'h0)};
  assign wire5 = $unsigned($signed($unsigned(((wire3 < wire0) ?
                     {wire1, wire0} : wire3))));
  module6 #() modinst41 (.wire8(wire5), .wire10(wire2), .y(wire40), .wire7(wire3), .wire9(wire4), .clk(clk));
  assign wire42 = ((((~&(~^wire1)) | {(!wire2)}) < $signed(((8'ha4) != (wire4 == wire0)))) || ((8'h9f) || $unsigned(wire1)));
  assign wire43 = ({$signed(wire42), wire4} & (!wire1));
  assign wire44 = ((^(~^(^((8'hb1) ? wire1 : wire0)))) ?
                      ($signed(wire42) ?
                          ($unsigned((-wire5)) ?
                              $signed($unsigned(wire42)) : ({(8'ha2),
                                  wire42} ~^ $signed(wire0))) : $signed($signed((wire5 ?
                              wire3 : wire2)))) : {{((wire40 == wire40) ?
                                  (|wire5) : (wire5 ^~ wire3))}});
  assign wire45 = ($unsigned(wire40[(3'h5):(3'h4)]) >= ((($unsigned((8'ha6)) ?
                      {wire1} : (wire5 ? wire0 : wire5)) << $signed((wire1 ?
                      (8'ha2) : wire1))) ^~ wire4));
  assign wire46 = ((8'h9c) ?
                      wire2 : $unsigned($unsigned(wire4[(4'hb):(2'h2)])));
  assign wire47 = {wire44[(1'h1):(1'h0)],
                      ($signed($unsigned((^wire43))) ?
                          $unsigned((8'haf)) : (wire46 ?
                              $signed($unsigned(wire4)) : $unsigned(((8'h9e) & wire5))))};
endmodule

module module6  (y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h187):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire10;
  input wire signed [(5'h13):(1'h0)] wire9;
  input wire signed [(5'h10):(1'h0)] wire8;
  input wire [(3'h6):(1'h0)] wire7;
  wire [(4'hd):(1'h0)] wire39;
  wire [(4'he):(1'h0)] wire38;
  wire signed [(5'h13):(1'h0)] wire24;
  wire [(5'h10):(1'h0)] wire23;
  wire [(5'h14):(1'h0)] wire22;
  wire signed [(4'hb):(1'h0)] wire11;
  reg [(5'h13):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg36 = (1'h0);
  reg [(4'hf):(1'h0)] reg35 = (1'h0);
  reg [(5'h14):(1'h0)] reg34 = (1'h0);
  reg [(4'h9):(1'h0)] reg33 = (1'h0);
  reg [(5'h15):(1'h0)] reg32 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg31 = (1'h0);
  reg [(5'h15):(1'h0)] reg30 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg27 = (1'h0);
  reg [(5'h13):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg21 = (1'h0);
  reg [(3'h5):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg18 = (1'h0);
  reg [(3'h5):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg15 = (1'h0);
  reg [(4'he):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg13 = (1'h0);
  reg [(4'hf):(1'h0)] reg12 = (1'h0);
  assign y = {wire39,
                 wire38,
                 wire24,
                 wire23,
                 wire22,
                 wire11,
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
  assign wire11 = (wire9[(5'h13):(4'hc)] ?
                      $unsigned((~^(~&(wire8 ?
                          (8'ha2) : wire7)))) : {(&{((8'hae) ? wire8 : wire7)}),
                          wire7});
  always
    @(posedge clk) begin
      if ($unsigned((&(wire11[(4'h9):(4'h8)] <= wire8[(4'hf):(4'h9)]))))
        begin
          reg12 <= ((wire10 ?
                  $unsigned((~^(8'h9f))) : (^~(-(wire10 ? (8'ha8) : wire10)))) ?
              (~^((^(wire9 + wire8)) ?
                  wire8 : wire9)) : ((~&$unsigned(((7'h42) ?
                  wire8 : wire10))) > $unsigned($unsigned(((8'ha6) << (8'hac))))));
          if (wire10[(3'h4):(2'h2)])
            begin
              reg13 <= wire8[(4'hf):(4'h8)];
              reg14 <= ($signed(wire9) ?
                  $signed($signed(reg13[(4'he):(4'hb)])) : ($unsigned((~((7'h41) | wire8))) ^~ reg13));
              reg15 <= (!$signed($signed(reg12)));
              reg16 <= $unsigned(($unsigned(wire10) | wire9[(4'he):(3'h4)]));
            end
          else
            begin
              reg13 <= (~&(^wire9[(3'h4):(1'h0)]));
              reg14 <= reg14;
            end
        end
      else
        begin
          reg12 <= $signed(($unsigned((~|$signed(wire11))) + $unsigned(((|wire7) || reg13))));
          reg13 <= ($signed($signed(reg13[(1'h0):(1'h0)])) ?
              wire11[(4'ha):(3'h7)] : (^$unsigned($signed((wire11 <<< reg14)))));
          reg14 <= ({(reg14[(2'h2):(2'h2)] ?
                  reg13[(4'ha):(3'h7)] : $signed((&(8'ha3))))} ^ {(($unsigned(reg12) != wire8[(1'h1):(1'h1)]) ?
                  $unsigned((-wire9)) : $unsigned((~|reg15)))});
          if ($signed($signed(((+$unsigned((8'haa))) * (wire7[(3'h4):(1'h1)] & $signed(wire11))))))
            begin
              reg15 <= reg14[(4'h9):(1'h0)];
              reg16 <= (reg16 != ($unsigned($signed((8'hae))) - $signed(({reg14} ?
                  {reg15, wire11} : $unsigned(wire10)))));
              reg17 <= $unsigned((~&$signed(reg12[(3'h7):(3'h5)])));
              reg18 <= $unsigned(reg17);
            end
          else
            begin
              reg15 <= $unsigned($unsigned((wire7[(3'h6):(2'h2)] ?
                  ($unsigned(wire11) ?
                      (reg13 ?
                          (8'ha4) : wire10) : reg16) : {reg14[(4'h9):(2'h2)],
                      wire9[(4'ha):(1'h1)]})));
              reg16 <= (|($unsigned($signed((wire9 ? wire7 : reg13))) ?
                  reg16 : reg17));
              reg17 <= (8'ha9);
            end
          reg19 <= {$signed($unsigned((reg17[(2'h3):(1'h1)] ?
                  $unsigned((8'hae)) : wire11[(3'h5):(2'h3)])))};
        end
      reg20 <= wire8[(4'hf):(3'h4)];
      reg21 <= $signed(($signed($signed($unsigned((8'ha3)))) ?
          $unsigned((~&(8'ha7))) : reg12[(3'h5):(2'h2)]));
    end
  assign wire22 = ($unsigned(($signed((reg18 ?
                          reg12 : wire11)) <<< $signed(wire11))) ?
                      ($unsigned(wire11) ?
                          (^~($signed((8'hae)) ?
                              (wire9 & (8'hbf)) : ((8'hb9) && (8'hbd)))) : $unsigned(reg14)) : $unsigned(((reg21[(3'h6):(3'h5)] ?
                          (reg15 | (8'ha3)) : (wire7 + reg16)) * ($unsigned((8'h9f)) <= $unsigned(reg17)))));
  assign wire23 = $signed($unsigned((reg17 | wire9[(1'h0):(1'h0)])));
  assign wire24 = reg17;
  always
    @(posedge clk) begin
      if ($unsigned(wire24[(1'h1):(1'h0)]))
        begin
          reg25 <= reg13;
          reg26 <= (reg12[(4'h8):(1'h0)] * $unsigned($signed((~(reg21 != wire22)))));
          reg27 <= ({({$unsigned(wire10)} - (~^reg20))} ?
              wire7[(3'h5):(3'h4)] : ((^~wire11[(2'h3):(2'h3)]) ?
                  reg12[(4'hf):(3'h6)] : (reg15 ?
                      $unsigned(wire9[(5'h10):(2'h2)]) : {(reg13 < reg17),
                          (reg19 ? wire22 : reg26)})));
          if (wire11[(4'hb):(3'h7)])
            begin
              reg28 <= $signed((!$unsigned($signed((wire24 || wire10)))));
              reg29 <= $unsigned($signed(wire7[(3'h5):(1'h0)]));
              reg30 <= (((({reg27} >> (~|reg16)) * (wire9[(4'hd):(4'h9)] ?
                      wire22[(4'ha):(4'h9)] : (~^wire24))) ?
                  $unsigned(($signed(reg18) ?
                      wire24 : $signed(wire7))) : $signed($unsigned(reg26))) - $signed((~$unsigned($unsigned(wire22)))));
            end
          else
            begin
              reg28 <= reg28[(4'ha):(3'h5)];
              reg29 <= ((7'h41) >>> (~&{$signed($unsigned(reg29)), (8'hb9)}));
              reg30 <= $unsigned(wire24[(4'hc):(2'h2)]);
              reg31 <= reg30[(3'h5):(1'h1)];
              reg32 <= reg15[(2'h3):(2'h2)];
            end
          if (reg26)
            begin
              reg33 <= $signed($signed($unsigned(($signed(wire7) < reg27))));
              reg34 <= (~wire24);
              reg35 <= $unsigned($unsigned($signed(($unsigned(wire23) <= reg34[(1'h1):(1'h0)]))));
            end
          else
            begin
              reg33 <= reg18[(5'h10):(4'hf)];
              reg34 <= ({($signed((reg34 <= reg30)) <= (|((7'h40) ?
                          (8'hb5) : reg12))),
                      {$signed($unsigned(reg32))}} ?
                  {(^(&(reg32 ? reg16 : wire22))),
                      ({(reg27 ?
                              wire22 : reg21)} <<< $signed((^~reg17)))} : ($unsigned(reg14[(3'h5):(1'h1)]) >>> $unsigned(reg13[(3'h7):(3'h5)])));
              reg35 <= (({$unsigned({wire9,
                      reg33})} ^~ wire10[(2'h2):(1'h1)]) && $signed(($signed(reg21) ?
                  ($signed(reg12) ?
                      reg33 : reg34[(4'he):(4'ha)]) : $signed(reg34))));
              reg36 <= (wire23 ? reg28 : (8'haa));
              reg37 <= ((reg25 ?
                  ((~&(reg14 >= reg30)) ?
                      reg25[(1'h1):(1'h0)] : reg18[(5'h10):(3'h4)]) : $unsigned((!(reg30 << wire10)))) >>> $signed($signed(reg31[(1'h0):(1'h0)])));
            end
        end
      else
        begin
          reg25 <= $signed(({(!{reg18, reg27})} ?
              (^$unsigned($signed(reg36))) : ({(reg20 ? wire9 : wire11),
                  reg35[(3'h7):(2'h2)]} | (reg25[(3'h4):(3'h4)] << (reg17 >>> wire23)))));
          reg26 <= ($signed(reg32) == ((((~&reg17) ?
                      wire23 : (wire7 ? (8'ha4) : reg18)) ?
                  reg29[(3'h6):(3'h6)] : (wire9 + $signed((8'ha2)))) ?
              reg29 : ($unsigned((~&(8'hbd))) ?
                  (~&reg33) : $unsigned((^reg18)))));
          reg27 <= $unsigned(reg35[(4'ha):(4'h8)]);
          reg28 <= (8'hb6);
          reg29 <= (reg35 * (reg20 ?
              (~|reg26[(5'h11):(3'h4)]) : ((~((8'ha2) <= reg19)) == $signed($signed(reg15)))));
        end
    end
  assign wire38 = $unsigned(reg33);
  assign wire39 = {reg14[(2'h3):(2'h2)]};
endmodule
