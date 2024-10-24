module top
#(parameter param85 = (((~(((8'ha5) != (8'hb1)) || ((8'ha1) ? (8'h9c) : (8'ha1)))) <= ((((8'hbe) && (8'h9e)) * ((8'hb2) + (8'ha8))) ? (&{(8'hb5), (8'hbf)}) : ((&(7'h44)) ? ((8'h9d) ? (8'hb3) : (8'hb3)) : (~|(8'hb6))))) ? (8'haf) : {(((+(8'ha9)) ? (^~(8'hac)) : ((8'h9e) ? (8'h9e) : (8'hb9))) ? (8'ha0) : (((8'hb6) ^~ (8'hb6)) ? {(8'hac), (8'hbc)} : ((8'h9e) ? (8'had) : (8'hb2)))), ((((7'h42) ? (8'ha3) : (8'ha8)) <<< (~|(7'h40))) & (((8'h9c) || (8'h9c)) ? ((8'hb2) ? (8'ha7) : (8'ha7)) : ((8'ha8) ? (7'h40) : (8'haf))))}))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h5e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire0;
  input wire [(3'h7):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire4;
  wire signed [(5'h10):(1'h0)] wire84;
  wire [(2'h2):(1'h0)] wire83;
  wire signed [(4'h8):(1'h0)] wire82;
  wire signed [(2'h3):(1'h0)] wire81;
  wire signed [(5'h13):(1'h0)] wire80;
  wire signed [(4'he):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire7;
  wire signed [(4'h9):(1'h0)] wire78;
  assign y = {wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire5,
                 wire6,
                 wire7,
                 wire78,
                 (1'h0)};
  assign wire5 = (^{wire3, wire1[(1'h1):(1'h1)]});
  assign wire6 = (8'hbc);
  assign wire7 = $signed($unsigned(wire5[(4'hc):(3'h5)]));
  module8 #() modinst79 (wire78, clk, wire0, wire3, wire1, wire5, wire2);
  assign wire80 = wire1[(3'h5):(3'h4)];
  assign wire81 = wire7[(2'h3):(1'h1)];
  assign wire82 = $signed(wire2);
  assign wire83 = $signed($signed($signed(($unsigned((8'ha1)) <= wire82[(3'h7):(3'h4)]))));
  assign wire84 = $signed(((wire83[(1'h1):(1'h1)] >= $signed($unsigned(wire4))) + $unsigned((8'hbd))));
endmodule

module module8
#(parameter param77 = (8'hbb))
(y, clk, wire9, wire10, wire11, wire12, wire13);
  output wire [(32'h13a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire9;
  input wire signed [(4'hd):(1'h0)] wire10;
  input wire [(2'h3):(1'h0)] wire11;
  input wire signed [(3'h4):(1'h0)] wire12;
  input wire signed [(4'ha):(1'h0)] wire13;
  wire [(5'h15):(1'h0)] wire57;
  wire [(2'h2):(1'h0)] wire55;
  reg [(5'h15):(1'h0)] reg76 = (1'h0);
  reg [(5'h13):(1'h0)] reg75 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg74 = (1'h0);
  reg [(5'h14):(1'h0)] reg73 = (1'h0);
  reg [(5'h15):(1'h0)] reg72 = (1'h0);
  reg [(4'he):(1'h0)] reg71 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg70 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg69 = (1'h0);
  reg [(5'h11):(1'h0)] reg68 = (1'h0);
  reg [(3'h5):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg65 = (1'h0);
  reg [(4'ha):(1'h0)] reg64 = (1'h0);
  reg [(5'h13):(1'h0)] reg63 = (1'h0);
  reg [(3'h7):(1'h0)] reg62 = (1'h0);
  reg [(5'h15):(1'h0)] reg61 = (1'h0);
  reg [(4'hb):(1'h0)] reg60 = (1'h0);
  reg signed [(4'he):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg58 = (1'h0);
  reg [(3'h5):(1'h0)] reg14 = (1'h0);
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg16 = (1'h0);
  assign y = {wire57,
                 wire55,
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
                 reg14,
                 reg15,
                 reg16,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg14 <= {wire10};
      reg15 <= ({(~^wire11[(1'h0):(1'h0)])} <<< (((((7'h41) ^ wire12) ?
                  $signed(wire10) : (wire12 ? wire9 : wire9)) ?
              $unsigned((wire13 >= wire11)) : $signed((wire9 ?
                  wire11 : wire11))) ?
          (((wire12 ? wire13 : wire9) - (^~wire12)) ?
              $signed((wire11 ?
                  reg14 : wire10)) : wire10[(4'ha):(2'h2)]) : wire12[(1'h0):(1'h0)]));
      reg16 <= ((&wire13) && (reg15 ~^ $signed(reg14)));
    end
  module17 #() modinst56 (wire55, clk, wire10, reg16, wire9, wire13);
  assign wire57 = ($signed($unsigned(wire10)) ?
                      $signed((8'ha3)) : $unsigned((8'ha2)));
  always
    @(posedge clk) begin
      if ((^$signed({$signed($signed(wire10)), $unsigned($signed(reg14))})))
        begin
          reg58 <= ({$signed($unsigned($unsigned(wire12))),
                  ((reg16[(2'h2):(1'h1)] < ((8'hb2) ? wire10 : wire13)) ?
                      (^{wire12}) : $signed($unsigned((8'hb4))))} ?
              (wire57[(5'h12):(2'h2)] + reg16[(2'h3):(2'h3)]) : (!$signed((~(wire10 >> wire11)))));
        end
      else
        begin
          reg58 <= (~&(-(!reg16)));
          reg59 <= $unsigned(({{wire55}} ?
              reg14 : {reg58, (~$unsigned(wire10))}));
          reg60 <= (^$signed($unsigned($unsigned((!(8'h9f))))));
          reg61 <= $signed($signed($unsigned((~&$unsigned(reg15)))));
          reg62 <= reg15;
        end
      reg63 <= $signed($signed($unsigned((reg60 & (&(8'haa))))));
      if (reg15[(3'h4):(1'h0)])
        begin
          if ((reg15 >> ((!reg60) ?
              $signed(((reg62 ? wire57 : wire11) ?
                  wire55[(1'h1):(1'h0)] : $signed(wire10))) : wire55[(1'h0):(1'h0)])))
            begin
              reg64 <= reg58[(3'h5):(3'h5)];
            end
          else
            begin
              reg64 <= (|((~|$unsigned((wire57 << wire12))) ~^ reg14[(1'h0):(1'h0)]));
              reg65 <= reg14;
              reg66 <= (8'hb1);
            end
          reg67 <= reg65[(2'h3):(1'h1)];
          if ((reg65[(4'h8):(3'h7)] & {$unsigned(((reg15 ? wire12 : wire10) ?
                  $signed(wire13) : $unsigned(reg58)))}))
            begin
              reg68 <= (wire10 | {($unsigned(reg64) <= ((^~(8'h9d)) ?
                      $signed(reg59) : (wire13 * reg58))),
                  (8'hac)});
            end
          else
            begin
              reg68 <= wire55;
              reg69 <= reg66;
              reg70 <= $signed(($unsigned($signed((~reg68))) <= reg67[(1'h0):(1'h0)]));
            end
          if (wire55[(1'h1):(1'h1)])
            begin
              reg71 <= {({$signed((~^reg63)),
                      reg64[(1'h1):(1'h1)]} || reg61[(2'h2):(1'h1)])};
              reg72 <= (&($unsigned(wire11) >> reg15));
              reg73 <= {reg15[(3'h4):(2'h2)],
                  ({reg65} ^ (((wire13 && reg71) ?
                          reg72[(5'h12):(3'h4)] : reg59[(4'he):(1'h1)]) ?
                      {(reg66 ? reg69 : wire12), $signed(wire10)} : wire13))};
              reg74 <= (~|reg62[(3'h4):(2'h3)]);
            end
          else
            begin
              reg71 <= (8'hb8);
              reg72 <= $signed((({{reg74, reg58}, (reg72 ? reg72 : reg14)} ?
                  ((^reg62) ?
                      reg65[(4'hd):(1'h1)] : {wire9,
                          reg71}) : reg59) + ((+wire10[(2'h2):(2'h2)]) ~^ $signed((reg62 ?
                  wire13 : wire12)))));
              reg73 <= (({$signed(reg68), (^wire57[(4'hb):(2'h2)])} ?
                  $unsigned(reg73[(3'h6):(3'h5)]) : (~&reg72[(3'h6):(1'h0)])) ^~ reg71[(4'ha):(3'h7)]);
              reg74 <= ((8'hb6) <<< $unsigned($unsigned($unsigned(((8'hb1) < reg58)))));
            end
          reg75 <= wire11;
        end
      else
        begin
          reg64 <= reg72;
          if ($signed(reg60))
            begin
              reg65 <= (-$signed($signed(reg58)));
              reg66 <= wire11[(2'h2):(1'h0)];
              reg67 <= (~|wire57[(5'h12):(5'h10)]);
            end
          else
            begin
              reg65 <= (({$unsigned($signed(reg15))} ^ ($unsigned((&wire12)) <= reg74)) || (reg69 * reg65));
              reg66 <= ($signed((~|$unsigned((8'hb9)))) ?
                  wire55[(1'h1):(1'h0)] : (^reg60));
              reg67 <= {$signed({((wire11 ? reg63 : reg60) ?
                          (reg74 ? reg62 : reg58) : $unsigned(wire55))})};
            end
        end
      reg76 <= reg68;
    end
endmodule

module module17
#(parameter param53 = (~|((!((-(8'ha3)) ? ((8'hb6) << (8'ha4)) : (-(8'hb4)))) >>> ((((8'hb7) ? (8'ha8) : (8'hbd)) ? {(8'ha5), (8'hb5)} : ((7'h43) >>> (8'ha2))) & (~&((8'hbe) == (8'h9e)))))), 
parameter param54 = (param53 ? param53 : ((((param53 ? param53 : param53) ? (param53 | param53) : (param53 ^ (8'ha6))) >= ((+param53) * (param53 > param53))) ? (+(param53 <= (param53 ? param53 : param53))) : ({(param53 ? param53 : param53), (param53 ? param53 : param53)} ? (-(-param53)) : {(param53 ? param53 : param53), {(8'hab), (8'hbc)}}))))
(y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'h137):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire21;
  input wire signed [(4'he):(1'h0)] wire20;
  input wire [(4'hb):(1'h0)] wire19;
  input wire signed [(4'ha):(1'h0)] wire18;
  wire [(4'hf):(1'h0)] wire52;
  wire signed [(4'h8):(1'h0)] wire51;
  wire [(3'h5):(1'h0)] wire50;
  wire [(4'hf):(1'h0)] wire49;
  wire [(2'h3):(1'h0)] wire48;
  wire signed [(4'hf):(1'h0)] wire28;
  wire signed [(4'h8):(1'h0)] wire27;
  wire signed [(3'h7):(1'h0)] wire26;
  wire signed [(4'hc):(1'h0)] wire25;
  wire signed [(2'h2):(1'h0)] wire24;
  wire signed [(2'h3):(1'h0)] wire23;
  wire signed [(5'h14):(1'h0)] wire22;
  reg signed [(4'h9):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg46 = (1'h0);
  reg [(4'h8):(1'h0)] reg45 = (1'h0);
  reg [(3'h7):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg43 = (1'h0);
  reg [(4'h9):(1'h0)] reg42 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg41 = (1'h0);
  reg [(2'h3):(1'h0)] reg40 = (1'h0);
  reg [(4'hd):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg38 = (1'h0);
  reg [(4'hf):(1'h0)] reg37 = (1'h0);
  reg [(5'h10):(1'h0)] reg36 = (1'h0);
  reg [(3'h4):(1'h0)] reg35 = (1'h0);
  reg [(5'h10):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg33 = (1'h0);
  reg [(3'h5):(1'h0)] reg32 = (1'h0);
  reg [(3'h7):(1'h0)] reg31 = (1'h0);
  reg [(5'h13):(1'h0)] reg30 = (1'h0);
  reg [(4'he):(1'h0)] reg29 = (1'h0);
  assign y = {wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
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
                 (1'h0)};
  assign wire22 = (((~&wire20) * $unsigned(wire21[(3'h7):(2'h2)])) ?
                      wire21[(3'h7):(2'h2)] : $unsigned(wire19));
  assign wire23 = ((^~(|($signed((8'hbd)) ?
                      $signed(wire18) : (wire20 ?
                          wire18 : (8'hb4))))) == wire20);
  assign wire24 = $signed(wire22);
  assign wire25 = $signed(wire21);
  assign wire26 = wire20;
  assign wire27 = (&wire26);
  assign wire28 = $unsigned((~(|((wire21 ?
                      wire24 : wire25) > (wire21 & (8'ha8))))));
  always
    @(posedge clk) begin
      reg29 <= ((^$unsigned((8'hb6))) > {wire20});
      if ($signed(wire20))
        begin
          reg30 <= wire23[(2'h2):(1'h1)];
        end
      else
        begin
          if ($signed((((!wire20) ?
              {((8'ha6) ?
                      reg29 : (7'h41))} : ($unsigned(wire21) == wire27)) || wire24)))
            begin
              reg30 <= $signed(wire24[(1'h1):(1'h1)]);
              reg31 <= {(8'hb0), wire20[(4'he):(2'h3)]};
            end
          else
            begin
              reg30 <= wire27[(3'h6):(3'h4)];
            end
          reg32 <= (+$unsigned((^($unsigned(reg30) != (reg29 == wire27)))));
          reg33 <= (!$signed($unsigned($signed((wire19 < wire25)))));
          if ($unsigned($signed(($signed((+reg32)) + wire22[(1'h1):(1'h0)]))))
            begin
              reg34 <= wire25[(3'h4):(3'h4)];
              reg35 <= ($unsigned(($unsigned($unsigned(reg31)) ?
                  (wire18[(4'h8):(3'h7)] != $unsigned((8'hab))) : wire20[(4'h8):(3'h7)])) * wire21);
              reg36 <= wire19;
              reg37 <= (~reg36[(1'h0):(1'h0)]);
            end
          else
            begin
              reg34 <= $signed(((((~&reg31) * (reg36 > wire23)) ~^ wire26) ?
                  $signed(wire23) : ($signed(wire28) ?
                      ({(7'h44)} ~^ reg36[(4'hb):(3'h5)]) : ((wire26 | reg29) ~^ wire18))));
              reg35 <= reg37;
              reg36 <= $signed({(($signed((8'hb6)) >> (reg35 ?
                      wire24 : wire21)) >> (wire22 >>> wire24[(2'h2):(2'h2)])),
                  reg34[(4'ha):(1'h1)]});
            end
          reg38 <= {reg35[(2'h2):(1'h1)]};
        end
      if ($unsigned($signed(((reg35 << (wire19 == reg33)) | {reg36[(2'h3):(1'h0)],
          (wire21 ? wire28 : wire25)}))))
        begin
          reg39 <= wire23;
          reg40 <= ($unsigned((8'hac)) ^~ (~^$signed($unsigned($unsigned(wire22)))));
        end
      else
        begin
          reg39 <= reg37;
          reg40 <= $signed((wire28 != {((~reg31) ?
                  $unsigned(wire28) : (reg40 - reg33)),
              reg35}));
          reg41 <= $unsigned(wire18[(3'h6):(1'h1)]);
          if (reg38[(2'h2):(1'h1)])
            begin
              reg42 <= reg32[(2'h2):(1'h1)];
              reg43 <= reg36[(2'h3):(1'h1)];
              reg44 <= wire20;
              reg45 <= (reg41 ?
                  {(^~({reg32} ? $signed(reg42) : wire25))} : (|(~&((8'hbd) ?
                      reg30[(2'h3):(1'h1)] : wire22[(5'h14):(4'ha)]))));
              reg46 <= {(~&$signed(((reg42 ? reg42 : (8'ha2)) << (reg34 ?
                      wire27 : reg36))))};
            end
          else
            begin
              reg42 <= reg43;
              reg43 <= reg42[(1'h0):(1'h0)];
              reg44 <= reg35;
              reg45 <= $unsigned($signed({reg32[(1'h1):(1'h1)]}));
            end
        end
      reg47 <= (($unsigned(((8'hbc) ? (reg37 ? reg33 : (8'ha6)) : reg42)) ?
              $signed(reg40) : ((wire20 <= (~^wire23)) ?
                  ((reg45 != reg45) >> (wire27 ?
                      reg39 : reg30)) : (reg43[(2'h3):(1'h1)] ?
                      (|reg44) : (wire25 <<< reg31)))) ?
          $unsigned((-((^reg44) ?
              $unsigned(reg35) : ((8'hb5) ?
                  reg43 : reg36)))) : (~^(~^$unsigned((reg36 >>> reg44)))));
    end
  assign wire48 = ($unsigned((-((reg45 || wire23) ^~ $signed(reg33)))) ?
                      (reg45 ?
                          $unsigned({(-(8'hb0)),
                              $signed(reg35)}) : (($signed(wire26) >> reg29) - $signed({wire25}))) : {{$unsigned(reg44[(1'h1):(1'h1)]),
                              reg41[(3'h7):(1'h1)]},
                          (reg39[(4'h9):(4'h8)] > ({reg42} ?
                              (reg44 >= reg29) : (8'hb4)))});
  assign wire49 = reg37[(3'h6):(1'h1)];
  assign wire50 = (~^($signed({wire18}) ?
                      $signed($signed((reg31 * reg32))) : wire20));
  assign wire51 = $unsigned($signed(($unsigned($unsigned((8'hae))) ?
                      wire19[(2'h2):(2'h2)] : $signed((reg42 ?
                          reg42 : wire20)))));
  assign wire52 = $signed($signed($unsigned($signed(wire23))));
endmodule
