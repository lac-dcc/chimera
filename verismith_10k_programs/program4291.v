module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h18d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire0;
  input wire [(3'h7):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire4;
  wire [(4'hb):(1'h0)] wire66;
  wire [(2'h2):(1'h0)] wire65;
  wire signed [(5'h11):(1'h0)] wire64;
  wire signed [(2'h3):(1'h0)] wire63;
  wire [(4'h8):(1'h0)] wire62;
  wire signed [(4'h8):(1'h0)] wire61;
  wire [(4'hb):(1'h0)] wire5;
  wire signed [(4'hc):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire12;
  wire [(4'h9):(1'h0)] wire29;
  wire signed [(4'hd):(1'h0)] wire30;
  wire signed [(4'he):(1'h0)] wire59;
  reg [(4'hb):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg27 = (1'h0);
  reg [(2'h2):(1'h0)] reg26 = (1'h0);
  reg [(4'hb):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg24 = (1'h0);
  reg [(2'h3):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg21 = (1'h0);
  reg [(5'h14):(1'h0)] reg20 = (1'h0);
  reg [(4'h9):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg18 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg14 = (1'h0);
  reg [(3'h4):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(4'he):(1'h0)] reg10 = (1'h0);
  reg [(4'hc):(1'h0)] reg9 = (1'h0);
  reg [(5'h13):(1'h0)] reg8 = (1'h0);
  reg [(5'h15):(1'h0)] reg7 = (1'h0);
  assign y = {wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire5,
                 wire6,
                 wire12,
                 wire29,
                 wire30,
                 wire59,
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
                 reg15,
                 reg14,
                 reg13,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = $unsigned(wire1);
  assign wire6 = $unsigned(wire5);
  always
    @(posedge clk) begin
      reg7 <= (~|$signed((~|wire5)));
      reg8 <= (($signed(wire0) ?
          $unsigned(reg7[(4'hd):(3'h4)]) : (~((wire0 | wire3) ?
              (&(8'ha3)) : (wire4 ?
                  reg7 : wire0)))) * $unsigned({reg7[(3'h7):(3'h7)],
          $signed({wire0, wire2})}));
      reg9 <= $signed((8'h9d));
      if (wire6)
        begin
          reg10 <= ((|wire0) > wire5);
          reg11 <= wire4[(4'hb):(1'h1)];
        end
      else
        begin
          if (wire2)
            begin
              reg10 <= wire1[(3'h4):(3'h4)];
            end
          else
            begin
              reg10 <= $signed(wire4);
              reg11 <= (wire2[(3'h4):(2'h2)] == ($signed((reg8 ?
                      wire1 : $unsigned((7'h42)))) ?
                  $signed($unsigned(wire4)) : reg10));
            end
        end
    end
  assign wire12 = $signed((~|wire4[(4'hb):(4'h9)]));
  always
    @(posedge clk) begin
      if ((reg8[(3'h7):(1'h0)] << (&$signed((((8'hbd) ? (8'hb0) : reg9) ?
          (wire6 ? reg8 : wire1) : $unsigned(wire12))))))
        begin
          if ((($signed(((&(8'hbd)) ? reg8 : $signed(wire5))) ?
              (~|((^~wire6) || reg7)) : (($signed(reg7) >> $signed(wire3)) ?
                  $unsigned((reg7 ?
                      (8'h9f) : wire4)) : reg7)) <<< ($unsigned($signed({reg8})) ?
              (reg9[(1'h0):(1'h0)] ^ {{reg9, reg9}}) : (~&$signed((|reg9))))))
            begin
              reg13 <= reg7;
              reg14 <= reg8;
              reg15 <= reg9[(2'h2):(1'h1)];
              reg16 <= ({($unsigned((^~reg10)) ?
                      (wire0[(1'h0):(1'h0)] ?
                          wire2 : $signed(wire0)) : $signed(reg9))} == (^~$unsigned((^~(reg9 * reg9)))));
            end
          else
            begin
              reg13 <= (8'ha6);
              reg14 <= (~&(($unsigned((wire1 * wire3)) ?
                      (^~(wire2 ? wire3 : (8'h9c))) : {(7'h41)}) ?
                  ($unsigned({wire6}) ?
                      $unsigned($unsigned(reg7)) : (^$signed(reg15))) : reg7[(4'hb):(1'h0)]));
            end
          reg17 <= wire12;
          if (wire6)
            begin
              reg18 <= wire1;
              reg19 <= $signed(wire2[(2'h3):(1'h0)]);
              reg20 <= reg17[(2'h2):(2'h2)];
            end
          else
            begin
              reg18 <= $unsigned({wire3});
              reg19 <= $signed($unsigned((((wire0 ? wire4 : reg10) ?
                  (wire6 ? reg20 : wire2) : (wire5 ?
                      reg19 : reg19)) || (|(reg11 || wire4)))));
              reg20 <= $unsigned(($unsigned(((8'ha6) & wire0[(1'h1):(1'h0)])) ?
                  (reg14[(1'h1):(1'h0)] != wire0) : $signed($signed(wire5[(4'h8):(1'h0)]))));
              reg21 <= $unsigned(reg14);
            end
          if ((reg11 || (wire0[(3'h5):(1'h0)] ^~ reg21)))
            begin
              reg22 <= reg17[(4'h8):(3'h6)];
            end
          else
            begin
              reg22 <= reg13;
              reg23 <= (~|((reg10[(2'h3):(2'h2)] ?
                  $signed((reg14 ?
                      reg21 : wire0)) : reg14[(1'h1):(1'h1)]) < reg14));
              reg24 <= $signed($unsigned($unsigned(reg21[(4'h8):(1'h1)])));
            end
        end
      else
        begin
          if (reg11[(4'hf):(4'h8)])
            begin
              reg13 <= (~$unsigned({(reg7 ? $unsigned(wire1) : (8'hb1))}));
              reg14 <= {reg16, wire1[(1'h1):(1'h0)]};
              reg15 <= wire5;
            end
          else
            begin
              reg13 <= {(((8'ha8) ~^ {{reg22}}) ?
                      (~^reg24[(5'h12):(3'h7)]) : ((reg15[(3'h7):(3'h6)] || (wire5 ^~ reg8)) != $signed((wire1 ?
                          reg15 : (8'hbb)))))};
            end
        end
      reg25 <= (($unsigned((reg11 ^~ {reg18})) ?
          reg19 : $unsigned(((reg21 ?
              wire5 : wire5) & {reg17}))) ^~ $signed(wire0));
      reg26 <= (+wire4);
      reg27 <= ((reg25 & $unsigned($signed(reg13[(1'h1):(1'h0)]))) ?
          $signed(reg17[(4'h9):(2'h2)]) : (&$signed(reg16[(3'h5):(1'h1)])));
      reg28 <= $signed(reg20[(4'h8):(3'h5)]);
    end
  assign wire29 = (8'hb4);
  assign wire30 = reg21;
  module31 #() modinst60 (.wire36(wire0), .wire34(reg15), .wire33(reg19), .wire32(reg27), .wire35(reg9), .clk(clk), .y(wire59));
  assign wire61 = (^$unsigned(reg9[(2'h3):(1'h0)]));
  assign wire62 = $signed((8'hae));
  assign wire63 = ((8'haf) > (reg18 & ($unsigned((reg17 ? reg27 : (8'hbb))) ?
                      (wire6 ?
                          $signed(reg25) : ((7'h43) ?
                              wire2 : wire4)) : (reg24[(2'h2):(1'h1)] ?
                          $signed(wire1) : $unsigned((7'h41))))));
  assign wire64 = wire12[(4'ha):(1'h0)];
  assign wire65 = {(+(|(~$signed(reg24))))};
  assign wire66 = reg23[(2'h3):(1'h0)];
endmodule

module module31
#(parameter param57 = (((((+(8'h9c)) ^ (^~(8'hbe))) ? {(~^(8'ha5)), ((8'hbc) & (8'ha3))} : {((7'h40) ? (8'hb4) : (8'h9c))}) ? (^(((8'ha8) < (8'ha2)) ? {(7'h41)} : ((8'hb7) ? (8'hb4) : (8'had)))) : ((((7'h42) * (8'hb8)) ? (&(7'h42)) : (!(8'hac))) * ({(8'had)} ? {(8'haf)} : ((8'ha6) ? (8'h9d) : (8'ha4))))) ? {{((~^(7'h44)) && (~(7'h42))), (7'h42)}} : (8'hbf)), 
parameter param58 = ({(((-(8'hbe)) ? param57 : {param57, param57}) <<< param57)} ? ((+param57) || {(7'h44)}) : ((8'hba) ? (~^((!param57) >>> param57)) : param57)))
(y, clk, wire36, wire35, wire34, wire33, wire32);
  output wire [(32'h100):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire36;
  input wire signed [(4'hc):(1'h0)] wire35;
  input wire [(4'h8):(1'h0)] wire34;
  input wire signed [(4'h9):(1'h0)] wire33;
  input wire [(4'hf):(1'h0)] wire32;
  wire signed [(5'h15):(1'h0)] wire56;
  wire [(5'h11):(1'h0)] wire55;
  wire signed [(5'h14):(1'h0)] wire54;
  wire signed [(5'h14):(1'h0)] wire53;
  wire [(4'he):(1'h0)] wire52;
  wire [(2'h3):(1'h0)] wire51;
  wire [(4'hd):(1'h0)] wire50;
  wire signed [(4'hd):(1'h0)] wire43;
  wire signed [(5'h10):(1'h0)] wire42;
  wire signed [(4'h8):(1'h0)] wire41;
  wire signed [(2'h2):(1'h0)] wire40;
  wire [(5'h13):(1'h0)] wire39;
  wire signed [(3'h4):(1'h0)] wire38;
  wire [(3'h7):(1'h0)] wire37;
  reg [(5'h13):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg48 = (1'h0);
  reg [(5'h13):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg46 = (1'h0);
  reg [(4'ha):(1'h0)] reg45 = (1'h0);
  reg [(3'h4):(1'h0)] reg44 = (1'h0);
  assign y = {wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 (1'h0)};
  assign wire37 = (8'ha6);
  assign wire38 = wire35;
  assign wire39 = wire33;
  assign wire40 = $signed(wire38[(1'h0):(1'h0)]);
  assign wire41 = (((-(~^(wire35 ? (7'h40) : (8'ha1)))) ?
                      (~(8'ha0)) : wire34[(1'h0):(1'h0)]) + {(((wire33 ?
                                  (8'haa) : wire39) ?
                              wire38[(1'h0):(1'h0)] : $signed(wire38)) ?
                          wire32[(1'h0):(1'h0)] : (wire35[(4'h8):(2'h3)] > (wire39 ?
                              wire35 : wire32)))});
  assign wire42 = $signed(wire39);
  assign wire43 = (~wire40);
  always
    @(posedge clk) begin
      if (wire42[(4'h9):(3'h5)])
        begin
          reg44 <= $signed($signed(wire43[(3'h7):(3'h5)]));
          reg45 <= ($signed(wire35) ?
              (|$unsigned((~|wire37))) : wire33[(2'h3):(1'h0)]);
        end
      else
        begin
          reg44 <= ((~wire32) - (+((^~$signed(wire40)) ^~ wire38)));
          reg45 <= (~|wire32);
        end
      reg46 <= reg44[(2'h3):(2'h3)];
      reg47 <= ((8'hbb) + wire40[(1'h1):(1'h0)]);
      reg48 <= wire43;
      reg49 <= wire39[(2'h2):(2'h2)];
    end
  assign wire50 = $unsigned($signed((~^$signed((!wire41)))));
  assign wire51 = $unsigned(wire43);
  assign wire52 = ($signed(({(~^wire40)} >= (&(|wire39)))) ?
                      {reg45[(4'h8):(1'h0)],
                          ($unsigned(((8'ha5) ? wire50 : (8'haf))) ?
                              ({wire40,
                                  wire41} & reg45) : ($unsigned(wire32) <= (wire34 ?
                                  (8'ha4) : wire50)))} : ($signed(wire51[(2'h3):(2'h2)]) ?
                          {(8'ha8),
                              reg48} : ($signed($unsigned(wire39)) && $signed($unsigned(wire41)))));
  assign wire53 = (wire43 >>> (((wire36 ?
                      (wire42 <<< (8'hae)) : wire50[(1'h0):(1'h0)]) || $unsigned(reg45[(2'h2):(2'h2)])) & $signed(wire38[(3'h4):(3'h4)])));
  assign wire54 = $signed($signed((|$unsigned($signed(reg47)))));
  assign wire55 = wire40[(1'h0):(1'h0)];
  assign wire56 = $signed(wire53);
endmodule
