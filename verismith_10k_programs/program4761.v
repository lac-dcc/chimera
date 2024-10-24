module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h4e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire0;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire3;
  wire signed [(4'hb):(1'h0)] wire70;
  wire signed [(4'he):(1'h0)] wire69;
  wire signed [(5'h12):(1'h0)] wire4;
  wire signed [(5'h14):(1'h0)] wire5;
  wire [(4'he):(1'h0)] wire67;
  assign y = {wire70, wire69, wire4, wire5, wire67, (1'h0)};
  assign wire4 = (wire0[(3'h6):(1'h1)] > ((({wire2} && wire0[(1'h1):(1'h0)]) ?
                         $signed((wire3 >= wire0)) : wire3[(2'h2):(1'h0)]) ?
                     wire3 : {wire2[(1'h1):(1'h1)], wire1[(2'h3):(1'h0)]}));
  assign wire5 = $signed($unsigned((wire2[(1'h0):(1'h0)] ?
                     (wire3 ?
                         {wire2,
                             wire3} : $signed(wire0)) : $unsigned((wire2 - wire3)))));
  module6 #() modinst68 (wire67, clk, wire2, wire3, wire4, wire1, wire5);
  assign wire69 = wire5;
  assign wire70 = wire1[(4'h9):(3'h4)];
endmodule

module module6  (y, clk, wire7, wire8, wire9, wire10, wire11);
  output wire [(32'h91):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire7;
  input wire [(3'h6):(1'h0)] wire8;
  input wire signed [(3'h5):(1'h0)] wire9;
  input wire signed [(4'hf):(1'h0)] wire10;
  input wire signed [(5'h14):(1'h0)] wire11;
  wire signed [(4'hf):(1'h0)] wire66;
  wire signed [(4'hd):(1'h0)] wire65;
  wire signed [(5'h11):(1'h0)] wire64;
  wire signed [(4'hd):(1'h0)] wire12;
  wire signed [(4'ha):(1'h0)] wire13;
  wire signed [(4'hf):(1'h0)] wire14;
  wire signed [(4'hb):(1'h0)] wire16;
  wire [(5'h12):(1'h0)] wire17;
  wire signed [(4'hb):(1'h0)] wire62;
  reg signed [(5'h15):(1'h0)] reg15 = (1'h0);
  assign y = {wire66,
                 wire65,
                 wire64,
                 wire12,
                 wire13,
                 wire14,
                 wire16,
                 wire17,
                 wire62,
                 reg15,
                 (1'h0)};
  assign wire12 = (((($unsigned(wire11) ?
                      {wire10} : $unsigned((8'hac))) & (wire10[(2'h2):(1'h1)] ?
                      (-(8'hb7)) : (&wire9))) == (~|((wire7 ? wire8 : wire10) ?
                      wire11 : wire9))) <= $signed($signed($signed(wire10[(4'he):(1'h0)]))));
  assign wire13 = $unsigned($unsigned($signed(wire12[(2'h3):(1'h0)])));
  assign wire14 = wire13[(3'h5):(2'h3)];
  always
    @(posedge clk) begin
      reg15 <= (wire10[(3'h7):(2'h2)] ~^ wire13[(3'h4):(2'h2)]);
    end
  assign wire16 = wire13;
  assign wire17 = (+((((wire16 < wire7) ?
                          $signed(wire9) : reg15) <= $signed($unsigned(wire10))) ?
                      (~&{$unsigned(wire11)}) : (&$unsigned((-wire7)))));
  module18 #() modinst63 (.clk(clk), .wire21(wire17), .wire23(wire8), .wire22(wire12), .wire20(wire13), .wire19(wire10), .y(wire62));
  assign wire64 = (~|({{wire17}} && wire7[(1'h1):(1'h1)]));
  assign wire65 = $signed({{(((8'ha2) || wire16) << (wire7 * wire14))}});
  assign wire66 = ({wire8} ? $signed(wire10) : $unsigned(wire13));
endmodule

module module18
#(parameter param60 = (((8'hb8) && ((-(~(8'hb9))) * ((~^(8'ha6)) * ((8'hb6) * (8'ha8))))) + (+(8'ha1))), 
parameter param61 = ((^(~&{(^~(8'ha0)), (^~param60)})) << (({(+param60)} >>> param60) ? {(param60 ? (^param60) : {param60, param60})} : (param60 + (!(param60 == param60))))))
(y, clk, wire23, wire22, wire21, wire20, wire19);
  output wire [(32'h19f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire23;
  input wire signed [(4'hd):(1'h0)] wire22;
  input wire signed [(5'h12):(1'h0)] wire21;
  input wire [(4'h8):(1'h0)] wire20;
  input wire [(4'h8):(1'h0)] wire19;
  wire signed [(4'hd):(1'h0)] wire59;
  wire signed [(4'hc):(1'h0)] wire58;
  wire [(4'ha):(1'h0)] wire57;
  wire signed [(4'ha):(1'h0)] wire56;
  wire signed [(3'h4):(1'h0)] wire55;
  wire [(3'h7):(1'h0)] wire54;
  wire signed [(3'h6):(1'h0)] wire53;
  wire signed [(3'h5):(1'h0)] wire52;
  wire signed [(4'he):(1'h0)] wire51;
  wire signed [(5'h15):(1'h0)] wire50;
  wire [(4'h8):(1'h0)] wire49;
  wire signed [(5'h14):(1'h0)] wire48;
  wire [(5'h14):(1'h0)] wire44;
  wire [(4'he):(1'h0)] wire43;
  reg [(5'h10):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg41 = (1'h0);
  reg [(4'hd):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg39 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg38 = (1'h0);
  reg [(5'h10):(1'h0)] reg37 = (1'h0);
  reg [(5'h13):(1'h0)] reg36 = (1'h0);
  reg [(5'h11):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg33 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg32 = (1'h0);
  reg [(4'hc):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg30 = (1'h0);
  reg [(2'h3):(1'h0)] reg29 = (1'h0);
  reg [(5'h13):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg26 = (1'h0);
  reg [(5'h15):(1'h0)] reg25 = (1'h0);
  reg [(3'h5):(1'h0)] reg24 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire44,
                 wire43,
                 reg47,
                 reg46,
                 reg45,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((((^~wire21[(4'hb):(4'h9)]) == $signed((8'h9c))) ?
          ((8'h9e) >>> (^$signed($signed(wire22)))) : wire23))
        begin
          reg24 <= (|wire20);
          reg25 <= wire23[(2'h2):(2'h2)];
        end
      else
        begin
          reg24 <= ($unsigned(wire19) + $signed($unsigned($unsigned((~(8'ha2))))));
          reg25 <= ($unsigned((!((-(7'h41)) != (reg24 <= wire23)))) ?
              ($unsigned((wire22 - (~&(8'hae)))) ?
                  ($signed(wire22[(3'h4):(2'h3)]) ^ ($unsigned(wire21) ?
                      wire19[(3'h4):(2'h2)] : (^wire22))) : (~((wire23 ?
                      wire19 : (8'ha3)) || $signed(wire22)))) : $signed($unsigned((^$signed(wire21)))));
          if ({(8'haf), $signed(reg25)})
            begin
              reg26 <= (((&($signed(wire20) ?
                      (|reg25) : (~&reg25))) * ($unsigned(wire20) >> $unsigned(wire23[(1'h0):(1'h0)]))) ?
                  wire23[(1'h0):(1'h0)] : wire22);
              reg27 <= ($unsigned($signed(reg25)) ?
                  reg25 : reg26[(1'h1):(1'h1)]);
              reg28 <= wire21;
              reg29 <= reg25[(4'h8):(3'h5)];
              reg30 <= (~^(reg29 || wire23));
            end
          else
            begin
              reg26 <= {wire21};
              reg27 <= $signed($signed((((&reg25) ?
                  (reg29 ^~ reg27) : ((8'hb2) << reg25)) + ($signed(wire21) ?
                  (~|(8'hab)) : (wire23 >= wire22)))));
            end
        end
      if ($signed($signed($signed(wire19))))
        begin
          if ($signed((8'h9c)))
            begin
              reg31 <= ($signed($signed({$signed(reg25)})) >= wire22[(3'h4):(2'h2)]);
            end
          else
            begin
              reg31 <= (($signed(({reg27} != ((8'hb4) ^ reg28))) && (^$unsigned((wire19 | wire21)))) - {reg25,
                  (wire19[(2'h2):(2'h2)] ~^ ((-wire23) >= $unsigned(reg26)))});
              reg32 <= (reg29[(2'h2):(2'h2)] ?
                  reg24 : (reg24[(1'h0):(1'h0)] >= (((!wire22) == wire22) || (8'h9d))));
              reg33 <= ($signed(({$unsigned((8'hb7)), wire23[(2'h2):(1'h1)]} ?
                      reg31 : (|reg24))) ?
                  $signed((reg29[(2'h3):(2'h2)] ^ reg25)) : ($signed((reg27[(4'h8):(1'h0)] ?
                          (reg25 ? reg28 : wire19) : (reg32 ?
                              (8'had) : reg27))) ?
                      $signed($unsigned((+reg27))) : (wire21 >>> reg28[(3'h4):(3'h4)])));
              reg34 <= (8'hbd);
              reg35 <= (~&reg34);
            end
          reg36 <= reg25[(4'ha):(1'h0)];
          if ({(~&reg32)})
            begin
              reg37 <= reg33;
              reg38 <= $signed($signed((-$signed($unsigned(reg36)))));
              reg39 <= ($unsigned(($signed((reg36 >>> reg25)) & (~^$signed(reg38)))) ?
                  reg31[(4'ha):(3'h4)] : reg31[(2'h3):(1'h1)]);
            end
          else
            begin
              reg37 <= $unsigned(reg35);
              reg38 <= reg33[(4'hf):(4'hc)];
              reg39 <= {($signed(((reg36 * wire20) ?
                          {reg27} : {wire22, (8'had)})) ?
                      reg27 : $unsigned(reg31[(1'h0):(1'h0)])),
                  reg28[(4'ha):(3'h6)]};
              reg40 <= $unsigned($signed(reg37));
            end
          reg41 <= (&($signed(($signed(reg30) ?
              (reg35 ? reg38 : reg34) : (8'hba))) ~^ reg40[(4'ha):(4'h9)]));
        end
      else
        begin
          reg31 <= {reg31[(2'h2):(1'h1)],
              (~|(($signed(wire21) ?
                      (wire22 ? reg36 : reg29) : ((8'ha1) < reg33)) ?
                  (wire21 ?
                      $unsigned(reg32) : reg38[(2'h2):(2'h2)]) : (^reg25[(4'he):(4'he)])))};
          if ((reg34[(1'h0):(1'h0)] ? wire19 : wire20[(1'h1):(1'h0)]))
            begin
              reg32 <= $signed({{$unsigned((reg37 >>> reg25))}, (8'ha1)});
              reg33 <= $unsigned((($unsigned($unsigned(reg27)) ?
                      $unsigned(reg26) : $signed(reg26)) ?
                  ($unsigned({wire23}) >> reg26[(3'h4):(2'h3)]) : (wire22 >> ((~&reg26) >>> $unsigned(reg24)))));
              reg34 <= $signed((&reg24[(3'h4):(1'h1)]));
              reg35 <= reg35[(1'h1):(1'h0)];
              reg36 <= (!$unsigned($signed((+(8'hac)))));
            end
          else
            begin
              reg32 <= ($signed(reg41[(1'h1):(1'h0)]) ?
                  (reg27 ? wire22[(4'h9):(1'h1)] : $unsigned(reg33)) : (8'hb0));
              reg33 <= ((~|(($unsigned(reg38) ?
                  $unsigned((8'ha0)) : (~(8'hb0))) <= ({reg29} ?
                  reg36 : (&reg39)))) * ($unsigned(wire22[(4'hb):(3'h5)]) >>> reg25));
            end
          if ($signed($unsigned($signed($signed((~reg26))))))
            begin
              reg37 <= ($signed(reg31[(3'h5):(3'h4)]) ?
                  (wire23[(1'h1):(1'h1)] ?
                      reg26 : $signed(reg41)) : {(reg30 >>> reg35[(4'hd):(4'hd)]),
                      reg36});
            end
          else
            begin
              reg37 <= $unsigned($signed(reg27));
              reg38 <= $signed(((((wire23 ? wire23 : reg39) ~^ (reg41 ?
                  (8'ha4) : reg36)) || $unsigned($unsigned(reg34))) * $signed((reg30[(1'h1):(1'h1)] * (~&reg36)))));
              reg39 <= (|$unsigned($unsigned(wire23[(2'h2):(1'h1)])));
            end
        end
      reg42 <= {{$signed((8'haa))},
          (((~&wire19[(1'h1):(1'h0)]) ?
              $unsigned($signed((8'hba))) : reg31[(4'h8):(2'h2)]) != $signed(wire20[(1'h0):(1'h0)]))};
    end
  assign wire43 = (8'ha7);
  assign wire44 = $signed($unsigned($unsigned(reg26[(2'h3):(1'h0)])));
  always
    @(posedge clk) begin
      reg45 <= reg35;
      reg46 <= reg24;
      reg47 <= (((8'ha4) * (($unsigned(reg37) ? reg31 : $unsigned(reg45)) ?
          reg39[(3'h4):(2'h3)] : (reg33[(4'hd):(4'hc)] >> (|reg37)))) ^ wire44);
    end
  assign wire48 = ($unsigned((^~$signed($signed(reg27)))) ? wire43 : reg46);
  assign wire49 = $unsigned($unsigned($unsigned((wire22 ?
                      $unsigned(reg46) : $signed(reg41)))));
  assign wire50 = $unsigned($signed((~|(^reg45))));
  assign wire51 = reg45[(2'h3):(1'h1)];
  assign wire52 = $signed($unsigned(reg30));
  assign wire53 = reg37[(4'hc):(3'h6)];
  assign wire54 = (({((reg34 ^~ wire49) <= wire19)} ^~ ((!reg25) ?
                      $unsigned((reg27 ^~ reg41)) : $signed(((8'hb6) == reg34)))) < $signed((wire48 ?
                      ((wire49 ? reg41 : reg46) ?
                          wire21[(1'h0):(1'h0)] : reg33[(2'h3):(2'h3)]) : $unsigned(reg47[(2'h3):(1'h0)]))));
  assign wire55 = reg37;
  assign wire56 = ($unsigned((($unsigned(reg35) ? (reg29 | reg32) : (~&reg33)) ?
                      $signed($signed(wire54)) : ((7'h44) >= (wire53 >> (8'ha3))))) * $unsigned((wire55 ?
                      wire22 : $signed({reg29, reg46}))));
  assign wire57 = reg35[(4'h8):(3'h6)];
  assign wire58 = (+$unsigned(reg37));
  assign wire59 = $unsigned(reg35);
endmodule
