// Seed: 4028164740
module module_0 (
    input tri0 id_0,
    input supply1 id_1,
    input supply0 id_2,
    input supply1 id_3,
    output tri0 id_4
);
  id_6(
      .id_0({1{id_2}} - id_2), .id_1(id_2)
  );
  assign module_1.id_11 = 0;
endmodule
module module_1 (
    output logic id_0,
    input tri1 id_1
    , id_10,
    output logic id_2,
    output tri id_3,
    output wand id_4,
    output logic id_5,
    input supply1 id_6,
    input tri1 id_7,
    output wire id_8
);
  wire id_11;
  always @(id_1) begin : LABEL_0
    id_0 <= 1'b0;
  end
  module_0 modCall_1 (
      id_11,
      id_6,
      id_1,
      id_6,
      id_8
  );
  initial begin : LABEL_0
    id_5 <= "";
    if (1)
      assert (id_6);
      else
        #1 begin : LABEL_0
          id_2 <= 1;
          $display(1, id_11, 1, 1, 1, id_7, 1);
        end
  end
endmodule
