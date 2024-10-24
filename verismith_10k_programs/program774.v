module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h59):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire4;
  wire [(2'h3):(1'h0)] wire188;
  wire signed [(5'h13):(1'h0)] wire142;
  wire [(5'h12):(1'h0)] wire6;
  wire signed [(4'hb):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire140;
  reg [(5'h15):(1'h0)] reg5 = (1'h0);
  assign y = {wire188, wire142, wire6, wire7, wire140, reg5, (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= (^wire4[(3'h4):(2'h3)]);
    end
  assign wire6 = ((^~$unsigned(($signed(wire4) ?
                     (reg5 ?
                         wire0 : (8'ha7)) : wire4[(2'h2):(2'h2)]))) ^ ($unsigned((8'haa)) ?
                     (($unsigned((8'hab)) ?
                         (|wire4) : {reg5,
                             wire0}) && ((~^(7'h41)) >= $signed(wire0))) : reg5));
  assign wire7 = $signed(({{(wire0 <<< reg5)}} > (+$signed(wire3[(3'h6):(1'h0)]))));
  module8 #() modinst141 (wire140, clk, wire2, wire3, wire7, wire1, wire4);
  assign wire142 = {wire2[(4'hf):(3'h7)]};
  module143 #() modinst189 (.y(wire188), .wire146(wire6), .wire144(reg5), .clk(clk), .wire148(wire142), .wire145(wire0), .wire147(wire7));
endmodule

module module143
#(parameter param186 = ((({{(8'ha7), (7'h41)}, ((8'hbb) ? (8'h9e) : (8'hbe))} ? ((~^(8'ha0)) & {(8'ha9)}) : ((-(8'hbe)) * ((8'haa) || (8'ha7)))) + ((((8'hb8) ? (8'h9f) : (8'hb4)) <= ((8'hb7) ? (8'ha5) : (8'h9c))) + {((8'hb0) ~^ (8'hbf))})) ? (-{(~((8'ha9) ? (8'haf) : (8'hb6))), (((8'ha2) <<< (8'ha2)) >> ((8'h9c) + (8'haa)))}) : ((({(8'ha7)} ? (8'ha4) : ((8'haa) ? (8'h9e) : (8'had))) ^~ (((7'h40) ? (8'haa) : (8'hbf)) ~^ (~^(7'h44)))) ? ({((8'haf) ? (7'h42) : (8'haa)), ((8'hbf) ^~ (8'hbb))} ? ((|(8'hb6)) << ((7'h40) ? (8'had) : (8'ha7))) : (((8'had) || (8'ha8)) ? ((8'hb8) ? (8'hb8) : (8'ha8)) : ((7'h43) > (7'h43)))) : ((((8'hba) ? (8'hb5) : (8'ha6)) == ((8'ha5) ^~ (8'had))) ? {((7'h43) == (7'h40)), (8'h9d)} : (~&(8'h9e))))), 
parameter param187 = param186)
(y, clk, wire148, wire147, wire146, wire145, wire144);
  output wire [(32'hd2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire148;
  input wire [(4'hb):(1'h0)] wire147;
  input wire signed [(5'h12):(1'h0)] wire146;
  input wire [(5'h14):(1'h0)] wire145;
  input wire signed [(5'h15):(1'h0)] wire144;
  wire signed [(4'ha):(1'h0)] wire185;
  wire signed [(3'h7):(1'h0)] wire184;
  wire [(5'h13):(1'h0)] wire183;
  wire signed [(3'h4):(1'h0)] wire182;
  wire signed [(3'h7):(1'h0)] wire179;
  wire signed [(5'h14):(1'h0)] wire178;
  wire [(5'h14):(1'h0)] wire168;
  reg [(5'h15):(1'h0)] reg181 = (1'h0);
  reg [(4'hc):(1'h0)] reg180 = (1'h0);
  reg [(3'h7):(1'h0)] reg177 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg176 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg175 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg174 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg173 = (1'h0);
  reg [(4'hf):(1'h0)] reg172 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg171 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg170 = (1'h0);
  assign y = {wire185,
                 wire184,
                 wire183,
                 wire182,
                 wire179,
                 wire178,
                 wire168,
                 reg181,
                 reg180,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 (1'h0)};
  module149 #() modinst169 (wire168, clk, wire148, wire145, wire144, wire146);
  always
    @(posedge clk) begin
      reg170 <= wire145;
      reg171 <= wire144[(4'hf):(2'h2)];
      if ((~&(|wire144)))
        begin
          reg172 <= wire146[(4'hd):(1'h1)];
          reg173 <= ((($signed({reg170, wire146}) ?
                  {(wire146 ? wire168 : reg171),
                      (~^wire146)} : (+wire168)) && $signed(((wire168 ?
                      reg170 : reg172) ?
                  $unsigned((8'hae)) : reg170))) ?
              {$unsigned((wire146[(2'h3):(2'h3)] << ((8'haa) ^~ wire168))),
                  ($unsigned(reg172[(4'hf):(4'hb)]) >>> ((^(8'hbf)) | reg170))} : (7'h44));
          reg174 <= $unsigned(($signed(wire146[(5'h10):(4'h8)]) ?
              $signed((~&(~&reg172))) : $unsigned(wire146[(4'ha):(3'h6)])));
          reg175 <= wire144[(3'h7):(3'h5)];
        end
      else
        begin
          reg172 <= $unsigned((-wire147[(3'h5):(3'h4)]));
          reg173 <= reg171[(4'h9):(3'h7)];
        end
      reg176 <= (~^$signed($signed(wire168)));
      reg177 <= (!reg175);
    end
  assign wire178 = reg175[(4'h9):(4'h8)];
  assign wire179 = (((|(wire148 ? (wire146 ? (7'h42) : wire178) : reg172)) ?
                       wire145[(4'hb):(3'h5)] : (&((reg173 + reg173) << $signed(reg174)))) ^ $unsigned(((|$signed(wire178)) ?
                       $signed((reg172 >> wire148)) : $signed($signed(reg171)))));
  always
    @(posedge clk) begin
      reg180 <= (reg173 == wire144);
      reg181 <= $unsigned(($signed({$unsigned(reg177), reg173}) ?
          $signed($unsigned({wire145, reg170})) : ((~^(reg175 ?
                  (8'hb1) : (7'h42))) ?
              reg173[(2'h2):(1'h0)] : ((wire179 | (8'ha4)) >>> (reg180 >>> wire147)))));
    end
  assign wire182 = wire145;
  assign wire183 = (($unsigned((~^(wire147 || (8'hbc)))) * $signed(reg172[(4'hd):(4'ha)])) ?
                       wire145 : wire145);
  assign wire184 = $unsigned({((8'ha2) <= wire179[(3'h5):(3'h4)]),
                       wire144[(2'h2):(2'h2)]});
  assign wire185 = $unsigned((($unsigned(reg172[(4'hd):(3'h7)]) ?
                       (+wire148[(2'h2):(1'h1)]) : $signed({wire184})) >>> {wire146[(1'h0):(1'h0)]}));
endmodule

module module8
#(parameter param139 = (((^(((8'ha0) ? (8'hb4) : (7'h42)) > {(8'ha8), (7'h44)})) || (+((~&(8'hbd)) ? (^~(8'hac)) : ((8'hb2) ? (8'hb2) : (8'h9c))))) && (8'hb0)))
(y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'hcc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire13;
  input wire signed [(5'h15):(1'h0)] wire12;
  input wire signed [(4'ha):(1'h0)] wire11;
  input wire signed [(4'hb):(1'h0)] wire10;
  input wire signed [(4'hb):(1'h0)] wire9;
  wire signed [(2'h2):(1'h0)] wire138;
  wire signed [(4'h9):(1'h0)] wire137;
  wire signed [(4'ha):(1'h0)] wire43;
  wire signed [(5'h13):(1'h0)] wire25;
  wire signed [(4'hc):(1'h0)] wire24;
  wire signed [(4'hc):(1'h0)] wire23;
  wire [(5'h11):(1'h0)] wire22;
  wire [(3'h6):(1'h0)] wire21;
  wire [(5'h12):(1'h0)] wire17;
  wire signed [(5'h11):(1'h0)] wire135;
  reg signed [(3'h6):(1'h0)] reg14 = (1'h0);
  reg [(5'h15):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg18 = (1'h0);
  reg signed [(4'he):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg20 = (1'h0);
  assign y = {wire138,
                 wire137,
                 wire43,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire17,
                 wire135,
                 reg14,
                 reg15,
                 reg16,
                 reg18,
                 reg19,
                 reg20,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg14 <= $signed(wire10[(3'h6):(3'h5)]);
      reg15 <= wire13;
      reg16 <= ((~^(((wire9 ? wire9 : reg14) ?
                  {wire12, wire12} : (wire9 ? wire13 : reg15)) ?
              wire13 : ({reg14, wire12} != (!(8'h9e))))) ?
          wire10 : $signed(wire10[(4'h9):(2'h2)]));
    end
  assign wire17 = wire13;
  always
    @(posedge clk) begin
      reg18 <= (wire13[(5'h10):(1'h0)] ?
          $unsigned({{{reg16, wire17},
                  wire12[(3'h6):(2'h3)]}}) : (~(reg16[(4'hc):(3'h4)] ?
              wire17 : (((8'ha7) >>> wire9) ^ $unsigned(reg16)))));
      reg19 <= {(~|(+reg16))};
      reg20 <= (8'hac);
    end
  assign wire21 = reg16;
  assign wire22 = $unsigned((-$signed(((~&reg19) <<< $unsigned((8'hbf))))));
  assign wire23 = ($unsigned(wire11) ?
                      ($unsigned(wire13) <= wire13) : (wire11[(3'h4):(2'h3)] >= $unsigned((~^((8'ha3) <= wire10)))));
  assign wire24 = $signed({wire17, wire23});
  assign wire25 = $signed((~&$signed($signed(((8'ha1) << wire9)))));
  module26 #() modinst44 (.wire30(reg20), .wire29(wire17), .y(wire43), .wire28(wire9), .wire27(wire13), .clk(clk));
  module45 #() modinst136 (.wire49(wire23), .clk(clk), .y(wire135), .wire48(wire12), .wire47(wire25), .wire46(wire13), .wire50(wire24));
  assign wire137 = (!((($unsigned(wire22) ~^ $unsigned(reg14)) <= $unsigned(wire10[(3'h6):(1'h1)])) ?
                       wire22[(5'h11):(5'h11)] : {(&(wire43 ? wire13 : wire22)),
                           (wire10[(4'h8):(1'h1)] >>> (reg14 ?
                               (8'ha6) : reg18))}));
  assign wire138 = reg19[(4'he):(3'h7)];
endmodule

module module45
#(parameter param133 = (^~(((((8'hba) ? (7'h41) : (8'hba)) ? ((8'h9d) ? (8'hbb) : (8'hb3)) : ((8'ha7) | (8'h9e))) ? ((^~(8'h9e)) ? (~&(8'hb9)) : ((8'hab) ? (8'hb2) : (7'h42))) : ((~(8'hb0)) + ((8'ha3) ^~ (8'hb2)))) ^~ ((((8'hbf) ? (8'hbf) : (8'hbb)) ? ((8'hbe) ? (8'ha4) : (8'hbe)) : ((7'h41) ? (8'hb8) : (8'hba))) > ({(7'h42)} ? (8'haa) : (+(8'hba)))))), 
parameter param134 = (param133 ? ((~&(param133 << param133)) ? (param133 ? param133 : (~^{param133, param133})) : ((param133 ? (param133 ? param133 : param133) : (8'hae)) | (param133 >= (param133 && (8'hb9))))) : param133))
(y, clk, wire50, wire49, wire48, wire47, wire46);
  output wire [(32'h399):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire50;
  input wire signed [(4'h8):(1'h0)] wire49;
  input wire signed [(4'hf):(1'h0)] wire48;
  input wire signed [(5'h13):(1'h0)] wire47;
  input wire signed [(4'hb):(1'h0)] wire46;
  wire [(3'h4):(1'h0)] wire113;
  wire [(4'hb):(1'h0)] wire112;
  wire [(4'h9):(1'h0)] wire111;
  wire signed [(4'hd):(1'h0)] wire103;
  wire signed [(4'hd):(1'h0)] wire80;
  wire signed [(2'h2):(1'h0)] wire79;
  wire signed [(5'h11):(1'h0)] wire78;
  wire signed [(3'h4):(1'h0)] wire77;
  wire [(4'hf):(1'h0)] wire76;
  wire signed [(5'h15):(1'h0)] wire75;
  wire signed [(2'h2):(1'h0)] wire51;
  reg [(5'h14):(1'h0)] reg132 = (1'h0);
  reg [(3'h5):(1'h0)] reg131 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg130 = (1'h0);
  reg [(3'h7):(1'h0)] reg129 = (1'h0);
  reg [(3'h6):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg127 = (1'h0);
  reg [(4'hd):(1'h0)] reg126 = (1'h0);
  reg [(3'h5):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg124 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg122 = (1'h0);
  reg [(5'h11):(1'h0)] reg121 = (1'h0);
  reg [(4'hd):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg119 = (1'h0);
  reg signed [(4'he):(1'h0)] reg118 = (1'h0);
  reg [(5'h11):(1'h0)] reg117 = (1'h0);
  reg [(4'h8):(1'h0)] reg116 = (1'h0);
  reg [(4'he):(1'h0)] reg115 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg114 = (1'h0);
  reg signed [(4'he):(1'h0)] reg110 = (1'h0);
  reg [(5'h12):(1'h0)] reg109 = (1'h0);
  reg [(4'h8):(1'h0)] reg108 = (1'h0);
  reg [(5'h13):(1'h0)] reg107 = (1'h0);
  reg [(2'h2):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg104 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg102 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg101 = (1'h0);
  reg [(5'h12):(1'h0)] reg100 = (1'h0);
  reg [(3'h4):(1'h0)] reg99 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg98 = (1'h0);
  reg [(5'h13):(1'h0)] reg97 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg95 = (1'h0);
  reg [(4'h9):(1'h0)] reg94 = (1'h0);
  reg [(5'h11):(1'h0)] reg93 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg92 = (1'h0);
  reg [(3'h7):(1'h0)] reg91 = (1'h0);
  reg [(3'h6):(1'h0)] reg90 = (1'h0);
  reg [(2'h3):(1'h0)] reg89 = (1'h0);
  reg [(5'h11):(1'h0)] reg88 = (1'h0);
  reg [(4'h9):(1'h0)] reg87 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg86 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg85 = (1'h0);
  reg [(5'h11):(1'h0)] reg84 = (1'h0);
  reg [(5'h14):(1'h0)] reg83 = (1'h0);
  reg [(2'h2):(1'h0)] reg82 = (1'h0);
  reg [(4'hc):(1'h0)] reg81 = (1'h0);
  reg [(5'h15):(1'h0)] reg74 = (1'h0);
  reg [(4'h8):(1'h0)] reg73 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg72 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg71 = (1'h0);
  reg [(3'h4):(1'h0)] reg70 = (1'h0);
  reg [(4'he):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg67 = (1'h0);
  reg [(5'h13):(1'h0)] reg66 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg65 = (1'h0);
  reg [(4'h9):(1'h0)] reg64 = (1'h0);
  reg [(4'h9):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg62 = (1'h0);
  reg [(4'h8):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg60 = (1'h0);
  reg [(5'h12):(1'h0)] reg59 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg57 = (1'h0);
  reg [(5'h10):(1'h0)] reg56 = (1'h0);
  reg [(2'h3):(1'h0)] reg55 = (1'h0);
  reg [(4'h8):(1'h0)] reg54 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg52 = (1'h0);
  assign y = {wire113,
                 wire112,
                 wire111,
                 wire103,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire51,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
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
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
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
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 (1'h0)};
  assign wire51 = (wire47[(4'h9):(4'h8)] != (^~$unsigned($unsigned($signed(wire50)))));
  always
    @(posedge clk) begin
      if (((wire50[(4'ha):(4'ha)] | ((8'hb6) ?
              ((wire46 ? wire47 : wire50) >>> (wire51 ?
                  wire49 : wire46)) : $signed((wire50 ? wire49 : wire46)))) ?
          wire49[(3'h5):(2'h2)] : ((wire48[(3'h7):(3'h5)] && $unsigned(wire51)) == wire48)))
        begin
          reg52 <= (~({{{wire49}}} << (wire51[(1'h0):(1'h0)] - wire46)));
          reg53 <= $unsigned(({$unsigned($unsigned(wire49))} ?
              wire48 : ((((8'haa) ? wire46 : wire48) ?
                      wire50[(2'h2):(2'h2)] : $unsigned(wire49)) ?
                  {wire46[(3'h6):(3'h6)]} : $unsigned(wire47))));
          reg54 <= wire48;
          if (($unsigned({({wire51,
                  wire50} <= wire48[(4'hd):(4'h9)])}) >> (~^(!((+reg53) >> $signed(wire51))))))
            begin
              reg55 <= $unsigned(((~&(-(~^wire48))) & ($signed(wire46) <= (reg53[(1'h1):(1'h1)] <<< wire49))));
            end
          else
            begin
              reg55 <= $signed($unsigned((^~$unsigned((-wire47)))));
            end
        end
      else
        begin
          reg52 <= $signed((~(($signed(reg52) ?
              wire46 : (wire48 ? (8'hae) : (8'hb1))) ~^ ({reg54} ?
              (wire48 ? wire51 : reg53) : wire49))));
          reg53 <= $unsigned(reg54);
        end
      reg56 <= wire48;
      if ($unsigned(reg53[(2'h2):(1'h1)]))
        begin
          reg57 <= ((|(|(~^wire48[(4'h8):(3'h6)]))) ?
              $unsigned($unsigned((~^$signed((8'hae))))) : wire48[(4'ha):(3'h7)]);
          reg58 <= $signed(reg56[(4'hd):(1'h1)]);
          reg59 <= wire46;
          reg60 <= $unsigned($signed((((!reg56) != (reg52 ? reg58 : (8'hab))) ?
              (((8'h9c) ? reg58 : wire51) ?
                  wire48[(4'hf):(2'h2)] : (reg54 ?
                      (8'ha0) : reg58)) : {reg52})));
          reg61 <= (^~wire46);
        end
      else
        begin
          if (reg52[(1'h0):(1'h0)])
            begin
              reg57 <= ({(wire46[(3'h4):(3'h4)] || ((reg52 ?
                      reg54 : reg57) + reg54)),
                  wire49[(2'h3):(2'h3)]} * $signed(reg53));
              reg58 <= {wire51, reg59};
              reg59 <= ($unsigned((~&$unsigned({(7'h44), wire48}))) * reg60);
              reg60 <= $signed(wire50);
            end
          else
            begin
              reg57 <= {reg57[(3'h6):(2'h2)]};
              reg58 <= {((wire47[(4'ha):(2'h3)] ?
                      (8'ha1) : $signed((wire48 ?
                          reg57 : (8'hac)))) >>> (^~$unsigned($signed(reg60)))),
                  reg59};
              reg59 <= wire49[(1'h0):(1'h0)];
            end
          reg61 <= (&(!(wire49 ^~ reg58)));
          reg62 <= reg52;
          if ($signed({(($signed(wire51) < reg56) & ((8'hb6) ?
                  {reg59} : (+(7'h41))))}))
            begin
              reg63 <= (^~$signed({($unsigned(wire48) < (wire51 ?
                      wire46 : reg62))}));
              reg64 <= (8'hae);
              reg65 <= reg57[(4'he):(2'h3)];
              reg66 <= reg64;
            end
          else
            begin
              reg63 <= reg55;
              reg64 <= (((((reg55 ? wire48 : reg63) ?
                      (~|reg54) : {(8'hae),
                          wire46}) ^~ $unsigned(reg54)) ~^ $unsigned(((reg55 ?
                          wire46 : reg52) ?
                      reg62[(4'h8):(2'h3)] : reg65[(1'h1):(1'h1)]))) ?
                  (~|reg58) : (~|{$signed(((8'hb0) ? wire47 : reg54)),
                      ($unsigned(reg61) ?
                          wire50[(3'h5):(1'h0)] : $signed(reg59))}));
              reg65 <= {{((((8'ha5) ? wire46 : reg58) != reg54[(2'h3):(2'h2)]) ?
                          reg53 : $unsigned((reg56 ? wire46 : (7'h43))))},
                  $signed({(reg55[(2'h3):(1'h0)] && wire47)})};
              reg66 <= $signed({$signed($unsigned((reg57 ? reg58 : reg56))),
                  $signed((|$signed(wire47)))});
            end
        end
      if (reg64[(4'h8):(1'h1)])
        begin
          reg67 <= (8'hbd);
          reg68 <= reg55;
          reg69 <= reg59;
          reg70 <= reg63[(3'h6):(1'h0)];
        end
      else
        begin
          reg67 <= wire49;
          reg68 <= ({$unsigned((|wire47))} ?
              (^~(-$signed(wire47[(5'h12):(3'h4)]))) : $signed((^~(8'hb9))));
          if (reg64[(3'h5):(3'h5)])
            begin
              reg69 <= reg58[(2'h2):(1'h0)];
              reg70 <= {($signed($unsigned({wire48})) ?
                      (~^wire51[(1'h0):(1'h0)]) : (wire49[(4'h8):(4'h8)] >>> (~&reg68)))};
              reg71 <= (reg66 ?
                  ($unsigned({reg60}) && reg55) : ($signed((reg62 && (+reg56))) ?
                      reg58[(1'h0):(1'h0)] : wire46[(2'h3):(1'h0)]));
              reg72 <= $signed(reg68);
            end
          else
            begin
              reg69 <= $signed($unsigned(reg67));
            end
          reg73 <= reg52;
          reg74 <= ($signed(($signed(reg53) ?
              reg64 : $signed($unsigned(wire51)))) - $signed(wire50[(2'h3):(1'h1)]));
        end
    end
  assign wire75 = reg60;
  assign wire76 = (~&{(((8'hbb) | (reg56 >>> reg55)) ?
                          (!$signed(reg74)) : $signed(wire47)),
                      reg59});
  assign wire77 = wire50[(4'h9):(2'h2)];
  assign wire78 = reg64[(1'h1):(1'h0)];
  assign wire79 = ($unsigned(reg54) ?
                      (!((((7'h42) ^~ (8'hab)) | $unsigned(reg54)) ?
                          $signed(wire51) : (8'h9c))) : $signed({((wire75 ?
                              reg55 : (8'hb2)) ^ $unsigned(reg68))}));
  assign wire80 = $signed($unsigned((({reg68,
                      wire46} || (^~wire79)) >> $signed((reg64 ?
                      (8'hb3) : reg57)))));
  always
    @(posedge clk) begin
      if ((($unsigned(wire75) ?
          reg61[(2'h3):(1'h1)] : (wire76[(3'h6):(3'h5)] ?
              $signed($signed(reg74)) : $signed($unsigned(wire48)))) & ((~&((wire78 ?
          reg66 : reg62) && $signed(wire76))) && $signed(reg62[(3'h6):(1'h1)]))))
        begin
          reg81 <= reg72;
          reg82 <= wire48;
          reg83 <= reg81;
          if (reg63[(4'h8):(3'h6)])
            begin
              reg84 <= ({(!$signed($unsigned(wire76))), reg66[(5'h10):(3'h6)]} ?
                  ((!reg67[(1'h1):(1'h0)]) ?
                      $unsigned(reg58[(2'h3):(2'h2)]) : $signed(((reg64 ?
                          reg58 : reg68) | $unsigned(reg63)))) : ($unsigned($unsigned($unsigned(reg81))) ?
                      {((wire47 ? (8'hb1) : reg58) ?
                              wire76 : wire78[(3'h4):(1'h0)])} : reg73));
              reg85 <= wire47[(4'hb):(3'h7)];
              reg86 <= $unsigned(($unsigned(reg58[(2'h2):(1'h1)]) ?
                  $signed((|$signed(reg68))) : (reg53[(2'h2):(2'h2)] ?
                      $unsigned((wire49 ? wire46 : reg74)) : (!(~^reg53)))));
            end
          else
            begin
              reg84 <= {reg83,
                  ($signed($signed(wire80[(3'h7):(3'h5)])) + (-((reg81 ?
                          (8'hb5) : reg62) ?
                      {(8'hbe)} : (reg53 ? (8'ha9) : reg58))))};
              reg85 <= (~$unsigned(reg53));
              reg86 <= $signed((reg73 ?
                  wire79[(1'h0):(1'h0)] : reg67[(1'h1):(1'h1)]));
              reg87 <= (((~|(reg68 ? reg56 : (^~wire50))) || ((reg53 ?
                      (wire77 & (8'hb9)) : reg55[(1'h0):(1'h0)]) ?
                  ($unsigned(reg59) < wire75) : reg83[(2'h2):(2'h2)])) <= ($unsigned((~&$signed(wire80))) ?
                  ($unsigned((reg84 ? wire75 : reg63)) ?
                      {(~|reg63),
                          (reg66 ?
                              wire48 : wire77)} : wire47[(4'hd):(2'h3)]) : reg61));
              reg88 <= {(((!(|wire80)) + (8'hb1)) ?
                      (8'hb8) : $unsigned(reg67[(3'h5):(2'h3)]))};
            end
          reg89 <= reg81[(4'h9):(3'h6)];
        end
      else
        begin
          reg81 <= {$signed($signed((~&(8'ha1)))), reg70};
        end
      if (reg83)
        begin
          if ((!$signed((((reg58 <<< wire48) ?
                  (reg68 + reg86) : $signed(reg71)) ?
              (!(!reg69)) : $unsigned((&reg56))))))
            begin
              reg90 <= $signed({reg52});
              reg91 <= ($unsigned($unsigned($signed(reg59))) ?
                  $signed((reg57 | (|(reg67 ?
                      reg67 : reg71)))) : reg54[(4'h8):(3'h5)]);
              reg92 <= wire47;
              reg93 <= $signed(($signed(reg82) ?
                  (((reg61 >= reg91) >= reg64) | (+(!reg90))) : (reg71 ?
                      {wire77[(2'h2):(1'h0)]} : reg92)));
            end
          else
            begin
              reg90 <= reg93[(1'h1):(1'h0)];
              reg91 <= ($signed($unsigned(($signed(reg82) ?
                      reg92 : (~|reg69)))) ?
                  (8'ha8) : $unsigned({({wire79} >> (|reg74)),
                      ((wire50 * reg66) ^ reg73[(3'h6):(3'h6)])}));
              reg92 <= reg84[(4'h8):(1'h1)];
              reg93 <= ((reg53[(1'h0):(1'h0)] ?
                      (8'hbe) : (|{(~reg93), (8'hbc)})) ?
                  (((((8'hbc) ? reg87 : reg84) ^ $unsigned((8'hba))) ?
                          $signed((reg70 ? reg74 : reg69)) : ((reg73 ?
                              (8'ha8) : (8'haf)) == reg67)) ?
                      reg83[(4'hf):(4'hb)] : (($signed((8'hbc)) || reg60[(2'h2):(2'h2)]) ?
                          {$unsigned(wire76)} : reg62)) : ($unsigned(reg81) ?
                      (|($signed((7'h44)) == {reg60,
                          reg64})) : reg87[(3'h6):(1'h0)]));
            end
          if (($unsigned($unsigned($signed($unsigned(wire78)))) ?
              ($signed({(reg90 ? (7'h43) : reg52)}) ?
                  reg59[(5'h10):(3'h5)] : (-$unsigned((wire77 ?
                      reg87 : reg62)))) : $unsigned({reg67,
                  {$signed(wire80), $signed(reg92)}})))
            begin
              reg94 <= {{(($signed(reg81) ^ (reg71 ? reg57 : reg56)) ?
                          ({reg72} > $signed((8'ha9))) : ((~(8'ha2)) ^ (reg60 <= reg88))),
                      {($signed(wire79) > wire75)}},
                  (^(((wire80 ~^ reg66) ?
                      reg60[(3'h7):(3'h6)] : wire76) | reg55[(1'h1):(1'h0)]))};
            end
          else
            begin
              reg94 <= $unsigned(($signed(($unsigned(reg88) > (reg56 == wire75))) >>> $unsigned($signed(reg82[(1'h0):(1'h0)]))));
              reg95 <= (((8'ha9) ?
                  reg91 : (~^(reg58[(2'h3):(1'h0)] < (wire46 != reg64)))) - {$unsigned({((8'hb9) ?
                          reg82 : wire51),
                      $unsigned(reg56)})});
              reg96 <= (8'had);
              reg97 <= ({(&reg71)} ?
                  reg63[(4'h8):(2'h2)] : (($signed((!(8'hb5))) << $signed(reg56[(1'h1):(1'h0)])) ?
                      $signed(reg81) : $signed($signed((+(8'ha9))))));
              reg98 <= reg55;
            end
          reg99 <= (wire80[(4'h9):(3'h6)] ?
              $unsigned(wire77) : ($signed((8'hb6)) ?
                  (8'hb6) : (&reg95[(3'h4):(1'h1)])));
          reg100 <= $signed($unsigned(reg98[(1'h0):(1'h0)]));
        end
      else
        begin
          reg90 <= $unsigned(reg69);
          if ((~reg57))
            begin
              reg91 <= wire46;
              reg92 <= ($unsigned((+$signed((reg94 > reg64)))) ?
                  (reg90[(1'h0):(1'h0)] && ($unsigned({reg64, reg56}) ?
                      {(|reg53)} : $unsigned(reg66))) : (reg64 ?
                      $unsigned(((8'h9f) ?
                          reg73[(3'h4):(2'h2)] : reg59)) : (~^(^$unsigned(reg92)))));
              reg93 <= (&$unsigned((~&$signed((wire50 <= wire50)))));
              reg94 <= $unsigned((&$signed(reg68)));
              reg95 <= wire49[(2'h3):(1'h1)];
            end
          else
            begin
              reg91 <= ($unsigned(reg96) == (((((8'hbb) <<< (8'ha4)) ^~ $signed(wire47)) ?
                  reg93[(3'h4):(1'h1)] : (^~(wire79 >> reg94))) >= $signed({(~&reg53)})));
            end
          reg96 <= wire47[(5'h11):(5'h11)];
          reg97 <= $signed((8'ha7));
          reg98 <= (&wire50[(1'h0):(1'h0)]);
        end
      reg101 <= {reg55[(1'h0):(1'h0)],
          (($unsigned((reg64 ? reg52 : wire50)) > $unsigned((~^reg60))) ?
              (~^(((8'ha9) ?
                  reg69 : reg89) ~^ (reg97 >>> wire79))) : ($unsigned(reg66[(4'ha):(1'h0)]) ?
                  wire51 : reg65))};
      reg102 <= {(reg97[(3'h6):(1'h0)] != $signed({(~reg67),
              (reg99 ^~ reg91)})),
          $signed(($unsigned((reg97 ? (8'hb6) : reg57)) ?
              (^~(!(8'hb9))) : {reg83, (wire78 ? reg54 : reg90)}))};
    end
  assign wire103 = ((^~(reg68 ?
                           ((reg85 || reg101) | reg65[(3'h5):(2'h2)]) : $unsigned({reg102}))) ?
                       reg69[(3'h5):(2'h3)] : (($signed((reg70 <<< reg86)) ?
                               ($signed(wire78) || $signed(reg102)) : wire46) ?
                           ((~&$unsigned(reg97)) & (reg61[(4'h8):(1'h1)] && (!reg86))) : reg58[(1'h1):(1'h1)]));
  always
    @(posedge clk) begin
      if (({{$signed(reg101[(1'h1):(1'h0)])},
              (&($unsigned(reg73) ? (reg91 || reg87) : {(8'hbb), reg94}))} ?
          (-{(!(~^wire75))}) : reg72))
        begin
          if ($unsigned(wire79))
            begin
              reg104 <= {$unsigned($unsigned((8'hae))), reg70};
              reg105 <= $signed(reg52);
              reg106 <= (((^~$signed((reg65 ? reg55 : reg97))) ?
                      {(wire50 ?
                              $unsigned(reg81) : (reg96 ?
                                  reg58 : wire49))} : (8'hb7)) ?
                  $unsigned(({$unsigned(reg71),
                      reg92[(2'h2):(1'h0)]} << reg88[(4'ha):(3'h4)])) : reg95);
              reg107 <= (^(+(&(^~{reg104}))));
              reg108 <= $unsigned(reg98[(2'h2):(1'h0)]);
            end
          else
            begin
              reg104 <= {(8'hbe)};
              reg105 <= {($signed($signed((reg52 ? reg87 : reg53))) ?
                      wire76 : reg71[(3'h7):(3'h7)])};
              reg106 <= (8'h9d);
              reg107 <= wire75;
              reg108 <= reg86[(3'h5):(3'h5)];
            end
        end
      else
        begin
          reg104 <= $unsigned(wire46[(1'h1):(1'h1)]);
          reg105 <= (8'haf);
          reg106 <= reg108;
          if ((-$unsigned({$signed((reg100 ? reg94 : reg65)),
              (reg96 > $signed(reg94))})))
            begin
              reg107 <= $unsigned({$signed($unsigned(reg60[(3'h6):(3'h6)])),
                  (($unsigned(reg98) || {reg92}) ?
                      (8'hb9) : ((reg97 ? reg57 : (8'ha7)) ?
                          (~reg53) : wire46[(2'h3):(2'h2)]))});
            end
          else
            begin
              reg107 <= reg81[(1'h1):(1'h0)];
              reg108 <= ((~^(~$signed(((8'hbe) ? reg85 : wire50)))) ?
                  reg86[(1'h1):(1'h1)] : ({(&$signed(reg72)),
                      {$signed(reg98)}} != reg68));
              reg109 <= ((reg67[(2'h2):(1'h1)] ?
                      $unsigned(((8'haa) && $signed(reg95))) : $unsigned(({reg89} ?
                          (&(8'hb9)) : $unsigned((8'ha0))))) ?
                  reg71 : (!$signed($signed(reg71))));
              reg110 <= ($unsigned((!$signed(((8'hbe) - wire79)))) ?
                  $signed(reg54[(2'h2):(1'h1)]) : (8'ha5));
            end
        end
    end
  assign wire111 = $signed(($unsigned($signed((reg98 ?
                       reg59 : (7'h41)))) << {$unsigned(reg81[(3'h7):(3'h4)])}));
  assign wire112 = ((reg94[(1'h0):(1'h0)] ?
                       reg74[(2'h3):(1'h0)] : (&(~|reg63[(2'h2):(2'h2)]))) != $signed(($unsigned(reg100) >>> (~^$unsigned(reg74)))));
  assign wire113 = {(8'ha9), reg67[(1'h0):(1'h0)]};
  always
    @(posedge clk) begin
      if ((-$signed($signed($signed($unsigned(reg71))))))
        begin
          reg114 <= ((((8'had) ?
                      reg88[(3'h6):(3'h4)] : ((reg97 ? reg82 : reg108) ?
                          (wire78 ~^ reg63) : (reg81 == wire103))) ?
                  {(reg102 > (reg93 ?
                          reg89 : reg72))} : $signed($signed(wire75))) ?
              (($signed(reg54) ? reg91 : (reg65[(3'h6):(2'h3)] << reg107)) ?
                  ($signed($signed((8'ha8))) ?
                      ({(8'hb6)} ?
                          reg91[(2'h3):(2'h3)] : $signed(reg100)) : (&$unsigned((8'ha7)))) : (({(8'ha7)} ?
                          $signed(reg55) : (reg73 | reg54)) ?
                      (((8'hb8) ?
                          (8'ha3) : reg72) >= (-reg81)) : $signed((reg84 ?
                          reg55 : reg66)))) : $signed((^~(+(+wire48)))));
        end
      else
        begin
          reg114 <= $signed((~|$signed((8'hb4))));
          reg115 <= reg95[(2'h2):(1'h1)];
          if ({$unsigned(wire48)})
            begin
              reg116 <= reg82[(1'h0):(1'h0)];
              reg117 <= $signed(wire111[(4'h9):(1'h1)]);
              reg118 <= $signed(($unsigned(reg100[(4'hb):(1'h0)]) ~^ (~{(reg85 | wire111)})));
            end
          else
            begin
              reg116 <= $signed(reg55[(1'h0):(1'h0)]);
              reg117 <= $signed((!$signed(reg108[(3'h7):(2'h3)])));
            end
        end
      if ((8'ha1))
        begin
          reg119 <= $unsigned(reg52[(2'h3):(2'h2)]);
          reg120 <= reg98[(2'h3):(2'h3)];
          reg121 <= $signed(wire77[(3'h4):(3'h4)]);
        end
      else
        begin
          reg119 <= ((reg59 ?
              ($unsigned(reg118[(4'hc):(1'h1)]) >= wire111) : reg53) <<< $unsigned({reg101[(1'h1):(1'h1)]}));
          reg120 <= ($signed((+((wire51 == (7'h41)) & $unsigned((8'ha5))))) ?
              $unsigned(reg107[(4'hb):(2'h2)]) : reg96[(2'h3):(1'h0)]);
          reg121 <= (reg54 ?
              (-(|$unsigned((~(8'hb4))))) : (($signed((reg96 <= reg97)) >= $signed((~|reg108))) ?
                  $unsigned(reg94[(4'h9):(1'h1)]) : (-((reg81 ?
                          (7'h40) : (8'hba)) ?
                      reg116 : (reg100 ? reg115 : reg67)))));
          reg122 <= (&wire80);
          reg123 <= (~^{$unsigned($unsigned((reg57 ? reg69 : reg88))),
              reg90[(3'h5):(2'h3)]});
        end
      reg124 <= $unsigned($unsigned((~&wire47[(3'h7):(2'h3)])));
      if (reg87[(4'h8):(3'h6)])
        begin
          if (((8'haf) - $signed((~$unsigned(reg65[(3'h7):(1'h0)])))))
            begin
              reg125 <= $unsigned(($unsigned({$unsigned((8'had)),
                  (reg106 ~^ reg119)}) ~^ reg96[(2'h2):(2'h2)]));
              reg126 <= $unsigned((|(reg110[(4'he):(4'h9)] ?
                  reg60[(4'hc):(1'h0)] : (|$signed(reg107)))));
              reg127 <= ({(($unsigned(reg110) ?
                      {reg122} : wire76) >= ((reg73 < reg123) ~^ (~&reg99))),
                  $unsigned(($signed(reg89) <= (reg57 >>> reg68)))} + $signed((wire111 ?
                  $unsigned(reg63) : $unsigned($signed(reg57)))));
              reg128 <= reg54;
            end
          else
            begin
              reg125 <= wire76[(4'h9):(4'h8)];
              reg126 <= (($unsigned({$signed((8'ha8)),
                      (+reg69)}) >= reg117[(4'hb):(4'h9)]) ?
                  reg100 : ({$signed($unsigned(reg91))} - $unsigned((^{wire79,
                      reg72}))));
              reg127 <= ((reg108[(3'h7):(2'h2)] ?
                  $signed({(^~reg72),
                      wire78[(4'h8):(3'h5)]}) : reg62[(5'h13):(4'ha)]) << (7'h42));
            end
          reg129 <= reg97;
          reg130 <= ((($unsigned((reg115 | (8'hb8))) ?
                  $signed((~^reg95)) : (+(reg104 ^ wire47))) ?
              wire113 : $signed(((~^reg120) || (8'h9d)))) || (~&(+(reg67 ?
              $unsigned((8'hbf)) : (~|reg85)))));
        end
      else
        begin
          if ($signed($signed(((((8'h9c) >= reg58) ?
                  {reg124, reg97} : $signed(wire113)) ?
              $signed((|wire80)) : $unsigned((reg54 >>> reg119))))))
            begin
              reg125 <= $unsigned({reg91[(3'h4):(1'h1)]});
              reg126 <= reg92[(2'h3):(1'h0)];
            end
          else
            begin
              reg125 <= wire51;
              reg126 <= $signed(($signed(wire49[(1'h0):(1'h0)]) | reg128[(1'h0):(1'h0)]));
              reg127 <= reg54;
              reg128 <= (((-((reg94 ? wire76 : reg125) ?
                      $signed(reg116) : wire79[(2'h2):(1'h1)])) ?
                  $signed(($signed(reg101) ?
                      (|wire112) : reg52)) : $signed((-{reg87,
                      reg87}))) <<< {$unsigned((reg109[(4'hc):(4'ha)] ?
                      reg55 : (&reg52))),
                  $unsigned(reg70)});
              reg129 <= (((7'h41) && ((|(wire76 + reg116)) >>> wire75)) ?
                  ($unsigned($unsigned(reg91[(3'h4):(2'h3)])) ?
                      (~|wire47) : $signed(((wire48 < wire111) >>> (wire112 << (8'hb4))))) : reg56[(2'h3):(1'h1)]);
            end
          reg130 <= reg97[(2'h2):(1'h0)];
          reg131 <= wire111;
        end
      reg132 <= $unsigned(((((reg55 != (7'h41)) ?
              $unsigned(reg106) : $unsigned(reg124)) ?
          {(+wire111),
              {(8'ha5)}} : reg90[(2'h2):(1'h1)]) == ($signed((~&reg96)) ^~ reg98[(1'h1):(1'h0)])));
    end
endmodule

module module26
#(parameter param41 = (^(8'hb3)), 
parameter param42 = ((({(7'h41), param41} && ((param41 | param41) ? (param41 ~^ param41) : (^param41))) ? param41 : {param41}) && param41))
(y, clk, wire30, wire29, wire28, wire27);
  output wire [(32'h8e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire30;
  input wire signed [(4'h8):(1'h0)] wire29;
  input wire [(4'hb):(1'h0)] wire28;
  input wire signed [(4'h9):(1'h0)] wire27;
  wire signed [(5'h13):(1'h0)] wire37;
  wire [(4'he):(1'h0)] wire36;
  wire signed [(5'h14):(1'h0)] wire34;
  wire [(4'ha):(1'h0)] wire33;
  wire signed [(4'hc):(1'h0)] wire32;
  wire [(5'h12):(1'h0)] wire31;
  reg signed [(3'h6):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg39 = (1'h0);
  reg [(4'hf):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg35 = (1'h0);
  assign y = {wire37,
                 wire36,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 reg40,
                 reg39,
                 reg38,
                 reg35,
                 (1'h0)};
  assign wire31 = ((&wire27[(3'h6):(1'h0)]) & wire28);
  assign wire32 = {wire29[(1'h1):(1'h0)], wire29};
  assign wire33 = (|($signed((|(wire27 ? (8'hbb) : wire32))) - ({wire29,
                          (wire31 < wire30)} ?
                      $unsigned((wire31 >= (7'h43))) : wire28[(3'h5):(2'h2)])));
  assign wire34 = wire27[(2'h3):(2'h2)];
  always
    @(posedge clk) begin
      reg35 <= ($unsigned(wire33[(1'h1):(1'h1)]) ?
          wire27 : (wire29 ^ wire27[(3'h6):(3'h6)]));
    end
  assign wire36 = $unsigned((($signed($signed(wire30)) || reg35) ~^ (|({wire29,
                          wire27} ?
                      (wire30 & wire31) : (&wire33)))));
  assign wire37 = $signed(wire31);
  always
    @(posedge clk) begin
      reg38 <= {{wire27[(4'h8):(3'h4)],
              ((8'ha0) > ($unsigned((8'ha8)) && $unsigned((8'ha9))))}};
      reg39 <= $signed((-$signed((wire31 ? reg35 : {wire29}))));
      reg40 <= {wire34, (8'ha4)};
    end
endmodule

module module149
#(parameter param167 = (((((+(8'hb5)) ? (^~(7'h44)) : ((8'hac) ? (8'ha1) : (8'hb6))) ? (((8'hba) < (7'h40)) ? (~|(7'h41)) : ((8'h9f) ? (8'hb8) : (8'hbb))) : {((8'hbd) ? (8'h9d) : (8'h9c))}) ? ((((8'hb0) ? (7'h43) : (8'h9c)) ? ((8'hbf) - (8'h9c)) : (&(8'hbf))) ? ({(7'h40), (8'haf)} & {(8'ha0)}) : (~(+(8'hbd)))) : ((((8'h9d) + (8'hb5)) && ((8'ha0) ? (8'hab) : (8'hac))) > (|((8'hbb) ? (8'ha8) : (8'hab))))) ? (((((8'ha0) ? (8'hb5) : (8'hb3)) ? ((8'hb9) ? (8'hbe) : (8'hb9)) : (+(8'ha9))) ^~ {((8'hb6) << (8'hbc)), (^~(8'hb6))}) ? (~|{((8'hb0) + (8'haf)), ((8'h9c) ? (8'ha1) : (8'hb1))}) : {((~|(8'hb0)) ? ((8'hab) < (8'hb6)) : {(8'hb2), (8'ha7)}), (((8'ha4) * (8'ha2)) == ((8'ha5) ? (8'hae) : (8'h9d)))}) : (+((~(8'h9d)) ? ((~^(8'ha1)) ~^ ((8'hb3) ? (8'hb6) : (8'h9f))) : {((8'h9d) ? (8'hb4) : (8'hbd)), ((8'hb2) ? (8'ha1) : (7'h40))}))))
(y, clk, wire153, wire152, wire151, wire150);
  output wire [(32'h9b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire153;
  input wire [(5'h14):(1'h0)] wire152;
  input wire signed [(5'h10):(1'h0)] wire151;
  input wire signed [(3'h6):(1'h0)] wire150;
  wire [(4'hf):(1'h0)] wire166;
  wire [(5'h15):(1'h0)] wire165;
  wire signed [(4'hd):(1'h0)] wire164;
  wire [(3'h5):(1'h0)] wire163;
  wire [(2'h3):(1'h0)] wire162;
  wire [(5'h10):(1'h0)] wire161;
  wire [(4'h9):(1'h0)] wire160;
  wire [(2'h3):(1'h0)] wire159;
  wire signed [(5'h13):(1'h0)] wire158;
  wire signed [(5'h15):(1'h0)] wire157;
  wire signed [(4'hc):(1'h0)] wire156;
  wire [(2'h3):(1'h0)] wire155;
  wire signed [(4'he):(1'h0)] wire154;
  assign y = {wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 (1'h0)};
  assign wire154 = (|(-$unsigned((~^{(8'hae), wire152}))));
  assign wire155 = $unsigned($signed((&wire154)));
  assign wire156 = ($signed($signed($signed($signed(wire155)))) ?
                       $unsigned($unsigned({(~(8'ha2)),
                           $unsigned(wire151)})) : $signed(({(wire151 << wire153)} * ($signed(wire154) ?
                           (wire155 ? wire151 : (8'ha4)) : (!(8'hb7))))));
  assign wire157 = ($signed(($signed((wire150 * wire151)) ~^ ((wire151 > wire153) ?
                       (wire152 ?
                           wire154 : wire154) : (!(8'ha6))))) != ((8'h9c) ^~ wire155));
  assign wire158 = wire150[(3'h5):(1'h1)];
  assign wire159 = $signed(wire155[(2'h2):(1'h0)]);
  assign wire160 = wire158[(4'hc):(1'h1)];
  assign wire161 = wire156[(4'ha):(4'h9)];
  assign wire162 = (^~(wire159 ?
                       $unsigned(wire161[(3'h6):(3'h5)]) : {wire156[(3'h5):(1'h1)],
                           ($unsigned(wire154) + wire153[(3'h6):(3'h6)])}));
  assign wire163 = (|($unsigned((~^wire150)) ?
                       (&(8'ha7)) : $signed((wire158[(5'h10):(4'hb)] < {wire160,
                           wire152}))));
  assign wire164 = ((~$signed($unsigned((wire158 == (8'ha1))))) ^~ wire156);
  assign wire165 = wire156;
  assign wire166 = wire154[(4'hc):(4'hb)];
endmodule
