module top
#(parameter param121 = {(!(({(8'h9d), (8'h9d)} != {(8'hb1), (8'hb3)}) ? ((~|(8'ha8)) < (8'hb0)) : (((8'hb3) < (8'hbf)) ? ((7'h43) ? (7'h41) : (8'hb1)) : (|(8'haa)))))})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h15f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire0;
  input wire [(2'h3):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire4;
  wire [(2'h2):(1'h0)] wire120;
  wire [(4'ha):(1'h0)] wire119;
  wire signed [(5'h13):(1'h0)] wire118;
  wire [(4'hc):(1'h0)] wire117;
  wire [(3'h5):(1'h0)] wire115;
  wire signed [(5'h12):(1'h0)] wire55;
  wire [(4'he):(1'h0)] wire54;
  wire [(4'he):(1'h0)] wire53;
  wire [(5'h13):(1'h0)] wire52;
  wire [(4'ha):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire7;
  wire signed [(4'he):(1'h0)] wire8;
  wire signed [(4'ha):(1'h0)] wire18;
  wire [(5'h13):(1'h0)] wire20;
  wire [(4'hf):(1'h0)] wire33;
  wire [(4'h9):(1'h0)] wire50;
  reg signed [(4'hd):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg17 = (1'h0);
  reg [(5'h14):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg15 = (1'h0);
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  reg [(3'h5):(1'h0)] reg13 = (1'h0);
  reg [(3'h5):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg9 = (1'h0);
  assign y = {wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire115,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire18,
                 wire20,
                 wire33,
                 wire50,
                 reg19,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire5 = $signed((($signed($signed((7'h44))) ?
                     wire0 : (^~(~&wire4))) ^~ $unsigned(((-wire0) != (wire3 ?
                     wire3 : wire3)))));
  assign wire6 = wire3;
  assign wire7 = (($unsigned(($unsigned(wire5) - $signed(wire5))) ?
                         (+wire6) : ($unsigned(wire5) ?
                             $unsigned((-(8'hb5))) : $unsigned(wire3))) ?
                     (!wire6[(4'hf):(3'h7)]) : (~&(wire5[(1'h0):(1'h0)] & wire3[(4'h8):(3'h5)])));
  assign wire8 = (!$signed($signed(((-wire3) || wire2))));
  always
    @(posedge clk) begin
      if ({(-$signed($signed((wire1 ? wire5 : wire0))))})
        begin
          reg9 <= $signed((-$signed((wire1 > wire2))));
          reg10 <= wire1[(2'h2):(1'h1)];
          reg11 <= wire3[(4'hb):(4'h8)];
        end
      else
        begin
          reg9 <= $signed(wire5[(1'h1):(1'h0)]);
        end
      if (wire8[(1'h0):(1'h0)])
        begin
          reg12 <= reg9[(4'hc):(3'h6)];
        end
      else
        begin
          reg12 <= ($signed((|((wire5 ? wire2 : (8'h9f)) ?
                  (wire8 > wire1) : $unsigned((7'h40))))) ?
              wire8[(3'h7):(3'h4)] : (wire8[(4'hb):(1'h0)] ?
                  (wire3 ~^ (~(wire4 ? reg9 : wire6))) : {reg9}));
          if (((reg12[(2'h3):(1'h0)] ?
              reg9[(4'hf):(3'h5)] : {($signed(reg10) ? wire2 : (wire0 ^ wire3)),
                  {(wire3 && (8'ha5))}}) <<< $unsigned($unsigned($unsigned(wire0[(2'h3):(1'h1)])))))
            begin
              reg13 <= {(8'hb1)};
            end
          else
            begin
              reg13 <= ({$signed(wire6)} ?
                  $unsigned(reg10[(4'h8):(3'h5)]) : (8'ha9));
            end
          if ($signed((~|(7'h41))))
            begin
              reg14 <= ((-reg9[(3'h5):(2'h2)]) ?
                  $unsigned((wire1 >= $signed((wire2 ?
                      reg12 : (8'ha0))))) : $unsigned(wire2[(2'h2):(1'h1)]));
            end
          else
            begin
              reg14 <= ($unsigned((((wire3 - (8'ha5)) << (wire4 ?
                          (7'h43) : reg10)) ?
                      {wire6, $signed(wire3)} : (~^(|(8'hb0))))) ?
                  ($unsigned(((~|(8'hb0)) && $signed((8'hb3)))) ?
                      wire7 : wire4) : ((^~(^~wire8)) ? (~^reg10) : wire3));
            end
          reg15 <= $signed($unsigned(($unsigned((|wire5)) ^ wire5[(1'h0):(1'h0)])));
        end
      reg16 <= (-(-wire8[(3'h4):(1'h0)]));
      reg17 <= {({$signed($signed(reg16)), (7'h41)} ?
              $unsigned({{wire8}}) : reg10)};
    end
  assign wire18 = $unsigned((wire4[(3'h7):(2'h2)] >>> ($unsigned(reg17[(1'h1):(1'h1)]) ?
                      $signed((+wire5)) : (reg14 <<< (&wire8)))));
  always
    @(posedge clk) begin
      reg19 <= $signed(reg10[(3'h7):(1'h1)]);
    end
  assign wire20 = ($signed(wire0[(1'h0):(1'h0)]) | ($unsigned({(wire18 ?
                          reg19 : wire18)}) == ($signed($unsigned((8'ha2))) ?
                      wire0 : {{(8'h9d), wire18}})));
  module21 #() modinst34 (wire33, clk, wire5, reg11, wire6, wire3, wire20);
  module35 #() modinst51 (wire50, clk, wire18, wire33, wire4, reg17);
  assign wire52 = $signed($signed($unsigned(wire3)));
  assign wire53 = {{$unsigned({$signed(wire7), (!reg14)})}, reg10};
  assign wire54 = $signed((reg11 <= reg11[(4'h9):(2'h3)]));
  assign wire55 = (({wire7,
                          ($unsigned(wire52) ?
                              (wire20 ^ wire1) : (reg17 ? reg10 : reg15))} ?
                      (wire3[(5'h10):(3'h7)] ^ wire53) : (8'hbc)) * reg17);
  module56 #() modinst116 (.clk(clk), .wire57(reg9), .wire58(wire2), .wire60(reg19), .wire59(wire5), .y(wire115));
  assign wire117 = $signed((^~(^~wire5[(3'h5):(3'h4)])));
  assign wire118 = reg12;
  assign wire119 = (((~wire18) == ($signed($signed(wire50)) - (^(reg11 ?
                           wire115 : (8'h9d))))) ?
                       wire8[(4'h8):(4'h8)] : reg19[(4'ha):(3'h5)]);
  assign wire120 = $signed((((!$unsigned(reg14)) - $signed({(8'ha9)})) | ({reg19[(4'h8):(1'h0)]} == (((8'ha4) <= reg19) >> $signed(reg14)))));
endmodule

module module56
#(parameter param113 = (8'ha9), 
parameter param114 = ({((param113 == {param113, param113}) ? {(param113 | param113), param113} : ((param113 ? param113 : param113) >= (7'h43))), (^~((param113 * (8'ha3)) ? {param113} : ((8'ha8) ? param113 : param113)))} ? param113 : param113))
(y, clk, wire60, wire59, wire58, wire57);
  output wire [(32'h248):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire60;
  input wire [(3'h5):(1'h0)] wire59;
  input wire signed [(4'h9):(1'h0)] wire58;
  input wire [(4'h9):(1'h0)] wire57;
  wire [(4'hb):(1'h0)] wire112;
  wire signed [(5'h13):(1'h0)] wire111;
  wire [(3'h5):(1'h0)] wire110;
  wire [(5'h12):(1'h0)] wire109;
  wire [(3'h7):(1'h0)] wire108;
  wire signed [(3'h5):(1'h0)] wire97;
  wire signed [(4'h8):(1'h0)] wire96;
  wire signed [(2'h3):(1'h0)] wire95;
  wire [(3'h4):(1'h0)] wire94;
  wire [(5'h10):(1'h0)] wire72;
  wire signed [(4'hc):(1'h0)] wire71;
  wire [(4'hc):(1'h0)] wire70;
  wire [(4'hb):(1'h0)] wire69;
  wire signed [(5'h11):(1'h0)] wire61;
  reg [(2'h3):(1'h0)] reg107 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg106 = (1'h0);
  reg [(4'ha):(1'h0)] reg105 = (1'h0);
  reg [(2'h2):(1'h0)] reg104 = (1'h0);
  reg [(4'h9):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg102 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg101 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg99 = (1'h0);
  reg signed [(4'he):(1'h0)] reg98 = (1'h0);
  reg [(4'hf):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg92 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg91 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg90 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg89 = (1'h0);
  reg [(2'h2):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg87 = (1'h0);
  reg [(4'h9):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg85 = (1'h0);
  reg [(5'h10):(1'h0)] reg84 = (1'h0);
  reg [(3'h7):(1'h0)] reg83 = (1'h0);
  reg [(4'he):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg80 = (1'h0);
  reg [(5'h11):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg78 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg77 = (1'h0);
  reg [(5'h10):(1'h0)] reg76 = (1'h0);
  reg [(3'h6):(1'h0)] reg75 = (1'h0);
  reg [(5'h11):(1'h0)] reg74 = (1'h0);
  reg [(5'h10):(1'h0)] reg73 = (1'h0);
  reg [(2'h2):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg67 = (1'h0);
  reg [(5'h11):(1'h0)] reg66 = (1'h0);
  reg [(4'hf):(1'h0)] reg65 = (1'h0);
  reg [(5'h14):(1'h0)] reg64 = (1'h0);
  reg [(5'h13):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg62 = (1'h0);
  assign y = {wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire61,
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
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
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
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 (1'h0)};
  assign wire61 = (wire60 ?
                      $unsigned({(+$signed(wire58)),
                          (wire58 ?
                              (wire57 ^ (8'h9e)) : (wire59 >= wire58))}) : wire58[(4'h8):(4'h8)]);
  always
    @(posedge clk) begin
      reg62 <= (-$unsigned($unsigned($unsigned(wire61[(4'hb):(2'h3)]))));
      if (wire60)
        begin
          reg63 <= $signed($signed($unsigned($signed(wire61[(4'h8):(4'h8)]))));
        end
      else
        begin
          reg63 <= $signed((|$unsigned((wire57 ?
              $signed(reg63) : $signed((8'hbd))))));
          reg64 <= $unsigned((!(!((!wire57) ? {wire60} : $unsigned(reg63)))));
          reg65 <= $signed(reg63);
          reg66 <= (|$unsigned((reg65 ?
              ($unsigned((8'hb0)) ?
                  $unsigned(reg64) : (~&reg65)) : $signed(wire59[(1'h0):(1'h0)]))));
        end
      reg67 <= reg62;
      reg68 <= $signed(((~$unsigned((reg67 >> reg63))) >>> wire60));
    end
  assign wire69 = ((-($unsigned((reg63 ?
                      reg64 : (8'hb7))) <= reg66[(4'hd):(4'h9)])) ~^ wire59[(3'h5):(2'h3)]);
  assign wire70 = wire69;
  assign wire71 = (8'haa);
  assign wire72 = ({(7'h41),
                      ($unsigned($signed(reg67)) ?
                          (~^$signed(wire61)) : wire60[(3'h4):(3'h4)])} << $signed((~^($unsigned((8'hb1)) ?
                      (8'hb8) : (reg65 > wire69)))));
  always
    @(posedge clk) begin
      if ($unsigned(wire72))
        begin
          reg73 <= ($signed({wire71[(3'h7):(2'h2)]}) ? reg65 : reg64);
          if (reg64[(5'h13):(1'h0)])
            begin
              reg74 <= (wire60 || $signed((reg62 ?
                  ((+reg73) ?
                      $signed(wire60) : $signed(reg62)) : (~^(reg65 << wire60)))));
              reg75 <= $signed($signed($signed(wire59)));
              reg76 <= ($signed(wire71[(2'h2):(1'h1)]) != reg74);
              reg77 <= ($unsigned($unsigned(reg73)) ?
                  reg75[(3'h5):(2'h3)] : ($signed(reg73) >>> (((reg75 == reg76) > {reg62}) <<< $unsigned(wire59))));
            end
          else
            begin
              reg74 <= {$unsigned((8'ha7))};
              reg75 <= $unsigned(wire72[(4'hd):(3'h4)]);
            end
          reg78 <= wire70;
        end
      else
        begin
          if ((~|($signed($signed((reg75 >>> reg76))) ?
              (($signed((8'h9c)) || ((8'hbd) > reg75)) ?
                  (wire72 - reg74[(3'h7):(3'h7)]) : wire72) : ((reg63[(3'h4):(2'h3)] == $signed(reg64)) ?
                  wire57 : wire71[(4'h9):(4'h8)]))))
            begin
              reg73 <= (((((-reg67) || $signed(reg67)) != ((reg78 || (8'ha8)) + reg73[(4'ha):(1'h0)])) <= $signed($unsigned({reg67}))) ?
                  ((~|reg78) ?
                      $unsigned($unsigned($signed(reg74))) : {((reg63 ?
                                  reg68 : reg62) ?
                              (wire59 ?
                                  reg68 : wire57) : $signed(reg64))}) : wire69);
              reg74 <= wire61;
              reg75 <= (8'hae);
              reg76 <= reg62[(2'h3):(2'h3)];
            end
          else
            begin
              reg73 <= ((~(&(~^(wire70 ? wire72 : reg75)))) >>> (8'hba));
              reg74 <= $unsigned(($unsigned((-$unsigned(reg77))) <= ($signed(wire69[(4'hb):(2'h2)]) ?
                  reg65[(4'h9):(3'h7)] : $signed(wire59[(1'h1):(1'h1)]))));
              reg75 <= reg67[(4'hc):(2'h3)];
              reg76 <= {wire58, (!(-$signed((|wire70))))};
            end
          reg77 <= (reg64 && $signed(({reg68,
              reg66[(4'hc):(3'h5)]} >= ((~&wire61) ^~ $signed(reg74)))));
          reg78 <= wire61;
          reg79 <= (&reg75);
          reg80 <= wire69;
        end
      if ($signed(wire71[(4'hb):(4'hb)]))
        begin
          reg81 <= (8'hae);
          reg82 <= $unsigned((+($signed($signed(reg62)) ?
              wire69[(2'h3):(1'h1)] : $unsigned(reg64))));
          reg83 <= ($unsigned((((8'had) != (reg63 ?
                  reg78 : wire72)) <= $signed($signed((8'hb5))))) ?
              $signed(reg62) : (|wire61));
          reg84 <= wire61[(3'h6):(2'h2)];
          reg85 <= reg66[(1'h0):(1'h0)];
        end
      else
        begin
          if (reg82)
            begin
              reg81 <= ((wire69[(1'h0):(1'h0)] && wire69[(4'h8):(3'h5)]) ?
                  wire59[(2'h3):(2'h2)] : reg63);
              reg82 <= ($unsigned($unsigned($unsigned((reg67 ?
                  reg81 : wire70)))) <= $unsigned(reg67[(1'h1):(1'h1)]));
              reg83 <= {($unsigned($unsigned({reg62})) != ((+$unsigned(reg79)) + ((reg76 ?
                      wire72 : (8'hb0)) || (+reg73))))};
            end
          else
            begin
              reg81 <= ($signed(wire58[(3'h7):(2'h3)]) ?
                  {wire57[(3'h7):(3'h7)]} : (^~$unsigned(wire58[(2'h3):(2'h3)])));
              reg82 <= ($signed($unsigned(((wire71 ? (7'h44) : reg68) ?
                  (wire71 & wire70) : (wire59 - reg64)))) != {$unsigned($signed((^~wire57)))});
              reg83 <= reg76[(3'h7):(2'h3)];
              reg84 <= reg85;
              reg85 <= $signed(reg62[(3'h4):(2'h3)]);
            end
          reg86 <= (wire69[(2'h2):(2'h2)] >>> $signed($signed(reg83)));
          if ((reg64 ? reg66[(2'h3):(2'h2)] : (^reg68)))
            begin
              reg87 <= ({(^wire57)} <= ({wire58, reg79} ?
                  (|({(8'ha2), reg63} ?
                      (reg83 - (8'ha0)) : (reg75 > wire70))) : $signed((~^wire60))));
              reg88 <= ($signed(reg75[(3'h5):(3'h5)]) ?
                  {$unsigned(((-reg81) == {reg67, reg80})),
                      wire59[(3'h5):(3'h5)]} : reg64[(5'h14):(4'hf)]);
              reg89 <= (((((^wire61) ^ (reg62 ? wire61 : wire69)) ?
                          (8'hb2) : $unsigned($unsigned(wire61))) ?
                      $signed(($signed(reg65) > (^~wire70))) : wire57[(2'h3):(2'h2)]) ?
                  (wire59 & reg77[(1'h0):(1'h0)]) : {reg80});
            end
          else
            begin
              reg87 <= (reg88[(1'h0):(1'h0)] ^~ reg75);
              reg88 <= (wire72 < (({reg89} < (8'ha7)) ?
                  ($unsigned($unsigned(reg66)) ?
                      $unsigned({reg75}) : (~&(reg88 ?
                          (8'ha2) : wire61))) : wire61[(4'h9):(4'h8)]));
              reg89 <= (8'h9e);
              reg90 <= (!$signed(reg84[(4'hc):(3'h7)]));
              reg91 <= {$signed((reg80[(5'h11):(3'h6)] <= $signed({reg62}))),
                  $signed(wire59[(2'h3):(1'h0)])};
            end
        end
    end
  always
    @(posedge clk) begin
      reg92 <= $unsigned($unsigned($signed($signed(reg78[(3'h6):(2'h2)]))));
      reg93 <= (~$unsigned(($unsigned({(7'h41)}) <= reg64[(4'hf):(4'h8)])));
    end
  assign wire94 = (&({(~$unsigned(reg86)),
                          (reg86[(3'h4):(2'h2)] ?
                              $signed(wire59) : $signed(reg77))} ?
                      ($unsigned($signed(reg78)) >> ((reg81 && reg88) ?
                          $signed((8'hbf)) : $signed(reg84))) : $unsigned((-(reg88 ^ wire60)))));
  assign wire95 = reg92;
  assign wire96 = $signed((wire69[(4'h8):(2'h3)] >>> ({wire69, $signed(reg92)} ?
                      $unsigned(wire58) : reg74[(4'hc):(3'h7)])));
  assign wire97 = reg73;
  always
    @(posedge clk) begin
      if ((reg88 >> (+$unsigned((reg78[(2'h2):(2'h2)] != reg79[(5'h10):(1'h1)])))))
        begin
          reg98 <= (^{($unsigned((wire61 ?
                  reg83 : reg67)) + (~wire61[(2'h2):(2'h2)])),
              ($unsigned({reg74}) ? (!(wire58 ? wire71 : wire60)) : reg91)});
          if ((|(&$signed((&((8'hb0) + reg79))))))
            begin
              reg99 <= ($signed({((~reg87) || (8'hbb))}) ?
                  ((((reg78 ? (8'hbc) : reg77) ?
                          {reg82} : (^~(8'hbd))) * $unsigned(reg91)) ?
                      reg65[(1'h1):(1'h1)] : $unsigned(($unsigned(reg65) <= reg68[(2'h2):(1'h0)]))) : (&{$unsigned((reg98 ?
                          reg88 : reg65))}));
            end
          else
            begin
              reg99 <= wire96;
            end
          reg100 <= $unsigned($signed($unsigned(({reg92, reg91} ?
              (+(8'ha5)) : $signed((8'haf))))));
        end
      else
        begin
          reg98 <= $unsigned(wire97[(2'h3):(1'h0)]);
          reg99 <= $unsigned((|wire70));
          if (((wire59 << reg91) ^~ $signed(wire94)))
            begin
              reg100 <= $signed(wire96);
              reg101 <= (~(reg75[(1'h1):(1'h1)] ?
                  wire57[(2'h2):(1'h1)] : (^~($signed(reg93) ?
                      ((8'hbf) ? (7'h44) : reg76) : reg62))));
              reg102 <= $signed(((reg92 ^~ reg78) >> reg80[(1'h1):(1'h1)]));
              reg103 <= $signed((8'h9c));
              reg104 <= reg90;
            end
          else
            begin
              reg100 <= (~$signed($unsigned({(reg68 ? reg77 : wire71),
                  $unsigned(reg101)})));
            end
        end
    end
  always
    @(posedge clk) begin
      reg105 <= (!reg80);
      reg106 <= reg101;
      reg107 <= ($signed(wire96) - $unsigned(reg67[(3'h7):(1'h1)]));
    end
  assign wire108 = reg85[(4'he):(1'h0)];
  assign wire109 = $unsigned($signed($unsigned((reg81[(4'hd):(1'h0)] >= reg82))));
  assign wire110 = (^((&$unsigned(reg67)) != (reg82[(3'h7):(1'h0)] ?
                       ($unsigned(reg66) ?
                           ((8'ha7) ^ reg107) : (wire96 * reg106)) : wire69[(1'h1):(1'h0)])));
  assign wire111 = reg102[(4'ha):(3'h7)];
  assign wire112 = wire97;
endmodule

module module35  (y, clk, wire39, wire38, wire37, wire36);
  output wire [(32'h6b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire39;
  input wire signed [(4'hf):(1'h0)] wire38;
  input wire signed [(4'hd):(1'h0)] wire37;
  input wire [(5'h11):(1'h0)] wire36;
  wire [(5'h11):(1'h0)] wire41;
  wire [(4'h8):(1'h0)] wire40;
  reg [(5'h10):(1'h0)] reg49 = (1'h0);
  reg [(3'h4):(1'h0)] reg48 = (1'h0);
  reg [(2'h2):(1'h0)] reg47 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg46 = (1'h0);
  reg [(2'h3):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg44 = (1'h0);
  reg [(5'h13):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg42 = (1'h0);
  assign y = {wire41,
                 wire40,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 (1'h0)};
  assign wire40 = wire36;
  assign wire41 = wire38;
  always
    @(posedge clk) begin
      reg42 <= (($unsigned(wire36[(1'h1):(1'h0)]) >= {($signed(wire40) ?
                  {wire40} : (wire41 ? wire38 : wire39))}) ?
          ($unsigned(($signed(wire41) ?
              (~wire36) : $signed(wire37))) || wire40) : ($unsigned(wire39[(3'h6):(3'h5)]) <<< {(!wire37[(3'h4):(2'h2)]),
              wire36[(4'he):(1'h1)]}));
      reg43 <= wire36[(4'hc):(3'h7)];
      reg44 <= ((7'h43) ?
          ((wire40[(3'h5):(3'h4)] >= (~(^reg42))) ?
              wire40[(4'h8):(3'h5)] : ((wire40 ?
                  wire41[(5'h10):(3'h6)] : $signed(reg42)) << (^~wire41))) : (wire38[(2'h2):(2'h2)] <<< reg42));
      reg45 <= $unsigned((wire36[(5'h11):(2'h2)] > ({reg44[(1'h0):(1'h0)]} | $signed(reg43[(3'h5):(1'h0)]))));
    end
  always
    @(posedge clk) begin
      reg46 <= (!((reg43 ?
              (!(wire39 ? (8'h9f) : reg44)) : $unsigned((^~wire41))) ?
          $signed(reg43[(3'h7):(2'h2)]) : (8'ha7)));
      reg47 <= wire41[(4'hf):(3'h4)];
      reg48 <= wire37;
      reg49 <= (7'h43);
    end
endmodule

module module21
#(parameter param31 = ((({((8'haa) || (8'hbd)), ((8'ha0) ? (8'ha5) : (8'hb2))} > (8'hae)) + (|(&((8'ha1) <= (8'haf))))) - ({({(8'ha8)} ? ((8'hb9) ~^ (8'ha5)) : ((7'h43) | (7'h42))), ((&(8'hbb)) < {(8'hb9), (7'h43)})} ? {(((8'hb5) >= (8'hac)) <= ((8'h9f) ? (8'ha1) : (8'hb1))), (((8'hb1) != (8'hab)) | ((8'h9d) ^~ (7'h40)))} : ((^(&(8'hb3))) ? (-((8'h9e) ? (8'had) : (7'h43))) : ((~&(8'hbc)) * ((8'haa) ? (8'h9f) : (8'hb8)))))), 
parameter param32 = (((((param31 ? (8'h9f) : param31) ^ (param31 > param31)) ? (^~(param31 >>> (8'hba))) : (|{param31})) ~^ {((param31 ? param31 : param31) ? (-param31) : (~|(8'hb7)))}) >>> ((param31 ? param31 : (((7'h44) ? (8'hbe) : param31) <<< param31)) ? (((param31 ? param31 : param31) ^~ {param31}) ? {(~^param31), (~param31)} : (!(param31 ~^ param31))) : (+(~&param31)))))
(y, clk, wire26, wire25, wire24, wire23, wire22);
  output wire [(32'h18):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire26;
  input wire [(4'hd):(1'h0)] wire25;
  input wire signed [(4'he):(1'h0)] wire24;
  input wire [(5'h12):(1'h0)] wire23;
  input wire signed [(4'hc):(1'h0)] wire22;
  wire signed [(4'h9):(1'h0)] wire30;
  wire [(3'h4):(1'h0)] wire29;
  wire signed [(3'h7):(1'h0)] wire28;
  wire [(2'h3):(1'h0)] wire27;
  assign y = {wire30, wire29, wire28, wire27, (1'h0)};
  assign wire27 = $signed((^~(~&(-(wire25 * (8'hb2))))));
  assign wire28 = ($unsigned((!{((8'h9f) ? (8'hb3) : wire24)})) ?
                      $unsigned($signed({$unsigned(wire27)})) : (8'hb5));
  assign wire29 = wire24;
  assign wire30 = ((8'hbc) ?
                      (wire26[(3'h5):(2'h2)] && (~^$unsigned($signed(wire26)))) : (+((~|$signed(wire24)) | wire22)));
endmodule
