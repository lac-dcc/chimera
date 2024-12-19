// Seed: 293185580
module module_0;
  always @(posedge {1,
    (1 == 1),
    id_1
  } or posedge 1)
  begin : LABEL_0
    deassign id_1;
  end
  assign module_1.id_8 = 0;
endmodule
module module_1 (
    output tri0  id_0,
    input  uwire id_1,
    output wire  id_2,
    input  tri0  id_3,
    input  uwire id_4,
    input  tri0  id_5,
    output tri1  id_6,
    input  tri0  id_7,
    output logic id_8,
    output uwire id_9,
    input  wire  id_10,
    input  uwire id_11,
    input  uwire id_12,
    input  wor   id_13,
    input  tri0  id_14,
    output wor   id_15
);
  always @(posedge "") id_15 = 1'b0;
  or primCall (id_0, id_1, id_10, id_11, id_12, id_13, id_14, id_3, id_4, id_5, id_7);
  assign id_6 = id_13;
  module_0 modCall_1 ();
  always @(1 * 1 - {1, 1 - 1, id_7, {id_4, 1}, !id_13}) id_8 = #1 1;
  assign id_2 = id_13;
endmodule
