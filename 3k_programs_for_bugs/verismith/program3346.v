module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h99):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire91;
  wire [(5'h12):(1'h0)] wire14;
  wire signed [(2'h2):(1'h0)] wire13;
  wire [(4'ha):(1'h0)] wire12;
  wire signed [(4'hf):(1'h0)] wire11;
  wire [(3'h5):(1'h0)] wire10;
  wire signed [(5'h10):(1'h0)] wire9;
  wire signed [(5'h11):(1'h0)] wire8;
  wire signed [(5'h12):(1'h0)] wire7;
  wire [(5'h12):(1'h0)] wire4;
  reg [(3'h4):(1'h0)] reg6 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg5 = (1'h0);
  assign y = {wire91,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire4,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = ($unsigned((~wire1)) ?
                     wire3[(1'h0):(1'h0)] : (wire1[(3'h5):(3'h4)] ^~ (^{(wire1 >>> wire0)})));
  always
    @(posedge clk) begin
      reg5 <= (+wire1);
      reg6 <= (-wire0);
    end
  assign wire7 = reg6;
  assign wire8 = wire2;
  assign wire9 = wire4;
  assign wire10 = $signed($unsigned({$unsigned(wire0[(3'h7):(2'h3)])}));
  assign wire11 = wire2[(4'h8):(2'h3)];
  assign wire12 = (~^($signed($signed($signed(wire4))) & (~((wire0 <= wire9) ?
                      (+wire8) : wire9[(5'h10):(3'h6)]))));
  assign wire13 = wire3[(4'ha):(1'h0)];
  assign wire14 = $unsigned((+((wire7[(5'h12):(4'hb)] ?
                      (|wire8) : (wire9 ? wire13 : wire9)) || ({wire8} ?
                      $unsigned(wire8) : (wire12 ? wire2 : wire8)))));
  module15 #() modinst92 (.wire17(wire4), .y(wire91), .wire16(wire7), .wire19(wire14), .clk(clk), .wire18(wire9));
endmodule

module module15
#(parameter param89 = (!(^((((8'hb2) ? (8'ha6) : (8'ha7)) ? {(8'hb1)} : ((8'hb6) ? (8'ha3) : (8'hb3))) ? (((8'hbd) ? (8'hb5) : (8'hb9)) > (!(8'hb3))) : (((8'haf) ^ (8'h9c)) * {(7'h43)})))), 
parameter param90 = param89)
(y, clk, wire16, wire17, wire18, wire19);
  output wire [(32'haa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire16;
  input wire signed [(5'h12):(1'h0)] wire17;
  input wire signed [(4'h9):(1'h0)] wire18;
  input wire [(5'h12):(1'h0)] wire19;
  wire [(4'he):(1'h0)] wire20;
  wire signed [(4'h9):(1'h0)] wire21;
  wire signed [(4'hd):(1'h0)] wire22;
  wire [(3'h7):(1'h0)] wire23;
  wire signed [(2'h3):(1'h0)] wire24;
  wire [(4'hd):(1'h0)] wire25;
  wire [(4'h8):(1'h0)] wire58;
  wire signed [(3'h4):(1'h0)] wire60;
  wire [(4'hf):(1'h0)] wire61;
  wire signed [(4'h8):(1'h0)] wire87;
  reg signed [(4'h8):(1'h0)] reg67 = (1'h0);
  reg [(5'h15):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg63 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg62 = (1'h0);
  assign y = {wire20,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire25,
                 wire58,
                 wire60,
                 wire61,
                 wire87,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 (1'h0)};
  assign wire20 = (((~^(~(^wire18))) ?
                          (wire18[(2'h3):(1'h0)] ?
                              ((wire16 ?
                                  wire19 : wire16) << {wire17}) : wire16[(2'h2):(2'h2)]) : ($signed(wire18) ?
                              wire19[(4'h8):(4'h8)] : ($unsigned(wire18) <<< $signed((8'hac))))) ?
                      wire16[(4'h9):(3'h7)] : wire16);
  assign wire21 = (wire20 ^ wire17);
  assign wire22 = $unsigned((+$unsigned(($signed(wire17) + (wire20 ?
                      wire16 : wire21)))));
  assign wire23 = {wire20[(2'h2):(2'h2)]};
  assign wire24 = (8'ha4);
  assign wire25 = $signed(($unsigned(({(8'hb2)} ?
                      (wire23 & wire16) : {wire19, wire24})) >> wire21));
  module26 #() modinst59 (.wire27(wire24), .y(wire58), .wire28(wire22), .clk(clk), .wire30(wire16), .wire29(wire19));
  assign wire60 = $unsigned(((wire58[(2'h2):(2'h2)] >= $signed(wire17)) ?
                      {$signed((wire58 | wire24)),
                          ((wire25 * wire24) >= wire22)} : wire16));
  assign wire61 = $signed($unsigned(((wire20 >> $unsigned(wire19)) > $unsigned((wire21 & wire18)))));
  always
    @(posedge clk) begin
      if ((~|{$unsigned(wire16[(1'h0):(1'h0)])}))
        begin
          reg62 <= $signed(wire22);
          reg63 <= $signed((8'ha2));
          reg64 <= $signed((8'ha6));
        end
      else
        begin
          reg62 <= ($signed($signed(wire61[(3'h4):(3'h4)])) >>> reg62[(3'h4):(2'h3)]);
          reg63 <= (8'h9f);
        end
      reg65 <= wire16[(1'h1):(1'h0)];
      reg66 <= $unsigned((wire60 && (wire20[(2'h2):(1'h0)] >>> $unsigned(wire60))));
      reg67 <= (reg63[(3'h4):(2'h2)] ?
          wire24 : ($signed((reg62 ?
              (wire21 ? (8'hb4) : (8'h9f)) : (wire60 ^~ reg63))) > (&((wire24 ?
                  wire61 : wire25) ?
              reg62 : $signed(wire23)))));
    end
  module68 #() modinst88 (.wire69(wire18), .wire70(wire20), .wire71(wire61), .y(wire87), .clk(clk), .wire72(reg64), .wire73(reg63));
endmodule

module module68  (y, clk, wire73, wire72, wire71, wire70, wire69);
  output wire [(32'ha6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire73;
  input wire signed [(4'hb):(1'h0)] wire72;
  input wire [(4'he):(1'h0)] wire71;
  input wire signed [(4'h8):(1'h0)] wire70;
  input wire signed [(3'h6):(1'h0)] wire69;
  wire [(4'hf):(1'h0)] wire86;
  wire [(5'h14):(1'h0)] wire85;
  wire [(4'h9):(1'h0)] wire84;
  wire signed [(5'h12):(1'h0)] wire83;
  wire signed [(4'hc):(1'h0)] wire82;
  wire signed [(4'ha):(1'h0)] wire78;
  wire [(5'h12):(1'h0)] wire74;
  reg [(4'ha):(1'h0)] reg81 = (1'h0);
  reg [(3'h4):(1'h0)] reg80 = (1'h0);
  reg signed [(4'he):(1'h0)] reg79 = (1'h0);
  reg [(3'h6):(1'h0)] reg77 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg76 = (1'h0);
  reg [(5'h13):(1'h0)] reg75 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire78,
                 wire74,
                 reg81,
                 reg80,
                 reg79,
                 reg77,
                 reg76,
                 reg75,
                 (1'h0)};
  assign wire74 = ($signed(((8'ha2) << wire71)) ?
                      ((&$unsigned($signed(wire69))) ?
                          wire70[(1'h1):(1'h1)] : wire71) : (wire72[(3'h7):(1'h0)] ?
                          wire69 : wire73));
  always
    @(posedge clk) begin
      reg75 <= {$unsigned($signed($unsigned((wire73 && wire69)))),
          {(wire72 & wire72)}};
      reg76 <= reg75;
      reg77 <= $signed($unsigned($signed(wire73[(4'hc):(3'h5)])));
    end
  assign wire78 = {{$signed(reg77), $unsigned((8'hbb))}};
  always
    @(posedge clk) begin
      reg79 <= (^~$unsigned($signed($unsigned((|wire71)))));
      reg80 <= $unsigned($unsigned($signed(reg76)));
      reg81 <= wire73[(4'hb):(1'h0)];
    end
  assign wire82 = $signed((&(&reg79)));
  assign wire83 = reg81[(2'h2):(1'h1)];
  assign wire84 = ($signed(wire83) ?
                      (wire71[(4'h8):(3'h5)] >= (wire69 ?
                          $signed($signed(wire72)) : {(wire82 >= reg81)})) : ((8'hac) - (reg80 ?
                          reg80[(1'h0):(1'h0)] : reg76[(4'h9):(3'h7)])));
  assign wire85 = reg79[(1'h1):(1'h1)];
  assign wire86 = {wire82};
endmodule

module module26  (y, clk, wire30, wire29, wire28, wire27);
  output wire [(32'hf3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire30;
  input wire [(3'h7):(1'h0)] wire29;
  input wire signed [(3'h5):(1'h0)] wire28;
  input wire [(2'h3):(1'h0)] wire27;
  wire [(4'hd):(1'h0)] wire57;
  wire signed [(4'h9):(1'h0)] wire56;
  wire [(3'h4):(1'h0)] wire55;
  wire signed [(2'h2):(1'h0)] wire54;
  wire signed [(4'ha):(1'h0)] wire42;
  wire signed [(4'ha):(1'h0)] wire41;
  wire [(3'h6):(1'h0)] wire40;
  wire signed [(3'h4):(1'h0)] wire39;
  wire [(3'h5):(1'h0)] wire34;
  wire signed [(2'h2):(1'h0)] wire33;
  wire [(4'h9):(1'h0)] wire32;
  wire signed [(3'h5):(1'h0)] wire31;
  reg signed [(4'hf):(1'h0)] reg53 = (1'h0);
  reg [(2'h3):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg51 = (1'h0);
  reg [(4'h8):(1'h0)] reg50 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg48 = (1'h0);
  reg [(4'hd):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg46 = (1'h0);
  reg [(5'h12):(1'h0)] reg45 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg44 = (1'h0);
  reg [(2'h3):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg37 = (1'h0);
  reg [(4'ha):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg35 = (1'h0);
  assign y = {wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
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
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 (1'h0)};
  assign wire31 = (^~{$signed({(wire29 ~^ wire27), wire28[(2'h3):(1'h0)]})});
  assign wire32 = $signed($signed($signed($unsigned($signed(wire29)))));
  assign wire33 = $signed(wire32);
  assign wire34 = (~&$unsigned((^~wire27[(2'h3):(2'h3)])));
  always
    @(posedge clk) begin
      reg35 <= {(wire29[(3'h7):(3'h7)] < (8'hb4)),
          (wire32[(1'h1):(1'h0)] ?
              $signed({{wire28, wire27}, (wire31 >>> wire27)}) : wire33)};
      reg36 <= (~&$signed($signed($unsigned({wire27}))));
      reg37 <= $signed(((+wire28) >>> wire31));
      reg38 <= $signed($unsigned((($signed(wire29) ?
              ((8'had) ? (8'hbe) : wire34) : wire30) ?
          wire34[(3'h4):(2'h2)] : reg37)));
    end
  assign wire39 = wire33;
  assign wire40 = (~^($unsigned({wire33[(2'h2):(1'h0)],
                      wire28[(1'h0):(1'h0)]}) < (+((wire31 ? wire32 : wire28) ?
                      (wire32 >>> (8'ha3)) : reg37))));
  assign wire41 = (^wire39[(2'h3):(2'h2)]);
  assign wire42 = $unsigned(reg37);
  always
    @(posedge clk) begin
      if (((wire40 == (((wire40 || reg38) ?
              (^~(8'hb5)) : {wire40}) | $unsigned($unsigned(reg35)))) ?
          ($unsigned(reg35[(4'hb):(4'hb)]) ?
              ((|wire40[(3'h5):(1'h0)]) & $unsigned($unsigned(reg37))) : wire33[(2'h2):(2'h2)]) : wire27))
        begin
          reg43 <= $unsigned((wire42[(2'h2):(1'h0)] ?
              $unsigned(((reg35 > wire32) * ((8'ha3) >> reg36))) : {{$signed(reg38)}}));
          reg44 <= ($unsigned(wire33[(1'h1):(1'h1)]) ?
              (wire41 < wire28[(2'h2):(1'h1)]) : (8'hbb));
          reg45 <= wire29;
          reg46 <= $signed($signed((~wire27[(2'h3):(1'h1)])));
          reg47 <= ({(+{$unsigned(wire41), $unsigned(reg38)}), wire30} ?
              reg44 : $unsigned(wire32));
        end
      else
        begin
          if (((~|reg44) ?
              $signed(wire28) : (wire41 && (wire29[(3'h6):(3'h4)] && $unsigned((reg46 == reg46))))))
            begin
              reg43 <= (($signed($signed(wire42)) ?
                      wire39[(2'h2):(2'h2)] : reg44[(3'h4):(1'h1)]) ?
                  ($signed(reg43) ?
                      $signed($unsigned((+(8'hbc)))) : wire31[(3'h4):(1'h1)]) : $unsigned((^reg44)));
              reg44 <= $unsigned(($signed(wire40[(3'h5):(1'h1)]) != $signed(reg37)));
            end
          else
            begin
              reg43 <= wire40[(3'h6):(1'h0)];
              reg44 <= $unsigned(wire31[(1'h1):(1'h0)]);
              reg45 <= ((|({(~&(8'hbd)), (reg46 * reg47)} || ((wire27 ?
                  (7'h41) : wire34) >= $signed(reg43)))) ~^ ({reg35,
                  ((reg43 > reg36) ?
                      (wire42 ^ reg47) : (wire41 || reg47))} << $signed($signed(wire33[(1'h0):(1'h0)]))));
              reg46 <= wire32[(3'h4):(3'h4)];
              reg47 <= (^~{(|$signed($signed(reg43))),
                  ({wire40, (8'hac)} <= (-(^~(8'hba))))});
            end
          reg48 <= ((^$unsigned({(reg38 ? (8'ha9) : reg36), (^~reg45)})) ?
              (reg37 ?
                  {$unsigned(reg38[(1'h0):(1'h0)]),
                      ($unsigned(wire42) ?
                          (wire40 << reg47) : {reg38})} : {((wire41 | reg45) > (~^wire27)),
                      (+wire27)}) : reg47);
          reg49 <= $signed($signed((-(8'haa))));
        end
      reg50 <= (reg36[(3'h5):(3'h5)] ? wire33[(1'h1):(1'h0)] : (8'h9c));
      reg51 <= ((reg38[(1'h0):(1'h0)] ?
              $unsigned($unsigned((reg47 ?
                  reg49 : reg44))) : (reg35[(2'h2):(1'h1)] ~^ ((reg36 << wire33) ~^ $signed(wire29)))) ?
          reg38[(1'h0):(1'h0)] : (~(reg46 >>> ((reg38 ?
              (8'ha4) : wire28) ^~ wire40))));
      reg52 <= wire32;
      reg53 <= (^$signed(($signed(wire40) == $unsigned((wire39 ?
          reg35 : (8'h9c))))));
    end
  assign wire54 = (+(&reg46));
  assign wire55 = {reg43,
                      ((reg45 >>> (wire30[(3'h5):(2'h2)] > $signed(reg49))) ?
                          $signed((8'h9d)) : {reg45[(2'h3):(2'h2)], reg49})};
  assign wire56 = (^(($signed((reg47 | reg48)) ^ $unsigned({(7'h40),
                      wire40})) << (~(~|wire28))));
  assign wire57 = ((wire40[(2'h2):(1'h0)] << ((((8'hb5) <= wire30) ~^ {reg38}) - ($signed((8'ha4)) ?
                          (^(8'hae)) : reg51[(3'h4):(1'h0)]))) ?
                      reg46 : ((($unsigned(reg46) ?
                              (wire29 ? wire34 : reg35) : $signed(wire34)) ?
                          wire28[(1'h0):(1'h0)] : ($signed(wire30) ^~ wire28)) || (reg48 ?
                          $unsigned(reg35) : reg50)));
endmodule
