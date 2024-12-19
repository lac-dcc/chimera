// Seed: 1671811557
module module_0 (
    input tri0 id_0,
    input supply1 id_1,
    input wand id_2,
    input wire id_3,
    input uwire id_4,
    input wor id_5
);
  always @(posedge 1) begin : LABEL_0
    id_7 <= id_7;
    cover (id_4);
    id_7 = 1;
  end
  wire id_8;
endmodule
module module_1 (
    output uwire id_0,
    output uwire id_1,
    input wire id_2,
    input supply0 id_3,
    output wire id_4,
    input tri0 id_5,
    input wand id_6,
    input wand id_7
);
  wire id_9;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_5,
      id_3,
      id_5,
      id_3
  );
  assign modCall_1.id_3 = 0;
endmodule
