module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hf3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire0;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire3;
  wire signed [(4'h8):(1'h0)] wire199;
  wire [(4'hb):(1'h0)] wire187;
  wire [(4'hf):(1'h0)] wire4;
  wire signed [(5'h11):(1'h0)] wire5;
  wire [(3'h7):(1'h0)] wire6;
  wire signed [(4'hf):(1'h0)] wire185;
  reg signed [(5'h15):(1'h0)] reg198 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg197 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg196 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg195 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg194 = (1'h0);
  reg [(4'he):(1'h0)] reg193 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg192 = (1'h0);
  reg [(4'he):(1'h0)] reg191 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg190 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg189 = (1'h0);
  reg [(4'h8):(1'h0)] reg188 = (1'h0);
  reg [(4'hc):(1'h0)] reg10 = (1'h0);
  reg [(3'h4):(1'h0)] reg9 = (1'h0);
  reg signed [(4'he):(1'h0)] reg8 = (1'h0);
  reg [(5'h15):(1'h0)] reg7 = (1'h0);
  assign y = {wire199,
                 wire187,
                 wire4,
                 wire5,
                 wire6,
                 wire185,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire4 = (^~wire3[(3'h5):(3'h4)]);
  assign wire5 = $unsigned((wire3 ?
                     $unsigned($signed({wire1,
                         wire2})) : wire3[(3'h5):(3'h5)]));
  assign wire6 = wire4[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      reg7 <= $signed({((^~(wire1 & (8'hbf))) > wire4)});
      reg8 <= (~^((wire3 <<< (wire6 ? $unsigned(reg7) : {wire1, wire1})) ?
          $signed({(wire5 ? wire0 : wire1), $unsigned(wire4)}) : (8'h9d)));
      reg9 <= wire3[(3'h7):(3'h7)];
      reg10 <= $unsigned($unsigned(wire3[(3'h5):(2'h3)]));
    end
  module11 #() modinst186 (.wire14(wire4), .wire13(wire5), .wire16(wire0), .wire15(wire1), .clk(clk), .wire12(wire6), .y(wire185));
  assign wire187 = $signed(wire6);
  always
    @(posedge clk) begin
      if ((wire4 & wire2))
        begin
          reg188 <= $signed((wire0[(4'h9):(3'h6)] + $unsigned({(+(8'hb3)),
              {(8'ha3)}})));
        end
      else
        begin
          if ($signed((((&(reg8 ? wire3 : reg10)) ?
              ($unsigned(reg188) <= (~|reg10)) : reg8) + {($signed(wire185) ~^ wire185)})))
            begin
              reg188 <= wire2[(4'hc):(2'h3)];
              reg189 <= ((!((wire1[(3'h6):(3'h4)] ?
                      (+wire0) : (-wire0)) ^~ {$signed(wire2),
                      $unsigned(wire2)})) ?
                  {$signed((|(wire6 > wire2))),
                      $unsigned((~((8'hbe) ? (8'ha4) : wire5)))} : (+wire4));
            end
          else
            begin
              reg188 <= ((~^(reg8 && $unsigned((wire5 * wire185)))) ?
                  reg8[(3'h4):(3'h4)] : $signed($signed($signed($signed(reg10)))));
              reg189 <= $signed($signed($signed(wire2[(3'h6):(3'h6)])));
            end
        end
      reg190 <= $unsigned(wire2);
      if (($unsigned($signed($signed(wire187))) ?
          $unsigned({(~^$signed(wire187)),
              reg190}) : (^$unsigned($signed((reg8 ? reg190 : (8'hac)))))))
        begin
          reg191 <= $signed($unsigned((~^(8'h9d))));
          if (wire5)
            begin
              reg192 <= {(~|$unsigned(wire6[(3'h4):(2'h3)]))};
              reg193 <= (wire1[(4'hc):(3'h7)] - wire6);
              reg194 <= ((wire4 ~^ $signed(((&reg7) > (~&reg188)))) >= wire185[(1'h0):(1'h0)]);
              reg195 <= {(|wire185[(3'h6):(2'h2)]),
                  ({($signed(reg192) ? (wire4 < reg188) : (-(8'h9f))),
                          wire185[(2'h3):(2'h2)]} ?
                      (8'ha9) : reg193)};
              reg196 <= {$signed(((^wire187[(2'h2):(1'h1)]) ?
                      reg190[(4'h9):(4'h9)] : ((wire185 > (8'hbd)) ?
                          $unsigned(wire6) : (~^wire3)))),
                  $signed(($signed($signed(reg190)) | wire0))};
            end
          else
            begin
              reg192 <= (~|$signed(wire5[(3'h7):(3'h7)]));
              reg193 <= $unsigned(((^({wire6, (8'ha9)} ?
                      $signed(wire1) : (wire185 ? reg7 : (8'hb0)))) ?
                  (({reg190} ?
                      $unsigned(reg191) : $unsigned(wire2)) << $signed((+wire0))) : reg190));
              reg194 <= wire187;
            end
        end
      else
        begin
          reg191 <= $unsigned($signed(reg193[(2'h2):(1'h0)]));
          reg192 <= (($signed(wire4) ?
              $unsigned($signed((wire185 ? wire6 : wire187))) : ((8'h9e) ?
                  reg9[(1'h0):(1'h0)] : (~&(reg7 ?
                      wire2 : (8'ha1))))) <<< $unsigned(reg196));
          reg193 <= $unsigned({{reg188, (~&$signed((8'haf)))}});
          if ({wire0[(2'h3):(2'h2)], reg195[(4'ha):(4'h9)]})
            begin
              reg194 <= (&wire6);
              reg195 <= reg190;
              reg196 <= $signed({wire2});
              reg197 <= ($unsigned($unsigned($signed((wire0 ?
                  reg191 : wire185)))) | wire0[(4'h8):(3'h4)]);
              reg198 <= (((((wire4 ? reg10 : wire185) >= (8'ha4)) ?
                          reg191[(4'hd):(4'h8)] : reg193[(3'h6):(2'h2)]) ?
                      (|($signed((8'hb7)) + $unsigned(wire5))) : (~^(~$signed((8'ha3))))) ?
                  ($signed((!$unsigned(wire2))) ?
                      $signed($signed((reg189 + reg193))) : (8'ha8)) : $signed(reg192[(1'h1):(1'h0)]));
            end
          else
            begin
              reg194 <= $unsigned(wire185[(2'h2):(2'h2)]);
              reg195 <= wire1;
              reg196 <= reg198[(4'ha):(2'h3)];
              reg197 <= {$unsigned(({(&(7'h44))} ?
                      reg8[(4'ha):(1'h0)] : (8'h9c)))};
            end
        end
    end
  assign wire199 = $unsigned({$signed($unsigned($signed(wire4)))});
endmodule

module module11  (y, clk, wire12, wire13, wire14, wire15, wire16);
  output wire [(32'h305):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire12;
  input wire [(4'he):(1'h0)] wire13;
  input wire [(4'hf):(1'h0)] wire14;
  input wire signed [(5'h11):(1'h0)] wire15;
  input wire [(2'h2):(1'h0)] wire16;
  wire [(4'ha):(1'h0)] wire184;
  wire signed [(3'h5):(1'h0)] wire182;
  wire signed [(4'hf):(1'h0)] wire112;
  wire [(4'hf):(1'h0)] wire110;
  wire [(5'h15):(1'h0)] wire93;
  wire [(5'h13):(1'h0)] wire75;
  wire signed [(4'hc):(1'h0)] wire74;
  wire [(4'h9):(1'h0)] wire73;
  wire [(3'h4):(1'h0)] wire72;
  wire [(5'h14):(1'h0)] wire71;
  wire [(5'h11):(1'h0)] wire70;
  wire signed [(3'h4):(1'h0)] wire65;
  wire signed [(4'hf):(1'h0)] wire59;
  wire signed [(5'h10):(1'h0)] wire57;
  reg signed [(4'h8):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg91 = (1'h0);
  reg [(4'he):(1'h0)] reg90 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg87 = (1'h0);
  reg [(4'hf):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg83 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg80 = (1'h0);
  reg [(5'h12):(1'h0)] reg79 = (1'h0);
  reg [(5'h10):(1'h0)] reg78 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg77 = (1'h0);
  reg [(4'h8):(1'h0)] reg76 = (1'h0);
  reg [(4'h9):(1'h0)] reg69 = (1'h0);
  reg [(5'h15):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg64 = (1'h0);
  reg signed [(4'he):(1'h0)] reg63 = (1'h0);
  reg [(3'h6):(1'h0)] reg62 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg60 = (1'h0);
  reg [(4'hd):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg18 = (1'h0);
  reg [(4'he):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg20 = (1'h0);
  reg [(2'h3):(1'h0)] reg21 = (1'h0);
  reg [(5'h15):(1'h0)] reg22 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg25 = (1'h0);
  reg signed [(4'he):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg27 = (1'h0);
  reg [(5'h13):(1'h0)] reg28 = (1'h0);
  reg [(4'hf):(1'h0)] reg29 = (1'h0);
  reg [(4'hc):(1'h0)] reg30 = (1'h0);
  reg [(4'hd):(1'h0)] reg31 = (1'h0);
  assign y = {wire184,
                 wire182,
                 wire112,
                 wire110,
                 wire93,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire65,
                 wire59,
                 wire57,
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
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg17 <= ($unsigned((|(~^((8'hb2) | wire16)))) >>> (wire13[(3'h6):(1'h0)] + ($signed((8'ha4)) ?
          (~&(~wire13)) : $signed((wire13 || wire16)))));
      reg18 <= wire16;
      if ($unsigned(wire13))
        begin
          reg19 <= (((~|wire12[(1'h1):(1'h0)]) ?
                  $signed(wire12[(2'h3):(1'h1)]) : {wire13[(4'hb):(3'h5)]}) ?
              {$unsigned($signed($unsigned(wire15)))} : {(((wire16 ?
                      reg17 : wire14) && (wire16 ? wire14 : reg17)) <= wire16),
                  $unsigned(wire12)});
          reg20 <= $unsigned(wire12[(2'h2):(2'h2)]);
          reg21 <= $signed((~$unsigned({wire15})));
          reg22 <= (^~(wire15 != ($unsigned((reg17 ?
              wire13 : wire16)) + {wire14, ((8'hb5) ? reg20 : wire15)})));
        end
      else
        begin
          reg19 <= $signed({(8'ha8)});
          reg20 <= $signed(($unsigned((wire13 == $signed(reg18))) ?
              wire15 : ((8'ha5) >>> ($signed(wire14) || wire16[(1'h0):(1'h0)]))));
          reg21 <= wire13[(1'h0):(1'h0)];
          reg22 <= $unsigned($signed({(^(!wire14))}));
          if ({((($signed(wire15) > reg19) ~^ reg22) ?
                  ({wire16[(1'h0):(1'h0)]} | wire13[(4'h8):(4'h8)]) : ((reg22 ?
                          (|reg20) : (reg21 <= wire13)) ?
                      $signed(reg18) : (wire13[(4'ha):(3'h7)] < $unsigned(reg17))))})
            begin
              reg23 <= {$unsigned(($signed((reg17 && wire13)) >> wire13[(2'h3):(1'h1)]))};
              reg24 <= $unsigned($unsigned(reg18));
              reg25 <= $signed(wire15[(1'h1):(1'h0)]);
              reg26 <= reg22[(4'hb):(4'h9)];
            end
          else
            begin
              reg23 <= ($unsigned((wire16[(1'h1):(1'h1)] ?
                  {$unsigned(reg25),
                      ((8'h9f) ?
                          (8'hbf) : reg26)} : $unsigned($signed((8'ha5))))) ^~ $unsigned({((-reg20) ?
                      $signed(reg18) : $unsigned(reg22)),
                  ((!wire14) + reg22)}));
              reg24 <= {($signed($signed((wire12 ? reg21 : wire13))) ?
                      $unsigned(reg23) : wire15[(4'ha):(1'h0)]),
                  {(!reg19[(3'h4):(3'h4)]), $unsigned($signed((~|reg18)))}};
            end
        end
      if (wire16)
        begin
          if ((($unsigned((~|(~&(8'ha5)))) ^ (~^{$unsigned(reg17),
                  reg19[(4'hd):(2'h2)]})) ?
              (^$signed((^~$signed(wire13)))) : $signed(($signed((wire13 ?
                      (8'hbc) : (8'hae))) ?
                  (8'hb4) : $signed($signed(wire15))))))
            begin
              reg27 <= $unsigned(reg23);
              reg28 <= (reg21 ?
                  ({((+reg20) ? $signed(reg23) : (reg24 - (8'h9f))),
                          {(reg26 ? wire15 : reg26)}} ?
                      reg23[(1'h1):(1'h0)] : $signed(reg23)) : (reg21 ?
                      reg24 : (~|($unsigned((8'hbe)) | (!reg25)))));
              reg29 <= {$signed((wire14[(4'hd):(4'hb)] ?
                      (~&$unsigned(wire14)) : reg24))};
              reg30 <= (-reg22[(5'h15):(4'h9)]);
            end
          else
            begin
              reg27 <= (reg22 | ((+{reg28, reg18}) ?
                  ($unsigned((8'ha1)) ^ (!(wire16 ?
                      wire14 : (8'ha4)))) : wire15));
              reg28 <= $signed($signed((reg26 >>> reg26)));
              reg29 <= (~(reg28[(3'h4):(3'h4)] ~^ $unsigned(((reg30 ^ reg23) << (7'h42)))));
            end
          reg31 <= reg23;
        end
      else
        begin
          reg27 <= reg22[(5'h13):(5'h10)];
          reg28 <= $signed(({(reg25[(4'h9):(4'h9)] ^~ (reg24 | wire13)),
                  {$signed(reg22)}} ?
              ((+$unsigned(reg31)) ?
                  ((~&reg27) <<< (reg29 ?
                      reg22 : wire12)) : (|reg22[(5'h12):(1'h0)])) : reg18));
        end
    end
  module32 #() modinst58 (.clk(clk), .y(wire57), .wire34(reg26), .wire35(reg17), .wire33(wire13), .wire36(reg29));
  assign wire59 = (wire16 & $unsigned((reg20[(2'h3):(1'h1)] ?
                      wire13 : reg31[(3'h6):(3'h4)])));
  always
    @(posedge clk) begin
      reg60 <= wire14[(3'h4):(3'h4)];
      reg61 <= {$unsigned((!$signed((reg30 ^ wire57)))),
          wire15[(5'h10):(2'h3)]};
      reg62 <= wire14[(4'h8):(1'h1)];
      reg63 <= (+($signed((((7'h44) ?
          wire16 : reg25) >> wire59[(2'h3):(1'h0)])) << reg18[(3'h6):(1'h0)]));
      reg64 <= $unsigned(wire57);
    end
  assign wire65 = (wire59 ?
                      ($signed($unsigned($unsigned(wire13))) <<< reg19[(3'h6):(2'h3)]) : reg64[(4'hb):(1'h1)]);
  always
    @(posedge clk) begin
      if ($unsigned(reg26[(3'h7):(2'h2)]))
        begin
          reg66 <= ({{(reg21 ? (^wire16) : (-wire13))},
              ((~|$unsigned(wire57)) ?
                  {wire16[(1'h1):(1'h1)]} : wire12[(3'h4):(1'h1)])} & $unsigned(reg25[(1'h1):(1'h1)]));
          reg67 <= reg25[(2'h3):(1'h0)];
          reg68 <= $unsigned($signed($unsigned($signed($unsigned(reg18)))));
          reg69 <= ({$signed(((|wire12) && $signed(reg24))),
              (^~reg19)} & $unsigned(((((8'hba) << (8'hb3)) ~^ ((8'ha0) || wire57)) ?
              wire13 : (^(reg23 ? reg61 : reg64)))));
        end
      else
        begin
          reg66 <= $unsigned(reg62);
          reg67 <= (~&$signed($unsigned(reg20[(3'h4):(2'h2)])));
        end
    end
  assign wire70 = (((reg17 && $unsigned($unsigned(reg62))) ?
                      $unsigned(wire14[(2'h2):(1'h0)]) : ($unsigned((&(8'ha7))) ?
                          ((reg66 ?
                              reg69 : (7'h43)) << reg18) : ((~^(8'hac)) ^ reg63[(4'hb):(4'hb)]))) <= reg23);
  assign wire71 = reg31;
  assign wire72 = $signed(((8'hb7) ?
                      reg61[(3'h7):(3'h5)] : $signed(wire16[(1'h0):(1'h0)])));
  assign wire73 = $unsigned(reg21);
  assign wire74 = $signed(reg61[(3'h7):(2'h2)]);
  assign wire75 = wire57[(4'hc):(4'hc)];
  always
    @(posedge clk) begin
      reg76 <= $signed((+reg64[(5'h11):(1'h0)]));
      reg77 <= $unsigned(($unsigned(reg17[(4'h8):(3'h6)]) ?
          ((!(^reg68)) >> reg76[(3'h5):(3'h5)]) : (-((!reg18) ?
              $signed(reg20) : (reg22 ? reg64 : (8'h9c))))));
      reg78 <= (8'hb1);
      reg79 <= (reg28[(1'h1):(1'h1)] == (~wire72));
      reg80 <= reg60[(3'h5):(2'h2)];
    end
  always
    @(posedge clk) begin
      reg81 <= ($signed($signed((wire70[(2'h3):(2'h2)] ?
          wire14[(4'h9):(4'h9)] : $signed(reg25)))) <<< (reg19[(1'h1):(1'h1)] ?
          ((reg17 ?
              $signed(reg27) : (reg76 & reg68)) == reg60[(3'h4):(1'h1)]) : (^(!(-wire75)))));
      reg82 <= $unsigned((!(((reg69 ? reg62 : reg63) ?
          {(8'hb9)} : (~reg22)) & ((~^wire72) ? {reg20} : reg26))));
      if ({$unsigned($unsigned($signed((reg64 ? reg81 : reg18)))),
          $signed(reg29[(4'hb):(4'ha)])})
        begin
          reg83 <= {($signed(reg20) + reg27[(4'hb):(2'h2)]),
              {$unsigned((-(8'had))),
                  ((8'h9e) | $signed(((8'hbf) ? reg82 : reg31)))}};
          reg84 <= (~^$unsigned(wire14[(2'h3):(1'h0)]));
        end
      else
        begin
          reg83 <= {(8'hb1), {reg67[(4'h8):(1'h0)]}};
          reg84 <= reg66;
          reg85 <= $signed((reg31[(2'h3):(1'h0)] << ({$signed(wire13)} ?
              $signed((reg26 ? reg29 : wire16)) : ((reg82 ?
                  reg28 : reg60) >>> {reg63, reg79}))));
        end
      if ((($unsigned($unsigned((~^wire70))) + (-$signed((^reg30)))) <= reg21))
        begin
          if ($unsigned(reg27[(1'h1):(1'h0)]))
            begin
              reg86 <= (reg69 < {{wire57, $signed(((7'h43) && (8'hb5)))},
                  ($signed(wire71[(1'h1):(1'h0)]) ?
                      reg66[(4'h8):(3'h4)] : {(~&reg79), reg67})});
              reg87 <= ((!wire70) <= $unsigned($unsigned($unsigned($unsigned(reg30)))));
              reg88 <= wire13;
              reg89 <= $unsigned(({reg68} ?
                  ($signed((reg84 ? reg68 : reg81)) ?
                      (reg84[(3'h5):(3'h4)] ?
                          $unsigned((8'ha0)) : $unsigned((7'h41))) : reg23) : $signed($signed($signed(reg81)))));
            end
          else
            begin
              reg86 <= (~&reg25);
              reg87 <= wire13;
              reg88 <= reg21[(1'h0):(1'h0)];
              reg89 <= reg24;
              reg90 <= $signed($unsigned((~$unsigned(reg86))));
            end
          reg91 <= reg68[(4'hb):(4'h8)];
          reg92 <= {wire65[(2'h3):(2'h2)],
              $unsigned($unsigned(reg25[(4'hc):(3'h4)]))};
        end
      else
        begin
          if ($signed(reg61[(4'h9):(4'h9)]))
            begin
              reg86 <= reg66[(3'h4):(3'h4)];
              reg87 <= reg83[(4'hc):(4'hb)];
            end
          else
            begin
              reg86 <= ($unsigned($unsigned((!(wire16 >= (8'ha5))))) >> {(&($unsigned(wire15) < (~&(8'hb8)))),
                  (reg17 ? $signed(reg60) : reg64)});
              reg87 <= reg21;
              reg88 <= {{(~|reg84[(3'h6):(3'h6)]),
                      {{reg81, (8'hbd)}, ((&reg26) >>> $unsigned(reg18))}}};
              reg89 <= {wire57[(4'ha):(2'h3)]};
            end
        end
    end
  assign wire93 = $signed($signed(wire73[(4'h8):(3'h6)]));
  module94 #() modinst111 (.wire98(reg83), .wire96(reg68), .wire97(reg69), .wire95(reg29), .clk(clk), .y(wire110));
  assign wire112 = {(8'h9c)};
  module113 #() modinst183 (.y(wire182), .wire116(reg60), .wire115(reg27), .wire117(reg81), .wire114(reg91), .clk(clk));
  assign wire184 = $signed(((8'had) ?
                       (~^$unsigned({wire112,
                           wire12})) : {(wire14[(2'h2):(1'h1)] ?
                               reg69 : (8'hb3))}));
endmodule

module module113
#(parameter param181 = {{((7'h43) ^ {{(8'ha1), (8'hb8)}}), ((((8'hb4) ^~ (8'ha3)) ? ((8'hac) ~^ (8'haf)) : ((8'ha7) * (8'ha2))) ? (((8'ha4) | (8'hab)) ? {(8'hb6)} : ((7'h44) | (8'hb0))) : {((8'h9c) == (8'hbe)), {(8'hac)}})}, (((^{(8'ha6), (8'h9d)}) >= (((8'h9c) + (8'hb7)) ? (&(8'hbf)) : {(8'hb5), (7'h40)})) >> (&(&{(8'ha5), (8'hbf)})))})
(y, clk, wire117, wire116, wire115, wire114);
  output wire [(32'h2bc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire117;
  input wire signed [(5'h11):(1'h0)] wire116;
  input wire signed [(2'h3):(1'h0)] wire115;
  input wire signed [(4'h9):(1'h0)] wire114;
  wire signed [(4'hd):(1'h0)] wire180;
  wire [(3'h5):(1'h0)] wire168;
  wire signed [(4'h8):(1'h0)] wire167;
  wire signed [(3'h4):(1'h0)] wire166;
  wire [(4'hb):(1'h0)] wire165;
  wire signed [(3'h4):(1'h0)] wire161;
  wire [(4'hd):(1'h0)] wire160;
  wire [(2'h2):(1'h0)] wire159;
  wire signed [(4'he):(1'h0)] wire158;
  wire signed [(5'h10):(1'h0)] wire157;
  wire signed [(4'hc):(1'h0)] wire156;
  wire [(4'h9):(1'h0)] wire155;
  wire signed [(5'h10):(1'h0)] wire132;
  wire signed [(4'h8):(1'h0)] wire131;
  wire signed [(4'hb):(1'h0)] wire119;
  wire signed [(4'ha):(1'h0)] wire118;
  reg [(2'h3):(1'h0)] reg179 = (1'h0);
  reg [(4'ha):(1'h0)] reg178 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg177 = (1'h0);
  reg [(3'h5):(1'h0)] reg176 = (1'h0);
  reg [(4'h9):(1'h0)] reg175 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg174 = (1'h0);
  reg [(3'h6):(1'h0)] reg173 = (1'h0);
  reg signed [(4'he):(1'h0)] reg172 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg171 = (1'h0);
  reg [(3'h5):(1'h0)] reg170 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg169 = (1'h0);
  reg [(5'h12):(1'h0)] reg164 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg163 = (1'h0);
  reg signed [(4'he):(1'h0)] reg162 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg154 = (1'h0);
  reg [(3'h5):(1'h0)] reg153 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg152 = (1'h0);
  reg [(4'he):(1'h0)] reg151 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg150 = (1'h0);
  reg [(2'h3):(1'h0)] reg149 = (1'h0);
  reg [(5'h13):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg146 = (1'h0);
  reg [(3'h7):(1'h0)] reg145 = (1'h0);
  reg [(3'h7):(1'h0)] reg144 = (1'h0);
  reg [(5'h14):(1'h0)] reg143 = (1'h0);
  reg [(5'h10):(1'h0)] reg142 = (1'h0);
  reg [(4'hd):(1'h0)] reg141 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg140 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg139 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg138 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg137 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg136 = (1'h0);
  reg signed [(4'he):(1'h0)] reg135 = (1'h0);
  reg [(5'h14):(1'h0)] reg134 = (1'h0);
  reg [(2'h3):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg130 = (1'h0);
  reg [(5'h13):(1'h0)] reg129 = (1'h0);
  reg [(2'h3):(1'h0)] reg128 = (1'h0);
  reg [(3'h4):(1'h0)] reg127 = (1'h0);
  reg [(3'h5):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg124 = (1'h0);
  reg [(4'hb):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg122 = (1'h0);
  reg [(5'h12):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg120 = (1'h0);
  assign y = {wire180,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire132,
                 wire131,
                 wire119,
                 wire118,
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
                 reg164,
                 reg163,
                 reg162,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
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
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 (1'h0)};
  assign wire118 = $unsigned(((-($unsigned(wire114) ? (!wire117) : wire114)) ?
                       ($signed((wire114 == wire116)) ?
                           ((!wire114) ?
                               (|wire115) : $signed(wire115)) : ((8'ha6) == $signed((8'hb1)))) : (wire114[(2'h3):(2'h3)] ?
                           wire115[(2'h2):(1'h0)] : wire117)));
  assign wire119 = wire114[(3'h7):(1'h1)];
  always
    @(posedge clk) begin
      reg120 <= (-wire115[(1'h1):(1'h1)]);
      if (({{$unsigned(((8'hbc) << wire118)), $signed((|wire115))}} ?
          wire117 : (~&reg120)))
        begin
          reg121 <= wire119[(4'ha):(1'h0)];
          if (((!wire114) ?
              wire117 : (((+$signed(wire119)) || $signed((^wire119))) ?
                  (wire114[(1'h0):(1'h0)] ?
                      (^~wire116[(4'hd):(4'hc)]) : {(&reg121),
                          $signed(wire116)}) : wire114)))
            begin
              reg122 <= $unsigned($unsigned($unsigned({{reg121},
                  $unsigned(wire117)})));
              reg123 <= $signed((wire116[(3'h5):(3'h5)] + reg122));
            end
          else
            begin
              reg122 <= (($signed(({wire117} ?
                      $unsigned(reg121) : (wire116 ? wire114 : wire119))) ?
                  $unsigned((&(reg121 & wire117))) : $signed((^~wire119))) || $unsigned(reg121[(5'h12):(4'hb)]));
            end
          reg124 <= (&$unsigned(wire117[(3'h4):(3'h4)]));
        end
      else
        begin
          if (wire118)
            begin
              reg121 <= $signed($signed($unsigned(wire118[(2'h2):(1'h0)])));
              reg122 <= $unsigned((+{reg124[(1'h0):(1'h0)],
                  wire117[(2'h3):(2'h2)]}));
            end
          else
            begin
              reg121 <= ((^~wire114) ?
                  $unsigned($unsigned((reg124[(4'hf):(4'hf)] || {(8'hb7)}))) : reg124);
              reg122 <= $signed($signed(reg123[(3'h4):(1'h0)]));
            end
        end
      reg125 <= (({reg124} ?
              $signed($signed((wire119 ?
                  (7'h43) : wire117))) : {($unsigned(wire115) >>> (+reg124))}) ?
          (({(reg123 && reg123), (8'hb9)} & $unsigned((reg121 > reg120))) ?
              ((reg124[(4'h9):(4'h9)] ? reg121 : (wire116 ? reg122 : wire117)) ?
                  $signed(wire116) : $signed((wire118 ?
                      wire115 : reg123))) : wire117[(1'h1):(1'h0)]) : (^wire118));
      if (({(reg123 ? $unsigned((8'h9d)) : {$signed(wire115)}),
              (reg123[(3'h4):(1'h0)] ?
                  $signed((&reg122)) : (wire114 | (8'h9c)))} ?
          {(({reg120,
                  (8'ha5)} ~^ (~^wire118)) & ((|reg121) ^~ $signed(reg125)))} : $unsigned($unsigned($unsigned($signed(reg124))))))
        begin
          reg126 <= (~^({$signed((+reg123))} ?
              ((|(wire115 ? reg123 : wire116)) && ((8'ha5) ?
                  $unsigned(reg125) : reg122)) : $unsigned(wire118[(4'h9):(1'h1)])));
          reg127 <= $unsigned($signed(($unsigned($unsigned(reg125)) | (8'hb6))));
          reg128 <= reg127[(3'h4):(1'h0)];
          if (wire119[(2'h2):(2'h2)])
            begin
              reg129 <= $signed(((~wire114[(1'h0):(1'h0)]) ^ $unsigned($unsigned((wire117 - reg125)))));
            end
          else
            begin
              reg129 <= $unsigned({reg124, (7'h42)});
            end
        end
      else
        begin
          reg126 <= $unsigned((8'ha6));
          reg127 <= $signed($signed(wire114));
          reg128 <= (({reg122} ?
              $signed($unsigned(((8'hb0) ~^ reg124))) : $signed($signed((wire119 ?
                  (8'hbb) : wire119)))) + ($signed(reg123[(4'h9):(2'h3)]) ?
              reg125[(3'h6):(1'h0)] : (reg120 || ($unsigned((8'ha1)) ?
                  reg127[(3'h4):(1'h0)] : (8'hbe)))));
          reg129 <= (reg124 && $unsigned(wire116));
        end
      reg130 <= reg127[(3'h4):(2'h3)];
    end
  assign wire131 = (reg120[(4'hf):(4'hd)] != $signed(wire114));
  assign wire132 = {$signed($signed(wire131[(2'h2):(2'h2)]))};
  always
    @(posedge clk) begin
      reg133 <= reg128[(2'h2):(2'h2)];
      reg134 <= (~^$signed($signed(wire118)));
      reg135 <= $signed(reg124[(1'h0):(1'h0)]);
      if (({wire118,
              {($signed(reg129) ?
                      ((8'hbb) ? (7'h40) : reg135) : (reg133 ?
                          reg123 : reg128)),
                  {$unsigned(reg121)}}} ?
          wire118 : (|({$signed(reg128)} ~^ $signed((reg130 ?
              wire114 : wire118))))))
        begin
          reg136 <= (reg134[(5'h14):(4'ha)] ?
              $signed(((~^reg134) ?
                  $signed(reg125[(2'h2):(2'h2)]) : $unsigned($unsigned(reg134)))) : (~|$unsigned(((!reg135) + (8'hb4)))));
          reg137 <= $unsigned(wire117);
          reg138 <= reg129[(2'h3):(2'h2)];
          reg139 <= (wire117 ?
              (wire119 ?
                  wire114 : (~&$unsigned(reg123[(3'h6):(3'h4)]))) : (reg123[(4'h8):(3'h4)] ?
                  reg121[(4'h9):(3'h4)] : ({(~reg126)} ?
                      $signed((reg128 <<< reg130)) : (reg120 ?
                          $signed(reg121) : $unsigned(reg137)))));
        end
      else
        begin
          reg136 <= reg134;
          reg137 <= $unsigned($signed(($signed((~^reg139)) > reg130)));
          if (wire132)
            begin
              reg138 <= (~^$signed((~|reg134[(4'hf):(4'ha)])));
              reg139 <= ($signed({({reg124, reg134} << $unsigned(reg137)),
                      reg128[(2'h3):(2'h2)]}) ?
                  (!$signed(((!(8'hba)) ?
                      ((8'had) >> reg124) : $signed(wire118)))) : reg135[(4'h8):(1'h1)]);
              reg140 <= {reg128[(1'h1):(1'h0)], reg138[(1'h0):(1'h0)]};
              reg141 <= $unsigned($unsigned($signed(((~^reg127) & {wire119,
                  (7'h41)}))));
            end
          else
            begin
              reg138 <= reg134;
              reg139 <= reg125[(1'h0):(1'h0)];
            end
          reg142 <= reg122;
          reg143 <= ((~(|{(reg127 != reg129)})) ?
              $unsigned(reg129) : {(|$signed($signed(reg130))), reg122});
        end
      reg144 <= $signed(((-reg138) < $signed({$unsigned(reg142), reg133})));
    end
  always
    @(posedge clk) begin
      if ({$unsigned(reg137)})
        begin
          reg145 <= reg122;
          reg146 <= $signed((~|(+$signed((wire115 ? wire119 : reg125)))));
        end
      else
        begin
          reg145 <= $unsigned((-$signed($signed((reg142 ? reg126 : reg146)))));
          if (((+reg122[(4'h9):(4'h8)]) ~^ (((~$unsigned(reg120)) ?
              wire116 : reg139[(1'h0):(1'h0)]) <<< (((reg128 ?
                  reg137 : reg145) > (reg122 != reg126)) ?
              reg140 : reg124))))
            begin
              reg146 <= reg138[(1'h0):(1'h0)];
              reg147 <= (wire118[(2'h2):(2'h2)] ?
                  reg126[(3'h5):(1'h1)] : ((-reg138) ?
                      {$signed({(8'ha4)})} : $signed(wire117[(3'h4):(2'h3)])));
              reg148 <= reg120;
              reg149 <= (&$signed(reg126));
              reg150 <= reg134;
            end
          else
            begin
              reg146 <= (&(8'ha5));
            end
          if ($signed($unsigned({(reg147 << {(8'had), reg146}),
              $unsigned(reg125[(4'he):(2'h2)])})))
            begin
              reg151 <= $unsigned($unsigned((!$unsigned({(8'ha0)}))));
              reg152 <= ($signed($unsigned((^{wire116}))) ~^ {((~^(-wire115)) ?
                      reg145 : ($unsigned((8'hba)) <= reg138[(2'h2):(1'h1)]))});
              reg153 <= $signed((-wire117[(3'h4):(1'h1)]));
            end
          else
            begin
              reg151 <= (((^~$unsigned($signed(reg144))) && reg126) ?
                  $signed((((~^reg145) ? (~(8'hb6)) : $signed(reg150)) ?
                      reg124[(3'h4):(1'h0)] : ((reg147 ^~ reg143) ~^ reg145))) : (((wire131 ~^ (~reg127)) ?
                          wire132[(5'h10):(3'h7)] : (&(|wire114))) ?
                      reg138[(1'h0):(1'h0)] : ($signed((-(8'ha3))) ?
                          (wire116[(5'h11):(4'ha)] ?
                              reg128 : (reg152 < reg152)) : $signed(reg134))));
              reg152 <= $unsigned({((~&(wire115 ? wire119 : reg146)) ?
                      (((8'hb3) ? reg127 : reg135) ?
                          (reg149 && reg138) : (+reg121)) : (reg137 <= {reg150,
                          reg129})),
                  reg120[(5'h11):(3'h6)]});
              reg153 <= $signed($signed($unsigned(reg133[(1'h1):(1'h0)])));
              reg154 <= reg122[(4'he):(4'hd)];
            end
        end
    end
  assign wire155 = $unsigned(wire131[(3'h7):(3'h6)]);
  assign wire156 = $unsigned($unsigned(((reg135[(2'h3):(2'h2)] ?
                       $unsigned(reg152) : (reg152 ^ (8'hb7))) == ($signed(wire117) ?
                       $unsigned(reg130) : (wire118 >>> reg133)))));
  assign wire157 = wire117;
  assign wire158 = reg146[(4'h8):(3'h6)];
  assign wire159 = ((~^{((&wire115) ?
                           (wire158 <<< reg126) : (reg128 << (7'h43))),
                       reg133[(1'h0):(1'h0)]}) > (reg120 ^ $unsigned(((wire155 ?
                       wire119 : reg126) ^ (~^(8'hb9))))));
  assign wire160 = ($signed((&(reg141 ?
                           (reg125 ^ reg148) : {reg151, reg142}))) ?
                       (wire156[(4'h9):(3'h6)] - $signed(((reg153 >= reg130) | $signed((8'haf))))) : (~($signed((reg144 ?
                               reg124 : reg128)) ?
                           $unsigned(wire155) : reg152[(4'h8):(3'h6)])));
  assign wire161 = {reg136[(5'h11):(4'h8)]};
  always
    @(posedge clk) begin
      reg162 <= {$signed({$signed((reg130 & reg152)), {(~^(8'hbb))}})};
      reg163 <= $signed((($signed((reg130 > (8'ha6))) >= (reg129[(2'h3):(1'h1)] << $signed(reg152))) << ((reg124 ?
          reg134[(5'h10):(3'h7)] : $signed(reg144)) >> (8'had))));
    end
  always
    @(posedge clk) begin
      reg164 <= {$signed($unsigned($signed(wire118)))};
    end
  assign wire165 = (|(&({reg136[(4'hb):(3'h5)]} ?
                       $signed(reg152[(4'hb):(3'h4)]) : {(wire117 && reg130),
                           (reg134 ? reg136 : reg153)})));
  assign wire166 = ($unsigned($unsigned(reg152[(4'hc):(1'h0)])) ?
                       reg128[(2'h2):(1'h0)] : ($unsigned($signed(reg124)) ?
                           (8'haf) : {$signed(reg140[(4'h9):(3'h4)])}));
  assign wire167 = $signed((((reg163 + wire157) ?
                           $unsigned((^~reg128)) : reg121[(4'ha):(3'h5)]) ?
                       {$unsigned((8'ha5)),
                           $unsigned({reg143})} : (|$signed(wire117[(3'h4):(1'h0)]))));
  assign wire168 = ({reg127, reg120[(3'h4):(1'h0)]} ?
                       $signed(wire155[(4'h8):(1'h1)]) : wire159);
  always
    @(posedge clk) begin
      if (wire160)
        begin
          reg169 <= reg153[(3'h4):(3'h4)];
          reg170 <= (+wire157[(1'h0):(1'h0)]);
        end
      else
        begin
          reg169 <= (wire115[(2'h3):(1'h0)] ?
              ((reg163 ? reg143 : $unsigned({wire155, reg126})) ?
                  (~(~&{reg122, reg152})) : ({(reg138 ? reg154 : reg133),
                      (reg143 == reg163)} | (wire118[(2'h2):(1'h0)] ?
                      $unsigned(wire115) : reg120[(3'h4):(1'h0)]))) : {(-reg120),
                  reg164[(4'he):(2'h2)]});
          if ((|wire159))
            begin
              reg170 <= $signed($signed(wire131[(4'h8):(2'h2)]));
              reg171 <= {{(reg146 ? (&$unsigned((8'hac))) : $signed(wire156)),
                      (wire156 * $unsigned(reg120[(3'h5):(3'h4)]))}};
            end
          else
            begin
              reg170 <= $signed((((reg171 ? reg140 : $unsigned((8'hb8))) ?
                  $signed((^~wire114)) : {(&wire132)}) > (reg122 > ($signed(wire161) ?
                  $unsigned(reg144) : (reg162 <<< reg143)))));
            end
          if (wire116)
            begin
              reg172 <= reg129[(4'he):(4'he)];
              reg173 <= (($signed($signed(wire131)) || ($unsigned($unsigned(wire119)) ?
                      (8'hb4) : reg153[(3'h5):(3'h5)])) ?
                  $signed(($signed($signed(reg130)) >> reg120[(3'h7):(2'h3)])) : (wire116[(1'h1):(1'h1)] > (8'ha7)));
            end
          else
            begin
              reg172 <= $unsigned((wire117[(2'h2):(2'h2)] ?
                  {$unsigned($signed(wire165))} : (wire116 <<< reg140[(5'h11):(5'h11)])));
            end
          if ((^({reg143[(3'h5):(1'h0)], reg162[(3'h5):(3'h4)]} ?
              wire155 : $unsigned(reg138[(2'h2):(1'h0)]))))
            begin
              reg174 <= (!(&(~$unsigned(wire156))));
              reg175 <= reg124[(4'h9):(2'h3)];
              reg176 <= $signed($unsigned((~&wire114)));
            end
          else
            begin
              reg174 <= $unsigned(reg130[(2'h2):(1'h0)]);
              reg175 <= (8'hbb);
            end
        end
      if ($signed((reg134[(3'h6):(2'h2)] + ($unsigned((^~reg128)) < $unsigned(((8'hab) ?
          reg123 : reg126))))))
        begin
          reg177 <= ($signed($signed(($signed(wire159) ?
              reg139 : (reg123 - wire157)))) - reg124[(5'h11):(4'hf)]);
          reg178 <= reg162[(4'hd):(2'h2)];
        end
      else
        begin
          reg177 <= (reg175 ?
              $unsigned(({reg137, $unsigned(reg154)} ?
                  reg162 : ($unsigned(reg138) ?
                      $signed(wire165) : (reg154 != wire118)))) : (8'hb3));
          reg178 <= (8'ha2);
          reg179 <= reg141;
        end
    end
  assign wire180 = {(~reg136)};
endmodule

module module94
#(parameter param109 = ((~|{(7'h44), (+(^~(8'ha8)))}) ^ ({(+(~(8'hb1)))} ? {({(8'ha9), (8'hb5)} ? ((7'h41) ? (8'hb6) : (8'haf)) : ((8'hbe) ? (7'h42) : (8'hb5)))} : {(|((8'hbf) > (8'haf))), ((-(8'hac)) > (|(8'haf)))})))
(y, clk, wire98, wire97, wire96, wire95);
  output wire [(32'h63):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire98;
  input wire [(3'h7):(1'h0)] wire97;
  input wire [(5'h15):(1'h0)] wire96;
  input wire [(3'h6):(1'h0)] wire95;
  wire [(4'ha):(1'h0)] wire108;
  wire signed [(3'h5):(1'h0)] wire107;
  wire signed [(4'hc):(1'h0)] wire106;
  wire [(4'ha):(1'h0)] wire100;
  wire signed [(2'h3):(1'h0)] wire99;
  reg [(4'hb):(1'h0)] reg105 = (1'h0);
  reg signed [(4'he):(1'h0)] reg104 = (1'h0);
  reg [(4'ha):(1'h0)] reg103 = (1'h0);
  reg [(4'he):(1'h0)] reg102 = (1'h0);
  reg [(4'h9):(1'h0)] reg101 = (1'h0);
  assign y = {wire108,
                 wire107,
                 wire106,
                 wire100,
                 wire99,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 (1'h0)};
  assign wire99 = wire98[(4'hc):(4'h8)];
  assign wire100 = wire98[(5'h12):(2'h2)];
  always
    @(posedge clk) begin
      if ((-wire97))
        begin
          reg101 <= wire96[(5'h10):(3'h5)];
          reg102 <= (-$signed(wire100));
          reg103 <= $signed(($signed((~&(-reg102))) ?
              (reg101[(3'h4):(2'h2)] - wire97) : wire100));
        end
      else
        begin
          reg101 <= $signed($signed(reg101[(1'h1):(1'h0)]));
          reg102 <= (!reg101[(1'h0):(1'h0)]);
        end
      reg104 <= wire97;
      reg105 <= $unsigned(({($unsigned(wire99) ? {reg104} : (!wire96)),
          wire97[(3'h5):(1'h0)]} <<< ($signed(wire99[(2'h3):(1'h1)]) << $unsigned(wire99))));
    end
  assign wire106 = $unsigned((!wire97[(2'h2):(1'h0)]));
  assign wire107 = $signed((8'hae));
  assign wire108 = {wire99, ((8'hb5) >= wire107[(3'h5):(3'h4)])};
endmodule

module module32  (y, clk, wire36, wire35, wire34, wire33);
  output wire [(32'he1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire36;
  input wire [(3'h6):(1'h0)] wire35;
  input wire [(4'hc):(1'h0)] wire34;
  input wire signed [(4'ha):(1'h0)] wire33;
  wire [(5'h15):(1'h0)] wire56;
  wire signed [(4'hf):(1'h0)] wire55;
  wire signed [(3'h6):(1'h0)] wire54;
  wire [(5'h10):(1'h0)] wire53;
  wire signed [(2'h2):(1'h0)] wire52;
  wire signed [(4'he):(1'h0)] wire51;
  wire [(3'h7):(1'h0)] wire50;
  wire signed [(5'h10):(1'h0)] wire37;
  reg signed [(5'h13):(1'h0)] reg49 = (1'h0);
  reg [(5'h14):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg47 = (1'h0);
  reg [(4'ha):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg45 = (1'h0);
  reg [(4'ha):(1'h0)] reg44 = (1'h0);
  reg [(4'hc):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg42 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg41 = (1'h0);
  reg [(3'h4):(1'h0)] reg40 = (1'h0);
  reg [(4'hd):(1'h0)] reg39 = (1'h0);
  reg [(4'h9):(1'h0)] reg38 = (1'h0);
  assign y = {wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire37,
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
                 (1'h0)};
  assign wire37 = ((((wire36 ?
                      $signed(wire35) : (!wire33)) ^~ {wire34[(4'h9):(3'h4)],
                      (wire34 ?
                          wire34 : wire34)}) * $signed($unsigned((wire35 == (8'ha8))))) != (wire36 || (wire35[(2'h3):(1'h0)] ?
                      $unsigned($signed(wire36)) : (~|{wire33}))));
  always
    @(posedge clk) begin
      if ((wire36[(1'h1):(1'h1)] >> wire36))
        begin
          reg38 <= ($signed(((+(wire33 ? wire35 : wire33)) ?
              (!(wire37 && wire37)) : ($signed(wire35) ~^ wire34))) <<< $signed(($unsigned((wire34 <= wire33)) || wire34)));
          reg39 <= ((($signed((~(8'hab))) >> (wire37 ?
                      $signed((7'h40)) : $signed(wire35))) ?
                  (~&(&wire36[(3'h6):(2'h3)])) : $signed($unsigned((wire35 ?
                      wire33 : wire35)))) ?
              $unsigned(reg38) : (($unsigned((wire37 | wire35)) ?
                      wire37[(4'hf):(3'h4)] : (+(wire35 ? reg38 : wire33))) ?
                  ($unsigned(reg38[(4'h8):(1'h0)]) ?
                      $signed({wire33}) : $signed($signed(wire35))) : wire34[(3'h6):(1'h0)]));
          if (wire35)
            begin
              reg40 <= wire36[(4'hb):(4'ha)];
              reg41 <= (~^{($unsigned($signed(wire35)) + ({wire33,
                      (8'ha8)} >= wire33)),
                  $signed((((8'ha5) ? wire36 : wire36) ?
                      wire37[(2'h3):(2'h3)] : wire34))});
            end
          else
            begin
              reg40 <= ((&wire36[(1'h0):(1'h0)]) || $signed((({reg40} ?
                      (wire33 == reg40) : (reg39 ? reg38 : wire36)) ?
                  $signed({wire37, (8'ha2)}) : wire35)));
              reg41 <= {(((^~((8'haf) ^~ wire35)) ?
                      {$signed(reg39)} : $unsigned($unsigned(wire37))) << wire35[(3'h4):(1'h1)])};
            end
          if (reg41)
            begin
              reg42 <= reg39;
              reg43 <= (^~(wire33[(3'h7):(1'h0)] <= reg38));
            end
          else
            begin
              reg42 <= $signed((wire34 > $unsigned($signed((wire35 <= reg41)))));
              reg43 <= (reg38 || (|{$unsigned({wire36, wire36})}));
              reg44 <= $unsigned(reg43[(4'hc):(3'h4)]);
              reg45 <= (|$signed($unsigned({$signed((7'h42))})));
            end
          reg46 <= reg38[(3'h7):(3'h6)];
        end
      else
        begin
          if (((-($signed((~^reg40)) & $unsigned((~^reg45)))) * (+{$signed((reg40 || reg41)),
              {wire33, $unsigned(reg46)}})))
            begin
              reg38 <= reg38;
            end
          else
            begin
              reg38 <= wire35;
            end
          reg39 <= wire36;
          reg40 <= reg45[(1'h0):(1'h0)];
          reg41 <= (8'haf);
        end
      reg47 <= (((($unsigned((8'hb4)) ?
              reg46 : (wire34 > reg39)) >> {((7'h43) > reg39)}) < (&reg38[(3'h6):(2'h3)])) ?
          reg46[(4'ha):(3'h7)] : {$unsigned((reg42 * $unsigned(wire33))),
              wire33[(3'h5):(1'h0)]});
      reg48 <= reg45;
      reg49 <= reg48;
    end
  assign wire50 = reg46[(3'h7):(3'h6)];
  assign wire51 = (~^wire35);
  assign wire52 = reg43[(4'h9):(3'h7)];
  assign wire53 = (~|reg44[(4'ha):(3'h7)]);
  assign wire54 = (^~(+((reg47 | wire36) ^ $signed($unsigned((8'hac))))));
  assign wire55 = wire53[(4'hc):(4'h9)];
  assign wire56 = ($unsigned(reg40) ^~ ($signed((wire34[(4'h8):(3'h7)] ?
                      reg39[(2'h3):(2'h3)] : reg43)) != ((-$unsigned(wire36)) == {(~&reg40)})));
endmodule
