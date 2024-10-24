module top
#(parameter param17 = (((~&{((8'hb9) + (8'hb6))}) > (!(~(~(7'h40))))) ? {((((8'ha5) ? (8'ha9) : (8'ha3)) ? {(8'ha1)} : ((8'ha4) ? (7'h41) : (8'ha6))) ? (((8'ha6) ? (8'hb2) : (8'hb5)) ? (~&(8'hb8)) : (~&(8'h9f))) : (((8'hbd) < (8'hb1)) ? {(8'ha0)} : (~&(8'hb7))))} : (((^(~&(8'hbb))) ? {(|(7'h44)), (8'ha1)} : (((8'haa) ? (7'h44) : (8'hbb)) > ((7'h42) ? (8'h9d) : (8'hb7)))) ? (((~^(8'ha0)) > (&(8'hb4))) ~^ (!(~^(7'h42)))) : ((8'hbf) ? ({(8'had)} ^ {(7'h43), (8'hb8)}) : {((8'ha6) ? (8'hba) : (8'ha2)), ((7'h43) ? (8'hb7) : (8'ha0))}))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'haf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire16;
  wire [(4'hf):(1'h0)] wire15;
  wire [(5'h12):(1'h0)] wire14;
  wire [(4'ha):(1'h0)] wire13;
  wire [(4'hd):(1'h0)] wire11;
  wire [(5'h14):(1'h0)] wire4;
  reg [(3'h5):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg9 = (1'h0);
  reg [(4'h9):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg5 = (1'h0);
  assign y = {wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire11,
                 wire4,
                 reg12,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = (!{((wire0[(5'h10):(3'h7)] >> (wire1 ~^ wire1)) & wire1),
                     (wire0 <<< (8'ha0))});
  always
    @(posedge clk) begin
      if ((^~((+(^wire1[(4'h8):(1'h0)])) == wire1[(3'h7):(1'h0)])))
        begin
          reg5 <= $unsigned(((($signed(wire1) ?
              $unsigned((8'h9e)) : wire4[(4'hf):(4'he)]) > (8'hba)) + ((wire4 >>> wire1) ?
              (wire4[(5'h13):(4'hc)] ^ (&wire1)) : wire3[(2'h3):(1'h0)])));
          reg6 <= $signed($signed((reg5[(3'h4):(1'h0)] ?
              (&(reg5 ? reg5 : wire3)) : {$unsigned(wire4), wire0})));
          reg7 <= (wire2 == wire0[(4'h8):(3'h7)]);
          reg8 <= $signed(wire1[(1'h0):(1'h0)]);
        end
      else
        begin
          reg5 <= {wire4};
          if (wire3)
            begin
              reg6 <= $signed(wire2);
              reg7 <= $signed(reg5[(3'h4):(1'h0)]);
            end
          else
            begin
              reg6 <= ((((reg7 ? reg8 : $signed((8'had))) ?
                      $signed($unsigned(reg5)) : reg5[(3'h6):(2'h2)]) || ($unsigned({reg5}) & reg8)) ?
                  reg8 : (wire1[(3'h6):(3'h4)] ?
                      ((7'h40) ?
                          wire2 : {reg8[(1'h0):(1'h0)]}) : wire2[(3'h5):(3'h4)]));
              reg7 <= ((wire1 || wire4[(4'h8):(3'h4)]) ?
                  {$unsigned((^{reg7, (8'hab)}))} : reg6[(4'h8):(1'h1)]);
              reg8 <= (reg7[(4'ha):(3'h6)] && ($unsigned(wire1[(4'ha):(3'h4)]) ?
                  reg5 : ({$signed(wire2)} && {(reg7 > (8'hb1)), (-wire0)})));
            end
        end
      reg9 <= $unsigned((~^reg6));
      reg10 <= reg5;
    end
  assign wire11 = ((8'hb7) ? reg10 : reg7[(4'h9):(3'h7)]);
  always
    @(posedge clk) begin
      reg12 <= (({{wire11}, ($signed(reg9) ? reg6 : wire3[(1'h0):(1'h0)])} ?
          $signed($signed((reg7 >> wire3))) : ((^~$signed(reg7)) ?
              ({reg8, reg8} ?
                  $unsigned(wire2) : (^reg6)) : ($unsigned((8'ha6)) ?
                  (8'ha6) : (~|reg8)))) != (-(!$signed((|reg7)))));
    end
  assign wire13 = ((~|reg12) <<< $unsigned(reg9[(4'hc):(1'h0)]));
  assign wire14 = ($signed($unsigned($unsigned(wire13))) || reg10);
  assign wire15 = $signed((wire0 && wire14));
  assign wire16 = (((reg5 ?
                      $signed(wire14[(5'h10):(4'hb)]) : $unsigned($signed(wire0))) && (wire15 ^~ reg8[(3'h5):(3'h4)])) ^~ ($unsigned(((wire4 > (7'h40)) ?
                          ((8'ha5) & reg8) : (reg6 ? wire13 : (8'hb8)))) ?
                      (wire14 ? (&wire1) : reg8) : ((wire3[(4'ha):(3'h4)] ?
                              (-wire14) : (~reg10)) ?
                          $unsigned(wire1[(3'h4):(2'h3)]) : ({(8'ha9)} & (8'hb8)))));
endmodule
