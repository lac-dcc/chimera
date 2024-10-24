module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hc1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire4;
  wire signed [(4'ha):(1'h0)] wire72;
  wire signed [(5'h11):(1'h0)] wire71;
  wire [(5'h13):(1'h0)] wire70;
  wire [(5'h12):(1'h0)] wire69;
  wire signed [(2'h2):(1'h0)] wire5;
  wire [(4'ha):(1'h0)] wire15;
  wire [(4'hf):(1'h0)] wire67;
  reg [(4'he):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg12 = (1'h0);
  reg [(3'h5):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg9 = (1'h0);
  reg [(4'h8):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg6 = (1'h0);
  assign y = {wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire5,
                 wire15,
                 wire67,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = {wire1[(4'hf):(3'h6)]};
  always
    @(posedge clk) begin
      reg6 <= ($signed(($signed({wire0, wire5}) * wire1)) ?
          $unsigned($signed((+(wire0 & wire2)))) : $unsigned(wire5));
      reg7 <= wire2[(3'h6):(2'h2)];
      reg8 <= $unsigned($unsigned(wire5[(1'h0):(1'h0)]));
      reg9 <= {(wire4 ? (+wire4) : wire5),
          (-{((wire3 | wire5) ? (8'hae) : {wire5, (7'h43)}),
              $unsigned($signed(wire0))})};
    end
  always
    @(posedge clk) begin
      reg10 <= reg7[(3'h6):(3'h4)];
    end
  always
    @(posedge clk) begin
      reg11 <= {(((~&(wire3 + wire5)) & ($signed(reg9) ?
              $signed(wire2) : wire2)) ~^ (reg7 >> $unsigned((~|(8'hb4)))))};
      reg12 <= wire2;
      reg13 <= reg6[(2'h3):(2'h2)];
      reg14 <= ((-$signed(wire4)) ?
          wire4 : {(reg8[(2'h2):(1'h0)] ?
                  $signed((reg11 ? wire5 : reg8)) : $signed($unsigned(reg8)))});
    end
  assign wire15 = $signed($unsigned(reg12));
  module16 #() modinst68 (wire67, clk, reg9, reg6, wire15, reg10, reg14);
  assign wire69 = $unsigned($unsigned((((wire67 ?
                      wire4 : (7'h40)) ^ reg12) * reg11[(3'h5):(2'h3)])));
  assign wire70 = reg12[(1'h1):(1'h1)];
  assign wire71 = reg14[(4'he):(4'he)];
  assign wire72 = reg11[(2'h2):(1'h1)];
endmodule

module module16
#(parameter param66 = ((|(-((~(8'hb0)) ? (-(8'hb8)) : (8'hbb)))) < ({{((8'hae) ? (8'ha5) : (8'ha2)), ((8'hb0) > (8'hbe))}} ? ((!((8'hb4) ? (8'hac) : (8'hbe))) != {(~&(8'h9f))}) : ((-{(8'ha6)}) != (~(7'h42))))))
(y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'hef):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire21;
  input wire [(4'h8):(1'h0)] wire20;
  input wire signed [(4'ha):(1'h0)] wire19;
  input wire signed [(5'h13):(1'h0)] wire18;
  input wire signed [(4'he):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire65;
  wire [(3'h7):(1'h0)] wire64;
  wire [(2'h2):(1'h0)] wire63;
  wire signed [(4'he):(1'h0)] wire50;
  wire signed [(5'h15):(1'h0)] wire49;
  wire signed [(4'hf):(1'h0)] wire48;
  wire [(3'h4):(1'h0)] wire47;
  wire signed [(2'h3):(1'h0)] wire46;
  wire [(3'h6):(1'h0)] wire45;
  wire signed [(4'h8):(1'h0)] wire43;
  reg [(3'h7):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg59 = (1'h0);
  reg [(4'hc):(1'h0)] reg58 = (1'h0);
  reg [(4'hd):(1'h0)] reg57 = (1'h0);
  reg [(5'h15):(1'h0)] reg56 = (1'h0);
  reg [(5'h14):(1'h0)] reg55 = (1'h0);
  reg [(3'h5):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg53 = (1'h0);
  reg [(2'h2):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg51 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire63,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire43,
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
                 (1'h0)};
  module22 #() modinst44 (wire43, clk, wire19, wire20, wire17, wire18);
  assign wire45 = wire21;
  assign wire46 = $signed($signed(wire17));
  assign wire47 = $unsigned({wire20});
  assign wire48 = wire18[(1'h0):(1'h0)];
  assign wire49 = (($signed(((^~wire18) >> $unsigned(wire45))) ?
                          (7'h40) : $unsigned($signed($unsigned(wire48)))) ?
                      $signed(($unsigned({wire18}) ^ wire21)) : $unsigned(wire48));
  assign wire50 = ((~^(~|$signed($unsigned(wire45)))) >= {wire19, (|wire46)});
  always
    @(posedge clk) begin
      if ((+$unsigned($signed(wire20[(2'h3):(2'h3)]))))
        begin
          reg51 <= ((~|$signed((~^(wire19 * wire48)))) & (^~$unsigned((|((8'ha8) ?
              wire19 : (8'ha4))))));
          if ($unsigned($signed((wire20[(2'h2):(2'h2)] <= $unsigned(wire20[(2'h3):(2'h2)])))))
            begin
              reg52 <= wire19;
              reg53 <= wire47;
              reg54 <= $unsigned((~|{((wire47 >> wire49) ?
                      (wire46 ? wire20 : wire50) : wire43)}));
              reg55 <= {(8'h9f)};
              reg56 <= $unsigned((^(reg51[(2'h2):(1'h1)] ?
                  (wire20 | $signed((8'hac))) : ((-wire18) ?
                      (reg52 ? wire18 : wire18) : (wire17 ?
                          wire20 : wire19)))));
            end
          else
            begin
              reg52 <= $signed(({((reg56 ?
                      wire19 : wire17) < wire19[(4'h9):(3'h7)])} >>> $unsigned(((wire21 ?
                      reg53 : wire45) ?
                  wire49 : $unsigned(reg52)))));
              reg53 <= ((!(8'hbd)) >= ((~$unsigned(((8'h9f) ?
                  wire20 : reg54))) == (({reg53, reg52} ?
                      (wire50 == wire49) : $unsigned((8'h9f))) ?
                  $unsigned(wire20[(3'h4):(2'h3)]) : ($unsigned(wire47) >> $unsigned(wire20)))));
              reg54 <= $signed(wire17[(4'hb):(4'ha)]);
              reg55 <= $signed((+{$signed({reg54}),
                  ((8'ha0) ? $signed(wire49) : wire17[(2'h2):(1'h0)])}));
            end
        end
      else
        begin
          reg51 <= $signed((~wire19));
          reg52 <= wire48;
          reg53 <= reg51[(1'h1):(1'h0)];
          reg54 <= $signed((wire48[(3'h7):(1'h0)] * (!(~&$unsigned(reg52)))));
        end
      reg57 <= $signed({$unsigned((wire47[(2'h3):(2'h2)] ?
              $signed((8'ha3)) : (~&wire47))),
          $unsigned((~|reg56[(4'hc):(3'h5)]))});
      reg58 <= $unsigned($signed({wire46[(1'h0):(1'h0)],
          wire49[(5'h12):(5'h10)]}));
      if (wire46[(2'h2):(1'h1)])
        begin
          reg59 <= wire43[(3'h6):(1'h1)];
        end
      else
        begin
          reg59 <= $unsigned($signed((reg52 ?
              ((wire50 ?
                  (7'h41) : wire19) >> wire45[(1'h1):(1'h0)]) : (wire46 | $unsigned(wire43)))));
          reg60 <= (($signed((^~$unsigned(reg51))) ~^ ((&$unsigned(reg59)) - {{(7'h44)}})) ?
              $signed($signed($signed((~|(8'hb8))))) : reg59);
          reg61 <= ((wire17[(3'h6):(2'h2)] ?
              $unsigned($unsigned(wire17[(4'h9):(3'h5)])) : (wire46[(1'h0):(1'h0)] ?
                  wire17 : reg53[(1'h1):(1'h1)])) && ($unsigned($signed(wire17)) ?
              reg58 : (wire46[(2'h3):(1'h0)] * $unsigned({wire19, reg53}))));
        end
      reg62 <= {$signed(reg57),
          ($unsigned($unsigned((wire43 <<< reg52))) ?
              wire48 : wire46[(2'h2):(1'h0)])};
    end
  assign wire63 = wire45[(1'h0):(1'h0)];
  assign wire64 = $unsigned($signed(($unsigned($signed(reg55)) <= (|((8'h9d) * wire21)))));
  assign wire65 = $unsigned(wire45[(3'h6):(2'h3)]);
endmodule

module module22
#(parameter param41 = (~&({(^~((7'h40) <= (8'hbf)))} | (((8'hab) >>> {(8'ha1)}) ? (+((8'hb6) ? (7'h40) : (7'h44))) : (!(!(8'haf)))))), 
parameter param42 = ((!((~&(^param41)) ? (~|{param41, (8'hae)}) : {{param41, param41}})) ? ({{(param41 ^~ param41), {param41, param41}}, ((param41 ~^ param41) && (^param41))} ? (-(^~param41)) : (8'ha8)) : param41))
(y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'hb0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire26;
  input wire signed [(4'h8):(1'h0)] wire25;
  input wire signed [(4'he):(1'h0)] wire24;
  input wire signed [(4'h8):(1'h0)] wire23;
  wire [(4'hb):(1'h0)] wire40;
  wire [(3'h6):(1'h0)] wire39;
  wire [(5'h13):(1'h0)] wire38;
  wire [(5'h11):(1'h0)] wire37;
  wire [(4'hb):(1'h0)] wire36;
  wire signed [(4'he):(1'h0)] wire35;
  wire signed [(4'h9):(1'h0)] wire34;
  wire signed [(4'hb):(1'h0)] wire33;
  wire signed [(4'hc):(1'h0)] wire32;
  wire [(2'h3):(1'h0)] wire31;
  wire [(5'h12):(1'h0)] wire30;
  wire signed [(5'h11):(1'h0)] wire29;
  wire signed [(4'hf):(1'h0)] wire28;
  wire [(4'hc):(1'h0)] wire27;
  assign y = {wire40,
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
                 wire28,
                 wire27,
                 (1'h0)};
  assign wire27 = ($signed(({(wire25 << wire24)} <<< (((8'h9f) ^ wire25) < (~&wire24)))) ?
                      wire25[(1'h1):(1'h0)] : wire26[(2'h3):(1'h1)]);
  assign wire28 = {((8'ha8) << ($unsigned($signed(wire25)) && $unsigned(wire24))),
                      (+{(8'ha7)})};
  assign wire29 = (+((^($unsigned(wire28) ?
                      wire23 : {wire27, wire28})) | wire26[(4'h8):(3'h6)]));
  assign wire30 = wire25[(1'h1):(1'h0)];
  assign wire31 = wire29;
  assign wire32 = wire24;
  assign wire33 = $unsigned((((+wire26[(4'h8):(4'h8)]) * (~{wire31, wire27})) ?
                      $signed((wire32 < wire32[(3'h4):(2'h3)])) : (wire27 ?
                          $signed(wire31[(2'h2):(2'h2)]) : $signed(wire25))));
  assign wire34 = (wire23[(2'h2):(2'h2)] * wire26);
  assign wire35 = (((wire24 ?
                      ((wire24 ^~ wire24) ?
                          $signed(wire34) : (wire27 ?
                              wire24 : wire28)) : wire34) - $unsigned(wire34)) < (~&($signed(((8'ha3) ?
                      wire28 : wire23)) <<< (wire25[(3'h4):(2'h2)] << (wire29 ?
                      wire30 : wire31)))));
  assign wire36 = wire29;
  assign wire37 = $unsigned((wire33 | $signed($unsigned({(8'h9d)}))));
  assign wire38 = (($signed(({wire30,
                          (8'ha0)} <= $unsigned(wire23))) < (8'h9d)) ?
                      ((((wire28 ? wire27 : wire35) ?
                                  $unsigned(wire27) : $signed(wire32)) ?
                              (~^wire34[(1'h1):(1'h1)]) : wire25[(4'h8):(3'h6)]) ?
                          ({$unsigned((8'hba)), $signed((8'hae))} ?
                              ($signed((8'hac)) && (~^wire28)) : (~|$unsigned((8'hae)))) : (!wire26)) : wire37[(4'hf):(4'h9)]);
  assign wire39 = (wire26 ?
                      (^(wire30 >= ((wire30 ?
                          wire33 : wire32) <= (wire38 <<< wire23)))) : $unsigned(wire32));
  assign wire40 = (8'haf);
endmodule
