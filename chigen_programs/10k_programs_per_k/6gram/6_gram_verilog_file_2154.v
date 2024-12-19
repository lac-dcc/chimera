// Seed: 1644426898
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  generate
    for (id_9 = 1; 1'b0; id_8 = 1) begin : LABEL_0
      id_10(
          .id_0(id_6)
      );
    end
  endgenerate
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12
);
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_4 = id_10;
  module_0 modCall_1 (
      id_11,
      id_4,
      id_8,
      id_8,
      id_10,
      id_5,
      id_4,
      id_9
  );
endmodule
