// Seed: 2208819423
`define pp_6 (  pp_7  )  0
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input id_6;
  output id_5;
  inout id_4;
  inout id_3;
  inout id_2;
  output id_1;
  always @(1 - id_4 or posedge 1) begin
    id_4 = 1;
    #1;
    id_4 = 1;
    id_1 = 1;
    #(id_2);
    id_1 = id_3;
    for (id_2 = 1; !(id_6); id_2 = 1'b0) begin
      id_3 <= 1;
      id_1 = id_4;
      id_5 <= 1;
      id_5 <= id_3;
      id_4 <= id_2;
    end
    id_1 <= SystemTFIdentifier(1'b0);
    #1 id_1 = 1;
    id_1 <= id_4 & (id_6);
    if (1'b0) id_5 <= #1 1'b0;
    id_4 = id_3 == 1'h0;
  end
endmodule
