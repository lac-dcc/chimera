// This program was cloned from: https://github.com/HHRB98/UACJ-MIE-Array-multiplier
// License: Apache License 2.0

`include "tt_um_array_multiplier_hhrb98.v"
module array_multiplier_tb;

  // Definir señales de entrada y salida para el testbench
  reg [3:0] a, b;
  wire [7:0] p;

  // Instanciar el módulo array4x4
  array_multiplier dut (
    .a(a),
    .b(b),
    .p(p)
  );

  integer write_data;
  integer i;

  // Establecer el nombre del archivo VCD y las variables a rastrear
  initial begin
    write_data = $fopen("array_tb_output.txt","w");
    $dumpfile("array_tb.vcd");
    $dumpvars(0, array_multiplier_tb);

    // Iniciar la simulación
    $display("Testing array4x4 module");

    // Bucle for para ejecutar múltiples casos de prueba
    for (i = 0; i < 16; i = i + 1) begin
      a = i[3:0];
      b = i[3:0];
      #10; // Esperar 10 unidades de tiempo
      $fdisplay(write_data, "Input: a = %b, b = %b, Output: p = %b", a, b, p);
    end

    // Finalizar simulación
    $finish;
  end

endmodule

