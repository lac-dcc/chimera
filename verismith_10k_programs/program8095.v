module top
#(parameter param128 = ((8'hb0) == ((({(8'h9e)} ? ((8'hb8) ? (8'haa) : (8'ha4)) : (8'hb6)) || {((7'h40) == (8'hb9))}) <= (({(7'h40), (8'haa)} <= ((8'had) ? (8'ha4) : (8'ha9))) & (~|(&(8'hbd)))))), 
parameter param129 = (^(param128 ^~ param128)))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h283):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire3;
  wire signed [(3'h6):(1'h0)] wire106;
  wire [(2'h2):(1'h0)] wire71;
  wire signed [(2'h2):(1'h0)] wire70;
  wire [(4'ha):(1'h0)] wire69;
  wire [(5'h15):(1'h0)] wire68;
  wire signed [(5'h11):(1'h0)] wire67;
  wire [(4'h8):(1'h0)] wire66;
  wire [(3'h5):(1'h0)] wire65;
  wire [(3'h6):(1'h0)] wire64;
  wire [(2'h2):(1'h0)] wire60;
  wire [(4'hf):(1'h0)] wire59;
  wire signed [(5'h15):(1'h0)] wire4;
  wire signed [(5'h11):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire7;
  wire [(3'h5):(1'h0)] wire57;
  reg [(5'h14):(1'h0)] reg127 = (1'h0);
  reg [(5'h10):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg125 = (1'h0);
  reg [(3'h6):(1'h0)] reg124 = (1'h0);
  reg [(4'hb):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg121 = (1'h0);
  reg [(5'h12):(1'h0)] reg120 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg119 = (1'h0);
  reg [(4'hf):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg116 = (1'h0);
  reg [(4'ha):(1'h0)] reg115 = (1'h0);
  reg [(5'h15):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg113 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg112 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg111 = (1'h0);
  reg [(4'hb):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg109 = (1'h0);
  reg [(3'h5):(1'h0)] reg108 = (1'h0);
  reg [(4'h8):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg84 = (1'h0);
  reg [(4'hf):(1'h0)] reg83 = (1'h0);
  reg [(4'he):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg81 = (1'h0);
  reg [(4'h9):(1'h0)] reg80 = (1'h0);
  reg [(5'h11):(1'h0)] reg79 = (1'h0);
  reg [(5'h14):(1'h0)] reg78 = (1'h0);
  reg [(3'h5):(1'h0)] reg77 = (1'h0);
  reg [(5'h10):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg74 = (1'h0);
  reg [(5'h15):(1'h0)] reg73 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg72 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg63 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg61 = (1'h0);
  assign y = {wire106,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire60,
                 wire59,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire57,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
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
                 reg63,
                 reg62,
                 reg61,
                 (1'h0)};
  assign wire4 = ($unsigned($unsigned($unsigned(wire0[(5'h13):(1'h0)]))) != {(($unsigned(wire2) ?
                             $signed(wire0) : {wire0}) ?
                         ({wire1, wire1} ?
                             (wire2 ?
                                 wire3 : wire1) : (wire0 - (7'h44))) : (8'hab)),
                     wire2[(4'hc):(2'h2)]});
  assign wire5 = wire3;
  assign wire6 = wire3[(1'h0):(1'h0)];
  assign wire7 = wire6;
  module8 #() modinst58 (wire57, clk, wire1, wire4, wire0, wire6, wire5);
  assign wire59 = wire7[(2'h3):(1'h0)];
  assign wire60 = wire59;
  always
    @(posedge clk) begin
      reg61 <= (wire5 ? (~&wire4) : wire3);
      reg62 <= wire57[(2'h2):(2'h2)];
      reg63 <= (~^$unsigned(wire2[(1'h0):(1'h0)]));
    end
  assign wire64 = $signed(($signed({wire6[(4'hb):(2'h2)]}) <= (8'hab)));
  assign wire65 = $signed({($signed((|wire2)) ?
                          ((8'hbe) ^ $signed(wire3)) : reg62),
                      wire59[(4'ha):(4'h8)]});
  assign wire66 = {wire2[(2'h2):(2'h2)]};
  assign wire67 = $unsigned((-(($unsigned(wire6) == (&(8'hb7))) ?
                      (8'hb9) : $unsigned((wire1 < reg63)))));
  assign wire68 = $signed($signed(reg62[(4'h8):(3'h4)]));
  assign wire69 = reg62;
  assign wire70 = wire60;
  assign wire71 = wire59[(4'h8):(3'h7)];
  always
    @(posedge clk) begin
      if ((!((((wire4 ? wire5 : wire1) ? reg61 : $unsigned((8'hbf))) ?
              wire68 : $unsigned({(8'hbf), wire70})) ?
          $unsigned({$unsigned(wire69)}) : ($signed(reg63) ?
              $signed($unsigned(wire1)) : (&wire68[(4'ha):(2'h2)])))))
        begin
          reg72 <= wire67;
          reg73 <= $signed(wire2[(2'h3):(1'h1)]);
          reg74 <= {((8'ha7) ?
                  $unsigned((~&wire70)) : (-reg73[(5'h12):(5'h10)]))};
        end
      else
        begin
          reg72 <= reg63[(3'h4):(3'h4)];
          reg73 <= wire1[(3'h7):(3'h6)];
          reg74 <= wire2;
          if ($unsigned($unsigned((wire70 < ((wire69 | wire57) ?
              $signed(wire59) : (wire5 ? wire4 : reg74))))))
            begin
              reg75 <= {(!$signed(wire64[(3'h4):(1'h0)])),
                  $unsigned(wire71[(2'h2):(2'h2)])};
              reg76 <= {reg72};
            end
          else
            begin
              reg75 <= $unsigned($signed($signed((~^(wire67 ?
                  wire64 : (8'hbe))))));
              reg76 <= (!wire67[(2'h2):(2'h2)]);
            end
        end
      reg77 <= ($unsigned((&(~^$unsigned((8'h9e))))) >> $unsigned(((wire67 < (reg72 ?
          wire3 : wire57)) == $signed(((8'hba) ? (8'ha6) : reg63)))));
      reg78 <= reg76[(3'h7):(3'h7)];
    end
  always
    @(posedge clk) begin
      reg79 <= (wire3[(3'h5):(1'h1)] ? (&wire68) : wire3[(2'h2):(1'h1)]);
      reg80 <= wire7;
      reg81 <= $signed(($unsigned((&(wire69 ?
          wire67 : wire64))) + $unsigned($signed($signed(wire69)))));
      reg82 <= reg75[(4'h9):(4'h9)];
    end
  always
    @(posedge clk) begin
      reg83 <= {wire2, $signed({reg76[(4'ha):(3'h4)], reg61[(4'h8):(2'h3)]})};
      reg84 <= $signed(reg62);
      reg85 <= wire68;
      reg86 <= ((-$unsigned({reg84[(2'h2):(1'h0)], {wire3}})) ?
          $signed((wire3[(1'h0):(1'h0)] ^ (wire69[(2'h2):(1'h0)] ?
              $signed(reg79) : $signed(reg82)))) : ($unsigned($signed(reg83)) ?
              ($signed($signed(reg83)) + (8'hab)) : $signed(((~^wire7) && $signed(reg80)))));
    end
  module87 #() modinst107 (.y(wire106), .wire90(wire69), .wire88(reg85), .wire91(wire67), .wire89(reg82), .clk(clk));
  always
    @(posedge clk) begin
      reg108 <= reg77;
      if (reg78[(3'h7):(1'h0)])
        begin
          if ($signed(($signed((~|(wire60 ?
              (8'hb0) : reg77))) ~^ ($signed((^wire64)) >> {reg61[(3'h7):(3'h6)]}))))
            begin
              reg109 <= (~^$signed(reg61[(4'hf):(4'hb)]));
            end
          else
            begin
              reg109 <= wire70;
              reg110 <= (((8'ha9) == (+((reg74 << reg74) ?
                      (reg80 < wire59) : (8'had)))) ?
                  ($signed(((~^reg75) * (reg61 <= wire5))) ?
                      ({$unsigned(reg76)} ~^ wire0[(5'h14):(1'h0)]) : {reg79[(2'h3):(2'h2)]}) : reg82);
              reg111 <= (7'h40);
              reg112 <= reg82;
              reg113 <= (~^reg62[(3'h4):(1'h1)]);
            end
          reg114 <= {{$unsigned(reg82), $signed(wire67[(1'h1):(1'h1)])}};
        end
      else
        begin
          reg109 <= $unsigned((reg72[(1'h0):(1'h0)] ^ ($unsigned((!reg61)) <= wire57[(3'h5):(1'h0)])));
        end
      if ((((reg113 + wire65) ?
              wire3 : $unsigned(((wire71 >= wire1) && {reg80}))) ?
          ($signed($signed({(8'hb7),
              wire5})) >= (reg79[(1'h0):(1'h0)] + reg63)) : ({{$signed(wire70)}} ?
              reg86 : (((wire5 ? reg76 : wire5) ?
                      $unsigned(wire57) : reg84[(2'h2):(1'h0)]) ?
                  (wire68[(5'h11):(1'h0)] | reg74[(5'h10):(4'hd)]) : (8'ha1)))))
        begin
          reg115 <= reg76[(1'h0):(1'h0)];
          reg116 <= (|(^~wire7));
          reg117 <= $signed(reg112[(3'h7):(3'h5)]);
        end
      else
        begin
          if (reg109)
            begin
              reg115 <= ((8'hac) || reg114);
              reg116 <= (((&$signed({wire4, reg84})) ?
                  reg113[(4'hc):(4'ha)] : $unsigned(reg74)) <<< ((!$signed((^~(8'hac)))) ~^ wire6[(3'h4):(2'h2)]));
              reg117 <= ($signed($unsigned({(7'h44)})) ?
                  (wire68[(4'hb):(3'h6)] ^ (8'hbf)) : (($unsigned($unsigned(wire0)) ?
                          (reg83[(1'h0):(1'h0)] ?
                              wire65 : (~reg76)) : ((-wire106) & $signed((8'h9d)))) ?
                      reg74[(5'h11):(4'h9)] : wire106[(2'h2):(1'h1)]));
              reg118 <= ((-wire6) < $signed((((reg111 ?
                      wire60 : reg62) << (|(8'ha9))) ?
                  (wire66[(4'h8):(3'h4)] ?
                      (reg80 ? reg77 : wire7) : {wire1,
                          wire2}) : wire65[(2'h2):(1'h0)])));
            end
          else
            begin
              reg115 <= $signed($unsigned(reg85));
              reg116 <= reg77;
            end
          reg119 <= (wire69 ?
              $signed(((+$signed(reg82)) ?
                  ((wire67 ^ wire3) || (|reg80)) : ((reg118 <= wire1) && reg76[(4'hc):(4'hc)]))) : (($signed((wire66 ?
                      wire59 : wire2)) ^ {{reg109}, (-wire5)}) ?
                  $unsigned($signed((wire69 >>> reg84))) : ($unsigned(((8'ha3) + reg108)) ?
                      reg114[(5'h11):(1'h0)] : ($signed(wire71) ^~ $signed(wire69)))));
          reg120 <= (reg79[(4'h8):(1'h1)] <= $unsigned($unsigned(reg83)));
        end
      if ((+wire106[(2'h2):(1'h0)]))
        begin
          reg121 <= wire69;
        end
      else
        begin
          reg121 <= ($signed({({wire64} ? (reg85 ? reg121 : wire65) : wire67),
                  reg75[(3'h6):(3'h4)]}) ?
              (wire71 <= reg77) : (^$unsigned($unsigned(wire4))));
          reg122 <= (reg119[(3'h6):(2'h3)] && reg63[(1'h0):(1'h0)]);
          if ({(^reg63[(2'h2):(1'h0)]), reg109[(2'h2):(1'h0)]})
            begin
              reg123 <= reg81[(4'hc):(1'h0)];
              reg124 <= $unsigned((reg83[(1'h0):(1'h0)] && {$signed({(7'h42)})}));
              reg125 <= $signed((8'ha2));
              reg126 <= (($unsigned(($unsigned(reg63) ~^ reg80[(4'h8):(2'h3)])) || $signed(($signed(reg117) ?
                      (~&reg114) : reg117[(3'h4):(2'h3)]))) ?
                  $unsigned(reg81) : (~|($unsigned((reg72 ? (8'hbc) : wire3)) ?
                      reg123 : ($signed(reg79) ?
                          $unsigned(wire106) : (reg110 ? wire65 : reg72)))));
              reg127 <= $unsigned($signed(reg81));
            end
          else
            begin
              reg123 <= ($signed((reg62[(3'h4):(2'h2)] ?
                      wire106 : ((reg63 ?
                          wire70 : reg113) | wire106[(3'h6):(3'h5)]))) ?
                  {((~|wire1) ?
                          $signed((-reg115)) : ((wire69 >= reg121) ?
                              wire6[(4'h8):(4'h8)] : $unsigned(wire64)))} : $signed({({reg114,
                              wire65} ?
                          {wire69} : (reg115 ~^ reg116))}));
              reg124 <= (~|(~$unsigned({$signed(reg86)})));
              reg125 <= $unsigned((reg126[(3'h5):(1'h1)] >= wire1));
            end
        end
    end
endmodule

module module87
#(parameter param104 = (((((-(8'hb5)) | {(8'h9c), (8'ha0)}) ? (((8'hb4) << (8'hb6)) <<< ((8'ha4) >= (8'haf))) : (~|(+(8'hb5)))) ? {((&(8'haa)) ^~ (|(7'h44)))} : ({((8'hab) <= (8'hac))} ^ (((8'hbf) ? (8'hbd) : (8'hb5)) | ((8'ha1) ? (8'hbc) : (8'ha9))))) - ((8'hb5) <= (^(((8'ha2) ? (8'h9e) : (8'hb3)) ? (^(8'hb4)) : ((8'haa) >> (8'ha0)))))), 
parameter param105 = (+(~|(^param104))))
(y, clk, wire91, wire90, wire89, wire88);
  output wire [(32'h95):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire91;
  input wire signed [(3'h6):(1'h0)] wire90;
  input wire [(4'h8):(1'h0)] wire89;
  input wire [(4'hf):(1'h0)] wire88;
  wire signed [(4'hc):(1'h0)] wire103;
  wire signed [(4'he):(1'h0)] wire102;
  wire [(5'h15):(1'h0)] wire101;
  wire [(3'h5):(1'h0)] wire100;
  wire [(5'h13):(1'h0)] wire97;
  wire [(5'h10):(1'h0)] wire96;
  wire [(3'h6):(1'h0)] wire95;
  wire signed [(5'h12):(1'h0)] wire94;
  wire [(4'ha):(1'h0)] wire93;
  wire signed [(2'h2):(1'h0)] wire92;
  reg signed [(4'hd):(1'h0)] reg99 = (1'h0);
  reg [(4'hc):(1'h0)] reg98 = (1'h0);
  assign y = {wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 reg99,
                 reg98,
                 (1'h0)};
  assign wire92 = (^wire90);
  assign wire93 = ((wire90 ?
                      $signed($unsigned($signed(wire89))) : ((8'hbf) * $signed((wire89 ?
                          wire89 : wire89)))) != ($unsigned({wire90}) ?
                      $unsigned((&((8'hb2) | wire91))) : (wire92[(1'h0):(1'h0)] ?
                          wire90[(2'h3):(1'h1)] : wire90)));
  assign wire94 = wire91;
  assign wire95 = wire93[(3'h7):(3'h6)];
  assign wire96 = ($signed($signed(($unsigned((7'h41)) != $unsigned(wire88)))) << wire93[(3'h4):(2'h3)]);
  assign wire97 = ($signed(wire88[(3'h6):(2'h3)]) ^ wire88);
  always
    @(posedge clk) begin
      if (($signed((($signed(wire95) ?
          wire92[(1'h0):(1'h0)] : (wire89 ?
              wire89 : wire91)) <= ($signed(wire97) < wire95))) ^~ (wire96 + (wire90[(2'h3):(1'h1)] ?
          wire88[(4'hd):(1'h0)] : ({wire88, wire88} ?
              (wire94 ? wire89 : wire91) : wire91[(3'h5):(1'h1)])))))
        begin
          reg98 <= $unsigned(wire92);
          reg99 <= $unsigned(((^(((8'hae) ^ wire95) ?
                  ((7'h41) ? wire89 : wire90) : wire95)) ?
              ((wire89[(2'h2):(1'h0)] ?
                      (wire90 >> wire89) : {(7'h42), wire88}) ?
                  ((wire92 ?
                      wire91 : wire92) != ((8'hb5) ~^ wire95)) : wire89[(3'h4):(1'h0)]) : wire90));
        end
      else
        begin
          reg98 <= $signed((~&(wire92 ?
              wire88[(3'h5):(1'h1)] : wire97[(4'he):(4'h9)])));
        end
    end
  assign wire100 = {$unsigned(wire88),
                       (-$unsigned(((wire96 << wire93) ?
                           (^~wire92) : ((7'h40) ? wire94 : wire90))))};
  assign wire101 = reg98[(3'h5):(1'h1)];
  assign wire102 = $unsigned((({(+(8'hbb)), (wire93 != wire101)} != wire100) ?
                       $unsigned($unsigned(wire100)) : (&(8'h9e))));
  assign wire103 = (~&(wire97 ?
                       {wire90[(1'h1):(1'h0)],
                           $unsigned(wire102[(4'hb):(3'h7)])} : {({(8'hb7)} || (~(8'hb6)))}));
endmodule

module module8
#(parameter param55 = ((((~&(+(7'h42))) ? ((+(7'h42)) | ((8'ha5) << (8'h9d))) : ((~(8'hb9)) + (~&(8'ha1)))) >> ((8'hbb) << (-((8'ha2) ? (8'h9d) : (8'hb2))))) ? (+((8'hab) ? (((8'hb5) && (8'hb8)) ? {(7'h44), (8'ha0)} : (^(8'hbc))) : (((8'ha4) ? (8'hab) : (8'haf)) ? (8'h9f) : ((8'hbd) < (8'hb6))))) : {{(((8'ha4) ? (8'hae) : (7'h42)) <= (^~(8'hab))), (~&(~|(8'hb3)))}}), 
parameter param56 = (((param55 ? {param55} : ((param55 ? param55 : param55) ? param55 : param55)) ? (param55 != (|{(7'h40), param55})) : param55) ? {((~param55) ? (~&(&(8'hba))) : param55), (((param55 ? param55 : param55) ~^ param55) << ((&param55) ? (^~param55) : {param55}))} : param55))
(y, clk, wire9, wire10, wire11, wire12, wire13);
  output wire [(32'hba):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire9;
  input wire [(5'h15):(1'h0)] wire10;
  input wire signed [(5'h15):(1'h0)] wire11;
  input wire [(5'h10):(1'h0)] wire12;
  input wire [(5'h11):(1'h0)] wire13;
  wire signed [(4'hf):(1'h0)] wire53;
  wire signed [(4'he):(1'h0)] wire52;
  wire [(4'hc):(1'h0)] wire51;
  wire signed [(4'hb):(1'h0)] wire50;
  wire [(4'h8):(1'h0)] wire49;
  wire [(5'h11):(1'h0)] wire48;
  wire [(4'hd):(1'h0)] wire47;
  wire signed [(4'ha):(1'h0)] wire46;
  wire signed [(5'h12):(1'h0)] wire45;
  wire [(4'hf):(1'h0)] wire44;
  wire signed [(5'h10):(1'h0)] wire14;
  wire signed [(5'h12):(1'h0)] wire15;
  wire [(4'he):(1'h0)] wire16;
  wire [(2'h2):(1'h0)] wire42;
  reg signed [(2'h2):(1'h0)] reg54 = (1'h0);
  assign y = {wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire14,
                 wire15,
                 wire16,
                 wire42,
                 reg54,
                 (1'h0)};
  assign wire14 = wire12[(5'h10):(3'h4)];
  assign wire15 = (wire12 ?
                      $unsigned({($signed(wire13) ^~ (!(8'hb4)))}) : wire14);
  assign wire16 = (!(-(~|(^~wire10[(4'h8):(3'h5)]))));
  module17 #() modinst43 (wire42, clk, wire12, wire10, wire15, wire13, wire11);
  assign wire44 = $unsigned($signed($unsigned($unsigned($unsigned(wire9)))));
  assign wire45 = $unsigned({(wire42 * (wire42 <= $signed((8'hb0))))});
  assign wire46 = $signed($unsigned((({(8'hb6), (8'hab)} ?
                      {wire11} : (^~wire14)) | {wire13})));
  assign wire47 = $unsigned($unsigned(wire46));
  assign wire48 = $unsigned(((+(8'hb2)) >> $unsigned((~|wire11))));
  assign wire49 = (+$signed((+((~^wire47) ?
                      $signed(wire48) : $unsigned(wire46)))));
  assign wire50 = {$signed({(^{wire9}), wire16})};
  assign wire51 = (|$signed((wire44[(4'hd):(3'h7)] <= wire14)));
  assign wire52 = $unsigned($unsigned($signed(((wire48 ? wire46 : wire46) ?
                      (wire16 ? wire44 : wire45) : wire15[(4'ha):(2'h3)]))));
  assign wire53 = $signed({((!$unsigned(wire13)) ?
                          (&(|(8'h9f))) : (wire49[(3'h4):(2'h3)] ~^ ((8'ha4) ?
                              (8'hb6) : wire48))),
                      wire45[(4'hd):(3'h6)]});
  always
    @(posedge clk) begin
      reg54 <= (~^(wire51[(4'h9):(1'h1)] ^ wire44));
    end
endmodule

module module17
#(parameter param41 = {({((&(8'h9f)) > ((8'h9d) ? (8'h9c) : (8'h9c))), (((8'hb9) & (8'hb6)) & (|(8'hbf)))} ? {(((8'hb5) + (8'ha5)) <<< ((8'hb7) ? (8'hbb) : (8'h9e))), ((~|(8'ha0)) ? ((7'h40) << (8'ha2)) : ((8'h9f) ? (8'ha6) : (8'ha9)))} : (~|({(8'hba)} ? (~(8'ha6)) : ((8'hac) <<< (8'ha2))))), {((!((8'hbe) ? (8'ha3) : (8'ha3))) ? ((~(8'h9d)) ? ((8'ha4) ? (8'hbd) : (8'ha4)) : ((8'h9f) > (8'hb1))) : (((8'h9f) ? (7'h41) : (8'hb4)) != (^~(8'hb7))))}})
(y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'he5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire22;
  input wire signed [(4'hd):(1'h0)] wire21;
  input wire [(5'h12):(1'h0)] wire20;
  input wire signed [(4'h8):(1'h0)] wire19;
  input wire [(3'h6):(1'h0)] wire18;
  wire [(4'hf):(1'h0)] wire40;
  wire [(5'h12):(1'h0)] wire39;
  wire [(4'hd):(1'h0)] wire34;
  wire signed [(4'ha):(1'h0)] wire33;
  wire signed [(5'h12):(1'h0)] wire32;
  wire [(4'hf):(1'h0)] wire31;
  reg [(2'h2):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg37 = (1'h0);
  reg [(2'h3):(1'h0)] reg36 = (1'h0);
  reg [(5'h10):(1'h0)] reg35 = (1'h0);
  reg [(4'he):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg28 = (1'h0);
  reg [(4'hf):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg26 = (1'h0);
  reg [(5'h15):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg23 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg23 <= ((~wire18[(1'h0):(1'h0)]) ?
          $unsigned(((wire18 < (wire22 >= wire21)) ?
              (+(wire18 <<< wire19)) : wire22)) : (wire22 ?
              $unsigned($unsigned($unsigned(wire20))) : ($signed((+wire22)) * $unsigned((8'ha9)))));
      if ((~(-((wire22 - (reg23 << wire21)) > $signed({(8'hb9)})))))
        begin
          reg24 <= $unsigned(($signed($unsigned((reg23 - wire18))) >= (reg23[(2'h2):(1'h0)] ?
              ((wire18 - (7'h43)) >= (!wire18)) : ($unsigned(wire18) ?
                  (&reg23) : (wire20 ? wire19 : wire18)))));
          if (wire20[(4'hf):(3'h6)])
            begin
              reg25 <= $unsigned(($signed($unsigned(reg23[(4'hf):(4'hb)])) ?
                  (((wire20 ^ reg23) ? (~^reg23) : $unsigned(reg23)) ?
                      $signed({reg24}) : ({(8'h9e)} != wire19)) : (&wire18[(1'h1):(1'h1)])));
            end
          else
            begin
              reg25 <= wire19[(4'h8):(1'h0)];
              reg26 <= (&(!$unsigned($signed({(8'ha1), (7'h42)}))));
            end
          reg27 <= reg25[(5'h10):(4'h8)];
          reg28 <= (reg24[(2'h2):(1'h1)] ?
              {$unsigned($signed((wire18 - reg27)))} : (!wire22));
        end
      else
        begin
          reg24 <= $signed((~^$unsigned(reg26)));
          reg25 <= ((~wire21[(1'h1):(1'h0)]) ?
              reg26[(2'h3):(2'h2)] : (~^(-(+(reg26 <<< reg28)))));
          reg26 <= reg25[(4'h9):(2'h3)];
        end
      reg29 <= (reg23[(3'h6):(3'h5)] == reg28);
      reg30 <= ((^reg27[(4'he):(4'h8)]) == $signed($unsigned($unsigned($unsigned(wire21)))));
    end
  assign wire31 = wire18;
  assign wire32 = $signed((reg25[(5'h14):(3'h4)] >>> $unsigned(reg24[(3'h4):(2'h2)])));
  assign wire33 = {((wire18[(3'h4):(1'h0)] + reg29[(1'h1):(1'h1)]) >> $signed(((reg23 ?
                          reg27 : reg23) >>> (reg29 | wire20)))),
                      reg25[(4'hf):(4'ha)]};
  assign wire34 = {($signed((wire20[(4'hb):(3'h4)] ?
                          $signed(wire32) : (wire19 == (8'hb7)))) | (^{(wire20 ?
                              wire21 : reg27),
                          $unsigned(reg27)}))};
  always
    @(posedge clk) begin
      reg35 <= wire19;
      reg36 <= (reg35[(4'h9):(2'h3)] ?
          ({($unsigned(reg26) ~^ $signed(reg28)), $unsigned((8'hb1))} ?
              wire18[(2'h3):(2'h3)] : (~&((reg27 <<< reg28) ?
                  reg26[(5'h13):(3'h7)] : (reg30 & wire18)))) : ((^~($signed(reg24) ?
              $unsigned(wire20) : (&reg28))) != {((^wire21) ?
                  (reg26 < wire34) : reg29)}));
      reg37 <= wire33[(1'h0):(1'h0)];
      reg38 <= ($signed(reg25[(4'he):(3'h6)]) <= (~|({reg23[(3'h7):(2'h2)],
              (reg23 ? reg24 : (8'h9c))} ?
          wire34[(2'h2):(1'h0)] : {$signed((8'hb9))})));
    end
  assign wire39 = ({(((reg37 < wire19) ?
                              $unsigned(reg23) : wire20) < (|$unsigned(reg30)))} ?
                      (~^{(wire32 ? (~reg23) : wire22), wire21}) : (8'hb0));
  assign wire40 = wire21;
endmodule
