// Seed: 1309421698
module module_0 (
    input logic id_0,
    output logic id_1,
    input tri1 id_2,
    input tri0 id_3,
    input supply1 id_4,
    input wand id_5
    , id_10,
    input wor id_6,
    input wor id_7,
    input wire id_8
);
  always id_1 <= id_0;
  wire id_11;
  assign id_1 = 1;
  id_12 :
  assert property (@(id_6 or posedge id_8) 1'd0)
  else;
  tri0 id_13;
  wire id_14;
  wire id_15;
  wire id_16;
  assign module_1.type_2 = 0;
  id_17(
      (id_5), 1'b0, 1'h0, id_12 & !1
  );
  wire id_18;
  assign id_13 = 1;
endmodule
module module_1 (
    input supply1 id_0,
    input supply0 id_1,
    input supply0 id_2,
    input logic id_3,
    input supply1 id_4,
    input wire id_5,
    input tri0 id_6,
    output logic id_7,
    input wor id_8,
    input wor id_9,
    output wire id_10,
    output supply0 id_11,
    output tri0 id_12,
    output wire id_13,
    input tri id_14,
    output wire id_15,
    input tri id_16,
    input tri0 id_17
);
  always id_11 = id_2;
  always begin : LABEL_0
    id_7 = 1;
    id_7 <= id_3;
  end
  module_0 modCall_1 (
      id_3,
      id_7,
      id_17,
      id_2,
      id_2,
      id_16,
      id_4,
      id_5,
      id_6
  );
endmodule
