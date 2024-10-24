module top
#(parameter param196 = ((8'hb7) || ({(~^(-(8'hab)))} ~^ (^((~^(8'ha1)) != ((8'hac) ? (8'haa) : (8'h9c)))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h14d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire0;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire4;
  wire signed [(4'he):(1'h0)] wire5;
  wire signed [(3'h5):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire8;
  wire [(4'he):(1'h0)] wire9;
  wire [(4'he):(1'h0)] wire10;
  wire signed [(4'hd):(1'h0)] wire11;
  wire [(5'h15):(1'h0)] wire12;
  wire signed [(5'h14):(1'h0)] wire13;
  wire signed [(5'h14):(1'h0)] wire14;
  wire signed [(3'h4):(1'h0)] wire80;
  wire [(4'he):(1'h0)] wire82;
  wire signed [(5'h15):(1'h0)] wire83;
  wire signed [(5'h14):(1'h0)] wire92;
  wire signed [(4'h9):(1'h0)] wire194;
  reg [(5'h11):(1'h0)] reg91 = (1'h0);
  reg [(5'h14):(1'h0)] reg90 = (1'h0);
  reg [(5'h14):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg88 = (1'h0);
  reg [(3'h7):(1'h0)] reg87 = (1'h0);
  reg [(3'h5):(1'h0)] reg86 = (1'h0);
  reg [(2'h3):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg84 = (1'h0);
  assign y = {wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire80,
                 wire82,
                 wire83,
                 wire92,
                 wire194,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 (1'h0)};
  assign wire5 = wire2[(2'h3):(1'h0)];
  assign wire6 = $unsigned(wire0[(2'h3):(1'h1)]);
  assign wire7 = wire4;
  assign wire8 = wire7[(2'h2):(2'h2)];
  assign wire9 = ((-wire6) == wire7);
  assign wire10 = $unsigned({((!(~wire5)) >> wire0[(1'h1):(1'h0)])});
  assign wire11 = (^~(~&wire5[(3'h7):(3'h6)]));
  assign wire12 = ($unsigned((!(|{wire8, wire0}))) | (!wire7));
  assign wire13 = ({(({wire8, wire4} ?
                              wire6[(3'h4):(2'h3)] : (wire8 == wire11)) | wire1[(4'hb):(1'h0)]),
                          wire2[(2'h2):(1'h1)]} ?
                      $signed($signed(wire1[(2'h2):(2'h2)])) : (~$unsigned(wire0[(2'h2):(1'h1)])));
  assign wire14 = {wire2};
  module15 #() modinst81 (wire80, clk, wire2, wire7, wire13, wire0);
  assign wire82 = $signed((&$signed($unsigned((wire6 ^ wire14)))));
  assign wire83 = wire8[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      if ((~|$signed($signed($signed(wire7[(5'h12):(3'h7)])))))
        begin
          reg84 <= (wire14 ?
              ({(wire12 ? (!(8'had)) : $signed(wire1)), (&wire0)} ?
                  (wire6 >>> $signed($signed(wire5))) : (~{wire80[(3'h4):(3'h4)],
                      (wire7 && wire13)})) : $unsigned(wire14[(1'h0):(1'h0)]));
          if ((wire2 ^~ (&$signed((wire14[(5'h13):(3'h4)] + wire11)))))
            begin
              reg85 <= {$unsigned(wire0[(2'h3):(2'h2)]),
                  ($signed(wire82) ^~ (((wire4 | (8'ha3)) - $signed((8'hb6))) ?
                      $unsigned({(8'ha4)}) : $unsigned(wire12[(1'h0):(1'h0)])))};
              reg86 <= (((wire0 <<< (8'hab)) || $signed($signed((wire0 <<< wire11)))) ^ $signed((!$unsigned($signed(wire83)))));
              reg87 <= {$unsigned(wire1)};
            end
          else
            begin
              reg85 <= $signed(($unsigned(wire10[(3'h5):(1'h1)]) || (8'ha7)));
              reg86 <= {$signed($signed($unsigned((reg84 - reg84)))),
                  (wire8 >> reg86)};
            end
        end
      else
        begin
          if (wire80[(1'h0):(1'h0)])
            begin
              reg84 <= ((($unsigned((!wire11)) ?
                          $unsigned($unsigned(wire10)) : ((wire0 ?
                                  reg86 : reg87) ?
                              (^~(8'had)) : (~|reg84))) ?
                      (($unsigned(reg87) ?
                              wire6[(1'h1):(1'h1)] : (wire83 == wire9)) ?
                          (wire12 <<< $unsigned(wire9)) : wire83) : (8'h9f)) ?
                  {(~reg84[(4'ha):(3'h7)])} : ($signed(reg84[(4'h9):(1'h1)]) ?
                      $signed((~reg84)) : (-$unsigned(((8'hbd) ?
                          wire12 : reg85)))));
            end
          else
            begin
              reg84 <= wire4;
              reg85 <= ((8'ha9) ?
                  (wire0 ^ wire11[(4'ha):(3'h6)]) : $signed({wire10[(4'he):(4'h9)]}));
              reg86 <= (|(wire2[(4'hc):(3'h5)] <= (wire2 ?
                  wire14[(5'h13):(1'h0)] : $unsigned((^~wire9)))));
              reg87 <= (+(wire83[(5'h13):(2'h2)] ?
                  $unsigned(((wire11 >= (8'h9e)) <= reg86)) : (((8'hba) + wire7) ?
                      $unsigned(reg84) : wire83[(3'h4):(3'h4)])));
            end
          if ($signed({reg86}))
            begin
              reg88 <= $unsigned(wire14);
              reg89 <= wire1;
            end
          else
            begin
              reg88 <= ($signed($unsigned(wire82[(2'h2):(1'h1)])) ?
                  $signed({($signed(wire4) ?
                          (wire5 ? reg85 : (7'h42)) : $signed(wire13)),
                      wire2[(4'h8):(2'h2)]}) : $unsigned($unsigned(($unsigned(reg87) + {wire0}))));
              reg89 <= $signed($unsigned((({wire9,
                  wire80} | (~|reg89)) | (+((8'ha1) <= reg85)))));
            end
          reg90 <= wire83[(4'hc):(4'h9)];
        end
    end
  always
    @(posedge clk) begin
      reg91 <= $unsigned({wire7});
    end
  assign wire92 = (~|wire4);
  module93 #() modinst195 (wire194, clk, wire3, wire9, reg90, reg91, wire92);
endmodule

module module93
#(parameter param193 = ({{((~(8'haf)) == ((8'haf) ? (8'had) : (8'hb0)))}} ? (~((((8'haa) ? (7'h43) : (8'hb7)) | {(8'ha4), (8'h9e)}) ? (&((8'hac) ? (8'h9f) : (8'hba))) : (~&((8'hac) ^ (8'ha2))))) : {(((^(7'h44)) ? ((8'ha2) ? (8'h9f) : (8'had)) : ((8'hb4) ? (8'hbc) : (8'hbb))) ? (((8'h9c) ? (8'ha6) : (8'had)) ? (~^(8'ha5)) : ((8'haa) > (8'hb4))) : (|((8'ha1) ? (8'ha4) : (8'hb2)))), ({{(8'ha4)}, {(8'hb8), (8'ha4)}} > ((8'hb2) > (&(8'ha9))))}))
(y, clk, wire94, wire95, wire96, wire97, wire98);
  output wire [(32'hce):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire94;
  input wire [(4'hd):(1'h0)] wire95;
  input wire signed [(5'h13):(1'h0)] wire96;
  input wire signed [(4'h8):(1'h0)] wire97;
  input wire [(5'h14):(1'h0)] wire98;
  wire signed [(4'he):(1'h0)] wire99;
  wire [(4'h9):(1'h0)] wire100;
  wire [(5'h15):(1'h0)] wire101;
  wire signed [(3'h6):(1'h0)] wire102;
  wire signed [(2'h2):(1'h0)] wire103;
  wire [(5'h15):(1'h0)] wire104;
  wire [(3'h4):(1'h0)] wire105;
  wire [(3'h5):(1'h0)] wire106;
  wire [(4'hb):(1'h0)] wire107;
  wire signed [(4'h9):(1'h0)] wire108;
  wire signed [(5'h14):(1'h0)] wire109;
  wire [(4'hb):(1'h0)] wire114;
  wire signed [(4'ha):(1'h0)] wire150;
  wire [(4'h8):(1'h0)] wire191;
  reg [(4'hf):(1'h0)] reg110 = (1'h0);
  reg [(4'hf):(1'h0)] reg111 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg112 = (1'h0);
  reg [(4'hb):(1'h0)] reg113 = (1'h0);
  assign y = {wire99,
                 wire100,
                 wire101,
                 wire102,
                 wire103,
                 wire104,
                 wire105,
                 wire106,
                 wire107,
                 wire108,
                 wire109,
                 wire114,
                 wire150,
                 wire191,
                 reg110,
                 reg111,
                 reg112,
                 reg113,
                 (1'h0)};
  assign wire99 = $unsigned((~|{($unsigned(wire95) << (wire98 * (8'h9d)))}));
  assign wire100 = $unsigned({$unsigned(((^wire98) ?
                           (wire99 & wire98) : (wire96 ? wire97 : wire97))),
                       wire94[(3'h6):(3'h6)]});
  assign wire101 = wire97[(4'h8):(3'h6)];
  assign wire102 = (8'hbd);
  assign wire103 = ({wire95} * wire101);
  assign wire104 = $signed((wire102 * ($unsigned({wire101,
                       wire98}) || $signed((~wire96)))));
  assign wire105 = ((-$unsigned(wire101[(5'h14):(3'h6)])) << $signed((^~$unsigned((wire94 ?
                       wire95 : wire97)))));
  assign wire106 = (8'h9f);
  assign wire107 = wire96[(2'h3):(1'h1)];
  assign wire108 = $signed((~($unsigned($unsigned(wire101)) ?
                       (wire106[(1'h1):(1'h0)] ?
                           $signed((7'h43)) : wire104[(3'h7):(3'h5)]) : $unsigned((-(8'ha6))))));
  assign wire109 = wire104;
  always
    @(posedge clk) begin
      reg110 <= (8'hb9);
      reg111 <= $signed(((^(wire107[(1'h0):(1'h0)] ? {wire101} : (~&wire103))) ?
          {($unsigned(wire94) <<< (~|(8'hb9))),
              ((wire101 ? (8'haa) : wire97) ?
                  wire104[(4'he):(3'h4)] : (!wire102))} : (((wire100 ?
                      (8'ha7) : wire94) ?
                  (wire98 >>> (8'h9c)) : $signed(wire103)) ?
              (&(wire97 >> wire98)) : wire109)));
    end
  always
    @(posedge clk) begin
      reg112 <= $unsigned((-wire108));
      reg113 <= reg112[(4'hd):(3'h4)];
    end
  assign wire114 = $signed((~(((~|wire98) || (wire107 ?
                       wire97 : wire102)) | ((8'hbd) || (^wire94)))));
  module115 #() modinst151 (wire150, clk, wire104, reg111, reg112, wire101);
  module152 #() modinst192 (.wire155(wire100), .wire154(wire109), .wire156(wire101), .y(wire191), .clk(clk), .wire153(reg111));
endmodule

module module15
#(parameter param78 = (((((~|(8'hba)) ? ((8'ha4) <= (8'hbc)) : {(8'haf), (8'h9f)}) || (^~((8'hab) <<< (8'hb4)))) ? ((8'hbc) ? (((8'ha1) ? (8'hba) : (8'ha5)) ? ((8'hac) ~^ (8'ha8)) : ((8'hab) ? (8'hb9) : (8'hb3))) : (-(~^(8'ha2)))) : ((((8'h9c) & (8'h9c)) <<< ((8'ha8) ? (8'hbe) : (8'h9e))) ? (|((8'hab) >= (8'h9f))) : {(^~(8'hb4)), ((8'hbb) - (8'ha3))})) >= (|((~|((8'hae) || (8'hbc))) ? (!((8'ha3) ? (8'hb7) : (8'hb4))) : ((|(8'hba)) ? ((8'h9c) ? (8'hab) : (8'ha6)) : (~(8'ha9)))))), 
parameter param79 = (param78 << (&(~(param78 ? (param78 + (8'hae)) : (param78 ? param78 : param78))))))
(y, clk, wire16, wire17, wire18, wire19);
  output wire [(32'hf2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire16;
  input wire [(5'h13):(1'h0)] wire17;
  input wire signed [(5'h14):(1'h0)] wire18;
  input wire signed [(3'h6):(1'h0)] wire19;
  wire signed [(3'h6):(1'h0)] wire77;
  wire [(5'h15):(1'h0)] wire20;
  wire signed [(4'hc):(1'h0)] wire21;
  wire [(4'hf):(1'h0)] wire31;
  wire signed [(3'h7):(1'h0)] wire32;
  wire signed [(3'h5):(1'h0)] wire33;
  wire [(4'h9):(1'h0)] wire34;
  wire signed [(3'h5):(1'h0)] wire75;
  reg signed [(5'h15):(1'h0)] reg22 = (1'h0);
  reg [(4'hc):(1'h0)] reg23 = (1'h0);
  reg [(4'h9):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg27 = (1'h0);
  reg [(3'h4):(1'h0)] reg28 = (1'h0);
  reg [(4'hf):(1'h0)] reg29 = (1'h0);
  reg [(5'h12):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg35 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg36 = (1'h0);
  reg [(4'hd):(1'h0)] reg37 = (1'h0);
  assign y = {wire77,
                 wire20,
                 wire21,
                 wire31,
                 wire32,
                 wire33,
                 wire34,
                 wire75,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg35,
                 reg36,
                 reg37,
                 (1'h0)};
  assign wire20 = (^wire18[(1'h1):(1'h0)]);
  assign wire21 = (wire20 <= $signed((~^$signed(wire19[(1'h0):(1'h0)]))));
  always
    @(posedge clk) begin
      if ($signed(((8'hb4) ?
          $signed($unsigned(wire20[(3'h6):(3'h5)])) : {(8'ha2), wire20})))
        begin
          reg22 <= (!$unsigned($signed((wire17[(4'hf):(1'h0)] ^~ (wire19 & wire18)))));
          reg23 <= (^~$signed($unsigned($signed(wire16[(2'h2):(1'h0)]))));
          reg24 <= wire20;
        end
      else
        begin
          reg22 <= (($signed(((+reg23) ?
                  (~&(8'h9d)) : reg23[(1'h1):(1'h1)])) | ((~|$unsigned(wire16)) ^ (^~(wire21 ?
                  reg22 : wire20)))) ?
              wire21 : {{{reg22, (^reg23)}, wire19},
                  (wire20[(3'h6):(1'h0)] ?
                      {wire17,
                          wire21[(2'h3):(1'h0)]} : $signed((wire21 <<< (8'hba))))});
          reg23 <= {((wire19 != wire19[(3'h5):(1'h0)]) == wire16[(2'h3):(1'h1)]),
              $signed($signed($unsigned((wire18 ? reg24 : wire16))))};
          reg24 <= ((wire16[(3'h5):(1'h1)] | ((|(~&wire19)) ?
                  ($signed(reg24) <<< ((7'h40) > (8'hbf))) : (~^{wire20}))) ?
              reg22 : $signed($unsigned(wire17)));
        end
      if ((wire20 < reg24))
        begin
          reg25 <= $unsigned($unsigned($unsigned(wire17[(4'hc):(2'h3)])));
          reg26 <= $signed(wire17[(4'hf):(4'hf)]);
          reg27 <= {(&({$signed(reg24)} ?
                  ($unsigned(reg22) <<< $unsigned((8'hba))) : $unsigned((wire21 ?
                      (8'hb6) : wire21)))),
              $unsigned(reg23)};
          reg28 <= ($signed(reg23) ?
              ({{wire19[(2'h2):(2'h2)],
                      reg24}} >= $signed($unsigned($signed(wire20)))) : ((-wire18[(5'h10):(3'h5)]) + $signed(wire19)));
        end
      else
        begin
          reg25 <= ($unsigned({$unsigned(reg27)}) ?
              (^~{reg24, reg24[(3'h6):(3'h5)]}) : wire20);
          reg26 <= $unsigned(($unsigned(((reg26 ? reg28 : (8'hb4)) ?
              $signed((8'hbf)) : {wire21, wire20})) - $signed(((+reg24) ?
              (7'h42) : $unsigned(reg24)))));
          if (({$signed((|reg25))} ?
              {({(wire17 - (8'haa)),
                      (wire19 ? reg23 : wire20)} <<< ((reg22 != reg26) ?
                      (~^wire18) : $unsigned(wire19)))} : $signed(({((8'hbe) ?
                      wire21 : wire16),
                  (wire17 << wire17)} > (^~wire18[(3'h5):(2'h3)])))))
            begin
              reg27 <= wire20;
              reg28 <= (($signed(wire19[(2'h3):(2'h3)]) <= $signed($unsigned((wire17 ?
                  reg23 : (8'hb3))))) - (+reg22));
            end
          else
            begin
              reg27 <= (~|({{(!reg26)}, $signed(wire19)} ~^ ((+wire18) ?
                  $signed((8'ha0)) : ((wire20 != wire17) ?
                      $unsigned(reg23) : (reg23 >>> wire17)))));
            end
          reg29 <= wire21[(4'hb):(2'h2)];
          reg30 <= wire20[(3'h6):(2'h2)];
        end
    end
  assign wire31 = reg26[(2'h2):(1'h1)];
  assign wire32 = (~$unsigned(reg25[(4'h8):(2'h2)]));
  assign wire33 = (~($unsigned(((!wire31) ?
                      $unsigned(reg25) : $unsigned(reg22))) - reg29[(2'h3):(2'h2)]));
  assign wire34 = reg24[(3'h4):(3'h4)];
  always
    @(posedge clk) begin
      reg35 <= (^(8'ha0));
      reg36 <= $signed(((wire21[(1'h0):(1'h0)] ?
          ($signed(reg25) ?
              (reg24 ^ reg35) : reg24[(3'h4):(2'h3)]) : $signed(wire19[(2'h3):(2'h2)])) <= $unsigned(((~reg22) ?
          (wire21 ? wire18 : reg22) : (~^(8'ha8))))));
      reg37 <= (wire34 == $signed((reg36 > ((8'ha5) ?
          (reg23 && wire32) : reg26[(3'h4):(2'h2)]))));
    end
  module38 #() modinst76 (.y(wire75), .clk(clk), .wire42(reg22), .wire40(reg35), .wire41(wire21), .wire39(reg29));
  assign wire77 = $unsigned((|(8'haa)));
endmodule

module module38  (y, clk, wire42, wire41, wire40, wire39);
  output wire [(32'h19d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire42;
  input wire signed [(2'h3):(1'h0)] wire41;
  input wire signed [(5'h13):(1'h0)] wire40;
  input wire signed [(4'hf):(1'h0)] wire39;
  wire [(4'ha):(1'h0)] wire74;
  wire signed [(3'h5):(1'h0)] wire73;
  wire [(3'h6):(1'h0)] wire63;
  wire signed [(5'h10):(1'h0)] wire62;
  wire [(4'hf):(1'h0)] wire61;
  wire signed [(4'hd):(1'h0)] wire50;
  reg [(2'h3):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg71 = (1'h0);
  reg [(5'h12):(1'h0)] reg70 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg69 = (1'h0);
  reg [(4'h9):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg67 = (1'h0);
  reg [(4'hc):(1'h0)] reg66 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg64 = (1'h0);
  reg [(5'h15):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg59 = (1'h0);
  reg [(2'h3):(1'h0)] reg58 = (1'h0);
  reg [(3'h5):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg55 = (1'h0);
  reg [(5'h11):(1'h0)] reg54 = (1'h0);
  reg [(4'hd):(1'h0)] reg53 = (1'h0);
  reg [(5'h15):(1'h0)] reg52 = (1'h0);
  reg signed [(4'he):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg49 = (1'h0);
  reg [(5'h11):(1'h0)] reg48 = (1'h0);
  reg [(4'he):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg46 = (1'h0);
  reg [(4'hd):(1'h0)] reg45 = (1'h0);
  reg [(5'h14):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg43 = (1'h0);
  assign y = {wire74,
                 wire73,
                 wire63,
                 wire62,
                 wire61,
                 wire50,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ({wire41, (~|(!{(-wire42), wire42}))})
        begin
          if (wire41[(2'h3):(1'h1)])
            begin
              reg43 <= $unsigned({$unsigned((^$signed((8'hbc)))), wire39});
            end
          else
            begin
              reg43 <= wire39[(3'h4):(2'h2)];
              reg44 <= reg43;
              reg45 <= (wire40 ?
                  (!(wire40[(5'h13):(2'h3)] ^~ (8'hb6))) : $unsigned(wire40[(3'h4):(2'h2)]));
              reg46 <= reg44[(4'hd):(1'h1)];
            end
        end
      else
        begin
          if ($signed($signed((reg43 - {$signed(wire40)}))))
            begin
              reg43 <= wire40;
              reg44 <= reg44[(5'h12):(5'h11)];
              reg45 <= $unsigned($unsigned($signed($signed(wire41[(2'h2):(2'h2)]))));
            end
          else
            begin
              reg43 <= $signed((7'h42));
              reg44 <= (~($signed(wire42) ? reg45 : $signed($signed((8'hbb)))));
              reg45 <= ({(((wire40 ? (8'hb8) : wire41) ?
                          reg45[(4'hd):(4'h9)] : $unsigned(reg43)) ?
                      (|$signed(wire39)) : (~$unsigned((7'h41))))} == ((reg45[(3'h6):(2'h2)] ?
                  $unsigned({wire40,
                      reg45}) : (wire42[(1'h1):(1'h1)] > {reg44})) || $signed((reg44[(2'h3):(2'h3)] ?
                  $unsigned(reg43) : (|wire42)))));
            end
          reg46 <= (-(reg43 ?
              wire41 : ($signed($signed(reg46)) ?
                  $signed((reg44 && reg46)) : $signed($unsigned(reg44)))));
          reg47 <= wire42;
        end
      reg48 <= reg46;
      reg49 <= wire42;
    end
  assign wire50 = (({$signed({reg48}), (~$unsigned(reg44))} + {$signed(reg48),
                          ((-reg47) ? (wire42 == reg48) : wire39)}) ?
                      {(((reg48 ? wire40 : wire39) ?
                              $unsigned(wire42) : (reg48 ?
                                  wire42 : wire41)) > ((reg48 >= reg43) ?
                              (^wire40) : (8'hb5))),
                          $unsigned((|(wire41 & wire41)))} : reg45);
  always
    @(posedge clk) begin
      if ({wire41,
          ((~((reg45 >> (8'hb1)) ?
              $unsigned((8'ha2)) : $unsigned(wire41))) || $unsigned($unsigned((reg45 ?
              (8'hb7) : reg46))))})
        begin
          reg51 <= $unsigned(wire39);
          reg52 <= reg51;
          reg53 <= reg44[(4'hf):(3'h7)];
          if (($signed($signed($unsigned($signed(reg46)))) >>> $unsigned($signed($signed(wire39)))))
            begin
              reg54 <= {reg48[(4'he):(3'h5)]};
              reg55 <= ($unsigned(reg45[(2'h3):(2'h2)]) + (~&(({reg47} << wire41[(2'h2):(1'h1)]) ?
                  ((&reg43) < ((8'ha1) || reg46)) : $signed($signed(reg47)))));
              reg56 <= reg45[(2'h3):(1'h0)];
            end
          else
            begin
              reg54 <= $signed($unsigned($signed(reg44)));
              reg55 <= (reg45[(4'h9):(2'h2)] <<< (!(+($unsigned(wire39) << (wire50 ?
                  reg54 : wire39)))));
              reg56 <= wire41;
              reg57 <= ((^$unsigned((wire41[(2'h3):(2'h3)] ?
                  ((7'h40) <<< reg51) : $signed(wire50)))) > {($signed($signed((8'ha9))) ^~ (^~$signed(reg51))),
                  {reg45[(4'ha):(4'h9)]}});
            end
        end
      else
        begin
          reg51 <= ((reg53[(1'h0):(1'h0)] > ({(wire39 ^ reg43),
                  $unsigned(wire39)} ?
              (-$signed(reg48)) : reg46[(4'h8):(1'h0)])) || ((((reg46 && reg45) ?
                      reg53 : (reg53 ? wire39 : (8'ha8))) ?
                  $unsigned($signed(reg45)) : reg47[(4'he):(4'ha)]) ?
              $unsigned((^~(+reg43))) : (^~reg43)));
          reg52 <= (wire39[(4'ha):(2'h3)] || wire50);
          reg53 <= reg48;
          reg54 <= (wire40[(1'h0):(1'h0)] ?
              $signed({(((8'ha7) ? reg43 : wire50) ?
                      wire42 : wire39[(2'h2):(2'h2)])}) : (~&((~|$unsigned((8'ha6))) + reg52)));
        end
      reg58 <= ($unsigned($signed($unsigned((~wire40)))) >> wire39[(4'hc):(4'ha)]);
      reg59 <= wire50[(2'h3):(1'h1)];
      reg60 <= $unsigned((reg43[(2'h3):(2'h3)] ?
          (((reg48 ? (8'hbc) : reg53) ?
              reg55[(2'h2):(2'h2)] : (reg54 > reg52)) < ((~(8'h9c)) ?
              reg51 : wire41[(1'h0):(1'h0)])) : {reg59[(5'h14):(3'h5)],
              reg44}));
    end
  assign wire61 = (^$signed($signed(reg54[(2'h2):(2'h2)])));
  assign wire62 = reg60;
  assign wire63 = (~&($unsigned({$unsigned(reg49)}) | ($signed((wire61 >> wire62)) > $unsigned(reg54[(4'he):(4'ha)]))));
  always
    @(posedge clk) begin
      if (reg43)
        begin
          reg64 <= $signed(reg58);
          reg65 <= $signed((~^wire50));
          if ($unsigned((wire39 >>> (8'hb7))))
            begin
              reg66 <= $unsigned((^wire63[(3'h6):(1'h1)]));
              reg67 <= ({(+{(wire39 ~^ reg55)})} >>> $unsigned(wire40[(4'hb):(3'h5)]));
              reg68 <= wire42;
            end
          else
            begin
              reg66 <= (&{(~&$unsigned($signed(reg47))),
                  (((reg48 ? reg53 : reg45) ?
                      (wire40 ? reg45 : reg49) : $signed(reg66)) ^ (reg57 ?
                      reg55 : reg49))});
              reg67 <= (^~wire63[(3'h6):(2'h2)]);
              reg68 <= (wire50 ?
                  {reg59[(4'hc):(4'hc)]} : ({(8'haf)} ?
                      reg58 : (reg65 << (8'hbb))));
              reg69 <= ($signed(($unsigned($unsigned(reg44)) ?
                  reg67[(1'h0):(1'h0)] : ((wire50 ? reg54 : reg46) ?
                      wire40[(4'hd):(4'h8)] : reg59))) ~^ $signed(((reg59 ?
                      $unsigned(reg54) : reg51[(3'h6):(1'h0)]) ?
                  ($unsigned(reg64) ?
                      ((7'h40) + reg51) : wire41) : (reg47 | $signed(wire50)))));
              reg70 <= $signed(((reg69 ?
                      (~(reg69 ?
                          reg44 : reg54)) : $unsigned($unsigned(reg56))) ?
                  (reg44[(1'h0):(1'h0)] ?
                      {(reg56 >>> wire42)} : $signed($signed(reg67))) : (~&(~&{reg66,
                      reg58}))));
            end
          reg71 <= $signed((~&reg45));
          reg72 <= reg57[(1'h1):(1'h1)];
        end
      else
        begin
          reg64 <= {((8'hbe) || (7'h44)),
              (reg55 > (-$signed($unsigned(reg54))))};
          reg65 <= (^~reg60[(3'h7):(2'h3)]);
          reg66 <= (~|(~|{(~|(wire39 ? wire63 : reg51)),
              reg56[(1'h0):(1'h0)]}));
        end
    end
  assign wire73 = ($signed({reg69[(3'h7):(1'h0)],
                          ((-reg70) > $unsigned(reg44))}) ?
                      wire50[(2'h3):(1'h0)] : (reg69[(3'h5):(2'h2)] ?
                          ($unsigned(wire40) ?
                              ((|reg53) ?
                                  (reg56 <<< (8'hab)) : ((7'h40) ?
                                      reg66 : wire50)) : $unsigned($signed(reg51))) : ((~&(wire42 ?
                                  reg47 : reg69)) ?
                              (reg67[(1'h1):(1'h1)] + $unsigned(reg46)) : reg49)));
  assign wire74 = $unsigned(reg52);
endmodule

module module152  (y, clk, wire156, wire155, wire154, wire153);
  output wire [(32'h17c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire156;
  input wire [(4'h9):(1'h0)] wire155;
  input wire [(4'h9):(1'h0)] wire154;
  input wire [(4'hf):(1'h0)] wire153;
  wire [(4'he):(1'h0)] wire180;
  wire signed [(4'he):(1'h0)] wire179;
  wire signed [(4'he):(1'h0)] wire161;
  wire [(4'hf):(1'h0)] wire160;
  wire [(5'h15):(1'h0)] wire159;
  wire [(2'h3):(1'h0)] wire158;
  wire [(5'h13):(1'h0)] wire157;
  reg signed [(4'h8):(1'h0)] reg190 = (1'h0);
  reg [(5'h10):(1'h0)] reg189 = (1'h0);
  reg [(4'hc):(1'h0)] reg188 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg187 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg186 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg185 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg184 = (1'h0);
  reg [(3'h4):(1'h0)] reg183 = (1'h0);
  reg signed [(4'he):(1'h0)] reg182 = (1'h0);
  reg [(3'h4):(1'h0)] reg181 = (1'h0);
  reg [(3'h4):(1'h0)] reg178 = (1'h0);
  reg [(3'h4):(1'h0)] reg177 = (1'h0);
  reg [(4'ha):(1'h0)] reg176 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg175 = (1'h0);
  reg [(4'hc):(1'h0)] reg174 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg173 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg172 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg171 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg170 = (1'h0);
  reg [(4'hd):(1'h0)] reg169 = (1'h0);
  reg signed [(4'he):(1'h0)] reg168 = (1'h0);
  reg [(2'h3):(1'h0)] reg167 = (1'h0);
  reg [(4'hc):(1'h0)] reg166 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg165 = (1'h0);
  reg [(4'hf):(1'h0)] reg164 = (1'h0);
  reg [(2'h2):(1'h0)] reg163 = (1'h0);
  reg [(4'hb):(1'h0)] reg162 = (1'h0);
  assign y = {wire180,
                 wire179,
                 wire161,
                 wire160,
                 wire159,
                 wire158,
                 wire157,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg178,
                 reg177,
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
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 (1'h0)};
  assign wire157 = {((wire153[(4'h9):(1'h1)] ?
                           wire153[(4'he):(4'hd)] : wire153) ^~ $unsigned(wire153[(4'hb):(2'h2)])),
                       (($signed((wire153 + wire155)) == (wire155 ?
                           (!wire155) : wire156[(3'h7):(3'h6)])) >= {wire155[(3'h5):(3'h5)],
                           (wire155[(3'h7):(3'h7)] ?
                               (wire155 <<< wire156) : (wire154 << wire155))})};
  assign wire158 = ({wire153[(4'hd):(3'h7)],
                       $unsigned({((8'hb3) | wire153)})} ^ wire154[(4'h8):(3'h5)]);
  assign wire159 = (~|(!wire153[(4'hf):(3'h5)]));
  assign wire160 = $signed($unsigned((((wire158 || wire159) ?
                           wire158[(2'h2):(1'h0)] : (wire157 ?
                               wire156 : wire154)) ?
                       ($unsigned(wire157) ?
                           (|wire154) : (wire159 << (8'hb6))) : $signed((!wire159)))));
  assign wire161 = (!$signed((wire159[(5'h12):(1'h1)] ?
                       $unsigned({wire154}) : ((wire154 ? wire160 : wire153) ?
                           (wire159 + wire157) : (+(8'hbb))))));
  always
    @(posedge clk) begin
      if (wire157[(3'h7):(2'h3)])
        begin
          reg162 <= wire159[(2'h3):(1'h0)];
          reg163 <= (-$signed({(~&wire155), $unsigned($unsigned((8'h9d)))}));
          if ($signed(wire159))
            begin
              reg164 <= (!($signed(($signed(reg163) ?
                      $signed(wire158) : wire161)) ?
                  wire158 : $unsigned($signed(wire153))));
              reg165 <= wire160[(4'hb):(3'h6)];
              reg166 <= (wire153 ?
                  ({$signed(wire155)} ?
                      $signed(({wire154} << wire160)) : wire159) : (&(wire157[(5'h12):(4'hc)] << {(8'hb1),
                      $unsigned((8'ha9))})));
              reg167 <= {$unsigned(reg164[(4'hc):(1'h0)])};
            end
          else
            begin
              reg164 <= $unsigned(($unsigned(({reg167, reg166} ?
                  $unsigned(wire159) : {wire155})) <<< (!reg163[(1'h0):(1'h0)])));
              reg165 <= (wire154[(3'h5):(1'h0)] * (!{reg163}));
              reg166 <= ($unsigned($signed((|(wire159 ?
                  reg166 : wire160)))) >= reg162[(1'h1):(1'h0)]);
              reg167 <= $unsigned(wire158[(2'h2):(1'h0)]);
              reg168 <= (wire158 ?
                  reg163[(1'h0):(1'h0)] : $signed((^~(wire159 ?
                      (wire160 < (8'hab)) : $unsigned(wire156)))));
            end
        end
      else
        begin
          reg162 <= reg168;
          reg163 <= ((((wire153[(4'h8):(2'h2)] ?
                      wire160[(3'h5):(3'h4)] : wire153) & (~^(-wire156))) ?
                  (reg162[(4'h9):(1'h1)] ?
                      wire153 : ((reg165 ? (8'hb3) : wire160) ?
                          $signed(wire155) : {reg165})) : reg167) ?
              $unsigned(($signed((wire161 ? reg166 : wire157)) ?
                  reg162 : ((wire160 > wire156) ?
                      wire157[(5'h13):(1'h0)] : $signed(wire154)))) : reg164[(2'h2):(2'h2)]);
        end
      if (reg162)
        begin
          reg169 <= ($signed($signed($signed(wire160))) ^ {($unsigned((reg163 ?
                      reg166 : reg165)) ?
                  wire160[(3'h5):(2'h2)] : reg167[(2'h3):(1'h1)])});
        end
      else
        begin
          reg169 <= reg167[(1'h1):(1'h0)];
          reg170 <= (8'hb8);
          reg171 <= $unsigned((wire153[(4'hd):(3'h7)] >= $signed(reg164[(1'h1):(1'h0)])));
          if (wire154[(4'h8):(4'h8)])
            begin
              reg172 <= (wire156[(2'h2):(1'h1)] ?
                  (&($unsigned((wire158 ?
                      wire158 : wire158)) ^ (8'hbc))) : $unsigned((((wire160 || (8'hac)) * (-reg165)) ^~ ((reg164 + wire153) ?
                      (wire159 ? reg169 : wire155) : ((8'hb9) + reg165)))));
              reg173 <= wire154[(1'h0):(1'h0)];
              reg174 <= ((~|(8'h9f)) ?
                  {wire160[(4'h9):(3'h7)],
                      (reg168[(3'h7):(2'h3)] - (~|(reg168 * reg171)))} : $signed(((wire153 + (8'hb3)) ?
                      {(wire153 ? (8'hb7) : reg172),
                          $signed(reg173)} : (+reg170))));
              reg175 <= (reg165[(2'h2):(2'h2)] ?
                  wire159 : (~^(wire156 ?
                      $unsigned((^~wire159)) : ($unsigned((8'ha4)) >> (!reg173)))));
            end
          else
            begin
              reg172 <= wire160;
              reg173 <= reg162[(2'h3):(2'h3)];
              reg174 <= $signed(($unsigned(((~&reg175) && $signed(wire153))) != $unsigned(reg175)));
            end
        end
      reg176 <= (&$unsigned(($unsigned($unsigned(reg173)) ?
          reg172[(4'ha):(3'h7)] : (reg169 && ((8'h9c) << (8'hb1))))));
      reg177 <= $signed(((($unsigned(wire161) & (-(8'hbf))) + (~^(wire156 == wire156))) ?
          {($unsigned(reg168) <= $unsigned(reg170)),
              $unsigned((-reg170))} : (~reg172[(1'h0):(1'h0)])));
      reg178 <= (((((+(8'hab)) + (reg164 != reg165)) - (reg172 ?
                  $unsigned(wire153) : (reg173 != wire153))) ?
              (((~&reg175) ^ reg174[(3'h4):(3'h4)]) >= (8'ha0)) : $unsigned({reg172,
                  wire154[(3'h6):(3'h5)]})) ?
          (wire159 <<< (8'hba)) : reg168[(4'h9):(2'h3)]);
    end
  assign wire179 = (8'hb9);
  assign wire180 = (wire161 ?
                       reg178 : (reg167[(1'h1):(1'h0)] ?
                           reg170[(1'h1):(1'h0)] : $unsigned(($signed(reg163) ^~ {reg173}))));
  always
    @(posedge clk) begin
      if (((~|wire161[(2'h2):(1'h1)]) != ((wire157[(3'h5):(2'h3)] ?
              reg167 : $unsigned(reg168)) ?
          $signed(((wire179 ~^ reg173) >= (~&(8'ha9)))) : wire154[(3'h5):(1'h1)])))
        begin
          reg181 <= ($signed(wire156[(3'h5):(2'h2)]) ?
              ((+(((8'hb3) ~^ wire160) ?
                  (reg177 ?
                      wire159 : reg169) : wire155[(2'h2):(2'h2)])) ^ $unsigned(reg171)) : reg163);
        end
      else
        begin
          reg181 <= (~((((reg168 ? wire153 : wire153) ?
                  {wire156} : $signed(wire154)) ?
              reg178 : $unsigned({reg181})) || ($unsigned(reg163) < reg173[(4'hc):(4'h8)])));
          reg182 <= (~&reg172[(3'h4):(3'h4)]);
          if ((^((~^$unsigned((reg176 || reg182))) <<< wire153[(4'ha):(2'h2)])))
            begin
              reg183 <= {($unsigned($unsigned((reg169 ^ reg168))) ?
                      $signed((^~reg165)) : $signed($signed($signed(reg173)))),
                  $signed(wire161[(2'h3):(1'h0)])};
              reg184 <= (|($signed(((wire157 ? wire160 : reg163) ?
                      reg172 : $signed(reg176))) ?
                  {(wire179[(4'h8):(4'h8)] >> $unsigned((8'hb4)))} : (reg182[(1'h0):(1'h0)] << ((reg175 ?
                          reg173 : reg162) ?
                      (8'ha8) : $unsigned((8'ha7))))));
              reg185 <= {(reg162 && $signed((wire160 ?
                      $signed((8'ha6)) : (~reg174)))),
                  $unsigned((^reg172))};
              reg186 <= reg175[(2'h3):(2'h3)];
              reg187 <= $unsigned((($signed(reg183[(2'h2):(1'h1)]) > $signed((wire160 >> reg177))) ^~ $signed((8'ha5))));
            end
          else
            begin
              reg183 <= reg176;
              reg184 <= $signed(({($unsigned(reg173) + (8'ha2)),
                      $signed(reg187)} ?
                  wire180 : $signed((-(|reg173)))));
              reg185 <= ({($unsigned((reg167 * (8'hb2))) + (reg167 - reg186[(3'h4):(1'h0)])),
                      (reg170 ?
                          $unsigned($signed(reg167)) : reg176[(2'h2):(1'h0)])} ?
                  ({(~^(wire154 ? reg186 : reg183)),
                      $unsigned(wire158[(1'h0):(1'h0)])} > reg163) : {(((wire156 ?
                              reg169 : (8'ha8)) ^ {(8'ha9)}) ?
                          {(wire157 <<< reg167)} : reg168)});
              reg186 <= reg177[(2'h3):(1'h1)];
            end
          reg188 <= $unsigned((reg169 == $unsigned((+{reg163}))));
        end
      reg189 <= {reg170,
          {((reg164 ? $signed(wire161) : (reg186 == reg166)) <<< ((reg177 ?
                      wire160 : reg172) ?
                  (reg181 != wire153) : (|(8'hba)))),
              $signed(wire179)}};
    end
  always
    @(posedge clk) begin
      reg190 <= {$signed((~|((reg168 ?
              reg181 : reg166) || wire160[(4'hc):(3'h5)])))};
    end
endmodule

module module115
#(parameter param148 = (&(&(&(^(+(8'h9c)))))), 
parameter param149 = param148)
(y, clk, wire119, wire118, wire117, wire116);
  output wire [(32'h13f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire119;
  input wire [(4'h9):(1'h0)] wire118;
  input wire signed [(2'h3):(1'h0)] wire117;
  input wire signed [(3'h4):(1'h0)] wire116;
  wire signed [(4'hf):(1'h0)] wire147;
  wire [(4'hb):(1'h0)] wire146;
  wire [(4'hf):(1'h0)] wire145;
  wire signed [(5'h11):(1'h0)] wire144;
  wire [(2'h2):(1'h0)] wire143;
  wire [(2'h3):(1'h0)] wire142;
  wire signed [(5'h15):(1'h0)] wire141;
  wire [(5'h14):(1'h0)] wire140;
  wire signed [(3'h4):(1'h0)] wire139;
  wire signed [(4'h8):(1'h0)] wire138;
  wire signed [(3'h6):(1'h0)] wire137;
  wire [(4'h8):(1'h0)] wire136;
  wire signed [(3'h6):(1'h0)] wire135;
  wire signed [(3'h4):(1'h0)] wire134;
  wire signed [(5'h15):(1'h0)] wire133;
  wire [(5'h14):(1'h0)] wire132;
  wire [(5'h14):(1'h0)] wire131;
  wire [(5'h15):(1'h0)] wire129;
  wire signed [(4'he):(1'h0)] wire128;
  wire [(5'h15):(1'h0)] wire127;
  reg [(2'h3):(1'h0)] reg130 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg126 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg125 = (1'h0);
  reg [(2'h3):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg123 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg121 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg120 = (1'h0);
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
                 wire137,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire129,
                 wire128,
                 wire127,
                 reg130,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg120 <= ({(wire117 ?
                  (((8'ha5) ? wire116 : wire117) ?
                      (wire117 ^ wire117) : $signed(wire117)) : {$unsigned(wire116),
                      $signed(wire119)}),
              (((^(8'ha3)) ? wire119[(5'h15):(5'h11)] : (wire117 == (8'hbf))) ?
                  $signed((wire116 ?
                      wire117 : wire117)) : $unsigned(wire118[(1'h1):(1'h1)]))} ?
          ((^(wire117 ?
              (wire118 ?
                  (8'hb3) : (8'hbf)) : (~&wire118))) != $unsigned($unsigned($signed(wire119)))) : wire117);
      reg121 <= ($unsigned($signed((reg120 ?
          wire118[(3'h7):(3'h6)] : wire117[(2'h3):(1'h0)]))) + $signed({$unsigned((~|(8'hb9))),
          (wire119 ? (~&wire116) : (wire116 >= wire116))}));
      if ((($signed(wire116[(1'h1):(1'h1)]) <= (&(+wire116[(2'h2):(2'h2)]))) ?
          $signed(reg121) : (wire119 ?
              $unsigned($unsigned((~wire117))) : ($unsigned($signed(wire116)) != $signed((^~reg121))))))
        begin
          reg122 <= $signed((wire118[(3'h4):(3'h4)] ?
              $signed($signed((reg120 ?
                  wire119 : reg121))) : {((~|wire118) != $signed(wire116))}));
        end
      else
        begin
          reg122 <= (((8'hb0) ?
                  $signed((~^wire116)) : (($unsigned(wire118) & $unsigned(wire119)) && $unsigned($unsigned((7'h41))))) ?
              (wire116 ?
                  $signed(reg122) : reg120[(3'h7):(3'h4)]) : $signed($unsigned((^~(reg121 && reg122)))));
          reg123 <= reg121[(1'h1):(1'h0)];
          reg124 <= ((8'h9f) ?
              reg120[(3'h7):(3'h4)] : $signed(reg121[(4'ha):(4'h9)]));
          reg125 <= ((wire117 | $unsigned({(reg120 ? wire116 : wire116)})) ?
              ((&wire118) && wire119[(4'h9):(4'h8)]) : reg121[(2'h2):(1'h1)]);
          reg126 <= ({$unsigned($unsigned(wire119))} ?
              ((8'ha6) < wire119[(4'h8):(3'h4)]) : ((((reg121 >>> reg122) != $unsigned(reg124)) - ({reg121} ?
                  $unsigned(reg121) : (wire119 | wire117))) <= {(~&$signed(wire116)),
                  $signed({wire118, wire119})}));
        end
    end
  assign wire127 = (~(8'hb2));
  assign wire128 = reg125[(2'h3):(2'h3)];
  assign wire129 = $signed($signed((~^wire117[(2'h3):(1'h1)])));
  always
    @(posedge clk) begin
      reg130 <= {reg123[(4'he):(4'hc)],
          ((|$signed(wire116[(2'h2):(2'h2)])) && $unsigned((&$signed(wire117))))};
    end
  assign wire131 = ({(wire128 == (+$unsigned(wire117)))} | (($signed(wire128[(3'h4):(3'h4)]) ?
                       wire118[(2'h2):(1'h0)] : (reg130[(2'h2):(1'h0)] <<< wire117[(2'h3):(2'h3)])) < (^($unsigned(reg122) + wire119))));
  assign wire132 = wire118[(3'h7):(2'h2)];
  assign wire133 = (!wire131);
  assign wire134 = {wire127};
  assign wire135 = ((~^((-(&wire119)) >>> wire132[(1'h0):(1'h0)])) ?
                       reg125 : wire132);
  assign wire136 = ($unsigned($unsigned(reg123)) <<< ($unsigned($signed(reg124)) || $signed(wire133)));
  assign wire137 = $unsigned((-reg122));
  assign wire138 = $unsigned($unsigned(((wire131[(3'h7):(3'h6)] ~^ wire119[(5'h15):(2'h3)]) ?
                       wire127[(5'h15):(1'h1)] : reg120)));
  assign wire139 = wire133;
  assign wire140 = $unsigned(reg123);
  assign wire141 = (~^$unsigned((wire139 >> reg126)));
  assign wire142 = reg120[(3'h5):(3'h4)];
  assign wire143 = (^~((((wire135 ? wire131 : reg123) ?
                           $signed(wire139) : {wire118}) >>> $unsigned($signed((8'hb0)))) ?
                       {wire128,
                           (((8'hb4) ?
                               reg125 : reg122) + wire127[(3'h5):(3'h5)])} : (($unsigned(wire134) <<< $unsigned(wire133)) ?
                           reg124 : wire128[(4'hb):(1'h0)])));
  assign wire144 = (wire143 ?
                       $unsigned(((reg122 ?
                           (wire127 >= (8'ha4)) : {reg126,
                               wire117}) & $unsigned(wire128))) : $unsigned(reg130));
  assign wire145 = ($signed(({wire117[(2'h2):(1'h1)]} ?
                       (~&(reg121 << reg123)) : {{(8'hb1), wire134},
                           (wire129 ? wire128 : wire131)})) <<< wire119);
  assign wire146 = $unsigned(wire135[(1'h0):(1'h0)]);
  assign wire147 = $signed((wire139[(2'h3):(1'h0)] ^ reg130));
endmodule
