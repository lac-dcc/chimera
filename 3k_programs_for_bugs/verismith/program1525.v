module top
#(parameter param65 = (((((|(8'ha4)) <= (!(7'h40))) ? ({(8'ha0), (8'hb6)} + (+(8'hbd))) : (((7'h43) ? (8'ha3) : (7'h44)) || ((8'hb1) | (8'hb7)))) & ((((8'hbc) ? (8'haa) : (8'ha1)) ? ((8'hbc) <<< (8'ha7)) : ((8'haa) ? (7'h40) : (8'hac))) ? (((8'hae) >> (7'h42)) ? ((7'h40) ? (8'ha0) : (8'ha0)) : {(8'hae)}) : (^(~|(7'h42))))) || (&(!((~|(7'h42)) ? ((8'hbc) & (8'hb5)) : (8'hbf))))), 
parameter param66 = ({param65, param65} ? param65 : ((({param65, param65} ? (^param65) : (param65 <<< param65)) ? (|(param65 ? param65 : param65)) : (((8'haf) == param65) ? param65 : param65)) ? ((param65 ? (param65 ? param65 : param65) : (~param65)) ? ({param65} ^ param65) : (((8'hab) ^~ (7'h40)) | {param65, param65})) : (((~&param65) ? {param65} : (8'h9f)) ? ({param65} || (param65 < (7'h40))) : ((8'ha3) & {(8'ha1)})))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h179):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(2'h2):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire64;
  wire [(5'h14):(1'h0)] wire62;
  wire [(3'h6):(1'h0)] wire35;
  wire [(3'h6):(1'h0)] wire34;
  wire [(4'h9):(1'h0)] wire33;
  wire signed [(3'h5):(1'h0)] wire32;
  wire [(3'h6):(1'h0)] wire8;
  wire [(5'h12):(1'h0)] wire7;
  wire [(3'h6):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire5;
  reg signed [(5'h13):(1'h0)] reg31 = (1'h0);
  reg [(2'h2):(1'h0)] reg30 = (1'h0);
  reg [(5'h15):(1'h0)] reg29 = (1'h0);
  reg [(4'hf):(1'h0)] reg28 = (1'h0);
  reg [(4'ha):(1'h0)] reg27 = (1'h0);
  reg [(5'h10):(1'h0)] reg26 = (1'h0);
  reg [(5'h15):(1'h0)] reg25 = (1'h0);
  reg [(5'h14):(1'h0)] reg24 = (1'h0);
  reg [(3'h7):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg19 = (1'h0);
  reg [(5'h13):(1'h0)] reg18 = (1'h0);
  reg [(4'h9):(1'h0)] reg17 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg16 = (1'h0);
  reg [(3'h4):(1'h0)] reg15 = (1'h0);
  reg [(4'hb):(1'h0)] reg14 = (1'h0);
  reg signed [(4'he):(1'h0)] reg13 = (1'h0);
  reg [(3'h6):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg9 = (1'h0);
  assign y = {wire64,
                 wire62,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire5 = {wire1[(2'h2):(2'h2)],
                     ($signed((!$signed(wire2))) ~^ wire4[(3'h4):(1'h1)])};
  assign wire6 = (~&wire5);
  assign wire7 = wire1;
  assign wire8 = (^~(+$unsigned((~(wire0 + wire5)))));
  always
    @(posedge clk) begin
      reg9 <= ($signed(($signed((wire7 - (8'hae))) > $signed((wire1 ?
              wire6 : wire4)))) ?
          wire3[(1'h0):(1'h0)] : ((wire3 ?
              (wire5[(3'h6):(3'h5)] ?
                  wire0 : wire1[(1'h1):(1'h1)]) : (^(wire3 ~^ wire6))) + (^~wire6)));
      if ((({reg9[(4'h9):(3'h6)]} ?
              ((!wire7[(4'hd):(4'hd)]) ?
                  $unsigned($signed(wire8)) : (wire6 < (-wire5))) : wire6) ?
          ($signed((~^wire5[(1'h1):(1'h1)])) ?
              wire1[(1'h1):(1'h1)] : wire1) : (&reg9[(2'h3):(2'h3)])))
        begin
          if (wire3[(4'hd):(3'h7)])
            begin
              reg10 <= {reg9[(3'h6):(2'h2)]};
              reg11 <= (reg10[(4'he):(3'h7)] ?
                  $unsigned($unsigned(((wire8 ? wire2 : reg9) ?
                      (~&(8'h9f)) : (&wire8)))) : (8'hb4));
              reg12 <= $unsigned(($unsigned(((8'hbb) ?
                      wire7[(3'h4):(1'h1)] : ((7'h41) <= (8'hb5)))) ?
                  (((reg9 != wire4) < (wire6 ^~ (8'hb9))) ?
                      wire2 : $signed(wire3[(4'hf):(1'h1)])) : (+$unsigned((reg11 ?
                      reg10 : reg9)))));
              reg13 <= wire8[(1'h0):(1'h0)];
              reg14 <= $unsigned(($signed($unsigned(wire4[(4'hf):(4'hf)])) ?
                  ((^~wire4) && $signed({reg13, reg12})) : (~&(wire5 ^ {(8'hb8),
                      (8'hbc)}))));
            end
          else
            begin
              reg10 <= $signed((($unsigned($signed(wire8)) ?
                      reg10 : {wire1[(1'h1):(1'h0)]}) ?
                  reg14[(3'h5):(1'h0)] : reg12[(3'h5):(1'h0)]));
              reg11 <= $signed({wire4[(3'h6):(1'h0)]});
            end
          reg15 <= (wire0 >> $signed($unsigned(((+wire2) ?
              (reg14 <<< wire2) : (~|reg9)))));
          if (wire6[(2'h2):(1'h1)])
            begin
              reg16 <= wire0[(3'h7):(2'h3)];
              reg17 <= (({reg16, $signed($signed(wire4))} ?
                      wire6[(3'h4):(3'h4)] : {$signed($signed(reg9)),
                          ((wire6 ? reg16 : reg15) ?
                              $unsigned(reg10) : $unsigned(wire5))}) ?
                  {(-wire6[(3'h4):(2'h3)]),
                      $signed(((7'h41) ?
                          (8'hbe) : reg9))} : $signed($signed(wire1[(1'h1):(1'h0)])));
              reg18 <= (-$unsigned((-(wire5 + (~^reg11)))));
              reg19 <= $unsigned(reg14[(3'h6):(3'h5)]);
            end
          else
            begin
              reg16 <= (^~{$signed(((~^(8'ha5)) > (~|wire6))), wire5});
              reg17 <= reg13;
              reg18 <= (-(!$unsigned(reg19)));
              reg19 <= ((reg12 ?
                  {wire4,
                      reg13} : wire0[(1'h0):(1'h0)]) < $signed(reg12[(2'h3):(2'h3)]));
              reg20 <= $signed((wire4 ?
                  reg17[(3'h4):(2'h2)] : ({wire6} ?
                      ((~wire5) >>> ((8'hb9) ?
                          reg10 : wire5)) : {wire0[(2'h3):(2'h3)],
                          (~^(8'hba))})));
            end
          reg21 <= $signed($signed((~|reg11[(3'h7):(3'h5)])));
        end
      else
        begin
          reg10 <= (8'hb4);
        end
      if ($signed(((reg9[(4'hb):(4'ha)] ?
          reg18 : $signed(((8'ha3) * wire3))) >> ($unsigned(wire4) ?
          $unsigned((wire3 != reg14)) : $signed((reg20 ? wire6 : reg20))))))
        begin
          reg22 <= (($unsigned($signed($signed(reg15))) ?
                  $signed($signed({(8'hb1),
                      wire2})) : $signed(reg17[(3'h4):(1'h0)])) ?
              wire4[(4'h8):(1'h0)] : $signed((($signed(reg14) != reg11[(1'h1):(1'h0)]) ?
                  (^$signed(wire4)) : reg10)));
          reg23 <= $unsigned(reg17[(3'h7):(3'h6)]);
          if ($signed(reg11[(1'h0):(1'h0)]))
            begin
              reg24 <= {(reg20[(1'h1):(1'h0)] <= $signed((~^reg21[(1'h0):(1'h0)]))),
                  $unsigned({reg9})};
              reg25 <= $unsigned((-(&reg21[(3'h4):(2'h3)])));
            end
          else
            begin
              reg24 <= ($signed((8'ha4)) ?
                  (($signed($unsigned(wire5)) ?
                          $unsigned(reg24) : $unsigned(wire3[(1'h1):(1'h1)])) ?
                      (-$unsigned($unsigned(reg13))) : $signed($signed((wire6 ?
                          wire2 : reg24)))) : $unsigned({(reg14 ^~ reg23),
                      (|(reg21 && reg20))}));
              reg25 <= wire3;
              reg26 <= reg15[(1'h0):(1'h0)];
              reg27 <= (-$signed({wire3, $signed($unsigned(reg12))}));
            end
        end
      else
        begin
          if (wire0)
            begin
              reg22 <= $unsigned($signed(wire5));
              reg23 <= {($signed({(+reg24),
                      (reg16 ? reg13 : wire7)}) ^~ reg18)};
              reg24 <= ($unsigned($signed(((8'hb1) >> $signed(reg13)))) <= $unsigned($unsigned($unsigned(reg16))));
            end
          else
            begin
              reg22 <= (reg14[(1'h0):(1'h0)] + (wire7[(4'hd):(2'h3)] ?
                  (($signed(reg15) ? ((8'hbf) || reg11) : (^~reg9)) ?
                      $signed($signed(wire5)) : reg18) : (|reg11)));
              reg23 <= $unsigned($signed(wire4[(1'h0):(1'h0)]));
              reg24 <= (!($unsigned(((^reg14) ?
                      (8'ha8) : (reg23 ? wire8 : wire5))) ?
                  (&$unsigned({reg27})) : (~$signed($unsigned(reg23)))));
              reg25 <= reg12;
              reg26 <= ((!(wire5 < $signed((~reg25)))) ?
                  reg13[(1'h0):(1'h0)] : (reg24[(5'h10):(4'he)] ^~ {$unsigned({reg12,
                          reg27})}));
            end
          reg27 <= (~^wire3[(3'h4):(2'h2)]);
          reg28 <= (reg23[(2'h3):(2'h2)] << reg19);
          reg29 <= wire7;
          reg30 <= reg15[(3'h4):(3'h4)];
        end
      reg31 <= wire6[(3'h4):(3'h4)];
    end
  assign wire32 = wire7;
  assign wire33 = $signed($unsigned((reg19 ? {reg23} : {$signed(reg24)})));
  assign wire34 = (~$unsigned(({reg30[(2'h2):(1'h1)]} > ($unsigned(wire8) << $unsigned(reg26)))));
  assign wire35 = $unsigned($signed((8'hb4)));
  module36 #() modinst63 (.clk(clk), .wire39(reg21), .wire37(reg29), .y(wire62), .wire40(reg26), .wire38(reg31));
  assign wire64 = (8'hb7);
endmodule

module module36  (y, clk, wire40, wire39, wire38, wire37);
  output wire [(32'h4e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire40;
  input wire signed [(5'h10):(1'h0)] wire39;
  input wire signed [(5'h13):(1'h0)] wire38;
  input wire signed [(4'hb):(1'h0)] wire37;
  wire [(5'h10):(1'h0)] wire61;
  wire signed [(5'h11):(1'h0)] wire60;
  wire signed [(4'hd):(1'h0)] wire59;
  wire [(2'h2):(1'h0)] wire58;
  wire [(5'h12):(1'h0)] wire57;
  wire signed [(4'hb):(1'h0)] wire55;
  assign y = {wire61, wire60, wire59, wire58, wire57, wire55, (1'h0)};
  module41 #() modinst56 (wire55, clk, wire37, wire38, wire39, wire40);
  assign wire57 = $signed(wire55[(1'h1):(1'h1)]);
  assign wire58 = (($unsigned((~|(wire55 <<< wire38))) >>> wire38) ?
                      $signed($signed(((!wire37) ?
                          $signed((8'ha7)) : {wire57,
                              wire57}))) : (|($unsigned((~|wire40)) <<< wire38[(3'h5):(2'h2)])));
  assign wire59 = $signed(((8'ha7) >= (-$unsigned((&wire55)))));
  assign wire60 = wire55;
  assign wire61 = $signed(wire37[(4'hb):(3'h6)]);
endmodule

module module41
#(parameter param53 = ((((-((8'hb3) ? (8'ha1) : (7'h42))) ? (~|{(8'hab), (8'hae)}) : (((8'h9e) >>> (8'h9c)) >= ((8'ha3) < (8'hbe)))) >>> (~|{((8'hb4) << (8'hab)), (^~(8'hab))})) * ((((+(8'hb2)) ? (!(8'ha1)) : ((8'haf) != (8'hb7))) && (~&(&(8'hb0)))) == (((~&(8'hb9)) | (|(8'h9e))) ? (-(^(8'hbf))) : (8'ha5)))), 
parameter param54 = ((&((+(param53 >> param53)) && (param53 <<< param53))) || ((^~((|param53) != (param53 * (8'hac)))) ? ((~(~param53)) ? (-param53) : (|((8'h9f) ? param53 : param53))) : ({(^~param53)} ~^ (((8'hb0) ? (8'hae) : param53) ? param53 : (param53 + param53))))))
(y, clk, wire45, wire44, wire43, wire42);
  output wire [(32'h57):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire45;
  input wire signed [(5'h13):(1'h0)] wire44;
  input wire signed [(4'ha):(1'h0)] wire43;
  input wire signed [(4'ha):(1'h0)] wire42;
  wire [(3'h6):(1'h0)] wire52;
  wire [(4'hb):(1'h0)] wire51;
  wire [(4'hc):(1'h0)] wire49;
  wire [(5'h12):(1'h0)] wire48;
  wire [(4'hf):(1'h0)] wire47;
  wire [(4'hf):(1'h0)] wire46;
  reg [(4'h9):(1'h0)] reg50 = (1'h0);
  assign y = {wire52, wire51, wire49, wire48, wire47, wire46, reg50, (1'h0)};
  assign wire46 = $signed($signed($signed(($signed(wire45) ?
                      wire45[(4'hb):(2'h2)] : (wire42 ? wire44 : wire43)))));
  assign wire47 = ((8'ha2) ?
                      $signed({($signed((8'ha6)) ? wire42 : {(8'hbf)}),
                          wire45}) : (^~wire44[(4'h9):(3'h4)]));
  assign wire48 = $signed($unsigned((({(8'hbf), wire42} ?
                          $signed((8'h9d)) : $signed(wire43)) ?
                      (wire42 || (~&wire46)) : {wire43[(4'h9):(2'h3)],
                          wire42[(3'h7):(3'h7)]})));
  assign wire49 = {($signed(wire46[(2'h3):(1'h0)]) ?
                          wire44[(3'h6):(3'h5)] : (((wire47 ?
                                  wire47 : (8'h9e)) ^ $unsigned(wire46)) ?
                              (!wire43) : (wire47[(3'h7):(3'h7)] <<< (7'h40))))};
  always
    @(posedge clk) begin
      reg50 <= (!$signed($unsigned(wire45)));
    end
  assign wire51 = (~^($signed((&wire48)) ?
                      $unsigned({wire42}) : ((wire43 ?
                              (-wire46) : (reg50 ? wire44 : (7'h41))) ?
                          (^$unsigned(wire48)) : (-(8'h9e)))));
  assign wire52 = ((~(((wire49 ? (8'haf) : wire48) ?
                          ((8'ha3) ? wire43 : wire47) : $unsigned(wire43)) ?
                      wire45 : wire47[(2'h3):(2'h3)])) << ($unsigned((((8'hac) ?
                              wire44 : wire45) ?
                          wire45 : {(8'had), reg50})) ?
                      wire45 : $unsigned(wire51)));
endmodule
