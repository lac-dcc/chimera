// Seed: 1372698867
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  id_5(
      .id_0(id_4), .id_1(id_1)
  );
  assign module_1.id_2 = 0;
  wire id_6;
endmodule
module module_1 (
    input wire id_0,
    input supply0 id_1,
    input supply1 id_2,
    output logic id_3,
    input supply0 id_4,
    input uwire id_5,
    input supply1 id_6,
    input tri0 id_7,
    input wor id_8,
    input wire id_9
    , id_20,
    output wire id_10,
    output uwire id_11,
    input logic id_12,
    input tri0 id_13,
    input tri0 id_14,
    output wire id_15,
    input uwire id_16,
    input tri id_17,
    input wire id_18
);
  wire id_21;
  nor primCall (id_15, id_4, id_6, id_18, id_1, id_0, id_20, id_21, id_12, id_7);
  module_0 modCall_1 (
      id_21,
      id_20,
      id_21,
      id_20
  );
  always @(1 or 1 != 1) begin : LABEL_0
    id_3 <= id_12;
    if (1)
      assume (id_14 || 1);
      else $display((1 == 1'b0));
  end
endmodule
