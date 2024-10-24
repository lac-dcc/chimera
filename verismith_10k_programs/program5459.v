module top
#(parameter param18 = (({((~^(8'hb3)) * ((7'h44) <<< (8'ha3)))} <= (-((!(8'hae)) != (8'hb5)))) ? ((((&(8'ha3)) ? ((8'hb4) ? (7'h40) : (8'hb3)) : (-(8'hb2))) != (((7'h42) >>> (8'hb8)) ? ((8'hb4) ? (8'had) : (8'ha9)) : (~(8'hbb)))) ? (-((|(8'ha7)) ? ((8'ha1) & (8'hab)) : ((8'hb7) <= (7'h43)))) : (&{((8'hb5) || (8'hbf))})) : ((((8'haf) | ((8'ha0) > (8'h9e))) ? (+((8'haf) ? (8'hb4) : (7'h43))) : (((8'ha1) <<< (8'hac)) << ((8'hac) ? (7'h43) : (8'hb3)))) == {{(~&(7'h44))}, (((8'hb3) ~^ (8'ha8)) ? ((8'hb8) ? (8'hab) : (8'hb7)) : ((8'ha3) && (8'h9f)))})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'ha2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire4;
  input wire [(2'h2):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire12;
  wire signed [(5'h14):(1'h0)] wire11;
  wire signed [(5'h14):(1'h0)] wire10;
  wire signed [(4'hd):(1'h0)] wire9;
  wire [(3'h7):(1'h0)] wire8;
  wire signed [(3'h4):(1'h0)] wire7;
  wire signed [(5'h11):(1'h0)] wire6;
  wire [(2'h3):(1'h0)] wire5;
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg signed [(4'he):(1'h0)] reg16 = (1'h0);
  reg [(4'he):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg13 = (1'h0);
  assign y = {wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 (1'h0)};
  assign wire5 = wire2[(3'h6):(1'h0)];
  assign wire6 = wire5;
  assign wire7 = wire6;
  assign wire8 = $signed($signed((wire2[(4'hf):(1'h1)] ?
                     {$unsigned(wire2), $signed(wire3)} : {(-wire6),
                         $unsigned(wire3)})));
  assign wire9 = ((-{$signed($unsigned(wire4)), wire7}) ? wire1 : wire0);
  assign wire10 = (^~$unsigned(($unsigned((!wire9)) ?
                      $unsigned(wire2[(3'h7):(2'h3)]) : $signed(wire7))));
  assign wire11 = $unsigned((((~|(wire5 ? (8'hab) : wire3)) ?
                          $unsigned((|wire7)) : wire1) ?
                      (+{$unsigned(wire9)}) : (7'h40)));
  assign wire12 = {((((wire6 ? wire6 : wire8) ?
                          (wire6 ?
                              wire4 : wire10) : $unsigned(wire5)) << $signed({wire4,
                          (8'hb3)})) & ((^(~^wire8)) > wire4)),
                      {(^($unsigned(wire2) | wire0[(3'h5):(2'h3)])),
                          {(~(-wire11)), $signed(wire6)}}};
  always
    @(posedge clk) begin
      if ($unsigned($signed(wire5[(1'h0):(1'h0)])))
        begin
          if (wire2[(1'h1):(1'h1)])
            begin
              reg13 <= (|(~|$signed(wire4)));
              reg14 <= $signed($signed({$unsigned((wire10 << (7'h44)))}));
              reg15 <= $unsigned($unsigned($unsigned((-wire0[(4'hb):(1'h1)]))));
            end
          else
            begin
              reg13 <= wire12[(3'h4):(2'h3)];
              reg14 <= wire12[(1'h1):(1'h0)];
            end
          reg16 <= wire6[(2'h2):(1'h0)];
          reg17 <= reg15;
        end
      else
        begin
          reg13 <= ((&$unsigned({(wire3 > wire7)})) ?
              (wire0 < $unsigned(reg17)) : $unsigned($unsigned(reg15[(4'hc):(3'h6)])));
          reg14 <= (reg14[(1'h0):(1'h0)] ?
              $unsigned(wire12[(2'h2):(1'h0)]) : $unsigned($signed($signed(reg14))));
        end
    end
endmodule
