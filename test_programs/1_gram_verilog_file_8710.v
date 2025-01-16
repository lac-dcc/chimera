// Seed: 2758617783
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_3 = id_2;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_1 = id_2;
  assign id_2 = id_1;
  assign id_2 = id_3;
  initial id_2 <= id_1 == id_2;
  final id_1 <= 1 - id_2;
  supply1 id_4, id_5, id_6;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_4
  );
  initial begin : LABEL_0
    id_5 = -1;
  end
  localparam id_7 = 1;
  wor id_8, id_9 = {id_8{1'd0}};
endmodule
