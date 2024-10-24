module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h6a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire4;
  input wire [(3'h7):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire15;
  wire signed [(2'h3):(1'h0)] wire14;
  wire signed [(3'h5):(1'h0)] wire7;
  wire [(2'h3):(1'h0)] wire6;
  wire signed [(4'hd):(1'h0)] wire5;
  reg [(2'h3):(1'h0)] reg13 = (1'h0);
  reg [(4'ha):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg11 = (1'h0);
  reg signed [(4'he):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg9 = (1'h0);
  reg [(2'h2):(1'h0)] reg8 = (1'h0);
  assign y = {wire15,
                 wire14,
                 wire7,
                 wire6,
                 wire5,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 (1'h0)};
  assign wire5 = ((wire3[(1'h1):(1'h1)] ?
                         wire0[(3'h6):(2'h2)] : ((~|{(8'ha4), wire3}) ?
                             (|wire0) : $signed($signed((8'hbb))))) ?
                     $unsigned(($signed((~^wire4)) == $signed($signed(wire0)))) : ({$signed($unsigned((8'hab))),
                             (wire0[(3'h5):(2'h2)] ?
                                 (-wire0) : ((8'hb3) ? wire2 : wire3))} ?
                         ($unsigned($unsigned(wire4)) ?
                             wire1 : wire2[(1'h0):(1'h0)]) : $unsigned(wire4[(1'h1):(1'h1)])));
  assign wire6 = wire4;
  assign wire7 = {wire4};
  always
    @(posedge clk) begin
      reg8 <= (((wire3[(2'h2):(2'h2)] << wire0[(3'h6):(3'h4)]) ^~ wire5) ^~ ((~$unsigned(wire7[(1'h1):(1'h0)])) ?
          (^$signed($unsigned(wire2))) : $signed(wire1[(4'he):(4'h8)])));
      reg9 <= wire6[(1'h1):(1'h0)];
    end
  always
    @(posedge clk) begin
      if ((|$signed($unsigned((~^(~|wire7))))))
        begin
          reg10 <= wire1;
          if (wire1[(3'h4):(1'h0)])
            begin
              reg11 <= wire1;
            end
          else
            begin
              reg11 <= $unsigned(reg11);
            end
          reg12 <= $unsigned(((($unsigned(reg8) ?
                      (wire3 ? wire1 : (8'haf)) : $signed(wire6)) ?
                  (~(~&reg10)) : $signed($unsigned(wire5))) ?
              (~|$signed($unsigned(reg11))) : (|$unsigned({reg11}))));
          reg13 <= wire4[(3'h4):(1'h1)];
        end
      else
        begin
          reg10 <= (((~$signed((wire6 ? wire0 : reg12))) ?
              ((~&reg13) ? wire0 : (^~(&wire5))) : ({(reg9 == reg13), wire6} ?
                  ((-(8'ha7)) ?
                      ((8'ha3) ^ reg10) : wire1) : reg10[(3'h6):(2'h2)])) == wire6);
          reg11 <= {$signed($signed(($unsigned(reg12) ?
                  (reg12 ? wire4 : reg8) : {wire3}))),
              wire4[(1'h0):(1'h0)]};
          reg12 <= (+($unsigned((((8'ha3) ? reg11 : wire1) ?
                  (~|(8'hb5)) : (+(8'haa)))) ?
              (wire2[(4'hd):(2'h2)] ?
                  wire5 : $signed(wire3)) : $unsigned($signed(wire5[(3'h7):(3'h7)]))));
          reg13 <= ((&$signed((&{wire5, wire4}))) ?
              {$unsigned($signed(wire0))} : (wire6[(2'h3):(1'h0)] ?
                  $signed((~$signed(reg12))) : (|$signed($signed((8'hba))))));
        end
    end
  assign wire14 = (reg11 <<< (wire7 ^ {wire5,
                      ($unsigned(wire7) ?
                          ((8'hb3) ? reg11 : (8'ha9)) : (reg11 || wire2))}));
  assign wire15 = wire2;
endmodule
