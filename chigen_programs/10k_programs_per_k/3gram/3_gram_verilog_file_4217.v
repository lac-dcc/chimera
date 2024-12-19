// Seed: 2069492245
module module_0 (
    input tri0 id_0,
    output supply0 id_1,
    output supply1 id_2,
    input tri1 id_3,
    input supply0 id_4,
    input wor id_5
);
endmodule
module module_1 (
    output uwire id_0,
    input supply0 id_1,
    input wire id_2,
    input wand id_3,
    output tri1 id_4,
    input supply0 id_5,
    input supply1 id_6
);
  wire id_8;
  wire id_9;
  assign id_4 = 1;
  wire id_10;
  assign id_8 = id_9;
  always @(posedge 1 or posedge 1'b0) begin : LABEL_0
    #1 id_0 = 1;
  end
  module_0 modCall_1 (
      id_6,
      id_0,
      id_4,
      id_1,
      id_5,
      id_5
  );
  assign modCall_1.id_3 = 0;
endmodule
