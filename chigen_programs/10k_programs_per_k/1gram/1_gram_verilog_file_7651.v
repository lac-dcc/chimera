// Seed: 145601383
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8[1 :-1],
    id_9,
    id_10
);
  input wire id_10;
  output wire id_9;
  inout logic [7:0] id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_11;
  assign id_2 = id_5;
endmodule
module module_1 #(
    parameter id_2 = 32'd47,
    parameter id_3 = 32'd23
) (
    id_1,
    _id_2[id_2 : id_3],
    _id_3,
    id_4[id_3 : id_2]
);
  inout logic [7:0] id_4;
  inout wire _id_3;
  inout logic [7:0] _id_2;
  inout wire id_1;
  and primCall (id_1, id_5, id_6, id_4);
  wire id_5, id_6;
  assign id_6 = id_5;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_6,
      id_5,
      id_5,
      id_6,
      id_5,
      id_4,
      id_5,
      id_1
  );
endmodule
