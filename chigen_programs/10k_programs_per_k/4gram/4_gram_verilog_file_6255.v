// Seed: 4163747439
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_4;
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
    id_9
);
  input wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  id_10(
      .id_0(id_8), .id_1(id_5), .id_2(), .id_3(1)
  );
  assign id_5 = id_1;
  reg id_11 = 1;
  always @(posedge 1) begin : LABEL_0
    id_11 <= (id_9);
    $display(1);
  end
  module_0 modCall_1 (
      id_2,
      id_4,
      id_4
  );
endmodule
