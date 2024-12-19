// Seed: 1323529509
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  reg id_5;
  reg id_6;
  always @* begin : LABEL_0
    id_5 <= 1;
    id_6 <= id_5++;
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  supply0 id_9 = ~id_8 != id_7;
  or primCall (id_1, id_4, id_3, id_8, id_6, id_7);
  module_0 modCall_1 (
      id_4,
      id_9,
      id_6,
      id_9
  );
endmodule
