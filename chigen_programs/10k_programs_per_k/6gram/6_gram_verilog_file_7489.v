// Seed: 1744909702
module module_0 (
    input wor id_0,
    input wand id_1,
    output tri0 id_2,
    output wire id_3,
    input supply0 id_4,
    input tri id_5,
    input tri1 id_6,
    input uwire id_7,
    input tri0 id_8,
    input supply1 id_9,
    output tri1 id_10,
    output tri0 id_11
);
  tri1 id_13;
  always @(id_7 or posedge 1) $display(1'b0 >= !id_13);
  assign id_13 = id_8;
endmodule
module module_1 (
    output wor   id_0,
    input  logic id_1,
    output logic id_2
    , id_8,
    input  logic id_3,
    input  wor   id_4,
    input  uwire id_5,
    output uwire id_6
);
  reg   id_9;
  logic id_10 = 1'b0;
  wire  id_11;
  module_0 modCall_1 (
      id_4,
      id_5,
      id_6,
      id_6,
      id_4,
      id_5,
      id_5,
      id_5,
      id_4,
      id_5,
      id_0,
      id_0
  );
  assign id_8 = 1'b0;
  always @(id_9 or posedge 1) begin : LABEL_0
    if (1'b0) begin : LABEL_0
      id_2 <= id_9;
      disable id_12;
      id_9 <= id_1;
      id_2 <= id_3;
    end else begin : LABEL_0
      id_10 = id_1;
    end
  end
  always @(1 or posedge 1) begin : LABEL_0
    if (1) id_9 <= 1;
    if (id_8) disable id_13;
  end
endmodule
