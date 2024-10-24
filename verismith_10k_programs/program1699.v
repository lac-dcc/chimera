module top
#(parameter param180 = (+{{({(8'ha1)} ~^ ((8'hbf) & (8'hbf))), (((8'ha6) <<< (8'hac)) <<< (~&(8'hb7)))}, ((((8'hb1) ? (8'ha0) : (8'haf)) || ((8'ha3) * (8'hbd))) ? (^((7'h41) ? (8'hba) : (8'hb9))) : (((8'ha2) ? (8'hbc) : (7'h40)) > (8'hb9)))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'he5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire179;
  wire signed [(4'hf):(1'h0)] wire178;
  wire [(4'ha):(1'h0)] wire177;
  wire signed [(4'hd):(1'h0)] wire96;
  wire signed [(4'hd):(1'h0)] wire4;
  wire signed [(5'h12):(1'h0)] wire101;
  wire [(4'he):(1'h0)] wire164;
  reg signed [(4'hb):(1'h0)] reg176 = (1'h0);
  reg [(4'hd):(1'h0)] reg175 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg174 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg173 = (1'h0);
  reg [(3'h7):(1'h0)] reg172 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg171 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg170 = (1'h0);
  reg [(4'hd):(1'h0)] reg169 = (1'h0);
  reg [(4'h9):(1'h0)] reg168 = (1'h0);
  reg [(3'h5):(1'h0)] reg167 = (1'h0);
  reg [(5'h12):(1'h0)] reg166 = (1'h0);
  reg [(4'he):(1'h0)] reg98 = (1'h0);
  reg [(5'h13):(1'h0)] reg99 = (1'h0);
  reg [(3'h7):(1'h0)] reg100 = (1'h0);
  assign y = {wire179,
                 wire178,
                 wire177,
                 wire96,
                 wire4,
                 wire101,
                 wire164,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg98,
                 reg99,
                 reg100,
                 (1'h0)};
  assign wire4 = wire1;
  module5 #() modinst97 (.wire7(wire3), .wire8(wire2), .wire6(wire4), .wire9(wire1), .clk(clk), .wire10(wire0), .y(wire96));
  always
    @(posedge clk) begin
      if ($signed(wire4))
        begin
          reg98 <= $signed($signed((^$signed((wire3 * wire3)))));
        end
      else
        begin
          reg98 <= $signed($signed(($unsigned($unsigned(wire4)) ?
              {(|wire3)} : $signed($unsigned(wire3)))));
          reg99 <= (!$signed((~|{wire96[(4'h8):(2'h3)]})));
        end
      reg100 <= $signed((~&({(|reg98),
          wire1} != $unsigned(wire0[(3'h6):(3'h4)]))));
    end
  assign wire101 = ($unsigned((~|reg98[(3'h4):(3'h4)])) < wire4);
  module102 #() modinst165 (wire164, clk, wire4, wire1, wire101, reg98);
  always
    @(posedge clk) begin
      reg166 <= reg98;
      reg167 <= $unsigned($signed(wire1[(5'h12):(4'hf)]));
      if ($signed(wire101[(2'h2):(2'h2)]))
        begin
          reg168 <= wire4[(2'h3):(1'h0)];
          reg169 <= wire164;
          reg170 <= (~&$unsigned(wire2));
        end
      else
        begin
          if (wire101[(3'h6):(1'h0)])
            begin
              reg168 <= $signed($unsigned({$unsigned($signed((8'hbd))),
                  ({wire1} ? reg99 : $unsigned(reg100))}));
              reg169 <= wire96[(3'h5):(2'h2)];
            end
          else
            begin
              reg168 <= $unsigned($unsigned(({(|reg99)} ?
                  (&reg98[(3'h6):(1'h1)]) : ((reg166 * wire0) >> wire2))));
              reg169 <= reg167;
              reg170 <= ({({wire0} <<< $signed((~wire3))),
                  $unsigned(reg167)} * reg168[(4'h8):(1'h1)]);
              reg171 <= (8'hb2);
            end
          reg172 <= (^~($signed(({wire3} != $unsigned(wire2))) ?
              $unsigned({reg167[(2'h3):(1'h0)],
                  reg98[(2'h3):(2'h3)]}) : (~&wire164[(4'h9):(3'h6)])));
          reg173 <= $unsigned($unsigned($unsigned(($unsigned(reg168) <= $unsigned(wire96)))));
        end
      if (({$unsigned((|(reg173 ?
              reg100 : wire2)))} >>> $signed(($signed({(7'h41)}) - wire164))))
        begin
          reg174 <= (reg99[(5'h11):(3'h6)] * wire2[(3'h6):(3'h5)]);
          reg175 <= $unsigned($unsigned((wire1[(5'h11):(4'hb)] ?
              $signed((reg169 + (7'h40))) : ((~^reg170) * reg99))));
          reg176 <= (-reg171);
        end
      else
        begin
          reg174 <= ($signed((~^reg169[(4'ha):(1'h0)])) ^~ reg168[(2'h2):(2'h2)]);
        end
    end
  assign wire177 = (&(((^~wire3) > (reg167[(1'h1):(1'h0)] - (-reg169))) && {{$signed(reg174),
                           (wire3 ~^ (8'hbf))}}));
  assign wire178 = (+$unsigned(reg170[(1'h0):(1'h0)]));
  assign wire179 = (reg172 ?
                       (({(^~wire177)} ?
                           $unsigned((reg172 ?
                               reg170 : reg169)) : (wire2 ^ $signed(reg167))) < wire0) : reg167[(3'h5):(2'h3)]);
endmodule

module module102
#(parameter param163 = ((({(8'ha7), (~|(8'hbe))} >> {((8'haf) ? (8'haa) : (8'hb4))}) ? (~&(~&((8'h9d) + (8'ha4)))) : ((((8'hbe) ? (8'ha4) : (8'hb2)) | ((7'h43) && (8'ha4))) < (~|{(7'h42), (8'hb9)}))) && (8'h9c)))
(y, clk, wire103, wire104, wire105, wire106);
  output wire [(32'h55):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire103;
  input wire signed [(5'h14):(1'h0)] wire104;
  input wire signed [(5'h12):(1'h0)] wire105;
  input wire [(4'hd):(1'h0)] wire106;
  wire signed [(5'h15):(1'h0)] wire162;
  wire [(3'h4):(1'h0)] wire107;
  wire signed [(4'hd):(1'h0)] wire108;
  wire [(3'h5):(1'h0)] wire109;
  wire [(4'hc):(1'h0)] wire110;
  wire signed [(4'hb):(1'h0)] wire111;
  wire [(4'hd):(1'h0)] wire112;
  wire [(3'h5):(1'h0)] wire160;
  assign y = {wire162,
                 wire107,
                 wire108,
                 wire109,
                 wire110,
                 wire111,
                 wire112,
                 wire160,
                 (1'h0)};
  assign wire107 = wire106;
  assign wire108 = wire104[(5'h10):(4'h8)];
  assign wire109 = $unsigned(($signed($signed(wire107[(3'h4):(2'h2)])) ?
                       wire107 : (($unsigned(wire104) ?
                           ((8'ha0) ?
                               wire105 : wire106) : (^~wire106)) || $unsigned($signed((7'h41))))));
  assign wire110 = (&wire106);
  assign wire111 = $unsigned($signed(($unsigned((wire106 ?
                       (8'hb4) : (8'ha3))) && {{wire105, wire108}})));
  assign wire112 = wire111[(2'h3):(2'h2)];
  module113 #() modinst161 (.wire117(wire112), .wire118(wire108), .wire116(wire106), .y(wire160), .wire114(wire105), .clk(clk), .wire115(wire111));
  assign wire162 = $unsigned(((wire160 | (wire111 > $unsigned(wire108))) ^~ wire108[(2'h2):(1'h1)]));
endmodule

module module5  (y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h18e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire6;
  input wire [(3'h7):(1'h0)] wire7;
  input wire [(5'h13):(1'h0)] wire8;
  input wire signed [(4'hd):(1'h0)] wire9;
  input wire signed [(4'h9):(1'h0)] wire10;
  wire [(3'h5):(1'h0)] wire92;
  wire [(4'ha):(1'h0)] wire66;
  wire signed [(4'hc):(1'h0)] wire65;
  wire signed [(4'he):(1'h0)] wire64;
  wire signed [(4'h8):(1'h0)] wire63;
  wire [(5'h12):(1'h0)] wire62;
  wire signed [(4'hf):(1'h0)] wire61;
  wire signed [(3'h4):(1'h0)] wire60;
  wire [(4'hb):(1'h0)] wire59;
  wire [(3'h6):(1'h0)] wire58;
  wire signed [(5'h15):(1'h0)] wire57;
  wire signed [(5'h12):(1'h0)] wire56;
  wire [(3'h5):(1'h0)] wire55;
  wire [(5'h13):(1'h0)] wire45;
  wire [(3'h5):(1'h0)] wire11;
  wire [(4'he):(1'h0)] wire12;
  wire [(4'he):(1'h0)] wire13;
  wire [(4'hc):(1'h0)] wire14;
  wire signed [(5'h14):(1'h0)] wire43;
  reg [(4'hd):(1'h0)] reg95 = (1'h0);
  reg [(4'hb):(1'h0)] reg94 = (1'h0);
  reg [(5'h15):(1'h0)] reg46 = (1'h0);
  reg [(5'h12):(1'h0)] reg47 = (1'h0);
  reg [(5'h15):(1'h0)] reg48 = (1'h0);
  reg [(5'h13):(1'h0)] reg49 = (1'h0);
  reg [(3'h4):(1'h0)] reg50 = (1'h0);
  reg [(4'h9):(1'h0)] reg51 = (1'h0);
  reg [(4'ha):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg53 = (1'h0);
  reg [(5'h12):(1'h0)] reg54 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg67 = (1'h0);
  assign y = {wire92,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire45,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire43,
                 reg95,
                 reg94,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 reg67,
                 (1'h0)};
  assign wire11 = $signed($signed($signed(wire6[(4'hb):(2'h2)])));
  assign wire12 = wire9;
  assign wire13 = $unsigned(wire7[(3'h5):(3'h4)]);
  assign wire14 = wire9[(3'h5):(3'h4)];
  module15 #() modinst44 (.clk(clk), .wire19(wire8), .wire20(wire11), .wire18(wire9), .wire17(wire14), .y(wire43), .wire16(wire12));
  assign wire45 = $unsigned((-wire6[(2'h2):(2'h2)]));
  always
    @(posedge clk) begin
      reg46 <= {$signed((wire12[(4'he):(4'h8)] << wire9))};
      reg47 <= (-wire13[(4'h8):(3'h7)]);
      reg48 <= $unsigned(wire13);
      if ({$signed($signed(wire8)), wire45[(5'h10):(4'hc)]})
        begin
          reg49 <= ($signed(($unsigned((!(8'hbd))) ?
                  wire9 : (wire14 != (wire45 || wire8)))) ?
              wire45 : {{wire11}});
          reg50 <= (~|$signed((wire8 ?
              $unsigned($signed(wire9)) : (wire11[(3'h4):(2'h2)] && $signed(reg46)))));
          reg51 <= (8'hbb);
          if (reg47)
            begin
              reg52 <= wire43[(3'h5):(1'h1)];
              reg53 <= $signed((^(~&(8'ha8))));
            end
          else
            begin
              reg52 <= $unsigned(({$unsigned(reg53[(3'h4):(1'h1)]),
                  $unsigned((&(7'h42)))} + $signed(wire10[(2'h3):(1'h1)])));
              reg53 <= ({$signed((!(reg53 && wire11))),
                      ((reg52 && $unsigned(wire14)) ~^ wire7)} ?
                  $unsigned(reg49[(4'h9):(3'h7)]) : wire14[(2'h3):(2'h3)]);
            end
        end
      else
        begin
          if ($unsigned($signed((~^wire8[(3'h5):(3'h4)]))))
            begin
              reg49 <= $unsigned({{wire14,
                      {$unsigned((8'hb3)), $unsigned(wire6)}},
                  (($unsigned(wire43) ?
                      (~|(8'had)) : ((8'haf) | wire8)) == $unsigned($unsigned(wire9)))});
              reg50 <= {wire8[(5'h11):(4'hc)]};
            end
          else
            begin
              reg49 <= (wire43[(4'hd):(1'h0)] >= (8'ha5));
            end
        end
      reg54 <= ((+(((wire14 ?
              (8'hae) : reg46) + wire8) == wire43[(1'h1):(1'h0)])) ?
          ($unsigned($unsigned((wire13 ? reg51 : reg52))) ?
              wire9 : $signed($unsigned({wire43}))) : (8'hae));
    end
  assign wire55 = {(({{reg49, wire6}} != wire43) ?
                          (&$signed((!(8'hbc)))) : ($signed(wire10) * $unsigned({wire13}))),
                      wire12[(2'h3):(1'h0)]};
  assign wire56 = {$unsigned(($signed({(8'hb0),
                          wire14}) >> wire6[(3'h7):(1'h0)]))};
  assign wire57 = $unsigned((|$unsigned((~|{wire12}))));
  assign wire58 = reg49[(5'h11):(1'h1)];
  assign wire59 = (&({$signed((wire10 >= reg50)),
                      ($unsigned(reg53) & reg46[(3'h7):(3'h7)])} || wire55));
  assign wire60 = $signed({wire14, ($signed(reg52) ~^ {$signed(reg51)})});
  assign wire61 = (~$unsigned({$signed($signed(wire58)),
                      (wire11 ? $unsigned(wire6) : $signed(wire14))}));
  assign wire62 = wire61;
  assign wire63 = (reg54[(2'h2):(2'h2)] || $unsigned((+$signed(wire59[(1'h1):(1'h1)]))));
  assign wire64 = $signed($unsigned(wire6[(1'h0):(1'h0)]));
  assign wire65 = wire62;
  assign wire66 = {(($unsigned((~^wire58)) ^ (wire56 ?
                          reg48 : wire6[(4'h8):(3'h5)])) >> {{wire11,
                              (reg51 ? reg47 : wire45)}}),
                      (7'h42)};
  always
    @(posedge clk) begin
      reg67 <= wire12;
    end
  module68 #() modinst93 (.y(wire92), .wire70(reg53), .wire71(wire59), .clk(clk), .wire69(reg47), .wire73(reg51), .wire72(wire57));
  always
    @(posedge clk) begin
      reg94 <= $unsigned(wire61);
      reg95 <= (({wire6[(2'h2):(1'h1)]} < (8'h9d)) ?
          ($signed(reg48) > (|wire12)) : ($unsigned((~^reg67)) >> ($unsigned(reg54[(3'h4):(3'h4)]) ?
              wire9[(3'h5):(2'h3)] : reg94)));
    end
endmodule

module module68
#(parameter param90 = {({((^(8'hb9)) ? ((8'h9f) && (8'hb8)) : ((8'hb0) <<< (8'h9e))), (^~((8'hac) >= (8'hae)))} ? (|({(8'hbc)} ~^ (-(8'h9c)))) : ((~^((8'haf) & (7'h44))) ? (&((8'ha2) ? (8'ha0) : (8'h9e))) : ((^(8'haa)) ^ ((8'ha9) ? (8'hba) : (7'h40))))), {(({(7'h44), (8'haf)} > ((7'h40) ? (8'hbe) : (8'hb2))) || ((+(7'h44)) << (-(8'ha3))))}}, 
parameter param91 = ((param90 >> {((param90 <= param90) << (+param90))}) ? (((~^(^~param90)) ~^ {(param90 ? param90 : param90), param90}) ? (param90 | ((~|param90) || param90)) : param90) : (((-((8'hb9) ? param90 : param90)) ? (!(param90 ? param90 : param90)) : (((7'h43) ? (8'hb1) : (8'hb3)) > (param90 ? (8'h9e) : param90))) != (~&((param90 ? param90 : param90) & (param90 ? (8'hb0) : param90))))))
(y, clk, wire73, wire72, wire71, wire70, wire69);
  output wire [(32'hce):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire73;
  input wire [(5'h10):(1'h0)] wire72;
  input wire signed [(4'h8):(1'h0)] wire71;
  input wire signed [(4'hc):(1'h0)] wire70;
  input wire signed [(4'h8):(1'h0)] wire69;
  wire signed [(4'hc):(1'h0)] wire89;
  wire [(4'h8):(1'h0)] wire88;
  wire [(5'h10):(1'h0)] wire87;
  wire [(3'h4):(1'h0)] wire86;
  wire signed [(5'h13):(1'h0)] wire85;
  wire signed [(4'hc):(1'h0)] wire84;
  wire signed [(5'h15):(1'h0)] wire83;
  wire signed [(4'hd):(1'h0)] wire82;
  wire [(4'h8):(1'h0)] wire81;
  wire signed [(4'hc):(1'h0)] wire80;
  wire signed [(4'hd):(1'h0)] wire79;
  wire signed [(5'h12):(1'h0)] wire78;
  wire [(4'hd):(1'h0)] wire77;
  wire signed [(4'hd):(1'h0)] wire76;
  wire [(5'h12):(1'h0)] wire75;
  wire [(3'h5):(1'h0)] wire74;
  assign y = {wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 (1'h0)};
  assign wire74 = ({(~&wire70)} == (wire73 ? wire71 : wire69));
  assign wire75 = wire73;
  assign wire76 = wire71;
  assign wire77 = wire75[(4'h8):(3'h5)];
  assign wire78 = (~&($signed(((wire74 >> wire70) && $signed((8'ha5)))) ?
                      $unsigned((wire73 - (^wire73))) : wire71));
  assign wire79 = (~wire74[(3'h4):(3'h4)]);
  assign wire80 = (wire76[(2'h3):(1'h0)] & (wire70[(1'h1):(1'h0)] >> $unsigned($signed($signed(wire71)))));
  assign wire81 = wire74;
  assign wire82 = ((((wire75 ?
                          wire76[(3'h6):(2'h2)] : (wire75 ?
                              (8'ha9) : wire71)) + ($unsigned(wire74) ?
                          (wire79 ? wire70 : wire81) : (wire71 & wire70))) ?
                      wire74[(3'h4):(2'h3)] : $signed(wire73[(3'h5):(1'h1)])) | wire80);
  assign wire83 = ($signed(wire69) && (((|$unsigned((8'hbf))) ?
                          {$signed(wire69)} : wire82[(1'h1):(1'h0)]) ?
                      ($unsigned((^wire80)) ?
                          $unsigned((^~wire71)) : (wire75 + {wire74,
                              wire72})) : {((&wire78) ?
                              (wire82 ?
                                  wire82 : wire70) : ((8'h9e) < wire74))}));
  assign wire84 = (wire70 ~^ wire72[(3'h4):(1'h0)]);
  assign wire85 = ($unsigned(($signed($unsigned((8'hbd))) ?
                          (~|(wire76 ? wire70 : wire82)) : ($signed(wire74) ?
                              (wire83 ? wire72 : wire71) : (!wire76)))) ?
                      wire70[(2'h2):(2'h2)] : $unsigned(((~^wire82[(2'h3):(1'h0)]) ?
                          (wire83[(4'h8):(3'h5)] ?
                              (^~wire82) : $signed(wire76)) : ((wire74 * wire80) ?
                              (wire78 + (8'hb6)) : $unsigned(wire69)))));
  assign wire86 = wire77;
  assign wire87 = $unsigned($signed((8'hbe)));
  assign wire88 = wire70;
  assign wire89 = wire80;
endmodule

module module15
#(parameter param42 = (((((8'hb2) ? ((8'hbb) && (8'ha2)) : ((8'hb9) ? (8'hbf) : (8'h9e))) & ({(7'h40), (8'hbb)} ? ((8'h9d) > (8'hb9)) : {(8'h9d)})) ^~ {((&(7'h41)) ? (~|(8'ha4)) : (~|(8'hb9)))}) <<< (!({((8'hac) ? (8'hb4) : (8'hb7)), ((8'haa) + (7'h41))} != {(|(8'h9f))}))))
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'hfd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire20;
  input wire signed [(5'h13):(1'h0)] wire19;
  input wire [(4'hd):(1'h0)] wire18;
  input wire [(3'h4):(1'h0)] wire17;
  input wire [(4'he):(1'h0)] wire16;
  wire [(4'h9):(1'h0)] wire41;
  wire signed [(4'ha):(1'h0)] wire40;
  wire signed [(5'h12):(1'h0)] wire39;
  wire signed [(4'h9):(1'h0)] wire38;
  wire [(2'h3):(1'h0)] wire37;
  wire [(5'h10):(1'h0)] wire36;
  wire [(4'ha):(1'h0)] wire35;
  wire [(5'h10):(1'h0)] wire34;
  wire signed [(4'hd):(1'h0)] wire33;
  wire [(4'hd):(1'h0)] wire27;
  wire [(4'hc):(1'h0)] wire26;
  wire signed [(5'h14):(1'h0)] wire25;
  wire [(5'h15):(1'h0)] wire24;
  wire signed [(4'h9):(1'h0)] wire23;
  wire [(4'hc):(1'h0)] wire22;
  wire [(2'h3):(1'h0)] wire21;
  reg signed [(4'hb):(1'h0)] reg32 = (1'h0);
  reg [(3'h5):(1'h0)] reg31 = (1'h0);
  reg [(4'h9):(1'h0)] reg30 = (1'h0);
  reg signed [(4'he):(1'h0)] reg29 = (1'h0);
  reg [(5'h13):(1'h0)] reg28 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 (1'h0)};
  assign wire21 = (^$signed(wire19));
  assign wire22 = wire16;
  assign wire23 = ((wire22 ?
                      (((^wire16) ? (wire19 ^ wire17) : $unsigned(wire22)) ?
                          wire22[(4'hb):(4'h9)] : wire17) : {((wire17 ^~ wire16) ?
                              (!wire20) : (|wire22))}) == ((8'hb0) ?
                      $signed((wire21 | {wire16})) : $unsigned(wire21[(2'h2):(2'h2)])));
  assign wire24 = (wire17 ?
                      $signed(wire18[(3'h7):(3'h6)]) : {$signed((wire16 >>> $unsigned(wire16)))});
  assign wire25 = wire22[(4'hc):(3'h6)];
  assign wire26 = $signed(wire23[(2'h2):(1'h0)]);
  assign wire27 = $signed($signed(((-{wire23, wire17}) <<< wire19)));
  always
    @(posedge clk) begin
      reg28 <= (&((wire16 ~^ $unsigned(((8'h9c) >>> wire21))) ?
          (^((wire25 ? wire24 : wire24) ?
              wire20 : $signed((8'hac)))) : $unsigned((wire18[(4'ha):(2'h3)] ?
              $unsigned(wire24) : (~^wire27)))));
      reg29 <= (&{((~^(8'ha7)) ? ((^wire25) + wire27) : (^~(wire27 << wire27))),
          $signed(wire18)});
      reg30 <= wire17;
      reg31 <= wire23[(2'h3):(2'h3)];
      reg32 <= (|{((wire21[(1'h0):(1'h0)] ?
                  wire20[(2'h3):(2'h3)] : $unsigned(wire21)) ?
              wire27[(4'h9):(3'h4)] : $unsigned(wire17[(2'h3):(2'h3)])),
          ((((8'hb6) ~^ wire27) >> wire27) ?
              $signed(wire23) : reg29[(4'hb):(4'hb)])});
    end
  assign wire33 = (-wire23[(3'h5):(1'h1)]);
  assign wire34 = $signed((8'hbb));
  assign wire35 = (wire26[(3'h5):(1'h0)] ?
                      $unsigned(wire16) : $unsigned(wire16));
  assign wire36 = {({($unsigned(wire20) << wire26), {$signed(reg32)}} == reg30),
                      $signed((&$unsigned($signed(reg28))))};
  assign wire37 = $unsigned($unsigned($signed($unsigned({wire27}))));
  assign wire38 = reg32[(3'h4):(3'h4)];
  assign wire39 = $signed(((~^wire36) ?
                      $signed((~|$signed(wire34))) : {wire34}));
  assign wire40 = ({reg29} ?
                      wire21 : ({{wire39[(4'hf):(4'h8)], wire20},
                          {(wire17 != reg31)}} == {$signed({wire25,
                              (8'h9e)})}));
  assign wire41 = {(wire24[(4'hd):(3'h7)] ?
                          (($signed(wire40) * $unsigned(wire34)) || wire36[(4'hb):(4'h9)]) : $signed((^$unsigned(wire22)))),
                      $unsigned((reg31 >>> {((8'hae) ? wire34 : wire35)}))};
endmodule

module module113
#(parameter param159 = (({{((8'hb5) | (7'h40)), ((8'hb4) ? (8'hb3) : (8'hb3))}, ((|(8'ha1)) * ((8'hbb) ? (8'h9f) : (8'hb3)))} * ((~^((8'hb0) & (8'hbb))) || (~^(~|(7'h44))))) ? ((~(^((8'hb8) ? (8'hb3) : (7'h41)))) | (8'hbf)) : (((((8'ha0) ? (8'h9f) : (8'hb4)) ^~ ((8'ha9) ? (8'hb0) : (7'h40))) <<< (((8'haa) <= (8'hb1)) ? ((8'haf) > (8'hb4)) : ((8'h9e) == (8'hb1)))) - (-((^(8'hac)) ? ((8'hb0) * (7'h43)) : ((8'ha3) <<< (8'ha3)))))))
(y, clk, wire118, wire117, wire116, wire115, wire114);
  output wire [(32'h1ac):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire118;
  input wire [(4'hb):(1'h0)] wire117;
  input wire [(3'h4):(1'h0)] wire116;
  input wire signed [(3'h4):(1'h0)] wire115;
  input wire signed [(5'h11):(1'h0)] wire114;
  wire signed [(5'h12):(1'h0)] wire158;
  wire signed [(4'he):(1'h0)] wire157;
  wire [(5'h13):(1'h0)] wire156;
  wire [(3'h4):(1'h0)] wire155;
  wire [(3'h5):(1'h0)] wire154;
  wire [(3'h6):(1'h0)] wire153;
  wire signed [(3'h6):(1'h0)] wire152;
  wire [(2'h2):(1'h0)] wire151;
  wire signed [(4'ha):(1'h0)] wire132;
  wire signed [(4'hc):(1'h0)] wire126;
  wire signed [(5'h10):(1'h0)] wire125;
  wire [(2'h3):(1'h0)] wire121;
  wire [(4'hd):(1'h0)] wire120;
  wire signed [(3'h5):(1'h0)] wire119;
  reg [(5'h14):(1'h0)] reg150 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg149 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg148 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg147 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg146 = (1'h0);
  reg [(4'he):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg144 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg143 = (1'h0);
  reg [(3'h5):(1'h0)] reg142 = (1'h0);
  reg [(3'h7):(1'h0)] reg141 = (1'h0);
  reg [(4'he):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg139 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg137 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg136 = (1'h0);
  reg [(3'h4):(1'h0)] reg135 = (1'h0);
  reg [(4'hf):(1'h0)] reg134 = (1'h0);
  reg [(4'hb):(1'h0)] reg133 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg130 = (1'h0);
  reg [(5'h12):(1'h0)] reg129 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg128 = (1'h0);
  reg [(5'h14):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg124 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg123 = (1'h0);
  reg [(3'h5):(1'h0)] reg122 = (1'h0);
  assign y = {wire158,
                 wire157,
                 wire156,
                 wire155,
                 wire154,
                 wire153,
                 wire152,
                 wire151,
                 wire132,
                 wire126,
                 wire125,
                 wire121,
                 wire120,
                 wire119,
                 reg150,
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
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg124,
                 reg123,
                 reg122,
                 (1'h0)};
  assign wire119 = wire114[(5'h10):(2'h2)];
  assign wire120 = {wire115};
  assign wire121 = wire119[(3'h4):(1'h1)];
  always
    @(posedge clk) begin
      if ((($signed({$unsigned(wire117), wire116[(3'h4):(2'h3)]}) ?
              wire117[(4'ha):(4'ha)] : wire118) ?
          (wire118[(3'h5):(2'h2)] ?
              wire121[(1'h0):(1'h0)] : $signed((^~(^~wire117)))) : ((((8'ha4) ?
                      ((8'hb6) ? wire121 : (8'ha2)) : $signed(wire114)) ?
                  ((wire121 ?
                      wire115 : wire115) >= wire116[(2'h2):(1'h0)]) : wire120) ?
              $signed(($unsigned(wire116) > wire119)) : {(^~wire116),
                  wire121[(2'h2):(1'h0)]})))
        begin
          reg122 <= (&{(^~$unsigned(wire118[(4'h8):(3'h5)])), wire116});
          reg123 <= wire120;
        end
      else
        begin
          reg122 <= wire118[(2'h2):(1'h0)];
        end
      reg124 <= $signed((wire117[(4'h8):(3'h4)] ?
          wire118 : $unsigned($signed((reg123 ? (7'h44) : (8'ha4))))));
    end
  assign wire125 = {$signed(wire119)};
  assign wire126 = (($signed({((8'had) ? reg124 : wire119),
                       (wire125 ?
                           wire121 : reg123)}) ^~ (~&{(^wire119)})) >= $signed(reg122[(2'h2):(1'h0)]));
  always
    @(posedge clk) begin
      reg127 <= (8'hb4);
      reg128 <= (reg122[(1'h1):(1'h0)] ?
          ((~(!wire114)) + $signed($signed($unsigned(wire117)))) : (((~^(wire115 + wire114)) ?
              ((wire115 >> wire126) + (wire120 >= reg124)) : reg122) && wire121));
      reg129 <= (~|reg127[(3'h6):(1'h0)]);
      reg130 <= {((wire126 ? (!(wire126 ? reg129 : (8'hae))) : (|(^~reg127))) ?
              ($unsigned(wire119[(3'h4):(1'h0)]) ?
                  ((wire118 ? (8'hb9) : wire116) ?
                      (wire114 ?
                          wire125 : wire118) : (wire121 >= wire116)) : wire117[(4'hb):(2'h3)]) : (reg122 ?
                  ($unsigned(reg122) ?
                      $signed(wire125) : (reg124 ?
                          wire114 : wire121)) : wire126))};
      reg131 <= (~|wire121[(2'h3):(2'h2)]);
    end
  assign wire132 = $unsigned({((!(^~(8'h9d))) ^ wire118[(4'h8):(1'h1)])});
  always
    @(posedge clk) begin
      if (reg123[(3'h6):(1'h1)])
        begin
          reg133 <= ((reg122[(2'h3):(1'h0)] ?
              wire126[(4'ha):(3'h7)] : wire118[(4'hc):(1'h1)]) && (|(^((wire118 && (8'h9d)) ?
              (reg128 ~^ reg130) : wire114[(4'hd):(4'h8)]))));
          reg134 <= wire121;
        end
      else
        begin
          reg133 <= $unsigned($unsigned($unsigned(wire119[(2'h2):(1'h0)])));
          reg134 <= $signed((reg124 >= $unsigned(($unsigned(wire116) ?
              (|wire116) : (wire120 >>> wire120)))));
          if (wire115[(2'h2):(1'h1)])
            begin
              reg135 <= reg122[(3'h5):(2'h2)];
              reg136 <= reg127;
              reg137 <= (|(~&((wire118 ?
                      $unsigned(reg134) : reg133[(3'h6):(2'h3)]) ?
                  {(reg135 ? reg124 : wire126),
                      reg136} : wire118[(2'h3):(2'h2)])));
              reg138 <= (~(!((reg136[(3'h4):(2'h2)] ?
                      (&reg135) : $signed(reg137)) ?
                  ((reg130 ? wire117 : wire114) ?
                      {reg133} : (wire114 ? reg133 : wire116)) : {(!wire121),
                      $signed(wire132)})));
              reg139 <= wire119[(3'h5):(1'h1)];
            end
          else
            begin
              reg135 <= reg124;
              reg136 <= {(!reg122[(2'h2):(1'h1)])};
              reg137 <= {(wire116[(1'h0):(1'h0)] ?
                      ((((8'ha9) > reg131) || wire126[(3'h4):(3'h4)]) ?
                          {{wire114}, $unsigned(reg135)} : wire120) : wire121)};
              reg138 <= $signed((+(reg134[(3'h4):(2'h3)] >= $signed((reg135 && wire118)))));
              reg139 <= (reg123 ? reg138[(1'h1):(1'h0)] : (!(&(^wire121))));
            end
        end
      if (reg133[(3'h4):(1'h0)])
        begin
          if ((!(($unsigned({reg134}) ?
                  reg134[(3'h4):(2'h2)] : {(wire126 ? (8'hac) : wire125)}) ?
              wire125 : wire115[(2'h3):(1'h0)])))
            begin
              reg140 <= ({(reg138 & reg134),
                  ((+$signed(reg123)) ?
                      ($signed(wire132) ?
                          (reg130 ^ (8'haa)) : (&(8'ha2))) : reg124)} * wire119[(2'h3):(1'h1)]);
            end
          else
            begin
              reg140 <= $signed((&(reg123[(3'h7):(2'h2)] == $signed($unsigned(wire115)))));
              reg141 <= ($signed((^(!wire118))) ?
                  $unsigned($unsigned($signed((wire120 ?
                      wire125 : wire125)))) : (wire132 ?
                      $unsigned(((wire118 ? reg127 : (8'hb1)) | (reg138 ?
                          reg140 : (8'haf)))) : (-reg139)));
              reg142 <= (((8'ha6) != $unsigned($signed($signed(reg141)))) ?
                  {$unsigned(wire114),
                      (((reg133 ? reg123 : wire126) && $unsigned(wire114)) ?
                          (!(reg122 | reg129)) : wire125[(3'h6):(2'h3)])} : $unsigned(({(~^wire132)} ?
                      reg127 : (|$unsigned((8'hb3))))));
              reg143 <= $unsigned((~|$signed($unsigned($unsigned(reg127)))));
            end
          reg144 <= reg130;
          reg145 <= $signed(reg133);
          reg146 <= {reg129[(5'h12):(4'hb)], $signed(wire116[(1'h0):(1'h0)])};
        end
      else
        begin
          reg140 <= (|(8'hb4));
          reg141 <= (|reg124);
          reg142 <= $signed(reg145);
        end
      if ($unsigned(reg137[(3'h5):(2'h3)]))
        begin
          reg147 <= (|($signed(($signed(reg130) | (8'ha8))) ?
              {reg137[(5'h11):(4'hc)],
                  (-wire132[(2'h3):(2'h2)])} : $unsigned($unsigned(wire121[(1'h0):(1'h0)]))));
        end
      else
        begin
          reg147 <= (reg145[(4'h8):(2'h2)] - ((((+(8'ha7)) ? reg127 : reg135) ?
              (~|(reg131 ?
                  (8'hbc) : wire125)) : ($unsigned(reg144) <<< {wire125})) == ((~$unsigned(reg128)) ?
              (wire119 << reg136) : ((reg143 ^ (8'hbd)) ?
                  (wire120 == reg147) : ((7'h42) ? wire132 : reg141)))));
        end
      if (wire118[(4'ha):(1'h1)])
        begin
          reg148 <= reg145;
        end
      else
        begin
          reg148 <= reg148[(1'h1):(1'h1)];
          reg149 <= wire121[(2'h3):(2'h2)];
          reg150 <= (8'h9f);
        end
    end
  assign wire151 = ((-wire121) ?
                       reg123 : $unsigned((((+(8'ha6)) ?
                               {(8'hac)} : (reg150 ? reg143 : reg134)) ?
                           {(|reg127),
                               $signed((8'hb3))} : $unsigned((7'h40)))));
  assign wire152 = $unsigned(((-$unsigned(((7'h40) * reg149))) ~^ wire116[(2'h2):(1'h0)]));
  assign wire153 = (&reg137[(1'h1):(1'h0)]);
  assign wire154 = reg149[(2'h3):(1'h0)];
  assign wire155 = wire116;
  assign wire156 = (|reg131[(1'h1):(1'h0)]);
  assign wire157 = (8'hab);
  assign wire158 = (reg133[(3'h6):(3'h5)] + ($signed((!(+wire121))) || $unsigned($unsigned(((8'haa) ?
                       wire116 : (8'ha7))))));
endmodule
