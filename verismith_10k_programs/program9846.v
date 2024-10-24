module top
#(parameter param62 = (+(|((((8'hba) >> (8'h9c)) ? ((8'hbf) ^ (8'hbe)) : (~&(8'ha1))) || (((8'haf) ? (8'hb6) : (8'hb1)) ? (8'hb5) : (~&(8'hb1)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h181):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire [(3'h6):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire4;
  wire signed [(4'h8):(1'h0)] wire61;
  wire signed [(5'h14):(1'h0)] wire60;
  wire [(4'he):(1'h0)] wire35;
  wire signed [(4'he):(1'h0)] wire34;
  wire signed [(4'h8):(1'h0)] wire33;
  wire [(4'hf):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire7;
  wire signed [(3'h4):(1'h0)] wire31;
  reg [(4'hd):(1'h0)] reg59 = (1'h0);
  reg [(3'h7):(1'h0)] reg58 = (1'h0);
  reg [(4'h8):(1'h0)] reg57 = (1'h0);
  reg [(4'hb):(1'h0)] reg56 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg55 = (1'h0);
  reg [(2'h3):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg53 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg52 = (1'h0);
  reg [(3'h5):(1'h0)] reg51 = (1'h0);
  reg [(4'hb):(1'h0)] reg50 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg48 = (1'h0);
  reg [(4'he):(1'h0)] reg47 = (1'h0);
  reg signed [(4'he):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg42 = (1'h0);
  reg [(3'h6):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg36 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire35,
                 wire34,
                 wire33,
                 wire5,
                 wire6,
                 wire7,
                 wire31,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
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
                 (1'h0)};
  assign wire5 = wire2[(3'h4):(2'h3)];
  assign wire6 = (-wire0);
  assign wire7 = $signed(($signed(wire1) ?
                     $unsigned((wire2 ?
                         (wire4 ?
                             (8'h9d) : wire2) : wire5[(3'h6):(3'h4)])) : $unsigned((8'hb9))));
  module8 #() modinst32 (.wire13(wire6), .wire10(wire4), .clk(clk), .y(wire31), .wire12(wire1), .wire11(wire0), .wire9(wire2));
  assign wire33 = ({$unsigned(wire7)} ^~ (8'ha4));
  assign wire34 = {((8'hae) ?
                          (($unsigned(wire1) ?
                                  wire31[(2'h2):(1'h1)] : (^wire5)) ?
                              $unsigned((!wire1)) : $unsigned($signed(wire31))) : {(^~wire1)})};
  assign wire35 = (((wire33[(3'h7):(3'h7)] ?
                          (!(wire1 ?
                              wire0 : wire2)) : (wire4[(4'h8):(3'h4)] <= (~wire3))) <= (wire0 ?
                          (|(wire1 ? wire7 : wire0)) : wire31[(1'h1):(1'h1)])) ?
                      $unsigned({(((7'h43) & wire6) > ((8'hb0) ?
                              wire33 : (8'hac))),
                          (wire3[(3'h7):(1'h1)] ?
                              $unsigned(wire33) : $signed(wire1))}) : (~|wire33));
  always
    @(posedge clk) begin
      reg36 <= {($unsigned($signed(wire33)) <= wire1),
          ((^((wire5 ? wire1 : wire7) ? (^wire2) : $signed(wire6))) ?
              ((wire33[(4'h8):(1'h0)] ? (wire2 ? wire34 : wire35) : wire2) ?
                  {(^~wire3)} : $unsigned((wire2 ?
                      wire35 : (8'ha3)))) : (($signed(wire34) != wire33[(1'h1):(1'h1)]) ?
                  {{wire5}} : (wire5 ? (wire5 ? wire1 : wire3) : (+(8'ha6)))))};
      if ($signed(($unsigned((~^((8'hb1) & wire7))) ?
          $signed($unsigned(wire35)) : wire3)))
        begin
          reg37 <= $unsigned($unsigned((8'hb7)));
          reg38 <= $unsigned(({($signed((7'h41)) + $signed(wire4)),
              ((wire31 >> wire3) ?
                  {wire0,
                      wire2} : ((8'hb4) + wire34))} == $signed((~|$unsigned(wire6)))));
          if ((&wire33))
            begin
              reg39 <= $signed($signed($unsigned({(wire0 & wire6)})));
            end
          else
            begin
              reg39 <= (wire34[(4'h9):(4'h8)] <<< (wire33[(2'h3):(1'h1)] ?
                  $signed(($unsigned(wire33) ?
                      $unsigned(wire35) : $unsigned((8'ha7)))) : ($signed((reg37 ^ wire31)) ?
                      wire5 : wire34[(1'h1):(1'h0)])));
              reg40 <= $signed(((reg37[(4'hb):(4'hb)] && wire3[(4'hb):(2'h3)]) ?
                  (wire4 ?
                      ($unsigned(wire35) ~^ {reg37,
                          (7'h44)}) : ($signed(wire7) ?
                          (wire3 & wire34) : {wire34})) : $signed($unsigned((reg39 & reg36)))));
              reg41 <= wire1[(3'h4):(2'h3)];
              reg42 <= (wire33 | wire0);
            end
          reg43 <= ((~^((~|((8'ha4) && wire1)) ?
                  wire33[(3'h5):(1'h0)] : $unsigned($unsigned(wire1)))) ?
              wire1[(1'h1):(1'h1)] : $unsigned(($signed((wire2 || wire2)) ?
                  (~$signed(reg37)) : {wire6[(4'h8):(2'h3)]})));
          reg44 <= wire1[(1'h1):(1'h1)];
        end
      else
        begin
          if ($unsigned(reg42))
            begin
              reg37 <= {reg41, reg36};
            end
          else
            begin
              reg37 <= (((-{$unsigned(wire2),
                  {wire5, reg40}}) ^~ (reg36[(3'h5):(1'h0)] ?
                  (8'hab) : {reg42,
                      (wire34 != reg38)})) ^~ reg36[(3'h5):(3'h4)]);
              reg38 <= $signed((&wire0));
              reg39 <= {$signed($signed($signed(wire0))),
                  (!wire31[(2'h2):(2'h2)])};
              reg40 <= $unsigned(wire31);
            end
          reg41 <= (wire1 | (!$signed(((wire7 ? wire4 : wire1) ?
              (~&(8'had)) : (-wire5)))));
          if (wire3)
            begin
              reg42 <= (reg44 >>> (({(wire31 ? wire5 : (8'hba))} ?
                      {(reg39 ? wire33 : reg37),
                          (reg36 ? wire33 : wire5)} : (-(reg41 << wire2))) ?
                  ((|reg36) ?
                      wire0 : (-$unsigned(wire5))) : $unsigned($signed((wire3 ?
                      reg43 : reg37)))));
              reg43 <= reg39[(3'h5):(1'h1)];
            end
          else
            begin
              reg42 <= (reg37 ?
                  wire31 : (reg41 ?
                      $unsigned(($unsigned((8'h9f)) ?
                          $signed(wire34) : $unsigned(reg38))) : ($unsigned($signed(wire31)) >= ((+wire2) | (~|reg39)))));
              reg43 <= (|$unsigned($unsigned(reg36)));
              reg44 <= $unsigned(($unsigned((~&((8'haa) | wire33))) + {$unsigned((8'ha2))}));
            end
        end
      if (reg36[(4'ha):(4'h9)])
        begin
          if ($unsigned($unsigned(wire3)))
            begin
              reg45 <= (8'h9e);
              reg46 <= $unsigned((8'ha8));
              reg47 <= reg43;
            end
          else
            begin
              reg45 <= wire2[(3'h7):(3'h4)];
              reg46 <= $signed((~((!wire2) ?
                  ((~&reg40) ?
                      $signed(wire35) : wire31) : (!(reg41 & reg42)))));
              reg47 <= $unsigned(($unsigned(($unsigned(wire6) ?
                  (+wire1) : {(8'hbd), wire5})) < (reg36[(4'hc):(2'h3)] ?
                  $unsigned((wire34 ?
                      wire34 : wire31)) : $signed($unsigned(reg39)))));
              reg48 <= $signed($unsigned({($unsigned(reg38) >>> {reg46})}));
              reg49 <= ($signed((((~reg48) ?
                          $unsigned(wire1) : $unsigned((8'hb1))) ?
                      $signed((wire7 || wire1)) : $signed($signed((8'hbd))))) ?
                  reg46[(4'ha):(4'ha)] : {reg47[(4'hd):(3'h4)]});
            end
          reg50 <= $signed($unsigned($unsigned($unsigned(reg40))));
          reg51 <= $signed(wire3[(4'ha):(3'h7)]);
          reg52 <= $signed({wire33});
        end
      else
        begin
          reg45 <= reg43[(1'h0):(1'h0)];
          reg46 <= (reg38 >= ((wire35[(3'h4):(3'h4)] ?
              (wire35[(3'h7):(2'h2)] ?
                  (reg48 ?
                      wire34 : wire1) : $unsigned(wire2)) : $unsigned(reg51)) <<< $signed((reg43[(1'h1):(1'h0)] ?
              wire2 : $signed(wire33)))));
          reg47 <= $unsigned(($signed($unsigned((reg48 != reg45))) ?
              ($unsigned(reg51) ~^ ((^~(8'hba)) ?
                  wire31[(2'h2):(2'h2)] : (wire1 * wire0))) : reg52));
        end
      if (wire35)
        begin
          reg53 <= reg49[(2'h3):(2'h3)];
          if (((~^reg41) ?
              ({$unsigned(reg43)} ?
                  wire4 : (^~{(^~reg38)})) : $unsigned($unsigned(reg50))))
            begin
              reg54 <= $unsigned((+((+{reg40, wire7}) && $unsigned(wire0))));
              reg55 <= ((($signed((reg37 <<< reg41)) >= (&(wire2 > (8'haf)))) ?
                  (((wire31 ? reg47 : (8'ha5)) < ((8'hbc) ?
                      wire35 : (8'hb4))) | (8'h9d)) : $signed(wire34)) >> ($unsigned({(reg38 <= wire5)}) ~^ {$signed({reg41}),
                  $signed(wire34)}));
              reg56 <= $signed($signed((^((8'ha9) ?
                  (reg38 ? (8'hbb) : reg50) : reg42))));
            end
          else
            begin
              reg54 <= reg54[(1'h0):(1'h0)];
              reg55 <= (reg40 != reg42[(4'hd):(4'h8)]);
              reg56 <= (8'hbe);
              reg57 <= reg40;
              reg58 <= {wire31};
            end
        end
      else
        begin
          reg53 <= (((~&wire6) ?
              (wire6[(4'hd):(1'h1)] ^~ $unsigned({wire3})) : $signed(reg37[(5'h10):(2'h2)])) <= (((~^{wire3}) & (~&reg55[(3'h5):(3'h4)])) ?
              ($unsigned({wire1}) ?
                  {(wire33 >= wire34)} : (+$signed(wire33))) : reg47[(1'h1):(1'h0)]));
          reg54 <= ((reg51 ^~ (8'hb8)) ?
              wire34 : ((($signed(wire1) ?
                          wire34[(1'h0):(1'h0)] : (reg51 ? reg42 : reg53)) ?
                      wire34[(2'h3):(2'h2)] : $unsigned((8'hae))) ?
                  (&$unsigned(reg55)) : ($unsigned(wire33[(1'h1):(1'h0)]) & wire33[(4'h8):(3'h4)])));
          if ((reg36 || (reg57 ? reg44 : reg44[(4'h9):(2'h2)])))
            begin
              reg55 <= ((((~|reg38[(3'h4):(1'h0)]) == {reg44[(5'h14):(1'h0)]}) ?
                  (wire0 ?
                      (+$signed(reg39)) : wire34) : reg48[(5'h11):(3'h7)]) && (|reg46));
              reg56 <= (~^(^~($unsigned($unsigned(wire2)) * ({wire4, reg36} ?
                  (reg50 - wire31) : $signed(reg54)))));
              reg57 <= reg47[(2'h2):(1'h1)];
              reg58 <= ((7'h44) ?
                  reg57[(3'h6):(2'h2)] : (^~(($unsigned(reg51) ?
                      $unsigned(wire34) : $signed((8'hbb))) << ((reg42 & reg50) ?
                      ((8'ha0) & reg51) : reg36[(4'he):(4'hc)]))));
              reg59 <= ($unsigned({(^(reg43 & reg36)),
                  (reg37 != $unsigned(wire2))}) & reg36);
            end
          else
            begin
              reg55 <= wire7[(1'h0):(1'h0)];
              reg56 <= $signed($signed(reg48[(4'hc):(4'hc)]));
              reg57 <= wire35;
            end
        end
    end
  assign wire60 = $signed($unsigned($signed($signed($unsigned(reg42)))));
  assign wire61 = $signed(reg46);
endmodule

module module8
#(parameter param29 = {(8'hab), (({((8'hbf) ? (8'hb7) : (8'ha8)), ((8'h9d) || (7'h43))} <= ((8'ha0) & (|(8'hb3)))) ? ({((8'ha6) ? (8'ha3) : (8'ha5)), ((8'ha8) ? (8'ha6) : (8'ha2))} ? (^~(^~(8'h9c))) : (&((8'hb5) - (8'hb4)))) : ({((8'h9d) ? (7'h43) : (8'had)), (^(8'had))} | (~|{(7'h41)})))}, 
parameter param30 = (((((param29 ? param29 : (8'ha6)) == (param29 >> param29)) >> param29) ~^ (param29 ^~ (param29 ? param29 : {param29}))) > param29))
(y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'h93):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire13;
  input wire signed [(3'h6):(1'h0)] wire12;
  input wire [(5'h12):(1'h0)] wire11;
  input wire signed [(3'h6):(1'h0)] wire10;
  input wire [(4'hf):(1'h0)] wire9;
  wire signed [(2'h3):(1'h0)] wire28;
  wire signed [(4'he):(1'h0)] wire27;
  wire signed [(3'h6):(1'h0)] wire26;
  wire [(5'h10):(1'h0)] wire25;
  reg [(3'h7):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg23 = (1'h0);
  reg [(3'h5):(1'h0)] reg22 = (1'h0);
  reg [(4'ha):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg20 = (1'h0);
  reg [(2'h2):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(4'h9):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  assign y = {wire28,
                 wire27,
                 wire26,
                 wire25,
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
      reg14 <= (~&{(~^(~^$unsigned(wire13))), wire10});
      reg15 <= wire9;
      reg16 <= {((($signed(wire11) == wire11[(1'h1):(1'h1)]) == wire9[(3'h7):(2'h3)]) <= (^wire12)),
          $unsigned((!$unsigned((!wire10))))};
    end
  always
    @(posedge clk) begin
      reg17 <= ((~&(wire11[(5'h12):(3'h5)] > {(wire10 & (8'hb2))})) && ({($signed(wire11) ?
              {reg15, wire13} : ((8'h9c) ? reg16 : (8'ha8))),
          (((8'ha9) << wire13) != (wire9 && wire10))} | (wire10[(3'h4):(1'h1)] > $unsigned(wire11))));
      if (wire10[(3'h6):(3'h4)])
        begin
          if (($unsigned(((reg15[(2'h2):(2'h2)] == (-wire12)) ?
                  $unsigned($signed(wire11)) : ({wire10, wire13} ?
                      (reg16 || wire12) : {(8'ha9)}))) ?
              reg16 : (~&((8'hbb) ?
                  {(!(8'hb0)), (wire9 ? reg17 : wire11)} : ($signed(wire12) ?
                      reg15 : $signed(reg16))))))
            begin
              reg18 <= wire9;
              reg19 <= wire11;
              reg20 <= wire12[(3'h5):(1'h0)];
              reg21 <= (!(~(({reg15, (8'hb1)} <<< reg20) ?
                  ($unsigned(wire13) | reg19[(1'h0):(1'h0)]) : $unsigned(reg14))));
            end
          else
            begin
              reg18 <= wire9[(3'h5):(1'h1)];
              reg19 <= wire9[(4'hb):(2'h2)];
            end
          reg22 <= (~&reg20);
          reg23 <= reg18[(4'hb):(4'ha)];
        end
      else
        begin
          reg18 <= (~reg16);
          reg19 <= $signed(($signed(((!reg15) ?
              ((8'ha9) ?
                  wire12 : (8'ha8)) : (~|wire12))) <<< $signed($signed($signed(reg15)))));
          reg20 <= $unsigned(wire10);
        end
      reg24 <= (reg17 ? reg17 : (&wire11));
    end
  assign wire25 = (((~&(8'hb0)) ?
                      (^(((8'ha2) * reg23) ?
                          {reg16, reg20} : (wire10 | (8'hb2)))) : {reg21,
                          $signed((reg17 - reg15))}) - {(reg23 ^ {$unsigned(reg16)}),
                      reg15[(3'h6):(1'h0)]});
  assign wire26 = $signed(((&((7'h41) | (reg18 <<< reg15))) && wire25[(4'hd):(1'h0)]));
  assign wire27 = ((8'hbb) ?
                      ((reg18 && reg18) <= ($unsigned((reg17 < wire10)) != $signed(reg20[(3'h5):(2'h2)]))) : $unsigned(({$unsigned(reg23),
                              $signed(wire10)} ?
                          ({reg14} ?
                              (reg22 | wire26) : (^~reg16)) : ((&wire9) >>> (&reg23)))));
  assign wire28 = wire12[(3'h5):(3'h4)];
endmodule
