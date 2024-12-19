// Seed: 709490439
module module_0 (
    input wor id_0,
    output tri0 id_1,
    output supply0 id_2,
    input tri id_3
);
  wire id_5;
  always id_2 = 1'b0;
  assign module_1.type_7 = 0;
endmodule
module module_1 (
    input  tri   id_0,
    input  logic id_1,
    input  wire  id_2,
    output tri   id_3,
    output wire  id_4
);
  task id_6;
    @(posedge id_1 or posedge 1'b0) id_6 <= 1;
  endtask
  assign id_6 = 1;
  module_0 modCall_1 (
      id_2,
      id_4,
      id_3,
      id_0
  );
  assign id_3 = 1 - id_6;
endmodule
module module_2 (
    output supply1 id_0,
    input tri id_1,
    input wor id_2,
    input tri1 id_3,
    input wire id_4
);
  tri1 id_6, id_7;
  wire id_8;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_6,
      id_1
  );
  assign modCall_1.type_0 = 0;
  assign id_6 = id_4;
endmodule
