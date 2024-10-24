module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hbc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire4;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire [(3'h4):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire129;
  wire signed [(5'h12):(1'h0)] wire128;
  wire [(3'h5):(1'h0)] wire127;
  wire [(2'h2):(1'h0)] wire125;
  wire signed [(4'h8):(1'h0)] wire94;
  wire [(5'h15):(1'h0)] wire93;
  wire [(4'ha):(1'h0)] wire92;
  wire signed [(4'hc):(1'h0)] wire91;
  wire [(4'hd):(1'h0)] wire90;
  wire [(3'h6):(1'h0)] wire88;
  wire signed [(5'h12):(1'h0)] wire8;
  wire signed [(5'h14):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire5;
  assign y = {wire129,
                 wire128,
                 wire127,
                 wire125,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire88,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = {$unsigned($signed(($unsigned(wire4) ?
                         (wire1 <= wire3) : (-wire1)))),
                     (7'h41)};
  assign wire6 = $unsigned(((&wire1) != $unsigned($unsigned(wire4))));
  assign wire7 = (7'h41);
  assign wire8 = ((wire2[(1'h0):(1'h0)] & $unsigned(({wire3, wire7} ?
                     $signed(wire0) : (wire3 ?
                         wire6 : wire3)))) != ((^$signed($signed(wire6))) || $signed(({wire6} ?
                     (wire0 <<< wire5) : wire0))));
  module9 #() modinst89 (wire88, clk, wire4, wire6, wire0, wire5);
  assign wire90 = $unsigned(((!($signed(wire8) ?
                      $signed(wire8) : $signed(wire5))) ^~ ((wire3 == $signed(wire5)) << $unsigned(wire6[(4'hd):(4'h8)]))));
  assign wire91 = wire5;
  assign wire92 = wire88[(2'h3):(2'h3)];
  assign wire93 = ({$unsigned($signed((wire91 ?
                          wire6 : wire88)))} ^ $signed(($unsigned((wire2 <= wire6)) ?
                      ($signed(wire6) ?
                          $signed(wire3) : (wire3 ?
                              wire90 : wire92)) : (+$signed(wire91)))));
  assign wire94 = wire92;
  module95 #() modinst126 (wire125, clk, wire91, wire7, wire90, wire5);
  assign wire127 = wire94;
  assign wire128 = $signed((({$signed(wire92), wire6} + $signed(wire6)) ?
                       (+(-wire1)) : wire4[(4'h9):(1'h0)]));
  assign wire129 = wire7[(2'h2):(2'h2)];
endmodule

module module95
#(parameter param124 = {(({{(8'ha2)}} ? (((8'hbb) ? (7'h40) : (8'ha4)) ? (~(8'hb8)) : {(8'h9d)}) : (~((7'h44) != (8'ha9)))) ? (-(((7'h41) ? (8'ha0) : (8'hba)) ? (~&(8'haf)) : (-(8'hbb)))) : ((((8'ha0) ? (8'had) : (8'hb6)) ? (-(7'h40)) : (~|(7'h43))) ? ({(8'ha1), (8'hb4)} ? (~^(8'ha5)) : (&(8'hb5))) : (~^((8'ha0) <<< (8'haf)))))})
(y, clk, wire99, wire98, wire97, wire96);
  output wire [(32'h3d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire99;
  input wire signed [(3'h4):(1'h0)] wire98;
  input wire [(4'hd):(1'h0)] wire97;
  input wire signed [(5'h14):(1'h0)] wire96;
  wire [(3'h6):(1'h0)] wire123;
  wire signed [(3'h4):(1'h0)] wire122;
  wire signed [(4'h9):(1'h0)] wire121;
  wire signed [(4'hb):(1'h0)] wire120;
  wire signed [(4'he):(1'h0)] wire118;
  wire [(3'h5):(1'h0)] wire101;
  wire [(4'hb):(1'h0)] wire100;
  assign y = {wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire118,
                 wire101,
                 wire100,
                 (1'h0)};
  assign wire100 = $unsigned(wire99);
  assign wire101 = ((8'hae) ?
                       $unsigned(wire97[(4'h8):(4'h8)]) : (wire96 ?
                           $signed(wire96[(3'h4):(1'h1)]) : wire96[(4'hf):(4'ha)]));
  module102 #() modinst119 (.wire106(wire96), .clk(clk), .wire105(wire101), .wire104(wire98), .y(wire118), .wire103(wire99));
  assign wire120 = $signed(wire100);
  assign wire121 = $signed(wire118);
  assign wire122 = ($signed((&wire97)) ?
                       (~&{{{wire99}}}) : (wire99 ?
                           (~&wire97[(3'h6):(3'h5)]) : wire99));
  assign wire123 = wire98;
endmodule

module module9
#(parameter param87 = ({(~{((8'ha8) ? (8'hab) : (8'haa)), ((8'had) <= (8'h9c))}), {(|((8'hb9) ^ (8'hb8)))}} ? (~^((((8'hbf) ? (8'hb3) : (8'hae)) - ((8'hb1) ? (8'hb4) : (8'hbb))) ? (((8'ha1) + (8'h9e)) & ((8'h9c) ? (8'haf) : (8'haa))) : (8'h9c))) : {((~^(|(7'h40))) & ((8'hbc) ? {(7'h42), (7'h40)} : (^~(8'ha6)))), ((((8'h9f) > (8'hb5)) * (~^(8'hbb))) ? (((8'had) > (8'hac)) ? {(8'hb6), (8'ha1)} : ((8'hb5) ? (8'hbb) : (8'hb9))) : (~^((8'ha9) ? (7'h44) : (8'ha8))))}))
(y, clk, wire13, wire12, wire11, wire10);
  output wire [(32'h261):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire13;
  input wire signed [(2'h2):(1'h0)] wire12;
  input wire [(3'h6):(1'h0)] wire11;
  input wire signed [(2'h3):(1'h0)] wire10;
  wire [(5'h11):(1'h0)] wire86;
  wire signed [(4'ha):(1'h0)] wire85;
  wire signed [(4'h8):(1'h0)] wire63;
  wire [(4'h8):(1'h0)] wire60;
  wire signed [(5'h11):(1'h0)] wire59;
  wire [(4'hd):(1'h0)] wire58;
  wire signed [(4'ha):(1'h0)] wire57;
  wire [(5'h13):(1'h0)] wire55;
  wire signed [(4'hc):(1'h0)] wire27;
  wire [(3'h4):(1'h0)] wire26;
  wire signed [(5'h13):(1'h0)] wire25;
  wire signed [(4'hf):(1'h0)] wire24;
  wire signed [(3'h4):(1'h0)] wire23;
  wire signed [(5'h14):(1'h0)] wire22;
  wire [(4'hc):(1'h0)] wire21;
  wire signed [(4'hc):(1'h0)] wire17;
  wire [(4'hf):(1'h0)] wire16;
  wire [(4'hb):(1'h0)] wire15;
  wire signed [(5'h14):(1'h0)] wire14;
  reg signed [(5'h10):(1'h0)] reg84 = (1'h0);
  reg [(5'h15):(1'h0)] reg83 = (1'h0);
  reg [(3'h4):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg81 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg80 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg79 = (1'h0);
  reg [(2'h2):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg76 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg75 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg74 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg73 = (1'h0);
  reg [(4'h9):(1'h0)] reg72 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg71 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg70 = (1'h0);
  reg [(4'hf):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg68 = (1'h0);
  reg [(4'hf):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg66 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg65 = (1'h0);
  reg [(4'ha):(1'h0)] reg64 = (1'h0);
  reg [(5'h12):(1'h0)] reg62 = (1'h0);
  reg [(5'h10):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg33 = (1'h0);
  reg [(5'h14):(1'h0)] reg32 = (1'h0);
  reg [(4'hb):(1'h0)] reg31 = (1'h0);
  reg [(3'h5):(1'h0)] reg30 = (1'h0);
  reg signed [(4'he):(1'h0)] reg29 = (1'h0);
  reg [(4'hc):(1'h0)] reg28 = (1'h0);
  reg [(5'h14):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg19 = (1'h0);
  reg signed [(4'he):(1'h0)] reg18 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire63,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire55,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
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
                 reg64,
                 reg62,
                 reg61,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg20,
                 reg19,
                 reg18,
                 (1'h0)};
  assign wire14 = wire13;
  assign wire15 = $unsigned({$signed((~&wire11[(3'h4):(2'h3)]))});
  assign wire16 = (^~{{$unsigned(((8'hbf) ^ wire10)), wire14[(3'h7):(3'h6)]},
                      wire10});
  assign wire17 = $signed($unsigned({wire11[(3'h4):(2'h3)],
                      ($signed(wire10) ^~ (&wire12))}));
  always
    @(posedge clk) begin
      reg18 <= wire10;
      reg19 <= wire13;
      reg20 <= ((8'hb5) | {(~^((8'ha0) == $signed(reg19))),
          (reg18 ? (+wire14[(3'h5):(1'h0)]) : reg19[(2'h3):(2'h2)])});
    end
  assign wire21 = {wire16,
                      ((~|((wire13 ? wire11 : wire10) ? (^wire12) : {wire13})) ?
                          wire14[(4'h9):(3'h7)] : {(&wire10)})};
  assign wire22 = $unsigned($signed($signed(reg19[(2'h3):(2'h2)])));
  assign wire23 = wire21[(2'h2):(1'h1)];
  assign wire24 = reg18[(4'h9):(2'h2)];
  assign wire25 = {reg18[(3'h4):(2'h2)], $unsigned((|wire17[(4'h9):(2'h2)]))};
  assign wire26 = $signed((reg20 ^ {($unsigned(wire11) ?
                          (~reg18) : wire21[(1'h1):(1'h1)])}));
  assign wire27 = (~|wire22[(3'h4):(1'h0)]);
  always
    @(posedge clk) begin
      reg28 <= $signed($unsigned($unsigned(($signed(wire11) ?
          (~reg19) : $unsigned(wire23)))));
      if ({{(|(~&reg20))}, (^~wire27[(4'h9):(4'h9)])})
        begin
          reg29 <= (wire17[(4'hc):(3'h4)] ?
              wire24 : (wire14 ?
                  wire10 : (wire24 ?
                      {wire17, (8'hb6)} : (&$unsigned(wire13)))));
          reg30 <= (+(-$signed((~wire26[(1'h0):(1'h0)]))));
          reg31 <= (&reg28);
          if (wire10[(1'h0):(1'h0)])
            begin
              reg32 <= reg28;
            end
          else
            begin
              reg32 <= {{$signed({reg32[(3'h7):(1'h0)], $signed(reg32)})}};
            end
        end
      else
        begin
          if ($unsigned((8'hbc)))
            begin
              reg29 <= $signed($unsigned(reg18));
              reg30 <= reg28[(4'h8):(2'h3)];
            end
          else
            begin
              reg29 <= ($unsigned(wire17) ?
                  reg28 : (+($signed($unsigned(wire27)) <<< ({wire22,
                      reg18} >>> $signed(wire16)))));
            end
          reg31 <= $signed((~&(|$unsigned(wire12[(1'h1):(1'h1)]))));
        end
      reg33 <= $unsigned((~&((|(wire17 ? wire24 : wire22)) ?
          $signed($signed(reg29)) : {(-wire26)})));
    end
  module34 #() modinst56 (.wire36(wire24), .wire38(reg20), .clk(clk), .y(wire55), .wire37(reg32), .wire35(wire22));
  assign wire57 = (wire21[(1'h0):(1'h0)] ?
                      $unsigned($signed(reg28)) : ($signed({(+reg20),
                              (reg30 > wire13)}) ?
                          {(~^$signed(wire25))} : (reg18 || ({reg19} || (!wire10)))));
  assign wire58 = $signed(wire13[(1'h0):(1'h0)]);
  assign wire59 = wire58[(4'h8):(2'h3)];
  assign wire60 = $signed((^~$signed(wire11[(2'h3):(2'h3)])));
  always
    @(posedge clk) begin
      reg61 <= $unsigned(($signed(((wire58 - wire22) + (wire14 <<< wire55))) == $signed(wire24[(1'h0):(1'h0)])));
      reg62 <= (((wire14[(5'h14):(2'h3)] ?
              (|(wire11 | wire16)) : wire60[(3'h4):(3'h4)]) && ((((8'ha6) ^ wire16) - wire55[(3'h7):(1'h1)]) ?
              $signed($unsigned(wire59)) : $signed(wire15[(2'h3):(2'h3)]))) ?
          {($signed($unsigned(reg31)) | ($unsigned(wire23) ?
                  $unsigned(wire22) : wire23[(3'h4):(3'h4)]))} : (($unsigned(((8'hab) ?
              reg30 : wire60)) && reg19) >> $signed($unsigned(reg20))));
    end
  assign wire63 = $signed(wire26);
  always
    @(posedge clk) begin
      reg64 <= {{{((wire17 ? wire23 : (8'hb7)) ?
                      wire57[(1'h1):(1'h0)] : ((7'h42) ? (8'hbe) : reg31)),
                  $signed($signed(wire58))}},
          wire16};
      if (wire27)
        begin
          reg65 <= $signed(reg28);
          reg66 <= (8'hb0);
          if (wire17[(4'h8):(3'h4)])
            begin
              reg67 <= reg61[(4'hf):(2'h3)];
            end
          else
            begin
              reg67 <= $unsigned((&(((^~reg28) ?
                      $unsigned((7'h40)) : $unsigned(reg64)) ?
                  {wire60, $signed(reg64)} : (8'ha4))));
              reg68 <= {$signed(wire27), wire57};
              reg69 <= $unsigned(wire15);
              reg70 <= $unsigned(wire55);
            end
          reg71 <= wire23[(1'h1):(1'h1)];
          reg72 <= {((reg19 ?
                  $unsigned((reg31 ?
                      (7'h40) : reg66)) : $signed(reg31)) >= (8'hb6))};
        end
      else
        begin
          reg65 <= reg70;
          if (reg28[(3'h5):(2'h3)])
            begin
              reg66 <= {$unsigned(($signed($signed(wire23)) ?
                      (reg18 < (~&wire21)) : reg32))};
              reg67 <= $signed(reg18);
              reg68 <= (|$signed(($signed(((8'hbf) && wire14)) >= ($signed(wire26) | $signed(reg31)))));
              reg69 <= (($unsigned($unsigned($signed(reg72))) ?
                      wire60[(1'h0):(1'h0)] : wire13[(3'h4):(2'h3)]) ?
                  reg70[(4'hc):(4'hc)] : (reg66[(4'hc):(3'h5)] ?
                      $unsigned(($signed(wire21) | wire22)) : (|reg65)));
            end
          else
            begin
              reg66 <= (($unsigned(wire15[(4'h8):(2'h3)]) ?
                      (wire59 << $signed($signed(reg29))) : $signed({{reg67},
                          $unsigned(reg62)})) ?
                  $unsigned(reg32[(4'h9):(3'h7)]) : $unsigned((&($signed((8'hb5)) ?
                      $signed((7'h40)) : $signed(wire55)))));
            end
        end
      if ($signed($signed(($signed($unsigned(wire21)) | $signed((wire59 ?
          reg69 : reg71))))))
        begin
          if (reg33)
            begin
              reg73 <= (($unsigned((~(~reg18))) || reg33) ?
                  ((~&($signed(reg62) ? reg68 : $signed(wire23))) ?
                      ((reg32[(5'h13):(5'h10)] == (~^reg29)) ?
                          ((&reg32) >= (7'h41)) : (!(wire55 ?
                              (8'hbd) : wire25))) : wire63) : (^(~^($signed((8'hab)) >= (~^reg72)))));
              reg74 <= $signed((~&reg31[(2'h2):(1'h0)]));
              reg75 <= $signed($signed({$signed(reg19)}));
            end
          else
            begin
              reg73 <= (~&((^~wire17) == $unsigned(wire63[(2'h3):(1'h1)])));
              reg74 <= $unsigned((wire10 ?
                  reg33 : {$signed(((7'h42) <= (8'hb1))), wire13}));
              reg75 <= (reg33[(4'hb):(2'h3)] ^ (!(8'ha9)));
              reg76 <= $signed(((^($unsigned(wire60) ?
                  $signed((8'hae)) : wire25[(5'h11):(5'h11)])) > $signed((((7'h40) ?
                  wire55 : (8'hb9)) << (^wire63)))));
              reg77 <= (^$signed({((-(8'haf)) | (^reg28))}));
            end
        end
      else
        begin
          reg73 <= $unsigned(reg74[(3'h7):(3'h6)]);
          reg74 <= {(reg70[(4'he):(3'h6)] ?
                  ((reg76[(1'h0):(1'h0)] ?
                      (reg28 ?
                          wire17 : wire12) : $signed(reg77)) * reg75[(4'ha):(4'h8)]) : (7'h43))};
        end
      if (wire15[(3'h6):(2'h2)])
        begin
          reg78 <= reg33[(5'h11):(4'he)];
          reg79 <= $signed(((+wire14[(4'h9):(1'h0)]) * (reg69 ?
              $unsigned(reg32[(4'hf):(3'h6)]) : reg19[(2'h3):(2'h3)])));
          reg80 <= reg61;
        end
      else
        begin
          if ($signed(((($unsigned(reg30) ?
                      $unsigned(wire11) : {wire59, wire21}) ?
                  $signed(reg69) : reg77) ?
              $unsigned(((+reg69) - (^reg68))) : $signed($signed(reg73[(1'h1):(1'h0)])))))
            begin
              reg78 <= $signed($signed((~|{wire12[(1'h0):(1'h0)]})));
              reg79 <= (~{reg29[(4'h9):(3'h4)]});
              reg80 <= $unsigned($signed((8'hb9)));
              reg81 <= $unsigned($unsigned(($signed((reg74 ?
                  wire11 : reg61)) != {$unsigned(wire24), $signed(reg73)})));
              reg82 <= $unsigned($unsigned(wire13));
            end
          else
            begin
              reg78 <= $unsigned(reg30[(2'h3):(2'h3)]);
            end
          reg83 <= {(^~$unsigned(reg20[(1'h1):(1'h0)]))};
        end
      reg84 <= {((8'hbc) ?
              ($unsigned($signed(wire25)) == $signed($signed(wire11))) : $signed((reg79 ?
                  reg66 : (~|reg20))))};
    end
  assign wire85 = $signed(((^~$unsigned($unsigned(reg78))) ?
                      (((reg69 ? reg73 : (8'ha3)) << wire58) ?
                          (7'h43) : (|$unsigned(reg61))) : $unsigned(((reg73 ?
                          reg76 : reg62) - (+reg62)))));
  assign wire86 = {wire24};
endmodule

module module34  (y, clk, wire38, wire37, wire36, wire35);
  output wire [(32'hc4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire38;
  input wire signed [(2'h3):(1'h0)] wire37;
  input wire signed [(4'h9):(1'h0)] wire36;
  input wire signed [(4'hd):(1'h0)] wire35;
  wire signed [(5'h14):(1'h0)] wire54;
  wire [(2'h2):(1'h0)] wire53;
  wire [(5'h11):(1'h0)] wire52;
  wire [(3'h7):(1'h0)] wire51;
  wire signed [(5'h11):(1'h0)] wire50;
  wire signed [(4'ha):(1'h0)] wire49;
  wire [(5'h10):(1'h0)] wire48;
  wire signed [(2'h2):(1'h0)] wire47;
  wire [(3'h6):(1'h0)] wire45;
  wire [(5'h14):(1'h0)] wire42;
  wire signed [(5'h12):(1'h0)] wire41;
  wire signed [(3'h5):(1'h0)] wire40;
  wire [(5'h11):(1'h0)] wire39;
  reg signed [(4'hb):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg43 = (1'h0);
  assign y = {wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire45,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 reg46,
                 reg44,
                 reg43,
                 (1'h0)};
  assign wire39 = {((($signed(wire38) ?
                              (wire38 == wire35) : (wire37 ?
                                  wire36 : (8'ha1))) ^ (~((8'hb5) ?
                              wire35 : wire35))) ?
                          $signed(((wire37 <= wire35) || wire35)) : $unsigned($signed({(8'hae)}))),
                      {(wire37[(2'h3):(1'h1)] ?
                              wire37[(1'h1):(1'h0)] : {(&wire36)}),
                          wire35[(3'h6):(1'h0)]}};
  assign wire40 = ($unsigned(($signed(wire39[(2'h3):(1'h0)]) ?
                      (~^wire39[(4'h9):(2'h2)]) : (wire37[(1'h0):(1'h0)] << wire35))) >>> ($signed(wire36) ?
                      {$signed($unsigned(wire37))} : ((+(wire36 || wire38)) ?
                          wire35[(3'h5):(1'h0)] : $unsigned($signed(wire39)))));
  assign wire41 = ({(($signed(wire38) <<< (wire39 ? (8'hb3) : wire40)) ?
                              ((wire39 >= wire40) ?
                                  (~wire36) : (wire37 >> wire38)) : ({wire40,
                                      wire35} ?
                                  $signed(wire36) : (wire39 ^ wire38))),
                          {wire38, (^~$unsigned((8'ha1)))}} ?
                      $unsigned((wire40 ?
                          (wire40[(2'h3):(2'h3)] >>> (wire35 & wire37)) : $unsigned($signed(wire35)))) : $signed((~wire38)));
  assign wire42 = wire38[(5'h12):(4'hf)];
  always
    @(posedge clk) begin
      reg43 <= (wire42 ?
          wire42[(5'h10):(4'hb)] : (((|(~^wire36)) || ({wire42, wire42} ?
                  wire41[(2'h2):(2'h2)] : $unsigned((8'haf)))) ?
              wire42 : wire35[(4'h8):(3'h6)]));
      reg44 <= (^reg43[(3'h4):(1'h0)]);
    end
  assign wire45 = wire37;
  always
    @(posedge clk) begin
      reg46 <= {$unsigned($unsigned(wire45))};
    end
  assign wire47 = $signed($unsigned((^~wire42[(5'h11):(3'h7)])));
  assign wire48 = $signed({wire36, wire42});
  assign wire49 = wire36[(3'h4):(1'h1)];
  assign wire50 = wire35;
  assign wire51 = ($unsigned((~&(&(wire42 <<< wire48)))) ?
                      $signed(((8'ha4) ?
                          ((wire36 ?
                              (8'ha8) : (8'hb8)) << wire39) : {(8'hbd)})) : $unsigned((|($unsigned(wire40) <<< $signed(wire49)))));
  assign wire52 = $signed({(8'hb4)});
  assign wire53 = wire36;
  assign wire54 = (^~((~wire52) <<< ($unsigned(((8'ha2) ?
                      (8'ha3) : wire38)) > wire38)));
endmodule

module module102
#(parameter param117 = (-(^~(((|(8'ha2)) ? (~|(8'hb3)) : ((8'ha9) << (7'h43))) ~^ (~&{(8'hac), (8'ha7)})))))
(y, clk, wire106, wire105, wire104, wire103);
  output wire [(32'h7f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire106;
  input wire signed [(2'h2):(1'h0)] wire105;
  input wire [(2'h2):(1'h0)] wire104;
  input wire signed [(4'hc):(1'h0)] wire103;
  wire [(4'ha):(1'h0)] wire116;
  wire signed [(4'hf):(1'h0)] wire115;
  wire [(2'h3):(1'h0)] wire114;
  wire [(5'h14):(1'h0)] wire109;
  wire [(5'h13):(1'h0)] wire108;
  wire [(4'he):(1'h0)] wire107;
  reg signed [(4'ha):(1'h0)] reg113 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg112 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg111 = (1'h0);
  reg [(5'h11):(1'h0)] reg110 = (1'h0);
  assign y = {wire116,
                 wire115,
                 wire114,
                 wire109,
                 wire108,
                 wire107,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 (1'h0)};
  assign wire107 = $signed($signed(((wire103 ?
                           $unsigned((8'haa)) : {wire105, (8'h9c)}) ?
                       wire106[(4'ha):(4'ha)] : wire104[(2'h2):(1'h0)])));
  assign wire108 = ($unsigned(($unsigned(((8'ha0) ? wire107 : wire104)) ?
                       (wire107[(4'hc):(3'h4)] < wire107) : $unsigned(wire104[(1'h1):(1'h0)]))) ~^ $unsigned((wire104 ?
                       (8'h9c) : wire103)));
  assign wire109 = {wire104[(1'h0):(1'h0)]};
  always
    @(posedge clk) begin
      reg110 <= ((~$unsigned(wire106)) && (~{{wire105}}));
    end
  always
    @(posedge clk) begin
      reg111 <= $unsigned(wire105);
      reg112 <= $signed(wire107);
      reg113 <= {wire104};
    end
  assign wire114 = (~^((wire106[(2'h2):(2'h2)] == ($unsigned(wire108) < $signed(reg110))) >>> ($unsigned({reg110,
                       wire103}) >>> $signed($unsigned(reg110)))));
  assign wire115 = ((reg113[(3'h5):(3'h4)] && (!{((8'hb1) ? reg110 : wire105),
                           $unsigned(reg110)})) ?
                       ((+(|$unsigned(wire108))) ^~ {$unsigned($signed(wire107)),
                           ((-wire108) ?
                               {(8'h9d),
                                   (8'hac)} : (^~reg113))}) : ($signed((!$signed(wire105))) ?
                           ((~&$unsigned(wire114)) & {$signed(wire109)}) : wire105[(2'h2):(1'h0)]));
  assign wire116 = {{($unsigned((reg113 ?
                               wire108 : wire114)) ^ ($unsigned(wire104) ?
                               reg112[(3'h7):(3'h6)] : (reg110 && wire109)))}};
endmodule
