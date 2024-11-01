module top
#(parameter param101 = (^(~|((((8'h9c) ? (8'hb2) : (8'hb4)) == ((8'hb4) && (8'ha3))) && {(~|(8'hbb)), ((8'hb2) + (8'hb0))}))), 
parameter param102 = param101)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h32):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire100;
  wire [(4'he):(1'h0)] wire99;
  wire [(3'h7):(1'h0)] wire98;
  wire [(5'h11):(1'h0)] wire96;
  assign y = {wire100, wire99, wire98, wire96, (1'h0)};
  module4 #() modinst97 (wire96, clk, wire0, wire1, wire2, wire3);
  assign wire98 = wire0;
  assign wire99 = $unsigned((~|({wire0[(4'hf):(4'ha)]} ?
                      ((8'ha4) ?
                          $signed(wire0) : {(8'ha8)}) : $unsigned((wire98 - wire1)))));
  assign wire100 = $signed($signed(($unsigned(wire2) | ((^wire99) * $signed(wire98)))));
endmodule

module module4
#(parameter param95 = (&(8'ha5)))
(y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'ha2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire8;
  input wire signed [(4'hb):(1'h0)] wire7;
  input wire [(4'hc):(1'h0)] wire6;
  input wire signed [(4'hc):(1'h0)] wire5;
  wire signed [(4'h9):(1'h0)] wire94;
  wire signed [(4'h8):(1'h0)] wire93;
  wire [(3'h5):(1'h0)] wire92;
  wire signed [(4'hd):(1'h0)] wire91;
  wire signed [(5'h10):(1'h0)] wire89;
  wire signed [(4'hf):(1'h0)] wire15;
  wire signed [(4'he):(1'h0)] wire14;
  wire [(4'ha):(1'h0)] wire13;
  wire signed [(4'hf):(1'h0)] wire12;
  wire signed [(5'h10):(1'h0)] wire11;
  wire signed [(5'h15):(1'h0)] wire10;
  wire [(5'h13):(1'h0)] wire9;
  assign y = {wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire89,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 (1'h0)};
  assign wire9 = (wire5 ?
                     (wire7 ?
                         $unsigned(wire7) : $unsigned(((~wire6) ?
                             (8'ha1) : (~&wire5)))) : ($signed(wire5[(2'h3):(2'h3)]) >>> ((8'hbe) ?
                         {$unsigned(wire5)} : {(~wire7)})));
  assign wire10 = wire8;
  assign wire11 = {{(~&{((8'hb5) ? wire10 : wire8)})}};
  assign wire12 = (!$signed($signed((^~{wire7, (8'h9e)}))));
  assign wire13 = wire8;
  assign wire14 = (-({$unsigned((wire6 >= wire13))} ?
                      {$unsigned(wire9), wire9} : wire12));
  assign wire15 = {(wire11[(3'h6):(3'h5)] * wire9[(4'h8):(1'h1)]), {wire10}};
  module16 #() modinst90 (.wire20(wire7), .y(wire89), .wire18(wire14), .wire17(wire9), .wire19(wire11), .clk(clk));
  assign wire91 = $unsigned(wire9);
  assign wire92 = (7'h40);
  assign wire93 = wire7[(2'h2):(1'h1)];
  assign wire94 = (-$signed(((~|wire15) >= $unsigned($signed(wire92)))));
endmodule

module module16  (y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h2c9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire20;
  input wire signed [(5'h10):(1'h0)] wire19;
  input wire signed [(4'he):(1'h0)] wire18;
  input wire [(3'h5):(1'h0)] wire17;
  wire signed [(3'h7):(1'h0)] wire88;
  wire [(4'he):(1'h0)] wire87;
  wire signed [(4'h8):(1'h0)] wire86;
  wire signed [(5'h11):(1'h0)] wire85;
  wire signed [(5'h15):(1'h0)] wire84;
  wire signed [(3'h5):(1'h0)] wire65;
  wire signed [(3'h6):(1'h0)] wire42;
  wire [(5'h15):(1'h0)] wire40;
  wire [(4'he):(1'h0)] wire39;
  wire signed [(4'hf):(1'h0)] wire38;
  wire [(2'h3):(1'h0)] wire37;
  wire signed [(4'he):(1'h0)] wire36;
  wire [(4'h8):(1'h0)] wire35;
  wire signed [(5'h14):(1'h0)] wire26;
  wire [(3'h7):(1'h0)] wire25;
  wire [(2'h2):(1'h0)] wire24;
  wire signed [(2'h3):(1'h0)] wire23;
  wire [(3'h7):(1'h0)] wire22;
  wire [(3'h7):(1'h0)] wire21;
  reg signed [(4'he):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg82 = (1'h0);
  reg [(2'h2):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg80 = (1'h0);
  reg [(5'h15):(1'h0)] reg79 = (1'h0);
  reg signed [(4'he):(1'h0)] reg78 = (1'h0);
  reg [(3'h7):(1'h0)] reg77 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg75 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg74 = (1'h0);
  reg [(3'h6):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg72 = (1'h0);
  reg [(3'h4):(1'h0)] reg71 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg70 = (1'h0);
  reg [(5'h15):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg68 = (1'h0);
  reg signed [(4'he):(1'h0)] reg67 = (1'h0);
  reg [(4'hf):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg64 = (1'h0);
  reg [(5'h15):(1'h0)] reg63 = (1'h0);
  reg [(5'h13):(1'h0)] reg62 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg61 = (1'h0);
  reg [(3'h7):(1'h0)] reg60 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg59 = (1'h0);
  reg [(4'h9):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg57 = (1'h0);
  reg [(5'h15):(1'h0)] reg56 = (1'h0);
  reg signed [(4'he):(1'h0)] reg55 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg54 = (1'h0);
  reg [(3'h7):(1'h0)] reg53 = (1'h0);
  reg [(4'hc):(1'h0)] reg52 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg51 = (1'h0);
  reg [(4'hf):(1'h0)] reg50 = (1'h0);
  reg [(3'h4):(1'h0)] reg49 = (1'h0);
  reg [(4'ha):(1'h0)] reg48 = (1'h0);
  reg [(3'h6):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg46 = (1'h0);
  reg [(4'ha):(1'h0)] reg45 = (1'h0);
  reg [(4'hc):(1'h0)] reg44 = (1'h0);
  reg [(4'h9):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg41 = (1'h0);
  reg [(4'hc):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg33 = (1'h0);
  reg [(3'h7):(1'h0)] reg32 = (1'h0);
  reg signed [(4'he):(1'h0)] reg31 = (1'h0);
  reg [(5'h12):(1'h0)] reg30 = (1'h0);
  reg [(3'h5):(1'h0)] reg29 = (1'h0);
  reg [(3'h7):(1'h0)] reg28 = (1'h0);
  reg [(4'h8):(1'h0)] reg27 = (1'h0);
  assign y = {wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire65,
                 wire42,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
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
                 reg64,
                 reg63,
                 reg62,
                 reg61,
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
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg41,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 (1'h0)};
  assign wire21 = (wire20[(1'h1):(1'h0)] ? $signed((7'h41)) : wire20);
  assign wire22 = $signed(wire21);
  assign wire23 = $unsigned($unsigned({$signed($unsigned(wire22)),
                      $unsigned($signed(wire20))}));
  assign wire24 = (8'hab);
  assign wire25 = (wire19 ?
                      $unsigned($signed(wire17)) : $signed({({wire20,
                              wire18} <<< wire21[(2'h3):(2'h3)]),
                          wire20[(1'h0):(1'h0)]}));
  assign wire26 = $unsigned(($signed(((wire24 >= (8'hba)) >= wire20[(2'h3):(1'h1)])) ?
                      wire18 : wire25));
  always
    @(posedge clk) begin
      reg27 <= (wire24 ?
          (~&(^wire25[(1'h1):(1'h1)])) : ($unsigned(((wire24 ?
                      wire18 : wire24) ?
                  {wire26} : (wire25 * (8'ha3)))) ?
              wire25[(2'h3):(1'h1)] : (-(wire20[(2'h2):(1'h0)] ?
                  wire26 : (wire23 || wire26)))));
      reg28 <= {($signed((!(~|wire17))) <<< wire17), wire22[(1'h1):(1'h0)]};
      if ($signed((reg28[(3'h6):(3'h6)] ^ {(wire18[(3'h7):(3'h7)] ?
              (~^wire18) : (reg27 ~^ reg27))})))
        begin
          reg29 <= wire20[(1'h0):(1'h0)];
          reg30 <= reg29;
          reg31 <= (~^reg27);
          reg32 <= wire24[(1'h1):(1'h0)];
        end
      else
        begin
          reg29 <= reg27[(3'h5):(3'h5)];
          reg30 <= reg29;
        end
      reg33 <= $signed($unsigned($signed(wire19[(4'hf):(4'hb)])));
      reg34 <= wire18;
    end
  assign wire35 = $signed((~^$signed(((reg27 ? wire22 : reg29) >> (reg31 ?
                      wire25 : reg32)))));
  assign wire36 = (8'ha9);
  assign wire37 = $signed((+{reg34[(2'h2):(1'h1)],
                      {wire35[(3'h4):(1'h1)], wire22[(1'h1):(1'h0)]}}));
  assign wire38 = (+reg33);
  assign wire39 = (wire18 ? reg28 : (^$signed((!wire21))));
  assign wire40 = $unsigned($unsigned(((&$signed(wire25)) ?
                      (|$unsigned(wire18)) : wire39[(3'h7):(2'h2)])));
  always
    @(posedge clk) begin
      reg41 <= reg28[(3'h6):(2'h3)];
    end
  assign wire42 = wire25;
  always
    @(posedge clk) begin
      if ((~|{(-(((8'hb9) ? (8'hb3) : reg30) - wire17[(2'h3):(2'h2)]))}))
        begin
          if ((~^wire25))
            begin
              reg43 <= $signed($unsigned((^((wire37 - reg31) || {reg27,
                  wire20}))));
              reg44 <= ((^wire20[(2'h3):(1'h0)]) ?
                  (wire18[(4'he):(2'h2)] <= (~&$signed(wire17[(2'h3):(2'h3)]))) : (~|wire22));
              reg45 <= wire18;
              reg46 <= $unsigned((wire18[(3'h7):(3'h4)] ?
                  wire22 : reg32[(2'h3):(2'h3)]));
            end
          else
            begin
              reg43 <= $signed((wire37[(2'h2):(1'h0)] + (($signed(wire25) ^ (&wire19)) ?
                  reg29 : wire35[(1'h0):(1'h0)])));
              reg44 <= {{(wire36 | ((~^wire26) >> $signed(wire17))),
                      (~^((wire19 * wire18) > (wire21 >= reg43)))}};
              reg45 <= (~^($signed(($signed(wire19) ^ wire39[(4'ha):(3'h6)])) ?
                  ((!$unsigned(wire35)) ^~ wire35) : (&reg45[(1'h0):(1'h0)])));
              reg46 <= (reg30 || (8'haf));
              reg47 <= (~^reg46[(5'h11):(4'hf)]);
            end
          if (((|(8'hb2)) || $unsigned(wire38)))
            begin
              reg48 <= $unsigned($unsigned($unsigned((+$signed(wire22)))));
              reg49 <= wire26;
              reg50 <= wire42;
              reg51 <= $signed($signed((~&$unsigned(reg44))));
              reg52 <= (~&$signed(reg29));
            end
          else
            begin
              reg48 <= (+$signed((+(!$unsigned((8'ha4))))));
            end
          reg53 <= wire18;
        end
      else
        begin
          if ($unsigned(reg50))
            begin
              reg43 <= (((((wire25 >>> (7'h44)) ?
                      reg46 : (reg41 >> reg53)) || ($signed(wire24) ?
                      reg49 : $unsigned(wire23))) ^~ (wire17[(3'h4):(1'h0)] ?
                      reg41[(1'h0):(1'h0)] : {(wire22 ? wire25 : reg52)})) ?
                  wire24[(1'h0):(1'h0)] : {wire24[(1'h1):(1'h0)],
                      {(~((8'hbd) >> wire36))}});
              reg44 <= $signed(wire22[(3'h5):(1'h0)]);
              reg45 <= $signed($unsigned(reg51));
              reg46 <= (!reg53);
            end
          else
            begin
              reg43 <= reg41;
              reg44 <= reg34;
              reg45 <= reg49;
              reg46 <= reg28;
              reg47 <= reg46;
            end
          if ((($signed($unsigned($unsigned(wire20))) ?
                  reg48 : ((~^$signed(reg31)) ~^ wire25)) ?
              (~(&($signed(reg33) ?
                  (reg33 ?
                      reg29 : reg46) : reg51[(1'h0):(1'h0)]))) : (~wire26)))
            begin
              reg48 <= (((8'ha1) ?
                      $unsigned(((wire37 ?
                          reg34 : reg31) && reg50[(4'he):(3'h6)])) : {$unsigned(reg27[(1'h1):(1'h0)]),
                          ($unsigned(reg49) ?
                              (reg29 == wire35) : wire26[(5'h14):(4'h8)])}) ?
                  (~|(!wire20[(1'h1):(1'h1)])) : (($unsigned(reg50[(4'hf):(3'h5)]) ~^ $unsigned(wire24[(2'h2):(1'h1)])) << {$signed($unsigned((8'ha5)))}));
            end
          else
            begin
              reg48 <= wire26;
            end
          reg49 <= wire21;
          reg50 <= {($unsigned((~|wire22[(3'h4):(3'h4)])) && (^wire36[(3'h7):(3'h6)])),
              ((+$unsigned({reg50})) >> $unsigned({$unsigned(reg34)}))};
        end
      if (wire23[(2'h2):(1'h0)])
        begin
          if ($unsigned({{$signed($unsigned(wire18)), $unsigned(reg27)}}))
            begin
              reg54 <= $signed(($unsigned(wire38[(4'hf):(3'h7)]) <= wire35[(4'h8):(1'h1)]));
              reg55 <= $signed(((~reg33[(1'h0):(1'h0)]) ?
                  (~&reg28) : (reg34 ?
                      wire40 : ($unsigned(wire23) ?
                          (-wire25) : $unsigned((8'ha9))))));
            end
          else
            begin
              reg54 <= ($unsigned((-$signed($unsigned(reg54)))) ?
                  {(~^((reg44 ? wire20 : reg41) ? reg49 : (reg30 * reg29))),
                      reg53[(3'h4):(2'h3)]} : $signed((&((reg48 ?
                          (8'hb4) : reg41) ?
                      (wire26 || wire17) : $signed(reg28)))));
              reg55 <= $unsigned($signed($unsigned($signed((8'hb7)))));
              reg56 <= ((&wire39[(4'ha):(2'h2)]) ?
                  $signed($unsigned(($signed(wire26) + {(7'h40)}))) : wire39[(2'h3):(2'h3)]);
              reg57 <= reg46[(4'hd):(4'h8)];
              reg58 <= ((reg43 | reg29) & reg57);
            end
          reg59 <= ((reg34[(3'h5):(2'h2)] >>> ($unsigned(reg30) - {$signed(wire24),
              (reg44 ^ wire18)})) > reg27[(1'h1):(1'h1)]);
          reg60 <= $signed(wire42);
          if (({(($signed(reg53) && (reg46 | wire20)) ^ ((^reg56) ^~ (reg48 ?
                  reg29 : reg28))),
              ($signed($unsigned(wire40)) << {wire18[(1'h0):(1'h0)],
                  reg45[(2'h2):(1'h1)]})} <= ((^~(wire35 << (wire22 << reg30))) | $signed(($signed(reg55) ?
              (!wire22) : (reg56 + (8'hab)))))))
            begin
              reg61 <= reg30;
            end
          else
            begin
              reg61 <= $signed($signed($signed(($unsigned(wire25) << ((8'ha9) ?
                  reg47 : reg32)))));
              reg62 <= ((|wire25) != $signed((wire36 ?
                  $signed(reg27[(3'h7):(1'h0)]) : $unsigned((~|reg56)))));
            end
          reg63 <= (wire39[(4'hc):(1'h0)] ?
              (8'hbc) : {reg50,
                  $unsigned(((wire23 <<< reg51) != (reg46 == (8'h9d))))});
        end
      else
        begin
          reg54 <= reg58;
          reg55 <= (($signed(reg30) ?
              (|((reg54 ? wire26 : reg56) ?
                  $unsigned((8'hbe)) : $signed(wire39))) : reg53) <<< (!$unsigned((-reg46[(5'h11):(4'he)]))));
          if (wire23)
            begin
              reg56 <= $unsigned(($unsigned(reg29) >> reg59));
              reg57 <= wire35[(3'h5):(3'h5)];
              reg58 <= $unsigned((wire35[(1'h0):(1'h0)] - (((-reg27) ?
                      (~reg43) : reg34) ?
                  ((reg51 ^ reg60) && $unsigned(reg47)) : $signed($unsigned(reg47)))));
              reg59 <= {wire19, reg46};
              reg60 <= $signed(reg30[(1'h1):(1'h0)]);
            end
          else
            begin
              reg56 <= $signed((~&(!($unsigned(reg45) >> (8'hae)))));
            end
          reg61 <= (~(((^(wire25 ^ reg58)) | (!(|wire20))) & reg57));
        end
      reg64 <= ((~({reg44[(4'hb):(3'h5)]} ?
          (!$unsigned(reg30)) : wire37)) + (((~^((7'h40) ? wire24 : reg49)) ?
          {reg32,
              reg58[(1'h0):(1'h0)]} : $unsigned($unsigned(reg58))) <<< ($signed(wire42[(2'h3):(2'h2)]) ?
          {(!reg57), ((8'ha6) ^ wire17)} : reg62)));
    end
  assign wire65 = wire39[(4'h9):(3'h4)];
  always
    @(posedge clk) begin
      if (({(~&($signed(reg29) ^~ ((8'ha3) ? (8'h9f) : reg54))), reg33} ?
          (reg43 >> $signed($signed((wire18 - reg62)))) : reg34))
        begin
          reg66 <= ((-(wire20[(2'h2):(1'h1)] <= (((8'hbc) ^ (8'ha4)) != wire19[(4'hd):(4'hc)]))) << ((wire20 ?
                  (~$signed(wire26)) : ({reg54, wire39} * (reg59 ?
                      reg33 : reg34))) ?
              reg52 : $signed($unsigned((~|(8'ha3))))));
          if (reg44)
            begin
              reg67 <= $signed((!($signed((~&reg51)) ? reg27 : wire21)));
              reg68 <= (&$unsigned((~&reg47)));
              reg69 <= ({wire20,
                  ({(-(8'ha9))} ?
                      ((&wire22) ?
                          (!wire38) : reg47[(1'h1):(1'h0)]) : reg30)} | wire21);
            end
          else
            begin
              reg67 <= ($unsigned(reg47[(3'h5):(1'h0)]) ?
                  $unsigned(reg51) : $unsigned({((~|reg61) >= (~&reg52))}));
              reg68 <= ((-$signed($signed($unsigned(reg60)))) ?
                  ((reg56 && {$signed(wire65),
                      reg57}) <= ({((8'hb8) >>> wire23),
                      $unsigned((7'h40))} || $unsigned((reg51 == reg29)))) : reg50);
              reg69 <= (^~$signed($signed(reg33)));
              reg70 <= $unsigned($signed((~&reg61[(2'h3):(1'h1)])));
            end
          reg71 <= ($unsigned(wire20[(1'h1):(1'h0)]) ?
              reg67 : (+(+$unsigned($signed(reg45)))));
          reg72 <= wire20;
          reg73 <= $signed((|reg32));
        end
      else
        begin
          if ($signed($signed((!((reg41 ^~ reg67) ?
              (reg30 >> reg67) : (reg60 ? wire39 : reg67))))))
            begin
              reg66 <= reg28[(1'h1):(1'h1)];
            end
          else
            begin
              reg66 <= ($unsigned((((reg33 ? reg32 : reg53) && {wire19,
                          wire25}) ?
                      ((reg41 ? reg46 : (8'h9c)) ?
                          (^~(8'ha0)) : $unsigned(reg48)) : ($unsigned((8'hbd)) ?
                          $unsigned(reg45) : (reg60 >>> wire37)))) ?
                  reg31 : reg49[(1'h0):(1'h0)]);
              reg67 <= wire17;
            end
        end
      if ((((~reg57[(1'h0):(1'h0)]) ? reg62 : $unsigned(reg30[(3'h4):(2'h2)])) ?
          ({{wire21},
              ((reg58 ? reg63 : reg44) ?
                  {reg62} : wire36)} ^ (!$unsigned($signed(reg27)))) : (&(((wire42 ?
              wire39 : reg52) != wire65[(2'h2):(1'h1)]) <= (reg73[(2'h2):(2'h2)] && (wire26 ?
              wire17 : reg28))))))
        begin
          if ($unsigned(($signed({$unsigned((8'hb6))}) ?
              ((~^$signed(reg69)) ?
                  wire65 : $unsigned(reg55[(4'h8):(3'h4)])) : wire21[(3'h7):(2'h3)])))
            begin
              reg74 <= wire22;
              reg75 <= ($unsigned($unsigned(((8'hb6) == (8'hac)))) <<< reg67);
              reg76 <= (~^(wire26[(4'hb):(2'h2)] >> wire35));
              reg77 <= $unsigned($unsigned(reg33[(3'h4):(2'h3)]));
              reg78 <= (~^(+{($unsigned(wire19) << reg63)}));
            end
          else
            begin
              reg74 <= wire24;
              reg75 <= $signed((+(~^reg58)));
            end
          reg79 <= (-(^{$unsigned(wire65[(3'h5):(3'h5)]), $signed({(7'h40)})}));
          reg80 <= (wire21 ?
              (~$unsigned($signed($signed(wire20)))) : ($unsigned($signed((wire22 ?
                      wire19 : wire25))) ?
                  ((~^(reg59 ? (8'hb9) : reg44)) ? reg68 : (8'ha9)) : reg51));
          reg81 <= reg70;
          reg82 <= $signed(reg61[(1'h1):(1'h1)]);
        end
      else
        begin
          reg74 <= $unsigned(wire26);
          reg75 <= wire23;
        end
      reg83 <= ((reg48 && (!$unsigned((~&wire65)))) ?
          ((^~({(8'hba)} ?
              (&reg29) : (^~(8'hb9)))) != (^~reg82[(3'h4):(2'h2)])) : $signed($signed($unsigned(reg68))));
    end
  assign wire84 = reg63;
  assign wire85 = (^~(~|(($unsigned(reg68) - reg81) >>> (-(reg71 ?
                      wire20 : reg58)))));
  assign wire86 = $unsigned({reg57[(2'h3):(2'h2)],
                      $unsigned($unsigned((!(8'ha3))))});
  assign wire87 = $signed(((8'haa) ?
                      ($unsigned($signed(reg32)) ?
                          ({reg59} << reg83) : reg73) : wire42));
  assign wire88 = {(!wire40), (-$signed(reg60[(2'h3):(1'h1)]))};
endmodule
