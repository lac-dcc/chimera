module top
#(parameter param18 = ((((((8'ha8) ? (8'hac) : (7'h41)) > ((8'h9f) != (8'hbb))) ? (7'h41) : ((8'ha0) < (&(7'h41)))) ? {{(&(7'h42))}} : (!({(8'hb6), (8'ha5)} <<< ((8'ha9) << (8'ha4))))) ? (^{(((8'hbc) || (8'ha8)) < (~^(8'ha2)))}) : (~^(({(8'haa), (8'h9d)} & ((8'hb4) ? (8'hb2) : (8'haa))) > (-((8'ha8) == (8'ha0)))))), 
parameter param19 = ((^~(^~(^~param18))) ? ((((param18 - param18) ? ((8'hb2) ? param18 : (7'h42)) : (param18 + param18)) + ({param18} == (param18 ^ param18))) ~^ param18) : (param18 ? ((^(param18 && param18)) + (^{(8'hb5), (8'hb5)})) : {param18, ((param18 ? param18 : param18) ? (~param18) : {(8'haa), param18})})))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h8c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire4;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire17;
  wire [(3'h7):(1'h0)] wire16;
  wire signed [(2'h3):(1'h0)] wire8;
  reg signed [(4'hd):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg13 = (1'h0);
  reg [(3'h6):(1'h0)] reg12 = (1'h0);
  reg [(5'h14):(1'h0)] reg11 = (1'h0);
  reg [(2'h2):(1'h0)] reg10 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg9 = (1'h0);
  reg [(4'hd):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg5 = (1'h0);
  assign y = {wire17,
                 wire16,
                 wire8,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= (^~(^~$signed((8'hb5))));
      reg6 <= wire4[(2'h3):(2'h2)];
      reg7 <= {$signed($signed(((reg5 ? reg5 : wire0) || (|reg6)))),
          $unsigned($signed($signed((~^reg6))))};
    end
  assign wire8 = (^~($signed($unsigned($signed(wire1))) >> ($signed($unsigned(reg7)) != (!wire0[(1'h0):(1'h0)]))));
  always
    @(posedge clk) begin
      reg9 <= ((~^((wire0[(2'h2):(1'h1)] ?
                  (wire8 ? (8'ha0) : wire2) : (&reg6)) ?
              ((wire0 != reg6) * (reg6 == (8'ha2))) : wire3[(4'hc):(1'h1)])) ?
          {$unsigned(reg6)} : $signed($unsigned({$signed(reg7)})));
      if ((~&wire4[(3'h4):(1'h0)]))
        begin
          reg10 <= ($unsigned(($signed((-wire4)) ? reg7 : {wire0})) ?
              ({$unsigned(reg5)} >> $unsigned((~^reg6))) : reg5);
          reg11 <= {($signed(reg5) ?
                  ((wire0[(1'h1):(1'h0)] | (wire0 ?
                      reg6 : reg9)) - $signed((+wire4))) : reg5)};
        end
      else
        begin
          if ($unsigned(($unsigned((8'ha7)) <= $signed((-(+reg9))))))
            begin
              reg10 <= (wire0 * (({reg7} ?
                  $unsigned(reg6[(2'h2):(2'h2)]) : $signed({wire0})) << ((wire8[(1'h1):(1'h0)] ?
                      (wire8 ? reg5 : (8'hb3)) : reg10) ?
                  {reg10} : wire0[(2'h3):(1'h1)])));
              reg11 <= $unsigned({$signed(wire0[(1'h0):(1'h0)])});
              reg12 <= (^~$signed(($signed(wire2[(3'h4):(1'h1)]) ?
                  ($signed(reg7) | (^~wire4)) : $unsigned((~(8'ha5))))));
              reg13 <= wire3;
            end
          else
            begin
              reg10 <= (-{((8'hae) ~^ $unsigned(wire2))});
              reg11 <= reg12[(1'h1):(1'h0)];
            end
          reg14 <= (&wire4);
          reg15 <= (~&(wire4[(1'h1):(1'h1)] << wire0[(1'h0):(1'h0)]));
        end
    end
  assign wire16 = reg14[(1'h1):(1'h0)];
  assign wire17 = ({reg14, wire4} ?
                      $unsigned($signed(reg12)) : $unsigned((+reg13)));
endmodule
