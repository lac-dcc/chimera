// Seed: 4091299107
module module_0 (
    output logic id_0,
    output tri0  id_1,
    input  wand  id_2
);
  initial begin : LABEL_0
    disable id_4;
    id_0 = 1;
  end
  assign id_0 = 1;
endmodule
module module_1 #(
    parameter id_4 = 32'd82
) (
    output supply1 id_0,
    input tri0 id_1,
    input wand id_2,
    input uwire id_3,
    input uwire _id_4,
    input wor id_5,
    input tri0 id_6,
    input wand id_7,
    output logic id_8,
    input uwire id_9,
    input wand id_10,
    input wand id_11,
    output wire id_12,
    output tri id_13
);
  logic [!  id_4 : ""] id_15;
  ;
  task id_16;
    begin : LABEL_0
      if (1'd0 == -1) begin : LABEL_1
        id_15 <= -1'b0;
      end else id_8 <= |id_2;
    end
  endtask
  wire id_17, id_18, id_19;
  module_0 modCall_1 (
      id_8,
      id_12,
      id_6
  );
  assign modCall_1.id_4 = 0;
endmodule
