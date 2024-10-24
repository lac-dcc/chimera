module top
#(parameter param14 = ((!(~^(((8'ha5) ~^ (8'ha4)) >= ((8'ha3) ? (8'haf) : (8'hbd))))) * (((((8'hb5) ? (7'h42) : (8'ha6)) ? (~^(8'hb8)) : ((8'h9e) + (8'ha5))) * ((&(8'haa)) | ((8'hba) ? (7'h40) : (8'hbe)))) ? (((7'h43) < (^(8'ha6))) ? {((8'hbe) ? (8'hbe) : (8'ha0))} : (^((7'h42) >>> (8'hac)))) : (8'haf))), 
parameter param15 = (-(param14 <<< (^((param14 & param14) ? param14 : (+param14))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h61):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire4;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire13;
  wire [(4'h8):(1'h0)] wire9;
  wire [(3'h6):(1'h0)] wire8;
  wire [(3'h5):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire5;
  reg [(4'h8):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg7 = (1'h0);
  assign y = {wire13,
                 wire9,
                 wire8,
                 wire6,
                 wire5,
                 reg12,
                 reg11,
                 reg10,
                 reg7,
                 (1'h0)};
  assign wire5 = ((8'hbd) && ((($unsigned(wire1) && $signed(wire3)) ?
                         ((wire1 == (8'ha8)) ?
                             (+wire0) : wire0) : $signed(wire1)) ?
                     wire1[(4'h9):(2'h3)] : $signed({(^wire3),
                         $unsigned(wire1)})));
  assign wire6 = wire1[(4'h9):(2'h3)];
  always
    @(posedge clk) begin
      reg7 <= ($signed((({wire3, wire4} ?
              $signed((8'haa)) : (^wire0)) <<< (8'hb8))) ?
          (~&(($signed((8'h9d)) + $signed((8'hb5))) - $unsigned({wire5,
              wire2}))) : wire1[(1'h1):(1'h1)]);
    end
  assign wire8 = $unsigned(($signed($signed((+reg7))) ?
                     $unsigned(((!(8'ha8)) ?
                         wire1 : (+wire1))) : ((!(-(8'ha8))) ?
                         ((wire2 >>> wire1) <= reg7) : {$unsigned(wire0)})));
  assign wire9 = reg7;
  always
    @(posedge clk) begin
      reg10 <= ($unsigned($signed(wire1[(4'ha):(3'h4)])) >= {{((+reg7) <= wire8)},
          wire1});
      if ((~|(($unsigned((+reg10)) - (~&(wire3 ? reg7 : wire1))) - (8'hbe))))
        begin
          reg11 <= (+(((~(wire2 * wire0)) ?
              reg7[(4'h8):(3'h6)] : {(~^(8'hb2))}) > $unsigned(reg7)));
          reg12 <= $signed((-$unsigned($unsigned($signed((8'hb0))))));
        end
      else
        begin
          reg11 <= (($signed(reg11) ?
                  wire5[(4'h9):(4'h8)] : reg11[(3'h4):(2'h2)]) ?
              {(((~|(8'h9e)) > $signed(wire0)) >= wire8)} : $signed({(wire9[(2'h2):(1'h1)] ?
                      (reg11 ? wire5 : wire6) : $signed(reg7))}));
        end
    end
  assign wire13 = reg12;
endmodule
