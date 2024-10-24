module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'ha4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire4;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire77;
  wire signed [(3'h4):(1'h0)] wire76;
  wire signed [(5'h12):(1'h0)] wire75;
  wire [(4'h8):(1'h0)] wire74;
  wire signed [(4'hb):(1'h0)] wire64;
  wire [(3'h6):(1'h0)] wire5;
  reg signed [(5'h11):(1'h0)] reg73 = (1'h0);
  reg [(5'h13):(1'h0)] reg72 = (1'h0);
  reg [(4'ha):(1'h0)] reg71 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg69 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg68 = (1'h0);
  reg [(3'h4):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg66 = (1'h0);
  assign y = {wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire64,
                 wire5,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 (1'h0)};
  assign wire5 = wire0[(2'h2):(2'h2)];
  module6 #() modinst65 (.wire8(wire4), .wire10(wire2), .y(wire64), .wire9(wire5), .wire7(wire1), .clk(clk));
  always
    @(posedge clk) begin
      reg66 <= wire1;
      reg67 <= {($unsigned($unsigned($signed(reg66))) + {(reg66[(4'hc):(1'h0)] ?
                  (wire2 ? wire3 : wire2) : $unsigned(wire64)),
              $unsigned(wire2)})};
      reg68 <= (~^($unsigned((8'hbf)) ?
          $signed(wire0[(2'h3):(2'h3)]) : (wire1 ?
              ($signed(wire64) & $signed(wire1)) : ((~&(8'h9c)) - (reg67 ?
                  wire1 : reg67)))));
      if ($unsigned((((+reg67) ?
          (8'ha7) : $signed((|wire1))) <= ($unsigned(wire1[(4'hb):(4'h8)]) >>> $signed((^wire5))))))
        begin
          reg69 <= ($signed(wire4) ? $unsigned(wire4[(4'h8):(2'h3)]) : wire5);
          reg70 <= (reg66 <<< (((8'hbd) ?
              (~^(wire4 >= wire1)) : (^~(!reg69))) ^ reg69[(3'h4):(2'h3)]));
          reg71 <= reg66[(5'h13):(1'h1)];
        end
      else
        begin
          if ($signed((&((~&wire1[(3'h5):(1'h0)]) ?
              (((8'h9e) ~^ wire4) ?
                  reg70 : $unsigned(wire64)) : (reg68 ~^ (+wire0))))))
            begin
              reg69 <= reg69;
              reg70 <= (({reg66[(4'he):(4'hc)]} ?
                      wire0 : $unsigned($unsigned($signed(wire0)))) ?
                  reg66[(4'hb):(2'h3)] : (~|($signed((~|wire2)) ?
                      reg66 : reg71)));
              reg71 <= reg70;
              reg72 <= $signed(((~&({wire1, wire3} ?
                  (^(8'hb9)) : (~^reg69))) != $unsigned($signed(wire4))));
            end
          else
            begin
              reg69 <= $signed($signed(reg68[(3'h5):(3'h5)]));
              reg70 <= $signed($signed($signed(($signed(wire0) ?
                  wire2[(4'hc):(4'hb)] : wire0))));
              reg71 <= ({({$signed(reg66)} ?
                      (((7'h43) + (8'hab)) ?
                          (wire2 | reg71) : {reg72, wire5}) : ((-reg69) ?
                          (reg70 ?
                              reg66 : (8'ha2)) : $signed(wire64)))} << (&$signed({{reg69,
                      reg68}})));
              reg72 <= wire3[(2'h2):(1'h0)];
            end
        end
      reg73 <= reg67[(2'h2):(1'h1)];
    end
  assign wire74 = reg67;
  assign wire75 = (~&$signed(((reg68 <<< (wire4 ? wire2 : wire3)) ?
                      reg66 : wire5)));
  assign wire76 = (-((reg71 ^~ ($signed(reg72) <<< reg66)) ?
                      wire2 : (^~wire74[(4'h8):(3'h4)])));
  assign wire77 = (wire2[(3'h6):(3'h6)] ?
                      $signed($signed(((wire64 ?
                          wire74 : reg66) != (wire76 == reg67)))) : wire4[(4'h8):(3'h4)]);
endmodule

module module6  (y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'h83):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire7;
  input wire signed [(5'h13):(1'h0)] wire8;
  input wire [(3'h5):(1'h0)] wire9;
  input wire signed [(3'h7):(1'h0)] wire10;
  wire [(4'hb):(1'h0)] wire63;
  wire [(4'hf):(1'h0)] wire12;
  wire signed [(4'hc):(1'h0)] wire13;
  wire [(5'h14):(1'h0)] wire15;
  wire [(5'h11):(1'h0)] wire16;
  wire [(4'ha):(1'h0)] wire17;
  wire [(4'h8):(1'h0)] wire18;
  wire signed [(5'h11):(1'h0)] wire61;
  reg signed [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg14 = (1'h0);
  assign y = {wire63,
                 wire12,
                 wire13,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire61,
                 reg11,
                 reg14,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg11 <= (!((8'ha4) ?
          ((8'ha3) ?
              wire9 : (wire7 ?
                  (wire9 >>> wire7) : ((8'ha6) ?
                      wire9 : wire7))) : (^$unsigned((wire8 ?
              wire8 : wire10)))));
    end
  assign wire12 = $signed({$signed((wire8 ? (~&wire9) : wire9))});
  assign wire13 = (~{$unsigned(wire8[(4'hc):(3'h4)]),
                      (!wire10[(1'h1):(1'h1)])});
  always
    @(posedge clk) begin
      reg14 <= {(wire9[(2'h2):(2'h2)] <<< ((8'hb2) ^~ $unsigned(wire12))),
          (wire10[(2'h3):(1'h0)] << $signed((8'hac)))};
    end
  assign wire15 = (($signed($signed((wire9 <<< wire12))) ?
                          ($signed((wire13 ?
                              reg14 : wire9)) < (!wire7[(3'h6):(2'h3)])) : (((reg11 ?
                                  wire10 : (8'hb2)) ?
                              (wire8 ?
                                  wire9 : reg14) : wire7) | $unsigned(wire8[(3'h6):(2'h2)]))) ?
                      wire10 : reg11);
  assign wire16 = $unsigned((~|((&(^~(8'hbc))) < wire10[(3'h4):(1'h0)])));
  assign wire17 = {{(wire13 ^ ((wire16 ~^ wire7) ?
                              (wire15 ? wire12 : wire13) : (wire13 ?
                                  reg14 : wire7))),
                          $signed(((~&(7'h40)) ? wire12 : $unsigned(wire7)))}};
  assign wire18 = (($unsigned({(~&(8'hb1)),
                      wire9[(2'h3):(2'h3)]}) ^ $unsigned($unsigned(((8'haf) >>> wire9)))) >>> $unsigned(({$unsigned(wire7)} > wire10[(2'h2):(1'h0)])));
  module19 #() modinst62 (.wire20(reg11), .wire22(wire12), .wire21(wire15), .y(wire61), .wire23(wire17), .clk(clk));
  assign wire63 = (!wire13[(2'h2):(1'h1)]);
endmodule

module module19
#(parameter param59 = (((({(7'h40)} ? {(8'hb2), (8'hbd)} : {(8'hbb), (8'ha7)}) ? (~^(~^(8'ha9))) : (^(~|(8'hb0)))) > ((^((8'hac) != (8'ha7))) ? ({(8'hae), (8'hbb)} ? (~(8'h9f)) : ((8'hbb) | (8'had))) : {((8'hbe) || (8'hb6)), (~(8'hae))})) <= (({((8'ha8) != (8'haa)), {(7'h42)}} ~^ (((8'hb3) ? (8'hb4) : (8'hb0)) ^ (~(8'h9c)))) ? {(((8'hb7) ^~ (8'hb0)) - ((8'hb6) & (8'hbe))), (((8'haf) ? (7'h41) : (8'hb3)) ? (|(8'haf)) : {(8'h9f), (8'h9e)})} : (|(~&{(8'hb3), (8'ha5)})))), 
parameter param60 = (((&(((8'ha7) ^ (8'hae)) > (!param59))) || (+((param59 ? param59 : param59) ? (param59 ? (8'hbf) : param59) : (param59 ? param59 : param59)))) ? param59 : {{(param59 != (param59 >= param59)), ((param59 ? param59 : param59) ? {param59, param59} : {(8'hbb), param59})}}))
(y, clk, wire23, wire22, wire21, wire20);
  output wire [(32'h1b8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire23;
  input wire signed [(4'hf):(1'h0)] wire22;
  input wire signed [(4'he):(1'h0)] wire21;
  input wire [(4'hd):(1'h0)] wire20;
  wire [(5'h14):(1'h0)] wire58;
  wire [(3'h4):(1'h0)] wire57;
  wire signed [(5'h11):(1'h0)] wire56;
  wire signed [(5'h10):(1'h0)] wire52;
  wire signed [(5'h14):(1'h0)] wire51;
  wire signed [(4'he):(1'h0)] wire50;
  wire [(5'h13):(1'h0)] wire49;
  wire [(3'h5):(1'h0)] wire47;
  wire [(4'he):(1'h0)] wire46;
  wire signed [(4'ha):(1'h0)] wire45;
  wire [(5'h13):(1'h0)] wire24;
  reg signed [(3'h6):(1'h0)] reg55 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg48 = (1'h0);
  reg [(5'h12):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg43 = (1'h0);
  reg [(4'he):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg41 = (1'h0);
  reg [(3'h5):(1'h0)] reg40 = (1'h0);
  reg [(5'h12):(1'h0)] reg39 = (1'h0);
  reg [(4'hc):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg36 = (1'h0);
  reg [(4'hc):(1'h0)] reg35 = (1'h0);
  reg [(2'h2):(1'h0)] reg34 = (1'h0);
  reg [(5'h11):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg32 = (1'h0);
  reg [(5'h13):(1'h0)] reg31 = (1'h0);
  reg [(3'h4):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg29 = (1'h0);
  reg [(3'h5):(1'h0)] reg28 = (1'h0);
  reg [(4'h8):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg26 = (1'h0);
  reg [(5'h11):(1'h0)] reg25 = (1'h0);
  assign y = {wire58,
                 wire57,
                 wire56,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire47,
                 wire46,
                 wire45,
                 wire24,
                 reg55,
                 reg54,
                 reg53,
                 reg48,
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
                 reg26,
                 reg25,
                 (1'h0)};
  assign wire24 = {wire20};
  always
    @(posedge clk) begin
      if (($signed($unsigned(wire24[(3'h4):(2'h2)])) & ((wire22 ?
              (wire24 > (^wire24)) : wire20) ?
          {(~|(wire21 ~^ wire24))} : {wire24, wire21})))
        begin
          if (wire24[(2'h3):(1'h1)])
            begin
              reg25 <= $signed((wire23 >>> {wire20}));
            end
          else
            begin
              reg25 <= {wire24[(4'hc):(1'h0)]};
              reg26 <= (({wire23, wire20[(2'h3):(2'h2)]} ?
                      (~|reg25[(4'hc):(2'h3)]) : ($unsigned((wire20 && (8'had))) < ((^wire20) - reg25[(4'ha):(3'h7)]))) ?
                  {($signed($unsigned((8'hb5))) ~^ $unsigned({wire23}))} : (wire23 >> (((wire23 ?
                      (7'h40) : wire22) || {reg25}) || (|(8'h9f)))));
            end
          reg27 <= $unsigned((^~(^~{(wire23 == wire24), (-wire23)})));
          if ((^~wire23[(3'h5):(1'h1)]))
            begin
              reg28 <= $signed((~(~|$unsigned(wire24))));
              reg29 <= reg27;
              reg30 <= (-(wire20[(2'h3):(2'h2)] ?
                  $signed(((~|reg27) >= (~wire24))) : $unsigned((+reg27))));
              reg31 <= (&$signed(wire21[(4'he):(1'h0)]));
            end
          else
            begin
              reg28 <= (^~$unsigned(($signed(reg25[(4'h9):(3'h6)]) == $unsigned({(8'h9e)}))));
              reg29 <= ({$unsigned(((~|reg31) ^~ (^~reg26)))} ?
                  $unsigned($signed($unsigned(((8'ha7) ?
                      reg29 : wire23)))) : $signed({wire22[(4'he):(4'hb)],
                      wire20}));
              reg30 <= $unsigned((wire24[(4'hc):(4'hb)] ^~ $signed((-$signed(reg30)))));
              reg31 <= (wire24[(4'h9):(3'h6)] ?
                  ($unsigned({(+wire24),
                      $signed(wire21)}) <= $unsigned(reg29)) : $unsigned({wire23[(1'h0):(1'h0)],
                      $signed((~|reg27))}));
            end
          reg32 <= wire21;
          reg33 <= reg31[(2'h2):(1'h0)];
        end
      else
        begin
          reg25 <= reg33[(3'h5):(2'h2)];
          reg26 <= (($unsigned(reg32) != (($unsigned((8'ha3)) ?
                      $signed(reg32) : {reg30}) ?
                  $signed((~|(8'h9c))) : $unsigned(((8'hb7) ?
                      reg31 : reg27)))) ?
              (({$signed(reg33)} > ({wire22} ?
                  reg33[(3'h7):(2'h2)] : $unsigned(reg29))) != $unsigned($signed((8'hb0)))) : $signed(((8'hb0) & $unsigned((wire24 & wire21)))));
        end
      if (wire22)
        begin
          reg34 <= $signed($signed(reg25));
          reg35 <= ($unsigned(reg30) <<< $signed(($signed((reg30 && reg25)) ?
              (8'h9f) : ((+(8'hb5)) * $signed(reg33)))));
        end
      else
        begin
          reg34 <= {$signed(reg32[(2'h2):(1'h0)]), reg33};
        end
      if ((((7'h41) * ((((8'hb2) ? reg31 : reg29) + reg25) ?
              ((|reg28) - (reg30 == wire20)) : {$signed(wire20),
                  (wire21 ? reg26 : reg31)})) ?
          reg26 : $signed(reg29)))
        begin
          reg36 <= {(7'h44)};
        end
      else
        begin
          reg36 <= ($signed($signed($signed(((8'hac) <<< wire20)))) ?
              reg25[(5'h10):(4'hf)] : wire21[(3'h5):(3'h5)]);
          reg37 <= $signed({{reg35[(1'h0):(1'h0)]}});
          if (reg29[(1'h1):(1'h1)])
            begin
              reg38 <= $signed((($signed(reg32) ? $unsigned((|reg29)) : reg25) ?
                  ($unsigned(reg27[(1'h0):(1'h0)]) & (|(~&reg32))) : reg35));
              reg39 <= reg35[(2'h3):(1'h1)];
              reg40 <= reg39;
              reg41 <= $signed((($signed(reg25[(4'hd):(4'hb)]) | ((~wire23) ?
                  (reg29 ?
                      reg29 : reg39) : (-reg35))) >= (wire24[(4'ha):(1'h1)] ?
                  ($unsigned(reg30) ?
                      (^~(8'hb3)) : $signed(reg34)) : reg33[(1'h1):(1'h1)])));
              reg42 <= reg35[(4'hc):(2'h2)];
            end
          else
            begin
              reg38 <= $unsigned($signed(reg38[(1'h0):(1'h0)]));
              reg39 <= $signed({reg37[(1'h1):(1'h0)]});
              reg40 <= $signed($signed(reg30[(2'h2):(1'h1)]));
              reg41 <= (|reg42[(1'h0):(1'h0)]);
            end
        end
      reg43 <= (reg26[(3'h5):(2'h2)] ?
          {({$signed((8'h9c)), (wire20 && (8'haf))} ?
                  ((~reg32) ?
                      reg40 : (+reg36)) : reg31)} : (reg30 > ((7'h41) != (^~((8'h9e) >> reg37)))));
      reg44 <= ($unsigned(reg41) ?
          $signed((!({reg30} ?
              $signed((8'ha1)) : (+wire24)))) : (^$signed(($signed((8'h9e)) >= wire23[(1'h1):(1'h1)]))));
    end
  assign wire45 = reg31;
  assign wire46 = reg36[(4'hd):(4'hc)];
  assign wire47 = reg31;
  always
    @(posedge clk) begin
      reg48 <= $unsigned(wire47[(3'h4):(1'h1)]);
    end
  assign wire49 = reg27[(2'h3):(1'h1)];
  assign wire50 = ((wire46 ?
                          ($signed(reg28[(1'h1):(1'h1)]) ?
                              reg43[(2'h3):(1'h0)] : {(reg37 ?
                                      reg26 : reg36)}) : reg25[(4'hb):(4'ha)]) ?
                      (reg29[(1'h0):(1'h0)] ?
                          wire49[(4'hc):(3'h7)] : (reg44 ?
                              reg25 : $unsigned((&wire45)))) : (wire46[(4'he):(4'hb)] ?
                          ({reg30} <= $unsigned(((8'had) ?
                              reg32 : reg41))) : (&$signed($unsigned(reg35)))));
  assign wire51 = (((reg31 ?
                              reg44[(2'h3):(1'h1)] : ($signed(reg40) != (+reg36))) ?
                          reg25 : (($signed(reg39) ? $unsigned(reg37) : reg43) ?
                              ($unsigned(reg30) || $unsigned(reg43)) : $signed($signed(reg34)))) ?
                      (8'ha9) : (~|($unsigned($signed(wire49)) - (wire23[(3'h5):(2'h3)] * (reg35 & wire47)))));
  assign wire52 = (!(reg41[(4'h8):(1'h1)] | (($signed(reg35) ?
                      (wire20 ? reg28 : wire50) : wire46) ~^ ((+wire21) ?
                      (reg32 ? reg30 : reg28) : (~|wire20)))));
  always
    @(posedge clk) begin
      reg53 <= wire47;
      reg54 <= reg53[(3'h4):(2'h3)];
      reg55 <= (8'hbb);
    end
  assign wire56 = $unsigned((^~(~^{reg26[(4'hb):(1'h0)]})));
  assign wire57 = $signed(wire21[(4'hb):(2'h2)]);
  assign wire58 = $unsigned(wire46[(1'h0):(1'h0)]);
endmodule
