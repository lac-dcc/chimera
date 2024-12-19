// Seed: 522040766
module module_0;
  wand id_1;
  assign id_1 = 1;
  reg id_2 = 1;
  always id_2 <= #id_1 1;
endmodule
module module_1;
  assign id_1 = 1 | id_1;
  id_3(
      .id_0(1'b0), .id_1(1'b0), .id_2(!id_4)
  );
  assign id_4 = id_1;
  wire id_5;
  int  id_6;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  assign id_6 = 1 ? 1'h0 : 1;
endmodule
module module_2 (
    output tri1 id_0
    , id_7,
    input wor id_1,
    output logic id_2,
    input supply0 id_3,
    input supply1 id_4,
    output wire id_5
);
  initial begin : LABEL_0
    wait (~id_1);
    assert (id_4);
    fork
      #1;
      $display(1);
    join
    if ('b0) begin : LABEL_0
      id_2 <= ~(1);
      if (id_3) begin : LABEL_0
        id_7 <= id_7;
      end
      id_0 += 1;
    end
  end
  module_0 modCall_1 ();
  assign modCall_1.type_3 = 0;
endmodule
