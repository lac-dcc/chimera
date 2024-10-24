module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h8b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire4;
  input wire [(4'he):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire100;
  wire signed [(5'h13):(1'h0)] wire99;
  wire signed [(5'h12):(1'h0)] wire98;
  wire signed [(5'h14):(1'h0)] wire80;
  wire signed [(5'h15):(1'h0)] wire40;
  wire [(5'h13):(1'h0)] wire82;
  wire signed [(4'hc):(1'h0)] wire83;
  wire signed [(4'ha):(1'h0)] wire96;
  assign y = {wire100,
                 wire99,
                 wire98,
                 wire80,
                 wire40,
                 wire82,
                 wire83,
                 wire96,
                 (1'h0)};
  module5 #() modinst41 (wire40, clk, wire3, wire1, wire4, wire0);
  module42 #() modinst81 (wire80, clk, wire1, wire40, wire2, wire3, wire4);
  assign wire82 = wire2[(5'h11):(4'ha)];
  assign wire83 = wire2;
  module84 #() modinst97 (wire96, clk, wire83, wire4, wire40, wire80, wire82);
  assign wire98 = {wire80[(5'h10):(4'ha)]};
  assign wire99 = $unsigned((-$signed($unsigned($unsigned((7'h44))))));
  assign wire100 = ($unsigned(wire96) ? wire0 : wire83[(3'h4):(1'h1)]);
endmodule

module module84
#(parameter param95 = ((8'hbc) == (({((8'hac) ? (7'h40) : (8'h9e)), ((8'ha4) || (7'h40))} > (8'hae)) <= {{(~&(7'h44)), ((8'h9e) == (8'hbb))}, ({(8'ha8)} < (+(8'ha9)))})))
(y, clk, wire89, wire88, wire87, wire86, wire85);
  output wire [(32'h43):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire89;
  input wire signed [(5'h11):(1'h0)] wire88;
  input wire [(3'h5):(1'h0)] wire87;
  input wire [(4'h8):(1'h0)] wire86;
  input wire signed [(3'h4):(1'h0)] wire85;
  wire signed [(4'hf):(1'h0)] wire94;
  wire signed [(5'h11):(1'h0)] wire93;
  wire signed [(4'hc):(1'h0)] wire91;
  wire [(4'hb):(1'h0)] wire90;
  reg signed [(4'hb):(1'h0)] reg92 = (1'h0);
  assign y = {wire94, wire93, wire91, wire90, reg92, (1'h0)};
  assign wire90 = wire88[(1'h1):(1'h1)];
  assign wire91 = $unsigned($unsigned((!($signed((7'h40)) ^ $signed(wire88)))));
  always
    @(posedge clk) begin
      reg92 <= $unsigned((~&(~|((-wire85) >> $signed(wire87)))));
    end
  assign wire93 = wire90[(1'h1):(1'h0)];
  assign wire94 = wire88;
endmodule

module module42
#(parameter param79 = {(~((((8'hb4) ? (8'hb6) : (8'h9e)) * {(8'hb8), (7'h43)}) != (^~(&(8'haa))))), ({({(8'ha8)} ? ((8'hb6) ? (8'ha7) : (7'h40)) : {(8'hbf), (8'ha4)})} >>> (((~|(8'ha8)) ? {(8'hbf), (8'h9c)} : ((8'haf) + (8'hba))) ? (+((8'h9d) >> (8'ha7))) : (!(|(8'hb4)))))})
(y, clk, wire47, wire46, wire45, wire44, wire43);
  output wire [(32'h90):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire47;
  input wire [(3'h4):(1'h0)] wire46;
  input wire [(5'h12):(1'h0)] wire45;
  input wire signed [(4'ha):(1'h0)] wire44;
  input wire signed [(5'h13):(1'h0)] wire43;
  wire signed [(2'h2):(1'h0)] wire77;
  wire signed [(4'h8):(1'h0)] wire59;
  wire [(4'hc):(1'h0)] wire58;
  wire [(4'h8):(1'h0)] wire57;
  wire [(4'hb):(1'h0)] wire56;
  wire [(5'h13):(1'h0)] wire55;
  wire [(4'he):(1'h0)] wire54;
  wire [(3'h4):(1'h0)] wire53;
  wire signed [(4'ha):(1'h0)] wire52;
  wire signed [(5'h11):(1'h0)] wire51;
  wire signed [(3'h6):(1'h0)] wire50;
  wire signed [(2'h2):(1'h0)] wire49;
  wire [(5'h15):(1'h0)] wire48;
  reg signed [(3'h4):(1'h0)] reg60 = (1'h0);
  reg [(3'h5):(1'h0)] reg61 = (1'h0);
  assign y = {wire77,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 reg60,
                 reg61,
                 (1'h0)};
  assign wire48 = {$unsigned(wire47),
                      (~(wire46 && ((|wire47) ?
                          (wire45 ? wire46 : (8'ha1)) : $unsigned(wire43))))};
  assign wire49 = ($signed((~&(~&((8'hbc) ? wire45 : wire44)))) ?
                      $signed(wire46[(1'h0):(1'h0)]) : $unsigned(({$unsigned(wire47),
                          (wire47 && wire48)} < wire45[(5'h11):(4'hf)])));
  assign wire50 = $unsigned(wire43);
  assign wire51 = wire46;
  assign wire52 = {$signed(wire51[(5'h10):(4'h9)]),
                      (-(-{$unsigned((8'ha3)), (^~wire45)}))};
  assign wire53 = (wire52[(2'h2):(1'h0)] ?
                      (~&(&((~wire45) & wire45))) : (~|(($signed(wire44) ?
                          wire44[(2'h2):(1'h0)] : wire43[(4'hf):(3'h7)]) || {{wire45,
                              wire51},
                          {wire48, (7'h44)}})));
  assign wire54 = wire46;
  assign wire55 = {wire49[(2'h2):(1'h0)], {wire51, wire44}};
  assign wire56 = wire48;
  assign wire57 = (~&wire47[(1'h0):(1'h0)]);
  assign wire58 = wire50[(1'h1):(1'h0)];
  assign wire59 = wire45;
  always
    @(posedge clk) begin
      reg60 <= $signed(($signed(wire43[(3'h5):(2'h3)]) ?
          ((|(wire51 == wire48)) >= {((8'haf) ? wire47 : wire58),
              (~|wire55)}) : $unsigned($signed((^wire54)))));
      reg61 <= $unsigned((~|wire51[(3'h4):(2'h2)]));
    end
  module62 #() modinst78 (wire77, clk, wire45, wire55, reg61, wire43, wire48);
endmodule

module module5
#(parameter param39 = (((((8'hae) == ((8'hbc) ? (8'hbb) : (8'hb3))) ? (^~(8'hbf)) : ({(8'hb5), (8'hbb)} & ((7'h44) ? (8'hac) : (8'hb6)))) == ({((8'ha2) ? (8'hb5) : (8'ha2))} >= (((8'haf) || (8'hb5)) & {(8'h9d)}))) ? (8'hb3) : {(+(((8'ha2) + (8'hbd)) ? ((8'ha5) >>> (8'ha8)) : {(8'ha5)})), {(((8'hb0) ? (8'ha8) : (8'ha5)) < ((8'hb8) ? (8'hb9) : (8'hbe))), ((8'ha3) + ((8'hb9) ? (8'ha1) : (8'haf)))}}))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h138):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire9;
  input wire signed [(4'h8):(1'h0)] wire8;
  input wire [(5'h11):(1'h0)] wire7;
  input wire signed [(5'h14):(1'h0)] wire6;
  wire [(3'h5):(1'h0)] wire38;
  wire [(5'h10):(1'h0)] wire37;
  wire signed [(3'h6):(1'h0)] wire36;
  wire [(2'h2):(1'h0)] wire24;
  wire signed [(5'h13):(1'h0)] wire23;
  wire [(5'h10):(1'h0)] wire22;
  wire [(4'hc):(1'h0)] wire21;
  wire signed [(4'h9):(1'h0)] wire20;
  wire signed [(4'hc):(1'h0)] wire19;
  wire signed [(5'h13):(1'h0)] wire18;
  wire signed [(4'hd):(1'h0)] wire17;
  wire signed [(5'h14):(1'h0)] wire16;
  wire signed [(4'hd):(1'h0)] wire15;
  wire [(5'h11):(1'h0)] wire14;
  wire [(2'h3):(1'h0)] wire13;
  wire signed [(4'h9):(1'h0)] wire12;
  wire [(3'h5):(1'h0)] wire11;
  wire [(4'h9):(1'h0)] wire10;
  reg signed [(4'ha):(1'h0)] reg35 = (1'h0);
  reg [(4'ha):(1'h0)] reg34 = (1'h0);
  reg [(4'h8):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg31 = (1'h0);
  reg [(5'h12):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg29 = (1'h0);
  reg [(2'h3):(1'h0)] reg28 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg27 = (1'h0);
  reg [(2'h3):(1'h0)] reg26 = (1'h0);
  reg [(3'h4):(1'h0)] reg25 = (1'h0);
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 (1'h0)};
  assign wire10 = $signed(($signed(($signed(wire8) > ((8'h9f) ?
                          wire7 : (8'h9c)))) ?
                      wire9[(3'h4):(1'h1)] : ({$unsigned((8'hb5))} ?
                          ((!wire7) ?
                              (wire9 >= wire6) : wire9[(3'h5):(2'h2)]) : wire9)));
  assign wire11 = (~|wire9);
  assign wire12 = ($signed(wire10[(2'h3):(2'h2)]) > wire11[(1'h1):(1'h0)]);
  assign wire13 = (wire11[(1'h1):(1'h0)] | ((~&(wire8 >>> (8'hb3))) || $unsigned((^(~wire11)))));
  assign wire14 = (wire6 & (^$signed($signed((~&wire8)))));
  assign wire15 = wire13[(1'h0):(1'h0)];
  assign wire16 = wire12[(2'h2):(1'h1)];
  assign wire17 = $signed(wire9[(2'h2):(1'h1)]);
  assign wire18 = ($signed(wire9[(3'h5):(2'h2)]) <<< wire10[(4'h9):(3'h6)]);
  assign wire19 = $signed(($unsigned(wire15[(2'h3):(1'h1)]) >> wire18[(5'h11):(2'h2)]));
  assign wire20 = $unsigned($unsigned({(wire11[(3'h5):(1'h1)] - $unsigned(wire6))}));
  assign wire21 = $signed(((-(wire17[(4'hb):(4'h9)] | wire15[(2'h2):(1'h0)])) >= ({(wire14 ^ wire12)} & (8'hb1))));
  assign wire22 = wire14[(4'h9):(3'h4)];
  assign wire23 = (~|((^~$unsigned($unsigned((7'h41)))) ?
                      $signed(wire15[(1'h1):(1'h1)]) : $unsigned((-(wire17 ?
                          wire18 : wire18)))));
  assign wire24 = (((((~wire8) ? (~^wire10) : (^wire15)) ?
                          (wire13 ?
                              (wire15 && (8'hae)) : ((7'h43) ?
                                  (8'ha1) : wire15)) : wire23[(5'h13):(4'h8)]) | ($signed((+wire18)) > wire20[(4'h8):(2'h3)])) ?
                      (^~($unsigned(wire13[(2'h3):(1'h1)]) ~^ wire7)) : $signed((($signed(wire17) == wire21[(3'h7):(2'h3)]) ?
                          (wire21 ?
                              (wire21 | wire18) : (wire9 >> wire18)) : $unsigned($unsigned(wire10)))));
  always
    @(posedge clk) begin
      reg25 <= {((7'h42) | (~$signed((wire14 ? wire13 : wire10)))),
          (!{{$signed((8'h9f))}})};
      if (wire19)
        begin
          reg26 <= $unsigned((wire10[(3'h6):(2'h3)] ?
              {($signed(wire21) != wire15[(4'ha):(3'h5)]),
                  $signed($unsigned((8'ha2)))} : (($signed(wire9) ?
                  wire14[(4'hc):(4'hb)] : wire10[(2'h3):(2'h3)]) & ((+(8'hbd)) | {wire21}))));
          if (wire20)
            begin
              reg27 <= wire12;
              reg28 <= $unsigned((~wire17));
            end
          else
            begin
              reg27 <= $signed($unsigned($unsigned(((wire6 ?
                  wire11 : wire21) <<< ((8'h9c) ? reg25 : wire17)))));
              reg28 <= wire7;
              reg29 <= $unsigned($signed(wire14));
              reg30 <= wire14;
            end
          reg31 <= ($unsigned(reg28[(1'h0):(1'h0)]) ^~ {wire21,
              (&(wire11[(1'h0):(1'h0)] & $signed(reg26)))});
          reg32 <= (|reg31);
        end
      else
        begin
          if (($unsigned((&$signed({wire11}))) <= wire15))
            begin
              reg26 <= wire11;
            end
          else
            begin
              reg26 <= $signed({{wire17[(1'h0):(1'h0)],
                      {$signed(wire12), $unsigned(reg26)}},
                  {(+reg27[(3'h4):(2'h2)]), $signed((8'ha7))}});
            end
          reg27 <= wire21;
        end
      reg33 <= (-$signed(reg27[(3'h5):(1'h1)]));
      reg34 <= (~^($signed(wire14) * wire8));
      reg35 <= reg32[(1'h1):(1'h1)];
    end
  assign wire36 = (($signed(wire11) - $signed($unsigned($unsigned((8'haf))))) ?
                      reg30 : (8'ha7));
  assign wire37 = wire36[(2'h3):(1'h1)];
  assign wire38 = ($signed(wire10) ? reg33 : wire17[(4'ha):(2'h2)]);
endmodule

module module62
#(parameter param75 = {((-(((8'hbf) >> (8'had)) ? ((8'ha1) < (8'hab)) : (~(8'hbb)))) && (~|(((8'hb2) && (8'hbf)) ? ((8'hae) ? (8'hb5) : (8'ha9)) : (8'hb4))))}, 
parameter param76 = param75)
(y, clk, wire67, wire66, wire65, wire64, wire63);
  output wire [(32'h54):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire67;
  input wire [(5'h13):(1'h0)] wire66;
  input wire signed [(3'h5):(1'h0)] wire65;
  input wire [(4'hb):(1'h0)] wire64;
  input wire [(5'h15):(1'h0)] wire63;
  wire [(5'h13):(1'h0)] wire74;
  wire signed [(4'h8):(1'h0)] wire70;
  wire signed [(4'h9):(1'h0)] wire69;
  wire signed [(5'h10):(1'h0)] wire68;
  reg [(4'hb):(1'h0)] reg73 = (1'h0);
  reg [(3'h4):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg71 = (1'h0);
  assign y = {wire74, wire70, wire69, wire68, reg73, reg72, reg71, (1'h0)};
  assign wire68 = (wire65 ?
                      $signed($signed($signed({wire63}))) : {wire67[(4'hb):(1'h0)],
                          wire66});
  assign wire69 = ($unsigned($signed(((wire67 ? wire63 : wire67) ?
                      (wire65 ?
                          (8'h9c) : wire68) : wire68[(4'hf):(3'h7)]))) | wire63);
  assign wire70 = $signed((!$signed((~&wire66[(4'hf):(1'h0)]))));
  always
    @(posedge clk) begin
      reg71 <= (~^wire66[(3'h7):(3'h6)]);
      reg72 <= $signed(($signed($unsigned((wire65 ? wire64 : (8'ha9)))) ?
          wire66 : wire65[(2'h2):(2'h2)]));
    end
  always
    @(posedge clk) begin
      reg73 <= $signed((~|(~wire67[(1'h1):(1'h0)])));
    end
  assign wire74 = wire70[(3'h6):(3'h4)];
endmodule
