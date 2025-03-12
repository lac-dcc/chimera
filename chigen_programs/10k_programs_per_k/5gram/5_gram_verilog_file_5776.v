// Seed: 325468759
module module_0 (
    input wire id_0,
    output uwire id_1
    , id_15,
    input supply1 id_2,
    output tri id_3,
    input tri id_4,
    input supply0 id_5,
    input supply1 id_6,
    input wand id_7,
    output wire id_8,
    input wor id_9,
    output uwire id_10,
    input wire id_11,
    output tri1 id_12,
    input tri1 id_13
);
  assign id_1 = -1;
  assign module_1.id_1 = 0;
  assign id_3 = id_9 <= -1;
  always @(posedge id_7 or id_13) begin : LABEL_0
    fork
      id_16(1);
    join
    assert (id_16);
  end
endmodule
module module_1 (
    input  supply1 id_0,
    output supply0 id_1
);
  wire id_3;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_0,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_0,
      id_1,
      id_0,
      id_1,
      id_0
  );
endmodule
