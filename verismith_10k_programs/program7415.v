module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h4d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire4;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire [(4'h8):(1'h0)] wire85;
  wire [(4'hb):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire87;
  wire [(4'hf):(1'h0)] wire88;
  wire signed [(5'h13):(1'h0)] wire117;
  reg [(2'h2):(1'h0)] reg119 = (1'h0);
  assign y = {wire85, wire5, wire87, wire88, wire117, reg119, (1'h0)};
  assign wire5 = $unsigned($unsigned(wire1));
  module6 #() modinst86 (.wire9(wire3), .clk(clk), .wire11(wire1), .wire10(wire0), .y(wire85), .wire7(wire2), .wire8(wire4));
  assign wire87 = (^(^$signed(((~&wire85) && $unsigned(wire4)))));
  assign wire88 = wire4;
  module89 #() modinst118 (.y(wire117), .clk(clk), .wire92(wire2), .wire90(wire87), .wire94(wire4), .wire91(wire88), .wire93(wire3));
  always
    @(posedge clk) begin
      reg119 <= $unsigned(($signed(wire4) ?
          ((-$unsigned(wire85)) == (~wire87[(5'h10):(3'h5)])) : (-(wire85 <= $signed(wire2)))));
    end
endmodule

module module89  (y, clk, wire90, wire91, wire92, wire93, wire94);
  output wire [(32'h5a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire90;
  input wire [(4'hf):(1'h0)] wire91;
  input wire [(5'h15):(1'h0)] wire92;
  input wire signed [(4'hd):(1'h0)] wire93;
  input wire [(3'h4):(1'h0)] wire94;
  wire [(3'h7):(1'h0)] wire116;
  wire signed [(3'h7):(1'h0)] wire115;
  wire [(5'h12):(1'h0)] wire95;
  wire [(5'h10):(1'h0)] wire96;
  wire signed [(2'h2):(1'h0)] wire97;
  wire [(5'h10):(1'h0)] wire98;
  wire [(4'ha):(1'h0)] wire99;
  wire signed [(4'hd):(1'h0)] wire113;
  assign y = {wire116,
                 wire115,
                 wire95,
                 wire96,
                 wire97,
                 wire98,
                 wire99,
                 wire113,
                 (1'h0)};
  assign wire95 = ({{$signed((!wire94)), $unsigned((wire90 ~^ wire93))}} ?
                      (((~^((8'hb3) ?
                          wire91 : (8'hb1))) > $signed($signed(wire94))) || wire94[(1'h0):(1'h0)]) : $unsigned(wire91[(4'ha):(2'h3)]));
  assign wire96 = $signed({{(8'hb6), wire93}});
  assign wire97 = ((($unsigned((!wire93)) <= wire93) ?
                          ((wire93 || wire92) != (~|(wire92 & (8'ha4)))) : (wire93 ?
                              wire93 : $signed((+wire96)))) ?
                      $unsigned((wire96[(1'h0):(1'h0)] >>> $signed($signed(wire91)))) : ((wire96[(3'h7):(3'h4)] << $unsigned($signed(wire90))) ~^ wire96));
  assign wire98 = ($signed((((wire94 <<< wire92) ?
                      $signed(wire90) : {wire90,
                          wire95}) > (^~$signed(wire91)))) ^~ ($unsigned(((-wire94) ?
                      $signed(wire93) : wire96)) ^~ {$unsigned((+wire96)),
                      $unsigned(wire91)}));
  assign wire99 = wire96[(4'hd):(3'h7)];
  module100 #() modinst114 (.wire105(wire96), .wire103(wire91), .y(wire113), .wire104(wire92), .wire102(wire90), .clk(clk), .wire101(wire93));
  assign wire115 = ($unsigned($unsigned(wire93[(2'h2):(1'h0)])) ^~ (^$signed({wire92,
                       (wire97 ? wire93 : wire98)})));
  assign wire116 = (wire90[(1'h1):(1'h0)] != $unsigned(wire94[(2'h3):(2'h3)]));
endmodule

module module6  (y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h216):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire11;
  input wire [(3'h7):(1'h0)] wire10;
  input wire signed [(5'h15):(1'h0)] wire9;
  input wire [(4'hf):(1'h0)] wire8;
  input wire signed [(4'hf):(1'h0)] wire7;
  wire [(3'h7):(1'h0)] wire84;
  wire signed [(4'he):(1'h0)] wire83;
  wire [(4'hf):(1'h0)] wire82;
  wire [(5'h13):(1'h0)] wire81;
  wire signed [(4'ha):(1'h0)] wire80;
  wire signed [(4'hb):(1'h0)] wire63;
  wire signed [(2'h2):(1'h0)] wire62;
  wire [(5'h11):(1'h0)] wire57;
  wire [(4'hd):(1'h0)] wire43;
  wire [(4'he):(1'h0)] wire42;
  wire signed [(5'h12):(1'h0)] wire40;
  wire [(5'h12):(1'h0)] wire13;
  wire [(5'h13):(1'h0)] wire12;
  reg [(4'hd):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg78 = (1'h0);
  reg [(5'h15):(1'h0)] reg77 = (1'h0);
  reg [(4'h9):(1'h0)] reg76 = (1'h0);
  reg [(4'h8):(1'h0)] reg75 = (1'h0);
  reg [(2'h2):(1'h0)] reg74 = (1'h0);
  reg [(3'h7):(1'h0)] reg73 = (1'h0);
  reg [(5'h11):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg71 = (1'h0);
  reg [(3'h5):(1'h0)] reg70 = (1'h0);
  reg signed [(4'he):(1'h0)] reg69 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg66 = (1'h0);
  reg [(5'h10):(1'h0)] reg65 = (1'h0);
  reg [(5'h14):(1'h0)] reg64 = (1'h0);
  reg [(5'h10):(1'h0)] reg61 = (1'h0);
  reg [(4'hb):(1'h0)] reg60 = (1'h0);
  reg [(4'he):(1'h0)] reg59 = (1'h0);
  reg [(3'h4):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg54 = (1'h0);
  reg [(2'h3):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg51 = (1'h0);
  reg [(2'h3):(1'h0)] reg50 = (1'h0);
  reg [(3'h5):(1'h0)] reg49 = (1'h0);
  reg [(5'h11):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg47 = (1'h0);
  reg [(4'h9):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg45 = (1'h0);
  reg [(5'h11):(1'h0)] reg44 = (1'h0);
  assign y = {wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire63,
                 wire62,
                 wire57,
                 wire43,
                 wire42,
                 wire40,
                 wire13,
                 wire12,
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
                 reg64,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 (1'h0)};
  assign wire12 = (8'hbf);
  assign wire13 = (!((((wire11 ? wire7 : wire11) ?
                          $signed((8'hb8)) : $signed(wire8)) ?
                      wire8[(2'h2):(1'h0)] : $signed(wire12[(4'hf):(4'hf)])) && ($signed((~|(8'hb5))) ?
                      wire12 : wire10[(2'h3):(2'h3)])));
  module14 #() modinst41 (.wire15(wire12), .wire16(wire10), .y(wire40), .clk(clk), .wire18(wire13), .wire17(wire11));
  assign wire42 = wire7[(2'h2):(1'h1)];
  assign wire43 = wire42;
  always
    @(posedge clk) begin
      reg44 <= (^~wire13[(5'h12):(3'h5)]);
      reg45 <= (^(|wire10));
    end
  always
    @(posedge clk) begin
      if (wire43[(4'h8):(3'h4)])
        begin
          reg46 <= $signed((wire7 ?
              (wire42 ^~ ($unsigned(wire12) << (wire42 > reg45))) : wire10));
        end
      else
        begin
          reg46 <= wire13[(4'hd):(4'ha)];
        end
      reg47 <= ({$signed((wire40[(4'hf):(4'hb)] ?
              (^reg45) : reg45))} >>> ((wire10[(2'h3):(1'h1)] >>> wire42[(4'hb):(2'h3)]) ?
          (~&wire8[(4'h9):(2'h3)]) : $signed(($signed(reg45) >= wire12))));
      reg48 <= $signed(reg47);
    end
  always
    @(posedge clk) begin
      if (wire42)
        begin
          if ((wire8 ?
              $unsigned($signed($signed($unsigned(wire42)))) : wire7[(3'h6):(3'h5)]))
            begin
              reg49 <= wire8[(4'hc):(3'h6)];
              reg50 <= wire42[(1'h1):(1'h1)];
              reg51 <= {((^((wire10 ? wire7 : wire40) ?
                      (~&reg48) : wire9)) == (wire7 ?
                      $signed(wire13) : (&wire13))),
                  {(^wire42[(2'h2):(1'h1)]),
                      ({((8'hb1) ? wire11 : (8'haf))} ?
                          $unsigned($unsigned(reg50)) : (~^$signed(reg47)))}};
              reg52 <= ((~^(8'hb4)) <<< (~|((((8'hb0) ? reg50 : wire40) ?
                      (~^reg46) : $signed(wire13)) ?
                  wire9 : ($unsigned(reg51) ? reg49 : (!reg46)))));
            end
          else
            begin
              reg49 <= $signed($signed((~$unsigned((wire10 ?
                  reg50 : wire42)))));
              reg50 <= $unsigned(($unsigned(wire42) ?
                  ($signed({wire9}) ~^ reg50) : reg51));
              reg51 <= wire12;
            end
          reg53 <= ($unsigned($signed(((wire9 | wire11) <= (-wire10)))) ?
              (~&reg44[(4'hb):(4'hb)]) : (~|(|($signed(reg45) ~^ {reg49}))));
          reg54 <= (wire43[(2'h2):(1'h1)] & reg44[(4'hf):(2'h2)]);
          reg55 <= (^reg52[(1'h1):(1'h1)]);
          reg56 <= ((!(($unsigned(wire8) ?
                  wire8 : reg53[(2'h3):(2'h3)]) && ($signed(wire9) ^~ reg52[(2'h2):(2'h2)]))) ?
              $unsigned(reg55) : ($signed($signed(((8'hb2) ? reg55 : wire42))) ?
                  (8'hb1) : {$signed((+reg54))}));
        end
      else
        begin
          reg49 <= ($signed($unsigned(((-reg52) ?
                  ((7'h40) ? (8'ha6) : reg45) : (wire12 | reg51)))) ?
              wire9 : $unsigned((reg55[(4'hc):(3'h7)] == wire7)));
          if (reg50)
            begin
              reg50 <= ($unsigned(reg50) & $unsigned($unsigned(reg45)));
            end
          else
            begin
              reg50 <= $signed(wire10[(1'h0):(1'h0)]);
              reg51 <= (^$signed(reg51));
            end
          reg52 <= reg44[(1'h0):(1'h0)];
        end
    end
  assign wire57 = reg44;
  always
    @(posedge clk) begin
      reg58 <= $unsigned((wire40[(2'h2):(2'h2)] ?
          ($unsigned($unsigned(wire57)) ^~ ($signed(reg51) & reg53[(2'h3):(2'h3)])) : (8'ha5)));
      reg59 <= {(({(reg58 >> reg53)} | ((-wire10) != $signed(reg50))) ?
              reg52[(3'h5):(2'h3)] : ($signed((8'hb6)) ? (8'hb6) : reg51))};
      reg60 <= ($unsigned(((8'hae) ? $signed(reg59) : (!$signed((8'hb1))))) ?
          (~^(reg49 << (&(8'hb0)))) : wire11[(4'h9):(2'h2)]);
      reg61 <= $signed((+$signed($signed((8'h9c)))));
    end
  assign wire62 = $unsigned($signed((($signed(wire8) >> reg61[(4'hc):(2'h2)]) != wire40[(5'h12):(5'h11)])));
  assign wire63 = {$unsigned(wire10), (~wire43)};
  always
    @(posedge clk) begin
      if (wire62)
        begin
          if (((&$signed(wire43[(1'h1):(1'h0)])) ?
              ({$signed(wire13[(2'h2):(1'h1)])} << (wire43[(3'h4):(1'h1)] > ($signed(reg48) > $unsigned((8'ha0))))) : reg48))
            begin
              reg64 <= (&wire63[(4'h9):(1'h1)]);
            end
          else
            begin
              reg64 <= ((($unsigned(wire11) + wire42) ?
                  (-$unsigned($unsigned(reg58))) : reg45) << (^~$unsigned($signed(reg44[(4'hc):(3'h7)]))));
              reg65 <= reg50;
              reg66 <= (($unsigned(wire7) != $signed(wire42)) ^~ (($signed((reg60 ?
                          wire12 : reg61)) ?
                      ((reg52 ?
                          reg53 : reg56) & $signed(reg45)) : (wire12[(4'hc):(2'h3)] ?
                          (!reg48) : reg58)) ?
                  $signed($signed(reg65)) : $unsigned(reg46[(1'h0):(1'h0)])));
            end
        end
      else
        begin
          if (reg49)
            begin
              reg64 <= {$unsigned($signed(({reg47, wire62} ?
                      wire62[(1'h0):(1'h0)] : $signed(wire43))))};
              reg65 <= $signed(reg59);
              reg66 <= wire13[(4'hc):(3'h6)];
              reg67 <= ({$signed((reg58[(1'h0):(1'h0)] ~^ wire9))} <= {{$signed($signed(reg51))},
                  ($unsigned((-wire42)) ? wire8 : (^~reg65))});
              reg68 <= (7'h44);
            end
          else
            begin
              reg64 <= wire57;
              reg65 <= {((({(8'hb1)} && wire12) + $unsigned(wire12)) ?
                      (reg58 ?
                          $signed((~^reg49)) : wire62) : (-(~^(~|wire8))))};
            end
        end
      if ($unsigned($unsigned($unsigned(((reg66 ? reg52 : reg61) ?
          {(7'h41)} : reg49)))))
        begin
          if (($unsigned((wire40[(5'h11):(4'h9)] ?
              wire62[(1'h0):(1'h0)] : reg44)) > {({wire62,
                      wire10[(3'h5):(1'h1)]} ?
                  $unsigned((wire43 < reg45)) : wire42[(1'h0):(1'h0)])}))
            begin
              reg69 <= (^~$signed($unsigned(reg54[(2'h3):(2'h3)])));
              reg70 <= (reg56[(2'h2):(1'h0)] ?
                  reg54[(2'h3):(2'h2)] : ($unsigned($signed(wire7)) ?
                      wire9[(3'h6):(2'h2)] : reg60[(3'h5):(1'h0)]));
              reg71 <= ((~(+($unsigned((8'hb4)) << ((8'ha2) <<< wire63)))) * (7'h44));
              reg72 <= wire43;
              reg73 <= reg58[(1'h0):(1'h0)];
            end
          else
            begin
              reg69 <= $unsigned((^~wire43));
              reg70 <= $signed(((8'ha1) << (!wire8[(4'hd):(2'h3)])));
            end
          if ($signed((((reg69 ?
              reg73 : $unsigned(reg71)) >> $unsigned(reg71)) && $signed(reg51[(3'h5):(2'h2)]))))
            begin
              reg74 <= wire11;
              reg75 <= reg65;
              reg76 <= reg50[(1'h0):(1'h0)];
              reg77 <= (~|{reg45});
            end
          else
            begin
              reg74 <= reg74[(1'h0):(1'h0)];
            end
          reg78 <= (reg54 ?
              reg50[(1'h0):(1'h0)] : (reg70[(3'h5):(2'h2)] ^~ ($unsigned($unsigned(reg75)) ?
                  (7'h40) : (8'h9f))));
        end
      else
        begin
          reg69 <= (reg54 <= (8'hb9));
          reg70 <= reg66[(4'ha):(3'h7)];
          reg71 <= (reg61[(3'h4):(2'h3)] && reg46);
        end
      reg79 <= {$unsigned((~&$unsigned((8'hae)))),
          $signed(wire11[(2'h3):(2'h3)])};
    end
  assign wire80 = $signed({{reg66, {$unsigned((8'ha6)), $unsigned(wire42)}}});
  assign wire81 = reg53[(2'h2):(2'h2)];
  assign wire82 = reg58;
  assign wire83 = (~&((+$signed(wire10)) & reg65[(4'hc):(4'ha)]));
  assign wire84 = {$unsigned((&({reg49} << (~reg65)))),
                      (|(wire63 ?
                          $unsigned(reg71[(1'h0):(1'h0)]) : {{wire10}}))};
endmodule

module module14  (y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'hb4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire18;
  input wire [(4'hb):(1'h0)] wire17;
  input wire signed [(3'h6):(1'h0)] wire16;
  input wire [(3'h5):(1'h0)] wire15;
  wire signed [(3'h6):(1'h0)] wire39;
  wire signed [(3'h5):(1'h0)] wire38;
  wire [(4'hc):(1'h0)] wire37;
  wire signed [(4'hc):(1'h0)] wire36;
  wire [(4'he):(1'h0)] wire35;
  wire [(4'h8):(1'h0)] wire33;
  wire [(4'hd):(1'h0)] wire32;
  wire [(3'h6):(1'h0)] wire31;
  wire [(2'h2):(1'h0)] wire30;
  wire [(3'h4):(1'h0)] wire29;
  wire signed [(4'hf):(1'h0)] wire28;
  wire signed [(4'ha):(1'h0)] wire27;
  wire [(2'h2):(1'h0)] wire26;
  wire [(4'h9):(1'h0)] wire25;
  wire [(5'h10):(1'h0)] wire24;
  wire [(3'h6):(1'h0)] wire23;
  wire [(4'ha):(1'h0)] wire22;
  wire [(4'h8):(1'h0)] wire21;
  wire [(2'h2):(1'h0)] wire20;
  wire [(3'h4):(1'h0)] wire19;
  reg [(4'hf):(1'h0)] reg34 = (1'h0);
  assign y = {wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 reg34,
                 (1'h0)};
  assign wire19 = wire16;
  assign wire20 = wire17;
  assign wire21 = wire17;
  assign wire22 = (7'h40);
  assign wire23 = $signed((!wire19[(1'h0):(1'h0)]));
  assign wire24 = $unsigned($unsigned({(wire16 ?
                          $unsigned(wire19) : (~(8'h9c)))}));
  assign wire25 = ($unsigned(($unsigned(wire17) <<< (~^$unsigned(wire16)))) > ({wire23[(3'h5):(1'h0)]} <= wire24[(2'h2):(1'h0)]));
  assign wire26 = $unsigned((7'h44));
  assign wire27 = (-wire21);
  assign wire28 = {($unsigned(wire16) ?
                          $signed(wire26[(2'h2):(1'h1)]) : $signed(wire21[(1'h1):(1'h0)])),
                      $signed($signed(((!(8'hbf)) >> (wire19 ^ (8'hb9)))))};
  assign wire29 = $unsigned((((wire22[(4'h8):(3'h7)] ?
                              (8'hb2) : (wire19 >>> wire22)) ?
                          (wire17 <= wire18[(4'h8):(1'h0)]) : $signed(wire20)) ?
                      ({(8'ha4), wire23} ?
                          (^(-wire20)) : wire27[(4'ha):(3'h4)]) : wire15[(1'h0):(1'h0)]));
  assign wire30 = (8'haa);
  assign wire31 = (~|$signed(wire23[(3'h6):(3'h5)]));
  assign wire32 = wire22[(3'h5):(2'h2)];
  assign wire33 = $unsigned({wire28});
  always
    @(posedge clk) begin
      reg34 <= $signed((^wire19));
    end
  assign wire35 = (-wire19[(2'h3):(1'h0)]);
  assign wire36 = $unsigned({wire18});
  assign wire37 = wire29;
  assign wire38 = (^~wire24);
  assign wire39 = $unsigned(($unsigned({wire23}) >>> $unsigned((|(wire31 ?
                      wire15 : (8'h9f))))));
endmodule

module module100
#(parameter param112 = ({((((8'hbd) < (7'h44)) ? ((8'hb1) && (8'ha6)) : (8'ha9)) ~^ (+{(8'had)}))} ? {(8'h9c), (^~(((8'hba) + (8'ha7)) ? ((7'h40) ? (8'hae) : (8'hb5)) : ((8'hb9) ? (8'hac) : (8'ha1))))} : (~^(((~(8'h9f)) ? ((8'hba) * (7'h44)) : {(7'h41), (8'hae)}) ? (((7'h43) + (8'hb8)) * (&(8'hab))) : ({(8'ha4)} ? ((8'hb0) ? (8'ha6) : (8'hb0)) : ((8'hb9) ? (8'hbf) : (8'hb1)))))))
(y, clk, wire105, wire104, wire103, wire102, wire101);
  output wire [(32'h69):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire105;
  input wire [(5'h15):(1'h0)] wire104;
  input wire signed [(4'hf):(1'h0)] wire103;
  input wire signed [(5'h10):(1'h0)] wire102;
  input wire [(4'hd):(1'h0)] wire101;
  wire [(4'hc):(1'h0)] wire111;
  wire signed [(5'h15):(1'h0)] wire110;
  wire [(5'h13):(1'h0)] wire109;
  wire [(5'h11):(1'h0)] wire108;
  wire [(4'hf):(1'h0)] wire107;
  wire [(5'h14):(1'h0)] wire106;
  assign y = {wire111, wire110, wire109, wire108, wire107, wire106, (1'h0)};
  assign wire106 = (8'hbb);
  assign wire107 = (^$unsigned(wire104));
  assign wire108 = (((~&wire106[(5'h14):(2'h3)]) - ($unsigned(wire107) & {wire105})) << $unsigned(wire105));
  assign wire109 = (|$signed($unsigned(((wire101 * wire104) ?
                       $unsigned(wire108) : wire105))));
  assign wire110 = wire108;
  assign wire111 = wire110;
endmodule
