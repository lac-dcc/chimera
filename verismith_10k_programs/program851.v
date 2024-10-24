module top
#(parameter param109 = ((~|{((&(8'ha0)) ~^ ((8'hae) & (8'hab)))}) < (~|(8'haf))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h87):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire0;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire4;
  wire signed [(3'h6):(1'h0)] wire107;
  wire [(3'h4):(1'h0)] wire106;
  wire [(5'h13):(1'h0)] wire105;
  wire [(5'h13):(1'h0)] wire104;
  wire signed [(5'h13):(1'h0)] wire103;
  wire signed [(4'hd):(1'h0)] wire5;
  wire signed [(4'h9):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire8;
  wire signed [(3'h7):(1'h0)] wire9;
  wire signed [(2'h2):(1'h0)] wire101;
  reg [(2'h2):(1'h0)] reg108 = (1'h0);
  reg [(4'hf):(1'h0)] reg6 = (1'h0);
  assign y = {wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire5,
                 wire7,
                 wire8,
                 wire9,
                 wire101,
                 reg108,
                 reg6,
                 (1'h0)};
  assign wire5 = ({wire4} != $unsigned((((^~wire4) ?
                         $signed(wire3) : (wire1 ? wire4 : wire2)) ?
                     ((wire2 - wire0) <<< $signed(wire1)) : $signed((&wire2)))));
  always
    @(posedge clk) begin
      reg6 <= $unsigned((8'had));
    end
  assign wire7 = wire0[(4'ha):(3'h7)];
  assign wire8 = wire3;
  assign wire9 = (wire0 ^ wire0);
  module10 #() modinst102 (.wire11(wire0), .wire14(wire1), .wire15(wire5), .clk(clk), .wire13(wire8), .y(wire101), .wire12(wire9));
  assign wire103 = wire5[(3'h4):(1'h0)];
  assign wire104 = wire4;
  assign wire105 = (8'hac);
  assign wire106 = ({$signed(wire105[(5'h10):(4'h8)])} >= wire3);
  assign wire107 = reg6;
  always
    @(posedge clk) begin
      reg108 <= wire4;
    end
endmodule

module module10  (y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'h1df):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire15;
  input wire signed [(5'h13):(1'h0)] wire14;
  input wire [(4'he):(1'h0)] wire13;
  input wire signed [(3'h7):(1'h0)] wire12;
  input wire signed [(4'h9):(1'h0)] wire11;
  wire signed [(4'h8):(1'h0)] wire100;
  wire [(4'h8):(1'h0)] wire99;
  wire [(4'ha):(1'h0)] wire80;
  wire signed [(3'h6):(1'h0)] wire79;
  wire signed [(4'hf):(1'h0)] wire77;
  wire signed [(4'he):(1'h0)] wire53;
  wire signed [(4'h8):(1'h0)] wire31;
  reg signed [(2'h2):(1'h0)] reg98 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg95 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg92 = (1'h0);
  reg [(5'h13):(1'h0)] reg91 = (1'h0);
  reg [(2'h2):(1'h0)] reg90 = (1'h0);
  reg [(5'h12):(1'h0)] reg89 = (1'h0);
  reg [(4'h9):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg86 = (1'h0);
  reg [(4'h8):(1'h0)] reg85 = (1'h0);
  reg [(4'he):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg82 = (1'h0);
  reg [(3'h7):(1'h0)] reg81 = (1'h0);
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg [(5'h10):(1'h0)] reg17 = (1'h0);
  reg [(5'h15):(1'h0)] reg18 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg19 = (1'h0);
  reg [(4'hc):(1'h0)] reg20 = (1'h0);
  reg [(5'h12):(1'h0)] reg21 = (1'h0);
  reg [(4'ha):(1'h0)] reg22 = (1'h0);
  reg [(4'he):(1'h0)] reg23 = (1'h0);
  reg [(4'hf):(1'h0)] reg24 = (1'h0);
  reg [(4'hf):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg27 = (1'h0);
  reg [(4'hc):(1'h0)] reg28 = (1'h0);
  reg [(4'hb):(1'h0)] reg29 = (1'h0);
  reg [(3'h5):(1'h0)] reg30 = (1'h0);
  assign y = {wire100,
                 wire99,
                 wire80,
                 wire79,
                 wire77,
                 wire53,
                 wire31,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire12)
        begin
          reg16 <= (~&(+($signed(wire12) && (((8'hbf) >= wire14) ?
              $signed(wire13) : ((8'ha4) == wire13)))));
          if ($unsigned({(wire15[(3'h7):(1'h1)] ?
                  $unsigned($unsigned(wire12)) : {(wire14 ~^ wire11)}),
              $signed((8'hab))}))
            begin
              reg17 <= $unsigned(wire11[(1'h0):(1'h0)]);
              reg18 <= (&$unsigned(wire14[(1'h0):(1'h0)]));
              reg19 <= $signed($unsigned((((|reg16) ?
                  (~|reg16) : (|(8'hbb))) * $signed($unsigned(wire13)))));
            end
          else
            begin
              reg17 <= (wire13[(3'h6):(3'h4)] ?
                  (wire15[(4'ha):(1'h0)] - $unsigned(wire12)) : (~|wire13[(4'he):(3'h5)]));
              reg18 <= ((wire11 - $unsigned(($unsigned(wire11) ^~ wire13[(4'h9):(3'h5)]))) << ((($signed(wire12) ?
                  (reg19 ?
                      wire14 : wire14) : wire15) != reg18[(4'hb):(3'h6)]) <<< (~&reg16)));
              reg19 <= (reg16 <<< wire13);
              reg20 <= reg16;
            end
          reg21 <= wire14;
          reg22 <= (&wire11[(4'h8):(2'h3)]);
          reg23 <= reg22;
        end
      else
        begin
          reg16 <= (wire13[(4'hd):(4'hd)] ?
              wire11[(2'h2):(1'h1)] : (reg18[(2'h2):(2'h2)] ?
                  $unsigned(reg19) : $signed($signed(((8'hb1) << wire15)))));
          reg17 <= reg20[(4'hc):(4'hb)];
          reg18 <= ({$unsigned(wire11[(2'h3):(2'h2)]), wire12[(3'h5):(1'h0)]} ?
              ($unsigned((^(reg19 ? wire14 : wire11))) ?
                  $signed(reg17[(3'h5):(3'h4)]) : reg16[(4'ha):(3'h4)]) : $unsigned((!wire13)));
          reg19 <= $unsigned($unsigned($signed(reg23)));
          if ({(~|(&$unsigned((~|(8'ha8)))))})
            begin
              reg20 <= {((reg18 >= $signed(((8'ha0) ?
                      reg19 : wire11))) | wire14),
                  $unsigned((((|reg20) >> {reg16, wire14}) & ((-reg18) ?
                      (reg19 ? (8'hb0) : wire13) : wire12[(3'h6):(2'h3)])))};
              reg21 <= $signed(reg22);
            end
          else
            begin
              reg20 <= ($unsigned($signed(wire13[(4'h8):(3'h5)])) ?
                  $signed((($signed(reg16) - (wire11 ^~ reg21)) * {reg19,
                      reg18[(3'h6):(1'h1)]})) : (^wire12));
            end
        end
      reg24 <= reg16;
      reg25 <= reg24[(3'h4):(2'h2)];
      if (reg25[(4'hc):(3'h4)])
        begin
          reg26 <= wire13;
        end
      else
        begin
          if (reg26[(2'h3):(1'h1)])
            begin
              reg26 <= ($signed((8'hae)) <= ((wire12 ?
                  (~(reg22 <<< reg20)) : reg19[(4'h9):(3'h4)]) << (($signed(reg25) ?
                      reg26[(2'h3):(1'h1)] : $unsigned(reg23)) ?
                  ($unsigned(wire15) >>> (reg18 - reg20)) : $signed((reg21 ?
                      (8'hb5) : reg19)))));
              reg27 <= (~$signed(wire13));
              reg28 <= $signed(({(|reg25[(2'h3):(2'h3)]),
                      ($signed(reg26) * reg21)} ?
                  ({(reg21 ? reg21 : reg17), reg24} > $signed((reg16 ?
                      wire11 : reg19))) : (8'hb2)));
              reg29 <= $unsigned(((({reg18} ?
                      {reg21, (8'ha7)} : reg24[(2'h3):(2'h3)]) ?
                  $signed(reg22) : ((-wire14) ?
                      (wire11 < (8'had)) : $signed(reg25))) <= (($unsigned(reg23) >= $unsigned(wire14)) == (wire15[(1'h1):(1'h1)] == $unsigned(reg17)))));
            end
          else
            begin
              reg26 <= $unsigned(reg19[(3'h6):(3'h6)]);
            end
        end
      reg30 <= $unsigned((((+reg25[(4'ha):(3'h5)]) <<< {(8'hbc),
          $unsigned(reg21)}) >= reg20));
    end
  assign wire31 = ($signed($signed(reg25)) ?
                      $unsigned($unsigned(reg25)) : ($signed(reg22[(3'h7):(2'h2)]) ^~ $signed(reg28[(1'h1):(1'h1)])));
  module32 #() modinst54 (.wire37(reg25), .wire36(reg27), .wire34(reg26), .wire35(reg21), .clk(clk), .wire33(reg30), .y(wire53));
  module55 #() modinst78 (.wire56(reg27), .wire59(reg22), .y(wire77), .clk(clk), .wire58(wire12), .wire57(wire11));
  assign wire79 = ({{$signed($unsigned(wire11)), reg17[(2'h2):(1'h0)]},
                      (reg18[(3'h5):(1'h1)] ~^ (8'h9d))} << {($signed((wire31 ^ reg22)) ?
                          ((reg20 < reg24) ?
                              wire53[(3'h4):(2'h2)] : (wire53 ~^ reg16)) : $signed(((8'hb3) <= reg26)))});
  assign wire80 = reg23[(4'h9):(2'h3)];
  always
    @(posedge clk) begin
      if ((reg21 || ((8'hb9) && wire53)))
        begin
          reg81 <= (-((^(~&$signed(wire15))) || wire77));
          reg82 <= $unsigned((wire11[(3'h5):(2'h3)] ?
              wire12[(1'h0):(1'h0)] : $unsigned(($signed(reg27) || (+wire77)))));
          reg83 <= $signed(($signed(reg23) | wire13));
          reg84 <= ($unsigned($unsigned(((wire15 ? reg29 : wire12) ?
                  (wire79 > wire11) : {reg26}))) ?
              ((|{(wire79 ?
                      reg18 : wire79)}) >>> reg22[(4'h9):(2'h3)]) : $signed((&wire11[(3'h5):(3'h4)])));
          reg85 <= $unsigned((reg28[(4'h9):(1'h0)] ?
              $unsigned(wire14[(4'he):(4'he)]) : $unsigned($signed((-reg18)))));
        end
      else
        begin
          reg81 <= reg22;
          reg82 <= $signed($unsigned(reg84));
          reg83 <= (($unsigned($signed(wire11)) >>> (-reg84[(4'hc):(4'hc)])) ?
              $unsigned(wire77) : (8'had));
          reg84 <= reg83;
        end
      if ($signed((-reg85)))
        begin
          reg86 <= reg20[(2'h3):(1'h0)];
        end
      else
        begin
          reg86 <= wire14[(3'h4):(3'h4)];
          if (wire53)
            begin
              reg87 <= (^reg28[(4'hb):(2'h3)]);
            end
          else
            begin
              reg87 <= reg87;
              reg88 <= reg85;
            end
          reg89 <= reg23;
        end
      reg90 <= ($signed($unsigned($unsigned(reg24[(3'h4):(3'h4)]))) ?
          (+$signed(reg88)) : reg23[(1'h0):(1'h0)]);
      if ((|(wire12[(2'h3):(1'h1)] << reg81)))
        begin
          if ((wire77[(4'hc):(4'ha)] ?
              (&reg82[(3'h6):(2'h3)]) : ($signed(reg16[(4'hc):(4'ha)]) & (reg21 != wire31))))
            begin
              reg91 <= (&(8'hb6));
              reg92 <= $signed(reg23[(2'h2):(1'h1)]);
            end
          else
            begin
              reg91 <= (~|($unsigned(reg19[(2'h2):(2'h2)]) ?
                  {{wire14[(5'h13):(4'he)], (wire12 < wire15)},
                      ($unsigned(reg89) ~^ {(8'hb0)})} : {({wire77} ^ (reg83 >= reg90)),
                      (~^wire14)}));
              reg92 <= (~^(($signed((~&reg26)) <<< (wire80 ?
                      reg16[(1'h0):(1'h0)] : $signed(wire12))) ?
                  ($signed(((8'hae) && reg91)) >> ($unsigned(wire12) ?
                      (8'ha2) : reg91[(4'hc):(2'h3)])) : ($unsigned((reg20 ^~ reg83)) ?
                      $unsigned($unsigned(reg85)) : $signed((+wire12)))));
              reg93 <= (^~reg26);
            end
          if (reg27)
            begin
              reg94 <= ($signed($signed($signed((wire31 ^ (8'hbd))))) ?
                  reg88 : (reg20 ? (8'h9c) : reg85[(3'h7):(2'h2)]));
              reg95 <= $unsigned($signed((~&reg24[(3'h6):(2'h3)])));
            end
          else
            begin
              reg94 <= reg20;
              reg95 <= reg93;
            end
          reg96 <= wire15;
        end
      else
        begin
          reg91 <= {reg19, reg83};
          reg92 <= ((+(~|($signed(reg89) >> (-wire13)))) ?
              ($signed(wire31) ?
                  ({(reg25 ? wire13 : (8'ha8))} ?
                      ($unsigned(reg29) < reg87) : reg87[(5'h11):(1'h1)]) : (~|$unsigned(wire31[(3'h4):(3'h4)]))) : reg29[(3'h7):(2'h3)]);
          reg93 <= $signed((~&$signed(($signed(reg16) == ((8'hb5) - reg88)))));
          if ((!($unsigned($signed((reg93 << reg81))) & ((~|wire13) ?
              reg95 : ((+wire13) || (~^reg88))))))
            begin
              reg94 <= (reg85 - $signed(reg25));
              reg95 <= {$signed({$signed((reg85 ? wire80 : reg88)),
                      ({reg95, (8'hb0)} + $signed(reg28))}),
                  wire14[(1'h0):(1'h0)]};
              reg96 <= ($unsigned((reg89 ?
                      reg29[(4'h9):(1'h0)] : wire13[(4'h9):(4'h9)])) ?
                  {({{reg30}} ? reg87[(4'hc):(4'hb)] : (^{reg88, wire80})),
                      $signed(((reg16 ? reg95 : reg19) ?
                          ((8'h9f) ?
                              reg89 : reg87) : (reg22 == reg20)))} : (~reg23[(3'h6):(2'h3)]));
              reg97 <= $signed($unsigned(reg85[(3'h5):(2'h3)]));
            end
          else
            begin
              reg94 <= ((reg21 ?
                  $signed((!(&reg88))) : ((((8'ha9) && reg21) ?
                          ((8'ha4) ? (8'hac) : reg29) : reg85[(3'h5):(1'h1)]) ?
                      ({reg92} ?
                          {(8'hb5),
                              reg97} : $signed(reg20)) : (reg87[(5'h13):(3'h5)] <<< (reg81 ?
                          (8'hb6) : (8'hb6))))) != {reg92[(4'ha):(3'h6)]});
              reg95 <= (7'h40);
            end
        end
      reg98 <= reg23;
    end
  assign wire99 = wire11;
  assign wire100 = wire31[(1'h0):(1'h0)];
endmodule

module module55  (y, clk, wire59, wire58, wire57, wire56);
  output wire [(32'heb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire59;
  input wire signed [(2'h2):(1'h0)] wire58;
  input wire signed [(3'h4):(1'h0)] wire57;
  input wire [(4'ha):(1'h0)] wire56;
  wire signed [(5'h11):(1'h0)] wire76;
  wire [(3'h6):(1'h0)] wire74;
  wire signed [(3'h7):(1'h0)] wire73;
  wire signed [(5'h14):(1'h0)] wire72;
  wire signed [(5'h15):(1'h0)] wire71;
  wire [(5'h12):(1'h0)] wire70;
  wire [(5'h14):(1'h0)] wire69;
  wire [(3'h5):(1'h0)] wire68;
  wire signed [(3'h7):(1'h0)] wire67;
  wire [(5'h12):(1'h0)] wire66;
  wire signed [(5'h15):(1'h0)] wire65;
  wire [(5'h10):(1'h0)] wire64;
  wire [(5'h15):(1'h0)] wire63;
  wire [(3'h7):(1'h0)] wire62;
  wire signed [(3'h4):(1'h0)] wire61;
  wire [(3'h5):(1'h0)] wire60;
  reg [(5'h15):(1'h0)] reg75 = (1'h0);
  assign y = {wire76,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 reg75,
                 (1'h0)};
  assign wire60 = (wire58[(1'h0):(1'h0)] ?
                      {(!$unsigned($signed(wire57)))} : $signed((~^wire56[(1'h0):(1'h0)])));
  assign wire61 = (~|(($signed((wire57 ? wire56 : (8'haa))) ?
                          wire57 : ((wire57 ? wire60 : wire60) ?
                              (~|(8'hb4)) : $signed(wire57))) ?
                      (^~wire56[(3'h6):(1'h1)]) : $signed({wire60})));
  assign wire62 = ($signed({{(~wire60)}}) ? wire60 : wire57[(2'h2):(2'h2)]);
  assign wire63 = $unsigned($signed(wire58[(1'h0):(1'h0)]));
  assign wire64 = (8'hbc);
  assign wire65 = ({(wire62 ? $signed($unsigned(wire56)) : wire56)} ?
                      ((wire56[(1'h0):(1'h0)] + (7'h44)) > $unsigned($unsigned((8'h9f)))) : ($signed($signed(wire57)) ?
                          {(|wire59)} : $signed(($unsigned(wire62) ?
                              $signed(wire60) : wire62[(1'h0):(1'h0)]))));
  assign wire66 = $unsigned(wire62);
  assign wire67 = wire65;
  assign wire68 = ((|(wire59 ^ $unsigned($signed(wire56)))) ?
                      wire56 : {$unsigned(wire61[(2'h3):(2'h2)])});
  assign wire69 = $unsigned({wire61});
  assign wire70 = wire60[(2'h3):(2'h2)];
  assign wire71 = (wire64 || ((-(|wire58[(1'h1):(1'h0)])) <<< $unsigned(($unsigned(wire60) <= wire67))));
  assign wire72 = {wire71[(2'h3):(1'h0)], wire64};
  assign wire73 = (^~((&wire59[(1'h0):(1'h0)]) >>> (8'h9d)));
  assign wire74 = (wire63[(4'hc):(1'h1)] & wire60[(3'h5):(2'h2)]);
  always
    @(posedge clk) begin
      reg75 <= wire61;
    end
  assign wire76 = ($unsigned((8'hb5)) ?
                      wire56[(4'h8):(1'h0)] : {wire66[(4'h8):(2'h2)]});
endmodule

module module32  (y, clk, wire37, wire36, wire35, wire34, wire33);
  output wire [(32'hb2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire37;
  input wire signed [(4'ha):(1'h0)] wire36;
  input wire [(4'h9):(1'h0)] wire35;
  input wire [(2'h2):(1'h0)] wire34;
  input wire signed [(3'h5):(1'h0)] wire33;
  wire signed [(4'hd):(1'h0)] wire52;
  wire signed [(4'hc):(1'h0)] wire51;
  wire [(5'h11):(1'h0)] wire50;
  wire signed [(4'hd):(1'h0)] wire49;
  wire signed [(4'ha):(1'h0)] wire48;
  wire [(4'ha):(1'h0)] wire47;
  wire signed [(5'h10):(1'h0)] wire46;
  wire signed [(5'h11):(1'h0)] wire45;
  wire [(4'hc):(1'h0)] wire44;
  wire [(3'h4):(1'h0)] wire43;
  wire [(5'h14):(1'h0)] wire42;
  reg signed [(4'hf):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg40 = (1'h0);
  reg [(3'h7):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg38 = (1'h0);
  assign y = {wire52,
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
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg38 <= (wire35[(2'h2):(1'h0)] ? wire33 : wire36[(3'h4):(1'h0)]);
      reg39 <= wire33;
      reg40 <= $signed((wire34[(1'h0):(1'h0)] ?
          $signed($signed(((8'ha5) ?
              reg39 : wire36))) : (((wire34 >>> reg38) << $unsigned((8'ha1))) ?
              {(reg39 ~^ reg38)} : $unsigned($signed(wire35)))));
      reg41 <= {($signed(wire35[(1'h0):(1'h0)]) ?
              {$signed({reg40}),
                  (~reg38)} : (((8'hb8) == reg38[(3'h5):(3'h4)]) ?
                  (reg39 & (-wire35)) : {(~wire34)})),
          (^~$unsigned($signed(wire37)))};
    end
  assign wire42 = (~^$signed(wire34));
  assign wire43 = (&(|(wire37 ?
                      wire34[(1'h1):(1'h1)] : ((&reg40) ?
                          reg40[(3'h4):(1'h0)] : $signed((8'hbd))))));
  assign wire44 = reg40;
  assign wire45 = $signed((reg38[(2'h3):(2'h3)] ?
                      ($unsigned(reg39) ?
                          (8'hbe) : $signed($signed(wire34))) : (($signed(wire33) ?
                          (wire44 ^~ wire34) : reg38) == ((wire42 && wire36) ?
                          $signed(wire34) : (8'ha3)))));
  assign wire46 = $unsigned(($signed(wire42) && $unsigned(wire42)));
  assign wire47 = ((~|wire46[(4'hc):(4'ha)]) ?
                      ((~^reg41) << {(~^(^~reg38)),
                          wire36[(4'ha):(4'h9)]}) : $signed((wire46 ?
                          ($unsigned(wire46) != (wire42 ?
                              wire46 : wire43)) : wire42)));
  assign wire48 = (({reg39, $signed((&(8'h9d)))} ?
                      wire35[(3'h4):(2'h3)] : (wire34 ^ (^(~wire36)))) >>> (+$unsigned((|(wire42 ?
                      (8'hb8) : reg39)))));
  assign wire49 = $signed(($unsigned($signed(wire48)) ?
                      ($unsigned((wire43 ?
                          wire47 : wire43)) & (wire36[(1'h1):(1'h1)] == ((8'ha5) <<< wire33))) : wire46));
  assign wire50 = (^~$signed((8'ha8)));
  assign wire51 = $signed($unsigned($unsigned((wire50[(1'h1):(1'h1)] ?
                      (wire50 ? wire43 : wire47) : (wire46 ?
                          wire48 : (8'hbc))))));
  assign wire52 = $unsigned((7'h41));
endmodule
