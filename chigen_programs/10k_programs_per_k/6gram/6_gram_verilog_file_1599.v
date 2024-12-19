// Seed: 1104588907
module module_0 (
    input tri id_0,
    input tri1 id_1
    , id_18,
    output supply0 id_2,
    input wire id_3,
    input tri0 id_4,
    input wor id_5,
    input wand id_6,
    input tri0 id_7,
    output uwire id_8,
    input wire id_9,
    input wand id_10,
    input tri0 id_11,
    output tri id_12,
    output uwire id_13,
    output tri0 id_14,
    input wor id_15,
    output tri0 id_16
);
  wire id_19, id_20, id_21;
  wire id_22;
  always @(posedge 1) begin : LABEL_0
    wait (id_1);
  end
endmodule
module module_1 (
    output uwire id_0,
    input tri0 id_1,
    input wire id_2,
    input supply0 id_3,
    input tri0 id_4,
    output uwire id_5,
    input wor id_6,
    output supply0 id_7,
    output wire id_8
    , id_10
);
  wire id_11;
  initial begin : LABEL_0
    id_10 <= 1;
  end
  assign id_0 = 1;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_0,
      id_6,
      id_6,
      id_1,
      id_3,
      id_3,
      id_0,
      id_4,
      id_2,
      id_4,
      id_5,
      id_0,
      id_7,
      id_3,
      id_8
  );
  assign id_5 = 1;
  wire id_12;
  logic [7:0] id_13;
  id_14(
      .id_0(1 > {id_13[1 : 1'd0], {id_10, 1}}), .id_1(1), .id_2(id_7), .id_3(1)
  );
endmodule
