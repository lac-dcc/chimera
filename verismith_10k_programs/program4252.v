module top
#(parameter param11 = ((~^((((8'hab) != (8'hae)) >> (&(8'had))) << ((~^(8'ha3)) ? (~&(8'hb3)) : ((7'h43) + (8'h9f))))) ? (|{(((7'h44) << (7'h43)) ? ((8'hb8) ? (8'ha6) : (7'h42)) : ((8'hb6) * (8'hb9)))}) : {((8'hb4) << {(~|(8'hab))}), ({(~(8'ha8))} ? (((8'hb0) <<< (8'hb4)) || (7'h43)) : {((8'h9e) ? (8'hb0) : (8'hba)), (!(8'h9f))})}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h48):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire4;
  input wire signed [(2'h2):(1'h0)] wire3;
  input wire [(4'h9):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire10;
  wire [(5'h12):(1'h0)] wire9;
  wire signed [(4'hf):(1'h0)] wire8;
  wire signed [(5'h13):(1'h0)] wire7;
  reg signed [(3'h5):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg5 = (1'h0);
  assign y = {wire10, wire9, wire8, wire7, reg6, reg5, (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= $signed(((^~$signed((wire0 + wire1))) >> wire3[(2'h2):(1'h1)]));
      reg6 <= {($signed($signed((~(8'haf)))) & ($unsigned({(8'hb5), wire3}) ?
              wire1[(3'h5):(1'h0)] : $signed((reg5 ? wire0 : wire3)))),
          (wire0[(4'ha):(3'h5)] ?
              $signed(((wire0 ? wire0 : wire4) >>> (reg5 ?
                  wire3 : wire3))) : (8'hb3))};
    end
  assign wire7 = ($signed((|((wire1 ? reg5 : reg6) ?
                         $unsigned(reg6) : {wire1}))) ?
                     ($unsigned((reg5 == $signed(reg6))) ?
                         $signed((wire0[(4'hc):(3'h6)] ?
                             (8'hb1) : (wire3 ?
                                 (8'ha8) : wire0))) : wire4[(4'he):(3'h6)]) : wire0);
  assign wire8 = wire4[(5'h11):(4'hd)];
  assign wire9 = reg5[(1'h0):(1'h0)];
  assign wire10 = $signed(({((wire0 ? wire9 : wire0) ? reg5 : {(7'h44), wire2}),
                      (~^(wire9 << wire0))} + wire0[(3'h7):(3'h6)]));
endmodule
