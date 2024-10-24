module top
#(parameter param76 = (~|((({(8'hb1)} ^ ((8'hae) & (8'hb8))) ? (((8'hbc) ? (7'h44) : (8'hb0)) ? (&(8'ha5)) : {(8'h9f)}) : ((-(8'ha4)) ? ((8'h9e) ? (8'ha8) : (8'hb1)) : (|(7'h42)))) ? (-(((8'ha6) ? (8'hb3) : (8'hac)) ? ((8'ha7) ? (8'h9c) : (8'ha2)) : {(8'hb0), (8'hb7)})) : (~|(^~{(7'h41)})))), 
parameter param77 = (~^({({param76, param76} != param76)} ? (param76 ? ((param76 ? param76 : param76) > {param76, (8'ha5)}) : (((8'hbf) == param76) ? (param76 ? param76 : param76) : (param76 >> param76))) : (^(~|{(8'ha8)})))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h6a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire75;
  wire signed [(4'hf):(1'h0)] wire74;
  wire signed [(5'h12):(1'h0)] wire73;
  wire [(4'hd):(1'h0)] wire72;
  wire [(4'h8):(1'h0)] wire71;
  wire signed [(4'ha):(1'h0)] wire69;
  wire signed [(4'he):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire4;
  assign y = {wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire69,
                 wire5,
                 wire4,
                 (1'h0)};
  assign wire4 = ($signed(wire2[(2'h2):(1'h1)]) ?
                     (wire1 ?
                         ($signed(wire1[(4'hd):(1'h0)]) || $signed($unsigned(wire1))) : wire0[(2'h2):(1'h1)]) : wire0);
  assign wire5 = (wire2[(2'h3):(2'h3)] - (+($unsigned(wire3) ^ $signed((wire2 ?
                     wire3 : wire4)))));
  module6 #() modinst70 (.y(wire69), .wire9(wire1), .clk(clk), .wire7(wire2), .wire8(wire4), .wire10(wire5));
  assign wire71 = (+($signed((wire2 ~^ (wire0 || wire5))) ?
                      $signed((~&(wire0 ?
                          wire5 : (8'ha8)))) : (wire1[(1'h0):(1'h0)] ?
                          ((~|wire1) ?
                              {(8'hb4), wire5} : (wire5 && wire2)) : wire0)));
  assign wire72 = wire4[(4'hb):(4'h9)];
  assign wire73 = ((^(^(wire71 << {wire72}))) ? {wire0} : wire5);
  assign wire74 = $signed((~^wire5[(4'hc):(2'h3)]));
  assign wire75 = wire73[(4'ha):(3'h5)];
endmodule

module module6  (y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'h9e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire7;
  input wire signed [(4'he):(1'h0)] wire8;
  input wire [(5'h14):(1'h0)] wire9;
  input wire [(4'he):(1'h0)] wire10;
  wire [(3'h7):(1'h0)] wire33;
  wire [(3'h6):(1'h0)] wire38;
  wire [(4'hd):(1'h0)] wire39;
  wire [(2'h2):(1'h0)] wire40;
  wire signed [(4'hb):(1'h0)] wire41;
  wire signed [(4'hd):(1'h0)] wire42;
  wire [(4'h8):(1'h0)] wire43;
  wire [(2'h3):(1'h0)] wire44;
  wire signed [(3'h7):(1'h0)] wire45;
  wire [(4'ha):(1'h0)] wire46;
  wire signed [(5'h10):(1'h0)] wire47;
  wire [(5'h14):(1'h0)] wire67;
  reg [(3'h6):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg37 = (1'h0);
  assign y = {wire33,
                 wire38,
                 wire39,
                 wire40,
                 wire41,
                 wire42,
                 wire43,
                 wire44,
                 wire45,
                 wire46,
                 wire47,
                 wire67,
                 reg35,
                 reg36,
                 reg37,
                 (1'h0)};
  module11 #() modinst34 (.wire15(wire8), .wire14(wire10), .clk(clk), .wire13(wire9), .y(wire33), .wire12(wire7));
  always
    @(posedge clk) begin
      reg35 <= ((wire7[(4'h9):(1'h0)] ~^ {$unsigned((~wire33))}) ?
          ($unsigned(((~^(8'hb2)) >>> wire33[(2'h2):(2'h2)])) ?
              (8'hbd) : {{wire7, wire33}}) : (^wire9[(4'hd):(3'h7)]));
      reg36 <= $signed((~&($unsigned($unsigned(reg35)) ?
          (reg35 ? reg35 : wire10[(4'h8):(1'h0)]) : wire33[(3'h6):(3'h6)])));
      reg37 <= ((wire8[(2'h2):(1'h0)] | $signed(($signed(reg35) ~^ (wire9 ?
              wire33 : (8'hbb))))) ?
          $signed($signed((|$unsigned(reg36)))) : reg36[(4'hb):(3'h7)]);
    end
  assign wire38 = wire9[(2'h3):(1'h1)];
  assign wire39 = $unsigned(wire8);
  assign wire40 = (reg35[(2'h2):(1'h0)] ?
                      (($signed((|reg36)) ?
                          wire9 : {reg36}) - {$unsigned(wire10[(4'hd):(4'h8)]),
                          wire10[(4'hc):(1'h1)]}) : ($unsigned(($unsigned(wire38) >>> ((7'h44) ^ wire10))) && ($unsigned(wire33[(2'h3):(2'h2)]) ?
                          $signed($unsigned(wire10)) : $unsigned((wire8 ?
                              reg36 : wire7)))));
  assign wire41 = {$signed(wire9[(4'h9):(3'h7)])};
  assign wire42 = ({$unsigned({wire38}), (+$signed({(8'hba), wire9}))} ?
                      ((^wire7) ?
                          reg37[(2'h3):(1'h0)] : wire33[(1'h1):(1'h1)]) : (wire9 ?
                          reg36[(1'h1):(1'h0)] : wire40[(2'h2):(2'h2)]));
  assign wire43 = wire39;
  assign wire44 = (7'h43);
  assign wire45 = ((^$unsigned(wire41)) == ((|(!reg35[(1'h0):(1'h0)])) ?
                      ($signed((~|wire41)) >= (-(wire7 > wire39))) : (8'hba)));
  assign wire46 = ({wire9[(4'hc):(4'h8)], $unsigned(wire40[(1'h0):(1'h0)])} ?
                      $signed((~&$unsigned((wire39 < (8'ha6))))) : wire41[(4'ha):(3'h6)]);
  assign wire47 = {({((wire45 ? wire45 : wire8) ~^ (7'h42)),
                          $unsigned($signed((8'hac)))} || ($signed(wire45) >= $unsigned(wire8[(4'ha):(1'h0)]))),
                      ({($signed(wire46) << wire40[(1'h1):(1'h0)])} ?
                          ($signed($signed(wire9)) ?
                              ($signed(wire7) ?
                                  wire39 : $unsigned((8'hac))) : (~wire38)) : $unsigned({(reg36 ?
                                  wire9 : wire40),
                              (wire38 <<< reg35)}))};
  module48 #() modinst68 (wire67, clk, reg37, wire7, wire39, wire46);
endmodule

module module48  (y, clk, wire52, wire51, wire50, wire49);
  output wire [(32'ha1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire52;
  input wire [(3'h7):(1'h0)] wire51;
  input wire [(4'hd):(1'h0)] wire50;
  input wire [(2'h2):(1'h0)] wire49;
  wire signed [(5'h14):(1'h0)] wire66;
  wire [(4'ha):(1'h0)] wire65;
  wire [(5'h11):(1'h0)] wire64;
  wire signed [(3'h5):(1'h0)] wire63;
  wire [(4'ha):(1'h0)] wire62;
  wire signed [(5'h15):(1'h0)] wire61;
  wire signed [(3'h7):(1'h0)] wire59;
  wire signed [(4'h8):(1'h0)] wire53;
  reg signed [(4'hc):(1'h0)] reg60 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg57 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg55 = (1'h0);
  reg [(4'hc):(1'h0)] reg54 = (1'h0);
  assign y = {wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire59,
                 wire53,
                 reg60,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 (1'h0)};
  assign wire53 = wire49;
  always
    @(posedge clk) begin
      if (wire49)
        begin
          reg54 <= (wire51[(3'h6):(3'h4)] > wire52);
        end
      else
        begin
          reg54 <= ((-(((|wire53) ? (~|wire50) : (&wire49)) << ((wire51 ?
                      wire51 : wire49) ?
                  (wire53 == wire51) : $signed(wire52)))) ?
              $signed(wire52) : {(8'hbb)});
        end
      reg55 <= $signed((^$unsigned($unsigned($signed(reg54)))));
      reg56 <= $signed(wire51[(3'h5):(3'h4)]);
      reg57 <= ($signed(((+wire52[(5'h14):(4'hc)]) ^ ($unsigned(wire50) == $signed((8'haa))))) ?
          {$unsigned(reg54[(4'h8):(1'h1)]),
              ($unsigned($unsigned((8'ha2))) ~^ ($signed((8'hbe)) * $signed(wire50)))} : $unsigned(((((8'hb5) ?
              wire50 : reg56) < wire53) <<< wire52[(4'hc):(4'h8)])));
      reg58 <= reg55[(1'h0):(1'h0)];
    end
  assign wire59 = wire52;
  always
    @(posedge clk) begin
      reg60 <= (wire51 ?
          wire51[(3'h6):(2'h3)] : ((($signed(wire52) ?
              reg56 : {wire51, wire53}) & $unsigned((wire53 ?
              wire51 : reg57))) ^~ ($unsigned((~&(8'hbb))) ?
              $signed(reg58) : reg58[(1'h1):(1'h1)])));
    end
  assign wire61 = (($signed($signed((8'hbb))) || (^({reg54} ?
                      $signed(wire52) : {wire49}))) + reg54);
  assign wire62 = (reg56[(2'h3):(2'h2)] ?
                      reg56[(4'h9):(3'h5)] : (-{reg60[(4'ha):(3'h4)],
                          (wire51 << (reg56 >> wire52))}));
  assign wire63 = ($signed(wire51[(2'h3):(2'h3)]) == (((&$unsigned(wire61)) ?
                          reg58[(1'h0):(1'h0)] : {$signed(wire50),
                              $unsigned(wire51)}) ?
                      {($unsigned(reg56) ? $unsigned(wire62) : wire59),
                          (|$unsigned(wire49))} : (~($signed(wire52) <= (^wire52)))));
  assign wire64 = wire61[(4'ha):(1'h1)];
  assign wire65 = ($unsigned(($signed((wire64 >>> wire51)) ?
                          $signed((!wire63)) : wire59)) ?
                      ((($unsigned(wire63) ?
                          wire50[(4'ha):(1'h1)] : (&reg54)) == $unsigned((reg57 < (8'hb8)))) ^ (8'ha7)) : wire59);
  assign wire66 = (wire63 ?
                      wire65 : ((~&($signed((8'hac)) ?
                          (wire61 ? wire65 : wire59) : (&reg56))) ~^ reg55));
endmodule

module module11  (y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'hf6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire15;
  input wire signed [(2'h2):(1'h0)] wire14;
  input wire [(5'h14):(1'h0)] wire13;
  input wire signed [(5'h11):(1'h0)] wire12;
  wire signed [(5'h10):(1'h0)] wire19;
  wire [(3'h4):(1'h0)] wire18;
  wire signed [(5'h13):(1'h0)] wire17;
  reg signed [(5'h14):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg31 = (1'h0);
  reg [(5'h10):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg29 = (1'h0);
  reg [(4'he):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg23 = (1'h0);
  reg [(5'h15):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg21 = (1'h0);
  reg [(4'he):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg16 = (1'h0);
  assign y = {wire19,
                 wire18,
                 wire17,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg16,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg16 <= (^~wire14[(1'h1):(1'h1)]);
    end
  assign wire17 = wire13;
  assign wire18 = (~|{(-reg16[(2'h3):(2'h3)])});
  assign wire19 = $unsigned(((-wire13) - reg16[(2'h3):(1'h1)]));
  always
    @(posedge clk) begin
      if ({$unsigned($signed(wire12))})
        begin
          reg20 <= (8'hbc);
          reg21 <= (^~$unsigned(({wire15[(3'h5):(1'h1)]} > ($unsigned(reg16) ?
              (wire19 ? wire18 : reg16) : (wire18 ? wire14 : wire14)))));
          if ((wire15[(4'hb):(4'h9)] ?
              ((~&$unsigned(((8'ha0) >>> (8'ha5)))) <= reg21[(4'hb):(2'h3)]) : (~^wire15[(1'h0):(1'h0)])))
            begin
              reg22 <= {($unsigned((~$unsigned(wire15))) ?
                      $signed(($unsigned(wire15) <= (~|reg20))) : (((wire13 ?
                          wire14 : (8'hb1)) < $unsigned(wire18)) || $unsigned((~|(8'hba))))),
                  $signed(((^~reg20) <= ((wire15 ? wire14 : (8'hb4)) ?
                      reg20[(4'hd):(4'h9)] : $unsigned(wire17))))};
              reg23 <= (+{wire12[(3'h4):(1'h0)],
                  $unsigned(((reg22 ? wire19 : reg20) ?
                      (^~reg16) : $unsigned((8'hb2))))});
            end
          else
            begin
              reg22 <= $unsigned((7'h44));
              reg23 <= $signed(({$unsigned((~&wire19))} | $unsigned($signed(wire15))));
              reg24 <= {(wire17[(3'h5):(1'h1)] ^~ (!(+(|reg20))))};
              reg25 <= $unsigned(wire12);
              reg26 <= wire12;
            end
          reg27 <= reg16;
          reg28 <= $signed(reg24);
        end
      else
        begin
          if (($signed(reg28) ?
              $unsigned($signed(((reg22 ? reg26 : reg27) ?
                  {reg25, reg24} : wire17[(1'h1):(1'h1)]))) : reg21))
            begin
              reg20 <= $unsigned($unsigned({$signed($signed(wire12))}));
            end
          else
            begin
              reg20 <= reg25;
              reg21 <= (reg16 ^ $unsigned($signed((8'ha3))));
              reg22 <= ($unsigned(reg25) ?
                  (+((reg25[(4'hc):(3'h4)] ?
                      reg20[(1'h1):(1'h0)] : $unsigned((8'ha8))) < wire14[(1'h0):(1'h0)])) : wire19);
              reg23 <= (8'hbe);
              reg24 <= (~|reg27[(2'h2):(2'h2)]);
            end
          reg25 <= reg16[(2'h2):(2'h2)];
          reg26 <= {($signed(reg25[(4'h9):(2'h2)]) ?
                  $signed((|$unsigned((7'h43)))) : ({(!reg28)} ?
                      ((-(8'hb3)) ?
                          $signed(reg27) : $signed(reg24)) : ((wire14 <<< reg27) ?
                          wire17[(5'h13):(2'h3)] : (-wire14))))};
          reg27 <= ((reg24[(4'h8):(3'h5)] ?
                  ({wire19[(3'h7):(1'h0)],
                      ((7'h43) ? wire15 : reg20)} + $unsigned({(8'hb3),
                      wire13})) : ((wire13[(3'h4):(3'h4)] != (~^wire15)) ?
                      reg27 : (((8'had) ?
                          (8'haf) : wire13) << wire17[(1'h0):(1'h0)]))) ?
              reg27[(2'h2):(2'h2)] : ($unsigned((reg27 || wire17)) != (~|$unsigned((wire12 ?
                  reg20 : reg21)))));
          if ($signed($signed($unsigned(wire17[(5'h11):(1'h0)]))))
            begin
              reg28 <= wire12;
              reg29 <= wire12;
              reg30 <= $unsigned((8'ha1));
            end
          else
            begin
              reg28 <= reg30;
              reg29 <= wire17;
              reg30 <= (reg28[(4'h9):(2'h2)] ?
                  $unsigned($signed((~&wire14[(1'h0):(1'h0)]))) : ((~reg25) ^ $unsigned((|reg25[(4'ha):(2'h3)]))));
            end
        end
      reg31 <= $unsigned(wire17);
      reg32 <= reg23[(4'h8):(4'h8)];
    end
endmodule
