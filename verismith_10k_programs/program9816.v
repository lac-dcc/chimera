module top
#(parameter param20 = ({(+(((8'hab) ? (8'h9c) : (8'hb1)) ? ((8'h9e) ? (8'haa) : (8'h9d)) : ((8'haa) ~^ (8'hb9))))} < {((!((8'haa) ~^ (8'hb9))) ? (7'h43) : ((~^(8'hbc)) ? ((8'hac) ? (8'ha7) : (8'hac)) : ((8'ha8) > (7'h44)))), {(8'hac), (((8'haa) ? (8'haf) : (8'ha0)) * {(7'h42), (8'hae)})}}), 
parameter param21 = param20)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hbe):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire19;
  wire [(5'h13):(1'h0)] wire18;
  wire signed [(5'h15):(1'h0)] wire17;
  wire signed [(4'hd):(1'h0)] wire16;
  wire [(3'h7):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire4;
  reg [(2'h3):(1'h0)] reg15 = (1'h0);
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  reg [(4'h8):(1'h0)] reg13 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg11 = (1'h0);
  reg [(2'h2):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg9 = (1'h0);
  reg [(4'hf):(1'h0)] reg8 = (1'h0);
  reg [(3'h6):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg6 = (1'h0);
  assign y = {wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire5,
                 wire4,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = ((~|($unsigned(((7'h44) + (8'had))) + ($signed(wire0) ^~ {wire1,
                     wire0}))) < (({$signed((7'h42))} ?
                     $signed((~&wire0)) : ($signed(wire3) < (wire3 & wire3))) << $signed($unsigned(wire1))));
  assign wire5 = {$signed(wire1)};
  always
    @(posedge clk) begin
      reg6 <= wire4[(5'h10):(4'hf)];
      if ((wire3 >= {$signed((^(|wire0))), wire1}))
        begin
          reg7 <= {wire5[(1'h1):(1'h0)],
              (-(($signed((8'hbd)) ^~ (wire2 <<< wire4)) - $signed({wire0})))};
          reg8 <= (!$signed(({$signed(reg6)} ?
              wire3[(4'he):(4'h9)] : wire4[(4'h8):(3'h7)])));
          reg9 <= (wire1 << wire5[(3'h4):(2'h3)]);
          reg10 <= $unsigned($unsigned((((~^wire5) ?
                  wire0[(2'h2):(2'h2)] : (reg6 || reg8)) ?
              ({reg9, wire2} ? (~wire0) : {reg8}) : {reg7,
                  (reg9 ? wire2 : (8'haf))})));
          reg11 <= $signed(wire1[(5'h12):(2'h2)]);
        end
      else
        begin
          reg7 <= {reg6, reg10[(1'h1):(1'h1)]};
          reg8 <= reg7;
        end
    end
  always
    @(posedge clk) begin
      reg12 <= reg6;
      reg13 <= (~|reg11[(4'hd):(2'h2)]);
      reg14 <= (^$unsigned({(reg6 ? reg6 : reg9[(4'hb):(1'h0)]),
          (~&$unsigned(wire2))}));
      reg15 <= (($signed($unsigned((~&reg7))) ^~ reg7[(3'h4):(2'h2)]) ?
          reg6[(3'h6):(3'h4)] : (~&(|reg14[(4'he):(2'h2)])));
    end
  assign wire16 = $unsigned(wire5[(3'h5):(3'h5)]);
  assign wire17 = ($unsigned(wire16[(4'h9):(3'h4)]) < reg12[(1'h0):(1'h0)]);
  assign wire18 = wire17[(3'h7):(2'h3)];
  assign wire19 = (8'ha4);
endmodule
