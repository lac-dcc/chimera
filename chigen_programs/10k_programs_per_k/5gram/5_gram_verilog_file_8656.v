// Seed: 3276480927
module module_0;
  assign id_1 = "";
  assign module_2.type_3 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_6[1'b0 : 1] = id_2;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = "";
endmodule
module module_2 (
    input tri1 id_0,
    output supply1 id_1,
    output tri1 id_2,
    output uwire id_3,
    input supply1 id_4,
    input wire id_5,
    output wire id_6,
    input tri id_7,
    input supply1 id_8,
    input supply0 id_9
);
  always_ff @(negedge id_9) begin : LABEL_0
    begin : LABEL_0
      id_6 = id_5;
    end
  end
  id_11(
      .id_0(1), .id_1(1'b0), .id_2(1), .id_3(id_3), .id_4(1), .id_5()
  );
  always_latch @(negedge id_0) $display(1);
  assign id_1 = 1;
  module_0 modCall_1 ();
endmodule
