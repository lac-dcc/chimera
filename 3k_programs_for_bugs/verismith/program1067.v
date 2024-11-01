module top
#(parameter param75 = (|((((8'ha9) >= ((7'h41) >>> (8'ha3))) ? (^~((8'h9c) ~^ (8'hb5))) : (((8'hb8) ? (8'ha6) : (8'hb6)) == (~(8'hb1)))) ? (!{((8'hae) == (8'hab))}) : (^{((8'haf) >> (7'h43)), (~(8'hbc))}))), 
parameter param76 = (~&{(-((param75 & param75) ? (param75 ? (8'ha7) : (8'ha6)) : param75)), param75}))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h111):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire0;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire3;
  wire signed [(4'he):(1'h0)] wire72;
  wire [(5'h13):(1'h0)] wire59;
  wire signed [(4'ha):(1'h0)] wire43;
  wire signed [(4'hd):(1'h0)] wire31;
  wire [(5'h12):(1'h0)] wire30;
  wire signed [(5'h15):(1'h0)] wire29;
  wire signed [(4'hf):(1'h0)] wire4;
  wire [(5'h15):(1'h0)] wire27;
  reg signed [(2'h3):(1'h0)] reg74 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg73 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg71 = (1'h0);
  reg [(4'he):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg68 = (1'h0);
  reg [(4'ha):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg65 = (1'h0);
  reg [(5'h13):(1'h0)] reg64 = (1'h0);
  reg [(4'he):(1'h0)] reg63 = (1'h0);
  reg [(3'h5):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg61 = (1'h0);
  assign y = {wire72,
                 wire59,
                 wire43,
                 wire31,
                 wire30,
                 wire29,
                 wire4,
                 wire27,
                 reg74,
                 reg73,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 (1'h0)};
  assign wire4 = $unsigned({((8'hb7) * ($signed(wire1) != (~|wire3)))});
  module5 #() modinst28 (.wire7(wire3), .wire6(wire1), .wire9(wire2), .clk(clk), .wire8(wire4), .y(wire27), .wire10(wire0));
  assign wire29 = wire3;
  assign wire30 = ((wire1 ?
                      ({wire2[(3'h7):(1'h1)]} - ((~(8'hb5)) << (wire4 >= wire4))) : (($signed(wire4) ?
                              wire3[(5'h10):(2'h3)] : $unsigned(wire29)) ?
                          {$signed(wire3),
                              wire27} : $unsigned({wire4}))) >= ((^~wire27) >> (^~(^wire0[(3'h7):(3'h7)]))));
  assign wire31 = (~wire1[(4'ha):(3'h6)]);
  module32 #() modinst44 (.wire35(wire4), .y(wire43), .wire33(wire29), .clk(clk), .wire34(wire1), .wire36(wire2));
  module45 #() modinst60 (.wire48(wire1), .wire49(wire27), .wire47(wire2), .y(wire59), .wire46(wire30), .clk(clk));
  always
    @(posedge clk) begin
      if (($signed({wire1[(2'h2):(2'h2)]}) ?
          $signed(wire59[(1'h1):(1'h1)]) : $signed({$signed((wire1 && wire29)),
              wire4[(4'h8):(1'h1)]})))
        begin
          if (wire1[(2'h3):(1'h0)])
            begin
              reg61 <= (((wire4[(4'hf):(4'h8)] * (|(^wire30))) + $unsigned((~^(~wire3)))) ?
                  (&(wire3 ?
                      ({(7'h42)} ?
                          wire59[(3'h4):(2'h3)] : wire30[(4'hc):(2'h2)]) : wire31[(2'h2):(1'h1)])) : ($unsigned(wire43) ?
                      ($signed(((8'hb5) ?
                          wire31 : wire0)) || $signed(wire4)) : (|$signed((wire29 ?
                          wire31 : wire0)))));
              reg62 <= $unsigned($signed((&{((8'hb2) ? wire29 : wire43),
                  reg61})));
              reg63 <= (8'h9d);
              reg64 <= $signed((|{(wire31 ? (&reg61) : (|wire29)),
                  ({wire4} << (wire3 ~^ reg61))}));
              reg65 <= ((|$unsigned(((wire30 ? wire31 : wire27) ?
                      wire43[(2'h2):(1'h0)] : wire3))) ?
                  ($signed((-wire1[(3'h4):(3'h4)])) ?
                      (wire1[(4'hc):(4'hc)] >= $unsigned(reg63[(4'hb):(4'hb)])) : (wire43[(1'h0):(1'h0)] < $signed((reg61 >>> wire29)))) : ((~^$signed(wire1[(5'h10):(4'hd)])) ?
                      (~&($unsigned(wire0) >> wire43)) : $signed({((8'hbf) | reg61),
                          wire30[(2'h2):(1'h1)]})));
            end
          else
            begin
              reg61 <= $signed((|(wire4 != $unsigned($unsigned(reg63)))));
              reg62 <= reg62[(3'h5):(1'h0)];
              reg63 <= ($unsigned((8'hbe)) >> $unsigned((reg61[(3'h7):(2'h3)] || wire3[(2'h2):(1'h0)])));
              reg64 <= $signed(wire3);
            end
          reg66 <= ((~wire4) || (8'h9f));
          reg67 <= wire0;
          reg68 <= (^$signed(wire0));
        end
      else
        begin
          reg61 <= ($signed($unsigned(($unsigned(wire31) | wire4))) == {{(^~$unsigned(wire2))},
              $unsigned(wire4)});
          reg62 <= $unsigned($signed((wire29 & $unsigned({wire27, wire31}))));
          if (wire4[(3'h5):(3'h5)])
            begin
              reg63 <= $unsigned((+{{reg64[(1'h1):(1'h0)], $signed((8'ha8))},
                  $signed($signed(reg62))}));
              reg64 <= wire2[(4'hf):(3'h4)];
              reg65 <= $signed({$unsigned(reg68[(1'h1):(1'h0)]),
                  (reg65[(4'hb):(3'h6)] ?
                      $signed((~|reg67)) : ($unsigned(wire30) >= (wire30 | wire30)))});
              reg66 <= wire30;
              reg67 <= $signed(reg66);
            end
          else
            begin
              reg63 <= $unsigned({(8'ha0),
                  (wire0 ?
                      $signed(reg65[(4'h9):(2'h2)]) : reg65[(4'hd):(2'h2)])});
              reg64 <= {(~|wire43)};
              reg65 <= ($unsigned($unsigned((~&(wire4 ? reg67 : wire2)))) ?
                  (!reg64) : ($unsigned(reg65) ~^ reg62));
              reg66 <= wire43;
              reg67 <= reg67[(4'h8):(3'h5)];
            end
          if ((^(($unsigned((wire43 ? reg64 : reg67)) ?
                  reg61[(2'h2):(2'h2)] : ((reg66 ? wire59 : wire3) ?
                      wire29 : wire0[(3'h5):(3'h4)])) ?
              $signed(({reg62, wire4} ?
                  (wire4 ? reg67 : reg61) : $unsigned(wire59))) : (~^wire2))))
            begin
              reg68 <= $signed({((reg66[(3'h4):(1'h0)] ?
                          $signed(wire1) : $signed(wire2)) ?
                      {(wire59 ? (8'ha9) : wire29), {reg62}} : {reg66})});
              reg69 <= $unsigned(((((reg65 ? wire27 : wire43) + {wire2,
                      reg66}) ?
                  (+{reg65,
                      reg65}) : reg68) & $unsigned($unsigned($signed(wire2)))));
            end
          else
            begin
              reg68 <= $signed(($signed(((+reg63) << (~^reg66))) ?
                  (^reg69) : wire4));
              reg69 <= $signed((~|$unsigned(reg66[(3'h4):(3'h4)])));
            end
          reg70 <= $unsigned(((wire2[(5'h10):(5'h10)] ?
                  $signed($signed(wire3)) : $signed((~|wire3))) ?
              reg61 : $unsigned({((8'hbb) ? reg69 : wire59), (^~wire31)})));
        end
      reg71 <= $unsigned($signed({((|wire3) + (wire3 <= reg70))}));
    end
  assign wire72 = (|$signed(wire43));
  always
    @(posedge clk) begin
      reg73 <= $signed(wire1[(2'h3):(1'h1)]);
      reg74 <= {(8'h9f), reg69};
    end
endmodule

module module45
#(parameter param58 = ((((+(~^(8'hbd))) && (((8'ha7) && (8'ha8)) + (&(8'hbd)))) << (((~|(8'hb0)) ? ((8'ha7) >>> (8'hac)) : ((8'hb2) ? (8'ha2) : (7'h43))) >> {{(8'hb3)}, ((7'h41) ? (8'hb8) : (7'h44))})) ? {(^(((8'haf) < (8'ha2)) <= ((8'hbe) ? (8'haf) : (8'h9f)))), ((~&((7'h40) >= (8'h9c))) ? {((8'h9c) != (8'ha2))} : (~(&(8'had))))} : (!((((8'ha9) >> (8'hbe)) ? ((8'hbd) ? (8'hbe) : (8'hb1)) : ((8'ha5) ? (8'hb0) : (8'hb8))) ? (~^(!(8'hbd))) : (!((8'h9c) >> (8'ha5)))))))
(y, clk, wire49, wire48, wire47, wire46);
  output wire [(32'h5f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire49;
  input wire [(3'h5):(1'h0)] wire48;
  input wire [(4'hf):(1'h0)] wire47;
  input wire signed [(5'h12):(1'h0)] wire46;
  wire [(3'h5):(1'h0)] wire57;
  wire [(4'he):(1'h0)] wire56;
  wire signed [(5'h12):(1'h0)] wire55;
  wire [(4'he):(1'h0)] wire54;
  wire [(4'he):(1'h0)] wire53;
  wire [(2'h2):(1'h0)] wire52;
  wire signed [(5'h11):(1'h0)] wire51;
  wire signed [(4'ha):(1'h0)] wire50;
  assign y = {wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 (1'h0)};
  assign wire50 = $signed($unsigned({(8'hb4), (~|wire49[(4'hb):(4'hb)])}));
  assign wire51 = {(~^$signed((~(-wire49)))), $signed(wire49)};
  assign wire52 = {(($unsigned((8'hb5)) + (^wire48[(1'h0):(1'h0)])) * {(wire47 | wire49[(4'hc):(2'h3)])})};
  assign wire53 = (^$unsigned($signed((~|(wire46 ? (8'ha7) : wire46)))));
  assign wire54 = $unsigned((+(((~wire52) ?
                      $signed(wire47) : (8'haa)) >>> $unsigned(wire50))));
  assign wire55 = {{{(~^wire47),
                              ((wire48 ^~ wire50) ?
                                  wire54[(4'hb):(3'h6)] : {wire46})},
                          $signed(((8'hae) << (wire54 == wire52)))}};
  assign wire56 = ((~$unsigned(($signed(wire50) ?
                      wire52 : $unsigned(wire50)))) & ((8'hb3) == wire55));
  assign wire57 = ($signed(({$signed((8'h9e))} || wire53)) ?
                      $unsigned($signed({(wire54 <= (8'hb0)),
                          wire55})) : wire46[(3'h5):(2'h2)]);
endmodule

module module32
#(parameter param41 = (~&(((((8'hb4) ^ (8'ha2)) ? ((7'h44) >= (8'hb9)) : ((8'h9d) ? (8'h9d) : (8'hbd))) != {((8'haf) >= (8'hb3)), ((7'h41) ? (8'ha4) : (8'haa))}) * (({(8'ha7)} | {(8'hb4), (7'h44)}) | (~|(!(7'h42)))))), 
parameter param42 = (~&(^param41)))
(y, clk, wire36, wire35, wire34, wire33);
  output wire [(32'h2e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire36;
  input wire [(4'hd):(1'h0)] wire35;
  input wire signed [(5'h12):(1'h0)] wire34;
  input wire [(3'h5):(1'h0)] wire33;
  wire [(4'h8):(1'h0)] wire40;
  wire [(5'h10):(1'h0)] wire39;
  wire signed [(4'hb):(1'h0)] wire38;
  wire [(4'ha):(1'h0)] wire37;
  assign y = {wire40, wire39, wire38, wire37, (1'h0)};
  assign wire37 = (^~(-wire33[(2'h2):(1'h1)]));
  assign wire38 = wire37[(2'h2):(1'h0)];
  assign wire39 = wire34;
  assign wire40 = wire39;
endmodule

module module5
#(parameter param26 = (~|(+{{(~&(8'h9e))}, {((8'ha4) ? (8'hb5) : (8'h9f))}})))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'hb3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire10;
  input wire signed [(3'h7):(1'h0)] wire9;
  input wire [(4'h9):(1'h0)] wire8;
  input wire signed [(5'h10):(1'h0)] wire7;
  input wire [(5'h12):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire22;
  wire signed [(5'h12):(1'h0)] wire21;
  wire signed [(4'he):(1'h0)] wire20;
  wire signed [(3'h7):(1'h0)] wire12;
  wire signed [(4'h9):(1'h0)] wire11;
  reg [(4'hb):(1'h0)] reg25 = (1'h0);
  reg [(3'h5):(1'h0)] reg24 = (1'h0);
  reg [(4'h9):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg18 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg14 = (1'h0);
  reg [(4'hb):(1'h0)] reg13 = (1'h0);
  assign y = {wire22,
                 wire21,
                 wire20,
                 wire12,
                 wire11,
                 reg25,
                 reg24,
                 reg23,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire11 = wire9;
  assign wire12 = (^~$signed($signed($signed((wire9 << wire11)))));
  always
    @(posedge clk) begin
      if (wire7)
        begin
          if ((^~wire7[(4'he):(4'hc)]))
            begin
              reg13 <= wire12[(2'h2):(1'h1)];
              reg14 <= wire10[(1'h1):(1'h0)];
              reg15 <= $unsigned($signed((|$signed(wire12[(1'h0):(1'h0)]))));
            end
          else
            begin
              reg13 <= $signed($signed(((wire7[(4'h9):(3'h4)] ?
                      {wire7} : $signed(wire8)) ?
                  reg15[(3'h6):(1'h1)] : (((8'hba) ?
                      wire10 : wire12) || (wire12 + reg15)))));
            end
          reg16 <= wire9[(1'h0):(1'h0)];
          reg17 <= (~&({{(reg16 ~^ reg14),
                  (reg14 & wire7)}} || $signed($signed((~&reg16)))));
          reg18 <= reg13;
          reg19 <= (~|{(+($unsigned((8'hbe)) <<< reg16[(5'h12):(3'h6)]))});
        end
      else
        begin
          reg13 <= {$unsigned(reg13)};
        end
    end
  assign wire20 = (+(|(-(wire10 ~^ {reg15}))));
  assign wire21 = reg14[(3'h6):(3'h5)];
  assign wire22 = reg14[(5'h11):(2'h2)];
  always
    @(posedge clk) begin
      reg23 <= (8'hbb);
      reg24 <= (($signed(wire21) ^ $signed($unsigned($signed((7'h40))))) < ($unsigned($signed($signed(reg23))) | wire20[(4'he):(2'h3)]));
      reg25 <= (((^$unsigned((~(8'ha9)))) ?
          wire22[(3'h4):(3'h4)] : ({$unsigned((8'hb2)),
              (&reg19)} * ($unsigned((8'hb7)) ?
              $signed(wire22) : (^~reg23)))) * wire20[(1'h0):(1'h0)]);
    end
endmodule
