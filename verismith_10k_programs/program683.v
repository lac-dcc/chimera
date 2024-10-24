module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h64):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire4;
  wire signed [(3'h5):(1'h0)] wire203;
  wire [(4'h8):(1'h0)] wire202;
  wire [(2'h2):(1'h0)] wire201;
  wire [(2'h3):(1'h0)] wire200;
  wire [(3'h4):(1'h0)] wire199;
  wire signed [(3'h7):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire7;
  wire [(3'h6):(1'h0)] wire9;
  wire [(4'hc):(1'h0)] wire197;
  reg [(4'he):(1'h0)] reg8 = (1'h0);
  assign y = {wire203,
                 wire202,
                 wire201,
                 wire200,
                 wire199,
                 wire5,
                 wire6,
                 wire7,
                 wire9,
                 wire197,
                 reg8,
                 (1'h0)};
  assign wire5 = {{wire0[(1'h1):(1'h1)], wire0[(1'h0):(1'h0)]},
                     wire1[(3'h5):(3'h5)]};
  assign wire6 = $unsigned($signed($signed($unsigned(((8'ha4) ?
                     wire0 : wire4)))));
  assign wire7 = ({((8'haa) || wire1[(1'h1):(1'h1)]),
                     wire6[(1'h1):(1'h0)]} + {(wire2 - $signed({(8'hb0),
                         wire2}))});
  always
    @(posedge clk) begin
      reg8 <= ((wire0 ?
              {wire0} : (wire2 ? $signed((^wire3)) : (~wire1[(2'h3):(2'h2)]))) ?
          $unsigned((({wire3, (8'hb6)} ?
              (8'h9c) : $unsigned((8'hb7))) <<< {(wire2 ?
                  wire1 : wire1)})) : wire3[(2'h3):(1'h0)]);
    end
  assign wire9 = (({$unsigned(wire2)} ~^ wire7[(2'h2):(1'h1)]) ?
                     $signed(($signed((wire1 <= wire7)) ?
                         {wire6,
                             (~wire7)} : (wire3 << wire1))) : (wire6[(3'h5):(1'h0)] ?
                         $signed((7'h43)) : (~^wire3)));
  module10 #() modinst198 (wire197, clk, wire1, wire6, wire7, wire4, wire0);
  assign wire199 = wire5;
  assign wire200 = wire197;
  assign wire201 = wire199[(2'h2):(1'h0)];
  assign wire202 = $signed((!$signed($unsigned((wire197 ? wire5 : wire4)))));
  assign wire203 = (($signed({((7'h44) ? wire7 : wire200)}) ?
                           wire199 : $unsigned(wire199[(1'h0):(1'h0)])) ?
                       wire9[(2'h3):(1'h1)] : ((~^$unsigned(wire9[(3'h4):(1'h1)])) ?
                           ((~&wire2) >>> wire6[(4'hd):(3'h6)]) : ($unsigned((wire202 ?
                                   wire199 : wire2)) ?
                               wire7[(4'hd):(3'h5)] : $signed((+wire7)))));
endmodule

module module10
#(parameter param195 = ({{(((8'haf) < (8'hbd)) ~^ ((7'h44) - (8'hab))), (((8'ha2) ? (8'hb6) : (8'h9e)) ? (-(8'hbb)) : ((8'hab) * (8'ha5)))}, (({(8'hb0)} ? {(8'hb8), (8'ha6)} : ((8'h9d) ? (8'had) : (8'haf))) ? ((!(8'ha6)) * ((8'hbb) ? (8'hac) : (8'hab))) : (~((8'ha4) ? (8'h9f) : (8'hb6))))} & (~|(^(8'hbe)))), 
parameter param196 = {(8'haf), (param195 ? ((-(^param195)) ? (|param195) : ((param195 ^~ param195) <= (param195 >>> param195))) : (!(8'hbc)))})
(y, clk, wire11, wire12, wire13, wire14, wire15);
  output wire [(32'h297):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire11;
  input wire signed [(5'h14):(1'h0)] wire12;
  input wire signed [(5'h12):(1'h0)] wire13;
  input wire [(3'h5):(1'h0)] wire14;
  input wire [(4'hd):(1'h0)] wire15;
  wire signed [(5'h14):(1'h0)] wire194;
  wire [(4'hf):(1'h0)] wire193;
  wire signed [(5'h12):(1'h0)] wire185;
  wire [(4'hb):(1'h0)] wire151;
  wire signed [(5'h13):(1'h0)] wire150;
  wire signed [(5'h13):(1'h0)] wire149;
  wire [(5'h14):(1'h0)] wire73;
  wire [(5'h10):(1'h0)] wire28;
  wire [(4'hc):(1'h0)] wire53;
  wire [(5'h12):(1'h0)] wire125;
  wire signed [(5'h14):(1'h0)] wire147;
  wire signed [(5'h15):(1'h0)] wire187;
  wire [(5'h11):(1'h0)] wire190;
  wire signed [(5'h15):(1'h0)] wire191;
  reg signed [(2'h3):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg91 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg90 = (1'h0);
  reg [(4'hd):(1'h0)] reg89 = (1'h0);
  reg [(2'h3):(1'h0)] reg88 = (1'h0);
  reg [(4'he):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg85 = (1'h0);
  reg [(5'h10):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg82 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg81 = (1'h0);
  reg [(2'h3):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg79 = (1'h0);
  reg [(5'h15):(1'h0)] reg78 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg76 = (1'h0);
  reg [(4'hc):(1'h0)] reg75 = (1'h0);
  reg [(4'hd):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg27 = (1'h0);
  reg [(5'h14):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg24 = (1'h0);
  reg [(5'h13):(1'h0)] reg23 = (1'h0);
  reg [(5'h14):(1'h0)] reg22 = (1'h0);
  reg [(4'ha):(1'h0)] reg21 = (1'h0);
  reg [(5'h10):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg189 = (1'h0);
  assign y = {wire194,
                 wire193,
                 wire185,
                 wire151,
                 wire150,
                 wire149,
                 wire73,
                 wire28,
                 wire53,
                 wire125,
                 wire147,
                 wire187,
                 wire190,
                 wire191,
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
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg29,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg189,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((({$signed(wire13[(5'h10):(1'h0)])} ?
          {wire11[(4'hf):(3'h6)]} : $unsigned($unsigned((wire11 ?
              wire12 : wire14)))) == (!wire11[(1'h0):(1'h0)])))
        begin
          if (wire15[(1'h1):(1'h1)])
            begin
              reg16 <= (^~(8'hbf));
              reg17 <= ($unsigned(wire11[(1'h1):(1'h1)]) ?
                  wire14[(1'h0):(1'h0)] : (8'hbb));
              reg18 <= (wire14[(1'h0):(1'h0)] ?
                  $signed($unsigned(($signed(reg17) ^~ $unsigned(wire13)))) : reg16);
            end
          else
            begin
              reg16 <= (|((8'hbc) != wire13));
              reg17 <= (reg18[(1'h1):(1'h1)] ?
                  (^~($unsigned(reg18) ^ ($unsigned(wire15) != reg17[(1'h1):(1'h1)]))) : (wire12[(4'h9):(4'h9)] ?
                      $signed(((wire11 ? wire13 : wire15) ?
                          (wire11 ?
                              reg18 : (8'hb8)) : $unsigned(reg18))) : $unsigned(reg16[(2'h3):(1'h0)])));
            end
          reg19 <= $signed($unsigned((|reg16)));
          if ($signed(reg16))
            begin
              reg20 <= $signed((wire12 ?
                  $signed((7'h41)) : ((^$unsigned((8'hbf))) >>> ((wire14 && wire11) - (wire15 ?
                      reg18 : wire14)))));
              reg21 <= $signed(wire13);
              reg22 <= reg18[(1'h1):(1'h0)];
            end
          else
            begin
              reg20 <= {$unsigned(reg18[(1'h0):(1'h0)]),
                  (~$signed(wire15[(2'h3):(2'h2)]))};
              reg21 <= wire14[(2'h3):(2'h3)];
              reg22 <= $signed(wire11[(4'h9):(2'h3)]);
              reg23 <= {(reg22[(4'hd):(1'h0)] | $signed(wire14)),
                  (wire11 ?
                      {((wire11 && reg16) ? wire11 : (reg18 ? reg19 : reg16)),
                          (~(-(8'h9d)))} : reg21[(2'h2):(1'h0)])};
              reg24 <= $signed($signed(reg23));
            end
        end
      else
        begin
          reg16 <= $unsigned(wire11[(4'ha):(3'h6)]);
          reg17 <= (+reg16[(4'hb):(1'h0)]);
          if (((7'h44) ? $unsigned((^~reg17)) : reg23[(4'h8):(2'h3)]))
            begin
              reg18 <= reg23;
              reg19 <= $signed(reg17[(4'h9):(2'h2)]);
              reg20 <= reg23;
              reg21 <= (+($signed(($signed(reg22) ?
                  (wire11 <<< reg17) : reg23[(5'h12):(5'h10)])) >>> (~|$unsigned(((8'ha8) ^~ reg23)))));
              reg22 <= reg22;
            end
          else
            begin
              reg18 <= (~^(((((8'hb8) - reg24) >>> $signed(wire12)) ?
                  ($signed(reg22) << ((8'hb2) & reg20)) : wire12) <= (^~(-reg17[(4'h8):(2'h3)]))));
              reg19 <= reg21;
            end
          if (wire15[(1'h1):(1'h1)])
            begin
              reg23 <= $unsigned((!$signed($unsigned((reg23 ?
                  reg18 : wire14)))));
              reg24 <= wire13[(4'he):(4'h9)];
              reg25 <= (+$signed((((reg23 ? (8'hb4) : reg17) * wire13) ?
                  ($unsigned(reg21) ?
                      $signed(reg16) : $unsigned(reg17)) : $unsigned($signed(reg23)))));
              reg26 <= ((((reg24 >> reg18) | reg24) ?
                  {($signed((8'hba)) ? (reg21 == (8'ha6)) : (~|wire11)),
                      $unsigned((reg17 ?
                          reg17 : wire11))} : wire11) * ((+$signed({reg23,
                      reg20})) ?
                  reg23[(1'h0):(1'h0)] : wire14[(2'h2):(2'h2)]));
              reg27 <= (($unsigned($signed((^~(8'h9f)))) ?
                  (8'hb1) : $unsigned(wire13)) + (8'hbe));
            end
          else
            begin
              reg23 <= reg22[(4'he):(1'h1)];
            end
        end
    end
  assign wire28 = $unsigned(wire13);
  always
    @(posedge clk) begin
      reg29 <= (!(7'h42));
    end
  module30 #() modinst54 (.clk(clk), .y(wire53), .wire34(reg16), .wire33(reg27), .wire31(wire13), .wire32(reg29));
  module55 #() modinst74 (.wire59(wire13), .wire57(reg26), .wire58(reg20), .wire56(reg24), .y(wire73), .clk(clk));
  always
    @(posedge clk) begin
      if ($unsigned($signed(($unsigned((wire15 << reg17)) ~^ $signed((wire15 & (8'hb4)))))))
        begin
          reg75 <= (8'hbf);
        end
      else
        begin
          if ((8'ha0))
            begin
              reg75 <= $signed($unsigned(({reg25,
                  ((8'ha4) ? reg23 : wire12)} == reg26[(5'h10):(2'h2)])));
              reg76 <= {(~^(reg22[(3'h4):(1'h1)] ?
                      ((reg20 ? (8'h9e) : (7'h40)) ?
                          $unsigned(reg25) : $signed(wire28)) : $signed((8'haf)))),
                  reg27[(3'h5):(3'h4)]};
              reg77 <= $unsigned(reg75);
              reg78 <= wire28[(4'hc):(4'hb)];
              reg79 <= ($unsigned({$unsigned({reg78, reg19})}) ?
                  $unsigned($unsigned({(wire14 ? (8'ha0) : reg25),
                      $signed(reg76)})) : reg27);
            end
          else
            begin
              reg75 <= ({$unsigned((8'hba)),
                  ($signed((|(7'h44))) ?
                      $signed({reg26, reg27}) : ({reg77} & (reg18 ?
                          reg25 : wire12)))} <<< (^~((~|(|(8'hb9))) ?
                  wire12 : ({reg75, reg77} ?
                      reg75[(3'h5):(3'h5)] : (&(8'hb1))))));
              reg76 <= ((^~(wire14 ~^ $signed((reg29 ?
                  reg25 : reg27)))) != $unsigned($signed(reg77)));
              reg77 <= (reg78 ^ (+(~^((wire14 ? wire15 : (8'hb2)) ?
                  {reg16} : $unsigned(reg20)))));
              reg78 <= (reg25[(4'ha):(3'h7)] << wire15);
            end
          reg80 <= {$unsigned($signed((reg21[(3'h5):(3'h4)] ?
                  reg23 : $signed((8'hba))))),
              ((reg25[(1'h0):(1'h0)] < (reg77[(1'h0):(1'h0)] ?
                  wire28[(4'hb):(3'h6)] : {reg26})) <= (reg24[(1'h0):(1'h0)] ?
                  reg25 : reg18[(1'h0):(1'h0)]))};
        end
      reg81 <= reg22;
      if (wire28)
        begin
          reg82 <= $unsigned((reg25 ?
              {(-$signed(wire11)), (|(&reg80))} : $unsigned($unsigned({reg80,
                  reg22}))));
          if ($unsigned($signed($signed($signed(((8'ha5) ? (8'ha6) : reg17))))))
            begin
              reg83 <= (-wire13[(4'h9):(3'h7)]);
            end
          else
            begin
              reg83 <= {{($unsigned((reg29 * reg19)) ?
                          $signed({(8'h9e)}) : {wire15[(1'h0):(1'h0)],
                              $signed(reg81)}),
                      (!(reg18 ? (~reg25) : $unsigned(wire73)))}};
              reg84 <= reg27;
              reg85 <= reg29;
              reg86 <= ((|(~&wire28[(2'h2):(1'h1)])) ?
                  $unsigned((-({reg26} ? (~^reg81) : wire14))) : (reg75 ?
                      (&reg81[(3'h4):(3'h4)]) : reg22));
              reg87 <= ((wire12[(3'h7):(1'h0)] ?
                  ((wire15[(2'h3):(2'h3)] | (reg16 - reg79)) & ($unsigned(reg83) ?
                      reg83 : (wire14 - (8'hb1)))) : reg78[(2'h2):(1'h0)]) * $unsigned($signed(((reg19 + wire53) == (reg16 ?
                  reg19 : reg82)))));
            end
          if (((+$signed(reg19)) && (8'hb1)))
            begin
              reg88 <= (reg79 ?
                  $signed($signed($signed((reg86 ?
                      reg75 : reg80)))) : $signed(((!(^~reg17)) == ((reg24 ?
                      (8'h9d) : wire12) < reg27))));
            end
          else
            begin
              reg88 <= $unsigned(reg18);
              reg89 <= {(($signed($signed(reg75)) ?
                      reg76[(4'h9):(3'h5)] : (&reg18[(1'h1):(1'h0)])) ^~ {((reg27 | wire73) ?
                          wire53[(4'h9):(3'h4)] : (+(7'h44)))})};
              reg90 <= (^{((wire73[(4'ha):(3'h7)] ?
                      wire14[(2'h2):(1'h0)] : $signed(reg27)) || reg29),
                  reg89[(4'hb):(3'h5)]});
              reg91 <= ((^~$unsigned(wire53[(4'h8):(2'h2)])) ?
                  reg88[(1'h0):(1'h0)] : (~$unsigned((-(8'ha0)))));
            end
        end
      else
        begin
          reg82 <= {$unsigned($unsigned(reg18))};
          if (reg84[(3'h6):(3'h4)])
            begin
              reg83 <= (~^(8'h9c));
              reg84 <= (~reg89[(4'hb):(3'h6)]);
            end
          else
            begin
              reg83 <= ((reg23[(3'h4):(1'h0)] & reg81) ?
                  reg86 : (&($signed((reg85 >> reg27)) < $signed($signed(wire13)))));
              reg84 <= $signed(wire11);
              reg85 <= {{{reg77[(3'h4):(1'h0)]},
                      $signed((reg91[(4'hb):(3'h7)] || wire73))}};
              reg86 <= $signed((($unsigned({wire13,
                      (8'hb1)}) == (reg83 ~^ $unsigned(reg24))) ?
                  {$signed($signed((8'hae))), $signed((^~(8'h9f)))} : wire28));
            end
          if ($unsigned(reg24[(3'h4):(1'h0)]))
            begin
              reg87 <= $unsigned(({(wire28[(3'h5):(3'h5)] <= reg79[(2'h2):(1'h1)])} & (7'h43)));
            end
          else
            begin
              reg87 <= $signed(reg80);
              reg88 <= {reg79,
                  $unsigned($signed(($unsigned((8'hb3)) ?
                      (reg77 <= (8'ha3)) : $signed((8'ha6)))))};
            end
          reg89 <= wire14[(1'h0):(1'h0)];
        end
      reg92 <= ((reg80 ^~ reg24) | $signed((+wire13)));
    end
  module93 #() modinst126 (wire125, clk, wire11, reg79, reg82, reg23, wire73);
  module127 #() modinst148 (.wire131(reg29), .clk(clk), .wire129(wire53), .wire128(reg16), .wire130(reg20), .y(wire147));
  assign wire149 = reg84[(4'h9):(4'h9)];
  assign wire150 = (8'hac);
  assign wire151 = {$unsigned($unsigned(wire28))};
  module152 #() modinst186 (wire185, clk, reg25, reg78, wire73, reg16);
  module55 #() modinst188 (wire187, clk, wire15, wire147, reg18, reg83);
  always
    @(posedge clk) begin
      reg189 <= reg92[(2'h3):(1'h1)];
    end
  assign wire190 = ($unsigned(((~^reg84[(4'h8):(3'h6)]) ?
                           $signed((reg189 ?
                               reg86 : wire15)) : (^~((8'ha8) == (8'ha2))))) ?
                       reg76 : $signed(reg25));
  module30 #() modinst192 (wire191, clk, reg17, wire125, reg91, reg76);
  assign wire193 = reg89[(3'h4):(2'h3)];
  assign wire194 = $unsigned(wire125[(4'h8):(3'h6)]);
endmodule

module module152  (y, clk, wire156, wire155, wire154, wire153);
  output wire [(32'h125):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire156;
  input wire signed [(4'h8):(1'h0)] wire155;
  input wire [(3'h6):(1'h0)] wire154;
  input wire [(4'ha):(1'h0)] wire153;
  wire signed [(5'h13):(1'h0)] wire184;
  wire [(5'h15):(1'h0)] wire183;
  wire signed [(2'h2):(1'h0)] wire182;
  wire signed [(4'hf):(1'h0)] wire161;
  wire [(4'hb):(1'h0)] wire160;
  wire signed [(5'h13):(1'h0)] wire159;
  wire [(2'h2):(1'h0)] wire158;
  wire [(4'hd):(1'h0)] wire157;
  reg [(4'hd):(1'h0)] reg181 = (1'h0);
  reg [(3'h7):(1'h0)] reg180 = (1'h0);
  reg [(4'ha):(1'h0)] reg179 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg178 = (1'h0);
  reg [(2'h3):(1'h0)] reg177 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg176 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg175 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg174 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg173 = (1'h0);
  reg [(4'hb):(1'h0)] reg172 = (1'h0);
  reg [(5'h12):(1'h0)] reg171 = (1'h0);
  reg [(3'h5):(1'h0)] reg170 = (1'h0);
  reg [(4'h8):(1'h0)] reg169 = (1'h0);
  reg [(3'h6):(1'h0)] reg168 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg167 = (1'h0);
  reg [(3'h5):(1'h0)] reg166 = (1'h0);
  reg [(5'h11):(1'h0)] reg165 = (1'h0);
  reg [(3'h6):(1'h0)] reg164 = (1'h0);
  reg [(4'h8):(1'h0)] reg163 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg162 = (1'h0);
  assign y = {wire184,
                 wire183,
                 wire182,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 (1'h0)};
  assign wire157 = $unsigned(wire154[(2'h3):(2'h3)]);
  assign wire158 = (&$signed((-({wire156} ?
                       wire154 : (wire155 ? wire155 : (8'h9f))))));
  assign wire159 = wire155;
  assign wire160 = wire158[(1'h1):(1'h0)];
  assign wire161 = $signed($unsigned($signed(wire160)));
  always
    @(posedge clk) begin
      reg162 <= ($signed((~|wire154)) >>> wire158[(1'h0):(1'h0)]);
      reg163 <= wire158;
      reg164 <= (^wire153);
      if (wire157)
        begin
          reg165 <= ((~|((~wire160) ^ (wire153[(4'h8):(3'h5)] * $unsigned(wire158)))) ?
              reg163 : (wire159 + wire153[(4'h8):(3'h7)]));
          if ({$signed((wire159[(5'h10):(3'h5)] ?
                  $unsigned({wire160}) : {(reg162 ^ reg165),
                      $unsigned(wire155)})),
              reg164[(1'h0):(1'h0)]})
            begin
              reg166 <= (^(~|$unsigned(wire159[(3'h7):(1'h1)])));
            end
          else
            begin
              reg166 <= (~^$unsigned($unsigned(((reg162 ^ wire155) + wire154))));
              reg167 <= $unsigned($signed($unsigned((8'hb3))));
              reg168 <= (^$unsigned(((|$unsigned(reg165)) | wire158[(1'h0):(1'h0)])));
              reg169 <= {$signed($signed($unsigned((wire153 - wire159)))),
                  ((8'had) > (&$signed((wire154 + wire158))))};
              reg170 <= wire158[(1'h1):(1'h0)];
            end
          if (($unsigned(($signed((reg169 && wire160)) ?
                  ($signed(reg168) ~^ (8'hb2)) : (wire158[(2'h2):(1'h1)] > (8'h9f)))) ?
              $unsigned($unsigned(reg162[(2'h3):(1'h0)])) : (($signed($signed(reg169)) ?
                  wire160 : reg165[(4'ha):(2'h2)]) <<< reg168)))
            begin
              reg171 <= (wire155 <<< (reg168 << $unsigned(wire159[(4'ha):(4'h9)])));
              reg172 <= ($unsigned(reg166[(3'h4):(1'h0)]) ~^ ($unsigned((((8'ha0) >= reg168) ?
                  (^wire153) : $signed(reg171))) - (wire157 ?
                  ((reg171 ? reg166 : reg166) ?
                      wire158 : reg170[(3'h5):(2'h2)]) : ($signed(wire158) ?
                      ((8'ha6) ? wire155 : reg166) : (wire153 >>> wire160)))));
              reg173 <= $signed($signed((!($unsigned(reg172) ?
                  (wire157 ^ reg162) : $signed(reg168)))));
            end
          else
            begin
              reg171 <= $signed($unsigned($signed(({wire154, reg173} ?
                  $signed((8'hbf)) : (-(8'ha5))))));
              reg172 <= (^{wire158,
                  $signed(($signed(wire160) ?
                      {(7'h41), wire156} : $unsigned(reg168)))});
              reg173 <= (reg168 <<< $signed(wire153[(4'ha):(2'h2)]));
            end
          reg174 <= ((~^$unsigned($unsigned(((8'ha7) ? reg166 : (8'had))))) ?
              (($signed($signed(reg162)) ?
                      $signed((reg167 | wire161)) : $signed(reg173[(4'h9):(4'h8)])) ?
                  (~|$unsigned(wire156)) : (+reg162)) : ($signed(wire156[(3'h6):(1'h0)]) ?
                  wire161 : (~|wire159)));
          reg175 <= ((($unsigned($signed((8'ha9))) ?
              (+$signed((8'h9f))) : (~^(^wire161))) == $signed($unsigned($signed(reg163)))) != $unsigned((~(wire160[(2'h3):(1'h1)] ?
              reg170[(2'h2):(2'h2)] : (reg174 ? wire157 : wire160)))));
        end
      else
        begin
          reg165 <= (reg168 ? reg170[(2'h2):(1'h1)] : wire157);
          reg166 <= reg169[(1'h1):(1'h0)];
          reg167 <= wire155[(3'h4):(1'h0)];
          reg168 <= {reg164};
        end
      reg176 <= (reg169 ?
          {(reg172 != reg164[(1'h1):(1'h0)]),
              reg166[(3'h5):(2'h3)]} : ($signed({reg166[(3'h4):(2'h2)]}) ?
              (reg164[(3'h4):(1'h0)] ?
                  wire153 : ({wire157} ?
                      (~reg170) : (reg175 ? wire159 : (8'ha0)))) : reg163));
    end
  always
    @(posedge clk) begin
      reg177 <= (~|((+wire155) ^~ $unsigned(reg174)));
      reg178 <= wire153;
      reg179 <= $signed($signed(((~&reg176[(3'h4):(3'h4)]) - wire161[(1'h0):(1'h0)])));
      reg180 <= wire156;
      reg181 <= reg163;
    end
  assign wire182 = (wire161[(4'ha):(4'h8)] ^ (8'hbb));
  assign wire183 = wire153[(1'h1):(1'h1)];
  assign wire184 = {(+(((~^(8'hae)) ?
                           $unsigned(reg164) : $signed(wire157)) && (reg168 && reg173)))};
endmodule

module module127
#(parameter param146 = (^~((((~(8'hae)) ? {(7'h41)} : {(8'had)}) ? (-(!(8'hae))) : (~|{(8'hb3), (8'ha9)})) && ({((8'ha2) ? (8'hb9) : (8'ha0)), {(8'haf), (8'haa)}} ? (((8'ha7) + (8'hae)) ^ {(8'ha6), (8'ha5)}) : (((8'hb0) == (8'h9e)) ? {(8'hab)} : {(8'hac), (8'hba)})))))
(y, clk, wire131, wire130, wire129, wire128);
  output wire [(32'h95):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire131;
  input wire signed [(5'h10):(1'h0)] wire130;
  input wire signed [(4'h8):(1'h0)] wire129;
  input wire signed [(4'h8):(1'h0)] wire128;
  wire [(3'h4):(1'h0)] wire145;
  wire signed [(4'hd):(1'h0)] wire144;
  wire signed [(4'hd):(1'h0)] wire143;
  wire signed [(2'h3):(1'h0)] wire132;
  reg [(4'hf):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg140 = (1'h0);
  reg [(4'h8):(1'h0)] reg139 = (1'h0);
  reg [(2'h3):(1'h0)] reg138 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg137 = (1'h0);
  reg signed [(4'he):(1'h0)] reg136 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg135 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg134 = (1'h0);
  reg [(5'h15):(1'h0)] reg133 = (1'h0);
  assign y = {wire145,
                 wire144,
                 wire143,
                 wire132,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 (1'h0)};
  assign wire132 = ((($signed(wire130[(3'h7):(1'h0)]) ?
                           (wire128[(1'h1):(1'h1)] ?
                               wire130[(2'h2):(2'h2)] : wire128) : (-$unsigned(wire129))) == ($signed($unsigned((8'ha5))) ?
                           ({wire128, wire130} ?
                               {wire129} : (wire130 | (8'hb5))) : ($unsigned(wire130) < $signed(wire130)))) ?
                       (8'hbe) : $signed(wire128[(3'h7):(3'h6)]));
  always
    @(posedge clk) begin
      if (({(~($signed(wire128) | (wire130 ~^ wire128)))} ?
          $signed(($signed(wire131) ?
              {$unsigned(wire130)} : $signed({(8'hac), wire130}))) : wire131))
        begin
          reg133 <= wire129;
          if ($signed($signed($unsigned((!(^(8'ha7)))))))
            begin
              reg134 <= (wire129[(3'h5):(2'h3)] << (wire130 ?
                  {($unsigned(wire130) ?
                          (-(8'hb0)) : (reg133 || wire129))} : wire131));
              reg135 <= (wire128[(3'h5):(3'h5)] > (|$signed({reg134})));
            end
          else
            begin
              reg134 <= ((reg135[(1'h0):(1'h0)] ?
                  $unsigned({(reg133 ?
                          wire128 : reg135)}) : wire128[(3'h6):(3'h4)]) || (~^reg135[(2'h2):(2'h2)]));
              reg135 <= (~wire128[(1'h0):(1'h0)]);
              reg136 <= $unsigned(wire131);
              reg137 <= $signed((reg136[(4'h8):(3'h5)] * $unsigned($unsigned($signed(wire132)))));
              reg138 <= reg136;
            end
        end
      else
        begin
          reg133 <= {$unsigned({reg135}),
              ((wire129[(3'h7):(3'h5)] <<< ($signed(reg136) * $signed((8'ha9)))) + (wire130 <= $signed((wire131 << reg133))))};
          reg134 <= $signed({$unsigned(reg137)});
          if ((wire131 ?
              wire132[(1'h0):(1'h0)] : (reg136[(4'he):(4'hc)] ?
                  (8'hb6) : (~&$unsigned((|reg133))))))
            begin
              reg135 <= wire131;
            end
          else
            begin
              reg135 <= $signed(wire131[(4'hb):(3'h6)]);
              reg136 <= (|$unsigned(reg137));
              reg137 <= $unsigned((reg136 < wire131));
            end
        end
      reg139 <= wire132;
      reg140 <= {wire131[(3'h7):(1'h0)]};
      reg141 <= reg140;
      reg142 <= reg134[(2'h2):(1'h1)];
    end
  assign wire143 = $signed($signed(({reg133} ?
                       (^~$signed((8'hb0))) : $signed($unsigned(reg139)))));
  assign wire144 = (~|(reg137[(1'h0):(1'h0)] ? reg134 : (reg142 & (7'h40))));
  assign wire145 = (~|reg142);
endmodule

module module93
#(parameter param123 = {((((7'h41) & ((8'ha3) ? (7'h42) : (8'hba))) & (^~(|(8'ha5)))) ? ((+(~&(8'hb2))) ? (((8'ha9) ? (8'ha8) : (7'h43)) + ((8'hab) ^ (8'hb5))) : {((8'ha9) == (8'hbb))}) : (({(7'h43), (8'hba)} ? ((8'hb4) | (8'haa)) : ((8'ha6) - (8'haf))) ? (8'hbe) : (((8'hb2) ? (8'hb3) : (7'h43)) ? ((7'h41) ? (8'had) : (8'hbc)) : ((8'hb2) ~^ (8'h9c))))), {((&((8'haf) && (7'h43))) == (((8'hb1) ? (8'hab) : (8'ha1)) > ((8'hac) ^~ (8'ha9)))), (~^((8'ha1) | ((8'ha5) >>> (8'hb5))))}}, 
parameter param124 = ((8'ha1) ? (((-param123) ? (param123 ? (param123 <<< param123) : (param123 & param123)) : ((param123 ? param123 : param123) <<< {param123})) >>> (~^param123)) : ((({param123, param123} ? {param123, param123} : (param123 && param123)) ? {((8'hb2) ^~ param123), (param123 <= param123)} : ((param123 ? param123 : param123) ? (param123 ? param123 : param123) : (+(8'hb0)))) ? param123 : ({param123} ? (~^(8'ha5)) : param123))))
(y, clk, wire98, wire97, wire96, wire95, wire94);
  output wire [(32'he7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire98;
  input wire signed [(5'h13):(1'h0)] wire97;
  input wire [(3'h7):(1'h0)] wire96;
  input wire signed [(4'hd):(1'h0)] wire95;
  input wire signed [(5'h14):(1'h0)] wire94;
  wire signed [(2'h2):(1'h0)] wire122;
  wire signed [(4'hd):(1'h0)] wire121;
  wire [(5'h12):(1'h0)] wire99;
  reg [(3'h7):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg119 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg118 = (1'h0);
  reg [(4'hc):(1'h0)] reg117 = (1'h0);
  reg [(4'hd):(1'h0)] reg116 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg115 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg114 = (1'h0);
  reg [(4'he):(1'h0)] reg113 = (1'h0);
  reg [(4'hd):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg111 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg110 = (1'h0);
  reg [(3'h7):(1'h0)] reg109 = (1'h0);
  reg [(5'h15):(1'h0)] reg108 = (1'h0);
  reg [(4'ha):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg106 = (1'h0);
  reg [(3'h7):(1'h0)] reg105 = (1'h0);
  reg [(5'h11):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg103 = (1'h0);
  reg [(3'h5):(1'h0)] reg102 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg101 = (1'h0);
  reg [(4'h8):(1'h0)] reg100 = (1'h0);
  assign y = {wire122,
                 wire121,
                 wire99,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 (1'h0)};
  assign wire99 = $unsigned({wire95, (^wire98[(2'h2):(1'h1)])});
  always
    @(posedge clk) begin
      if ($unsigned(wire99))
        begin
          if (wire97[(4'he):(2'h3)])
            begin
              reg100 <= $signed((~&wire95[(4'hc):(3'h5)]));
              reg101 <= $signed($unsigned($unsigned(wire96)));
              reg102 <= $unsigned($unsigned((wire94 < (!((8'hae) ?
                  reg101 : reg100)))));
              reg103 <= wire97;
            end
          else
            begin
              reg100 <= $signed(($signed(((!wire99) ?
                  ((8'hb0) && wire97) : reg100[(3'h5):(3'h5)])) << $signed(wire94)));
              reg101 <= (wire99 ~^ reg101[(3'h5):(2'h2)]);
              reg102 <= (-(!wire96[(1'h1):(1'h0)]));
              reg103 <= (({(8'hbd), (|(|wire94))} >>> ($signed((wire99 ?
                      (8'ha7) : reg102)) ?
                  {(|reg103)} : $unsigned((~&(8'ha8))))) ^ ((wire97 && reg101) ?
                  (reg103[(2'h2):(1'h1)] >>> {{wire98, wire94}}) : ((8'hbd) ?
                      $unsigned(reg102[(3'h5):(2'h3)]) : (~|$unsigned(wire97)))));
              reg104 <= wire95[(3'h6):(3'h6)];
            end
        end
      else
        begin
          if ($signed((-$signed((|(wire98 ? wire94 : reg103))))))
            begin
              reg100 <= (({$signed(wire95)} << reg103[(5'h10):(4'h9)]) ?
                  $unsigned(wire98[(4'ha):(1'h1)]) : ($signed((reg103 > (wire99 ?
                          wire98 : reg103))) ?
                      {(reg103[(2'h3):(2'h3)] ?
                              (~&reg102) : (reg101 != reg102)),
                          $unsigned((&(8'h9d)))} : (($signed(wire96) ?
                          (~^wire94) : $signed((8'ha6))) <= ($signed(wire98) * $signed(reg100)))));
              reg101 <= (~&$unsigned((($unsigned(reg104) ?
                      (&reg100) : (wire98 >> wire96)) ?
                  reg100[(1'h0):(1'h0)] : $signed($signed(reg102)))));
              reg102 <= $signed(reg104[(3'h4):(2'h2)]);
            end
          else
            begin
              reg100 <= (&reg102[(2'h2):(1'h1)]);
            end
          if (wire97[(1'h1):(1'h0)])
            begin
              reg103 <= (wire97[(4'ha):(2'h2)] ?
                  $signed($unsigned($unsigned($signed(wire95)))) : {(~&$signed({reg103,
                          wire97})),
                      ((((8'ha0) > reg103) ?
                          $unsigned(wire99) : (wire95 & (7'h41))) && (reg102 >>> (reg102 ?
                          wire96 : wire96)))});
            end
          else
            begin
              reg103 <= (^~($unsigned((wire99 * $unsigned(reg101))) ?
                  (~$unsigned((wire99 ?
                      wire97 : wire99))) : ($signed(wire97[(4'hb):(3'h5)]) ?
                      {(wire99 ? reg101 : reg102)} : ($signed(wire97) ?
                          $signed(reg103) : $signed(reg102)))));
              reg104 <= $signed(((reg100[(1'h1):(1'h1)] ?
                      wire98 : ((wire94 ? reg102 : wire96) >= (8'ha0))) ?
                  ((~|$signed(wire95)) ?
                      reg100[(3'h5):(2'h3)] : (~wire98[(4'hb):(3'h7)])) : (+(wire94 != (wire97 ?
                      reg101 : reg100)))));
              reg105 <= $signed({$unsigned(wire95),
                  $unsigned((wire97 ? $unsigned(wire96) : $unsigned(wire99)))});
              reg106 <= (-$unsigned($unsigned(reg105[(3'h4):(2'h2)])));
              reg107 <= (((wire95 ?
                      $unsigned((wire95 * reg102)) : (8'haf)) + ($signed((wire98 ?
                      wire99 : wire94)) | wire96)) ?
                  reg105[(3'h4):(1'h0)] : $signed(reg104[(2'h2):(1'h1)]));
            end
          if (wire99[(3'h4):(3'h4)])
            begin
              reg108 <= {{(!(-(!reg103)))},
                  ((~^(reg107[(4'h8):(1'h1)] | $signed(reg103))) | reg106[(3'h5):(3'h4)])};
              reg109 <= reg103[(4'hc):(4'h8)];
            end
          else
            begin
              reg108 <= (!reg103[(4'hb):(3'h7)]);
              reg109 <= (8'ha0);
              reg110 <= (wire98 ?
                  (wire94 ?
                      ((~reg109[(3'h4):(1'h1)]) ?
                          wire99[(2'h3):(2'h2)] : (reg107[(1'h0):(1'h0)] ?
                              wire99 : wire99[(1'h1):(1'h0)])) : ({(+(8'ha4))} + (~&(~wire95)))) : {reg108[(4'h9):(4'h8)],
                      $unsigned(reg100)});
              reg111 <= (+((~^reg109) == (~$signed(reg109))));
            end
          reg112 <= ({(reg108 ?
                  $unsigned((&(8'haf))) : {reg110})} - ($unsigned((|(8'hab))) ?
              wire94 : $unsigned($unsigned((!(8'ha5))))));
          if ($signed(wire98[(3'h6):(1'h1)]))
            begin
              reg113 <= $unsigned((reg103[(4'hf):(4'hc)] != (8'ha0)));
              reg114 <= ((&$unsigned(reg108)) || wire96[(3'h4):(2'h2)]);
              reg115 <= (reg100 ?
                  (wire98[(4'ha):(2'h2)] ?
                      reg114 : $signed((wire98[(2'h2):(1'h1)] ?
                          {reg108} : $signed(wire95)))) : reg112[(4'hd):(4'hd)]);
            end
          else
            begin
              reg113 <= (&reg110);
              reg114 <= $unsigned(($unsigned((+{(8'ha2)})) == $signed({{(8'ha6),
                      reg112}})));
              reg115 <= $signed(($unsigned($unsigned({reg109, wire95})) ?
                  $unsigned($unsigned(((8'hba) > wire94))) : (wire94 >> $signed(wire95))));
              reg116 <= $unsigned((|(^~((^~wire94) && $signed(reg112)))));
              reg117 <= (!reg103);
            end
        end
      reg118 <= reg108[(3'h6):(2'h2)];
      reg119 <= ($unsigned(wire96) ? $signed(reg101) : reg101);
      reg120 <= reg103[(3'h5):(2'h3)];
    end
  assign wire121 = $signed((($unsigned((~^reg107)) || $signed(wire94)) ~^ reg107[(4'h9):(3'h5)]));
  assign wire122 = ($unsigned($signed(((~&reg117) ?
                           $unsigned(wire95) : $unsigned(reg103)))) ?
                       $unsigned($signed($signed((^~reg109)))) : (($unsigned(reg109[(1'h1):(1'h0)]) ?
                           reg100 : $signed((wire94 ?
                               wire99 : (8'ha3)))) << $signed($signed((reg112 ?
                           wire97 : reg105)))));
endmodule

module module55
#(parameter param71 = (({(+((8'hb5) ? (8'ha3) : (8'hb8))), (((8'hb3) ? (8'h9d) : (8'ha0)) ? ((8'hba) ? (8'h9e) : (8'hb3)) : ((8'haf) + (8'h9f)))} ? ((((8'hb7) != (8'ha0)) ? {(8'hb9), (8'ha1)} : ((8'hbf) + (8'haf))) ? ((~^(8'ha3)) == (7'h43)) : (((7'h43) <= (8'h9d)) ? ((7'h43) > (8'hb9)) : (-(8'hb9)))) : ((((8'hbb) >>> (8'hbe)) - ((8'hae) ? (8'hbb) : (7'h43))) ? (^(&(7'h44))) : (~|(+(8'hb0))))) ? {((~&((8'hab) ? (8'hb0) : (8'hb9))) <= (((8'ha6) ? (8'hb6) : (8'h9d)) == (~|(8'ha6))))} : ((~^{((8'hbc) ? (8'hb0) : (8'ha9))}) ~^ (((~(8'hb6)) >>> (~&(8'hb0))) || (((8'hb4) ^ (8'ha1)) * ((7'h43) >= (8'hb4)))))), 
parameter param72 = (~^(8'h9d)))
(y, clk, wire59, wire58, wire57, wire56);
  output wire [(32'h67):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire59;
  input wire signed [(3'h7):(1'h0)] wire58;
  input wire [(4'hd):(1'h0)] wire57;
  input wire signed [(2'h2):(1'h0)] wire56;
  wire signed [(4'h9):(1'h0)] wire70;
  wire signed [(3'h7):(1'h0)] wire69;
  wire [(3'h4):(1'h0)] wire68;
  wire [(2'h2):(1'h0)] wire67;
  wire signed [(3'h7):(1'h0)] wire66;
  wire [(4'hc):(1'h0)] wire65;
  wire signed [(4'he):(1'h0)] wire64;
  wire [(3'h7):(1'h0)] wire63;
  wire [(5'h13):(1'h0)] wire62;
  wire signed [(5'h11):(1'h0)] wire61;
  wire signed [(3'h4):(1'h0)] wire60;
  assign y = {wire70,
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
                 (1'h0)};
  assign wire60 = wire59;
  assign wire61 = (wire58 ?
                      ($unsigned($signed(((8'hbe) << wire57))) ^ (|wire56)) : (&$signed((!(~|wire57)))));
  assign wire62 = ($signed(($unsigned((wire59 && wire57)) ?
                          (wire56 ~^ (wire58 ? wire56 : wire59)) : (wire60 ?
                              $unsigned(wire60) : $unsigned(wire57)))) ?
                      wire58 : ($signed($unsigned((wire60 >>> wire57))) ?
                          $unsigned((^$unsigned(wire60))) : wire59));
  assign wire63 = (!wire58[(2'h3):(2'h2)]);
  assign wire64 = wire59[(3'h7):(1'h0)];
  assign wire65 = $signed((^~$signed($unsigned(wire61[(4'hd):(1'h1)]))));
  assign wire66 = (8'hac);
  assign wire67 = ($signed({($unsigned((8'ha6)) <= $signed(wire64)),
                      (+((8'hb7) ?
                          wire63 : wire59))}) >> $unsigned($signed($unsigned((8'hb6)))));
  assign wire68 = ((wire65[(3'h7):(1'h0)] ?
                          (~^$signed((+wire64))) : ((^~(wire61 ~^ (7'h44))) ?
                              {(wire66 ?
                                      wire63 : wire57)} : (wire56[(1'h0):(1'h0)] ?
                                  wire59 : $signed(wire57)))) ?
                      $signed((8'ha1)) : ($unsigned(wire61[(1'h0):(1'h0)]) ?
                          ({$unsigned(wire65), (wire59 != wire64)} ?
                              wire61 : wire58[(3'h6):(1'h0)]) : ((((8'hba) == wire56) << wire56[(1'h0):(1'h0)]) * (wire63 != $signed(wire64)))));
  assign wire69 = ((~(~^wire65[(2'h2):(1'h1)])) ?
                      $unsigned($unsigned({{wire57,
                              wire59}})) : $unsigned($signed(wire65[(2'h3):(1'h1)])));
  assign wire70 = $signed((~^{$signed(wire68)}));
endmodule

module module30
#(parameter param51 = {(((((8'h9e) || (8'had)) * (8'hb7)) ? (((8'hae) ? (8'haf) : (8'hbc)) ? (|(8'had)) : (&(8'ha7))) : (((8'hbb) >> (7'h43)) ? ((8'had) > (7'h40)) : {(8'hb7)})) << ((((8'haa) == (8'h9c)) ? ((8'hb5) <<< (7'h40)) : ((8'hb6) ? (8'hab) : (8'ha9))) >= (^~(+(8'ha8))))), (8'hab)}, 
parameter param52 = (~^param51))
(y, clk, wire34, wire33, wire32, wire31);
  output wire [(32'hcf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire34;
  input wire signed [(2'h3):(1'h0)] wire33;
  input wire [(2'h2):(1'h0)] wire32;
  input wire [(3'h4):(1'h0)] wire31;
  wire [(5'h11):(1'h0)] wire50;
  wire signed [(3'h7):(1'h0)] wire39;
  wire [(4'ha):(1'h0)] wire36;
  wire signed [(4'ha):(1'h0)] wire35;
  reg signed [(4'hb):(1'h0)] reg49 = (1'h0);
  reg [(5'h14):(1'h0)] reg48 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg47 = (1'h0);
  reg [(5'h11):(1'h0)] reg46 = (1'h0);
  reg [(4'hd):(1'h0)] reg45 = (1'h0);
  reg [(5'h11):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg43 = (1'h0);
  reg [(4'hc):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg41 = (1'h0);
  reg [(4'hd):(1'h0)] reg40 = (1'h0);
  reg [(3'h5):(1'h0)] reg38 = (1'h0);
  reg [(4'hb):(1'h0)] reg37 = (1'h0);
  assign y = {wire50,
                 wire39,
                 wire36,
                 wire35,
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
                 reg38,
                 reg37,
                 (1'h0)};
  assign wire35 = $signed($signed(wire34));
  assign wire36 = (^((^(wire32 ?
                          wire31[(2'h2):(2'h2)] : wire32[(2'h2):(1'h1)])) ?
                      $signed($unsigned($unsigned(wire32))) : ((wire35[(2'h3):(2'h3)] >> $signed(wire32)) ?
                          (-wire32) : (8'hb8))));
  always
    @(posedge clk) begin
      reg37 <= $signed($signed(({(wire35 ? wire34 : wire33), $signed((7'h40))} ?
          ($signed(wire33) >> (^(7'h44))) : wire36[(3'h7):(1'h1)])));
      reg38 <= wire32;
    end
  assign wire39 = wire35[(2'h3):(1'h0)];
  always
    @(posedge clk) begin
      reg40 <= (wire34[(3'h6):(2'h2)] ?
          $signed(($signed((~&wire34)) & $signed(wire33[(1'h0):(1'h0)]))) : reg37);
      if (wire35[(2'h3):(1'h0)])
        begin
          reg41 <= $signed({(|(~^{wire35, reg37})), wire33[(2'h2):(2'h2)]});
          reg42 <= ((^~wire34[(3'h5):(3'h5)]) ?
              reg40 : (($unsigned(wire33) ?
                  reg38 : reg40) >>> $unsigned($signed(wire31))));
          if (wire32[(2'h2):(2'h2)])
            begin
              reg43 <= (reg40 ?
                  (|(~(((8'ha6) == (8'ha1)) ?
                      reg42[(3'h7):(2'h3)] : $signed(reg37)))) : $signed(reg40));
              reg44 <= reg42;
              reg45 <= wire34[(3'h5):(3'h4)];
            end
          else
            begin
              reg43 <= ($signed(((+$signed(reg43)) ?
                  $signed({reg41, reg45}) : (&(reg37 ?
                      wire33 : reg44)))) << ({$unsigned((^~wire32))} ?
                  (((wire31 * wire34) | $unsigned((8'ha7))) ?
                      $unsigned($unsigned(wire31)) : $signed((~&reg44))) : $unsigned($unsigned((wire35 > reg38)))));
              reg44 <= reg43;
              reg45 <= {{(reg37 >> (!(|reg38)))}};
              reg46 <= reg43;
            end
          reg47 <= {$signed((($signed((8'ha3)) ? wire36 : (^~(7'h41))) ?
                  (reg41[(4'h9):(4'h8)] << $signed((8'hbb))) : (~|(wire35 ~^ reg45)))),
              wire31};
          reg48 <= ((((~|reg42) || (+$signed(reg43))) ?
              $signed($unsigned(reg37[(2'h3):(2'h3)])) : reg41) > $unsigned((&(&(reg40 ?
              wire34 : reg47)))));
        end
      else
        begin
          reg41 <= $signed({((~&$unsigned((7'h42))) ?
                  wire35[(2'h2):(1'h1)] : $unsigned($unsigned((8'ha9)))),
              reg42[(2'h3):(2'h2)]});
          if ($signed(reg45[(4'hd):(1'h1)]))
            begin
              reg42 <= reg37[(2'h2):(2'h2)];
            end
          else
            begin
              reg42 <= (wire32 << $unsigned(wire33));
              reg43 <= (+(reg40 ?
                  {reg44[(5'h11):(4'hc)],
                      (~(reg44 ? reg41 : (8'h9c)))} : ($unsigned((!(8'hb1))) ?
                      ($unsigned(reg38) <<< $unsigned((8'ha7))) : ((-(8'ha1)) || (~&reg37)))));
            end
        end
      reg49 <= reg43;
    end
  assign wire50 = $unsigned($unsigned(({reg42} ^~ (!reg42[(2'h2):(1'h1)]))));
endmodule
