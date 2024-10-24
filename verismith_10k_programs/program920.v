module top
#(parameter param15 = (({(!((8'hb4) ? (8'ha7) : (8'hbc))), (((8'h9c) && (8'hb7)) || {(8'hb8), (8'hb3)})} ? ({(~(8'ha9)), ((8'ha6) ? (8'h9e) : (8'hb0))} ? ({(8'h9e), (8'h9f)} && ((8'h9f) ? (8'h9d) : (8'hac))) : ((~|(8'ha3)) ? ((8'h9e) & (8'hbb)) : ((8'h9d) != (8'hbf)))) : (~(^~{(8'hbd)}))) << ((~|((!(7'h42)) ? (~|(8'hac)) : {(8'ha1)})) ? ({{(8'h9f)}} ^ (~((8'hab) ~^ (8'had)))) : (({(8'ha2), (8'hb4)} ? (~^(8'ha2)) : {(8'hab)}) ? (((8'hbe) >= (8'ha8)) ? ((8'hb3) <<< (8'hbb)) : (8'ha8)) : ((~^(8'hbd)) & ((8'hb2) ? (8'ha8) : (8'hba)))))), 
parameter param16 = (param15 ? (~|(&param15)) : ({((param15 <= param15) < (^param15)), ((~&param15) * (param15 ? (8'hb7) : param15))} <= param15)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h80):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire8;
  wire signed [(5'h10):(1'h0)] wire7;
  wire signed [(4'ha):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire5;
  wire signed [(4'h8):(1'h0)] wire4;
  reg [(2'h3):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg13 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg10 = (1'h0);
  reg [(5'h15):(1'h0)] reg9 = (1'h0);
  assign y = {wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire4 = $signed(($unsigned($signed(wire1[(3'h4):(1'h1)])) ?
                     wire3[(4'hc):(2'h3)] : wire0[(3'h4):(3'h4)]));
  assign wire5 = (((!$unsigned(wire2[(2'h2):(1'h1)])) ?
                         (($unsigned(wire1) != $signed(wire3)) | ($unsigned(wire2) ?
                             wire3 : $signed((8'h9f)))) : $unsigned($unsigned((wire4 ?
                             wire4 : wire0)))) ?
                     (|((wire1 ~^ wire4) ?
                         wire1[(1'h0):(1'h0)] : $unsigned((&wire3)))) : $signed({$unsigned((^~wire3)),
                         (~(~wire4))}));
  assign wire6 = (~^wire0[(1'h0):(1'h0)]);
  assign wire7 = ($unsigned(wire6) ?
                     wire3 : $signed($signed(wire2[(5'h13):(1'h0)])));
  assign wire8 = {$signed($unsigned($signed((^wire2)))),
                     {$unsigned(wire4[(1'h1):(1'h0)]),
                         (wire0 != (wire1 ?
                             (wire1 & wire0) : $signed(wire3)))}};
  always
    @(posedge clk) begin
      if (($unsigned((($signed(wire1) ?
          $unsigned(wire3) : {wire5,
              wire7}) + $unsigned((wire5 > wire4)))) * wire0[(1'h1):(1'h1)]))
        begin
          reg9 <= $unsigned(wire2[(2'h2):(1'h0)]);
          reg10 <= wire6[(2'h2):(2'h2)];
          if ((wire5[(3'h4):(2'h3)] - $unsigned((&wire2))))
            begin
              reg11 <= (((~$signed(wire2[(4'h9):(2'h2)])) ?
                  (~^$unsigned((wire5 ?
                      (8'hb6) : (8'h9e)))) : ((wire2[(4'h9):(1'h1)] ?
                      $signed(wire0) : $unsigned(wire2)) <= (wire6 || (+reg10)))) && (((wire3[(4'he):(4'h8)] == (^~wire2)) >>> $unsigned($signed(wire0))) >>> wire0[(1'h1):(1'h1)]));
            end
          else
            begin
              reg11 <= ((^$signed(reg9)) ?
                  {(^~$unsigned((wire8 == wire1))),
                      wire0[(3'h4):(2'h3)]} : wire1);
              reg12 <= (($unsigned((^~(wire0 + wire8))) ?
                  ($signed((~|(8'hb5))) * $unsigned($signed(wire6))) : ((+wire6[(1'h0):(1'h0)]) >= $signed((+wire4)))) > $unsigned($unsigned(reg9[(5'h11):(2'h2)])));
              reg13 <= reg9[(5'h14):(5'h10)];
              reg14 <= (~&reg9[(4'h8):(2'h3)]);
            end
        end
      else
        begin
          reg9 <= ((+wire7) & wire5);
        end
    end
endmodule
