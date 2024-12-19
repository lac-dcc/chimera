// Seed: 2937207441
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_8, id_9;
  assign id_9 = id_2;
endmodule
module module_1 (
    input logic id_0,
    input wire id_1,
    input supply1 id_2,
    input supply1 id_3,
    output logic id_4,
    input supply0 id_5,
    input supply0 id_6,
    input uwire id_7,
    output uwire id_8,
    input tri id_9,
    output tri id_10,
    input tri0 id_11,
    input tri1 id_12,
    output tri0 id_13
);
  always_ff @(posedge id_7 * 1 + id_12);
  id_15 :
  assert property (@(posedge 1'b0 * 1) 1)
  else if (id_11) begin : LABEL_0$display
    ;
    id_4 <= id_0;
  end
  wire id_16;
  module_0 modCall_1 (
      id_16,
      id_15,
      id_15,
      id_16,
      id_15,
      id_16,
      id_15
  );
endmodule
