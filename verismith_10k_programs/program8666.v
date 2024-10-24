module top
#(parameter param19 = (((((^(8'hb3)) ? ((7'h40) ? (8'hb0) : (8'ha2)) : (~&(8'hbf))) ? (((8'ha4) || (8'ha1)) <= (+(8'hb5))) : {(-(8'ha6))}) >= (-((8'ha6) ? (8'hb9) : ((8'h9c) ? (8'hac) : (8'hb9))))) && {{{{(8'hb9), (8'ha4)}}}}), 
parameter param20 = (~((param19 ? param19 : (param19 == param19)) ^ (^~(&{param19})))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h9f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire3;
  input wire [(3'h6):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire18;
  wire signed [(2'h3):(1'h0)] wire10;
  wire [(4'h9):(1'h0)] wire9;
  wire signed [(3'h7):(1'h0)] wire8;
  wire [(5'h13):(1'h0)] wire5;
  wire [(3'h7):(1'h0)] wire4;
  reg signed [(4'he):(1'h0)] reg17 = (1'h0);
  reg [(4'h9):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg15 = (1'h0);
  reg [(4'h8):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg13 = (1'h0);
  reg [(5'h14):(1'h0)] reg12 = (1'h0);
  reg [(5'h14):(1'h0)] reg11 = (1'h0);
  reg [(4'h9):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg6 = (1'h0);
  assign y = {wire18,
                 wire10,
                 wire9,
                 wire8,
                 wire5,
                 wire4,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = $unsigned((wire3[(2'h2):(1'h1)] >> $signed($signed((wire3 < wire2)))));
  assign wire5 = ($signed($unsigned((wire3[(1'h0):(1'h0)] > $signed(wire0)))) ?
                     $signed($unsigned({(wire0 ? wire4 : wire3)})) : ({wire2} ?
                         wire4 : wire0[(1'h1):(1'h1)]));
  always
    @(posedge clk) begin
      if ({$signed(wire5[(5'h10):(2'h3)]), $signed(wire4[(3'h6):(1'h0)])})
        begin
          reg6 <= $signed((wire5[(2'h2):(1'h1)] ?
              wire3[(2'h2):(2'h2)] : ($unsigned((~&wire5)) ?
                  (wire3 <<< (^wire2)) : (wire3[(1'h0):(1'h0)] - (wire0 ~^ wire0)))));
        end
      else
        begin
          reg6 <= (({reg6[(3'h5):(1'h0)],
              wire3[(1'h0):(1'h0)]} || (^wire3[(2'h2):(1'h0)])) << $unsigned((wire1[(2'h3):(1'h1)] | $signed($unsigned(reg6)))));
        end
      reg7 <= $signed((wire0 << ($signed((+wire2)) ?
          {{wire4, (8'ha9)}, ((8'hb7) >= wire1)} : (wire2[(3'h4):(3'h4)] ?
              wire3[(1'h1):(1'h1)] : (reg6 - wire0)))));
    end
  assign wire8 = $signed($unsigned(wire1));
  assign wire9 = (wire0 ?
                     {wire5[(2'h3):(1'h1)],
                         ((reg7[(1'h1):(1'h1)] && $unsigned(wire2)) - $signed((wire4 ?
                             (8'h9f) : wire8)))} : wire1[(2'h2):(1'h0)]);
  assign wire10 = (^(~$unsigned(($unsigned(wire5) ?
                      (reg7 >= wire3) : $signed(wire3)))));
  always
    @(posedge clk) begin
      if ($unsigned((wire3 || (~^$unsigned(wire8[(3'h7):(1'h1)])))))
        begin
          if ((($signed(((&wire1) ?
                  $unsigned(wire9) : (wire8 << wire10))) > (((wire4 ^ reg6) ^ $unsigned(reg6)) ^~ ((7'h44) ?
                  (wire5 ? reg6 : wire8) : $unsigned(wire3)))) ?
              (!{($unsigned(wire3) >= (wire3 >= wire9))}) : reg7))
            begin
              reg11 <= wire4;
              reg12 <= $unsigned($unsigned((((wire8 ?
                      wire1 : wire0) > $unsigned(reg6)) ?
                  ((^~(8'hb5)) >>> $signed(reg11)) : wire0[(2'h2):(2'h2)])));
              reg13 <= reg11[(4'hc):(1'h1)];
            end
          else
            begin
              reg11 <= {(($signed($unsigned(wire2)) | ((&(8'ha9)) || (wire4 <= reg11))) ?
                      reg12[(5'h12):(5'h10)] : wire8),
                  ((wire10[(2'h3):(2'h3)] + ({(8'hab)} ?
                      (~^(8'h9c)) : reg6[(3'h4):(1'h1)])) & $unsigned(wire2))};
            end
          reg14 <= wire10[(1'h0):(1'h0)];
          reg15 <= $unsigned(({wire8} | $unsigned($signed((wire8 ?
              (7'h40) : (8'h9d))))));
          reg16 <= ($unsigned((!$unsigned($signed(reg12)))) ?
              (reg11 | (^$unsigned((~wire10)))) : wire0[(1'h0):(1'h0)]);
        end
      else
        begin
          reg11 <= wire3;
        end
      reg17 <= ($signed((^{$unsigned(reg15)})) ?
          $unsigned((wire1[(2'h2):(1'h0)] * ((8'h9d) ?
              wire9[(2'h2):(1'h1)] : (reg12 ? wire9 : wire4)))) : {reg7});
    end
  assign wire18 = reg14[(2'h3):(1'h0)];
endmodule
