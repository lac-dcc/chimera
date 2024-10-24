module top
#(parameter param21 = ((((((8'hbb) >> (8'hb5)) ? (|(8'hab)) : ((8'hab) == (8'ha3))) + {(^(8'hb4)), (8'hba)}) ? ((((8'hb1) ? (8'hb2) : (8'hb0)) ? (&(8'h9d)) : (~^(8'hae))) > (((8'ha6) ? (8'hb9) : (8'haa)) ? (8'ha6) : ((8'ha6) ? (8'hb5) : (7'h42)))) : ((!((8'hb0) > (8'hb5))) == ((!(8'hb7)) & {(8'hb8)}))) >>> (~{(~((7'h43) <= (8'hb6))), (((8'hb8) >> (8'ha9)) >>> ((8'hab) ? (8'ha7) : (8'hb2)))})), 
parameter param22 = ((^(~^(param21 ^ (param21 ? param21 : param21)))) <<< param21))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h9e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire [(2'h3):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire20;
  wire [(2'h3):(1'h0)] wire8;
  wire [(4'h8):(1'h0)] wire7;
  wire signed [(4'hd):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire5;
  wire signed [(2'h3):(1'h0)] wire4;
  reg signed [(4'h9):(1'h0)] reg19 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg18 = (1'h0);
  reg [(4'h9):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg15 = (1'h0);
  reg [(4'h8):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg13 = (1'h0);
  reg [(3'h6):(1'h0)] reg12 = (1'h0);
  reg [(4'he):(1'h0)] reg11 = (1'h0);
  reg [(5'h10):(1'h0)] reg10 = (1'h0);
  reg [(5'h15):(1'h0)] reg9 = (1'h0);
  assign y = {wire20,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg19,
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
                 (1'h0)};
  assign wire4 = $signed(((wire3[(4'h9):(3'h4)] ?
                     (^~{wire2, (8'ha8)}) : ((wire0 ?
                         wire2 : wire0) != (~|wire3))) && wire2));
  assign wire5 = $unsigned(wire1[(1'h0):(1'h0)]);
  assign wire6 = wire2;
  assign wire7 = (wire4 ?
                     (wire3 == ($unsigned((^(8'h9e))) + $unsigned($unsigned(wire1)))) : wire2[(2'h3):(2'h3)]);
  assign wire8 = wire6[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if (((wire6[(2'h2):(2'h2)] ? wire7 : {wire2}) - ($signed(((wire1 ?
                  wire6 : (8'hb1)) ?
              $unsigned(wire6) : $unsigned(wire4))) ?
          (wire2[(1'h0):(1'h0)] ^~ (+(7'h44))) : $unsigned(wire3[(4'hb):(1'h0)]))))
        begin
          reg9 <= (wire5[(4'hd):(3'h7)] ?
              $signed((+$unsigned((wire5 ?
                  wire5 : (8'hb3))))) : $signed({(8'haa),
                  $unsigned(wire3[(4'h9):(1'h1)])}));
        end
      else
        begin
          if ({{wire2, (~^wire5[(4'hd):(3'h6)])}, reg9[(4'h8):(1'h0)]})
            begin
              reg9 <= (~^wire8);
              reg10 <= $signed((wire1 ? wire4 : (^wire2)));
              reg11 <= (-wire4[(2'h3):(2'h3)]);
            end
          else
            begin
              reg9 <= $signed((wire1 >= (+((~^(8'hb2)) * (wire7 <<< wire4)))));
              reg10 <= $unsigned($unsigned(((-wire3[(4'hb):(2'h2)]) <= ($signed(wire2) * (!reg9)))));
            end
          if ({((~&(wire1 ?
                  (wire1 ?
                      wire8 : wire3) : (~&reg11))) >> {(wire7[(1'h1):(1'h1)] ^~ (wire0 ?
                      wire0 : wire1))})})
            begin
              reg12 <= (~((~(8'hb8)) ?
                  wire5 : (~^{(wire4 ? reg10 : (8'h9f))})));
              reg13 <= {$unsigned((((^(8'hbf)) ^~ $signed(reg12)) ?
                      $unsigned((&wire2)) : reg11[(4'hc):(4'h9)])),
                  wire8};
            end
          else
            begin
              reg12 <= ((wire8[(2'h2):(1'h1)] ?
                  wire5[(3'h5):(2'h3)] : $unsigned($unsigned($signed(wire5)))) ~^ wire2);
              reg13 <= (8'hab);
              reg14 <= ($unsigned({(8'hae)}) == reg12);
            end
          if ($signed(($unsigned((|(wire6 >> wire6))) ?
              wire8[(1'h0):(1'h0)] : (~&$unsigned($signed(wire4))))))
            begin
              reg15 <= (~&{wire4, reg9});
            end
          else
            begin
              reg15 <= {(wire3[(3'h5):(2'h3)] && (wire2[(1'h0):(1'h0)] & $signed($signed((8'hb5))))),
                  ({((wire2 ? wire2 : reg12) ?
                          (8'ha3) : wire8[(2'h2):(1'h1)])} | $signed((~^(reg14 ?
                      reg15 : reg14))))};
            end
          reg16 <= ((|($signed((+(7'h42))) ?
              reg10 : (wire3 ?
                  (wire2 ?
                      reg9 : wire8) : (^reg13)))) ^ {$unsigned(((~|wire5) >> {reg15})),
              (~^(^~{reg12, (8'haa)}))});
        end
      reg17 <= reg11[(4'hb):(1'h0)];
      reg18 <= wire7[(2'h3):(2'h3)];
      reg19 <= $signed(wire1);
    end
  assign wire20 = $signed(($signed((^(wire2 >> wire3))) ~^ reg12[(1'h0):(1'h0)]));
endmodule
