// Seed: 306810799
module module_0 ();
  assign id_1 = id_1;
  assign module_1.type_3 = 0;
endmodule
module module_1 (
    input logic id_0,
    output logic id_1,
    output supply0 id_2,
    output logic id_3,
    output uwire id_4,
    input tri id_5,
    output logic id_6,
    input tri id_7,
    input supply1 id_8,
    input logic id_9,
    input logic id_10,
    output wire id_11,
    input wire id_12,
    input tri1 id_13,
    input logic id_14
);
  assign id_2 = 0;
  assign id_1 = id_0;
  assign id_2 = 1;
  id_16(
      .id_0(!1)
  );
  assign id_4 = 1;
  uwire id_17 = id_5;
  module_0 modCall_1 ();
  always begin : LABEL_0
    id_6 <= id_13 & 1;
  end
  id_18 :
  assert property (@(posedge id_9, posedge 1'h0) id_14)
  else id_6 <= id_18;
  assign id_18 = id_10;
endmodule
