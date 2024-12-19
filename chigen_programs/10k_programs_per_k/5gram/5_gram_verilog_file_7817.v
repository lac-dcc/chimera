// Seed: 3316074327
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  always @(posedge id_2 or posedge 1)
    if (module_0) begin : LABEL_0
      wait (id_5#(
          .id_2(1),
          .id_3("")
      ));
    end
  assign module_1.id_3 = 0;
  wire id_6;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_2 = id_2 ? id_3 : 1 - 1'h0;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_1,
      id_3
  );
endmodule
