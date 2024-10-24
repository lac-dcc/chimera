module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire21;
  wire signed [(5'h13):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire5;
  wire signed [(3'h6):(1'h0)] wire23;
  wire [(4'hb):(1'h0)] wire149;
  assign y = {wire21, wire7, wire6, wire5, wire23, wire149, (1'h0)};
  assign wire5 = ({(|((!wire3) ? $signed(wire1) : wire2[(1'h0):(1'h0)]))} ?
                     ({wire3[(4'h9):(4'h9)], wire4} ?
                         (wire0[(2'h3):(2'h2)] ?
                             ($signed(wire3) ?
                                 (wire4 || wire2) : (&wire0)) : ((!wire2) ?
                                 $unsigned(wire3) : (8'hb0))) : wire1[(2'h2):(2'h2)]) : wire3[(1'h1):(1'h1)]);
  assign wire6 = ($signed(($signed(wire5[(1'h1):(1'h1)]) && wire0)) ?
                     (~&(wire2 ?
                         ((wire5 == wire3) ?
                             wire3 : (wire1 ? wire2 : wire4)) : ((wire1 ?
                                 wire0 : wire2) ?
                             (wire3 + wire5) : (wire4 + wire1)))) : {$unsigned($unsigned((wire5 ?
                             wire0 : (7'h42)))),
                         wire2});
  assign wire7 = wire4[(4'hb):(4'h8)];
  module8 #() modinst22 (wire21, clk, wire0, wire1, wire3, wire7, wire6);
  assign wire23 = (wire3[(1'h1):(1'h0)] >= {($unsigned({(8'hba)}) >>> {wire6[(4'hc):(4'ha)]})});
  module24 #() modinst150 (.clk(clk), .y(wire149), .wire27(wire7), .wire25(wire1), .wire28(wire23), .wire26(wire2), .wire29(wire0));
endmodule

module module24
#(parameter param148 = ({(({(8'hba)} ? (8'hba) : ((8'ha4) << (8'hae))) + (((7'h42) || (8'hac)) ? (|(8'hba)) : ((8'hbf) && (8'ha4)))), ((((8'ha8) == (8'hbf)) < (-(8'hbc))) && ((~(8'ha7)) ? ((7'h41) ? (8'ha3) : (8'ha1)) : ((8'hb1) ^~ (8'h9e))))} <<< (~(&(8'hb4)))))
(y, clk, wire29, wire28, wire27, wire26, wire25);
  output wire [(32'h34b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire29;
  input wire [(3'h6):(1'h0)] wire28;
  input wire signed [(2'h2):(1'h0)] wire27;
  input wire [(5'h12):(1'h0)] wire26;
  input wire [(5'h13):(1'h0)] wire25;
  wire [(4'he):(1'h0)] wire147;
  wire signed [(2'h2):(1'h0)] wire146;
  wire [(2'h2):(1'h0)] wire144;
  wire signed [(5'h13):(1'h0)] wire82;
  wire [(4'ha):(1'h0)] wire81;
  wire signed [(5'h15):(1'h0)] wire80;
  wire [(4'hb):(1'h0)] wire62;
  wire signed [(3'h6):(1'h0)] wire61;
  wire signed [(5'h13):(1'h0)] wire56;
  wire signed [(4'he):(1'h0)] wire55;
  wire [(4'hb):(1'h0)] wire36;
  wire [(3'h4):(1'h0)] wire35;
  wire signed [(4'hc):(1'h0)] wire34;
  wire signed [(3'h5):(1'h0)] wire33;
  wire [(5'h10):(1'h0)] wire32;
  wire signed [(3'h7):(1'h0)] wire31;
  wire [(4'h9):(1'h0)] wire30;
  reg signed [(3'h6):(1'h0)] reg96 = (1'h0);
  reg [(5'h10):(1'h0)] reg95 = (1'h0);
  reg signed [(4'he):(1'h0)] reg94 = (1'h0);
  reg [(2'h3):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg92 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg91 = (1'h0);
  reg [(5'h15):(1'h0)] reg90 = (1'h0);
  reg [(4'h8):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg88 = (1'h0);
  reg [(4'h9):(1'h0)] reg87 = (1'h0);
  reg [(3'h4):(1'h0)] reg86 = (1'h0);
  reg [(4'h8):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg83 = (1'h0);
  reg [(5'h11):(1'h0)] reg79 = (1'h0);
  reg [(5'h11):(1'h0)] reg78 = (1'h0);
  reg [(4'ha):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg74 = (1'h0);
  reg [(3'h7):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg72 = (1'h0);
  reg [(2'h3):(1'h0)] reg71 = (1'h0);
  reg [(5'h10):(1'h0)] reg70 = (1'h0);
  reg [(4'hd):(1'h0)] reg69 = (1'h0);
  reg [(3'h6):(1'h0)] reg68 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg67 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg66 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg64 = (1'h0);
  reg [(4'h9):(1'h0)] reg63 = (1'h0);
  reg [(5'h15):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg59 = (1'h0);
  reg [(4'h9):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg54 = (1'h0);
  reg [(5'h15):(1'h0)] reg53 = (1'h0);
  reg [(3'h5):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg51 = (1'h0);
  reg [(4'hf):(1'h0)] reg50 = (1'h0);
  reg [(4'h9):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg48 = (1'h0);
  reg [(2'h3):(1'h0)] reg47 = (1'h0);
  reg [(4'h8):(1'h0)] reg46 = (1'h0);
  reg [(4'ha):(1'h0)] reg45 = (1'h0);
  reg [(4'hd):(1'h0)] reg44 = (1'h0);
  reg [(4'he):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg41 = (1'h0);
  reg [(4'he):(1'h0)] reg40 = (1'h0);
  reg [(5'h10):(1'h0)] reg39 = (1'h0);
  reg [(4'hf):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg37 = (1'h0);
  assign y = {wire147,
                 wire146,
                 wire144,
                 wire82,
                 wire81,
                 wire80,
                 wire62,
                 wire61,
                 wire56,
                 wire55,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
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
                 reg60,
                 reg59,
                 reg58,
                 reg57,
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
                 (1'h0)};
  assign wire30 = wire27[(1'h1):(1'h0)];
  assign wire31 = (~^(wire25 <<< $unsigned(((&wire30) ? {wire28} : (8'ha6)))));
  assign wire32 = wire27;
  assign wire33 = ($unsigned($signed({(~|wire28)})) ?
                      $unsigned(((~^(wire28 <= wire25)) + $signed(wire29))) : (|((^(wire29 ?
                          wire27 : wire26)) > (^~$unsigned(wire25)))));
  assign wire34 = $unsigned($unsigned(wire26));
  assign wire35 = (wire33 * ((8'ha1) && $unsigned(wire30[(1'h1):(1'h0)])));
  assign wire36 = $unsigned($signed($unsigned(((wire26 && wire26) ~^ (^~wire29)))));
  always
    @(posedge clk) begin
      if ((~$signed((wire32[(1'h0):(1'h0)] ?
          wire30 : (wire36[(3'h7):(2'h3)] ?
              (~&wire34) : (wire25 ? wire35 : wire28))))))
        begin
          reg37 <= wire35;
          reg38 <= (&(+(((wire25 ? wire28 : wire26) + $unsigned(wire28)) ?
              wire32 : wire36[(3'h5):(1'h1)])));
          reg39 <= ({reg37, $signed(wire27)} ?
              $signed(wire35[(3'h4):(2'h2)]) : $signed(wire31));
          reg40 <= $unsigned({wire31});
          reg41 <= (-$unsigned(($signed((~reg38)) ?
              (~(~^wire26)) : ($unsigned((8'ha8)) - (reg37 + reg40)))));
        end
      else
        begin
          reg37 <= wire36[(3'h4):(1'h0)];
          reg38 <= (^reg41);
        end
      reg42 <= wire33[(1'h0):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg43 <= (wire35 ?
          wire28[(1'h1):(1'h0)] : $signed((~(&$unsigned(reg40)))));
      if ($signed($signed($signed(reg37[(4'ha):(2'h3)]))))
        begin
          reg44 <= $signed($signed($signed(((8'haa) | (~&wire33)))));
          if (reg37)
            begin
              reg45 <= (~wire33);
              reg46 <= $signed($unsigned(wire33[(2'h3):(2'h3)]));
              reg47 <= {(($signed($signed(wire27)) ?
                      (^~(reg43 + wire36)) : (!reg41)) && $unsigned($unsigned($signed(reg41))))};
              reg48 <= {($unsigned(wire30) ?
                      $signed($signed(wire27)) : {reg41}),
                  $signed($signed($unsigned(reg38)))};
            end
          else
            begin
              reg45 <= (((wire34[(3'h4):(3'h4)] ?
                      wire30[(3'h7):(2'h3)] : ($signed(reg44) < (!wire36))) ?
                  reg37[(4'h9):(4'h8)] : $signed($signed((wire31 ^ reg46)))) - ((($signed((8'hb6)) ?
                      (wire31 < reg48) : (wire34 != wire26)) ?
                  $unsigned((reg44 << wire35)) : $signed(wire27[(1'h1):(1'h1)])) & $signed(reg46)));
            end
          reg49 <= wire26;
          if (reg40)
            begin
              reg50 <= ($unsigned(wire26) > ((wire29[(4'hc):(1'h1)] ?
                      ((-reg45) ?
                          reg41[(4'hd):(4'hd)] : reg49[(4'h8):(2'h2)]) : ((!(8'ha7)) ?
                          wire26 : (-(8'ha1)))) ?
                  reg41 : ($signed((^reg45)) != reg37)));
              reg51 <= $signed($signed({((-wire34) ?
                      reg38[(4'hc):(1'h0)] : {reg45, wire28})}));
            end
          else
            begin
              reg50 <= reg44;
              reg51 <= ({(reg43 ?
                          $unsigned($unsigned(wire26)) : $unsigned((wire25 ?
                              reg48 : reg45)))} ?
                  ({$unsigned($unsigned(reg51))} ?
                      (^~reg47[(1'h0):(1'h0)]) : ((+(|(8'hb5))) < wire35)) : wire31[(2'h3):(2'h2)]);
              reg52 <= $signed({{(~|{wire29, (8'hbc)})}, $signed(reg49)});
            end
          reg53 <= wire34[(3'h6):(1'h0)];
        end
      else
        begin
          reg44 <= reg39;
        end
      reg54 <= (!$unsigned({(&(^~(7'h43))),
          ((wire35 ? wire32 : wire32) ? (8'had) : $unsigned(reg41))}));
    end
  assign wire55 = reg48;
  assign wire56 = wire28;
  always
    @(posedge clk) begin
      reg57 <= (~&{((~reg48[(4'h8):(3'h5)]) ?
              $signed(reg46) : reg44[(2'h3):(1'h0)])});
      reg58 <= $unsigned((^~((+(|wire33)) ?
          wire55[(2'h3):(1'h1)] : $signed(wire31))));
      reg59 <= ($unsigned(($signed(reg47) == {((8'hb3) ? reg46 : reg54),
          wire29})) | reg43[(4'h9):(3'h4)]);
      reg60 <= ($unsigned(({{(8'hb0)}} ?
          $signed((~&reg51)) : ((wire56 ? reg47 : wire32) <= (wire26 ?
              reg53 : (8'hb9))))) - $unsigned(((!$unsigned(reg54)) ~^ reg59)));
    end
  assign wire61 = (&reg45[(1'h1):(1'h0)]);
  assign wire62 = reg51[(4'he):(3'h7)];
  always
    @(posedge clk) begin
      reg63 <= $unsigned(reg37[(5'h10):(4'hd)]);
      if (({$unsigned(reg59)} * (!((~(reg41 & (8'hb7))) ?
          reg38 : (~|{wire27, reg48})))))
        begin
          reg64 <= (&$signed(((wire32[(1'h0):(1'h0)] != $unsigned(reg44)) <<< ((~|wire30) ?
              $unsigned(wire55) : reg48[(3'h4):(2'h3)]))));
          reg65 <= $unsigned(reg43);
          reg66 <= wire62[(4'ha):(4'h9)];
        end
      else
        begin
          reg64 <= {(reg41[(5'h13):(4'hb)] ?
                  wire35[(1'h1):(1'h1)] : $unsigned($signed(wire32[(4'he):(3'h7)])))};
          reg65 <= wire62[(4'h8):(3'h4)];
          reg66 <= (-$signed($signed($unsigned(((8'hb8) && reg44)))));
          reg67 <= (reg58[(1'h0):(1'h0)] ~^ $unsigned((~$unsigned((~reg57)))));
        end
      reg68 <= ($unsigned((wire27 ?
          {(~|wire26)} : (~|reg67[(1'h0):(1'h0)]))) ^~ wire29[(1'h0):(1'h0)]);
      reg69 <= $signed($signed((((^reg42) == (-reg66)) ^~ (~^$signed(wire27)))));
      if (reg51)
        begin
          reg70 <= ($unsigned(wire33) ?
              $unsigned(reg52[(3'h5):(1'h0)]) : (^$signed({reg54,
                  $unsigned(wire33)})));
          if (reg51[(3'h7):(3'h7)])
            begin
              reg71 <= $signed(($unsigned($unsigned($signed(reg41))) ?
                  reg54[(2'h3):(1'h1)] : $signed($unsigned($signed(reg50)))));
              reg72 <= reg40[(1'h1):(1'h1)];
              reg73 <= wire56[(1'h1):(1'h0)];
              reg74 <= ($unsigned(reg65[(3'h5):(3'h5)]) ?
                  (~((^~wire55) ^~ wire62[(1'h0):(1'h0)])) : {{$signed(wire61[(3'h4):(1'h0)])},
                      $unsigned($unsigned($unsigned((7'h42))))});
            end
          else
            begin
              reg71 <= reg66[(3'h5):(3'h5)];
              reg72 <= ((^~(|$unsigned((~wire56)))) <<< $signed((^~($signed((8'ha4)) > {reg59}))));
              reg73 <= reg49;
              reg74 <= {((+{(wire56 ? (8'ha1) : reg66), (reg44 * wire30)}) ?
                      wire28[(3'h5):(1'h0)] : ({reg40} ?
                          $unsigned(wire25) : (reg37 >= reg68[(3'h4):(2'h2)]))),
                  $unsigned((~|reg66[(2'h2):(2'h2)]))};
            end
          reg75 <= ($signed(reg47[(2'h2):(2'h2)]) ?
              wire34 : (-(+(((8'ha3) >>> (8'had)) ?
                  {reg67} : (reg39 < reg69)))));
        end
      else
        begin
          if ((~$unsigned((!($signed(reg49) > wire28)))))
            begin
              reg70 <= $unsigned($signed($unsigned($unsigned((~reg71)))));
              reg71 <= $unsigned(reg68[(3'h5):(1'h1)]);
              reg72 <= ((-((|$unsigned(reg71)) << {(reg38 > reg44),
                  ((8'hbb) << reg72)})) >>> {(reg72[(3'h6):(3'h5)] >>> (+(!reg52))),
                  (^~(|{wire35, (8'hb6)}))});
            end
          else
            begin
              reg70 <= (!$unsigned($signed(wire25[(3'h7):(1'h1)])));
              reg71 <= reg47;
              reg72 <= reg38[(4'hf):(4'he)];
            end
          if ($unsigned(wire26[(5'h11):(4'h9)]))
            begin
              reg73 <= reg52;
            end
          else
            begin
              reg73 <= $signed((reg52[(3'h5):(3'h4)] & wire35[(1'h1):(1'h1)]));
              reg74 <= $signed(reg48);
              reg75 <= wire56[(1'h0):(1'h0)];
            end
          reg76 <= $signed($signed($signed($signed($unsigned(wire27)))));
          reg77 <= {reg40, (reg66 <= reg72)};
          reg78 <= reg74[(5'h12):(5'h11)];
        end
    end
  always
    @(posedge clk) begin
      reg79 <= (8'hb0);
    end
  assign wire80 = reg76[(3'h7):(3'h5)];
  assign wire81 = ($unsigned(((8'hb9) <<< wire32[(4'h9):(4'h8)])) ?
                      (wire32[(3'h6):(1'h1)] | reg44[(4'hc):(4'ha)]) : (~((~|(reg49 ?
                          (8'ha9) : reg75)) << wire25[(4'ha):(4'ha)])));
  assign wire82 = reg63;
  always
    @(posedge clk) begin
      reg83 <= ($unsigned($unsigned(($unsigned(wire32) ?
              ((7'h43) & reg48) : $signed(reg46)))) ?
          reg48 : reg65);
      if ({wire62})
        begin
          if ($signed(((reg66[(4'h8):(3'h7)] | (!(~^wire29))) - wire31[(2'h2):(2'h2)])))
            begin
              reg84 <= $unsigned({reg43[(3'h6):(1'h0)]});
              reg85 <= (reg48 ? wire81[(3'h5):(3'h5)] : (~|wire25));
              reg86 <= (7'h40);
              reg87 <= {$signed((!((^~reg40) ?
                      $unsigned((8'ha1)) : reg48[(2'h2):(1'h1)]))),
                  ({$unsigned($unsigned((8'hb4))),
                          ($signed(reg77) ?
                              $signed(wire26) : (wire26 ? (8'hb2) : reg59))} ?
                      $unsigned(((reg40 ?
                          reg40 : reg50) >= reg64[(4'h9):(4'h9)])) : $unsigned(((reg54 ?
                          reg54 : reg42) == (reg37 ? reg75 : reg76))))};
              reg88 <= $signed(reg42);
            end
          else
            begin
              reg84 <= (&$unsigned((((~|reg77) ^ (reg54 ~^ reg83)) ?
                  (^reg83[(1'h1):(1'h0)]) : $unsigned((reg42 * reg84)))));
            end
          if (reg51)
            begin
              reg89 <= wire25[(1'h1):(1'h0)];
            end
          else
            begin
              reg89 <= ((&(reg79 | ((reg38 | reg71) ?
                      reg78 : (wire81 <= reg86)))) ?
                  (~|reg37[(4'h8):(3'h5)]) : (~|reg59[(3'h4):(3'h4)]));
              reg90 <= reg64[(1'h0):(1'h0)];
              reg91 <= $unsigned(wire31[(3'h4):(2'h2)]);
              reg92 <= $unsigned((-{reg72[(2'h3):(2'h2)]}));
            end
          reg93 <= $unsigned((reg43[(4'ha):(3'h6)] ?
              $signed((^wire81)) : (8'hbc)));
        end
      else
        begin
          if (reg48[(3'h4):(1'h0)])
            begin
              reg84 <= reg93[(2'h3):(1'h1)];
              reg85 <= (!reg75[(3'h5):(3'h5)]);
            end
          else
            begin
              reg84 <= wire33;
            end
          reg86 <= ($signed(($signed({(7'h41), (8'ha1)}) ?
                  (^((8'haa) ? reg59 : reg71)) : (|reg46))) ?
              {{{$unsigned((8'ha1)), $signed(reg92)},
                      ($signed(wire36) ? $unsigned(reg83) : $signed(reg38))},
                  $unsigned({(reg47 ? wire26 : reg70),
                      wire61})} : $unsigned((wire33 ?
                  (reg57 & (reg87 == (8'ha4))) : $unsigned({(8'h9d),
                      wire30}))));
          reg87 <= (~|{$unsigned($unsigned((reg60 != wire32))),
              (~|((wire62 ~^ reg65) ? (&reg44) : (reg78 ? reg72 : reg74)))});
          reg88 <= (((^~reg64[(3'h6):(1'h0)]) ?
                  (-(~&(reg75 ^~ wire55))) : (^reg45[(3'h6):(1'h1)])) ?
              (^~(($signed(reg85) ?
                  $signed(reg84) : $unsigned(wire25)) ^~ (reg59 ?
                  $signed(reg37) : (wire25 ? reg63 : wire34)))) : wire55);
          reg89 <= wire33[(3'h5):(1'h1)];
        end
      reg94 <= wire35;
      reg95 <= $unsigned(($unsigned($unsigned($signed(wire30))) & $unsigned($signed($unsigned(wire82)))));
      reg96 <= reg37;
    end
  module97 #() modinst145 (wire144, clk, reg48, reg94, reg93, reg43);
  assign wire146 = (|($signed($unsigned((reg64 ?
                       reg46 : wire56))) ^~ $signed(((|wire35) ?
                       reg40 : $signed(reg89)))));
  assign wire147 = ((^~$signed(((reg78 ? reg69 : reg92) ?
                           (~reg44) : (reg88 || reg69)))) ?
                       ((-(wire81 << $unsigned(reg66))) ?
                           (((reg78 ? wire26 : wire33) ?
                               $unsigned(reg58) : (wire61 << reg41)) ^ ((~|reg70) > (reg96 ^ reg45))) : reg78[(3'h5):(3'h4)]) : reg60);
endmodule

module module8
#(parameter param20 = ((^(((~&(8'ha9)) ? (~|(8'ha5)) : (&(7'h42))) ~^ (!((8'ha7) ? (8'h9f) : (8'hb0))))) ? (^(((8'hb0) ? ((7'h42) ^~ (8'hb4)) : ((8'hbf) ? (7'h40) : (8'hbe))) ? ((&(7'h40)) ? (8'hb3) : (^~(8'hb2))) : ({(8'hb1)} ? ((7'h44) < (8'ha4)) : ((8'hb9) + (8'hb7))))) : (((-((8'had) ^~ (8'hb4))) ? (8'hbb) : (((8'h9f) ? (8'hbe) : (8'ha8)) ? ((8'ha3) ? (7'h40) : (8'hbb)) : {(8'ha0)})) | (!(~((8'ha8) < (8'had)))))))
(y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'h44):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire13;
  input wire [(4'ha):(1'h0)] wire12;
  input wire signed [(5'h15):(1'h0)] wire11;
  input wire [(3'h5):(1'h0)] wire10;
  input wire [(4'he):(1'h0)] wire9;
  wire [(4'ha):(1'h0)] wire19;
  wire signed [(5'h11):(1'h0)] wire18;
  wire signed [(4'hc):(1'h0)] wire17;
  wire signed [(3'h5):(1'h0)] wire16;
  wire signed [(5'h15):(1'h0)] wire15;
  wire [(2'h2):(1'h0)] wire14;
  assign y = {wire19, wire18, wire17, wire16, wire15, wire14, (1'h0)};
  assign wire14 = wire11;
  assign wire15 = wire9[(3'h5):(3'h5)];
  assign wire16 = (8'haa);
  assign wire17 = (wire13 ~^ (~&(8'hbf)));
  assign wire18 = $unsigned(wire16[(1'h0):(1'h0)]);
  assign wire19 = (|{wire13});
endmodule

module module97
#(parameter param143 = ((&(8'hb2)) ? ((!({(8'hb6), (7'h40)} ? (7'h43) : ((8'hb6) << (8'hbc)))) + (^(^~((7'h43) != (8'ha1))))) : (~&({(+(8'ha0))} << {(~|(8'hbc))}))))
(y, clk, wire101, wire100, wire99, wire98);
  output wire [(32'h1f9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire101;
  input wire [(4'he):(1'h0)] wire100;
  input wire signed [(2'h3):(1'h0)] wire99;
  input wire [(4'h9):(1'h0)] wire98;
  wire signed [(5'h12):(1'h0)] wire142;
  wire signed [(5'h12):(1'h0)] wire141;
  wire [(3'h6):(1'h0)] wire140;
  wire [(5'h10):(1'h0)] wire139;
  wire signed [(2'h3):(1'h0)] wire138;
  wire [(2'h2):(1'h0)] wire127;
  wire [(3'h5):(1'h0)] wire126;
  wire [(4'hc):(1'h0)] wire125;
  wire signed [(5'h11):(1'h0)] wire109;
  wire [(4'hb):(1'h0)] wire108;
  wire signed [(2'h2):(1'h0)] wire107;
  wire signed [(4'hb):(1'h0)] wire106;
  wire signed [(5'h15):(1'h0)] wire105;
  wire [(4'hd):(1'h0)] wire104;
  wire [(2'h2):(1'h0)] wire103;
  wire [(4'h9):(1'h0)] wire102;
  reg signed [(3'h7):(1'h0)] reg137 = (1'h0);
  reg [(3'h5):(1'h0)] reg136 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg135 = (1'h0);
  reg [(2'h3):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg133 = (1'h0);
  reg [(5'h15):(1'h0)] reg132 = (1'h0);
  reg [(5'h10):(1'h0)] reg131 = (1'h0);
  reg [(3'h5):(1'h0)] reg130 = (1'h0);
  reg [(4'hb):(1'h0)] reg129 = (1'h0);
  reg signed [(4'he):(1'h0)] reg128 = (1'h0);
  reg [(4'he):(1'h0)] reg124 = (1'h0);
  reg signed [(4'he):(1'h0)] reg123 = (1'h0);
  reg [(5'h12):(1'h0)] reg122 = (1'h0);
  reg [(2'h3):(1'h0)] reg121 = (1'h0);
  reg [(5'h12):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg119 = (1'h0);
  reg [(5'h11):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg117 = (1'h0);
  reg [(4'h8):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg114 = (1'h0);
  reg [(5'h13):(1'h0)] reg113 = (1'h0);
  reg signed [(4'he):(1'h0)] reg112 = (1'h0);
  reg [(5'h15):(1'h0)] reg111 = (1'h0);
  reg [(5'h15):(1'h0)] reg110 = (1'h0);
  assign y = {wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire127,
                 wire126,
                 wire125,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
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
                 (1'h0)};
  assign wire102 = wire101[(3'h7):(1'h0)];
  assign wire103 = (~&((((!wire101) ^~ $signed(wire99)) ? wire98 : wire99) ?
                       ((|(wire102 == wire101)) ?
                           $unsigned(((8'ha5) ?
                               wire101 : wire99)) : $signed(wire100)) : {($unsigned(wire100) + (~wire98)),
                           wire98[(1'h1):(1'h1)]}));
  assign wire104 = wire98[(2'h3):(2'h2)];
  assign wire105 = {wire101[(3'h6):(1'h0)]};
  assign wire106 = $unsigned((~&(wire102 ?
                       (^~(wire101 | (8'hbf))) : $signed((wire102 ?
                           wire100 : wire100)))));
  assign wire107 = wire101;
  assign wire108 = wire104;
  assign wire109 = {wire105};
  always
    @(posedge clk) begin
      if ((^wire107))
        begin
          if ((wire100 ? wire98[(4'h9):(1'h0)] : wire103))
            begin
              reg110 <= $unsigned((wire105[(4'h9):(3'h5)] << (~^wire99[(1'h1):(1'h1)])));
            end
          else
            begin
              reg110 <= $unsigned(wire108[(4'ha):(3'h7)]);
              reg111 <= $signed({((~&reg110) << $unsigned(wire100[(1'h1):(1'h0)]))});
              reg112 <= (wire101 ? wire99 : wire103[(2'h2):(1'h1)]);
              reg113 <= $signed($unsigned(wire106[(3'h5):(1'h0)]));
              reg114 <= {$signed((wire100 ^~ (^~(&wire98))))};
            end
          if ({wire101[(5'h15):(5'h14)],
              ($signed((^~((8'had) ? (8'hb7) : (8'ha1)))) ?
                  ($signed((!reg111)) ?
                      $signed({reg112}) : reg111) : $signed($signed((8'hbd))))})
            begin
              reg115 <= wire102;
            end
          else
            begin
              reg115 <= $signed((reg115[(4'hb):(4'ha)] ?
                  (~&reg114[(2'h2):(2'h2)]) : (wire98[(1'h1):(1'h0)] - reg114[(3'h4):(1'h1)])));
              reg116 <= ($unsigned((|((reg112 >> wire98) ?
                      $unsigned(wire105) : wire99[(1'h1):(1'h1)]))) ?
                  ((wire105[(5'h13):(3'h5)] ?
                          ({wire108} ?
                              $unsigned(wire104) : {(8'hae),
                                  wire105}) : $unsigned($unsigned(wire101))) ?
                      ({(wire103 * reg114), reg110[(3'h4):(2'h3)]} ?
                          $signed($signed((8'hbe))) : wire109[(4'h9):(3'h6)]) : ($signed(((8'ha4) && wire109)) ?
                          $signed((!reg113)) : $signed($unsigned((8'hb4))))) : $unsigned(($signed((~^reg113)) ?
                      $signed((&wire99)) : (wire105[(3'h4):(3'h4)] > $unsigned(reg110)))));
              reg117 <= $unsigned((8'hb2));
              reg118 <= $unsigned($unsigned($unsigned((|(8'ha0)))));
              reg119 <= $signed($unsigned(wire100));
            end
          reg120 <= (((wire109 ?
                  reg115[(4'h8):(2'h3)] : reg113[(4'hf):(4'hb)]) * $unsigned(reg118)) ?
              reg116[(3'h5):(1'h1)] : $signed({$unsigned(wire101[(4'hf):(2'h2)]),
                  wire107[(1'h0):(1'h0)]}));
        end
      else
        begin
          reg110 <= ((($unsigned((~wire105)) != $signed({(7'h43)})) >>> ($signed($signed(wire101)) & $signed($unsigned(wire106)))) ?
              (~|(8'had)) : wire103[(1'h1):(1'h1)]);
          reg111 <= $signed($signed({(reg118 * (reg112 - (8'hbc)))}));
          reg112 <= (reg114[(1'h0):(1'h0)] & ((reg112 ?
                  $signed((wire105 ?
                      (8'hb6) : reg113)) : reg113[(5'h10):(4'hb)]) ?
              $signed($unsigned(wire105[(2'h3):(1'h0)])) : ($signed($signed(reg116)) ^ reg120[(5'h12):(1'h0)])));
          reg113 <= $signed((reg115[(4'h9):(3'h5)] >= (reg116[(4'h8):(1'h0)] ?
              $signed($signed(reg110)) : ((-wire101) >>> wire101))));
          reg114 <= ($unsigned((8'hbf)) ?
              (|((~|(^~reg120)) ?
                  $signed($signed(wire102)) : $signed((wire103 ?
                      wire99 : wire100)))) : reg120[(3'h5):(2'h2)]);
        end
      reg121 <= (((wire102[(3'h5):(1'h1)] ?
              reg120 : wire109[(4'hd):(1'h0)]) < wire102[(1'h0):(1'h0)]) ?
          wire103[(1'h1):(1'h0)] : ((8'haa) ?
              $unsigned($unsigned(reg114[(3'h4):(2'h3)])) : {((^~(8'hb8)) ?
                      {reg111} : $unsigned(reg114)),
                  ((reg114 * wire105) ?
                      (wire104 ? reg119 : wire108) : (|reg118))}));
      reg122 <= $signed(reg112[(1'h1):(1'h0)]);
      reg123 <= ($signed(($signed({wire109, wire106}) && $unsigned(reg113))) ?
          $signed(reg116[(2'h2):(2'h2)]) : ({(&$unsigned(wire101)),
                  $signed({wire109})} ?
              ((^((8'h9d) ? (8'hb3) : wire102)) ?
                  $unsigned((wire101 ?
                      wire102 : wire108)) : $signed(reg111)) : $unsigned($unsigned($signed(reg111)))));
      reg124 <= {$unsigned((&((reg113 ? (8'haf) : reg112) ?
              (8'hbe) : wire105)))};
    end
  assign wire125 = (~^$signed($unsigned(wire98)));
  assign wire126 = reg115[(5'h10):(4'h8)];
  assign wire127 = {(+wire109[(4'h9):(2'h3)]),
                       $unsigned({$unsigned($signed(wire107))})};
  always
    @(posedge clk) begin
      if (((^~$signed($signed($unsigned(wire102)))) ?
          (wire108 ?
              $unsigned(wire109) : reg110[(4'hf):(3'h7)]) : $signed(((wire99[(1'h1):(1'h0)] ?
              $signed(wire100) : (reg113 ? wire106 : reg120)) != reg116))))
        begin
          reg128 <= {(^wire100)};
          reg129 <= wire99[(2'h3):(2'h3)];
        end
      else
        begin
          reg128 <= {reg116[(3'h5):(1'h1)]};
          if ((($unsigned({{reg121, reg123}}) < reg128[(3'h5):(2'h2)]) ?
              (~|(reg121 ^~ reg123[(4'hd):(1'h0)])) : reg113))
            begin
              reg129 <= {(((wire105[(4'ha):(3'h6)] ^ {wire104}) ?
                          {$unsigned(wire104)} : reg124) ?
                      (+(reg112[(1'h1):(1'h1)] == ((7'h42) ?
                          reg122 : reg121))) : (8'hbf)),
                  reg115};
              reg130 <= (~|$unsigned($unsigned($unsigned((+reg113)))));
              reg131 <= reg117;
              reg132 <= reg118;
            end
          else
            begin
              reg129 <= {($unsigned((8'hbc)) ?
                      (-$unsigned(reg123[(4'h9):(3'h7)])) : (~|(reg123[(2'h3):(1'h0)] ^ reg115[(2'h2):(1'h0)])))};
              reg130 <= reg128;
              reg131 <= reg114[(2'h3):(2'h3)];
            end
          reg133 <= ($unsigned({(|reg115),
                  ((~^reg114) ? (reg123 ? reg128 : wire127) : (&wire107))}) ?
              wire101 : ($signed((reg116[(1'h1):(1'h0)] != {reg131, reg120})) ?
                  (|reg112) : ($unsigned(((8'ha3) > wire127)) ?
                      reg113 : ((&reg118) == reg128[(4'hb):(4'ha)]))));
        end
      reg134 <= $signed(wire104);
      reg135 <= (~$unsigned($unsigned(((wire98 | reg120) ?
          $unsigned(reg116) : (^~reg118)))));
      if ($unsigned((8'hbe)))
        begin
          reg136 <= reg116[(3'h6):(2'h3)];
          reg137 <= ((|(~(reg133[(3'h4):(3'h4)] ?
                  (reg134 < wire101) : (&wire106)))) ?
              (|{reg113, reg128}) : wire108);
        end
      else
        begin
          reg136 <= $unsigned($unsigned(($unsigned((8'hbb)) ?
              {((8'hb3) ? wire127 : wire109)} : wire104[(4'h8):(2'h2)])));
        end
    end
  assign wire138 = reg128[(4'he):(1'h1)];
  assign wire139 = (&(wire109[(4'h8):(2'h3)] ?
                       $unsigned((reg135[(3'h4):(2'h3)] < $signed(reg121))) : ($signed($signed(reg135)) >> reg120)));
  assign wire140 = (~&reg123[(3'h7):(2'h3)]);
  assign wire141 = (8'hb0);
  assign wire142 = $signed(reg120);
endmodule
