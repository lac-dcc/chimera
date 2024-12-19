// Seed: 3614826048
module module_0 (
    output supply0 id_0,
    input supply1 id_1,
    input wire id_2,
    input tri id_3,
    output tri1 id_4,
    output uwire id_5,
    input tri0 id_6,
    input tri1 id_7,
    input supply1 id_8
);
  pullup (.id_0(id_5), .id_1(id_3), .id_2(id_6), .id_3(id_0), .id_4(id_1), .id_5(1), .id_6(""));
  wire id_10 = 1;
  assign module_1.id_5 = 0;
  assign id_4 = 1 <-> 1;
endmodule
module module_1 (
    output logic id_0,
    input wire id_1,
    input supply1 id_2,
    input supply1 id_3,
    input supply0 id_4,
    input supply0 id_5,
    input wor id_6,
    output logic id_7,
    input uwire id_8
);
  id_10 :
  assert property (@(negedge id_6) 1 - 1'b0) id_0 <= 1'h0 - 1;
  always id_7 <= 1;
  and primCall (id_7, id_5, id_2, id_8, id_4, id_6, id_3);
  module_0 modCall_1 (
      id_10,
      id_5,
      id_4,
      id_8,
      id_10,
      id_10,
      id_6,
      id_1,
      id_10
  );
endmodule
