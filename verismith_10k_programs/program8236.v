module top
#(parameter param91 = (^(~^(^(&(~&(8'ha3)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h57):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire0;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire4;
  wire signed [(5'h15):(1'h0)] wire5;
  wire signed [(5'h11):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire7;
  wire signed [(5'h10):(1'h0)] wire8;
  wire signed [(5'h10):(1'h0)] wire89;
  assign y = {wire5, wire6, wire7, wire8, wire89, (1'h0)};
  assign wire5 = (wire4 <= {{$signed(wire0[(2'h3):(1'h0)])},
                     ($signed({wire0}) >= ((wire1 ?
                         (7'h41) : (8'hba)) ^ $unsigned(wire0)))});
  assign wire6 = wire5;
  assign wire7 = $unsigned($unsigned(($unsigned(((8'hbe) ?
                     wire3 : wire1)) >= $signed((!wire2)))));
  assign wire8 = wire1;
  module9 #() modinst90 (wire89, clk, wire8, wire6, wire3, wire1, wire7);
endmodule

module module9  (y, clk, wire10, wire11, wire12, wire13, wire14);
  output wire [(32'h66):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire10;
  input wire [(4'hd):(1'h0)] wire11;
  input wire [(5'h10):(1'h0)] wire12;
  input wire signed [(4'hf):(1'h0)] wire13;
  input wire signed [(5'h10):(1'h0)] wire14;
  wire signed [(4'h9):(1'h0)] wire88;
  wire signed [(4'ha):(1'h0)] wire87;
  wire signed [(4'h8):(1'h0)] wire86;
  wire [(4'hc):(1'h0)] wire85;
  wire signed [(5'h12):(1'h0)] wire84;
  wire [(5'h14):(1'h0)] wire83;
  wire signed [(4'hb):(1'h0)] wire15;
  wire signed [(4'hd):(1'h0)] wire81;
  assign y = {wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire15,
                 wire81,
                 (1'h0)};
  assign wire15 = {$signed($signed($signed(wire11)))};
  module16 #() modinst82 (wire81, clk, wire13, wire12, wire10, wire11, wire14);
  assign wire83 = wire11[(4'hd):(4'hd)];
  assign wire84 = (~wire10[(1'h1):(1'h0)]);
  assign wire85 = wire81[(1'h0):(1'h0)];
  assign wire86 = ($signed((wire12[(2'h3):(1'h1)] ?
                          wire10[(4'h8):(3'h5)] : wire15)) ?
                      {wire85[(2'h2):(1'h0)],
                          (~&$signed((wire11 ?
                              wire15 : (8'hbc))))} : (^((^~$signed(wire12)) < (wire84[(5'h10):(4'ha)] ?
                          $signed(wire12) : $signed(wire12)))));
  assign wire87 = $unsigned((wire12 ?
                      $unsigned({wire13, (^~wire15)}) : $signed(wire84)));
  assign wire88 = (((((wire12 ? wire13 : wire13) ?
                              (~^wire81) : (wire83 ^ wire81)) != (~|(wire87 ?
                              wire81 : (8'hbe)))) ?
                          (^~({wire84} >>> (wire11 != wire14))) : (((&wire83) ?
                              ((8'hb6) ?
                                  wire85 : wire87) : $signed(wire87)) < $unsigned(wire13))) ?
                      $unsigned((($signed(wire13) - ((8'ha4) ?
                              wire86 : wire11)) ?
                          ($unsigned(wire84) && wire87[(2'h2):(1'h1)]) : $unsigned({wire81,
                              wire81}))) : wire81[(1'h0):(1'h0)]);
endmodule

module module16  (y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'h291):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire21;
  input wire [(5'h10):(1'h0)] wire20;
  input wire [(3'h5):(1'h0)] wire19;
  input wire signed [(4'hd):(1'h0)] wire18;
  input wire [(4'ha):(1'h0)] wire17;
  wire signed [(4'h9):(1'h0)] wire80;
  wire [(4'h8):(1'h0)] wire79;
  wire signed [(5'h12):(1'h0)] wire78;
  wire signed [(5'h12):(1'h0)] wire77;
  wire signed [(5'h15):(1'h0)] wire76;
  wire signed [(4'h8):(1'h0)] wire75;
  wire [(4'hc):(1'h0)] wire74;
  wire signed [(4'hc):(1'h0)] wire73;
  wire signed [(2'h3):(1'h0)] wire72;
  wire [(2'h3):(1'h0)] wire71;
  wire signed [(4'ha):(1'h0)] wire70;
  wire [(3'h6):(1'h0)] wire26;
  wire [(4'hd):(1'h0)] wire25;
  wire signed [(4'ha):(1'h0)] wire24;
  wire [(4'h8):(1'h0)] wire23;
  wire signed [(4'hc):(1'h0)] wire22;
  reg [(4'hb):(1'h0)] reg69 = (1'h0);
  reg [(4'he):(1'h0)] reg68 = (1'h0);
  reg [(3'h5):(1'h0)] reg67 = (1'h0);
  reg [(4'hc):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg63 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg61 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg60 = (1'h0);
  reg [(4'hd):(1'h0)] reg59 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg57 = (1'h0);
  reg [(4'hd):(1'h0)] reg56 = (1'h0);
  reg [(4'h8):(1'h0)] reg55 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg53 = (1'h0);
  reg [(5'h11):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg48 = (1'h0);
  reg [(5'h15):(1'h0)] reg47 = (1'h0);
  reg [(4'he):(1'h0)] reg46 = (1'h0);
  reg [(4'h8):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg44 = (1'h0);
  reg [(5'h10):(1'h0)] reg43 = (1'h0);
  reg [(4'hc):(1'h0)] reg42 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg41 = (1'h0);
  reg [(3'h7):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg39 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg36 = (1'h0);
  reg [(5'h13):(1'h0)] reg35 = (1'h0);
  reg [(4'hb):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg31 = (1'h0);
  reg [(4'ha):(1'h0)] reg30 = (1'h0);
  reg [(4'hb):(1'h0)] reg29 = (1'h0);
  reg [(3'h6):(1'h0)] reg28 = (1'h0);
  reg signed [(4'he):(1'h0)] reg27 = (1'h0);
  assign y = {wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
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
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 (1'h0)};
  assign wire22 = (~^wire21);
  assign wire23 = ($signed({wire17[(1'h1):(1'h1)], (^~$unsigned(wire17))}) ?
                      wire18[(4'hd):(2'h3)] : $signed((^~(~|(+wire18)))));
  assign wire24 = wire18;
  assign wire25 = ({wire23} ?
                      wire23[(1'h0):(1'h0)] : {$signed((|(wire23 ?
                              wire20 : wire18))),
                          {wire22[(4'hc):(1'h1)], (!$unsigned(wire18))}});
  assign wire26 = wire19;
  always
    @(posedge clk) begin
      if (wire26[(3'h4):(1'h0)])
        begin
          reg27 <= $unsigned(wire19[(1'h1):(1'h1)]);
          reg28 <= wire17[(3'h6):(1'h1)];
          if (wire23[(2'h3):(1'h1)])
            begin
              reg29 <= (^~$signed(($unsigned((wire21 ? wire25 : (8'ha3))) ?
                  wire26[(1'h1):(1'h1)] : (8'haf))));
              reg30 <= $signed(((wire17[(1'h1):(1'h1)] ?
                      ($signed((8'ha3)) < wire23[(2'h2):(2'h2)]) : $unsigned(wire20[(4'hc):(2'h2)])) ?
                  wire19 : $unsigned($signed(((8'hbd) ? wire19 : wire18)))));
              reg31 <= reg29;
              reg32 <= reg30[(4'ha):(1'h1)];
              reg33 <= (^~wire26);
            end
          else
            begin
              reg29 <= wire25[(3'h7):(1'h1)];
              reg30 <= reg31[(2'h3):(1'h0)];
              reg31 <= reg30;
            end
          reg34 <= wire21;
        end
      else
        begin
          reg27 <= (~^$signed(({(wire20 ? wire23 : (8'hb0)), (~|(8'ha3))} ?
              ((-reg27) * (~&(8'hbd))) : $signed(((8'ha8) ?
                  wire19 : wire19)))));
          if (reg31)
            begin
              reg28 <= ($unsigned(((~(reg28 ^ reg29)) || $unsigned($unsigned(wire17)))) ?
                  ((^($signed(wire17) == $unsigned(wire17))) ^ reg32) : $signed(((8'hab) ?
                      (~^(reg30 >>> wire17)) : (+{(8'hb8), wire21}))));
              reg29 <= ($signed($unsigned(((wire19 * (8'haa)) < (&wire20)))) ?
                  wire26 : $signed(($unsigned((reg28 ? wire18 : wire22)) ?
                      (8'h9d) : (reg32[(3'h6):(3'h4)] ?
                          wire25[(4'ha):(3'h5)] : wire20))));
              reg30 <= (!($unsigned((^$signed((8'ha5)))) ?
                  ((+(wire25 ? wire21 : reg32)) ?
                      (^{(8'ha2),
                          wire19}) : (|$signed(wire23))) : (+$unsigned(wire23[(1'h1):(1'h0)]))));
            end
          else
            begin
              reg28 <= reg27;
              reg29 <= (|((^$signed($signed(reg31))) ?
                  (~^($unsigned(reg34) ^ $signed(wire22))) : $signed((reg34 ?
                      {reg30, (8'hae)} : wire25[(4'hd):(1'h1)]))));
              reg30 <= reg29;
            end
          if (reg33[(2'h2):(1'h1)])
            begin
              reg31 <= $unsigned(wire22);
              reg32 <= {(($signed(wire23) << ((reg27 - reg32) << $signed(wire22))) ?
                      wire22 : $signed((7'h41))),
                  ((($signed(reg27) <= wire25[(1'h1):(1'h1)]) <= wire22) ?
                      $signed($unsigned({wire20})) : (reg29[(1'h1):(1'h0)] ?
                          $unsigned((!(8'hbf))) : $unsigned((wire17 ?
                              wire20 : wire22))))};
              reg33 <= ($signed((^~(~$signed(reg31)))) | $signed(reg28));
            end
          else
            begin
              reg31 <= (((!$unsigned(reg34[(1'h1):(1'h0)])) | $unsigned($signed((~^wire26)))) || (+(wire21 ?
                  wire24 : reg27)));
              reg32 <= reg32;
            end
          reg34 <= ({(($unsigned(reg31) ?
                      $signed(reg28) : ((8'ha3) ?
                          (8'ha8) : reg32)) < ({wire23} ?
                      $unsigned((8'ha2)) : $signed(reg33)))} ?
              ($signed(wire20[(4'hb):(4'ha)]) ?
                  (wire20[(1'h0):(1'h0)] ?
                      $unsigned(reg30[(3'h5):(2'h2)]) : (8'h9e)) : (reg28[(1'h1):(1'h1)] || {{(8'ha6)}})) : (({$unsigned(wire20),
                          (wire24 >> reg29)} ?
                      reg30 : (~(reg34 ^~ reg30))) ?
                  (&(wire17[(4'ha):(1'h0)] > (reg33 < reg33))) : $unsigned($signed(reg33))));
          reg35 <= {(reg27 ?
                  wire22[(4'ha):(3'h7)] : (^~($unsigned(wire25) ?
                      (reg28 && wire25) : wire19))),
              {wire23[(1'h1):(1'h1)],
                  (+((wire26 > wire23) ^~ $signed(reg29)))}};
        end
      if ((^~(&({wire26[(3'h4):(1'h1)]} ~^ {(wire25 ? wire21 : wire26)}))))
        begin
          reg36 <= $unsigned($unsigned($unsigned((!(wire22 && wire23)))));
          reg37 <= (|wire26);
          reg38 <= (^~(wire21 | ($unsigned(((8'hbe) ~^ wire19)) ?
              (+((8'hbf) ? wire22 : wire17)) : reg30[(4'ha):(3'h7)])));
        end
      else
        begin
          reg36 <= (((^$unsigned($unsigned(wire17))) * wire17) ?
              ($signed((~^(!reg34))) ?
                  $unsigned({reg37,
                      ((8'hb1) ?
                          wire19 : wire26)}) : (-(|((8'hb4) <= reg29)))) : ((8'ha3) != (~{$unsigned((8'hbf)),
                  {wire20, (8'hb0)}})));
          if (reg36)
            begin
              reg37 <= $unsigned({wire24, $unsigned($signed((8'hbe)))});
              reg38 <= {$unsigned({({wire24, reg31} > (8'ha3)),
                      $signed({wire20, reg37})}),
                  (reg32[(3'h7):(3'h4)] ?
                      reg35 : (reg36 ?
                          ((reg30 - wire23) - ((8'ha0) ?
                              reg29 : wire25)) : reg28))};
            end
          else
            begin
              reg37 <= reg32;
              reg38 <= (~|(($signed((wire25 ~^ reg33)) < {reg28[(2'h3):(1'h0)],
                  ((8'ha5) | reg32)}) >= ($unsigned(wire20[(4'hd):(4'hc)]) ?
                  {$signed(wire18),
                      reg31[(1'h1):(1'h1)]} : {wire23[(2'h2):(1'h0)]})));
            end
          reg39 <= ($unsigned((~^(wire21 << (wire21 ? reg35 : wire23)))) ?
              $unsigned($signed(((wire19 || (8'ha2)) ?
                  wire22 : wire26[(3'h5):(2'h2)]))) : wire17);
          reg40 <= (7'h40);
        end
      reg41 <= (+$unsigned($signed(((^~wire19) ?
          (8'hb1) : {(8'hbe), wire18}))));
      reg42 <= $signed($unsigned(reg34[(3'h6):(1'h1)]));
    end
  always
    @(posedge clk) begin
      reg43 <= (|$signed(($signed($signed(reg36)) >> (8'hb5))));
      reg44 <= reg42[(3'h5):(2'h2)];
      reg45 <= $signed({$unsigned((wire17[(3'h6):(3'h6)] ?
              $unsigned(reg29) : $signed((8'ha7))))});
      reg46 <= (reg37[(4'h9):(3'h6)] ~^ (reg43 ?
          wire23 : ((reg28[(1'h1):(1'h1)] ?
              (-(7'h43)) : $unsigned(reg34)) < $signed($signed((7'h43))))));
    end
  always
    @(posedge clk) begin
      reg47 <= $unsigned((8'hbc));
      if ($unsigned((7'h43)))
        begin
          reg48 <= {((((reg35 * reg29) ? (reg32 >>> reg40) : wire26) ?
                  (&(~&reg36)) : ((wire20 | reg43) ?
                      {reg32, reg36} : reg43)) ^ (~$signed({reg32, (8'hb3)})))};
          reg49 <= $unsigned((reg44[(2'h3):(2'h3)] <<< wire21[(3'h4):(1'h0)]));
          reg50 <= reg46[(1'h1):(1'h1)];
        end
      else
        begin
          if ($unsigned(($unsigned(((wire23 ?
                  reg29 : reg46) & $signed(reg48))) ?
              (((~reg36) ?
                  $unsigned(reg38) : (+reg38)) << reg34[(4'h8):(1'h0)]) : (-($signed(reg31) ?
                  (-reg50) : {reg31})))))
            begin
              reg48 <= {(8'h9c),
                  ($signed(($signed(wire20) ?
                      (|(8'hbc)) : (^~(8'hae)))) - (reg37[(2'h3):(1'h0)] ?
                      (7'h42) : reg36))};
              reg49 <= ($unsigned({{$unsigned(reg42)}, $unsigned(wire23)}) ?
                  {(wire19[(3'h4):(3'h4)] ?
                          reg45[(3'h4):(2'h3)] : (~&(|(8'ha1)))),
                      (7'h44)} : $unsigned((^{(reg47 ~^ reg32),
                      (reg49 == reg27)})));
              reg50 <= $signed($unsigned(($unsigned($signed(reg38)) ?
                  (!(reg35 && wire21)) : reg41[(1'h1):(1'h0)])));
            end
          else
            begin
              reg48 <= (((~((reg45 > wire18) >= (^wire20))) * reg31[(2'h2):(1'h1)]) - (reg46[(4'ha):(2'h2)] ?
                  reg32 : $unsigned($unsigned($signed((8'hae))))));
              reg49 <= wire23;
              reg50 <= reg48[(1'h1):(1'h0)];
            end
          reg51 <= (^~($unsigned($signed(wire23[(3'h7):(1'h0)])) ?
              (8'had) : (reg48 * ({reg30, reg33} && (-(7'h43))))));
          if ($signed($signed($unsigned(reg32))))
            begin
              reg52 <= (|$unsigned(reg28[(2'h3):(1'h0)]));
              reg53 <= ($signed($signed(($signed((7'h41)) >= $unsigned(reg50)))) * reg39);
              reg54 <= (^~((wire18 ?
                      $signed($unsigned(reg39)) : $signed(reg46)) ?
                  $unsigned((^wire22[(3'h7):(3'h7)])) : (^reg44)));
            end
          else
            begin
              reg52 <= reg30[(3'h7):(3'h5)];
            end
        end
    end
  always
    @(posedge clk) begin
      if ($signed((~(8'hb5))))
        begin
          if (reg27)
            begin
              reg55 <= (({{(|wire20)}} ?
                      (($signed(reg49) > reg28) ~^ ({reg44,
                          wire25} >>> reg35)) : wire24[(2'h3):(2'h3)]) ?
                  $unsigned($unsigned({$unsigned(reg52),
                      reg45})) : $signed($signed(reg54)));
              reg56 <= $signed(reg42);
              reg57 <= $signed((&(reg45 | ({reg34} ?
                  (wire25 ? wire21 : reg55) : $signed(reg42)))));
            end
          else
            begin
              reg55 <= (({reg42} ?
                      (reg52 != reg43) : $signed((~reg57[(4'hf):(3'h6)]))) ?
                  (|(wire23[(3'h4):(2'h3)] ?
                      ((~&reg34) ?
                          $unsigned((8'hb0)) : wire23[(3'h4):(3'h4)]) : ($signed(reg47) ?
                          (~^reg32) : {(8'hbb),
                              (8'hb9)}))) : (reg32[(3'h4):(2'h3)] ?
                      reg29[(1'h0):(1'h0)] : $signed((8'hb3))));
            end
          if (((((^~$unsigned(wire18)) ?
                      (((8'hb9) ? (7'h41) : reg27) ?
                          $signed(reg39) : {(8'hb2)}) : wire24) ?
                  ((reg45[(3'h5):(1'h1)] ? reg50[(1'h0):(1'h0)] : (&reg55)) ?
                      {reg29} : reg57) : ((!(~&reg47)) >= (reg49 - {reg29,
                      (7'h43)}))) ?
              reg27 : ((((!(7'h44)) ? (!wire25) : $unsigned((8'ha1))) ?
                  {(wire25 >= wire20),
                      (-reg33)} : wire24[(3'h7):(2'h2)]) == $signed({reg33[(2'h2):(1'h1)]}))))
            begin
              reg58 <= wire24;
              reg59 <= {({$unsigned({reg54, reg51}),
                          ($unsigned(wire21) ^ (~^wire18))} ?
                      $signed($signed($unsigned(reg36))) : {reg53[(4'hb):(4'h9)],
                          ((reg54 && reg42) + (+reg29))})};
            end
          else
            begin
              reg58 <= $signed((&$signed(((~wire19) ?
                  reg36 : (wire22 ? wire21 : reg38)))));
              reg59 <= (wire17[(2'h2):(1'h0)] ?
                  ({$signed($unsigned(wire19))} ~^ $signed((~^wire23[(3'h5):(1'h0)]))) : (reg39 <<< ($unsigned((reg42 ?
                      (8'hb9) : reg42)) - ((reg48 ^~ reg30) >> reg34))));
              reg60 <= ({reg39[(4'hc):(4'ha)]} < $unsigned((-$signed($signed(reg41)))));
              reg61 <= $unsigned((reg49[(4'ha):(3'h4)] ?
                  (((reg57 | reg46) >= (wire21 != (8'ha1))) > ((~^reg35) >>> (reg30 >>> (8'hba)))) : $signed(reg48)));
            end
          reg62 <= $unsigned((|(8'hab)));
          reg63 <= wire19;
        end
      else
        begin
          reg55 <= $unsigned((~&(reg31[(2'h3):(1'h0)] ~^ $signed((wire20 ?
              reg29 : (8'hba))))));
          if (reg29[(2'h3):(1'h0)])
            begin
              reg56 <= reg37;
              reg57 <= ($signed(($signed((~&reg40)) ?
                      (~{reg41, (8'hbb)}) : reg52[(4'hd):(4'hc)])) ?
                  (($unsigned((^reg60)) ?
                      (8'ha1) : reg32) >> ($unsigned(((8'hb5) ?
                      reg39 : reg45)) & (reg51[(3'h6):(1'h0)] ?
                      (wire18 || reg29) : reg57[(3'h4):(2'h3)]))) : ($unsigned((((8'ha5) ?
                          reg31 : reg46) ?
                      $signed(reg29) : $signed(wire25))) <= $signed($unsigned(wire22[(3'h5):(2'h3)]))));
              reg58 <= $signed(($signed(((^~wire22) << $unsigned(reg42))) ?
                  $unsigned((reg61 ? reg29 : $signed(reg43))) : (8'had)));
              reg59 <= ({(((reg31 << (8'ha8)) ?
                              reg55 : (reg47 ? reg37 : wire22)) ?
                          ((reg43 ?
                              wire25 : wire26) == reg60) : $signed($signed(reg46))),
                      (!$signed((wire24 ? reg60 : reg29)))} ?
                  ($unsigned((~$unsigned(reg45))) >> wire18[(4'ha):(1'h0)]) : (!(($signed(reg32) ?
                      $unsigned(reg40) : (reg30 ?
                          (8'hb1) : reg30)) == $unsigned(reg30[(3'h4):(1'h0)]))));
              reg60 <= $signed($unsigned($signed((reg59 ?
                  reg34[(1'h1):(1'h1)] : (8'h9c)))));
            end
          else
            begin
              reg56 <= $unsigned($unsigned(reg40));
              reg57 <= reg58[(1'h0):(1'h0)];
            end
          reg61 <= $signed({(^(((8'hbf) >= (8'h9d)) ?
                  $unsigned(reg54) : $signed(reg31)))});
          if ((({$unsigned($unsigned(reg60))} >= ($unsigned(((8'hb7) <<< reg57)) || {$unsigned(reg44),
              $signed(reg44)})) & reg54))
            begin
              reg62 <= ($unsigned(reg27[(4'ha):(1'h1)]) ?
                  ($unsigned(((reg42 ~^ reg38) ?
                      (^reg53) : reg44)) >= reg58) : $unsigned($unsigned($signed(reg41))));
              reg63 <= wire26[(3'h4):(2'h2)];
              reg64 <= (&reg58);
            end
          else
            begin
              reg62 <= (^$signed((~|$unsigned((reg39 ? reg63 : (7'h43))))));
              reg63 <= $unsigned(((&reg50[(1'h1):(1'h1)]) ?
                  (8'hac) : $signed($unsigned((wire17 ? reg43 : (8'h9d))))));
              reg64 <= (($signed($signed({reg60})) || reg45[(3'h5):(1'h0)]) <= $signed($unsigned($unsigned((-reg56)))));
              reg65 <= (~&$signed((reg41[(2'h2):(1'h1)] ~^ reg27[(3'h4):(2'h3)])));
            end
          reg66 <= ($signed(reg64[(4'h8):(4'h8)]) | reg40);
        end
      reg67 <= reg49;
      reg68 <= reg62[(3'h5):(3'h5)];
    end
  always
    @(posedge clk) begin
      reg69 <= reg53;
    end
  assign wire70 = (~$signed((~$signed($unsigned(wire19)))));
  assign wire71 = $unsigned(reg53);
  assign wire72 = reg63;
  assign wire73 = $signed(((wire23[(3'h7):(3'h5)] > ((&reg43) ^~ (~|reg52))) != ($signed((reg49 ?
                          reg67 : reg31)) ?
                      wire17 : reg68)));
  assign wire74 = $unsigned(((reg51[(3'h6):(1'h1)] ?
                          reg63[(3'h5):(3'h4)] : (~&$signed(reg55))) ?
                      (~wire73[(3'h7):(3'h4)]) : (!wire26[(3'h6):(2'h2)])));
  assign wire75 = ((~|reg61[(2'h3):(2'h3)]) <= reg57[(4'hc):(1'h1)]);
  assign wire76 = {$signed(reg37)};
  assign wire77 = ((($unsigned((wire70 || (8'h9e))) ?
                          reg66[(4'ha):(1'h0)] : reg69) >> ({reg52,
                              (reg47 + (8'hb6))} ?
                          ((reg36 | reg52) ? {reg31} : {(8'hbf)}) : wire24)) ?
                      (reg59[(2'h3):(2'h3)] && (&((reg58 ?
                          reg34 : reg46) & reg59))) : (~^wire22[(1'h1):(1'h0)]));
  assign wire78 = reg69[(3'h4):(2'h2)];
  assign wire79 = (^~{$unsigned($signed((reg49 < wire76))),
                      $signed(((^~reg30) | $unsigned(reg30)))});
  assign wire80 = reg57;
endmodule
