module top
#(parameter param21 = (|(((-((8'hb6) ? (8'ha7) : (8'hb2))) || (((8'ha6) ? (8'had) : (8'h9f)) ? ((8'hba) ? (8'had) : (8'ha5)) : ((7'h41) >> (8'haa)))) <= (&({(8'ha2)} ^~ ((8'hb3) >>> (8'haf)))))), 
parameter param22 = param21)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hc6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire4;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire12;
  wire [(3'h4):(1'h0)] wire11;
  wire signed [(5'h12):(1'h0)] wire10;
  wire signed [(5'h11):(1'h0)] wire9;
  wire [(4'h8):(1'h0)] wire8;
  wire signed [(5'h15):(1'h0)] wire7;
  wire [(5'h15):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire5;
  reg [(3'h7):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg19 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg18 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg17 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg15 = (1'h0);
  reg [(3'h7):(1'h0)] reg14 = (1'h0);
  reg [(4'ha):(1'h0)] reg13 = (1'h0);
  assign y = {wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire5 = wire2[(1'h0):(1'h0)];
  assign wire6 = (((wire5 > $unsigned((wire2 << wire4))) == ((wire2[(2'h2):(2'h2)] >>> $signed(wire2)) ?
                     $unsigned($unsigned((8'ha4))) : (^(8'hbd)))) & wire1[(4'hc):(1'h1)]);
  assign wire7 = ($signed((~^((wire0 ?
                     wire3 : wire3) || $signed((8'hb9))))) != ($signed($unsigned(wire6)) ?
                     {(8'hb0)} : ({wire6[(2'h2):(1'h0)]} >> {(wire2 ?
                             wire2 : wire6),
                         wire4[(2'h3):(1'h1)]})));
  assign wire8 = wire5[(1'h1):(1'h1)];
  assign wire9 = wire6[(5'h10):(4'he)];
  assign wire10 = wire5;
  assign wire11 = wire4;
  assign wire12 = (+$unsigned($signed(wire4[(2'h2):(1'h0)])));
  always
    @(posedge clk) begin
      if (($unsigned(wire10[(2'h3):(1'h1)]) & {(^$signed(wire2)),
          wire8[(3'h4):(1'h0)]}))
        begin
          reg13 <= ($unsigned(wire11) ?
              $unsigned(wire6[(1'h0):(1'h0)]) : (~|(8'hba)));
          reg14 <= (wire7[(1'h0):(1'h0)] ? wire1[(4'h9):(2'h2)] : wire0);
          if ($signed($unsigned((((wire11 ? wire5 : (8'hae)) ?
              $signed((8'hb1)) : $unsigned(reg14)) > (|$unsigned(wire0))))))
            begin
              reg15 <= reg13[(2'h3):(1'h1)];
            end
          else
            begin
              reg15 <= (wire8 ^~ $signed(wire1));
            end
          reg16 <= wire6;
        end
      else
        begin
          reg13 <= wire8[(4'h8):(2'h3)];
          reg14 <= (-(reg13 ?
              reg13[(4'ha):(3'h7)] : (($unsigned((8'hbc)) * (reg16 ?
                  (8'hb1) : wire8)) - wire10)));
          reg15 <= (($signed(wire10[(5'h11):(4'hc)]) ?
              (((~^reg13) ?
                  (reg14 ?
                      (8'hb5) : reg13) : $unsigned(reg15)) <<< (8'hb6)) : $signed($unsigned($unsigned(reg14)))) && wire9);
        end
      reg17 <= ($signed({wire10, wire7[(4'he):(4'hc)]}) ?
          reg15 : ((7'h40) ?
              (($unsigned(wire3) ?
                  wire7[(3'h4):(1'h0)] : $signed(wire8)) ~^ (~|{wire12,
                  reg14})) : (~((wire7 ? wire5 : (8'ha7)) ?
                  wire10 : $signed(wire10)))));
      reg18 <= {(reg16 << ((wire12[(3'h4):(2'h3)] ?
                  $signed((8'h9e)) : (reg17 ? wire3 : wire12)) ?
              (^wire12[(4'hd):(4'ha)]) : $unsigned((wire6 * (8'ha0)))))};
      reg19 <= (reg13[(2'h2):(1'h1)] > {reg18});
      reg20 <= (8'hab);
    end
endmodule
