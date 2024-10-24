module top
#(parameter param80 = ((((((8'haf) ? (8'ha5) : (8'hb6)) ? ((8'hb6) <= (8'hbf)) : {(8'hb1)}) ? ({(8'h9f), (7'h40)} ? ((8'h9e) || (8'ha3)) : (~^(8'hb4))) : (-{(8'ha2), (7'h44)})) + ((((8'ha8) ? (8'hae) : (8'ha4)) || ((8'hb0) ? (8'hb4) : (8'ha1))) < (((8'ha3) ? (8'ha2) : (8'hab)) ? ((7'h44) ? (8'ha2) : (7'h44)) : (-(8'haa))))) ? {((~|(-(8'hb3))) != (8'hac)), ((((8'ha7) >> (8'hac)) ? {(8'hab), (8'hbd)} : (~|(8'hbe))) ? {((8'hbf) ? (8'hb2) : (8'hbc)), {(8'hac), (8'hbb)}} : (((8'haf) + (8'hb7)) | (+(7'h44))))} : (+{(((7'h40) < (8'hb9)) <<< (~|(7'h44)))})), 
parameter param81 = (((param80 ? (((8'hb9) ? param80 : param80) ? {param80} : (^~param80)) : param80) ? param80 : (|param80)) ? ((({param80} ? param80 : (|param80)) & {(param80 - param80)}) ? ((|(param80 ? param80 : param80)) - param80) : param80) : {param80}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h152):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire4;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire78;
  wire [(3'h5):(1'h0)] wire11;
  wire signed [(5'h12):(1'h0)] wire10;
  wire signed [(5'h13):(1'h0)] wire7;
  wire signed [(3'h4):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire5;
  reg [(4'hd):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg16 = (1'h0);
  reg [(5'h11):(1'h0)] reg17 = (1'h0);
  reg [(5'h15):(1'h0)] reg18 = (1'h0);
  reg [(4'hc):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg21 = (1'h0);
  reg [(4'h9):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg24 = (1'h0);
  reg [(5'h11):(1'h0)] reg25 = (1'h0);
  reg signed [(4'he):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg28 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg29 = (1'h0);
  assign y = {wire78,
                 wire11,
                 wire10,
                 wire7,
                 wire6,
                 wire5,
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
                 (1'h0)};
  assign wire5 = $unsigned($unsigned({wire1, (8'hb2)}));
  assign wire6 = (($unsigned(wire4[(4'hb):(4'h9)]) > $signed({(wire0 ?
                             wire1 : (8'haf)),
                         wire0[(4'h9):(1'h1)]})) ?
                     {(~((!(7'h41)) ?
                             (wire5 - wire2) : (wire1 ?
                                 (8'h9e) : wire5)))} : $signed($unsigned((~|$signed((7'h40))))));
  assign wire7 = ($unsigned((wire5 >= ((wire1 ?
                         wire1 : wire2) >> wire5[(1'h1):(1'h1)]))) ?
                     $unsigned(($signed($unsigned(wire5)) ~^ wire1)) : (~^((^$signed(wire2)) + wire1)));
  always
    @(posedge clk) begin
      reg8 <= (^(!$signed((8'hb3))));
      reg9 <= wire6[(2'h3):(1'h0)];
    end
  assign wire10 = ((wire3[(4'hd):(1'h0)] ?
                          wire2 : ($unsigned($signed(wire1)) <<< ($signed(wire4) ?
                              reg9[(1'h0):(1'h0)] : (reg9 != wire4)))) ?
                      $unsigned(((wire6 >>> (~|wire0)) ?
                          ($unsigned((7'h44)) ^ wire6[(1'h1):(1'h0)]) : $signed(((8'h9d) ?
                              wire4 : wire2)))) : reg8[(4'ha):(3'h5)]);
  assign wire11 = $signed((|(&wire10)));
  always
    @(posedge clk) begin
      if ((wire7[(4'he):(4'hb)] <= $signed((-($signed(wire11) ?
          wire11 : wire7[(2'h3):(2'h3)])))))
        begin
          reg12 <= reg9[(2'h3):(2'h2)];
          if ((reg8 ? reg9 : wire6))
            begin
              reg13 <= $unsigned((wire11[(2'h3):(1'h1)] <<< reg12));
              reg14 <= $unsigned($signed($unsigned(reg8[(3'h5):(1'h1)])));
              reg15 <= (((&((reg14 + wire11) ?
                      (-wire0) : reg13)) - wire3[(3'h6):(1'h1)]) ?
                  (-wire1) : $signed(wire3));
              reg16 <= wire2[(1'h1):(1'h1)];
              reg17 <= ((&(+(!wire0[(2'h3):(2'h2)]))) != (^~(reg9 ?
                  $unsigned($unsigned(wire10)) : wire3[(5'h11):(1'h0)])));
            end
          else
            begin
              reg13 <= (({{wire3, {reg9}},
                  (!wire7)} & reg17) * ($signed((^~((8'hb4) ?
                  wire2 : reg9))) + $unsigned((~&$unsigned(wire11)))));
            end
          if ($signed(($unsigned($signed($unsigned(wire5))) >= (^{$signed(wire2),
              {wire11}}))))
            begin
              reg18 <= $unsigned($signed((~|(8'hb2))));
              reg19 <= (reg12[(1'h0):(1'h0)] > ((7'h40) ?
                  ($unsigned(reg15) ?
                      ({reg8} | reg17[(2'h3):(2'h2)]) : $signed((~&wire6))) : ((wire5 ?
                      reg17 : {reg18}) <<< $unsigned($unsigned(reg8)))));
            end
          else
            begin
              reg18 <= (({((wire0 ? (8'ha2) : wire4) && (+reg12)),
                  {wire0[(1'h0):(1'h0)]}} >= ($unsigned((wire3 ?
                      reg9 : (8'hac))) ?
                  ((wire5 == wire0) | (+(8'ha7))) : ((reg16 ?
                      wire6 : wire5) | reg17[(4'hc):(4'ha)]))) << ($signed(wire10) ?
                  $unsigned((|(wire6 ?
                      reg8 : reg13))) : $unsigned($unsigned($unsigned(wire10)))));
              reg19 <= (((&(7'h43)) ?
                      reg8[(3'h5):(3'h4)] : reg12[(3'h7):(1'h1)]) ?
                  (~&((&$unsigned(wire10)) ?
                      (&(~&wire10)) : ($signed(wire10) - (wire4 ^ (8'hbd))))) : ($signed((reg15[(1'h0):(1'h0)] * reg9[(1'h1):(1'h0)])) > reg15));
            end
          reg20 <= (|reg12);
          reg21 <= ($signed((wire5 ? (+reg13[(3'h4):(2'h2)]) : (8'hb4))) ?
              $unsigned(reg9[(2'h2):(1'h0)]) : wire11[(3'h4):(2'h2)]);
        end
      else
        begin
          reg12 <= reg19[(3'h5):(2'h3)];
          reg13 <= (wire10[(1'h0):(1'h0)] - (^($signed(((8'ha7) ?
              reg8 : (7'h41))) >>> ($signed(reg21) ? (|wire1) : wire0))));
        end
    end
  always
    @(posedge clk) begin
      reg22 <= (!($signed(reg14) >>> reg21));
      reg23 <= (reg9[(1'h0):(1'h0)] ?
          wire10 : ((reg13 ? $unsigned((&wire5)) : (!(reg17 < wire3))) ?
              reg21[(1'h1):(1'h0)] : $signed(($signed(reg9) > {wire7,
                  (7'h44)}))));
      if ($signed((+$signed((!(reg20 ? wire5 : reg12))))))
        begin
          reg24 <= {(^wire2[(1'h1):(1'h0)]), wire4[(4'h9):(3'h5)]};
          reg25 <= $signed($unsigned({(wire7[(4'h8):(3'h4)] - reg15)}));
          reg26 <= wire4[(1'h0):(1'h0)];
          reg27 <= ((wire6[(1'h0):(1'h0)] <= (8'hb8)) ~^ $unsigned($signed((|(wire1 >> wire3)))));
          reg28 <= wire2;
        end
      else
        begin
          reg24 <= $signed(reg27[(4'ha):(4'ha)]);
          reg25 <= (reg9[(3'h4):(2'h3)] ?
              $signed(wire11[(2'h2):(1'h0)]) : reg21);
          reg26 <= reg9;
        end
      reg29 <= ((!((reg12[(3'h6):(1'h1)] ?
              reg15 : ((8'h9c) ? (8'ha4) : reg12)) ?
          {$signed(reg13)} : $unsigned(((8'ha7) ?
              reg25 : wire6)))) ~^ $unsigned(wire1));
    end
  module30 #() modinst79 (wire78, clk, reg27, reg12, reg13, reg18, reg24);
endmodule

module module30
#(parameter param77 = {(~|(8'hbb)), ({(~^(!(8'ha3)))} >= {(((8'hbc) ? (8'ha9) : (8'hb9)) ? (!(8'hb2)) : (+(8'ha2)))})})
(y, clk, wire35, wire34, wire33, wire32, wire31);
  output wire [(32'h13d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire35;
  input wire [(3'h4):(1'h0)] wire34;
  input wire signed [(4'h9):(1'h0)] wire33;
  input wire signed [(4'he):(1'h0)] wire32;
  input wire signed [(3'h6):(1'h0)] wire31;
  wire [(4'hd):(1'h0)] wire76;
  wire signed [(2'h2):(1'h0)] wire74;
  wire [(4'hb):(1'h0)] wire62;
  wire [(2'h2):(1'h0)] wire61;
  wire signed [(5'h10):(1'h0)] wire60;
  wire signed [(4'ha):(1'h0)] wire51;
  wire signed [(3'h6):(1'h0)] wire50;
  wire [(5'h13):(1'h0)] wire49;
  wire signed [(3'h4):(1'h0)] wire48;
  wire [(4'ha):(1'h0)] wire47;
  wire [(4'hd):(1'h0)] wire38;
  wire signed [(4'h9):(1'h0)] wire37;
  wire [(5'h11):(1'h0)] wire36;
  reg signed [(4'he):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg58 = (1'h0);
  reg [(5'h10):(1'h0)] reg57 = (1'h0);
  reg [(3'h4):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg55 = (1'h0);
  reg [(4'h8):(1'h0)] reg54 = (1'h0);
  reg [(5'h15):(1'h0)] reg53 = (1'h0);
  reg [(3'h5):(1'h0)] reg52 = (1'h0);
  reg [(4'h9):(1'h0)] reg46 = (1'h0);
  reg [(3'h6):(1'h0)] reg45 = (1'h0);
  reg [(4'he):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg39 = (1'h0);
  assign y = {wire76,
                 wire74,
                 wire62,
                 wire61,
                 wire60,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire38,
                 wire37,
                 wire36,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 (1'h0)};
  assign wire36 = ($signed($unsigned(wire34)) | ($signed((wire33[(3'h6):(2'h3)] ^~ $signed(wire33))) ?
                      ($unsigned((|wire31)) - wire31) : $signed($unsigned((wire35 ?
                          (8'hbc) : (8'haa))))));
  assign wire37 = ((({{wire34}} ?
                              (wire36[(1'h0):(1'h0)] || {wire36}) : $unsigned($signed(wire31))) ?
                          $unsigned(wire32) : wire31[(3'h5):(1'h1)]) ?
                      ((8'ha7) ~^ ({wire34} + ((wire31 ^~ wire31) > wire35[(3'h6):(3'h6)]))) : wire34);
  assign wire38 = $signed((wire34 < ($unsigned((wire33 <<< wire31)) ?
                      $unsigned($unsigned(wire34)) : $unsigned((8'hbd)))));
  always
    @(posedge clk) begin
      reg39 <= $signed($signed(wire32));
      if ($unsigned({{(wire31 ? (wire33 | wire34) : {wire36, wire37})}}))
        begin
          reg40 <= (^wire36[(1'h0):(1'h0)]);
          reg41 <= $signed($signed((~&(reg39[(3'h6):(2'h2)] & $unsigned(wire37)))));
          reg42 <= $unsigned((|$signed($unsigned((wire36 ? wire36 : reg41)))));
        end
      else
        begin
          if (reg41)
            begin
              reg40 <= (({{reg39}} ? wire36[(4'hd):(4'h9)] : $unsigned(reg39)) ?
                  ((^$signed(wire35)) ?
                      $signed(($signed(reg41) ^~ $signed(wire31))) : ($signed(reg39) == (wire35[(4'hb):(3'h6)] ?
                          reg39 : wire36[(5'h10):(4'hd)]))) : wire33[(3'h7):(1'h0)]);
              reg41 <= ((~(|(-(~^wire31)))) ?
                  (reg42[(3'h6):(2'h2)] || {wire31[(3'h5):(1'h0)],
                      wire33}) : ((8'h9c) ?
                      (~^wire34) : $unsigned(reg40[(2'h2):(2'h2)])));
              reg42 <= wire33;
            end
          else
            begin
              reg40 <= ($signed((8'hb3)) * (($unsigned($unsigned(wire35)) - wire35[(2'h3):(1'h0)]) ?
                  ({(wire33 && reg42)} & wire37) : (($signed(reg39) ?
                      wire38 : {reg41}) - reg40[(3'h5):(1'h0)])));
            end
          reg43 <= $unsigned(wire35);
          reg44 <= wire38;
        end
      reg45 <= ((({wire31, $signed(reg44)} ?
              wire32[(3'h6):(2'h3)] : (^$unsigned((8'ha9)))) == reg42) ?
          reg43[(4'ha):(3'h4)] : wire36);
      reg46 <= (reg41 >= (8'hb8));
    end
  assign wire47 = (wire35 - ({wire35[(1'h1):(1'h1)],
                      ((wire35 ?
                          reg39 : reg39) << $signed((8'hb3)))} - $unsigned((+(wire32 - wire31)))));
  assign wire48 = ($unsigned((~$unsigned(wire32))) ?
                      reg40 : $unsigned($unsigned((&$signed(wire47)))));
  assign wire49 = $signed(((8'hbf) ?
                      (reg46 != $signed($unsigned(wire36))) : (8'ha3)));
  assign wire50 = ({$signed(wire38[(4'h9):(4'h8)])} ?
                      {reg43[(4'hd):(3'h4)]} : $unsigned((reg41 != ((-(8'hac)) ?
                          $signed(reg42) : (-reg45)))));
  assign wire51 = $signed(reg46[(4'h8):(2'h2)]);
  always
    @(posedge clk) begin
      reg52 <= (!($unsigned($signed($unsigned(wire47))) ^~ wire35));
      reg53 <= (((~(reg45[(3'h4):(2'h2)] <<< $signed(reg42))) ?
              (~&(^~$unsigned(reg52))) : ((wire33 ?
                  wire36 : $signed(reg42)) - (+reg46[(3'h6):(1'h0)]))) ?
          $unsigned(reg52[(1'h1):(1'h1)]) : $signed({(wire49 >>> (|(8'hbf))),
              wire49}));
      if ((reg42 >> (reg39[(3'h6):(3'h4)] >> $unsigned($signed(wire48[(2'h3):(2'h2)])))))
        begin
          reg54 <= (^~({(^wire37), (~|wire37)} ?
              (wire49 <<< reg45) : wire33[(1'h0):(1'h0)]));
        end
      else
        begin
          if (wire35)
            begin
              reg54 <= wire32[(2'h2):(1'h1)];
              reg55 <= $unsigned(({($unsigned(wire32) - wire49),
                      (-$unsigned(reg45))} ?
                  (wire31 ?
                      (~reg43[(4'hd):(1'h0)]) : {$signed(wire36),
                          (^wire33)}) : $signed(wire49[(2'h3):(1'h0)])));
              reg56 <= $unsigned((^~(~$unsigned((~^wire48)))));
              reg57 <= $signed($unsigned(($unsigned((wire33 ? wire31 : reg43)) ?
                  (^~$unsigned(wire32)) : (wire38[(4'hd):(4'h8)] ?
                      reg41 : (wire50 - (7'h41))))));
            end
          else
            begin
              reg54 <= ((($unsigned(((8'haf) != reg39)) ?
                          {{(8'ha5), reg39}} : $signed(reg54[(3'h7):(3'h6)])) ?
                      {(!(!reg43)), $signed((+reg55))} : reg45) ?
                  $unsigned($signed((!$signed(reg42)))) : reg54);
              reg55 <= {(wire50[(3'h6):(3'h6)] ? (8'h9e) : (|wire48)),
                  $unsigned(wire37)};
            end
        end
      reg58 <= ((^~$signed((~(8'hae)))) ?
          ($unsigned(reg43) ?
              (wire37 <<< wire38[(1'h0):(1'h0)]) : (~^$signed({reg55,
                  wire47}))) : ((^wire49[(5'h10):(4'hd)]) ?
              $unsigned(reg41[(1'h1):(1'h1)]) : (~|wire50)));
      reg59 <= ($signed($unsigned((((7'h44) ? reg42 : wire49) ?
          wire50 : {(8'hb8)}))) <<< $signed($unsigned($unsigned((reg54 + wire31)))));
    end
  assign wire60 = $signed({$signed({(reg58 >= wire37), $unsigned((8'hab))}),
                      $unsigned(wire37[(3'h7):(3'h7)])});
  assign wire61 = wire47[(3'h6):(3'h4)];
  assign wire62 = $signed(wire36);
  module63 #() modinst75 (wire74, clk, reg58, reg57, wire36, wire35);
  assign wire76 = $signed(($signed($unsigned(wire47[(2'h3):(2'h2)])) || $unsigned({(!wire35),
                      $signed((8'ha4))})));
endmodule

module module63
#(parameter param73 = ((!({(8'haf)} <= (~&{(8'hb6), (8'hbb)}))) ? (+({((7'h42) ^ (8'hbf)), ((8'hb3) ? (8'hb3) : (8'hb2))} ? (~{(8'hb0)}) : ((-(7'h44)) | ((7'h40) != (8'ha2))))) : {(|{(~^(8'hbc)), (-(8'haa))})}))
(y, clk, wire67, wire66, wire65, wire64);
  output wire [(32'h49):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire67;
  input wire signed [(5'h10):(1'h0)] wire66;
  input wire [(5'h10):(1'h0)] wire65;
  input wire signed [(3'h4):(1'h0)] wire64;
  wire [(5'h14):(1'h0)] wire72;
  wire [(5'h11):(1'h0)] wire71;
  wire [(5'h15):(1'h0)] wire70;
  wire signed [(4'h9):(1'h0)] wire69;
  wire [(3'h5):(1'h0)] wire68;
  assign y = {wire72, wire71, wire70, wire69, wire68, (1'h0)};
  assign wire68 = wire66;
  assign wire69 = wire65;
  assign wire70 = wire69;
  assign wire71 = wire64;
  assign wire72 = wire67;
endmodule
