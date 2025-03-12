// Seed: 2368530483
module module_0 (
    input tri id_0,
    input wand id_1,
    input tri0 id_2,
    input wire id_3,
    output wor id_4,
    input wor id_5,
    input tri1 id_6,
    output wand module_0,
    input uwire id_8,
    input tri0 id_9,
    output logic id_10,
    input supply1 id_11,
    output wand id_12,
    input wand id_13,
    input supply0 id_14,
    input tri1 id_15,
    output wire id_16,
    input tri0 id_17
);
  wire id_19 = (id_1);
  always @(1 or posedge 1) begin : LABEL_0
    id_10 = 1;
  end
  wire id_20;
  ;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    input wor id_0,
    input tri0 id_1,
    input uwire id_2,
    output logic id_3,
    inout tri0 id_4,
    input uwire id_5,
    input tri1 id_6,
    output logic id_7,
    output tri1 id_8,
    input tri1 id_9,
    input supply1 id_10
);
  supply0 id_12;
  initial begin : LABEL_0
    id_7 <= $realtime;
    id_3 = #id_13 id_5 == id_6;
  end
  module_0 modCall_1 (
      id_10,
      id_4,
      id_9,
      id_5,
      id_4,
      id_5,
      id_5,
      id_8,
      id_1,
      id_0,
      id_3,
      id_1,
      id_8,
      id_0,
      id_10,
      id_0,
      id_4,
      id_5
  );
  assign id_4 = -1;
  wire id_14;
  assign id_12 = id_2 < -1;
endmodule
