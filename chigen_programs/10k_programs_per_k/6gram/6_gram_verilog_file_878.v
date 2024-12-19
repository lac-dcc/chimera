// Seed: 1251805538
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_4[1] = id_2;
  wand id_5 = id_5;
  assign {id_5, 1} = 1;
  assign id_1 = 1;
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
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  initial begin : LABEL_0
    id_3 = id_7;
    id_2 <= id_7[1 : 1];
  end
  module_0 modCall_1 (
      id_1,
      id_6,
      id_5,
      id_3
  );
endmodule
