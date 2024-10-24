module top
#(parameter param157 = (^({(((8'h9c) ? (8'hb1) : (8'h9e)) ? {(8'hb9)} : ((8'hab) ^~ (7'h44))), (-{(8'hb9), (7'h43)})} ? ((!((8'ha5) ? (8'h9c) : (8'h9e))) >= {((8'ha0) ? (8'h9c) : (8'h9e))}) : ({(~|(8'hbc))} ? ((+(8'hb9)) | ((8'hbb) ? (8'h9f) : (8'hb3))) : ((&(8'hbc)) ? ((8'hbb) ? (7'h43) : (8'hac)) : ((7'h43) ? (8'haf) : (7'h44)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire3;
  wire [(5'h10):(1'h0)] wire4;
  wire [(5'h14):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire8;
  wire [(4'hf):(1'h0)] wire155;
  assign y = {wire4, wire5, wire6, wire7, wire8, wire155, (1'h0)};
  assign wire4 = (8'had);
  assign wire5 = (wire4 ?
                     (wire3[(2'h3):(2'h3)] <<< (^~((wire4 ? wire3 : (8'h9d)) ?
                         wire3 : $signed(wire4)))) : wire0);
  assign wire6 = (($signed($signed(wire3[(1'h1):(1'h1)])) ?
                         wire5 : ($unsigned(((8'h9f) ?
                             wire0 : (8'hab))) & $signed((~&wire3)))) ?
                     {wire1[(3'h7):(3'h4)]} : (8'ha1));
  assign wire7 = ((^(wire5 != (wire0 ? wire4 : (~&wire2)))) ?
                     (~(^~wire2)) : (|(wire4 * wire4)));
  assign wire8 = wire6[(3'h4):(1'h1)];
  module9 #() modinst156 (.wire14(wire3), .clk(clk), .wire12(wire1), .y(wire155), .wire10(wire8), .wire13(wire4), .wire11(wire2));
endmodule

module module9
#(parameter param153 = (((~&(((8'hbc) ? (8'hb8) : (8'ha3)) != {(8'ha8)})) ~^ (~^({(8'hb1), (8'h9e)} ? (&(8'ha4)) : {(8'ha8)}))) << (8'hb8)), 
parameter param154 = {(^{param153, ({param153} <<< {param153})}), param153})
(y, clk, wire10, wire11, wire12, wire13, wire14);
  output wire [(32'h168):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire10;
  input wire [(5'h10):(1'h0)] wire11;
  input wire [(5'h14):(1'h0)] wire12;
  input wire [(5'h10):(1'h0)] wire13;
  input wire signed [(5'h12):(1'h0)] wire14;
  wire [(5'h14):(1'h0)] wire152;
  wire [(4'hf):(1'h0)] wire151;
  wire [(3'h5):(1'h0)] wire150;
  wire signed [(4'h9):(1'h0)] wire149;
  wire [(5'h11):(1'h0)] wire147;
  wire signed [(5'h10):(1'h0)] wire146;
  wire [(5'h14):(1'h0)] wire142;
  wire signed [(4'h8):(1'h0)] wire140;
  wire [(4'hb):(1'h0)] wire115;
  wire signed [(5'h12):(1'h0)] wire93;
  wire [(4'h8):(1'h0)] wire91;
  wire [(5'h14):(1'h0)] wire38;
  wire [(5'h10):(1'h0)] wire15;
  wire [(4'hd):(1'h0)] wire36;
  reg [(2'h3):(1'h0)] reg148 = (1'h0);
  reg [(5'h11):(1'h0)] reg145 = (1'h0);
  reg [(4'hd):(1'h0)] reg144 = (1'h0);
  reg [(2'h3):(1'h0)] reg143 = (1'h0);
  reg [(4'he):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg40 = (1'h0);
  reg [(5'h14):(1'h0)] reg41 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg42 = (1'h0);
  reg [(5'h15):(1'h0)] reg43 = (1'h0);
  reg [(4'hb):(1'h0)] reg44 = (1'h0);
  reg [(4'hd):(1'h0)] reg45 = (1'h0);
  reg [(5'h11):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg47 = (1'h0);
  assign y = {wire152,
                 wire151,
                 wire150,
                 wire149,
                 wire147,
                 wire146,
                 wire142,
                 wire140,
                 wire115,
                 wire93,
                 wire91,
                 wire38,
                 wire15,
                 wire36,
                 reg148,
                 reg145,
                 reg144,
                 reg143,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 (1'h0)};
  assign wire15 = {(^((+(^~wire11)) ?
                          ($signed(wire13) < $signed(wire14)) : $signed(((8'hae) && wire11)))),
                      $unsigned(((wire11 >= (!wire11)) ?
                          wire13[(5'h10):(3'h4)] : $unsigned($unsigned((8'ha5)))))};
  module16 #() modinst37 (wire36, clk, wire12, wire11, wire10, wire13, wire14);
  assign wire38 = (((-wire13[(4'h9):(1'h0)]) ?
                      ((((8'ha0) - (8'hb9)) ?
                              ((8'ha6) + (8'h9f)) : (wire12 ?
                                  wire12 : wire11)) ?
                          $signed({wire11, (8'hb2)}) : (wire15 ?
                              (^(8'h9e)) : $unsigned(wire12))) : (wire14[(3'h4):(1'h1)] ?
                          (^~wire13[(3'h5):(1'h1)]) : (|{(8'hae)}))) ^ (~^{wire13[(4'h8):(2'h2)],
                      wire15}));
  always
    @(posedge clk) begin
      reg39 <= ($unsigned((~^((wire36 >>> wire10) * (wire11 ?
              wire36 : wire11)))) ?
          wire38[(3'h5):(1'h0)] : wire14);
      if (wire11)
        begin
          if ((~&(wire14 ?
              ($signed($unsigned(wire12)) ?
                  reg39[(2'h2):(2'h2)] : wire12[(4'hf):(3'h7)]) : $signed(wire13))))
            begin
              reg40 <= (wire11[(4'hd):(4'h9)] == $signed($unsigned(wire14)));
            end
          else
            begin
              reg40 <= $signed($unsigned((&$unsigned((wire38 ?
                  wire11 : wire14)))));
              reg41 <= $unsigned((wire11[(3'h5):(1'h1)] - {$signed(wire12[(4'h8):(1'h1)])}));
              reg42 <= (-(^$signed(wire11)));
            end
          if (({{wire14[(5'h10):(3'h5)], {$signed((7'h42))}},
              (8'h9f)} != ({{(wire12 ? wire10 : reg42),
                  (wire15 ? wire11 : wire12)},
              ((reg41 ?
                  (8'hba) : reg40) >= $unsigned((8'hb6)))} & (((reg42 - wire36) ?
                  (wire11 <= (8'ha1)) : {reg41, wire15}) ?
              $unsigned((wire12 ? reg41 : wire15)) : (8'hb8)))))
            begin
              reg43 <= wire12[(4'h9):(4'h8)];
              reg44 <= $signed(($unsigned(reg39[(4'h9):(2'h2)]) ?
                  ($unsigned($signed(reg41)) != $unsigned(((8'haf) ?
                      wire15 : reg39))) : $signed({$unsigned((8'ha5))})));
              reg45 <= wire12[(5'h10):(2'h2)];
            end
          else
            begin
              reg43 <= (~$unsigned(($signed($signed(wire10)) ?
                  (!$unsigned((8'hae))) : reg45[(4'hc):(4'ha)])));
            end
        end
      else
        begin
          reg40 <= {$signed(($signed((reg42 >>> reg41)) || (8'ha9)))};
        end
      reg46 <= $unsigned(wire15[(3'h7):(3'h4)]);
      reg47 <= $signed(((+wire14) < $signed(((wire36 ?
          (7'h40) : wire10) + wire12))));
    end
  module48 #() modinst92 (.wire49(reg39), .wire51(reg42), .clk(clk), .y(wire91), .wire53(wire15), .wire52(reg41), .wire50(wire38));
  assign wire93 = $signed((reg40 == reg47[(2'h3):(2'h2)]));
  module94 #() modinst116 (wire115, clk, wire11, reg39, wire10, reg44, reg47);
  module117 #() modinst141 (wire140, clk, reg43, wire11, wire12, reg45, reg41);
  assign wire142 = $signed((^~reg45));
  always
    @(posedge clk) begin
      reg143 <= wire142[(4'h9):(1'h1)];
      reg144 <= wire12;
      reg145 <= reg44;
    end
  assign wire146 = (^(^$signed($signed(wire115[(3'h5):(1'h0)]))));
  assign wire147 = ((|(wire38 ?
                       ((~^wire146) >>> wire36[(3'h4):(1'h0)]) : wire93[(4'hd):(2'h3)])) << wire140);
  always
    @(posedge clk) begin
      reg148 <= $unsigned(reg41[(1'h0):(1'h0)]);
    end
  assign wire149 = reg39;
  assign wire150 = wire115;
  assign wire151 = ((((8'hb8) ?
                           $unsigned((+reg143)) : $signed(reg145[(4'hf):(3'h7)])) && (^~((^wire93) ?
                           wire13[(4'ha):(3'h7)] : $unsigned(wire11)))) ?
                       (&(wire12[(5'h11):(3'h5)] | $unsigned((^(8'h9e))))) : ({reg41,
                           wire10} <<< wire91));
  assign wire152 = $unsigned(wire36);
endmodule

module module117  (y, clk, wire122, wire121, wire120, wire119, wire118);
  output wire [(32'hc7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire122;
  input wire signed [(2'h2):(1'h0)] wire121;
  input wire [(4'ha):(1'h0)] wire120;
  input wire [(4'h8):(1'h0)] wire119;
  input wire signed [(5'h14):(1'h0)] wire118;
  wire signed [(5'h12):(1'h0)] wire139;
  wire signed [(4'hc):(1'h0)] wire138;
  wire signed [(3'h5):(1'h0)] wire137;
  wire [(2'h3):(1'h0)] wire136;
  wire signed [(5'h15):(1'h0)] wire135;
  wire [(4'hb):(1'h0)] wire131;
  wire [(3'h4):(1'h0)] wire128;
  wire [(2'h2):(1'h0)] wire123;
  reg signed [(5'h11):(1'h0)] reg134 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg132 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg130 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg129 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg127 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg126 = (1'h0);
  reg [(5'h14):(1'h0)] reg125 = (1'h0);
  reg [(5'h14):(1'h0)] reg124 = (1'h0);
  assign y = {wire139,
                 wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire131,
                 wire128,
                 wire123,
                 reg134,
                 reg133,
                 reg132,
                 reg130,
                 reg129,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 (1'h0)};
  assign wire123 = ((8'ha4) ?
                       ((wire122 || wire120) - (((wire122 ?
                           wire122 : (8'hb1)) >>> wire121[(1'h1):(1'h1)]) ^~ ($unsigned(wire120) > $unsigned((8'hbb))))) : wire118);
  always
    @(posedge clk) begin
      reg124 <= wire118[(4'hd):(4'ha)];
      if (($signed(($unsigned($unsigned(wire121)) ?
          wire118[(4'hd):(4'h8)] : ((wire118 ?
              (8'hb0) : wire123) < (+wire119)))) < wire118[(4'h9):(4'h9)]))
        begin
          reg125 <= $signed(($signed(((wire120 == wire119) ?
                  (7'h40) : (wire121 ? reg124 : wire118))) ?
              $signed($unsigned((~&wire122))) : wire122));
        end
      else
        begin
          reg125 <= ((($signed((wire122 >= wire118)) - (wire121 ?
              (wire123 ?
                  wire122 : wire118) : (-wire120))) & (~$unsigned((~^(8'hbc))))) && $signed($signed((~reg124))));
        end
      reg126 <= reg125[(4'h9):(4'h8)];
      reg127 <= (wire121 | ((~($signed(wire119) ^ reg124)) ?
          wire118[(2'h3):(1'h1)] : $unsigned((+{wire120, wire119}))));
    end
  assign wire128 = (wire122 <<< wire118);
  always
    @(posedge clk) begin
      reg129 <= (8'ha4);
      reg130 <= $unsigned(({(8'hb1)} ?
          wire119[(2'h2):(1'h1)] : ((|(reg127 ?
              wire122 : wire123)) >> $signed((8'ha7)))));
    end
  assign wire131 = $unsigned(((+((~&wire123) ?
                           {wire123, wire119} : (!reg130))) ?
                       (wire120[(2'h3):(1'h1)] < wire128) : wire121[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg132 <= $unsigned($signed($unsigned(wire128)));
      reg133 <= {({{(|(8'ha7)), wire131[(1'h1):(1'h1)]}} ? reg130 : reg132),
          ($unsigned((8'hb5)) & (wire120 != ((~&reg126) ?
              (wire122 ? (8'hac) : reg125) : wire122)))};
      reg134 <= $signed($unsigned((8'ha0)));
    end
  assign wire135 = (8'had);
  assign wire136 = ((reg126[(1'h0):(1'h0)] ?
                           $signed(wire118) : $unsigned(reg125[(3'h7):(3'h6)])) ?
                       (^~wire121) : (8'hbe));
  assign wire137 = wire131[(4'h8):(1'h1)];
  assign wire138 = $signed(reg130);
  assign wire139 = (wire136[(2'h3):(2'h3)] <= ((8'ha6) ?
                       $signed(($signed(reg134) != (reg125 ?
                           wire120 : reg130))) : $signed((((8'hbc) ?
                           reg126 : wire123) >>> (+reg134)))));
endmodule

module module94  (y, clk, wire99, wire98, wire97, wire96, wire95);
  output wire [(32'h9b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire99;
  input wire signed [(4'hd):(1'h0)] wire98;
  input wire [(3'h5):(1'h0)] wire97;
  input wire [(4'h9):(1'h0)] wire96;
  input wire [(3'h4):(1'h0)] wire95;
  wire signed [(4'he):(1'h0)] wire114;
  wire [(4'hc):(1'h0)] wire113;
  wire [(4'ha):(1'h0)] wire104;
  wire signed [(4'hc):(1'h0)] wire101;
  wire signed [(3'h4):(1'h0)] wire100;
  reg [(4'hd):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg111 = (1'h0);
  reg [(4'h9):(1'h0)] reg110 = (1'h0);
  reg [(4'hd):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg108 = (1'h0);
  reg [(2'h2):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg105 = (1'h0);
  reg [(2'h3):(1'h0)] reg103 = (1'h0);
  reg [(5'h10):(1'h0)] reg102 = (1'h0);
  assign y = {wire114,
                 wire113,
                 wire104,
                 wire101,
                 wire100,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg103,
                 reg102,
                 (1'h0)};
  assign wire100 = wire99;
  assign wire101 = ((7'h40) ?
                       wire95[(2'h2):(1'h1)] : (wire97[(1'h0):(1'h0)] ?
                           (8'h9c) : $signed((~|wire95[(3'h4):(2'h3)]))));
  always
    @(posedge clk) begin
      reg102 <= wire96;
      reg103 <= (~&($signed({$unsigned(wire97),
          $signed((8'hb7))}) | wire98[(4'h8):(3'h6)]));
    end
  assign wire104 = ((-$signed(reg102[(4'h8):(2'h2)])) ?
                       reg102 : (+(~&wire97[(3'h4):(3'h4)])));
  always
    @(posedge clk) begin
      reg105 <= $signed((((wire101[(4'h9):(4'h8)] ? (~|wire95) : wire104) ?
              {$unsigned(wire104)} : wire98) ?
          $unsigned(wire95[(2'h3):(2'h3)]) : ((8'had) & ((~^wire99) ?
              (+wire101) : wire100))));
      if ({(8'hb2)})
        begin
          if (wire104)
            begin
              reg106 <= (|wire95[(2'h3):(2'h2)]);
            end
          else
            begin
              reg106 <= wire97[(3'h4):(2'h2)];
            end
          reg107 <= ((-(~|(~(^~reg106)))) ? (wire95 <= wire96) : wire101);
          reg108 <= (wire99 ?
              wire95 : ($unsigned((~|$signed(reg105))) ?
                  $unsigned((|(wire99 - wire101))) : wire98[(3'h6):(2'h2)]));
        end
      else
        begin
          reg106 <= wire97;
          reg107 <= (($signed(reg102[(3'h5):(1'h1)]) ?
              $unsigned($signed((wire95 ?
                  (8'hbd) : wire101))) : $signed($unsigned(wire97))) >> {(8'hb0),
              (-wire96[(1'h0):(1'h0)])});
          if ((wire97 ?
              reg106 : ((($signed((8'ha7)) * $unsigned(wire101)) ?
                  {$unsigned(reg107)} : reg108[(5'h10):(5'h10)]) <<< (8'ha1))))
            begin
              reg108 <= {reg106};
              reg109 <= (^$unsigned(($unsigned((wire98 * reg108)) ?
                  {wire100[(2'h3):(2'h3)], {reg108}} : {$signed(wire95)})));
            end
          else
            begin
              reg108 <= (~((reg109 ?
                  (wire100 << reg105) : ($unsigned((8'hb2)) - (wire101 >> (8'hb2)))) >= $unsigned((wire95[(3'h4):(2'h3)] ^ (8'hb5)))));
              reg109 <= $unsigned($signed(reg109[(3'h6):(3'h6)]));
              reg110 <= wire101;
              reg111 <= ((wire100[(1'h0):(1'h0)] & $unsigned($signed({wire101}))) ?
                  $signed(reg108[(2'h2):(1'h1)]) : $unsigned(reg103[(1'h1):(1'h0)]));
            end
          reg112 <= $signed((($unsigned(reg102) || reg105) ~^ reg108[(1'h1):(1'h1)]));
        end
    end
  assign wire113 = ((-reg105[(1'h1):(1'h0)]) ?
                       $unsigned($signed(wire97[(3'h4):(2'h2)])) : wire99[(1'h1):(1'h1)]);
  assign wire114 = reg107;
endmodule

module module48
#(parameter param90 = (8'ha2))
(y, clk, wire53, wire52, wire51, wire50, wire49);
  output wire [(32'h1c9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire53;
  input wire signed [(5'h10):(1'h0)] wire52;
  input wire signed [(4'h9):(1'h0)] wire51;
  input wire [(5'h14):(1'h0)] wire50;
  input wire signed [(2'h3):(1'h0)] wire49;
  wire signed [(3'h5):(1'h0)] wire89;
  wire [(5'h13):(1'h0)] wire88;
  wire [(5'h10):(1'h0)] wire85;
  wire signed [(5'h12):(1'h0)] wire84;
  wire signed [(5'h14):(1'h0)] wire83;
  wire [(4'ha):(1'h0)] wire82;
  wire [(5'h10):(1'h0)] wire81;
  wire [(3'h7):(1'h0)] wire80;
  wire [(4'ha):(1'h0)] wire74;
  wire [(5'h13):(1'h0)] wire73;
  wire [(5'h15):(1'h0)] wire72;
  wire [(3'h7):(1'h0)] wire71;
  wire signed [(4'h9):(1'h0)] wire57;
  wire [(3'h5):(1'h0)] wire56;
  wire [(5'h15):(1'h0)] wire55;
  wire signed [(3'h6):(1'h0)] wire54;
  reg [(4'hc):(1'h0)] reg87 = (1'h0);
  reg [(4'hd):(1'h0)] reg86 = (1'h0);
  reg [(5'h14):(1'h0)] reg79 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg77 = (1'h0);
  reg [(3'h4):(1'h0)] reg76 = (1'h0);
  reg [(4'hb):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg70 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg69 = (1'h0);
  reg [(4'he):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg67 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg65 = (1'h0);
  reg [(4'h9):(1'h0)] reg64 = (1'h0);
  reg [(3'h5):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg62 = (1'h0);
  reg [(5'h10):(1'h0)] reg61 = (1'h0);
  reg [(4'hb):(1'h0)] reg60 = (1'h0);
  reg [(3'h4):(1'h0)] reg59 = (1'h0);
  reg [(4'hb):(1'h0)] reg58 = (1'h0);
  assign y = {wire89,
                 wire88,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 reg87,
                 reg86,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
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
                 (1'h0)};
  assign wire54 = ($unsigned(wire50[(1'h1):(1'h0)]) ?
                      wire50 : wire50[(5'h12):(5'h10)]);
  assign wire55 = wire50[(4'he):(3'h7)];
  assign wire56 = (!(^$unsigned($signed($unsigned(wire51)))));
  assign wire57 = wire54[(3'h5):(3'h5)];
  always
    @(posedge clk) begin
      if ($signed((8'ha1)))
        begin
          if ($unsigned((wire56 & ($unsigned($signed(wire52)) ^ $signed(((8'ha2) & wire57))))))
            begin
              reg58 <= (wire49 ?
                  $signed(($unsigned(wire51) < (!((8'haf) ?
                      wire52 : wire49)))) : $signed($signed((|(wire54 ?
                      (8'hbb) : wire52)))));
              reg59 <= (~&wire53);
              reg60 <= wire50;
            end
          else
            begin
              reg58 <= $signed($unsigned((reg58[(2'h3):(2'h2)] != ((~^reg59) ?
                  (reg59 ? wire55 : reg58) : $unsigned(reg60)))));
            end
          reg61 <= (8'hb3);
          reg62 <= {reg61[(4'hd):(3'h4)],
              ($unsigned(reg59) ?
                  ($unsigned((^~wire56)) ?
                      (~&(wire56 ?
                          reg58 : reg60)) : (~&wire57[(3'h5):(2'h3)])) : wire52[(4'hd):(4'h9)])};
          if ({((((wire57 ?
                      wire50 : wire57) <= $unsigned(wire57)) == $unsigned((reg58 * reg62))) ?
                  $signed((wire55[(4'hd):(4'h8)] >>> $signed(reg58))) : wire54)})
            begin
              reg63 <= {reg60[(1'h1):(1'h1)]};
              reg64 <= ({$unsigned(reg58[(2'h3):(2'h2)]),
                  {wire50[(4'hf):(3'h7)],
                      (wire55[(4'hc):(4'h8)] ?
                          (wire51 <= reg60) : $signed(wire51))}} != {(~|({reg58} ?
                      (reg59 >= wire51) : wire57)),
                  (wire55 ~^ (!(~wire54)))});
              reg65 <= reg61;
              reg66 <= wire49[(1'h1):(1'h1)];
            end
          else
            begin
              reg63 <= $unsigned($unsigned((((+wire54) * wire52[(3'h4):(2'h3)]) ?
                  (~^$signed(wire53)) : reg64)));
              reg64 <= (-reg60);
              reg65 <= (+{(7'h44)});
            end
        end
      else
        begin
          reg58 <= (+{(reg58 ^ wire50)});
          reg59 <= {((|wire49) ~^ (8'ha7))};
          reg60 <= ({$signed(((^reg59) >= reg62))} & ({(wire51 << (~reg63)),
                  wire54} ?
              (8'haf) : reg58));
          reg61 <= wire55[(1'h1):(1'h1)];
          reg62 <= reg58;
        end
      reg67 <= (^$unsigned(reg65[(5'h10):(4'hd)]));
      reg68 <= $signed((wire50 < ((-$unsigned(reg61)) ?
          ($signed(wire49) | (wire57 ?
              wire52 : reg62)) : ((-wire50) * reg60))));
      reg69 <= reg59;
      reg70 <= reg65[(4'hd):(3'h4)];
    end
  assign wire71 = $signed(($signed((((8'h9e) ?
                      reg62 : (8'hb4)) <= ((8'haf) || reg68))) ^~ $signed($unsigned($unsigned(reg66)))));
  assign wire72 = (-(8'hb4));
  assign wire73 = reg65[(2'h2):(1'h0)];
  assign wire74 = $signed((reg59[(2'h3):(2'h3)] < $unsigned((reg59 ?
                      $signed(reg66) : reg63))));
  always
    @(posedge clk) begin
      reg75 <= (~&$signed($unsigned(((reg67 ? reg67 : wire71) ^ (reg65 ?
          wire72 : (8'hbd))))));
      reg76 <= $unsigned({wire71, ((wire51 ? reg60 : wire57) << reg58)});
      reg77 <= reg66[(3'h4):(1'h1)];
      reg78 <= ($signed(reg77[(5'h11):(3'h7)]) || reg63);
      reg79 <= ((reg59[(2'h2):(1'h0)] ?
          wire51 : {$signed((wire55 <= (8'haf)))}) > (reg67[(1'h1):(1'h0)] != $signed((wire52[(4'hc):(4'h8)] ?
          $unsigned((8'hb7)) : (reg78 ? reg76 : wire55)))));
    end
  assign wire80 = $unsigned(($unsigned({$signed(wire54)}) < (($signed(wire55) ?
                          (~reg67) : wire73) ?
                      $signed((|reg66)) : wire51[(1'h0):(1'h0)])));
  assign wire81 = (reg70[(2'h3):(2'h3)] ?
                      ((-(7'h43)) != reg68) : $unsigned((reg66[(3'h6):(3'h5)] ?
                          $signed($unsigned(wire52)) : reg58[(3'h6):(2'h2)])));
  assign wire82 = ((wire74 ? reg66[(3'h7):(2'h3)] : (8'ha4)) ?
                      wire49 : $signed($signed($unsigned(reg78[(3'h7):(1'h1)]))));
  assign wire83 = wire50;
  assign wire84 = (($signed({(~&reg58), wire71}) <= $unsigned(((reg70 + reg68) ?
                          {reg59} : wire56[(1'h0):(1'h0)]))) ?
                      wire53[(4'h9):(1'h1)] : reg70[(1'h0):(1'h0)]);
  assign wire85 = reg76[(2'h3):(2'h2)];
  always
    @(posedge clk) begin
      reg86 <= $signed(((|(~^$signed(wire55))) && wire83));
      reg87 <= $unsigned($signed($unsigned(((wire56 ?
          wire74 : reg86) ^~ wire57[(2'h3):(1'h1)]))));
    end
  assign wire88 = (($unsigned($unsigned($unsigned(reg87))) ?
                          (8'ha2) : reg58[(2'h2):(1'h0)]) ?
                      (~&(~^(-$unsigned(wire72)))) : (wire54[(1'h0):(1'h0)] ^~ $signed(wire56)));
  assign wire89 = wire85[(4'hb):(2'h2)];
endmodule

module module16
#(parameter param35 = ((((((7'h42) ? (8'hb8) : (8'haa)) ? {(8'hae), (8'hb3)} : ((8'hbb) ? (8'ha4) : (8'h9c))) >> (|((8'hb0) ? (8'ha5) : (7'h42)))) - (~&(~((8'hb7) * (8'h9d))))) ? {(~&(~^((8'hbe) ? (7'h42) : (8'hb6)))), ((((8'hbf) >>> (8'h9f)) == (8'hac)) <= ((~(8'hb3)) ? (^(8'hbd)) : (~&(8'h9c))))} : (~&((^~((7'h41) + (8'ha5))) || (&(+(8'h9c)))))))
(y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'h9d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire21;
  input wire [(5'h10):(1'h0)] wire20;
  input wire signed [(3'h7):(1'h0)] wire19;
  input wire signed [(4'h8):(1'h0)] wire18;
  input wire [(4'hb):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire34;
  wire signed [(5'h13):(1'h0)] wire33;
  wire [(3'h5):(1'h0)] wire32;
  wire [(4'h9):(1'h0)] wire31;
  wire signed [(3'h5):(1'h0)] wire30;
  wire signed [(5'h15):(1'h0)] wire29;
  wire [(4'hb):(1'h0)] wire28;
  wire [(3'h4):(1'h0)] wire27;
  wire [(3'h6):(1'h0)] wire25;
  wire [(4'h9):(1'h0)] wire24;
  wire [(5'h11):(1'h0)] wire23;
  wire signed [(5'h15):(1'h0)] wire22;
  reg [(4'h8):(1'h0)] reg26 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 reg26,
                 (1'h0)};
  assign wire22 = wire19[(1'h1):(1'h1)];
  assign wire23 = $signed((wire20[(2'h2):(1'h0)] ?
                      $signed((~wire19[(2'h3):(1'h0)])) : ((wire22[(3'h5):(2'h3)] == ((8'ha1) ?
                              wire21 : wire22)) ?
                          ((wire20 >>> wire18) <= $unsigned(wire20)) : $unsigned((wire17 ?
                              wire20 : wire22)))));
  assign wire24 = $signed(wire23);
  assign wire25 = (wire19[(3'h7):(3'h7)] ?
                      wire24 : (wire20[(1'h0):(1'h0)] ?
                          wire23[(1'h1):(1'h1)] : ($signed(wire17) || $unsigned((wire17 ?
                              wire21 : wire23)))));
  always
    @(posedge clk) begin
      reg26 <= $signed(wire23[(4'hf):(4'he)]);
    end
  assign wire27 = (8'hbb);
  assign wire28 = wire17[(2'h3):(1'h0)];
  assign wire29 = (+({$signed((~|wire28))} <<< wire22));
  assign wire30 = wire28[(3'h6):(3'h4)];
  assign wire31 = ($signed((((wire30 > wire28) ?
                      (reg26 ?
                          wire24 : wire29) : (7'h43)) || (8'had))) | (wire18 ?
                      $unsigned(wire28) : $unsigned($unsigned($unsigned(wire30)))));
  assign wire32 = wire31;
  assign wire33 = $signed((($signed((wire20 - wire23)) <<< (-wire31[(2'h3):(2'h2)])) ?
                      (^~(+$unsigned((8'hb8)))) : $signed(wire30)));
  assign wire34 = (~$signed(reg26));
endmodule
