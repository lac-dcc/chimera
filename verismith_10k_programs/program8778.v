module top
#(parameter param16 = (~&(&((((7'h43) ? (8'hb5) : (8'hbb)) ? ((7'h41) ? (8'hbe) : (8'ha9)) : (~|(8'ha7))) >= ({(8'haa)} ^~ ((8'hba) + (8'ha5)))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h8e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire4;
  input wire [(3'h7):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire15;
  wire signed [(4'ha):(1'h0)] wire14;
  wire signed [(4'he):(1'h0)] wire13;
  wire signed [(3'h6):(1'h0)] wire12;
  reg signed [(2'h2):(1'h0)] reg11 = (1'h0);
  reg [(4'hf):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg8 = (1'h0);
  reg [(5'h11):(1'h0)] reg7 = (1'h0);
  reg [(5'h10):(1'h0)] reg6 = (1'h0);
  reg [(5'h10):(1'h0)] reg5 = (1'h0);
  assign y = {wire15,
                 wire14,
                 wire13,
                 wire12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire2)
        begin
          reg5 <= wire3;
          if ((wire1[(4'hb):(4'ha)] <= wire4[(2'h3):(1'h1)]))
            begin
              reg6 <= (($unsigned(($signed(wire1) ?
                  $unsigned(wire4) : $signed(wire4))) != ($signed((~|wire3)) | (+wire2[(3'h7):(1'h0)]))) >>> (wire1 <= wire4[(3'h6):(1'h0)]));
              reg7 <= {wire3};
              reg8 <= $unsigned($unsigned($unsigned($unsigned(wire2))));
              reg9 <= wire1[(2'h3):(2'h2)];
            end
          else
            begin
              reg6 <= reg7;
              reg7 <= ({(~$signed($signed(reg5)))} ?
                  (8'hac) : $unsigned(($unsigned($unsigned((7'h44))) ?
                      wire2 : (8'hbf))));
              reg8 <= (^(wire1 == (~|wire1[(1'h1):(1'h1)])));
              reg9 <= $unsigned((((|(wire2 != reg9)) <<< wire4) ^ (+wire0)));
            end
          reg10 <= $signed(reg6);
        end
      else
        begin
          if ($unsigned($unsigned($unsigned($signed($signed(reg9))))))
            begin
              reg5 <= (~$unsigned(reg5[(3'h7):(2'h3)]));
              reg6 <= {$unsigned($signed(($signed(reg5) ?
                      $signed((8'hab)) : (reg9 ? reg7 : wire1)))),
                  (reg6[(3'h7):(3'h4)] > (8'hb1))};
              reg7 <= (8'ha6);
            end
          else
            begin
              reg5 <= {wire2[(1'h1):(1'h0)]};
              reg6 <= reg7[(5'h10):(4'hc)];
              reg7 <= (reg5[(4'hc):(1'h0)] < $unsigned({wire0,
                  $signed(reg10)}));
            end
        end
      reg11 <= (reg6 ?
          $unsigned($signed((+$unsigned(reg7)))) : (($signed((reg9 ?
              (8'hbc) : wire1)) | ($signed(reg9) <<< ((8'hbf) != (8'hbf)))) & $signed(wire4[(1'h1):(1'h1)])));
    end
  assign wire12 = (((wire4 ? (~&wire2) : $signed((wire0 == reg10))) ?
                          ((7'h41) & reg7) : (+((^~wire0) == (~&reg9)))) ?
                      ($signed((wire4 ?
                          reg5[(4'h9):(2'h3)] : $unsigned(wire4))) << (wire1[(4'hc):(3'h7)] ?
                          ($signed(reg9) >> (reg9 ?
                              (7'h42) : reg5)) : ((8'ha2) >>> $signed(reg10)))) : (~|(-((reg7 & reg8) ?
                          reg7 : wire1))));
  assign wire13 = $unsigned($signed((($signed(wire1) - reg8) ?
                      $unsigned($unsigned((8'hb4))) : ((^~reg10) && $signed(reg7)))));
  assign wire14 = {(~(^~((~|reg5) ? (reg7 + reg7) : reg6[(3'h5):(2'h3)])))};
  assign wire15 = (wire2 - $signed(wire0));
endmodule
