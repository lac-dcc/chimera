module top
#(parameter param60 = ({({(8'hbf)} - (~|(^(8'hac)))), (^({(8'ha2), (8'haf)} != (~&(8'ha9))))} ? ((~|{((8'h9c) >= (8'ha4)), ((8'had) ? (8'hbc) : (8'hbb))}) ? {(&((8'haf) ? (7'h41) : (8'hab)))} : (({(8'hba), (7'h40)} >= ((7'h40) ? (7'h44) : (8'hba))) ? (((8'hb7) ? (8'ha9) : (8'hb2)) ^ {(8'h9d), (8'hbf)}) : (((8'hbe) ? (8'ha3) : (8'hab)) ? ((7'h42) ? (8'haf) : (8'hb9)) : (-(8'h9e))))) : (({((7'h41) ? (8'hbb) : (8'haf)), ((8'hb1) ? (7'h40) : (8'h9e))} > (((8'h9d) * (8'h9c)) <= ((8'ha6) ? (8'hb8) : (8'ha8)))) > {(((8'hbb) << (8'hbf)) * {(8'hae), (8'ha0)})})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'ha4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire59;
  wire [(5'h11):(1'h0)] wire58;
  wire signed [(4'h9):(1'h0)] wire28;
  wire signed [(4'h8):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire30;
  wire signed [(5'h14):(1'h0)] wire31;
  wire signed [(5'h15):(1'h0)] wire32;
  wire [(5'h13):(1'h0)] wire33;
  wire [(4'hf):(1'h0)] wire34;
  wire [(4'hd):(1'h0)] wire35;
  wire [(4'hc):(1'h0)] wire56;
  assign y = {wire59,
                 wire58,
                 wire28,
                 wire5,
                 wire30,
                 wire31,
                 wire32,
                 wire33,
                 wire34,
                 wire35,
                 wire56,
                 (1'h0)};
  assign wire5 = ($unsigned($signed($unsigned((+wire3)))) <<< (wire0 ^~ (~&(~^$unsigned(wire4)))));
  module6 #() modinst29 (wire28, clk, wire2, wire3, wire4, wire0, wire1);
  assign wire30 = (~{(|($signed(wire3) ? (wire3 > wire3) : (wire0 <= (8'hbd)))),
                      (|($signed(wire2) | (wire0 ? wire5 : (8'ha5))))});
  assign wire31 = (wire5[(3'h7):(1'h0)] ? (~(wire2 <= (^~(~wire3)))) : wire2);
  assign wire32 = wire30;
  assign wire33 = wire1[(1'h1):(1'h1)];
  assign wire34 = wire1[(1'h0):(1'h0)];
  assign wire35 = {($signed((^$signed(wire30))) ?
                          {wire34} : {(~&(wire2 ? wire1 : wire2)),
                              ($signed(wire3) < (wire0 ? wire34 : (8'hba)))}),
                      (8'h9e)};
  module36 #() modinst57 (.wire38(wire4), .wire41(wire28), .y(wire56), .wire37(wire0), .clk(clk), .wire40(wire5), .wire39(wire33));
  assign wire58 = ($unsigned(wire35) ?
                      {($signed(wire28) < wire33[(4'ha):(4'ha)]),
                          wire34[(4'h9):(2'h2)]} : ((~$unsigned(wire5)) ?
                          {$signed({wire4, wire3}),
                              ($signed(wire5) ?
                                  wire56 : wire31)} : ((^(^wire56)) >>> (wire1 != wire3))));
  assign wire59 = ((((!(wire4 ? wire30 : wire30)) ?
                      $unsigned({wire30,
                          (8'ha9)}) : (8'hb7)) | wire0[(4'h8):(2'h2)]) == $signed(wire34[(3'h7):(2'h2)]));
endmodule

module module36  (y, clk, wire41, wire40, wire39, wire38, wire37);
  output wire [(32'h96):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire41;
  input wire signed [(2'h3):(1'h0)] wire40;
  input wire signed [(5'h13):(1'h0)] wire39;
  input wire signed [(3'h4):(1'h0)] wire38;
  input wire [(5'h10):(1'h0)] wire37;
  wire signed [(5'h10):(1'h0)] wire55;
  wire signed [(5'h12):(1'h0)] wire54;
  wire [(2'h3):(1'h0)] wire44;
  wire signed [(3'h7):(1'h0)] wire43;
  wire [(5'h10):(1'h0)] wire42;
  reg signed [(4'hf):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg50 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg48 = (1'h0);
  reg [(3'h6):(1'h0)] reg47 = (1'h0);
  reg [(4'hc):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg45 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire44,
                 wire43,
                 wire42,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 (1'h0)};
  assign wire42 = wire37[(4'hd):(4'ha)];
  assign wire43 = ((^($unsigned((wire41 && wire37)) == wire37)) ?
                      wire37 : $unsigned((((wire40 ? wire39 : wire38) ?
                          $unsigned(wire39) : wire38) ~^ ($unsigned(wire37) ?
                          $signed((8'ha6)) : wire40))));
  assign wire44 = ((+{(wire40 ? {wire39} : $signed(wire42)), wire42}) ?
                      wire42[(4'h9):(3'h6)] : ($unsigned($unsigned((wire43 ?
                          wire37 : wire38))) <= {((wire37 ?
                              wire42 : (8'hb7)) != $signed(wire40)),
                          (+(wire40 ? wire37 : wire40))}));
  always
    @(posedge clk) begin
      reg45 <= (wire37 ? (~$signed((7'h44))) : $signed(wire43[(2'h3):(2'h3)]));
      if (({(^~(|$unsigned(wire42)))} & wire38))
        begin
          if ($unsigned($unsigned(reg45[(2'h2):(2'h2)])))
            begin
              reg46 <= (~&wire40);
              reg47 <= wire44[(1'h0):(1'h0)];
              reg48 <= (($unsigned($unsigned($unsigned(wire37))) * $unsigned((((8'ha6) >> wire41) != $signed(reg47)))) != $unsigned(wire42[(4'hb):(3'h5)]));
            end
          else
            begin
              reg46 <= wire39[(1'h1):(1'h0)];
              reg47 <= wire38[(1'h0):(1'h0)];
              reg48 <= $signed(($unsigned($unsigned($unsigned((8'hbd)))) != ($signed({reg46}) & {(8'ha9)})));
            end
          reg49 <= (reg45 ?
              (~(+($unsigned((8'hb9)) ?
                  (8'ha6) : $unsigned((8'h9c))))) : reg48[(3'h4):(2'h2)]);
        end
      else
        begin
          reg46 <= ($signed((~&(8'hbd))) <<< $signed((8'ha6)));
          if (($unsigned($signed(wire42)) | $signed($unsigned(wire38[(1'h1):(1'h1)]))))
            begin
              reg47 <= wire42[(3'h6):(2'h2)];
              reg48 <= (($signed(((wire37 != wire39) ~^ (reg46 <= reg48))) & $unsigned((~&$unsigned(wire44)))) | $unsigned((-$unsigned((~&(8'hbc))))));
            end
          else
            begin
              reg47 <= reg47[(2'h2):(1'h1)];
              reg48 <= $unsigned(wire41[(2'h2):(1'h0)]);
              reg49 <= $unsigned($unsigned(($signed((^~wire44)) << reg46[(2'h3):(2'h3)])));
            end
          reg50 <= (reg45 ?
              {wire42} : (+(wire43[(3'h5):(2'h3)] >> (!(8'hb1)))));
          reg51 <= (8'h9f);
          reg52 <= wire43;
        end
      reg53 <= $unsigned({((7'h42) >= (reg47[(1'h1):(1'h1)] ?
              reg50[(3'h4):(2'h2)] : reg48[(3'h6):(3'h6)]))});
    end
  assign wire54 = (((wire37[(3'h7):(3'h7)] >= wire44[(2'h2):(2'h2)]) & ((((8'hba) && (8'ha7)) ?
                              (8'ha2) : ((8'ha7) || wire40)) ?
                          (&(-wire40)) : ((!(8'h9f)) == $signed(reg53)))) ?
                      reg49[(1'h0):(1'h0)] : {wire40[(1'h1):(1'h0)]});
  assign wire55 = ((~|$signed(wire41)) ? (-wire44) : reg49[(1'h1):(1'h1)]);
endmodule

module module6
#(parameter param26 = {((~^{((8'ha8) >= (8'hb9))}) ^~ (((^(8'hb5)) ? ((8'hba) ? (8'hb9) : (8'h9f)) : (!(8'hb1))) ? (((8'hb4) || (8'h9f)) | (-(8'hab))) : (~|(~&(8'ha0)))))}, 
parameter param27 = (({{((8'ha6) ? (8'hb4) : param26)}, ((7'h44) ? {param26, param26} : (param26 <= param26))} ? (-{param26, (~&(8'h9e))}) : (^param26)) ? {((&(-param26)) ? ((param26 ? param26 : param26) ? (param26 & param26) : (&param26)) : ((~^param26) == (param26 ? (8'ha2) : param26))), (~^param26)} : ((^{param26}) < (+param26))))
(y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h91):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire11;
  input wire [(5'h12):(1'h0)] wire10;
  input wire signed [(4'hd):(1'h0)] wire9;
  input wire signed [(5'h14):(1'h0)] wire8;
  input wire [(2'h3):(1'h0)] wire7;
  wire [(5'h11):(1'h0)] wire25;
  wire [(4'hc):(1'h0)] wire15;
  wire [(4'h9):(1'h0)] wire14;
  wire [(5'h13):(1'h0)] wire13;
  wire signed [(3'h6):(1'h0)] wire12;
  reg [(4'h8):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg23 = (1'h0);
  reg [(3'h4):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg21 = (1'h0);
  reg [(2'h3):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg19 = (1'h0);
  reg [(4'h9):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg16 = (1'h0);
  assign y = {wire25,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 (1'h0)};
  assign wire12 = wire10;
  assign wire13 = ((-(wire7 || $unsigned({wire11,
                      wire12}))) == (((+$unsigned(wire9)) ?
                          (wire9[(2'h2):(1'h1)] ?
                              (wire12 >= wire11) : $signed(wire8)) : $unsigned(wire11[(4'hb):(4'ha)])) ?
                      wire8[(2'h2):(2'h2)] : ((wire8 ?
                          wire8 : {wire7,
                              wire7}) == ($signed(wire8) || $signed(wire12)))));
  assign wire14 = (({(~$signed(wire7))} - (((wire11 ? wire11 : wire13) ?
                          (wire7 <<< wire9) : $unsigned(wire9)) ~^ {wire13,
                          (8'ha0)})) ?
                      (!$signed((-wire13[(3'h6):(1'h0)]))) : wire8);
  assign wire15 = (wire11 ?
                      ($unsigned(wire12[(1'h0):(1'h0)]) ?
                          $unsigned(((wire8 ?
                              wire8 : (8'ha4)) <= $signed(wire14))) : wire9) : wire13);
  always
    @(posedge clk) begin
      if ({wire12[(1'h0):(1'h0)]})
        begin
          if (($unsigned((((wire12 << (8'hb0)) || (8'hb4)) + {$signed(wire12),
                  (wire12 ? wire13 : (8'hb2))})) ?
              $signed(wire9[(3'h5):(3'h5)]) : wire8[(4'hc):(4'ha)]))
            begin
              reg16 <= wire10[(5'h10):(3'h4)];
              reg17 <= {(~wire13[(3'h4):(3'h4)]),
                  ($unsigned((8'had)) ?
                      $unsigned((&(wire10 ?
                          (8'h9f) : wire14))) : (^~wire15[(4'ha):(3'h4)]))};
              reg18 <= (wire11 >= reg17);
              reg19 <= $unsigned((^((8'ha7) - {{wire9, wire9}, (~^wire7)})));
              reg20 <= $unsigned(reg16);
            end
          else
            begin
              reg16 <= (wire9[(3'h6):(2'h3)] ~^ $unsigned(((8'hab) ?
                  (8'haf) : $unsigned((8'ha0)))));
              reg17 <= reg18[(3'h4):(2'h2)];
            end
          if ($unsigned({$signed(wire11[(1'h0):(1'h0)])}))
            begin
              reg21 <= {(({$signed(wire14)} < (~|wire15[(4'h8):(4'h8)])) < (&{{reg19},
                      (^~wire7)}))};
              reg22 <= wire8;
            end
          else
            begin
              reg21 <= ($signed($signed(wire14)) && reg17[(2'h3):(1'h1)]);
              reg22 <= (&($unsigned($unsigned(reg20)) ^~ ((~|(wire9 <<< (8'hb5))) | ($unsigned(wire10) ?
                  reg19 : (~wire14)))));
              reg23 <= wire12[(3'h5):(3'h5)];
            end
          reg24 <= (($unsigned($signed($signed(wire7))) ~^ $signed($unsigned(wire7[(1'h0):(1'h0)]))) & $signed(({(reg17 ?
                      (8'hb1) : reg16)} ?
              ({wire15, reg19} ? wire8 : {wire8, (8'ha5)}) : (~^(|reg19)))));
        end
      else
        begin
          if ($unsigned(wire12[(2'h2):(2'h2)]))
            begin
              reg16 <= (8'hbb);
              reg17 <= $unsigned((~&reg24));
              reg18 <= wire13;
            end
          else
            begin
              reg16 <= wire11;
              reg17 <= $signed((^(~|({wire7, reg17} | $unsigned(wire12)))));
              reg18 <= $unsigned($signed($unsigned((reg18 * $unsigned((7'h43))))));
              reg19 <= $signed(({reg20} ?
                  ((~|$unsigned(reg18)) ?
                      {reg24,
                          wire8[(5'h14):(4'he)]} : wire12) : (~^{wire14[(1'h0):(1'h0)],
                      {reg24, wire10}})));
              reg20 <= {$unsigned((8'ha8))};
            end
          reg21 <= (~|($unsigned(reg18[(2'h3):(2'h2)]) ?
              $unsigned($signed($signed(reg16))) : (^~$unsigned($unsigned(wire11)))));
          reg22 <= ((&((+(wire9 ? reg20 : reg21)) ?
                  ({wire11} ?
                      reg20[(1'h0):(1'h0)] : wire7) : (~(reg24 & reg22)))) ?
              ((($signed(reg20) ?
                  reg18 : (wire11 > wire12)) ^ {$signed(reg22)}) >= (wire11 ~^ $unsigned((wire11 >> reg21)))) : reg18);
          reg23 <= (+reg21);
        end
    end
  assign wire25 = $unsigned(reg16[(3'h4):(3'h4)]);
endmodule
