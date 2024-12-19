// Seed: 781187674
module module_0 (
    input wand id_0,
    input supply0 id_1,
    input wire id_2,
    output tri id_3,
    output supply1 id_4
);
  wire id_6;
  assign module_1.type_2 = 0;
endmodule
module module_1 (
    output logic   id_0,
    input  uwire   id_1,
    input  supply0 id_2,
    output uwire   id_3
);
  assign id_3 = 1 == id_2;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_1,
      id_3,
      id_3
  );
  wand id_5;
  always_ff @(posedge {1{1'd0}}) begin : LABEL_0
    if (1) id_0 <= 1'b0;
    else begin : LABEL_0$display
      ;
      id_3 = 1;
      assign id_0 = id_5 & id_2;
      deassign id_3;
    end
  end
endmodule
