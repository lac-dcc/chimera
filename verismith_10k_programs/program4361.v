module top
#(parameter param19 = (((-{((8'hba) ? (8'hb6) : (7'h42))}) + {{((8'ha4) ? (8'hb4) : (8'h9c)), ((8'hb5) ? (8'ha3) : (8'ha9))}}) ? (((~&((8'hab) && (8'h9c))) ? (((8'hb1) ? (8'hb5) : (8'h9c)) << {(7'h42)}) : {{(8'hb3)}, ((8'ha0) ? (7'h44) : (8'h9c))}) ? {(8'hbd)} : ({((8'hb8) ? (8'h9e) : (8'hb3))} > (~&(&(8'hb7))))) : (((|((8'h9e) ? (8'ha8) : (7'h42))) & {(!(8'hbe))}) && ((((8'hb5) ? (7'h40) : (8'hac)) ? (8'hbe) : (^~(8'ha8))) <<< (|(^~(8'ha7)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'ha2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire4;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire16;
  wire signed [(4'hf):(1'h0)] wire15;
  wire [(3'h6):(1'h0)] wire14;
  wire signed [(3'h5):(1'h0)] wire13;
  wire [(5'h10):(1'h0)] wire12;
  wire signed [(4'hc):(1'h0)] wire11;
  wire signed [(3'h7):(1'h0)] wire5;
  reg [(5'h14):(1'h0)] reg18 = (1'h0);
  reg [(4'hf):(1'h0)] reg17 = (1'h0);
  reg [(4'ha):(1'h0)] reg10 = (1'h0);
  reg [(5'h10):(1'h0)] reg9 = (1'h0);
  reg [(2'h2):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg7 = (1'h0);
  reg [(4'ha):(1'h0)] reg6 = (1'h0);
  assign y = {wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire5,
                 reg18,
                 reg17,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = $unsigned($signed($unsigned((!((8'hab) - wire4)))));
  always
    @(posedge clk) begin
      if (wire2)
        begin
          reg6 <= ($unsigned(((wire1[(2'h2):(2'h2)] ?
              (~&wire2) : wire2) >> {(wire5 | wire0)})) << {wire3[(5'h10):(3'h5)],
              wire3});
          reg7 <= ($signed($signed($signed($unsigned(wire1)))) ?
              $unsigned($unsigned($unsigned(wire0))) : (($unsigned((+wire5)) ?
                  (~wire4[(3'h7):(3'h6)]) : (wire4[(4'he):(4'h8)] ?
                      $unsigned(wire1) : (~^(8'hb5)))) >>> wire1[(1'h0):(1'h0)]));
          reg8 <= reg6[(3'h6):(3'h6)];
        end
      else
        begin
          reg6 <= (&{($signed(wire1) >>> {wire4[(4'he):(4'ha)],
                  $signed((8'hbf))})});
          reg7 <= wire1[(3'h5):(2'h3)];
          reg8 <= {$unsigned(wire4[(4'he):(4'hd)])};
          reg9 <= (8'hbb);
          reg10 <= $unsigned($signed((+reg8[(2'h2):(1'h1)])));
        end
    end
  assign wire11 = (~|{reg7[(1'h0):(1'h0)]});
  assign wire12 = $signed($signed((|reg9[(4'h9):(3'h7)])));
  assign wire13 = reg8[(1'h1):(1'h1)];
  assign wire14 = (reg8 | $unsigned((~{(8'hb8), reg8[(1'h0):(1'h0)]})));
  assign wire15 = ((^~$signed($signed(wire3[(4'hb):(2'h3)]))) ?
                      {wire3} : ((wire0 ?
                          (~|(+wire11)) : reg9[(3'h6):(1'h1)]) == (^reg6[(1'h1):(1'h1)])));
  assign wire16 = (reg8[(1'h1):(1'h1)] + ($signed(wire15[(1'h0):(1'h0)]) ?
                      reg6[(3'h6):(1'h1)] : (+(!(8'hb2)))));
  always
    @(posedge clk) begin
      reg17 <= $unsigned($signed(reg7[(4'h9):(3'h4)]));
      reg18 <= (^$signed($signed(reg8)));
    end
endmodule
