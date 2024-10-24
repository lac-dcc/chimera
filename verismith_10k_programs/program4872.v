module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hd5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire145;
  wire signed [(4'h8):(1'h0)] wire144;
  wire [(5'h14):(1'h0)] wire141;
  wire signed [(4'hf):(1'h0)] wire140;
  wire [(4'he):(1'h0)] wire139;
  wire [(4'hc):(1'h0)] wire138;
  wire signed [(4'he):(1'h0)] wire136;
  wire [(4'hd):(1'h0)] wire11;
  wire [(5'h13):(1'h0)] wire10;
  wire [(2'h2):(1'h0)] wire9;
  wire [(4'hf):(1'h0)] wire8;
  reg [(4'hb):(1'h0)] reg143 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg142 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg4 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg6 = (1'h0);
  reg [(4'hf):(1'h0)] reg7 = (1'h0);
  assign y = {wire145,
                 wire144,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire136,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 reg143,
                 reg142,
                 reg4,
                 reg5,
                 reg6,
                 reg7,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= ($unsigned((8'hbb)) ?
          wire3[(2'h3):(1'h1)] : (((~|(~|wire1)) ?
              $unsigned((wire2 | wire2)) : (8'ha2)) + (wire2[(4'h8):(4'h8)] ?
              wire1 : (|(^~wire2)))));
      reg5 <= $signed((~$signed(wire3[(1'h0):(1'h0)])));
      reg6 <= wire2[(3'h6):(3'h5)];
      reg7 <= (($signed(reg4) ?
              $signed((wire3 ?
                  $unsigned(wire2) : {wire3})) : {$unsigned((wire3 ?
                      wire3 : wire2)),
                  reg5[(2'h2):(1'h0)]}) ?
          $signed({{(~&(8'ha0))}}) : ((!$signed(wire3[(2'h3):(1'h0)])) >= ((&(+wire0)) - (reg4 ~^ reg6))));
    end
  assign wire8 = {reg6[(3'h6):(2'h3)]};
  assign wire9 = reg4;
  assign wire10 = wire3[(2'h3):(2'h2)];
  assign wire11 = ((~|wire2[(2'h3):(2'h2)]) >> $unsigned($signed(wire2[(4'h9):(4'h8)])));
  module12 #() modinst137 (wire136, clk, wire10, wire2, wire8, wire1, reg6);
  assign wire138 = reg4[(2'h2):(2'h2)];
  assign wire139 = (wire2 ?
                       wire1[(5'h14):(4'he)] : $signed(wire2[(5'h12):(4'h8)]));
  assign wire140 = {reg6[(3'h4):(2'h2)]};
  assign wire141 = (wire11[(2'h3):(2'h2)] < wire139);
  always
    @(posedge clk) begin
      reg142 <= reg6[(4'hd):(3'h5)];
      reg143 <= (&{(((reg5 ? wire138 : wire138) ?
              $signed(wire0) : (wire141 ?
                  wire3 : wire10)) ^ reg6[(4'hd):(4'hb)]),
          wire140});
    end
  assign wire144 = wire8;
  assign wire145 = wire3;
endmodule

module module12
#(parameter param134 = ({(8'h9c)} & ({(7'h41)} ? ((~^(&(8'had))) ? {(8'hab), (!(8'hb0))} : (|(-(8'ha4)))) : {({(8'hb7)} >>> ((8'hb4) >> (8'hba))), ({(8'ha3)} ? ((8'ha7) & (8'hb2)) : (+(8'hbd)))})), 
parameter param135 = (((!((param134 ? param134 : (7'h40)) != (param134 ? param134 : param134))) * (^~(8'h9e))) ? (param134 ? ((((8'hbf) >>> param134) ? {param134} : param134) ? ((param134 ? param134 : (8'ha9)) ? (param134 ? param134 : param134) : (param134 > param134)) : param134) : (~((param134 ? param134 : param134) < (8'hb2)))) : (param134 << (^~{(~|param134)}))))
(y, clk, wire13, wire14, wire15, wire16, wire17);
  output wire [(32'h1ee):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire13;
  input wire signed [(5'h12):(1'h0)] wire14;
  input wire [(4'h8):(1'h0)] wire15;
  input wire [(5'h15):(1'h0)] wire16;
  input wire signed [(5'h15):(1'h0)] wire17;
  wire [(4'hf):(1'h0)] wire18;
  wire [(4'hc):(1'h0)] wire19;
  wire [(5'h15):(1'h0)] wire20;
  wire [(4'ha):(1'h0)] wire43;
  wire signed [(3'h4):(1'h0)] wire70;
  wire [(4'hd):(1'h0)] wire71;
  wire [(4'hd):(1'h0)] wire72;
  wire [(4'hd):(1'h0)] wire73;
  wire signed [(4'h9):(1'h0)] wire74;
  wire [(4'ha):(1'h0)] wire102;
  wire signed [(5'h14):(1'h0)] wire104;
  wire signed [(4'hb):(1'h0)] wire105;
  wire signed [(4'hd):(1'h0)] wire106;
  wire signed [(3'h4):(1'h0)] wire107;
  wire [(2'h2):(1'h0)] wire108;
  wire [(4'hf):(1'h0)] wire132;
  reg [(3'h7):(1'h0)] reg45 = (1'h0);
  reg [(4'hc):(1'h0)] reg46 = (1'h0);
  reg [(5'h11):(1'h0)] reg47 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg48 = (1'h0);
  reg [(4'hc):(1'h0)] reg49 = (1'h0);
  reg [(3'h4):(1'h0)] reg50 = (1'h0);
  reg [(5'h14):(1'h0)] reg51 = (1'h0);
  reg [(5'h10):(1'h0)] reg52 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg53 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg56 = (1'h0);
  reg [(4'he):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg62 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg63 = (1'h0);
  reg [(5'h14):(1'h0)] reg64 = (1'h0);
  reg [(4'hc):(1'h0)] reg65 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg66 = (1'h0);
  reg [(5'h11):(1'h0)] reg67 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg68 = (1'h0);
  reg [(5'h10):(1'h0)] reg69 = (1'h0);
  assign y = {wire18,
                 wire19,
                 wire20,
                 wire43,
                 wire70,
                 wire71,
                 wire72,
                 wire73,
                 wire74,
                 wire102,
                 wire104,
                 wire105,
                 wire106,
                 wire107,
                 wire108,
                 wire132,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 reg55,
                 reg56,
                 reg57,
                 reg58,
                 reg59,
                 reg60,
                 reg61,
                 reg62,
                 reg63,
                 reg64,
                 reg65,
                 reg66,
                 reg67,
                 reg68,
                 reg69,
                 (1'h0)};
  assign wire18 = {$signed(wire17),
                      (($unsigned(wire14) >>> $unsigned((wire13 - (8'hbf)))) ?
                          ($signed($signed(wire14)) ?
                              $signed((wire13 ~^ wire16)) : ($unsigned((8'hb0)) == (wire13 ?
                                  wire14 : wire17))) : (wire13 ?
                              $signed((wire14 ^ wire14)) : (&(^~wire15))))};
  assign wire19 = $unsigned((!(~^($unsigned(wire13) ?
                      (wire18 > (8'ha4)) : ((8'hb6) > (8'hb3))))));
  assign wire20 = (~$signed($unsigned($signed($unsigned(wire18)))));
  module21 #() modinst44 (.wire22(wire16), .wire24(wire18), .wire23(wire19), .clk(clk), .y(wire43), .wire25(wire13));
  always
    @(posedge clk) begin
      if ($signed(wire17[(3'h7):(3'h4)]))
        begin
          reg45 <= ($signed(wire43[(1'h0):(1'h0)]) && $unsigned(wire20));
          reg46 <= (~^{$signed(((wire20 ^~ wire14) + (wire17 ?
                  wire18 : wire14)))});
          reg47 <= (&wire18);
        end
      else
        begin
          if ($signed(wire16))
            begin
              reg45 <= ({$signed($unsigned(wire13)),
                  ($signed((8'hb5)) ?
                      $signed((wire17 * (8'hb3))) : $signed(((7'h42) & wire18)))} <= reg46);
              reg46 <= wire19;
            end
          else
            begin
              reg45 <= wire18[(4'hb):(3'h6)];
              reg46 <= reg46;
              reg47 <= ($unsigned(wire20[(1'h1):(1'h1)]) || (reg45[(3'h4):(1'h0)] ?
                  $unsigned((&{wire15, reg47})) : {$unsigned({(8'ha6), wire43}),
                      {wire14[(4'hb):(3'h5)], (reg47 ? wire20 : wire13)}}));
            end
          reg48 <= ((+wire20[(3'h6):(2'h3)]) ? ((8'ha4) && wire18) : reg46);
          reg49 <= ({$unsigned(((|wire20) ?
                  (8'hba) : (reg45 * wire14)))} <= $unsigned(reg45));
          if (((($unsigned($signed(reg48)) ? (~|$unsigned(wire13)) : wire15) ?
              {$signed((reg47 | wire14)), {{wire19}}} : (reg49[(2'h2):(1'h0)] ?
                  ((reg47 ^~ wire13) ?
                      $unsigned(wire14) : $unsigned(wire20)) : {$signed(wire17),
                      $signed(wire15)})) >>> $signed((wire14 ?
              {{(8'h9d)}, (&wire15)} : (~^$unsigned(wire13))))))
            begin
              reg50 <= $unsigned(($signed(($unsigned(wire13) ?
                  reg48 : {wire15})) >> $signed($signed((reg47 < (8'hba))))));
              reg51 <= reg49[(4'ha):(3'h4)];
              reg52 <= (($unsigned($unsigned($signed(wire15))) > {$unsigned((&(7'h42))),
                  reg51[(1'h0):(1'h0)]}) ^ wire13);
              reg53 <= (!$unsigned(wire15));
              reg54 <= (|($signed({((8'ha3) ? wire20 : wire43),
                      $unsigned(reg51)}) ?
                  $signed((-((8'hbb) ?
                      wire17 : wire15))) : ((+$unsigned(reg47)) != ($unsigned(reg45) & reg51))));
            end
          else
            begin
              reg50 <= $signed(($unsigned({(reg54 ? wire14 : (8'hb0)),
                  $unsigned(wire13)}) != (reg52[(3'h4):(3'h4)] > {$signed(wire14),
                  $signed(wire17)})));
            end
          reg55 <= ($unsigned((({wire20} >= $unsigned(reg54)) ?
              (-reg47[(3'h7):(3'h5)]) : $signed((wire17 ?
                  reg49 : reg51)))) != $signed(wire20));
        end
      reg56 <= wire14;
      if ($signed(wire15[(3'h4):(2'h2)]))
        begin
          reg57 <= (($signed(($unsigned((8'h9f)) ?
                  wire43[(2'h3):(2'h3)] : (reg46 ?
                      (8'hb9) : wire16))) + {(~|$signed(reg53)),
                  reg47[(4'hf):(4'he)]}) ?
              (wire16 ?
                  (~($signed(reg51) < $unsigned(wire15))) : $signed(reg48)) : wire13);
          reg58 <= reg54;
        end
      else
        begin
          if ((~^(~(~&$signed((reg55 ? reg45 : reg52))))))
            begin
              reg57 <= $signed((($signed((~reg49)) ^ $unsigned((reg46 ?
                      reg52 : reg48))) ?
                  (($unsigned(wire15) ? $unsigned(wire20) : (8'hb5)) ?
                      $signed((8'h9c)) : $unsigned(wire16)) : {reg54}));
              reg58 <= $signed(($unsigned((~&{wire17, (8'h9e)})) ?
                  (((reg50 ? reg49 : reg46) && (~&wire18)) ?
                      (!wire16[(4'ha):(1'h0)]) : wire20) : (~($signed(reg55) >>> reg51[(2'h3):(1'h1)]))));
            end
          else
            begin
              reg57 <= ($signed((wire14[(4'hb):(3'h7)] ?
                      $signed((reg47 >= reg45)) : reg54[(3'h6):(3'h4)])) ?
                  wire18 : (~|reg54[(3'h7):(3'h4)]));
              reg58 <= ((~^($unsigned($signed(wire18)) ?
                      reg54[(3'h7):(3'h7)] : $signed((-reg46)))) ?
                  reg58 : ({$signed($signed(reg52))} - ((^reg49[(3'h7):(3'h6)]) ?
                      reg45 : reg54)));
              reg59 <= (8'ha1);
              reg60 <= wire19;
              reg61 <= (!wire43[(3'h5):(2'h2)]);
            end
          reg62 <= {$unsigned(((-$unsigned((8'haf))) && $unsigned($signed((8'ha0)))))};
          reg63 <= ($signed(reg62) ~^ $signed($unsigned(reg55[(3'h6):(3'h5)])));
          if (reg49[(1'h1):(1'h1)])
            begin
              reg64 <= $unsigned(reg52[(1'h0):(1'h0)]);
              reg65 <= {reg46,
                  ((8'hab) ?
                      $unsigned(reg48[(3'h7):(3'h4)]) : $unsigned($unsigned((wire43 - (8'ha0)))))};
            end
          else
            begin
              reg64 <= reg46;
              reg65 <= (8'hb9);
              reg66 <= (+$unsigned((~^(~((8'haf) != wire14)))));
              reg67 <= reg60;
            end
        end
      reg68 <= (-wire18);
      reg69 <= ((^$unsigned((8'haa))) ?
          wire19 : $unsigned((reg55 ? (&reg56) : (~^(~&reg47)))));
    end
  assign wire70 = (-{((8'ha6) - wire18)});
  assign wire71 = reg52[(4'ha):(3'h5)];
  assign wire72 = $unsigned({$signed((-{reg47})),
                      (((wire17 ? (8'haf) : reg60) >>> {reg61}) ?
                          (^~$unsigned(reg54)) : ($unsigned(reg54) ?
                              $signed((8'ha9)) : ((7'h42) | reg47)))});
  assign wire73 = (|(((+(reg62 ? reg53 : reg61)) ?
                          (reg67 ?
                              $signed(reg66) : (wire20 ?
                                  reg55 : reg66)) : reg52[(3'h6):(3'h4)]) ?
                      {reg45[(1'h0):(1'h0)],
                          {(wire16 ? reg50 : wire72),
                              reg58}} : (($signed(reg47) ?
                          reg67 : {reg62,
                              wire18}) < $signed(wire71[(3'h5):(3'h5)]))));
  assign wire74 = $unsigned((wire72 - (~wire20)));
  module75 #() modinst103 (wire102, clk, reg64, reg60, reg59, reg51);
  assign wire104 = reg63[(1'h0):(1'h0)];
  assign wire105 = $signed((^reg63));
  assign wire106 = wire73;
  assign wire107 = {(reg61 ?
                           ((reg61 | (reg69 - (7'h44))) ~^ (&wire102[(3'h5):(1'h1)])) : reg53)};
  assign wire108 = $signed(wire106);
  module109 #() modinst133 (.wire113(wire20), .clk(clk), .wire111(reg53), .wire112(reg45), .y(wire132), .wire110(reg60));
endmodule

module module109
#(parameter param131 = (~(((&((8'ha2) ? (7'h40) : (8'hb1))) ? (~(!(8'h9c))) : (((8'hbc) ? (8'ha3) : (8'hb6)) >> ((7'h41) ? (8'hbe) : (8'ha3)))) ? (8'hb3) : {{(~&(8'hbb)), (^(8'h9d))}, (8'hb8)})))
(y, clk, wire113, wire112, wire111, wire110);
  output wire [(32'hc4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire113;
  input wire signed [(3'h7):(1'h0)] wire112;
  input wire [(4'h9):(1'h0)] wire111;
  input wire signed [(4'hf):(1'h0)] wire110;
  wire signed [(4'h8):(1'h0)] wire130;
  wire signed [(5'h13):(1'h0)] wire129;
  wire signed [(5'h12):(1'h0)] wire128;
  wire [(5'h15):(1'h0)] wire125;
  wire signed [(4'hd):(1'h0)] wire124;
  wire [(2'h3):(1'h0)] wire123;
  wire signed [(5'h11):(1'h0)] wire122;
  reg [(5'h11):(1'h0)] reg127 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg126 = (1'h0);
  reg [(4'h8):(1'h0)] reg121 = (1'h0);
  reg [(3'h5):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg119 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg118 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg117 = (1'h0);
  reg [(4'hd):(1'h0)] reg116 = (1'h0);
  reg [(3'h6):(1'h0)] reg115 = (1'h0);
  reg [(3'h5):(1'h0)] reg114 = (1'h0);
  assign y = {wire130,
                 wire129,
                 wire128,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 reg127,
                 reg126,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg114 <= wire112[(1'h1):(1'h0)];
      if (wire113[(3'h5):(1'h1)])
        begin
          reg115 <= $signed(((wire113 & $signed(wire113)) ?
              $unsigned($signed((wire110 ?
                  reg114 : wire110))) : $unsigned(wire110[(2'h3):(1'h1)])));
          reg116 <= (^~wire113[(1'h1):(1'h1)]);
        end
      else
        begin
          reg115 <= reg114[(1'h1):(1'h0)];
          reg116 <= reg114;
          reg117 <= $unsigned({(8'h9e)});
          reg118 <= $signed(reg117);
          reg119 <= $unsigned(wire112[(2'h2):(1'h1)]);
        end
      reg120 <= ({(~($signed(wire110) + {reg116}))} ?
          reg115[(3'h4):(3'h4)] : ($unsigned((~$unsigned((8'hb4)))) ?
              $unsigned((reg115[(1'h0):(1'h0)] ?
                  (wire112 ? reg119 : reg117) : {wire113,
                      wire110})) : (^(reg116[(4'hd):(2'h2)] | (reg115 ?
                  reg117 : wire111)))));
      reg121 <= ($signed($unsigned((reg115[(2'h2):(1'h1)] ?
              (wire113 ? reg118 : reg119) : ((8'ha6) ~^ reg118)))) ?
          reg114 : (($unsigned($signed((8'ha9))) << $signed((~|(8'ha5)))) ^~ $unsigned({(~&wire113),
              (wire111 ^ (8'ha6))})));
    end
  assign wire122 = (+wire112);
  assign wire123 = reg119[(3'h6):(2'h2)];
  assign wire124 = ({$unsigned(wire123[(2'h2):(1'h1)]), wire111} ?
                       reg119 : wire110);
  assign wire125 = ($signed({reg120}) ?
                       wire110 : ($unsigned($unsigned((wire111 ?
                           (8'hb2) : reg117))) - reg118[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      reg126 <= $unsigned({({$unsigned(wire113), $unsigned(wire112)} ?
              $signed($unsigned(wire112)) : ((-reg117) >>> {reg115})),
          {($signed(reg114) + ((7'h43) ? reg115 : wire113))}});
      reg127 <= reg114;
    end
  assign wire128 = (~{reg121});
  assign wire129 = reg116[(4'ha):(3'h6)];
  assign wire130 = (((^~reg114[(2'h2):(1'h1)]) << wire110) ?
                       reg116[(3'h4):(2'h3)] : reg116[(3'h4):(1'h0)]);
endmodule

module module75
#(parameter param101 = {((8'ha3) ? ((8'hba) ? (&((8'h9e) ^~ (8'ha1))) : (((8'had) <<< (8'hbc)) * (|(8'ha7)))) : (~|(^~(&(7'h42))))), (((~|((8'h9e) ~^ (8'ha2))) ? ({(8'hb6), (7'h44)} ? ((8'hbe) ? (8'ha4) : (8'haa)) : ((8'h9d) ? (7'h40) : (8'hbb))) : (|(~&(8'hae)))) ? {{(~&(7'h43)), ((8'hb6) ? (8'hb0) : (8'had))}} : {(&(8'hbf))})})
(y, clk, wire79, wire78, wire77, wire76);
  output wire [(32'h114):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire79;
  input wire signed [(4'h8):(1'h0)] wire78;
  input wire signed [(4'hd):(1'h0)] wire77;
  input wire [(5'h14):(1'h0)] wire76;
  wire [(5'h14):(1'h0)] wire85;
  wire signed [(5'h11):(1'h0)] wire84;
  wire signed [(4'hf):(1'h0)] wire83;
  wire [(2'h3):(1'h0)] wire81;
  reg [(4'hf):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg99 = (1'h0);
  reg [(5'h11):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg97 = (1'h0);
  reg [(4'ha):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg95 = (1'h0);
  reg signed [(4'he):(1'h0)] reg94 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg92 = (1'h0);
  reg [(4'hc):(1'h0)] reg91 = (1'h0);
  reg [(5'h10):(1'h0)] reg90 = (1'h0);
  reg [(4'he):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg88 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg87 = (1'h0);
  reg [(5'h10):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg82 = (1'h0);
  reg [(4'hb):(1'h0)] reg80 = (1'h0);
  assign y = {wire85,
                 wire84,
                 wire83,
                 wire81,
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
                 reg82,
                 reg80,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg80 <= $signed(((^wire76) ?
          (|(wire79[(4'hc):(3'h4)] | (wire77 > wire79))) : $unsigned((&$signed((7'h40))))));
    end
  assign wire81 = {((+wire79[(4'hb):(3'h6)]) ?
                          {({wire78,
                                  wire79} || wire76[(5'h12):(5'h10)])} : ({(wire76 || wire78)} < $signed(((8'h9d) << wire78)))),
                      (((^~(reg80 < wire79)) <= $signed(wire79[(3'h4):(2'h3)])) ?
                          ((7'h40) ?
                              ($unsigned(wire77) ?
                                  wire79[(3'h7):(1'h1)] : $signed((8'hbb))) : (((8'haa) ?
                                      wire79 : (8'ha8)) ?
                                  (|wire78) : $signed(wire78))) : ($unsigned($signed((8'hbe))) ?
                              $unsigned((!(8'ha4))) : $unsigned(((7'h44) ?
                                  (8'hbf) : wire78))))};
  always
    @(posedge clk) begin
      reg82 <= (($signed(wire81) & wire81[(2'h3):(1'h0)]) ? reg80 : wire78);
    end
  assign wire83 = reg80;
  assign wire84 = ((^~((^~{wire78}) - $signed(wire79))) || wire83[(3'h6):(1'h1)]);
  assign wire85 = $unsigned($signed(($signed((wire84 ? reg82 : wire76)) ?
                      wire81[(1'h1):(1'h1)] : $signed((~|reg80)))));
  always
    @(posedge clk) begin
      if ((+($signed($signed((~&wire76))) ?
          ($signed((wire81 ?
              (8'hae) : reg80)) && $unsigned((8'ha7))) : (reg82 ^~ reg82))))
        begin
          if (wire76[(4'h8):(2'h2)])
            begin
              reg86 <= $unsigned($signed((wire78 ?
                  ($unsigned(wire78) ?
                      {wire81,
                          wire78} : (wire79 + wire84)) : $signed((-reg82)))));
              reg87 <= (wire81 ?
                  ({reg80[(1'h0):(1'h0)], $unsigned(reg80[(2'h2):(2'h2)])} ?
                      $signed($signed({reg86, reg82})) : (((wire77 ?
                          wire83 : wire78) ^~ (~^wire84)) ~^ (reg82 ?
                          (^wire76) : (~^wire85)))) : $unsigned($signed(($signed(wire81) != $unsigned(reg82)))));
              reg88 <= wire85[(2'h2):(1'h1)];
              reg89 <= $signed((($signed((wire78 ? wire79 : wire85)) ?
                      $unsigned(wire81) : $unsigned($unsigned((8'hb4)))) ?
                  wire79[(1'h0):(1'h0)] : $signed(($signed(wire84) ?
                      (reg88 ? wire85 : reg82) : {wire77}))));
              reg90 <= (-(~(~&$unsigned($unsigned(reg88)))));
            end
          else
            begin
              reg86 <= (~^reg90);
              reg87 <= ((~(({reg88} * wire84[(4'hb):(4'h8)]) * reg89)) != $signed(((~^(!wire83)) ?
                  {$unsigned(reg88)} : (~|(^wire77)))));
              reg88 <= reg82;
            end
          reg91 <= $unsigned($signed(wire77[(4'ha):(3'h5)]));
          if (wire77[(4'ha):(3'h5)])
            begin
              reg92 <= wire81;
              reg93 <= (reg86[(4'hd):(4'h9)] ?
                  wire79 : ($unsigned((^~(reg86 - wire79))) >= wire83));
            end
          else
            begin
              reg92 <= {($unsigned({reg88[(2'h3):(1'h0)]}) > reg86),
                  (+(reg80[(2'h3):(1'h1)] + (-{wire77})))};
              reg93 <= (wire81 <<< ($signed($unsigned({reg86,
                  reg87})) || $unsigned(reg92[(2'h3):(1'h0)])));
            end
          if (reg88[(4'h8):(3'h5)])
            begin
              reg94 <= (reg91 > (-$signed($signed(wire81))));
              reg95 <= (^wire78);
              reg96 <= (wire78[(3'h6):(3'h5)] ^ $signed((~|{(^wire81)})));
              reg97 <= reg86;
              reg98 <= wire85[(2'h2):(2'h2)];
            end
          else
            begin
              reg94 <= ((8'ha3) ? reg89[(4'he):(4'h9)] : wire85);
              reg95 <= {(^~$unsigned(wire81[(1'h1):(1'h1)]))};
            end
          reg99 <= {reg94};
        end
      else
        begin
          reg86 <= (reg94 ? reg89[(4'h8):(3'h4)] : reg88);
          reg87 <= wire77[(1'h0):(1'h0)];
          reg88 <= (8'ha1);
          reg89 <= (wire85[(4'hd):(4'ha)] >= $unsigned($unsigned((!$signed((8'hb2))))));
          reg90 <= reg95[(4'he):(1'h1)];
        end
      reg100 <= $signed((|(8'had)));
    end
endmodule

module module21  (y, clk, wire25, wire24, wire23, wire22);
  output wire [(32'hbd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire25;
  input wire [(4'hf):(1'h0)] wire24;
  input wire [(3'h5):(1'h0)] wire23;
  input wire [(4'ha):(1'h0)] wire22;
  wire [(4'h8):(1'h0)] wire42;
  wire [(5'h11):(1'h0)] wire35;
  wire [(3'h5):(1'h0)] wire34;
  wire [(4'hf):(1'h0)] wire33;
  wire [(4'hd):(1'h0)] wire32;
  wire [(5'h10):(1'h0)] wire27;
  reg signed [(5'h10):(1'h0)] reg41 = (1'h0);
  reg [(3'h4):(1'h0)] reg40 = (1'h0);
  reg [(3'h6):(1'h0)] reg39 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg38 = (1'h0);
  reg [(4'h9):(1'h0)] reg37 = (1'h0);
  reg [(5'h11):(1'h0)] reg36 = (1'h0);
  reg [(4'h9):(1'h0)] reg31 = (1'h0);
  reg [(3'h6):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg29 = (1'h0);
  reg [(5'h12):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg26 = (1'h0);
  assign y = {wire42,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire27,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg26,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg26 <= wire22[(2'h2):(1'h1)];
    end
  assign wire27 = (~&$unsigned($unsigned(reg26)));
  always
    @(posedge clk) begin
      reg28 <= (~({{((7'h43) << wire23),
              (wire23 ? (8'had) : wire25)}} + wire23[(3'h4):(1'h1)]));
      reg29 <= $unsigned((reg26[(1'h1):(1'h0)] ?
          $signed({(reg26 ? reg26 : wire25)}) : wire22));
      reg30 <= ($unsigned((&((wire24 << wire25) << ((8'hba) ?
              (8'had) : reg26)))) ?
          $unsigned($unsigned(((reg26 == (8'hb0)) ?
              ((8'hae) <= wire25) : wire23[(3'h5):(1'h1)]))) : $signed(wire24));
      reg31 <= reg26;
    end
  assign wire32 = (^~reg30[(2'h2):(2'h2)]);
  assign wire33 = ($unsigned(reg29[(4'h8):(3'h6)]) ?
                      $unsigned(wire27[(4'hd):(4'hc)]) : wire24);
  assign wire34 = (wire32 ?
                      (^~($unsigned((-(8'ha7))) > $signed((8'hbe)))) : ($unsigned({wire23}) >> (!$signed(wire27))));
  assign wire35 = (~&{(^~$signed(((8'ha1) | (8'hbf)))), wire33[(4'hf):(1'h1)]});
  always
    @(posedge clk) begin
      reg36 <= (wire34[(2'h3):(1'h0)] ? reg26 : wire32);
      if (((-$signed((~^(8'hb0)))) != $signed(reg28[(1'h1):(1'h0)])))
        begin
          reg37 <= ({wire34} ^ $signed(($unsigned($signed(wire33)) ~^ $signed((8'ha8)))));
          reg38 <= $signed((~(!$unsigned(reg28))));
          reg39 <= ((-(8'h9d)) ?
              reg29[(4'hf):(4'he)] : $unsigned($unsigned($unsigned({wire32}))));
          reg40 <= {(((wire35[(2'h2):(2'h2)] > (|(8'hb9))) & $unsigned(reg29)) ?
                  wire23 : $signed($signed((wire27 ? wire32 : (7'h43))))),
              ($signed((+$unsigned(reg28))) ? {{{reg29}}} : $unsigned(wire22))};
        end
      else
        begin
          if ((~^($unsigned(((~|reg40) >>> (wire27 ? reg28 : (8'hab)))) ?
              $signed(reg31) : (~|((wire22 ? reg37 : (8'h9c)) && (+reg36))))))
            begin
              reg37 <= reg37;
              reg38 <= wire32;
              reg39 <= wire27[(4'hc):(4'h8)];
              reg40 <= (reg28 ?
                  $signed((reg37 < ((reg38 | wire35) + {wire35}))) : (~^($signed((reg30 ^ wire25)) * ((reg26 + wire23) ?
                      (reg29 ? reg29 : (8'hab)) : reg29))));
            end
          else
            begin
              reg37 <= (reg38[(4'h8):(3'h4)] == wire27);
              reg38 <= {reg31[(4'h9):(3'h6)]};
              reg39 <= ({({(reg30 ? wire34 : wire27)} ?
                          reg37[(3'h5):(1'h1)] : $signed((reg26 ?
                              wire27 : reg37))),
                      reg39[(2'h3):(2'h2)]} ?
                  (((reg31 ?
                      reg40[(2'h2):(1'h0)] : {wire23}) + ($unsigned((8'hbf)) ?
                      {reg36,
                          reg39} : wire32)) + $signed(((~^reg29) & reg31))) : ({reg37,
                          ($unsigned(reg36) == {reg37, wire23})} ?
                      (reg39 ?
                          $unsigned({reg28}) : {((8'ha1) >>> wire32),
                              (8'hb7)}) : (+{$signed(wire33)})));
            end
        end
      reg41 <= $signed({{wire33[(4'hd):(3'h5)]},
          $signed(((reg31 ? reg31 : reg37) <= reg39[(3'h4):(1'h1)]))});
    end
  assign wire42 = {($unsigned($unsigned((reg41 ? reg38 : reg28))) || wire35)};
endmodule
