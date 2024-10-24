module top
#(parameter param99 = ({{(((8'hb8) ? (8'hb4) : (8'hbb)) ? ((7'h40) > (8'hb3)) : ((8'ha2) || (8'had)))}} <<< (~(~|(8'h9e)))), 
parameter param100 = {(({(param99 ? param99 : param99), (param99 ? param99 : param99)} ? param99 : (|(^param99))) <= (((param99 < param99) ? param99 : (param99 ? param99 : (7'h44))) != param99))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1b6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire98;
  wire [(4'hf):(1'h0)] wire97;
  wire [(5'h15):(1'h0)] wire74;
  wire signed [(4'hd):(1'h0)] wire73;
  wire signed [(4'hd):(1'h0)] wire72;
  wire [(2'h2):(1'h0)] wire71;
  wire signed [(5'h13):(1'h0)] wire64;
  reg signed [(5'h15):(1'h0)] reg96 = (1'h0);
  reg [(3'h6):(1'h0)] reg95 = (1'h0);
  reg [(5'h12):(1'h0)] reg94 = (1'h0);
  reg [(3'h4):(1'h0)] reg93 = (1'h0);
  reg signed [(4'he):(1'h0)] reg92 = (1'h0);
  reg [(5'h15):(1'h0)] reg91 = (1'h0);
  reg [(4'ha):(1'h0)] reg90 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg88 = (1'h0);
  reg [(4'he):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg86 = (1'h0);
  reg [(5'h13):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg83 = (1'h0);
  reg [(3'h6):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg81 = (1'h0);
  reg [(5'h14):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg79 = (1'h0);
  reg [(3'h5):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg77 = (1'h0);
  reg [(4'ha):(1'h0)] reg76 = (1'h0);
  reg [(2'h3):(1'h0)] reg75 = (1'h0);
  reg [(4'he):(1'h0)] reg70 = (1'h0);
  reg [(5'h11):(1'h0)] reg69 = (1'h0);
  reg [(4'ha):(1'h0)] reg68 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg66 = (1'h0);
  assign y = {wire98,
                 wire97,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire64,
                 reg96,
                 reg95,
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
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 (1'h0)};
  module4 #() modinst65 (.wire8(wire1), .wire7(wire3), .wire6(wire2), .wire5(wire0), .clk(clk), .y(wire64));
  always
    @(posedge clk) begin
      reg66 <= wire0[(3'h4):(2'h3)];
      reg67 <= (((wire2[(5'h11):(1'h0)] ?
                  {(wire2 >= wire2), $signed(wire3)} : (((8'hab) >>> reg66) ?
                      (+(8'ha1)) : (+wire1))) ?
              $signed(wire64) : reg66[(3'h5):(2'h3)]) ?
          wire3 : (8'ha8));
      reg68 <= ($signed({$unsigned({wire3, (8'hb0)})}) ?
          $unsigned($signed(wire64[(2'h2):(1'h0)])) : (8'hb6));
      reg69 <= wire64[(1'h1):(1'h1)];
      reg70 <= (~|wire3);
    end
  assign wire71 = $unsigned({wire2, {$signed({reg70, wire0})}});
  assign wire72 = ($unsigned((8'hbe)) || ((($signed(wire1) ^~ (&(8'hba))) ?
                          $signed((reg68 & wire71)) : (wire3 & (reg66 | (8'ha4)))) ?
                      $signed({$signed(reg66)}) : (&wire3[(2'h2):(2'h2)])));
  assign wire73 = {{($signed($signed(wire64)) ?
                              (8'had) : ($signed((8'ha9)) ? wire64 : reg70))},
                      $signed((wire64[(4'hd):(3'h4)] || ((wire2 ?
                          reg69 : wire3) << {(8'ha7), reg69})))};
  assign wire74 = (~(^wire3));
  always
    @(posedge clk) begin
      reg75 <= (reg69 ?
          $unsigned(($unsigned($signed(wire64)) > (^$signed(reg68)))) : (^~wire72[(4'h8):(3'h7)]));
      reg76 <= reg68;
      if ((~(|$unsigned($signed(wire3[(2'h3):(1'h1)])))))
        begin
          reg77 <= $signed(reg70[(4'he):(2'h2)]);
          reg78 <= ((wire3 <<< ((!(reg70 || wire0)) | wire0[(5'h10):(3'h6)])) ?
              $unsigned(((wire0[(5'h10):(4'hc)] ^ {reg70,
                  wire73}) <= (~&$unsigned((8'hb6))))) : ($signed((^$signed(reg66))) << (wire1[(1'h1):(1'h0)] ?
                  wire1[(4'hf):(3'h7)] : reg75[(2'h2):(2'h2)])));
          reg79 <= wire0;
          reg80 <= wire3[(1'h1):(1'h0)];
          reg81 <= $signed({(~reg66), $signed($signed($signed((8'hb5))))});
        end
      else
        begin
          reg77 <= $unsigned(wire0[(1'h0):(1'h0)]);
          reg78 <= $signed($signed($signed(reg79[(4'h8):(3'h7)])));
          if (((8'hae) < $unsigned({wire72[(3'h5):(3'h5)],
              reg78[(1'h1):(1'h1)]})))
            begin
              reg79 <= ($unsigned(($unsigned(reg78) >> ($signed(wire72) ?
                      (wire73 >> wire0) : reg67))) ?
                  (&$unsigned(reg81[(1'h1):(1'h1)])) : wire71[(1'h0):(1'h0)]);
              reg80 <= $signed($unsigned(($unsigned(reg81) >= $unsigned(reg75[(2'h3):(2'h3)]))));
              reg81 <= (^~$signed(($unsigned((reg76 <= reg70)) ?
                  (reg68 ? {wire3} : wire3) : (!wire1))));
              reg82 <= wire74[(4'he):(4'hc)];
              reg83 <= wire64[(4'hf):(1'h0)];
            end
          else
            begin
              reg79 <= (!((reg70 ?
                      ($unsigned(wire0) ? wire74 : $signed(wire71)) : (8'hb8)) ?
                  (|wire73[(3'h7):(3'h5)]) : {wire3[(3'h6):(3'h4)]}));
              reg80 <= wire64[(5'h10):(2'h2)];
            end
        end
      if (wire1[(4'h8):(1'h1)])
        begin
          reg84 <= ($signed(($signed((reg67 ?
              wire73 : (8'haa))) + (!$unsigned(wire2)))) * (~&$unsigned($unsigned((7'h41)))));
          reg85 <= (((^~($signed(reg67) ? $signed((8'h9e)) : (-reg77))) ?
              (((reg76 ? wire2 : reg81) ?
                  {wire0,
                      reg70} : (8'h9f)) <= reg75[(1'h0):(1'h0)]) : $signed(wire71)) || (^({((8'hb9) * wire71),
              reg82} != ($unsigned((8'h9c)) ?
              wire3[(3'h4):(3'h4)] : ((8'hb5) ? reg79 : wire1)))));
        end
      else
        begin
          if (reg67)
            begin
              reg84 <= $unsigned(((8'h9c) < {{reg83[(4'he):(1'h1)], wire2},
                  $unsigned($signed(reg85))}));
              reg85 <= (((reg75[(2'h3):(2'h2)] + $signed((reg80 ^ wire64))) * $signed((8'ha6))) ?
                  $unsigned(((wire0[(2'h2):(1'h0)] * $signed(wire74)) ?
                      wire74 : (+$unsigned(reg77)))) : $signed(reg67[(1'h0):(1'h0)]));
              reg86 <= reg68;
            end
          else
            begin
              reg84 <= ($unsigned($unsigned((|(^~(8'ha1))))) >= $unsigned($unsigned(reg81)));
              reg85 <= {{$unsigned(wire1),
                      ($unsigned((reg84 ? (8'hb8) : reg84)) ?
                          $unsigned((wire64 << (8'haa))) : (~((8'hb6) * (8'hbb))))},
                  reg70};
              reg86 <= $signed($unsigned({reg69}));
              reg87 <= $unsigned(($unsigned(($signed(wire1) ?
                  ((8'hb8) || wire64) : (reg80 ? reg79 : (7'h43)))) > reg69));
            end
          reg88 <= reg84[(5'h11):(4'hc)];
          if (((^~wire74) ?
              (reg76 <= $unsigned(reg81)) : (({(wire72 ?
                      reg81 : reg87)} & ((8'hb7) ?
                  ((7'h43) ?
                      reg84 : reg78) : reg79[(5'h11):(2'h2)])) < (reg80[(4'hc):(4'h8)] ?
                  ((^wire2) ^~ $signed(reg83)) : reg70[(2'h2):(1'h0)]))))
            begin
              reg89 <= (+reg76);
            end
          else
            begin
              reg89 <= (~&(~$unsigned(((reg67 <<< wire74) != reg78))));
            end
          if (((~&{(-$unsigned((7'h41))),
              ($unsigned(reg84) <<< {(8'ha8), (8'hbe)})}) <= {(({wire1} ?
                  (~reg81) : wire0[(3'h6):(1'h0)]) >>> reg89[(2'h2):(1'h0)]),
              {$unsigned(wire74), $unsigned(reg83)}}))
            begin
              reg90 <= ($signed($signed((!(+(8'hb6))))) ?
                  ($unsigned($signed(reg68[(2'h2):(1'h0)])) ?
                      (^$signed((^wire71))) : $signed((~^reg75))) : reg89[(1'h0):(1'h0)]);
              reg91 <= (reg69 ?
                  $signed(($unsigned($unsigned(reg83)) < reg82[(3'h5):(3'h5)])) : $unsigned((wire71 ?
                      (-$signed(reg80)) : wire73)));
              reg92 <= reg86;
            end
          else
            begin
              reg90 <= (reg79[(3'h7):(2'h3)] && (wire74 ?
                  $unsigned({(^reg70), reg86[(5'h15):(4'h9)]}) : (((reg91 ?
                              wire73 : reg82) ?
                          wire0[(5'h11):(1'h0)] : {reg76}) ?
                      ((^~reg88) & (8'hb2)) : ({reg68, wire64} ?
                          reg92[(4'ha):(2'h2)] : reg67))));
              reg91 <= (reg70 ?
                  ((+(~^(reg78 >> reg66))) <<< ($signed($signed(reg70)) ?
                      wire3[(1'h0):(1'h0)] : reg67[(2'h2):(1'h0)])) : (^~(!(8'hab))));
              reg92 <= reg79;
              reg93 <= $unsigned({wire72});
              reg94 <= (~(~{((wire2 ? reg89 : wire74) >= $signed(reg70)),
                  $signed((reg90 ? wire1 : (8'hb3)))}));
            end
          reg95 <= (&$unsigned(((reg66[(5'h11):(2'h2)] ?
              (wire72 ?
                  reg87 : (8'hb6)) : $signed(reg68)) >>> $signed($unsigned(reg66)))));
        end
      reg96 <= reg86[(3'h7):(3'h4)];
    end
  assign wire97 = (wire64 << (&$signed(reg84)));
  assign wire98 = $signed($unsigned($signed($signed((^wire71)))));
endmodule

module module4
#(parameter param62 = {(((((8'hb3) ? (8'h9f) : (8'ha2)) > {(8'hab), (8'ha3)}) ? ((-(8'h9d)) ? (8'hb7) : ((8'hb6) ~^ (8'ha0))) : ({(8'hb9)} ? {(8'hbd), (8'hbe)} : ((7'h40) ^ (7'h42)))) ? (((8'hb8) ? ((8'ha3) || (8'hb4)) : (8'ha4)) <<< (!(7'h40))) : ((^~((8'hb3) ? (8'hb3) : (7'h42))) << (^~((7'h40) ? (8'ha4) : (7'h43))))), (8'hbb)}, 
parameter param63 = (param62 ? ((((+param62) ? (param62 | param62) : ((8'h9f) ? param62 : param62)) * ((+param62) - ((7'h42) ? param62 : param62))) ? (param62 ^~ param62) : param62) : ((({param62, param62} <= (param62 ? param62 : param62)) ? ((~&param62) & (param62 > param62)) : (param62 ? param62 : (8'hb1))) > (~param62))))
(y, clk, wire5, wire6, wire7, wire8);
  output wire [(32'h203):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire5;
  input wire [(2'h2):(1'h0)] wire6;
  input wire [(3'h6):(1'h0)] wire7;
  input wire [(5'h11):(1'h0)] wire8;
  wire [(3'h4):(1'h0)] wire61;
  wire [(3'h6):(1'h0)] wire11;
  wire signed [(2'h2):(1'h0)] wire12;
  wire signed [(3'h6):(1'h0)] wire13;
  wire signed [(4'hf):(1'h0)] wire16;
  wire signed [(5'h15):(1'h0)] wire17;
  wire [(5'h10):(1'h0)] wire18;
  wire [(4'hc):(1'h0)] wire19;
  wire [(5'h15):(1'h0)] wire44;
  wire signed [(2'h3):(1'h0)] wire45;
  wire [(5'h14):(1'h0)] wire46;
  wire signed [(5'h15):(1'h0)] wire59;
  reg [(4'hb):(1'h0)] reg43 = (1'h0);
  reg [(4'hc):(1'h0)] reg42 = (1'h0);
  reg [(3'h7):(1'h0)] reg41 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg39 = (1'h0);
  reg [(4'h9):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg37 = (1'h0);
  reg [(5'h10):(1'h0)] reg36 = (1'h0);
  reg [(4'ha):(1'h0)] reg35 = (1'h0);
  reg [(4'hc):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg33 = (1'h0);
  reg [(5'h14):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg30 = (1'h0);
  reg [(4'hb):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg28 = (1'h0);
  reg [(4'h9):(1'h0)] reg27 = (1'h0);
  reg [(4'he):(1'h0)] reg26 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg25 = (1'h0);
  reg [(5'h12):(1'h0)] reg24 = (1'h0);
  reg [(5'h12):(1'h0)] reg23 = (1'h0);
  reg [(4'hc):(1'h0)] reg22 = (1'h0);
  reg [(4'h9):(1'h0)] reg21 = (1'h0);
  reg [(5'h14):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg15 = (1'h0);
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  reg [(4'h9):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg9 = (1'h0);
  assign y = {wire61,
                 wire11,
                 wire12,
                 wire13,
                 wire16,
                 wire17,
                 wire18,
                 wire19,
                 wire44,
                 wire45,
                 wire46,
                 wire59,
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
                 reg15,
                 reg14,
                 reg10,
                 reg9,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg9 <= wire6;
      reg10 <= reg9[(4'hd):(2'h2)];
    end
  assign wire11 = (wire6[(2'h2):(2'h2)] == reg9);
  assign wire12 = ((!wire6) >>> $signed(((+((8'hba) >> reg9)) ?
                      (8'had) : ($signed(wire11) ? wire6 : $signed((7'h42))))));
  assign wire13 = wire8[(3'h5):(3'h5)];
  always
    @(posedge clk) begin
      reg14 <= wire11[(1'h0):(1'h0)];
      reg15 <= ({(~&((reg10 << reg10) ?
              $signed(reg10) : (wire8 ? wire7 : wire11))),
          reg14} ~^ reg10);
    end
  assign wire16 = $signed($signed((wire7 ^ $signed((~&reg9)))));
  assign wire17 = ($signed($unsigned(wire12)) < ($signed(wire6) ?
                      ({(8'haa)} == {wire13}) : $signed((~|wire7[(2'h3):(2'h3)]))));
  assign wire18 = wire13[(1'h0):(1'h0)];
  assign wire19 = (-reg10[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg20 <= wire16[(1'h1):(1'h0)];
      if (({$unsigned(wire18[(5'h10):(3'h5)]),
          (8'ha8)} | ((~reg9[(5'h14):(5'h10)]) ?
          (wire7[(3'h6):(3'h4)] ?
              ($signed(wire8) ?
                  ((8'ha3) ?
                      wire8 : reg20) : (8'hbe)) : wire17) : $signed(reg10))))
        begin
          if ($signed((-$signed(wire18))))
            begin
              reg21 <= (8'ha7);
              reg22 <= (({$signed($signed(wire7))} ?
                  (wire13 ?
                      ((-reg15) == {wire8,
                          wire5}) : reg21[(3'h4):(1'h1)]) : (^~$unsigned($signed((8'hb9))))) * wire11);
              reg23 <= wire5;
            end
          else
            begin
              reg21 <= $signed($signed((&wire17)));
              reg22 <= $signed(({(~^wire16),
                  {$signed(wire19)}} != {(wire6 > $unsigned((8'hb5))),
                  $unsigned(((8'ha0) == reg23))}));
              reg23 <= ($unsigned(wire11) ?
                  ((($signed(reg23) ?
                          wire13[(2'h2):(1'h1)] : $unsigned((8'ha8))) ?
                      (^~(reg20 ?
                          wire7 : reg10)) : $unsigned(wire12[(2'h2):(2'h2)])) | $unsigned({(wire7 ?
                          (8'hba) : wire17),
                      (reg20 ? wire8 : wire12)})) : (^~(((wire7 ?
                      (8'hb5) : wire5) >= (wire13 ?
                      reg14 : wire6)) - wire13[(3'h6):(3'h5)])));
              reg24 <= $unsigned({$unsigned($unsigned((~(8'ha3)))),
                  ($signed((wire7 >> (8'haa))) ?
                      wire12 : $signed($signed(reg10)))});
            end
          reg25 <= $unsigned(reg23[(3'h7):(3'h7)]);
          reg26 <= (8'ha4);
          reg27 <= {((!reg21[(3'h7):(1'h1)]) ?
                  (^~wire5[(3'h5):(2'h2)]) : (-wire7))};
          reg28 <= (8'ha6);
        end
      else
        begin
          if ($unsigned(reg26))
            begin
              reg21 <= (reg22 ?
                  {$unsigned((wire5 + {(8'hb3),
                          wire12}))} : wire16[(3'h6):(2'h2)]);
              reg22 <= (wire6[(1'h1):(1'h0)] < (~|(wire18[(4'hf):(3'h7)] >>> (reg25[(3'h5):(3'h4)] && (reg24 >= wire6)))));
              reg23 <= {reg22[(4'hc):(1'h1)]};
              reg24 <= (((~^wire11) ?
                  wire12 : reg22[(2'h3):(2'h3)]) == (8'ha9));
            end
          else
            begin
              reg21 <= reg20[(4'hb):(2'h3)];
            end
          reg25 <= (|((reg24 & ($unsigned((8'hb8)) & $signed(wire6))) ?
              $signed({(~&wire13),
                  {reg28, wire17}}) : $signed(wire7[(3'h6):(1'h0)])));
        end
    end
  always
    @(posedge clk) begin
      reg29 <= ((reg27 ? (~|(|reg9)) : {$signed(reg23[(1'h1):(1'h0)])}) ?
          reg14 : ((wire5[(2'h2):(1'h1)] ?
                  ($signed(reg10) << ((8'ha3) | wire16)) : ((wire5 < (8'hae)) ?
                      {(8'ha0)} : reg27)) ?
              ((wire5 || wire12) < $signed(reg14[(3'h7):(2'h3)])) : $signed($signed((wire12 * reg26)))));
      reg30 <= (!((+(reg25 && wire11)) || $signed(({reg22,
          reg14} == $signed(reg28)))));
      reg31 <= $signed({(($signed(reg9) > (reg25 ? wire17 : reg24)) ^~ reg15)});
      if ((wire6[(1'h1):(1'h1)] ?
          {$signed($signed(reg14[(3'h4):(1'h0)]))} : wire8))
        begin
          if ((~^($signed((~^$unsigned(wire6))) ?
              $unsigned($signed((wire16 ?
                  reg10 : reg9))) : (&$signed($signed(reg22))))))
            begin
              reg32 <= reg9[(4'hc):(2'h3)];
              reg33 <= (^~$unsigned(reg25));
            end
          else
            begin
              reg32 <= ($signed({$unsigned((wire12 ?
                      reg23 : wire17))}) <= ((!{reg10,
                  reg15[(4'hb):(1'h1)]}) < (wire5 ?
                  $signed($unsigned(wire13)) : (^$signed(wire17)))));
              reg33 <= $signed((wire17[(3'h4):(3'h4)] ?
                  (reg20[(4'ha):(4'h8)] != wire16[(3'h6):(1'h0)]) : reg14[(3'h7):(1'h1)]));
              reg34 <= $signed($signed((~reg31)));
              reg35 <= reg29;
            end
          reg36 <= (~&($signed(reg31) ^ reg23));
        end
      else
        begin
          if ($unsigned(((reg29 ?
                  $unsigned(wire5[(2'h2):(1'h1)]) : (!{reg21, wire18})) ?
              wire13[(3'h5):(3'h4)] : wire6[(1'h1):(1'h1)])))
            begin
              reg32 <= ((reg14[(3'h5):(1'h1)] >> $unsigned((reg28[(3'h6):(3'h5)] ?
                      reg27 : reg20[(4'ha):(3'h4)]))) ?
                  (+$signed(($unsigned(wire11) ?
                      wire6 : (reg27 == wire13)))) : (~|$unsigned(wire18[(3'h6):(2'h2)])));
              reg33 <= (8'h9d);
            end
          else
            begin
              reg32 <= $unsigned($signed($unsigned({$signed(reg20),
                  (wire17 ^~ reg15)})));
              reg33 <= (!(wire13 ?
                  $signed({$unsigned(reg35)}) : $signed($signed($signed(reg32)))));
              reg34 <= wire6[(1'h0):(1'h0)];
            end
          reg35 <= (-((reg23[(2'h2):(2'h2)] ?
                  (reg35 ?
                      reg22[(2'h3):(2'h2)] : $signed(reg28)) : $signed($unsigned(wire8))) ?
              ({(reg24 & wire8)} ^~ (8'hb1)) : wire7[(1'h0):(1'h0)]));
          reg36 <= $unsigned(((((~|reg27) << wire16) ?
              wire16[(1'h0):(1'h0)] : (reg10[(3'h4):(2'h2)] == wire5[(2'h3):(2'h3)])) == $signed((8'hb5))));
          reg37 <= (($signed((reg29 <<< (~reg36))) << $signed(($signed(wire8) ?
                  ((8'had) >= reg10) : wire19))) ?
              $signed((|reg35)) : wire16);
        end
      if ($unsigned({(~|(~&(reg28 - reg37)))}))
        begin
          if ($signed(wire7[(1'h0):(1'h0)]))
            begin
              reg38 <= wire5[(2'h2):(1'h0)];
              reg39 <= ((wire12 ^~ reg14) == $unsigned((^~((+reg38) == (~^reg31)))));
            end
          else
            begin
              reg38 <= wire8[(3'h7):(1'h1)];
              reg39 <= (^reg23[(4'h9):(1'h0)]);
              reg40 <= (reg34 ?
                  ((((7'h41) ? $signed((8'hb6)) : (reg31 && (8'ha3))) ?
                          $signed(reg24[(5'h12):(4'hb)]) : (&(wire6 ?
                              reg38 : reg26))) ?
                      $unsigned((reg25[(3'h6):(2'h2)] >>> (wire8 ?
                          reg26 : wire13))) : $unsigned(wire18)) : reg22[(3'h7):(2'h3)]);
              reg41 <= reg21[(4'h9):(3'h7)];
            end
          if ((($unsigned(reg32) && {(^$signed(wire8)),
                  $unsigned(((8'hb2) < (8'haa)))}) ?
              $unsigned($unsigned((reg31[(3'h5):(3'h4)] || $signed(reg38)))) : reg30))
            begin
              reg42 <= $signed({reg9});
              reg43 <= (reg31 + (wire18 ?
                  $unsigned((&(~|(7'h40)))) : $signed(wire17[(4'hd):(4'hd)])));
            end
          else
            begin
              reg42 <= $unsigned(((~&($unsigned(reg42) ?
                      $signed(reg43) : wire19[(4'h8):(1'h1)])) ?
                  reg28 : (wire13 ? {reg37} : $unsigned($unsigned(reg40)))));
            end
        end
      else
        begin
          reg38 <= wire13;
          if (wire13[(3'h6):(3'h4)])
            begin
              reg39 <= $unsigned(reg22);
              reg40 <= $unsigned(({wire7} ?
                  (reg20[(5'h12):(3'h5)] ?
                      reg24 : (~|(reg27 ? reg40 : reg27))) : reg33));
              reg41 <= ((reg22 ? (8'hb4) : reg34[(3'h4):(1'h0)]) ?
                  (~^reg39[(3'h7):(2'h2)]) : $signed($signed((-(reg31 ?
                      (8'hbb) : reg30)))));
              reg42 <= wire13[(2'h2):(1'h1)];
            end
          else
            begin
              reg39 <= (~^$unsigned($unsigned($signed((wire5 ?
                  reg20 : reg42)))));
              reg40 <= reg31[(4'h9):(2'h3)];
              reg41 <= $unsigned($unsigned(((~|(~^reg29)) ?
                  $signed(reg40) : ($signed(wire12) ?
                      reg31[(3'h6):(3'h6)] : $signed(reg35)))));
              reg42 <= ($signed(wire7) ?
                  reg42 : $unsigned($signed((wire17[(4'he):(3'h5)] ^~ wire19))));
              reg43 <= $signed(reg35[(4'ha):(1'h0)]);
            end
        end
    end
  assign wire44 = (reg37[(2'h2):(2'h2)] ?
                      ((reg38[(4'h9):(2'h2)] >> ($unsigned(reg24) << (reg10 ?
                          reg23 : reg40))) + ($unsigned(reg38[(3'h6):(3'h4)]) >= (-reg29))) : (^~reg39[(3'h7):(3'h6)]));
  assign wire45 = reg22[(4'ha):(1'h0)];
  assign wire46 = reg33;
  module47 #() modinst60 (.wire52(reg10), .wire48(wire8), .wire51(reg23), .y(wire59), .wire50(reg25), .clk(clk), .wire49(reg14));
  assign wire61 = $unsigned({reg9, $signed(reg39)});
endmodule

module module47
#(parameter param58 = (-(((8'h9f) - (((8'hb6) | (8'ha5)) >>> ((8'ha0) >>> (7'h40)))) ? ((((8'hbd) - (8'hab)) ? ((8'hab) ? (8'hbb) : (8'hae)) : ((8'hbf) <= (7'h43))) ? {(^~(8'ha2))} : (|((8'ha9) < (8'hbd)))) : ((~&((7'h40) || (8'hb0))) ? (((8'ha1) ? (8'haa) : (8'hbb)) ? {(8'ha1)} : ((8'h9f) ? (8'had) : (8'h9c))) : (7'h42)))))
(y, clk, wire52, wire51, wire50, wire49, wire48);
  output wire [(32'h36):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire52;
  input wire signed [(5'h12):(1'h0)] wire51;
  input wire signed [(4'ha):(1'h0)] wire50;
  input wire [(4'hf):(1'h0)] wire49;
  input wire [(4'hf):(1'h0)] wire48;
  wire [(5'h12):(1'h0)] wire57;
  wire [(3'h7):(1'h0)] wire56;
  wire [(4'hd):(1'h0)] wire55;
  wire [(2'h2):(1'h0)] wire54;
  wire [(4'hd):(1'h0)] wire53;
  assign y = {wire57, wire56, wire55, wire54, wire53, (1'h0)};
  assign wire53 = $unsigned({{wire49}});
  assign wire54 = (wire49 ?
                      (wire51[(5'h11):(4'ha)] << {wire49,
                          $unsigned(wire48[(4'hd):(2'h2)])}) : (+{{{wire49,
                                  (8'hb6)}}}));
  assign wire55 = ($unsigned($unsigned((wire50 ?
                          (^wire50) : $signed((8'h9e))))) ?
                      $signed(($unsigned((wire49 ^~ wire49)) ?
                          ((|wire50) & (wire48 ^ wire54)) : ($signed(wire48) ?
                              ((8'hb5) ^ wire50) : (^~wire50)))) : ($unsigned($unsigned($signed((8'hbc)))) ~^ $unsigned(wire53[(4'h8):(1'h1)])));
  assign wire56 = (8'hbb);
  assign wire57 = (~|$unsigned((8'ha9)));
endmodule
