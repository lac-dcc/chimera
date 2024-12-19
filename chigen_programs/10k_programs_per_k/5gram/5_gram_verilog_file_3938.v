// Seed: 2372582713
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_5;
  wire id_6;
  wire id_7;
endmodule
module module_1 ();
  always @(id_1) begin : LABEL_0
    if (1) begin : LABEL_0
      #1;
      id_1 = id_1 ? 1 : id_1;
      `define pp_2 0
      wait (1);
      `pp_2 <= `pp_2;
      id_1 = id_1 ~^ 1;
      assume #1  (id_1);
      $display(1);
    end else id_1 <= 1;
  end
  wire id_3;
  wire id_4;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_3,
      id_3
  );
endmodule
