module top
#(parameter param140 = ((8'hb6) ? (+(+(((8'h9f) && (8'hbe)) ^~ (~&(8'hae))))) : (({(~^(8'ha8)), ((8'hb6) ? (7'h43) : (8'hbc))} ? ((&(8'hbd)) ? ((7'h42) && (8'ha3)) : (^~(8'hbb))) : {((8'hae) ? (8'ha0) : (7'h42)), ((8'h9c) ? (7'h42) : (8'h9e))}) & (-(~|((8'hb8) * (8'hbf)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h26d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire0;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire3;
  wire [(4'hb):(1'h0)] wire139;
  wire signed [(4'hf):(1'h0)] wire53;
  wire signed [(2'h2):(1'h0)] wire55;
  wire [(4'he):(1'h0)] wire56;
  wire signed [(5'h11):(1'h0)] wire57;
  wire signed [(4'h8):(1'h0)] wire58;
  wire signed [(3'h4):(1'h0)] wire79;
  wire signed [(3'h6):(1'h0)] wire80;
  wire signed [(4'hf):(1'h0)] wire81;
  wire [(4'hc):(1'h0)] wire82;
  wire [(4'he):(1'h0)] wire83;
  wire signed [(4'he):(1'h0)] wire103;
  wire [(4'hc):(1'h0)] wire137;
  reg signed [(4'he):(1'h0)] reg102 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg101 = (1'h0);
  reg [(4'h8):(1'h0)] reg100 = (1'h0);
  reg [(5'h15):(1'h0)] reg99 = (1'h0);
  reg [(5'h14):(1'h0)] reg98 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg97 = (1'h0);
  reg [(5'h13):(1'h0)] reg96 = (1'h0);
  reg [(4'hb):(1'h0)] reg95 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg94 = (1'h0);
  reg [(5'h13):(1'h0)] reg93 = (1'h0);
  reg [(3'h5):(1'h0)] reg92 = (1'h0);
  reg [(4'ha):(1'h0)] reg91 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg90 = (1'h0);
  reg [(5'h14):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg88 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg86 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg85 = (1'h0);
  reg [(4'h8):(1'h0)] reg84 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg78 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg77 = (1'h0);
  reg [(4'hd):(1'h0)] reg76 = (1'h0);
  reg [(2'h2):(1'h0)] reg75 = (1'h0);
  reg [(4'h8):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg73 = (1'h0);
  reg [(3'h5):(1'h0)] reg72 = (1'h0);
  reg [(4'hb):(1'h0)] reg71 = (1'h0);
  reg [(3'h6):(1'h0)] reg70 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg69 = (1'h0);
  reg [(5'h14):(1'h0)] reg68 = (1'h0);
  reg signed [(4'he):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg66 = (1'h0);
  reg [(5'h14):(1'h0)] reg65 = (1'h0);
  reg [(4'hb):(1'h0)] reg64 = (1'h0);
  reg [(5'h11):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg59 = (1'h0);
  assign y = {wire139,
                 wire53,
                 wire55,
                 wire56,
                 wire57,
                 wire58,
                 wire79,
                 wire80,
                 wire81,
                 wire82,
                 wire83,
                 wire103,
                 wire137,
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
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 (1'h0)};
  module4 #() modinst54 (wire53, clk, wire3, wire2, wire1, wire0, (8'hbf));
  assign wire55 = wire2[(4'hb):(3'h5)];
  assign wire56 = (-wire55[(1'h1):(1'h1)]);
  assign wire57 = ($unsigned(wire2[(3'h6):(3'h4)]) ?
                      ((^(~&wire53)) << $unsigned(wire56[(4'hd):(1'h0)])) : (~^(^(wire2[(4'ha):(4'h8)] ^ {wire55}))));
  assign wire58 = ({(^~$unsigned(wire0[(4'he):(3'h5)]))} ?
                      (~&$signed((^~wire1[(4'hb):(2'h2)]))) : (8'h9f));
  always
    @(posedge clk) begin
      if (wire2)
        begin
          if ($signed(wire53[(1'h1):(1'h1)]))
            begin
              reg59 <= $unsigned(wire55[(2'h2):(2'h2)]);
              reg60 <= wire58;
              reg61 <= (^$unsigned($signed((+(wire57 ? (8'hb5) : reg60)))));
              reg62 <= (8'hbb);
              reg63 <= (8'ha6);
            end
          else
            begin
              reg59 <= wire1[(3'h5):(2'h2)];
              reg60 <= wire53[(2'h2):(1'h0)];
              reg61 <= $unsigned(reg63[(4'ha):(2'h2)]);
            end
          reg64 <= (~&wire56[(4'he):(3'h6)]);
          reg65 <= reg61[(5'h14):(5'h11)];
          reg66 <= $unsigned(reg62);
          reg67 <= {($unsigned($unsigned(wire2)) | (~|((!wire55) ?
                  $unsigned(wire55) : (wire53 ? wire58 : wire3)))),
              ((+($unsigned(wire56) ?
                  (reg63 ~^ reg66) : $signed((8'ha7)))) >> $signed(reg65))};
        end
      else
        begin
          reg59 <= reg62[(4'hf):(4'he)];
          if ((!(({$unsigned(wire56), (wire55 ? wire1 : reg61)} ?
                  wire2[(5'h12):(4'h8)] : {{wire56, reg60}}) ?
              reg60[(4'he):(2'h3)] : $unsigned($unsigned($signed(wire57))))))
            begin
              reg60 <= wire53[(1'h1):(1'h1)];
              reg61 <= reg62;
            end
          else
            begin
              reg60 <= ($unsigned({reg67[(4'h9):(2'h3)]}) ?
                  ($unsigned(reg64) ?
                      ((~&(~wire2)) ?
                          ((reg63 >> wire0) ?
                              (reg65 == wire56) : (reg67 ?
                                  wire3 : (8'haf))) : ($unsigned(wire56) ^~ {(8'ha4),
                              wire3})) : reg62[(1'h1):(1'h0)]) : (~((^~wire55[(2'h2):(1'h0)]) ?
                      ($signed(wire58) ?
                          ((8'haa) ?
                              (8'hb4) : wire1) : (&reg67)) : reg64[(4'h8):(4'h8)])));
              reg61 <= reg59;
              reg62 <= reg64;
            end
          reg63 <= ($unsigned({reg59}) <= $signed($unsigned((wire2[(1'h1):(1'h0)] | $signed(wire0)))));
          reg64 <= ((-(~^wire56)) ^ wire53[(4'h8):(3'h4)]);
          reg65 <= reg60;
        end
      if ((~&$unsigned((reg66 ? {(~|(8'ha7)), (+reg59)} : wire2))))
        begin
          if (((reg63 <<< wire53) > (wire3[(4'ha):(2'h3)] & (8'ha7))))
            begin
              reg68 <= (&wire58);
              reg69 <= wire0[(4'h9):(3'h6)];
              reg70 <= $signed((wire0 || $signed($signed(reg62[(4'h9):(2'h2)]))));
              reg71 <= wire56;
            end
          else
            begin
              reg68 <= ($signed((^{$unsigned(reg67),
                  ((8'hb9) ?
                      wire0 : (8'h9f))})) << (&(reg59[(4'h9):(1'h1)] >= $unsigned((reg64 ?
                  wire55 : (8'had))))));
              reg69 <= ((8'ha9) ?
                  reg66 : ((reg61[(2'h3):(2'h3)] << (~reg67[(1'h1):(1'h0)])) >= $signed((wire1[(2'h3):(1'h1)] ?
                      (+wire0) : ((8'ha1) ? wire1 : wire55)))));
              reg70 <= $signed(wire2[(4'h9):(1'h0)]);
              reg71 <= ($signed($signed(wire53[(3'h5):(2'h3)])) > ($signed((8'ha9)) ?
                  ((8'ha3) ?
                      $unsigned(wire3[(1'h1):(1'h1)]) : wire53[(1'h0):(1'h0)]) : ($signed((reg66 ?
                          reg60 : wire57)) ?
                      {reg70, (reg67 > wire1)} : (^reg69[(3'h4):(1'h0)]))));
            end
          reg72 <= $signed((8'hb8));
          reg73 <= wire1[(3'h5):(3'h4)];
        end
      else
        begin
          if ($unsigned((^(($unsigned((8'hb6)) ?
                  (reg71 ? reg71 : reg71) : {reg68, (8'h9d)}) ?
              ($signed(reg67) ?
                  (7'h41) : wire53[(3'h6):(1'h0)]) : $signed(wire57)))))
            begin
              reg68 <= (~((|($signed(reg71) ?
                      {(8'hb3), wire3} : (reg69 ? reg66 : reg67))) ?
                  $unsigned((reg71[(4'h9):(1'h1)] <<< reg66)) : (^~reg69[(3'h5):(1'h1)])));
              reg69 <= $signed(((^~wire58[(2'h3):(2'h3)]) >= $signed(wire0)));
              reg70 <= {(^~(8'ha0))};
              reg71 <= (+reg66);
            end
          else
            begin
              reg68 <= {$signed(((^(reg62 ? reg72 : wire2)) ?
                      $unsigned(reg72) : (reg73 ^~ ((8'h9f) <= wire0)))),
                  reg72[(2'h3):(2'h2)]};
              reg69 <= wire53[(4'hb):(3'h4)];
              reg70 <= (8'hab);
              reg71 <= (($unsigned(wire56[(3'h6):(2'h2)]) - $signed(((8'ha6) >= wire0))) ?
                  $unsigned((((|wire0) == $unsigned(reg67)) ?
                      $signed($signed((8'hb4))) : {$unsigned(wire57)})) : wire3[(3'h7):(3'h6)]);
              reg72 <= wire56;
            end
          reg73 <= wire2[(1'h1):(1'h1)];
          if (wire0[(3'h6):(3'h4)])
            begin
              reg74 <= wire57;
              reg75 <= (~^$unsigned((((wire1 != wire56) ?
                      (!wire0) : (reg64 & wire53)) ?
                  ($unsigned(wire57) >= (|reg67)) : {((8'hb7) ? reg65 : reg74),
                      $signed((8'hb5))})));
            end
          else
            begin
              reg74 <= {(^wire57)};
              reg75 <= reg66[(2'h2):(1'h0)];
            end
          reg76 <= {wire58};
          reg77 <= (reg73 ?
              $signed($signed($unsigned((7'h44)))) : wire2[(4'h9):(4'h9)]);
        end
      reg78 <= {(~wire1[(3'h7):(3'h6)])};
    end
  assign wire79 = ((reg78[(1'h1):(1'h0)] ?
                      (reg77[(4'h8):(3'h7)] ?
                          ((~^reg64) ?
                              (|reg67) : $signed(reg65)) : {$signed(wire0),
                              wire1}) : (~|(reg64 ?
                          reg66[(2'h3):(1'h1)] : reg73))) == (((^$signed(reg77)) & $unsigned($signed(wire57))) ?
                      $unsigned($unsigned(((7'h43) == reg70))) : $unsigned(($signed(reg71) - {(8'hbc)}))));
  assign wire80 = $unsigned({$signed((reg69[(3'h7):(3'h5)] != (reg70 ?
                          reg70 : reg70)))});
  assign wire81 = reg71;
  assign wire82 = (!(&$signed(reg72[(3'h4):(3'h4)])));
  assign wire83 = $signed((~|reg74));
  always
    @(posedge clk) begin
      reg84 <= (reg61 ?
          $unsigned((((reg60 ? reg59 : reg72) + wire81[(3'h5):(2'h3)]) ?
              reg69 : ((^reg67) ^ $unsigned(reg73)))) : ((!$signed((reg75 ?
              reg64 : wire82))) && {wire80, (!(reg77 * reg67))}));
      reg85 <= $signed(reg61);
      if ((7'h41))
        begin
          reg86 <= ($signed($unsigned((-(8'hbc)))) >= ($unsigned($signed((^wire57))) > ((^~(reg66 ?
              wire0 : reg61)) <<< (~reg66))));
          reg87 <= (^(((8'h9c) ? wire0 : wire3[(4'hd):(1'h1)]) ?
              wire55 : (~^wire56[(3'h4):(1'h1)])));
          if (wire55)
            begin
              reg88 <= reg63;
            end
          else
            begin
              reg88 <= wire56;
              reg89 <= $unsigned((^$unsigned({(reg66 <<< (7'h43))})));
              reg90 <= reg71[(3'h6):(1'h1)];
              reg91 <= (~^reg70);
              reg92 <= $signed($unsigned({{(reg78 ? reg88 : reg72),
                      $unsigned(reg63)},
                  {{reg88, reg66}}}));
            end
        end
      else
        begin
          reg86 <= reg65[(4'h9):(4'h9)];
          reg87 <= reg85;
          reg88 <= ({{({reg63, reg91} ? $signed(wire83) : $signed(reg87)),
                  reg89},
              reg75[(2'h2):(1'h1)]} && ($unsigned((|(reg89 ?
                  (8'hb1) : wire53))) ?
              $signed((+(~&wire79))) : ($signed($unsigned(wire81)) ?
                  $unsigned((reg67 <<< wire56)) : (~(reg67 ^~ reg65)))));
          reg89 <= $unsigned($signed(reg86[(4'h8):(3'h7)]));
          reg90 <= wire0;
        end
      if (reg61)
        begin
          if (reg86[(3'h5):(2'h3)])
            begin
              reg93 <= wire58;
              reg94 <= (($unsigned($unsigned(wire0)) ?
                  wire83 : {(((8'h9f) ? reg93 : (8'hbf)) ?
                          (reg71 ? reg76 : wire57) : $unsigned(reg75)),
                      (8'hb2)}) << reg73[(4'h8):(2'h2)]);
            end
          else
            begin
              reg93 <= (wire81 - $unsigned((reg88 << reg91[(2'h2):(2'h2)])));
              reg94 <= ($unsigned($unsigned($unsigned((8'haf)))) ~^ reg74[(2'h2):(2'h2)]);
              reg95 <= wire81;
              reg96 <= (reg68[(5'h11):(5'h11)] >= reg88[(3'h7):(2'h2)]);
            end
          if (({((7'h43) << reg84[(1'h0):(1'h0)])} ?
              $unsigned(reg75) : {reg65[(3'h6):(2'h3)],
                  ($unsigned((reg66 * reg86)) * reg67[(1'h0):(1'h0)])}))
            begin
              reg97 <= reg74;
              reg98 <= reg71[(1'h1):(1'h0)];
            end
          else
            begin
              reg97 <= (8'hbb);
              reg98 <= $unsigned((-reg95));
              reg99 <= reg87[(1'h0):(1'h0)];
              reg100 <= (((!(reg60[(3'h6):(1'h0)] >= $signed(reg95))) ?
                      ({$signed(reg97), (8'h9e)} >>> {$unsigned(reg65),
                          (-(8'ha5))}) : (8'h9d)) ?
                  reg62 : (reg98 << ($unsigned($unsigned(reg73)) ?
                      ((~reg89) ? (reg68 >>> (8'haf)) : reg67) : wire56)));
              reg101 <= wire3;
            end
        end
      else
        begin
          reg93 <= reg62[(3'h4):(1'h1)];
          reg94 <= ((^~(~|(~|reg89))) - (8'haa));
          reg95 <= reg73[(4'hc):(2'h2)];
          reg96 <= reg75[(1'h0):(1'h0)];
        end
      reg102 <= $signed(({$signed($signed((8'hb5)))} == reg88));
    end
  assign wire103 = $unsigned({(($unsigned(reg89) != (reg61 << wire81)) && $unsigned((-(7'h42))))});
  module104 #() modinst138 (wire137, clk, reg97, reg101, reg65, reg61, wire103);
  assign wire139 = ($signed((reg88 <= ((^reg99) ?
                           (wire58 ? reg65 : reg74) : $signed(reg90)))) ?
                       $signed($signed(reg84[(3'h4):(3'h4)])) : $unsigned(reg100[(3'h7):(3'h5)]));
endmodule

module module104  (y, clk, wire109, wire108, wire107, wire106, wire105);
  output wire [(32'h5f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire109;
  input wire [(4'ha):(1'h0)] wire108;
  input wire signed [(5'h14):(1'h0)] wire107;
  input wire [(4'hb):(1'h0)] wire106;
  input wire signed [(4'he):(1'h0)] wire105;
  wire signed [(3'h4):(1'h0)] wire136;
  wire [(2'h3):(1'h0)] wire135;
  wire [(4'hf):(1'h0)] wire134;
  wire [(5'h11):(1'h0)] wire133;
  wire [(5'h14):(1'h0)] wire131;
  wire [(3'h7):(1'h0)] wire110;
  reg [(4'h9):(1'h0)] reg111 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg112 = (1'h0);
  assign y = {wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire131,
                 wire110,
                 reg111,
                 reg112,
                 (1'h0)};
  assign wire110 = {($unsigned(wire108) ?
                           {(-(wire106 ?
                                   wire107 : wire109))} : (~($unsigned(wire109) > (&(8'ha9)))))};
  always
    @(posedge clk) begin
      reg111 <= wire107;
      reg112 <= wire110;
    end
  module113 #() modinst132 (.wire115(wire110), .wire117(wire105), .wire118(wire108), .y(wire131), .wire114(wire107), .clk(clk), .wire116(reg112));
  assign wire133 = {(+(8'ha3)),
                       ({(wire110 ? (^~wire131) : (~^wire110))} ?
                           $unsigned((8'hae)) : ({wire105, $signed(wire106)} ?
                               $unsigned(wire131[(5'h12):(3'h5)]) : wire108))};
  assign wire134 = (wire106[(4'h9):(3'h7)] >= $unsigned($unsigned(wire110)));
  assign wire135 = $unsigned(wire107[(4'h9):(2'h3)]);
  assign wire136 = {($signed(($unsigned(reg111) ?
                               (wire110 != (8'h9d)) : $unsigned(wire135))) ?
                           {$signed($signed(wire107))} : $unsigned(wire107)),
                       (~|(+$unsigned(wire134[(4'hf):(2'h3)])))};
endmodule

module module4
#(parameter param51 = (&(^~(((!(7'h43)) ? ((8'haa) >>> (8'ha8)) : ((8'hb8) ? (8'hb3) : (8'hbc))) && (((8'hbb) | (8'had)) ? {(8'h9e), (8'h9d)} : ((8'hbe) | (8'hb3)))))), 
parameter param52 = param51)
(y, clk, wire5, wire6, wire7, wire8, wire9);
  output wire [(32'ha0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire5;
  input wire [(5'h12):(1'h0)] wire6;
  input wire signed [(4'he):(1'h0)] wire7;
  input wire [(4'h8):(1'h0)] wire8;
  input wire signed [(5'h13):(1'h0)] wire9;
  wire signed [(4'hf):(1'h0)] wire45;
  wire [(4'h9):(1'h0)] wire44;
  wire [(5'h15):(1'h0)] wire43;
  wire [(5'h10):(1'h0)] wire42;
  wire [(2'h2):(1'h0)] wire41;
  wire [(3'h4):(1'h0)] wire40;
  wire [(5'h14):(1'h0)] wire38;
  reg [(5'h13):(1'h0)] reg50 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg49 = (1'h0);
  reg [(5'h13):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg46 = (1'h0);
  assign y = {wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire38,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 (1'h0)};
  module10 #() modinst39 (wire38, clk, wire6, wire8, wire5, wire7, wire9);
  assign wire40 = (wire6 + wire38[(4'he):(1'h0)]);
  assign wire41 = ({wire9[(3'h5):(3'h4)],
                      $signed((wire5 <<< wire38[(3'h6):(3'h4)]))} ~^ wire6);
  assign wire42 = $signed($signed($signed((&wire5))));
  assign wire43 = wire9[(1'h0):(1'h0)];
  assign wire44 = (~|(wire41 ?
                      (wire42[(5'h10):(3'h5)] - $unsigned((wire38 ?
                          (7'h42) : wire41))) : (wire43[(4'hf):(4'hc)] ?
                          wire8[(4'h8):(1'h1)] : (wire40[(1'h1):(1'h1)] ?
                              wire41 : wire5[(2'h2):(1'h1)]))));
  assign wire45 = {(wire43 ^~ $unsigned($signed($unsigned(wire5)))),
                      (((8'hb1) ?
                              $signed($signed(wire9)) : (^~(wire8 - wire40))) ?
                          ($signed(wire8[(2'h2):(1'h1)]) + wire7) : wire44)};
  always
    @(posedge clk) begin
      reg46 <= $unsigned(($signed($signed($signed(wire9))) ?
          ({(~&wire43)} ~^ wire8[(1'h1):(1'h1)]) : wire42));
      reg47 <= $signed({wire42[(3'h7):(1'h1)]});
      reg48 <= (~|((+$unsigned($unsigned(wire5))) ?
          $unsigned((8'ha5)) : (~wire45[(4'h9):(3'h6)])));
      reg49 <= $unsigned((reg48[(5'h12):(4'hd)] ?
          wire9 : $unsigned((!wire40[(1'h0):(1'h0)]))));
      reg50 <= {reg46};
    end
endmodule

module module10  (y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'h11f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire15;
  input wire [(4'h8):(1'h0)] wire14;
  input wire signed [(4'he):(1'h0)] wire13;
  input wire signed [(4'he):(1'h0)] wire12;
  input wire signed [(5'h13):(1'h0)] wire11;
  wire signed [(5'h15):(1'h0)] wire34;
  wire [(4'he):(1'h0)] wire33;
  wire [(4'hb):(1'h0)] wire32;
  wire [(5'h14):(1'h0)] wire31;
  wire signed [(5'h13):(1'h0)] wire30;
  wire [(2'h2):(1'h0)] wire29;
  wire [(4'hf):(1'h0)] wire28;
  wire [(5'h13):(1'h0)] wire27;
  wire signed [(4'hc):(1'h0)] wire26;
  wire signed [(4'hf):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire16;
  reg [(4'hd):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg36 = (1'h0);
  reg [(3'h5):(1'h0)] reg35 = (1'h0);
  reg [(2'h2):(1'h0)] reg25 = (1'h0);
  reg [(5'h14):(1'h0)] reg24 = (1'h0);
  reg [(4'h9):(1'h0)] reg23 = (1'h0);
  reg [(4'he):(1'h0)] reg22 = (1'h0);
  reg [(4'hd):(1'h0)] reg21 = (1'h0);
  reg [(3'h5):(1'h0)] reg20 = (1'h0);
  reg signed [(4'he):(1'h0)] reg19 = (1'h0);
  reg [(5'h10):(1'h0)] reg18 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire17,
                 wire16,
                 reg37,
                 reg36,
                 reg35,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 (1'h0)};
  assign wire16 = wire15;
  assign wire17 = {(($signed($signed(wire16)) > ($signed(wire12) >> wire13)) || {wire13})};
  always
    @(posedge clk) begin
      if ($unsigned(wire13))
        begin
          reg18 <= $unsigned(wire11[(4'ha):(4'ha)]);
        end
      else
        begin
          reg18 <= $unsigned(wire15);
          reg19 <= (+wire17[(4'ha):(4'h9)]);
          if ($unsigned(reg19[(3'h6):(3'h6)]))
            begin
              reg20 <= ((wire15 ?
                      (&((&wire14) ?
                          ((8'h9f) ^~ wire15) : $unsigned((7'h41)))) : (+(reg18 ~^ $signed(wire16)))) ?
                  $signed(wire12[(3'h4):(3'h4)]) : $signed(wire17));
              reg21 <= ($signed($signed($signed($unsigned((8'ha0))))) ?
                  (($unsigned((reg18 && wire15)) && $signed($signed(wire13))) ?
                      wire17[(4'h8):(3'h6)] : ({{wire13, (7'h42)}} ?
                          wire14 : $unsigned(wire14))) : $signed($signed((wire12 != reg20))));
              reg22 <= (&$unsigned(($signed(reg21) ?
                  (~^((8'ha3) >>> wire13)) : wire16)));
            end
          else
            begin
              reg20 <= (((($signed(wire15) ?
                              (wire13 & wire13) : $signed(reg19)) ?
                          $signed({reg21, reg22}) : wire13) ?
                      $unsigned(reg19[(3'h4):(2'h2)]) : ((|reg19) && ((^~wire12) ?
                          (-wire15) : reg21[(3'h6):(3'h4)]))) ?
                  (8'hba) : reg22[(4'ha):(3'h4)]);
              reg21 <= $signed((((wire15 ? reg22 : $signed((7'h41))) ?
                  wire13 : wire13[(4'hb):(1'h0)]) ~^ wire17[(2'h2):(2'h2)]));
            end
          if (reg21[(3'h5):(2'h3)])
            begin
              reg23 <= (({reg18} ?
                  wire15[(3'h6):(2'h3)] : ((^~(wire13 ? wire12 : wire13)) ?
                      (^$signed((8'hb2))) : (~&reg18))) <<< wire15);
            end
          else
            begin
              reg23 <= (^$unsigned($signed($unsigned((!reg19)))));
              reg24 <= wire16;
            end
        end
      reg25 <= wire16;
    end
  assign wire26 = ((~|wire17[(4'hb):(3'h5)]) ?
                      $unsigned((((reg20 * (8'h9c)) <<< (reg22 >>> reg23)) * ((reg21 > reg25) ?
                          $signed(reg20) : (~|(8'hac))))) : wire14);
  assign wire27 = $unsigned((~^$unsigned((!(reg24 & (7'h43))))));
  assign wire28 = wire13[(2'h3):(2'h2)];
  assign wire29 = (({{$signed(wire28),
                          (reg24 < (8'ha5))}} != {($signed(wire17) ?
                          $unsigned(reg22) : $unsigned((8'h9d)))}) != $unsigned(wire14));
  assign wire30 = $unsigned(wire26);
  assign wire31 = $unsigned(($unsigned(((wire28 ? reg18 : reg24) ?
                          (^reg22) : ((8'ha5) ? wire16 : reg25))) ?
                      wire13 : ($unsigned((~^wire14)) ?
                          $unsigned(reg24) : $unsigned((~^reg20)))));
  assign wire32 = $unsigned(wire27[(4'hc):(4'h8)]);
  assign wire33 = (+(-(wire12 ?
                      $unsigned($signed(reg23)) : $unsigned((wire13 ?
                          wire31 : wire26)))));
  assign wire34 = wire17[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      reg35 <= $signed(wire28);
      reg36 <= {(~&$unsigned(reg25[(1'h0):(1'h0)])), wire12[(4'h9):(3'h4)]};
      reg37 <= wire12[(4'hc):(4'h9)];
    end
endmodule

module module113  (y, clk, wire118, wire117, wire116, wire115, wire114);
  output wire [(32'h94):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire118;
  input wire [(4'he):(1'h0)] wire117;
  input wire [(4'hd):(1'h0)] wire116;
  input wire signed [(2'h3):(1'h0)] wire115;
  input wire signed [(5'h14):(1'h0)] wire114;
  wire signed [(4'hf):(1'h0)] wire122;
  wire signed [(4'he):(1'h0)] wire121;
  wire signed [(5'h14):(1'h0)] wire120;
  wire [(5'h11):(1'h0)] wire119;
  reg signed [(2'h2):(1'h0)] reg130 = (1'h0);
  reg [(4'hc):(1'h0)] reg129 = (1'h0);
  reg [(4'h8):(1'h0)] reg128 = (1'h0);
  reg [(5'h13):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg126 = (1'h0);
  reg [(3'h6):(1'h0)] reg125 = (1'h0);
  reg [(4'ha):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg123 = (1'h0);
  assign y = {wire122,
                 wire121,
                 wire120,
                 wire119,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 (1'h0)};
  assign wire119 = (^((~{((8'hab) ? wire114 : wire116), wire116}) ?
                       $signed($unsigned($signed(wire117))) : $unsigned($unsigned((~wire116)))));
  assign wire120 = $unsigned({(^($unsigned((8'hbb)) ? (^~wire115) : wire117)),
                       wire119});
  assign wire121 = $unsigned((wire117 ?
                       (8'haa) : ($unsigned(wire119[(4'hd):(4'hc)]) * $signed({(7'h44),
                           (8'hbc)}))));
  assign wire122 = wire119;
  always
    @(posedge clk) begin
      reg123 <= (-wire118[(3'h4):(2'h3)]);
      if (wire117)
        begin
          reg124 <= (8'hba);
          reg125 <= (~^$unsigned((~^$unsigned(((8'hb9) >= wire114)))));
          reg126 <= wire122[(4'ha):(4'ha)];
        end
      else
        begin
          reg124 <= ((($unsigned(reg123) << wire118[(3'h5):(1'h1)]) ?
                  $unsigned((^~$signed(wire122))) : $unsigned((^~(|wire119)))) ?
              wire121 : wire118);
          reg125 <= $unsigned($signed($signed(wire119)));
          if (wire115)
            begin
              reg126 <= reg125[(2'h2):(1'h0)];
              reg127 <= $signed((^wire121[(2'h2):(2'h2)]));
            end
          else
            begin
              reg126 <= $signed(reg123);
              reg127 <= {$unsigned($unsigned((&$unsigned((7'h43))))), wire115};
              reg128 <= (wire115 ?
                  {((wire119 || ((8'hbc) + wire117)) - (~(reg124 <<< wire116))),
                      ($signed((7'h42)) ?
                          (~^reg123) : (^~wire115))} : reg127[(4'h9):(1'h0)]);
            end
          if (((8'h9f) >= (~^wire122[(2'h2):(1'h1)])))
            begin
              reg129 <= wire120;
            end
          else
            begin
              reg129 <= $unsigned(reg126);
            end
          reg130 <= wire115;
        end
    end
endmodule
