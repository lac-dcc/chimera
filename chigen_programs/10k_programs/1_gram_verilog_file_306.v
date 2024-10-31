// Seed: 2361397679
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  input wire id_2;
  input wire id_1;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  wire id_3, id_4;
  wire id_5, id_6;
  id_7(
      id_4
  ); module_0(
      id_4, id_6, id_6
  );
endmodule : id_8
module module_2 (
    id_1
);
  input wire id_1;
  module_0(
      id_1, id_1, id_1
  );
endmodule
module module_3 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  module_0(
      id_2, id_1, id_1
  );
  assign id_1 = 1;
  specify
    if (id_2) (posedge id_3 => (id_4 +: 1'b0)) = (1);
  endspecify
  assign id_4 = id_1;
  wire id_5;
  wire id_6, id_7;
endmodule
