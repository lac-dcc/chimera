module top
#(parameter param31 = (((~&((^(8'hbc)) + ((8'hbb) ? (8'ha7) : (8'hac)))) + (^(((8'h9e) ? (8'hb3) : (8'hb2)) == (-(8'hba))))) ? ((+((!(8'ha3)) - ((8'hb0) <= (8'hbc)))) ? (~^(((8'hb2) && (8'ha5)) ^~ ((7'h44) ? (8'hba) : (8'hb1)))) : ((|((8'h9c) ? (8'hb3) : (8'hb0))) != ({(8'h9c)} && ((8'ha4) ? (8'ha5) : (8'ha0))))) : (^((~|((8'hbe) ? (8'hb7) : (8'haf))) << (((8'ha9) >> (7'h41)) == (|(8'ha7)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h31):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire0;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire3;
  wire signed [(4'hb):(1'h0)] wire4;
  wire signed [(4'hc):(1'h0)] wire5;
  wire [(3'h4):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire29;
  assign y = {wire4, wire5, wire6, wire29, (1'h0)};
  assign wire4 = (wire0 & (8'hb0));
  assign wire5 = {$signed(wire0)};
  assign wire6 = wire2[(3'h5):(3'h4)];
  module7 #() modinst30 (wire29, clk, wire2, wire1, wire5, wire4, wire0);
endmodule

module module7
#(parameter param28 = ((+(^~(!((8'hb7) & (7'h42))))) >= {(^~{((8'h9d) ? (8'hb6) : (8'ha2)), ((8'hb8) ? (8'haf) : (8'had))})}))
(y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'hba):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire12;
  input wire signed [(4'hd):(1'h0)] wire11;
  input wire [(4'hb):(1'h0)] wire10;
  input wire [(4'hb):(1'h0)] wire9;
  input wire signed [(4'hb):(1'h0)] wire8;
  wire signed [(5'h11):(1'h0)] wire27;
  wire [(4'ha):(1'h0)] wire15;
  wire [(4'hb):(1'h0)] wire14;
  wire signed [(4'h8):(1'h0)] wire13;
  reg signed [(5'h10):(1'h0)] reg26 = (1'h0);
  reg [(4'h9):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg24 = (1'h0);
  reg [(4'hb):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg22 = (1'h0);
  reg [(3'h6):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg20 = (1'h0);
  reg [(5'h11):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(5'h14):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg16 = (1'h0);
  assign y = {wire27,
                 wire15,
                 wire14,
                 wire13,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 (1'h0)};
  assign wire13 = wire12[(3'h4):(1'h1)];
  assign wire14 = {(wire10 <= wire10)};
  assign wire15 = {(wire12[(4'h9):(4'h9)] | (+((wire8 <<< wire10) <= $signed(wire9)))),
                      (&$signed($signed((wire12 ? wire8 : (8'hbd)))))};
  always
    @(posedge clk) begin
      reg16 <= $unsigned(wire14[(3'h7):(3'h4)]);
      reg17 <= {wire11[(4'hb):(2'h3)]};
      reg18 <= {$unsigned($unsigned($signed((wire11 ? (8'haa) : reg17)))),
          (~^(~&$signed($unsigned(reg17))))};
      if ({((|(wire14 ? (+wire8) : {wire11, (8'hb3)})) ?
              wire12 : (reg17[(1'h0):(1'h0)] ?
                  (wire15 ?
                      {reg17, wire8} : (wire11 ?
                          wire15 : wire15)) : wire10[(3'h4):(1'h0)]))})
        begin
          reg19 <= reg18[(2'h2):(2'h2)];
          reg20 <= $unsigned({$unsigned((~$signed(wire9))),
              (!wire14[(3'h4):(1'h1)])});
        end
      else
        begin
          reg19 <= $unsigned((($unsigned(((8'hb9) == wire10)) ^~ wire12) ?
              {$signed($signed((8'hbd)))} : ({(reg20 ?
                      wire12 : reg19)} && $signed($signed(wire9)))));
          reg20 <= wire12;
          reg21 <= wire13;
          reg22 <= (8'ha4);
          if ($signed((wire11[(2'h2):(2'h2)] & $signed(($unsigned(wire12) >= wire10[(4'h8):(4'h8)])))))
            begin
              reg23 <= (($signed((~^wire8)) ^~ wire11) ?
                  $unsigned($unsigned(({wire10} ?
                      wire13 : ((8'ha7) ?
                          reg22 : wire8)))) : (^$unsigned(wire11[(2'h3):(1'h0)])));
            end
          else
            begin
              reg23 <= $signed(wire11);
              reg24 <= (^((^~(8'haf)) >> $unsigned($signed($unsigned(reg23)))));
              reg25 <= wire12[(1'h0):(1'h0)];
              reg26 <= (8'ha5);
            end
        end
    end
  assign wire27 = reg25[(2'h2):(1'h0)];
endmodule
