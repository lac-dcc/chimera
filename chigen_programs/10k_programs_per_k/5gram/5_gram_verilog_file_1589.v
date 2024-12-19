// Seed: 2354640396
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  input wire id_1;
  wire id_3;
endmodule
module module_1 ();
  always @(~id_1, posedge 1) begin : LABEL_0
    id_1#(
        .id_1(1'b0 == id_1),
        .id_1("" == 1)
    ) = new;
    $display(1'b0);
    id_1 <= id_1.id_1 - 1;
    if (id_1) id_1 <= id_1;
    else begin : LABEL_0
      cover (id_1);
    end
  end
  wire id_2;
  wire id_3;
  module_0 modCall_1 (
      id_3,
      id_2
  );
endmodule
