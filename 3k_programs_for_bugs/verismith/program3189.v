module top
#(parameter param18 = ({((+((8'hb5) ? (8'ha9) : (8'hba))) < ((+(8'hb5)) ? ((8'hb9) <<< (8'ha7)) : ((8'hb4) ? (8'hb7) : (8'hb7))))} ? {(((8'had) - (!(8'hb9))) <= (((8'hb9) ? (8'hbe) : (8'hab)) ? {(8'hab)} : ((7'h42) ? (7'h42) : (8'ha7))))} : {(~&(((8'hb4) ? (8'ha9) : (8'hb3)) ? ((8'hba) < (8'hb0)) : {(8'ha7)})), {((&(8'hac)) ^ (!(8'hb9)))}}), 
parameter param19 = (((((~|param18) ? (param18 & (8'ha2)) : (param18 <= param18)) ? ((param18 & param18) ^ (-param18)) : param18) ? ((~&((8'haa) << param18)) ? param18 : {(!param18)}) : param18) ? ((param18 < param18) && (|{param18})) : param18))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h98):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire17;
  wire signed [(5'h11):(1'h0)] wire4;
  reg [(4'hf):(1'h0)] reg16 = (1'h0);
  reg [(4'h8):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg14 = (1'h0);
  reg [(4'hc):(1'h0)] reg13 = (1'h0);
  reg [(3'h7):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg10 = (1'h0);
  reg [(5'h11):(1'h0)] reg9 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg8 = (1'h0);
  reg [(3'h7):(1'h0)] reg7 = (1'h0);
  reg [(4'he):(1'h0)] reg6 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg5 = (1'h0);
  assign y = {wire17,
                 wire4,
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
                 reg5,
                 (1'h0)};
  assign wire4 = (wire0 < wire2[(4'h9):(3'h7)]);
  always
    @(posedge clk) begin
      reg5 <= $unsigned($signed($signed(wire2)));
      reg6 <= ($unsigned(wire4) ?
          wire2[(2'h3):(2'h3)] : (wire1 >= (wire0[(4'he):(3'h4)] != ($unsigned(reg5) ?
              reg5 : wire3))));
    end
  always
    @(posedge clk) begin
      reg7 <= ((8'ha2) ?
          ({{reg5},
                  ($signed(wire2) ?
                      wire3[(1'h1):(1'h0)] : ((8'hbd) ? (8'hb3) : wire0))} ?
              ({wire0} ? (8'hb9) : (&wire4)) : (^~reg6)) : reg6);
      reg8 <= ($unsigned(wire4) ?
          (!(|$unsigned({reg7, wire1}))) : wire1[(2'h2):(1'h1)]);
      reg9 <= $unsigned($unsigned(reg5));
      reg10 <= $unsigned(reg8[(3'h5):(1'h0)]);
      if (((-wire1[(2'h3):(1'h1)]) ~^ (&$unsigned($signed(wire4[(3'h7):(3'h7)])))))
        begin
          if (wire0)
            begin
              reg11 <= wire3;
              reg12 <= reg11[(2'h2):(1'h0)];
              reg13 <= reg8[(3'h5):(1'h0)];
            end
          else
            begin
              reg11 <= ($unsigned($unsigned((&(~reg7)))) <<< wire0[(4'hc):(4'h8)]);
              reg12 <= {(!(8'hac)), reg6};
              reg13 <= (~|(($signed(wire1) != $signed(wire1)) >= (wire4[(2'h3):(1'h1)] ?
                  ($signed(reg7) != reg13) : {(wire3 < reg6)})));
            end
          reg14 <= $unsigned(wire1);
          reg15 <= ((reg9 ?
                  (+$signed(reg8[(2'h2):(2'h2)])) : ($unsigned((reg12 && reg8)) ?
                      ((|(8'hba)) ?
                          $unsigned(wire1) : {(7'h42), wire0}) : ({(8'hbb),
                              reg6} ?
                          $signed((8'hbf)) : (&wire1)))) ?
              reg12[(3'h6):(2'h2)] : reg5);
          reg16 <= $unsigned((!{wire4}));
        end
      else
        begin
          reg11 <= ($signed(reg6[(3'h5):(3'h4)]) ?
              $signed(((!reg8[(1'h1):(1'h0)]) ?
                  {(~wire4)} : {(&wire1), {reg16, (8'hb3)}})) : (8'hb2));
          reg12 <= $signed(reg10);
        end
    end
  assign wire17 = wire4;
endmodule
