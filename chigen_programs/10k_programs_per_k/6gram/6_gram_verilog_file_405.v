// Seed: 475171069
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_3 = !id_8;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  supply0 id_5 = id_1;
  assign id_5 = 1'b0 ? 1'b0 : id_1 ? ~(id_2) : 1 ? 1'b0 : id_1 ? id_1 : id_1;
  xor primCall (id_3, id_5, id_2, id_1);
  module_0 modCall_1 (
      id_1,
      id_1,
      id_5,
      id_5,
      id_1,
      id_2,
      id_1,
      id_5,
      id_2,
      id_5,
      id_5
  );
  wire id_6;
  assign id_4[1] = 1 == id_2;
  assign id_1 = id_5;
endmodule
