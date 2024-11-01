module top
#(parameter param381 = ({((((8'ha1) * (8'ha4)) <<< ((8'hb3) - (8'haa))) ? (((8'ha5) ^~ (8'h9e)) >= ((8'hb0) << (8'ha6))) : {(8'hbe), (&(8'hb3))}), (((~^(8'ha4)) ? ((7'h44) ? (7'h44) : (8'h9c)) : {(8'ha9)}) ? (~|(!(8'h9c))) : (((8'ha7) <= (8'ha4)) <<< (~|(8'ha5))))} && ({(&((8'hb6) + (8'hb0)))} ^ {(((8'hb6) < (8'haf)) == ((8'hb9) ? (8'hb2) : (8'h9f)))})))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1f2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire4;
  wire signed [(3'h5):(1'h0)] wire380;
  wire [(4'he):(1'h0)] wire362;
  wire [(5'h13):(1'h0)] wire361;
  wire [(4'he):(1'h0)] wire5;
  wire [(3'h4):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire8;
  wire [(5'h15):(1'h0)] wire9;
  wire signed [(3'h4):(1'h0)] wire10;
  wire signed [(5'h15):(1'h0)] wire127;
  wire signed [(5'h11):(1'h0)] wire129;
  wire signed [(5'h14):(1'h0)] wire131;
  wire signed [(5'h14):(1'h0)] wire132;
  wire [(5'h10):(1'h0)] wire354;
  wire signed [(4'hd):(1'h0)] wire356;
  wire signed [(5'h15):(1'h0)] wire357;
  wire signed [(3'h6):(1'h0)] wire359;
  reg signed [(4'hc):(1'h0)] reg379 = (1'h0);
  reg [(4'he):(1'h0)] reg378 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg377 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg376 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg375 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg374 = (1'h0);
  reg [(5'h12):(1'h0)] reg373 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg372 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg371 = (1'h0);
  reg [(3'h4):(1'h0)] reg370 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg369 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg368 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg367 = (1'h0);
  reg [(4'hf):(1'h0)] reg366 = (1'h0);
  reg [(2'h3):(1'h0)] reg365 = (1'h0);
  reg [(4'hd):(1'h0)] reg364 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg363 = (1'h0);
  reg [(5'h15):(1'h0)] reg130 = (1'h0);
  assign y = {wire380,
                 wire362,
                 wire361,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire127,
                 wire129,
                 wire131,
                 wire132,
                 wire354,
                 wire356,
                 wire357,
                 wire359,
                 reg379,
                 reg378,
                 reg377,
                 reg376,
                 reg375,
                 reg374,
                 reg373,
                 reg372,
                 reg371,
                 reg370,
                 reg369,
                 reg368,
                 reg367,
                 reg366,
                 reg365,
                 reg364,
                 reg363,
                 reg130,
                 (1'h0)};
  assign wire5 = wire3[(2'h2):(1'h0)];
  assign wire6 = $signed(($signed((^((7'h43) <<< wire3))) ?
                     $signed(($unsigned(wire3) >= (wire2 * wire1))) : wire5[(2'h2):(1'h0)]));
  assign wire7 = ((wire4 != {(!(+(8'h9d))), (&$unsigned((8'haf)))}) ?
                     ((wire0[(5'h10):(4'h8)] ~^ wire6[(2'h3):(2'h2)]) ?
                         $unsigned((8'hba)) : {$signed((wire2 ~^ wire1))}) : $unsigned({(8'hbb)}));
  assign wire8 = wire5;
  assign wire9 = $unsigned(wire7);
  assign wire10 = wire8[(4'hd):(4'hb)];
  module11 #() modinst128 (.clk(clk), .wire12(wire2), .wire15(wire9), .y(wire127), .wire14(wire4), .wire13(wire8));
  assign wire129 = ((~|wire0) ?
                       $signed($unsigned($unsigned($unsigned(wire10)))) : (^~wire0[(5'h14):(4'ha)]));
  always
    @(posedge clk) begin
      reg130 <= wire127[(4'hb):(3'h6)];
    end
  assign wire131 = (({$unsigned(wire6[(2'h2):(1'h1)]),
                       wire129[(3'h4):(3'h4)]} >> (wire7[(1'h1):(1'h1)] <= $unsigned((wire6 ?
                       wire1 : wire3)))) <= {wire10, $unsigned((&{reg130}))});
  assign wire132 = ((($signed((8'hb4)) | ($unsigned((8'hb4)) || wire9)) & wire9[(3'h6):(1'h0)]) ?
                       (wire5 | wire1) : wire8[(4'hc):(4'hc)]);
  module133 #() modinst355 (.wire134(wire1), .wire135(wire5), .clk(clk), .wire136(wire127), .y(wire354), .wire137(wire131));
  assign wire356 = $unsigned(($signed((!{wire127,
                       reg130})) != (($unsigned(wire8) * ((8'hb7) ?
                           wire2 : (8'hab))) ?
                       (&$signed(wire10)) : $signed(((8'h9c) ?
                           wire129 : wire7)))));
  module140 #() modinst358 (wire357, clk, wire6, reg130, wire4, wire129, wire2);
  module133 #() modinst360 (wire359, clk, wire132, reg130, wire357, wire129);
  assign wire361 = wire3[(1'h0):(1'h0)];
  assign wire362 = {wire6, wire356[(1'h0):(1'h0)]};
  always
    @(posedge clk) begin
      reg363 <= ({$signed((wire362[(1'h0):(1'h0)] <= {wire127}))} || $signed((($unsigned(wire132) ?
          (wire0 ?
              wire357 : (8'h9e)) : wire4) | $unsigned(wire359[(2'h3):(1'h0)]))));
      reg364 <= $unsigned(wire129[(4'ha):(3'h5)]);
      reg365 <= (((-({wire7, wire361} ? $signed(wire0) : (wire359 * reg363))) ?
              ((wire361 - $unsigned(wire0)) - ((reg130 + wire8) ?
                  $signed(wire129) : wire127[(4'hc):(3'h5)])) : {wire132[(1'h1):(1'h1)],
                  ($signed(wire0) ? (wire129 == wire8) : (reg130 - wire5))}) ?
          $unsigned({(~^wire1)}) : ({$unsigned((7'h41))} ?
              reg130 : ((~|(~&wire2)) >= reg364[(4'ha):(3'h5)])));
      reg366 <= (reg130 ?
          ((~&((+(8'ha4)) + wire2[(1'h1):(1'h1)])) ?
              $signed(wire8[(4'hf):(3'h7)]) : (8'ha6)) : ({wire8,
              {$unsigned(wire361)}} ~^ $unsigned(reg130[(5'h14):(5'h10)])));
    end
  always
    @(posedge clk) begin
      reg367 <= wire0[(4'hd):(2'h2)];
      if ($unsigned((reg363[(1'h1):(1'h1)] >> wire8[(4'hb):(3'h7)])))
        begin
          reg368 <= $signed((|$unsigned($signed($signed(wire129)))));
          reg369 <= $unsigned((wire3[(3'h5):(1'h1)] ?
              $unsigned({$unsigned((8'ha1)),
                  ((8'ha3) ?
                      reg365 : wire357)}) : $unsigned((~^$unsigned((7'h41))))));
          reg370 <= $signed((+wire354[(4'hf):(4'hb)]));
          if (wire5)
            begin
              reg371 <= {wire5,
                  $unsigned((wire361[(4'hc):(4'h9)] ?
                      ($signed(wire7) ?
                          wire361 : reg365) : wire10[(3'h4):(2'h3)]))};
              reg372 <= $unsigned($unsigned((reg367 & (wire132[(5'h14):(3'h7)] ?
                  $signed(wire354) : (reg130 ? wire9 : wire10)))));
              reg373 <= $unsigned($unsigned(($unsigned(wire354[(3'h4):(3'h4)]) < $unsigned($unsigned((8'h9f))))));
              reg374 <= (((~(wire2[(4'hc):(4'h8)] ?
                      wire356 : $unsigned(wire7))) ?
                  $signed($signed((&(8'hba)))) : wire129) > ($signed(wire357) ?
                  $signed(reg130) : (((&wire8) * (wire131 ?
                      wire356 : wire5)) < wire132[(4'hb):(1'h0)])));
            end
          else
            begin
              reg371 <= (^~{reg367});
              reg372 <= (wire131 ?
                  ((wire5 ?
                      wire362[(3'h4):(3'h4)] : $unsigned((~&reg368))) ~^ $unsigned($unsigned((^~(8'hb6))))) : {($signed((|wire362)) ?
                          wire127 : ($unsigned((8'hac)) ?
                              $signed(wire1) : $unsigned(wire1))),
                      $signed((|(wire3 | wire354)))});
            end
        end
      else
        begin
          if (((8'ha0) == ((~|((wire359 ? wire6 : reg368) ?
                  (reg368 ? wire7 : wire127) : $signed(wire131))) ?
              {$signed(wire359), $unsigned({wire131, reg372})} : {(~|(wire6 ?
                      wire362 : reg365)),
                  wire132})))
            begin
              reg368 <= ((reg363 ? wire0 : reg365) >= (((((8'ha1) + reg368) ?
                      (wire359 ?
                          reg367 : reg366) : wire8[(4'h9):(3'h6)]) == wire354[(3'h5):(1'h1)]) ?
                  wire356[(2'h3):(1'h1)] : $unsigned($unsigned(wire359))));
              reg369 <= wire356;
              reg370 <= $unsigned(((|(8'hbb)) ^ ($signed(wire362[(3'h6):(3'h5)]) ?
                  (((8'ha8) ? wire2 : (8'hbf)) || ((8'ha8) ?
                      wire362 : wire127)) : $unsigned($unsigned(reg374)))));
            end
          else
            begin
              reg368 <= (((reg364[(4'ha):(2'h3)] ?
                  $unsigned($unsigned(reg370)) : $unsigned((^wire354))) ^ $signed(wire131[(2'h3):(2'h2)])) ~^ $signed($signed($unsigned((wire0 >>> reg367)))));
              reg369 <= ({$signed(reg374)} ?
                  {(wire1 ?
                          (|((8'hae) >>> wire357)) : reg365[(2'h3):(2'h3)])} : reg369);
              reg370 <= (($signed((wire1 ? $signed(wire127) : wire3)) ?
                  ((8'h9d) ?
                      (wire6 ?
                          reg374 : $signed(reg371)) : wire129) : wire2[(1'h1):(1'h1)]) + (($unsigned(wire359[(1'h1):(1'h1)]) ?
                  {{reg373}, $signed(wire131)} : $unsigned(wire4)) * (((reg371 ?
                      reg363 : wire356) ?
                  reg370 : (|wire131)) < wire131[(4'h8):(4'h8)])));
              reg371 <= (&$signed($unsigned(((^~wire131) ?
                  wire6 : (reg130 != wire354)))));
            end
          reg372 <= (8'hb3);
          reg373 <= reg374[(3'h5):(3'h4)];
          reg374 <= wire132;
        end
      reg375 <= {{$unsigned({wire6[(2'h3):(2'h2)], (|(8'ha9))}),
              (-(!$unsigned(wire132)))},
          (((-$signed(reg365)) & wire132[(4'ha):(3'h4)]) != wire357)};
      if (reg371[(4'he):(2'h3)])
        begin
          if ($signed(reg375[(4'h9):(3'h7)]))
            begin
              reg376 <= $signed((~|$unsigned((~|wire362[(4'h8):(1'h0)]))));
            end
          else
            begin
              reg376 <= $unsigned(reg366[(1'h1):(1'h0)]);
              reg377 <= (~|wire127);
              reg378 <= ((^~{wire9[(3'h5):(1'h1)],
                      ($signed(wire129) ?
                          {reg363, wire362} : (reg363 >> wire10))}) ?
                  {wire354, wire357} : ($signed((+reg365)) ?
                      (+(~|$unsigned(wire357))) : reg364[(3'h6):(3'h6)]));
              reg379 <= ((|(reg371[(4'hb):(2'h3)] >= $signed(reg374[(2'h3):(2'h3)]))) <= (($unsigned({wire127,
                  (8'ha2)}) | (wire132[(4'hf):(3'h6)] ?
                  $unsigned(wire359) : wire132[(3'h7):(1'h1)])) < (^(~^{wire356}))));
            end
        end
      else
        begin
          reg376 <= $signed({$signed(reg375)});
          reg377 <= (~{$unsigned($signed(wire357[(5'h14):(4'h8)]))});
          reg378 <= ((~|($unsigned(wire0) ?
                  wire359 : $unsigned($signed((8'hbb))))) ?
              wire6[(1'h1):(1'h0)] : (-$unsigned(wire361)));
        end
    end
  assign wire380 = ((~^$signed($unsigned({wire361}))) | wire132);
endmodule

module module133  (y, clk, wire137, wire136, wire135, wire134);
  output wire [(32'hba):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire137;
  input wire [(5'h15):(1'h0)] wire136;
  input wire [(4'he):(1'h0)] wire135;
  input wire [(5'h11):(1'h0)] wire134;
  wire [(4'hd):(1'h0)] wire353;
  wire [(3'h6):(1'h0)] wire352;
  wire [(5'h10):(1'h0)] wire351;
  wire signed [(5'h13):(1'h0)] wire349;
  wire [(4'hc):(1'h0)] wire311;
  wire [(4'h9):(1'h0)] wire310;
  wire signed [(2'h2):(1'h0)] wire308;
  wire [(5'h14):(1'h0)] wire200;
  wire signed [(4'h8):(1'h0)] wire139;
  wire signed [(4'h8):(1'h0)] wire138;
  wire [(4'hd):(1'h0)] wire202;
  wire [(4'hf):(1'h0)] wire203;
  wire [(5'h11):(1'h0)] wire204;
  wire signed [(4'hb):(1'h0)] wire205;
  wire [(3'h4):(1'h0)] wire238;
  wire [(4'hc):(1'h0)] wire268;
  assign y = {wire353,
                 wire352,
                 wire351,
                 wire349,
                 wire311,
                 wire310,
                 wire308,
                 wire200,
                 wire139,
                 wire138,
                 wire202,
                 wire203,
                 wire204,
                 wire205,
                 wire238,
                 wire268,
                 (1'h0)};
  assign wire138 = ((wire134[(1'h1):(1'h0)] & $unsigned($signed(wire134[(1'h1):(1'h1)]))) + ({((wire136 ?
                                   (8'hb5) : wire134) ?
                               (wire135 ?
                                   wire135 : wire134) : $unsigned(wire136))} ?
                       wire134[(1'h1):(1'h1)] : (((wire136 && (8'hb4)) >>> $signed(wire136)) ?
                           ($signed(wire135) >= wire136) : ($signed((8'h9f)) ?
                               wire137[(1'h0):(1'h0)] : {wire135, wire136}))));
  assign wire139 = (-$signed((($signed(wire136) ?
                           (7'h40) : $unsigned(wire135)) ?
                       ((8'ha8) <= (~|wire136)) : ($unsigned((8'ha6)) ?
                           $signed(wire138) : $signed((8'ha8))))));
  module140 #() modinst201 (.clk(clk), .wire144(wire136), .wire143(wire137), .wire142(wire135), .wire145(wire138), .y(wire200), .wire141(wire134));
  assign wire202 = wire136[(4'hd):(3'h5)];
  assign wire203 = $unsigned(wire200);
  assign wire204 = (^wire202);
  assign wire205 = (~|(~^($unsigned((7'h43)) ^ $signed($signed(wire137)))));
  module206 #() modinst239 (.wire210(wire204), .y(wire238), .wire208(wire135), .wire209(wire134), .wire207(wire205), .clk(clk));
  module240 #() modinst269 (.clk(clk), .y(wire268), .wire243(wire137), .wire242(wire136), .wire244(wire138), .wire245(wire204), .wire241(wire134));
  module270 #() modinst309 (.wire274(wire137), .wire271(wire200), .wire272(wire135), .y(wire308), .clk(clk), .wire273(wire134));
  assign wire310 = wire268;
  assign wire311 = wire139;
  module312 #() modinst350 (.wire316(wire137), .wire315(wire202), .wire313(wire311), .wire314(wire268), .clk(clk), .y(wire349));
  assign wire351 = $signed((wire136 ?
                       $signed((wire135 * wire308[(1'h0):(1'h0)])) : (|(wire139[(3'h5):(1'h1)] << wire268[(1'h1):(1'h1)]))));
  assign wire352 = $unsigned(wire200);
  assign wire353 = wire311;
endmodule

module module11  (y, clk, wire12, wire13, wire14, wire15);
  output wire [(32'h297):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire12;
  input wire [(5'h11):(1'h0)] wire13;
  input wire [(4'he):(1'h0)] wire14;
  input wire [(5'h15):(1'h0)] wire15;
  wire [(4'he):(1'h0)] wire126;
  wire [(3'h6):(1'h0)] wire125;
  wire signed [(3'h4):(1'h0)] wire124;
  wire signed [(5'h15):(1'h0)] wire123;
  wire signed [(4'hf):(1'h0)] wire95;
  wire [(4'h9):(1'h0)] wire94;
  wire [(4'hd):(1'h0)] wire93;
  wire [(3'h5):(1'h0)] wire92;
  wire signed [(2'h3):(1'h0)] wire16;
  wire [(3'h6):(1'h0)] wire17;
  wire signed [(5'h12):(1'h0)] wire18;
  wire [(4'ha):(1'h0)] wire37;
  wire signed [(5'h14):(1'h0)] wire90;
  reg [(5'h14):(1'h0)] reg122 = (1'h0);
  reg [(2'h3):(1'h0)] reg121 = (1'h0);
  reg [(3'h6):(1'h0)] reg120 = (1'h0);
  reg [(3'h7):(1'h0)] reg119 = (1'h0);
  reg [(2'h2):(1'h0)] reg118 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg115 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg113 = (1'h0);
  reg [(4'hf):(1'h0)] reg112 = (1'h0);
  reg [(4'ha):(1'h0)] reg111 = (1'h0);
  reg [(5'h13):(1'h0)] reg110 = (1'h0);
  reg [(4'ha):(1'h0)] reg109 = (1'h0);
  reg [(4'hc):(1'h0)] reg108 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg107 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg106 = (1'h0);
  reg [(3'h7):(1'h0)] reg105 = (1'h0);
  reg [(5'h15):(1'h0)] reg104 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg103 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg102 = (1'h0);
  reg [(5'h13):(1'h0)] reg101 = (1'h0);
  reg [(4'h9):(1'h0)] reg100 = (1'h0);
  reg [(5'h12):(1'h0)] reg99 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg98 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg97 = (1'h0);
  reg [(4'hf):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg34 = (1'h0);
  reg [(5'h15):(1'h0)] reg33 = (1'h0);
  reg [(4'hb):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg31 = (1'h0);
  reg [(4'ha):(1'h0)] reg30 = (1'h0);
  reg [(4'hf):(1'h0)] reg29 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg26 = (1'h0);
  reg [(3'h6):(1'h0)] reg25 = (1'h0);
  reg [(5'h10):(1'h0)] reg24 = (1'h0);
  reg [(5'h12):(1'h0)] reg23 = (1'h0);
  reg [(5'h15):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg21 = (1'h0);
  reg [(4'ha):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg19 = (1'h0);
  assign y = {wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire16,
                 wire17,
                 wire18,
                 wire37,
                 wire90,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
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
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 (1'h0)};
  assign wire16 = (($unsigned(wire14) <= $signed((~&wire14[(4'h9):(3'h6)]))) ?
                      {wire12,
                          ({$unsigned(wire14),
                              (wire13 ?
                                  (7'h42) : wire15)} + ({wire13} & wire13[(3'h4):(2'h2)]))} : (&wire14[(1'h0):(1'h0)]));
  assign wire17 = ($signed($unsigned(wire14[(4'hc):(3'h7)])) & wire16);
  assign wire18 = $unsigned(((|(&{wire16,
                      wire13})) & (wire12[(2'h2):(1'h0)] < (((8'hb8) & wire15) ?
                      wire15 : wire12))));
  always
    @(posedge clk) begin
      reg19 <= $signed((8'hb5));
      reg20 <= (8'ha8);
      if (($unsigned(wire12[(4'h9):(4'h8)]) ?
          (((wire18 <<< (~reg19)) ?
                  wire14 : ((~wire12) ?
                      ((8'hab) << wire16) : wire12[(4'h9):(4'h8)])) ?
              $signed(wire18) : $signed((^$unsigned(wire18)))) : $signed($signed($signed((~&wire12))))))
        begin
          reg21 <= {wire14[(4'h8):(1'h1)],
              (-((-(8'ha6)) ^~ $unsigned(wire14[(3'h5):(1'h0)])))};
          reg22 <= ((reg19[(3'h6):(2'h2)] ?
                  $signed((!(reg21 ?
                      wire13 : reg20))) : $signed($unsigned(((8'ha2) & wire18)))) ?
              $unsigned(wire15) : wire18);
        end
      else
        begin
          reg21 <= ((8'hb3) ?
              $unsigned(wire13[(2'h3):(1'h0)]) : ({{(wire14 ? wire18 : wire16),
                          (wire15 >> reg19)},
                      $unsigned(wire13[(4'he):(4'hc)])} ?
                  wire18[(4'h8):(3'h4)] : wire17));
          reg22 <= wire14;
          reg23 <= $unsigned(reg21[(1'h1):(1'h1)]);
        end
      reg24 <= {(!reg19[(2'h3):(1'h1)]), {wire12[(1'h0):(1'h0)]}};
      if ($unsigned((^($signed(wire14[(4'h9):(3'h7)]) && $signed($unsigned(wire13))))))
        begin
          reg25 <= reg20[(3'h6):(2'h2)];
          reg26 <= (($unsigned(($signed(reg25) < wire18)) <= wire13) ?
              ($signed(((~reg19) == $signed(reg22))) > (+(8'hb8))) : ($signed(((8'ha8) >= $signed(reg21))) ?
                  $signed(($unsigned(reg23) ?
                      $unsigned(reg24) : (reg20 ? reg22 : reg23))) : (wire14 ?
                      ((reg24 - wire18) | reg23[(1'h1):(1'h1)]) : wire18[(3'h4):(3'h4)])));
          if (({$signed($signed((~wire15)))} ?
              $unsigned(wire12[(2'h2):(2'h2)]) : (wire18 <<< ((reg26 + $signed(wire17)) < ({wire18,
                  reg22} ^ $unsigned(reg25))))))
            begin
              reg27 <= reg20;
              reg28 <= ((!{(!reg27[(4'hf):(1'h0)]), reg25}) ~^ ((^(reg24 ?
                      reg23 : reg24)) ?
                  $unsigned((~&$unsigned(wire14))) : $unsigned($signed((reg19 > (8'hbd))))));
              reg29 <= (({{(reg19 ? reg24 : wire17)}} ?
                      $unsigned(reg24[(5'h10):(4'hd)]) : reg27) ?
                  (wire17 ?
                      (~|$unsigned((!wire17))) : wire14[(2'h3):(1'h0)]) : ((reg26 ?
                      ((reg19 ? wire12 : wire16) ?
                          (8'ha1) : ((7'h40) << (8'hac))) : wire14[(3'h4):(3'h4)]) >> {(wire13[(5'h10):(3'h6)] ?
                          reg24 : $signed(wire13)),
                      {wire16, (wire17 ? wire14 : (8'ha2))}}));
              reg30 <= (8'haa);
              reg31 <= reg26;
            end
          else
            begin
              reg27 <= (~^(^~$signed(wire13[(3'h6):(2'h2)])));
              reg28 <= reg29[(4'h8):(1'h1)];
              reg29 <= reg20;
              reg30 <= (|$signed(wire13[(3'h7):(1'h1)]));
              reg31 <= (&$signed(((reg28 ?
                      (reg27 != reg27) : (reg22 || reg29)) ?
                  ($unsigned((8'haf)) ?
                      {reg19} : (reg27 ?
                          reg21 : wire13)) : (reg21[(2'h2):(1'h0)] ?
                      (reg26 ? reg19 : wire16) : (|(8'hb0))))));
            end
          reg32 <= {$signed($unsigned(((&wire16) >> (&wire14))))};
        end
      else
        begin
          reg25 <= (((-($unsigned(reg22) ?
              $unsigned(reg20) : (reg20 ?
                  reg19 : reg28))) + (wire15[(1'h0):(1'h0)] ?
              ($signed(reg32) ?
                  $unsigned(reg32) : (7'h40)) : $signed((reg22 ~^ reg23)))) || (-(reg24 ?
              ({reg21} >= $unsigned((8'h9e))) : $unsigned((wire12 << reg31)))));
          reg26 <= {(~|reg23[(3'h4):(2'h3)])};
          if (($unsigned(reg25[(2'h3):(1'h0)]) ^~ (({(reg27 ^ reg26),
                  $signed(wire13)} <<< reg30) ?
              (wire14[(3'h6):(1'h1)] ?
                  $signed(reg27[(5'h13):(4'hd)]) : ($unsigned(wire15) ?
                      (reg25 ?
                          reg30 : reg30) : $signed(reg19))) : ($signed(reg26) ^~ ((&wire13) <= (~^reg30))))))
            begin
              reg27 <= reg20;
              reg28 <= wire17;
              reg29 <= $signed(reg23[(4'ha):(2'h2)]);
              reg30 <= $signed(reg24);
            end
          else
            begin
              reg27 <= reg22;
            end
          if ({(+reg24)})
            begin
              reg31 <= ((&$signed($signed(reg19[(3'h6):(3'h6)]))) ^~ ((~{(wire13 * reg21)}) ?
                  $signed($unsigned($unsigned(reg30))) : (~$signed((reg21 || wire17)))));
              reg32 <= {reg20[(2'h2):(2'h2)], reg21[(2'h2):(2'h2)]};
              reg33 <= {{((|$signed(reg19)) ?
                          ((reg29 < wire17) ?
                              (8'hbd) : (reg24 ?
                                  (8'haf) : reg25)) : {$signed((8'ha1)),
                              $unsigned(wire15)})}};
              reg34 <= ({$unsigned((~&wire12[(4'h9):(3'h4)])),
                      $signed($signed((wire15 && reg19)))} ?
                  reg20[(2'h3):(2'h2)] : ((((wire17 ?
                          reg23 : wire15) <= (&reg23)) <<< (|reg26[(1'h1):(1'h1)])) ?
                      reg22 : (reg21 ? $signed((-reg21)) : (8'ha1))));
              reg35 <= reg33[(5'h10):(2'h2)];
            end
          else
            begin
              reg31 <= (8'hb7);
              reg32 <= $signed(reg23);
            end
          reg36 <= ($signed(reg32) ?
              $unsigned((reg28[(3'h4):(2'h2)] >> $signed(reg24))) : reg22);
        end
    end
  assign wire37 = (!(reg31[(2'h3):(1'h0)] < $unsigned({reg30[(4'h9):(4'h8)],
                      (wire12 ? reg26 : reg20)})));
  module38 #() modinst91 (wire90, clk, reg33, wire13, reg20, wire37, wire18);
  assign wire92 = ($unsigned($signed(((wire90 - reg28) + (reg19 ?
                          reg25 : reg36)))) ?
                      ((~&reg31) ?
                          reg29 : $unsigned(reg34[(1'h0):(1'h0)])) : reg21);
  assign wire93 = (!reg21);
  assign wire94 = (8'haf);
  assign wire95 = reg20[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg96 <= (!(^reg20));
      reg97 <= $unsigned($signed({$signed((8'ha4)),
          ((wire92 ? reg28 : (8'hb0)) != (reg27 ? reg27 : reg96))}));
      if ($signed(reg28))
        begin
          reg98 <= reg22;
          reg99 <= $signed($signed((+(wire12 ?
              $signed((8'haf)) : $signed(reg96)))));
          if (reg19)
            begin
              reg100 <= $signed((wire12 + (((wire13 != wire37) ?
                  $unsigned(wire37) : $unsigned(reg32)) ^ ((wire12 ?
                      (8'hbc) : wire37) ?
                  $signed(reg22) : ((8'hae) ? reg21 : reg30)))));
              reg101 <= wire14[(4'he):(4'hd)];
            end
          else
            begin
              reg100 <= reg32;
              reg101 <= reg20[(1'h0):(1'h0)];
              reg102 <= ($unsigned((reg101 ?
                  reg32[(4'h8):(3'h7)] : (8'hb3))) ^ $unsigned(($unsigned((wire12 > reg32)) && {(reg27 ?
                      reg24 : reg24),
                  $signed(reg20)})));
            end
        end
      else
        begin
          reg98 <= wire90;
          reg99 <= wire13;
          reg100 <= $unsigned(wire14[(4'ha):(3'h7)]);
        end
      reg103 <= reg27;
      reg104 <= (~|{{(-((7'h41) || reg96)), reg20[(3'h4):(1'h0)]},
          $unsigned(reg100[(4'h8):(2'h2)])});
    end
  always
    @(posedge clk) begin
      reg105 <= reg102;
      reg106 <= ({($unsigned((wire92 ^~ reg35)) ?
                  ({wire16} | $unsigned(wire94)) : (wire18 >= (&reg19)))} ?
          (^~wire15) : $signed($unsigned({{reg103, wire15}})));
    end
  always
    @(posedge clk) begin
      if (reg103[(1'h1):(1'h0)])
        begin
          reg107 <= (-reg21[(1'h1):(1'h1)]);
          reg108 <= ($signed((~{(reg26 + reg35),
              ((8'ha3) >= reg33)})) != ((~|((+wire12) ?
              (reg20 ? wire15 : wire93) : $signed(reg21))) < reg99));
          if (({(((reg102 ~^ reg102) - (reg96 <= reg107)) ?
                      $signed((reg99 ? (8'hb1) : reg26)) : {(~&(8'hb6))}),
                  reg24[(1'h1):(1'h0)]} ?
              {reg27} : (($signed((wire95 >> reg31)) ?
                      wire18 : {$signed(reg25), (|(8'ha4))}) ?
                  $unsigned($signed(reg19)) : $signed(($signed((8'hb8)) >= $signed((8'haa)))))))
            begin
              reg109 <= reg106;
              reg110 <= wire37[(1'h1):(1'h0)];
              reg111 <= (7'h41);
            end
          else
            begin
              reg109 <= ($signed(reg22) ?
                  $signed((8'hb2)) : (reg24 ?
                      ($signed($unsigned((8'hb0))) || wire92[(3'h4):(1'h0)]) : ((+reg23[(5'h11):(4'hc)]) ?
                          $unsigned(reg28[(1'h1):(1'h1)]) : reg104[(4'hd):(4'hc)])));
            end
          reg112 <= (~$signed($signed((~|reg111[(2'h2):(2'h2)]))));
          if ($signed((~^$unsigned((reg36[(4'hd):(4'h9)] && $unsigned(wire12))))))
            begin
              reg113 <= {{(^$unsigned(((8'ha3) >= (8'h9e)))),
                      ($signed(wire14) ?
                          {reg19[(1'h1):(1'h1)],
                              (~reg36)} : reg24[(1'h0):(1'h0)])},
                  $unsigned($signed((reg97[(1'h0):(1'h0)] ?
                      $unsigned((8'hb5)) : reg109[(1'h1):(1'h1)])))};
              reg114 <= $signed(reg104);
              reg115 <= (({(^$signed(reg114)),
                          $unsigned(wire18[(3'h7):(1'h1)])} ?
                      {wire37,
                          $signed(reg22[(3'h6):(3'h5)])} : {($signed(reg97) ?
                              (reg27 >> reg35) : (8'ha0))}) ?
                  {($unsigned((reg100 << (8'ha7))) * ($signed((7'h43)) - {reg105,
                          reg31}))} : ($unsigned(reg21[(1'h0):(1'h0)]) <<< $signed(($unsigned(reg23) + reg33))));
            end
          else
            begin
              reg113 <= $unsigned($signed(wire15[(4'hb):(3'h7)]));
              reg114 <= (8'hb2);
              reg115 <= $signed((&reg99));
              reg116 <= $unsigned({$signed(((8'hb0) && $unsigned(reg99))),
                  (~$unsigned((reg108 <= wire37)))});
            end
        end
      else
        begin
          reg107 <= $signed((((~|(wire12 <= (8'ha5))) > {$signed(reg101),
              (8'ha4)}) <= $signed($signed({reg105}))));
          if (($signed((~$signed((reg99 ?
              wire16 : reg101)))) * ($signed(reg35) ?
              wire14[(3'h5):(1'h1)] : $signed(wire93))))
            begin
              reg108 <= reg115[(2'h3):(2'h2)];
            end
          else
            begin
              reg108 <= reg97[(2'h2):(1'h1)];
            end
        end
      reg117 <= (^~($signed({(+reg111),
          (8'hae)}) > $unsigned($signed($signed(reg101)))));
      reg118 <= (8'hbf);
      if (($unsigned($unsigned({((7'h42) ?
              (8'hbe) : wire17)})) ^ (^(reg101 < $unsigned(reg34)))))
        begin
          reg119 <= (^~((8'ha6) ? $signed(({reg106} << reg98)) : reg101));
          reg120 <= wire92[(2'h3):(2'h2)];
        end
      else
        begin
          if (reg33)
            begin
              reg119 <= wire94;
              reg120 <= reg119;
              reg121 <= (reg120 + wire93);
              reg122 <= $signed({$unsigned($signed((~&reg116))),
                  (wire15[(5'h15):(4'hd)] >> $unsigned($unsigned(wire92)))});
            end
          else
            begin
              reg119 <= ($signed(wire16) ?
                  ($signed(($unsigned(reg115) & ((8'ha6) ? reg110 : reg113))) ?
                      $signed($unsigned($signed(reg106))) : reg113) : reg33[(1'h0):(1'h0)]);
              reg120 <= reg99;
              reg121 <= ($signed((((~reg97) > {wire90}) & (^~(reg26 ?
                  wire15 : reg27)))) ^~ $unsigned($unsigned(wire14[(4'hc):(4'h8)])));
            end
        end
    end
  assign wire123 = {(($signed((reg21 | reg113)) ?
                           $unsigned((wire13 != reg98)) : $signed((~&reg117))) * $signed({reg114[(3'h5):(3'h4)]}))};
  assign wire124 = reg113;
  assign wire125 = $signed(reg110[(2'h2):(2'h2)]);
  assign wire126 = {((reg107[(4'h9):(3'h6)] > $unsigned(reg116[(3'h7):(1'h1)])) != ($signed(wire37) + (reg102 ?
                           wire124[(3'h4):(2'h3)] : (~reg24)))),
                       $unsigned(((^~$signed(reg105)) ? (8'h9d) : wire94))};
endmodule

module module38  (y, clk, wire43, wire42, wire41, wire40, wire39);
  output wire [(32'h1fe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire43;
  input wire signed [(4'h9):(1'h0)] wire42;
  input wire [(3'h5):(1'h0)] wire41;
  input wire signed [(3'h7):(1'h0)] wire40;
  input wire signed [(5'h12):(1'h0)] wire39;
  wire [(5'h14):(1'h0)] wire89;
  wire [(3'h7):(1'h0)] wire88;
  wire [(5'h12):(1'h0)] wire87;
  wire signed [(4'hd):(1'h0)] wire79;
  wire signed [(5'h10):(1'h0)] wire78;
  wire [(3'h7):(1'h0)] wire73;
  wire [(4'hb):(1'h0)] wire55;
  wire [(5'h13):(1'h0)] wire54;
  wire signed [(2'h3):(1'h0)] wire53;
  wire signed [(5'h12):(1'h0)] wire52;
  wire [(4'hf):(1'h0)] wire51;
  wire [(4'h8):(1'h0)] wire50;
  wire signed [(3'h6):(1'h0)] wire49;
  wire [(5'h11):(1'h0)] wire48;
  wire [(4'hd):(1'h0)] wire47;
  wire [(3'h7):(1'h0)] wire46;
  wire [(5'h15):(1'h0)] wire45;
  wire signed [(3'h7):(1'h0)] wire44;
  reg [(5'h13):(1'h0)] reg86 = (1'h0);
  reg [(2'h2):(1'h0)] reg85 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg84 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg83 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg82 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg81 = (1'h0);
  reg [(3'h5):(1'h0)] reg80 = (1'h0);
  reg signed [(4'he):(1'h0)] reg77 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg75 = (1'h0);
  reg [(4'hf):(1'h0)] reg74 = (1'h0);
  reg [(2'h3):(1'h0)] reg72 = (1'h0);
  reg [(3'h5):(1'h0)] reg71 = (1'h0);
  reg [(5'h10):(1'h0)] reg70 = (1'h0);
  reg [(5'h10):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg68 = (1'h0);
  reg [(5'h12):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg65 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg64 = (1'h0);
  reg [(2'h3):(1'h0)] reg63 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg62 = (1'h0);
  reg [(5'h13):(1'h0)] reg61 = (1'h0);
  reg [(5'h13):(1'h0)] reg60 = (1'h0);
  reg [(4'ha):(1'h0)] reg59 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg58 = (1'h0);
  reg signed [(4'he):(1'h0)] reg57 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg56 = (1'h0);
  assign y = {wire89,
                 wire88,
                 wire87,
                 wire79,
                 wire78,
                 wire73,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
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
                 reg58,
                 reg57,
                 reg56,
                 (1'h0)};
  assign wire44 = (8'hb9);
  assign wire45 = ({(+(^wire44))} ?
                      (wire40[(3'h7):(3'h6)] ?
                          (wire43 ?
                              (^~(wire40 >= wire44)) : ((8'h9c) != {(8'h9d),
                                  wire44})) : ($signed((^~wire41)) ?
                              $unsigned((wire44 <<< wire41)) : wire41[(2'h2):(2'h2)])) : (+(~&({(8'hb1),
                          wire40} > (8'ha8)))));
  assign wire46 = ((!$signed(wire40)) ?
                      $signed((wire41[(1'h1):(1'h0)] ?
                          (-(|wire41)) : $signed((wire42 ?
                              wire44 : wire40)))) : (((-(~|wire44)) ?
                          ($signed(wire39) ?
                              wire42 : wire39[(2'h2):(2'h2)]) : wire40) ^ $signed(((^wire39) < $unsigned(wire39)))));
  assign wire47 = wire44;
  assign wire48 = (wire46[(2'h3):(1'h0)] ? wire41 : $signed((&wire46)));
  assign wire49 = ({wire40, (8'ha2)} ?
                      wire46[(2'h3):(1'h1)] : $signed({wire41[(3'h4):(2'h2)]}));
  assign wire50 = ((^~((^wire40) ? $unsigned((wire44 * wire49)) : wire49)) ?
                      wire42 : ($signed(wire48) ?
                          wire49[(3'h4):(2'h2)] : wire47[(4'hb):(3'h6)]));
  assign wire51 = wire44;
  assign wire52 = ($signed(wire45) ^~ wire47[(2'h2):(2'h2)]);
  assign wire53 = $unsigned({$signed(wire51)});
  assign wire54 = {wire46, (-(-wire39[(3'h5):(1'h0)]))};
  assign wire55 = ($signed($signed(wire41[(3'h5):(2'h3)])) << ({$signed(wire43[(4'hf):(3'h6)])} ?
                      $signed($signed((wire48 ?
                          wire42 : wire53))) : ({wire54[(4'hd):(2'h2)]} + $signed($signed(wire51)))));
  always
    @(posedge clk) begin
      if ((wire48 ?
          wire45 : ((^(^wire40)) ?
              wire44[(2'h3):(2'h2)] : wire54[(1'h1):(1'h1)])))
        begin
          reg56 <= ((((wire48 ? $unsigned(wire44) : wire55) ?
                  ($unsigned(wire50) >>> (wire53 < wire53)) : $signed((wire46 ?
                      wire44 : wire39))) | $unsigned(wire51)) ?
              wire54 : ($signed((wire51[(3'h6):(3'h6)] & wire50[(4'h8):(1'h1)])) == (wire44 >= $unsigned({wire46}))));
          if ((!(~^$unsigned({(+wire53)}))))
            begin
              reg57 <= wire52[(4'h8):(1'h1)];
              reg58 <= (8'hbc);
            end
          else
            begin
              reg57 <= wire50[(3'h5):(3'h4)];
              reg58 <= {(~&$unsigned((8'ha3))), (+wire53[(2'h3):(2'h3)])};
              reg59 <= (|wire47);
            end
          if (wire48[(3'h4):(1'h0)])
            begin
              reg60 <= wire48;
              reg61 <= $unsigned($signed((8'hb5)));
            end
          else
            begin
              reg60 <= $unsigned((reg56 <<< $unsigned(wire48[(5'h10):(4'he)])));
              reg61 <= (reg56[(1'h0):(1'h0)] + ((8'hb4) ^~ $signed(wire46[(3'h5):(2'h3)])));
            end
          reg62 <= (~(wire55 ^ ($unsigned((~^reg61)) ?
              ((^~wire42) - $unsigned(reg57)) : (((8'hbf) ?
                  wire53 : wire45) <= (^~wire53)))));
          if ($unsigned((($unsigned(wire44[(3'h5):(2'h2)]) ?
                  ($unsigned(reg56) ?
                      $unsigned(wire49) : (~&wire43)) : wire46[(2'h2):(1'h1)]) ?
              reg56 : (($signed(wire40) ?
                  (+reg59) : $unsigned(wire45)) >= {$signed(wire54)}))))
            begin
              reg63 <= $unsigned(reg56);
              reg64 <= wire40[(2'h2):(1'h1)];
              reg65 <= (~|((~((wire48 < wire40) ? {reg60} : $unsigned(reg61))) ?
                  (reg60[(5'h10):(4'h8)] ?
                      ($unsigned(wire40) ?
                          (reg59 ?
                              (7'h43) : wire53) : $signed(wire52)) : $unsigned({reg62,
                          reg59})) : reg62[(1'h1):(1'h1)]));
              reg66 <= $signed((+wire39));
              reg67 <= {(reg65[(4'ha):(2'h3)] ?
                      $signed($signed((wire40 ? reg66 : reg59))) : wire47),
                  (^~((+reg66) ?
                      $unsigned(wire49[(1'h0):(1'h0)]) : ((~|(7'h41)) ?
                          reg63[(2'h2):(1'h1)] : (reg62 < wire45))))};
            end
          else
            begin
              reg63 <= wire55[(4'ha):(3'h7)];
              reg64 <= (wire49[(2'h2):(1'h1)] ^ (((7'h42) + $unsigned($signed(reg63))) << $signed(((~^reg60) ?
                  (wire40 == wire49) : $unsigned((8'hbf))))));
              reg65 <= $signed(((($unsigned(wire51) ?
                          (|reg63) : $signed(wire43)) ?
                      $unsigned((!wire44)) : wire39[(5'h10):(4'hc)]) ?
                  (wire41[(1'h0):(1'h0)] ?
                      wire41 : ((^wire50) ?
                          reg58[(1'h0):(1'h0)] : $unsigned(reg67))) : reg61[(1'h0):(1'h0)]));
              reg66 <= $signed($signed(wire46));
            end
        end
      else
        begin
          reg56 <= ($signed((7'h42)) >>> $signed((((^~(8'hac)) - ((8'hbf) ?
                  reg64 : wire42)) ?
              ((reg67 ?
                  wire49 : reg66) <<< $signed(reg58)) : {$unsigned(wire54),
                  $signed((8'hb9))})));
          reg57 <= ({$signed(wire47[(3'h4):(2'h2)])} | {(reg61[(4'hf):(1'h0)] ?
                  (reg65 ? $unsigned(reg59) : {(8'ha1)}) : ($signed(wire48) ?
                      $signed(wire39) : wire43))});
          reg58 <= $signed((8'hb0));
          reg59 <= (8'ha6);
          reg60 <= {{((reg66 >= (wire43 ^ reg60)) != $unsigned(wire53)),
                  wire45},
              ($signed(wire51[(4'hc):(2'h2)]) <= $unsigned(($signed(wire44) | reg66[(3'h6):(3'h4)])))};
        end
      if (wire47[(3'h7):(3'h4)])
        begin
          reg68 <= reg57[(4'h9):(2'h2)];
          reg69 <= wire50;
          reg70 <= reg69;
          reg71 <= (($unsigned(($signed(wire39) < (reg64 ?
                  (8'haf) : reg65))) >= $unsigned((+wire48))) ?
              reg58 : wire43[(4'h8):(3'h6)]);
          reg72 <= wire55;
        end
      else
        begin
          reg68 <= $unsigned({(wire40 ~^ $signed($signed(wire46)))});
          if ({(~{wire41})})
            begin
              reg69 <= reg69[(3'h4):(2'h2)];
            end
          else
            begin
              reg69 <= $unsigned(wire39);
              reg70 <= $signed({wire49[(3'h5):(2'h2)], {wire52}});
              reg71 <= wire55[(3'h6):(3'h6)];
            end
          reg72 <= wire42[(3'h5):(2'h2)];
        end
    end
  assign wire73 = wire43;
  always
    @(posedge clk) begin
      reg74 <= wire46[(2'h3):(2'h3)];
      reg75 <= (~|wire50);
      reg76 <= $signed((!(~(~^reg56[(1'h0):(1'h0)]))));
      reg77 <= $signed(wire39);
    end
  assign wire78 = reg71[(3'h5):(1'h0)];
  assign wire79 = wire48[(4'he):(4'h8)];
  always
    @(posedge clk) begin
      reg80 <= (~&wire42);
      reg81 <= $unsigned($unsigned(($signed((wire44 & reg59)) ^~ (wire51 >> $signed(wire73)))));
      if (reg77)
        begin
          if (($signed($signed((wire44 <<< $unsigned(reg61)))) ?
              {$signed(((wire46 * reg64) ?
                      wire44[(3'h6):(2'h2)] : $signed(reg56))),
                  ((~^{reg61}) >>> reg64)} : reg81[(4'h8):(3'h4)]))
            begin
              reg82 <= {(+(!$signed((reg70 >>> reg59)))),
                  $signed({(~^(wire73 & reg65))})};
            end
          else
            begin
              reg82 <= wire40;
            end
          reg83 <= reg57;
          reg84 <= wire78[(3'h5):(1'h0)];
          reg85 <= (~((8'hae) ?
              (^~wire78[(4'h8):(3'h4)]) : reg83[(3'h6):(1'h1)]));
        end
      else
        begin
          reg82 <= ((~(((|reg58) ? $unsigned(reg85) : $signed((8'ha6))) ?
              {wire47} : {(wire79 < reg76)})) ^~ ({reg63[(1'h1):(1'h0)]} >> (^(!{wire43}))));
          reg83 <= (wire53[(1'h1):(1'h0)] < $signed($signed(reg69)));
        end
      reg86 <= $unsigned((+(!$signed(wire55))));
    end
  assign wire87 = (wire52 <<< $signed((~^((~^reg65) > (reg69 + (8'ha4))))));
  assign wire88 = {reg58[(1'h0):(1'h0)]};
  assign wire89 = ((8'hb4) ^ (8'ha3));
endmodule

module module312  (y, clk, wire316, wire315, wire314, wire313);
  output wire [(32'h178):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire316;
  input wire signed [(4'hd):(1'h0)] wire315;
  input wire signed [(2'h3):(1'h0)] wire314;
  input wire [(4'hc):(1'h0)] wire313;
  wire [(4'hc):(1'h0)] wire348;
  wire signed [(4'he):(1'h0)] wire347;
  wire signed [(4'ha):(1'h0)] wire338;
  wire signed [(4'h9):(1'h0)] wire337;
  wire [(5'h10):(1'h0)] wire336;
  wire signed [(5'h11):(1'h0)] wire335;
  wire [(5'h10):(1'h0)] wire330;
  wire signed [(3'h6):(1'h0)] wire329;
  wire [(4'hc):(1'h0)] wire328;
  wire [(3'h4):(1'h0)] wire327;
  reg [(5'h15):(1'h0)] reg346 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg345 = (1'h0);
  reg [(4'h8):(1'h0)] reg344 = (1'h0);
  reg [(4'ha):(1'h0)] reg343 = (1'h0);
  reg [(4'h9):(1'h0)] reg342 = (1'h0);
  reg [(4'ha):(1'h0)] reg341 = (1'h0);
  reg [(5'h10):(1'h0)] reg340 = (1'h0);
  reg [(4'hf):(1'h0)] reg339 = (1'h0);
  reg [(5'h13):(1'h0)] reg334 = (1'h0);
  reg [(4'ha):(1'h0)] reg333 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg332 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg331 = (1'h0);
  reg [(5'h11):(1'h0)] reg326 = (1'h0);
  reg [(3'h4):(1'h0)] reg325 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg324 = (1'h0);
  reg [(4'h8):(1'h0)] reg323 = (1'h0);
  reg [(3'h4):(1'h0)] reg322 = (1'h0);
  reg [(4'hd):(1'h0)] reg321 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg320 = (1'h0);
  reg [(4'hf):(1'h0)] reg319 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg318 = (1'h0);
  reg [(5'h13):(1'h0)] reg317 = (1'h0);
  assign y = {wire348,
                 wire347,
                 wire338,
                 wire337,
                 wire336,
                 wire335,
                 wire330,
                 wire329,
                 wire328,
                 wire327,
                 reg346,
                 reg345,
                 reg344,
                 reg343,
                 reg342,
                 reg341,
                 reg340,
                 reg339,
                 reg334,
                 reg333,
                 reg332,
                 reg331,
                 reg326,
                 reg325,
                 reg324,
                 reg323,
                 reg322,
                 reg321,
                 reg320,
                 reg319,
                 reg318,
                 reg317,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg317 <= wire314[(1'h0):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg318 <= (^{((~^((8'ha1) <<< wire315)) > $unsigned((wire314 ?
              reg317 : wire314))),
          $unsigned((~((8'hb1) < (8'ha7))))});
      reg319 <= ((~^(~^reg318[(3'h4):(1'h0)])) >>> (((~|$unsigned(reg318)) ?
          ((~&reg317) ~^ (reg318 ?
              wire313 : wire316)) : (!wire316)) & wire315[(4'hc):(1'h1)]));
      if (wire313[(1'h1):(1'h1)])
        begin
          if (($signed($signed($signed((wire313 ? wire313 : reg318)))) ?
              wire313[(3'h7):(3'h5)] : ($signed(($signed(reg318) | (reg318 ?
                  wire315 : wire313))) < wire315[(3'h4):(2'h2)])))
            begin
              reg320 <= wire316[(4'ha):(3'h6)];
            end
          else
            begin
              reg320 <= ($signed(($unsigned($signed((8'hb7))) ?
                  wire314[(2'h3):(1'h1)] : $signed((!reg320)))) <= wire313);
            end
          reg321 <= (reg318 - ($signed({reg317}) ?
              reg317 : $signed(reg320[(1'h1):(1'h1)])));
          reg322 <= $signed((8'ha5));
          reg323 <= $signed((reg317[(5'h12):(5'h11)] != (&(~&reg321[(3'h5):(1'h1)]))));
          reg324 <= reg322;
        end
      else
        begin
          reg320 <= $signed($unsigned($signed(reg319)));
          reg321 <= $signed($unsigned((~$unsigned(reg317))));
          if (($unsigned(reg317[(5'h11):(3'h4)]) | {(wire314[(2'h3):(2'h3)] ?
                  {reg320} : ({wire316} ?
                      (wire313 ? wire315 : wire316) : (8'h9d)))}))
            begin
              reg322 <= $unsigned(({reg320[(2'h2):(2'h2)],
                      reg317[(3'h4):(3'h4)]} ?
                  (($unsigned(reg321) ?
                      ((7'h41) == reg319) : $unsigned((8'ha4))) << reg321) : (!(reg321[(3'h7):(2'h2)] & reg318[(1'h0):(1'h0)]))));
              reg323 <= wire315;
            end
          else
            begin
              reg322 <= {reg322};
              reg323 <= reg324[(1'h1):(1'h1)];
              reg324 <= $unsigned($unsigned((((~|reg318) + (-wire315)) ?
                  $signed(wire314[(1'h1):(1'h0)]) : (+reg323))));
            end
          reg325 <= $unsigned((^~(~^({reg320} ?
              reg318 : wire313[(3'h4):(1'h1)]))));
          reg326 <= reg322;
        end
    end
  assign wire327 = (8'h9e);
  assign wire328 = wire327;
  assign wire329 = $signed($unsigned(($unsigned(reg317) || reg325)));
  assign wire330 = $unsigned(wire327);
  always
    @(posedge clk) begin
      if ((~^{(((-wire314) | reg319) ?
              ((reg323 >> reg321) ~^ (wire316 ?
                  (8'hb9) : reg322)) : $signed((reg317 ~^ reg317)))}))
        begin
          reg331 <= {$unsigned(wire327[(2'h3):(2'h2)]),
              $unsigned((reg320 * $unsigned(reg324[(4'h8):(3'h7)])))};
        end
      else
        begin
          reg331 <= reg321[(1'h0):(1'h0)];
          reg332 <= ($unsigned((((reg322 ? (8'ha5) : reg320) ?
                  reg320 : $signed(wire315)) < reg317)) ?
              reg322 : $unsigned((~&wire327)));
        end
      reg333 <= (^$signed((({wire328,
          wire316} != reg324) ~^ $unsigned(reg320[(1'h0):(1'h0)]))));
      reg334 <= {reg326[(4'h8):(3'h7)]};
    end
  assign wire335 = (|$signed((wire330 <= ((^~(8'hb7)) ^ (8'had)))));
  assign wire336 = $unsigned(((|((8'ha4) ?
                           $unsigned(wire335) : reg318[(1'h0):(1'h0)])) ?
                       $signed((|(wire327 ^ wire330))) : (wire328[(3'h4):(2'h2)] < reg324)));
  assign wire337 = ({$signed($unsigned((wire336 ? wire313 : reg334)))} ?
                       reg324 : $unsigned({((wire314 ? reg318 : wire316) ?
                               {wire313} : (wire336 ? (8'hb3) : reg334))}));
  assign wire338 = wire314[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg339 <= wire328;
      reg340 <= (~|wire336);
      reg341 <= $signed(reg323[(3'h5):(1'h0)]);
      reg342 <= $unsigned($unsigned(reg324[(3'h6):(1'h1)]));
      if (wire315[(1'h0):(1'h0)])
        begin
          reg343 <= $signed(($unsigned(wire337[(1'h0):(1'h0)]) ?
              ($unsigned((reg331 ~^ reg334)) ?
                  (wire336[(4'h9):(3'h5)] ?
                      wire330 : (~&reg323)) : reg331) : $unsigned(((^~(8'ha4)) ?
                  (&reg323) : $signed(wire316)))));
          reg344 <= $signed(($unsigned(($signed(wire315) == (~reg321))) ?
              {((wire330 ~^ (8'hb2)) ?
                      wire327[(3'h4):(1'h0)] : {wire330})} : ((^{reg331,
                      reg318}) ?
                  reg324[(4'he):(3'h5)] : reg317[(4'h9):(2'h3)])));
          reg345 <= (~|($signed($signed($unsigned(reg325))) ?
              $signed($unsigned(reg322)) : reg323[(1'h1):(1'h1)]));
        end
      else
        begin
          reg343 <= $signed($unsigned({reg325[(2'h3):(2'h2)]}));
          reg344 <= ($unsigned($unsigned($signed($unsigned(reg339)))) <= (reg322[(3'h4):(2'h3)] ?
              $signed((+(wire316 >>> wire336))) : ({(reg332 ?
                      reg334 : reg341)} == ((8'hbb) ^ $unsigned((8'ha0))))));
          reg345 <= (^$signed(wire336));
          reg346 <= $unsigned(reg321[(2'h2):(1'h0)]);
        end
    end
  assign wire347 = (reg317[(3'h7):(3'h6)] ^ reg334[(1'h1):(1'h1)]);
  assign wire348 = reg325;
endmodule

module module270  (y, clk, wire274, wire273, wire272, wire271);
  output wire [(32'h164):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire274;
  input wire signed [(5'h11):(1'h0)] wire273;
  input wire [(3'h5):(1'h0)] wire272;
  input wire [(5'h14):(1'h0)] wire271;
  wire signed [(3'h4):(1'h0)] wire305;
  wire signed [(4'ha):(1'h0)] wire304;
  wire [(5'h13):(1'h0)] wire303;
  wire signed [(3'h7):(1'h0)] wire299;
  wire [(5'h12):(1'h0)] wire298;
  wire [(3'h5):(1'h0)] wire289;
  wire signed [(4'he):(1'h0)] wire284;
  wire [(3'h7):(1'h0)] wire283;
  wire [(5'h13):(1'h0)] wire282;
  wire signed [(2'h3):(1'h0)] wire281;
  wire signed [(5'h14):(1'h0)] wire280;
  wire [(3'h5):(1'h0)] wire279;
  wire signed [(4'hc):(1'h0)] wire278;
  wire [(5'h10):(1'h0)] wire276;
  wire [(4'ha):(1'h0)] wire275;
  reg [(2'h2):(1'h0)] reg307 = (1'h0);
  reg [(4'hd):(1'h0)] reg306 = (1'h0);
  reg [(4'hc):(1'h0)] reg302 = (1'h0);
  reg [(4'hf):(1'h0)] reg301 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg300 = (1'h0);
  reg [(5'h13):(1'h0)] reg297 = (1'h0);
  reg [(5'h10):(1'h0)] reg296 = (1'h0);
  reg [(5'h15):(1'h0)] reg295 = (1'h0);
  reg [(4'h9):(1'h0)] reg294 = (1'h0);
  reg [(5'h11):(1'h0)] reg293 = (1'h0);
  reg [(3'h4):(1'h0)] reg292 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg291 = (1'h0);
  reg [(2'h3):(1'h0)] reg290 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg288 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg287 = (1'h0);
  reg [(4'hb):(1'h0)] reg286 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg285 = (1'h0);
  reg [(2'h2):(1'h0)] reg277 = (1'h0);
  assign y = {wire305,
                 wire304,
                 wire303,
                 wire299,
                 wire298,
                 wire289,
                 wire284,
                 wire283,
                 wire282,
                 wire281,
                 wire280,
                 wire279,
                 wire278,
                 wire276,
                 wire275,
                 reg307,
                 reg306,
                 reg302,
                 reg301,
                 reg300,
                 reg297,
                 reg296,
                 reg295,
                 reg294,
                 reg293,
                 reg292,
                 reg291,
                 reg290,
                 reg288,
                 reg287,
                 reg286,
                 reg285,
                 reg277,
                 (1'h0)};
  assign wire275 = (&$unsigned($unsigned($unsigned({wire274, wire271}))));
  assign wire276 = $signed(wire273[(4'he):(4'hc)]);
  always
    @(posedge clk) begin
      reg277 <= wire271;
    end
  assign wire278 = wire276[(4'ha):(3'h5)];
  assign wire279 = ((wire274[(3'h4):(2'h3)] < wire276[(3'h4):(2'h2)]) <<< $signed($unsigned(wire275)));
  assign wire280 = reg277[(2'h2):(1'h0)];
  assign wire281 = wire274[(4'h9):(4'h8)];
  assign wire282 = (^~$signed((7'h41)));
  assign wire283 = $signed((~&(-((wire273 ~^ wire276) >>> (wire281 ?
                       wire275 : reg277)))));
  assign wire284 = wire278[(4'hc):(2'h3)];
  always
    @(posedge clk) begin
      reg285 <= $unsigned(((!wire278[(3'h4):(2'h2)]) ? wire282 : reg277));
      reg286 <= (8'hb6);
      reg287 <= wire274[(3'h4):(1'h0)];
      reg288 <= (~^(~&(&{((8'hb6) + reg277), (|wire272)})));
    end
  assign wire289 = ((~{{((8'hb6) && wire276),
                           $signed(wire276)}}) >> ((8'hb9) + (~&($unsigned(wire274) * wire281))));
  always
    @(posedge clk) begin
      if ((wire282 & wire279))
        begin
          reg290 <= wire272[(3'h5):(3'h4)];
          reg291 <= (reg277[(2'h2):(1'h1)] ?
              ($signed((!wire275)) ?
                  $unsigned(($unsigned((8'had)) >> $signed(wire284))) : $unsigned($unsigned((wire272 != wire280)))) : ({($signed(wire278) ^~ wire272),
                  $signed(reg290[(1'h1):(1'h0)])} <<< (+($unsigned(wire278) >= $unsigned(wire279)))));
        end
      else
        begin
          reg290 <= (wire276 ? wire272 : $signed(wire289[(3'h5):(1'h1)]));
          if (wire276[(4'ha):(1'h0)])
            begin
              reg291 <= wire276;
              reg292 <= $signed($signed({{(wire271 ? wire284 : wire272),
                      (wire282 + wire273)}}));
            end
          else
            begin
              reg291 <= wire280[(5'h10):(4'hc)];
              reg292 <= reg290[(2'h3):(2'h3)];
              reg293 <= $signed((^~$unsigned((reg292 ?
                  $signed(wire280) : $unsigned(wire282)))));
            end
          reg294 <= (wire284 ^ ($signed(wire289[(2'h3):(1'h0)]) == wire284[(4'h9):(1'h1)]));
          reg295 <= reg294[(1'h0):(1'h0)];
          reg296 <= $unsigned($signed(reg287));
        end
      reg297 <= $unsigned($signed(wire282[(1'h0):(1'h0)]));
    end
  assign wire298 = reg295;
  assign wire299 = ($unsigned(wire280) <<< wire280[(5'h12):(1'h0)]);
  always
    @(posedge clk) begin
      reg300 <= reg296[(4'h8):(2'h2)];
      reg301 <= reg291;
      reg302 <= (wire274[(4'ha):(2'h3)] | $signed((~wire271[(3'h7):(1'h0)])));
    end
  assign wire303 = reg277;
  assign wire304 = $signed(($unsigned(((~wire303) ?
                           wire280[(4'hd):(3'h7)] : {reg302, reg292})) ?
                       wire298[(1'h1):(1'h1)] : ((8'hbb) >>> (~|reg295))));
  assign wire305 = $signed((&$unsigned((!(~(8'ha0))))));
  always
    @(posedge clk) begin
      reg306 <= $unsigned((wire281 ?
          (((wire282 * wire299) ?
              reg296 : (reg300 ?
                  reg297 : reg295)) >>> (^~wire281[(2'h3):(2'h2)])) : ({$unsigned((8'hb3))} >= {(8'ha8),
              wire280})));
      reg307 <= (~$signed(wire279));
    end
endmodule

module module240
#(parameter param267 = (((~|(((8'ha1) ? (8'ha3) : (8'hb3)) ^~ ((8'ha5) & (8'hab)))) ? (((~^(8'hb3)) ? {(8'ha7), (8'hb1)} : {(8'ha2)}) + (((8'h9d) << (8'had)) ? {(8'h9d)} : (8'hb7))) : (8'hb5)) ? ((!(-((8'hb9) ? (8'hb2) : (8'ha6)))) ? (~^{((7'h44) ? (8'ha0) : (8'hab))}) : (-(((8'hb2) ? (8'hb5) : (8'h9f)) ? ((8'ha5) < (8'hb2)) : {(8'hb9)}))) : (((((8'hb3) == (7'h44)) ? ((8'hab) ? (8'hb1) : (8'hb9)) : {(8'hb5)}) ? (&((8'ha6) ^~ (8'hb8))) : (((8'hb2) ? (8'hbd) : (8'ha5)) ? ((8'haf) >= (8'hbf)) : ((8'haa) ? (8'hbf) : (8'ha2)))) <= (8'hae))))
(y, clk, wire245, wire244, wire243, wire242, wire241);
  output wire [(32'h105):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire245;
  input wire signed [(2'h3):(1'h0)] wire244;
  input wire [(4'ha):(1'h0)] wire243;
  input wire [(4'h9):(1'h0)] wire242;
  input wire signed [(3'h4):(1'h0)] wire241;
  wire [(3'h5):(1'h0)] wire266;
  wire [(3'h7):(1'h0)] wire264;
  wire signed [(5'h10):(1'h0)] wire263;
  wire signed [(5'h15):(1'h0)] wire262;
  wire signed [(4'hd):(1'h0)] wire261;
  wire signed [(5'h10):(1'h0)] wire260;
  wire [(5'h12):(1'h0)] wire259;
  wire signed [(3'h5):(1'h0)] wire258;
  wire [(4'hf):(1'h0)] wire257;
  wire [(4'hf):(1'h0)] wire256;
  wire signed [(4'h9):(1'h0)] wire255;
  wire signed [(4'h8):(1'h0)] wire254;
  wire signed [(5'h15):(1'h0)] wire253;
  wire signed [(5'h15):(1'h0)] wire251;
  wire [(5'h11):(1'h0)] wire250;
  wire signed [(2'h3):(1'h0)] wire249;
  wire signed [(5'h12):(1'h0)] wire248;
  wire [(5'h13):(1'h0)] wire247;
  wire signed [(3'h6):(1'h0)] wire246;
  reg signed [(2'h2):(1'h0)] reg265 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg252 = (1'h0);
  assign y = {wire266,
                 wire264,
                 wire263,
                 wire262,
                 wire261,
                 wire260,
                 wire259,
                 wire258,
                 wire257,
                 wire256,
                 wire255,
                 wire254,
                 wire253,
                 wire251,
                 wire250,
                 wire249,
                 wire248,
                 wire247,
                 wire246,
                 reg265,
                 reg252,
                 (1'h0)};
  assign wire246 = (^~{(wire242[(4'h9):(3'h6)] ?
                           (wire241[(1'h0):(1'h0)] ?
                               (wire245 >= wire242) : wire244[(1'h0):(1'h0)]) : $signed((~|wire243)))});
  assign wire247 = $signed($unsigned((8'had)));
  assign wire248 = ((($signed(wire244) ?
                           ($signed(wire246) >>> wire245[(2'h2):(2'h2)]) : ($signed((8'ha9)) ?
                               wire242[(3'h4):(2'h2)] : wire246[(3'h4):(2'h2)])) ?
                       (($unsigned(wire242) <<< wire245) ?
                           wire243[(2'h2):(1'h1)] : wire245[(4'h8):(1'h1)]) : {wire241[(1'h0):(1'h0)]}) < $signed((wire243 ?
                       wire246[(3'h4):(3'h4)] : ((wire241 && wire242) && $signed((8'h9f))))));
  assign wire249 = wire247;
  assign wire250 = (!$unsigned((~wire245[(2'h3):(1'h1)])));
  assign wire251 = {((($signed(wire244) ?
                                   ((8'hb7) ?
                                       wire246 : wire248) : $signed(wire241)) ?
                               $signed($unsigned(wire246)) : $unsigned((wire243 ?
                                   wire244 : wire246))) ?
                           $unsigned($signed(wire243[(4'h9):(1'h0)])) : ((^~((8'hbf) || wire248)) ?
                               (!{wire244}) : ($unsigned(wire250) || (wire248 ?
                                   wire250 : wire241))))};
  always
    @(posedge clk) begin
      reg252 <= $unsigned({(8'ha2)});
    end
  assign wire253 = $unsigned((~|(((~|wire243) >> wire242[(2'h3):(2'h2)]) <= $unsigned(wire241[(3'h4):(2'h3)]))));
  assign wire254 = reg252[(1'h0):(1'h0)];
  assign wire255 = (~^wire248);
  assign wire256 = $signed((~wire242));
  assign wire257 = wire241[(3'h4):(2'h2)];
  assign wire258 = wire257[(4'hf):(2'h3)];
  assign wire259 = ($unsigned((8'hbd)) > (8'ha2));
  assign wire260 = (8'h9c);
  assign wire261 = $signed(((-(wire251[(4'hc):(3'h5)] ?
                           $unsigned(wire257) : ((8'hb9) ?
                               (8'haf) : wire241))) ?
                       $signed((^(wire249 + wire242))) : $signed(((~&wire248) ?
                           wire247[(4'hd):(4'hb)] : $signed(wire246)))));
  assign wire262 = $unsigned(wire255);
  assign wire263 = ($signed(((-wire248) ?
                       ((wire255 ?
                           (8'ha7) : wire250) <= $signed(reg252)) : ((-wire250) ?
                           $signed(wire256) : {wire247,
                               wire243}))) != $signed((+$unsigned((!wire251)))));
  assign wire264 = (~|$unsigned($unsigned(wire259)));
  always
    @(posedge clk) begin
      reg265 <= $signed($signed(wire249));
    end
  assign wire266 = $unsigned($unsigned((+{$unsigned(wire261)})));
endmodule

module module206  (y, clk, wire210, wire209, wire208, wire207);
  output wire [(32'h12b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire210;
  input wire signed [(4'h9):(1'h0)] wire209;
  input wire signed [(4'he):(1'h0)] wire208;
  input wire signed [(2'h2):(1'h0)] wire207;
  wire [(2'h3):(1'h0)] wire237;
  wire [(5'h12):(1'h0)] wire234;
  wire [(4'h8):(1'h0)] wire233;
  wire [(4'ha):(1'h0)] wire232;
  wire [(3'h6):(1'h0)] wire231;
  wire [(5'h13):(1'h0)] wire230;
  wire [(3'h4):(1'h0)] wire229;
  wire signed [(3'h7):(1'h0)] wire228;
  wire [(2'h3):(1'h0)] wire227;
  wire [(5'h14):(1'h0)] wire224;
  wire [(3'h7):(1'h0)] wire223;
  wire signed [(5'h12):(1'h0)] wire222;
  wire [(4'h8):(1'h0)] wire221;
  wire signed [(4'he):(1'h0)] wire220;
  wire signed [(3'h4):(1'h0)] wire219;
  wire signed [(3'h5):(1'h0)] wire218;
  wire [(4'h9):(1'h0)] wire217;
  wire [(3'h4):(1'h0)] wire216;
  reg [(3'h7):(1'h0)] reg236 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg235 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg226 = (1'h0);
  reg [(4'he):(1'h0)] reg225 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg215 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg214 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg213 = (1'h0);
  reg [(5'h15):(1'h0)] reg212 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg211 = (1'h0);
  assign y = {wire237,
                 wire234,
                 wire233,
                 wire232,
                 wire231,
                 wire230,
                 wire229,
                 wire228,
                 wire227,
                 wire224,
                 wire223,
                 wire222,
                 wire221,
                 wire220,
                 wire219,
                 wire218,
                 wire217,
                 wire216,
                 reg236,
                 reg235,
                 reg226,
                 reg225,
                 reg215,
                 reg214,
                 reg213,
                 reg212,
                 reg211,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg211 <= $unsigned($signed(wire208[(4'ha):(4'ha)]));
      reg212 <= $signed({(wire207 ? (^~$unsigned(wire210)) : (8'hb9))});
      reg213 <= ((~&wire208) ?
          $unsigned(((wire207 <<< wire210) ?
              (reg212[(4'h8):(3'h5)] ~^ ((8'hb3) ?
                  wire209 : reg212)) : (8'haa))) : (7'h40));
      reg214 <= (^$unsigned(wire208));
      reg215 <= (reg211 ?
          (((8'hb3) ?
                  {reg213, (wire208 ? reg213 : (7'h40))} : {(8'hb4),
                      {wire208, wire210}}) ?
              (8'ha4) : (-$signed(wire208[(3'h6):(2'h3)]))) : ($signed($unsigned($unsigned(reg212))) | wire208));
    end
  assign wire216 = ((~|reg215[(1'h0):(1'h0)]) && (&(($unsigned((8'ha7)) ?
                       {(8'hb0),
                           reg211} : $signed(wire210)) ^~ (wire208 || (+reg215)))));
  assign wire217 = $unsigned(reg215);
  assign wire218 = (&wire207[(1'h0):(1'h0)]);
  assign wire219 = {$signed($signed(($unsigned(wire208) - $unsigned(wire216)))),
                       wire209[(2'h3):(1'h0)]};
  assign wire220 = ((^~(|(^reg214))) ?
                       {{($unsigned((8'hb7)) ? $signed(reg211) : (^~reg212)),
                               $unsigned($signed(reg211))},
                           $signed($signed(wire218[(3'h4):(2'h3)]))} : ((^~$signed((8'ha2))) ?
                           reg211 : $unsigned(reg211)));
  assign wire221 = wire217[(2'h3):(1'h0)];
  assign wire222 = wire210[(2'h3):(1'h1)];
  assign wire223 = $signed($unsigned($signed((((8'hb6) << wire221) ?
                       (wire218 - wire217) : (~|wire209)))));
  assign wire224 = {(wire210[(1'h0):(1'h0)] ?
                           ((~^wire208) ?
                               $signed($unsigned(wire218)) : ($signed(wire219) && $signed((8'hbf)))) : (wire221[(3'h5):(3'h4)] - ($unsigned(wire209) ^ reg212))),
                       (^$unsigned(((reg215 ?
                           wire223 : wire220) ^ $unsigned(reg215))))};
  always
    @(posedge clk) begin
      reg225 <= $signed((reg215[(3'h4):(2'h2)] ?
          (^wire209[(2'h3):(2'h3)]) : ((|$signed((8'ha6))) ?
              $unsigned($unsigned(wire218)) : wire221)));
      reg226 <= wire221;
    end
  assign wire227 = $unsigned($signed((($signed(wire207) > wire217) | $signed((wire216 ?
                       wire208 : (8'hbf))))));
  assign wire228 = {((~&wire227) ? reg226 : wire207), reg213};
  assign wire229 = (wire227[(1'h0):(1'h0)] ? wire219 : reg212[(3'h5):(1'h1)]);
  assign wire230 = wire224[(2'h2):(1'h1)];
  assign wire231 = (8'hb1);
  assign wire232 = (^wire210);
  assign wire233 = wire232[(2'h2):(1'h0)];
  assign wire234 = $signed(($unsigned($signed((wire228 ?
                       wire220 : reg215))) >> {{{wire229},
                           (wire222 ? reg212 : wire220)},
                       reg214}));
  always
    @(posedge clk) begin
      reg235 <= (8'hb2);
      reg236 <= reg225[(1'h1):(1'h1)];
    end
  assign wire237 = {($signed(reg236[(1'h0):(1'h0)]) + wire231[(2'h2):(1'h1)]),
                       reg213[(1'h0):(1'h0)]};
endmodule

module module140
#(parameter param198 = (((~^((8'h9f) ? (^(8'hb8)) : ((8'hb8) ? (8'hb4) : (8'h9f)))) ? ({(&(8'haa))} != (8'ha8)) : {(!((8'hb4) <<< (8'h9f))), (((8'hbb) | (8'ha0)) == (~^(8'hb1)))}) >>> ((((^~(8'ha7)) <= (~^(7'h44))) ? (((8'hab) ^ (8'h9f)) ? {(8'ha0)} : ((8'haa) >= (8'ha8))) : ({(8'h9c)} ? ((8'hab) ? (8'hb5) : (8'haa)) : {(8'h9e)})) >= (|(~^((8'hb6) ? (7'h42) : (8'hb0)))))), 
parameter param199 = (&{(((param198 >> param198) ? {param198, param198} : ((8'haa) ^ param198)) ? {{param198}, (param198 ~^ param198)} : {(param198 ? param198 : (7'h42))})}))
(y, clk, wire145, wire144, wire143, wire142, wire141);
  output wire [(32'h1f7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire145;
  input wire signed [(5'h15):(1'h0)] wire144;
  input wire [(4'ha):(1'h0)] wire143;
  input wire [(2'h3):(1'h0)] wire142;
  input wire signed [(2'h3):(1'h0)] wire141;
  wire signed [(4'he):(1'h0)] wire197;
  wire [(5'h15):(1'h0)] wire166;
  wire signed [(2'h2):(1'h0)] wire165;
  wire signed [(3'h5):(1'h0)] wire151;
  wire [(2'h2):(1'h0)] wire150;
  wire [(4'he):(1'h0)] wire149;
  wire signed [(3'h6):(1'h0)] wire148;
  wire signed [(2'h3):(1'h0)] wire147;
  wire signed [(5'h11):(1'h0)] wire146;
  reg signed [(4'he):(1'h0)] reg196 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg195 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg194 = (1'h0);
  reg [(4'h9):(1'h0)] reg193 = (1'h0);
  reg [(4'hc):(1'h0)] reg192 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg191 = (1'h0);
  reg [(4'he):(1'h0)] reg190 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg189 = (1'h0);
  reg [(3'h5):(1'h0)] reg188 = (1'h0);
  reg [(2'h2):(1'h0)] reg187 = (1'h0);
  reg [(4'hc):(1'h0)] reg186 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg185 = (1'h0);
  reg [(4'hd):(1'h0)] reg184 = (1'h0);
  reg [(3'h5):(1'h0)] reg183 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg182 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg181 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg180 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg179 = (1'h0);
  reg [(4'hb):(1'h0)] reg178 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg177 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg176 = (1'h0);
  reg [(2'h3):(1'h0)] reg175 = (1'h0);
  reg [(3'h7):(1'h0)] reg174 = (1'h0);
  reg [(3'h4):(1'h0)] reg173 = (1'h0);
  reg [(4'hc):(1'h0)] reg172 = (1'h0);
  reg [(4'hc):(1'h0)] reg171 = (1'h0);
  reg [(4'he):(1'h0)] reg170 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg169 = (1'h0);
  reg [(4'hd):(1'h0)] reg168 = (1'h0);
  reg [(3'h7):(1'h0)] reg167 = (1'h0);
  reg [(5'h15):(1'h0)] reg164 = (1'h0);
  reg [(2'h3):(1'h0)] reg163 = (1'h0);
  reg [(3'h4):(1'h0)] reg162 = (1'h0);
  reg [(5'h14):(1'h0)] reg161 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg160 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg159 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg158 = (1'h0);
  reg [(4'h8):(1'h0)] reg157 = (1'h0);
  reg [(4'hd):(1'h0)] reg156 = (1'h0);
  reg [(3'h7):(1'h0)] reg155 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg154 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg153 = (1'h0);
  reg signed [(4'he):(1'h0)] reg152 = (1'h0);
  assign y = {wire197,
                 wire166,
                 wire165,
                 wire151,
                 wire150,
                 wire149,
                 wire148,
                 wire147,
                 wire146,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
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
                 reg180,
                 reg179,
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
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 (1'h0)};
  assign wire146 = $signed($signed($signed({$signed(wire141),
                       (wire144 ~^ wire143)})));
  assign wire147 = $signed((8'ha0));
  assign wire148 = (8'had);
  assign wire149 = $signed(wire144);
  assign wire150 = ($unsigned($unsigned($signed($unsigned(wire146)))) ~^ (|(wire148[(2'h3):(1'h0)] ~^ ((wire146 ?
                       wire141 : wire146) != (wire144 <<< wire144)))));
  assign wire151 = ((-$signed((!(wire149 ? wire141 : wire142)))) ?
                       {$signed(wire148),
                           ((wire148[(2'h3):(2'h3)] ?
                                   {wire141, wire150} : $unsigned(wire143)) ?
                               wire142[(1'h1):(1'h1)] : wire149)} : ($signed(wire149) << wire150[(1'h1):(1'h1)]));
  always
    @(posedge clk) begin
      reg152 <= $unsigned($signed(wire144));
      reg153 <= $unsigned(wire143);
      reg154 <= wire148[(2'h3):(2'h3)];
      if (wire149)
        begin
          if ($unsigned(reg154))
            begin
              reg155 <= wire147;
              reg156 <= ($signed($unsigned(($unsigned(wire143) != $unsigned(wire144)))) && (!(8'haf)));
              reg157 <= {$signed((+{reg152[(2'h2):(1'h1)], (~&(7'h40))})),
                  $unsigned(({(8'hb2), $unsigned(reg152)} ?
                      ((~^wire145) + $signed((7'h41))) : $signed((~wire151))))};
              reg158 <= $signed(reg153);
              reg159 <= $unsigned(reg155);
            end
          else
            begin
              reg155 <= (($signed($signed((wire142 + wire144))) - $unsigned((wire141 ?
                      $unsigned(reg156) : (|reg158)))) ?
                  $signed($unsigned(((~wire150) ?
                      $signed(wire148) : reg154))) : $unsigned($signed(wire143)));
            end
          if (wire149)
            begin
              reg160 <= $signed((wire145 ?
                  ($signed(reg156) ?
                      ((|reg157) * wire150[(1'h0):(1'h0)]) : ((reg159 - wire150) >> $unsigned((8'ha2)))) : (($unsigned(wire142) ~^ reg159) ?
                      $signed((8'hac)) : wire149)));
            end
          else
            begin
              reg160 <= $unsigned({(wire144[(4'h9):(1'h0)] > wire147[(2'h3):(2'h2)]),
                  {(((8'had) ? wire146 : reg153) + {wire143, reg158})}});
            end
          reg161 <= {reg153, reg153};
        end
      else
        begin
          reg155 <= wire144[(2'h3):(2'h3)];
          if ((7'h43))
            begin
              reg156 <= $signed(wire143);
              reg157 <= (reg156[(3'h7):(3'h6)] >>> $unsigned((&(~reg161[(4'he):(3'h5)]))));
            end
          else
            begin
              reg156 <= $signed($signed(reg157[(3'h4):(2'h3)]));
            end
        end
    end
  always
    @(posedge clk) begin
      reg162 <= reg154[(4'h8):(3'h7)];
    end
  always
    @(posedge clk) begin
      reg163 <= (reg160 ?
          wire141 : ({wire146} ?
              {($unsigned(reg161) ~^ (wire151 >= reg162))} : $signed(wire145[(2'h3):(2'h2)])));
      reg164 <= ($signed((wire143[(1'h1):(1'h0)] | wire146[(4'hf):(3'h5)])) ?
          ({(8'hbc)} == (reg161[(1'h1):(1'h0)] < (&reg162))) : ((wire146 << (~&(wire151 ?
              reg153 : wire148))) | reg153));
    end
  assign wire165 = $signed((8'hbe));
  assign wire166 = ($signed(reg163) ? reg162 : reg156[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      if (({$unsigned($unsigned((reg161 ? reg158 : reg155))),
              $signed((^~reg153[(4'h8):(2'h2)]))} ?
          (~&({$signed(wire150)} == wire142[(2'h2):(2'h2)])) : (8'hbc)))
        begin
          if ($unsigned((~^$signed((!(~&reg157))))))
            begin
              reg167 <= ((wire145 << ((~|(wire165 ?
                      reg164 : (8'ha1))) == wire147)) ?
                  wire142 : {reg161[(2'h2):(1'h0)]});
              reg168 <= (8'h9c);
              reg169 <= ((((((8'hb7) ~^ wire150) ? wire141 : $signed(wire141)) ?
                      (~|(reg158 || reg156)) : ((reg168 ^ (8'ha4)) ~^ (reg154 << reg164))) ^~ (|(reg158 ?
                      wire146[(3'h4):(1'h1)] : reg155))) ?
                  (($unsigned(reg168[(3'h7):(2'h3)]) ?
                      (^~$signed(reg153)) : (reg152 ?
                          {wire165,
                              reg154} : reg160[(4'h8):(2'h2)])) ^~ $unsigned((~^$unsigned((7'h43))))) : (8'ha2));
              reg170 <= reg155;
              reg171 <= ($unsigned((wire143[(3'h6):(3'h4)] >> $unsigned($unsigned((8'hbe))))) <<< ((wire146[(4'hb):(3'h5)] && ({reg163,
                  reg160} ^ reg155[(3'h7):(2'h2)])) + reg157[(1'h0):(1'h0)]));
            end
          else
            begin
              reg167 <= (~&(~&(^~(~$unsigned(wire150)))));
              reg168 <= wire166[(4'hf):(4'hc)];
            end
        end
      else
        begin
          reg167 <= ({(reg156[(3'h7):(3'h7)] ?
                  ($unsigned(wire143) ?
                      reg156 : $unsigned(reg162)) : $unsigned((reg155 ?
                      wire148 : wire146)))} | (($unsigned($unsigned(reg171)) ?
              {wire142[(2'h3):(2'h3)],
                  (+(8'hbc))} : reg158[(1'h1):(1'h0)]) * ((|((8'hb8) ?
              reg171 : reg161)) * reg170[(3'h7):(1'h1)])));
          reg168 <= ((((wire144[(4'hb):(3'h7)] <<< (wire142 ?
                      reg159 : wire147)) ?
                  ($unsigned(wire147) ?
                      reg153[(3'h5):(1'h1)] : (|wire148)) : $unsigned((~|(8'haa)))) ?
              $unsigned(reg156) : $signed(($signed((8'h9c)) <= $signed((8'hb7))))) ^ $signed($signed(reg152)));
          reg169 <= (^((~|(+(|(8'ha0)))) == $unsigned(({wire143, (8'ha0)} ?
              (wire144 >= reg163) : {reg162}))));
          reg170 <= (wire150 == (reg167[(3'h4):(2'h2)] ? reg152 : reg170));
        end
      reg172 <= $unsigned($signed($signed((-(wire165 | wire165)))));
      reg173 <= ($signed($unsigned(($signed(wire143) ^~ (wire141 ?
              (8'ha4) : reg169)))) ?
          ((~&{(|wire142)}) ?
              $signed((8'hbe)) : wire149) : reg155[(3'h6):(3'h6)]);
    end
  always
    @(posedge clk) begin
      if (reg152)
        begin
          reg174 <= wire146;
          reg175 <= reg170[(4'hd):(3'h6)];
          reg176 <= reg153[(2'h3):(2'h2)];
        end
      else
        begin
          reg174 <= ($signed($unsigned(({(8'hac),
              wire146} > reg171[(3'h4):(1'h1)]))) != ((8'h9d) > (({reg160} == (reg168 ?
                  wire145 : reg157)) ?
              ($unsigned(reg162) ?
                  (wire145 ?
                      wire165 : reg156) : $unsigned(wire144)) : ($signed(reg152) >> wire146))));
          reg175 <= (~^(+{((reg156 ? wire151 : reg174) ~^ (reg173 ?
                  reg153 : wire145))}));
          if (reg168)
            begin
              reg176 <= $unsigned(wire145[(2'h3):(2'h3)]);
            end
          else
            begin
              reg176 <= (~&({(!{wire144})} ?
                  ($signed($signed((8'hb3))) ^ ($signed(wire147) < (8'h9c))) : (~^$signed((wire144 ?
                      reg154 : (8'h9e))))));
            end
          if (reg171[(3'h7):(1'h1)])
            begin
              reg177 <= (wire145 ? reg159 : reg157[(2'h2):(1'h0)]);
              reg178 <= $unsigned((reg159[(4'h9):(1'h1)] || ($signed(reg161[(1'h1):(1'h1)]) ?
                  wire150 : reg164)));
              reg179 <= {($unsigned($unsigned(reg154)) - $unsigned((reg159[(4'h9):(2'h3)] ?
                      reg167 : $signed(wire150)))),
                  $signed({($unsigned(reg174) ?
                          reg173[(1'h1):(1'h0)] : wire144[(2'h2):(2'h2)])})};
              reg180 <= (($signed((~&reg156)) ?
                      (wire148[(2'h2):(2'h2)] <<< (+(~reg178))) : (((&reg173) * reg167[(1'h0):(1'h0)]) ?
                          $signed((wire146 ?
                              (8'ha2) : reg156)) : (reg175[(2'h3):(1'h0)] || (wire142 ?
                              reg176 : reg172)))) ?
                  {($signed($signed((8'hb7))) ?
                          (^~(wire141 ?
                              reg169 : wire145)) : reg170)} : ((^$unsigned(wire165)) * reg171));
              reg181 <= $signed(wire144);
            end
          else
            begin
              reg177 <= $signed($signed((&($signed(reg178) ?
                  reg172 : (reg164 | wire146)))));
            end
          reg182 <= ($unsigned(wire142[(1'h0):(1'h0)]) ?
              (8'hbc) : ($unsigned((((8'hb1) ^ (8'ha3)) != {reg159, wire148})) ?
                  (~|$unsigned((reg157 ?
                      wire145 : reg163))) : $unsigned(reg153)));
        end
      reg183 <= (|(wire148[(2'h3):(1'h0)] ^~ $unsigned($signed($unsigned(wire147)))));
      reg184 <= reg168[(3'h4):(1'h0)];
      reg185 <= reg164;
    end
  always
    @(posedge clk) begin
      if ((+reg180))
        begin
          reg186 <= $signed(reg172[(1'h0):(1'h0)]);
          if (($unsigned((8'hb9)) ?
              reg163 : ({reg162, $unsigned($unsigned(reg181))} ?
                  $unsigned($unsigned(wire148[(3'h5):(2'h2)])) : ({reg183[(2'h3):(2'h3)],
                          (~&reg155)} ?
                      (~reg185) : $unsigned($unsigned(wire151))))))
            begin
              reg187 <= $unsigned(reg159);
            end
          else
            begin
              reg187 <= (!$signed((~&$signed($unsigned(wire165)))));
              reg188 <= reg159;
              reg189 <= wire151[(2'h3):(1'h1)];
              reg190 <= ($signed({($signed(wire145) + (&reg158)), (8'hb6)}) ?
                  ($signed({reg181,
                      reg169[(3'h4):(2'h2)]}) || (~$signed((wire151 * (8'hb2))))) : $signed($unsigned(wire150)));
            end
          reg191 <= $signed(((7'h42) >> {reg188,
              (+(reg158 ? (8'h9e) : wire143))}));
          reg192 <= ((reg178[(1'h0):(1'h0)] ?
              $unsigned({(reg171 ? reg167 : (8'hbd))}) : reg152) & reg159);
        end
      else
        begin
          reg186 <= (({((8'hb9) ? ((8'hb1) && reg186) : (&wire143))} ?
              reg177[(4'h8):(3'h4)] : reg174) | $signed(((|$unsigned(reg185)) ?
              reg182 : (reg181 ? reg187 : (-reg170)))));
          reg187 <= (wire151[(1'h0):(1'h0)] & {(reg180 ?
                  (reg164[(5'h11):(3'h4)] + (reg178 ?
                      wire146 : wire147)) : {(wire146 ? wire165 : reg176),
                      (!reg167)}),
              reg159});
        end
      if (reg155[(1'h0):(1'h0)])
        begin
          reg193 <= (-reg184);
          reg194 <= (^~$unsigned(wire141[(2'h2):(1'h1)]));
          reg195 <= (8'hbb);
          reg196 <= reg153;
        end
      else
        begin
          reg193 <= $unsigned((reg193 >> $signed(((reg196 + reg170) ?
              $unsigned((8'haa)) : (~|reg180)))));
        end
    end
  assign wire197 = ({(($signed(reg156) ?
                                   $unsigned(reg184) : (reg176 ^~ reg179)) ?
                               (-$unsigned((8'ha3))) : (+wire148[(3'h5):(3'h4)]))} ?
                       ($signed({(wire151 ?
                               wire145 : reg182)}) << (8'hbc)) : reg169);
endmodule
