module top
#(parameter param103 = ((|{(((8'ha9) & (7'h42)) ? (~&(7'h42)) : ((7'h42) ? (7'h41) : (8'h9d))), (((8'ha4) ^~ (8'ha6)) ? ((8'ha4) && (8'ha7)) : (~(7'h42)))}) != (~&((~^(8'hbf)) <<< {((8'hb0) <= (8'ha3)), ((8'hb5) | (8'hbb))}))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h52):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire4;
  input wire [(4'hb):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire102;
  wire signed [(2'h3):(1'h0)] wire101;
  wire [(4'h9):(1'h0)] wire100;
  wire signed [(5'h12):(1'h0)] wire99;
  wire [(3'h6):(1'h0)] wire97;
  wire [(5'h15):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire5;
  assign y = {wire102, wire101, wire100, wire99, wire97, wire6, wire5, (1'h0)};
  assign wire5 = wire2;
  assign wire6 = $signed(wire5[(4'hb):(4'h9)]);
  module7 #() modinst98 (.wire11(wire2), .clk(clk), .wire8(wire3), .wire10(wire5), .wire9(wire0), .y(wire97));
  assign wire99 = ($unsigned(wire0[(4'ha):(3'h6)]) <<< wire5);
  assign wire100 = (wire2 ?
                       (wire97[(1'h0):(1'h0)] == $unsigned(((~^wire4) & wire2[(1'h1):(1'h0)]))) : $unsigned({{$unsigned(wire2),
                               $unsigned(wire1)},
                           $unsigned(wire5)}));
  assign wire101 = wire0;
  assign wire102 = (($unsigned((~^(~^(8'hb2)))) >= (wire5[(5'h13):(3'h7)] & ((wire3 ?
                           wire3 : wire5) >> {wire2, wire99}))) ?
                       {(!$unsigned((~|wire4))),
                           wire100[(3'h6):(3'h5)]} : {((wire5[(3'h5):(2'h2)] ?
                                   (!wire101) : $unsigned(wire4)) ?
                               $unsigned(wire100) : ((wire99 != wire97) || $unsigned(wire5))),
                           (|(((8'h9f) ~^ wire3) + wire97[(1'h1):(1'h1)]))});
endmodule

module module7
#(parameter param95 = (!(8'hba)), 
parameter param96 = ((+(((~(8'hab)) != {param95}) ? ((param95 | param95) ? (+param95) : (param95 ? param95 : param95)) : ((param95 >> param95) == (param95 ? param95 : param95)))) ? ((((|param95) ? (8'ha4) : (8'haa)) >> param95) <= {param95, {(^~param95)}}) : (((-(param95 ? param95 : param95)) | param95) ? (((~param95) >= {(8'ha5)}) ? {param95} : {{param95, param95}, (param95 & param95)}) : (|{(param95 ? param95 : param95)}))))
(y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'h296):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire11;
  input wire signed [(5'h15):(1'h0)] wire10;
  input wire [(4'he):(1'h0)] wire9;
  input wire [(2'h2):(1'h0)] wire8;
  wire signed [(3'h7):(1'h0)] wire94;
  wire [(2'h3):(1'h0)] wire93;
  wire [(4'h8):(1'h0)] wire92;
  wire [(4'hf):(1'h0)] wire91;
  wire signed [(2'h3):(1'h0)] wire89;
  wire [(4'h9):(1'h0)] wire46;
  wire signed [(5'h13):(1'h0)] wire45;
  wire signed [(4'h9):(1'h0)] wire44;
  wire signed [(5'h13):(1'h0)] wire43;
  wire signed [(4'ha):(1'h0)] wire42;
  wire [(5'h11):(1'h0)] wire26;
  wire [(4'h9):(1'h0)] wire25;
  wire signed [(3'h4):(1'h0)] wire24;
  wire [(5'h11):(1'h0)] wire13;
  wire signed [(5'h14):(1'h0)] wire12;
  reg signed [(5'h10):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg57 = (1'h0);
  reg [(4'he):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg54 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg53 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg52 = (1'h0);
  reg [(3'h6):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg49 = (1'h0);
  reg [(4'hd):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg41 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg39 = (1'h0);
  reg [(4'hc):(1'h0)] reg38 = (1'h0);
  reg signed [(4'he):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg36 = (1'h0);
  reg [(4'hf):(1'h0)] reg35 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg34 = (1'h0);
  reg [(5'h14):(1'h0)] reg33 = (1'h0);
  reg [(4'ha):(1'h0)] reg32 = (1'h0);
  reg [(5'h13):(1'h0)] reg31 = (1'h0);
  reg [(3'h6):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg29 = (1'h0);
  reg [(5'h13):(1'h0)] reg28 = (1'h0);
  reg [(5'h13):(1'h0)] reg27 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg23 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg22 = (1'h0);
  reg [(4'hf):(1'h0)] reg21 = (1'h0);
  reg [(5'h13):(1'h0)] reg20 = (1'h0);
  reg [(3'h5):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg18 = (1'h0);
  reg signed [(4'he):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg14 = (1'h0);
  assign y = {wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire89,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire26,
                 wire25,
                 wire24,
                 wire13,
                 wire12,
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
  assign wire12 = ($signed(wire10[(3'h6):(1'h0)]) ?
                      wire9 : $signed($unsigned($unsigned((~|wire9)))));
  assign wire13 = wire9;
  always
    @(posedge clk) begin
      if (wire9)
        begin
          reg14 <= $signed({$unsigned(({wire11} ?
                  $unsigned(wire8) : (+wire13)))});
          if ($signed($signed(wire8)))
            begin
              reg15 <= {(+$signed(((wire11 + wire9) ?
                      wire10[(5'h12):(4'h8)] : $signed(wire12))))};
              reg16 <= wire8[(1'h1):(1'h1)];
              reg17 <= ({($signed((reg15 ?
                      wire8 : wire9)) ^~ (reg14[(3'h7):(3'h7)] >= $signed((8'hae))))} && {$unsigned($unsigned(reg15[(3'h5):(1'h0)]))});
              reg18 <= (($unsigned((~|wire9[(4'h8):(3'h4)])) ?
                  ($unsigned($unsigned(reg16)) ?
                      wire10[(3'h5):(2'h3)] : {(!wire13)}) : $unsigned(wire9[(1'h1):(1'h0)])) <= $signed(wire9[(3'h6):(3'h5)]));
              reg19 <= $unsigned((+($signed(((7'h43) ?
                  wire10 : wire10)) && (~|reg18[(2'h3):(2'h3)]))));
            end
          else
            begin
              reg15 <= $signed((wire9[(3'h5):(3'h4)] ?
                  (({reg17, wire9} ? ((7'h44) ~^ wire10) : (+wire11)) ?
                      ($unsigned(wire9) & (wire8 >> reg19)) : (reg19 & (8'ha1))) : ($unsigned((8'hb2)) ?
                      (!$signed(reg17)) : reg18)));
            end
        end
      else
        begin
          reg14 <= {((~|(^(wire13 <<< (8'hb4)))) ?
                  (($unsigned(reg19) >= (reg18 ?
                      reg15 : wire9)) && $unsigned((reg14 ?
                      wire9 : wire11))) : reg14),
              reg17};
          reg15 <= {((wire12 && reg19[(3'h4):(2'h2)]) ?
                  $unsigned({((8'ha8) ? reg14 : wire13),
                      $signed(wire12)}) : wire10),
              (~|(8'hb0))};
          if (reg14)
            begin
              reg16 <= {($signed(reg15) ?
                      (8'ha7) : $signed($unsigned((^~reg18))))};
              reg17 <= reg18;
              reg18 <= (!$signed(reg17));
            end
          else
            begin
              reg16 <= ({$signed($signed($unsigned(reg18))),
                  wire9[(4'h8):(1'h1)]} * $signed($unsigned((((8'hb9) ?
                  reg19 : (8'hbf)) || (~&wire11)))));
            end
        end
      reg20 <= (+((+reg18) ?
          {wire13, $signed(wire9[(3'h5):(3'h5)])} : (+(8'hab))));
      reg21 <= ($unsigned(wire8) ?
          (~^(wire10 && reg19[(1'h1):(1'h1)])) : {(!((7'h40) ?
                  reg15 : $signed(reg19)))});
      reg22 <= (reg19 ?
          (((wire8[(2'h2):(2'h2)] ?
              (reg15 ? wire12 : reg15) : (reg21 ?
                  reg16 : reg14)) ^ (wire8[(1'h1):(1'h0)] >>> $signed(reg16))) ~^ (!((reg17 ?
              reg15 : reg16) < wire12[(4'hc):(4'h8)]))) : ($signed((+((8'hb5) != reg18))) ?
              $signed((wire8 ? reg20 : reg14[(2'h3):(2'h2)])) : (((wire13 ?
                      (7'h42) : wire10) >> (reg19 < reg21)) ?
                  $unsigned({wire9}) : $signed((8'hae)))));
      reg23 <= {{reg14, {{$signed(reg15)}, (&(wire10 ? reg21 : reg19))}},
          reg22[(2'h3):(2'h3)]};
    end
  assign wire24 = wire13;
  assign wire25 = reg14[(3'h5):(2'h2)];
  assign wire26 = reg19;
  always
    @(posedge clk) begin
      reg27 <= (~^(($signed({wire13}) == ($signed(reg16) ?
          {wire25} : $signed(reg20))) != (^~$unsigned((wire13 & (8'hbf))))));
      reg28 <= (^~wire12[(2'h3):(1'h1)]);
      reg29 <= wire24;
      if (($signed((~($unsigned(wire9) >>> {wire24}))) ^~ $unsigned(((-reg15[(3'h5):(3'h4)]) << $signed((reg17 ?
          reg18 : reg27))))))
        begin
          reg30 <= $unsigned(reg27[(4'hc):(3'h7)]);
          reg31 <= $signed((~reg15));
          reg32 <= reg18;
          if (({$unsigned({$unsigned(reg28), (+reg18)})} ?
              wire10[(4'ha):(3'h7)] : $unsigned(reg28[(4'he):(4'hc)])))
            begin
              reg33 <= $signed(((~&reg19[(1'h1):(1'h0)]) - $signed(((8'hbc) ?
                  reg29[(3'h4):(2'h2)] : ((8'hb9) < reg31)))));
              reg34 <= reg14[(1'h1):(1'h1)];
              reg35 <= $signed((reg31 >> reg27[(4'h8):(3'h5)]));
            end
          else
            begin
              reg33 <= (^$signed(((~{reg22}) ?
                  (~reg23) : (((7'h41) > reg32) ?
                      $signed(reg28) : $unsigned(reg31)))));
              reg34 <= ((($unsigned((reg31 >= wire25)) ?
                          $signed($unsigned((7'h44))) : reg16) ?
                      $unsigned(reg18) : reg20[(5'h12):(4'hd)]) ?
                  (|($unsigned({reg17,
                      reg21}) * $signed(reg23[(3'h7):(2'h2)]))) : ((reg17[(4'hc):(3'h4)] ?
                          reg21[(2'h2):(1'h1)] : ($signed(reg33) ?
                              reg14[(1'h0):(1'h0)] : $signed(reg35))) ?
                      (reg22[(4'h9):(3'h5)] + wire25) : $signed(wire24)));
              reg35 <= wire26;
              reg36 <= wire9;
              reg37 <= $signed((8'ha5));
            end
          if ({($signed(((wire12 ~^ (8'ha6)) ?
                  ((8'ha3) ? reg28 : wire13) : (wire26 ?
                      (8'had) : (7'h40)))) ~^ ($unsigned((reg23 ?
                  wire11 : reg36)) && $unsigned(reg20[(4'hc):(3'h5)])))})
            begin
              reg38 <= ({$signed((((8'hab) | reg32) | (reg29 ^~ wire25))),
                      wire13} ?
                  (^~(reg20 ?
                      (~^(wire24 ?
                          reg33 : reg37)) : reg32[(2'h2):(2'h2)])) : $signed(reg23[(1'h0):(1'h0)]));
              reg39 <= (reg14 ? wire8 : $signed(wire12));
            end
          else
            begin
              reg38 <= (((({wire24} <<< (~|reg38)) ^ $unsigned((wire13 >> reg22))) << ($unsigned((~reg33)) ?
                  {$signed(wire26), $unsigned(reg33)} : ($unsigned(wire26) ?
                      reg18[(3'h6):(1'h0)] : (8'hb5)))) >= (^~$unsigned((((8'hac) ?
                      reg38 : reg19) ?
                  {reg35, reg20} : $unsigned((8'h9c))))));
              reg39 <= (&{(wire10 ?
                      $unsigned(reg30[(1'h1):(1'h0)]) : $unsigned((wire26 >> wire8)))});
              reg40 <= $signed({reg19, reg19[(2'h2):(2'h2)]});
              reg41 <= $unsigned(reg18[(4'hb):(4'ha)]);
            end
        end
      else
        begin
          reg30 <= $signed((wire25[(3'h4):(1'h1)] ?
              ($signed(reg23[(4'h9):(4'h8)]) > $unsigned((^wire8))) : ((|(reg22 ?
                      reg34 : reg34)) ?
                  reg21 : wire9)));
          reg31 <= reg28[(3'h7):(2'h2)];
          if ($signed(reg29[(1'h0):(1'h0)]))
            begin
              reg32 <= reg33[(4'h8):(3'h6)];
              reg33 <= {reg34[(1'h1):(1'h1)],
                  ((((reg36 > (7'h40)) ?
                      wire13[(1'h1):(1'h0)] : $signed(reg39)) & reg17) >> $signed((8'ha3)))};
            end
          else
            begin
              reg32 <= ((+{reg36,
                  $unsigned($unsigned(reg40))}) >>> wire9[(3'h7):(1'h1)]);
              reg33 <= (-(^~$signed((~^$signed(reg21)))));
            end
          reg34 <= $signed($unsigned(({reg33,
              (^wire26)} || $signed((~reg14)))));
          reg35 <= $signed(((^$unsigned(reg18[(4'hb):(3'h6)])) || (+reg14[(2'h2):(2'h2)])));
        end
    end
  assign wire42 = wire26;
  assign wire43 = $unsigned({(~&{reg36[(2'h3):(1'h1)]}), (!(8'h9c))});
  assign wire44 = $unsigned((($signed((!reg15)) & (8'hac)) >= wire11[(4'h9):(2'h3)]));
  assign wire45 = (reg22[(4'ha):(4'h9)] & {{$signed({reg34}),
                          ($unsigned(reg33) ?
                              ((8'hb8) != (8'hb9)) : $unsigned((8'hbd)))}});
  assign wire46 = reg16;
  always
    @(posedge clk) begin
      if ($signed(((^{(8'hb1), {wire8, (8'hb0)}}) ?
          (($signed(reg28) >> $unsigned(wire44)) ?
              (reg22[(2'h2):(1'h0)] ?
                  ((8'hb1) ? (8'hb9) : reg35) : (reg32 ?
                      reg16 : wire13)) : (reg39[(4'hb):(3'h7)] ?
                  $unsigned((8'hb2)) : (+wire10))) : $unsigned((8'h9e)))))
        begin
          if ($unsigned(reg15))
            begin
              reg47 <= $unsigned($signed((~^(|reg34))));
            end
          else
            begin
              reg47 <= (8'hb7);
              reg48 <= {(-wire11[(1'h1):(1'h0)])};
              reg49 <= (wire46 >> ((wire46 == ((reg15 == reg28) <<< reg27[(4'hd):(1'h0)])) ?
                  $signed($signed(reg37)) : ($unsigned(reg48[(1'h0):(1'h0)]) ^~ (|$unsigned((8'h9f))))));
            end
          reg50 <= reg22[(3'h6):(2'h3)];
          reg51 <= $unsigned((8'hb5));
          reg52 <= reg48[(4'h9):(4'h8)];
        end
      else
        begin
          reg47 <= $signed($signed((wire12 || {wire46, $signed((8'hbd))})));
          if (reg33[(4'hc):(1'h0)])
            begin
              reg48 <= $unsigned(reg49);
              reg49 <= $unsigned((((reg17[(3'h6):(2'h3)] > (wire8 + reg18)) ?
                      {(8'hae),
                          (wire24 ? reg27 : reg33)} : $unsigned((^reg16))) ?
                  reg48[(4'h9):(4'h8)] : $unsigned($signed((reg30 && reg52)))));
              reg50 <= (8'hbc);
              reg51 <= $unsigned(wire26);
            end
          else
            begin
              reg48 <= $unsigned((wire45 - wire13[(4'hc):(1'h1)]));
              reg49 <= reg29[(1'h1):(1'h1)];
              reg50 <= (reg34[(1'h0):(1'h0)] ?
                  (reg19 ?
                      $unsigned(((wire9 << wire25) & {(8'hb2)})) : (^wire8[(1'h0):(1'h0)])) : ($signed((7'h44)) ?
                      (~$unsigned(reg20)) : ($signed((^(8'hb6))) | $signed($unsigned(reg33)))));
            end
          reg52 <= (^(^~((^~((8'ha4) ? wire10 : reg40)) ?
              $signed(reg21[(2'h3):(2'h2)]) : {(8'hb8),
                  reg38[(4'h9):(2'h2)]})));
        end
      reg53 <= $unsigned(wire46[(4'h8):(3'h4)]);
      if ((($unsigned($signed($signed(reg22))) - reg21) ?
          $unsigned({{(wire43 ? reg51 : reg27),
                  reg32}}) : {reg37[(4'h8):(3'h5)]}))
        begin
          reg54 <= ($unsigned((~|{$unsigned((8'h9d))})) ?
              (wire8[(2'h2):(2'h2)] ^~ (^(reg21 << (wire46 ?
                  reg32 : reg20)))) : {{$unsigned($unsigned(wire11))}});
          if (reg19[(2'h2):(1'h1)])
            begin
              reg55 <= (reg19 <= reg28);
              reg56 <= reg20;
            end
          else
            begin
              reg55 <= (((($unsigned(reg37) ?
                      (~|reg39) : $unsigned(reg21)) + reg48[(4'ha):(1'h1)]) > reg28[(4'hc):(3'h7)]) ?
                  $unsigned(reg23[(3'h7):(3'h4)]) : {reg16[(1'h1):(1'h0)],
                      wire25[(4'h9):(3'h7)]});
              reg56 <= reg41[(4'ha):(2'h2)];
            end
          reg57 <= ((^($signed((reg19 >= (7'h41))) ^~ ($signed(wire24) - {reg38,
                  reg28}))) ?
              $unsigned(((wire24 ~^ (8'h9d)) <<< reg47)) : ($signed(((~^reg31) ?
                      (-wire42) : (reg39 ? reg28 : reg39))) ?
                  (8'hb7) : reg55[(3'h6):(2'h3)]));
          reg58 <= (8'ha9);
        end
      else
        begin
          reg54 <= {((~^$unsigned(reg49[(4'hb):(1'h1)])) && reg58[(1'h0):(1'h0)]),
              reg21};
          reg55 <= reg36;
        end
      reg59 <= reg39;
    end
  module60 #() modinst90 (wire89, clk, reg50, reg55, reg39, reg52);
  assign wire91 = $unsigned(reg48[(2'h3):(1'h0)]);
  assign wire92 = $unsigned(reg20);
  assign wire93 = $unsigned((8'ha5));
  assign wire94 = {wire25[(2'h2):(1'h1)]};
endmodule

module module60
#(parameter param87 = ((((((8'ha1) ? (8'hbb) : (8'ha9)) ^~ ((8'ha2) ? (8'hac) : (8'hab))) | ((8'ha5) << {(7'h43), (7'h41)})) ? ({(~|(8'ha4)), ((8'ha7) ? (8'hbb) : (8'hb7))} > ((~&(8'ha4)) ^~ (^~(8'ha4)))) : ((((8'hb8) > (8'h9d)) < {(8'hbe), (8'h9e)}) ? (8'ha2) : {(~&(8'hb8)), ((8'h9c) ~^ (8'hb7))})) ? ({((+(8'h9e)) && ((7'h43) || (8'ha0)))} ^~ ((((8'haa) >>> (8'ha1)) ? ((7'h44) & (8'ha7)) : ((7'h44) ? (8'hb4) : (8'hb3))) >= {((8'hba) ? (8'haa) : (8'ha9))})) : {{({(8'hb9), (8'hb4)} ? ((8'haa) ^ (8'hbe)) : ((7'h41) >>> (8'ha9))), (~{(8'ha5)})}}), 
parameter param88 = (~&((|{(~|(8'hb6))}) == (^((param87 >= param87) ? (param87 ? param87 : param87) : (param87 + param87))))))
(y, clk, wire64, wire63, wire62, wire61);
  output wire [(32'h100):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire64;
  input wire [(5'h14):(1'h0)] wire63;
  input wire [(5'h11):(1'h0)] wire62;
  input wire [(2'h2):(1'h0)] wire61;
  wire signed [(4'hb):(1'h0)] wire86;
  wire [(4'hb):(1'h0)] wire85;
  wire [(5'h13):(1'h0)] wire84;
  wire [(4'ha):(1'h0)] wire83;
  wire signed [(3'h4):(1'h0)] wire82;
  wire signed [(2'h3):(1'h0)] wire81;
  wire signed [(4'hb):(1'h0)] wire80;
  wire [(4'hf):(1'h0)] wire79;
  wire [(4'h9):(1'h0)] wire78;
  wire signed [(5'h15):(1'h0)] wire74;
  wire [(2'h3):(1'h0)] wire73;
  wire [(4'hc):(1'h0)] wire66;
  wire signed [(5'h11):(1'h0)] wire65;
  reg [(4'ha):(1'h0)] reg77 = (1'h0);
  reg [(5'h11):(1'h0)] reg76 = (1'h0);
  reg [(5'h12):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg72 = (1'h0);
  reg [(3'h4):(1'h0)] reg71 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg70 = (1'h0);
  reg [(4'hb):(1'h0)] reg69 = (1'h0);
  reg [(4'hf):(1'h0)] reg68 = (1'h0);
  reg [(3'h6):(1'h0)] reg67 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire74,
                 wire73,
                 wire66,
                 wire65,
                 reg77,
                 reg76,
                 reg75,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 (1'h0)};
  assign wire65 = $signed((|{(!{wire64})}));
  assign wire66 = (wire62 + (7'h40));
  always
    @(posedge clk) begin
      reg67 <= wire61;
      reg68 <= wire64[(2'h2):(2'h2)];
    end
  always
    @(posedge clk) begin
      reg69 <= reg68;
      reg70 <= (+($signed($signed((reg68 ? reg67 : wire61))) ?
          $signed(reg69) : {($signed(wire64) ?
                  ((8'ha5) ? reg68 : wire62) : (8'had))}));
    end
  always
    @(posedge clk) begin
      reg71 <= ((((~^(-(8'hba))) <= (-{(8'hb7),
              wire62})) >> (((wire65 & wire64) ?
                  {wire62, wire66} : $unsigned(wire63)) ?
              reg68[(2'h3):(1'h0)] : (wire66[(2'h2):(1'h1)] ^ (~wire61)))) ?
          $unsigned(reg67[(2'h2):(1'h0)]) : ((reg68 & ($unsigned(wire65) <= (wire61 ?
              (8'hb0) : wire65))) - $unsigned(reg67[(3'h5):(1'h0)])));
      reg72 <= $signed((^~$signed((-wire61[(2'h2):(2'h2)]))));
    end
  assign wire73 = (~^(-($unsigned((8'hb2)) <= $unsigned((!(8'ha8))))));
  assign wire74 = (wire65 ?
                      (({(wire61 == reg72),
                              (wire66 ^ (8'h9c))} != ($unsigned((8'ha4)) ?
                              (wire61 ?
                                  wire73 : (8'ha8)) : wire61[(1'h0):(1'h0)])) ?
                          $signed(((reg70 << wire62) ?
                              {wire65,
                                  reg68} : (~|wire63))) : wire61[(1'h0):(1'h0)]) : wire66);
  always
    @(posedge clk) begin
      reg75 <= ((^(~|wire61[(2'h2):(1'h1)])) - (($signed(reg67[(3'h4):(1'h1)]) ?
          wire74[(1'h1):(1'h1)] : $unsigned((wire73 ?
              wire73 : wire64))) && wire64[(1'h0):(1'h0)]));
      reg76 <= {(^~{reg72[(1'h0):(1'h0)], $unsigned(reg72[(3'h6):(3'h4)])})};
      reg77 <= ($unsigned((reg67[(3'h6):(1'h0)] ?
          {{wire66, (8'hbd)},
              (-reg67)} : $unsigned($signed(wire73)))) >>> $unsigned((^~$signed((reg76 ^~ reg70)))));
    end
  assign wire78 = ($signed(reg68[(1'h0):(1'h0)]) & reg76);
  assign wire79 = $signed($unsigned({wire78[(3'h4):(1'h1)]}));
  assign wire80 = (^$unsigned({$signed(((8'h9e) <<< (8'hbb))),
                      reg75[(4'h8):(2'h3)]}));
  assign wire81 = (!{((~|{reg68,
                          wire74}) & ((reg67 <<< wire73) != wire61[(1'h1):(1'h1)]))});
  assign wire82 = ({reg75[(3'h7):(3'h4)],
                      (($signed((8'ha9)) >>> (&reg76)) || (!((7'h40) ?
                          reg72 : reg71)))} == (wire73 ?
                      (^reg67[(2'h2):(1'h1)]) : $signed({reg68[(4'ha):(3'h5)],
                          reg69[(3'h4):(1'h0)]})));
  assign wire83 = (((reg69[(3'h4):(2'h2)] ?
                              $signed(wire82[(1'h1):(1'h1)]) : ($unsigned(wire80) >> (~^wire61))) ?
                          ({(reg77 ? wire65 : wire73)} ?
                              (((7'h42) ? wire79 : reg77) ?
                                  wire66 : (~|wire63)) : $unsigned((reg76 & wire74))) : $signed(wire82)) ?
                      {$unsigned($signed(wire66[(4'hc):(4'h9)]))} : (|(-(wire63 ~^ (~&reg68)))));
  assign wire84 = $signed($unsigned(wire80[(4'h9):(2'h3)]));
  assign wire85 = wire74;
  assign wire86 = $signed((wire64 ? (~|wire80) : reg68[(4'hb):(3'h4)]));
endmodule
