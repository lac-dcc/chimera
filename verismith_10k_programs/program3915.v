module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hc4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire65;
  wire [(3'h5):(1'h0)] wire64;
  wire signed [(4'hc):(1'h0)] wire62;
  wire [(5'h10):(1'h0)] wire30;
  wire [(5'h10):(1'h0)] wire29;
  wire signed [(5'h15):(1'h0)] wire28;
  wire signed [(5'h12):(1'h0)] wire27;
  wire signed [(2'h2):(1'h0)] wire26;
  wire signed [(2'h3):(1'h0)] wire25;
  wire [(3'h6):(1'h0)] wire24;
  wire [(3'h5):(1'h0)] wire23;
  wire signed [(5'h11):(1'h0)] wire22;
  wire signed [(3'h5):(1'h0)] wire20;
  wire [(4'h8):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire4;
  assign y = {wire65,
                 wire64,
                 wire62,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire20,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 (1'h0)};
  assign wire4 = wire2[(2'h2):(1'h0)];
  assign wire5 = ((~^{((wire2 > wire3) ?
                             ((8'ha1) << wire1) : wire0[(4'hc):(2'h3)]),
                         ((wire0 <= (8'hb2)) << $unsigned(wire0))}) ?
                     (^~((((7'h42) ? wire4 : wire4) >= wire1[(2'h3):(2'h2)]) ?
                         ($signed(wire3) >> $unsigned(wire2)) : wire0)) : (&$signed((wire0 ?
                         (wire1 ? wire0 : (8'h9d)) : (~|wire2)))));
  assign wire6 = $unsigned((wire5[(1'h1):(1'h0)] ?
                     (|$signed(((8'ha0) ^~ (8'haa)))) : (wire3 > wire4[(1'h1):(1'h0)])));
  assign wire7 = $signed((&((^~wire5) ?
                     ($signed(wire4) * $signed((8'ha4))) : wire6[(4'ha):(3'h7)])));
  module8 #() modinst21 (.wire9(wire5), .y(wire20), .wire12(wire7), .clk(clk), .wire10(wire2), .wire11(wire0));
  assign wire22 = $signed($signed((!($signed(wire20) ?
                      (wire3 * wire2) : ((8'hba) ? wire6 : wire3)))));
  assign wire23 = wire3[(3'h6):(2'h3)];
  assign wire24 = $signed((($unsigned((wire4 > (8'ha2))) ?
                          $unsigned((+wire20)) : $unsigned((wire1 ?
                              (8'h9c) : wire3))) ?
                      (^wire7[(2'h2):(1'h0)]) : ($signed($signed(wire3)) << wire7)));
  assign wire25 = {(|$unsigned(($unsigned(wire22) ~^ ((8'hbe) ?
                          wire22 : wire6)))),
                      wire6};
  assign wire26 = $unsigned(((~|wire24[(1'h0):(1'h0)]) ?
                      wire3 : $signed(((wire4 ? wire20 : (8'h9c)) ?
                          {wire24} : ((7'h40) ? wire1 : wire22)))));
  assign wire27 = wire2;
  assign wire28 = $unsigned($signed(((^wire23) ?
                      $signed((-wire24)) : (7'h42))));
  assign wire29 = {{wire25[(1'h1):(1'h0)]}, {wire1}};
  assign wire30 = wire5;
  module31 #() modinst63 (wire62, clk, wire27, wire0, wire28, wire2);
  assign wire64 = (~(|wire22[(3'h6):(2'h2)]));
  assign wire65 = $unsigned(wire20[(1'h1):(1'h1)]);
endmodule

module module31  (y, clk, wire35, wire34, wire33, wire32);
  output wire [(32'h131):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire35;
  input wire signed [(4'hd):(1'h0)] wire34;
  input wire signed [(4'hb):(1'h0)] wire33;
  input wire [(4'hb):(1'h0)] wire32;
  wire signed [(4'hd):(1'h0)] wire61;
  wire signed [(4'hc):(1'h0)] wire53;
  wire [(3'h7):(1'h0)] wire52;
  wire signed [(4'ha):(1'h0)] wire51;
  wire signed [(4'hb):(1'h0)] wire50;
  wire signed [(5'h12):(1'h0)] wire49;
  wire [(4'hc):(1'h0)] wire48;
  wire signed [(4'hc):(1'h0)] wire47;
  wire [(5'h11):(1'h0)] wire46;
  wire [(4'hd):(1'h0)] wire45;
  wire signed [(3'h6):(1'h0)] wire44;
  wire [(4'h8):(1'h0)] wire43;
  wire [(5'h11):(1'h0)] wire42;
  wire [(5'h15):(1'h0)] wire41;
  wire signed [(5'h11):(1'h0)] wire40;
  wire signed [(3'h6):(1'h0)] wire39;
  wire signed [(4'hb):(1'h0)] wire38;
  wire signed [(2'h2):(1'h0)] wire37;
  wire [(5'h13):(1'h0)] wire36;
  reg [(3'h7):(1'h0)] reg60 = (1'h0);
  reg [(5'h13):(1'h0)] reg59 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg58 = (1'h0);
  reg [(4'hb):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg55 = (1'h0);
  reg [(2'h2):(1'h0)] reg54 = (1'h0);
  assign y = {wire61,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 (1'h0)};
  assign wire36 = wire32;
  assign wire37 = (wire33 != wire36[(4'ha):(3'h4)]);
  assign wire38 = $signed($unsigned($signed($signed($signed(wire33)))));
  assign wire39 = wire34;
  assign wire40 = wire33;
  assign wire41 = (8'hbd);
  assign wire42 = $unsigned({wire40, wire37});
  assign wire43 = $signed($unsigned((~$unsigned($unsigned(wire37)))));
  assign wire44 = wire34;
  assign wire45 = ($unsigned($unsigned(wire32)) < wire40);
  assign wire46 = wire32[(3'h5):(3'h5)];
  assign wire47 = wire45;
  assign wire48 = $unsigned(($signed(wire32[(1'h0):(1'h0)]) | ($signed(((7'h44) ?
                          wire39 : wire42)) ?
                      ({wire43, wire38} ?
                          $signed((8'hbc)) : $signed(wire40)) : $signed({wire46,
                          wire45}))));
  assign wire49 = ((((~&$signed(wire47)) > (~&(-wire38))) ?
                          wire48[(3'h4):(2'h3)] : ((wire48 ^ $signed(wire44)) | (wire33[(1'h0):(1'h0)] ?
                              $unsigned(wire38) : wire35[(1'h0):(1'h0)]))) ?
                      wire37 : wire44[(2'h2):(1'h1)]);
  assign wire50 = ($signed((8'haa)) ? wire39 : wire33[(1'h1):(1'h1)]);
  assign wire51 = (-(-wire38[(3'h6):(3'h4)]));
  assign wire52 = $signed(wire38[(2'h2):(1'h1)]);
  assign wire53 = (~(~|{wire43}));
  always
    @(posedge clk) begin
      reg54 <= $unsigned((wire45[(3'h6):(1'h1)] ?
          ($signed($signed(wire33)) ?
              ($unsigned(wire36) > wire43) : {{wire36},
                  (8'hb9)}) : (+((wire52 ~^ wire44) <= (wire44 ?
              wire47 : wire37)))));
      reg55 <= ((!wire50[(4'hb):(4'h9)]) || ((wire33[(3'h7):(1'h0)] ?
          $signed($signed((8'hb3))) : $signed($unsigned(wire37))) ^~ (($signed(wire49) | (wire37 ?
              wire37 : wire32)) ?
          (~^(wire50 > wire50)) : {$signed(wire35), wire32})));
      reg56 <= wire51[(3'h6):(2'h2)];
      if ($signed((wire41[(4'he):(3'h7)] ?
          wire51[(1'h0):(1'h0)] : $unsigned($unsigned({wire32, wire41})))))
        begin
          reg57 <= (wire39 ?
              wire37[(1'h1):(1'h1)] : (($signed($signed(wire42)) - ($unsigned(wire52) ?
                      {(8'hbf), wire35} : $unsigned(wire37))) ?
                  $signed(wire36[(5'h12):(4'hb)]) : wire43));
          reg58 <= reg57;
          reg59 <= {(^~(($unsigned(wire35) | $signed(wire40)) ?
                  {(wire53 <= wire53)} : wire34)),
              wire38};
        end
      else
        begin
          reg57 <= wire44;
          reg58 <= ($signed(reg55[(4'hc):(4'h8)]) ?
              wire38 : ((~|{wire34, (wire45 >>> (8'hbb))}) ?
                  wire50 : $unsigned(wire35[(1'h0):(1'h0)])));
          reg59 <= (~^$signed(wire45));
          reg60 <= (wire48 <<< ($unsigned($signed((reg58 ? wire32 : wire38))) ?
              (wire50[(4'h8):(3'h5)] ?
                  wire49[(3'h7):(2'h3)] : {$unsigned(reg54),
                      wire44}) : wire44[(3'h5):(1'h1)]));
        end
    end
  assign wire61 = $unsigned(((((wire47 ? wire38 : wire33) ?
                          wire46[(4'ha):(2'h3)] : $unsigned((8'h9e))) ?
                      $unsigned($signed((8'h9f))) : $unsigned(((8'hbe) ?
                          wire34 : reg54))) ^~ ($signed($signed((7'h44))) ?
                      wire52 : (wire52 ^ wire36[(1'h0):(1'h0)]))));
endmodule

module module8
#(parameter param18 = ((^(({(7'h42), (8'ha4)} & ((8'hba) ? (8'hb3) : (7'h42))) ? ((~|(8'ha7)) != ((8'hb7) ? (8'hbe) : (8'hb0))) : (+((8'hbb) <= (8'hbf))))) ? (8'hb3) : (((((8'ha6) == (8'hac)) || ((8'hba) ? (8'hbd) : (8'hb1))) ? (&(^(8'h9f))) : (((7'h42) && (8'hbc)) == ((8'hbf) - (8'hb4)))) ? (&((+(8'hae)) && ((8'h9d) ? (7'h40) : (8'haf)))) : {((!(7'h43)) ? ((8'ha8) && (8'hbc)) : ((7'h41) ? (8'ha5) : (8'hb1))), {((8'ha4) ? (8'hb9) : (8'hb1)), ((8'ha0) ? (8'hb6) : (8'hae))}})), 
parameter param19 = param18)
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h31):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire12;
  input wire [(4'hd):(1'h0)] wire11;
  input wire signed [(4'h8):(1'h0)] wire10;
  input wire signed [(3'h6):(1'h0)] wire9;
  wire [(5'h14):(1'h0)] wire17;
  wire signed [(3'h6):(1'h0)] wire16;
  wire signed [(2'h3):(1'h0)] wire13;
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg14 = (1'h0);
  assign y = {wire17, wire16, wire13, reg15, reg14, (1'h0)};
  assign wire13 = $signed(wire12);
  always
    @(posedge clk) begin
      reg14 <= ((((^wire11) + wire12[(3'h7):(3'h5)]) & $unsigned((~|$unsigned((8'hbe))))) >= ({$signed($signed(wire9))} ?
          ((wire11[(3'h6):(2'h3)] ? $unsigned((7'h44)) : {wire11}) ?
              (wire10[(2'h2):(2'h2)] ?
                  wire9[(2'h3):(1'h0)] : $signed((8'hb8))) : ((+(8'ha5)) ?
                  {wire13,
                      wire13} : wire13[(1'h1):(1'h1)])) : $signed(wire11[(1'h1):(1'h0)])));
      reg15 <= (!(($unsigned($unsigned(wire10)) && {$signed((8'hb5)),
              (wire13 << wire9)}) ?
          $unsigned(wire12[(3'h6):(3'h6)]) : {(!$signed(wire11)),
              $unsigned({(8'haa), wire9})}));
    end
  assign wire16 = $unsigned(({(((8'haa) != wire13) & ((8'hb9) ?
                          (8'hb3) : wire12)),
                      ({wire10} ?
                          (|(7'h44)) : wire9)} >>> {$unsigned({wire10})}));
  assign wire17 = $unsigned((($unsigned((-wire12)) ?
                          ((wire11 - reg15) ?
                              wire10[(1'h1):(1'h1)] : $unsigned(reg15)) : (reg15[(1'h1):(1'h0)] ^ $signed(wire9))) ?
                      (8'ha3) : $signed((((8'hb3) || (8'ha5)) - wire11[(4'hc):(3'h5)]))));
endmodule
