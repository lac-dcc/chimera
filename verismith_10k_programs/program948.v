module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h85):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire4;
  input wire [(3'h7):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire68;
  wire [(4'h9):(1'h0)] wire67;
  wire [(4'he):(1'h0)] wire56;
  reg [(2'h2):(1'h0)] reg66 = (1'h0);
  reg [(4'hc):(1'h0)] reg65 = (1'h0);
  reg signed [(4'he):(1'h0)] reg64 = (1'h0);
  reg [(5'h13):(1'h0)] reg63 = (1'h0);
  reg [(4'hb):(1'h0)] reg62 = (1'h0);
  reg [(5'h11):(1'h0)] reg61 = (1'h0);
  reg [(3'h4):(1'h0)] reg60 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg58 = (1'h0);
  assign y = {wire68,
                 wire67,
                 wire56,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 (1'h0)};
  module5 #() modinst57 (wire56, clk, wire4, wire0, wire2, wire1);
  always
    @(posedge clk) begin
      if ((+$signed($signed($unsigned((wire1 ? wire2 : wire4))))))
        begin
          reg58 <= (~|($unsigned((((8'hbf) ? wire2 : (7'h41)) ?
              wire1[(1'h1):(1'h1)] : (wire2 || (8'ha8)))) && {$unsigned({wire1,
                  wire2})}));
          reg59 <= (wire2[(2'h3):(1'h0)] ?
              $signed(wire1[(5'h10):(4'hc)]) : $unsigned((!((wire1 || wire1) ?
                  (wire1 >= wire56) : wire0[(4'ha):(4'ha)]))));
          reg60 <= (($unsigned((~^{wire0})) >= $signed((wire3 != {wire3,
                  wire56}))) ?
              ((+(|(8'ha0))) ?
                  $signed((-(wire2 ?
                      wire0 : wire3))) : (($signed(wire2) >>> {wire56}) ?
                      wire4[(1'h1):(1'h1)] : (~&(-wire1)))) : $unsigned(((~^(~wire1)) ?
                  wire2 : wire4)));
          reg61 <= ($unsigned(reg58[(3'h4):(2'h3)]) ?
              $signed(((|$signed(reg60)) >>> (~^{wire2,
                  wire4}))) : $signed(wire4[(1'h0):(1'h0)]));
        end
      else
        begin
          if (($unsigned(wire3[(1'h1):(1'h0)]) >> wire0))
            begin
              reg58 <= ((reg58[(3'h6):(2'h3)] ?
                      (~|(+(|reg61))) : ($unsigned($signed((8'h9e))) ?
                          (&(reg58 && reg58)) : {(reg59 && (7'h44))})) ?
                  wire56 : (8'haa));
              reg59 <= ($unsigned((($signed((7'h44)) > wire3[(3'h4):(1'h1)]) ?
                      reg58 : ((reg60 ? wire4 : wire1) ? {wire0} : reg61))) ?
                  $unsigned((-($signed(wire4) & wire56))) : $signed(wire2[(4'h9):(2'h2)]));
              reg60 <= wire0;
              reg61 <= $unsigned(wire0[(4'ha):(3'h5)]);
            end
          else
            begin
              reg58 <= (|wire2);
              reg59 <= ((~&(~^$signed((^reg61)))) ? {(^~reg61)} : (7'h40));
              reg60 <= reg60;
            end
        end
      if ((!(-wire0[(1'h1):(1'h1)])))
        begin
          reg62 <= (8'hb0);
          reg63 <= (8'hb6);
          reg64 <= wire2;
          reg65 <= {(reg64[(4'hc):(3'h4)] * ((~|$unsigned(wire56)) ?
                  reg61 : (^(&reg58))))};
          reg66 <= reg58[(1'h0):(1'h0)];
        end
      else
        begin
          reg62 <= wire3[(3'h6):(3'h5)];
          reg63 <= (8'hbc);
          reg64 <= ($signed((&wire3[(2'h3):(1'h0)])) && (reg65 >>> reg58));
        end
    end
  assign wire67 = ($unsigned({(wire3 != reg59[(2'h3):(2'h3)])}) ?
                      wire4 : ((+(+$signed(wire3))) ~^ reg60));
  assign wire68 = (wire3 | $unsigned($unsigned($unsigned((wire3 >> wire67)))));
endmodule

module module5
#(parameter param54 = (({(((8'hba) == (8'h9c)) >= ((8'ha6) <<< (8'hb7)))} & ((((7'h41) ^~ (8'hbd)) ? ((8'hac) << (8'hb6)) : ((8'hbd) ? (8'ha6) : (8'hac))) == ((^(8'hbe)) ? (~&(8'hba)) : {(8'hbd)}))) ? ((!{((7'h42) ? (8'hb4) : (8'hb2))}) ^~ (|(((7'h44) ? (8'hae) : (8'ha5)) ? ((8'hbd) ? (8'h9c) : (8'hbf)) : {(8'ha4)}))) : (|(|{{(8'hba)}}))), 
parameter param55 = ((param54 ? param54 : param54) && (8'ha5)))
(y, clk, wire6, wire7, wire8, wire9);
  output wire [(32'h97):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire6;
  input wire signed [(5'h13):(1'h0)] wire7;
  input wire [(4'he):(1'h0)] wire8;
  input wire [(5'h13):(1'h0)] wire9;
  wire signed [(4'he):(1'h0)] wire10;
  wire [(3'h5):(1'h0)] wire11;
  wire [(4'he):(1'h0)] wire12;
  wire [(4'hb):(1'h0)] wire13;
  wire signed [(5'h11):(1'h0)] wire14;
  wire [(3'h4):(1'h0)] wire15;
  wire signed [(5'h12):(1'h0)] wire16;
  wire [(3'h7):(1'h0)] wire17;
  wire signed [(4'h9):(1'h0)] wire18;
  wire signed [(4'hc):(1'h0)] wire19;
  wire signed [(5'h14):(1'h0)] wire20;
  wire [(2'h2):(1'h0)] wire21;
  wire signed [(4'hc):(1'h0)] wire22;
  wire signed [(3'h5):(1'h0)] wire52;
  assign y = {wire10,
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
                 wire22,
                 wire52,
                 (1'h0)};
  assign wire10 = wire7;
  assign wire11 = {(~^(~&$signed({wire6})))};
  assign wire12 = wire9[(3'h6):(3'h5)];
  assign wire13 = $signed($unsigned((~&(^~$signed(wire11)))));
  assign wire14 = $unsigned({(-wire6)});
  assign wire15 = (&$unsigned(($signed((wire11 ? wire6 : wire14)) * (|wire9))));
  assign wire16 = $unsigned($unsigned($unsigned($signed((|wire11)))));
  assign wire17 = ({wire12[(3'h7):(3'h4)], wire15} << (wire8 ?
                      wire13[(1'h1):(1'h0)] : $unsigned($unsigned((wire6 & wire9)))));
  assign wire18 = $signed((!wire16));
  assign wire19 = (~^wire14[(1'h0):(1'h0)]);
  assign wire20 = ($signed((+($unsigned(wire16) ?
                      (wire19 > wire17) : {wire19}))) == ($unsigned($unsigned($unsigned(wire15))) & $signed(((wire19 ?
                          wire15 : wire13) ?
                      (wire13 ? wire18 : wire8) : wire17))));
  assign wire21 = wire7;
  assign wire22 = (wire16[(1'h0):(1'h0)] * wire14);
  module23 #() modinst53 (.wire25(wire18), .wire24(wire16), .wire27(wire19), .wire28(wire22), .wire26(wire10), .y(wire52), .clk(clk));
endmodule

module module23
#(parameter param50 = ((+((7'h43) >>> {(!(8'hbb))})) < (~|(((!(8'h9d)) ? ((8'hbf) ? (8'ha4) : (8'ha8)) : ((8'h9f) ? (7'h41) : (8'hb6))) ? (^(8'ha8)) : (((7'h44) ? (8'hbb) : (8'hb5)) ? ((8'haa) ? (8'hbd) : (8'h9d)) : {(8'h9c), (8'ha8)})))), 
parameter param51 = (-{{((param50 ? param50 : param50) <<< (param50 ? param50 : param50))}}))
(y, clk, wire28, wire27, wire26, wire25, wire24);
  output wire [(32'heb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire28;
  input wire signed [(4'hc):(1'h0)] wire27;
  input wire signed [(4'he):(1'h0)] wire26;
  input wire [(3'h6):(1'h0)] wire25;
  input wire signed [(4'hc):(1'h0)] wire24;
  wire signed [(3'h6):(1'h0)] wire48;
  wire [(4'h8):(1'h0)] wire47;
  wire signed [(2'h3):(1'h0)] wire46;
  wire [(5'h12):(1'h0)] wire45;
  wire [(5'h15):(1'h0)] wire39;
  wire [(2'h3):(1'h0)] wire38;
  wire [(5'h12):(1'h0)] wire37;
  wire signed [(4'hd):(1'h0)] wire36;
  wire signed [(5'h15):(1'h0)] wire35;
  wire signed [(3'h6):(1'h0)] wire34;
  wire [(5'h12):(1'h0)] wire33;
  wire signed [(2'h3):(1'h0)] wire32;
  wire signed [(2'h2):(1'h0)] wire31;
  wire [(5'h13):(1'h0)] wire30;
  wire [(3'h4):(1'h0)] wire29;
  reg [(5'h13):(1'h0)] reg49 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg43 = (1'h0);
  reg [(5'h14):(1'h0)] reg42 = (1'h0);
  reg [(2'h2):(1'h0)] reg41 = (1'h0);
  reg [(3'h4):(1'h0)] reg40 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 reg49,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 (1'h0)};
  assign wire29 = ($unsigned(wire25[(2'h2):(2'h2)]) ?
                      ((~|(+$signed(wire24))) ?
                          ($unsigned($unsigned(wire28)) >> $signed({wire27})) : $signed(((wire26 != wire28) ~^ $unsigned(wire28)))) : wire25);
  assign wire30 = (8'haa);
  assign wire31 = (8'hb0);
  assign wire32 = (wire26[(4'he):(4'he)] ?
                      (&(((^wire24) ?
                          $unsigned(wire31) : (wire26 & wire28)) <= wire27[(3'h7):(3'h4)])) : (((~|((7'h40) ?
                              wire24 : wire29)) ?
                          $unsigned(wire29[(3'h4):(3'h4)]) : wire29[(1'h1):(1'h0)]) || wire31));
  assign wire33 = $unsigned((!({$unsigned(wire27),
                      (|wire24)} | (~$signed(wire32)))));
  assign wire34 = {wire27};
  assign wire35 = {$unsigned($signed({$signed(wire33), wire28}))};
  assign wire36 = (wire34 ?
                      (^~{(wire35 ?
                              wire30[(3'h6):(3'h6)] : (8'ha6))}) : $unsigned($signed(((wire31 > wire34) < wire31))));
  assign wire37 = wire28[(1'h1):(1'h0)];
  assign wire38 = (wire28[(3'h6):(1'h1)] ?
                      (($signed((wire33 | wire24)) ?
                          $signed($unsigned(wire27)) : {(wire24 >> wire30),
                              wire31[(2'h2):(1'h0)]}) && (&((+wire25) > $signed(wire28)))) : (wire25 | (&(&$unsigned(wire35)))));
  assign wire39 = $signed(wire25[(3'h6):(3'h6)]);
  always
    @(posedge clk) begin
      if ($unsigned(wire28))
        begin
          reg40 <= $unsigned($unsigned((8'hbb)));
          reg41 <= ({wire25} | wire32[(1'h1):(1'h1)]);
        end
      else
        begin
          reg40 <= {$unsigned($unsigned(wire27[(4'ha):(3'h4)])),
              (|$signed((^~wire34)))};
        end
      reg42 <= $signed(reg41[(1'h1):(1'h0)]);
      reg43 <= (!$unsigned((wire27 >>> wire35[(5'h15):(5'h15)])));
      reg44 <= ($signed((!(wire31 ^~ {wire25}))) ?
          wire29[(1'h0):(1'h0)] : wire35);
    end
  assign wire45 = wire28;
  assign wire46 = reg40[(2'h2):(1'h1)];
  assign wire47 = (8'ha1);
  assign wire48 = $unsigned((-{reg44[(3'h7):(2'h2)]}));
  always
    @(posedge clk) begin
      reg49 <= {(((!(wire38 >= reg43)) ?
                  ((~wire36) && $unsigned(wire26)) : $signed((8'h9e))) ?
              $signed((~wire37[(3'h6):(2'h2)])) : ((reg40 ?
                      $unsigned(wire37) : (wire36 ? (8'hb3) : wire39)) ?
                  (((7'h42) >>> reg40) ?
                      $signed(reg40) : (wire29 ^~ wire39)) : ((wire33 >> (8'hbd)) ?
                      (~wire46) : $signed(reg40)))),
          ($signed(wire38) ?
              ((8'ha2) & ({(8'ha4),
                  wire33} ^~ wire33)) : wire24[(2'h2):(2'h2)])};
    end
endmodule
