module top
#(parameter param94 = ((~((|(^~(8'ha1))) ? (((8'ha1) ? (8'ha2) : (8'hab)) ? (-(8'hb4)) : ((8'hb6) <<< (8'ha3))) : {(~&(8'hb3)), ((8'hb0) ? (7'h41) : (8'h9d))})) <= ({({(8'haa), (7'h41)} ? ((8'hbe) < (8'ha0)) : (^~(8'hb0)))} && ((8'hb8) ? (&((8'had) | (8'h9c))) : {((8'hb3) > (8'haf))}))), 
parameter param95 = (~param94))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1b7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire0;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire4;
  wire [(2'h3):(1'h0)] wire86;
  wire signed [(5'h15):(1'h0)] wire85;
  wire signed [(2'h2):(1'h0)] wire84;
  wire signed [(4'hb):(1'h0)] wire81;
  wire [(4'hc):(1'h0)] wire72;
  wire [(4'hf):(1'h0)] wire9;
  wire signed [(4'hb):(1'h0)] wire10;
  wire [(4'hc):(1'h0)] wire11;
  wire signed [(4'h8):(1'h0)] wire12;
  wire signed [(2'h2):(1'h0)] wire13;
  wire signed [(5'h13):(1'h0)] wire14;
  wire signed [(4'ha):(1'h0)] wire15;
  wire signed [(4'he):(1'h0)] wire16;
  wire [(3'h6):(1'h0)] wire17;
  wire signed [(5'h15):(1'h0)] wire18;
  wire signed [(5'h14):(1'h0)] wire19;
  wire signed [(5'h10):(1'h0)] wire20;
  wire signed [(3'h4):(1'h0)] wire70;
  reg [(5'h11):(1'h0)] reg93 = (1'h0);
  reg signed [(4'he):(1'h0)] reg92 = (1'h0);
  reg [(3'h4):(1'h0)] reg91 = (1'h0);
  reg [(4'h9):(1'h0)] reg90 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg88 = (1'h0);
  reg [(4'h8):(1'h0)] reg87 = (1'h0);
  reg [(3'h4):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg82 = (1'h0);
  reg [(5'h12):(1'h0)] reg80 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg79 = (1'h0);
  reg [(4'hc):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg77 = (1'h0);
  reg [(4'h8):(1'h0)] reg76 = (1'h0);
  reg [(4'hb):(1'h0)] reg75 = (1'h0);
  reg [(4'he):(1'h0)] reg74 = (1'h0);
  reg [(5'h12):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg8 = (1'h0);
  reg [(4'hd):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg6 = (1'h0);
  reg [(4'hb):(1'h0)] reg5 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire84,
                 wire81,
                 wire72,
                 wire9,
                 wire10,
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
                 wire70,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg83,
                 reg82,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= wire1;
      reg6 <= ($signed((wire4 ?
              wire2[(2'h3):(2'h3)] : $signed($unsigned(reg5)))) ?
          (wire1[(3'h5):(3'h5)] ?
              (wire1[(2'h3):(1'h1)] ?
                  (wire0 + ((8'hae) ? wire0 : wire1)) : ((wire2 ?
                          wire0 : wire2) ?
                      wire0 : $signed(wire1))) : wire1[(1'h1):(1'h0)]) : (^~$unsigned(wire0)));
      reg7 <= $signed($unsigned($unsigned($unsigned(reg5[(1'h0):(1'h0)]))));
      reg8 <= (~&wire4);
    end
  assign wire9 = {($unsigned(wire3) >>> wire0[(3'h6):(1'h1)]),
                     {((~{reg7}) & (((8'hbb) & wire3) >= wire4[(2'h2):(1'h1)]))}};
  assign wire10 = $unsigned((wire0[(1'h0):(1'h0)] << ($unsigned(reg6[(5'h13):(4'hf)]) < (+$signed(wire4)))));
  assign wire11 = $signed((8'hb2));
  assign wire12 = $unsigned({$unsigned({$unsigned(reg5), {wire3, (8'hbf)}})});
  assign wire13 = (~|reg8[(2'h2):(2'h2)]);
  assign wire14 = wire0;
  assign wire15 = wire12;
  assign wire16 = (8'ha7);
  assign wire17 = $signed((|$signed(($signed(wire9) ?
                      $signed(wire4) : (~^wire10)))));
  assign wire18 = (!($signed((wire17[(1'h1):(1'h1)] ?
                          (-wire10) : (wire2 >= wire17))) ?
                      {reg7} : {((~|(8'hb1)) + (~(8'hae)))}));
  assign wire19 = $unsigned(wire10);
  assign wire20 = $signed(wire18);
  module21 #() modinst71 (wire70, clk, wire1, wire14, wire18, wire17, wire16);
  assign wire72 = (wire1 ?
                      wire18 : ((~&$unsigned(wire10[(4'h8):(3'h6)])) ~^ ($signed({wire12}) ?
                          (|(reg7 ? wire17 : wire10)) : ($unsigned(wire14) ?
                              $signed(wire12) : wire14))));
  always
    @(posedge clk) begin
      if ((^~(^wire18[(4'he):(2'h3)])))
        begin
          if ((($signed((((8'ha1) ^ reg7) ^~ {reg5})) ?
              (-(wire9[(3'h4):(3'h4)] ?
                  wire12[(4'h8):(3'h6)] : $unsigned((8'h9c)))) : $signed((wire13[(1'h1):(1'h1)] ?
                  $unsigned(wire70) : wire0[(3'h5):(3'h5)]))) ^ wire15))
            begin
              reg73 <= (~&($signed((&$unsigned(wire70))) >> (($signed(reg6) * reg7) <<< reg5[(3'h4):(2'h2)])));
              reg74 <= wire2;
              reg75 <= $signed(((+wire20) * $unsigned(($unsigned(wire18) << ((8'hb2) >= wire10)))));
            end
          else
            begin
              reg73 <= $unsigned($unsigned((-$unsigned($unsigned(wire9)))));
              reg74 <= wire20[(2'h2):(1'h0)];
              reg75 <= reg7[(4'ha):(4'h8)];
              reg76 <= wire2[(2'h2):(1'h0)];
            end
        end
      else
        begin
          reg73 <= {(~|(8'hab)), $signed($signed(wire9[(1'h0):(1'h0)]))};
          reg74 <= {{$signed(wire70)},
              $signed((wire3 & $unsigned({wire3, (8'hbe)})))};
          reg75 <= {(wire4 ?
                  ($signed((~wire9)) ?
                      reg7 : {(wire20 ? wire10 : wire19),
                          (wire70 <= wire17)}) : (wire10 || $unsigned($signed((8'hb6))))),
              (^~$unsigned($signed((reg76 || reg8))))};
          reg76 <= $signed((wire0 ?
              $unsigned($signed(wire12[(2'h2):(2'h2)])) : (&$unsigned(reg74))));
          reg77 <= wire0;
        end
      reg78 <= $signed($signed($signed({(reg7 ? wire3 : wire11)})));
      reg79 <= (~|(+(wire13[(2'h2):(2'h2)] ^~ ({wire2,
          wire12} << $signed(wire10)))));
      reg80 <= ($unsigned(reg6[(5'h12):(1'h1)]) ?
          reg78 : $signed($unsigned($signed((&wire14)))));
    end
  assign wire81 = $unsigned((wire20 ?
                      reg80 : (reg6[(4'h9):(4'h8)] * $unsigned($unsigned((8'ha2))))));
  always
    @(posedge clk) begin
      reg82 <= (&{wire20[(4'h9):(3'h4)],
          ($unsigned((wire72 ? reg73 : wire12)) ?
              $signed(reg79[(1'h1):(1'h0)]) : ((reg75 ?
                  wire12 : (8'hb5)) <= (reg73 * reg79)))});
      reg83 <= wire81[(4'ha):(1'h0)];
    end
  assign wire84 = (^~$signed({(8'h9d), (^(reg74 ~^ reg5))}));
  assign wire85 = reg7[(1'h1):(1'h0)];
  assign wire86 = (^~(-(~^reg83)));
  always
    @(posedge clk) begin
      reg87 <= (!(~|wire16));
      reg88 <= $signed(wire9[(3'h5):(1'h1)]);
      if (reg88[(4'hd):(2'h2)])
        begin
          reg89 <= $signed(wire1);
        end
      else
        begin
          reg89 <= $signed($signed((($signed((8'hb2)) ? wire10 : (&reg5)) ?
              wire9 : $signed((|(8'hb6))))));
          reg90 <= ((-{(8'hb8)}) ?
              (8'hb5) : ($signed((|(reg5 ? wire81 : wire0))) ?
                  (~$unsigned(wire16[(3'h5):(2'h2)])) : wire10));
          reg91 <= (^$signed({(^~(wire17 ? wire3 : wire9)),
              ($signed(wire13) ? (|wire10) : (-reg74))}));
          reg92 <= $unsigned($unsigned(reg90[(2'h3):(1'h1)]));
        end
      reg93 <= $signed($signed({wire9}));
    end
endmodule

module module21  (y, clk, wire22, wire23, wire24, wire25, wire26);
  output wire [(32'h46):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire22;
  input wire [(5'h13):(1'h0)] wire23;
  input wire signed [(5'h15):(1'h0)] wire24;
  input wire [(2'h2):(1'h0)] wire25;
  input wire signed [(4'hc):(1'h0)] wire26;
  wire signed [(5'h12):(1'h0)] wire69;
  wire [(4'hf):(1'h0)] wire27;
  wire signed [(5'h11):(1'h0)] wire28;
  wire signed [(5'h13):(1'h0)] wire67;
  assign y = {wire69, wire27, wire28, wire67, (1'h0)};
  assign wire27 = (wire26 <<< $signed({wire24[(2'h3):(1'h0)],
                      $signed((7'h44))}));
  assign wire28 = $signed((!(wire24[(3'h6):(2'h3)] << $unsigned(wire27))));
  module29 #() modinst68 (.clk(clk), .y(wire67), .wire34(wire27), .wire32(wire22), .wire30(wire24), .wire33(wire23), .wire31(wire28));
  assign wire69 = {$unsigned((((wire67 ? wire27 : wire26) >> {wire23, wire25}) ?
                          ({wire67,
                              wire26} || (wire67 != wire22)) : (|(wire67 < wire22)))),
                      wire28};
endmodule

module module29
#(parameter param65 = ((7'h41) >> {(8'haa)}), 
parameter param66 = (8'ha7))
(y, clk, wire34, wire33, wire32, wire31, wire30);
  output wire [(32'h173):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire34;
  input wire [(4'hc):(1'h0)] wire33;
  input wire signed [(3'h5):(1'h0)] wire32;
  input wire [(3'h7):(1'h0)] wire31;
  input wire [(5'h15):(1'h0)] wire30;
  wire signed [(5'h13):(1'h0)] wire64;
  wire signed [(2'h3):(1'h0)] wire63;
  wire [(5'h14):(1'h0)] wire62;
  wire signed [(5'h12):(1'h0)] wire61;
  wire signed [(3'h4):(1'h0)] wire60;
  wire [(4'he):(1'h0)] wire59;
  wire signed [(4'hc):(1'h0)] wire58;
  wire signed [(5'h11):(1'h0)] wire57;
  wire signed [(4'h9):(1'h0)] wire56;
  wire [(5'h11):(1'h0)] wire55;
  wire signed [(2'h2):(1'h0)] wire54;
  wire [(2'h2):(1'h0)] wire49;
  wire signed [(4'hb):(1'h0)] wire48;
  wire signed [(4'hb):(1'h0)] wire47;
  wire [(4'hb):(1'h0)] wire46;
  reg [(3'h5):(1'h0)] reg53 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg51 = (1'h0);
  reg [(3'h6):(1'h0)] reg50 = (1'h0);
  reg [(4'h8):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg44 = (1'h0);
  reg [(5'h15):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg41 = (1'h0);
  reg [(5'h11):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg39 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg35 = (1'h0);
  assign y = {wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg45,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if (((wire34 ?
          $signed((wire30 ?
              wire30[(3'h6):(3'h6)] : $signed(wire32))) : ((7'h41) ?
              wire30 : (wire32 >>> $signed(wire31)))) ~^ $unsigned((((wire34 ?
              wire33 : wire34) ~^ (~&wire34)) ?
          ({wire34, wire32} ? (^(8'h9e)) : (~^wire32)) : (8'ha0)))))
        begin
          if (wire33[(1'h0):(1'h0)])
            begin
              reg35 <= $unsigned(($unsigned((((8'ha6) & wire33) ^~ $signed(wire31))) ^~ (&(wire32 <= {wire34,
                  wire34}))));
              reg36 <= reg35;
            end
          else
            begin
              reg35 <= $unsigned((wire34 != ((8'had) ?
                  {reg36} : wire32[(2'h2):(2'h2)])));
              reg36 <= wire30;
              reg37 <= ($unsigned($unsigned(($unsigned(wire30) ?
                      ((8'hac) != reg36) : {wire30}))) ?
                  (wire31 & wire31) : $signed(({$unsigned(wire32),
                          (wire33 ~^ reg35)} ?
                      wire30[(4'hb):(3'h5)] : wire32[(2'h3):(1'h0)])));
            end
          reg38 <= wire33[(1'h1):(1'h0)];
          reg39 <= {(reg35 != reg38), reg38[(2'h2):(2'h2)]};
        end
      else
        begin
          if (wire32[(2'h3):(2'h2)])
            begin
              reg35 <= $signed($signed(reg39));
              reg36 <= (8'hbf);
            end
          else
            begin
              reg35 <= reg35[(4'he):(1'h1)];
              reg36 <= $unsigned({$unsigned((reg38 ?
                      $signed(wire31) : $unsigned(reg36)))});
              reg37 <= ((!$signed(($signed((8'hb4)) ?
                      reg38[(3'h6):(2'h3)] : reg35))) ?
                  (!$signed(((8'hba) & {wire32, wire31}))) : $unsigned(wire32));
            end
          reg38 <= (($signed(($unsigned(wire32) ?
                      (reg38 >>> wire31) : {(8'hb2), wire31})) ?
                  wire34 : reg38) ?
              reg39[(4'h8):(1'h1)] : $unsigned((-(&(wire33 << wire33)))));
          reg39 <= wire30;
        end
      reg40 <= (wire34[(4'hd):(4'hc)] ?
          (((!(wire31 ? reg35 : reg36)) - ((reg36 ? reg37 : (8'ha3)) ?
                  wire30 : (8'ha4))) ?
              (~^({reg36, wire33} ?
                  {wire30} : {wire32, (8'hb0)})) : (wire33[(3'h7):(3'h6)] ?
                  (wire32[(1'h0):(1'h0)] ?
                      (wire32 || (8'hb5)) : {reg37,
                          wire31}) : $signed($signed(reg38)))) : reg37);
      if ((wire32[(2'h3):(1'h0)] >> (&({$signed(reg38)} ?
          ((^~reg38) ^ {wire33}) : ((wire34 ~^ reg36) ~^ wire30)))))
        begin
          if ((8'ha1))
            begin
              reg41 <= wire32[(2'h2):(1'h1)];
              reg42 <= $signed(((wire34[(4'hf):(4'ha)] ?
                  reg41 : $unsigned((reg36 | wire30))) - (reg39 ?
                  (-$unsigned(reg41)) : {$unsigned(reg38)})));
              reg43 <= (((&wire33[(2'h2):(1'h0)]) ?
                  {(~&{(8'had)})} : {(~^$unsigned(reg41))}) * $unsigned(((|(reg37 ?
                  wire32 : wire33)) > reg36[(1'h1):(1'h0)])));
            end
          else
            begin
              reg41 <= reg36;
              reg42 <= (~&$signed(wire31[(3'h6):(2'h2)]));
              reg43 <= ({((8'ha3) ?
                          ((^wire32) ? $signed(reg40) : (|wire33)) : reg37)} ?
                  {$unsigned(wire34),
                      $signed(($signed(wire32) ?
                          $unsigned(wire32) : (&wire33)))} : reg36);
              reg44 <= (wire33[(2'h3):(1'h1)] != (({wire30[(2'h3):(2'h2)]} - $unsigned({wire32})) ?
                  $unsigned($signed((^reg35))) : $unsigned({$unsigned(reg42),
                      ((8'ha7) >= (7'h41))})));
              reg45 <= ((($unsigned((~&reg36)) >>> ($signed(reg44) ?
                  (reg36 ?
                      reg43 : wire33) : wire30)) >= $signed(reg42[(4'h8):(4'h8)])) && reg40);
            end
        end
      else
        begin
          reg41 <= $signed(wire32);
          reg42 <= (((~{(reg41 & (8'ha7))}) ?
              ((wire31 & {(8'ha2), reg40}) ?
                  {((8'hb1) ^~ (8'hbe)),
                      (reg35 ?
                          wire30 : reg36)} : reg39[(3'h5):(3'h5)]) : (~&(((8'ha7) ?
                      wire30 : (8'ha8)) ?
                  reg40[(4'hd):(3'h7)] : $unsigned(reg35)))) | (~&reg35));
        end
    end
  assign wire46 = ($unsigned(reg38[(3'h4):(2'h3)]) >> $unsigned(reg35));
  assign wire47 = $unsigned(reg45[(2'h3):(1'h0)]);
  assign wire48 = $signed(($unsigned(wire34[(3'h5):(1'h0)]) >> (|wire33)));
  assign wire49 = {{{(!reg42)}, $signed((reg39[(1'h0):(1'h0)] == (|wire31)))}};
  always
    @(posedge clk) begin
      if ($signed({(wire48 ? wire48[(4'h8):(3'h5)] : $unsigned($signed(reg40))),
          (|$signed({(8'ha8)}))}))
        begin
          reg50 <= reg39[(5'h12):(3'h4)];
          reg51 <= reg39;
          reg52 <= $unsigned(reg40);
          reg53 <= reg40;
        end
      else
        begin
          reg50 <= (((((reg38 ? reg36 : reg52) < wire30) ?
              (~&(wire49 + wire48)) : wire34) & $signed(($unsigned(reg39) ^~ (wire31 >= wire49)))) <= $signed(wire31));
          reg51 <= ($signed($unsigned($unsigned(wire47))) | (reg42 && reg40[(5'h10):(3'h5)]));
          reg52 <= ((reg35 ?
              reg52[(3'h5):(1'h0)] : $unsigned({(|(8'hac)),
                  wire33[(4'ha):(2'h2)]})) ^~ ($signed((~reg36[(4'h9):(4'h8)])) ?
              (reg50[(3'h5):(2'h2)] <<< $unsigned(reg41)) : ((reg35[(2'h3):(1'h0)] + (-reg51)) ?
                  (!$signed(wire49)) : $signed((reg35 ? reg45 : (8'had))))));
        end
    end
  assign wire54 = reg35[(4'hf):(3'h7)];
  assign wire55 = $unsigned(reg42);
  assign wire56 = reg41[(2'h2):(1'h0)];
  assign wire57 = $unsigned((~&wire48));
  assign wire58 = $unsigned((!(-wire56)));
  assign wire59 = ((($unsigned(wire30) ?
                          ($signed(wire58) ?
                              ((8'hbd) ?
                                  (8'hbb) : wire34) : $unsigned(reg52)) : wire46[(2'h3):(1'h0)]) ?
                      $signed($unsigned((~|reg35))) : (+reg38[(4'h8):(4'h8)])) || {reg36});
  assign wire60 = reg50;
  assign wire61 = wire46;
  assign wire62 = wire57;
  assign wire63 = ({$signed(($signed(reg37) ?
                              $signed(wire60) : (wire58 ? (8'hae) : wire30))),
                          (+$unsigned($unsigned(wire62)))} ?
                      $signed($unsigned({$unsigned(wire31)})) : (+$unsigned(reg38[(2'h2):(1'h0)])));
  assign wire64 = {wire54};
endmodule
