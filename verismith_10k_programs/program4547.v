module top
#(parameter param68 = ({((((8'hb9) ? (8'hae) : (8'hb4)) ? {(8'ha9), (7'h44)} : (8'ha7)) ? {((8'had) ? (8'hb6) : (8'ha7)), ((8'ha9) <<< (7'h43))} : (8'hb7)), ((^~{(8'ha2)}) ? (&((7'h43) ? (7'h42) : (8'hbc))) : ((-(8'had)) ? ((7'h42) * (8'ha6)) : {(8'hb3)}))} && (((&(!(7'h42))) | (((8'ha1) - (8'hbf)) == (~|(8'ha6)))) > {{{(7'h40), (7'h40)}}, (((8'hb8) ? (8'hbe) : (8'ha4)) ? {(8'ha5), (8'ha9)} : (~&(8'hb0)))})))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hda):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire0;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire3;
  wire signed [(3'h6):(1'h0)] wire67;
  wire signed [(4'hc):(1'h0)] wire66;
  wire [(5'h12):(1'h0)] wire65;
  wire signed [(4'hb):(1'h0)] wire64;
  wire signed [(5'h12):(1'h0)] wire63;
  wire signed [(3'h6):(1'h0)] wire62;
  wire [(5'h10):(1'h0)] wire61;
  wire [(4'ha):(1'h0)] wire60;
  wire signed [(3'h6):(1'h0)] wire59;
  wire [(2'h3):(1'h0)] wire58;
  wire [(4'hf):(1'h0)] wire57;
  wire signed [(4'hb):(1'h0)] wire56;
  wire signed [(4'ha):(1'h0)] wire55;
  wire [(2'h2):(1'h0)] wire54;
  wire signed [(3'h6):(1'h0)] wire53;
  wire signed [(5'h11):(1'h0)] wire52;
  wire signed [(5'h10):(1'h0)] wire4;
  wire signed [(2'h3):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire50;
  assign y = {wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire4,
                 wire5,
                 wire6,
                 wire50,
                 (1'h0)};
  assign wire4 = wire2[(3'h4):(3'h4)];
  assign wire5 = (($unsigned({$unsigned(wire0), {(8'hb1), wire1}}) ?
                     $unsigned((wire3[(5'h10):(3'h4)] >> (wire0 ?
                         wire0 : wire4))) : (+(^~(wire4 ?
                         (8'ha8) : wire0)))) > $unsigned($signed((|((8'hba) ?
                     wire1 : wire0)))));
  assign wire6 = wire5[(1'h0):(1'h0)];
  module7 #() modinst51 (.wire10(wire2), .y(wire50), .wire9(wire4), .wire8(wire0), .clk(clk), .wire11(wire3), .wire12(wire5));
  assign wire52 = wire5;
  assign wire53 = wire4;
  assign wire54 = (wire50 ?
                      wire50 : {$unsigned(((wire5 ? wire52 : wire2) ?
                              (&wire5) : wire53[(3'h4):(3'h4)])),
                          $signed(($signed((8'haa)) ?
                              (~^wire1) : $unsigned(wire52)))});
  assign wire55 = wire2;
  assign wire56 = wire55[(1'h0):(1'h0)];
  assign wire57 = $signed(((wire3 >> ({wire56, (8'haa)} ?
                      (wire56 != wire56) : $unsigned((8'hb2)))) ~^ (|wire50)));
  assign wire58 = wire52;
  assign wire59 = (({$unsigned($unsigned((8'haa))),
                          (wire1[(4'hc):(2'h3)] ?
                              $unsigned(wire4) : wire50[(4'hb):(3'h5)])} || ($signed((~&wire5)) ?
                          $unsigned(wire53) : $signed($unsigned(wire56)))) ?
                      $unsigned($signed($signed((wire50 >> (8'hb4))))) : $unsigned(wire6[(4'hc):(3'h7)]));
  assign wire60 = $unsigned(((&$signed((wire54 ? (7'h44) : wire52))) ?
                      wire53 : {{$unsigned(wire6)}}));
  assign wire61 = $signed($signed(wire58));
  assign wire62 = $unsigned((wire57[(1'h0):(1'h0)] ?
                      (^(8'ha5)) : wire61[(4'he):(3'h7)]));
  assign wire63 = {wire54[(2'h2):(1'h0)]};
  assign wire64 = (-(((~^{wire54,
                      (8'ha6)}) || wire50[(4'hb):(3'h4)]) != (((wire1 != wire5) ?
                      (^~wire54) : wire59[(1'h1):(1'h0)]) ^ (&$unsigned(wire60)))));
  assign wire65 = {(~^$signed(($unsigned(wire64) == $unsigned((7'h42)))))};
  assign wire66 = $signed(($signed(((wire0 ^ wire2) ?
                      $signed(wire56) : ((8'h9d) - wire1))) || ((~^(wire64 >> wire57)) | wire4[(3'h6):(2'h3)])));
  assign wire67 = {(({(&(7'h40))} ?
                              ((wire58 ? wire54 : wire57) ?
                                  $signed(wire53) : wire55[(4'h9):(2'h2)]) : wire59[(3'h5):(1'h1)]) ?
                          (((wire66 ?
                              (8'ha9) : wire58) < (wire59 > wire52)) || wire61[(2'h2):(1'h1)]) : ((!wire53[(2'h3):(1'h1)]) ?
                              ($unsigned(wire54) ?
                                  (wire64 ?
                                      wire57 : wire60) : (wire53 & wire2)) : wire56))};
endmodule

module module7
#(parameter param49 = ((-(~^(&((8'h9c) ^ (8'hb0))))) ? ((((-(8'hb8)) ? (8'h9c) : (!(8'hbb))) << {((8'ha7) == (8'ha0))}) - (~&(((8'ha4) ? (8'h9f) : (8'hbb)) >>> (|(8'hba))))) : (~|{(((8'hac) ? (7'h40) : (8'ha3)) >= (~(8'hb0)))})))
(y, clk, wire8, wire9, wire10, wire11, wire12);
  output wire [(32'h4e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire8;
  input wire [(4'he):(1'h0)] wire9;
  input wire signed [(5'h14):(1'h0)] wire10;
  input wire [(5'h10):(1'h0)] wire11;
  input wire [(2'h3):(1'h0)] wire12;
  wire signed [(4'hd):(1'h0)] wire48;
  wire [(2'h3):(1'h0)] wire47;
  wire signed [(4'he):(1'h0)] wire46;
  wire [(4'he):(1'h0)] wire45;
  wire signed [(4'ha):(1'h0)] wire13;
  wire [(4'h8):(1'h0)] wire43;
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  assign y = {wire48, wire47, wire46, wire45, wire13, wire43, reg14, (1'h0)};
  assign wire13 = wire10[(2'h3):(2'h2)];
  always
    @(posedge clk) begin
      reg14 <= $signed($unsigned($signed(($signed(wire8) != $unsigned((8'hbb))))));
    end
  module15 #() modinst44 (.wire16(wire8), .wire18(wire11), .clk(clk), .y(wire43), .wire17(wire13), .wire20(wire9), .wire19(wire10));
  assign wire45 = wire11[(4'h8):(3'h6)];
  assign wire46 = wire10;
  assign wire47 = $signed(wire9);
  assign wire48 = wire12[(1'h0):(1'h0)];
endmodule

module module15
#(parameter param41 = ({{(((8'hb1) ? (7'h41) : (8'hb1)) >> ((7'h44) & (8'hbc))), ({(8'h9c), (8'hb3)} * ((8'ha3) >>> (8'hac)))}, {((-(8'hbb)) && ((8'hab) ? (8'h9c) : (8'ha7))), ((~|(8'hae)) > (+(8'hb4)))}} >> ((~{(8'hac), ((8'hbd) - (8'ha2))}) & (((~(8'ha6)) == (~|(7'h43))) ? (((8'hbc) <= (8'h9d)) | ((7'h42) == (8'h9f))) : (+((8'ha5) ? (8'ha4) : (8'ha4)))))), 
parameter param42 = (8'ha2))
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'hd0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire20;
  input wire signed [(5'h11):(1'h0)] wire19;
  input wire [(5'h10):(1'h0)] wire18;
  input wire [(2'h3):(1'h0)] wire17;
  input wire [(4'ha):(1'h0)] wire16;
  wire signed [(5'h12):(1'h0)] wire40;
  wire signed [(3'h4):(1'h0)] wire39;
  wire [(3'h7):(1'h0)] wire38;
  wire signed [(3'h6):(1'h0)] wire37;
  wire [(4'h9):(1'h0)] wire36;
  wire [(4'hb):(1'h0)] wire35;
  reg [(4'hc):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg32 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg31 = (1'h0);
  reg [(4'h9):(1'h0)] reg30 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg28 = (1'h0);
  reg [(5'h15):(1'h0)] reg27 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg25 = (1'h0);
  reg signed [(4'he):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg21 <= $unsigned((&$signed(wire19)));
    end
  always
    @(posedge clk) begin
      reg22 <= (8'h9d);
    end
  always
    @(posedge clk) begin
      if ($unsigned(((!(&$unsigned(wire18))) == wire17)))
        begin
          reg23 <= ((~|$unsigned(wire20[(1'h0):(1'h0)])) ?
              (($unsigned((wire20 ? wire20 : wire19)) ?
                      wire18[(1'h1):(1'h0)] : wire17[(2'h2):(1'h0)]) ?
                  $unsigned($signed(wire17)) : $signed(($signed((8'ha1)) ?
                      $unsigned(wire20) : ((8'hb2) != wire18)))) : (wire19 ?
                  (~^((reg22 ?
                      wire18 : (8'hb9)) >= $unsigned(wire19))) : (reg22[(2'h2):(1'h0)] ?
                      wire18[(4'hc):(3'h7)] : wire20[(2'h3):(2'h2)])));
          reg24 <= reg23[(2'h3):(1'h0)];
          reg25 <= (~|$unsigned(($signed((~&(8'ha3))) ^~ reg22)));
          reg26 <= wire18;
        end
      else
        begin
          reg23 <= (~&(wire17[(2'h3):(1'h0)] + reg22));
          reg24 <= (((((reg26 ? (8'hae) : reg26) ? {reg21} : (wire17 > reg22)) ?
                  reg26 : $signed({reg24})) ?
              wire20[(3'h4):(1'h1)] : (^$signed($unsigned(wire19)))) >> $unsigned(({$signed(reg24),
                  wire17[(2'h3):(2'h3)]} ?
              {reg22[(1'h1):(1'h1)]} : ((wire18 ? wire18 : wire17) ?
                  wire16 : reg25[(2'h3):(1'h0)]))));
          reg25 <= $unsigned(wire19);
          reg26 <= $unsigned((($unsigned(reg26[(2'h2):(2'h2)]) < $signed($signed(reg24))) ?
              $unsigned(((wire19 << wire16) ?
                  (wire17 ? reg23 : (8'h9f)) : (wire20 ?
                      reg21 : reg23))) : (8'hb4)));
          if ((^~(|$unsigned({(^(8'hae))}))))
            begin
              reg27 <= reg24[(4'hc):(3'h6)];
              reg28 <= (+{wire18, wire20});
              reg29 <= $signed(reg26[(2'h3):(1'h1)]);
              reg30 <= reg25;
            end
          else
            begin
              reg27 <= reg30[(4'h9):(3'h7)];
            end
        end
      reg31 <= $signed((reg28 ?
          reg21 : (($unsigned((8'hb0)) ?
              reg30[(1'h1):(1'h0)] : $signed(wire17)) >> $signed((reg26 ?
              reg24 : reg24)))));
      reg32 <= (~&$unsigned(wire19[(4'hb):(3'h4)]));
      reg33 <= (reg31 ~^ wire20[(3'h4):(3'h4)]);
      reg34 <= {(wire17[(2'h2):(2'h2)] ?
              ($signed($signed(reg33)) - (reg23 ?
                  reg28[(2'h2):(2'h2)] : (+(8'h9c)))) : (($signed(reg32) >= (wire18 != reg28)) ~^ ($unsigned(reg31) ?
                  $unsigned(wire19) : (reg30 ? (8'hba) : reg32))))};
    end
  assign wire35 = $unsigned(reg23);
  assign wire36 = (wire18 == ((~|reg21) ?
                      {$signed($signed((8'hae))),
                          $unsigned((reg31 ?
                              wire20 : reg22))} : ((wire18[(2'h3):(2'h3)] + $signed(reg24)) ?
                          reg25[(2'h2):(1'h1)] : (~^$signed((8'ha4))))));
  assign wire37 = (reg27[(5'h10):(4'h8)] ?
                      reg31 : ($signed(reg27[(2'h3):(1'h1)]) * {($signed(wire36) << (reg31 == reg25)),
                          $unsigned((reg27 ^~ wire36))}));
  assign wire38 = $signed((^(reg30[(2'h2):(1'h0)] ^ reg24[(4'h8):(2'h2)])));
  assign wire39 = reg33;
  assign wire40 = $signed(($signed(((~(8'ha1)) ?
                          (reg28 ? reg26 : reg27) : reg25)) ?
                      $signed($unsigned(reg33[(4'h9):(2'h2)])) : ($unsigned(reg25[(3'h4):(1'h0)]) <= (|reg30))));
endmodule
