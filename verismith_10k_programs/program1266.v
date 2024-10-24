module top
#(parameter param26 = (|({((^~(8'had)) ? ((8'hb2) ^ (7'h42)) : (&(8'ha6))), (|((8'hbc) ? (8'hb3) : (7'h42)))} ? (((~|(8'haf)) & ((8'h9d) == (8'hb5))) ? (&{(8'hbc)}) : (!((8'hb4) + (8'haa)))) : {((~|(8'ha5)) ~^ (~|(8'hab)))})), 
parameter param27 = (+{{(((8'hbb) != param26) & {param26, param26})}, (({(8'ha6)} ? (param26 ^ (8'ha9)) : (-param26)) << {(param26 | param26), ((8'hb9) ? (8'ha5) : param26)})}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hf4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire4;
  input wire [(4'h9):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire25;
  wire [(5'h12):(1'h0)] wire24;
  wire [(4'hb):(1'h0)] wire23;
  wire [(5'h13):(1'h0)] wire22;
  wire signed [(5'h11):(1'h0)] wire9;
  wire signed [(4'hd):(1'h0)] wire8;
  wire [(2'h2):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire6;
  wire signed [(4'he):(1'h0)] wire5;
  reg [(3'h5):(1'h0)] reg21 = (1'h0);
  reg [(4'h9):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg17 = (1'h0);
  reg [(5'h14):(1'h0)] reg16 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  reg [(4'hd):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg12 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg10 = (1'h0);
  assign y = {wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
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
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire5 = wire0[(1'h1):(1'h1)];
  assign wire6 = $signed($signed(wire2[(4'hf):(3'h6)]));
  assign wire7 = {$signed($signed(wire2[(4'he):(4'h8)]))};
  assign wire8 = wire3[(3'h5):(3'h5)];
  assign wire9 = wire5;
  always
    @(posedge clk) begin
      reg10 <= (wire5 <= $signed(wire9[(4'hb):(3'h7)]));
    end
  always
    @(posedge clk) begin
      reg11 <= (|(!wire3[(3'h7):(1'h1)]));
      reg12 <= (wire4 ?
          (^~wire9[(5'h10):(4'hd)]) : $unsigned($unsigned($unsigned($signed(wire1)))));
      reg13 <= (((~wire0[(2'h3):(1'h0)]) - (8'hb4)) ?
          $unsigned(wire2[(2'h2):(1'h0)]) : $signed(reg10));
    end
  always
    @(posedge clk) begin
      reg14 <= reg10;
      reg15 <= (|{(((8'hb7) >> {wire8, wire5}) << wire1[(2'h2):(1'h0)]),
          (reg14 ~^ {wire8[(3'h5):(1'h0)], (8'hb8)})});
      reg16 <= (^wire5[(3'h7):(2'h3)]);
      if ($unsigned((~^{$unsigned((!reg14))})))
        begin
          reg17 <= $unsigned(reg15[(1'h0):(1'h0)]);
          reg18 <= {(^~(~|$unsigned(wire9))),
              $signed($signed($signed((^reg11))))};
          if (wire4)
            begin
              reg19 <= ((~^reg18) ?
                  $signed($unsigned(((~&reg13) | $signed(reg10)))) : (~|((~|$signed(wire6)) ?
                      reg15[(1'h1):(1'h0)] : (+reg17[(2'h2):(1'h1)]))));
              reg20 <= (reg15 ?
                  $unsigned({reg18}) : {(~|wire3[(1'h0):(1'h0)])});
            end
          else
            begin
              reg19 <= reg11;
              reg20 <= $signed(reg15);
              reg21 <= wire1[(1'h0):(1'h0)];
            end
        end
      else
        begin
          reg17 <= {(~$unsigned({(reg21 ? reg11 : wire6)})),
              $unsigned((&$unsigned($unsigned(reg19))))};
          reg18 <= (((~((wire7 * reg11) ?
                  ((7'h42) == wire7) : (~&reg16))) ~^ $signed(reg12[(4'hf):(4'hc)])) ?
              (reg19 << {(~^reg12[(5'h10):(5'h10)]),
                  $unsigned($unsigned((8'ha1)))}) : {wire5[(3'h4):(2'h2)],
                  $signed({{reg13, reg17}, $signed(reg13)})});
          reg19 <= reg18;
          reg20 <= $signed(wire4[(3'h6):(3'h6)]);
          reg21 <= wire1;
        end
    end
  assign wire22 = (~&$signed(($unsigned(reg10[(2'h3):(1'h0)]) ?
                      $signed({(8'ha2), wire1}) : (8'hbc))));
  assign wire23 = $signed(reg14);
  assign wire24 = $unsigned(reg18[(4'h9):(3'h7)]);
  assign wire25 = $signed($signed(wire6[(4'hc):(4'h9)]));
endmodule
