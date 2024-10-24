module top
#(parameter param62 = ((!(&(((8'h9d) * (8'haf)) ? ((8'hbc) <= (8'hb2)) : (-(8'hbd))))) + (8'hb6)), 
parameter param63 = ((param62 >= (-{{(8'hb5)}})) > (~param62)))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h104):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire3;
  wire [(2'h2):(1'h0)] wire59;
  wire [(5'h10):(1'h0)] wire55;
  wire [(3'h5):(1'h0)] wire54;
  wire signed [(4'he):(1'h0)] wire53;
  wire [(2'h2):(1'h0)] wire42;
  wire signed [(4'ha):(1'h0)] wire41;
  wire signed [(5'h10):(1'h0)] wire40;
  wire [(4'hb):(1'h0)] wire39;
  wire signed [(5'h12):(1'h0)] wire38;
  wire signed [(4'hc):(1'h0)] wire4;
  wire signed [(4'he):(1'h0)] wire36;
  reg [(4'hd):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg60 = (1'h0);
  reg [(5'h14):(1'h0)] reg58 = (1'h0);
  reg [(2'h3):(1'h0)] reg57 = (1'h0);
  reg [(4'hd):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg52 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg51 = (1'h0);
  reg [(4'hd):(1'h0)] reg50 = (1'h0);
  reg [(4'h9):(1'h0)] reg49 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg47 = (1'h0);
  reg [(2'h2):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg43 = (1'h0);
  assign y = {wire59,
                 wire55,
                 wire54,
                 wire53,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire4,
                 wire36,
                 reg61,
                 reg60,
                 reg58,
                 reg57,
                 reg56,
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
                 (1'h0)};
  assign wire4 = {wire1,
                     $unsigned(($unsigned((~^wire2)) <= ($signed(wire2) ~^ (wire3 ?
                         wire1 : wire1))))};
  module5 #() modinst37 (wire36, clk, wire0, wire2, wire3, wire1, wire4);
  assign wire38 = $unsigned(wire1);
  assign wire39 = $signed((~|(!$unsigned((&wire38)))));
  assign wire40 = (($signed($signed(wire3[(4'h8):(2'h3)])) + wire4[(3'h4):(2'h3)]) ?
                      wire3 : (-wire0[(4'he):(4'hc)]));
  assign wire41 = wire3[(4'h8):(3'h6)];
  assign wire42 = (-wire1[(4'hc):(4'h9)]);
  always
    @(posedge clk) begin
      if ($unsigned($unsigned(wire0[(4'hb):(1'h0)])))
        begin
          reg43 <= wire4[(4'ha):(3'h6)];
        end
      else
        begin
          if ($unsigned(wire4))
            begin
              reg43 <= (($signed($signed(wire41[(3'h6):(1'h0)])) ?
                      ($unsigned(wire0[(4'hf):(2'h2)]) ?
                          (wire2 ^ (wire38 ?
                              wire36 : (8'hb8))) : ((wire4 || wire38) ?
                              (wire36 >> wire0) : $signed(wire42))) : wire39) ?
                  $signed({($signed(reg43) ?
                          (wire42 ?
                              (7'h44) : wire1) : {wire3})}) : {wire42[(1'h1):(1'h0)],
                      (8'hab)});
              reg44 <= wire41[(2'h3):(2'h3)];
              reg45 <= {reg43[(2'h2):(1'h1)],
                  $signed({wire39,
                      {$unsigned((8'hb0)), wire39[(4'h8):(1'h1)]}})};
              reg46 <= (wire0[(4'hd):(4'hd)] ?
                  {$signed($signed(wire3[(3'h4):(1'h0)]))} : (^~$signed((^(wire38 << reg43)))));
            end
          else
            begin
              reg43 <= $signed({(wire42[(1'h1):(1'h0)] ?
                      ($signed(wire41) ?
                          (wire36 << reg45) : (^reg44)) : $signed($signed(reg45)))});
              reg44 <= wire36;
              reg45 <= wire36;
              reg46 <= wire3;
              reg47 <= $signed($unsigned(wire0[(2'h3):(2'h3)]));
            end
        end
    end
  always
    @(posedge clk) begin
      reg48 <= wire3[(2'h3):(2'h3)];
      reg49 <= wire38[(5'h12):(4'ha)];
      reg50 <= $signed(reg44[(2'h2):(1'h1)]);
      reg51 <= ($unsigned($signed((-$signed(wire3)))) <<< (^~{(8'hb2)}));
      reg52 <= ({reg51} << $signed(((|$unsigned(reg44)) | wire1[(5'h10):(4'h9)])));
    end
  assign wire53 = ($signed(reg45[(2'h2):(1'h0)]) ?
                      reg44[(1'h1):(1'h1)] : (8'haf));
  assign wire54 = $signed(((~&$unsigned(reg48[(3'h5):(1'h1)])) | wire41));
  assign wire55 = $signed({$unsigned((~|$unsigned(wire4)))});
  always
    @(posedge clk) begin
      reg56 <= $unsigned((reg48 + $unsigned($signed(wire4))));
      reg57 <= ($signed((~$signed(wire3))) ?
          {$unsigned($unsigned((wire41 > wire54))),
              $unsigned((8'ha2))} : (((reg51[(1'h0):(1'h0)] ^~ reg56) & (+{reg56})) ?
              $signed({$signed(reg52)}) : ($unsigned((8'h9e)) >= ((reg47 == (8'hba)) >> $unsigned(wire40)))));
      reg58 <= $signed(wire3[(4'ha):(3'h5)]);
    end
  assign wire59 = $unsigned(wire40[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      reg60 <= (-(~&wire39[(3'h7):(1'h1)]));
      reg61 <= wire55;
    end
endmodule

module module5
#(parameter param35 = (8'had))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h131):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire10;
  input wire [(4'hd):(1'h0)] wire9;
  input wire signed [(3'h6):(1'h0)] wire8;
  input wire [(3'h7):(1'h0)] wire7;
  input wire signed [(3'h7):(1'h0)] wire6;
  wire [(5'h12):(1'h0)] wire34;
  wire signed [(4'he):(1'h0)] wire33;
  wire [(5'h14):(1'h0)] wire32;
  wire signed [(3'h5):(1'h0)] wire31;
  wire [(4'hd):(1'h0)] wire30;
  wire signed [(3'h7):(1'h0)] wire29;
  wire signed [(4'hd):(1'h0)] wire28;
  wire signed [(5'h13):(1'h0)] wire27;
  wire [(3'h7):(1'h0)] wire26;
  wire [(4'h8):(1'h0)] wire11;
  reg signed [(5'h10):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg24 = (1'h0);
  reg [(5'h14):(1'h0)] reg23 = (1'h0);
  reg signed [(4'he):(1'h0)] reg22 = (1'h0);
  reg [(4'hf):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg16 = (1'h0);
  reg [(5'h10):(1'h0)] reg15 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg12 = (1'h0);
  assign y = {wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire11,
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
                 reg12,
                 (1'h0)};
  assign wire11 = $unsigned(((^~{{wire9},
                      wire9[(2'h2):(1'h0)]}) + $unsigned($signed({(8'h9d),
                      wire8}))));
  always
    @(posedge clk) begin
      reg12 <= {wire9};
      reg13 <= reg12;
      reg14 <= $signed((!$signed(wire6[(3'h6):(2'h2)])));
      if (wire7)
        begin
          if ($signed((8'hac)))
            begin
              reg15 <= (-{{$signed((reg13 ^~ wire6))}, wire8});
              reg16 <= {reg15[(4'hd):(1'h1)]};
              reg17 <= $unsigned((~|{reg12[(1'h1):(1'h1)], {{reg16}}}));
              reg18 <= ({$unsigned(($unsigned(wire7) >> (reg13 || reg14)))} ?
                  $unsigned(((~reg17) >> wire10)) : $unsigned((|((8'ha1) ?
                      $unsigned(reg15) : (8'ha1)))));
            end
          else
            begin
              reg15 <= $unsigned((((+reg17) ?
                  (~^((8'hb7) ?
                      reg13 : wire11)) : $unsigned(wire11)) <<< (reg14 ?
                  reg16[(4'hd):(4'h8)] : $signed({reg12}))));
              reg16 <= ((^~$unsigned(reg18[(1'h1):(1'h0)])) ^ ((($unsigned(wire6) ?
                      reg16[(3'h7):(2'h2)] : (reg13 ? wire6 : reg15)) ?
                  $signed({wire8}) : reg15) << wire10[(2'h3):(2'h3)]));
              reg17 <= ($signed($signed((~&{(8'hae)}))) ?
                  $unsigned($unsigned(((reg16 ?
                      wire9 : reg18) != reg18[(1'h1):(1'h0)]))) : $unsigned(({$signed(reg12)} ^~ wire7[(3'h6):(3'h4)])));
              reg18 <= $unsigned((($signed((^wire10)) - {$unsigned(reg12),
                  wire8[(3'h4):(1'h0)]}) << (({(7'h40),
                  reg14} ^ (wire10 * (8'ha3))) & wire7)));
              reg19 <= $signed($unsigned(reg18[(1'h1):(1'h0)]));
            end
          reg20 <= reg17[(1'h0):(1'h0)];
          reg21 <= ($signed($signed({{reg12, reg15},
              reg13[(1'h0):(1'h0)]})) + $signed(reg17[(3'h4):(2'h3)]));
          if (wire9[(3'h7):(1'h0)])
            begin
              reg22 <= ((^~wire10) ?
                  (wire11 - reg18) : $unsigned($unsigned((~&(8'ha5)))));
              reg23 <= reg12;
              reg24 <= ((reg22 ?
                  (wire6[(3'h6):(3'h6)] >> reg19[(5'h12):(1'h1)]) : $unsigned(reg15[(2'h3):(2'h2)])) ^ wire10);
            end
          else
            begin
              reg22 <= (reg20 >>> $signed(reg14));
              reg23 <= reg12[(3'h5):(1'h0)];
            end
          reg25 <= (^~reg19);
        end
      else
        begin
          reg15 <= wire6[(3'h5):(3'h4)];
          reg16 <= ((^~(^$signed(wire10))) << $unsigned(reg14[(3'h4):(2'h3)]));
          reg17 <= wire11;
          reg18 <= $signed((wire7[(1'h0):(1'h0)] || (~((reg20 + (8'ha7)) * (^~(8'ha4))))));
          reg19 <= (|$signed((!$unsigned((|(8'haf))))));
        end
    end
  assign wire26 = wire11;
  assign wire27 = (~(~^(|$unsigned(((8'ha3) != wire8)))));
  assign wire28 = wire6[(3'h7):(3'h4)];
  assign wire29 = (8'hb5);
  assign wire30 = wire27[(4'hc):(4'hc)];
  assign wire31 = reg25;
  assign wire32 = $signed(wire29[(3'h7):(3'h5)]);
  assign wire33 = $unsigned(reg13[(5'h14):(1'h0)]);
  assign wire34 = {$unsigned(reg21[(3'h6):(2'h3)]), $signed(reg25)};
endmodule
