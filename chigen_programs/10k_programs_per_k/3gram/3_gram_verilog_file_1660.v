// Seed: 167821395
module module_0 (
    output supply1 id_0,
    output supply1 id_1,
    output wand id_2,
    input wor id_3,
    output wor id_4,
    input tri0 id_5,
    input wor id_6,
    input tri0 id_7,
    input wire id_8,
    input wire id_9,
    output wire id_10
);
  id_12(
      .id_0(id_3), .id_1(1), .id_2(id_0), .id_3(id_7), .id_4(id_7), .id_5(1)
  );
  assign module_1.type_3 = 0;
  always @(id_8 ? id_7 > id_6 : id_7 == 1 or posedge 1'h0 - id_7#(
      .id_8(!1 - id_6),
      .id_12(1'h0)
  ))
    deassign id_12;
endmodule
module module_1 (
    output tri1 id_0,
    input logic id_1,
    input supply0 id_2,
    output uwire id_3,
    input tri id_4,
    output wand id_5,
    output tri1 id_6,
    input supply1 id_7,
    output tri0 id_8,
    output logic id_9,
    input tri0 id_10
);
  always @(1 or negedge id_7)
    if (1'h0) begin : LABEL_0
      id_9 <= id_1;
    end else id_9 <= id_1;
  module_0 modCall_1 (
      id_0,
      id_3,
      id_0,
      id_7,
      id_8,
      id_2,
      id_10,
      id_2,
      id_10,
      id_10,
      id_3
  );
endmodule
