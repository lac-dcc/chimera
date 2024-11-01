module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hf5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire0;
  input wire [(4'h8):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire4;
  wire signed [(3'h6):(1'h0)] wire13;
  wire signed [(5'h13):(1'h0)] wire14;
  wire signed [(5'h13):(1'h0)] wire15;
  wire signed [(4'hf):(1'h0)] wire16;
  wire signed [(5'h14):(1'h0)] wire17;
  wire signed [(4'ha):(1'h0)] wire18;
  wire signed [(5'h13):(1'h0)] wire19;
  wire [(5'h12):(1'h0)] wire102;
  reg [(2'h2):(1'h0)] reg12 = (1'h0);
  reg [(3'h5):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(5'h14):(1'h0)] reg9 = (1'h0);
  reg [(5'h11):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg7 = (1'h0);
  reg [(5'h13):(1'h0)] reg6 = (1'h0);
  reg [(5'h12):(1'h0)] reg5 = (1'h0);
  assign y = {wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire102,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (($unsigned(((^wire0[(2'h3):(1'h1)]) < (wire2[(4'hb):(4'hb)] ?
              wire1 : $unsigned(wire3)))) ?
          $signed(wire0) : {{$signed(wire3[(4'ha):(3'h7)])},
              (^$unsigned(wire1))}))
        begin
          reg5 <= $unsigned(({($signed(wire3) ?
                      wire2[(1'h0):(1'h0)] : $unsigned((8'hbb))),
                  wire2[(4'h8):(2'h2)]} ?
              $unsigned(wire1) : $unsigned($signed(wire2[(4'ha):(3'h7)]))));
          reg6 <= $signed(($unsigned(wire3[(3'h4):(1'h0)]) << wire4));
          reg7 <= (~|(^((~(wire0 != reg5)) <<< (7'h43))));
          reg8 <= $signed((~&$unsigned(reg5[(3'h6):(3'h5)])));
        end
      else
        begin
          reg5 <= wire0[(3'h6):(3'h6)];
          if (wire2[(5'h11):(4'hc)])
            begin
              reg6 <= $signed((^~(wire0 ?
                  ($unsigned(reg7) >= (reg5 != (7'h41))) : $unsigned($signed((8'ha1))))));
              reg7 <= $signed(wire4);
            end
          else
            begin
              reg6 <= (&((^~$unsigned($unsigned(reg8))) ?
                  wire3 : {$unsigned(wire3[(1'h0):(1'h0)])}));
              reg7 <= $signed((!{(reg5 == wire2), (~|wire1)}));
              reg8 <= $signed(wire1[(2'h3):(1'h1)]);
              reg9 <= (~^({$signed(wire1)} ?
                  (^~wire3[(3'h6):(2'h2)]) : $signed($unsigned((reg7 < reg5)))));
            end
          reg10 <= $unsigned(wire3[(4'h9):(4'h9)]);
          reg11 <= wire0;
        end
      reg12 <= (~^wire2[(1'h1):(1'h0)]);
    end
  assign wire13 = wire2;
  assign wire14 = (-$signed(reg8));
  assign wire15 = (!(({{wire2}, (reg6 ? reg7 : wire3)} ?
                          reg6[(4'hc):(3'h5)] : reg11[(1'h0):(1'h0)]) ?
                      (!wire14) : (($signed(reg11) ?
                              (wire4 ? reg5 : (8'hac)) : (8'ha2)) ?
                          (|(&reg11)) : ($signed(wire0) >= reg10[(3'h5):(3'h5)]))));
  assign wire16 = reg10[(3'h6):(2'h3)];
  assign wire17 = ({(~&$unsigned((-wire0)))} >>> wire15);
  assign wire18 = wire0[(4'hb):(3'h7)];
  assign wire19 = $unsigned($signed(reg7[(4'he):(3'h6)]));
  module20 #() modinst103 (.y(wire102), .wire23(wire13), .wire22(reg9), .wire24(reg10), .clk(clk), .wire21(wire15), .wire25(wire19));
endmodule

module module20
#(parameter param100 = (+(~^((8'hbf) != (!(~^(8'ha9)))))), 
parameter param101 = param100)
(y, clk, wire21, wire22, wire23, wire24, wire25);
  output wire [(32'h21b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire21;
  input wire signed [(5'h14):(1'h0)] wire22;
  input wire signed [(3'h6):(1'h0)] wire23;
  input wire [(5'h13):(1'h0)] wire24;
  input wire signed [(4'hc):(1'h0)] wire25;
  wire signed [(2'h3):(1'h0)] wire99;
  wire signed [(4'h8):(1'h0)] wire98;
  wire [(4'ha):(1'h0)] wire69;
  wire [(4'ha):(1'h0)] wire68;
  wire signed [(5'h12):(1'h0)] wire67;
  wire [(4'h8):(1'h0)] wire66;
  wire [(2'h2):(1'h0)] wire65;
  wire [(5'h10):(1'h0)] wire27;
  wire [(5'h15):(1'h0)] wire28;
  wire [(4'he):(1'h0)] wire29;
  wire signed [(5'h15):(1'h0)] wire30;
  wire signed [(3'h6):(1'h0)] wire31;
  wire signed [(5'h11):(1'h0)] wire32;
  wire [(4'hd):(1'h0)] wire33;
  wire [(4'h9):(1'h0)] wire63;
  reg signed [(3'h6):(1'h0)] reg97 = (1'h0);
  reg [(4'hb):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg95 = (1'h0);
  reg [(4'he):(1'h0)] reg94 = (1'h0);
  reg [(3'h5):(1'h0)] reg93 = (1'h0);
  reg [(4'ha):(1'h0)] reg92 = (1'h0);
  reg [(4'h8):(1'h0)] reg91 = (1'h0);
  reg [(4'hb):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg88 = (1'h0);
  reg [(5'h14):(1'h0)] reg87 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg86 = (1'h0);
  reg [(3'h7):(1'h0)] reg85 = (1'h0);
  reg [(5'h11):(1'h0)] reg84 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg82 = (1'h0);
  reg [(5'h10):(1'h0)] reg81 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg80 = (1'h0);
  reg [(5'h13):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg78 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg77 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg72 = (1'h0);
  reg [(4'hb):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg70 = (1'h0);
  reg signed [(4'he):(1'h0)] reg26 = (1'h0);
  assign y = {wire99,
                 wire98,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire27,
                 wire28,
                 wire29,
                 wire30,
                 wire31,
                 wire32,
                 wire33,
                 wire63,
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
                 reg26,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg26 <= wire22[(5'h13):(5'h12)];
    end
  assign wire27 = (^$signed((^(wire21 ? {wire21} : (^~wire25)))));
  assign wire28 = (~&wire27[(1'h0):(1'h0)]);
  assign wire29 = (wire28 ?
                      {$unsigned(wire24[(4'hf):(3'h5)]),
                          (reg26 ?
                              ($signed(wire22) ?
                                  $unsigned(wire27) : wire28[(4'hb):(2'h3)]) : (reg26 == (wire27 ?
                                  wire22 : wire22)))} : {{$signed((wire25 <= wire28)),
                              $unsigned(wire24[(4'hf):(3'h5)])},
                          (~&($unsigned(wire24) ?
                              wire23[(2'h2):(1'h1)] : wire27))});
  assign wire30 = $unsigned((((&(wire24 > wire28)) <= wire22[(3'h4):(2'h2)]) ?
                      wire28[(1'h1):(1'h1)] : wire24[(4'h9):(2'h2)]));
  assign wire31 = (((~&(wire28 ?
                      wire28[(5'h11):(3'h6)] : $signed(wire28))) < wire22) << $signed($signed($signed((wire24 <<< reg26)))));
  assign wire32 = $signed(reg26);
  assign wire33 = wire27;
  module34 #() modinst64 (wire63, clk, wire27, wire32, wire23, wire33, wire22);
  assign wire65 = (wire33 > $unsigned($signed(wire21[(2'h2):(2'h2)])));
  assign wire66 = wire21;
  assign wire67 = $signed((-wire65));
  assign wire68 = $signed(wire29[(1'h1):(1'h1)]);
  assign wire69 = (^(-$unsigned(wire24)));
  always
    @(posedge clk) begin
      if (($unsigned(wire30[(1'h1):(1'h0)]) << (|({$signed(wire23)} ?
          wire33 : (wire28 ? $signed(wire69) : wire22)))))
        begin
          reg70 <= $unsigned((($signed($unsigned(wire30)) ?
              ((wire27 ? reg26 : (8'hb0)) == (wire31 ~^ wire66)) : ((wire32 ?
                      wire32 : wire21) ?
                  wire24 : $unsigned((8'h9e)))) > (~wire65)));
          if ($unsigned(wire24))
            begin
              reg71 <= {wire32[(3'h5):(3'h4)],
                  $unsigned((wire33 << ((^~wire65) & $unsigned((8'h9d)))))};
              reg72 <= $signed(((wire25[(1'h1):(1'h0)] ?
                  {(~&reg71), (wire28 > wire67)} : (^~(^~wire66))) - wire21));
            end
          else
            begin
              reg71 <= (($unsigned(((~^wire68) ?
                      ((8'hb0) != wire25) : wire23)) ?
                  (&wire33[(3'h6):(3'h5)]) : ({wire63} < wire66[(2'h3):(2'h3)])) >= (wire28 ?
                  reg70[(1'h0):(1'h0)] : wire25[(4'h8):(2'h3)]));
            end
          reg73 <= wire27;
          if (($unsigned((wire33[(3'h6):(1'h0)] ?
              (!$signed(reg72)) : ((wire29 && wire67) & wire25[(1'h1):(1'h0)]))) >> {({$unsigned(wire24)} < ((wire22 & reg72) << (|wire67))),
              $unsigned((~|wire25))}))
            begin
              reg74 <= wire32[(4'hd):(3'h6)];
              reg75 <= (^~$signed(($unsigned(wire22[(5'h11):(3'h7)]) ?
                  ($unsigned(wire27) >= $unsigned(wire23)) : wire33)));
            end
          else
            begin
              reg74 <= $signed(reg26);
              reg75 <= reg74;
              reg76 <= wire28[(5'h12):(3'h4)];
              reg77 <= wire31;
            end
          reg78 <= ((($unsigned((wire32 > reg72)) <<< ((~wire68) <<< (wire67 << reg74))) ?
                  (((wire27 >= wire32) && reg73) ^~ ((~|wire65) ?
                      {reg74, wire63} : wire65)) : (8'h9d)) ?
              $unsigned($signed(wire23[(2'h3):(1'h0)])) : wire65[(1'h1):(1'h1)]);
        end
      else
        begin
          if ($unsigned(((|$signed($unsigned(wire25))) ?
              reg70 : $unsigned((!$signed(reg73))))))
            begin
              reg70 <= {((($signed((8'ha6)) << reg76[(1'h0):(1'h0)]) >= ((-(8'hae)) < (&reg75))) != (&wire28)),
                  $unsigned((~|$unsigned(reg26[(3'h6):(2'h2)])))};
              reg71 <= {$unsigned($unsigned({$signed(wire66),
                      wire32[(3'h6):(2'h2)]})),
                  $signed((~|wire67))};
              reg72 <= ({reg73, $signed((-reg74[(4'hc):(2'h3)]))} > (8'hb6));
              reg73 <= {{(((&wire32) ?
                          $signed(reg78) : (reg73 ?
                              (8'ha3) : (8'ha9))) <= (8'had)),
                      wire69[(3'h4):(1'h0)]}};
            end
          else
            begin
              reg70 <= reg78[(4'h9):(4'h9)];
              reg71 <= $unsigned(reg74[(1'h0):(1'h0)]);
            end
          reg74 <= $unsigned({((~^wire33) == reg73)});
          reg75 <= ((^~($signed((&reg78)) << (~&(wire21 <= wire27)))) <= (^(~(~(&wire25)))));
        end
      reg79 <= $unsigned($unsigned((($signed(wire33) ?
          $unsigned(reg77) : $signed(reg78)) << wire23[(3'h4):(2'h3)])));
      if (({$unsigned(((~&wire29) * wire22[(4'hb):(4'h9)]))} >> {((^~reg78[(4'h9):(1'h0)]) * (&wire69)),
          $unsigned(reg72)}))
        begin
          reg80 <= $signed(wire27[(3'h5):(2'h2)]);
          if (($signed((|reg79)) ?
              (~^$unsigned(($unsigned(wire65) ?
                  (+wire67) : $unsigned(wire69)))) : (((((8'hb3) ?
                              wire65 : wire21) ?
                          (wire22 >= wire21) : reg77[(2'h2):(1'h0)]) ?
                      reg71[(3'h5):(1'h1)] : wire21[(1'h1):(1'h1)]) ?
                  {((~|wire66) - (reg75 | (8'hbd)))} : $signed(reg75[(4'hb):(2'h3)]))))
            begin
              reg81 <= wire67[(5'h11):(3'h6)];
              reg82 <= (($unsigned($unsigned($unsigned(wire22))) ?
                      (((!reg78) ?
                          $unsigned((8'had)) : {(8'hb6),
                              reg81}) == ($unsigned(reg74) ?
                          {reg77,
                              (7'h41)} : $unsigned(wire66))) : ($unsigned(wire65) ~^ {$signed(reg70),
                          {(8'h9f)}})) ?
                  wire67[(1'h1):(1'h1)] : ($signed(wire67[(3'h7):(3'h6)]) > wire63));
              reg83 <= wire24[(5'h10):(5'h10)];
              reg84 <= {(7'h41)};
              reg85 <= $signed(({wire25, wire21[(1'h1):(1'h1)]} ?
                  (reg72[(3'h5):(2'h2)] ?
                      $unsigned(reg26) : reg83) : (~&(~&$unsigned(wire33)))));
            end
          else
            begin
              reg81 <= reg79;
              reg82 <= $signed(($signed(($unsigned(reg70) ?
                  reg73[(3'h6):(3'h5)] : wire22)) == wire23[(3'h6):(1'h1)]));
              reg83 <= ($unsigned($unsigned(((wire24 ?
                      wire22 : reg84) || $unsigned((8'hb1))))) ?
                  wire23 : reg83);
            end
        end
      else
        begin
          reg80 <= wire23;
          if (wire32[(5'h11):(4'h8)])
            begin
              reg81 <= (8'haf);
            end
          else
            begin
              reg81 <= wire25;
              reg82 <= ((wire69[(3'h6):(3'h6)] ?
                  wire27 : {reg80, $unsigned(wire67)}) ^ $signed(reg83));
              reg83 <= wire66;
            end
          reg84 <= (reg82[(2'h3):(1'h1)] * (reg74[(4'hd):(4'h9)] << reg75));
          reg85 <= ((wire24[(2'h3):(1'h1)] ?
              {((~reg77) ? {reg76, wire31} : wire22[(3'h6):(3'h5)]),
                  wire67[(3'h7):(3'h5)]} : reg79[(1'h1):(1'h1)]) > ((((wire23 * reg75) << (wire67 ?
                  wire25 : wire23)) == ({wire67} >> $unsigned(wire67))) ?
              (8'hb2) : $signed(($unsigned(wire65) && reg85[(1'h1):(1'h1)]))));
          reg86 <= $signed((|(|$unsigned(reg81[(2'h3):(2'h2)]))));
        end
      reg87 <= (|$signed(reg82[(3'h6):(2'h2)]));
      if (reg71[(2'h3):(2'h3)])
        begin
          if ($signed($signed(($unsigned($unsigned(reg85)) ?
              (~&wire21) : reg84[(4'hc):(3'h5)]))))
            begin
              reg88 <= (wire21 && (($signed($unsigned(reg87)) + reg81[(1'h0):(1'h0)]) | wire69[(2'h2):(2'h2)]));
              reg89 <= reg84[(4'h9):(3'h7)];
              reg90 <= $unsigned($unsigned((-$signed((reg75 ?
                  reg76 : wire63)))));
              reg91 <= (~|(~(($unsigned(wire29) >> (~^wire67)) << {{reg76,
                      (8'hb1)}})));
            end
          else
            begin
              reg88 <= wire30;
              reg89 <= {$unsigned($signed($signed(reg81[(3'h6):(2'h3)]))),
                  (~($unsigned((^~wire66)) ?
                      (8'hac) : ((wire21 >>> reg80) ? reg91 : (~&wire22))))};
              reg90 <= {wire65[(1'h1):(1'h0)],
                  {($signed((~reg88)) ^ ($signed((8'ha6)) >> (wire30 ?
                          reg71 : wire33))),
                      reg87}};
            end
          if (reg75)
            begin
              reg92 <= (wire24 ?
                  ($unsigned((((8'haa) ? wire66 : reg79) ?
                          (8'hb9) : (wire31 <= wire30))) ?
                      (reg82[(4'h9):(4'h8)] ?
                          (!$unsigned(wire22)) : reg73[(4'he):(3'h5)]) : (wire67 ~^ $unsigned((wire65 << (8'hbf))))) : (^(+reg75)));
              reg93 <= $unsigned(reg84);
              reg94 <= ($signed(reg91[(4'h8):(3'h4)]) ?
                  ($unsigned((~&(!(8'ha2)))) <= wire67) : (&(($signed(reg71) - ((8'h9e) >= (8'h9c))) ^~ wire69)));
              reg95 <= $signed((({wire24} > {(8'ha5),
                      (wire24 ? reg83 : reg90)}) ?
                  $unsigned($signed((wire67 ?
                      (8'haa) : reg70))) : ($unsigned($signed(reg94)) ?
                      (wire22 ?
                          (reg86 && wire24) : {reg73}) : $unsigned((!reg80)))));
              reg96 <= (((+(((8'hb3) - reg26) ?
                          reg84[(4'ha):(4'ha)] : $unsigned(wire24))) ?
                      $unsigned(reg92) : (^~($unsigned(wire63) != reg80[(2'h2):(1'h1)]))) ?
                  (({(^~reg93)} ?
                          $unsigned((reg88 ?
                              wire31 : reg83)) : ($signed(wire21) >>> $unsigned(reg91))) ?
                      $unsigned($signed(reg85)) : reg26[(3'h5):(2'h2)]) : ((~|(~reg81)) ?
                      ($signed((reg75 && reg73)) ?
                          reg26 : ((wire27 > wire22) ?
                              reg26 : $unsigned((8'ha7)))) : wire67));
            end
          else
            begin
              reg92 <= (($signed($unsigned(reg86)) != reg81) != reg87[(2'h3):(2'h2)]);
            end
          reg97 <= (~&reg85);
        end
      else
        begin
          reg88 <= (~^{{(&$unsigned(wire33))}, $unsigned(wire21)});
          reg89 <= $signed(reg73);
          reg90 <= (($unsigned({(wire24 == reg83)}) * ((~^((7'h44) ?
                  (8'haf) : reg73)) ?
              ($signed(wire33) ?
                  (reg93 ?
                      reg88 : reg76) : {reg71}) : (wire69 ^~ (reg97 & reg91)))) ^ (wire68[(1'h0):(1'h0)] ?
              reg84 : ({reg78[(4'h9):(1'h0)]} ^ (reg74[(5'h10):(3'h5)] < (reg80 ?
                  reg78 : reg83)))));
          reg91 <= (reg88[(3'h5):(3'h5)] < ({((8'hab) ?
                      $unsigned(reg72) : ((8'ha9) && reg80)),
                  ($unsigned(wire21) ? $signed(wire24) : $signed(wire31))} ?
              reg71[(2'h2):(1'h0)] : {wire65[(1'h0):(1'h0)]}));
          reg92 <= reg94[(1'h0):(1'h0)];
        end
    end
  assign wire98 = (^~(&$unsigned($unsigned((reg74 ? reg84 : wire22)))));
  assign wire99 = $unsigned(($unsigned(wire22[(1'h1):(1'h1)]) ?
                      {$signed(reg78),
                          ($unsigned(wire30) ?
                              wire30 : $unsigned((7'h41)))} : $unsigned($signed((wire25 != reg77)))));
endmodule

module module34
#(parameter param61 = ((({((8'hbb) != (8'ha0)), ((8'hbe) < (8'hb4))} * {(&(8'ha5))}) ? {(^~((7'h41) ? (8'hb7) : (8'h9d)))} : ((((8'hbd) ? (8'haf) : (8'hb4)) ^ ((8'hbf) ? (8'ha1) : (8'ha9))) ? (((7'h41) ? (8'hbe) : (8'ha3)) ? (^~(8'hb7)) : ((7'h43) ? (8'haf) : (8'hae))) : ((^(8'had)) || ((8'hbb) ? (8'h9d) : (8'hb4))))) - ((((~&(8'hae)) ? ((8'hb7) << (8'ha8)) : ((8'hb7) != (8'hb4))) ? {(~|(8'h9c))} : (-((8'h9d) << (8'hba)))) ? (8'hb5) : ((|((8'hbe) >> (8'haf))) ? (((8'hb4) ? (7'h43) : (8'hbf)) ? {(8'hb0)} : {(8'hb4), (8'ha5)}) : ({(8'haa), (7'h41)} < (8'hb2))))), 
parameter param62 = (~|((~&{(param61 - param61)}) ? (((param61 ^~ param61) == (+param61)) >= (param61 > (^param61))) : (((-(8'hb6)) & (!(8'hbb))) ? param61 : ({param61} ^~ (^param61))))))
(y, clk, wire39, wire38, wire37, wire36, wire35);
  output wire [(32'hfb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire39;
  input wire signed [(5'h11):(1'h0)] wire38;
  input wire signed [(3'h6):(1'h0)] wire37;
  input wire [(2'h3):(1'h0)] wire36;
  input wire signed [(4'he):(1'h0)] wire35;
  wire [(4'ha):(1'h0)] wire60;
  wire [(4'ha):(1'h0)] wire45;
  wire [(4'hd):(1'h0)] wire44;
  wire [(4'h9):(1'h0)] wire43;
  wire [(5'h11):(1'h0)] wire42;
  wire [(4'h9):(1'h0)] wire41;
  wire [(4'hf):(1'h0)] wire40;
  reg [(4'h8):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg58 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg56 = (1'h0);
  reg [(5'h12):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg54 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg52 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg51 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg50 = (1'h0);
  reg [(4'hd):(1'h0)] reg49 = (1'h0);
  reg [(3'h6):(1'h0)] reg48 = (1'h0);
  reg [(4'hc):(1'h0)] reg47 = (1'h0);
  reg [(5'h14):(1'h0)] reg46 = (1'h0);
  assign y = {wire60,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
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
                 (1'h0)};
  assign wire40 = ((({$unsigned(wire36), {(7'h41), wire39}} ?
                      (((7'h40) ?
                          wire36 : wire37) <= $unsigned(wire36)) : $unsigned(wire36[(2'h3):(1'h1)])) + (wire37 ?
                      {$signed(wire35)} : $unsigned($signed(wire35)))) & wire38);
  assign wire41 = $unsigned(($signed(({wire39} ?
                      (~|wire39) : $signed(wire36))) + $unsigned($signed(wire36[(2'h3):(1'h1)]))));
  assign wire42 = {$unsigned(wire36[(1'h0):(1'h0)]), wire35[(3'h6):(3'h6)]};
  assign wire43 = (8'ha4);
  assign wire44 = $signed((~&wire42));
  assign wire45 = wire42;
  always
    @(posedge clk) begin
      if (wire35[(1'h1):(1'h1)])
        begin
          reg46 <= {$signed((wire42 | wire41[(3'h5):(2'h3)])),
              $unsigned(($signed($signed(wire38)) ?
                  {(~^wire41), wire39} : wire44))};
          if ($unsigned($signed({$signed($signed(wire43)),
              (^$unsigned(wire40))})))
            begin
              reg47 <= $signed(wire42[(4'h9):(1'h0)]);
              reg48 <= wire42;
              reg49 <= (~&$unsigned((^~wire39)));
              reg50 <= $signed((((~^$unsigned(reg47)) ?
                  reg48[(2'h3):(2'h2)] : ((wire38 ?
                      wire37 : wire45) >> $unsigned(wire40))) >>> ($signed((wire43 ?
                      wire37 : wire35)) ?
                  {{wire42}} : reg47[(1'h0):(1'h0)])));
            end
          else
            begin
              reg47 <= $unsigned(((~^$signed($signed((8'ha4)))) ?
                  ({(wire37 ^ wire42), (wire36 && wire38)} ?
                      $signed(((8'hb9) | wire44)) : $signed((wire40 ?
                          reg50 : wire35))) : wire45[(3'h4):(1'h0)]));
            end
          if ({{wire37}, (wire35 ^ $unsigned(reg48))})
            begin
              reg51 <= (($signed($signed((wire36 ? wire38 : reg48))) ?
                      $unsigned(((wire35 <= reg48) ~^ (-wire43))) : reg47) ?
                  wire44 : $unsigned(((wire43 ?
                          $unsigned(wire37) : {wire42, wire45}) ?
                      wire40[(1'h0):(1'h0)] : (8'hba))));
              reg52 <= {wire38[(1'h1):(1'h0)],
                  $unsigned((&(!$signed(wire36))))};
              reg53 <= (((reg49[(4'hc):(4'hc)] ?
                      wire39[(4'hc):(4'hb)] : (~|{reg50, wire43})) ?
                  (reg52[(4'h9):(2'h2)] - $unsigned(wire35)) : (^(wire45[(1'h0):(1'h0)] ?
                      $unsigned(wire42) : (|wire38)))) >>> $signed((|((^~(8'hb7)) >> $signed(reg50)))));
            end
          else
            begin
              reg51 <= ($unsigned($signed($signed(reg52[(5'h11):(4'h8)]))) * (({reg46,
                          wire38[(4'ha):(4'h9)]} ?
                      $signed((wire43 ?
                          wire39 : wire35)) : (~^$unsigned(wire38))) ?
                  (-(wire36[(2'h2):(1'h1)] && $unsigned(reg49))) : wire37));
              reg52 <= wire38;
            end
        end
      else
        begin
          reg46 <= {reg48, wire35};
          if ($signed((((-{wire39}) ?
                  (|(reg47 ?
                      wire40 : wire36)) : $unsigned(reg50[(3'h4):(3'h4)])) ?
              ((~|wire37[(3'h4):(2'h3)]) * (8'had)) : (wire37 <= ((reg49 ?
                  (8'ha5) : wire36) < (!wire38))))))
            begin
              reg47 <= $unsigned($unsigned(reg52[(4'h9):(2'h2)]));
              reg48 <= wire41[(4'h8):(4'h8)];
              reg49 <= {wire39,
                  ((~|({wire37} ?
                      $unsigned(wire36) : wire38[(5'h11):(3'h6)])) - $unsigned($unsigned($unsigned(wire45))))};
            end
          else
            begin
              reg47 <= $signed((~|(wire39[(2'h2):(1'h1)] <<< $signed(reg53))));
              reg48 <= {(7'h40), wire38[(5'h11):(1'h0)]};
            end
        end
      if ((wire39[(3'h6):(3'h5)] ?
          ((~^$unsigned((reg48 ?
              reg53 : (8'h9e)))) < (((reg47 << wire42) ~^ (|wire40)) >= (reg46[(5'h14):(5'h12)] ^~ reg48[(3'h5):(3'h5)]))) : wire41[(3'h7):(2'h2)]))
        begin
          if ((~|(^$unsigned(wire38[(5'h10):(2'h2)]))))
            begin
              reg54 <= (((wire43 >> (~&reg49[(3'h6):(3'h4)])) ?
                  (wire35[(4'hc):(3'h4)] ?
                      ($unsigned(wire42) * {wire44}) : (~&reg46[(4'ha):(4'ha)])) : wire45) && ((^~$signed($signed(wire38))) ?
                  {wire36[(2'h3):(2'h2)],
                      (8'h9d)} : $unsigned(reg50[(3'h5):(1'h0)])));
            end
          else
            begin
              reg54 <= reg47[(1'h1):(1'h0)];
              reg55 <= (~&$unsigned($unsigned(wire43)));
              reg56 <= reg51[(4'ha):(2'h3)];
              reg57 <= $unsigned($signed($signed((!{(8'haa), (7'h40)}))));
            end
          reg58 <= (($unsigned({reg56[(1'h1):(1'h1)]}) ?
              (~|wire44) : wire35[(3'h5):(2'h3)]) ^~ $unsigned((wire44 ?
              (^~(|reg46)) : (reg48 > $unsigned(reg48)))));
          reg59 <= ((($signed(((8'ha3) ?
                      reg54 : reg46)) + (^~(reg47 && reg48))) ?
                  $signed($unsigned($unsigned(wire45))) : reg48[(2'h2):(1'h0)]) ?
              (~&($signed(reg57[(3'h7):(3'h7)]) >= $signed($unsigned(wire39)))) : ($signed((~wire41[(1'h1):(1'h0)])) || wire39));
        end
      else
        begin
          if ((-reg53[(1'h1):(1'h0)]))
            begin
              reg54 <= (^~$signed(((wire35 - (&(8'hae))) ?
                  $unsigned((reg57 ~^ wire44)) : {(reg51 <= reg48)})));
              reg55 <= (~|(8'ha8));
              reg56 <= ($unsigned($unsigned($unsigned(((8'h9f) >> (8'hba))))) ^ (|reg55[(1'h1):(1'h1)]));
              reg57 <= (~|(($unsigned((wire45 ? reg56 : wire35)) ?
                      reg52 : ((~wire39) <= reg46[(4'hc):(3'h4)])) ?
                  (((reg52 ? wire43 : wire39) ?
                      $unsigned(reg53) : ((8'ha3) ?
                          wire45 : wire43)) * (!((8'ha6) ?
                      wire37 : reg54))) : $unsigned(((~&(7'h40)) ^ (wire37 ?
                      wire36 : reg57)))));
              reg58 <= (8'h9c);
            end
          else
            begin
              reg54 <= $signed(reg52[(3'h7):(1'h1)]);
              reg55 <= (reg52 != ($unsigned($unsigned((reg57 >= reg51))) ?
                  (~|{(reg59 ? reg49 : reg47)}) : {{wire37[(1'h1):(1'h1)]},
                      ({reg59, reg47} & (reg49 ? wire41 : reg55))}));
              reg56 <= (wire37 << $unsigned($signed($unsigned(reg59[(1'h0):(1'h0)]))));
            end
          reg59 <= reg53;
        end
    end
  assign wire60 = reg54;
endmodule
