module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h17e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire0;
  input wire [(4'hd):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire4;
  wire [(4'h8):(1'h0)] wire102;
  wire [(3'h7):(1'h0)] wire100;
  wire signed [(3'h7):(1'h0)] wire99;
  wire [(4'hf):(1'h0)] wire98;
  wire signed [(4'ha):(1'h0)] wire97;
  wire signed [(5'h14):(1'h0)] wire93;
  wire signed [(4'hd):(1'h0)] wire92;
  wire [(4'hc):(1'h0)] wire84;
  wire signed [(3'h5):(1'h0)] wire83;
  wire signed [(4'he):(1'h0)] wire5;
  wire signed [(4'hd):(1'h0)] wire70;
  reg signed [(3'h5):(1'h0)] reg101 = (1'h0);
  reg [(2'h3):(1'h0)] reg96 = (1'h0);
  reg [(4'hf):(1'h0)] reg95 = (1'h0);
  reg [(4'hd):(1'h0)] reg94 = (1'h0);
  reg [(5'h14):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg90 = (1'h0);
  reg [(5'h11):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg88 = (1'h0);
  reg [(4'hc):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg86 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg85 = (1'h0);
  reg [(4'h9):(1'h0)] reg82 = (1'h0);
  reg [(3'h4):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg80 = (1'h0);
  reg [(4'hf):(1'h0)] reg79 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg78 = (1'h0);
  reg [(4'h9):(1'h0)] reg77 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg75 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg72 = (1'h0);
  assign y = {wire102,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire93,
                 wire92,
                 wire84,
                 wire83,
                 wire5,
                 wire70,
                 reg101,
                 reg96,
                 reg95,
                 reg94,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
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
                 (1'h0)};
  assign wire5 = wire2[(4'hb):(4'ha)];
  module6 #() modinst71 (wire70, clk, wire0, wire4, wire2, wire5, wire1);
  always
    @(posedge clk) begin
      if ((8'ha0))
        begin
          if ($unsigned($unsigned($unsigned(($unsigned(wire5) <<< $unsigned(wire3))))))
            begin
              reg72 <= (wire1[(4'hb):(2'h2)] + {wire3,
                  $signed(({wire1, (8'hac)} ?
                      (|wire3) : wire0[(4'hc):(4'h8)]))});
              reg73 <= (~$unsigned(wire4));
              reg74 <= (8'hb4);
              reg75 <= wire3[(4'hb):(1'h1)];
              reg76 <= $signed($unsigned($unsigned(wire4[(3'h6):(1'h1)])));
            end
          else
            begin
              reg72 <= reg74;
              reg73 <= (($unsigned($signed((reg74 * wire0))) ?
                  {$unsigned(reg73[(1'h1):(1'h0)])} : wire4[(4'h8):(2'h2)]) << ($unsigned(wire0[(2'h2):(1'h0)]) ?
                  $signed(reg72[(3'h6):(1'h0)]) : wire4[(3'h7):(1'h1)]));
              reg74 <= wire3[(3'h5):(2'h3)];
            end
          reg77 <= ($signed(($signed($unsigned(reg76)) > (-reg73))) <= $unsigned(wire1[(3'h7):(3'h6)]));
          if ($signed(((~^((wire1 ? reg74 : reg73) ^~ $unsigned(reg73))) ?
              reg75 : wire3)))
            begin
              reg78 <= (reg72[(3'h7):(3'h7)] - $unsigned((($signed((7'h43)) || reg72) >= (7'h41))));
              reg79 <= (((wire2[(4'hc):(4'h9)] - $signed((wire2 ?
                  (8'hbc) : reg74))) != $unsigned(($signed(reg78) ?
                  ((8'h9c) ?
                      wire0 : wire4) : $signed(wire1)))) > reg75[(3'h5):(2'h2)]);
              reg80 <= {$signed((($signed((8'hb9)) + wire70[(4'hc):(4'h8)]) * $signed($signed(reg79)))),
                  reg79};
            end
          else
            begin
              reg78 <= (((|((reg74 ^~ (8'ha3)) >= wire4[(1'h0):(1'h0)])) >= $unsigned($unsigned({reg74,
                  reg78}))) + $unsigned((7'h44)));
            end
          reg81 <= (+wire2);
          reg82 <= wire2;
        end
      else
        begin
          reg72 <= ((wire70 && $signed($unsigned($signed(wire3)))) ?
              $unsigned(reg72) : (($signed(wire0) || reg81[(1'h1):(1'h0)]) >= (+((wire5 + (8'ha9)) ?
                  wire4 : {reg76, reg72}))));
          reg73 <= ({$signed(wire0[(4'hc):(3'h6)])} ?
              $unsigned((+((8'ha8) ?
                  (reg73 - wire3) : {reg80}))) : reg74[(2'h2):(1'h0)]);
          if (reg80)
            begin
              reg74 <= ($signed(reg75) ?
                  reg74 : (&$signed((~$unsigned((8'h9c))))));
              reg75 <= reg73[(1'h1):(1'h1)];
            end
          else
            begin
              reg74 <= (8'hb3);
            end
          reg76 <= (reg74 >>> $signed($signed($unsigned((~^reg76)))));
          reg77 <= (~^$signed($unsigned(($unsigned((8'hb7)) ?
              reg76 : $signed(reg80)))));
        end
    end
  assign wire83 = ($unsigned(wire70[(4'ha):(2'h2)]) != {(~|reg73[(2'h2):(2'h2)]),
                      {$signed($signed((8'ha1)))}});
  assign wire84 = $unsigned(wire3[(4'h8):(1'h1)]);
  always
    @(posedge clk) begin
      reg85 <= ((wire0 ?
          ($unsigned((wire3 * reg80)) < (!{wire4})) : (($signed(wire84) ?
                  (8'haa) : wire2) ?
              (|wire2) : reg75[(3'h4):(1'h1)])) ^ $signed((((~&wire0) || $signed(reg72)) ?
          {$unsigned(wire1)} : {((8'h9d) ? reg77 : wire70), $signed(reg77)})));
      if ($signed((($signed((+(8'h9c))) ?
          {$signed(wire5), wire84} : reg74[(3'h6):(1'h1)]) || wire70)))
        begin
          reg86 <= reg72;
          reg87 <= ($unsigned(({((8'haa) ? reg80 : reg72)} & (reg86 ?
              wire70[(4'h8):(4'h8)] : {reg74}))) << wire2);
          reg88 <= $signed(($signed($signed(reg72[(4'hc):(1'h0)])) < reg81));
          reg89 <= reg74;
        end
      else
        begin
          if ($unsigned((^~reg87)))
            begin
              reg86 <= ((((-reg74[(2'h2):(1'h1)]) ?
                      wire70 : (+wire3[(4'he):(2'h3)])) ?
                  wire5[(4'h9):(2'h2)] : reg86) || reg89[(2'h2):(1'h1)]);
              reg87 <= (&reg79[(3'h6):(2'h2)]);
              reg88 <= ((8'hb4) ?
                  ($signed({(-reg78)}) ?
                      (&reg86) : (8'hb9)) : $unsigned((($unsigned(reg75) ?
                      (^(8'h9f)) : reg77[(4'h9):(1'h0)]) << (!{reg76,
                      reg74}))));
              reg89 <= wire70[(3'h7):(3'h4)];
              reg90 <= (wire5 ?
                  ((8'ha6) ?
                      $unsigned($unsigned($unsigned(wire4))) : $unsigned((^(reg75 * wire3)))) : (~^reg72));
            end
          else
            begin
              reg86 <= (~$signed(reg88));
              reg87 <= reg88;
            end
        end
      reg91 <= $unsigned($signed($unsigned((|(-(7'h41))))));
    end
  assign wire92 = reg79;
  assign wire93 = reg90[(5'h11):(5'h11)];
  always
    @(posedge clk) begin
      reg94 <= (reg75[(1'h1):(1'h1)] ? (^~wire83) : reg79[(1'h1):(1'h1)]);
      reg95 <= {wire92, $signed({(8'hb8)})};
      reg96 <= (+({(8'had),
          ((wire83 * wire92) << $unsigned(reg72))} <= (reg94[(4'hc):(2'h2)] ?
          $signed({wire2}) : {((7'h43) ^ wire5), $unsigned((8'hb6))})));
    end
  assign wire97 = $signed(reg74[(1'h1):(1'h1)]);
  assign wire98 = ((8'hb6) * wire83[(1'h0):(1'h0)]);
  assign wire99 = $signed({$signed({reg76[(1'h1):(1'h0)]}),
                      $unsigned((|$signed(wire1)))});
  assign wire100 = (~&reg94);
  always
    @(posedge clk) begin
      reg101 <= reg86[(5'h14):(4'hc)];
    end
  assign wire102 = wire70;
endmodule

module module6  (y, clk, wire7, wire8, wire9, wire10, wire11);
  output wire [(32'h78):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire7;
  input wire signed [(4'hf):(1'h0)] wire8;
  input wire signed [(5'h14):(1'h0)] wire9;
  input wire signed [(3'h4):(1'h0)] wire10;
  input wire signed [(4'ha):(1'h0)] wire11;
  wire [(2'h2):(1'h0)] wire12;
  wire [(3'h7):(1'h0)] wire13;
  wire signed [(5'h11):(1'h0)] wire14;
  wire [(4'h8):(1'h0)] wire15;
  wire signed [(3'h7):(1'h0)] wire18;
  wire [(5'h11):(1'h0)] wire19;
  wire [(4'hd):(1'h0)] wire68;
  reg signed [(4'he):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg16 = (1'h0);
  assign y = {wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire18,
                 wire19,
                 wire68,
                 reg21,
                 reg20,
                 reg17,
                 reg16,
                 (1'h0)};
  assign wire12 = $signed({{(+wire7[(1'h1):(1'h0)])}});
  assign wire13 = (wire11[(1'h1):(1'h1)] ?
                      (~($unsigned(((8'ha2) | (8'hb1))) | (&wire8))) : (~&{(wire12[(2'h2):(1'h1)] && {wire7}),
                          wire7}));
  assign wire14 = $signed((wire12[(2'h2):(2'h2)] - (~|(|((8'ha0) ^~ wire9)))));
  assign wire15 = ((^(((wire11 ^ wire10) ?
                              $signed(wire8) : (wire11 ? wire13 : wire13)) ?
                          (wire11 ^~ (~|wire11)) : {wire13})) ?
                      (&((7'h42) + wire11[(1'h1):(1'h1)])) : wire12[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg16 <= {((|$signed(((8'hbf) ? wire8 : wire15))) ?
              $unsigned(((wire14 ?
                  wire15 : wire13) << (wire7 >>> wire15))) : $signed($unsigned(wire9))),
          ((wire9[(4'hd):(3'h5)] >= (wire7 ?
              {wire10, wire9} : (wire15 ?
                  wire9 : wire14))) < (($signed(wire12) ?
              (wire7 ~^ wire10) : $unsigned(wire14)) ~^ $unsigned((~^(7'h44)))))};
      reg17 <= $unsigned($signed(wire9));
    end
  assign wire18 = ((~^(wire9 ?
                      $signed((~^wire10)) : $signed((~&wire13)))) <= $unsigned({($unsigned(reg16) || (&wire14))}));
  assign wire19 = $signed({$unsigned(wire11[(2'h3):(2'h2)]), wire14});
  always
    @(posedge clk) begin
      reg20 <= wire14[(4'h9):(3'h5)];
      reg21 <= ($unsigned($unsigned(wire12[(1'h0):(1'h0)])) ~^ (8'hb2));
    end
  module22 #() modinst69 (.wire27(reg21), .clk(clk), .y(wire68), .wire23(wire11), .wire26(wire7), .wire24(reg16), .wire25(wire18));
endmodule

module module22  (y, clk, wire27, wire26, wire25, wire24, wire23);
  output wire [(32'h1f7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire27;
  input wire [(5'h13):(1'h0)] wire26;
  input wire [(3'h5):(1'h0)] wire25;
  input wire [(5'h10):(1'h0)] wire24;
  input wire [(4'ha):(1'h0)] wire23;
  wire signed [(5'h15):(1'h0)] wire67;
  wire signed [(3'h5):(1'h0)] wire66;
  wire [(3'h5):(1'h0)] wire60;
  wire signed [(4'h8):(1'h0)] wire59;
  wire [(4'hb):(1'h0)] wire58;
  wire [(5'h11):(1'h0)] wire57;
  wire signed [(4'hc):(1'h0)] wire56;
  wire [(3'h7):(1'h0)] wire34;
  wire [(4'hf):(1'h0)] wire33;
  wire signed [(2'h2):(1'h0)] wire32;
  wire [(4'hf):(1'h0)] wire31;
  wire signed [(5'h14):(1'h0)] wire30;
  wire [(5'h14):(1'h0)] wire29;
  wire [(5'h13):(1'h0)] wire28;
  reg signed [(2'h3):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg64 = (1'h0);
  reg [(2'h3):(1'h0)] reg63 = (1'h0);
  reg [(4'hf):(1'h0)] reg62 = (1'h0);
  reg [(4'h8):(1'h0)] reg61 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg54 = (1'h0);
  reg [(2'h2):(1'h0)] reg53 = (1'h0);
  reg [(5'h13):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg50 = (1'h0);
  reg [(4'hf):(1'h0)] reg49 = (1'h0);
  reg [(4'hd):(1'h0)] reg48 = (1'h0);
  reg [(4'h8):(1'h0)] reg47 = (1'h0);
  reg [(4'he):(1'h0)] reg46 = (1'h0);
  reg [(5'h11):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg44 = (1'h0);
  reg [(5'h13):(1'h0)] reg43 = (1'h0);
  reg [(5'h11):(1'h0)] reg42 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg40 = (1'h0);
  reg [(4'hc):(1'h0)] reg39 = (1'h0);
  reg [(3'h7):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg37 = (1'h0);
  reg [(5'h10):(1'h0)] reg36 = (1'h0);
  reg [(5'h10):(1'h0)] reg35 = (1'h0);
  assign y = {wire67,
                 wire66,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
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
                 (1'h0)};
  assign wire28 = wire25;
  assign wire29 = (^(wire27[(4'hb):(1'h1)] && ((wire24[(2'h3):(1'h0)] ?
                      wire24 : wire28) * (+(^wire26)))));
  assign wire30 = (wire24[(2'h3):(1'h0)] - $signed(wire25[(1'h0):(1'h0)]));
  assign wire31 = (-$signed(wire28[(2'h2):(1'h1)]));
  assign wire32 = wire23[(4'ha):(3'h5)];
  assign wire33 = (&((^(|$unsigned(wire23))) >= ((wire29 != (wire30 ?
                      wire25 : wire29)) | $unsigned({wire29}))));
  assign wire34 = wire28[(4'hc):(1'h1)];
  always
    @(posedge clk) begin
      if (((wire31 ?
          (({wire32} < (wire23 && wire34)) ?
              (&$signed((8'haf))) : wire34) : (wire27[(3'h4):(1'h1)] ?
              ($unsigned(wire25) ?
                  wire25[(3'h5):(1'h0)] : $signed(wire31)) : ($signed(wire34) ?
                  $unsigned(wire27) : $unsigned(wire26)))) && (~$signed((8'ha3)))))
        begin
          reg35 <= wire23;
          reg36 <= wire31;
        end
      else
        begin
          if (reg35)
            begin
              reg35 <= (|($unsigned(wire32) ?
                  (+$signed((reg36 << wire26))) : {(~^$signed(wire23)),
                      ({(8'hb7)} ? {wire23} : $signed(wire32))}));
              reg36 <= (-($signed($signed($unsigned((8'hac)))) && (-(~wire26))));
            end
          else
            begin
              reg35 <= (wire28 ?
                  ($unsigned($unsigned((^wire27))) ?
                      ((~^(wire32 ? wire26 : wire26)) & ((8'hb0) ?
                          (&wire27) : wire31)) : (8'ha7)) : ($unsigned(({wire31,
                              wire23} ?
                          (^(8'ha9)) : wire28)) ?
                      $unsigned(wire32[(1'h0):(1'h0)]) : (+$signed(wire32[(1'h0):(1'h0)]))));
              reg36 <= (wire30[(3'h4):(2'h2)] <= reg35);
            end
        end
      reg37 <= ($signed($unsigned({(-reg36),
          wire31})) >>> $unsigned($unsigned((wire25 + $unsigned((8'ha0))))));
      if ($unsigned($unsigned((8'hb5))))
        begin
          if (((wire28 ?
              (($unsigned(wire26) >= (~^wire23)) ?
                  wire28 : wire23[(3'h6):(3'h6)]) : wire24[(4'hc):(3'h5)]) >>> (+(|((8'hb0) ^~ $unsigned((8'ha4)))))))
            begin
              reg38 <= $signed((((wire31 ?
                  wire25 : (wire26 | wire29)) == wire31) < $signed({(8'hb6)})));
              reg39 <= reg38;
            end
          else
            begin
              reg38 <= reg38[(1'h1):(1'h1)];
              reg39 <= (&(~|$signed(reg36[(2'h2):(2'h2)])));
            end
          reg40 <= (^~$unsigned({reg37, $signed($signed(wire24))}));
          reg41 <= $signed((^$signed((^(wire26 != reg37)))));
        end
      else
        begin
          if ({((wire34[(2'h2):(2'h2)] <= (wire24 ?
                      {reg40, wire27} : $unsigned(reg40))) ?
                  (wire24[(4'hb):(3'h5)] + wire24) : ($signed(wire27[(3'h5):(2'h3)]) ?
                      (!$unsigned(wire28)) : $signed((&wire31)))),
              $unsigned(wire32[(1'h0):(1'h0)])})
            begin
              reg38 <= ($signed(({wire26, $unsigned(wire26)} ?
                  wire28[(2'h2):(1'h1)] : $signed({reg39}))) - {{(reg41[(3'h4):(2'h3)] < wire34[(3'h4):(2'h2)])}});
              reg39 <= {{$signed({$signed((8'ha5))}),
                      (($signed(wire24) ^~ $unsigned((8'hae))) ?
                          $signed(wire34[(3'h6):(1'h1)]) : ($unsigned(wire23) ?
                              $unsigned((8'h9f)) : {wire26, wire28}))},
                  (~|(~(wire29 ? wire27 : (reg36 - reg38))))};
              reg40 <= reg38[(3'h6):(3'h4)];
              reg41 <= wire24;
            end
          else
            begin
              reg38 <= (~^$signed($signed({((8'ha3) ? wire23 : wire28),
                  (^~(7'h44))})));
              reg39 <= {({(wire28 ? wire23 : (!reg35))} ?
                      ((((7'h41) >> (7'h43)) <= $signed(wire32)) ?
                          ((wire25 - wire32) == reg36[(3'h4):(2'h3)]) : (wire32[(1'h0):(1'h0)] ?
                              (~^wire24) : (~reg38))) : reg39),
                  (~{(^~reg36)})};
              reg40 <= wire27;
              reg41 <= ({$unsigned((reg36 ?
                      (reg37 > (8'h9c)) : (~|(7'h41))))} || ((~|((~(8'hbb)) != $signed((8'hbc)))) ?
                  (((reg35 | wire25) ? $unsigned(wire27) : (~^wire32)) ?
                      $unsigned($signed(wire32)) : (7'h44)) : $signed($unsigned((wire28 < wire30)))));
            end
          if ($signed($signed(({{reg40, wire23},
              reg40[(5'h12):(5'h12)]} && ((~reg35) ?
              (wire34 ? (8'h9f) : reg37) : $unsigned(wire25))))))
            begin
              reg42 <= reg37;
              reg43 <= $unsigned(wire26);
              reg44 <= wire25;
              reg45 <= ($signed(((8'hbf) ?
                  $signed($unsigned(reg39)) : reg40[(5'h12):(1'h0)])) <= wire23[(3'h4):(2'h2)]);
              reg46 <= (+wire31[(4'he):(2'h2)]);
            end
          else
            begin
              reg42 <= $unsigned({((+(wire24 || (8'hae))) << $signed($unsigned(wire33)))});
            end
          if (wire27)
            begin
              reg47 <= $unsigned(reg38);
              reg48 <= (~&{($signed({reg42,
                      (8'haa)}) ~^ $unsigned($unsigned(wire34))),
                  $signed(wire29[(5'h14):(2'h3)])});
              reg49 <= {(-wire29[(5'h14):(5'h12)]), reg44[(1'h1):(1'h0)]};
              reg50 <= $signed(reg49[(1'h1):(1'h1)]);
            end
          else
            begin
              reg47 <= $signed(((~wire29) ?
                  (reg43[(1'h1):(1'h1)] <= (8'hb3)) : {(reg39[(3'h6):(3'h4)] ?
                          ((8'hb9) >> (8'ha8)) : (&reg47)),
                      $signed(reg36[(2'h3):(1'h0)])}));
            end
        end
      if ($signed(((reg49 ?
          reg37[(1'h1):(1'h1)] : ((8'ha5) >> (reg36 + (8'ha1)))) <<< (+$unsigned((-reg50))))))
        begin
          reg51 <= (~&(&reg37[(4'hb):(4'ha)]));
          reg52 <= (reg51 <<< (!({$unsigned(reg38)} ?
              reg50[(1'h0):(1'h0)] : wire26[(5'h13):(4'ha)])));
        end
      else
        begin
          reg51 <= $signed(wire32[(2'h2):(1'h1)]);
          if (reg42[(1'h0):(1'h0)])
            begin
              reg52 <= wire28[(2'h2):(1'h1)];
            end
          else
            begin
              reg52 <= reg45[(4'hb):(4'h9)];
            end
          reg53 <= reg48[(4'hc):(4'h8)];
          reg54 <= $signed({wire31});
        end
      reg55 <= (^~(~^(reg52[(5'h11):(4'hf)] ?
          $signed((reg41 < wire31)) : ($unsigned(reg48) ?
              (~|wire34) : (wire23 ? reg54 : reg36)))));
    end
  assign wire56 = (^$signed((~&reg47[(4'h8):(3'h4)])));
  assign wire57 = $signed($signed(((&$unsigned(reg53)) ?
                      $unsigned((reg48 ?
                          reg47 : wire28)) : (^$signed(reg52)))));
  assign wire58 = reg41[(1'h1):(1'h1)];
  assign wire59 = $signed(reg51);
  assign wire60 = ((((~$unsigned(reg39)) >> ((reg48 ?
                          reg43 : reg43) ^~ $signed((8'ha5)))) ?
                      reg54[(4'hb):(1'h1)] : $unsigned((((8'ha6) > reg46) || $unsigned(reg48)))) - (wire32 ^ $signed(((reg41 != reg52) == wire58))));
  always
    @(posedge clk) begin
      reg61 <= (($signed($unsigned(wire56[(4'ha):(4'ha)])) ?
              (^~$signed(reg46)) : (!((wire30 ? reg51 : reg50) || {reg46,
                  reg49}))) ?
          ($signed((wire32[(1'h1):(1'h0)] > (|reg40))) ^~ {reg49,
              $signed($signed(reg50))}) : $signed(reg35));
      reg62 <= $unsigned(((^~({reg61, (8'hb9)} << (wire60 ?
          wire56 : wire60))) != (reg50[(3'h6):(2'h3)] * $signed((reg50 >> reg53)))));
      reg63 <= (reg61 ?
          {(+reg45[(4'hb):(3'h6)])} : $signed((-(~|wire29[(4'hd):(4'h8)]))));
      reg64 <= (^wire30);
      reg65 <= $unsigned((-$unsigned(((reg45 <= reg62) ? wire24 : reg50))));
    end
  assign wire66 = wire60[(1'h0):(1'h0)];
  assign wire67 = {($signed($signed($signed(wire25))) ?
                          $unsigned(wire58) : reg38[(2'h2):(1'h1)]),
                      reg55};
endmodule
