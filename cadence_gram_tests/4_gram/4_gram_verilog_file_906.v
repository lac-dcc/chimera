// Seed: 463348793
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_4;
  wire id_5;
  wire id_6;
  assign id_1 = $realtime;
  wire id_7;
  wire id_8;
  id_9(
      id_1, -1
  );
  wire id_10;
endmodule
module module_1 (
    input tri1 id_0,
    output supply1 id_1,
    input supply1 id_2,
    output uwire id_3,
    output wire id_4,
    input wire id_5,
    output wire id_6,
    input uwire id_7,
    output tri1 id_8,
    output tri0 id_9,
    input uwire id_10,
    input wor id_11
);
  wire id_13;
  wire id_14;
  tri1 id_15;
  id_16(
      .id_0($realtime), .id_1()
  );
  wire id_17;
  module_0 modCall_1 (
      id_14,
      id_17,
      id_14
  );
  assign id_9 = id_15;
  wire id_18;
  specify
    (negedge id_19 => (id_20  : 1)) = (-1'b0 : 1  : $realtime, id_0  : $realtime : id_20);
  endspecify
endmodule
