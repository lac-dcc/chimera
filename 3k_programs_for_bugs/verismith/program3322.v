module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire0;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(4'hf):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire4;
  wire signed [(3'h7):(1'h0)] wire93;
  wire [(5'h14):(1'h0)] wire92;
  wire [(3'h6):(1'h0)] wire91;
  wire signed [(2'h2):(1'h0)] wire90;
  wire [(3'h6):(1'h0)] wire89;
  wire [(4'hf):(1'h0)] wire87;
  assign y = {wire93, wire92, wire91, wire90, wire89, wire87, (1'h0)};
  module5 #() modinst88 (.wire6(wire3), .wire8(wire4), .wire10(wire1), .clk(clk), .y(wire87), .wire7(wire0), .wire9(wire2));
  assign wire89 = $unsigned((($unsigned($signed(wire87)) ?
                      wire1 : (~^wire3[(2'h3):(2'h3)])) >> (($signed((8'ha5)) > ((8'ha2) == wire2)) ?
                      $signed(wire4) : (-$signed(wire3)))));
  assign wire90 = wire1;
  assign wire91 = (((~&wire89) ?
                      $unsigned($signed($unsigned(wire4))) : wire3[(1'h1):(1'h0)]) | wire87[(3'h6):(3'h6)]);
  assign wire92 = $signed((^$signed(wire91[(1'h0):(1'h0)])));
  assign wire93 = {$signed($signed(wire4[(3'h4):(2'h3)]))};
endmodule

module module5
#(parameter param85 = (({{((8'hbe) ^~ (8'ha0)), (~&(8'haa))}, ({(7'h44)} || (|(8'hb6)))} & {{(^(8'ha9)), {(7'h43)}}}) ? (^((7'h43) ? ({(8'hac), (8'hbd)} ? ((8'ha5) ? (8'h9f) : (8'hb1)) : ((7'h41) != (8'had))) : (((8'hbd) > (8'ha2)) ? (^~(8'hb0)) : ((8'h9d) ? (8'hbc) : (8'hba))))) : (~&(&{{(8'hae), (8'haf)}}))), 
parameter param86 = ({(((8'ha6) < (!param85)) ? ((param85 << param85) | (~&param85)) : param85)} | (|(((^param85) && (param85 << (8'ha4))) ? ((param85 || (8'h9d)) ? (param85 ? param85 : param85) : param85) : {(+(8'h9f)), (param85 ? param85 : param85)}))))
(y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h183):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire6;
  input wire signed [(4'h8):(1'h0)] wire7;
  input wire [(2'h2):(1'h0)] wire8;
  input wire signed [(2'h2):(1'h0)] wire9;
  input wire signed [(4'hc):(1'h0)] wire10;
  wire signed [(5'h11):(1'h0)] wire84;
  wire signed [(4'h9):(1'h0)] wire83;
  wire signed [(3'h6):(1'h0)] wire11;
  wire signed [(5'h11):(1'h0)] wire12;
  wire signed [(5'h10):(1'h0)] wire18;
  wire [(4'he):(1'h0)] wire19;
  wire signed [(5'h14):(1'h0)] wire20;
  wire signed [(5'h10):(1'h0)] wire21;
  wire [(5'h14):(1'h0)] wire22;
  wire signed [(4'ha):(1'h0)] wire23;
  wire [(5'h15):(1'h0)] wire24;
  wire [(4'ha):(1'h0)] wire32;
  wire [(4'hf):(1'h0)] wire33;
  wire [(4'he):(1'h0)] wire34;
  wire signed [(2'h3):(1'h0)] wire35;
  wire signed [(5'h15):(1'h0)] wire81;
  reg signed [(4'hc):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg30 = (1'h0);
  reg [(4'hf):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg28 = (1'h0);
  reg [(3'h6):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg25 = (1'h0);
  reg [(3'h7):(1'h0)] reg17 = (1'h0);
  reg [(4'he):(1'h0)] reg16 = (1'h0);
  reg [(4'ha):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg14 = (1'h0);
  reg [(4'he):(1'h0)] reg13 = (1'h0);
  assign y = {wire84,
                 wire83,
                 wire11,
                 wire12,
                 wire18,
                 wire19,
                 wire20,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire32,
                 wire33,
                 wire34,
                 wire35,
                 wire81,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire11 = $signed((+wire10[(4'hb):(4'ha)]));
  assign wire12 = $signed((+((~|(wire9 ?
                      (8'hb1) : wire11)) * (wire11[(3'h5):(3'h4)] > ((7'h42) ^ wire6)))));
  always
    @(posedge clk) begin
      reg13 <= ($unsigned($signed($unsigned(wire9[(1'h0):(1'h0)]))) && {$signed($unsigned(wire11[(3'h4):(1'h1)])),
          (8'hbc)});
      reg14 <= (wire12 >> wire7[(2'h2):(1'h0)]);
      reg15 <= $signed((~|wire6));
      reg16 <= {reg13[(4'hd):(4'hb)],
          $unsigned((((wire12 ? wire9 : (8'hb1)) ?
                  (wire7 ? reg15 : (8'hbb)) : $signed(wire7)) ?
              (&$unsigned(wire8)) : $signed(((8'hb7) ? wire7 : wire10))))};
      reg17 <= $signed((^~wire12));
    end
  assign wire18 = reg13;
  assign wire19 = $unsigned(wire7[(4'h8):(1'h0)]);
  assign wire20 = (8'ha4);
  assign wire21 = {(^~($unsigned((!wire9)) + $signed((+reg15))))};
  assign wire22 = {(|(wire10 ? {$signed(wire10)} : {wire21, $signed(wire10)}))};
  assign wire23 = (~&({($signed((8'hb0)) ?
                          $unsigned(reg17) : (wire11 || wire22)),
                      (+$signed((8'hb3)))} >> wire11));
  assign wire24 = ({{wire23, wire22[(1'h0):(1'h0)]}, wire9[(1'h0):(1'h0)]} ?
                      (wire9[(1'h0):(1'h0)] ?
                          ((^(reg17 | wire23)) ?
                              wire23 : wire11[(2'h2):(2'h2)]) : wire12[(1'h1):(1'h1)]) : $unsigned((^~$signed(wire19))));
  always
    @(posedge clk) begin
      if ((~&$unsigned($signed(wire20[(3'h4):(3'h4)]))))
        begin
          reg25 <= {wire20};
          if ((wire9 == reg14[(2'h2):(2'h2)]))
            begin
              reg26 <= wire9[(1'h1):(1'h1)];
              reg27 <= wire8;
            end
          else
            begin
              reg26 <= (~^$signed(wire24[(4'h9):(3'h4)]));
              reg27 <= reg15;
              reg28 <= reg26;
              reg29 <= $signed(((wire8 ^ wire9[(2'h2):(1'h0)]) ?
                  wire18[(2'h3):(1'h1)] : wire8));
              reg30 <= $signed(reg29);
            end
          reg31 <= $signed((^~$unsigned((|reg26))));
        end
      else
        begin
          if ((|reg29))
            begin
              reg25 <= (wire8 | (($unsigned((wire8 ? (8'hae) : reg15)) ?
                      reg29[(4'hc):(2'h2)] : $unsigned(reg30)) ?
                  reg25[(2'h3):(1'h1)] : reg31[(3'h6):(2'h2)]));
              reg26 <= wire21[(3'h5):(1'h1)];
              reg27 <= (^reg27);
            end
          else
            begin
              reg25 <= $signed($signed($signed((8'haf))));
            end
          reg28 <= {(wire6 + wire12)};
          reg29 <= reg31[(2'h3):(1'h0)];
        end
    end
  assign wire32 = $signed(wire7);
  assign wire33 = $signed((((|((8'had) ? wire10 : (8'hb1))) ?
                          (~|$unsigned(wire12)) : $signed(wire32[(4'h9):(2'h2)])) ?
                      wire8[(1'h0):(1'h0)] : (~|wire9[(2'h2):(1'h0)])));
  assign wire34 = (~^wire21[(4'ha):(3'h4)]);
  assign wire35 = (~|($unsigned((reg17 ?
                      {wire19, (8'ha4)} : $signed(reg27))) < ((~|{(8'h9c),
                          reg28}) ?
                      (8'hac) : (((8'h9e) ^ reg30) <= (wire24 ?
                          reg26 : reg27)))));
  module36 #() modinst82 (wire81, clk, wire21, wire24, wire33, reg26, reg28);
  assign wire83 = (^$signed(((~|{(8'hbc), reg31}) ~^ wire19[(1'h1):(1'h0)])));
  assign wire84 = ((&(reg26[(1'h0):(1'h0)] * ((wire9 <= (8'hbc)) ?
                      (wire22 ?
                          wire6 : wire12) : reg29))) ~^ ($unsigned($unsigned($signed((8'haf)))) ?
                      (~(reg14[(3'h4):(1'h1)] ?
                          ((7'h40) > wire33) : (wire11 ?
                              wire83 : (8'hb1)))) : ($signed({wire24}) ?
                          $signed((wire34 ?
                              reg31 : wire12)) : $unsigned((~wire11)))));
endmodule

module module36
#(parameter param79 = (({({(8'hb0), (8'hae)} ^ {(8'h9d)})} * (|{((8'hb1) ? (8'hb6) : (7'h42))})) & {({((8'hae) | (8'hb0)), ((8'ha6) ? (8'hbe) : (8'ha2))} ? ((^~(8'hb6)) ? (^~(8'hbd)) : ((8'hb7) ? (8'h9f) : (8'ha0))) : {((8'hbc) ? (7'h44) : (8'hb5)), (|(8'hb1))})}), 
parameter param80 = ((~^(({param79} ? (param79 ? param79 : param79) : (~|param79)) ? (param79 ? ((7'h40) <<< param79) : (param79 >>> (8'h9c))) : (8'hbb))) ? param79 : (7'h40)))
(y, clk, wire41, wire40, wire39, wire38, wire37);
  output wire [(32'h167):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire41;
  input wire [(5'h15):(1'h0)] wire40;
  input wire [(4'hd):(1'h0)] wire39;
  input wire [(3'h5):(1'h0)] wire38;
  input wire [(4'ha):(1'h0)] wire37;
  wire signed [(5'h14):(1'h0)] wire78;
  wire signed [(5'h15):(1'h0)] wire77;
  wire [(4'h8):(1'h0)] wire54;
  wire [(3'h4):(1'h0)] wire53;
  wire [(3'h7):(1'h0)] wire52;
  wire signed [(5'h12):(1'h0)] wire48;
  wire [(3'h4):(1'h0)] wire47;
  wire [(4'hf):(1'h0)] wire43;
  wire [(4'hb):(1'h0)] wire42;
  reg signed [(2'h2):(1'h0)] reg76 = (1'h0);
  reg [(3'h5):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg74 = (1'h0);
  reg [(3'h5):(1'h0)] reg73 = (1'h0);
  reg [(4'he):(1'h0)] reg72 = (1'h0);
  reg [(3'h7):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg68 = (1'h0);
  reg [(5'h11):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg66 = (1'h0);
  reg [(5'h11):(1'h0)] reg65 = (1'h0);
  reg [(4'h9):(1'h0)] reg64 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg63 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg62 = (1'h0);
  reg [(2'h3):(1'h0)] reg61 = (1'h0);
  reg [(2'h3):(1'h0)] reg60 = (1'h0);
  reg [(3'h5):(1'h0)] reg59 = (1'h0);
  reg [(4'ha):(1'h0)] reg58 = (1'h0);
  reg [(5'h15):(1'h0)] reg57 = (1'h0);
  reg [(4'h8):(1'h0)] reg56 = (1'h0);
  reg [(2'h2):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg49 = (1'h0);
  reg [(4'h8):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg44 = (1'h0);
  assign y = {wire78,
                 wire77,
                 wire54,
                 wire53,
                 wire52,
                 wire48,
                 wire47,
                 wire43,
                 wire42,
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
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg51,
                 reg50,
                 reg49,
                 reg46,
                 reg45,
                 reg44,
                 (1'h0)};
  assign wire42 = $unsigned(({wire37, wire37[(3'h5):(2'h3)]} ?
                      wire38 : $signed((wire41[(3'h4):(3'h4)] ?
                          $signed(wire40) : wire40[(4'hd):(3'h5)]))));
  assign wire43 = wire41[(4'hb):(2'h2)];
  always
    @(posedge clk) begin
      reg44 <= wire41;
      reg45 <= $signed({reg44[(2'h3):(2'h2)],
          ($unsigned((^~(8'hbd))) ? wire39[(1'h1):(1'h0)] : reg44)});
      reg46 <= (((7'h42) ?
          (~^wire43) : $signed(((~wire40) - $signed(wire38)))) - ((&(wire37 >>> $signed((8'had)))) ?
          $unsigned($unsigned(wire41[(4'hf):(3'h7)])) : reg44));
    end
  assign wire47 = $signed(wire37);
  assign wire48 = (!$unsigned({($signed(wire47) > $signed(wire43))}));
  always
    @(posedge clk) begin
      reg49 <= {(~&(~(~|(reg44 <= wire40))))};
      reg50 <= (|$unsigned($unsigned($unsigned(wire48[(5'h10):(1'h1)]))));
      reg51 <= wire42;
    end
  assign wire52 = $signed(wire48);
  assign wire53 = $signed((8'hb9));
  assign wire54 = {{$signed(wire53)}, wire43[(3'h6):(2'h2)]};
  always
    @(posedge clk) begin
      if ((-wire38))
        begin
          reg55 <= (&wire41[(3'h7):(1'h1)]);
          reg56 <= $signed(($signed(wire54[(1'h1):(1'h0)]) <= ($unsigned((8'ha2)) ?
              $signed($signed((8'hb5))) : $signed(wire53[(1'h1):(1'h0)]))));
        end
      else
        begin
          if ($unsigned($signed($unsigned(($signed((8'hb1)) >> ((8'ha4) ?
              wire48 : reg55))))))
            begin
              reg55 <= (wire42 ?
                  ($signed($signed(wire41[(4'hc):(4'h9)])) >> $signed($signed((wire41 ?
                      wire48 : reg45)))) : reg50);
            end
          else
            begin
              reg55 <= (8'hbd);
              reg56 <= wire39[(1'h1):(1'h1)];
              reg57 <= $signed((8'ha0));
              reg58 <= ((~^wire37[(3'h5):(2'h2)]) ?
                  wire53 : $signed(((-(reg45 && reg45)) || wire54[(1'h1):(1'h1)])));
              reg59 <= reg55[(2'h2):(2'h2)];
            end
          reg60 <= $unsigned(reg55);
          if (((~|$signed(reg57[(3'h5):(1'h0)])) ?
              (wire53 ?
                  $unsigned((8'ha1)) : ((|reg51) - $unsigned((~wire41)))) : reg49[(1'h0):(1'h0)]))
            begin
              reg61 <= (~^$unsigned($signed(wire39)));
              reg62 <= $signed(reg60);
            end
          else
            begin
              reg61 <= ((wire48[(4'h9):(3'h7)] ?
                      $signed($signed((wire38 ~^ reg60))) : {$signed((reg61 ?
                              reg44 : reg61))}) ?
                  ((8'ha6) ?
                      $signed($signed(wire52[(3'h6):(3'h4)])) : (((reg50 < reg45) ?
                              (reg57 ? reg57 : reg60) : $signed(reg49)) ?
                          ((wire52 ?
                              (8'ha3) : wire54) <<< $unsigned(reg59)) : {(+(7'h43))})) : (reg44[(3'h4):(2'h3)] & {(wire39 ?
                          wire42[(3'h5):(3'h5)] : {(8'ha3)})}));
            end
          reg63 <= {wire47};
          if ((wire39[(4'hb):(3'h7)] >= (&$unsigned(((&reg62) ?
              (reg56 ? reg50 : wire38) : {reg60, wire42})))))
            begin
              reg64 <= reg44;
              reg65 <= $unsigned({$unsigned(wire52), reg61});
              reg66 <= (wire52 ? reg63 : reg65);
              reg67 <= (8'hb6);
            end
          else
            begin
              reg64 <= reg45;
            end
        end
      if ($signed((~wire43[(3'h5):(2'h3)])))
        begin
          reg68 <= $unsigned((~^($signed((wire52 >= wire39)) ?
              $unsigned({reg58}) : $unsigned($unsigned(reg61)))));
          if (reg45[(4'hd):(4'h8)])
            begin
              reg69 <= reg60;
              reg70 <= reg49[(3'h4):(2'h2)];
            end
          else
            begin
              reg69 <= (~{(($signed(reg64) < reg62) ?
                      (~$signed(reg65)) : {((8'ha2) ? reg45 : reg66)}),
                  {$signed($unsigned(reg61)), $unsigned((wire37 && reg68))}});
              reg70 <= reg61;
              reg71 <= reg44;
            end
          reg72 <= reg51;
          reg73 <= $signed({(((&(8'haf)) ?
                      reg72[(4'ha):(4'h9)] : (reg64 ? reg49 : reg55)) ?
                  (+(wire47 ^ reg60)) : reg69),
              ({(reg56 | reg70), reg51} >>> ((wire39 ?
                  reg56 : wire53) != $unsigned(reg70)))});
        end
      else
        begin
          reg68 <= reg62[(1'h1):(1'h0)];
          if (((+(reg56 && $signed($signed(wire40)))) != reg55))
            begin
              reg69 <= reg73;
              reg70 <= ($unsigned($signed((8'hb0))) ?
                  wire37 : (|{$unsigned((wire38 > reg56)),
                      ((reg51 || reg58) <<< $unsigned((7'h41)))}));
              reg71 <= (|$unsigned($signed($unsigned((~^wire42)))));
            end
          else
            begin
              reg69 <= wire53;
              reg70 <= (~reg44[(1'h1):(1'h1)]);
              reg71 <= wire48;
            end
        end
      reg74 <= $signed((reg71[(3'h5):(2'h3)] & $signed($unsigned((reg56 ?
          wire39 : reg44)))));
      reg75 <= reg66[(1'h0):(1'h0)];
      reg76 <= reg45[(4'hc):(4'hc)];
    end
  assign wire77 = (-$signed($unsigned(((reg46 ? wire38 : reg67) ?
                      $signed(reg49) : reg56[(4'h8):(2'h3)]))));
  assign wire78 = ($unsigned((reg60[(1'h1):(1'h1)] == wire40[(1'h0):(1'h0)])) && $signed(reg69[(2'h2):(2'h2)]));
endmodule
