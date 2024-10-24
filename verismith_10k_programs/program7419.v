module top
#(parameter param13 = {(((~&((7'h40) ? (8'h9f) : (8'hbc))) > ((+(8'hbc)) ? (^~(8'h9f)) : ((8'h9e) ? (8'hb2) : (8'h9d)))) ? ((((8'had) <<< (8'ha4)) ? (~(8'ha2)) : (!(8'hb9))) ? (((8'hb9) >= (8'h9f)) ? ((8'ha0) ^ (7'h44)) : ((8'hb5) >> (7'h43))) : ({(8'ha9), (8'h9d)} ? (+(8'ha6)) : (~(8'had)))) : ((((8'hbb) ? (8'ha8) : (7'h40)) ? ((7'h40) & (8'ha2)) : ((8'hb9) | (8'hb7))) > (~&(!(7'h43)))))})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h64):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire [(3'h4):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire6;
  wire [(4'h8):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire4;
  reg [(5'h10):(1'h0)] reg12 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg9 = (1'h0);
  reg [(5'h14):(1'h0)] reg8 = (1'h0);
  reg [(5'h10):(1'h0)] reg7 = (1'h0);
  assign y = {wire6,
                 wire5,
                 wire4,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire4 = $unsigned(($signed({{wire2, wire2},
                     wire2}) + $unsigned(($unsigned(wire2) << (wire0 < wire1)))));
  assign wire5 = (~|wire0);
  assign wire6 = (~|($unsigned($unsigned((~|(8'ha8)))) != $unsigned($unsigned(((8'hae) ?
                     wire1 : wire1)))));
  always
    @(posedge clk) begin
      reg7 <= (wire6[(1'h1):(1'h1)] ?
          {(-($signed(wire2) ? (!wire5) : wire5))} : $signed((wire6 && wire5)));
      if ((wire0[(1'h0):(1'h0)] ?
          (8'ha5) : $unsigned($signed(({wire5, (8'ha7)} ?
              $unsigned(wire4) : wire6)))))
        begin
          reg8 <= (8'h9f);
          if ((wire5[(3'h5):(3'h5)] ?
              ($unsigned($signed($unsigned(wire6))) ?
                  $signed(wire6) : (-(~|{(8'hb4)}))) : reg7))
            begin
              reg9 <= ((((((8'hbb) + wire3) ?
                          wire3[(3'h6):(3'h5)] : {wire4, wire0}) ?
                      (~^$signed(reg8)) : (~|{wire0,
                          wire0})) & $unsigned(wire1[(3'h4):(2'h2)])) ?
                  ($unsigned(wire5[(2'h2):(2'h2)]) ?
                      (reg7[(2'h3):(1'h1)] || (|$signed((7'h42)))) : (+$unsigned($signed(wire0)))) : $signed((&((~&(8'hb0)) > ((7'h44) - wire1)))));
            end
          else
            begin
              reg9 <= wire3[(3'h7):(3'h4)];
            end
        end
      else
        begin
          if (((reg7[(2'h3):(1'h0)] ?
                  $signed((|(wire6 ? wire0 : wire4))) : reg7) ?
              (($unsigned((reg9 ? reg9 : wire1)) ?
                  reg9 : wire0) ^~ (-($signed((8'ha3)) & (8'ha4)))) : $unsigned((!wire2[(2'h3):(2'h3)]))))
            begin
              reg8 <= (reg8 ?
                  {(8'h9e), wire1[(1'h1):(1'h1)]} : {(~&((8'hbb) ?
                          (8'ha4) : {wire0}))});
              reg9 <= $unsigned((wire1[(4'hb):(4'ha)] ?
                  wire5[(3'h5):(2'h2)] : ((^~$signed((8'h9f))) ?
                      (~&(reg8 < wire6)) : {((8'ha7) ? wire6 : wire5),
                          (wire2 ? reg8 : wire5)})));
            end
          else
            begin
              reg8 <= (&{($unsigned(wire4) <<< $signed($signed(reg9))),
                  (((8'ha2) && {(8'hbb), wire4}) ? reg7 : {(wire0 ^~ wire6)})});
            end
          reg10 <= wire0;
        end
      reg11 <= wire5;
      reg12 <= reg8[(1'h0):(1'h0)];
    end
endmodule
