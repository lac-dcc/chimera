module top
#(parameter param107 = (+(((((8'hab) ? (8'h9f) : (8'hb0)) - ((8'ha2) ? (7'h43) : (8'ha5))) ^ ((|(8'hb5)) ? (7'h44) : (~&(8'hbf)))) ? (~^{(8'hb9), ((8'hb3) ~^ (8'ha4))}) : (~|(((8'ha9) + (8'hbe)) ? ((8'hbe) ? (8'hbb) : (8'hbe)) : {(7'h43)})))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h83):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire0;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  wire [(4'hf):(1'h0)] wire106;
  wire signed [(3'h6):(1'h0)] wire105;
  wire signed [(4'ha):(1'h0)] wire104;
  wire signed [(4'h8):(1'h0)] wire103;
  wire signed [(5'h13):(1'h0)] wire102;
  wire signed [(3'h7):(1'h0)] wire101;
  wire signed [(4'hf):(1'h0)] wire100;
  wire signed [(4'he):(1'h0)] wire4;
  wire [(5'h14):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire98;
  assign y = {wire106,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire4,
                 wire5,
                 wire98,
                 (1'h0)};
  assign wire4 = $signed($unsigned((8'hb5)));
  assign wire5 = ($signed(wire0) ?
                     $unsigned($signed(wire3)) : (!{wire1[(4'he):(4'hb)],
                         (8'hba)}));
  module6 #() modinst99 (.clk(clk), .wire8(wire0), .wire7(wire1), .wire10(wire5), .y(wire98), .wire9(wire3), .wire11(wire2));
  assign wire100 = (8'hb1);
  assign wire101 = $unsigned({wire3, wire98[(4'hd):(4'h8)]});
  assign wire102 = wire98;
  assign wire103 = (wire3 ?
                       wire0 : ($unsigned((8'hae)) ~^ (!wire3[(3'h5):(1'h1)])));
  assign wire104 = wire3;
  assign wire105 = (8'ha6);
  assign wire106 = ($signed($signed(($signed(wire3) ?
                       {wire100, wire1} : (wire104 ?
                           (7'h41) : wire105)))) <<< wire3);
endmodule

module module6
#(parameter param96 = (|((((!(8'ha8)) <= ((8'hba) ? (8'hab) : (7'h41))) ^ (~&((8'ha1) ~^ (8'ha8)))) <= ((((8'ha8) ? (8'ha8) : (8'hae)) ? ((7'h41) == (8'hbf)) : (-(8'hbc))) && (&((8'hab) ^~ (8'hb6)))))), 
parameter param97 = ((|({param96, param96} < ((param96 ? param96 : param96) ? (&param96) : (-(8'hbe))))) || {param96, ((8'hbd) >> ((8'ha2) ? (param96 && (8'ha5)) : (param96 ? (8'hbb) : param96)))}))
(y, clk, wire7, wire8, wire9, wire10, wire11);
  output wire [(32'hbe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire7;
  input wire [(4'ha):(1'h0)] wire8;
  input wire signed [(5'h14):(1'h0)] wire9;
  input wire signed [(4'h8):(1'h0)] wire10;
  input wire signed [(3'h6):(1'h0)] wire11;
  wire [(5'h11):(1'h0)] wire95;
  wire signed [(4'h9):(1'h0)] wire94;
  wire signed [(5'h12):(1'h0)] wire93;
  wire signed [(4'ha):(1'h0)] wire92;
  wire [(4'hf):(1'h0)] wire91;
  wire [(5'h11):(1'h0)] wire90;
  wire signed [(5'h11):(1'h0)] wire89;
  wire [(3'h4):(1'h0)] wire87;
  wire [(5'h13):(1'h0)] wire12;
  wire [(5'h13):(1'h0)] wire13;
  wire [(5'h12):(1'h0)] wire14;
  wire [(5'h14):(1'h0)] wire15;
  wire [(3'h6):(1'h0)] wire32;
  assign y = {wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire87,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire32,
                 (1'h0)};
  assign wire12 = wire10;
  assign wire13 = ($signed($signed(((wire7 ? wire10 : wire7) ?
                          $signed(wire12) : $signed((8'hbd))))) ?
                      wire12 : wire12);
  assign wire14 = wire8[(2'h2):(1'h0)];
  assign wire15 = ((^~$unsigned($signed({(8'ha7), wire14}))) ?
                      $signed(($signed((wire11 >= wire11)) ?
                          $signed(((8'hbc) ? (8'h9c) : wire10)) : (~|{wire12,
                              wire9}))) : $signed(wire9[(4'h9):(3'h7)]));
  module16 #() modinst33 (.wire18(wire9), .clk(clk), .wire19(wire15), .wire21(wire10), .y(wire32), .wire20(wire12), .wire17(wire13));
  module34 #() modinst88 (.wire36(wire10), .wire35(wire8), .clk(clk), .y(wire87), .wire38(wire12), .wire37(wire15));
  assign wire89 = (-$signed($signed(wire11)));
  assign wire90 = wire12[(2'h2):(1'h0)];
  assign wire91 = $unsigned(({wire12} >>> ($unsigned(wire90) ^~ $unsigned(wire87))));
  assign wire92 = ({wire90[(4'ha):(4'h8)],
                          (wire89[(3'h4):(3'h4)] ?
                              $signed((wire12 && (7'h43))) : $unsigned($signed(wire11)))} ?
                      (wire8[(3'h7):(2'h3)] && $signed(wire89[(2'h3):(2'h3)])) : ($unsigned(wire11) ?
                          wire15[(4'ha):(2'h2)] : ($unsigned((wire12 ?
                                  wire8 : wire11)) ?
                              (8'ha4) : wire32)));
  assign wire93 = ((~&$unsigned($signed($unsigned(wire14)))) ?
                      wire90[(3'h5):(1'h1)] : {wire32});
  assign wire94 = wire93[(4'ha):(4'ha)];
  assign wire95 = wire12[(4'hc):(3'h5)];
endmodule

module module34
#(parameter param85 = ((~(((^(8'hb8)) ? ((8'hb8) ? (8'hb4) : (8'hb0)) : {(8'ha9)}) ? (((8'hb5) | (8'hb5)) >>> {(8'hae)}) : (8'ha6))) != (((|(!(8'hbb))) ~^ (~^(~(8'ha7)))) < ((8'hb5) ^~ ((^(7'h42)) ? ((8'h9f) ? (8'ha7) : (8'h9c)) : (8'ha9))))), 
parameter param86 = (((!(param85 >= (~^param85))) > {(~&(param85 ? param85 : param85))}) <<< {param85}))
(y, clk, wire38, wire37, wire36, wire35);
  output wire [(32'h22b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire38;
  input wire signed [(4'h9):(1'h0)] wire37;
  input wire signed [(4'h8):(1'h0)] wire36;
  input wire [(4'h8):(1'h0)] wire35;
  wire [(4'ha):(1'h0)] wire84;
  wire [(5'h12):(1'h0)] wire83;
  wire [(5'h14):(1'h0)] wire79;
  wire signed [(3'h4):(1'h0)] wire78;
  wire signed [(4'hd):(1'h0)] wire77;
  wire [(2'h2):(1'h0)] wire76;
  wire [(5'h14):(1'h0)] wire75;
  wire [(4'hc):(1'h0)] wire74;
  wire signed [(4'hc):(1'h0)] wire73;
  wire [(4'hb):(1'h0)] wire72;
  wire signed [(4'h8):(1'h0)] wire48;
  wire signed [(3'h5):(1'h0)] wire47;
  wire signed [(4'he):(1'h0)] wire46;
  wire signed [(4'h8):(1'h0)] wire44;
  wire signed [(5'h13):(1'h0)] wire43;
  wire [(5'h13):(1'h0)] wire42;
  wire signed [(4'he):(1'h0)] wire41;
  wire [(5'h13):(1'h0)] wire40;
  wire signed [(3'h5):(1'h0)] wire39;
  reg signed [(4'h8):(1'h0)] reg82 = (1'h0);
  reg [(5'h12):(1'h0)] reg81 = (1'h0);
  reg [(4'h9):(1'h0)] reg80 = (1'h0);
  reg [(3'h6):(1'h0)] reg71 = (1'h0);
  reg signed [(4'he):(1'h0)] reg70 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg68 = (1'h0);
  reg [(2'h2):(1'h0)] reg67 = (1'h0);
  reg [(4'ha):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg65 = (1'h0);
  reg [(5'h10):(1'h0)] reg64 = (1'h0);
  reg [(5'h10):(1'h0)] reg63 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg60 = (1'h0);
  reg [(5'h12):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg58 = (1'h0);
  reg [(4'h9):(1'h0)] reg57 = (1'h0);
  reg [(3'h4):(1'h0)] reg56 = (1'h0);
  reg [(4'he):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg53 = (1'h0);
  reg signed [(4'he):(1'h0)] reg52 = (1'h0);
  reg [(3'h7):(1'h0)] reg51 = (1'h0);
  reg [(4'hc):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg45 = (1'h0);
  assign y = {wire84,
                 wire83,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire48,
                 wire47,
                 wire46,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 reg82,
                 reg81,
                 reg80,
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
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg45,
                 (1'h0)};
  assign wire39 = ($signed($signed(wire37[(3'h4):(2'h2)])) ?
                      $signed(wire38[(4'h8):(2'h2)]) : (($signed((~|(8'hbb))) ?
                              (8'h9c) : $signed((~^wire36))) ?
                          $signed(wire38[(1'h1):(1'h0)]) : $signed(((~wire35) ?
                              (~|wire37) : (~|wire35)))));
  assign wire40 = (((^wire39[(3'h5):(1'h0)]) == wire36[(3'h5):(2'h3)]) ?
                      wire38 : ((~$unsigned({wire38})) ?
                          ((wire38[(2'h2):(2'h2)] < $signed((8'hb5))) ?
                              (wire37[(3'h7):(1'h1)] ?
                                  (^wire36) : (wire39 ?
                                      wire39 : wire36)) : $unsigned($unsigned(wire36))) : wire38[(3'h7):(1'h0)]));
  assign wire41 = $signed(wire37);
  assign wire42 = $unsigned((((wire35 ? {wire36, wire35} : (+wire38)) ?
                      ((wire37 ^ wire40) == wire35[(3'h5):(1'h0)]) : $unsigned((^~wire35))) <= $signed(($unsigned(wire39) ?
                      wire39 : (-wire35)))));
  assign wire43 = wire41[(3'h5):(3'h5)];
  assign wire44 = ($unsigned(wire42) ? {$unsigned((8'ha6))} : wire39);
  always
    @(posedge clk) begin
      reg45 <= (~^(~^(|$unsigned(wire41[(4'hd):(1'h1)]))));
    end
  assign wire46 = {(&(((~|(7'h42)) ? (wire35 ? wire44 : wire43) : wire35) ?
                          {wire42[(4'hb):(3'h4)],
                              wire44} : ({wire39} || $unsigned(wire43))))};
  assign wire47 = ((wire46 ? wire38[(1'h0):(1'h0)] : wire35[(4'h8):(3'h5)]) ?
                      (~&(((+wire35) ~^ wire38[(4'hb):(4'h8)]) ?
                          $signed(reg45[(2'h3):(2'h2)]) : (^wire46))) : wire39[(2'h2):(2'h2)]);
  assign wire48 = wire41[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      reg49 <= (~|(-$unsigned(($signed(wire47) & wire44))));
      reg50 <= (wire44[(1'h0):(1'h0)] <= ($unsigned(((|reg49) && $signed(wire36))) ?
          ((wire46 >= wire46) ?
              {wire44,
                  (wire41 ?
                      wire40 : reg45)} : (!wire35[(3'h4):(1'h0)])) : {$signed($signed(wire40)),
              (reg45 != wire48[(4'h8):(1'h0)])}));
      reg51 <= ({(7'h43)} ?
          (wire48 ^~ wire37) : (wire38 ^~ ($unsigned(reg45[(4'ha):(3'h4)]) ?
              wire43[(4'hf):(4'he)] : (&(reg49 ? (8'hb6) : wire38)))));
      reg52 <= $signed((($signed((+(8'h9e))) >>> ((+wire44) <= {wire43,
          wire37})) == $unsigned(reg49)));
    end
  always
    @(posedge clk) begin
      reg53 <= (((wire42[(4'ha):(4'h8)] ?
              ((^~wire36) ?
                  (|wire38) : (wire46 ^~ wire48)) : $signed((reg52 + wire36))) ?
          wire36 : reg45) >>> $unsigned((-{(+reg45), wire37})));
      if (((^$unsigned(wire39[(3'h4):(3'h4)])) ?
          ((+($unsigned(wire47) ~^ $signed(wire44))) ?
              wire42 : reg49) : $signed((~{wire39, (|reg51)}))))
        begin
          if ((8'ha4))
            begin
              reg54 <= ((($unsigned((^wire44)) & wire36[(3'h5):(1'h1)]) ?
                      ({(wire38 ? wire41 : reg50),
                          (|reg45)} != $signed(wire40)) : $unsigned((^~((8'hb0) ?
                          wire42 : wire48)))) ?
                  ({$unsigned($unsigned(wire39))} < $signed(wire47[(1'h1):(1'h0)])) : $signed((&wire46)));
              reg55 <= reg49;
              reg56 <= {((reg52[(4'hc):(4'hb)] ~^ reg53[(2'h2):(1'h1)]) & $unsigned(wire38)),
                  ($signed({{reg54,
                          reg51}}) >>> (-$unsigned($signed(wire42))))};
              reg57 <= ((8'hb2) ^ wire44);
              reg58 <= wire37[(1'h0):(1'h0)];
            end
          else
            begin
              reg54 <= (($unsigned((((8'ha8) ? reg51 : wire39) ?
                          reg53 : reg50[(3'h6):(3'h6)])) ?
                      $signed(((wire38 ^ wire40) ?
                          (+reg56) : (reg57 ?
                              (8'hb8) : wire41))) : $signed(((~|wire39) ?
                          (wire40 ? wire41 : reg53) : (|wire46)))) ?
                  $unsigned($unsigned(((~&reg45) ?
                      $signed(wire42) : (^wire44)))) : $unsigned((^$signed((reg51 != reg58)))));
              reg55 <= $signed(wire36[(2'h2):(1'h1)]);
              reg56 <= reg56;
              reg57 <= reg50;
            end
          reg59 <= $unsigned((|((|(wire38 ? reg51 : wire47)) ?
              ((wire41 ? wire47 : (8'hbb)) ?
                  (~&reg51) : (wire35 ?
                      (8'hae) : wire38)) : reg49[(3'h7):(3'h5)])));
          if (($unsigned((^~($signed(reg50) ^~ (reg51 ?
              wire40 : wire47)))) & $unsigned((^$unsigned((reg56 ?
              wire37 : wire42))))))
            begin
              reg60 <= wire46[(4'hc):(1'h0)];
              reg61 <= wire48[(3'h5):(1'h0)];
              reg62 <= {$signed(reg50), (!reg58)};
            end
          else
            begin
              reg60 <= $signed(wire40);
              reg61 <= (^~wire35[(2'h3):(2'h3)]);
              reg62 <= ($unsigned($unsigned(reg59)) || (reg55[(1'h0):(1'h0)] || reg62[(3'h6):(3'h4)]));
              reg63 <= {(((8'hba) >> reg51[(2'h3):(2'h2)]) ?
                      wire47[(2'h3):(1'h1)] : $signed($unsigned((wire38 || (7'h40)))))};
            end
          reg64 <= reg63;
          if (reg63)
            begin
              reg65 <= ({wire43[(2'h3):(1'h0)],
                  ($unsigned(reg52[(4'h9):(3'h5)]) != ($unsigned((7'h40)) ?
                      $unsigned(wire41) : reg63[(4'hf):(1'h0)]))} > reg51[(3'h5):(3'h5)]);
              reg66 <= reg59;
              reg67 <= ((8'hb5) ?
                  (({$signed((8'hb9)), (^~wire39)} ?
                          reg55[(2'h3):(1'h1)] : $unsigned((&reg57))) ?
                      reg49 : ((7'h43) <= $signed($unsigned(reg50)))) : $signed(reg53[(4'hc):(4'h9)]));
              reg68 <= $signed(($signed(((reg62 ? wire41 : reg58) ?
                      $unsigned(reg52) : $unsigned(reg58))) ?
                  reg67[(1'h0):(1'h0)] : {wire40[(3'h5):(1'h1)], reg53}));
            end
          else
            begin
              reg65 <= {{($unsigned(wire37[(3'h5):(2'h3)]) ?
                          $unsigned((reg56 ? wire36 : wire36)) : wire36),
                      (8'haa)},
                  $signed($unsigned(reg56))};
              reg66 <= $unsigned((reg54[(4'ha):(3'h4)] ?
                  $signed($signed($unsigned(wire43))) : (~|$signed((~wire41)))));
            end
        end
      else
        begin
          reg54 <= $unsigned($unsigned(reg50[(4'hb):(4'hb)]));
          if ((^{(^wire41)}))
            begin
              reg55 <= (((((reg67 >> reg65) ?
                  (wire39 ?
                      reg63 : wire44) : wire44[(4'h8):(2'h2)]) < $signed((reg68 ?
                  reg65 : reg61))) * $unsigned($signed(wire37[(3'h6):(2'h3)]))) + {reg57,
                  wire46[(1'h0):(1'h0)]});
              reg56 <= $unsigned($unsigned(wire39));
              reg57 <= (((+((reg60 ? reg55 : wire48) ?
                  reg63 : (reg59 != reg68))) <<< (&wire48[(3'h5):(1'h0)])) != (~((~{(8'ha6),
                  (8'hb9)}) ~^ $unsigned({wire42, reg67}))));
            end
          else
            begin
              reg55 <= reg57;
              reg56 <= (wire40[(3'h7):(2'h3)] ^ reg53[(4'hd):(3'h5)]);
              reg57 <= $signed(reg64);
              reg58 <= $signed($signed(wire48));
              reg59 <= $unsigned($signed(({$unsigned(wire44)} ?
                  (-(reg57 ? reg64 : (8'hbe))) : reg61)));
            end
          reg60 <= $signed((reg51[(2'h2):(1'h0)] <= $unsigned(({reg66,
              reg52} == (~|reg59)))));
          if ($unsigned(wire39[(3'h5):(1'h1)]))
            begin
              reg61 <= $signed($unsigned((wire44[(1'h0):(1'h0)] ?
                  $unsigned(((7'h44) * wire40)) : reg56)));
              reg62 <= ((-reg63) ?
                  {(reg55 ?
                          $unsigned(reg53) : $signed({reg58}))} : ($signed($unsigned(reg57[(3'h7):(3'h4)])) && reg62[(4'ha):(2'h2)]));
              reg63 <= wire37[(3'h7):(3'h4)];
              reg64 <= (~^reg49[(4'h8):(3'h5)]);
            end
          else
            begin
              reg61 <= {$signed(((^~(+reg52)) ? reg60[(1'h0):(1'h0)] : reg61))};
            end
          if ({(wire48[(3'h6):(1'h1)] > $unsigned(reg49[(1'h0):(1'h0)])),
              (wire35 && wire47[(3'h5):(2'h2)])})
            begin
              reg65 <= $unsigned((^~$signed(wire42)));
              reg66 <= ($unsigned((wire43[(5'h11):(4'hb)] ^ reg67)) ?
                  (($signed(reg62[(4'h8):(2'h3)]) && (reg65[(3'h4):(1'h0)] == reg61)) ?
                      $unsigned(wire39) : (~^(~&(reg57 ?
                          reg67 : wire35)))) : ($signed((-(reg53 <<< reg53))) ?
                      ((~reg45) ?
                          (reg45[(3'h5):(2'h2)] ?
                              {reg54,
                                  wire43} : reg62[(3'h4):(2'h3)]) : ((8'ha3) | reg58[(1'h1):(1'h1)])) : $signed(reg64[(4'hb):(3'h4)])));
              reg67 <= ($unsigned(((^reg45[(3'h6):(1'h0)]) ?
                  ((reg56 ?
                      reg57 : reg51) < $unsigned(reg50)) : wire41)) && (wire42[(4'h9):(3'h7)] ?
                  ($signed((reg61 < wire40)) << ($unsigned(reg62) && {(8'hb7)})) : ($signed($unsigned(reg68)) + ($unsigned(reg60) || $unsigned((8'hbc))))));
              reg68 <= wire42[(1'h0):(1'h0)];
              reg69 <= (8'hac);
            end
          else
            begin
              reg65 <= (wire43[(3'h7):(2'h2)] ?
                  {{reg66}, (|$unsigned({reg61}))} : {$unsigned((~wire40))});
            end
        end
      reg70 <= $unsigned(wire38[(1'h0):(1'h0)]);
      reg71 <= $unsigned({(8'h9f)});
    end
  assign wire72 = wire47;
  assign wire73 = $signed($unsigned(reg62));
  assign wire74 = (reg62[(3'h4):(1'h1)] || wire73[(2'h2):(2'h2)]);
  assign wire75 = (^~(~reg69));
  assign wire76 = $unsigned((($unsigned(wire37[(1'h1):(1'h1)]) - wire73[(4'ha):(3'h5)]) ?
                      $signed($signed($unsigned((8'hb9)))) : wire43[(4'h9):(3'h4)]));
  assign wire77 = $signed(((-($signed(reg55) ?
                          (reg49 ? reg63 : reg59) : $signed(reg58))) ?
                      reg54[(3'h6):(2'h3)] : {((reg61 <= reg58) ?
                              $unsigned(reg45) : (&wire74)),
                          reg64}));
  assign wire78 = wire46;
  assign wire79 = reg59[(4'hc):(2'h2)];
  always
    @(posedge clk) begin
      reg80 <= (|(reg64[(4'he):(3'h5)] ?
          {(~&wire72)} : ((8'hb4) >> $signed($signed(reg67)))));
      reg81 <= $signed($signed((+{$unsigned((8'hb5))})));
      reg82 <= {{reg81[(4'hf):(4'hb)],
              $signed(({wire44, reg69} < (reg61 & wire44)))},
          ({$unsigned((^reg52)), $signed($unsigned((8'had)))} < wire72)};
    end
  assign wire83 = $unsigned((~wire39));
  assign wire84 = (^((~|reg70) != $signed(reg61[(2'h3):(2'h3)])));
endmodule

module module16
#(parameter param30 = (((~^(~|((7'h40) ? (8'hb6) : (8'hb5)))) ? {(~|{(8'hae)})} : (({(8'ha4)} <= ((8'h9d) ? (7'h44) : (8'ha2))) <<< (((8'hb4) ? (8'hb8) : (8'had)) * ((8'hb9) < (8'hae))))) ? (^(((^(7'h42)) ? ((8'ha0) ? (8'hbb) : (8'ha0)) : ((7'h40) ? (8'ha4) : (8'hb1))) < ((~|(8'hba)) ~^ (^(8'hbe))))) : (((^~((8'ha7) ? (8'ha9) : (8'hb2))) ? (((8'ha5) ? (8'h9e) : (8'ha8)) <<< ((8'ha9) < (8'hb9))) : ((|(8'had)) ? (!(8'ha7)) : ((8'ha6) || (8'hb1)))) ? ((8'ha2) <= (&((8'hb7) & (8'h9d)))) : (~|{((8'h9d) > (8'haf))}))), 
parameter param31 = param30)
(y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'h58):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire21;
  input wire [(4'he):(1'h0)] wire20;
  input wire [(4'hf):(1'h0)] wire19;
  input wire [(5'h14):(1'h0)] wire18;
  input wire signed [(2'h2):(1'h0)] wire17;
  wire signed [(4'hc):(1'h0)] wire29;
  wire signed [(4'h9):(1'h0)] wire28;
  wire signed [(3'h5):(1'h0)] wire27;
  wire signed [(4'hc):(1'h0)] wire26;
  wire [(4'he):(1'h0)] wire25;
  wire [(5'h10):(1'h0)] wire24;
  wire [(3'h6):(1'h0)] wire23;
  wire [(4'hd):(1'h0)] wire22;
  assign y = {wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 (1'h0)};
  assign wire22 = {{((((8'hb0) ? wire19 : wire20) ?
                                  $signed(wire18) : $unsigned(wire17)) ?
                              wire21 : wire20),
                          ($unsigned(wire17) == ((wire18 | wire18) ?
                              $unsigned(wire21) : wire21[(2'h3):(2'h3)]))},
                      (($signed($signed((8'ha2))) ~^ $signed($unsigned(wire19))) ?
                          wire17[(2'h2):(1'h1)] : {wire18,
                              (~$signed(wire21))})};
  assign wire23 = (8'hb7);
  assign wire24 = (({wire20[(2'h3):(2'h2)]} ?
                      ((~|wire17) ?
                          (8'ha5) : $signed((wire17 ?
                              wire19 : wire20))) : wire20) ^~ $unsigned(($signed((wire23 <<< wire18)) * ((wire18 ?
                      wire20 : (8'hb6)) != (+wire23)))));
  assign wire25 = (wire17[(1'h1):(1'h1)] & wire18[(5'h13):(4'hb)]);
  assign wire26 = wire20[(4'he):(4'hd)];
  assign wire27 = ($signed(wire19[(4'h8):(3'h6)]) <<< ($unsigned($signed((wire24 ?
                      wire24 : wire17))) << ((((8'hba) ~^ wire21) ?
                      $signed(wire25) : $unsigned(wire25)) >= $unsigned((wire18 ?
                      wire22 : wire20)))));
  assign wire28 = ({$signed(($signed(wire20) ? (^wire18) : (wire17 ^ wire17))),
                          $signed(wire19)} ?
                      wire18[(4'hd):(4'ha)] : ((({wire23, wire17} ?
                              $signed(wire22) : $unsigned(wire24)) ?
                          wire25[(4'hd):(1'h0)] : {((8'ha5) || wire17)}) <<< ($unsigned((wire24 ?
                              (8'ha7) : wire24)) ?
                          $signed(wire24[(2'h2):(1'h0)]) : ((wire22 ?
                                  wire20 : wire19) ?
                              ((8'h9d) && (8'hb4)) : (wire26 ?
                                  (8'hb3) : wire20)))));
  assign wire29 = $signed(wire20);
endmodule
