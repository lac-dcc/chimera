module top
#(parameter param140 = ((~^((((8'hba) ? (8'hab) : (8'hac)) ? (~|(8'haf)) : ((8'hb9) + (8'h9c))) ? ((&(8'ha0)) ? ((8'hbb) ? (8'hb3) : (8'hbc)) : ((8'ha0) != (8'ha0))) : (~^(8'hb3)))) ? ((^(~|(+(8'h9c)))) ? (({(8'hae)} * ((8'hbf) ? (8'hae) : (7'h43))) + (((8'hb3) ? (8'had) : (8'hab)) ? ((8'hb7) & (7'h43)) : (|(8'h9d)))) : (!(8'ha6))) : ((~|(&(8'hae))) ? (({(8'h9f)} <= ((8'hb1) >= (7'h44))) && (((7'h42) ? (8'hb2) : (8'ha7)) ? ((8'ha4) | (7'h41)) : ((8'hb3) ? (8'hab) : (8'hac)))) : ((~((8'ha8) < (8'ha7))) - (((8'ha3) ? (8'h9d) : (8'hbb)) == ((8'h9d) != (8'ha1)))))), 
parameter param141 = ((~|param140) - (8'hb0)))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hf3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire3;
  wire [(4'hf):(1'h0)] wire139;
  wire [(3'h6):(1'h0)] wire138;
  wire [(4'h8):(1'h0)] wire122;
  wire signed [(4'h8):(1'h0)] wire121;
  wire [(3'h4):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire119;
  reg [(3'h7):(1'h0)] reg137 = (1'h0);
  reg signed [(4'he):(1'h0)] reg136 = (1'h0);
  reg [(4'hf):(1'h0)] reg135 = (1'h0);
  reg [(5'h14):(1'h0)] reg134 = (1'h0);
  reg [(5'h10):(1'h0)] reg133 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg131 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg129 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg128 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg127 = (1'h0);
  reg [(4'ha):(1'h0)] reg126 = (1'h0);
  reg [(4'h8):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg123 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg5 = (1'h0);
  reg [(5'h10):(1'h0)] reg4 = (1'h0);
  assign y = {wire139,
                 wire138,
                 wire122,
                 wire121,
                 wire6,
                 wire119,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $unsigned({$unsigned((&(~&wire1))), (8'ha8)});
      reg5 <= (-(wire0 ? wire0 : wire3));
    end
  assign wire6 = $signed($unsigned(wire3[(2'h3):(1'h0)]));
  module7 #() modinst120 (.wire12(reg5), .y(wire119), .wire11(wire0), .clk(clk), .wire10(reg4), .wire8(wire2), .wire9(wire3));
  assign wire121 = ({wire3[(1'h0):(1'h0)], $signed(reg4)} ?
                       (($unsigned({wire1}) ?
                           $unsigned((wire0 ?
                               reg5 : wire2)) : $unsigned(wire2)) >>> (8'ha0)) : reg4[(4'hd):(4'hb)]);
  assign wire122 = $signed((wire3 ?
                       ((^(reg5 ?
                           (8'haf) : reg5)) == $signed((~&wire0))) : ($signed((reg5 ?
                           wire1 : (8'hb9))) + (wire121[(3'h5):(3'h5)] ?
                           $unsigned(wire2) : (wire2 ? wire2 : wire0)))));
  always
    @(posedge clk) begin
      if ($signed({(reg5 ?
              wire122[(1'h1):(1'h1)] : $unsigned($signed((8'hae)))),
          (($unsigned(reg4) ?
              ((8'hb8) < (8'hb3)) : $signed(wire3)) | $signed(((7'h42) & wire6)))}))
        begin
          reg123 <= $unsigned(($unsigned((|$signed(reg4))) <= (|(^$unsigned((8'ha1))))));
          reg124 <= $unsigned($unsigned($signed(((wire3 ? wire119 : wire3) ?
              reg4[(4'ha):(2'h3)] : wire3))));
          reg125 <= $unsigned({(reg4[(3'h5):(1'h0)] ^~ (reg123 * (wire121 == wire6))),
              (((reg5 ? wire1 : wire119) ? (reg5 & reg124) : (-wire0)) ?
                  reg123[(1'h0):(1'h0)] : ($unsigned((8'hbe)) ?
                      (^~reg4) : reg4))});
          reg126 <= $unsigned(reg4);
          if ((-wire119))
            begin
              reg127 <= $unsigned((~^(&$signed((wire119 < wire119)))));
              reg128 <= (($unsigned(wire2[(1'h1):(1'h1)]) ?
                      wire3 : $unsigned($unsigned((~&wire1)))) ?
                  wire2 : reg4[(2'h3):(1'h1)]);
              reg129 <= {$signed((-$unsigned(((8'ha1) * reg4))))};
            end
          else
            begin
              reg127 <= wire1[(2'h3):(2'h3)];
              reg128 <= wire6;
            end
        end
      else
        begin
          reg123 <= (~&((($signed((8'ha0)) > (reg4 ?
                  reg5 : reg125)) ^~ $unsigned($signed(reg129))) ?
              $signed({$signed(wire3),
                  (reg124 <= wire2)}) : $unsigned(((reg127 >> wire6) ?
                  (wire119 ? reg129 : reg124) : (wire0 || reg125)))));
          reg124 <= wire121;
          if (((~((wire119[(3'h6):(2'h3)] ?
              reg129 : reg124[(1'h0):(1'h0)]) << ((8'haa) - reg124))) || $unsigned((+((wire1 << wire3) ?
              $signed(wire1) : wire0)))))
            begin
              reg125 <= $signed(((wire0 ?
                  $signed(wire6[(1'h1):(1'h0)]) : reg123[(2'h3):(2'h2)]) ~^ $signed({{reg129}})));
            end
          else
            begin
              reg125 <= (-($signed(({wire122, wire0} && wire3)) || reg127));
            end
          if ((-reg125[(3'h5):(3'h5)]))
            begin
              reg126 <= $unsigned(((~^(reg126 ?
                  reg124[(3'h5):(3'h4)] : (+wire1))) ^~ ((|wire122[(1'h0):(1'h0)]) & (reg124 ?
                  $unsigned(wire121) : reg126[(4'h8):(3'h5)]))));
              reg127 <= $unsigned(($signed($unsigned((~reg125))) ?
                  (reg4[(3'h5):(2'h3)] ?
                      wire1 : (+$unsigned(reg5))) : wire121[(3'h5):(3'h4)]));
              reg128 <= (-$signed(($unsigned((+reg128)) ?
                  (reg123[(2'h3):(2'h2)] ?
                      {reg127,
                          reg129} : reg126[(3'h5):(1'h0)]) : (~|(~reg126)))));
            end
          else
            begin
              reg126 <= $unsigned($unsigned(({((8'ha6) ? (7'h40) : wire1),
                  (wire2 && (8'hb7))} << wire2)));
              reg127 <= ({reg128, reg123} ?
                  (($unsigned($signed((8'hbb))) ?
                          (wire6[(2'h3):(1'h1)] || (+reg127)) : $unsigned(((8'hb7) ?
                              wire119 : wire3))) ?
                      wire1 : ({(wire2 ? reg124 : reg123)} == ((wire122 ?
                          wire122 : (8'hbe)) <= wire121[(3'h5):(1'h1)]))) : wire0[(2'h3):(2'h2)]);
              reg128 <= {wire1};
              reg129 <= (~^(~&(~^(wire121 | (reg124 ? wire121 : wire122)))));
            end
        end
      if ((reg123 || $signed($unsigned({$signed(wire122)}))))
        begin
          reg130 <= {$signed(wire122[(4'h8):(3'h4)]),
              (wire2[(3'h6):(3'h6)] >= $signed((&reg127)))};
          reg131 <= reg123;
          reg132 <= (wire2[(3'h4):(2'h3)] ~^ wire2);
          reg133 <= wire0;
          reg134 <= (~$signed({(reg125[(1'h0):(1'h0)] ? (-wire1) : {reg5}),
              $signed((reg124 ^ wire2))}));
        end
      else
        begin
          reg130 <= wire6;
          if (($signed($signed(reg130)) ?
              (reg126 == (reg131 ^ (!wire119[(1'h0):(1'h0)]))) : $unsigned($unsigned(((reg128 && reg128) ?
                  reg124[(4'h9):(4'h8)] : (wire2 & wire1))))))
            begin
              reg131 <= (wire0[(4'hd):(4'ha)] ?
                  wire122[(3'h7):(2'h2)] : $unsigned(reg133));
              reg132 <= ((^wire122) ?
                  ((reg4 < {$unsigned((8'h9c)), (!wire119)}) ?
                      (~^(reg127 ?
                          (wire2 >= (8'ha2)) : (&reg126))) : wire6) : reg129);
            end
          else
            begin
              reg131 <= reg131;
              reg132 <= ((reg4[(4'h9):(4'h8)] ?
                  wire119[(3'h5):(2'h3)] : {$signed((reg4 ? reg131 : reg123)),
                      (-$unsigned((8'hb6)))}) >= reg126);
              reg133 <= wire0[(4'hb):(3'h4)];
              reg134 <= $signed({{{reg127}, reg123[(3'h4):(2'h2)]}, (8'h9c)});
            end
          reg135 <= $signed(reg129[(2'h2):(2'h2)]);
        end
      reg136 <= reg130[(1'h1):(1'h1)];
      reg137 <= ((reg126[(4'h9):(2'h3)] * $unsigned((~|$signed(wire3)))) ?
          $signed((7'h40)) : $signed(reg123[(1'h1):(1'h0)]));
    end
  assign wire138 = (reg134[(4'he):(3'h4)] ? reg128 : $unsigned(reg134));
  assign wire139 = reg136[(1'h1):(1'h0)];
endmodule

module module7
#(parameter param117 = (~|(~|(((|(8'had)) > ((8'hb5) == (8'hb4))) ? (~&(!(8'h9c))) : (((8'hbc) ? (8'hb2) : (8'ha7)) - ((8'hb3) ? (7'h43) : (8'hb7)))))), 
parameter param118 = (8'hbe))
(y, clk, wire8, wire9, wire10, wire11, wire12);
  output wire [(32'h164):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire8;
  input wire [(5'h10):(1'h0)] wire9;
  input wire [(5'h10):(1'h0)] wire10;
  input wire signed [(5'h11):(1'h0)] wire11;
  input wire [(2'h3):(1'h0)] wire12;
  wire [(4'hc):(1'h0)] wire116;
  wire signed [(2'h2):(1'h0)] wire13;
  wire [(4'he):(1'h0)] wire14;
  wire signed [(5'h11):(1'h0)] wire15;
  wire signed [(4'hd):(1'h0)] wire16;
  wire [(5'h15):(1'h0)] wire28;
  wire signed [(2'h3):(1'h0)] wire29;
  wire [(4'hd):(1'h0)] wire30;
  wire signed [(4'hf):(1'h0)] wire31;
  wire [(5'h12):(1'h0)] wire32;
  wire signed [(4'hc):(1'h0)] wire33;
  wire signed [(4'hc):(1'h0)] wire34;
  wire [(4'h8):(1'h0)] wire37;
  wire [(3'h5):(1'h0)] wire38;
  wire [(2'h2):(1'h0)] wire39;
  wire signed [(3'h4):(1'h0)] wire40;
  wire signed [(3'h4):(1'h0)] wire41;
  wire signed [(4'hd):(1'h0)] wire42;
  wire [(5'h13):(1'h0)] wire43;
  wire [(3'h5):(1'h0)] wire114;
  reg [(2'h2):(1'h0)] reg17 = (1'h0);
  reg [(4'hf):(1'h0)] reg18 = (1'h0);
  reg [(4'ha):(1'h0)] reg19 = (1'h0);
  reg [(4'hd):(1'h0)] reg20 = (1'h0);
  reg [(4'hd):(1'h0)] reg21 = (1'h0);
  reg [(4'he):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg23 = (1'h0);
  reg signed [(4'he):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg26 = (1'h0);
  reg [(4'hf):(1'h0)] reg27 = (1'h0);
  reg [(3'h6):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg36 = (1'h0);
  assign y = {wire116,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire28,
                 wire29,
                 wire30,
                 wire31,
                 wire32,
                 wire33,
                 wire34,
                 wire37,
                 wire38,
                 wire39,
                 wire40,
                 wire41,
                 wire42,
                 wire43,
                 wire114,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg35,
                 reg36,
                 (1'h0)};
  assign wire13 = (wire12[(1'h1):(1'h1)] ?
                      $signed({wire9}) : (wire11 ?
                          wire10[(4'ha):(4'h9)] : $signed((8'h9c))));
  assign wire14 = (wire13 > ($signed($signed(wire11)) ?
                      (&(((8'hb4) != wire12) ?
                          wire10[(3'h7):(1'h0)] : wire10)) : (wire8 + wire10[(3'h6):(2'h2)])));
  assign wire15 = (8'ha8);
  assign wire16 = $signed(({((wire8 || wire12) && $unsigned(wire13))} ?
                      wire13 : (^$unsigned((wire8 ? wire15 : (8'hb4))))));
  always
    @(posedge clk) begin
      reg17 <= {$unsigned((wire10[(2'h2):(2'h2)] ?
              $unsigned((-wire14)) : wire10)),
          wire9};
      reg18 <= ((wire16 ? ({(^~wire10), $unsigned(wire10)} + wire8) : wire16) ?
          (reg17[(1'h1):(1'h1)] || (~&(((8'ha1) ?
              (8'ha6) : (8'hbe)) >> $unsigned((8'hbf))))) : reg17);
      if (wire16[(3'h4):(3'h4)])
        begin
          reg19 <= ((wire11[(5'h11):(4'hc)] ^ (+(~(~^wire9)))) ~^ {{$signed(reg17)}});
          reg20 <= wire13;
          reg21 <= reg18;
        end
      else
        begin
          reg19 <= $unsigned(wire10[(4'h9):(4'h8)]);
        end
      if (($signed(reg19[(2'h2):(1'h1)]) < wire11))
        begin
          reg22 <= {((-(reg20[(4'hd):(2'h2)] ?
                  ((8'hac) & reg17) : (wire12 ?
                      wire13 : wire14))) ~^ reg21[(2'h2):(1'h0)])};
          reg23 <= wire11[(2'h3):(2'h3)];
          reg24 <= $signed($unsigned($signed($unsigned(((8'haf) != reg19)))));
          reg25 <= (~|$unsigned(reg19[(2'h3):(1'h1)]));
          reg26 <= reg21;
        end
      else
        begin
          reg22 <= $signed(((($unsigned((8'hb1)) ?
                  (|(8'hac)) : reg26[(3'h5):(2'h3)]) ?
              $signed((reg23 ? reg21 : wire8)) : (^~{wire9,
                  reg21})) == {{wire13, (reg19 == reg22)}, wire8}));
          reg23 <= ($signed((reg17[(2'h2):(1'h1)] ?
              {reg25[(2'h2):(1'h1)],
                  $signed(reg22)} : (8'ha7))) <= $signed($signed({wire8[(2'h2):(2'h2)],
              reg22[(4'hb):(3'h7)]})));
          reg24 <= $unsigned($unsigned(($unsigned($signed(wire9)) + ((~^reg23) < (~|wire12)))));
          reg25 <= ({reg19} << {reg26,
              ((((8'hb3) ? wire15 : reg20) ?
                      wire12[(1'h0):(1'h0)] : $signed(reg17)) ?
                  (~^$signed(reg24)) : wire8)});
        end
      reg27 <= $signed(wire11[(5'h10):(4'h9)]);
    end
  assign wire28 = {($unsigned((~|$signed(reg18))) ?
                          ($unsigned($unsigned(reg25)) - (~$unsigned(wire12))) : wire16[(3'h7):(3'h7)]),
                      $signed($signed($unsigned($unsigned(reg25))))};
  assign wire29 = (^((((&reg22) || $signed(reg24)) ^~ reg17) ?
                      wire13 : (!$signed((reg26 > reg23)))));
  assign wire30 = (~|(($unsigned(wire11[(4'h8):(3'h7)]) <= ((8'hb2) ?
                      (wire29 <= wire11) : $unsigned((7'h42)))) << $signed(reg26)));
  assign wire31 = ($signed((($signed(wire9) && (~&wire8)) ?
                          reg25[(2'h2):(2'h2)] : (~&(wire10 ?
                              reg26 : (8'ha6))))) ?
                      reg20 : (8'hbd));
  assign wire32 = $signed((($signed($unsigned(wire14)) ?
                      (wire13 ?
                          (reg24 & reg27) : {wire12}) : $unsigned((8'hab))) <= (+((8'hb5) ^ $unsigned(wire12)))));
  assign wire33 = (&reg17[(2'h2):(1'h1)]);
  assign wire34 = wire16;
  always
    @(posedge clk) begin
      reg35 <= $unsigned({((((8'hb2) ? wire12 : wire34) ?
              (wire30 ?
                  (8'ha6) : reg26) : reg25) > $unsigned($signed(reg25)))});
      reg36 <= (($signed(wire33[(3'h6):(3'h5)]) ?
          ((&wire28[(2'h2):(1'h0)]) ?
              $signed(reg21) : $unsigned((reg17 ?
                  wire8 : wire32))) : $unsigned($unsigned({wire8,
              wire29}))) >>> $signed(((|reg19) ?
          reg25[(1'h0):(1'h0)] : $unsigned(((8'hba) >= wire28)))));
    end
  assign wire37 = wire33[(4'h8):(1'h1)];
  assign wire38 = ($signed(wire31[(3'h7):(3'h6)]) == reg26[(4'hb):(4'h8)]);
  assign wire39 = ($unsigned($unsigned($unsigned((wire32 ? reg18 : reg20)))) ?
                      (~wire9) : reg27);
  assign wire40 = (-(wire38 ?
                      reg27 : (((wire8 >= (8'hae)) ?
                          (~&reg35) : (wire15 >> wire33)) <<< wire29[(1'h1):(1'h0)])));
  assign wire41 = wire39[(2'h2):(1'h1)];
  assign wire42 = (wire33 ^ reg26[(4'hf):(4'he)]);
  assign wire43 = $unsigned(({($unsigned(wire14) ?
                              wire33 : wire12[(1'h1):(1'h1)]),
                          $unsigned(wire15[(2'h3):(1'h1)])} ?
                      (|$signed($signed(wire29))) : {((reg25 ?
                              reg27 : (7'h43)) << (reg17 >> (8'ha0)))}));
  module44 #() modinst115 (.wire46(wire38), .wire45(reg27), .wire47(wire28), .y(wire114), .wire48(wire31), .clk(clk));
  assign wire116 = wire43;
endmodule

module module44  (y, clk, wire48, wire47, wire46, wire45);
  output wire [(32'h2c7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire48;
  input wire signed [(3'h5):(1'h0)] wire47;
  input wire [(2'h2):(1'h0)] wire46;
  input wire [(4'hf):(1'h0)] wire45;
  wire [(2'h3):(1'h0)] wire113;
  wire signed [(4'hd):(1'h0)] wire112;
  wire signed [(5'h11):(1'h0)] wire111;
  wire [(4'hf):(1'h0)] wire89;
  wire [(4'h9):(1'h0)] wire88;
  wire signed [(4'h8):(1'h0)] wire87;
  wire signed [(3'h5):(1'h0)] wire64;
  wire [(3'h6):(1'h0)] wire63;
  wire [(4'h8):(1'h0)] wire62;
  wire [(4'hc):(1'h0)] wire61;
  wire [(5'h11):(1'h0)] wire60;
  wire [(5'h15):(1'h0)] wire56;
  wire signed [(4'h9):(1'h0)] wire53;
  wire [(3'h7):(1'h0)] wire52;
  wire signed [(3'h7):(1'h0)] wire51;
  wire [(5'h13):(1'h0)] wire50;
  wire signed [(3'h4):(1'h0)] wire49;
  reg signed [(4'he):(1'h0)] reg110 = (1'h0);
  reg [(2'h2):(1'h0)] reg109 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg107 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg105 = (1'h0);
  reg [(3'h4):(1'h0)] reg104 = (1'h0);
  reg [(3'h5):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg102 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg101 = (1'h0);
  reg [(5'h15):(1'h0)] reg100 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg99 = (1'h0);
  reg [(4'h8):(1'h0)] reg98 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg97 = (1'h0);
  reg [(4'h8):(1'h0)] reg96 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg95 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg94 = (1'h0);
  reg [(4'h9):(1'h0)] reg93 = (1'h0);
  reg [(4'h9):(1'h0)] reg92 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg91 = (1'h0);
  reg [(4'hd):(1'h0)] reg90 = (1'h0);
  reg [(4'h9):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg85 = (1'h0);
  reg [(4'hf):(1'h0)] reg84 = (1'h0);
  reg [(3'h6):(1'h0)] reg83 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg82 = (1'h0);
  reg [(5'h11):(1'h0)] reg81 = (1'h0);
  reg [(4'h8):(1'h0)] reg80 = (1'h0);
  reg [(2'h3):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg78 = (1'h0);
  reg [(4'ha):(1'h0)] reg77 = (1'h0);
  reg [(5'h13):(1'h0)] reg76 = (1'h0);
  reg [(5'h10):(1'h0)] reg75 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg74 = (1'h0);
  reg [(2'h2):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg71 = (1'h0);
  reg [(4'hb):(1'h0)] reg70 = (1'h0);
  reg [(5'h13):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg68 = (1'h0);
  reg signed [(4'he):(1'h0)] reg67 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg66 = (1'h0);
  reg [(5'h11):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg59 = (1'h0);
  reg [(3'h6):(1'h0)] reg58 = (1'h0);
  reg [(4'ha):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg55 = (1'h0);
  reg [(5'h12):(1'h0)] reg54 = (1'h0);
  assign y = {wire113,
                 wire112,
                 wire111,
                 wire89,
                 wire88,
                 wire87,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire56,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
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
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg86,
                 reg85,
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
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg59,
                 reg58,
                 reg57,
                 reg55,
                 reg54,
                 (1'h0)};
  assign wire49 = (^~({$unsigned($signed((8'hae)))} ?
                      $signed($signed((wire48 && wire48))) : wire48[(2'h3):(1'h0)]));
  assign wire50 = $unsigned(wire46[(1'h0):(1'h0)]);
  assign wire51 = $unsigned((($signed($unsigned((8'ha0))) ~^ ((wire50 + wire50) ?
                          wire46 : (wire48 ? wire49 : wire45))) ?
                      ((~$signed(wire46)) - ((8'had) ?
                          (~|wire46) : (!wire49))) : wire48));
  assign wire52 = (wire45[(2'h3):(1'h1)] ?
                      $signed($unsigned($signed($signed(wire46)))) : (wire50 ?
                          $unsigned(wire48) : $unsigned(($signed(wire45) ?
                              {wire45, wire51} : (wire49 <= wire51)))));
  assign wire53 = (wire50 <= $unsigned((~(-$signed(wire51)))));
  always
    @(posedge clk) begin
      reg54 <= $signed($signed((($unsigned(wire48) ?
              ((8'hac) <<< wire46) : (wire51 ? wire45 : (8'h9f))) ?
          $unsigned(((8'hbb) && wire52)) : wire50[(4'hd):(2'h3)])));
      reg55 <= (8'hbc);
    end
  assign wire56 = (reg55[(5'h11):(1'h1)] >= wire51);
  always
    @(posedge clk) begin
      reg57 <= wire56;
      reg58 <= $unsigned(($unsigned($signed((wire56 ?
          (8'hb8) : wire51))) ^ $unsigned($signed((8'h9c)))));
      reg59 <= (7'h40);
    end
  assign wire60 = wire52;
  assign wire61 = (8'hb7);
  assign wire62 = wire48[(1'h1):(1'h0)];
  assign wire63 = (~($signed($signed(reg55[(1'h1):(1'h1)])) ?
                      (!(~&(wire49 & (8'hbc)))) : (|wire47[(3'h5):(1'h1)])));
  assign wire64 = (reg55 ?
                      $unsigned($unsigned(wire53)) : (^{$unsigned(((8'h9d) ?
                              wire52 : reg57))}));
  always
    @(posedge clk) begin
      if ((reg59[(1'h0):(1'h0)] == $unsigned($unsigned(wire49[(1'h1):(1'h0)]))))
        begin
          reg65 <= $unsigned(wire50[(2'h2):(2'h2)]);
        end
      else
        begin
          reg65 <= wire47[(1'h0):(1'h0)];
        end
      if (reg57[(2'h3):(1'h1)])
        begin
          reg66 <= (reg57[(2'h3):(1'h0)] >> $unsigned((wire64[(1'h0):(1'h0)] ?
              $unsigned({wire45, reg65}) : (^~$signed(reg55)))));
          reg67 <= $signed(wire56);
          reg68 <= (8'hbf);
          reg69 <= wire62[(3'h4):(2'h3)];
        end
      else
        begin
          reg66 <= wire51;
          reg67 <= (wire49 ?
              reg69[(5'h12):(4'h8)] : {$unsigned($unsigned(wire64))});
        end
      if ($unsigned({(~|$signed((wire61 ^~ wire56)))}))
        begin
          reg70 <= (wire61 ?
              $unsigned(((8'hbf) ^ reg69)) : (^~reg55[(4'he):(4'h9)]));
          reg71 <= ({$unsigned($unsigned($signed(reg54)))} ?
              (((+{reg70}) ?
                  ((wire51 ^ wire61) ? reg55 : reg69) : $unsigned((wire50 ?
                      reg57 : (8'ha4)))) & wire53[(1'h1):(1'h0)]) : ((wire50[(4'he):(3'h7)] * ((~wire60) ?
                  wire45[(4'he):(3'h5)] : $unsigned(wire47))) < $signed((-$signed(reg69)))));
        end
      else
        begin
          if ({wire64[(2'h3):(2'h3)]})
            begin
              reg70 <= (-{$signed(reg54),
                  {wire45,
                      ($unsigned(reg68) ? {reg66} : wire64[(2'h3):(2'h2)])}});
              reg71 <= $unsigned((~&reg59));
              reg72 <= reg66;
            end
          else
            begin
              reg70 <= $signed(wire47);
              reg71 <= wire63;
              reg72 <= $unsigned($signed(((reg70 - wire52[(2'h3):(1'h1)]) ?
                  {(wire60 < wire60)} : $unsigned((reg68 ? reg58 : wire56)))));
              reg73 <= $signed(wire47);
            end
          if ($signed((!(wire56[(3'h6):(1'h1)] ?
              (~reg70) : $unsigned((wire51 ? wire52 : reg65))))))
            begin
              reg74 <= (~&reg54[(2'h2):(1'h0)]);
              reg75 <= (^{$signed((^~reg67)),
                  ({(8'hb7)} ? (~^(|reg74)) : (+(reg65 ? reg70 : wire63)))});
              reg76 <= {{$signed(($unsigned(wire48) >= (wire45 - wire48))),
                      $signed($signed((reg66 ? reg58 : reg75)))},
                  (^~wire51)};
            end
          else
            begin
              reg74 <= $signed(({reg70, reg75[(3'h5):(1'h1)]} >> wire60));
            end
          if ($signed((-$signed(reg71))))
            begin
              reg77 <= wire49[(2'h3):(2'h3)];
              reg78 <= $unsigned($signed((8'hac)));
            end
          else
            begin
              reg77 <= ((wire49 ?
                  (~(~(reg74 ?
                      (8'hbd) : wire49))) : $signed(($signed(wire48) == wire45))) > (~&$unsigned(reg72[(4'ha):(4'h9)])));
            end
          if ((~&(~$unsigned((wire63 >>> $signed(reg68))))))
            begin
              reg79 <= (&$signed($signed({reg66[(2'h3):(1'h0)]})));
            end
          else
            begin
              reg79 <= reg55[(2'h2):(2'h2)];
              reg80 <= $unsigned($unsigned(wire64));
              reg81 <= (reg70 <= (reg76[(1'h1):(1'h0)] - wire63));
              reg82 <= (~((reg72 ?
                      (^~$unsigned(reg78)) : ((wire60 + reg65) < (~wire47))) ?
                  ((reg73[(1'h0):(1'h0)] ^~ reg79[(1'h0):(1'h0)]) ?
                      {reg73[(2'h2):(2'h2)],
                          $unsigned(reg81)} : $signed({wire62})) : $unsigned(wire56)));
              reg83 <= $unsigned($unsigned(wire46[(1'h0):(1'h0)]));
            end
          reg84 <= $unsigned({{({(8'hb4)} ?
                      (wire47 > reg65) : (reg73 < wire60)),
                  $signed(((8'hb0) ^ (8'h9f)))}});
        end
      reg85 <= reg74;
    end
  always
    @(posedge clk) begin
      reg86 <= ({reg59[(3'h7):(2'h2)]} && $signed(($unsigned((reg74 ?
              reg66 : reg78)) ?
          wire52[(2'h3):(2'h2)] : (~wire63))));
    end
  assign wire87 = ((reg57[(2'h3):(2'h2)] <= {{{wire51, wire51},
                          (wire46 <<< reg58)}}) > wire45[(4'ha):(3'h6)]);
  assign wire88 = ((8'h9c) || $unsigned({$unsigned((+wire63)),
                      reg72[(3'h6):(1'h0)]}));
  assign wire89 = (~|((reg58[(2'h2):(2'h2)] ?
                          $signed((reg79 ?
                              reg67 : reg55)) : {$unsigned((8'hbb)),
                              (-reg68)}) ?
                      reg57[(4'ha):(3'h4)] : ((~$signed((8'haf))) ?
                          ({(8'ha0), reg77} ?
                              ((8'h9e) && reg65) : reg83) : $signed((8'ha7)))));
  always
    @(posedge clk) begin
      reg90 <= reg66[(3'h6):(3'h4)];
      if (reg84[(3'h5):(2'h2)])
        begin
          reg91 <= wire46;
          reg92 <= $unsigned($unsigned($unsigned(((wire46 > wire51) ?
              wire46 : (~&reg59)))));
        end
      else
        begin
          reg91 <= wire53;
          reg92 <= reg74;
          if (reg80[(4'h8):(3'h6)])
            begin
              reg93 <= (!reg58[(1'h0):(1'h0)]);
              reg94 <= ((reg92[(2'h2):(1'h0)] ?
                      wire60 : (reg83[(3'h4):(1'h1)] | wire50[(5'h11):(3'h7)])) ?
                  reg91[(4'hf):(2'h3)] : $unsigned({((8'hb4) ?
                          (reg84 || reg54) : reg82)}));
              reg95 <= wire46[(1'h0):(1'h0)];
              reg96 <= (!$signed(reg82[(2'h2):(1'h1)]));
              reg97 <= (wire56[(5'h11):(5'h10)] ^ (wire47 ?
                  ($unsigned({reg79}) + (~(wire46 ~^ reg75))) : $unsigned(((reg95 <<< reg75) ^ $signed(wire60)))));
            end
          else
            begin
              reg93 <= $signed($signed((&((reg76 && reg81) ?
                  reg54 : $signed(reg70)))));
              reg94 <= wire56;
              reg95 <= (-$unsigned({reg71[(4'hd):(2'h2)], reg68}));
              reg96 <= {(^{{(wire61 + (8'ha3)), {reg57}}})};
            end
          if (reg83[(1'h0):(1'h0)])
            begin
              reg98 <= wire52;
              reg99 <= wire47;
            end
          else
            begin
              reg98 <= {$signed((wire61 ?
                      ((wire49 ? wire51 : wire52) ?
                          $unsigned(reg59) : {wire60}) : $signed(((7'h43) ?
                          reg76 : (8'h9f))))),
                  (~&$unsigned(reg91[(4'hd):(2'h2)]))};
              reg99 <= $unsigned(wire53);
              reg100 <= reg57[(4'h9):(3'h6)];
              reg101 <= $unsigned(($signed($unsigned($signed(wire45))) ?
                  reg55 : ($unsigned({(8'hb8), reg57}) ?
                      reg68[(3'h6):(1'h0)] : $signed($unsigned(reg79)))));
              reg102 <= {(8'ha9),
                  $signed(((8'hbf) ?
                      {(reg58 ? reg54 : (7'h41)),
                          $unsigned(reg71)} : (reg97 + $unsigned(wire51))))};
            end
        end
    end
  always
    @(posedge clk) begin
      if (wire63[(1'h1):(1'h0)])
        begin
          reg103 <= ({{{(reg99 ~^ reg68)},
                  ((+reg94) ?
                      (~&(8'hb5)) : (~^wire45))}} && ((reg100[(4'h8):(1'h1)] ?
              ({reg54, reg86} ?
                  reg93[(1'h0):(1'h0)] : reg68[(2'h2):(2'h2)]) : ($unsigned(reg83) ?
                  $signed(reg83) : (reg96 <<< reg95))) + reg65));
          if ($signed((&reg103[(3'h4):(2'h2)])))
            begin
              reg104 <= ((~^$unsigned({$signed(reg66), (8'hb5)})) ?
                  (wire88 <= $signed($unsigned($signed(reg84)))) : ($signed(((reg55 ?
                      (8'hb9) : (8'ha8)) ^ (~|reg91))) <<< (~&reg75)));
              reg105 <= reg75;
              reg106 <= reg54[(5'h10):(1'h1)];
              reg107 <= reg78;
            end
          else
            begin
              reg104 <= (($signed(reg75) + ((^~reg103) > ($unsigned(reg78) && {reg72,
                      (7'h43)}))) ?
                  ({$signed($signed(reg70)), wire51[(3'h7):(3'h6)]} ?
                      $signed(reg96[(3'h4):(1'h0)]) : (^(^~(8'ha7)))) : (+(&reg55[(5'h11):(4'he)])));
            end
          reg108 <= $signed((-reg83[(3'h6):(2'h3)]));
          reg109 <= reg79[(1'h1):(1'h0)];
          reg110 <= $signed(reg79[(2'h3):(1'h1)]);
        end
      else
        begin
          if ($signed((wire46[(1'h0):(1'h0)] < (|({reg94, reg83} ?
              (wire89 <<< reg106) : reg57[(1'h0):(1'h0)])))))
            begin
              reg103 <= ((8'h9c) ?
                  ((^(^~reg76[(3'h6):(2'h2)])) ?
                      ($signed((^reg96)) ?
                          ((reg106 ?
                              (8'hbb) : reg80) == (reg94 >> reg109)) : ((reg94 ?
                              wire48 : reg74) || reg97[(4'h8):(1'h0)])) : $signed(((reg73 != wire61) ?
                          {wire49} : {reg81}))) : $unsigned(({(wire61 ?
                          reg76 : wire63)} << reg108[(2'h3):(1'h0)])));
            end
          else
            begin
              reg103 <= (^~wire64);
              reg104 <= (reg106 ? wire87[(2'h2):(2'h2)] : reg101);
              reg105 <= ($signed(($signed(reg100) ?
                  ((reg81 ? wire89 : reg110) ?
                      reg59[(4'hc):(3'h5)] : (reg96 != reg66)) : ($unsigned(reg96) && {wire50}))) << (wire62[(3'h4):(1'h1)] ?
                  $signed($unsigned(reg100[(5'h10):(4'ha)])) : reg78));
              reg106 <= $unsigned(reg108);
              reg107 <= reg82[(2'h2):(1'h1)];
            end
        end
    end
  assign wire111 = (reg78 ?
                       ($unsigned((reg81 - $signed(reg58))) ?
                           ($signed($unsigned((8'hb0))) ?
                               $signed($signed((8'ha4))) : (((8'h9f) ?
                                   reg66 : reg79) & $unsigned(reg101))) : (($unsigned(reg110) ?
                               reg73[(1'h1):(1'h1)] : (7'h43)) ^ reg105[(4'h8):(3'h7)])) : (reg76[(4'he):(4'he)] ?
                           $unsigned(reg86) : reg105));
  assign wire112 = (wire56 ?
                       (&$signed($unsigned(reg68[(4'h9):(4'h8)]))) : $signed(reg108[(3'h7):(1'h1)]));
  assign wire113 = wire64[(3'h4):(1'h1)];
endmodule
