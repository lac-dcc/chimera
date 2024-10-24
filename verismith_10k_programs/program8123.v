module top
#(parameter param30 = ({((8'ha6) >>> {((8'ha3) ? (8'hb5) : (8'hbd))}), (!(((8'hb0) ? (8'ha7) : (8'haa)) ? {(8'ha5), (8'ha3)} : (8'ha3)))} ? (((((7'h42) ? (7'h42) : (8'had)) >>> {(8'hb2)}) ? (((8'hb9) * (8'hab)) ? {(7'h43)} : ((8'haf) >= (8'hbc))) : {(~^(8'ha7)), ((8'hbb) ? (8'h9d) : (8'hb9))}) ? (8'haa) : ((((8'haa) - (8'hb6)) & ((8'h9e) != (8'hab))) != ({(8'hbb)} >>> ((8'h9e) && (8'haf))))) : {{(((8'h9f) || (8'ha8)) ^~ (|(8'ha1))), ((|(8'hbc)) < ((8'hb8) ? (8'hae) : (8'ha0)))}, (8'haf)}), 
parameter param31 = {(~(|param30))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h161):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire29;
  wire [(4'hf):(1'h0)] wire28;
  wire signed [(5'h12):(1'h0)] wire17;
  wire [(3'h7):(1'h0)] wire13;
  wire signed [(2'h2):(1'h0)] wire12;
  wire signed [(5'h11):(1'h0)] wire11;
  wire [(5'h14):(1'h0)] wire10;
  reg signed [(3'h4):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg26 = (1'h0);
  reg [(4'h9):(1'h0)] reg25 = (1'h0);
  reg [(5'h14):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg20 = (1'h0);
  reg [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg18 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg16 = (1'h0);
  reg [(3'h4):(1'h0)] reg15 = (1'h0);
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg8 = (1'h0);
  reg [(4'hc):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg5 = (1'h0);
  reg [(4'hd):(1'h0)] reg4 = (1'h0);
  assign y = {wire29,
                 wire28,
                 wire17,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
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
                 reg16,
                 reg15,
                 reg14,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= {({(+(wire3 & (8'hbe)))} < {(^~wire2[(4'hc):(3'h5)])}), wire2};
      reg5 <= $unsigned($signed((|$unsigned((8'haa)))));
      reg6 <= $unsigned($unsigned({$signed(reg4), wire0}));
      if ((~|{$unsigned($unsigned(((8'hb8) * wire3))),
          ((wire3[(3'h4):(2'h2)] ? (~wire3) : reg6[(4'hd):(1'h0)]) ?
              $signed(reg5) : wire2[(2'h3):(1'h0)])}))
        begin
          reg7 <= reg4[(2'h2):(1'h0)];
          if (($unsigned(($signed(wire3) ?
                  (reg6[(4'hd):(4'h9)] - wire2[(3'h7):(3'h6)]) : {wire2[(4'he):(2'h3)],
                      $unsigned((7'h44))})) ?
              wire0 : {(wire3 < wire3[(3'h4):(2'h3)])}))
            begin
              reg8 <= (~&{(^(!{(8'hb9)})),
                  ($unsigned(wire0[(3'h4):(3'h4)]) <<< ($unsigned(wire0) != (reg7 & wire0)))});
            end
          else
            begin
              reg8 <= (&(wire3[(3'h4):(2'h2)] >> (wire2 << $unsigned(wire1[(4'h8):(4'h8)]))));
            end
        end
      else
        begin
          reg7 <= wire3[(3'h4):(1'h0)];
        end
      reg9 <= reg7;
    end
  assign wire10 = (+wire2[(3'h5):(1'h1)]);
  assign wire11 = $unsigned(reg6);
  assign wire12 = (8'hbb);
  assign wire13 = (wire12 ?
                      wire0 : ((reg9 ?
                              ($unsigned(wire2) ?
                                  $signed(wire0) : {wire0, wire11}) : (|(reg4 ?
                                  reg6 : wire11))) ?
                          $unsigned((~{reg4})) : ($signed((wire1 ?
                                  reg4 : reg4)) ?
                              $unsigned((wire10 >>> reg9)) : (~&(~|reg5)))));
  always
    @(posedge clk) begin
      reg14 <= $unsigned((|(wire1[(1'h0):(1'h0)] ?
          $signed((reg8 == wire12)) : (reg6[(4'he):(4'hb)] ?
              {reg6} : $unsigned(wire10)))));
      reg15 <= (8'hb3);
      reg16 <= (wire2 <<< $signed(reg5));
    end
  assign wire17 = (~|(!$unsigned($unsigned(wire13))));
  always
    @(posedge clk) begin
      if (((($unsigned($signed(reg9)) ?
              $unsigned($unsigned(wire1)) : {reg9[(1'h1):(1'h1)],
                  (wire3 >>> wire1)}) || reg5[(3'h5):(1'h0)]) ?
          (wire2 <<< $signed(wire12)) : (wire3[(2'h3):(1'h1)] ?
              ({(reg5 >> reg5), (|reg9)} ?
                  {wire17,
                      reg14} : (~$unsigned(reg7))) : (wire17 >> $unsigned($signed(reg14))))))
        begin
          if ((8'ha0))
            begin
              reg18 <= (((~|reg14[(3'h7):(2'h3)]) << $unsigned({reg9})) ~^ {(reg16 ?
                      {wire10} : $unsigned($unsigned((8'hbe))))});
              reg19 <= wire17[(3'h4):(3'h4)];
            end
          else
            begin
              reg18 <= $signed($unsigned(reg19));
              reg19 <= wire10[(4'h9):(2'h2)];
              reg20 <= wire2;
              reg21 <= wire1;
              reg22 <= $signed(wire13[(1'h0):(1'h0)]);
            end
          reg23 <= reg21;
        end
      else
        begin
          reg18 <= $signed(($unsigned($signed((reg21 * reg18))) ?
              $unsigned(reg18) : $unsigned(reg15[(1'h1):(1'h0)])));
          reg19 <= $unsigned(((+wire3) ^ wire3));
          reg20 <= $signed($unsigned($unsigned(reg16)));
          reg21 <= (($unsigned($unsigned((~&reg20))) ?
              {($unsigned(reg9) ?
                      (wire10 ? wire3 : reg9) : reg5[(1'h0):(1'h0)]),
                  (wire1 ?
                      (~|reg19) : (reg22 ? wire12 : reg8))} : {reg22}) & reg9);
          reg22 <= reg22;
        end
      reg24 <= wire0[(2'h2):(1'h0)];
      reg25 <= reg7[(4'hc):(3'h5)];
      reg26 <= (8'hb2);
      reg27 <= (~|reg23);
    end
  assign wire28 = wire1[(5'h11):(1'h1)];
  assign wire29 = ($signed(($unsigned(((8'hb6) >= (8'haf))) ?
                          ({reg5} >= $signed(reg4)) : $unsigned(reg4))) ?
                      reg19[(2'h3):(1'h1)] : $signed(((reg20 ?
                          (+(8'ha1)) : $unsigned(reg6)) == {(reg19 << wire0)})));
endmodule
