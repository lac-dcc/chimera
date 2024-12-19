// Seed: 578615074
module module_0 ();
  always_ff @(posedge 1) begin : LABEL_0
    disable id_1;
    id_1 <= 1;
  end
  id_2(
      .id_0(), .id_1("" * 1), .id_2(1), .id_3(1)
  );
  wire id_3;
  wire id_4, id_5;
  assign module_1.id_7 = 0;
endmodule
module module_1 (
    output wire id_0,
    input supply0 id_1,
    input supply1 id_2,
    input wire id_3,
    input uwire id_4,
    input supply0 id_5,
    output wand id_6,
    output tri0 id_7
);
  wire id_9;
  assign id_0 = 1;
  wire id_10;
  xor primCall (id_0, id_1, id_10, id_2, id_3, id_4, id_5, id_9);
  module_0 modCall_1 ();
endmodule
