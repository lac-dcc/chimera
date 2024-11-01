module top
#(parameter param105 = (^((~&{((8'hb8) - (8'hba))}) ^~ ((((7'h40) ? (8'hbf) : (8'h9d)) ? ((8'ha9) ? (8'hb3) : (7'h44)) : {(8'ha8), (8'hb3)}) - (!((7'h42) + (8'ha4)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1fb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire0;
  input wire [(4'h8):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  wire signed [(4'hd):(1'h0)] wire104;
  wire signed [(3'h6):(1'h0)] wire103;
  wire signed [(5'h10):(1'h0)] wire102;
  wire [(3'h7):(1'h0)] wire101;
  wire signed [(5'h10):(1'h0)] wire4;
  wire [(4'h9):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire55;
  wire [(5'h13):(1'h0)] wire64;
  wire [(3'h7):(1'h0)] wire65;
  wire [(3'h5):(1'h0)] wire68;
  wire [(5'h13):(1'h0)] wire69;
  wire signed [(4'hf):(1'h0)] wire70;
  wire [(3'h6):(1'h0)] wire71;
  wire [(4'h8):(1'h0)] wire72;
  wire signed [(4'hb):(1'h0)] wire73;
  wire signed [(4'hb):(1'h0)] wire74;
  wire [(4'hf):(1'h0)] wire88;
  wire signed [(5'h10):(1'h0)] wire99;
  reg [(5'h12):(1'h0)] reg57 = (1'h0);
  reg [(3'h5):(1'h0)] reg58 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg59 = (1'h0);
  reg [(4'h9):(1'h0)] reg60 = (1'h0);
  reg [(5'h12):(1'h0)] reg61 = (1'h0);
  reg [(4'hc):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg63 = (1'h0);
  reg [(4'h9):(1'h0)] reg66 = (1'h0);
  reg [(4'hc):(1'h0)] reg67 = (1'h0);
  reg [(5'h10):(1'h0)] reg75 = (1'h0);
  reg [(4'h8):(1'h0)] reg76 = (1'h0);
  reg [(5'h14):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg79 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg81 = (1'h0);
  reg [(5'h14):(1'h0)] reg82 = (1'h0);
  reg [(3'h4):(1'h0)] reg83 = (1'h0);
  reg [(5'h14):(1'h0)] reg84 = (1'h0);
  reg [(5'h14):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg86 = (1'h0);
  reg [(4'hf):(1'h0)] reg87 = (1'h0);
  assign y = {wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire4,
                 wire5,
                 wire55,
                 wire64,
                 wire65,
                 wire68,
                 wire69,
                 wire70,
                 wire71,
                 wire72,
                 wire73,
                 wire74,
                 wire88,
                 wire99,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 reg66,
                 reg67,
                 reg75,
                 reg76,
                 reg77,
                 reg78,
                 reg79,
                 reg80,
                 reg81,
                 reg82,
                 reg83,
                 reg84,
                 reg85,
                 reg86,
                 reg87,
                 (1'h0)};
  assign wire4 = (wire3 | ($unsigned((8'hb4)) ?
                     $signed($signed($signed((8'hb2)))) : {wire1}));
  assign wire5 = ($signed((($unsigned(wire2) ?
                             wire2 : (wire0 ? wire1 : wire4)) ?
                         wire3 : ($signed(wire0) != $unsigned(wire1)))) ?
                     (!wire2) : $signed({((wire3 < wire3) > (wire4 ^ wire2)),
                         wire3[(1'h0):(1'h0)]}));
  module6 #() modinst56 (.y(wire55), .clk(clk), .wire8(wire3), .wire9(wire4), .wire10(wire2), .wire7(wire1));
  always
    @(posedge clk) begin
      if (wire1)
        begin
          if ((~&$unsigned(($unsigned((~|wire55)) ?
              wire4[(4'he):(4'h8)] : {(wire2 ? wire1 : wire0),
                  $unsigned(wire4)}))))
            begin
              reg57 <= wire4[(1'h0):(1'h0)];
            end
          else
            begin
              reg57 <= {(!(7'h41))};
              reg58 <= wire55[(1'h1):(1'h0)];
            end
        end
      else
        begin
          reg57 <= (^~((~|({reg57} <<< (wire0 >> (7'h40)))) <= ($signed((wire2 < wire3)) * reg58[(1'h1):(1'h1)])));
        end
      if ((~{(-($unsigned(reg57) < $signed((8'hab)))), wire5[(3'h4):(3'h4)]}))
        begin
          reg59 <= (^wire1);
          reg60 <= (($signed($signed((8'hbf))) ~^ {{((8'ha7) ? wire3 : wire1),
                      (~^wire0)},
                  reg59}) ?
              ($unsigned(wire4[(4'hd):(3'h4)]) ?
                  (($signed(wire2) | $signed(wire0)) ?
                      $signed($signed(reg59)) : {$unsigned(wire5)}) : $signed($signed((reg59 >= (8'had))))) : reg58);
          reg61 <= ($signed($signed((!{wire4,
              (8'hb6)}))) + ((((8'hb1) * $unsigned(wire2)) ?
                  wire55[(4'h8):(3'h7)] : ({wire1, reg58} ?
                      $signed(wire3) : {reg59, wire5})) ?
              (8'h9c) : (wire2 || wire5)));
          reg62 <= $signed((|(~(wire55 * wire4[(2'h2):(2'h2)]))));
        end
      else
        begin
          reg59 <= (reg59[(4'h9):(3'h4)] + reg61[(5'h11):(2'h2)]);
          reg60 <= wire0;
        end
      reg63 <= $signed($signed((reg61 ?
          (~$unsigned((8'ha0))) : $signed((~^(8'hb9))))));
    end
  assign wire64 = $signed((reg57 ?
                      (wire3 ?
                          (8'hac) : {{(7'h43)}}) : (wire3[(5'h10):(5'h10)] ~^ ((reg60 >> (7'h42)) ?
                          wire3 : (reg61 >>> reg60)))));
  assign wire65 = (((8'hbd) & (7'h44)) ?
                      (((8'hb6) ? reg60 : (|wire64)) ?
                          $unsigned(reg60) : reg59) : reg61);
  always
    @(posedge clk) begin
      reg66 <= $unsigned(wire2);
      reg67 <= (reg58 ?
          ($unsigned($signed(reg62)) == ($signed((reg62 ~^ (8'hab))) ?
              wire55 : (~^wire64[(3'h7):(1'h1)]))) : ((~&{(^~wire4)}) ?
              {$signed((|wire3)), (~wire64)} : {(wire55 ?
                      $signed(reg60) : $signed((8'haa)))}));
    end
  assign wire68 = wire2[(1'h0):(1'h0)];
  assign wire69 = $unsigned(((({(8'hbe)} ?
                          reg66[(3'h5):(1'h1)] : (reg59 & reg57)) && ($unsigned(reg62) ?
                          $signed(wire4) : $signed(wire55))) ?
                      $signed(reg60) : ((wire55[(2'h2):(1'h1)] ?
                              (7'h43) : $signed(reg59)) ?
                          (~(wire5 ~^ wire2)) : $signed((wire0 ?
                              reg57 : (8'hab))))));
  assign wire70 = wire65[(1'h1):(1'h0)];
  assign wire71 = $unsigned((((8'ha6) ?
                      $signed((reg63 < wire3)) : {(wire65 ? wire1 : reg63),
                          $signed(wire4)}) >> ($unsigned($unsigned(wire1)) ?
                      reg58 : (~&$signed(wire3)))));
  assign wire72 = ($signed(({$unsigned(wire1)} ?
                      {$unsigned((7'h41)),
                          (wire65 ?
                              wire65 : wire68)} : reg66[(3'h5):(2'h2)])) | ($signed((^reg59[(3'h5):(2'h2)])) & (-((^reg60) ?
                      {reg62, wire2} : wire55))));
  assign wire73 = $unsigned(reg57[(2'h2):(2'h2)]);
  assign wire74 = (((+(8'ha6)) <= ({((8'hbd) >>> reg67), (8'hb6)} ?
                      ($unsigned(wire65) & reg61[(3'h4):(1'h0)]) : ({wire5} ^ (wire65 ?
                          reg66 : wire55)))) < $signed({(reg62[(4'h8):(2'h2)] ?
                          $unsigned(reg60) : {wire72})}));
  always
    @(posedge clk) begin
      reg75 <= (&(reg63[(1'h1):(1'h1)] ?
          ($signed(wire0) & $unsigned((|reg59))) : ($unsigned($signed((8'hbd))) ?
              {reg66} : wire3)));
      reg76 <= ({(&wire73),
              (^~({wire0, wire74} ? {wire72} : $unsigned(wire68)))} ?
          ($unsigned(((reg58 ? wire73 : wire4) & ((8'ha8) ?
              wire0 : reg66))) ^~ (~$unsigned($unsigned((8'h9d))))) : reg75);
      reg77 <= reg61;
      reg78 <= ($signed($signed(((|reg67) ?
              wire68[(2'h3):(1'h0)] : (reg60 <<< reg58)))) ?
          reg66[(1'h1):(1'h0)] : (&(reg75 > $signed((wire2 ~^ wire74)))));
    end
  always
    @(posedge clk) begin
      if ((($signed((~reg57[(3'h6):(3'h5)])) << ((^~$unsigned(reg66)) ?
          (+(-wire55)) : reg66)) - (+(~^wire72))))
        begin
          reg79 <= ($unsigned({wire1, reg58}) ?
              reg66[(2'h3):(1'h0)] : {$signed(wire72[(3'h7):(2'h3)]),
                  $signed($unsigned(reg58[(3'h5):(2'h2)]))});
          if ({(~^(7'h40)),
              $unsigned(((&wire4[(4'hc):(4'h8)]) ?
                  (+(reg67 ? (8'haa) : wire69)) : wire73[(4'hb):(4'h9)]))})
            begin
              reg80 <= ((-$signed((-(^~(8'hab))))) ?
                  (^~$signed((~^wire71))) : ((+wire72) ?
                      wire74[(1'h1):(1'h0)] : $signed(((^reg67) ?
                          {wire3} : $unsigned((8'hb6))))));
              reg81 <= wire55;
              reg82 <= $signed((reg57[(5'h10):(3'h7)] >> $unsigned(wire1)));
              reg83 <= {$unsigned($signed((^~{(8'hb4)})))};
              reg84 <= reg75;
            end
          else
            begin
              reg80 <= (reg82[(4'ha):(1'h1)] >= $signed($unsigned(reg80)));
              reg81 <= $signed(reg62);
              reg82 <= {$signed(wire0)};
              reg83 <= $unsigned((-$signed(wire70[(2'h3):(1'h0)])));
            end
          reg85 <= (({wire5[(3'h5):(3'h5)]} ^ $unsigned((reg83 <= $unsigned(wire55)))) == reg81);
        end
      else
        begin
          reg79 <= reg76;
          reg80 <= wire64[(4'hf):(1'h0)];
          reg81 <= ($signed(wire73[(3'h5):(1'h1)]) == $unsigned($unsigned((|$unsigned(reg61)))));
        end
      reg86 <= (~(^~(7'h44)));
      reg87 <= (|(((~^(wire64 ?
          (8'h9f) : wire2)) <= ($signed(reg85) ^~ reg83)) >> (&((reg78 ?
              reg58 : reg57) ?
          (wire68 >>> wire1) : $signed(reg60)))));
    end
  assign wire88 = {(wire64 ? reg60[(3'h6):(3'h5)] : (8'hb4)),
                      (wire3[(2'h3):(2'h3)] == wire68[(3'h4):(2'h2)])};
  module89 #() modinst100 (wire99, clk, reg86, reg78, reg57, wire72);
  assign wire101 = $signed(({((reg82 ? reg60 : wire3) ? wire2 : $signed(reg83)),
                           wire73[(4'h8):(1'h0)]} ?
                       $unsigned((8'ha8)) : $unsigned(wire55[(4'ha):(4'h8)])));
  assign wire102 = reg85[(4'he):(2'h3)];
  assign wire103 = $signed($signed($unsigned(wire3[(3'h4):(2'h3)])));
  assign wire104 = wire72;
endmodule

module module89
#(parameter param98 = ({{({(8'hb8), (8'ha0)} ? ((7'h43) != (8'hba)) : ((8'ha5) > (8'ha9)))}} ? {{(-((8'hb1) ? (8'ha1) : (8'ha0))), (((8'hae) ? (8'hbd) : (8'h9c)) ~^ ((8'ha2) < (7'h40)))}, {(((8'hbe) < (8'hb5)) ? ((8'hb1) ? (8'hb8) : (8'h9e)) : ((8'ha0) ? (7'h40) : (8'hae)))}} : ({(!{(8'hbe)}), (((7'h40) ? (8'hb6) : (8'hba)) ? {(8'hae)} : (|(7'h42)))} ? (({(7'h43)} >= (-(7'h43))) ? {((8'ha2) ? (7'h41) : (8'hb9)), (!(8'hb0))} : (-(~&(8'hb7)))) : (&{((8'h9c) >>> (8'hb5)), (~(8'hb6))}))))
(y, clk, wire93, wire92, wire91, wire90);
  output wire [(32'h40):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire93;
  input wire signed [(3'h5):(1'h0)] wire92;
  input wire signed [(3'h4):(1'h0)] wire91;
  input wire [(4'h8):(1'h0)] wire90;
  wire [(5'h10):(1'h0)] wire96;
  wire [(5'h11):(1'h0)] wire95;
  wire [(4'h9):(1'h0)] wire94;
  reg signed [(5'h15):(1'h0)] reg97 = (1'h0);
  assign y = {wire96, wire95, wire94, reg97, (1'h0)};
  assign wire94 = ($unsigned((&wire91)) < $signed(((((8'hb3) ?
                          wire91 : wire90) ?
                      wire92[(2'h2):(1'h1)] : {(8'ha7),
                          wire90}) && (wire91[(1'h1):(1'h1)] ?
                      $unsigned(wire91) : (wire90 >> (8'ha2))))));
  assign wire95 = ($signed(wire91) ^~ $unsigned((((wire92 ? wire92 : wire93) ?
                      $unsigned((8'ha4)) : $unsigned(wire92)) ^~ {wire92})));
  assign wire96 = $signed(($signed((|(wire95 ? (8'h9e) : (8'hbc)))) ?
                      wire90 : (&wire92[(1'h1):(1'h0)])));
  always
    @(posedge clk) begin
      reg97 <= wire95[(3'h5):(3'h4)];
    end
endmodule

module module6
#(parameter param54 = ((-{((~&(7'h44)) != ((7'h44) ? (8'hab) : (8'hb7)))}) ? (((-((8'haf) - (8'hac))) << ((~&(8'hae)) | ((7'h42) == (8'ha0)))) >>> ({((8'ha3) ? (8'ha8) : (8'hac)), ((8'hbf) != (8'hb3))} ? (~&(8'hb9)) : {((8'hbc) || (8'hb0)), ((8'ha4) ? (8'h9c) : (8'hb8))})) : (({(~(8'ha9)), ((8'hac) ? (8'hbd) : (8'h9c))} ? (((8'hb1) ? (7'h42) : (8'ha1)) ? ((8'hbc) <= (7'h43)) : {(8'hb2)}) : {((8'hbf) ? (8'hb1) : (8'had)), (!(8'hb9))}) & {(^((8'hb6) ? (8'hbf) : (8'hbd)))})))
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'hd9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire10;
  input wire signed [(4'ha):(1'h0)] wire9;
  input wire signed [(5'h11):(1'h0)] wire8;
  input wire [(4'h8):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire53;
  wire signed [(3'h5):(1'h0)] wire52;
  wire signed [(4'hb):(1'h0)] wire51;
  wire [(4'hf):(1'h0)] wire48;
  wire signed [(5'h13):(1'h0)] wire47;
  wire [(5'h11):(1'h0)] wire46;
  wire [(5'h15):(1'h0)] wire45;
  wire signed [(2'h3):(1'h0)] wire43;
  wire [(4'he):(1'h0)] wire16;
  wire signed [(5'h13):(1'h0)] wire15;
  wire signed [(5'h12):(1'h0)] wire14;
  wire signed [(4'h8):(1'h0)] wire13;
  wire [(5'h15):(1'h0)] wire11;
  reg [(3'h6):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg49 = (1'h0);
  reg [(5'h10):(1'h0)] reg12 = (1'h0);
  assign y = {wire53,
                 wire52,
                 wire51,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire43,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire11,
                 reg50,
                 reg49,
                 reg12,
                 (1'h0)};
  assign wire11 = wire9;
  always
    @(posedge clk) begin
      reg12 <= {({wire7} ?
              $signed($unsigned(((7'h42) ?
                  wire9 : wire8))) : ($signed((8'h9e)) + $signed(((7'h42) ?
                  wire11 : wire10))))};
    end
  assign wire13 = ($unsigned(($signed(wire8[(4'hc):(2'h2)]) != reg12)) ?
                      (^~(((wire11 ?
                          (8'hb0) : wire9) >= {reg12}) ^~ $unsigned($signed(wire8)))) : $signed((^wire7[(3'h7):(2'h2)])));
  assign wire14 = wire9[(1'h1):(1'h1)];
  assign wire15 = {(8'haa)};
  assign wire16 = (reg12 == $unsigned({(|$unsigned(wire14)),
                      wire11[(5'h12):(4'hf)]}));
  module17 #() modinst44 (wire43, clk, wire16, wire14, wire8, wire15);
  assign wire45 = {($signed($signed((+wire14))) ?
                          wire16 : $unsigned((~&$signed(wire14)))),
                      (((&$signed((8'haf))) ?
                              (8'had) : ($signed((7'h41)) ?
                                  $unsigned((8'hbb)) : wire11[(3'h7):(1'h0)])) ?
                          (((wire8 < wire15) ?
                              (wire9 < wire8) : (wire43 ?
                                  wire9 : wire13)) || $signed((wire9 >= (8'hb2)))) : wire43)};
  assign wire46 = ($signed($signed(((~^wire16) ?
                          $unsigned(wire11) : ((8'hbb) ? wire16 : reg12)))) ?
                      wire9[(2'h2):(1'h0)] : $unsigned({wire14[(4'h9):(3'h7)],
                          $signed(wire14[(4'ha):(2'h2)])}));
  assign wire47 = {$signed((wire14 ?
                          (((8'hb7) ? wire46 : wire43) ?
                              (wire46 ?
                                  reg12 : (8'hb9)) : $unsigned(reg12)) : $signed((wire15 || (8'ha8)))))};
  assign wire48 = wire45[(5'h15):(2'h2)];
  always
    @(posedge clk) begin
      reg49 <= $unsigned($unsigned($unsigned(wire46[(3'h7):(1'h0)])));
      reg50 <= (wire13 ~^ $unsigned(wire48));
    end
  assign wire51 = {{((wire14 ? {wire13} : reg12[(4'hd):(2'h2)]) ?
                              ($unsigned(wire13) ?
                                  wire9[(3'h7):(3'h4)] : wire43[(1'h0):(1'h0)]) : ((reg49 >= (8'hb6)) < $unsigned(wire13)))}};
  assign wire52 = wire48;
  assign wire53 = $unsigned(reg50);
endmodule

module module17
#(parameter param41 = (((-(8'hb6)) ? (((8'hb5) ? ((8'ha9) ? (8'hae) : (8'hbf)) : ((8'hac) + (8'hba))) ? (~|((8'hb3) - (8'h9c))) : (!((8'hb2) ~^ (8'ha6)))) : (({(8'ha7), (8'ha3)} >>> ((8'haf) || (8'hb7))) ? (^~((8'hab) ? (8'ha2) : (8'hbe))) : {(^~(8'hbf))})) * ({(~((8'hbe) ? (8'hb8) : (8'h9d)))} << (~|(((8'hb7) ? (8'h9e) : (8'hb4)) << ((8'ha1) ? (8'hb8) : (8'hba)))))), 
parameter param42 = ((~|(-((param41 << param41) & param41))) ? (~^(&((!param41) << (param41 + param41)))) : (((param41 <= (param41 ? param41 : param41)) + (((8'ha6) | param41) == param41)) ? ((param41 ? {(7'h40), param41} : ((8'ha9) ? param41 : param41)) == ((~&param41) && param41)) : {param41, (~|(8'ha2))})))
(y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'hd9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire21;
  input wire [(4'h8):(1'h0)] wire20;
  input wire signed [(5'h11):(1'h0)] wire19;
  input wire signed [(4'hd):(1'h0)] wire18;
  wire [(3'h5):(1'h0)] wire40;
  wire signed [(4'h9):(1'h0)] wire39;
  wire signed [(5'h10):(1'h0)] wire37;
  wire signed [(4'ha):(1'h0)] wire36;
  wire signed [(2'h2):(1'h0)] wire35;
  wire signed [(5'h12):(1'h0)] wire34;
  wire signed [(3'h7):(1'h0)] wire33;
  wire signed [(4'ha):(1'h0)] wire32;
  wire [(4'hc):(1'h0)] wire31;
  wire [(5'h15):(1'h0)] wire29;
  wire signed [(4'hb):(1'h0)] wire28;
  wire [(2'h2):(1'h0)] wire27;
  wire signed [(5'h12):(1'h0)] wire26;
  wire [(4'hf):(1'h0)] wire25;
  wire [(4'he):(1'h0)] wire24;
  wire [(3'h4):(1'h0)] wire23;
  wire [(4'hf):(1'h0)] wire22;
  reg [(4'he):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg30 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 reg38,
                 reg30,
                 (1'h0)};
  assign wire22 = wire20;
  assign wire23 = wire21[(1'h0):(1'h0)];
  assign wire24 = $unsigned($unsigned((($signed(wire22) ^ (^(8'ha7))) ?
                      wire23 : $signed($unsigned(wire19)))));
  assign wire25 = $unsigned((~wire24[(4'hd):(4'hd)]));
  assign wire26 = (((^~({wire20,
                          wire20} <= (^~(8'ha8)))) == wire20[(3'h6):(3'h6)]) ?
                      ($signed($unsigned((wire24 ? (8'hb1) : wire25))) ?
                          ((wire19[(1'h1):(1'h0)] ?
                              wire18 : (~|wire21)) ~^ {wire19[(3'h7):(3'h6)],
                              $signed(wire21)}) : $signed($unsigned($unsigned(wire18)))) : ($signed((-(wire19 ?
                          wire21 : wire22))) == $signed($unsigned(wire21))));
  assign wire27 = (!wire25);
  assign wire28 = wire23[(2'h2):(2'h2)];
  assign wire29 = (~wire20);
  always
    @(posedge clk) begin
      reg30 <= (((!wire26) ? (!$signed((wire27 < wire23))) : (~&wire21)) ?
          ($signed((^~((8'ha8) ?
              wire23 : (7'h42)))) ^~ (~^(~^$unsigned(wire20)))) : (~(~((|wire21) << (+wire21)))));
    end
  assign wire31 = ($unsigned((8'hb8)) ? (~&wire28) : (7'h42));
  assign wire32 = {$signed($signed((8'hb3))), wire24};
  assign wire33 = ((!(^~{$signed(wire31), (-wire31)})) >>> (~&wire20));
  assign wire34 = {$unsigned(((8'ha1) << $unsigned($unsigned(wire18))))};
  assign wire35 = ((~&$signed($unsigned((wire18 ? wire20 : wire21)))) | {wire26,
                      wire24[(4'he):(3'h6)]});
  assign wire36 = ($signed(($signed((wire33 ?
                      wire26 : wire32)) + wire21[(2'h2):(1'h1)])) != ((($unsigned(wire31) ?
                          reg30 : {wire20, (8'hbc)}) << {$unsigned(wire23)}) ?
                      (|wire28[(3'h6):(3'h6)]) : $signed($unsigned((reg30 ?
                          wire31 : wire26)))));
  assign wire37 = $unsigned(wire34);
  always
    @(posedge clk) begin
      reg38 <= (-$unsigned(wire28));
    end
  assign wire39 = $unsigned(($unsigned((~^(wire37 ? wire32 : wire31))) ?
                      (((wire34 ? wire25 : wire33) ? (|wire24) : {wire19}) ?
                          reg38[(4'hb):(4'hb)] : wire19[(3'h7):(3'h6)]) : (($unsigned(wire31) && (^(8'hbf))) > $signed(reg38))));
  assign wire40 = {wire23};
endmodule
