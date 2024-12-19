// Seed: 2730689740
module module_0 (
    output wire id_0,
    output tri1 id_1,
    input supply1 id_2,
    input wire id_3,
    input supply1 id_4
);
  assign id_1 = 1;
endmodule
module module_1 (
    input  uwire id_0,
    input  wor   id_1,
    input  uwire id_2,
    output tri   id_3,
    input  wand  id_4,
    input  wire  id_5,
    output wor   id_6,
    output logic id_7,
    input  wor   id_8,
    input  logic id_9,
    input  uwire id_10,
    input  logic id_11,
    input  uwire id_12,
    input  uwire id_13
);
  task id_15(input id_16, input id_17, id_18);
    input id_19;
    input id_20;
    if (1) begin : LABEL_0
      id_17 <= id_9;
    end else id_19 <= 1'b0;
  endtask
  xnor primCall (
      id_6,
      id_4,
      id_19,
      id_1,
      id_10,
      id_11,
      id_0,
      id_8,
      id_2,
      id_13,
      id_5,
      id_15,
      id_16,
      id_17,
      id_9,
      id_12,
      id_20,
      id_18
  );
  assign id_15 = 1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_5,
      id_4,
      id_4
  );
  assign modCall_1.id_2 = 0;
  reg id_21;
  initial begin : LABEL_0
    id_7  <= 1;
    id_21 <= id_11;
  end
  assign id_18 = 1 && id_17 ? 1 : 1;
endmodule
