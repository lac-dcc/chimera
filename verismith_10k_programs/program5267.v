module top
#(parameter param82 = ((~|((((8'had) & (8'hac)) <<< ((8'ha7) < (8'hbe))) ? {((8'hae) << (8'hac))} : (^((7'h43) ? (8'hb9) : (8'hba))))) ? (|(8'hb8)) : (((((7'h44) <<< (8'hba)) ? ((8'hbb) + (8'hbe)) : (&(8'hbd))) ~^ (~|(^~(8'hb9)))) ? (+(-((8'ha8) ? (8'hb7) : (8'hb4)))) : (-((-(8'hb3)) - (8'ha0))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h5f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire [(3'h5):(1'h0)] wire81;
  wire signed [(4'h9):(1'h0)] wire80;
  wire signed [(3'h4):(1'h0)] wire78;
  wire signed [(4'h8):(1'h0)] wire8;
  wire [(5'h15):(1'h0)] wire7;
  wire signed [(4'hc):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire5;
  wire signed [(4'he):(1'h0)] wire4;
  assign y = {wire81,
                 wire80,
                 wire78,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 (1'h0)};
  assign wire4 = wire0[(1'h0):(1'h0)];
  assign wire5 = wire1;
  assign wire6 = (!(($signed((wire2 ? wire1 : wire4)) ?
                     wire4 : $unsigned(((8'h9c) ?
                         wire1 : (8'hbb)))) != wire0[(5'h11):(1'h0)]));
  assign wire7 = wire5[(5'h12):(2'h3)];
  assign wire8 = wire5;
  module9 #() modinst79 (wire78, clk, wire0, wire6, wire7, wire1);
  assign wire80 = $unsigned({wire78[(3'h4):(2'h2)], wire7});
  assign wire81 = {$unsigned((~$signed(wire2))), wire8[(3'h6):(3'h4)]};
endmodule

module module9
#(parameter param76 = {(8'ha3), (&({{(8'hb2)}, {(8'ha6)}} ? (8'ha8) : {((8'hb9) ? (8'hbb) : (8'haa))}))}, 
parameter param77 = ((8'hb4) ? param76 : param76))
(y, clk, wire13, wire12, wire11, wire10);
  output wire [(32'hbf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire13;
  input wire [(4'hc):(1'h0)] wire12;
  input wire signed [(5'h15):(1'h0)] wire11;
  input wire [(4'he):(1'h0)] wire10;
  wire signed [(5'h13):(1'h0)] wire74;
  wire [(5'h12):(1'h0)] wire26;
  wire signed [(5'h15):(1'h0)] wire25;
  wire signed [(4'he):(1'h0)] wire24;
  wire signed [(5'h13):(1'h0)] wire23;
  wire signed [(4'hd):(1'h0)] wire19;
  wire [(4'h8):(1'h0)] wire18;
  wire signed [(4'hc):(1'h0)] wire17;
  wire [(3'h6):(1'h0)] wire16;
  wire [(3'h4):(1'h0)] wire15;
  wire [(5'h11):(1'h0)] wire14;
  reg signed [(5'h11):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg22 = (1'h0);
  assign y = {wire74,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 reg20,
                 reg21,
                 reg22,
                 (1'h0)};
  assign wire14 = wire11[(2'h3):(1'h0)];
  assign wire15 = ({$signed($signed((~wire14))), wire14} ?
                      (~^($unsigned(wire10) ?
                          ((wire10 ? wire10 : wire14) ?
                              $signed(wire14) : wire11) : (~|wire11[(2'h3):(2'h3)]))) : (|$unsigned($signed(wire12[(1'h0):(1'h0)]))));
  assign wire16 = ((8'ha2) <<< wire13[(2'h2):(2'h2)]);
  assign wire17 = wire15;
  assign wire18 = (wire17[(3'h4):(3'h4)] | $unsigned($signed((wire16 | (wire10 & wire16)))));
  assign wire19 = (wire11 <= (8'hb6));
  always
    @(posedge clk) begin
      reg20 <= wire16[(2'h2):(2'h2)];
      reg21 <= $signed((wire11[(2'h2):(1'h0)] ?
          {wire12} : {{(reg20 ? wire12 : wire17), (wire16 * wire15)}}));
      reg22 <= $signed((wire13[(1'h0):(1'h0)] == wire11));
    end
  assign wire23 = wire12;
  assign wire24 = wire14[(1'h1):(1'h1)];
  assign wire25 = $unsigned((8'hb6));
  assign wire26 = wire23;
  module27 #() modinst75 (wire74, clk, wire12, reg20, wire24, wire11, wire18);
endmodule

module module27  (y, clk, wire32, wire31, wire30, wire29, wire28);
  output wire [(32'h21e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire32;
  input wire [(5'h11):(1'h0)] wire31;
  input wire signed [(4'h8):(1'h0)] wire30;
  input wire signed [(5'h15):(1'h0)] wire29;
  input wire signed [(4'h8):(1'h0)] wire28;
  wire [(3'h7):(1'h0)] wire73;
  wire signed [(5'h12):(1'h0)] wire72;
  wire signed [(5'h13):(1'h0)] wire71;
  wire signed [(3'h5):(1'h0)] wire70;
  wire [(4'hd):(1'h0)] wire69;
  wire [(4'h9):(1'h0)] wire67;
  wire [(4'hd):(1'h0)] wire66;
  wire signed [(5'h11):(1'h0)] wire63;
  wire signed [(2'h3):(1'h0)] wire62;
  wire signed [(4'h8):(1'h0)] wire61;
  wire [(5'h14):(1'h0)] wire60;
  wire signed [(4'hb):(1'h0)] wire59;
  wire signed [(5'h13):(1'h0)] wire58;
  wire [(4'hb):(1'h0)] wire57;
  wire [(4'ha):(1'h0)] wire53;
  wire signed [(5'h14):(1'h0)] wire52;
  wire signed [(4'ha):(1'h0)] wire51;
  wire [(5'h12):(1'h0)] wire33;
  reg [(5'h11):(1'h0)] reg68 = (1'h0);
  reg [(5'h13):(1'h0)] reg65 = (1'h0);
  reg [(5'h13):(1'h0)] reg64 = (1'h0);
  reg [(5'h13):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg49 = (1'h0);
  reg [(5'h13):(1'h0)] reg48 = (1'h0);
  reg [(4'hd):(1'h0)] reg47 = (1'h0);
  reg [(4'ha):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg45 = (1'h0);
  reg [(5'h13):(1'h0)] reg44 = (1'h0);
  reg [(5'h12):(1'h0)] reg43 = (1'h0);
  reg [(4'hc):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg40 = (1'h0);
  reg [(2'h3):(1'h0)] reg39 = (1'h0);
  reg signed [(4'he):(1'h0)] reg38 = (1'h0);
  reg [(5'h13):(1'h0)] reg37 = (1'h0);
  reg [(4'h8):(1'h0)] reg36 = (1'h0);
  reg [(3'h4):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg34 = (1'h0);
  assign y = {wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire67,
                 wire66,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire53,
                 wire52,
                 wire51,
                 wire33,
                 reg68,
                 reg65,
                 reg64,
                 reg56,
                 reg55,
                 reg54,
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
                 reg36,
                 reg35,
                 reg34,
                 (1'h0)};
  assign wire33 = {(($unsigned(((8'hba) ? wire32 : wire31)) ?
                          $signed($unsigned(wire31)) : ($signed(wire30) ^ wire29)) <<< wire32)};
  always
    @(posedge clk) begin
      reg34 <= wire33;
      if ((((wire33[(4'h9):(2'h3)] ?
          wire28 : (8'hb6)) == $signed(wire32)) >>> $signed({{(~^reg34),
              (7'h41)}})))
        begin
          if ((({((wire32 > wire31) ? $signed(wire31) : wire32[(2'h2):(1'h0)]),
                  (-$signed(wire33))} <<< wire31[(2'h3):(2'h2)]) ?
              wire33 : ($unsigned(wire31) * (($signed(reg34) ?
                  $signed(wire33) : (8'ha9)) > wire33[(1'h1):(1'h0)]))))
            begin
              reg35 <= (((|{(wire30 ?
                          wire31 : wire29)}) >>> (reg34[(3'h7):(2'h2)] ?
                      (|$unsigned(reg34)) : $signed((~|wire30)))) ?
                  (^($unsigned((!wire30)) ?
                      reg34[(2'h2):(1'h1)] : {(wire30 ? (8'hb2) : (8'haa)),
                          $signed(wire32)})) : {(~|{wire31[(5'h10):(2'h3)],
                          (wire32 ? (7'h40) : wire29)})});
              reg36 <= $unsigned(wire29);
              reg37 <= $signed(({$signed((wire31 < wire31))} << $signed({(|wire29)})));
            end
          else
            begin
              reg35 <= ((reg37[(4'hf):(3'h5)] ?
                      $unsigned(((reg36 <<< reg37) ?
                          reg34[(4'ha):(3'h6)] : $unsigned(wire28))) : {$signed((wire28 >= wire29)),
                          $signed(wire33[(3'h6):(1'h1)])}) ?
                  ($signed((wire29 >>> (wire28 ? wire33 : wire30))) ?
                      (^($unsigned(wire33) || {reg36})) : wire30) : $signed((^~(reg36[(2'h2):(1'h1)] != (~(8'hb9))))));
              reg36 <= (|reg34);
              reg37 <= ({{($signed(wire33) ? reg36[(2'h3):(2'h2)] : wire30),
                      $signed((wire28 * reg34))},
                  wire29} + ((&wire32) >= ($unsigned(wire29[(3'h6):(2'h2)]) * (wire31 ?
                  $unsigned(reg35) : (reg35 ? wire28 : reg36)))));
              reg38 <= $signed(reg37[(3'h4):(3'h4)]);
            end
          reg39 <= wire29[(4'he):(4'ha)];
        end
      else
        begin
          reg35 <= ((+{wire29[(3'h7):(3'h5)]}) ~^ $unsigned($unsigned((wire33 && $unsigned(reg37)))));
          reg36 <= ($unsigned({$signed({reg39,
                  wire31})}) >= ($unsigned(wire29[(4'h9):(4'h9)]) ?
              {$unsigned((wire32 ? reg35 : wire32)),
                  wire32} : (wire32[(1'h1):(1'h1)] ?
                  $signed({wire28,
                      (7'h40)}) : $signed(wire32[(1'h0):(1'h0)]))));
          if ({$unsigned({reg36, $signed($unsigned((8'hae)))}),
              $signed((reg36[(2'h2):(1'h0)] ?
                  {wire31[(5'h10):(5'h10)]} : wire33))})
            begin
              reg37 <= (!reg38);
              reg38 <= wire31[(4'h9):(3'h5)];
            end
          else
            begin
              reg37 <= ({reg39,
                  (reg37 ?
                      ($unsigned(reg35) ? reg37 : (reg37 <= reg37)) : {reg35,
                          $unsigned(wire33)})} ^~ reg38);
              reg38 <= reg39;
              reg39 <= (wire30 ?
                  $signed({(~wire29[(4'h9):(3'h6)]),
                      $unsigned($signed(wire31))}) : ($signed(reg35) - {($signed(wire32) <<< (reg39 ?
                          wire30 : reg35))}));
            end
          reg40 <= (((~(~^reg36[(2'h2):(1'h0)])) << ($unsigned(reg35) == (wire28 ?
                  wire32 : $signed(wire30)))) ?
              $signed($unsigned(((wire29 || reg36) ?
                  wire30[(3'h6):(3'h5)] : (8'hb8)))) : $signed(wire31[(1'h1):(1'h1)]));
          reg41 <= $signed((reg38[(4'hb):(3'h6)] ?
              (reg35 >>> (wire33 ?
                  {wire31, reg38} : reg40[(3'h7):(2'h3)])) : (reg39 ?
                  {reg40} : reg38)));
        end
      reg42 <= (^~wire32);
      if (reg34)
        begin
          reg43 <= reg36;
          reg44 <= $unsigned((8'hb6));
          reg45 <= $unsigned((wire32 ?
              ({((8'hb8) ~^ wire31),
                  (^wire32)} >> (-$signed(reg43))) : $signed({(wire32 ?
                      reg34 : (8'hb0)),
                  $signed(reg40)})));
          if ({$signed($unsigned((|$signed(wire30))))})
            begin
              reg46 <= (~^reg44[(3'h6):(2'h3)]);
              reg47 <= $unsigned($unsigned((8'h9d)));
              reg48 <= (wire29[(3'h6):(3'h4)] && wire29[(5'h10):(1'h0)]);
            end
          else
            begin
              reg46 <= $signed(($unsigned($signed(reg42[(3'h4):(2'h2)])) ?
                  $unsigned($signed(reg43)) : (reg36[(1'h1):(1'h0)] + reg47[(3'h4):(2'h2)])));
              reg47 <= (-{(reg46[(2'h2):(1'h0)] | ($unsigned(reg48) - {reg45})),
                  reg45});
              reg48 <= $signed($unsigned(reg44));
              reg49 <= (({reg43[(4'hc):(4'h9)]} >>> (^(!reg48))) >>> reg43[(1'h0):(1'h0)]);
              reg50 <= wire29[(3'h5):(3'h4)];
            end
        end
      else
        begin
          reg43 <= $unsigned($unsigned($unsigned(reg40[(1'h0):(1'h0)])));
        end
    end
  assign wire51 = (~&(&($unsigned((reg41 ? wire33 : reg39)) ?
                      reg49[(3'h4):(2'h2)] : ((!reg36) ?
                          (reg46 * reg39) : (reg47 ? reg41 : reg41)))));
  assign wire52 = (^(reg45[(3'h5):(3'h5)] ?
                      reg40[(3'h6):(2'h3)] : (reg43[(4'hd):(4'hd)] ^ (~&$signed(reg39)))));
  assign wire53 = {((reg38 && wire52[(4'hf):(4'hf)]) + (^~(reg48[(4'h8):(4'h8)] >= (+wire29))))};
  always
    @(posedge clk) begin
      if ($unsigned((reg44 ^~ reg34)))
        begin
          reg54 <= {reg43, (reg36 || reg45[(1'h0):(1'h0)])};
          reg55 <= ($signed(($unsigned((reg42 - reg48)) ?
                  ((+(8'hbb)) ?
                      $signed(reg54) : reg34) : $unsigned((~wire31)))) ?
              reg39[(1'h0):(1'h0)] : (wire51[(4'h8):(3'h7)] | (((wire31 ?
                  (7'h42) : reg49) | reg47[(2'h2):(1'h1)]) <<< {reg43,
                  (~&reg45)})));
        end
      else
        begin
          reg54 <= (reg40 > (~|(8'ha8)));
          reg55 <= (~^(($unsigned(((8'hb9) ^~ wire32)) ?
                  ((reg37 || reg35) ~^ $signed((8'hbf))) : reg42) ?
              $unsigned({((8'haf) || reg36), reg40}) : reg40));
        end
      reg56 <= (~$signed((7'h43)));
    end
  assign wire57 = reg40;
  assign wire58 = ((8'hbe) ?
                      reg45[(1'h0):(1'h0)] : ($signed(((|reg49) || ((8'ha6) ?
                          reg44 : wire53))) + reg39));
  assign wire59 = (8'ha4);
  assign wire60 = (reg42 <<< wire28);
  assign wire61 = $signed(reg49);
  assign wire62 = wire31[(4'hf):(3'h5)];
  assign wire63 = $unsigned(({(~&$unsigned(wire61))} != (-((wire58 ?
                      reg56 : reg36) + $signed((8'hbc))))));
  always
    @(posedge clk) begin
      reg64 <= wire53[(2'h2):(1'h1)];
      reg65 <= ((8'ha7) ? reg35[(1'h0):(1'h0)] : $unsigned($unsigned(wire29)));
    end
  assign wire66 = $unsigned(wire31[(5'h11):(3'h6)]);
  assign wire67 = $signed($signed((&$signed($unsigned(wire58)))));
  always
    @(posedge clk) begin
      reg68 <= {reg56[(5'h13):(4'ha)], reg35};
    end
  assign wire69 = ({wire61[(3'h7):(1'h1)]} & (~(^~$unsigned(wire30))));
  assign wire70 = $unsigned((reg48[(4'h8):(3'h7)] ?
                      $unsigned(wire52) : (8'hba)));
  assign wire71 = $signed(({$signed({wire29, reg38}),
                          ((reg47 >>> wire28) ?
                              (reg43 ? reg49 : wire31) : $signed(wire70))} ?
                      $unsigned({$signed(wire31),
                          $signed((8'hb3))}) : (~^((reg50 ?
                          wire66 : wire53) <= $signed(wire66)))));
  assign wire72 = reg46[(3'h7):(1'h1)];
  assign wire73 = wire63;
endmodule
