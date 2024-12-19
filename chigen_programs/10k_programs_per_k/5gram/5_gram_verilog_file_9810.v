// Seed: 3286532476
module module_0;
  wire id_1;
  wire id_2;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_2 = "" ? id_3 : 1;
  function automatic id_4(input id_5, id_6 = id_3, input integer id_7);
    begin : LABEL_0
      assume (1) $display;
      id_1 <= 1;
    end
  endfunction
  wire id_8;
  module_0 modCall_1 ();
  id_9(
      .id_0(id_1), .id_1(1)
  );
endmodule
