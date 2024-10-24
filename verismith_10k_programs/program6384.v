module top
#(parameter param22 = ((({((8'hbd) != (8'hb6))} || (^~(~(8'hbe)))) ? (^~(!(~&(8'ha0)))) : ((^(~|(8'hb9))) ^~ (~|(~&(8'ha1))))) ? (|(&(+((8'ha3) ? (8'hab) : (7'h43))))) : ((&(!((8'ha7) ? (7'h41) : (8'ha4)))) ? {(^(^~(8'hae))), (^((8'ha6) ? (8'ha7) : (8'ha9)))} : {(((8'hb5) ^~ (8'haf)) ? ((8'hba) * (8'hbf)) : ((8'h9f) || (8'hb4))), (((8'haf) ? (8'hb4) : (8'h9f)) * {(8'hb3), (8'hb9)})})), 
parameter param23 = ((param22 ? (param22 ? ((param22 ? param22 : param22) ? (param22 ^~ param22) : (param22 ? param22 : param22)) : ((8'ha6) >= (param22 + param22))) : param22) ? param22 : ({(+(param22 ^ param22)), (~&{(8'hb7)})} ? (8'haf) : ((7'h43) != param22))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hd6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(3'h5):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire0;
  wire [(3'h6):(1'h0)] wire21;
  wire signed [(4'hb):(1'h0)] wire20;
  wire signed [(4'hd):(1'h0)] wire19;
  wire [(5'h10):(1'h0)] wire18;
  wire signed [(3'h4):(1'h0)] wire17;
  wire signed [(4'h9):(1'h0)] wire4;
  reg signed [(4'hf):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg14 = (1'h0);
  reg [(3'h7):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg10 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg9 = (1'h0);
  reg [(3'h6):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg7 = (1'h0);
  reg [(5'h12):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg5 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire4,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = (wire0[(4'ha):(3'h7)] ?
                     (~wire1[(1'h1):(1'h0)]) : $unsigned($signed($signed((|wire0)))));
  always
    @(posedge clk) begin
      if ($unsigned($unsigned((^~(7'h40)))))
        begin
          if (wire0[(4'he):(2'h3)])
            begin
              reg5 <= $unsigned({(~^((^~(8'ha8)) ?
                      (wire2 ? wire0 : wire1) : wire2)),
                  $unsigned(wire0)});
              reg6 <= $signed(((((|reg5) - (reg5 ?
                  wire0 : wire1)) < ($unsigned(wire1) ?
                  wire2 : (wire1 > wire3))) ^~ (~wire2[(5'h11):(4'he)])));
              reg7 <= reg6[(3'h7):(3'h4)];
            end
          else
            begin
              reg5 <= (wire2 ?
                  {wire1,
                      ($unsigned((reg7 ? reg5 : wire1)) ?
                          $signed((reg5 < reg6)) : wire4)} : $signed((^($unsigned(reg7) ?
                      $signed(reg6) : (-(8'had))))));
            end
        end
      else
        begin
          reg5 <= wire1;
          if (($signed($signed((8'hb5))) & $unsigned($unsigned($unsigned((wire1 ^ reg6))))))
            begin
              reg6 <= $signed($signed($unsigned($signed((reg6 ~^ reg7)))));
              reg7 <= wire0;
              reg8 <= $unsigned({((&reg6[(5'h10):(4'hf)]) ?
                      reg7 : ($signed(wire4) ?
                          ((8'hbb) ? reg6 : wire4) : wire1)),
                  $signed(wire4[(1'h0):(1'h0)])});
            end
          else
            begin
              reg6 <= ((^wire3[(1'h1):(1'h1)]) << (((~|(wire3 ?
                  reg6 : reg8)) && wire3[(3'h5):(3'h5)]) | reg5[(3'h6):(3'h6)]));
              reg7 <= wire2[(4'h8):(3'h5)];
              reg8 <= (^((({reg7, reg7} ?
                      (!wire0) : (!wire3)) && $signed(wire2)) ?
                  (^{$signed(reg6)}) : $unsigned(((wire2 - wire1) <= reg5))));
            end
          reg9 <= (reg7[(2'h2):(2'h2)] ?
              ((~|$unsigned((^~wire3))) <= wire2[(4'ha):(4'h9)]) : $signed(wire2));
          reg10 <= (((~(reg8 ?
              $unsigned(reg6) : $signed(reg8))) >>> wire2) ^~ {wire2[(4'he):(3'h4)],
              ($signed((wire2 - (8'hbc))) <<< $signed($unsigned(wire2)))});
        end
      if ((($signed($unsigned(((8'ha5) ? reg9 : reg6))) ?
              (($signed((8'ha4)) ? reg9 : $unsigned(reg10)) >> $signed({reg5,
                  reg7})) : $unsigned(((wire4 ?
                  reg8 : (8'ha6)) < reg7[(3'h4):(2'h3)]))) ?
          $unsigned(({{wire4}} ?
              (-$signed(wire4)) : wire0[(1'h1):(1'h1)])) : wire1[(2'h2):(1'h0)]))
        begin
          reg11 <= (reg9[(1'h0):(1'h0)] ?
              $signed(reg9[(1'h1):(1'h0)]) : $signed(reg7));
          reg12 <= reg8[(2'h3):(1'h0)];
          reg13 <= ((+($signed($signed((8'hac))) == (^~(-reg8)))) == $unsigned(((wire3[(3'h5):(2'h3)] ?
              (wire0 > wire3) : (!wire2)) - reg11[(4'h9):(2'h3)])));
        end
      else
        begin
          reg11 <= ((^reg6[(3'h6):(3'h5)]) ?
              wire1[(1'h1):(1'h0)] : ($signed(reg5) == $signed(((~&reg8) && $unsigned(reg7)))));
        end
      reg14 <= ($signed({(^(wire4 ?
              reg12 : reg9))}) >> (~(reg11[(1'h0):(1'h0)] ?
          (+$signed(wire4)) : reg12)));
      reg15 <= reg11;
      reg16 <= reg6[(4'h8):(2'h2)];
    end
  assign wire17 = $unsigned(wire3);
  assign wire18 = ($unsigned($unsigned($unsigned($signed((8'ha2))))) != reg8);
  assign wire19 = ({((^$unsigned(reg8)) == wire2),
                          $signed($unsigned((~^reg8)))} ?
                      ($signed({reg10[(5'h10):(4'h9)],
                          (wire17 ? reg9 : reg11)}) >> wire3) : (wire0 ?
                          $unsigned($signed(reg13)) : (8'haa)));
  assign wire20 = reg15;
  assign wire21 = (7'h44);
endmodule
