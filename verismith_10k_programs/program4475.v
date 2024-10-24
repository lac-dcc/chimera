module top
#(parameter param59 = ((({{(8'hb2)}, ((8'h9f) && (8'hae))} ? ((~(8'hac)) <= ((8'ha4) ? (8'hb6) : (8'hbd))) : {((8'hb9) || (8'hb7))}) - (~&((+(8'hb0)) ? ((8'ha7) ? (8'hb4) : (8'h9d)) : {(7'h40), (8'hb4)}))) > (^{{(+(8'hbb))}})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h195):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire4;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire58;
  wire [(2'h2):(1'h0)] wire57;
  wire signed [(4'hb):(1'h0)] wire56;
  wire signed [(4'ha):(1'h0)] wire38;
  wire signed [(4'hc):(1'h0)] wire30;
  wire signed [(5'h11):(1'h0)] wire29;
  wire signed [(5'h15):(1'h0)] wire28;
  wire signed [(4'hc):(1'h0)] wire27;
  wire [(2'h3):(1'h0)] wire26;
  wire [(5'h12):(1'h0)] wire25;
  wire signed [(3'h7):(1'h0)] wire24;
  wire signed [(5'h10):(1'h0)] wire20;
  wire [(3'h7):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire5;
  reg signed [(4'h9):(1'h0)] reg55 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg54 = (1'h0);
  reg [(4'hd):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg52 = (1'h0);
  reg [(4'ha):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg49 = (1'h0);
  reg [(5'h13):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg47 = (1'h0);
  reg [(3'h6):(1'h0)] reg46 = (1'h0);
  reg [(4'he):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg44 = (1'h0);
  reg [(3'h4):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg41 = (1'h0);
  reg [(3'h5):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg39 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg36 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg35 = (1'h0);
  reg [(4'hb):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg33 = (1'h0);
  reg [(3'h5):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg31 = (1'h0);
  reg [(2'h2):(1'h0)] reg23 = (1'h0);
  reg [(5'h13):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg6 = (1'h0);
  assign y = {wire58,
                 wire57,
                 wire56,
                 wire38,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire20,
                 wire7,
                 wire5,
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
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg23,
                 reg22,
                 reg6,
                 (1'h0)};
  assign wire5 = $signed({wire1});
  always
    @(posedge clk) begin
      reg6 <= (~^(wire4[(1'h1):(1'h1)] ?
          ($unsigned(((8'hbe) ? wire0 : wire0)) ?
              ((~|wire3) <<< $signed(wire4)) : wire2) : $signed($unsigned({wire3}))));
    end
  assign wire7 = (wire5 && {(wire3[(4'h8):(3'h4)] ?
                         (~&(wire4 & wire3)) : {(~|wire3)})});
  module8 #() modinst21 (.y(wire20), .wire11(wire1), .wire9(wire2), .clk(clk), .wire12(wire0), .wire10(wire7));
  always
    @(posedge clk) begin
      if (($unsigned(wire1) ^~ ($signed(wire0) < (|(wire20[(3'h4):(3'h4)] ?
          wire0[(5'h11):(4'hc)] : {wire5})))))
        begin
          reg22 <= wire2[(3'h6):(1'h0)];
          reg23 <= wire7;
        end
      else
        begin
          reg22 <= (((~&wire3[(3'h5):(2'h3)]) != {$unsigned((wire7 ?
                  wire7 : (7'h42)))}) <= ($signed($signed({wire0})) != $signed((^~wire5[(4'hd):(4'h9)]))));
          reg23 <= wire5;
        end
    end
  assign wire24 = $unsigned((((8'hb8) ~^ ((wire7 ?
                      wire0 : wire20) ^ (^wire0))) >> wire0[(3'h5):(2'h2)]));
  assign wire25 = (($signed(reg23[(1'h0):(1'h0)]) && wire2) & (((^(^wire7)) && $unsigned((wire7 ?
                      wire20 : wire7))) ^ $signed(($unsigned(wire7) ?
                      (~wire2) : ((8'hbc) < wire7)))));
  assign wire26 = (&reg22);
  assign wire27 = ({$unsigned({(wire4 + wire25)})} | $unsigned($signed(wire2[(3'h7):(1'h0)])));
  assign wire28 = reg6;
  assign wire29 = (+(-{wire20, reg6}));
  assign wire30 = $unsigned($signed($unsigned((wire24 <<< $signed(wire27)))));
  always
    @(posedge clk) begin
      if ({((~&{$signed(wire0)}) - $unsigned((+(~|wire30)))), wire20})
        begin
          reg31 <= ({$unsigned($signed((|wire1))),
                  ({(wire4 ? (8'haa) : wire7), {wire4, wire4}} & (8'hbc))} ?
              ($signed((wire29 ?
                  $unsigned(wire25) : wire24)) >>> wire25) : wire27);
        end
      else
        begin
          reg31 <= wire26[(2'h3):(2'h2)];
          if (wire1)
            begin
              reg32 <= (reg6 ?
                  $signed($unsigned(reg22)) : $unsigned((!((reg6 ?
                      wire5 : wire7) ~^ wire0))));
              reg33 <= ((&$signed(reg23)) ~^ $unsigned($unsigned(wire25[(2'h2):(1'h0)])));
              reg34 <= {({{$signed(reg32), (wire7 ? wire2 : wire1)}} ?
                      wire1[(2'h3):(2'h3)] : reg23[(1'h1):(1'h1)]),
                  (+$unsigned(($unsigned((8'ha0)) ?
                      $signed(wire0) : $unsigned(wire30))))};
            end
          else
            begin
              reg32 <= (reg23[(1'h1):(1'h1)] ?
                  ((~wire4) ?
                      ({(wire27 ? reg22 : wire1),
                          ((8'ha3) ?
                              wire26 : wire26)} * reg23) : wire29) : wire2);
              reg33 <= $signed($unsigned($signed((~|(^~wire3)))));
              reg34 <= (~&($signed(wire5[(4'hb):(4'ha)]) <= $signed((wire1 << (&wire29)))));
              reg35 <= $signed(wire25);
            end
          reg36 <= {$signed($unsigned($signed(((8'hb7) >= wire28))))};
          if (((wire27 + ($unsigned($signed(wire30)) != {(reg36 ^ (8'hbb)),
                  (~^reg33)})) ?
              $signed(wire4) : (~^wire30[(4'h9):(3'h7)])))
            begin
              reg37 <= ((wire30[(4'hc):(4'h8)] ?
                  $signed(reg32) : $signed($signed((wire24 ?
                      wire4 : (8'ha3))))) ^ (~|wire30[(1'h0):(1'h0)]));
            end
          else
            begin
              reg37 <= wire20[(3'h7):(2'h2)];
            end
        end
    end
  assign wire38 = ({$signed($signed((!wire26))), (~^reg6)} ?
                      wire1 : $signed($unsigned((-reg35))));
  always
    @(posedge clk) begin
      reg39 <= (^wire2[(3'h7):(3'h4)]);
      if (((~&wire38[(3'h6):(2'h3)]) + (^~($unsigned($signed(reg39)) | reg6[(1'h1):(1'h1)]))))
        begin
          if ((((wire28 * ({(8'hab), reg32} ?
                      (~reg31) : (wire3 ? wire1 : wire29))) ?
                  $signed($unsigned((wire0 <= wire29))) : ((-wire38) ?
                      (~^reg35) : $unsigned(reg34[(2'h3):(1'h1)]))) ?
              {((|(reg36 ? wire20 : reg23)) ^~ (^~(~reg23))),
                  {(~^(reg32 ? wire26 : wire29)),
                      $unsigned(reg37[(2'h2):(2'h2)])}} : (&reg39[(1'h0):(1'h0)])))
            begin
              reg40 <= wire7;
              reg41 <= (-(wire24[(1'h0):(1'h0)] ?
                  {$signed($unsigned(reg33)),
                      (~|reg40[(3'h5):(1'h1)])} : (&$signed($unsigned((8'haa))))));
            end
          else
            begin
              reg40 <= reg23;
              reg41 <= (wire30[(1'h0):(1'h0)] ~^ wire24);
              reg42 <= {{(wire5 ?
                          wire29[(4'h8):(1'h0)] : $signed($signed(wire29)))},
                  ((~^{reg22[(1'h0):(1'h0)], ((8'hb7) && (8'ha4))}) ?
                      wire30 : (8'ha9))};
              reg43 <= {{reg36, wire28[(5'h12):(4'hf)]}};
            end
          reg44 <= (~$unsigned(wire30[(3'h4):(1'h1)]));
          reg45 <= (wire2[(3'h4):(3'h4)] ?
              $signed(wire4[(4'hb):(1'h0)]) : reg41[(3'h4):(2'h2)]);
        end
      else
        begin
          if ((wire28[(5'h13):(4'h9)] >>> (($unsigned((-reg35)) ?
                  $unsigned((reg37 ? reg36 : reg32)) : reg36[(2'h2):(1'h1)]) ?
              $signed((~|{reg39,
                  reg35})) : $unsigned(($unsigned(reg36) > (~^reg34))))))
            begin
              reg40 <= $unsigned((^reg42[(2'h2):(2'h2)]));
              reg41 <= (^~wire1[(2'h3):(2'h3)]);
            end
          else
            begin
              reg40 <= ($signed((~(7'h41))) < $unsigned($signed(({reg42,
                  wire38} << (wire38 | reg39)))));
              reg41 <= ($signed((8'hae)) ~^ {$unsigned((((8'h9d) < (8'hae)) & reg36[(3'h6):(3'h5)]))});
            end
          reg42 <= $unsigned(wire24);
          reg43 <= reg45;
          if ($unsigned(({$unsigned(reg33[(2'h2):(2'h2)])} > $signed(($signed(wire30) ?
              $unsigned(wire24) : $unsigned(wire29))))))
            begin
              reg44 <= (~&$signed(reg37));
              reg45 <= (|((&$signed((~^reg6))) ?
                  ($unsigned((reg32 <<< wire28)) ?
                      (+{wire38}) : (!$signed(reg41))) : $unsigned($unsigned({wire5,
                      wire20}))));
              reg46 <= (wire1 != $signed(wire5[(3'h4):(2'h2)]));
              reg47 <= {((~&$signed($unsigned(reg34))) ?
                      $unsigned(wire27) : reg41[(1'h0):(1'h0)])};
            end
          else
            begin
              reg44 <= (|(&wire29));
              reg45 <= ((^~(&($unsigned(wire38) == (wire25 >> wire0)))) ?
                  (~|(reg22[(5'h11):(2'h3)] == reg22)) : wire25);
              reg46 <= (reg34 < (~^(-($unsigned(wire28) + (wire29 ?
                  (8'ha2) : reg22)))));
            end
          if ((reg33 * reg41))
            begin
              reg48 <= wire28;
              reg49 <= (~&(&$signed(wire0)));
              reg50 <= $unsigned($unsigned(((7'h42) | reg46)));
              reg51 <= reg41[(2'h2):(2'h2)];
              reg52 <= (!$signed({reg32[(1'h0):(1'h0)],
                  {(wire24 ? (8'hba) : reg47), wire25[(2'h3):(2'h2)]}}));
            end
          else
            begin
              reg48 <= (-$unsigned(reg35[(1'h0):(1'h0)]));
              reg49 <= (8'hbf);
            end
        end
    end
  always
    @(posedge clk) begin
      reg53 <= {{$signed($signed((wire29 >= wire38))),
              {($unsigned(wire5) << reg37),
                  ($signed(wire4) ?
                      $unsigned(reg23) : (reg46 ? reg51 : reg42))}}};
      reg54 <= ($signed(($signed($unsigned(reg39)) ?
          ((reg48 >>> wire2) ? reg35 : wire29) : (-(reg42 ?
              reg44 : wire24)))) > ($unsigned((!$signed(reg49))) ?
          reg44[(2'h2):(1'h1)] : {$signed({reg46}),
              $signed($unsigned(wire27))}));
      reg55 <= (!(reg43 ?
          $unsigned(wire24[(3'h7):(1'h0)]) : (((8'hb7) ?
              reg48[(3'h4):(1'h0)] : (^~wire5)) <= $signed((reg45 <= wire1)))));
    end
  assign wire56 = reg39[(1'h1):(1'h0)];
  assign wire57 = reg32[(1'h0):(1'h0)];
  assign wire58 = reg35[(1'h1):(1'h0)];
endmodule

module module8
#(parameter param18 = ({{(8'hb1)}, (^~(&((8'ha6) - (8'had))))} ? (~|((~^{(8'h9e), (8'hbd)}) ? (+(&(8'hb5))) : (((8'hb7) ? (8'haf) : (8'haa)) ? (^~(8'hab)) : (^(8'hb4))))) : (((((7'h43) ? (8'ha5) : (8'hb4)) > ((8'ha4) + (8'hb7))) ? {((8'ha4) >>> (7'h40)), {(8'hb8), (8'hbd)}} : ((~|(8'ha2)) && ((8'ha9) ? (8'hab) : (7'h42)))) ? (7'h43) : ((((8'hbf) ? (8'hbb) : (8'ha0)) ^~ ((7'h40) ? (8'hb7) : (8'ha4))) ? {((8'hb9) ? (8'ha2) : (7'h43))} : (((8'hb1) & (8'hab)) && ((8'hb8) ? (8'ha9) : (8'hb9)))))), 
parameter param19 = ((param18 <= (((param18 & param18) ? (param18 ^~ param18) : param18) ? (&(^~param18)) : (|(&param18)))) ? param18 : param18))
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h32):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire12;
  input wire [(2'h3):(1'h0)] wire11;
  input wire [(3'h5):(1'h0)] wire10;
  input wire [(2'h2):(1'h0)] wire9;
  wire signed [(4'ha):(1'h0)] wire17;
  wire signed [(3'h6):(1'h0)] wire16;
  wire signed [(3'h6):(1'h0)] wire15;
  wire [(5'h14):(1'h0)] wire14;
  wire [(3'h7):(1'h0)] wire13;
  assign y = {wire17, wire16, wire15, wire14, wire13, (1'h0)};
  assign wire13 = wire10;
  assign wire14 = (-(((~|wire10[(1'h1):(1'h0)]) ?
                      $signed((8'ha1)) : (~|(^~wire10))) & (&((wire9 ?
                          wire12 : wire12) ?
                      wire10 : wire13[(3'h7):(1'h1)]))));
  assign wire15 = $unsigned(wire11);
  assign wire16 = (wire9 < (wire13[(3'h7):(2'h3)] ?
                      $unsigned((+wire13[(3'h4):(1'h0)])) : ((~^$unsigned(wire15)) <<< $signed(wire14[(4'he):(1'h1)]))));
  assign wire17 = ((~&(((wire9 ?
                      wire9 : (8'hb7)) >> (~wire14)) >>> (^~((8'hb6) ?
                      (8'hb0) : wire14)))) & (~^$unsigned($signed((wire11 <<< wire15)))));
endmodule
