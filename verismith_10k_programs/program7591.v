module top
#(parameter param97 = (({({(7'h44)} ? ((8'hb2) ? (7'h41) : (8'ha5)) : (^(7'h44)))} ? (~^(~|(8'ha1))) : (!(^~{(8'ha6), (8'hb4)}))) ? ((((^~(8'hbd)) ? ((8'hbb) ? (8'ha0) : (8'hbd)) : ((8'hbc) ? (8'hac) : (8'h9c))) ^ ((~^(8'hab)) ? ((8'ha8) >> (8'hb7)) : (^~(8'h9c)))) ? ((8'hb7) > (8'ha1)) : ((^((8'hae) ? (8'hab) : (8'h9c))) || (~^(~(8'hb7))))) : {({((8'hba) <<< (7'h40)), ((8'h9f) ? (8'hbc) : (8'hb8))} >= ((~(8'hae)) * ((8'ha3) || (7'h41)))), (((~|(8'ha4)) <= ((8'hb8) + (8'ha5))) & ((~(8'hbf)) ? ((8'hb0) & (8'hb2)) : ((8'hbb) >= (8'haf))))}), 
parameter param98 = (^~((8'ha7) ? param97 : {(param97 ? param97 : (param97 || param97))})))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hf8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire0;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire3;
  wire signed [(3'h7):(1'h0)] wire96;
  wire signed [(5'h15):(1'h0)] wire95;
  wire signed [(5'h10):(1'h0)] wire81;
  wire signed [(4'he):(1'h0)] wire4;
  wire [(4'he):(1'h0)] wire5;
  wire signed [(5'h14):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire7;
  wire signed [(3'h4):(1'h0)] wire8;
  wire [(5'h11):(1'h0)] wire79;
  reg [(3'h7):(1'h0)] reg94 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg93 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg92 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg91 = (1'h0);
  reg [(4'hb):(1'h0)] reg90 = (1'h0);
  reg [(3'h5):(1'h0)] reg89 = (1'h0);
  reg [(4'h9):(1'h0)] reg88 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg87 = (1'h0);
  reg [(3'h4):(1'h0)] reg86 = (1'h0);
  reg [(5'h14):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg83 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg82 = (1'h0);
  assign y = {wire96,
                 wire95,
                 wire81,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire79,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 (1'h0)};
  assign wire4 = ($signed($unsigned(($unsigned(wire3) ?
                         (wire2 ^~ wire3) : wire2))) ?
                     (~|$signed(((~|wire0) ^~ $signed(wire1)))) : $unsigned(({(wire3 <<< wire1)} ^~ wire0[(1'h0):(1'h0)])));
  assign wire5 = wire4;
  assign wire6 = $signed($unsigned($signed((wire5 ?
                     $unsigned(wire0) : (wire2 ? wire3 : wire0)))));
  assign wire7 = wire1[(2'h2):(2'h2)];
  assign wire8 = (!(8'ha6));
  module9 #() modinst80 (wire79, clk, wire7, wire2, wire4, wire0, wire8);
  assign wire81 = ($signed((wire4 ^ wire6)) ?
                      $signed((^~wire1)) : (&(-{wire8[(1'h1):(1'h0)],
                          $signed(wire8)})));
  always
    @(posedge clk) begin
      if ((^wire3[(3'h4):(1'h0)]))
        begin
          reg82 <= $unsigned(((wire0 ?
              $unsigned((wire0 >>> wire81)) : $unsigned(((8'hb5) ?
                  (7'h40) : (7'h44)))) ~^ {wire81[(3'h5):(1'h0)]}));
          if ($unsigned((-(~^wire5[(4'ha):(4'h9)]))))
            begin
              reg83 <= reg82;
            end
          else
            begin
              reg83 <= ($signed(($unsigned((wire1 != wire5)) ?
                      (-(reg83 || wire81)) : {(wire4 || wire3)})) ?
                  (8'ha9) : (~|wire7));
            end
        end
      else
        begin
          reg82 <= (^~$signed(wire3));
          if ($unsigned(($signed($unsigned((7'h44))) ?
              $signed($unsigned($unsigned(wire2))) : wire81[(1'h0):(1'h0)])))
            begin
              reg83 <= {{wire4, $unsigned((wire0[(1'h0):(1'h0)] * {(8'ha9)}))},
                  (!wire5[(3'h4):(3'h4)])};
              reg84 <= wire0;
              reg85 <= (|(wire3 ?
                  $signed(($unsigned(wire7) ?
                      (wire4 ?
                          (8'ha0) : wire0) : ((8'hb0) ^ (8'hb7)))) : {$signed($signed(wire79))}));
              reg86 <= $unsigned($signed(reg84));
            end
          else
            begin
              reg83 <= $unsigned(wire81);
              reg84 <= $signed((+(($unsigned(wire6) ?
                  wire6 : reg83) != wire4[(2'h2):(1'h1)])));
              reg85 <= $unsigned({((wire0[(3'h6):(1'h1)] | {wire2}) <= $signed((wire79 <= reg85)))});
              reg86 <= {wire6[(5'h13):(5'h11)]};
            end
          if ((wire4 ? wire6 : (&$unsigned(reg86))))
            begin
              reg87 <= $unsigned($signed(($signed($unsigned((8'hb3))) ?
                  (-wire7[(1'h1):(1'h0)]) : $unsigned($signed(wire79)))));
              reg88 <= $unsigned($signed((&$unsigned($unsigned(wire7)))));
              reg89 <= $signed({$signed($signed(((8'ha9) ? (8'hb1) : wire5))),
                  $signed({$unsigned(wire0), {wire3}})});
            end
          else
            begin
              reg87 <= $signed(($signed((reg86 ?
                  ((8'hbe) ?
                      wire1 : wire6) : (reg82 | reg83))) >> $unsigned($signed((wire81 ?
                  reg84 : reg83)))));
              reg88 <= reg88[(1'h0):(1'h0)];
              reg89 <= $signed((&(wire2[(4'hd):(4'h9)] || reg83)));
            end
          reg90 <= $unsigned(wire81);
          reg91 <= ({(~|$signed(wire5)),
              (^~$signed((reg84 ? reg86 : (8'haf))))} ^ wire6);
        end
      reg92 <= $unsigned(((wire4[(4'ha):(3'h6)] ?
              wire7[(3'h5):(2'h3)] : reg84) ?
          reg87 : reg83[(2'h3):(1'h0)]));
      reg93 <= reg85;
      reg94 <= $unsigned($unsigned(wire0));
    end
  assign wire95 = $unsigned(wire81);
  assign wire96 = $unsigned($signed(reg89));
endmodule

module module9
#(parameter param77 = {(8'ha0)}, 
parameter param78 = ((((param77 ? (+param77) : ((8'hba) * param77)) ? ((param77 + (8'ha8)) ? (~|param77) : param77) : (~&(param77 ? param77 : param77))) ? (((&param77) ^ (param77 ? param77 : param77)) <= (!param77)) : param77) ? ((~param77) ? ({{param77, param77}, ((8'ha2) >>> (7'h44))} == {((8'hbe) ~^ param77)}) : (~^{(param77 == param77)})) : param77))
(y, clk, wire10, wire11, wire12, wire13, wire14);
  output wire [(32'h279):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire10;
  input wire [(5'h14):(1'h0)] wire11;
  input wire [(4'ha):(1'h0)] wire12;
  input wire signed [(4'hf):(1'h0)] wire13;
  input wire signed [(3'h4):(1'h0)] wire14;
  wire [(3'h6):(1'h0)] wire76;
  wire [(5'h13):(1'h0)] wire72;
  wire signed [(5'h15):(1'h0)] wire71;
  wire signed [(4'hf):(1'h0)] wire70;
  wire signed [(5'h13):(1'h0)] wire15;
  wire signed [(4'hd):(1'h0)] wire16;
  wire signed [(5'h15):(1'h0)] wire17;
  wire signed [(4'he):(1'h0)] wire43;
  wire [(4'h9):(1'h0)] wire44;
  wire signed [(4'hc):(1'h0)] wire68;
  reg [(5'h14):(1'h0)] reg75 = (1'h0);
  reg [(4'h8):(1'h0)] reg74 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg73 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg51 = (1'h0);
  reg [(4'ha):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg49 = (1'h0);
  reg [(5'h13):(1'h0)] reg48 = (1'h0);
  reg [(4'ha):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg45 = (1'h0);
  reg [(5'h10):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg41 = (1'h0);
  reg [(3'h4):(1'h0)] reg40 = (1'h0);
  reg [(4'he):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg38 = (1'h0);
  reg [(5'h15):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg35 = (1'h0);
  reg [(2'h3):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg33 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg31 = (1'h0);
  reg [(4'h8):(1'h0)] reg30 = (1'h0);
  reg [(4'hc):(1'h0)] reg29 = (1'h0);
  reg [(4'hd):(1'h0)] reg28 = (1'h0);
  reg [(5'h15):(1'h0)] reg27 = (1'h0);
  reg [(5'h14):(1'h0)] reg26 = (1'h0);
  reg [(5'h12):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg24 = (1'h0);
  reg [(2'h2):(1'h0)] reg23 = (1'h0);
  reg [(5'h15):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg20 = (1'h0);
  reg [(5'h11):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg18 = (1'h0);
  assign y = {wire76,
                 wire72,
                 wire71,
                 wire70,
                 wire15,
                 wire16,
                 wire17,
                 wire43,
                 wire44,
                 wire68,
                 reg75,
                 reg74,
                 reg73,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
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
                 reg18,
                 (1'h0)};
  assign wire15 = $signed($unsigned($unsigned(({wire12, wire13} + wire10))));
  assign wire16 = ((^{$unsigned(wire10)}) - $signed($unsigned((8'ha3))));
  assign wire17 = wire10;
  always
    @(posedge clk) begin
      if (wire13[(2'h3):(1'h1)])
        begin
          reg18 <= {wire14[(1'h1):(1'h1)]};
          if (($unsigned((wire15 | ((&(7'h42)) ?
                  {wire14, wire17} : (wire17 ~^ (8'hb2))))) ?
              (&($unsigned($signed(wire13)) | (-wire10[(4'h9):(3'h6)]))) : ((&$signed(wire14)) ?
                  $unsigned(wire10[(2'h2):(1'h1)]) : wire11[(3'h7):(2'h3)])))
            begin
              reg19 <= {{wire17},
                  ($signed(((!wire15) && {wire10})) >>> wire11)};
              reg20 <= wire10;
              reg21 <= (reg19 ?
                  $signed((|$signed($unsigned(reg20)))) : $signed(wire15[(3'h6):(3'h4)]));
            end
          else
            begin
              reg19 <= (7'h41);
            end
          reg22 <= $signed(((((wire17 == reg20) ?
              $signed(reg20) : (~|wire11)) ^ wire12) < wire10));
        end
      else
        begin
          reg18 <= wire17;
          reg19 <= reg22[(4'he):(2'h3)];
          reg20 <= ({$unsigned($signed(wire11[(4'hd):(4'h9)])), wire16} ?
              (reg20 ?
                  (^~$unsigned(reg21[(1'h0):(1'h0)])) : wire12[(1'h1):(1'h0)]) : ($unsigned(wire17[(4'hd):(4'h8)]) ?
                  $unsigned({((8'ha4) & (8'ha6)),
                      (reg22 <<< reg21)}) : {(~&(wire13 * (8'hae))),
                      $signed((wire10 ? wire10 : wire13))}));
          reg21 <= $signed((^~(wire16[(3'h5):(1'h1)] ~^ $unsigned((|wire15)))));
          if ((~^({{$unsigned(wire12), wire13[(3'h5):(2'h2)]},
              $signed(wire13[(2'h3):(1'h0)])} == wire11)))
            begin
              reg22 <= (((^~wire16) ?
                      ((8'ha4) * wire16) : ($signed((wire15 ?
                          wire16 : (8'ha1))) > reg20)) ?
                  ({($unsigned((8'hb9)) || wire14[(1'h0):(1'h0)]),
                          $unsigned(wire15[(4'hb):(4'h8)])} ?
                      (wire12 + $signed((8'ha9))) : $signed((!{wire10,
                          wire13}))) : $unsigned((^~$signed(wire14[(1'h0):(1'h0)]))));
              reg23 <= (+$unsigned((+($unsigned(reg20) < $unsigned(reg20)))));
              reg24 <= (^reg20[(5'h10):(4'hc)]);
              reg25 <= $signed((8'h9c));
              reg26 <= (((^~{{(8'hb8), reg25}, (wire14 || wire12)}) ?
                  reg23[(2'h2):(1'h0)] : wire16) && wire10[(4'h9):(3'h4)]);
            end
          else
            begin
              reg22 <= (-wire10);
              reg23 <= ((^~(wire11 <= (~(wire11 | reg25)))) * (-((reg22 & {wire15,
                      wire10}) ?
                  (!$signed(reg25)) : ((wire16 ? reg25 : reg19) ?
                      wire10 : (wire16 ~^ reg18)))));
              reg24 <= reg20[(1'h1):(1'h0)];
            end
        end
      if ($unsigned((wire12[(3'h5):(3'h4)] ?
          (((wire13 ~^ wire13) * (~|reg19)) ?
              $unsigned((^~wire10)) : ($unsigned(wire11) ?
                  reg20[(5'h12):(4'h9)] : $unsigned(reg25))) : wire15)))
        begin
          if (reg24[(1'h1):(1'h1)])
            begin
              reg27 <= wire17[(4'h9):(2'h2)];
              reg28 <= reg26[(3'h5):(3'h5)];
              reg29 <= $signed(reg23);
              reg30 <= $signed($signed(wire11[(4'hf):(2'h3)]));
              reg31 <= $unsigned(reg19);
            end
          else
            begin
              reg27 <= $unsigned($signed(($unsigned($signed(reg19)) >> ((wire12 ?
                  reg29 : reg30) - reg20))));
            end
          reg32 <= (reg28[(4'hd):(3'h7)] >> $unsigned(reg18[(4'he):(4'h8)]));
          if ((wire13 ?
              $unsigned((~^(~&$unsigned(reg23)))) : $unsigned(($signed((+wire16)) * $unsigned(reg28[(4'h9):(3'h6)])))))
            begin
              reg33 <= $unsigned(({(8'hbb),
                      (reg30[(1'h0):(1'h0)] ?
                          reg30[(2'h2):(1'h1)] : wire16[(2'h2):(1'h1)])} ?
                  ((|reg31) ?
                      (!$signed(wire11)) : ((|reg19) && (-reg22))) : $unsigned(wire11[(4'hd):(2'h3)])));
              reg34 <= reg22[(5'h14):(5'h11)];
              reg35 <= (~((reg31[(3'h5):(1'h0)] ?
                  $signed(((8'h9e) ?
                      wire11 : reg25)) : (-$unsigned(wire13))) > ({(+wire11),
                      (8'h9d)} ?
                  {reg18[(3'h6):(3'h5)], (reg34 + reg29)} : reg33)));
            end
          else
            begin
              reg33 <= reg33;
              reg34 <= (wire14[(2'h3):(2'h3)] | $signed(reg35));
              reg35 <= $signed(((8'haa) ?
                  (&reg33) : {(^(~&wire13)), reg29[(4'h8):(1'h0)]}));
            end
          reg36 <= wire14[(2'h3):(2'h3)];
          reg37 <= (8'hba);
        end
      else
        begin
          reg27 <= {reg33};
          if ({((~^reg37[(3'h6):(1'h0)]) ?
                  $unsigned(((reg21 ? reg36 : reg32) ?
                      $signed(reg31) : {reg25})) : reg35[(2'h2):(1'h1)])})
            begin
              reg28 <= $unsigned((8'ha7));
              reg29 <= $unsigned($signed($signed($unsigned($unsigned((7'h44))))));
              reg30 <= ((reg36 ?
                      {({reg27, wire15} ^ reg22)} : $unsigned(({reg23} ?
                          (reg25 <<< (7'h40)) : $unsigned(wire14)))) ?
                  $unsigned(($unsigned((|wire15)) ?
                      {wire15} : ($unsigned((8'haf)) ?
                          {reg20,
                              (8'hbd)} : (8'hb9)))) : (^(~^((~&reg33) ^~ $signed(reg34)))));
              reg31 <= ($unsigned($unsigned((reg20[(3'h5):(2'h3)] ?
                      $signed(wire10) : $unsigned(wire12)))) ?
                  reg22 : reg29[(3'h6):(3'h6)]);
            end
          else
            begin
              reg28 <= {wire12[(3'h6):(2'h2)]};
              reg29 <= ($signed($unsigned(($unsigned(reg35) + $signed(reg27)))) ?
                  (~(7'h44)) : $unsigned((^$unsigned((+wire11)))));
            end
          if ((((-$signed((reg20 ? reg19 : (8'hb9)))) ?
              reg35 : $unsigned(wire16)) ^ (~$unsigned((reg34[(2'h2):(1'h0)] | $unsigned(reg24))))))
            begin
              reg32 <= (~reg37);
              reg33 <= (8'ha0);
              reg34 <= {reg24, $signed($unsigned($signed((reg28 || wire17))))};
              reg35 <= $unsigned((((((8'hb1) || reg26) ?
                          (^~reg28) : $unsigned(reg22)) ?
                      reg36[(3'h5):(3'h5)] : (!$unsigned((8'hb0)))) ?
                  reg27[(4'hd):(4'h8)] : reg29[(4'h9):(2'h3)]));
            end
          else
            begin
              reg32 <= $signed((8'ha1));
              reg33 <= reg37[(1'h0):(1'h0)];
              reg34 <= wire10[(2'h2):(1'h1)];
              reg35 <= $unsigned(reg29);
            end
          reg36 <= reg37;
        end
      reg38 <= reg30[(4'h8):(1'h0)];
      if ($unsigned($signed($unsigned((^~$unsigned(reg28))))))
        begin
          reg39 <= (-($signed(($signed((8'hb6)) ?
                  ((8'hac) <= reg28) : (reg34 ? wire16 : reg31))) ?
              (wire15 == ($signed(reg38) << {reg27,
                  (8'hb2)})) : reg37[(5'h14):(3'h7)]));
          reg40 <= {(&(8'h9e))};
          reg41 <= {(|(7'h42))};
          reg42 <= $signed({(+reg25)});
        end
      else
        begin
          reg39 <= (reg18 != $signed({$unsigned({wire10, reg33}),
              $unsigned(((8'ha4) != reg28))}));
        end
    end
  assign wire43 = wire10[(3'h7):(2'h2)];
  assign wire44 = $unsigned($signed(reg37));
  always
    @(posedge clk) begin
      reg45 <= $unsigned((!(!(~&((7'h43) * reg41)))));
    end
  always
    @(posedge clk) begin
      reg46 <= $unsigned((~&$signed(reg29[(3'h6):(2'h3)])));
      if ($unsigned((-reg34[(1'h0):(1'h0)])))
        begin
          if ((reg34 ^~ {$unsigned($unsigned(reg27))}))
            begin
              reg47 <= $signed(((~&(^(wire16 ? (8'h9e) : (8'hb5)))) | reg18));
              reg48 <= reg19;
              reg49 <= (~&$unsigned($signed((reg26[(1'h1):(1'h1)] ?
                  reg20 : ((8'hba) ? reg24 : (8'ha2))))));
            end
          else
            begin
              reg47 <= wire15;
              reg48 <= $unsigned(($signed(reg45) - (^reg47[(3'h4):(3'h4)])));
              reg49 <= (|reg23);
              reg50 <= ((&wire14) != $unsigned(wire16[(3'h6):(3'h4)]));
            end
        end
      else
        begin
          reg47 <= ($signed(reg24[(2'h2):(1'h0)]) == $signed((8'haf)));
          reg48 <= {({$signed(reg27[(5'h13):(3'h7)])} ?
                  $signed($signed((~|reg41))) : (({reg38} ^ ((8'hb0) ?
                      reg36 : wire10)) == (reg30 < $signed(reg49)))),
              reg22[(5'h12):(4'h8)]};
          reg49 <= ({({reg40[(3'h4):(2'h3)]} <<< reg45),
              ((-{(8'hac)}) ?
                  (8'hb4) : ($unsigned(reg26) ^ $signed(reg37)))} | {(reg38[(2'h2):(2'h2)] + $signed(reg21)),
              (^$unsigned((!reg26)))});
          reg50 <= reg41;
        end
      reg51 <= (~&reg20[(5'h10):(4'hb)]);
      reg52 <= $signed(reg29);
    end
  module53 #() modinst69 (.wire57(reg51), .y(wire68), .wire56(wire12), .wire55(reg42), .clk(clk), .wire54(reg19), .wire58(reg32));
  assign wire70 = wire15[(3'h6):(2'h3)];
  assign wire71 = ($unsigned(wire11) ?
                      ((|(~^(reg48 > reg36))) * $signed(reg51)) : (reg49 ?
                          (((+wire16) ? reg39 : $unsigned(reg31)) ?
                              {$signed(wire68)} : ((&wire17) ?
                                  $unsigned(reg30) : (-reg46))) : $unsigned($unsigned({reg42,
                              wire15}))));
  assign wire72 = (((^($unsigned(reg24) ?
                          $signed(reg40) : reg32[(3'h5):(3'h5)])) ?
                      (!(reg22[(5'h10):(4'hd)] ?
                          (reg49 ~^ (8'hbe)) : (wire14 ?
                              wire15 : (7'h42)))) : $unsigned($unsigned((8'ha1)))) >> {($unsigned($unsigned(reg19)) ?
                          ((reg51 ? reg40 : reg39) ?
                              $signed(reg42) : reg36) : reg22),
                      ({$signed(reg47)} + ((^~wire11) ?
                          ((8'hae) >= wire70) : (reg35 <= reg49)))});
  always
    @(posedge clk) begin
      reg73 <= wire12[(1'h1):(1'h1)];
      reg74 <= {$signed((+wire72[(5'h12):(5'h11)]))};
      reg75 <= $unsigned($signed({{(^~reg37), $unsigned((8'hab))},
          ((wire12 ~^ reg74) * {(8'hbd), reg41})}));
    end
  assign wire76 = reg50[(2'h2):(1'h1)];
endmodule

module module53  (y, clk, wire58, wire57, wire56, wire55, wire54);
  output wire [(32'h47):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire58;
  input wire signed [(5'h15):(1'h0)] wire57;
  input wire [(2'h3):(1'h0)] wire56;
  input wire signed [(4'hb):(1'h0)] wire55;
  input wire [(4'h9):(1'h0)] wire54;
  wire [(2'h3):(1'h0)] wire67;
  wire [(3'h4):(1'h0)] wire66;
  wire signed [(4'he):(1'h0)] wire65;
  wire [(4'hc):(1'h0)] wire64;
  wire signed [(4'h8):(1'h0)] wire63;
  wire signed [(4'h9):(1'h0)] wire62;
  wire [(3'h6):(1'h0)] wire61;
  wire [(4'ha):(1'h0)] wire60;
  wire signed [(3'h4):(1'h0)] wire59;
  assign y = {wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 (1'h0)};
  assign wire59 = $signed((((8'ha8) * wire58[(3'h4):(1'h1)]) ?
                      wire55 : ((~|(wire57 >= wire56)) << ((+wire55) >>> $unsigned((7'h40))))));
  assign wire60 = wire54;
  assign wire61 = ($signed(wire59) ?
                      $signed($unsigned(($unsigned(wire57) && $signed(wire59)))) : wire56);
  assign wire62 = (((~^wire55) ?
                      {wire55[(3'h6):(3'h5)]} : ($signed(wire59[(3'h4):(1'h1)]) > wire55)) != $signed(($signed($signed(wire59)) ?
                      $signed((wire60 ?
                          wire58 : wire55)) : ($signed(wire60) * $unsigned(wire61)))));
  assign wire63 = (wire59[(3'h4):(1'h0)] ?
                      wire61[(3'h6):(1'h0)] : $unsigned($signed((!(wire55 >>> wire56)))));
  assign wire64 = ((($unsigned($signed(wire63)) ?
                              $unsigned($signed(wire54)) : wire57[(1'h0):(1'h0)]) ?
                          (8'hb8) : wire61[(3'h4):(1'h1)]) ?
                      wire62 : (wire62 ?
                          (~^$unsigned(wire56[(1'h1):(1'h0)])) : wire57));
  assign wire65 = $unsigned($signed($unsigned((wire63[(1'h1):(1'h1)] != $unsigned(wire63)))));
  assign wire66 = {{((~&(wire60 ~^ wire65)) ~^ {wire64[(2'h2):(2'h2)]})},
                      (^$signed($unsigned(wire63)))};
  assign wire67 = wire64[(2'h3):(1'h1)];
endmodule
