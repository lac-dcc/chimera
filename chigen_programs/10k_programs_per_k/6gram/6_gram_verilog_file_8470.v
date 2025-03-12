// Seed: 818307684
module module_0 (
    input tri0 id_0,
    input uwire id_1,
    output wor id_2,
    input tri0 id_3,
    output logic id_4,
    input uwire id_5,
    input tri0 id_6,
    input tri1 id_7,
    input supply0 id_8,
    input wire id_9,
    input wand id_10,
    input supply0 id_11,
    input supply1 id_12,
    input uwire id_13,
    input wand id_14,
    output wor id_15,
    output wand id_16,
    output tri id_17,
    input tri0 id_18,
    output wire id_19
);
  initial begin : LABEL_0
    id_4 <= id_7 == id_1;
    id_4 <= (id_14 ? 1 : id_14);
  end
endmodule
module module_1 (
    input supply0 id_0,
    output tri1 id_1,
    output supply0 id_2,
    input supply0 id_3,
    input supply1 id_4,
    input supply1 id_5,
    input tri id_6,
    output wire id_7,
    input wire id_8
    , id_11,
    output logic id_9
);
  assign id_7 = 1;
  localparam id_12 = -1'b0;
  logic [-1 : 1 'b0] id_13;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_1,
      id_5,
      id_9,
      id_8,
      id_4,
      id_6,
      id_6,
      id_8,
      id_5,
      id_0,
      id_6,
      id_8,
      id_8,
      id_7,
      id_7,
      id_7,
      id_8,
      id_2
  );
  always @(id_6 or posedge id_5 + id_4 & 1) id_9 = id_11 === 1;
  wire id_14;
  ;
  assign id_7 = -1 + id_8;
  wire id_15;
endmodule
