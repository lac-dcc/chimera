module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h23):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire4;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(3'h6):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire72;
  wire [(4'he):(1'h0)] wire71;
  wire [(4'hb):(1'h0)] wire69;
  wire signed [(3'h6):(1'h0)] wire5;
  assign y = {wire72, wire71, wire69, wire5, (1'h0)};
  assign wire5 = (wire4 ?
                     ((^~$unsigned((wire1 & wire0))) ?
                         $unsigned($signed($signed(wire2))) : (((wire2 <<< wire4) < $signed(wire1)) > {(wire3 && wire2),
                             wire2[(2'h3):(2'h3)]})) : (~(^~(^wire3))));
  module6 #() modinst70 (.wire8(wire4), .clk(clk), .wire10(wire3), .wire7(wire2), .wire9(wire0), .y(wire69));
  assign wire71 = $signed($signed(((|wire2[(3'h6):(3'h6)]) ?
                      wire4 : ($unsigned(wire1) ? (^wire4) : wire5))));
  assign wire72 = wire3;
endmodule

module module6  (y, clk, wire7, wire8, wire9, wire10);
  output wire [(32'h101):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire7;
  input wire signed [(5'h11):(1'h0)] wire8;
  input wire [(3'h5):(1'h0)] wire9;
  input wire [(5'h12):(1'h0)] wire10;
  wire [(5'h14):(1'h0)] wire68;
  wire signed [(5'h10):(1'h0)] wire11;
  wire [(4'hd):(1'h0)] wire12;
  wire [(4'he):(1'h0)] wire13;
  wire [(3'h7):(1'h0)] wire14;
  wire [(3'h7):(1'h0)] wire15;
  wire [(3'h7):(1'h0)] wire16;
  wire [(5'h15):(1'h0)] wire17;
  wire signed [(4'ha):(1'h0)] wire18;
  wire signed [(5'h14):(1'h0)] wire19;
  wire signed [(3'h6):(1'h0)] wire20;
  wire [(2'h2):(1'h0)] wire21;
  wire signed [(5'h15):(1'h0)] wire23;
  wire signed [(4'ha):(1'h0)] wire24;
  wire signed [(4'he):(1'h0)] wire42;
  wire signed [(4'he):(1'h0)] wire44;
  wire [(5'h13):(1'h0)] wire45;
  wire [(4'hf):(1'h0)] wire66;
  reg [(5'h14):(1'h0)] reg22 = (1'h0);
  assign y = {wire68,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire23,
                 wire24,
                 wire42,
                 wire44,
                 wire45,
                 wire66,
                 reg22,
                 (1'h0)};
  assign wire11 = (+(~$signed($unsigned((~&wire9)))));
  assign wire12 = (8'hb3);
  assign wire13 = $signed((((8'hb0) ?
                          $unsigned(wire12[(3'h4):(2'h2)]) : $signed($unsigned(wire12))) ?
                      $signed(($unsigned(wire8) >= (^~wire9))) : (wire8 && (wire8[(1'h1):(1'h0)] ?
                          $unsigned(wire9) : wire7[(5'h13):(1'h0)]))));
  assign wire14 = (wire8 ?
                      (wire7[(4'ha):(4'ha)] ?
                          $signed({(wire8 <<< wire13),
                              (~wire10)}) : wire9) : $unsigned($unsigned($unsigned(wire13))));
  assign wire15 = wire9[(2'h2):(1'h0)];
  assign wire16 = (8'ha3);
  assign wire17 = ((&{wire9, ({wire16} ? (+wire8) : (!wire16))}) ?
                      (^wire13) : {$unsigned((~^wire11[(3'h5):(1'h0)]))});
  assign wire18 = $unsigned((wire10 ? wire13 : {wire7[(5'h10):(2'h3)]}));
  assign wire19 = wire10;
  assign wire20 = (wire14[(3'h5):(2'h2)] * (~|((-$unsigned(wire13)) ?
                      $unsigned(wire9) : $signed((-wire12)))));
  assign wire21 = $unsigned(wire15[(2'h3):(1'h0)]);
  always
    @(posedge clk) begin
      reg22 <= ((~&wire16[(2'h3):(2'h2)]) ?
          $signed(((^~$signed((8'hb4))) ~^ wire16[(1'h1):(1'h0)])) : ($unsigned(((wire20 ?
                  wire12 : wire8) >> {wire20, wire10})) ?
              $signed($unsigned(wire12[(2'h2):(2'h2)])) : ((!$signed(wire11)) >> (|wire20))));
    end
  assign wire23 = $signed(((^~$signed((reg22 ?
                      wire13 : wire21))) >= (wire16[(3'h5):(3'h5)] << wire15[(1'h1):(1'h1)])));
  assign wire24 = $unsigned({(~^wire11), (~^wire8)});
  module25 #() modinst43 (.wire28(wire8), .wire27(wire19), .wire29(wire23), .wire26(wire18), .y(wire42), .clk(clk));
  assign wire44 = $signed(wire12[(4'ha):(1'h0)]);
  assign wire45 = (!$signed((wire7[(4'he):(1'h1)] ?
                      $signed($signed((8'ha8))) : ((wire23 || wire8) >>> (wire20 ?
                          wire23 : wire12)))));
  module46 #() modinst67 (wire66, clk, wire15, wire11, wire18, wire24, wire16);
  assign wire68 = ((&($signed((wire44 != wire9)) ?
                      (wire66[(4'ha):(3'h5)] <<< (wire21 ?
                          reg22 : wire20)) : {wire15[(3'h5):(1'h0)]})) * (|wire11[(2'h3):(2'h2)]));
endmodule

module module46
#(parameter param65 = {((((~^(8'hbe)) != ((8'hb6) ? (8'hb3) : (8'h9d))) && (&{(8'hb6)})) ? (|(8'hba)) : (|{((8'ha1) * (8'hb9)), ((8'hb8) ? (8'hb0) : (8'ha5))}))})
(y, clk, wire51, wire50, wire49, wire48, wire47);
  output wire [(32'ha2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire51;
  input wire [(5'h10):(1'h0)] wire50;
  input wire [(4'ha):(1'h0)] wire49;
  input wire [(4'h9):(1'h0)] wire48;
  input wire signed [(2'h3):(1'h0)] wire47;
  wire signed [(5'h14):(1'h0)] wire64;
  wire signed [(5'h10):(1'h0)] wire63;
  wire [(2'h3):(1'h0)] wire62;
  wire signed [(4'hc):(1'h0)] wire61;
  wire [(4'he):(1'h0)] wire60;
  wire [(4'hb):(1'h0)] wire59;
  wire [(3'h6):(1'h0)] wire56;
  wire signed [(4'hd):(1'h0)] wire55;
  wire [(5'h14):(1'h0)] wire54;
  wire signed [(4'hc):(1'h0)] wire53;
  wire signed [(4'hb):(1'h0)] wire52;
  reg [(5'h11):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg57 = (1'h0);
  assign y = {wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 reg58,
                 reg57,
                 (1'h0)};
  assign wire52 = wire51[(1'h0):(1'h0)];
  assign wire53 = wire47[(1'h1):(1'h0)];
  assign wire54 = (-{wire47});
  assign wire55 = (+((wire48 ?
                      (~&$unsigned(wire47)) : $signed((wire53 ?
                          wire54 : wire48))) >= ($signed(wire53) ?
                      wire50[(4'ha):(3'h5)] : (8'ha0))));
  assign wire56 = (&((-((wire55 - wire48) ?
                      wire54 : ((8'h9d) ?
                          wire54 : (8'h9e)))) + $unsigned({(-wire47)})));
  always
    @(posedge clk) begin
      reg57 <= wire47[(2'h3):(2'h3)];
      reg58 <= (!($unsigned($signed({(8'hb4),
          reg57})) ^~ (~wire50[(3'h6):(2'h3)])));
    end
  assign wire59 = {$signed(wire56),
                      {$signed(((wire53 < wire56) ?
                              ((8'ha0) ?
                                  (8'hba) : (8'ha3)) : $signed((7'h41))))}};
  assign wire60 = {(({wire53[(3'h5):(3'h4)], wire53[(4'h8):(2'h3)]} ?
                          $unsigned(reg58[(3'h4):(1'h1)]) : (8'hbe)) != {wire53[(3'h6):(3'h5)],
                          (wire56 | $unsigned(wire48))}),
                      $unsigned(wire49[(4'h9):(3'h7)])};
  assign wire61 = {({(~|wire52),
                          {((8'hbf) ? wire47 : reg58),
                              $signed(wire55)}} ~^ (((wire55 ^~ wire56) ?
                              $signed(reg57) : $signed(reg57)) ?
                          ((~wire50) - (~&wire56)) : ((wire56 >= reg57) >> wire50)))};
  assign wire62 = $signed((wire52 != $unsigned($signed((wire50 ?
                      (8'haa) : wire48)))));
  assign wire63 = $unsigned(reg57[(3'h5):(1'h1)]);
  assign wire64 = wire60[(4'ha):(4'h9)];
endmodule

module module25
#(parameter param41 = ((~^(~{{(8'ha5), (7'h41)}, ((8'hb6) ? (8'hb0) : (8'hbf))})) ? ((|({(8'hb5)} ? ((7'h42) ? (8'ha9) : (7'h42)) : (!(8'ha2)))) != (((~(8'hb9)) == ((8'ha3) >> (8'h9e))) >>> ((&(8'hb9)) ? (^~(8'hbe)) : ((8'hba) - (8'ha3))))) : (~((~|(7'h44)) ? (!((8'hb3) >> (8'ha6))) : ({(8'ha8)} | {(8'ha8)})))))
(y, clk, wire29, wire28, wire27, wire26);
  output wire [(32'h7a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire29;
  input wire signed [(5'h11):(1'h0)] wire28;
  input wire signed [(5'h14):(1'h0)] wire27;
  input wire [(2'h3):(1'h0)] wire26;
  wire signed [(5'h14):(1'h0)] wire40;
  wire signed [(3'h7):(1'h0)] wire39;
  wire signed [(4'hb):(1'h0)] wire33;
  wire signed [(4'h8):(1'h0)] wire32;
  wire [(2'h2):(1'h0)] wire31;
  wire [(3'h5):(1'h0)] wire30;
  reg [(5'h12):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg37 = (1'h0);
  reg [(5'h10):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg35 = (1'h0);
  reg [(3'h7):(1'h0)] reg34 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 (1'h0)};
  assign wire30 = (!((wire29 | ((wire26 <<< wire27) ?
                      wire29[(5'h15):(4'ha)] : (wire26 ?
                          wire26 : wire26))) ^ $unsigned($signed($signed(wire26)))));
  assign wire31 = wire27[(1'h1):(1'h1)];
  assign wire32 = {wire28};
  assign wire33 = $unsigned($signed($unsigned((wire27 ~^ (^wire30)))));
  always
    @(posedge clk) begin
      reg34 <= (8'hb6);
      reg35 <= (wire30 ?
          (~$unsigned(wire28[(2'h2):(1'h0)])) : wire31[(2'h2):(2'h2)]);
      reg36 <= $unsigned(wire31[(2'h2):(1'h0)]);
      if (({$signed($signed(((8'ha2) ? (8'had) : wire29))),
              $unsigned($signed((|reg34)))} ?
          {(~($signed(wire28) ? {wire28, (8'hba)} : (reg36 ? wire30 : wire33))),
              (8'had)} : {wire28}))
        begin
          reg37 <= (8'ha5);
        end
      else
        begin
          reg37 <= reg36;
          reg38 <= $unsigned(wire31);
        end
    end
  assign wire39 = $signed((wire27 >= $unsigned(wire33[(2'h3):(2'h3)])));
  assign wire40 = (|wire39);
endmodule
