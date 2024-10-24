module top
#(parameter param18 = ({(^~(((8'h9e) & (8'hb9)) > (&(8'h9e)))), (-(&((8'hb0) ? (8'h9f) : (8'ha4))))} ? ((^~(((8'hba) && (7'h42)) >>> ((8'hb8) ? (8'ha0) : (7'h40)))) <<< ((^(|(8'hbf))) << (&((8'ha6) ? (8'hb6) : (8'hb0))))) : (((|((8'ha4) ? (8'hab) : (8'had))) ? ((~&(8'hbd)) || ((8'hb3) ? (8'hbc) : (8'hbf))) : (((8'hb8) ? (8'hb2) : (8'hb6)) & ((8'ha8) ? (8'hb2) : (8'ha3)))) ? (((~|(7'h40)) ? ((8'ha8) > (8'hae)) : ((8'ha9) ? (8'hb1) : (8'hab))) < (((8'hbe) ? (7'h44) : (8'ha3)) ? (8'hb0) : (+(8'hb3)))) : ((^(!(8'ha0))) ? (8'had) : (8'haf)))), 
parameter param19 = ((~&{((param18 <<< param18) ? (|param18) : param18), (param18 <= (~^(8'hac)))}) ? {(~|(|{param18, param18})), (~^({(8'h9d)} ? (~|param18) : (param18 ? param18 : param18)))} : param18))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'ha0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(2'h2):(1'h0)] wire0;
  wire [(4'hb):(1'h0)] wire6;
  wire signed [(2'h2):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire4;
  reg signed [(4'hc):(1'h0)] reg17 = (1'h0);
  reg [(3'h7):(1'h0)] reg16 = (1'h0);
  reg [(4'hc):(1'h0)] reg15 = (1'h0);
  reg [(5'h13):(1'h0)] reg14 = (1'h0);
  reg [(2'h3):(1'h0)] reg13 = (1'h0);
  reg [(4'hc):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg10 = (1'h0);
  reg [(5'h15):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg7 = (1'h0);
  assign y = {wire6,
                 wire5,
                 wire4,
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
                 (1'h0)};
  assign wire4 = wire0[(2'h2):(1'h0)];
  assign wire5 = (wire2[(2'h2):(2'h2)] & ({wire4} ?
                     ($unsigned((wire2 < (8'hbe))) >= wire4) : $unsigned((8'hb5))));
  assign wire6 = (~|$signed(wire1));
  always
    @(posedge clk) begin
      reg7 <= (8'ha8);
      reg8 <= (-((8'ha8) > wire0));
      if ((wire2[(3'h6):(2'h3)] ?
          ({(~wire2[(4'h8):(4'h8)]), $signed($unsigned(wire3))} <= {wire3,
              $signed($unsigned(wire6))}) : $signed(({(reg8 ~^ wire6),
                  reg8[(2'h2):(1'h0)]} ?
              $signed(((8'had) | wire6)) : $unsigned((+wire4))))))
        begin
          reg9 <= ((((+wire6) - ((wire1 + reg8) ? wire5 : wire4)) ?
                  (^~{(reg7 ? (8'hb7) : reg7)}) : reg8) ?
              (~&(~(~wire6))) : ($signed(((reg8 ?
                  wire1 : wire6) * wire0)) >> wire6[(4'h8):(2'h3)]));
          if (((((8'h9f) ?
              (wire1[(3'h7):(3'h6)] | (wire1 < reg9)) : wire6) <<< $signed($signed($signed((8'hb1))))) && {{((8'had) ?
                      wire5[(2'h2):(2'h2)] : (~wire1)),
                  (!((8'had) ? wire4 : reg7))}}))
            begin
              reg10 <= (|reg8[(4'h9):(3'h5)]);
            end
          else
            begin
              reg10 <= $signed($signed(wire4));
              reg11 <= reg10;
            end
          reg12 <= $unsigned(reg8);
          reg13 <= wire0[(1'h1):(1'h1)];
        end
      else
        begin
          reg9 <= wire5[(1'h0):(1'h0)];
          if ($unsigned($signed(wire4[(4'h8):(2'h3)])))
            begin
              reg10 <= wire6;
              reg11 <= (8'h9f);
              reg12 <= (+reg9[(2'h3):(1'h0)]);
              reg13 <= reg12;
              reg14 <= (~|reg10);
            end
          else
            begin
              reg10 <= (8'hb1);
              reg11 <= wire1;
              reg12 <= (wire6 - (reg12[(4'hb):(4'hb)] > ((!$signed(wire5)) <<< reg13)));
              reg13 <= (reg8[(4'h8):(4'h8)] ?
                  wire4[(1'h1):(1'h0)] : reg7[(2'h2):(1'h1)]);
              reg14 <= ((reg7 ?
                      $signed($signed(reg13[(2'h3):(2'h3)])) : (~^$unsigned(wire5))) ?
                  (8'hb1) : wire3[(2'h2):(2'h2)]);
            end
          reg15 <= {{$unsigned(reg8),
                  (wire2 == ((wire1 ? wire2 : (8'hb7)) ^ $signed(reg10)))}};
        end
      reg16 <= (((^{$signed(wire4)}) ?
              {{reg15[(4'hc):(3'h5)], wire6[(3'h6):(2'h3)]},
                  ((&wire3) ?
                      reg7[(4'h9):(1'h0)] : ((7'h44) == reg10))} : (((wire0 ?
                  wire0 : wire0) - wire5) <= (wire3[(4'h9):(1'h1)] >> (-(8'hac))))) ?
          ($signed((wire3 ? reg13 : wire6)) <<< (^(8'ha8))) : reg11);
      reg17 <= $signed(((reg12[(1'h1):(1'h0)] ^ ((reg13 ? reg9 : reg16) ?
              (8'ha6) : (wire3 ? (8'hb5) : reg10))) ?
          ((~&$signed(reg7)) >= reg16[(2'h2):(1'h1)]) : $unsigned($signed(((8'hb7) ?
              reg8 : (7'h41))))));
    end
endmodule
