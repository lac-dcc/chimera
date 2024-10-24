module top
#(parameter param87 = {((^(((8'ha4) ? (8'hb0) : (8'ha3)) << (|(8'hb4)))) ? (^~({(8'h9c), (8'ha4)} ? {(8'hae), (8'haa)} : ((8'h9c) ? (8'hbe) : (8'hac)))) : ({(!(8'ha6))} ? (((8'hab) ? (8'hb0) : (8'h9d)) == (^(8'h9e))) : (((8'hb6) != (8'hb0)) >> ((8'hb4) ? (8'hae) : (8'hb8)))))}, 
parameter param88 = ((param87 && (8'hb0)) ? (param87 ? (((^param87) & (^(7'h42))) ? (param87 ? param87 : {param87}) : ((+param87) ? (8'hbb) : param87)) : (~|param87)) : param87))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hd5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire86;
  wire signed [(5'h13):(1'h0)] wire85;
  wire [(4'hf):(1'h0)] wire72;
  wire [(4'hc):(1'h0)] wire70;
  reg [(5'h14):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg82 = (1'h0);
  reg [(3'h6):(1'h0)] reg81 = (1'h0);
  reg [(2'h2):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg79 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg77 = (1'h0);
  reg [(5'h15):(1'h0)] reg76 = (1'h0);
  reg [(4'hd):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg74 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg73 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire72,
                 wire70,
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
                 (1'h0)};
  module4 #() modinst71 (wire70, clk, wire1, wire3, wire0, wire2, (8'ha4));
  assign wire72 = wire3[(2'h3):(2'h2)];
  always
    @(posedge clk) begin
      reg73 <= $unsigned((|(|wire72)));
      reg74 <= (^$signed({{(~^wire72)}}));
      if (($signed(reg73) ?
          wire1 : ((-$signed({wire0, (8'hb9)})) - {(wire1 * $unsigned(wire2)),
              wire1})))
        begin
          reg75 <= wire70;
        end
      else
        begin
          reg75 <= (-$signed((^$signed(((8'h9f) ? (8'hba) : (8'ha0))))));
          reg76 <= (!wire3);
          if (reg74)
            begin
              reg77 <= reg73[(1'h1):(1'h0)];
              reg78 <= {$unsigned((((8'hab) <= $unsigned(reg73)) ?
                      wire2[(2'h3):(2'h2)] : (wire2 >= ((8'haf) ?
                          reg75 : reg76))))};
              reg79 <= $unsigned(wire3[(4'hb):(4'ha)]);
              reg80 <= (+(^~(wire1[(4'h8):(3'h6)] ?
                  ($signed(wire0) <<< wire1[(3'h7):(1'h1)]) : ((reg79 != reg74) ?
                      ((7'h42) + reg73) : $signed(reg79)))));
            end
          else
            begin
              reg77 <= $signed($signed((+$signed(reg78))));
            end
          if ({{((wire70 ? (&reg79) : $unsigned(reg78)) ?
                      ({reg79, wire3} && $signed(reg79)) : $unsigned((8'ha8)))},
              ($signed($unsigned((wire1 >>> reg80))) >= $signed($unsigned((reg76 ^ wire72))))})
            begin
              reg81 <= $signed((reg75[(2'h3):(2'h2)] ^ {((reg76 ?
                      wire3 : reg79) >>> (wire70 >> wire3)),
                  (~&(wire0 ? reg73 : reg73))}));
              reg82 <= ((-reg78[(1'h0):(1'h0)]) ?
                  (((((7'h43) <<< wire70) && (reg81 ? reg77 : wire72)) ?
                          (~^$signed(wire72)) : {$unsigned(wire2), (8'hba)}) ?
                      (wire0 ?
                          (~(reg80 + reg73)) : wire0[(4'ha):(1'h0)]) : {$signed(reg80)}) : $unsigned((~|$signed($signed(reg77)))));
              reg83 <= reg74;
            end
          else
            begin
              reg81 <= reg79;
              reg82 <= (-$unsigned((8'hb6)));
              reg83 <= ($signed({(reg73[(1'h1):(1'h1)] ?
                          (wire2 >= reg73) : {reg79, wire3}),
                      reg82[(3'h4):(2'h3)]}) ?
                  reg80[(1'h1):(1'h1)] : (reg81[(2'h3):(1'h1)] ?
                      (($signed(reg74) ? (wire1 < wire0) : {reg77, reg83}) ?
                          {wire70,
                              $signed((8'ha8))} : $signed((~&(8'ha9)))) : reg75[(4'h9):(3'h6)]));
            end
          reg84 <= reg81;
        end
    end
  assign wire85 = ($signed($signed($signed(((7'h43) ?
                      (8'ha4) : reg78)))) * {wire3, (!(+{wire72}))});
  assign wire86 = (~|$unsigned(reg81));
endmodule

module module4  (y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h144):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire9;
  input wire signed [(3'h6):(1'h0)] wire8;
  input wire signed [(5'h15):(1'h0)] wire7;
  input wire [(4'he):(1'h0)] wire6;
  input wire [(5'h11):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire69;
  wire signed [(4'h8):(1'h0)] wire54;
  wire signed [(3'h7):(1'h0)] wire53;
  wire signed [(3'h7):(1'h0)] wire52;
  wire [(4'h8):(1'h0)] wire50;
  wire [(5'h12):(1'h0)] wire21;
  wire [(5'h15):(1'h0)] wire20;
  wire signed [(3'h5):(1'h0)] wire19;
  wire [(2'h2):(1'h0)] wire18;
  wire signed [(4'hc):(1'h0)] wire15;
  wire [(3'h4):(1'h0)] wire14;
  wire signed [(4'hf):(1'h0)] wire13;
  wire [(3'h7):(1'h0)] wire12;
  reg signed [(3'h7):(1'h0)] reg68 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg67 = (1'h0);
  reg signed [(4'he):(1'h0)] reg66 = (1'h0);
  reg [(5'h11):(1'h0)] reg65 = (1'h0);
  reg [(3'h6):(1'h0)] reg64 = (1'h0);
  reg [(4'he):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg62 = (1'h0);
  reg [(5'h10):(1'h0)] reg61 = (1'h0);
  reg [(2'h2):(1'h0)] reg60 = (1'h0);
  reg [(4'hb):(1'h0)] reg59 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg58 = (1'h0);
  reg [(5'h15):(1'h0)] reg57 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg56 = (1'h0);
  reg [(2'h3):(1'h0)] reg55 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg11 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg17 = (1'h0);
  assign y = {wire69,
                 wire54,
                 wire53,
                 wire52,
                 wire50,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
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
                 reg10,
                 reg11,
                 reg16,
                 reg17,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg10 <= ((+(wire9 ?
          {$unsigned(wire6), wire9[(4'hc):(4'ha)]} : ((wire9 ?
                  (8'haa) : (8'ha3)) ?
              (wire9 ? wire5 : wire9) : $unsigned(wire5)))) << (wire9 & (wire7 ?
          wire5 : wire5[(3'h5):(1'h1)])));
      reg11 <= {{(~{$signed(wire9), ((8'hbd) ? wire7 : reg10)}),
              ({(wire5 ? wire7 : wire8),
                  (wire5 ~^ wire9)} >> ({wire8} != (wire7 ? wire6 : wire7)))}};
    end
  assign wire12 = (~^(~^$unsigned({$signed(wire9),
                      ((8'h9e) ? wire6 : reg10)})));
  assign wire13 = ($signed(reg11[(2'h3):(2'h3)]) ?
                      (($unsigned((reg11 ? wire8 : reg11)) ?
                          (^~(!(8'h9c))) : (~^{reg10})) <<< {wire7[(1'h0):(1'h0)],
                          ((|reg10) ?
                              (!wire5) : (~wire5))}) : $signed(($unsigned((wire7 ?
                              wire9 : reg11)) ?
                          $signed((wire9 >= (8'haa))) : (8'haa))));
  assign wire14 = $signed((~|(^~(reg11[(3'h6):(1'h0)] ?
                      (^reg11) : wire5[(4'h9):(3'h5)]))));
  assign wire15 = wire5[(4'h8):(3'h6)];
  always
    @(posedge clk) begin
      reg16 <= (~$unsigned(wire15[(2'h2):(2'h2)]));
      reg17 <= $signed(($signed(($signed(reg16) ?
          $signed(reg16) : (wire9 ? wire8 : (8'hbe)))) < {(~|$signed(reg11)),
          ((wire9 <= wire15) ? (^~reg10) : $unsigned(reg10))}));
    end
  assign wire18 = (~^{wire13});
  assign wire19 = $signed($signed($unsigned($unsigned((8'had)))));
  assign wire20 = $unsigned(($signed(wire14[(1'h1):(1'h0)]) - {$signed((reg17 ^ wire8))}));
  assign wire21 = (+$signed($unsigned(($unsigned(wire9) ?
                      $unsigned(wire19) : wire9))));
  module22 #() modinst51 (wire50, clk, reg16, wire21, wire7, wire6, wire15);
  assign wire52 = $signed((&reg10));
  assign wire53 = ({{{reg17[(3'h7):(3'h4)]}}} < reg17[(4'ha):(4'ha)]);
  assign wire54 = ((~^$unsigned(($signed(wire7) || wire19[(2'h3):(2'h2)]))) * $signed($signed((~&(^reg16)))));
  always
    @(posedge clk) begin
      reg55 <= $signed((!(~^(|$signed(wire50)))));
      if ($signed(wire14[(1'h1):(1'h1)]))
        begin
          reg56 <= $signed((8'ha3));
          reg57 <= $unsigned($unsigned($unsigned(($signed(reg55) - wire52[(1'h1):(1'h0)]))));
          reg58 <= $signed((($unsigned(((7'h40) ? wire20 : reg16)) ?
              (+$unsigned(wire6)) : reg55[(2'h3):(2'h3)]) << ((wire52[(1'h1):(1'h0)] ?
                  (^reg11) : wire50) ?
              ({(8'ha1), (8'hbb)} ?
                  reg17[(4'h8):(2'h2)] : $signed(wire15)) : ((&(8'hb7)) ?
                  (^~reg17) : (wire21 ^ reg10)))));
          reg59 <= (reg55[(1'h0):(1'h0)] ?
              $signed((((wire19 ? wire20 : reg57) < ((7'h44) ?
                  wire50 : reg56)) * $signed((&reg11)))) : reg10[(2'h2):(2'h2)]);
        end
      else
        begin
          if ((~^(&{reg16[(2'h3):(2'h3)]})))
            begin
              reg56 <= (wire52 ?
                  $signed(reg58[(2'h2):(1'h1)]) : (wire5[(4'ha):(3'h6)] >> $unsigned((8'haf))));
              reg57 <= reg56[(3'h4):(1'h0)];
            end
          else
            begin
              reg56 <= (~|((wire9 >>> (-$signed(reg56))) << $signed(($signed(wire20) | $unsigned(reg11)))));
              reg57 <= (^(&(^((!wire50) ? (~|wire5) : $signed((8'hb4))))));
              reg58 <= wire54[(3'h6):(1'h0)];
            end
          reg59 <= (8'had);
          reg60 <= $signed($unsigned(((((8'ha4) + wire15) ?
                  $unsigned(wire13) : ((8'hae) || wire21)) ?
              ((reg55 <<< reg10) ?
                  reg16[(2'h3):(1'h0)] : $unsigned(reg16)) : (8'ha2))));
          reg61 <= ((^~$signed($unsigned(wire8))) ^ (&reg10));
        end
      reg62 <= (-wire12[(1'h0):(1'h0)]);
      reg63 <= wire6[(4'hc):(4'h8)];
      if (($unsigned(($unsigned((wire54 ? wire5 : reg62)) ?
          reg56[(3'h5):(1'h1)] : (~&reg63))) == reg11))
        begin
          reg64 <= (&$signed((wire5[(1'h0):(1'h0)] >>> wire53)));
          reg65 <= wire9[(3'h7):(3'h4)];
          reg66 <= {reg17};
          reg67 <= (!(7'h40));
          reg68 <= (((((reg65 ? wire52 : reg65) >= {wire9}) ?
                      reg66[(4'hb):(3'h5)] : (reg61 ?
                          $signed(wire52) : $signed(wire8))) ?
                  reg16[(2'h2):(2'h2)] : reg58[(1'h0):(1'h0)]) ?
              (wire52[(1'h1):(1'h1)] ?
                  (($signed((8'ha5)) ~^ (wire13 ? reg62 : wire14)) ?
                      (reg60[(1'h1):(1'h1)] ?
                          $unsigned(reg56) : wire20) : $unsigned(reg59)) : (&reg55)) : $signed($signed(((+reg11) ^ wire52))));
        end
      else
        begin
          if (wire12)
            begin
              reg64 <= reg62[(2'h3):(1'h0)];
              reg65 <= reg68;
            end
          else
            begin
              reg64 <= wire15;
              reg65 <= ((reg10 ?
                      (|reg17[(1'h0):(1'h0)]) : {wire13[(4'hb):(4'h8)]}) ?
                  $unsigned((+({wire21,
                      wire21} || (8'haf)))) : {reg68[(1'h1):(1'h1)]});
              reg66 <= reg11;
            end
          reg67 <= $unsigned($signed({wire12[(1'h0):(1'h0)],
              $unsigned($signed(wire12))}));
        end
    end
  assign wire69 = (wire52[(1'h0):(1'h0)] & wire50[(1'h1):(1'h0)]);
endmodule

module module22
#(parameter param48 = {((~&((!(8'hb8)) ? ((8'ha9) ~^ (8'hac)) : ((7'h40) || (8'hb2)))) ? (!{(+(8'hbf))}) : {(-(^(8'haf)))})}, 
parameter param49 = ((param48 ? ((param48 > ((7'h41) ? param48 : param48)) ? (param48 ? (param48 > param48) : (param48 ? param48 : param48)) : (param48 ^ (param48 * param48))) : (((param48 ? param48 : param48) == (param48 ? param48 : param48)) ? (^(param48 ^ param48)) : param48)) ? (((8'h9c) >= param48) <<< (((~^param48) ~^ ((8'h9c) - param48)) << param48)) : ((((|(8'hb1)) ? (^~param48) : (param48 > param48)) ^~ (8'h9f)) != param48)))
(y, clk, wire27, wire26, wire25, wire24, wire23);
  output wire [(32'hc9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire27;
  input wire [(5'h12):(1'h0)] wire26;
  input wire signed [(5'h15):(1'h0)] wire25;
  input wire [(4'he):(1'h0)] wire24;
  input wire [(4'hc):(1'h0)] wire23;
  wire signed [(5'h13):(1'h0)] wire47;
  wire [(4'hc):(1'h0)] wire40;
  wire signed [(4'h8):(1'h0)] wire39;
  wire [(3'h4):(1'h0)] wire38;
  wire signed [(4'hb):(1'h0)] wire37;
  wire signed [(5'h12):(1'h0)] wire36;
  wire signed [(5'h14):(1'h0)] wire35;
  wire signed [(4'ha):(1'h0)] wire34;
  wire [(4'h9):(1'h0)] wire33;
  wire [(4'hc):(1'h0)] wire29;
  wire signed [(4'h9):(1'h0)] wire28;
  reg signed [(2'h2):(1'h0)] reg46 = (1'h0);
  reg [(3'h6):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg43 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg42 = (1'h0);
  reg [(4'hb):(1'h0)] reg41 = (1'h0);
  reg [(3'h4):(1'h0)] reg32 = (1'h0);
  reg [(3'h4):(1'h0)] reg31 = (1'h0);
  reg [(4'ha):(1'h0)] reg30 = (1'h0);
  assign y = {wire47,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire29,
                 wire28,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg32,
                 reg31,
                 reg30,
                 (1'h0)};
  assign wire28 = (!wire25[(4'he):(4'hc)]);
  assign wire29 = (((^{$unsigned(wire26)}) ?
                          $signed({$unsigned(wire25),
                              (~^wire25)}) : ($unsigned(wire23) << wire27)) ?
                      (~^wire24) : $unsigned({(wire27 ?
                              ((7'h43) != wire26) : $signed(wire27))}));
  always
    @(posedge clk) begin
      reg30 <= $unsigned($unsigned($unsigned(wire25[(4'h8):(2'h3)])));
      reg31 <= {{(~&($signed(wire23) & wire29)), wire29[(4'h8):(2'h3)]},
          wire29[(3'h4):(2'h3)]};
      reg32 <= wire28;
    end
  assign wire33 = (+(|$unsigned({wire24})));
  assign wire34 = wire24[(4'hc):(2'h3)];
  assign wire35 = (((wire24 ?
                      (wire34[(1'h1):(1'h1)] >> (+(8'ha8))) : $unsigned((reg30 || reg30))) || {((~^reg30) ?
                          wire33 : wire28[(2'h3):(1'h1)])}) & (({(+wire25),
                              wire25} ?
                          $signed(((8'hbd) <= (8'haa))) : (wire29[(4'hc):(2'h2)] < $signed(wire27))) ?
                      $unsigned($signed((+wire27))) : (($unsigned(wire33) ^~ (reg32 ?
                              wire24 : (8'hbb))) ?
                          wire25 : (|{wire24, wire27}))));
  assign wire36 = wire24[(4'h8):(1'h1)];
  assign wire37 = $unsigned((+(((reg30 << wire34) & (reg31 >= (7'h44))) & $unsigned((wire24 ?
                      reg32 : wire34)))));
  assign wire38 = (wire33[(2'h3):(1'h0)] ?
                      $signed(wire36[(4'h9):(4'h8)]) : {wire33[(3'h7):(3'h4)]});
  assign wire39 = wire38;
  assign wire40 = reg30;
  always
    @(posedge clk) begin
      reg41 <= $signed($signed((wire24[(2'h2):(1'h1)] > wire34)));
      reg42 <= (8'hb3);
      reg43 <= $unsigned((~|wire34[(2'h2):(1'h0)]));
      reg44 <= (wire24 ?
          $signed(((reg32[(3'h4):(2'h2)] ?
              (~&wire40) : wire34) || ((-wire29) & wire36))) : $signed((reg41[(4'h8):(4'h8)] ?
              $unsigned(wire29[(2'h2):(2'h2)]) : $unsigned(wire23[(1'h1):(1'h0)]))));
    end
  always
    @(posedge clk) begin
      reg45 <= (+(!$signed($unsigned(wire40[(4'h9):(3'h7)]))));
      reg46 <= reg41[(3'h7):(1'h0)];
    end
  assign wire47 = wire39[(2'h2):(1'h0)];
endmodule
