module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h19a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire4;
  wire [(3'h6):(1'h0)] wire128;
  wire [(3'h4):(1'h0)] wire127;
  wire signed [(5'h14):(1'h0)] wire126;
  wire [(4'hb):(1'h0)] wire125;
  wire signed [(3'h6):(1'h0)] wire124;
  wire [(3'h5):(1'h0)] wire123;
  wire signed [(4'hc):(1'h0)] wire122;
  wire signed [(3'h7):(1'h0)] wire121;
  wire signed [(3'h7):(1'h0)] wire120;
  wire signed [(3'h4):(1'h0)] wire108;
  wire signed [(3'h6):(1'h0)] wire107;
  wire signed [(5'h14):(1'h0)] wire5;
  wire signed [(4'ha):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire7;
  wire [(5'h14):(1'h0)] wire62;
  wire signed [(4'h8):(1'h0)] wire64;
  wire [(3'h6):(1'h0)] wire65;
  wire [(5'h12):(1'h0)] wire66;
  wire signed [(5'h10):(1'h0)] wire71;
  wire signed [(2'h2):(1'h0)] wire105;
  reg signed [(3'h6):(1'h0)] reg119 = (1'h0);
  reg [(5'h15):(1'h0)] reg118 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg117 = (1'h0);
  reg [(5'h10):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg115 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg114 = (1'h0);
  reg [(4'he):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg112 = (1'h0);
  reg [(4'hc):(1'h0)] reg111 = (1'h0);
  reg [(4'h8):(1'h0)] reg110 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg67 = (1'h0);
  reg [(5'h10):(1'h0)] reg68 = (1'h0);
  reg [(5'h12):(1'h0)] reg69 = (1'h0);
  reg [(4'he):(1'h0)] reg70 = (1'h0);
  assign y = {wire128,
                 wire127,
                 wire126,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire108,
                 wire107,
                 wire5,
                 wire6,
                 wire7,
                 wire62,
                 wire64,
                 wire65,
                 wire66,
                 wire71,
                 wire105,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg67,
                 reg68,
                 reg69,
                 reg70,
                 (1'h0)};
  assign wire5 = $unsigned((wire2 >>> wire2));
  assign wire6 = wire5[(4'h8):(4'h8)];
  assign wire7 = $unsigned(((wire3 ?
                     wire1 : wire3[(3'h4):(2'h3)]) << (~&((wire2 ?
                     wire1 : wire3) < ((8'hb5) ? wire5 : wire2)))));
  module8 #() modinst63 (.wire9(wire1), .clk(clk), .wire11(wire3), .y(wire62), .wire10(wire4), .wire12(wire0));
  assign wire64 = ((((wire0 ?
                          $signed(wire7) : $unsigned(wire7)) + $unsigned($unsigned(wire4))) ?
                      ((-$unsigned(wire3)) ?
                          (+(wire2 ?
                              wire6 : wire3)) : (+{wire2})) : $unsigned((8'hbb))) <<< ((~wire5) ?
                      ($signed(wire1) && (^(wire0 & wire1))) : wire3[(1'h0):(1'h0)]));
  assign wire65 = (((((^~wire1) ?
                              (wire64 ? (8'hb6) : wire1) : ((8'hb4) ?
                                  wire62 : wire0)) ?
                          (!(wire64 ? wire5 : wire62)) : wire0) ?
                      (wire64 <<< {(~&wire1), (!wire6)}) : (&(wire0 ?
                          $signed(wire64) : wire1[(4'ha):(3'h7)]))) ^ ((^{wire0,
                          (wire64 ? (8'hb8) : wire6)}) ?
                      {wire1} : (~&($signed(wire4) ?
                          $unsigned((8'ha8)) : (wire3 <= wire1)))));
  assign wire66 = (~&($signed($signed((wire7 && wire6))) <<< (wire62[(3'h6):(1'h0)] ?
                      wire7 : (wire4 && (^wire4)))));
  always
    @(posedge clk) begin
      reg67 <= (|$unsigned(((wire0[(3'h6):(3'h5)] != wire2) + wire6[(2'h2):(2'h2)])));
      reg68 <= (wire7 <<< (8'hbc));
      if (($unsigned({wire2}) ? $unsigned(wire2[(4'he):(4'he)]) : wire1))
        begin
          reg69 <= wire5[(3'h6):(2'h3)];
        end
      else
        begin
          reg69 <= ((^($unsigned(wire62) ^ $signed((~^wire1)))) >>> {(7'h40),
              $signed($unsigned((-wire5)))});
        end
      reg70 <= ((reg67[(4'hc):(4'hb)] ?
              (reg69[(3'h4):(1'h1)] ?
                  {(~|reg67),
                      (^~wire0)} : wire7) : (wire2[(5'h15):(3'h4)] < ($signed(wire0) ?
                  (-wire5) : (wire65 == (8'hb1))))) ?
          (wire2 >= (8'hbe)) : $signed((|(wire5 ?
              wire0[(5'h11):(3'h4)] : (wire4 ? wire7 : wire1)))));
    end
  assign wire71 = wire62[(3'h6):(3'h6)];
  module72 #() modinst106 (wire105, clk, wire66, reg69, wire0, wire7);
  assign wire107 = ($signed(((8'h9d) >>> ($signed(wire3) ?
                       {wire5,
                           wire1} : (&wire0)))) > $unsigned($unsigned(($unsigned(wire0) - reg68[(3'h5):(3'h5)]))));
  assign wire108 = {(~(((~^(8'ha1)) ?
                               wire65[(3'h5):(3'h5)] : wire0[(5'h13):(2'h2)]) ?
                           wire4 : $unsigned((wire105 << reg69)))),
                       ((wire3 ?
                               $unsigned(((8'h9d) ?
                                   (7'h40) : wire5)) : $signed((~wire0))) ?
                           ((reg69[(4'ha):(1'h1)] ?
                               $unsigned(wire105) : $unsigned((8'hbb))) && (^~wire4)) : (|wire71))};
  always
    @(posedge clk) begin
      if ((!$signed(wire4[(1'h0):(1'h0)])))
        begin
          reg109 <= {(&((+(wire62 == wire105)) >= ((wire5 >> wire1) ?
                  $signed(reg68) : (wire66 ? wire105 : reg69)))),
              (~|$unsigned(reg67[(4'h9):(3'h5)]))};
          reg110 <= ($unsigned(((wire7 <<< (wire107 ? wire2 : wire107)) ?
                  wire2 : (~|wire66[(4'hb):(4'hb)]))) ?
              (reg67 ~^ wire0) : wire64[(2'h3):(2'h3)]);
          reg111 <= (8'ha5);
          reg112 <= $unsigned($signed((((-wire107) - wire4) >= $unsigned($signed(wire2)))));
          reg113 <= (~$signed((8'hba)));
        end
      else
        begin
          if ((~((reg70 >= $signed((wire108 ?
              wire65 : wire107))) || (wire1 <<< $signed((reg112 ?
              wire64 : wire105))))))
            begin
              reg109 <= $signed(($signed($signed(wire7)) ?
                  (wire64 ?
                      $unsigned(((8'hb6) == (8'hb8))) : (wire1 ?
                          reg67[(4'hc):(4'ha)] : wire107[(1'h0):(1'h0)])) : $signed($signed(wire65[(2'h2):(1'h0)]))));
              reg110 <= $signed({{wire62[(3'h6):(3'h5)], wire2}, wire3});
              reg111 <= wire7[(3'h6):(1'h0)];
              reg112 <= wire108;
              reg113 <= $signed((wire4 ?
                  {(wire107[(1'h0):(1'h0)] || wire4),
                      (&wire5)} : ((wire0 + $signed(wire1)) >>> (~^$unsigned((8'hac))))));
            end
          else
            begin
              reg109 <= wire4[(1'h1):(1'h1)];
              reg110 <= $signed(((~&wire6[(4'h8):(3'h5)]) && ($unsigned((8'hb9)) ^~ wire0)));
              reg111 <= wire4[(3'h5):(2'h3)];
              reg112 <= (-(~{($signed(reg67) ?
                      (wire6 ? wire108 : reg112) : $unsigned(wire62))}));
              reg113 <= {wire107, wire65[(3'h4):(2'h2)]};
            end
        end
      reg114 <= wire105;
      if ($unsigned((+(wire64 | ($signed(reg110) ?
          $signed(wire6) : (^reg70))))))
        begin
          reg115 <= $unsigned(reg112[(4'h9):(2'h3)]);
          reg116 <= (wire66 ?
              $signed($signed($signed((wire0 ?
                  wire66 : wire66)))) : ((((reg67 > reg112) ?
                          (reg115 ? wire107 : wire7) : (8'h9d)) ?
                      reg112 : wire64) ?
                  (^(8'hba)) : (&{{reg68, wire7}, (wire1 <= reg113)})));
        end
      else
        begin
          reg115 <= (~&wire105[(1'h0):(1'h0)]);
          reg116 <= wire3;
          reg117 <= (wire66[(1'h0):(1'h0)] >> $unsigned(wire65));
          reg118 <= (((^{wire105[(1'h0):(1'h0)]}) << $signed(((8'hbc) == reg67[(2'h2):(2'h2)]))) ?
              (&($unsigned($unsigned((8'hb7))) ^~ wire107[(1'h0):(1'h0)])) : reg114[(1'h0):(1'h0)]);
        end
      reg119 <= reg113[(4'hd):(4'h9)];
    end
  assign wire120 = (reg112 ? $unsigned(wire65) : reg67);
  assign wire121 = (|(($unsigned((wire7 ?
                       wire6 : reg109)) < $unsigned($unsigned(wire3))) ~^ $signed($unsigned((~&reg113)))));
  assign wire122 = ($unsigned($signed($unsigned(wire7))) >= ((~(8'ha3)) + ({$unsigned(wire6),
                           wire4} ?
                       reg112 : $unsigned($unsigned(reg111)))));
  assign wire123 = wire6;
  assign wire124 = wire1[(4'hd):(4'hd)];
  assign wire125 = (~&(~|wire0));
  assign wire126 = $signed($signed((wire66[(4'hb):(4'ha)] ?
                       ((wire5 + wire62) ?
                           $unsigned(wire65) : $unsigned(reg113)) : wire123)));
  assign wire127 = wire120;
  assign wire128 = wire65;
endmodule

module module72  (y, clk, wire76, wire75, wire74, wire73);
  output wire [(32'h80):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire76;
  input wire signed [(5'h12):(1'h0)] wire75;
  input wire signed [(2'h3):(1'h0)] wire74;
  input wire signed [(4'h8):(1'h0)] wire73;
  wire [(3'h5):(1'h0)] wire104;
  wire [(4'hd):(1'h0)] wire103;
  wire [(4'h8):(1'h0)] wire101;
  wire [(4'h9):(1'h0)] wire83;
  wire signed [(4'he):(1'h0)] wire80;
  wire [(5'h12):(1'h0)] wire79;
  wire [(4'h9):(1'h0)] wire78;
  wire signed [(5'h12):(1'h0)] wire77;
  reg signed [(5'h13):(1'h0)] reg81 = (1'h0);
  reg [(4'he):(1'h0)] reg82 = (1'h0);
  assign y = {wire104,
                 wire103,
                 wire101,
                 wire83,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 reg81,
                 reg82,
                 (1'h0)};
  assign wire77 = (^~(~&wire74));
  assign wire78 = wire74[(2'h3):(2'h3)];
  assign wire79 = $unsigned(($signed((wire75 >> $signed((7'h42)))) ?
                      ((8'hba) ?
                          $signed($signed(wire77)) : $signed($signed(wire73))) : wire74[(2'h3):(1'h0)]));
  assign wire80 = (~wire74[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg81 <= wire74;
      reg82 <= $unsigned((~({wire74[(1'h1):(1'h0)],
          (wire77 ^ wire79)} * $unsigned($signed(wire76)))));
    end
  assign wire83 = ((((wire79[(5'h11):(4'ha)] ?
                          $unsigned(wire73) : $unsigned(wire74)) ?
                      wire74 : reg81) << (($unsigned(wire79) ?
                      (|wire77) : wire77[(4'h9):(2'h2)]) * (!(wire74 ?
                      wire78 : wire73)))) | reg82);
  module84 #() modinst102 (wire101, clk, wire79, wire77, reg81, wire74, wire76);
  assign wire103 = ((~|(~^($signed(wire83) + ((8'ha8) ?
                       (8'hb6) : wire79)))) | $unsigned(($signed((wire78 ?
                       (8'h9d) : wire83)) < ((|wire74) ?
                       (~reg82) : wire80[(4'he):(4'h8)]))));
  assign wire104 = (~|$signed({{$unsigned(wire77)}}));
endmodule

module module8
#(parameter param61 = (((&(((7'h42) ? (8'hb2) : (8'ha3)) ? ((7'h40) | (8'ha3)) : (~&(8'ha5)))) || (((^~(8'hbc)) ? (|(8'h9d)) : {(8'hab)}) ? (~{(7'h42), (8'hb0)}) : ((+(8'hbc)) | ((8'haf) ? (8'hb6) : (8'haf))))) + ((|{(~|(8'haf)), ((7'h44) ? (8'hae) : (8'hb4))}) ? (((^(8'haf)) ? {(8'had)} : (~&(8'hb2))) ~^ (((8'h9f) | (8'hae)) > ((7'h41) | (8'hbd)))) : (^(8'ha0)))))
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h8b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire12;
  input wire [(5'h14):(1'h0)] wire11;
  input wire signed [(4'h8):(1'h0)] wire10;
  input wire signed [(4'ha):(1'h0)] wire9;
  wire [(3'h6):(1'h0)] wire60;
  wire signed [(5'h11):(1'h0)] wire59;
  wire [(4'h8):(1'h0)] wire57;
  wire [(3'h7):(1'h0)] wire22;
  wire [(5'h13):(1'h0)] wire21;
  wire signed [(3'h7):(1'h0)] wire20;
  wire signed [(2'h2):(1'h0)] wire19;
  wire [(3'h4):(1'h0)] wire18;
  wire signed [(4'ha):(1'h0)] wire17;
  wire [(5'h14):(1'h0)] wire16;
  wire signed [(4'h8):(1'h0)] wire15;
  wire signed [(4'ha):(1'h0)] wire14;
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  assign y = {wire60,
                 wire59,
                 wire57,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 reg13,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg13 <= ((~^((^~(wire10 <<< wire11)) ?
              ((wire9 >> wire10) ?
                  {wire11, wire9} : (~^wire10)) : {(wire10 < wire12),
                  $signed(wire12)})) ?
          wire12[(4'hc):(1'h0)] : ((|$signed($signed(wire9))) >>> ((+(+wire10)) ^ $unsigned($signed(wire11)))));
    end
  assign wire14 = (!wire10[(3'h5):(2'h3)]);
  assign wire15 = (8'hb5);
  assign wire16 = wire10[(3'h5):(1'h0)];
  assign wire17 = wire15;
  assign wire18 = $unsigned(wire15);
  assign wire19 = ((8'haf) & wire16[(4'he):(1'h0)]);
  assign wire20 = (&(~$signed((wire18 || (!(8'h9c))))));
  assign wire21 = (~^(($signed(wire12) | ((+wire18) >>> wire20)) ?
                      {{reg13[(3'h5):(1'h0)],
                              (wire10 != wire16)}} : (!{$signed(wire17),
                          wire12})));
  assign wire22 = (&wire11[(2'h3):(2'h3)]);
  module23 #() modinst58 (.wire27(wire9), .wire26(reg13), .wire28(wire10), .wire25(wire11), .y(wire57), .clk(clk), .wire24(wire17));
  assign wire59 = $unsigned(wire57);
  assign wire60 = $signed((8'h9f));
endmodule

module module23
#(parameter param55 = ((((~&((8'haa) ? (8'ha7) : (8'hbd))) ? {((8'ha1) - (8'h9c))} : ((~(8'hb8)) && ((8'ha8) > (8'ha6)))) ? ((&(~(8'hbf))) | (~|(~(8'hbd)))) : ((-(~^(8'hbe))) == (((8'hb9) <= (7'h42)) != ((8'ha6) ^~ (8'ha1))))) ? (&{(((8'hbb) ? (8'hbc) : (8'h9f)) << ((8'ha6) + (8'ha5))), (8'had)}) : ((~^(~^((8'hac) >> (8'hb0)))) ? (~{(+(8'ha4)), ((8'h9f) ? (8'hbf) : (8'hb8))}) : (~&(~&(^(8'hb1)))))), 
parameter param56 = (&{{((+param55) ? param55 : (8'ha3))}, (&((param55 <<< param55) ? (param55 ? param55 : (8'hb3)) : (param55 >= param55)))}))
(y, clk, wire28, wire27, wire26, wire25, wire24);
  output wire [(32'h144):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire28;
  input wire [(4'ha):(1'h0)] wire27;
  input wire [(5'h14):(1'h0)] wire26;
  input wire signed [(5'h14):(1'h0)] wire25;
  input wire signed [(4'ha):(1'h0)] wire24;
  wire signed [(5'h10):(1'h0)] wire39;
  wire [(4'hf):(1'h0)] wire38;
  wire signed [(4'hd):(1'h0)] wire37;
  wire signed [(4'hf):(1'h0)] wire34;
  wire [(5'h11):(1'h0)] wire33;
  wire signed [(5'h11):(1'h0)] wire32;
  wire [(5'h12):(1'h0)] wire31;
  wire [(2'h2):(1'h0)] wire30;
  wire [(4'h8):(1'h0)] wire29;
  reg signed [(4'hc):(1'h0)] reg54 = (1'h0);
  reg [(5'h13):(1'h0)] reg53 = (1'h0);
  reg [(5'h15):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg50 = (1'h0);
  reg [(4'ha):(1'h0)] reg49 = (1'h0);
  reg [(4'h9):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg47 = (1'h0);
  reg [(2'h2):(1'h0)] reg46 = (1'h0);
  reg [(5'h12):(1'h0)] reg45 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg44 = (1'h0);
  reg signed [(4'he):(1'h0)] reg43 = (1'h0);
  reg signed [(4'he):(1'h0)] reg42 = (1'h0);
  reg [(3'h5):(1'h0)] reg41 = (1'h0);
  reg [(5'h13):(1'h0)] reg40 = (1'h0);
  reg [(3'h4):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg35 = (1'h0);
  assign y = {wire39,
                 wire38,
                 wire37,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
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
                 reg36,
                 reg35,
                 (1'h0)};
  assign wire29 = $unsigned(wire25[(4'hc):(3'h7)]);
  assign wire30 = (8'hb9);
  assign wire31 = ($unsigned(($unsigned((~&(8'ha8))) >> ((wire24 ?
                              wire27 : wire27) ?
                          (wire24 && wire28) : (wire27 < (7'h42))))) ?
                      (((((8'hb7) ^ (8'hb3)) ?
                          {wire29} : {wire29}) >= (8'hba)) << (8'hbc)) : wire25[(1'h1):(1'h1)]);
  assign wire32 = ((8'hbc) + wire30);
  assign wire33 = wire25[(5'h10):(2'h3)];
  assign wire34 = (~|$unsigned((^~{(~|wire33), $unsigned(wire24)})));
  always
    @(posedge clk) begin
      reg35 <= wire30[(2'h2):(1'h1)];
      reg36 <= (wire28 ?
          wire31[(3'h4):(2'h3)] : (wire31[(3'h6):(1'h0)] ?
              wire26[(5'h13):(3'h4)] : (($unsigned((8'hac)) + $signed(wire30)) > wire29[(3'h5):(2'h3)])));
    end
  assign wire37 = ((-{(~(wire27 ? wire25 : wire27))}) <= $unsigned(wire32));
  assign wire38 = wire33[(3'h4):(3'h4)];
  assign wire39 = (!$signed(wire33));
  always
    @(posedge clk) begin
      if ((&wire24[(3'h7):(1'h0)]))
        begin
          reg40 <= ($unsigned((|wire37[(3'h7):(3'h4)])) && {{wire32,
                  $unsigned($unsigned(wire25))},
              (8'ha0)});
          reg41 <= (~^(wire28 ?
              (reg36 <<< (((8'hac) ?
                  reg40 : reg35) >= $signed(reg40))) : (+$signed($unsigned(wire26)))));
          reg42 <= wire24;
          reg43 <= $unsigned($signed((wire28 < wire31[(4'he):(3'h7)])));
        end
      else
        begin
          if ($unsigned((!(8'hb5))))
            begin
              reg40 <= (reg41[(2'h2):(1'h1)] ^ {(7'h43)});
              reg41 <= wire31[(1'h0):(1'h0)];
              reg42 <= (+$unsigned((8'hb0)));
              reg43 <= (+(+wire38));
              reg44 <= $unsigned($signed((&(7'h41))));
            end
          else
            begin
              reg40 <= (!$signed({(!wire29)}));
              reg41 <= $signed({(wire24 ?
                      ($signed((8'hb7)) ^ (~&wire26)) : $unsigned((wire32 ^ reg42))),
                  (|(^wire32[(4'hb):(1'h1)]))});
              reg42 <= (((8'hb9) ?
                      $signed($unsigned($unsigned(wire34))) : wire33) ?
                  (8'ha5) : $signed(reg42));
            end
          if ($signed($signed($unsigned(($unsigned(wire37) ?
              wire32 : $signed((8'hb9)))))))
            begin
              reg45 <= (((^~(wire24 + $signed(wire32))) ?
                      (reg44[(2'h3):(2'h3)] ?
                          ({wire27, (8'hbb)} ?
                              {wire37} : (wire29 + wire34)) : ((-reg41) & (~&wire24))) : (8'hb5)) ?
                  ((8'hb8) ?
                      (~^wire37) : $signed($unsigned((+reg42)))) : ((~&(|(wire31 ?
                          reg35 : wire31))) ?
                      (wire31[(4'h8):(3'h4)] ^~ $unsigned(reg44[(1'h0):(1'h0)])) : ($unsigned({(7'h40),
                              wire31}) ?
                          $unsigned(((8'ha9) ?
                              wire37 : reg41)) : $signed((!wire30)))));
              reg46 <= wire38;
              reg47 <= $signed((reg36 ?
                  reg36[(2'h3):(1'h1)] : $signed((~(+wire26)))));
              reg48 <= wire25[(4'h9):(3'h4)];
              reg49 <= $unsigned(wire27);
            end
          else
            begin
              reg45 <= ($unsigned($signed(reg49)) & $signed(wire28[(1'h1):(1'h0)]));
              reg46 <= reg41[(1'h0):(1'h0)];
              reg47 <= ((($unsigned(((8'hb4) * reg43)) ?
                      wire31 : reg49[(1'h1):(1'h0)]) ?
                  (((wire38 ? wire29 : wire27) ?
                      $unsigned(wire26) : (wire29 ?
                          reg46 : wire33)) < ($signed((8'h9f)) ?
                      $signed(wire38) : wire31)) : $signed((^((8'ha8) & reg42)))) || {reg41[(3'h5):(3'h4)]});
            end
          reg50 <= reg46[(1'h1):(1'h1)];
          reg51 <= reg44;
          reg52 <= $unsigned(reg41);
        end
      reg53 <= $unsigned(reg41[(3'h5):(1'h0)]);
      reg54 <= $signed($unsigned(wire30[(2'h2):(1'h1)]));
    end
endmodule

module module84
#(parameter param99 = (&((({(8'h9e), (8'hbc)} ? ((8'hb5) ? (8'hbe) : (8'hbf)) : ((8'ha7) <<< (8'h9e))) <<< (&((8'hb4) + (8'h9e)))) ? {(~&(^~(8'ha8))), (((8'h9f) ? (8'hae) : (8'hbb)) - {(8'hb5), (8'hb6)})} : (~|(^((8'hb5) <<< (8'ha2)))))), 
parameter param100 = ((((8'hb8) <= ({(8'hb5), (8'ha7)} == (|param99))) == (^((8'hb2) + param99))) ? ((param99 ? {(param99 ? param99 : param99)} : ({param99} ? ((8'ha1) ? (7'h40) : param99) : param99)) ? {((param99 ? param99 : param99) && (~|param99))} : (((param99 || (8'ha8)) ? (param99 == param99) : (param99 ? param99 : param99)) & ((param99 ? param99 : param99) ? (^~(8'hab)) : (param99 ? param99 : param99)))) : (~&(((param99 ? param99 : (8'hb2)) ? param99 : (~&param99)) ? {(param99 ? param99 : param99)} : param99))))
(y, clk, wire89, wire88, wire87, wire86, wire85);
  output wire [(32'h52):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire89;
  input wire [(4'h8):(1'h0)] wire88;
  input wire signed [(5'h13):(1'h0)] wire87;
  input wire signed [(2'h3):(1'h0)] wire86;
  input wire signed [(5'h12):(1'h0)] wire85;
  wire signed [(2'h3):(1'h0)] wire98;
  wire [(2'h3):(1'h0)] wire97;
  wire signed [(5'h10):(1'h0)] wire96;
  wire signed [(5'h11):(1'h0)] wire92;
  wire [(3'h5):(1'h0)] wire91;
  wire [(4'hb):(1'h0)] wire90;
  reg signed [(3'h6):(1'h0)] reg95 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg93 = (1'h0);
  assign y = {wire98,
                 wire97,
                 wire96,
                 wire92,
                 wire91,
                 wire90,
                 reg95,
                 reg94,
                 reg93,
                 (1'h0)};
  assign wire90 = {(wire85[(3'h6):(3'h4)] - $unsigned((wire85 ?
                          wire88 : $signed((8'hbb))))),
                      ((8'hb0) != $unsigned((wire89[(4'ha):(1'h0)] && $unsigned(wire86))))};
  assign wire91 = wire86;
  assign wire92 = (($signed($signed($signed(wire87))) || $signed({wire87,
                          $unsigned(wire85)})) ?
                      wire90[(4'hb):(2'h2)] : $unsigned(wire90));
  always
    @(posedge clk) begin
      reg93 <= ((~&{$unsigned($unsigned(wire91))}) ?
          (|wire92[(4'hc):(1'h1)]) : $unsigned(((-((8'ha2) | (8'ha4))) ?
              wire90[(1'h1):(1'h1)] : $signed($signed((8'h9c))))));
      reg94 <= {{($unsigned({wire85, wire87}) >= wire88)}};
      reg95 <= (wire87 ?
          $unsigned({$unsigned((wire87 | (8'hbb)))}) : (wire87[(5'h13):(4'hb)] != wire87));
    end
  assign wire96 = $unsigned((+(~(|$signed(wire91)))));
  assign wire97 = wire89[(2'h2):(1'h0)];
  assign wire98 = {$signed(reg93),
                      {wire96[(4'hc):(4'h9)],
                          $unsigned((reg93 ?
                              (wire92 ? wire91 : wire90) : $unsigned(reg94)))}};
endmodule
