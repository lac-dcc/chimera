// Seed: 2941566117
module module_0 ();
  wire id_1;
endmodule
module module_1 (
    input  wand  id_0,
    output logic id_1,
    input  logic id_2,
    input  uwire id_3,
    output logic id_4
);
  tri id_6;
  always_ff @(id_3)
    if (id_0)
      if ((id_6)) @(1 or posedge "") $display;
      else begin : LABEL_0
        #1 id_4 <= 1;
        id_4 <= id_2;
      end
    else id_1 <= 1;
  wire id_7;
  module_0 modCall_1 ();
  wire id_8, id_9, id_10, id_11, id_12, id_13;
  nor primCall (id_1, id_2, id_3, id_6, id_7);
endmodule
