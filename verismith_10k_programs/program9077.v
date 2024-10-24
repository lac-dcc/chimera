module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hf0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire0;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire3;
  wire signed [(2'h3):(1'h0)] wire87;
  wire signed [(4'he):(1'h0)] wire86;
  wire [(5'h14):(1'h0)] wire85;
  wire [(4'h8):(1'h0)] wire84;
  wire signed [(5'h13):(1'h0)] wire83;
  wire [(5'h12):(1'h0)] wire4;
  wire signed [(3'h6):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire6;
  wire [(3'h6):(1'h0)] wire7;
  wire [(4'hc):(1'h0)] wire8;
  wire [(5'h10):(1'h0)] wire9;
  wire signed [(4'ha):(1'h0)] wire10;
  wire [(4'ha):(1'h0)] wire11;
  wire signed [(4'hf):(1'h0)] wire12;
  wire signed [(5'h12):(1'h0)] wire13;
  wire signed [(5'h14):(1'h0)] wire14;
  wire [(3'h6):(1'h0)] wire15;
  wire [(5'h13):(1'h0)] wire81;
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
                 wire14,
                 wire15,
                 wire81,
                 (1'h0)};
  assign wire4 = wire3[(3'h4):(3'h4)];
  assign wire5 = wire2;
  assign wire6 = (~|($unsigned((wire5[(3'h4):(2'h3)] ?
                     $signed(wire1) : (&wire4))) || ({(wire0 ? wire2 : wire3)} ?
                     (|$signed(wire5)) : wire4)));
  assign wire7 = (~&({($signed(wire5) ? $signed(wire4) : (wire6 != (8'hbf))),
                     (wire2 && {(8'hb5)})} != $unsigned(wire2)));
  assign wire8 = wire7;
  assign wire9 = $unsigned((|wire5));
  assign wire10 = $unsigned(wire5);
  assign wire11 = (wire0[(4'h8):(3'h4)] ^ (&({(wire6 ? wire7 : wire0),
                      (-wire4)} & $unsigned($signed((8'ha7))))));
  assign wire12 = wire8;
  assign wire13 = wire1;
  assign wire14 = $signed(((($unsigned(wire8) ?
                          (wire11 ?
                              wire0 : wire11) : $unsigned(wire3)) >> wire1) ?
                      (~(8'ha6)) : (^~(!{wire2, wire0}))));
  assign wire15 = $signed($signed((($signed(wire2) | (wire2 ?
                      wire12 : (8'ha0))) <= (~(wire4 == (7'h40))))));
  module16 #() modinst82 (wire81, clk, wire2, wire6, wire0, wire11, wire12);
  assign wire83 = (wire3 ?
                      $unsigned(wire7) : ($unsigned((wire2[(5'h13):(4'he)] << wire13)) ?
                          wire3[(3'h7):(2'h3)] : wire81));
  assign wire84 = ($unsigned((8'ha4)) ^~ wire11[(3'h6):(2'h3)]);
  assign wire85 = {wire12[(4'ha):(4'h9)], $unsigned(wire13[(4'h9):(3'h5)])};
  assign wire86 = wire13[(3'h5):(3'h5)];
  assign wire87 = $unsigned(({wire3[(3'h4):(2'h3)]} << ((~^$signed(wire12)) ?
                      $unsigned((wire13 & wire5)) : ($signed((8'had)) ~^ $signed(wire15)))));
endmodule

module module16  (y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'h155):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire21;
  input wire [(4'hf):(1'h0)] wire20;
  input wire [(2'h3):(1'h0)] wire19;
  input wire [(4'ha):(1'h0)] wire18;
  input wire signed [(4'hb):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire80;
  wire [(4'hc):(1'h0)] wire78;
  wire signed [(4'ha):(1'h0)] wire77;
  wire signed [(3'h7):(1'h0)] wire75;
  wire signed [(4'ha):(1'h0)] wire53;
  wire signed [(5'h10):(1'h0)] wire52;
  wire [(3'h5):(1'h0)] wire51;
  wire signed [(4'hd):(1'h0)] wire50;
  wire [(4'hc):(1'h0)] wire35;
  wire [(5'h11):(1'h0)] wire33;
  reg signed [(4'h8):(1'h0)] reg79 = (1'h0);
  reg [(4'hc):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg57 = (1'h0);
  reg [(4'hd):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg54 = (1'h0);
  reg [(2'h2):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg48 = (1'h0);
  reg [(4'h9):(1'h0)] reg47 = (1'h0);
  reg [(3'h6):(1'h0)] reg46 = (1'h0);
  reg [(5'h15):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg43 = (1'h0);
  reg [(4'hd):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg41 = (1'h0);
  reg [(5'h10):(1'h0)] reg40 = (1'h0);
  reg [(4'ha):(1'h0)] reg39 = (1'h0);
  reg [(4'hf):(1'h0)] reg38 = (1'h0);
  reg [(2'h2):(1'h0)] reg37 = (1'h0);
  reg [(2'h3):(1'h0)] reg36 = (1'h0);
  assign y = {wire80,
                 wire78,
                 wire77,
                 wire75,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire35,
                 wire33,
                 reg79,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
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
  module22 #() modinst34 (.wire23(wire17), .y(wire33), .wire24(wire19), .wire25(wire21), .wire26(wire20), .clk(clk));
  assign wire35 = (wire21[(1'h1):(1'h0)] & (+(({wire17,
                          wire33} <= (wire21 ^ (7'h41))) ?
                      ($unsigned(wire20) ?
                          (wire21 < wire21) : (-(8'had))) : wire33[(5'h10):(1'h0)])));
  always
    @(posedge clk) begin
      if (wire35)
        begin
          reg36 <= ($signed(((wire18 ?
                  (wire35 ? wire21 : (8'hac)) : (~wire21)) <= (8'h9c))) ?
              wire33 : ((wire17 >= ($unsigned(wire33) ?
                      (wire33 ~^ wire19) : $signed(wire18))) ?
                  {$unsigned(wire20[(3'h6):(2'h2)])} : ({(~^wire19),
                          $unsigned(wire17)} ?
                      (((8'ha3) ? wire35 : wire17) >> ((7'h40) ?
                          wire33 : wire21)) : {wire21[(5'h15):(5'h15)],
                          (-wire20)})));
          reg37 <= $signed((~|{($unsigned(wire21) & (-reg36)),
              (^~$signed(wire17))}));
        end
      else
        begin
          if (wire35)
            begin
              reg36 <= wire19;
              reg37 <= (($signed((~&(wire21 ?
                      reg36 : wire33))) >>> $signed({(wire18 ^~ wire20),
                      (wire21 ~^ wire17)})) ?
                  wire21 : (($unsigned((wire18 * wire18)) ?
                      (|wire35) : {$unsigned(wire35)}) + $signed((&(wire19 && wire17)))));
              reg38 <= reg36[(1'h0):(1'h0)];
              reg39 <= {wire21[(5'h12):(3'h7)],
                  $unsigned(wire17[(2'h2):(1'h0)])};
            end
          else
            begin
              reg36 <= $signed(wire20);
              reg37 <= (~^reg36);
            end
          if ((((!(((8'hbc) ? reg38 : wire35) < {wire21, wire33})) ?
              reg37[(1'h1):(1'h0)] : (!$signed($signed(wire18)))) + $unsigned({wire17[(4'h8):(1'h1)]})))
            begin
              reg40 <= wire21;
              reg41 <= wire35[(4'ha):(2'h2)];
            end
          else
            begin
              reg40 <= $signed($unsigned(wire35[(3'h5):(1'h1)]));
              reg41 <= ($unsigned(($signed((reg37 + wire33)) <= $signed((wire35 >> reg36)))) ?
                  (8'ha7) : reg39[(4'h8):(2'h3)]);
              reg42 <= $signed(((7'h41) ?
                  (($signed(reg41) ?
                      $unsigned(wire33) : (reg40 && (8'hb9))) >> ((wire21 ?
                          reg40 : reg40) ?
                      $signed(wire17) : reg41)) : (8'hbb)));
            end
        end
      reg43 <= (|wire18[(4'ha):(4'ha)]);
      if ($signed((!reg36)))
        begin
          if ({(^reg37)})
            begin
              reg44 <= $signed((|$unsigned({(reg43 ? wire17 : reg36), reg36})));
            end
          else
            begin
              reg44 <= {(^$signed($unsigned(wire33)))};
              reg45 <= wire21;
              reg46 <= reg44;
              reg47 <= $unsigned((((-$unsigned((8'ha3))) ?
                      ((8'ha0) << (wire33 <<< wire33)) : $signed((8'hb2))) ?
                  ((wire19 ?
                      (wire17 ?
                          reg41 : reg45) : ((8'ha3) | (8'ha6))) << {(reg45 & wire33),
                      wire18[(2'h2):(1'h0)]}) : reg45[(4'hd):(4'ha)]));
            end
          reg48 <= (reg47[(3'h7):(3'h5)] + $signed(reg36[(2'h2):(1'h0)]));
        end
      else
        begin
          reg44 <= ((((&$signed(wire19)) ?
                      {$unsigned(reg37), wire19[(1'h1):(1'h1)]} : (((8'ha6) ?
                          reg45 : reg39) <= (reg48 ? reg47 : wire19))) ?
                  {({reg46, reg42} ?
                          (~|reg37) : (!(7'h44)))} : reg47[(1'h0):(1'h0)]) ?
              wire20[(2'h2):(1'h1)] : reg47);
          reg45 <= wire33[(4'hb):(3'h7)];
          reg46 <= reg44;
        end
      reg49 <= (!(7'h41));
    end
  assign wire50 = reg49;
  assign wire51 = reg49[(1'h1):(1'h0)];
  assign wire52 = ((7'h40) ~^ {(~^$signed((&wire19))), (8'hb1)});
  assign wire53 = (reg46 >= ({$unsigned((wire52 & reg45))} - {($signed(reg37) ?
                          (|wire19) : (8'h9e)),
                      $unsigned((reg41 ? wire33 : wire51))}));
  always
    @(posedge clk) begin
      reg54 <= (reg45[(4'hb):(3'h5)] - (((8'ha4) ?
          (^~$unsigned(reg46)) : wire35) + $signed((reg37[(1'h1):(1'h1)] ?
          reg45[(5'h12):(2'h2)] : (|(7'h41))))));
      reg55 <= ($signed(reg41) * (reg41[(2'h2):(1'h0)] ?
          ((wire53[(4'ha):(4'ha)] ^~ $signed((8'h9e))) ?
              reg42 : reg44[(4'hb):(4'hb)]) : {$unsigned((8'ha6)),
              $unsigned((wire33 - wire52))}));
      reg56 <= {$signed(wire50)};
      reg57 <= reg55[(3'h5):(3'h5)];
      reg58 <= (8'ha9);
    end
  module59 #() modinst76 (.y(wire75), .wire61(wire20), .wire60(reg57), .wire62(reg38), .clk(clk), .wire63(wire52));
  assign wire77 = wire21[(3'h5):(2'h2)];
  assign wire78 = reg44;
  always
    @(posedge clk) begin
      reg79 <= {($unsigned($unsigned(reg41)) ?
              $signed((~&{(8'hbc)})) : $signed((~^(reg39 ? (8'h9e) : reg37)))),
          (~|(wire18 && $unsigned({reg56, reg38})))};
    end
  assign wire80 = ($signed($signed((!wire52))) + $unsigned(wire78[(1'h1):(1'h1)]));
endmodule

module module59
#(parameter param74 = ((((8'hbc) | (|{(8'ha7)})) >= (((8'hba) ^~ (&(8'had))) ? (((8'hbd) * (8'ha0)) || ((8'hbd) >>> (8'ha6))) : (((8'ha0) <= (8'ha5)) ? ((8'ha2) ^ (8'hac)) : ((7'h40) ^~ (8'ha6))))) >= (~&{(8'hb3)})))
(y, clk, wire63, wire62, wire61, wire60);
  output wire [(32'h86):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire63;
  input wire signed [(4'hf):(1'h0)] wire62;
  input wire signed [(4'hf):(1'h0)] wire61;
  input wire [(3'h4):(1'h0)] wire60;
  wire signed [(4'h8):(1'h0)] wire73;
  wire [(5'h12):(1'h0)] wire72;
  wire [(4'h8):(1'h0)] wire71;
  wire [(4'hc):(1'h0)] wire70;
  wire signed [(4'he):(1'h0)] wire69;
  wire [(5'h11):(1'h0)] wire68;
  wire [(5'h13):(1'h0)] wire67;
  wire signed [(3'h7):(1'h0)] wire66;
  wire signed [(4'hd):(1'h0)] wire65;
  wire signed [(5'h11):(1'h0)] wire64;
  assign y = {wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 (1'h0)};
  assign wire64 = (^~(+wire60[(1'h1):(1'h1)]));
  assign wire65 = {(($signed(wire63[(2'h2):(1'h0)]) ?
                          wire60 : (^(wire60 && wire60))) >= wire60)};
  assign wire66 = wire61;
  assign wire67 = $signed(({$signed((wire66 == wire66)),
                          wire61[(4'ha):(1'h1)]} ?
                      (~^{wire61[(4'ha):(3'h7)], (|(8'h9d))}) : (~&(~^(wire61 ?
                          wire62 : wire61)))));
  assign wire68 = $signed($unsigned({(!wire65)}));
  assign wire69 = (((((wire63 << (8'h9e)) | $unsigned(wire61)) && wire62[(4'hf):(4'ha)]) ?
                      (~|(|(wire66 & wire66))) : {($signed(wire66) >> $signed(wire61)),
                          ((+wire67) ?
                              wire62 : (wire61 < wire63))}) - ((^(wire60[(2'h3):(1'h0)] <<< (!(8'hbb)))) << ($signed((wire61 || wire61)) <= wire67)));
  assign wire70 = ($unsigned((|wire67)) ?
                      ((8'hb7) ?
                          wire61 : {($unsigned((8'h9d)) ?
                                  (wire60 <= wire66) : $unsigned(wire61))}) : ((wire61[(4'hb):(2'h3)] ^~ (wire65[(4'ha):(2'h2)] ?
                              (~|wire63) : (wire68 ? wire64 : wire68))) ?
                          $unsigned((&((8'ha9) ?
                              wire60 : wire63))) : $signed(((7'h44) >>> wire66))));
  assign wire71 = (wire61 ?
                      ((wire65[(4'hd):(1'h1)] > wire70[(1'h1):(1'h1)]) ?
                          wire60[(2'h2):(2'h2)] : ($signed((^wire69)) ?
                              (wire62[(4'hf):(4'hf)] ^~ (|wire60)) : wire70[(3'h7):(1'h0)])) : wire69[(2'h2):(1'h1)]);
  assign wire72 = $signed(($unsigned((wire70[(4'h8):(1'h1)] ?
                      $signed(wire65) : $unsigned((8'hb9)))) <<< $unsigned((|wire60))));
  assign wire73 = wire67;
endmodule

module module22
#(parameter param32 = (({{((8'ha1) + (8'hbb)), ((8'hbf) ? (8'h9e) : (8'ha0))}, (8'ha5)} ? ((~^(~|(7'h44))) ^ ((&(8'hbb)) >= ((7'h41) ? (8'h9e) : (8'hb2)))) : (^~(((8'hb3) ? (8'hb9) : (8'ha6)) + ((8'hb4) != (8'hb5))))) | ({(8'hb3)} - {{((8'ha0) ? (8'ha0) : (8'had))}, {(!(8'hb3))}})))
(y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'h31):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire26;
  input wire signed [(5'h15):(1'h0)] wire25;
  input wire signed [(2'h3):(1'h0)] wire24;
  input wire [(4'ha):(1'h0)] wire23;
  wire signed [(4'h8):(1'h0)] wire31;
  wire [(5'h15):(1'h0)] wire30;
  wire [(4'ha):(1'h0)] wire29;
  wire [(2'h2):(1'h0)] wire28;
  wire [(3'h7):(1'h0)] wire27;
  assign y = {wire31, wire30, wire29, wire28, wire27, (1'h0)};
  assign wire27 = $signed(wire25);
  assign wire28 = wire24;
  assign wire29 = wire26[(2'h3):(1'h0)];
  assign wire30 = wire23[(2'h2):(1'h1)];
  assign wire31 = (~$unsigned((!wire27)));
endmodule
