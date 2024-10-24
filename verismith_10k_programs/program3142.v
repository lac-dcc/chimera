module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h15f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire0;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire3;
  wire signed [(3'h7):(1'h0)] wire69;
  wire [(5'h12):(1'h0)] wire68;
  wire signed [(2'h3):(1'h0)] wire67;
  wire [(5'h13):(1'h0)] wire10;
  wire signed [(5'h14):(1'h0)] wire11;
  wire signed [(3'h4):(1'h0)] wire65;
  reg signed [(5'h10):(1'h0)] reg4 = (1'h0);
  reg [(2'h3):(1'h0)] reg5 = (1'h0);
  reg [(5'h15):(1'h0)] reg6 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg12 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg14 = (1'h0);
  reg [(4'hb):(1'h0)] reg15 = (1'h0);
  reg [(3'h5):(1'h0)] reg16 = (1'h0);
  reg [(4'hf):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg19 = (1'h0);
  reg [(4'he):(1'h0)] reg20 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg21 = (1'h0);
  reg [(2'h2):(1'h0)] reg22 = (1'h0);
  reg [(4'hd):(1'h0)] reg23 = (1'h0);
  reg [(5'h15):(1'h0)] reg24 = (1'h0);
  reg [(5'h13):(1'h0)] reg25 = (1'h0);
  reg [(4'ha):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg27 = (1'h0);
  assign y = {wire69,
                 wire68,
                 wire67,
                 wire10,
                 wire11,
                 wire65,
                 reg4,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((wire1 - ({wire2} ?
          $unsigned({(wire2 ? wire2 : (7'h41)),
              $signed(wire3)}) : (^(&(-wire3))))))
        begin
          reg4 <= $signed(wire2);
          reg5 <= ($signed(reg4[(1'h1):(1'h1)]) ?
              ((|(^~wire0)) ?
                  (^{$signed(reg4)}) : reg4[(2'h2):(1'h1)]) : wire3[(3'h6):(1'h0)]);
          reg6 <= ($unsigned(((wire0 ?
                  (~|wire1) : (wire3 ? wire1 : reg4)) < wire2)) ?
              (^~{{$unsigned(wire0)}}) : wire3);
          reg7 <= {$signed(reg5[(2'h2):(1'h0)]), reg4};
          reg8 <= wire1[(3'h6):(3'h4)];
        end
      else
        begin
          reg4 <= $unsigned($signed((reg8 ?
              $signed(wire2[(3'h6):(1'h0)]) : ({reg4} ?
                  reg5[(1'h1):(1'h0)] : $unsigned(wire3)))));
          reg5 <= $signed(((wire1[(3'h4):(3'h4)] ?
                  (reg6[(4'ha):(1'h0)] ?
                      {reg4} : reg8[(1'h0):(1'h0)]) : $signed((reg4 ?
                      wire1 : (8'hbb)))) ?
              (~^(reg7 ^ $unsigned(reg8))) : reg6));
        end
      reg9 <= (((|$signed((~&wire1))) || (wire3[(3'h5):(3'h4)] & wire3)) ^~ wire3[(1'h1):(1'h0)]);
    end
  assign wire10 = $unsigned(($unsigned($unsigned($unsigned(reg8))) ?
                      {{{wire0}},
                          $unsigned(reg4[(3'h7):(3'h7)])} : (~$signed((!wire0)))));
  assign wire11 = {$unsigned($signed(((wire3 ? reg6 : reg4) ?
                          (wire3 ? reg7 : wire10) : reg5[(1'h1):(1'h0)])))};
  always
    @(posedge clk) begin
      if (((^((8'ha7) ?
              {$signed(wire1), wire0[(1'h1):(1'h0)]} : $unsigned((~^reg8)))) ?
          reg5 : ((&((+wire2) < wire1[(1'h1):(1'h1)])) - (!(^$signed((8'ha9)))))))
        begin
          reg12 <= ($signed(wire11) ?
              reg8[(5'h10):(5'h10)] : $signed($signed($signed(((8'ha6) ?
                  reg9 : reg4)))));
          reg13 <= (wire0 ~^ (reg5 ?
              (reg4 && {(^~wire3)}) : ($signed($signed(wire10)) ?
                  (^{(8'ha7), wire10}) : wire0[(1'h1):(1'h0)])));
          reg14 <= wire1;
          reg15 <= reg12;
          if ($unsigned((reg9[(3'h5):(2'h2)] && reg13[(3'h6):(1'h0)])))
            begin
              reg16 <= (~^(^(wire3 & wire10)));
              reg17 <= (+(~&{($unsigned((8'hb3)) ? {reg5} : $signed(reg5)),
                  $unsigned($unsigned(reg7))}));
              reg18 <= {(wire2 ? reg15 : {wire11}),
                  $signed($signed(($unsigned(wire0) ?
                      wire2 : ((8'ha7) <<< wire11))))};
            end
          else
            begin
              reg16 <= reg18[(4'he):(3'h7)];
              reg17 <= ($unsigned(((&(!reg6)) ? wire11 : (8'had))) ?
                  reg12 : (~|reg8));
              reg18 <= reg18[(1'h0):(1'h0)];
              reg19 <= $signed($signed($signed((8'hbb))));
              reg20 <= $unsigned((($signed((reg14 ?
                      reg16 : (8'ha6))) >= reg17) ?
                  reg14 : {(reg18 ? $unsigned((8'hb0)) : reg9)}));
            end
        end
      else
        begin
          if ($unsigned(($unsigned($signed((~|reg5))) >>> $unsigned((((7'h41) ?
                  (8'hb0) : reg15) ?
              (8'ha0) : reg16)))))
            begin
              reg12 <= $unsigned(((reg16 >>> {$unsigned(reg14),
                  reg8[(4'h8):(1'h1)]}) >= {((-wire3) ?
                      $signed(reg9) : $signed(reg15)),
                  (reg15 * (|(8'ha0)))}));
              reg13 <= {$unsigned((&$unsigned((reg19 ? reg4 : reg16))))};
              reg14 <= ({$unsigned(((reg6 ?
                      reg15 : wire11) || ((8'hbf) & reg12))),
                  wire2[(1'h1):(1'h1)]} * ($unsigned(reg20[(4'ha):(3'h5)]) > reg4));
              reg15 <= $unsigned((reg7[(2'h3):(2'h3)] != $signed((8'hbd))));
              reg16 <= ((wire0 ^~ wire1) << (~|{reg17[(4'ha):(1'h0)],
                  (reg15[(2'h2):(1'h1)] >>> (reg15 << reg16))}));
            end
          else
            begin
              reg12 <= reg7[(3'h5):(3'h4)];
              reg13 <= ({($unsigned({(7'h44)}) + wire11)} ^~ $signed($signed((!$unsigned((8'hb1))))));
              reg14 <= $signed($signed($unsigned((~^reg9[(1'h1):(1'h0)]))));
              reg15 <= {{(((reg19 << reg7) <<< (!reg9)) << (8'h9c))},
                  $signed($unsigned((~&reg6)))};
            end
          if ($signed((~&(wire11 ?
              ({reg4} ? reg4 : $signed(wire11)) : ($unsigned(reg18) ?
                  (8'ha7) : $signed(wire2))))))
            begin
              reg17 <= (~^reg6[(4'hb):(4'h8)]);
              reg18 <= wire2;
              reg19 <= $signed($signed((($signed(wire11) ?
                  (^reg20) : (+wire1)) < $signed((reg18 & (8'hac))))));
              reg20 <= $unsigned($unsigned(reg20[(2'h2):(2'h2)]));
            end
          else
            begin
              reg17 <= (^~$unsigned((wire0 ?
                  $signed((reg13 ? reg13 : wire1)) : wire1)));
              reg18 <= {(-$signed($unsigned(wire10[(4'h9):(3'h4)])))};
              reg19 <= ({$unsigned(wire11)} || reg4[(3'h6):(1'h1)]);
              reg20 <= $unsigned(reg19);
              reg21 <= reg18[(2'h2):(2'h2)];
            end
          if ((!(+(((wire1 ? (7'h41) : reg14) ?
                  (reg13 ? wire1 : reg15) : (^~wire1)) ?
              reg7[(3'h5):(3'h4)] : $signed((^~reg4))))))
            begin
              reg22 <= $unsigned(((reg15 ?
                      $unsigned((reg4 ? reg14 : (8'hb1))) : ($signed(reg21) ?
                          wire2[(2'h3):(2'h3)] : reg12[(1'h0):(1'h0)])) ?
                  wire3[(4'hc):(3'h6)] : {reg15[(4'hb):(3'h4)]}));
              reg23 <= {(reg16[(1'h1):(1'h1)] == reg7[(4'ha):(3'h4)])};
            end
          else
            begin
              reg22 <= (~&reg23[(1'h1):(1'h0)]);
              reg23 <= $unsigned(wire0[(1'h1):(1'h0)]);
              reg24 <= reg20[(2'h2):(2'h2)];
              reg25 <= reg8[(5'h13):(1'h1)];
              reg26 <= $unsigned($unsigned((reg18[(3'h6):(1'h1)] ?
                  wire10 : (~&$signed((8'hb5))))));
            end
          reg27 <= reg22;
        end
    end
  module28 #() modinst66 (.clk(clk), .wire31(reg27), .wire29(reg25), .y(wire65), .wire30(wire10), .wire32(reg14));
  assign wire67 = wire3;
  assign wire68 = (($unsigned($unsigned($signed(wire1))) ?
                          (~^((~^reg19) <<< (wire3 - reg15))) : reg15) ?
                      (reg18[(5'h10):(1'h0)] != (~&(|reg15))) : (reg17 ?
                          reg16 : wire1));
  assign wire69 = $unsigned(({$unsigned($signed((8'hba)))} ^~ reg9));
endmodule

module module28
#(parameter param63 = (^~((~({(8'hba), (8'hb9)} * ((8'hbc) ? (8'ha0) : (8'hba)))) << (((~|(8'ha5)) ? ((8'ha5) > (8'haa)) : ((8'ha3) ? (8'hae) : (8'h9c))) >= ((!(8'h9c)) <= (&(8'h9f)))))), 
parameter param64 = (|({({param63} == {param63})} ? (((^~param63) ? (param63 ? param63 : param63) : (!param63)) ? (param63 ? param63 : ((8'ha4) >> param63)) : (&(param63 ? param63 : param63))) : param63)))
(y, clk, wire29, wire30, wire31, wire32);
  output wire [(32'ha4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire29;
  input wire signed [(4'h8):(1'h0)] wire30;
  input wire [(5'h12):(1'h0)] wire31;
  input wire signed [(5'h12):(1'h0)] wire32;
  wire signed [(4'h9):(1'h0)] wire33;
  wire [(4'hd):(1'h0)] wire61;
  reg [(4'hf):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg36 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg37 = (1'h0);
  reg [(5'h13):(1'h0)] reg38 = (1'h0);
  reg [(5'h14):(1'h0)] reg39 = (1'h0);
  reg [(5'h13):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg41 = (1'h0);
  reg [(4'h9):(1'h0)] reg42 = (1'h0);
  reg [(4'hb):(1'h0)] reg43 = (1'h0);
  assign y = {wire33,
                 wire61,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 (1'h0)};
  assign wire33 = (7'h42);
  always
    @(posedge clk) begin
      reg34 <= (($unsigned(wire31) ? {wire32} : wire32) ?
          $signed((wire31[(4'h9):(2'h2)] ?
              wire33[(2'h3):(1'h1)] : wire29)) : ($signed(({(8'hbf)} == (wire31 ?
              wire33 : wire31))) || ($unsigned((wire30 <= (8'hbb))) ?
              $unsigned(wire29) : (wire31[(4'hd):(1'h1)] >>> wire33))));
    end
  always
    @(posedge clk) begin
      reg35 <= reg34[(1'h1):(1'h0)];
      reg36 <= wire30;
      if (($unsigned((~&reg35[(1'h1):(1'h0)])) ?
          {wire32, (~^wire32[(5'h11):(3'h4)])} : (($unsigned((wire30 ?
                  reg35 : (8'hb4))) ^ $signed(((8'ha0) ? wire31 : wire30))) ?
              wire30 : $unsigned((reg36[(3'h5):(3'h4)] ? wire33 : (~reg36))))))
        begin
          reg37 <= {reg34, $signed($unsigned(((~|reg34) ~^ $unsigned(reg36))))};
          reg38 <= $unsigned(wire29);
        end
      else
        begin
          if ((-$signed(((!{(8'ha9), reg34}) ?
              {(^wire30), (|reg36)} : (&$unsigned(wire32))))))
            begin
              reg37 <= wire33;
              reg38 <= $signed({(((wire29 <= wire33) >> $unsigned(wire31)) ?
                      (~((8'ha8) > reg34)) : {reg38[(2'h3):(2'h3)]})});
              reg39 <= $unsigned(wire31[(5'h12):(2'h2)]);
              reg40 <= wire32[(4'hc):(2'h2)];
              reg41 <= (~(8'h9f));
            end
          else
            begin
              reg37 <= $unsigned({$signed(((reg36 <<< reg41) ?
                      (wire30 >> (8'ha2)) : {reg40, reg36}))});
              reg38 <= $unsigned($signed({wire30[(4'h8):(1'h0)], (~^wire33)}));
              reg39 <= $signed($unsigned(wire31[(4'h9):(2'h2)]));
              reg40 <= (({$unsigned($signed((8'hb8)))} ?
                      (8'ha7) : $unsigned(reg39)) ?
                  (wire31[(4'hf):(1'h0)] ? reg38 : (-wire33)) : (wire33 ?
                      $signed((8'h9c)) : (^$signed(wire32))));
              reg41 <= $signed(((reg41[(3'h4):(1'h1)] ?
                  reg40 : {{reg35, reg37}, wire29}) ~^ (reg35 ?
                  $unsigned((reg37 && reg35)) : wire31[(4'hf):(3'h7)])));
            end
        end
      reg42 <= {({(reg36 - (wire32 ? (8'ha4) : reg36)),
              {{wire29, reg38}, reg36}} < reg36[(4'hb):(4'h8)])};
      reg43 <= reg36;
    end
  module44 #() modinst62 (.wire48(reg36), .clk(clk), .wire46(wire32), .y(wire61), .wire45(reg34), .wire47(reg43));
endmodule

module module44
#(parameter param60 = ((^((((8'hb1) << (8'hb0)) ? ((7'h42) >>> (8'hac)) : ((8'haa) ? (8'h9d) : (8'ha4))) == (((8'hb3) | (8'hb7)) ^~ (~&(8'haa))))) ? ((({(8'hac), (8'h9e)} & {(8'hbe)}) ? (-((8'hae) != (8'h9f))) : (((8'hbf) >>> (8'h9d)) ^~ (~|(8'hb5)))) ~^ ((7'h43) + (~((7'h41) ? (8'hac) : (8'h9f))))) : (~^((((8'haa) ^ (8'hae)) ? (|(8'hbe)) : (~|(8'h9d))) ? ({(8'ha1)} >= (^(8'hb4))) : (~&((8'h9c) | (8'hbc)))))))
(y, clk, wire48, wire47, wire46, wire45);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire48;
  input wire signed [(4'ha):(1'h0)] wire47;
  input wire signed [(4'h8):(1'h0)] wire46;
  input wire [(2'h2):(1'h0)] wire45;
  wire signed [(4'hf):(1'h0)] wire59;
  wire [(5'h10):(1'h0)] wire58;
  wire [(3'h4):(1'h0)] wire57;
  wire [(5'h15):(1'h0)] wire56;
  wire [(3'h5):(1'h0)] wire55;
  wire signed [(3'h5):(1'h0)] wire53;
  wire [(3'h5):(1'h0)] wire52;
  wire signed [(4'hc):(1'h0)] wire51;
  wire [(4'hc):(1'h0)] wire50;
  reg signed [(2'h2):(1'h0)] reg54 = (1'h0);
  reg [(3'h6):(1'h0)] reg49 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 reg54,
                 reg49,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg49 <= wire48[(4'he):(4'ha)];
    end
  assign wire50 = (~(wire46 > (^~wire48[(1'h0):(1'h0)])));
  assign wire51 = {$signed(($signed(wire47[(1'h1):(1'h0)]) >> reg49))};
  assign wire52 = $signed(((reg49[(3'h6):(2'h2)] ^ ($unsigned(wire47) * $unsigned(wire46))) ?
                      ({(wire48 ? wire50 : (7'h40)), $unsigned(wire51)} ?
                          $signed((wire46 ?
                              wire51 : wire46)) : $unsigned(wire45)) : (($signed(wire47) ?
                          wire47[(1'h1):(1'h1)] : $signed(wire45)) >> $unsigned(wire45[(1'h0):(1'h0)]))));
  assign wire53 = wire50;
  always
    @(posedge clk) begin
      reg54 <= $signed(wire53);
    end
  assign wire55 = reg49;
  assign wire56 = wire51[(4'hb):(4'h8)];
  assign wire57 = $signed((((+{wire56}) ?
                      ($unsigned(reg54) < wire56) : wire45[(1'h0):(1'h0)]) >>> $unsigned($unsigned((wire50 || wire46)))));
  assign wire58 = ({$signed(wire47[(4'h9):(3'h6)])} ?
                      (^(&(+{wire57}))) : (&{((-wire46) ?
                              (~|wire50) : (wire45 ? reg54 : wire53)),
                          (-wire46)}));
  assign wire59 = $signed((-reg49));
endmodule
