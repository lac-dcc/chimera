module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h221):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire0;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire4;
  wire signed [(4'hc):(1'h0)] wire143;
  wire signed [(5'h12):(1'h0)] wire141;
  wire [(4'he):(1'h0)] wire53;
  wire signed [(3'h7):(1'h0)] wire52;
  wire [(5'h15):(1'h0)] wire51;
  wire signed [(4'h8):(1'h0)] wire50;
  wire [(5'h10):(1'h0)] wire49;
  wire [(4'hc):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire7;
  wire signed [(4'hc):(1'h0)] wire8;
  wire [(4'h8):(1'h0)] wire9;
  wire [(5'h11):(1'h0)] wire10;
  wire [(5'h13):(1'h0)] wire11;
  wire signed [(5'h11):(1'h0)] wire12;
  wire signed [(4'hc):(1'h0)] wire13;
  wire [(4'hd):(1'h0)] wire14;
  wire [(4'ha):(1'h0)] wire47;
  reg [(3'h6):(1'h0)] reg54 = (1'h0);
  reg [(4'he):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg56 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg59 = (1'h0);
  reg [(5'h11):(1'h0)] reg60 = (1'h0);
  reg [(4'hd):(1'h0)] reg61 = (1'h0);
  reg [(4'hc):(1'h0)] reg62 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg63 = (1'h0);
  reg [(5'h15):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg65 = (1'h0);
  reg [(4'he):(1'h0)] reg66 = (1'h0);
  reg [(4'hf):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg68 = (1'h0);
  reg [(4'h8):(1'h0)] reg69 = (1'h0);
  reg [(5'h13):(1'h0)] reg70 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg73 = (1'h0);
  reg [(5'h13):(1'h0)] reg74 = (1'h0);
  reg [(2'h3):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg76 = (1'h0);
  assign y = {wire143,
                 wire141,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire47,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 reg68,
                 reg69,
                 reg70,
                 reg71,
                 reg72,
                 reg73,
                 reg74,
                 reg75,
                 reg76,
                 (1'h0)};
  assign wire5 = $signed(wire0);
  assign wire6 = wire2[(3'h4):(2'h2)];
  assign wire7 = wire4[(2'h3):(2'h2)];
  assign wire8 = $signed($unsigned(({(~&wire6)} ?
                     (&wire7[(1'h0):(1'h0)]) : $signed((wire4 > wire7)))));
  assign wire9 = wire3;
  assign wire10 = $signed((($unsigned((!wire4)) - wire5[(3'h7):(3'h5)]) - $signed(($signed((8'h9d)) ^ (^~wire2)))));
  assign wire11 = ($unsigned($signed($signed(((8'h9f) < (8'had))))) ^~ (^~(&wire3)));
  assign wire12 = {wire5[(2'h2):(1'h1)]};
  assign wire13 = $signed((!($unsigned((&wire1)) ?
                      wire0[(2'h2):(1'h1)] : $unsigned((~^wire3)))));
  assign wire14 = (wire4[(4'hc):(2'h3)] - (-$unsigned(wire0)));
  module15 #() modinst48 (wire47, clk, wire14, wire13, wire4, wire10, wire6);
  assign wire49 = ((8'hba) || (8'ha8));
  assign wire50 = ({(+($signed(wire8) == wire13))} != wire11);
  assign wire51 = {$signed(wire10), wire4[(4'hb):(1'h0)]};
  assign wire52 = (((~($unsigned(wire14) | wire9[(2'h2):(1'h1)])) - wire6[(5'h11):(3'h7)]) ?
                      wire2 : $signed((wire4 ?
                          (((8'ha4) & wire13) ^ (8'had)) : $unsigned((wire7 ?
                              wire12 : wire8)))));
  assign wire53 = (8'hb3);
  always
    @(posedge clk) begin
      reg54 <= (~|{(wire10 ?
              (wire2 ? $signed((8'had)) : (^~wire10)) : {$unsigned((7'h42))})});
      if ((wire52[(3'h6):(1'h1)] >> {wire5[(4'h9):(3'h4)]}))
        begin
          reg55 <= $unsigned((^wire6));
          reg56 <= reg55[(4'hb):(4'h9)];
          reg57 <= ((($unsigned(wire50) ?
              ($unsigned(wire8) != wire51) : ((wire5 >= wire12) ?
                  $signed(wire9) : wire3[(1'h0):(1'h0)])) || wire53[(4'ha):(4'h9)]) != wire47[(3'h7):(3'h4)]);
          if (wire8)
            begin
              reg58 <= reg55[(4'ha):(4'h9)];
            end
          else
            begin
              reg58 <= (reg54 | wire3[(1'h0):(1'h0)]);
              reg59 <= (8'h9e);
              reg60 <= {((8'hab) >>> (8'hac))};
            end
        end
      else
        begin
          reg55 <= wire14[(2'h3):(1'h1)];
        end
      if ($unsigned({wire49, $signed(({wire4, reg56} ? wire11 : (^wire2)))}))
        begin
          if (reg58)
            begin
              reg61 <= wire4[(2'h3):(2'h2)];
              reg62 <= $unsigned((|(!reg57)));
              reg63 <= $signed(wire10);
              reg64 <= $signed((-(wire52[(3'h6):(2'h3)] ?
                  reg57[(2'h3):(1'h1)] : (^~reg55[(3'h6):(3'h4)]))));
              reg65 <= $unsigned(wire53);
            end
          else
            begin
              reg61 <= $signed($signed(reg61[(1'h1):(1'h0)]));
              reg62 <= $signed(reg65);
              reg63 <= $signed((reg57 ?
                  reg64 : ({(wire11 - reg61), (reg57 - wire6)} != ((reg58 ?
                      wire52 : wire2) >= $unsigned(wire49)))));
              reg64 <= ($signed((^(^wire1))) ?
                  {((~^$signed(wire5)) ?
                          ($unsigned((8'h9d)) ?
                              {wire12,
                                  (8'ha2)} : $signed((8'hb0))) : reg62[(2'h3):(2'h3)]),
                      wire6[(4'h9):(2'h3)]} : (^($signed($unsigned(wire7)) < wire7[(2'h2):(1'h0)])));
              reg65 <= ({((&wire2) ?
                      (^~wire53) : wire49)} + $signed((^(8'hbb))));
            end
        end
      else
        begin
          if (reg54)
            begin
              reg61 <= ({$unsigned(((reg55 ? wire49 : reg58) >= (wire10 ?
                      reg59 : wire47)))} * wire9[(1'h0):(1'h0)]);
              reg62 <= $signed($unsigned(wire5));
              reg63 <= wire53[(4'ha):(4'h8)];
            end
          else
            begin
              reg61 <= wire50;
              reg62 <= (wire50[(3'h6):(3'h5)] < (|$unsigned(reg56)));
            end
          reg64 <= $signed($unsigned({(wire11 * (wire53 ? wire14 : wire14)),
              reg65[(3'h4):(1'h1)]}));
          reg65 <= (&(reg61[(4'hc):(4'ha)] ?
              wire0[(3'h4):(2'h2)] : wire53[(4'ha):(1'h1)]));
          if (wire53[(1'h1):(1'h0)])
            begin
              reg66 <= wire13[(2'h3):(2'h3)];
              reg67 <= wire10;
              reg68 <= wire2[(2'h3):(2'h2)];
              reg69 <= wire2[(2'h3):(1'h0)];
              reg70 <= ((-$unsigned($unsigned(wire7))) ?
                  ((^$unsigned($unsigned(wire47))) - (~&($unsigned(wire10) ?
                      (wire47 ?
                          reg66 : wire47) : $signed(wire10)))) : ($signed(reg57) ?
                      reg69 : wire47));
            end
          else
            begin
              reg66 <= wire3;
              reg67 <= $signed((8'hb8));
              reg68 <= ($unsigned($unsigned($unsigned(((8'had) >= wire51)))) << $signed($unsigned(reg58)));
              reg69 <= {reg58[(4'hd):(4'h9)]};
              reg70 <= $signed($signed($signed(reg60)));
            end
          if (wire0)
            begin
              reg71 <= (8'hbf);
            end
          else
            begin
              reg71 <= wire4[(3'h6):(3'h6)];
              reg72 <= $signed($signed((^~{reg66[(2'h3):(1'h1)], reg66})));
              reg73 <= (($signed(reg66) ?
                  {(&reg58),
                      $unsigned(reg71[(2'h2):(1'h1)])} : $unsigned($unsigned((^reg66)))) ~^ $unsigned((!((reg72 ?
                      reg55 : reg56) ?
                  (wire1 ? wire10 : reg61) : $unsigned(wire11)))));
              reg74 <= wire52[(1'h0):(1'h0)];
              reg75 <= $signed(wire49);
            end
        end
      reg76 <= (wire13[(1'h1):(1'h1)] ?
          $unsigned($signed(reg74)) : ((reg59 ^ $signed(((8'hb7) ?
                  reg55 : wire5))) ?
              (~|(reg54[(3'h5):(2'h2)] ?
                  $unsigned(wire53) : $unsigned(reg69))) : $signed((8'ha4))));
    end
  module77 #() modinst142 (wire141, clk, wire51, reg71, reg74, wire5, reg65);
  assign wire143 = $unsigned((reg55 | (((wire8 ?
                           wire10 : reg73) ~^ $signed(wire11)) ?
                       (|(^~wire13)) : wire52[(3'h6):(3'h4)])));
endmodule

module module77  (y, clk, wire82, wire81, wire80, wire79, wire78);
  output wire [(32'hc2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire82;
  input wire signed [(4'ha):(1'h0)] wire81;
  input wire [(5'h13):(1'h0)] wire80;
  input wire [(3'h6):(1'h0)] wire79;
  input wire signed [(5'h15):(1'h0)] wire78;
  wire signed [(3'h5):(1'h0)] wire137;
  wire signed [(5'h13):(1'h0)] wire136;
  wire signed [(5'h11):(1'h0)] wire135;
  wire signed [(3'h7):(1'h0)] wire134;
  wire [(4'hd):(1'h0)] wire128;
  wire signed [(3'h4):(1'h0)] wire127;
  wire [(4'hc):(1'h0)] wire126;
  wire [(2'h3):(1'h0)] wire122;
  reg signed [(4'ha):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg139 = (1'h0);
  reg [(4'h9):(1'h0)] reg138 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg132 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg131 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg130 = (1'h0);
  reg [(4'h8):(1'h0)] reg129 = (1'h0);
  reg [(4'h8):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg124 = (1'h0);
  assign y = {wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire128,
                 wire127,
                 wire126,
                 wire122,
                 reg140,
                 reg139,
                 reg138,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg125,
                 reg124,
                 (1'h0)};
  module83 #() modinst123 (.clk(clk), .y(wire122), .wire85(wire82), .wire86(wire78), .wire87(wire80), .wire84(wire79));
  always
    @(posedge clk) begin
      reg124 <= $signed(($signed((&wire79[(1'h1):(1'h1)])) ^~ {(wire79 <<< (wire80 ?
              wire80 : (8'ha3))),
          (~|(+wire78))}));
      reg125 <= {({$signed(reg124),
              wire82[(2'h3):(2'h3)]} | ((~wire79) && $unsigned((wire80 ?
              (8'ha2) : wire80))))};
    end
  assign wire126 = (({($unsigned(wire78) < $signed((8'hb0))),
                           {((8'hbd) ? reg125 : reg124),
                               (wire82 ? wire122 : (8'h9e))}} ?
                       (((reg125 - wire78) ^~ (wire78 * wire122)) >= {(wire78 | wire82),
                           reg125[(2'h3):(2'h3)]}) : (|$unsigned(((8'had) ?
                           reg125 : reg124)))) + $signed($signed($signed((wire78 ?
                       wire79 : wire81)))));
  assign wire127 = wire79;
  assign wire128 = ((((wire127[(2'h3):(1'h0)] ?
                                   wire122 : (wire126 ~^ wire127)) ?
                               wire82 : (~^(-wire126))) ?
                           wire82 : ({$unsigned(wire126),
                                   wire81[(1'h1):(1'h0)]} ?
                               reg125 : ((~^wire122) & (wire82 * wire127)))) ?
                       (~($signed($signed(wire126)) >>> ((wire82 >= (8'haa)) ?
                           wire81[(3'h5):(3'h4)] : (wire78 ?
                               wire82 : (7'h40))))) : (~$signed((reg125 ?
                           (wire81 ? reg124 : reg124) : wire122))));
  always
    @(posedge clk) begin
      reg129 <= ($signed({($signed(wire127) ?
              wire79 : wire128[(3'h6):(3'h4)])}) + $unsigned($unsigned(((wire82 ?
              wire122 : wire128) ?
          (wire128 ? reg125 : (8'hb6)) : wire82[(4'ha):(2'h2)]))));
      reg130 <= (~|((|((wire78 << wire81) >= {(8'ha1), wire126})) ?
          ((~wire81) >>> ({wire126} >> (reg129 ? wire80 : wire79))) : wire81));
      reg131 <= (&wire128);
      reg132 <= $signed(reg129[(3'h6):(3'h5)]);
      reg133 <= (~&((wire78 ?
              ((wire128 ^ reg125) & $unsigned(reg132)) : ((~^wire126) <= $signed(wire127))) ?
          (((reg124 >> wire122) <<< (reg124 && (8'hb6))) <= $unsigned($signed(reg125))) : $signed(((reg129 ?
              wire127 : wire128) * {reg129, wire122}))));
    end
  assign wire134 = (~reg129);
  assign wire135 = $signed($unsigned($signed((|$signed(wire127)))));
  assign wire136 = $unsigned($unsigned((~wire82)));
  assign wire137 = $signed(({wire135[(4'hc):(1'h1)]} != $unsigned(({reg132} > $unsigned(wire126)))));
  always
    @(posedge clk) begin
      reg138 <= {({$signed($unsigned(reg125))} ?
              (7'h42) : wire122[(2'h2):(1'h1)]),
          (^~$unsigned(reg124[(5'h11):(4'hd)]))};
      reg139 <= wire136[(4'he):(1'h1)];
      reg140 <= wire128[(4'h8):(1'h0)];
    end
endmodule

module module15
#(parameter param46 = (-(|{((7'h42) ? {(8'ha2), (8'h9d)} : ((8'hbe) ? (8'h9e) : (8'hae))), (((8'hbf) * (8'hac)) ? ((8'h9f) ? (8'haa) : (8'hb9)) : ((7'h43) != (8'hbd)))})))
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h11e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire20;
  input wire [(4'hc):(1'h0)] wire19;
  input wire signed [(4'h9):(1'h0)] wire18;
  input wire signed [(5'h10):(1'h0)] wire17;
  input wire [(3'h7):(1'h0)] wire16;
  wire signed [(4'h8):(1'h0)] wire45;
  wire [(4'ha):(1'h0)] wire21;
  reg [(5'h11):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg41 = (1'h0);
  reg [(4'hf):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg39 = (1'h0);
  reg [(3'h5):(1'h0)] reg38 = (1'h0);
  reg [(2'h2):(1'h0)] reg37 = (1'h0);
  reg [(4'h9):(1'h0)] reg36 = (1'h0);
  reg [(3'h6):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg32 = (1'h0);
  reg [(4'hf):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg29 = (1'h0);
  reg [(5'h11):(1'h0)] reg28 = (1'h0);
  reg [(5'h10):(1'h0)] reg27 = (1'h0);
  reg [(4'hd):(1'h0)] reg26 = (1'h0);
  reg [(3'h4):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  reg [(5'h15):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg22 = (1'h0);
  assign y = {wire45,
                 wire21,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 (1'h0)};
  assign wire21 = wire16;
  always
    @(posedge clk) begin
      reg22 <= (($signed($signed($unsigned(wire16))) ?
              wire20[(1'h1):(1'h1)] : wire16) ?
          (^~wire21[(3'h7):(2'h3)]) : (wire21[(3'h5):(2'h2)] != ($signed(wire21[(4'h9):(3'h4)]) ^ wire21)));
      reg23 <= (($signed(wire19) < {$signed((wire17 ?
              wire21 : wire18))}) + wire20);
      if (wire17)
        begin
          reg24 <= $unsigned((~&{$signed((7'h42))}));
          reg25 <= $unsigned((((&(reg23 ?
              (8'h9e) : reg22)) <= wire20) ^ ((((8'ha0) ? wire18 : wire21) ?
                  (wire18 ? wire19 : wire20) : $unsigned(wire16)) ?
              wire20 : $unsigned(wire20[(2'h2):(2'h2)]))));
          if ($signed(wire19))
            begin
              reg26 <= (wire16 ?
                  $signed(reg23) : {wire16[(3'h4):(2'h3)],
                      ($unsigned((wire17 ^ (8'ha8))) ?
                          reg22 : $unsigned((wire17 ? (8'ha0) : wire20)))});
              reg27 <= (reg24[(2'h2):(1'h1)] ^ reg24);
              reg28 <= $unsigned($unsigned(wire18[(3'h5):(2'h2)]));
            end
          else
            begin
              reg26 <= $signed(wire18);
              reg27 <= ($signed((~&(reg23[(1'h0):(1'h0)] ?
                  (~&(8'hb5)) : reg28))) >> wire17);
              reg28 <= $signed(($unsigned($signed((wire19 ? wire16 : wire20))) ?
                  (+$unsigned(wire16)) : $unsigned($unsigned((8'hb2)))));
              reg29 <= wire20;
            end
          if (wire21)
            begin
              reg30 <= ($signed((reg24[(1'h1):(1'h1)] ?
                  $unsigned($unsigned((8'hba))) : $signed((wire18 + wire17)))) < wire17);
              reg31 <= reg28;
            end
          else
            begin
              reg30 <= ((wire18 != reg24) ?
                  ((|wire18) || wire16) : $signed((($unsigned(reg25) ?
                      ((8'hb1) == wire21) : wire19[(3'h5):(3'h5)]) - reg23[(3'h7):(2'h2)])));
              reg31 <= (-$signed(((8'hac) || ((~reg23) ?
                  $unsigned(reg24) : $signed(reg25)))));
              reg32 <= $unsigned((wire19 ?
                  (reg28 && $unsigned($unsigned(reg28))) : wire17));
            end
        end
      else
        begin
          if ((($signed(reg31[(4'hc):(4'h8)]) ?
                  (~&reg23) : $signed($signed(wire19[(4'h8):(2'h3)]))) ?
              ((^~($unsigned(wire21) >= $unsigned(reg24))) ~^ (-reg23)) : $unsigned($unsigned({wire16}))))
            begin
              reg24 <= wire20;
              reg25 <= (((|reg32) >= (($signed(wire21) ?
                      reg26[(4'hb):(3'h7)] : (8'ha3)) > (+{reg26}))) ?
                  (~reg30[(1'h1):(1'h1)]) : ($signed((~^(reg25 ?
                          reg25 : reg24))) ?
                      $unsigned(reg25) : ((wire21[(3'h6):(3'h5)] ?
                              (reg32 ^ wire21) : reg23[(4'hd):(3'h4)]) ?
                          reg28 : {reg28[(4'he):(4'h8)]})));
              reg26 <= reg25;
            end
          else
            begin
              reg24 <= (~^$signed(($signed(reg28[(4'hf):(1'h0)]) <<< (&$signed(reg28)))));
              reg25 <= reg27[(3'h4):(2'h3)];
              reg26 <= wire17;
              reg27 <= (^$unsigned((((wire16 != reg27) ^ (reg24 < reg22)) ?
                  {$unsigned(wire20)} : {wire17, (8'hab)})));
            end
          reg28 <= $unsigned($signed($signed((~&(reg26 ? wire19 : wire17)))));
          reg29 <= reg25[(2'h2):(2'h2)];
          reg30 <= $signed((((!{wire18, wire19}) ?
              $signed($signed(wire19)) : $signed((reg22 <<< wire19))) << (|$unsigned((reg32 ?
              reg29 : reg24)))));
          reg31 <= (8'ha0);
        end
      if ($unsigned($unsigned((~$unsigned((+reg25))))))
        begin
          reg33 <= $unsigned(((!$signed(reg24)) - (reg32 ^~ reg31[(3'h6):(3'h6)])));
          reg34 <= ($signed(reg23) == reg25[(2'h3):(2'h3)]);
        end
      else
        begin
          reg33 <= $unsigned(($unsigned(((8'ha8) ?
              reg29 : (|(8'haa)))) || {((~&reg28) ?
                  (~reg34) : {reg23, reg25})}));
          reg34 <= reg29;
          reg35 <= reg34[(3'h4):(3'h4)];
        end
      reg36 <= {((7'h41) ?
              reg30[(3'h4):(3'h4)] : $signed(reg32[(2'h2):(2'h2)]))};
    end
  always
    @(posedge clk) begin
      if ((reg30[(2'h3):(1'h1)] ?
          {($unsigned(reg34) ?
                  (((8'ha8) ? reg32 : wire16) && (reg29 ?
                      reg30 : reg24)) : ((reg34 != reg28) ?
                      {reg23,
                          reg29} : $unsigned(wire18)))} : (($unsigned(wire20) == {(!(8'hbf))}) ?
              (((reg33 ? reg30 : (7'h44)) >>> reg26) | $signed({reg33,
                  wire18})) : $unsigned($signed(reg30)))))
        begin
          if (($signed((reg36[(3'h4):(3'h4)] ?
              ($unsigned(reg23) ?
                  reg36[(4'h8):(1'h1)] : wire21[(3'h7):(1'h1)]) : (wire19[(3'h4):(1'h1)] >= $signed(reg31)))) != (8'hb0)))
            begin
              reg37 <= (((reg36[(3'h5):(1'h0)] < $signed((^~reg22))) ?
                  {{reg22, $signed(wire21)}} : $unsigned((reg32 ?
                      $unsigned(reg28) : (wire21 ^~ reg27)))) <= (|($unsigned($unsigned(reg23)) ?
                  $signed(reg33) : reg31)));
              reg38 <= ((wire20 ?
                      (((&reg27) << (reg35 ? reg25 : reg27)) ?
                          reg35 : $unsigned((~(8'ha2)))) : $unsigned($unsigned($unsigned(reg30)))) ?
                  {reg36, reg31} : ((+{reg32[(3'h4):(1'h0)],
                      reg29}) * reg33[(3'h5):(3'h5)]));
              reg39 <= {wire19[(2'h2):(1'h1)]};
              reg40 <= reg31;
            end
          else
            begin
              reg37 <= ((&$signed((((8'ha2) >> wire17) ?
                  (reg31 > reg24) : (|wire17)))) ^ (~(~reg27)));
              reg38 <= $signed(reg40[(4'hf):(4'ha)]);
              reg39 <= $signed(wire19);
              reg40 <= (~^((~&$unsigned(wire19[(4'hc):(2'h2)])) <<< reg35));
              reg41 <= reg40;
            end
          reg42 <= $unsigned((($unsigned({(8'hbd),
              reg25}) | wire19[(2'h3):(2'h2)]) ~^ $signed($signed((~reg34)))));
          reg43 <= wire21[(2'h3):(1'h1)];
        end
      else
        begin
          reg37 <= (({((reg37 ? (8'hbe) : reg42) ? reg24 : {reg41, (8'ha8)})} ?
              $signed(reg33) : (-($unsigned(reg23) ?
                  (reg34 ? reg33 : reg37) : (reg26 <<< (7'h40))))) * reg37);
          reg38 <= reg31;
        end
      reg44 <= ($signed($signed(reg37[(1'h1):(1'h0)])) >>> $unsigned(($signed(reg42[(2'h2):(1'h1)]) ?
          reg43[(2'h2):(1'h1)] : ((~wire19) ?
              reg41[(2'h2):(1'h1)] : (reg36 >>> reg28)))));
    end
  assign wire45 = (8'ha6);
endmodule

module module83
#(parameter param120 = {(8'ha0), {(&(^~((8'h9d) > (8'hbb))))}}, 
parameter param121 = (((param120 <= (((8'hb2) ^~ param120) << (param120 ? param120 : param120))) ? ((!(~&(8'hb7))) ? (param120 ? (param120 == param120) : (^~param120)) : (^~(~^param120))) : (~((&param120) >>> (param120 >= param120)))) ? ((&((8'ha2) ? (param120 ? param120 : param120) : (param120 ? param120 : param120))) ? ({param120} ? (8'hba) : ((param120 || param120) ? (param120 ? param120 : param120) : (param120 ? param120 : param120))) : ({(param120 ? param120 : (8'hbb)), (|param120)} ? param120 : ({param120} & {param120}))) : param120))
(y, clk, wire87, wire86, wire85, wire84);
  output wire [(32'h149):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire87;
  input wire [(5'h15):(1'h0)] wire86;
  input wire [(5'h15):(1'h0)] wire85;
  input wire signed [(2'h3):(1'h0)] wire84;
  wire [(4'hb):(1'h0)] wire93;
  wire signed [(4'h9):(1'h0)] wire92;
  wire signed [(2'h2):(1'h0)] wire91;
  wire [(3'h7):(1'h0)] wire90;
  wire signed [(5'h13):(1'h0)] wire89;
  wire [(4'hb):(1'h0)] wire88;
  reg signed [(4'hc):(1'h0)] reg119 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg118 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg117 = (1'h0);
  reg [(2'h3):(1'h0)] reg116 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg114 = (1'h0);
  reg [(5'h12):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg112 = (1'h0);
  reg [(4'hc):(1'h0)] reg111 = (1'h0);
  reg [(4'hf):(1'h0)] reg110 = (1'h0);
  reg [(4'h9):(1'h0)] reg109 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg107 = (1'h0);
  reg [(3'h5):(1'h0)] reg106 = (1'h0);
  reg [(3'h7):(1'h0)] reg105 = (1'h0);
  reg [(5'h14):(1'h0)] reg104 = (1'h0);
  reg [(2'h3):(1'h0)] reg103 = (1'h0);
  reg [(2'h3):(1'h0)] reg102 = (1'h0);
  reg [(4'hb):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg100 = (1'h0);
  reg [(5'h12):(1'h0)] reg99 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg98 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg97 = (1'h0);
  reg [(3'h6):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg95 = (1'h0);
  reg [(4'hc):(1'h0)] reg94 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 (1'h0)};
  assign wire88 = $signed(($signed(wire84[(1'h1):(1'h1)]) ?
                      wire85[(5'h12):(3'h4)] : wire84));
  assign wire89 = (~(wire86[(5'h12):(4'ha)] << wire85));
  assign wire90 = ((8'had) ? wire84 : wire84);
  assign wire91 = $signed(wire89);
  assign wire92 = $signed($signed($unsigned(($unsigned(wire88) ?
                      {(8'hbf)} : wire89[(4'hf):(4'h8)]))));
  assign wire93 = ($signed(wire92[(2'h3):(2'h3)]) || wire90);
  always
    @(posedge clk) begin
      reg94 <= (8'ha8);
      if ($signed(wire84))
        begin
          if (wire93)
            begin
              reg95 <= $unsigned((wire84[(2'h3):(2'h3)] * (^~$unsigned(wire84))));
            end
          else
            begin
              reg95 <= reg94[(1'h1):(1'h0)];
              reg96 <= (wire90[(1'h0):(1'h0)] && reg95[(3'h5):(2'h2)]);
            end
          reg97 <= (^~(~&wire87));
          reg98 <= ((!$unsigned((8'ha6))) ?
              (wire91 ^~ reg97) : (-{$unsigned((~^wire90)),
                  $unsigned(((8'h9d) ? wire84 : wire88))}));
        end
      else
        begin
          reg95 <= {(&reg96)};
          reg96 <= $unsigned((^wire91[(1'h1):(1'h0)]));
          reg97 <= ($signed($unsigned(wire90)) && wire84[(2'h2):(1'h0)]);
        end
      reg99 <= wire88;
    end
  always
    @(posedge clk) begin
      if ((|(reg95[(2'h3):(1'h0)] <<< reg94)))
        begin
          reg100 <= wire93[(3'h6):(2'h2)];
          reg101 <= (reg98 | (reg95[(1'h1):(1'h1)] <= $unsigned((wire92[(3'h7):(3'h5)] < (wire84 >= wire85)))));
          reg102 <= reg98;
          if ((&wire91[(1'h0):(1'h0)]))
            begin
              reg103 <= ($signed(({(reg101 ? (8'hb3) : wire93)} ?
                      $unsigned((wire93 ?
                          reg96 : wire92)) : $unsigned(reg94))) ?
                  {wire87[(1'h0):(1'h0)],
                      $unsigned(reg101[(2'h3):(1'h1)])} : (^wire92));
              reg104 <= $signed($unsigned((reg95 > $signed(wire89[(4'h9):(3'h4)]))));
              reg105 <= {{(|{wire92[(2'h3):(2'h3)], $signed(reg103)})}};
            end
          else
            begin
              reg103 <= wire85[(1'h1):(1'h1)];
              reg104 <= (~^(-reg100[(4'hc):(2'h3)]));
              reg105 <= (~|(reg97 * ($unsigned(reg103[(2'h2):(1'h1)]) <<< wire91[(2'h2):(2'h2)])));
              reg106 <= {wire88[(2'h3):(1'h1)],
                  (($signed($unsigned(wire92)) ?
                      (reg103 ?
                          reg100[(4'hb):(3'h7)] : $unsigned(wire87)) : {(|(7'h43))}) & reg103[(2'h3):(1'h0)])};
            end
          reg107 <= (~|($signed(((-reg94) ?
                  (reg104 ? wire86 : (7'h43)) : $signed(wire89))) ?
              ($unsigned($unsigned(reg94)) ?
                  (~|(8'hba)) : wire91) : $signed(reg101)));
        end
      else
        begin
          reg100 <= $signed(reg98);
          reg101 <= reg104;
          reg102 <= wire92[(2'h3):(2'h3)];
          reg103 <= $signed(((~^$unsigned((reg102 ?
              wire88 : reg99))) * $signed((reg99[(5'h11):(3'h4)] ~^ reg103))));
        end
      reg108 <= ($signed(reg94[(2'h2):(1'h1)]) < $unsigned({$unsigned((reg102 >= wire85)),
          (!(wire88 ^ reg100))}));
      reg109 <= reg101;
      reg110 <= ((-$unsigned(reg102[(2'h2):(1'h0)])) & (^$unsigned(((!reg95) ?
          (reg100 ? wire87 : wire88) : reg94))));
      if (reg109)
        begin
          reg111 <= (reg106 || reg97);
          reg112 <= wire89;
        end
      else
        begin
          reg111 <= reg97;
          reg112 <= $signed(((wire84[(2'h2):(1'h1)] ?
                  $unsigned($unsigned(reg112)) : ((reg108 < reg95) ?
                      (reg98 ? reg112 : reg108) : reg103)) ?
              (^$unsigned((&(8'ha3)))) : reg98));
          if (reg103)
            begin
              reg113 <= (&{(({reg103} ? wire87 : reg95) ?
                      (|((7'h43) ? reg100 : reg96)) : (&$signed(wire93)))});
              reg114 <= $signed(reg97);
              reg115 <= (reg103[(1'h1):(1'h1)] ? reg108 : reg101);
              reg116 <= $unsigned(reg100);
              reg117 <= (reg106 << $signed($unsigned(reg103[(1'h1):(1'h0)])));
            end
          else
            begin
              reg113 <= ({(reg101[(4'ha):(3'h7)] <<< (!$signed(reg106))),
                  ((wire90 ?
                      $unsigned(wire92) : (reg102 ?
                          reg95 : reg114)) && wire92[(3'h7):(2'h2)])} != (-(&reg113[(4'ha):(4'h8)])));
              reg114 <= (wire93 ?
                  ($signed({(wire89 ? wire93 : reg98), {reg111}}) ?
                      reg109 : $signed(((-reg104) * $signed(reg111)))) : {$signed(reg111[(4'hc):(1'h0)])});
              reg115 <= $signed($signed($unsigned($signed((8'h9c)))));
              reg116 <= (&(reg114[(5'h11):(1'h0)] > (wire91 ?
                  (reg110 << reg99) : (((7'h44) ?
                      reg104 : reg113) <= $unsigned(reg101)))));
            end
          reg118 <= reg114[(2'h2):(2'h2)];
          reg119 <= (8'hb0);
        end
    end
endmodule
