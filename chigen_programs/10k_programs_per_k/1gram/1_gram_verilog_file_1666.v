// Seed: 3550085320
module module_0;
  localparam id_1 = 1;
endmodule
module module_1 #(
    parameter id_3 = 32'd92
) (
    input wire id_0,
    output tri1 id_1,
    input tri id_2,
    input supply1 _id_3,
    output wire id_4
);
  assign id_1 = -1;
  logic id_6 = 1;
  assign id_6 = id_3;
  notif0 primCall (id_1, id_2, id_6);
  module_0 modCall_1 ();
  function void id_7;
    output logic id_8;
    id_4 -= id_2;
  endfunction
  struct {
    logic   id_9;
    logic   id_10[id_3 : 1];
    union packed {
      logic id_11;
      logic id_12;
      logic id_13;
      logic id_14;
      logic id_15;
      logic id_16;
      logic id_17;
    } [(  1  ) : id_3] id_18;
    integer id_19;
  } id_20;
  initial begin
    id_7(id_20);
  end
endmodule
