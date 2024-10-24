module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h87):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire0;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire3;
  wire [(4'hf):(1'h0)] wire214;
  wire [(5'h15):(1'h0)] wire4;
  wire [(5'h13):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire23;
  wire signed [(4'hb):(1'h0)] wire25;
  wire signed [(3'h6):(1'h0)] wire30;
  wire signed [(3'h4):(1'h0)] wire93;
  reg [(4'hd):(1'h0)] reg29 = (1'h0);
  reg [(4'hb):(1'h0)] reg28 = (1'h0);
  reg [(4'hd):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg26 = (1'h0);
  assign y = {wire214,
                 wire4,
                 wire5,
                 wire23,
                 wire25,
                 wire30,
                 wire93,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 (1'h0)};
  assign wire4 = wire1;
  assign wire5 = (~&$unsigned($unsigned(wire1[(2'h3):(1'h0)])));
  module6 #() modinst24 (wire23, clk, wire2, wire0, wire4, wire3);
  assign wire25 = (wire23 ^ ($unsigned(wire1) ?
                      (~|{(wire5 ?
                              wire2 : wire2)}) : (($unsigned((8'hb0)) >> $unsigned(wire3)) ~^ $unsigned($signed(wire0)))));
  always
    @(posedge clk) begin
      reg26 <= (8'ha6);
      reg27 <= (wire25[(3'h5):(3'h5)] == ({$unsigned($unsigned((8'hbb)))} ?
          $unsigned(wire4[(3'h7):(3'h6)]) : ((wire3 ?
              (8'hac) : reg26) & (wire5[(2'h3):(1'h0)] << (~^(8'h9c))))));
      reg28 <= ($unsigned($unsigned($signed((~(8'hb3))))) * $signed({(^~wire4[(4'hb):(2'h2)]),
          $signed((&wire23))}));
      reg29 <= $signed(((($signed(wire1) ?
              (^~reg26) : ((8'ha5) ? wire0 : wire25)) ?
          $signed($unsigned(wire1)) : wire25) >= (wire0[(4'h9):(4'h8)] >> reg26)));
    end
  assign wire30 = $unsigned((wire23[(2'h2):(1'h1)] ?
                      $unsigned(($unsigned(wire1) & (wire25 ?
                          wire4 : wire5))) : $signed(($signed(reg27) & wire0[(3'h7):(3'h4)]))));
  module31 #() modinst94 (.wire32(reg28), .y(wire93), .wire35(wire4), .wire34(reg27), .clk(clk), .wire33(reg26));
  module95 #() modinst215 (wire214, clk, wire25, wire0, reg29, wire5, wire30);
endmodule

module module95
#(parameter param213 = (^((((~^(8'ha1)) >= ((8'hbd) ? (8'ha2) : (8'ha8))) > {(~&(8'hab)), (8'ha0)}) ? (+(8'hba)) : (~&((|(7'h40)) * {(8'had), (8'ha1)})))))
(y, clk, wire96, wire97, wire98, wire99, wire100);
  output wire [(32'h19d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire96;
  input wire [(3'h4):(1'h0)] wire97;
  input wire signed [(3'h7):(1'h0)] wire98;
  input wire [(5'h13):(1'h0)] wire99;
  input wire signed [(3'h6):(1'h0)] wire100;
  wire signed [(4'h8):(1'h0)] wire106;
  wire signed [(3'h7):(1'h0)] wire107;
  wire [(4'hd):(1'h0)] wire108;
  wire signed [(5'h15):(1'h0)] wire129;
  wire [(5'h14):(1'h0)] wire130;
  wire [(4'h9):(1'h0)] wire131;
  wire signed [(2'h3):(1'h0)] wire132;
  wire [(5'h12):(1'h0)] wire133;
  wire signed [(5'h13):(1'h0)] wire211;
  reg [(3'h7):(1'h0)] reg101 = (1'h0);
  reg [(3'h6):(1'h0)] reg102 = (1'h0);
  reg [(4'hd):(1'h0)] reg103 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg104 = (1'h0);
  reg [(4'hb):(1'h0)] reg105 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg110 = (1'h0);
  reg [(5'h14):(1'h0)] reg111 = (1'h0);
  reg signed [(4'he):(1'h0)] reg112 = (1'h0);
  reg [(4'hd):(1'h0)] reg113 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg114 = (1'h0);
  reg [(3'h7):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg116 = (1'h0);
  reg [(3'h6):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg119 = (1'h0);
  reg [(5'h13):(1'h0)] reg120 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg122 = (1'h0);
  reg [(5'h12):(1'h0)] reg123 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg124 = (1'h0);
  reg [(4'hc):(1'h0)] reg125 = (1'h0);
  reg signed [(4'he):(1'h0)] reg126 = (1'h0);
  reg [(4'hc):(1'h0)] reg127 = (1'h0);
  reg [(5'h11):(1'h0)] reg128 = (1'h0);
  assign y = {wire106,
                 wire107,
                 wire108,
                 wire129,
                 wire130,
                 wire131,
                 wire132,
                 wire133,
                 wire211,
                 reg101,
                 reg102,
                 reg103,
                 reg104,
                 reg105,
                 reg109,
                 reg110,
                 reg111,
                 reg112,
                 reg113,
                 reg114,
                 reg115,
                 reg116,
                 reg117,
                 reg118,
                 reg119,
                 reg120,
                 reg121,
                 reg122,
                 reg123,
                 reg124,
                 reg125,
                 reg126,
                 reg127,
                 reg128,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg101 <= $signed((!(wire97 || wire98[(3'h4):(1'h0)])));
      reg102 <= reg101;
      reg103 <= (wire96 >> wire96[(1'h0):(1'h0)]);
      reg104 <= ((|$unsigned($signed(wire99[(4'hd):(2'h3)]))) | reg101[(1'h1):(1'h1)]);
      reg105 <= reg102[(2'h2):(1'h0)];
    end
  assign wire106 = wire97;
  assign wire107 = ({reg105} ?
                       ($signed($unsigned((^wire97))) ?
                           wire99 : reg103) : wire99);
  assign wire108 = (^~($signed(({reg105, wire98} ?
                       wire96[(4'hb):(3'h7)] : $signed(wire107))) + (((8'hab) + ((8'haa) ?
                           wire97 : wire106)) ?
                       $unsigned(((8'hb1) < wire100)) : wire106[(3'h4):(2'h3)])));
  always
    @(posedge clk) begin
      reg109 <= ((($signed((^reg101)) ?
              ({(8'h9f),
                  wire97} >>> reg101) : (^$unsigned(reg102))) ^~ $unsigned((wire107[(3'h5):(2'h3)] * wire96[(3'h5):(1'h1)]))) ?
          $unsigned(wire98[(3'h5):(3'h5)]) : reg101);
      reg110 <= wire97;
      if ((~|$signed({$signed($unsigned(reg109)), (~reg101[(2'h2):(1'h0)])})))
        begin
          reg111 <= ({$signed((+reg109[(4'h8):(3'h6)]))} < $unsigned({(((8'hb6) ?
                  wire107 : wire100) << (reg109 ? (8'haa) : reg105)),
              reg103}));
          if ($unsigned(reg103))
            begin
              reg112 <= $unsigned((((~$signed(wire97)) ?
                  reg103[(1'h0):(1'h0)] : (reg111 ?
                      ((7'h42) & wire107) : (reg103 ^ wire108))) & $signed((8'ha0))));
              reg113 <= $unsigned(wire100[(3'h4):(2'h2)]);
              reg114 <= wire99[(4'h9):(1'h0)];
            end
          else
            begin
              reg112 <= wire107;
              reg113 <= (((((reg110 ?
                  reg105 : reg103) && {wire98}) | reg102) == reg101) ^ $signed(((^reg114[(2'h2):(1'h0)]) != $signed(reg112[(4'hd):(4'h9)]))));
              reg114 <= {reg104[(2'h2):(1'h1)],
                  (!$signed((~&wire108[(4'hc):(4'hb)])))};
            end
          reg115 <= $unsigned((~^((+{wire97}) ?
              $signed((wire108 < reg101)) : (+reg104[(4'h8):(3'h5)]))));
        end
      else
        begin
          reg111 <= reg101;
          reg112 <= {(8'ha4)};
          if ((~^(&(8'hba))))
            begin
              reg113 <= reg103;
              reg114 <= wire108;
              reg115 <= ($unsigned(($unsigned(reg111) | (((8'h9f) ?
                          wire106 : reg101) ?
                      wire108[(1'h1):(1'h0)] : $signed(reg104)))) ?
                  (8'h9c) : (reg103 ?
                      (^~(~^(wire97 <<< (8'hb8)))) : wire100[(3'h6):(3'h5)]));
              reg116 <= $unsigned(((^wire106[(3'h7):(3'h7)]) - {reg109[(1'h1):(1'h1)],
                  (8'h9d)}));
            end
          else
            begin
              reg113 <= {$signed((~|$unsigned(((8'ha0) ? wire100 : wire107)))),
                  $unsigned((^{(&reg105), (reg110 >= reg112)}))};
              reg114 <= ($signed((~^reg111)) ?
                  wire107[(1'h1):(1'h0)] : $unsigned((reg115 ~^ ($unsigned(wire99) ?
                      (^~reg115) : {wire99}))));
              reg115 <= ((wire108 ?
                  $signed($unsigned((wire99 ?
                      reg115 : (8'hb2)))) : $signed((~^wire107[(1'h1):(1'h1)]))) | wire96[(4'h9):(1'h0)]);
              reg116 <= reg105[(4'h8):(1'h0)];
            end
          reg117 <= (((!wire108) ? wire107 : reg115) ?
              wire96[(3'h7):(1'h1)] : $unsigned($unsigned(((~&reg116) + (&wire100)))));
          reg118 <= ($signed(wire106[(1'h1):(1'h0)]) ?
              (^wire100[(3'h4):(2'h2)]) : (|(^((wire107 ? (8'hbb) : reg109) ?
                  (wire98 << wire99) : reg105))));
        end
      reg119 <= wire108[(3'h6):(3'h5)];
    end
  always
    @(posedge clk) begin
      if ($unsigned(reg112))
        begin
          reg120 <= ($signed(((reg118[(2'h3):(2'h3)] ? (&reg116) : (~&reg109)) ?
                  (+reg115[(1'h1):(1'h0)]) : reg114)) ?
              wire106[(3'h7):(3'h6)] : (7'h44));
          reg121 <= (reg111 ?
              (+$signed({(wire107 ? reg112 : wire106)})) : wire96);
          reg122 <= reg115;
          reg123 <= reg112[(1'h0):(1'h0)];
          if ((~|wire106[(3'h6):(3'h6)]))
            begin
              reg124 <= ($signed(reg112[(2'h2):(2'h2)]) ?
                  (reg122[(2'h3):(2'h3)] >> $unsigned($signed($signed(wire99)))) : ((((reg110 ?
                      (8'had) : reg122) > reg105) ^ {(-reg101),
                      reg116}) >>> (|reg104)));
              reg125 <= (7'h40);
            end
          else
            begin
              reg124 <= reg102[(3'h5):(2'h3)];
              reg125 <= ((!$signed(wire107[(2'h2):(1'h1)])) - (-$signed(reg113)));
              reg126 <= {wire100};
            end
        end
      else
        begin
          reg120 <= $signed({reg114,
              {($unsigned(reg113) ? (!reg104) : $unsigned((8'hba)))}});
          reg121 <= $signed($unsigned(reg103[(4'hb):(3'h4)]));
        end
      reg127 <= $signed(reg105[(2'h2):(1'h1)]);
      reg128 <= (8'h9c);
    end
  assign wire129 = $unsigned({((|(~|(8'hbf))) ?
                           $unsigned({(8'ha9)}) : $signed((reg124 ^~ reg127)))});
  assign wire130 = ((reg120[(4'hd):(4'ha)] ?
                       {($signed(reg121) ?
                               reg115 : $signed(reg119))} : ((8'ha6) * wire97)) <<< reg115);
  assign wire131 = {{((~wire100) ~^ $unsigned($signed(wire97)))}};
  assign wire132 = reg104;
  assign wire133 = (reg104 <= ((reg117[(3'h4):(1'h0)] + (-$signed(wire129))) ?
                       $unsigned({(wire130 ?
                               reg117 : reg113)}) : {wire108[(4'ha):(4'h9)],
                           $unsigned((^wire130))}));
  module134 #() modinst212 (.wire136(reg101), .wire135(reg122), .wire137(wire133), .y(wire211), .wire138(reg117), .clk(clk));
endmodule

module module31
#(parameter param91 = ((-((~^((8'ha2) << (8'h9f))) & (~|{(8'hbf)}))) == {((~|{(7'h43)}) ? ((8'hb7) | ((8'hb9) >> (7'h43))) : ({(8'hbb)} ? ((8'hb6) >>> (8'hb1)) : (+(8'ha2))))}), 
parameter param92 = (((param91 ? (+param91) : (^(param91 ? param91 : param91))) <<< ((^{param91, param91}) ? (~((8'h9d) != param91)) : ((param91 >> (8'hb4)) ? ((8'hb1) ? (8'hb4) : param91) : ((8'ha2) ? param91 : param91)))) ? {{param91}} : ({((param91 - param91) || param91)} ? (((param91 | param91) >= param91) ? (8'ha4) : (~&(param91 ? param91 : param91))) : param91)))
(y, clk, wire32, wire33, wire34, wire35);
  output wire [(32'hc5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire32;
  input wire [(3'h4):(1'h0)] wire33;
  input wire [(4'hd):(1'h0)] wire34;
  input wire signed [(2'h3):(1'h0)] wire35;
  wire [(5'h10):(1'h0)] wire90;
  wire [(4'hb):(1'h0)] wire89;
  wire [(3'h4):(1'h0)] wire88;
  wire signed [(5'h11):(1'h0)] wire45;
  wire signed [(5'h14):(1'h0)] wire47;
  wire [(3'h5):(1'h0)] wire48;
  wire [(4'hb):(1'h0)] wire49;
  wire signed [(3'h4):(1'h0)] wire86;
  reg signed [(2'h3):(1'h0)] reg36 = (1'h0);
  reg [(4'he):(1'h0)] reg37 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg38 = (1'h0);
  reg [(4'hb):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg40 = (1'h0);
  reg [(4'h8):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg43 = (1'h0);
  reg [(4'h9):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg46 = (1'h0);
  assign y = {wire90,
                 wire89,
                 wire88,
                 wire45,
                 wire47,
                 wire48,
                 wire49,
                 wire86,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg46,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg36 <= $unsigned((8'hb1));
      reg37 <= (~|{(|wire32[(3'h4):(1'h1)]), wire33});
      reg38 <= (~((~^$unsigned($signed(wire32))) || ((~$unsigned(wire35)) | $unsigned((^~reg37)))));
      if ((reg38 ?
          (wire34[(4'ha):(2'h3)] ?
              reg38[(4'h9):(3'h4)] : (((wire32 != wire35) ^~ wire33) ?
                  (^~$signed(reg37)) : {$unsigned((8'hab))})) : $unsigned(reg38[(1'h0):(1'h0)])))
        begin
          reg39 <= reg38;
          reg40 <= $signed($unsigned(wire33[(1'h1):(1'h1)]));
          reg41 <= $signed({reg36[(2'h3):(2'h2)],
              (wire33 ? reg39[(4'h9):(1'h1)] : reg37)});
        end
      else
        begin
          if ({($signed($unsigned((reg38 ^ reg37))) ?
                  $signed((|$signed((8'hb2)))) : wire33[(1'h0):(1'h0)])})
            begin
              reg39 <= ((~{((^wire35) ? (8'hb3) : reg39[(2'h2):(2'h2)]),
                  (~|wire35)}) - reg39);
            end
          else
            begin
              reg39 <= {reg36[(2'h2):(1'h0)]};
              reg40 <= ((wire35[(2'h2):(1'h1)] >>> $signed((^~$signed(reg40)))) >> {$signed((((8'hb9) == reg40) || ((7'h43) <= reg40)))});
              reg41 <= {$signed({(~$signed(reg36)), wire32[(2'h3):(2'h2)]}),
                  $signed(reg41[(2'h3):(2'h3)])};
              reg42 <= $unsigned((-wire32));
            end
          reg43 <= $unsigned(reg40[(4'he):(4'hd)]);
          reg44 <= reg43[(5'h11):(4'h9)];
        end
    end
  assign wire45 = ((^reg44) != (~&(~&$unsigned(reg39[(1'h1):(1'h0)]))));
  always
    @(posedge clk) begin
      reg46 <= (8'ha5);
    end
  assign wire47 = $signed((|reg44));
  assign wire48 = reg39;
  assign wire49 = wire45[(4'hd):(1'h1)];
  module50 #() modinst87 (wire86, clk, wire45, wire47, reg40, wire34);
  assign wire88 = (reg41[(3'h6):(3'h4)] ?
                      (|wire35[(1'h0):(1'h0)]) : $unsigned(reg36[(1'h0):(1'h0)]));
  assign wire89 = ($unsigned({reg43[(4'h9):(3'h4)],
                      ((+wire49) ?
                          {wire47} : $unsigned((7'h42)))}) ^~ $signed(wire86[(1'h1):(1'h1)]));
  assign wire90 = $signed(($signed($signed(reg42[(3'h6):(1'h1)])) != (!(wire86[(2'h2):(1'h1)] ?
                      (-wire34) : (~reg40)))));
endmodule

module module6
#(parameter param21 = ({((((8'hb3) ? (8'ha8) : (8'ha6)) - {(8'ha4)}) ? ((~&(8'h9d)) && ((8'ha9) ? (8'h9c) : (8'haa))) : (((8'hb7) ~^ (8'h9c)) > ((7'h41) ? (8'hba) : (8'hb9))))} ? (({(~&(7'h40)), ((8'hb1) ? (8'hb4) : (8'ha4))} || {((8'hb4) > (8'hb4))}) & {{((8'hab) < (8'ha1)), ((8'ha9) >>> (8'ha4))}}) : (~^({{(8'hab)}} || (((8'hb5) != (8'hbe)) ? (-(8'hb0)) : ((8'hbe) << (8'ha8)))))), 
parameter param22 = ((&(param21 ~^ {(&param21), (param21 ? param21 : param21)})) ? (param21 != param21) : (+param21)))
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h5f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire10;
  input wire [(4'hf):(1'h0)] wire9;
  input wire signed [(5'h15):(1'h0)] wire8;
  input wire signed [(4'h9):(1'h0)] wire7;
  wire signed [(2'h2):(1'h0)] wire20;
  wire [(4'hd):(1'h0)] wire19;
  wire [(4'h8):(1'h0)] wire18;
  wire [(5'h13):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire16;
  reg signed [(2'h2):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg11 = (1'h0);
  assign y = {wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg11 <= wire9[(4'hb):(3'h7)];
      reg12 <= wire7[(4'h8):(3'h6)];
      reg13 <= $unsigned($unsigned(wire7));
      reg14 <= wire10;
      reg15 <= reg11;
    end
  assign wire16 = ($signed(wire9[(3'h5):(3'h4)]) <<< (-reg13[(4'h8):(3'h5)]));
  assign wire17 = wire7;
  assign wire18 = (!({wire7[(4'h8):(2'h2)], wire9[(3'h4):(2'h2)]} ?
                      {wire16, (-(|reg11))} : ((^(wire16 ? (8'hb8) : reg15)) ?
                          (((7'h40) ? wire17 : reg13) & {wire9}) : {reg13,
                              reg12[(3'h6):(1'h0)]})));
  assign wire19 = $signed($signed(wire18));
  assign wire20 = (~reg13);
endmodule

module module50  (y, clk, wire54, wire53, wire52, wire51);
  output wire [(32'h148):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire54;
  input wire signed [(5'h14):(1'h0)] wire53;
  input wire [(4'hb):(1'h0)] wire52;
  input wire signed [(3'h7):(1'h0)] wire51;
  wire [(4'hb):(1'h0)] wire85;
  wire [(4'hc):(1'h0)] wire84;
  wire [(5'h15):(1'h0)] wire75;
  wire [(4'h9):(1'h0)] wire74;
  wire signed [(2'h2):(1'h0)] wire73;
  wire signed [(2'h3):(1'h0)] wire59;
  wire signed [(2'h2):(1'h0)] wire58;
  wire signed [(5'h10):(1'h0)] wire57;
  wire signed [(2'h2):(1'h0)] wire56;
  wire signed [(3'h4):(1'h0)] wire55;
  reg [(5'h11):(1'h0)] reg83 = (1'h0);
  reg [(4'h8):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg81 = (1'h0);
  reg [(2'h3):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg79 = (1'h0);
  reg [(5'h12):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg77 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg72 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg71 = (1'h0);
  reg [(4'hb):(1'h0)] reg70 = (1'h0);
  reg [(4'ha):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg68 = (1'h0);
  reg [(4'he):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg63 = (1'h0);
  reg [(3'h4):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg60 = (1'h0);
  assign y = {wire85,
                 wire84,
                 wire75,
                 wire74,
                 wire73,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg72,
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
                 (1'h0)};
  assign wire55 = {((($signed(wire54) * (wire54 ? (8'hab) : wire53)) ?
                              wire51[(2'h2):(2'h2)] : $signed((^~wire53))) ?
                          $unsigned((~&wire52)) : $unsigned((wire52[(3'h4):(1'h0)] ?
                              {wire53, (8'hbb)} : (wire54 & wire53))))};
  assign wire56 = $unsigned($unsigned(wire51));
  assign wire57 = $signed(wire53[(5'h12):(4'h8)]);
  assign wire58 = $signed($signed($signed((wire54 << wire53[(5'h10):(4'hc)]))));
  assign wire59 = $signed($signed($signed(wire55[(2'h2):(1'h0)])));
  always
    @(posedge clk) begin
      reg60 <= (wire55 ?
          wire54 : ($unsigned({(wire58 ? wire55 : wire59)}) == wire55));
      reg61 <= (!(wire51[(3'h4):(1'h1)] || wire56));
      reg62 <= $signed(wire58);
      if ({wire58[(1'h1):(1'h1)], $unsigned($signed($signed($signed(wire58))))})
        begin
          if ($unsigned((($unsigned((wire52 ?
                  (8'h9d) : wire53)) >= (reg61[(5'h10):(5'h10)] ?
                  (wire55 ? reg61 : reg61) : (+wire52))) ?
              (~^((reg62 || wire57) || reg62[(1'h1):(1'h1)])) : wire57[(1'h0):(1'h0)])))
            begin
              reg63 <= wire57[(4'h8):(1'h1)];
              reg64 <= (~reg60);
              reg65 <= ((!wire51[(3'h7):(3'h7)]) != (|reg60));
              reg66 <= wire59;
            end
          else
            begin
              reg63 <= $unsigned((reg60[(4'hd):(4'hd)] ?
                  reg66[(2'h3):(1'h1)] : {$unsigned((8'hb3)),
                      $unsigned($signed(wire56))}));
              reg64 <= (~|(~^wire52));
              reg65 <= reg62;
              reg66 <= $unsigned(reg64);
              reg67 <= wire57;
            end
          if (reg61[(2'h2):(2'h2)])
            begin
              reg68 <= $unsigned(($signed(((~reg62) << $signed(reg67))) <= {({reg61,
                          reg67} ?
                      (wire51 > wire51) : (7'h40)),
                  (~(~&wire58))}));
              reg69 <= $unsigned(wire56[(1'h1):(1'h0)]);
              reg70 <= wire52;
              reg71 <= (reg61[(1'h1):(1'h0)] <<< (~^(!((reg61 ^~ wire54) || wire54))));
            end
          else
            begin
              reg68 <= $signed({reg66[(1'h0):(1'h0)]});
              reg69 <= $signed((|reg63));
              reg70 <= (wire55 ^~ $unsigned($unsigned((reg71 ?
                  $unsigned(reg65) : reg66))));
              reg71 <= $unsigned(($signed(($unsigned(wire55) <<< $unsigned((8'ha9)))) == reg71[(2'h2):(2'h2)]));
            end
        end
      else
        begin
          reg63 <= (^~{{$signed(reg62[(2'h2):(1'h1)]), (^~reg60)},
              $unsigned(((!wire57) ? (reg65 >= wire57) : wire52))});
          reg64 <= {{{$unsigned(wire51[(3'h5):(1'h1)]), (|$unsigned(wire53))},
                  (reg69[(1'h0):(1'h0)] ?
                      ((!reg60) != $signed((8'hb7))) : (wire57[(4'hd):(2'h3)] ^ (&reg63)))}};
          if (wire53)
            begin
              reg65 <= $signed({($unsigned($unsigned(reg63)) <= (&{wire57}))});
              reg66 <= (~$signed($signed($signed($signed(reg60)))));
              reg67 <= reg71;
            end
          else
            begin
              reg65 <= (^(((reg61[(3'h5):(3'h5)] ?
                      {wire53} : reg61[(5'h13):(3'h6)]) ?
                  {$signed(wire54)} : ((reg62 ? reg67 : reg61) - (reg70 ?
                      reg66 : reg62))) <= wire52));
            end
          reg68 <= (+(8'hbe));
        end
      reg72 <= $unsigned(wire52);
    end
  assign wire73 = wire55[(2'h3):(1'h1)];
  assign wire74 = $unsigned(($unsigned({(reg65 << reg67)}) ?
                      ($unsigned(reg66[(3'h6):(3'h6)]) < $signed($unsigned(reg64))) : (($signed(reg71) ?
                              (^~reg65) : (reg72 >= wire56)) ?
                          reg65[(1'h0):(1'h0)] : $unsigned(reg65))));
  assign wire75 = ($signed((^~(~&{wire57}))) ?
                      $unsigned((+(^(&reg62)))) : ($signed(($unsigned(reg69) < (wire56 ?
                              wire73 : wire59))) ?
                          $unsigned((7'h44)) : $unsigned(reg65[(2'h3):(1'h1)])));
  always
    @(posedge clk) begin
      reg76 <= reg68;
    end
  always
    @(posedge clk) begin
      reg77 <= ($signed($unsigned($unsigned((wire73 >>> reg61)))) ?
          $unsigned({reg68}) : (reg64[(2'h3):(1'h1)] << {$signed(wire51[(1'h0):(1'h0)]),
              {((8'ha1) ? reg64 : reg64), {reg62}}}));
      reg78 <= ((~|(reg64 ? wire56[(1'h1):(1'h0)] : $signed(wire74))) ?
          $signed(reg70) : $signed($signed({wire59, wire75[(5'h13):(1'h1)]})));
      reg79 <= wire55;
      if ((+{{reg63[(1'h0):(1'h0)], $signed($unsigned((7'h42)))},
          (wire74[(3'h6):(2'h3)] | wire74)}))
        begin
          reg80 <= $unsigned(wire58);
          reg81 <= $unsigned(((!($signed(reg79) ?
              (reg63 ? wire73 : (8'hb0)) : (!wire59))) == wire52));
          reg82 <= $unsigned(reg70);
          reg83 <= wire73;
        end
      else
        begin
          reg80 <= (8'hb0);
          reg81 <= wire59;
          reg82 <= reg62;
        end
    end
  assign wire84 = $signed(reg60);
  assign wire85 = $unsigned(({{$unsigned(wire54)}} >= $signed((reg78 ?
                      $unsigned(reg68) : (wire56 && reg78)))));
endmodule

module module134
#(parameter param210 = (|((!(((8'h9c) >> (8'ha4)) >> (&(7'h44)))) != ((((8'hb2) <= (8'ha1)) ? ((8'hae) ? (8'hb4) : (8'hbb)) : ((8'hbc) | (8'hb2))) ^~ {(~^(8'hb8)), {(8'hbd)}}))))
(y, clk, wire138, wire137, wire136, wire135);
  output wire [(32'h338):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire138;
  input wire signed [(4'he):(1'h0)] wire137;
  input wire signed [(3'h7):(1'h0)] wire136;
  input wire [(4'hd):(1'h0)] wire135;
  wire signed [(2'h2):(1'h0)] wire209;
  wire signed [(4'he):(1'h0)] wire208;
  wire signed [(2'h3):(1'h0)] wire204;
  wire [(4'h9):(1'h0)] wire176;
  wire [(5'h15):(1'h0)] wire175;
  wire signed [(5'h13):(1'h0)] wire174;
  wire [(2'h3):(1'h0)] wire173;
  wire signed [(4'h9):(1'h0)] wire172;
  wire signed [(5'h12):(1'h0)] wire171;
  wire signed [(3'h4):(1'h0)] wire169;
  wire [(5'h12):(1'h0)] wire168;
  wire [(5'h13):(1'h0)] wire167;
  wire [(3'h7):(1'h0)] wire166;
  wire signed [(2'h2):(1'h0)] wire165;
  wire [(4'hc):(1'h0)] wire152;
  wire signed [(5'h13):(1'h0)] wire151;
  wire [(4'hf):(1'h0)] wire150;
  reg signed [(4'hf):(1'h0)] reg207 = (1'h0);
  reg [(5'h14):(1'h0)] reg206 = (1'h0);
  reg [(4'he):(1'h0)] reg205 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg203 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg202 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg201 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg200 = (1'h0);
  reg [(4'h8):(1'h0)] reg199 = (1'h0);
  reg [(5'h14):(1'h0)] reg198 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg197 = (1'h0);
  reg [(4'h9):(1'h0)] reg196 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg195 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg194 = (1'h0);
  reg [(2'h2):(1'h0)] reg193 = (1'h0);
  reg [(5'h13):(1'h0)] reg192 = (1'h0);
  reg [(2'h2):(1'h0)] reg191 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg190 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg189 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg188 = (1'h0);
  reg [(3'h7):(1'h0)] reg187 = (1'h0);
  reg [(4'hc):(1'h0)] reg186 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg185 = (1'h0);
  reg [(3'h4):(1'h0)] reg184 = (1'h0);
  reg [(5'h10):(1'h0)] reg183 = (1'h0);
  reg [(5'h11):(1'h0)] reg182 = (1'h0);
  reg [(5'h15):(1'h0)] reg181 = (1'h0);
  reg [(4'hd):(1'h0)] reg180 = (1'h0);
  reg [(5'h15):(1'h0)] reg179 = (1'h0);
  reg [(5'h13):(1'h0)] reg178 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg177 = (1'h0);
  reg [(4'h8):(1'h0)] reg170 = (1'h0);
  reg [(2'h3):(1'h0)] reg164 = (1'h0);
  reg [(3'h4):(1'h0)] reg163 = (1'h0);
  reg [(5'h13):(1'h0)] reg162 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg161 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg160 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg159 = (1'h0);
  reg [(4'h9):(1'h0)] reg158 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg156 = (1'h0);
  reg [(4'hf):(1'h0)] reg155 = (1'h0);
  reg [(4'hf):(1'h0)] reg154 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg153 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg149 = (1'h0);
  reg [(3'h5):(1'h0)] reg148 = (1'h0);
  reg [(4'he):(1'h0)] reg147 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg146 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg145 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg144 = (1'h0);
  reg [(4'hd):(1'h0)] reg143 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg142 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg141 = (1'h0);
  reg [(5'h13):(1'h0)] reg140 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg139 = (1'h0);
  assign y = {wire209,
                 wire208,
                 wire204,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire152,
                 wire151,
                 wire150,
                 reg207,
                 reg206,
                 reg205,
                 reg203,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 reg198,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg170,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
                 reg139,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg139 <= $signed((~|(((wire136 ? wire137 : (8'ha1)) ?
              $unsigned(wire136) : $unsigned(wire135)) ?
          $unsigned($signed(wire137)) : $signed(((8'hae) ~^ wire137)))));
      reg140 <= (wire136 ~^ $unsigned({((|wire136) ?
              (wire137 ? wire138 : wire135) : (~&wire138)),
          wire138}));
      if ((^(wire137[(3'h5):(2'h3)] ?
          wire135[(4'h8):(2'h3)] : (~^(~^$signed(reg140))))))
        begin
          if ((($unsigned({reg139[(1'h0):(1'h0)]}) ~^ $unsigned(($unsigned(wire138) ?
              (!reg140) : wire137[(4'h8):(1'h0)]))) > (reg139[(3'h4):(1'h0)] ?
              {{wire136}} : reg140[(4'h8):(2'h3)])))
            begin
              reg141 <= reg140[(2'h3):(1'h0)];
              reg142 <= (($unsigned($signed($signed(wire136))) || $signed($unsigned(((7'h41) ?
                      reg140 : reg141)))) ?
                  ($unsigned(((wire138 ? reg139 : reg139) ?
                          (wire138 ?
                              (8'h9d) : (7'h42)) : reg139[(3'h4):(1'h0)])) ?
                      (!($signed(wire135) ?
                          $signed(reg139) : $signed(wire136))) : (({(8'hbe)} ^~ reg141) ?
                          $unsigned((^reg141)) : ((reg139 ? reg140 : (8'hba)) ?
                              (wire137 ?
                                  (8'ha3) : wire135) : {(8'ha2)}))) : wire137[(4'h9):(1'h0)]);
              reg143 <= (^~$unsigned((reg142[(3'h6):(2'h3)] ^~ reg140)));
            end
          else
            begin
              reg141 <= (~($unsigned({wire137[(3'h4):(2'h3)]}) ?
                  wire136 : reg140));
              reg142 <= (~((~&((reg142 ? reg141 : reg143) ?
                  (reg139 >> (8'hbe)) : (reg143 ?
                      wire137 : reg139))) <= {$signed($unsigned((8'ha6)))}));
              reg143 <= wire137;
              reg144 <= reg141;
              reg145 <= (wire137 ?
                  {(($unsigned(wire138) ?
                          wire135 : $unsigned(wire138)) ^~ (wire135[(4'hd):(4'hc)] ?
                          (reg141 ? (8'h9c) : reg141) : (wire136 * reg143))),
                      (reg139 < ((wire135 ? wire138 : wire138) ?
                          (-reg143) : reg142))} : ((~&{((8'ha6) ?
                          reg140 : reg143),
                      (^wire137)}) && $signed(((wire135 ^~ reg139) ?
                      $signed((7'h44)) : $signed(reg142)))));
            end
        end
      else
        begin
          if ((!{wire135[(3'h7):(2'h2)],
              (($signed(reg143) ? ((8'ha7) ? reg145 : wire137) : reg139) ?
                  reg145[(3'h5):(3'h5)] : reg144)}))
            begin
              reg141 <= (((reg144 >= (8'h9d)) << $unsigned($signed(reg145[(3'h5):(1'h1)]))) ?
                  $signed((^$signed((reg145 < reg144)))) : ($signed((wire138[(2'h3):(1'h1)] ?
                      (~|wire136) : $signed(wire138))) + reg142[(1'h1):(1'h1)]));
              reg142 <= (reg139 ? wire135 : (&(!reg141)));
              reg143 <= $unsigned(reg144[(2'h3):(1'h0)]);
              reg144 <= {reg141};
              reg145 <= $signed(($unsigned({(wire137 ? wire135 : reg140),
                      $signed((8'ha0))}) ?
                  $unsigned($signed($unsigned(reg139))) : wire138[(1'h1):(1'h0)]));
            end
          else
            begin
              reg141 <= $unsigned(wire137);
              reg142 <= $unsigned(reg145);
              reg143 <= (reg145[(3'h7):(1'h0)] ?
                  {reg142} : (reg145 == ($signed((reg139 ? reg141 : wire137)) ?
                      {wire137[(1'h1):(1'h0)],
                          $signed(wire138)} : (!(~|wire137)))));
            end
          reg146 <= (wire135 ^~ $unsigned($unsigned(reg145)));
          reg147 <= $signed($signed($signed(wire137[(3'h4):(1'h0)])));
          reg148 <= wire138[(3'h4):(1'h0)];
          reg149 <= (reg143[(3'h4):(2'h2)] ~^ reg139[(3'h4):(2'h3)]);
        end
    end
  assign wire150 = (+(~^wire138));
  assign wire151 = $unsigned(((wire138 << $signed((reg140 ?
                           reg145 : wire135))) ?
                       reg145[(3'h4):(2'h3)] : $unsigned($signed((^reg141)))));
  assign wire152 = (~^reg148[(3'h5):(1'h1)]);
  always
    @(posedge clk) begin
      reg153 <= ({(8'hbe),
          $signed($unsigned((wire152 >= wire138)))} >> ((wire138[(1'h0):(1'h0)] * ((wire152 ?
              reg145 : (8'hb8)) ?
          (wire135 != reg145) : $unsigned((8'hb9)))) >>> reg148[(2'h2):(1'h0)]));
      if ($signed((8'hbc)))
        begin
          reg154 <= (!$signed((((8'hb4) ?
              ((8'hb4) == (8'h9f)) : $unsigned(wire152)) > reg146)));
          reg155 <= ($signed(reg139) ?
              $signed((wire152 ?
                  $unsigned($signed((8'hab))) : ($signed(reg140) ^ {wire137}))) : (-(~|$unsigned({(8'hbc),
                  reg149}))));
          reg156 <= (wire137 | $unsigned(($unsigned($signed(reg141)) ?
              $unsigned((^wire136)) : (-reg154))));
          reg157 <= (+$unsigned($unsigned($unsigned((wire152 ?
              reg142 : reg143)))));
        end
      else
        begin
          reg154 <= ((!(~$unsigned((~reg142)))) * reg154[(1'h1):(1'h0)]);
          if ($signed($unsigned($unsigned((wire136 ?
              $signed((8'hb5)) : (reg155 ? reg147 : reg146))))))
            begin
              reg155 <= (wire151[(5'h13):(4'he)] ?
                  (($signed((8'hbb)) ?
                          $signed((wire137 || wire136)) : (~&(+reg155))) ?
                      $signed($signed($unsigned((8'haa)))) : wire151[(5'h10):(4'hd)]) : {($unsigned((!reg145)) ?
                          (&{wire138, reg139}) : ((reg139 ? reg148 : wire136) ?
                              (wire152 & reg147) : (reg146 ^~ reg149)))});
            end
          else
            begin
              reg155 <= reg142;
              reg156 <= (^(~(reg144[(3'h6):(1'h0)] ~^ (reg143[(3'h7):(3'h7)] ^ $signed(reg148)))));
              reg157 <= $signed((reg141[(1'h0):(1'h0)] == ({$unsigned(wire150)} >> ($unsigned((8'hb9)) > (wire138 >= wire136)))));
            end
          reg158 <= ((reg157[(3'h6):(1'h0)] ?
              ($signed((reg156 + wire135)) & (((8'hb9) != wire150) ?
                  (&(7'h40)) : reg144[(2'h2):(1'h1)])) : {$unsigned($signed(wire138)),
                  (~^(reg155 + reg141))}) || ((({reg142} >= (reg148 + reg147)) < $unsigned(reg144)) ?
              (reg156[(4'he):(4'h9)] || wire138) : wire138));
        end
      if (((~reg139) < (reg158[(2'h3):(1'h0)] || $signed((reg155[(3'h7):(3'h6)] || {reg155,
          wire150})))))
        begin
          reg159 <= reg158[(3'h6):(3'h6)];
          reg160 <= reg141;
          reg161 <= (($signed({(wire137 >= wire152), (reg160 | reg156)}) ?
                  (+$signed((wire152 ? reg144 : wire137))) : (^(+(-(8'hbd))))) ?
              reg158[(1'h0):(1'h0)] : ((~(~reg154[(3'h4):(3'h4)])) ?
                  reg149[(2'h3):(2'h2)] : (&(~&$signed((8'h9f))))));
          reg162 <= (($signed($signed(reg160[(1'h1):(1'h0)])) >>> reg156) << $signed($signed(({reg145} ?
              (reg154 ? reg158 : reg153) : ((7'h42) <<< reg158)))));
          reg163 <= $unsigned($signed(((|reg157[(3'h7):(3'h4)]) ?
              $unsigned((wire152 ?
                  reg140 : reg148)) : $unsigned((reg160 << reg159)))));
        end
      else
        begin
          if (((((wire137[(4'hc):(4'hc)] > (~&reg163)) + (+reg157)) * (reg143 ^ $unsigned(reg163[(1'h1):(1'h0)]))) ?
              (reg159 ?
                  (|$unsigned($signed((8'hb6)))) : (+((reg146 ?
                      (8'hbd) : reg139) ^~ (wire138 ?
                      reg148 : reg162)))) : {(|$unsigned({wire151, wire138})),
                  $signed(($unsigned(reg143) ?
                      reg147 : reg154[(3'h7):(3'h7)]))}))
            begin
              reg159 <= reg159;
              reg160 <= {$signed((($unsigned(reg155) | $unsigned(reg156)) != wire151))};
              reg161 <= $signed((+$signed($unsigned({(8'hab)}))));
              reg162 <= ((wire152 ?
                  $unsigned((8'hb4)) : $signed($signed((&reg160)))) != (wire150 ?
                  $unsigned(reg139) : {(&(reg160 ? wire152 : wire135))}));
              reg163 <= ((reg145 != wire135[(4'h8):(1'h1)]) && wire138[(2'h3):(2'h2)]);
            end
          else
            begin
              reg159 <= {(~^((8'hbf) ?
                      $unsigned($signed((8'h9c))) : reg159[(3'h4):(1'h1)]))};
              reg160 <= $signed({$unsigned(((reg148 ?
                      wire138 : reg139) && (8'ha1))),
                  ({(~^reg160)} ?
                      $unsigned((reg154 ?
                          wire150 : reg142)) : $signed(reg163))});
              reg161 <= ($unsigned({reg160}) | (reg142 - (~&((|reg163) || (~reg143)))));
              reg162 <= $signed($signed((-$unsigned($unsigned(reg148)))));
            end
        end
      reg164 <= $unsigned($unsigned($signed(($unsigned(reg141) ?
          $signed(reg148) : (-reg141)))));
    end
  assign wire165 = reg141[(1'h1):(1'h1)];
  assign wire166 = $signed($signed((+reg154[(3'h6):(3'h6)])));
  assign wire167 = wire150;
  assign wire168 = (-(wire151 - $signed($signed((^~reg149)))));
  assign wire169 = $unsigned((((!(~^(8'ha2))) && ((reg141 ?
                       wire152 : wire136) <= $signed(wire151))) < {(^~$unsigned(reg142))}));
  always
    @(posedge clk) begin
      reg170 <= wire151[(3'h6):(3'h5)];
    end
  assign wire171 = ($unsigned((+(8'ha6))) ?
                       (8'hb5) : (wire165 ? {(~^wire150), reg146} : reg158));
  assign wire172 = (8'hb8);
  assign wire173 = {{({(reg160 ? reg163 : reg154), (&reg139)} == (wire167 ?
                               $unsigned(wire169) : reg157[(3'h7):(1'h1)]))}};
  assign wire174 = wire136;
  assign wire175 = (~^$unsigned(({((8'ha7) ? wire136 : (8'hb0)),
                       reg161[(5'h10):(2'h3)]} >> wire151[(3'h5):(1'h0)])));
  assign wire176 = reg148;
  always
    @(posedge clk) begin
      if (wire152[(2'h2):(1'h1)])
        begin
          reg177 <= (!$signed($signed({reg154})));
          reg178 <= (|wire166);
        end
      else
        begin
          reg177 <= {((~|wire166) ?
                  $signed($unsigned(reg157)) : wire150[(3'h5):(2'h3)]),
              wire169[(1'h0):(1'h0)]};
          if (reg139[(1'h1):(1'h1)])
            begin
              reg178 <= wire165[(1'h0):(1'h0)];
              reg179 <= reg149[(2'h2):(1'h1)];
              reg180 <= (+((8'ha9) ?
                  (~&((reg142 ? wire135 : wire138) ?
                      (reg158 + reg161) : $signed((8'hb3)))) : {(~^$signed(wire173))}));
              reg181 <= ($signed(reg164) - $signed($signed(reg148[(2'h3):(2'h2)])));
            end
          else
            begin
              reg178 <= (($signed((wire137[(3'h7):(1'h1)] ?
                          reg181[(1'h1):(1'h0)] : (~|(8'hac)))) ?
                      (8'ha7) : $unsigned($signed((wire165 ?
                          reg142 : (8'hb2))))) ?
                  {reg148} : reg148);
              reg179 <= (wire165 ?
                  (+(^wire166[(3'h4):(1'h1)])) : $signed($unsigned($signed((^~wire166)))));
              reg180 <= reg148[(1'h0):(1'h0)];
            end
          reg182 <= reg153[(4'hd):(4'hc)];
        end
      if (wire151[(4'h9):(1'h1)])
        begin
          if (reg140[(4'h9):(3'h6)])
            begin
              reg183 <= (wire176[(4'h8):(1'h1)] ?
                  reg149 : reg145[(1'h0):(1'h0)]);
            end
          else
            begin
              reg183 <= (8'ha4);
              reg184 <= $unsigned(($unsigned((~(reg142 || reg142))) << $signed($unsigned($unsigned(wire167)))));
              reg185 <= (((^$unsigned({wire136})) | ((-(&(8'hbe))) ?
                  reg157 : (~&(wire171 ? wire174 : reg141)))) + (^reg178));
              reg186 <= ($signed((-((7'h41) ?
                  $signed((8'h9c)) : {reg185}))) << (~|$signed({((8'hbb) ?
                      reg145 : wire136)})));
            end
          if (wire174)
            begin
              reg187 <= reg148;
              reg188 <= ((!(8'ha0)) ?
                  ((8'hab) ~^ reg163[(1'h0):(1'h0)]) : $unsigned(((|$unsigned(wire136)) == reg148[(3'h4):(1'h0)])));
            end
          else
            begin
              reg187 <= reg143[(3'h7):(1'h1)];
              reg188 <= $signed((|wire167));
            end
        end
      else
        begin
          reg183 <= wire172[(4'h8):(4'h8)];
          reg184 <= (8'ha3);
          if ({reg153[(2'h3):(2'h3)], (8'had)})
            begin
              reg185 <= reg148;
              reg186 <= (reg139 <<< (~^reg161));
            end
          else
            begin
              reg185 <= (($unsigned((~|reg182[(4'ha):(1'h1)])) > reg142) ?
                  {$unsigned((+(8'hb3)))} : $unsigned((8'ha2)));
              reg186 <= {(&$signed(wire174[(3'h4):(2'h3)])), reg178};
              reg187 <= wire171;
              reg188 <= $signed(($unsigned(reg142) ?
                  {$signed($signed(reg178))} : reg147));
            end
          reg189 <= (reg162 ^~ reg177[(1'h0):(1'h0)]);
        end
      reg190 <= reg164;
      reg191 <= ($unsigned((~|wire175)) * reg145[(2'h2):(2'h2)]);
      reg192 <= (($signed(reg184) ?
              $signed(wire173) : (((reg189 ? wire175 : reg170) - reg163) ?
                  (~(wire138 ? (8'hb6) : reg180)) : {(~^wire172),
                      $unsigned(wire137)})) ?
          ({{(+reg190)}} ?
              (wire150 ?
                  reg163 : (~(reg181 ?
                      wire169 : wire171))) : wire166[(2'h3):(1'h0)]) : (((reg186[(1'h0):(1'h0)] ?
              (reg149 ?
                  (8'hae) : reg170) : (~reg146)) < $signed((reg158 ^ wire135))) - (|{(-wire174)})));
    end
  always
    @(posedge clk) begin
      if (reg148)
        begin
          reg193 <= ((reg145 | (reg139[(3'h6):(2'h2)] | (reg149 ?
              (wire169 | reg156) : (reg155 ?
                  wire165 : (8'hb9))))) + reg139[(2'h3):(1'h1)]);
          reg194 <= $unsigned({(&wire165)});
          reg195 <= (reg142[(3'h6):(3'h5)] >>> reg142);
          if (reg146)
            begin
              reg196 <= (^((~^$signed($unsigned(wire169))) <= ((reg190 ?
                  $signed(reg162) : ((8'hb8) ?
                      reg146 : (8'hb4))) >>> wire173[(2'h2):(1'h1)])));
              reg197 <= ($unsigned(reg149) ^ $unsigned($unsigned($signed((+wire167)))));
              reg198 <= (reg187[(1'h0):(1'h0)] ?
                  $unsigned(wire136[(2'h3):(2'h2)]) : $signed(reg191[(1'h0):(1'h0)]));
              reg199 <= reg140[(4'ha):(1'h0)];
              reg200 <= ({(~&(8'hbe)),
                      ((!(reg196 | reg192)) <<< ($unsigned(reg194) ^~ (~&reg199)))} ?
                  $unsigned($unsigned(($unsigned((8'hb7)) ?
                      $signed(wire137) : (^~reg163)))) : (~&wire174[(4'h9):(1'h0)]));
            end
          else
            begin
              reg196 <= $signed(reg181);
            end
        end
      else
        begin
          reg193 <= ((^~((^~reg198) < ($signed(reg181) ?
              $signed((7'h44)) : ((8'hb5) ?
                  reg146 : wire136)))) - ($signed($unsigned((wire152 ?
              reg178 : reg163))) < ({(reg142 ?
                  reg154 : reg148)} && reg194[(3'h5):(3'h4)])));
        end
      reg201 <= (+($signed((~^(wire173 ? reg191 : (8'haa)))) < (((wire151 ?
              reg181 : wire150) ?
          {(8'hb7),
              reg195} : $unsigned(wire166)) & $signed(reg148[(2'h3):(2'h2)]))));
      reg202 <= $signed($signed(reg144[(1'h0):(1'h0)]));
      reg203 <= ((8'ha2) ?
          ((({reg182, reg199} != (^reg160)) == ({wire175} ?
              reg153[(4'h8):(2'h3)] : (-wire176))) >= reg188[(3'h7):(1'h0)]) : ((-$signed($signed(reg190))) ?
              (((+(8'hae)) * $unsigned(reg182)) > (reg190[(1'h0):(1'h0)] <<< $signed(reg144))) : ($signed(reg202) <<< $unsigned((|wire136)))));
    end
  assign wire204 = (($signed(reg147) && $unsigned((~&$unsigned(wire173)))) ^~ wire151[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      reg205 <= $unsigned(reg144[(2'h3):(2'h2)]);
      reg206 <= $unsigned((^reg160));
      reg207 <= reg196;
    end
  assign wire208 = ($unsigned((wire169[(1'h0):(1'h0)] ?
                       reg149 : reg142[(3'h5):(2'h2)])) <= reg160[(3'h5):(2'h3)]);
  assign wire209 = $unsigned(reg195);
endmodule
