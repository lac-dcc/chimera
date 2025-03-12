// Seed: 2899741241
module module_0 (
    input supply0 id_0,
    input wor id_1,
    output wire id_2,
    input supply1 id_3,
    output supply1 id_4,
    input wire id_5,
    input uwire id_6,
    input uwire id_7,
    input supply0 id_8,
    input supply1 id_9,
    input wor id_10,
    output tri0 id_11,
    input uwire id_12,
    input wand id_13,
    output tri1 id_14,
    input supply0 id_15,
    output tri0 id_16,
    output wire id_17
);
  struct packed {id_19 id_20;} id_21;
  ;
endmodule
module module_1 (
    output logic id_0,
    input  wor   id_1,
    output uwire id_2,
    output tri   id_3
);
  always @(posedge id_1)
    if (-1) begin : LABEL_0
    end else begin : LABEL_1
      id_0 <= id_1;
    end
  module_0 modCall_1 (
      id_1,
      id_1,
      id_3,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_3,
      id_1,
      id_1,
      id_3,
      id_1,
      id_3,
      id_2
  );
  assign modCall_1.id_14 = 0;
endmodule
