module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1bb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire0;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire3;
  wire [(5'h15):(1'h0)] wire9;
  wire [(5'h10):(1'h0)] wire56;
  wire signed [(4'hd):(1'h0)] wire58;
  wire signed [(5'h15):(1'h0)] wire59;
  wire [(3'h6):(1'h0)] wire60;
  wire signed [(4'h9):(1'h0)] wire61;
  wire [(2'h2):(1'h0)] wire62;
  wire [(5'h10):(1'h0)] wire63;
  wire signed [(4'h9):(1'h0)] wire64;
  wire [(2'h2):(1'h0)] wire65;
  wire [(3'h7):(1'h0)] wire77;
  wire [(4'hf):(1'h0)] wire78;
  wire [(5'h10):(1'h0)] wire79;
  wire [(4'hb):(1'h0)] wire141;
  wire [(5'h14):(1'h0)] wire143;
  wire [(5'h15):(1'h0)] wire145;
  wire signed [(4'hc):(1'h0)] wire156;
  reg signed [(5'h15):(1'h0)] reg8 = (1'h0);
  reg [(5'h12):(1'h0)] reg7 = (1'h0);
  reg [(3'h6):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg5 = (1'h0);
  reg [(5'h10):(1'h0)] reg4 = (1'h0);
  reg [(4'ha):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg68 = (1'h0);
  reg [(3'h7):(1'h0)] reg69 = (1'h0);
  reg [(4'h9):(1'h0)] reg70 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg72 = (1'h0);
  reg [(3'h7):(1'h0)] reg73 = (1'h0);
  reg [(4'hb):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg75 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg80 = (1'h0);
  reg [(5'h12):(1'h0)] reg144 = (1'h0);
  assign y = {wire9,
                 wire56,
                 wire58,
                 wire59,
                 wire60,
                 wire61,
                 wire62,
                 wire63,
                 wire64,
                 wire65,
                 wire77,
                 wire78,
                 wire79,
                 wire141,
                 wire143,
                 wire145,
                 wire156,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 reg66,
                 reg67,
                 reg68,
                 reg69,
                 reg70,
                 reg71,
                 reg72,
                 reg73,
                 reg74,
                 reg75,
                 reg76,
                 reg80,
                 reg144,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (+((^~wire3) <<< (wire1[(3'h6):(1'h1)] ?
          {((8'ha3) >> wire1)} : (wire2[(1'h0):(1'h0)] ?
              wire0[(4'hd):(2'h3)] : $signed((8'haa))))));
      reg5 <= wire2;
    end
  always
    @(posedge clk) begin
      reg6 <= $signed((8'ha7));
      reg7 <= (|(((wire0[(3'h4):(1'h0)] ? {reg4, wire0} : (reg5 == wire2)) ?
          (wire1 <<< wire3) : (reg4[(3'h4):(2'h2)] ?
              {wire0} : (reg5 ?
                  (8'hbc) : (8'hbb)))) <<< ($unsigned((~|reg4)) & (!(^~wire1)))));
      reg8 <= $signed(($signed(reg6[(2'h2):(1'h0)]) ?
          (reg4[(3'h4):(1'h1)] ^ (-wire1)) : $signed((reg4[(2'h2):(1'h1)] ^ (wire2 ?
              wire0 : wire1)))));
    end
  assign wire9 = (^reg4[(3'h5):(2'h3)]);
  module10 #() modinst57 (wire56, clk, wire3, reg7, reg5, wire1, reg4);
  assign wire58 = reg6;
  assign wire59 = (-reg8[(5'h14):(4'h8)]);
  assign wire60 = (~$unsigned(wire3[(5'h11):(2'h2)]));
  assign wire61 = $signed((wire59 ^ wire0[(3'h7):(2'h2)]));
  assign wire62 = $signed(($signed($unsigned($signed(reg7))) > reg4));
  assign wire63 = reg8;
  assign wire64 = wire61[(2'h2):(1'h1)];
  assign wire65 = wire63;
  always
    @(posedge clk) begin
      if ((|$signed((~&(~|$unsigned(wire1))))))
        begin
          reg66 <= wire60;
          reg67 <= wire65[(1'h0):(1'h0)];
        end
      else
        begin
          if ($unsigned((wire56[(4'h8):(3'h5)] ? wire61 : (+(|reg5)))))
            begin
              reg66 <= (+$unsigned(((-$unsigned(reg5)) ?
                  (|$signed(reg67)) : $unsigned((reg5 << reg66)))));
              reg67 <= $unsigned($unsigned(($unsigned($signed(wire63)) ?
                  reg8[(4'hb):(4'ha)] : wire62)));
              reg68 <= $unsigned((|((wire2 ?
                  ((8'hbd) ? reg4 : wire1) : {reg4,
                      wire2}) == $unsigned((~wire9)))));
              reg69 <= $signed(($signed($unsigned({(8'hbd)})) ?
                  ($signed($signed(reg67)) >> (wire62[(2'h2):(1'h0)] ?
                      (~&reg6) : reg68[(4'hb):(2'h2)])) : $signed(({reg67,
                      reg8} ^~ wire60[(1'h1):(1'h0)]))));
              reg70 <= $signed(((~^wire2[(2'h2):(2'h2)]) ?
                  wire2[(2'h2):(2'h2)] : $unsigned($signed({reg6, reg4}))));
            end
          else
            begin
              reg66 <= $unsigned(wire60);
            end
          reg71 <= wire56[(3'h7):(1'h1)];
        end
      if ((~&wire58[(2'h2):(1'h1)]))
        begin
          if ((|wire63[(4'hb):(2'h3)]))
            begin
              reg72 <= (wire59 ?
                  (reg71[(2'h2):(1'h0)] & (!reg7)) : $signed(($unsigned((wire0 ?
                          wire3 : reg7)) ?
                      ($signed(reg66) ?
                          wire0[(3'h4):(1'h1)] : ((8'hb0) + reg4)) : reg71)));
              reg73 <= (~|$unsigned((reg7 + $signed($unsigned((8'ha7))))));
            end
          else
            begin
              reg72 <= (+(~(~^wire59)));
              reg73 <= reg7;
              reg74 <= $unsigned(($unsigned(wire9[(5'h11):(2'h3)]) ~^ {(reg73 | wire60[(3'h6):(2'h2)])}));
              reg75 <= ($unsigned((^~(reg73[(3'h6):(2'h2)] ?
                      (-reg72) : (wire62 ? wire3 : wire3)))) ?
                  $unsigned(reg72) : $signed($unsigned($signed($unsigned(wire60)))));
              reg76 <= (($signed((wire59[(4'hd):(3'h4)] ?
                      reg75[(1'h0):(1'h0)] : (-(8'hb4)))) - (+(reg72[(3'h7):(1'h1)] ?
                      reg74 : $unsigned(wire1)))) ?
                  (~&$signed({((8'ha6) ? wire2 : wire2),
                      $signed(reg68)})) : ($unsigned($unsigned({(8'hae)})) ?
                      $signed($unsigned(wire62[(1'h1):(1'h0)])) : wire56));
            end
        end
      else
        begin
          reg72 <= $signed((~^(&(wire64 ? (reg6 ^ wire65) : (wire2 >> reg4)))));
          if (reg67)
            begin
              reg73 <= (!((8'ha6) ?
                  wire9[(5'h14):(2'h3)] : (+{wire9, {reg8}})));
              reg74 <= ($signed($signed({reg71,
                  (wire1 ?
                      reg8 : wire59)})) <= $unsigned($unsigned(((&(8'ha7)) ?
                  (~|reg5) : (^reg67)))));
            end
          else
            begin
              reg73 <= wire58;
            end
        end
    end
  assign wire77 = ($signed((~|$signed(reg72[(1'h0):(1'h0)]))) << {$signed(reg66[(1'h0):(1'h0)])});
  assign wire78 = reg69[(2'h3):(2'h3)];
  assign wire79 = $unsigned(reg4);
  always
    @(posedge clk) begin
      reg80 <= reg74;
    end
  module81 #() modinst142 (wire141, clk, wire56, reg80, wire79, reg72);
  assign wire143 = wire61[(4'h9):(1'h1)];
  always
    @(posedge clk) begin
      reg144 <= (wire0[(3'h5):(1'h1)] < $signed(reg72));
    end
  assign wire145 = (($unsigned((-{reg72})) ^ (~|$signed((reg76 * reg75)))) > {reg5});
  module146 #() modinst157 (wire156, clk, wire141, reg4, reg68, reg6);
endmodule

module module146  (y, clk, wire150, wire149, wire148, wire147);
  output wire [(32'h33):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire150;
  input wire signed [(3'h7):(1'h0)] wire149;
  input wire signed [(4'hf):(1'h0)] wire148;
  input wire [(3'h6):(1'h0)] wire147;
  wire [(4'hc):(1'h0)] wire155;
  wire signed [(2'h3):(1'h0)] wire154;
  wire [(4'hf):(1'h0)] wire153;
  wire [(4'he):(1'h0)] wire152;
  wire signed [(3'h6):(1'h0)] wire151;
  assign y = {wire155, wire154, wire153, wire152, wire151, (1'h0)};
  assign wire151 = wire148[(3'h4):(1'h1)];
  assign wire152 = {$unsigned(wire148), wire150[(2'h3):(2'h3)]};
  assign wire153 = $signed(({(wire148[(4'hb):(4'ha)] ?
                           $signed(wire149) : wire147[(2'h2):(2'h2)]),
                       $signed(wire152)} >= (8'hbb)));
  assign wire154 = $signed(wire147);
  assign wire155 = wire147;
endmodule

module module81
#(parameter param140 = ({((((7'h40) <<< (8'haa)) ? ((8'hb4) ? (8'hba) : (8'h9e)) : (&(8'ha5))) ~^ (&{(8'ha9)})), {(~^((8'hb4) >>> (8'hbd)))}} < ((!(((7'h43) ? (8'hb7) : (8'hb5)) ? (^~(8'ha4)) : ((8'h9d) ~^ (8'had)))) * {(8'hb3), (^~(^~(7'h43)))})))
(y, clk, wire82, wire83, wire84, wire85);
  output wire [(32'hf9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire82;
  input wire signed [(5'h10):(1'h0)] wire83;
  input wire signed [(5'h10):(1'h0)] wire84;
  input wire signed [(5'h11):(1'h0)] wire85;
  wire [(5'h14):(1'h0)] wire94;
  wire signed [(3'h6):(1'h0)] wire95;
  wire signed [(5'h13):(1'h0)] wire101;
  wire [(5'h12):(1'h0)] wire102;
  wire [(4'hb):(1'h0)] wire103;
  wire signed [(4'hb):(1'h0)] wire104;
  wire [(5'h12):(1'h0)] wire105;
  wire signed [(4'hc):(1'h0)] wire106;
  wire signed [(5'h11):(1'h0)] wire107;
  wire [(3'h5):(1'h0)] wire138;
  reg signed [(4'hd):(1'h0)] reg86 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg88 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg89 = (1'h0);
  reg [(4'hb):(1'h0)] reg90 = (1'h0);
  reg [(4'h8):(1'h0)] reg91 = (1'h0);
  reg [(4'he):(1'h0)] reg92 = (1'h0);
  reg [(5'h12):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg96 = (1'h0);
  reg [(4'h9):(1'h0)] reg97 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg98 = (1'h0);
  reg [(2'h2):(1'h0)] reg99 = (1'h0);
  reg [(4'hc):(1'h0)] reg100 = (1'h0);
  assign y = {wire94,
                 wire95,
                 wire101,
                 wire102,
                 wire103,
                 wire104,
                 wire105,
                 wire106,
                 wire107,
                 wire138,
                 reg86,
                 reg87,
                 reg88,
                 reg89,
                 reg90,
                 reg91,
                 reg92,
                 reg93,
                 reg96,
                 reg97,
                 reg98,
                 reg99,
                 reg100,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg86 <= (wire83 ^~ $unsigned(wire83[(2'h3):(2'h3)]));
      reg87 <= wire84[(5'h10):(5'h10)];
      reg88 <= (&$unsigned((~|reg87)));
    end
  always
    @(posedge clk) begin
      reg89 <= (8'ha4);
      reg90 <= wire82;
      reg91 <= (reg90[(2'h2):(1'h1)] ?
          $unsigned((reg89 ?
              (8'hae) : $unsigned(reg88[(3'h4):(2'h3)]))) : (wire83[(4'he):(4'ha)] + $signed(wire85)));
      reg92 <= wire85[(4'he):(3'h6)];
      reg93 <= (~^wire83);
    end
  assign wire94 = (~|$signed($unsigned({(reg87 && reg91),
                      ((8'hb3) ? reg90 : reg86)})));
  assign wire95 = reg93;
  always
    @(posedge clk) begin
      reg96 <= $signed(($signed((^reg87)) >> (((^~wire95) * (reg92 == reg91)) ?
          ((wire85 < wire95) ?
              (-reg90) : (reg87 ?
                  reg90 : wire95)) : ((reg93 >>> reg86) >> $unsigned((8'hbc))))));
      reg97 <= $unsigned(reg90[(1'h1):(1'h1)]);
      reg98 <= ((reg89 <<< (reg88 || (8'ha8))) >> $unsigned((~^$unsigned($unsigned(wire83)))));
      if (($unsigned($unsigned(wire82[(3'h4):(1'h1)])) ?
          $unsigned((|((~|reg98) <= $signed(wire82)))) : ((^~(8'hb0)) ?
              ($signed(reg96) ^~ wire83[(4'h9):(1'h1)]) : ({(reg91 >> reg90)} ?
                  (reg87[(3'h4):(1'h1)] + (reg92 ?
                      reg93 : reg87)) : $unsigned((reg98 << reg88))))))
        begin
          reg99 <= (reg91 ~^ $signed({reg92}));
        end
      else
        begin
          reg99 <= wire84[(5'h10):(3'h5)];
          reg100 <= (^$unsigned(wire94[(4'ha):(4'ha)]));
        end
    end
  assign wire101 = ((((~(wire95 ? reg100 : reg99)) - (reg92 ?
                           wire83[(4'ha):(2'h3)] : reg92)) >> (^~$unsigned(reg93[(5'h11):(3'h4)]))) ?
                       (~&$signed(reg97)) : $unsigned($signed(($signed(reg92) && (reg99 ?
                           wire85 : reg92)))));
  assign wire102 = reg100;
  assign wire103 = $unsigned({((-reg91) ? $unsigned(reg86) : (&reg93))});
  assign wire104 = wire95;
  assign wire105 = (-{{(wire85[(3'h6):(2'h3)] ?
                               reg99[(2'h2):(1'h0)] : $unsigned(wire104))},
                       reg91[(2'h3):(1'h0)]});
  assign wire106 = $signed((!((reg92[(3'h5):(1'h1)] ?
                       (reg96 ~^ (8'h9c)) : ((8'h9f) ?
                           reg92 : wire102)) << {$unsigned(reg93)})));
  assign wire107 = (((((!reg86) + (wire105 || reg88)) >> ({wire103,
                               reg87} & $unsigned(reg96))) ?
                           wire104 : ($unsigned((reg91 ~^ wire95)) ^ $signed($unsigned(reg87)))) ?
                       (~&$signed($signed($unsigned(reg98)))) : $unsigned((+$unsigned({wire94,
                           wire85}))));
  module108 #() modinst139 (.wire111(reg90), .y(wire138), .wire110(reg89), .wire109(reg100), .clk(clk), .wire112(wire105));
endmodule

module module10
#(parameter param54 = {(({(|(8'hb7)), ((8'hb4) != (8'ha0))} >> (&(^~(8'ha0)))) ? (~|((8'hb4) ? (+(8'ha5)) : {(8'hab), (8'hb7)})) : (({(8'h9d)} == ((8'ha8) | (8'hbd))) <= (((8'h9e) ? (8'hbc) : (8'haa)) ^ (~|(8'hb6)))))}, 
parameter param55 = (param54 ? param54 : param54))
(y, clk, wire11, wire12, wire13, wire14, wire15);
  output wire [(32'h89):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire11;
  input wire signed [(5'h12):(1'h0)] wire12;
  input wire [(4'h9):(1'h0)] wire13;
  input wire [(5'h12):(1'h0)] wire14;
  input wire signed [(5'h10):(1'h0)] wire15;
  wire signed [(5'h11):(1'h0)] wire53;
  wire signed [(5'h12):(1'h0)] wire52;
  wire signed [(3'h7):(1'h0)] wire51;
  wire [(4'hf):(1'h0)] wire50;
  wire signed [(5'h10):(1'h0)] wire49;
  wire signed [(4'ha):(1'h0)] wire48;
  wire [(4'hd):(1'h0)] wire47;
  wire [(4'h8):(1'h0)] wire16;
  wire signed [(3'h7):(1'h0)] wire17;
  wire signed [(3'h7):(1'h0)] wire18;
  wire signed [(2'h2):(1'h0)] wire19;
  wire signed [(5'h10):(1'h0)] wire45;
  assign y = {wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire45,
                 (1'h0)};
  assign wire16 = (8'hbe);
  assign wire17 = {wire11[(2'h2):(1'h0)], (^$unsigned((+wire14)))};
  assign wire18 = wire12[(1'h1):(1'h1)];
  assign wire19 = (wire16[(1'h1):(1'h0)] && (~&(((&wire18) ^ wire15[(3'h4):(1'h0)]) ?
                      (~^(wire15 * wire14)) : (&(wire15 ? wire16 : (8'ha1))))));
  module20 #() modinst46 (wire45, clk, wire17, wire15, wire14, wire11, wire12);
  assign wire47 = $signed(wire18[(3'h7):(1'h0)]);
  assign wire48 = wire14;
  assign wire49 = ($unsigned({((8'hb6) > $signed(wire17))}) ?
                      $unsigned($unsigned((wire13 ?
                          (!wire47) : $signed(wire13)))) : (8'ha6));
  assign wire50 = $signed(wire17);
  assign wire51 = $unsigned($unsigned(($unsigned((^~wire16)) ?
                      (~$signed((8'hb0))) : wire16[(2'h3):(2'h2)])));
  assign wire52 = {$unsigned(wire51[(3'h4):(1'h1)])};
  assign wire53 = (wire16[(3'h4):(2'h3)] && $signed((((wire11 != wire49) || $signed(wire19)) ?
                      ((wire16 < wire18) ?
                          $signed(wire52) : (wire18 >> wire19)) : wire48[(3'h4):(1'h0)])));
endmodule

module module20
#(parameter param43 = (~{(!(((8'hac) ? (8'hb5) : (8'haf)) ? {(8'had)} : ((8'hbb) ? (8'ha8) : (8'hb5))))}), 
parameter param44 = param43)
(y, clk, wire25, wire24, wire23, wire22, wire21);
  output wire [(32'had):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire25;
  input wire signed [(5'h10):(1'h0)] wire24;
  input wire signed [(4'hb):(1'h0)] wire23;
  input wire signed [(4'ha):(1'h0)] wire22;
  input wire signed [(2'h2):(1'h0)] wire21;
  wire [(4'he):(1'h0)] wire39;
  wire [(4'h9):(1'h0)] wire38;
  wire [(3'h5):(1'h0)] wire37;
  wire [(5'h13):(1'h0)] wire28;
  wire [(4'hd):(1'h0)] wire27;
  wire signed [(2'h2):(1'h0)] wire26;
  reg [(5'h13):(1'h0)] reg42 = (1'h0);
  reg [(4'h8):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg40 = (1'h0);
  reg [(3'h6):(1'h0)] reg36 = (1'h0);
  reg [(4'hb):(1'h0)] reg35 = (1'h0);
  reg [(3'h7):(1'h0)] reg34 = (1'h0);
  reg [(4'hd):(1'h0)] reg33 = (1'h0);
  reg [(3'h6):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg29 = (1'h0);
  assign y = {wire39,
                 wire38,
                 wire37,
                 wire28,
                 wire27,
                 wire26,
                 reg42,
                 reg41,
                 reg40,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 (1'h0)};
  assign wire26 = (-(8'ha1));
  assign wire27 = {$unsigned($signed($unsigned((~|wire22)))), wire23};
  assign wire28 = {(8'ha9), wire25[(3'h5):(1'h0)]};
  always
    @(posedge clk) begin
      reg29 <= wire27;
      if ($unsigned(({$signed(wire21)} << wire23[(2'h2):(1'h1)])))
        begin
          reg30 <= ($unsigned($signed(wire22)) ?
              {$unsigned(({wire21} ?
                      wire27[(1'h0):(1'h0)] : {reg29, wire28}))} : (+(({reg29} ?
                      {wire28, (7'h41)} : (reg29 ? wire23 : wire22)) ?
                  ($signed(wire22) ?
                      $unsigned(wire25) : wire23[(4'hb):(3'h5)]) : (wire27 ?
                      wire24 : wire24[(4'h9):(1'h1)]))));
          if ((^~(~^(8'ha9))))
            begin
              reg31 <= {$signed({wire21}),
                  $unsigned((((wire26 >>> wire27) ?
                          (wire24 && wire22) : $signed((8'h9e))) ?
                      wire27 : $unsigned($unsigned(wire28))))};
              reg32 <= $signed($signed(($unsigned({(8'hb9),
                  wire27}) || $unsigned((~|wire24)))));
              reg33 <= $signed((+$signed(wire26)));
              reg34 <= (~&(8'hba));
            end
          else
            begin
              reg31 <= wire21;
              reg32 <= $signed((+$signed($unsigned((wire25 ^~ reg34)))));
              reg33 <= (^~{(~(reg30 ?
                      reg29[(1'h0):(1'h0)] : wire26[(1'h1):(1'h1)])),
                  $unsigned(reg32[(1'h0):(1'h0)])});
              reg34 <= $signed($signed(reg30[(4'hd):(4'h8)]));
            end
        end
      else
        begin
          reg30 <= reg29[(1'h0):(1'h0)];
          reg31 <= ($unsigned($unsigned(wire25)) != (^(~|($unsigned(reg30) > (wire26 ?
              wire22 : wire23)))));
        end
      reg35 <= (8'hbf);
      reg36 <= (8'ha3);
    end
  assign wire37 = (reg31 <= reg31);
  assign wire38 = ((+$signed($signed((wire21 | (7'h44))))) >> (7'h44));
  assign wire39 = (^~(({(~|reg29)} ?
                          reg30[(3'h5):(3'h4)] : (~|(reg34 ? wire28 : reg32))) ?
                      $unsigned((+(wire38 ~^ wire26))) : $signed(($unsigned(wire24) ?
                          (!(8'hbd)) : $unsigned(reg36)))));
  always
    @(posedge clk) begin
      reg40 <= (~^reg35[(3'h6):(3'h4)]);
      reg41 <= ($signed($signed(({wire21, reg36} < $signed(reg31)))) ?
          (|($signed($signed((8'hbb))) && ((^~wire27) ?
              (!reg34) : (wire26 ?
                  wire23 : wire22)))) : ($unsigned(wire27[(3'h6):(1'h1)]) ?
              (~reg31) : (^wire38[(2'h3):(1'h1)])));
      reg42 <= wire27[(4'h8):(3'h5)];
    end
endmodule

module module108
#(parameter param137 = (~|((~^(8'hb7)) ? ((-{(8'ha4)}) != ({(8'h9e)} + {(8'ha4), (8'hb8)})) : (+(^~(|(8'hb2)))))))
(y, clk, wire112, wire111, wire110, wire109);
  output wire [(32'h120):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire112;
  input wire signed [(4'hb):(1'h0)] wire111;
  input wire [(3'h4):(1'h0)] wire110;
  input wire [(3'h7):(1'h0)] wire109;
  wire [(3'h7):(1'h0)] wire136;
  wire [(4'hf):(1'h0)] wire114;
  wire signed [(3'h7):(1'h0)] wire113;
  reg signed [(5'h11):(1'h0)] reg135 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg132 = (1'h0);
  reg [(5'h12):(1'h0)] reg131 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg130 = (1'h0);
  reg [(2'h2):(1'h0)] reg129 = (1'h0);
  reg [(5'h10):(1'h0)] reg128 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg127 = (1'h0);
  reg [(3'h6):(1'h0)] reg126 = (1'h0);
  reg [(5'h15):(1'h0)] reg125 = (1'h0);
  reg [(4'hb):(1'h0)] reg124 = (1'h0);
  reg [(5'h11):(1'h0)] reg123 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg122 = (1'h0);
  reg [(4'hc):(1'h0)] reg121 = (1'h0);
  reg [(3'h5):(1'h0)] reg120 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg119 = (1'h0);
  reg [(3'h7):(1'h0)] reg118 = (1'h0);
  reg [(3'h7):(1'h0)] reg117 = (1'h0);
  reg [(5'h14):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg115 = (1'h0);
  assign y = {wire136,
                 wire114,
                 wire113,
                 reg135,
                 reg134,
                 reg133,
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
                 (1'h0)};
  assign wire113 = {wire112[(4'hf):(3'h7)], (8'ha9)};
  assign wire114 = $signed($signed(wire110));
  always
    @(posedge clk) begin
      if ($signed((($unsigned((~^wire112)) ?
              {$signed(wire111)} : wire113[(2'h3):(2'h3)]) ?
          {$unsigned($signed(wire114)), (-wire109)} : $signed({$signed(wire114),
              (wire111 ~^ wire109)}))))
        begin
          if (wire114[(4'he):(4'he)])
            begin
              reg115 <= ((&wire111[(4'h8):(2'h2)]) ~^ wire110);
            end
          else
            begin
              reg115 <= (wire113 == {$unsigned(wire109[(2'h3):(1'h0)]),
                  (wire112 ?
                      $signed(wire111) : ((&(8'hb6)) << $unsigned(wire111)))});
            end
        end
      else
        begin
          reg115 <= {(!((&$unsigned(reg115)) ?
                  $signed((-wire109)) : $unsigned((~wire114)))),
              (wire113 ?
                  (~&$signed((wire113 ? wire114 : wire111))) : (~^reg115))};
          reg116 <= reg115;
        end
      reg117 <= (~^$unsigned($signed($unsigned((8'hb0)))));
      if ({(wire112 * $unsigned(reg116))})
        begin
          if ((reg116[(3'h5):(2'h2)] || ($signed((!reg117[(3'h6):(3'h6)])) <= {($signed(wire113) & (wire111 > wire114)),
              reg115})))
            begin
              reg118 <= ({(-$signed(reg116)),
                      $unsigned(reg117[(3'h6):(3'h6)])} ?
                  wire110[(1'h1):(1'h1)] : $unsigned($unsigned(((wire114 ?
                          reg115 : wire109) ?
                      (!wire113) : (~wire110)))));
            end
          else
            begin
              reg118 <= ($signed($signed($unsigned(reg118))) ?
                  ({$signed($unsigned(reg117)),
                          {$signed(reg118), wire109[(1'h1):(1'h1)]}} ?
                      reg117[(3'h4):(2'h2)] : (wire113[(1'h0):(1'h0)] != $signed((!reg118)))) : (+wire114));
              reg119 <= ($signed($unsigned(((~|(8'ha6)) ?
                      (^wire109) : reg115))) ?
                  $unsigned($unsigned(reg118)) : ((reg116[(3'h7):(3'h6)] ?
                      wire109[(3'h7):(3'h5)] : {$signed(wire110)}) > {(-(reg118 ?
                          wire112 : reg116))}));
              reg120 <= $unsigned(wire113);
              reg121 <= (8'ha8);
            end
          if ($unsigned($signed(reg119[(4'he):(4'ha)])))
            begin
              reg122 <= $unsigned($unsigned(reg120));
            end
          else
            begin
              reg122 <= $signed((reg120[(2'h3):(1'h1)] ?
                  {$signed((reg122 | reg122))} : $unsigned(reg118[(3'h7):(3'h4)])));
              reg123 <= ((~^{$unsigned((8'hab))}) ~^ $signed(($signed(reg115[(4'h8):(3'h5)]) ?
                  reg116[(5'h14):(5'h11)] : (8'hb1))));
              reg124 <= wire113;
              reg125 <= (|({(8'hb5)} ?
                  reg117 : (wire111 ?
                      (|(wire112 ? reg120 : reg119)) : ((reg124 ?
                              wire110 : wire113) ?
                          (wire113 <= reg117) : reg123[(5'h10):(3'h6)]))));
              reg126 <= reg122[(1'h1):(1'h1)];
            end
          reg127 <= wire110[(1'h0):(1'h0)];
        end
      else
        begin
          reg118 <= reg123[(4'hb):(3'h7)];
          reg119 <= (~&{(((reg119 ~^ reg125) ? (!reg126) : reg124) ?
                  reg119[(4'ha):(1'h0)] : $unsigned($unsigned(reg124))),
              wire111[(4'hb):(4'hb)]});
          reg120 <= reg123[(4'ha):(1'h1)];
          reg121 <= {reg121};
          reg122 <= $unsigned(wire114[(3'h5):(1'h1)]);
        end
    end
  always
    @(posedge clk) begin
      reg128 <= (~^$unsigned($unsigned({((8'ha2) - reg121)})));
      reg129 <= (((reg121 ?
          $unsigned((reg117 ?
              reg122 : wire114)) : {reg115[(3'h6):(3'h5)]}) ~^ (+reg117[(1'h1):(1'h0)])) - (+$signed((8'hb1))));
      reg130 <= reg126[(2'h2):(1'h0)];
      if ({{$unsigned(reg121)}})
        begin
          reg131 <= (reg130[(2'h2):(1'h1)] || $signed((reg118[(3'h4):(2'h3)] ?
              (+$signed(reg127)) : {(7'h44), (reg126 << reg115)})));
          if ((((reg124[(4'h8):(4'h8)] ?
              (~$signed((8'h9c))) : ({reg131} ?
                  (wire109 >> reg121) : wire114)) || reg128[(3'h4):(1'h0)]) ~^ ($unsigned(wire113[(1'h1):(1'h1)]) ?
              reg125[(3'h4):(2'h3)] : (~&((~&wire111) ^ (^(8'ha9)))))))
            begin
              reg132 <= (({$unsigned((reg125 <<< reg122))} & $unsigned((((8'h9f) ?
                      wire109 : wire114) << $signed(wire110)))) ?
                  (^~reg120) : $signed({$signed((reg124 || reg126))}));
              reg133 <= ((-(reg131 ?
                  $unsigned(reg127[(4'ha):(3'h7)]) : (8'ha7))) & (~^(reg115 ?
                  (~^(&reg130)) : reg132)));
              reg134 <= $signed((^wire113));
            end
          else
            begin
              reg132 <= $unsigned($unsigned(reg117[(2'h2):(1'h1)]));
              reg133 <= reg125;
            end
          reg135 <= $unsigned((reg130[(2'h3):(2'h3)] - $signed((reg115[(4'hd):(3'h6)] ?
              (reg125 == (8'hb3)) : $unsigned(reg123)))));
        end
      else
        begin
          if ({(($unsigned(((8'ha6) != reg121)) ?
                  $signed(wire109[(2'h2):(2'h2)]) : $unsigned(reg122)) != reg128),
              (^((~^$signed(reg126)) ?
                  (^(wire109 | reg115)) : $unsigned((^reg115))))})
            begin
              reg131 <= reg128;
              reg132 <= reg125;
              reg133 <= $signed((^~(((8'had) ?
                      ((8'ha5) ? wire112 : reg129) : (+reg123)) ?
                  reg128[(2'h3):(2'h3)] : $unsigned(reg129[(1'h0):(1'h0)]))));
            end
          else
            begin
              reg131 <= $signed(({reg131[(1'h0):(1'h0)],
                  reg125} < $signed((reg130[(1'h1):(1'h0)] * reg116[(4'h8):(3'h5)]))));
            end
          reg134 <= reg115;
        end
    end
  assign wire136 = ((8'hb2) << (8'haa));
endmodule
