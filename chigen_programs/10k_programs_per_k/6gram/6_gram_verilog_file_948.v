// Seed: 2748540076
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_2 = id_3;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout reg id_5;
  input wire id_4;
  inout reg id_3;
  input wire id_2;
  inout wire id_1;
  always @* begin : LABEL_0
    if (1'd0 && 1) begin : LABEL_1
      if (1) id_3 <= id_1 + id_1;
      else begin : LABEL_2
        id_5 <= 1;
        id_3#(
            .id_2(""),
            .id_3(-1'b0)
        ) <= -1 * -1;
        id_5 <= -1;
      end
    end else id_5 = 1'h0;
  end
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1
  );
endmodule
