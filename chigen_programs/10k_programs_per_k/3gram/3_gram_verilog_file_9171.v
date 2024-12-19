// Seed: 3415732835
module module_0 ();
  tri  id_1;
  wand id_2;
  id_3(
      .id_0(1 && id_2),
      .id_1(~id_1#(
          .id_2(1),
          .id_3(1),
          .id_4("" && 1)
      ) * id_1),
      .id_5(id_2)
  );
  wire id_4;
  wire id_5;
endmodule
module module_1 (
    input logic id_0,
    input tri0  id_1,
    input logic id_2,
    input logic id_3,
    input wire  id_4,
    input logic id_5,
    input wand  id_6
);
  always @(negedge 1) begin : LABEL_0
    id_8 <= id_5;
    id_8 = id_2;
    if (1)
      for (id_8 = id_1; 1'b0 - id_3; id_8 = id_1 - id_0)
      if (id_4) begin : LABEL_0
        id_8 <= 1;
      end else id_8 <= id_0;
    disable id_9;
    id_10(0);
    @(1) begin : LABEL_0
      id_8 <= id_0;
      id_10 = id_5;
      $display(1 & 1, id_5, id_3);
      $display(id_10);
    end
  end
  module_0 modCall_1 ();
  assign modCall_1.type_6 = 0;
endmodule
