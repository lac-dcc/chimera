module top
#(parameter param23 = {((^{((8'hbc) ? (8'ha6) : (8'hb0))}) ? (((+(7'h43)) ? ((8'ha3) || (7'h43)) : ((8'ha5) ? (7'h41) : (8'ha3))) << ((-(8'ha6)) ? {(8'hac), (8'hbe)} : (-(8'hbd)))) : (-(&((8'hbb) << (8'ha4)))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'he2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(4'hb):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire22;
  wire [(4'hd):(1'h0)] wire21;
  wire [(5'h14):(1'h0)] wire20;
  wire [(5'h10):(1'h0)] wire19;
  wire [(4'hd):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire4;
  reg signed [(5'h14):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg17 = (1'h0);
  reg [(3'h7):(1'h0)] reg16 = (1'h0);
  reg [(4'ha):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg13 = (1'h0);
  reg [(4'h9):(1'h0)] reg12 = (1'h0);
  reg signed [(4'he):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg10 = (1'h0);
  reg [(4'h9):(1'h0)] reg9 = (1'h0);
  reg [(4'he):(1'h0)] reg8 = (1'h0);
  reg [(4'hb):(1'h0)] reg7 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg6 = (1'h0);
  assign y = {wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire5,
                 wire4,
                 reg18,
                 reg17,
                 reg16,
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
  assign wire4 = $signed($unsigned($unsigned($unsigned(wire3))));
  assign wire5 = ({((-$signed((8'hb3))) >= (wire2[(3'h4):(3'h4)] ?
                         (wire2 ?
                             wire3 : wire3) : wire3[(4'hd):(1'h0)]))} >>> $unsigned((8'hb1)));
  always
    @(posedge clk) begin
      reg6 <= (((($unsigned(wire1) ?
          (wire1 || wire1) : $unsigned(wire0)) && $signed(wire3)) - $unsigned($signed($unsigned((8'haf))))) * (|(wire2 ?
          $signed((wire5 ? wire3 : wire0)) : ((^wire4) ^ (wire4 >>> wire4)))));
      if (((-{(((7'h42) ? wire0 : wire4) >= wire2[(1'h0):(1'h0)]), wire5}) ?
          wire3[(5'h12):(3'h7)] : {({$signed(wire2), (wire0 ^ wire1)} ?
                  (-wire4[(1'h1):(1'h0)]) : ($unsigned(wire5) >> (wire4 ?
                      wire2 : reg6)))}))
        begin
          reg7 <= wire0;
          reg8 <= ($unsigned(({{wire4}} ^ ($unsigned(wire3) > reg7[(4'hb):(4'h9)]))) ?
              $unsigned((wire5 ?
                  (-{reg6,
                      wire3}) : ($unsigned(reg7) ^~ (~&wire4)))) : ($signed(reg6) ?
                  reg7[(4'h9):(1'h1)] : wire2[(2'h2):(1'h1)]));
        end
      else
        begin
          reg7 <= (wire4 ^~ ((7'h44) ?
              (^(^~((8'ha0) ? wire0 : reg6))) : $signed(reg6[(2'h2):(2'h2)])));
        end
    end
  always
    @(posedge clk) begin
      reg9 <= $signed((~(reg6 ? $signed($signed(reg8)) : wire0)));
      if (reg7)
        begin
          reg10 <= reg9;
          reg11 <= reg7[(3'h6):(2'h2)];
          reg12 <= ((8'haf) || (wire2 >>> wire0[(1'h0):(1'h0)]));
          reg13 <= (8'hbf);
        end
      else
        begin
          reg10 <= (&$signed((-(-(wire5 ^ reg6)))));
          reg11 <= $unsigned(wire4);
          reg12 <= ((8'hb2) | wire5[(2'h2):(2'h2)]);
          if (reg12)
            begin
              reg13 <= (~^({$signed((reg10 ? reg8 : wire2)), reg9} ?
                  $signed($signed(wire3)) : wire4[(2'h3):(1'h1)]));
              reg14 <= {$unsigned((8'hb2))};
              reg15 <= $unsigned((8'h9f));
              reg16 <= wire5;
              reg17 <= wire5[(1'h0):(1'h0)];
            end
          else
            begin
              reg13 <= $signed(wire5[(1'h1):(1'h1)]);
              reg14 <= ((8'hb2) | $unsigned(reg15[(4'h8):(3'h4)]));
              reg15 <= wire1;
              reg16 <= ((!(+reg13)) ? reg10[(2'h3):(2'h3)] : (8'ha9));
              reg17 <= $unsigned({$signed(wire5[(4'h8):(1'h0)])});
            end
        end
      reg18 <= $unsigned($signed(wire3[(4'hc):(4'h9)]));
    end
  assign wire19 = {(8'h9f)};
  assign wire20 = ($signed(wire3) ?
                      ((((wire1 ? reg12 : reg13) ?
                              wire0 : (~|wire1)) != $unsigned(reg10[(3'h6):(1'h0)])) ?
                          wire19 : wire5) : reg15[(3'h5):(1'h1)]);
  assign wire21 = (!((&(~|(reg16 && (7'h40)))) ?
                      ((reg13[(2'h3):(1'h0)] ? $signed(wire3) : (^~(8'hb5))) ?
                          (7'h42) : (~$signed((8'hb1)))) : $unsigned(((reg15 ?
                          (8'ha3) : reg12) - ((8'hbd) < (8'haf))))));
  assign wire22 = $signed($signed(wire1[(4'he):(4'hc)]));
endmodule
