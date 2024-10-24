module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h58):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire4;
  input wire [(4'hf):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire81;
  wire signed [(2'h3):(1'h0)] wire80;
  wire signed [(3'h4):(1'h0)] wire79;
  wire [(5'h14):(1'h0)] wire77;
  wire [(4'ha):(1'h0)] wire64;
  wire [(5'h10):(1'h0)] wire20;
  wire signed [(5'h15):(1'h0)] wire5;
  assign y = {wire81, wire80, wire79, wire77, wire64, wire20, wire5, (1'h0)};
  assign wire5 = wire0[(1'h1):(1'h1)];
  module6 #() modinst21 (wire20, clk, wire4, wire3, wire1, wire2);
  module22 #() modinst65 (.wire25(wire20), .y(wire64), .wire24(wire2), .wire26(wire4), .wire23(wire1), .clk(clk));
  module66 #() modinst78 (wire77, clk, wire5, wire4, wire64, wire2);
  assign wire79 = (8'haf);
  assign wire80 = wire64[(1'h0):(1'h0)];
  assign wire81 = ((~{wire4[(3'h6):(1'h1)], $signed(wire2[(3'h6):(3'h5)])}) ?
                      wire4 : ($signed(wire77) < (|(^$signed(wire4)))));
endmodule

module module66
#(parameter param76 = ((~&({(~^(8'hb2)), (~|(8'hbc))} ? {(|(8'hb0)), ((8'ha1) ? (8'hb0) : (8'hba))} : (((8'hb2) * (8'ha8)) ? ((8'ha8) ? (8'ha9) : (8'ha3)) : ((8'ha5) | (7'h40))))) < {({((8'hb8) ? (8'ha0) : (8'hb0))} ? {((8'had) ? (8'ha9) : (8'hb8))} : ({(8'hbe)} | (|(7'h41)))), ({{(8'hb5), (8'hb6)}, ((8'h9f) ? (7'h44) : (8'hb6))} >>> (|((8'ha2) ? (8'had) : (8'ha3))))}))
(y, clk, wire70, wire69, wire68, wire67);
  output wire [(32'h37):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire70;
  input wire [(3'h6):(1'h0)] wire69;
  input wire signed [(3'h5):(1'h0)] wire68;
  input wire [(4'hc):(1'h0)] wire67;
  wire signed [(4'ha):(1'h0)] wire75;
  wire signed [(4'h8):(1'h0)] wire74;
  wire signed [(4'hc):(1'h0)] wire73;
  wire [(5'h11):(1'h0)] wire72;
  wire [(3'h7):(1'h0)] wire71;
  assign y = {wire75, wire74, wire73, wire72, wire71, (1'h0)};
  assign wire71 = $unsigned($signed(wire70));
  assign wire72 = {wire68[(3'h5):(3'h4)]};
  assign wire73 = wire67[(1'h1):(1'h0)];
  assign wire74 = wire73;
  assign wire75 = ($signed((~&((~^wire67) != (wire71 ?
                      (8'ha9) : wire74)))) | wire72);
endmodule

module module22
#(parameter param63 = (~&(((((8'h9c) ? (8'hbd) : (7'h40)) << (~^(8'ha5))) & {((8'ha2) ~^ (8'ha0))}) ? (-(((8'had) ? (8'hba) : (7'h40)) == ((8'ha4) ? (8'hb6) : (8'ha1)))) : {(((8'ha5) ? (8'hb0) : (8'hb5)) ? ((8'hb7) >= (8'hb8)) : (&(8'hbd)))})))
(y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'h19f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire26;
  input wire signed [(5'h10):(1'h0)] wire25;
  input wire [(4'hf):(1'h0)] wire24;
  input wire [(3'h7):(1'h0)] wire23;
  wire [(3'h4):(1'h0)] wire62;
  wire signed [(4'ha):(1'h0)] wire61;
  wire signed [(4'hd):(1'h0)] wire46;
  wire [(3'h7):(1'h0)] wire45;
  wire signed [(5'h13):(1'h0)] wire44;
  wire signed [(4'he):(1'h0)] wire43;
  wire [(4'h8):(1'h0)] wire42;
  wire signed [(4'ha):(1'h0)] wire41;
  wire signed [(3'h7):(1'h0)] wire40;
  reg signed [(2'h2):(1'h0)] reg60 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg58 = (1'h0);
  reg signed [(4'he):(1'h0)] reg57 = (1'h0);
  reg [(5'h11):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg55 = (1'h0);
  reg [(2'h3):(1'h0)] reg54 = (1'h0);
  reg [(4'he):(1'h0)] reg53 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg50 = (1'h0);
  reg [(5'h13):(1'h0)] reg49 = (1'h0);
  reg [(4'h9):(1'h0)] reg48 = (1'h0);
  reg [(3'h4):(1'h0)] reg47 = (1'h0);
  reg [(3'h5):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg38 = (1'h0);
  reg [(4'hf):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg36 = (1'h0);
  reg [(4'hf):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg34 = (1'h0);
  reg [(4'hc):(1'h0)] reg33 = (1'h0);
  reg [(4'hf):(1'h0)] reg32 = (1'h0);
  reg [(5'h11):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg30 = (1'h0);
  reg [(5'h12):(1'h0)] reg29 = (1'h0);
  reg [(5'h10):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg27 = (1'h0);
  assign y = {wire62,
                 wire61,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
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
  always
    @(posedge clk) begin
      if (wire26)
        begin
          reg27 <= wire24[(1'h0):(1'h0)];
        end
      else
        begin
          reg27 <= ($signed(reg27[(3'h7):(1'h1)]) ?
              ((~&(wire26[(1'h1):(1'h0)] << (reg27 ?
                  wire23 : (8'hb5)))) ^~ (|$signed({wire25,
                  wire26}))) : ($unsigned((&(wire24 ? wire23 : reg27))) ?
                  ((8'h9f) ?
                      (wire26 ^~ (wire25 >= wire24)) : $unsigned($signed(wire25))) : ({$unsigned(wire25),
                          (^~reg27)} ?
                      ({reg27, wire24} ^ $signed(wire25)) : ((wire25 & wire23) ?
                          (!wire24) : (reg27 ? wire24 : wire23)))));
          reg28 <= (^~$signed(($unsigned((wire26 || reg27)) ~^ $signed((wire23 ?
              reg27 : wire26)))));
          reg29 <= wire26;
          reg30 <= $unsigned(reg29[(3'h4):(2'h3)]);
        end
      if (reg27[(4'hc):(1'h0)])
        begin
          if ($signed(((!($unsigned(reg28) ?
                  {(8'had)} : reg27[(3'h7):(2'h3)])) ?
              wire23 : $signed(reg27))))
            begin
              reg31 <= wire26[(4'hc):(4'h8)];
              reg32 <= (wire25 <<< $unsigned((reg30[(2'h2):(1'h0)] ^ {(+reg31),
                  reg30})));
              reg33 <= reg29;
              reg34 <= {$signed(wire24[(3'h6):(2'h3)])};
              reg35 <= (wire23[(2'h2):(1'h0)] ?
                  {(~$signed($signed(reg30)))} : $unsigned(reg29));
            end
          else
            begin
              reg31 <= reg34;
              reg32 <= ($signed((~|(~|(reg27 * wire25)))) ?
                  reg34[(4'ha):(1'h1)] : $unsigned((((reg27 ?
                      reg30 : wire23) | (reg29 < wire23)) >>> $unsigned((reg30 & (8'ha0))))));
              reg33 <= wire26;
            end
        end
      else
        begin
          reg31 <= wire26;
          if ((!((~$signed($signed(reg31))) ?
              (-((|(8'hb9)) ?
                  reg35[(4'h9):(3'h5)] : (wire26 != reg33))) : ($signed(wire24) ?
                  (-$signed((8'hbd))) : reg28[(1'h0):(1'h0)]))))
            begin
              reg32 <= ({(-(wire24[(1'h0):(1'h0)] < $signed(reg27))),
                      (($unsigned(reg32) ^ $signed(reg31)) ?
                          reg30 : reg30[(3'h6):(3'h4)])} ?
                  ($signed(reg27[(4'he):(4'h9)]) ^ ((~^$signed(reg29)) != (|(!reg30)))) : (~(^((reg35 <= reg32) >= wire23[(1'h1):(1'h0)]))));
            end
          else
            begin
              reg32 <= reg30;
            end
        end
      if ((wire23 | (((&(8'hb3)) ? $unsigned((-reg32)) : reg32) ?
          reg27 : (~|reg28))))
        begin
          reg36 <= (reg35[(4'hb):(4'hb)] == $signed((8'ha0)));
        end
      else
        begin
          reg36 <= ((!({(reg28 ~^ reg29),
                  (reg29 << reg36)} ^ (^$signed(reg34)))) ?
              $signed($signed(reg27)) : ((((8'hbd) ?
                      (reg32 ? (8'hb7) : reg31) : (reg34 >> reg29)) ?
                  (&reg30[(3'h5):(2'h2)]) : $signed(reg36[(2'h2):(2'h2)])) ^ $unsigned((((8'hbd) ?
                  reg34 : reg31) & (!reg36)))));
          reg37 <= ($unsigned($unsigned(((^wire24) ?
                  wire23 : $signed(reg28)))) ?
              reg29[(3'h4):(1'h1)] : (+($signed({reg34, reg30}) ?
                  (-wire25[(3'h5):(1'h1)]) : (8'hb0))));
          reg38 <= reg34[(3'h4):(2'h3)];
        end
      reg39 <= ({$unsigned($unsigned((|reg35)))} ?
          reg34[(4'hc):(3'h4)] : $unsigned(((&(!reg37)) ?
              {reg33[(4'h8):(3'h5)], {reg37, (8'hb1)}} : $signed(reg33))));
    end
  assign wire40 = $unsigned({reg35,
                      (reg33 ? $signed((^~reg35)) : (&reg29[(4'h8):(1'h0)]))});
  assign wire41 = reg32[(4'ha):(4'ha)];
  assign wire42 = $unsigned($unsigned((^~{{(8'hb3), wire23},
                      $signed(wire23)})));
  assign wire43 = ($signed(wire42) ? reg35 : wire40);
  assign wire44 = reg31[(2'h2):(1'h0)];
  assign wire45 = $signed($unsigned(wire41));
  assign wire46 = ((wire40[(3'h7):(3'h7)] <= {wire24,
                          (reg27[(4'hc):(4'hb)] ~^ (~|wire40))}) ?
                      $signed((reg39 ?
                          wire25 : reg28[(1'h0):(1'h0)])) : $unsigned(reg36));
  always
    @(posedge clk) begin
      reg47 <= (($signed($unsigned(wire46[(1'h1):(1'h0)])) ?
              ((wire25 ?
                  (reg32 >> wire41) : $unsigned(reg33)) <<< $unsigned(((8'ha6) ?
                  wire24 : reg38))) : wire46) ?
          ($unsigned($unsigned($unsigned(wire42))) != ($signed(reg29) ?
              reg34 : (+$unsigned((8'ha0))))) : {(($unsigned((8'haa)) <<< $unsigned(reg38)) ?
                  $unsigned((wire24 ? (8'ha3) : reg28)) : {$unsigned(reg27),
                      wire40[(3'h7):(1'h0)]}),
              (8'hb1)});
      reg48 <= ($signed(wire40[(3'h4):(3'h4)]) ?
          $signed((8'hbd)) : reg29[(4'hd):(4'h8)]);
      if ((+$unsigned((wire26[(2'h3):(1'h1)] > wire44[(3'h7):(2'h3)]))))
        begin
          reg49 <= wire24[(3'h5):(2'h2)];
          reg50 <= reg49;
          reg51 <= (^~reg48);
          reg52 <= ($signed($unsigned(reg29[(4'hc):(4'hc)])) ?
              $signed((-{reg28,
                  (wire41 ? reg31 : reg32)})) : ($signed(reg38) || reg36));
          reg53 <= $unsigned($signed(reg48[(4'h9):(3'h4)]));
        end
      else
        begin
          if ($signed((reg27[(3'h4):(2'h3)] ?
              (-$signed((8'hb4))) : {($unsigned(reg50) ^ (reg34 & reg36))})))
            begin
              reg49 <= reg48;
              reg50 <= {wire26[(3'h6):(3'h5)]};
            end
          else
            begin
              reg49 <= $unsigned(wire26[(4'hc):(4'hc)]);
              reg50 <= reg52[(3'h5):(2'h2)];
            end
          reg51 <= (~(!{$unsigned((!wire40))}));
          if ((!(((((8'hb2) ? wire41 : (8'ha6)) ?
              {wire43} : wire40[(3'h5):(3'h5)]) >> ({reg53, wire45} ?
              ((8'ha3) > wire24) : (~|reg27))) ~^ $signed($signed($signed(reg36))))))
            begin
              reg52 <= (wire45[(3'h6):(2'h2)] ?
                  (-$signed((wire46[(3'h5):(3'h5)] ?
                      reg27 : reg36))) : wire46[(2'h3):(2'h3)]);
              reg53 <= ((($signed((~^reg28)) ?
                      (+reg37[(4'hb):(1'h0)]) : ({reg28} ?
                          reg30[(4'h9):(3'h6)] : $unsigned(reg53))) ?
                  wire26[(1'h1):(1'h0)] : $unsigned(wire45)) != (-reg52[(4'h8):(2'h3)]));
              reg54 <= $unsigned(reg28[(1'h1):(1'h1)]);
              reg55 <= wire41;
              reg56 <= (~^$signed(wire23));
            end
          else
            begin
              reg52 <= reg49;
              reg53 <= {reg27};
              reg54 <= reg28[(4'he):(3'h6)];
              reg55 <= $signed($signed(($unsigned({reg33,
                  wire45}) + reg32[(3'h4):(2'h2)])));
            end
          reg57 <= {(+(-(reg47 < (reg36 ? reg28 : reg49)))),
              $signed((((!reg32) ?
                  (wire45 ? reg36 : wire26) : $signed(reg35)) > ((~&wire41) ?
                  reg49[(4'h9):(3'h6)] : reg39)))};
          reg58 <= $unsigned((wire40[(3'h7):(1'h0)] ?
              wire43[(4'hd):(3'h7)] : ({(+wire44), (reg51 ? (8'ha8) : wire46)} ?
                  ($signed(wire42) > $signed(reg32)) : ($unsigned(reg57) ?
                      reg36[(2'h2):(1'h0)] : {wire45, reg39}))));
        end
      reg59 <= $signed(reg58);
      reg60 <= $signed((^wire40[(1'h1):(1'h1)]));
    end
  assign wire61 = wire46[(4'h9):(3'h6)];
  assign wire62 = (reg54 >> (~|(-reg59)));
endmodule

module module6
#(parameter param18 = (^(|(-({(8'ha1), (8'hb9)} ? ((8'hb5) ? (7'h43) : (8'ha2)) : (|(8'ha1)))))), 
parameter param19 = (~(((8'ha1) ? param18 : {(param18 ^~ param18)}) && ((param18 ~^ param18) & param18))))
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire10;
  input wire signed [(4'hc):(1'h0)] wire9;
  input wire signed [(3'h5):(1'h0)] wire8;
  input wire signed [(5'h13):(1'h0)] wire7;
  wire [(3'h6):(1'h0)] wire16;
  wire [(2'h2):(1'h0)] wire15;
  wire signed [(4'hd):(1'h0)] wire14;
  wire [(5'h13):(1'h0)] wire13;
  wire signed [(2'h3):(1'h0)] wire12;
  wire signed [(4'ha):(1'h0)] wire11;
  reg signed [(2'h3):(1'h0)] reg17 = (1'h0);
  assign y = {wire16, wire15, wire14, wire13, wire12, wire11, reg17, (1'h0)};
  assign wire11 = (&$signed($unsigned(wire8)));
  assign wire12 = ((&wire8) ?
                      wire11 : ($unsigned($signed((wire10 != wire11))) ?
                          (~&wire9[(4'ha):(2'h2)]) : (+wire10[(1'h0):(1'h0)])));
  assign wire13 = wire11[(4'h8):(3'h7)];
  assign wire14 = $unsigned(wire8);
  assign wire15 = ((|(wire11 ?
                          ((8'h9e) ?
                              {wire13,
                                  wire11} : wire13[(2'h2):(2'h2)]) : ((!wire11) >>> wire11))) ?
                      (wire11 ?
                          wire11[(1'h1):(1'h0)] : $signed(wire8)) : {$unsigned(((wire13 ?
                              (8'hbb) : wire13) ^ $signed((8'hac))))});
  assign wire16 = (+$unsigned($unsigned((~^wire10[(3'h6):(3'h6)]))));
  always
    @(posedge clk) begin
      reg17 <= ($signed($signed(($signed((8'hb9)) != wire13))) ?
          (^$unsigned(wire10)) : (({(8'hbd)} + (^$unsigned(wire15))) << ((wire8 ?
              $signed(wire11) : $unsigned(wire16)) >= ((~wire9) ?
              wire15[(1'h1):(1'h0)] : $signed(wire8)))));
    end
endmodule
