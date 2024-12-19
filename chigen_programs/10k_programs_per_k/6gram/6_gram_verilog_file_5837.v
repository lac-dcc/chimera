// Seed: 3362305632
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  supply0 id_9 = 1'd0 == {1 == id_8, id_8};
  always @(posedge 1) begin : LABEL_0
    assign id_6 = 1'b0;
    id_6 = 1;
  end
  assign module_1.id_7 = 0;
endmodule
module module_1 (
    input supply0 id_0,
    input supply1 id_1,
    output tri0 id_2
);
  supply0 id_4, id_5;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4,
      id_4,
      id_4,
      id_4,
      id_5
  );
  wand id_6, id_7;
  assign id_7 = 1;
  specify
    (posedge id_8 => (id_9 +: id_9 + 1)) = (1, id_4);
  endspecify
endmodule
