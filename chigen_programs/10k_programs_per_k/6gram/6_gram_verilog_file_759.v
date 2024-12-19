// Seed: 1620138315
module module_0 (
    input supply0 id_0,
    input wor id_1,
    input tri id_2,
    input tri1 id_3
    , id_11,
    input supply1 id_4
    , id_12,
    input supply1 id_5,
    output uwire id_6,
    output wire id_7,
    input supply0 id_8,
    input tri1 id_9
);
  genvar id_13, id_14;
  wire id_15;
  wire id_16;
  wire id_17;
  assign id_6 = 1'b0;
endmodule
module module_1 (
    input uwire id_0,
    input wire id_1,
    input tri id_2,
    input supply1 id_3,
    output uwire id_4
);
  tri id_6 = id_6;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_1,
      id_0,
      id_3,
      id_4,
      id_4,
      id_2,
      id_1
  );
  uwire id_7;
  reg   id_8;
  always @(posedge id_2 ^ id_3) id_8 <= #id_6 'h0 == id_2;
  assign id_6 = id_1 == id_8;
  assign id_8 = id_8;
  id_9(
      1, 1, id_7
  );
endmodule
