// Seed: 755395739
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_7, id_8;
  wire id_9;
  always @(posedge id_4) if (1'b0) id_6 = &1'b0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_4,
      id_3,
      id_2,
      id_2
  );
endmodule
