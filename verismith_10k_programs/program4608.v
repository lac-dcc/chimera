module top
#(parameter param129 = ((|((&(+(8'hb4))) | ({(8'hbc)} <<< ((8'hbe) ~^ (8'hac))))) ? ((8'haf) * ((((8'hb4) ? (8'hb5) : (7'h41)) ? (-(8'h9f)) : {(8'hb8), (7'h44)}) ? {((8'h9d) ? (8'ha1) : (8'hb4)), (+(8'ha9))} : {((8'h9d) >> (8'hb9))})) : (((((8'hab) ? (8'ha8) : (8'hb7)) <<< (8'ha0)) ? (((8'hbd) & (8'haf)) ? (8'h9d) : (~|(8'ha9))) : (((7'h44) << (8'ha9)) ? ((8'ha8) ? (8'h9e) : (8'hbc)) : ((8'hbe) != (8'haa)))) ^~ (8'hb3))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'ha2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire4;
  wire signed [(3'h4):(1'h0)] wire128;
  wire signed [(5'h11):(1'h0)] wire127;
  wire [(3'h6):(1'h0)] wire126;
  wire [(4'ha):(1'h0)] wire125;
  wire signed [(4'ha):(1'h0)] wire123;
  wire [(5'h15):(1'h0)] wire5;
  wire signed [(4'ha):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire8;
  wire [(5'h15):(1'h0)] wire9;
  wire signed [(5'h15):(1'h0)] wire104;
  assign y = {wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire123,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire104,
                 (1'h0)};
  assign wire5 = ($unsigned((+(^~((8'hbe) >> wire3)))) ?
                     wire2 : (~^((-wire2[(1'h0):(1'h0)]) ?
                         ($signed((8'h9f)) <= (|wire1)) : (|((8'ha9) ?
                             wire3 : wire0)))));
  assign wire6 = wire2;
  assign wire7 = wire2[(1'h0):(1'h0)];
  assign wire8 = $signed(wire6[(3'h5):(3'h4)]);
  assign wire9 = ((wire7[(2'h3):(2'h2)] ?
                         $signed((7'h40)) : wire8[(4'ha):(1'h0)]) ?
                     (|{wire6[(3'h4):(1'h0)]}) : (((|(wire2 & (8'ha2))) * $unsigned(wire2)) ?
                         wire2 : (wire1 ? wire2 : (^(wire7 ? wire1 : wire8)))));
  module10 #() modinst105 (wire104, clk, wire8, wire5, wire2, wire7, wire4);
  module106 #() modinst124 (.wire107(wire3), .clk(clk), .wire108(wire104), .y(wire123), .wire109(wire8), .wire110(wire1));
  assign wire125 = wire6[(4'ha):(4'h8)];
  assign wire126 = $signed($signed((wire2[(3'h5):(3'h4)] ?
                       $signed((!wire5)) : {$signed(wire125)})));
  assign wire127 = (((~|$unsigned((wire5 < (8'hbc)))) + wire4) ?
                       $signed(wire8[(4'hf):(3'h5)]) : wire1);
  assign wire128 = wire0[(4'hd):(1'h1)];
endmodule

module module106
#(parameter param122 = (~&(((~^((8'hbc) ? (8'hbd) : (7'h43))) && (((8'ha2) ^ (8'hbc)) ? ((8'ha6) ? (8'ha1) : (8'ha5)) : (+(8'hac)))) ? {(8'ha6)} : (~|(((8'hb3) ^ (8'hbf)) ? (^~(8'hb9)) : ((8'hb8) - (8'hbf)))))))
(y, clk, wire110, wire109, wire108, wire107);
  output wire [(32'h89):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire110;
  input wire signed [(3'h7):(1'h0)] wire109;
  input wire signed [(4'hc):(1'h0)] wire108;
  input wire signed [(3'h5):(1'h0)] wire107;
  wire signed [(3'h5):(1'h0)] wire115;
  wire [(4'ha):(1'h0)] wire114;
  wire [(4'hc):(1'h0)] wire113;
  wire signed [(5'h12):(1'h0)] wire112;
  wire signed [(4'hf):(1'h0)] wire111;
  reg signed [(2'h3):(1'h0)] reg121 = (1'h0);
  reg [(4'h8):(1'h0)] reg120 = (1'h0);
  reg [(5'h12):(1'h0)] reg119 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg118 = (1'h0);
  reg [(5'h12):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg116 = (1'h0);
  assign y = {wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 (1'h0)};
  assign wire111 = ($unsigned((^~$signed({wire110,
                       wire109}))) == wire110[(4'hc):(3'h7)]);
  assign wire112 = (&wire111[(1'h0):(1'h0)]);
  assign wire113 = ((~(wire108[(4'hc):(3'h6)] ?
                       ($unsigned(wire107) == wire110[(4'hf):(4'hb)]) : (wire108 >= {wire111}))) | (wire108 >> ({(wire110 ?
                               wire111 : wire108)} ?
                       (~^wire109[(1'h0):(1'h0)]) : $signed((wire112 ?
                           wire107 : wire111)))));
  assign wire114 = $signed({(((~|wire109) ?
                               {(8'haf)} : (wire113 ? wire108 : wire112)) ?
                           (wire108[(4'h8):(3'h4)] ^ $unsigned(wire110)) : $unsigned((wire110 << wire108)))});
  assign wire115 = $unsigned($unsigned((&$signed((wire107 ?
                       wire111 : wire109)))));
  always
    @(posedge clk) begin
      reg116 <= (-(wire112[(5'h12):(4'h8)] + wire108[(2'h3):(2'h3)]));
      reg117 <= (8'h9f);
      reg118 <= $unsigned($unsigned(($signed((-wire115)) ?
          wire115 : wire114[(2'h2):(2'h2)])));
      reg119 <= (^($unsigned({$unsigned(wire115)}) ^~ (7'h40)));
    end
  always
    @(posedge clk) begin
      reg120 <= ({(wire115[(2'h3):(1'h1)] == (&$signed(wire109))),
              $unsigned($unsigned((-reg116)))} ?
          ($signed($signed(wire108)) ?
              wire108[(2'h2):(1'h0)] : $unsigned((&wire112[(4'ha):(3'h4)]))) : wire114[(1'h0):(1'h0)]);
      reg121 <= ((&$unsigned(reg118[(1'h1):(1'h1)])) ?
          $unsigned((&reg119[(5'h12):(2'h2)])) : ({$signed((7'h43)), reg116} ?
              ($signed(wire111[(2'h2):(1'h0)]) ?
                  {(8'hbf)} : reg116[(2'h2):(1'h1)]) : {($signed((8'h9f)) ?
                      {wire113} : (~|wire110)),
                  $signed(wire107)}));
    end
endmodule

module module10
#(parameter param102 = (^~(^~({(~&(7'h44)), ((8'ha9) << (8'ha9))} & ({(8'ha8)} + (8'haa))))), 
parameter param103 = ((((7'h43) ? param102 : (!param102)) ? (((param102 != param102) ? (!(7'h42)) : (^~param102)) < ({param102, param102} + {param102})) : ((|(!param102)) ? (|(param102 || param102)) : ((^(8'ha5)) ^ param102))) ? {((!(+param102)) ? ((!param102) < (&param102)) : param102), ((~(^~(8'hab))) ^~ (~(param102 ? param102 : param102)))} : (~|param102)))
(y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'h305):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire15;
  input wire [(5'h15):(1'h0)] wire14;
  input wire signed [(5'h11):(1'h0)] wire13;
  input wire signed [(5'h15):(1'h0)] wire12;
  input wire [(5'h14):(1'h0)] wire11;
  wire [(5'h12):(1'h0)] wire101;
  wire signed [(3'h5):(1'h0)] wire100;
  wire [(3'h5):(1'h0)] wire99;
  wire [(4'hd):(1'h0)] wire98;
  wire [(2'h3):(1'h0)] wire94;
  wire [(4'h8):(1'h0)] wire84;
  wire signed [(3'h7):(1'h0)] wire56;
  wire signed [(3'h6):(1'h0)] wire42;
  wire signed [(5'h13):(1'h0)] wire41;
  wire signed [(5'h15):(1'h0)] wire40;
  wire [(4'hb):(1'h0)] wire39;
  wire signed [(4'hf):(1'h0)] wire38;
  wire signed [(5'h12):(1'h0)] wire16;
  reg signed [(3'h6):(1'h0)] reg97 = (1'h0);
  reg [(4'hf):(1'h0)] reg96 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg95 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg92 = (1'h0);
  reg [(4'hc):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg86 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg85 = (1'h0);
  reg [(5'h15):(1'h0)] reg83 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg80 = (1'h0);
  reg [(4'hd):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg78 = (1'h0);
  reg [(3'h7):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg76 = (1'h0);
  reg [(2'h3):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg73 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg72 = (1'h0);
  reg [(2'h2):(1'h0)] reg71 = (1'h0);
  reg [(3'h4):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg69 = (1'h0);
  reg [(4'hf):(1'h0)] reg68 = (1'h0);
  reg [(4'h8):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg65 = (1'h0);
  reg [(3'h5):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg63 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg62 = (1'h0);
  reg [(4'hd):(1'h0)] reg61 = (1'h0);
  reg [(4'h9):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg59 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg58 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg17 = (1'h0);
  reg [(4'ha):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg20 = (1'h0);
  reg [(4'hc):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg22 = (1'h0);
  reg [(5'h15):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg24 = (1'h0);
  reg [(4'h9):(1'h0)] reg25 = (1'h0);
  reg [(2'h2):(1'h0)] reg26 = (1'h0);
  reg [(4'h9):(1'h0)] reg27 = (1'h0);
  reg [(2'h3):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg29 = (1'h0);
  reg [(4'h9):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg31 = (1'h0);
  reg [(4'h8):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg34 = (1'h0);
  reg [(4'hf):(1'h0)] reg35 = (1'h0);
  reg signed [(4'he):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg37 = (1'h0);
  assign y = {wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire94,
                 wire84,
                 wire56,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire16,
                 reg97,
                 reg96,
                 reg95,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
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
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 (1'h0)};
  assign wire16 = wire14[(3'h4):(2'h2)];
  always
    @(posedge clk) begin
      if (wire14[(4'he):(2'h2)])
        begin
          reg17 <= wire11[(4'ha):(4'h9)];
        end
      else
        begin
          reg17 <= (wire12 ~^ reg17[(1'h0):(1'h0)]);
          if ($unsigned((reg17[(2'h2):(1'h0)] ?
              wire16 : $signed(wire16[(4'hf):(4'he)]))))
            begin
              reg18 <= {(^~(|{wire11, $unsigned(wire13)})),
                  (wire16[(3'h4):(1'h1)] ?
                      $signed((wire12[(2'h2):(1'h1)] >>> $unsigned(reg17))) : ($unsigned((wire13 * wire12)) + $unsigned((reg17 ?
                          reg17 : wire13))))};
              reg19 <= $signed(({$signed($unsigned(wire15)),
                  (-$unsigned((7'h44)))} <= {wire11, wire14[(4'hf):(4'h8)]}));
            end
          else
            begin
              reg18 <= {$signed((8'hb9)), wire12[(1'h0):(1'h0)]};
              reg19 <= $signed(wire14);
              reg20 <= (8'ha2);
              reg21 <= (~&((|$signed(reg17[(4'hb):(1'h1)])) ?
                  (~(~&{wire15, wire13})) : ((wire14 ?
                      $signed((8'hbd)) : reg18[(3'h7):(3'h6)]) && (wire15[(2'h3):(1'h1)] && (wire15 & wire14)))));
              reg22 <= {wire13[(4'hb):(4'ha)]};
            end
          if (({reg19[(3'h5):(1'h0)],
              ($signed(reg20[(2'h3):(2'h2)]) <= (~&((8'ha4) >> wire13)))} - ($unsigned(($signed(wire12) ?
              $unsigned(wire16) : (+reg19))) >>> $signed(($signed(wire15) ?
              wire15[(1'h1):(1'h1)] : $signed(reg22))))))
            begin
              reg23 <= wire11[(5'h10):(4'hf)];
              reg24 <= (((wire16[(3'h4):(3'h4)] <<< ($signed((8'ha4)) && (reg18 ?
                      wire15 : wire13))) ?
                  $unsigned((^~wire11)) : wire13[(3'h5):(2'h2)]) << reg21[(3'h6):(2'h2)]);
              reg25 <= reg20[(3'h5):(3'h4)];
            end
          else
            begin
              reg23 <= reg23[(4'he):(3'h6)];
              reg24 <= (~^$unsigned({{reg25[(4'h9):(2'h3)]},
                  {(wire15 ? reg18 : wire16), wire15}}));
              reg25 <= (!reg23[(5'h14):(3'h4)]);
            end
          reg26 <= $unsigned((reg18[(2'h3):(2'h2)] ?
              $signed(((|reg23) ? reg21 : wire13)) : wire15[(1'h1):(1'h0)]));
        end
      reg27 <= $unsigned($unsigned((((reg18 & reg23) ? {wire11} : reg21) ?
          ($signed(reg18) ?
              $unsigned(wire16) : (~|(8'hb1))) : ($unsigned(wire13) ?
              reg23 : ((8'ha5) ^ reg24)))));
      reg28 <= reg23[(4'hc):(4'hb)];
      if ((&$signed({wire13, reg20[(2'h2):(1'h0)]})))
        begin
          reg29 <= (^(!((&reg24) < {reg17[(4'hc):(2'h3)], reg28})));
          if (((~^(8'hb9)) ?
              $signed(reg27[(1'h0):(1'h0)]) : $signed(((~&(reg26 > reg29)) ?
                  $signed(((8'hb7) ?
                      wire13 : wire11)) : reg21[(1'h1):(1'h1)]))))
            begin
              reg30 <= $signed($signed($unsigned(((-wire14) ?
                  $unsigned(reg21) : (reg18 ? (8'haf) : reg23)))));
              reg31 <= (reg18 ? reg27[(4'h8):(3'h7)] : wire16[(5'h10):(4'hc)]);
              reg32 <= reg27;
              reg33 <= $signed(reg30[(1'h1):(1'h0)]);
            end
          else
            begin
              reg30 <= (reg33[(2'h3):(2'h3)] ?
                  $signed(((+(^~reg24)) ?
                      (reg29[(4'hc):(4'h9)] << (|(8'hb2))) : (wire16 - (reg29 != reg24)))) : (~reg22));
              reg31 <= $signed(reg32);
            end
        end
      else
        begin
          if ((~^reg25))
            begin
              reg29 <= $unsigned((!((|{wire16}) ?
                  (-{reg31, (8'hb7)}) : reg18)));
            end
          else
            begin
              reg29 <= $unsigned((^$signed($unsigned(wire12[(1'h0):(1'h0)]))));
              reg30 <= reg26[(1'h1):(1'h0)];
            end
          reg31 <= (8'hb9);
          if ({(reg31 ?
                  $signed($signed($signed(reg33))) : wire16[(2'h3):(1'h0)]),
              $unsigned($unsigned((8'hb4)))})
            begin
              reg32 <= $signed(reg17[(2'h2):(1'h0)]);
              reg33 <= $unsigned($signed((~&reg28)));
              reg34 <= (reg19 ?
                  $unsigned((~&reg29[(4'hd):(4'h8)])) : (wire14 | wire13[(4'hc):(4'ha)]));
              reg35 <= $unsigned($signed($signed(((8'hbf) ?
                  (reg21 == (8'h9d)) : (reg23 <<< wire15)))));
              reg36 <= (&(~|(reg27[(3'h6):(1'h1)] ?
                  $signed((!reg24)) : (^(~&reg25)))));
            end
          else
            begin
              reg32 <= {$signed(reg31)};
              reg33 <= $unsigned({(~(reg31[(1'h1):(1'h1)] || $unsigned((8'hb8)))),
                  (~^{(reg24 + reg18), (reg23 ? reg35 : reg30)})});
              reg34 <= (^~$unsigned(reg18[(3'h7):(3'h5)]));
              reg35 <= {$unsigned(($unsigned((!wire13)) ?
                      $signed((^~reg28)) : $signed((wire14 ?
                          reg36 : wire12))))};
            end
        end
      reg37 <= ({(($unsigned(reg23) && (reg29 ? reg23 : reg32)) ?
              (wire12 ?
                  {reg32} : reg32[(4'h8):(1'h0)]) : (8'hb4))} && reg19[(2'h3):(2'h2)]);
    end
  assign wire38 = $signed(wire15);
  assign wire39 = $unsigned($signed(reg29));
  assign wire40 = $unsigned((8'ha3));
  assign wire41 = $unsigned($unsigned($unsigned($unsigned(((8'ha1) <<< wire16)))));
  assign wire42 = ((({{reg30}} || ((wire38 || (8'hb8)) <<< $unsigned(wire15))) << {{wire38,
                          wire40[(5'h10):(5'h10)]}}) >= reg25[(3'h4):(1'h1)]);
  module43 #() modinst57 (.wire44(wire12), .wire48(reg27), .wire46(wire14), .y(wire56), .wire47(wire15), .clk(clk), .wire45(wire40));
  always
    @(posedge clk) begin
      reg58 <= (|$signed(reg29));
      reg59 <= (~(reg30[(1'h1):(1'h0)] >= reg31));
      reg60 <= ((&$unsigned((8'hb2))) ?
          $signed((!$unsigned($unsigned((8'hbb))))) : ($unsigned((|(8'hae))) ?
              ({(reg22 >> reg28)} ?
                  $unsigned($unsigned(reg25)) : $signed(reg29[(4'ha):(4'ha)])) : wire40[(4'ha):(4'h9)]));
      reg61 <= reg27[(1'h1):(1'h0)];
      reg62 <= (|(|($signed((!(8'ha5))) ?
          (reg21 >> reg17[(4'hc):(2'h2)]) : (8'hb5))));
    end
  always
    @(posedge clk) begin
      reg63 <= (!((+{((8'ha5) - wire39)}) & (&reg29[(4'hd):(3'h6)])));
      if ((wire42[(3'h6):(1'h0)] ?
          ((reg34 ?
                  ((&wire38) + reg22[(1'h0):(1'h0)]) : $unsigned(reg60[(3'h7):(3'h5)])) ?
              $signed($signed({reg61})) : $signed(reg60)) : ($signed(reg63) ?
              reg33[(3'h4):(2'h3)] : $signed(wire41[(4'hf):(1'h0)]))))
        begin
          reg64 <= $unsigned(reg19);
          reg65 <= {$unsigned({$signed($signed((8'hb2)))})};
          reg66 <= (reg22 - ($unsigned($signed((8'hbd))) != {reg65[(4'hc):(1'h1)],
              wire38}));
          reg67 <= $unsigned(reg31[(2'h3):(1'h1)]);
          reg68 <= $signed($unsigned(wire40));
        end
      else
        begin
          reg64 <= $unsigned((((~|(reg31 != reg28)) || (reg60 >> $signed(reg37))) ?
              $unsigned((~&reg65[(3'h6):(1'h1)])) : reg29));
          if ((8'haa))
            begin
              reg65 <= reg65[(4'hb):(4'ha)];
              reg66 <= reg29[(4'hf):(4'h8)];
              reg67 <= wire12;
              reg68 <= $unsigned(reg28);
            end
          else
            begin
              reg65 <= wire13;
              reg66 <= $signed(((+{(reg28 ? reg22 : wire42),
                  (wire39 ? reg23 : reg34)}) >> reg25));
              reg67 <= (|wire14[(1'h1):(1'h1)]);
              reg68 <= ($unsigned({{(reg29 >>> reg58), $signed((8'haf))},
                      ((~^wire41) * (wire15 ? (8'ha7) : reg18))}) ?
                  $unsigned((reg35[(2'h3):(1'h1)] ?
                      reg34[(3'h4):(2'h2)] : {$signed((8'hae))})) : (reg22 ?
                      $unsigned((|$signed(wire38))) : {$signed((reg64 <<< (8'ha3)))}));
              reg69 <= ((wire40 <= (~|$signed({reg61, reg58}))) ?
                  wire38 : reg20[(1'h0):(1'h0)]);
            end
          reg70 <= reg25[(2'h3):(2'h2)];
          reg71 <= ($signed(($signed((reg24 ? (8'hae) : wire38)) ?
              ((+reg63) ?
                  wire16 : reg35) : $unsigned($signed(reg58)))) < $unsigned($signed(reg37)));
          if ((reg33 & $unsigned(($signed($unsigned(wire39)) ?
              ($unsigned(reg26) + $signed(reg62)) : reg23[(5'h15):(5'h10)]))))
            begin
              reg72 <= $signed((^(~^$unsigned(reg23))));
              reg73 <= (((($signed(reg61) ? wire11 : $unsigned((7'h43))) ?
                          $signed({reg70, reg19}) : (~$signed(wire13))) ?
                      $signed(((reg64 ? reg60 : reg70) ?
                          {reg65,
                              reg59} : (~|reg65))) : $unsigned({$signed(reg60),
                          (reg25 ? reg61 : (8'hb1))})) ?
                  reg18 : $unsigned(wire56[(1'h1):(1'h1)]));
              reg74 <= (reg19 ?
                  {$unsigned(wire11)} : ($signed($unsigned(wire15[(4'hc):(4'hb)])) ?
                      ({wire12, (^(8'hbd))} << ((^wire12) && reg25)) : (reg28 ?
                          reg26[(1'h0):(1'h0)] : reg27)));
              reg75 <= $signed(reg22[(1'h0):(1'h0)]);
              reg76 <= ($unsigned($signed($unsigned($unsigned(wire15)))) ^~ wire56);
            end
          else
            begin
              reg72 <= reg19;
              reg73 <= ((8'hae) ?
                  $unsigned((reg17 ?
                      (&$signed(reg65)) : (~reg76[(2'h2):(2'h2)]))) : ($signed((-((8'hbd) ?
                      (8'ha3) : reg36))) <<< $unsigned($signed((reg59 > reg22)))));
              reg74 <= reg36;
              reg75 <= $signed($unsigned($unsigned(((+reg31) >= reg26[(2'h2):(2'h2)]))));
              reg76 <= wire16;
            end
        end
      if (reg26)
        begin
          reg77 <= (-($signed(((reg58 ? reg69 : reg31) == ((8'h9f) ?
                  reg62 : reg76))) ?
              (((&reg71) ^~ (reg17 < (8'ha7))) != $unsigned((wire14 > reg30))) : (&reg69[(2'h3):(1'h0)])));
          reg78 <= {$signed({$signed((wire15 ? wire14 : wire42))}),
              $signed(reg27[(1'h0):(1'h0)])};
          reg79 <= ($signed(reg76[(3'h6):(3'h6)]) ?
              (^~((wire15 << $unsigned(reg36)) ?
                  reg70[(1'h0):(1'h0)] : $signed(reg20[(4'h8):(3'h4)]))) : ($signed(((reg73 && reg18) << (-wire15))) >= $signed(((reg36 - reg61) ?
                  (wire12 == (7'h41)) : (wire38 ? wire56 : reg31)))));
          reg80 <= (|reg76);
        end
      else
        begin
          reg77 <= $signed((+{(wire15[(3'h7):(2'h3)] ?
                  $unsigned((8'hba)) : $unsigned(reg69)),
              $signed($unsigned(wire38))}));
          reg78 <= (reg35[(1'h0):(1'h0)] != reg78);
          if (((((!wire16) ?
                  $signed($unsigned(wire11)) : ({reg76} | $unsigned((8'hb8)))) ^ (~|reg58)) ?
              $signed(reg68[(3'h5):(2'h3)]) : (|(^wire56[(3'h4):(3'h4)]))))
            begin
              reg79 <= ((&$signed((~(7'h41)))) << $signed($signed(reg75[(2'h2):(2'h2)])));
              reg80 <= $unsigned($unsigned(reg37));
            end
          else
            begin
              reg79 <= $unsigned((8'h9f));
            end
          reg81 <= $unsigned(((reg35 * ($unsigned(wire15) ?
              {(8'hac)} : $unsigned(reg61))) <= (!(!wire13))));
        end
    end
  always
    @(posedge clk) begin
      reg82 <= ($unsigned((~(-reg23[(5'h15):(4'hb)]))) ?
          $unsigned({(~{reg76})}) : {((~&reg33[(1'h1):(1'h1)]) ?
                  wire12 : $signed(reg33[(2'h2):(1'h1)]))});
      reg83 <= {(reg27 ?
              $unsigned(($unsigned(reg17) ^~ (|reg26))) : (&$unsigned(reg32)))};
    end
  assign wire84 = (^(^~($unsigned(reg31) << ((^~reg82) ^ (!reg27)))));
  always
    @(posedge clk) begin
      if (wire42)
        begin
          reg85 <= (({(+reg21[(4'hc):(4'hb)])} && $unsigned(((reg23 ?
              (8'ha1) : reg19) < $unsigned(reg75)))) || $unsigned($signed($signed($unsigned(reg75)))));
          reg86 <= $signed(reg73);
        end
      else
        begin
          reg85 <= {(reg68 - $signed({$unsigned(reg26)})),
              $signed((((+reg70) && reg26[(1'h1):(1'h1)]) || (reg65[(4'hd):(4'hb)] ?
                  ((8'hbd) ? reg58 : reg28) : {wire38, reg59})))};
          if (wire14)
            begin
              reg86 <= (((wire84[(1'h1):(1'h0)] ^ ((wire16 ? reg26 : (8'hb9)) ?
                  reg61 : reg66)) + wire42) == $unsigned($unsigned(reg73)));
              reg87 <= (({(^reg81[(1'h0):(1'h0)])} == $signed((~|(!(8'ha9))))) - $signed((^$unsigned($unsigned(reg79)))));
              reg88 <= reg23;
              reg89 <= wire12[(4'hb):(3'h7)];
              reg90 <= $unsigned($unsigned($signed(reg79[(4'h8):(2'h2)])));
            end
          else
            begin
              reg86 <= $signed((~|reg75));
              reg87 <= $signed({$unsigned({reg78, (reg63 == reg82)})});
            end
        end
      reg91 <= $signed((~^reg82[(3'h5):(2'h2)]));
      reg92 <= (~|(|reg59[(2'h3):(1'h1)]));
      reg93 <= $unsigned(($unsigned($unsigned((reg79 << reg65))) ?
          reg18 : (&((reg77 + reg66) ?
              reg24[(1'h1):(1'h0)] : reg90[(3'h4):(1'h0)]))));
    end
  assign wire94 = reg82;
  always
    @(posedge clk) begin
      reg95 <= reg33[(3'h4):(1'h1)];
      reg96 <= $unsigned(reg80[(5'h13):(4'hf)]);
      reg97 <= $unsigned(($signed($unsigned((+wire15))) ?
          {reg95, wire12[(5'h14):(2'h2)]} : reg86[(2'h2):(1'h1)]));
    end
  assign wire98 = $unsigned({reg72[(3'h6):(2'h2)]});
  assign wire99 = $unsigned((|((~$signed((8'hb5))) * wire42)));
  assign wire100 = {(-$unsigned($signed(reg85[(1'h0):(1'h0)]))), (~^wire16)};
  assign wire101 = {$signed(reg36)};
endmodule

module module43  (y, clk, wire48, wire47, wire46, wire45, wire44);
  output wire [(32'h49):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire48;
  input wire [(5'h14):(1'h0)] wire47;
  input wire [(5'h15):(1'h0)] wire46;
  input wire signed [(5'h13):(1'h0)] wire45;
  input wire signed [(5'h15):(1'h0)] wire44;
  wire signed [(4'ha):(1'h0)] wire55;
  wire signed [(5'h12):(1'h0)] wire54;
  wire [(4'ha):(1'h0)] wire53;
  wire [(4'hb):(1'h0)] wire52;
  wire [(2'h2):(1'h0)] wire51;
  wire [(4'hb):(1'h0)] wire49;
  reg signed [(4'ha):(1'h0)] reg50 = (1'h0);
  assign y = {wire55, wire54, wire53, wire52, wire51, wire49, reg50, (1'h0)};
  assign wire49 = wire44[(5'h14):(3'h4)];
  always
    @(posedge clk) begin
      if ($unsigned((wire47 ?
          (wire45[(4'hd):(3'h7)] < {{wire49}}) : {({wire45, wire48} ?
                  $signed(wire49) : $unsigned(wire49))})))
        begin
          reg50 <= ($unsigned(wire44[(5'h13):(4'ha)]) ?
              ((&wire47) - wire46[(5'h14):(4'hc)]) : $unsigned((wire47 <= (&wire46[(4'ha):(4'h8)]))));
        end
      else
        begin
          reg50 <= $unsigned((~&$signed({$signed((8'haf)), reg50})));
        end
    end
  assign wire51 = wire48[(2'h2):(1'h1)];
  assign wire52 = $signed($signed({wire45, $signed(reg50)}));
  assign wire53 = ($signed($signed($signed((wire46 ?
                      (8'hb1) : wire51)))) * (-(!{$unsigned(wire52),
                      $signed(wire48)})));
  assign wire54 = (-reg50);
  assign wire55 = $signed(wire51);
endmodule
