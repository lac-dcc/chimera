module top
#(parameter param19 = ({(^((-(8'hab)) * ((8'hac) < (8'ha9)))), ((((8'hb4) ? (7'h41) : (8'ha1)) < (^(8'hba))) ? (((8'ha8) < (8'hb9)) < ((7'h42) ? (8'ha8) : (8'hbc))) : (!(^(8'hbb))))} ? (~&(!((-(8'hb8)) * ((8'ha4) || (8'hbf))))) : ((~^{((8'hb0) ? (8'h9e) : (8'hac)), (!(8'hb7))}) ? {(^~((8'ha7) ^~ (8'h9d)))} : {(-((8'hba) ? (8'hbe) : (8'h9d)))})), 
parameter param20 = (|((((~&param19) ^ {(8'ha9), param19}) ? {(^param19), {param19, param19}} : ((-param19) ? (-param19) : param19)) ? (param19 == ((param19 ~^ param19) ^ ((8'ha6) ? param19 : param19))) : param19)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'ha3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire4;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire18;
  wire signed [(4'h9):(1'h0)] wire17;
  wire signed [(3'h6):(1'h0)] wire16;
  wire signed [(5'h13):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire5;
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  reg [(4'h8):(1'h0)] reg14 = (1'h0);
  reg [(4'hd):(1'h0)] reg13 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg12 = (1'h0);
  reg [(4'hf):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg10 = (1'h0);
  reg [(4'h9):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg7 = (1'h0);
  assign y = {wire18,
                 wire17,
                 wire16,
                 wire6,
                 wire5,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire5 = (({$signed(wire0), {(wire0 ? (7'h44) : (8'hb9))}} ?
                     wire3[(2'h2):(1'h1)] : wire4[(1'h0):(1'h0)]) << (^(-wire2)));
  assign wire6 = (wire4[(3'h4):(2'h3)] ?
                     (~^(wire1[(3'h4):(1'h1)] ^ (^(wire1 ?
                         wire3 : wire0)))) : (-(((-(8'hba)) ?
                         wire0 : $signed((7'h43))) >>> (wire2 ^ ((8'ha5) || wire0)))));
  always
    @(posedge clk) begin
      if (wire6)
        begin
          reg7 <= wire1;
          reg8 <= $unsigned((8'hae));
          if (reg8)
            begin
              reg9 <= (wire4[(2'h2):(2'h2)] < (wire3 & $signed(wire3)));
              reg10 <= reg9[(4'h8):(3'h6)];
              reg11 <= {$unsigned(reg7[(1'h0):(1'h0)])};
            end
          else
            begin
              reg9 <= wire4[(3'h5):(2'h2)];
              reg10 <= reg10;
              reg11 <= (~wire2);
              reg12 <= ($unsigned($signed(reg9[(3'h4):(1'h1)])) >> $unsigned($signed({(reg11 ^~ reg8),
                  (reg9 ? (8'h9d) : reg9)})));
            end
          reg13 <= (wire0 >>> wire5);
          reg14 <= reg13;
        end
      else
        begin
          reg7 <= $unsigned((^wire1));
          reg8 <= $signed($signed($signed((&(+(8'haf))))));
          reg9 <= (($unsigned(wire5) << wire3) ?
              wire3 : (|reg10[(3'h7):(1'h1)]));
          reg10 <= (-($signed($signed(wire5)) ^ ((~|$signed(wire2)) >= $unsigned((reg7 <<< wire2)))));
          reg11 <= wire3;
        end
      reg15 <= reg10[(3'h6):(2'h3)];
    end
  assign wire16 = $unsigned(wire0);
  assign wire17 = $signed(($signed(($unsigned(reg14) <<< (-reg14))) ?
                      reg12[(2'h2):(2'h2)] : (((reg13 & (8'hb5)) < {reg11,
                          (8'hb0)}) != wire0)));
  assign wire18 = $signed(((^~$signed($signed(wire17))) ? (|reg9) : (8'haf)));
endmodule
