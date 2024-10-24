module top
#(parameter param103 = (~|(~^(+({(8'ha4)} ? (^(8'ha4)) : ((7'h42) ? (8'ha2) : (8'hbb)))))), 
parameter param104 = (((({param103} ? (~&param103) : (param103 <<< param103)) ? ((param103 ? param103 : param103) ? (param103 ^ param103) : (param103 >> param103)) : ({param103, param103} ? (~&param103) : (param103 ^ param103))) - param103) ? ((|(~^(param103 ? param103 : param103))) ? (^~{{param103, param103}}) : (!(!{(8'h9e), param103}))) : ((~|(!(param103 ? param103 : param103))) + ((8'hab) ? (!(!param103)) : param103))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'he9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire [(4'hb):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire4;
  wire [(5'h15):(1'h0)] wire102;
  wire signed [(4'h9):(1'h0)] wire98;
  wire signed [(3'h5):(1'h0)] wire97;
  wire [(2'h3):(1'h0)] wire96;
  wire signed [(4'hd):(1'h0)] wire95;
  wire [(4'h8):(1'h0)] wire94;
  wire signed [(4'hc):(1'h0)] wire93;
  wire [(2'h2):(1'h0)] wire92;
  wire [(4'hc):(1'h0)] wire91;
  wire [(5'h10):(1'h0)] wire87;
  wire signed [(5'h14):(1'h0)] wire86;
  wire signed [(4'ha):(1'h0)] wire85;
  wire signed [(5'h11):(1'h0)] wire84;
  wire [(2'h3):(1'h0)] wire83;
  wire signed [(4'hc):(1'h0)] wire5;
  wire signed [(4'h8):(1'h0)] wire81;
  reg signed [(3'h7):(1'h0)] reg101 = (1'h0);
  reg signed [(4'he):(1'h0)] reg100 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg99 = (1'h0);
  reg [(4'ha):(1'h0)] reg90 = (1'h0);
  reg [(4'he):(1'h0)] reg89 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg88 = (1'h0);
  assign y = {wire102,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire92,
                 wire91,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire5,
                 wire81,
                 reg101,
                 reg100,
                 reg99,
                 reg90,
                 reg89,
                 reg88,
                 (1'h0)};
  assign wire5 = wire1;
  module6 #() modinst82 (wire81, clk, wire1, wire4, wire5, wire3, wire0);
  assign wire83 = $unsigned(wire3);
  assign wire84 = (wire5 <= wire0[(4'h9):(1'h1)]);
  assign wire85 = (wire0 < wire2);
  assign wire86 = wire83;
  assign wire87 = ((wire83[(1'h0):(1'h0)] <= wire3[(3'h4):(2'h3)]) <<< (!$signed((wire3[(1'h0):(1'h0)] ?
                      wire5 : wire5[(3'h7):(2'h2)]))));
  always
    @(posedge clk) begin
      reg88 <= $unsigned((!wire5[(4'ha):(3'h7)]));
      reg89 <= {(+$unsigned($unsigned(((7'h41) ? wire0 : wire86))))};
      reg90 <= wire1[(4'hd):(4'h8)];
    end
  assign wire91 = $signed(wire1);
  assign wire92 = wire2[(3'h7):(2'h2)];
  assign wire93 = {{$unsigned((~&(reg90 ? wire3 : wire84)))},
                      ($signed(wire91) ?
                          (~^(reg88[(2'h3):(1'h1)] >= $unsigned(wire85))) : {(~&wire84[(4'hf):(2'h3)]),
                              $signed($signed(wire81))})};
  assign wire94 = ($signed($unsigned((!(wire0 << wire3)))) ?
                      $signed({$signed($unsigned(wire5))}) : ((($signed(wire92) || $unsigned(wire81)) ?
                          ((wire83 >>> reg89) ?
                              wire92 : (wire1 ?
                                  wire3 : wire4)) : $signed((wire83 ?
                              wire81 : wire81))) + wire92));
  assign wire95 = (($unsigned(wire91[(4'h8):(3'h7)]) ^ ((((8'ha5) ?
                              reg88 : wire87) ?
                          ((8'hb5) ?
                              wire3 : wire87) : (8'hbc)) <<< (~|wire5))) ?
                      $unsigned({$signed((wire1 & wire1))}) : wire87[(4'hf):(4'h8)]);
  assign wire96 = {(+(((~&reg90) && (wire1 & wire87)) ?
                          (-$unsigned(wire91)) : wire92[(2'h2):(2'h2)])),
                      (($unsigned(((7'h41) ?
                              wire84 : (8'hb9))) | (wire95[(2'h3):(1'h0)] ?
                              (reg90 ? (8'hb7) : wire81) : $signed(wire83))) ?
                          $unsigned((wire85[(3'h6):(3'h5)] ?
                              $signed(wire87) : (wire3 != wire5))) : $unsigned(wire87[(4'hd):(4'hd)]))};
  assign wire97 = (wire85[(4'h8):(3'h7)] && (~^$unsigned($unsigned($signed(wire93)))));
  assign wire98 = $signed(((wire86[(4'h8):(2'h3)] != (wire0[(4'h8):(3'h6)] ?
                      (+wire0) : {wire2})) && wire91[(3'h5):(3'h5)]));
  always
    @(posedge clk) begin
      reg99 <= wire2[(4'h8):(4'h8)];
      reg100 <= wire91[(3'h4):(1'h1)];
      reg101 <= $unsigned($unsigned((({(7'h42)} - (wire2 != wire86)) ?
          (8'hb1) : wire91[(3'h6):(2'h3)])));
    end
  assign wire102 = ((~|(^(wire5[(3'h6):(2'h3)] ?
                       (reg99 ?
                           reg99 : wire1) : (~^wire83)))) >> {(($unsigned(wire94) ?
                               $signed(wire85) : (wire94 ? wire95 : (8'ha0))) ?
                           (reg90 ?
                               (wire97 ?
                                   wire1 : wire85) : {(8'hb2)}) : ((&wire85) + $signed(reg99))),
                       (+reg99[(3'h7):(2'h3)])});
endmodule

module module6
#(parameter param80 = (+((-{(8'ha3), {(8'hba), (7'h43)}}) && (({(8'h9d), (8'haa)} ? (!(8'hb4)) : ((8'hba) ? (8'hb1) : (8'hb2))) ~^ {((8'hbd) ? (8'hae) : (8'hb4))}))))
(y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'hf1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire11;
  input wire signed [(4'h9):(1'h0)] wire10;
  input wire signed [(4'hc):(1'h0)] wire9;
  input wire [(4'ha):(1'h0)] wire8;
  input wire [(4'he):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire72;
  wire signed [(2'h3):(1'h0)] wire71;
  wire signed [(2'h2):(1'h0)] wire70;
  wire signed [(5'h15):(1'h0)] wire68;
  wire signed [(2'h2):(1'h0)] wire21;
  wire signed [(5'h13):(1'h0)] wire17;
  wire [(5'h13):(1'h0)] wire16;
  wire signed [(5'h13):(1'h0)] wire15;
  wire [(5'h11):(1'h0)] wire14;
  wire [(2'h2):(1'h0)] wire13;
  wire signed [(4'he):(1'h0)] wire12;
  reg signed [(3'h6):(1'h0)] reg79 = (1'h0);
  reg [(4'ha):(1'h0)] reg78 = (1'h0);
  reg [(4'hb):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg75 = (1'h0);
  reg [(3'h6):(1'h0)] reg74 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg73 = (1'h0);
  reg [(4'h9):(1'h0)] reg18 = (1'h0);
  reg [(5'h15):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg20 = (1'h0);
  assign y = {wire72,
                 wire71,
                 wire70,
                 wire68,
                 wire21,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg18,
                 reg19,
                 reg20,
                 (1'h0)};
  assign wire12 = wire10[(4'h8):(4'h8)];
  assign wire13 = wire11;
  assign wire14 = ({$unsigned(((~&wire12) ?
                          $signed(wire11) : wire10[(2'h2):(2'h2)]))} <= {wire11[(4'hb):(3'h5)]});
  assign wire15 = wire13;
  assign wire16 = {((!(((8'hb9) || wire9) ?
                          {wire15} : (~wire7))) >= (wire8[(2'h3):(1'h0)] * $signed($unsigned(wire9)))),
                      (((8'ha1) ?
                          $unsigned($unsigned(wire14)) : wire7[(1'h1):(1'h0)]) <= (~wire8))};
  assign wire17 = (wire9 < $signed(wire9[(4'hc):(4'h9)]));
  always
    @(posedge clk) begin
      if (wire7[(4'hd):(4'h8)])
        begin
          reg18 <= $signed({((wire9 ? (wire13 + wire13) : (wire7 << wire11)) ?
                  $signed($signed(wire17)) : $unsigned((~wire14)))});
        end
      else
        begin
          reg18 <= ($unsigned(wire13) ?
              $unsigned(wire10) : {wire14[(5'h10):(3'h7)]});
          if (wire11[(3'h5):(1'h0)])
            begin
              reg19 <= $signed({{$signed(wire15), (-$signed((8'hb0)))},
                  {$signed($signed(wire14))}});
              reg20 <= (~^($signed($signed((wire10 ? wire9 : wire12))) ?
                  (+wire10) : (!wire17)));
            end
          else
            begin
              reg19 <= $unsigned($signed({$signed((-reg20))}));
              reg20 <= {(&(reg20[(3'h4):(1'h1)] - {(wire16 < wire17),
                      (^wire15)}))};
            end
        end
    end
  assign wire21 = $unsigned(wire10);
  module22 #() modinst69 (wire68, clk, reg19, wire15, wire14, wire12, wire17);
  assign wire70 = $signed((wire11[(4'hc):(3'h6)] >= $unsigned((~$signed(wire16)))));
  assign wire71 = $signed($signed($unsigned(wire11[(3'h6):(3'h6)])));
  assign wire72 = $signed($unsigned((wire10 ?
                      $unsigned((~|wire71)) : $signed($signed((8'haf))))));
  always
    @(posedge clk) begin
      if ($unsigned(wire8))
        begin
          reg73 <= {wire9[(4'h8):(1'h0)], reg19};
          reg74 <= wire70[(2'h2):(1'h0)];
          if ((~((~^reg74) >= wire72)))
            begin
              reg75 <= wire11[(5'h11):(1'h1)];
            end
          else
            begin
              reg75 <= ($unsigned((wire70 ?
                  ($unsigned((8'hb2)) ^~ wire72) : wire68[(4'hd):(4'h8)])) + ((-$unsigned($unsigned((8'hba)))) >> $signed((&reg19[(3'h7):(2'h3)]))));
              reg76 <= {reg74[(3'h5):(1'h1)],
                  ({(wire71 ? wire16[(2'h2):(2'h2)] : $unsigned(reg75)),
                      $signed(reg19[(4'h8):(3'h6)])} > wire71)};
            end
        end
      else
        begin
          reg73 <= wire71;
        end
      reg77 <= ({(8'hb8)} >>> $signed(wire70));
      reg78 <= ((wire14 ?
          reg73 : $unsigned((reg75 ^ (reg75 >> wire10)))) + (wire12[(4'ha):(4'h8)] || $signed({(-(8'haf))})));
      reg79 <= reg77[(4'hb):(3'h4)];
    end
endmodule

module module22
#(parameter param67 = ((((~&(!(8'hba))) << {((8'h9d) >>> (8'ha5))}) ? (((~&(8'hb0)) ? ((8'hb9) ? (8'hbc) : (8'hb5)) : {(8'ha7), (8'ha7)}) && {((8'ha3) ? (8'ha0) : (8'hac))}) : ((~&((8'hb9) + (8'hb8))) ? (((8'h9d) == (8'hb1)) <<< {(8'ha8)}) : (~&((8'h9e) ? (8'hba) : (8'ha6))))) ? ((^~({(8'hb8)} ? ((8'ha9) > (8'ha6)) : ((8'ha0) ? (8'ha3) : (8'ha0)))) ? ((8'h9c) ^ (^(+(8'h9f)))) : ({((8'h9e) != (8'ha8))} + {((8'hac) ? (8'hbb) : (8'hba)), ((8'ha4) ? (8'haa) : (8'h9f))})) : (~|((((8'ha5) - (8'hbe)) > (~^(8'haa))) ? (((8'h9c) ? (8'hac) : (7'h43)) << (-(8'hb7))) : ((8'h9c) >>> (~|(8'hb4)))))))
(y, clk, wire27, wire26, wire25, wire24, wire23);
  output wire [(32'h1eb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire27;
  input wire [(5'h13):(1'h0)] wire26;
  input wire signed [(4'hb):(1'h0)] wire25;
  input wire [(4'he):(1'h0)] wire24;
  input wire signed [(5'h13):(1'h0)] wire23;
  wire signed [(5'h13):(1'h0)] wire66;
  wire [(5'h10):(1'h0)] wire62;
  wire [(5'h15):(1'h0)] wire61;
  wire [(3'h7):(1'h0)] wire60;
  wire [(5'h10):(1'h0)] wire59;
  wire signed [(4'hd):(1'h0)] wire52;
  wire [(2'h3):(1'h0)] wire48;
  wire [(2'h3):(1'h0)] wire47;
  wire signed [(5'h12):(1'h0)] wire46;
  wire [(5'h14):(1'h0)] wire45;
  wire [(2'h3):(1'h0)] wire34;
  wire signed [(4'he):(1'h0)] wire33;
  wire [(5'h14):(1'h0)] wire32;
  wire [(2'h3):(1'h0)] wire31;
  wire [(3'h4):(1'h0)] wire30;
  wire [(4'h8):(1'h0)] wire29;
  wire signed [(4'he):(1'h0)] wire28;
  reg [(4'h9):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg64 = (1'h0);
  reg [(4'hf):(1'h0)] reg63 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg58 = (1'h0);
  reg [(5'h12):(1'h0)] reg57 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg56 = (1'h0);
  reg [(5'h14):(1'h0)] reg55 = (1'h0);
  reg [(3'h6):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg53 = (1'h0);
  reg [(4'hf):(1'h0)] reg51 = (1'h0);
  reg [(5'h12):(1'h0)] reg50 = (1'h0);
  reg [(4'h8):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg41 = (1'h0);
  reg [(5'h12):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg39 = (1'h0);
  reg [(4'h9):(1'h0)] reg38 = (1'h0);
  reg [(3'h5):(1'h0)] reg37 = (1'h0);
  reg [(4'hb):(1'h0)] reg36 = (1'h0);
  reg [(4'hb):(1'h0)] reg35 = (1'h0);
  assign y = {wire66,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire52,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 reg65,
                 reg64,
                 reg63,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg51,
                 reg50,
                 reg49,
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
                 (1'h0)};
  assign wire28 = ((^~wire25) ? wire23 : (^$signed($signed((~|wire27)))));
  assign wire29 = (^~wire23);
  assign wire30 = $unsigned(($unsigned((wire27 > $unsigned(wire24))) ^~ (|(((8'ha2) ?
                      wire27 : wire28) < $unsigned(wire24)))));
  assign wire31 = (!wire26);
  assign wire32 = ((^~(^$signed((wire30 + wire26)))) + $unsigned($unsigned(((wire31 == wire31) & wire27[(3'h5):(2'h2)]))));
  assign wire33 = $signed($signed(wire23[(1'h0):(1'h0)]));
  assign wire34 = wire31[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      reg35 <= ($signed((((wire23 || (8'ha3)) <= wire30) >> (8'hab))) ?
          wire24 : wire31);
      reg36 <= $signed($signed(((wire30[(2'h3):(2'h2)] <= $signed(wire26)) < (reg35 ?
          $unsigned(wire34) : wire25[(3'h7):(3'h4)]))));
      if ($unsigned(wire24[(3'h6):(2'h2)]))
        begin
          if ($unsigned((wire34[(1'h0):(1'h0)] ?
              (~((wire26 ?
                  wire34 : (8'ha5)) != $signed((7'h43)))) : $signed($unsigned($unsigned((8'hbb)))))))
            begin
              reg37 <= (&((((wire25 ? wire29 : (8'hb3)) >= (&wire33)) ?
                      wire32[(5'h12):(3'h6)] : wire27) ?
                  wire28 : $unsigned({wire27, (~^reg35)})));
            end
          else
            begin
              reg37 <= (wire23 ? (^~reg35) : wire33);
              reg38 <= wire33;
            end
          reg39 <= (($unsigned((wire23 ?
                  (~(8'hb3)) : $unsigned(wire34))) - reg38) ?
              ($unsigned($unsigned($signed(reg38))) ?
                  (({wire30} ? (wire30 >> wire30) : $unsigned(wire31)) ?
                      (wire28[(4'he):(4'h9)] ?
                          (~|wire28) : (wire33 < wire23)) : wire32) : $unsigned($unsigned($unsigned(reg35)))) : wire29[(3'h4):(2'h2)]);
          reg40 <= wire33;
        end
      else
        begin
          reg37 <= {wire30[(2'h3):(1'h1)]};
          reg38 <= $unsigned($signed(($signed($signed(wire26)) ?
              $signed({wire24, reg39}) : (^wire27))));
          reg39 <= $signed($unsigned(wire32));
          if ((wire26 ^~ (~|(wire31[(2'h3):(2'h3)] >= wire29[(3'h7):(1'h1)]))))
            begin
              reg40 <= $unsigned(wire25[(3'h7):(2'h3)]);
              reg41 <= (-(^(((wire27 || wire29) + (wire29 ? reg36 : wire24)) ?
                  {(wire26 ^ reg35)} : wire34[(1'h0):(1'h0)])));
            end
          else
            begin
              reg40 <= reg35;
            end
          reg42 <= $unsigned((8'h9c));
        end
      reg43 <= $unsigned($signed((reg35 ?
          {wire30[(2'h2):(2'h2)], reg41} : (!(wire25 << (8'ha9))))));
      reg44 <= $signed((8'h9d));
    end
  assign wire45 = $signed((wire23[(2'h2):(1'h1)] ?
                      (~$unsigned(reg37[(1'h1):(1'h1)])) : wire33[(2'h2):(2'h2)]));
  assign wire46 = {wire29,
                      ((wire26 ?
                          $unsigned((-reg44)) : wire28) + $signed(((wire29 <<< reg40) != (reg41 << reg41))))};
  assign wire47 = $unsigned(wire46[(3'h4):(1'h1)]);
  assign wire48 = ((reg35 * wire25) ?
                      $signed($unsigned(reg35)) : ({$signed((8'h9f))} & $unsigned(((reg40 ?
                              reg37 : wire32) ?
                          (reg44 ? wire27 : reg39) : $signed(wire23)))));
  always
    @(posedge clk) begin
      if (((($unsigned((^~wire45)) ^~ (~^$signed(reg43))) >= $unsigned(({wire27,
          (8'ha7)} > (reg43 >> wire23)))) ~^ wire28[(3'h4):(2'h2)]))
        begin
          reg49 <= $unsigned({wire32[(4'he):(3'h7)]});
        end
      else
        begin
          reg49 <= $signed($unsigned((8'hb7)));
          reg50 <= {{reg49[(3'h7):(3'h7)],
                  (((wire45 ? reg38 : wire31) ?
                          $signed((8'ha8)) : (reg35 >> wire28)) ?
                      (~&$unsigned(wire48)) : $unsigned($unsigned(reg43)))}};
        end
      reg51 <= $signed(({$signed((reg35 ? wire24 : wire25)),
          (reg49 ?
              $unsigned(wire47) : {reg42, wire30})} && {$signed({(8'hb7)})}));
    end
  assign wire52 = (-(8'ha2));
  always
    @(posedge clk) begin
      reg53 <= (~&((-((reg50 ?
          reg39 : (8'hb0)) <<< $signed(wire24))) + wire23[(3'h6):(2'h3)]));
      if ((-($unsigned((!wire26)) ?
          (^{$unsigned(wire47)}) : $unsigned(wire47[(2'h2):(2'h2)]))))
        begin
          reg54 <= $unsigned($unsigned(($signed(reg41[(4'hd):(4'hc)]) ~^ wire48)));
          reg55 <= (~|$unsigned((~^(^~$unsigned(wire52)))));
          reg56 <= (+{wire30});
          reg57 <= (wire46[(5'h10):(2'h2)] | wire31[(2'h2):(1'h1)]);
        end
      else
        begin
          reg54 <= wire31[(2'h3):(2'h2)];
          if (({$unsigned(reg38),
                  ($unsigned((reg41 ?
                      wire33 : reg51)) >= wire34[(2'h3):(2'h2)])} ?
              (wire48[(1'h0):(1'h0)] || (^~(reg53 ?
                  reg40 : (reg42 ? reg36 : wire34)))) : reg35))
            begin
              reg55 <= (reg50 >= $signed($signed(((wire33 ?
                  (8'ha7) : wire26) << {reg55}))));
            end
          else
            begin
              reg55 <= (reg36[(2'h2):(1'h1)] ?
                  {($unsigned((-wire24)) ? (-wire45[(3'h6):(3'h4)]) : wire25),
                      (-$unsigned((wire23 ?
                          (8'ha2) : reg54)))} : $signed(reg55[(3'h4):(1'h1)]));
              reg56 <= $signed(reg56[(4'ha):(1'h0)]);
              reg57 <= wire46;
            end
          reg58 <= $unsigned((&$signed(((reg49 < reg53) ?
              $signed(reg41) : $signed(wire30)))));
        end
    end
  assign wire59 = ($signed($signed($signed({reg42,
                      reg50}))) <<< {(~|$unsigned(reg44[(2'h3):(2'h2)])),
                      $signed((~&((8'h9d) - reg37)))});
  assign wire60 = ($unsigned($signed(wire30[(1'h0):(1'h0)])) ?
                      wire23 : $unsigned(wire45[(3'h7):(3'h5)]));
  assign wire61 = {$signed($signed((-$unsigned(reg35)))),
                      (!$unsigned((~|reg57)))};
  assign wire62 = ((^reg54[(1'h0):(1'h0)]) ?
                      (&(8'hb2)) : (-{$unsigned((reg55 ~^ (8'hbb)))}));
  always
    @(posedge clk) begin
      reg63 <= $unsigned((((~^{wire34, wire62}) ?
              (!$unsigned(wire61)) : {$unsigned(wire27)}) ?
          reg41 : $signed((~reg39))));
      reg64 <= {(~^wire48[(1'h0):(1'h0)]),
          {$unsigned($unsigned((8'haa))),
              {{(wire52 ? wire25 : reg55)}, (~$unsigned(reg51))}}};
      reg65 <= (~&((wire28 ? (+(7'h41)) : wire32) ?
          (((wire62 & reg39) & {reg38}) * reg40) : (~|{(wire31 | wire26),
              reg49[(3'h7):(1'h0)]})));
    end
  assign wire66 = (8'hbe);
endmodule
