// Seed: 1899596324
module module_0 (
    output tri0 id_0,
    output tri1 id_1,
    input tri0 id_2,
    input tri0 id_3,
    input supply1 id_4,
    input tri id_5,
    input tri id_6,
    input uwire id_7,
    input uwire id_8,
    input wire id_9,
    input supply1 id_10,
    input supply1 id_11,
    input supply0 id_12,
    input supply0 id_13,
    input wor id_14,
    output supply0 id_15,
    input supply1 id_16,
    input tri0 id_17
);
  id_19(
      .id_0(id_6), .id_1(id_2), .id_2(id_7), .id_3(id_2), .id_4(id_9 === id_7)
  );
  wire id_20;
  wire id_21;
  task id_22;
    id_23(id_7, id_21, .id_24(""), 1, 1'b0, id_4);
  endtask
endmodule
module module_1 (
    input wire id_0,
    output logic id_1,
    input wire id_2,
    input supply0 id_3,
    input logic id_4,
    input supply1 id_5,
    output tri0 id_6,
    input wor id_7,
    input uwire id_8,
    output supply0 id_9,
    output wand id_10,
    output tri0 id_11,
    input wor id_12,
    output logic id_13,
    output wire id_14,
    output supply0 id_15,
    output tri1 id_16,
    input uwire id_17,
    input supply0 id_18
);
  logic [7:0] id_20;
  module_0 modCall_1 (
      id_15,
      id_11,
      id_5,
      id_0,
      id_18,
      id_2,
      id_18,
      id_12,
      id_8,
      id_17,
      id_12,
      id_5,
      id_3,
      id_18,
      id_2,
      id_10,
      id_17,
      id_12
  );
  assign modCall_1.id_16 = 0;
  assign id_20[1] = id_4;
  wire id_21 = id_21;
  always @(posedge id_18) begin : LABEL_0
    id_13 <= 1;
    id_1  <= id_4;
  end
endmodule
