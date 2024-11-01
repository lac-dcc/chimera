// Seed: 2418457938
module module_0 (
    input tri1 id_0,
    output tri0 id_1,
    input supply1 id_2,
    input wor id_3,
    output wor id_4,
    output wire id_5
);
  wire id_7;
  reg  id_8;
  module_2(
      id_7, id_8, id_8
  );
  task id_9;
    input id_10;
    begin
      release id_9;
      id_8 <= 1;
    end
  endtask
  wire id_11;
endmodule
module module_1 (
    input  uwire   id_0,
    output supply0 id_1,
    output uwire   id_2,
    input  supply1 id_3
);
  wire id_5;
  assign id_2 = id_3;
  module_0(
      id_3, id_2, id_3, id_3, id_2, id_1
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  initial begin
    if (~id_1)
      case (id_2)
        1: id_3 <= 1;
        id_3: id_3 <= 1;
        default: id_3 <= 1;
      endcase
    id_3 = #id_4 id_4;
  end
endmodule
