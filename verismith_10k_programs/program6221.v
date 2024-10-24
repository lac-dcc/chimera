module top
#(parameter param71 = {(-(+(((8'ha1) ? (8'ha4) : (7'h42)) * ((8'hbd) > (8'hab)))))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1c6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire4;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire70;
  wire [(4'h9):(1'h0)] wire69;
  wire signed [(5'h15):(1'h0)] wire68;
  wire signed [(2'h3):(1'h0)] wire67;
  wire [(2'h2):(1'h0)] wire39;
  wire [(5'h13):(1'h0)] wire38;
  wire signed [(4'h8):(1'h0)] wire36;
  wire [(5'h15):(1'h0)] wire9;
  wire signed [(5'h10):(1'h0)] wire8;
  wire signed [(4'hf):(1'h0)] wire7;
  reg [(4'hf):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg62 = (1'h0);
  reg [(5'h15):(1'h0)] reg61 = (1'h0);
  reg [(5'h12):(1'h0)] reg60 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg59 = (1'h0);
  reg [(3'h6):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg54 = (1'h0);
  reg [(5'h13):(1'h0)] reg53 = (1'h0);
  reg [(3'h5):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg48 = (1'h0);
  reg [(2'h3):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg46 = (1'h0);
  reg [(5'h11):(1'h0)] reg45 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg44 = (1'h0);
  reg signed [(4'he):(1'h0)] reg43 = (1'h0);
  reg [(3'h5):(1'h0)] reg42 = (1'h0);
  reg [(4'h8):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg40 = (1'h0);
  reg [(5'h10):(1'h0)] reg5 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg6 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire39,
                 wire38,
                 wire36,
                 wire9,
                 wire8,
                 wire7,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
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
                 reg5,
                 reg6,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= $signed(((($unsigned(wire4) ?
              $unsigned(wire1) : wire4) & (wire3[(3'h5):(3'h5)] ?
              wire2[(4'h8):(1'h1)] : (~&wire1))) ?
          (wire2[(2'h2):(1'h1)] ?
              wire4[(4'h9):(1'h1)] : {(8'h9c)}) : wire1[(2'h3):(2'h2)]));
      reg6 <= $unsigned(((((reg5 ^~ wire2) ^~ (wire3 ? reg5 : wire3)) ?
          (wire3[(2'h3):(1'h0)] * (+wire2)) : ((~^reg5) ?
              $unsigned(wire0) : $unsigned(wire0))) <<< (|(~^$unsigned(wire0)))));
    end
  assign wire7 = (^(~(((wire3 ? wire2 : (8'h9f)) < wire0[(3'h5):(2'h2)]) ?
                     ($signed(reg6) >> wire2) : (-(wire0 != wire1)))));
  assign wire8 = wire3;
  assign wire9 = ($unsigned(({wire7[(4'hb):(2'h3)]} ?
                     wire0[(4'ha):(3'h4)] : ((wire4 ?
                         wire3 : wire0) <<< $signed(wire4)))) ^~ (^$signed($unsigned($unsigned(wire4)))));
  module10 #() modinst37 (.wire11(wire0), .y(wire36), .wire13(reg5), .wire12(wire8), .wire15(wire9), .clk(clk), .wire14(wire2));
  assign wire38 = (wire9[(4'he):(4'h8)] >> ({((wire8 ? reg5 : wire9) ?
                              wire36 : $signed(reg5))} ?
                      $signed(wire1) : {{$unsigned(wire2)}}));
  assign wire39 = {(wire8 ?
                          $unsigned(($unsigned(wire0) ?
                              (wire1 ^~ (8'ha4)) : (reg6 & (8'hb6)))) : ($unsigned(((8'ha5) ?
                              wire7 : (8'hae))) * (~{reg5, wire7})))};
  always
    @(posedge clk) begin
      reg40 <= (($signed(wire7) * wire39) ^ reg5);
      reg41 <= $signed(reg40);
      reg42 <= {(~$unsigned(reg5[(3'h4):(2'h3)]))};
    end
  always
    @(posedge clk) begin
      if (reg42)
        begin
          reg43 <= $unsigned({(wire1 ?
                  wire9 : ((wire2 ? wire2 : (8'ha8)) ?
                      wire2[(3'h5):(3'h5)] : ((8'hab) ? (8'hb3) : wire8))),
              $unsigned((reg40[(4'ha):(2'h3)] ?
                  $unsigned(reg6) : wire2[(3'h7):(1'h1)]))});
          reg44 <= wire9[(4'hf):(4'hf)];
          reg45 <= wire7;
          if (wire36)
            begin
              reg46 <= ($signed(($signed((8'hb7)) ?
                      (~|{wire38, wire2}) : wire36)) ?
                  (~&$signed($signed($unsigned(wire0)))) : $unsigned(((~&(~wire8)) > (((8'haf) << wire36) ?
                      wire1 : (reg42 - wire4)))));
              reg47 <= (wire0[(3'h4):(2'h2)] & (~|(~reg41[(2'h2):(2'h2)])));
              reg48 <= ((~(!(!((8'ha7) >> reg6)))) ? (8'haa) : (8'hbb));
              reg49 <= ((({(wire1 ? reg44 : reg42), reg45[(5'h10):(1'h0)]} ?
                      $signed((wire0 ? wire2 : reg46)) : $signed((wire4 ?
                          wire4 : reg41))) | ($signed($signed(wire39)) ^ reg48)) ?
                  reg42 : {$unsigned($signed($signed(wire8)))});
            end
          else
            begin
              reg46 <= (($unsigned((reg46[(3'h5):(3'h4)] - wire38)) != $signed($unsigned({wire39,
                  reg48}))) & $signed((~&(~&$unsigned(reg47)))));
              reg47 <= reg6;
              reg48 <= $signed((8'ha4));
              reg49 <= {(8'hbc)};
              reg50 <= $signed($signed(reg5));
            end
          reg51 <= (wire0[(2'h3):(2'h2)] ?
              $signed($signed(({wire36,
                  wire39} ^ $signed(reg41)))) : $unsigned((8'hb9)));
        end
      else
        begin
          reg43 <= reg50;
          reg44 <= {($signed({(reg45 > reg47),
                  {wire39, reg48}}) > (($signed(reg47) ~^ $unsigned(reg44)) ?
                  ((reg42 ^~ (8'hb5)) ?
                      {wire4, wire36} : $signed(wire9)) : (^~reg5))),
              $signed(((reg41 ^~ wire7[(4'hc):(4'hc)]) ~^ wire2[(3'h6):(3'h4)]))};
          reg45 <= ((|wire36) ?
              wire3[(4'h8):(1'h0)] : (reg40[(4'h8):(3'h4)] ?
                  $signed(((reg5 ? wire9 : (8'ha1)) ?
                      $signed(wire9) : wire4)) : (~^((reg50 ?
                      reg50 : reg46) < $unsigned(reg43)))));
          reg46 <= $signed(reg40[(4'ha):(3'h5)]);
        end
      reg52 <= (reg41 ?
          $signed(($signed({wire9}) * ($signed(wire2) ?
              wire36[(4'h8):(3'h7)] : wire4))) : (($signed((!wire9)) ?
                  {wire39[(1'h0):(1'h0)]} : (reg40[(3'h7):(3'h6)] < ((8'h9e) ?
                      reg51 : (8'ha5)))) ?
              reg51 : (|{(&reg40), $unsigned((8'had))})));
      if ((|($signed($signed($unsigned((8'ha7)))) ?
          (8'hb7) : (~^(|$signed((8'ha4)))))))
        begin
          if ((reg50 <= {$signed(reg41), reg52[(2'h2):(2'h2)]}))
            begin
              reg53 <= wire1[(3'h4):(1'h1)];
              reg54 <= (-wire7[(4'hb):(2'h2)]);
              reg55 <= ($signed(($signed((wire8 > wire38)) != reg48[(3'h5):(3'h4)])) * $signed(($signed((~reg50)) ?
                  $unsigned($signed(wire4)) : wire8[(4'h9):(3'h4)])));
              reg56 <= reg6[(3'h4):(1'h0)];
              reg57 <= $signed($signed(reg55[(4'hc):(3'h7)]));
            end
          else
            begin
              reg53 <= (+wire9[(5'h12):(3'h6)]);
            end
          if (((+reg43) ?
              ($signed(((reg5 ? reg53 : reg46) ?
                  (8'hb0) : reg50)) & $unsigned(reg53)) : wire9[(4'hb):(1'h0)]))
            begin
              reg58 <= {{((~&(reg46 >>> reg51)) <<< reg50)},
                  (&$unsigned((8'ha0)))};
              reg59 <= (($signed(reg52) ?
                      (^~$signed(wire4)) : reg40[(4'hc):(4'ha)]) ?
                  reg47[(1'h0):(1'h0)] : (($signed(wire3[(1'h1):(1'h1)]) != (~(reg57 < reg58))) ?
                      (-((reg55 ? reg41 : reg57) ?
                          {reg55,
                              (8'ha1)} : (wire38 && reg44))) : ($signed(wire36[(3'h4):(2'h2)]) ?
                          {(wire4 > reg44)} : $signed((reg50 ?
                              reg40 : wire7)))));
            end
          else
            begin
              reg58 <= reg54;
              reg59 <= ($signed({reg46}) ?
                  wire9[(3'h6):(3'h6)] : (reg56[(5'h10):(4'h9)] ?
                      $signed(reg49) : $signed((((8'h9f) ?
                          reg47 : reg47) <= (&wire1)))));
              reg60 <= $unsigned($signed((~^reg57[(3'h4):(1'h0)])));
              reg61 <= $signed($unsigned((-$signed(reg42[(2'h2):(1'h0)]))));
              reg62 <= ((-{((~^reg51) ? wire0 : (~|reg47)),
                  $unsigned($signed(reg51))}) << ((~reg43[(4'h8):(3'h4)]) ?
                  wire3 : $signed((wire4[(4'h8):(3'h6)] * (&reg48)))));
            end
          reg63 <= $unsigned(((({reg44, (7'h41)} ?
              (wire38 ?
                  reg58 : reg48) : $unsigned(reg56)) * {reg50}) || (({reg56,
                  (8'hb0)} && wire3) ?
              $signed($unsigned(reg49)) : ((reg45 * (8'hbd)) & (~wire9)))));
          reg64 <= ((&(!$signed($signed((8'hb9))))) ?
              $signed($signed(wire4[(2'h2):(1'h1)])) : reg61[(3'h7):(2'h2)]);
          reg65 <= $unsigned($signed((~&$unsigned($unsigned(reg56)))));
        end
      else
        begin
          reg53 <= ({(8'hbb), {$signed($unsigned(reg51))}} ?
              (~^($unsigned(((8'h9e) ? reg48 : reg60)) || (-reg46))) : reg49);
          reg54 <= (~^((-(8'hb0)) ? reg5 : $signed(wire4[(1'h0):(1'h0)])));
          reg55 <= ((~|((8'ha6) ^ $signed(reg62[(3'h4):(1'h1)]))) | reg57[(3'h5):(1'h0)]);
          reg56 <= wire1;
        end
      if ($signed(reg6))
        begin
          reg66 <= reg42[(1'h0):(1'h0)];
        end
      else
        begin
          reg66 <= ((^~(8'hb9)) ?
              $unsigned(($unsigned($unsigned(reg59)) ^~ $signed($unsigned(reg55)))) : ((reg56 + ((wire4 + wire2) ?
                  $unsigned(wire36) : (wire7 > reg42))) * $signed($unsigned($signed((8'hbe))))));
        end
    end
  assign wire67 = ($signed(reg59[(3'h4):(3'h4)]) > (^~$unsigned(((reg40 ?
                          wire0 : (8'hb5)) ?
                      (reg51 ? reg64 : wire38) : (~|(8'hb3))))));
  assign wire68 = (($signed($unsigned((+wire4))) ?
                          (reg56[(5'h12):(1'h0)] ?
                              ((reg65 ? (8'hb8) : wire1) ?
                                  reg47[(2'h3):(1'h1)] : (~wire9)) : (~|(reg61 ?
                                  wire9 : reg41))) : wire36[(3'h5):(1'h0)]) ?
                      ($unsigned(reg61[(4'hc):(4'hc)]) ?
                          $signed((+$unsigned(reg6))) : $signed(((reg54 ?
                                  reg51 : (8'haa)) ?
                              {reg65,
                                  reg61} : (~&reg64)))) : wire39[(1'h1):(1'h0)]);
  assign wire69 = reg59[(3'h7):(2'h3)];
  assign wire70 = $unsigned((^~{(reg6[(1'h0):(1'h0)] ?
                          (reg45 << (8'hbc)) : $unsigned(reg47))}));
endmodule

module module10
#(parameter param34 = {((~|(((8'ha9) && (8'ha6)) - {(8'ha6)})) ? (8'hab) : ({((8'hb9) > (8'ha3)), ((8'h9c) || (8'ha1))} ? (-(^~(8'hb0))) : (~^(^~(8'hbc)))))}, 
parameter param35 = (param34 ? (^{((8'hb5) ? param34 : (param34 <= param34)), (param34 ? (^~param34) : (-param34))}) : (+(param34 << (^{param34, param34})))))
(y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'hd3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire15;
  input wire signed [(3'h4):(1'h0)] wire14;
  input wire [(5'h10):(1'h0)] wire13;
  input wire [(4'hc):(1'h0)] wire12;
  input wire [(4'h9):(1'h0)] wire11;
  wire [(4'he):(1'h0)] wire21;
  wire [(5'h13):(1'h0)] wire20;
  wire signed [(2'h3):(1'h0)] wire19;
  wire [(5'h11):(1'h0)] wire18;
  wire signed [(4'he):(1'h0)] wire17;
  wire signed [(4'he):(1'h0)] wire16;
  reg signed [(4'hf):(1'h0)] reg33 = (1'h0);
  reg [(4'hb):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg31 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg28 = (1'h0);
  reg [(3'h4):(1'h0)] reg27 = (1'h0);
  reg [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg25 = (1'h0);
  reg [(5'h15):(1'h0)] reg24 = (1'h0);
  reg [(3'h7):(1'h0)] reg23 = (1'h0);
  reg [(4'hd):(1'h0)] reg22 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
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
                 (1'h0)};
  assign wire16 = ($unsigned((!(wire14 >> $signed((8'hb6))))) ?
                      (^$signed(wire13)) : $signed(wire14));
  assign wire17 = ((($unsigned((wire13 ~^ wire11)) == wire16) >= $signed($signed($signed((8'ha0))))) << wire13[(4'hb):(4'ha)]);
  assign wire18 = $unsigned({$unsigned(wire12[(4'hc):(3'h4)])});
  assign wire19 = $unsigned(wire15);
  assign wire20 = $signed(wire13[(2'h3):(2'h2)]);
  assign wire21 = (^~$unsigned((&wire14[(2'h3):(2'h3)])));
  always
    @(posedge clk) begin
      reg22 <= (wire13[(4'hb):(4'hb)] != {$signed(wire14)});
      reg23 <= {((~&wire15[(5'h14):(4'hc)]) - {wire16[(4'hc):(1'h0)]}),
          $unsigned(reg22)};
      if ($signed(wire18[(1'h0):(1'h0)]))
        begin
          reg24 <= (8'ha0);
          reg25 <= $signed(((-reg23[(1'h1):(1'h0)]) && ((reg22 >>> $unsigned(wire21)) ?
              wire16[(3'h7):(2'h2)] : ((reg22 ? wire18 : (8'had)) ?
                  wire11 : $signed(wire16)))));
          if (wire21)
            begin
              reg26 <= wire20;
              reg27 <= wire12[(4'hb):(4'ha)];
              reg28 <= ((&{$unsigned((wire20 ^ reg26))}) ?
                  (8'haa) : $unsigned(({(wire20 && wire21)} ?
                      ((^~wire15) + reg23[(3'h7):(1'h1)]) : reg25[(1'h0):(1'h0)])));
            end
          else
            begin
              reg26 <= ({((8'hb1) ? (~|{reg25, wire21}) : reg28[(3'h4):(1'h0)]),
                  $unsigned($signed((reg24 ?
                      reg26 : reg23)))} << $signed(((((8'hb5) << reg28) ?
                      $signed(wire21) : (wire18 ? reg28 : reg28)) ?
                  ((-reg27) ~^ (reg26 >>> reg24)) : reg25[(3'h6):(1'h1)])));
              reg27 <= wire20[(1'h1):(1'h1)];
              reg28 <= $signed($unsigned({$unsigned($unsigned((7'h43)))}));
              reg29 <= wire21[(1'h0):(1'h0)];
              reg30 <= reg27;
            end
          reg31 <= (|((wire17 ?
              wire12[(1'h1):(1'h0)] : wire19) < ({$signed(reg22),
              $signed(wire20)} ^~ reg29)));
        end
      else
        begin
          if ((wire11[(3'h5):(1'h1)] ?
              ($unsigned($signed(wire16[(4'h8):(4'h8)])) ?
                  wire12[(3'h5):(1'h0)] : (~^$signed((~reg25)))) : wire16[(3'h6):(1'h1)]))
            begin
              reg24 <= ((+(8'hb2)) >> reg30);
              reg25 <= $signed(wire18[(5'h10):(4'hd)]);
              reg26 <= $signed((!$unsigned(wire11)));
              reg27 <= (($unsigned(wire13[(4'hf):(4'hd)]) < $unsigned(wire16[(3'h4):(2'h2)])) ?
                  ($signed(reg24[(1'h0):(1'h0)]) ?
                      ($unsigned((reg27 ^~ (8'hbe))) != $unsigned((wire19 == reg31))) : (^~(((8'h9e) * (8'ha0)) == $unsigned(reg26)))) : ((8'h9e) ?
                      $unsigned(wire21[(4'h9):(4'h9)]) : ({wire18[(1'h1):(1'h1)],
                              {reg23, (7'h42)}} ?
                          wire15 : $unsigned(reg22[(3'h7):(3'h5)]))));
              reg28 <= wire12;
            end
          else
            begin
              reg24 <= {$signed((wire12[(4'ha):(3'h4)] ?
                      ($signed(wire16) > reg30) : wire20[(2'h3):(2'h3)]))};
            end
          reg29 <= {{$signed(($signed((8'hb1)) ?
                      $unsigned(wire18) : {(8'ha5)}))}};
        end
      reg32 <= {$unsigned($unsigned(wire21)),
          ({($signed(wire20) <<< (reg28 << wire18))} && wire19[(1'h0):(1'h0)])};
      reg33 <= $signed(((wire19 + (-wire21)) + reg24));
    end
endmodule
