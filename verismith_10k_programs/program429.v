module top
#(parameter param111 = ((((+{(7'h44), (8'hbc)}) ? ((8'hb9) ? ((7'h41) ? (8'ha2) : (8'h9d)) : ((8'hb1) ? (8'ha9) : (8'ha7))) : (|((8'hae) | (8'hbd)))) ? ({((7'h44) ? (7'h40) : (8'hb1))} ? (((7'h43) <<< (8'haa)) ? (-(8'ha9)) : ((7'h42) * (8'haa))) : (&((8'hab) ? (8'hb9) : (8'ha6)))) : ((((8'hb3) <= (8'hb3)) ~^ ((8'h9c) ? (8'ha8) : (8'hb6))) << {(&(8'hbc))})) ? ((-(~^(8'ha7))) >= (~&(~&(~&(8'hb4))))) : ((!{(-(8'haf)), ((8'haf) ? (8'h9f) : (7'h41))}) ? ((^((7'h44) << (8'hb5))) ? (((8'hb3) < (8'ha4)) ? ((7'h41) != (8'ha7)) : (+(8'hb6))) : ((~^(8'hbd)) ? {(8'h9e)} : {(8'hb2), (8'hae)})) : (~((~&(8'hb2)) ^ (^(8'h9d)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h8b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire3;
  wire signed [(4'hb):(1'h0)] wire110;
  wire [(5'h11):(1'h0)] wire109;
  wire [(5'h14):(1'h0)] wire7;
  wire signed [(5'h11):(1'h0)] wire8;
  wire signed [(4'he):(1'h0)] wire9;
  wire [(5'h13):(1'h0)] wire107;
  reg signed [(4'hf):(1'h0)] reg4 = (1'h0);
  reg [(5'h14):(1'h0)] reg5 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg6 = (1'h0);
  assign y = {wire110,
                 wire109,
                 wire7,
                 wire8,
                 wire9,
                 wire107,
                 reg4,
                 reg5,
                 reg6,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= wire2[(1'h0):(1'h0)];
      reg5 <= (~&$unsigned((!(wire3[(4'h9):(4'h9)] ?
          $signed((8'hae)) : $signed(wire1)))));
      reg6 <= reg5;
    end
  assign wire7 = $signed(({{reg6[(1'h0):(1'h0)], $signed(reg6)}} == reg6));
  assign wire8 = $signed({reg6[(1'h1):(1'h0)]});
  assign wire9 = $signed(reg6[(2'h3):(1'h0)]);
  module10 #() modinst108 (wire107, clk, wire1, reg5, wire0, wire9);
  assign wire109 = wire1[(4'h9):(4'h9)];
  assign wire110 = $signed(((wire109[(5'h11):(2'h3)] > (reg6[(3'h5):(3'h5)] ?
                           (&(8'hb4)) : (wire2 | reg5))) ?
                       $unsigned($signed((wire107 ?
                           wire9 : reg5))) : (+($unsigned(wire9) >= wire109))));
endmodule

module module10
#(parameter param105 = (8'hb6), 
parameter param106 = (({param105, ((|(8'hae)) <= (param105 > param105))} && {{(param105 ~^ param105), (param105 ? param105 : param105)}, (param105 >= (param105 && param105))}) ? param105 : (8'hb6)))
(y, clk, wire11, wire12, wire13, wire14);
  output wire [(32'h26a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire11;
  input wire [(4'he):(1'h0)] wire12;
  input wire signed [(5'h14):(1'h0)] wire13;
  input wire [(4'he):(1'h0)] wire14;
  wire signed [(2'h2):(1'h0)] wire93;
  wire [(2'h2):(1'h0)] wire92;
  wire signed [(5'h15):(1'h0)] wire91;
  wire [(4'h9):(1'h0)] wire88;
  wire signed [(4'hf):(1'h0)] wire15;
  wire signed [(5'h11):(1'h0)] wire25;
  wire signed [(3'h6):(1'h0)] wire26;
  wire signed [(5'h12):(1'h0)] wire27;
  wire [(4'h8):(1'h0)] wire28;
  wire signed [(5'h12):(1'h0)] wire29;
  wire [(5'h11):(1'h0)] wire47;
  wire [(5'h14):(1'h0)] wire48;
  wire [(4'ha):(1'h0)] wire86;
  reg [(4'h9):(1'h0)] reg104 = (1'h0);
  reg [(5'h11):(1'h0)] reg103 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg102 = (1'h0);
  reg [(4'hd):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg100 = (1'h0);
  reg [(4'h9):(1'h0)] reg99 = (1'h0);
  reg [(3'h4):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg97 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg96 = (1'h0);
  reg [(5'h12):(1'h0)] reg95 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg94 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg90 = (1'h0);
  reg [(4'h9):(1'h0)] reg89 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg46 = (1'h0);
  reg signed [(4'he):(1'h0)] reg45 = (1'h0);
  reg [(3'h6):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg43 = (1'h0);
  reg [(5'h13):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg41 = (1'h0);
  reg [(4'hc):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg39 = (1'h0);
  reg [(2'h3):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg37 = (1'h0);
  reg [(4'he):(1'h0)] reg36 = (1'h0);
  reg [(4'ha):(1'h0)] reg35 = (1'h0);
  reg signed [(4'he):(1'h0)] reg34 = (1'h0);
  reg [(4'h9):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg31 = (1'h0);
  reg signed [(4'he):(1'h0)] reg30 = (1'h0);
  reg [(4'he):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg23 = (1'h0);
  reg [(4'hb):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  reg [(3'h5):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg18 = (1'h0);
  reg [(5'h10):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire91,
                 wire88,
                 wire15,
                 wire25,
                 wire26,
                 wire27,
                 wire28,
                 wire29,
                 wire47,
                 wire48,
                 wire86,
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
                 reg90,
                 reg89,
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
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
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
  assign wire15 = wire14[(2'h3):(2'h2)];
  always
    @(posedge clk) begin
      reg16 <= wire13;
      if (wire14)
        begin
          reg17 <= wire14[(4'hd):(4'hd)];
        end
      else
        begin
          reg17 <= $unsigned($signed(((^~(&wire12)) ?
              $unsigned((reg17 ? wire12 : (8'hba))) : {$signed(reg17),
                  (~^wire12)})));
          reg18 <= wire14;
          reg19 <= $unsigned((wire11[(1'h1):(1'h1)] ?
              $signed($unsigned({wire15})) : $unsigned({$unsigned(wire12)})));
          if (reg17)
            begin
              reg20 <= (~|wire12);
              reg21 <= {(reg17[(4'ha):(1'h1)] ?
                      (((reg16 & wire13) ?
                              (8'ha6) : (wire15 ? reg16 : wire11)) ?
                          wire12 : $signed($unsigned((8'ha9)))) : reg17)};
            end
          else
            begin
              reg20 <= (reg17 >>> reg17[(4'hb):(3'h4)]);
              reg21 <= $unsigned(reg17);
              reg22 <= {wire12};
            end
          reg23 <= ((8'hb1) > wire11[(4'hd):(1'h1)]);
        end
      reg24 <= (8'h9c);
    end
  assign wire25 = $signed(wire15[(2'h2):(1'h1)]);
  assign wire26 = reg20;
  assign wire27 = $signed({(($unsigned((8'ha5)) ?
                              (reg21 + reg17) : $signed(reg16)) ?
                          $unsigned(wire11) : wire13)});
  assign wire28 = ({$unsigned((-reg19)),
                      ($signed(reg16) ?
                          reg18 : reg21)} != $signed(reg24[(2'h3):(2'h2)]));
  assign wire29 = wire27;
  always
    @(posedge clk) begin
      if ($unsigned((((!((8'haf) >> (8'hb4))) | (-(wire25 ? (8'hb0) : reg22))) ?
          $signed((wire12[(1'h1):(1'h0)] ^~ $signed(wire12))) : $unsigned($unsigned(((8'hae) ^ reg22))))))
        begin
          reg30 <= $unsigned(reg21[(4'hf):(3'h6)]);
          reg31 <= ((8'ha4) ?
              ($unsigned(reg30[(4'ha):(3'h7)]) ?
                  $signed({(reg23 ? wire25 : wire15),
                      (^(8'hab))}) : reg20[(2'h2):(2'h2)]) : $signed(reg20[(1'h1):(1'h1)]));
          if ($signed(($signed($unsigned($unsigned(reg23))) && wire26[(1'h0):(1'h0)])))
            begin
              reg32 <= ($unsigned((-$unsigned((wire25 >> wire26)))) || $signed($unsigned(((wire26 && reg19) ?
                  $unsigned(reg31) : (wire13 & wire29)))));
              reg33 <= reg32;
            end
          else
            begin
              reg32 <= (~&$signed(wire15[(2'h3):(2'h3)]));
            end
          if (((~{$signed((reg33 ? (8'hb4) : reg21))}) ?
              $unsigned(reg18) : $unsigned((~&(!(reg17 <<< reg20))))))
            begin
              reg34 <= (^~(~($signed((wire27 ?
                  wire25 : (8'haf))) * {$unsigned(wire28),
                  $unsigned((8'ha7))})));
              reg35 <= $unsigned((&wire13));
              reg36 <= {$signed(wire12),
                  ($unsigned(((reg20 ?
                      reg19 : reg30) - reg17[(4'ha):(2'h3)])) > (~|(^~(~|wire14))))};
              reg37 <= $unsigned((!wire12[(4'hd):(3'h4)]));
            end
          else
            begin
              reg34 <= {$unsigned({$signed({wire25, reg19})})};
            end
          reg38 <= (reg16 ?
              $unsigned((-(wire13[(2'h2):(1'h1)] || reg24))) : {{$signed($unsigned((8'hba))),
                      (&$signed((8'had)))},
                  wire29[(4'h8):(3'h5)]});
        end
      else
        begin
          reg30 <= reg32[(1'h1):(1'h0)];
          reg31 <= ((~^(|reg31[(3'h5):(2'h2)])) ?
              (^(~(8'h9e))) : reg32[(2'h2):(1'h1)]);
        end
      if ({reg34, wire15[(3'h5):(2'h3)]})
        begin
          if ({(reg20 & $signed(reg34))})
            begin
              reg39 <= $signed((&(wire25 ?
                  {$signed((8'hb5))} : $unsigned((8'h9e)))));
              reg40 <= (^{$signed($unsigned(wire15[(4'hd):(1'h1)]))});
              reg41 <= reg31;
              reg42 <= (~$signed(wire13[(4'hc):(2'h2)]));
            end
          else
            begin
              reg39 <= wire12;
            end
          reg43 <= (~((wire26[(3'h6):(1'h1)] ?
              ({reg39} || (reg19 ? reg31 : reg17)) : (reg21[(2'h2):(2'h2)] ?
                  (&(8'ha9)) : $unsigned(reg22))) - (($signed(wire15) ?
              reg22 : $signed(wire12)) << ($unsigned(wire11) < $unsigned(reg21)))));
          reg44 <= ($signed(reg33[(3'h6):(1'h1)]) == {$signed($signed((reg30 ?
                  reg30 : wire27))),
              (((8'ha2) * (7'h40)) >>> reg43[(2'h3):(2'h3)])});
          reg45 <= ((reg37[(5'h10):(1'h0)] & {((|reg23) ~^ (reg42 >>> reg20))}) ^ $unsigned(((|wire27) << {$signed(wire13)})));
        end
      else
        begin
          reg39 <= ($signed(((^~$unsigned(wire11)) <<< ($signed(wire14) && $signed(wire15)))) == reg33[(4'h8):(1'h0)]);
        end
      reg46 <= (reg37 ?
          $unsigned((!(^{wire28}))) : (((|(~^reg33)) ?
                  ((reg20 * (8'h9f)) == (wire28 ? reg38 : (8'hb7))) : reg20) ?
              $signed(wire29[(4'h9):(4'h9)]) : $signed(reg36)));
    end
  assign wire47 = {((($unsigned(reg23) & (~^wire11)) ?
                          (~^reg37) : {(wire13 && reg35)}) == (^((8'hb4) < ((8'ha5) ?
                          (8'ha5) : reg40)))),
                      reg30[(4'he):(4'he)]};
  assign wire48 = (~^$signed((reg43[(4'ha):(4'ha)] ?
                      reg34[(2'h3):(2'h3)] : ({reg33, wire29} ?
                          $unsigned(reg33) : (wire47 >>> reg36)))));
  module49 #() modinst87 (wire86, clk, reg18, reg35, reg33, reg21, wire27);
  assign wire88 = (+reg32);
  always
    @(posedge clk) begin
      reg89 <= $unsigned(((~wire14[(2'h3):(1'h0)]) ?
          ($signed(reg36) * (~(7'h44))) : {((wire28 > wire27) ?
                  reg43[(4'hc):(2'h3)] : (reg21 ? reg21 : (8'hb3)))}));
      reg90 <= $signed($signed(reg39));
    end
  assign wire91 = (reg20 ?
                      $signed(reg35[(2'h3):(2'h3)]) : ((wire13 >>> wire26[(2'h2):(1'h1)]) ^ $unsigned($signed($signed(reg34)))));
  assign wire92 = ({((~^$unsigned(reg21)) ?
                              ((reg16 ~^ reg33) < reg35[(2'h3):(2'h3)]) : $unsigned($signed(wire28))),
                          reg24} ?
                      (8'ha8) : $signed(wire86));
  assign wire93 = $unsigned(wire12);
  always
    @(posedge clk) begin
      reg94 <= ($signed(reg23) ?
          reg30[(2'h2):(2'h2)] : ($signed(((wire48 ?
              (8'hb9) : (8'hba)) <= $unsigned(reg46))) & reg22[(3'h4):(2'h3)]));
      reg95 <= $unsigned(reg43);
      reg96 <= ({$signed(((reg90 << wire86) ?
              (wire93 == wire48) : reg17[(4'h8):(2'h3)]))} | $unsigned((reg20 ?
          (&$signed(wire11)) : ((~reg40) * (reg31 ^~ reg95)))));
      if ((~|wire47[(4'hf):(4'hb)]))
        begin
          reg97 <= reg46;
          reg98 <= wire11[(2'h2):(1'h1)];
        end
      else
        begin
          reg97 <= ($unsigned($signed($unsigned((reg98 || reg89)))) ^~ (-$unsigned(reg23[(4'h9):(3'h4)])));
          reg98 <= reg37[(5'h10):(4'ha)];
          if (reg35)
            begin
              reg99 <= reg32;
              reg100 <= wire27[(3'h7):(2'h3)];
              reg101 <= {(|$unsigned((wire27[(1'h1):(1'h0)] ?
                      ((8'hbd) && reg43) : wire92[(2'h2):(1'h1)])))};
              reg102 <= (~reg98);
              reg103 <= reg20[(2'h2):(1'h1)];
            end
          else
            begin
              reg99 <= ($unsigned(wire26) ?
                  ({(~^$signed((8'hb4))), (~{reg16})} ?
                      wire25 : (wire28 == (reg103[(2'h3):(2'h3)] ?
                          (reg43 != reg20) : (reg101 >> wire27)))) : (-reg46));
            end
          reg104 <= $unsigned((reg18[(4'ha):(4'h9)] + wire28));
        end
    end
endmodule

module module49  (y, clk, wire54, wire53, wire52, wire51, wire50);
  output wire [(32'h177):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire54;
  input wire [(4'ha):(1'h0)] wire53;
  input wire [(3'h7):(1'h0)] wire52;
  input wire [(3'h4):(1'h0)] wire51;
  input wire [(2'h3):(1'h0)] wire50;
  wire signed [(5'h14):(1'h0)] wire81;
  wire signed [(5'h11):(1'h0)] wire72;
  wire signed [(2'h3):(1'h0)] wire61;
  wire signed [(4'ha):(1'h0)] wire60;
  wire [(4'hf):(1'h0)] wire59;
  wire [(2'h3):(1'h0)] wire58;
  wire [(3'h7):(1'h0)] wire57;
  wire signed [(5'h12):(1'h0)] wire56;
  wire signed [(5'h10):(1'h0)] wire55;
  reg signed [(2'h3):(1'h0)] reg85 = (1'h0);
  reg [(2'h3):(1'h0)] reg84 = (1'h0);
  reg [(4'h9):(1'h0)] reg83 = (1'h0);
  reg signed [(4'he):(1'h0)] reg82 = (1'h0);
  reg [(4'hc):(1'h0)] reg80 = (1'h0);
  reg [(5'h12):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg78 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg77 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg76 = (1'h0);
  reg [(5'h15):(1'h0)] reg75 = (1'h0);
  reg [(5'h14):(1'h0)] reg74 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg68 = (1'h0);
  reg signed [(4'he):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg66 = (1'h0);
  reg [(3'h5):(1'h0)] reg65 = (1'h0);
  reg [(5'h13):(1'h0)] reg64 = (1'h0);
  reg signed [(4'he):(1'h0)] reg63 = (1'h0);
  reg [(3'h5):(1'h0)] reg62 = (1'h0);
  assign y = {wire81,
                 wire72,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
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
                 (1'h0)};
  assign wire55 = $unsigned(($unsigned($unsigned((wire52 ^ wire54))) ?
                      wire54 : {$unsigned($signed(wire54))}));
  assign wire56 = wire54;
  assign wire57 = wire50;
  assign wire58 = wire50[(2'h2):(1'h1)];
  assign wire59 = wire54;
  assign wire60 = {$signed((^wire58))};
  assign wire61 = wire51;
  always
    @(posedge clk) begin
      if (wire55[(2'h3):(2'h2)])
        begin
          reg62 <= ((8'hb4) > (8'hbb));
        end
      else
        begin
          reg62 <= wire60[(3'h4):(1'h1)];
          reg63 <= (~$unsigned(wire57));
          if (wire57[(2'h3):(1'h1)])
            begin
              reg64 <= $unsigned($unsigned(wire50));
              reg65 <= ((($signed($unsigned(wire54)) ~^ $unsigned((reg62 ?
                      wire52 : (8'hac)))) ?
                  $signed({{wire56, reg64},
                      $unsigned(wire54)}) : $signed(((wire50 ?
                          wire55 : (8'ha7)) ?
                      (|wire57) : {reg63}))) ^ (wire57 <<< {{wire56},
                  wire55[(1'h1):(1'h1)]}));
              reg66 <= wire53[(3'h4):(2'h2)];
            end
          else
            begin
              reg64 <= wire55[(3'h6):(3'h4)];
              reg65 <= wire57[(3'h4):(1'h0)];
              reg66 <= wire60[(4'ha):(1'h0)];
              reg67 <= wire56;
              reg68 <= $signed(reg65[(3'h5):(1'h0)]);
            end
          reg69 <= $signed((|(~&reg66)));
          reg70 <= (~($signed(($unsigned(wire61) ~^ (+wire59))) ?
              (-{{wire56, (8'ha6)}}) : (wire53[(4'h8):(2'h2)] ?
                  $unsigned((reg67 & wire51)) : $unsigned((reg62 ?
                      (8'hbf) : (8'haf))))));
        end
      reg71 <= reg62[(1'h0):(1'h0)];
    end
  assign wire72 = {($signed(($signed(reg64) ?
                          $unsigned(wire58) : reg64[(3'h5):(3'h5)])) == $signed({$signed(reg67)}))};
  always
    @(posedge clk) begin
      reg73 <= (~^(reg62 ?
          (|$unsigned(reg66[(4'h9):(3'h4)])) : (($signed(reg69) ?
              (reg62 ?
                  reg63 : reg67) : $signed(wire56)) * $unsigned($unsigned(reg70)))));
      reg74 <= (~&$signed((((wire58 + wire51) | $unsigned(reg69)) ?
          {(reg65 ? reg68 : (8'hb6)), (reg69 ? (8'ha0) : wire54)} : {reg69})));
      reg75 <= reg71;
      reg76 <= $signed($unsigned((~$unsigned((reg74 << reg75)))));
    end
  always
    @(posedge clk) begin
      reg77 <= reg70;
      reg78 <= wire54;
      reg79 <= (|($signed($signed((^~reg65))) * reg69));
      reg80 <= {(!((reg62 >>> reg66) ?
              wire58[(1'h1):(1'h0)] : wire56[(3'h4):(1'h0)])),
          (((-(~&wire59)) ?
              {(wire59 <<< wire55),
                  $unsigned((8'ha9))} : wire52[(3'h7):(2'h3)]) | wire61)};
    end
  assign wire81 = ($unsigned(wire61) ? wire54[(4'ha):(3'h5)] : wire58);
  always
    @(posedge clk) begin
      reg82 <= reg64[(3'h6):(3'h5)];
      reg83 <= $unsigned((+reg67[(2'h3):(2'h2)]));
      reg84 <= (($unsigned((~wire72)) * ((reg73 ?
              ((8'hae) ? reg78 : wire72) : wire81[(3'h7):(3'h4)]) ?
          (-$unsigned(reg63)) : wire55)) ^~ wire54[(4'he):(4'h8)]);
      reg85 <= $signed((~$signed(wire60)));
    end
endmodule
