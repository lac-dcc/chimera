// Seed: 3574263779
module module_0;
  wire id_1;
endmodule
module module_1 #(
    parameter id_0 = 32'd11
) (
    input tri0 _id_0,
    input uwire id_1,
    input tri0 id_2,
    output logic id_3,
    input supply1 id_4,
    input wand id_5,
    output wor id_6,
    input tri0 id_7,
    output logic id_8,
    output wand id_9
);
  reg [1 : id_0] id_11;
  wire id_12;
  always begin : LABEL_0
    id_8 = id_7;
    id_3 <= id_4 + -1;
    @(posedge id_4 or negedge 1) begin : LABEL_1
      id_11 = 1;
    end
  end
  assign id_11 = -1;
  parameter id_13 = 1;
  and primCall (id_3, id_4, id_5, id_7);
  wire id_14;
  module_0 modCall_1 ();
endmodule
