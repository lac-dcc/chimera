module top
#(parameter param136 = {((|(((8'hbe) && (8'hbb)) ? (-(8'hb1)) : ((8'ha4) ? (8'h9e) : (8'haf)))) ^~ ((!{(8'h9e), (8'hbf)}) ~^ ((~&(8'hb3)) ? ((8'haf) >> (8'h9d)) : ((8'ha8) ? (8'ha7) : (8'hbc))))), (~|(((|(8'hb2)) ? ((8'ha4) ? (8'hb2) : (8'hbd)) : (+(8'hb6))) <<< ((&(7'h41)) ? ((7'h43) ? (8'ha1) : (7'h41)) : ((7'h43) <= (7'h44)))))}, 
parameter param137 = ((((^~{param136}) < {(param136 ? param136 : param136)}) ? (({param136} ? (param136 ? param136 : param136) : (param136 - param136)) ? param136 : param136) : (param136 != (-{param136, (8'haf)}))) ? {param136} : (~^(((param136 + param136) ^~ param136) ? {(8'had), param136} : param136))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1d1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire4;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire135;
  wire signed [(3'h5):(1'h0)] wire133;
  wire signed [(5'h10):(1'h0)] wire63;
  wire signed [(4'he):(1'h0)] wire62;
  wire signed [(5'h12):(1'h0)] wire61;
  wire signed [(4'hf):(1'h0)] wire27;
  wire signed [(3'h7):(1'h0)] wire26;
  wire [(2'h3):(1'h0)] wire25;
  wire [(5'h14):(1'h0)] wire24;
  wire signed [(4'hd):(1'h0)] wire22;
  reg signed [(5'h10):(1'h0)] reg28 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg29 = (1'h0);
  reg [(5'h14):(1'h0)] reg30 = (1'h0);
  reg signed [(4'he):(1'h0)] reg31 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg32 = (1'h0);
  reg [(2'h2):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg35 = (1'h0);
  reg [(3'h7):(1'h0)] reg36 = (1'h0);
  reg [(4'hb):(1'h0)] reg37 = (1'h0);
  reg [(2'h3):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg39 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg40 = (1'h0);
  reg [(4'hf):(1'h0)] reg41 = (1'h0);
  reg [(4'h8):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg43 = (1'h0);
  reg [(3'h4):(1'h0)] reg44 = (1'h0);
  reg [(2'h2):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg46 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg47 = (1'h0);
  reg [(3'h5):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg50 = (1'h0);
  reg [(4'hb):(1'h0)] reg51 = (1'h0);
  reg [(2'h2):(1'h0)] reg52 = (1'h0);
  reg [(4'ha):(1'h0)] reg53 = (1'h0);
  reg [(5'h11):(1'h0)] reg54 = (1'h0);
  reg [(3'h4):(1'h0)] reg55 = (1'h0);
  reg [(5'h11):(1'h0)] reg56 = (1'h0);
  reg [(4'h9):(1'h0)] reg57 = (1'h0);
  reg [(5'h10):(1'h0)] reg58 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg59 = (1'h0);
  reg signed [(4'he):(1'h0)] reg60 = (1'h0);
  assign y = {wire135,
                 wire133,
                 wire63,
                 wire62,
                 wire61,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire22,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 (1'h0)};
  module5 #() modinst23 (wire22, clk, wire2, wire3, wire0, wire1);
  assign wire24 = (wire3[(4'hd):(4'ha)] & ((8'h9c) ?
                      wire22[(2'h3):(2'h2)] : (~|wire3[(2'h2):(1'h1)])));
  assign wire25 = (($unsigned($signed((7'h41))) > $signed($signed((wire3 ?
                      wire2 : wire1)))) || wire22[(4'hd):(2'h2)]);
  assign wire26 = ({(wire25[(1'h0):(1'h0)] != ((~|wire4) ?
                              {wire22, wire4} : $unsigned(wire25))),
                          (-wire0[(4'hc):(1'h0)])} ?
                      (~&(!({(8'hb1),
                          wire3} ~^ wire24[(2'h2):(2'h2)]))) : (~wire3[(3'h7):(3'h6)]));
  assign wire27 = $unsigned(($signed($signed($signed((8'ha9)))) < ({$unsigned(wire24)} >>> {$unsigned(wire26),
                      (wire22 && wire0)})));
  always
    @(posedge clk) begin
      if ({($signed($signed(wire4[(3'h7):(2'h2)])) ?
              (^{(wire26 ? wire3 : wire26)}) : $signed({wire3[(3'h5):(1'h0)],
                  {wire2, wire27}})),
          ((wire22[(2'h2):(1'h1)] ?
              $signed(wire3[(5'h13):(2'h2)]) : {wire27}) == {((wire0 ?
                      wire24 : wire26) ?
                  wire0 : ((8'haa) << wire27)),
              ($signed(wire25) ? wire25 : (-wire22))})})
        begin
          if (wire1)
            begin
              reg28 <= wire26[(2'h3):(1'h1)];
              reg29 <= $unsigned(wire4);
              reg30 <= ($signed(wire24[(4'hc):(4'ha)]) >> ((+{(|wire26)}) * ($unsigned({wire3}) ?
                  wire3[(5'h11):(4'ha)] : $unsigned($unsigned(wire2)))));
              reg31 <= wire25[(1'h1):(1'h1)];
              reg32 <= wire27[(4'h8):(3'h5)];
            end
          else
            begin
              reg28 <= wire4;
            end
          if ($signed((($signed((reg30 ? wire26 : wire1)) ?
                  wire27[(3'h6):(1'h1)] : (8'ha4)) ?
              reg29[(1'h0):(1'h0)] : wire3)))
            begin
              reg33 <= (({(^{reg31, wire3}),
                      $unsigned((wire0 ^ wire26))} < (((wire3 ?
                              wire27 : reg28) ?
                          ((8'ha6) ? wire4 : wire1) : wire24[(3'h6):(3'h5)]) ?
                      (|((8'hb3) ?
                          wire27 : (8'ha0))) : $unsigned($unsigned(reg31)))) ?
                  $unsigned(wire26[(2'h3):(2'h3)]) : reg30);
              reg34 <= $signed(($signed((|(wire4 ? wire3 : wire0))) ?
                  (8'hb4) : $unsigned($signed((~|wire26)))));
              reg35 <= reg33;
              reg36 <= {{reg30[(4'h9):(2'h3)],
                      (~$signed((reg34 ? reg34 : (8'hac))))},
                  ((reg32 & {$unsigned(wire3), (~reg31)}) ?
                      $signed((reg28 >> wire26)) : wire3[(2'h3):(2'h3)])};
              reg37 <= $signed((8'hb5));
            end
          else
            begin
              reg33 <= wire1[(4'h8):(2'h2)];
              reg34 <= reg35[(2'h2):(1'h0)];
              reg35 <= reg36;
            end
          reg38 <= reg34;
        end
      else
        begin
          reg28 <= reg36;
          reg29 <= (~&wire1[(3'h7):(2'h2)]);
          reg30 <= wire2[(2'h2):(2'h2)];
          if (reg36[(1'h1):(1'h1)])
            begin
              reg31 <= ({$unsigned((~reg37)), reg29} ?
                  $unsigned(($signed((wire22 ? wire25 : wire1)) ?
                      ((-wire1) ^~ (~wire25)) : (^reg38))) : $signed((wire2 ?
                      {reg38,
                          (reg35 ? reg38 : wire2)} : reg31[(3'h4):(2'h2)])));
              reg32 <= (reg28[(4'ha):(3'h6)] ^ ((((reg28 >> reg37) ?
                      $signed(reg31) : (wire1 ?
                          wire26 : wire4)) | $unsigned((reg36 ?
                      reg30 : wire0))) ?
                  wire2[(2'h2):(2'h2)] : ($unsigned($signed(reg35)) ?
                      (&(reg36 ? wire3 : reg37)) : reg30[(5'h11):(2'h2)])));
              reg33 <= $unsigned($signed((8'ha2)));
            end
          else
            begin
              reg31 <= reg33[(2'h2):(1'h1)];
              reg32 <= (8'hb9);
              reg33 <= {reg28[(4'h9):(3'h5)], (|(!{wire25, wire26}))};
              reg34 <= $unsigned($unsigned(($signed((reg35 ^~ (8'had))) ?
                  wire2[(3'h4):(2'h2)] : $signed(((8'hb0) || wire24)))));
            end
          reg35 <= $unsigned($unsigned(reg34[(2'h3):(2'h2)]));
        end
      if ((~^$unsigned($signed((reg29[(2'h3):(1'h0)] >>> reg32[(2'h2):(2'h2)])))))
        begin
          if (({reg38[(1'h1):(1'h1)]} ?
              reg35[(1'h1):(1'h1)] : ((reg30[(4'he):(4'hd)] >>> reg34[(4'hb):(2'h2)]) || ($unsigned(wire0[(1'h0):(1'h0)]) + $unsigned(reg35[(2'h2):(1'h0)])))))
            begin
              reg39 <= (^((~|((~&reg34) + (^reg35))) && $signed($signed((reg32 < wire1)))));
              reg40 <= ($signed(reg33) ^~ (~|wire3[(5'h12):(5'h11)]));
            end
          else
            begin
              reg39 <= $signed(reg28[(2'h3):(2'h3)]);
              reg40 <= ($signed((((~|reg40) ?
                      wire24[(2'h2):(1'h1)] : $unsigned((8'ha6))) ~^ (wire24[(5'h11):(3'h5)] ?
                      $unsigned(wire26) : reg32))) ?
                  ($signed(reg38) << reg36) : $unsigned((~|$unsigned($unsigned(reg36)))));
            end
          reg41 <= reg31[(3'h4):(2'h3)];
          reg42 <= wire4;
          reg43 <= $signed(reg33);
          reg44 <= ((^~((reg43 ? $unsigned(wire0) : (-reg28)) ^ wire3)) ?
              ((((reg43 >>> reg42) ^~ (wire2 == wire4)) << reg28) & $unsigned((^$signed(reg30)))) : ((($signed(wire24) ?
                  reg31 : wire2[(2'h2):(1'h1)]) ~^ wire2[(3'h5):(2'h3)]) <= ($signed(wire26[(1'h1):(1'h0)]) ?
                  (wire24[(4'hb):(2'h3)] > ((8'hbc) >>> wire4)) : reg43[(4'h9):(3'h5)])));
        end
      else
        begin
          reg39 <= ({reg28[(3'h4):(2'h3)], wire27[(2'h2):(2'h2)]} ?
              (&wire25) : {(^~$unsigned(reg37[(1'h1):(1'h0)]))});
          reg40 <= reg40[(4'h8):(3'h7)];
          reg41 <= wire26;
        end
      if (($signed({reg31[(1'h1):(1'h0)]}) ?
          $unsigned(wire24[(4'he):(2'h2)]) : reg30))
        begin
          if (($signed(reg39) ?
              reg36[(1'h0):(1'h0)] : $signed(wire26[(3'h4):(2'h2)])))
            begin
              reg45 <= wire27;
              reg46 <= ((~|(8'ha6)) == reg40[(1'h1):(1'h1)]);
            end
          else
            begin
              reg45 <= wire1;
              reg46 <= {reg40,
                  (~&({$signed(reg41)} ?
                      (reg43[(4'h8):(3'h5)] <<< (reg28 >>> (8'hb2))) : $signed((wire2 ?
                          wire0 : (8'hb7)))))};
              reg47 <= $unsigned({$unsigned($unsigned(wire1))});
              reg48 <= (({reg28[(3'h4):(1'h1)]} ?
                  (8'hb4) : $signed(wire4)) >> ($unsigned($signed((~|wire22))) ?
                  reg28 : reg29));
            end
          reg49 <= wire22;
          if (reg37[(3'h5):(2'h3)])
            begin
              reg50 <= reg35;
            end
          else
            begin
              reg50 <= reg42[(3'h7):(2'h2)];
              reg51 <= $signed((8'hb2));
              reg52 <= $signed((reg50 ?
                  $unsigned(reg39[(3'h5):(3'h4)]) : reg28));
            end
        end
      else
        begin
          reg45 <= ($signed(reg43) >>> reg30);
          reg46 <= ((wire27 ? reg50 : reg39[(4'hb):(4'ha)]) ?
              (~^(!{reg38[(1'h1):(1'h1)],
                  reg33[(1'h0):(1'h0)]})) : (&$signed((~(|wire0)))));
          reg47 <= reg42;
          if ((((&($signed((7'h40)) >= reg47)) ?
                  wire26 : (reg41[(4'hd):(4'hc)] << $signed(reg33))) ?
              (~|$signed($unsigned((reg34 ? reg47 : reg50)))) : reg38))
            begin
              reg48 <= $unsigned((-(-{reg33[(1'h1):(1'h0)],
                  ((8'haf) ? reg31 : reg40)})));
              reg49 <= $unsigned((^~$unsigned($signed({reg51}))));
            end
          else
            begin
              reg48 <= $signed(wire3);
              reg49 <= $signed(reg31);
              reg50 <= ((~|($unsigned($signed(reg48)) ?
                  {$signed((8'hb9))} : $unsigned((^wire3)))) >> (~&(reg32 + wire27[(3'h6):(3'h6)])));
              reg51 <= ($unsigned(wire4) > (reg28 <<< $unsigned(wire24)));
              reg52 <= reg29[(2'h2):(2'h2)];
            end
          reg53 <= {$signed((~$signed(wire25[(2'h3):(1'h0)]))),
              {(reg32 ? $unsigned((+(8'hb6))) : {((7'h41) - reg29), (7'h40)})}};
        end
      if ((~reg32[(2'h3):(2'h2)]))
        begin
          reg54 <= ($unsigned(($signed($unsigned(reg47)) ?
                  $unsigned({reg30}) : reg47[(3'h5):(3'h5)])) ?
              {(reg35 <<< (reg40 ? {reg43} : $unsigned((8'ha8)))),
                  {reg53[(4'h9):(4'h8)],
                      $unsigned(reg45)}} : reg34[(4'h8):(1'h1)]);
          reg55 <= ((&((|wire27) | (reg37 * $signed((8'h9d))))) ?
              (reg51[(3'h5):(3'h5)] ?
                  reg41[(1'h1):(1'h0)] : reg37) : ($signed(reg28) + ((wire1 ?
                      (wire27 ? wire27 : reg30) : $unsigned(reg44)) ?
                  (&$unsigned(reg33)) : $unsigned((wire2 ? reg42 : reg53)))));
          reg56 <= reg40;
          reg57 <= $signed({$unsigned((8'ha6))});
        end
      else
        begin
          reg54 <= ($signed((reg50[(1'h0):(1'h0)] ?
              {(wire0 == wire25),
                  (wire2 ?
                      reg34 : reg30)} : reg39[(1'h1):(1'h1)])) >= reg48[(3'h4):(1'h0)]);
          reg55 <= $unsigned(wire24[(4'hf):(3'h6)]);
          if (($signed($signed((reg29 || (reg56 << reg32)))) > ({(~&reg43),
                  reg38} ?
              $signed((reg57 << {(8'hbe)})) : wire1[(4'h8):(3'h7)])))
            begin
              reg56 <= ((wire3[(4'ha):(2'h2)] ~^ $signed($signed((wire24 ?
                      reg43 : wire27)))) ?
                  $unsigned($unsigned(((reg36 ? reg51 : reg46) ?
                      {reg57} : {reg44,
                          reg48}))) : ($signed((~$unsigned(reg39))) ?
                      $signed(wire25) : {(reg43[(2'h3):(1'h1)] ?
                              ((7'h40) ? reg38 : wire25) : $signed(reg51)),
                          ($signed((8'ha3)) >>> $unsigned(wire22))}));
            end
          else
            begin
              reg56 <= wire25[(2'h3):(1'h1)];
              reg57 <= (~&(reg41[(4'hf):(2'h2)] ?
                  $signed((+$unsigned(wire2))) : ((wire25 == (~^reg34)) ?
                      (reg42[(1'h1):(1'h0)] << (+wire25)) : $unsigned($signed(wire2)))));
              reg58 <= $unsigned(({((reg32 <<< reg52) ^~ $signed(wire22)),
                  reg31} ^~ ({$signed(reg42)} >= $unsigned((reg42 ?
                  reg31 : (8'hb4))))));
              reg59 <= (|reg37);
            end
          reg60 <= ($unsigned($signed((|{reg58,
              wire2}))) ^~ $signed(reg55[(2'h2):(1'h1)]));
        end
    end
  assign wire61 = ($signed(($signed($unsigned(reg31)) ?
                          wire3[(3'h5):(2'h3)] : {(reg54 ? reg41 : wire26),
                              reg45[(2'h2):(1'h0)]})) ?
                      (($unsigned(wire25) ?
                          $signed(reg32[(4'h9):(3'h5)]) : ($signed(reg32) ?
                              $unsigned(reg48) : ((8'hbd) <<< wire26))) | ($unsigned(reg42) >>> ({reg48} ?
                          $signed(reg53) : reg58[(3'h7):(3'h4)]))) : reg52[(1'h0):(1'h0)]);
  assign wire62 = reg34;
  assign wire63 = ({(^~$unsigned((^wire24))),
                          {($unsigned(reg38) ?
                                  (wire25 ? (8'ha9) : reg56) : reg51)}} ?
                      wire27 : reg33[(1'h1):(1'h0)]);
  module64 #() modinst134 (wire133, clk, reg31, reg50, reg35, wire63, wire24);
  assign wire135 = $signed(($unsigned(($signed(reg28) ?
                           $signed((8'hb6)) : reg33[(2'h2):(2'h2)])) ?
                       ((^~(reg30 ? reg45 : wire133)) ?
                           reg37 : $signed($signed(wire27))) : (^~(^~$signed((8'hb1))))));
endmodule

module module64
#(parameter param131 = ((((((7'h42) <= (8'hb5)) - ((8'ha2) >> (7'h43))) ? (((8'hbc) ? (8'ha8) : (8'h9f)) ^~ ((8'hbd) ? (8'ha2) : (8'hb6))) : (^(8'hb7))) >>> {(^((8'ha8) ? (8'hb5) : (8'h9c))), (^~((8'h9d) ^~ (7'h42)))}) <= (8'ha0)), 
parameter param132 = {(8'ha7)})
(y, clk, wire65, wire66, wire67, wire68, wire69);
  output wire [(32'ha8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire65;
  input wire signed [(3'h5):(1'h0)] wire66;
  input wire [(5'h14):(1'h0)] wire67;
  input wire signed [(4'hb):(1'h0)] wire68;
  input wire [(5'h11):(1'h0)] wire69;
  wire [(4'h9):(1'h0)] wire79;
  wire [(4'hb):(1'h0)] wire80;
  wire signed [(5'h15):(1'h0)] wire81;
  wire [(4'hf):(1'h0)] wire82;
  wire [(3'h7):(1'h0)] wire129;
  reg signed [(3'h7):(1'h0)] reg78 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg77 = (1'h0);
  reg signed [(4'he):(1'h0)] reg76 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg75 = (1'h0);
  reg [(5'h10):(1'h0)] reg74 = (1'h0);
  reg [(2'h3):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg71 = (1'h0);
  reg signed [(4'he):(1'h0)] reg70 = (1'h0);
  assign y = {wire79,
                 wire80,
                 wire81,
                 wire82,
                 wire129,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire67[(4'he):(1'h0)])
        begin
          reg70 <= (^wire69);
          reg71 <= ($unsigned({({wire68, wire68} >>> (8'hb4)),
                  (+(wire69 ? wire68 : wire66))}) ?
              (({$signed(reg70), (8'hb6)} ?
                      $signed($unsigned(wire66)) : wire68) ?
                  $unsigned($signed(wire66[(3'h4):(2'h3)])) : wire66[(3'h5):(3'h5)]) : (wire67[(3'h5):(1'h1)] && $signed(reg70)));
          reg72 <= $signed(wire66);
          if ($signed($signed((reg71 ?
              (wire65[(1'h1):(1'h0)] ?
                  $signed(wire67) : ((8'had) ?
                      (7'h43) : wire67)) : (reg72[(4'hd):(1'h1)] ?
                  $signed((8'ha1)) : (reg71 ? wire67 : (8'hae)))))))
            begin
              reg73 <= $signed(wire69[(3'h6):(3'h6)]);
              reg74 <= (8'h9d);
              reg75 <= (wire69 || (reg73 ?
                  $unsigned($unsigned((reg70 > wire69))) : $unsigned(wire69)));
              reg76 <= $signed((|$signed(((wire65 ? (8'hb9) : reg70) ?
                  $signed(wire67) : wire68))));
              reg77 <= reg71[(5'h11):(1'h1)];
            end
          else
            begin
              reg73 <= reg73;
              reg74 <= (~(!(^~$unsigned((~wire67)))));
              reg75 <= reg77;
            end
          reg78 <= $unsigned(wire67[(4'hc):(4'hc)]);
        end
      else
        begin
          reg70 <= reg74[(3'h4):(3'h4)];
          reg71 <= (~{(+$unsigned(wire67[(4'hc):(4'hb)])),
              ($unsigned($unsigned(reg74)) ?
                  $unsigned($signed(reg78)) : {(~^wire67)})});
          if (reg71)
            begin
              reg72 <= $signed(reg77[(3'h4):(1'h1)]);
              reg73 <= $unsigned(((wire65[(4'he):(3'h4)] ?
                  $signed($signed(wire69)) : ((reg78 ? wire65 : reg70) ?
                      $unsigned(wire67) : $signed(reg73))) * (^reg70[(4'h9):(2'h3)])));
              reg74 <= $signed((-((reg75 ?
                  $signed(reg70) : (wire66 == reg75)) | {((8'hb8) > (8'hb0)),
                  wire69[(1'h1):(1'h1)]})));
            end
          else
            begin
              reg72 <= reg70;
              reg73 <= ($signed(reg71[(4'h9):(3'h5)]) ?
                  (reg72[(4'hd):(3'h6)] << $unsigned($signed({wire69,
                      (8'hb4)}))) : ($signed($unsigned({reg77})) ?
                      (^wire68) : (+{reg75, (&reg75)})));
              reg74 <= (~$unsigned(reg74));
            end
          reg75 <= $signed(((wire69[(2'h2):(2'h2)] ?
                  (~wire66) : ($unsigned((8'ha2)) ?
                      wire69[(3'h7):(3'h5)] : reg76[(4'he):(4'h8)])) ?
              (((+(8'hab)) ~^ $unsigned(reg70)) * (|reg75)) : ((~^reg72) ?
                  (reg74 ?
                      (wire66 ~^ reg71) : (reg72 ? reg71 : (8'ha9))) : reg76)));
        end
    end
  assign wire79 = (reg76 ?
                      {reg78[(2'h3):(1'h1)]} : {reg76[(1'h1):(1'h0)],
                          (wire65 >>> {{reg76}})});
  assign wire80 = wire69[(2'h2):(2'h2)];
  assign wire81 = $signed((8'ha8));
  assign wire82 = $signed($unsigned((^~((~&(8'hb2)) && (~^(8'hac))))));
  module83 #() modinst130 (.clk(clk), .wire84(reg71), .wire88(wire65), .y(wire129), .wire86(reg73), .wire87(reg74), .wire85(reg78));
endmodule

module module5  (y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h77):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire9;
  input wire [(4'ha):(1'h0)] wire8;
  input wire signed [(4'hc):(1'h0)] wire7;
  input wire signed [(4'hf):(1'h0)] wire6;
  wire signed [(2'h2):(1'h0)] wire21;
  wire [(3'h7):(1'h0)] wire20;
  wire [(3'h5):(1'h0)] wire19;
  wire [(4'hb):(1'h0)] wire18;
  wire signed [(4'he):(1'h0)] wire16;
  wire [(4'h9):(1'h0)] wire15;
  reg signed [(4'hd):(1'h0)] reg17 = (1'h0);
  reg [(3'h4):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(4'hd):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg10 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire16,
                 wire15,
                 reg17,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($unsigned({($signed($unsigned(wire6)) | $unsigned({(8'hb0),
              wire7}))}))
        begin
          reg10 <= (8'ha0);
        end
      else
        begin
          reg10 <= $signed(wire6);
          if ($signed(reg10[(3'h4):(2'h2)]))
            begin
              reg11 <= (wire8[(1'h0):(1'h0)] <= $unsigned((~&wire9)));
              reg12 <= ($signed($signed($signed(reg10))) << wire7);
            end
          else
            begin
              reg11 <= {reg12,
                  $unsigned(((8'hb9) ?
                      $unsigned(reg10[(2'h3):(2'h3)]) : $unsigned($unsigned((8'had)))))};
              reg12 <= $signed(((|(((8'haf) == wire7) ?
                      (reg12 ? (8'hb6) : wire6) : $unsigned(reg10))) ?
                  $signed(wire8) : (~^$signed($signed(reg11)))));
              reg13 <= wire6;
            end
          reg14 <= ({$signed({wire9[(1'h0):(1'h0)],
                  reg10})} <= (~&(((wire6 >= reg13) ?
                  wire7[(2'h3):(2'h2)] : (!wire6)) ?
              ((|reg13) + wire9[(4'ha):(2'h2)]) : wire9)));
        end
    end
  assign wire15 = {wire9, reg12};
  assign wire16 = (($signed(reg11[(4'he):(4'he)]) - $signed($unsigned($signed(reg13)))) >> (^$unsigned((((8'hac) ?
                      (8'haa) : wire8) + (~&reg12)))));
  always
    @(posedge clk) begin
      reg17 <= ($signed($signed((8'hb6))) ?
          $unsigned(reg12[(1'h0):(1'h0)]) : ((^~wire6[(4'ha):(3'h5)]) ?
              {((reg13 == wire9) ? (!reg10) : (wire6 == (8'haf)))} : ((reg14 ?
                  (!reg13) : (reg11 + wire15)) | {reg12[(4'ha):(2'h3)]})));
    end
  assign wire18 = (wire8[(4'h9):(4'h9)] ~^ wire15);
  assign wire19 = (($unsigned((~&(wire9 ? wire6 : reg13))) ?
                          reg17 : ($signed((wire9 ? wire16 : reg13)) ?
                              ($unsigned(wire8) ?
                                  $unsigned(wire15) : wire8) : (|(~wire16)))) ?
                      wire9 : reg12[(4'h9):(3'h6)]);
  assign wire20 = wire18[(3'h4):(3'h4)];
  assign wire21 = $signed(reg14[(1'h1):(1'h0)]);
endmodule

module module83
#(parameter param127 = (~^(((!((7'h43) >= (8'hb4))) ? (((8'h9c) ? (8'hb5) : (8'hbb)) > ((8'hb4) | (8'h9d))) : {((8'hb1) <<< (7'h40)), ((8'ha4) - (8'hb6))}) & (({(8'hb4)} ~^ ((7'h42) ? (8'hbf) : (8'hb1))) ? {((8'h9d) ? (8'ha1) : (8'hb8))} : (~^{(8'h9e), (8'hb4)})))), 
parameter param128 = ((^~(param127 ? (-(~param127)) : {(param127 ? param127 : param127)})) ? ((param127 >= ((8'hbe) ? (8'ha7) : (param127 ^ (8'h9e)))) ? (&param127) : ({(param127 ? param127 : (8'ha2)), (param127 ? param127 : param127)} ? ((-(8'hb1)) ? (param127 ^ (8'h9e)) : param127) : param127)) : ((&(^~(^(8'hab)))) == (((~|param127) ? (param127 ? param127 : param127) : param127) != param127))))
(y, clk, wire88, wire87, wire86, wire85, wire84);
  output wire [(32'h1c0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire88;
  input wire signed [(3'h5):(1'h0)] wire87;
  input wire signed [(2'h3):(1'h0)] wire86;
  input wire [(3'h7):(1'h0)] wire85;
  input wire [(4'hc):(1'h0)] wire84;
  wire signed [(3'h6):(1'h0)] wire126;
  wire [(4'h9):(1'h0)] wire106;
  wire [(4'hb):(1'h0)] wire105;
  wire [(3'h6):(1'h0)] wire104;
  wire signed [(3'h4):(1'h0)] wire103;
  wire signed [(4'h8):(1'h0)] wire102;
  wire signed [(3'h4):(1'h0)] wire101;
  wire signed [(4'hb):(1'h0)] wire100;
  wire [(5'h10):(1'h0)] wire99;
  reg [(2'h2):(1'h0)] reg125 = (1'h0);
  reg [(4'hf):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg122 = (1'h0);
  reg [(5'h12):(1'h0)] reg121 = (1'h0);
  reg [(5'h12):(1'h0)] reg120 = (1'h0);
  reg [(4'hd):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg117 = (1'h0);
  reg [(3'h7):(1'h0)] reg116 = (1'h0);
  reg [(4'h9):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg113 = (1'h0);
  reg [(5'h13):(1'h0)] reg112 = (1'h0);
  reg [(4'hf):(1'h0)] reg111 = (1'h0);
  reg [(3'h5):(1'h0)] reg110 = (1'h0);
  reg [(5'h12):(1'h0)] reg109 = (1'h0);
  reg [(4'ha):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg98 = (1'h0);
  reg [(4'hc):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg96 = (1'h0);
  reg [(5'h14):(1'h0)] reg95 = (1'h0);
  reg [(2'h3):(1'h0)] reg94 = (1'h0);
  reg [(4'hd):(1'h0)] reg93 = (1'h0);
  reg [(3'h5):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg91 = (1'h0);
  reg [(5'h12):(1'h0)] reg90 = (1'h0);
  reg [(5'h13):(1'h0)] reg89 = (1'h0);
  assign y = {wire126,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg89 <= (-wire88[(2'h3):(1'h0)]);
      if ($signed(((~&($unsigned(wire88) ?
          wire84 : wire84)) <<< wire88[(2'h2):(1'h1)])))
        begin
          reg90 <= reg89;
        end
      else
        begin
          reg90 <= wire88[(1'h1):(1'h1)];
          if ($signed($signed((|((~|reg90) * $unsigned(wire87))))))
            begin
              reg91 <= reg89[(5'h11):(2'h3)];
              reg92 <= reg89[(2'h2):(1'h1)];
              reg93 <= (reg89[(1'h1):(1'h1)] ?
                  reg92[(3'h4):(3'h4)] : (reg89[(3'h7):(3'h5)] ?
                      (!reg89) : $signed(($signed(reg91) & wire84[(4'hc):(3'h6)]))));
              reg94 <= (8'h9d);
              reg95 <= (~|({($signed(reg90) >= (^reg89))} & (($signed(reg91) ?
                  ((8'hb6) ?
                      wire87 : wire84) : $signed(reg91)) <= {(-wire84)})));
            end
          else
            begin
              reg91 <= (^(&(((reg95 ~^ reg95) < (reg90 ?
                  reg95 : reg90)) || $unsigned($unsigned(reg91)))));
              reg92 <= (~^(~&$unsigned((~reg91))));
              reg93 <= ((~&$unsigned(({wire85, reg93} || (wire86 ^~ wire84)))) ?
                  reg93[(4'hb):(2'h2)] : wire84[(3'h6):(1'h0)]);
            end
        end
      reg96 <= wire86[(2'h2):(1'h1)];
      reg97 <= $unsigned((-wire87[(1'h1):(1'h0)]));
      reg98 <= reg92[(1'h0):(1'h0)];
    end
  assign wire99 = ($unsigned((wire86[(2'h3):(2'h2)] ^~ wire84)) ?
                      (^~(8'hb0)) : reg95[(3'h6):(2'h3)]);
  assign wire100 = wire86;
  assign wire101 = $unsigned(wire87[(1'h0):(1'h0)]);
  assign wire102 = (reg92[(3'h5):(3'h4)] >> ($unsigned($signed((reg96 * reg90))) == (~^$unsigned($signed(wire87)))));
  assign wire103 = (reg91 ? {(8'hb3), (8'hac)} : reg95[(5'h14):(5'h11)]);
  assign wire104 = $unsigned({($signed($signed((7'h40))) != $signed($unsigned(reg96)))});
  assign wire105 = wire101;
  assign wire106 = (reg97 <<< (^~$signed((~^(reg92 ? wire101 : reg91)))));
  always
    @(posedge clk) begin
      reg107 <= reg94[(2'h2):(1'h0)];
      if ({$signed($signed(reg98))})
        begin
          reg108 <= $unsigned(wire106);
          if ((!(|$signed($unsigned((wire104 ? reg95 : wire86))))))
            begin
              reg109 <= $signed({(7'h44)});
              reg110 <= (~|reg97);
              reg111 <= ({(($unsigned(wire101) ?
                      $unsigned(wire87) : wire104[(2'h2):(1'h0)]) ^ (|$signed(reg95))),
                  {{(reg107 ? reg107 : (8'hae)),
                          (wire102 < wire88)}}} == reg110[(3'h4):(1'h1)]);
              reg112 <= reg95;
            end
          else
            begin
              reg109 <= wire105[(4'ha):(3'h6)];
              reg110 <= reg107[(3'h4):(2'h3)];
              reg111 <= ((((7'h41) - wire88) ?
                  (~&((reg98 <= wire105) ?
                      (^reg98) : (wire104 <<< reg89))) : ($signed({(7'h42),
                          (8'hb5)}) ?
                      ($unsigned(reg96) < $unsigned(reg108)) : $signed(wire84))) ~^ $unsigned((!($signed((8'haa)) ?
                  (~^reg92) : ((8'hbb) ? wire106 : (7'h44))))));
            end
          if ((reg111 >>> ($unsigned($unsigned((reg94 && reg92))) ?
              (reg91[(5'h13):(3'h4)] ?
                  reg111[(4'hb):(3'h7)] : {reg90[(5'h10):(5'h10)],
                      wire106[(4'h8):(1'h0)]}) : wire84[(3'h5):(1'h1)])))
            begin
              reg113 <= wire102;
              reg114 <= $signed({($signed((wire84 ?
                      reg112 : reg98)) | (^~((8'hb5) ? wire85 : reg113))),
                  reg112[(4'he):(1'h1)]});
              reg115 <= (($signed(wire105) ?
                  reg93[(4'hc):(3'h5)] : (reg97 ?
                      $unsigned(wire85) : $unsigned($unsigned(wire85)))) * {wire106[(1'h0):(1'h0)],
                  (reg91 ?
                      ($signed(wire103) ?
                          $unsigned(reg112) : (8'hb2)) : reg114[(4'hd):(4'ha)])});
            end
          else
            begin
              reg113 <= $unsigned($unsigned(wire86));
              reg114 <= {reg96};
              reg115 <= $signed((wire102 ?
                  ($unsigned((wire87 ? reg90 : wire99)) != $unsigned((wire99 ?
                      reg91 : reg112))) : ($unsigned((reg110 ?
                          reg90 : wire87)) ?
                      (^~wire85) : wire86[(1'h1):(1'h1)])));
            end
          if (wire99[(2'h3):(2'h3)])
            begin
              reg116 <= {(reg115[(1'h0):(1'h0)] ?
                      ((~^(reg112 <<< wire102)) ?
                          $unsigned($unsigned(reg98)) : (8'hae)) : wire100[(4'h9):(4'h8)])};
              reg117 <= reg109;
            end
          else
            begin
              reg116 <= reg107;
              reg117 <= (!reg114);
              reg118 <= wire88;
              reg119 <= $unsigned(($unsigned(reg108[(3'h7):(3'h7)]) ?
                  reg89 : (&wire104)));
            end
          reg120 <= reg112;
        end
      else
        begin
          reg108 <= (((reg95[(5'h10):(4'ha)] < ((reg116 ~^ wire100) != wire101)) ?
              {(wire100 ?
                      $signed(reg109) : {reg90,
                          reg110})} : reg98) < (~^(($signed(reg119) ~^ (reg116 & reg93)) ?
              $signed((|(8'hbc))) : (-$signed(wire102)))));
          if (({($signed($signed(reg113)) >= (8'hb7))} || reg115))
            begin
              reg109 <= ($signed($signed(reg116[(3'h4):(3'h4)])) ?
                  ($unsigned(($signed(reg97) ?
                      (reg116 ?
                          reg117 : wire101) : reg119[(4'hc):(4'h9)])) ^ (((reg94 > (7'h41)) ?
                          reg91 : reg112[(5'h12):(1'h1)]) ?
                      {$signed(reg95)} : $unsigned({wire104}))) : (wire104 ?
                      wire87 : reg90));
            end
          else
            begin
              reg109 <= ((|reg115) ?
                  (-(((reg109 ? reg115 : reg96) ?
                          $unsigned((8'ha3)) : reg89[(5'h12):(4'hf)]) ?
                      $signed(((8'hbf) | wire100)) : wire87)) : $signed((((-wire84) ?
                      ((8'haf) | (8'h9d)) : reg112) - $signed((reg110 ?
                      (8'ha8) : (8'haa))))));
            end
          reg110 <= (-(((~&wire106[(3'h6):(3'h6)]) ?
                  (^wire84[(4'h8):(2'h3)]) : reg89) ?
              (~&($signed(reg95) ?
                  {reg93,
                      reg120} : (reg113 > reg97))) : ($unsigned(reg117[(2'h2):(2'h2)]) < $signed(wire106[(4'h8):(2'h2)]))));
          reg111 <= $signed(($unsigned(($unsigned(reg95) != $unsigned(reg113))) * wire105));
        end
      reg121 <= (wire87 ?
          $signed(wire105[(1'h0):(1'h0)]) : (reg92[(2'h3):(1'h1)] ?
              (($unsigned(reg116) ^~ (wire88 | (8'ha9))) ?
                  $unsigned($unsigned(reg110)) : (reg96[(1'h1):(1'h0)] ?
                      (~|(8'hb1)) : $signed(reg98))) : reg118));
    end
  always
    @(posedge clk) begin
      reg122 <= reg114;
      reg123 <= wire99;
      reg124 <= ($unsigned(reg123[(1'h1):(1'h0)]) ?
          ((!((~|wire103) ^~ (reg96 <<< (8'hb5)))) ?
              ($signed($unsigned(reg108)) ?
                  reg95[(4'hf):(2'h2)] : (wire85[(2'h3):(1'h1)] ?
                      reg110[(3'h5):(1'h0)] : (reg109 ?
                          reg92 : reg114))) : ((reg122[(3'h4):(3'h4)] || (~&wire87)) - (reg111 >= $signed(reg120)))) : $signed((reg89 <<< ((8'ha7) >>> $unsigned(wire105)))));
      reg125 <= ((&$signed((~^$signed(wire103)))) << ($signed({$signed(wire105),
          $signed(wire101)}) >>> ((!((8'hae) * reg92)) ?
          {(8'hb5)} : (~|(|wire102)))));
    end
  assign wire126 = ((reg95[(2'h2):(1'h0)] ? wire85 : reg118) ?
                       (+((~|reg113[(1'h1):(1'h1)]) ?
                           $unsigned((!reg107)) : reg123[(2'h2):(1'h1)])) : $signed((!$signed(reg110))));
endmodule
