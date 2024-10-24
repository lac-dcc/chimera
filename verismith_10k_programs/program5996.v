module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h143):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire98;
  wire [(5'h14):(1'h0)] wire97;
  wire [(2'h2):(1'h0)] wire96;
  wire signed [(5'h14):(1'h0)] wire95;
  wire [(5'h13):(1'h0)] wire91;
  wire [(4'hb):(1'h0)] wire89;
  wire signed [(4'hc):(1'h0)] wire72;
  wire [(2'h2):(1'h0)] wire71;
  wire signed [(2'h3):(1'h0)] wire70;
  wire signed [(3'h6):(1'h0)] wire68;
  wire [(2'h3):(1'h0)] wire67;
  wire [(4'h9):(1'h0)] wire56;
  wire signed [(4'hb):(1'h0)] wire55;
  wire [(5'h10):(1'h0)] wire53;
  reg signed [(5'h14):(1'h0)] reg94 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg93 = (1'h0);
  reg [(3'h5):(1'h0)] reg92 = (1'h0);
  reg [(3'h6):(1'h0)] reg69 = (1'h0);
  reg [(4'hf):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg64 = (1'h0);
  reg signed [(4'he):(1'h0)] reg63 = (1'h0);
  reg [(4'hd):(1'h0)] reg62 = (1'h0);
  reg [(4'hc):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg60 = (1'h0);
  reg [(4'hb):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg58 = (1'h0);
  reg [(4'h9):(1'h0)] reg57 = (1'h0);
  assign y = {wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire91,
                 wire89,
                 wire72,
                 wire71,
                 wire70,
                 wire68,
                 wire67,
                 wire56,
                 wire55,
                 wire53,
                 reg94,
                 reg93,
                 reg92,
                 reg69,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 (1'h0)};
  module4 #() modinst54 (wire53, clk, wire1, wire2, wire0, wire3);
  assign wire55 = $signed(({{$signed(wire2), (wire1 ~^ (8'hbc))},
                      wire2[(4'hc):(2'h3)]} & ({((8'ha8) * wire53),
                          wire0[(3'h6):(3'h4)]} ?
                      wire53[(3'h4):(2'h3)] : ($signed(wire2) ?
                          $unsigned(wire2) : (!wire3)))));
  assign wire56 = (wire0 | wire1);
  always
    @(posedge clk) begin
      if ($signed(wire2))
        begin
          if (wire56[(4'h9):(1'h1)])
            begin
              reg57 <= (((((wire55 ? wire53 : (8'ha8)) ?
                          ((8'haf) ? wire55 : wire1) : (wire56 == (8'hb5))) ?
                      $signed({wire3}) : $signed((wire0 ? wire56 : wire56))) ?
                  (((wire53 || wire0) ?
                          (wire55 == wire53) : wire56[(3'h5):(3'h5)]) ?
                      $signed((wire53 ?
                          wire55 : wire53)) : {wire2[(2'h2):(2'h2)]}) : ((wire55[(3'h5):(2'h2)] ^ $signed(wire2)) >> wire0[(1'h0):(1'h0)])) == ((!wire2[(4'h8):(3'h4)]) ?
                  (($unsigned(wire2) ?
                      wire2[(2'h3):(1'h0)] : wire53) * (wire0[(1'h1):(1'h1)] ?
                      $signed(wire53) : wire55[(3'h6):(1'h0)])) : wire53[(3'h7):(2'h2)]));
            end
          else
            begin
              reg57 <= (wire53[(3'h6):(3'h5)] ?
                  (wire3[(4'ha):(3'h4)] && (^{(wire2 ? (8'hbf) : reg57),
                      $unsigned(wire3)})) : (|(wire55 < $unsigned((~^wire1)))));
              reg58 <= wire0;
            end
          if (((|wire53) ?
              wire55 : ((($unsigned(wire55) ?
                  $unsigned(wire1) : $signed(wire53)) ^ $signed((wire53 ?
                  wire2 : wire0))) && $unsigned({{wire56}, wire0}))))
            begin
              reg59 <= $signed((8'hb4));
              reg60 <= $signed(wire56);
              reg61 <= (~&wire53);
              reg62 <= $signed((~((&$signed(wire56)) | wire1[(4'ha):(2'h2)])));
              reg63 <= (reg60 || wire3[(4'hd):(1'h1)]);
            end
          else
            begin
              reg59 <= $signed(reg57[(3'h7):(3'h5)]);
              reg60 <= wire2[(4'he):(2'h3)];
              reg61 <= reg62;
              reg62 <= ((+(((wire56 && reg63) != $unsigned(wire55)) ?
                  ($signed(wire53) ? $signed(reg62) : (!wire1)) : ((^~reg57) ?
                      $unsigned((8'ha2)) : wire2))) & reg61[(1'h0):(1'h0)]);
            end
          reg64 <= wire2;
          reg65 <= (^~wire3);
        end
      else
        begin
          reg57 <= $signed(reg63);
          reg58 <= ($signed($signed((reg65[(4'hf):(2'h2)] >>> reg61[(4'ha):(1'h1)]))) ?
              $unsigned($signed((!(reg63 == reg61)))) : wire55[(2'h3):(2'h2)]);
          reg59 <= (($signed((wire53[(4'hc):(3'h6)] ^ $unsigned((8'hb5)))) != $unsigned((wire0[(1'h1):(1'h1)] ?
                  $signed(wire3) : {wire2, reg64}))) ?
              wire55[(1'h0):(1'h0)] : (~|wire3));
          reg60 <= $signed($signed(({(wire56 ? reg64 : reg62),
                  $unsigned((8'h9c))} ?
              $signed((reg61 ? reg64 : reg65)) : (reg58 ?
                  (~&reg60) : (reg57 + reg57)))));
          reg61 <= $unsigned($signed(wire2));
        end
      reg66 <= (!reg57);
    end
  assign wire67 = $unsigned($unsigned(($signed((reg58 + (8'hbe))) ?
                      reg66[(4'hf):(4'hd)] : $signed((reg62 <= (8'ha7))))));
  assign wire68 = $signed(reg66);
  always
    @(posedge clk) begin
      reg69 <= wire2[(3'h4):(2'h2)];
    end
  assign wire70 = $signed($signed({(+$signed(wire68)), $unsigned({(7'h42)})}));
  assign wire71 = (7'h40);
  assign wire72 = ((^wire2[(3'h6):(3'h4)]) ?
                      $signed(wire67[(1'h1):(1'h1)]) : reg65[(5'h14):(2'h2)]);
  module73 #() modinst90 (wire89, clk, reg64, wire1, wire53, reg61);
  assign wire91 = reg58;
  always
    @(posedge clk) begin
      reg92 <= $unsigned((+((reg64[(2'h2):(2'h2)] >> reg61[(1'h0):(1'h0)]) >= ($unsigned(reg69) == (reg64 >>> reg60)))));
      reg93 <= (wire3 ?
          ((((wire72 ?
              wire91 : reg59) * wire2) & {(^~reg58)}) - (((reg60 >>> wire0) < (wire1 ?
                  reg59 : (8'hb6))) ?
              $unsigned((&wire56)) : wire53[(3'h6):(2'h3)])) : (!({reg62[(2'h2):(1'h1)],
              $unsigned((8'hbd))} - $unsigned((reg63 | wire91)))));
      reg94 <= $signed((wire71[(2'h2):(2'h2)] && (($signed(wire89) ?
              $signed(reg61) : reg63) ?
          reg65 : (reg60[(4'hb):(2'h2)] ^ {wire3, (8'ha5)}))));
    end
  assign wire95 = $unsigned({$unsigned(((reg92 < wire3) ?
                          $unsigned((8'hb6)) : (reg66 ? (8'hbe) : wire53)))});
  assign wire96 = $unsigned(($unsigned((reg58[(3'h5):(3'h4)] ?
                      $signed((8'ha9)) : (~|wire55))) >>> (wire3[(4'hc):(1'h1)] ~^ reg61[(4'hb):(3'h5)])));
  assign wire97 = $unsigned((~|wire67[(1'h1):(1'h0)]));
  assign wire98 = $signed((|wire1[(4'hf):(2'h2)]));
endmodule

module module73
#(parameter param87 = ((((8'hb8) << (-(!(8'h9e)))) ? (~^(8'haf)) : {((~&(8'ha6)) ? ((8'hbe) <= (8'ha5)) : (+(8'ha2)))}) ? ((+(((8'hb4) && (8'hb8)) * ((8'hb5) ? (8'ha3) : (8'hb7)))) >>> ((~(8'hb5)) >= (((8'ha5) ? (8'ha3) : (8'ha5)) > {(8'hba)}))) : (({((8'haf) == (8'hba)), (~|(8'ha9))} ? {(~&(7'h42))} : (((8'h9e) ? (7'h43) : (8'hbf)) | ((8'haa) ? (8'haa) : (8'ha1)))) >> ((^~((8'haf) ? (8'hb1) : (8'ha4))) ? ((~&(7'h40)) ? {(8'ha9)} : ((8'hbf) << (7'h42))) : {((8'ha0) & (8'ha7)), ((8'hb9) ? (8'hae) : (8'hb9))}))), 
parameter param88 = param87)
(y, clk, wire77, wire76, wire75, wire74);
  output wire [(32'h63):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire77;
  input wire signed [(3'h5):(1'h0)] wire76;
  input wire signed [(4'h9):(1'h0)] wire75;
  input wire signed [(3'h5):(1'h0)] wire74;
  wire [(2'h3):(1'h0)] wire86;
  wire signed [(4'he):(1'h0)] wire85;
  wire signed [(2'h3):(1'h0)] wire84;
  wire [(4'hb):(1'h0)] wire83;
  wire [(4'hd):(1'h0)] wire82;
  wire [(4'hb):(1'h0)] wire81;
  wire [(5'h10):(1'h0)] wire79;
  wire [(4'hb):(1'h0)] wire78;
  reg [(5'h10):(1'h0)] reg80 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire79,
                 wire78,
                 reg80,
                 (1'h0)};
  assign wire78 = $unsigned($signed(wire75));
  assign wire79 = $unsigned($signed((-((wire77 <<< wire78) <= (wire75 ?
                      wire78 : wire78)))));
  always
    @(posedge clk) begin
      reg80 <= $unsigned((~&$unsigned($signed(wire74))));
    end
  assign wire81 = (~&$unsigned(wire76));
  assign wire82 = wire78;
  assign wire83 = reg80[(4'hf):(4'hb)];
  assign wire84 = wire77[(4'hf):(4'hb)];
  assign wire85 = wire83;
  assign wire86 = $unsigned({(wire79 <= wire83), (~|wire79)});
endmodule

module module4
#(parameter param51 = (^~(8'hbc)), 
parameter param52 = (-param51))
(y, clk, wire5, wire6, wire7, wire8);
  output wire [(32'h8a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire5;
  input wire [(4'hc):(1'h0)] wire6;
  input wire [(4'h8):(1'h0)] wire7;
  input wire [(5'h15):(1'h0)] wire8;
  wire [(3'h7):(1'h0)] wire9;
  wire [(4'hf):(1'h0)] wire10;
  wire signed [(4'h9):(1'h0)] wire11;
  wire signed [(4'ha):(1'h0)] wire12;
  wire [(4'hd):(1'h0)] wire13;
  wire [(4'he):(1'h0)] wire14;
  wire signed [(3'h5):(1'h0)] wire15;
  wire [(5'h11):(1'h0)] wire16;
  wire signed [(4'ha):(1'h0)] wire17;
  wire [(4'ha):(1'h0)] wire47;
  reg signed [(4'hf):(1'h0)] reg50 = (1'h0);
  reg [(4'hc):(1'h0)] reg49 = (1'h0);
  assign y = {wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire47,
                 reg50,
                 reg49,
                 (1'h0)};
  assign wire9 = $unsigned({$signed(wire7)});
  assign wire10 = (((|wire5) ?
                          (((wire7 < wire9) ?
                              wire6 : $unsigned(wire5)) + $unsigned(wire9)) : (wire8 || (wire8 ?
                              (wire9 ? wire7 : wire6) : $unsigned(wire8)))) ?
                      wire9 : wire9[(3'h4):(1'h1)]);
  assign wire11 = $unsigned($signed($signed($unsigned(wire8))));
  assign wire12 = $unsigned({{(8'ha4), (-(wire6 ? (8'ha9) : (8'ha1)))},
                      (&((wire10 != wire10) ?
                          wire10[(3'h4):(3'h4)] : wire8[(4'he):(4'he)]))});
  assign wire13 = $unsigned(((~^wire5[(1'h1):(1'h1)]) ?
                      (wire5[(1'h0):(1'h0)] ?
                          ({wire8} ?
                              wire11 : wire8) : (+$unsigned(wire8))) : wire5));
  assign wire14 = $unsigned($unsigned(wire12));
  assign wire15 = (+(wire8 ?
                      {$unsigned(wire5[(1'h0):(1'h0)]),
                          $signed(wire9)} : ({$signed(wire12),
                          $signed(wire14)} << wire8)));
  assign wire16 = ($signed(($signed(wire10[(4'he):(1'h0)]) | wire8[(4'hf):(4'ha)])) + $signed($signed($signed((wire15 ?
                      wire14 : wire6)))));
  assign wire17 = ($unsigned(wire16[(4'h8):(3'h6)]) ?
                      wire8 : (wire11 || wire10));
  module18 #() modinst48 (.y(wire47), .wire21(wire16), .wire20(wire5), .wire23(wire9), .clk(clk), .wire19(wire7), .wire22(wire13));
  always
    @(posedge clk) begin
      reg49 <= (wire5 < (&(((wire5 ? wire47 : wire6) && wire47) || ((^~wire6) ?
          $unsigned(wire17) : $unsigned(wire13)))));
      reg50 <= (({((~|wire12) != (8'h9f)), $signed(((8'h9c) == wire9))} ?
              (wire5 ^~ wire13) : (8'haf)) ?
          $unsigned({$unsigned(wire14)}) : wire10[(3'h7):(1'h1)]);
    end
endmodule

module module18
#(parameter param45 = (8'ha2), 
parameter param46 = (8'h9e))
(y, clk, wire23, wire22, wire21, wire20, wire19);
  output wire [(32'h11b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire23;
  input wire [(4'hd):(1'h0)] wire22;
  input wire [(5'h11):(1'h0)] wire21;
  input wire [(5'h10):(1'h0)] wire20;
  input wire [(3'h4):(1'h0)] wire19;
  wire [(5'h15):(1'h0)] wire44;
  wire signed [(5'h15):(1'h0)] wire36;
  wire signed [(3'h6):(1'h0)] wire35;
  wire [(2'h3):(1'h0)] wire34;
  wire [(4'hd):(1'h0)] wire33;
  wire signed [(4'he):(1'h0)] wire32;
  wire signed [(5'h15):(1'h0)] wire31;
  wire signed [(5'h14):(1'h0)] wire30;
  wire signed [(5'h15):(1'h0)] wire27;
  wire signed [(5'h13):(1'h0)] wire26;
  wire signed [(5'h12):(1'h0)] wire25;
  wire signed [(2'h3):(1'h0)] wire24;
  reg signed [(4'h9):(1'h0)] reg43 = (1'h0);
  reg [(5'h13):(1'h0)] reg42 = (1'h0);
  reg [(5'h11):(1'h0)] reg41 = (1'h0);
  reg [(4'h8):(1'h0)] reg40 = (1'h0);
  reg [(4'ha):(1'h0)] reg39 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg28 = (1'h0);
  assign y = {wire44,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg29,
                 reg28,
                 (1'h0)};
  assign wire24 = {$signed(wire21[(2'h2):(2'h2)]),
                      ($signed(({wire22} ?
                              wire22 : (wire20 ? wire22 : wire22))) ?
                          $signed($signed($signed(wire22))) : wire21)};
  assign wire25 = ($signed({wire21[(4'hf):(3'h4)],
                      wire24[(1'h1):(1'h0)]}) < $unsigned(({(8'hab)} ^ (~|(wire20 >> wire22)))));
  assign wire26 = $unsigned(wire19);
  assign wire27 = $signed(wire26);
  always
    @(posedge clk) begin
      reg28 <= wire27;
      reg29 <= $unsigned(($unsigned(wire27) ?
          {(!(~wire21)),
              ($signed(reg28) | $signed(wire21))} : ((wire23[(1'h1):(1'h1)] < wire23) ?
              (!(wire26 ? reg28 : wire25)) : {wire21[(3'h6):(3'h4)]})));
    end
  assign wire30 = (!$signed(wire20));
  assign wire31 = (reg28 ?
                      $signed((~(+$unsigned(wire22)))) : $unsigned($signed($unsigned(wire27))));
  assign wire32 = $signed($signed({((wire26 ?
                          wire21 : reg28) ^ $unsigned(wire20))}));
  assign wire33 = {wire30};
  assign wire34 = reg28;
  assign wire35 = (8'hbc);
  assign wire36 = $signed($signed(({$unsigned(wire35)} ?
                      (wire20[(4'he):(2'h2)] ?
                          (reg29 >= wire32) : {wire24, wire35}) : wire32)));
  always
    @(posedge clk) begin
      reg37 <= ((~^wire33) >> $signed(wire23[(1'h0):(1'h0)]));
    end
  always
    @(posedge clk) begin
      if (($unsigned((($signed(wire34) & (!(7'h42))) ?
          $unsigned($signed(wire19)) : wire35)) >>> reg37))
        begin
          reg38 <= (((((wire32 ~^ wire34) > (reg37 ^~ wire25)) ?
                      ((^~(7'h44)) ?
                          (wire22 ?
                              wire36 : wire21) : reg29) : (^$unsigned(reg37))) ?
                  wire27 : wire33[(4'ha):(4'ha)]) ?
              (~|$signed(wire36[(4'hd):(4'hb)])) : wire24);
          if (($unsigned({$signed($unsigned(wire33)), wire34}) ?
              (^~(~|$unsigned((7'h43)))) : $signed((((~|(8'ha4)) * {wire35}) ?
                  $unsigned((wire23 ? wire30 : wire27)) : ((wire30 ?
                          wire23 : wire36) ?
                      ((8'ha6) < (8'hbb)) : (!reg28))))))
            begin
              reg39 <= (^~(&(^~$signed(reg38))));
              reg40 <= $unsigned({(wire24 ?
                      {(reg29 ?
                              wire30 : wire34)} : ($signed(reg29) * {wire25}))});
              reg41 <= wire30;
              reg42 <= $signed(((&(8'ha3)) ?
                  (((^~(8'ha7)) <= reg37) ?
                      reg41[(3'h4):(1'h0)] : reg39) : (reg29 ^~ ((reg39 ?
                      wire31 : wire21) << (reg40 | reg29)))));
              reg43 <= $signed($signed($unsigned((~^wire19))));
            end
          else
            begin
              reg39 <= wire24;
            end
        end
      else
        begin
          if (((({wire21[(4'he):(4'hb)], wire23} ?
                  ($unsigned(wire23) ?
                      (wire32 ?
                          wire26 : reg39) : $unsigned(wire36)) : ((~&wire34) ?
                      {reg43, wire30} : $signed(wire24))) ?
              $unsigned(wire31) : reg38) ^~ $signed((wire36 == ((wire31 | wire21) && (wire25 ?
              reg38 : wire24))))))
            begin
              reg38 <= reg28;
            end
          else
            begin
              reg38 <= $unsigned((~^((wire31[(4'h8):(3'h7)] != $unsigned(wire22)) ~^ ($signed(wire22) - (wire19 < wire23)))));
              reg39 <= wire33;
              reg40 <= reg39;
            end
          reg41 <= $signed((!(-wire23[(2'h3):(2'h3)])));
          reg42 <= (-($signed(wire33) ?
              ((reg38[(1'h0):(1'h0)] * (8'hbb)) ?
                  ($unsigned(wire24) ?
                      $unsigned(reg38) : {wire27,
                          reg28}) : reg29[(2'h2):(1'h0)]) : ($signed($signed(reg38)) ?
                  ($unsigned(wire20) ?
                      (wire22 - wire20) : reg29[(4'h8):(1'h0)]) : reg37[(3'h5):(2'h3)])));
        end
    end
  assign wire44 = $unsigned($unsigned((reg37[(4'hc):(3'h4)] ?
                      ($signed((8'hb6)) ?
                          wire32 : $signed(reg40)) : $unsigned($unsigned(wire30)))));
endmodule
