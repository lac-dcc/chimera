module top
#(parameter param109 = ({((+((8'ha6) ? (8'hbf) : (8'hab))) ? (((8'hac) & (8'hab)) >>> {(8'haf)}) : {((8'ha8) ~^ (8'h9c)), (&(8'hab))})} ? ({(((8'ha3) <<< (8'ha3)) >>> (~&(8'hb6))), (-((8'h9f) > (8'hbd)))} ? ((^((8'hbb) && (8'h9f))) ? (&{(8'hbc), (8'hb7)}) : (((8'ha3) == (7'h44)) | (8'hb3))) : (8'hb8)) : (8'h9c)))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h41):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire0;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire3;
  wire [(5'h10):(1'h0)] wire108;
  wire signed [(3'h6):(1'h0)] wire107;
  wire signed [(4'hf):(1'h0)] wire106;
  wire [(4'hc):(1'h0)] wire4;
  wire signed [(4'hf):(1'h0)] wire104;
  assign y = {wire108, wire107, wire106, wire4, wire104, (1'h0)};
  assign wire4 = (+(wire3[(5'h13):(5'h11)] ?
                     $signed($unsigned(wire3)) : (|({wire3} ?
                         (wire0 - wire3) : $signed((8'ha8))))));
  module5 #() modinst105 (wire104, clk, wire4, wire0, wire1, wire2, wire3);
  assign wire106 = (^~$signed(((wire0 ? wire0 : (wire2 - wire2)) ?
                       wire2 : ((wire104 ? wire0 : wire104) ?
                           $signed(wire3) : ((8'haf) >> (8'h9f))))));
  assign wire107 = $unsigned(wire4[(3'h6):(3'h4)]);
  assign wire108 = ($signed(wire107[(3'h5):(3'h4)]) ?
                       ($unsigned($signed($signed((7'h42)))) ?
                           (((wire0 >>> wire3) * $unsigned(wire3)) ?
                               $signed(((8'hae) & (8'h9f))) : $unsigned($unsigned(wire4))) : wire1) : $signed(wire106));
endmodule

module module5
#(parameter param103 = (~((+((~|(8'hb9)) <<< {(8'h9c), (7'h40)})) ? ((+((8'hb8) ^ (8'ha0))) && (^~((8'hbb) < (8'hb6)))) : ((+{(8'had), (8'had)}) ? (((8'ha3) == (8'had)) ? ((8'hb5) ? (8'hb1) : (8'ha7)) : ((8'ha7) ? (8'ha0) : (8'ha1))) : (((8'hb1) & (7'h42)) ? ((8'hbc) ? (8'hbe) : (8'hb3)) : (|(8'hae)))))))
(y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h168):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire6;
  input wire signed [(3'h4):(1'h0)] wire7;
  input wire [(4'h8):(1'h0)] wire8;
  input wire [(5'h11):(1'h0)] wire9;
  input wire signed [(4'hf):(1'h0)] wire10;
  wire [(3'h4):(1'h0)] wire102;
  wire signed [(4'hb):(1'h0)] wire101;
  wire [(4'he):(1'h0)] wire100;
  wire [(3'h6):(1'h0)] wire99;
  wire [(4'h9):(1'h0)] wire98;
  wire [(4'he):(1'h0)] wire96;
  wire signed [(4'hb):(1'h0)] wire81;
  wire signed [(5'h13):(1'h0)] wire80;
  wire [(4'he):(1'h0)] wire78;
  wire [(5'h15):(1'h0)] wire65;
  wire [(5'h11):(1'h0)] wire64;
  wire signed [(3'h7):(1'h0)] wire60;
  wire [(4'ha):(1'h0)] wire11;
  wire signed [(5'h11):(1'h0)] wire12;
  wire signed [(3'h4):(1'h0)] wire13;
  wire signed [(5'h14):(1'h0)] wire14;
  wire [(5'h12):(1'h0)] wire15;
  wire signed [(5'h14):(1'h0)] wire16;
  wire [(5'h11):(1'h0)] wire17;
  wire signed [(4'hd):(1'h0)] wire21;
  wire [(4'h8):(1'h0)] wire58;
  reg signed [(4'h8):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg19 = (1'h0);
  reg [(3'h7):(1'h0)] reg18 = (1'h0);
  reg [(5'h14):(1'h0)] reg61 = (1'h0);
  reg [(4'hb):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg63 = (1'h0);
  assign y = {wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire96,
                 wire81,
                 wire80,
                 wire78,
                 wire65,
                 wire64,
                 wire60,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire21,
                 wire58,
                 reg20,
                 reg19,
                 reg18,
                 reg61,
                 reg62,
                 reg63,
                 (1'h0)};
  assign wire11 = {((&$signed(wire8[(4'h8):(3'h4)])) ?
                          {(~|wire10)} : $signed(($signed((8'h9d)) < $signed(wire8))))};
  assign wire12 = (!(wire6 ? wire7[(2'h2):(2'h2)] : (~&$unsigned({wire6}))));
  assign wire13 = (&wire6[(3'h6):(1'h0)]);
  assign wire14 = (~wire12);
  assign wire15 = ($unsigned($unsigned({(wire12 != wire9), $signed(wire10)})) ?
                      $unsigned(wire10) : (wire8 && wire7));
  assign wire16 = ((|(~&((^~wire7) >= wire10[(4'h8):(3'h4)]))) ^ (~(((^wire8) ?
                      {wire9} : (wire7 != wire9)) & wire14[(2'h2):(1'h0)])));
  assign wire17 = (((|$unsigned($unsigned(wire15))) ?
                          ((+{wire11}) ?
                              wire6[(4'h8):(1'h0)] : (wire15[(3'h5):(2'h3)] ?
                                  (~|wire13) : (8'ha7))) : wire10[(4'h9):(2'h2)]) ?
                      wire14[(3'h5):(1'h1)] : wire13[(3'h4):(1'h0)]);
  always
    @(posedge clk) begin
      reg18 <= $signed(($signed(wire7) ~^ wire16));
      reg19 <= {$signed($signed($signed($unsigned(wire6))))};
      reg20 <= (wire17 ^~ (reg18[(3'h5):(3'h5)] >= (|$signed((^reg18)))));
    end
  assign wire21 = wire13[(3'h4):(3'h4)];
  module22 #() modinst59 (wire58, clk, wire12, wire15, reg18, wire14);
  assign wire60 = {(-$signed({$signed(wire15), {wire8, wire15}}))};
  always
    @(posedge clk) begin
      reg61 <= (wire8[(3'h5):(1'h1)] ? (~&wire60) : (|{wire7}));
      reg62 <= (!(~&wire6));
      reg63 <= $unsigned(wire13);
    end
  assign wire64 = wire60;
  assign wire65 = (reg19 ? $unsigned(wire12) : {$signed((8'had))});
  module66 #() modinst79 (.wire70(wire10), .wire67(wire6), .wire68(wire9), .clk(clk), .y(wire78), .wire69(wire13));
  assign wire80 = {$unsigned((8'hb5))};
  assign wire81 = {$unsigned(reg19[(5'h11):(1'h0)]), wire8[(3'h5):(1'h0)]};
  module82 #() modinst97 (wire96, clk, wire64, wire9, wire16, wire65, reg18);
  assign wire98 = (^~(^~(wire8[(1'h1):(1'h1)] ?
                      $unsigned((wire8 ?
                          wire21 : wire64)) : ($unsigned(wire65) <= wire11[(1'h0):(1'h0)]))));
  assign wire99 = {(wire16[(1'h0):(1'h0)] ?
                          $signed(((~reg20) >= reg18[(1'h0):(1'h0)])) : $signed(wire6))};
  assign wire100 = ($unsigned($signed((-(&wire99)))) ?
                       (wire96[(4'hb):(4'h8)] ?
                           $unsigned((!{wire58})) : (wire10 != $signed((~|wire6)))) : ($unsigned(wire8) != ((7'h41) ^~ (!(wire78 | wire15)))));
  assign wire101 = (~(^~reg18));
  assign wire102 = wire58[(3'h5):(1'h0)];
endmodule

module module82
#(parameter param94 = ((((((8'h9d) ? (8'ha0) : (8'hb7)) ? ((8'ha5) ? (8'h9d) : (8'ha9)) : ((8'hb6) ~^ (7'h44))) - (((8'hac) ? (7'h44) : (7'h44)) != {(8'had), (8'hbf)})) ? (-(((8'hac) >>> (8'ha1)) ? ((8'hb9) & (8'hb0)) : (~^(8'ha0)))) : (&({(8'h9f)} ? {(8'hac)} : (^~(8'hbf))))) && ((~^{(~^(8'hae)), (7'h42)}) ^ (&(((8'hbd) ? (7'h44) : (8'had)) ? ((8'hbc) ? (8'ha7) : (7'h42)) : ((8'hbc) != (7'h44)))))), 
parameter param95 = (((((param94 ? param94 : param94) ? ((7'h44) || param94) : (param94 <<< param94)) ? (param94 ? (~|(8'ha3)) : {param94}) : {(param94 ? param94 : param94)}) ? ((param94 ? param94 : {param94}) ? param94 : param94) : {param94}) * {(&(param94 ? (~param94) : param94))}))
(y, clk, wire87, wire86, wire85, wire84, wire83);
  output wire [(32'h4b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire87;
  input wire signed [(4'h8):(1'h0)] wire86;
  input wire [(5'h14):(1'h0)] wire85;
  input wire [(5'h15):(1'h0)] wire84;
  input wire [(3'h7):(1'h0)] wire83;
  wire [(5'h13):(1'h0)] wire93;
  wire signed [(4'hc):(1'h0)] wire92;
  wire [(5'h14):(1'h0)] wire91;
  wire signed [(2'h3):(1'h0)] wire90;
  wire signed [(2'h3):(1'h0)] wire89;
  wire signed [(5'h11):(1'h0)] wire88;
  assign y = {wire93, wire92, wire91, wire90, wire89, wire88, (1'h0)};
  assign wire88 = (wire83[(1'h1):(1'h1)] ?
                      wire87 : ({wire83,
                          $unsigned((wire86 >>> wire86))} & ((~^$signed(wire84)) ~^ ($unsigned(wire85) && ((8'h9c) ?
                          wire84 : wire83)))));
  assign wire89 = {(~({$signed(wire84)} ? wire84 : wire83[(2'h2):(1'h0)])),
                      $signed($signed(wire87[(3'h6):(2'h2)]))};
  assign wire90 = (wire87 || {(wire89[(2'h3):(1'h1)] > (|$signed(wire83))),
                      wire87});
  assign wire91 = {(wire90 ?
                          (wire87[(4'h8):(3'h6)] <<< $unsigned((wire83 ^~ wire89))) : (~|wire89[(1'h0):(1'h0)]))};
  assign wire92 = $unsigned(({$signed($signed(wire86)),
                          $signed($unsigned(wire83))} ?
                      ($unsigned({wire84,
                          (8'hac)}) > $unsigned((wire91 >>> wire90))) : {wire86[(1'h0):(1'h0)]}));
  assign wire93 = wire88[(4'ha):(4'h8)];
endmodule

module module66  (y, clk, wire70, wire69, wire68, wire67);
  output wire [(32'h66):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire70;
  input wire signed [(2'h3):(1'h0)] wire69;
  input wire signed [(5'h10):(1'h0)] wire68;
  input wire signed [(4'hc):(1'h0)] wire67;
  wire signed [(4'hb):(1'h0)] wire77;
  wire signed [(5'h12):(1'h0)] wire76;
  wire signed [(3'h7):(1'h0)] wire75;
  wire [(5'h14):(1'h0)] wire74;
  wire [(4'hf):(1'h0)] wire73;
  wire signed [(4'ha):(1'h0)] wire71;
  reg signed [(5'h14):(1'h0)] reg72 = (1'h0);
  assign y = {wire77, wire76, wire75, wire74, wire73, wire71, reg72, (1'h0)};
  assign wire71 = wire70[(4'ha):(3'h5)];
  always
    @(posedge clk) begin
      reg72 <= $signed(wire68);
    end
  assign wire73 = $unsigned({wire71});
  assign wire74 = wire69;
  assign wire75 = wire67[(2'h3):(1'h1)];
  assign wire76 = wire71;
  assign wire77 = $signed(((reg72[(2'h2):(2'h2)] << reg72[(5'h11):(4'h9)]) ?
                      ($unsigned($signed(wire70)) < wire71) : ((-(&reg72)) & {$signed(wire70)})));
endmodule

module module22
#(parameter param57 = ((^((((8'ha8) ? (8'hb5) : (8'hb5)) ? (^~(8'hb1)) : (7'h43)) ~^ (((8'hab) < (8'haf)) ? {(8'ha1), (8'hb6)} : {(8'hbe), (8'ha8)}))) << (((~&((8'ha4) ^ (8'hb3))) ? (((8'ha8) ? (8'h9e) : (8'had)) << ((8'hb2) ^ (8'hb4))) : {(8'ha0), (-(7'h41))}) + ((((8'ha7) ? (8'h9c) : (8'h9f)) < {(8'hb5), (8'hb8)}) >> (~|((8'hb2) ? (8'h9e) : (7'h43)))))))
(y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'h168):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire26;
  input wire signed [(5'h12):(1'h0)] wire25;
  input wire signed [(2'h3):(1'h0)] wire24;
  input wire signed [(4'hc):(1'h0)] wire23;
  wire [(3'h5):(1'h0)] wire56;
  wire signed [(2'h3):(1'h0)] wire50;
  wire signed [(5'h15):(1'h0)] wire49;
  wire signed [(4'hb):(1'h0)] wire48;
  wire signed [(4'h8):(1'h0)] wire47;
  wire signed [(4'he):(1'h0)] wire46;
  wire [(5'h12):(1'h0)] wire45;
  wire signed [(4'ha):(1'h0)] wire44;
  wire [(4'h8):(1'h0)] wire43;
  wire signed [(4'h9):(1'h0)] wire42;
  wire signed [(4'h8):(1'h0)] wire41;
  wire signed [(5'h13):(1'h0)] wire40;
  reg [(4'h9):(1'h0)] reg55 = (1'h0);
  reg [(5'h10):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg53 = (1'h0);
  reg [(4'hb):(1'h0)] reg52 = (1'h0);
  reg signed [(4'he):(1'h0)] reg51 = (1'h0);
  reg [(5'h11):(1'h0)] reg39 = (1'h0);
  reg [(4'hd):(1'h0)] reg38 = (1'h0);
  reg [(4'h8):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg36 = (1'h0);
  reg [(4'hd):(1'h0)] reg35 = (1'h0);
  reg [(4'hc):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg33 = (1'h0);
  reg [(3'h5):(1'h0)] reg32 = (1'h0);
  reg [(5'h10):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg29 = (1'h0);
  reg [(4'hb):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg27 = (1'h0);
  assign y = {wire56,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (((((~^(^~wire26)) ?
          $signed($signed(wire24)) : ({(7'h42), wire24} ?
              $signed((8'ha6)) : $unsigned(wire26))) + (~wire23)) < ({$unsigned($unsigned(wire23))} ^ (wire23[(4'ha):(3'h5)] ?
          $signed($unsigned(wire24)) : (~$unsigned((8'h9e)))))))
        begin
          if (wire26)
            begin
              reg27 <= $signed($unsigned(wire24[(2'h2):(1'h1)]));
              reg28 <= $signed(($signed(wire23[(4'h8):(4'h8)]) ?
                  (~^(wire23 ?
                      ((7'h43) ?
                          wire25 : wire26) : $unsigned(wire23))) : (~^$signed((reg27 * wire25)))));
              reg29 <= (((-(|(wire25 >> reg28))) ?
                  reg28[(1'h1):(1'h1)] : {$unsigned(wire24[(1'h0):(1'h0)])}) <= (~{($signed(wire24) ?
                      (wire23 >>> wire23) : wire24[(2'h3):(1'h0)]),
                  ({wire25, (8'hbf)} >>> (wire23 ? wire25 : wire26))}));
              reg30 <= {$unsigned((($unsigned(wire23) ?
                      (-(8'ha7)) : $signed(wire26)) >> wire26[(3'h6):(2'h3)]))};
              reg31 <= $unsigned(reg28);
            end
          else
            begin
              reg27 <= $signed((wire23[(4'h8):(3'h4)] ?
                  $signed($signed($signed(wire25))) : {$signed($signed(reg29)),
                      $signed(reg28)}));
            end
          reg32 <= wire26;
        end
      else
        begin
          reg27 <= $signed(((&$signed($unsigned(reg27))) ?
              (~(|(reg27 != reg28))) : (~|reg31)));
          reg28 <= ($unsigned((+$signed((8'h9e)))) ?
              ($signed(($unsigned(reg32) ?
                  {reg31} : reg29[(1'h1):(1'h0)])) ^ ($signed($signed(reg27)) | ($signed(reg31) <= (8'hb0)))) : reg32[(1'h0):(1'h0)]);
          reg29 <= $signed((8'ha3));
          reg30 <= $unsigned(reg29);
          reg31 <= wire24[(2'h3):(2'h3)];
        end
      reg33 <= (8'hb6);
    end
  always
    @(posedge clk) begin
      if ((8'hba))
        begin
          if (reg31)
            begin
              reg34 <= ($signed(($signed($unsigned(reg31)) && $signed((~^reg32)))) ?
                  ((7'h44) > $signed($unsigned((reg28 ?
                      wire24 : (8'hb5))))) : reg30[(4'h8):(2'h2)]);
              reg35 <= reg31;
              reg36 <= reg30[(2'h2):(1'h1)];
              reg37 <= reg36[(4'hf):(3'h6)];
            end
          else
            begin
              reg34 <= $unsigned($signed(wire23));
            end
          reg38 <= reg27;
        end
      else
        begin
          if ($signed(reg31))
            begin
              reg34 <= $signed(($signed((^~$unsigned(reg30))) ?
                  $unsigned(({reg38,
                      reg34} << reg35)) : $unsigned(((reg27 && reg33) * $unsigned(reg32)))));
              reg35 <= (reg30[(1'h1):(1'h0)] ?
                  $unsigned(wire24) : $signed(((&$unsigned(wire25)) - (^(~&wire26)))));
            end
          else
            begin
              reg34 <= wire24;
              reg35 <= (8'hb0);
              reg36 <= ((+$signed({reg31})) ?
                  reg30 : $unsigned((|$signed((reg33 ? (8'hb6) : reg38)))));
              reg37 <= ((reg36 ?
                      (~|$unsigned(wire24[(2'h3):(2'h2)])) : $unsigned($unsigned((reg32 ?
                          reg33 : (8'ha3))))) ?
                  (-$unsigned((reg36[(5'h12):(1'h1)] >> $signed((8'hac))))) : (~|$unsigned(reg29)));
              reg38 <= (-reg27);
            end
        end
      reg39 <= ($unsigned(reg31[(4'hd):(4'hb)]) ?
          $signed(reg33[(3'h6):(1'h0)]) : (reg36 ?
              ($signed((reg32 ?
                  wire24 : reg28)) < reg33[(4'h9):(3'h6)]) : reg32));
    end
  assign wire40 = $signed(reg30);
  assign wire41 = reg37;
  assign wire42 = {reg29[(4'hb):(2'h2)]};
  assign wire43 = {(-{$signed(wire23[(3'h7):(2'h2)])})};
  assign wire44 = (~&$signed(reg30[(3'h6):(3'h6)]));
  assign wire45 = ((reg39[(3'h6):(3'h5)] ?
                          reg30 : (~^($unsigned(wire44) << (8'hb0)))) ?
                      (&(-wire42[(2'h3):(2'h3)])) : $signed((reg35[(3'h7):(2'h3)] <= $signed($signed(reg36)))));
  assign wire46 = reg37;
  assign wire47 = (~^(($signed((reg34 ? reg30 : wire25)) ?
                      $unsigned($signed(reg39)) : (8'ha2)) >>> wire23));
  assign wire48 = (~&reg28);
  assign wire49 = $signed((|(|wire42)));
  assign wire50 = ($signed($signed((+(reg32 ? wire42 : wire44)))) * reg33);
  always
    @(posedge clk) begin
      reg51 <= {$signed(wire26[(1'h0):(1'h0)]),
          (+{wire41, {reg29, ((8'hbf) >> reg37)}})};
      reg52 <= wire45[(1'h1):(1'h1)];
      reg53 <= (^$signed($unsigned($unsigned(wire42[(1'h1):(1'h0)]))));
      reg54 <= $unsigned(reg36);
      reg55 <= $unsigned($unsigned($signed(((reg53 ^~ wire49) ?
          (~^(7'h40)) : (reg34 ? reg27 : wire49)))));
    end
  assign wire56 = (!(-$signed($unsigned(reg53))));
endmodule
