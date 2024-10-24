module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h1da):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire0;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire3;
  wire signed [(4'ha):(1'h0)] wire42;
  wire [(4'he):(1'h0)] wire30;
  wire [(5'h10):(1'h0)] wire29;
  wire signed [(4'hb):(1'h0)] wire28;
  wire signed [(3'h5):(1'h0)] wire27;
  wire [(5'h10):(1'h0)] wire26;
  wire [(5'h13):(1'h0)] wire11;
  wire signed [(3'h5):(1'h0)] wire24;
  reg signed [(4'hb):(1'h0)] reg55 = (1'h0);
  reg [(5'h15):(1'h0)] reg54 = (1'h0);
  reg [(5'h14):(1'h0)] reg53 = (1'h0);
  reg [(4'ha):(1'h0)] reg52 = (1'h0);
  reg [(3'h6):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg49 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg47 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg45 = (1'h0);
  reg [(3'h6):(1'h0)] reg44 = (1'h0);
  reg [(4'ha):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg41 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg40 = (1'h0);
  reg [(4'h9):(1'h0)] reg39 = (1'h0);
  reg [(5'h11):(1'h0)] reg38 = (1'h0);
  reg [(5'h11):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg36 = (1'h0);
  reg [(5'h10):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg34 = (1'h0);
  reg [(4'hd):(1'h0)] reg33 = (1'h0);
  reg [(5'h15):(1'h0)] reg32 = (1'h0);
  reg [(2'h2):(1'h0)] reg31 = (1'h0);
  reg [(2'h3):(1'h0)] reg10 = (1'h0);
  reg [(2'h2):(1'h0)] reg9 = (1'h0);
  reg [(5'h10):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg7 = (1'h0);
  reg [(4'hb):(1'h0)] reg6 = (1'h0);
  reg [(5'h12):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg4 = (1'h0);
  assign y = {wire42,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire11,
                 wire24,
                 reg55,
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
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((^~$unsigned(wire3[(3'h4):(2'h2)])))
        begin
          reg4 <= ((wire3 ? wire3 : wire0) ?
              $signed((^~($unsigned((8'ha9)) >> $signed(wire1)))) : ($signed($unsigned((wire0 ?
                  wire2 : (8'ha2)))) << $signed(wire0[(1'h0):(1'h0)])));
          reg5 <= (!{$unsigned((~|{wire3}))});
          reg6 <= $signed(wire2[(3'h7):(3'h4)]);
        end
      else
        begin
          reg4 <= $unsigned(((((wire3 ^~ reg4) ?
              (reg6 == reg6) : wire3) && ((wire0 ? (8'hae) : wire2) ?
              (|reg6) : (wire0 ? wire0 : wire2))) <<< {((wire0 ?
                  wire0 : reg5) - {wire1, wire3}),
              (&{wire2})}));
          if ($unsigned((wire1 << $unsigned($signed($signed(reg6))))))
            begin
              reg5 <= (&$unsigned((~|($signed(wire0) < (8'hbe)))));
              reg6 <= (((wire1 >> (reg4[(2'h2):(1'h1)] << (wire3 ?
                      wire1 : wire0))) ^~ (8'hab)) ?
                  wire1 : ((!(~&reg5[(1'h1):(1'h1)])) > $unsigned((&reg5[(3'h5):(1'h1)]))));
              reg7 <= ($signed((!$signed($signed(wire3)))) ?
                  wire2[(5'h11):(4'hc)] : wire3[(1'h0):(1'h0)]);
              reg8 <= (($unsigned(({reg7, wire2} < (wire2 ?
                      wire0 : wire3))) * reg5) ?
                  $unsigned($signed((8'hb7))) : ($signed(reg7) <<< $signed(wire3[(3'h5):(1'h0)])));
            end
          else
            begin
              reg5 <= wire1;
              reg6 <= $unsigned(reg7);
              reg7 <= $unsigned(reg6[(2'h3):(2'h2)]);
              reg8 <= {(~(~|reg7[(3'h5):(3'h5)]))};
              reg9 <= (!((+$signed((wire1 < wire1))) ?
                  ($unsigned(reg5) ?
                      $unsigned($signed(wire3)) : ($signed((8'hbb)) | $unsigned(wire1))) : {(-(~^wire3))}));
            end
        end
      reg10 <= ((-reg7[(4'h9):(4'h9)]) ?
          (wire1 ?
              wire0[(2'h3):(1'h0)] : wire2[(1'h0):(1'h0)]) : $signed(reg7[(1'h0):(1'h0)]));
    end
  assign wire11 = reg7;
  module12 #() modinst25 (.y(wire24), .wire14(reg4), .wire15(wire1), .wire16(wire11), .wire13(reg5), .clk(clk), .wire17(wire0));
  assign wire26 = $signed(reg9[(1'h1):(1'h0)]);
  assign wire27 = {wire2, reg7};
  assign wire28 = {(($unsigned((|reg7)) ? (-$unsigned((7'h43))) : wire11) ?
                          ({(wire1 ~^ (8'hb5)),
                              {reg4,
                                  reg5}} - wire2[(4'hc):(1'h0)]) : ($signed($signed(reg10)) ?
                              reg7[(2'h3):(2'h2)] : {{reg10}})),
                      ((!(wire3[(1'h0):(1'h0)] >= (reg5 < wire11))) ?
                          {(~|wire0[(4'h8):(3'h5)]), wire11} : $signed(reg5))};
  assign wire29 = (~^(~&((^~(~|wire28)) >= wire11[(3'h7):(3'h7)])));
  assign wire30 = wire24[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      if ((^(!(~&wire1))))
        begin
          reg31 <= wire11[(3'h4):(2'h2)];
          if ((~&wire24))
            begin
              reg32 <= (-(^(((wire11 || reg10) ?
                  (reg7 ?
                      wire2 : wire2) : ((8'hbf) != (8'hb0))) ^ ((wire30 ^~ reg6) ^ $unsigned(wire2)))));
              reg33 <= $signed($signed(wire0));
              reg34 <= $signed($unsigned($unsigned(($signed((8'hbc)) ?
                  reg10[(1'h1):(1'h0)] : $signed((8'hab))))));
              reg35 <= wire27;
              reg36 <= {(+reg31), reg33[(3'h7):(3'h7)]};
            end
          else
            begin
              reg32 <= (8'ha8);
              reg33 <= reg31;
              reg34 <= reg5;
            end
          reg37 <= $signed((|$unsigned(wire27)));
        end
      else
        begin
          reg31 <= {reg32,
              $unsigned($signed((reg4[(4'h8):(3'h7)] < {(7'h40), reg35})))};
          reg32 <= ({(reg31 == ($unsigned(reg9) ~^ (8'hbe))),
                  ($unsigned((~|(8'ha0))) ?
                      ($unsigned(reg37) ?
                          {reg5,
                              wire27} : $unsigned(wire28)) : reg4[(1'h0):(1'h0)])} ?
              ((~|$unsigned((reg8 ? reg36 : reg35))) && {(&(reg5 ?
                      wire24 : reg4))}) : $unsigned(reg37));
          reg33 <= reg37;
          reg34 <= reg31;
          reg35 <= $signed($unsigned(((wire0 <= {(7'h42)}) ?
              ({reg37, wire3} < {(8'hbe)}) : (^(~wire26)))));
        end
      reg38 <= reg10;
      reg39 <= wire11[(5'h10):(4'hf)];
      reg40 <= (|wire30);
      reg41 <= (~|((wire30[(3'h7):(1'h1)] << (wire11 ?
              $signed(wire3) : reg38)) ?
          (~($signed((7'h41)) + wire11[(4'ha):(4'ha)])) : $unsigned((wire2 ?
              {reg39, reg33} : (!reg37)))));
    end
  assign wire42 = wire11;
  always
    @(posedge clk) begin
      reg43 <= (~$unsigned({{(~^reg41), (reg8 ? wire2 : wire11)}}));
      reg44 <= (~&reg37[(3'h6):(1'h0)]);
      reg45 <= ({(reg36 ?
              {reg44, (reg35 ^~ reg41)} : reg40)} << wire11[(4'he):(4'he)]);
      reg46 <= $signed(reg6[(4'ha):(3'h5)]);
      reg47 <= $signed($unsigned(($signed((!reg43)) ^~ (reg33 ?
          reg35 : wire42))));
    end
  always
    @(posedge clk) begin
      reg48 <= $signed($signed($signed(wire11)));
      reg49 <= (~&({(~|$unsigned(reg43))} ?
          ($signed((-(7'h40))) ?
              reg31[(1'h0):(1'h0)] : wire42[(2'h2):(2'h2)]) : $signed(wire11[(5'h10):(3'h5)])));
      reg50 <= $unsigned($unsigned(wire30[(4'hd):(4'hd)]));
      reg51 <= $unsigned(reg47);
    end
  always
    @(posedge clk) begin
      reg52 <= $unsigned($unsigned(reg5[(4'h8):(2'h3)]));
      reg53 <= wire11;
      reg54 <= {($unsigned(((!reg36) ? (reg52 ^~ reg39) : (^reg8))) ?
              (8'ha2) : (!(^reg47[(3'h5):(1'h0)]))),
          {wire28, reg41[(5'h14):(4'hc)]}};
      reg55 <= {$signed(reg32), $unsigned($signed((~|(^~(8'ha5)))))};
    end
endmodule

module module12
#(parameter param22 = ((&{(((8'ha5) ? (8'hb0) : (8'hbc)) ? (~(8'hbb)) : ((8'ha4) >> (8'ha1))), (((8'hbe) ? (8'haf) : (8'hbc)) * (~&(8'ha8)))}) ? (((((8'hb0) ? (8'ha7) : (8'hae)) >= (8'hb9)) ^~ {((7'h40) != (8'ha4)), {(8'hb8)}}) != ({(~&(8'h9d)), ((8'hbd) ? (8'had) : (8'hb6))} ? ((&(8'haa)) ? {(8'h9c)} : ((8'hb5) ? (8'hac) : (8'ha1))) : (-(!(7'h42))))) : ((((~^(8'haf)) ? {(8'hb4), (8'ha2)} : (|(8'hb3))) && (!(~|(8'hbf)))) ? {(((8'hae) ^ (8'ha1)) ? ((8'haa) < (8'h9f)) : ((7'h40) - (7'h44))), ((~|(8'ha6)) ? {(8'hbf)} : (~(8'hb3)))} : ((((7'h44) > (7'h42)) & ((8'hbc) ? (8'ha9) : (7'h40))) ? {((8'ha0) ? (8'hb5) : (8'hb3))} : {((8'ha4) ? (8'h9c) : (8'haf))}))), 
parameter param23 = ((~^param22) ? (~&({param22} ? (param22 ? (+param22) : param22) : param22)) : ({(+param22), (param22 > (param22 ? param22 : param22))} ? {{{param22, (7'h41)}}} : (~|(param22 ? (param22 ? param22 : param22) : (~&param22))))))
(y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'h27):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire17;
  input wire [(2'h3):(1'h0)] wire16;
  input wire signed [(5'h15):(1'h0)] wire15;
  input wire signed [(4'hc):(1'h0)] wire14;
  input wire signed [(5'h12):(1'h0)] wire13;
  wire signed [(5'h13):(1'h0)] wire21;
  wire signed [(4'h9):(1'h0)] wire20;
  wire [(3'h5):(1'h0)] wire19;
  wire signed [(3'h5):(1'h0)] wire18;
  assign y = {wire21, wire20, wire19, wire18, (1'h0)};
  assign wire18 = ({((wire15[(4'hc):(3'h7)] != wire16[(2'h2):(1'h1)]) >> ($signed(wire17) | wire16[(2'h2):(1'h0)])),
                      (wire15[(4'h9):(3'h4)] ?
                          $signed((~|wire17)) : $unsigned(wire17))} > wire13[(4'hf):(1'h1)]);
  assign wire19 = wire15;
  assign wire20 = ((^$unsigned($unsigned($unsigned((8'ha4))))) && (wire13[(4'hf):(4'hf)] ?
                      ($signed((~^(8'hb8))) ?
                          $signed((~&wire16)) : $signed(wire16)) : ((8'haf) ?
                          {(!wire19), $signed(wire13)} : {wire18})));
  assign wire21 = ((wire19 ?
                      (wire14[(4'h8):(1'h0)] ?
                          (8'ha1) : wire15[(2'h2):(2'h2)]) : ((+wire13[(4'h9):(2'h3)]) ?
                          $signed((^wire20)) : $signed({wire13}))) && wire14);
endmodule
