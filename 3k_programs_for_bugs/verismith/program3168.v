module top
#(parameter param90 = ((({{(8'haa)}, ((8'h9d) << (8'hbf))} * (~|((8'ha0) ? (8'ha9) : (8'hb6)))) ? {(~|((8'h9e) & (7'h42))), (((8'hab) > (8'hab)) ? ((8'hb4) ? (8'h9e) : (8'haa)) : (~^(8'haf)))} : (((^(8'ha9)) ? {(8'h9d)} : ((8'hb2) & (8'haa))) << {{(7'h40)}, {(7'h41)}})) - (|{(!((8'hb1) <<< (8'ha1))), ((8'hb4) <= ((8'hb5) ? (8'ha6) : (8'h9f)))})))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h47):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire0;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire4;
  wire [(4'hc):(1'h0)] wire87;
  wire signed [(3'h4):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire7;
  wire [(4'hc):(1'h0)] wire21;
  reg [(4'h9):(1'h0)] reg89 = (1'h0);
  assign y = {wire87, wire5, wire6, wire7, wire21, reg89, (1'h0)};
  assign wire5 = (^~(+wire1[(3'h4):(2'h2)]));
  assign wire6 = ((($signed(wire0[(4'h8):(3'h5)]) ?
                         (8'ha4) : (~((8'h9f) ? wire2 : (8'hb4)))) ?
                     wire4 : {$signed(wire5[(2'h3):(2'h2)]),
                         wire4[(5'h14):(4'ha)]}) + (8'hb3));
  assign wire7 = (|wire5);
  module8 #() modinst22 (.clk(clk), .y(wire21), .wire10(wire3), .wire9(wire4), .wire12(wire7), .wire11(wire2), .wire13(wire0));
  module23 #() modinst88 (wire87, clk, wire1, wire4, wire3, wire7);
  always
    @(posedge clk) begin
      reg89 <= ($signed({({wire4} && wire0)}) ?
          (~^wire7) : $unsigned($unsigned((&$signed(wire0)))));
    end
endmodule

module module23
#(parameter param86 = (8'ha1))
(y, clk, wire27, wire26, wire25, wire24);
  output wire [(32'h73):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire27;
  input wire [(3'h6):(1'h0)] wire26;
  input wire signed [(2'h3):(1'h0)] wire25;
  input wire signed [(4'hc):(1'h0)] wire24;
  wire signed [(3'h4):(1'h0)] wire85;
  wire signed [(5'h15):(1'h0)] wire83;
  wire signed [(5'h14):(1'h0)] wire34;
  reg [(3'h4):(1'h0)] reg28 = (1'h0);
  reg [(5'h14):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg33 = (1'h0);
  assign y = {wire85,
                 wire83,
                 wire34,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire24)
        begin
          reg28 <= wire24[(3'h5):(1'h0)];
        end
      else
        begin
          if (wire26[(2'h3):(2'h3)])
            begin
              reg28 <= $signed($unsigned(wire27));
              reg29 <= wire24;
            end
          else
            begin
              reg28 <= ({(((wire25 ? wire27 : (8'h9d)) ~^ (wire25 ?
                      wire26 : (8'hbb))) << (|$unsigned(wire24))),
                  ($signed(reg29) ?
                      ((reg28 ? wire26 : reg28) ?
                          $signed(wire26) : (|wire26)) : ((wire24 ?
                          wire25 : (7'h41)) || (wire27 || wire24)))} >>> $signed($unsigned(wire25)));
            end
        end
      if ((reg28 || (wire24[(1'h0):(1'h0)] ?
          {(-(wire27 >>> wire26)),
              (~{wire24, wire25})} : (~|((wire27 * wire26) >= (|wire27))))))
        begin
          reg30 <= $signed(wire26[(1'h1):(1'h0)]);
          reg31 <= reg29;
          reg32 <= wire27[(3'h5):(2'h3)];
        end
      else
        begin
          reg30 <= $unsigned(reg31);
        end
      reg33 <= {$signed(reg31[(3'h4):(3'h4)])};
    end
  assign wire34 = ((($signed((wire24 ? wire27 : (8'hbe))) < reg31) ?
                          wire27[(4'h8):(1'h0)] : (-($signed(wire24) & (~|wire27)))) ?
                      {(8'ha1),
                          ((reg32[(2'h2):(1'h0)] >>> $signed(reg32)) < {(wire25 ?
                                  reg29 : reg32),
                              ((7'h41) ? wire26 : reg33)})} : reg31);
  module35 #() modinst84 (wire83, clk, reg31, wire24, reg30, wire34, reg29);
  assign wire85 = $signed({$signed({wire24}), (&wire27)});
endmodule

module module8  (y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'h4f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire13;
  input wire signed [(4'hf):(1'h0)] wire12;
  input wire [(5'h11):(1'h0)] wire11;
  input wire signed [(4'hd):(1'h0)] wire10;
  input wire [(3'h4):(1'h0)] wire9;
  wire [(4'he):(1'h0)] wire20;
  wire signed [(5'h10):(1'h0)] wire19;
  wire signed [(4'ha):(1'h0)] wire18;
  wire [(4'h9):(1'h0)] wire17;
  wire signed [(5'h11):(1'h0)] wire16;
  wire [(2'h3):(1'h0)] wire15;
  wire [(4'h9):(1'h0)] wire14;
  assign y = {wire20, wire19, wire18, wire17, wire16, wire15, wire14, (1'h0)};
  assign wire14 = ($unsigned($signed(wire11[(4'h9):(3'h6)])) ?
                      $unsigned(wire10[(3'h6):(2'h2)]) : {$unsigned(($unsigned(wire9) ?
                              wire11[(1'h1):(1'h0)] : wire11))});
  assign wire15 = ($signed(wire13) ?
                      $unsigned((wire14 + (!$unsigned((8'hb3))))) : wire14[(3'h6):(2'h2)]);
  assign wire16 = $signed($signed(wire12[(4'ha):(3'h6)]));
  assign wire17 = $unsigned((((-(~|(8'ha8))) ~^ (wire15[(2'h2):(1'h0)] ?
                          wire11 : wire12[(3'h5):(1'h0)])) ?
                      {(wire10 + $signed(wire15)),
                          wire14} : ($signed(((8'haa) ^ (8'ha4))) ~^ $signed(wire9[(1'h1):(1'h0)]))));
  assign wire18 = ($signed($signed($unsigned($unsigned(wire16)))) >>> wire16);
  assign wire19 = ((($unsigned($signed(wire14)) ?
                      $signed($signed((8'hbf))) : ($signed(wire11) ?
                          wire10 : ((8'ha5) <<< wire17))) == ((-wire12[(3'h6):(2'h2)]) ?
                      ((~wire9) ?
                          (wire9 ?
                              (8'hba) : wire17) : wire15[(2'h2):(1'h1)]) : {((7'h42) ?
                              wire16 : wire17)})) << wire9);
  assign wire20 = wire19;
endmodule

module module35
#(parameter param82 = (~((((^(8'haa)) ? ((8'hbf) ^ (8'hb9)) : ((8'ha1) ? (8'hae) : (8'hb5))) ? (~((8'h9f) >>> (7'h40))) : (~^{(8'hbd), (8'haf)})) > {((|(8'h9c)) | ((8'ha2) ? (8'ha6) : (8'hb9))), (-((8'hbe) ? (8'hb9) : (8'hb7)))})))
(y, clk, wire40, wire39, wire38, wire37, wire36);
  output wire [(32'h1ef):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire40;
  input wire signed [(4'hc):(1'h0)] wire39;
  input wire [(4'h9):(1'h0)] wire38;
  input wire [(5'h10):(1'h0)] wire37;
  input wire [(5'h14):(1'h0)] wire36;
  wire signed [(4'h9):(1'h0)] wire81;
  wire signed [(4'ha):(1'h0)] wire80;
  wire [(3'h6):(1'h0)] wire79;
  wire [(3'h4):(1'h0)] wire78;
  wire signed [(5'h14):(1'h0)] wire66;
  wire signed [(4'he):(1'h0)] wire65;
  wire signed [(4'h9):(1'h0)] wire64;
  wire [(4'he):(1'h0)] wire63;
  wire signed [(4'ha):(1'h0)] wire62;
  wire [(3'h4):(1'h0)] wire61;
  wire signed [(4'h9):(1'h0)] wire60;
  wire [(2'h2):(1'h0)] wire59;
  wire [(5'h15):(1'h0)] wire53;
  wire signed [(4'h9):(1'h0)] wire52;
  wire signed [(4'hc):(1'h0)] wire51;
  wire [(4'hf):(1'h0)] wire50;
  wire signed [(5'h12):(1'h0)] wire49;
  wire [(3'h4):(1'h0)] wire48;
  wire signed [(5'h14):(1'h0)] wire41;
  reg signed [(4'h9):(1'h0)] reg77 = (1'h0);
  reg [(4'h8):(1'h0)] reg76 = (1'h0);
  reg [(4'hf):(1'h0)] reg75 = (1'h0);
  reg [(4'hf):(1'h0)] reg74 = (1'h0);
  reg [(5'h12):(1'h0)] reg73 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg71 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg70 = (1'h0);
  reg [(4'h9):(1'h0)] reg69 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg58 = (1'h0);
  reg [(5'h11):(1'h0)] reg57 = (1'h0);
  reg [(4'ha):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg55 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg44 = (1'h0);
  reg [(4'hd):(1'h0)] reg43 = (1'h0);
  reg [(3'h5):(1'h0)] reg42 = (1'h0);
  assign y = {wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire41,
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
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 (1'h0)};
  assign wire41 = $unsigned(wire39);
  always
    @(posedge clk) begin
      if ({$unsigned((wire40[(4'h9):(3'h7)] ~^ (~|{(8'ha6), wire41})))})
        begin
          if (wire40[(5'h10):(5'h10)])
            begin
              reg42 <= wire37[(4'h8):(4'h8)];
              reg43 <= (!reg42[(2'h2):(2'h2)]);
              reg44 <= $signed((~&$signed($unsigned((~|wire38)))));
              reg45 <= wire37;
            end
          else
            begin
              reg42 <= $unsigned(wire39);
              reg43 <= ((wire36 ?
                      $unsigned(reg45[(4'hd):(4'h9)]) : (($unsigned(reg42) ?
                              (reg44 < wire38) : (wire37 + reg44)) ?
                          (7'h42) : (^$unsigned(wire36)))) ?
                  wire39[(1'h0):(1'h0)] : $signed((wire37[(3'h7):(3'h4)] ?
                      $unsigned((^~wire40)) : (wire38 >> $signed(wire38)))));
              reg44 <= {{(~wire38), (^~{(+wire40)})}};
              reg45 <= reg45;
            end
          reg46 <= $signed((wire39 == $unsigned(((wire38 >= wire40) ?
              (-(8'h9d)) : $signed((8'ha9))))));
        end
      else
        begin
          reg42 <= (($unsigned((-(wire41 ~^ wire39))) ?
                  $signed((8'hab)) : {(reg46 ? {wire36, reg45} : wire40)}) ?
              (reg44[(1'h1):(1'h0)] ?
                  reg46[(5'h10):(3'h6)] : ((((8'hb2) - reg46) ?
                      $signed((8'ha7)) : reg43[(3'h4):(3'h4)]) || $signed((&wire38)))) : $signed({((reg45 ?
                      reg46 : wire36) * (~wire37)),
                  reg44}));
        end
      reg47 <= ((&{(reg43 ?
              {reg43, (8'hba)} : ((8'hb2) ?
                  wire41 : (8'h9d)))}) ^~ wire37[(4'h9):(2'h3)]);
    end
  assign wire48 = $signed($signed(($signed((+wire40)) ^~ ({reg42} ?
                      $unsigned(wire41) : wire37))));
  assign wire49 = $signed({$unsigned((reg47 ? $signed(reg45) : (|reg44))),
                      $signed(wire38[(4'h9):(2'h3)])});
  assign wire50 = (wire39[(1'h1):(1'h1)] - {($unsigned($signed(wire37)) >>> (|(wire41 ?
                          wire40 : reg47)))});
  assign wire51 = (~&{$signed(((wire41 != wire36) ?
                          $unsigned(wire36) : (wire49 != (7'h42))))});
  assign wire52 = ((({(8'hbf), reg47[(3'h6):(3'h5)]} ?
                              wire37 : $signed((reg42 ? wire51 : (8'hb0)))) ?
                          $unsigned(reg42[(1'h1):(1'h0)]) : ($signed((reg45 ?
                                  wire41 : wire39)) ?
                              {(reg42 | wire50), $unsigned(wire40)} : wire49)) ?
                      ($signed($unsigned((wire40 ^ wire48))) >> ((wire39[(3'h5):(2'h3)] * ((8'hb0) ?
                              wire36 : reg46)) ?
                          (~^(8'hb9)) : wire51[(4'ha):(3'h5)])) : (reg47[(2'h2):(1'h0)] + wire41[(1'h0):(1'h0)]));
  assign wire53 = (reg47 ?
                      (wire50 ?
                          wire36[(4'hd):(3'h5)] : (((reg43 << (8'hae)) ?
                              wire39[(3'h4):(2'h2)] : $signed(wire50)) >> ((wire51 ?
                                  wire48 : wire51) ?
                              $signed(wire37) : reg46))) : wire39[(3'h4):(2'h2)]);
  always
    @(posedge clk) begin
      reg54 <= $unsigned(wire51[(1'h1):(1'h1)]);
      reg55 <= (~|$signed(wire40[(1'h1):(1'h1)]));
      reg56 <= $unsigned({(-wire38)});
      reg57 <= (8'hb9);
      reg58 <= (~^wire41[(2'h2):(2'h2)]);
    end
  assign wire59 = reg42;
  assign wire60 = reg58;
  assign wire61 = {$signed((!$unsigned({wire37}))), reg55[(1'h1):(1'h1)]};
  assign wire62 = ({wire48[(1'h0):(1'h0)]} ?
                      $unsigned(wire39) : (((+(wire37 & (8'ha4))) ?
                              ((-wire53) && wire60[(3'h7):(3'h7)]) : reg55[(3'h5):(1'h1)]) ?
                          (reg58 >= reg43) : ((wire61 > wire60[(4'h8):(1'h0)]) ~^ wire52[(4'h8):(3'h4)])));
  assign wire63 = (8'ha3);
  assign wire64 = {$unsigned($signed($unsigned($unsigned(reg46))))};
  assign wire65 = {reg44};
  assign wire66 = (wire59[(1'h1):(1'h1)] ?
                      (reg54 ?
                          wire61[(2'h2):(2'h2)] : (reg43 <<< $signed((wire39 != reg54)))) : wire63);
  always
    @(posedge clk) begin
      if (({reg58, {$signed($signed(wire62))}} ?
          reg42 : $unsigned($unsigned(wire53[(1'h1):(1'h1)]))))
        begin
          reg67 <= wire62;
          if ((8'hb5))
            begin
              reg68 <= $unsigned(($unsigned((reg56 == $unsigned(wire51))) ^~ wire48));
              reg69 <= (~(^wire61));
              reg70 <= $signed(reg67);
            end
          else
            begin
              reg68 <= (~|$unsigned(reg45[(5'h10):(4'hd)]));
            end
        end
      else
        begin
          reg67 <= $unsigned(({reg68[(3'h4):(3'h4)],
                  ($signed(reg44) <= wire59)} ?
              $signed((^~wire41[(5'h13):(5'h10)])) : ((!(^~wire65)) ?
                  ($unsigned(reg57) ?
                      (reg44 < wire52) : $signed(wire53)) : (-(reg68 ?
                      (8'hbc) : (8'hbd))))));
        end
      reg71 <= (+{$signed(wire40[(2'h2):(1'h1)])});
      if (reg43[(3'h7):(2'h2)])
        begin
          reg72 <= (&$signed($signed(wire40)));
        end
      else
        begin
          if ((-(&$unsigned((((8'hb4) << (8'hb4)) ^ (|reg43))))))
            begin
              reg72 <= $signed(wire64);
              reg73 <= (~wire51[(3'h6):(2'h2)]);
            end
          else
            begin
              reg72 <= (8'hbc);
              reg73 <= wire60[(3'h7):(3'h6)];
            end
        end
    end
  always
    @(posedge clk) begin
      reg74 <= (|$unsigned((($signed(wire52) ~^ reg46[(1'h0):(1'h0)]) + wire50)));
      reg75 <= $signed({(!wire66[(2'h3):(1'h1)]),
          $unsigned(reg67[(1'h1):(1'h0)])});
      reg76 <= wire60[(4'h8):(1'h0)];
      reg77 <= {reg73[(4'hc):(3'h4)], $unsigned(reg43[(2'h3):(2'h3)])};
    end
  assign wire78 = wire37;
  assign wire79 = {$unsigned({$signed(((8'h9d) ^~ (8'ha8))),
                          $unsigned((reg58 ? reg67 : wire59))}),
                      wire53};
  assign wire80 = {{$unsigned($signed((reg54 >>> wire79)))}};
  assign wire81 = reg71;
endmodule
