module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h3d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire4;
  input wire [(5'h11):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire64;
  wire signed [(4'ha):(1'h0)] wire63;
  wire signed [(4'hc):(1'h0)] wire62;
  wire [(3'h7):(1'h0)] wire61;
  wire signed [(5'h14):(1'h0)] wire59;
  assign y = {wire64, wire63, wire62, wire61, wire59, (1'h0)};
  module5 #() modinst60 (wire59, clk, wire3, wire2, wire1, wire4);
  assign wire61 = (+(wire0 ?
                      wire4 : ({wire0,
                          wire3[(4'hb):(3'h6)]} << $unsigned(wire0))));
  assign wire62 = wire4;
  assign wire63 = ($unsigned((($signed(wire3) ?
                          (^~(7'h44)) : wire59[(3'h4):(3'h4)]) ?
                      $signed((~|wire3)) : wire4[(4'hb):(1'h1)])) >> wire2);
  assign wire64 = (wire63 ?
                      wire4[(5'h11):(3'h6)] : ($signed($signed(wire59[(5'h11):(4'he)])) || (^$unsigned((|wire61)))));
endmodule

module module5  (y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h52):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire9;
  input wire [(4'h8):(1'h0)] wire8;
  input wire [(5'h13):(1'h0)] wire7;
  input wire [(5'h15):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire58;
  wire [(5'h10):(1'h0)] wire25;
  wire [(5'h11):(1'h0)] wire11;
  wire [(4'he):(1'h0)] wire10;
  wire signed [(5'h15):(1'h0)] wire27;
  wire signed [(3'h5):(1'h0)] wire56;
  assign y = {wire58, wire25, wire11, wire10, wire27, wire56, (1'h0)};
  assign wire10 = $signed(wire7[(1'h1):(1'h1)]);
  assign wire11 = (~&wire6[(3'h7):(3'h4)]);
  module12 #() modinst26 (.wire17(wire10), .clk(clk), .wire16(wire6), .wire15(wire8), .wire14(wire11), .wire13(wire7), .y(wire25));
  assign wire27 = wire25[(2'h2):(2'h2)];
  module28 #() modinst57 (wire56, clk, wire9, wire8, wire27, wire6, wire25);
  assign wire58 = $signed((wire9 ? $signed(wire9) : wire25[(3'h5):(2'h3)]));
endmodule

module module28
#(parameter param55 = {(8'haa)})
(y, clk, wire33, wire32, wire31, wire30, wire29);
  output wire [(32'heb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire33;
  input wire [(4'h8):(1'h0)] wire32;
  input wire signed [(3'h5):(1'h0)] wire31;
  input wire signed [(3'h7):(1'h0)] wire30;
  input wire signed [(5'h10):(1'h0)] wire29;
  wire [(2'h2):(1'h0)] wire54;
  wire [(3'h6):(1'h0)] wire53;
  wire signed [(4'hd):(1'h0)] wire52;
  wire [(3'h6):(1'h0)] wire51;
  wire signed [(5'h15):(1'h0)] wire50;
  wire [(4'hd):(1'h0)] wire49;
  wire [(5'h10):(1'h0)] wire48;
  wire signed [(3'h5):(1'h0)] wire47;
  wire signed [(4'h8):(1'h0)] wire46;
  reg signed [(4'ha):(1'h0)] reg45 = (1'h0);
  reg [(2'h2):(1'h0)] reg44 = (1'h0);
  reg [(2'h2):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg40 = (1'h0);
  reg [(5'h15):(1'h0)] reg39 = (1'h0);
  reg [(4'hd):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg34 = (1'h0);
  assign y = {wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg34 <= (&$signed(($signed((^~(8'hb5))) ?
          wire29[(3'h6):(3'h5)] : $signed($unsigned((8'h9f))))));
      reg35 <= wire33[(2'h2):(2'h2)];
      reg36 <= $signed((-wire29[(4'hc):(1'h1)]));
      reg37 <= reg34[(4'h8):(3'h5)];
      if ($signed((^~wire29[(4'h8):(3'h5)])))
        begin
          reg38 <= wire33;
          reg39 <= reg36;
          reg40 <= (&wire32[(3'h5):(1'h0)]);
        end
      else
        begin
          if ($unsigned({$unsigned(($signed(reg37) <= $signed(wire33)))}))
            begin
              reg38 <= $unsigned(($signed({wire29,
                  (wire32 ? (8'hb4) : reg40)}) + (^~(&$signed((8'haa))))));
              reg39 <= $unsigned(($unsigned($unsigned((8'ha9))) ?
                  (!(~^$signed(reg40))) : ({(reg36 >> reg38),
                      (+reg34)} ^~ $unsigned((7'h41)))));
              reg40 <= ($unsigned($unsigned(($signed((8'haa)) >= {(8'ha9)}))) ?
                  (((reg36 ?
                      {wire30} : {reg39,
                          wire31}) && reg40[(1'h1):(1'h0)]) != reg34[(5'h11):(4'h9)]) : ($unsigned(({reg40} | reg35[(4'h8):(3'h5)])) ?
                      reg38 : (reg35 ~^ reg35)));
              reg41 <= (reg37 < wire33[(5'h11):(4'hc)]);
              reg42 <= $unsigned((reg38[(3'h5):(1'h1)] | ($signed({reg38,
                  wire33}) <= reg38[(4'hd):(3'h4)])));
            end
          else
            begin
              reg38 <= wire32[(3'h4):(2'h2)];
              reg39 <= $signed((^$signed($unsigned($unsigned(wire33)))));
              reg40 <= $unsigned(reg42[(4'h8):(3'h4)]);
              reg41 <= reg36[(5'h12):(5'h12)];
              reg42 <= ((reg42 ?
                      ($unsigned(reg41[(3'h7):(2'h2)]) == (reg42 <= {reg39,
                          reg35})) : reg38) ?
                  (^(^$unsigned(reg35[(3'h5):(3'h5)]))) : $unsigned(($signed({wire32,
                          reg39}) ?
                      reg41 : (8'hb4))));
            end
          reg43 <= (reg38 && $unsigned($unsigned((-wire30))));
          reg44 <= (^(8'hb9));
          reg45 <= $signed($signed(reg40[(4'h8):(3'h7)]));
        end
    end
  assign wire46 = wire31[(1'h1):(1'h1)];
  assign wire47 = (^~(~^((((8'hac) | reg41) ? $signed(reg38) : {reg35}) ?
                      reg41 : $signed($signed(reg45)))));
  assign wire48 = $signed(($unsigned(((&(8'h9c)) ?
                      ((8'ha1) ? wire47 : reg34) : (reg37 ?
                          wire47 : wire31))) << reg39[(5'h13):(4'hf)]));
  assign wire49 = (reg36[(4'h8):(3'h5)] - $signed($signed($unsigned({reg35}))));
  assign wire50 = reg36;
  assign wire51 = $signed((!reg44[(2'h2):(1'h0)]));
  assign wire52 = wire50[(4'h9):(4'h9)];
  assign wire53 = wire50[(4'h9):(2'h2)];
  assign wire54 = {(((+(wire49 == wire33)) ~^ $unsigned(reg44)) >> $unsigned((wire53[(3'h5):(2'h2)] <= reg34)))};
endmodule

module module12
#(parameter param24 = ((~&({(8'hb5), ((8'haf) ? (8'hba) : (8'hbe))} || {((7'h43) << (7'h40))})) ? (8'hb1) : (~|(^(((8'hbf) ? (8'hb2) : (8'hab)) >>> ((8'hb9) ? (8'hb2) : (8'hb0)))))))
(y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'h3b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire17;
  input wire [(5'h15):(1'h0)] wire16;
  input wire signed [(3'h7):(1'h0)] wire15;
  input wire [(5'h11):(1'h0)] wire14;
  input wire signed [(4'h8):(1'h0)] wire13;
  wire [(4'hb):(1'h0)] wire23;
  wire signed [(2'h3):(1'h0)] wire22;
  wire [(2'h3):(1'h0)] wire21;
  wire signed [(4'ha):(1'h0)] wire20;
  wire signed [(5'h11):(1'h0)] wire19;
  wire [(4'he):(1'h0)] wire18;
  assign y = {wire23, wire22, wire21, wire20, wire19, wire18, (1'h0)};
  assign wire18 = wire16;
  assign wire19 = wire18;
  assign wire20 = {wire18};
  assign wire21 = {wire13};
  assign wire22 = (((~|$signed($signed(wire20))) ?
                      ($unsigned(wire17) + wire17) : ((~|$signed(wire18)) * (~$signed(wire18)))) * ((&wire16[(5'h13):(5'h10)]) ?
                      ({wire13[(3'h4):(2'h2)]} ?
                          $unsigned(wire17[(4'hc):(3'h6)]) : wire13) : wire16));
  assign wire23 = wire17[(2'h2):(1'h0)];
endmodule
