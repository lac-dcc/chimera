module top
#(parameter param144 = ({((((8'ha4) == (7'h42)) >>> ((8'hbe) ? (8'haf) : (8'ha5))) ~^ {(~&(8'haf)), {(8'hbf)}}), ((~&{(7'h40)}) || (8'ha0))} | ({{((8'hab) ? (7'h41) : (8'hb2)), ((8'hba) ? (8'had) : (8'hae))}, ((~^(8'ha8)) - (&(8'hb5)))} ^ (~^(((8'h9f) ? (8'hb1) : (7'h40)) || (-(8'ha8)))))), 
parameter param145 = (|(&((((8'hbe) ? param144 : param144) ? (param144 + (8'ha7)) : (param144 << param144)) ? (&(param144 <= (8'h9c))) : (param144 * (param144 <= param144))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h21c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire signed [(4'hd):(1'h0)] wire143;
  wire signed [(5'h12):(1'h0)] wire142;
  wire signed [(4'hb):(1'h0)] wire141;
  wire [(5'h12):(1'h0)] wire140;
  wire [(4'he):(1'h0)] wire132;
  wire [(4'hc):(1'h0)] wire131;
  wire [(5'h12):(1'h0)] wire130;
  wire [(4'h8):(1'h0)] wire125;
  wire [(4'h9):(1'h0)] wire45;
  wire [(3'h4):(1'h0)] wire44;
  wire [(4'hb):(1'h0)] wire21;
  reg signed [(5'h15):(1'h0)] reg139 = (1'h0);
  reg [(5'h14):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg137 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg136 = (1'h0);
  reg [(3'h6):(1'h0)] reg135 = (1'h0);
  reg [(5'h15):(1'h0)] reg134 = (1'h0);
  reg [(3'h5):(1'h0)] reg133 = (1'h0);
  reg [(4'h8):(1'h0)] reg129 = (1'h0);
  reg [(4'h8):(1'h0)] reg128 = (1'h0);
  reg [(5'h14):(1'h0)] reg127 = (1'h0);
  reg [(5'h13):(1'h0)] reg23 = (1'h0);
  reg [(4'ha):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg28 = (1'h0);
  reg [(4'ha):(1'h0)] reg29 = (1'h0);
  reg [(4'h8):(1'h0)] reg30 = (1'h0);
  reg [(3'h6):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg32 = (1'h0);
  reg [(4'he):(1'h0)] reg33 = (1'h0);
  reg [(5'h15):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg35 = (1'h0);
  reg [(5'h12):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg37 = (1'h0);
  reg [(4'hd):(1'h0)] reg38 = (1'h0);
  reg [(3'h6):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg40 = (1'h0);
  reg [(3'h6):(1'h0)] reg41 = (1'h0);
  reg [(2'h2):(1'h0)] reg42 = (1'h0);
  reg [(5'h12):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg46 = (1'h0);
  reg [(5'h13):(1'h0)] reg47 = (1'h0);
  assign y = {wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire132,
                 wire131,
                 wire130,
                 wire125,
                 wire45,
                 wire44,
                 wire21,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg129,
                 reg128,
                 reg127,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg46,
                 reg47,
                 (1'h0)};
  module4 #() modinst22 (wire21, clk, wire3, wire1, wire2, wire0, (8'ha8));
  always
    @(posedge clk) begin
      if ((-wire2))
        begin
          if (wire3)
            begin
              reg23 <= wire1;
            end
          else
            begin
              reg23 <= (wire2[(4'hb):(3'h6)] * (&($unsigned((wire21 ?
                  wire3 : wire0)) ~^ (wire3 & $signed((8'ha8))))));
              reg24 <= wire0;
              reg25 <= $signed((~|$signed(((reg24 ? reg24 : reg23) - (wire2 ?
                  wire21 : wire21)))));
              reg26 <= (reg23 ?
                  {$signed($unsigned((wire3 ? wire1 : wire21)))} : wire0);
              reg27 <= ($signed((((wire1 << reg24) ?
                      ((8'hb9) ? reg25 : reg26) : reg25[(4'hc):(2'h3)]) ?
                  ((reg25 ?
                      wire3 : (8'hbe)) <= (8'hba)) : $unsigned(wire3))) <<< (~&$unsigned(((8'ha9) < (+wire3)))));
            end
        end
      else
        begin
          if (({(reg25 ^ $signed($unsigned(wire2)))} == ($unsigned($unsigned($signed(wire0))) ^~ (7'h42))))
            begin
              reg23 <= $signed((wire3[(3'h5):(3'h4)] <<< $signed($unsigned($unsigned(wire1)))));
              reg24 <= wire21;
              reg25 <= (~|($unsigned((8'hac)) <<< reg27[(1'h0):(1'h0)]));
              reg26 <= reg25;
              reg27 <= ((((reg27[(2'h2):(1'h1)] ?
                              (^~(8'h9d)) : $unsigned(wire21)) ?
                          $unsigned((reg23 ?
                              wire2 : reg23)) : $unsigned(reg27[(1'h0):(1'h0)])) ?
                      wire3 : (wire1[(5'h13):(3'h4)] ?
                          wire21 : $unsigned($signed(wire21)))) ?
                  {wire1, (~&reg26)} : $unsigned((^~reg25)));
            end
          else
            begin
              reg23 <= {(7'h40),
                  (!(($unsigned(wire0) ~^ wire3[(3'h4):(3'h4)]) << $signed($signed(wire3))))};
              reg24 <= ((~|((~|reg24) ?
                      $unsigned(reg25[(4'he):(4'h9)]) : wire1)) ?
                  $signed(wire2[(4'he):(4'h9)]) : wire2);
              reg25 <= $unsigned((^wire1[(4'h9):(4'h9)]));
            end
          reg28 <= (7'h42);
          reg29 <= (^$unsigned(wire21[(4'h8):(1'h1)]));
          reg30 <= wire3[(1'h0):(1'h0)];
        end
      reg31 <= ((wire0 >> reg26) ~^ (wire0 ?
          wire3 : {reg23[(4'hc):(2'h3)], ((&(7'h44)) > {reg24})}));
      if ((&(&$signed($signed((reg27 ? (8'hbd) : (8'hb9)))))))
        begin
          reg32 <= ($unsigned((^$signed((~|reg23)))) ? $signed(wire2) : wire21);
          reg33 <= (|($unsigned($signed(wire1[(4'h8):(3'h4)])) ?
              $unsigned(wire21) : reg25));
          reg34 <= ((^$signed($signed(wire21[(1'h1):(1'h1)]))) * (^~reg27));
          reg35 <= $unsigned((wire0 ?
              ({(wire0 != reg32), (|reg23)} ? reg24 : wire0) : ((reg24 ?
                      (wire0 | reg26) : (reg28 << reg32)) ?
                  $unsigned({(8'hac)}) : reg27[(1'h0):(1'h0)])));
        end
      else
        begin
          reg32 <= reg27;
        end
      if ($signed($unsigned(reg24)))
        begin
          if ($signed((reg26[(4'hf):(3'h5)] ?
              reg33 : $signed(wire21[(2'h2):(1'h1)]))))
            begin
              reg36 <= (^(wire3 ?
                  (wire1 & $unsigned((8'hb1))) : $unsigned($signed((+reg23)))));
            end
          else
            begin
              reg36 <= $unsigned(reg26[(2'h3):(2'h2)]);
              reg37 <= (^~(wire3[(4'hb):(4'ha)] ?
                  $unsigned(wire0) : reg23[(2'h3):(1'h0)]));
              reg38 <= wire21;
            end
          reg39 <= reg27[(2'h3):(1'h0)];
          if ((^$signed((~|$unsigned(reg26)))))
            begin
              reg40 <= wire0[(2'h2):(1'h0)];
              reg41 <= $signed(reg34);
              reg42 <= $unsigned(reg37);
            end
          else
            begin
              reg40 <= (8'hb5);
            end
        end
      else
        begin
          reg36 <= ($signed($unsigned($unsigned($unsigned(reg32)))) >= reg38[(3'h6):(1'h1)]);
          reg37 <= reg24;
        end
      reg43 <= $unsigned((^~(reg33[(1'h1):(1'h0)] ?
          (8'hba) : $signed($unsigned(reg26)))));
    end
  assign wire44 = $unsigned(reg29[(1'h0):(1'h0)]);
  assign wire45 = $unsigned($signed((reg24[(1'h0):(1'h0)] & ((reg28 >= reg36) ?
                      (reg42 ? wire0 : wire2) : $signed(reg39)))));
  always
    @(posedge clk) begin
      reg46 <= reg29[(3'h5):(1'h0)];
      reg47 <= $signed((~&$unsigned(wire0)));
    end
  module48 #() modinst126 (.wire49(reg33), .wire53(reg43), .clk(clk), .wire51(reg35), .y(wire125), .wire52(reg38), .wire50(reg25));
  always
    @(posedge clk) begin
      reg127 <= reg28;
      reg128 <= reg46[(1'h1):(1'h0)];
      reg129 <= $unsigned($signed(reg128[(1'h0):(1'h0)]));
    end
  assign wire130 = reg32;
  assign wire131 = ($unsigned({({(8'hab), reg36} > (wire44 ? reg46 : (8'h9f))),
                           $unsigned(reg47[(4'ha):(3'h4)])}) ?
                       $signed((({reg46} | $signed(wire2)) ~^ $signed(reg29[(1'h1):(1'h1)]))) : $signed($signed(((~|reg32) ?
                           $unsigned(reg35) : wire0[(3'h6):(2'h3)]))));
  assign wire132 = (reg30 << (reg26 ?
                       wire1 : (((8'ha9) ?
                           wire2 : (wire44 && reg26)) >>> reg41)));
  always
    @(posedge clk) begin
      reg133 <= ($signed($signed((wire0 ? $unsigned(reg39) : (^~wire44)))) ?
          (reg127 ?
              reg36 : ($unsigned(reg40) ?
                  $unsigned((8'ha8)) : $unsigned((+reg32)))) : ($unsigned(reg28) * $signed(((wire132 ?
              wire1 : (8'haf)) <<< (reg39 ? reg40 : wire1)))));
      reg134 <= reg40;
      reg135 <= reg31[(1'h0):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg136 <= $unsigned((&((^~$unsigned(reg42)) ?
          ($unsigned(wire132) ? reg35 : wire131) : $unsigned({wire3}))));
      if ((((&($unsigned(reg23) & reg38)) && reg30[(2'h3):(2'h3)]) ?
          ($unsigned($unsigned((wire0 ?
              reg27 : wire131))) != reg27[(3'h4):(1'h1)]) : reg136[(3'h6):(2'h2)]))
        begin
          reg137 <= (((8'ha1) || ($signed($unsigned(wire3)) ^~ ((~&wire0) ?
              $signed((8'hba)) : (reg134 | wire2)))) && (!{(!wire0), wire45}));
        end
      else
        begin
          reg137 <= $signed(reg42[(1'h0):(1'h0)]);
        end
      reg138 <= $unsigned((8'ha0));
      reg139 <= (^~$signed($signed($unsigned((reg33 ? reg40 : (8'ha3))))));
    end
  assign wire140 = $unsigned((^($unsigned(reg26[(1'h1):(1'h0)]) ?
                       reg42 : (reg34[(4'ha):(2'h3)] ^ (reg138 != wire21)))));
  assign wire141 = wire2;
  assign wire142 = (8'ha4);
  assign wire143 = ({$unsigned(((^reg137) ^~ reg36[(1'h1):(1'h0)])),
                       ($signed((^~(8'hab))) <= $signed((reg43 ?
                           reg139 : reg28)))} | $signed($unsigned($signed(reg128))));
endmodule

module module48
#(parameter param123 = ((~(8'hab)) > (-(8'ha5))), 
parameter param124 = param123)
(y, clk, wire49, wire50, wire51, wire52, wire53);
  output wire [(32'h5b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire49;
  input wire [(3'h6):(1'h0)] wire50;
  input wire [(5'h15):(1'h0)] wire51;
  input wire [(4'hd):(1'h0)] wire52;
  input wire signed [(5'h12):(1'h0)] wire53;
  wire signed [(4'h9):(1'h0)] wire122;
  wire signed [(2'h2):(1'h0)] wire121;
  wire [(5'h11):(1'h0)] wire54;
  wire signed [(4'he):(1'h0)] wire55;
  wire [(5'h12):(1'h0)] wire56;
  wire signed [(5'h13):(1'h0)] wire57;
  wire signed [(4'hb):(1'h0)] wire119;
  assign y = {wire122,
                 wire121,
                 wire54,
                 wire55,
                 wire56,
                 wire57,
                 wire119,
                 (1'h0)};
  assign wire54 = wire53[(4'h9):(3'h4)];
  assign wire55 = ((wire53 == wire49[(4'hd):(1'h1)]) <= $signed(wire51));
  assign wire56 = $signed($unsigned((~&$unsigned(wire54[(3'h7):(1'h0)]))));
  assign wire57 = (wire49[(3'h4):(2'h2)] ?
                      (wire50[(3'h6):(3'h5)] << (|((~^wire50) ?
                          (~^wire49) : $signed(wire55)))) : ({(wire50 ?
                                  {wire53, (8'hb2)} : wire52[(2'h3):(2'h3)])} ?
                          wire51 : wire54));
  module58 #() modinst120 (wire119, clk, wire52, wire53, wire51, wire49, wire57);
  assign wire121 = $unsigned(((wire53 * ($signed(wire57) ?
                           wire51[(5'h10):(3'h5)] : wire56[(3'h5):(1'h0)])) ?
                       {$unsigned((wire57 ? wire49 : wire51)),
                           (!(wire57 ?
                               wire55 : wire50))} : wire56[(1'h0):(1'h0)]));
  assign wire122 = {(~|{$unsigned((-wire49))}), wire119};
endmodule

module module4  (y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h87):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire9;
  input wire [(5'h15):(1'h0)] wire8;
  input wire signed [(5'h11):(1'h0)] wire7;
  input wire signed [(4'h9):(1'h0)] wire6;
  input wire [(3'h7):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire20;
  wire [(4'hc):(1'h0)] wire19;
  wire signed [(4'he):(1'h0)] wire13;
  wire signed [(5'h11):(1'h0)] wire12;
  wire [(5'h10):(1'h0)] wire11;
  wire [(2'h2):(1'h0)] wire10;
  reg [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(3'h5):(1'h0)] reg17 = (1'h0);
  reg [(4'hb):(1'h0)] reg16 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg [(3'h5):(1'h0)] reg14 = (1'h0);
  assign y = {wire20,
                 wire19,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 (1'h0)};
  assign wire10 = (^wire9);
  assign wire11 = $unsigned($unsigned($signed(wire8[(4'he):(3'h6)])));
  assign wire12 = $unsigned(wire10[(1'h1):(1'h0)]);
  assign wire13 = $unsigned({(-wire12[(4'ha):(4'h8)])});
  always
    @(posedge clk) begin
      reg14 <= (8'ha4);
      reg15 <= (!{$unsigned(($unsigned(wire10) ?
              (wire10 ? wire5 : wire5) : $unsigned(wire5)))});
      reg16 <= wire5;
      reg17 <= wire5;
      reg18 <= (+{$unsigned(($signed(wire10) ?
              (wire5 ? wire11 : wire8) : reg14[(3'h5):(1'h1)]))});
    end
  assign wire19 = (|reg18);
  assign wire20 = (|{((8'hbb) ~^ ((wire13 ? reg14 : wire12) - (-wire13))),
                      reg18});
endmodule

module module58
#(parameter param118 = (8'h9d))
(y, clk, wire63, wire62, wire61, wire60, wire59);
  output wire [(32'h1f1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire63;
  input wire signed [(5'h12):(1'h0)] wire62;
  input wire signed [(5'h15):(1'h0)] wire61;
  input wire signed [(2'h3):(1'h0)] wire60;
  input wire signed [(5'h13):(1'h0)] wire59;
  wire signed [(4'hf):(1'h0)] wire116;
  wire signed [(2'h2):(1'h0)] wire115;
  wire [(5'h10):(1'h0)] wire109;
  wire signed [(4'h9):(1'h0)] wire99;
  wire [(2'h2):(1'h0)] wire98;
  wire signed [(4'ha):(1'h0)] wire97;
  wire signed [(4'h8):(1'h0)] wire95;
  wire [(2'h2):(1'h0)] wire85;
  wire [(2'h3):(1'h0)] wire84;
  wire [(2'h2):(1'h0)] wire83;
  wire [(3'h6):(1'h0)] wire82;
  wire signed [(5'h12):(1'h0)] wire64;
  reg [(2'h2):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg114 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg113 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg111 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg110 = (1'h0);
  reg [(2'h2):(1'h0)] reg108 = (1'h0);
  reg [(4'hc):(1'h0)] reg107 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg105 = (1'h0);
  reg [(3'h7):(1'h0)] reg104 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg102 = (1'h0);
  reg [(2'h2):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg96 = (1'h0);
  reg [(4'hd):(1'h0)] reg94 = (1'h0);
  reg [(3'h4):(1'h0)] reg93 = (1'h0);
  reg [(4'hb):(1'h0)] reg92 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg91 = (1'h0);
  reg [(3'h5):(1'h0)] reg90 = (1'h0);
  reg [(4'hf):(1'h0)] reg89 = (1'h0);
  reg [(4'ha):(1'h0)] reg88 = (1'h0);
  reg [(4'h9):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg86 = (1'h0);
  reg [(5'h11):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg80 = (1'h0);
  reg [(2'h2):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg78 = (1'h0);
  reg [(4'hb):(1'h0)] reg77 = (1'h0);
  reg [(4'h9):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg75 = (1'h0);
  reg signed [(4'he):(1'h0)] reg74 = (1'h0);
  reg [(4'h8):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg72 = (1'h0);
  reg [(3'h7):(1'h0)] reg71 = (1'h0);
  reg [(5'h13):(1'h0)] reg70 = (1'h0);
  reg [(2'h2):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg68 = (1'h0);
  reg [(4'hf):(1'h0)] reg67 = (1'h0);
  reg [(3'h6):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg65 = (1'h0);
  assign y = {wire116,
                 wire115,
                 wire109,
                 wire99,
                 wire98,
                 wire97,
                 wire95,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire64,
                 reg117,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg96,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
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
                 (1'h0)};
  assign wire64 = $unsigned((($signed((wire59 ?
                          wire59 : wire59)) ^ wire63[(4'h8):(2'h3)]) ?
                      $unsigned((~&$signed(wire61))) : $signed(((~wire62) * {wire61}))));
  always
    @(posedge clk) begin
      if (((($unsigned((~^wire60)) != $unsigned((wire62 < wire59))) != $unsigned(wire60[(1'h0):(1'h0)])) > (wire59 + ((~(~|wire60)) >= wire63[(3'h4):(1'h0)]))))
        begin
          reg65 <= wire59;
          if ($signed($signed(wire61[(5'h13):(3'h4)])))
            begin
              reg66 <= wire62[(4'ha):(4'h8)];
              reg67 <= wire59[(4'hc):(1'h0)];
            end
          else
            begin
              reg66 <= $signed(wire62);
              reg67 <= wire63[(3'h5):(1'h0)];
              reg68 <= (8'hb0);
              reg69 <= wire62;
            end
        end
      else
        begin
          if ($signed((~&wire61[(3'h5):(3'h4)])))
            begin
              reg65 <= ((-$unsigned((8'ha4))) >>> wire63);
              reg66 <= $signed($unsigned({((~^reg68) ?
                      $unsigned(reg68) : $unsigned(reg65))}));
              reg67 <= $signed($unsigned($unsigned((8'h9d))));
              reg68 <= (~^$signed((|(reg65 ~^ (wire63 ? reg66 : (8'h9d))))));
            end
          else
            begin
              reg65 <= $unsigned($unsigned($signed(($unsigned((8'hb1)) ^ wire63[(3'h4):(2'h2)]))));
              reg66 <= reg69;
              reg67 <= $signed(wire64);
              reg68 <= {(&wire60)};
              reg69 <= $unsigned({$unsigned($unsigned((-reg66))),
                  (~(wire61 ?
                      ((8'h9f) + wire59) : (wire61 ? reg67 : wire64)))});
            end
          reg70 <= wire62[(3'h4):(1'h0)];
          reg71 <= reg67;
        end
      reg72 <= $signed($signed((^~$signed(wire59))));
      reg73 <= reg66;
      if ($unsigned((~|reg67)))
        begin
          reg74 <= (!$unsigned(($signed($signed(reg68)) ?
              (^((8'hab) >> reg70)) : (&(^~(8'hbb))))));
          reg75 <= (~^$unsigned(reg70[(4'hd):(4'hd)]));
          reg76 <= $signed((^reg75[(1'h1):(1'h0)]));
          if ({$signed((($unsigned(wire61) >= {wire60, reg71}) ?
                  wire63 : {(reg68 == reg66)}))})
            begin
              reg77 <= {$unsigned($signed((8'hb8)))};
              reg78 <= reg68[(4'hd):(2'h3)];
              reg79 <= {((^~(~|(7'h41))) - reg67)};
              reg80 <= (^~$signed((^~$signed({reg70, wire59}))));
              reg81 <= $signed((reg67[(4'h8):(3'h4)] != ($unsigned($signed(reg78)) != (~^$unsigned(reg78)))));
            end
          else
            begin
              reg77 <= $unsigned((~&({{wire63}, {(8'hb0)}} ?
                  reg79[(2'h2):(1'h1)] : $unsigned($unsigned(wire61)))));
              reg78 <= (-wire64);
              reg79 <= reg73;
              reg80 <= $signed(wire60[(2'h3):(1'h1)]);
            end
        end
      else
        begin
          reg74 <= $signed($signed($unsigned($unsigned($signed(reg74)))));
          reg75 <= reg74[(2'h3):(2'h3)];
          reg76 <= $unsigned({wire60});
          if (($unsigned($signed(($unsigned(wire64) ?
              $unsigned(reg79) : (reg70 ? reg75 : wire63)))) < reg78))
            begin
              reg77 <= (($signed($unsigned((&(8'hb8)))) * $unsigned((!$unsigned(wire60)))) ?
                  reg69 : wire62[(2'h3):(2'h2)]);
              reg78 <= reg81;
              reg79 <= (^$signed($signed(reg74)));
              reg80 <= reg70[(4'ha):(3'h7)];
              reg81 <= (+{$signed(((8'h9e) ?
                      ((8'hb5) ? (8'ha4) : reg65) : reg65)),
                  ($unsigned($signed(reg67)) ?
                      (~^(|reg76)) : wire63[(2'h2):(1'h1)])});
            end
          else
            begin
              reg77 <= $signed(wire60[(2'h3):(1'h1)]);
              reg78 <= $signed({($unsigned($signed((8'hb0))) == ((reg74 ?
                      reg77 : reg66) ^ (8'hbe)))});
              reg79 <= $unsigned($unsigned($unsigned(wire64)));
              reg80 <= wire61[(5'h11):(4'hd)];
            end
        end
    end
  assign wire82 = (~&$unsigned(({(&(8'ha7)), wire62} ?
                      ({wire60, wire62} & reg77[(4'h8):(4'h8)]) : (reg66 ?
                          reg81 : (reg80 < reg72)))));
  assign wire83 = {$unsigned($unsigned(reg76))};
  assign wire84 = $signed((-(wire63 ?
                      $unsigned(reg76) : (((8'h9d) ? wire82 : reg70) ?
                          (~reg71) : $unsigned(wire83)))));
  assign wire85 = (^(+{($unsigned((8'ha5)) ?
                          $signed(reg71) : (reg70 ? reg77 : (8'ha9))),
                      reg75[(4'he):(4'hc)]}));
  always
    @(posedge clk) begin
      reg86 <= (-((^~$signed((+reg73))) != ((+reg77[(2'h2):(1'h0)]) * $signed((wire64 - wire83)))));
      if ({{({$unsigned(wire61)} >>> (&reg71)),
              (wire61[(3'h6):(3'h4)] >= ((!reg71) ?
                  $signed(reg65) : (~reg69)))}})
        begin
          reg87 <= wire83[(1'h0):(1'h0)];
          if ($unsigned(({$unsigned($signed(reg65)),
                  $signed($unsigned(reg66))} ?
              (reg70[(3'h7):(3'h7)] <<< reg74[(1'h0):(1'h0)]) : reg71[(2'h3):(2'h2)])))
            begin
              reg88 <= (^~$signed(reg65));
              reg89 <= {wire85[(1'h0):(1'h0)]};
              reg90 <= wire62;
            end
          else
            begin
              reg88 <= $unsigned((~($unsigned({wire84, reg79}) ?
                  reg90[(2'h3):(2'h2)] : $unsigned($unsigned(reg90)))));
              reg89 <= (wire62[(4'h8):(2'h3)] ?
                  $signed($unsigned(((~|(8'hba)) || (-reg65)))) : reg89[(4'hd):(1'h1)]);
              reg90 <= {($unsigned(reg81) ?
                      $unsigned($signed($unsigned((8'hbd)))) : $unsigned($unsigned($signed(reg81))))};
              reg91 <= $signed((wire82[(1'h1):(1'h1)] ?
                  reg78[(1'h0):(1'h0)] : {(+{reg75}), reg90}));
            end
          reg92 <= reg90[(2'h2):(1'h1)];
        end
      else
        begin
          if ((($unsigned(wire61) << {wire85[(1'h1):(1'h1)],
              reg68}) >= (~^(((reg65 | reg66) - ((8'hbe) != (8'hb0))) < $unsigned((wire83 ?
              (8'ha9) : wire59))))))
            begin
              reg87 <= wire62;
            end
          else
            begin
              reg87 <= wire64;
              reg88 <= {$unsigned((^(~$unsigned((8'h9f))))),
                  (reg90[(1'h1):(1'h0)] ?
                      (8'haa) : ((8'hb6) * $unsigned((8'haa))))};
              reg89 <= wire59;
              reg90 <= ($unsigned(({{(8'h9c)}, $signed(wire83)} ?
                  $signed((wire64 >> reg80)) : $signed($signed(reg74)))) ^~ ((&($unsigned(reg90) != $signed(reg70))) ?
                  $signed(wire61) : (($unsigned((8'hbe)) ?
                      $signed((7'h40)) : wire64) ^ (wire82 || (8'hb4)))));
            end
          reg91 <= reg89[(1'h0):(1'h0)];
          reg92 <= reg79;
        end
      reg93 <= $signed({reg68, $signed($signed((wire84 ? wire61 : reg91)))});
      reg94 <= $unsigned(({(-reg87),
          $signed((reg65 ?
              wire83 : reg71))} << ((&$signed(reg81)) && reg93[(1'h0):(1'h0)])));
    end
  assign wire95 = reg86;
  always
    @(posedge clk) begin
      reg96 <= (|reg80[(1'h1):(1'h0)]);
    end
  assign wire97 = ($unsigned(wire95[(2'h3):(1'h0)]) >> wire84[(2'h2):(1'h0)]);
  assign wire98 = ((^~$signed($signed((wire62 ? reg69 : reg81)))) + reg78);
  assign wire99 = reg73[(3'h7):(2'h2)];
  always
    @(posedge clk) begin
      reg100 <= $unsigned(((8'ha7) ~^ reg78[(3'h4):(1'h0)]));
      if ($unsigned((reg70[(1'h1):(1'h0)] >= ((wire59[(3'h6):(1'h1)] && reg68) ?
          (reg66[(2'h3):(2'h2)] & (8'hae)) : reg76[(3'h4):(3'h4)]))))
        begin
          if (reg81)
            begin
              reg101 <= $unsigned($signed(reg96));
              reg102 <= reg65[(1'h1):(1'h0)];
              reg103 <= {(reg76 < (~^wire63)), {{wire62}}};
              reg104 <= reg101[(1'h0):(1'h0)];
            end
          else
            begin
              reg101 <= ($unsigned((reg102[(1'h0):(1'h0)] | reg87[(2'h3):(2'h2)])) && (-(&$signed($unsigned(reg71)))));
              reg102 <= reg74;
              reg103 <= ((reg81[(4'hd):(1'h1)] ?
                      (((~reg91) ?
                          $signed(reg88) : (~&reg104)) < $unsigned(((8'ha5) ?
                          reg100 : reg75))) : $unsigned(($signed(reg71) ^ $unsigned(reg75)))) ?
                  $unsigned($unsigned($unsigned($signed(reg91)))) : $unsigned((|$unsigned(reg93[(1'h0):(1'h0)]))));
              reg104 <= wire61[(2'h2):(2'h2)];
            end
          if ($unsigned($unsigned((8'ha0))))
            begin
              reg105 <= (reg68[(2'h2):(1'h1)] ?
                  {(reg96 ? $unsigned($unsigned(reg79)) : wire83),
                      $signed(reg88[(3'h4):(2'h3)])} : reg65);
              reg106 <= reg100[(3'h4):(1'h1)];
              reg107 <= ($signed((({wire85, reg77} ?
                  (reg92 ?
                      reg93 : reg100) : (~reg68)) * reg72[(2'h2):(1'h1)])) | wire62[(1'h0):(1'h0)]);
            end
          else
            begin
              reg105 <= $signed(((8'hb0) & $unsigned(($signed(reg89) ?
                  (!(8'hbd)) : reg80))));
            end
        end
      else
        begin
          reg101 <= $unsigned($signed($unsigned((!$signed(reg92)))));
        end
      reg108 <= $signed(reg96[(2'h3):(2'h3)]);
    end
  assign wire109 = $signed({reg71[(3'h6):(1'h0)], reg66});
  always
    @(posedge clk) begin
      reg110 <= (reg102[(4'h9):(4'h9)] ?
          $unsigned((wire61 ?
              ($signed(wire62) <<< (-reg92)) : reg79[(1'h1):(1'h1)])) : reg71[(3'h6):(3'h4)]);
      if (reg67[(4'hd):(4'ha)])
        begin
          reg111 <= $unsigned(reg81[(4'h9):(3'h4)]);
          reg112 <= (wire83 ?
              $signed((((reg69 ^ reg88) ?
                  {wire109, (8'hb1)} : reg79) - reg81)) : $unsigned(reg76));
          reg113 <= (8'hb4);
          reg114 <= {reg75};
        end
      else
        begin
          reg111 <= (+reg103[(4'hc):(2'h3)]);
          reg112 <= $signed($signed($signed(reg96)));
          reg113 <= (~($signed($unsigned(reg108[(2'h2):(1'h0)])) ^~ (reg80 - (-(~|wire84)))));
          reg114 <= $signed((reg96 >= {wire84[(1'h1):(1'h1)],
              ({reg113} * $unsigned(wire84))}));
        end
    end
  assign wire115 = reg66;
  assign wire116 = {$unsigned($unsigned(((reg75 ? reg91 : reg80) << ((8'hb7) ?
                           (8'ha1) : reg66))))};
  always
    @(posedge clk) begin
      reg117 <= reg70[(3'h4):(2'h3)];
    end
endmodule
