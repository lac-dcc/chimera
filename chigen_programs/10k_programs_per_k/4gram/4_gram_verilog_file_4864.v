// Seed: 3281454260
module module_0 (
    input supply0 id_0,
    output logic id_1,
    input supply1 id_2,
    output tri0 id_3,
    input tri0 id_4,
    input tri1 id_5,
    input supply1 id_6
);
  assign module_1.id_3 = 0;
  tri0 id_8 = id_6;
  always @(negedge 1'b0) begin : LABEL_0
    id_1 <= 1;
    disable id_9;
  end
  assign id_8 = 1'b0;
  id_10 :
  assert property (@(negedge 1'b0) id_4)
  else $display(id_5);
  wire id_11;
  wire id_12;
endmodule
module module_1 (
    input wire id_0,
    output tri1 id_1,
    input supply0 id_2,
    output wire id_3,
    input tri0 id_4,
    input wire id_5,
    input logic id_6,
    input wire id_7,
    output supply1 id_8,
    output logic id_9
);
  always @(posedge id_7) begin : LABEL_0
    id_9 <= id_6;
  end
  wire id_11;
  module_0 modCall_1 (
      id_2,
      id_9,
      id_7,
      id_8,
      id_7,
      id_2,
      id_4
  );
endmodule
