// Seed: 4217313685
module module_0 (
    input tri1 id_0,
    output supply1 id_1,
    input tri id_2,
    output wire id_3,
    input tri1 id_4
);
  wire id_6;
  always @(1) begin : LABEL_0
    disable id_7;
  end
  assign id_3 = id_2;
endmodule
module module_1 (
    input supply0 id_0,
    output tri id_1,
    input supply0 id_2,
    input wire id_3
);
  wire id_5;
  xnor primCall (id_1, id_6, id_5, id_3);
  wire id_6;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_2,
      id_1,
      id_0
  );
  wire id_7;
endmodule
module module_0 #(
    parameter id_0 = 32'd38
) (
    input supply1 _id_0,
    input uwire id_1,
    input tri0 module_2,
    output tri1 id_3,
    input tri0 id_4,
    output wor id_5,
    output wand id_6,
    inout tri1 id_7,
    output uwire id_8,
    output uwire id_9
);
  wand [id_0 : -1] id_11 = "" - id_1 ? 1 : 1;
  module_0 modCall_1 (
      id_4,
      id_9,
      id_1,
      id_9,
      id_4
  );
  assign modCall_1.id_3 = 0;
  always @(posedge -1) begin : LABEL_0
    release id_8;
    wait (id_3++);
  end
endmodule
