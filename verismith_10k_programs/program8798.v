module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h61):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire0;
  input wire [(4'he):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire3;
  wire signed [(3'h7):(1'h0)] wire160;
  wire [(5'h12):(1'h0)] wire159;
  wire signed [(5'h10):(1'h0)] wire4;
  wire [(5'h13):(1'h0)] wire88;
  wire signed [(4'hf):(1'h0)] wire90;
  wire signed [(5'h11):(1'h0)] wire91;
  wire [(3'h4):(1'h0)] wire157;
  assign y = {wire160, wire159, wire4, wire88, wire90, wire91, wire157, (1'h0)};
  assign wire4 = wire2[(1'h0):(1'h0)];
  module5 #() modinst89 (wire88, clk, wire4, wire0, wire2, wire3);
  assign wire90 = $unsigned(wire1[(4'h9):(3'h5)]);
  assign wire91 = {{$unsigned(wire2)}, $signed($signed(wire4))};
  module92 #() modinst158 (wire157, clk, wire3, wire90, wire88, wire91, wire0);
  assign wire159 = wire2[(2'h2):(2'h2)];
  assign wire160 = ($unsigned(wire2[(5'h10):(2'h2)]) ?
                       ($signed($signed(wire90)) != ($signed(wire0[(5'h10):(4'hc)]) >> {(wire157 ?
                               wire1 : wire88),
                           wire88[(5'h11):(4'h9)]})) : $unsigned(((wire88[(4'ha):(4'ha)] ?
                           wire2 : $signed(wire0)) != (8'haf))));
endmodule

module module92  (y, clk, wire93, wire94, wire95, wire96, wire97);
  output wire [(32'h7e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire93;
  input wire [(4'hc):(1'h0)] wire94;
  input wire signed [(5'h13):(1'h0)] wire95;
  input wire signed [(5'h11):(1'h0)] wire96;
  input wire [(5'h11):(1'h0)] wire97;
  wire [(2'h3):(1'h0)] wire156;
  wire signed [(4'ha):(1'h0)] wire154;
  wire [(5'h11):(1'h0)] wire142;
  wire [(5'h15):(1'h0)] wire98;
  wire signed [(5'h12):(1'h0)] wire123;
  wire [(4'h8):(1'h0)] wire125;
  wire signed [(5'h14):(1'h0)] wire126;
  wire signed [(5'h11):(1'h0)] wire127;
  wire signed [(4'hb):(1'h0)] wire140;
  assign y = {wire156,
                 wire154,
                 wire142,
                 wire98,
                 wire123,
                 wire125,
                 wire126,
                 wire127,
                 wire140,
                 (1'h0)};
  assign wire98 = {$signed(({(+wire95)} ^ wire97[(3'h7):(3'h5)])),
                      wire93[(2'h2):(2'h2)]};
  module99 #() modinst124 (.wire103(wire96), .clk(clk), .wire101(wire97), .wire100(wire93), .wire102(wire94), .y(wire123));
  assign wire125 = {(($signed((wire97 ?
                           wire95 : (8'ha6))) ^~ wire96[(1'h1):(1'h1)]) ^ $unsigned($signed($signed(wire96)))),
                       (|wire123[(3'h5):(1'h0)])};
  assign wire126 = wire97;
  assign wire127 = {wire94[(3'h5):(1'h0)]};
  module128 #() modinst141 (wire140, clk, wire96, wire97, wire93, wire95, wire98);
  assign wire142 = wire93;
  module143 #() modinst155 (wire154, clk, wire123, wire126, wire142, wire98);
  assign wire156 = $unsigned($unsigned((wire98 ?
                       wire96[(3'h5):(2'h3)] : wire126)));
endmodule

module module5  (y, clk, wire6, wire7, wire8, wire9);
  output wire [(32'h8f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire6;
  input wire [(5'h10):(1'h0)] wire7;
  input wire signed [(5'h10):(1'h0)] wire8;
  input wire signed [(4'ha):(1'h0)] wire9;
  wire [(4'h9):(1'h0)] wire87;
  wire signed [(5'h13):(1'h0)] wire86;
  wire signed [(3'h4):(1'h0)] wire85;
  wire [(5'h15):(1'h0)] wire61;
  wire [(4'hc):(1'h0)] wire63;
  wire [(2'h2):(1'h0)] wire64;
  wire signed [(4'hf):(1'h0)] wire67;
  wire signed [(4'ha):(1'h0)] wire68;
  wire [(5'h11):(1'h0)] wire69;
  wire signed [(4'h9):(1'h0)] wire83;
  reg signed [(3'h5):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg65 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire85,
                 wire61,
                 wire63,
                 wire64,
                 wire67,
                 wire68,
                 wire69,
                 wire83,
                 reg66,
                 reg65,
                 (1'h0)};
  module10 #() modinst62 (wire61, clk, wire7, wire8, wire9, wire6);
  assign wire63 = wire9;
  assign wire64 = wire61;
  always
    @(posedge clk) begin
      reg65 <= wire63[(3'h5):(2'h2)];
      reg66 <= (reg65 ? $unsigned((|$unsigned((~|(8'hab))))) : wire61);
    end
  assign wire67 = $unsigned(wire6);
  assign wire68 = $signed(reg66);
  assign wire69 = $unsigned(wire63);
  module70 #() modinst84 (wire83, clk, wire9, wire69, wire6, wire67, wire61);
  assign wire85 = reg66;
  assign wire86 = ($unsigned((($unsigned(wire64) ?
                          (wire61 ? wire8 : wire69) : {wire68}) ~^ {{wire68,
                              reg66}})) ?
                      (&((^(reg65 ? reg66 : wire83)) ?
                          $signed($signed(wire68)) : (^$signed(wire64)))) : (^~($signed(((8'h9c) && wire68)) < (!(&wire9)))));
  assign wire87 = (wire69 ?
                      (wire69 ? wire6 : wire64) : ($signed(wire83) * wire67));
endmodule

module module70
#(parameter param81 = ((((((8'hb9) << (8'ha3)) ? (&(8'hb2)) : (~&(8'hb6))) ? (!((8'hb7) ? (8'hac) : (8'hb5))) : ((7'h40) <<< ((8'ha1) == (8'hbb)))) ^~ ((((8'hb3) ? (8'ha6) : (8'hb9)) ? ((8'hae) | (8'hbd)) : {(8'had)}) ^ ({(8'had)} ? ((8'hb4) || (8'ha9)) : (^(8'haa))))) ? {(^((|(8'h9d)) <= ((8'ha0) ? (8'ha4) : (8'haf))))} : (((|((8'hb2) ? (8'hac) : (8'ha1))) ? (((8'ha7) ? (8'ha1) : (8'ha8)) ? ((8'ha7) ? (8'hb7) : (8'hbe)) : ((8'hb8) ? (8'hbf) : (8'h9f))) : (!((8'ha0) + (8'ha4)))) ? (|((!(8'ha3)) >= (~|(8'had)))) : ({(-(8'hae)), ((8'hb5) ? (8'hbd) : (7'h44))} ~^ (((8'hb2) + (7'h41)) == ((8'hb8) + (8'hb1)))))), 
parameter param82 = (~|(-(((param81 ? param81 : (8'ha6)) - (param81 ^~ param81)) - ({param81, param81} ? param81 : param81)))))
(y, clk, wire75, wire74, wire73, wire72, wire71);
  output wire [(32'h2b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire75;
  input wire [(5'h11):(1'h0)] wire74;
  input wire [(3'h6):(1'h0)] wire73;
  input wire signed [(4'hb):(1'h0)] wire72;
  input wire [(5'h15):(1'h0)] wire71;
  wire [(2'h3):(1'h0)] wire80;
  wire [(2'h2):(1'h0)] wire79;
  wire signed [(4'hf):(1'h0)] wire78;
  wire signed [(4'h9):(1'h0)] wire77;
  wire signed [(4'hd):(1'h0)] wire76;
  assign y = {wire80, wire79, wire78, wire77, wire76, (1'h0)};
  assign wire76 = {wire75};
  assign wire77 = $unsigned($unsigned($unsigned(($unsigned(wire72) ~^ wire73))));
  assign wire78 = $unsigned(wire72);
  assign wire79 = ($signed((-wire73)) ?
                      (wire76 ^~ $unsigned(($signed(wire76) >>> ((8'hb2) & wire73)))) : ($signed(wire74) << wire75[(2'h3):(1'h1)]));
  assign wire80 = $signed(wire76);
endmodule

module module10
#(parameter param60 = (&(!(-(-(^~(8'h9e)))))))
(y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'h20d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire14;
  input wire [(3'h4):(1'h0)] wire13;
  input wire signed [(4'h8):(1'h0)] wire12;
  input wire signed [(3'h5):(1'h0)] wire11;
  wire [(4'hc):(1'h0)] wire59;
  wire signed [(5'h10):(1'h0)] wire58;
  wire signed [(5'h11):(1'h0)] wire57;
  wire [(4'h9):(1'h0)] wire56;
  wire [(5'h14):(1'h0)] wire55;
  wire [(5'h10):(1'h0)] wire54;
  wire signed [(2'h3):(1'h0)] wire36;
  wire [(4'ha):(1'h0)] wire35;
  wire signed [(4'h9):(1'h0)] wire34;
  wire signed [(4'hc):(1'h0)] wire33;
  wire [(4'h9):(1'h0)] wire29;
  wire signed [(3'h5):(1'h0)] wire15;
  reg signed [(5'h11):(1'h0)] reg53 = (1'h0);
  reg [(4'hb):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg51 = (1'h0);
  reg [(4'h8):(1'h0)] reg50 = (1'h0);
  reg [(5'h13):(1'h0)] reg49 = (1'h0);
  reg [(5'h13):(1'h0)] reg48 = (1'h0);
  reg [(5'h10):(1'h0)] reg47 = (1'h0);
  reg [(4'h9):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg44 = (1'h0);
  reg [(5'h15):(1'h0)] reg43 = (1'h0);
  reg signed [(4'he):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg40 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg38 = (1'h0);
  reg [(2'h2):(1'h0)] reg37 = (1'h0);
  reg [(4'hf):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg31 = (1'h0);
  reg [(2'h2):(1'h0)] reg30 = (1'h0);
  reg [(5'h10):(1'h0)] reg28 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg27 = (1'h0);
  reg [(3'h5):(1'h0)] reg26 = (1'h0);
  reg [(4'h9):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg24 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg23 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg21 = (1'h0);
  reg [(4'hd):(1'h0)] reg20 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg17 = (1'h0);
  reg [(2'h3):(1'h0)] reg16 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire29,
                 wire15,
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
                 reg32,
                 reg31,
                 reg30,
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
                 reg17,
                 reg16,
                 (1'h0)};
  assign wire15 = (wire13[(2'h2):(1'h1)] >>> (wire13 >> $unsigned($unsigned((~^wire13)))));
  always
    @(posedge clk) begin
      reg16 <= (^$signed(wire11[(1'h0):(1'h0)]));
      if (wire14)
        begin
          reg17 <= $signed((wire14 * $unsigned((wire15[(2'h3):(2'h2)] ?
              wire11[(2'h3):(2'h2)] : (wire14 ? wire11 : wire15)))));
          reg18 <= (((($unsigned((8'hb3)) | {wire15}) ^~ wire13[(1'h0):(1'h0)]) > (~&wire15[(3'h4):(2'h3)])) << (~|{((|(8'ha9)) ~^ $signed(reg16)),
              $signed(wire14)}));
          reg19 <= wire14[(1'h0):(1'h0)];
          reg20 <= $signed(wire13);
        end
      else
        begin
          reg17 <= ((wire12 && wire15) ? wire14 : wire11[(3'h4):(2'h2)]);
          if (((~|reg18[(3'h4):(2'h2)]) <<< wire11))
            begin
              reg18 <= wire12;
              reg19 <= (($unsigned((^$unsigned(wire12))) * {wire14,
                      $unsigned((-reg20))}) ?
                  (wire11[(1'h1):(1'h1)] > $signed(reg16[(1'h0):(1'h0)])) : $unsigned({reg20[(3'h5):(3'h4)]}));
              reg20 <= wire14[(4'he):(4'hb)];
            end
          else
            begin
              reg18 <= ({$signed(((-wire12) << (wire15 ?
                      (8'ha7) : reg18)))} <<< (8'h9e));
            end
          if (((!wire15[(2'h3):(2'h3)]) ~^ ((((reg16 ? wire14 : wire12) ?
                  (-wire15) : wire15) ?
              wire13 : $signed($signed((7'h40)))) * wire13[(1'h0):(1'h0)])))
            begin
              reg21 <= $signed(wire13[(1'h0):(1'h0)]);
              reg22 <= $unsigned(reg20);
              reg23 <= $signed((~|(&((|wire11) ^~ reg18[(4'h8):(3'h5)]))));
              reg24 <= wire14[(4'he):(2'h2)];
            end
          else
            begin
              reg21 <= ($signed(({((8'ha8) <= reg17), $signed(reg17)} ?
                      (+(reg22 ? reg22 : reg17)) : (!{reg17, wire11}))) ?
                  (-(((+wire13) ^~ (~|wire11)) >>> (|(reg21 ~^ reg23)))) : wire11);
              reg22 <= reg16[(1'h1):(1'h1)];
              reg23 <= $signed($unsigned($unsigned((reg19[(5'h10):(4'hc)] ?
                  reg24 : $unsigned(reg21)))));
              reg24 <= $unsigned(reg23);
              reg25 <= wire12[(3'h5):(3'h4)];
            end
          reg26 <= ((-$signed($unsigned(((8'haa) ? reg24 : wire15)))) ?
              $unsigned(($signed((wire13 ? reg21 : reg20)) ?
                  reg19 : (8'ha9))) : reg22[(3'h4):(2'h3)]);
        end
      reg27 <= (^$unsigned((((reg22 + reg20) | (!reg25)) ?
          (wire11[(2'h2):(1'h1)] ? reg17 : {reg20, wire14}) : $signed(reg17))));
      reg28 <= ((~&$signed($signed((reg26 >> (8'ha0))))) ?
          ((~|{$unsigned(reg17), reg17}) || {(reg17 <<< (reg21 << reg24)),
              reg17}) : reg20);
    end
  assign wire29 = reg19[(5'h11):(5'h11)];
  always
    @(posedge clk) begin
      reg30 <= (8'hbb);
      reg31 <= (-reg23);
      reg32 <= reg19;
    end
  assign wire33 = $unsigned(wire29[(3'h5):(2'h3)]);
  assign wire34 = wire29;
  assign wire35 = $signed($unsigned(reg18));
  assign wire36 = wire15[(3'h4):(2'h3)];
  always
    @(posedge clk) begin
      reg37 <= {($unsigned({reg16, (~wire12)}) ? (8'hbb) : wire13)};
      if ((+(wire29[(3'h6):(1'h0)] * $signed((|{reg31})))))
        begin
          reg38 <= ($unsigned({reg21[(1'h0):(1'h0)],
                  {$signed(wire15), (reg21 ? reg16 : wire29)}}) ?
              (^{(^$unsigned((8'hb8)))}) : wire14[(4'h8):(1'h0)]);
          if ($signed(reg16))
            begin
              reg39 <= wire34;
              reg40 <= reg25;
              reg41 <= ({$unsigned($signed($unsigned(reg18)))} << ((reg31[(1'h0):(1'h0)] << (^~(wire34 ^ wire36))) + $unsigned(((reg38 || reg37) & wire29))));
              reg42 <= reg16[(2'h3):(2'h3)];
              reg43 <= $signed(((+{$unsigned(reg25)}) ?
                  {reg23, ((|reg19) ? (+wire34) : $signed(reg24))} : (~reg31)));
            end
          else
            begin
              reg39 <= (8'hb6);
              reg40 <= (((((reg30 <<< reg42) > {reg40}) ?
                  ({(8'hb2),
                      reg17} ^~ ((8'ha3) | reg41)) : (reg42[(3'h5):(3'h5)] ?
                      reg27[(3'h5):(2'h3)] : reg23)) >= {reg41[(3'h4):(1'h1)],
                  $signed(((8'hac) ? wire33 : (8'hbd)))}) | (~&wire29));
              reg41 <= wire35[(1'h1):(1'h0)];
              reg42 <= ($unsigned(($signed({reg30, reg26}) && (!{reg20,
                  wire33}))) - reg23[(2'h2):(2'h2)]);
            end
          reg44 <= {(~|{$unsigned((reg43 | wire35)), $unsigned({reg17})}),
              (8'hb8)};
        end
      else
        begin
          if ({(~|$unsigned(wire29[(3'h7):(2'h3)]))})
            begin
              reg38 <= {reg39};
              reg39 <= (reg44[(4'he):(3'h5)] ^ (8'hbf));
              reg40 <= wire33[(3'h7):(1'h1)];
              reg41 <= ($unsigned(reg44[(1'h1):(1'h1)]) ?
                  wire34[(4'h8):(1'h1)] : (^~((~|(~(8'hb1))) + (reg27 ?
                      (reg39 + reg17) : reg17[(4'he):(4'hb)]))));
              reg42 <= $unsigned(wire34[(2'h3):(1'h1)]);
            end
          else
            begin
              reg38 <= (reg28[(4'he):(4'h9)] ?
                  ($unsigned({wire11[(1'h1):(1'h0)],
                          (wire14 ? reg22 : (8'hbd))}) ?
                      $signed($signed((&reg19))) : reg39[(3'h6):(2'h2)]) : $unsigned((^~(reg16[(2'h2):(1'h1)] ?
                      (reg19 - reg37) : reg38))));
              reg39 <= ((wire35[(2'h2):(1'h1)] >>> $signed(($signed(wire35) <<< (reg31 - reg41)))) ?
                  reg21 : $signed(($unsigned((!reg16)) ?
                      $unsigned(reg27) : (!$signed(reg41)))));
            end
          reg43 <= (reg24 <= $signed(($unsigned($unsigned(reg39)) ~^ {{reg44},
              (reg43 ? (8'h9c) : reg39)})));
          reg44 <= $unsigned({(wire11 ?
                  ($signed(reg26) || (~&reg23)) : reg26)});
          if (((^(8'hbb)) != ($unsigned((~|(~wire15))) - wire36)))
            begin
              reg45 <= $unsigned(((8'h9e) + $unsigned(reg16)));
              reg46 <= wire14;
            end
          else
            begin
              reg45 <= $unsigned(reg19[(5'h10):(4'hb)]);
              reg46 <= ((($unsigned(wire11[(2'h2):(1'h0)]) ?
                          ((+reg22) || reg23) : reg45) ?
                      (8'had) : reg32[(1'h1):(1'h1)]) ?
                  ({{reg42[(4'he):(4'hc)]}} ?
                      reg24[(5'h10):(1'h0)] : {reg25,
                          (!(+reg20))}) : (-$unsigned(reg18[(4'ha):(4'ha)])));
              reg47 <= $unsigned((~|reg20[(4'h8):(2'h2)]));
            end
        end
      reg48 <= $signed(reg39[(2'h3):(1'h0)]);
      reg49 <= (($signed($unsigned(reg46)) ?
              $signed(reg39[(4'h8):(1'h0)]) : reg48) ?
          reg23 : (reg37 ?
              ({{reg44},
                  reg22} | wire14[(4'he):(3'h7)]) : $signed({$signed((8'ha4))})));
      if (({$unsigned(reg41)} ?
          reg16[(2'h2):(2'h2)] : ((!((~^wire33) <<< (reg16 ? reg37 : reg23))) ?
              (~^$unsigned(((7'h42) >>> (8'haa)))) : wire36[(1'h0):(1'h0)])))
        begin
          reg50 <= reg48;
          if ((~|$unsigned(wire35)))
            begin
              reg51 <= $signed($unsigned((~^reg22)));
              reg52 <= wire33;
            end
          else
            begin
              reg51 <= (wire36[(1'h0):(1'h0)] || wire15[(3'h4):(1'h1)]);
            end
          reg53 <= (|(~wire12));
        end
      else
        begin
          reg50 <= reg21[(4'ha):(2'h3)];
        end
    end
  assign wire54 = $unsigned($unsigned(reg24));
  assign wire55 = ($signed((!(8'ha9))) >>> $signed((&{reg46[(4'h8):(4'h8)],
                      $signed(reg21)})));
  assign wire56 = (($unsigned(((|wire29) ?
                              (wire33 ? reg24 : reg43) : (reg28 == wire33))) ?
                          (8'ha5) : reg26) ?
                      (reg16 && $unsigned({reg23})) : $unsigned(reg40[(3'h7):(3'h6)]));
  assign wire57 = (~^reg38[(2'h2):(1'h0)]);
  assign wire58 = (((~^reg21[(2'h3):(1'h0)]) ?
                      $unsigned($unsigned((reg53 ?
                          reg23 : reg40))) : ((!(wire55 ? reg17 : (8'ha6))) ?
                          ((reg45 ? reg47 : wire56) ?
                              (reg22 & reg18) : {reg32,
                                  reg31}) : $unsigned({reg23}))) && {wire15,
                      (~^reg25[(3'h6):(2'h3)])});
  assign wire59 = (reg41[(1'h0):(1'h0)] >> (reg44 > {((reg26 ?
                              wire33 : (8'hb2)) ?
                          $signed(reg17) : (reg21 ? (8'had) : reg26))}));
endmodule

module module143
#(parameter param152 = {(((((8'hb4) << (8'ha7)) < (~(7'h44))) ? ({(8'hb3), (8'ha2)} | ((8'hbf) ? (8'hac) : (8'ha0))) : ((&(8'ha6)) ? ((8'ha0) ^~ (8'h9d)) : ((8'hb6) << (7'h44)))) ? (~&(|((8'ha0) >>> (8'hbf)))) : (({(8'haa), (8'ha6)} * (-(8'ha4))) ? ({(7'h44)} | (|(8'hb3))) : (^~(&(8'hb8))))), (((((8'hb6) ? (8'ha4) : (8'hb9)) * (|(8'hb0))) < (((8'hac) ? (7'h42) : (8'ha7)) <<< (^~(8'had)))) >= ((|((8'ha5) >>> (8'haa))) ? (-(+(7'h41))) : ({(8'hbd)} < ((8'hbc) ? (8'hae) : (8'hb9)))))}, 
parameter param153 = (param152 ? (^~(param152 ^ param152)) : (param152 ? (|((+param152) ? (param152 & param152) : (param152 < param152))) : param152)))
(y, clk, wire147, wire146, wire145, wire144);
  output wire [(32'h14):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire147;
  input wire signed [(5'h13):(1'h0)] wire146;
  input wire [(3'h7):(1'h0)] wire145;
  input wire signed [(3'h6):(1'h0)] wire144;
  wire signed [(2'h2):(1'h0)] wire151;
  wire signed [(4'hb):(1'h0)] wire150;
  wire [(3'h4):(1'h0)] wire149;
  wire [(2'h2):(1'h0)] wire148;
  assign y = {wire151, wire150, wire149, wire148, (1'h0)};
  assign wire148 = wire147;
  assign wire149 = {($signed(wire147) ? {wire144[(3'h6):(2'h2)]} : wire147)};
  assign wire150 = ($unsigned(({$unsigned(wire144),
                           ((8'hab) ? wire149 : (7'h44))} ?
                       {wire146,
                           $unsigned(wire147)} : $unsigned((wire149 * (8'hb1))))) <<< $unsigned(((^~$unsigned(wire149)) ?
                       $signed($unsigned(wire144)) : {$signed((8'h9e))})));
  assign wire151 = (((|(7'h43)) ?
                       (^~wire148) : wire145) && ((wire148[(2'h2):(2'h2)] & wire146[(1'h0):(1'h0)]) ?
                       (~$unsigned((8'h9e))) : $unsigned({$signed(wire144),
                           wire147})));
endmodule

module module128
#(parameter param139 = ((((((8'hbc) ? (8'hb9) : (8'hb1)) ? {(8'ha6)} : {(8'ha4)}) ? ((~|(8'hbd)) ? ((8'haf) & (8'hbb)) : (~(8'hb8))) : {((8'hab) ? (8'h9d) : (8'ha6)), ((8'hac) < (8'ha0))}) ? (((&(8'ha5)) && ((8'ha5) + (8'ha1))) ? (((8'ha4) ? (8'ha1) : (8'hb0)) == (|(8'hb3))) : (8'hab)) : ({(|(8'h9d)), {(8'hbd), (8'hae)}} <= ((-(8'ha5)) != {(8'ha2)}))) ? ((({(7'h42)} ? {(8'hae)} : ((8'hbb) * (8'hbf))) != (((8'hb7) ? (8'h9c) : (8'ha2)) ? ((8'h9f) ? (8'hae) : (8'hbe)) : ((8'hb0) ? (8'hb5) : (8'hb5)))) & (&(~|((8'hbb) == (8'ha7))))) : (((~(7'h44)) ~^ (((8'ha7) ? (8'h9d) : (8'hbe)) ? ((8'ha8) <= (8'hbe)) : ((8'ha9) ? (8'hb7) : (8'ha9)))) & (&(((8'ha2) * (8'hbb)) ? ((8'ha4) ? (8'ha8) : (8'hb1)) : ((7'h42) ? (8'hb1) : (7'h43)))))))
(y, clk, wire133, wire132, wire131, wire130, wire129);
  output wire [(32'h3d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire133;
  input wire [(3'h5):(1'h0)] wire132;
  input wire [(3'h5):(1'h0)] wire131;
  input wire [(3'h7):(1'h0)] wire130;
  input wire [(5'h15):(1'h0)] wire129;
  wire [(4'hf):(1'h0)] wire138;
  wire [(5'h14):(1'h0)] wire137;
  wire signed [(5'h10):(1'h0)] wire136;
  wire signed [(3'h5):(1'h0)] wire135;
  wire signed [(3'h4):(1'h0)] wire134;
  assign y = {wire138, wire137, wire136, wire135, wire134, (1'h0)};
  assign wire134 = {(~|{wire132[(3'h4):(2'h3)]})};
  assign wire135 = {(wire134 & (-(~&(wire134 - wire132)))),
                       wire129[(4'hd):(1'h0)]};
  assign wire136 = $unsigned($signed(($signed(((8'hae) ? wire131 : wire133)) ?
                       ((!wire132) ?
                           (wire131 >> wire130) : {wire129}) : (^~(+wire131)))));
  assign wire137 = $signed(((!$unsigned((wire135 >= wire136))) ?
                       ($unsigned((wire133 ? wire129 : wire129)) ?
                           $unsigned($signed((8'had))) : wire134[(1'h1):(1'h1)]) : (8'hb7)));
  assign wire138 = (!wire137[(3'h4):(2'h2)]);
endmodule

module module99
#(parameter param122 = (~^{(+{(-(7'h43)), ((8'had) != (8'hba))}), {({(8'hb9)} <= {(8'h9d), (8'hb0)})}}))
(y, clk, wire103, wire102, wire101, wire100);
  output wire [(32'he6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire103;
  input wire signed [(4'hc):(1'h0)] wire102;
  input wire signed [(5'h10):(1'h0)] wire101;
  input wire [(3'h7):(1'h0)] wire100;
  wire [(3'h7):(1'h0)] wire121;
  wire [(3'h7):(1'h0)] wire120;
  wire signed [(5'h10):(1'h0)] wire119;
  wire [(4'ha):(1'h0)] wire118;
  wire [(4'he):(1'h0)] wire117;
  wire [(4'hc):(1'h0)] wire116;
  wire [(2'h3):(1'h0)] wire115;
  wire signed [(4'h8):(1'h0)] wire114;
  wire signed [(4'hf):(1'h0)] wire112;
  wire [(5'h15):(1'h0)] wire111;
  wire [(4'he):(1'h0)] wire110;
  wire signed [(4'he):(1'h0)] wire107;
  wire [(4'hf):(1'h0)] wire106;
  wire signed [(5'h13):(1'h0)] wire105;
  wire signed [(5'h15):(1'h0)] wire104;
  reg signed [(2'h3):(1'h0)] reg113 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg108 = (1'h0);
  assign y = {wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire112,
                 wire111,
                 wire110,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 reg113,
                 reg109,
                 reg108,
                 (1'h0)};
  assign wire104 = ($unsigned((|($unsigned(wire102) ?
                       wire103 : $unsigned(wire101)))) << $signed(wire101));
  assign wire105 = $signed(wire100[(3'h7):(1'h0)]);
  assign wire106 = (!((wire101 ? (~^(~^wire103)) : {((8'hb6) > (8'hb2))}) ?
                       ({wire105[(4'h8):(2'h2)],
                           (wire104 >> wire104)} ^~ {((8'hb3) ?
                               wire102 : wire102),
                           wire102}) : $signed(wire104)));
  assign wire107 = (~|((^~(~(wire101 + wire105))) ?
                       (({wire104} ?
                           (~^wire105) : (wire104 - wire101)) & $unsigned((wire100 ?
                           wire100 : wire102))) : wire106[(2'h2):(2'h2)]));
  always
    @(posedge clk) begin
      reg108 <= ($signed(wire100) == ((8'hb7) ?
          $signed({(wire106 ~^ (8'h9c))}) : wire100));
      reg109 <= (($unsigned(($signed(wire101) + (reg108 > wire105))) ?
              $signed(reg108[(4'hf):(3'h7)]) : wire101) ?
          wire105 : (wire103[(1'h0):(1'h0)] == ({wire105[(5'h11):(4'h9)],
              wire103[(2'h3):(2'h3)]} << $signed($unsigned(wire104)))));
    end
  assign wire110 = (((^$signed(wire107[(3'h5):(1'h0)])) == (($unsigned(reg108) < (!(8'hbf))) ?
                           $unsigned(wire104[(3'h7):(2'h2)]) : ($unsigned(reg109) ?
                               wire103[(1'h0):(1'h0)] : $signed(reg108)))) ?
                       (^{{reg109}}) : (~&wire103[(3'h4):(1'h0)]));
  assign wire111 = $signed((~|wire110));
  assign wire112 = (wire106[(3'h7):(3'h4)] ?
                       ($unsigned($signed({wire107})) <<< ($signed((wire103 ?
                               wire110 : wire103)) ?
                           (wire105 <<< $signed(wire104)) : wire104)) : ((wire101[(1'h1):(1'h0)] >= wire101) ?
                           ($signed({wire100,
                               wire106}) >>> $signed($unsigned(wire106))) : $signed($signed((reg109 ?
                               wire107 : wire105)))));
  always
    @(posedge clk) begin
      reg113 <= {reg109[(3'h7):(3'h7)],
          $signed($unsigned(wire105[(4'hd):(2'h3)]))};
    end
  assign wire114 = (^(($signed((wire102 > wire100)) ?
                       (8'hb6) : ({wire106,
                           reg113} > $unsigned(wire111))) >>> wire106));
  assign wire115 = (^reg109);
  assign wire116 = (8'ha0);
  assign wire117 = ($unsigned((&(wire105 || wire102))) ^~ {(({wire103, reg113} ?
                           $unsigned(wire101) : {wire116, wire107}) + wire105),
                       {($unsigned(wire106) ?
                               {wire114, wire104} : ((8'hbf) ?
                                   (8'hb3) : reg113))}});
  assign wire118 = (7'h41);
  assign wire119 = $unsigned({(-($unsigned(wire114) | $unsigned(wire100)))});
  assign wire120 = (-{((-(8'hb4)) ?
                           ($signed(reg109) ?
                               wire115 : $unsigned((8'haa))) : wire112)});
  assign wire121 = wire101[(2'h2):(1'h0)];
endmodule
