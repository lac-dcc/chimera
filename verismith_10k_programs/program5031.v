module top
#(parameter param94 = {(~|({(~^(8'hbf))} ? {((8'ha0) ? (8'ha8) : (8'ha4)), ((8'hb9) ? (8'hbb) : (8'ha3))} : (7'h42))), (((^((8'ha4) ^~ (7'h43))) ? ((8'ha3) >>> ((8'ha1) >>> (8'hbe))) : (~^{(8'hb5)})) && (~(^{(8'ha9)})))}, 
parameter param95 = param94)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire93;
  wire signed [(4'hc):(1'h0)] wire91;
  wire signed [(5'h14):(1'h0)] wire79;
  wire signed [(4'hf):(1'h0)] wire78;
  wire signed [(4'h9):(1'h0)] wire77;
  wire [(5'h13):(1'h0)] wire75;
  wire signed [(5'h12):(1'h0)] wire4;
  assign y = {wire93, wire91, wire79, wire78, wire77, wire75, wire4, (1'h0)};
  assign wire4 = (&((8'h9f) ^ wire3[(5'h14):(5'h11)]));
  module5 #() modinst76 (.y(wire75), .wire7(wire4), .wire9(wire3), .clk(clk), .wire8(wire0), .wire6(wire1));
  assign wire77 = wire4[(4'hf):(4'hc)];
  assign wire78 = $unsigned(wire75[(1'h0):(1'h0)]);
  assign wire79 = (wire0[(1'h1):(1'h0)] ?
                      wire2[(4'hd):(2'h2)] : wire4[(3'h5):(3'h5)]);
  module80 #() modinst92 (.clk(clk), .wire83(wire0), .wire84(wire3), .y(wire91), .wire81(wire4), .wire82(wire2));
  assign wire93 = ((($signed((wire0 <<< wire78)) ?
                          ((wire0 ? wire75 : wire3) ~^ wire2) : (8'hb9)) ?
                      (-{$unsigned(wire4),
                          (~&wire75)}) : wire78[(3'h4):(2'h2)]) && $unsigned(wire91[(4'hc):(4'hc)]));
endmodule

module module80
#(parameter param89 = {{(8'ha8), (!((~(8'hbf)) ? (+(8'hb1)) : ((8'hbf) ? (8'h9c) : (8'had))))}, (((((8'hbd) * (7'h41)) >>> (~(8'hb3))) ? ((^(8'hbc)) ^~ {(8'haf)}) : {(8'ha5)}) ? ((((8'hb2) ? (7'h43) : (8'hbc)) ? {(7'h44)} : ((8'hb0) ? (8'hb0) : (8'hbc))) ? (((8'h9c) ? (8'hb8) : (8'hb1)) == ((8'ha3) ? (8'ha2) : (8'hae))) : ((~&(7'h44)) & ((8'hb2) ? (8'haf) : (8'hbb)))) : (|(((8'ha1) & (8'ha9)) >> (&(8'h9c)))))}, 
parameter param90 = (~&(|(param89 <<< {param89}))))
(y, clk, wire84, wire83, wire82, wire81);
  output wire [(32'h44):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire84;
  input wire [(4'h8):(1'h0)] wire83;
  input wire [(4'hb):(1'h0)] wire82;
  input wire signed [(4'hb):(1'h0)] wire81;
  wire [(5'h11):(1'h0)] wire88;
  wire signed [(4'h9):(1'h0)] wire87;
  wire signed [(5'h15):(1'h0)] wire86;
  wire signed [(5'h14):(1'h0)] wire85;
  assign y = {wire88, wire87, wire86, wire85, (1'h0)};
  assign wire85 = (wire83 && (~|wire81));
  assign wire86 = wire85;
  assign wire87 = $unsigned({(8'hbd), wire83[(2'h2):(1'h1)]});
  assign wire88 = (|$unsigned($signed((^((8'ha9) ? wire83 : wire83)))));
endmodule

module module5
#(parameter param74 = ((!{({(8'ha5)} ? {(8'hb7)} : ((8'haa) ? (8'ha4) : (8'hb9)))}) ? (|(~|({(8'had)} == (|(8'ha0))))) : (+({(+(8'ha5)), (~^(8'ha0))} ~^ (((8'ha5) ? (8'ha2) : (8'ha5)) <= (-(8'ha8)))))))
(y, clk, wire6, wire7, wire8, wire9);
  output wire [(32'hab):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire6;
  input wire [(5'h12):(1'h0)] wire7;
  input wire signed [(5'h14):(1'h0)] wire8;
  input wire [(4'he):(1'h0)] wire9;
  wire [(5'h15):(1'h0)] wire72;
  wire [(4'he):(1'h0)] wire47;
  wire signed [(3'h7):(1'h0)] wire10;
  wire [(3'h7):(1'h0)] wire11;
  wire [(4'hb):(1'h0)] wire12;
  wire [(4'hb):(1'h0)] wire13;
  wire signed [(3'h7):(1'h0)] wire15;
  wire [(4'hd):(1'h0)] wire16;
  wire [(3'h4):(1'h0)] wire17;
  wire [(5'h10):(1'h0)] wire18;
  wire signed [(4'hb):(1'h0)] wire19;
  wire signed [(5'h13):(1'h0)] wire20;
  wire signed [(3'h7):(1'h0)] wire45;
  reg [(4'hb):(1'h0)] reg14 = (1'h0);
  reg [(4'hb):(1'h0)] reg48 = (1'h0);
  assign y = {wire72,
                 wire47,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire15,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire20,
                 wire45,
                 reg14,
                 reg48,
                 (1'h0)};
  assign wire10 = $unsigned(wire8[(3'h5):(2'h3)]);
  assign wire11 = (!{$unsigned($unsigned(wire8[(1'h0):(1'h0)]))});
  assign wire12 = $unsigned(wire9[(3'h4):(1'h1)]);
  assign wire13 = $unsigned((wire8[(3'h5):(1'h0)] ? wire8 : $unsigned(wire6)));
  always
    @(posedge clk) begin
      reg14 <= ($signed($unsigned({wire9, (wire6 ? wire8 : wire8)})) ?
          (wire8[(2'h2):(2'h2)] == $signed(($unsigned(wire8) ?
              $signed(wire9) : wire12[(3'h6):(3'h6)]))) : ($signed({(wire10 ?
                      wire6 : wire11),
                  (wire11 + wire7)}) ?
              (wire10 ?
                  $unsigned(((8'hb0) == wire6)) : (!{(7'h43),
                      wire9})) : (8'ha0)));
    end
  assign wire15 = {((^wire6[(4'h9):(1'h0)]) ?
                          wire10[(3'h4):(1'h0)] : ($unsigned($unsigned(wire7)) < (^~(wire11 >>> (8'h9c))))),
                      (reg14 >> $unsigned((8'had)))};
  assign wire16 = wire10;
  assign wire17 = wire7[(3'h4):(1'h0)];
  assign wire18 = {wire10,
                      (wire8[(4'h8):(4'h8)] ?
                          $signed((8'hbc)) : $signed($unsigned($signed(wire9))))};
  assign wire19 = wire7[(4'hc):(1'h1)];
  assign wire20 = $signed({(^(wire17 ? {wire19} : $signed(wire13))),
                      (~|$signed((~&wire7)))});
  module21 #() modinst46 (.wire23(wire8), .wire25(wire19), .wire22(wire6), .clk(clk), .wire26(wire18), .y(wire45), .wire24(wire9));
  assign wire47 = $signed(wire17);
  always
    @(posedge clk) begin
      reg48 <= ($signed({(|$signed(wire8)), ((!wire19) == (~^wire19))}) ?
          $signed(wire9[(4'hc):(4'ha)]) : $signed($unsigned(reg14[(3'h4):(2'h3)])));
    end
  module49 #() modinst73 (.wire51(reg48), .wire54(wire11), .wire53(wire12), .wire52(wire16), .wire50(wire45), .y(wire72), .clk(clk));
endmodule

module module49  (y, clk, wire54, wire53, wire52, wire51, wire50);
  output wire [(32'hce):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire54;
  input wire signed [(3'h5):(1'h0)] wire53;
  input wire [(4'hd):(1'h0)] wire52;
  input wire [(4'hb):(1'h0)] wire51;
  input wire [(2'h2):(1'h0)] wire50;
  wire signed [(2'h3):(1'h0)] wire71;
  wire signed [(5'h14):(1'h0)] wire70;
  wire signed [(4'hd):(1'h0)] wire69;
  wire [(5'h12):(1'h0)] wire68;
  wire signed [(5'h13):(1'h0)] wire67;
  wire [(5'h13):(1'h0)] wire66;
  wire [(5'h11):(1'h0)] wire65;
  wire signed [(4'he):(1'h0)] wire64;
  reg [(3'h6):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg61 = (1'h0);
  reg [(5'h11):(1'h0)] reg60 = (1'h0);
  reg [(4'h8):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg58 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg57 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg55 = (1'h0);
  assign y = {wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg55 <= (+wire52[(4'hd):(3'h6)]);
      reg56 <= {wire50[(2'h2):(1'h1)], $unsigned(wire50[(1'h0):(1'h0)])};
      if (($unsigned(wire51[(2'h3):(1'h0)]) ?
          wire53 : ($signed((8'ha2)) & $unsigned(wire50[(1'h0):(1'h0)]))))
        begin
          if ((wire52 << $unsigned((^$signed(((8'ha0) >= (8'hbe)))))))
            begin
              reg57 <= ((((+$signed(reg56)) ^ $signed($unsigned((8'hba)))) ?
                  ($signed($signed(reg55)) ?
                      $signed(wire50) : $signed((wire50 << wire53))) : wire52[(4'hc):(4'hb)]) + wire53[(2'h3):(1'h0)]);
              reg58 <= {(|$signed($signed(wire50)))};
            end
          else
            begin
              reg57 <= $unsigned(reg55[(1'h0):(1'h0)]);
              reg58 <= (wire50 && $unsigned(wire50[(1'h0):(1'h0)]));
              reg59 <= ({(&{{reg57},
                      {reg57,
                          reg56}})} || ((-$signed((-reg57))) | {($signed((8'hb1)) && reg55)}));
            end
          reg60 <= (-$signed((7'h42)));
          reg61 <= $unsigned($signed(wire54[(1'h1):(1'h1)]));
        end
      else
        begin
          reg57 <= wire54[(1'h0):(1'h0)];
          reg58 <= reg58[(3'h5):(2'h3)];
          reg59 <= (reg56 ?
              $signed($signed($signed((~^reg58)))) : $unsigned($signed(((8'ha2) ?
                  reg57 : (-reg56)))));
        end
      reg62 <= ((^~$unsigned(wire52)) || reg55);
      reg63 <= wire51[(4'h9):(2'h2)];
    end
  assign wire64 = (reg59 ? $signed(reg60[(4'hf):(3'h6)]) : reg62);
  assign wire65 = wire51;
  assign wire66 = {(+$unsigned(wire64)), reg58[(3'h4):(2'h3)]};
  assign wire67 = wire53;
  assign wire68 = (|((&((+wire66) ? reg59 : {reg55})) | reg60));
  assign wire69 = $unsigned(((((|wire66) ?
                      $signed(reg57) : $signed(reg62)) >>> $signed($signed(reg57))) && ({$unsigned(wire51)} ?
                      $signed((-wire52)) : {wire66[(4'h9):(3'h5)]})));
  assign wire70 = (($signed(wire66) ?
                      ($signed(wire69[(4'hd):(1'h1)]) ?
                          $signed(wire64) : reg60[(3'h6):(1'h1)]) : wire68) >= $unsigned((^~$signed($unsigned(reg59)))));
  assign wire71 = ((wire64[(2'h3):(1'h0)] ?
                          (-(wire69 << (reg57 >> reg60))) : ($signed($unsigned(reg55)) ?
                              (~^(wire67 && (8'had))) : (&$signed(wire50)))) ?
                      (8'ha2) : ({(-{wire50}),
                          ((reg55 <= reg60) ?
                              wire69[(3'h4):(2'h2)] : (wire65 ?
                                  (8'hb8) : wire65))} >= (~^$unsigned($unsigned(wire51)))));
endmodule

module module21  (y, clk, wire26, wire25, wire24, wire23, wire22);
  output wire [(32'hbe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire26;
  input wire signed [(2'h2):(1'h0)] wire25;
  input wire [(4'hb):(1'h0)] wire24;
  input wire [(5'h14):(1'h0)] wire23;
  input wire signed [(4'hb):(1'h0)] wire22;
  wire [(4'ha):(1'h0)] wire42;
  wire signed [(5'h11):(1'h0)] wire41;
  wire signed [(4'hb):(1'h0)] wire35;
  wire signed [(3'h5):(1'h0)] wire34;
  wire [(4'hc):(1'h0)] wire33;
  wire [(4'hb):(1'h0)] wire32;
  wire [(4'h8):(1'h0)] wire31;
  wire signed [(3'h7):(1'h0)] wire30;
  wire [(2'h3):(1'h0)] wire29;
  wire [(5'h13):(1'h0)] wire28;
  wire signed [(3'h5):(1'h0)] wire27;
  reg signed [(4'he):(1'h0)] reg44 = (1'h0);
  reg [(3'h5):(1'h0)] reg43 = (1'h0);
  reg [(3'h7):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg38 = (1'h0);
  reg [(4'hd):(1'h0)] reg37 = (1'h0);
  reg [(4'hd):(1'h0)] reg36 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 reg44,
                 reg43,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 (1'h0)};
  assign wire27 = wire24;
  assign wire28 = $unsigned((wire22[(2'h2):(1'h1)] && $signed((^~$signed(wire23)))));
  assign wire29 = wire28;
  assign wire30 = $signed((wire25 > ($signed({wire25}) <= (wire23 ?
                      ((8'ha7) < wire24) : wire28[(4'h8):(2'h2)]))));
  assign wire31 = ($unsigned($unsigned(((+wire29) ?
                          wire30[(1'h0):(1'h0)] : (wire24 ^~ wire26)))) ?
                      $unsigned((wire30 & wire24)) : (8'ha6));
  assign wire32 = (wire27 * wire31);
  assign wire33 = wire28;
  assign wire34 = $unsigned(wire24[(4'h8):(3'h6)]);
  assign wire35 = $unsigned({(|$signed($unsigned(wire23))), wire26});
  always
    @(posedge clk) begin
      reg36 <= (((&(8'ha2)) ?
              (~&$signed((wire22 != wire35))) : wire32[(1'h1):(1'h1)]) ?
          $signed(wire33[(1'h0):(1'h0)]) : ((|((wire29 <<< wire34) ?
                  $unsigned((7'h44)) : (8'ha6))) ?
              ((|(8'h9d)) ?
                  ({(8'hba),
                      wire31} >> (~^wire29)) : $unsigned((|wire34))) : $signed(wire28)));
      reg37 <= wire25;
      reg38 <= ((^(((wire35 == wire35) ? $signed(wire22) : $unsigned(wire30)) ?
              ($signed(wire34) <= (wire31 ?
                  wire34 : wire24)) : (wire23[(3'h6):(2'h3)] ?
                  {(7'h41), wire33} : (8'ha4)))) ?
          (+$unsigned(wire29)) : ($unsigned(wire22) >> wire33[(2'h3):(1'h0)]));
      reg39 <= $unsigned($unsigned((~$signed({wire35}))));
      reg40 <= $signed((wire27[(1'h0):(1'h0)] && (wire30[(3'h5):(1'h0)] << $unsigned(((7'h44) - wire28)))));
    end
  assign wire41 = wire29[(2'h3):(1'h1)];
  assign wire42 = (wire30[(3'h4):(1'h1)] == (^wire25));
  always
    @(posedge clk) begin
      reg43 <= ((8'hb5) ? wire35 : wire31[(2'h2):(1'h0)]);
      reg44 <= $unsigned(reg40[(2'h3):(1'h1)]);
    end
endmodule
