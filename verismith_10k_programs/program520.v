module top
#(parameter param104 = (((^~{((7'h42) ? (8'h9d) : (8'ha8)), ((8'hbc) ? (8'hbb) : (8'ha8))}) ? ((((8'hb5) || (8'hac)) ? (8'ha1) : {(7'h41)}) ? (&((8'hb5) ? (8'h9f) : (8'h9c))) : {(!(7'h44)), ((7'h40) ? (8'ha0) : (8'hbd))}) : (&(^~(-(8'ha2))))) ? (-(~|(~|((7'h44) ? (8'ha2) : (8'hbe))))) : {(~&((7'h44) == ((8'hb6) || (8'hb6)))), (+((~^(8'h9f)) ? (~(8'hbb)) : ((8'ha6) > (8'hb8))))}))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h149):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire3;
  wire [(4'hd):(1'h0)] wire91;
  wire signed [(4'hb):(1'h0)] wire90;
  wire signed [(5'h14):(1'h0)] wire85;
  wire [(4'hb):(1'h0)] wire84;
  wire signed [(4'ha):(1'h0)] wire83;
  wire signed [(5'h14):(1'h0)] wire82;
  wire signed [(3'h5):(1'h0)] wire4;
  wire signed [(2'h2):(1'h0)] wire8;
  wire signed [(5'h15):(1'h0)] wire9;
  wire [(4'h9):(1'h0)] wire10;
  wire signed [(4'hf):(1'h0)] wire11;
  wire signed [(5'h14):(1'h0)] wire80;
  reg signed [(2'h2):(1'h0)] reg103 = (1'h0);
  reg [(4'h8):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg101 = (1'h0);
  reg [(4'ha):(1'h0)] reg100 = (1'h0);
  reg [(2'h3):(1'h0)] reg99 = (1'h0);
  reg [(4'hb):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg97 = (1'h0);
  reg [(4'hc):(1'h0)] reg96 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg95 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg94 = (1'h0);
  reg [(2'h3):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg92 = (1'h0);
  reg [(4'hc):(1'h0)] reg89 = (1'h0);
  reg [(4'h8):(1'h0)] reg88 = (1'h0);
  reg [(2'h3):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg86 = (1'h0);
  reg signed [(4'he):(1'h0)] reg5 = (1'h0);
  reg [(4'hc):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg7 = (1'h0);
  assign y = {wire91,
                 wire90,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire4,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire80,
                 reg103,
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
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg5,
                 reg6,
                 reg7,
                 (1'h0)};
  assign wire4 = (^~(~^wire2));
  always
    @(posedge clk) begin
      reg5 <= $unsigned(wire2[(1'h1):(1'h0)]);
      reg6 <= $unsigned(wire3[(4'h8):(3'h7)]);
      reg7 <= $unsigned(((((reg6 << reg6) >= wire0) ?
          wire0[(3'h7):(1'h1)] : reg5[(4'ha):(2'h3)]) * reg5[(4'h9):(3'h4)]));
    end
  assign wire8 = wire2;
  assign wire9 = (~&($signed($signed(wire3)) ~^ (|wire4[(3'h5):(1'h1)])));
  assign wire10 = (($signed({$unsigned((8'h9f)), (reg6 ^~ wire4)}) ~^ {wire8}) ?
                      (~reg7[(2'h2):(1'h1)]) : wire8);
  assign wire11 = (8'hba);
  module12 #() modinst81 (.wire14(reg7), .y(wire80), .wire16(wire4), .clk(clk), .wire13(wire10), .wire15(wire11));
  assign wire82 = (8'ha5);
  assign wire83 = $unsigned($signed((+wire0[(4'hc):(2'h2)])));
  assign wire84 = wire0;
  assign wire85 = ($unsigned($signed(((|wire8) ?
                      (~&wire8) : $signed((8'ha1))))) - {$unsigned($unsigned(wire84[(4'h8):(1'h1)]))});
  always
    @(posedge clk) begin
      reg86 <= (($signed((((8'h9c) ?
              wire10 : reg5) ^ (wire4 < wire3))) != {wire8}) ?
          reg5 : $unsigned(wire9));
      reg87 <= wire11;
      reg88 <= $signed((($signed((^wire0)) ? (-{wire82, wire83}) : (8'hb7)) ?
          (~^{(^wire0)}) : reg7[(4'h8):(2'h2)]));
      reg89 <= (^~{(reg6[(4'h8):(3'h7)] ?
              reg5[(3'h5):(1'h0)] : wire9[(5'h12):(4'h9)])});
    end
  assign wire90 = (($signed(wire80) ?
                          ((~&(reg88 ? wire0 : wire82)) ?
                              ((!(8'hba)) ?
                                  $unsigned((8'hbd)) : $unsigned(reg6)) : wire10[(3'h7):(2'h3)]) : ((wire2 <= wire84[(4'hb):(1'h0)]) ?
                              $signed(wire8) : $unsigned((wire9 ?
                                  wire2 : (8'hae))))) ?
                      $unsigned(($unsigned((reg89 > wire80)) ?
                          (8'hab) : $signed((!wire9)))) : ((($unsigned(reg5) ?
                          (wire82 ?
                              wire8 : reg86) : $unsigned(wire3)) >= (~&(reg88 * wire10))) + ({$signed(wire84),
                              $signed((7'h42))} ?
                          wire9[(3'h6):(3'h6)] : (8'h9e))));
  assign wire91 = wire4[(3'h4):(3'h4)];
  always
    @(posedge clk) begin
      if ($unsigned((~^(&(-$unsigned(wire4))))))
        begin
          reg92 <= wire3;
          reg93 <= ((~^(~|wire84)) != ($signed(((wire85 ? wire10 : wire0) ?
                  (wire11 ? wire9 : wire80) : wire90)) ?
              $signed($signed((&reg87))) : (~|$unsigned($unsigned(reg92)))));
          reg94 <= reg86;
          reg95 <= $signed(((reg88 ?
                  (wire90[(3'h4):(1'h1)] ?
                      ((8'ha5) >= wire9) : $signed((8'ha5))) : $signed($signed(wire91))) ?
              ($signed($unsigned(reg89)) >> $unsigned($signed(wire2))) : $signed(wire9)));
        end
      else
        begin
          if ($signed((7'h42)))
            begin
              reg92 <= {$signed(reg95[(3'h5):(2'h3)]), reg92[(1'h0):(1'h0)]};
              reg93 <= wire10;
              reg94 <= ((($signed((reg6 ? wire1 : reg89)) >= (+wire90)) ?
                  (-((+(7'h42)) ?
                      $unsigned((8'h9f)) : (~|(8'hbf)))) : $signed($signed((reg94 <= (8'ha8))))) | ((({(7'h41),
                          reg7} ?
                      reg93[(1'h1):(1'h1)] : $signed(wire83)) >> {wire85}) ?
                  $signed((wire90[(1'h1):(1'h1)] <<< $signed(wire80))) : wire80));
              reg95 <= ($unsigned((($unsigned(reg88) > (wire83 + (7'h41))) ^~ reg87[(1'h0):(1'h0)])) & wire3[(4'ha):(4'ha)]);
              reg96 <= ({wire8[(2'h2):(1'h1)],
                  reg5} != $signed((~|$unsigned($signed(reg6)))));
            end
          else
            begin
              reg92 <= (~&reg6[(4'hb):(3'h4)]);
              reg93 <= (wire2[(1'h0):(1'h0)] == wire83[(2'h3):(2'h3)]);
              reg94 <= ($signed(wire2[(1'h1):(1'h1)]) ?
                  {reg88,
                      $unsigned({(reg88 ? reg89 : wire8),
                          reg7})} : ((~&(+{reg89})) ?
                      (8'hae) : {$unsigned($signed(wire80)),
                          ($signed(reg7) ? {wire85} : (reg94 >= reg96))}));
            end
          if ($signed(({(~|{reg5, wire82}), wire10} ?
              $signed((^wire83)) : $signed($unsigned((wire1 + reg86))))))
            begin
              reg97 <= reg6;
              reg98 <= $signed($unsigned({$signed((reg96 <<< reg89))}));
              reg99 <= (wire10[(2'h3):(2'h3)] ?
                  wire10 : $signed({$unsigned(reg89), {$signed(reg95)}}));
            end
          else
            begin
              reg97 <= reg93[(1'h0):(1'h0)];
              reg98 <= reg95;
              reg99 <= ((~|$unsigned(($signed(wire3) - (~^wire3)))) ?
                  wire10[(3'h6):(3'h5)] : (reg98[(2'h3):(1'h1)] ?
                      (~&((|wire4) && {reg93,
                          (8'hab)})) : $signed($unsigned((wire80 | wire3)))));
            end
          reg100 <= ((reg86 <= reg86[(4'h8):(2'h2)]) < ((8'ha3) ?
              reg7 : wire8));
          reg101 <= ($signed(reg7) - $signed(({reg6, (wire1 ? wire83 : reg99)} ?
              $signed(reg97) : reg98)));
          reg102 <= (((($unsigned(wire0) - (wire85 ?
              reg99 : wire0)) | ({(8'h9f), reg96} ?
              reg100 : ((8'hbf) <<< wire1))) > $unsigned(((wire84 ?
              reg86 : reg5) && (~|(8'ha7))))) < reg100[(2'h3):(1'h1)]);
        end
    end
  always
    @(posedge clk) begin
      reg103 <= (((~^$signed($unsigned(wire1))) ^ (wire10[(3'h6):(2'h2)] ~^ reg92[(3'h6):(2'h2)])) + (~|(^wire4[(2'h3):(2'h2)])));
    end
endmodule

module module12
#(parameter param79 = (+(8'hbe)))
(y, clk, wire13, wire14, wire15, wire16);
  output wire [(32'h23b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire13;
  input wire signed [(2'h2):(1'h0)] wire14;
  input wire [(4'hf):(1'h0)] wire15;
  input wire [(2'h2):(1'h0)] wire16;
  wire [(3'h6):(1'h0)] wire78;
  wire signed [(4'ha):(1'h0)] wire77;
  wire [(5'h11):(1'h0)] wire66;
  wire [(4'h8):(1'h0)] wire65;
  wire signed [(5'h13):(1'h0)] wire64;
  wire [(3'h5):(1'h0)] wire63;
  wire signed [(2'h2):(1'h0)] wire62;
  wire [(5'h13):(1'h0)] wire61;
  wire [(5'h10):(1'h0)] wire60;
  wire signed [(4'hd):(1'h0)] wire17;
  wire signed [(3'h7):(1'h0)] wire18;
  wire signed [(4'he):(1'h0)] wire22;
  wire [(4'hf):(1'h0)] wire23;
  wire signed [(4'he):(1'h0)] wire37;
  wire signed [(5'h10):(1'h0)] wire38;
  wire signed [(4'h8):(1'h0)] wire58;
  reg signed [(5'h14):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg74 = (1'h0);
  reg [(5'h11):(1'h0)] reg73 = (1'h0);
  reg [(5'h14):(1'h0)] reg72 = (1'h0);
  reg [(5'h14):(1'h0)] reg71 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg68 = (1'h0);
  reg [(5'h15):(1'h0)] reg67 = (1'h0);
  reg [(5'h14):(1'h0)] reg36 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg35 = (1'h0);
  reg [(4'hc):(1'h0)] reg34 = (1'h0);
  reg [(4'hd):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg32 = (1'h0);
  reg [(4'hb):(1'h0)] reg31 = (1'h0);
  reg [(3'h4):(1'h0)] reg30 = (1'h0);
  reg [(3'h6):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg26 = (1'h0);
  reg [(5'h13):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg24 = (1'h0);
  reg [(4'h9):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg19 = (1'h0);
  assign y = {wire78,
                 wire77,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire17,
                 wire18,
                 wire22,
                 wire23,
                 wire37,
                 wire38,
                 wire58,
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
                 reg26,
                 reg25,
                 reg24,
                 reg21,
                 reg20,
                 reg19,
                 (1'h0)};
  assign wire17 = ($unsigned(wire16[(2'h2):(2'h2)]) ?
                      $unsigned(($signed((8'hb9)) <<< (~$signed(wire16)))) : {$unsigned({wire15,
                              (wire16 >>> (8'hbc))})});
  assign wire18 = $unsigned(({wire15[(3'h7):(2'h2)]} ?
                      wire17[(1'h1):(1'h1)] : $unsigned((~|(wire13 ?
                          wire15 : wire13)))));
  always
    @(posedge clk) begin
      reg19 <= ((+wire15) ?
          (8'haa) : ($unsigned($unsigned($unsigned(wire13))) ?
              ({(wire18 == (8'ha4))} <<< (^$signed((8'hb9)))) : (wire17[(4'hd):(4'h8)] ?
                  wire16 : ((^wire16) ? (+wire14) : wire17[(4'hb):(3'h7)]))));
      reg20 <= wire15;
      reg21 <= wire14;
    end
  assign wire22 = (+reg19[(4'hb):(3'h4)]);
  assign wire23 = ($unsigned($signed($signed((!reg19)))) != (^~(+wire15[(4'ha):(3'h4)])));
  always
    @(posedge clk) begin
      reg24 <= {$signed(((~(reg19 & reg19)) ?
              $signed((wire14 < wire15)) : wire18)),
          (((!(&wire17)) ?
              {$unsigned(wire15),
                  (wire15 ?
                      (8'ha0) : (8'hbf))} : $signed($signed(wire17))) >= (((reg20 ?
                  (7'h44) : wire18) ?
              wire15 : (~wire14)) + reg20[(4'hd):(2'h3)]))};
      reg25 <= $signed(({$unsigned((~|wire13))} + $unsigned(reg20)));
      reg26 <= wire13[(1'h0):(1'h0)];
      if ({wire18})
        begin
          if ($signed($signed((~^$unsigned(wire14)))))
            begin
              reg27 <= ($signed({(wire15[(4'he):(3'h5)] ?
                          (reg20 <<< wire15) : (|reg20)),
                      ((reg26 ? reg25 : wire23) ?
                          $unsigned(reg19) : $signed(reg24))}) ?
                  ((((wire15 < reg24) * (reg20 ? wire13 : wire17)) ?
                      $signed((reg20 && reg21)) : {$unsigned(wire16)}) > (~(-$signed((8'ha0))))) : (!reg25));
            end
          else
            begin
              reg27 <= (reg26 ? wire18 : (8'ha1));
            end
          reg28 <= ($unsigned(({(wire23 ? wire17 : wire23), $unsigned(reg26)} ?
              {$signed(reg26),
                  $unsigned(reg20)} : (reg19[(5'h11):(2'h3)] + $signed(reg19)))) * (~{($unsigned(reg19) ?
                  $unsigned(wire23) : wire18[(1'h1):(1'h0)]),
              reg24[(3'h4):(1'h1)]}));
          if ($signed(wire23))
            begin
              reg29 <= ((($unsigned(reg28[(4'h8):(1'h1)]) ?
                      (+reg25) : reg19) ^ (|({reg24} ?
                      reg26[(4'h8):(3'h7)] : $unsigned(wire17)))) ?
                  (~$signed($unsigned((wire18 ?
                      wire18 : wire16)))) : (&(-$unsigned(((8'hae) == (7'h40))))));
            end
          else
            begin
              reg29 <= ({reg20[(5'h12):(5'h10)],
                  (wire14[(1'h0):(1'h0)] <= (~&$signed(wire18)))} + $signed($unsigned((~&(wire15 ?
                  reg29 : (8'ha9))))));
              reg30 <= $signed((((((8'hba) >> reg29) ?
                      $signed((8'hbd)) : {(8'hbf)}) ?
                  ((!wire17) ?
                      $unsigned(reg29) : ((8'hba) ?
                          wire18 : wire18)) : wire17[(4'h9):(3'h6)]) <= $unsigned({{(7'h44),
                      (8'hbd)}})));
              reg31 <= ($signed($signed($unsigned($signed((8'ha7))))) ?
                  (((8'ha5) ?
                          (reg24[(3'h6):(3'h4)] >>> $unsigned(reg19)) : reg25[(1'h1):(1'h1)]) ?
                      $unsigned($signed(wire16)) : ($signed(reg21[(3'h4):(3'h4)]) << {wire17,
                          (^reg25)})) : {wire15[(4'hd):(3'h7)]});
              reg32 <= $unsigned($unsigned($signed((reg31[(3'h5):(3'h5)] ?
                  (wire17 >= reg19) : $unsigned(reg31)))));
              reg33 <= {(^~($signed((|reg30)) >>> ({(8'h9f)} >= (reg27 ?
                      reg25 : reg30))))};
            end
          reg34 <= $unsigned(reg20);
          reg35 <= reg24[(2'h2):(1'h1)];
        end
      else
        begin
          reg27 <= $signed(($unsigned({(~^(8'hb9)),
              reg32[(3'h6):(1'h0)]}) << reg24));
        end
      reg36 <= reg24[(3'h5):(1'h1)];
    end
  assign wire37 = $unsigned(((-$signed((reg20 ? reg34 : reg29))) ?
                      $signed($unsigned((7'h40))) : $signed($unsigned($unsigned((8'hae))))));
  assign wire38 = $unsigned($unsigned((~&(^(reg33 <<< reg25)))));
  module39 #() modinst59 (wire58, clk, reg34, reg25, reg27, wire37, reg24);
  assign wire60 = (~wire13);
  assign wire61 = reg24;
  assign wire62 = $signed(($unsigned(($signed(reg25) ?
                      (8'ha1) : (^wire61))) <<< wire17[(4'h9):(3'h7)]));
  assign wire63 = wire13[(2'h3):(2'h3)];
  assign wire64 = reg20;
  assign wire65 = {{(((wire13 ?
                              reg31 : reg25) != reg21[(3'h4):(1'h0)]) > $signed((~^wire18))),
                          wire16[(1'h0):(1'h0)]},
                      reg30[(3'h4):(3'h4)]};
  assign wire66 = wire60[(3'h7):(1'h0)];
  always
    @(posedge clk) begin
      reg67 <= reg25;
      reg68 <= ((^{wire16[(2'h2):(2'h2)]}) <= {((~^(8'ha5)) ?
              wire65 : $signed((!reg36))),
          (!(!$signed(wire17)))});
      if ($unsigned($unsigned($unsigned($unsigned(wire65[(1'h1):(1'h0)])))))
        begin
          reg69 <= (|(reg21 ?
              $unsigned(((^~reg28) ?
                  $signed(reg20) : reg24[(1'h0):(1'h0)])) : reg67));
          if ($signed($unsigned($unsigned(reg67[(5'h10):(2'h3)]))))
            begin
              reg70 <= $signed((7'h44));
              reg71 <= (-(8'hbb));
            end
          else
            begin
              reg70 <= $unsigned(($signed(wire62) == $unsigned((&(~^reg26)))));
              reg71 <= reg24[(1'h0):(1'h0)];
            end
          reg72 <= $unsigned(wire60);
          reg73 <= (8'ha0);
          if ((-$signed($unsigned({(8'ha8), (~reg26)}))))
            begin
              reg74 <= reg19;
            end
          else
            begin
              reg74 <= $unsigned(((reg32 && {wire65[(1'h1):(1'h0)],
                  reg30}) <<< {({reg24, wire60} ?
                      reg69[(3'h7):(3'h5)] : (reg68 >> (8'hac)))}));
              reg75 <= $signed(reg35[(1'h0):(1'h0)]);
            end
        end
      else
        begin
          reg69 <= (|{$unsigned((reg34[(1'h1):(1'h1)] ? {wire37} : (~|wire15))),
              wire63[(3'h4):(2'h3)]});
          reg70 <= $unsigned($unsigned(reg24[(3'h6):(3'h5)]));
        end
      reg76 <= reg24[(1'h1):(1'h0)];
    end
  assign wire77 = ((($signed(wire63) ? reg75 : $signed($unsigned(reg29))) ?
                          {(-wire17[(1'h0):(1'h0)]),
                              ((reg69 ? wire65 : reg32) ?
                                  (wire64 - (8'haa)) : reg75)} : ($unsigned(reg68[(5'h12):(1'h1)]) ?
                              {(reg69 ^~ wire22),
                                  (reg24 ~^ reg75)} : {wire16[(2'h2):(2'h2)]})) ?
                      reg24 : $unsigned(((((8'ha6) ? wire65 : wire15) ?
                          {wire58, wire61} : wire17[(4'h9):(2'h2)]) > reg71)));
  assign wire78 = $signed($unsigned(($unsigned($signed(reg31)) & wire37)));
endmodule

module module39
#(parameter param56 = ({((((8'hbe) ? (8'ha9) : (8'hbc)) ? (^~(8'ha5)) : {(7'h42), (8'ha2)}) - {((8'had) == (8'hbb)), ((8'ha6) ? (8'ha9) : (8'ha3))}), ((((8'ha0) || (8'ha4)) ? (!(8'hbf)) : (&(8'hb4))) ? {((8'h9f) << (8'haa))} : (^{(8'h9e), (7'h40)}))} ? ((((8'hae) ? ((8'hb3) ? (7'h41) : (8'hae)) : {(8'hb7), (7'h42)}) != ((~^(8'h9e)) && {(8'ha8)})) ? {(((8'hbb) ? (7'h40) : (8'hba)) << (^~(8'ha0)))} : (~&(((8'h9d) ? (8'hba) : (8'ha5)) ? ((8'h9e) ~^ (8'hb3)) : ((8'hba) > (8'had))))) : (((8'hab) ? ((~^(8'ha6)) ? {(8'ha0), (8'ha4)} : {(8'hab)}) : (|((8'hb0) ~^ (8'hb2)))) ? (((~|(8'ha4)) ? {(8'hb6), (8'had)} : ((8'h9d) ? (8'ha1) : (8'ha2))) ? (((7'h43) ? (8'hbe) : (7'h40)) ? ((8'ha9) ? (8'hac) : (8'ha9)) : ((8'h9f) ? (8'had) : (8'hab))) : (((8'hb9) ? (8'hac) : (7'h44)) && ((7'h43) * (8'hba)))) : {(((8'hae) - (8'ha7)) ? (~&(8'haf)) : {(8'hb6), (8'h9f)}), (&((8'h9d) || (8'hbf)))})), 
parameter param57 = (((^~param56) ? (~&((+param56) ^ {param56, param56})) : ((7'h41) ? (^~(~^(8'hb5))) : (^(param56 ? param56 : (7'h43))))) ? (((param56 & param56) - (param56 ? (param56 ? param56 : param56) : param56)) && (&param56)) : (!param56)))
(y, clk, wire44, wire43, wire42, wire41, wire40);
  output wire [(32'h75):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire44;
  input wire [(4'hd):(1'h0)] wire43;
  input wire [(5'h15):(1'h0)] wire42;
  input wire signed [(4'he):(1'h0)] wire41;
  input wire [(3'h6):(1'h0)] wire40;
  wire signed [(3'h5):(1'h0)] wire55;
  wire signed [(3'h4):(1'h0)] wire54;
  wire signed [(3'h4):(1'h0)] wire53;
  wire [(4'h9):(1'h0)] wire52;
  wire [(4'h9):(1'h0)] wire51;
  wire [(5'h13):(1'h0)] wire47;
  wire [(4'he):(1'h0)] wire46;
  wire signed [(5'h15):(1'h0)] wire45;
  reg signed [(4'hf):(1'h0)] reg50 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg49 = (1'h0);
  reg [(3'h7):(1'h0)] reg48 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire47,
                 wire46,
                 wire45,
                 reg50,
                 reg49,
                 reg48,
                 (1'h0)};
  assign wire45 = wire44;
  assign wire46 = wire42;
  assign wire47 = (8'hbf);
  always
    @(posedge clk) begin
      reg48 <= $unsigned($unsigned($unsigned((wire47 ?
          wire47[(4'h8):(3'h5)] : ((7'h44) > wire41)))));
      reg49 <= wire46[(4'hb):(3'h4)];
      reg50 <= reg49[(2'h3):(1'h1)];
    end
  assign wire51 = $signed($unsigned($signed((~|$unsigned(wire40)))));
  assign wire52 = (({$signed($unsigned(wire47))} ?
                          {wire45, wire47} : {((wire43 ^ wire41) ?
                                  wire40 : wire43[(4'ha):(4'h9)]),
                              $unsigned({wire44})}) ?
                      (!(^$unsigned($unsigned(wire42)))) : wire47[(5'h10):(1'h1)]);
  assign wire53 = reg50[(1'h0):(1'h0)];
  assign wire54 = wire53;
  assign wire55 = {($unsigned($signed((~&(8'ha4)))) || $unsigned({wire45[(3'h5):(1'h0)],
                          $unsigned(wire53)}))};
endmodule
