module top
#(parameter param21 = (({(((8'hba) * (8'hb1)) > (~(8'hb6))), {(&(7'h40)), (8'hbc)}} != (~((+(8'hb3)) ? ((8'hb8) && (8'had)) : (~^(8'hbc))))) != ((((~|(8'hb8)) ~^ (~^(8'ha7))) ? {((8'hac) != (8'haf))} : (((8'ha2) ^ (8'h9c)) > ((8'hb8) ^~ (8'ha9)))) + {{{(8'hb7)}, ((8'hb2) && (8'hac))}, (((8'hb1) == (8'ha9)) ? ((8'hb1) ? (8'hb1) : (8'hb3)) : {(8'hac)})})), 
parameter param22 = ((^param21) ~^ param21))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hc6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(4'hd):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire20;
  wire signed [(3'h5):(1'h0)] wire11;
  wire [(3'h6):(1'h0)] wire10;
  wire [(2'h2):(1'h0)] wire9;
  wire [(3'h6):(1'h0)] wire8;
  wire [(5'h10):(1'h0)] wire7;
  reg signed [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg18 = (1'h0);
  reg [(5'h11):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg15 = (1'h0);
  reg [(3'h6):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(4'h8):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg5 = (1'h0);
  reg [(4'ha):(1'h0)] reg4 = (1'h0);
  assign y = {wire20,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= $signed($unsigned(((!wire3) ?
          {{(8'haf)}, wire2[(3'h6):(1'h0)]} : ({wire1,
              wire0} == wire1[(3'h6):(1'h0)]))));
      reg5 <= (~|(($unsigned((~(8'ha4))) == wire1) < $signed((^wire1))));
      reg6 <= $unsigned($signed(wire3[(5'h12):(5'h12)]));
    end
  assign wire7 = reg6[(1'h0):(1'h0)];
  assign wire8 = (($unsigned(wire7) ?
                     (wire1[(2'h2):(1'h1)] ?
                         ({reg4} ?
                             $unsigned(wire3) : $signed(wire2)) : {reg5}) : wire1) >> wire0[(1'h0):(1'h0)]);
  assign wire9 = ($signed(((-(reg4 == wire2)) ?
                         $unsigned(reg4) : $unsigned($unsigned(reg6)))) ?
                     $signed($signed(wire3)) : wire8);
  assign wire10 = $signed(((+((-wire9) - wire2)) & (~&$signed(wire8))));
  assign wire11 = wire3[(4'h9):(2'h2)];
  always
    @(posedge clk) begin
      reg12 <= wire9;
      reg13 <= {($signed($unsigned($unsigned(wire7))) ?
              wire11[(3'h4):(1'h1)] : $signed($unsigned(((8'haa) * wire10)))),
          reg12};
      if ($unsigned($signed($unsigned(wire0))))
        begin
          reg14 <= (^~$signed($unsigned($signed((wire11 ? reg5 : (8'hb7))))));
          reg15 <= {wire11[(3'h5):(1'h1)], $signed(reg4)};
          reg16 <= ($unsigned((wire7[(4'hb):(2'h2)] ~^ wire11)) ?
              {wire9,
                  (wire7 ^~ ((&wire8) ?
                      (reg13 + wire10) : $signed((8'hb4))))} : (((wire7[(5'h10):(4'hf)] ?
                      reg6 : reg15[(3'h4):(2'h3)]) ?
                  {(reg12 ? (8'ha9) : reg14),
                      wire2[(4'ha):(2'h3)]} : $signed((wire0 ?
                      wire1 : reg12))) + ((8'hae) ?
                  reg6[(3'h4):(1'h0)] : ((reg4 ? reg5 : wire11) ?
                      (reg13 ? reg14 : wire2) : (wire11 ? wire9 : (7'h40))))));
          reg17 <= (^~$signed({($signed(wire3) ?
                  (reg13 <<< reg16) : reg14[(1'h1):(1'h1)]),
              reg15}));
        end
      else
        begin
          reg14 <= $unsigned((8'ha4));
        end
      reg18 <= $signed($signed((((wire1 || wire0) == (reg5 >> reg17)) + (((8'h9e) ~^ reg16) ?
          (wire2 ? reg4 : wire1) : wire1))));
      reg19 <= ((8'h9c) < reg15[(3'h7):(2'h2)]);
    end
  assign wire20 = ($signed($signed(reg15)) ?
                      wire11 : $signed({$signed($unsigned((8'had))),
                          $unsigned(wire2)}));
endmodule
