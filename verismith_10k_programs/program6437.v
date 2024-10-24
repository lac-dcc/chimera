module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1b5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire3;
  wire [(4'hf):(1'h0)] wire122;
  wire [(4'hb):(1'h0)] wire112;
  wire [(4'hc):(1'h0)] wire111;
  wire signed [(2'h3):(1'h0)] wire110;
  wire [(3'h4):(1'h0)] wire4;
  wire [(5'h10):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire19;
  wire [(5'h11):(1'h0)] wire21;
  wire [(5'h13):(1'h0)] wire22;
  wire signed [(4'hd):(1'h0)] wire23;
  wire signed [(4'he):(1'h0)] wire24;
  wire signed [(5'h14):(1'h0)] wire25;
  wire signed [(2'h3):(1'h0)] wire26;
  wire signed [(4'hc):(1'h0)] wire27;
  wire [(5'h13):(1'h0)] wire40;
  wire [(2'h3):(1'h0)] wire108;
  reg signed [(2'h3):(1'h0)] reg121 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg120 = (1'h0);
  reg [(5'h14):(1'h0)] reg119 = (1'h0);
  reg signed [(4'he):(1'h0)] reg118 = (1'h0);
  reg [(4'ha):(1'h0)] reg117 = (1'h0);
  reg [(3'h5):(1'h0)] reg116 = (1'h0);
  reg [(4'he):(1'h0)] reg115 = (1'h0);
  reg [(5'h15):(1'h0)] reg114 = (1'h0);
  reg [(3'h6):(1'h0)] reg113 = (1'h0);
  reg [(5'h13):(1'h0)] reg39 = (1'h0);
  reg [(5'h11):(1'h0)] reg38 = (1'h0);
  reg [(3'h4):(1'h0)] reg37 = (1'h0);
  reg [(5'h13):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg35 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg33 = (1'h0);
  reg [(2'h2):(1'h0)] reg32 = (1'h0);
  reg [(5'h12):(1'h0)] reg31 = (1'h0);
  reg [(4'hb):(1'h0)] reg30 = (1'h0);
  reg [(4'h8):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg28 = (1'h0);
  assign y = {wire122,
                 wire112,
                 wire111,
                 wire110,
                 wire4,
                 wire5,
                 wire19,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire25,
                 wire26,
                 wire27,
                 wire40,
                 wire108,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
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
                 (1'h0)};
  assign wire4 = {{wire3[(3'h4):(1'h0)]}};
  assign wire5 = $signed($signed($unsigned(($unsigned(wire2) ?
                     wire3[(1'h1):(1'h1)] : {(8'h9e), wire2}))));
  module6 #() modinst20 (.wire9(wire5), .clk(clk), .wire10(wire1), .wire7(wire0), .wire8(wire4), .y(wire19));
  assign wire21 = ((($unsigned((&wire4)) ?
                          $unsigned((wire1 << wire2)) : (~|(wire4 ?
                              (8'hb1) : wire0))) ?
                      $signed($signed((&wire1))) : ($unsigned(((8'hbf) >>> wire5)) ?
                          $unsigned((wire19 << wire1)) : (!wire5))) < $signed(wire4));
  assign wire22 = {(8'hb6)};
  assign wire23 = (wire3 <= wire4[(3'h4):(1'h1)]);
  assign wire24 = (-((^wire23[(4'h8):(3'h5)]) || $unsigned(((wire19 ?
                      wire22 : wire5) < (8'ha4)))));
  assign wire25 = (~^(~^{(|{wire5, wire5}), (|$unsigned(wire1))}));
  assign wire26 = ((^(wire5[(4'he):(3'h7)] ?
                          ($unsigned(wire3) ?
                              (wire3 <<< wire1) : (wire2 ?
                                  wire21 : wire24)) : wire5[(3'h6):(2'h3)])) ?
                      $unsigned($unsigned(((wire22 ~^ wire19) >> wire19[(2'h2):(1'h0)]))) : ((&(|{wire2})) == wire25[(1'h0):(1'h0)]));
  assign wire27 = {wire5, wire25};
  always
    @(posedge clk) begin
      reg28 <= (wire2 ?
          wire4[(2'h2):(2'h2)] : ($signed(((wire5 ^~ wire0) >>> (~wire0))) ?
              (&{(-wire3), wire0}) : wire19));
      if ($signed(wire2[(1'h1):(1'h1)]))
        begin
          if (wire0)
            begin
              reg29 <= {($signed($signed((wire2 ?
                      wire26 : (8'hb8)))) >> wire21)};
              reg30 <= ({$unsigned((8'ha9))} ~^ ({wire22[(4'h8):(4'h8)],
                      $unsigned((!wire21))} ?
                  {$unsigned((wire4 ? wire23 : (8'ha4))),
                      $signed(wire3)} : wire26));
              reg31 <= {(wire4[(3'h4):(1'h1)] * wire2)};
              reg32 <= (~&(reg31[(5'h10):(3'h5)] >> reg28));
              reg33 <= $signed($unsigned({$unsigned(reg32[(1'h0):(1'h0)])}));
            end
          else
            begin
              reg29 <= wire23;
              reg30 <= (|$unsigned($signed(((reg30 + wire2) ?
                  (8'ha0) : wire22))));
              reg31 <= {wire21};
              reg32 <= (wire27[(4'h9):(4'h8)] & ((!($unsigned((8'ha0)) * (8'hbe))) + $signed((~&wire0[(4'h8):(3'h7)]))));
            end
          if ($signed($unsigned($unsigned(((wire23 && wire25) ?
              (reg28 ? wire4 : wire1) : wire19)))))
            begin
              reg34 <= {$signed((~&reg28[(1'h1):(1'h1)])),
                  (wire21 || $unsigned($signed($unsigned(wire24))))};
              reg35 <= wire2[(2'h3):(2'h3)];
              reg36 <= wire27;
              reg37 <= (reg32[(1'h0):(1'h0)] ?
                  $signed((($signed(reg36) ?
                          (wire22 ? reg35 : reg36) : (wire0 ?
                              (8'hb2) : (7'h43))) ?
                      $signed((reg33 != reg29)) : ($signed(reg36) - {(8'h9e)}))) : ($signed(((wire23 && (8'h9f)) ^~ $unsigned((8'haf)))) ?
                      {wire5, (!(wire26 | reg36))} : $unsigned(reg36)));
              reg38 <= ({$signed((^~wire23[(1'h1):(1'h0)])), $signed(wire26)} ?
                  {$unsigned((~^((8'ha8) ? (8'hb6) : reg28))),
                      (~((^wire0) ?
                          (-(8'ha9)) : wire3))} : $signed($signed(((|reg33) ?
                      (wire0 ? (8'hbd) : wire23) : {reg30}))));
            end
          else
            begin
              reg34 <= wire19[(2'h2):(1'h1)];
              reg35 <= ((reg36[(3'h7):(3'h5)] ?
                  $unsigned($unsigned({wire2,
                      wire4})) : (wire4[(2'h3):(1'h1)] && ((~|(8'ha3)) > wire21))) ^ (^~wire1));
              reg36 <= reg29[(2'h2):(2'h2)];
              reg37 <= ((($unsigned(wire4[(1'h1):(1'h1)]) * wire21[(2'h3):(1'h1)]) <<< $signed((^~wire0[(3'h7):(1'h1)]))) ?
                  (wire26[(2'h2):(1'h1)] >= $unsigned(($signed(wire22) | reg38))) : ($unsigned(wire23) ?
                      (^{(wire2 ?
                              wire4 : wire27)}) : $unsigned({$unsigned(wire0)})));
              reg38 <= wire22;
            end
        end
      else
        begin
          reg29 <= ({$unsigned(({reg33} + wire21))} & (($signed((+wire5)) ~^ reg36[(1'h1):(1'h0)]) < reg38[(5'h11):(4'hb)]));
          reg30 <= $unsigned($unsigned((8'hbc)));
        end
      reg39 <= (!reg37[(2'h3):(2'h3)]);
    end
  assign wire40 = (^~$unsigned(wire2[(2'h3):(2'h3)]));
  module41 #() modinst109 (.wire46(wire22), .wire43(wire19), .wire45(wire21), .y(wire108), .wire44(wire27), .clk(clk), .wire42(wire25));
  assign wire110 = ((((^{wire40}) ?
                           (((7'h43) ? wire23 : reg28) ?
                               $unsigned((8'ha9)) : $unsigned(wire5)) : $unsigned($unsigned(wire3))) ?
                       $unsigned(wire19[(1'h1):(1'h1)]) : reg30) >>> reg34[(4'h8):(3'h6)]);
  assign wire111 = $unsigned($signed(wire23));
  assign wire112 = {reg35, $signed($signed((|$signed(wire40))))};
  always
    @(posedge clk) begin
      if ({reg38[(2'h2):(1'h0)], $signed({$signed($signed(wire40))})})
        begin
          if (($unsigned(((wire25 ? (^(8'hba)) : (^~reg39)) ?
              $signed($unsigned((7'h41))) : (8'ha1))) ^~ ($unsigned((~|$signed(wire110))) ?
              (8'hb2) : $signed(wire24[(4'h9):(2'h3)]))))
            begin
              reg113 <= (wire21[(4'hd):(4'hb)] ?
                  $unsigned(wire4) : ($unsigned(($signed(reg32) ?
                      reg29 : (~^wire3))) < $signed($signed($unsigned((8'hac))))));
              reg114 <= (8'ha4);
            end
          else
            begin
              reg113 <= (8'hbf);
              reg114 <= (~|(&wire111));
              reg115 <= wire22[(4'hc):(4'ha)];
            end
          if (reg30)
            begin
              reg116 <= (wire19 ?
                  wire110 : $signed({wire27, {((8'h9e) ? wire27 : reg28)}}));
              reg117 <= $unsigned((wire21[(4'h8):(3'h4)] ?
                  (reg116[(3'h4):(2'h3)] ?
                      $unsigned(wire108) : (reg38 | (wire21 << reg39))) : {wire40[(5'h12):(5'h10)]}));
              reg118 <= ((~&wire110[(1'h0):(1'h0)]) ?
                  wire108[(2'h3):(1'h0)] : (reg29[(3'h4):(1'h1)] & {((wire19 != reg28) ?
                          (wire40 ? wire112 : (8'hb6)) : $unsigned(reg34))}));
            end
          else
            begin
              reg116 <= ((8'hb4) ^~ (~(~|$unsigned({wire112, reg31}))));
              reg117 <= wire2[(3'h5):(3'h5)];
              reg118 <= reg39[(5'h10):(1'h1)];
            end
          reg119 <= ((8'ha9) ^ ($unsigned($unsigned((wire27 >> (8'haf)))) * $unsigned(reg28[(1'h0):(1'h0)])));
          reg120 <= (^reg38[(4'hd):(2'h2)]);
        end
      else
        begin
          reg113 <= ((({$signed(reg32)} ?
              ((wire111 ? reg30 : wire22) || (wire24 ?
                  wire4 : wire2)) : ((wire108 || (8'ha1)) ?
                  reg28[(1'h1):(1'h0)] : (&wire108))) < $unsigned(reg119)) + (({((8'hac) + wire110)} ?
                  ((wire2 ? reg115 : reg114) == (^wire111)) : $signed((wire111 ?
                      reg114 : reg117))) ?
              reg119[(4'hc):(2'h2)] : (((wire27 ? reg39 : wire21) ?
                  reg30 : $signed((8'haa))) * (&(wire0 ? (8'haf) : wire108)))));
          if ((^(-wire1[(3'h6):(3'h4)])))
            begin
              reg114 <= reg115[(1'h1):(1'h0)];
              reg115 <= wire21[(4'hb):(2'h3)];
              reg116 <= $signed($unsigned($signed($signed(reg117))));
              reg117 <= {(8'hac)};
              reg118 <= (((((wire3 ~^ wire19) ?
                          (~&(8'hab)) : wire24[(4'hb):(2'h2)]) ?
                      wire5[(1'h1):(1'h0)] : $unsigned(wire27[(4'h8):(3'h5)])) && $signed(wire22[(2'h3):(2'h2)])) ?
                  {$signed(reg118),
                      $unsigned(($signed(reg36) << (+wire3)))} : $signed($signed(reg116[(3'h4):(2'h2)])));
            end
          else
            begin
              reg114 <= (8'hb9);
              reg115 <= (~^$unsigned((^~$unsigned(reg119))));
              reg116 <= reg30;
            end
        end
      reg121 <= $unsigned($unsigned((!(wire112[(3'h5):(1'h0)] ?
          (reg120 < wire25) : (^~reg38)))));
    end
  assign wire122 = $signed(wire112);
endmodule

module module41  (y, clk, wire42, wire43, wire44, wire45, wire46);
  output wire [(32'h132):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire42;
  input wire [(5'h15):(1'h0)] wire43;
  input wire [(4'hc):(1'h0)] wire44;
  input wire [(5'h11):(1'h0)] wire45;
  input wire [(5'h13):(1'h0)] wire46;
  wire signed [(5'h10):(1'h0)] wire107;
  wire [(5'h15):(1'h0)] wire47;
  wire signed [(4'hc):(1'h0)] wire48;
  wire signed [(5'h14):(1'h0)] wire51;
  wire signed [(5'h15):(1'h0)] wire52;
  wire [(4'hd):(1'h0)] wire53;
  wire [(4'ha):(1'h0)] wire57;
  wire signed [(4'hf):(1'h0)] wire97;
  reg [(5'h15):(1'h0)] reg106 = (1'h0);
  reg [(5'h14):(1'h0)] reg105 = (1'h0);
  reg [(2'h2):(1'h0)] reg104 = (1'h0);
  reg [(5'h14):(1'h0)] reg103 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg101 = (1'h0);
  reg [(4'ha):(1'h0)] reg100 = (1'h0);
  reg [(4'he):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg49 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg50 = (1'h0);
  reg [(2'h3):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg55 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg56 = (1'h0);
  reg [(3'h6):(1'h0)] reg58 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg59 = (1'h0);
  reg [(5'h12):(1'h0)] reg60 = (1'h0);
  reg [(3'h4):(1'h0)] reg61 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg62 = (1'h0);
  assign y = {wire107,
                 wire47,
                 wire48,
                 wire51,
                 wire52,
                 wire53,
                 wire57,
                 wire97,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg49,
                 reg50,
                 reg54,
                 reg55,
                 reg56,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 (1'h0)};
  assign wire47 = (wire46 ?
                      (($signed(wire43[(4'h8):(3'h6)]) + ((wire44 != (8'h9c)) ?
                          {wire44} : $unsigned((8'hb4)))) <= ($unsigned((7'h44)) ?
                          ($signed(wire42) ~^ wire46) : {wire46[(3'h6):(2'h2)],
                              (wire43 ?
                                  wire44 : wire43)})) : (^~(&(^((8'ha1) << wire42)))));
  assign wire48 = (($unsigned($unsigned($unsigned(wire44))) ?
                          $unsigned(wire47) : (($unsigned(wire46) ?
                                  wire45[(5'h10):(3'h7)] : (wire46 ?
                                      wire46 : wire44)) ?
                              ((wire42 ? wire46 : wire46) ?
                                  wire45[(4'hd):(4'h8)] : (wire42 >> wire43)) : wire47)) ?
                      ((~^{(!(8'hb7))}) ?
                          (+((^wire47) ?
                              $signed(wire43) : (wire47 ?
                                  (7'h44) : wire43))) : ((|$signed(wire46)) == (~^{wire46,
                              wire46}))) : $unsigned({wire45[(5'h11):(4'hd)],
                          ($signed((7'h41)) <= $unsigned(wire43))}));
  always
    @(posedge clk) begin
      reg49 <= wire44[(1'h1):(1'h1)];
      reg50 <= ($unsigned((wire45 == ((&wire48) >> (~reg49)))) ?
          (wire42 ?
              ($unsigned($signed(wire44)) ?
                  (reg49 ?
                      $unsigned(wire46) : $signed(wire46)) : $signed(wire47[(3'h6):(2'h2)])) : ({(wire47 ~^ wire47),
                  (reg49 ? wire44 : wire42)} >>> ($signed(wire44) * (wire46 ?
                  (8'h9e) : wire46)))) : {(~^(&(reg49 != wire47))),
              {$signed((~^reg49)), $unsigned((wire46 < (8'haa)))}});
    end
  assign wire51 = {wire45,
                      (wire43[(3'h6):(3'h4)] <<< $unsigned($unsigned({wire44})))};
  assign wire52 = wire42;
  assign wire53 = ((^($signed((wire47 + reg50)) >> ((~|(8'hbb)) ?
                          $unsigned(reg49) : ((8'hb7) ? wire51 : reg50)))) ?
                      ($unsigned(wire51) < (($signed(wire43) <<< wire47[(5'h10):(4'hb)]) <<< $signed(wire45))) : (reg50[(2'h2):(1'h0)] ?
                          ($unsigned($unsigned(wire52)) - $unsigned((wire44 ?
                              (8'hb0) : wire44))) : ({wire44,
                                  $unsigned(wire52)} ?
                              $signed((~&(8'hb2))) : (wire44[(1'h0):(1'h0)] ?
                                  $unsigned(wire51) : {wire46, wire45}))));
  always
    @(posedge clk) begin
      reg54 <= ($signed($unsigned(($signed(reg50) ?
              (reg50 ? reg50 : wire44) : (wire47 + wire46)))) ?
          (~(wire46 ?
              wire53[(1'h1):(1'h1)] : wire51)) : (wire43 >>> wire47[(4'he):(4'hd)]));
      reg55 <= wire45;
      reg56 <= (&(+((!{wire47}) ^~ $unsigned($unsigned(wire44)))));
    end
  assign wire57 = ({(wire53[(1'h1):(1'h1)] == reg55)} ?
                      ($unsigned(reg50) ?
                          $unsigned(($signed((8'hbe)) ?
                              wire47 : {wire42,
                                  wire51})) : reg54[(1'h1):(1'h0)]) : (reg49[(3'h6):(1'h1)] >>> wire48));
  always
    @(posedge clk) begin
      reg58 <= wire57;
    end
  always
    @(posedge clk) begin
      reg59 <= ($signed((+reg50)) - (^~(wire47 ?
          reg58[(1'h0):(1'h0)] : (reg56 ?
              (reg49 || wire53) : (wire44 >= wire52)))));
      reg60 <= (wire48 >>> ($signed($unsigned(wire53[(2'h2):(1'h1)])) >>> $signed(reg55[(1'h0):(1'h0)])));
      reg61 <= $signed($unsigned(((8'hba) - {reg56})));
      reg62 <= $unsigned((|wire42[(5'h12):(5'h12)]));
    end
  module63 #() modinst98 (wire97, clk, wire43, wire46, reg60, wire57);
  always
    @(posedge clk) begin
      if (((($signed((wire52 ?
          reg50 : wire45)) >>> wire45[(4'hc):(3'h7)]) >>> $unsigned($unsigned(wire42[(3'h7):(3'h5)]))) >= wire48[(4'ha):(2'h2)]))
        begin
          reg99 <= ((^wire47[(4'ha):(3'h6)]) < $signed($unsigned(reg49)));
          reg100 <= reg50;
          reg101 <= $unsigned($signed($signed(wire51[(2'h3):(1'h0)])));
          if (((!reg58[(3'h5):(3'h5)]) ?
              {((-(-(7'h41))) >> (wire52 ?
                      {reg54} : wire47[(5'h11):(4'hb)]))} : {$signed((wire51 ?
                      $signed(reg54) : (^~wire97)))}))
            begin
              reg102 <= $signed((&(reg50 ?
                  (&reg49[(3'h4):(3'h4)]) : reg54[(1'h0):(1'h0)])));
              reg103 <= $signed($signed(reg61[(2'h3):(2'h2)]));
              reg104 <= {$signed($signed((|reg58))), reg55[(2'h2):(2'h2)]};
              reg105 <= {(~$unsigned($unsigned({reg49})))};
            end
          else
            begin
              reg102 <= reg99;
            end
        end
      else
        begin
          reg99 <= ((-reg101[(1'h0):(1'h0)]) * $signed((8'hb6)));
        end
    end
  always
    @(posedge clk) begin
      reg106 <= ((reg54[(1'h1):(1'h1)] ?
              $unsigned({wire46}) : (^($unsigned((8'ha8)) << $unsigned(wire44)))) ?
          reg49 : (~&$signed(((~|(8'ha0)) && (wire57 == reg61)))));
    end
  assign wire107 = $unsigned(($signed((~(wire47 ?
                       reg99 : reg99))) >>> {$signed(reg50),
                       wire44[(3'h4):(3'h4)]}));
endmodule

module module6
#(parameter param17 = ({((((8'hb1) ? (8'ha5) : (8'ha9)) ? (|(8'ha5)) : (^(8'hb1))) | (~^((8'h9d) ? (8'hb5) : (8'ha8)))), ({((8'h9f) == (8'ha0))} ? ((&(8'ha2)) <= ((7'h41) ? (8'hac) : (7'h44))) : (((8'ha2) ? (8'had) : (8'ha2)) ? (|(8'hb0)) : (~|(8'hbb))))} ? (7'h40) : {(((!(8'hbb)) ^~ ((7'h41) != (8'ha6))) ? (((7'h40) ? (8'ha7) : (8'hbd)) ? {(8'hbf)} : {(8'hb3)}) : (+((8'hae) ? (8'ha3) : (8'hb8))))}), 
parameter param18 = (((param17 ? (((8'ha2) > param17) ? (-param17) : (-(8'ha8))) : ((-param17) << param17)) * param17) << ((+{(param17 - param17)}) > ((param17 ? (param17 ? param17 : (8'h9f)) : param17) ? (!(~&param17)) : (|(8'h9d))))))
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h2b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire10;
  input wire [(5'h10):(1'h0)] wire9;
  input wire signed [(3'h4):(1'h0)] wire8;
  input wire [(4'hf):(1'h0)] wire7;
  wire [(3'h6):(1'h0)] wire16;
  wire signed [(4'hc):(1'h0)] wire15;
  wire [(2'h3):(1'h0)] wire14;
  wire signed [(3'h6):(1'h0)] wire13;
  wire [(2'h3):(1'h0)] wire12;
  wire [(4'hc):(1'h0)] wire11;
  assign y = {wire16, wire15, wire14, wire13, wire12, wire11, (1'h0)};
  assign wire11 = ($signed(wire8) >= ((|wire7) ?
                      ((~&wire10) && (~|wire7)) : $signed(({wire9} << (wire10 | wire9)))));
  assign wire12 = ($signed(wire10[(4'hb):(2'h2)]) ?
                      (+($unsigned(wire8) ~^ ($signed(wire9) ?
                          $signed((8'hbf)) : $unsigned(wire11)))) : {{$unsigned(wire8[(2'h2):(2'h2)]),
                              $signed({wire9, wire7})},
                          (^($unsigned(wire11) ~^ (wire8 >= wire7)))});
  assign wire13 = $unsigned({$unsigned($signed((wire7 <= (8'hae))))});
  assign wire14 = wire12;
  assign wire15 = $signed(wire8[(1'h0):(1'h0)]);
  assign wire16 = ((((wire13 >= $unsigned(wire15)) ?
                          wire12[(1'h1):(1'h1)] : $unsigned(wire8)) >>> $unsigned((~|{wire7,
                          wire14}))) ?
                      $unsigned($unsigned(((wire13 ?
                          wire10 : (8'hb2)) <= (wire9 ?
                          wire8 : wire10)))) : (~|(((~wire13) ?
                          {wire11} : wire9) <<< $unsigned($unsigned(wire7)))));
endmodule

module module63  (y, clk, wire67, wire66, wire65, wire64);
  output wire [(32'h16d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire67;
  input wire [(5'h13):(1'h0)] wire66;
  input wire signed [(5'h12):(1'h0)] wire65;
  input wire [(4'ha):(1'h0)] wire64;
  wire [(5'h13):(1'h0)] wire96;
  wire [(4'h9):(1'h0)] wire95;
  wire [(4'hf):(1'h0)] wire94;
  wire [(4'h9):(1'h0)] wire93;
  wire signed [(5'h14):(1'h0)] wire92;
  wire [(4'he):(1'h0)] wire89;
  wire signed [(4'hc):(1'h0)] wire88;
  wire signed [(4'h9):(1'h0)] wire86;
  wire [(4'ha):(1'h0)] wire85;
  wire [(3'h5):(1'h0)] wire84;
  wire signed [(5'h15):(1'h0)] wire83;
  wire signed [(4'hf):(1'h0)] wire82;
  wire [(5'h12):(1'h0)] wire81;
  wire signed [(4'h9):(1'h0)] wire80;
  wire signed [(5'h10):(1'h0)] wire79;
  wire [(3'h5):(1'h0)] wire78;
  wire [(5'h13):(1'h0)] wire71;
  wire [(5'h11):(1'h0)] wire70;
  wire [(5'h12):(1'h0)] wire69;
  wire [(3'h5):(1'h0)] wire68;
  reg signed [(4'hc):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg77 = (1'h0);
  reg signed [(4'he):(1'h0)] reg76 = (1'h0);
  reg [(4'h8):(1'h0)] reg75 = (1'h0);
  reg [(4'h8):(1'h0)] reg74 = (1'h0);
  reg [(3'h7):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg72 = (1'h0);
  assign y = {wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire89,
                 wire88,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 reg91,
                 reg90,
                 reg87,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 (1'h0)};
  assign wire68 = ((wire67[(4'ha):(1'h1)] + wire67[(4'hc):(4'hc)]) >= $signed(wire67));
  assign wire69 = wire65[(5'h10):(2'h3)];
  assign wire70 = ((-$unsigned((wire65 ?
                      $unsigned(wire67) : {wire66,
                          wire65}))) ^ wire68[(3'h4):(2'h2)]);
  assign wire71 = (wire66 ? $signed((8'hbb)) : wire64[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg72 <= $unsigned((wire65 != ($signed((wire67 ? (8'ha8) : wire70)) ?
          (7'h40) : (wire66[(2'h3):(1'h1)] >= wire67))));
      reg73 <= wire69[(2'h2):(2'h2)];
      if ((+wire64))
        begin
          if (reg72[(1'h1):(1'h1)])
            begin
              reg74 <= $signed(((((^reg72) && $unsigned(reg73)) ?
                      ($signed(reg73) ?
                          (wire67 ?
                              reg73 : (7'h40)) : (-wire66)) : $signed($unsigned(wire66))) ?
                  {$signed(wire71[(4'h8):(3'h6)])} : {({wire65, wire70} ?
                          (wire71 ^~ wire65) : (|wire66)),
                      $signed((reg72 + wire65))}));
              reg75 <= ($unsigned(((reg74 == {wire66}) ?
                      ($signed(reg72) ?
                          $signed(wire69) : (^wire70)) : wire64)) ?
                  $unsigned(wire71) : (wire68[(1'h1):(1'h0)] ?
                      (&($signed(wire68) ?
                          reg72 : (wire68 ?
                              wire64 : wire71))) : $unsigned(wire71)));
              reg76 <= {$unsigned((reg73 ?
                      ((wire69 ? (8'hbc) : wire68) ?
                          (reg75 ?
                              reg72 : wire66) : reg72[(3'h4):(3'h4)]) : (^~(wire67 == (8'hae)))))};
            end
          else
            begin
              reg74 <= reg73;
              reg75 <= (~^($unsigned((~^((8'hb9) == wire71))) * wire66));
              reg76 <= (reg76 ? wire68[(2'h2):(2'h2)] : $signed(wire64));
            end
        end
      else
        begin
          reg74 <= ($unsigned(wire70) ?
              ((wire67 << ({reg72} ^ (8'had))) ?
                  $unsigned(reg75) : reg72[(3'h4):(3'h4)]) : $unsigned(wire69[(4'hd):(4'ha)]));
          reg75 <= $signed(wire64);
          reg76 <= (~wire67[(3'h4):(1'h0)]);
        end
      reg77 <= $unsigned($unsigned(((~&wire67[(3'h5):(3'h5)]) ?
          (~&(reg76 ? wire67 : (7'h44))) : (~^$signed(wire68)))));
    end
  assign wire78 = ((^(wire69[(4'hd):(4'h9)] ?
                      ((&wire68) ?
                          ((8'ha1) ? reg74 : wire67) : (reg75 ?
                              reg77 : reg72)) : ($signed(reg75) ?
                          $signed((8'hba)) : $signed(wire69)))) < ($signed($unsigned(wire66[(3'h4):(3'h4)])) < ((&(reg74 ?
                          wire71 : wire64)) ?
                      wire69 : (wire71[(4'hb):(3'h6)] ?
                          $signed(reg76) : $unsigned(reg74)))));
  assign wire79 = (~&((wire69[(3'h4):(1'h0)] ?
                          ((reg76 ? wire71 : reg72) << {wire70,
                              reg72}) : (~^(reg75 == reg77))) ?
                      reg72[(1'h0):(1'h0)] : $signed(wire71)));
  assign wire80 = wire71;
  assign wire81 = {wire71[(3'h5):(2'h2)]};
  assign wire82 = ((wire80 ?
                      (|((~wire81) ~^ {reg76})) : wire69[(5'h11):(4'hf)]) != wire71[(1'h1):(1'h1)]);
  assign wire83 = (~|wire81);
  assign wire84 = $signed((wire71[(4'ha):(4'h8)] >= (($unsigned(wire82) ?
                          $unsigned(wire81) : (wire79 >>> reg77)) ?
                      $signed((wire71 ? wire67 : reg72)) : ((reg72 ?
                              wire78 : wire68) ?
                          (^wire78) : $signed(wire83)))));
  assign wire85 = $signed(({{$unsigned((8'hb8)), (^~reg76)}} ^~ wire82));
  assign wire86 = $unsigned($unsigned((wire85[(2'h2):(1'h1)] <<< ($unsigned(wire68) < (wire67 >> reg73)))));
  always
    @(posedge clk) begin
      reg87 <= (((wire83 != (&reg74)) * ((^~(wire80 ?
          reg73 : wire68)) * (~^{reg77, wire80}))) + wire66);
    end
  assign wire88 = (((~$unsigned((reg77 ?
                      reg75 : wire68))) >>> (8'h9d)) - (reg87[(5'h10):(3'h7)] ?
                      ($unsigned((~^wire69)) ?
                          ((wire83 ? reg87 : wire71) ?
                              {(8'hab),
                                  (8'ha7)} : (wire86 + wire69)) : reg75) : wire78));
  assign wire89 = $signed(reg77);
  always
    @(posedge clk) begin
      reg90 <= $signed(($unsigned(({reg87} ?
              (^reg72) : (reg87 ? (8'hb2) : (8'ha4)))) ?
          wire67 : wire81));
      reg91 <= {wire89[(4'he):(4'he)]};
    end
  assign wire92 = $signed(wire71);
  assign wire93 = $signed((wire80[(2'h3):(2'h3)] ?
                      wire71[(3'h5):(3'h4)] : ((reg75[(1'h1):(1'h1)] ?
                              (8'ha4) : $signed(reg73)) ?
                          $signed((!reg77)) : (~&wire80[(2'h3):(2'h2)]))));
  assign wire94 = (~(((~|$signed(wire85)) == $signed((!wire88))) ~^ {reg87[(3'h6):(3'h4)],
                      $unsigned(reg75[(2'h2):(1'h0)])}));
  assign wire95 = wire88[(3'h5):(3'h5)];
  assign wire96 = (((~((wire79 ? reg77 : wire86) ? wire65 : $signed(wire81))) ?
                      $unsigned(reg87) : reg75[(3'h4):(2'h2)]) != wire64);
endmodule
