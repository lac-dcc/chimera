module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h235):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire4;
  input wire [(4'h9):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire signed [(4'hc):(1'h0)] wire147;
  wire [(5'h12):(1'h0)] wire146;
  wire [(4'hc):(1'h0)] wire145;
  wire [(4'h9):(1'h0)] wire144;
  wire signed [(3'h4):(1'h0)] wire143;
  wire [(3'h6):(1'h0)] wire142;
  wire signed [(4'h8):(1'h0)] wire141;
  wire signed [(4'h8):(1'h0)] wire140;
  wire [(3'h7):(1'h0)] wire139;
  wire [(4'hd):(1'h0)] wire138;
  wire signed [(4'he):(1'h0)] wire127;
  wire [(4'he):(1'h0)] wire126;
  wire signed [(3'h7):(1'h0)] wire125;
  wire signed [(4'hc):(1'h0)] wire124;
  wire [(5'h11):(1'h0)] wire119;
  wire [(4'hd):(1'h0)] wire92;
  wire signed [(5'h14):(1'h0)] wire90;
  wire signed [(5'h11):(1'h0)] wire121;
  wire signed [(5'h13):(1'h0)] wire122;
  reg signed [(5'h15):(1'h0)] reg150 = (1'h0);
  reg [(4'hb):(1'h0)] reg149 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg148 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg137 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg136 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg134 = (1'h0);
  reg [(4'hc):(1'h0)] reg133 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg132 = (1'h0);
  reg [(4'hf):(1'h0)] reg131 = (1'h0);
  reg [(4'hd):(1'h0)] reg130 = (1'h0);
  reg [(5'h10):(1'h0)] reg129 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg128 = (1'h0);
  reg [(5'h12):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg18 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(5'h14):(1'h0)] reg16 = (1'h0);
  reg [(2'h2):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg9 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg8 = (1'h0);
  reg [(4'hb):(1'h0)] reg7 = (1'h0);
  reg [(5'h14):(1'h0)] reg6 = (1'h0);
  reg [(3'h5):(1'h0)] reg5 = (1'h0);
  assign y = {wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire119,
                 wire92,
                 wire90,
                 wire121,
                 wire122,
                 reg150,
                 reg149,
                 reg148,
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
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($unsigned($signed(((~|wire2[(3'h4):(2'h3)]) ?
          ($signed(wire0) ?
              (wire4 ? wire0 : wire1) : (wire4 & wire2)) : ({wire4} ?
              wire3 : (wire3 >> wire0))))))
        begin
          reg5 <= wire2;
          reg6 <= (8'h9d);
        end
      else
        begin
          if ((((~$signed((reg6 * wire4))) <= wire0) ?
              wire1[(5'h15):(4'ha)] : ({reg5, $signed((^(8'hab)))} ?
                  reg5[(1'h0):(1'h0)] : reg6)))
            begin
              reg5 <= ((+($signed(reg5[(2'h3):(2'h2)]) & wire0)) <= $signed({$unsigned((reg5 == wire0)),
                  ({wire0} <= wire4[(4'hd):(4'ha)])}));
              reg6 <= wire2[(2'h3):(1'h0)];
              reg7 <= $unsigned(wire4);
              reg8 <= $unsigned(((^~((&wire0) ?
                  (wire0 ?
                      reg6 : reg7) : $signed((8'hbf)))) > $unsigned(((wire3 ?
                      wire4 : (8'h9d)) ?
                  (!wire0) : $signed(wire0)))));
              reg9 <= wire4;
            end
          else
            begin
              reg5 <= wire0[(3'h7):(1'h0)];
              reg6 <= (wire4 ?
                  (($signed($signed((8'ha0))) >= (wire3 ?
                          reg5[(3'h4):(2'h2)] : (+reg9))) ?
                      (reg8[(1'h0):(1'h0)] >> ((reg5 ? wire0 : wire4) ?
                          $unsigned((8'haa)) : $signed(reg5))) : ($unsigned(reg5) ?
                          wire1[(4'hb):(2'h3)] : {$signed(wire3)})) : $unsigned(($unsigned((wire1 >= (8'ha0))) - $unsigned(wire3[(3'h5):(1'h1)]))));
              reg7 <= $unsigned(((((wire3 << (8'hb8)) > wire2[(4'hd):(4'h8)]) ?
                  (|reg8[(1'h1):(1'h1)]) : $signed((wire1 - (8'ha9)))) & ((reg5[(1'h0):(1'h0)] >> $unsigned(wire3)) == $signed(wire1[(5'h14):(3'h5)]))));
              reg8 <= (8'hab);
            end
          if (reg8)
            begin
              reg10 <= (reg8[(4'h8):(3'h5)] ?
                  $unsigned((~&wire0[(2'h2):(2'h2)])) : ((reg8 << {$signed(reg7),
                          reg8[(4'h8):(3'h4)]}) ?
                      (wire2[(2'h3):(2'h3)] == (^~reg5)) : reg8));
              reg11 <= (((~{wire4[(4'hb):(1'h1)]}) ?
                      (-wire3) : $signed({(^~(7'h42)),
                          ((8'ha3) ? wire4 : wire0)})) ?
                  $unsigned(reg6[(1'h0):(1'h0)]) : reg9);
              reg12 <= $signed({(8'hb2)});
              reg13 <= $unsigned(({$signed(reg7),
                  $signed((reg6 ? wire2 : reg12))} || $signed((~|reg6))));
            end
          else
            begin
              reg10 <= (|$unsigned($unsigned(wire0[(3'h6):(3'h4)])));
              reg11 <= reg12[(3'h5):(3'h4)];
              reg12 <= reg10;
              reg13 <= $signed($unsigned({$signed((!reg10)),
                  reg5[(1'h0):(1'h0)]}));
            end
        end
      if (((wire1 ?
              $signed($signed(reg12[(4'h9):(2'h3)])) : $signed(((reg12 ?
                  reg9 : reg9) != (+reg8)))) ?
          ({(~^(reg9 || reg8))} - ((^~(wire0 < wire4)) <= $signed((reg12 + (8'hbf))))) : (~^{(!wire2[(2'h3):(1'h0)])})))
        begin
          reg14 <= wire2;
          reg15 <= reg11[(3'h4):(1'h0)];
          reg16 <= (((reg7[(3'h4):(3'h4)] >> wire1[(1'h0):(1'h0)]) ~^ {wire2}) >>> reg13[(3'h6):(3'h6)]);
        end
      else
        begin
          reg14 <= (^wire3[(3'h7):(2'h3)]);
        end
      reg17 <= $signed($unsigned((wire3[(4'h9):(4'h8)] ?
          reg9 : $unsigned((reg15 ? (8'ha8) : reg16)))));
      reg18 <= reg12;
      reg19 <= (^~((|reg18[(4'h9):(3'h7)]) ?
          {wire4[(4'he):(4'h8)]} : reg9[(4'hc):(4'hc)]));
    end
  module20 #() modinst91 (.wire22(reg6), .wire24(reg12), .y(wire90), .wire21(wire0), .clk(clk), .wire23(wire1));
  assign wire92 = $unsigned(((~|$signed((~wire0))) ?
                      ($unsigned((reg7 >= reg17)) ?
                          (+(+wire3)) : (reg19[(5'h11):(3'h5)] && (&reg9))) : {$unsigned(reg16[(1'h0):(1'h0)]),
                          wire90}));
  module93 #() modinst120 (.wire97(reg7), .wire94(wire90), .y(wire119), .wire95(reg6), .wire96(reg12), .clk(clk));
  assign wire121 = (wire3[(3'h5):(1'h0)] >> (|wire119));
  module20 #() modinst123 (wire122, clk, wire1, reg10, reg16, reg19);
  assign wire124 = reg14;
  assign wire125 = (!wire122[(4'hb):(3'h6)]);
  assign wire126 = reg17[(4'hf):(4'hf)];
  assign wire127 = wire126[(3'h6):(3'h5)];
  always
    @(posedge clk) begin
      if ($unsigned(wire3[(3'h7):(3'h4)]))
        begin
          reg128 <= wire0;
        end
      else
        begin
          reg128 <= reg18[(1'h1):(1'h0)];
          if ($unsigned(($unsigned(($unsigned(reg11) && reg8[(1'h0):(1'h0)])) << {(wire4 >> (reg13 << wire4)),
              ($unsigned(wire124) & $unsigned(wire127))})))
            begin
              reg129 <= $signed(reg14);
              reg130 <= $signed($unsigned($signed(wire3[(1'h0):(1'h0)])));
              reg131 <= wire90;
            end
          else
            begin
              reg129 <= $unsigned({$unsigned(reg128[(1'h1):(1'h0)]),
                  (reg19[(3'h5):(3'h5)] ?
                      (reg130 != (~^wire4)) : $signed({(8'hbf), reg18}))});
              reg130 <= wire119[(1'h0):(1'h0)];
              reg131 <= reg14;
            end
          reg132 <= {(+$signed((wire119[(3'h4):(1'h1)] ?
                  (8'ha9) : (wire4 << wire122))))};
          if ($unsigned(((^(&(^~reg130))) || (^~reg19[(1'h1):(1'h0)]))))
            begin
              reg133 <= $signed((^~$unsigned($signed($signed(reg19)))));
            end
          else
            begin
              reg133 <= wire0[(4'ha):(3'h6)];
              reg134 <= $unsigned({$unsigned((~&$unsigned(wire92)))});
              reg135 <= $unsigned({$signed(((~&(8'ha1)) ^~ (~|reg13)))});
            end
          reg136 <= (+$signed({reg18}));
        end
      reg137 <= ((!(~|$unsigned((8'h9c)))) ^~ $signed((~^wire0[(2'h2):(1'h0)])));
    end
  assign wire138 = $signed((reg14 ?
                       $signed($signed($unsigned(wire124))) : ((~&wire0) > {reg14[(1'h0):(1'h0)],
                           {wire90}})));
  assign wire139 = reg9[(1'h0):(1'h0)];
  assign wire140 = $signed(({reg9[(4'hc):(4'h9)]} ~^ ($unsigned(((8'hbd) ?
                       wire126 : reg15)) >>> reg5)));
  assign wire141 = $signed(wire3);
  assign wire142 = wire92[(4'ha):(3'h6)];
  assign wire143 = $unsigned(wire138);
  assign wire144 = (|{(wire125 ?
                           ((&reg9) ?
                               $signed(reg8) : (&wire124)) : {(reg13 <= reg13),
                               wire2[(3'h5):(1'h1)]}),
                       (reg11[(1'h1):(1'h0)] ?
                           ((reg135 ?
                               reg9 : reg13) << (8'ha2)) : (&$signed(wire0)))});
  assign wire145 = reg130[(4'ha):(3'h6)];
  assign wire146 = reg10;
  assign wire147 = reg16[(3'h6):(2'h2)];
  always
    @(posedge clk) begin
      reg148 <= (reg10[(2'h2):(1'h1)] - $signed(reg135[(1'h0):(1'h0)]));
      reg149 <= {(~|wire3[(1'h1):(1'h1)])};
      reg150 <= $unsigned($signed(wire143[(2'h2):(1'h0)]));
    end
endmodule

module module93
#(parameter param118 = (!((^~(8'hbc)) ? ({((8'hae) < (8'hb5)), ((8'hae) >= (7'h40))} ? (~|((8'hb3) ? (7'h41) : (8'ha4))) : ((^~(8'hb9)) ? ((8'ha9) != (8'hb5)) : ((8'had) | (8'h9c)))) : (({(7'h44)} ~^ ((8'ha8) ? (8'ha8) : (8'hb2))) * {((8'hb5) ? (8'hbb) : (8'hb7))}))))
(y, clk, wire97, wire96, wire95, wire94);
  output wire [(32'h2e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire97;
  input wire signed [(5'h14):(1'h0)] wire96;
  input wire signed [(5'h10):(1'h0)] wire95;
  input wire [(5'h14):(1'h0)] wire94;
  wire signed [(2'h3):(1'h0)] wire117;
  wire [(3'h5):(1'h0)] wire116;
  wire [(3'h4):(1'h0)] wire115;
  wire [(4'hf):(1'h0)] wire114;
  wire [(4'ha):(1'h0)] wire113;
  wire [(4'h8):(1'h0)] wire111;
  assign y = {wire117, wire116, wire115, wire114, wire113, wire111, (1'h0)};
  module98 #() modinst112 (.wire99((8'hb0)), .wire101(wire95), .y(wire111), .clk(clk), .wire102(wire94), .wire103(wire97), .wire100(wire96));
  assign wire113 = (~^wire97);
  assign wire114 = (wire113[(4'h9):(3'h7)] ?
                       ((&wire95[(5'h10):(2'h2)]) <<< wire96[(3'h6):(3'h5)]) : wire113[(3'h4):(2'h2)]);
  assign wire115 = ((wire114[(3'h5):(3'h5)] ?
                       (&wire113[(3'h7):(2'h3)]) : (8'ha1)) ^ (wire96[(3'h4):(2'h3)] >= wire113));
  assign wire116 = (wire96[(3'h6):(3'h4)] || (8'hbe));
  assign wire117 = (&$unsigned(($signed((&wire113)) * $unsigned((-wire111)))));
endmodule

module module20  (y, clk, wire24, wire23, wire22, wire21);
  output wire [(32'hee):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire24;
  input wire [(4'hb):(1'h0)] wire23;
  input wire [(5'h14):(1'h0)] wire22;
  input wire signed [(5'h11):(1'h0)] wire21;
  wire [(5'h14):(1'h0)] wire89;
  wire [(3'h5):(1'h0)] wire88;
  wire signed [(4'hf):(1'h0)] wire87;
  wire [(4'h8):(1'h0)] wire86;
  wire signed [(4'hf):(1'h0)] wire85;
  wire [(2'h2):(1'h0)] wire75;
  wire [(3'h7):(1'h0)] wire73;
  wire signed [(3'h4):(1'h0)] wire57;
  wire [(3'h6):(1'h0)] wire56;
  wire [(4'ha):(1'h0)] wire55;
  wire [(2'h3):(1'h0)] wire54;
  wire [(5'h14):(1'h0)] wire52;
  wire signed [(5'h14):(1'h0)] wire25;
  reg [(4'hf):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg82 = (1'h0);
  reg [(5'h14):(1'h0)] reg81 = (1'h0);
  reg [(4'hc):(1'h0)] reg80 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg79 = (1'h0);
  reg [(3'h6):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg76 = (1'h0);
  assign y = {wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire75,
                 wire73,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire52,
                 wire25,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 (1'h0)};
  assign wire25 = $signed({($signed($unsigned(wire23)) ?
                          ({wire23} >> (~&(8'ha5))) : wire22)});
  module26 #() modinst53 (wire52, clk, wire21, wire25, wire22, wire23);
  assign wire54 = (-$unsigned((wire22 ?
                      {(~|wire23)} : (|(wire22 ? (8'ha2) : (7'h41))))));
  assign wire55 = (^~({$signed($signed(wire23)),
                      $signed((wire22 & wire24))} + wire24));
  assign wire56 = wire23[(4'h8):(3'h5)];
  assign wire57 = ((({$signed(wire21)} ?
                          ((-wire56) ?
                              wire21[(1'h0):(1'h0)] : $unsigned((8'ha6))) : {wire56[(1'h1):(1'h1)]}) || (|$unsigned((wire23 ?
                          wire24 : (8'hb4))))) ?
                      wire23[(3'h5):(2'h2)] : $unsigned($signed({wire21[(4'h8):(3'h7)]})));
  module58 #() modinst74 (wire73, clk, wire24, wire25, wire21, wire52);
  assign wire75 = (~((wire56[(2'h3):(1'h1)] + ((wire56 || wire21) < wire73)) ^ ((~|{wire56,
                          (7'h40)}) ?
                      (^wire56) : ($signed(wire24) << $unsigned(wire55)))));
  always
    @(posedge clk) begin
      reg76 <= (^($signed((^wire75[(1'h1):(1'h1)])) ?
          (wire75 ?
              (8'ha6) : $unsigned((wire21 == wire54))) : $unsigned((!wire21))));
      reg77 <= (^$signed($unsigned({(wire52 ? wire25 : (8'hb6)),
          wire52[(5'h12):(3'h4)]})));
      if ($signed($unsigned($signed($signed($signed(wire57))))))
        begin
          reg78 <= wire54[(2'h2):(1'h1)];
          reg79 <= ($signed($unsigned(($signed(wire22) && (!wire25)))) << {{(wire23 >= $unsigned(wire25)),
                  wire52}});
        end
      else
        begin
          if (($unsigned(wire22[(5'h14):(4'he)]) - ((~(wire23 ^ wire56)) - ((&(|(8'ha5))) && wire73[(3'h4):(2'h3)]))))
            begin
              reg78 <= (~$unsigned($signed($unsigned($signed(wire55)))));
              reg79 <= wire73[(2'h3):(1'h0)];
              reg80 <= $signed(wire75);
              reg81 <= ((+wire73[(2'h2):(1'h0)]) << wire75[(1'h1):(1'h0)]);
            end
          else
            begin
              reg78 <= wire57;
              reg79 <= {(+$signed((~$signed(wire56)))),
                  (&{$signed($signed(wire24))})};
              reg80 <= (((8'hbf) != reg81) < {(((~^reg76) ?
                          $unsigned(reg78) : reg76[(2'h2):(1'h1)]) ?
                      reg79[(1'h1):(1'h1)] : ((~|(8'hb1)) ?
                          wire54[(2'h2):(2'h2)] : $unsigned((8'haf))))});
              reg81 <= wire73[(2'h3):(2'h3)];
              reg82 <= wire22;
            end
          reg83 <= (wire75[(1'h1):(1'h1)] ?
              $signed(wire22) : (-reg79[(1'h0):(1'h0)]));
        end
      reg84 <= ($unsigned(wire24) == $signed((8'hae)));
    end
  assign wire85 = $signed(({reg76[(4'he):(1'h1)],
                      reg76[(4'hc):(4'h8)]} && ((|reg77[(1'h0):(1'h0)]) ?
                      reg77[(2'h3):(1'h0)] : (8'ha4))));
  assign wire86 = wire21;
  assign wire87 = (({{$unsigned(wire75)}} || ($unsigned((~|wire56)) >= $unsigned(wire86))) ?
                      $signed(((~|$signed(reg80)) ?
                          $signed((~reg83)) : ((~(8'haf)) >= (wire54 * reg83)))) : reg77);
  assign wire88 = $signed(wire56[(1'h1):(1'h1)]);
  assign wire89 = $signed($unsigned(reg83[(2'h3):(1'h0)]));
endmodule

module module58
#(parameter param71 = ((&(((~(8'hb5)) | (~(8'had))) ? (((8'hb8) != (8'hb2)) - {(7'h41), (8'h9d)}) : (8'hb2))) >> (({((8'hb6) >> (8'hb9))} ? {(-(8'ha4))} : (!(-(8'hb4)))) != (-(((8'ha9) ? (7'h42) : (7'h40)) ? ((7'h40) ? (8'hb7) : (8'h9e)) : ((8'hbc) <<< (8'hac)))))), 
parameter param72 = {param71})
(y, clk, wire62, wire61, wire60, wire59);
  output wire [(32'h4d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire62;
  input wire [(4'hd):(1'h0)] wire61;
  input wire signed [(5'h11):(1'h0)] wire60;
  input wire [(5'h14):(1'h0)] wire59;
  wire signed [(3'h5):(1'h0)] wire70;
  wire signed [(4'he):(1'h0)] wire69;
  wire signed [(4'hb):(1'h0)] wire68;
  wire signed [(3'h7):(1'h0)] wire67;
  wire [(4'ha):(1'h0)] wire66;
  wire signed [(4'hc):(1'h0)] wire65;
  wire signed [(4'hf):(1'h0)] wire64;
  wire signed [(2'h2):(1'h0)] wire63;
  assign y = {wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 (1'h0)};
  assign wire63 = wire60;
  assign wire64 = {({((~|wire59) >> (~(8'ha5))),
                          (~|$unsigned(wire60))} >> $unsigned(((wire62 ~^ wire62) != (^~wire60)))),
                      wire61};
  assign wire65 = $signed(wire63[(1'h1):(1'h1)]);
  assign wire66 = $signed($unsigned((+$signed((~&wire65)))));
  assign wire67 = $unsigned((^wire60));
  assign wire68 = wire60[(4'hc):(3'h4)];
  assign wire69 = ($unsigned(wire61) >> $signed((&$unsigned((wire67 + (8'haa))))));
  assign wire70 = ((({wire61, wire59} ? (8'hbd) : $signed($signed(wire64))) ?
                          $unsigned($signed(wire61[(1'h0):(1'h0)])) : wire62[(4'he):(4'hc)]) ?
                      ($signed(wire60[(4'hb):(3'h5)]) || $unsigned(((8'hbb) ?
                          (~^wire68) : wire60[(3'h4):(2'h3)]))) : (8'h9f));
endmodule

module module26  (y, clk, wire30, wire29, wire28, wire27);
  output wire [(32'hef):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire30;
  input wire [(5'h14):(1'h0)] wire29;
  input wire [(2'h3):(1'h0)] wire28;
  input wire [(4'hb):(1'h0)] wire27;
  wire [(4'hb):(1'h0)] wire51;
  wire [(4'he):(1'h0)] wire50;
  wire [(2'h2):(1'h0)] wire38;
  wire [(5'h12):(1'h0)] wire37;
  wire signed [(4'hb):(1'h0)] wire36;
  wire [(4'hb):(1'h0)] wire35;
  wire [(5'h12):(1'h0)] wire34;
  wire [(5'h10):(1'h0)] wire33;
  wire signed [(5'h12):(1'h0)] wire32;
  wire [(3'h7):(1'h0)] wire31;
  reg [(3'h6):(1'h0)] reg49 = (1'h0);
  reg [(4'h9):(1'h0)] reg48 = (1'h0);
  reg [(5'h13):(1'h0)] reg47 = (1'h0);
  reg signed [(4'he):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg45 = (1'h0);
  reg [(2'h3):(1'h0)] reg44 = (1'h0);
  reg [(5'h12):(1'h0)] reg43 = (1'h0);
  reg [(3'h7):(1'h0)] reg42 = (1'h0);
  reg [(4'hb):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg39 = (1'h0);
  assign y = {wire51,
                 wire50,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 (1'h0)};
  assign wire31 = wire30;
  assign wire32 = {({$signed(wire28)} ?
                          ((wire30[(3'h7):(3'h4)] << wire28[(2'h3):(1'h1)]) + (wire28 ?
                              $unsigned(wire30) : {wire31})) : wire28[(2'h2):(1'h1)]),
                      $signed((wire30[(4'ha):(2'h2)] > wire31[(3'h7):(1'h1)]))};
  assign wire33 = wire27[(1'h0):(1'h0)];
  assign wire34 = $signed($signed({((-(8'hb1)) && (!wire30)), wire29}));
  assign wire35 = {{wire30[(1'h0):(1'h0)], wire30}};
  assign wire36 = wire34;
  assign wire37 = $signed($unsigned(((((8'hb5) ? wire32 : (7'h42)) ?
                      wire33 : wire30[(4'hf):(3'h4)]) ^~ (|(8'hbb)))));
  assign wire38 = wire32;
  always
    @(posedge clk) begin
      if ((wire35 << $unsigned($signed(wire31[(1'h0):(1'h0)]))))
        begin
          reg39 <= wire38[(1'h0):(1'h0)];
          reg40 <= (!((^wire34[(2'h2):(1'h0)]) != (($signed(wire36) ?
              (wire38 ^~ (8'hb4)) : $unsigned((8'hb2))) >= (~$signed(wire36)))));
          reg41 <= $unsigned($signed((wire30 >>> $unsigned((7'h43)))));
          if ($signed(((^~$unsigned(wire35)) ? wire36[(1'h0):(1'h0)] : wire33)))
            begin
              reg42 <= {$signed((8'h9d))};
              reg43 <= $unsigned(reg39);
              reg44 <= $signed((($unsigned({reg40, reg39}) && {(wire32 ?
                      wire28 : wire29),
                  wire33}) * wire34[(4'he):(4'hc)]));
              reg45 <= reg43;
              reg46 <= (&(8'hab));
            end
          else
            begin
              reg42 <= wire36[(3'h5):(3'h4)];
              reg43 <= ((reg42 == $unsigned(($unsigned((8'hb9)) ?
                      (~&reg41) : (~^reg44)))) ?
                  $unsigned({reg45, $signed((&wire28))}) : wire33);
              reg44 <= ($unsigned($unsigned(($signed((8'hb7)) << $unsigned(reg46)))) ?
                  ((wire31 & (8'h9e)) >> $unsigned($signed(wire27))) : (~^reg41[(4'ha):(3'h5)]));
              reg45 <= reg46[(1'h0):(1'h0)];
              reg46 <= $signed((8'hb3));
            end
          if ({(^(((wire38 >> wire34) & $unsigned(reg44)) ?
                  reg41 : ($signed((8'hbb)) ?
                      (~(8'h9c)) : (wire38 << (8'ha9)))))})
            begin
              reg47 <= $signed(((wire29[(3'h6):(2'h3)] ?
                      $signed($unsigned((8'had))) : wire37[(3'h5):(1'h0)]) ?
                  (^(8'hbf)) : {((reg42 ? reg41 : wire38) ?
                          $signed(reg39) : $signed(wire37)),
                      reg39}));
            end
          else
            begin
              reg47 <= $signed($signed({$unsigned(reg43),
                  {(!wire32), $unsigned(wire34)}}));
              reg48 <= reg45;
            end
        end
      else
        begin
          reg39 <= (($unsigned((|(-reg43))) ?
              {reg39} : (((reg40 ? wire28 : wire27) ^~ {(7'h41)}) ?
                  $unsigned($unsigned((8'hbf))) : $signed((~^wire32)))) <= $unsigned((reg47 || reg48)));
        end
      reg49 <= reg43[(3'h7):(3'h4)];
    end
  assign wire50 = ($unsigned($signed(wire27)) ?
                      $signed(((7'h40) == {(^reg47),
                          (wire36 ? wire29 : wire36)})) : reg39[(2'h2):(1'h1)]);
  assign wire51 = $unsigned({wire31[(3'h6):(1'h1)],
                      $signed((((8'ha3) ^ wire29) ?
                          $unsigned(wire50) : (wire31 <= wire33)))});
endmodule

module module98
#(parameter param109 = {((8'ha1) ? ((((8'had) ? (8'hb1) : (8'h9c)) ? ((7'h40) ? (8'hb9) : (8'ha0)) : ((8'h9d) ? (7'h43) : (8'ha5))) ? ({(8'hb1), (8'hba)} ? ((8'h9c) ? (7'h40) : (8'hab)) : ((8'hb8) & (7'h41))) : ((~|(8'h9f)) > ((8'hb2) >= (8'h9d)))) : {(~^((8'ha4) ? (7'h43) : (8'had))), (^~((8'ha1) * (8'ha0)))})}, 
parameter param110 = (8'hab))
(y, clk, wire103, wire102, wire101, wire100, wire99);
  output wire [(32'h2c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire103;
  input wire [(4'ha):(1'h0)] wire102;
  input wire [(5'h10):(1'h0)] wire101;
  input wire signed [(5'h14):(1'h0)] wire100;
  input wire signed [(5'h14):(1'h0)] wire99;
  wire signed [(4'hf):(1'h0)] wire108;
  wire [(2'h3):(1'h0)] wire107;
  wire signed [(3'h5):(1'h0)] wire106;
  wire [(3'h6):(1'h0)] wire105;
  wire signed [(4'he):(1'h0)] wire104;
  assign y = {wire108, wire107, wire106, wire105, wire104, (1'h0)};
  assign wire104 = (wire100[(5'h10):(4'hd)] * (^~wire100[(4'h8):(3'h4)]));
  assign wire105 = wire102[(2'h3):(1'h1)];
  assign wire106 = (8'hb3);
  assign wire107 = wire99[(4'h8):(2'h2)];
  assign wire108 = wire100[(3'h5):(2'h3)];
endmodule
