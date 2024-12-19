// Seed: 1166187041
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_1 = id_2;
  module_2 modCall_1 ();
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    output wire id_0,
    input supply0 id_1,
    output logic id_2,
    output supply1 id_3
);
  wire id_5;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_5
  );
  always
    if ((1)) $display(id_1, id_1, 1'b0, 1);
    else id_2 <= id_1 << 1;
endmodule
module module_2;
  reg id_1;
  assign id_1 = 1'b0 ? id_1 * 1 : id_1;
  assign id_1 = ~id_1;
  initial begin : LABEL_0
    id_1 = #1 1 ? 1 : id_1;
  end
endmodule
