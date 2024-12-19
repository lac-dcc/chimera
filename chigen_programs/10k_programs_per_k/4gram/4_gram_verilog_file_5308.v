// Seed: 1502732477
module module_0 (
    input  uwire   id_0,
    input  supply1 id_1,
    input  supply1 id_2,
    output uwire   id_3,
    output uwire   id_4
);
  assign id_4 = 1;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    output tri0 id_0,
    input tri0 id_1,
    input tri1 id_2,
    input tri0 id_3,
    output tri id_4,
    input tri id_5,
    input uwire id_6,
    input supply1 id_7,
    input supply0 id_8,
    input supply1 id_9
    , id_11
);
  wire id_12;
  or primCall (id_0, id_2, id_9, id_12, id_5, id_7, id_3, id_11, id_8);
  always @(1 * 1 - id_1) id_11 = id_2;
  module_0 modCall_1 (
      id_11,
      id_11,
      id_8,
      id_0,
      id_0
  );
  generate
    always_latch @(posedge 1'b0 or posedge id_11) begin : LABEL_0
      wait (id_9);
    end
  endgenerate
endmodule
