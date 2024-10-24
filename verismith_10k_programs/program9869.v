module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h72):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire [(4'hb):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  wire [(5'h14):(1'h0)] wire124;
  wire signed [(5'h10):(1'h0)] wire4;
  wire [(4'hd):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire8;
  wire signed [(4'hd):(1'h0)] wire122;
  assign y = {wire124, wire4, wire5, wire6, wire7, wire8, wire122, (1'h0)};
  assign wire4 = $unsigned((~{($unsigned(wire0) ?
                         (7'h40) : $unsigned(wire2))}));
  assign wire5 = wire4;
  assign wire6 = wire4[(3'h5):(1'h1)];
  assign wire7 = wire6;
  assign wire8 = wire6[(2'h2):(1'h0)];
  module9 #() modinst123 (.clk(clk), .wire11(wire2), .wire14(wire0), .wire13(wire3), .y(wire122), .wire12(wire7), .wire10(wire6));
  assign wire124 = ($signed({((|wire3) || $unsigned(wire6)),
                           $signed(wire2[(1'h1):(1'h0)])}) ?
                       ((^($signed(wire8) ~^ $signed(wire0))) ?
                           wire2 : wire4[(3'h4):(3'h4)]) : (~^(|((wire5 ?
                               wire0 : (8'ha4)) ?
                           (wire3 ? wire4 : wire3) : {(8'hb5)}))));
endmodule

module module9
#(parameter param120 = {((((~(8'hbb)) ? {(7'h41), (8'ha4)} : (|(8'hb3))) ? {(~(8'ha8))} : (!((8'hb0) >= (8'hb1)))) ? ((~|((8'haa) ? (8'ha5) : (8'haf))) ? (((8'ha6) ? (8'hab) : (8'had)) ? ((8'hb9) | (7'h41)) : {(8'ha2), (7'h43)}) : (+{(7'h40)})) : {(+((8'ha5) ? (8'haa) : (8'h9f))), {(8'hbc), ((7'h44) ? (7'h44) : (8'had))}})}, 
parameter param121 = ({(~^param120), (({param120} > param120) >= (~&{param120, (8'hb3)}))} > (param120 * ((~param120) ^~ (~(+param120))))))
(y, clk, wire10, wire11, wire12, wire13, wire14);
  output wire [(32'h123):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire10;
  input wire [(4'hf):(1'h0)] wire11;
  input wire [(5'h10):(1'h0)] wire12;
  input wire signed [(5'h12):(1'h0)] wire13;
  input wire [(5'h15):(1'h0)] wire14;
  wire signed [(2'h2):(1'h0)] wire119;
  wire [(4'he):(1'h0)] wire118;
  wire signed [(4'hc):(1'h0)] wire115;
  wire [(5'h10):(1'h0)] wire111;
  wire [(5'h14):(1'h0)] wire110;
  wire [(4'hc):(1'h0)] wire109;
  wire [(3'h5):(1'h0)] wire107;
  wire [(3'h6):(1'h0)] wire75;
  wire [(4'hc):(1'h0)] wire35;
  reg signed [(5'h12):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg116 = (1'h0);
  reg [(3'h7):(1'h0)] reg114 = (1'h0);
  reg [(5'h10):(1'h0)] reg113 = (1'h0);
  reg [(4'h9):(1'h0)] reg112 = (1'h0);
  reg [(3'h7):(1'h0)] reg86 = (1'h0);
  reg [(4'h8):(1'h0)] reg85 = (1'h0);
  reg [(5'h15):(1'h0)] reg84 = (1'h0);
  reg [(4'hc):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg81 = (1'h0);
  reg [(4'hd):(1'h0)] reg80 = (1'h0);
  reg [(4'he):(1'h0)] reg79 = (1'h0);
  reg [(5'h10):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg77 = (1'h0);
  assign y = {wire119,
                 wire118,
                 wire115,
                 wire111,
                 wire110,
                 wire109,
                 wire107,
                 wire75,
                 wire35,
                 reg117,
                 reg116,
                 reg114,
                 reg113,
                 reg112,
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
                 (1'h0)};
  module15 #() modinst36 (wire35, clk, wire14, wire13, wire11, wire12, wire10);
  module37 #() modinst76 (wire75, clk, wire35, wire12, wire11, wire14);
  always
    @(posedge clk) begin
      if (($signed($signed(wire12[(4'h9):(3'h4)])) ?
          ((wire10[(5'h10):(4'hf)] < wire12) & wire75) : (($unsigned($signed(wire10)) < wire12) ?
              (-wire12[(4'ha):(3'h4)]) : (&{$signed(wire35)}))))
        begin
          reg77 <= wire35[(4'ha):(2'h2)];
          reg78 <= wire10[(4'hc):(3'h4)];
          if ((wire13[(3'h5):(3'h4)] ?
              $signed(({(^wire75)} & wire14)) : wire35[(4'h8):(3'h5)]))
            begin
              reg79 <= (~(wire35 & $unsigned((&reg78))));
              reg80 <= $signed(($unsigned(wire12) ?
                  wire12 : $unsigned({$unsigned(reg77)})));
              reg81 <= (reg80[(4'hb):(3'h5)] ?
                  (((|(wire13 << (8'ha1))) - ($unsigned(reg77) ?
                      ((8'haa) != reg77) : wire35[(4'hc):(4'h8)])) | ((~(~wire12)) <<< {(^reg78)})) : $signed(reg77[(4'h8):(1'h0)]));
              reg82 <= {wire35};
            end
          else
            begin
              reg79 <= (+((($signed(reg81) <= $unsigned(reg79)) + $unsigned((~(8'ha3)))) ?
                  wire10[(2'h3):(1'h0)] : (7'h42)));
              reg80 <= $unsigned(wire75);
              reg81 <= (^(8'ha4));
            end
          reg83 <= ((reg82 == ($unsigned({reg77}) || $signed($unsigned(wire75)))) ?
              $signed((&((wire11 >> wire14) ?
                  $signed(wire13) : $signed(wire14)))) : $signed((($signed(wire13) ?
                      (wire14 ^ (8'ha3)) : $unsigned(reg80)) ?
                  (^(reg78 ^~ (8'ha3))) : wire11[(4'h9):(2'h2)])));
        end
      else
        begin
          if ((~|reg77))
            begin
              reg77 <= reg78[(3'h5):(3'h4)];
              reg78 <= {(~(~$unsigned($signed(reg80)))), reg78};
              reg79 <= $signed($signed((reg81[(1'h1):(1'h0)] <<< {wire35})));
              reg80 <= reg81[(2'h2):(2'h2)];
            end
          else
            begin
              reg77 <= reg78[(1'h1):(1'h1)];
            end
          reg81 <= wire13;
        end
      reg84 <= reg82;
      reg85 <= $unsigned((~|wire12[(3'h4):(1'h0)]));
      reg86 <= (~|(~^reg77));
    end
  module87 #() modinst108 (wire107, clk, reg78, reg79, reg84, reg83);
  assign wire109 = $signed(wire10);
  assign wire110 = wire14;
  assign wire111 = $signed(reg79[(3'h5):(2'h2)]);
  always
    @(posedge clk) begin
      reg112 <= reg80[(4'hb):(2'h3)];
      reg113 <= $signed(($unsigned(wire11) >= (wire10 ?
          (&$unsigned(reg83)) : ((wire109 ? reg78 : wire10) ~^ (|wire10)))));
      reg114 <= (7'h42);
    end
  assign wire115 = (^~$signed($signed(((reg83 - reg85) << reg77))));
  always
    @(posedge clk) begin
      reg116 <= (~^($unsigned(wire10[(3'h5):(1'h0)]) > (+$unsigned((reg82 <<< reg85)))));
      reg117 <= wire11[(4'h8):(3'h7)];
    end
  assign wire118 = $unsigned($unsigned((+wire13)));
  assign wire119 = reg85;
endmodule

module module87  (y, clk, wire91, wire90, wire89, wire88);
  output wire [(32'hb0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire91;
  input wire signed [(2'h2):(1'h0)] wire90;
  input wire [(5'h15):(1'h0)] wire89;
  input wire [(3'h5):(1'h0)] wire88;
  wire [(3'h4):(1'h0)] wire106;
  wire signed [(3'h7):(1'h0)] wire105;
  wire [(4'hf):(1'h0)] wire104;
  wire signed [(2'h3):(1'h0)] wire102;
  wire [(5'h12):(1'h0)] wire101;
  wire [(4'ha):(1'h0)] wire100;
  wire signed [(5'h11):(1'h0)] wire99;
  wire [(3'h5):(1'h0)] wire98;
  wire [(5'h11):(1'h0)] wire93;
  wire [(5'h13):(1'h0)] wire92;
  reg [(4'he):(1'h0)] reg103 = (1'h0);
  reg [(4'he):(1'h0)] reg97 = (1'h0);
  reg [(3'h6):(1'h0)] reg96 = (1'h0);
  reg [(4'hf):(1'h0)] reg95 = (1'h0);
  reg [(4'hb):(1'h0)] reg94 = (1'h0);
  assign y = {wire106,
                 wire105,
                 wire104,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire93,
                 wire92,
                 reg103,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 (1'h0)};
  assign wire92 = $signed(($signed(wire88) ?
                      $signed(wire90[(1'h0):(1'h0)]) : wire88[(3'h5):(3'h5)]));
  assign wire93 = wire89[(5'h15):(4'hb)];
  always
    @(posedge clk) begin
      reg94 <= ((^$unsigned({wire91[(4'hb):(1'h0)]})) ~^ (-wire90));
      reg95 <= wire90[(1'h1):(1'h0)];
      reg96 <= {$unsigned($unsigned(wire92[(3'h5):(3'h5)])),
          (wire91[(4'hd):(4'ha)] | ((^(reg95 >>> wire92)) ^~ $unsigned($signed(wire89))))};
      reg97 <= ($unsigned((&$signed(reg95))) * reg94[(2'h3):(1'h1)]);
    end
  assign wire98 = wire89;
  assign wire99 = {$signed((&(8'ha9)))};
  assign wire100 = ($signed({{$signed(wire91)}}) <= wire90);
  assign wire101 = ({$signed((-wire91[(3'h6):(3'h4)]))} ?
                       ($unsigned(((wire93 ?
                           wire93 : wire93) <<< (+wire93))) >= ((wire89[(1'h1):(1'h1)] ?
                           (8'ha9) : (reg96 ?
                               wire98 : wire88)) << wire98)) : ((~^($signed(reg97) >> {reg96})) ?
                           wire89[(4'h9):(2'h3)] : reg97));
  assign wire102 = ($signed(reg96) + wire89);
  always
    @(posedge clk) begin
      reg103 <= wire99;
    end
  assign wire104 = ((8'hbf) >= (+$unsigned((!{wire101}))));
  assign wire105 = $signed((8'haf));
  assign wire106 = {{((wire98 ?
                               wire101[(5'h11):(4'h8)] : wire92[(3'h7):(3'h5)]) < $signed(wire104[(3'h7):(2'h3)])),
                           wire100}};
endmodule

module module37
#(parameter param74 = ((^~(^~(~|(~^(8'hbe))))) < (~&(+(((8'ha7) - (7'h40)) ? {(8'hbb)} : (8'hb3))))))
(y, clk, wire41, wire40, wire39, wire38);
  output wire [(32'h17a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire41;
  input wire signed [(2'h2):(1'h0)] wire40;
  input wire signed [(3'h5):(1'h0)] wire39;
  input wire [(4'h8):(1'h0)] wire38;
  wire signed [(5'h13):(1'h0)] wire73;
  wire signed [(4'hb):(1'h0)] wire72;
  wire signed [(5'h15):(1'h0)] wire57;
  wire [(4'ha):(1'h0)] wire56;
  wire [(4'ha):(1'h0)] wire55;
  wire [(4'ha):(1'h0)] wire54;
  wire [(4'h8):(1'h0)] wire53;
  wire signed [(4'ha):(1'h0)] wire52;
  wire [(3'h5):(1'h0)] wire51;
  wire signed [(2'h3):(1'h0)] wire48;
  wire [(4'hf):(1'h0)] wire47;
  wire signed [(3'h4):(1'h0)] wire46;
  wire signed [(4'hd):(1'h0)] wire45;
  wire [(4'hd):(1'h0)] wire44;
  wire [(5'h11):(1'h0)] wire43;
  wire [(3'h5):(1'h0)] wire42;
  reg [(3'h7):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg70 = (1'h0);
  reg [(3'h7):(1'h0)] reg69 = (1'h0);
  reg [(5'h14):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg67 = (1'h0);
  reg [(5'h13):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg64 = (1'h0);
  reg [(5'h12):(1'h0)] reg63 = (1'h0);
  reg [(2'h2):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg61 = (1'h0);
  reg [(5'h13):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg58 = (1'h0);
  reg [(2'h2):(1'h0)] reg50 = (1'h0);
  reg [(4'he):(1'h0)] reg49 = (1'h0);
  assign y = {wire73,
                 wire72,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 reg71,
                 reg70,
                 reg69,
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
                 reg50,
                 reg49,
                 (1'h0)};
  assign wire42 = $unsigned($signed(wire40[(2'h2):(2'h2)]));
  assign wire43 = wire40;
  assign wire44 = wire38;
  assign wire45 = (~^wire39);
  assign wire46 = wire40[(2'h2):(1'h0)];
  assign wire47 = $unsigned($unsigned({wire45}));
  assign wire48 = (wire40 ^ (((!(wire39 ? wire44 : wire38)) ?
                      ($unsigned((8'hac)) | (~(8'ha0))) : $signed({(8'hae)})) >> $unsigned($unsigned($unsigned(wire45)))));
  always
    @(posedge clk) begin
      reg49 <= ($signed((&$unsigned($unsigned(wire47)))) <<< (~$unsigned(($unsigned(wire39) << wire43[(3'h7):(3'h7)]))));
      reg50 <= wire46[(1'h0):(1'h0)];
    end
  assign wire51 = wire40[(1'h0):(1'h0)];
  assign wire52 = (~|$signed((wire45[(4'hc):(4'hc)] && $unsigned(wire47[(4'h9):(3'h6)]))));
  assign wire53 = $unsigned((^wire47[(4'h8):(1'h1)]));
  assign wire54 = (-(reg50[(1'h0):(1'h0)] < {$signed({wire40})}));
  assign wire55 = wire39[(3'h5):(3'h4)];
  assign wire56 = (~(~|{((&(8'hba)) ? wire43 : $unsigned(wire53)),
                      $unsigned(wire51[(1'h1):(1'h1)])}));
  assign wire57 = ($signed($signed($signed(wire44))) ?
                      {(~wire38[(1'h1):(1'h1)])} : ((~((~|wire51) ?
                              ((8'hb7) >>> wire55) : {(8'hb4)})) ?
                          wire43 : ($signed($signed(wire43)) << ({(8'ha1)} < (wire46 ?
                              wire51 : wire42)))));
  always
    @(posedge clk) begin
      reg58 <= ($unsigned(wire55) ?
          $signed(wire47[(4'h8):(2'h2)]) : (!wire56[(4'h8):(1'h1)]));
      if (wire57)
        begin
          if ((^($signed(wire56[(2'h2):(1'h0)]) & (wire45[(3'h6):(1'h0)] >>> (^$unsigned(wire45))))))
            begin
              reg59 <= ({wire48} >= (&(wire56[(2'h2):(1'h0)] ?
                  (8'hb8) : (wire40 | (~^wire40)))));
              reg60 <= wire56[(2'h3):(2'h3)];
              reg61 <= {($unsigned(({wire57} & $signed(wire55))) == {((wire40 >>> reg58) == reg58)}),
                  ($unsigned(reg49) ? $signed(wire44) : reg58[(2'h3):(2'h2)])};
            end
          else
            begin
              reg59 <= (~&($signed(wire41) >> $unsigned($unsigned($signed((8'haf))))));
              reg60 <= $unsigned((~($unsigned((&(8'ha7))) ? (8'ha8) : reg58)));
            end
          reg62 <= wire56;
          reg63 <= (((8'hba) ?
              $unsigned(wire47[(4'h8):(2'h2)]) : $signed(($unsigned(wire44) | reg62))) - wire47[(4'h9):(3'h4)]);
          reg64 <= $unsigned((($signed(wire45[(3'h5):(1'h1)]) ?
              (~^(wire47 != wire45)) : reg61[(3'h5):(3'h4)]) >> $unsigned((wire48 || $unsigned(wire44)))));
        end
      else
        begin
          reg59 <= $signed((wire43[(4'hc):(4'h8)] ? wire40 : wire46));
          reg60 <= reg63;
        end
      reg65 <= $signed((!(((~^wire41) ? (7'h40) : (wire39 - wire42)) ?
          (8'hae) : $unsigned((reg61 < wire56)))));
    end
  always
    @(posedge clk) begin
      if ({(8'hb3)})
        begin
          reg66 <= $unsigned({wire51});
          if ($unsigned($signed($unsigned($unsigned(wire43[(4'h9):(2'h2)])))))
            begin
              reg67 <= (+(-((+$unsigned(wire40)) ?
                  wire46[(1'h0):(1'h0)] : $signed({(8'hbc), wire52}))));
              reg68 <= wire55[(3'h4):(2'h2)];
              reg69 <= (({$unsigned($signed(reg59)),
                  (&(8'h9f))} << (($unsigned(reg61) != $signed(wire47)) != ((wire40 ?
                  (7'h41) : wire42) ^ reg60))) << reg59[(1'h1):(1'h0)]);
            end
          else
            begin
              reg67 <= $signed((~^(~((reg62 <= wire51) ? wire57 : (8'ha1)))));
              reg68 <= (reg49[(1'h1):(1'h0)] ?
                  reg62[(2'h2):(1'h1)] : ((&reg59) < $signed(((wire55 ?
                          wire41 : (8'hae)) ?
                      (wire46 ? reg66 : wire45) : reg50[(1'h0):(1'h0)]))));
              reg69 <= ({$unsigned((~&(wire45 ?
                      wire42 : (8'hbe))))} + $signed(reg58));
              reg70 <= $unsigned((-($unsigned(wire42[(1'h0):(1'h0)]) ?
                  $unsigned((reg61 ? wire57 : wire43)) : $signed((+wire47)))));
            end
          reg71 <= $unsigned({(^~(+(wire46 || reg64)))});
        end
      else
        begin
          reg66 <= wire52;
          if (wire57[(5'h13):(5'h13)])
            begin
              reg67 <= ($unsigned($signed(wire45)) ?
                  (~^{$unsigned(reg62[(1'h1):(1'h0)])}) : $signed((({reg70} ~^ {(7'h42)}) == {$signed(reg50),
                      (wire42 ? wire51 : reg59)})));
            end
          else
            begin
              reg67 <= ({((8'ha2) ?
                          $signed($unsigned(reg70)) : (|(wire52 ?
                              wire39 : wire42))),
                      (8'ha5)} ?
                  {(((~^wire41) ?
                          wire53 : $unsigned(reg50)) > wire43[(4'h8):(3'h4)]),
                      wire44} : {(~|reg50)});
              reg68 <= {wire55,
                  ((&(-(^reg65))) + {(^(reg68 ? wire56 : reg71)),
                      $signed(reg49)})};
              reg69 <= wire56[(1'h1):(1'h0)];
            end
          reg70 <= wire56[(2'h2):(1'h1)];
          reg71 <= wire41[(3'h4):(1'h1)];
        end
    end
  assign wire72 = reg67;
  assign wire73 = $unsigned({$unsigned(($signed(wire39) ~^ (reg67 ?
                          reg58 : reg62)))});
endmodule

module module15
#(parameter param33 = ((((((8'h9f) & (8'ha2)) ? {(8'hab)} : {(8'ha4), (8'ha8)}) ? ({(8'hb2), (8'hba)} ? ((8'ha4) ? (8'hb6) : (8'hb6)) : {(8'h9d), (8'ha7)}) : {((8'hba) <= (8'hab))}) ? (|(((8'haf) ? (7'h43) : (8'hb6)) != (~&(8'hbb)))) : ({((8'hbd) ^~ (8'hb7)), ((8'hb4) >= (8'had))} ? (~^(+(8'hb9))) : {((8'hb3) >>> (8'hb4))})) ^~ (({((8'ha0) < (8'ha1))} > (~&((8'hae) ? (7'h40) : (7'h40)))) ? {({(7'h42), (8'hbb)} ? ((7'h40) < (8'ha9)) : (+(7'h40)))} : (^~(((8'hb2) ? (7'h41) : (7'h41)) == ((8'h9e) ? (8'ha9) : (8'hac)))))), 
parameter param34 = (&((param33 ? param33 : param33) > ((~|param33) ? ((|param33) > {param33}) : (^~(~^(8'ha5)))))))
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h90):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire20;
  input wire [(5'h12):(1'h0)] wire19;
  input wire [(4'hf):(1'h0)] wire18;
  input wire signed [(3'h6):(1'h0)] wire17;
  input wire signed [(4'hb):(1'h0)] wire16;
  wire [(4'h9):(1'h0)] wire24;
  wire [(5'h13):(1'h0)] wire23;
  wire [(4'hd):(1'h0)] wire22;
  wire [(3'h6):(1'h0)] wire21;
  reg signed [(4'hb):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg30 = (1'h0);
  reg [(2'h2):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg28 = (1'h0);
  reg [(4'hf):(1'h0)] reg27 = (1'h0);
  reg [(3'h7):(1'h0)] reg26 = (1'h0);
  reg [(5'h14):(1'h0)] reg25 = (1'h0);
  assign y = {wire24,
                 wire23,
                 wire22,
                 wire21,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 (1'h0)};
  assign wire21 = $unsigned((!$unsigned(wire19)));
  assign wire22 = ((!((wire20[(1'h1):(1'h1)] <<< wire17[(2'h2):(1'h0)]) + (wire20[(2'h2):(1'h1)] ?
                      (+wire17) : (wire18 == wire20)))) >= ((!(wire20[(1'h0):(1'h0)] ~^ $signed(wire20))) >= ({(wire21 ?
                              wire19 : wire20),
                          $unsigned((8'hb3))} ?
                      $signed(wire17) : {$unsigned((8'hae)),
                          $signed(wire16)})));
  assign wire23 = wire21[(2'h3):(2'h3)];
  assign wire24 = wire20;
  always
    @(posedge clk) begin
      if ($signed($signed((~^wire20))))
        begin
          reg25 <= wire17[(2'h2):(1'h1)];
        end
      else
        begin
          reg25 <= wire16;
          if ((wire20[(1'h1):(1'h1)] || ((((reg25 ?
                  wire17 : wire21) | reg25[(3'h4):(2'h3)]) ?
              wire18[(4'hb):(1'h0)] : $signed($signed(wire17))) * wire16[(3'h6):(3'h5)])))
            begin
              reg26 <= $unsigned(wire20[(2'h3):(2'h3)]);
              reg27 <= $signed(wire18[(4'hc):(1'h0)]);
              reg28 <= (8'hba);
            end
          else
            begin
              reg26 <= (^{$signed(wire19[(5'h10):(1'h0)])});
            end
        end
      reg29 <= {wire19[(5'h10):(5'h10)]};
      reg30 <= wire16[(4'h8):(1'h1)];
      reg31 <= $unsigned({(wire23 & $unsigned((wire21 ? reg29 : wire19))),
          reg27});
      reg32 <= wire19[(4'hb):(1'h0)];
    end
endmodule
