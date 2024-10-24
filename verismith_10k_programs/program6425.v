module top
#(parameter param17 = ((((|((8'hb2) ? (8'ha0) : (8'hb2))) ^~ (((8'ha6) - (8'hab)) << ((8'ha7) ? (8'hba) : (8'had)))) && ((8'ha5) << ((~^(8'hb5)) ? (8'ha1) : ((8'hbf) >= (7'h40))))) ? (((8'ha8) >= {{(8'hb1), (8'ha6)}, ((8'haa) ? (8'h9f) : (8'ha5))}) | ((((8'haf) - (8'hba)) ? ((8'hb7) ~^ (8'ha8)) : ((8'hb4) ? (8'hb3) : (8'hba))) ? {(~(8'hb1)), (~&(8'hb7))} : (^~((7'h42) ~^ (8'ha8))))) : {((((8'ha4) ? (8'hb0) : (8'hb2)) ? ((8'hb8) ? (8'hbc) : (8'ha7)) : (8'hb1)) ? (((8'haa) | (8'hbc)) ? (~(8'ha7)) : ((8'h9e) >= (8'hbc))) : (+((8'ha6) ? (8'hbc) : (8'hbb)))), ((((8'hbe) ? (8'hb1) : (8'ha9)) ? (^~(8'haa)) : (|(8'ha3))) ? (~|(~|(8'ha1))) : {(8'hb5)})}), 
parameter param18 = (((&((!(8'hb8)) >> (param17 ? param17 : param17))) | ((-(~(8'hbd))) > (&(~&param17)))) * (param17 < (param17 < param17))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hab):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire4;
  input wire signed [(5'h13):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire signed [(2'h2):(1'h0)] wire1;
  input wire [(3'h6):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire10;
  wire signed [(5'h10):(1'h0)] wire9;
  wire signed [(4'hd):(1'h0)] wire8;
  wire [(4'he):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire6;
  wire [(5'h14):(1'h0)] wire5;
  reg signed [(4'ha):(1'h0)] reg16 = (1'h0);
  reg [(5'h13):(1'h0)] reg15 = (1'h0);
  reg [(4'hc):(1'h0)] reg14 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg13 = (1'h0);
  reg [(2'h2):(1'h0)] reg12 = (1'h0);
  reg [(5'h15):(1'h0)] reg11 = (1'h0);
  assign y = {wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 (1'h0)};
  assign wire5 = (($signed((8'h9d)) ?
                     wire4 : (-wire0[(2'h3):(2'h3)])) | (wire3[(2'h2):(1'h1)] ?
                     $signed(($unsigned(wire2) ^~ (wire4 <<< wire0))) : $unsigned(wire0[(1'h0):(1'h0)])));
  assign wire6 = ({wire3} ? (&wire3[(5'h11):(5'h11)]) : wire2[(2'h2):(1'h0)]);
  assign wire7 = {$signed((wire2 ?
                         wire2 : ((wire6 * (8'ha6)) < $signed(wire1)))),
                     (($unsigned(wire5[(5'h11):(4'hf)]) >= $unsigned((wire0 < wire3))) >>> $signed(((wire2 ~^ wire2) ?
                         wire5[(2'h2):(2'h2)] : wire3)))};
  assign wire8 = (wire2 ^ (wire4[(3'h4):(1'h1)] < (wire7[(1'h0):(1'h0)] ^ (8'hb0))));
  assign wire9 = ((&{$signed((~&wire7)),
                     $signed((-(8'ha3)))}) << wire2[(2'h2):(1'h1)]);
  assign wire10 = (|(($unsigned((wire3 ?
                          wire8 : (8'hab))) <= wire9[(3'h4):(1'h1)]) ?
                      $unsigned((8'ha2)) : (((wire6 == wire7) ?
                          wire0[(3'h6):(2'h2)] : wire0) & $signed(wire6))));
  always
    @(posedge clk) begin
      reg11 <= $signed(wire9);
      if ((wire3[(4'ha):(1'h0)] ~^ (wire9 ?
          $unsigned(wire5[(5'h14):(5'h13)]) : wire2)))
        begin
          if ($unsigned((($signed((~(8'ha5))) ?
              {(wire0 ? wire0 : wire10),
                  $unsigned((8'hba))} : (&$signed((8'hbd)))) > {$unsigned({(8'ha8)})})))
            begin
              reg12 <= $signed($unsigned($signed(((wire3 <<< (8'hb7)) ?
                  wire5 : wire8))));
            end
          else
            begin
              reg12 <= {wire8[(3'h7):(3'h5)], reg11};
              reg13 <= $signed(wire5);
              reg14 <= (wire0 ?
                  $signed({($signed(wire3) <<< wire2[(3'h4):(1'h0)])}) : $unsigned(($unsigned($unsigned(wire7)) >> $signed($signed(reg11)))));
            end
          reg15 <= ($unsigned(reg12) >= (wire10 ?
              (^(|(wire3 > wire7))) : wire1[(1'h0):(1'h0)]));
          reg16 <= reg11[(4'hb):(1'h0)];
        end
      else
        begin
          reg12 <= {(reg12[(1'h0):(1'h0)] ?
                  (wire8 ?
                      (~^$signed((7'h42))) : wire0[(2'h3):(1'h0)]) : wire4[(1'h1):(1'h0)]),
              wire6[(2'h2):(2'h2)]};
          reg13 <= wire2;
        end
    end
endmodule
