module top
#(parameter param67 = ({({(~^(7'h44))} ? ((!(7'h42)) ? (&(8'ha9)) : ((8'hbd) & (8'hb8))) : ((~|(8'hbf)) * (~^(7'h43)))), ((~&((8'ha1) || (7'h43))) > (((8'hbc) ^ (8'hbb)) ? ((8'hb0) ? (8'h9e) : (8'h9f)) : (8'ha6)))} || (~&(+{((8'ha5) ? (8'had) : (8'ha7))}))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h14f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire0;
  input wire [(3'h5):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire3;
  wire signed [(2'h2):(1'h0)] wire66;
  wire [(5'h14):(1'h0)] wire52;
  wire [(4'hd):(1'h0)] wire51;
  wire signed [(5'h10):(1'h0)] wire50;
  wire signed [(5'h14):(1'h0)] wire49;
  wire signed [(4'h8):(1'h0)] wire48;
  wire signed [(3'h6):(1'h0)] wire47;
  wire signed [(3'h7):(1'h0)] wire46;
  wire [(3'h6):(1'h0)] wire45;
  wire signed [(4'h9):(1'h0)] wire44;
  wire [(4'hd):(1'h0)] wire43;
  wire [(2'h3):(1'h0)] wire42;
  wire [(2'h2):(1'h0)] wire4;
  wire signed [(5'h12):(1'h0)] wire5;
  wire [(4'ha):(1'h0)] wire40;
  reg signed [(4'he):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg63 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg59 = (1'h0);
  reg [(4'hb):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg57 = (1'h0);
  reg [(4'he):(1'h0)] reg56 = (1'h0);
  reg [(4'hf):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg53 = (1'h0);
  reg [(4'hf):(1'h0)] reg6 = (1'h0);
  reg [(5'h15):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg8 = (1'h0);
  assign y = {wire66,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire4,
                 wire5,
                 wire40,
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
                 reg6,
                 reg7,
                 reg8,
                 (1'h0)};
  assign wire4 = (+(wire2[(4'h8):(1'h1)] ? wire0 : wire0));
  assign wire5 = wire4[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if (($unsigned(wire1[(2'h2):(1'h0)]) >> ($unsigned({$unsigned(wire5),
              (wire5 * (7'h43))}) ?
          $unsigned(wire5) : wire3)))
        begin
          reg6 <= wire2;
          reg7 <= {reg6};
        end
      else
        begin
          reg6 <= (~reg6);
          reg7 <= (wire1 ^~ (({$signed(wire4), $unsigned((8'hae))} ?
              $unsigned($signed(wire2)) : wire0) || ({$signed(wire1),
                  $unsigned(wire0)} ?
              wire2[(3'h4):(3'h4)] : ((wire5 == wire2) ^ $unsigned((8'haf))))));
        end
      reg8 <= $signed($unsigned((~&(8'hbd))));
    end
  module9 #() modinst41 (wire40, clk, wire4, wire5, reg8, wire3);
  assign wire42 = reg8[(1'h0):(1'h0)];
  assign wire43 = $unsigned($unsigned(reg7));
  assign wire44 = $unsigned(wire43[(4'hd):(1'h0)]);
  assign wire45 = wire3[(3'h5):(1'h0)];
  assign wire46 = wire1;
  assign wire47 = ($signed((~^$signed($unsigned((8'h9d))))) ?
                      (8'hb6) : {(+$unsigned(((8'ha5) ? wire0 : wire46)))});
  assign wire48 = (^~((~wire43) == wire3[(4'ha):(4'h9)]));
  assign wire49 = (~|(~^(wire40[(1'h1):(1'h1)] || (wire4[(2'h2):(1'h1)] ?
                      wire44[(3'h7):(3'h7)] : (~^reg8)))));
  assign wire50 = ((reg7 ?
                      (wire48 ?
                          (wire48[(3'h4):(1'h1)] & $unsigned(wire48)) : ({reg7,
                                  wire48} ?
                              wire1[(1'h0):(1'h0)] : $signed(wire4))) : (~&wire45)) & $unsigned((~$signed($unsigned(wire49)))));
  assign wire51 = $unsigned(($unsigned(((reg6 >>> wire0) <= $signed(wire4))) ?
                      ((^~wire46) ?
                          ($signed(reg8) < wire5[(2'h2):(2'h2)]) : ((reg7 >>> wire49) ?
                              (wire49 >> wire5) : wire48)) : $signed($signed($unsigned(wire47)))));
  assign wire52 = (8'hb0);
  always
    @(posedge clk) begin
      if ((($signed(wire5[(1'h0):(1'h0)]) >> (!((wire47 ? wire42 : wire45) ?
              wire40 : (&wire44)))) ?
          ($unsigned((+wire4[(1'h0):(1'h0)])) ?
              $signed(wire45) : $signed(wire47)) : ($unsigned(wire2) ^~ $signed(((+wire50) == ((8'hba) ?
              wire45 : wire3))))))
        begin
          reg53 <= (8'ha5);
          reg54 <= ((&$signed(wire48[(4'h8):(1'h1)])) - $signed((wire52[(4'h9):(3'h5)] ?
              wire40[(2'h2):(1'h1)] : $signed((~^(8'hb9))))));
          reg55 <= ((((8'ha7) ^ wire40) ?
                  $signed(((wire42 == wire42) >= wire42)) : (reg7 ?
                      $signed($signed(wire5)) : (-(-wire45)))) ?
              $signed((|$signed($signed(wire51)))) : $signed({wire47[(1'h0):(1'h0)],
                  (wire52 - (reg6 ? wire47 : reg6))}));
        end
      else
        begin
          if ($unsigned({((~&wire1[(3'h5):(2'h3)]) - $signed(wire50[(2'h3):(2'h3)]))}))
            begin
              reg53 <= {((~($unsigned((8'hb0)) ?
                      (wire2 ^~ wire40) : {wire1,
                          wire2})) <= $unsigned($signed($signed(wire3))))};
              reg54 <= wire2;
            end
          else
            begin
              reg53 <= wire1[(1'h1):(1'h1)];
              reg54 <= $signed($signed($unsigned(wire4)));
              reg55 <= (&$unsigned($signed($unsigned(wire44[(4'h9):(3'h5)]))));
            end
          reg56 <= (((wire46[(3'h7):(1'h0)] ?
                      wire5 : ((8'hb0) == $unsigned(reg54))) ?
                  wire51[(4'hc):(4'h9)] : $unsigned((+reg7[(5'h15):(4'ha)]))) ?
              $signed({$unsigned((~&reg6))}) : (~wire0[(1'h1):(1'h0)]));
          reg57 <= (($signed($unsigned({reg54, (8'ha5)})) ?
                  ({wire0[(3'h4):(1'h1)], $unsigned(reg56)} ?
                      wire40[(1'h0):(1'h0)] : $signed($signed(wire49))) : (~(((8'hbb) ?
                          reg56 : wire40) ?
                      $signed(reg56) : (wire45 ? (8'hb7) : (8'had))))) ?
              ((($signed(wire47) ?
                      $unsigned(wire42) : wire47) & reg8[(4'hb):(2'h2)]) ?
                  (reg6 ?
                      {$signed(reg55),
                          $signed(wire46)} : (&wire0)) : ({wire48} ?
                      wire1[(3'h5):(3'h5)] : wire50[(4'h8):(2'h3)])) : wire48);
        end
      reg58 <= wire42;
      if ($unsigned((($signed($unsigned((8'hbf))) + reg55) ?
          ((wire1[(1'h1):(1'h0)] <= $unsigned(reg6)) ?
              (~^(wire43 ~^ wire47)) : ($unsigned(wire49) ?
                  (&wire50) : wire5[(1'h0):(1'h0)])) : (wire43[(1'h0):(1'h0)] ?
              (((8'ha9) - reg53) || (~&reg8)) : (wire48[(1'h1):(1'h0)] > wire52[(5'h14):(5'h11)])))))
        begin
          reg59 <= (reg55 ^~ reg55[(4'ha):(3'h6)]);
          reg60 <= reg6;
        end
      else
        begin
          if ($signed(((~|reg59[(3'h4):(1'h0)]) && ($signed((reg58 ^ wire43)) ?
              reg55[(4'hb):(3'h6)] : $unsigned(wire5[(5'h12):(3'h7)])))))
            begin
              reg59 <= ($unsigned(wire48) & ((wire5[(4'hf):(1'h1)] ?
                      reg54[(2'h2):(1'h0)] : $unsigned((reg55 ?
                          wire42 : wire51))) ?
                  ($unsigned(wire50[(3'h4):(1'h1)]) ~^ reg57) : (~|reg58[(4'ha):(1'h1)])));
              reg60 <= $unsigned(($unsigned($signed((^reg6))) >= wire4));
              reg61 <= reg7[(5'h15):(5'h14)];
            end
          else
            begin
              reg59 <= reg59;
              reg60 <= $unsigned(((~|$unsigned(((8'h9c) ? wire40 : (8'ha1)))) ?
                  $unsigned(((wire46 ?
                      wire46 : wire52) - reg7[(2'h3):(2'h3)])) : wire45));
              reg61 <= (((8'hb4) != (-wire4)) ~^ $signed((((wire5 ?
                      wire45 : reg61) ?
                  wire43[(1'h0):(1'h0)] : $unsigned(reg60)) & (-(8'hab)))));
            end
          reg62 <= {wire5};
          reg63 <= reg8[(2'h3):(1'h1)];
          reg64 <= (^~$signed(wire1[(3'h4):(1'h0)]));
          reg65 <= ($signed((~&(wire52[(3'h5):(2'h3)] & $signed(reg56)))) < wire44[(1'h1):(1'h1)]);
        end
    end
  assign wire66 = wire3;
endmodule

module module9  (y, clk, wire13, wire12, wire11, wire10);
  output wire [(32'h145):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire13;
  input wire signed [(5'h11):(1'h0)] wire12;
  input wire signed [(4'h8):(1'h0)] wire11;
  input wire [(4'he):(1'h0)] wire10;
  wire signed [(4'hc):(1'h0)] wire39;
  wire [(4'he):(1'h0)] wire38;
  wire [(5'h10):(1'h0)] wire37;
  wire [(4'he):(1'h0)] wire23;
  reg [(4'he):(1'h0)] reg36 = (1'h0);
  reg [(3'h7):(1'h0)] reg35 = (1'h0);
  reg signed [(4'he):(1'h0)] reg34 = (1'h0);
  reg [(5'h12):(1'h0)] reg33 = (1'h0);
  reg [(3'h5):(1'h0)] reg32 = (1'h0);
  reg [(4'h9):(1'h0)] reg31 = (1'h0);
  reg [(5'h11):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg28 = (1'h0);
  reg [(4'he):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg24 = (1'h0);
  reg [(4'hf):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg19 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg18 = (1'h0);
  reg [(3'h7):(1'h0)] reg17 = (1'h0);
  reg [(5'h11):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg14 = (1'h0);
  assign y = {wire39,
                 wire38,
                 wire37,
                 wire23,
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
                 reg24,
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
      if (wire11)
        begin
          reg14 <= {((|wire10) ?
                  (((^~wire12) ? wire12 : wire12) ?
                      wire10 : {wire13}) : {{$signed(wire13)}})};
          reg15 <= $unsigned($signed(wire10[(4'hb):(2'h3)]));
          reg16 <= ((((8'h9f) ? wire12 : $signed((wire13 ? wire13 : wire11))) ?
              $signed($unsigned(wire13[(2'h2):(1'h1)])) : (((reg15 ?
                          (8'ha5) : reg14) ?
                      (reg14 ? reg15 : wire13) : $unsigned(reg14)) ?
                  ($signed(reg14) ?
                      (wire12 ? wire11 : (8'ha8)) : (wire10 ?
                          reg15 : reg15)) : {wire11[(3'h5):(3'h5)],
                      (reg14 ? wire10 : wire11)})) | (((!reg15) ?
                  $unsigned($unsigned(wire10)) : {(wire12 <= wire11),
                      $unsigned(wire11)}) ?
              {(8'hac)} : ((-(wire11 ? reg14 : (8'h9e))) ?
                  wire11 : wire12[(4'hb):(1'h1)])));
          reg17 <= (wire12[(1'h1):(1'h1)] | ((8'ha6) ?
              ((reg14[(3'h4):(1'h1)] >>> (8'hbe)) ?
                  $unsigned((&reg16)) : ((^~wire10) > (wire12 != reg15))) : {($unsigned((7'h44)) + $signed(reg15))}));
          if ({reg17[(3'h6):(3'h6)]})
            begin
              reg18 <= (8'hbb);
              reg19 <= (+((~&(reg16 ? (~|wire10) : reg18)) ?
                  reg16[(4'ha):(3'h5)] : $unsigned({$unsigned(wire11)})));
            end
          else
            begin
              reg18 <= reg19;
              reg19 <= {($signed(reg17[(2'h3):(1'h1)]) ?
                      (reg17 <<< reg19[(5'h10):(4'hf)]) : wire11[(1'h0):(1'h0)]),
                  (reg16 ~^ $signed(reg14[(2'h3):(2'h2)]))};
              reg20 <= reg18[(4'h9):(3'h4)];
              reg21 <= $unsigned($unsigned(reg18));
            end
        end
      else
        begin
          reg14 <= reg15[(4'ha):(4'h9)];
          reg15 <= (($unsigned($unsigned({wire10, reg21})) ?
                  (|(!reg18[(3'h7):(3'h5)])) : (~^reg14)) ?
              reg19[(4'hf):(3'h5)] : ({($signed(reg17) >= reg17[(3'h6):(1'h0)])} ?
                  (&$unsigned($signed(reg20))) : ((8'hb9) ?
                      $unsigned((wire11 <= (8'hbc))) : {$unsigned(reg20)})));
        end
      reg22 <= (~$unsigned(reg21[(3'h7):(3'h7)]));
    end
  assign wire23 = (~|reg17);
  always
    @(posedge clk) begin
      reg24 <= reg17[(3'h4):(2'h3)];
      if (reg14)
        begin
          if ($unsigned((reg16[(4'ha):(1'h0)] ~^ $signed((&reg20[(3'h6):(3'h4)])))))
            begin
              reg25 <= (reg15 ? reg20 : (|$signed(reg15[(3'h7):(2'h3)])));
              reg26 <= (8'h9e);
              reg27 <= $unsigned($unsigned(wire23));
              reg28 <= (reg24 && wire13);
            end
          else
            begin
              reg25 <= (~&(wire10 || (((reg18 || reg25) <<< {reg17, reg17}) ?
                  reg25 : (~^(reg19 ? reg22 : reg18)))));
              reg26 <= reg28[(3'h5):(2'h3)];
            end
          reg29 <= $unsigned(($signed($unsigned((reg15 && reg20))) ?
              $unsigned({wire23[(3'h4):(2'h3)]}) : ((-((8'haa) || (8'hab))) ?
                  (reg22[(4'h9):(3'h5)] == (reg16 & reg17)) : (|reg27[(4'he):(4'h8)]))));
          reg30 <= $unsigned(reg19);
          reg31 <= reg22[(4'ha):(3'h7)];
          if ($unsigned({reg30[(4'hc):(1'h1)], $unsigned(wire13)}))
            begin
              reg32 <= $signed(reg27[(4'hd):(3'h5)]);
              reg33 <= ((8'hb7) ?
                  (reg20[(3'h6):(1'h1)] ?
                      reg32[(2'h2):(2'h2)] : $signed((reg29[(1'h0):(1'h0)] <= (reg19 ?
                          wire23 : wire11)))) : wire23[(2'h2):(1'h0)]);
            end
          else
            begin
              reg32 <= $signed((($unsigned($unsigned(wire10)) > wire12[(4'hf):(2'h2)]) < (8'ha2)));
              reg33 <= $signed(reg32);
            end
        end
      else
        begin
          if ({(+$unsigned($unsigned(reg15)))})
            begin
              reg25 <= ($unsigned($signed($signed((8'hb1)))) >= reg21);
              reg26 <= reg28;
              reg27 <= ((!reg17[(3'h7):(3'h5)]) != wire12[(2'h3):(1'h1)]);
              reg28 <= reg20[(3'h7):(3'h6)];
              reg29 <= ({(-((wire11 ? reg32 : (8'hb0)) ?
                          (reg24 ? reg26 : (8'hac)) : (reg33 || wire12)))} ?
                  $signed(($unsigned({reg32,
                      reg15}) != $unsigned(reg30))) : reg19[(4'h9):(2'h2)]);
            end
          else
            begin
              reg25 <= reg22;
              reg26 <= $unsigned((reg26[(2'h2):(2'h2)] ?
                  $unsigned({(~|reg33), (reg29 >= reg28)}) : (^~{$signed(reg22),
                      $unsigned((8'hbc))})));
              reg27 <= {reg20[(3'h6):(3'h5)],
                  $unsigned(((reg28 ? reg26 : reg17[(1'h0):(1'h0)]) ?
                      {reg32[(3'h4):(2'h2)],
                          $unsigned((8'hb6))} : (reg29[(2'h3):(1'h1)] ~^ reg17)))};
              reg28 <= (($unsigned($signed($signed(reg27))) ^~ (reg25 <<< ($signed(reg21) ^~ (wire12 ?
                      (8'hbf) : reg15)))) ?
                  reg25 : (^~(7'h40)));
              reg29 <= reg14;
            end
          reg30 <= (((($signed(reg25) <<< wire12[(1'h0):(1'h0)]) ?
                  reg33[(4'hf):(4'h9)] : ((^reg21) >= reg32)) ?
              reg26[(2'h3):(2'h2)] : (reg28 ?
                  (~&reg18) : $signed(((7'h42) ?
                      wire11 : wire12)))) <= ((reg25[(4'ha):(3'h7)] & reg29) << $unsigned(({wire23,
              (8'had)} ~^ reg15[(4'hf):(2'h2)]))));
          reg31 <= ($signed($unsigned(wire23)) ? reg30 : (-reg14));
          if ($unsigned($unsigned(((|(reg25 | reg20)) ?
              reg30 : {$unsigned(reg19)}))))
            begin
              reg32 <= wire13[(2'h2):(1'h1)];
              reg33 <= ((wire11[(3'h7):(3'h7)] ?
                      (($signed(reg25) ?
                          (~^reg18) : $signed(reg18)) ^ (8'hab)) : ($signed((reg17 ?
                          reg22 : (8'hab))) <<< ($unsigned(reg22) | reg25))) ?
                  (&(wire12 - reg31[(2'h2):(1'h0)])) : (reg15 == wire10));
            end
          else
            begin
              reg32 <= reg19[(3'h7):(2'h2)];
              reg33 <= $signed(($unsigned((reg17 >= $signed(wire23))) ?
                  ((~(8'hbc)) + (&(reg20 ?
                      reg16 : reg32))) : $unsigned((8'hbe))));
              reg34 <= reg24;
            end
        end
      reg35 <= reg27;
      reg36 <= reg31;
    end
  assign wire37 = $signed($unsigned((8'hab)));
  assign wire38 = reg22;
  assign wire39 = (!(-(reg29[(1'h1):(1'h0)] ?
                      wire13[(1'h0):(1'h0)] : (&$signed(reg14)))));
endmodule
