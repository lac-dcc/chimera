module top
#(parameter param142 = ((((-{(8'haf), (8'hbf)}) ? {(+(8'ha6)), ((8'ha2) ? (8'hac) : (8'ha0))} : (~{(8'had)})) | (({(8'hb5), (8'hb2)} ^~ ((8'hbf) | (8'ha5))) ? ((-(8'hae)) < ((8'ha9) ? (8'ha3) : (8'ha0))) : ((^~(8'ha4)) & ((8'ha2) ? (8'hbc) : (8'hb1))))) || (((((7'h40) ? (8'hb0) : (8'hb7)) == (&(7'h43))) >> ((^~(8'hb1)) <= ((8'ha2) ? (8'haf) : (8'h9d)))) ^ ({((8'hbd) ^~ (8'h9e)), {(8'h9e)}} ^~ (~&((8'hb4) ? (8'hbc) : (8'ha2)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h18d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire141;
  wire [(5'h10):(1'h0)] wire137;
  wire [(2'h2):(1'h0)] wire53;
  wire signed [(4'he):(1'h0)] wire52;
  wire [(3'h4):(1'h0)] wire43;
  wire signed [(4'h8):(1'h0)] wire42;
  wire signed [(5'h10):(1'h0)] wire41;
  wire signed [(3'h4):(1'h0)] wire39;
  wire [(5'h15):(1'h0)] wire17;
  wire signed [(5'h12):(1'h0)] wire16;
  wire signed [(5'h13):(1'h0)] wire15;
  wire signed [(5'h15):(1'h0)] wire14;
  wire [(4'hb):(1'h0)] wire13;
  wire [(4'hf):(1'h0)] wire12;
  wire [(4'he):(1'h0)] wire11;
  wire signed [(4'hc):(1'h0)] wire10;
  reg signed [(2'h3):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg139 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg50 = (1'h0);
  reg [(3'h4):(1'h0)] reg49 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg47 = (1'h0);
  reg [(3'h7):(1'h0)] reg46 = (1'h0);
  reg [(5'h11):(1'h0)] reg45 = (1'h0);
  reg [(3'h7):(1'h0)] reg44 = (1'h0);
  reg [(4'ha):(1'h0)] reg9 = (1'h0);
  reg [(4'he):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg6 = (1'h0);
  reg [(2'h2):(1'h0)] reg5 = (1'h0);
  reg [(5'h14):(1'h0)] reg4 = (1'h0);
  assign y = {wire141,
                 wire137,
                 wire53,
                 wire52,
                 wire43,
                 wire42,
                 wire41,
                 wire39,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 reg140,
                 reg139,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire3)
        begin
          reg4 <= (|wire3);
          reg5 <= wire0[(3'h6):(1'h0)];
          reg6 <= ($unsigned((8'ha2)) >>> ({(wire0 ?
                      {reg5, wire2} : $signed(wire2)),
                  reg4[(5'h10):(2'h3)]} ?
              $signed(reg4[(1'h1):(1'h1)]) : (~|({reg4} ?
                  (+(8'hb4)) : (|wire1)))));
          reg7 <= $signed(($signed((^~wire3[(2'h2):(2'h2)])) ~^ (($unsigned(wire2) ?
                  (wire1 ? wire0 : wire1) : {reg6}) ?
              reg5 : reg6[(3'h6):(1'h0)])));
        end
      else
        begin
          reg4 <= (+wire1);
        end
      reg8 <= $unsigned($unsigned($signed(wire0[(4'hd):(4'ha)])));
    end
  always
    @(posedge clk) begin
      reg9 <= reg8[(2'h3):(2'h3)];
    end
  assign wire10 = ((8'hab) ?
                      ($unsigned((~&$signed(reg4))) ?
                          ($signed(((8'h9e) ? (8'h9c) : wire1)) ?
                              $signed((+reg7)) : (wire0[(4'hc):(3'h4)] ?
                                  $unsigned(reg9) : (reg9 & reg7))) : (7'h44)) : (((8'haf) | reg4[(1'h1):(1'h1)]) ?
                          (&reg5) : ($unsigned(reg7[(3'h4):(2'h2)]) != wire2[(5'h11):(4'h8)])));
  assign wire11 = wire1;
  assign wire12 = (reg6[(3'h7):(3'h6)] ?
                      wire0 : ((^~wire2[(1'h1):(1'h0)]) <= reg8));
  assign wire13 = {($unsigned((-reg5)) << ($unsigned(wire10[(1'h1):(1'h0)]) - (!{wire2,
                          reg8})))};
  assign wire14 = $signed((reg8 ? $unsigned($signed(reg4)) : $signed(wire13)));
  assign wire15 = ((8'h9d) - $signed(wire11[(4'h9):(1'h1)]));
  assign wire16 = {{(($unsigned(wire10) <<< wire10[(2'h3):(1'h0)]) ?
                              $signed($signed(wire2)) : wire10[(4'h9):(3'h4)])},
                      $signed($unsigned(((wire11 & reg9) >> (^~reg8))))};
  assign wire17 = $unsigned((|$signed(reg4)));
  module18 #() modinst40 (wire39, clk, wire14, wire17, reg7, reg6);
  assign wire41 = (+(^~(+$unsigned(reg4))));
  assign wire42 = {({wire1, (+wire41)} ?
                          reg6[(3'h7):(1'h1)] : $unsigned($signed($signed(wire17)))),
                      wire14[(4'he):(2'h2)]};
  assign wire43 = ((-$unsigned({(8'hbb)})) >>> ($signed({$unsigned((8'h9d)),
                      (!reg8)}) < {({wire11} ? $unsigned(wire10) : wire39),
                      (|$signed(wire17))}));
  always
    @(posedge clk) begin
      if ((~&(((wire39[(2'h3):(2'h3)] ?
          (^~wire3) : $unsigned(wire1)) * wire10[(4'h8):(1'h0)]) || wire14)))
        begin
          reg44 <= reg4;
          reg45 <= reg5;
          reg46 <= wire15;
          reg47 <= wire14;
        end
      else
        begin
          reg44 <= reg47[(4'hd):(1'h0)];
          reg45 <= $signed(wire43);
        end
      reg48 <= $unsigned($signed((7'h43)));
      reg49 <= ($signed(((~^((8'hbf) + wire10)) ?
              $signed($signed((8'ha2))) : {(8'hbd)})) ?
          {$signed(((wire17 + reg48) ?
                  (reg47 & reg9) : wire15))} : $signed(reg48));
      if (($unsigned(((8'hbe) ^~ {$signed(reg8)})) || (wire42[(3'h6):(3'h4)] ?
          $unsigned((&wire3[(4'h9):(4'h8)])) : $unsigned($signed(reg45)))))
        begin
          reg50 <= $unsigned((!$unsigned(reg49)));
          reg51 <= reg7[(4'ha):(2'h2)];
        end
      else
        begin
          reg50 <= $unsigned({(!$unsigned($signed(wire0)))});
          reg51 <= wire13[(2'h3):(2'h2)];
        end
    end
  assign wire52 = ({(~|$unsigned($unsigned(wire41))),
                      $unsigned($signed((wire15 ^~ reg8)))} > (~^wire42));
  assign wire53 = wire0;
  module54 #() modinst138 (wire137, clk, wire10, wire2, wire52, wire14);
  always
    @(posedge clk) begin
      reg139 <= $unsigned({(&$unsigned((reg5 ? wire39 : reg6)))});
      reg140 <= (^~(~$signed({$unsigned((8'h9e))})));
    end
  assign wire141 = reg46;
endmodule

module module54
#(parameter param136 = ({{(^~((8'hbc) > (8'ha6))), (-{(8'ha3)})}} ? (&((~&((8'ha0) ~^ (8'h9d))) ? (&((8'had) ? (8'hae) : (8'hb4))) : (|((7'h40) ^ (8'hab))))) : (({((8'ha7) ? (7'h41) : (8'h9d))} >>> (~&(8'h9c))) ? (^~((^(8'hbb)) <<< ((8'hbc) ? (8'hb2) : (8'ha2)))) : (({(8'ha8), (8'hb7)} >>> ((8'hba) ? (8'hbf) : (8'hb4))) >= (((8'hb5) ? (8'hb0) : (8'hb8)) & ((8'ha5) ? (8'ha1) : (8'ha7)))))))
(y, clk, wire58, wire57, wire56, wire55);
  output wire [(32'haf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire58;
  input wire signed [(5'h12):(1'h0)] wire57;
  input wire [(4'he):(1'h0)] wire56;
  input wire signed [(5'h15):(1'h0)] wire55;
  wire [(2'h3):(1'h0)] wire135;
  wire signed [(5'h15):(1'h0)] wire133;
  wire signed [(3'h5):(1'h0)] wire106;
  wire [(4'h8):(1'h0)] wire105;
  wire [(2'h2):(1'h0)] wire104;
  wire [(2'h3):(1'h0)] wire102;
  wire [(3'h6):(1'h0)] wire69;
  wire signed [(2'h2):(1'h0)] wire68;
  wire signed [(4'hb):(1'h0)] wire67;
  wire [(5'h15):(1'h0)] wire61;
  wire signed [(4'hc):(1'h0)] wire60;
  wire [(4'he):(1'h0)] wire59;
  reg [(4'h9):(1'h0)] reg66 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg65 = (1'h0);
  reg [(5'h14):(1'h0)] reg64 = (1'h0);
  reg [(5'h12):(1'h0)] reg63 = (1'h0);
  reg [(5'h10):(1'h0)] reg62 = (1'h0);
  assign y = {wire135,
                 wire133,
                 wire106,
                 wire105,
                 wire104,
                 wire102,
                 wire69,
                 wire68,
                 wire67,
                 wire61,
                 wire60,
                 wire59,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 (1'h0)};
  assign wire59 = {wire55,
                      (wire58[(4'hc):(4'h9)] ?
                          wire57[(5'h10):(4'hf)] : wire58[(4'h8):(3'h4)])};
  assign wire60 = (-$signed($unsigned($signed((wire55 > wire57)))));
  assign wire61 = {(($signed((wire58 <= wire56)) ?
                          (&(|wire55)) : $unsigned({(8'hac)})) == wire59)};
  always
    @(posedge clk) begin
      reg62 <= wire56[(4'h9):(2'h2)];
      reg63 <= $signed((~^(8'hbe)));
      reg64 <= {((^($unsigned((8'ha9)) > (wire59 != (8'ha9)))) <<< ((|(!wire57)) ?
              wire61 : {$signed(wire56), $signed(wire56)}))};
      reg65 <= wire61;
      reg66 <= $unsigned((8'hb4));
    end
  assign wire67 = (-$unsigned((+((reg62 ? reg65 : reg63) + wire59))));
  assign wire68 = ($unsigned(wire61[(5'h13):(4'hd)]) <= (~|reg63));
  assign wire69 = $unsigned((~&(8'hbe)));
  module70 #() modinst103 (.y(wire102), .wire74(reg63), .clk(clk), .wire71(wire67), .wire72(reg62), .wire73(wire59));
  assign wire104 = $signed(({((reg65 >>> wire58) ? wire60 : $unsigned(wire68)),
                       $signed((-(8'h9f)))} > (8'hb1)));
  assign wire105 = (~$unsigned((((|reg63) ^ $unsigned(wire69)) ?
                       $signed($signed(reg64)) : (!(&reg63)))));
  assign wire106 = (^($unsigned($unsigned(wire57[(4'hf):(3'h7)])) <<< (&(|reg64[(4'ha):(1'h0)]))));
  module107 #() modinst134 (wire133, clk, wire55, wire58, reg66, reg64);
  assign wire135 = (~&{($unsigned((|wire61)) <<< reg64),
                       ($signed((wire68 ? wire106 : (8'hb1))) ?
                           wire60 : reg64[(4'hb):(2'h3)])});
endmodule

module module18  (y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'h42):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire22;
  input wire [(5'h15):(1'h0)] wire21;
  input wire [(4'hc):(1'h0)] wire20;
  input wire [(5'h11):(1'h0)] wire19;
  wire [(5'h15):(1'h0)] wire38;
  wire [(4'ha):(1'h0)] wire37;
  wire [(5'h15):(1'h0)] wire36;
  wire [(4'hd):(1'h0)] wire34;
  assign y = {wire38, wire37, wire36, wire34, (1'h0)};
  module23 #() modinst35 (wire34, clk, wire19, wire22, wire20, wire21);
  assign wire36 = ($unsigned(wire20[(2'h2):(2'h2)]) ?
                      ((wire20 ?
                          {wire21, (|wire20)} : ($signed(wire34) ?
                              (wire19 > (8'hbb)) : $signed((8'h9d)))) ^ wire21) : wire22[(2'h3):(2'h2)]);
  assign wire37 = $signed($signed($signed({wire21[(1'h0):(1'h0)],
                      wire20[(4'ha):(3'h7)]})));
  assign wire38 = wire34;
endmodule

module module23
#(parameter param32 = ((&(~|{((8'haa) != (8'ha2)), (~^(8'had))})) ? (~((~|(~^(8'hb4))) ? (((8'ha9) ? (8'ha9) : (8'hb4)) ? ((8'haf) * (8'hae)) : ((8'h9e) * (8'ha8))) : (((8'hba) ? (8'hbb) : (8'hab)) ? ((8'hbf) ? (8'hbd) : (8'hac)) : {(8'hba), (8'ha0)}))) : (~&(((-(8'haa)) ? ((8'hba) >= (8'ha0)) : ((8'hbc) - (8'h9d))) & ((8'hae) ? ((8'ha8) != (7'h40)) : ((8'ha2) ? (8'h9d) : (8'ha6)))))), 
parameter param33 = (!{{param32, ((param32 & param32) != (param32 + param32))}, (~|{param32})}))
(y, clk, wire27, wire26, wire25, wire24);
  output wire [(32'h36):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire27;
  input wire signed [(2'h2):(1'h0)] wire26;
  input wire [(4'hc):(1'h0)] wire25;
  input wire [(5'h15):(1'h0)] wire24;
  wire [(5'h11):(1'h0)] wire31;
  wire [(4'hb):(1'h0)] wire30;
  wire [(4'hf):(1'h0)] wire29;
  wire signed [(4'ha):(1'h0)] wire28;
  assign y = {wire31, wire30, wire29, wire28, (1'h0)};
  assign wire28 = $signed(wire26);
  assign wire29 = (~($unsigned((^~$signed(wire28))) ?
                      (&(wire26[(1'h0):(1'h0)] ?
                          ((8'hb9) - wire26) : (wire26 * wire25))) : $signed($unsigned({wire24}))));
  assign wire30 = (8'h9c);
  assign wire31 = (^~wire27);
endmodule

module module107
#(parameter param131 = ((~^{((~|(7'h41)) & (^(8'hb9))), (((8'hb0) == (8'hb8)) <= ((8'ha5) == (8'ha0)))}) >= ((8'hb7) * ((((8'ha8) ~^ (8'hae)) ? ((8'ha4) ? (8'hae) : (8'hb1)) : {(8'hae), (8'ha6)}) ? (^((7'h42) && (8'hbc))) : (((8'hbe) ? (8'h9e) : (8'hb7)) ? (!(8'ha3)) : (&(8'had)))))), 
parameter param132 = param131)
(y, clk, wire111, wire110, wire109, wire108);
  output wire [(32'hde):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire111;
  input wire signed [(4'hb):(1'h0)] wire110;
  input wire [(3'h5):(1'h0)] wire109;
  input wire [(5'h14):(1'h0)] wire108;
  wire signed [(5'h10):(1'h0)] wire130;
  wire [(4'h9):(1'h0)] wire129;
  wire signed [(3'h6):(1'h0)] wire128;
  wire [(4'hc):(1'h0)] wire123;
  wire [(4'hb):(1'h0)] wire122;
  wire [(4'hd):(1'h0)] wire121;
  wire [(4'hf):(1'h0)] wire120;
  wire signed [(3'h7):(1'h0)] wire119;
  wire signed [(3'h7):(1'h0)] wire118;
  reg [(2'h2):(1'h0)] reg127 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg125 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg124 = (1'h0);
  reg [(5'h15):(1'h0)] reg117 = (1'h0);
  reg [(3'h7):(1'h0)] reg116 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg114 = (1'h0);
  reg [(5'h12):(1'h0)] reg113 = (1'h0);
  reg [(5'h14):(1'h0)] reg112 = (1'h0);
  assign y = {wire130,
                 wire129,
                 wire128,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((((wire110 ?
          ($signed(wire109) ?
              $signed(wire108) : {wire109}) : wire108) <<< {((wire111 - wire109) || (^wire109)),
          (^~(&wire111))}) > (wire109 ?
          wire110 : $signed($unsigned(wire108[(5'h12):(2'h3)])))))
        begin
          reg112 <= $unsigned($signed((^~(&(~^(8'ha0))))));
          reg113 <= reg112[(4'he):(4'ha)];
        end
      else
        begin
          if (reg113)
            begin
              reg112 <= (+$signed(reg112));
            end
          else
            begin
              reg112 <= $unsigned(wire108);
              reg113 <= wire109[(2'h3):(1'h1)];
              reg114 <= ((wire109[(2'h2):(1'h1)] ?
                      wire110[(4'ha):(4'h8)] : ({(wire108 + wire110),
                              reg113[(5'h12):(4'hf)]} ?
                          wire109 : ({reg112, reg112} ?
                              (reg112 ? wire109 : (8'hbe)) : (wire108 ?
                                  reg113 : wire111)))) ?
                  $unsigned($signed((-((8'hbc) ?
                      wire108 : wire111)))) : (~$signed({wire109})));
            end
        end
      reg115 <= ((wire108 != $signed((8'ha2))) ^ ($signed(wire111) || {(wire110[(2'h2):(2'h2)] ?
              $unsigned(wire109) : reg112[(5'h13):(5'h11)])}));
      reg116 <= (($signed((8'h9f)) - ($unsigned(wire108[(4'h9):(2'h2)]) >> reg114)) ?
          ($signed((^~(~|wire110))) & {(wire108[(4'hf):(1'h1)] ?
                  (wire108 > wire109) : (reg113 | wire110)),
              $unsigned({reg113, wire108})}) : ({$signed($signed(reg115)),
                  $signed((reg114 ^ wire108))} ?
              $signed(wire111[(4'hc):(4'hc)]) : $signed((^reg115[(4'h9):(4'h8)]))));
      reg117 <= wire111[(4'he):(4'hb)];
    end
  assign wire118 = ((((~^(8'hb4)) ?
                           $unsigned((wire110 + reg113)) : $signed((|reg115))) + (!(^(8'h9e)))) ?
                       reg114[(2'h2):(2'h2)] : ($unsigned(reg116) ^~ $unsigned(($unsigned((8'had)) >= (~wire109)))));
  assign wire119 = reg113;
  assign wire120 = $unsigned($unsigned(wire109[(1'h0):(1'h0)]));
  assign wire121 = $unsigned($signed($unsigned((~|(wire111 ~^ wire111)))));
  assign wire122 = wire109;
  assign wire123 = $unsigned(((wire109 ~^ $unsigned(wire121)) ?
                       $unsigned(((reg116 ? wire108 : wire109) ?
                           reg115 : (reg115 ?
                               wire122 : wire111))) : (wire118[(1'h0):(1'h0)] <= (~|(reg113 ^~ wire122)))));
  always
    @(posedge clk) begin
      reg124 <= wire108[(5'h13):(4'hd)];
      reg125 <= (+(~^{(!(reg113 << wire111)), (^~(reg113 * (8'ha2)))}));
    end
  always
    @(posedge clk) begin
      if ((~|$unsigned((-wire109[(2'h3):(1'h0)]))))
        begin
          reg126 <= (wire111[(5'h11):(3'h4)] >= ((((~^(8'ha7)) * reg117) ?
                  wire109[(3'h4):(1'h0)] : $signed(reg113)) ?
              (reg115 ?
                  wire109[(2'h2):(2'h2)] : {(wire119 && (7'h40))}) : $signed(wire122)));
        end
      else
        begin
          reg126 <= $unsigned({((reg113 & reg126) <<< ($unsigned(reg117) ?
                  (wire108 ? wire111 : reg113) : (wire110 ?
                      reg113 : wire120)))});
          reg127 <= $unsigned($signed((~&wire120)));
        end
    end
  assign wire128 = $signed((~^(|{$unsigned(wire119), (wire123 != wire109)})));
  assign wire129 = $unsigned($unsigned(((~&$unsigned(reg124)) ?
                       $signed(reg114) : ((wire119 >>> wire119) >= reg127[(1'h0):(1'h0)]))));
  assign wire130 = $unsigned((8'hbd));
endmodule

module module70
#(parameter param101 = (-((^{((8'ha6) >= (8'hbe)), ((8'hb9) ? (8'hae) : (8'h9f))}) ? (8'ha0) : (~|((~|(8'ha5)) && (8'h9e))))))
(y, clk, wire74, wire73, wire72, wire71);
  output wire [(32'h13a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire74;
  input wire [(4'he):(1'h0)] wire73;
  input wire [(4'hc):(1'h0)] wire72;
  input wire [(4'hb):(1'h0)] wire71;
  wire signed [(4'hf):(1'h0)] wire100;
  wire [(5'h10):(1'h0)] wire99;
  wire [(2'h3):(1'h0)] wire98;
  wire signed [(5'h13):(1'h0)] wire93;
  wire signed [(4'hb):(1'h0)] wire92;
  wire [(2'h3):(1'h0)] wire91;
  wire [(5'h11):(1'h0)] wire90;
  wire [(2'h2):(1'h0)] wire89;
  wire signed [(4'h8):(1'h0)] wire88;
  wire [(4'hf):(1'h0)] wire87;
  wire [(4'hd):(1'h0)] wire77;
  wire signed [(2'h3):(1'h0)] wire76;
  wire signed [(4'ha):(1'h0)] wire75;
  reg signed [(4'hb):(1'h0)] reg97 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg96 = (1'h0);
  reg [(5'h11):(1'h0)] reg95 = (1'h0);
  reg [(5'h13):(1'h0)] reg94 = (1'h0);
  reg [(4'h9):(1'h0)] reg86 = (1'h0);
  reg [(4'h8):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg84 = (1'h0);
  reg [(5'h11):(1'h0)] reg83 = (1'h0);
  reg [(5'h12):(1'h0)] reg82 = (1'h0);
  reg [(4'hd):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg80 = (1'h0);
  reg [(4'hf):(1'h0)] reg79 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg78 = (1'h0);
  assign y = {wire100,
                 wire99,
                 wire98,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire77,
                 wire76,
                 wire75,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 (1'h0)};
  assign wire75 = (~&wire73);
  assign wire76 = (-wire75[(4'h8):(4'h8)]);
  assign wire77 = ((^$unsigned({wire76, {wire74}})) ?
                      wire73[(2'h2):(1'h1)] : wire75[(3'h7):(1'h1)]);
  always
    @(posedge clk) begin
      if ((7'h43))
        begin
          reg78 <= ({((|wire77) | $signed(((8'hbc) && (8'hb7)))),
                  (+{$signed(wire73), $unsigned(wire71)})} ?
              (wire75[(3'h5):(1'h0)] >>> (($unsigned(wire72) ?
                      $signed(wire75) : $signed(wire75)) ?
                  ($unsigned((7'h43)) ?
                      $unsigned(wire75) : (wire72 ?
                          wire72 : wire74)) : $signed((wire75 >>> wire76)))) : wire77);
          reg79 <= $unsigned(wire74[(4'he):(4'hc)]);
          if (((wire71 ?
                  (($unsigned(wire75) <<< (wire71 ?
                      reg78 : wire76)) << wire71) : $unsigned((~&(wire75 ^ wire76)))) ?
              $signed((8'ha7)) : $unsigned((8'hb1))))
            begin
              reg80 <= {{(8'haa), (+{(|wire76)})}};
              reg81 <= $signed(($signed(($signed(wire75) ?
                      (wire77 * wire72) : $unsigned(wire72))) ?
                  wire73[(4'hb):(4'ha)] : $signed($unsigned((~^wire76)))));
              reg82 <= wire74[(4'hb):(3'h6)];
              reg83 <= wire71[(3'h4):(2'h2)];
            end
          else
            begin
              reg80 <= reg79;
            end
          reg84 <= {(+(8'hbf)),
              ($signed(wire75[(2'h2):(1'h1)]) < $unsigned(((reg78 && reg79) ?
                  {wire75} : (reg83 ~^ (8'haa)))))};
        end
      else
        begin
          reg78 <= (((+($unsigned((8'ha5)) ? $unsigned(wire75) : {wire73})) ?
              wire73 : (!wire73[(4'hc):(4'h9)])) < (~^reg83[(2'h2):(1'h1)]));
          reg79 <= $unsigned(reg78);
        end
      if ({($signed((|(reg84 <= reg83))) ?
              (reg83[(4'ha):(4'ha)] <= ((reg83 == reg83) && $signed(reg78))) : ($unsigned(wire71) ?
                  wire75 : $signed((wire76 ^~ reg83)))),
          ((!$unsigned($signed(reg79))) <= ($unsigned($unsigned(reg84)) - $unsigned(wire77[(4'hc):(1'h1)])))})
        begin
          reg85 <= $signed((8'had));
        end
      else
        begin
          reg85 <= $unsigned(($signed(((reg84 ? reg78 : wire77) ?
                  wire71 : (8'ha9))) ?
              $signed(wire76) : {((&wire76) ? wire77[(4'hb):(3'h7)] : reg84),
                  ((reg84 ? reg81 : wire74) + (8'hb3))}));
          reg86 <= {$signed((~|((+wire77) ?
                  (reg85 ? reg85 : reg79) : $signed(reg80)))),
              $unsigned({$signed(wire77), $unsigned((~&reg85))})};
        end
    end
  assign wire87 = (wire74[(4'hb):(3'h5)] < $unsigned(wire74[(3'h5):(1'h0)]));
  assign wire88 = $signed((+wire74));
  assign wire89 = {reg85,
                      ($signed(((reg78 ? (8'hb0) : (8'hac)) ?
                          (&reg79) : ((8'h9e) >> reg86))) & wire87[(3'h5):(2'h3)])};
  assign wire90 = $signed((({(~reg83)} - {{wire72, reg81},
                      $signed(wire87)}) <= (($unsigned(wire75) ?
                      (+reg78) : $unsigned(reg85)) + ({reg82, wire89} ?
                      reg84[(4'ha):(3'h5)] : (wire89 ? reg84 : wire71)))));
  assign wire91 = $signed($signed((7'h42)));
  assign wire92 = ($unsigned($unsigned((^$unsigned(reg84)))) ?
                      $signed($unsigned($signed((^~reg84)))) : reg80[(4'hb):(1'h0)]);
  assign wire93 = wire88;
  always
    @(posedge clk) begin
      reg94 <= {(reg80[(2'h3):(2'h2)] ?
              $unsigned($signed((~|wire90))) : (({(8'hb1), reg83} ?
                  reg86[(1'h1):(1'h0)] : (wire90 ?
                      wire74 : wire93)) >> (8'hab)))};
      reg95 <= $signed($unsigned((&((^wire72) ?
          reg78[(4'h8):(3'h7)] : $signed((8'ha0))))));
      reg96 <= ((~&(~&(!(~(8'hbe))))) ?
          reg86 : $unsigned((wire89[(1'h0):(1'h0)] | wire77[(4'hd):(4'h8)])));
      reg97 <= $signed(reg78[(2'h2):(1'h1)]);
    end
  assign wire98 = (wire76[(1'h1):(1'h1)] ?
                      ((($unsigned(reg82) != wire92) | $signed(wire71)) ?
                          {((^~reg80) >= {(8'h9d)})} : wire77) : {(+((reg85 ?
                                  wire75 : reg96) ?
                              $signed(wire71) : $signed(wire77))),
                          ($unsigned({(8'hb0)}) ?
                              $signed($signed(reg97)) : {reg85[(1'h1):(1'h1)],
                                  wire76[(1'h0):(1'h0)]})});
  assign wire99 = (8'ha9);
  assign wire100 = wire91;
endmodule
