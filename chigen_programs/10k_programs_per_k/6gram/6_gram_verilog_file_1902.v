// Seed: 2896837404
module module_0 (
    input  tri0 id_0,
    output tri  id_1,
    output wand id_2
);
  initial begin : LABEL_0
    $signed(35);
    ;
    SystemTFIdentifier;
  end
endmodule
module module_1 (
    output uwire id_0,
    input uwire id_1,
    input supply1 id_2,
    output tri0 id_3,
    output wand id_4
);
  assign id_0 = -1;
  module_0 modCall_1 (
      id_2,
      id_3,
      id_4
  );
  assign modCall_1.id_1 = 0;
endmodule
module module_2 #(
    parameter id_0 = 32'd25,
    parameter id_1 = 32'd42,
    parameter id_9 = 32'd90
) (
    input supply1 _id_0,
    input supply0 _id_1,
    output wire id_2,
    input tri0 id_3,
    output wand id_4,
    input tri id_5,
    output logic id_6
);
  bit id_8;
  module_0 modCall_1 (
      id_5,
      id_2,
      id_4
  );
  assign modCall_1.id_0 = 0;
  wire _id_9;
  wire [id_1  ==  id_9 : id_0] id_10;
  always @(posedge "")
    if (1'b0 && 1) begin : LABEL_0
      id_8 <= -1;
      id_6 = -1;
    end
endmodule
