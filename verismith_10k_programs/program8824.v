module top
#(parameter param18 = ((8'h9e) <= ((((+(8'haf)) ? {(8'ha5), (8'hbe)} : {(8'h9d)}) ? ((^~(8'hb1)) ? (8'ha7) : (-(8'ha5))) : (~^((7'h44) ? (8'ha4) : (8'ha1)))) ? {((~(8'hb9)) >> (~&(7'h42))), ((&(8'hb9)) ? ((8'hae) ~^ (8'ha8)) : ((8'ha3) ^~ (8'hb5)))} : (+(((8'hb4) < (8'hb4)) ? (!(8'hb3)) : ((8'hb9) << (8'hb5)))))), 
parameter param19 = {param18, param18})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h76):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire4;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire [(5'h15):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire16;
  wire signed [(2'h3):(1'h0)] wire11;
  wire [(5'h14):(1'h0)] wire10;
  wire [(2'h2):(1'h0)] wire9;
  wire signed [(5'h13):(1'h0)] wire8;
  wire [(2'h3):(1'h0)] wire7;
  wire [(3'h6):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire5;
  reg [(2'h2):(1'h0)] reg15 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg14 = (1'h0);
  reg [(4'ha):(1'h0)] reg13 = (1'h0);
  reg [(2'h3):(1'h0)] reg12 = (1'h0);
  assign y = {wire17,
                 wire16,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire5 = $unsigned($unsigned(((wire4 ? $unsigned(wire0) : (~^(8'ha2))) ?
                     (^$signed(wire1)) : (~$signed(wire2)))));
  assign wire6 = wire0;
  assign wire7 = wire0;
  assign wire8 = (wire3 ^ (wire1 == $unsigned(((+wire4) | (!wire7)))));
  assign wire9 = ($signed({wire1[(4'hf):(4'he)],
                         ($unsigned(wire3) || (wire1 ? wire4 : wire6))}) ?
                     (~(wire8[(3'h5):(3'h5)] * wire7)) : ($signed((+wire4)) == ($signed((~^wire5)) ?
                         ((8'ha2) ?
                             wire4 : wire7[(2'h3):(1'h0)]) : $unsigned({wire6}))));
  assign wire10 = (((~$signed((-wire1))) * $unsigned((8'hb3))) && $signed($unsigned(wire5[(2'h2):(1'h1)])));
  assign wire11 = wire3[(3'h7):(3'h4)];
  always
    @(posedge clk) begin
      reg12 <= ($unsigned($unsigned($unsigned((wire10 ?
          wire11 : (8'ha7))))) < wire2[(1'h0):(1'h0)]);
      if (($unsigned({$unsigned($unsigned(wire2))}) < (((~wire4) ?
          (|(wire3 << wire11)) : {$unsigned((8'hba)),
              (wire11 ^ wire2)}) + wire11)))
        begin
          reg13 <= (~wire11);
        end
      else
        begin
          if ($signed((~^wire11[(1'h0):(1'h0)])))
            begin
              reg13 <= {$signed(((wire0 ? wire6 : (~^wire7)) >> {{wire7,
                          reg12}})),
                  (($signed($signed(wire8)) ?
                      $signed((!wire4)) : ($unsigned(reg13) ^ $signed(wire6))) << reg12[(2'h3):(2'h3)])};
              reg14 <= ((wire0[(2'h2):(1'h0)] ?
                  $unsigned($unsigned($signed((8'hbc)))) : (($unsigned(wire1) ?
                      (-wire11) : ((8'haf) ?
                          wire10 : (8'hb1))) < $signed(wire2[(1'h1):(1'h1)]))) != (^{{$unsigned(wire10)},
                  wire2[(3'h4):(1'h1)]}));
              reg15 <= ((wire6 ?
                  wire6[(1'h1):(1'h1)] : (^$signed($unsigned(wire8)))) < $signed((~|wire8[(4'he):(1'h1)])));
            end
          else
            begin
              reg13 <= wire0[(2'h2):(2'h2)];
            end
        end
    end
  assign wire16 = (wire0 <<< $unsigned(({wire0[(2'h3):(2'h3)],
                      $signed((8'ha6))} == ($signed((8'hb8)) ~^ {wire1,
                      wire1}))));
  assign wire17 = wire10;
endmodule
