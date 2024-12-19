// Seed: 3959170124
module module_0 (
    input tri1 id_0,
    output supply0 id_1
);
  wire id_3;
  module_2 modCall_1 (
      id_3,
      id_3,
      id_3
  );
  wire id_4;
  assign module_1.type_3 = 0;
  wire id_5;
endmodule
module module_1 (
    output supply1 id_0,
    output wire id_1,
    output uwire id_2,
    output uwire id_3,
    input supply0 id_4
);
  wire id_6;
  module_0 modCall_1 (
      id_4,
      id_0
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_4;
endmodule
module module_3 (
    input logic id_0,
    input wire  id_1,
    input wire  id_2
);
  assign id_4 = id_4;
  initial begin : LABEL_0
    id_4 = 1'd0;
  end
  logic id_5;
  wand  id_6;
  wire  id_7;
  module_2 modCall_1 (
      id_4,
      id_6,
      id_6
  );
  assign id_5 = id_0;
  assign id_5 = 1;
  id_8(
      .id_0(1),
      .id_1(1),
      .id_2(1),
      .id_3(1'd0),
      .id_4(1),
      .id_5(1),
      .id_6(1'b0),
      .id_7(id_4#(.id_8(id_6 & 1))),
      .id_9(1),
      .id_10(1),
      .id_11(id_6),
      .id_12(id_0),
      .id_13(id_6),
      .id_14(id_6),
      .id_15(1)
  );
  always @(posedge id_7) assert (id_2);
  reg id_9, id_10, id_11, id_12, id_13, id_14, id_15;
  wire id_16;
  generate
    always @(posedge id_13) id_5 <= id_14;
  endgenerate
endmodule
