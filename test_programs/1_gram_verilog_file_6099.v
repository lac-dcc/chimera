// Seed: 2795002062
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  initial #1 id_3 = id_1;
  localparam id_4 = {id_4[-1], 1'h0, 1, id_2};
  assign id_3 = -1 + 1 + "";
  id_5(
      .id_0(id_1), .id_1(~-1)
  );
  wand id_6, id_7;
  function id_8();
    id_7 = id_2;
  endfunction
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_9;
  wire id_10, id_11, id_12;
  if (id_5) begin : LABEL_0
    id_13(
        id_2
    );
  end
  module_0 modCall_1 (
      id_12,
      id_6,
      id_10
  );
  assign modCall_1.id_1 = 0;
  id_14(
      id_7, -1
  );
  wire id_15;
  parameter real id_16 = (id_6);
endmodule
