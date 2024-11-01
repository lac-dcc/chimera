// Seed: 2821577435
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  module_0(
      id_3, id_2, id_2, id_2, id_3, id_2
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  initial @(posedge 1 or 1);
  module_0(
      id_4, id_1, id_4, id_3, id_3, id_4
  );
  wire id_5;
  assign id_2 = id_4;
endmodule
