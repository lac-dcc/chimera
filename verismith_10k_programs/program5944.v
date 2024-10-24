module top
#(parameter param87 = ((&((((8'had) & (8'ha8)) <<< ((8'haf) <= (8'ha6))) ? ({(8'ha4)} * ((8'ha2) > (8'hb3))) : (|(~(8'hb7))))) > (((8'hbd) ? ((8'hb9) - (8'ha7)) : {((8'hab) ? (8'hbf) : (8'hb8))}) > ((&((8'hac) ? (8'ha6) : (8'ha1))) <<< (+(~^(8'h9d)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h144):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire3;
  wire signed [(5'h13):(1'h0)] wire86;
  wire signed [(4'h9):(1'h0)] wire85;
  wire signed [(4'hd):(1'h0)] wire84;
  wire signed [(4'hf):(1'h0)] wire79;
  wire [(3'h4):(1'h0)] wire78;
  wire signed [(5'h12):(1'h0)] wire67;
  wire [(4'h9):(1'h0)] wire66;
  wire [(3'h4):(1'h0)] wire65;
  wire signed [(4'ha):(1'h0)] wire64;
  wire signed [(3'h6):(1'h0)] wire63;
  wire signed [(2'h3):(1'h0)] wire4;
  wire signed [(5'h14):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire8;
  wire signed [(4'h8):(1'h0)] wire61;
  reg signed [(4'he):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg81 = (1'h0);
  reg [(5'h12):(1'h0)] reg80 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg77 = (1'h0);
  reg [(4'h8):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg74 = (1'h0);
  reg [(5'h14):(1'h0)] reg73 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg72 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg71 = (1'h0);
  reg [(2'h2):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg69 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg68 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire84,
                 wire79,
                 wire78,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire61,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
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
                 (1'h0)};
  assign wire4 = ($signed($unsigned(wire0)) ?
                     $unsigned((~|wire2[(3'h5):(3'h5)])) : $unsigned(((8'ha7) < $unsigned((wire1 * wire3)))));
  assign wire5 = ((wire3 - (((-wire3) ? $unsigned(wire4) : wire1) ?
                         $unsigned(wire1[(3'h5):(2'h2)]) : wire4)) ?
                     (+wire3) : wire3[(2'h2):(1'h1)]);
  assign wire6 = ((8'hb2) ~^ wire2);
  assign wire7 = wire6;
  assign wire8 = wire1;
  module9 #() modinst62 (wire61, clk, wire2, wire7, wire3, wire5, wire6);
  assign wire63 = {{{wire61[(3'h5):(2'h2)], wire1[(4'hc):(1'h1)]}},
                      $signed($signed($signed({(8'hbb), wire7})))};
  assign wire64 = wire8[(5'h11):(4'he)];
  assign wire65 = wire4;
  assign wire66 = $signed($unsigned((7'h41)));
  assign wire67 = ($unsigned((($unsigned(wire63) ?
                          $unsigned(wire0) : (wire7 ? wire63 : wire0)) ?
                      ((8'hb8) ? wire64 : (~|wire61)) : (wire63 & {wire3,
                          wire6}))) > $signed(((8'hb5) ?
                      $unsigned((+wire0)) : wire7[(4'ha):(2'h3)])));
  always
    @(posedge clk) begin
      if (wire4[(1'h0):(1'h0)])
        begin
          reg68 <= wire3[(2'h3):(1'h1)];
          reg69 <= (8'haf);
          reg70 <= $signed(wire4);
          reg71 <= ($unsigned($signed(($signed(wire5) ?
                  {wire7} : (reg70 ? wire0 : wire66)))) ?
              ((((wire4 ?
                      wire0 : wire1) >= wire2[(3'h6):(1'h1)]) >= reg70[(2'h2):(1'h0)]) ?
                  $signed(((~&(8'ha4)) ?
                      (~wire0) : {wire65,
                          reg68})) : wire63) : wire1[(3'h6):(3'h6)]);
        end
      else
        begin
          reg68 <= (reg68 ?
              $unsigned(((~|wire63[(2'h2):(1'h0)]) ^~ $unsigned((+wire64)))) : $signed($signed((^(~wire66)))));
          reg69 <= $unsigned(reg70[(2'h2):(1'h0)]);
          if (((~&{($signed(reg70) ^ reg68), ((-wire6) | reg71)}) ?
              $unsigned($signed(wire61[(3'h7):(1'h1)])) : {wire64[(4'h8):(3'h6)]}))
            begin
              reg70 <= $signed(wire0);
            end
          else
            begin
              reg70 <= (($signed(((reg70 ? wire65 : (8'hbb)) <<< (&wire61))) ?
                      wire61[(2'h2):(1'h1)] : wire61[(3'h4):(2'h3)]) ?
                  reg69 : $signed({$signed(((8'hbe) > (8'h9d)))}));
              reg71 <= wire6[(2'h2):(2'h2)];
              reg72 <= $unsigned($signed(wire2[(4'he):(4'he)]));
            end
        end
      reg73 <= $unsigned($unsigned((!{(&(7'h42))})));
      reg74 <= {wire1[(2'h2):(1'h0)]};
      reg75 <= (~^($signed(($unsigned(wire2) <<< (reg71 * wire67))) ?
          {{(wire5 ? (8'hae) : wire61), $unsigned((8'hb1))}} : ((wire1 ?
              $unsigned(wire4) : (wire5 ?
                  (8'hb2) : reg72)) + $unsigned($unsigned(reg71)))));
      reg76 <= reg71[(1'h1):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg77 <= ((+reg73[(4'hd):(3'h5)]) ?
          (((~^$unsigned(wire8)) ?
                  $signed(((8'hb0) + (8'hb2))) : $unsigned($signed(reg73))) ?
              (!(((8'hab) - reg74) ?
                  ((8'hb2) ^~ wire4) : (~wire7))) : $unsigned($signed($signed((8'hb1))))) : (8'hae));
    end
  assign wire78 = ((wire2[(1'h1):(1'h0)] ?
                      (|(!$unsigned(wire2))) : $unsigned(($signed(reg77) | $unsigned(wire67)))) <= $signed((wire66[(3'h7):(3'h4)] ~^ wire67)));
  assign wire79 = $signed({wire2, $unsigned((&{wire7, (8'hba)}))});
  always
    @(posedge clk) begin
      if ($unsigned(wire7))
        begin
          reg80 <= wire8;
        end
      else
        begin
          reg80 <= wire64[(4'h9):(3'h5)];
          if ((((8'hbf) ?
                  $unsigned((~|$unsigned(wire65))) : $signed($unsigned($signed(reg75)))) ?
              (($signed((wire65 * (8'hbe))) ?
                  ((wire63 * reg80) ~^ wire79[(4'hb):(2'h3)]) : wire7[(3'h4):(1'h0)]) != (!($unsigned((8'ha4)) ?
                  $signed(reg68) : wire79))) : $signed(reg68)))
            begin
              reg81 <= (wire63[(1'h0):(1'h0)] ?
                  reg73[(5'h12):(5'h11)] : $unsigned($signed($signed({(8'h9d)}))));
              reg82 <= $unsigned($unsigned(wire78));
            end
          else
            begin
              reg81 <= ((!((~&$unsigned((7'h44))) <= ((reg71 >>> reg75) ?
                  (wire8 - reg80) : wire64[(3'h4):(2'h2)]))) || reg82[(1'h0):(1'h0)]);
            end
          reg83 <= wire6[(4'h9):(2'h2)];
        end
    end
  assign wire84 = wire0;
  assign wire85 = ({(^$signed(reg75[(1'h0):(1'h0)]))} <<< $unsigned((($unsigned(wire7) && wire3) ?
                      {{reg74}, (wire4 ? reg68 : (8'hbf))} : (wire5 > {(8'hb8),
                          reg82}))));
  assign wire86 = (^~$signed((7'h40)));
endmodule

module module9  (y, clk, wire14, wire13, wire12, wire11, wire10);
  output wire [(32'h1de):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire14;
  input wire signed [(4'he):(1'h0)] wire13;
  input wire [(4'hc):(1'h0)] wire12;
  input wire [(4'ha):(1'h0)] wire11;
  input wire [(4'hc):(1'h0)] wire10;
  wire signed [(4'h8):(1'h0)] wire60;
  wire signed [(4'h9):(1'h0)] wire53;
  wire signed [(4'h9):(1'h0)] wire52;
  wire signed [(4'hb):(1'h0)] wire51;
  wire signed [(4'hf):(1'h0)] wire50;
  wire signed [(5'h12):(1'h0)] wire49;
  wire signed [(4'he):(1'h0)] wire48;
  wire signed [(5'h13):(1'h0)] wire47;
  wire [(5'h12):(1'h0)] wire45;
  wire signed [(4'hd):(1'h0)] wire34;
  wire [(4'he):(1'h0)] wire33;
  wire signed [(4'hc):(1'h0)] wire32;
  wire [(4'hb):(1'h0)] wire31;
  wire [(4'hb):(1'h0)] wire30;
  wire signed [(3'h7):(1'h0)] wire29;
  wire [(4'ha):(1'h0)] wire28;
  wire signed [(4'hd):(1'h0)] wire19;
  wire [(4'hf):(1'h0)] wire18;
  wire signed [(2'h3):(1'h0)] wire17;
  wire [(5'h14):(1'h0)] wire16;
  wire signed [(5'h13):(1'h0)] wire15;
  reg [(3'h6):(1'h0)] reg59 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg58 = (1'h0);
  reg signed [(4'he):(1'h0)] reg57 = (1'h0);
  reg [(5'h15):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg26 = (1'h0);
  reg [(5'h15):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg24 = (1'h0);
  reg [(4'ha):(1'h0)] reg23 = (1'h0);
  reg [(5'h15):(1'h0)] reg22 = (1'h0);
  reg [(4'hf):(1'h0)] reg21 = (1'h0);
  reg [(4'hf):(1'h0)] reg20 = (1'h0);
  assign y = {wire60,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire45,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 (1'h0)};
  assign wire15 = (~&$signed({((wire11 + wire12) ?
                          {wire10, wire10} : $unsigned(wire14)),
                      wire11}));
  assign wire16 = wire12[(4'h8):(2'h2)];
  assign wire17 = ($signed($signed(wire12)) ?
                      wire14 : {(~&(~wire14[(4'h9):(2'h2)]))});
  assign wire18 = ($unsigned($signed({(+wire10),
                      $unsigned(wire17)})) != ((~^$signed((wire16 ?
                      (8'ha9) : wire17))) > $unsigned(wire10)));
  assign wire19 = ((-(~|wire15[(3'h4):(1'h0)])) ?
                      $unsigned({wire18,
                          (((7'h43) != wire17) ?
                              $signed(wire12) : $signed(wire15))}) : ({((~|wire13) ?
                              (&(8'hb3)) : (&wire14))} * wire18[(4'he):(3'h6)]));
  always
    @(posedge clk) begin
      reg20 <= $signed(wire14);
      reg21 <= $unsigned(($signed($unsigned((wire19 ~^ wire14))) ?
          (^~((^wire11) & $unsigned(wire17))) : wire14));
      if ($signed(({$signed({wire10})} ?
          (wire10[(4'h9):(3'h5)] ?
              wire15[(4'ha):(4'h8)] : ((wire19 ?
                  wire12 : wire17) - wire13[(4'h8):(3'h6)])) : $signed({(wire16 ?
                  wire14 : wire10),
              (wire13 <= wire18)}))))
        begin
          reg22 <= (({wire12,
                  $signed($signed(wire15))} < wire15[(4'hd):(3'h6)]) ?
              (-{$unsigned({reg21, (8'hb4)})}) : $unsigned(wire16));
          reg23 <= $signed(($signed((|reg20)) >> $unsigned((+$unsigned((8'ha2))))));
        end
      else
        begin
          if ($unsigned((~{$signed({wire19})})))
            begin
              reg22 <= wire15[(4'hd):(3'h5)];
            end
          else
            begin
              reg22 <= ((((~|$unsigned(wire12)) >>> (wire19 == $signed(wire17))) ?
                  ($unsigned((8'hbe)) >>> (-(8'ha4))) : wire13[(3'h7):(1'h0)]) && $signed((wire17[(1'h0):(1'h0)] ?
                  wire13[(4'hb):(3'h4)] : {(reg20 ? (7'h40) : wire13)})));
              reg23 <= {wire12, $unsigned(wire11)};
              reg24 <= {reg20[(4'hd):(3'h6)]};
              reg25 <= ((!(reg23 ?
                      wire12[(3'h6):(3'h4)] : $signed((wire17 ?
                          wire16 : (8'hb8))))) ?
                  $signed(reg23[(4'h9):(3'h6)]) : (&({$signed((8'hb9)),
                          (reg24 ? reg23 : wire14)} ?
                      (reg20 ? {reg20} : reg24) : (~(~^(7'h44))))));
            end
        end
      reg26 <= {((wire11 ? wire14[(3'h4):(2'h3)] : $signed($unsigned(reg25))) ?
              reg23[(3'h7):(1'h1)] : reg20),
          wire16};
      reg27 <= (^($unsigned($unsigned(reg23)) ?
          wire10[(3'h4):(2'h2)] : {{wire15, reg21}}));
    end
  assign wire28 = reg21[(4'h8):(4'h8)];
  assign wire29 = ($unsigned((wire12[(4'ha):(2'h2)] ?
                      {(reg21 + (8'ha3))} : reg22)) > ($signed(({(8'hb3)} == wire17)) ~^ $unsigned({reg27[(2'h2):(1'h1)]})));
  assign wire30 = (8'haf);
  assign wire31 = (reg27 ?
                      (~|(^~$unsigned((wire14 <<< wire18)))) : (-wire17[(2'h3):(1'h1)]));
  assign wire32 = reg21;
  assign wire33 = reg26;
  assign wire34 = $unsigned($unsigned((reg25 ?
                      reg26[(4'hf):(2'h2)] : reg25[(4'h8):(3'h7)])));
  module35 #() modinst46 (wire45, clk, wire12, wire14, reg22, reg24);
  assign wire47 = (&((|wire32[(4'h8):(2'h3)]) >> $signed((+$unsigned(reg22)))));
  assign wire48 = wire18;
  assign wire49 = wire47[(5'h10):(4'hc)];
  assign wire50 = $unsigned(wire48);
  assign wire51 = {(&{(~&(~&wire33))})};
  assign wire52 = {(~(wire13[(4'hc):(4'hb)] || (~&wire13[(3'h5):(3'h5)]))),
                      (wire12 & $signed({(-wire29), {wire30}}))};
  assign wire53 = wire30;
  always
    @(posedge clk) begin
      if ((|(~(~$unsigned(reg22)))))
        begin
          if (wire16[(4'h9):(1'h1)])
            begin
              reg54 <= $signed($signed({(|wire10[(3'h7):(3'h6)])}));
              reg55 <= $unsigned((+$unsigned(wire51[(1'h1):(1'h0)])));
            end
          else
            begin
              reg54 <= ((wire30 ?
                      (~&($signed(wire14) ?
                          (8'hb8) : (+wire15))) : $signed(((wire10 ?
                              (8'hb3) : wire12) ?
                          (7'h41) : wire32))) ?
                  wire49[(3'h5):(3'h4)] : $unsigned(reg25));
              reg55 <= ((+reg54[(1'h0):(1'h0)]) > ((({wire31,
                      wire49} | wire32) ?
                  (~&{wire19}) : ($signed((8'hb7)) ?
                      wire12 : reg26[(4'he):(3'h4)])) >= (reg27 ?
                  $signed(wire45[(1'h1):(1'h1)]) : wire45)));
              reg56 <= (~|(wire33[(4'ha):(3'h5)] ?
                  reg26[(3'h6):(2'h3)] : wire12[(2'h3):(2'h3)]));
            end
          reg57 <= wire49[(4'hd):(3'h5)];
          reg58 <= $signed(($unsigned((reg27 ?
              $unsigned((7'h40)) : (~&wire10))) >= (((reg22 <= wire12) << $signed(wire33)) > wire31[(3'h7):(3'h5)])));
        end
      else
        begin
          reg54 <= $unsigned({$signed((~&$signed(reg24)))});
          reg55 <= wire52[(4'h8):(2'h3)];
          reg56 <= $signed($signed($signed((reg24 ? wire13 : wire48))));
          reg57 <= $unsigned((wire30 ?
              wire47[(5'h13):(3'h7)] : $unsigned(reg56[(5'h14):(4'he)])));
        end
      reg59 <= (((~reg57) ?
              $unsigned($signed((wire53 ?
                  (8'hb9) : reg23))) : (wire18[(4'ha):(2'h3)] != $signed(wire45[(5'h12):(1'h1)]))) ?
          $unsigned(wire14[(2'h3):(1'h0)]) : reg20);
    end
  assign wire60 = reg55;
endmodule

module module35
#(parameter param44 = ((+(((+(8'hba)) ? ((8'hb7) ? (8'hbe) : (8'hbe)) : {(8'ha2)}) ? {((8'hb1) ? (8'hbb) : (8'hac))} : {(+(8'h9d))})) ? (&(({(7'h40)} ? (~(8'ha0)) : (~|(8'hb6))) ? ((^~(8'hbb)) ? (~&(8'hb6)) : ((8'ha1) ^~ (7'h41))) : (((8'hba) * (8'h9e)) ? ((8'had) >> (8'haf)) : ((8'ha5) ? (8'hb9) : (7'h42))))) : ((&((~(7'h43)) ? {(8'ha6), (8'hae)} : ((8'hbb) * (8'ha5)))) * ((8'hba) || (((8'hb3) ^~ (8'hbd)) ? ((7'h44) * (8'hb5)) : ((8'hb0) != (8'hbe)))))))
(y, clk, wire39, wire38, wire37, wire36);
  output wire [(32'h35):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire39;
  input wire signed [(3'h6):(1'h0)] wire38;
  input wire signed [(5'h15):(1'h0)] wire37;
  input wire [(5'h14):(1'h0)] wire36;
  wire [(5'h13):(1'h0)] wire43;
  wire [(5'h13):(1'h0)] wire42;
  wire [(4'ha):(1'h0)] wire41;
  wire [(3'h4):(1'h0)] wire40;
  assign y = {wire43, wire42, wire41, wire40, (1'h0)};
  assign wire40 = wire37;
  assign wire41 = ($unsigned({$unsigned(wire37)}) ?
                      $unsigned(((&$unsigned(wire38)) ?
                          ($unsigned(wire40) <<< (-wire38)) : wire39[(1'h0):(1'h0)])) : $unsigned(wire38[(2'h2):(2'h2)]));
  assign wire42 = wire36[(5'h10):(4'ha)];
  assign wire43 = (($signed($unsigned($unsigned(wire40))) <= (((wire40 && wire41) + $unsigned((8'hb6))) ?
                          $signed(wire40[(1'h1):(1'h0)]) : $signed((wire39 && wire37)))) ?
                      (|wire41[(1'h1):(1'h0)]) : $signed($unsigned($signed({wire38}))));
endmodule
