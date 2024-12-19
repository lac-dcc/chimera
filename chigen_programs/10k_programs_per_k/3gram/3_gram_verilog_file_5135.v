// Seed: 2942259178
module module_0 (
    output supply0 id_0,
    output supply1 id_1,
    input supply1 id_2,
    output tri id_3,
    input wand id_4
);
  assign id_3 = 1;
endmodule
module module_1 (
    output tri id_0,
    input logic id_1,
    input tri1 id_2,
    output logic id_3,
    input supply1 id_4,
    output supply1 id_5
);
  assign id_3 = id_1;
  always_latch @(posedge 1'd0 or posedge 1) begin : LABEL_0
    id_3 <= id_1;
  end
  assign id_0 = 1;
  timeprecision 1ps;
  module_0 modCall_1 (
      id_5,
      id_0,
      id_2,
      id_5,
      id_2
  );
  assign modCall_1.type_3 = 0;
  wire id_7;
  wire id_8;
  id_9(
      .id_0(1)
  );
endmodule
