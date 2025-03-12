// Seed: 2434305160
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  generate
    for (id_5 = id_3; -1'b0; id_5 = id_4) begin : LABEL_0
      assign id_1 = {~id_5{id_2}};
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
    id_7
);
  input wire id_7;
  inout tri id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_6 = 1;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_6,
      id_1
  );
  wire id_8, id_9;
  wire id_10;
endmodule
