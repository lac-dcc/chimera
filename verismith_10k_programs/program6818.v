module top
#(parameter param160 = {((|((~&(8'hb5)) ? ((8'hbb) && (8'ha5)) : (~|(8'ha1)))) >>> (~&(^~(&(8'ha1))))), ((-(!((8'hab) == (8'ha3)))) == ((((8'hbc) > (8'haa)) | ((8'hb7) ? (8'hb7) : (7'h40))) ~^ ({(8'hb9), (8'hb4)} != {(8'hba), (8'hae)})))}, 
parameter param161 = ((^(&(~{param160}))) << param160))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h174):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire0;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire4;
  wire [(4'ha):(1'h0)] wire143;
  wire signed [(5'h13):(1'h0)] wire142;
  wire signed [(5'h14):(1'h0)] wire141;
  wire signed [(3'h7):(1'h0)] wire140;
  wire [(5'h10):(1'h0)] wire139;
  wire [(5'h11):(1'h0)] wire138;
  wire [(4'hb):(1'h0)] wire8;
  wire [(5'h12):(1'h0)] wire9;
  wire signed [(3'h7):(1'h0)] wire10;
  wire [(2'h2):(1'h0)] wire11;
  wire [(3'h4):(1'h0)] wire12;
  wire signed [(4'hb):(1'h0)] wire136;
  reg signed [(3'h4):(1'h0)] reg159 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg158 = (1'h0);
  reg [(5'h12):(1'h0)] reg157 = (1'h0);
  reg [(4'ha):(1'h0)] reg156 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg155 = (1'h0);
  reg [(4'hc):(1'h0)] reg154 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg153 = (1'h0);
  reg [(5'h11):(1'h0)] reg152 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg151 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg150 = (1'h0);
  reg [(5'h13):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg148 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg147 = (1'h0);
  reg [(4'hd):(1'h0)] reg146 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg145 = (1'h0);
  reg [(5'h13):(1'h0)] reg144 = (1'h0);
  reg [(5'h14):(1'h0)] reg7 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg6 = (1'h0);
  reg [(2'h3):(1'h0)] reg5 = (1'h0);
  assign y = {wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire139,
                 wire138,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire136,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= $signed(((~^wire2) ?
          (wire2 ? wire4 : wire3) : (wire1[(1'h0):(1'h0)] ?
              $signed({wire0, wire3}) : $unsigned($signed(wire0)))));
      reg6 <= reg5[(2'h2):(2'h2)];
      reg7 <= $unsigned({$signed(wire0[(4'h9):(3'h6)])});
    end
  assign wire8 = ($signed($unsigned(wire4[(4'hb):(4'hb)])) < wire4[(1'h0):(1'h0)]);
  assign wire9 = (-reg6);
  assign wire10 = $unsigned(wire3[(3'h7):(1'h1)]);
  assign wire11 = {(!$unsigned(({wire4, wire3} ?
                          (wire3 ? reg7 : wire9) : wire2[(2'h2):(1'h0)]))),
                      (reg6[(3'h5):(1'h1)] <= wire10[(3'h5):(2'h3)])};
  assign wire12 = $signed(reg7[(2'h3):(1'h1)]);
  module13 #() modinst137 (.wire17(reg6), .wire16(wire4), .clk(clk), .y(wire136), .wire14(wire8), .wire18(wire9), .wire15(reg7));
  assign wire138 = wire2[(3'h4):(2'h2)];
  assign wire139 = $unsigned($signed({{wire3[(2'h3):(1'h1)]}}));
  assign wire140 = (wire8[(3'h4):(2'h2)] & (8'h9f));
  assign wire141 = reg7;
  assign wire142 = (wire141[(4'ha):(4'h8)] - wire3);
  assign wire143 = ((~&($signed($signed(wire12)) >> wire11[(1'h0):(1'h0)])) != wire136[(4'h8):(1'h0)]);
  always
    @(posedge clk) begin
      reg144 <= wire0[(2'h2):(1'h1)];
      if ($signed((wire138[(2'h3):(1'h0)] ?
          $signed(($unsigned((8'hac)) ?
              wire136 : wire2[(2'h2):(1'h0)])) : $unsigned($unsigned(wire143)))))
        begin
          reg145 <= $unsigned((-wire139[(4'hf):(1'h1)]));
          reg146 <= wire9[(4'hc):(1'h0)];
          reg147 <= $unsigned(wire11);
        end
      else
        begin
          if ((((wire0[(4'h9):(2'h2)] ?
                  ({wire12, wire1} * $signed(wire143)) : $signed(((8'ha3) ?
                      wire140 : wire3))) <= $signed((^$signed((8'hab))))) ?
              (^~$signed(($signed((7'h42)) ?
                  ((8'hb8) ?
                      reg5 : (8'hab)) : wire11[(1'h0):(1'h0)]))) : (7'h41)))
            begin
              reg145 <= reg144[(1'h0):(1'h0)];
              reg146 <= wire141[(2'h2):(1'h0)];
              reg147 <= wire138[(2'h3):(2'h2)];
            end
          else
            begin
              reg145 <= wire8[(3'h6):(1'h1)];
              reg146 <= (wire136 < wire2[(1'h1):(1'h1)]);
              reg147 <= (^~$signed((($signed(wire2) >>> wire10) ?
                  $unsigned((wire11 ? wire3 : wire136)) : ($unsigned(wire1) ?
                      {reg144} : {wire141, (8'hbb)}))));
              reg148 <= ($unsigned(reg7) >> (reg144 < reg147[(4'hc):(3'h7)]));
              reg149 <= ((!(&wire2[(3'h5):(1'h0)])) ?
                  $unsigned((($signed(wire8) * (reg7 | reg147)) ?
                      wire8[(2'h2):(1'h1)] : $unsigned($unsigned(reg144)))) : (&{$signed({wire142})}));
            end
          reg150 <= (~&wire9[(3'h4):(1'h1)]);
          reg151 <= {$unsigned({{wire136[(3'h5):(2'h3)]},
                  $unsigned((reg6 ? wire143 : wire11))})};
        end
      reg152 <= $signed(($unsigned(((reg7 == reg147) || (wire0 == reg146))) << reg146));
      reg153 <= $unsigned((({reg145} ?
              reg7[(4'he):(4'ha)] : ($unsigned(wire136) ^~ $signed(wire140))) ?
          wire4[(5'h12):(4'hb)] : $signed($signed((~^wire0)))));
    end
  always
    @(posedge clk) begin
      reg154 <= (reg147[(4'h8):(3'h5)] & $signed((wire2 ?
          wire4 : $signed((reg6 ? reg7 : reg153)))));
      if ($unsigned(wire11[(1'h0):(1'h0)]))
        begin
          reg155 <= wire138[(2'h3):(2'h3)];
        end
      else
        begin
          reg155 <= (((({(8'hbe)} ? $signed(reg145) : $signed(wire140)) ?
                      (8'hbf) : wire4) ?
                  $signed(wire4[(3'h4):(1'h0)]) : reg151[(4'hb):(1'h1)]) ?
              reg147[(1'h1):(1'h1)] : (-$unsigned({$signed(wire143),
                  (~wire1)})));
          reg156 <= (8'haa);
          reg157 <= $signed(((($unsigned(wire9) ?
                  $signed(wire9) : (wire141 <= (8'h9e))) ?
              ($unsigned(reg6) ?
                  $unsigned(wire8) : $signed(wire140)) : reg152) & ((~&(wire11 >= reg145)) >= $signed($unsigned(reg156)))));
          reg158 <= $signed(((|wire136) ?
              (~|((^~(7'h42)) ? (8'hab) : reg156)) : $signed((!(+wire8)))));
        end
      reg159 <= $signed({{reg151[(2'h2):(2'h2)]}});
    end
endmodule

module module13
#(parameter param135 = ((~|((~&(8'hba)) ? {(8'ha2), (^(8'hb2))} : {(+(8'ha2))})) << ((({(8'haa), (8'hbb)} ? (&(8'hbf)) : ((8'hbf) ? (8'h9c) : (8'ha3))) >>> {(-(8'ha1)), ((8'hb2) ^~ (8'had))}) ? (+(8'hb2)) : ((~&{(8'h9f)}) ^ ((~^(7'h42)) <= ((8'haa) * (8'hba)))))))
(y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'h1a6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire18;
  input wire [(3'h7):(1'h0)] wire17;
  input wire [(5'h13):(1'h0)] wire16;
  input wire [(5'h14):(1'h0)] wire15;
  input wire signed [(4'h8):(1'h0)] wire14;
  wire signed [(3'h7):(1'h0)] wire134;
  wire signed [(3'h6):(1'h0)] wire133;
  wire [(2'h3):(1'h0)] wire132;
  wire [(4'h8):(1'h0)] wire131;
  wire signed [(5'h12):(1'h0)] wire130;
  wire signed [(3'h5):(1'h0)] wire128;
  wire [(5'h15):(1'h0)] wire42;
  wire signed [(5'h11):(1'h0)] wire41;
  wire signed [(2'h2):(1'h0)] wire40;
  wire signed [(3'h5):(1'h0)] wire39;
  wire signed [(5'h12):(1'h0)] wire38;
  wire [(5'h14):(1'h0)] wire36;
  wire [(5'h13):(1'h0)] wire19;
  reg [(4'h8):(1'h0)] reg43 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg46 = (1'h0);
  reg [(5'h12):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg48 = (1'h0);
  reg [(4'ha):(1'h0)] reg49 = (1'h0);
  reg [(4'hf):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg51 = (1'h0);
  reg [(2'h3):(1'h0)] reg52 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg53 = (1'h0);
  reg [(3'h4):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg58 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg59 = (1'h0);
  reg [(4'h8):(1'h0)] reg60 = (1'h0);
  reg [(4'hd):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg62 = (1'h0);
  reg [(5'h11):(1'h0)] reg63 = (1'h0);
  reg [(5'h11):(1'h0)] reg64 = (1'h0);
  reg [(2'h3):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg67 = (1'h0);
  reg signed [(4'he):(1'h0)] reg68 = (1'h0);
  assign y = {wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire128,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire36,
                 wire19,
                 reg43,
                 reg44,
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
                 (1'h0)};
  assign wire19 = ((&(&(&$signed(wire14)))) <<< ((~|$unsigned((wire17 ?
                      wire16 : wire14))) < ((&(wire16 ?
                      (8'ha0) : wire17)) ^~ ($signed((8'ha4)) == (~^wire15)))));
  module20 #() modinst37 (wire36, clk, wire17, wire14, wire19, wire18);
  assign wire38 = (~&((wire14 == {$unsigned(wire36), $signed(wire16)}) ?
                      wire16 : ((&$signed(wire15)) == (wire16[(4'ha):(3'h6)] ?
                          wire17[(3'h7):(2'h3)] : (wire36 - wire36)))));
  assign wire39 = wire16;
  assign wire40 = (((~|((wire14 ^~ (8'hb7)) ?
                          $signed(wire16) : (wire39 ?
                              wire16 : wire39))) & $unsigned({(wire18 >> wire18),
                          wire17[(1'h0):(1'h0)]})) ?
                      $signed(wire17) : $signed(($unsigned(wire18[(4'h9):(2'h2)]) ?
                          (!$signed(wire16)) : (8'ha2))));
  assign wire41 = (~{($unsigned((~|wire17)) + $unsigned($unsigned((8'ha6))))});
  assign wire42 = $unsigned(wire38[(4'hd):(4'hd)]);
  always
    @(posedge clk) begin
      if (wire40)
        begin
          if ((wire19[(2'h2):(1'h0)] ?
              {(($unsigned(wire18) <= (!wire41)) ?
                      ((wire40 ?
                          wire40 : wire40) == (wire40 & wire19)) : wire39)} : ((wire18[(4'hf):(3'h6)] ?
                      ({(8'hac)} ?
                          (wire40 ~^ wire42) : (8'hb9)) : (wire39[(1'h0):(1'h0)] < (wire38 ?
                          wire16 : wire42))) ?
                  wire38 : wire15)))
            begin
              reg43 <= ($unsigned(wire15) ?
                  (^~(wire15[(5'h14):(5'h11)] ?
                      wire15[(5'h13):(4'h8)] : $signed($unsigned(wire19)))) : ($unsigned(wire42) ?
                      wire40 : ($unsigned(((7'h42) ? wire38 : wire40)) ?
                          wire18[(5'h12):(1'h1)] : (^~$signed(wire18)))));
              reg44 <= wire42;
            end
          else
            begin
              reg43 <= $signed((8'ha8));
              reg44 <= wire39;
              reg45 <= (~&wire38);
              reg46 <= ({(^$signed((reg45 ?
                      wire17 : (8'ha7))))} >= {$signed((((8'ha2) >> wire19) ?
                      wire41 : ((7'h44) == (8'ha1))))});
            end
        end
      else
        begin
          if (((wire42[(3'h4):(3'h4)] <<< $signed(wire17[(3'h6):(1'h1)])) ?
              $signed(wire18) : {((wire18[(3'h7):(1'h0)] << (wire42 ?
                          wire14 : (8'ha3))) ?
                      $unsigned((wire39 ^~ wire40)) : (^~(reg43 | reg44)))}))
            begin
              reg43 <= ((!((~$signed(wire36)) ^~ wire14[(3'h6):(3'h4)])) ?
                  {reg46[(2'h2):(1'h1)]} : ((wire38 ^~ $unsigned((^~(8'hbb)))) <<< wire18));
              reg44 <= $unsigned((((&wire16[(4'hd):(2'h2)]) ?
                  ((reg43 ? wire19 : reg46) ?
                      (|wire40) : wire38[(3'h7):(2'h3)]) : (wire38 << ((8'ha5) ?
                      (8'hb5) : wire15))) < (wire38 && ((reg46 >= wire18) ^~ {wire38}))));
              reg45 <= (~|wire16);
              reg46 <= wire19;
            end
          else
            begin
              reg43 <= (reg46[(5'h12):(3'h5)] + $unsigned(reg45));
              reg44 <= (wire16[(5'h10):(4'h9)] <= $signed($unsigned(((wire17 ?
                      reg43 : (8'ha1)) ?
                  $signed(wire17) : wire40))));
            end
          if (((reg46 + $unsigned((8'hba))) ?
              $unsigned(wire16[(4'hd):(4'h8)]) : $unsigned((!reg46[(3'h4):(1'h0)]))))
            begin
              reg47 <= wire14;
              reg48 <= reg47[(1'h0):(1'h0)];
            end
          else
            begin
              reg47 <= (-$signed(wire40));
              reg48 <= {(-(wire15 ?
                      wire17[(3'h5):(1'h1)] : (wire16 || wire42[(4'hc):(3'h4)])))};
              reg49 <= ((~&$unsigned(wire16[(5'h11):(4'ha)])) ^~ wire38[(4'ha):(3'h4)]);
              reg50 <= ((reg44 ?
                  (^~(^wire17[(3'h4):(3'h4)])) : reg46) + reg44[(3'h4):(1'h1)]);
            end
          if ((8'h9e))
            begin
              reg51 <= $unsigned($signed({((&wire15) ?
                      (!reg46) : reg48[(3'h5):(1'h0)])}));
              reg52 <= (~^(wire36[(4'h9):(2'h3)] <<< (((wire36 ~^ wire38) == reg49) << wire40[(1'h1):(1'h0)])));
            end
          else
            begin
              reg51 <= ({$signed((wire18 * $unsigned(reg45)))} ?
                  ($signed($signed(reg45)) ?
                      wire18 : (^~((wire36 ?
                          reg45 : reg52) <= reg44))) : {wire16,
                      $unsigned(reg50)});
              reg52 <= ($unsigned(reg47) - reg48[(2'h2):(2'h2)]);
            end
          reg53 <= ((-$unsigned((&(-wire17)))) ?
              $signed(wire19[(3'h5):(1'h0)]) : reg47[(3'h7):(1'h1)]);
        end
      if ($unsigned(wire41[(4'hb):(4'hb)]))
        begin
          if ($signed((!(reg51[(2'h3):(2'h3)] * wire41))))
            begin
              reg54 <= {(wire36[(5'h13):(3'h6)] * $unsigned($signed((reg46 < wire18)))),
                  ($unsigned($signed((wire36 >>> (8'hba)))) ?
                      $unsigned((~^{(8'h9f)})) : wire15[(2'h3):(1'h1)])};
              reg55 <= $unsigned(wire39[(1'h0):(1'h0)]);
              reg56 <= $unsigned(reg52);
              reg57 <= $unsigned($signed($unsigned((reg43[(1'h0):(1'h0)] ?
                  (reg43 ? reg45 : wire17) : (wire41 ? reg55 : reg50)))));
            end
          else
            begin
              reg54 <= (|((reg43 ?
                  (reg44[(4'ha):(4'h9)] ?
                      (wire16 ?
                          wire17 : (8'ha3)) : (reg44 + reg52)) : ((reg47 != wire39) + reg46)) << $signed($signed((+wire40)))));
            end
          reg58 <= $unsigned(reg48[(2'h3):(2'h3)]);
          reg59 <= $unsigned(((~|{$signed(reg50), (wire40 ? reg53 : wire40)}) ?
              ((wire41[(4'hc):(2'h3)] + (wire41 && wire36)) ^~ ((wire14 ?
                  reg45 : reg45) >> reg50)) : ({(wire40 ? reg48 : wire18)} ?
                  (8'hbc) : $unsigned(reg51))));
          reg60 <= $unsigned(($unsigned({(reg43 ?
                  (8'ha3) : wire18)}) <<< (^~$signed(((8'had) == reg48)))));
        end
      else
        begin
          if (((8'hb0) + (+reg45)))
            begin
              reg54 <= reg55;
              reg55 <= $unsigned(((~^$signed(reg47)) || wire17[(2'h2):(1'h1)]));
              reg56 <= (~reg46);
              reg57 <= (($signed((~^$signed(wire41))) <= ((((8'hac) ?
                              reg51 : reg48) ?
                          reg52 : $unsigned(reg51)) ?
                      $signed($signed(reg45)) : (|(8'hbc)))) ?
                  wire14[(3'h6):(1'h0)] : reg48[(3'h5):(3'h4)]);
            end
          else
            begin
              reg54 <= $unsigned((reg60 && $signed({(~wire18)})));
              reg55 <= reg46;
            end
          if (reg55)
            begin
              reg58 <= ($signed((wire40[(1'h1):(1'h0)] ?
                  {$signed(wire40),
                      $unsigned((8'ha9))} : $signed({(8'h9d)}))) >= $unsigned(({$unsigned(reg54),
                      wire36[(4'hb):(3'h4)]} ?
                  reg47 : $signed($signed(reg47)))));
            end
          else
            begin
              reg58 <= ((wire41[(4'he):(1'h0)] >> ({{reg56, wire19},
                      wire17[(3'h6):(3'h5)]} ?
                  $signed($unsigned((8'hb1))) : $unsigned({wire16,
                      reg54}))) & (((reg50 ?
                  (wire42 ?
                      (8'hb3) : reg59) : ((8'hba) >= wire40)) - $signed((~|reg45))) ^ (((~^reg54) ^~ wire42[(3'h6):(3'h5)]) + ($unsigned(reg54) > $signed(reg46)))));
              reg59 <= (!(wire14[(1'h0):(1'h0)] - $unsigned(((reg59 ?
                      reg45 : wire19) ?
                  (wire38 <<< reg46) : $unsigned(reg60)))));
            end
          reg60 <= ((~&wire38) ^~ $unsigned($signed(((wire15 ?
              reg51 : reg44) <<< reg51))));
          reg61 <= $signed((^~($unsigned((reg50 ? reg56 : wire39)) ?
              reg43[(4'h8):(3'h5)] : $unsigned(wire14))));
          if (wire15)
            begin
              reg62 <= {$signed($unsigned(wire15))};
            end
          else
            begin
              reg62 <= (reg54 && reg44);
              reg63 <= (~|reg58);
              reg64 <= $unsigned(wire16[(4'hd):(3'h4)]);
              reg65 <= (!(|((-wire14[(3'h5):(2'h3)]) ?
                  $signed((reg55 >= (8'ha5))) : reg50)));
            end
        end
      reg66 <= $unsigned((+$unsigned((&(wire38 ? reg64 : reg52)))));
      reg67 <= $unsigned(({wire39} ?
          (($unsigned(wire38) ~^ $unsigned(reg44)) - $signed((reg55 <<< reg65))) : (~^(|(wire17 ?
              wire16 : reg59)))));
      reg68 <= reg53;
    end
  module69 #() modinst129 (.clk(clk), .wire70(wire19), .wire73(reg68), .y(wire128), .wire72(wire41), .wire74(reg55), .wire71(reg61));
  assign wire130 = $signed(reg43);
  assign wire131 = $signed((|$unsigned($unsigned((&wire42)))));
  assign wire132 = {{({$signed(reg51)} ? wire38 : $unsigned(wire14))}, wire16};
  assign wire133 = wire16[(4'hb):(2'h2)];
  assign wire134 = (|$unsigned(reg46));
endmodule

module module69
#(parameter param126 = (((+{((8'h9e) ? (8'hb4) : (7'h42))}) - ({((8'haa) ^ (8'h9d)), {(8'hb3)}} || (&(!(8'hb1))))) | (((((8'haa) ? (7'h44) : (8'ha7)) >= ((8'hba) >= (8'hbe))) ? ({(8'ha9)} >= ((8'hb7) + (8'h9e))) : (((8'hbb) << (8'haa)) | ((7'h44) ? (8'h9f) : (8'hb1)))) ? ((((7'h41) << (8'ha1)) ? (+(8'ha2)) : (~&(8'hac))) ? ({(8'hb4)} ? (^(8'hae)) : {(8'ha2)}) : (((8'hb0) <= (8'ha9)) ? (^~(8'ha7)) : ((8'hbe) ? (8'hbe) : (8'hbd)))) : (((|(8'ha7)) ? ((8'hae) ? (8'ha1) : (8'ha1)) : (|(8'ha8))) ? ({(8'hb1), (8'ha5)} ? ((7'h42) >>> (8'hb4)) : ((8'ha0) || (8'ha9))) : (((8'hb1) ? (7'h41) : (8'haa)) ? {(8'hb3), (8'hb9)} : {(8'h9c), (8'hb9)})))), 
parameter param127 = {((param126 == param126) << param126)})
(y, clk, wire74, wire73, wire72, wire71, wire70);
  output wire [(32'h25c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire74;
  input wire [(4'he):(1'h0)] wire73;
  input wire signed [(4'hd):(1'h0)] wire72;
  input wire signed [(4'hd):(1'h0)] wire71;
  input wire [(5'h12):(1'h0)] wire70;
  wire [(5'h11):(1'h0)] wire125;
  wire signed [(3'h5):(1'h0)] wire124;
  wire signed [(4'h9):(1'h0)] wire123;
  wire signed [(2'h3):(1'h0)] wire122;
  wire signed [(5'h13):(1'h0)] wire88;
  wire [(4'hf):(1'h0)] wire84;
  wire [(2'h3):(1'h0)] wire83;
  wire [(3'h4):(1'h0)] wire82;
  wire signed [(5'h15):(1'h0)] wire81;
  wire [(5'h10):(1'h0)] wire80;
  wire signed [(4'hd):(1'h0)] wire79;
  wire signed [(5'h12):(1'h0)] wire78;
  wire signed [(5'h12):(1'h0)] wire77;
  wire [(2'h3):(1'h0)] wire76;
  wire signed [(4'hd):(1'h0)] wire75;
  reg signed [(4'h9):(1'h0)] reg121 = (1'h0);
  reg [(5'h11):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg119 = (1'h0);
  reg [(4'ha):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg117 = (1'h0);
  reg [(4'ha):(1'h0)] reg116 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg115 = (1'h0);
  reg [(5'h12):(1'h0)] reg114 = (1'h0);
  reg [(3'h4):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg111 = (1'h0);
  reg [(5'h13):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg109 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg107 = (1'h0);
  reg [(4'hc):(1'h0)] reg106 = (1'h0);
  reg signed [(4'he):(1'h0)] reg105 = (1'h0);
  reg [(5'h12):(1'h0)] reg104 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg102 = (1'h0);
  reg [(4'hc):(1'h0)] reg101 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg100 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg99 = (1'h0);
  reg signed [(4'he):(1'h0)] reg98 = (1'h0);
  reg [(5'h12):(1'h0)] reg97 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg96 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg95 = (1'h0);
  reg [(4'hd):(1'h0)] reg94 = (1'h0);
  reg [(4'hb):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg92 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg91 = (1'h0);
  reg [(2'h2):(1'h0)] reg90 = (1'h0);
  reg [(4'ha):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg87 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg86 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg85 = (1'h0);
  assign y = {wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire88,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
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
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg87,
                 reg86,
                 reg85,
                 (1'h0)};
  assign wire75 = (-$unsigned($unsigned((|(^(8'hb0))))));
  assign wire76 = ((($unsigned({wire71,
                          (8'hb2)}) <= (wire70[(3'h7):(3'h4)] == (wire72 ^ wire73))) >= (&(&$unsigned(wire72)))) ?
                      wire71[(4'h8):(1'h1)] : (~&{$unsigned((wire73 ?
                              wire73 : wire75)),
                          $unsigned(wire71)}));
  assign wire77 = (+(~&(&((+wire73) && wire73))));
  assign wire78 = ({((&(wire76 ? wire75 : wire72)) >= {$unsigned(wire70)}),
                      ((~$signed(wire77)) ?
                          {$signed(wire76),
                              (wire72 || wire70)} : wire74)} && wire72[(4'hd):(1'h0)]);
  assign wire79 = (wire72[(3'h5):(1'h1)] ?
                      ((~^(~&(^(7'h42)))) != $unsigned((7'h40))) : {wire75[(4'h9):(4'h9)],
                          (wire76[(1'h0):(1'h0)] ?
                              $unsigned($unsigned(wire71)) : (&wire72[(1'h0):(1'h0)]))});
  assign wire80 = ((($signed((wire73 <= (8'hbe))) * wire73) >>> wire78[(3'h7):(3'h5)]) < {{$unsigned(wire76),
                          $signed($unsigned((7'h44)))}});
  assign wire81 = $unsigned((((8'ha6) ?
                      $unsigned(wire79[(4'h8):(4'h8)]) : wire73) & ($signed($signed(wire72)) >> $unsigned(((8'h9d) >> wire76)))));
  assign wire82 = $signed($unsigned((-(&$signed((8'h9d))))));
  assign wire83 = wire76[(1'h1):(1'h1)];
  assign wire84 = wire74[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg85 <= wire83[(1'h1):(1'h0)];
      reg86 <= (7'h43);
      reg87 <= ((!($unsigned((~&wire80)) < reg86)) * $signed($unsigned($signed($unsigned((8'hb2))))));
    end
  assign wire88 = $signed((~($signed((+wire79)) ~^ ($unsigned(wire70) - $unsigned(wire73)))));
  always
    @(posedge clk) begin
      reg89 <= $unsigned((~($unsigned((wire77 ? (8'ha2) : wire84)) ?
          (^~$unsigned(wire77)) : (8'hba))));
      reg90 <= (($unsigned(wire74) || (~((wire79 ^~ wire72) ^ $unsigned(wire74)))) < $signed({wire70}));
      reg91 <= (wire75[(2'h2):(1'h0)] ?
          ((wire77[(1'h0):(1'h0)] ^ $unsigned((+wire81))) >= (~|reg85)) : reg87);
    end
  always
    @(posedge clk) begin
      if ($unsigned($signed($unsigned((&{wire80, reg89})))))
        begin
          reg92 <= {((($unsigned(wire81) ?
                          (wire76 ? wire73 : wire83) : (wire71 <= reg86)) ?
                      (~&$signed((8'hab))) : (reg85[(1'h0):(1'h0)] ?
                          $signed(reg90) : $signed(reg87))) ?
                  (^~(((8'ha0) ?
                      wire81 : wire73) >> wire82[(2'h3):(2'h3)])) : wire74)};
          reg93 <= (8'hab);
          if ($signed(((~|(reg93[(4'ha):(1'h0)] ?
              ((8'hb5) ?
                  wire76 : reg86) : ((8'ha2) << wire84))) == $signed(((~|reg85) || (~&(8'ha5)))))))
            begin
              reg94 <= (|{$signed($signed((|wire76)))});
              reg95 <= $unsigned($unsigned((^~wire88[(4'hb):(4'h9)])));
              reg96 <= $signed($signed({$unsigned((reg85 ? wire84 : wire73)),
                  (((8'hba) ? (8'h9f) : wire72) | (reg95 ? wire88 : reg89))}));
            end
          else
            begin
              reg94 <= $unsigned($signed((wire70 ?
                  ({reg95} && (~wire73)) : reg86[(2'h3):(2'h2)])));
              reg95 <= {((&(wire82 == reg91[(3'h5):(3'h4)])) ?
                      $unsigned(((reg89 ?
                          (8'hb0) : wire81) | $unsigned(reg95))) : reg91[(3'h6):(3'h4)]),
                  reg85[(2'h2):(1'h0)]};
              reg96 <= wire88[(2'h2):(2'h2)];
            end
          reg97 <= reg87;
        end
      else
        begin
          reg92 <= $unsigned($signed($signed($signed($unsigned(reg89)))));
          reg93 <= {{($unsigned(reg92) > $signed($signed((8'h9e))))}};
          reg94 <= $signed(wire73);
        end
      reg98 <= $signed($signed((($unsigned(wire81) ?
              ((8'h9c) ? reg96 : wire78) : $signed(wire77)) ?
          ({(8'ha0)} ^~ ((8'hb7) >= wire74)) : ({wire78} <= wire80))));
      if ($unsigned({reg97, (|$signed($unsigned((8'hb6))))}))
        begin
          reg99 <= $unsigned((|wire75[(3'h5):(2'h3)]));
          reg100 <= $signed($signed($unsigned((wire79 & $unsigned(reg86)))));
        end
      else
        begin
          if ((-$unsigned(((+wire77) ?
              $signed($signed(wire70)) : $signed((wire76 <<< wire78))))))
            begin
              reg99 <= wire74[(1'h0):(1'h0)];
              reg100 <= (^~(~^reg90));
              reg101 <= $signed($unsigned($unsigned(wire70)));
            end
          else
            begin
              reg99 <= $signed($signed($signed(wire76[(2'h2):(1'h1)])));
              reg100 <= $signed({(&wire82[(1'h1):(1'h1)]),
                  (^~$signed(wire70))});
              reg101 <= (wire79 ? $unsigned(wire84) : reg95[(5'h11):(1'h0)]);
              reg102 <= wire70[(5'h11):(4'h8)];
              reg103 <= ($unsigned((^~wire74[(2'h3):(1'h0)])) ?
                  ($unsigned(reg93) ?
                      wire80 : reg97) : $unsigned($unsigned((reg98 ?
                      (reg95 >>> reg87) : (wire73 - wire76)))));
            end
          reg104 <= wire74;
          reg105 <= (((-$signed((wire79 * (7'h40)))) ?
              ({{reg90, (8'hbf)}, $signed(reg96)} * ((wire88 > reg91) ?
                  {wire81,
                      wire70} : wire72)) : $unsigned((~^$unsigned(reg100)))) >> (8'hb2));
        end
    end
  always
    @(posedge clk) begin
      reg106 <= (&$signed((((~|wire79) <<< (reg86 << wire76)) ?
          $signed(reg97) : $unsigned(reg85[(1'h1):(1'h0)]))));
      if ((^~(reg98 & reg87[(3'h5):(1'h0)])))
        begin
          reg107 <= {$signed($unsigned((wire72[(4'hd):(3'h6)] ^ (~|wire84)))),
              wire71[(1'h1):(1'h0)]};
          reg108 <= wire80[(4'hb):(3'h5)];
          reg109 <= reg102[(4'hf):(4'hb)];
          reg110 <= {$unsigned((wire70[(4'h8):(3'h4)] << {{wire77},
                  (~^wire71)}))};
        end
      else
        begin
          reg107 <= $signed(reg94[(4'h9):(3'h6)]);
          reg108 <= (wire88 | (-(~^$unsigned($unsigned(reg90)))));
          if (((reg98 <<< $signed({{reg99, reg102}, $unsigned(reg104)})) ?
              $unsigned({$unsigned(reg105[(4'h8):(3'h7)])}) : ((8'ha0) ~^ (-{{wire81,
                      wire81}}))))
            begin
              reg109 <= wire83[(2'h3):(2'h3)];
              reg110 <= (|(^reg98));
              reg111 <= ($signed((~|$unsigned((reg94 ?
                  reg108 : reg105)))) >> reg101);
            end
          else
            begin
              reg109 <= {reg92[(5'h10):(3'h6)],
                  $unsigned((!$unsigned($unsigned(wire75))))};
              reg110 <= wire79;
              reg111 <= (8'hb2);
              reg112 <= {wire81};
              reg113 <= (7'h40);
            end
          if ((8'hb2))
            begin
              reg114 <= (^~{$signed((-(&reg89)))});
              reg115 <= $unsigned({(-(!(!wire72)))});
              reg116 <= (~$signed($signed($unsigned(reg97))));
              reg117 <= wire73;
              reg118 <= ($unsigned((((reg86 > reg90) ?
                      (reg91 ? reg107 : reg117) : $signed(wire74)) < wire84)) ?
                  reg92 : (($unsigned($signed(reg104)) ? reg116 : reg109) ?
                      wire73 : wire71));
            end
          else
            begin
              reg114 <= ({{$unsigned($signed((7'h40)))}} - (^($unsigned($unsigned(wire77)) >= wire74[(2'h2):(1'h1)])));
              reg115 <= $signed($unsigned(reg95[(4'ha):(1'h0)]));
              reg116 <= {reg109, {reg94[(3'h4):(1'h0)]}};
            end
          reg119 <= reg118;
        end
      reg120 <= (wire78[(5'h11):(5'h11)] >= (^$unsigned($unsigned((reg110 ?
          wire88 : reg91)))));
      reg121 <= (~&((^~$signed(reg114)) ?
          (((!reg98) ? (^~wire81) : reg107) ?
              $signed($unsigned((8'hae))) : (reg98 || $unsigned(wire82))) : $signed(reg107)));
    end
  assign wire122 = ({wire78} ?
                       ((8'hb8) ?
                           (wire72[(1'h0):(1'h0)] ^ reg90) : wire76[(2'h2):(1'h0)]) : reg89);
  assign wire123 = ($signed(reg112) << (~|{((wire74 ?
                           reg90 : wire70) < $unsigned(wire76)),
                       reg110}));
  assign wire124 = ($signed({reg95,
                       ((^~wire79) ?
                           reg117 : (reg97 <<< reg85))}) > reg118[(4'ha):(4'h8)]);
  assign wire125 = (reg117[(4'h8):(3'h7)] ^ ($signed($unsigned(reg106[(3'h7):(3'h5)])) ~^ ((~|(8'hbb)) <= reg116[(3'h7):(3'h7)])));
endmodule

module module20
#(parameter param35 = ((-((|(~&(8'hb0))) << (((8'hab) <= (8'h9f)) ? (^~(8'had)) : {(8'ha4)}))) ? (|(8'hb6)) : ((^~(((7'h41) <<< (8'hb7)) ^ (&(8'hba)))) ? (((!(8'ha3)) ? ((8'ha8) ? (8'hb0) : (8'ha7)) : ((8'hab) ? (7'h41) : (8'ha3))) ^~ (^(~^(7'h44)))) : ((^((8'ha5) & (7'h42))) | {((8'haf) ? (8'hb2) : (8'hbe))}))))
(y, clk, wire24, wire23, wire22, wire21);
  output wire [(32'h90):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire24;
  input wire [(2'h2):(1'h0)] wire23;
  input wire signed [(5'h13):(1'h0)] wire22;
  input wire signed [(5'h12):(1'h0)] wire21;
  wire [(5'h14):(1'h0)] wire34;
  wire signed [(4'he):(1'h0)] wire33;
  wire [(4'hc):(1'h0)] wire32;
  wire signed [(5'h11):(1'h0)] wire31;
  wire [(5'h14):(1'h0)] wire25;
  reg [(4'hb):(1'h0)] reg30 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg29 = (1'h0);
  reg [(5'h12):(1'h0)] reg28 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg27 = (1'h0);
  reg [(4'hc):(1'h0)] reg26 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire25,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 (1'h0)};
  assign wire25 = $unsigned({(~^($signed(wire21) >>> (~&wire23))),
                      $signed({(wire21 ? wire21 : wire22)})});
  always
    @(posedge clk) begin
      reg26 <= (((|(|$unsigned((8'ha3)))) ?
          (wire23 ?
              $unsigned(wire22) : ($unsigned(wire25) ^~ wire25)) : ((8'hbe) >>> (^~$signed(wire22)))) ^ wire21[(2'h2):(1'h1)]);
      reg27 <= wire21;
      reg28 <= {$signed((({(8'ha8),
              reg27} == {(8'hbe)}) * wire25[(4'ha):(4'h8)]))};
      reg29 <= {reg27};
      reg30 <= (~&(wire23 ?
          wire23[(2'h2):(1'h0)] : (reg28 != ((8'ha4) ?
              (wire23 > wire23) : (^wire24)))));
    end
  assign wire31 = {(~|((|((8'hb6) & wire25)) ^~ reg30))};
  assign wire32 = reg28[(2'h3):(1'h1)];
  assign wire33 = (!$signed($signed($signed((8'ha4)))));
  assign wire34 = $signed(wire33[(1'h1):(1'h1)]);
endmodule
