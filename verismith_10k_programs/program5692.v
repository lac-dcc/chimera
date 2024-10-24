module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h15d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire0;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire4;
  wire signed [(5'h13):(1'h0)] wire5;
  wire [(4'ha):(1'h0)] wire50;
  reg signed [(5'h14):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg77 = (1'h0);
  reg [(3'h4):(1'h0)] reg76 = (1'h0);
  reg [(3'h4):(1'h0)] reg75 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg74 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg73 = (1'h0);
  reg [(3'h7):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg71 = (1'h0);
  reg [(5'h12):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg69 = (1'h0);
  reg [(3'h7):(1'h0)] reg68 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg67 = (1'h0);
  reg [(3'h5):(1'h0)] reg66 = (1'h0);
  reg [(5'h12):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg64 = (1'h0);
  reg [(5'h13):(1'h0)] reg63 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg61 = (1'h0);
  reg [(4'ha):(1'h0)] reg60 = (1'h0);
  reg [(5'h13):(1'h0)] reg59 = (1'h0);
  reg [(4'ha):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg56 = (1'h0);
  reg [(3'h7):(1'h0)] reg55 = (1'h0);
  reg [(4'hd):(1'h0)] reg54 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg52 = (1'h0);
  assign y = {wire5,
                 wire50,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
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
                 (1'h0)};
  assign wire5 = ($unsigned((($unsigned(wire4) ? $signed(wire2) : (|wire3)) ?
                     {$signed(wire4)} : ($signed(wire0) && wire0))) > {((wire4 ?
                             (^(8'haa)) : (&wire4)) ?
                         ((-wire2) ? wire3 : wire4) : wire3)});
  module6 #() modinst51 (wire50, clk, wire0, wire5, wire4, wire1, wire2);
  always
    @(posedge clk) begin
      reg52 <= (wire3 ?
          $unsigned({{(wire0 * wire2), wire3}}) : wire4[(4'ha):(1'h1)]);
      if ({(wire5 <= (($signed(wire1) >> $signed(reg52)) ?
              (~^$unsigned(wire1)) : $unsigned($signed(wire0))))})
        begin
          reg53 <= {wire3,
              ((wire50[(3'h7):(1'h1)] ? wire50 : wire5[(5'h11):(2'h2)]) ?
                  (8'hba) : wire4[(4'ha):(2'h3)])};
          reg54 <= (8'hac);
          reg55 <= wire0[(2'h2):(1'h1)];
          reg56 <= $signed($unsigned((wire2 ?
              $unsigned((wire5 == wire5)) : {$unsigned(wire50),
                  (reg53 * wire2)})));
        end
      else
        begin
          reg53 <= (~^wire4);
        end
      reg57 <= wire0;
      if ($unsigned((wire5 <<< ((((8'haf) <<< (7'h43)) ?
              {reg54} : wire0[(3'h7):(3'h7)]) ?
          reg54 : $unsigned({wire4})))))
        begin
          reg58 <= (((-$signed((reg55 <= reg57))) ?
                  (^~wire5[(5'h12):(1'h0)]) : (wire4 << (~&$signed(reg57)))) ?
              wire3 : {$unsigned($signed($unsigned(wire2))),
                  (~(wire0[(4'ha):(2'h2)] + (reg53 == wire1)))});
          reg59 <= reg53[(1'h1):(1'h1)];
          reg60 <= (((wire2[(4'hf):(1'h1)] ~^ (~{reg57, wire3})) ?
              $unsigned($unsigned($unsigned(reg52))) : {$signed(reg54)}) < wire2[(4'hf):(4'hc)]);
          if ((reg55 ?
              (((8'ha8) ?
                      (reg54[(4'h9):(3'h4)] ?
                          (reg59 >= reg55) : $signed(reg52)) : (-$unsigned(wire1))) ?
                  $signed((reg60[(4'h8):(1'h0)] ?
                      $unsigned(wire3) : wire50[(1'h1):(1'h0)])) : reg57) : wire2[(3'h7):(2'h3)]))
            begin
              reg61 <= (reg55[(3'h5):(2'h2)] ?
                  wire1 : (|$unsigned(({(8'hac)} > $unsigned((8'ha4))))));
            end
          else
            begin
              reg61 <= reg55;
              reg62 <= (wire1[(3'h5):(2'h3)] >> (~|wire1));
              reg63 <= reg61[(1'h1):(1'h0)];
              reg64 <= wire2[(4'he):(1'h1)];
            end
        end
      else
        begin
          reg58 <= (($unsigned($unsigned(reg60)) ?
              ($signed((reg57 * reg58)) + wire1) : ((~&wire5[(2'h2):(1'h1)]) - $unsigned(reg60[(1'h0):(1'h0)]))) + $signed($unsigned(($unsigned(reg57) ?
              $signed(wire2) : {reg59}))));
          if (((($signed(wire1) ?
                  $signed(reg56[(4'h9):(1'h0)]) : $unsigned(reg54[(3'h5):(2'h2)])) >>> $signed(((7'h43) > {reg56}))) ?
              (~(8'h9c)) : (&{$signed({wire5, wire3})})))
            begin
              reg59 <= {$unsigned((({wire5,
                      reg61} <<< reg63[(1'h0):(1'h0)]) >>> $unsigned(reg56)))};
              reg60 <= $unsigned({reg58[(3'h7):(3'h7)]});
              reg61 <= $unsigned(({$unsigned((-wire5)),
                      {$signed(reg60), $signed(wire1)}} ?
                  ((~(reg52 < reg55)) ^ ((wire2 ? reg56 : reg54) ?
                      (reg54 | reg54) : (~|(8'hb2)))) : {(8'h9c),
                      $unsigned($signed((8'h9e)))}));
              reg62 <= $signed((~^wire2[(1'h1):(1'h0)]));
              reg63 <= ((8'hbb) || ((~|($unsigned(wire0) ?
                  (reg60 ?
                      reg55 : wire0) : (~&wire5))) ^~ $unsigned((wire1[(3'h4):(1'h1)] ^~ reg56))));
            end
          else
            begin
              reg59 <= $unsigned(reg64[(2'h2):(1'h1)]);
              reg60 <= (($unsigned(($unsigned(reg54) ?
                          wire2[(4'hd):(2'h3)] : $signed(reg63))) ?
                      ({(~reg62)} ?
                          ((reg54 == reg56) ?
                              wire5 : $unsigned(reg59)) : $signed(((8'ha2) || wire0))) : reg62[(2'h3):(2'h3)]) ?
                  $unsigned((^~$unsigned($signed(reg54)))) : $unsigned(reg53));
              reg61 <= $unsigned(reg60);
            end
          reg64 <= reg63[(1'h0):(1'h0)];
        end
      reg65 <= $signed(($unsigned((wire3 ?
          (reg63 ? (8'haf) : (8'ha4)) : $signed(wire50))) >= $signed({(reg53 ?
              reg64 : (8'hae)),
          (~^reg56)})));
    end
  always
    @(posedge clk) begin
      reg66 <= $unsigned(($signed($signed($signed(wire50))) >= (!(((8'hbe) ?
          wire1 : reg64) >> $signed(wire3)))));
      reg67 <= (+$unsigned(($signed((8'ha0)) ^ $unsigned({wire3}))));
      reg68 <= wire5;
    end
  always
    @(posedge clk) begin
      reg69 <= reg55[(1'h1):(1'h0)];
      reg70 <= (~$unsigned(wire50));
      if ((~&(reg53[(3'h5):(3'h5)] ?
          ($signed($unsigned(reg57)) ?
              reg63 : (~^$unsigned(reg70))) : reg55[(1'h1):(1'h1)])))
        begin
          reg71 <= reg58[(4'h8):(3'h6)];
          if ($signed(($unsigned(reg61) > ($signed({reg55}) ?
              (^((7'h41) >> wire2)) : (reg60 ?
                  $unsigned(reg63) : ((8'ha4) ? wire1 : reg57))))))
            begin
              reg72 <= (-$signed((((~|reg64) ? $signed(reg70) : reg54) ?
                  $signed((~^wire3)) : wire3)));
            end
          else
            begin
              reg72 <= wire1;
              reg73 <= {$unsigned({((reg53 ^~ reg62) ?
                          wire2[(3'h6):(3'h4)] : {reg68, reg56})})};
              reg74 <= (wire2[(1'h0):(1'h0)] ?
                  (((!{wire5, wire0}) ^~ reg63) ^ (((8'hb3) ?
                      $unsigned(wire50) : (wire4 ?
                          reg59 : reg61)) * {wire4})) : reg54);
              reg75 <= {(|$signed($unsigned(reg67))),
                  $unsigned(($unsigned({reg74}) ?
                      reg53[(3'h4):(3'h4)] : (8'h9e)))};
            end
          reg76 <= ({reg52,
              $signed(($unsigned((8'ha7)) + $signed(reg58)))} ~^ {$signed(reg52),
              reg59[(1'h1):(1'h0)]});
          reg77 <= {wire5, (!$unsigned({$signed(reg69)}))};
        end
      else
        begin
          reg71 <= $unsigned(($unsigned($unsigned(reg52)) ?
              ((reg62[(4'h9):(4'h9)] ^~ (8'hbf)) ?
                  {(reg57 ? reg77 : reg74)} : $unsigned((8'ha1))) : reg59));
          if (reg68)
            begin
              reg72 <= {$unsigned(($unsigned($unsigned((8'ha0))) ?
                      (&$unsigned(reg56)) : $signed($unsigned((7'h40)))))};
              reg73 <= {(^~{$signed(wire5[(4'he):(4'hb)])})};
            end
          else
            begin
              reg72 <= (((((wire2 ? wire2 : wire0) ?
                              $signed(reg59) : reg52[(1'h0):(1'h0)]) ?
                          reg64[(1'h1):(1'h0)] : $unsigned($signed(reg68))) ?
                      (reg75 || reg62[(1'h1):(1'h1)]) : reg76[(1'h1):(1'h0)]) ?
                  (|$signed((reg61 ^~ $unsigned(reg56)))) : $unsigned(reg68));
              reg73 <= $unsigned(($signed($unsigned((reg75 ~^ (8'hbe)))) ?
                  $signed(reg69[(3'h7):(1'h1)]) : reg60));
              reg74 <= reg58;
              reg75 <= reg66;
              reg76 <= (reg68[(3'h7):(1'h1)] ?
                  {($unsigned((reg52 ? reg68 : reg61)) ?
                          $signed((wire3 ? wire2 : (8'hbd))) : (&(reg60 ?
                              reg55 : reg57))),
                      reg65[(4'he):(4'hc)]} : {$signed(($signed(reg54) >= (reg76 >>> reg54)))});
            end
          reg77 <= wire50[(1'h1):(1'h0)];
          if ($signed($signed($unsigned((wire50[(4'ha):(1'h1)] ?
              reg70 : $signed(reg62))))))
            begin
              reg78 <= $signed(reg62[(2'h3):(1'h0)]);
              reg79 <= $unsigned({{wire3}, reg63});
              reg80 <= $signed(reg58);
            end
          else
            begin
              reg78 <= reg61;
              reg79 <= $signed(wire2);
              reg80 <= $unsigned($signed($signed(reg59[(2'h2):(2'h2)])));
              reg81 <= $unsigned($unsigned((reg65[(5'h12):(3'h5)] - $signed({reg55,
                  reg80}))));
            end
        end
    end
endmodule

module module6  (y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h41):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire11;
  input wire [(5'h10):(1'h0)] wire10;
  input wire [(4'he):(1'h0)] wire9;
  input wire [(4'hf):(1'h0)] wire8;
  input wire signed [(4'hf):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire45;
  wire [(3'h5):(1'h0)] wire43;
  reg [(4'h9):(1'h0)] reg49 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg48 = (1'h0);
  reg [(5'h10):(1'h0)] reg47 = (1'h0);
  reg [(5'h11):(1'h0)] reg46 = (1'h0);
  assign y = {wire45, wire43, reg49, reg48, reg47, reg46, (1'h0)};
  module12 #() modinst44 (wire43, clk, wire8, wire7, wire9, wire10);
  assign wire45 = ((~&((~$unsigned(wire8)) < wire43)) | ({{wire7[(2'h3):(2'h2)]},
                          wire43} ?
                      wire11[(2'h3):(2'h3)] : (wire11[(1'h0):(1'h0)] ~^ $signed((wire11 ?
                          wire10 : wire8)))));
  always
    @(posedge clk) begin
      reg46 <= $signed((&($unsigned(wire8) ?
          (wire8 ? (+wire9) : $signed(wire9)) : (wire9[(3'h6):(3'h4)] ?
              (!(8'hab)) : (wire45 + wire9)))));
      reg47 <= wire9;
      reg48 <= ((8'h9c) ?
          (|(((^wire9) ? (wire43 ? wire9 : wire8) : (~^reg46)) ?
              $unsigned($unsigned(wire8)) : $unsigned(wire11))) : $unsigned($unsigned((~|(wire45 > wire10)))));
    end
  always
    @(posedge clk) begin
      reg49 <= (reg46 > $unsigned($unsigned((~$unsigned((8'hb0))))));
    end
endmodule

module module12
#(parameter param42 = ((^~(|(~^(+(8'h9d))))) && ((((^(8'h9f)) ? ((7'h43) ? (8'hb8) : (8'hb7)) : ((8'hb8) ? (7'h44) : (8'hb5))) ? (7'h42) : (&((8'hbe) ~^ (8'hbd)))) ? ((!((8'hbe) >>> (8'hbe))) ? (((8'h9e) == (7'h44)) ? ((8'h9d) || (8'ha1)) : (~|(8'ha7))) : (^{(8'had)})) : (((~|(8'haf)) >>> ((7'h41) ? (8'hb6) : (8'ha0))) ? (((8'hbc) << (8'ha3)) ? (7'h44) : ((8'h9c) ? (8'hba) : (8'h9c))) : (((8'hb7) ? (8'hb2) : (8'h9c)) ? {(8'h9e)} : (~(7'h40)))))))
(y, clk, wire16, wire15, wire14, wire13);
  output wire [(32'hfc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire16;
  input wire signed [(4'hf):(1'h0)] wire15;
  input wire signed [(4'he):(1'h0)] wire14;
  input wire signed [(4'hd):(1'h0)] wire13;
  wire signed [(4'h9):(1'h0)] wire41;
  wire [(3'h6):(1'h0)] wire40;
  wire signed [(2'h2):(1'h0)] wire39;
  wire [(4'h9):(1'h0)] wire38;
  wire signed [(4'h8):(1'h0)] wire37;
  wire [(3'h4):(1'h0)] wire36;
  wire signed [(4'ha):(1'h0)] wire35;
  wire signed [(4'hf):(1'h0)] wire34;
  wire signed [(4'hb):(1'h0)] wire33;
  wire [(5'h12):(1'h0)] wire28;
  wire [(3'h5):(1'h0)] wire27;
  wire signed [(5'h12):(1'h0)] wire26;
  wire [(4'hf):(1'h0)] wire22;
  wire [(4'h8):(1'h0)] wire21;
  wire [(3'h6):(1'h0)] wire20;
  wire [(4'h8):(1'h0)] wire19;
  wire [(4'hd):(1'h0)] wire17;
  reg [(5'h13):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg31 = (1'h0);
  reg [(2'h3):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg29 = (1'h0);
  reg [(4'hd):(1'h0)] reg25 = (1'h0);
  reg [(4'he):(1'h0)] reg24 = (1'h0);
  reg [(4'he):(1'h0)] reg23 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg18 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire28,
                 wire27,
                 wire26,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire17,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg25,
                 reg24,
                 reg23,
                 reg18,
                 (1'h0)};
  assign wire17 = ((~^($signed(wire13) ?
                          (((8'ha0) ? wire13 : wire16) * (&wire16)) : wire13)) ?
                      ($unsigned(wire16[(4'hc):(4'hc)]) >> (+($signed((8'haf)) > $unsigned((8'hb2))))) : {{$signed(wire15[(4'hf):(1'h1)]),
                              (~|wire16[(3'h7):(3'h6)])}});
  always
    @(posedge clk) begin
      reg18 <= ({($unsigned((wire16 << wire15)) <<< $unsigned($unsigned(wire13))),
              wire14[(4'ha):(4'h9)]} ?
          wire14[(3'h4):(2'h3)] : $unsigned($signed((&(~wire15)))));
    end
  assign wire19 = wire16[(4'hb):(3'h5)];
  assign wire20 = $signed((((~^wire17) + wire15[(4'hb):(1'h0)]) << wire16[(3'h7):(3'h4)]));
  assign wire21 = (-wire14);
  assign wire22 = $unsigned($signed($signed(((reg18 ?
                      wire15 : (8'ha9)) << (wire19 >= (8'hab))))));
  always
    @(posedge clk) begin
      reg23 <= wire13;
      reg24 <= ($unsigned((((reg23 + reg18) == (^~wire16)) ~^ reg23)) ?
          wire15[(4'h9):(1'h0)] : ((((wire16 && (8'hb3)) * (+(8'ha3))) ?
                  reg18[(3'h6):(3'h5)] : (&wire16)) ?
              {(wire21[(1'h1):(1'h1)] ^~ reg18[(1'h1):(1'h1)]),
                  {$signed(reg18)}} : $unsigned(reg23[(4'ha):(1'h1)])));
      reg25 <= $unsigned(reg23[(4'hc):(4'hc)]);
    end
  assign wire26 = wire16;
  assign wire27 = $unsigned($unsigned($signed((wire14 ?
                      (^~reg24) : (wire21 ? wire17 : wire14)))));
  assign wire28 = (~^reg23);
  always
    @(posedge clk) begin
      reg29 <= {$unsigned(wire27),
          (($unsigned($signed(reg23)) <<< wire15[(3'h6):(2'h2)]) || {(~|(wire13 <<< wire14))})};
      reg30 <= $signed(wire26);
      if (((~&$unsigned(($signed(wire14) >>> $signed(reg29)))) ?
          $unsigned(wire26) : (((!{wire26, wire15}) ? (8'hb2) : (!(~^wire27))) ?
              wire28 : $unsigned(reg23))))
        begin
          reg31 <= $unsigned(wire28[(4'h9):(3'h4)]);
        end
      else
        begin
          if (((~^(-((&wire22) * (wire27 <= wire15)))) == (~^(&$unsigned($signed((8'hb8)))))))
            begin
              reg31 <= (((^~(wire28[(4'hb):(4'h9)] ?
                          wire17[(3'h5):(2'h3)] : $signed(wire13))) ?
                      $unsigned($signed(wire15[(2'h2):(2'h2)])) : (~^$signed((^~reg25)))) ?
                  $signed({wire19[(1'h1):(1'h0)],
                      $signed((wire16 >= reg29))}) : (wire28[(4'h9):(4'h9)] ?
                      (((^~reg25) * wire13) ?
                          ((wire15 > wire13) >> (!reg30)) : {reg31[(3'h6):(2'h2)],
                              wire21[(3'h6):(3'h5)]}) : wire20[(2'h2):(1'h1)]));
            end
          else
            begin
              reg31 <= $unsigned(wire13[(3'h5):(1'h1)]);
              reg32 <= (reg25 >>> (({reg29[(2'h3):(2'h3)]} ?
                  $signed(wire13[(1'h1):(1'h0)]) : wire14[(3'h6):(1'h0)]) * $unsigned((wire13 ^ wire17[(2'h3):(1'h1)]))));
            end
        end
    end
  assign wire33 = (wire22 ? $signed(reg32[(5'h13):(1'h0)]) : wire17);
  assign wire34 = $signed((((-wire16) + (8'ha9)) <<< wire13[(2'h3):(1'h1)]));
  assign wire35 = ((8'hb3) >>> ((^~reg24) ?
                      reg25[(4'h9):(3'h4)] : ({reg18} > wire26[(1'h1):(1'h1)])));
  assign wire36 = $signed((!{reg31[(3'h4):(2'h3)], wire14}));
  assign wire37 = ($unsigned({wire34,
                      ((~&reg29) ? (8'hb3) : wire14)}) & wire28[(4'hf):(4'hf)]);
  assign wire38 = ($unsigned((($signed(wire14) ?
                          ((7'h44) ? wire35 : reg31) : $signed(wire17)) ?
                      (&wire20) : ((+wire37) ?
                          (wire19 ?
                              wire16 : wire37) : (+wire33)))) || (|(((|reg30) ?
                      $unsigned(reg30) : (-(8'haa))) ^~ $signed($signed(wire13)))));
  assign wire39 = (^~($unsigned($unsigned(wire27)) ?
                      reg18 : $unsigned(wire15[(3'h4):(1'h0)])));
  assign wire40 = ({{(wire17[(2'h3):(1'h1)] ^ (^reg23)), (7'h43)}} ?
                      ($signed((((8'hbd) ?
                              wire20 : reg32) != $unsigned(wire36))) ?
                          $unsigned(((~^reg18) ?
                              (~reg18) : (wire22 >>> reg25))) : ((wire16[(1'h1):(1'h0)] ?
                                  $signed(reg31) : reg18) ?
                              reg18 : $signed(reg23[(4'he):(3'h4)]))) : wire39[(1'h0):(1'h0)]);
  assign wire41 = ((|wire27[(2'h2):(1'h1)]) ^~ $unsigned((!reg29)));
endmodule
