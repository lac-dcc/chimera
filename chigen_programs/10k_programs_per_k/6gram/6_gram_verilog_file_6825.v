// Seed: 1602714248
module module_0 (
    input  uwire id_0,
    input  wand  id_1,
    output tri1  id_2
);
  wire id_4;
  wire id_5;
  assign id_2 = id_1;
  assign module_1.id_4 = 0;
endmodule
module module_1 #(
    parameter id_4 = 32'd95
) (
    output supply0 id_0,
    input  supply1 id_1,
    output logic   id_2
);
  wire _id_4;
  and primCall (id_2, id_5, id_1, id_7, id_6);
  logic [7:0] id_5;
  bit id_6;
  wire id_7;
  always @(posedge 1) begin : LABEL_0
    if (("")) begin : LABEL_1
      id_6 <= (1);
    end else disable id_8;
  end
  always @(posedge id_5 + 1) begin : LABEL_2
    id_2 = id_5[(id_4)];
  end
  module_0 modCall_1 (
      id_1,
      id_1,
      id_0
  );
endmodule
