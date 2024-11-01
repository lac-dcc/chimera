module top
#(parameter param51 = ({((|((8'hbd) - (8'hb8))) ? {((8'hbd) ^ (8'hb0))} : {((8'ha3) ? (8'ha5) : (8'h9c)), (8'ha1)})} ^~ {(({(7'h43), (8'hb6)} ? ((8'h9c) >= (8'hba)) : ((8'hb8) >>> (8'ha2))) < (^(&(8'ha4)))), (8'ha4)}), 
parameter param52 = (param51 >>> {({(+param51)} ? (7'h41) : (8'h9c))}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hdc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire4;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire50;
  wire signed [(3'h6):(1'h0)] wire43;
  wire signed [(5'h12):(1'h0)] wire42;
  wire [(4'hb):(1'h0)] wire41;
  wire signed [(4'hd):(1'h0)] wire40;
  wire [(3'h7):(1'h0)] wire39;
  wire [(5'h13):(1'h0)] wire36;
  wire [(3'h5):(1'h0)] wire34;
  reg [(5'h10):(1'h0)] reg49 = (1'h0);
  reg [(4'hf):(1'h0)] reg48 = (1'h0);
  reg [(5'h12):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg45 = (1'h0);
  reg [(5'h11):(1'h0)] reg44 = (1'h0);
  reg signed [(4'he):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg37 = (1'h0);
  assign y = {wire50,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire36,
                 wire34,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg38,
                 reg37,
                 (1'h0)};
  module5 #() modinst35 (wire34, clk, wire4, wire3, wire2, wire0);
  assign wire36 = $unsigned(wire0[(4'he):(4'hc)]);
  always
    @(posedge clk) begin
      reg37 <= wire4[(3'h5):(2'h3)];
      reg38 <= (^~((~^{(wire1 ? wire4 : wire4),
          $signed(wire34)}) ~^ (^({wire36} ^ {wire2, (8'hb8)}))));
    end
  assign wire39 = ((wire36[(3'h5):(3'h5)] ?
                      (^wire36[(5'h10):(5'h10)]) : (wire34 ~^ $unsigned($unsigned(wire36)))) >> $unsigned(wire4[(4'hc):(1'h1)]));
  assign wire40 = $signed($signed(((~^wire36) ?
                      ($signed(wire3) <= $signed(wire34)) : (wire39 >>> (wire34 == reg37)))));
  assign wire41 = $unsigned((^~$unsigned(((reg37 ? reg37 : reg38) ?
                      (~&reg38) : $signed((8'ha6))))));
  assign wire42 = $signed((!$signed(($unsigned(wire3) ?
                      wire34 : $unsigned((8'hae))))));
  assign wire43 = $unsigned(wire41);
  always
    @(posedge clk) begin
      if ($unsigned(wire36))
        begin
          reg44 <= ((^~(wire36[(3'h4):(1'h1)] ?
              wire3 : ((wire4 ? (8'hab) : wire3) ?
                  $unsigned(wire42) : (wire39 != wire34)))) <<< (wire34 - ($signed(wire4) ?
              ({reg37} ?
                  (wire4 ?
                      wire0 : wire36) : (^~wire41)) : reg38[(4'h8):(3'h5)])));
          reg45 <= (~$unsigned(reg38[(2'h2):(1'h1)]));
          reg46 <= $unsigned($unsigned($signed(((wire40 <<< (8'hb4)) ?
              wire39 : wire3[(5'h12):(2'h2)]))));
        end
      else
        begin
          reg44 <= $unsigned(wire36);
          reg45 <= (&wire43);
          reg46 <= (((~^{((8'ha6) ? wire1 : reg38), wire2[(5'h14):(4'h9)]}) ?
              wire36[(2'h3):(2'h2)] : wire2) + reg38[(2'h3):(1'h1)]);
          reg47 <= ((~^(+$signed($unsigned((8'haf))))) ?
              wire3[(5'h10):(4'h8)] : $signed(($signed((~&wire40)) ?
                  $unsigned($unsigned(wire4)) : $signed({wire1, reg37}))));
        end
      reg48 <= (^{wire0[(4'hf):(4'hc)],
          ((wire43[(1'h0):(1'h0)] ^ wire3[(3'h4):(2'h2)]) ^ wire1)});
      reg49 <= $unsigned(((-reg44) ?
          (~^reg46) : (($signed(reg48) ?
              (~|(8'hb4)) : wire40) != $unsigned(reg44[(3'h4):(1'h1)]))));
    end
  assign wire50 = ((($signed($unsigned(reg44)) << reg44[(4'h8):(1'h0)]) ?
                          wire43 : (-$signed($signed(reg45)))) ?
                      ((8'hb3) ?
                          ((wire0[(3'h5):(3'h5)] && (wire4 ? wire3 : reg44)) ?
                              {(-(8'hbd)),
                                  (reg49 ? reg45 : wire1)} : {$signed(reg49),
                                  wire4[(4'h8):(3'h7)]}) : reg37) : ($signed((^$unsigned(reg46))) ~^ ((8'hb8) ?
                          ((reg48 ? wire4 : reg37) >> (wire40 ?
                              wire42 : reg38)) : {$unsigned((8'hb6)),
                              ((8'h9e) >>> reg38)})));
endmodule

module module5
#(parameter param33 = (({((^(8'hb3)) | ((8'hab) ? (8'ha8) : (8'hb4))), (~^((8'ha4) || (8'ha9)))} <= ((((8'ha7) + (8'ha8)) ? ((8'ha0) - (8'hb0)) : (&(8'hb9))) ? (((8'ha7) + (8'ha3)) ? (&(8'ha0)) : ((7'h44) << (8'hb7))) : (~^((8'hbb) + (8'ha8))))) ~^ (&{((^(7'h40)) ? (8'hb6) : ((8'hb7) != (8'hb0))), ({(8'hbd), (8'hab)} <= {(7'h42)})})))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h12e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire9;
  input wire signed [(4'he):(1'h0)] wire8;
  input wire [(4'hf):(1'h0)] wire7;
  input wire [(5'h14):(1'h0)] wire6;
  wire signed [(4'hd):(1'h0)] wire32;
  wire [(5'h14):(1'h0)] wire31;
  wire signed [(5'h11):(1'h0)] wire30;
  wire [(5'h12):(1'h0)] wire29;
  wire signed [(4'hb):(1'h0)] wire28;
  wire signed [(5'h14):(1'h0)] wire27;
  wire [(5'h11):(1'h0)] wire26;
  wire signed [(5'h10):(1'h0)] wire11;
  wire [(4'ha):(1'h0)] wire10;
  reg [(3'h6):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg24 = (1'h0);
  reg [(5'h10):(1'h0)] reg23 = (1'h0);
  reg [(3'h7):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg20 = (1'h0);
  reg [(2'h3):(1'h0)] reg19 = (1'h0);
  reg [(4'h9):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(5'h12):(1'h0)] reg14 = (1'h0);
  reg signed [(4'he):(1'h0)] reg13 = (1'h0);
  reg [(4'ha):(1'h0)] reg12 = (1'h0);
  assign y = {wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire11,
                 wire10,
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
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire10 = (wire9 <= wire6);
  assign wire11 = ($unsigned(wire10[(3'h4):(3'h4)]) != $signed($signed(wire9)));
  always
    @(posedge clk) begin
      reg12 <= wire7;
      if (($signed(wire10[(2'h3):(1'h1)]) != (({(wire8 ? wire7 : (8'h9e)),
          wire9} || ((^wire6) & ((8'hb1) ?
          (8'ha9) : (8'ha7)))) <<< $unsigned(((reg12 >= (7'h44)) ?
          $signed(wire6) : {wire7, wire9})))))
        begin
          reg13 <= {wire11};
          reg14 <= reg13[(4'hd):(2'h2)];
        end
      else
        begin
          reg13 <= (wire10[(4'h8):(3'h4)] || wire7[(4'h8):(1'h0)]);
          reg14 <= $unsigned($unsigned($signed($signed((wire10 | reg13)))));
        end
      if (((wire7 ? reg14[(3'h5):(1'h0)] : $signed(wire8[(4'he):(4'ha)])) ?
          $unsigned(reg14) : {(((wire7 ? reg12 : reg12) >> (^reg14)) ?
                  {$signed(wire10)} : $unsigned((wire8 ? reg13 : wire10))),
              wire11}))
        begin
          reg15 <= (((^wire11) & (~^({wire6,
              reg14} <<< ((8'h9c) - wire7)))) > (~&($signed((~^wire6)) && {(^reg14),
              wire9[(4'h8):(3'h7)]})));
          reg16 <= $signed(((8'hbf) ?
              (wire7[(3'h6):(1'h0)] ?
                  (wire7 ? reg15 : $unsigned(reg12)) : $signed((reg15 ?
                      reg12 : (8'hb4)))) : $unsigned(wire8[(4'hb):(3'h7)])));
          if (((!$signed(((wire8 + wire9) ?
              wire8[(4'he):(2'h2)] : wire8))) && wire6[(4'ha):(4'ha)]))
            begin
              reg17 <= (({($unsigned(wire11) ?
                      (reg15 ? wire7 : (8'hb3)) : wire11[(2'h2):(2'h2)]),
                  $unsigned($unsigned(wire9))} >>> wire8[(2'h2):(1'h1)]) ~^ (~|wire11));
              reg18 <= (8'h9d);
              reg19 <= $signed($unsigned($unsigned($unsigned({(8'hbf),
                  wire6}))));
            end
          else
            begin
              reg17 <= (((-$unsigned(wire8[(4'h9):(1'h0)])) ^ $unsigned($unsigned((8'ha9)))) >>> reg19);
              reg18 <= (reg18[(2'h3):(2'h3)] ?
                  (reg18[(3'h6):(2'h2)] ?
                      (wire8[(1'h1):(1'h0)] << ({wire9} < (!reg13))) : $unsigned($unsigned(wire11[(4'ha):(2'h2)]))) : (!(^~(~&((8'ha5) ?
                      wire7 : reg19)))));
              reg19 <= $unsigned((wire11[(4'hf):(4'hf)] >>> wire10[(3'h7):(3'h6)]));
              reg20 <= ((wire7[(3'h7):(1'h0)] ?
                      reg13[(4'ha):(1'h1)] : $signed({(|(8'ha5))})) ?
                  reg14[(4'ha):(3'h6)] : (~reg12[(2'h2):(1'h0)]));
            end
          if ($signed((~({$signed(wire9)} ? $signed((^reg16)) : reg16))))
            begin
              reg21 <= wire11[(3'h4):(2'h2)];
              reg22 <= $unsigned((~(({wire8, reg15} | $unsigned((8'hbc))) ?
                  reg19 : wire9[(4'hb):(3'h4)])));
            end
          else
            begin
              reg21 <= (wire7[(3'h5):(3'h4)] ?
                  (&$signed(({reg16, wire7} ?
                      reg14 : $unsigned(reg15)))) : reg18);
              reg22 <= reg20;
              reg23 <= ($unsigned(((wire7 << reg19[(2'h3):(2'h2)]) <= {(reg12 >= reg21),
                  ((8'hbb) ? wire10 : wire8)})) < {{$unsigned({wire9})}});
            end
          reg24 <= $unsigned(($signed((reg21 ?
              {wire10} : reg12[(1'h1):(1'h1)])) > $signed(((wire7 ?
              reg15 : reg13) ^ (~^reg23)))));
        end
      else
        begin
          reg15 <= wire9;
          reg16 <= $signed({(reg13[(2'h3):(1'h1)] != (~|wire7[(2'h2):(2'h2)])),
              (|(wire9[(4'he):(1'h0)] ?
                  {reg16, reg12} : reg17[(2'h3):(2'h2)]))});
          reg17 <= wire7;
          reg18 <= ($unsigned({(8'hb6), reg19}) ?
              reg20 : $signed((~^$signed(reg21[(1'h0):(1'h0)]))));
        end
      reg25 <= reg16[(4'hd):(4'hb)];
    end
  assign wire26 = (~&($signed(((&wire8) ?
                          $signed((8'ha9)) : $signed((8'ha2)))) ?
                      reg25 : wire10[(3'h7):(3'h7)]));
  assign wire27 = reg22[(3'h4):(1'h0)];
  assign wire28 = reg20;
  assign wire29 = (({(&wire10)} ?
                          $unsigned((~&reg20)) : $unsigned(({reg25,
                              reg22} || (^reg20)))) ?
                      $signed((wire8 ?
                          {$signed(reg20),
                              wire10[(2'h2):(1'h0)]} : reg13[(4'hc):(4'hb)])) : reg18);
  assign wire30 = $unsigned(reg21[(3'h4):(1'h1)]);
  assign wire31 = reg16;
  assign wire32 = (reg22[(3'h4):(3'h4)] ?
                      $signed(wire9[(3'h6):(2'h3)]) : reg12);
endmodule
