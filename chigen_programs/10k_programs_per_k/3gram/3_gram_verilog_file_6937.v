// Seed: 1278682767
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_3 = id_1;
  wire id_7;
  id_8(
      id_2, 1, id_4, id_1
  );
  assign id_8 = id_6++;
  string id_9 = "";
endmodule
macromodule module_1 (
    id_1,
    id_2
);
  output wire id_2;
  input wire id_1;
  assign id_2 = 1'b0;
  wire id_3;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_2,
      id_1,
      id_3,
      id_2
  );
  assign modCall_1.id_1 = 0;
endmodule
