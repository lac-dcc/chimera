module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h19c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire143;
  wire signed [(4'he):(1'h0)] wire142;
  wire [(4'hb):(1'h0)] wire141;
  wire signed [(3'h7):(1'h0)] wire124;
  wire [(5'h15):(1'h0)] wire123;
  wire signed [(2'h2):(1'h0)] wire122;
  wire [(2'h2):(1'h0)] wire121;
  wire signed [(4'h9):(1'h0)] wire120;
  wire signed [(4'hf):(1'h0)] wire119;
  wire signed [(2'h3):(1'h0)] wire117;
  wire [(4'hd):(1'h0)] wire27;
  wire signed [(3'h7):(1'h0)] wire26;
  wire signed [(5'h14):(1'h0)] wire24;
  wire [(4'hc):(1'h0)] wire9;
  wire [(4'he):(1'h0)] wire8;
  wire [(5'h13):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire4;
  reg [(4'ha):(1'h0)] reg140 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg139 = (1'h0);
  reg [(2'h3):(1'h0)] reg138 = (1'h0);
  reg [(4'hf):(1'h0)] reg137 = (1'h0);
  reg [(4'ha):(1'h0)] reg136 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg135 = (1'h0);
  reg [(3'h7):(1'h0)] reg134 = (1'h0);
  reg [(4'he):(1'h0)] reg133 = (1'h0);
  reg [(5'h13):(1'h0)] reg132 = (1'h0);
  reg [(5'h10):(1'h0)] reg131 = (1'h0);
  reg [(5'h15):(1'h0)] reg130 = (1'h0);
  reg [(4'hd):(1'h0)] reg129 = (1'h0);
  reg [(2'h2):(1'h0)] reg128 = (1'h0);
  reg [(3'h4):(1'h0)] reg127 = (1'h0);
  reg [(4'hd):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg125 = (1'h0);
  assign y = {wire143,
                 wire142,
                 wire141,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire117,
                 wire27,
                 wire26,
                 wire24,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg140,
                 reg139,
                 reg138,
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
                 (1'h0)};
  assign wire4 = wire2;
  assign wire5 = wire1;
  assign wire6 = ((^~{(wire0 <<< (wire2 ? wire4 : wire1)),
                         {wire3[(4'he):(4'hb)]}}) ?
                     (~|$unsigned($signed(wire3[(3'h6):(3'h5)]))) : (!$signed($unsigned($unsigned(wire0)))));
  assign wire7 = ((-$unsigned((~|{wire5}))) ^~ $unsigned(((~^wire5[(1'h1):(1'h0)]) && $signed(wire3))));
  assign wire8 = (~wire1[(1'h0):(1'h0)]);
  assign wire9 = wire8[(4'he):(1'h0)];
  module10 #() modinst25 (.wire11(wire3), .wire13(wire4), .wire12(wire2), .y(wire24), .wire14(wire9), .clk(clk));
  assign wire26 = wire0[(1'h1):(1'h1)];
  assign wire27 = wire9;
  module28 #() modinst118 (.wire31(wire5), .clk(clk), .wire29(wire3), .y(wire117), .wire32(wire9), .wire30(wire6));
  assign wire119 = (~&$unsigned($unsigned(wire27)));
  assign wire120 = $unsigned({($signed($signed(wire8)) & wire9[(4'h8):(1'h1)]),
                       $signed(((|wire6) ?
                           {wire1, wire7} : (wire26 <<< wire2)))});
  assign wire121 = wire0;
  assign wire122 = wire119;
  assign wire123 = $unsigned(($unsigned((+wire120)) << ({$unsigned(wire9)} - {wire120,
                       ((8'hbb) ? (8'hb2) : wire1)})));
  assign wire124 = {wire3[(2'h3):(2'h2)]};
  always
    @(posedge clk) begin
      if ((wire120[(4'h8):(2'h2)] ^~ (-((^(wire27 ? wire8 : (8'hbd))) ?
          wire5 : (wire119 << wire24[(4'hd):(4'ha)])))))
        begin
          reg125 <= ($unsigned((^~$signed(((8'h9c) - wire26)))) ?
              ({($signed(wire121) ? $unsigned(wire27) : (8'ha1))} ?
                  $unsigned($signed($unsigned(wire124))) : (^wire7)) : (+((&(~|(7'h43))) ?
                  $unsigned((!wire119)) : $signed((wire8 ?
                      wire119 : wire117)))));
        end
      else
        begin
          reg125 <= $signed($unsigned((wire1[(2'h2):(1'h0)] ?
              (-wire124[(2'h2):(2'h2)]) : {wire122[(2'h2):(1'h1)],
                  $unsigned(wire121)})));
          reg126 <= $unsigned((~wire24[(4'h8):(1'h0)]));
          reg127 <= wire7[(4'ha):(2'h2)];
        end
      if ((~&$unsigned({(8'hbf), ((!(8'hba)) + (~|wire3))})))
        begin
          if ({$unsigned((($unsigned((8'h9e)) ^ wire26[(3'h7):(3'h7)]) * ((wire27 ?
                  wire6 : wire117) == (wire122 ^~ wire9))))})
            begin
              reg128 <= (~^$signed(wire120[(4'h8):(3'h5)]));
              reg129 <= (wire121[(1'h1):(1'h0)] + (wire121 != (+wire24)));
              reg130 <= $signed(wire3[(4'hf):(4'hb)]);
              reg131 <= wire1[(2'h2):(1'h0)];
            end
          else
            begin
              reg128 <= $signed((wire120 && $signed(wire2)));
              reg129 <= (+wire117);
              reg130 <= $signed(((((!wire26) < (wire0 ?
                      wire0 : reg130)) || wire26) ?
                  (8'ha3) : $unsigned(((reg130 ? wire119 : wire0) ?
                      (wire3 + (8'hb1)) : {reg127, reg130}))));
            end
          reg132 <= wire0[(1'h1):(1'h0)];
          if ($signed($signed((-reg131))))
            begin
              reg133 <= $unsigned({$signed(((wire5 > wire27) ?
                      (wire3 ? wire5 : wire123) : {wire117}))});
              reg134 <= $unsigned(reg128);
              reg135 <= (($unsigned((~|wire117)) > $unsigned(wire3[(2'h2):(1'h1)])) <<< {$unsigned((~|reg127))});
              reg136 <= ((|(~^$unsigned($unsigned(reg134)))) ?
                  $signed((($signed(reg129) ?
                          (wire120 ? (8'ha1) : wire8) : (wire7 >= reg132)) ?
                      wire5 : reg130)) : (~$signed(wire123)));
              reg137 <= ($unsigned((~^((^(8'hb5)) ^~ wire0[(1'h1):(1'h0)]))) ?
                  $unsigned(wire3[(3'h5):(3'h4)]) : (~(!reg129)));
            end
          else
            begin
              reg133 <= $signed((^~(!{(~wire5), (7'h42)})));
              reg134 <= wire121;
              reg135 <= (~^reg129[(4'h8):(3'h5)]);
            end
        end
      else
        begin
          reg128 <= {wire27,
              (((wire24 ?
                  (wire26 >= (8'h9f)) : $signed(wire7)) >= (-(~&wire9))) ^ (wire124[(3'h6):(2'h2)] ^~ $unsigned((reg128 < wire120))))};
          reg129 <= $unsigned(($unsigned(($unsigned(wire124) ?
              wire117[(1'h1):(1'h1)] : (wire3 + wire124))) <= (reg127 ?
              wire7 : (8'had))));
        end
      reg138 <= (((((reg126 ? wire27 : reg129) - (wire120 >> (8'hbb))) ?
                  reg134[(3'h7):(1'h1)] : ((wire24 == reg133) ?
                      ((7'h44) ? reg126 : wire124) : $unsigned(wire121))) ?
              (~|((^~wire0) & ((8'h9d) ?
                  reg132 : wire119))) : wire124[(3'h4):(2'h2)]) ?
          $signed($unsigned((~&reg134))) : $signed($unsigned((8'ha3))));
      reg139 <= (({{((8'ha4) ? wire26 : wire26)}} ?
          (-(^~(!reg129))) : wire121) > $unsigned((^~wire26[(1'h1):(1'h0)])));
      reg140 <= $unsigned($unsigned((&wire8[(3'h6):(1'h0)])));
    end
  assign wire141 = (wire120[(3'h7):(2'h2)] ?
                       {$signed(wire8)} : ($unsigned($unsigned((8'ha3))) != reg125[(4'he):(4'hc)]));
  assign wire142 = $unsigned({(+(|(~reg135))),
                       ({$signed(wire24)} + $signed((!reg126)))});
  assign wire143 = (-(^~$unsigned(wire5)));
endmodule

module module28
#(parameter param115 = (&(((((8'ha3) | (8'ha2)) <= (8'hb2)) ~^ (((8'hb5) ^~ (8'ha1)) ? (&(8'ha2)) : ((8'ha8) >> (8'hbc)))) ? (+(^(8'hab))) : ((((8'ha1) ? (8'ha0) : (8'hba)) ? ((8'hb7) ? (7'h40) : (8'hbf)) : ((8'ha9) ? (7'h44) : (8'ha9))) ? {((8'h9c) ? (8'ha8) : (8'hb4)), (8'ha5)} : (((8'ha8) ? (8'hbf) : (8'hb1)) && ((8'hb0) || (8'h9d)))))), 
parameter param116 = ((^~{(!(+param115)), ({param115, param115} <<< (!(8'hbf)))}) >= (((param115 ? param115 : (param115 ? (8'hb6) : param115)) ? ((~|param115) ? {param115, param115} : param115) : ((param115 ? param115 : param115) ? (param115 ? param115 : param115) : (8'hb9))) && ((&(~|param115)) ? (~^(!param115)) : (~|(param115 ? param115 : param115))))))
(y, clk, wire32, wire31, wire30, wire29);
  output wire [(32'h11d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire32;
  input wire signed [(4'hb):(1'h0)] wire31;
  input wire [(5'h15):(1'h0)] wire30;
  input wire signed [(4'he):(1'h0)] wire29;
  wire [(5'h11):(1'h0)] wire61;
  wire [(5'h13):(1'h0)] wire45;
  wire [(5'h15):(1'h0)] wire41;
  wire [(5'h14):(1'h0)] wire34;
  wire [(5'h12):(1'h0)] wire33;
  wire signed [(4'he):(1'h0)] wire63;
  wire [(4'he):(1'h0)] wire64;
  wire signed [(3'h6):(1'h0)] wire65;
  wire [(4'ha):(1'h0)] wire66;
  wire [(5'h13):(1'h0)] wire113;
  reg signed [(5'h14):(1'h0)] reg44 = (1'h0);
  reg [(3'h7):(1'h0)] reg43 = (1'h0);
  reg signed [(4'he):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg37 = (1'h0);
  reg [(5'h10):(1'h0)] reg36 = (1'h0);
  reg [(5'h10):(1'h0)] reg35 = (1'h0);
  assign y = {wire61,
                 wire45,
                 wire41,
                 wire34,
                 wire33,
                 wire63,
                 wire64,
                 wire65,
                 wire66,
                 wire113,
                 reg44,
                 reg43,
                 reg42,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 (1'h0)};
  assign wire33 = (8'hb5);
  assign wire34 = $signed(wire30);
  always
    @(posedge clk) begin
      if ((+wire29))
        begin
          reg35 <= (($unsigned(wire31) ?
              $signed((wire29[(4'hc):(3'h4)] <= $unsigned(wire30))) : wire30[(4'h8):(1'h1)]) >= {wire32[(4'h8):(1'h1)],
              (|$unsigned(wire29))});
          reg36 <= wire32[(4'h8):(3'h5)];
        end
      else
        begin
          reg35 <= $signed($signed(wire34[(4'he):(4'hd)]));
        end
      reg37 <= $signed($signed((-wire29)));
      reg38 <= $signed($unsigned((|((!wire33) ^~ wire31))));
      reg39 <= ((reg37 >= $signed(((wire29 ? wire30 : reg35) ?
              (wire32 <= (8'hb8)) : (reg35 ~^ reg38)))) ?
          {($signed(wire32) ?
                  $unsigned(wire29[(1'h0):(1'h0)]) : ($unsigned(wire29) ?
                      reg36 : {wire34})),
              $unsigned((wire29 < {reg35, reg35}))} : ((reg37 ?
              $unsigned($signed(reg38)) : $unsigned($signed(wire34))) <= reg36[(1'h0):(1'h0)]));
      reg40 <= $signed($signed($unsigned(wire29[(2'h3):(2'h3)])));
    end
  assign wire41 = ($unsigned($unsigned($signed(wire30[(4'h9):(4'h9)]))) ?
                      reg36 : reg40);
  always
    @(posedge clk) begin
      reg42 <= $unsigned(reg40[(3'h4):(1'h1)]);
      reg43 <= {{$signed((8'ha5)), (-wire30)},
          ((8'hbf) ?
              ((~&reg37[(4'hb):(2'h3)]) ?
                  (~^(+reg40)) : (+reg39[(4'h8):(3'h6)])) : {((^(8'hb2)) ?
                      (wire34 << wire31) : (wire29 && reg40)),
                  $signed(wire31)})};
      reg44 <= (wire31[(1'h1):(1'h0)] > reg35[(4'ha):(3'h6)]);
    end
  assign wire45 = reg40;
  module46 #() modinst62 (wire61, clk, reg39, wire33, wire30, wire34, reg43);
  assign wire63 = ($signed(reg44) ? (^~reg37) : wire34);
  assign wire64 = wire61[(3'h5):(3'h5)];
  assign wire65 = ((~^((reg42 ? (reg43 ? wire41 : wire32) : (8'hb8)) ?
                          $signed(reg40) : $unsigned((!wire31)))) ?
                      (!{(~^reg35[(2'h3):(1'h1)])}) : $unsigned($unsigned((wire41 - {wire30}))));
  assign wire66 = reg39[(3'h6):(1'h1)];
  module67 #() modinst114 (wire113, clk, reg40, wire31, wire33, reg38, wire61);
endmodule

module module10  (y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'h81):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire14;
  input wire [(5'h13):(1'h0)] wire13;
  input wire signed [(4'he):(1'h0)] wire12;
  input wire signed [(3'h6):(1'h0)] wire11;
  wire [(4'h9):(1'h0)] wire19;
  wire [(4'hd):(1'h0)] wire18;
  wire [(5'h14):(1'h0)] wire17;
  wire signed [(4'hd):(1'h0)] wire16;
  wire signed [(4'hf):(1'h0)] wire15;
  reg signed [(5'h12):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg22 = (1'h0);
  reg [(4'hc):(1'h0)] reg21 = (1'h0);
  reg [(4'h9):(1'h0)] reg20 = (1'h0);
  assign y = {wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 (1'h0)};
  assign wire15 = (wire11[(3'h5):(2'h2)] != {(((wire11 ?
                              (8'ha7) : (8'hb4)) ^~ wire11[(3'h6):(3'h5)]) ?
                          (!wire14[(2'h2):(2'h2)]) : ($signed(wire13) >>> $unsigned(wire11))),
                      ((~(wire11 || wire14)) << ((wire13 + wire13) ?
                          ((8'hab) >= wire11) : $unsigned(wire11)))});
  assign wire16 = ($unsigned({(~^wire14[(4'ha):(3'h4)])}) ?
                      $unsigned(wire14) : ($unsigned(wire15) ?
                          wire11[(3'h5):(3'h5)] : $signed($unsigned((wire11 ?
                              wire13 : wire13)))));
  assign wire17 = $signed(({$unsigned(wire16),
                      wire14[(4'ha):(4'h8)]} && wire15[(1'h1):(1'h1)]));
  assign wire18 = (((($unsigned(wire17) ?
                              wire16[(4'hb):(3'h4)] : $unsigned(wire14)) ?
                          (~&(wire16 != wire13)) : $unsigned((wire14 ?
                              (8'ha0) : wire15))) ?
                      $unsigned(wire15[(3'h7):(2'h2)]) : ({wire15} <<< ((wire17 ?
                          (8'hbe) : wire16) ^ $unsigned(wire15)))) & (wire17 & wire13[(3'h5):(1'h0)]));
  assign wire19 = ((8'hb3) && ((wire18[(4'h9):(3'h7)] ? (8'hb4) : wire15) ?
                      {($signed(wire11) ?
                              (wire17 ? wire18 : wire14) : (wire14 ?
                                  (8'hac) : wire18)),
                          $signed((wire11 ?
                              wire17 : wire17))} : (&$signed((wire13 * wire13)))));
  always
    @(posedge clk) begin
      reg20 <= {wire15,
          ($unsigned((|(wire16 ?
              wire15 : wire19))) >> (wire11 <= wire16[(1'h1):(1'h1)]))};
    end
  always
    @(posedge clk) begin
      reg21 <= {$unsigned(($unsigned((reg20 ?
              wire17 : wire13)) == {$unsigned(wire15)})),
          ({(^$unsigned(wire12)), wire14[(4'h9):(2'h2)]} >= wire15)};
      reg22 <= {(wire18[(3'h4):(1'h1)] ?
              {wire14[(4'h9):(3'h5)]} : ((~(wire18 ? (8'hb3) : wire13)) ?
                  wire14 : wire11))};
      reg23 <= $unsigned(($unsigned(($unsigned(wire11) ?
              (wire14 * wire18) : (reg22 ? wire11 : wire16))) ?
          $signed($unsigned(wire16)) : $signed(wire15)));
    end
endmodule

module module67  (y, clk, wire72, wire71, wire70, wire69, wire68);
  output wire [(32'h1ec):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire72;
  input wire signed [(4'hb):(1'h0)] wire71;
  input wire signed [(3'h5):(1'h0)] wire70;
  input wire [(5'h14):(1'h0)] wire69;
  input wire [(5'h11):(1'h0)] wire68;
  wire signed [(4'h9):(1'h0)] wire98;
  wire signed [(5'h10):(1'h0)] wire97;
  wire [(3'h6):(1'h0)] wire92;
  wire signed [(4'hd):(1'h0)] wire91;
  wire signed [(5'h15):(1'h0)] wire90;
  wire [(3'h6):(1'h0)] wire87;
  wire signed [(3'h4):(1'h0)] wire86;
  wire [(5'h15):(1'h0)] wire85;
  wire signed [(4'he):(1'h0)] wire84;
  wire [(4'hf):(1'h0)] wire83;
  wire signed [(4'ha):(1'h0)] wire79;
  wire [(4'h8):(1'h0)] wire78;
  wire signed [(4'hd):(1'h0)] wire77;
  wire [(3'h5):(1'h0)] wire76;
  wire signed [(5'h15):(1'h0)] wire75;
  wire [(4'hc):(1'h0)] wire74;
  wire signed [(5'h10):(1'h0)] wire73;
  reg [(5'h13):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg111 = (1'h0);
  reg [(5'h11):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg109 = (1'h0);
  reg [(4'h9):(1'h0)] reg108 = (1'h0);
  reg [(3'h6):(1'h0)] reg107 = (1'h0);
  reg [(4'hf):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg105 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg104 = (1'h0);
  reg [(4'hd):(1'h0)] reg103 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg101 = (1'h0);
  reg [(3'h5):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg99 = (1'h0);
  reg [(5'h12):(1'h0)] reg96 = (1'h0);
  reg [(4'h9):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg94 = (1'h0);
  reg [(5'h10):(1'h0)] reg93 = (1'h0);
  reg [(5'h12):(1'h0)] reg89 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg82 = (1'h0);
  reg [(4'hc):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg80 = (1'h0);
  assign y = {wire98,
                 wire97,
                 wire92,
                 wire91,
                 wire90,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
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
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg89,
                 reg88,
                 reg82,
                 reg81,
                 reg80,
                 (1'h0)};
  assign wire73 = (wire68[(1'h1):(1'h0)] ^ $signed($signed($unsigned(wire72[(1'h0):(1'h0)]))));
  assign wire74 = $unsigned($signed(($signed((wire69 + wire73)) ?
                      $signed($unsigned(wire68)) : (+$signed(wire72)))));
  assign wire75 = (~|$unsigned($unsigned(wire68)));
  assign wire76 = wire68;
  assign wire77 = $signed($unsigned($unsigned(wire73)));
  assign wire78 = wire76[(3'h5):(1'h0)];
  assign wire79 = $signed(wire78);
  always
    @(posedge clk) begin
      reg80 <= $signed({(wire79[(4'h8):(3'h6)] ?
              wire78[(3'h4):(2'h2)] : (+(~|wire71)))});
      reg81 <= $signed((wire69[(5'h10):(4'ha)] == ($signed((wire69 * wire71)) ?
          ({wire79,
              reg80} - wire70[(2'h2):(1'h1)]) : ((8'hb7) == wire79[(4'h9):(3'h7)]))));
      reg82 <= $signed(reg80);
    end
  assign wire83 = ($signed(wire71) << (~$signed((~^(wire73 ?
                      wire69 : reg80)))));
  assign wire84 = (wire77[(4'ha):(2'h2)] ?
                      (7'h41) : (!{($unsigned(wire70) ?
                              (wire79 ? wire75 : (8'hbe)) : {wire72})}));
  assign wire85 = $unsigned({($unsigned($signed(wire72)) ?
                          wire75[(3'h6):(1'h1)] : ((wire74 > (8'hbd)) + $signed((7'h40)))),
                      (^$signed(((7'h44) >= wire77)))});
  assign wire86 = (-(wire71 ?
                      (((~|(8'hbb)) >= $signed(wire70)) ?
                          wire70[(3'h5):(3'h5)] : $unsigned(((8'hab) ?
                              wire70 : wire79))) : (~&(+(wire76 <<< wire70)))));
  assign wire87 = ({(8'hb8),
                      ($signed((^(8'hb8))) ?
                          reg82[(4'hd):(4'ha)] : $signed(wire84[(4'h8):(3'h4)]))} || $unsigned((~^{$signed(wire77)})));
  always
    @(posedge clk) begin
      reg88 <= $unsigned(wire72);
      reg89 <= reg88[(1'h0):(1'h0)];
    end
  assign wire90 = (|(^~(wire77 - ((reg89 ? reg80 : reg88) ?
                      reg82 : $signed(wire83)))));
  assign wire91 = (8'ha3);
  assign wire92 = (((({wire70} ? (|reg81) : wire73) * ((wire83 ?
                          wire76 : (8'hb9)) ?
                      (+wire68) : {wire78})) >> wire90) <<< reg80);
  always
    @(posedge clk) begin
      reg93 <= (~^(wire72[(2'h3):(2'h2)] ^~ reg82));
      reg94 <= $signed({({((8'hbe) | wire79)} ?
              (~|(~|wire85)) : $unsigned((+reg81))),
          (reg89[(4'hc):(4'hc)] ?
              $unsigned($unsigned((8'ha5))) : $unsigned((|(8'haf))))});
      reg95 <= ($signed($unsigned(((8'hab) <= (^wire76)))) ?
          wire79 : ((({(8'hb9)} <= $unsigned(reg94)) ?
              (|(wire85 ? wire87 : (8'h9f))) : $signed((wire72 ?
                  wire86 : wire72))) + reg93[(4'h9):(1'h0)]));
      reg96 <= ($signed((wire73[(3'h7):(2'h3)] ?
              $signed(wire74[(2'h3):(2'h2)]) : $unsigned($signed((7'h40))))) ?
          (reg82 <<< (reg88 ? {$signed((8'haf))} : (~&reg95))) : ({(&(wire84 ?
                      wire73 : (8'hb5))),
                  $unsigned((!(8'hab)))} ?
              $signed($signed((wire92 ^ reg94))) : $unsigned(({(8'ha9)} ?
                  $unsigned(wire73) : reg93[(3'h5):(2'h3)]))));
    end
  assign wire97 = (reg93[(3'h7):(3'h4)] ?
                      ({(+(wire83 >> reg80)), $signed($signed(reg89))} ?
                          wire86 : (((~reg80) ? reg96 : (wire90 & reg93)) ?
                              (8'ha3) : {reg96})) : $unsigned(($unsigned((wire91 ?
                          wire71 : wire74)) ~^ (+(reg89 ? (8'ha4) : reg89)))));
  assign wire98 = (8'h9d);
  always
    @(posedge clk) begin
      if (reg95)
        begin
          if (wire85)
            begin
              reg99 <= (($signed(wire77[(4'h9):(4'h8)]) ?
                  (!(~&$unsigned(reg95))) : (8'hb1)) || (~|wire73));
            end
          else
            begin
              reg99 <= wire85[(5'h15):(2'h3)];
              reg100 <= (^(8'hbe));
              reg101 <= reg96[(4'hb):(4'h8)];
            end
        end
      else
        begin
          reg99 <= $signed($unsigned(wire68[(5'h11):(4'hc)]));
        end
      if (wire73)
        begin
          reg102 <= (-({wire85} >= reg101));
        end
      else
        begin
          reg102 <= ((^~{reg93}) + $signed((-((wire76 ^~ reg102) > {reg99}))));
          reg103 <= {wire74};
          if ((^~(~^(reg81 & wire70[(3'h4):(3'h4)]))))
            begin
              reg104 <= $signed(wire76);
              reg105 <= ({{{wire98, $signed(reg96)}}} <= ((((wire72 ?
                      reg88 : reg100) > ((8'h9c) ?
                      reg95 : wire87)) ^~ $unsigned($unsigned(wire97))) ?
                  reg88[(2'h2):(2'h2)] : (($unsigned(reg100) < $unsigned(wire90)) ?
                      {(wire97 || reg100)} : reg80[(4'h9):(4'h8)])));
              reg106 <= (~|reg96);
            end
          else
            begin
              reg104 <= ({wire97,
                  $unsigned($unsigned({wire92, wire72}))} & (!(7'h42)));
              reg105 <= $unsigned(wire71);
              reg106 <= (((wire68 ?
                      (!((8'hbc) || reg102)) : $unsigned((reg82 ?
                          reg81 : reg99))) <= reg81) ?
                  $signed((($unsigned(reg101) ?
                      ((8'h9c) ?
                          (7'h42) : wire97) : (wire84 >> (7'h42))) & ({wire78} ?
                      reg104 : $unsigned(wire91)))) : $unsigned($unsigned((-wire74))));
              reg107 <= {(^$unsigned((^~(|wire91)))), (wire91 >>> wire85)};
            end
          reg108 <= {reg89[(1'h1):(1'h0)]};
          reg109 <= (~^$unsigned((&({(8'hbc)} <= {wire75}))));
        end
      reg110 <= reg89[(3'h7):(2'h3)];
      reg111 <= $unsigned((^{($unsigned(wire92) ?
              $unsigned(wire84) : $signed(wire79)),
          $signed(reg104)}));
      reg112 <= wire90[(4'he):(1'h0)];
    end
endmodule

module module46  (y, clk, wire51, wire50, wire49, wire48, wire47);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire51;
  input wire signed [(5'h12):(1'h0)] wire50;
  input wire [(5'h15):(1'h0)] wire49;
  input wire signed [(3'h7):(1'h0)] wire48;
  input wire [(3'h7):(1'h0)] wire47;
  wire [(2'h3):(1'h0)] wire59;
  wire signed [(4'h8):(1'h0)] wire58;
  wire [(4'hf):(1'h0)] wire57;
  wire [(4'hd):(1'h0)] wire56;
  wire [(4'hd):(1'h0)] wire55;
  wire [(4'hc):(1'h0)] wire54;
  wire [(3'h5):(1'h0)] wire53;
  wire signed [(4'hf):(1'h0)] wire52;
  reg [(5'h13):(1'h0)] reg60 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 reg60,
                 (1'h0)};
  assign wire52 = $signed({wire51[(3'h5):(3'h4)]});
  assign wire53 = $unsigned($unsigned($signed(($signed((8'haf)) ?
                      $signed((8'h9f)) : (wire47 == wire48)))));
  assign wire54 = $signed(wire51);
  assign wire55 = wire49;
  assign wire56 = {(~&$signed($unsigned(wire50))), (&wire51)};
  assign wire57 = (wire53 ? wire53[(2'h2):(2'h2)] : (wire53 - wire51));
  assign wire58 = wire53;
  assign wire59 = (8'ha7);
  always
    @(posedge clk) begin
      reg60 <= wire49[(4'hb):(1'h0)];
    end
endmodule
