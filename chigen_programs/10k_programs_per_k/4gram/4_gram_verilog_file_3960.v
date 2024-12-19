// Seed: 516322208
module module_0;
  wire id_2;
  assign id_3 = 1;
endmodule
module module_1 (
    output uwire id_0,
    input  logic id_1,
    output logic id_2,
    input  tri   id_3
);
  always @(1) begin : LABEL_0
    id_2 <= id_1;
    begin : LABEL_0
      id_2 <= id_3 && ~id_3;
      id_0 = ("") == 1;
    end
    #1;
  end
  id_5(
      .id_0(1), .id_1(1'b0)
  );
  wire id_6;
  module_0 modCall_1 ();
  assign modCall_1.id_3 = 0;
  uwire id_7, id_8 = 1;
endmodule
