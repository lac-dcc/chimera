module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'ha4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire84;
  wire signed [(4'h9):(1'h0)] wire83;
  wire [(5'h14):(1'h0)] wire71;
  wire signed [(3'h6):(1'h0)] wire70;
  wire signed [(2'h2):(1'h0)] wire68;
  reg signed [(5'h11):(1'h0)] reg82 = (1'h0);
  reg [(4'hf):(1'h0)] reg81 = (1'h0);
  reg [(4'hc):(1'h0)] reg80 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg79 = (1'h0);
  reg [(2'h3):(1'h0)] reg78 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg77 = (1'h0);
  reg [(5'h15):(1'h0)] reg76 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg74 = (1'h0);
  reg [(3'h6):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg72 = (1'h0);
  assign y = {wire84,
                 wire83,
                 wire71,
                 wire70,
                 wire68,
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
                 (1'h0)};
  module4 #() modinst69 (.wire6(wire0), .y(wire68), .wire5(wire3), .wire7(wire2), .clk(clk), .wire8(wire1));
  assign wire70 = wire68;
  assign wire71 = wire68;
  always
    @(posedge clk) begin
      reg72 <= $unsigned({$signed($unsigned($signed(wire2)))});
      reg73 <= wire68;
      reg74 <= (~^reg73[(1'h0):(1'h0)]);
      reg75 <= wire1[(1'h1):(1'h1)];
      if (reg72[(3'h6):(3'h4)])
        begin
          reg76 <= wire2;
          reg77 <= wire70;
        end
      else
        begin
          reg76 <= reg73;
          if (reg73[(1'h1):(1'h1)])
            begin
              reg77 <= (|reg72);
              reg78 <= {reg72[(4'h9):(1'h0)]};
              reg79 <= (^~(reg73 ?
                  $unsigned((&$unsigned(reg78))) : reg74[(1'h1):(1'h0)]));
              reg80 <= (reg72[(3'h5):(1'h0)] ?
                  (^~wire71[(3'h7):(3'h5)]) : $unsigned(wire3[(3'h7):(3'h6)]));
              reg81 <= wire3;
            end
          else
            begin
              reg77 <= $unsigned(reg79);
              reg78 <= $unsigned($signed($unsigned(((wire71 << reg73) ?
                  ((8'hb7) < (8'hb4)) : (wire68 >= wire68)))));
              reg79 <= (~$unsigned($signed($signed(reg72))));
              reg80 <= reg74[(3'h4):(2'h2)];
            end
          reg82 <= wire68[(1'h0):(1'h0)];
        end
    end
  assign wire83 = reg80;
  assign wire84 = $unsigned(((~wire68[(1'h1):(1'h1)]) ?
                      reg82 : {{(reg76 ? reg72 : reg77),
                              (reg82 ? reg78 : (8'hbb))},
                          reg75[(2'h2):(1'h1)]}));
endmodule

module module4
#(parameter param67 = ((+((&((8'haa) ? (8'hb5) : (8'hb1))) < ((~&(8'ha5)) ? ((8'hb2) ? (8'ha9) : (8'ha1)) : ((8'ha1) ? (8'hb7) : (8'ha0))))) ? {{((8'h9e) & ((8'hba) - (8'ha6)))}, ((((8'ha6) * (8'haa)) & (!(8'ha1))) ? ((~(8'h9d)) >> (^~(8'ha1))) : ((!(8'h9d)) ? ((8'ha3) <<< (8'ha2)) : {(8'h9e)}))} : ((8'hbb) ^ (~(-(^~(8'hb3)))))))
(y, clk, wire5, wire6, wire7, wire8);
  output wire [(32'h122):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire5;
  input wire [(3'h7):(1'h0)] wire6;
  input wire signed [(4'ha):(1'h0)] wire7;
  input wire [(3'h7):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire66;
  wire [(4'he):(1'h0)] wire9;
  wire [(4'hd):(1'h0)] wire10;
  wire signed [(4'he):(1'h0)] wire11;
  wire [(4'h9):(1'h0)] wire12;
  wire signed [(5'h14):(1'h0)] wire13;
  wire signed [(3'h6):(1'h0)] wire14;
  wire signed [(4'h9):(1'h0)] wire15;
  wire signed [(4'hd):(1'h0)] wire16;
  wire signed [(5'h14):(1'h0)] wire52;
  reg [(4'hc):(1'h0)] reg65 = (1'h0);
  reg [(4'hd):(1'h0)] reg64 = (1'h0);
  reg [(3'h7):(1'h0)] reg63 = (1'h0);
  reg [(4'hb):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg61 = (1'h0);
  reg [(4'h9):(1'h0)] reg60 = (1'h0);
  reg [(3'h4):(1'h0)] reg59 = (1'h0);
  reg [(3'h6):(1'h0)] reg58 = (1'h0);
  reg [(5'h11):(1'h0)] reg57 = (1'h0);
  reg [(5'h15):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg55 = (1'h0);
  reg signed [(4'he):(1'h0)] reg54 = (1'h0);
  assign y = {wire66,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire52,
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
                 (1'h0)};
  assign wire9 = wire6;
  assign wire10 = {wire5[(1'h0):(1'h0)]};
  assign wire11 = $unsigned($unsigned($signed((7'h42))));
  assign wire12 = wire10;
  assign wire13 = {(($unsigned($unsigned(wire5)) ?
                              wire6[(1'h0):(1'h0)] : ($signed(wire5) < (|wire8))) ?
                          $signed($signed((wire6 - wire8))) : $signed(($signed(wire10) ^ ((8'ha5) * wire6))))};
  assign wire14 = {($unsigned((8'hb5)) ?
                          wire9[(2'h3):(1'h0)] : $unsigned(wire7))};
  assign wire15 = $signed((8'hbd));
  assign wire16 = $signed(wire15);
  module17 #() modinst53 (.wire20(wire7), .wire21(wire11), .wire22(wire5), .wire18(wire16), .wire19(wire10), .clk(clk), .y(wire52));
  always
    @(posedge clk) begin
      reg54 <= wire12;
      reg55 <= (wire11[(3'h7):(1'h0)] < (!wire11[(3'h6):(2'h3)]));
      if ((((-((wire52 ? wire7 : wire5) & $unsigned(wire8))) ?
              wire8[(3'h4):(2'h2)] : ($unsigned($unsigned(wire7)) ?
                  wire10 : ((wire11 ^ (7'h42)) <= wire12[(3'h6):(1'h0)]))) ?
          {wire13} : $signed($signed($signed(wire16)))))
        begin
          if (wire13[(5'h11):(3'h6)])
            begin
              reg56 <= (($signed($signed(wire5)) ? (8'hb1) : wire5) ?
                  $unsigned($unsigned((^(^wire11)))) : (+$unsigned(wire11)));
              reg57 <= wire13[(3'h6):(2'h2)];
              reg58 <= (~|$unsigned(wire11[(3'h7):(3'h5)]));
            end
          else
            begin
              reg56 <= (~|{{$unsigned((reg57 ? reg55 : wire8))}});
            end
          reg59 <= ((|(wire5 ^ ($unsigned(reg57) ?
              $signed(wire14) : $signed((8'hb5))))) < (wire52[(4'h8):(1'h0)] ?
              (wire52 >= {wire8}) : wire16[(3'h4):(2'h2)]));
          reg60 <= ($signed($unsigned($unsigned((wire5 < reg57)))) <= $signed((&$signed(wire13[(3'h4):(1'h1)]))));
          if ((reg59 & ($unsigned((|{wire14, reg54})) || ({(-wire8)} ?
              ((~&wire52) ^ wire16) : wire6[(3'h7):(3'h5)]))))
            begin
              reg61 <= $signed($unsigned((wire12[(3'h5):(1'h1)] ?
                  $unsigned((+wire5)) : reg56[(5'h10):(2'h3)])));
              reg62 <= reg55[(5'h11):(4'hd)];
              reg63 <= (((&(^~wire15)) * (($unsigned(wire14) ?
                  (~&wire11) : reg56) > {(^~reg59), $signed(reg60)})) < reg57);
              reg64 <= $signed($unsigned(($signed((reg56 ?
                  reg62 : reg56)) != reg63[(1'h0):(1'h0)])));
            end
          else
            begin
              reg61 <= (+$unsigned(((8'ha6) ? reg60 : $signed((8'hb8)))));
              reg62 <= (-(&wire14));
              reg63 <= $unsigned((8'hb9));
              reg64 <= $unsigned((^~reg64));
              reg65 <= {wire7, {$unsigned({wire14[(2'h3):(1'h1)]})}};
            end
        end
      else
        begin
          reg56 <= $unsigned($signed($unsigned({(|reg59)})));
        end
    end
  assign wire66 = $unsigned((reg63[(3'h5):(3'h5)] ?
                      ({reg58, (~(8'hac))} ?
                          ((-wire9) - (-(8'ha9))) : (^$signed(wire14))) : (+reg59)));
endmodule

module module17
#(parameter param51 = ((8'ha5) | (7'h44)))
(y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'h13f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire22;
  input wire [(3'h5):(1'h0)] wire21;
  input wire [(4'ha):(1'h0)] wire20;
  input wire [(4'hb):(1'h0)] wire19;
  input wire [(4'hd):(1'h0)] wire18;
  wire signed [(4'hb):(1'h0)] wire50;
  wire signed [(4'he):(1'h0)] wire49;
  wire [(5'h11):(1'h0)] wire48;
  wire [(4'h9):(1'h0)] wire47;
  wire signed [(3'h4):(1'h0)] wire46;
  wire [(5'h14):(1'h0)] wire45;
  wire [(4'h8):(1'h0)] wire44;
  wire signed [(5'h14):(1'h0)] wire43;
  wire signed [(2'h2):(1'h0)] wire40;
  wire signed [(5'h13):(1'h0)] wire32;
  wire signed [(2'h2):(1'h0)] wire31;
  wire [(5'h11):(1'h0)] wire23;
  reg [(3'h4):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg41 = (1'h0);
  reg [(3'h6):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg38 = (1'h0);
  reg [(4'h9):(1'h0)] reg37 = (1'h0);
  reg [(3'h4):(1'h0)] reg36 = (1'h0);
  reg [(5'h13):(1'h0)] reg35 = (1'h0);
  reg [(3'h6):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg29 = (1'h0);
  reg [(5'h14):(1'h0)] reg28 = (1'h0);
  reg [(4'hf):(1'h0)] reg27 = (1'h0);
  reg [(4'he):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg25 = (1'h0);
  reg [(3'h5):(1'h0)] reg24 = (1'h0);
  assign y = {wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire40,
                 wire32,
                 wire31,
                 wire23,
                 reg42,
                 reg41,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 (1'h0)};
  assign wire23 = {(^~$unsigned((wire19[(3'h7):(1'h1)] > $unsigned(wire21))))};
  always
    @(posedge clk) begin
      if (wire18[(4'h8):(1'h0)])
        begin
          reg24 <= wire19;
        end
      else
        begin
          reg24 <= (wire18[(2'h3):(2'h2)] ?
              ((8'hb5) ?
                  $unsigned(({wire22} >>> wire20)) : wire23) : {{{$signed(wire21),
                          $unsigned(wire19)},
                      $unsigned((wire21 ? wire18 : wire20))},
                  wire20[(3'h6):(2'h2)]});
          reg25 <= (|$signed($unsigned($signed((wire18 ? wire21 : wire18)))));
          reg26 <= {(wire23 <<< (8'hbf))};
        end
      reg27 <= ((($signed({(8'h9c), wire19}) * $signed((wire22 ?
                  wire20 : wire23))) ?
              {{$unsigned(wire21), $unsigned(wire20)}} : (^{wire19})) ?
          $unsigned(($unsigned(wire22) ?
              (~wire19[(3'h4):(2'h2)]) : wire20[(3'h5):(1'h1)])) : $unsigned(wire19[(4'h9):(3'h5)]));
      reg28 <= (^reg27);
      reg29 <= (wire22 ~^ reg24);
      reg30 <= $signed(($signed({(wire21 ? reg26 : wire20),
          (wire22 && (8'hb8))}) || (&{$signed(reg26)})));
    end
  assign wire31 = $unsigned($unsigned(wire22));
  assign wire32 = ($unsigned((^~{$unsigned((8'h9d)),
                      (reg30 ? reg30 : reg29)})) >= wire19[(4'h8):(2'h2)]);
  always
    @(posedge clk) begin
      reg33 <= (+reg26);
      reg34 <= wire20[(4'h9):(3'h4)];
      if ((8'ha9))
        begin
          reg35 <= reg33[(2'h2):(2'h2)];
          reg36 <= (((~(8'haf)) + (wire23[(2'h3):(1'h0)] ?
                  ((^~reg35) ^~ {(8'h9c)}) : reg25)) ?
              (reg28[(4'hc):(2'h2)] ?
                  (^(reg25[(3'h6):(2'h2)] ?
                      {wire31} : reg27[(2'h3):(1'h0)])) : ($signed({wire21}) || wire19[(3'h5):(2'h3)])) : $signed($unsigned({(~|reg30),
                  (reg34 ? reg35 : (8'hb1))})));
          reg37 <= $signed(wire23[(4'hd):(4'hd)]);
        end
      else
        begin
          reg35 <= ((((8'hae) == (~(reg26 ? reg28 : reg33))) ?
              $unsigned($signed($signed(wire32))) : wire32) ^~ $signed((~&$unsigned(reg27))));
          reg36 <= (reg25 == (~&wire21));
          reg37 <= (~|($unsigned(($signed((8'hb2)) * $unsigned(reg35))) >= $unsigned($unsigned(reg36))));
          reg38 <= ($signed((reg28 >>> $signed((+(8'hb1))))) ?
              wire32[(5'h10):(1'h1)] : $signed(wire31[(2'h2):(2'h2)]));
        end
      reg39 <= reg26[(4'h9):(3'h5)];
    end
  assign wire40 = $signed(wire18);
  always
    @(posedge clk) begin
      reg41 <= reg34[(3'h5):(1'h1)];
      reg42 <= $unsigned(reg26[(3'h4):(1'h0)]);
    end
  assign wire43 = (reg25[(4'h9):(3'h6)] ?
                      ({(8'haf)} ?
                          {(~^{wire23})} : wire31) : (~&(~|($unsigned(reg35) ?
                          $unsigned(reg37) : $unsigned(reg25)))));
  assign wire44 = reg28;
  assign wire45 = reg27[(3'h6):(3'h6)];
  assign wire46 = $unsigned($unsigned(wire22[(2'h2):(1'h1)]));
  assign wire47 = wire32;
  assign wire48 = reg39;
  assign wire49 = reg36[(2'h2):(1'h1)];
  assign wire50 = reg29[(4'hd):(4'hd)];
endmodule
