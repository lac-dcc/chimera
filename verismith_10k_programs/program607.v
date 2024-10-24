module top
#(parameter param18 = ((^~(+{{(8'hbe), (8'h9d)}, ((8'ha4) < (8'hb2))})) ? (|(((+(8'hba)) ? ((8'h9c) ? (8'hbb) : (8'hac)) : ((8'hb4) >= (8'ha8))) & (+{(8'hb4)}))) : (^((~|{(8'hb0), (8'had)}) >> ((+(7'h41)) ? {(8'ha6), (8'had)} : (+(8'hb0)))))), 
parameter param19 = param18)
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hb5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire4;
  input wire [(4'h9):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire17;
  wire signed [(4'hd):(1'h0)] wire16;
  wire signed [(4'ha):(1'h0)] wire15;
  wire [(4'hd):(1'h0)] wire14;
  reg [(4'hd):(1'h0)] reg13 = (1'h0);
  reg [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  reg [(4'h9):(1'h0)] reg10 = (1'h0);
  reg [(3'h7):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  reg [(4'hd):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg6 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg5 = (1'h0);
  assign y = {wire17,
                 wire16,
                 wire15,
                 wire14,
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
  always
    @(posedge clk) begin
      reg5 <= (|$signed($signed(((8'h9f) ? wire1 : (wire4 - wire0)))));
      reg6 <= (~^(7'h42));
      if (wire3[(2'h3):(2'h3)])
        begin
          reg7 <= wire3;
          reg8 <= {(!(reg5 & $unsigned({wire1}))),
              (^$unsigned(reg5[(1'h1):(1'h0)]))};
        end
      else
        begin
          if ((^~($unsigned(wire2) ?
              (&((8'hbc) >= (reg5 != (8'h9e)))) : $signed($signed(wire2[(3'h5):(1'h1)])))))
            begin
              reg7 <= $signed(wire1);
              reg8 <= (wire2 ?
                  $signed($unsigned(((-wire0) ?
                      (reg5 ?
                          wire0 : (8'h9e)) : $signed((8'hb3))))) : wire4[(3'h7):(3'h6)]);
              reg9 <= wire4;
            end
          else
            begin
              reg7 <= reg7[(2'h3):(1'h1)];
              reg8 <= $unsigned((7'h40));
              reg9 <= (($unsigned($signed(wire0[(3'h4):(1'h0)])) ?
                  $signed(wire3) : wire4[(3'h4):(1'h1)]) + reg9);
            end
          if ({$unsigned($signed({reg5[(4'h9):(3'h7)]}))})
            begin
              reg10 <= wire3;
            end
          else
            begin
              reg10 <= reg8[(3'h7):(3'h5)];
              reg11 <= (reg9[(2'h2):(1'h0)] ?
                  $unsigned($signed($unsigned({wire1}))) : (+(wire1 <<< $signed(reg6))));
              reg12 <= (~|(^($signed($unsigned(reg9)) ?
                  (wire0 ?
                      {(8'hb9),
                          (8'haf)} : {reg7}) : $signed(wire2[(2'h2):(2'h2)]))));
            end
        end
      reg13 <= (!{($signed($signed(reg12)) != ($unsigned(wire4) <<< (~^reg9))),
          wire4[(3'h5):(1'h0)]});
    end
  assign wire14 = ($unsigned({$unsigned($signed((8'hb0))),
                      reg13}) > (~&($signed(wire1) == reg13)));
  assign wire15 = reg6;
  assign wire16 = (!$signed((8'hbd)));
  assign wire17 = ({(|(+(reg8 + wire1)))} ?
                      (&({reg5} ?
                          reg7[(4'h9):(4'h9)] : $unsigned($unsigned(reg12)))) : {($signed(reg9) ?
                              ((wire4 ?
                                  reg12 : wire14) >= $signed(reg10)) : reg7)});
endmodule
