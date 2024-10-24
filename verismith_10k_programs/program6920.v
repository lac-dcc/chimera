module top
#(parameter param88 = ((~&(((8'hb6) ? (|(7'h41)) : ((8'h9c) ^ (8'ha1))) | (((8'hb4) ? (7'h44) : (8'hb9)) && ((8'hb5) - (7'h42))))) < (^~((((8'hbd) * (8'ha7)) >= (~^(8'hb0))) + {((8'ha7) <<< (8'hba)), ((7'h43) ? (8'hae) : (8'hb8))}))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hf1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  wire [(5'h10):(1'h0)] wire87;
  wire signed [(4'h9):(1'h0)] wire86;
  wire [(5'h14):(1'h0)] wire85;
  wire signed [(5'h12):(1'h0)] wire84;
  wire signed [(5'h15):(1'h0)] wire83;
  wire [(5'h13):(1'h0)] wire4;
  wire signed [(4'ha):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire8;
  wire signed [(5'h11):(1'h0)] wire9;
  wire [(4'hf):(1'h0)] wire10;
  wire signed [(5'h10):(1'h0)] wire11;
  wire [(4'h8):(1'h0)] wire12;
  wire signed [(4'h8):(1'h0)] wire13;
  wire signed [(3'h5):(1'h0)] wire81;
  assign y = {wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire81,
                 (1'h0)};
  assign wire4 = wire1[(1'h1):(1'h0)];
  assign wire5 = wire0;
  assign wire6 = wire3[(2'h2):(1'h1)];
  assign wire7 = $unsigned((^(wire5[(4'ha):(2'h3)] != wire0[(3'h5):(2'h3)])));
  assign wire8 = ((|(~wire0)) ~^ ($signed({(wire6 <<< wire6),
                     (wire3 ? wire5 : wire0)}) ~^ (^~($unsigned((8'ha1)) ?
                     wire1[(1'h0):(1'h0)] : (~wire3)))));
  assign wire9 = $signed($signed(wire1[(1'h1):(1'h1)]));
  assign wire10 = {(wire8[(4'hd):(1'h1)] ?
                          wire0[(2'h3):(1'h1)] : {(~((7'h40) + wire6)),
                              $unsigned((!wire9))})};
  assign wire11 = {$signed({wire2[(4'h8):(3'h4)]})};
  assign wire12 = $unsigned((($signed((wire7 < wire10)) ?
                      (+((8'hb5) ?
                          wire11 : wire1)) : wire0) < (wire9[(1'h1):(1'h0)] ?
                      $unsigned(wire9[(4'hb):(4'h8)]) : $signed({wire10,
                          wire2}))));
  assign wire13 = {{$unsigned(wire10[(4'hc):(1'h1)]), (8'hb9)}};
  module14 #() modinst82 (wire81, clk, wire1, wire5, wire3, wire11, wire8);
  assign wire83 = (wire8 * $unsigned(wire12[(1'h1):(1'h0)]));
  assign wire84 = (((-$signed((|wire11))) ?
                      $signed(((~|wire0) ?
                          $signed(wire6) : (wire13 ?
                              wire11 : wire0))) : ($unsigned((8'hbe)) ?
                          $signed((|wire2)) : $unsigned((wire81 ?
                              wire1 : (8'hab))))) || ($signed((~|wire8)) || {$signed(wire12[(1'h0):(1'h0)])}));
  assign wire85 = (+$signed(wire0));
  assign wire86 = ((&(^~{{(8'h9f)}})) <= wire83[(1'h0):(1'h0)]);
  assign wire87 = $signed(((wire12[(3'h5):(1'h1)] ?
                          wire2[(4'he):(3'h6)] : {wire83[(5'h14):(1'h1)]}) ?
                      $unsigned(($signed(wire83) ?
                          $signed(wire85) : (^~wire2))) : $signed({$unsigned(wire3)})));
endmodule

module module14
#(parameter param79 = {(~({(~&(8'hb4)), {(8'h9f)}} > {((8'ha3) && (8'hbd))}))}, 
parameter param80 = (|(+{((param79 ? (8'hbc) : param79) == param79)})))
(y, clk, wire19, wire18, wire17, wire16, wire15);
  output wire [(32'h1ee):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire19;
  input wire signed [(4'ha):(1'h0)] wire18;
  input wire signed [(5'h11):(1'h0)] wire17;
  input wire [(4'hf):(1'h0)] wire16;
  input wire signed [(5'h13):(1'h0)] wire15;
  wire [(3'h4):(1'h0)] wire78;
  wire signed [(4'h9):(1'h0)] wire60;
  wire [(3'h6):(1'h0)] wire35;
  wire [(4'he):(1'h0)] wire33;
  wire [(3'h4):(1'h0)] wire20;
  reg signed [(4'hb):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg76 = (1'h0);
  reg [(3'h6):(1'h0)] reg75 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg73 = (1'h0);
  reg [(5'h10):(1'h0)] reg72 = (1'h0);
  reg [(4'hd):(1'h0)] reg71 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg67 = (1'h0);
  reg [(5'h10):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg65 = (1'h0);
  reg [(4'hc):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg63 = (1'h0);
  reg [(3'h4):(1'h0)] reg62 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg61 = (1'h0);
  reg [(4'hb):(1'h0)] reg59 = (1'h0);
  reg [(5'h13):(1'h0)] reg58 = (1'h0);
  reg [(3'h6):(1'h0)] reg57 = (1'h0);
  reg [(3'h5):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg55 = (1'h0);
  reg [(5'h12):(1'h0)] reg54 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg52 = (1'h0);
  reg [(2'h2):(1'h0)] reg51 = (1'h0);
  reg [(5'h11):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg49 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg46 = (1'h0);
  reg signed [(4'he):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg42 = (1'h0);
  reg [(4'hc):(1'h0)] reg41 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg40 = (1'h0);
  reg [(3'h4):(1'h0)] reg39 = (1'h0);
  reg [(5'h13):(1'h0)] reg38 = (1'h0);
  reg [(4'ha):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg36 = (1'h0);
  assign y = {wire78,
                 wire60,
                 wire35,
                 wire33,
                 wire20,
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
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 (1'h0)};
  assign wire20 = (-{(~|(~&(wire16 == (8'haa)))), wire17});
  module21 #() modinst34 (wire33, clk, wire19, wire16, wire15, wire17);
  assign wire35 = (((&((~|wire15) + (wire18 ?
                          (7'h42) : wire18))) << (+(((8'ha8) ?
                              wire20 : wire19) ?
                          (|wire19) : $signed(wire19)))) ?
                      ({((wire20 + wire17) > (8'h9c))} >= wire19) : (wire19 > $unsigned(wire16[(4'hf):(4'hc)])));
  always
    @(posedge clk) begin
      if (wire19)
        begin
          reg36 <= (+{{{(wire33 ? wire17 : wire33)}},
              ($unsigned(wire18[(4'ha):(1'h1)]) != $signed((wire33 ?
                  wire17 : wire16)))});
          if (wire18[(1'h1):(1'h0)])
            begin
              reg37 <= (&wire16);
              reg38 <= $signed($signed(({wire33[(4'hc):(3'h6)]} ?
                  $unsigned((~&wire35)) : wire18)));
              reg39 <= $signed($signed((wire19 ?
                  reg38 : (wire18 ? (^~(8'hac)) : (~&wire17)))));
            end
          else
            begin
              reg37 <= (reg36 ?
                  $unsigned($signed((~$unsigned(reg39)))) : {reg39});
              reg38 <= (((+reg36[(3'h6):(2'h2)]) ^ reg39[(1'h0):(1'h0)]) || $unsigned((^$unsigned((!wire16)))));
              reg39 <= $signed(reg38);
              reg40 <= {$signed($unsigned({{wire33}, (~&wire20)})),
                  $unsigned($signed((+(^(8'ha1)))))};
              reg41 <= (-reg40);
            end
          reg42 <= {(!(-wire16[(4'hf):(4'h8)])), reg39[(2'h2):(1'h1)]};
          if (reg40)
            begin
              reg43 <= ($signed(reg39) ?
                  $unsigned(wire18[(1'h0):(1'h0)]) : ((wire20 ^ (~^reg36[(1'h0):(1'h0)])) ?
                      {(reg37 > (wire35 && wire16)),
                          (^wire15)} : $signed(wire16[(4'hb):(4'h9)])));
              reg44 <= (^~($unsigned($signed((~^wire15))) ? (7'h42) : reg42));
              reg45 <= $unsigned((wire16[(4'hb):(3'h4)] && wire35[(2'h3):(1'h0)]));
              reg46 <= reg43;
              reg47 <= {($signed((~wire17)) < ((8'hab) <= wire16))};
            end
          else
            begin
              reg43 <= (^~$unsigned(reg45));
              reg44 <= $signed($unsigned($unsigned($unsigned(reg37[(4'ha):(1'h0)]))));
              reg45 <= reg43[(3'h5):(1'h0)];
            end
          reg48 <= (^(wire17[(4'h9):(2'h3)] && reg38[(4'hf):(4'hb)]));
        end
      else
        begin
          if ((!((reg38[(1'h0):(1'h0)] > $unsigned(((8'haf) ^~ wire17))) ^ $unsigned((((8'h9f) ?
                  (8'ha1) : reg41) ?
              (wire33 ? wire17 : reg43) : (wire18 ? (8'ha0) : reg44))))))
            begin
              reg36 <= (((|$unsigned((reg43 ? wire35 : wire35))) ?
                  (&{$signed(reg39)}) : ($signed((^wire20)) >>> reg41)) == $unsigned($unsigned(($signed(wire15) + (wire17 << wire20)))));
              reg37 <= $signed((reg48 <<< (7'h43)));
              reg38 <= ($unsigned($unsigned(reg37)) ?
                  (~^$unsigned(wire18)) : wire16);
            end
          else
            begin
              reg36 <= $signed($signed(reg37));
              reg37 <= (+(!($unsigned($signed(reg46)) & $signed((~|reg40)))));
              reg38 <= ((8'ha5) | $signed((^~({reg39, (8'hb9)} <= ((8'ha6) ?
                  reg48 : wire18)))));
              reg39 <= reg37[(2'h2):(1'h1)];
              reg40 <= {(((^~{wire19}) ? (^((8'hac) ? reg39 : reg48)) : reg44) ?
                      $unsigned($unsigned(wire16)) : reg41),
                  reg37};
            end
          if ($unsigned((&(($signed(wire35) ?
              ((7'h40) ? wire35 : reg42) : (reg46 ?
                  (8'hbc) : reg39)) & (8'ha9)))))
            begin
              reg41 <= reg46;
              reg42 <= ($unsigned($signed((8'ha0))) ^ (reg41[(3'h4):(2'h3)] ?
                  ({wire35[(1'h0):(1'h0)], (reg45 - reg46)} ?
                      (wire35 == reg46) : ((reg43 ?
                          (8'hb9) : (8'hab)) || (7'h42))) : (($signed(reg45) ?
                          (reg41 ? reg40 : reg46) : $signed(reg37)) ?
                      $signed($signed(reg44)) : ($signed(reg41) ?
                          (-reg44) : (+(8'ha5))))));
              reg43 <= (wire18 ? {reg37[(1'h1):(1'h1)]} : reg40[(2'h3):(2'h3)]);
            end
          else
            begin
              reg41 <= (($signed(((8'ha9) ?
                  wire17[(3'h4):(2'h2)] : (reg46 * reg47))) - reg48) ^ reg39[(1'h0):(1'h0)]);
              reg42 <= $unsigned(wire16[(3'h6):(2'h2)]);
              reg43 <= (~&reg39);
            end
          if ($signed(((^~(+$signed(reg43))) ?
              (((wire17 ? reg40 : wire17) ?
                      (reg47 ~^ reg47) : $unsigned(reg48)) ?
                  $signed($unsigned(reg38)) : {wire20,
                      $signed(reg39)}) : (reg45 ?
                  $signed({wire19, reg47}) : $signed($unsigned(reg36))))))
            begin
              reg44 <= reg47;
              reg45 <= $unsigned(wire17);
              reg46 <= (|(&$unsigned($unsigned($unsigned(reg44)))));
            end
          else
            begin
              reg44 <= (&reg37[(4'ha):(3'h7)]);
            end
          reg47 <= $signed({$signed($unsigned((reg36 ? reg40 : (8'ha2))))});
        end
      if ($signed(reg43[(2'h3):(1'h0)]))
        begin
          reg49 <= (reg38 >>> ((wire33 <<< $signed($signed((8'hb8)))) + (reg37 ?
              wire19[(5'h11):(4'h8)] : ((wire15 ? reg37 : reg41) ?
                  reg47[(2'h3):(1'h0)] : reg46))));
        end
      else
        begin
          if (wire20[(1'h0):(1'h0)])
            begin
              reg49 <= (&($signed(((~&wire35) + wire33[(3'h7):(1'h0)])) != wire33));
              reg50 <= (~((&((!wire16) ? $unsigned(reg40) : {reg47})) ?
                  wire33[(3'h7):(3'h6)] : ($signed({(8'hab)}) ~^ {(~&wire20),
                      wire15})));
            end
          else
            begin
              reg49 <= {{$unsigned(reg40[(2'h2):(1'h0)])},
                  (&reg43[(4'h9):(4'h8)])};
              reg50 <= (((!(~^$signed(reg39))) ?
                  {({wire16} ?
                          (reg38 ?
                              wire17 : reg39) : ((8'ha9) > (8'hb6)))} : (8'hba)) ~^ (-reg36));
              reg51 <= $signed(reg40[(1'h1):(1'h0)]);
              reg52 <= $unsigned(reg45[(3'h5):(2'h2)]);
              reg53 <= ({(($unsigned((8'ha5)) ?
                          (8'ha2) : (wire17 <<< reg49)) | ({(8'hbd)} == reg37)),
                      ($signed(wire18) <<< reg51[(2'h2):(1'h1)])} ?
                  (8'ha4) : reg44[(3'h7):(2'h3)]);
            end
          if ($signed({reg52}))
            begin
              reg54 <= $signed($unsigned((~|(8'ha2))));
              reg55 <= reg38[(5'h13):(5'h11)];
              reg56 <= ($unsigned(((~^(wire18 & reg44)) ?
                      reg53 : (^~(&reg40)))) ?
                  $signed(((^~$unsigned(reg47)) ^~ ($signed(reg53) ?
                      wire35 : {(8'ha0)}))) : (~^(8'ha1)));
              reg57 <= $unsigned((~(7'h41)));
              reg58 <= $unsigned((($signed((reg50 ? reg51 : wire20)) ?
                      ($signed(reg54) ^~ $unsigned(wire15)) : $unsigned((~|reg53))) ?
                  {($unsigned(reg36) >= ((8'ha5) ?
                          reg56 : (8'ha7)))} : ($unsigned(reg42) ?
                      ($signed((8'hbc)) ?
                          reg45[(4'hc):(2'h2)] : $unsigned(reg50)) : {reg54})));
            end
          else
            begin
              reg54 <= reg50;
              reg55 <= ($signed((reg49[(4'h9):(4'h8)] ?
                  {wire18,
                      $signed(reg40)} : (8'hab))) && ($signed($signed((reg46 + reg45))) ?
                  $unsigned(reg39[(1'h0):(1'h0)]) : $unsigned($signed($unsigned(reg49)))));
              reg56 <= $signed((8'hb1));
            end
        end
      reg59 <= (~&(((8'hb9) ?
              ({wire18} ?
                  (wire18 ? reg51 : reg39) : ((8'ha8) ?
                      reg41 : reg46)) : (reg54 ?
                  wire16[(3'h5):(1'h0)] : $unsigned(reg43))) ?
          $unsigned(((8'ha8) >>> reg51)) : (((reg55 | (8'haa)) ?
              (8'hbb) : (reg36 || wire33)) && ((8'ha9) ?
              reg54 : $unsigned(reg45)))));
    end
  assign wire60 = (|reg53);
  always
    @(posedge clk) begin
      reg61 <= {$unsigned(reg38)};
      if (reg36[(1'h0):(1'h0)])
        begin
          reg62 <= $unsigned($unsigned($signed(reg47)));
          reg63 <= wire20;
        end
      else
        begin
          reg62 <= $signed($signed(reg57));
          reg63 <= (reg58 ?
              {{(~(reg50 ^~ reg38)), $signed(wire20[(2'h3):(1'h0)])},
                  (((-reg53) ?
                      (reg40 ?
                          wire20 : reg50) : reg53) != (reg62[(3'h4):(1'h0)] + (reg42 >> reg46)))} : ((({reg53} ?
                      {wire60} : (reg41 ? reg61 : wire16)) ?
                  wire20 : $unsigned((reg44 != reg55))) & $unsigned({$unsigned(reg37)})));
          reg64 <= (~({$signed(wire18),
                  ($unsigned(reg63) ? (!wire19) : (&reg57))} ?
              reg38 : reg53[(3'h5):(2'h3)]));
          reg65 <= wire17[(4'hb):(4'h9)];
          if (((!reg42[(4'h9):(3'h4)]) ?
              (~&((|(reg64 ?
                  wire15 : reg39)) || ((~|reg52) ~^ $signed(reg38)))) : reg53))
            begin
              reg66 <= $signed($unsigned($unsigned($unsigned($signed(reg63)))));
            end
          else
            begin
              reg66 <= {$unsigned((7'h40)), reg61};
              reg67 <= reg50;
              reg68 <= reg44;
            end
        end
      if (wire18)
        begin
          reg69 <= reg55[(2'h2):(1'h1)];
          reg70 <= (^reg50);
          reg71 <= (~|($unsigned(reg63) ? $unsigned(reg58) : reg57));
          if (((+((!$unsigned(reg69)) - (reg43 - wire20[(3'h4):(2'h2)]))) ?
              $signed(reg39) : $unsigned((reg45 - (~&wire33[(1'h1):(1'h0)])))))
            begin
              reg72 <= $signed(reg50);
              reg73 <= reg43;
              reg74 <= (reg54 ?
                  $unsigned((wire20[(3'h4):(3'h4)] | (-wire20))) : reg40[(1'h1):(1'h1)]);
              reg75 <= reg41;
              reg76 <= (((($unsigned((8'ha0)) > reg68[(4'hb):(2'h2)]) ?
                  (reg55[(4'h8):(1'h1)] ~^ reg63) : {(7'h44),
                      ((8'h9e) ? reg52 : reg37)}) != ((reg38[(4'h8):(1'h0)] ?
                  (reg56 ?
                      reg42 : reg58) : wire20[(3'h4):(3'h4)]) > $signed({reg71}))) || (reg58[(4'h8):(3'h7)] & $unsigned(((wire18 << wire60) <= reg49))));
            end
          else
            begin
              reg72 <= $unsigned((^~$unsigned($signed(reg66))));
              reg73 <= $unsigned((reg53 | ($unsigned((reg40 ? wire35 : reg44)) ?
                  ($signed((8'hbb)) > $unsigned((7'h40))) : $signed((reg65 ?
                      reg45 : reg57)))));
              reg74 <= (8'hb5);
              reg75 <= reg53[(4'h9):(3'h5)];
              reg76 <= ((reg46 ? {(7'h43)} : $unsigned((+{reg74, reg67}))) ?
                  ((^(((8'ha5) ? reg38 : wire17) ? $signed(wire35) : reg49)) ?
                      reg52[(1'h0):(1'h0)] : reg36) : (-{$signed(reg72[(3'h6):(3'h6)])}));
            end
          reg77 <= ((-reg46[(1'h1):(1'h1)]) ?
              {($signed($signed(reg58)) != (reg54[(4'he):(3'h6)] > ((8'had) && reg41)))} : $unsigned((8'ha4)));
        end
      else
        begin
          reg69 <= $signed(reg68);
          if ((~|($signed(reg48) != reg46)))
            begin
              reg70 <= (~^(-(^~((reg57 + reg71) ?
                  reg36[(3'h5):(2'h2)] : reg66[(4'ha):(4'ha)]))));
              reg71 <= (!reg63[(2'h3):(1'h1)]);
              reg72 <= ((($unsigned(reg75[(1'h1):(1'h1)]) >= $unsigned($signed(reg45))) != reg50[(1'h1):(1'h0)]) ?
                  ((((wire20 ? reg76 : reg54) ^~ (reg67 >> reg36)) ?
                          (~&$unsigned(wire33)) : (-$signed(reg49))) ?
                      reg41[(4'ha):(2'h2)] : reg57[(1'h0):(1'h0)]) : $unsigned(reg77));
              reg73 <= reg54[(3'h7):(3'h6)];
            end
          else
            begin
              reg70 <= (((~^wire16[(4'h9):(4'h9)]) ?
                      (wire18[(1'h1):(1'h0)] & {(8'h9e), reg69}) : reg39) ?
                  ($signed($signed(reg48)) ^~ $unsigned(reg64)) : reg55[(4'hf):(4'h9)]);
              reg71 <= {$signed({$unsigned(reg59)})};
            end
          reg74 <= ($unsigned(reg67[(4'h8):(1'h0)]) > reg71);
        end
    end
  assign wire78 = reg63;
endmodule

module module21
#(parameter param31 = ((((7'h40) >> {((8'hb8) ? (8'ha4) : (8'hb8)), ((8'hbd) ? (8'ha8) : (7'h44))}) + ((8'hbb) != (+(^~(8'hb4))))) >> ((({(8'h9d)} == (^(8'ha8))) != (((8'hac) && (8'h9c)) ? {(8'h9c)} : ((7'h42) ~^ (8'hbb)))) < (~|(((8'h9e) ? (8'ha6) : (8'hb5)) ? ((8'ha8) ^ (8'ha0)) : (~^(8'ha6)))))), 
parameter param32 = {(8'hb6)})
(y, clk, wire25, wire24, wire23, wire22);
  output wire [(32'h46):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire25;
  input wire [(2'h2):(1'h0)] wire24;
  input wire [(4'h9):(1'h0)] wire23;
  input wire signed [(5'h11):(1'h0)] wire22;
  wire signed [(4'h8):(1'h0)] wire29;
  wire signed [(4'hc):(1'h0)] wire28;
  wire signed [(5'h13):(1'h0)] wire27;
  wire [(4'hf):(1'h0)] wire26;
  reg [(4'hf):(1'h0)] reg30 = (1'h0);
  assign y = {wire29, wire28, wire27, wire26, reg30, (1'h0)};
  assign wire26 = ({(^~$signed((wire23 ? wire22 : wire22))),
                      $unsigned(wire22)} >> ((({wire22,
                          (8'ha8)} << wire24[(1'h0):(1'h0)]) ?
                      $signed((|wire24)) : ((wire23 ^~ wire23) ?
                          (|wire24) : (-wire25))) * (($unsigned((8'hb0)) ?
                      (wire24 ?
                          wire23 : wire22) : (wire25 <= (7'h41))) ~^ wire22[(4'he):(3'h7)])));
  assign wire27 = (|wire23);
  assign wire28 = {{wire23,
                          (wire27[(1'h0):(1'h0)] ?
                              ($signed(wire27) ?
                                  wire27[(5'h12):(4'hf)] : {(8'ha0)}) : $signed((8'hbf)))},
                      wire26};
  assign wire29 = wire25[(3'h6):(2'h2)];
  always
    @(posedge clk) begin
      reg30 <= (((~wire25[(5'h12):(3'h6)]) && (~|((wire27 ?
              wire27 : (7'h44)) * $signed(wire22)))) ?
          (((^wire26) + wire26) - $unsigned({$unsigned((7'h44)),
              wire24})) : (+(|$unsigned(wire22[(4'hc):(3'h6)]))));
    end
endmodule
