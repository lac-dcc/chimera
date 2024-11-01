module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h203):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire115;
  wire [(3'h4):(1'h0)] wire114;
  wire signed [(4'hb):(1'h0)] wire113;
  wire [(4'h9):(1'h0)] wire108;
  wire [(3'h7):(1'h0)] wire44;
  wire signed [(3'h5):(1'h0)] wire43;
  wire [(5'h15):(1'h0)] wire42;
  wire signed [(3'h4):(1'h0)] wire41;
  wire [(4'hd):(1'h0)] wire16;
  wire signed [(4'h8):(1'h0)] wire15;
  wire signed [(3'h7):(1'h0)] wire14;
  wire [(2'h3):(1'h0)] wire4;
  reg [(4'h8):(1'h0)] reg112 = (1'h0);
  reg [(4'hb):(1'h0)] reg111 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg37 = (1'h0);
  reg [(4'hf):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg34 = (1'h0);
  reg [(5'h11):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg29 = (1'h0);
  reg [(4'hb):(1'h0)] reg28 = (1'h0);
  reg [(5'h11):(1'h0)] reg27 = (1'h0);
  reg [(3'h7):(1'h0)] reg26 = (1'h0);
  reg [(5'h13):(1'h0)] reg25 = (1'h0);
  reg [(4'h9):(1'h0)] reg24 = (1'h0);
  reg [(5'h11):(1'h0)] reg23 = (1'h0);
  reg [(5'h14):(1'h0)] reg22 = (1'h0);
  reg [(3'h4):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg20 = (1'h0);
  reg [(2'h2):(1'h0)] reg19 = (1'h0);
  reg [(4'h9):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg13 = (1'h0);
  reg [(4'h9):(1'h0)] reg12 = (1'h0);
  reg [(4'he):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg9 = (1'h0);
  reg [(3'h7):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg5 = (1'h0);
  assign y = {wire115,
                 wire114,
                 wire113,
                 wire108,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire16,
                 wire15,
                 wire14,
                 wire4,
                 reg112,
                 reg111,
                 reg110,
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
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = {(^~(~|((^~wire2) ? wire1 : wire2[(5'h11):(4'hc)])))};
  always
    @(posedge clk) begin
      reg5 <= (~|(~&$unsigned((-(wire2 ? wire3 : wire3)))));
      if (((~^reg5[(4'h9):(4'h9)]) - $signed(wire4)))
        begin
          reg6 <= $signed((8'ha9));
          reg7 <= ($unsigned(wire4[(2'h2):(2'h2)]) ~^ $unsigned((wire2 && $signed(wire0))));
          reg8 <= reg6;
          if ({$unsigned(wire0),
              ({wire3, (^~$unsigned(wire2))} ?
                  ({(|wire1), (8'hb3)} ?
                      ((!reg8) ?
                          $signed(wire1) : (reg5 ?
                              reg6 : reg5)) : (wire2 == ((8'hb5) ?
                          wire0 : reg5))) : $unsigned(((wire0 || reg7) ?
                      wire3 : (reg6 ? wire1 : (8'haf)))))})
            begin
              reg9 <= ($signed((wire4[(1'h0):(1'h0)] <<< (|(~reg5)))) ?
                  ((~&$unsigned((wire1 ~^ wire0))) ?
                      ($unsigned((|wire4)) ?
                          ((&reg5) ?
                              {wire0} : {wire3}) : reg5[(4'h8):(3'h4)]) : $unsigned(wire1)) : reg5);
              reg10 <= wire0[(1'h1):(1'h1)];
            end
          else
            begin
              reg9 <= (-$signed((~|$signed($signed(wire3)))));
              reg10 <= (&$unsigned(((8'ha1) != wire3[(1'h1):(1'h1)])));
              reg11 <= ((&wire1[(5'h12):(1'h1)]) >= ($unsigned((wire1[(4'h8):(2'h3)] + {reg6,
                  wire0})) | reg9));
              reg12 <= (|(wire3[(1'h1):(1'h0)] == $signed($unsigned(wire0[(3'h5):(2'h3)]))));
            end
          reg13 <= (($signed((^~wire3[(2'h2):(1'h1)])) < ((~&$signed(wire3)) << (~&$signed(reg12)))) ?
              (reg11[(4'hb):(4'h8)] || (reg5[(3'h4):(3'h4)] ?
                  wire1[(4'ha):(1'h1)] : $unsigned(wire2[(3'h5):(1'h0)]))) : (~$unsigned((~^$unsigned((7'h41))))));
        end
      else
        begin
          if ((-(|(|(~(^(8'h9c)))))))
            begin
              reg6 <= wire2;
              reg7 <= $unsigned(((&($signed(reg8) ?
                      $signed(reg6) : ((8'hab) ? reg12 : reg13))) ?
                  reg12 : reg5));
            end
          else
            begin
              reg6 <= ((($signed({reg5}) ? reg9 : reg5) ?
                  reg8 : (!reg6[(2'h2):(2'h2)])) >>> (reg10[(1'h1):(1'h1)] ?
                  {wire2,
                      (~|(reg8 >= reg11))} : ((~&$signed(reg5)) >>> ($signed((8'h9e)) | reg11[(3'h6):(2'h3)]))));
              reg7 <= ((!reg10[(4'ha):(1'h1)]) ^ ($unsigned($unsigned((~&reg5))) ?
                  wire0 : (-(&wire4))));
            end
        end
    end
  assign wire14 = reg10[(1'h1):(1'h0)];
  assign wire15 = $unsigned((wire1 ?
                      (~|(wire2 - $signed(reg5))) : ($unsigned(((8'hbe) ?
                              reg13 : reg11)) ?
                          ($unsigned(wire2) ~^ (reg7 ?
                              (8'ha7) : wire1)) : (reg5 ?
                              $signed(reg9) : (8'hab)))));
  assign wire16 = wire4[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg17 <= {$signed($signed(reg6)),
          (^($unsigned($signed(reg6)) & ({(8'hbb)} <<< (+reg6))))};
      reg18 <= wire0[(2'h3):(2'h2)];
      reg19 <= $signed((($unsigned(reg9[(1'h0):(1'h0)]) << $unsigned((+reg18))) ^ reg6));
      reg20 <= (^~reg9);
      reg21 <= reg18;
    end
  always
    @(posedge clk) begin
      if (wire16[(4'h9):(3'h4)])
        begin
          reg22 <= (|($signed(reg10) ?
              $signed(reg19) : (^~($unsigned(reg8) ^ (8'hbb)))));
          if ({{$unsigned($signed(reg10[(1'h1):(1'h1)]))},
              ((+({reg13} ~^ $signed((8'hb2)))) ?
                  reg10 : {reg12[(3'h5):(1'h1)], $unsigned(reg5)})})
            begin
              reg23 <= {$unsigned((($unsigned((8'hbf)) ?
                          reg18[(2'h2):(1'h1)] : (-wire0)) ?
                      {(|reg11), reg8} : ((reg22 ? (8'had) : wire15) ?
                          {reg7} : (8'haf))))};
            end
          else
            begin
              reg23 <= reg20;
              reg24 <= (($signed($signed({reg22})) ^~ ((~|(reg11 > reg11)) | (7'h44))) ?
                  ($unsigned($signed($signed(wire3))) ?
                      (-$signed((-reg21))) : (8'hb6)) : (((!(8'h9c)) ?
                          (~^wire0[(2'h3):(2'h2)]) : ($unsigned(reg22) || (-wire16))) ?
                      ({reg13,
                          reg10[(5'h13):(1'h0)]} * $unsigned((!wire16))) : (8'ha0)));
              reg25 <= ((($unsigned((wire2 ? (7'h41) : wire0)) ?
                      $signed(wire1[(5'h11):(4'h8)]) : wire3) <= wire4) ?
                  wire4[(1'h1):(1'h1)] : $unsigned((wire14[(3'h4):(1'h1)] == reg12)));
              reg26 <= reg22[(3'h5):(1'h1)];
              reg27 <= wire3;
            end
          reg28 <= $unsigned((reg7 ?
              (wire14 ^~ $signed((^wire0))) : (reg6[(4'hb):(3'h5)] ?
                  ((^wire2) ? {wire0} : reg6) : ((-wire14) ?
                      $signed(wire15) : reg18[(2'h3):(2'h2)]))));
          reg29 <= reg19[(2'h2):(1'h0)];
          reg30 <= wire14;
        end
      else
        begin
          if ({$signed($unsigned($signed(wire3)))})
            begin
              reg22 <= (8'hbe);
              reg23 <= ($unsigned($unsigned({$unsigned(reg25),
                  (wire2 ^ reg23)})) <= reg23[(2'h3):(1'h0)]);
              reg24 <= (~|$signed(reg25));
              reg25 <= reg19[(1'h1):(1'h1)];
            end
          else
            begin
              reg22 <= $unsigned(reg5);
              reg23 <= ($signed(reg13[(1'h0):(1'h0)]) ?
                  (~{{{reg8}}}) : $signed(reg12));
              reg24 <= reg26;
            end
          reg26 <= ($unsigned(wire4) ?
              {$signed(wire1[(3'h4):(2'h2)]), (8'hac)} : $signed(wire15));
        end
      reg31 <= (wire0[(3'h4):(2'h2)] ? reg7[(5'h11):(3'h6)] : (+reg27));
      reg32 <= (|$unsigned(reg11[(2'h2):(1'h1)]));
      reg33 <= ({($signed($unsigned(wire14)) < ((reg8 ? wire1 : reg11) ?
                  $unsigned(reg7) : (reg11 ? wire3 : reg27)))} ?
          reg5 : (($signed((wire14 >> reg6)) << $signed(wire3[(1'h1):(1'h0)])) ?
              reg11 : ((~|(^wire15)) ? reg7 : reg10)));
      reg34 <= $unsigned(reg20[(2'h2):(1'h0)]);
    end
  always
    @(posedge clk) begin
      if ($unsigned($unsigned(wire15[(2'h3):(1'h0)])))
        begin
          reg35 <= $signed({(wire0 ?
                  ($signed(reg20) ^ $signed(wire2)) : (reg24[(2'h2):(2'h2)] ?
                      (reg34 ^~ reg34) : {(7'h42), reg8}))});
          reg36 <= reg24;
          if ((($signed(reg7) >= wire3[(1'h0):(1'h0)]) ^ $signed((reg23 >>> $signed(reg20[(2'h2):(1'h1)])))))
            begin
              reg37 <= {((~wire2[(5'h10):(4'hb)]) <= $signed((|(reg13 ?
                      wire3 : reg17)))),
                  (reg8[(1'h0):(1'h0)] ^ ((+(^~reg13)) - $signed((reg35 ?
                      wire0 : wire15))))};
            end
          else
            begin
              reg37 <= reg34;
              reg38 <= (~^(wire14[(2'h3):(1'h0)] ?
                  (reg33 ?
                      reg23[(4'hc):(1'h0)] : $signed(((8'hb9) ?
                          reg27 : reg22))) : $signed($signed(reg6[(4'h9):(4'h8)]))));
              reg39 <= (((8'haa) & $unsigned(reg25)) ?
                  {(($unsigned(reg31) ? reg8[(3'h7):(3'h6)] : (8'hb2)) ?
                          {$unsigned(reg33),
                              (~|(8'ha8))} : $signed($signed(reg11)))} : {$unsigned(reg11[(4'h9):(2'h2)]),
                      $unsigned((-reg8[(3'h6):(1'h1)]))});
              reg40 <= ((((8'hb6) ^~ (&{reg7})) ?
                      $signed(($signed(reg17) >> (reg10 <= reg34))) : (((reg38 >= (8'hbb)) ?
                          reg10[(5'h11):(3'h7)] : reg17[(4'ha):(4'ha)]) ^ reg20[(1'h0):(1'h0)])) ?
                  wire1 : $unsigned(((reg11[(4'hd):(4'h8)] ?
                          (reg31 ? (8'hbf) : reg25) : (+reg25)) ?
                      $unsigned($unsigned(reg13)) : (reg8 ?
                          reg22 : $unsigned(reg7)))));
            end
        end
      else
        begin
          reg35 <= $signed(reg12);
        end
    end
  assign wire41 = reg5;
  assign wire42 = reg24[(1'h0):(1'h0)];
  assign wire43 = ({reg25} > reg12[(2'h3):(2'h2)]);
  assign wire44 = $signed($signed(reg22[(4'he):(4'h8)]));
  module45 #() modinst109 (wire108, clk, reg35, reg40, reg33, reg36);
  always
    @(posedge clk) begin
      reg110 <= reg6;
      reg111 <= wire1;
      reg112 <= reg29;
    end
  assign wire113 = $signed({(wire4 + $unsigned((reg5 + reg22))),
                       {(~&$signed(reg5)),
                           $signed((reg26 ? (8'hb7) : reg29))}});
  assign wire114 = reg20[(2'h2):(2'h2)];
  assign wire115 = ((-reg37[(4'h8):(1'h0)]) <<< $signed({($signed(wire14) ?
                           reg12[(4'h9):(3'h4)] : (^reg33)),
                       {((8'ha2) ? reg19 : reg10), $signed(reg13)}}));
endmodule

module module45  (y, clk, wire46, wire47, wire48, wire49);
  output wire [(32'he7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire46;
  input wire [(5'h10):(1'h0)] wire47;
  input wire signed [(4'hd):(1'h0)] wire48;
  input wire [(4'ha):(1'h0)] wire49;
  wire signed [(4'hc):(1'h0)] wire107;
  wire signed [(5'h11):(1'h0)] wire51;
  wire [(5'h11):(1'h0)] wire52;
  wire [(4'h9):(1'h0)] wire53;
  wire signed [(4'hf):(1'h0)] wire82;
  wire signed [(4'h9):(1'h0)] wire84;
  wire [(4'hd):(1'h0)] wire85;
  wire [(4'h9):(1'h0)] wire86;
  wire [(5'h11):(1'h0)] wire87;
  wire [(3'h6):(1'h0)] wire88;
  wire [(5'h10):(1'h0)] wire89;
  wire [(4'hb):(1'h0)] wire90;
  wire [(4'h8):(1'h0)] wire91;
  wire signed [(5'h10):(1'h0)] wire92;
  wire signed [(5'h12):(1'h0)] wire93;
  wire [(4'hb):(1'h0)] wire94;
  wire [(5'h14):(1'h0)] wire105;
  reg signed [(3'h6):(1'h0)] reg50 = (1'h0);
  assign y = {wire107,
                 wire51,
                 wire52,
                 wire53,
                 wire82,
                 wire84,
                 wire85,
                 wire86,
                 wire87,
                 wire88,
                 wire89,
                 wire90,
                 wire91,
                 wire92,
                 wire93,
                 wire94,
                 wire105,
                 reg50,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg50 <= {wire49[(3'h4):(1'h0)], wire46[(3'h5):(3'h4)]};
    end
  assign wire51 = reg50;
  assign wire52 = $signed((wire46[(3'h4):(1'h0)] * wire47[(2'h2):(1'h1)]));
  assign wire53 = $signed($unsigned(wire46));
  module54 #() modinst83 (wire82, clk, wire47, wire53, wire52, wire51, reg50);
  assign wire84 = (wire51 * ((reg50 | wire48) & (wire47[(4'he):(3'h5)] - $unsigned(wire48[(2'h3):(1'h0)]))));
  assign wire85 = (wire82[(4'hd):(4'hc)] ?
                      reg50[(2'h3):(2'h2)] : (wire53[(2'h3):(2'h2)] ?
                          (^~wire82[(3'h7):(3'h4)]) : wire49[(2'h3):(1'h0)]));
  assign wire86 = {$signed(($signed((wire52 & wire52)) ^ (wire48[(1'h1):(1'h1)] <= (~wire51))))};
  assign wire87 = $unsigned($signed(wire53));
  assign wire88 = $unsigned(((($signed(wire86) ? wire85 : wire47) ?
                          ((~^(7'h41)) ?
                              wire86 : ((8'hbc) << reg50)) : $signed($signed(wire48))) ?
                      (^~(8'ha8)) : wire82[(4'h9):(2'h3)]));
  assign wire89 = (~^((^((&wire48) <= $signed(wire51))) && ((~|wire47[(4'hd):(4'h8)]) ?
                      (~&wire84[(4'h9):(3'h6)]) : ((wire82 ?
                              (8'hb3) : (8'hb0)) ?
                          wire82 : {(8'hb7)}))));
  assign wire90 = $unsigned($signed(wire48));
  assign wire91 = $signed(wire85);
  assign wire92 = wire88;
  assign wire93 = $unsigned(wire85);
  assign wire94 = ((reg50 > ($signed(wire53[(3'h5):(3'h4)]) != (((8'ha2) ?
                          wire91 : wire47) | $unsigned(wire91)))) ?
                      ($signed((&(wire89 ?
                          (8'h9d) : wire91))) >> {(8'ha4)}) : ((~|(^~(wire48 >= wire49))) <<< wire86[(3'h5):(1'h1)]));
  module95 #() modinst106 (wire105, clk, wire82, wire87, wire48, wire89, wire94);
  assign wire107 = (wire89[(4'h8):(2'h3)] ?
                       reg50 : $unsigned($signed(wire48[(4'hc):(3'h5)])));
endmodule

module module95  (y, clk, wire100, wire99, wire98, wire97, wire96);
  output wire [(32'h45):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire100;
  input wire signed [(4'ha):(1'h0)] wire99;
  input wire signed [(4'h9):(1'h0)] wire98;
  input wire [(4'h9):(1'h0)] wire97;
  input wire [(4'hb):(1'h0)] wire96;
  wire signed [(5'h10):(1'h0)] wire104;
  wire signed [(4'he):(1'h0)] wire103;
  wire signed [(5'h15):(1'h0)] wire102;
  wire signed [(5'h11):(1'h0)] wire101;
  assign y = {wire104, wire103, wire102, wire101, (1'h0)};
  assign wire101 = $unsigned(($signed($signed($unsigned(wire96))) ^ (((!wire99) ?
                       (wire96 ? (8'ha2) : wire97) : (wire100 ?
                           wire98 : wire100)) + wire96)));
  assign wire102 = {$signed($unsigned(wire97))};
  assign wire103 = wire102;
  assign wire104 = {$signed($signed(((wire100 >>> wire100) ?
                           {wire97, wire98} : {wire99, wire97})))};
endmodule

module module54
#(parameter param81 = ({{((^~(8'hb2)) ? {(8'ha7)} : ((8'hb8) ? (8'hb5) : (8'haf)))}, {(((7'h43) ? (8'h9f) : (8'h9d)) ? ((8'hab) > (8'ha4)) : (-(8'hb3)))}} * (((((8'hac) + (8'ha2)) ? {(8'hb6), (8'ha3)} : {(8'h9d)}) * {(8'hab), ((8'hb7) ^~ (8'hba))}) ? ((~|((8'hab) - (8'haf))) ? (((8'hbe) ? (8'hba) : (8'ha3)) + (+(7'h42))) : {((7'h44) * (8'haa))}) : (^~(((7'h41) <= (8'h9f)) >>> ((8'hb6) - (8'ha3)))))))
(y, clk, wire59, wire58, wire57, wire56, wire55);
  output wire [(32'hdd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire59;
  input wire signed [(4'h9):(1'h0)] wire58;
  input wire signed [(5'h11):(1'h0)] wire57;
  input wire [(4'he):(1'h0)] wire56;
  input wire signed [(3'h4):(1'h0)] wire55;
  wire [(2'h2):(1'h0)] wire80;
  wire [(4'h8):(1'h0)] wire79;
  wire signed [(2'h2):(1'h0)] wire72;
  wire signed [(4'hc):(1'h0)] wire69;
  wire signed [(4'he):(1'h0)] wire68;
  wire [(3'h4):(1'h0)] wire67;
  wire [(4'ha):(1'h0)] wire66;
  wire signed [(5'h13):(1'h0)] wire64;
  wire [(5'h10):(1'h0)] wire63;
  wire signed [(4'he):(1'h0)] wire60;
  reg signed [(2'h2):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg75 = (1'h0);
  reg [(2'h3):(1'h0)] reg74 = (1'h0);
  reg [(5'h14):(1'h0)] reg73 = (1'h0);
  reg [(3'h7):(1'h0)] reg71 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg61 = (1'h0);
  assign y = {wire80,
                 wire79,
                 wire72,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire64,
                 wire63,
                 wire60,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg71,
                 reg70,
                 reg65,
                 reg62,
                 reg61,
                 (1'h0)};
  assign wire60 = wire56;
  always
    @(posedge clk) begin
      reg61 <= (((~|(~^wire59[(5'h10):(4'he)])) ?
              (!{$signed(wire55), $signed(wire59)}) : wire56[(4'he):(4'hc)]) ?
          $unsigned((~^$signed(wire59[(4'hf):(4'he)]))) : $signed($signed($signed(wire56))));
      reg62 <= wire59[(4'hb):(4'ha)];
    end
  assign wire63 = $unsigned(wire59[(2'h3):(1'h0)]);
  assign wire64 = wire60;
  always
    @(posedge clk) begin
      reg65 <= wire60;
    end
  assign wire66 = $signed(reg62[(2'h2):(1'h1)]);
  assign wire67 = reg65[(4'he):(4'h8)];
  assign wire68 = ((+wire58) ?
                      $signed($unsigned($unsigned(wire56[(4'hb):(3'h5)]))) : wire59[(3'h4):(2'h2)]);
  assign wire69 = ($signed(wire68) ?
                      reg62[(2'h2):(2'h2)] : wire66[(4'h9):(2'h3)]);
  always
    @(posedge clk) begin
      reg70 <= {({((-wire55) ? (~|wire59) : wire69),
                  ((7'h40) ? (wire58 <= reg61) : (wire64 ^~ (8'ha8)))} ?
              $unsigned($unsigned({wire60,
                  wire63})) : $signed($unsigned($signed(reg62)))),
          (&$signed(wire63[(4'h9):(2'h3)]))};
      reg71 <= wire69;
    end
  assign wire72 = wire67[(3'h4):(3'h4)];
  always
    @(posedge clk) begin
      if ((reg61 ? (^~(8'ha7)) : {{wire56[(4'he):(3'h6)]}, $signed({wire55})}))
        begin
          if ($unsigned($unsigned({($unsigned(reg71) <= wire64[(2'h2):(1'h1)])})))
            begin
              reg73 <= wire56;
              reg74 <= (((~^((&reg70) + wire68[(4'h8):(3'h5)])) || (8'ha1)) ?
                  wire63[(2'h2):(1'h1)] : (8'hb9));
            end
          else
            begin
              reg73 <= wire57[(4'hd):(4'h8)];
              reg74 <= (wire63[(1'h0):(1'h0)] ?
                  ($signed($unsigned($signed(wire58))) > $signed(((wire68 + reg74) ?
                      (&wire55) : ((8'ha2) == wire72)))) : (wire69[(1'h0):(1'h0)] - $signed($signed($unsigned((7'h40))))));
              reg75 <= ({wire58} ?
                  ((($unsigned((8'hba)) ?
                          wire63[(2'h3):(1'h0)] : wire59[(1'h1):(1'h1)]) >> reg61[(2'h2):(1'h0)]) ?
                      (+reg73[(3'h6):(2'h3)]) : $signed((^wire55[(2'h2):(1'h0)]))) : wire64);
            end
          reg76 <= $unsigned(reg70[(3'h5):(2'h3)]);
          reg77 <= ((($signed(wire68[(1'h0):(1'h0)]) * wire68) ?
                  reg75[(5'h11):(4'hb)] : reg75[(3'h4):(2'h2)]) ?
              reg71 : {({wire57, wire59[(4'hb):(3'h6)]} ?
                      reg74[(1'h1):(1'h1)] : {wire60[(4'hb):(1'h0)]}),
                  reg65});
          reg78 <= (((8'ha9) ?
                  $unsigned((!$unsigned(wire68))) : (($unsigned(wire67) ?
                          wire58 : wire58) ?
                      wire59 : reg75)) ?
              {(({reg73} ? reg62 : $unsigned(reg73)) >> (|(wire57 ?
                      reg65 : reg76)))} : (wire66 ^ $signed((^{(8'hb1),
                  wire63}))));
        end
      else
        begin
          reg73 <= $unsigned(((wire58[(3'h6):(3'h4)] ?
              ($signed(wire69) < ((8'ha3) ?
                  wire67 : reg73)) : (!(wire72 | wire58))) > $signed((wire55 ?
              $unsigned(wire69) : $unsigned(wire69)))));
          reg74 <= (reg70 * reg78);
        end
    end
  assign wire79 = $signed($unsigned(wire58));
  assign wire80 = $signed(wire56);
endmodule
