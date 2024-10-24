module top
#(parameter param107 = {(~^{(!((8'h9f) >> (7'h42))), (^((8'hb0) >>> (8'ha3)))}), (((((8'hab) == (7'h41)) ? ((8'hb9) ? (8'hb9) : (8'haa)) : ((8'had) ? (8'hb3) : (8'ha6))) ? ((7'h42) ? (8'hb6) : ((7'h44) ^ (8'ha6))) : ((^~(8'ha5)) != ((8'hbc) ? (8'hb1) : (8'ha6)))) ? {(~^((8'ha4) ? (8'hbf) : (8'haf))), (^~((8'hbf) - (8'hb5)))} : ((((8'hb4) >= (8'hb7)) | {(8'hac)}) <= ({(8'hab)} - {(8'hb2)})))}, 
parameter param108 = (|((~(param107 ? (param107 & param107) : (param107 ~^ param107))) >> (((^~param107) ? (param107 ? (8'h9c) : param107) : ((8'hb0) ^ (8'h9d))) ? {{param107}, (param107 + param107)} : (^(param107 ? (7'h42) : param107))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hdd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire4;
  wire [(5'h12):(1'h0)] wire106;
  wire signed [(4'h8):(1'h0)] wire105;
  wire [(3'h4):(1'h0)] wire100;
  wire signed [(3'h6):(1'h0)] wire98;
  wire [(2'h3):(1'h0)] wire85;
  wire signed [(3'h5):(1'h0)] wire76;
  wire signed [(5'h15):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire17;
  wire signed [(5'h11):(1'h0)] wire74;
  reg [(4'hb):(1'h0)] reg104 = (1'h0);
  reg [(3'h5):(1'h0)] reg103 = (1'h0);
  reg [(5'h11):(1'h0)] reg102 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg101 = (1'h0);
  reg [(3'h4):(1'h0)] reg84 = (1'h0);
  reg [(5'h12):(1'h0)] reg83 = (1'h0);
  reg [(3'h5):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg81 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg79 = (1'h0);
  reg [(3'h6):(1'h0)] reg78 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg77 = (1'h0);
  assign y = {wire106,
                 wire105,
                 wire100,
                 wire98,
                 wire85,
                 wire76,
                 wire5,
                 wire6,
                 wire17,
                 wire74,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 (1'h0)};
  assign wire5 = $signed(wire2[(2'h2):(2'h2)]);
  assign wire6 = ($unsigned((8'ha8)) >> ($signed(wire2[(4'hf):(1'h0)]) == wire5[(4'hb):(3'h5)]));
  module7 #() modinst18 (wire17, clk, wire6, wire5, wire4, wire0);
  module19 #() modinst75 (wire74, clk, wire2, wire1, wire3, wire0, wire5);
  assign wire76 = (!(|((~&wire74) & $unsigned(((8'hb7) ^ wire3)))));
  always
    @(posedge clk) begin
      reg77 <= {$signed({(&(wire2 << wire3)), (^$signed(wire1))})};
      if ((&((&reg77[(1'h1):(1'h1)]) << $signed((+(wire5 ? wire1 : wire2))))))
        begin
          if (($signed((reg77[(1'h1):(1'h0)] << $signed($signed(wire0)))) ~^ ($unsigned($signed((wire74 ?
              wire74 : wire1))) & wire2)))
            begin
              reg78 <= wire1;
              reg79 <= ((~^(wire17 ~^ wire4)) ?
                  (8'ha8) : (!(({wire1, wire74} ?
                      (!reg77) : wire3[(4'ha):(3'h7)]) && $unsigned({wire76}))));
              reg80 <= (!wire4);
            end
          else
            begin
              reg78 <= $signed((|reg78[(1'h1):(1'h1)]));
              reg79 <= (reg77 & {$signed($unsigned((wire0 ?
                      (8'hbd) : wire17)))});
              reg80 <= (~|(8'h9d));
            end
        end
      else
        begin
          reg78 <= $signed((((~&(reg77 <<< wire6)) ?
              wire1[(4'he):(3'h7)] : $signed((wire3 ~^ wire74))) <= $unsigned($signed((reg77 ?
              reg78 : wire0)))));
          if ($signed((8'haa)))
            begin
              reg79 <= (8'h9c);
            end
          else
            begin
              reg79 <= $unsigned(((((-reg80) >> wire1[(2'h2):(1'h1)]) != $unsigned({wire1})) ?
                  (~^reg79[(4'hb):(3'h4)]) : (((^~wire1) ?
                      wire1 : reg77) & (8'ha5))));
              reg80 <= ({(((&wire6) & wire3[(1'h1):(1'h0)]) ?
                          wire74 : wire74[(4'ha):(3'h4)])} ?
                  ({$unsigned($unsigned(wire4))} ~^ {$signed(wire2),
                      wire2}) : ((~^($signed(wire6) ^~ $unsigned(reg79))) >>> ($unsigned($signed(wire17)) ?
                      $unsigned({reg79}) : (reg78[(1'h1):(1'h0)] << (8'hb0)))));
            end
          reg81 <= ((^~$unsigned(($unsigned(reg80) + wire76))) & wire17[(3'h5):(2'h2)]);
          reg82 <= (($unsigned((wire5 <<< (|(8'h9f)))) ?
                  (($unsigned(wire4) < (wire1 ? wire3 : wire6)) ?
                      (!((8'ha5) ?
                          wire6 : wire17)) : $signed(reg81[(1'h1):(1'h1)])) : (wire17 * wire1[(4'ha):(4'h8)])) ?
              (!wire0[(2'h3):(2'h2)]) : {$unsigned((^~$signed(wire2))),
                  reg79[(4'h9):(1'h1)]});
        end
      reg83 <= (!$unsigned($unsigned((wire0[(4'h8):(3'h5)] ?
          $unsigned(wire76) : $signed(wire17)))));
      reg84 <= {reg82[(3'h5):(1'h0)]};
    end
  assign wire85 = reg80;
  module86 #() modinst99 (.y(wire98), .wire88(reg80), .wire87(reg83), .wire89(wire6), .wire90(wire5), .clk(clk));
  assign wire100 = ($signed($unsigned((wire17 ?
                       (reg83 ?
                           wire1 : reg77) : wire74[(3'h7):(3'h6)]))) ^ $signed(({(8'hbc),
                           (!wire85)} ?
                       {$signed(reg78)} : (wire1 ^ (reg83 ? wire1 : wire6)))));
  always
    @(posedge clk) begin
      reg101 <= reg79[(3'h7):(1'h0)];
      reg102 <= $unsigned((8'hb0));
      reg103 <= (!$unsigned((&$signed({(8'hbf), reg102}))));
      reg104 <= (~|wire74[(3'h4):(2'h3)]);
    end
  assign wire105 = (-(8'hbd));
  assign wire106 = ($unsigned($unsigned(($unsigned(wire76) < {wire2}))) < ((~|{{wire3,
                           wire100}}) <= $unsigned(reg82)));
endmodule

module module86
#(parameter param96 = (~|(((((8'hbe) ~^ (8'ha0)) ? (~|(8'hb1)) : ((8'hbe) * (8'hbc))) * ((|(8'hb3)) > {(7'h44), (8'hba)})) ^~ {(((8'hb5) ? (8'had) : (8'ha2)) ? {(7'h44)} : (|(8'hbd))), (((8'h9e) ^~ (8'hb8)) > ((8'h9e) << (8'ha7)))})), 
parameter param97 = param96)
(y, clk, wire90, wire89, wire88, wire87);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire90;
  input wire signed [(3'h6):(1'h0)] wire89;
  input wire [(3'h4):(1'h0)] wire88;
  input wire signed [(4'ha):(1'h0)] wire87;
  wire [(3'h6):(1'h0)] wire95;
  wire signed [(3'h7):(1'h0)] wire94;
  wire signed [(5'h14):(1'h0)] wire93;
  wire [(4'he):(1'h0)] wire92;
  wire signed [(4'h9):(1'h0)] wire91;
  assign y = {wire95, wire94, wire93, wire92, wire91, (1'h0)};
  assign wire91 = $signed(((~&$signed((^wire90))) ?
                      (~|{wire88[(1'h0):(1'h0)],
                          (^~(8'hb1))}) : $signed(wire90[(3'h7):(2'h2)])));
  assign wire92 = $signed($unsigned($unsigned($unsigned($signed(wire91)))));
  assign wire93 = $signed((~{$unsigned($signed(wire88)),
                      ((-(8'ha5)) ?
                          $unsigned(wire89) : (wire89 ? wire92 : wire92))}));
  assign wire94 = $signed((~|$signed($unsigned((wire87 ? wire87 : wire91)))));
  assign wire95 = (7'h41);
endmodule

module module19
#(parameter param72 = ((((((8'ha6) ? (8'hb9) : (8'hb4)) ? (7'h40) : ((8'ha1) ? (8'hb2) : (8'ha0))) ? (((7'h44) ? (7'h41) : (8'ha8)) ? ((8'ha5) ? (7'h42) : (8'haa)) : {(8'hb9), (7'h41)}) : ({(8'ha3), (8'haf)} ? (^(8'hbc)) : (~&(8'haf)))) ? (~&((!(8'had)) < ((8'hb8) ? (8'haa) : (8'ha3)))) : ({(~^(8'h9c))} || (((8'ha6) ~^ (8'had)) - (~(8'hba))))) ? (~&((~^{(8'ha0)}) + (((8'ha3) ? (8'hb6) : (8'hb5)) ? ((8'hb5) ? (7'h40) : (8'hb1)) : {(8'hb8), (8'ha3)}))) : ((&(+((8'hbe) && (7'h43)))) <<< ((((8'hac) > (8'ha5)) ~^ {(8'hbc)}) ^ (-(+(8'ha4)))))), 
parameter param73 = {{({(~|(8'hae)), ((7'h42) ? (7'h41) : (8'hb7))} ? (8'ha0) : ({param72} ? (+(8'hac)) : (^param72))), ((&(param72 >> param72)) && (param72 > (param72 & param72)))}})
(y, clk, wire24, wire23, wire22, wire21, wire20);
  output wire [(32'h198):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire24;
  input wire [(4'hd):(1'h0)] wire23;
  input wire signed [(4'hc):(1'h0)] wire22;
  input wire signed [(3'h4):(1'h0)] wire21;
  input wire [(5'h15):(1'h0)] wire20;
  wire [(5'h14):(1'h0)] wire70;
  wire [(5'h15):(1'h0)] wire54;
  wire [(5'h13):(1'h0)] wire53;
  wire signed [(4'h8):(1'h0)] wire33;
  wire signed [(4'hf):(1'h0)] wire32;
  wire signed [(4'hf):(1'h0)] wire31;
  wire signed [(2'h3):(1'h0)] wire26;
  wire [(5'h13):(1'h0)] wire25;
  reg signed [(3'h7):(1'h0)] reg52 = (1'h0);
  reg [(5'h10):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg47 = (1'h0);
  reg [(5'h12):(1'h0)] reg46 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg45 = (1'h0);
  reg [(4'he):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg43 = (1'h0);
  reg [(4'hb):(1'h0)] reg42 = (1'h0);
  reg [(2'h2):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg40 = (1'h0);
  reg [(4'h8):(1'h0)] reg39 = (1'h0);
  reg [(3'h5):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg37 = (1'h0);
  reg [(5'h15):(1'h0)] reg36 = (1'h0);
  reg [(3'h5):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg34 = (1'h0);
  reg [(4'ha):(1'h0)] reg30 = (1'h0);
  reg [(4'h8):(1'h0)] reg29 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg28 = (1'h0);
  reg [(4'hf):(1'h0)] reg27 = (1'h0);
  assign y = {wire70,
                 wire54,
                 wire53,
                 wire33,
                 wire32,
                 wire31,
                 wire26,
                 wire25,
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
                 reg35,
                 reg34,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 (1'h0)};
  assign wire25 = (!wire23);
  assign wire26 = ($signed($signed(wire21)) ?
                      (wire20 ?
                          wire24 : ((wire24 && (^~wire23)) ?
                              wire24[(3'h7):(1'h0)] : $signed(wire22))) : $signed((8'ha5)));
  always
    @(posedge clk) begin
      reg27 <= $signed($signed((-(+wire23))));
      reg28 <= reg27;
    end
  always
    @(posedge clk) begin
      reg29 <= (~|(((wire20 && $signed(wire20)) ?
          (~&wire24[(3'h4):(3'h4)]) : (+(wire22 != wire20))) << ($unsigned((wire22 ?
              wire26 : wire25)) ?
          wire20 : $unsigned((~&reg28)))));
      reg30 <= {{$signed($unsigned((~&(7'h43))))}, $unsigned(wire20)};
    end
  assign wire31 = (((reg30 - (wire26 ? reg30 : (!wire25))) ?
                          (($signed(reg29) ?
                              (+wire21) : (reg28 ?
                                  reg30 : wire21)) <= (!$unsigned(reg27))) : $signed($signed($unsigned((7'h42))))) ?
                      ((wire26[(1'h0):(1'h0)] ?
                          reg29[(1'h1):(1'h1)] : wire22[(4'ha):(2'h2)]) + wire25) : ($unsigned(reg30[(4'ha):(4'h9)]) <<< (($signed(reg30) >>> $unsigned(wire25)) ?
                          (reg27 & wire24) : ((wire20 <<< (8'hba)) << (|wire26)))));
  assign wire32 = $unsigned($unsigned($signed($signed(wire21))));
  assign wire33 = $unsigned(wire26[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      reg34 <= $unsigned((|$unsigned(($signed(wire20) ^ wire33))));
      reg35 <= (wire20 ? wire24[(5'h14):(3'h7)] : wire33[(2'h3):(1'h1)]);
      reg36 <= (&reg28[(5'h11):(4'h9)]);
      reg37 <= wire21[(1'h1):(1'h1)];
    end
  always
    @(posedge clk) begin
      reg38 <= ((((8'h9f) && $unsigned((reg28 ^ (8'hac)))) ?
              wire32[(4'ha):(3'h5)] : {wire31, wire21[(2'h2):(1'h0)]}) ?
          reg27 : (!(~|{(reg35 ^~ wire22), (~wire23)})));
      if ((reg28[(5'h11):(1'h0)] <= {wire32, {$unsigned(reg35), wire24}}))
        begin
          if (($unsigned((($signed(reg29) ? reg28[(4'hf):(4'hf)] : wire31) ?
              {{wire23,
                      (8'hb2)}} : $unsigned($signed(wire23)))) ^~ $signed((wire21 ?
              ({reg36, (8'hb8)} ?
                  $unsigned(wire33) : (reg29 ?
                      wire23 : wire33)) : wire23[(1'h1):(1'h1)]))))
            begin
              reg39 <= {{((|wire33) - reg29[(1'h0):(1'h0)]),
                      (reg35[(3'h5):(1'h1)] && reg38)},
                  $unsigned(wire20[(3'h7):(3'h6)])};
              reg40 <= $unsigned({$signed(((wire32 >>> wire31) ?
                      $signed(reg39) : (wire31 >> wire24))),
                  ($signed($unsigned(reg38)) || (|$unsigned((8'ha9))))});
              reg41 <= (8'hb9);
              reg42 <= ((wire25 <= ({(reg37 ~^ reg27), $unsigned(reg39)} ?
                  (wire26 ? $unsigned(reg35) : $signed(wire25)) : ({wire31,
                      wire31} - (~&wire24)))) ~^ ($signed((wire24[(4'he):(3'h4)] == $unsigned(wire24))) ?
                  (reg38[(1'h0):(1'h0)] ?
                      $signed($signed(wire31)) : $signed({reg38,
                          wire31})) : $unsigned($unsigned(reg36[(2'h3):(1'h0)]))));
              reg43 <= {wire20};
            end
          else
            begin
              reg39 <= $unsigned(reg30);
              reg40 <= reg37[(3'h6):(1'h1)];
            end
          reg44 <= {((reg35 ?
                  ((^~wire22) | reg36[(4'he):(3'h6)]) : ($signed(reg34) ?
                      $unsigned(wire23) : (+(8'hbf)))) <= wire21),
              wire23};
          reg45 <= (~|(~|$unsigned(reg35[(3'h4):(1'h1)])));
          reg46 <= ($signed(({$signed(reg35), (wire24 ? wire33 : reg39)} ?
                  $unsigned((-reg44)) : ((8'hb3) & (reg41 >>> reg41)))) ?
              (^$signed(wire32[(4'hb):(2'h3)])) : (~^($signed((reg40 > (8'hac))) >= (8'hbd))));
          if (wire33)
            begin
              reg47 <= reg37;
            end
          else
            begin
              reg47 <= ($unsigned(($signed(wire24[(5'h10):(1'h0)]) >> reg41)) ?
                  wire32 : reg44);
              reg48 <= (($signed(reg34) == reg42) >> reg46);
              reg49 <= reg45;
              reg50 <= (+(reg49[(1'h1):(1'h1)] - wire23[(2'h3):(1'h1)]));
            end
        end
      else
        begin
          if (($signed(wire32[(1'h1):(1'h1)]) ?
              {{($signed(reg29) == $signed(reg49)),
                      wire23[(3'h5):(3'h5)]}} : $unsigned($unsigned(((reg50 <<< reg50) ?
                  reg47[(3'h5):(1'h0)] : reg36)))))
            begin
              reg39 <= ($signed(($unsigned((reg27 != reg37)) ^~ reg44)) && reg46);
              reg40 <= (reg34 ?
                  ($unsigned({$unsigned(reg38)}) ?
                      ($unsigned(reg46) ?
                          $signed((reg50 ?
                              wire31 : reg36)) : reg43) : reg27) : $signed($unsigned(reg43)));
              reg41 <= wire20;
            end
          else
            begin
              reg39 <= $unsigned($unsigned((reg29[(3'h6):(2'h3)] ?
                  (((8'hae) ?
                      reg30 : wire23) + reg35) : ($signed(wire20) - reg30[(4'h9):(4'h9)]))));
              reg40 <= (~|$signed($unsigned($unsigned((reg50 ~^ (8'haf))))));
            end
          reg42 <= $unsigned($signed(reg27[(3'h7):(3'h6)]));
        end
      reg51 <= $unsigned((^$unsigned($signed($signed(reg27)))));
      reg52 <= (|((wire22 ?
          ((reg29 ? (8'h9d) : (8'ha1)) ?
              (reg46 * reg30) : wire20) : reg50[(4'h9):(3'h6)]) ^~ wire21));
    end
  assign wire53 = (reg37 ?
                      ($signed((8'hbf)) ?
                          reg41[(2'h2):(1'h0)] : (8'hb8)) : ($unsigned(({reg39,
                                  reg36} ?
                              ((8'ha2) ? (8'hab) : reg39) : ((8'hbd) ?
                                  reg38 : (7'h40)))) ?
                          ($signed((wire33 && wire21)) ?
                              ($unsigned(reg38) ?
                                  $unsigned(reg30) : reg37) : {reg30[(3'h6):(1'h1)],
                                  $signed(reg36)}) : (~$unsigned((wire24 == wire22)))));
  assign wire54 = reg49;
  module55 #() modinst71 (.wire56(wire53), .wire58(wire31), .clk(clk), .wire59(wire33), .y(wire70), .wire57(wire54));
endmodule

module module7  (y, clk, wire11, wire10, wire9, wire8);
  output wire [(32'h3c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire11;
  input wire signed [(4'hf):(1'h0)] wire10;
  input wire [(5'h15):(1'h0)] wire9;
  input wire signed [(3'h5):(1'h0)] wire8;
  wire signed [(5'h14):(1'h0)] wire16;
  wire signed [(4'hf):(1'h0)] wire15;
  wire signed [(3'h7):(1'h0)] wire14;
  wire signed [(3'h7):(1'h0)] wire12;
  reg signed [(4'ha):(1'h0)] reg13 = (1'h0);
  assign y = {wire16, wire15, wire14, wire12, reg13, (1'h0)};
  assign wire12 = wire11;
  always
    @(posedge clk) begin
      reg13 <= wire12;
    end
  assign wire14 = (wire8[(3'h5):(2'h2)] ?
                      ($unsigned($signed((reg13 ? (7'h41) : (8'ha8)))) ?
                          wire8 : ({(wire8 + wire11),
                              $unsigned((8'hbb))} ^ (~|{wire11,
                              wire10}))) : (^~wire12));
  assign wire15 = $unsigned(($unsigned({$unsigned(reg13),
                      wire9}) >> (^reg13[(2'h2):(2'h2)])));
  assign wire16 = (((~$signed($signed(wire15))) * {wire9,
                      ((wire12 ? wire9 : wire8) & (wire9 ?
                          (8'had) : wire11))}) <<< $signed((&$signed((~wire11)))));
endmodule

module module55  (y, clk, wire59, wire58, wire57, wire56);
  output wire [(32'h67):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire59;
  input wire [(4'hf):(1'h0)] wire58;
  input wire signed [(5'h15):(1'h0)] wire57;
  input wire signed [(5'h13):(1'h0)] wire56;
  wire [(3'h7):(1'h0)] wire69;
  wire [(5'h14):(1'h0)] wire68;
  wire [(4'h8):(1'h0)] wire67;
  wire [(3'h4):(1'h0)] wire66;
  wire [(4'ha):(1'h0)] wire65;
  reg signed [(3'h6):(1'h0)] reg64 = (1'h0);
  reg [(4'hc):(1'h0)] reg63 = (1'h0);
  reg [(5'h13):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg60 = (1'h0);
  assign y = {wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg60 <= ((~|$unsigned($unsigned($unsigned(wire57)))) ?
          wire59 : (-(($signed(wire57) == (-wire59)) + wire59[(3'h7):(3'h4)])));
      reg61 <= wire56;
      reg62 <= $unsigned(($signed({(wire59 ?
              reg61 : reg60)}) && $unsigned((((8'hb2) == wire58) * (reg60 && wire57)))));
      reg63 <= (reg61 ?
          $signed(($unsigned((8'ha3)) ?
              (~&reg61[(3'h5):(2'h2)]) : wire56)) : ({wire57} ?
              $signed($unsigned($signed(reg60))) : wire59));
      reg64 <= $signed({(~&$unsigned(wire59[(4'h8):(3'h7)]))});
    end
  assign wire65 = {$signed($signed((~|(~|wire59)))), reg62};
  assign wire66 = reg60;
  assign wire67 = ((wire66 ?
                      {$signed((wire56 << wire56))} : wire59[(3'h7):(3'h5)]) >>> (wire57 + (!(&$unsigned(reg64)))));
  assign wire68 = $unsigned({{reg63[(4'hb):(4'ha)], wire67[(4'h8):(3'h5)]}});
  assign wire69 = (($unsigned((+wire57)) ?
                          ((wire67[(3'h4):(2'h3)] & $unsigned((8'hb3))) && wire59) : $unsigned((~^$unsigned(reg64)))) ?
                      ((|wire65[(2'h2):(1'h0)]) ?
                          (+{(~^wire68),
                              $unsigned(wire56)}) : $unsigned((~|(&(8'h9f))))) : $unsigned(({(~wire68)} ?
                          $signed($signed(reg62)) : $unsigned($signed(reg64)))));
endmodule
