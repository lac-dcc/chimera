module top
#(parameter param82 = ((({(8'hab), (~&(8'h9f))} ? ((+(8'hac)) ? {(8'hb9), (8'h9d)} : ((8'hbb) * (8'h9f))) : {(~|(8'ha9)), ((8'hab) ? (8'ha9) : (8'hb2))}) == ((((8'hb2) ? (8'hac) : (7'h43)) ? {(8'hbc), (8'ha5)} : (8'ha6)) == {(^(8'h9f))})) ? ((({(8'hb9), (8'hbe)} ? ((8'hb3) >>> (8'ha8)) : (7'h40)) < (!(!(8'hb8)))) ? {((&(7'h42)) ? {(8'haf)} : ((8'h9f) ? (8'ha5) : (8'ha7)))} : (8'h9c)) : ({{(-(8'ha9)), ((8'hb4) ? (8'hb0) : (7'h42))}} <<< {(8'haa), (((8'h9f) ? (8'hb1) : (8'hbb)) > (-(8'ha5)))})), 
parameter param83 = (((|(((8'hac) || param82) ? param82 : (param82 ? param82 : param82))) ? (param82 ? {(8'hbd), (~^param82)} : ((param82 + (8'ha4)) ? (param82 ? (8'ha2) : param82) : (param82 | param82))) : (-param82)) ? ((~^param82) && param82) : (+{(+(param82 >= param82))})))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'ha7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire0;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire4;
  wire signed [(5'h12):(1'h0)] wire81;
  wire [(5'h15):(1'h0)] wire80;
  wire [(5'h13):(1'h0)] wire5;
  wire [(2'h2):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire12;
  wire signed [(3'h6):(1'h0)] wire13;
  wire signed [(4'hb):(1'h0)] wire14;
  wire [(4'h9):(1'h0)] wire78;
  reg signed [(5'h15):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg10 = (1'h0);
  reg [(3'h7):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg8 = (1'h0);
  assign y = {wire81,
                 wire80,
                 wire5,
                 wire6,
                 wire7,
                 wire12,
                 wire13,
                 wire14,
                 wire78,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = (($signed(wire0[(3'h6):(1'h1)]) ?
                         (wire3[(4'hb):(4'hb)] ?
                             wire4[(5'h11):(2'h3)] : ($unsigned((8'haf)) != wire3[(1'h0):(1'h0)])) : (-(~&wire1))) ?
                     wire4 : (wire4 ~^ $signed($unsigned((wire4 * (8'had))))));
  assign wire6 = wire3;
  assign wire7 = {$signed(($signed($signed(wire4)) & $signed(wire4[(4'h8):(1'h1)])))};
  always
    @(posedge clk) begin
      reg8 <= $signed($signed({(+$signed(wire1))}));
      reg9 <= $unsigned(({((wire2 <<< wire7) ?
                  {wire5} : wire0[(3'h7):(2'h2)])} ?
          $unsigned((8'ha9)) : wire0));
      reg10 <= $unsigned($signed((wire0 ?
          $signed($unsigned(wire7)) : ((wire1 ? wire2 : wire3) ?
              (8'hb9) : $signed(wire4)))));
      reg11 <= wire7[(4'h8):(3'h4)];
    end
  assign wire12 = ((&$signed((wire1 ?
                      $unsigned(wire1) : (8'ha0)))) < ((~|(~reg9)) ?
                      $signed($signed(reg8[(1'h1):(1'h0)])) : (wire6 >> wire3[(2'h2):(1'h0)])));
  assign wire13 = $unsigned($unsigned(wire0));
  assign wire14 = $unsigned(($signed($signed(((8'hb3) || wire1))) & wire6[(1'h1):(1'h1)]));
  module15 #() modinst79 (wire78, clk, wire4, reg10, reg11, wire14, wire5);
  assign wire80 = (($signed((-$unsigned(wire12))) || wire14[(4'hb):(1'h1)]) ?
                      wire2 : (~(wire4[(4'hc):(4'h8)] ?
                          (~^$signed(wire78)) : ($unsigned(wire5) ~^ $unsigned(reg11)))));
  assign wire81 = $unsigned(reg10[(3'h7):(3'h6)]);
endmodule

module module15  (y, clk, wire16, wire17, wire18, wire19, wire20);
  output wire [(32'h182):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire16;
  input wire [(5'h14):(1'h0)] wire17;
  input wire [(5'h13):(1'h0)] wire18;
  input wire signed [(4'h9):(1'h0)] wire19;
  input wire [(4'h8):(1'h0)] wire20;
  wire [(3'h7):(1'h0)] wire22;
  wire [(5'h12):(1'h0)] wire23;
  wire [(4'hf):(1'h0)] wire24;
  wire signed [(5'h14):(1'h0)] wire34;
  wire [(3'h7):(1'h0)] wire35;
  wire signed [(5'h15):(1'h0)] wire36;
  wire [(2'h3):(1'h0)] wire62;
  reg [(4'hf):(1'h0)] reg77 = (1'h0);
  reg [(4'hf):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg75 = (1'h0);
  reg [(5'h12):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg73 = (1'h0);
  reg [(2'h2):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg71 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg70 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg69 = (1'h0);
  reg [(4'he):(1'h0)] reg68 = (1'h0);
  reg [(4'he):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg64 = (1'h0);
  reg [(3'h4):(1'h0)] reg21 = (1'h0);
  reg [(5'h11):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg26 = (1'h0);
  reg [(3'h5):(1'h0)] reg27 = (1'h0);
  reg [(5'h15):(1'h0)] reg28 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg29 = (1'h0);
  reg [(5'h14):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg31 = (1'h0);
  reg [(5'h15):(1'h0)] reg32 = (1'h0);
  reg signed [(4'he):(1'h0)] reg33 = (1'h0);
  assign y = {wire22,
                 wire23,
                 wire24,
                 wire34,
                 wire35,
                 wire36,
                 wire62,
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
                 reg21,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg21 <= wire16[(3'h4):(2'h2)];
    end
  assign wire22 = (^((^~wire18[(2'h3):(1'h1)]) << (((8'h9f) ?
                      wire17[(4'hc):(3'h7)] : $unsigned(wire16)) <<< ((wire17 - wire19) * wire17))));
  assign wire23 = wire18[(3'h5):(3'h5)];
  assign wire24 = $signed($signed((($signed(wire16) ?
                          $signed(wire16) : $signed(wire18)) ?
                      $signed($unsigned((8'had))) : $signed((~&(8'had))))));
  always
    @(posedge clk) begin
      reg25 <= (reg21[(1'h1):(1'h0)] ^ $unsigned((((wire22 || wire19) ?
          wire23[(5'h10):(3'h6)] : (|reg21)) ^ wire17[(4'ha):(1'h1)])));
      reg26 <= {$unsigned((($unsigned(reg21) - wire18) ?
              (reg21 ? wire20 : $signed((8'h9f))) : wire17)),
          wire16};
      reg27 <= (8'hbe);
      if ($unsigned((-reg25[(1'h1):(1'h0)])))
        begin
          reg28 <= ($unsigned((reg27 ^~ wire20[(2'h3):(1'h1)])) ?
              wire22 : (^wire22[(3'h7):(3'h7)]));
          reg29 <= wire16;
          if ((^($signed(reg29[(4'ha):(1'h1)]) ?
              $signed(wire23) : wire19[(1'h1):(1'h0)])))
            begin
              reg30 <= (&$signed($signed(($unsigned(wire23) ?
                  $unsigned((8'h9d)) : (-wire17)))));
              reg31 <= reg27[(3'h5):(1'h0)];
              reg32 <= $signed(reg30);
            end
          else
            begin
              reg30 <= wire19;
              reg31 <= wire16[(4'he):(4'hb)];
              reg32 <= $signed((^wire23[(4'h9):(2'h2)]));
              reg33 <= {({(^(wire16 < (8'ha3))),
                      (reg28[(4'h8):(3'h5)] ?
                          $signed(reg26) : $unsigned(wire16))} << $unsigned(reg30)),
                  (~|$signed({$signed(reg31), $signed(reg25)}))};
            end
        end
      else
        begin
          reg28 <= $signed(((^$unsigned((reg29 ? (8'hbe) : (8'ha6)))) ?
              $signed(wire16[(4'hd):(2'h3)]) : reg31[(3'h4):(2'h2)]));
          reg29 <= ($signed((^({(7'h42)} ?
                  (reg33 == wire23) : $unsigned(wire18)))) ?
              {$unsigned(wire23[(5'h11):(2'h3)])} : (+(reg25 ?
                  {(reg25 || wire18),
                      (wire18 >> wire19)} : $unsigned((&wire23)))));
        end
    end
  assign wire34 = wire16;
  assign wire35 = $unsigned((((!{reg27}) ~^ wire18[(4'hd):(2'h2)]) ?
                      reg30 : $unsigned($signed((wire24 ? wire24 : (8'hbf))))));
  assign wire36 = (~|$signed(wire16[(4'h8):(3'h6)]));
  module37 #() modinst63 (wire62, clk, reg28, reg32, wire36, reg33);
  always
    @(posedge clk) begin
      reg64 <= $unsigned({wire19[(2'h2):(2'h2)],
          (wire22 + $signed($signed(wire23)))});
      if ((((((~|(8'hb9)) ? $unsigned(reg33) : reg32) ?
                  wire24 : $signed((reg30 < reg28))) ?
              (8'hbe) : (~|$signed(wire62[(1'h1):(1'h1)]))) ?
          $unsigned($unsigned($unsigned(reg31))) : reg32))
        begin
          if (((($unsigned(((8'haa) != reg26)) ?
                  (^~(wire34 ?
                      wire34 : reg32)) : $signed($signed(wire36))) ^~ reg28[(3'h6):(1'h1)]) ?
              $unsigned((^{{reg25},
                  (reg64 || reg29)})) : $signed(wire18[(2'h2):(1'h0)])))
            begin
              reg65 <= $unsigned(wire24);
              reg66 <= ($signed($unsigned(wire23[(3'h5):(1'h1)])) ^~ ((reg33 ^ (8'hb3)) ?
                  (!reg21[(2'h2):(2'h2)]) : $unsigned($signed((~wire62)))));
              reg67 <= wire36;
              reg68 <= (+wire22);
            end
          else
            begin
              reg65 <= $signed(($unsigned(({wire17} ?
                  (8'hb3) : $signed(reg25))) >> (|(8'ha6))));
            end
          reg69 <= reg30;
          reg70 <= $unsigned((^~($unsigned($unsigned(reg69)) ?
              (8'hb4) : wire34[(1'h1):(1'h1)])));
          if ($unsigned($signed(reg29[(4'h8):(2'h2)])))
            begin
              reg71 <= (reg25[(4'h9):(2'h2)] ?
                  wire36[(5'h12):(4'hd)] : $signed($signed(reg30)));
              reg72 <= $signed($unsigned($signed(({reg32} ?
                  (^(8'ha7)) : wire22[(1'h0):(1'h0)]))));
              reg73 <= reg21[(1'h1):(1'h1)];
              reg74 <= wire36[(5'h14):(4'h8)];
              reg75 <= $unsigned(reg65[(4'hd):(1'h1)]);
            end
          else
            begin
              reg71 <= wire16[(4'he):(2'h3)];
              reg72 <= $unsigned(((($signed(reg70) ?
                  (reg25 < reg74) : reg66[(2'h2):(2'h2)]) && ($signed(reg69) + $signed((8'ha7)))) ^ {(&(7'h42)),
                  reg66}));
              reg73 <= wire62[(2'h2):(2'h2)];
            end
          reg76 <= $signed((8'hb7));
        end
      else
        begin
          reg65 <= wire16[(4'hb):(3'h4)];
          if ($unsigned($signed({$signed((reg75 || reg29)),
              ((wire34 | reg64) ? $signed(reg76) : wire24)})))
            begin
              reg66 <= (reg27[(3'h5):(1'h0)] ^~ (|wire18[(5'h13):(5'h11)]));
              reg67 <= (~(reg68[(3'h6):(1'h1)] ? (8'hba) : reg33));
              reg68 <= ($signed(($signed({reg65}) == $signed($unsigned(wire35)))) ?
                  $signed(wire23[(3'h4):(1'h1)]) : wire17);
            end
          else
            begin
              reg66 <= (~^$signed((($signed(wire22) >>> (~reg26)) | wire19[(3'h4):(1'h0)])));
            end
          reg69 <= ({((^$unsigned(reg65)) ?
                  ((wire23 ? wire35 : wire35) ?
                      (reg75 ? wire22 : reg31) : ((8'hba) ?
                          reg74 : reg25)) : (8'hac))} || ((($unsigned((8'ha9)) >>> $unsigned(reg72)) ^ reg66[(2'h3):(2'h2)]) ?
              (^reg64) : $signed($signed((~^reg26)))));
        end
      reg77 <= wire62;
    end
endmodule

module module37
#(parameter param61 = (^~((~(+(8'hb8))) ? ((((7'h42) && (8'h9c)) ^ (8'hb1)) ? (|(!(8'hb8))) : ((8'hba) >> ((8'h9e) ? (7'h42) : (8'hb8)))) : ((^~((8'ha2) ? (8'h9f) : (8'hb6))) ? (^~((8'h9e) * (8'ha0))) : (^~((8'ha8) ? (8'hb5) : (8'h9f)))))))
(y, clk, wire41, wire40, wire39, wire38);
  output wire [(32'hd2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire41;
  input wire [(4'hd):(1'h0)] wire40;
  input wire [(5'h12):(1'h0)] wire39;
  input wire signed [(3'h6):(1'h0)] wire38;
  wire signed [(5'h10):(1'h0)] wire60;
  wire [(4'ha):(1'h0)] wire59;
  wire signed [(4'h9):(1'h0)] wire58;
  wire [(3'h5):(1'h0)] wire53;
  wire signed [(3'h6):(1'h0)] wire52;
  wire signed [(2'h3):(1'h0)] wire51;
  wire signed [(5'h10):(1'h0)] wire50;
  wire [(4'he):(1'h0)] wire49;
  wire [(5'h14):(1'h0)] wire48;
  wire signed [(4'hf):(1'h0)] wire47;
  wire [(4'ha):(1'h0)] wire46;
  wire [(3'h7):(1'h0)] wire45;
  wire [(2'h3):(1'h0)] wire44;
  wire [(4'h9):(1'h0)] wire43;
  wire [(4'hf):(1'h0)] wire42;
  reg signed [(4'hf):(1'h0)] reg57 = (1'h0);
  reg signed [(4'he):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg55 = (1'h0);
  reg [(4'h9):(1'h0)] reg54 = (1'h0);
  assign y = {wire60,
                 wire59,
                 wire58,
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
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 (1'h0)};
  assign wire42 = wire41;
  assign wire43 = (^~{$unsigned(wire39[(3'h6):(1'h0)])});
  assign wire44 = wire38;
  assign wire45 = ((|$signed(((~&wire38) ^~ $unsigned(wire39)))) ?
                      wire44[(1'h0):(1'h0)] : $signed($signed(wire40[(1'h0):(1'h0)])));
  assign wire46 = $signed((((8'hbf) ?
                      $signed(wire42[(4'h8):(3'h7)]) : {$signed(wire40),
                          (^wire38)}) >>> wire40));
  assign wire47 = wire44;
  assign wire48 = ((wire42[(4'hc):(1'h0)] ?
                      (((~|(8'hb5)) ? $signed((8'hae)) : (-wire42)) ?
                          ($signed((8'hab)) ?
                              $unsigned(wire45) : wire43[(3'h7):(1'h1)]) : $signed(wire42[(4'hb):(1'h1)])) : (wire38[(2'h3):(2'h3)] * wire41)) ~^ $unsigned($signed({(wire45 && wire45)})));
  assign wire49 = wire43[(1'h0):(1'h0)];
  assign wire50 = (8'haa);
  assign wire51 = $unsigned(wire44);
  assign wire52 = (wire45[(2'h3):(2'h3)] ?
                      wire50 : (wire43[(3'h4):(2'h2)] != wire45));
  assign wire53 = (((|wire43) ?
                      {(&(^~wire49)),
                          $signed((7'h42))} : $unsigned($unsigned(wire48))) + {(!wire39[(4'ha):(4'ha)]),
                      wire52});
  always
    @(posedge clk) begin
      reg54 <= {(~^((~^{wire48}) <= $signed($signed(wire44)))),
          ((~wire42[(4'hf):(4'hd)]) ?
              (($signed(wire51) || wire50[(4'ha):(1'h1)]) ^ (wire38[(3'h5):(3'h4)] ?
                  $unsigned(wire50) : (8'ha0))) : (wire45[(3'h5):(1'h1)] == wire49))};
      reg55 <= $signed(((wire43 >>> ({(8'ha3)} << (wire51 ?
          reg54 : (8'ha7)))) * $signed(wire39[(1'h1):(1'h0)])));
      reg56 <= (&{wire47, $signed((-$unsigned((8'ha0))))});
      reg57 <= ($signed($signed($unsigned(((8'hba) ?
          wire52 : wire46)))) | $unsigned($unsigned($unsigned(((8'hb6) ~^ wire51)))));
    end
  assign wire58 = {reg57};
  assign wire59 = reg57;
  assign wire60 = $signed({$unsigned((~$unsigned((8'ha9))))});
endmodule
