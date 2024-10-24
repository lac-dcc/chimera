module top
#(parameter param17 = ((^~(&({(8'ha7), (8'haa)} <= ((8'hac) ? (8'h9c) : (8'ha9))))) ? (&(({(8'hb0)} * ((8'ha1) ? (8'hb2) : (8'h9e))) > (((8'hb0) && (8'ha3)) >= ((7'h40) >= (7'h42))))) : (|(~&(&(7'h42))))), 
parameter param18 = (~&((((-param17) + (param17 ~^ (8'hba))) ? (|((8'ha6) ? param17 : param17)) : ((param17 > param17) >> (param17 >> param17))) - (((param17 + (8'hb5)) ? (^param17) : (+(7'h42))) ? (~|(7'h41)) : (param17 ? (param17 >> param17) : param17)))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h91):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire [(4'he):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire16;
  wire signed [(3'h6):(1'h0)] wire9;
  wire [(5'h10):(1'h0)] wire8;
  wire signed [(4'hb):(1'h0)] wire7;
  wire [(4'h9):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire4;
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg13 = (1'h0);
  reg [(4'hd):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg11 = (1'h0);
  reg [(5'h13):(1'h0)] reg10 = (1'h0);
  assign y = {wire16,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 (1'h0)};
  assign wire4 = $signed((($unsigned(wire2) ?
                         ($signed(wire0) ?
                             (~^wire3) : $signed(wire3)) : ((wire0 ?
                             wire0 : (7'h42)) * (wire0 ? wire0 : (8'ha1)))) ?
                     {(8'hb4),
                         ($unsigned(wire0) ?
                             (wire2 || wire3) : (wire1 || (8'ha7)))} : {((&wire0) ?
                             wire2[(5'h11):(3'h4)] : wire3[(4'hd):(3'h7)]),
                         (wire2[(5'h13):(3'h7)] ?
                             {wire1, wire1} : wire1[(2'h2):(2'h2)])}));
  assign wire5 = wire4[(1'h0):(1'h0)];
  assign wire6 = $unsigned(wire1[(1'h1):(1'h0)]);
  assign wire7 = (($signed((wire0 ? wire1[(2'h2):(1'h1)] : (&wire0))) ?
                     (~wire5) : (wire5 ?
                         $unsigned($unsigned(wire3)) : $signed($unsigned(wire3)))) < (|(wire5 < wire0)));
  assign wire8 = {((&wire3) && wire2[(3'h6):(2'h3)])};
  assign wire9 = (wire1 ?
                     $unsigned(wire2[(4'hf):(3'h4)]) : ($unsigned($unsigned(wire3[(3'h4):(1'h0)])) * (($signed(wire3) == (wire6 ?
                         wire1 : (8'hac))) ^~ (wire4[(4'h9):(1'h0)] ?
                         (wire0 != wire5) : (wire1 ? (8'ha2) : wire4)))));
  always
    @(posedge clk) begin
      reg10 <= (((wire0[(3'h4):(1'h0)] ^ ((wire0 ? wire2 : wire7) ?
          (wire6 ? wire8 : wire8) : {wire3})) >> wire6) ^~ {(&wire1)});
      if (wire5)
        begin
          reg11 <= ($unsigned((|(~&wire0))) ? (|wire1) : wire8[(1'h0):(1'h0)]);
          reg12 <= (wire2 != ((&$unsigned($signed(wire4))) >> $unsigned(wire8[(3'h7):(3'h7)])));
          reg13 <= $signed(((8'hbd) >= (((wire2 >= reg10) ?
              (wire7 ? (8'hb6) : (8'ha1)) : (+wire1)) >> (reg10 >= (wire8 ?
              wire6 : reg12)))));
          reg14 <= $signed((($signed((&wire1)) < {(reg10 ?
                  (8'ha8) : reg10)}) > {wire9[(3'h6):(1'h1)]}));
          reg15 <= ((reg10 ?
              ({(~|(8'haf))} <= ($unsigned(wire7) ?
                  wire4[(4'hb):(3'h4)] : $unsigned((8'hb8)))) : (({wire2,
                      wire6} + wire6) ?
                  reg10 : (!$unsigned(reg10)))) != wire1);
        end
      else
        begin
          reg11 <= $signed($signed((!$unsigned($signed(wire4)))));
          reg12 <= (((wire0[(1'h1):(1'h0)] > wire7) ?
              (reg11[(2'h2):(1'h0)] ?
                  {wire4[(1'h1):(1'h0)]} : ($signed(reg10) ?
                      reg11 : $signed((8'hb1)))) : (+$signed((wire8 ?
                  wire2 : (8'hb7))))) == $signed({wire9, (~|wire1)}));
        end
    end
  assign wire16 = wire9;
endmodule
