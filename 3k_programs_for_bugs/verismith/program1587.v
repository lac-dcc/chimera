module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1b5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire4;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire171;
  wire [(3'h6):(1'h0)] wire170;
  wire signed [(4'he):(1'h0)] wire169;
  wire signed [(3'h6):(1'h0)] wire168;
  wire [(5'h13):(1'h0)] wire167;
  wire [(5'h14):(1'h0)] wire152;
  wire signed [(4'hd):(1'h0)] wire151;
  wire signed [(4'he):(1'h0)] wire147;
  wire [(4'hf):(1'h0)] wire146;
  wire [(3'h4):(1'h0)] wire145;
  wire [(4'hf):(1'h0)] wire144;
  wire signed [(4'he):(1'h0)] wire143;
  wire [(4'hb):(1'h0)] wire142;
  wire [(5'h10):(1'h0)] wire141;
  wire [(5'h10):(1'h0)] wire140;
  wire [(4'h9):(1'h0)] wire138;
  reg [(5'h14):(1'h0)] reg166 = (1'h0);
  reg [(4'hb):(1'h0)] reg165 = (1'h0);
  reg [(5'h15):(1'h0)] reg164 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg163 = (1'h0);
  reg [(5'h13):(1'h0)] reg162 = (1'h0);
  reg [(5'h13):(1'h0)] reg161 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg160 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg159 = (1'h0);
  reg [(5'h12):(1'h0)] reg158 = (1'h0);
  reg [(4'hb):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg156 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg155 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg154 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg153 = (1'h0);
  reg [(4'hd):(1'h0)] reg150 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg149 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg148 = (1'h0);
  assign y = {wire171,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire152,
                 wire151,
                 wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire140,
                 wire138,
                 reg166,
                 reg165,
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
                 reg150,
                 reg149,
                 reg148,
                 (1'h0)};
  module5 #() modinst139 (.wire8(wire4), .clk(clk), .wire6(wire0), .wire9(wire1), .y(wire138), .wire7(wire2));
  assign wire140 = (~&$unsigned($signed(((wire4 > wire4) ^~ (|wire138)))));
  assign wire141 = $unsigned($signed((wire4 << {(wire1 < wire2),
                       (wire0 << wire138)})));
  assign wire142 = $signed(($unsigned(wire0) >>> (wire140 ~^ $signed({wire2,
                       wire141}))));
  assign wire143 = (wire2[(4'hc):(2'h2)] <<< $unsigned((wire138 ~^ wire138[(3'h5):(3'h4)])));
  assign wire144 = $signed(wire143[(3'h7):(3'h5)]);
  assign wire145 = $signed($signed($unsigned({$signed(wire4), (^~wire140)})));
  assign wire146 = {$signed(wire141[(3'h7):(2'h2)]),
                       (wire145[(2'h2):(1'h1)] && (^~wire140[(3'h7):(1'h0)]))};
  assign wire147 = wire145;
  always
    @(posedge clk) begin
      reg148 <= wire141;
      reg149 <= (+wire143);
      reg150 <= wire138[(2'h2):(2'h2)];
    end
  assign wire151 = {{((~^(reg150 ? wire143 : wire0)) ?
                               $unsigned(wire2[(4'ha):(1'h0)]) : ((wire142 >> wire147) <<< (wire147 | wire147)))},
                       $signed((&wire4))};
  assign wire152 = (8'ha4);
  always
    @(posedge clk) begin
      if (wire2[(4'hf):(3'h6)])
        begin
          reg153 <= $unsigned(((~|wire147) * (({wire1} ?
              wire141 : wire147[(4'hd):(1'h1)]) > wire1)));
          if ((-wire146))
            begin
              reg154 <= $unsigned({((reg149 ?
                      $signed(wire140) : $signed(reg149)) >= ($signed(wire143) <= (wire2 >= wire140)))});
              reg155 <= wire146;
            end
          else
            begin
              reg154 <= $signed($unsigned(wire143));
              reg155 <= reg154;
              reg156 <= ($unsigned(reg148[(3'h5):(1'h0)]) ?
                  (($unsigned(reg153) + (((8'haf) && wire4) >>> $unsigned(wire144))) || wire4[(4'h9):(2'h2)]) : (wire142[(3'h6):(3'h4)] < (reg149 & reg155[(4'hf):(4'hc)])));
            end
          reg157 <= wire143;
          if ((wire2 ? (8'ha2) : reg154[(1'h0):(1'h0)]))
            begin
              reg158 <= (|($signed((((8'hb0) ? wire142 : wire138) ?
                  {wire151} : (reg148 >= wire140))) < ({wire144[(1'h0):(1'h0)]} ?
                  ((8'ha2) ?
                      (wire138 | reg154) : (reg156 & reg154)) : $unsigned((wire146 & wire152)))));
            end
          else
            begin
              reg158 <= ($unsigned(($signed($signed(wire0)) ?
                      $unsigned(wire142[(3'h6):(2'h2)]) : reg150[(2'h2):(1'h1)])) ?
                  (~&wire146) : $unsigned($signed($unsigned(reg150))));
              reg159 <= $unsigned($signed({$signed((wire146 ?
                      reg157 : wire145))}));
              reg160 <= (^~{wire143[(4'h8):(3'h7)]});
              reg161 <= $signed(($signed((~|{wire141,
                  (8'hb1)})) << (!($signed(wire142) || wire146[(3'h4):(2'h2)]))));
            end
        end
      else
        begin
          reg153 <= $signed((^~(reg160[(3'h7):(2'h2)] ?
              wire142[(4'ha):(1'h1)] : $signed($signed(wire147)))));
          if (((wire147[(4'h9):(3'h5)] ?
                  (wire143 ?
                      $signed(reg148) : reg150[(4'h8):(3'h4)]) : $unsigned(($signed(reg154) ?
                      (wire1 >> reg148) : $unsigned(wire144)))) ?
              {(((reg154 ? (8'hbe) : (7'h40)) ?
                      $signed(wire0) : {reg156}) + reg149[(3'h6):(3'h5)]),
                  (+wire142[(2'h2):(1'h0)])} : wire142[(2'h2):(1'h1)]))
            begin
              reg154 <= $unsigned($signed((reg156 && $signed((reg154 ?
                  wire152 : wire146)))));
              reg155 <= reg149[(3'h6):(3'h6)];
            end
          else
            begin
              reg154 <= {($unsigned((~&(reg158 ? reg155 : wire146))) ?
                      (((8'h9f) >> $unsigned(wire145)) ?
                          $signed($signed(reg160)) : {$unsigned(wire146),
                              wire145[(1'h1):(1'h1)]}) : ((wire138 != wire146) ?
                          ($unsigned(wire2) ? (&reg150) : wire2) : (|wire141))),
                  $signed((7'h44))};
              reg155 <= (&wire141);
              reg156 <= wire138[(1'h1):(1'h0)];
              reg157 <= $signed(reg159);
              reg158 <= reg150;
            end
          if ($signed((wire2[(4'he):(3'h6)] != ((&{wire4,
              wire138}) >> {$unsigned(reg156)}))))
            begin
              reg159 <= $signed((reg159[(2'h3):(2'h2)] ?
                  (~|{{reg155, (8'hb9)},
                      (wire0 * reg157)}) : $unsigned(reg161[(4'hb):(4'ha)])));
              reg160 <= wire145[(3'h4):(2'h2)];
              reg161 <= (wire142 << {wire145,
                  ((reg153[(3'h5):(3'h5)] << $unsigned(wire145)) | (reg156 ?
                      (reg161 >= wire141) : {(8'hac)}))});
              reg162 <= ($unsigned({({reg155,
                      reg161} + ((8'ha5) ^ wire2))}) <<< $signed($signed(wire151[(4'hd):(4'hc)])));
            end
          else
            begin
              reg159 <= $unsigned($signed(({reg149,
                  (8'h9d)} && ($signed(wire142) ?
                  $unsigned(wire144) : (wire140 ? wire140 : wire138)))));
              reg160 <= (wire143[(3'h7):(3'h6)] & reg149[(3'h5):(2'h2)]);
              reg161 <= {$unsigned($unsigned(((reg157 ? (8'hb7) : wire138) ?
                      ((8'ha7) ? reg155 : wire143) : wire4))),
                  (~^reg156[(3'h6):(1'h1)])};
            end
          if ({reg160[(4'h8):(2'h2)], (wire145 << wire138[(3'h6):(3'h5)])})
            begin
              reg163 <= wire152;
              reg164 <= (~&{(~({reg155, (8'hbe)} && wire1[(1'h0):(1'h0)])),
                  (((-wire4) > wire152[(5'h14):(5'h13)]) <<< $signed(((8'ha4) && reg159)))});
              reg165 <= $signed(($unsigned(reg156) ?
                  $signed($unsigned({reg148,
                      wire1})) : ($signed((wire4 * reg154)) ?
                      reg153[(5'h11):(4'hd)] : $unsigned(reg148))));
              reg166 <= (wire0 < {wire2});
            end
          else
            begin
              reg163 <= (wire147 <= {$unsigned(((^reg157) <<< $unsigned(reg160))),
                  (reg153[(4'ha):(3'h5)] ?
                      ($signed(reg165) ?
                          reg155 : (reg166 - wire140)) : (reg161[(3'h6):(3'h6)] ^ (reg163 > wire140)))});
              reg164 <= reg155;
              reg165 <= $signed($unsigned($signed(($signed(wire144) ?
                  $signed(reg160) : wire2[(4'he):(3'h5)]))));
              reg166 <= ({$signed((8'hb6)),
                      (wire138 ?
                          ({reg154, wire140} * $signed(wire141)) : wire0)} ?
                  ((!reg153) ?
                      $signed($unsigned({wire152,
                          (8'h9c)})) : ($signed($unsigned(wire4)) ?
                          reg150[(4'h9):(2'h3)] : ($signed(reg160) ?
                              $signed(wire152) : (|reg148)))) : (reg155[(2'h3):(2'h2)] >> reg161[(4'he):(4'hc)]));
            end
        end
    end
  assign wire167 = (^~(8'hac));
  assign wire168 = wire2;
  assign wire169 = ((((-(reg160 ? reg166 : wire4)) ?
                       (wire1[(3'h4):(2'h3)] ?
                           (7'h41) : {(8'hae)}) : wire1) + $signed(reg165[(2'h3):(1'h0)])) | $signed(wire152[(3'h4):(1'h0)]));
  assign wire170 = {$signed((&((^(8'h9f)) & {wire141, reg161}))),
                       ((wire168 <<< $unsigned(wire152)) ? wire138 : reg148)};
  assign wire171 = $unsigned(wire147[(4'hc):(1'h0)]);
endmodule

module module5
#(parameter param137 = (!(^~((-((8'had) ? (8'hb8) : (8'h9c))) > (|(~&(8'ha7)))))))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h21a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire9;
  input wire signed [(4'hd):(1'h0)] wire8;
  input wire [(5'h12):(1'h0)] wire7;
  input wire signed [(4'hd):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire70;
  wire signed [(5'h15):(1'h0)] wire29;
  wire signed [(5'h14):(1'h0)] wire28;
  wire signed [(4'hc):(1'h0)] wire13;
  wire [(4'he):(1'h0)] wire12;
  wire [(3'h7):(1'h0)] wire11;
  wire signed [(4'ha):(1'h0)] wire10;
  wire signed [(3'h5):(1'h0)] wire72;
  wire [(4'ha):(1'h0)] wire73;
  wire signed [(4'hd):(1'h0)] wire74;
  wire signed [(3'h7):(1'h0)] wire75;
  wire [(4'hd):(1'h0)] wire91;
  wire signed [(5'h13):(1'h0)] wire92;
  wire [(5'h10):(1'h0)] wire93;
  wire signed [(4'hd):(1'h0)] wire94;
  wire signed [(4'hd):(1'h0)] wire95;
  wire [(3'h6):(1'h0)] wire135;
  reg [(4'hd):(1'h0)] reg90 = (1'h0);
  reg [(3'h6):(1'h0)] reg89 = (1'h0);
  reg [(2'h2):(1'h0)] reg88 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg86 = (1'h0);
  reg [(2'h3):(1'h0)] reg85 = (1'h0);
  reg [(3'h6):(1'h0)] reg84 = (1'h0);
  reg [(2'h2):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg78 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg77 = (1'h0);
  reg [(4'hb):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg23 = (1'h0);
  reg [(4'ha):(1'h0)] reg22 = (1'h0);
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg20 = (1'h0);
  reg [(2'h3):(1'h0)] reg19 = (1'h0);
  reg [(4'ha):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg17 = (1'h0);
  reg [(5'h11):(1'h0)] reg16 = (1'h0);
  reg [(2'h3):(1'h0)] reg15 = (1'h0);
  reg signed [(4'he):(1'h0)] reg14 = (1'h0);
  assign y = {wire70,
                 wire29,
                 wire28,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire72,
                 wire73,
                 wire74,
                 wire75,
                 wire91,
                 wire92,
                 wire93,
                 wire94,
                 wire95,
                 wire135,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 (1'h0)};
  assign wire10 = ($signed(({$unsigned(wire6),
                          {wire7, wire7}} - wire9[(3'h6):(2'h2)])) ?
                      ({$signed(wire8[(3'h6):(3'h6)]),
                          ((wire6 ?
                              wire8 : wire9) >> (~wire8))} < $signed(($signed(wire7) ^~ (wire6 == wire8)))) : (wire7 ?
                          $unsigned((wire8[(2'h3):(2'h2)] ?
                              $unsigned((8'hb3)) : (wire7 <<< (7'h41)))) : wire7));
  assign wire11 = (($signed($signed((wire9 ?
                          wire9 : wire10))) >> $signed(wire8)) ?
                      (($signed((-wire7)) > {(wire7 + wire6)}) ?
                          wire6[(2'h3):(1'h0)] : (~|((^~wire7) >= (wire8 ^~ wire9)))) : (wire10[(2'h2):(2'h2)] ?
                          $unsigned((8'hb6)) : (~&(~^wire9[(3'h7):(2'h3)]))));
  assign wire12 = (8'hb4);
  assign wire13 = (wire12 ? wire11 : (-wire12[(4'h9):(3'h7)]));
  always
    @(posedge clk) begin
      reg14 <= (wire9[(4'h8):(1'h1)] ?
          $signed($unsigned((8'hbe))) : {{wire11[(3'h4):(3'h4)],
                  wire12[(4'h8):(1'h0)]}});
      if (({reg14[(1'h0):(1'h0)]} ~^ wire6))
        begin
          if ($signed(((8'hae) + wire7[(1'h1):(1'h0)])))
            begin
              reg15 <= ((-wire11) || wire6);
              reg16 <= wire8;
              reg17 <= $signed((((&wire6[(3'h6):(2'h2)]) && wire8) ?
                  wire12[(4'hb):(4'hb)] : $signed($unsigned({wire6, wire12}))));
              reg18 <= (((^~{reg14}) + $signed({(wire10 ? wire9 : wire12),
                  reg16})) >>> ({$signed({wire6})} == wire10[(2'h3):(1'h1)]));
              reg19 <= wire7[(5'h12):(1'h1)];
            end
          else
            begin
              reg15 <= (wire7[(4'he):(4'he)] ?
                  $signed((wire10 | {(reg18 & reg18)})) : wire12);
              reg16 <= ((wire6[(2'h3):(1'h0)] <= reg19[(1'h1):(1'h1)]) ?
                  (8'ha6) : wire8);
            end
        end
      else
        begin
          reg15 <= $unsigned((-$signed({{reg14}, $unsigned(reg14)})));
          reg16 <= reg16[(1'h0):(1'h0)];
          reg17 <= {wire8};
          if (wire9[(4'h8):(2'h2)])
            begin
              reg18 <= {{wire8[(3'h4):(2'h3)]}};
              reg19 <= ((reg18 > $unsigned({((8'hbd) == (8'hac)),
                      (wire8 ? wire7 : reg18)})) ?
                  ($signed((^~(!wire10))) + (+wire10[(3'h6):(3'h4)])) : (8'hb8));
            end
          else
            begin
              reg18 <= (wire12 < $unsigned(wire6));
              reg19 <= $signed(wire8[(3'h6):(3'h4)]);
              reg20 <= (~|$signed(wire7[(5'h10):(1'h0)]));
              reg21 <= (($unsigned($unsigned($signed(wire7))) >= (wire9 != $signed($signed((8'h9e))))) + $unsigned((~&(wire9[(4'h8):(3'h7)] ?
                  (reg14 ? wire10 : reg18) : reg20[(4'hc):(3'h4)]))));
            end
        end
      if (({($signed((reg14 ? wire6 : reg20)) ?
              (-{reg19}) : (!wire12))} ~^ {$unsigned($signed(reg18)),
          ({(reg19 && wire13), (|reg16)} ^~ ($signed(wire9) ?
              (-wire11) : wire7[(4'hd):(1'h1)]))}))
        begin
          reg22 <= $unsigned(($unsigned($signed($signed(reg20))) >>> ((^(reg15 ?
              reg20 : wire10)) | (|wire9))));
          reg23 <= (~{wire7[(4'hb):(2'h2)],
              (reg17 + (wire11 ? $signed((8'ha8)) : (reg17 + (8'hba))))});
          reg24 <= (|(wire9 >= (reg19[(2'h3):(1'h0)] ^ ({(8'hb8)} ?
              (|(8'h9d)) : {reg15}))));
          reg25 <= (wire12[(4'hb):(2'h3)] ?
              $signed(wire11) : $unsigned(((!$unsigned(wire7)) != {$unsigned(wire7),
                  (reg16 ? reg24 : (8'hb7))})));
          reg26 <= ((~^(8'hac)) ?
              reg15[(1'h1):(1'h1)] : ((-reg17[(3'h4):(3'h4)]) ?
                  (reg20[(4'hf):(4'hf)] | ((reg24 ^ (8'hb5)) ?
                      (^reg19) : (reg23 > reg20))) : $signed(($unsigned(wire13) ?
                      wire13[(3'h6):(2'h3)] : ((8'h9d) >>> reg22)))));
        end
      else
        begin
          if ((!$signed((|wire9[(1'h0):(1'h0)]))))
            begin
              reg22 <= (-{(^~$unsigned({reg23})), wire7});
              reg23 <= wire7;
            end
          else
            begin
              reg22 <= {$unsigned(reg22[(3'h6):(1'h0)])};
              reg23 <= ((wire12 ?
                      {(&reg15[(1'h0):(1'h0)]),
                          wire8[(2'h3):(1'h1)]} : {(~|((8'hb9) ?
                              reg16 : (8'haa))),
                          wire10}) ?
                  $unsigned(($signed($unsigned(wire9)) ?
                      reg15[(2'h2):(2'h2)] : $signed((wire7 ?
                          reg25 : reg14)))) : ((((~^reg20) ?
                          (wire7 << (8'ha2)) : $unsigned(reg22)) ?
                      reg22 : (^~(reg21 ?
                          wire13 : reg22))) && (wire7 >>> $unsigned((wire10 == wire11)))));
              reg24 <= (((reg24[(3'h6):(2'h3)] * (((8'hae) ? wire13 : reg17) ?
                      $unsigned(reg17) : wire12)) ?
                  ((^(-reg20)) ?
                      $signed(((7'h44) ?
                          (8'ha8) : (8'hb5))) : reg17) : $signed(((~^wire8) ?
                      $unsigned(reg15) : (reg17 >= wire6)))) <= wire7[(2'h3):(2'h2)]);
            end
          reg25 <= reg17[(1'h1):(1'h1)];
          reg26 <= $unsigned($unsigned({{reg21},
              $signed(wire6[(4'hb):(3'h5)])}));
        end
      reg27 <= $unsigned(wire11);
    end
  assign wire28 = reg24[(4'ha):(4'ha)];
  assign wire29 = (reg26 << (((+(wire6 ? reg26 : wire12)) + (wire7 ?
                          (reg17 != wire7) : ((8'ha8) & reg15))) ?
                      ((reg18 - reg21) ?
                          $unsigned((reg25 != reg17)) : wire6) : $signed((wire11 | $unsigned(reg23)))));
  module30 #() modinst71 (.wire32(wire29), .wire34(wire6), .wire35(reg14), .clk(clk), .wire31(wire10), .y(wire70), .wire33(reg16));
  assign wire72 = $signed(($signed(($signed(wire11) ?
                          $signed(reg16) : (reg27 ? reg15 : reg19))) ?
                      ($unsigned((reg25 >> wire12)) && {(wire6 ^~ (8'hb6))}) : {$unsigned(reg16[(1'h1):(1'h1)])}));
  assign wire73 = wire7;
  assign wire74 = $signed((~|$signed($signed($unsigned(reg20)))));
  assign wire75 = (-$signed($unsigned(reg18[(3'h4):(2'h2)])));
  always
    @(posedge clk) begin
      reg76 <= $signed($signed(wire72[(2'h3):(1'h0)]));
      reg77 <= ({($signed((wire74 != reg27)) ?
                  reg18[(3'h5):(1'h0)] : (^$unsigned(wire10))),
              ($unsigned(reg26[(4'hb):(4'ha)]) ?
                  wire72[(3'h5):(1'h1)] : {$unsigned(wire12),
                      (wire12 ? (7'h43) : wire10)})} ?
          wire10 : wire12);
      reg78 <= (~^(8'hb8));
      reg79 <= $unsigned(wire12);
      if ($signed(wire75[(3'h4):(3'h4)]))
        begin
          reg80 <= {$unsigned($signed(($unsigned(wire74) ?
                  ((7'h43) ? (8'hb0) : reg18) : reg79))),
              ($signed((!{reg76, reg77})) + reg17)};
          reg81 <= reg77;
          if (reg26)
            begin
              reg82 <= ((reg25 ?
                  {{{(8'hba), wire73}},
                      (&(~|wire9))} : (reg25[(3'h5):(3'h4)] || $unsigned(wire8))) < $signed((wire73 <= (reg14 ?
                  reg78[(4'he):(1'h1)] : reg80[(2'h3):(1'h1)]))));
              reg83 <= (reg80 ^ $unsigned(((^(reg80 ^~ wire29)) >>> $signed((wire12 | reg17)))));
              reg84 <= $unsigned((~^{wire28, reg76}));
              reg85 <= (+$unsigned(wire9[(3'h7):(2'h3)]));
            end
          else
            begin
              reg82 <= (-{$signed($signed((reg83 <<< wire72))),
                  $signed((wire8[(4'h8):(4'h8)] && ((8'ha7) ?
                      wire10 : reg15)))});
              reg83 <= wire70[(4'ha):(3'h5)];
              reg84 <= $signed($signed((((~&reg24) ?
                      (reg83 ? reg18 : reg23) : {(7'h44), reg83}) ?
                  ((wire9 ? reg26 : reg25) ?
                      wire73[(3'h6):(3'h5)] : $signed(wire28)) : $signed(wire72))));
              reg85 <= wire72;
              reg86 <= (8'hb5);
            end
          if ($signed((&reg76[(3'h4):(2'h3)])))
            begin
              reg87 <= {reg26, $unsigned(wire6[(3'h4):(3'h4)])};
            end
          else
            begin
              reg87 <= ((|((!reg23) ?
                  reg24 : (-(wire8 << wire73)))) <= ($unsigned($unsigned(((8'ha3) != wire7))) >>> reg14));
              reg88 <= (|($signed({$unsigned((8'hb5)), $signed(reg85)}) ?
                  $unsigned($unsigned((reg76 <= reg84))) : ((reg21 ?
                      $signed(reg21) : reg17[(4'h9):(4'h8)]) ^~ (reg27 ?
                      reg21 : wire9[(1'h0):(1'h0)]))));
              reg89 <= wire28[(2'h3):(1'h1)];
            end
          reg90 <= (~^(^reg84));
        end
      else
        begin
          reg80 <= $signed(reg18);
          if ((wire13[(1'h1):(1'h0)] ?
              $unsigned({((reg76 + reg18) * (wire8 >= reg26))}) : reg27[(4'hb):(4'hb)]))
            begin
              reg81 <= {wire70[(4'he):(2'h3)],
                  (+(~$signed((wire73 ? wire75 : wire13))))};
              reg82 <= $unsigned($signed((($unsigned((7'h40)) ?
                      (reg26 && (7'h42)) : reg89) ?
                  (~$unsigned(reg90)) : reg26)));
              reg83 <= ($unsigned(((~^(!reg90)) ?
                  (+(wire73 ?
                      (8'had) : reg86)) : wire72)) ^ (wire72 <= $signed(reg15)));
              reg84 <= reg80[(1'h0):(1'h0)];
              reg85 <= (reg15 != ((($unsigned((8'hbe)) ?
                      (+reg89) : reg19[(2'h3):(2'h3)]) | wire9[(1'h1):(1'h1)]) ?
                  ($unsigned((8'ha6)) + $signed({wire72,
                      reg17})) : ((~&$unsigned((8'hb2))) ?
                      (~&$unsigned(reg80)) : reg21)));
            end
          else
            begin
              reg81 <= ($signed(wire9[(3'h5):(3'h4)]) ?
                  reg20[(4'hc):(1'h1)] : reg84[(2'h2):(2'h2)]);
            end
          reg86 <= $signed($signed($unsigned(($unsigned(reg84) ?
              (^~reg86) : $unsigned(wire28)))));
          if ((-$unsigned(reg25)))
            begin
              reg87 <= $unsigned((-((8'hb3) ?
                  reg80[(2'h2):(1'h1)] : wire10[(2'h2):(1'h1)])));
              reg88 <= $unsigned(reg89[(2'h2):(1'h1)]);
              reg89 <= (~^$unsigned(reg87[(3'h5):(1'h0)]));
            end
          else
            begin
              reg87 <= (~$unsigned({({wire13, (7'h42)} ?
                      $unsigned((8'ha9)) : $signed((7'h40))),
                  $signed($unsigned(wire10))}));
              reg88 <= $unsigned((8'hb1));
              reg89 <= reg90;
            end
        end
    end
  assign wire91 = $signed(wire72);
  assign wire92 = wire8[(4'hb):(4'h8)];
  assign wire93 = $unsigned(wire75[(1'h1):(1'h0)]);
  assign wire94 = ($unsigned((!(^$unsigned(wire7)))) == $signed(($unsigned((wire28 & reg18)) == (((8'hbc) > reg78) < $signed((8'ha7))))));
  assign wire95 = ($unsigned((((wire74 >> wire70) > (wire13 <= reg24)) | (+$unsigned((8'h9c))))) ?
                      (wire74 * $signed(wire28[(5'h10):(4'hf)])) : {$unsigned({{(7'h40),
                                  (8'hb4)},
                              reg24[(4'ha):(2'h3)]}),
                          (reg25[(4'ha):(4'ha)] ?
                              (~&wire75[(3'h5):(2'h3)]) : ($unsigned(wire9) <<< reg24))});
  module96 #() modinst136 (wire135, clk, wire74, reg80, wire13, reg86, wire10);
endmodule

module module96
#(parameter param133 = (~&((((&(8'h9e)) ? (|(8'hb4)) : ((7'h41) ? (8'hab) : (8'hab))) ? {((8'ha1) ? (8'hba) : (8'hb2))} : ((~|(8'ha2)) ? ((8'hbe) | (8'hb8)) : {(8'hb1), (8'hae)})) ? (~(((8'ha8) != (8'hb4)) ? {(8'ha4), (8'hb2)} : ((8'hae) ? (7'h42) : (8'ha2)))) : (^~(~((8'h9d) ? (8'h9d) : (8'ha2)))))), 
parameter param134 = {(~{((param133 ? param133 : param133) ? (param133 ^ param133) : ((8'ha7) ? param133 : (8'ha3))), {((8'hbb) ? param133 : param133), param133}}), {(~^((8'h9e) ? (~param133) : (+param133))), (~&param133)}})
(y, clk, wire101, wire100, wire99, wire98, wire97);
  output wire [(32'h150):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire101;
  input wire signed [(5'h13):(1'h0)] wire100;
  input wire signed [(4'hc):(1'h0)] wire99;
  input wire signed [(5'h15):(1'h0)] wire98;
  input wire [(4'ha):(1'h0)] wire97;
  wire signed [(5'h11):(1'h0)] wire132;
  wire signed [(3'h5):(1'h0)] wire131;
  wire signed [(2'h3):(1'h0)] wire130;
  wire signed [(3'h5):(1'h0)] wire129;
  wire signed [(3'h5):(1'h0)] wire128;
  wire signed [(4'hf):(1'h0)] wire127;
  wire [(4'hb):(1'h0)] wire126;
  wire signed [(4'hb):(1'h0)] wire123;
  wire signed [(4'he):(1'h0)] wire122;
  wire signed [(3'h4):(1'h0)] wire121;
  wire signed [(5'h13):(1'h0)] wire120;
  wire signed [(4'hd):(1'h0)] wire119;
  wire [(4'hd):(1'h0)] wire118;
  wire signed [(5'h13):(1'h0)] wire117;
  wire [(3'h4):(1'h0)] wire116;
  wire signed [(4'h8):(1'h0)] wire115;
  wire signed [(5'h13):(1'h0)] wire114;
  wire signed [(5'h12):(1'h0)] wire113;
  wire signed [(3'h6):(1'h0)] wire102;
  reg signed [(4'hd):(1'h0)] reg125 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg124 = (1'h0);
  reg [(5'h15):(1'h0)] reg112 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg111 = (1'h0);
  reg [(2'h3):(1'h0)] reg110 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg109 = (1'h0);
  reg [(3'h4):(1'h0)] reg108 = (1'h0);
  reg [(5'h12):(1'h0)] reg107 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg106 = (1'h0);
  reg [(5'h11):(1'h0)] reg105 = (1'h0);
  reg [(4'he):(1'h0)] reg104 = (1'h0);
  reg [(5'h14):(1'h0)] reg103 = (1'h0);
  assign y = {wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire102,
                 reg125,
                 reg124,
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
                 (1'h0)};
  assign wire102 = $signed($signed((($signed(wire99) | $unsigned(wire97)) ?
                       $signed({wire100}) : $unsigned(wire98))));
  always
    @(posedge clk) begin
      if ((&(+(((|wire97) ? (-wire100) : (~|wire98)) ?
          (~|(^~(8'hbf))) : {((8'hae) & wire97)}))))
        begin
          reg103 <= wire99;
          if ($unsigned($signed(wire102[(2'h2):(2'h2)])))
            begin
              reg104 <= wire101[(4'h8):(3'h6)];
              reg105 <= (wire97[(3'h5):(1'h0)] ?
                  $unsigned(wire97) : (~$unsigned(reg104[(3'h7):(2'h3)])));
              reg106 <= ((reg104[(3'h6):(3'h5)] ?
                  (8'hae) : $unsigned((wire98[(3'h5):(1'h1)] ?
                      wire98 : $unsigned((8'hae))))) != wire100[(5'h13):(4'hc)]);
              reg107 <= (((($signed(wire100) ? (^wire100) : $signed((8'hb6))) ?
                          (reg103 ?
                              $signed(reg106) : (wire102 == reg106)) : ($signed((8'ha9)) ?
                              wire97[(3'h5):(3'h4)] : wire97[(3'h7):(3'h6)])) ?
                      $signed((^$signed(reg105))) : $unsigned({$signed((8'h9e))})) ?
                  (wire98 << ((!wire101[(3'h4):(2'h2)]) && (&(&reg103)))) : wire101);
            end
          else
            begin
              reg104 <= ((wire99 * $signed((|(~wire99)))) ?
                  $unsigned(wire100[(5'h12):(4'he)]) : $signed(reg105[(1'h1):(1'h0)]));
              reg105 <= (|$unsigned($signed($signed(wire97[(3'h7):(1'h0)]))));
              reg106 <= $signed((wire98[(5'h15):(4'h8)] << reg103[(5'h11):(4'he)]));
            end
        end
      else
        begin
          reg103 <= reg106;
          reg104 <= reg104[(1'h0):(1'h0)];
          reg105 <= wire101[(4'hb):(2'h3)];
        end
      reg108 <= $signed($unsigned((wire99 ?
          {{wire100, reg107}, wire102[(3'h4):(2'h2)]} : $signed({reg107,
              wire102}))));
    end
  always
    @(posedge clk) begin
      reg109 <= ((+{{wire100[(3'h5):(3'h4)]}, ($unsigned(reg105) < wire100)}) ?
          reg107 : reg108[(2'h2):(1'h1)]);
      if (wire100[(4'h8):(1'h0)])
        begin
          if ($unsigned($signed((^~reg103[(5'h12):(5'h10)]))))
            begin
              reg110 <= $unsigned($unsigned((8'hb8)));
              reg111 <= reg107[(4'hb):(2'h3)];
            end
          else
            begin
              reg110 <= $signed({$signed(($unsigned(reg109) <<< reg109[(1'h0):(1'h0)])),
                  reg108[(3'h4):(2'h2)]});
              reg111 <= $signed(wire102[(2'h2):(2'h2)]);
            end
          reg112 <= $signed(wire97[(1'h0):(1'h0)]);
        end
      else
        begin
          reg110 <= $signed(reg107[(4'hc):(4'ha)]);
          reg111 <= wire100;
        end
    end
  assign wire113 = ((^$signed(reg110)) ?
                       {$signed($signed(reg108)),
                           (~^((reg103 ? (8'hac) : wire101) ?
                               (-reg104) : (~^(8'hac))))} : ({$unsigned($signed((8'h9f))),
                           (!$signed(reg105))} || ($signed(reg111[(1'h0):(1'h0)]) ?
                           ($unsigned(wire101) ?
                               $unsigned(reg107) : (reg110 ?
                                   (8'hba) : wire100)) : (reg110[(1'h0):(1'h0)] ?
                               $signed(wire97) : (wire100 ?
                                   reg108 : reg106)))));
  assign wire114 = $signed((reg110[(2'h2):(2'h2)] ?
                       reg106 : $unsigned($unsigned(((8'ha8) ?
                           wire102 : (8'hb6))))));
  assign wire115 = $unsigned((^~$unsigned(reg106)));
  assign wire116 = $signed(wire113[(4'h9):(4'h9)]);
  assign wire117 = $unsigned((-(({reg110, wire114} ?
                           (reg105 ? wire98 : wire116) : $unsigned(reg107)) ?
                       reg108[(1'h0):(1'h0)] : wire100[(4'hf):(4'h8)])));
  assign wire118 = ((~&($signed($signed(wire115)) ^ ((wire99 ?
                       reg107 : wire98) < $signed(reg112)))) ~^ ($signed($signed((wire113 ?
                           reg110 : reg109))) ?
                       $unsigned((7'h40)) : $signed(((~^reg107) ?
                           reg107 : (reg103 ? (8'ha7) : wire101)))));
  assign wire119 = reg104;
  assign wire120 = reg109;
  assign wire121 = reg103[(4'he):(4'h9)];
  assign wire122 = ((((8'ha6) ?
                           ((8'hb9) ?
                               (-wire113) : (reg110 ?
                                   (8'ha0) : reg110)) : (^~$signed(wire115))) < $unsigned(({reg112} ?
                           {wire120} : (-wire116)))) ?
                       (wire114[(4'hc):(1'h0)] >> (|(^wire97))) : ($signed($unsigned((^~wire97))) > (reg104[(4'h8):(4'h8)] <<< $unsigned((reg104 != wire99)))));
  assign wire123 = ($unsigned($signed(((wire121 ? wire101 : wire118) ?
                           (+reg104) : (wire117 ? wire101 : (8'hab))))) ?
                       $signed(wire114) : (8'hb5));
  always
    @(posedge clk) begin
      reg124 <= wire121[(3'h4):(2'h2)];
      reg125 <= $unsigned($unsigned(($unsigned({wire119, reg111}) ?
          (|wire122) : ((8'hba) ? (reg108 ~^ (8'hb9)) : $unsigned(wire113)))));
    end
  assign wire126 = reg104;
  assign wire127 = reg110;
  assign wire128 = (((|(!$unsigned(reg106))) >>> (wire116 ?
                       wire114 : (~&$signed((8'hbf))))) - (~^{((wire121 ?
                           wire102 : reg124) * (8'hb7)),
                       ((reg104 ^ reg108) || $unsigned(wire116))}));
  assign wire129 = ($signed((~^$signed($signed(reg107)))) ?
                       wire123 : ((({(8'had), wire128} ?
                               (!reg125) : (wire100 ?
                                   wire113 : reg109)) - $signed(((8'haf) ?
                               wire97 : wire120))) ?
                           $unsigned(reg105[(4'he):(4'ha)]) : (($signed(wire117) && (wire121 ?
                               reg124 : reg104)) + wire122[(3'h4):(1'h0)])));
  assign wire130 = $signed((wire123[(2'h2):(1'h1)] >> {(wire128[(3'h5):(2'h2)] ?
                           $signed(reg106) : wire119),
                       reg104[(1'h0):(1'h0)]}));
  assign wire131 = wire122[(3'h6):(3'h5)];
  assign wire132 = (^((wire115 ?
                           (((8'hb7) >= wire102) ?
                               $unsigned(reg105) : ((8'hbf) < wire114)) : {$unsigned(wire116)}) ?
                       (8'hb4) : (reg124 ?
                           $unsigned($signed(wire97)) : ($unsigned(wire101) - (reg111 == wire122)))));
endmodule

module module30  (y, clk, wire35, wire34, wire33, wire32, wire31);
  output wire [(32'h159):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire35;
  input wire [(3'h5):(1'h0)] wire34;
  input wire [(4'hd):(1'h0)] wire33;
  input wire signed [(2'h3):(1'h0)] wire32;
  input wire signed [(3'h5):(1'h0)] wire31;
  wire signed [(3'h7):(1'h0)] wire69;
  wire signed [(5'h14):(1'h0)] wire68;
  wire signed [(2'h3):(1'h0)] wire67;
  wire [(5'h15):(1'h0)] wire66;
  wire [(3'h6):(1'h0)] wire57;
  wire [(3'h7):(1'h0)] wire56;
  wire [(2'h2):(1'h0)] wire55;
  wire [(4'ha):(1'h0)] wire54;
  wire [(5'h15):(1'h0)] wire53;
  wire [(5'h15):(1'h0)] wire52;
  wire [(4'ha):(1'h0)] wire51;
  wire signed [(4'ha):(1'h0)] wire50;
  wire signed [(3'h7):(1'h0)] wire37;
  wire signed [(3'h5):(1'h0)] wire36;
  reg [(3'h6):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg63 = (1'h0);
  reg [(5'h11):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg60 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg58 = (1'h0);
  reg [(3'h4):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg47 = (1'h0);
  reg signed [(4'he):(1'h0)] reg46 = (1'h0);
  reg [(4'hb):(1'h0)] reg45 = (1'h0);
  reg [(5'h12):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg42 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg41 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg39 = (1'h0);
  reg [(5'h11):(1'h0)] reg38 = (1'h0);
  assign y = {wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire37,
                 wire36,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
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
                 (1'h0)};
  assign wire36 = $signed((((wire33[(1'h0):(1'h0)] ?
                          (~&(8'hab)) : (wire33 ?
                              wire34 : wire35)) | ((-wire35) != wire34[(2'h2):(1'h1)])) ?
                      wire34 : wire33[(4'ha):(1'h0)]));
  assign wire37 = wire33[(2'h3):(2'h2)];
  always
    @(posedge clk) begin
      if ($signed((8'hbb)))
        begin
          reg38 <= $signed((~&wire34));
          reg39 <= (!((wire34 | wire33) >= $unsigned(((-wire34) ?
              {wire34} : $unsigned(wire34)))));
          if ($signed({$unsigned($unsigned($unsigned(wire37))), wire35}))
            begin
              reg40 <= (~$signed({{(wire36 || (7'h40))}, {wire36}}));
            end
          else
            begin
              reg40 <= $signed(({wire35[(4'he):(1'h0)], reg40[(1'h0):(1'h0)]} ?
                  $signed((^~(~wire34))) : ((-$signed(wire37)) & (((8'hbc) ?
                          reg38 : reg39) ?
                      (|reg38) : wire36[(3'h5):(1'h0)]))));
              reg41 <= $signed(wire34);
              reg42 <= $unsigned({wire32,
                  ((8'hbe) - ((8'ha0) ~^ (wire31 || wire33)))});
              reg43 <= $unsigned((((reg39 <= $signed(wire36)) ?
                  reg40 : (~$signed((7'h40)))) >>> (7'h44)));
              reg44 <= $unsigned(($unsigned((&$signed((8'hae)))) ?
                  $signed($unsigned({reg38})) : (8'hb8)));
            end
          reg45 <= (7'h42);
        end
      else
        begin
          reg38 <= (reg39 <= {((!(~&wire31)) - wire31),
              $signed((wire35 ? (wire35 == wire37) : $unsigned(reg38)))});
        end
      reg46 <= $unsigned(wire37);
      if (($unsigned(((-$unsigned(reg43)) ?
              (-(reg46 ? reg46 : reg46)) : $signed((wire35 ~^ wire31)))) ?
          (~wire36) : wire36[(2'h2):(1'h1)]))
        begin
          reg47 <= ($signed((+wire35[(4'hc):(4'h8)])) ^~ $unsigned($signed(wire36[(1'h0):(1'h0)])));
        end
      else
        begin
          reg47 <= (reg41[(1'h0):(1'h0)] ?
              (-(wire32[(2'h3):(1'h1)] ?
                  $unsigned((reg40 ? wire31 : wire31)) : (reg44[(4'hd):(1'h0)] ?
                      $signed(wire35) : {reg46}))) : reg47[(1'h1):(1'h1)]);
          reg48 <= (8'ha1);
          reg49 <= wire37[(3'h4):(3'h4)];
        end
    end
  assign wire50 = {$unsigned({$signed((reg48 ? reg39 : reg41))}),
                      (~^(({(8'hbe),
                          reg43} == $unsigned(wire34)) - reg48[(4'h9):(4'h9)]))};
  assign wire51 = wire36;
  assign wire52 = $signed((!(wire33 ?
                      ({reg49} || $signed(reg41)) : wire35[(4'hc):(4'hc)])));
  assign wire53 = reg40[(2'h2):(1'h1)];
  assign wire54 = (($unsigned(({wire50} ~^ $unsigned((8'hb9)))) + wire50[(3'h5):(2'h3)]) > (8'hba));
  assign wire55 = ($signed($signed((&$unsigned(wire54)))) ~^ $signed(reg49[(1'h1):(1'h1)]));
  assign wire56 = $signed((reg45 >>> ($unsigned((wire55 * wire55)) ?
                      reg46[(3'h6):(3'h6)] : ({wire33} || (|wire54)))));
  assign wire57 = $signed((wire55 + wire53[(5'h14):(3'h4)]));
  always
    @(posedge clk) begin
      reg58 <= (wire31[(3'h5):(3'h5)] ?
          reg46 : (reg40 || $signed($unsigned(wire55))));
      if (wire54)
        begin
          reg59 <= $unsigned((reg44[(2'h3):(2'h2)] >= reg39));
        end
      else
        begin
          reg59 <= $unsigned((reg45[(4'ha):(3'h7)] ?
              (wire37[(3'h7):(3'h4)] ?
                  $signed({wire57}) : (|(wire57 ?
                      (8'hb2) : wire56))) : (reg41[(1'h1):(1'h1)] ?
                  wire34[(1'h1):(1'h1)] : reg38[(4'he):(4'ha)])));
          if (($signed((($signed(reg45) << (reg44 ?
              wire53 : reg49)) >>> reg42[(3'h5):(3'h4)])) >> (^reg41)))
            begin
              reg60 <= (wire56[(1'h0):(1'h0)] && wire53[(4'h8):(3'h6)]);
              reg61 <= {wire34[(3'h5):(1'h0)], wire34[(2'h2):(1'h1)]};
              reg62 <= (8'hb8);
              reg63 <= (~$unsigned((wire31 ?
                  (wire35[(4'h8):(3'h5)] ?
                      $signed((8'ha4)) : $signed(wire54)) : reg45)));
            end
          else
            begin
              reg60 <= $unsigned((reg49[(3'h4):(1'h1)] && {(~|reg42[(3'h5):(1'h0)])}));
              reg61 <= reg44[(3'h4):(2'h2)];
            end
        end
      reg64 <= wire54;
      reg65 <= $signed(((((reg48 ?
              reg44 : reg62) >> {reg39}) + $signed((reg41 <= reg46))) ?
          $signed(({wire52} < $signed(wire50))) : (($unsigned(reg59) < $signed(wire34)) != reg38[(4'h8):(3'h6)])));
    end
  assign wire66 = $unsigned(($unsigned(reg62) >> (~$signed(wire54))));
  assign wire67 = (($unsigned((reg46 ? reg63 : {(8'haf)})) ?
                          ((+$unsigned(reg61)) && $signed(reg44[(3'h5):(3'h4)])) : ((!(reg61 ?
                              reg65 : reg60)) ~^ (wire37[(2'h3):(2'h2)] && (^reg46)))) ?
                      (wire33[(4'h9):(4'h8)] >= reg40) : reg61);
  assign wire68 = wire55[(1'h0):(1'h0)];
  assign wire69 = reg61[(1'h0):(1'h0)];
endmodule
