// Seed: 186341216
module module_0 (
    input wor id_0,
    input tri0 id_1,
    input supply1 id_2,
    input tri0 id_3,
    input wire id_4,
    output wire id_5,
    output wire id_6,
    output wire id_7,
    output wor id_8,
    output supply1 id_9
    , id_21,
    input wand id_10,
    output wor id_11,
    input wor id_12,
    input uwire id_13,
    input supply1 id_14,
    input tri1 id_15,
    input wor id_16,
    inout tri0 id_17,
    output tri0 id_18,
    output supply0 id_19
);
  always
  fork
    id_22;
    $display((id_16 == id_15), 1);
  join
  assign module_1.type_2 = 0;
endmodule
module module_1 (
    output supply0 id_0,
    output supply0 id_1
    , id_6,
    output logic   id_2,
    input  supply0 id_3,
    output supply1 id_4
);
  tri id_7;
  assign #(1 ==? id_7) id_1 = id_7;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_7,
      id_3,
      id_3,
      id_0,
      id_1,
      id_1,
      id_0,
      id_4,
      id_3,
      id_4,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_1,
      id_7
  );
  assign id_6 = 1;
  task automatic id_8;
    id_8 = 1'b0;
  endtask
  id_9(
      .id_0(1),
      .id_1(id_6),
      .id_2(1),
      .id_3(id_7),
      .id_4(id_2),
      .id_5(id_4),
      .id_6(1),
      .id_7(id_0 - id_4)
  ); id_10(
      .id_0((id_7 | id_7)), .id_1(id_2), .id_2(1), .id_3(1)
  );
  assign id_1 = 1;
  id_11(
      .id_0(1)
  );
  assign id_7 = ~id_6;
  assign id_4 = 1;
  reg  id_12;
  wire id_13;
  wire id_14;
  always @(negedge 1) begin : LABEL_0
    if (1) id_2 <= id_12;
  end
endmodule
