module top
#(parameter param77 = {((~{((8'ha0) != (8'hbb))}) + ((^((8'hbd) ? (8'ha7) : (8'hba))) < {((8'hab) >= (8'hb3)), ((7'h43) ? (8'ha1) : (8'hba))})), (8'ha5)}, 
parameter param78 = (((!param77) ? {(param77 ? {param77, (7'h42)} : (param77 << param77))} : (-(param77 < param77))) ? (param77 ~^ (((param77 ? param77 : param77) ? param77 : (8'hb7)) <<< (param77 > (-param77)))) : (({(8'hbf)} >= param77) ? ({(param77 ~^ param77)} ^~ ((param77 ? param77 : param77) ? (^(8'hbb)) : {param77})) : ((~^(param77 ? (8'hab) : param77)) & (((8'hbe) ? (7'h44) : param77) ? (param77 ? (8'hae) : param77) : (~&param77))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h22a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire0;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire4;
  wire [(3'h5):(1'h0)] wire68;
  wire signed [(2'h3):(1'h0)] wire67;
  wire signed [(5'h15):(1'h0)] wire66;
  wire [(4'hf):(1'h0)] wire65;
  wire signed [(5'h13):(1'h0)] wire64;
  wire [(4'hd):(1'h0)] wire63;
  wire [(5'h14):(1'h0)] wire62;
  wire [(3'h4):(1'h0)] wire61;
  wire signed [(5'h14):(1'h0)] wire60;
  wire signed [(3'h7):(1'h0)] wire59;
  wire [(5'h11):(1'h0)] wire5;
  wire signed [(4'h9):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire29;
  reg [(4'hc):(1'h0)] reg76 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg75 = (1'h0);
  reg [(4'he):(1'h0)] reg74 = (1'h0);
  reg [(4'ha):(1'h0)] reg73 = (1'h0);
  reg signed [(4'he):(1'h0)] reg72 = (1'h0);
  reg [(2'h3):(1'h0)] reg71 = (1'h0);
  reg [(4'hc):(1'h0)] reg70 = (1'h0);
  reg [(5'h10):(1'h0)] reg69 = (1'h0);
  reg [(3'h6):(1'h0)] reg58 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg57 = (1'h0);
  reg [(4'hf):(1'h0)] reg56 = (1'h0);
  reg [(3'h7):(1'h0)] reg55 = (1'h0);
  reg [(4'hd):(1'h0)] reg54 = (1'h0);
  reg [(3'h6):(1'h0)] reg53 = (1'h0);
  reg [(4'hb):(1'h0)] reg52 = (1'h0);
  reg [(3'h6):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg48 = (1'h0);
  reg [(2'h2):(1'h0)] reg47 = (1'h0);
  reg [(4'hf):(1'h0)] reg46 = (1'h0);
  reg [(3'h4):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg44 = (1'h0);
  reg [(3'h5):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg42 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg41 = (1'h0);
  reg [(4'hc):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg34 = (1'h0);
  reg [(4'hf):(1'h0)] reg33 = (1'h0);
  reg [(2'h2):(1'h0)] reg32 = (1'h0);
  reg [(5'h10):(1'h0)] reg31 = (1'h0);
  assign y = {wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire5,
                 wire6,
                 wire29,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
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
                 (1'h0)};
  assign wire5 = wire3[(4'h9):(3'h7)];
  assign wire6 = ((|wire2[(5'h12):(4'he)]) ? wire3 : (&wire2));
  module7 #() modinst30 (wire29, clk, wire5, wire4, wire2, wire6, wire1);
  always
    @(posedge clk) begin
      reg31 <= {$signed(($signed({wire4}) >>> (~|$unsigned(wire6)))),
          ($signed((-wire2)) ? (~(|$signed(wire29))) : wire1[(2'h3):(1'h0)])};
      reg32 <= (+$unsigned({wire2}));
      if ({{((wire0[(3'h4):(1'h0)] ?
                  wire0 : {wire2}) && (wire5[(4'he):(4'ha)] && wire6))},
          {reg32[(2'h2):(1'h0)]}})
        begin
          if ((~^wire5))
            begin
              reg33 <= (^~((wire5 + wire29) >>> wire2));
              reg34 <= ((wire3[(3'h7):(3'h7)] >>> (8'ha7)) * $unsigned((wire5 >>> (reg33[(4'hf):(2'h3)] ?
                  (wire1 || wire0) : (wire5 ? wire29 : wire2)))));
              reg35 <= (&($signed({reg32, wire3}) << (((reg32 ? wire5 : reg33) ?
                  $signed(wire5) : (wire5 ?
                      reg32 : wire6)) >= reg31[(4'h9):(1'h0)])));
              reg36 <= ((^~(+$signed($unsigned(wire29)))) || $signed((-wire1[(1'h1):(1'h0)])));
              reg37 <= wire5;
            end
          else
            begin
              reg33 <= (~&$unsigned(((8'haa) * ($signed(reg37) < (~reg36)))));
              reg34 <= wire4;
              reg35 <= wire3[(4'h8):(4'h8)];
              reg36 <= (wire5 ?
                  {$unsigned($unsigned((reg33 - reg35))),
                      (^wire29[(2'h3):(2'h2)])} : (|$signed(reg32)));
            end
          reg38 <= reg31;
          reg39 <= reg33;
          reg40 <= $signed($signed($signed(reg39[(4'h8):(3'h6)])));
        end
      else
        begin
          if ($signed(reg31[(4'hb):(1'h0)]))
            begin
              reg33 <= (((~&((reg38 ? reg40 : wire4) >> (reg37 <= reg35))) ?
                  (($unsigned(reg37) ?
                      (wire5 - reg38) : (reg33 ?
                          (8'ha8) : (7'h42))) == (8'hae)) : (({reg40,
                      (8'ha8)} > $unsigned(wire1)) ^~ ({wire3} ?
                      reg37 : $unsigned((8'hb8))))) > ({(~&(8'hb7)),
                  $unsigned($signed(reg39))} ^~ $signed($unsigned((^~reg38)))));
              reg34 <= ($unsigned(($signed((reg35 ? reg37 : reg36)) && wire1)) ?
                  reg36 : reg33[(4'h8):(2'h3)]);
              reg35 <= ($signed($signed(wire6[(4'h8):(1'h0)])) >>> wire29[(2'h3):(1'h1)]);
              reg36 <= $unsigned((($signed(wire6) ~^ wire1) ?
                  (|$signed($unsigned(wire0))) : reg31));
              reg37 <= $signed($unsigned(($signed(wire1[(3'h4):(2'h2)]) ?
                  ($unsigned(wire5) ? (&reg34) : $signed((8'hbb))) : (reg39 ?
                      (^reg39) : $unsigned(reg39)))));
            end
          else
            begin
              reg33 <= (~&{(~|reg37), wire5[(4'h9):(3'h6)]});
              reg34 <= (((&$signed($signed(wire3))) * $unsigned($unsigned((reg32 ?
                      wire3 : (8'h9f))))) ?
                  (~|$signed((reg31 > (reg31 ?
                      (8'hb3) : reg36)))) : $signed({reg35[(3'h4):(1'h1)],
                      (&((8'hb7) ? reg36 : reg39))}));
              reg35 <= {{wire29,
                      ((reg37 ?
                          ((8'ha3) ?
                              reg31 : reg38) : ((8'ha5) ~^ reg39)) * wire1[(2'h3):(1'h1)])}};
              reg36 <= {$signed(($unsigned((~(8'ha5))) ?
                      (+wire5) : $unsigned(wire0)))};
              reg37 <= reg32[(1'h0):(1'h0)];
            end
          reg38 <= reg40;
          reg39 <= (((^~$signed((!reg32))) ?
              (&$unsigned((wire5 ^~ (7'h43)))) : reg31) + $unsigned((((~&wire5) == (reg31 ?
              reg36 : reg35)) < reg32)));
          reg40 <= reg35;
        end
      if (wire6)
        begin
          if ((((~&((~|(7'h40)) ^ {reg40})) | $signed(($unsigned(reg40) == {reg38}))) >> (8'h9d)))
            begin
              reg41 <= $unsigned(reg40[(4'h9):(1'h0)]);
              reg42 <= (-reg36[(1'h0):(1'h0)]);
              reg43 <= (-($signed((^(reg38 ~^ reg31))) ?
                  reg37[(3'h5):(1'h1)] : reg34));
            end
          else
            begin
              reg41 <= (!reg43);
              reg42 <= (8'hb1);
              reg43 <= (|(reg38[(3'h4):(3'h4)] ?
                  (($signed(wire4) != reg39[(3'h4):(1'h0)]) <<< reg37[(2'h2):(2'h2)]) : $unsigned($unsigned($unsigned(reg32)))));
              reg44 <= $unsigned(($unsigned(wire4[(4'h8):(1'h1)]) ?
                  $signed(((reg31 - reg39) - $unsigned(wire29))) : $signed((reg32[(2'h2):(1'h0)] ^~ (-reg36)))));
              reg45 <= {((wire5[(4'hb):(1'h0)] ?
                          $unsigned((reg32 ?
                              reg37 : reg34)) : $signed((wire1 && (7'h43)))) ?
                      {$unsigned($unsigned((8'ha9)))} : ($unsigned((^~wire2)) < $unsigned({reg42})))};
            end
          if ((7'h42))
            begin
              reg46 <= {(+(&$unsigned(reg45[(2'h2):(2'h2)])))};
              reg47 <= (wire4 | (($signed((8'hb3)) && ($signed((8'ha4)) ?
                      {reg32, wire6} : wire4)) ?
                  $signed((wire6[(2'h2):(1'h1)] ~^ $signed(reg36))) : $signed({reg41[(2'h2):(1'h0)]})));
              reg48 <= reg47[(1'h0):(1'h0)];
              reg49 <= wire4[(2'h3):(1'h1)];
            end
          else
            begin
              reg46 <= wire3;
            end
          reg50 <= reg41;
          reg51 <= (reg47[(1'h0):(1'h0)] >= $signed({wire29[(2'h2):(2'h2)],
              reg42}));
          if (wire5)
            begin
              reg52 <= wire1;
              reg53 <= reg36;
              reg54 <= $unsigned(reg44);
            end
          else
            begin
              reg52 <= reg41;
              reg53 <= ((reg49 <= (+reg42[(4'he):(4'hd)])) && (~&($unsigned({wire4}) == $unsigned((wire6 ?
                  reg50 : (8'hba))))));
              reg54 <= (~|wire3[(4'h9):(4'h8)]);
              reg55 <= ((~^$signed(reg43)) ?
                  $signed(({(8'ha7)} ?
                      {(wire2 ? wire4 : wire3), (8'h9d)} : (~(reg37 ?
                          reg50 : (8'hbf))))) : reg54[(2'h3):(1'h0)]);
              reg56 <= reg31;
            end
        end
      else
        begin
          if (reg39[(4'hd):(4'h8)])
            begin
              reg41 <= (~|(^reg39));
              reg42 <= ((($signed((^~wire5)) ?
                      reg51 : ((reg54 ~^ reg39) ?
                          (reg43 ~^ wire4) : (reg53 >>> reg37))) ?
                  $signed($signed(reg52[(3'h4):(1'h1)])) : (((reg55 ?
                              (8'hb4) : (8'had)) ?
                          (-reg47) : (~|reg52)) ?
                      $unsigned((~|wire6)) : $unsigned((reg51 ?
                          reg55 : reg33)))) + (!$unsigned(reg33)));
            end
          else
            begin
              reg41 <= (reg35 || ($unsigned(((wire1 ? wire3 : reg50) ?
                      reg43 : {reg41})) ?
                  (~^$unsigned((reg35 >> reg53))) : $unsigned(((reg42 + reg53) ?
                      ((8'ha5) ^ wire0) : $unsigned(reg48)))));
              reg42 <= (~($signed($signed($unsigned(wire6))) > {{(~&reg46)}}));
              reg43 <= (((!({wire29, (8'ha7)} ?
                      (reg49 ? reg41 : reg42) : $unsigned((8'hb5)))) ?
                  $signed(((reg44 ? (8'hb3) : reg32) ?
                      $unsigned(reg46) : reg43[(3'h4):(1'h0)])) : reg37) || $unsigned(reg34[(4'ha):(1'h1)]));
              reg44 <= (((!((wire6 ? (8'hbb) : reg36) ? (8'ha9) : (~|reg52))) ?
                  $unsigned(reg49) : $signed($signed((reg36 ?
                      reg50 : reg31)))) > ({((reg41 ?
                      reg39 : wire6) <<< wire5[(4'h9):(3'h7)])} <= $signed($signed((reg52 ?
                  (8'ha2) : reg32)))));
            end
        end
      reg57 <= (+(!((reg54 ? $signed(wire6) : $signed(reg53)) ?
          ($signed(wire5) ^~ ((7'h40) ?
              reg42 : (8'haa))) : reg35[(3'h5):(1'h0)])));
    end
  always
    @(posedge clk) begin
      reg58 <= (($signed(((reg44 - reg34) ?
          (|(8'haf)) : reg35[(2'h2):(1'h0)])) > reg43) <<< $signed((8'hbc)));
    end
  assign wire59 = (($signed($unsigned((reg42 << reg32))) != (reg55[(1'h1):(1'h0)] ?
                      ((wire5 ? reg55 : wire29) ?
                          {reg36,
                              reg57} : reg39) : reg57[(2'h2):(1'h1)])) == (8'hb9));
  assign wire60 = (7'h42);
  assign wire61 = (reg44[(3'h5):(2'h3)] ^~ {(~|((reg33 ?
                          reg42 : wire0) || {wire0}))});
  assign wire62 = ($signed(reg49) ~^ ($unsigned((reg48[(3'h4):(3'h4)] == (~wire5))) << $unsigned((8'h9c))));
  assign wire63 = reg40;
  assign wire64 = (wire3 && (wire2 ?
                      (reg47 ?
                          wire60[(5'h12):(2'h2)] : ((^reg36) ?
                              (reg40 <= wire61) : reg39[(2'h3):(2'h3)])) : reg49));
  assign wire65 = reg52[(2'h2):(2'h2)];
  assign wire66 = ((wire3 ?
                          $unsigned({reg42[(4'he):(1'h0)],
                              wire6}) : ($signed(wire3) != (8'h9c))) ?
                      $unsigned((($signed(wire61) ?
                          (~&reg54) : reg42) << reg42)) : (~(~^$signed((!reg39)))));
  assign wire67 = wire66[(4'he):(2'h2)];
  assign wire68 = (8'hbf);
  always
    @(posedge clk) begin
      if ($unsigned($unsigned({reg47[(1'h0):(1'h0)]})))
        begin
          if (((({$unsigned(wire2), wire3} ?
                      reg38[(3'h4):(1'h0)] : $signed({reg41, wire64})) ?
                  wire60 : wire63[(4'ha):(3'h4)]) ?
              ((~^reg58[(1'h1):(1'h0)]) ?
                  $signed(((reg48 ? reg43 : wire59) || {(7'h43),
                      (8'ha1)})) : $unsigned(((wire60 ? (7'h44) : reg55) ?
                      $signed(reg41) : (wire29 ?
                          reg31 : (8'hab))))) : ({{reg33[(2'h3):(2'h2)]},
                  (+$signed(reg34))} && {reg49[(1'h0):(1'h0)]})))
            begin
              reg69 <= (&$unsigned($signed((!$signed((8'ha0))))));
            end
          else
            begin
              reg69 <= (!reg46[(4'h8):(3'h4)]);
              reg70 <= $unsigned(($unsigned((+$unsigned(reg41))) == {($unsigned(wire67) < (reg40 & wire63))}));
              reg71 <= ((reg58[(2'h2):(2'h2)] ?
                      $signed({reg45[(1'h0):(1'h0)],
                          $unsigned(reg39)}) : ({((8'ha3) <<< reg31)} ?
                          reg51 : $signed((|reg41)))) ?
                  (8'hb7) : $unsigned($unsigned($unsigned((+reg52)))));
            end
          reg72 <= $signed((~^$signed((reg54 ?
              reg41[(1'h0):(1'h0)] : {wire5}))));
          reg73 <= reg56[(3'h7):(2'h2)];
        end
      else
        begin
          if ((|(~$signed(((~^reg73) ?
              wire0[(3'h5):(3'h4)] : reg41[(2'h2):(1'h1)])))))
            begin
              reg69 <= ((~|reg41) & $unsigned((((reg33 ? (7'h41) : reg72) ?
                  reg32 : (wire63 << (8'hb4))) && (|$signed(reg51)))));
              reg70 <= (!$unsigned((~$unsigned(reg72[(1'h1):(1'h1)]))));
              reg71 <= $signed((wire59[(1'h1):(1'h0)] ?
                  {$signed((wire6 ? reg72 : reg53)),
                      (reg56[(1'h1):(1'h0)] <<< wire64)} : ((reg35[(3'h5):(2'h3)] ?
                          (8'had) : ((8'hbf) ? reg39 : wire5)) ?
                      reg36 : $unsigned((wire60 > reg39)))));
            end
          else
            begin
              reg69 <= reg55;
              reg70 <= $unsigned(reg44);
              reg71 <= (-wire29[(1'h0):(1'h0)]);
              reg72 <= (8'ha8);
            end
        end
      reg74 <= reg38;
      reg75 <= {($unsigned(wire63) ?
              $signed($signed(wire1[(2'h3):(2'h3)])) : wire63[(4'h9):(3'h4)])};
      reg76 <= (~^{(^(-reg71)), ({(reg48 ? reg39 : (8'hb4))} ~^ reg47)});
    end
endmodule

module module7
#(parameter param27 = {(+(^~(((8'ha6) ? (8'ha1) : (8'h9d)) ? ((8'hbc) > (8'ha6)) : ((8'ha9) ? (8'ha3) : (7'h44))))), (({((8'had) != (8'ha4)), (8'ha7)} ? (^((8'ha9) + (8'hba))) : (|{(8'hb0)})) + ({((8'h9f) || (7'h44))} ? (|((8'ha0) << (8'ha4))) : ((|(8'hb8)) + (-(8'hb2)))))}, 
parameter param28 = ((^(param27 >= param27)) ? (~^(param27 ? {((8'h9c) >>> param27)} : ((param27 - param27) + (~^(8'hb1))))) : (({(-param27), param27} + param27) ? param27 : (param27 ? ((param27 ? param27 : param27) >> {param27, param27}) : {(param27 ? param27 : param27), (8'ha1)}))))
(y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'hdc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire12;
  input wire signed [(3'h4):(1'h0)] wire11;
  input wire signed [(2'h3):(1'h0)] wire10;
  input wire [(4'h8):(1'h0)] wire9;
  input wire [(4'h8):(1'h0)] wire8;
  wire signed [(5'h12):(1'h0)] wire26;
  wire [(5'h14):(1'h0)] wire25;
  wire [(5'h10):(1'h0)] wire24;
  wire [(4'h8):(1'h0)] wire23;
  wire [(5'h14):(1'h0)] wire22;
  wire [(4'h9):(1'h0)] wire21;
  wire [(4'hb):(1'h0)] wire20;
  wire signed [(5'h14):(1'h0)] wire19;
  wire [(5'h14):(1'h0)] wire18;
  wire [(3'h7):(1'h0)] wire17;
  wire signed [(5'h15):(1'h0)] wire16;
  wire signed [(4'h9):(1'h0)] wire15;
  wire signed [(5'h13):(1'h0)] wire14;
  wire signed [(5'h15):(1'h0)] wire13;
  assign y = {wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 (1'h0)};
  assign wire13 = wire12;
  assign wire14 = wire10[(1'h0):(1'h0)];
  assign wire15 = (wire11[(2'h3):(2'h2)] ? (~&(~(8'hb9))) : wire14);
  assign wire16 = wire14;
  assign wire17 = $unsigned(wire12[(4'hf):(4'hc)]);
  assign wire18 = $unsigned((wire10 == wire12[(3'h6):(1'h1)]));
  assign wire19 = $unsigned($signed($unsigned(wire14[(4'h9):(1'h1)])));
  assign wire20 = (wire11 ? wire8[(1'h1):(1'h1)] : wire15);
  assign wire21 = (~^(~|((^(~&wire10)) ?
                      (~^$signed(wire15)) : $signed(wire15))));
  assign wire22 = (wire18 ?
                      {wire10[(2'h3):(2'h2)],
                          ((wire8 ? wire8[(3'h7):(2'h2)] : $unsigned(wire19)) ?
                              wire8[(3'h6):(3'h5)] : wire14[(4'hb):(1'h1)])} : ($unsigned(($unsigned(wire9) ?
                              (8'hbd) : wire16[(2'h3):(1'h0)])) ?
                          ((!(wire11 * (8'ha4))) ?
                              $unsigned($signed(wire13)) : $signed(((8'hbb) * wire17))) : ($signed(wire13) ?
                              (+(wire17 > (7'h44))) : wire13[(4'h9):(2'h2)])));
  assign wire23 = wire12[(5'h10):(1'h1)];
  assign wire24 = (8'hab);
  assign wire25 = wire14[(5'h11):(1'h0)];
  assign wire26 = wire17[(3'h6):(2'h2)];
endmodule
