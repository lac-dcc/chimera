module top
#(parameter param19 = (((~&(^~((8'h9c) ? (8'ha7) : (8'hac)))) ? (~|({(8'ha9), (8'hb9)} || {(8'hb0), (8'hbe)})) : (((~(8'h9f)) ^ (!(8'hb8))) * (8'hbc))) ? (({((8'hae) ? (8'hbe) : (8'ha8))} ? (~|((8'hb2) << (8'haf))) : (((8'haa) & (8'had)) ? ((8'ha7) ? (8'hbe) : (8'hb9)) : ((8'hac) == (7'h40)))) < (+({(8'ha1), (8'ha4)} ? ((8'ha3) ? (8'ha0) : (8'had)) : (8'haf)))) : ((^{{(8'hb5)}, (~|(8'h9e))}) ? ((&((8'hb5) ? (8'ha4) : (8'haa))) ? (((8'h9e) ? (8'hb9) : (7'h40)) ^~ {(8'hb2), (8'hb7)}) : (8'hab)) : ((((8'ha2) ^~ (8'hbb)) ^ ((7'h40) && (8'h9e))) >= (((8'hb3) <<< (8'ha2)) ^ (!(8'hac)))))), 
parameter param20 = (((({param19} ? (param19 ? param19 : (8'hb0)) : (param19 + param19)) ? (param19 > (~param19)) : (((8'hb3) ? param19 : param19) || (param19 >> param19))) ^~ (!(-param19))) ^~ (8'h9d)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hae):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire4;
  input wire signed [(3'h6):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire18;
  wire signed [(5'h12):(1'h0)] wire17;
  wire signed [(5'h12):(1'h0)] wire16;
  wire [(5'h14):(1'h0)] wire15;
  wire signed [(3'h5):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire5;
  reg [(3'h7):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg12 = (1'h0);
  reg [(3'h4):(1'h0)] reg11 = (1'h0);
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  reg [(4'h9):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg7 = (1'h0);
  assign y = {wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire6,
                 wire5,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = (wire2[(3'h6):(2'h2)] <= ((~(wire0[(4'h9):(3'h4)] ?
                         wire4 : (wire1 == (8'ha2)))) ?
                     wire3[(1'h1):(1'h1)] : ((^~(wire0 >> wire3)) ?
                         ((wire2 ?
                             wire2 : (7'h43)) > (-wire3)) : $unsigned(wire0[(4'h9):(3'h4)]))));
  assign wire6 = $signed(wire4[(2'h2):(1'h1)]);
  always
    @(posedge clk) begin
      if ($unsigned($unsigned($unsigned((+(wire4 ? wire5 : wire2))))))
        begin
          if (wire5[(4'he):(3'h6)])
            begin
              reg7 <= wire0;
              reg8 <= $signed($signed(reg7));
            end
          else
            begin
              reg7 <= $unsigned(((&(-(reg7 ~^ wire0))) | (($signed(wire6) >= reg8[(2'h2):(2'h2)]) > $signed({reg8,
                  reg8}))));
              reg8 <= reg7;
              reg9 <= (wire4 ^~ ($unsigned(wire4[(1'h0):(1'h0)]) == ((8'ha8) ?
                  wire0[(4'ha):(3'h4)] : $signed($unsigned(wire0)))));
            end
        end
      else
        begin
          if ($unsigned(wire2))
            begin
              reg7 <= {wire1[(3'h4):(3'h4)],
                  (!$unsigned({(wire3 <<< (8'hb8))}))};
            end
          else
            begin
              reg7 <= $signed({(((~^wire6) ?
                      (wire1 + wire6) : (^~wire6)) <= $signed(wire0))});
              reg8 <= $unsigned($signed(($unsigned((^~(8'hba))) ^ ($signed(reg7) ?
                  (-(8'hbb)) : wire3))));
              reg9 <= {(+(~|$unsigned(reg9[(2'h3):(2'h2)])))};
            end
          reg10 <= {((~&((!reg9) + (reg9 ? (7'h42) : reg8))) ?
                  (((wire0 ? wire3 : wire3) >= (reg7 ? reg9 : wire0)) ?
                      (8'h9c) : reg9[(3'h7):(3'h4)]) : $signed(wire0)),
              $signed($unsigned($unsigned({reg8, (8'hbf)})))};
        end
      reg11 <= (|(8'ha5));
      reg12 <= (&($unsigned(wire3[(1'h1):(1'h1)]) ?
          $unsigned((^reg8[(2'h2):(1'h0)])) : $signed({$unsigned(reg7),
              $signed(wire6)})));
      reg13 <= ($unsigned($unsigned($unsigned($unsigned((8'hbb))))) <= wire3[(3'h6):(2'h3)]);
      reg14 <= $signed($signed({{(wire2 ? (8'hbd) : (7'h40))}}));
    end
  assign wire15 = (wire1[(2'h2):(1'h0)] <= $signed(wire0));
  assign wire16 = wire2[(4'h9):(2'h2)];
  assign wire17 = $signed($signed((8'hb7)));
  assign wire18 = $unsigned(wire0);
endmodule
